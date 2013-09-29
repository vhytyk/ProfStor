//---------------------------------------------------------------------------
// ClassExplorer Pro generated header file
// Created by Vic on 06.07.2004, 15:13:39
//---------------------------------------------------------------------------
#ifndef FReportH
#define FReportH
#include <Classes.hpp>

#include "FR_DBSet.hpp"
#include "FR_DSet.hpp"
#include "FR_Class.hpp"
#include "variant.h"
#include <map>
#include <utilcls.h>


//---------------------------------------------------------------------------
typedef std::map<AnsiString,TVariant> TMyColumns;
class TFReport {
private:
protected:
        AnsiString FFileBlank;
        AnsiString __fastcall GetFileBlank();
        void __fastcall SetFileBlank(AnsiString value);
        TfrReport* FfrReport;
        void __fastcall SetfrReport(TfrReport* value);
        TfrReport* __fastcall GetfrReport();

public:
        __fastcall TFReport();
        void __fastcall LoadBlankFromFile();
        __property AnsiString FileBlank = { read = GetFileBlank, write = SetFileBlank };
        __property TfrReport* frReport = { read = GetfrReport, write = SetfrReport };
        TMyColumns Vars;
};

//---------------------------------------------------------------------------
#endif
