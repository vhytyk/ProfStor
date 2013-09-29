// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxGridBandedTableView.pas' rev: 6.00

#ifndef cxGridBandedTableViewHPP
#define cxGridBandedTableViewHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Forms.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <cxGridRows.hpp>	// Pascal unit
#include <cxGridTableView.hpp>	// Pascal unit
#include <cxGridCustomTableView.hpp>	// Pascal unit
#include <cxGridCustomView.hpp>	// Pascal unit
#include <cxGridCommon.hpp>	// Pascal unit
#include <cxStorage.hpp>	// Pascal unit
#include <cxStyles.hpp>	// Pascal unit
#include <cxLookAndFeelPainters.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <ComCtrls.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxgridbandedtableview
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TcxGridBandFixedKind { fkNone, fkLeft, fkRight };
#pragma option pop

class DELPHICLASS TcxGridColumnHeaderVertSizingEdgeHitTest;
class PASCALIMPLEMENTATION TcxGridColumnHeaderVertSizingEdgeHitTest : public Cxgridtableview::TcxCustomGridColumnHitTest 
{
	typedef Cxgridtableview::TcxCustomGridColumnHitTest inherited;
	
protected:
	/* virtual class method */ virtual int __fastcall GetHitTestCode(TMetaClass* vmt);
	
public:
	/* virtual class method */ virtual Controls::TCursor __fastcall Cursor(TMetaClass* vmt);
	virtual TMetaClass* __fastcall DragAndDropObjectClass(void);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxGridColumnHeaderVertSizingEdgeHitTest(void) : Cxgridtableview::TcxCustomGridColumnHitTest() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridColumnHeaderVertSizingEdgeHitTest(void) { }
	#pragma option pop
	
};


#pragma option push -b-
enum TcxGridBandContainerKind { bcHeader, bcCustomizationForm };
#pragma option pop

class DELPHICLASS TcxGridBandHitTest;
class DELPHICLASS TcxGridBand;
class DELPHICLASS TcxGridBandOptions;
class PASCALIMPLEMENTATION TcxGridBandOptions : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	TcxGridBand* FBand;
	bool FHoldOwnColumnsOnly;
	bool FMoving;
	bool FSizing;
	
protected:
	__property TcxGridBand* Band = {read=FBand};
	
public:
	__fastcall virtual TcxGridBandOptions(TcxGridBand* ABand);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	
__published:
	__property bool HoldOwnColumnsOnly = {read=FHoldOwnColumnsOnly, write=FHoldOwnColumnsOnly, default=0};
	__property bool Moving = {read=FMoving, write=FMoving, default=1};
	__property bool Sizing = {read=FSizing, write=FSizing, default=1};
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxGridBandOptions(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridBandRows;
class DELPHICLASS TcxGridBandRow;
class DELPHICLASS TcxGridBandedTableView;
class DELPHICLASS TcxGridBandedColumn;
class PASCALIMPLEMENTATION TcxGridBandRows : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	TcxGridBandRow* operator[](int Index) { return Items[Index]; }
	
private:
	TcxGridBand* FBand;
	Classes::TList* FItems;
	Classes::TList* FVisibleItems;
	int __fastcall GetCount(void);
	TcxGridBandRow* __fastcall GetFirstVisible(void);
	TcxGridBandedTableView* __fastcall GetGridView(void);
	TcxGridBandRow* __fastcall GetItem(int Index);
	TcxGridBandRow* __fastcall GetLastVisible(void);
	int __fastcall GetVisibleCount(void);
	TcxGridBandRow* __fastcall GetVisibleItem(int Index);
	void __fastcall SetCount(int Value);
	void __fastcall RemoveItem(TcxGridBandRow* ARow);
	
protected:
	void __fastcall ColumnVisibilityChanged(TcxGridBandedColumn* AColumn);
	void __fastcall RefreshVisibleItemsList(void);
	__property TcxGridBandedTableView* GridView = {read=GetGridView};
	
public:
	__fastcall virtual TcxGridBandRows(TcxGridBand* ABand);
	__fastcall virtual ~TcxGridBandRows(void);
	void __fastcall ApplyBestFit(void);
	int __fastcall GetLineIndex(int ARowIndex);
	int __fastcall GetRowIndex(int ALineIndex);
	int __fastcall IndexOf(TcxGridBandedColumn* AColumn);
	TcxGridBandRow* __fastcall Insert(int AIndex);
	void __fastcall MoveColumn(TcxGridBandedColumn* AColumn, int ARowIndex, int AColIndex);
	__property TcxGridBand* Band = {read=FBand};
	__property int Count = {read=GetCount, write=SetCount, nodefault};
	__property TcxGridBandRow* FirstVisible = {read=GetFirstVisible};
	__property TcxGridBandRow* Items[int Index] = {read=GetItem/*, default*/};
	__property TcxGridBandRow* LastVisible = {read=GetLastVisible};
	__property int VisibleCount = {read=GetVisibleCount, nodefault};
	__property TcxGridBandRow* VisibleItems[int Index] = {read=GetVisibleItem};
};


class DELPHICLASS TcxGridBandStyles;
typedef void __fastcall (__closure *TcxGridBandGetHeaderStyle)(TcxGridBandedTableView* Sender, TcxGridBand* ABand, Cxstyles::TcxStyle* &AStyle);

class PASCALIMPLEMENTATION TcxGridBandStyles : public Cxgridcustomview::TcxCustomGridStyles 
{
	typedef Cxgridcustomview::TcxCustomGridStyles inherited;
	
private:
	TcxGridBandGetHeaderStyle FOnGetHeaderStyle;
	TcxGridBand* __fastcall GetBand(void);
	TcxGridBandedTableView* __fastcall GetGridViewValue(void);
	
protected:
	virtual void __fastcall GetDefaultViewParams(int Index, void * AData, /* out */ Cxgraphics::TcxViewParams &AParams);
	virtual Cxgridcustomview::TcxCustomGridView* __fastcall GetGridView(void);
	
public:
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual void __fastcall GetHeaderParams(/* out */ Cxgraphics::TcxViewParams &AParams);
	__property TcxGridBand* Band = {read=GetBand};
	__property TcxGridBandedTableView* GridView = {read=GetGridViewValue};
	
__published:
	__property Cxstyles::TcxStyle* Background = {read=GetValue, write=SetValue, index=0};
	__property Cxstyles::TcxStyle* Content = {read=GetValue, write=SetValue, index=1};
	__property Cxstyles::TcxStyle* Header = {read=GetValue, write=SetValue, index=2};
	__property TcxGridBandGetHeaderStyle OnGetHeaderStyle = {read=FOnGetHeaderStyle, write=FOnGetHeaderStyle};
public:
	#pragma option push -w-inl
	/* TcxCustomStyles.Create */ inline __fastcall virtual TcxGridBandStyles(Classes::TPersistent* AOwner) : Cxgridcustomview::TcxCustomGridStyles(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomStyles.Destroy */ inline __fastcall virtual ~TcxGridBandStyles(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridBands;
typedef TMetaClass*TcxGridBandOptionsClass;

typedef TMetaClass*TcxGridBandStylesClass;

class PASCALIMPLEMENTATION TcxGridBand : public Classes::TCollectionItem 
{
	typedef Classes::TCollectionItem inherited;
	
private:
	AnsiString FCaption;
	Classes::TList* FColumns;
	TcxGridBandFixedKind FFixedKind;
	Classes::TAlignment FHeaderAlignmentHorz;
	Cxclasses::TcxAlignmentVert FHeaderAlignmentVert;
	bool FHidden;
	TcxGridBandOptions* FOptions;
	TcxGridBandRows* FRows;
	TcxGridBandStyles* FStyles;
	bool FVisible;
	int FWidth;
	Classes::TNotifyEvent FSubClassEvents;
	Classes::TNotifyEvent FOnHeaderClick;
	TcxGridBands* __fastcall GetBands(void);
	int __fastcall GetColumnCount(void);
	TcxGridBandedColumn* __fastcall GetColumn(int Index);
	TcxGridBandedTableView* __fastcall GetGridView(void);
	bool __fastcall GetIsFirst(void);
	bool __fastcall GetIsFirstNonEmpty(void);
	bool __fastcall GetIsLast(void);
	bool __fastcall GetIsLastNonEmpty(void);
	int __fastcall GetVisibleIndex(void);
	void __fastcall SetCaption(const AnsiString Value);
	void __fastcall SetFixedKind(TcxGridBandFixedKind Value);
	void __fastcall SetHeaderAlignmentHorz(Classes::TAlignment Value);
	void __fastcall SetHeaderAlignmentVert(Cxclasses::TcxAlignmentVert Value);
	void __fastcall SetHidden(bool Value);
	void __fastcall SetOptions(TcxGridBandOptions* Value);
	void __fastcall SetStyles(TcxGridBandStyles* Value);
	void __fastcall SetVisible(bool Value);
	void __fastcall SetWidth(int Value);
	void __fastcall AddColumn(TcxGridBandedColumn* AColumn);
	void __fastcall RemoveColumn(TcxGridBandedColumn* AColumn);
	
protected:
	HRESULT __stdcall QueryInterface(const GUID &IID, /* out */ void *Obj);
	int __stdcall _AddRef(void);
	int __stdcall _Release(void);
	virtual AnsiString __fastcall GetObjectName();
	virtual bool __fastcall GetProperties(Classes::TStrings* AProperties);
	virtual void __fastcall GetPropertyValue(const AnsiString AName, Variant &AValue);
	virtual void __fastcall SetPropertyValue(const AnsiString AName, const Variant &AValue);
	virtual bool __fastcall CanHide(void);
	virtual bool __fastcall CanMove(void);
	virtual bool __fastcall CanSize(void);
	void __fastcall ColumnVisibilityChanged(TcxGridBandedColumn* AColumn);
	virtual void __fastcall ForceWidth(int Value);
	virtual void __fastcall HiddenChanged(void);
	int __fastcall ColIndexOf(TcxGridBandedColumn* AColumn);
	int __fastcall RowIndexOf(TcxGridBandedColumn* AColumn);
	virtual void __fastcall SetIndex(int Value);
	virtual TMetaClass* __fastcall GetOptionsClass(void);
	virtual TMetaClass* __fastcall GetStylesClass(void);
	virtual void __fastcall DoHeaderClick(void);
	
public:
	__fastcall virtual TcxGridBand(Classes::TCollection* Collection);
	__fastcall virtual ~TcxGridBand(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual void __fastcall ApplyBestFit(void);
	void __fastcall MoveColumn(TcxGridBandedColumn* AColumn, int ARowIndex, int AColIndex);
	__property TcxGridBands* Bands = {read=GetBands};
	__property int ColumnCount = {read=GetColumnCount, nodefault};
	__property TcxGridBandedColumn* Columns[int Index] = {read=GetColumn};
	__property TcxGridBandedTableView* GridView = {read=GetGridView};
	__property bool IsFirst = {read=GetIsFirst, nodefault};
	__property bool IsFirstNonEmpty = {read=GetIsFirstNonEmpty, nodefault};
	__property bool IsLast = {read=GetIsLast, nodefault};
	__property bool IsLastNonEmpty = {read=GetIsLastNonEmpty, nodefault};
	__property TcxGridBandRows* Rows = {read=FRows};
	__property int VisibleIndex = {read=GetVisibleIndex, nodefault};
	
__published:
	__property Classes::TAlignment Alignment = {read=FHeaderAlignmentHorz, write=SetHeaderAlignmentHorz, stored=false, nodefault};
	__property Classes::TAlignment HeaderAlignmentHorz = {read=FHeaderAlignmentHorz, write=SetHeaderAlignmentHorz, default=2};
	__property Cxclasses::TcxAlignmentVert HeaderAlignmentVert = {read=FHeaderAlignmentVert, write=SetHeaderAlignmentVert, default=2};
	__property AnsiString Caption = {read=FCaption, write=SetCaption};
	__property TcxGridBandFixedKind FixedKind = {read=FFixedKind, write=SetFixedKind, default=0};
	__property bool Hidden = {read=FHidden, write=SetHidden, default=0};
	__property TcxGridBandOptions* Options = {read=FOptions, write=SetOptions};
	__property TcxGridBandStyles* Styles = {read=FStyles, write=SetStyles};
	__property bool Visible = {read=FVisible, write=SetVisible, default=1};
	__property int Width = {read=FWidth, write=SetWidth, default=0};
	__property Classes::TNotifyEvent StylesEvents = {read=FSubClassEvents, write=FSubClassEvents};
	__property Classes::TNotifyEvent OnHeaderClick = {read=FOnHeaderClick, write=FOnHeaderClick};
private:
	void *__IcxStoredObject;	/* Cxstorage::IcxStoredObject */
	
public:
	operator IcxStoredObject*(void) { return (IcxStoredObject*)&__IcxStoredObject; }
	
};


class PASCALIMPLEMENTATION TcxGridBandHitTest : public Cxgridcustomview::TcxCustomGridViewHitTest 
{
	typedef Cxgridcustomview::TcxCustomGridViewHitTest inherited;
	
private:
	TcxGridBand* FBand;
	TcxGridBandContainerKind FBandContainerKind;
	int FVisibleRowIndex;
	
protected:
	/* virtual class method */ virtual int __fastcall GetHitTestCode(TMetaClass* vmt);
	
public:
	__property TcxGridBand* Band = {read=FBand, write=FBand};
	__property TcxGridBandContainerKind BandContainerKind = {read=FBandContainerKind, write=FBandContainerKind, nodefault};
	__property int VisibleRowIndex = {read=FVisibleRowIndex, write=FVisibleRowIndex, nodefault};
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxGridBandHitTest(void) : Cxgridcustomview::TcxCustomGridViewHitTest() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridBandHitTest(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridBandHeaderHitTest;
class PASCALIMPLEMENTATION TcxGridBandHeaderHitTest : public TcxGridBandHitTest 
{
	typedef TcxGridBandHitTest inherited;
	
protected:
	/* virtual class method */ virtual int __fastcall GetHitTestCode(TMetaClass* vmt);
	
public:
	virtual TMetaClass* __fastcall DragAndDropObjectClass(void);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxGridBandHeaderHitTest(void) : TcxGridBandHitTest() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridBandHeaderHitTest(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridBandHeaderSizingEdgeHitTest;
class PASCALIMPLEMENTATION TcxGridBandHeaderSizingEdgeHitTest : public TcxGridBandHitTest 
{
	typedef TcxGridBandHitTest inherited;
	
protected:
	/* virtual class method */ virtual int __fastcall GetHitTestCode(TMetaClass* vmt);
	
public:
	/* virtual class method */ virtual Controls::TCursor __fastcall Cursor(TMetaClass* vmt);
	virtual TMetaClass* __fastcall DragAndDropObjectClass(void);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxGridBandHeaderSizingEdgeHitTest(void) : TcxGridBandHitTest() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridBandHeaderSizingEdgeHitTest(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridBandedColumnHeaderMovingObject;
class DELPHICLASS TcxGridBandedColumnContainerZone;
class DELPHICLASS TcxGridBandedColumnPosition;
class DELPHICLASS TcxGridBandedTableViewInfo;
class PASCALIMPLEMENTATION TcxGridBandedColumnHeaderMovingObject : public Cxgridtableview::TcxGridColumnHeaderMovingObject 
{
	typedef Cxgridtableview::TcxGridColumnHeaderMovingObject inherited;
	
private:
	TcxGridBandedColumnContainerZone* __fastcall GetDestZone(void);
	TcxGridBandedColumn* __fastcall GetSourceColumn(void);
	TcxGridBandedColumnPosition* __fastcall GetSourcePosition(void);
	HIDESBASE TcxGridBandedTableViewInfo* __fastcall GetViewInfo(void);
	void __fastcall SetSourceColumn(TcxGridBandedColumn* Value);
	
protected:
	virtual bool __fastcall AreArrowsVertical(void);
	virtual void __fastcall DoColumnMoving(void);
	virtual Types::TRect __fastcall GetArrowAreaBoundsForHeader(Cxgridtableview::TcxGridArrowPlace APlace);
	virtual Types::TRect __fastcall GetArrowsClientRect();
	virtual bool __fastcall IsValidDestination(void);
	virtual bool __fastcall IsValidDestinationForVisibleSource(void);
	__property TcxGridBandedColumnContainerZone* DestZone = {read=GetDestZone};
	__property TcxGridBandedColumn* SourceColumn = {read=GetSourceColumn, write=SetSourceColumn};
	__property TcxGridBandedColumnPosition* SourcePosition = {read=GetSourcePosition};
	__property TcxGridBandedTableViewInfo* ViewInfo = {read=GetViewInfo};
public:
	#pragma option push -w-inl
	/* TcxGridColumnHeaderMovingObject.Create */ inline __fastcall virtual TcxGridBandedColumnHeaderMovingObject(Cxcontrols::TcxControl* AControl) : Cxgridtableview::TcxGridColumnHeaderMovingObject(AControl) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxGridColumnHeaderMovingObject.Destroy */ inline __fastcall virtual ~TcxGridBandedColumnHeaderMovingObject(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridBandHeaderMovingObject;
class DELPHICLASS TcxGridBandedTableController;
class DELPHICLASS TcxGridBandedTableCustomizationForm;
class PASCALIMPLEMENTATION TcxGridBandHeaderMovingObject : public Cxgridtableview::TcxCustomGridMovingObject 
{
	typedef Cxgridtableview::TcxCustomGridMovingObject inherited;
	
private:
	TcxGridBandContainerKind FDestBandContainerKind;
	int FDestBandIndex;
	TcxGridBand* FSourceBand;
	TcxGridBandContainerKind FSourceBandContainerKind;
	HIDESBASE TcxGridBandedTableController* __fastcall GetController(void);
	HIDESBASE TcxGridBandedTableCustomizationForm* __fastcall GetCustomizationForm(void);
	HIDESBASE TcxGridBandedTableView* __fastcall GetGridView(void);
	HIDESBASE TcxGridBandedTableViewInfo* __fastcall GetViewInfo(void);
	void __fastcall SetDestBandContainerKind(TcxGridBandContainerKind Value);
	void __fastcall SetDestBandIndex(int Value);
	
protected:
	virtual bool __fastcall CanRemove(void);
	virtual Types::TRect __fastcall GetArrowAreaBounds(Cxgridtableview::TcxGridArrowPlace APlace);
	virtual Types::TRect __fastcall GetArrowsClientRect();
	virtual Cxgridtableview::TcxCustomGridTableItemsListBox* __fastcall GetCustomizationFormListBox(void);
	virtual System::TObject* __fastcall GetSourceItem(void);
	virtual Cxgridcustomview::TcxCustomGridCellViewInfo* __fastcall GetSourceItemViewInfo(void);
	virtual bool __fastcall IsSourceCustomizationForm(void);
	virtual bool __fastcall IsValidDestination(void);
	__property TcxGridBandedTableController* Controller = {read=GetController};
	__property TcxGridBandedTableCustomizationForm* CustomizationForm = {read=GetCustomizationForm};
	__property TcxGridBandContainerKind DestBandContainerKind = {read=FDestBandContainerKind, write=SetDestBandContainerKind, nodefault};
	__property int DestBandIndex = {read=FDestBandIndex, write=SetDestBandIndex, nodefault};
	__property TcxGridBandedTableView* GridView = {read=GetGridView};
	__property TcxGridBand* SourceBand = {read=FSourceBand, write=FSourceBand};
	__property TcxGridBandContainerKind SourceBandContainerKind = {read=FSourceBandContainerKind, write=FSourceBandContainerKind, nodefault};
	__property TcxGridBandedTableViewInfo* ViewInfo = {read=GetViewInfo};
	
public:
	__fastcall virtual TcxGridBandHeaderMovingObject(Cxcontrols::TcxControl* AControl);
	virtual void __fastcall BeginDragAndDrop(void);
	virtual void __fastcall DragAndDrop(const Types::TPoint &P, bool &Accepted);
	virtual void __fastcall EndDragAndDrop(bool Accepted);
	virtual void __fastcall Init(const Types::TPoint &P, Cxgridcustomview::TcxCustomGridHitTest* AParams);
public:
	#pragma option push -w-inl
	/* TcxCustomGridMovingObject.Destroy */ inline __fastcall virtual ~TcxGridBandHeaderMovingObject(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridColumnVertSizingObject;
class PASCALIMPLEMENTATION TcxGridColumnVertSizingObject : public Cxgridtableview::TcxCustomGridColumnSizingObject 
{
	typedef Cxgridtableview::TcxCustomGridColumnSizingObject inherited;
	
private:
	TcxGridBandedColumn* __fastcall GetColumn(void);
	HIDESBASE TcxGridBandedTableController* __fastcall GetController(void);
	int __fastcall GetLineHeight(void);
	
protected:
	virtual int __fastcall GetCurrentSize(void);
	virtual bool __fastcall GetIsHorizontalSizing(void);
	__property TcxGridBandedColumn* Column = {read=GetColumn};
	__property TcxGridBandedTableController* Controller = {read=GetController};
	__property int LineHeight = {read=GetLineHeight, nodefault};
	
public:
	virtual void __fastcall BeginDragAndDrop(void);
	virtual void __fastcall EndDragAndDrop(bool Accepted);
public:
	#pragma option push -w-inl
	/* TcxDragAndDropObject.Create */ inline __fastcall virtual TcxGridColumnVertSizingObject(Cxcontrols::TcxControl* AControl) : Cxgridtableview::TcxCustomGridColumnSizingObject(AControl) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridColumnVertSizingObject(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridBandSizingObject;
class DELPHICLASS TcxGridBandViewInfo;
class PASCALIMPLEMENTATION TcxGridBandSizingObject : public Cxgridtableview::TcxCustomGridSizingObject 
{
	typedef Cxgridtableview::TcxCustomGridSizingObject inherited;
	
private:
	TcxGridBand* FBand;
	TcxGridBandViewInfo* __fastcall GetBandViewInfo(void);
	HIDESBASE TcxGridBandedTableController* __fastcall GetController(void);
	HIDESBASE TcxGridBandedTableView* __fastcall GetGridView(void);
	
protected:
	virtual int __fastcall GetCurrentSize(void);
	virtual Types::TRect __fastcall GetSizingItemBounds();
	virtual int __fastcall GetSizingMarkWidth(void);
	__property TcxGridBand* Band = {read=FBand, write=FBand};
	__property TcxGridBandViewInfo* BandViewInfo = {read=GetBandViewInfo};
	__property TcxGridBandedTableController* Controller = {read=GetController};
	__property TcxGridBandedTableView* GridView = {read=GetGridView};
	
public:
	virtual void __fastcall BeginDragAndDrop(void);
	virtual void __fastcall EndDragAndDrop(bool Accepted);
	virtual void __fastcall Init(const Types::TPoint &P, Cxgridcustomview::TcxCustomGridHitTest* AParams);
public:
	#pragma option push -w-inl
	/* TcxDragAndDropObject.Create */ inline __fastcall virtual TcxGridBandSizingObject(Cxcontrols::TcxControl* AControl) : Cxgridtableview::TcxCustomGridSizingObject(AControl) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridBandSizingObject(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxGridBandedTableBandsListBoxClass;

class DELPHICLASS TcxGridBandedTableBandsListBox;
class PASCALIMPLEMENTATION TcxGridBandedTableBandsListBox : public Cxgridtableview::TcxCustomGridTableItemsListBox 
{
	typedef Cxgridtableview::TcxCustomGridTableItemsListBox inherited;
	
private:
	HIDESBASE TcxGridBandedTableView* __fastcall GetGridView(void);
	
protected:
	virtual Cxgridcustomview::TcxCustomGridHitTest* __fastcall GetDragAndDropParams(void);
	__property TcxGridBandedTableView* GridView = {read=GetGridView};
	
public:
	virtual void __fastcall RefreshItems(void);
public:
	#pragma option push -w-inl
	/* TcxCustomGridTableItemsListBox.Create */ inline __fastcall TcxGridBandedTableBandsListBox(Classes::TComponent* AOwner) : Cxgridtableview::TcxCustomGridTableItemsListBox(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomGridTableItemsListBox.Destroy */ inline __fastcall virtual ~TcxGridBandedTableBandsListBox(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxGridBandedTableBandsListBox(HWND ParentWindow) : Cxgridtableview::TcxCustomGridTableItemsListBox(ParentWindow) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxGridBandedTableCustomizationForm : public Cxgridtableview::TcxGridTableCustomizationForm 
{
	typedef Cxgridtableview::TcxGridTableCustomizationForm inherited;
	
private:
	TcxGridBandedTableBandsListBox* FBandsListBox;
	Comctrls::TTabSheet* FBandsPage;
	HIDESBASE TcxGridBandedTableView* __fastcall GetGridView(void);
	
protected:
	virtual void __fastcall CreateControls(void);
	virtual void __fastcall InitPageControl(void);
	virtual TMetaClass* __fastcall GetBandsListBoxClass(void);
	__property TcxGridBandedTableBandsListBox* BandsListBox = {read=FBandsListBox};
	__property TcxGridBandedTableView* GridView = {read=GetGridView};
	
public:
	virtual void __fastcall RefreshData(void);
	__property Comctrls::TTabSheet* BandsPage = {read=FBandsPage};
public:
	#pragma option push -w-inl
	/* TcxGridTableCustomizationForm.Create */ inline __fastcall virtual TcxGridBandedTableCustomizationForm(Cxgridtableview::TcxGridTableController* AController) : Cxgridtableview::TcxGridTableCustomizationForm(AController) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxGridTableCustomizationForm.Destroy */ inline __fastcall virtual ~TcxGridBandedTableCustomizationForm(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual TcxGridBandedTableCustomizationForm(Classes::TComponent* AOwner, int Dummy) : Cxgridtableview::TcxGridTableCustomizationForm(AOwner, Dummy) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxGridBandedTableCustomizationForm(HWND ParentWindow) : Cxgridtableview::TcxGridTableCustomizationForm(ParentWindow) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxGridBandedTableController : public Cxgridtableview::TcxGridTableController 
{
	typedef Cxgridtableview::TcxGridTableController inherited;
	
private:
	TcxGridBand* FMovingBand;
	TcxGridBand* FPressedBand;
	TcxGridBand* FSizingBand;
	TcxGridBandedColumn* FVertSizingColumn;
	HIDESBASE TcxGridBandedTableView* __fastcall GetGridView(void);
	bool __fastcall GetIsBandMoving(void);
	bool __fastcall GetIsBandSizing(void);
	bool __fastcall GetIsColumnVertSizing(void);
	HIDESBASE TcxGridBandedTableViewInfo* __fastcall GetViewInfo(void);
	void __fastcall SetPressedBand(TcxGridBand* Value);
	
protected:
	virtual TMetaClass* __fastcall GetColumnHeaderDragAndDropObjectClass(void);
	virtual void __fastcall GetColumnNeighbors(TcxGridBandedColumn* AColumn, bool AGoForward, Classes::TList* AList);
	virtual TMetaClass* __fastcall GetCustomizationFormClass(void);
	virtual bool __fastcall IsBandFixedDuringSizing(TcxGridBand* ABand);
	virtual bool __fastcall IsColumnFixedDuringHorzSizing(Cxgridtableview::TcxGridColumn* AColumn);
	virtual void __fastcall LeftPosChanged(void);
	__property TcxGridBandedTableViewInfo* ViewInfo = {read=GetViewInfo};
	
public:
	virtual void __fastcall DoCancelMode(void);
	virtual void __fastcall EndDragAndDrop(bool Accepted);
	virtual int __fastcall FindNextColumnVertically(int AFocusedItemIndex, bool AGoForward, bool AGoOnCycle);
	virtual int __fastcall FindNextItem(int AFocusedItemIndex, bool AGoForward, bool AGoOnCycle, /* out */ bool &ACycleChanged);
	bool __fastcall FocusNextColumnVertically(int AFocusedColumnIndex, bool AGoForward, bool AGoOnCycle);
	virtual void __fastcall KeyDown(Word &Key, Classes::TShiftState Shift);
	virtual void __fastcall MouseUp(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	__property TcxGridBandedTableView* GridView = {read=GetGridView};
	__property bool IsBandMoving = {read=GetIsBandMoving, nodefault};
	__property bool IsBandSizing = {read=GetIsBandSizing, nodefault};
	__property bool IsColumnVertSizing = {read=GetIsColumnVertSizing, nodefault};
	__property TcxGridBand* MovingBand = {read=FMovingBand};
	__property TcxGridBand* PressedBand = {read=FPressedBand, write=SetPressedBand};
	__property TcxGridBand* SizingBand = {read=FSizingBand};
	__property TcxGridBandedColumn* VertSizingColumn = {read=FVertSizingColumn};
public:
	#pragma option push -w-inl
	/* TcxGridTableController.Destroy */ inline __fastcall virtual ~TcxGridBandedTableController(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomGridTableController.Create */ inline __fastcall virtual TcxGridBandedTableController(Cxgridcustomview::TcxCustomGridView* AGridView) : Cxgridtableview::TcxGridTableController(AGridView) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridBandHeaderPainter;
class DELPHICLASS TcxGridBandHeaderViewInfo;
class PASCALIMPLEMENTATION TcxGridBandHeaderPainter : public Cxgridcustomview::TcxCustomGridCellPainter 
{
	typedef Cxgridcustomview::TcxCustomGridCellPainter inherited;
	
private:
	TcxGridBandHeaderViewInfo* __fastcall GetViewInfo(void);
	
protected:
	virtual void __fastcall DrawBorders(void);
	virtual void __fastcall DrawContent(void);
	virtual void __fastcall DrawPressed(void);
	virtual bool __fastcall ExcludeFromClipRect(void);
	virtual void __fastcall Paint(void);
	__property TcxGridBandHeaderViewInfo* ViewInfo = {read=GetViewInfo};
public:
	#pragma option push -w-inl
	/* TcxCustomGridCellPainter.Create */ inline __fastcall virtual TcxGridBandHeaderPainter(Cxgraphics::TcxCanvas* ACanvas, Cxgridcustomview::TcxCustomGridCellViewInfo* AViewInfo) : Cxgridcustomview::TcxCustomGridCellPainter(ACanvas, AViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridBandHeaderPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridBandPainter;
class PASCALIMPLEMENTATION TcxGridBandPainter : public Cxgridcustomview::TcxCustomGridCellPainter 
{
	typedef Cxgridcustomview::TcxCustomGridCellPainter inherited;
	
private:
	TcxGridBandViewInfo* __fastcall GetViewInfo(void);
	
protected:
	virtual void __fastcall DrawColumnHeaders(void);
	virtual void __fastcall DrawContent(void);
	virtual void __fastcall DrawHeader(void);
	virtual bool __fastcall ExcludeFromClipRect(void);
	__property TcxGridBandViewInfo* ViewInfo = {read=GetViewInfo};
public:
	#pragma option push -w-inl
	/* TcxCustomGridCellPainter.Create */ inline __fastcall virtual TcxGridBandPainter(Cxgraphics::TcxCanvas* ACanvas, Cxgridcustomview::TcxCustomGridCellViewInfo* AViewInfo) : Cxgridcustomview::TcxCustomGridCellPainter(ACanvas, AViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridBandPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridBandedHeaderPainter;
class DELPHICLASS TcxGridBandedHeaderViewInfo;
class PASCALIMPLEMENTATION TcxGridBandedHeaderPainter : public Cxgridtableview::TcxGridHeaderPainter 
{
	typedef Cxgridtableview::TcxGridHeaderPainter inherited;
	
private:
	HIDESBASE TcxGridBandedHeaderViewInfo* __fastcall GetViewInfo(void);
	
protected:
	virtual void __fastcall DrawBands(void);
	virtual void __fastcall DrawItems(void);
	__property TcxGridBandedHeaderViewInfo* ViewInfo = {read=GetViewInfo};
public:
	#pragma option push -w-inl
	/* TcxCustomGridCellPainter.Create */ inline __fastcall virtual TcxGridBandedHeaderPainter(Cxgraphics::TcxCanvas* ACanvas, Cxgridcustomview::TcxCustomGridCellViewInfo* AViewInfo) : Cxgridtableview::TcxGridHeaderPainter(ACanvas, AViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridBandedHeaderPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridBandedFooterPainter;
class PASCALIMPLEMENTATION TcxGridBandedFooterPainter : public Cxgridtableview::TcxGridFooterPainter 
{
	typedef Cxgridtableview::TcxGridFooterPainter inherited;
	
protected:
	virtual void __fastcall DrawItems(void);
public:
	#pragma option push -w-inl
	/* TcxCustomGridCellPainter.Create */ inline __fastcall virtual TcxGridBandedFooterPainter(Cxgraphics::TcxCanvas* ACanvas, Cxgridcustomview::TcxCustomGridCellViewInfo* AViewInfo) : Cxgridtableview::TcxGridFooterPainter(ACanvas, AViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridBandedFooterPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridBandedDataRowCellsAreaItemPainter;
class DELPHICLASS TcxGridBandedDataRowCellsAreaItemViewInfo;
class PASCALIMPLEMENTATION TcxGridBandedDataRowCellsAreaItemPainter : public Cxgridcustomview::TcxCustomGridCellPainter 
{
	typedef Cxgridcustomview::TcxCustomGridCellPainter inherited;
	
private:
	TcxGridBandedDataRowCellsAreaItemViewInfo* __fastcall GetViewInfo(void);
	
protected:
	virtual void __fastcall DrawFixedBandsSeparator(void);
	virtual void __fastcall DrawContent(void);
	virtual void __fastcall DrawLines(void);
	virtual bool __fastcall ExcludeFromClipRect(void);
	virtual void __fastcall Paint(void);
	__property TcxGridBandedDataRowCellsAreaItemViewInfo* ViewInfo = {read=GetViewInfo};
public:
	#pragma option push -w-inl
	/* TcxCustomGridCellPainter.Create */ inline __fastcall virtual TcxGridBandedDataRowCellsAreaItemPainter(Cxgraphics::TcxCanvas* ACanvas, Cxgridcustomview::TcxCustomGridCellViewInfo* AViewInfo) : Cxgridcustomview::TcxCustomGridCellPainter(ACanvas, AViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridBandedDataRowCellsAreaItemPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridBandedRowsPainter;
class PASCALIMPLEMENTATION TcxGridBandedRowsPainter : public Cxgridtableview::TcxGridRowsPainter 
{
	typedef Cxgridtableview::TcxGridRowsPainter inherited;
	
public:
	/* virtual class method */ virtual void __fastcall DrawDataRowCells(TMetaClass* vmt, Cxgridtableview::TcxCustomGridRowViewInfo* ARowViewInfo);
public:
	#pragma option push -w-inl
	/* TcxCustomGridRecordsPainter.Create */ inline __fastcall virtual TcxGridBandedRowsPainter(Cxgraphics::TcxCanvas* ACanvas, Cxgridcustomtableview::TcxCustomGridRecordsViewInfo* AViewInfo) : Cxgridtableview::TcxGridRowsPainter(ACanvas, AViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridBandedRowsPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridBandedTablePainter;
class PASCALIMPLEMENTATION TcxGridBandedTablePainter : public Cxgridtableview::TcxGridTablePainter 
{
	typedef Cxgridtableview::TcxGridTablePainter inherited;
	
private:
	HIDESBASE TcxGridBandedTableViewInfo* __fastcall GetViewInfo(void);
	
protected:
	virtual bool __fastcall CanOffset(int AItemsOffset, int DX, int DY);
	
public:
	__property TcxGridBandedTableViewInfo* ViewInfo = {read=GetViewInfo};
public:
	#pragma option push -w-inl
	/* TcxGridViewHandler.Create */ inline __fastcall virtual TcxGridBandedTablePainter(Cxgridcustomview::TcxCustomGridView* AGridView) : Cxgridtableview::TcxGridTablePainter(AGridView) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxGridBandedTablePainter(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxGridBandedColumnContainerZone : public Cxgridtableview::TcxGridColumnContainerZone 
{
	typedef Cxgridtableview::TcxGridColumnContainerZone inherited;
	
public:
	TcxGridBand* Band;
	int ColIndex;
	int RowIndex;
	__fastcall TcxGridBandedColumnContainerZone(int AColumnIndex, TcxGridBand* ABand, int AColIndex, int ARowIndex);
	virtual bool __fastcall IsEqual(Cxgridtableview::TcxGridColumnContainerZone* Value);
	bool __fastcall IsInsertion(void);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridBandedColumnContainerZone(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridBandedColumnHeaderVertSizingEdgeViewInfo;
class PASCALIMPLEMENTATION TcxGridBandedColumnHeaderVertSizingEdgeViewInfo : public Cxgridtableview::TcxGridColumnHeaderAreaViewInfo 
{
	typedef Cxgridtableview::TcxGridColumnHeaderAreaViewInfo inherited;
	
protected:
	virtual int __fastcall CalculateHeight(void);
	virtual int __fastcall CalculateWidth(void);
	virtual Cxclasses::TcxAlignmentVert __fastcall GetAlignmentVert(void);
	virtual TMetaClass* __fastcall GetHitTestClass(void);
	virtual bool __fastcall GetIsOccupyingSpace(void);
	virtual TMetaClass* __fastcall GetPainterClass(void);
	virtual bool __fastcall GetTransparent(void);
	
public:
	virtual void __fastcall Calculate(const Types::TRect &ABounds, Types::TRect &ATextAreaBounds);
public:
	#pragma option push -w-inl
	/* TcxGridColumnHeaderAreaViewInfo.Create */ inline __fastcall virtual TcxGridBandedColumnHeaderVertSizingEdgeViewInfo(Cxgridtableview::TcxGridColumnHeaderViewInfo* AColumnHeaderViewInfo) : Cxgridtableview::TcxGridColumnHeaderAreaViewInfo(AColumnHeaderViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomGridViewCellViewInfo.Destroy */ inline __fastcall virtual ~TcxGridBandedColumnHeaderVertSizingEdgeViewInfo(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridBandedColumnHeaderViewInfo;
class DELPHICLASS TcxGridBandRowViewInfo;
class PASCALIMPLEMENTATION TcxGridBandedColumnHeaderViewInfo : public Cxgridtableview::TcxGridColumnHeaderViewInfo 
{
	typedef Cxgridtableview::TcxGridColumnHeaderViewInfo inherited;
	
private:
	TcxGridBandViewInfo* __fastcall GetBandViewInfo(void);
	TcxGridBandedColumn* __fastcall GetColumn(void);
	TcxGridBandedHeaderViewInfo* __fastcall GetContainer(void);
	TcxGridBandRowViewInfo* __fastcall GetRowViewInfo(void);
	
protected:
	virtual bool __fastcall CanVertSize(void);
	virtual void __fastcall GetAreaViewInfoClasses(Cxgridcommon::TcxGridClassEnumeratorProc AProc);
	virtual int __fastcall GetMaxWidth(void);
	virtual bool __fastcall GetMultiLinePainting(void);
	__property TcxGridBandViewInfo* BandViewInfo = {read=GetBandViewInfo};
	__property TcxGridBandedHeaderViewInfo* Container = {read=GetContainer};
	__property TcxGridBandRowViewInfo* RowViewInfo = {read=GetRowViewInfo};
	
public:
	__property TcxGridBandedColumn* Column = {read=GetColumn};
public:
	#pragma option push -w-inl
	/* TcxGridColumnHeaderViewInfo.Create */ inline __fastcall virtual TcxGridBandedColumnHeaderViewInfo(Cxgridtableview::TcxGridColumnContainerViewInfo* AContainer, Cxgridtableview::TcxGridColumn* AColumn) : Cxgridtableview::TcxGridColumnHeaderViewInfo(AContainer, AColumn) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxGridColumnHeaderViewInfo.Destroy */ inline __fastcall virtual ~TcxGridBandedColumnHeaderViewInfo(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxGridBandHeaderViewInfoClass;

class PASCALIMPLEMENTATION TcxGridBandHeaderViewInfo : public Cxgridcustomview::TcxCustomGridViewCellViewInfo 
{
	typedef Cxgridcustomview::TcxCustomGridViewCellViewInfo inherited;
	
private:
	TcxGridBandViewInfo* FBandViewInfo;
	TcxGridBand* __fastcall GetBand(void);
	HIDESBASE TcxGridBandedTableView* __fastcall GetGridView(void);
	TcxGridBandedTableViewInfo* __fastcall GetGridViewInfo(void);
	
protected:
	virtual int __fastcall CalculateHeight(void);
	virtual int __fastcall CalculateWidth(void);
	virtual bool __fastcall CustomDraw(Cxgraphics::TcxCanvas* ACanvas);
	virtual Classes::TAlignment __fastcall GetAlignmentHorz(void);
	virtual Cxclasses::TcxAlignmentVert __fastcall GetAlignmentVert(void);
	virtual Graphics::TBitmap* __fastcall GetBackgroundBitmap(void);
	virtual Cxgraphics::TcxBorders __fastcall GetBorders(void);
	virtual int __fastcall GetBorderWidth(Cxgraphics::TcxBorder AIndex);
	virtual Cxgraphics::TcxCanvas* __fastcall GetCanvas(void);
	/* virtual class method */ virtual int __fastcall GetCellHeight(TMetaClass* vmt, int ATextHeight, TMetaClass* ALookAndFeelPainter);
	virtual int __fastcall GetHeight(void);
	virtual TMetaClass* __fastcall GetHitTestClass(void);
	virtual bool __fastcall GetHotTrack(void);
	virtual bool __fastcall GetIsPressed(void);
	virtual bool __fastcall GetMultiLinePainting(void);
	virtual TMetaClass* __fastcall GetPainterClass(void);
	virtual bool __fastcall GetShowEndEllipsis(void);
	virtual Types::TRect __fastcall GetSizingEdgeBounds();
	virtual AnsiString __fastcall GetText();
	virtual bool __fastcall GetVisible(void);
	virtual void __fastcall GetViewParams(Cxgraphics::TcxViewParams &AParams);
	virtual bool __fastcall HasCustomDraw(void);
	virtual void __fastcall InitHitTest(Cxgridcustomview::TcxCustomGridHitTest* AHitTest);
	virtual void __fastcall StateChanged(void);
	__property Types::TRect SizingEdgeBounds = {read=GetSizingEdgeBounds};
	
public:
	__fastcall virtual TcxGridBandHeaderViewInfo(TcxGridBandViewInfo* ABandViewInfo);
	virtual Cxgridcustomview::TcxCustomGridHitTest* __fastcall GetHitTest(const Types::TPoint &P);
	virtual bool __fastcall MouseDown(Cxgridcustomview::TcxCustomGridHitTest* AHitTest, Controls::TMouseButton AButton, Classes::TShiftState AShift);
	__property TcxGridBand* Band = {read=GetBand};
	__property TcxGridBandViewInfo* BandViewInfo = {read=FBandViewInfo};
	__property TcxGridBandedTableView* GridView = {read=GetGridView};
	__property TcxGridBandedTableViewInfo* GridViewInfo = {read=GetGridViewInfo};
	__property bool IsPressed = {read=GetIsPressed, nodefault};
public:
	#pragma option push -w-inl
	/* TcxCustomGridViewCellViewInfo.Destroy */ inline __fastcall virtual ~TcxGridBandHeaderViewInfo(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxGridBandRowViewInfoClass;

class DELPHICLASS TcxGridBandRowsViewInfo;
class PASCALIMPLEMENTATION TcxGridBandRowsViewInfo : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	TcxGridBandRowViewInfo* operator[](int Index) { return Items[Index]; }
	
private:
	TcxGridBandViewInfo* FBandViewInfo;
	Classes::TList* FItems;
	int FWidth;
	TcxGridBandRows* __fastcall GetBandRows(void);
	int __fastcall GetCount(void);
	TcxGridBandRowViewInfo* __fastcall GetItem(int Index);
	int __fastcall GetLineCount(void);
	int __fastcall GetMinWidth(void);
	int __fastcall GetWidth(void);
	void __fastcall CreateItems(void);
	void __fastcall DestroyItems(void);
	
protected:
	virtual void __fastcall Calculate(const Types::TRect &ABounds);
	virtual void __fastcall CalculateColumnWidths(void);
	virtual int __fastcall CalculateWidth(void);
	virtual TMetaClass* __fastcall GetBandRowViewInfoClass(void);
	
public:
	#pragma pack(push, 1)
	Types::TRect Bounds;
	#pragma pack(pop)
	
	__fastcall virtual TcxGridBandRowsViewInfo(TcxGridBandViewInfo* ABandViewInfo);
	__fastcall virtual ~TcxGridBandRowsViewInfo(void);
	int __fastcall IndexAtPos(const Types::TPoint &P);
	virtual void __fastcall Offset(int DX, int DY);
	__property TcxGridBandRows* BandRows = {read=GetBandRows};
	__property TcxGridBandViewInfo* BandViewInfo = {read=FBandViewInfo};
	__property int Count = {read=GetCount, nodefault};
	__property TcxGridBandRowViewInfo* Items[int Index] = {read=GetItem/*, default*/};
	__property int LineCount = {read=GetLineCount, nodefault};
	__property int MinWidth = {read=GetMinWidth, nodefault};
	__property int Width = {read=GetWidth, nodefault};
};


class PASCALIMPLEMENTATION TcxGridBandRowViewInfo : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	TcxGridBandedColumnHeaderViewInfo* operator[](int Index) { return ColumnViewInfos[Index]; }
	
private:
	Classes::TList* FColumnViewInfos;
	int FHeight;
	int FIndex;
	int FLineCount;
	TcxGridBandRowsViewInfo* FRowsViewInfo;
	TcxGridBandRow* __fastcall GetBandRow(void);
	TcxGridBandViewInfo* __fastcall GetBandViewInfo(void);
	TcxGridBandedColumnHeaderViewInfo* __fastcall GetColumnViewInfo(int Index);
	int __fastcall GetColumnViewInfoCount(void);
	TcxGridBandedTableView* __fastcall GetGridView(void);
	int __fastcall GetHeight(void);
	int __fastcall GetLineCount(void);
	int __fastcall GetLineHeight(void);
	int __fastcall GetLineOffset(void);
	int __fastcall GetMinWidth(void);
	int __fastcall GetWidth(void);
	
protected:
	virtual void __fastcall AddColumnViewInfos(void);
	virtual void __fastcall Calculate(const Types::TRect &ABounds);
	virtual void __fastcall CalculateColumnWidths(void);
	virtual int __fastcall CalculateHeight(void);
	virtual int __fastcall CalculateLineCount(void);
	virtual int __fastcall CalculateLineHeight(void);
	virtual int __fastcall CalculateWidth(void);
	__property TcxGridBandedTableView* GridView = {read=GetGridView};
	__property int LineHeight = {read=GetLineHeight, nodefault};
	
public:
	#pragma pack(push, 1)
	Types::TRect Bounds;
	#pragma pack(pop)
	
	__fastcall virtual TcxGridBandRowViewInfo(TcxGridBandRowsViewInfo* ARowsViewInfo, int AIndex);
	__fastcall virtual ~TcxGridBandRowViewInfo(void);
	void __fastcall AssignColumnWidths(void);
	virtual void __fastcall Offset(int DX, int DY);
	__property TcxGridBandRow* BandRow = {read=GetBandRow};
	__property TcxGridBandViewInfo* BandViewInfo = {read=GetBandViewInfo};
	__property int ColumnViewInfoCount = {read=GetColumnViewInfoCount, nodefault};
	__property TcxGridBandedColumnHeaderViewInfo* ColumnViewInfos[int Index] = {read=GetColumnViewInfo/*, default*/};
	__property int Index = {read=FIndex, nodefault};
	__property int LineCount = {read=GetLineCount, nodefault};
	__property int LineOffset = {read=GetLineOffset, nodefault};
	__property int MinWidth = {read=GetMinWidth, nodefault};
	__property TcxGridBandRowsViewInfo* RowsViewInfo = {read=FRowsViewInfo};
	__property int Height = {read=GetHeight, nodefault};
	__property int Width = {read=GetWidth, nodefault};
};


typedef TMetaClass*TcxGridBandRowsViewInfoClass;

typedef TMetaClass*TcxGridBandViewInfoClass;

class DELPHICLASS TcxGridBandsViewInfo;
class PASCALIMPLEMENTATION TcxGridBandsViewInfo : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	TcxGridBandViewInfo* operator[](int Index) { return Items[Index]; }
	
private:
	TcxGridBandedHeaderViewInfo* FContainerViewInfo;
	int FBandHeadersAreaHeight;
	Classes::TList* FItems;
	int FLineCount;
	int FRowCount;
	int __fastcall GetBandHeadersAreaHeight(void);
	TcxGridBands* __fastcall GetBands(void);
	int __fastcall GetColumnHeadersAreaHeight(void);
	int __fastcall GetCount(void);
	TcxGridBandedTableView* __fastcall GetGridView(void);
	TcxGridBandedTableViewInfo* __fastcall GetGridViewInfo(void);
	TcxGridBandViewInfo* __fastcall GetInternalItem(int Index);
	TcxGridBandViewInfo* __fastcall GetItem(int Index);
	TcxGridBandViewInfo* __fastcall GetLastFixedItem(TcxGridBandFixedKind AFixedKind);
	int __fastcall GetLineCount(void);
	int __fastcall GetRowCount(void);
	void __fastcall CreateItems(void);
	void __fastcall DestroyItems(void);
	
protected:
	virtual void __fastcall Calculate(void);
	virtual int __fastcall CalculateBandHeadersAreaHeight(void);
	virtual void __fastcall CalculateColumnWidths(void);
	virtual int __fastcall CalculateHeight(void);
	virtual int __fastcall CalculateWidth(void);
	virtual Graphics::TBitmap* __fastcall GetBandBackgroundBitmap(void);
	virtual Graphics::TBitmap* __fastcall GetBandHeaderBackgroundBitmap(void);
	virtual TMetaClass* __fastcall GetItemClass(void);
	virtual bool __fastcall IsBandHeaderHeightAssigned(void);
	virtual bool __fastcall ShowBandHeaders(void);
	virtual bool __fastcall ShowColumnHeaders(void);
	__property int BandHeadersAreaHeight = {read=GetBandHeadersAreaHeight, nodefault};
	__property int ColumnHeadersAreaHeight = {read=GetColumnHeadersAreaHeight, nodefault};
	__property TcxGridBandedTableViewInfo* GridViewInfo = {read=GetGridViewInfo};
	__property TcxGridBandViewInfo* InternalItems[int Index] = {read=GetInternalItem};
	
public:
	__fastcall virtual TcxGridBandsViewInfo(TcxGridBandedHeaderViewInfo* AContainerViewInfo);
	__fastcall virtual ~TcxGridBandsViewInfo(void);
	void __fastcall AssignItemWidths(void);
	virtual Cxgridcustomview::TcxCustomGridHitTest* __fastcall GetHitTest(const Types::TPoint &P);
	int __fastcall IndexAtPos(const Types::TPoint &P);
	virtual void __fastcall Offset(int DX, int DY);
	__property Graphics::TBitmap* BandBackgroundBitmap = {read=GetBandBackgroundBitmap};
	__property Graphics::TBitmap* BandHeaderBackgroundBitmap = {read=GetBandHeaderBackgroundBitmap};
	__property TcxGridBands* Bands = {read=GetBands};
	__property TcxGridBandedHeaderViewInfo* ContainerViewInfo = {read=FContainerViewInfo};
	__property int Count = {read=GetCount, nodefault};
	__property TcxGridBandedTableView* GridView = {read=GetGridView};
	__property TcxGridBandViewInfo* Items[int Index] = {read=GetItem/*, default*/};
	__property TcxGridBandViewInfo* LastFixedItems[TcxGridBandFixedKind AFixedKind] = {read=GetLastFixedItem};
	__property int LineCount = {read=GetLineCount, nodefault};
	__property int RowCount = {read=GetRowCount, nodefault};
};


class PASCALIMPLEMENTATION TcxGridBandViewInfo : public Cxgridcustomview::TcxCustomGridCellViewInfo 
{
	typedef Cxgridcustomview::TcxCustomGridCellViewInfo inherited;
	
public:
	TcxGridBandedColumnHeaderViewInfo* operator[](int Index) { return ColumnViewInfos[Index]; }
	
private:
	TcxGridBandsViewInfo* FBandsViewInfo;
	Classes::TList* FColumnViewInfos;
	TcxGridBandHeaderViewInfo* FHeaderViewInfo;
	int FIndex;
	TcxGridBandRowsViewInfo* FRowsViewInfo;
	int FWidth;
	TcxGridBand* __fastcall GetBand(void);
	TcxGridBandedColumnHeaderViewInfo* __fastcall GetColumnViewInfo(int Index);
	int __fastcall GetColumnViewInfoCount(void);
	TcxGridBandedHeaderViewInfo* __fastcall GetContainerViewInfo(void);
	TcxGridBandFixedKind __fastcall GetFixedKind(void);
	TcxGridBandedTableView* __fastcall GetGridView(void);
	TcxGridBandedTableViewInfo* __fastcall GetGridViewInfo(void);
	bool __fastcall GetIsFixed(void);
	bool __fastcall GetIsRight(void);
	int __fastcall GetLineCount(void);
	int __fastcall GetRowCount(void);
	
protected:
	virtual void __fastcall AddColumnViewInfos(void);
	virtual void __fastcall CalculateColumnWidths(void);
	virtual Types::TRect __fastcall CalculateHeaderBounds();
	virtual Types::TRect __fastcall CalculateRowsBounds();
	virtual int __fastcall CalculateWidth(void);
	virtual bool __fastcall CanSize(void);
	virtual void __fastcall CheckWidth(int &Value);
	virtual bool __fastcall CustomDrawBackground(Cxgraphics::TcxCanvas* ACanvas);
	virtual bool __fastcall GetAreAllColumnsFixed(void);
	virtual Graphics::TBitmap* __fastcall GetBackgroundBitmap(void);
	virtual Graphics::TColor __fastcall GetBorderColor(Cxgraphics::TcxBorder AIndex);
	virtual Cxgraphics::TcxBorders __fastcall GetBorders(void);
	virtual int __fastcall GetBorderWidth(Cxgraphics::TcxBorder AIndex);
	virtual Cxgraphics::TcxCanvas* __fastcall GetCanvas(void);
	virtual int __fastcall GetContentWidth(void);
	virtual TMetaClass* __fastcall GetHeaderViewInfoClass(void);
	virtual TMetaClass* __fastcall GetHitTestClass(void);
	virtual int __fastcall GetMaxWidth(void);
	virtual int __fastcall GetMinWidth(void);
	virtual TMetaClass* __fastcall GetPainterClass(void);
	virtual TMetaClass* __fastcall GetRowsViewInfoClass(void);
	virtual void __fastcall GetViewParams(Cxgraphics::TcxViewParams &AParams);
	virtual int __fastcall GetWidth(void);
	virtual void __fastcall InitHitTest(Cxgridcustomview::TcxCustomGridHitTest* AHitTest);
	virtual void __fastcall Offset(int DX, int DY);
	virtual void __fastcall SetWidth(int Value);
	
public:
	__fastcall virtual TcxGridBandViewInfo(TcxGridBandsViewInfo* ABandsViewInfo, int AIndex);
	__fastcall virtual ~TcxGridBandViewInfo(void);
	virtual void __fastcall Calculate(const Types::TRect &ABounds)/* overload */;
	virtual Cxgridcustomview::TcxCustomGridHitTest* __fastcall GetHitTest(const Types::TPoint &P);
	void __fastcall InitAutoWidthItem(Cxclasses::TcxAutoWidthItem* AAutoWidthItem);
	__property bool AreAllColumnsFixed = {read=GetAreAllColumnsFixed, nodefault};
	__property TcxGridBand* Band = {read=GetBand};
	__property TcxGridBandsViewInfo* BandsViewInfo = {read=FBandsViewInfo};
	__property int ColumnViewInfoCount = {read=GetColumnViewInfoCount, nodefault};
	__property TcxGridBandedColumnHeaderViewInfo* ColumnViewInfos[int Index] = {read=GetColumnViewInfo/*, default*/};
	__property TcxGridBandedHeaderViewInfo* ContainerViewInfo = {read=GetContainerViewInfo};
	__property TcxGridBandFixedKind FixedKind = {read=GetFixedKind, nodefault};
	__property TcxGridBandedTableView* GridView = {read=GetGridView};
	__property TcxGridBandedTableViewInfo* GridViewInfo = {read=GetGridViewInfo};
	__property TcxGridBandHeaderViewInfo* HeaderViewInfo = {read=FHeaderViewInfo};
	__property int Index = {read=FIndex, nodefault};
	__property bool IsFixed = {read=GetIsFixed, nodefault};
	__property bool IsRight = {read=GetIsRight, nodefault};
	__property int LineCount = {read=GetLineCount, nodefault};
	__property int MaxWidth = {read=GetMaxWidth, nodefault};
	__property int MinWidth = {read=GetMinWidth, nodefault};
	__property int RowCount = {read=GetRowCount, nodefault};
	__property TcxGridBandRowsViewInfo* RowsViewInfo = {read=FRowsViewInfo};
	
/* Hoisted overloads: */
	
public:
	inline void __fastcall  Calculate(int ALeftBound, int ATopBound, int AWidth = 0xffffffff, int AHeight = 0xffffffff){ TcxCustomGridCellViewInfo::Calculate(ALeftBound, ATopBound, AWidth, AHeight); }
	
};


typedef TMetaClass*TcxGridBandsViewInfoClass;

class DELPHICLASS TcxGridBandedHeaderViewInfoSpecific;
class PASCALIMPLEMENTATION TcxGridBandedHeaderViewInfoSpecific : public Cxgridtableview::TcxGridHeaderViewInfoSpecific 
{
	typedef Cxgridtableview::TcxGridHeaderViewInfoSpecific inherited;
	
private:
	HIDESBASE TcxGridBandedTableViewInfo* __fastcall GetGridViewInfo(void);
	
protected:
	virtual int __fastcall CalculateHeight(void);
	
public:
	__property TcxGridBandedTableViewInfo* GridViewInfo = {read=GetGridViewInfo};
public:
	#pragma option push -w-inl
	/* TcxGridHeaderViewInfoSpecific.Create */ inline __fastcall virtual TcxGridBandedHeaderViewInfoSpecific(Cxgridtableview::TcxGridHeaderViewInfo* AContainerViewInfo) : Cxgridtableview::TcxGridHeaderViewInfoSpecific(AContainerViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridBandedHeaderViewInfoSpecific(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxGridBandedHeaderViewInfo : public Cxgridtableview::TcxGridHeaderViewInfo 
{
	typedef Cxgridtableview::TcxGridHeaderViewInfo inherited;
	
public:
	TcxGridBandedColumnHeaderViewInfo* operator[](int Index) { return Items[Index]; }
	
private:
	TcxGridBandsViewInfo* FBandsViewInfo;
	HIDESBASE TcxGridBandedTableView* __fastcall GetGridView(void);
	HIDESBASE TcxGridBandedTableViewInfo* __fastcall GetGridViewInfo(void);
	HIDESBASE TcxGridBandedColumnHeaderViewInfo* __fastcall GetItem(int Index);
	int __fastcall GetLineCount(void);
	int __fastcall GetRowCount(void);
	TcxGridBandedHeaderViewInfoSpecific* __fastcall GetSpecific(void);
	
protected:
	virtual void __fastcall CalculateColumnAutoWidths(void);
	virtual void __fastcall CalculateColumnWidths(void);
	virtual int __fastcall CalculateHeight(void);
	virtual void __fastcall CalculateItems(void);
	virtual bool __fastcall GetAutoHeight(void);
	virtual TMetaClass* __fastcall GetBandsViewInfoClass(void);
	virtual TMetaClass* __fastcall GetHitTestClass(void);
	virtual bool __fastcall GetIsScrollable(void);
	virtual TMetaClass* __fastcall GetItemClass(void);
	virtual Types::TRect __fastcall GetItemsAreaBounds();
	virtual TMetaClass* __fastcall GetPainterClass(void);
	virtual bool __fastcall GetVisible(void);
	virtual int __fastcall GetWidth(void);
	virtual bool __fastcall IsHeightAssigned(void);
	virtual void __fastcall Offset(int DX, int DY);
	
public:
	__fastcall virtual TcxGridBandedHeaderViewInfo(Cxgridtableview::TcxGridTableViewInfo* AGridViewInfo);
	__fastcall virtual ~TcxGridBandedHeaderViewInfo(void);
	virtual Cxgridcustomview::TcxCustomGridHitTest* __fastcall GetHitTest(const Types::TPoint &P);
	virtual Cxgridtableview::TcxGridColumnContainerZone* __fastcall GetZone(const Types::TPoint &P);
	__property TcxGridBandsViewInfo* BandsViewInfo = {read=FBandsViewInfo};
	__property TcxGridBandedTableView* GridView = {read=GetGridView};
	__property TcxGridBandedTableViewInfo* GridViewInfo = {read=GetGridViewInfo};
	__property TcxGridBandedColumnHeaderViewInfo* Items[int Index] = {read=GetItem/*, default*/};
	__property int LineCount = {read=GetLineCount, nodefault};
	__property int RowCount = {read=GetRowCount, nodefault};
	__property TcxGridBandedHeaderViewInfoSpecific* Specific = {read=GetSpecific};
};


#pragma option push -b-
enum TcxGridFixedBandsSeparatorLocation { slNone, slLeft, slRight };
#pragma option pop

typedef TMetaClass*TcxGridBandedDataRowCellsAreaItemViewInfoClass;

class DELPHICLASS TcxGridBandedDataRowCellsAreaViewInfo;
class PASCALIMPLEMENTATION TcxGridBandedDataRowCellsAreaViewInfo : public Cxgridrows::TcxGridDataRowCellsAreaViewInfo 
{
	typedef Cxgridrows::TcxGridDataRowCellsAreaViewInfo inherited;
	
public:
	TcxGridBandedDataRowCellsAreaItemViewInfo* operator[](int Index) { return Items[Index]; }
	
private:
	Classes::TList* FItems;
	TcxGridBandsViewInfo* __fastcall GetBandsViewInfo(void);
	int __fastcall GetCount(void);
	HIDESBASE TcxGridBandedTableViewInfo* __fastcall GetGridViewInfo(void);
	TcxGridBandedDataRowCellsAreaItemViewInfo* __fastcall GetItem(int Index);
	void __fastcall CreateItems(void);
	void __fastcall DestroyItems(void);
	
protected:
	virtual bool __fastcall CalculateVisible(void);
	virtual TMetaClass* __fastcall GetItemClass(void);
	virtual void __fastcall Offset(int DX, int DY);
	__property TcxGridBandsViewInfo* BandsViewInfo = {read=GetBandsViewInfo};
	__property TcxGridBandedTableViewInfo* GridViewInfo = {read=GetGridViewInfo};
	
public:
	__fastcall virtual TcxGridBandedDataRowCellsAreaViewInfo(Cxgridcustomtableview::TcxCustomGridRecordViewInfo* ARecordViewInfo);
	__fastcall virtual ~TcxGridBandedDataRowCellsAreaViewInfo(void);
	virtual void __fastcall BeforeRecalculation(void);
	virtual void __fastcall Calculate(int ALeftBound, int ATopBound, int AWidth = 0xffffffff, int AHeight = 0xffffffff)/* overload */;
	__property int Count = {read=GetCount, nodefault};
	__property TcxGridBandedDataRowCellsAreaItemViewInfo* Items[int Index] = {read=GetItem/*, default*/};
	
/* Hoisted overloads: */
	
public:
	inline void __fastcall  Calculate(const Types::TRect &ABounds){ TcxCustomGridCellViewInfo::Calculate(ABounds); }
	
};


class DELPHICLASS TcxGridBandedRowsViewInfo;
class PASCALIMPLEMENTATION TcxGridBandedDataRowCellsAreaItemViewInfo : public Cxgridrows::TcxGridCellViewInfo 
{
	typedef Cxgridrows::TcxGridCellViewInfo inherited;
	
private:
	TcxGridBandViewInfo* FBandViewInfo;
	TcxGridBandedDataRowCellsAreaViewInfo* FCellsAreaViewInfo;
	Classes::TList* FLineBounds;
	TcxGridFixedBandsSeparatorLocation __fastcall GetFixedBandsSeparatorLocation(void);
	HIDESBASE TcxGridBandedTableViewInfo* __fastcall GetGridViewInfo(void);
	Types::TRect __fastcall GetLineBounds(int Index);
	int __fastcall GetLineCount(void);
	TcxGridBandedRowsViewInfo* __fastcall GetRecordsViewInfo(void);
	HIDESBASE Cxgridrows::TcxGridDataRowViewInfo* __fastcall GetRecordViewInfo(void);
	void __fastcall ClearLines(void);
	void __fastcall CreateLineBounds(void);
	void __fastcall DestroyLineBounds(void);
	
protected:
	void __fastcall AddLine(const Types::TRect &ABounds);
	virtual void __fastcall AddLines(void);
	virtual int __fastcall CalculateWidth(void);
	virtual Cxgraphics::TcxBorders __fastcall GetBorders(void);
	virtual Types::TRect __fastcall GetFixedBandsSeparatorBounds();
	virtual TMetaClass* __fastcall GetPainterClass(void);
	virtual void __fastcall GetViewParams(Cxgraphics::TcxViewParams &AParams);
	virtual void __fastcall Offset(int DX, int DY);
	__property TcxGridBandViewInfo* BandViewInfo = {read=FBandViewInfo};
	__property TcxGridBandedDataRowCellsAreaViewInfo* CellsAreaViewInfo = {read=FCellsAreaViewInfo};
	__property TcxGridBandedTableViewInfo* GridViewInfo = {read=GetGridViewInfo};
	__property Cxgridrows::TcxGridDataRowViewInfo* RecordViewInfo = {read=GetRecordViewInfo};
	__property TcxGridBandedRowsViewInfo* RecordsViewInfo = {read=GetRecordsViewInfo};
	
public:
	__fastcall virtual TcxGridBandedDataRowCellsAreaItemViewInfo(TcxGridBandedDataRowCellsAreaViewInfo* ACellsAreaViewInfo, TcxGridBandViewInfo* ABandViewInfo);
	__fastcall virtual ~TcxGridBandedDataRowCellsAreaItemViewInfo(void);
	virtual void __fastcall BeforeRecalculation(void);
	virtual void __fastcall Calculate(int ALeftBound, int ATopBound, int AWidth = 0xffffffff, int AHeight = 0xffffffff)/* overload */;
	virtual bool __fastcall CanDrawSelected(void);
	__property Types::TRect FixedBandsSeparatorBounds = {read=GetFixedBandsSeparatorBounds};
	__property TcxGridFixedBandsSeparatorLocation FixedBandsSeparatorLocation = {read=GetFixedBandsSeparatorLocation, nodefault};
	__property Types::TRect LineBounds[int Index] = {read=GetLineBounds};
	__property int LineCount = {read=GetLineCount, nodefault};
	
/* Hoisted overloads: */
	
public:
	inline void __fastcall  Calculate(const Types::TRect &ABounds){ TcxCustomGridCellViewInfo::Calculate(ABounds); }
	
};


class PASCALIMPLEMENTATION TcxGridBandedRowsViewInfo : public Cxgridtableview::TcxGridRowsViewInfo 
{
	typedef Cxgridtableview::TcxGridRowsViewInfo inherited;
	
private:
	bool FRowCellsAreaVisible;
	HIDESBASE TcxGridBandedHeaderViewInfo* __fastcall GetHeaderViewInfo(void);
	int __fastcall GetLineCount(void);
	int __fastcall GetRowCount(void);
	
protected:
	virtual int __fastcall CalculateDataRowHeight(void);
	virtual bool __fastcall CalculateRowCellsAreaVisible(void);
	virtual bool __fastcall GetAutoDataRecordHeight(void);
	virtual TMetaClass* __fastcall GetPainterClass(void);
	virtual int __fastcall GetRowWidth(void);
	virtual bool __fastcall GetShowBandSeparators(void);
	virtual bool __fastcall GetShowCellLeftLines(void);
	virtual bool __fastcall GetShowCellTopLines(void);
	__property TcxGridBandedHeaderViewInfo* HeaderViewInfo = {read=GetHeaderViewInfo};
	__property int LineCount = {read=GetLineCount, nodefault};
	__property int RowCount = {read=GetRowCount, nodefault};
	__property bool ShowBandSeparators = {read=GetShowBandSeparators, nodefault};
	__property bool ShowCellLeftLines = {read=GetShowCellLeftLines, nodefault};
	__property bool ShowCellTopLines = {read=GetShowCellTopLines, nodefault};
	
public:
	virtual void __fastcall AfterConstruction(void);
	virtual bool __fastcall CanDataRowSize(void);
	virtual TMetaClass* __fastcall GetDataRowCellsAreaViewInfoClass(void);
	virtual bool __fastcall IsDataRowHeightAssigned(void);
	__property bool RowCellsAreaVisible = {read=FRowCellsAreaVisible, nodefault};
public:
	#pragma option push -w-inl
	/* TcxGridRowsViewInfo.Destroy */ inline __fastcall virtual ~TcxGridBandedRowsViewInfo(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomGridRecordsViewInfo.Create */ inline __fastcall virtual TcxGridBandedRowsViewInfo(Cxgridcustomtableview::TcxCustomGridTableViewInfo* AGridViewInfo) : Cxgridtableview::TcxGridRowsViewInfo(AGridViewInfo) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxGridBandedTableViewInfo : public Cxgridtableview::TcxGridTableViewInfo 
{
	typedef Cxgridtableview::TcxGridTableViewInfo inherited;
	
private:
	HIDESBASE TcxGridBandedTableController* __fastcall GetController(void);
	Graphics::TColor __fastcall GetFixedBandSeparatorColor(void);
	int __fastcall GetFixedBandSeparatorWidth(void);
	HIDESBASE TcxGridBandedTableView* __fastcall GetGridView(void);
	TcxGridBandedHeaderViewInfo* __fastcall GetHeaderViewInfo(void);
	
protected:
	virtual TMetaClass* __fastcall GetFooterPainterClass(void);
	virtual TMetaClass* __fastcall GetHeaderViewInfoClass(void);
	virtual TMetaClass* __fastcall GetHeaderViewInfoSpecificClass(void);
	virtual TMetaClass* __fastcall GetRecordsViewInfoClass(void);
	virtual Types::TRect __fastcall GetScrollableAreaBoundsForEdit();
	virtual Types::TRect __fastcall GetScrollableAreaBoundsHorz();
	__property TcxGridBandedTableController* Controller = {read=GetController};
	
public:
	virtual bool __fastcall CanOffset(int ARecordCountDelta, int DX, int DY);
	virtual int __fastcall GetCellHeight(int AIndex, int ACellHeight);
	virtual int __fastcall GetCellTopOffset(int AIndex, int ACellHeight);
	__property Graphics::TColor FixedBandSeparatorColor = {read=GetFixedBandSeparatorColor, nodefault};
	__property int FixedBandSeparatorWidth = {read=GetFixedBandSeparatorWidth, nodefault};
	__property TcxGridBandedTableView* GridView = {read=GetGridView};
	__property TcxGridBandedHeaderViewInfo* HeaderViewInfo = {read=GetHeaderViewInfo};
public:
	#pragma option push -w-inl
	/* TcxGridTableViewInfo.Create */ inline __fastcall virtual TcxGridBandedTableViewInfo(Cxgridcustomview::TcxCustomGridView* AGridView) : Cxgridtableview::TcxGridTableViewInfo(AGridView) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxGridTableViewInfo.Destroy */ inline __fastcall virtual ~TcxGridBandedTableViewInfo(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridBandedColumnOptions;
class PASCALIMPLEMENTATION TcxGridBandedColumnOptions : public Cxgridtableview::TcxGridColumnOptions 
{
	typedef Cxgridtableview::TcxGridColumnOptions inherited;
	
private:
	bool FVertSizing;
	void __fastcall SetVertSizing(bool Value);
	
public:
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	__fastcall virtual TcxGridBandedColumnOptions(Cxgridcustomtableview::TcxCustomGridTableItem* AItem);
	
__published:
	__property bool VertSizing = {read=FVertSizing, write=SetVertSizing, default=1};
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxGridBandedColumnOptions(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridBandedColumnStyles;
class PASCALIMPLEMENTATION TcxGridBandedColumnStyles : public Cxgridtableview::TcxGridColumnStyles 
{
	typedef Cxgridtableview::TcxGridColumnStyles inherited;
	
private:
	HIDESBASE TcxGridBandedColumn* __fastcall GetItem(void);
	
protected:
	virtual void __fastcall GetDefaultViewParams(int Index, void * AData, /* out */ Cxgraphics::TcxViewParams &AParams);
	
public:
	__property TcxGridBandedColumn* Item = {read=GetItem};
public:
	#pragma option push -w-inl
	/* TcxCustomStyles.Create */ inline __fastcall virtual TcxGridBandedColumnStyles(Classes::TPersistent* AOwner) : Cxgridtableview::TcxGridColumnStyles(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomStyles.Destroy */ inline __fastcall virtual ~TcxGridBandedColumnStyles(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxGridBandedColumnPosition : public Cxgridcustomtableview::TcxCustomGridTableItemCustomOptions 
{
	typedef Cxgridcustomtableview::TcxCustomGridTableItemCustomOptions inherited;
	
private:
	TcxGridBand* FBand;
	int FBandIndex;
	int FColIndex;
	int FLineCount;
	int FRowIndex;
	int __fastcall GetBandIndex(void);
	int __fastcall GetColIndex(void);
	HIDESBASE TcxGridBandedTableView* __fastcall GetGridView(void);
	TcxGridBandedColumn* __fastcall GetItem(void);
	TcxGridBandRow* __fastcall GetRow(void);
	int __fastcall GetRowIndex(void);
	int __fastcall GetVisibleBandIndex(void);
	int __fastcall GetVisibleColIndex(void);
	int __fastcall GetVisibleRowIndex(void);
	void __fastcall SetBandIndex(int Value);
	void __fastcall SetColIndex(int Value);
	void __fastcall SetLineCount(int Value);
	void __fastcall SetRowIndex(int Value);
	
protected:
	virtual void __fastcall DefineProperties(Classes::TFiler* Filer);
	void __fastcall CheckLineCount(int &Value);
	void __fastcall SaveParams(void);
	__property TcxGridBandedTableView* GridView = {read=GetGridView};
	__property TcxGridBandedColumn* Item = {read=GetItem};
	
public:
	__fastcall virtual TcxGridBandedColumnPosition(Cxgridcustomtableview::TcxCustomGridTableItem* AItem);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	__property TcxGridBand* Band = {read=FBand};
	__property TcxGridBandRow* Row = {read=GetRow};
	__property int VisibleBandIndex = {read=GetVisibleBandIndex, nodefault};
	__property int VisibleColIndex = {read=GetVisibleColIndex, nodefault};
	__property int VisibleRowIndex = {read=GetVisibleRowIndex, nodefault};
	
__published:
	__property int BandIndex = {read=GetBandIndex, write=SetBandIndex, nodefault};
	__property int ColIndex = {read=GetColIndex, write=SetColIndex, nodefault};
	__property int LineCount = {read=FLineCount, write=SetLineCount, default=1};
	__property int RowIndex = {read=GetRowIndex, write=SetRowIndex, nodefault};
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxGridBandedColumnPosition(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxGridBandedColumn : public Cxgridtableview::TcxGridColumn 
{
	typedef Cxgridtableview::TcxGridColumn inherited;
	
private:
	TcxGridBandedColumnPosition* FPosition;
	HIDESBASE TcxGridBandedTableView* __fastcall GetGridView(void);
	HIDESBASE TcxGridBandedColumnOptions* __fastcall GetOptions(void);
	HIDESBASE TcxGridBandedColumnStyles* __fastcall GetStyles(void);
	HIDESBASE void __fastcall SetOptions(TcxGridBandedColumnOptions* Value);
	void __fastcall SetPosition(TcxGridBandedColumnPosition* Value);
	HIDESBASE void __fastcall SetStyles(TcxGridBandedColumnStyles* Value);
	
protected:
	virtual bool __fastcall GetStoredProperties(Classes::TStrings* AProperties);
	virtual void __fastcall GetPropertyValue(const AnsiString AName, Variant &AValue);
	virtual void __fastcall SetPropertyValue(const AnsiString AName, const Variant &AValue);
	virtual void __fastcall CreateSubClasses(void);
	virtual void __fastcall DestroySubClasses(void);
	virtual void __fastcall AssignColumnWidths(void);
	virtual bool __fastcall CanScroll(void);
	virtual bool __fastcall CanVertSize(void);
	virtual bool __fastcall GetActuallyVisible(void);
	virtual bool __fastcall GetEditPartVisible(void);
	virtual bool __fastcall GetIsBottom(void);
	virtual bool __fastcall GetIsLeft(void);
	virtual bool __fastcall GetIsMostBottom(void);
	virtual bool __fastcall GetIsMostLeft(void);
	virtual bool __fastcall GetIsMostRight(void);
	virtual bool __fastcall GetIsRight(void);
	virtual TMetaClass* __fastcall GetOptionsClass(void);
	virtual TMetaClass* __fastcall GetStylesClass(void);
	
public:
	__fastcall virtual ~TcxGridBandedColumn(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	__property TcxGridBandedTableView* GridView = {read=GetGridView};
	
__published:
	__property TcxGridBandedColumnOptions* Options = {read=GetOptions, write=SetOptions};
	__property TcxGridBandedColumnPosition* Position = {read=FPosition, write=SetPosition};
	__property TcxGridBandedColumnStyles* Styles = {read=GetStyles, write=SetStyles};
public:
	#pragma option push -w-inl
	/* TcxGridColumn.Create */ inline __fastcall virtual TcxGridBandedColumn(Classes::TComponent* AOwner) : Cxgridtableview::TcxGridColumn(AOwner) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxGridBandRow : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	TcxGridBandedColumn* operator[](int Index) { return Items[Index]; }
	
private:
	TcxGridBandRows* FBandRows;
	Classes::TList* FItems;
	Classes::TList* FVisibleItems;
	int __fastcall GetCount(void);
	int __fastcall GetIndex(void);
	bool __fastcall GetIsFirst(void);
	bool __fastcall GetIsLast(void);
	TcxGridBandedColumn* __fastcall GetItem(int Index);
	int __fastcall GetLineCount(void);
	int __fastcall GetLineOffset(void);
	bool __fastcall GetVisible(void);
	int __fastcall GetVisibleCount(void);
	int __fastcall GetVisibleIndex(void);
	TcxGridBandedColumn* __fastcall GetVisibleItem(int Index);
	
protected:
	void __fastcall CheckIndexForInsert(int &AIndex, bool AExistingItem);
	void __fastcall RefreshVisibleItemsList(void);
	
public:
	__fastcall TcxGridBandRow(TcxGridBandRows* ABandRows);
	__fastcall virtual ~TcxGridBandRow(void);
	void __fastcall ApplyBestFit(void);
	void __fastcall Delete(int AIndex);
	int __fastcall IndexOf(TcxGridBandedColumn* AColumn);
	void __fastcall Insert(int AIndex, TcxGridBandedColumn* AColumn);
	void __fastcall Move(int ACurIndex, int ANewIndex);
	int __fastcall VisibleIndexOf(TcxGridBandedColumn* AColumn);
	__property TcxGridBandRows* BandRows = {read=FBandRows};
	__property int Count = {read=GetCount, nodefault};
	__property int Index = {read=GetIndex, nodefault};
	__property bool IsFirst = {read=GetIsFirst, nodefault};
	__property bool IsLast = {read=GetIsLast, nodefault};
	__property TcxGridBandedColumn* Items[int Index] = {read=GetItem/*, default*/};
	__property int LineCount = {read=GetLineCount, nodefault};
	__property int LineOffset = {read=GetLineOffset, nodefault};
	__property bool Visible = {read=GetVisible, nodefault};
	__property int VisibleCount = {read=GetVisibleCount, nodefault};
	__property int VisibleIndex = {read=GetVisibleIndex, nodefault};
	__property TcxGridBandedColumn* VisibleItems[int Index] = {read=GetVisibleItem};
};


typedef TMetaClass*TcxGridBandClass;

#pragma option push -b-
enum TcxGridBandsLayout { blNonFixed, blLeftFixed, blRightFixed, blLeftRightFixed };
#pragma option pop

typedef TMetaClass*TcxGridBandsClass;

class PASCALIMPLEMENTATION TcxGridBands : public Classes::TOwnedCollection 
{
	typedef Classes::TOwnedCollection inherited;
	
public:
	TcxGridBand* operator[](int Index) { return Items[Index]; }
	
private:
	TcxGridBandedTableView* FGridView;
	Classes::TList* FVisibleItems;
	int FVisibleLeftFixedCount;
	int FVisibleRightFixedCount;
	TcxGridBand* __fastcall GetFirstVisibleNonEmpty(void);
	HIDESBASE TcxGridBand* __fastcall GetItem(int Index);
	TcxGridBand* __fastcall GetLastVisibleNonEmpty(void);
	TcxGridBandsLayout __fastcall GetLayout(void);
	int __fastcall GetVisibleCount(void);
	TcxGridBand* __fastcall GetVisibleItem(int Index);
	int __fastcall GetVisibleRowCount(void);
	HIDESBASE void __fastcall SetItem(int Index, TcxGridBand* Value);
	void __fastcall AddItem(TcxGridBand* AItem);
	HIDESBASE void __fastcall RemoveItem(TcxGridBand* AItem);
	void __fastcall RefreshVisibleItemsList(void);
	
protected:
	HRESULT __stdcall QueryInterface(const GUID &IID, /* out */ void *Obj);
	int __stdcall _AddRef(void);
	int __stdcall _Release(void);
	virtual AnsiString __fastcall GetObjectName();
	virtual bool __fastcall GetProperties(Classes::TStrings* AProperties);
	virtual void __fastcall GetPropertyValue(const AnsiString AName, Variant &AValue);
	virtual void __fastcall SetPropertyValue(const AnsiString AName, const Variant &AValue);
	virtual System::TObject* __fastcall CreateChild(const AnsiString AObjectName, const AnsiString AClassName);
	virtual void __fastcall DeleteChild(const AnsiString AObjectName, System::TObject* AObject);
	virtual void __fastcall GetChildren(Classes::TStringList* AChildren);
	virtual TMetaClass* __fastcall GetBandClass(void);
	
public:
	__fastcall virtual TcxGridBands(TcxGridBandedTableView* AGridView);
	__fastcall virtual ~TcxGridBands(void);
	HIDESBASE TcxGridBand* __fastcall Add(void);
	int __fastcall GetFirstVisibleIndex(TcxGridBandFixedKind AFixedKind);
	int __fastcall GetLastVisibleIndex(TcxGridBandFixedKind AFixedKind);
	__property TcxGridBand* FirstVisibleNonEmpty = {read=GetFirstVisibleNonEmpty};
	__property TcxGridBandedTableView* GridView = {read=FGridView};
	__property TcxGridBand* Items[int Index] = {read=GetItem, write=SetItem/*, default*/};
	__property TcxGridBandsLayout Layout = {read=GetLayout, nodefault};
	__property TcxGridBand* LastVisibleNonEmpty = {read=GetLastVisibleNonEmpty};
	__property int VisibleCount = {read=GetVisibleCount, nodefault};
	__property TcxGridBand* VisibleItems[int Index] = {read=GetVisibleItem};
	__property int VisibleLeftFixedCount = {read=FVisibleLeftFixedCount, nodefault};
	__property int VisibleRightFixedCount = {read=FVisibleRightFixedCount, nodefault};
	__property int VisibleRowCount = {read=GetVisibleRowCount, nodefault};
private:
	void *__IcxStoredObject;	/* Cxstorage::IcxStoredObject */
	void *__IcxStoredParent;	/* Cxstorage::IcxStoredParent */
	
public:
	operator IcxStoredParent*(void) { return (IcxStoredParent*)&__IcxStoredParent; }
	operator IcxStoredObject*(void) { return (IcxStoredObject*)&__IcxStoredObject; }
	
};


class DELPHICLASS TcxGridBandedTableBackgroundBitmaps;
class PASCALIMPLEMENTATION TcxGridBandedTableBackgroundBitmaps : public Cxgridtableview::TcxGridTableBackgroundBitmaps 
{
	typedef Cxgridtableview::TcxGridTableBackgroundBitmaps inherited;
	
protected:
	virtual int __fastcall GetBitmapStyleIndex(int Index);
	
public:
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	
__published:
	__property Graphics::TBitmap* BandBackground = {read=GetValue, write=SetValue, index=9};
	__property Graphics::TBitmap* BandHeader = {read=GetValue, write=SetValue, index=10};
public:
	#pragma option push -w-inl
	/* TcxCustomGridBackgroundBitmaps.Create */ inline __fastcall virtual TcxGridBandedTableBackgroundBitmaps(Cxgridcustomview::TcxCustomGridView* AGridView) : Cxgridtableview::TcxGridTableBackgroundBitmaps(AGridView) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomGridBackgroundBitmaps.Destroy */ inline __fastcall virtual ~TcxGridBandedTableBackgroundBitmaps(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridBandedTableOptionsCustomize;
class PASCALIMPLEMENTATION TcxGridBandedTableOptionsCustomize : public Cxgridtableview::TcxGridTableOptionsCustomize 
{
	typedef Cxgridtableview::TcxGridTableOptionsCustomize inherited;
	
private:
	bool FBandHiding;
	bool FBandMoving;
	bool FBandSizing;
	bool FColumnVertSizing;
	void __fastcall SetColumnVertSizing(bool Value);
	
public:
	__fastcall virtual TcxGridBandedTableOptionsCustomize(Cxgridcustomview::TcxCustomGridView* AGridView);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	
__published:
	__property bool BandHiding = {read=FBandHiding, write=FBandHiding, default=0};
	__property bool BandMoving = {read=FBandMoving, write=FBandMoving, default=1};
	__property bool BandSizing = {read=FBandSizing, write=FBandSizing, default=1};
	__property bool ColumnVertSizing = {read=FColumnVertSizing, write=SetColumnVertSizing, default=1};
public:
	#pragma option push -w-inl
	/* TcxCustomGridOptions.Destroy */ inline __fastcall virtual ~TcxGridBandedTableOptionsCustomize(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridBandedTableOptionsView;
class PASCALIMPLEMENTATION TcxGridBandedTableOptionsView : public Cxgridtableview::TcxGridTableOptionsView 
{
	typedef Cxgridtableview::TcxGridTableOptionsView inherited;
	
private:
	bool FBandHeaderEndEllipsis;
	int FBandHeaderHeight;
	int FBandHeaderLineCount;
	bool FBandHeaders;
	Graphics::TColor FFixedBandSeparatorColor;
	int FFixedBandSeparatorWidth;
	void __fastcall SetBandHeaderEndEllipsis(bool Value);
	void __fastcall SetBandHeaderHeight(int Value);
	void __fastcall SetBandHeaderLineCount(int Value);
	void __fastcall SetBandHeaders(bool Value);
	void __fastcall SetFixedBandSeparatorColor(Graphics::TColor Value);
	void __fastcall SetFixedBandSeparatorWidth(int Value);
	
public:
	__fastcall virtual TcxGridBandedTableOptionsView(Cxgridcustomview::TcxCustomGridView* AGridView);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	Graphics::TColor __fastcall GetFixedBandSeparatorColor(void);
	
__published:
	__property bool BandHeaderEndEllipsis = {read=FBandHeaderEndEllipsis, write=SetBandHeaderEndEllipsis, default=0};
	__property int BandHeaderHeight = {read=FBandHeaderHeight, write=SetBandHeaderHeight, default=0};
	__property int BandHeaderLineCount = {read=FBandHeaderLineCount, write=SetBandHeaderLineCount, default=1};
	__property bool BandHeaders = {read=FBandHeaders, write=SetBandHeaders, default=1};
	__property Graphics::TColor FixedBandSeparatorColor = {read=FFixedBandSeparatorColor, write=SetFixedBandSeparatorColor, default=536870912};
	__property int FixedBandSeparatorWidth = {read=FFixedBandSeparatorWidth, write=SetFixedBandSeparatorWidth, default=2};
public:
	#pragma option push -w-inl
	/* TcxCustomGridOptions.Destroy */ inline __fastcall virtual ~TcxGridBandedTableOptionsView(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridBandedTableViewStyles;
class PASCALIMPLEMENTATION TcxGridBandedTableViewStyles : public Cxgridtableview::TcxGridTableViewStyles 
{
	typedef Cxgridtableview::TcxGridTableViewStyles inherited;
	
private:
	TcxGridBandGetHeaderStyle FOnGetBandHeaderStyle;
	HIDESBASE TcxGridBandedTableView* __fastcall GetGridViewValue(void);
	
protected:
	virtual void __fastcall GetDefaultViewParams(int Index, void * AData, /* out */ Cxgraphics::TcxViewParams &AParams);
	
public:
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual void __fastcall GetBandHeaderParams(TcxGridBand* ABand, /* out */ Cxgraphics::TcxViewParams &AParams);
	__property TcxGridBandedTableView* GridView = {read=GetGridViewValue};
	
__published:
	__property Cxstyles::TcxStyle* BandBackground = {read=GetValue, write=SetValue, index=15};
	__property Cxstyles::TcxStyle* BandHeader = {read=GetValue, write=SetValue, index=16};
	__property TcxGridBandGetHeaderStyle OnGetBandHeaderStyle = {read=FOnGetBandHeaderStyle, write=FOnGetBandHeaderStyle};
public:
	#pragma option push -w-inl
	/* TcxCustomStyles.Create */ inline __fastcall virtual TcxGridBandedTableViewStyles(Classes::TPersistent* AOwner) : Cxgridtableview::TcxGridTableViewStyles(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomStyles.Destroy */ inline __fastcall virtual ~TcxGridBandedTableViewStyles(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridBandedTableViewStyleSheet;
class PASCALIMPLEMENTATION TcxGridBandedTableViewStyleSheet : public Cxstyles::TcxCustomStyleSheet 
{
	typedef Cxstyles::TcxCustomStyleSheet inherited;
	
private:
	TcxGridBandedTableViewStyles* __fastcall GetStylesValue(void);
	void __fastcall SetStylesValue(TcxGridBandedTableViewStyles* Value);
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetStylesClass(TMetaClass* vmt);
	
__published:
	__property TcxGridBandedTableViewStyles* Styles = {read=GetStylesValue, write=SetStylesValue};
public:
	#pragma option push -w-inl
	/* TcxCustomStyleSheet.Create */ inline __fastcall virtual TcxGridBandedTableViewStyleSheet(Classes::TComponent* AOwner) : Cxstyles::TcxCustomStyleSheet(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomStyleSheet.Destroy */ inline __fastcall virtual ~TcxGridBandedTableViewStyleSheet(void) { }
	#pragma option pop
	
};


typedef void __fastcall (__closure *TcxGridBandCustomDrawHeaderEvent)(TcxGridBandedTableView* Sender, Cxgraphics::TcxCanvas* ACanvas, TcxGridBandHeaderViewInfo* AViewInfo, bool &ADone);

typedef void __fastcall (__closure *TcxGridBandEvent)(TcxGridBandedTableView* Sender, TcxGridBand* ABand);

class PASCALIMPLEMENTATION TcxGridBandedTableView : public Cxgridtableview::TcxGridTableView 
{
	typedef Cxgridtableview::TcxGridTableView inherited;
	
private:
	TcxGridBands* FBands;
	TcxGridBandEvent FOnBandPosChanged;
	TcxGridBandEvent FOnBandSizeChanged;
	TcxGridBandCustomDrawHeaderEvent FOnCustomDrawBandHeader;
	HIDESBASE TcxGridBandedTableBackgroundBitmaps* __fastcall GetBackgroundBitmaps(void);
	HIDESBASE TcxGridBandedColumn* __fastcall GetColumn(int Index);
	HIDESBASE TcxGridBandedTableController* __fastcall GetController(void);
	HIDESBASE TcxGridBandedColumn* __fastcall GetGroupedColumn(int Index);
	HIDESBASE TcxGridBandedTableOptionsCustomize* __fastcall GetOptionsCustomize(void);
	HIDESBASE TcxGridBandedTableOptionsView* __fastcall GetOptionsView(void);
	HIDESBASE TcxGridBandedTableViewStyles* __fastcall GetStyles(void);
	HIDESBASE TcxGridBandedTableViewInfo* __fastcall GetViewInfo(void);
	HIDESBASE TcxGridBandedColumn* __fastcall GetVisibleColumn(int Index);
	HIDESBASE void __fastcall SetBackgroundBitmaps(TcxGridBandedTableBackgroundBitmaps* Value);
	void __fastcall SetBands(TcxGridBands* Value);
	HIDESBASE void __fastcall SetColumn(int Index, TcxGridBandedColumn* Value);
	HIDESBASE void __fastcall SetOptionsCustomize(TcxGridBandedTableOptionsCustomize* Value);
	HIDESBASE void __fastcall SetOptionsView(TcxGridBandedTableOptionsView* Value);
	HIDESBASE void __fastcall SetStyles(TcxGridBandedTableViewStyles* Value);
	
protected:
	virtual void __fastcall GetStoredChildren(Classes::TStringList* AChildren);
	DYNAMIC void __fastcall Updated(void);
	DYNAMIC void __fastcall Updating(void);
	virtual void __fastcall DoAssign(Cxgridcustomview::TcxCustomGridView* ASource);
	virtual void __fastcall GetFakeComponentLinks(Classes::TList* AList);
	bool __fastcall HasCustomDrawBandHeader(void);
	virtual void __fastcall CreateOptions(void);
	virtual void __fastcall DestroyOptions(void);
	virtual void __fastcall AddItem(Cxgridcustomtableview::TcxCustomGridTableItem* AItem);
	void __fastcall AssignColumnParams(void);
	virtual void __fastcall ItemVisibilityChanged(Cxgridcustomtableview::TcxCustomGridTableItem* AItem, bool Value);
	virtual void __fastcall LoadingComplete(void);
	virtual void __fastcall RefreshVisibleItemsList(void);
	virtual TMetaClass* __fastcall GetBackgroundBitmapsClass(void);
	virtual TMetaClass* __fastcall GetBandsClass(void);
	virtual TMetaClass* __fastcall GetControllerClass(void);
	virtual TMetaClass* __fastcall GetItemClass(void);
	virtual TMetaClass* __fastcall GetOptionsCustomizeClass(void);
	virtual TMetaClass* __fastcall GetOptionsViewClass(void);
	virtual TMetaClass* __fastcall GetPainterClass(void);
	virtual TMetaClass* __fastcall GetStylesClass(void);
	virtual TMetaClass* __fastcall GetViewInfoClass(void);
	virtual void __fastcall DoBandPosChanged(TcxGridBand* ABand);
	virtual void __fastcall DoBandSizeChanged(TcxGridBand* ABand);
	virtual void __fastcall DoCustomDrawBandHeader(Cxgraphics::TcxCanvas* ACanvas, TcxGridBandHeaderViewInfo* AViewInfo, bool &ADone);
	
public:
	__fastcall virtual TcxGridBandedTableView(Classes::TComponent* AOwner);
	HIDESBASE TcxGridBandedColumn* __fastcall CreateColumn(void);
	__property TcxGridBandedColumn* Columns[int Index] = {read=GetColumn, write=SetColumn};
	__property TcxGridBandedTableController* Controller = {read=GetController};
	__property TcxGridBandedColumn* GroupedColumns[int Index] = {read=GetGroupedColumn};
	__property TcxGridBandedTableViewInfo* ViewInfo = {read=GetViewInfo};
	__property TcxGridBandedColumn* VisibleColumns[int Index] = {read=GetVisibleColumn};
	
__published:
	__property TcxGridBandedTableBackgroundBitmaps* BackgroundBitmaps = {read=GetBackgroundBitmaps, write=SetBackgroundBitmaps};
	__property TcxGridBands* Bands = {read=FBands, write=SetBands};
	__property TcxGridBandedTableOptionsCustomize* OptionsCustomize = {read=GetOptionsCustomize, write=SetOptionsCustomize};
	__property TcxGridBandedTableOptionsView* OptionsView = {read=GetOptionsView, write=SetOptionsView};
	__property TcxGridBandedTableViewStyles* Styles = {read=GetStyles, write=SetStyles};
	__property TcxGridBandEvent OnBandPosChanged = {read=FOnBandPosChanged, write=FOnBandPosChanged};
	__property TcxGridBandEvent OnBandSizeChanged = {read=FOnBandSizeChanged, write=FOnBandSizeChanged};
	__property TcxGridBandCustomDrawHeaderEvent OnCustomDrawBandHeader = {read=FOnCustomDrawBandHeader, write=FOnCustomDrawBandHeader};
public:
	#pragma option push -w-inl
	/* TcxGridTableView.Destroy */ inline __fastcall virtual ~TcxGridBandedTableView(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxControlChildComponent.CreateEx */ inline __fastcall TcxGridBandedTableView(Cxcontrols::TcxControl* AControl, bool AAssignOwner) : Cxgridtableview::TcxGridTableView(AControl, AAssignOwner) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
static const Shortint cxGridDefaultFixedBandSeparatorWidth = 0x2;
static const Shortint cxGridDefaultEmptyBandWidth = 0x32;
static const Byte htBandedGridBase = 0xfa;
static const Byte htColumnHeaderVertSizingEdge = 0xfb;
static const Byte htBand = 0xfc;
static const Byte htBandHeader = 0xfd;
static const Byte htBandHeaderSizingEdge = 0xfe;
static const Shortint bbBandedTableFirst = 0x9;
static const Shortint bbBandBackground = 0x9;
static const Shortint bbBandHeader = 0xa;
static const Shortint bbBandedTableLast = 0xa;
static const Shortint bsFirst = 0x0;
static const Shortint bsBackground = 0x0;
static const Shortint bsContent = 0x1;
static const Shortint bsHeader = 0x2;
static const Shortint bsLast = 0x2;
static const Shortint vsBandedTableFirst = 0xf;
static const Shortint vsBandBackground = 0xf;
static const Shortint vsBandHeader = 0x10;
static const Shortint vsBandedTableLast = 0x10;

}	/* namespace Cxgridbandedtableview */
using namespace Cxgridbandedtableview;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxGridBandedTableView
