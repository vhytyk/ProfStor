//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
USERES("dcldxBarExtItemsC5.res");
USEPACKAGE("vcl50.bpi");
USEUNIT("dxBarExtItemsReg.pas");
USEFORMNS("dxBarImageComboEditor.pas", Dxbarimagecomboeditor, dxBarImageComboEditorForm);
USEPACKAGE("dxBarExtItemsC5.bpi");
USEPACKAGE("dsnide50.bpi");
USEPACKAGE("dcldxBarC5.bpi");
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
