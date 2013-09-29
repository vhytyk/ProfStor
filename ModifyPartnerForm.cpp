//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "ModifyPartnerForm.h"
#include "Partner.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxButtonEdit"
#pragma link "cxButtons"
#pragma link "cxCalc"
#pragma link "cxContainer"
#pragma link "cxControls"
#pragma link "cxDropDownEdit"
#pragma link "cxEdit"
#pragma link "cxLookAndFeelPainters"
#pragma link "cxMaskEdit"
#pragma link "cxTextEdit"
#pragma link "cxMemo"
#pragma link "cxRadioGroup"
#pragma resource "*.dfm"
TModifyPartner *ModifyPartner;
//---------------------------------------------------------------------------
__fastcall TModifyPartner::TModifyPartner(TComponent* Owner, TPartner * Partner)
   : TForm(Owner)
{
   this->Partner = Partner;
   DataToForm();
   if(!Partner->ID_Partner)
   {
       Label2->Font->Color = clRed;
       Label2->Caption = "(Новый партнер)";
   }
   switch (this->Partner->PartnerType)
   {
      case ptPokupec:
        RadioButtonPokupec->Checked = true;
        RadioButtonPostach->Enabled = false;
        RadioButtonRashod->Enabled = false;
      break;
      case ptPostach:
        RadioButtonPostach->Checked = true;
        RadioButtonPokupec->Enabled = false;
        RadioButtonRashod->Enabled = false;
      break;
      case ptRashod:
        RadioButtonPokupec->Enabled = false;
        RadioButtonPostach->Enabled = false;
        RadioButtonRashod->Checked = true;
      break;
   }
}
//---------------------------------------------------------------------------
void __fastcall TModifyPartner::DataToForm()
{
   Label2->Caption = IntToStr(Partner->ID_Partner);
   EditNazva->Text = Partner->NamePartner;
   MemoInfo->Text = Partner->Info;
   switch (Partner->PartnerType)
   {
      case ptPostach:
         RadioButtonPostach->Checked = true;
      break;
      case ptPokupec:
         RadioButtonPokupec->Checked = true;
      break;
   }
}
//---------------------------------------------------------------------------
void __fastcall TModifyPartner::ButtonSaveClick(TObject &Sender)
{
   Partner->NamePartner = EditNazva->Text;
   Partner->Info = MemoInfo->Text;
   if(RadioButtonPostach->Checked)
      Partner->PartnerType = ptPostach;
   else if(RadioButtonPokupec->Checked)
      Partner->PartnerType = ptPokupec;
   else
      Partner->PartnerType = ptRashod;

   Partner->Save();
   Close();
}
//---------------------------------------------------------------------------
void __fastcall TModifyPartner::ButtonCancelClick(TObject &Sender)
{
   if(Partner)
      delete Partner;
   Close();
}
//---------------------------------------------------------------------------

