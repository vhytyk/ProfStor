# ---------------------------------------------------------------------------
!if !$d(BCB)
BCB = $(MAKEDIR)\..
!endif

# ---------------------------------------------------------------------------
# IDE SECTION
# ---------------------------------------------------------------------------
# The following section of the project makefile is managed by the BCB IDE.
# It is recommended to use the IDE to change any of the values in this
# section.
# ---------------------------------------------------------------------------

VERSION = BCB.06.00
# ---------------------------------------------------------------------------
PROJECT = ..\bin\cb6\cxEditorsVCLC6.bpl
OBJFILES = ..\bin\cb6\cxEditorsVCLC6.obj ..\bin\cb6\cxEditPaintUtils.obj \
    ..\bin\cb6\cxEditRegisteredRepositoryItems.obj \
    ..\bin\cb6\cxEditTextUtils.obj ..\bin\cb6\cxEditUtils.obj \
    ..\bin\cb6\cxFormats.obj ..\bin\cb6\cxHyperLinkEdit.obj \
    ..\bin\cb6\cxImage.obj ..\bin\cb6\cxImageComboBox.obj \
    ..\bin\cb6\cxLookupDBGrid.obj ..\bin\cb6\cxLookupEdit.obj \
    ..\bin\cb6\cxLookupGrid.obj ..\bin\cb6\cxMaskEdit.obj \
    ..\bin\cb6\cxMemo.obj ..\bin\cb6\cxMRUEdit.obj ..\bin\cb6\cxNavigator.obj \
    ..\bin\cb6\cxRegExpr.obj ..\bin\cb6\cxSpinEdit.obj \
    ..\bin\cb6\cxTimeEdit.obj ..\bin\cb6\cxBlobEdit.obj \
    ..\bin\cb6\cxButtonEdit.obj ..\bin\cb6\cxButtons.obj ..\bin\cb6\cxCalc.obj \
    ..\bin\cb6\cxCalendar.obj ..\bin\cb6\cxCheckBox.obj \
    ..\bin\cb6\cxCurrencyEdit.obj ..\bin\cb6\cxDateUtils.obj \
    ..\bin\cb6\cxDBEdit.obj ..\bin\cb6\cxDBEditRepository.obj \
    ..\bin\cb6\cxDBLookupEdit.obj ..\bin\cb6\cxDropDownEdit.obj \
    ..\bin\cb6\cxEdit.obj ..\bin\cb6\cxEditConsts.obj \
    ..\bin\cb6\cxEditDataRegisteredRepositoryItems.obj \
    ..\bin\cb6\cxEditDBRegisteredRepositoryItems.obj \
    ..\bin\cb6\cxPropertiesConverters.obj ..\bin\cb6\cxRadioGroup.obj \
    ..\bin\cb6\cxStandardMask.obj ..\bin\cb6\cxTextEdit.obj \
    ..\bin\cb6\cxDBFilterControl.obj ..\bin\cb6\cxDBLookupComboBox.obj \
    ..\bin\cb6\cxDBNavigator.obj ..\bin\cb6\cxEditMaskEditor.obj \
    ..\bin\cb6\cxExtEditRepositoryItems.obj ..\bin\cb6\cxFilterControl.obj \
    ..\bin\cb6\cxFilterControlDialog.obj ..\bin\cb6\cxFilterControlStrs.obj \
    ..\bin\cb6\cxFilterControlUtils.obj ..\bin\cb6\cxListBox.obj
RESFILES = cxEditorsVCLC6.res
MAINSOURCE = cxEditorsVCLC6.cpp
RESDEPEN = $(RESFILES)
LIBFILES = 
IDLFILES = 
IDLGENFILES = 
LIBRARIES = 
PACKAGES = rtl.bpi vcl.bpi dbrtl.bpi vcldb.bpi vcljpg.bpi cxDataC6.bpi \
    cxLibraryVCLC6.bpi dxThemeC6.bpi
SPARELIBS = rtl.lib
DEFFILE = 
OTHERFILES = 
# ---------------------------------------------------------------------------
DEBUGLIBPATH = $(BCB)\lib\debug
RELEASELIBPATH = $(BCB)\lib\release
USERDEFINES = 
SYSDEFINES = _RTLDLL;NO_STRICT;USEPACKAGES
INCLUDEPATH = $(BCB)\include;$(BCB)\include\vcl
LIBPATH = "..\..\CX Library\bin\cb6";..\..\expressdatacontroller\bin\cb6;"..\..\xp theme manager\bin\cb6";..\bin\cb6;$(BCB)\lib\obj;$(BCB)\lib
WARNINGS= -w-par
PATHCPP = .;
PATHASM = .;
PATHPAS = .;
PATHRC = .;
PATHOBJ = .;$(LIBPATH)
# ---------------------------------------------------------------------------
CFLAG1 = -O2 -H=c:\cb6\lib\vcl60.csm -Hc -Vx -Ve -X- -a8 -b -k- -vi -c -tWM
IDLCFLAGS = -I$(BCB)\include -I$(BCB)\include\vcl -src_suffix cpp -boa
PFLAGS = -N2..\bin\cb6 -N0..\bin\cb6 -$Y- -$L- -$D- -$A8 -v -JPHNE -M
RFLAGS = 
AFLAGS = /mx /w2 /zn
LFLAGS = -l"C:\DevEx\ExpressEditors Library 4\bin\cb6" -I..\bin\cb6 \
    -D"ExpressEditors Library 4 (VCL Edition) by Developer Express Inc." -aa \
    -Tpp -Gpr -x -Gn -Gl -Gi
# ---------------------------------------------------------------------------
ALLOBJ = c0pkg32.obj $(PACKAGES) Memmgr.Lib sysinit.obj $(OBJFILES)
ALLRES = $(RESFILES)
ALLLIB = $(LIBFILES) $(LIBRARIES) import32.lib cp32mti.lib
# ---------------------------------------------------------------------------
!ifdef IDEOPTIONS

[Version Info]
IncludeVerInfo=0
AutoIncBuild=0
MajorVer=1
MinorVer=0
Release=0
Build=0
Debug=0
PreRelease=0
Special=0
Private=0
DLL=0

[Version Info Keys]
CompanyName=
FileDescription=
FileVersion=1.0.0.0
InternalName=
LegalCopyright=
LegalTrademarks=
OriginalFilename=
ProductName=
ProductVersion=1.0.0.0
Comments=

[Debugging]
DebugSourceDirs=$(BCB)\source\vcl

!endif





# ---------------------------------------------------------------------------
# MAKE SECTION
# ---------------------------------------------------------------------------
# This section of the project file is not used by the BCB IDE.  It is for
# the benefit of building from the command-line using the MAKE utility.
# ---------------------------------------------------------------------------

.autodepend
# ---------------------------------------------------------------------------
!if "$(USERDEFINES)" != ""
AUSERDEFINES = -d$(USERDEFINES:;= -d)
!else
AUSERDEFINES =
!endif

!if !$d(BCC32)
BCC32 = bcc32
!endif

!if !$d(CPP32)
CPP32 = cpp32
!endif

!if !$d(DCC32)
DCC32 = dcc32
!endif

!if !$d(TASM32)
TASM32 = tasm32
!endif

!if !$d(LINKER)
LINKER = ilink32
!endif

!if !$d(BRCC32)
BRCC32 = brcc32
!endif


# ---------------------------------------------------------------------------
!if $d(PATHCPP)
.PATH.CPP = $(PATHCPP)
.PATH.C   = $(PATHCPP)
!endif

!if $d(PATHPAS)
.PATH.PAS = $(PATHPAS)
!endif

!if $d(PATHASM)
.PATH.ASM = $(PATHASM)
!endif

!if $d(PATHRC)
.PATH.RC  = $(PATHRC)
!endif

!if $d(PATHOBJ)
.PATH.OBJ  = $(PATHOBJ)
!endif
# ---------------------------------------------------------------------------
$(PROJECT): $(OTHERFILES) $(IDLGENFILES) $(OBJFILES) $(RESDEPEN) $(DEFFILE)
    $(BCB)\BIN\$(LINKER) @&&!
    $(LFLAGS) -L$(LIBPATH) +
    $(ALLOBJ), +
    $(PROJECT),, +
    $(ALLLIB), +
    $(DEFFILE), +
    $(ALLRES)
!
# ---------------------------------------------------------------------------
.pas.hpp:
    $(BCB)\BIN\$(DCC32) $(PFLAGS) -U$(INCLUDEPATH) -D$(USERDEFINES);$(SYSDEFINES) -O$(INCLUDEPATH) --BCB {$< }

.pas.obj:
    $(BCB)\BIN\$(DCC32) $(PFLAGS) -U$(INCLUDEPATH) -D$(USERDEFINES);$(SYSDEFINES) -O$(INCLUDEPATH) --BCB {$< }

.cpp.obj:
    $(BCB)\BIN\$(BCC32) $(CFLAG1) $(WARNINGS) -I$(INCLUDEPATH) -D$(USERDEFINES);$(SYSDEFINES) -n$(@D) {$< }

.c.obj:
    $(BCB)\BIN\$(BCC32) $(CFLAG1) $(WARNINGS) -I$(INCLUDEPATH) -D$(USERDEFINES);$(SYSDEFINES) -n$(@D) {$< }

.c.i:
    $(BCB)\BIN\$(CPP32) $(CFLAG1) $(WARNINGS) -I$(INCLUDEPATH) -D$(USERDEFINES);$(SYSDEFINES) -n. {$< }

.cpp.i:
    $(BCB)\BIN\$(CPP32) $(CFLAG1) $(WARNINGS) -I$(INCLUDEPATH) -D$(USERDEFINES);$(SYSDEFINES) -n. {$< }

.asm.obj:
    $(BCB)\BIN\$(TASM32) $(AFLAGS) -i$(INCLUDEPATH:;= -i) $(AUSERDEFINES) -d$(SYSDEFINES:;= -d) $<, $@

.rc.res:
    $(BCB)\BIN\$(BRCC32) $(RFLAGS) -I$(INCLUDEPATH) -D$(USERDEFINES);$(SYSDEFINES) -fo$@ $<



# ---------------------------------------------------------------------------




