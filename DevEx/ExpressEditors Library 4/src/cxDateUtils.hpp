// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxDateUtils.pas' rev: 6.00

#ifndef cxDateUtilsHPP
#define cxDateUtilsHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxdateutils
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TDay { dSunday, dMonday, dTuesday, dWednesday, dThursday, dFriday, dSaturday };
#pragma option pop

typedef Set<TDay, dSunday, dSaturday>  TDays;

#pragma option push -b-
enum TcxDateElement { deYear, deMonth, deDay };
#pragma option pop

//-- var, const, procedure ---------------------------------------------------
static const int NullDate = 0xfff551a0;
extern PACKAGE bool __fastcall (*SmartTextToDateFunc)(const AnsiString AText, System::TDateTime &ADate);
extern PACKAGE void __fastcall DecMonth(Word &AYear, Word &AMonth);
extern PACKAGE void __fastcall IncMonth(Word &AYear, Word &AMonth);
extern PACKAGE void __fastcall ChangeMonth(Word &AYear, Word &AMonth, int Delta);
extern PACKAGE int __fastcall GetDateElement(System::TDateTime ADate, TcxDateElement AElement);
extern PACKAGE bool __fastcall IsLeapYear(int AYear);
extern PACKAGE int __fastcall DaysPerMonth(int AYear, int AMonth);
extern PACKAGE int __fastcall CheckDay(int AYear, int AMonth, int ADay);
extern PACKAGE int __fastcall DateOf(System::TDateTime ADateTime);
extern PACKAGE System::TDateTime __fastcall TimeOf(System::TDateTime ADateTime);
extern PACKAGE System::TDateTime __fastcall StrToDateDef(const AnsiString ADateStr, System::TDateTime ADefDate);
extern PACKAGE bool __fastcall SmartTextToDate(const AnsiString AText, System::TDateTime &ADate);
extern PACKAGE bool __fastcall TextToDateEx(AnsiString AText, System::TDateTime &ADate);
extern PACKAGE AnsiString __fastcall DateTimeToText(System::TDateTime ADate);
extern PACKAGE AnsiString __fastcall DateTimeToTextEx(const System::TDateTime ADate, bool AIsMasked);
extern PACKAGE AnsiString __fastcall GetDateRegularExpession(const AnsiString ADateFormat, bool AUseSmartInput);
extern PACKAGE bool __fastcall DateTextValid(const AnsiString ADateText, bool AUseOleDateFormat, /* out */ System::TDateTime &ADate);

}	/* namespace Cxdateutils */
using namespace Cxdateutils;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxDateUtils
