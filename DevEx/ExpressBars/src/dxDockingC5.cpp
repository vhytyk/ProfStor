//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
USERES("dxDockingC5.res");
USEPACKAGE("vcl50.bpi");
USEPACKAGE("dxThemeC5.bpi");
USEPACKAGE("dxBarC5.bpi");
USEUNIT("dxDockZones.pas");
USEUNIT("dxDockConsts.pas");
USEUNIT("dxDockControl.pas");
USEUNIT("dxDockControlNETView.pas");
USEUNIT("dxDockControlOfficeView.pas");
USEUNIT("dxDockControlXPView.pas");
USEUNIT("dxDockPanel.pas");
USEPACKAGE("cxLibraryVCLC5.bpi");
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
