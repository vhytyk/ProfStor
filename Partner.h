//---------------------------------------------------------------------------
// ClassExplorer Pro generated header file
// Created by Администратор on 16.06.2004, 8:50:54
//---------------------------------------------------------------------------
#ifndef PartnerH
#define PartnerH

#include <Classes.hpp>
#include <DString.h>
//---------------------------------------------------------------------------
enum TPartnerType {ptPostach = 1, ptPokupec = 2, ptRashod = 3,ptAll};
class TPartner {
private:
   AnsiString FNamePartner;
   float FSaldo;
   int FID_Partner;
   AnsiString FInfo;
   TPartnerType FPartnerType;
   AnsiString __fastcall GetInfo();
   int __fastcall GetID_Partner();
   float __fastcall GetSaldo();
   AnsiString __fastcall GetNamePartner();
   void __fastcall SetID_Partner(int value);
   void __fastcall SetSaldo(float value);
   void __fastcall SetNamePartner(AnsiString value);
   void __fastcall SetInfo(AnsiString value);
   TPartnerType __fastcall GetPartnerType();
   void __fastcall SetPartnerType(TPartnerType value);
protected:
public:
   __fastcall TPartner(int id);
   __fastcall ~TPartner();
   void __fastcall Fill(int id);
   bool __fastcall Save();
   bool __fastcall Delete();
   static float __fastcall GetSaldo(int Partner);
   __property AnsiString Info = { read = GetInfo, write = SetInfo };
   __property int ID_Partner = { read = GetID_Partner, write = SetID_Partner };
   __property float Saldo = { read = GetSaldo, write = SetSaldo };
   __property AnsiString NamePartner = { read = GetNamePartner, write = SetNamePartner };
   __property TPartnerType PartnerType = { read = GetPartnerType, write = SetPartnerType };
};

//---------------------------------------------------------------------------
#endif
