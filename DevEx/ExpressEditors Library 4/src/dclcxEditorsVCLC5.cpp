//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
USERES("dclcxEditorsVCLC5.res");
USEPACKAGE("vcl50.bpi");
USEUNIT("cxEditPropEditors.pas");
USEUNIT("cxEditReg.pas");
USERES("cxEditReg.dcr");
USEUNIT("cxEditRepositoryEditor.pas");
USEUNIT("cxFilterControlReg.pas");
USERES("cxFilterControlReg.dcr");
USEUNIT("cxMaskEditTextEditor.pas");
USEFORMNS("cxSelectEditRepositoryItem.pas", Cxselecteditrepositoryitem, cxSelectRepositoryItem);
USEPACKAGE("cxEditorsVCLC5.bpi");
USEPACKAGE("dsnide50.bpi");
USEPACKAGE("dcldb50.bpi");
USEPACKAGE("Vcldb50.bpi");
USEPACKAGE("Vclx50.bpi");
USEPACKAGE("dclcxLibraryVCLC5.bpi");
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