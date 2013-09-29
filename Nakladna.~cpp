//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Nakladna.h"
#include "DocRashod.h"
#include "PartnerList.h"
#include "Partner.h"
#include "TovarList.h"
#include "TTovar.h"
#include "Rashod.h"
#include "Kassa.h"
#include "SumaPropysom.h"
#include "FReport.h"
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
#pragma link "UFrameList"
#pragma link "cxButtonEdit"
#pragma link "cxCalc"
#pragma link "cxCheckBox"
#pragma link "FR_Class"
#pragma link "FR_Desgn"
#pragma link "FR_DBSet"
#pragma link "FR_DSet"
#pragma link "FR_Class"
#pragma link "FR_DBSet"
#pragma link "FR_DSet"
#pragma link "FR_Desgn"
#pragma link "cxSpinEdit"
#pragma resource "*.dfm"
TNakladnaForm *NakladnaForm;
//---------------------------------------------------------------------------
__fastcall TNakladnaForm::TNakladnaForm(TComponent* Owner, TDocRashod * doc)
   : TDocumentForm(Owner)
{
   Report = new TFReport();
   Document = doc;
   DocToForm();
   FrameList1->Query = CreateQuery(this, 
         "select r.id_rashod, r.id_tovar,t.kod, t.nametovar,r.kilxkist, t.cinaprodazh, r.cina "
         " from Tovar t, Rashod r "
         " where r.nomer = "+IntToStr(Document->Nomer)+
         " and r.id_tovar = t.id_tovar"
         ,true);
   FrameList1->Query->Name = "NakDS";
   TRashod * r = new TRashod(FrameList1->Query->FieldByName("id_rashod")->AsInteger);
   TTovar * t = new TTovar(r->ID_Tovar,Document->Partner->ID_Partner);
   if(t->CinaProdazh != 0)
        cxSpinEditProcent->Value = Round(((t->CinaProdazh - r->Cina)/t->CinaProdazh)*100,0);
   delete r;
   delete t;
   Refresh();

}
//---------------------------------------------------------------------------
void __fastcall TNakladnaForm::DocToForm(void)
{
   LabelNomer->Caption = IntToStr(Document->Nomer);
   EditDate->Date = Document->DataDok;
   EditPartner->Text = Document->Partner->NamePartner;
   if(Document->Partner->ID_Partner)
   {
      EditSuma->Enabled = false;
      EditSuma->Value = TKassa::GetOplataNakladna(Document->Nomer,
         Document->Partner->ID_Partner);

      cxButton4->Enabled = false;
   }

}
//---------------------------------------------------------------------------
void __fastcall TNakladnaForm::ButtonEditPostachPropertiesButtonClick(
      TObject *Sender, int AButtonIndex)
{
   //
   TPartnerListForm * pf = new TPartnerListForm(this, ptPokupec);
   pf->ShowModal();
   if(pf->SelectedItem)
   {
      Document->Partner = pf->SelectedItem;
      EditPartner->Text = Document->Partner->NamePartner;
   }
   delete pf;
}
//---------------------------------------------------------------------------
void __fastcall TNakladnaForm::Refresh()
{
   FrameList1->Refresh("id_rashod");
   SetDisplayLabels(FrameList1->Query, FrameList1->GridView1->DataController,
   "false,false, Код   ,Название   ,Количество ,Цена продажи,Цена со скидкой");
   Document->Fill(Document->Nomer);
   Label2->Caption = FormatFloat("0.00",Document->Suma);
   Document->DataDok = EditDate->Date;

   if(FrameList1->Query->RecordCount)
   {
      EditDate->Enabled = false;
      EditPartner->Enabled = false;
      ButtonKlient->Enabled = false;
      cxSpinEditProcent->Enabled = false;
   }
   else
   {
      EditDate->Enabled = true;
      EditPartner->Enabled = true;
      ButtonKlient->Enabled = true;
      cxSpinEditProcent->Enabled = true;
   }
}
//---------------------------------------------------------------------------
void __fastcall TNakladnaForm::ButtonInsertClick(TObject &Sender)
{
   if(!Document->Partner->ID_Partner)
   {
      ShowMessage("введите покупателя");
      return;
   }
   TTovarListForm * tlf = new TTovarListForm(this);
   tlf->ShowModal();
   if(!tlf->SelectedItem)
      return;
   TTovar * t = new TTovar(tlf->SelectedItem->ID_Tovar, Document->Partner->ID_Partner);
   if(!t->CinaProdazh)
   {
      delete t;
      t = tlf->SelectedItem;
   }

   TRashod * r;
   Refresh();
   if(FrameList1->Query->Locate("id_tovar", t->ID_Tovar, TLocateOptions()<<loCaseInsensitive<<loPartialKey ))
      r = new TRashod(FrameList1->Query->FieldByName("id_rashod")->AsInteger);
   else
      r = new TRashod(0);
   r->ID_Tovar = t->ID_Tovar;
   r->ID_Partner = Document->Partner->ID_Partner;
   r->Nomer = Document->Nomer;
   r->DataDok = Document->DataDok;
   float procent = cxSpinEditProcent->Value;
//   if(procent > 0)
      r->Cina = t->CinaProdazh-(t->CinaProdazh*(procent/(100+procent)));
//   else
//      r->Cina = t->CinaProdazh;
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
      delete r;
      delete t;
      return;
   }
   
   r->Kilxkist += Kilxkist;
   if(t->Ostatok < Kilxkist)
      ShowMessage("столько количества товара нету на складе");
   else
      r->Save();
   delete r;
   delete t;
   delete tlf;
   Refresh();
   FrameList1->Query->Last();
}
//---------------------------------------------------------------------------

void __fastcall TNakladnaForm::ButtonModifyClick(TObject &Sender)
{
   if(!Document->Partner->ID_Partner)
   {
      ShowMessage("введите покупателя");
      return;
   }
   TRashod * r = new TRashod(FrameList1->Query->FieldByName("id_rashod")->AsInteger);
   TTovar * t = new TTovar(r->ID_Tovar,Document->Partner->ID_Partner);
   float Kilxkist = 0;
   try
   {
      Kilxkist = StrToFloat(InputBox("введите количество:","Количество:", FloatToStr(r->Kilxkist)));
   }
   catch ( ... )
   {
      ShowMessage("введено неправильное количество!");
   }
   r->Kilxkist = Kilxkist;
   r->Cina = t->CinaProdazh;
   if(Kilxkist <= 0)
   {
      ShowMessage("количество не может быть нулевым или минусовым");
      delete r;
      delete t;
      return;
   }
   if(t->Ostatok < Kilxkist)
      ShowMessage("столько количества товара нету на складе");
   else
      r->Save();
   delete r;
   delete t;
   Refresh();
}
//---------------------------------------------------------------------------
void __fastcall TNakladnaForm::ButtonDeleteClick(TObject &Sender)
{
//
   TRashod * r = new TRashod(FrameList1->Query->FieldByName("id_rashod")->AsInteger);
   r->Delete();
   delete r;
   Refresh();
}
//---------------------------------------------------------------------------
void __fastcall TNakladnaForm::cxButton4Click(TObject &Sender)
{
   EditSuma->Value = Document->Suma;   
}
//---------------------------------------------------------------------------
void __fastcall TNakladnaForm::cxButton1Click(TObject &Sender)
{
   TKassa * k = new TKassa(0);
   k->Suma = EditSuma->Value;
   k->NomerDok = Document->Nomer;
   k->TypeDok = tdRashod;
   k->ID_Partner = Document->Partner->ID_Partner;
   k->Data = Document->DataDok;
   if(k->Suma > 0 && EditSuma->Enabled)
      k->Save();
   delete k;
   cxButton3Click(Sender); 
   Close();
}
//---------------------------------------------------------------------------
void __fastcall TNakladnaForm::FormKeyPress(TObject *Sender, char &Key)
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
void __fastcall TNakladnaForm::EditDatePropertiesChange(TObject *Sender)
{
   Document->DataDok = EditDate->Date;
}
//---------------------------------------------------------------------------

void __fastcall TNakladnaForm::cxButton3MouseDown(TObject *Sender,
      TMouseButton Button, TShiftState Shift, int X, int Y)
{
   if(Button == mbRight)
   {
      Report->Vars["Nakladna.Nomer"] = Document->Nomer;
      Report->Vars["Nakladna.Pokupec"] = Document->Partner->NamePartner;
      Report->Vars["Nakladna.Suma"] = Document->Suma;
      Report->Vars["Nakladna.Data"] = Document->DataDok;
      float sumaOplata;
      sumaOplata = EditSuma->Value;
      Report->Vars["Nakladna.SumaOplata"] = sumaOplata;
      TSumaPropysom * SumaPropysom;
      Report->Vars["Nakladna.SumaPropisom"] = SumaPropysom->Propys(Document->Suma);
      Report->Vars["Nakladna.Saldo"] = TPartner::GetSaldo(Document->Partner->ID_Partner);
      Report->FileBlank = "nakladna.frf";
      Report->frReport = this->frReport1;
      Report->LoadBlankFromFile();
      frReport1->DesignReport();
   }
}
//---------------------------------------------------------------------------
void __fastcall TNakladnaForm::cxButton3Click(TObject &Sender)
{
   FrameList1->Query->DisableControls();
   Report->Vars["Nakladna.Nomer"] = Document->Nomer;
   Report->Vars["Nakladna.Pokupec"] = Document->Partner->NamePartner;
   Report->Vars["Nakladna.Suma"] = Document->Suma;
   Report->Vars["Nakladna.Data"] = Document->DataDok;
   float s = EditSuma->Value;
   Report->Vars["Nakladna.SumaOplata"] = s;
   TSumaPropysom * SumaPropysom;
   Report->Vars["Nakladna.SumaPropisom"] = SumaPropysom->Propys(Document->Suma);
   Report->Vars["Nakladna.Saldo"] = TPartner::GetSaldo(Document->Partner->ID_Partner);
   Report->FileBlank = "nakladna.frf";
   Report->frReport = this->frReport1;
   Report->LoadBlankFromFile();
   frReport1->ShowReport();
   FrameList1->Query->EnableControls();
}
//---------------------------------------------------------------------------

void __fastcall TNakladnaForm::frReport1GetValue(const AnsiString ParName,
      Variant &ParValue)
{
   ParValue = Report->Vars[ParName];
}
//---------------------------------------------------------------------------

void __fastcall TNakladnaForm::FormKeyDown(TObject *Sender, WORD &Key,
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
      TRashod * r = new TRashod(FrameList1->Query->FieldByName("id_rashod")->AsInteger);
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

void __fastcall TNakladnaForm::ButtonKlientClick(TObject &Sender)
{
   TPartner * pf = new TPartner(64);
   if(pf)
   {
      Document->Partner = pf;
      EditPartner->Text = Document->Partner->NamePartner;
   }
   FrameList1->cxGrid1->SetFocus();
}
//---------------------------------------------------------------------------

void __fastcall TNakladnaForm::FormDestroy(TObject *Sender)
{
   if(Report)
      delete Report;
}
//---------------------------------------------------------------------------

void __fastcall TNakladnaForm::cxButton2Click(TObject &Sender)
{
   FrameList1->Query->DisableControls();
   Report->Vars["Nakladna.Nomer"] = Document->Nomer;
   Report->Vars["Nakladna.Pokupec"] = Document->Partner->NamePartner;
   Report->Vars["Nakladna.Suma"] = Document->Suma;
   Report->Vars["Nakladna.Data"] = Document->DataDok;
   float s = EditSuma->Value;
   Report->Vars["Nakladna.SumaOplata"] = s;
   TSumaPropysom * SumaPropysom;
   Report->Vars["Nakladna.SumaPropisom"] = SumaPropysom->Propys(Document->Suma);
   Report->Vars["Nakladna.Saldo"] = TPartner::GetSaldo(Document->Partner->ID_Partner);
   Report->FileBlank = "nakladna_skidka.frf";
   Report->frReport = this->frReport1;
   Report->LoadBlankFromFile();
   frReport1->ShowReport();
   FrameList1->Query->EnableControls();   
}
//---------------------------------------------------------------------------

void __fastcall TNakladnaForm::cxButton2MouseDown(TObject *Sender,
      TMouseButton Button, TShiftState Shift, int X, int Y)
{
   if(Button == mbRight)
   {
      Report->Vars["Nakladna.Nomer"] = Document->Nomer;
      Report->Vars["Nakladna.Pokupec"] = Document->Partner->NamePartner;
      Report->Vars["Nakladna.Suma"] = Document->Suma;
      Report->Vars["Nakladna.Data"] = Document->DataDok;
      float sumaOplata;
      sumaOplata = EditSuma->Value;
      Report->Vars["Nakladna.SumaOplata"] = sumaOplata;
      TSumaPropysom * SumaPropysom;
      Report->Vars["Nakladna.SumaPropisom"] = SumaPropysom->Propys(Document->Suma);
      Report->Vars["Nakladna.Saldo"] = TPartner::GetSaldo(Document->Partner->ID_Partner);
      Report->FileBlank = "nakladna_skidka.frf";
      Report->frReport = this->frReport1;
      Report->LoadBlankFromFile();
      frReport1->DesignReport();
   }
}
//---------------------------------------------------------------------------

void __fastcall TNakladnaForm::cxButton5Click(TObject &Sender)
{
   FrameList1->Query->DisableControls();
   Report->Vars["Nakladna.Nomer"] = Document->Nomer;
   Report->Vars["Nakladna.Pokupec"] = Document->Partner->NamePartner;
   Report->Vars["Nakladna.Suma"] = Document->Suma;
   Report->Vars["Nakladna.Data"] = Document->DataDok;
   float s = EditSuma->Value;
   Report->Vars["Nakladna.SumaOplata"] = s;
   TSumaPropysom * SumaPropysom;
   Report->Vars["Nakladna.SumaPropisom"] = SumaPropysom->Propys(Document->Suma);
   Report->Vars["Nakladna.Saldo"] = TPartner::GetSaldo(Document->Partner->ID_Partner);
   Report->FileBlank = "nakladna_podatok.frf";
   Report->frReport = this->frReport1;
   Report->LoadBlankFromFile();
   frReport1->ShowReport();
   FrameList1->Query->EnableControls();

}
//---------------------------------------------------------------------------

void __fastcall TNakladnaForm::cxButton5MouseDown(TObject *Sender,
      TMouseButton Button, TShiftState Shift, int X, int Y)
{
   if(Button == mbRight)
   {
      Report->Vars["Nakladna.Nomer"] = Document->Nomer;
      Report->Vars["Nakladna.Pokupec"] = Document->Partner->NamePartner;
      Report->Vars["Nakladna.Suma"] = Document->Suma;
      Report->Vars["Nakladna.Data"] = Document->DataDok;
      float sumaOplata;
      sumaOplata = EditSuma->Value;
      Report->Vars["Nakladna.SumaOplata"] = sumaOplata;
      TSumaPropysom * SumaPropysom;
      Report->Vars["Nakladna.SumaPropisom"] = SumaPropysom->Propys(Document->Suma);
      Report->Vars["Nakladna.Saldo"] = TPartner::GetSaldo(Document->Partner->ID_Partner);
      Report->FileBlank = "nakladna_podatok.frf";
      Report->frReport = this->frReport1;
      Report->LoadBlankFromFile();
      frReport1->DesignReport();
   }

}
//---------------------------------------------------------------------------

void __fastcall TNakladnaForm::cxButton6Click(TObject &Sender)
{
   FrameList1->Query->DisableControls();
   Report->Vars["Nakladna.Nomer"] = Document->Nomer;
   Report->Vars["Nakladna.Pokupec"] = Document->Partner->NamePartner;
   Report->Vars["Nakladna.Suma"] = Document->Suma;
   Report->Vars["Nakladna.Data"] = Document->DataDok;
   float s = EditSuma->Value;
   Report->Vars["Nakladna.SumaOplata"] = s;
   TSumaPropysom * SumaPropysom;
   Report->Vars["Nakladna.SumaPropisom"] = SumaPropysom->Propys(Document->Suma);
   Report->Vars["Nakladna.Saldo"] = TPartner::GetSaldo(Document->Partner->ID_Partner);
   Report->FileBlank = "nakladna_nacenka.frf";
   Report->frReport = this->frReport1;
   Report->LoadBlankFromFile();
   frReport1->ShowReport();
   FrameList1->Query->EnableControls();
}
//---------------------------------------------------------------------------

void __fastcall TNakladnaForm::cxButton6MouseDown(TObject *Sender,
      TMouseButton Button, TShiftState Shift, int X, int Y)
{
 if(Button == mbRight)
   {
      Report->Vars["Nakladna.Nomer"] = Document->Nomer;
      Report->Vars["Nakladna.Pokupec"] = Document->Partner->NamePartner;
      Report->Vars["Nakladna.Suma"] = Document->Suma;
      Report->Vars["Nakladna.Data"] = Document->DataDok;
      float sumaOplata;
      sumaOplata = EditSuma->Value;
      Report->Vars["Nakladna.SumaOplata"] = sumaOplata;
      TSumaPropysom * SumaPropysom;
      Report->Vars["Nakladna.SumaPropisom"] = SumaPropysom->Propys(Document->Suma);
      Report->Vars["Nakladna.Saldo"] = TPartner::GetSaldo(Document->Partner->ID_Partner);
      Report->FileBlank = "nakladna_nacenka.frf";
      Report->frReport = this->frReport1;
      Report->LoadBlankFromFile();
      frReport1->DesignReport();
   }
}
//---------------------------------------------------------------------------

