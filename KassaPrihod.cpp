//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "KassaPrihod.h"
#include "Kassa.h"
#include "Partner.h"
#include "PartnerList.h"
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
#pragma link "cxClasses"
#pragma link "cxCustomData"
#pragma link "cxData"
#pragma link "cxDataStorage"
#pragma link "cxDBData"
#pragma link "cxFilter"
#pragma link "cxGraphics"
#pragma link "cxGrid"
#pragma link "cxGridCustomTableView"
#pragma link "cxGridCustomView"
#pragma link "cxGridDBTableView"
#pragma link "cxGridLevel"
#pragma link "cxGridTableView"
#pragma link "cxStyles"
#pragma link "UFrameList"
#pragma link "cxCalc"
#pragma link "cxMemo"
#pragma resource "*.dfm"
TKassaPrihodForm *KassaPrihodForm;
//---------------------------------------------------------------------------
__fastcall TKassaPrihodForm::TKassaPrihodForm(TComponent* Owner, TKassa * kassa)
   : TDocumentForm(Owner)
{
   Kassa = kassa;
   DocToForm();
   Refresh();
}
//---------------------------------------------------------------------------
void __fastcall TKassaPrihodForm::Refresh()
{

}
//---------------------------------------------------------------------------
void __fastcall TKassaPrihodForm::DocToForm()
{
   EditDate->Date = Kassa->Data;
   EditPartner->Text = Kassa->Partner->NamePartner;
}
//---------------------------------------------------------------------------
void __fastcall TKassaPrihodForm::cxButton1Click(TObject &Sender)
{
   float suma = EditSuma->Value;

   if(suma>0)
   {
     TKassa * k = new TKassa(0);
     k->Suma = suma;
     k->NomerDok = -1;
     k->TypeDok = tdRashod;
     k->ID_Partner = Kassa->ID_Partner;
     k->Data = Kassa->Data;
     k->Comment = Memo1->Text;
     k->Save();
     delete k;
   }
   Close();
}
//---------------------------------------------------------------------------
void __fastcall TKassaPrihodForm::EditPartnerPropertiesButtonClick(
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
void __fastcall TKassaPrihodForm::EditDatePropertiesCloseUp(
      TObject *Sender)
{
   Kassa->Data = EditDate->Date;   
}
//---------------------------------------------------------------------------


