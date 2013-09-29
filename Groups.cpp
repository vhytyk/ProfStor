//---------------------------------------------------------------------------
// ClassExplorer Pro generated source file
// Created by Администратор on 22.06.2004, 9:09:48
//---------------------------------------------------------------------------
#include "Groups.h"
#include "Partner.h"
#include "UUtiliteFunctions.h"

//---------------------------------------------------------------------------
__fastcall TGroup::TGroup(int id)
{
   if(id)
      Fill(id);
   else
   {
      FID_Group = 0;
      FName = "";
   }
}
//---------------------------------------------------------------------------
__fastcall TGroup::~TGroup()
{
   //TODO: Add your source code here
}
//---------------------------------------------------------------------------
void __fastcall TGroup::SetID_Group(int value)
{
   FID_Group = value;
}
//---------------------------------------------------------------------------
int __fastcall TGroup::GetID_Group()
{
   return FID_Group;
}
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
void __fastcall TGroup::Fill(int id)
{
   TIBQuery * q = CreateQuery(0, "select * from Groups where id_Group="+IntToStr(id),true);
   FID_Group = q->FieldByName("id_Group")->AsInteger;
   FName = q->FieldByName("Name")->AsString;
}
//---------------------------------------------------------------------------
bool __fastcall TGroup::Save()
{
   bool rezult;
   TMyColumns Columns;
   if(FID_Group)
      Columns["ID_Group"] = FID_Group;
   Columns["Name"] = FName;

   if(!FID_Group)
   {
      rezult = InsertIntoTable("Groups",Columns);
      if (rezult)
      {
         FID_Group = rezult;
      }
   }else{
      rezult = UpdateTable("Groups",FID_Group,Columns,"ID_Group");
   }
   return rezult;
}
//---------------------------------------------------------------------------
bool __fastcall TGroup::Delete()
{
   bool result = false;
   if(FID_Group)
      result = DeleteFromTable("Groups", FID_Group, true,"ID_Group");
   return result;
}
//---------------------------------------------------------------------------
void __fastcall TGroup::SetName(AnsiString value)
{
   FName = value;
}
//---------------------------------------------------------------------------
AnsiString __fastcall TGroup::GetName()
{
   return FName;
}

