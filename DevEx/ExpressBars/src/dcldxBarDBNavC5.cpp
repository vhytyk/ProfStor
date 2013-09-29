//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
USERES("dcldxBarDBNavC5.res");
USEPACKAGE("vcl50.bpi");
USEFORMNS("dxBarDBCheckLinksEd.pas", Dxbardbchecklinksed, dxBarDBCheckLinksEditor);
USEUNIT("dxBarDBNavReg.pas");
USERES("dxBarDBNavReg.dcr");
USEPACKAGE("dxBarDBNavC5.bpi");
USEPACKAGE("dxBarC5.bpi");
USEPACKAGE("dsnide50.bpi");
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
