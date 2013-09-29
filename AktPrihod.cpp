//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "AktPrihod.h"
#include "DocPrihod.h"
#include "PartnerList.h"
#include "Partner.h"
#include "Prihod.h"
#include "TovarList.h"
#include "TTovar.h"
#include "Kassa.h"
#include "SumaPropysom.h"
#include "FReport.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxButtonEdit"
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
#pragma link "Nakladna"
#pragma link "UFrameList"
#pragma link "Nakladna"
#pragma link "cxCalc"
#pragma link "FR_Class"
#pragma link "FR_DBSet"
#pragma link "FR_DSet"
#pragma resource "*.dfm"
TPrihodForm *PrihodForm;
//---------------------------------------------------------------------------
__fastcall TPrihodForm::TPrihodForm(TComponent* Owner, TDocPrihod * doc)
   : TDocumentForm(Owner)
{
   Report = new TFReport();
   Document = doc;
   DocToForm();
   FrameList1->Query = CreateQuery(this, 
         "select p.id_prihod, p.id_tovar,t.kod, t.nametovar,p.kilxkist, p.cina "
         " from Tovar t, Prihod p "
         " where p.nomer = "+IntToStr(Document->Nomer)+
         " and p.id_tovar = t.id_tovar"
         ,true);
   FrameList1->Query->Name = "PrihodDS";
   Refresh();
}
//---------------------------------------------------------------------------
void __fastcall TPrihodForm::EditPartnerPropertiesButtonClick(
      TObject *Sender, int AButtonIndex)
{
   //
   TPartnerListForm * pf = new TPartnerListForm(this, ptPostach);
   pf->ShowModal();
   if(pf->SelectedItem)
   {
      Document->Partner = pf->SelectedItem;
      EditPartner->Text = Document->Partner->NamePartner;
   }
   delete pf;
}
//---------------------------------------------------------------------------
void __fastcall TPrihodForm::Refresh()
{
   FrameList1->Refresh("id_prihod");
   SetDisplayLabels(FrameList1->Query, FrameList1->GridView1->DataController,
   "false,false, Код   ,Название   ,Количество ,Цена ");
   Document->Fill(Document->Nomer);
   Label2->Caption = FormatFloat("0.00",Document->Suma);
   Document->DataDok = EditDate->Date;

   if(FrameList1->Query->RecordCount)
   {
      EditDate->Enabled = false;
      EditPartner->Enabled = false;
   }
   else
   {
      EditDate->Enabled = true;
      EditPartner->Enabled = true;
   }

}
//---------------------------------------------------------------------------
void __fastcall TPrihodForm::DocToForm()
{
   LabelNomer->Caption = IntToStr(Document->Nomer);
   EditDate->Date = Document->DataDok;
   EditPartner->Text = Document->Partner->NamePartner;
   if(Document->Partner->ID_Partner)
   {
      EditSuma->Enabled = false;
      cxButton4->Enabled = false;
   }   
}
//---------------------------------------------------------------------------
void __fastcall TPrihodForm::ButtonInsertClick(TObject &Sender)
{
   if(!Document->Partner->ID_Partner)
   {
      ShowMessage("введите поставщика");
      return;
   }

   TTovarListForm * tlf = new TTovarListForm(this);
   tlf->ShowModal();
   if(!tlf->SelectedItem)
      return;
   TTovar * t = tlf->SelectedItem;
   
   TPrihod * p;
   Refresh();
   if(FrameList1->Query->Locate("id_tovar", t->ID_Tovar, TLocateOptions()<<loCaseInsensitive<<loPartialKey ))
      p = new TPrihod(FrameList1->Query->FieldByName("id_prihod")->AsInteger);
   else
      p = new TPrihod(0);
   p->ID_Tovar = t->ID_Tovar;
   p->ID_Partner = Document->Partner->ID_Partner;
   p->Nomer = Document->Nomer;
   p->DataDok = Document->DataDok;
   p->Cina = t->CinaZakup;
   float Kilxkist = 0;
   try
   {
      Kilxkist = StrToFloat(InputBox("введите количество:","Количество:", "1"));
   }
   catch ( ... )
   {
      ShowMessage("введено неправильное количество!");
   }
   if(Kilxkist <= 0)
   {
      ShowMessage("количество не может быть нулевым или минусовым");
      delete p;
      delete t;
      delete tlf;
      return;
   }
   t->ID_Partner = Document->Partner->ID_Partner;
   t->Save();

   p->Kilxkist += Kilxkist;
   p->Save();
   delete p;
   delete t;
   delete tlf;
   Refresh();
   FrameList1->Query->Last();   
}
//---------------------------------------------------------------------------

void __fastcall TPrihodForm::ButtonModifyClick(TObject &Sender)
{
   if(!Document->Partner->ID_Partner)
   {
      ShowMessage("введите поставщика");
      return;
   }
   TPrihod * p = new TPrihod(FrameList1->Query->FieldByName("id_prihod")->AsInteger);
   TTovar * t = new TTovar(p->ID_Tovar);
   float Kilxkist = 0;
   try
   {
      Kilxkist = StrToFloat(InputBox("введите количество:","Количество:", "1"));
   }
   catch ( ... )
   {
      ShowMessage("введено неправильное количество!");
   }
   if(Kilxkist <= 0)
   {
      ShowMessage("количество не может быть нулевым или минусовым");
      delete p;
      delete t;
      return;
   }   
   p->Kilxkist = Kilxkist;
   p->Save();
   delete p;
   delete t;
   Refresh();
}
//---------------------------------------------------------------------------

void __fastcall TPrihodForm::ButtonDeleteClick(TObject &Sender)
{
   TPrihod * p = new TPrihod(FrameList1->Query->FieldByName("id_prihod")->AsInteger);
   p->Delete();
   delete p;
   Refresh();
}
//---------------------------------------------------------------------------

void __fastcall TPrihodForm::cxButton1Click(TObject &Sender)
{
   TKassa * k = new TKassa(0);
   k->NomerDok = Document->Nomer;
   k->ID_Partner = Document->Partner->ID_Partner;
   k->Data = Document->DataDok;

   k->TypeDok = tdPrihod;
   k->Suma = EditSuma->Value;
   if(k->Suma > 0)
      k->Save();

   delete k;
   cxButton3Click(Sender);
   Close();
}
//---------------------------------------------------------------------------

void __fastcall TPrihodForm::cxButton4Click(TObject &Sender)
{
   EditSuma->Value = Document->Suma;      
}
//---------------------------------------------------------------------------

void __fastcall TPrihodForm::FormKeyPress(TObject *Sender, char &Key)
{
   switch(Key)
   {
      case VK_RETURN:
         ButtonInsertClick(*Sender);
      break;
      case VK_INSERT:
         ButtonInsertClick(*Sender);
      break;
   }   
}
//---------------------------------------------------------------------------

void __fastcall TPrihodForm::EditDatePropertiesChange(TObject *Sender)
{
   Document->DataDok = EditDate->Date;
}
//---------------------------------------------------------------------------

void __fastcall TPrihodForm::EditDateKeyPress(TObject *Sender, char &Key)
{
   switch(Key)
   {
      case VK_RETURN:
         ButtonInsertClick(*Sender);
      break;
      case VK_INSERT:
         ButtonInsertClick(*Sender);
      break;
   }   
}
//---------------------------------------------------------------------------

void __fastcall TPrihodForm::cxButton3MouseDown(TObject *Sender,
      TMouseButton Button, TShiftState Shift, int X, int Y)
{
   if(Button == mbRight)
   {
      Report->Vars["Prihod.Nomer"] = Document->Nomer;
      Report->Vars["Prihod.Pokupec"] = Document->Partner->NamePartner;
      Report->Vars["Prihod.Suma"] = Document->Suma;
      Report->Vars["Prihod.Data"] = Document->DataDok;
      TSumaPropysom * SumaPropysom;
      Report->Vars["Prihod.SumaPropisom"] = SumaPropysom->Propys(Document->Suma);
      Report->FileBlank = "aktprihod.frf";
      Report->frReport = this->frReport1;
      Report->LoadBlankFromFile();
      frReport1->DesignReport();
   }
}
//---------------------------------------------------------------------------

void __fastcall TPrihodForm::cxButton3Click(TObject &Sender)
{
   FrameList1->Query->DisableControls();
   Report->Vars["Prihod.Nomer"] = Document->Nomer;
   Report->Vars["Prihod.Pokupec"] = Document->Partner->NamePartner;
   Report->Vars["Prihod.Suma"] = Document->Suma;
   Report->Vars["Prihod.Data"] = Document->DataDok;
   TSumaPropysom * SumaPropysom;
   Report->Vars["Prihod.SumaPropisom"] = SumaPropysom->Propys(Document->Suma);
   Report->FileBlank = "aktprihod.frf";
   Report->frReport = this->frReport1;
   Report->LoadBlankFromFile();
   frReport1->ShowReport();
   FrameList1->Query->EnableControls();

}
//---------------------------------------------------------------------------

void __fastcall TPrihodForm::frReport1GetValue(const AnsiString ParName,
      Variant &ParValue)
{
   ParValue = Report->Vars[ParName];
}
//---------------------------------------------------------------------------

void __fastcall TPrihodForm::FormKeyDown(TObject *Sender, WORD &Key,
      TShiftState Shift)
{
   if(Shift.Contains(ssCtrl))
      if(Key == 'p' || Key == 'P' || Key == 'з' || Key == 'З' )
        cxButton3Click(*Sender);
   if(Key == VK_F2)
   {
      if(!Document->Partner->ID_Partner)
      {
         ShowMessage("введите покупателя");
         return;
      }
      TPrihod * r = new TPrihod(FrameList1->Query->FieldByName("id_prihod")->AsInteger);
      TTovar * t = new TTovar(r->ID_Tovar,Document->Partner->ID_Partner);
      float Cina = r->Cina;
      try
      {
         Cina = StrToFloat(InputBox("введите цену:","Цена:", FormatFloat("0.00",r->Cina)));
      }
      catch ( ... )
      {
         ShowMessage("введена неправильная цена!");
         delete r;
         delete t;
         return;
      }

      r->Cina = Cina;
      r->Save();
      delete r;
      delete t;
      Refresh();
   }
}
//---------------------------------------------------------------------------

