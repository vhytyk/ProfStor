//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
USERES("dcldxDockingC5.res");
USEPACKAGE("vcl50.bpi");
USEUNIT("dxDockReg.pas");
USERES("dxDockReg.dcr");
USEPACKAGE("dsnide50.bpi");
USEPACKAGE("dxDockingC5.bpi");
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
