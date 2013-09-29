// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxGridRows.pas' rev: 6.00

#ifndef cxGridRowsHPP
#define cxGridRowsHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxGridDetailsSite.hpp>	// Pascal unit
#include <cxGridViewData.hpp>	// Pascal unit
#include <cxGridTableView.hpp>	// Pascal unit
#include <cxGridCustomTableView.hpp>	// Pascal unit
#include <cxGridCustomView.hpp>	// Pascal unit
#include <cxGridLevel.hpp>	// Pascal unit
#include <cxGridCommon.hpp>	// Pascal unit
#include <cxLookAndFeelPainters.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxgridrows
{
//-- type declarations -------------------------------------------------------
typedef TMetaClass*TcxGridDataCellViewInfoClass;

class DELPHICLASS TcxGridPreviewHitTest;
class PASCALIMPLEMENTATION TcxGridPreviewHitTest : public Cxgridcustomtableview::TcxGridRecordCellHitTest 
{
	typedef Cxgridcustomtableview::TcxGridRecordCellHitTest inherited;
	
protected:
	/* virtual class method */ virtual int __fastcall GetHitTestCode(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxGridPreviewHitTest(void) : Cxgridcustomtableview::TcxGridRecordCellHitTest() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridPreviewHitTest(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridDataCellPainter;
class DELPHICLASS TcxGridDataCellViewInfo;
class PASCALIMPLEMENTATION TcxGridDataCellPainter : public Cxgridcustomtableview::TcxGridTableDataCellPainter 
{
	typedef Cxgridcustomtableview::TcxGridTableDataCellPainter inherited;
	
private:
	HIDESBASE TcxGridDataCellViewInfo* __fastcall GetViewInfo(void);
	
protected:
	virtual void __fastcall DrawBorder(Cxgraphics::TcxBorder ABorder);
	virtual bool __fastcall ExcludeFromClipRect(void);
	__property TcxGridDataCellViewInfo* ViewInfo = {read=GetViewInfo};
public:
	#pragma option push -w-inl
	/* TcxCustomGridCellPainter.Create */ inline __fastcall virtual TcxGridDataCellPainter(Cxgraphics::TcxCanvas* ACanvas, Cxgridcustomview::TcxCustomGridCellViewInfo* AViewInfo) : Cxgridcustomtableview::TcxGridTableDataCellPainter(ACanvas, AViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridDataCellPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridDataRowPainter;
class DELPHICLASS TcxGridDataRowViewInfo;
class PASCALIMPLEMENTATION TcxGridDataRowPainter : public Cxgridtableview::TcxCustomGridRowPainter 
{
	typedef Cxgridtableview::TcxCustomGridRowPainter inherited;
	
private:
	HIDESBASE TcxGridDataRowViewInfo* __fastcall GetViewInfo(void);
	
protected:
	virtual bool __fastcall GetShowCells(void);
	virtual void __fastcall Paint(void);
	__property bool ShowCells = {read=GetShowCells, nodefault};
	__property TcxGridDataRowViewInfo* ViewInfo = {read=GetViewInfo};
public:
	#pragma option push -w-inl
	/* TcxCustomGridCellPainter.Create */ inline __fastcall virtual TcxGridDataRowPainter(Cxgraphics::TcxCanvas* ACanvas, Cxgridcustomview::TcxCustomGridCellViewInfo* AViewInfo) : Cxgridtableview::TcxCustomGridRowPainter(ACanvas, AViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridDataRowPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridNewItemRowPainter;
class DELPHICLASS TcxGridNewItemRowViewInfo;
class PASCALIMPLEMENTATION TcxGridNewItemRowPainter : public TcxGridDataRowPainter 
{
	typedef TcxGridDataRowPainter inherited;
	
private:
	HIDESBASE TcxGridNewItemRowViewInfo* __fastcall GetViewInfo(void);
	
protected:
	virtual void __fastcall DrawBackground(void);
	virtual void __fastcall DrawNewItemRowSeparator(void);
	virtual bool __fastcall GetShowCells(void);
	virtual void __fastcall Paint(void);
	__property TcxGridNewItemRowViewInfo* ViewInfo = {read=GetViewInfo};
public:
	#pragma option push -w-inl
	/* TcxCustomGridCellPainter.Create */ inline __fastcall virtual TcxGridNewItemRowPainter(Cxgraphics::TcxCanvas* ACanvas, Cxgridcustomview::TcxCustomGridCellViewInfo* AViewInfo) : TcxGridDataRowPainter(ACanvas, AViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridNewItemRowPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridExpandButtonCellPainter;
class DELPHICLASS TcxGridExpandButtonCellViewInfo;
class PASCALIMPLEMENTATION TcxGridExpandButtonCellPainter : public Cxgridcustomview::TcxCustomGridCellPainter 
{
	typedef Cxgridcustomview::TcxCustomGridCellPainter inherited;
	
private:
	TcxGridExpandButtonCellViewInfo* __fastcall GetViewInfo(void);
	
protected:
	virtual void __fastcall DrawBorder(Cxgraphics::TcxBorder ABorder);
	__property TcxGridExpandButtonCellViewInfo* ViewInfo = {read=GetViewInfo};
public:
	#pragma option push -w-inl
	/* TcxCustomGridCellPainter.Create */ inline __fastcall virtual TcxGridExpandButtonCellPainter(Cxgraphics::TcxCanvas* ACanvas, Cxgridcustomview::TcxCustomGridCellViewInfo* AViewInfo) : Cxgridcustomview::TcxCustomGridCellPainter(ACanvas, AViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridExpandButtonCellPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridMasterDataRowPainter;
class DELPHICLASS TcxGridMasterDataRowViewInfo;
class PASCALIMPLEMENTATION TcxGridMasterDataRowPainter : public TcxGridDataRowPainter 
{
	typedef TcxGridDataRowPainter inherited;
	
private:
	HIDESBASE TcxGridMasterDataRowViewInfo* __fastcall GetViewInfo(void);
	
protected:
	virtual void __fastcall DrawDetailsSite(void);
	virtual void __fastcall DrawDetailsArea(void);
	virtual void __fastcall DrawExpandButtonCell(void);
	virtual bool __fastcall NeedsPainting(void);
	virtual void __fastcall Paint(void);
	__property TcxGridMasterDataRowViewInfo* ViewInfo = {read=GetViewInfo};
public:
	#pragma option push -w-inl
	/* TcxCustomGridCellPainter.Create */ inline __fastcall virtual TcxGridMasterDataRowPainter(Cxgraphics::TcxCanvas* ACanvas, Cxgridcustomview::TcxCustomGridCellViewInfo* AViewInfo) : TcxGridDataRowPainter(ACanvas, AViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridMasterDataRowPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridGroupCellPainter;
class DELPHICLASS TcxGridGroupCellViewInfo;
class PASCALIMPLEMENTATION TcxGridGroupCellPainter : public Cxgridcustomview::TcxCustomGridCellPainter 
{
	typedef Cxgridcustomview::TcxCustomGridCellPainter inherited;
	
private:
	TcxGridGroupCellViewInfo* __fastcall GetViewInfo(void);
	
protected:
	virtual void __fastcall DrawBorder(Cxgraphics::TcxBorder ABorder);
	__property TcxGridGroupCellViewInfo* ViewInfo = {read=GetViewInfo};
public:
	#pragma option push -w-inl
	/* TcxCustomGridCellPainter.Create */ inline __fastcall virtual TcxGridGroupCellPainter(Cxgraphics::TcxCanvas* ACanvas, Cxgridcustomview::TcxCustomGridCellViewInfo* AViewInfo) : Cxgridcustomview::TcxCustomGridCellPainter(ACanvas, AViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridGroupCellPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridGroupRowPainter;
class DELPHICLASS TcxGridGroupRowViewInfo;
class PASCALIMPLEMENTATION TcxGridGroupRowPainter : public Cxgridtableview::TcxCustomGridRowPainter 
{
	typedef Cxgridtableview::TcxCustomGridRowPainter inherited;
	
private:
	HIDESBASE TcxGridGroupRowViewInfo* __fastcall GetViewInfo(void);
	
protected:
	virtual void __fastcall DrawBackground(void);
	virtual void __fastcall DrawSeparator(void);
	virtual void __fastcall Paint(void);
	__property TcxGridGroupRowViewInfo* ViewInfo = {read=GetViewInfo};
public:
	#pragma option push -w-inl
	/* TcxCustomGridCellPainter.Create */ inline __fastcall virtual TcxGridGroupRowPainter(Cxgraphics::TcxCanvas* ACanvas, Cxgridcustomview::TcxCustomGridCellViewInfo* AViewInfo) : Cxgridtableview::TcxCustomGridRowPainter(ACanvas, AViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridGroupRowPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridCellViewInfo;
class PASCALIMPLEMENTATION TcxGridCellViewInfo : public Cxgridcustomtableview::TcxGridTableCellViewInfo 
{
	typedef Cxgridcustomtableview::TcxGridTableCellViewInfo inherited;
	
private:
	HIDESBASE Cxgridtableview::TcxGridTableView* __fastcall GetGridView(void);
	Cxgraphics::TcxGridLines __fastcall GetGridLines(void);
	HIDESBASE Cxgridviewdata::TcxCustomGridRow* __fastcall GetGridRecord(void);
	HIDESBASE Cxgridtableview::TcxGridTableViewInfo* __fastcall GetGridViewInfo(void);
	Cxgridtableview::TcxCustomGridRowViewInfo* __fastcall GetRecordViewInfo(void);
	
protected:
	virtual Graphics::TColor __fastcall GetBorderColor(Cxgraphics::TcxBorder AIndex);
	virtual int __fastcall GetBorderWidth(Cxgraphics::TcxBorder AIndex);
	virtual void __fastcall GetViewParams(Cxgraphics::TcxViewParams &AParams);
	__property Cxgridtableview::TcxGridTableView* GridView = {read=GetGridView};
	__property Cxgraphics::TcxGridLines GridLines = {read=GetGridLines, nodefault};
	__property Cxgridviewdata::TcxCustomGridRow* GridRecord = {read=GetGridRecord};
	__property Cxgridtableview::TcxGridTableViewInfo* GridViewInfo = {read=GetGridViewInfo};
	__property Cxgridtableview::TcxCustomGridRowViewInfo* RecordViewInfo = {read=GetRecordViewInfo};
public:
	#pragma option push -w-inl
	/* TcxGridTableCellViewInfo.Create */ inline __fastcall virtual TcxGridCellViewInfo(Cxgridcustomtableview::TcxCustomGridRecordViewInfo* ARecordViewInfo) : Cxgridcustomtableview::TcxGridTableCellViewInfo(ARecordViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomGridViewCellViewInfo.Destroy */ inline __fastcall virtual ~TcxGridCellViewInfo(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxGridDataCellViewInfo : public Cxgridcustomtableview::TcxGridTableDataCellViewInfo 
{
	typedef Cxgridcustomtableview::TcxGridTableDataCellViewInfo inherited;
	
private:
	HIDESBASE Cxgridtableview::TcxGridTableViewInfoCacheItem* __fastcall GetCacheItem(void);
	HIDESBASE Cxgridtableview::TcxGridTableView* __fastcall GetGridView(void);
	Cxgraphics::TcxGridLines __fastcall GetGridLines(void);
	HIDESBASE Cxgridviewdata::TcxGridDataRow* __fastcall GetGridRecord(void);
	HIDESBASE Cxgridtableview::TcxGridTableViewInfo* __fastcall GetGridViewInfo(void);
	Cxgridtableview::TcxGridColumn* __fastcall GetItem(void);
	TcxGridDataRowViewInfo* __fastcall GetRecordViewInfo(void);
	
protected:
	virtual int __fastcall CalculateWidth(void);
	virtual Graphics::TColor __fastcall GetBorderColor(Cxgraphics::TcxBorder AIndex);
	virtual Cxgraphics::TcxBorders __fastcall GetBorders(void);
	virtual int __fastcall GetBorderWidth(Cxgraphics::TcxBorder AIndex);
	virtual bool __fastcall GetMultiLine(void);
	virtual TMetaClass* __fastcall GetPainterClass(void);
	__property Cxgridtableview::TcxGridTableViewInfoCacheItem* CacheItem = {read=GetCacheItem};
	__property Cxgridtableview::TcxGridTableView* GridView = {read=GetGridView};
	__property Cxgraphics::TcxGridLines GridLines = {read=GetGridLines, nodefault};
	__property Cxgridviewdata::TcxGridDataRow* GridRecord = {read=GetGridRecord};
	__property Cxgridtableview::TcxGridTableViewInfo* GridViewInfo = {read=GetGridViewInfo};
	
public:
	virtual void __fastcall BeforeRecalculation(void);
	__property Cxgridtableview::TcxGridColumn* Item = {read=GetItem};
	__property TcxGridDataRowViewInfo* RecordViewInfo = {read=GetRecordViewInfo};
public:
	#pragma option push -w-inl
	/* TcxGridTableDataCellViewInfo.Create */ inline __fastcall virtual TcxGridDataCellViewInfo(Cxgridcustomtableview::TcxCustomGridRecordViewInfo* ARecordViewInfo, Cxgridcustomtableview::TcxCustomGridTableItem* AItem) : Cxgridcustomtableview::TcxGridTableDataCellViewInfo(ARecordViewInfo, AItem) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxGridTableDataCellViewInfo.Destroy */ inline __fastcall virtual ~TcxGridDataCellViewInfo(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxGridDataRowCellsAreaViewInfoClass;

class DELPHICLASS TcxGridDataRowCellsAreaViewInfo;
class PASCALIMPLEMENTATION TcxGridDataRowCellsAreaViewInfo : public TcxGridCellViewInfo 
{
	typedef TcxGridCellViewInfo inherited;
	
private:
	HIDESBASE TcxGridDataRowViewInfo* __fastcall GetRecordViewInfo(void);
	
protected:
	virtual int __fastcall CalculateHeight(void);
	virtual bool __fastcall CalculateVisible(void);
	virtual int __fastcall CalculateWidth(void);
	virtual Cxgraphics::TcxBorders __fastcall GetBorders(void);
	virtual bool __fastcall GetIsBottom(void);
	
public:
	__fastcall virtual TcxGridDataRowCellsAreaViewInfo(Cxgridcustomtableview::TcxCustomGridRecordViewInfo* ARecordViewInfo);
	virtual bool __fastcall CanDrawSelected(void);
	__property bool IsBottom = {read=GetIsBottom, nodefault};
	__property TcxGridDataRowViewInfo* RecordViewInfo = {read=GetRecordViewInfo};
public:
	#pragma option push -w-inl
	/* TcxCustomGridViewCellViewInfo.Destroy */ inline __fastcall virtual ~TcxGridDataRowCellsAreaViewInfo(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxGridPreviewCellViewInfoClass;

class DELPHICLASS TcxGridPreviewCellViewInfo;
class PASCALIMPLEMENTATION TcxGridPreviewCellViewInfo : public TcxGridDataCellViewInfo 
{
	typedef TcxGridDataCellViewInfo inherited;
	
private:
	Cxgridtableview::TcxGridPreview* __fastcall GetPreview(void);
	
protected:
	virtual int __fastcall CalculateHeight(void);
	virtual int __fastcall CalculateWidth(void);
	virtual bool __fastcall GetAutoHeight(void);
	virtual Graphics::TBitmap* __fastcall GetBackgroundBitmap(void);
	virtual Cxgraphics::TcxBorders __fastcall GetBorders(void);
	virtual void __fastcall GetEditViewDataContentOffsets(Types::TRect &R);
	virtual int __fastcall GetHeight(void);
	virtual TMetaClass* __fastcall GetHitTestClass(void);
	virtual int __fastcall GetMaxLineCount(void);
	virtual bool __fastcall GetMultiLine(void);
	virtual Types::TRect __fastcall GetTextAreaBounds();
	__property Cxgridtableview::TcxGridPreview* Preview = {read=GetPreview};
public:
	#pragma option push -w-inl
	/* TcxGridTableDataCellViewInfo.Create */ inline __fastcall virtual TcxGridPreviewCellViewInfo(Cxgridcustomtableview::TcxCustomGridRecordViewInfo* ARecordViewInfo, Cxgridcustomtableview::TcxCustomGridTableItem* AItem) : TcxGridDataCellViewInfo(ARecordViewInfo, AItem) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxGridTableDataCellViewInfo.Destroy */ inline __fastcall virtual ~TcxGridPreviewCellViewInfo(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxGridDataRowViewInfo : public Cxgridtableview::TcxCustomGridRowViewInfo 
{
	typedef Cxgridtableview::TcxCustomGridRowViewInfo inherited;
	
private:
	int FCellHeight;
	#pragma pack(push, 1)
	Types::TRect FCellsAreaBounds;
	#pragma pack(pop)
	
	TcxGridDataRowCellsAreaViewInfo* FCellsAreaViewInfo;
	Classes::TList* FCellViewInfos;
	TcxGridPreviewCellViewInfo* FPreviewViewInfo;
	TcxGridDataCellViewInfo* __fastcall GetCellViewInfo(int Index);
	int __fastcall GetCellViewInfoCount(void);
	HIDESBASE Cxgridviewdata::TcxGridDataRow* __fastcall GetGridRecord(void);
	bool __fastcall GetHasPreview(void);
	TcxGridDataCellViewInfo* __fastcall GetInternalCellViewInfo(int Index);
	void __fastcall CreateViewInfos(void);
	void __fastcall DestroyViewInfos(void);
	
protected:
	virtual void __fastcall CalculateCellViewInfo(int AIndex);
	virtual int __fastcall CalculateHeight(void);
	virtual bool __fastcall CanSize(void);
	virtual void __fastcall CheckRowHeight(int &AValue);
	virtual bool __fastcall GetAutoHeight(void);
	virtual Types::TRect __fastcall GetBackgroundBitmapBounds();
	virtual int __fastcall GetBaseHeight(void);
	virtual TMetaClass* __fastcall GetPainterClass(void);
	virtual void __fastcall Offset(int DX, int DY);
	virtual void __fastcall SetRowHeight(int Value);
	HIDESBASE virtual int __fastcall GetCellHeight(int AIndex);
	virtual int __fastcall GetCellHeightValue(void);
	virtual int __fastcall GetCellLeftBound(int AIndex);
	virtual int __fastcall GetCellTopBound(int AIndex);
	virtual Types::TRect __fastcall GetCellsAreaBounds();
	virtual TMetaClass* __fastcall GetCellsAreaViewInfoClass(void);
	virtual TMetaClass* __fastcall GetCellViewInfoClass(int AIndex);
	virtual int __fastcall GetCellWidth(int AIndex);
	virtual TMetaClass* __fastcall GetPreviewViewInfoClass(void);
	virtual bool __fastcall GetShowPreview(void);
	virtual bool __fastcall IsCellVisible(int AIndex);
	__property int CellHeight = {read=GetCellHeightValue, nodefault};
	__property bool ShowPreview = {read=GetShowPreview, nodefault};
	
public:
	__fastcall virtual TcxGridDataRowViewInfo(Cxgridcustomtableview::TcxCustomGridRecordsViewInfo* ARecordsViewInfo, Cxgridcustomtableview::TcxCustomGridRecord* ARecord);
	__fastcall virtual ~TcxGridDataRowViewInfo(void);
	virtual void __fastcall BeforeCellRecalculation(Cxgridcustomtableview::TcxGridTableCellViewInfo* ACell);
	virtual void __fastcall BeforeRecalculation(void);
	virtual void __fastcall Calculate(int ALeftBound, int ATopBound, int AWidth = 0xffffffff, int AHeight = 0xffffffff)/* overload */;
	virtual Types::TRect __fastcall GetBoundsForItem(Cxgridcustomtableview::TcxCustomGridTableItem* AItem);
	virtual Cxgraphics::TcxBorders __fastcall GetCellBorders(bool AIsRight, bool AIsBottom);
	virtual Cxgridcustomtableview::TcxGridTableDataCellViewInfo* __fastcall GetCellViewInfoByItem(Cxgridcustomtableview::TcxCustomGridTableItem* AItem);
	virtual Cxgridcustomview::TcxCustomGridHitTest* __fastcall GetHitTest(const Types::TPoint &P);
	__property Types::TRect CellsAreaBounds = {read=GetCellsAreaBounds};
	__property TcxGridDataRowCellsAreaViewInfo* CellsAreaViewInfo = {read=FCellsAreaViewInfo};
	__property int CellViewInfoCount = {read=GetCellViewInfoCount, nodefault};
	__property TcxGridDataCellViewInfo* CellViewInfos[int Index] = {read=GetCellViewInfo};
	__property Cxgridviewdata::TcxGridDataRow* GridRecord = {read=GetGridRecord};
	__property bool HasPreview = {read=GetHasPreview, nodefault};
	__property TcxGridDataCellViewInfo* InternalCellViewInfos[int Index] = {read=GetInternalCellViewInfo};
	__property TcxGridPreviewCellViewInfo* PreviewViewInfo = {read=FPreviewViewInfo};
	
/* Hoisted overloads: */
	
public:
	inline void __fastcall  Calculate(const Types::TRect &ABounds){ TcxCustomGridCellViewInfo::Calculate(ABounds); }
	
};


class PASCALIMPLEMENTATION TcxGridNewItemRowViewInfo : public TcxGridDataRowViewInfo 
{
	typedef TcxGridDataRowViewInfo inherited;
	
private:
	int FHeight;
	Graphics::TColor __fastcall GetNewItemRowSeparatorColor(void);
	int __fastcall GetNewItemRowSeparatorWidth(void);
	
protected:
	virtual bool __fastcall CalculateSelected(void);
	virtual Classes::TAlignment __fastcall GetAlignmentHorz(void);
	virtual Cxclasses::TcxAlignmentVert __fastcall GetAlignmentVert(void);
	virtual bool __fastcall GetAutoHeight(void);
	virtual int __fastcall GetBottomPartHeight(void);
	virtual int __fastcall GetCellLeftBound(int AIndex);
	virtual int __fastcall GetCellWidth(int AIndex);
	virtual int __fastcall GetHeight(void);
	virtual Types::TRect __fastcall GetNewItemRowSeparatorBounds();
	virtual bool __fastcall GetShowInfoText(void);
	virtual bool __fastcall GetShowPreview(void);
	virtual bool __fastcall GetShowSeparator(void);
	virtual AnsiString __fastcall GetText();
	virtual Types::TRect __fastcall GetTextAreaBounds();
	virtual void __fastcall GetViewParams(Cxgraphics::TcxViewParams &AParams);
	virtual bool __fastcall HasLastHorzGridLine(void);
	virtual TMetaClass* __fastcall GetPainterClass(void);
	__property int NewItemRowSeparatorWidth = {read=GetNewItemRowSeparatorWidth, nodefault};
	__property bool ShowInfoText = {read=GetShowInfoText, nodefault};
	
public:
	__property Types::TRect NewItemRowSeparatorBounds = {read=GetNewItemRowSeparatorBounds};
	__property Graphics::TColor NewItemRowSeparatorColor = {read=GetNewItemRowSeparatorColor, nodefault};
public:
	#pragma option push -w-inl
	/* TcxGridDataRowViewInfo.Create */ inline __fastcall virtual TcxGridNewItemRowViewInfo(Cxgridcustomtableview::TcxCustomGridRecordsViewInfo* ARecordsViewInfo, Cxgridcustomtableview::TcxCustomGridRecord* ARecord) : TcxGridDataRowViewInfo(ARecordsViewInfo, ARecord) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxGridDataRowViewInfo.Destroy */ inline __fastcall virtual ~TcxGridNewItemRowViewInfo(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxGridDetailsSiteViewInfoClass;

class DELPHICLASS TcxGridDetailsSiteViewInfo;
class PASCALIMPLEMENTATION TcxGridDetailsSiteViewInfo : public Cxgriddetailssite::TcxCustomGridDetailsSiteViewInfo 
{
	typedef Cxgriddetailssite::TcxCustomGridDetailsSiteViewInfo inherited;
	
private:
	TcxGridMasterDataRowViewInfo* FMasterDataRowViewInfo;
	Cxgridtableview::TcxGridMasterTableViewInfoCacheItem* __fastcall GetCacheItem(void);
	Cxgridcustomview::TcxCustomGridView* __fastcall GetMasterGridView(void);
	Cxgridcustomview::TcxCustomGridViewInfo* __fastcall GetMasterGridViewInfo(void);
	
protected:
	virtual void __fastcall ControlFocusChanged(void);
	virtual Cxgridcustomview::TcxCustomGridView* __fastcall GetActiveGridView(void);
	virtual bool __fastcall GetActiveGridViewExists(void);
	virtual Cxgridcustomview::TcxCustomGridView* __fastcall GetActiveGridViewValue(void);
	virtual Cxgridlevel::TcxGridLevel* __fastcall GetActiveLevel(void);
	virtual Cxgraphics::TcxCanvas* __fastcall GetCanvas(void);
	virtual int __fastcall GetHeight(void);
	virtual TMetaClass* __fastcall GetLookAndFeelPainter(void);
	virtual int __fastcall GetMaxHeight(void);
	virtual int __fastcall GetMaxNormalHeight(void);
	virtual int __fastcall GetMaxWidth(void);
	virtual int __fastcall GetNormalHeight(void);
	virtual bool __fastcall GetVisible(void);
	virtual int __fastcall GetWidth(void);
	virtual void __fastcall InitTabHitTest(Cxgriddetailssite::TcxGridDetailsSiteTabHitTest* AHitTest);
	__property Cxgridtableview::TcxGridMasterTableViewInfoCacheItem* CacheItem = {read=GetCacheItem};
	__property Cxgridcustomview::TcxCustomGridView* MasterGridView = {read=GetMasterGridView};
	__property Cxgridcustomview::TcxCustomGridViewInfo* MasterGridViewInfo = {read=GetMasterGridViewInfo};
	__property TcxGridMasterDataRowViewInfo* MasterDataRowViewInfo = {read=FMasterDataRowViewInfo};
	
public:
	__fastcall virtual TcxGridDetailsSiteViewInfo(TcxGridMasterDataRowViewInfo* AMasterDataRowViewInfo);
	virtual void __fastcall ChangeActiveTab(Cxgridlevel::TcxGridLevel* ALevel);
public:
	#pragma option push -w-inl
	/* TcxCustomGridDetailsSiteViewInfo.Destroy */ inline __fastcall virtual ~TcxGridDetailsSiteViewInfo(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxGridExpandButtonCellViewInfoClass;

class PASCALIMPLEMENTATION TcxGridExpandButtonCellViewInfo : public TcxGridCellViewInfo 
{
	typedef TcxGridCellViewInfo inherited;
	
private:
	HIDESBASE TcxGridMasterDataRowViewInfo* __fastcall GetRecordViewInfo(void);
	Types::TRect __fastcall GetRightBorderRestSpaceBounds();
	
protected:
	virtual int __fastcall CalculateHeight(void);
	virtual int __fastcall CalculateWidth(void);
	virtual Graphics::TBitmap* __fastcall GetBackgroundBitmap(void);
	virtual int __fastcall GetBaseWidth(void);
	virtual Types::TRect __fastcall GetBorderBounds(Cxgraphics::TcxBorder AIndex);
	virtual Cxgraphics::TcxBorders __fastcall GetBorders(void);
	virtual TMetaClass* __fastcall GetPainterClass(void);
	__property int BaseWidth = {read=GetBaseWidth, nodefault};
	__property TcxGridMasterDataRowViewInfo* RecordViewInfo = {read=GetRecordViewInfo};
	__property Types::TRect RightBorderRestSpaceBounds = {read=GetRightBorderRestSpaceBounds};
public:
	#pragma option push -w-inl
	/* TcxGridTableCellViewInfo.Create */ inline __fastcall virtual TcxGridExpandButtonCellViewInfo(Cxgridcustomtableview::TcxCustomGridRecordViewInfo* ARecordViewInfo) : TcxGridCellViewInfo(ARecordViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomGridViewCellViewInfo.Destroy */ inline __fastcall virtual ~TcxGridExpandButtonCellViewInfo(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxGridDetailsAreaViewInfoClass;

class DELPHICLASS TcxGridDetailsAreaViewInfo;
class PASCALIMPLEMENTATION TcxGridDetailsAreaViewInfo : public TcxGridCellViewInfo 
{
	typedef TcxGridCellViewInfo inherited;
	
private:
	HIDESBASE TcxGridMasterDataRowViewInfo* __fastcall GetRecordViewInfo(void);
	
protected:
	virtual int __fastcall CalculateHeight(void);
	virtual int __fastcall CalculateWidth(void);
	virtual Cxgraphics::TcxBorders __fastcall GetBorders(void);
	__property TcxGridMasterDataRowViewInfo* RecordViewInfo = {read=GetRecordViewInfo};
public:
	#pragma option push -w-inl
	/* TcxGridTableCellViewInfo.Create */ inline __fastcall virtual TcxGridDetailsAreaViewInfo(Cxgridcustomtableview::TcxCustomGridRecordViewInfo* ARecordViewInfo) : TcxGridCellViewInfo(ARecordViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomGridViewCellViewInfo.Destroy */ inline __fastcall virtual ~TcxGridDetailsAreaViewInfo(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxGridMasterDataRowViewInfo : public TcxGridDataRowViewInfo 
{
	typedef TcxGridDataRowViewInfo inherited;
	
private:
	TcxGridDetailsAreaViewInfo* FDetailsAreaViewInfo;
	TcxGridDetailsSiteViewInfo* FDetailsSiteViewInfo;
	TcxGridExpandButtonCellViewInfo* FExpandButtonCellViewInfo;
	int FRestHeight;
	HIDESBASE Cxgridtableview::TcxGridMasterTableViewInfoCacheItem* __fastcall GetCacheItem(void);
	Types::TRect __fastcall GetDetailsSiteIndentBounds();
	HIDESBASE Cxgridviewdata::TcxGridMasterDataRow* __fastcall GetGridRecord(void);
	
protected:
	virtual void __fastcall CalculateExpandButtonBounds(Types::TRect &ABounds);
	virtual int __fastcall CalculateHeight(void);
	virtual int __fastcall CalculateRestHeight(int ARowHeight);
	virtual void __fastcall ControlFocusChanged(void);
	virtual int __fastcall GetDataHeight(void);
	virtual int __fastcall GetDataIndent(void);
	virtual int __fastcall GetDataWidth(void);
	virtual Types::TRect __fastcall GetExpandButtonAreaBounds();
	virtual int __fastcall GetMaxHeight(void);
	virtual bool __fastcall IsDetailVisible(Cxgridcustomview::TcxCustomGridView* ADetail);
	virtual void __fastcall VisibilityChanged(bool AVisible);
	virtual TMetaClass* __fastcall GetPainterClass(void);
	virtual TMetaClass* __fastcall GetDetailsAreaViewInfoClass(void);
	virtual TMetaClass* __fastcall GetDetailsSiteViewInfoClass(void);
	virtual TMetaClass* __fastcall GetExpandButtonCellViewInfoClass(void);
	__property Cxgridtableview::TcxGridMasterTableViewInfoCacheItem* CacheItem = {read=GetCacheItem};
	__property TcxGridDetailsAreaViewInfo* DetailsAreaViewInfo = {read=FDetailsAreaViewInfo};
	__property Types::TRect DetailsSiteIndentBounds = {read=GetDetailsSiteIndentBounds};
	__property TcxGridExpandButtonCellViewInfo* ExpandButtonCellViewInfo = {read=FExpandButtonCellViewInfo};
	__property int RestHeight = {read=FRestHeight, write=FRestHeight, nodefault};
	
public:
	__fastcall virtual TcxGridMasterDataRowViewInfo(Cxgridcustomtableview::TcxCustomGridRecordsViewInfo* ARecordsViewInfo, Cxgridcustomtableview::TcxCustomGridRecord* ARecord);
	__fastcall virtual ~TcxGridMasterDataRowViewInfo(void);
	virtual void __fastcall BeforeRecalculation(void);
	virtual void __fastcall Calculate(int ALeftBound, int ATopBound, int AWidth = 0xffffffff, int AHeight = 0xffffffff)/* overload */;
	virtual Cxgridcustomview::TcxCustomGridHitTest* __fastcall GetHitTest(const Types::TPoint &P);
	__property TcxGridDetailsSiteViewInfo* DetailsSiteViewInfo = {read=FDetailsSiteViewInfo};
	__property Cxgridviewdata::TcxGridMasterDataRow* GridRecord = {read=GetGridRecord};
	
/* Hoisted overloads: */
	
public:
	inline void __fastcall  Calculate(const Types::TRect &ABounds){ TcxCustomGridCellViewInfo::Calculate(ABounds); }
	
};


class PASCALIMPLEMENTATION TcxGridGroupCellViewInfo : public TcxGridCellViewInfo 
{
	typedef TcxGridCellViewInfo inherited;
	
private:
	Types::TRect __fastcall GetExpandedAreaBounds();
	HIDESBASE Cxgridviewdata::TcxGridGroupRow* __fastcall GetGridRecord(void);
	HIDESBASE TcxGridGroupRowViewInfo* __fastcall GetRecordViewInfo(void);
	
protected:
	virtual int __fastcall CalculateHeight(void);
	virtual int __fastcall CalculateWidth(void);
	virtual bool __fastcall CustomDraw(Cxgraphics::TcxCanvas* ACanvas);
	virtual Cxclasses::TcxAlignmentVert __fastcall GetAlignmentVert(void);
	virtual bool __fastcall GetAlwaysSelected(void);
	virtual Graphics::TBitmap* __fastcall GetBackgroundBitmap(void);
	virtual Types::TRect __fastcall GetBorderBounds(Cxgraphics::TcxBorder AIndex);
	virtual Graphics::TColor __fastcall GetBorderColor(Cxgraphics::TcxBorder AIndex);
	virtual Cxgraphics::TcxBorders __fastcall GetBorders(void);
	virtual int __fastcall GetBorderWidth(Cxgraphics::TcxBorder AIndex);
	virtual TMetaClass* __fastcall GetPainterClass(void);
	virtual AnsiString __fastcall GetText();
	virtual Types::TRect __fastcall GetTextAreaBounds();
	virtual void __fastcall GetViewParams(Cxgraphics::TcxViewParams &AParams);
	virtual bool __fastcall HasCustomDraw(void);
	__property Types::TRect ExpandedAreaBounds = {read=GetExpandedAreaBounds};
	__property Cxgridviewdata::TcxGridGroupRow* GridRecord = {read=GetGridRecord};
	__property TcxGridGroupRowViewInfo* RecordViewInfo = {read=GetRecordViewInfo};
	
public:
	virtual bool __fastcall CanDrawSelected(void);
public:
	#pragma option push -w-inl
	/* TcxGridTableCellViewInfo.Create */ inline __fastcall virtual TcxGridGroupCellViewInfo(Cxgridcustomtableview::TcxCustomGridRecordViewInfo* ARecordViewInfo) : TcxGridCellViewInfo(ARecordViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomGridViewCellViewInfo.Destroy */ inline __fastcall virtual ~TcxGridGroupCellViewInfo(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxGridGroupRowViewInfo : public Cxgridtableview::TcxCustomGridRowViewInfo 
{
	typedef Cxgridtableview::TcxCustomGridRowViewInfo inherited;
	
private:
	TcxGridGroupCellViewInfo* FCellViewInfo;
	HIDESBASE Cxgridviewdata::TcxGridGroupRow* __fastcall GetGridRecord(void);
	
protected:
	virtual void __fastcall CalculateExpandButtonBounds(Types::TRect &ABounds);
	virtual int __fastcall CalculateHeight(void);
	virtual bool __fastcall CanSize(void);
	virtual void __fastcall CheckRowHeight(int &AValue);
	virtual bool __fastcall GetAutoHeight(void);
	virtual Graphics::TBitmap* __fastcall GetBackgroundBitmap(void);
	virtual Types::TRect __fastcall GetExpandButtonAreaBounds();
	virtual TMetaClass* __fastcall GetPainterClass(void);
	virtual Types::TRect __fastcall GetSeparatorBounds();
	virtual Types::TRect __fastcall GetSeparatorIndentBounds();
	virtual bool __fastcall HasFocusRect(void);
	virtual bool __fastcall HasFooter(int ALevel);
	virtual void __fastcall Offset(int DX, int DY);
	virtual void __fastcall SetRowHeight(int Value);
	
public:
	__fastcall virtual TcxGridGroupRowViewInfo(Cxgridcustomtableview::TcxCustomGridRecordsViewInfo* ARecordsViewInfo, Cxgridcustomtableview::TcxCustomGridRecord* ARecord);
	__fastcall virtual ~TcxGridGroupRowViewInfo(void);
	virtual void __fastcall BeforeRecalculation(void);
	virtual void __fastcall Calculate(int ALeftBound, int ATopBound, int AWidth = 0xffffffff, int AHeight = 0xffffffff)/* overload */;
	__property TcxGridGroupCellViewInfo* CellViewInfo = {read=FCellViewInfo};
	__property Cxgridviewdata::TcxGridGroupRow* GridRecord = {read=GetGridRecord};
	__property Types::TRect SeparatorIndentBounds = {read=GetSeparatorIndentBounds};
	
/* Hoisted overloads: */
	
public:
	inline void __fastcall  Calculate(const Types::TRect &ABounds){ TcxCustomGridCellViewInfo::Calculate(ABounds); }
	
};


//-- var, const, procedure ---------------------------------------------------
static const Byte htPreview = 0xe7;

}	/* namespace Cxgridrows */
using namespace Cxgridrows;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxGridRows
