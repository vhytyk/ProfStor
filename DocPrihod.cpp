//---------------------------------------------------------------------------
// ClassExplorer Pro generated source file
// Created by Администратор on 18.06.2004, 10:30:09
//---------------------------------------------------------------------------
#include "DocPrihod.h"
#include "UUtiliteFunctions.h"


//---------------------------------------------------------------------------
__fastcall TDocPrihod::TDocPrihod(int nomer)
{
   if(nomer)
   {
      FPartner = 0;
      Fill(nomer);
   }
   else
   {
      FNomer = 0;
      FDataDok = Date();
      Suma = 0;
      Partner = new TPartner(0);
   }
}
//---------------------------------------------------------------------------
__fastcall TDocPrihod::~TDocPrihod()
{
}
//---------------------------------------------------------------------------
int __fastcall TDocPrihod::GetNewNomer()
{
   int result = -1;
   TIBQuery * q = CreateQuery(0, "select gen_id(gen_nomer_prihod,1) from rdb$database", true);
   if(!q->FieldByName("gen_id")->IsNull)
      result = q->FieldByName("gen_id")->AsInteger;
   FNomer = result;
   return result;
}
//---------------------------------------------------------------------------
void __fastcall TDocPrihod::SetNomer(int value)
{
   FNomer = value;
}
//---------------------------------------------------------------------------
int __fastcall TDocPrihod::GetNomer()
{
   return FNomer;
}
//---------------------------------------------------------------------------
void __fastcall TDocPrihod::SetDataDok(TDateTime value)
{
   FDataDok = value;
}
//---------------------------------------------------------------------------
TDateTime __fastcall TDocPrihod::GetDataDok()
{
   return FDataDok;
}
//---------------------------------------------------------------------------
void __fastcall TDocPrihod::SetSuma(float value)
{
   FSuma = value;
}
//---------------------------------------------------------------------------
float __fastcall TDocPrihod::GetSuma()
{
   return Round(FSuma,2);
}
//---------------------------------------------------------------------------
void TDocPrihod::Fill(int nomer)
{
   TIBQuery * q = CreateQuery(0,
   "select nomer, datadok, id_partner, sum(kilxkist*cina) as suma from prihod where nomer = "
   +IntToStr(nomer)+
   " group by nomer, datadok, id_partner"
                     ,true);
   FDataDok = q->FieldByName("datadok")->AsDateTime;
   FNomer = nomer;
   FSuma = q->FieldByName("suma")->AsFloat;
   if(!FPartner)
      FPartner = new TPartner(q->FieldByName("id_partner")->AsInteger);

}
//---------------------------------------------------------------------------
void __fastcall TDocPrihod::SetPartner(TPartner * value)
{
   FPartner = value;
}
//---------------------------------------------------------------------------
TPartner * __fastcall TDocPrihod::GetPartner()
{
   return FPartner;
}
//---------------------------------------------------------------------------
void __fastcall TDocPrihod::Delete()
{
   if(MessageDlg("Ви действительно хотите удалить целый документ?",
         mtConfirmation, TMsgDlgButtons() << mbYes << mbNo, 0) == mrYes)
   {
      TIBQuery * q = CreateQuery(0, "delete from prihod where nomer = " + IntToStr(FNomer), true);
      delete q;
   }

}

