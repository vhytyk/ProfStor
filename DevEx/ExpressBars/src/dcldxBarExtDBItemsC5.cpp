//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
USERES("dcldxBarExtDBItemsC5.res");
USEPACKAGE("vcl50.bpi");
USEUNIT("dxBarExtDBItemsReg.pas");
USEPACKAGE("dxBarExtDBItemsC5.bpi");
USEPACKAGE("dsnide50.bpi");
USEPACKAGE("vcldb50.bpi");
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
