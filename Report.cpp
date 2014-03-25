//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Report.h"
#include "PartnerList.h"
#include "Partner.h"
#include "UUtiliteFunctions.h"
#include "FReport.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "UFrameList"
#pragma link "cxCalendar"
#pragma link "cxContainer"
#pragma link "cxControls"
#pragma link "cxDropDownEdit"
#pragma link "cxEdit"
#pragma link "cxMaskEdit"
#pragma link "cxTextEdit"
#pragma link "cxButtons"
#pragma link "cxLookAndFeelPainters"
#pragma link "FR_Class"
#pragma link "FR_DBSet"
#pragma link "FR_DSet"
#pragma link "cxButtonEdit"
#pragma link "cxLabel"
#pragma resource "*.dfm"
TFormReport *FormReport;
//---------------------------------------------------------------------------
__fastcall TFormReport::TFormReport(TComponent* Owner, TMyFields fields,
         AnsiString QueryString, AnsiString filename)
   : TForm(Owner)
{
   id_partner = -1;
   a = true;
   DateEnd->Date = Date();
   DateStart->Date = Date();
   Report = new TFReport();
   Fields = fields;
   QueryStr = QueryString;
   ReportFileName = filename;
   FrameList1->Query = CreateQuery(this, DateReplace(QueryString), true);
   FrameList1->Query->Name = "NaklDS";
   FrameList1->Query->OnFilterRecord = IBQuery1FilterRecord;
   Refresh();
   FrameList1->Query->Filtered = true;
//   DateEnd->Properties->OnChange = DateChange;
//   DateStart->Properties->OnChange = DateChange;

}
//---------------------------------------------------------------------------
void __fastcall TFormReport::Refresh()
{
   if(FrameList1->Query->Fields->Count)
      FrameList1->Refresh(FrameList1->Query->Fields->Fields[0]->FieldName);
   else
   {
      FrameList1->Query->Close();
      FrameList1->Query->Open();
   }
   AnsiString str = "";
   TMyFields::iterator iter;
   for(int i = 0; i<FrameList1->Query->Fields->Count; i++)
   {
      AnsiString fname = FrameList1->Query->Fields->Fields[i]->FieldName;
      AnsiString caption = (AnsiString)Fields[fname];
      if(caption.IsEmpty())
         caption = "false";
      str += caption + (i < FrameList1->Query->Fields->Count-1?"   ,":" ");
   }
   SetDisplayLabels(FrameList1->Query, FrameList1->GridView1->DataController,str);
}
//---------------------------------------------------------------------------
AnsiString __fastcall TFormReport::DateReplace(AnsiString str)
{
   AnsiString result = str;
   result =
      StringReplace(result, "[DateStart]",
         DateToStr(DateStart->Date), TReplaceFlags() <<rfReplaceAll<< rfIgnoreCase);
   result =
      StringReplace(result, "[DateEnd]",
         DateToStr(DateEnd->Date), TReplaceFlags() <<rfReplaceAll<< rfIgnoreCase);
   AnsiString s = "";
   result =
      StringReplace(result, "[Pokupatel]",
         (id_partner > 0) ? " and id_partner="+IntToStr(id_partner) : s, TReplaceFlags() <<rfReplaceAll<< rfIgnoreCase);
   return result;
}
//---------------------------------------------------------------------------
void __fastcall TFormReport::cxButton1Click(TObject &Sender)
{
   FrameList1->Query->SQL->Text = DateReplace(QueryStr);
   Refresh();
}
//---------------------------------------------------------------------------
void __fastcall TFormReport::cxButton2MouseDown(TObject *Sender,
      TMouseButton Button, TShiftState Shift, int X, int Y)
{
   if(Button == mbRight)
   {
      Report->Vars["Report.DateStart"] = DateStart->Date;
      Report->Vars["Report.DateEnd"] = DateEnd->Date;
      Report->FileBlank = ReportFileName;
      Report->frReport = this->frReport1;
      Report->LoadBlankFromFile();
      frReport1->DesignReport();
      Close();
   }
}
//---------------------------------------------------------------------------

void __fastcall TFormReport::DateChange(TObject *Sender)
{
   FrameList1->Query->SQL->Text = DateReplace(QueryStr);
   Refresh();
}
//---------------------------------------------------------------------------

void __fastcall TFormReport::frReport1GetValue(const AnsiString ParName,
      Variant &ParValue)
{
   ParValue = Report->Vars[ParName];
}
//---------------------------------------------------------------------------
void __fastcall TFormReport::cxButton2Click(TObject &Sender)
{
   FrameList1->Query->DisableControls();
   Report->Vars["Report.DateStart"] = DateStart->Date;
   Report->Vars["Report.DateEnd"] = DateEnd->Date;
   Report->FileBlank = ReportFileName;
   Report->frReport = this->frReport1;
   Report->LoadBlankFromFile();
   frReport1->ShowReport();
   FrameList1->Query->EnableControls();
   FrameList1->Query->First();

}
//---------------------------------------------------------------------------
void __fastcall TFormReport::IBQuery1FilterRecord(TDataSet *DataSet,
      bool &Accept)
{

   for(int i = 0; i<FrameList1->GridView1->DataController->Filter->Root->Count; i++)
   {
      Accept=false;
      TcxFilterCriteriaItem * item = dynamic_cast<TcxFilterCriteriaItem *>(FrameList1->GridView1->DataController->Filter->Root->Items[i]);
      for(int j=0; j<FrameList1->Query->Fields->Count; j++)
      {
         Variant v1 = FrameList1->Query->FieldValues[FrameList1->Query->Fields->Fields[j]->FieldName];
         Variant v2 = item->Value;
         if(v1.Type() == varNull)
            v1 = "";
         if(v2.Type() == varNull)
            v2 = "";
         v1.ChangeType(varString);
         v2.ChangeType(varString);
         switch (item->OperatorKind)
         {
            case foEqual:
               if(v1 == v2)
                  Accept=true;
            break;
         }
      }
   }
/*   if(ReportFileName == "kassa.frf")
   {
      if(FrameList1->Query->FieldByName("kassa_rashod")->AsFloat > 0 || FrameList1->Query->FieldByName("kassa_prihod")->AsFloat > 0)
         Accept = true;
      else
         Accept = false;
      FrameList1GridView1DataControllerFilterChanged(0);
   }          */
   FrameList1GridView1DataControllerFilterChanged(0);
}
//---------------------------------------------------------------------------

void __fastcall TFormReport::FrameList1GridView1DataControllerFilterChanged(
      TObject *Sender)
{
   AnsiString str = "";
   TMyFields::iterator iter;
   for(int i = 0; i<FrameList1->Query->Fields->Count; i++)
   {
      AnsiString fname = FrameList1->Query->Fields->Fields[i]->FieldName;
      AnsiString caption = (AnsiString)Fields[fname];
      if(caption.IsEmpty())
         caption = "false";
      str += caption + (i < FrameList1->Query->Fields->Count-1?"   ,":" ");
   }
   SetDisplayLabels(FrameList1->Query, FrameList1->GridView1->DataController,str);
}
//---------------------------------------------------------------------------
void __fastcall TFormReport::FormKeyDown(TObject *Sender, WORD &Key,
      TShiftState Shift)
{
   if(Shift.Contains(ssCtrl))
   {
      if(Key == 'p' || Key == 'P' || Key == 'ç' || Key == 'Ç' )
        cxButton2Click(*Sender);
      if(Key == 'j' || Key == 'J' || Key == 'î' || Key == 'Î')
      {
         FrameList1->Query->DisableControls();
         Report->Vars["Report.DateStart"] = DateStart->Date;
         Report->Vars["Report.DateEnd"] = DateEnd->Date;
         Report->FileBlank = "oborot2.frf";
         Report->frReport = this->frReport1;
         Report->LoadBlankFromFile();
         frReport1->ShowReport();
         FrameList1->Query->EnableControls();
         FrameList1->Query->First();
      }
   }
}
//---------------------------------------------------------------------------

void __fastcall TFormReport::EditPartnerPropertiesButtonClick(
      TObject *Sender, int AButtonIndex)
{
  //
   TPartnerListForm * pf = new TPartnerListForm(this, ptPokupec);
   pf->ShowModal();
   if(pf->SelectedItem)
   {
//      Document->Partner = pf->SelectedItem;
      EditPartner->Text = pf->SelectedItem->NamePartner;
      id_partner = pf->SelectedItem->ID_Partner;
   }
   delete pf;
}
//---------------------------------------------------------------------------

