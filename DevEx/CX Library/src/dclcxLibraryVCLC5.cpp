//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
USERES("dclcxLibraryVCLC5.res");
USEPACKAGE("vcl50.bpi");
USEPACKAGE("cxLibraryVCLC5.bpi");
USEUNIT("cxStyleRepositoryEditor.pas");
USEFORMNS("cxDesignWindows.pas", Cxdesignwindows, cxDesignFormEditor);
USEUNIT("cxClassesReg.pas");
USEUNIT("cxConverterFactory.pas");
USEFORMNS("cxImportDialog.pas", Cximportdialog, cxImportDialogForm);
USEUNIT("cxLibraryReg.pas");
USERES("cxLibraryReg.dcr");
USEUNIT("cxPropEditors.pas");
USEFORMNS("cxPropertiesStoreEditor.pas", Cxpropertiesstoreeditor, frmPropertiesStoreEditor);
USEFORMNS("cxStyleSheetsLoad.pas", Cxstylesheetsload, frmcxStyleSheetsLoad);
USEPACKAGE("dsnide50.bpi");
USEPACKAGE("dxThemeC5.bpi");
//---------------------------------------------------------------------------
#pragma package(smart_init)
//---------------------------------------------------------------------------

//   Package source.
//---------------------------------------------------------------------------

#pragma argsused
int WINAPI DllEntryPoint(HINSTANCE hinst, unsigned long reason, void*)
{
	return 1;
}
//---------------------------------------------------------------------------
