//---------------------------------------------------------------------------
// ClassExplorer Pro generated header file
// Created by Администратор on 18.06.2004, 10:30:09
//---------------------------------------------------------------------------
#ifndef DocPrihodH
#define DocPrihodH
#include <Classes.hpp>
#include <DString.h>
#include "Partner.h"
//---------------------------------------------------------------------------
class TDocPrihod {
private:
   int FNomer;
   TDateTime FDataDok;
   float FSuma;
   TPartner * FPartner;
   void __fastcall SetNomer(int value);
   int __fastcall GetNomer();
   void __fastcall SetDataDok(TDateTime value);
   TDateTime __fastcall GetDataDok();
   void __fastcall SetSuma(float value);
   float __fastcall GetSuma();
   void __fastcall SetPartner(TPartner * value);
   TPartner * __fastcall GetPartner();
protected:
public:
   __fastcall TDocPrihod(int nomer);
   __fastcall ~TDocPrihod();
   int __fastcall GetNewNomer();
   void Fill(int id);
   void __fastcall Delete();
   __property int Nomer = { read = GetNomer, write = SetNomer };
   __property TDateTime DataDok = { read = GetDataDok, write = SetDataDok };
   __property float Suma = { read = GetSuma, write = SetSuma };
   __property TPartner * Partner = { read = GetPartner, write = SetPartner };
};

//---------------------------------------------------------------------------
#endif
