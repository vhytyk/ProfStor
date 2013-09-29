//---------------------------------------------------------------------------


#pragma hdrstop

#include "TTovar.h"
#include "Partner.h"
#include "Groups.h"
#include "UUtiliteFunctions.h"
         
//---------------------------------------------------------------------------

#pragma package(smart_init)
//---------------------------------------------------------------------------
__fastcall TTovar::TTovar(int id)
{
   ID_Pokupec = 0;
   if(id)
      Fill(id);
   else
   {
      FID_Tovar = 0;
      FCinaZakup = 0;
      FCinaProdazh = 0;
      FID_Partner = 0;
      FID_Group = 0;
      FOstatok = 0;
      FNameTovar = "";
      FPartner = NULL;
      FGroup = NULL;
      FKOD = 0;
   }
}
//---------------------------------------------------------------------------
__fastcall TTovar::TTovar(int id, int id_partner)
{
   ID_Pokupec = id_partner;
   if(id)
      Fill(id);
   else
   {
      FID_Tovar = 0;
      FCinaZakup = 0;
      FCinaProdazh = 0;
      FID_Partner = 0;
      FID_Group = 0;
      FOstatok = 0;
      FNameTovar = "";
      FPartner = NULL;
      FGroup = NULL;
      FKOD = 0;
   }
}
//---------------------------------------------------------------------------
__fastcall TTovar::~TTovar()
{
}
//---------------------------------------------------------------------------
void __fastcall TTovar::SetID_Tovar(int value)
{
   FID_Tovar = value;
}
//---------------------------------------------------------------------------
int __fastcall TTovar::GetID_Tovar()
{
   return FID_Tovar;
}
//---------------------------------------------------------------------------
void __fastcall TTovar::SetCinaZakup(float value)
{
   FCinaZakup = value;
}
//---------------------------------------------------------------------------
void __fastcall TTovar::SetCinaProdazh(float value)
{
   FCinaProdazh = value;
}
//---------------------------------------------------------------------------
void __fastcall TTovar::SetID_Partner(int value)
{
   FID_Partner = value;
}
//---------------------------------------------------------------------------
void __fastcall TTovar::SetID_Group(int value)
{
   FID_Group = value;
}
//---------------------------------------------------------------------------
void __fastcall TTovar::SetOstatok(float value)
{
   FOstatok = value;
}
//---------------------------------------------------------------------------
void __fastcall TTovar::SetNameTovar(AnsiString value)
{
   FNameTovar = value;
}
//---------------------------------------------------------------------------
float __fastcall TTovar::GetCinaZakup()
{
   return FCinaZakup;
}
//---------------------------------------------------------------------------
float __fastcall TTovar::GetCinaProdazh()
{
   return FCinaProdazh;
}
//---------------------------------------------------------------------------
int __fastcall TTovar::GetID_Partner()
{
   return FID_Partner;
}
//---------------------------------------------------------------------------
int __fastcall TTovar::GetID_Group()
{
   return FID_Group;
}
//---------------------------------------------------------------------------
float __fastcall TTovar::GetOstatok()
{
   return FOstatok;
}
//---------------------------------------------------------------------------
AnsiString __fastcall TTovar::GetNameTovar()
{
   return FNameTovar;
}
//---------------------------------------------------------------------------
void __fastcall TTovar::SetPartner(TPartner * value)
{
   FPartner = value;
}
//---------------------------------------------------------------------------
TPartner *  __fastcall TTovar::GetPartner()
{
   return FPartner;
}
//---------------------------------------------------------------------------
void __fastcall TTovar::SetGroup(TGroup * value)
{
   FGroup = value;
}
//---------------------------------------------------------------------------
TGroup *  __fastcall TTovar::GetGroup()
{
   return FGroup;
}
//---------------------------------------------------------------------------
void __fastcall TTovar::SetKOD(int value)
{
   FKOD = value;
}
//---------------------------------------------------------------------------
int __fastcall TTovar::GetKOD()
{
   return FKOD;
}
//---------------------------------------------------------------------------
void __fastcall TTovar::Fill(int id)
{
   AnsiString sql;
   if(ID_Pokupec)
      sql =
         " select t.*, (select pr.cina from prices pr where pr.id_tovar = t.id_tovar and pr.id_partner = "+IntToStr(ID_Pokupec)+") as cinaprod"
         " from "
         " Tovar t where id_tovar="+IntToStr(id);
   else
      sql = "select * from tovar where id_tovar="+IntToStr(id);

   TIBQuery * q = CreateQuery(0, sql,true);

   FID_Tovar = q->FieldByName("ID_Tovar")->AsInteger;
   FID_Partner = q->FieldByName("ID_Partner")->AsInteger;
   FID_Group = q->FieldByName("ID_Group")->AsInteger;
   FNameTovar = q->FieldByName("NameTovar")->AsString;
   FCinaZakup = q->FieldByName("CinaZakup")->AsFloat;
   FKOD = q->FieldByName("KOD")->AsFloat;
   if(ID_Pokupec && !q->FieldByName("CinaProd")->IsNull)
      FCinaProdazh = q->FieldByName("CinaProd")->AsFloat;
   else
      FCinaProdazh = q->FieldByName("CinaProdazh")->AsFloat;
   FOstatok = q->FieldByName("Ostatok")->AsFloat;
   FPartner = new TPartner(FID_Partner);
   FGroup = new TGroup(FID_Group);
}
//---------------------------------------------------------------------------
bool __fastcall TTovar::Save()
{
   bool rezult;
   TMyColumns Columns;
   if(FID_Tovar)
      Columns["ID_Tovar"] = FID_Tovar;
   Columns["ID_Partner"] = FID_Partner;
   Columns["ID_Group"] = FID_Group;
   Columns["NameTovar"] = FNameTovar;
   Columns["CinaZakup"] = FCinaZakup;
   Columns["Kod"] = FKOD;
   if(!ID_Pokupec)
      Columns["CinaProdazh"] = FCinaProdazh;
   Columns["Ostatok"] = FOstatok;

   if(!FID_Tovar)
   {
      rezult = InsertIntoTable("Tovar",Columns);
      if (rezult)
      {
         FID_Tovar = rezult;
      }
   }else{
      rezult = UpdateTable("Tovar",FID_Tovar,Columns);

      /*Продажна ціна*/
      if(ID_Pokupec)
      {
         TIBQuery * q = CreateQuery(0,
         " select id_prices from prices "
         " where id_tovar = "+IntToStr(FID_Tovar)+
         " and id_partner = "+IntToStr(ID_Pokupec)
         ,true);
         if(q->RecordCount > 0)
         {
            int id = q->FieldByName("id_prices")->AsInteger;
            delete q;
            TMyColumns args;
            args["id_prices"] = id;
            args["id_tovar"] = FID_Tovar;
            args["id_partner"] = ID_Pokupec;
            args["cina"] = FCinaProdazh;
            UpdateTable("prices", id, args);
         }
         else
         {
            delete q;
            TMyColumns args;
            args["id_tovar"] = FID_Tovar;
            args["id_partner"] = ID_Pokupec;
            args["cina"] = FCinaProdazh;
            InsertIntoTable("prices", args);
         }

      }
   }


   return rezult;

}
//---------------------------------------------------------------------------
bool __fastcall TTovar::Delete()
{
   bool result = false;
   if(FID_Tovar)
      result = DeleteFromTable("Tovar", FID_Tovar, true);
   return result;
}

