//---------------------------------------------------------------------------
// ClassExplorer Pro generated source file
// Created by Администратор on 18.06.2004, 8:02:15
//---------------------------------------------------------------------------
#include "Prihod.h"
#include "UUtiliteFunctions.h"
//---------------------------------------------------------------------------
__fastcall TPrihod::TPrihod(int id)
{
   if(id)
      Fill(id);
   else
   {
      FID_Prihod = 0;
      FID_Partner = 0;
      FCina = 0;
      FKilxkist = 0;
      FID_Tovar = 0;
      FNomer = 0;
      FDataDok = Date();
   }
}
//---------------------------------------------------------------------------
__fastcall TPrihod::~TPrihod()
{
}
//---------------------------------------------------------------------------
void __fastcall TPrihod::SetID_Prihod(int value)
{
   FID_Prihod = value;
}
//---------------------------------------------------------------------------
void __fastcall TPrihod::SetID_Partner(int value)
{
   FID_Partner = value;
}
//---------------------------------------------------------------------------
void __fastcall TPrihod::SetCina(float value)
{
   FCina = value;
}
//---------------------------------------------------------------------------
void __fastcall TPrihod::SetKilxkist(float value)
{
   FKilxkist = value;
}
//---------------------------------------------------------------------------
void __fastcall TPrihod::SetID_Tovar(int value)
{
   FID_Tovar = value;
}
//---------------------------------------------------------------------------
int __fastcall TPrihod::GetID_Partner()
{
   return FID_Partner;
}
//---------------------------------------------------------------------------
float __fastcall TPrihod::GetCina()
{
   return FCina;
}
//---------------------------------------------------------------------------
float __fastcall TPrihod::GetKilxkist()
{
   return FKilxkist;
}
//---------------------------------------------------------------------------
int __fastcall TPrihod::GetID_Tovar()
{
   return FID_Tovar;
}
//---------------------------------------------------------------------------
int __fastcall TPrihod::GetID_Prihod()
{
   return FID_Prihod;
}
//---------------------------------------------------------------------------
void TPrihod::Fill(int id)
{
   TIBQuery * q = CreateQuery(0, "select * from prihod where id_prihod="+IntToStr(id),true);
   FID_Prihod = q->FieldByName("ID_Prihod")->AsInteger;
   FID_Partner = q->FieldByName("ID_Partner")->AsInteger;
   FCina = q->FieldByName("Cina")->AsFloat;
   FKilxkist = q->FieldByName("Kilxkist")->AsFloat;
   FID_Tovar = q->FieldByName("ID_Tovar")->AsInteger;
   FNomer = q->FieldByName("Nomer")->AsInteger;
   FDataDok = q->FieldByName("datadok")->AsDateTime;
}
//---------------------------------------------------------------------------
bool TPrihod::Save()
{
   bool rezult;
   TMyColumns Columns;
   if(FID_Prihod)
      Columns["ID_Prihod"] = FID_Prihod;
   Columns["ID_Partner"] = FID_Partner;
   Columns["Cina"] = FCina;
   Columns["Kilxkist"] = FKilxkist;
   Columns["ID_Tovar"] = FID_Tovar;
   Columns["Nomer"] = FNomer;
   Columns["DataDok"] = FDataDok;

   if(!FID_Prihod)
   {
      rezult = InsertIntoTable("Prihod",Columns);
      if (rezult)
      {
         FID_Prihod = rezult;
      }
   }else{
      rezult = UpdateTable("Prihod",FID_Prihod,Columns);
   }
   return rezult;
}

//---------------------------------------------------------------------------
bool TPrihod::Delete()
{
   bool result = false;
   if(FID_Prihod)
      result = DeleteFromTable("Prihod", FID_Prihod, true);
   return result;
}
//---------------------------------------------------------------------------
void __fastcall TPrihod::SetNomer(int value)
{
   FNomer = value;
}
//---------------------------------------------------------------------------
int __fastcall TPrihod::GetNomer()
{
   return FNomer;
}
//---------------------------------------------------------------------------
void __fastcall TPrihod::SetDataDok(TDateTime value)
{
   FDataDok = value;
}
//---------------------------------------------------------------------------
TDateTime __fastcall TPrihod::GetDataDok()
{
   return FDataDok;
}

