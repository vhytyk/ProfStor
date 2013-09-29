//---------------------------------------------------------------------------
// ClassExplorer Pro generated source file
// Created by Администратор on 18.06.2004, 8:15:25
//---------------------------------------------------------------------------
#include "Rashod.h"
#include "UUtiliteFunctions.h"

//---------------------------------------------------------------------------
__fastcall TRashod::TRashod(int id)
{
   if(id)
      Fill(id);
   else
   {
      FID_Rashod = 0;
      FID_Partner = 0;
      FCina = 0;
      FKilxkist = 0;
      FID_Tovar = 0;
      FNomer = 0;
      FDataDok = Date();
   }
}
//---------------------------------------------------------------------------
__fastcall TRashod::~TRashod()
{
}
//---------------------------------------------------------------------------
void __fastcall TRashod::SetID_Rashod(int value)
{
   FID_Rashod = value;
}
//---------------------------------------------------------------------------
int __fastcall TRashod::GetID_Rashod()
{
   return FID_Rashod;
}
//---------------------------------------------------------------------------
void __fastcall TRashod::SetID_Partner(int value)
{
   FID_Partner = value;
}
//---------------------------------------------------------------------------
void __fastcall TRashod::SetCina(float value)
{
   FCina = value;
}
//---------------------------------------------------------------------------
void __fastcall TRashod::SetKilxkist(float value)
{
   FKilxkist = value;
}
//---------------------------------------------------------------------------
void __fastcall TRashod::SetID_Tovar(int value)
{
   FID_Tovar = value;
}
//---------------------------------------------------------------------------
int __fastcall TRashod::GetID_Partner()
{
   return FID_Partner;
}
//---------------------------------------------------------------------------
float __fastcall TRashod::GetCina()
{
   return FCina;
}
//---------------------------------------------------------------------------
float __fastcall TRashod::GetKilxkist()
{
   return FKilxkist;
}
//---------------------------------------------------------------------------
int __fastcall TRashod::GetID_Tovar()
{
   return FID_Tovar;
}
//---------------------------------------------------------------------------
void TRashod::Fill(int id)
{
   TIBQuery * q = CreateQuery(0, "select * from rashod where id_rashod="+IntToStr(id),true);
   FID_Rashod = q->FieldByName("ID_Rashod")->AsInteger;
   FID_Partner = q->FieldByName("ID_Partner")->AsInteger;
   FCina = q->FieldByName("Cina")->AsFloat;
   FKilxkist = q->FieldByName("Kilxkist")->AsFloat;
   FID_Tovar = q->FieldByName("ID_Tovar")->AsInteger;
   FNomer = q->FieldByName("Nomer")->AsInteger;
   FDataDok = q->FieldByName("datadok")->AsDateTime;
}
//---------------------------------------------------------------------------
bool TRashod::Save()
{
   bool rezult;
   TMyColumns Columns;
   if(FID_Rashod)
      Columns["ID_Rashod"] = FID_Rashod;
   Columns["ID_Partner"] = FID_Partner;
   Columns["Cina"] = FCina;
   Columns["Kilxkist"] = FKilxkist;
   Columns["ID_Tovar"] = FID_Tovar;
   Columns["Nomer"] = FNomer;
   Columns["DataDok"] = FDataDok;

   if(!FID_Rashod)
   {
      rezult = InsertIntoTable("Rashod",Columns);
      if (rezult)
      {
         FID_Rashod = rezult;
      }
   }else{
      rezult = UpdateTable("Rashod",FID_Rashod,Columns);
   }
   return rezult;
}

//---------------------------------------------------------------------------
bool TRashod::Delete()
{
   bool result = false;
   if(FID_Rashod)
      result = DeleteFromTable("Rashod", FID_Rashod, true);
   return result;
}
//---------------------------------------------------------------------------
void __fastcall TRashod::SetNomer(int value)
{
   FNomer = value;
}
//---------------------------------------------------------------------------
int __fastcall TRashod::GetNomer()
{
   return FNomer;
}
//---------------------------------------------------------------------------
void __fastcall TRashod::SetDataDok(TDateTime value)
{
   FDataDok = value;
}
//---------------------------------------------------------------------------
TDateTime __fastcall TRashod::GetDataDok()
{
   return FDataDok;
}

