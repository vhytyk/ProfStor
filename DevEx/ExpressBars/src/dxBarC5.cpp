//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
USERES("dxBarC5.res");
USEPACKAGE("vcl50.bpi");
USEUNIT("dxBar.pas");
USEFORMNS("dxBarAddGroupItemsEd.pas", Dxbaraddgroupitemsed, frmAddGroupItems);
USEUNIT("dxBarCommon.pas");
USEFORMNS("dxBarItemEd.pas", Dxbaritemed, dxBarItemAddEditor);
USEFORMNS("dxBarNameEd.pas", Dxbarnameed, dxBarNameEd);
USEFORMNS("dxBarPopupMenuEd.pas", Dxbarpopupmenued, dxBarSubMenuEditor);
USEUNIT("dxBarStrs.pas");
USEUNIT("dxStatusBar.pas");
USEPACKAGE("cxLibraryVCLC5.bpi");
USEPACKAGE("dxComnC5.bpi");
USEPACKAGE("dxThemeC5.bpi");
USEFORMNS("dxBarCustForm.pas", Dxbarcustform, dxBarCustomizingForm);
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
