// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxLike.pas' rev: 6.00

#ifndef cxLikeHPP
#define cxLikeHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <SysUtils.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxlike
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TcxFilterLikeOperator { floLike, floBeginsWith, floEndsWith, floContains };
#pragma option pop

//-- var, const, procedure ---------------------------------------------------
extern PACKAGE bool __fastcall LikeStr(const AnsiString AStr, const AnsiString APatternStr, char APercent, char AUnderline);
extern PACKAGE TcxFilterLikeOperator __fastcall LikeOperatorByPattern(AnsiString &APatternStr, char APercent);

}	/* namespace Cxlike */
using namespace Cxlike;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxLike
