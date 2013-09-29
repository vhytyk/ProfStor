//---------------------------------------------------------------------------
// ClassExplorer Pro generated source file
// Created by Администратор on 22.06.2004, 9:09:48
//---------------------------------------------------------------------------
#include "Kassa.h"
#include "Partner.h"
#include "UUtiliteFunctions.h"

//---------------------------------------------------------------------------
__fastcall TKassa::TKassa(int id)
{
   if(id)
      Fill(id);
   else
   {
      FID_Kassa = 0;
      FID_Partner = 0;
      FSuma = 0;
      FTypeDok = tdPrihod;
      FNomerDok = 0;
      FData = Date();
      FComment = "";
      Partner = new TPartner(0);
   }
}
//---------------------------------------------------------------------------
__fastcall TKassa::~TKassa()
{
   //TODO: Add your source code here
}
//---------------------------------------------------------------------------
void __fastcall TKassa::SetID_Kassa(int value)
{
   FID_Kassa = value;
}
//---------------------------------------------------------------------------
int __fastcall TKassa::GetID_Kassa()
{
   return FID_Kassa;
}
//---------------------------------------------------------------------------
void __fastcall TKassa::SetID_Partner(int value)
{
   FID_Partner = value;
   if(!FPartner)
      FPartner = new TPartner(FID_Partner);
}
//---------------------------------------------------------------------------
int __fastcall TKassa::GetID_Partner()
{
   return FID_Partner;
}
//---------------------------------------------------------------------------
void __fastcall TKassa::SetSuma(float value)
{
   FSuma = value;
}
//---------------------------------------------------------------------------
float __fastcall TKassa::GetSuma()
{
   return FSuma;
}
//---------------------------------------------------------------------------
void __fastcall TKassa::SetTypeDok(TTypeDok value)
{
   FTypeDok = value;
}
//---------------------------------------------------------------------------
TTypeDok __fastcall TKassa::GetTypeDok()
{
   return FTypeDok;
}
//---------------------------------------------------------------------------
void __fastcall TKassa::SetNomerDok(int value)
{
   FNomerDok = value;
}
//---------------------------------------------------------------------------
int __fastcall TKassa::GetNomerDok()
{
   return FNomerDok;
}
//---------------------------------------------------------------------------
void __fastcall TKassa::SetPartner(TPartner * value)
{
   FPartner = value;
   FID_Partner = FPartner->ID_Partner;
}
//---------------------------------------------------------------------------
TPartner * __fastcall TKassa::GetPartner()
{
   return FPartner;
}
//---------------------------------------------------------------------------
void __fastcall TKassa::Fill(int id)
{
   TIBQuery * q = CreateQuery(0, "select * from kassa where id_kassa="+IntToStr(id),true);
   FID_Kassa = q->FieldByName("id_kassa")->AsInteger;
   FID_Partner = q->FieldByName("ID_Partner")->AsInteger;
   FSuma = q->FieldByName("Suma")->AsFloat;
   FTypeDok = (TTypeDok)q->FieldByName("TypeDok")->AsInteger;
   FNomerDok = q->FieldByName("NomerDok")->AsInteger;
   FData = q->FieldByName("Data")->AsDateTime;
   FComment = q->FieldByName("Comment")->AsString;
   FPartner = new TPartner(q->FieldByName("id_partner")->AsInteger);
   delete q;
}
//---------------------------------------------------------------------------
bool __fastcall TKassa::Save()
{
   bool rezult;
   TMyColumns Columns;
   if(FID_Kassa)
      Columns["ID_Kassa"] = FID_Kassa;
   Columns["ID_Partner"] = FID_Partner;
   Columns["Suma"] = FSuma;
   Columns["TypeDok"] = FTypeDok;
   Columns["NomerDok"] = FNomerDok;
   Columns["Data"] = FData;
   Columns["Comment"] = FComment;

   if(!FID_Kassa)
   {
      rezult = InsertIntoTable("Kassa",Columns);
      if (rezult)
      {
         FID_Kassa = rezult;
      }
   }else{
      rezult = UpdateTable("Kassa",FID_Kassa,Columns);
   }
   return rezult;
}
//---------------------------------------------------------------------------
bool __fastcall TKassa::Delete()
{
   bool result = false;
   if(FID_Kassa)
      result = DeleteFromTable("Kassa", FID_Kassa, true);
   return result;
}
//---------------------------------------------------------------------------
void __fastcall TKassa::SetData(TDateTime value)
{
   FData = value;
}
//---------------------------------------------------------------------------
TDateTime __fastcall TKassa::GetData()
{
   return FData;
}
//---------------------------------------------------------------------------
void __fastcall TKassa::SetComment(AnsiString value)
{
   FComment = value;
}
//---------------------------------------------------------------------------
AnsiString __fastcall TKassa::GetComment()
{
   return FComment;
}
//---------------------------------------------------------------------------
float __fastcall TKassa::GetOplataNakladna(int Nomer, int Partner)
{
   float result = 0;
   TIBQuery * q = CreateQuery(NULL,
   " select sum(suma) sumaoplata from kassa where typedok = 2 and nomerdok = "
   +   IntToStr(Nomer)+ " and id_partner = "+IntToStr(Partner),true);
   result = q->FieldByName("sumaoplata")->AsFloat;
   delete q;
   return result;
}

