//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
USERES("dxBarExtItemsC5.res");
USEPACKAGE("vcl50.bpi");
USEUNIT("dxBarExtItems.pas");
USEPACKAGE("dxBarC5.bpi");
USEPACKAGE("dxComnC5.bpi");
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
