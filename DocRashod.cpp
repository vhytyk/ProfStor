//---------------------------------------------------------------------------
// ClassExplorer Pro generated source file
// Created by Администратор on 18.06.2004, 8:27:53
//---------------------------------------------------------------------------
#include "DocRashod.h"
#include "UUtiliteFunctions.h"
#include "Partner.h"

//---------------------------------------------------------------------------
__fastcall TDocRashod::TDocRashod(int nomer)
{
   if(nomer)
   {
      FPartner = 0;
      Fill(nomer);
   }
   else
   {
      FNomer = 0;
      FDataDok = Date();
      Suma = 0;
      Partner = new TPartner(0);
   }
}
//---------------------------------------------------------------------------
__fastcall TDocRashod::~TDocRashod()
{
}
//---------------------------------------------------------------------------
int __fastcall TDocRashod::GetNewNomer()
{
   int result = -1;
   TIBQuery * q = CreateQuery(0, "select gen_id(gen_nomer_rashod,1) from rdb$database", true);
   if(!q->FieldByName("gen_id")->IsNull)
      result = q->FieldByName("gen_id")->AsInteger;
   FNomer = result;
   return result;
}
//---------------------------------------------------------------------------
void __fastcall TDocRashod::SetNomer(int value)
{
   FNomer = value;
}
//---------------------------------------------------------------------------
int __fastcall TDocRashod::GetNomer()
{
   return FNomer;
}
//---------------------------------------------------------------------------
void __fastcall TDocRashod::SetDataDok(TDateTime value)
{
   FDataDok = value;
}
//---------------------------------------------------------------------------
TDateTime __fastcall TDocRashod::GetDataDok()
{
   return FDataDok;
}
//---------------------------------------------------------------------------
void __fastcall TDocRashod::SetSuma(float value)
{
   FSuma = value;
}
//---------------------------------------------------------------------------
float __fastcall TDocRashod::GetSuma()
{
   return Round(FSuma, 2);
}
//---------------------------------------------------------------------------
void TDocRashod::Fill(int nomer)
{
   TIBQuery * q = CreateQuery(0,
   "select nomer, datadok, id_partner, sum(kilxkist*cina) as suma from rashod where nomer = "
   +IntToStr(nomer)+
   " group by nomer, datadok, id_partner"
                     ,true);
   FDataDok = q->FieldByName("datadok")->AsDateTime;
   FNomer = nomer;
   FSuma = q->FieldByName("suma")->AsFloat;
   if(!FPartner)
      FPartner = new TPartner(q->FieldByName("id_partner")->AsInteger);
}
//---------------------------------------------------------------------------
void __fastcall TDocRashod::SetPartner(TPartner * value)
{
   FPartner = value;
}
//---------------------------------------------------------------------------
TPartner * __fastcall TDocRashod::GetPartner()
{
   return FPartner;
}
//---------------------------------------------------------------------------
void __fastcall TDocRashod::Delete()
{
   bool del = false;
   if(MessageDlg("Ви действительно хотите удалить целый документ?",
         mtConfirmation, TMsgDlgButtons() << mbYes << mbNo, 0) == mrYes)
   {
      TIBQuery * q = CreateQuery(0, "delete from rashod where nomer = " + IntToStr(FNomer), true);
      q->Transaction->Commit();
      delete q;
   }
}

