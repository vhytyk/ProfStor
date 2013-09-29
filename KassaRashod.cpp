//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "KassaRashod.h"
#include "Kassa.h"
#include "Partner.h"
#include "PartnerList.h"
#include "UUtiliteFunctions.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxButtons"
#pragma link "cxCalendar"
#pragma link "cxContainer"
#pragma link "cxControls"
#pragma link "cxDropDownEdit"
#pragma link "cxEdit"
#pragma link "cxLabel"
#pragma link "cxLookAndFeelPainters"
#pragma link "cxMaskEdit"
#pragma link "cxTextEdit"
#pragma link "Document"
#pragma link "cxButtonEdit"
#pragma link "cxCalc"
#pragma link "UFrameList"
#pragma link "cxRadioGroup"
#pragma link "cxMemo"
#pragma resource "*.dfm"
TKassaRashodForm *KassaRashodForm;
//---------------------------------------------------------------------------
__fastcall TKassaRashodForm::TKassaRashodForm(TComponent* Owner, TKassa * kassa)
   : TDocumentForm(Owner)
{
   Kassa = kassa;
   DocToForm();
   Refresh();
}
//---------------------------------------------------------------------------
void __fastcall TKassaRashodForm::Refresh()
{
}
//---------------------------------------------------------------------------
void __fastcall TKassaRashodForm::DocToForm()
{
   EditDate->Date = Kassa->Data;
   EditPartner->Text = Kassa->Partner->NamePartner;
}
//---------------------------------------------------------------------------
void __fastcall TKassaRashodForm::EditPartnerPropertiesButtonClick(
      TObject *Sender, int AButtonIndex)
{
   TPartnerListForm * pf = new TPartnerListForm(this, ptAll);
   pf->ShowModal();
   if(pf->SelectedItem)
   {
      Kassa->Partner = pf->SelectedItem;
      EditPartner->Text = Kassa->Partner->NamePartner;
   }
   delete pf;
   Refresh();
}
//---------------------------------------------------------------------------
void __fastcall TKassaRashodForm::cxButton1Click(TObject &Sender)
{
   float suma = EditSuma->Value;
   if(suma>0)
   {
     TKassa * k = new TKassa(0);
     k->Suma = suma;
     k->NomerDok = -1;
     k->TypeDok = tdPrihod;
     k->ID_Partner = Kassa->ID_Partner;
     k->Data = Kassa->Data;
     k->Comment = Memo1->Text;
     k->Save();
     delete k;
   }
   Close();
}
//---------------------------------------------------------------------------
void __fastcall TKassaRashodForm::EditDatePropertiesCloseUp(
      TObject *Sender)
{
   Kassa->Data = EditDate->Date;   
}
//---------------------------------------------------------------------------

