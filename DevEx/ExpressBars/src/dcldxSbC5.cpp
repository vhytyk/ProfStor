//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
USERES("dcldxSbC5.res");
USEPACKAGE("vcl50.bpi");
USEUNIT("dximcted.pas");
USEUNIT("dxsbared.pas");
USEUNIT("dxsbreg.pas");
USERES("dxsbreg.dcr");
USEFORMNS("dxsbrgre.pas", Dxsbrgre, frmSideBarGroupRename);
USEFORMNS("dxsbrsed.pas", Dxsbrsed, frmSideBarStoreEditor);
USEFORMNS("dxsppred.pas", Dxsppred, frmSpinImagePropEditor);
USEPACKAGE("dxComnC5.bpi");
USEPACKAGE("dxSbarC5.bpi");
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
