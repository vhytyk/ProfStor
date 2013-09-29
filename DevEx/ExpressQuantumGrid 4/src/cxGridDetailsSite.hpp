// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxGridDetailsSite.pas' rev: 6.00

#ifndef cxGridDetailsSiteHPP
#define cxGridDetailsSiteHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxGridCustomView.hpp>	// Pascal unit
#include <cxGridLevel.hpp>	// Pascal unit
#include <cxGridCommon.hpp>	// Pascal unit
#include <cxLookAndFeelPainters.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxgriddetailssite
{
//-- type declarations -------------------------------------------------------
typedef TMetaClass*TcxGridDetailsSiteTabHitTestClass;

class DELPHICLASS TcxGridDetailsSiteTabHitTest;
class PASCALIMPLEMENTATION TcxGridDetailsSiteTabHitTest : public Cxgridcustomview::TcxCustomGridHitTest 
{
	typedef Cxgridcustomview::TcxCustomGridHitTest inherited;
	
private:
	Cxgridlevel::TcxGridLevel* FLevel;
	System::TObject* FOwner;
	
protected:
	/* virtual class method */ virtual int __fastcall GetHitTestCode(TMetaClass* vmt);
	
public:
	__property Cxgridlevel::TcxGridLevel* Level = {read=FLevel, write=FLevel};
	__property System::TObject* Owner = {read=FOwner, write=FOwner};
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxGridDetailsSiteTabHitTest(void) : Cxgridcustomview::TcxCustomGridHitTest() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridDetailsSiteTabHitTest(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridDetailsSiteTabPainter;
class DELPHICLASS TcxCustomGridDetailsSiteTabViewInfo;
class PASCALIMPLEMENTATION TcxGridDetailsSiteTabPainter : public Cxgridcustomview::TcxCustomGridCellPainter 
{
	typedef Cxgridcustomview::TcxCustomGridCellPainter inherited;
	
private:
	TcxCustomGridDetailsSiteTabViewInfo* __fastcall GetViewInfo(void);
	
protected:
	virtual void __fastcall DrawBorder(Cxgraphics::TcxBorder ABorder);
	virtual void __fastcall DrawContent(void);
	__property TcxCustomGridDetailsSiteTabViewInfo* ViewInfo = {read=GetViewInfo};
public:
	#pragma option push -w-inl
	/* TcxCustomGridCellPainter.Create */ inline __fastcall virtual TcxGridDetailsSiteTabPainter(Cxgraphics::TcxCanvas* ACanvas, Cxgridcustomview::TcxCustomGridCellViewInfo* AViewInfo) : Cxgridcustomview::TcxCustomGridCellPainter(ACanvas, AViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridDetailsSiteTabPainter(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxGridDetailsSiteTabsPainterClass;

class DELPHICLASS TcxGridDetailsSiteTabsPainter;
class DELPHICLASS TcxCustomGridDetailsSiteTabsViewInfo;
class DELPHICLASS TcxCustomGridDetailsSiteViewInfo;
typedef TMetaClass*TcxGridDetailsSitePainterClass;

typedef TMetaClass*TcxCustomGridDetailsSiteTabsViewInfoClass;

class PASCALIMPLEMENTATION TcxCustomGridDetailsSiteViewInfo : public Cxclasses::TcxComponent 
{
	typedef Cxclasses::TcxComponent inherited;
	
private:
	Cxgridcustomview::TcxCustomGridView* FActiveGridView;
	bool FFullyVisible;
	Cxgridlevel::TcxGridLevel* FLevel;
	int FNormalHeight;
	TcxCustomGridDetailsSiteTabsViewInfo* FTabsViewInfo;
	int __fastcall GetClientHeight(void);
	int __fastcall GetClientWidth(void);
	Types::TRect __fastcall GetFrameBounds();
	int __fastcall GetInternalHeight(void);
	int __fastcall GetInternalWidth(void);
	int __fastcall GetMaxDetailHeight(void);
	Types::TPoint __fastcall GetMaxDetailSize();
	int __fastcall GetMaxDetailWidth(void);
	int __fastcall GetNonClientHeight(void);
	int __fastcall GetNonClientWidth(void);
	
protected:
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation AOperation);
	virtual int __fastcall CalculateHeight(void);
	virtual int __fastcall CalculateWidth(void);
	virtual Graphics::TColor __fastcall GetBkColor(void);
	virtual Cxgraphics::TcxCanvas* __fastcall GetCanvas(void) = 0 ;
	virtual Types::TRect __fastcall GetClientBounds();
	virtual int __fastcall GetEmptyClientHeight(void);
	virtual int __fastcall GetEmptyClientWidth(void);
	virtual Graphics::TColor __fastcall GetFrameColor(void);
	virtual int __fastcall GetFrameWidth(void);
	virtual int __fastcall GetHeight(void);
	virtual TMetaClass* __fastcall GetLookAndFeelPainter(void) = 0 ;
	virtual int __fastcall GetMaxHeight(void) = 0 ;
	virtual int __fastcall GetMaxNormalHeight(void);
	virtual int __fastcall GetMaxWidth(void) = 0 ;
	virtual int __fastcall GetMinWidth(void);
	virtual int __fastcall GetNormalHeight(void);
	virtual int __fastcall GetWidth(void);
	virtual TMetaClass* __fastcall GetPainterClass(void);
	virtual TMetaClass* __fastcall GetTabsViewInfoClass(void);
	virtual Cxgridcustomview::TcxCustomGridView* __fastcall GetActiveGridView(void) = 0 ;
	virtual bool __fastcall GetActiveGridViewExists(void);
	virtual Cxgridcustomview::TcxCustomGridView* __fastcall GetActiveGridViewValue(void);
	virtual Cxgridlevel::TcxGridLevel* __fastcall GetActiveLevel(void) = 0 ;
	virtual bool __fastcall GetVisible(void);
	virtual void __fastcall InitTabHitTest(TcxGridDetailsSiteTabHitTest* AHitTest) = 0 ;
	__property Cxgridcustomview::TcxCustomGridView* ActiveGridView = {read=GetActiveGridViewValue};
	__property bool ActiveGridViewExists = {read=GetActiveGridViewExists, nodefault};
	__property Cxgraphics::TcxCanvas* Canvas = {read=GetCanvas};
	__property int ClientHeight = {read=GetClientHeight, nodefault};
	__property int ClientWidth = {read=GetClientWidth, nodefault};
	__property int EmptyClientHeight = {read=GetEmptyClientHeight, nodefault};
	__property int EmptyClientWidth = {read=GetEmptyClientWidth, nodefault};
	__property bool FullyVisible = {read=FFullyVisible, nodefault};
	__property int InternalHeight = {read=GetInternalHeight, nodefault};
	__property int InternalWidth = {read=GetInternalWidth, nodefault};
	__property TMetaClass* LookAndFeelPainter = {read=GetLookAndFeelPainter};
	__property int MaxDetailHeight = {read=GetMaxDetailHeight, nodefault};
	__property Types::TPoint MaxDetailSize = {read=GetMaxDetailSize};
	__property int MaxDetailWidth = {read=GetMaxDetailWidth, nodefault};
	__property int MaxHeight = {read=GetMaxHeight, nodefault};
	__property int MaxNormalHeight = {read=GetMaxNormalHeight, nodefault};
	__property int MaxWidth = {read=GetMaxWidth, nodefault};
	__property int MinWidth = {read=GetMinWidth, nodefault};
	__property int NonClientHeight = {read=GetNonClientHeight, nodefault};
	__property int NonClientWidth = {read=GetNonClientWidth, nodefault};
	
public:
	#pragma pack(push, 1)
	Types::TRect Bounds;
	#pragma pack(pop)
	
	__fastcall virtual TcxCustomGridDetailsSiteViewInfo(Cxgridlevel::TcxGridLevel* ALevel);
	__fastcall virtual ~TcxCustomGridDetailsSiteViewInfo(void);
	virtual void __fastcall Calculate(int ALeftBound, int ATopBound);
	virtual void __fastcall ChangeActiveTab(Cxgridlevel::TcxGridLevel* ALevel) = 0 ;
	virtual Cxgridcustomview::TcxCustomGridHitTest* __fastcall GetHitTest(const Types::TPoint &P);
	void __fastcall Paint(Cxgraphics::TcxCanvas* ACanvas);
	virtual void __fastcall VisibilityChanged(bool AVisible);
	__property Cxgridlevel::TcxGridLevel* ActiveLevel = {read=GetActiveLevel};
	__property Graphics::TColor BkColor = {read=GetBkColor, nodefault};
	__property Types::TRect ClientBounds = {read=GetClientBounds};
	__property Types::TRect FrameBounds = {read=GetFrameBounds};
	__property Graphics::TColor FrameColor = {read=GetFrameColor, nodefault};
	__property int FrameWidth = {read=GetFrameWidth, nodefault};
	__property int Height = {read=GetHeight, nodefault};
	__property Cxgridlevel::TcxGridLevel* Level = {read=FLevel};
	__property int NormalHeight = {read=GetNormalHeight, nodefault};
	__property TcxCustomGridDetailsSiteTabsViewInfo* TabsViewInfo = {read=FTabsViewInfo};
	__property bool Visible = {read=GetVisible, nodefault};
	__property int Width = {read=GetWidth, nodefault};
};


typedef TMetaClass*TcxCustomGridDetailsSiteTabViewInfoClass;

class PASCALIMPLEMENTATION TcxCustomGridDetailsSiteTabsViewInfo : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	int FHeight;
	Classes::TList* FItems;
	TcxCustomGridDetailsSiteViewInfo* FSiteViewInfo;
	int FWidth;
	Cxgridlevel::TcxGridLevel* __fastcall GetActiveLevel(void);
	Cxgraphics::TcxCanvas* __fastcall GetCanvas(void);
	int __fastcall GetCount(void);
	int __fastcall GetHeight(void);
	TcxCustomGridDetailsSiteTabViewInfo* __fastcall GetItem(int Index);
	Cxgridlevel::TcxGridLevel* __fastcall GetLevel(void);
	TMetaClass* __fastcall GetLookAndFeelPainter(void);
	int __fastcall GetMainSize(void);
	int __fastcall GetTabSize(void);
	int __fastcall GetWidth(void);
	void __fastcall CreateItems(void);
	void __fastcall DestroyItems(void);
	
protected:
	virtual int __fastcall CalculateHeight(void);
	virtual int __fastcall CalculateWidth(void);
	virtual void __fastcall CheckSiteViewInfoHeight(int &AHeight);
	virtual void __fastcall CheckSiteViewInfoWidth(int &AWidth);
	virtual int __fastcall GetActiveTabOffset(void) = 0 ;
	virtual Graphics::TColor __fastcall GetBkColor(void);
	virtual bool __fastcall GetIsVertical(void) = 0 ;
	virtual TMetaClass* __fastcall GetItemClass(void) = 0 ;
	virtual int __fastcall GetItemHeight(TcxCustomGridDetailsSiteTabViewInfo* AItem);
	virtual int __fastcall GetItemWidth(TcxCustomGridDetailsSiteTabViewInfo* AItem);
	virtual TMetaClass* __fastcall GetPainterClass(void);
	virtual Cxgraphics::TcxBorders __fastcall GetRootBorders(void) = 0 ;
	virtual Types::TRect __fastcall GetRootBounds(void) = 0 ;
	__property int ActiveTabOffset = {read=GetActiveTabOffset, nodefault};
	__property Cxgraphics::TcxCanvas* Canvas = {read=GetCanvas};
	__property bool IsVertical = {read=GetIsVertical, nodefault};
	__property Cxgridlevel::TcxGridLevel* Level = {read=GetLevel};
	__property TMetaClass* LookAndFeelPainter = {read=GetLookAndFeelPainter};
	__property int MainSize = {read=GetMainSize, nodefault};
	__property TcxCustomGridDetailsSiteViewInfo* SiteViewInfo = {read=FSiteViewInfo};
	__property int TabSize = {read=GetTabSize, nodefault};
	
public:
	#pragma pack(push, 1)
	Types::TRect Bounds;
	#pragma pack(pop)
	
	__fastcall virtual TcxCustomGridDetailsSiteTabsViewInfo(TcxCustomGridDetailsSiteViewInfo* ASiteViewInfo);
	__fastcall virtual ~TcxCustomGridDetailsSiteTabsViewInfo(void);
	virtual void __fastcall Calculate(const Types::TRect &ABounds);
	virtual void __fastcall GetClientBounds(Types::TRect &AClientBounds) = 0 ;
	virtual Cxgridcustomview::TcxCustomGridHitTest* __fastcall GetHitTest(const Types::TPoint &P);
	__property Cxgridlevel::TcxGridLevel* ActiveLevel = {read=GetActiveLevel};
	__property Graphics::TColor BkColor = {read=GetBkColor, nodefault};
	__property int Count = {read=GetCount, nodefault};
	__property int Height = {read=GetHeight, nodefault};
	__property TcxCustomGridDetailsSiteTabViewInfo* Items[int Index] = {read=GetItem};
	__property Cxgraphics::TcxBorders RootBorders = {read=GetRootBorders, nodefault};
	__property Types::TRect RootBounds = {read=GetRootBounds};
	__property int Width = {read=GetWidth, nodefault};
};


class PASCALIMPLEMENTATION TcxGridDetailsSiteTabsPainter : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	Cxgraphics::TcxCanvas* FCanvas;
	TcxCustomGridDetailsSiteTabsViewInfo* FViewInfo;
	
protected:
	virtual void __fastcall DrawBackground(void);
	virtual void __fastcall DrawItems(void);
	virtual void __fastcall DrawRoot(void);
	virtual void __fastcall Paint(void);
	__property Cxgraphics::TcxCanvas* Canvas = {read=FCanvas};
	__property TcxCustomGridDetailsSiteTabsViewInfo* ViewInfo = {read=FViewInfo};
	
public:
	__fastcall virtual TcxGridDetailsSiteTabsPainter(Cxgraphics::TcxCanvas* ACanvas, TcxCustomGridDetailsSiteTabsViewInfo* AViewInfo);
	void __fastcall MainPaint(void);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridDetailsSiteTabsPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridDetailsSitePainter;
class PASCALIMPLEMENTATION TcxGridDetailsSitePainter : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	Cxgraphics::TcxCanvas* FCanvas;
	TcxCustomGridDetailsSiteViewInfo* FViewInfo;
	
protected:
	virtual void __fastcall DrawBackground(void);
	virtual void __fastcall DrawFrame(void);
	virtual void __fastcall DrawTabs(void);
	__property Cxgraphics::TcxCanvas* Canvas = {read=FCanvas};
	__property TcxCustomGridDetailsSiteViewInfo* ViewInfo = {read=FViewInfo};
	
public:
	__fastcall virtual TcxGridDetailsSitePainter(Cxgraphics::TcxCanvas* ACanvas, TcxCustomGridDetailsSiteViewInfo* AViewInfo);
	virtual void __fastcall Paint(void);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridDetailsSitePainter(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxCustomGridDetailsSiteTabViewInfo : public Cxgridcustomview::TcxCustomGridCellViewInfo 
{
	typedef Cxgridcustomview::TcxCustomGridCellViewInfo inherited;
	
private:
	int FIndex;
	Cxgridlevel::TcxGridLevel* FLevel;
	TcxCustomGridDetailsSiteTabsViewInfo* FTabsViewInfo;
	bool __fastcall GetActive(void);
	AnsiString __fastcall GetCaption();
	bool __fastcall GetIsVertical(void);
	TMetaClass* __fastcall GetLookAndFeelPainter(void);
	TcxCustomGridDetailsSiteViewInfo* __fastcall GetSiteViewInfo(void);
	
protected:
	virtual int __fastcall CalculateHeight(void);
	virtual int __fastcall CalculateWidth(void);
	virtual int __fastcall GetBorderWidth(Cxgraphics::TcxBorder AIndex);
	virtual Cxgraphics::TcxCanvas* __fastcall GetCanvas(void);
	virtual TMetaClass* __fastcall GetHitTestClass(void);
	virtual bool __fastcall GetHotTrack(void);
	virtual TMetaClass* __fastcall GetPainterClass(void);
	virtual Cxgridcommon::TcxGridCellState __fastcall GetStateForPaint(void);
	virtual AnsiString __fastcall GetText();
	virtual Types::TRect __fastcall GetTextAreaBounds();
	virtual void __fastcall GetViewParams(Cxgraphics::TcxViewParams &AParams);
	bool __fastcall HasFirstBorder(void);
	bool __fastcall HasLastBorder(void);
	virtual void __fastcall InitHitTest(Cxgridcustomview::TcxCustomGridHitTest* AHitTest);
	__property int Index = {read=FIndex, nodefault};
	__property bool IsVertical = {read=GetIsVertical, nodefault};
	__property Cxgridlevel::TcxGridLevel* Level = {read=FLevel};
	__property TMetaClass* LookAndFeelPainter = {read=GetLookAndFeelPainter};
	__property TcxCustomGridDetailsSiteViewInfo* SiteViewInfo = {read=GetSiteViewInfo};
	__property TcxCustomGridDetailsSiteTabsViewInfo* TabsViewInfo = {read=FTabsViewInfo};
	
public:
	__fastcall virtual TcxCustomGridDetailsSiteTabViewInfo(TcxCustomGridDetailsSiteTabsViewInfo* ATabsViewInfo, Cxgridlevel::TcxGridLevel* ALevel);
	virtual bool __fastcall MouseDown(Cxgridcustomview::TcxCustomGridHitTest* AHitTest, Controls::TMouseButton AButton, Classes::TShiftState AShift);
	__property bool Active = {read=GetActive, nodefault};
	__property AnsiString Caption = {read=GetCaption};
	__property Cxgridcommon::TcxGridCellState StateForPaint = {read=GetStateForPaint, nodefault};
public:
	#pragma option push -w-inl
	/* TcxCustomGridCellViewInfo.Destroy */ inline __fastcall virtual ~TcxCustomGridDetailsSiteTabViewInfo(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridDetailsSiteLeftTabViewInfo;
class PASCALIMPLEMENTATION TcxGridDetailsSiteLeftTabViewInfo : public TcxCustomGridDetailsSiteTabViewInfo 
{
	typedef TcxCustomGridDetailsSiteTabViewInfo inherited;
	
protected:
	virtual int __fastcall CalculateHeight(void);
	virtual int __fastcall CalculateWidth(void);
	virtual Cxclasses::TcxAlignmentVert __fastcall GetAlignmentVert(void);
	virtual Cxgraphics::TcxBorders __fastcall GetBorders(void);
	
public:
	virtual void __fastcall Calculate(int ALeftBound, int ATopBound, int AWidth = 0xffffffff, int AHeight = 0xffffffff)/* overload */;
public:
	#pragma option push -w-inl
	/* TcxCustomGridDetailsSiteTabViewInfo.Create */ inline __fastcall virtual TcxGridDetailsSiteLeftTabViewInfo(TcxCustomGridDetailsSiteTabsViewInfo* ATabsViewInfo, Cxgridlevel::TcxGridLevel* ALevel) : TcxCustomGridDetailsSiteTabViewInfo(ATabsViewInfo, ALevel) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomGridCellViewInfo.Destroy */ inline __fastcall virtual ~TcxGridDetailsSiteLeftTabViewInfo(void) { }
	#pragma option pop
	
	
/* Hoisted overloads: */
	
public:
	inline void __fastcall  Calculate(const Types::TRect &ABounds){ TcxCustomGridCellViewInfo::Calculate(ABounds); }
	
};


class DELPHICLASS TcxGridDetailsSiteLeftTabsViewInfo;
class PASCALIMPLEMENTATION TcxGridDetailsSiteLeftTabsViewInfo : public TcxCustomGridDetailsSiteTabsViewInfo 
{
	typedef TcxCustomGridDetailsSiteTabsViewInfo inherited;
	
protected:
	virtual void __fastcall CheckSiteViewInfoHeight(int &AHeight);
	virtual int __fastcall GetActiveTabOffset(void);
	virtual bool __fastcall GetIsVertical(void);
	virtual TMetaClass* __fastcall GetItemClass(void);
	virtual Cxgraphics::TcxBorders __fastcall GetRootBorders(void);
	virtual Types::TRect __fastcall GetRootBounds();
	
public:
	virtual void __fastcall Calculate(const Types::TRect &ABounds);
	virtual void __fastcall GetClientBounds(Types::TRect &AClientBounds);
public:
	#pragma option push -w-inl
	/* TcxCustomGridDetailsSiteTabsViewInfo.Create */ inline __fastcall virtual TcxGridDetailsSiteLeftTabsViewInfo(TcxCustomGridDetailsSiteViewInfo* ASiteViewInfo) : TcxCustomGridDetailsSiteTabsViewInfo(ASiteViewInfo) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomGridDetailsSiteTabsViewInfo.Destroy */ inline __fastcall virtual ~TcxGridDetailsSiteLeftTabsViewInfo(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridDetailsSiteTopTabViewInfo;
class PASCALIMPLEMENTATION TcxGridDetailsSiteTopTabViewInfo : public TcxCustomGridDetailsSiteTabViewInfo 
{
	typedef TcxCustomGridDetailsSiteTabViewInfo inherited;
	
protected:
	virtual int __fastcall CalculateHeight(void);
	virtual int __fastcall CalculateWidth(void);
	virtual Cxgraphics::TcxBorders __fastcall GetBorders(void);
	
public:
	virtual void __fastcall Calculate(int ALeftBound, int ATopBound, int AWidth = 0xffffffff, int AHeight = 0xffffffff)/* overload */;
public:
	#pragma option push -w-inl
	/* TcxCustomGridDetailsSiteTabViewInfo.Create */ inline __fastcall virtual TcxGridDetailsSiteTopTabViewInfo(TcxCustomGridDetailsSiteTabsViewInfo* ATabsViewInfo, Cxgridlevel::TcxGridLevel* ALevel) : TcxCustomGridDetailsSiteTabViewInfo(ATabsViewInfo, ALevel) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomGridCellViewInfo.Destroy */ inline __fastcall virtual ~TcxGridDetailsSiteTopTabViewInfo(void) { }
	#pragma option pop
	
	
/* Hoisted overloads: */
	
public:
	inline void __fastcall  Calculate(const Types::TRect &ABounds){ TcxCustomGridCellViewInfo::Calculate(ABounds); }
	
};


class DELPHICLASS TcxGridDetailsSiteTopTabsViewInfo;
class PASCALIMPLEMENTATION TcxGridDetailsSiteTopTabsViewInfo : public TcxCustomGridDetailsSiteTabsViewInfo 
{
	typedef TcxCustomGridDetailsSiteTabsViewInfo inherited;
	
protected:
	virtual int __fastcall CalculateHeight(void);
	virtual int __fastcall CalculateWidth(void);
	virtual void __fastcall CheckSiteViewInfoWidth(int &AWidth);
	virtual int __fastcall GetActiveTabOffset(void);
	virtual bool __fastcall GetIsVertical(void);
	virtual TMetaClass* __fastcall GetItemClass(void);
	virtual int __fastcall GetItemHeight(TcxCustomGridDetailsSiteTabViewInfo* AItem);
	virtual int __fastcall GetItemWidth(TcxCustomGridDetailsSiteTabViewInfo* AItem);
	virtual Cxgraphics::TcxBorders __fastcall GetRootBorders(void);
	virtual Types::TRect __fastcall GetRootBounds();
	
public:
	virtual void __fastcall Calculate(const Types::TRect &ABounds);
	virtual void __fastcall GetClientBounds(Types::TRect &AClientBounds);
public:
	#pragma option push -w-inl
	/* TcxCustomGridDetailsSiteTabsViewInfo.Create */ inline __fastcall virtual TcxGridDetailsSiteTopTabsViewInfo(TcxCustomGridDetailsSiteViewInfo* ASiteViewInfo) : TcxCustomGridDetailsSiteTabsViewInfo(ASiteViewInfo) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomGridDetailsSiteTabsViewInfo.Destroy */ inline __fastcall virtual ~TcxGridDetailsSiteTopTabsViewInfo(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
static const Shortint htTab = 0x32;

}	/* namespace Cxgriddetailssite */
using namespace Cxgriddetailssite;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxGridDetailsSite
