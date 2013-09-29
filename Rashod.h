//---------------------------------------------------------------------------
// ClassExplorer Pro generated header file
// Created by Администратор on 18.06.2004, 8:15:25
//---------------------------------------------------------------------------
#ifndef RashodH
#define RashodH

#include <Classes.hpp>
#include <DString.h>
//---------------------------------------------------------------------------
class TRashod {
private:
   int FID_Rashod;
   int __fastcall GetID_Rashod();
   void __fastcall SetID_Rashod(int value);
   int FID_Tovar;
   float FKilxkist;
   float FCina;
   int FID_Partner;
   int FNomer;
   TDateTime FDataDok;
   int __fastcall GetID_Partner();
   float __fastcall GetCina();
   float __fastcall GetKilxkist();
   int __fastcall GetID_Tovar();
   void __fastcall SetCina(float value);
   void __fastcall SetID_Tovar(int value);
   void __fastcall SetKilxkist(float value);
   void __fastcall SetID_Partner(int value);
   void __fastcall SetNomer(int value);
   int __fastcall GetNomer();
   void __fastcall SetDataDok(TDateTime value);
   TDateTime __fastcall GetDataDok();
protected:
public:
   __fastcall TRashod(int id);
   __fastcall ~TRashod();
   void Fill(int id);
   bool Save();
   bool Delete();
   __property int ID_Partner = { read = GetID_Partner, write = SetID_Partner };
   __property float Cina = { read = GetCina, write = SetCina };
   __property int ID_Rashod = { read = GetID_Rashod, write = SetID_Rashod };
   __property float Kilxkist = { read = GetKilxkist, write = SetKilxkist };
   __property int ID_Tovar = { read = GetID_Tovar, write = SetID_Tovar };
   __property int Nomer = { read = GetNomer, write = SetNomer };
   __property TDateTime DataDok = { read = GetDataDok, write = SetDataDok };
};

//---------------------------------------------------------------------------
#endif
