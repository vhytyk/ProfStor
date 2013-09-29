//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
USERES("dcldxBarC5.res");
USEPACKAGE("vcl50.bpi");
USEUNIT("dxStatusBarReg.pas");
USEFORMNS("dxStatusIndicatorEditor.pas", Dxstatusindicatoreditor, dxStatusBarIndicatorEditor);
USEUNIT("dxBarConverter.pas");
USERES("dxBarConverter.dcr");
USEUNIT("dxBarReg.pas");
USERES("dxBarReg.dcr");
USEPACKAGE("dxComnC5.bpi");
USEPACKAGE("dxBarC5.bpi");
USEPACKAGE("dsnide50.bpi");
USEPACKAGE("Vclx50.bpi");
USEPACKAGE("dclcxLibraryVCLC5.bpi");
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
