//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
USERES("dxGDIPlusC5.res");
USEPACKAGE("vcl50.bpi");
USEUNIT("dxGDIPlusAPI.pas");
USEUNIT("dxGDIPlusClasses.pas");
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
