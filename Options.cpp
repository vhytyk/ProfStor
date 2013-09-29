//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Options.h"
#include "UUtiliteFunctions.h"
#include "MainForm.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxButtons"
#pragma link "cxContainer"
#pragma link "cxControls"
#pragma link "cxEdit"
#pragma link "cxLookAndFeelPainters"
#pragma link "cxTextEdit"
#pragma link "cxButtonEdit"
#pragma link "cxLabel"
#pragma link "cxMaskEdit"
#pragma link "cxCheckBox"
#pragma link "cxColorComboBox"
#pragma link "cxDropDownEdit"
#pragma resource "*.dfm"
TOptionsForm *OptionsForm;
//---------------------------------------------------------------------------
__fastcall TOptionsForm::TOptionsForm(TComponent* Owner)
   : TForm(Owner)
{
   Load();
}
//---------------------------------------------------------------------------
void __fastcall TOptionsForm::Load()
{
   EditDBName->Text = GetSettings()->ReadString("Database Options","DatabaseName","sklad.gdb");
   CheckWindowState->Checked = GetSettings()->ReadBool("MainForm Options","IsWindowStateMaximize", true);
   CheckGroupPanel->Checked = GetSettings()->ReadBool("MainForm Options","GroupPanelVisibility", true);
   MainColor->ColorValue = (TColor)GetSettings()->ReadInteger("MainForm Options","MainFormColor", clBtnFace);
   GridColor->ColorValue = (TColor)GetSettings()->ReadInteger("MainForm Options","GridColor", clWhite);
   CheckBoxRefresh->Checked = GetSettings()->ReadBool("MainForm Options","IsRefresh", false);
   EditTimeRefresh->Text = IntToStr(GetSettings()->ReadInteger("MainForm Options","RefreshTime", 3));
}
//---------------------------------------------------------------------------
void __fastcall TOptionsForm::Save()
{
   GetSettings()->WriteString("Database Options","DatabaseName",EditDBName->Text);
   GetSettings()->WriteBool("MainForm Options","IsWindowStateMaximize", CheckWindowState->Checked);
   GetSettings()->WriteBool("MainForm Options","GroupPanelVisibility", CheckGroupPanel->Checked);
   GetSettings()->WriteInteger("MainForm Options","MainFormColor", MainColor->ColorValue);
   GetSettings()->WriteInteger("MainForm Options","GridColor", GridColor->ColorValue);
   GetSettings()->WriteBool("MainForm Options","IsRefresh", CheckBoxRefresh->Checked);
   GetSettings()->WriteInteger("MainForm Options","RefreshTime", StrToInt(EditTimeRefresh->Text));
}
//---------------------------------------------------------------------------
void __fastcall TOptionsForm::Apply()
{
   SetDatabaseName(EditDBName->Text);
   TTMainForm * f = (TTMainForm *)this->Owner;
   f->FrameList1->Panel1->Color = MainColor->ColorValue;
   f->FrameList1->GridView1->OptionsView->GroupByBox = CheckGroupPanel->Checked;
   f->FrameList1->GridView1->Styles->Background->Color = GridColor->ColorValue;
   f->Timer1->Enabled = CheckBoxRefresh->Checked;
   f->Timer1->Interval = StrToInt(EditTimeRefresh->Text)*1000;
}
//---------------------------------------------------------------------------
void __fastcall TOptionsForm::cxButton2Click(TObject &Sender)
{
   Save();   
}
//---------------------------------------------------------------------------
void __fastcall TOptionsForm::cxButton1Click(TObject &Sender)
{
   Apply();   
}
//---------------------------------------------------------------------------

void __fastcall TOptionsForm::CheckBoxRefreshClick(TObject *Sender)
{
   if(CheckBoxRefresh->Checked)
      EditTimeRefresh->Enabled = true;
   else
      EditTimeRefresh->Enabled = false;
}
//---------------------------------------------------------------------------

