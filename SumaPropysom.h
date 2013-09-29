//---------------------------------------------------------------------------
// ClassExplorer Pro generated header file
// Created by alibaba on 16.12.03, 10:33:41
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "FR_Class.hpp"
#include "FR_DBSet.hpp"
#include "FR_DSet.hpp"
#include <DB.hpp>
#include <DBGrids.hpp>
#include <DBTables.hpp>
#include <Grids.hpp>
#include <DBCtrls.hpp>
#include <Mask.hpp>
#include <ComCtrls.hpp>
#include <ExtCtrls.hpp>
#include <variant.h>
#ifndef SumaPropysomH
#define SumaPropysomH


//---------------------------------------------------------------------------
class TSumaPropysom : public TfrFunctionLibrary  {
private:
protected:
public:

__published:
        Variant DoFunction(int FNo);
        __fastcall TSumaPropysom();
        __fastcall ~TSumaPropysom();
        void __fastcall Num(__int64);
        void __fastcall Num10(__int64);
        void  __fastcall Num100(__int64);
        void __fastcall Num00();
        void __fastcall NumMult(__int64 Mult, AnsiString s1, AnsiString s2, AnsiString s3);
        void __fastcall Fst(AnsiString S);
        void __fastcall FstKop(AnsiString S);        
        AnsiString __fastcall Propys(float value);
        void __fastcall UAH();
        void __fastcall Kopijka();
        double __fastcall Round(double Argument, int Precision);
};

//---------------------------------------------------------------------------
#endif

