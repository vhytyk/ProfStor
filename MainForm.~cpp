//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "MainForm.h"
#include "UUtiliteFunctions.h"
#include "TTovar.h"
#include "TModifyTovarForm.h"
#include "DocRashod.h"
#include "Nakladna.h"
#include "DocPrihod.h"
#include "AktPrihod.h"
#include "TovarList.h"
#include "Partner.h"
#include "PartnerList.h"
#include "NakladnaList.h"
#include "AktPrihodList.h"
#include "KassaPrihod.h"
#include "Kassa.h"
#include "KassaRashod.h"
#include "Options.h"
#include "Report.h"
#include "KassaList.h"
#include "GroupsList.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "UFrameList"
#pragma link "cxLookAndFeels"
#pragma link "dxBar"
#pragma link "cxButtons"
#pragma link "cxLookAndFeelPainters"
#pragma link "cxHint"
#pragma link "FR_Desgn"
#pragma link "cxButtonEdit"
#pragma link "cxContainer"
#pragma link "cxControls"
#pragma link "cxEdit"
#pragma link "cxMaskEdit"
#pragma link "cxTextEdit"
#pragma link "cxDropDownEdit"
#pragma link "cxGridCustomTableView"
#pragma link "cxGridDBTableView"
#pragma link "cxGridTableView"
#pragma link "FR_Class"
#pragma resource "*.dfm"
TTMainForm *TMainForm;
//---------------------------------------------------------------------------
__fastcall TTMainForm::TTMainForm(TComponent* Owner)
        : TForm(Owner)
{


   FrameList1->Query = CreateQuery(this, "select id_tovar, kod, nametovar, cinazakup, cinaprodazh, ostatok from Tovar order by kod", true);
   Refresh();
   EditPokupci->ItemIndex = 0;
   EditPokupciID->ItemIndex = 0;
   switch(GetRights())
   {
      case 2:
         dxBarSubItem8->Visible = false;
      break;
   }

   /*Settings*/
   if(GetSettings()->ReadBool("MainForm Options","IsWindowStateMaximize", false))
      this->WindowState = wsMaximized;
   this->FrameList1->GridView1->OptionsView->GroupByBox = GetSettings()->ReadBool("MainForm Options","GroupPanelVisibility", true);
   FrameList1->Panel1->Color = (TColor)GetSettings()->ReadInteger("MainForm Options","MainFormColor", clBtnFace);
   TcxStyle * style = new TcxStyle(this);
   style->Color = (TColor)GetSettings()->ReadInteger("MainForm Options","GridColor", clWhite);
   FrameList1->GridView1->Styles->Background = style;
   Timer1->Enabled = GetSettings()->ReadBool("MainForm Options","IsRefresh", false);
   Timer1->Interval = GetSettings()->ReadInteger("MainForm Options","RefreshTime", 3)*1000;
   Timer2Timer(this);
}
//---------------------------------------------------------------------------
void __fastcall TTMainForm::ButtonInsertClick(TObject &Sender)
{
   TModifyTovarForm * ModifyTovarForm = new TModifyTovarForm
               (this, new TTovar(0));
   ModifyTovarForm->ShowModal();
   delete ModifyTovarForm;
   Refresh();

}
//---------------------------------------------------------------------------
void __fastcall TTMainForm::ButtonModifyClick(TObject &Sender)
{
   TModifyTovarForm * ModifyTovarForm = new TModifyTovarForm
               (this, new TTovar(FrameList1->Query->FieldByName("id_tovar")->AsInteger,StrToInt(EditPokupciID->Text)) );
   ModifyTovarForm->ShowModal();
   delete ModifyTovarForm;
   Refresh();
}
//---------------------------------------------------------------------------
void __fastcall TTMainForm::ButtonDeleteClick(TObject &Sender)
{
   TTovar * t = new TTovar(FrameList1->Query->FieldByName("id_tovar")->AsInteger);
   t->Delete();
   delete t;
   Refresh();
}
//---------------------------------------------------------------------------
void __fastcall TTMainForm::Refresh()
{
   int idx = EditPokupci->ItemIndex;
   EditPokupci->Properties->Items->Clear();
   EditPokupciID->Properties->Items->Clear();
   EditPokupci->Properties->Items->Add("Общие цены продажи");
   EditPokupciID->Properties->Items->Add("0");
 /*  TIBQuery * q = CreateQuery(this, "select * from partner where partnertype=2", true);
   while (!q->Eof)
   {
      EditPokupci->Properties->Items->Add(q->FieldByName("namepartner")->AsString);
      EditPokupciID->Properties->Items->Add(q->FieldByName("id_partner")->AsString);
      q->Next();
   }
   delete q;*/

   AnsiString sql;

/*   if(idx > 0)
      sql =
           " select id_tovar,kod, nametovar, partner.namepartner,cinazakup,  "
           " (select cina from prices where id_tovar = t.id_tovar and  "
           " id_partner = "+EditPokupciID->Text+") as cinaprodazh, ostatok"
           " from Tovar t,Partner p where t.id_partner=p.id_partner order by kod ";
   else*/
      sql =
           "select id_tovar, kod, nametovar,partner.namepartner, g.name as groupname, cinazakup, cinaprodazh,"
           " ostatok from Tovar t,Partner p, Groups g where t.id_partner=p.id_partner and g.id_group=t.id_group order by kod ";
   int id = FrameList1->Query->FieldByName("id_tovar")->AsInteger;
   if(FrameList1->Query->SQL->Text.Trim() != sql)
      FrameList1->Query->SQL->Text = sql;

   FrameList1->Refresh("id_tovar");
   SetDisplayLabels(FrameList1->Query, FrameList1->GridView1->DataController,
   "false,Код   ,Название, Поставщик,Група,Цена закуп. , Цена прод. , Остаток ");

   EditPokupci->ItemIndex = idx;
   EditPokupciID->ItemIndex = EditPokupci->ItemIndex;
   FrameList1->Query->Locate("id_tovar", id, TLocateOptions()<<loCaseInsensitive<<loPartialKey );
}
//---------------------------------------------------------------------------

void __fastcall TTMainForm::BarButtonNakladnaClick(TObject *Sender)
{
   TDocRashod * d = new TDocRashod(0);
   d->GetNewNomer();
   TNakladnaForm * nf = new TNakladnaForm(this, d);
   nf->ShowModal();
   delete d;
   delete nf;
   Refresh();
}
//---------------------------------------------------------------------------
void __fastcall TTMainForm::BarButtonPrihodClick(TObject *Sender)
{
   TDocPrihod * d = new TDocPrihod(0);
   d->GetNewNomer();
   TPrihodForm * pf = new TPrihodForm(this, d);
   pf->ShowModal();
   delete d;
   delete pf;
   Refresh();
}
//---------------------------------------------------------------------------
void __fastcall TTMainForm::BarButtonTovarClick(TObject *Sender)
{
   TTovarListForm * tlf = new TTovarListForm(this);
   tlf->ShowModal();
   delete tlf;
   Refresh();
}
//---------------------------------------------------------------------------
void __fastcall TTMainForm::BarButtonPartnerClick(TObject *Sender)
{
   TPartnerListForm * plf = new TPartnerListForm(this, ptAll);
   plf->ShowModal();
   delete plf;
   Refresh(); 
}
//---------------------------------------------------------------------------
void __fastcall TTMainForm::BarButtonNakladnaListClick(TObject *Sender)
{
   TNakladnaListForm * nlf = new TNakladnaListForm(this);
   nlf->ShowModal();
   delete nlf;
}
//---------------------------------------------------------------------------

void __fastcall TTMainForm::BarButtonAktPrihodClick(TObject *Sender)
{
   TAktPrihodListForm * plf = new TAktPrihodListForm(this);
   plf->ShowModal();
   delete plf;
}
//---------------------------------------------------------------------------




void __fastcall TTMainForm::BarButtonKassaPrihodClick(TObject *Sender)
{
   //
   TKassa * k = new TKassa(0);
   TKassaPrihodForm * kpf = new TKassaPrihodForm(this, k);
   kpf->ShowModal();
   delete kpf;
   delete k;
}
//---------------------------------------------------------------------------

void __fastcall TTMainForm::BarButtonKassaRashodClick(TObject *Sender)
{
   TKassa * k = new TKassa(0);
   TKassaRashodForm * kpf = new TKassaRashodForm(this, k);
   kpf->ShowModal();
   delete kpf;
   delete k;
}
//---------------------------------------------------------------------------

void __fastcall TTMainForm::Timer1Timer(TObject *Sender)
{
   Refresh();   
}
//---------------------------------------------------------------------------

void __fastcall TTMainForm::dxBarButton4Click(TObject *Sender)
{
   TOptionsForm * of = new TOptionsForm(this);
   of->ShowModal();
   delete of;   
}
//---------------------------------------------------------------------------
void __fastcall TTMainForm::FormClose(TObject *Sender,
      TCloseAction &Action)
{
   Finilize();   
}
//---------------------------------------------------------------------------

void __fastcall TTMainForm::dxBarButton13Click(TObject *Sender)
{
   dxBarSubItem7->Enabled = false;
   dxBarSubItem8->Enabled = false;
   dxBarSubItem9->Enabled = false;
   Disconnect();
   Refresh();
}
//---------------------------------------------------------------------------

void __fastcall TTMainForm::dxBarButton14Click(TObject *Sender)
{
   dxBarSubItem7->Enabled = true;
   dxBarSubItem8->Enabled = true;
   dxBarSubItem9->Enabled = true;
   try
   {
      Connect();
   }
   catch ( ... )
   {
      ShowMessage("Не могу соединится с базой!");
      dxBarButton13Click(Sender);
      return;
   }
   Refresh();
}
//---------------------------------------------------------------------------

void __fastcall TTMainForm::dxBarButton10Click(TObject *Sender)
{
   AnsiString  query =
    " select tovar.id_tovar, tovar.nametovar, p.namepartner, tovar.cinazakup, tovar.cinaprodazh,"

    " (select sum(kilxkist) from prihod where id_tovar = t.id_tovar "
    "         and datadok < '[DateStart]') as ost_kilk_start_prihod,"
    " (select sum(kilxkist) from rashod where id_tovar = t.id_tovar "
    "         and datadok < '[DateStart]' [Pokupatel]) as ost_kilk_start_rashod, "


    " (select sum(kilxkist) from prihod where id_tovar = t.id_tovar "
    "         and datadok >= '[DateStart]' and datadok<='[DateEnd]') as prihod_kilk, "
    " (select sum(kilxkist) from rashod where id_tovar = t.id_tovar "
    "         and datadok >= '[DateStart]' and datadok<='[DateEnd]' [Pokupatel]) as rashod_kilk, "


    " (select sum(kilxkist) from prihod where id_tovar = t.id_tovar "
    "         and datadok<='[DateEnd]') ost_kilk_end_prihod, "
    " (select sum(kilxkist) from rashod where id_tovar = t.id_tovar "
    "         and datadok<='[DateEnd]' [Pokupatel]) as ost_kilk_end_rashod, "

    " tovar.cinazakup as ser_zakup, "
    " COALESCE ( (select sum(kilxkist*cina)/sum(kilxkist) from rashod where id_tovar=t.id_tovar "
    "   and datadok >= '[DateStart]' and datadok<='[DateEnd]' [Pokupatel]"
    " ), tovar.cinaprodazh) as ser_prodazh "
    " from tovar t , partner p "
    " where p.id_partner = t.id_partner";
   TMyFields fields;
   fields["OST_KILK_START"] = "Остаток нач.";
   fields["OST_KILK_END"] = "Остаток кон.";
   fields["RASHOD_KILK"] = "Ушло";
   fields["PRIHOD_KILK"] = "Пришло";
   fields["NAMETOVAR"] = "Товар";
   fields["NAMEPARTNER"] = "Поставщик";
   TFormReport * fr = new TFormReport(this, fields, query, "oborott.frf");
   fr->Caption = "Форма отчета - Оборот по товару";
   fr->ShowModal();
   delete fr;
}
//---------------------------------------------------------------------------

void __fastcall TTMainForm::dxBarButton16Click(TObject *Sender)
{
/*   AnsiString  query =
      "  select r.nomer, r.datadok, p.namepartner, "
          "  sum(r.kilxkist*r.cina) as suma, "
          "  sum((r.kilxkist*s.ser_prodazh)-(r.kilxkist*s.ser_zakup)) as pributok "
      "  from "
          "  rashod r, sercina s, partner p "
          "  where r.id_tovar = s.id_tovar and "
                "  p.id_partner = r.id_partner and "
                "  r.datadok >='[DateStart]' and r.datadok<='[DateEnd]' "
      "  group by "
          "  r.nomer, r.datadok, p.namepartner ";
   TMyFields fields;
   fields["NOMER"] = "Номер";
   fields["DATADOK"] = "Дата";
   fields["NAMEPARTNER"] = "Поукпаетль";
   fields["SUMA"] = "Сумма";
//   fields["PRIBUTOK"] = "Прибыль";
   TFormReport * fr = new TFormReport(this, fields, query, "rashod.frf");
   fr->Caption = "Форма отчета - Расход по отпускным накладным";
   fr->ShowModal();
   delete fr;*/
   AnsiString  query =
      "  select r.nomer, r.datadok, p.namepartner,"
          "  sum(r.kilxkist*r.cina) as suma, "
          "  sum((r.kilxkist*s.ser_prodazh)-(r.kilxkist*s.ser_zakup)) as pributok "
      "  from "
          "  rashod r, sercina s, partner p "
          "  where r.id_tovar = s.id_tovar and "
                "  p.id_partner = r.id_partner and "
                "  r.datadok >='[DateStart]' and r.datadok<='[DateEnd]' "
      "  group by "
          "  r.nomer, r.datadok, p.namepartner,p.info ";
   TMyFields fields;
   fields["NOMER"] = "Номер";
   fields["DATADOK"] = "Дата";
   fields["NAMEPARTNER"] = "Поукпаетль";
   fields["SUMA"] = "Сумма";
//   fields["PRIBUTOK"] = "Прибыль";
   TFormReport * fr = new TFormReport(this, fields, query, "rashod.frf");
   fr->Caption = "Форма отчета - Расход по отпускным накладным";
   fr->ShowModal();
   delete fr;
}
//---------------------------------------------------------------------------

void __fastcall TTMainForm::EditPokupciPropertiesCloseUp(TObject *Sender)
{
   EditPokupciID->ItemIndex = EditPokupci->ItemIndex;
   Refresh();   
}
//---------------------------------------------------------------------------

void __fastcall TTMainForm::dxBarButton17Click(TObject *Sender)
{
   AnsiString  query =
      "  select r.nomer, r.datadok, p.namepartner, "
          "  sum(r.kilxkist*r.cina) as suma "
      "  from "
          "  prihod r, partner p "
          "  where "
                "  p.id_partner = r.id_partner and "
                "  r.datadok >='[DateStart]' and r.datadok<='[DateEnd]' "
      "  group by "
          "  r.nomer, r.datadok, p.namepartner ";
   TMyFields fields;
   fields["NOMER"] = "Номер";
   fields["DATADOK"] = "Дата";
   fields["NAMEPARTNER"] = "Поукпаетль";
   fields["SUMA"] = "Сумма";
//   fields["PRIBUTOK"] = "Прибыль";
   TFormReport * fr = new TFormReport(this, fields, query, "prihod.frf");
   fr->Caption = "Форма отчета - Приход по актам прихода";
   fr->ShowModal();
   delete fr;
}
//---------------------------------------------------------------------------

void __fastcall TTMainForm::dxBarButton18Click(TObject *Sender)
{
   AnsiString  query =
      "  select p.id_partner, p.namepartner, "
          "  p.partnertype, "
          "  0-(select sum(suma) from kassa where id_partner = p.id_partner "
              "  and typedok=1 and data < '[DateStart]') as kassa_minus_start, "
          "  (select sum(suma) from kassa where id_partner = p.id_partner "
              "  and typedok=2 and data < '[DateStart]')  as kassa_plus_start, "

          "  (select sum(suma) from kassa where id_partner = p.id_partner "
              "  and typedok=2 and data >= '[DateStart]' and data<= '[DateEnd]')  as kassa_prihod, "
          "  (select sum(suma) from kassa where id_partner = p.id_partner "
              "  and typedok=1 and data >= '[DateStart]' and data<= '[DateEnd]') as kassa_rashod, "

          "  (select sum(suma) from kassa where id_partner = p.id_partner "
              "  and typedok=1) as kassa_minus_end, "
          "  (select sum(suma) from kassa where id_partner = p.id_partner "
              "  and typedok=2)  as kassa_plus_end "

      "  from partner p ";
      " order by p.partnertype ";


   TMyFields fields;
   fields["NAMEPARTNER"] = "Партнер";
   fields["KASSA_RASHOD"] = "Ушло";
   fields["KASSA_PRIHOD"] = "Пришло";
   TFormReport * fr = new TFormReport(this, fields, query, "kassa.frf");
   fr->Caption = "Форма отчета - Сальдо кассы по партнерам";
   fr->ShowModal();
   delete fr;
}
//---------------------------------------------------------------------------

void __fastcall TTMainForm::dxBarButton20Click(TObject *Sender)
{
   AnsiString  query =
/*      " select "
          " partner.id_partner, partner.namepartner, kassa.data, kassa.suma, kassa.comment "
      " from "
          " kassa, partner "
      " where "
          " kassa.id_partner = partner.id_partner "
          " and kassa.typedok = 1 and partner.partnertype = 3 "
          " and kassa.data >='[DateStart]' and kassa.data <='[DateEnd]' ";*/
      " select "
          " partner.id_partner, partner.namepartner, kassa.data, kassa.suma, kassa.comment "
      " from "
          " kassa, partner "
      " where "
          " kassa.id_partner = partner.id_partner "
          " and kassa.typedok = 1 "
          " and kassa.data >='[DateStart]' and kassa.data <='[DateEnd]' ";

   TMyFields fields;
   fields["NAMEPARTNER"] = "Партнер";
   fields["DATA"] = "Дата";
   fields["SUMA"] = "Сумма";
   TFormReport * fr = new TFormReport(this, fields, query, "kassa_rashod.frf");
   fr->Caption = "Форма отчета - Различные расходы с кассы";
   fr->ShowModal();
   delete fr;
}
//---------------------------------------------------------------------------
void __fastcall TTMainForm::dxBarButton24Click(TObject *Sender)
{
   TKassaFormList * k = new TKassaFormList(this);
   k->ShowModal();   
}
//---------------------------------------------------------------------------

void __fastcall TTMainForm::Timer2Timer(TObject *Sender)
{
   TIBQuery* prihodKasaSuma = CreateQuery(this,"select SUM(suma) as suma from kassa where kassa.TYPEDOK=2", true);
   TIBQuery* rashodKasaSuma = CreateQuery(this,"select SUM(suma) as suma from kassa where kassa.TYPEDOK=1", true);
   float suma =
      prihodKasaSuma->FieldByName("SUMA")->AsFloat -
      rashodKasaSuma->FieldByName("SUMA")->AsFloat;
   Label1->Caption = "Остаток в кассе: " + FloatToStrF(suma,ffCurrency,12,2);
   prihodKasaSuma->Close();
   rashodKasaSuma->Close();
   delete prihodKasaSuma, rashodKasaSuma;
}
//---------------------------------------------------------------------------

void __fastcall TTMainForm::dxBarButton25Click(TObject *Sender)
{
   AnsiString  query =
      " select k.id_kassa,k.comment, p.namepartner,p.partnertype, k.data , k.nomerdok,"
      "t.name, k.suma from Kassa k, typekassa t, partner p "
      " where k.id_partner = p.id_partner and k.typedok = t.id_typekassa"
      " and kassa.data >='[DateStart]' and kassa.data <='[DateEnd]' ";
      " order by k.id_kassa desc ";


   TMyFields fields;
   fields["NAMEPARTNER"] = "Партнер";
   fields["PARTNERTYPE"] = "Тип(1-пост.2-покуп.3-расх.)";
   fields["DATA"] = "Дата";
   fields["NAME"] = "Тип движения";
   fields["SUMA"] = "Сумма";
   TFormReport * fr = new TFormReport(this, fields, query, "kassa_detail.frf");
   fr->Caption = "Форма отчета - Все движения по кассе";
   fr->ShowModal();
   delete fr;
}
//---------------------------------------------------------------------------

void __fastcall TTMainForm::buttonGroupsClick(TObject *Sender)
{
   new TGroupsFormList(this)->ShowModal();
}
//---------------------------------------------------------------------------

void __fastcall TTMainForm::itemPriceListClick(TObject *Sender)
{
 AnsiString  query =
    " select tovar.id_tovar, tovar.nametovar, tovar.cinaprodazh from tovar where 1=1 [Grupa] [Pokupatel]";


   TMyFields fields;
   fields["ID_TOVAR"] = "Код";
   fields["NAMETOVAR"] = "Товар";
   fields["CINAPRODAZH"] = "Ціна";
   TFormReport * fr = new TFormReport(this, fields, query, "price.frf", true, true);
   fr->Caption = "Прайс-лист";
   fr->ShowModal();
   delete fr;
}
//---------------------------------------------------------------------------


