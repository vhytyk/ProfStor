//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "TModifyTovarForm.h"
#include "TTovar.h"
#include "PartnerList.h"
#include "GroupsList.h"
#include "Partner.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxButtonEdit"
#pragma link "cxButtons"
#pragma link "cxContainer"
#pragma link "cxControls"
#pragma link "cxCurrencyEdit"
#pragma link "cxEdit"
#pragma link "cxLookAndFeelPainters"
#pragma link "cxMaskEdit"
#pragma link "cxTextEdit"
#pragma link "cxCalc"
#pragma link "cxDropDownEdit"
#pragma resource "*.dfm"
TModifyTovarForm *ModifyTovarForm;
//---------------------------------------------------------------------------
__fastcall TModifyTovarForm::TModifyTovarForm(TComponent* Owner, TTovar * Tovar)
   : TForm(Owner)
{
   tag=0;
   this->Tovar = Tovar;
   DataToForm();
/*   if(!Tovar->ID_Tovar)
       Label2->Caption = "(����� �����)";*/
}
//---------------------------------------------------------------------------
void __fastcall TModifyTovarForm::DataToForm()
{
   EditKod->Text = IntToStr(Tovar->KOD);
   if(Tovar->Partner)
      EditPartner->Text = Tovar->Partner->NamePartner;
   EditCinaZakup->Value = FloatToCurr(Tovar->CinaZakup);
   EditCinaProdazh->Value = FloatToCurr(Tovar->CinaProdazh);
   EditNazva->Text = Tovar->NameTovar;
   if(Tovar->Group)
      EditGroup->Text = Tovar->Group->Name;
}
//---------------------------------------------------------------------------

void __fastcall TModifyTovarForm::ButtonSaveClick(TObject &Sender)
{
   Tovar->CinaZakup = double(EditCinaZakup->Value);
   Tovar->KOD = StrToInt(EditKod->Text);
   Tovar->CinaProdazh = double(EditCinaProdazh->Value);
   Tovar->NameTovar = EditNazva->Text;
   Tovar->Save();
   Close();
}
//---------------------------------------------------------------------------

void __fastcall TModifyTovarForm::ButtonCancelClick(TObject &Sender)
{
   if(Tovar)
      delete Tovar;
   Close();
}
//---------------------------------------------------------------------------

void __fastcall TModifyTovarForm::EditPartnerPropertiesButtonClick(
      TObject *Sender, int AButtonIndex)
{
   //
   TPartnerListForm * pf = new TPartnerListForm(this, ptPostach);
   pf->ShowModal();
   if(pf->SelectedItem)
   {
      Tovar->Partner = pf->SelectedItem;
      Tovar->ID_Partner = pf->SelectedItem->ID_Partner;
      EditPartner->Text = Tovar->Partner->NamePartner;
   }
   delete pf;
}
//---------------------------------------------------------------------------

void __fastcall TModifyTovarForm::cxButton1Click(TObject &Sender)
{
   int result = -1;
   TIBQuery * q = CreateQuery(0, "select max(kod)+1 as newcode from tovar", true);
   if(!q->FieldByName("newcode")->IsNull)
      result = q->FieldByName("newcode")->AsInteger;
   EditKod->Text = IntToStr(result);
   delete q;
}
//---------------------------------------------------------------------------


void __fastcall TModifyTovarForm::EditKodKeyDown(TObject *Sender,
      WORD &Key, TShiftState Shift)
{
   if(Key == VK_DOWN)
      EditNazva->SetFocus();
   if(Key == VK_UP)
      EditCinaProdazh->SetFocus();
}
//---------------------------------------------------------------------------

void __fastcall TModifyTovarForm::EditNazvaKeyDown(TObject *Sender,
      WORD &Key, TShiftState Shift)
{
   if(Key == VK_DOWN)
      EditPartner->SetFocus();
   if(Key == VK_UP)
      EditKod->SetFocus();
}
//---------------------------------------------------------------------------
    void __fastcall TModifyTovarForm::EditGroupKeyDown(TObject *Sender,
      WORD &Key, TShiftState Shift)
{
   if(Key == VK_DOWN)
      EditCinaProdazh->SetFocus();
   if(Key == VK_UP)
      EditPartner->SetFocus();

}
//---------------------------------------------------------------------------

void __fastcall TModifyTovarForm::EditPartnerKeyDown(TObject *Sender,
      WORD &Key, TShiftState Shift)
{
   if(Key == VK_DOWN)
      EditGroup->SetFocus();
   if(Key == VK_UP)
      EditNazva->SetFocus();

}

//---------------------------------------------------------------------------

void __fastcall TModifyTovarForm::EditCinaZakupKeyDown(TObject *Sender,
      WORD &Key, TShiftState Shift)
{
   if(Key == VK_DOWN)
      EditCinaProdazh->SetFocus();
   if(Key == VK_UP)
      EditGroup->SetFocus();
}
//---------------------------------------------------------------------------

void __fastcall TModifyTovarForm::EditCinaProdazhKeyDown(TObject *Sender,
      WORD &Key, TShiftState Shift)
{
   if(Key == VK_DOWN)
      EditKod->SetFocus();
   if(Key == VK_UP)
      EditCinaZakup->SetFocus();
}
//---------------------------------------------------------------------------





void __fastcall TModifyTovarForm::FormKeyPress(TObject *Sender, char &Key)
{
   if(Key == VK_RETURN)
      ButtonSaveClick(*Sender);
   if(Key == VK_ESCAPE)
      ButtonCancelClick(*Sender);   
}
//---------------------------------------------------------------------------

void __fastcall TModifyTovarForm::EditGrupaPropertiesButtonClick(
      TObject *Sender, int AButtonIndex)
{
 //
   TGroupsFormList * pf = new TGroupsFormList(this,true);
   pf->ShowModal();
   if(pf->SelectedItem)
   {
      Tovar->Group = pf->SelectedItem;
      Tovar->ID_Group = pf->SelectedItem->ID_Group;
      EditGroup->Text = Tovar->Group->Name;
   }
   delete pf;
}
//---------------------------------------------------------------------------


