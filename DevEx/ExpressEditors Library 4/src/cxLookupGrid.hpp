// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxLookupGrid.pas' rev: 6.00

#ifndef cxLookupGridHPP
#define cxLookupGridHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxEditRepositoryItems.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxData.hpp>	// Pascal unit
#include <cxCustomData.hpp>	// Pascal unit
#include <cxDataStorage.hpp>	// Pascal unit
#include <cxDataUtils.hpp>	// Pascal unit
#include <cxLookAndFeelPainters.hpp>	// Pascal unit
#include <cxLookAndFeels.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxlookupgrid
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TcxLookupGridHitTest { htNone, htHeader, htCell };
#pragma option pop

#pragma option push -b-
enum TcxLookupGridScrollMode { smNone, smTop, smBottom };
#pragma option pop

class DELPHICLASS TcxLookupGridDataController;
class DELPHICLASS TcxCustomLookupGrid;
class PASCALIMPLEMENTATION TcxLookupGridDataController : public Cxdata::TcxDataController 
{
	typedef Cxdata::TcxDataController inherited;
	
private:
	TcxCustomLookupGrid* __fastcall GetGrid(void);
	
public:
	virtual System::TObject* __fastcall GetItem(int Index);
	__property TcxCustomLookupGrid* Grid = {read=GetGrid};
	
__published:
	__property OnCompare ;
public:
	#pragma option push -w-inl
	/* TcxDataController.Create */ inline __fastcall virtual TcxLookupGridDataController(Classes::TComponent* AOwner) : Cxdata::TcxDataController(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxDataController.Destroy */ inline __fastcall virtual ~TcxLookupGridDataController(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxLookupGridPartViewInfo;
class PASCALIMPLEMENTATION TcxLookupGridPartViewInfo : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	#pragma pack(push, 1)
	Types::TRect Bounds;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect ContentBounds;
	#pragma pack(pop)
	
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxLookupGridPartViewInfo(void) : System::TObject() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxLookupGridPartViewInfo(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxLookupGridColumnViewInfo;
class PASCALIMPLEMENTATION TcxLookupGridColumnViewInfo : public TcxLookupGridPartViewInfo 
{
	typedef TcxLookupGridPartViewInfo inherited;
	
private:
	Cxedit::TcxCustomEditViewData* FEditViewData;
	Cxedit::TcxCustomEditStyle* FStyle;
	
public:
	Classes::TAlignment Alignment;
	Cxgraphics::TcxBorders Borders;
	Cxlookandfeelpainters::TcxNeighbors Neighbors;
	Cxcustomdata::TcxDataSortOrder SortOrder;
	AnsiString Text;
	__fastcall virtual ~TcxLookupGridColumnViewInfo(void);
	Cxedit::TcxCustomEditStyle* __fastcall CreateEditStyle(Cxedit::TcxCustomEditProperties* AProperties);
	Cxedit::TcxCustomEditViewData* __fastcall CreateEditViewData(Cxedit::TcxCustomEditProperties* AProperties);
	void __fastcall DestroyEditViewData(void);
	__property Cxedit::TcxCustomEditStyle* Style = {read=FStyle};
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxLookupGridColumnViewInfo(void) : TcxLookupGridPartViewInfo() { }
	#pragma option pop
	
};


class DELPHICLASS TcxLookupGridColumnsViewInfo;
class PASCALIMPLEMENTATION TcxLookupGridColumnsViewInfo : public Cxclasses::TcxObjectList 
{
	typedef Cxclasses::TcxObjectList inherited;
	
public:
	TcxLookupGridColumnViewInfo* operator[](int Index) { return Items[Index]; }
	
private:
	HIDESBASE TcxLookupGridColumnViewInfo* __fastcall GetItem(int Index);
	
public:
	__property TcxLookupGridColumnViewInfo* Items[int Index] = {read=GetItem/*, default*/};
public:
	#pragma option push -w-inl
	/* TcxObjectList.Create */ inline __fastcall virtual TcxLookupGridColumnsViewInfo(void) : Cxclasses::TcxObjectList() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxObjectList.Destroy */ inline __fastcall virtual ~TcxLookupGridColumnsViewInfo(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxLookupGridCellViewInfo;
class PASCALIMPLEMENTATION TcxLookupGridCellViewInfo : public TcxLookupGridPartViewInfo 
{
	typedef TcxLookupGridPartViewInfo inherited;
	
private:
	Cxedit::TcxCustomEditViewInfo* FEditViewInfo;
	
public:
	Cxgraphics::TcxBorders Borders;
	int Index;
	bool IsFocused;
	__fastcall virtual ~TcxLookupGridCellViewInfo(void);
	Cxedit::TcxCustomEditViewInfo* __fastcall CreateEditViewInfo(Cxedit::TcxCustomEditProperties* AProperties);
	__property Cxedit::TcxCustomEditViewInfo* EditViewInfo = {read=FEditViewInfo};
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxLookupGridCellViewInfo(void) : TcxLookupGridPartViewInfo() { }
	#pragma option pop
	
};


class DELPHICLASS TcxLookupGridRowViewInfo;
class PASCALIMPLEMENTATION TcxLookupGridRowViewInfo : public Cxclasses::TcxObjectList 
{
	typedef Cxclasses::TcxObjectList inherited;
	
public:
	TcxLookupGridCellViewInfo* operator[](int Index) { return Items[Index]; }
	
private:
	HIDESBASE TcxLookupGridCellViewInfo* __fastcall GetItem(int Index);
	
protected:
	TcxLookupGridCellViewInfo* __fastcall AddCell(int AIndex, const Types::TRect &AInitBounds, bool AIsFocused);
	
public:
	Cxgraphics::TcxBorders Borders;
	#pragma pack(push, 1)
	Types::TRect Bounds;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect ContentBounds;
	#pragma pack(pop)
	
	bool IsFocused;
	int RecordIndex;
	int RowIndex;
	__property TcxLookupGridCellViewInfo* Items[int Index] = {read=GetItem/*, default*/};
public:
	#pragma option push -w-inl
	/* TcxObjectList.Create */ inline __fastcall virtual TcxLookupGridRowViewInfo(void) : Cxclasses::TcxObjectList() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxObjectList.Destroy */ inline __fastcall virtual ~TcxLookupGridRowViewInfo(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxLookupGridRowsViewInfo;
class PASCALIMPLEMENTATION TcxLookupGridRowsViewInfo : public Cxclasses::TcxObjectList 
{
	typedef Cxclasses::TcxObjectList inherited;
	
public:
	TcxLookupGridRowViewInfo* operator[](int Index) { return Items[Index]; }
	
private:
	HIDESBASE TcxLookupGridRowViewInfo* __fastcall GetItem(int Index);
	
public:
	TcxLookupGridRowViewInfo* __fastcall FindByRowIndex(int ARowIndex);
	__property TcxLookupGridRowViewInfo* Items[int Index] = {read=GetItem/*, default*/};
public:
	#pragma option push -w-inl
	/* TcxObjectList.Create */ inline __fastcall virtual TcxLookupGridRowsViewInfo(void) : Cxclasses::TcxObjectList() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxObjectList.Destroy */ inline __fastcall virtual ~TcxLookupGridRowsViewInfo(void) { }
	#pragma option pop
	
};


#pragma option push -b-
enum TcxLookupGridTopRowIndexCalculation { ticNone, ticForward, ticBackward };
#pragma option pop

class DELPHICLASS TcxLookupGridViewInfo;
class DELPHICLASS TcxLookupGridColumn;
class PASCALIMPLEMENTATION TcxLookupGridViewInfo : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	TcxLookupGridColumnsViewInfo* FColumns;
	TcxCustomLookupGrid* FGrid;
	int FInternalTopRowIndex;
	TcxLookupGridTopRowIndexCalculation FTopRowIndexCalculation;
	int FRowMinHeight;
	TcxLookupGridRowsViewInfo* FRows;
	Types::TRect __fastcall GetBounds();
	Cxgraphics::TcxCanvas* __fastcall GetCanvas(void);
	Types::TRect __fastcall GetClientBounds();
	Graphics::TColor __fastcall GetEmptyAreaColor(void);
	Cxgraphics::TcxGridLines __fastcall GetGridLines(void);
	int __fastcall GetRowCount(void);
	int __fastcall GetRowHeight(void);
	int __fastcall GetTopRowIndex(void);
	
protected:
	TcxLookupGridRowViewInfo* __fastcall AddRow(int ARowIndex, const Types::TRect &AInitBounds);
	int __fastcall CalcCellMinHeight(int AIndex);
	int __fastcall CalcRowMinHeight(void);
	void __fastcall CalculateCells(TcxLookupGridRowViewInfo* ARowViewInfo);
	int __fastcall GetCellHeight(int ARowIndex, int AColumnIndex);
	virtual int __fastcall GetHeaderHeight(void);
	__property TcxLookupGridTopRowIndexCalculation TopRowIndexCalculation = {read=FTopRowIndexCalculation, write=FTopRowIndexCalculation, nodefault};
	
public:
	int BorderSize;
	#pragma pack(push, 1)
	Types::TRect HeadersRect;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect EmptyRectBottom;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect EmptyRectRight;
	#pragma pack(pop)
	
	int PartialVisibleRowCount;
	int VisibleRowCount;
	#pragma pack(push, 1)
	Types::TRect RowsRect;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect VisibleRowsRect;
	#pragma pack(pop)
	
	__fastcall TcxLookupGridViewInfo(TcxCustomLookupGrid* AGrid);
	__fastcall virtual ~TcxLookupGridViewInfo(void);
	void __fastcall CalcCellColors(bool ARowIsSelected, bool ACellIsSelected, Graphics::TColor &AColor, Graphics::TColor &AFontColor);
	virtual void __fastcall CalcColumns(void);
	virtual void __fastcall CalcEmptyAreas(void);
	virtual void __fastcall CalcHeaders(void);
	virtual void __fastcall CalcRows(void);
	virtual void __fastcall Calculate(void);
	virtual int __fastcall CheckTopRowIndex(int ANewTopIndex);
	virtual void __fastcall CreateEditStyle(TcxLookupGridColumnViewInfo* AColumnViewInfo, TcxLookupGridColumn* AColumn);
	virtual Cxedit::TcxCustomEditViewData* __fastcall CreateEditViewData(TcxLookupGridColumnViewInfo* AColumnViewInfo, TcxLookupGridColumn* AColumn);
	virtual void __fastcall DestroyEditViewData(TcxLookupGridColumnViewInfo* AColumnViewInfo, TcxLookupGridColumn* AColumn);
	virtual Graphics::TColor __fastcall GetContentColor(void);
	virtual Graphics::TFont* __fastcall GetContentFont(void);
	virtual Graphics::TColor __fastcall GetContentFontColor(void);
	virtual Graphics::TColor __fastcall GetGridColor(void);
	virtual int __fastcall GetGridLineWidth(void);
	virtual Graphics::TColor __fastcall GetHeaderColor(void);
	virtual Graphics::TFont* __fastcall GetHeaderFont(void);
	virtual Graphics::TColor __fastcall GetSelectedColor(void);
	virtual Graphics::TColor __fastcall GetSelectedFontColor(void);
	__property Types::TRect Bounds = {read=GetBounds};
	__property Cxgraphics::TcxCanvas* Canvas = {read=GetCanvas};
	__property Types::TRect ClientBounds = {read=GetClientBounds};
	__property TcxLookupGridColumnsViewInfo* Columns = {read=FColumns};
	__property Graphics::TColor EmptyAreaColor = {read=GetEmptyAreaColor, nodefault};
	__property TcxCustomLookupGrid* Grid = {read=FGrid};
	__property Cxgraphics::TcxGridLines GridLines = {read=GetGridLines, nodefault};
	__property int GridLineWidth = {read=GetGridLineWidth, nodefault};
	__property int RowCount = {read=GetRowCount, nodefault};
	__property int RowHeight = {read=GetRowHeight, nodefault};
	__property TcxLookupGridRowsViewInfo* Rows = {read=FRows};
	__property int TopRowIndex = {read=GetTopRowIndex, nodefault};
};


typedef TMetaClass*TcxLookupGridViewInfoClass;

class DELPHICLASS TcxLookupGridPainter;
class PASCALIMPLEMENTATION TcxLookupGridPainter : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	Cxgraphics::TcxCanvas* FCanvas;
	TcxCustomLookupGrid* FGrid;
	TMetaClass*FLFPainterClass;
	Cxgraphics::TcxCanvas* __fastcall GetCanvas(void);
	TcxLookupGridViewInfo* __fastcall GetViewInfo(void);
	
protected:
	virtual void __fastcall DrawBorder(void);
	virtual void __fastcall DrawCell(TcxLookupGridCellViewInfo* ACellViewInfo);
	virtual void __fastcall DrawContent(void);
	virtual void __fastcall DrawEmptyArea(void);
	virtual void __fastcall DrawHeaders(void);
	virtual void __fastcall DrawRow(TcxLookupGridRowViewInfo* ARowViewInfo);
	virtual void __fastcall DrawRows(void);
	__property TcxLookupGridViewInfo* ViewInfo = {read=GetViewInfo};
	
public:
	__fastcall TcxLookupGridPainter(TcxCustomLookupGrid* AGrid);
	__fastcall virtual ~TcxLookupGridPainter(void);
	void __fastcall Invalidate(void);
	void __fastcall Paint(void);
	__property Cxgraphics::TcxCanvas* Canvas = {read=GetCanvas};
	__property TcxCustomLookupGrid* Grid = {read=FGrid};
	__property TMetaClass* LFPainterClass = {read=FLFPainterClass, write=FLFPainterClass};
};


typedef TMetaClass*TcxLookupGridPainterClass;

class DELPHICLASS TcxLookupGridDefaultValuesProvider;
class PASCALIMPLEMENTATION TcxLookupGridDefaultValuesProvider : public Cxedit::TcxCustomEditDefaultValuesProvider 
{
	typedef Cxedit::TcxCustomEditDefaultValuesProvider inherited;
	
__published:
	virtual bool __fastcall IsDisplayFormatDefined(bool AIsCurrencyValueAccepted);
public:
	#pragma option push -w-inl
	/* TcxCustomEditDefaultValuesProvider.Destroy */ inline __fastcall virtual ~TcxLookupGridDefaultValuesProvider(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxInterfacedPersistent.Create */ inline __fastcall virtual TcxLookupGridDefaultValuesProvider(Classes::TPersistent* AOwner) : Cxedit::TcxCustomEditDefaultValuesProvider(AOwner) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxLookupGridColumn : public Classes::TCollectionItem 
{
	typedef Classes::TCollectionItem inherited;
	
private:
	AnsiString FCaption;
	Cxedit::TcxCustomEditDefaultValuesProvider* FDefaultValuesProvider;
	Classes::TAlignment FHeaderAlignment;
	Cxedit::TcxEditRepositoryItem* FInternalDefaultRepositoryItem;
	bool FIsCaptionAssigned;
	bool FIsWidthAssigned;
	int FMinWidth;
	bool FFixed;
	bool FSorting;
	Cxedit::TcxEditRepositoryItem* FRepositoryItem;
	int FWidth;
	AnsiString __fastcall GetCaption();
	TcxLookupGridDataController* __fastcall GetDataController(void);
	TcxCustomLookupGrid* __fastcall GetGrid(void);
	int __fastcall GetMinWidth(void);
	Cxedit::TcxCustomEditProperties* __fastcall GetProperties(void);
	Cxcustomdata::TcxDataSortOrder __fastcall GetSortOrder(void);
	int __fastcall GetWidth(void);
	bool __fastcall IsCaptionStored(void);
	bool __fastcall IsWidthStored(void);
	void __fastcall SetCaption(const AnsiString Value);
	void __fastcall SetFixed(bool Value);
	void __fastcall SetHeaderAlignment(Classes::TAlignment Value);
	void __fastcall SetMinWidth(int Value);
	void __fastcall SetRepositoryItem(Cxedit::TcxEditRepositoryItem* Value);
	void __fastcall SetSorting(bool Value);
	void __fastcall SetSortOrder(Cxcustomdata::TcxDataSortOrder Value);
	void __fastcall SetWidth(int Value);
	
protected:
	HRESULT __stdcall QueryInterface(const GUID &IID, /* out */ void *Obj);
	int __stdcall _AddRef(void);
	int __stdcall _Release(void);
	void __fastcall ItemRemoved(Cxedit::TcxEditRepositoryItem* Sender);
	void __fastcall PropertiesChanged(Cxedit::TcxEditRepositoryItem* Sender);
	virtual void __fastcall CheckWidthValue(int &Value);
	virtual TMetaClass* __fastcall GetDefaultValuesProviderClass(void);
	virtual TMetaClass* __fastcall GetValueTypeClass(void);
	virtual void __fastcall SetIndex(int Value);
	virtual void __fastcall SetValueTypeClass(TMetaClass* Value);
	__property TcxLookupGridDataController* DataController = {read=GetDataController};
	
public:
	__fastcall virtual TcxLookupGridColumn(Classes::TCollection* Collection);
	__fastcall virtual ~TcxLookupGridColumn(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual AnsiString __fastcall DefaultCaption();
	virtual Cxedit::TcxEditRepositoryItem* __fastcall DefaultRepositoryItem(void);
	virtual int __fastcall DefaultWidth(void);
	virtual Graphics::TFont* __fastcall GetContentFont(void);
	virtual Cxedit::TcxEditRepositoryItem* __fastcall GetInternalDefaultRepositoryItem(void);
	virtual Cxedit::TcxEditRepositoryItem* __fastcall GetRepositoryItem(void);
	virtual bool __fastcall IsLeft(void);
	virtual bool __fastcall IsRight(void);
	virtual void __fastcall RestoreDefaults(void);
	__property Cxedit::TcxCustomEditDefaultValuesProvider* DefaultValuesProvider = {read=FDefaultValuesProvider};
	__property Cxedit::TcxCustomEditProperties* Properties = {read=GetProperties};
	__property TcxCustomLookupGrid* Grid = {read=GetGrid};
	__property TMetaClass* ValueTypeClass = {read=GetValueTypeClass, write=SetValueTypeClass};
	
__published:
	__property AnsiString Caption = {read=GetCaption, write=SetCaption, stored=IsCaptionStored};
	__property bool Fixed = {read=FFixed, write=SetFixed, default=0};
	__property Classes::TAlignment HeaderAlignment = {read=FHeaderAlignment, write=SetHeaderAlignment, default=0};
	__property int MinWidth = {read=GetMinWidth, write=SetMinWidth, default=20};
	__property bool Sorting = {read=FSorting, write=SetSorting, default=1};
	__property Cxcustomdata::TcxDataSortOrder SortOrder = {read=GetSortOrder, write=SetSortOrder, default=0};
	__property Cxedit::TcxEditRepositoryItem* RepositoryItem = {read=FRepositoryItem, write=SetRepositoryItem};
	__property int Width = {read=GetWidth, write=SetWidth, stored=IsWidthStored, nodefault};
private:
	void *__IcxEditRepositoryItemListener;	/* Cxedit::IcxEditRepositoryItemListener */
	
public:
	operator IcxEditRepositoryItemListener*(void) { return (IcxEditRepositoryItemListener*)&__IcxEditRepositoryItemListener; }
	operator IInterface*(void) { return (IInterface*)&__IcxEditRepositoryItemListener; }
	
};


typedef TMetaClass*TcxLookupGridColumnClass;

class DELPHICLASS TcxLookupGridColumns;
class PASCALIMPLEMENTATION TcxLookupGridColumns : public Classes::TCollection 
{
	typedef Classes::TCollection inherited;
	
public:
	TcxLookupGridColumn* operator[](int Index) { return Items[Index]; }
	
private:
	TcxCustomLookupGrid* FGrid;
	TcxLookupGridColumn* __fastcall GetColumn(int Index);
	void __fastcall SetColumn(int Index, TcxLookupGridColumn* Value);
	
protected:
	DYNAMIC Classes::TPersistent* __fastcall GetOwner(void);
	virtual void __fastcall Update(Classes::TCollectionItem* Item);
	
public:
	__fastcall virtual TcxLookupGridColumns(TcxCustomLookupGrid* AGrid, TMetaClass* AColumnClass);
	HIDESBASE TcxLookupGridColumn* __fastcall Add(void);
	virtual void __fastcall RestoreDefaults(void);
	__property TcxCustomLookupGrid* Grid = {read=FGrid};
	__property TcxLookupGridColumn* Items[int Index] = {read=GetColumn, write=SetColumn/*, default*/};
public:
	#pragma option push -w-inl
	/* TCollection.Destroy */ inline __fastcall virtual ~TcxLookupGridColumns(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxLookupGridColumnsClass;

#pragma option push -b-
enum TcxLookupGridChange { lgcLayout, lgcData, lgcFocusedRow };
#pragma option pop

typedef Set<TcxLookupGridChange, lgcLayout, lgcFocusedRow>  TcxLookupGridChanges;

#pragma pack(push, 4)
struct TcxLookupGridHitInfo
{
	TcxLookupGridHitTest HitTest;
	int RowIndex;
	int ColumnIndex;
} ;
#pragma pack(pop)

class DELPHICLASS TcxLookupGridOptions;
class PASCALIMPLEMENTATION TcxLookupGridOptions : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	bool FColumnSorting;
	TcxCustomLookupGrid* FGrid;
	Cxgraphics::TcxGridLines FGridLines;
	bool FRowSelect;
	bool FShowHeader;
	Classes::TNotifyEvent FOnChanged;
	bool __fastcall GetAnsiSort(void);
	bool __fastcall GetCaseInsensitive(void);
	void __fastcall SetAnsiSort(bool Value);
	void __fastcall SetCaseInsensitive(bool Value);
	void __fastcall SetGridLines(Cxgraphics::TcxGridLines Value);
	void __fastcall SetRowSelect(bool Value);
	void __fastcall SetShowHeader(bool Value);
	
protected:
	virtual void __fastcall Changed(void);
	
public:
	__fastcall virtual TcxLookupGridOptions(TcxCustomLookupGrid* AGrid);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	__property TcxCustomLookupGrid* Grid = {read=FGrid};
	__property Classes::TNotifyEvent OnChanged = {read=FOnChanged, write=FOnChanged};
	
__published:
	__property bool AnsiSort = {read=GetAnsiSort, write=SetAnsiSort, default=0};
	__property bool CaseInsensitive = {read=GetCaseInsensitive, write=SetCaseInsensitive, default=0};
	__property bool ColumnSorting = {read=FColumnSorting, write=FColumnSorting, default=1};
	__property Cxgraphics::TcxGridLines GridLines = {read=FGridLines, write=SetGridLines, default=0};
	__property bool RowSelect = {read=FRowSelect, write=SetRowSelect, default=1};
	__property bool ShowHeader = {read=FShowHeader, write=SetShowHeader, default=1};
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxLookupGridOptions(void) { }
	#pragma option pop
	
};


typedef void __fastcall (__closure *TcxLookupGridCloseUpEvent)(System::TObject* Sender, bool AAccept);

class PASCALIMPLEMENTATION TcxCustomLookupGrid : public Cxcontrols::TcxControl 
{
	typedef Cxcontrols::TcxControl inherited;
	
private:
	TcxLookupGridChanges FChanges;
	TcxLookupGridColumns* FColumns;
	TcxLookupGridColumn* FFocusedColumn;
	bool FIsPopupControl;
	int FLockCount;
	TcxLookupGridOptions* FOptions;
	TcxLookupGridPainter* FPainter;
	bool FPopupMouseMoveLocked;
	bool FRowPressed;
	TcxLookupGridScrollMode FScrollMode;
	Extctrls::TTimer* FScrollTimer;
	int FTopRowIndex;
	TcxLookupGridViewInfo* FViewInfo;
	Classes::TNotifyEvent FOnClick;
	TcxLookupGridCloseUpEvent FOnCloseUp;
	Classes::TNotifyEvent FOnDataChanged;
	Classes::TNotifyEvent FOnFocusedRowChanged;
	void __fastcall CreateScrollTimer(void);
	void __fastcall DestroyScrollTimer(void);
	TcxLookupGridDataController* __fastcall GetDataController(void);
	TcxLookupGridColumn* __fastcall GetFocusedColumn(void);
	int __fastcall GetFocusedColumnIndex(void);
	int __fastcall GetFocusedRowIndex(void);
	int __fastcall GetRowCount(void);
	void __fastcall SetColumns(TcxLookupGridColumns* Value);
	void __fastcall SetDataController(TcxLookupGridDataController* Value);
	void __fastcall SetFocusedColumn(TcxLookupGridColumn* Value);
	void __fastcall SetFocusedColumnIndex(int Value);
	void __fastcall SetFocusedRowIndex(int Value);
	void __fastcall SetIsPopupControl(bool Value);
	void __fastcall SetOptions(TcxLookupGridOptions* Value);
	void __fastcall SetTopRowIndex(int Value);
	void __fastcall ScrollTimerHandler(System::TObject* Sender);
	
protected:
	Cxcustomdata::TcxCustomDataController* FDataController;
	DYNAMIC void __fastcall ColorChanged(void);
	DYNAMIC void __fastcall KeyDown(Word &Key, Classes::TShiftState Shift);
	virtual void __fastcall Loaded(void);
	DYNAMIC void __fastcall MouseDown(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseMove(Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseUp(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall Paint(void);
	DYNAMIC bool __fastcall AllowDragAndDropWithoutFocus(void);
	DYNAMIC void __fastcall BoundsChanged(void);
	DYNAMIC void __fastcall DoCancelMode(void);
	DYNAMIC void __fastcall FocusChanged(void);
	DYNAMIC void __fastcall FontChanged(void);
	virtual int __fastcall GetBorderSize(void);
	virtual void __fastcall InitControl(void);
	virtual void __fastcall InitScrollBarsParameters(void);
	virtual void __fastcall Scroll(Forms::TScrollBarKind AScrollBarKind, Stdctrls::TScrollCode AScrollCode, int &AScrollPos);
	virtual void __fastcall AddColumn(TcxLookupGridColumn* AColumn);
	virtual void __fastcall Change(TcxLookupGridChanges AChanges);
	void __fastcall CheckChanges(void);
	void __fastcall CheckSetTopRowIndex(int &Value);
	void __fastcall CheckTopRowIndex(int ATopRowIndex, bool ANotUpdate);
	virtual void __fastcall CreateHandlers(void);
	virtual void __fastcall CreateSubClasses(void);
	virtual void __fastcall DestroyHandlers(void);
	virtual void __fastcall DestroySubClasses(void);
	virtual void __fastcall DoCellClick(int ARowIndex, int AColumnIndex, Classes::TShiftState AShift);
	virtual void __fastcall DoHeaderClick(int AColumnIndex, Classes::TShiftState AShift);
	void __fastcall FocusColumn(int AColumnIndex);
	void __fastcall FocusNextPage(void);
	void __fastcall FocusNextRow(bool AGoForward);
	void __fastcall FocusPriorPage(void);
	virtual TMetaClass* __fastcall GetColumnClass(void);
	virtual TMetaClass* __fastcall GetColumnsClass(void);
	virtual TMetaClass* __fastcall GetDataControllerClass(void);
	virtual TMetaClass* __fastcall GetLFPainterClass(void);
	virtual TMetaClass* __fastcall GetPainterClass(void);
	virtual int __fastcall GetScrollBarOffsetBegin(void);
	virtual int __fastcall GetScrollBarOffsetEnd(void);
	virtual TMetaClass* __fastcall GetViewInfoClass(void);
	virtual bool __fastcall IsHotTrack(void);
	virtual void __fastcall LookAndFeelChanged(Cxlookandfeels::TcxLookAndFeel* Sender, Cxlookandfeels::TcxLookAndFeelValues AChangedValues);
	virtual void __fastcall RemoveColumn(TcxLookupGridColumn* AColumn);
	virtual void __fastcall SetScrollMode(TcxLookupGridScrollMode Value);
	void __fastcall ShowNextPage(void);
	void __fastcall ShowPrevPage(void);
	virtual void __fastcall UpdateFocusing(void);
	virtual void __fastcall UpdateRowInfo(int ARowIndex, bool ARecalculate);
	virtual void __fastcall UpdateLayout(void);
	virtual void __fastcall DataChanged(void);
	virtual void __fastcall DataLayoutChanged(void);
	virtual void __fastcall DoClick(void);
	virtual void __fastcall DoCloseUp(bool AAccept);
	virtual void __fastcall DoFocusedRowChanged(void);
	virtual void __fastcall FocusedRowChanged(int APrevFocusedRowIndex, int AFocusedRowIndex);
	virtual void __fastcall LayoutChanged(void);
	virtual void __fastcall SelectionChanged(Cxcustomdata::TcxSelectionChangedInfo* AInfo);
	virtual void __fastcall UpdateControl(Cxcustomdata::TcxUpdateControlInfo* AInfo);
	__property Color  = {default=-2147483643};
	__property ParentColor  = {default=0};
	
public:
	__fastcall virtual TcxCustomLookupGrid(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxCustomLookupGrid(void);
	void __fastcall BeginUpdate(void);
	void __fastcall CancelUpdate(void);
	void __fastcall EndUpdate(void);
	TcxLookupGridHitInfo __fastcall GetHitInfo(const Types::TPoint &P);
	int __fastcall GetNearestPopupHeight(int AHeight);
	int __fastcall GetPopupHeight(int ADropDownRowCount);
	bool __fastcall IsMouseOverList(const Types::TPoint &P);
	bool __fastcall IsRowVisible(int ARowIndex);
	void __fastcall MakeFocusedRowVisible(void);
	void __fastcall MakeRowVisible(int ARowIndex);
	virtual void __fastcall SyncSelected(bool ASelected);
	__property TcxLookupGridColumns* Columns = {read=FColumns, write=SetColumns};
	__property TcxLookupGridDataController* DataController = {read=GetDataController, write=SetDataController};
	__property TcxLookupGridColumn* FocusedColumn = {read=GetFocusedColumn, write=SetFocusedColumn};
	__property int FocusedColumnIndex = {read=GetFocusedColumnIndex, write=SetFocusedColumnIndex, nodefault};
	__property int FocusedRowIndex = {read=GetFocusedRowIndex, write=SetFocusedRowIndex, nodefault};
	__property bool IsPopupControl = {read=FIsPopupControl, write=SetIsPopupControl, nodefault};
	__property int LockCount = {read=FLockCount, nodefault};
	__property LookAndFeel ;
	__property TcxLookupGridOptions* Options = {read=FOptions, write=SetOptions};
	__property TcxLookupGridPainter* Painter = {read=FPainter};
	__property bool PopupMouseMoveLocked = {read=FPopupMouseMoveLocked, write=FPopupMouseMoveLocked, nodefault};
	__property int RowCount = {read=GetRowCount, nodefault};
	__property int ScrollBarOffsetBegin = {read=GetScrollBarOffsetBegin, nodefault};
	__property int ScrollBarOffsetEnd = {read=GetScrollBarOffsetEnd, nodefault};
	__property int TopRowIndex = {read=FTopRowIndex, write=SetTopRowIndex, nodefault};
	__property TcxLookupGridViewInfo* ViewInfo = {read=FViewInfo};
	__property Classes::TNotifyEvent OnClick = {read=FOnClick, write=FOnClick};
	__property TcxLookupGridCloseUpEvent OnCloseUp = {read=FOnCloseUp, write=FOnCloseUp};
	__property Classes::TNotifyEvent OnDataChanged = {read=FOnDataChanged, write=FOnDataChanged};
	__property Classes::TNotifyEvent OnFocusedRowChanged = {read=FOnFocusedRowChanged, write=FOnFocusedRowChanged};
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomLookupGrid(HWND ParentWindow) : Cxcontrols::TcxControl(ParentWindow) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxCustomLookupGridClass;

class DELPHICLASS TcxLookupGrid;
class PASCALIMPLEMENTATION TcxLookupGrid : public TcxCustomLookupGrid 
{
	typedef TcxCustomLookupGrid inherited;
	
__published:
	__property Align  = {default=0};
	__property Anchors  = {default=3};
	__property Color  = {default=-2147483643};
	__property Font ;
	__property ParentFont  = {default=1};
	__property Visible  = {default=1};
	__property Columns ;
	__property DataController ;
	__property Options ;
	__property LookAndFeel ;
public:
	#pragma option push -w-inl
	/* TcxCustomLookupGrid.Create */ inline __fastcall virtual TcxLookupGrid(Classes::TComponent* AOwner) : TcxCustomLookupGrid(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomLookupGrid.Destroy */ inline __fastcall virtual ~TcxLookupGrid(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxLookupGrid(HWND ParentWindow) : TcxCustomLookupGrid(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
static const Shortint cxLookupGridColumnDefaultMinWidth = 0x14;
static const Shortint cxGridEditOffset = 0x1;

}	/* namespace Cxlookupgrid */
using namespace Cxlookupgrid;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxLookupGrid
