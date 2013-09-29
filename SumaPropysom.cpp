//---------------------------------------------------------------------------
// ClassExplorer Pro generated source file
// Created by alibaba on 16.12.03, 10:33:41
//---------------------------------------------------------------------------
#include "SumaPropysom.h"
#include <stdio.h>
#include <math.h>

bool Rend;
__int64 ValueTemp;
__int64 ValueOst;
__int64 ValueRes;
__int64 Value;
int Kopijok;
AnsiString ValName;
AnsiString KopName;
AnsiString skl = "гривна ;гривны ;гривень ";
AnsiString skp = " копейка ; копейки ; копеек ";
AnsiString skl1;
AnsiString skl2;
AnsiString skl3;
AnsiString skp1;
AnsiString skp2;
AnsiString skp3;
AnsiString Result;

//---------------------------------------
__fastcall TSumaPropysom::TSumaPropysom()
{
//        TfrFunctionLibrary::TSumaPropysom();
}

//---------------------------------------------------------------------------
__fastcall TSumaPropysom::~TSumaPropysom()
{

}

//---------------------------------------------------------------------------
Variant TSumaPropysom::DoFunction(int FNo)
{
Variant val;
val = "ddd";
   return val;
        //TODO: Add your source code here
}


//-----------------------------------------------------------------------------
void __fastcall TSumaPropysom::Num(__int64 value)
{
   switch (value)
   {
   case 1: if (Rend)
              Result = Result +"один ";
           else Result = Result + "одна ";
   break;
   case 2: if (Rend)
              Result = Result +"два ";
           else Result = Result + "две ";
   break;
   case 3: Result = Result + "три ";
   break;
   case 4: Result = Result + "четыре ";
   break;
   case 5: Result = Result + "пь€ть ";
   break;
   case 6: Result = Result + "шесть ";
   break;
   case 7: Result = Result + "семь ";
   break;
   case 8: Result = Result + "восемь ";
   break;
   case 9: Result = Result + "девь€ть ";
   break;
   case 10: Result = Result + "дес€ть ";
   break;
   case 11: Result = Result + "одинадцать ";
   break;
   case 12: Result = Result + "двенадцать ";
   break;
   case 13: Result = Result + "тринадцать ";
   break;
   case 14: Result = Result + "четырнадцать ";
   break;
   case 15: Result = Result + "пь€тнадцать ";
   break;
   case 16: Result = Result + "шестнадцать ";
   break;
   case 17: Result = Result + "семнадцать ";
   break;
   case 18: Result = Result + "восемнадцать ";
   break;
   case 19: Result = Result + "девь€тнадцать ";
   break;
   }
}

//---------------------------------------------------------------------------
void __fastcall TSumaPropysom::Num10(__int64 value)
{
   switch (value)
   {
   case 2: Result = Result + "двадцать ";
   break;
   case 3: Result = Result + "тридцать ";
   break;
   case 4: Result = Result + "сорок ";
   break;
   case 5: Result = Result + "пь€тдес€т ";
   break;
   case 6: Result = Result + "шестьдес€т ";
   break;
   case 7: Result = Result + "семьдес€т ";
   break;
   case 8: Result = Result + "восемьдес€т ";
   break;
   case 9: Result = Result + "девь€носто ";
   break;
   }
}

//---------------------------------------------------------------------------
void  __fastcall TSumaPropysom::Num100(__int64 value)
{
   switch (value)
   {
   case 1: Result = Result + "сто ";
   break;
   case 2: Result = Result + "двести ";
   break;
   case 3: Result = Result + "триста ";
   break;
   case 4: Result = Result + "четыриста ";
   break;
   case 5: Result = Result + "пь€тсот ";
   break;
   case 6: Result = Result + "шестьсот ";
   break;
   case 7: Result = Result + "семьсот ";
   break;
   case 8: Result = Result + "восемьсот ";
   break;
   case 9: Result = Result + "девь€тьсот ";
   break;
   }
}

//---------------------------------------------------------------------------
void __fastcall TSumaPropysom::Num00()
{
   Num100(ValueTemp/100);
   ValueTemp = fmodl(ValueTemp, 100);
   if(ValueTemp < 20)
     Num(ValueTemp);
   else
     {
     Num10(ValueTemp/10);
     ValueTemp = fmodl(ValueTemp,10);
     Num(ValueTemp);
     }
}

//---------------------------------------------------------------------------
void __fastcall TSumaPropysom::NumMult(__int64 Mult,AnsiString s1, AnsiString s2,
                                         AnsiString s3)
{
   if(Value >= Mult)
      {
      ValueTemp = Value/Mult;
      ValueRes = ValueTemp;
      Num00();

      if (ValueTemp == 1)
         Result = Result + s1;
      else if (ValueTemp > 1 && ValueTemp < 5)
         Result = Result + s2;
      else
         Result = Result + s3;
      Value = Value - Mult * ValueRes;
      }
}

//---------------------------------------------------------------------------
void __fastcall TSumaPropysom::Fst(AnsiString s)
{
int pos=1;
   while(pos <= s.Length() && s[pos] != ';')
      {
      skl1 = skl1 + s[pos];
      pos++;
      }
      pos++;
   while(pos <= s.Length() && s[pos] != ';')
      {
      skl2 = skl2 + s[pos];
      pos++;
      }
      pos++;
   while(pos <= s.Length() && s[pos] != ';')
      {
      skl3 = skl3 + s[pos];
      pos++;
      }
}

//---------------------------------------------------------------------------
void __fastcall TSumaPropysom::FstKop(AnsiString s)
{
int pos=1;
   while(pos <= s.Length() && s[pos] != ';')
      {
      skp1 = skp1 + s[pos];
      pos++;
      }
      pos++;
   while(pos <= s.Length() && s[pos] != ';')
      {
      skp2 = skp2 + s[pos];
      pos++;
      }
      pos++;
   while(pos <= s.Length() && s[pos] != ';')
      {
      skp3 = skp3 + s[pos];
      pos++;
      }
}

//---------------------------------------------------------------------------
void __fastcall TSumaPropysom::UAH()
{
int hk10,hk20;
skl1="";
skl2="";
skl3="";

   Fst(skl);
   hk10 = fmodl(Value,10);
   hk20 = fmodl(Value,100);
   if(hk20 > 10 && hk20 < 20)
      ValName = skl3;
   else if (hk10 == 1)
      ValName = skl1;
   else if (hk10 > 1 &&hk10 < 5)
      ValName = skl2;
   else
      ValName = skl3;
}

//---------------------------------------------------------------------------
void __fastcall TSumaPropysom::Kopijka()
{
skp1="";
skp2="";
skp3="";
KopName = "";
int hk10;
int hk20;

   FstKop(skp);

   hk10 = fmod(Kopijok,10);
   hk20 = fmod(Kopijok,100);
   if(hk20 > 10 && hk20 < 20)
      KopName = skp3;
   else if (hk10 == 1)
      KopName = skp1;
   else if (hk10 > 1 &&hk10 < 5)
      KopName = skp2;
   else
      KopName = skp3;
}

//---------------------------------------------------------------------------
AnsiString __fastcall TSumaPropysom::Propys(float value)
{
value = Round(value,2);
Result = "";
Value = value;
int mmm = Round(Round(value,2)-Value,2)*100;
Kopijok = mmm;
   if (Kopijok > mmm*10 )
      {
      Kopijok = Kopijok/10;
      Kopijok++;
      }
AnsiString StrKopijok;
Rend = false;

   UAH();
   Kopijka();

   if(Value == 0)
      Result = "ноль ";
   else
      {
      Rend = true;
      NumMult(1000000000000,"триллион ","триллона ","триллонов ");
      NumMult(1000000000,"миллиард ","миллиарда ","миллиардов ");
      NumMult(1000000,"миллион ","миллиона ","миллионов ");
      Rend = false;
      NumMult(1000,"тис€ча ","тис€чи ","тис€ч ");
      ValueTemp = Value;
      Num00();
      }
   if(Kopijok >9)
      StrKopijok = IntToStr(Kopijok)+KopName;
   else
      StrKopijok = "0"+IntToStr(Kopijok)+KopName;
   Result = Result+ValName+StrKopijok;
   return Result;
}

//---------------------------------------------------------------------------
double __fastcall TSumaPropysom::Round (double Argument, int Precision)
{
double div = 1.0;
if (Precision >= 0)
   while (Precision--)
          div *= 10.0;
else
   while (Precision++)
          div /= 10.0;
return floor(Argument * div + 0.5) / div;
}





