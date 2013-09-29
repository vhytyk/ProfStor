// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'dxOffice11.pas' rev: 6.00

#ifndef dxOffice11HPP
#define dxOffice11HPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Classes.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <TypInfo.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Dxoffice11
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TOffice11Scheme { schUnknown, schNormalColor, schHomestead, schMetallic };
#pragma option pop

typedef TOffice11Scheme TOffice11SchemeColor;

//-- var, const, procedure ---------------------------------------------------
extern PACKAGE unsigned dxOffice11DockColor1;
extern PACKAGE unsigned dxOffice11DockColor2;
extern PACKAGE unsigned dxOffice11ToolbarsColor1;
extern PACKAGE unsigned dxOffice11ToolbarsColor2;
extern PACKAGE unsigned dxOffice11BarMarkColors1[3];
extern PACKAGE unsigned dxOffice11BarMarkColors2[3];
extern PACKAGE unsigned dxOffice11BarBorderColors[2];
extern PACKAGE unsigned dxOffice11BarBorderMarkColors[2][3];
extern PACKAGE unsigned dxOffice11BarFingerColor1;
extern PACKAGE unsigned dxOffice11BarFingerColor2;
extern PACKAGE unsigned dxOffice11BarSeparatorColor1;
extern PACKAGE unsigned dxOffice11BarSeparatorColor2;
extern PACKAGE unsigned dxOffice11BarMarkArrowColor1;
extern PACKAGE unsigned dxOffice11BarMarkArrowColor2;
extern PACKAGE unsigned dxOffice11BarFloatingBorderColor1;
extern PACKAGE unsigned dxOffice11BarFloatingBorderColor2;
extern PACKAGE unsigned dxOffice11BarFloatingBorderColor3;
extern PACKAGE unsigned dxOffice11BarFloatingCaptionColor;
extern PACKAGE unsigned dxOffice11BarFloatingCaptionTextColor1;
extern PACKAGE unsigned dxOffice11BarFloatingCaptionTextColor2;
extern PACKAGE unsigned dxOffice11BarFloatingCaptionTextColor3;
extern PACKAGE unsigned dxOffice11MenuColor;
extern PACKAGE unsigned dxOffice11MenuDownedColor1;
extern PACKAGE unsigned dxOffice11MenuDownedColor2;
extern PACKAGE unsigned dxOffice11MenuIndentColor1;
extern PACKAGE unsigned dxOffice11MenuIndentColor2;
extern PACKAGE unsigned dxOffice11MenuNonRecentIndentColor1;
extern PACKAGE unsigned dxOffice11MenuNonRecentIndentColor2;
extern PACKAGE unsigned dxOffice11DropDownBorderColor1;
extern PACKAGE unsigned dxOffice11DropDownBorderColor2;
extern PACKAGE unsigned dxOffice11ToolbarSelectedColor;
extern PACKAGE unsigned dxOffice11SelectedBorderColor;
extern PACKAGE unsigned dxOffice11SelectedColor1;
extern PACKAGE unsigned dxOffice11SelectedColor2;
extern PACKAGE unsigned dxOffice11SelectedDownColor1;
extern PACKAGE unsigned dxOffice11SelectedDownColor2;
extern PACKAGE unsigned dxOffice11OwnerControlDownedColor;
extern PACKAGE unsigned dxOffice11DownedColor;
extern PACKAGE unsigned dxOffice11DownedSelectedColor;
extern PACKAGE unsigned dxOffice11DetachableColor;
extern PACKAGE unsigned dxOffice11DetachableSelectedColor;
extern PACKAGE unsigned dxOffice11TextEnabledColor;
extern PACKAGE unsigned dxOffice11TextDisabledColor;
extern PACKAGE unsigned dxOffice11StaticBorderColor;
extern PACKAGE unsigned dxOffice11DateHeaderColor;
extern PACKAGE unsigned dxOffice11InPlaceSubItemColor;
extern PACKAGE unsigned dxOffice11InPlaceSubItemTextColor;
extern PACKAGE HBRUSH dxOffice11BarFingerBrush1;
extern PACKAGE HBRUSH dxOffice11BarFingerBrush2;
extern PACKAGE HBRUSH dxOffice11BarSeparatorBrush1;
extern PACKAGE HBRUSH dxOffice11BarSeparatorBrush2;
extern PACKAGE HBRUSH dxOffice11MenuBrush;
extern PACKAGE HBRUSH dxOffice11SelectedBorderBrush;
extern PACKAGE HBRUSH dxOffice11ToolbarSelectedBrush;
extern PACKAGE HBRUSH dxOffice11OwnerControlDownedBrush;
extern PACKAGE HBRUSH dxOffice11DownedBrush;
extern PACKAGE HBRUSH dxOffice11DownedSelectedBrush;
extern PACKAGE HBRUSH dxOffice11DropDownBorderBrush1;
extern PACKAGE HBRUSH dxOffice11DropDownBorderBrush2;
extern PACKAGE HBRUSH dxOffice11DetachableBrush;
extern PACKAGE HBRUSH dxOffice11DetachableSelectedBrush;
extern PACKAGE HBRUSH dxOffice11StaticBorderBrush;
extern PACKAGE HBRUSH dxOffice11InPlaceSubItemBrush;
extern PACKAGE Graphics::TBitmap* dxOffice11SubMenuExpandBitmap;
extern PACKAGE unsigned __fastcall GetLightColor(int ABtnFaceColorPart, int AHighlightColorPart, int AWindowColorPart);
extern PACKAGE unsigned __fastcall GetMiddleRGB(Graphics::TColor AColor1, Graphics::TColor AColor2, int APercent);
extern PACKAGE void __fastcall CreateOffice11Colors(void);
extern PACKAGE void __fastcall RefreshOffice11Colors(void);
extern PACKAGE void __fastcall ReleaseOffice11Colors(void);
extern PACKAGE void __fastcall FillGradientRect(HDC DC, const Types::TRect &ARect, Graphics::TColor AColor1, Graphics::TColor AColor2, bool AHorizontal);
extern PACKAGE void __fastcall FillTubeGradientRect(HDC DC, const Types::TRect &ARect, Graphics::TColor AColor1, Graphics::TColor AColor2, bool AHorizontal);
extern PACKAGE void __fastcall FillRectByColor(HDC DC, const Types::TRect &R, Graphics::TColor AColor);
extern PACKAGE void __fastcall FrameRectByColor(HDC DC, const Types::TRect &R, Graphics::TColor AColor);
extern PACKAGE unsigned __fastcall GetGradientColorRect(const Types::TRect &ARect, int X, Graphics::TColor AColor1, Graphics::TColor AColor2, bool AHorizontal);
extern PACKAGE void __fastcall Office11FrameSelectedRect(HDC DC, const Types::TRect &R);
extern PACKAGE void __fastcall Office11DrawFingerElements(HDC DC, const Types::TRect &ARect, bool AHorizontal);
extern PACKAGE void __fastcall Office11DrawItemArrow(HDC DC, const Types::TRect &R, bool ADownArrow, bool Enabled, bool Selected, bool Flat);
extern PACKAGE void __fastcall Office11DrawLargeItemArrow(HDC DC, const Types::TRect &R, bool ADownArrow, int Size, bool Selected, bool Enabled, bool Flat);
extern PACKAGE void __fastcall Office11DrawSizeGrip(HDC DC, const Types::TRect &ARect);

}	/* namespace Dxoffice11 */
using namespace Dxoffice11;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// dxOffice11
