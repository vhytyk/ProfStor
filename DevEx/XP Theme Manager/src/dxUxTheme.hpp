// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'dxUxTheme.pas' rev: 6.00

#ifndef dxUxThemeHPP
#define dxUxThemeHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <CommCtrl.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Dxuxtheme
{
//-- type declarations -------------------------------------------------------
typedef unsigned HTHEME;

typedef unsigned TTheme;

typedef int THEMESIZE;

typedef int TThemeSize;

#pragma pack(push, 4)
struct _MARGINS
{
	int cxLeftWidth;
	int cxRightWidth;
	int cyTopHeight;
	int cyBottomHeight;
} ;
#pragma pack(pop)

typedef _MARGINS  MARGINS;

typedef _MARGINS *PMARGINS;

typedef _MARGINS  TMargins;

#pragma pack(push, 4)
struct _INTLIST
{
	int iValueCount;
	int iValues[10];
} ;
#pragma pack(pop)

typedef _INTLIST  INTLIST;

typedef _INTLIST *PINTLIST;

typedef _INTLIST  TIntList;

#pragma option push -b-
enum PROPERTYORIGIN { PO_STATE, PO_PART, PO_CLASS, PO_GLOBAL, PO_NOTFOUND };
#pragma option pop

typedef PROPERTYORIGIN TPropertyOrigin;

//-- var, const, procedure ---------------------------------------------------
static const Shortint DTT_GRAYED = 0x1;
static const Shortint HTTB_BACKGROUNDSEG = 0x0;
static const Shortint HTTB_FIXEDBORDER = 0x2;
static const Shortint HTTB_CAPTION = 0x4;
static const Shortint HTTB_RESIZINGBORDER_LEFT = 0x10;
static const Shortint HTTB_RESIZINGBORDER_TOP = 0x20;
static const Shortint HTTB_RESIZINGBORDER_RIGHT = 0x40;
static const Byte HTTB_RESIZINGBORDER_BOTTOM = 0x80;
static const Byte HTTB_RESIZINGBORDER = 0xf0;
static const Word HTTB_SIZINGTEMPLATE = 0x100;
static const Word HTTB_SYSTEMSIZINGMARGINS = 0x200;
static const Shortint MAX_INTLIST_COUNT = 0xa;
static const Shortint ETDT_DISABLE = 0x1;
static const Shortint ETDT_ENABLE = 0x2;
static const Shortint ETDT_USETABTEXTURE = 0x4;
static const Shortint ETDT_ENABLETAB = 0x6;
static const Shortint STAP_ALLOW_NONCLIENT = 0x1;
static const Shortint STAP_ALLOW_CONTROLS = 0x2;
static const Shortint STAP_ALLOW_WEBCONTENT = 0x4;
#define SZ_THDOCPROP_DISPLAYNAME "DisplayName"
#define SZ_THDOCPROP_CANONICALNAME "ThemeName"
#define SZ_THDOCPROP_TOOLTIP "ToolTip"
#define SZ_THDOCPROP_AUTHOR "author"
static const Shortint TS_MIN = 0x0;
static const Shortint TS_TRUE = 0x1;
static const Shortint TS_DRAW = 0x2;
extern PACKAGE HRESULT __stdcall CloseThemeData(unsigned hTheme);
extern PACKAGE HRESULT __stdcall DrawThemeBackground(unsigned hTheme, HDC DC, int iPartId, int iStateId, Types::PRect pRect, Types::PRect pClipRect = (void *)(0x0));
extern PACKAGE HRESULT __stdcall DrawThemeEdge(unsigned hTheme, HDC DC, int iPartId, int iStateId, Types::PRect pDestRect, unsigned uEdge, unsigned uFlags, Types::PRect pContentRect);
extern PACKAGE HRESULT __stdcall DrawThemeIcon(unsigned hTheme, HDC DC, int iPartId, int iStateId, Types::PRect pRect, unsigned himl, int iImageIndex);
extern PACKAGE HRESULT __stdcall DrawThemeParentBackground(HWND hWnd, HDC DC, Types::PRect prc);
extern PACKAGE HRESULT __stdcall DrawThemeText(unsigned hTheme, HDC DC, int iPartId, int iStateId, wchar_t * pszText, int iCharCount, unsigned dwTextFlags, unsigned dwTextFlags2, Types::PRect pRect);
extern PACKAGE HRESULT __stdcall EnableThemeDialogTexture(HWND hWnd, unsigned dwFlags);
extern PACKAGE HRESULT __stdcall GetCurrentThemeName(wchar_t * pszThemeFileName, int cchMaxNameChars, wchar_t * pszColorBuff, int cchMaxColorChars, wchar_t * pszSizeBuff, int cchMaxSizeChars);
extern PACKAGE unsigned __stdcall GetThemeAppProperties(void);
extern PACKAGE HRESULT __stdcall GetThemeBackgroundContentRect(unsigned hTheme, HDC DC, int iPartId, int iStateId, Types::PRect pBoundingRect, /* out */ Types::TRect &ContentRect);
extern PACKAGE HRESULT __stdcall GetThemeBackgroundExtent(unsigned hTheme, HDC DC, int iPartId, int iStateId, Types::PRect pContentRect, /* out */ Types::TRect &ExtentRect);
extern PACKAGE HRESULT __stdcall GetThemeBackgroundRegion(unsigned hTheme, HDC DC, int iPartId, int iStateId, Types::PRect pRect, /* out */ HRGN &Region);
extern PACKAGE HRESULT __stdcall GetThemeBool(unsigned hTheme, int iPartId, int iStateId, int iPropId, /* out */ BOOL &fVal);
extern PACKAGE HRESULT __stdcall GetThemeColor(unsigned hTheme, int iPartId, int iStateId, int iPropId, /* out */ unsigned &Color);
extern PACKAGE HRESULT __stdcall GetThemeDocumentationProperty(wchar_t * pszThemeName, wchar_t * pszPropertyName, wchar_t * pszValueBuff, int cchMaxValChars);
extern PACKAGE HRESULT __stdcall GetThemeEnumValue(unsigned hTheme, int iPartId, int iStateId, int iPropId, /* out */ int &iVal);
extern PACKAGE HRESULT __stdcall GetThemeFilename(unsigned hTheme, int iPartId, int iStateId, int iPropId, wchar_t * pszThemeFileName, int cchMaxBuffChars);
extern PACKAGE HRESULT __stdcall GetThemeFont(unsigned hTheme, HDC DC, int iPartId, int iStateId, int iPropId, /* out */ tagLOGFONTW &Font);
extern PACKAGE HRESULT __stdcall GetThemeInt(unsigned hTheme, int iPartId, int iStateId, int iPropId, /* out */ int &iVal);
extern PACKAGE HRESULT __stdcall GetThemeIntList(unsigned hTheme, int iPartId, int iStateId, int iPropId, /* out */ _INTLIST &IntList);
extern PACKAGE HRESULT __stdcall GetThemeMargins(unsigned hTheme, HDC DC, int iPartId, int iStateId, int iPropId, Types::PRect prc, /* out */ _MARGINS &Margins);
extern PACKAGE HRESULT __stdcall GetThemeMetric(unsigned hTheme, HDC DC, int iPartId, int iStateId, int iPropId, /* out */ int &iVal);
extern PACKAGE HRESULT __stdcall GetThemePartSize(unsigned hTheme, HDC DC, int iPartId, int iStateId, Types::PRect prc, int eSize, Types::PSize psz);
extern PACKAGE HRESULT __stdcall GetThemePosition(unsigned hTheme, int iPartId, int iStateId, int iPropId, /* out */ Types::TPoint &Point);
extern PACKAGE HRESULT __stdcall GetThemePropertyOrigin(unsigned hTheme, int iPartId, int iStateId, int iPropId, /* out */ PROPERTYORIGIN &Origin);
extern PACKAGE HRESULT __stdcall GetThemeRect(unsigned hTheme, int iPartId, int iStateId, int iPropId, /* out */ Types::TRect &Rect);
extern PACKAGE HRESULT __stdcall GetThemeString(unsigned hTheme, int iPartId, int iStateId, int iPropId, wchar_t * pszBuff, int cchMaxBuffChars);
extern PACKAGE BOOL __stdcall GetThemeSysBool(unsigned hTheme, int iBoolId);
extern PACKAGE unsigned __stdcall GetThemeSysColor(unsigned hTheme, int iColorId);
extern PACKAGE HBRUSH __stdcall GetThemeSysColorBrush(unsigned hTheme, int iColorId);
extern PACKAGE HRESULT __stdcall GetThemeSysFont(unsigned hTheme, int iFontId, /* out */ tagLOGFONTW &lf);
extern PACKAGE HRESULT __stdcall GetThemeSysInt(unsigned hTheme, int iIntId, int &iValue);
extern PACKAGE int __stdcall GetThemeSysSize(unsigned hTheme, int iSizeId);
extern PACKAGE HRESULT __stdcall GetThemeSysString(unsigned hTheme, int iStringId, wchar_t * pszStringBuff, int cchMaxStringChars);
extern PACKAGE HRESULT __stdcall GetThemeTextExtent(unsigned hTheme, HDC DC, int iPartId, int iStateId, wchar_t * pszTextL, int iCharCount, unsigned dwTextFlags, Types::PRect pBoundingRect, /* out */ Types::TRect &ExtentRect);
extern PACKAGE HRESULT __stdcall GetThemeTextMetrics(unsigned hTheme, HDC DC, int iPartId, int iStateId, /* out */ tagTEXTMETRICA &tm);
extern PACKAGE unsigned __stdcall GetWindowTheme(HWND hWnd);
extern PACKAGE HRESULT __stdcall HitTestThemeBackground(unsigned hTheme, HDC DC, int iPartId, int iStateId, unsigned dwOptions, Types::PRect pRect, HRGN hRgn, const Types::TPoint ptTest, /* out */ Word &wHitTestCode);
extern PACKAGE BOOL __stdcall IsAppThemed(void);
extern PACKAGE BOOL __stdcall IsThemeActive(void);
extern PACKAGE BOOL __stdcall IsThemeBackgroundPartiallyTransparent(unsigned hTheme, int iPartId, int iStateId);
extern PACKAGE BOOL __stdcall IsThemeDialogTextureEnabled(HWND hWnd);
extern PACKAGE BOOL __stdcall IsThemePartDefined(unsigned hTheme, int iPartId, int iStateId);
extern PACKAGE unsigned __stdcall OpenThemeData(HWND hWnd, wchar_t * pszClassList);
extern PACKAGE void __stdcall SetThemeAppProperties(unsigned dwFlags);
extern PACKAGE HRESULT __stdcall SetWindowTheme(HWND hWnd, wchar_t * pszSubAppName, wchar_t * pszSubIdList);
extern PACKAGE bool __fastcall IsThemeLibraryLoaded(void);
extern PACKAGE bool __fastcall IsWindowsXPOrLater(void);

}	/* namespace Dxuxtheme */
using namespace Dxuxtheme;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// dxUxTheme
