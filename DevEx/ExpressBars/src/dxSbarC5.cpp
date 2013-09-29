//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
USERES("dxSbarC5.res");
USEPACKAGE("vcl50.bpi");
USEUNIT("dxsbstrs.pas");
USEUNIT("dxreginf.pas");
USEUNIT("dxsbarcs.pas");
USEUNIT("dximctrl.pas");
USEUNIT("dxsbar.pas");
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
