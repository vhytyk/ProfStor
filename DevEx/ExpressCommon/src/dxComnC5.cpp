//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
USERES("dxComnC5.res");
USEPACKAGE("vcl50.bpi");
USEFORMNS("dxrgkeya.pas", Dxrgkeya, frmdxAddNewRegKey);
USEUNIT("dxCommon.pas");
USEFORMNS("dxreged.pas", Dxreged, frmdxLibREgPathEditor);
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
