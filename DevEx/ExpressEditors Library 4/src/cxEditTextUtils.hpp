// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxEditTextUtils.pas' rev: 6.00

#ifndef cxEditTextUtilsHPP
#define cxEditTextUtilsHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Graphics.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Types.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxedittextutils
{
//-- type declarations -------------------------------------------------------
typedef char TcxCaptionChar;

typedef char *PcxCaptionChar;

typedef unsigned TcxTextOutFormat;

#pragma option push -b-
enum TcxTextAlignX { taLeft, taCenterX, taRight, taJustifyX, taDistributeX };
#pragma option pop

#pragma option push -b-
enum TcxTextAlignY { taTop, taCenterY, taBottom, taDistributeY };
#pragma option pop

struct TcxTextParams;
typedef TcxTextParams *PcxTextParams;

#pragma pack(push, 1)
struct TcxTextParams
{
	int RowHeight;
	int tmExternalLeading;
	int FullRowHeight;
	int EndEllipsisWidth;
	char BreakChar;
	TcxTextAlignX TextAlignX;
	TcxTextAlignY TextAlignY;
	bool WordBreak;
	bool SingleLine;
	bool ExpandTabs;
	bool EndEllipsis;
	bool ExternalLeading;
	bool EditControl;
	bool NoClip;
	bool AutoIndents;
	bool PreventLeftExceed;
	bool PreventTopExceed;
	bool CharBreak;
	bool CalcRowCount;
	bool CalcRect;
	int MaxCharWidth;
} ;
#pragma pack(pop)

#pragma pack(push, 4)
struct TcxTextRow
{
	char *Text;
	int TextLength;
	tagSIZE TextExtents;
	int BreakCount;
	int TextOriginX;
	int TextOriginY;
	int StartOffset;
} ;
#pragma pack(pop)

typedef DynamicArray<TcxTextRow >  TcxTextRows;

typedef HDC TCanvasHandle;

//-- var, const, procedure ---------------------------------------------------
static const Shortint CXTO_LEFT = 0x0;
static const Shortint CXTO_CENTER_HORIZONTALLY = 0x1;
static const Shortint CXTO_RIGHT = 0x2;
static const Shortint CXTO_JUSTIFY_HORIZONTALLY = 0x3;
static const Shortint CXTO_DISTRIBUTE_HORIZONTALLY = 0x4;
static const Shortint CXTO_TOP = 0x0;
static const Shortint CXTO_CENTER_VERTICALLY = 0x10;
static const Shortint CXTO_BOTTOM = 0x20;
static const Shortint CXTO_DISTRIBUTE_VERTICALLY = 0x30;
static const Shortint CXTO_PREVENT_LEFT_EXCEED = 0x40;
static const Byte CXTO_PREVENT_TOP_EXCEED = 0x80;
static const Word CXTO_WORDBREAK = 0x100;
static const Word CXTO_SINGLELINE = 0x200;
static const Word CXTO_EXPANDTABS = 0x400;
static const Word CXTO_END_ELLIPSIS = 0x800;
static const Word CXTO_PATTERNEDTEXT = 0x1000;
static const Word CXTO_EXTERNALLEADING = 0x2000;
static const Word CXTO_EDITCONTROL = 0x4000;
static const Word CXTO_NOCLIP = 0x8000;
static const int CXTO_AUTOINDENTS = 0x10000;
static const int CXTO_CHARBREAK = 0x20000;
static const int CXTO_CALCRECT = 0x100000;
static const int CXTO_CALCROWCOUNT = 0x200000;
static const Word CXTO_DEFAULT_FORMAT = 0x200;
static const Shortint cxTextSpace = 0x2;
extern PACKAGE unsigned __fastcall cxMakeFormat(TcxTextAlignX ATextAlignX, TcxTextAlignY ATextAlignY);
extern PACKAGE tagSIZE __fastcall cxCalcTextExtents(HDC AHandle, char * AText, int ATextLength, bool AExpandTabs);
extern PACKAGE void __fastcall cxCalcTextRowExtents(HDC AHandle, TcxTextRow &ATextRow, const TcxTextParams &ATextParams);
extern PACKAGE TcxTextParams __fastcall cxCalcTextParams(HDC AHandle, unsigned AFormat)/* overload */;
extern PACKAGE TcxTextParams __fastcall cxCalcTextParams(Graphics::TCanvas* ACanvas, unsigned AFormat)/* overload */;
extern PACKAGE bool __fastcall cxMakeTextRows(HDC AHandle, char * AText, const Types::TRect &R, const TcxTextParams &ATextParams, /* out */ TcxTextRows &ATextRows, /* out */ int &ACount, int AMaxLineCount = 0x0)/* overload */;
extern PACKAGE bool __fastcall cxMakeTextRows(Graphics::TCanvas* ACanvas, char * AText, const Types::TRect &R, const TcxTextParams &ATextParams, /* out */ TcxTextRows &ATextRows, /* out */ int &ACount, int AMaxLineCount = 0x0)/* overload */;
extern PACKAGE void __fastcall cxPlaceTextRows(HDC AHandle, const Types::TRect &R, TcxTextParams &ATextParams, const TcxTextRows ATextRows, int ARowCount);
extern PACKAGE Types::TRect __fastcall cxPrepareRect(const Types::TRect &R, const TcxTextParams &ATextParams, int ALeftIndent, int ARightIndent);
extern PACKAGE void __fastcall cxTextRowsOutHighlight(HDC AHandle, const Types::TRect &R, const TcxTextParams &ATextParams, const TcxTextRows ATextRows, int ARowCount, int ASelStart, int ASelLength, Graphics::TColor AColor, Graphics::TColor ATextColor, bool AForceEndEllipsis);
extern PACKAGE int __fastcall cxGetLongestTextRowWidth(const TcxTextRows ATextRows, int ARowCount);
extern PACKAGE int __fastcall cxTextOut(HDC AHandle, char * AText, Types::TRect &R, unsigned AFormat, int ASelStart, int ASelLength, Graphics::TColor AColor, Graphics::TColor ATextColor, int AMaxLineCount = 0x0, int ALeftIndent = 0x0, int ARightIndent = 0x0)/* overload */;
extern PACKAGE int __fastcall cxTextOut(Graphics::TCanvas* ACanvas, char * AText, Types::TRect &R, unsigned AFormat, int ASelStart, int ASelLength, Graphics::TColor AColor, Graphics::TColor ATextColor, int AMaxLineCount = 0x0, int ALeftIndent = 0x0, int ARightIndent = 0x0)/* overload */;
extern PACKAGE int __fastcall cxTextOut(Graphics::TCanvas* ACanvas, char * AText, Types::TRect &R, unsigned AFormat = (unsigned)(0x200), int AMaxLineCount = 0x0, int ALeftIndent = 0x0, int ARightIndent = 0x0)/* overload */;
extern PACKAGE int __fastcall cxTextOut(HDC AHandle, char * AText, Types::TRect &R, unsigned AFormat = (unsigned)(0x200), int AMaxLineCount = 0x0, int ALeftIndent = 0x0, int ARightIndent = 0x0)/* overload */;

}	/* namespace Cxedittextutils */
using namespace Cxedittextutils;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxEditTextUtils
