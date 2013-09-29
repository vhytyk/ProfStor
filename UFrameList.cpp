//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "UFrameList.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxClasses"
#pragma link "cxControls"
#pragma link "cxCustomData"
#pragma link "cxData"
#pragma link "cxDataStorage"
#pragma link "cxDBData"
#pragma link "cxEdit"
#pragma link "cxFilter"
#pragma link "cxGraphics"
#pragma link "cxGrid"
#pragma link "cxGridCustomTableView"
#pragma link "cxGridCustomView"
#pragma link "cxGridDBTableView"
#pragma link "cxGridLevel"
#pragma link "cxGridTableView"
#pragma link "cxStyles"
#pragma link "cxButtons"
#pragma link "cxLookAndFeelPainters"
#pragma link "cxHint"
#pragma resource "*.dfm"
TFrameList *FrameList;
//---------------------------------------------------------------------------
__fastcall TFrameList::TFrameList(TComponent* Owner)
   : TFrame(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFrameList::Refresh(AnsiString  id_field)
{
   if(FQuery && IsConnected())
   {
      int id = 0;
      if(FQuery->Active)
      {
         id = FQuery->FieldByName(id_field)->AsInteger;
      }
      if(FQuery->Transaction->Active)
         FQuery->Transaction->Commit();
      FQuery->Close();
      FQuery->Open();
      if(id)
         FQuery->Locate(id_field, id, TLocateOptions()<<loCaseInsensitive<<loPartialKey );
   }
}
//---------------------------------------------------------------------------
void __fastcall TFrameList::SetQuery(TIBQuery * value)
{
   FQuery = value;
   DataSource1->DataSet = FQuery;
}
//---------------------------------------------------------------------------
TIBQuery * __fastcall TFrameList::GetQuery()
{
   return FQuery;
}
//---------------------------------------------------------------------------
void __fastcall TFrameList::SetSelectedObject(TObject * value)
{
   FSelectedObject = value;
}
//---------------------------------------------------------------------------
TObject * __fastcall TFrameList::GetSelectedObject()
{
   return FSelectedObject;
}
//---------------------------------------------------------------------------


void __fastcall TFrameList::Excel1Click(TObject *Sender)
{
   if(SaveDialog1->Execute())
   {
      ExportGrid4ToExcel(SaveDialog1->FileName, cxGrid1, true, true);
   }
}
//---------------------------------------------------------------------------

