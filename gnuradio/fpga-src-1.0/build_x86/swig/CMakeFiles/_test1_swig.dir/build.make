# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/gwe/these/gnuradio/gr-test1

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/gwe/these/gnuradio/gr-test1/build_x86

# Include any dependencies generated for this target.
include swig/CMakeFiles/_test1_swig.dir/depend.make

# Include the progress variables for this target.
include swig/CMakeFiles/_test1_swig.dir/progress.make

# Include the compile flags for this target's objects.
include swig/CMakeFiles/_test1_swig.dir/flags.make

swig/test1_swigPYTHON_wrap.cxx: /usr/local/include/gnuradio/swig/gnuradio.i
swig/test1_swigPYTHON_wrap.cxx: /usr/local/include/gnuradio/swig/gr_extras.i
swig/test1_swigPYTHON_wrap.cxx: /usr/local/include/gnuradio/swig/gr_shared_ptr.i
swig/test1_swigPYTHON_wrap.cxx: /usr/local/include/gnuradio/swig/gnuradio_swig_bug_workaround.h
swig/test1_swigPYTHON_wrap.cxx: ../swig/test1_swig.i
swig/test1_swigPYTHON_wrap.cxx: /usr/local/include/gnuradio/swig/gr_types.i
swig/test1_swigPYTHON_wrap.cxx: swig/test1_swig.tag
swig/test1_swigPYTHON_wrap.cxx: ../swig/test1_swig.i
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gwe/these/gnuradio/gr-test1/build_x86/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Swig source"
	cd /home/gwe/these/gnuradio/gr-test1/build_x86/swig && /usr/bin/cmake -E make_directory /home/gwe/these/gnuradio/gr-test1/build_x86/swig
	cd /home/gwe/these/gnuradio/gr-test1/build_x86/swig && /opt/poky/1.5+snapshot/sysroots/x86_64-pokysdk-linux/usr/bin/swig -python -fvirtual -modern -keyword -w511 -module test1_swig -I/usr/local/include/gnuradio/swig -I/usr/include/python2.7 -I/usr/include/python2.7 -I/home/gwe/these/gnuradio/gr-test1/swig -I/home/gwe/these/gnuradio/gr-test1/build_x86/swig -outdir /home/gwe/these/gnuradio/gr-test1/build_x86/swig -c++ -I/home/gwe/these/gnuradio/gr-test1/lib -I/home/gwe/these/gnuradio/gr-test1/include -I/home/gwe/these/gnuradio/gr-test1/build_x86/lib -I/home/gwe/these/gnuradio/gr-test1/build_x86/include -I/usr/include -I/usr/include -I/usr/local/include -I/usr/local/include/gnuradio/swig -I/usr/include/python2.7 -I/usr/include/python2.7 -I/home/gwe/these/gnuradio/gr-test1/swig -I/home/gwe/these/gnuradio/gr-test1/build_x86/swig -o /home/gwe/these/gnuradio/gr-test1/build_x86/swig/test1_swigPYTHON_wrap.cxx /home/gwe/these/gnuradio/gr-test1/swig/test1_swig.i

swig/test1_swig.py: swig/test1_swigPYTHON_wrap.cxx

swig/test1_swig.tag: swig/test1_swig_doc.i
swig/test1_swig.tag: swig/_test1_swig_swig_tag
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gwe/these/gnuradio/gr-test1/build_x86/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating test1_swig.tag"
	cd /home/gwe/these/gnuradio/gr-test1/build_x86/swig && ./_test1_swig_swig_tag
	cd /home/gwe/these/gnuradio/gr-test1/build_x86/swig && /usr/bin/cmake -E touch /home/gwe/these/gnuradio/gr-test1/build_x86/swig/test1_swig.tag

swig/test1_swig_doc.i: swig/test1_swig_doc_swig_docs/xml/index.xml
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gwe/these/gnuradio/gr-test1/build_x86/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating test1_swig_doc.i"
	cd /home/gwe/these/gnuradio/gr-test1/docs/doxygen && /opt/poky/1.5+snapshot/sysroots/x86_64-pokysdk-linux/usr/bin/python2 -B /home/gwe/these/gnuradio/gr-test1/docs/doxygen/swig_doc.py /home/gwe/these/gnuradio/gr-test1/build_x86/swig/test1_swig_doc_swig_docs/xml /home/gwe/these/gnuradio/gr-test1/build_x86/swig/test1_swig_doc.i

swig/test1_swig_doc_swig_docs/xml/index.xml: swig/_test1_swig_doc_tag
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gwe/these/gnuradio/gr-test1/build_x86/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating doxygen xml for test1_swig_doc docs"
	cd /home/gwe/these/gnuradio/gr-test1/build_x86/swig && ./_test1_swig_doc_tag
	cd /home/gwe/these/gnuradio/gr-test1/build_x86/swig && /usr/bin/doxygen /home/gwe/these/gnuradio/gr-test1/build_x86/swig/test1_swig_doc_swig_docs/Doxyfile

swig/CMakeFiles/_test1_swig.dir/test1_swigPYTHON_wrap.cxx.o: swig/CMakeFiles/_test1_swig.dir/flags.make
swig/CMakeFiles/_test1_swig.dir/test1_swigPYTHON_wrap.cxx.o: swig/test1_swigPYTHON_wrap.cxx
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gwe/these/gnuradio/gr-test1/build_x86/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object swig/CMakeFiles/_test1_swig.dir/test1_swigPYTHON_wrap.cxx.o"
	cd /home/gwe/these/gnuradio/gr-test1/build_x86/swig && /opt/poky/1.5+snapshot/sysroots/x86_64-pokysdk-linux/usr/bin/arm-poky-linux-gnueabi/arm-poky-linux-gnueabi-g++   -march=armv7-a -mthumb-interwork -mfloat-abi=softfp -mfpu=neon --sysroot=/opt/poky/1.5+snapshot/sysroots/armv7a-vfp-neon-poky-linux-gnueabi  $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/_test1_swig.dir/test1_swigPYTHON_wrap.cxx.o -c /home/gwe/these/gnuradio/gr-test1/build_x86/swig/test1_swigPYTHON_wrap.cxx

swig/CMakeFiles/_test1_swig.dir/test1_swigPYTHON_wrap.cxx.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/_test1_swig.dir/test1_swigPYTHON_wrap.cxx.i"
	cd /home/gwe/these/gnuradio/gr-test1/build_x86/swig && /opt/poky/1.5+snapshot/sysroots/x86_64-pokysdk-linux/usr/bin/arm-poky-linux-gnueabi/arm-poky-linux-gnueabi-g++   -march=armv7-a -mthumb-interwork -mfloat-abi=softfp -mfpu=neon --sysroot=/opt/poky/1.5+snapshot/sysroots/armv7a-vfp-neon-poky-linux-gnueabi $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gwe/these/gnuradio/gr-test1/build_x86/swig/test1_swigPYTHON_wrap.cxx > CMakeFiles/_test1_swig.dir/test1_swigPYTHON_wrap.cxx.i

swig/CMakeFiles/_test1_swig.dir/test1_swigPYTHON_wrap.cxx.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/_test1_swig.dir/test1_swigPYTHON_wrap.cxx.s"
	cd /home/gwe/these/gnuradio/gr-test1/build_x86/swig && /opt/poky/1.5+snapshot/sysroots/x86_64-pokysdk-linux/usr/bin/arm-poky-linux-gnueabi/arm-poky-linux-gnueabi-g++   -march=armv7-a -mthumb-interwork -mfloat-abi=softfp -mfpu=neon --sysroot=/opt/poky/1.5+snapshot/sysroots/armv7a-vfp-neon-poky-linux-gnueabi $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gwe/these/gnuradio/gr-test1/build_x86/swig/test1_swigPYTHON_wrap.cxx -o CMakeFiles/_test1_swig.dir/test1_swigPYTHON_wrap.cxx.s

swig/CMakeFiles/_test1_swig.dir/test1_swigPYTHON_wrap.cxx.o.requires:
.PHONY : swig/CMakeFiles/_test1_swig.dir/test1_swigPYTHON_wrap.cxx.o.requires

swig/CMakeFiles/_test1_swig.dir/test1_swigPYTHON_wrap.cxx.o.provides: swig/CMakeFiles/_test1_swig.dir/test1_swigPYTHON_wrap.cxx.o.requires
	$(MAKE) -f swig/CMakeFiles/_test1_swig.dir/build.make swig/CMakeFiles/_test1_swig.dir/test1_swigPYTHON_wrap.cxx.o.provides.build
.PHONY : swig/CMakeFiles/_test1_swig.dir/test1_swigPYTHON_wrap.cxx.o.provides

swig/CMakeFiles/_test1_swig.dir/test1_swigPYTHON_wrap.cxx.o.provides.build: swig/CMakeFiles/_test1_swig.dir/test1_swigPYTHON_wrap.cxx.o

# Object files for target _test1_swig
_test1_swig_OBJECTS = \
"CMakeFiles/_test1_swig.dir/test1_swigPYTHON_wrap.cxx.o"

# External object files for target _test1_swig
_test1_swig_EXTERNAL_OBJECTS =

swig/_test1_swig.so: swig/CMakeFiles/_test1_swig.dir/test1_swigPYTHON_wrap.cxx.o
swig/_test1_swig.so: swig/CMakeFiles/_test1_swig.dir/build.make
swig/_test1_swig.so: /usr/lib/libpython2.7.so
swig/_test1_swig.so: lib/libgnuradio-test1.so
swig/_test1_swig.so: /usr/lib64/libboost_filesystem-mt.so
swig/_test1_swig.so: /usr/lib64/libboost_system-mt.so
swig/_test1_swig.so: /usr/local/lib/libgnuradio-runtime.so
swig/_test1_swig.so: swig/CMakeFiles/_test1_swig.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared module _test1_swig.so"
	cd /home/gwe/these/gnuradio/gr-test1/build_x86/swig && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/_test1_swig.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
swig/CMakeFiles/_test1_swig.dir/build: swig/_test1_swig.so
.PHONY : swig/CMakeFiles/_test1_swig.dir/build

swig/CMakeFiles/_test1_swig.dir/requires: swig/CMakeFiles/_test1_swig.dir/test1_swigPYTHON_wrap.cxx.o.requires
.PHONY : swig/CMakeFiles/_test1_swig.dir/requires

swig/CMakeFiles/_test1_swig.dir/clean:
	cd /home/gwe/these/gnuradio/gr-test1/build_x86/swig && $(CMAKE_COMMAND) -P CMakeFiles/_test1_swig.dir/cmake_clean.cmake
.PHONY : swig/CMakeFiles/_test1_swig.dir/clean

swig/CMakeFiles/_test1_swig.dir/depend: swig/test1_swigPYTHON_wrap.cxx
swig/CMakeFiles/_test1_swig.dir/depend: swig/test1_swig.py
swig/CMakeFiles/_test1_swig.dir/depend: swig/test1_swig.tag
swig/CMakeFiles/_test1_swig.dir/depend: swig/test1_swig_doc.i
swig/CMakeFiles/_test1_swig.dir/depend: swig/test1_swig_doc_swig_docs/xml/index.xml
	cd /home/gwe/these/gnuradio/gr-test1/build_x86 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/gwe/these/gnuradio/gr-test1 /home/gwe/these/gnuradio/gr-test1/swig /home/gwe/these/gnuradio/gr-test1/build_x86 /home/gwe/these/gnuradio/gr-test1/build_x86/swig /home/gwe/these/gnuradio/gr-test1/build_x86/swig/CMakeFiles/_test1_swig.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : swig/CMakeFiles/_test1_swig.dir/depend

