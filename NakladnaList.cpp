//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "NakladnaList.h"
#include "Nakladna.h"
#include "DocRashod.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "UFrameList"
#pragma resource "*.dfm"
TNakladnaListForm *NakladnaListForm;
//---------------------------------------------------------------------------
__fastcall TNakladnaListForm::TNakladnaListForm(TComponent* Owner)
   : TForm(Owner)
{
   FrameList1->Query = CreateQuery(this,
   "select r.nomer, r.datadok, r.id_partner, p.namepartner, sum(kilxkist*cina*1) as suma from rashod r, partner p "
   "where r.id_partner = p.id_partner "
   "group by r.nomer, r.datadok, r.id_partner, p.namepartner "
   "order by r.datadok desc "
      , true);
   Refresh();
}
//---------------------------------------------------------------------------
void __fastcall TNakladnaListForm::Refresh()
{
   FrameList1->Refresh("nomer");
   SetDisplayLabels(FrameList1->Query, FrameList1->GridView1->DataController,
   "Номер   ,Дата   ,false, Покупатель  , Сумма  ");

}
//---------------------------------------------------------------------------
void __fastcall TNakladnaListForm::ButtonModifyClick(TObject &Sender)
{
   TDocRashod * d = new TDocRashod(FrameList1->Query->FieldByName("nomer")->AsInteger);
   TNakladnaForm * nf = new TNakladnaForm(this, d);
   nf->cxButton1->Enabled = false;
   nf->ShowModal();
   Refresh();
   delete d;
   delete nf;
}
//---------------------------------------------------------------------------
  /* TODO :
1.Зробити для списку накладної вилучення (через клас TDocRashod)
2.Зробити список приходу
3. Касса */
void __fastcall TNakladnaListForm::ButtonDeleteClick(TObject &Sender)
{
   TDocRashod * d = new TDocRashod(FrameList1->Query->FieldByName("nomer")->AsInteger);
   d->Delete();
   Refresh();
   delete d;
}
//---------------------------------------------------------------------------
void __fastcall TNakladnaListForm::editSearchKeyUp(TObject *Sender,
      WORD &Key, TShiftState Shift)
{
 AnsiString filter = "";
   if(!editSearch->Text.IsEmpty())
   {
      filter = "and r.nomer in (select nomer from rashod where id_tovar in( select id_tovar from tovar where kod="+editSearch->Text+")) ";

   }
    FrameList1->Query = CreateQuery(this,
   "select r.nomer, r.datadok, r.id_partner, p.namepartner, sum(kilxkist*cina*1) as suma from rashod r, partner p "
   "where r.id_partner = p.id_partner "+filter+
   "group by r.nomer, r.datadok, r.id_partner, p.namepartner "
   "order by r.datadok desc "
      , true);
   Refresh();
}
//---------------------------------------------------------------------------

