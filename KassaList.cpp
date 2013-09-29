//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "KassaList.h"
#include "UUtiliteFunctions.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "UFrameList"
#pragma link "cxContainer"
#pragma link "cxControls"
#pragma link "cxDBEdit"
#pragma link "cxEdit"
#pragma link "cxMemo"
#pragma link "cxTextEdit"
#pragma resource "*.dfm"
TKassaFormList *KassaFormList;
//---------------------------------------------------------------------------
__fastcall TKassaFormList::TKassaFormList(TComponent* Owner)
   : TForm(Owner)
{
   FrameList1->Query = CreateQuery(this,
      " select k.id_kassa,k.comment, p.namepartner, k.data , k.nomerdok, t.name, k.suma from Kassa k, typekassa t, partner p "
      " where k.id_partner = p.id_partner and k.typedok = t.id_typekassa"
      " order by k.id_kassa desc ",
      true);
   Refresh();
}
//---------------------------------------------------------------------------
void __fastcall TKassaFormList::Refresh()
{
   FrameList1->Refresh("id_kassa");
   SetDisplayLabels(FrameList1->Query,
         FrameList1->GridView1->DataController, "false,false,Партнер,  Дата  ,№ документа ,Тип движения , Сумма ");
}
//---------------------------------------------------------------------------
void __fastcall TKassaFormList::ButtonDeleteClick(TObject &Sender)
{
   DeleteFromTable("kassa",FrameList1->Query->FieldByName("id_kassa")->AsInteger,true);
   Refresh();
}
//---------------------------------------------------------------------------
