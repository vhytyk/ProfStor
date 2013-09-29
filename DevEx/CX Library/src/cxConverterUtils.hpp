// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxConverterUtils.pas' rev: 6.00

#ifndef cxConverterUtilsHPP
#define cxConverterUtilsHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <StdCtrls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxconverterutils
{
//-- type declarations -------------------------------------------------------
//-- var, const, procedure ---------------------------------------------------
extern PACKAGE bool __fastcall CompareFonts(Graphics::TFont* AFont1, Graphics::TFont* AFont2);
extern PACKAGE Classes::TAlignment __fastcall ConvertAlignment(const AnsiString AValue);
extern PACKAGE Stdctrls::TEditCharCase __fastcall ConvertCharCase(const AnsiString AValue);
extern PACKAGE Stdctrls::TScrollStyle __fastcall ConvertScrollStyle(const AnsiString AValue);
extern PACKAGE bool __fastcall DefaultFont(Graphics::TFont* AFont);

}	/* namespace Cxconverterutils */
using namespace Cxconverterutils;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxConverterUtils
