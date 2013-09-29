//---------------------------------------------------------------------------
// ClassExplorer Pro generated header file
// Created by Администратор on 22.06.2004, 9:09:48
//---------------------------------------------------------------------------
#ifndef GroupH
#define GroupH

#include <Classes.hpp>
#include <DString.h>
//---------------------------------------------------------------------------
class TGroup
{
private:
   int FID_Group;
   int FID_Partner;
   AnsiString FName;
   void __fastcall SetID_Group(int value);
   int __fastcall GetID_Group();
   void __fastcall SetName(AnsiString value);
   AnsiString __fastcall GetName();
protected:
public:
   __fastcall TGroup(int id);
   __fastcall ~TGroup();
   void __fastcall Fill(int id);
   bool __fastcall Save();
   bool __fastcall Delete();
   __property int ID_Group = { read = GetID_Group, write = SetID_Group };
   __property AnsiString Name = { read = GetName, write = SetName };
};

//---------------------------------------------------------------------------
#endif
