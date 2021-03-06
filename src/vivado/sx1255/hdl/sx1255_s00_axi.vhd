library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity sx1255_s00_axi is
generic (
  C_S_AXI_DATA_WIDTH : integer := 32;
  C_S_AXI_ADDR_WIDTH : integer := 5;
  SPI_DATA_WIDTH : integer := 8
);
port (	
  -- axi lite
  S_AXI_ACLK : in std_logic;
  S_AXI_ARESETN : in std_logic;
  S_AXI_AWADDR : in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
  S_AXI_AWPROT : in std_logic_vector(2 downto 0);
  S_AXI_AWVALID	: in std_logic;
  S_AXI_AWREADY : out std_logic;
  S_AXI_WDATA : in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
  S_AXI_WSTRB : in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
  S_AXI_WVALID : in std_logic;
  S_AXI_WREADY : out std_logic;
  S_AXI_BRESP : out std_logic_vector(1 downto 0);
  S_AXI_BVALID : out std_logic;
  S_AXI_BREADY : in std_logic;
  S_AXI_ARADDR : in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
  S_AXI_ARPROT : in std_logic_vector(2 downto 0);
  S_AXI_ARVALID	: in std_logic;
  S_AXI_ARREADY : out std_logic;
  S_AXI_RDATA : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
  S_AXI_RRESP : out std_logic_vector(1 downto 0);
  S_AXI_RVALID : out std_logic;
  S_AXI_RREADY : in std_logic;
  -- spi
  spi_start : out std_logic;
  spi_busy : in std_logic;
  spi_ps : out std_logic_vector(4 downto 0);
  spi_o : out std_logic_vector(SPI_DATA_WIDTH-1 downto 0);
  spi_i : in std_logic_vector(SPI_DATA_WIDTH-1 downto 0);
  -- i2s
  q : out std_logic;
  i : out std_logic
);
end sx1255_s00_axi;

architecture rtl of sx1255_s00_axi is

signal axi_awaddr : std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
signal axi_awready : std_logic;
signal axi_wready : std_logic;
signal axi_bresp : std_logic_vector(1 downto 0);
signal axi_bvalid : std_logic;
signal axi_araddr : std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
signal axi_arready : std_logic;
signal axi_rdata : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
signal axi_rresp : std_logic_vector(1 downto 0);
signal axi_rvalid : std_logic;

type rd_fsm is (IDLE, SPI_READ, SPI_STATUS, ID);
type wr_fsm is (IDLE, SPI_WRITE, SPI_SPEED, SEND_IQ);
signal read_state : rd_fsm;
signal write_state : wr_fsm;

constant SPI_RW_REG : std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0) := "00000";
constant SPI_STATUS_REG : std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0) := "00100";
constant SPI_SPEED_REG : std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0) := "01000";
constant SEND_IQ_REG : std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0) := "01100";
constant ID_REG : std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0) := "10000";

signal read_s : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
signal axi_rd_req : std_logic;
signal axi_wr_req : std_logic;
signal spi_o_s : std_logic_vector(SPI_DATA_WIDTH-1 downto 0);
signal spi_ps_s : std_logic_vector(4 downto 0);
signal iq_s : std_logic_vector(1 downto 0);

begin
	
  S_AXI_AWREADY	<= axi_awready;
  S_AXI_WREADY <= axi_wready;
  S_AXI_BRESP <= axi_bresp;
  S_AXI_BVALID <= axi_bvalid;
  S_AXI_ARREADY	<= axi_arready;
  S_AXI_RDATA <= axi_rdata;
  axi_rdata <= read_s;
  S_AXI_RRESP <= axi_rresp;
  S_AXI_RVALID <= axi_rvalid;
  axi_wr_req <= axi_wready and S_AXI_WVALID and axi_awready and S_AXI_AWVALID ;
  axi_rd_req <= axi_arready and S_AXI_ARVALID and (not axi_rvalid);	
  
  write_state <=  SPI_WRITE when S_AXI_AWADDR = SPI_RW_REG
    else SPI_SPEED when S_AXI_AWADDR = SPI_SPEED_REG
    else SEND_IQ when S_AXI_AWADDR = SEND_IQ_REG
    else IDLE;
	
  read_state <= SPI_READ when S_AXI_ARADDR = SPI_RW_REG
    else SPI_STATUS when S_AXI_ARADDR = SPI_STATUS_REG
    else ID when S_AXI_ARADDR = ID_REG
    else IDLE;
  
  spi_o <= spi_o_s;
  spi_ps <= spi_ps_s;
  i <= iq_s(1);
  q <= iq_s(0);

axi_wr_p: process(s_axi_aclk, s_axi_aresetn)
begin
  if s_axi_aresetn = '0' then
    spi_start <= '0';
    spi_o_s <= (others => '0');
    spi_ps_s <= "00100";
    iq_s <= (others => '0');
  elsif rising_edge(s_axi_aclk) then
    spi_start <= '0';
    spi_o_s <= spi_o_s;
    spi_ps_s <= spi_ps_s;
    iq_s <= iq_s;
    if axi_wr_req = '1' then
      case write_state is
	WHEN SEND_IQ =>
	  iq_s <= s_axi_wdata(1 downto 0);
	WHEN SPI_WRITE =>
	  spi_start <= '1';
	  spi_o_s <= s_axi_wdata(SPI_DATA_WIDTH-1 downto 0);
	WHEN SPI_SPEED =>
	  spi_ps_s <= s_axi_wdata(4 downto 0);
	WHEN OTHERS =>
      end case;
    end if;
  end if;
end process axi_wr_p;

axi_rd_p: process(s_axi_aclk, s_axi_aresetn)
begin
  if s_axi_aresetn = '0' then
    read_s <= (others => '0');
  elsif rising_edge(s_axi_aclk) then
    read_s <= read_s;
    if axi_rd_req = '1' then
      case read_state is
	WHEN SPI_STATUS =>
	  read_s <= (C_S_AXI_DATA_WIDTH-1 downto 1 => '0')&spi_busy;
	WHEN SPI_READ =>
	  read_s <= (C_S_AXI_DATA_WIDTH-1 downto SPI_DATA_WIDTH => '0')&spi_i;
	WHEN ID =>
	  read_s <= X"43D10000";
	WHEN OTHERS =>
      end case;
    end if;
  end if;
end process axi_rd_p;

awready_p: process (s_axi_aclk, s_axi_aresetn)
begin
  if s_axi_aresetn = '0' then
    axi_awready <= '0';
  elsif rising_edge(s_axi_aclk) then
    if (axi_awready = '0' and S_AXI_AWVALID = '1' and S_AXI_WVALID = '1') then
      axi_awready <= '1';
    else
      axi_awready <= '0';
    end if;
  end if;
end process awready_p;

awaddr_p: process(s_axi_aclk, s_axi_aresetn)
begin
  if s_axi_aresetn = '0' then
    axi_awaddr <= (others => '0');
  elsif rising_edge(s_axi_aclk) then
    axi_awaddr <= axi_awaddr;
    if (axi_awready = '0' and S_AXI_AWVALID = '1' and S_AXI_WVALID = '1') then
      axi_awaddr <= S_AXI_AWADDR;
    end if;
  end if;
end process awaddr_p; 

wready_p: process (s_axi_aclk, s_axi_aresetn)
begin
  if s_axi_aresetn = '0' then
    axi_wready <= '0';
  elsif rising_edge(s_axi_aclk) then
    if (axi_wready = '0' and S_AXI_WVALID = '1' and S_AXI_AWVALID = '1') then
      axi_wready <= '1';
    else
      axi_wready <= '0';
    end if;
  end if;
end process wready_p; 

bresp_p: process (s_axi_aclk, s_axi_aresetn)
begin
  if s_axi_aresetn = '0' then
    axi_bvalid <= '0';
    axi_bresp <= "00";
  elsif rising_edge(s_axi_aclk) then
    if (axi_awready = '1' and S_AXI_AWVALID = '1' and axi_wready = '1' and S_AXI_WVALID = '1' and axi_bvalid = '0') then
      axi_bvalid <= '1';
      axi_bresp  <= "00"; 
    elsif (S_AXI_BREADY = '1' and axi_bvalid = '1') then  
      axi_bvalid <= '0';                           
    end if;
  end if;
end process bresp_p; 

araddr_p: process (s_axi_aclk, s_axi_aresetn)
begin
  if s_axi_aresetn = '0' then
    axi_arready <= '0';
    axi_araddr <= (others => '1');
  elsif rising_edge(s_axi_aclk) then
    if (axi_arready = '0' and S_AXI_ARVALID = '1') then
      axi_arready <= '1';
      axi_araddr  <= S_AXI_ARADDR;           
    else
      axi_araddr <= axi_araddr;
      axi_arready <= '0';
    end if;
  end if;
end process araddr_p; 

rresp_p: process (s_axi_aclk, s_axi_aresetn)
begin
  if s_axi_aresetn = '0' then
    axi_rvalid <= '0';
    axi_rresp <= "00";
  elsif rising_edge(s_axi_aclk) then
    if (axi_arready = '1' and S_AXI_ARVALID = '1' and axi_rvalid = '0') then
      axi_rvalid <= '1';
      axi_rresp  <= "00"; -- 'OK'
    elsif (axi_rvalid = '1' and S_AXI_RREADY = '1') then
      axi_rvalid <= '0';
    end if;            
  end if;
end process rresp_p;

end rtl;
