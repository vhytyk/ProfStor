// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxExtEditUtils.pas' rev: 6.00

#ifndef cxExtEditUtilsHPP
#define cxExtEditUtilsHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxColorComboBox.hpp>	// Pascal unit
#include <cxTrackBar.hpp>	// Pascal unit
#include <cxProgressBar.hpp>	// Pascal unit
#include <cxCheckBox.hpp>	// Pascal unit
#include <cxEditUtils.hpp>	// Pascal unit
#include <cxLabel.hpp>	// Pascal unit
#include <cxVariants.hpp>	// Pascal unit
#include <cxEditPaintUtils.hpp>	// Pascal unit
#include <cxLookAndFeelPainters.hpp>	// Pascal unit
#include <cxLookAndFeels.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <cxTextEdit.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <ImgList.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Variants.hpp>	// Pascal unit
#include <dxThemeManager.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxexteditutils
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxCustomCheckPaintHelper;
class PASCALIMPLEMENTATION TcxCustomCheckPaintHelper : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	Classes::TPersistent* FOwner;
	Cxedit::TcxCustomEditStyle* FStyle;
	Graphics::TBitmap* FGlyph;
	int FGlyphCount;
	void __fastcall SetStyle(Cxedit::TcxCustomEditStyle* Value);
	bool __fastcall HasGlyph(void);
	
protected:
	__property Classes::TPersistent* Owner = {read=FOwner, write=FOwner};
	virtual Cxcheckbox::TcxCheckBoxState __fastcall GetNextState(Cxcheckbox::TcxCheckBoxState Value, bool AllowGrayed);
	__property Cxedit::TcxCustomEditStyle* Style = {read=FStyle, write=SetStyle};
	__property Graphics::TBitmap* Glyph = {read=FGlyph, write=FGlyph};
	__property int GlyphCount = {read=FGlyphCount, write=FGlyphCount, nodefault};
	virtual void __fastcall DrawCheck(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ARect, const Cxcheckbox::TcxCheckBoxState ACheckState, const bool AEnabled, const int MinLeft = 0x0, const int MinTop = 0x0);
	virtual Types::TRect __fastcall CalcTextRect(const Types::TRect &ARect, const Cxcheckbox::TcxCheckBoxState ACheckState);
	virtual Types::TPoint __fastcall CalcCheckPoint(const Types::TRect &ARect, const Cxcheckbox::TcxCheckBoxState ACheckState);
	bool __fastcall IsClickInCheck(const Types::TRect &AItemRect, const Cxcheckbox::TcxCheckBoxState ACheckState, int X, int Y, const bool AUseRightToLeftAlignment = false);
	virtual int __fastcall GetCheckWidth(void);
	
public:
	__fastcall TcxCustomCheckPaintHelper(Classes::TPersistent* AOwner);
	__fastcall virtual ~TcxCustomCheckPaintHelper(void);
};


class DELPHICLASS TcxControlHook;
class PASCALIMPLEMENTATION TcxControlHook : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	Controls::TWinControl* FControl;
	void *FNewWndProc;
	void *FPrevWndProc;
	bool FDestroying;
	
protected:
	virtual void __fastcall SetWinControl(Controls::TWinControl* Value);
	virtual void __fastcall HookWndProc(Messages::TMessage &AMsg);
	
public:
	__fastcall TcxControlHook(void);
	__fastcall virtual ~TcxControlHook(void);
	virtual void __fastcall HookControl(void);
	virtual void __fastcall UnHookControl(void);
	__property Controls::TWinControl* WinControl = {read=FControl, write=SetWinControl};
	__property bool IsDestroying = {read=FDestroying, nodefault};
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE void __fastcall CalculateLabelViewInfo(Cxlabel::TcxCustomLabelViewData* AViewData, Cxlabel::TcxCustomLabelViewInfo* AViewInfo, bool AIsMouseEvent);
extern PACKAGE void __fastcall DrawColorBox(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ARect, const Graphics::TColor AFrameColor, const Graphics::TColor ABoxColor, const Graphics::TColor ABkColor, const Cxcolorcombobox::TcxDefaultColorStyle DefaultColorStyle);
extern PACKAGE Types::TRect __fastcall DrawBounds(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &Bounds, const Graphics::TColor AUpperLeftColor, const Graphics::TColor ALowerRightColor);
extern PACKAGE void __fastcall DrawCanvasLine(Graphics::TCanvas* ACanvas, const Graphics::TColor AColor, const Types::TPoint &AFromPoint, const Types::TPoint &AToPoint);
extern PACKAGE void __fastcall InflateRectEx(Types::TRect &R, const int AlOffset, const int AtOffset, const int ArOffset, const int AbOffset);
extern PACKAGE int __fastcall RectWidth(const Types::TRect &ARect);
extern PACKAGE int __fastcall RectHeight(const Types::TRect &ARect);
extern PACKAGE int __fastcall PrepareTextFlag(const int AStartFlag, const Classes::TAlignment AHorzAlignments, const Cxclasses::TcxAlignmentVert AVertAlignments, const bool AShowEndEllipsis, const bool AWordWrap, const int ATabWidth = 0x0);
extern PACKAGE int __fastcall NonCanvasTextHeight(const Graphics::TFont* AFont);
extern PACKAGE int __fastcall NonCanvasTextWidth(const Graphics::TFont* AFont, const AnsiString AText);
extern PACKAGE int __fastcall CalcMaxWidth(Graphics::TCanvas* ACanvas, const AnsiString AText);
extern PACKAGE Graphics::TColor __fastcall IncColor(const Graphics::TColor AColor, const int AR, const int AG, const int AB);
extern PACKAGE int __fastcall CalcCenterPosHeight(const Types::TRect &ARect, const int ADrawHeight);
extern PACKAGE int __fastcall CalcDrawWidth(const Types::TRect &ARect, const int ADrawHeight);
extern PACKAGE void __fastcall CalculateCustomProgressBarViewInfo(Cxgraphics::TcxCanvas* ACanvas, Cxprogressbar::TcxCustomProgressBarViewData* AViewData, Cxprogressbar::TcxCustomProgressBarViewInfo* AViewInfo);
extern PACKAGE void __fastcall CalculateCustomTrackBarViewInfo(Cxgraphics::TcxCanvas* ACanvas, Cxtrackbar::TcxCustomTrackBarViewData* AViewData, Cxtrackbar::TcxCustomTrackBarViewInfo* AViewInfo);
extern PACKAGE void __fastcall CalculateCustomLabelViewInfo(Cxgraphics::TcxCanvas* ACanvas, Cxlabel::TcxCustomLabelViewData* AViewData, Cxlabel::TcxCustomLabelViewInfo* AViewInfo);
extern PACKAGE bool __fastcall IsVarEmpty(const Variant &AValue);
extern PACKAGE bool __fastcall IsValidStringForInt(const AnsiString AValue);
extern PACKAGE bool __fastcall IsValidStringForDouble(const AnsiString AValue);
extern PACKAGE bool __fastcall VarIsInteger(const Variant &AValue);
extern PACKAGE bool __fastcall VarIsDouble(const Variant &AValue);
extern PACKAGE __int64 __fastcall GetMaxVarInteger(const Variant &AValue);
extern PACKAGE Extended __fastcall GetMaxVarDouble(const Variant &AValue);
extern PACKAGE int __fastcall cxStrToInt(const AnsiString AValue, const bool AToFirstNonNum = false);
extern PACKAGE Extended __fastcall cxStrToFloat(const AnsiString AValue, const bool AToFirstNonNum = false);
extern PACKAGE Graphics::TColor __fastcall cxStringToColor(const AnsiString AString, /* out */ bool &Valid);
extern PACKAGE Graphics::TColor __fastcall cxRGBStringColorToColor(const AnsiString AString);
extern PACKAGE Graphics::TColor __fastcall cxHexRGBStringColorToColor(const AnsiString AString);
extern PACKAGE void __fastcall DrawBottomRightThumb(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &AThumbRect, const Cxtrackbar::TcxTrackBarOrientation AOrientation, const int AThumbSize, const Cxlookandfeels::TcxLookAndFeelKind AKind, const Graphics::TColor AThumbColor);
extern PACKAGE void __fastcall DrawTopLeftThumb(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &AThumbRect, const Cxtrackbar::TcxTrackBarOrientation AOrientation, const int AThumbSize, const Cxlookandfeels::TcxLookAndFeelKind AKind, const Graphics::TColor AThumbColor);
extern PACKAGE AnsiString __fastcall CheckStateToString(const Cxcheckbox::TcxCheckBoxState Value);
extern PACKAGE Cxcheckbox::TcxCheckBoxState __fastcall StringToCheckState(const AnsiString Value, const bool AllowGrayed);
extern PACKAGE Classes::TShiftState __fastcall CurrentShiftState(void);
extern PACKAGE AnsiString __fastcall GetWord(const int APosition, const AnsiString S, const char Delimiter);
extern PACKAGE void __fastcall PaintBackground(const Controls::TWinControl* AControl, HDC DC, bool DoParent);

}	/* namespace Cxexteditutils */
using namespace Cxexteditutils;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxExtEditUtils
