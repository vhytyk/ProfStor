//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
         
#include "TovarList.h"
#include "UUtiliteFunctions.h"
#include "TModifyTovarForm.h"
#include "TTovar.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "UFrameList"
#pragma link "cxContainer"
#pragma link "cxControls"
#pragma link "cxEdit"
#pragma link "cxLabel"
#pragma link "cxTextEdit"
#pragma resource "*.dfm"
TTovarListForm *TovarListForm;
//---------------------------------------------------------------------------
__fastcall TTovarListForm::TTovarListForm(TComponent* Owner)
   : TForm(Owner)
{
   FrameList1->Query = CreateQuery(this,
   "select id_tovar, kod, nametovar, partner.namepartner, g.name as groupname, cinazakup, cinaprodazh, ostatok from "
   " Tovar t, Partner p, Groups g where t.id_partner=p.id_partner and g.id_group=t.id_group order by kod ", true);
   Refresh();
}
//---------------------------------------------------------------------------

void __fastcall TTovarListForm::ButtonInsertClick(TObject &Sender)
{
   TModifyTovarForm * ModifyTovarForm = new TModifyTovarForm
               (this, new TTovar(0));
   ModifyTovarForm->ShowModal();
   delete ModifyTovarForm;
   Refresh();   
}
//---------------------------------------------------------------------------

void __fastcall TTovarListForm::ButtonModifyClick(TObject &Sender)
{
   TModifyTovarForm * ModifyTovarForm = new TModifyTovarForm
               (this, new TTovar(FrameList1->Query->FieldByName("id_tovar")->AsInteger));
   ModifyTovarForm->ShowModal();
   delete ModifyTovarForm;
   Refresh();   
}
//---------------------------------------------------------------------------

void __fastcall TTovarListForm::ButtonDeleteClick(TObject &Sender)
{
   TTovar * t = new TTovar(FrameList1->Query->FieldByName("id_tovar")->AsInteger);
   t->Delete();
   delete t;
   Refresh();   
}
//---------------------------------------------------------------------------
void __fastcall TTovarListForm::Refresh()
{
   FrameList1->Refresh("id_tovar");
   SetDisplayLabels(FrameList1->Query, FrameList1->GridView1->DataController,
   "false, Код   ,Название   ,Поставщик,Група,Цена закуп. , Цена прод. , Остаток ");
}
//---------------------------------------------------------------------------
TTovar * __fastcall TTovarListForm::GetSelectedItem()
{
   return FSelectedItem;
}
//---------------------------------------------------------------------------
void __fastcall TTovarListForm::FrameList1GridView1DblClick(
      TObject *Sender)
{
   FSelectedItem = new TTovar(FrameList1->Query->FieldByName("id_tovar")->AsInteger);
   Close(); 
}
//---------------------------------------------------------------------------

void __fastcall TTovarListForm::FormKeyPress(TObject *Sender, char &Key)
{
   switch(Key)
   {
      case VK_RETURN:
         FrameList1GridView1DblClick(Sender);
      break;
      case VK_INSERT:
         FrameList1GridView1DblClick(Sender);
      break;
   }   
}
//---------------------------------------------------------------------------

void __fastcall TTovarListForm::FormShow(TObject *Sender)
{
   cxTextEdit1->SetFocus();
}
//---------------------------------------------------------------------------
void __fastcall TTovarListForm::cxTextEdit1PropertiesChange(
      TObject *Sender)
{
   FrameList1->Query->Locate("kod",cxTextEdit1->Text,
         TLocateOptions()<<loPartialKey<<loCaseInsensitive);
}
//---------------------------------------------------------------------------

void __fastcall TTovarListForm::cxTextEdit2PropertiesChange(
      TObject *Sender)
{
   FrameList1->Query->Locate("nametovar",cxTextEdit2->Text,
         TLocateOptions()<<loPartialKey<<loCaseInsensitive);
}
//---------------------------------------------------------------------------


