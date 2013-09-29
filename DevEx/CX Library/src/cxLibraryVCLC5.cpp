//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
USERES("cxLibraryVCLC5.res");
USEPACKAGE("vcl50.bpi");
USEUNIT("cxCustomConverter.pas");
USEUNIT("cxGraphics.pas");
USEUNIT("cxLibraryStrs.pas");
USEUNIT("cxLookAndFeelPainters.pas");
USEUNIT("cxLookAndFeels.pas");
USEUNIT("cxPropertiesStore.pas");
USEUNIT("cxScrollBar.pas");
USEUNIT("cxStorage.pas");
USEUNIT("cxStyles.pas");
USEFORMNS("cxStyleSheetEditor.pas", Cxstylesheeteditor, frmcxStyleSheetEditor);
USEUNIT("cxClasses.pas");
USEUNIT("cxContainer.pas");
USEUNIT("cxControls.pas");
USEUNIT("cxConverterUtils.pas");
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
