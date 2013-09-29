// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxGridCardView.pas' rev: 6.00

#ifndef cxGridCardViewHPP
#define cxGridCardViewHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxCustomData.hpp>	// Pascal unit
#include <cxDataStorage.hpp>	// Pascal unit
#include <cxGridCustomTableView.hpp>	// Pascal unit
#include <cxGridCustomView.hpp>	// Pascal unit
#include <cxGrid.hpp>	// Pascal unit
#include <cxGridCommon.hpp>	// Pascal unit
#include <cxStyles.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxgridcardview
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TcxGridCardViewLayoutDirection { ldHorizontal, ldVertical };
#pragma option pop

class DELPHICLASS TcxGridCardRowCaptionHitTest;
class PASCALIMPLEMENTATION TcxGridCardRowCaptionHitTest : public Cxgridcustomtableview::TcxGridRecordCellHitTest 
{
	typedef Cxgridcustomtableview::TcxGridRecordCellHitTest inherited;
	
protected:
	/* virtual class method */ virtual int __fastcall GetHitTestCode(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxGridCardRowCaptionHitTest(void) : Cxgridcustomtableview::TcxGridRecordCellHitTest() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridCardRowCaptionHitTest(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridCardViewSeparatorHitTest;
class DELPHICLASS TcxGridCardViewSeparatorsViewInfo;
class DELPHICLASS TcxGridCardViewViewInfo;
class DELPHICLASS TcxGridCardViewController;
class DELPHICLASS TcxGridCardView;
class DELPHICLASS TcxGridCardsViewInfo;
class DELPHICLASS TcxGridCardViewViewData;
typedef TMetaClass*TcxGridCardViewSeparatorsViewInfoClass;

class PASCALIMPLEMENTATION TcxGridCardViewViewInfo : public Cxgridcustomtableview::TcxCustomGridTableViewInfo 
{
	typedef Cxgridcustomtableview::TcxCustomGridTableViewInfo inherited;
	
private:
	int FPrevCardHeight;
	TcxGridCardViewSeparatorsViewInfo* FSeparatorsViewInfo;
	HIDESBASE TcxGridCardViewController* __fastcall GetController(void);
	HIDESBASE TcxGridCardView* __fastcall GetGridView(void);
	TcxGridCardsViewInfo* __fastcall GetRecordsViewInfo(void);
	HIDESBASE TcxGridCardViewViewData* __fastcall GetViewData(void);
	
protected:
	virtual void __fastcall CreateViewInfos(void);
	virtual void __fastcall DestroyViewInfos(bool AIsRecreating);
	virtual void __fastcall AfterCalculating(void);
	virtual void __fastcall BeforeCalculating(void);
	virtual void __fastcall Calculate(void);
	virtual void __fastcall CalculateHeight(const Types::TPoint &AMaxSize, int &AHeight, bool &AFullyVisible);
	virtual void __fastcall CalculateWidth(const Types::TPoint &AMaxSize, int &AWidth);
	virtual int __fastcall GetDefaultGridModeBufferCount(void);
	virtual TMetaClass* __fastcall GetRecordsViewInfoClass(void);
	virtual TMetaClass* __fastcall GetSeparatorsViewInfoClass(void);
	__property TcxGridCardViewController* Controller = {read=GetController};
	__property TcxGridCardView* GridView = {read=GetGridView};
	__property TcxGridCardViewViewData* ViewData = {read=GetViewData};
	
public:
	virtual bool __fastcall CanOffsetView(int ARecordCountDelta);
	virtual Cxgridcustomview::TcxCustomGridHitTest* __fastcall GetHitTest(const Types::TPoint &P)/* overload */;
	__property TcxGridCardsViewInfo* RecordsViewInfo = {read=GetRecordsViewInfo};
	__property TcxGridCardViewSeparatorsViewInfo* SeparatorsViewInfo = {read=FSeparatorsViewInfo};
public:
	#pragma option push -w-inl
	/* TcxCustomGridTableViewInfo.Create */ inline __fastcall virtual TcxGridCardViewViewInfo(Cxgridcustomview::TcxCustomGridView* AGridView) : Cxgridcustomtableview::TcxCustomGridTableViewInfo(AGridView) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomGridViewInfo.Destroy */ inline __fastcall virtual ~TcxGridCardViewViewInfo(void) { }
	#pragma option pop
	
	
/* Hoisted overloads: */
	
public:
	inline Cxgridcustomview::TcxCustomGridHitTest* __fastcall  GetHitTest(int X, int Y){ return TcxCustomGridViewInfo::GetHitTest(X, Y); }
	
};


class PASCALIMPLEMENTATION TcxGridCardViewSeparatorsViewInfo : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	Types::TRect operator[](int Index) { return Items[Index]; }
	
private:
	TcxGridCardViewViewInfo* FGridViewInfo;
	Classes::TList* FItems;
	Graphics::TColor __fastcall GetColor(void);
	int __fastcall GetCount(void);
	TcxGridCardView* __fastcall GetGridView(void);
	Types::TRect __fastcall GetItem(int Index);
	TcxGridCardsViewInfo* __fastcall GetRecordsViewInfo(void);
	int __fastcall GetWidth(void);
	void __fastcall SetItem(int Index, const Types::TRect &Value);
	void __fastcall CreateItems(void);
	void __fastcall DestroyItems(void);
	
protected:
	virtual Types::TRect __fastcall GetHitTestItem(int Index) = 0 ;
	virtual int __fastcall GetHitTestItemCount(void) = 0 ;
	__property TcxGridCardView* GridView = {read=GetGridView};
	__property TcxGridCardViewViewInfo* GridViewInfo = {read=FGridViewInfo};
	__property int HitTestItemCount = {read=GetHitTestItemCount, nodefault};
	__property Types::TRect HitTestItems[int Index] = {read=GetHitTestItem};
	__property TcxGridCardsViewInfo* RecordsViewInfo = {read=GetRecordsViewInfo};
	
public:
	__fastcall virtual TcxGridCardViewSeparatorsViewInfo(TcxGridCardViewViewInfo* AGridViewInfo);
	__fastcall virtual ~TcxGridCardViewSeparatorsViewInfo(void);
	virtual void __fastcall Calculate(void) = 0 ;
	virtual TcxGridCardViewSeparatorHitTest* __fastcall GetHitTest(const Types::TPoint &P);
	__property Graphics::TColor Color = {read=GetColor, nodefault};
	__property int Count = {read=GetCount, nodefault};
	__property Types::TRect Items[int Index] = {read=GetItem, write=SetItem/*, default*/};
	__property int Width = {read=GetWidth, nodefault};
};


class PASCALIMPLEMENTATION TcxGridCardViewSeparatorHitTest : public Cxgridcustomview::TcxCustomGridHitTest 
{
	typedef Cxgridcustomview::TcxCustomGridHitTest inherited;
	
protected:
	/* virtual class method */ virtual int __fastcall GetHitTestCode(TMetaClass* vmt);
	
public:
	int Index;
	TcxGridCardViewSeparatorsViewInfo* Separators;
	/* virtual class method */ virtual Controls::TCursor __fastcall Cursor(TMetaClass* vmt);
	virtual TMetaClass* __fastcall DragAndDropObjectClass(void);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxGridCardViewSeparatorHitTest(void) : Cxgridcustomview::TcxCustomGridHitTest() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridCardViewSeparatorHitTest(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridCardSizingObject;
class PASCALIMPLEMENTATION TcxGridCardSizingObject : public Cxgridcustomtableview::TcxCustomGridTableDragAndDropObject 
{
	typedef Cxgridcustomtableview::TcxCustomGridTableDragAndDropObject inherited;
	
private:
	int FCardColumnIndex;
	int FCardOriginalWidth;
	int FDestPointX;
	HIDESBASE TcxGridCardView* __fastcall GetGridView(void);
	void __fastcall SetDestPointX(int Value);
	
protected:
	virtual void __fastcall DirtyChanged(void);
	virtual Controls::TCursor __fastcall GetDragAndDropCursor(bool Accepted);
	virtual bool __fastcall GetImmediateStart(void);
	void __fastcall RestoreCardWidth(void);
	void __fastcall SaveCardWidth(void);
	__property int CardColumnIndex = {read=FCardColumnIndex, nodefault};
	__property int CardOriginalWidth = {read=FCardOriginalWidth, write=FCardOriginalWidth, nodefault};
	__property int DestPointX = {read=FDestPointX, write=SetDestPointX, nodefault};
	__property TcxGridCardView* GridView = {read=GetGridView};
	
public:
	virtual void __fastcall BeginDragAndDrop(void);
	virtual void __fastcall DragAndDrop(const Types::TPoint &P, bool &Accepted);
	virtual void __fastcall EndDragAndDrop(bool Accepted);
	virtual void __fastcall Init(const Types::TPoint &P, Cxgridcustomview::TcxCustomGridHitTest* AParams);
public:
	#pragma option push -w-inl
	/* TcxDragAndDropObject.Create */ inline __fastcall virtual TcxGridCardSizingObject(Cxcontrols::TcxControl* AControl) : Cxgridcustomtableview::TcxCustomGridTableDragAndDropObject(AControl) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridCardSizingObject(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxGridCardViewControllerImplClass;

class DELPHICLASS TcxGridCardViewControllerImpl;
class PASCALIMPLEMENTATION TcxGridCardViewControllerImpl : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	TcxGridCardViewController* FController;
	Cxcontrols::TcxControl* __fastcall GetControl(void);
	Cxcustomdata::TcxCustomDataController* __fastcall GetDataController(void);
	int __fastcall GetScrollBarOffsetBegin(void);
	int __fastcall GetScrollBarOffsetEnd(void);
	TcxGridCardViewViewData* __fastcall GetViewData(void);
	TcxGridCardViewViewInfo* __fastcall GetViewInfo(void);
	
protected:
	__property Cxcontrols::TcxControl* Control = {read=GetControl};
	__property TcxGridCardViewController* Controller = {read=FController};
	__property Cxcustomdata::TcxCustomDataController* DataController = {read=GetDataController};
	__property int ScrollBarOffsetBegin = {read=GetScrollBarOffsetBegin, nodefault};
	__property int ScrollBarOffsetEnd = {read=GetScrollBarOffsetEnd, nodefault};
	__property TcxGridCardViewViewData* ViewData = {read=GetViewData};
	__property TcxGridCardViewViewInfo* ViewInfo = {read=GetViewInfo};
	
public:
	__fastcall virtual TcxGridCardViewControllerImpl(TcxGridCardViewController* AController);
	virtual bool __fastcall GetIsRecordsScrollHorizontal(void) = 0 ;
	virtual Cxcontrols::TcxMouseWheelScrollingKind __fastcall GetMouseWheelScrollingKind(void) = 0 ;
	virtual int __fastcall GetScrollDelta(void) = 0 ;
	virtual void __fastcall InitScrollBarsParameters(void) = 0 ;
	DYNAMIC void __fastcall KeyDown(Word &Key, Classes::TShiftState Shift);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridCardViewControllerImpl(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridCardViewControllerHorizontalImpl;
class PASCALIMPLEMENTATION TcxGridCardViewControllerHorizontalImpl : public TcxGridCardViewControllerImpl 
{
	typedef TcxGridCardViewControllerImpl inherited;
	
public:
	virtual bool __fastcall GetIsRecordsScrollHorizontal(void);
	virtual Cxcontrols::TcxMouseWheelScrollingKind __fastcall GetMouseWheelScrollingKind(void);
	virtual int __fastcall GetScrollDelta(void);
	virtual void __fastcall InitScrollBarsParameters(void);
	DYNAMIC void __fastcall KeyDown(Word &Key, Classes::TShiftState Shift);
public:
	#pragma option push -w-inl
	/* TcxGridCardViewControllerImpl.Create */ inline __fastcall virtual TcxGridCardViewControllerHorizontalImpl(TcxGridCardViewController* AController) : TcxGridCardViewControllerImpl(AController) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridCardViewControllerHorizontalImpl(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridCardViewControllerVerticalImpl;
class PASCALIMPLEMENTATION TcxGridCardViewControllerVerticalImpl : public TcxGridCardViewControllerImpl 
{
	typedef TcxGridCardViewControllerImpl inherited;
	
public:
	virtual bool __fastcall GetIsRecordsScrollHorizontal(void);
	virtual Cxcontrols::TcxMouseWheelScrollingKind __fastcall GetMouseWheelScrollingKind(void);
	virtual int __fastcall GetScrollDelta(void);
	virtual void __fastcall InitScrollBarsParameters(void);
	DYNAMIC void __fastcall KeyDown(Word &Key, Classes::TShiftState Shift);
public:
	#pragma option push -w-inl
	/* TcxGridCardViewControllerImpl.Create */ inline __fastcall virtual TcxGridCardViewControllerVerticalImpl(TcxGridCardViewController* AController) : TcxGridCardViewControllerImpl(AController) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridCardViewControllerVerticalImpl(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxGridCardViewController : public Cxgridcustomtableview::TcxCustomGridTableController 
{
	typedef Cxgridcustomtableview::TcxCustomGridTableController inherited;
	
private:
	TcxGridCardViewControllerImpl* FImplementationObject;
	HIDESBASE TcxGridCardView* __fastcall GetGridView(void);
	int __fastcall GetScrollDelta(void);
	int __fastcall GetTopCardIndex(void);
	HIDESBASE TcxGridCardViewViewData* __fastcall GetViewData(void);
	HIDESBASE TcxGridCardViewViewInfo* __fastcall GetViewInfo(void);
	void __fastcall SetTopCardIndex(int Value);
	void __fastcall CreateImplementationObject(void);
	void __fastcall DestroyImplementationObject(void);
	TMetaClass* __fastcall GetImplementationObjectClass(void);
	
protected:
	virtual bool __fastcall GetIsRecordsScrollHorizontal(void);
	virtual Cxcontrols::TcxMouseWheelScrollingKind __fastcall GetMouseWheelScrollingKind(void);
	virtual bool __fastcall IsKeyForMultiSelect(Word AKey, Classes::TShiftState AShift, bool AFocusedRecordChanged);
	void __fastcall ScrollData(Cxclasses::TcxDirection ADirection);
	__property TcxGridCardViewControllerImpl* ImplementationObject = {read=FImplementationObject};
	__property int ScrollDelta = {read=GetScrollDelta, nodefault};
	__property TcxGridCardViewViewData* ViewData = {read=GetViewData};
	__property TcxGridCardViewViewInfo* ViewInfo = {read=GetViewInfo};
	
public:
	__fastcall virtual TcxGridCardViewController(Cxgridcustomview::TcxCustomGridView* AGridView);
	__fastcall virtual ~TcxGridCardViewController(void);
	virtual void __fastcall MakeItemVisible(Cxgridcustomtableview::TcxCustomGridTableItem* AItem);
	virtual void __fastcall InitScrollBarsParameters(void);
	virtual void __fastcall Scroll(Forms::TScrollBarKind AScrollBarKind, Stdctrls::TScrollCode AScrollCode, int &AScrollPos);
	virtual void __fastcall KeyDown(Word &Key, Classes::TShiftState Shift);
	void __fastcall LayoutDirectionChanged(void);
	__property TcxGridCardView* GridView = {read=GetGridView};
	__property int TopCardIndex = {read=GetTopCardIndex, write=SetTopCardIndex, nodefault};
};


typedef TMetaClass*TcxGridCardRowPainterClass;

class DELPHICLASS TcxGridCardRowPainter;
class DELPHICLASS TcxGridCardRowViewInfo;
class DELPHICLASS TcxGridCardRowCaptionViewInfo;
class DELPHICLASS TcxGridCardRowCellViewInfo;
class DELPHICLASS TcxGridCardViewInfo;
class DELPHICLASS TcxGridCard;
class DELPHICLASS TcxGridCardViewRow;
class PASCALIMPLEMENTATION TcxGridCardRowCellViewInfo : public Cxgridcustomtableview::TcxGridTableDataCellViewInfo 
{
	typedef Cxgridcustomtableview::TcxGridTableDataCellViewInfo inherited;
	
private:
	TcxGridCardRowViewInfo* FRowViewInfo;
	TcxGridCardViewInfo* __fastcall GetCardViewInfo(void);
	HIDESBASE TcxGridCardView* __fastcall GetGridView(void);
	HIDESBASE TcxGridCard* __fastcall GetGridRecord(void);
	TcxGridCardViewRow* __fastcall GetRow(void);
	
protected:
	virtual Graphics::TBitmap* __fastcall GetBackgroundBitmap(void);
	virtual bool __fastcall GetTransparent(void);
	
public:
	__fastcall virtual TcxGridCardRowCellViewInfo(TcxGridCardRowViewInfo* ARowViewInfo);
	__property TcxGridCardViewInfo* CardViewInfo = {read=GetCardViewInfo};
	__property TcxGridCard* GridRecord = {read=GetGridRecord};
	__property TcxGridCardView* GridView = {read=GetGridView};
	__property TcxGridCardViewRow* Row = {read=GetRow};
	__property TcxGridCardRowViewInfo* RowViewInfo = {read=FRowViewInfo};
public:
	#pragma option push -w-inl
	/* TcxGridTableDataCellViewInfo.Destroy */ inline __fastcall virtual ~TcxGridCardRowCellViewInfo(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxGridCardRowCaptionViewInfo : public TcxGridCardRowCellViewInfo 
{
	typedef TcxGridCardRowCellViewInfo inherited;
	
protected:
	virtual int __fastcall CalculateRealWidth(void);
	virtual int __fastcall CalculateWidth(void);
	virtual int __fastcall CalculateHeight(void);
	virtual bool __fastcall CanShowHint(void);
	virtual Classes::TAlignment __fastcall GetAlignmentHorz(void);
	virtual Cxclasses::TcxAlignmentVert __fastcall GetAlignmentVert(void);
	virtual TMetaClass* __fastcall GetHitTestClass(void);
	virtual bool __fastcall GetMultiLine(void);
	virtual TMetaClass* __fastcall GetPainterClass(void);
	virtual bool __fastcall GetShowEndEllipsis(void);
	virtual AnsiString __fastcall GetText();
	virtual void __fastcall GetViewParams(Cxgraphics::TcxViewParams &AParams);
public:
	#pragma option push -w-inl
	/* TcxGridCardRowCellViewInfo.Create */ inline __fastcall virtual TcxGridCardRowCaptionViewInfo(TcxGridCardRowViewInfo* ARowViewInfo) : TcxGridCardRowCellViewInfo(ARowViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxGridTableDataCellViewInfo.Destroy */ inline __fastcall virtual ~TcxGridCardRowCaptionViewInfo(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridCardRowDataViewInfo;
class PASCALIMPLEMENTATION TcxGridCardRowDataViewInfo : public TcxGridCardRowCellViewInfo 
{
	typedef TcxGridCardRowCellViewInfo inherited;
	
protected:
	virtual int __fastcall CalculateHeight(void);
	virtual int __fastcall CalculateWidth(void);
	virtual bool __fastcall GetMultiLine(void);
	virtual AnsiString __fastcall GetText();
	virtual void __fastcall GetViewParams(Cxgraphics::TcxViewParams &AParams);
public:
	#pragma option push -w-inl
	/* TcxGridCardRowCellViewInfo.Create */ inline __fastcall virtual TcxGridCardRowDataViewInfo(TcxGridCardRowViewInfo* ARowViewInfo) : TcxGridCardRowCellViewInfo(ARowViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxGridTableDataCellViewInfo.Destroy */ inline __fastcall virtual ~TcxGridCardRowDataViewInfo(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxGridCardRowCaptionViewInfoClass;

typedef TMetaClass*TcxGridCardRowDataViewInfoClass;

class PASCALIMPLEMENTATION TcxGridCardRowViewInfo : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	TcxGridCardRowCaptionViewInfo* FCaptionViewInfo;
	TcxGridCardViewInfo* FCardViewInfo;
	TcxGridCardRowDataViewInfo* FDataViewInfo;
	int FHeight;
	int FIndex;
	int __fastcall GetCaptionWidth(void);
	int __fastcall GetDataWidth(void);
	TcxGridCardView* __fastcall GetGridView(void);
	TcxGridCard* __fastcall GetGridRecord(void);
	TcxGridCardViewViewInfo* __fastcall GetGridViewInfo(void);
	TcxGridCardViewRow* __fastcall GetRow(void);
	void __fastcall CreateViewInfos(void);
	void __fastcall DestroyViewInfos(void);
	
protected:
	virtual void __fastcall BeforeRecalculation(void);
	virtual void __fastcall Calculate(const Types::TRect &ABounds);
	virtual int __fastcall CalculateCaptionWidth(void);
	virtual int __fastcall CalculateHeight(void);
	virtual TMetaClass* __fastcall GetCaptionViewInfoClass(void);
	virtual Graphics::TBitmap* __fastcall GetCellBackgroundBitmap(TcxGridCardRowCellViewInfo* ACell);
	virtual bool __fastcall GetCellTransparent(TcxGridCardRowCellViewInfo* ACell);
	virtual TMetaClass* __fastcall GetDataViewInfoClass(void);
	virtual int __fastcall GetHeight(void);
	virtual TMetaClass* __fastcall GetPainterClass(void);
	virtual void __fastcall GetCaptionViewParams(Cxgraphics::TcxViewParams &AParams) = 0 ;
	virtual void __fastcall GetDataViewParams(Cxgraphics::TcxViewParams &AParams) = 0 ;
	virtual void __fastcall GetViewParams(Cxgraphics::TcxViewParams &AParams) = 0 ;
	__property int CaptionWidth = {read=GetCaptionWidth, nodefault};
	__property TcxGridCardViewInfo* CardViewInfo = {read=FCardViewInfo};
	__property int DataWidth = {read=GetDataWidth, nodefault};
	__property TcxGridCardView* GridView = {read=GetGridView};
	__property TcxGridCard* GridRecord = {read=GetGridRecord};
	__property TcxGridCardViewViewInfo* GridViewInfo = {read=GetGridViewInfo};
	__property TcxGridCardViewRow* Row = {read=GetRow};
	
public:
	#pragma pack(push, 1)
	Types::TRect Bounds;
	#pragma pack(pop)
	
	__fastcall virtual TcxGridCardRowViewInfo(TcxGridCardViewInfo* ACardViewInfo, int AIndex);
	__fastcall virtual ~TcxGridCardRowViewInfo(void);
	virtual Cxgridcustomtableview::TcxGridRecordCellHitTest* __fastcall GetHitTest(const Types::TPoint &P);
	__property TcxGridCardRowCaptionViewInfo* CaptionViewInfo = {read=FCaptionViewInfo};
	__property TcxGridCardRowDataViewInfo* DataViewInfo = {read=FDataViewInfo};
	__property int Height = {read=GetHeight, nodefault};
	__property int Index = {read=FIndex, nodefault};
};


class PASCALIMPLEMENTATION TcxGridCardRowPainter : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	Cxgraphics::TcxCanvas* FCanvas;
	TcxGridCardRowViewInfo* FViewInfo;
	
protected:
	virtual void __fastcall DrawFocusRect(void);
	__property Cxgraphics::TcxCanvas* Canvas = {read=FCanvas};
	__property TcxGridCardRowViewInfo* ViewInfo = {read=FViewInfo};
	
public:
	__fastcall virtual TcxGridCardRowPainter(Cxgraphics::TcxCanvas* ACanvas, TcxGridCardRowViewInfo* AViewInfo);
	virtual void __fastcall Paint(void);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridCardRowPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridCardPainter;
class PASCALIMPLEMENTATION TcxGridCardPainter : public Cxgridcustomtableview::TcxCustomGridRecordPainter 
{
	typedef Cxgridcustomtableview::TcxCustomGridRecordPainter inherited;
	
private:
	HIDESBASE TcxGridCardViewInfo* __fastcall GetViewInfo(void);
	
protected:
	virtual void __fastcall DrawCardBorder(void);
	virtual void __fastcall DrawRows(void);
	virtual void __fastcall Paint(void);
	__property TcxGridCardViewInfo* ViewInfo = {read=GetViewInfo};
public:
	#pragma option push -w-inl
	/* TcxCustomGridCellPainter.Create */ inline __fastcall virtual TcxGridCardPainter(Cxgraphics::TcxCanvas* ACanvas, Cxgridcustomview::TcxCustomGridCellViewInfo* AViewInfo) : Cxgridcustomtableview::TcxCustomGridRecordPainter(ACanvas, AViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridCardPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridCardViewPainter;
class PASCALIMPLEMENTATION TcxGridCardViewPainter : public Cxgridcustomtableview::TcxCustomGridTablePainter 
{
	typedef Cxgridcustomtableview::TcxCustomGridTablePainter inherited;
	
protected:
	virtual void __fastcall DrawBackground(void);
	virtual void __fastcall DrawSeparators(void);
	HIDESBASE TcxGridCardViewViewInfo* __fastcall ViewInfo(void);
public:
	#pragma option push -w-inl
	/* TcxGridViewHandler.Create */ inline __fastcall virtual TcxGridCardViewPainter(Cxgridcustomview::TcxCustomGridView* AGridView) : Cxgridcustomtableview::TcxCustomGridTablePainter(AGridView) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxGridCardViewPainter(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxGridCard : public Cxgridcustomtableview::TcxCustomGridRecord 
{
	typedef Cxgridcustomtableview::TcxCustomGridRecord inherited;
	
protected:
	virtual bool __fastcall GetHasCells(void);
	virtual TMetaClass* __fastcall GetViewInfoClass(void);
public:
	#pragma option push -w-inl
	/* TcxCustomGridRecord.Create */ inline __fastcall virtual TcxGridCard(Cxgridcustomtableview::TcxCustomGridTableViewData* AViewData, int AIndex, const Cxcustomdata::TcxRowInfo &ARecordInfo) : Cxgridcustomtableview::TcxCustomGridRecord(AViewData, AIndex, ARecordInfo) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomGridRecord.Destroy */ inline __fastcall virtual ~TcxGridCard(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxGridCardViewViewData : public Cxgridcustomtableview::TcxCustomGridTableViewData 
{
	typedef Cxgridcustomtableview::TcxCustomGridTableViewData inherited;
	
private:
	TcxGridCard* __fastcall GetCard(int Index);
	int __fastcall GetCardCount(void);
	
protected:
	virtual TMetaClass* __fastcall GetRecordClass(const Cxcustomdata::TcxRowInfo &ARecordInfo);
	
public:
	__property int CardCount = {read=GetCardCount, nodefault};
	__property TcxGridCard* Cards[int Index] = {read=GetCard};
public:
	#pragma option push -w-inl
	/* TcxCustomGridTableViewData.Create */ inline __fastcall virtual TcxGridCardViewViewData(Cxgridcustomview::TcxCustomGridView* AGridView) : Cxgridcustomtableview::TcxCustomGridTableViewData(AGridView) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomGridTableViewData.Destroy */ inline __fastcall virtual ~TcxGridCardViewViewData(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridCardViewColumn;
class DELPHICLASS TcxGridCardViewColumns;
class PASCALIMPLEMENTATION TcxGridCardViewColumns : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	TcxGridCardViewColumn* operator[](int Index) { return Items[Index]; }
	
private:
	TcxGridCardsViewInfo* FCardsViewInfo;
	Classes::TList* FItems;
	int __fastcall GetCount(void);
	TcxGridCardViewColumn* __fastcall GetItem(int Index);
	TcxGridCardViewColumn* __fastcall GetLast(void);
	int __fastcall GetVisibleCount(void);
	void __fastcall CreateItems(void);
	void __fastcall DestroyItems(void);
	
protected:
	__property TcxGridCardsViewInfo* CardsViewInfo = {read=FCardsViewInfo};
	
public:
	__fastcall TcxGridCardViewColumns(TcxGridCardsViewInfo* ACardsViewInfo);
	__fastcall virtual ~TcxGridCardViewColumns(void);
	__property int Count = {read=GetCount, nodefault};
	__property TcxGridCardViewColumn* Items[int Index] = {read=GetItem/*, default*/};
	__property TcxGridCardViewColumn* Last = {read=GetLast};
	__property int VisibleCount = {read=GetVisibleCount, nodefault};
};


class PASCALIMPLEMENTATION TcxGridCardViewColumn : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	TcxGridCardViewInfo* operator[](int Index) { return Rows[Index]; }
	
private:
	TcxGridCardViewColumns* FColumns;
	int FIndex;
	Classes::TList* FRows;
	TcxGridCardViewInfo* __fastcall GetLastRow(void);
	TcxGridCardViewInfo* __fastcall GetRow(int Index);
	int __fastcall GetRowCount(void);
	int __fastcall GetVisibleRowCount(void);
	void __fastcall SetRow(int Index, TcxGridCardViewInfo* Value);
	
public:
	__fastcall TcxGridCardViewColumn(TcxGridCardViewColumns* AColumns, int AIndex);
	__fastcall virtual ~TcxGridCardViewColumn(void);
	TcxGridCardViewInfo* __fastcall GetNearestRow(int APos);
	__property int Index = {read=FIndex, nodefault};
	__property TcxGridCardViewInfo* LastRow = {read=GetLastRow};
	__property int RowCount = {read=GetRowCount, nodefault};
	__property TcxGridCardViewInfo* Rows[int Index] = {read=GetRow, write=SetRow/*, default*/};
	__property int VisibleRowCount = {read=GetVisibleRowCount, nodefault};
};


typedef TMetaClass*TcxGridCardViewColumnsClass;

typedef TMetaClass*TcxGridCardRowViewInfoClass;

class DELPHICLASS TcxGridCardDataRowViewInfo;
class PASCALIMPLEMENTATION TcxGridCardDataRowViewInfo : public TcxGridCardRowViewInfo 
{
	typedef TcxGridCardRowViewInfo inherited;
	
protected:
	virtual void __fastcall GetCaptionViewParams(Cxgraphics::TcxViewParams &AParams);
	virtual Graphics::TBitmap* __fastcall GetCellBackgroundBitmap(TcxGridCardRowCellViewInfo* ACell);
	virtual void __fastcall GetDataViewParams(Cxgraphics::TcxViewParams &AParams);
public:
	#pragma option push -w-inl
	/* TcxGridCardRowViewInfo.Create */ inline __fastcall virtual TcxGridCardDataRowViewInfo(TcxGridCardViewInfo* ACardViewInfo, int AIndex) : TcxGridCardRowViewInfo(ACardViewInfo, AIndex) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxGridCardRowViewInfo.Destroy */ inline __fastcall virtual ~TcxGridCardDataRowViewInfo(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridCardCaptionRowViewInfo;
class PASCALIMPLEMENTATION TcxGridCardCaptionRowViewInfo : public TcxGridCardRowViewInfo 
{
	typedef TcxGridCardRowViewInfo inherited;
	
protected:
	virtual void __fastcall GetCaptionViewParams(Cxgraphics::TcxViewParams &AParams);
	virtual Graphics::TBitmap* __fastcall GetCellBackgroundBitmap(TcxGridCardRowCellViewInfo* ACell);
	virtual bool __fastcall GetCellTransparent(TcxGridCardRowCellViewInfo* ACell);
	virtual void __fastcall GetDataViewParams(Cxgraphics::TcxViewParams &AParams);
	virtual void __fastcall GetViewParams(Cxgraphics::TcxViewParams &AParams);
public:
	#pragma option push -w-inl
	/* TcxGridCardRowViewInfo.Create */ inline __fastcall virtual TcxGridCardCaptionRowViewInfo(TcxGridCardViewInfo* ACardViewInfo, int AIndex) : TcxGridCardRowViewInfo(ACardViewInfo, AIndex) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxGridCardRowViewInfo.Destroy */ inline __fastcall virtual ~TcxGridCardCaptionRowViewInfo(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxGridCardViewInfo : public Cxgridcustomtableview::TcxCustomGridRecordViewInfo 
{
	typedef Cxgridcustomtableview::TcxCustomGridRecordViewInfo inherited;
	
private:
	int FCaptionWidth;
	int FCol;
	int FRow;
	Classes::TList* FRowViewInfos;
	int __fastcall GetCaptionWidth(void);
	int __fastcall GetCardBorderWidth(void);
	HIDESBASE TcxGridCardView* __fastcall GetGridView(void);
	TcxGridCard* __fastcall GetGridRecord(void);
	TcxGridCardsViewInfo* __fastcall GetRecordsViewInfo(void);
	TcxGridCardRowViewInfo* __fastcall GetRowViewInfo(int Index);
	int __fastcall GetRowViewInfoCount(void);
	void __fastcall CreateRowViewInfos(void);
	void __fastcall DestroyRowViewInfos(void);
	
protected:
	virtual int __fastcall CalculateCaptionWidth(void);
	virtual int __fastcall CalculateHeight(void);
	virtual int __fastcall CalculateWidth(void);
	virtual bool __fastcall GetAutoHeight(void);
	virtual Graphics::TBitmap* __fastcall GetCardBorderBackgroundBitmap(void);
	virtual Graphics::TColor __fastcall GetCardBorderColor(void);
	virtual Types::TRect __fastcall GetContentBounds();
	virtual int __fastcall GetContentWidth(void);
	virtual TMetaClass* __fastcall GetPainterClass(void);
	virtual bool __fastcall GetTransparent(void);
	virtual bool __fastcall GetVisible(void);
	virtual int __fastcall GetWidth(void);
	virtual TMetaClass* __fastcall GetRowViewInfoClass(TcxGridCardViewRow* ARow);
	
public:
	__fastcall virtual TcxGridCardViewInfo(Cxgridcustomtableview::TcxCustomGridRecordsViewInfo* ARecordsViewInfo, Cxgridcustomtableview::TcxCustomGridRecord* ARecord);
	__fastcall virtual ~TcxGridCardViewInfo(void);
	virtual void __fastcall BeforeRecalculation(void);
	virtual void __fastcall Calculate(int ALeftBound, int ATopBound, int AWidth = 0xffffffff, int AHeight = 0xffffffff)/* overload */;
	virtual Types::TRect __fastcall GetBoundsForItem(Cxgridcustomtableview::TcxCustomGridTableItem* AItem);
	virtual Cxgridcustomtableview::TcxGridTableDataCellViewInfo* __fastcall GetCellViewInfoByItem(Cxgridcustomtableview::TcxCustomGridTableItem* AItem);
	virtual Cxgridcustomview::TcxCustomGridHitTest* __fastcall GetHitTest(const Types::TPoint &P);
	__property int CaptionWidth = {read=GetCaptionWidth, nodefault};
	__property Graphics::TBitmap* CardBorderBackgroundBitmap = {read=GetCardBorderBackgroundBitmap};
	__property Graphics::TColor CardBorderColor = {read=GetCardBorderColor, nodefault};
	__property int CardBorderWidth = {read=GetCardBorderWidth, nodefault};
	__property int Col = {read=FCol, nodefault};
	__property TcxGridCardView* GridView = {read=GetGridView};
	__property TcxGridCard* GridRecord = {read=GetGridRecord};
	__property TcxGridCardsViewInfo* RecordsViewInfo = {read=GetRecordsViewInfo};
	__property int Row = {read=FRow, nodefault};
	__property int RowViewInfoCount = {read=GetRowViewInfoCount, nodefault};
	__property TcxGridCardRowViewInfo* RowViewInfos[int Index] = {read=GetRowViewInfo};
	
/* Hoisted overloads: */
	
public:
	inline void __fastcall  Calculate(const Types::TRect &ABounds){ TcxCustomGridCellViewInfo::Calculate(ABounds); }
	
};


class PASCALIMPLEMENTATION TcxGridCardsViewInfo : public Cxgridcustomtableview::TcxCustomGridRecordsViewInfo 
{
	typedef Cxgridcustomtableview::TcxCustomGridRecordsViewInfo inherited;
	
public:
	TcxGridCardViewInfo* operator[](int Index) { return Items[Index]; }
	
private:
	int FCardHeight;
	TcxGridCardViewColumns* FColumns;
	int __fastcall GetCardBorderWidth(void);
	int __fastcall GetCardWidth(void);
	int __fastcall GetCardContentWidth(void);
	Types::TRect __fastcall GetGridContentBounds();
	HIDESBASE TcxGridCardView* __fastcall GetGridView(void);
	TcxGridCardViewViewInfo* __fastcall GetGridViewInfo(void);
	HIDESBASE TcxGridCardViewInfo* __fastcall GetItem(int Index);
	HIDESBASE TcxGridCardViewViewData* __fastcall GetViewData(void);
	
protected:
	int FPartVisibleCount;
	virtual Types::TRect __fastcall CalculateBounds();
	virtual int __fastcall CalculateCardHeight(void);
	virtual bool __fastcall GetAutoCardHeight(void);
	__property Types::TRect GridContentBounds = {read=GetGridContentBounds};
	__property TcxGridCardView* GridView = {read=GetGridView};
	__property TcxGridCardViewViewInfo* GridViewInfo = {read=GetGridViewInfo};
	__property TcxGridCardViewViewData* ViewData = {read=GetViewData};
	
public:
	__fastcall virtual TcxGridCardsViewInfo(Cxgridcustomtableview::TcxCustomGridTableViewInfo* AGridViewInfo);
	__fastcall virtual ~TcxGridCardsViewInfo(void);
	virtual void __fastcall Calculate(void);
	HIDESBASE virtual TcxGridCardViewInfo* __fastcall GetRealItem(Cxgridcustomtableview::TcxCustomGridRecord* ARecord, int ARecordIndex);
	__property bool AutoCardHeight = {read=GetAutoCardHeight, nodefault};
	__property int CardBorderWidth = {read=GetCardBorderWidth, nodefault};
	__property int CardContentWidth = {read=GetCardContentWidth, nodefault};
	__property int CardHeight = {read=FCardHeight, nodefault};
	__property int CardWidth = {read=GetCardWidth, nodefault};
	__property TcxGridCardViewColumns* Columns = {read=FColumns};
	__property TcxGridCardViewInfo* Items[int Index] = {read=GetItem/*, default*/};
	__property int PartVisibleCount = {read=FPartVisibleCount, nodefault};
};


class DELPHICLASS TcxGridCardsHorizontalViewInfo;
class PASCALIMPLEMENTATION TcxGridCardsHorizontalViewInfo : public TcxGridCardsViewInfo 
{
	typedef TcxGridCardsViewInfo inherited;
	
public:
	virtual void __fastcall Calculate(void);
public:
	#pragma option push -w-inl
	/* TcxGridCardsViewInfo.Create */ inline __fastcall virtual TcxGridCardsHorizontalViewInfo(Cxgridcustomtableview::TcxCustomGridTableViewInfo* AGridViewInfo) : TcxGridCardsViewInfo(AGridViewInfo) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxGridCardsViewInfo.Destroy */ inline __fastcall virtual ~TcxGridCardsHorizontalViewInfo(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridCardsVerticalViewInfo;
class PASCALIMPLEMENTATION TcxGridCardsVerticalViewInfo : public TcxGridCardsViewInfo 
{
	typedef TcxGridCardsViewInfo inherited;
	
public:
	virtual void __fastcall Calculate(void);
public:
	#pragma option push -w-inl
	/* TcxGridCardsViewInfo.Create */ inline __fastcall virtual TcxGridCardsVerticalViewInfo(Cxgridcustomtableview::TcxCustomGridTableViewInfo* AGridViewInfo) : TcxGridCardsViewInfo(AGridViewInfo) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxGridCardsViewInfo.Destroy */ inline __fastcall virtual ~TcxGridCardsVerticalViewInfo(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridCardViewSeparatorsHorizontalViewInfo;
class PASCALIMPLEMENTATION TcxGridCardViewSeparatorsHorizontalViewInfo : public TcxGridCardViewSeparatorsViewInfo 
{
	typedef TcxGridCardViewSeparatorsViewInfo inherited;
	
protected:
	virtual Types::TRect __fastcall GetHitTestItem(int Index);
	virtual int __fastcall GetHitTestItemCount(void);
	
public:
	virtual void __fastcall Calculate(void);
public:
	#pragma option push -w-inl
	/* TcxGridCardViewSeparatorsViewInfo.Create */ inline __fastcall virtual TcxGridCardViewSeparatorsHorizontalViewInfo(TcxGridCardViewViewInfo* AGridViewInfo) : TcxGridCardViewSeparatorsViewInfo(AGridViewInfo) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxGridCardViewSeparatorsViewInfo.Destroy */ inline __fastcall virtual ~TcxGridCardViewSeparatorsHorizontalViewInfo(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridCardViewSeparatorsVerticalViewInfo;
class PASCALIMPLEMENTATION TcxGridCardViewSeparatorsVerticalViewInfo : public TcxGridCardViewSeparatorsViewInfo 
{
	typedef TcxGridCardViewSeparatorsViewInfo inherited;
	
protected:
	virtual Types::TRect __fastcall GetHitTestItem(int Index);
	virtual int __fastcall GetHitTestItemCount(void);
	
public:
	virtual void __fastcall Calculate(void);
public:
	#pragma option push -w-inl
	/* TcxGridCardViewSeparatorsViewInfo.Create */ inline __fastcall virtual TcxGridCardViewSeparatorsVerticalViewInfo(TcxGridCardViewViewInfo* AGridViewInfo) : TcxGridCardViewSeparatorsViewInfo(AGridViewInfo) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxGridCardViewSeparatorsViewInfo.Destroy */ inline __fastcall virtual ~TcxGridCardViewSeparatorsVerticalViewInfo(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridCardViewRowOptions;
class PASCALIMPLEMENTATION TcxGridCardViewRowOptions : public Cxgridcustomtableview::TcxCustomGridTableItemOptions 
{
	typedef Cxgridcustomtableview::TcxCustomGridTableItemOptions inherited;
	
private:
	bool FShowCaption;
	void __fastcall SetShowCaption(bool Value);
	
public:
	__fastcall virtual TcxGridCardViewRowOptions(Cxgridcustomtableview::TcxCustomGridTableItem* AItem);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	
__published:
	__property bool ShowCaption = {read=FShowCaption, write=SetShowCaption, default=1};
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxGridCardViewRowOptions(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridCardViewRowStyles;
class PASCALIMPLEMENTATION TcxGridCardViewRowStyles : public Cxgridcustomtableview::TcxCustomGridTableItemStyles 
{
	typedef Cxgridcustomtableview::TcxCustomGridTableItemStyles inherited;
	
private:
	Cxgridcustomtableview::TcxGridGetCellStyleEvent FOnGetCaptionRowStyle;
	Cxgridcustomtableview::TcxGridGetCellStyleEvent FOnGetCaptionStyle;
	HIDESBASE TcxGridCardView* __fastcall GetGridViewValue(void);
	
protected:
	virtual void __fastcall GetDefaultViewParams(int Index, void * AData, /* out */ Cxgraphics::TcxViewParams &AParams);
	
public:
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual void __fastcall GetCaptionParams(Cxgridcustomtableview::TcxCustomGridRecord* ARecord, /* out */ Cxgraphics::TcxViewParams &AParams);
	virtual void __fastcall GetCaptionRowParams(Cxgridcustomtableview::TcxCustomGridRecord* ARecord, /* out */ Cxgraphics::TcxViewParams &AParams);
	__property TcxGridCardView* GridView = {read=GetGridViewValue};
	
__published:
	__property Cxstyles::TcxStyle* Caption = {read=GetValue, write=SetValue, index=2};
	__property Cxstyles::TcxStyle* CaptionRow = {read=GetValue, write=SetValue, index=1};
	__property Cxgridcustomtableview::TcxGridGetCellStyleEvent OnGetCaptionRowStyle = {read=FOnGetCaptionRowStyle, write=FOnGetCaptionRowStyle};
	__property Cxgridcustomtableview::TcxGridGetCellStyleEvent OnGetCaptionStyle = {read=FOnGetCaptionStyle, write=FOnGetCaptionStyle};
public:
	#pragma option push -w-inl
	/* TcxCustomStyles.Create */ inline __fastcall virtual TcxGridCardViewRowStyles(Classes::TPersistent* AOwner) : Cxgridcustomtableview::TcxCustomGridTableItemStyles(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomStyles.Destroy */ inline __fastcall virtual ~TcxGridCardViewRowStyles(void) { }
	#pragma option pop
	
};


#pragma option push -b-
enum TcxGridCardViewRowKind { rkData, rkCaption };
#pragma option pop

class PASCALIMPLEMENTATION TcxGridCardViewRow : public Cxgridcustomtableview::TcxCustomGridTableItem 
{
	typedef Cxgridcustomtableview::TcxCustomGridTableItem inherited;
	
private:
	TcxGridCardViewRowKind FKind;
	Classes::TAlignment __fastcall GetCaptionAlignmentHorz(void);
	Cxclasses::TcxAlignmentVert __fastcall GetCaptionAlignmentVert(void);
	TcxGridCardViewRowOptions* __fastcall GetOptions(void);
	TcxGridCardViewRowStyles* __fastcall GetStyles(void);
	void __fastcall SetCaptionAlignmentHorz(Classes::TAlignment Value);
	void __fastcall SetCaptionAlignmentVert(Cxclasses::TcxAlignmentVert Value);
	void __fastcall SetKind(TcxGridCardViewRowKind Value);
	HIDESBASE void __fastcall SetOptions(TcxGridCardViewRowOptions* Value);
	HIDESBASE void __fastcall SetStyles(TcxGridCardViewRowStyles* Value);
	bool __fastcall IsCaptionAlignmentHorzStored(void);
	bool __fastcall IsCaptionAlignmentVertStored(void);
	
protected:
	virtual bool __fastcall GetStoredProperties(Classes::TStrings* AProperties);
	virtual void __fastcall GetPropertyValue(const AnsiString AName, Variant &AValue);
	virtual void __fastcall SetPropertyValue(const AnsiString AName, const Variant &AValue);
	virtual bool __fastcall CanFocus(void);
	virtual int __fastcall DefaultWidth(void);
	virtual TMetaClass* __fastcall GetOptionsClass(void);
	virtual TMetaClass* __fastcall GetStylesClass(void);
	HIDESBASE TcxGridCardView* __fastcall GridView(void);
	
public:
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	
__published:
	__property Classes::TAlignment CaptionAlignmentHorz = {read=GetCaptionAlignmentHorz, write=SetCaptionAlignmentHorz, stored=IsCaptionAlignmentHorzStored, nodefault};
	__property Cxclasses::TcxAlignmentVert CaptionAlignmentVert = {read=GetCaptionAlignmentVert, write=SetCaptionAlignmentVert, stored=IsCaptionAlignmentVertStored, nodefault};
	__property TcxGridCardViewRowKind Kind = {read=FKind, write=SetKind, default=0};
	__property TcxGridCardViewRowOptions* Options = {read=GetOptions, write=SetOptions};
	__property SortOrder  = {default=0};
	__property TcxGridCardViewRowStyles* Styles = {read=GetStyles, write=SetStyles};
public:
	#pragma option push -w-inl
	/* TcxCustomGridTableItem.Create */ inline __fastcall virtual TcxGridCardViewRow(Classes::TComponent* AOwner) : Cxgridcustomtableview::TcxCustomGridTableItem(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomGridTableItem.Destroy */ inline __fastcall virtual ~TcxGridCardViewRow(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridCardViewBackgroundBitmaps;
class PASCALIMPLEMENTATION TcxGridCardViewBackgroundBitmaps : public Cxgridcustomtableview::TcxCustomGridTableBackgroundBitmaps 
{
	typedef Cxgridcustomtableview::TcxCustomGridTableBackgroundBitmaps inherited;
	
protected:
	virtual int __fastcall GetBitmapStyleIndex(int Index);
	
public:
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual Graphics::TBitmap* __fastcall GetBitmap(int Index);
	
__published:
	__property Graphics::TBitmap* CaptionRow = {read=GetValue, write=SetValue, index=2};
	__property Graphics::TBitmap* CardBorder = {read=GetValue, write=SetValue, index=3};
	__property Graphics::TBitmap* RowCaption = {read=GetValue, write=SetValue, index=4};
public:
	#pragma option push -w-inl
	/* TcxCustomGridBackgroundBitmaps.Create */ inline __fastcall virtual TcxGridCardViewBackgroundBitmaps(Cxgridcustomview::TcxCustomGridView* AGridView) : Cxgridcustomtableview::TcxCustomGridTableBackgroundBitmaps(AGridView) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomGridBackgroundBitmaps.Destroy */ inline __fastcall virtual ~TcxGridCardViewBackgroundBitmaps(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridCardViewOptionsBehavior;
class PASCALIMPLEMENTATION TcxGridCardViewOptionsBehavior : public Cxgridcustomtableview::TcxCustomGridTableOptionsBehavior 
{
	typedef Cxgridcustomtableview::TcxCustomGridTableOptionsBehavior inherited;
	
public:
	__fastcall virtual TcxGridCardViewOptionsBehavior(Cxgridcustomview::TcxCustomGridView* AGridView);
	
__published:
	__property PullFocusing  = {default=0};
public:
	#pragma option push -w-inl
	/* TcxCustomGridOptions.Destroy */ inline __fastcall virtual ~TcxGridCardViewOptionsBehavior(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridCardViewOptionsData;
class PASCALIMPLEMENTATION TcxGridCardViewOptionsData : public Cxgridcustomtableview::TcxCustomGridTableOptionsData 
{
	typedef Cxgridcustomtableview::TcxCustomGridTableOptionsData inherited;
	
public:
	#pragma option push -w-inl
	/* TcxCustomGridTableOptionsData.Create */ inline __fastcall virtual TcxGridCardViewOptionsData(Cxgridcustomview::TcxCustomGridView* AGridView) : Cxgridcustomtableview::TcxCustomGridTableOptionsData(AGridView) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomGridOptions.Destroy */ inline __fastcall virtual ~TcxGridCardViewOptionsData(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridCardViewOptionsSelection;
class PASCALIMPLEMENTATION TcxGridCardViewOptionsSelection : public Cxgridcustomtableview::TcxCustomGridTableOptionsSelection 
{
	typedef Cxgridcustomtableview::TcxCustomGridTableOptionsSelection inherited;
	
public:
	#pragma option push -w-inl
	/* TcxCustomGridTableOptionsSelection.Create */ inline __fastcall virtual TcxGridCardViewOptionsSelection(Cxgridcustomview::TcxCustomGridView* AGridView) : Cxgridcustomtableview::TcxCustomGridTableOptionsSelection(AGridView) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomGridOptions.Destroy */ inline __fastcall virtual ~TcxGridCardViewOptionsSelection(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridCardViewOptionsView;
class PASCALIMPLEMENTATION TcxGridCardViewOptionsView : public Cxgridcustomtableview::TcxCustomGridTableOptionsView 
{
	typedef Cxgridcustomtableview::TcxCustomGridTableOptionsView inherited;
	
private:
	char FCaptionSeparator;
	int FCaptionWidth;
	int FCardBorderWidth;
	int FCardWidth;
	Graphics::TColor FSeparatorColor;
	int FSeparatorWidth;
	bool __fastcall GetRowCaptionAutoHeight(void);
	bool __fastcall GetRowCaptionEndEllipsis(void);
	void __fastcall SetCaptionSeparator(char Value);
	void __fastcall SetCaptionWidth(int Value);
	void __fastcall SetCardBorderWidth(int Value);
	void __fastcall SetCardWidth(int Value);
	void __fastcall SetRowCaptionAutoHeight(bool Value);
	void __fastcall SetRowCaptionEndEllipsis(bool Value);
	void __fastcall SetSeparatorColor(Graphics::TColor Value);
	void __fastcall SetSeparatorWidth(int Value);
	
public:
	__fastcall virtual TcxGridCardViewOptionsView(Cxgridcustomview::TcxCustomGridView* AGridView);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	Graphics::TColor __fastcall GetSeparatorColor(void);
	
__published:
	__property char CaptionSeparator = {read=FCaptionSeparator, write=SetCaptionSeparator, default=58};
	__property int CaptionWidth = {read=FCaptionWidth, write=SetCaptionWidth, default=0};
	__property int CardBorderWidth = {read=FCardBorderWidth, write=SetCardBorderWidth, default=2};
	__property int CardWidth = {read=FCardWidth, write=SetCardWidth, default=200};
	__property CellAutoHeight  = {default=0};
	__property CellTextMaxLineCount  = {default=0};
	__property bool RowCaptionAutoHeight = {read=GetRowCaptionAutoHeight, write=SetRowCaptionAutoHeight, default=0};
	__property bool RowCaptionEndEllipsis = {read=GetRowCaptionEndEllipsis, write=SetRowCaptionEndEllipsis, default=0};
	__property Graphics::TColor SeparatorColor = {read=FSeparatorColor, write=SetSeparatorColor, default=536870912};
	__property int SeparatorWidth = {read=FSeparatorWidth, write=SetSeparatorWidth, default=2};
public:
	#pragma option push -w-inl
	/* TcxCustomGridOptions.Destroy */ inline __fastcall virtual ~TcxGridCardViewOptionsView(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridCardViewStyles;
class PASCALIMPLEMENTATION TcxGridCardViewStyles : public Cxgridcustomtableview::TcxCustomGridTableViewStyles 
{
	typedef Cxgridcustomtableview::TcxCustomGridTableViewStyles inherited;
	
private:
	Cxgridcustomtableview::TcxGridGetCellStyleEvent FOnGetCaptionRowStyle;
	Cxgridcustomtableview::TcxGridGetRecordStyleEvent FOnGetCardBorderStyle;
	Cxgridcustomtableview::TcxGridGetCellStyleEvent FOnGetRowCaptionStyle;
	
protected:
	virtual void __fastcall GetDefaultViewParams(int Index, void * AData, /* out */ Cxgraphics::TcxViewParams &AParams);
	
public:
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual void __fastcall GetCaptionRowParams(Cxgridcustomtableview::TcxCustomGridRecord* ARecord, Cxgridcustomtableview::TcxCustomGridTableItem* AItem, /* out */ Cxgraphics::TcxViewParams &AParams);
	virtual void __fastcall GetCardBorderParams(Cxgridcustomtableview::TcxCustomGridRecord* ARecord, /* out */ Cxgraphics::TcxViewParams &AParams);
	virtual void __fastcall GetDataCellContentParams(Cxgridcustomtableview::TcxCustomGridRecord* ARecord, Cxgridcustomtableview::TcxCustomGridTableItem* AItem, /* out */ Cxgraphics::TcxViewParams &AParams);
	virtual void __fastcall GetRowCaptionParams(Cxgridcustomtableview::TcxCustomGridRecord* ARecord, Cxgridcustomtableview::TcxCustomGridTableItem* AItem, /* out */ Cxgraphics::TcxViewParams &AParams);
	
__published:
	__property Cxstyles::TcxStyle* CaptionRow = {read=GetValue, write=SetValue, index=7};
	__property Cxstyles::TcxStyle* CardBorder = {read=GetValue, write=SetValue, index=8};
	__property Cxstyles::TcxStyle* RowCaption = {read=GetValue, write=SetValue, index=9};
	__property Cxgridcustomtableview::TcxGridGetCellStyleEvent OnGetCaptionRowStyle = {read=FOnGetCaptionRowStyle, write=FOnGetCaptionRowStyle};
	__property Cxgridcustomtableview::TcxGridGetRecordStyleEvent OnGetCardBorderStyle = {read=FOnGetCardBorderStyle, write=FOnGetCardBorderStyle};
	__property Cxgridcustomtableview::TcxGridGetCellStyleEvent OnGetRowCaptionStyle = {read=FOnGetRowCaptionStyle, write=FOnGetRowCaptionStyle};
public:
	#pragma option push -w-inl
	/* TcxCustomStyles.Create */ inline __fastcall virtual TcxGridCardViewStyles(Classes::TPersistent* AOwner) : Cxgridcustomtableview::TcxCustomGridTableViewStyles(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomStyles.Destroy */ inline __fastcall virtual ~TcxGridCardViewStyles(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridCardViewStyleSheet;
class PASCALIMPLEMENTATION TcxGridCardViewStyleSheet : public Cxstyles::TcxCustomStyleSheet 
{
	typedef Cxstyles::TcxCustomStyleSheet inherited;
	
private:
	TcxGridCardViewStyles* __fastcall GetStylesValue(void);
	void __fastcall SetStylesValue(TcxGridCardViewStyles* Value);
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetStylesClass(TMetaClass* vmt);
	
__published:
	__property TcxGridCardViewStyles* Styles = {read=GetStylesValue, write=SetStylesValue};
public:
	#pragma option push -w-inl
	/* TcxCustomStyleSheet.Create */ inline __fastcall virtual TcxGridCardViewStyleSheet(Classes::TComponent* AOwner) : Cxstyles::TcxCustomStyleSheet(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomStyleSheet.Destroy */ inline __fastcall virtual ~TcxGridCardViewStyleSheet(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxGridCardView : public Cxgridcustomtableview::TcxCustomGridTableView 
{
	typedef Cxgridcustomtableview::TcxCustomGridTableView inherited;
	
private:
	TcxGridCardViewLayoutDirection FLayoutDirection;
	HIDESBASE TcxGridCardViewBackgroundBitmaps* __fastcall GetBackgroundBitmaps(void);
	Cxgrid::TcxCustomGrid* __fastcall GetControl(void);
	HIDESBASE TcxGridCardViewController* __fastcall GetController(void);
	TcxGridCardViewOptionsBehavior* __fastcall GetOptionsBehavior(void);
	TcxGridCardViewOptionsData* __fastcall GetOptionsData(void);
	HIDESBASE TcxGridCardViewOptionsSelection* __fastcall GetOptionsSelection(void);
	HIDESBASE TcxGridCardViewOptionsView* __fastcall GetOptionsView(void);
	HIDESBASE TcxGridCardViewPainter* __fastcall GetPainter(void);
	TcxGridCardViewRow* __fastcall GetRow(int Index);
	int __fastcall GetRowCount(void);
	HIDESBASE TcxGridCardViewStyles* __fastcall GetStyles(void);
	HIDESBASE TcxGridCardViewViewData* __fastcall GetViewData(void);
	HIDESBASE TcxGridCardViewViewInfo* __fastcall GetViewInfo(void);
	TcxGridCardViewRow* __fastcall GetVisibleRow(int Index);
	int __fastcall GetVisibleRowCount(void);
	HIDESBASE void __fastcall SetBackgroundBitmaps(TcxGridCardViewBackgroundBitmaps* Value);
	void __fastcall SetLayoutDirection(TcxGridCardViewLayoutDirection Value);
	HIDESBASE void __fastcall SetOptionsBehavior(TcxGridCardViewOptionsBehavior* Value);
	HIDESBASE void __fastcall SetOptionsData(TcxGridCardViewOptionsData* Value);
	HIDESBASE void __fastcall SetOptionsSelection(TcxGridCardViewOptionsSelection* Value);
	HIDESBASE void __fastcall SetOptionsView(TcxGridCardViewOptionsView* Value);
	void __fastcall SetRow(int Index, TcxGridCardViewRow* Value);
	HIDESBASE void __fastcall SetStyles(TcxGridCardViewStyles* Value);
	
protected:
	virtual void __fastcall DoAssign(Cxgridcustomview::TcxCustomGridView* ASource);
	virtual bool __fastcall IsEqualHeightRecords(void);
	virtual TMetaClass* __fastcall GetBackgroundBitmapsClass(void);
	virtual TMetaClass* __fastcall GetItemClass(void);
	virtual TMetaClass* __fastcall GetOptionsBehaviorClass(void);
	virtual TMetaClass* __fastcall GetOptionsSelectionClass(void);
	virtual TMetaClass* __fastcall GetOptionsViewClass(void);
	virtual TMetaClass* __fastcall GetStylesClass(void);
	virtual TMetaClass* __fastcall GetControllerClass(void);
	virtual TMetaClass* __fastcall GetDataControllerClass(void);
	virtual TMetaClass* __fastcall GetPainterClass(void);
	virtual TMetaClass* __fastcall GetViewDataClass(void);
	virtual TMetaClass* __fastcall GetViewInfoClass(void);
	virtual bool __fastcall CanCardSizing(void);
	
public:
	TcxGridCardViewRow* __fastcall CreateRow(void);
	__property Cxgrid::TcxCustomGrid* Control = {read=GetControl};
	__property TcxGridCardViewController* Controller = {read=GetController};
	__property TcxGridCardViewPainter* Painter = {read=GetPainter};
	__property int RowCount = {read=GetRowCount, nodefault};
	__property TcxGridCardViewRow* Rows[int Index] = {read=GetRow, write=SetRow};
	__property TcxGridCardViewViewData* ViewData = {read=GetViewData};
	__property TcxGridCardViewViewInfo* ViewInfo = {read=GetViewInfo};
	__property int VisibleRowCount = {read=GetVisibleRowCount, nodefault};
	__property TcxGridCardViewRow* VisibleRows[int Index] = {read=GetVisibleRow};
	
__published:
	__property TcxGridCardViewBackgroundBitmaps* BackgroundBitmaps = {read=GetBackgroundBitmaps, write=SetBackgroundBitmaps};
	__property TcxGridCardViewLayoutDirection LayoutDirection = {read=FLayoutDirection, write=SetLayoutDirection, default=0};
	__property TcxGridCardViewOptionsBehavior* OptionsBehavior = {read=GetOptionsBehavior, write=SetOptionsBehavior};
	__property TcxGridCardViewOptionsData* OptionsData = {read=GetOptionsData, write=SetOptionsData};
	__property TcxGridCardViewOptionsSelection* OptionsSelection = {read=GetOptionsSelection, write=SetOptionsSelection};
	__property TcxGridCardViewOptionsView* OptionsView = {read=GetOptionsView, write=SetOptionsView};
	__property TcxGridCardViewStyles* Styles = {read=GetStyles, write=SetStyles};
public:
	#pragma option push -w-inl
	/* TcxCustomGridTableView.Destroy */ inline __fastcall virtual ~TcxGridCardView(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomGridView.Create */ inline __fastcall virtual TcxGridCardView(Classes::TComponent* AOwner) : Cxgridcustomtableview::TcxCustomGridTableView(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxControlChildComponent.CreateEx */ inline __fastcall TcxGridCardView(Cxcontrols::TcxControl* AControl, bool AAssignOwner) : Cxgridcustomtableview::TcxCustomGridTableView(AControl, AAssignOwner) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
static const Shortint cxGridDefaultCardBorderWidth = 0x2;
static const char cxGridDefaultCardViewCaptionSeparator = '\x3a';
static const Shortint cxGridDefaultCardViewSeparatorWidth = 0x2;
static const Byte cxGridDefaultCardWidth = 0xc8;
static const Shortint cxGridMinCardBorderWidth = 0x1;
static const Shortint cxGridMinCardWidth = 0x28;
static const Word htCardViewBase = 0x12c;
static const Word htRowCaption = 0x12d;
static const Word htSeparator = 0x12e;
static const Shortint bbCardViewFirst = 0x2;
static const Shortint bbCaptionRow = 0x2;
static const Shortint bbCardBorder = 0x3;
static const Shortint bbRowCaption = 0x4;
static const Shortint bbCardViewLast = 0x4;
static const Shortint isRowFirst = 0x1;
static const Shortint isCaptionRow = 0x1;
static const Shortint isRowCaption = 0x2;
static const Shortint isRowLast = 0x2;
static const Shortint vsCardViewFirst = 0x7;
static const Shortint vsCaptionRow = 0x7;
static const Shortint vsCardBorder = 0x8;
static const Shortint vsRowCaption = 0x9;
static const Shortint vsCardViewLast = 0x9;

}	/* namespace Cxgridcardview */
using namespace Cxgridcardview;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxGridCardView
