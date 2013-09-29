//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "AktPrihodList.h"
#include "AktPrihod.h"
#include "DocPrihod.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "UFrameList"
#pragma resource "*.dfm"
TAktPrihodListForm *AktPrihodListForm;
//---------------------------------------------------------------------------
__fastcall TAktPrihodListForm::TAktPrihodListForm(TComponent* Owner)
   : TForm(Owner)
{
       FrameList1->Query = CreateQuery(this,
         "select p.nomer, p.datadok, p.id_partner, pt.namepartner, sum(kilxkist*cina) as suma "
         "from prihod p, partner pt "
         "where p.id_partner = pt.id_partner "
         "group by p.nomer, p.datadok, p.id_partner, pt.namepartner "
         "order by p.datadok desc "
         , true);
   Refresh();
}
//---------------------------------------------------------------------------
void __fastcall TAktPrihodListForm::Refresh()
{
   FrameList1->Refresh("nomer");
   SetDisplayLabels(FrameList1->Query, FrameList1->GridView1->DataController,
   "Номер   ,Дата   ,false, Покупатель  , Сумма  ");
}
//---------------------------------------------------------------------------
void __fastcall TAktPrihodListForm::ButtonModifyClick(TObject &Sender)
{
   TDocPrihod * d = new TDocPrihod(FrameList1->Query->FieldByName("nomer")->AsInteger);
   TPrihodForm * pf = new TPrihodForm(this, d);
   pf->cxButton1->Enabled = false;
   pf->ShowModal();
   Refresh();
   delete d;
   delete pf;
}
//---------------------------------------------------------------------------
void __fastcall TAktPrihodListForm::ButtonDeleteClick(TObject &Sender)
{
   TDocPrihod * d = new TDocPrihod(FrameList1->Query->FieldByName("nomer")->AsInteger);
   d->Delete();
   Refresh();
   delete d;
}
//---------------------------------------------------------------------------


void __fastcall TAktPrihodListForm::editSearchKeyUp(TObject *Sender,
      WORD &Key, TShiftState Shift)
{
   AnsiString filter = "";
   if(!editSearch->Text.IsEmpty())
   {
      filter = "and p.nomer in (select nomer from prihod where id_tovar in( select id_tovar from tovar where kod="+editSearch->Text+")) ";

   }
    FrameList1->Query = CreateQuery(this,
         "select p.nomer, p.datadok, p.id_partner, pt.namepartner, sum(kilxkist*cina) as suma "
         "from prihod p, partner pt "
         "where p.id_partner = pt.id_partner " + filter +
         "group by p.nomer, p.datadok, p.id_partner, pt.namepartner "
         "order by p.datadok desc "
         , true);
   Refresh();
}
//---------------------------------------------------------------------------

