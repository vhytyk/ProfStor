// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxEditUtils.pas' rev: 6.00

#ifndef cxEditUtilsHPP
#define cxEditUtilsHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Types.hpp>	// Pascal unit
#include <cxTextEdit.hpp>	// Pascal unit
#include <cxSpinEdit.hpp>	// Pascal unit
#include <cxScrollBar.hpp>	// Pascal unit
#include <cxMemo.hpp>	// Pascal unit
#include <cxLookAndFeelPainters.hpp>	// Pascal unit
#include <cxLookAndFeels.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <cxEditPaintUtils.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxDropDownEdit.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <cxCheckBox.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <ImgList.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Variants.hpp>	// Pascal unit
#include <dxThemeManager.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxeditutils
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TcxEditBackgroundPaintingStyle { bpsSolid, bpsComboEdit, bpsComboListEdit };
#pragma option pop

typedef HDC TcxEditCanvasHandle;

//-- var, const, procedure ---------------------------------------------------
static const Shortint cxEditButtonMaxBorderWidth = 0x2;
static const Shortint cxEditMaxBorderWidth = 0x2;
static const Shortint cxEditMaxCheckBoxBorderWidth = 0x2;
static const Shortint cxEditShadowWidth = 0x3;
extern PACKAGE Types::TRect cxEmptyRect;
extern PACKAGE bool __fastcall AreVisualStylesMustBeUsed(bool NativeEditStyle, Dxthememanager::TdxThemedObjectType AThemedObjectType);
extern PACKAGE void __fastcall DrawArrow(Cxgraphics::TcxCanvas* ACanvas, int AArrowSize, const Types::TRect &AContentRect, Cxlookandfeelpainters::TcxArrowDirection AArrowDirection, bool AIsDoubleArrow, bool AIsPressed, Graphics::TColor AColor);
extern PACKAGE void __fastcall CalculateCheckBoxViewInfo(Cxcheckbox::TcxCustomCheckBoxViewData* AViewData, Cxcheckbox::TcxCustomCheckBoxViewInfo* AViewInfo, bool AIsMouseEvent);
extern PACKAGE void __fastcall DrawGlyph(Cxgraphics::TcxCanvas* ACanvas, int X, int Y, Graphics::TBitmap* AGlyph, bool AEnabled, Graphics::TColor ABrushColor = (Graphics::TColor)(0x1fffffff), Graphics::TBitmap* ABackgroundBitmap = (Graphics::TBitmap*)(0x0))/* overload */;
extern PACKAGE void __fastcall DrawGlyph(Cxgraphics::TcxCanvas* ACanvas, Imglist::TCustomImageList* AImageList, Imglist::TImageIndex AImageIndex, const Types::TRect &AGlyphRect, Graphics::TColor ABrushColor, bool AEnabled, Graphics::TBitmap* ABackgroundBitmap = (Graphics::TBitmap*)(0x0))/* overload */;
extern PACKAGE void __fastcall InternalPolyLine(Cxgraphics::TcxCanvas* ACanvas, const Types::TPoint * Points, const int Points_Size, Graphics::TColor AColor, bool AOrtoDrawing = false);
extern PACKAGE bool __fastcall VerifyBitmap(Graphics::TBitmap* ABitmap);
extern PACKAGE void __fastcall CalculateCustomCheckBoxViewInfo(Cxgraphics::TcxCanvas* ACanvas, Cxcheckbox::TcxCustomCheckBoxViewData* AViewData, Cxcheckbox::TcxCustomCheckBoxViewInfo* AViewInfo);
extern PACKAGE void __fastcall CalculateCustomEditViewInfo(Cxedit::TcxCustomEditViewData* AViewData, Cxedit::TcxCustomEditViewInfo* AViewInfo, bool AIsMouseEvent);
extern PACKAGE void __fastcall CalculateEditButtonState(Cxedit::TcxEditButtonViewInfo* AViewInfo);
extern PACKAGE int __fastcall CalculateEditDefaultButtonWidth(Cxgraphics::TcxCanvas* ACanvas, Cxedit::TcxEditButtonViewInfo* AViewInfo);
extern PACKAGE void __fastcall CalculateEditPopupWindowViewInfo(Cxdropdownedit::TcxCustomEditPopupWindowViewInfo* AViewInfo);
extern PACKAGE void __fastcall CalculateSpinEditViewInfo(Cxspinedit::TcxSpinEditViewData* AViewData, Cxspinedit::TcxSpinEditViewInfo* AViewInfo);
extern PACKAGE void __fastcall CalculateTextEditViewInfo(Cxgraphics::TcxCanvas* ACanvas, Cxtextedit::TcxCustomTextEditViewData* AViewData, Cxtextedit::TcxCustomTextEditViewInfo* AViewInfo, bool AIsMouseEvent);
extern PACKAGE void __fastcall cxEditFillRect(HDC ACanvasHandle, const Types::TRect &R, HBRUSH ABrush);
extern PACKAGE int __fastcall cxTextOutFlagsToDrawTextFlags(unsigned AFlags);
extern PACKAGE void __fastcall DrawCheckBoxText(Cxgraphics::TcxCanvas* ACanvas, Cxcheckbox::TcxCustomCheckBoxViewInfo* AViewInfo);
extern PACKAGE void __fastcall DrawCustomCheckBox(Cxgraphics::TcxCanvas* ACanvas, Cxcheckbox::TcxCustomCheckBoxViewInfo* AViewInfo);
extern PACKAGE int __fastcall DrawTextFlagsTocxTextOutFlags(unsigned AFlags);
extern PACKAGE void __fastcall InternalFillRect(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &AOuterRect, const Types::TRect &AInternalRect, HBRUSH ABrush);
extern PACKAGE void __fastcall DrawCustomEdit(Cxgraphics::TcxCanvas* ACanvas, Cxedit::TcxCustomEditViewInfo* AViewInfo, bool ADrawBackground, TcxEditBackgroundPaintingStyle ABackgroundStyle);
extern PACKAGE void __fastcall DrawEditButton(Cxgraphics::TcxCanvas* ACanvas, Cxedit::TcxCustomEditViewInfo* AViewInfo, int AButtonVisibleIndex);
extern PACKAGE void __fastcall DrawEditButtonBorder(Cxgraphics::TcxCanvas* ACanvas, Cxedit::TcxCustomEditViewInfo* AViewInfo, int AButtonVisibleIndex, Cxedit::TcxEditButtonStyle AButtonStyle, const Types::TRect &ARect);
extern PACKAGE void __fastcall DrawEditButtonContent(Cxgraphics::TcxCanvas* ACanvas, Cxedit::TcxCustomEditViewInfo* AViewInfo, int AButtonVisibleIndex, const Types::TRect &AContentRect, Graphics::TColor APenColor, Graphics::TColor ABrushColor);
extern PACKAGE void __fastcall DrawEditPopupCloseButton(Cxgraphics::TcxCanvas* ACanvas, Cxdropdownedit::TcxCustomEditPopupWindowViewInfo* AViewInfo);
extern PACKAGE void __fastcall DrawEditPopupWindowBorder(Cxgraphics::TcxCanvas* ACanvas, Cxdropdownedit::TcxCustomEditPopupWindowViewInfo* AViewInfo, Types::TRect &R);
extern PACKAGE void __fastcall DrawEditPopupWindowFrame(Cxgraphics::TcxCanvas* ACanvas, Cxdropdownedit::TcxCustomEditPopupWindowViewInfo* AViewInfo);
extern PACKAGE void __fastcall DrawEditText(Cxgraphics::TcxCanvas* ACanvas, Cxtextedit::TcxCustomTextEditViewInfo* AViewInfo);
extern PACKAGE void __fastcall DrawMemo(Cxgraphics::TcxCanvas* ACanvas, Cxmemo::TcxCustomMemoViewInfo* AViewInfo);
extern PACKAGE void __fastcall DrawPopupEditPopupWindowBorder(Cxgraphics::TcxCanvas* ACanvas, Cxdropdownedit::TcxCustomEditPopupWindowViewInfo* AViewInfo, Types::TRect &R);
extern PACKAGE void __fastcall DrawSizeGrip(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ARect, Cxdropdownedit::TcxEditCorner ACorner, bool ANativeStyle, bool AIsTransparent = false);
extern PACKAGE void __fastcall DrawSpinEdit(Cxgraphics::TcxCanvas* ACanvas, Cxspinedit::TcxSpinEditViewInfo* AViewInfo);
extern PACKAGE void __fastcall DrawSpinEditButtonBorder(Cxgraphics::TcxCanvas* ACanvas, Cxspinedit::TcxSpinEditViewInfo* AViewInfo, int AButtonVisibleIndex, Cxedit::TcxEditButtonStyle AButtonStyle, const Types::TRect &ARect);
extern PACKAGE void __fastcall DrawSpinEditButtonContent(Cxgraphics::TcxCanvas* ACanvas, Cxspinedit::TcxSpinEditViewInfo* AViewInfo, int AButtonVisibleIndex, const Types::TRect &AContentRect, Graphics::TColor APenColor, Graphics::TColor ABrushColor);
extern PACKAGE void __fastcall DrawTextEdit(Cxgraphics::TcxCanvas* ACanvas, Cxtextedit::TcxCustomTextEditViewInfo* AViewInfo);
extern PACKAGE tagSIZE __fastcall GetArrowSize(const tagSIZE &AContentSize, Cxlookandfeelpainters::TcxArrowDirection AArrowDirection);
extern PACKAGE tagSIZE __fastcall GetCheckBoxContentSize(Cxgraphics::TcxCanvas* ACanvas, Cxedit::TcxCustomEditViewData* AViewData, const AnsiString AText, int ADrawTextFlags, bool AIsInplace, const Cxedit::PcxEditSizeProperties APEditSizeProperties, bool ACorrectWidth = true);
extern PACKAGE tagSIZE __fastcall GetCustomEditSize(Cxgraphics::TcxCanvas* ACanvas, Cxedit::TcxCustomEditViewData* AViewData, bool AIsInplace, Cxedit::PcxEditSizeProperties APEditSizeProperties);
extern PACKAGE int __fastcall GetEditButtonsContentVerticalOffset(Cxgraphics::TcxCanvas* ACanvas, Cxedit::TcxCustomEditViewInfo* AViewInfo);
extern PACKAGE tagSIZE __fastcall GetEditCheckSize(Cxgraphics::TcxCanvas* ACanvas, Cxcheckbox::TcxCustomCheckBoxViewData* AViewData, Cxcheckbox::TcxCustomCheckBoxViewInfo* AViewInfo);
extern PACKAGE tagSIZE __fastcall GetTextEditContentSize(Cxgraphics::TcxCanvas* ACanvas, Cxedit::TcxCustomEditViewData* AViewData, const AnsiString AText, unsigned ADrawTextFlags, const Cxedit::PcxEditSizeProperties APEditSizeProperties, bool ACorrectWidth = true);
extern PACKAGE tagSIZE __fastcall GetTextEditContentSizeCorrection(Cxedit::TcxCustomEditViewData* AViewData);
extern PACKAGE Types::TRect __fastcall GetEditBorderExtent(Cxedit::TcxCustomEditViewData* AViewData);
extern PACKAGE int __fastcall GetEditBorderWidth(Cxedit::TcxEditBorderStyle ABorderStyle);
extern PACKAGE Types::TRect __fastcall GetEditButtonsExtent(Cxgraphics::TcxCanvas* ACanvas, Cxedit::TcxCustomEditViewData* AViewData);
extern PACKAGE Cxgraphics::TcxRegion* __fastcall GetEditButtonRegion(Cxgraphics::TcxCanvas* ACanvas, Cxedit::TcxEditButtonViewInfo* AViewInfo);
extern PACKAGE void __fastcall GetEditColorSettings(Cxedit::TcxCustomEditViewData* AViewData, Cxedit::TcxCustomEditViewInfo* AViewInfo, Graphics::TColor &FillColor, Graphics::TColor &TextColor);
extern PACKAGE int __fastcall GetEditPopupWindowClientEdgeWidth(Cxdropdownedit::TcxCustomEditPopupWindowViewInfo* AViewInfo);
extern PACKAGE Types::TRect __fastcall GetEditPopupWindowFrameExtent(Cxdropdownedit::TcxCustomEditPopupWindowViewInfo* AViewInfo);
extern PACKAGE int __fastcall GetEditPopupWindowBorderWidth(Cxdropdownedit::TcxCustomEditPopupWindowViewInfo* AViewInfo, bool AIncludeClientEdge);
extern PACKAGE Types::TRect __fastcall GetEditPopupWindowOwnerControlBounds(Cxedit::TcxCustomEditViewInfo* AViewInfo);
extern PACKAGE int __fastcall GetEditPopupWindowSysPanelDefaultHeight(Cxdropdownedit::TcxCustomEditPopupWindowViewInfo* AViewInfo);
extern PACKAGE Types::TRect __fastcall GetEditVisibleBounds(Cxedit::TcxCustomEditViewInfo* AViewInfo, const Types::TRect &ABounds);
extern PACKAGE Types::TRect __fastcall GetMemoDrawTextOffset(Cxmemo::TcxCustomMemoViewData* AViewData);
extern PACKAGE Types::TRect __fastcall GetTextEditDrawTextOffset(Cxedit::TcxCustomEditViewData* AViewData)/* overload */;
extern PACKAGE Types::TRect __fastcall GetTextEditDrawTextOffset(Classes::TAlignment AAlignment, bool AIsInplace)/* overload */;
extern PACKAGE bool __fastcall IsShadowDrawingNeeded(Cxedit::TcxCustomEditViewData* AViewData);
extern PACKAGE void __fastcall PrepareTextEditDrawTextFlags(Cxgraphics::TcxCanvas* ACanvas, Cxtextedit::TcxCustomTextEditViewData* AViewData, Cxtextedit::TcxCustomTextEditViewInfo* AViewInfo);
extern PACKAGE AnsiString __fastcall RemoveAccelChars(const AnsiString S);
extern PACKAGE void __fastcall SetEditPopupWindowShadowRegion(Cxdropdownedit::TcxCustomEditPopupWindow* APopupWindow);
extern PACKAGE void __fastcall SetEditWindowShadowRegion(Cxedit::TcxCustomEditViewInfo* AViewInfo, HWND AEditWindowHandle);

}	/* namespace Cxeditutils */
using namespace Cxeditutils;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxEditUtils
