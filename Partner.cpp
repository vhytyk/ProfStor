//---------------------------------------------------------------------------
// ClassExplorer Pro generated source file
// Created by Администратор on 16.06.2004, 8:50:54
//---------------------------------------------------------------------------
#include "Partner.h"
#include "UUtiliteFunctions.h"

//---------------------------------------------------------------------------
__fastcall TPartner::TPartner(int id)
{
   if(id)
      Fill(id);
   else
   {
      FID_Partner = 0;
      FSaldo = 0;
      FNamePartner = "";
      FInfo = "";
   }}
//---------------------------------------------------------------------------
__fastcall TPartner::~TPartner()
{
}
//---------------------------------------------------------------------------
void __fastcall TPartner::SetInfo(AnsiString value)
{
   FInfo = value;
}
//---------------------------------------------------------------------------
void __fastcall TPartner::SetID_Partner(int value)
{
   FID_Partner = value;
}
//---------------------------------------------------------------------------
void __fastcall TPartner::SetNamePartner(AnsiString value)
{
   FNamePartner = value;
}
//---------------------------------------------------------------------------
void __fastcall TPartner::SetSaldo(float value)
{
   FSaldo = value;
}
//---------------------------------------------------------------------------
int __fastcall TPartner::GetID_Partner()
{
   return FID_Partner;
}
//---------------------------------------------------------------------------
AnsiString __fastcall TPartner::GetInfo()
{
   return FInfo;
}
//---------------------------------------------------------------------------
float __fastcall TPartner::GetSaldo()
{
   return FSaldo;
}
//---------------------------------------------------------------------------
AnsiString __fastcall TPartner::GetNamePartner()
{
   return FNamePartner;
}
//---------------------------------------------------------------------------
void __fastcall TPartner::Fill(int id)
{
   TIBQuery * q = CreateQuery(0, "select * from partner where id_partner="+IntToStr(id),true);
   FID_Partner = q->FieldByName("ID_Partner")->AsInteger;
   FSaldo = q->FieldByName("Saldo")->AsFloat;
   FNamePartner = q->FieldByName("NamePartner")->AsString;
   FInfo = q->FieldByName("Info")->AsString;
   FPartnerType = (TPartnerType)q->FieldByName("PartnerType")->AsInteger;
}
//---------------------------------------------------------------------------
bool __fastcall TPartner::Save()
{
   bool rezult;
   TMyColumns Columns;
   if(FID_Partner)
      Columns["ID_Partner"] = FID_Partner;
   Columns["Saldo"] = FSaldo;
   Columns["NamePartner"] = FNamePartner;
   Columns["Info"] = FInfo;
   Columns["PartnerType"] = FPartnerType;

   if(!FID_Partner)
   {
      rezult = InsertIntoTable("Partner",Columns);
      if (rezult)
      {
         FID_Partner = rezult;
      }
   }else{
      rezult = UpdateTable("Partner",FID_Partner,Columns);
   }
   return rezult;
}
//---------------------------------------------------------------------------
bool __fastcall TPartner::Delete()
{
   bool result = false;
   if(FID_Partner)
      result = DeleteFromTable("Partner", FID_Partner, true);
   return result;
}
//---------------------------------------------------------------------------
void __fastcall TPartner::SetPartnerType(TPartnerType value)
{
   FPartnerType = value;
}
//---------------------------------------------------------------------------
TPartnerType __fastcall TPartner::GetPartnerType()
{
   return FPartnerType;
}
//---------------------------------------------------------------------------
float __fastcall TPartner::GetSaldo(int Partner)
{
   float result = 0;
   TIBQuery * q = CreateQuery(NULL, "select saldo from partner where id_partner = "+IntToStr(Partner), true);
   result = q->FieldByName("saldo")->AsFloat;
   delete q;
   return result;
}

