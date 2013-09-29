//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
USERES("dxBarExtDBItemsC5.res");
USEPACKAGE("vcl50.bpi");
USEUNIT("dxBarExtDBItems.pas");
USEPACKAGE("dxComnC5.bpi");
USEPACKAGE("dxBarC5.bpi");
USEPACKAGE("Vcldb50.bpi");
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
