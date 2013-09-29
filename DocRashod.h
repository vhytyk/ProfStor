//---------------------------------------------------------------------------
// ClassExplorer Pro generated header file
// Created by Администратор on 18.06.2004, 8:27:53
//---------------------------------------------------------------------------
#ifndef DocRashodH
#define DocRashodH

#include <Classes.hpp>
#include <DString.h>
//---------------------------------------------------------------------------
class TPartner;
class TDocRashod {
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
   TPartner *__fastcall GetPartner();
protected:
public:
   __fastcall TDocRashod(int nomer);
   __fastcall ~TDocRashod();
   int __fastcall GetNewNomer();
   void Fill(int nomer);
   void __fastcall Delete();
   __property int Nomer = { read = GetNomer, write = SetNomer };
   __property TDateTime DataDok = { read = GetDataDok, write = SetDataDok };
   __property float Suma = { read = GetSuma, write = SetSuma };
   __property TPartner * Partner = { read = GetPartner, write = SetPartner };
};

//---------------------------------------------------------------------------
#endif
