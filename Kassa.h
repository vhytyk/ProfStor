//---------------------------------------------------------------------------
// ClassExplorer Pro generated header file
// Created by Администратор on 22.06.2004, 9:09:48
//---------------------------------------------------------------------------
#ifndef KassaH
#define KassaH

#include <Classes.hpp>
#include <DString.h>
//---------------------------------------------------------------------------
enum TTypeDok  {tdPrihod = 1, tdRashod = 2};
class TPartner;
class TKassa
{
private:
   int FID_Kassa;
   int FID_Partner;
   float FSuma;
   TTypeDok FTypeDok;
   int FNomerDok;
   TPartner * FPartner;
   TDateTime FData;
   AnsiString FComment;
   void __fastcall SetID_Kassa(int value);
   int __fastcall GetID_Kassa();
   void __fastcall SetID_Partner(int value);
   int __fastcall GetID_Partner();
   void __fastcall SetSuma(float value);
   float __fastcall GetSuma();
   void __fastcall SetTypeDok(TTypeDok value);
   TTypeDok __fastcall GetTypeDok();
   void __fastcall SetNomerDok(int value);
   int __fastcall GetNomerDok();
   void __fastcall SetPartner(TPartner * value);
   TPartner * __fastcall GetPartner();
   void __fastcall SetData(TDateTime value);
   TDateTime __fastcall GetData();
   void __fastcall SetComment(AnsiString value);
   AnsiString __fastcall GetComment();
protected:
public:
   __fastcall TKassa(int id);
   __fastcall ~TKassa();
   void __fastcall Fill(int id);
   bool __fastcall Save();
   bool __fastcall Delete();
   static float __fastcall GetOplataNakladna(int Nomer, int Partner);
   __property int ID_Kassa = { read = GetID_Kassa, write = SetID_Kassa };
   __property int ID_Partner = { read = GetID_Partner, write = SetID_Partner };
   __property float Suma = { read = GetSuma, write = SetSuma };
   __property TTypeDok TypeDok = { read = GetTypeDok, write = SetTypeDok };
   __property int NomerDok = { read = GetNomerDok, write = SetNomerDok };
   __property TPartner * Partner = { read = GetPartner, write = SetPartner };
   __property TDateTime Data = { read = GetData, write = SetData };
   __property AnsiString Comment = { read = GetComment, write = SetComment };
};

//---------------------------------------------------------------------------
#endif
