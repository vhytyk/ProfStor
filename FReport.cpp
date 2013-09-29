//---------------------------------------------------------------------------
// ClassExplorer Pro generated source file
// Created by Vic on 06.07.2004, 15:13:39
//---------------------------------------------------------------------------
#include "FReport.h"
#include "fr_intrp.hpp"
#include "variant.h"
#include <DBTables.hpp>
//---------------------------------------------------------------------------

__fastcall TFReport::TFReport()
{
//
}
//---------------------------------------------------------------------------
void __fastcall TFReport::LoadBlankFromFile()
{
   FfrReport->Clear();
   FfrReport->ShowProgress = false;
   FfrReport->LoadFromFile(FFileBlank);
}

//-----------------------------------------------------------------------------
void __fastcall TFReport::SetFileBlank(AnsiString value)
{
AnsiString PATH = "blanks\\";
        FFileBlank = PATH + value;
}
//-----------------------------------------------------------------------------
AnsiString __fastcall TFReport::GetFileBlank()
{
        return FFileBlank;
}

//-----------------------------------------------------------------------------
void __fastcall TFReport::SetfrReport(TfrReport* value)
{
        FfrReport = value;
}
//-----------------------------------------------------------------------------

TfrReport* __fastcall TFReport::GetfrReport()
{
        return FfrReport;
}



