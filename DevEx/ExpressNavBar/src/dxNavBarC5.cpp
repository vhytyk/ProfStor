//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
USERES("dxNavBarC5.res");
USERES("dxNavBar.res");
USEPACKAGE("vcl50.bpi");
USEUNIT("dxNavBarGraphics.pas");
USEUNIT("dxNavBarOfficeViews.pas");
USEUNIT("dxNavBarStyles.pas");
USEUNIT("dxNavBarViewsFact.pas");
USEUNIT("dxNavBarVSToolBoxViews.pas");
USEUNIT("dxNavBarXPViews.pas");
USEUNIT("dxNavBar.pas");
USEUNIT("dxNavBarBase.pas");
USEUNIT("dxNavBarBaseViews.pas");
USEUNIT("dxNavBarCollns.pas");
USEUNIT("dxNavBarConsts.pas");
USEUNIT("dxNavBarExplorerViews.pas");
USEPACKAGE("dxThemeC5.bpi");
USEPACKAGE("dxGDIPlusC5.bpi");
USEPACKAGE("vcljpg50.bpi");
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
