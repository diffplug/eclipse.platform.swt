# Makefile for module 'swt'

# (c) Copyright IBM Corp., 2000, 2001
# All Rights Reserved.
#
# Autogenerated Code

# The major and minor version numbers and the build numbers are
# returned by the DllGetVersion call so the os can query the swt
# version number

APPVER=5.0
!include <win32.mak>

maj_ver=2
min_ver=014
bld_num=0

pgm_ver_str="SWT $(maj_ver).$(min_ver) for Windows"
timestamp_str=__DATE__\" \"__TIME__\" (EST)\"
copyright = "Copyright (C) IBM Corporation 1999, 2000.  All rights reserved."

# assumes JAVA_HOME is set in the environment from which nmake is run

DLLPREFIX=swt
OSPREFIX=win32
DLLNAME=$(DLLPREFIX)-$(OSPREFIX)-$(maj_ver)$(min_ver).dll

LIBNAME=swt# declaration

LINK_LIBS = ole32.lib comctl32.lib user32.lib gdi32.lib comdlg32.lib kernel32.lib shell32.lib oleaut32.lib advapi32.lib imm32.lib winspool.lib

# note: thoroughly test all examples after changing any optimization flags
cflags =  -c -W3 -G6 -GD -O1 -DSWT_LIBRARY_VERSION=$(maj_ver)$(min_ver) -DSWT_LIBRARY_BUILD_NUM=$(bld_num) -nologo -D_X86_=1 -D_WIN32 -D_WIN95 -D_WIN32_WINDOWS=0x0400 -D_MT -MT -DWIN32 -D_WIN32_DCOM /I$(JAVA_HOME)\include /I.
# no optimizations
#cflags = -c -W3 -G6 -GD -Odi -DSWT_LIBRARY_VERSION=$(maj_ver)$(min_ver) -DSWT_LIBRARY_BUILD_NUM=$(bld_num) -nologo -D_X86_=1 -D_WIN32 -D_WIN95 -D_WIN32_WINDOWS=0x0400 -D_MT -MT -DWIN32 /I..\include /I$(JAVA_HOME)\include /I$(JAVA_HOME)\include\win32

linkflags = /INCREMENTAL:NO /PDB:NONE /RELEASE /NOLOGO -entry:_DllMainCRTStartup@12 -dll /BASE:0x10000000 /comment:$(pgm_ver_str) /comment:$(copyright) /DLL

SWTOBJS = swt.obj swtole.obj structs.obj callback.obj globals.obj library.obj

all: $(SWTOBJS) \
	 $(DLLPREFIX)

$(DLLPREFIX): $(SWTOBJS)

$(DLLPREFIX): swt.res $(DLLPREFIX).obj
	echo $(LINK_LIBS) >templrf
	echo $(linkflags) >>templrf
	echo swt.res >>templrf
	echo -machine:IX86 >>templrf
	echo -subsystem:windows >>templrf
	echo -out:$(DLLNAME) >>templrf
	echo $(SWTOBJS) >>templrf
	link @templrf
	del templrf

clean:
    del *.obj
    del *.res
    del *.dll
    del *.exp

.c.obj:
	cl $(cflags) $*.c

.rc.res:
   rc -r -fo swt.res swt.rc
   

