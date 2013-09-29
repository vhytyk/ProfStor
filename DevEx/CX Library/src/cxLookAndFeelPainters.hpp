// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxLookAndFeelPainters.pas' rev: 6.00

#ifndef cxLookAndFeelPaintersHPP
#define cxLookAndFeelPaintersHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxGraphics.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <ImgList.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Types.hpp>	// Pascal unit
#include <dxThemeConsts.hpp>	// Pascal unit
#include <dxThemeManager.hpp>	// Pascal unit
#include <dxUxTheme.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxlookandfeelpainters
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TcxLookAndFeelStyle { lfsFlat, lfsStandard, lfsUltraFlat, lfsNative };
#pragma option pop

#pragma option push -b-
enum TcxArrowDirection { adUp, adDown, adLeft, adRight };
#pragma option pop

typedef Types::TPoint TcxArrowPoints[3];

#pragma option push -b-
enum TcxButtonState { cxbsDefault, cxbsNormal, cxbsHot, cxbsPressed, cxbsDisabled };
#pragma option pop

#pragma option push -b-
enum TcxIndicatorKind { ikNone, ikArrow, ikEdit, ikInsert, ikMultiDot, ikMultiArrow };
#pragma option pop

#pragma option push -b-
enum TcxNeighbor { nLeft, nTop, nRight, nBottom };
#pragma option pop

typedef Set<TcxNeighbor, nLeft, nBottom>  TcxNeighbors;

#pragma option push -b-
enum TcxScrollBarPart { sbpNone, sbpLineUp, sbpLineDown, sbpThumbnail, sbpPageUp, sbpPageDown };
#pragma option pop

#pragma option push -b-
enum TcxPopupBorderStyle { pbsNone, pbsUltraFlat, pbsFlat, pbs3D };
#pragma option pop

typedef bool __fastcall (__closure *TcxDrawBackgroundEvent)(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ABounds);

typedef TMetaClass*TcxCustomLookAndFeelPainterClass;

class DELPHICLASS TcxCustomLookAndFeelPainter;
class PASCALIMPLEMENTATION TcxCustomLookAndFeelPainter : public System::TObject 
{
	typedef System::TObject inherited;
	
protected:
	/* virtual class method */ virtual bool __fastcall DoubleBuffered(TMetaClass* vmt);
	/* virtual class method */ virtual void __fastcall DrawButtonArrow(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, Graphics::TColor AColor);
	/*         class method */ static void __fastcall DrawButtonCross(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, Graphics::TColor AColor, TcxButtonState AState);
	/* virtual class method */ virtual void __fastcall DrawContent(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ABounds, const Types::TRect &ATextAreaBounds, Classes::TAlignment AAlignmentHorz, Cxclasses::TcxAlignmentVert AAlignmentVert, bool AMultiLine, bool AShowEndEllipsis, const AnsiString AText, Graphics::TFont* AFont, Graphics::TColor ATextColor, Graphics::TColor ABkColor, TcxDrawBackgroundEvent AOnDrawBackground = 0x0);
	/*         class method */ static void __fastcall DrawExpandButtonCross(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, bool AExpanded, Graphics::TColor AColor);
	/*         class method */ static void __fastcall DrawIndicatorImage(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, TcxIndicatorKind AKind);
	/*         class method */ static void __fastcall DrawSortingArrow(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, Graphics::TColor AColor1, Graphics::TColor AColor2, bool AAscendingSorting);
	/* virtual class method */ virtual Types::TRect __fastcall FooterCellContentBounds(TMetaClass* vmt, const Types::TRect &ABounds);
	/* virtual class method */ virtual Types::TRect __fastcall FooterCellTextAreaBounds(TMetaClass* vmt, const Types::TRect &ABounds);
	/*         class method */ static TcxArrowDirection __fastcall GetArrowDirection(TMetaClass* vmt, bool AHorizontal, TcxScrollBarPart APart);
	
public:
	/* virtual class method */ virtual TcxLookAndFeelStyle __fastcall LookAndFeelStyle(TMetaClass* vmt);
	/* virtual class method */ virtual Graphics::TColor __fastcall DefaultContentColor(TMetaClass* vmt);
	/* virtual class method */ virtual Graphics::TColor __fastcall DefaultContentTextColor(TMetaClass* vmt);
	/* virtual class method */ virtual Graphics::TColor __fastcall DefaultFilterBoxColor(TMetaClass* vmt);
	/* virtual class method */ virtual Graphics::TColor __fastcall DefaultFilterBoxTextColor(TMetaClass* vmt);
	/* virtual class method */ virtual Graphics::TColor __fastcall DefaultFixedSeparatorColor(TMetaClass* vmt);
	/* virtual class method */ virtual Graphics::TColor __fastcall DefaultFooterColor(TMetaClass* vmt);
	/* virtual class method */ virtual Graphics::TColor __fastcall DefaultFooterTextColor(TMetaClass* vmt);
	/* virtual class method */ virtual Graphics::TColor __fastcall DefaultGridLineColor(TMetaClass* vmt);
	/* virtual class method */ virtual Graphics::TColor __fastcall DefaultGroupColor(TMetaClass* vmt);
	/* virtual class method */ virtual Graphics::TColor __fastcall DefaultGroupTextColor(TMetaClass* vmt);
	/* virtual class method */ virtual Graphics::TColor __fastcall DefaultGroupByBoxColor(TMetaClass* vmt);
	/* virtual class method */ virtual Graphics::TColor __fastcall DefaultGroupByBoxTextColor(TMetaClass* vmt);
	/* virtual class method */ virtual Graphics::TColor __fastcall DefaultHeaderColor(TMetaClass* vmt);
	/* virtual class method */ virtual Graphics::TColor __fastcall DefaultHeaderTextColor(TMetaClass* vmt);
	/* virtual class method */ virtual Graphics::TColor __fastcall DefaultHeaderBackgroundColor(TMetaClass* vmt);
	/* virtual class method */ virtual Graphics::TColor __fastcall DefaultHeaderBackgroundTextColor(TMetaClass* vmt);
	/* virtual class method */ virtual Graphics::TColor __fastcall DefaultInactiveColor(TMetaClass* vmt);
	/* virtual class method */ virtual Graphics::TColor __fastcall DefaultInactiveTextColor(TMetaClass* vmt);
	/* virtual class method */ virtual Graphics::TColor __fastcall DefaultPreviewTextColor(TMetaClass* vmt);
	/* virtual class method */ virtual Graphics::TColor __fastcall DefaultRecordSeparatorColor(TMetaClass* vmt);
	/* virtual class method */ virtual Graphics::TColor __fastcall DefaultSelectionColor(TMetaClass* vmt);
	/* virtual class method */ virtual Graphics::TColor __fastcall DefaultSelectionTextColor(TMetaClass* vmt);
	/* virtual class method */ virtual Graphics::TColor __fastcall DefaultSeparatorColor(TMetaClass* vmt);
	/* virtual class method */ virtual Graphics::TColor __fastcall DefaultTabColor(TMetaClass* vmt);
	/* virtual class method */ virtual Graphics::TColor __fastcall DefaultTabTextColor(TMetaClass* vmt);
	/* virtual class method */ virtual Graphics::TColor __fastcall DefaultTabsBackgroundColor(TMetaClass* vmt);
	/*         class method */ static void __fastcall CalculateArrowPoints(TMetaClass* vmt, const Types::TRect &R, Types::TPoint * P, TcxArrowDirection AArrowDirection, bool AProportional);
	/* virtual class method */ virtual void __fastcall DrawArrow(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, TcxArrowDirection AArrowDirection, Graphics::TColor AColor)/* overload */;
	/* virtual class method */ virtual void __fastcall DrawArrow(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, TcxButtonState AState, TcxArrowDirection AArrowDirection, bool ADrawBorder = true)/* overload */;
	/* virtual class method */ virtual void __fastcall DrawArrowBorder(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, TcxButtonState AState);
	/* virtual class method */ virtual void __fastcall DrawScrollBarArrow(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, TcxButtonState AState, TcxArrowDirection AArrowDirection);
	/* virtual class method */ virtual int __fastcall BorderSize(TMetaClass* vmt);
	/* virtual class method */ virtual void __fastcall DrawBorder(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R);
	/* virtual class method */ virtual int __fastcall ButtonBorderSize(TMetaClass* vmt, TcxButtonState AState = (TcxButtonState)(0x1));
	/* virtual class method */ virtual Graphics::TColor __fastcall ButtonColor(TMetaClass* vmt, TcxButtonState AState);
	/* virtual class method */ virtual Types::TRect __fastcall ButtonFocusRect(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R);
	/* virtual class method */ virtual int __fastcall ButtonTextOffset(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall ButtonTextShift(TMetaClass* vmt);
	/* virtual class method */ virtual Graphics::TColor __fastcall ButtonSymbolColor(TMetaClass* vmt, TcxButtonState AState);
	/* virtual class method */ virtual TcxButtonState __fastcall ButtonSymbolState(TMetaClass* vmt, TcxButtonState AState);
	/* virtual class method */ virtual void __fastcall DrawButton(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, const AnsiString ACaption, TcxButtonState AState, bool ADrawBorder = true, Graphics::TColor AColor = (Graphics::TColor)(0x20000000), Graphics::TColor ATextColor = (Graphics::TColor)(0x20000000));
	/* virtual class method */ virtual void __fastcall DrawGroupButton(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, TcxButtonState AState, int AButtonCount, int AButtonIndex, Graphics::TColor ABackgroundColor);
	/* virtual class method */ virtual void __fastcall DrawButtonBorder(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, TcxButtonState AState);
	/* virtual class method */ virtual void __fastcall DrawExpandButton(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, bool AExpanded, Graphics::TColor AColor = (Graphics::TColor)(0x20000000));
	/* virtual class method */ virtual void __fastcall DrawSmallExpandButton(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, bool AExpanded, Graphics::TColor AColor = (Graphics::TColor)(0x20000000));
	/* virtual class method */ virtual int __fastcall ExpandButtonSize(TMetaClass* vmt);
	/* virtual class method */ virtual bool __fastcall IsButtonHotTrack(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall SmallExpandButtonSize(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall CheckBorderSize(TMetaClass* vmt);
	/* virtual class method */ virtual Graphics::TColor __fastcall CheckButtonColor(TMetaClass* vmt, TcxButtonState AState);
	/* virtual class method */ virtual void __fastcall DrawCheck(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, TcxButtonState AState, bool AChecked, Graphics::TColor AColor);
	/* virtual class method */ virtual void __fastcall DrawCheckBorder(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, TcxButtonState AState);
	/* virtual class method */ virtual void __fastcall DrawCheckButton(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, TcxButtonState AState, bool AChecked);
	/* virtual class method */ virtual void __fastcall DrawRadioButton(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, int X, int Y, TcxButtonState AButtonState, bool AChecked, bool AFocused, Graphics::TColor ABrushColor, bool AIsDesigning = false);
	/* virtual class method */ virtual void __fastcall DrawHeader(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ABounds, const Types::TRect &ATextAreaBounds, TcxNeighbors ANeighbors, Cxgraphics::TcxBorders ABorders, TcxButtonState AState, Classes::TAlignment AAlignmentHorz, Cxclasses::TcxAlignmentVert AAlignmentVert, bool AMultiLine, bool AShowEndEllipsis, const AnsiString AText, Graphics::TFont* AFont, Graphics::TColor ATextColor, Graphics::TColor ABkColor, TcxDrawBackgroundEvent AOnDrawBackground = 0x0);
	/* virtual class method */ virtual void __fastcall DrawHeaderEx(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ABounds, const Types::TRect &ATextAreaBounds, TcxNeighbors ANeighbors, Cxgraphics::TcxBorders ABorders, TcxButtonState AState, Classes::TAlignment AAlignmentHorz, Cxclasses::TcxAlignmentVert AAlignmentVert, bool AMultiLine, bool AShowEndEllipsis, const AnsiString AText, Graphics::TFont* AFont, Graphics::TColor ATextColor, Graphics::TColor ABkColor, TcxDrawBackgroundEvent AOnDrawBackground = 0x0);
	/* virtual class method */ virtual void __fastcall DrawHeaderBorder(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, TcxNeighbors ANeighbors, Cxgraphics::TcxBorders ABorders);
	/* virtual class method */ virtual void __fastcall DrawHeaderPressed(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ABounds);
	/* virtual class method */ virtual void __fastcall DrawSortingMark(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, bool AAscendingSorting);
	/* virtual class method */ virtual Cxgraphics::TcxBorders __fastcall HeaderBorders(TMetaClass* vmt, TcxNeighbors ANeighbors);
	/* virtual class method */ virtual int __fastcall HeaderBorderSize(TMetaClass* vmt);
	/* virtual class method */ virtual Types::TRect __fastcall HeaderContentBounds(TMetaClass* vmt, const Types::TRect &ABounds, Cxgraphics::TcxBorders ABorders);
	/* virtual class method */ virtual bool __fastcall HeaderDrawCellsFirst(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall HeaderHeight(TMetaClass* vmt, int AFontHeight);
	/* virtual class method */ virtual int __fastcall HeaderWidth(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, Cxgraphics::TcxBorders ABorders, const AnsiString AText, Graphics::TFont* AFont);
	/* virtual class method */ virtual bool __fastcall IsHeaderHotTrack(TMetaClass* vmt);
	/* virtual class method */ virtual Types::TPoint __fastcall SortingMarkAreaSize(TMetaClass* vmt);
	/* virtual class method */ virtual Types::TPoint __fastcall SortingMarkSize(TMetaClass* vmt);
	/* virtual class method */ virtual void __fastcall DrawFooterCell(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ABounds, Classes::TAlignment AAlignmentHorz, Cxclasses::TcxAlignmentVert AAlignmentVert, bool AMultiLine, const AnsiString AText, Graphics::TFont* AFont, Graphics::TColor ATextColor, Graphics::TColor ABkColor, TcxDrawBackgroundEvent AOnDrawBackground = 0x0);
	/* virtual class method */ virtual Cxgraphics::TcxBorders __fastcall FooterBorders(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall FooterBorderSize(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall FooterCellBorderSize(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall FooterCellOffset(TMetaClass* vmt);
	/* virtual class method */ virtual bool __fastcall FooterDrawCellsFirst(TMetaClass* vmt);
	/* virtual class method */ virtual void __fastcall DrawFooterBorder(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R);
	/* virtual class method */ virtual void __fastcall DrawFooterCellBorder(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R);
	/* virtual class method */ virtual void __fastcall DrawFilterActivateButton(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, TcxButtonState AState, bool AChecked);
	/* virtual class method */ virtual void __fastcall DrawFilterCloseButton(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, TcxButtonState AState);
	/* virtual class method */ virtual void __fastcall DrawFilterDropDownButton(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, TcxButtonState AState, bool AIsFilterActive);
	/* virtual class method */ virtual Types::TPoint __fastcall FilterActivateButtonSize(TMetaClass* vmt);
	/* virtual class method */ virtual Types::TPoint __fastcall FilterCloseButtonSize(TMetaClass* vmt);
	/* virtual class method */ virtual Types::TPoint __fastcall FilterDropDownButtonSize(TMetaClass* vmt);
	/* virtual class method */ virtual TcxPopupBorderStyle __fastcall FilterPopupBorderStyle(TMetaClass* vmt);
	/* virtual class method */ virtual void __fastcall DrawTab(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, Cxgraphics::TcxBorders ABorders, const AnsiString AText, TcxButtonState AState, bool AVertical, Graphics::TFont* AFont, Graphics::TColor ATextColor, Graphics::TColor ABkColor);
	/* virtual class method */ virtual void __fastcall DrawTabBorder(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, Cxgraphics::TcxBorder ABorder, Cxgraphics::TcxBorders ABorders, bool AVertical);
	/* virtual class method */ virtual void __fastcall DrawTabsRoot(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, Cxgraphics::TcxBorders ABorders, bool AVertical);
	/* virtual class method */ virtual bool __fastcall IsDrawTabImplemented(TMetaClass* vmt, bool AVertical);
	/* virtual class method */ virtual bool __fastcall IsTabHotTrack(TMetaClass* vmt, bool AVertical);
	/* virtual class method */ virtual int __fastcall TabBorderSize(TMetaClass* vmt, bool AVertical);
	/* virtual class method */ virtual void __fastcall DrawIndicatorItem(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, TcxIndicatorKind AKind, Graphics::TColor AColor, TcxDrawBackgroundEvent AOnDrawBackground = 0x0);
	/* virtual class method */ virtual void __fastcall DrawIndicatorItemEx(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, TcxIndicatorKind AKind, Graphics::TColor AColor, TcxDrawBackgroundEvent AOnDrawBackground = 0x0);
	/* virtual class method */ virtual bool __fastcall IndicatorDrawItemsFirst(TMetaClass* vmt);
	/* virtual class method */ virtual void __fastcall DrawScrollBarPart(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, bool AHorizontal, const Types::TRect &R, TcxScrollBarPart APart, TcxButtonState AState);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxCustomLookAndFeelPainter(void) : System::TObject() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxCustomLookAndFeelPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxStandardLookAndFeelPainter;
class PASCALIMPLEMENTATION TcxStandardLookAndFeelPainter : public TcxCustomLookAndFeelPainter 
{
	typedef TcxCustomLookAndFeelPainter inherited;
	
public:
	/* virtual class method */ virtual TcxLookAndFeelStyle __fastcall LookAndFeelStyle(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall BorderSize(TMetaClass* vmt);
	/* virtual class method */ virtual void __fastcall DrawBorder(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R);
	/* virtual class method */ virtual int __fastcall ButtonBorderSize(TMetaClass* vmt, TcxButtonState AState = (TcxButtonState)(0x1));
	/* virtual class method */ virtual int __fastcall ButtonTextOffset(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall ButtonTextShift(TMetaClass* vmt);
	/* virtual class method */ virtual void __fastcall DrawButtonBorder(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, TcxButtonState AState);
	/* virtual class method */ virtual int __fastcall ExpandButtonSize(TMetaClass* vmt);
	/* virtual class method */ virtual void __fastcall DrawExpandButton(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, bool AExpanded, Graphics::TColor AColor = (Graphics::TColor)(0x20000000));
	/* virtual class method */ virtual bool __fastcall IsButtonHotTrack(TMetaClass* vmt);
	/* virtual class method */ virtual void __fastcall DrawCheckBorder(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, TcxButtonState AState);
	/* virtual class method */ virtual void __fastcall DrawHeaderBorder(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, TcxNeighbors ANeighbors, Cxgraphics::TcxBorders ABorders);
	/* virtual class method */ virtual void __fastcall DrawSortingMark(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, bool AAscendingSorting);
	/* virtual class method */ virtual int __fastcall HeaderBorderSize(TMetaClass* vmt);
	/* virtual class method */ virtual Types::TPoint __fastcall SortingMarkSize(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall FooterBorderSize(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall FooterCellBorderSize(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall FooterCellOffset(TMetaClass* vmt);
	/* virtual class method */ virtual void __fastcall DrawFooterBorder(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R);
	/* virtual class method */ virtual void __fastcall DrawFooterCellBorder(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R);
	/* virtual class method */ virtual void __fastcall DrawFilterDropDownButton(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, TcxButtonState AState, bool AIsFilterActive);
	/* virtual class method */ virtual void __fastcall DrawTabBorder(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, Cxgraphics::TcxBorder ABorder, Cxgraphics::TcxBorders ABorders, bool AVertical);
	/* virtual class method */ virtual void __fastcall DrawTabsRoot(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, Cxgraphics::TcxBorders ABorders, bool AVertical);
	/* virtual class method */ virtual int __fastcall TabBorderSize(TMetaClass* vmt, bool AVertical);
	/* virtual class method */ virtual void __fastcall DrawScrollBarPart(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, bool AHorizontal, const Types::TRect &R, TcxScrollBarPart APart, TcxButtonState AState);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxStandardLookAndFeelPainter(void) : TcxCustomLookAndFeelPainter() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxStandardLookAndFeelPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFlatLookAndFeelPainter;
class PASCALIMPLEMENTATION TcxFlatLookAndFeelPainter : public TcxCustomLookAndFeelPainter 
{
	typedef TcxCustomLookAndFeelPainter inherited;
	
public:
	/* virtual class method */ virtual TcxLookAndFeelStyle __fastcall LookAndFeelStyle(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall BorderSize(TMetaClass* vmt);
	/* virtual class method */ virtual void __fastcall DrawBorder(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R);
	/* virtual class method */ virtual int __fastcall ButtonBorderSize(TMetaClass* vmt, TcxButtonState AState = (TcxButtonState)(0x1));
	/* virtual class method */ virtual int __fastcall ButtonTextOffset(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall ButtonTextShift(TMetaClass* vmt);
	/* virtual class method */ virtual void __fastcall DrawButtonBorder(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, TcxButtonState AState);
	/* virtual class method */ virtual void __fastcall DrawExpandButton(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, bool AExpanded, Graphics::TColor AColor = (Graphics::TColor)(0x20000000));
	/* virtual class method */ virtual int __fastcall ExpandButtonSize(TMetaClass* vmt);
	/* virtual class method */ virtual bool __fastcall IsButtonHotTrack(TMetaClass* vmt);
	/* virtual class method */ virtual void __fastcall DrawCheckBorder(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, TcxButtonState AState);
	/* virtual class method */ virtual void __fastcall DrawHeaderBorder(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, TcxNeighbors ANeighbors, Cxgraphics::TcxBorders ABorders);
	/* virtual class method */ virtual void __fastcall DrawSortingMark(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, bool AAscendingSorting);
	/* virtual class method */ virtual int __fastcall HeaderBorderSize(TMetaClass* vmt);
	/* virtual class method */ virtual Types::TPoint __fastcall SortingMarkSize(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall FooterBorderSize(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall FooterCellBorderSize(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall FooterCellOffset(TMetaClass* vmt);
	/* virtual class method */ virtual void __fastcall DrawFooterBorder(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R);
	/* virtual class method */ virtual void __fastcall DrawFooterCellBorder(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R);
	/* virtual class method */ virtual void __fastcall DrawFilterDropDownButton(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, TcxButtonState AState, bool AIsFilterActive);
	/* virtual class method */ virtual void __fastcall DrawTabBorder(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, Cxgraphics::TcxBorder ABorder, Cxgraphics::TcxBorders ABorders, bool AVertical);
	/* virtual class method */ virtual void __fastcall DrawTabsRoot(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, Cxgraphics::TcxBorders ABorders, bool AVertical);
	/* virtual class method */ virtual int __fastcall TabBorderSize(TMetaClass* vmt, bool AVertical);
	/* virtual class method */ virtual void __fastcall DrawScrollBarPart(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, bool AHorizontal, const Types::TRect &R, TcxScrollBarPart APart, TcxButtonState AState);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxFlatLookAndFeelPainter(void) : TcxCustomLookAndFeelPainter() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFlatLookAndFeelPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxUltraFlatLookAndFeelPainter;
class PASCALIMPLEMENTATION TcxUltraFlatLookAndFeelPainter : public TcxCustomLookAndFeelPainter 
{
	typedef TcxCustomLookAndFeelPainter inherited;
	
public:
	/* virtual class method */ virtual TcxLookAndFeelStyle __fastcall LookAndFeelStyle(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall BorderSize(TMetaClass* vmt);
	/* virtual class method */ virtual void __fastcall DrawBorder(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R);
	/* virtual class method */ virtual int __fastcall ButtonBorderSize(TMetaClass* vmt, TcxButtonState AState = (TcxButtonState)(0x1));
	/* virtual class method */ virtual Graphics::TColor __fastcall ButtonColor(TMetaClass* vmt, TcxButtonState AState);
	/* virtual class method */ virtual Types::TRect __fastcall ButtonFocusRect(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R);
	/* virtual class method */ virtual Graphics::TColor __fastcall ButtonSymbolColor(TMetaClass* vmt, TcxButtonState AState);
	/* virtual class method */ virtual TcxButtonState __fastcall ButtonSymbolState(TMetaClass* vmt, TcxButtonState AState);
	/* virtual class method */ virtual int __fastcall ButtonTextOffset(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall ButtonTextShift(TMetaClass* vmt);
	/* virtual class method */ virtual void __fastcall DrawButtonBorder(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, TcxButtonState AState);
	/* virtual class method */ virtual void __fastcall DrawGroupButton(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, TcxButtonState AState, int AButtonCount, int AButtonIndex, Graphics::TColor ABackgroundColor);
	/* virtual class method */ virtual void __fastcall DrawExpandButton(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, bool AExpanded, Graphics::TColor AColor = (Graphics::TColor)(0x20000000));
	/* virtual class method */ virtual int __fastcall ExpandButtonSize(TMetaClass* vmt);
	/* virtual class method */ virtual bool __fastcall IsButtonHotTrack(TMetaClass* vmt);
	/* virtual class method */ virtual void __fastcall DrawCheckBorder(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, TcxButtonState AState);
	/* virtual class method */ virtual void __fastcall DrawHeaderBorder(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, TcxNeighbors ANeighbors, Cxgraphics::TcxBorders ABorders);
	/* virtual class method */ virtual void __fastcall DrawHeaderEx(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ABounds, const Types::TRect &ATextAreaBounds, TcxNeighbors ANeighbors, Cxgraphics::TcxBorders ABorders, TcxButtonState AState, Classes::TAlignment AAlignmentHorz, Cxclasses::TcxAlignmentVert AAlignmentVert, bool AMultiLine, bool AShowEndEllipsis, const AnsiString AText, Graphics::TFont* AFont, Graphics::TColor ATextColor, Graphics::TColor ABkColor, TcxDrawBackgroundEvent AOnDrawBackground = 0x0);
	/* virtual class method */ virtual void __fastcall DrawSortingMark(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, bool AAscendingSorting);
	/* virtual class method */ virtual Cxgraphics::TcxBorders __fastcall HeaderBorders(TMetaClass* vmt, TcxNeighbors ANeighbors);
	/* virtual class method */ virtual int __fastcall HeaderBorderSize(TMetaClass* vmt);
	/* virtual class method */ virtual Types::TPoint __fastcall SortingMarkSize(TMetaClass* vmt);
	/* virtual class method */ virtual void __fastcall DrawFooterBorder(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R);
	/* virtual class method */ virtual void __fastcall DrawFooterCellBorder(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R);
	/* virtual class method */ virtual Cxgraphics::TcxBorders __fastcall FooterBorders(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall FooterBorderSize(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall FooterCellBorderSize(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall FooterCellOffset(TMetaClass* vmt);
	/* virtual class method */ virtual void __fastcall DrawFilterDropDownButton(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, TcxButtonState AState, bool AIsFilterActive);
	/* virtual class method */ virtual Types::TPoint __fastcall FilterCloseButtonSize(TMetaClass* vmt);
	/* virtual class method */ virtual void __fastcall DrawTabBorder(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, Cxgraphics::TcxBorder ABorder, Cxgraphics::TcxBorders ABorders, bool AVertical);
	/* virtual class method */ virtual void __fastcall DrawTabsRoot(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, Cxgraphics::TcxBorders ABorders, bool AVertical);
	/* virtual class method */ virtual int __fastcall TabBorderSize(TMetaClass* vmt, bool AVertical);
	/* virtual class method */ virtual void __fastcall DrawScrollBarPart(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, bool AHorizontal, const Types::TRect &R, TcxScrollBarPart APart, TcxButtonState AState);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxUltraFlatLookAndFeelPainter(void) : TcxCustomLookAndFeelPainter() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxUltraFlatLookAndFeelPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxWinXPLookAndFeelPainter;
class PASCALIMPLEMENTATION TcxWinXPLookAndFeelPainter : public TcxStandardLookAndFeelPainter 
{
	typedef TcxStandardLookAndFeelPainter inherited;
	
protected:
	/* virtual class method */ virtual bool __fastcall DoubleBuffered(TMetaClass* vmt);
	/* virtual class method */ virtual void __fastcall DrawContent(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, unsigned ATheme, int APartId, int AStateId, const Types::TRect &ABounds, const Types::TRect &ATextAreaBounds, Classes::TAlignment AAlignmentHorz, Cxclasses::TcxAlignmentVert AAlignmentVert, bool AMultiLine, bool AShowEndEllipsis, const AnsiString AText, Graphics::TFont* AFont, Graphics::TColor ATextColor, Graphics::TColor ABkColor);
	
public:
	/* virtual class method */ virtual TcxLookAndFeelStyle __fastcall LookAndFeelStyle(TMetaClass* vmt);
	/* virtual class method */ virtual void __fastcall DrawArrow(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, TcxArrowDirection AArrowDirection, Graphics::TColor AColor)/* overload */;
	/* virtual class method */ virtual void __fastcall DrawArrow(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, TcxButtonState AState, TcxArrowDirection AArrowDirection, bool ADrawBorder = true)/* overload */;
	/* virtual class method */ virtual void __fastcall DrawArrowBorder(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, TcxButtonState AState);
	/* virtual class method */ virtual int __fastcall BorderSize(TMetaClass* vmt);
	/* virtual class method */ virtual void __fastcall DrawBorder(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R);
	/* virtual class method */ virtual int __fastcall ButtonBorderSize(TMetaClass* vmt, TcxButtonState AState = (TcxButtonState)(0x1));
	/* virtual class method */ virtual Graphics::TColor __fastcall ButtonColor(TMetaClass* vmt, TcxButtonState AState);
	/* virtual class method */ virtual Types::TRect __fastcall ButtonFocusRect(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R);
	/* virtual class method */ virtual Graphics::TColor __fastcall ButtonSymbolColor(TMetaClass* vmt, TcxButtonState AState);
	/* virtual class method */ virtual int __fastcall ButtonTextOffset(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall ButtonTextShift(TMetaClass* vmt);
	/* virtual class method */ virtual void __fastcall DrawButton(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, const AnsiString ACaption, TcxButtonState AState, bool ADrawBorder = true, Graphics::TColor AColor = (Graphics::TColor)(0x20000000), Graphics::TColor ATextColor = (Graphics::TColor)(0x20000000));
	/* virtual class method */ virtual void __fastcall DrawExpandButton(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, bool AExpanded, Graphics::TColor AColor = (Graphics::TColor)(0x20000000));
	/* virtual class method */ virtual void __fastcall DrawSmallExpandButton(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, bool AExpanded, Graphics::TColor AColor = (Graphics::TColor)(0x20000000));
	/* virtual class method */ virtual int __fastcall ExpandButtonSize(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall SmallExpandButtonSize(TMetaClass* vmt);
	/* virtual class method */ virtual bool __fastcall IsButtonHotTrack(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall CheckBorderSize(TMetaClass* vmt);
	/* virtual class method */ virtual void __fastcall DrawCheck(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, TcxButtonState AState, bool AChecked, Graphics::TColor AColor);
	/* virtual class method */ virtual void __fastcall DrawCheckBorder(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, TcxButtonState AState);
	/* virtual class method */ virtual void __fastcall DrawRadioButton(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, int X, int Y, TcxButtonState AButtonState, bool AChecked, bool AFocused, Graphics::TColor ABrushColor, bool AIsDesigning = false);
	/* virtual class method */ virtual void __fastcall DrawHeader(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ABounds, const Types::TRect &ATextAreaBounds, TcxNeighbors ANeighbors, Cxgraphics::TcxBorders ABorders, TcxButtonState AState, Classes::TAlignment AAlignmentHorz, Cxclasses::TcxAlignmentVert AAlignmentVert, bool AMultiLine, bool AShowEndEllipsis, const AnsiString AText, Graphics::TFont* AFont, Graphics::TColor ATextColor, Graphics::TColor ABkColor, TcxDrawBackgroundEvent AOnDrawBackground = 0x0);
	/* virtual class method */ virtual void __fastcall DrawHeaderPressed(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ABounds);
	/* virtual class method */ virtual void __fastcall DrawSortingMark(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, bool AAscendingSorting);
	/* virtual class method */ virtual int __fastcall HeaderBorderSize(TMetaClass* vmt);
	/* virtual class method */ virtual bool __fastcall HeaderDrawCellsFirst(TMetaClass* vmt);
	/* virtual class method */ virtual bool __fastcall IsHeaderHotTrack(TMetaClass* vmt);
	/* virtual class method */ virtual Types::TPoint __fastcall SortingMarkSize(TMetaClass* vmt);
	/* virtual class method */ virtual void __fastcall DrawFooterBorder(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R);
	/* virtual class method */ virtual void __fastcall DrawFooterCell(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ABounds, Classes::TAlignment AAlignmentHorz, Cxclasses::TcxAlignmentVert AAlignmentVert, bool AMultiLine, const AnsiString AText, Graphics::TFont* AFont, Graphics::TColor ATextColor, Graphics::TColor ABkColor, TcxDrawBackgroundEvent AOnDrawBackground = 0x0);
	/* virtual class method */ virtual int __fastcall FooterBorderSize(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall FooterCellBorderSize(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall FooterCellOffset(TMetaClass* vmt);
	/* virtual class method */ virtual bool __fastcall FooterDrawCellsFirst(TMetaClass* vmt);
	/* virtual class method */ virtual void __fastcall DrawFilterCloseButton(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, TcxButtonState AState);
	/* virtual class method */ virtual void __fastcall DrawFilterDropDownButton(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, TcxButtonState AState, bool AIsFilterActive);
	/* virtual class method */ virtual Types::TPoint __fastcall FilterActivateButtonSize(TMetaClass* vmt);
	/* virtual class method */ virtual Types::TPoint __fastcall FilterCloseButtonSize(TMetaClass* vmt);
	/* virtual class method */ virtual void __fastcall DrawTab(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, Cxgraphics::TcxBorders ABorders, const AnsiString AText, TcxButtonState AState, bool AVertical, Graphics::TFont* AFont, Graphics::TColor ATextColor, Graphics::TColor ABkColor);
	/* virtual class method */ virtual void __fastcall DrawTabBorder(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, Cxgraphics::TcxBorder ABorder, Cxgraphics::TcxBorders ABorders, bool AVertical);
	/* virtual class method */ virtual void __fastcall DrawTabsRoot(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, Cxgraphics::TcxBorders ABorders, bool AVertical);
	/* virtual class method */ virtual bool __fastcall IsDrawTabImplemented(TMetaClass* vmt, bool AVertical);
	/* virtual class method */ virtual bool __fastcall IsTabHotTrack(TMetaClass* vmt, bool AVertical);
	/* virtual class method */ virtual int __fastcall TabBorderSize(TMetaClass* vmt, bool AVertical);
	/* virtual class method */ virtual void __fastcall DrawIndicatorItem(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, TcxIndicatorKind AKind, Graphics::TColor AColor, TcxDrawBackgroundEvent AOnDrawBackground = 0x0);
	/* virtual class method */ virtual void __fastcall DrawScrollBarPart(TMetaClass* vmt, Cxgraphics::TcxCanvas* ACanvas, bool AHorizontal, const Types::TRect &R, TcxScrollBarPart APart, TcxButtonState AState);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxWinXPLookAndFeelPainter(void) : TcxStandardLookAndFeelPainter() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxWinXPLookAndFeelPainter(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
static const Shortint cxTextOffset = 0x2;
static const Shortint cxHeaderTextOffset = 0x2;
extern PACKAGE Controls::TImageList* cxIndicatorImages;
extern PACKAGE int __fastcall BtnStateToXPBtnState(TcxButtonState AState);
extern PACKAGE TMetaClass* __fastcall GetCurrentPainterClass(void);
extern PACKAGE void __fastcall UpdateScrollBarBitmaps(void);

}	/* namespace Cxlookandfeelpainters */
using namespace Cxlookandfeelpainters;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxLookAndFeelPainters
