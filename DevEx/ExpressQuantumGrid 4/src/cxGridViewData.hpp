// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxGridViewData.pas' rev: 6.00

#ifndef cxGridViewDataHPP
#define cxGridViewDataHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxClasses.hpp>	// Pascal unit
#include <cxCustomData.hpp>	// Pascal unit
#include <cxDataStorage.hpp>	// Pascal unit
#include <cxGridLevel.hpp>	// Pascal unit
#include <cxGridCustomTableView.hpp>	// Pascal unit
#include <cxGridCustomView.hpp>	// Pascal unit
#include <cxGrid.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxgridviewdata
{
//-- type declarations -------------------------------------------------------
typedef TMetaClass*TcxCustomGridRowClass;

class DELPHICLASS TcxCustomGridRow;
class DELPHICLASS TcxGridViewData;
class PASCALIMPLEMENTATION TcxCustomGridRow : public Cxgridcustomtableview::TcxCustomGridRecord 
{
	typedef Cxgridcustomtableview::TcxCustomGridRecord inherited;
	
private:
	bool __fastcall GetIsNewItemRow(void);
	TcxGridViewData* __fastcall GetViewData(void);
	
public:
	virtual bool __fastcall ExpandOnDblClick(void);
	__property bool IsNewItemRow = {read=GetIsNewItemRow, nodefault};
	__property TcxGridViewData* ViewData = {read=GetViewData};
public:
	#pragma option push -w-inl
	/* TcxCustomGridRecord.Create */ inline __fastcall virtual TcxCustomGridRow(Cxgridcustomtableview::TcxCustomGridTableViewData* AViewData, int AIndex, const Cxcustomdata::TcxRowInfo &ARecordInfo) : Cxgridcustomtableview::TcxCustomGridRecord(AViewData, AIndex, ARecordInfo) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomGridRecord.Destroy */ inline __fastcall virtual ~TcxCustomGridRow(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridDataRow;
class PASCALIMPLEMENTATION TcxGridDataRow : public TcxCustomGridRow 
{
	typedef TcxCustomGridRow inherited;
	
protected:
	virtual bool __fastcall GetHasCells(void);
	virtual TMetaClass* __fastcall GetViewInfoClass(void);
public:
	#pragma option push -w-inl
	/* TcxCustomGridRecord.Create */ inline __fastcall virtual TcxGridDataRow(Cxgridcustomtableview::TcxCustomGridTableViewData* AViewData, int AIndex, const Cxcustomdata::TcxRowInfo &ARecordInfo) : TcxCustomGridRow(AViewData, AIndex, ARecordInfo) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomGridRecord.Destroy */ inline __fastcall virtual ~TcxGridDataRow(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxGridNewItemRowClass;

class DELPHICLASS TcxGridNewItemRow;
class PASCALIMPLEMENTATION TcxGridNewItemRow : public TcxGridDataRow 
{
	typedef TcxGridDataRow inherited;
	
public:
	#pragma option push -w-inl
	/* TcxCustomGridRecord.Create */ inline __fastcall virtual TcxGridNewItemRow(Cxgridcustomtableview::TcxCustomGridTableViewData* AViewData, int AIndex, const Cxcustomdata::TcxRowInfo &ARecordInfo) : TcxGridDataRow(AViewData, AIndex, ARecordInfo) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomGridRecord.Destroy */ inline __fastcall virtual ~TcxGridNewItemRow(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridMasterDataRow;
class PASCALIMPLEMENTATION TcxGridMasterDataRow : public TcxGridDataRow 
{
	typedef TcxGridDataRow inherited;
	
private:
	Cxgridcustomview::TcxCustomGridView* __fastcall GetActiveDetailGridView(void);
	bool __fastcall GetActiveDetailGridViewExists(void);
	int __fastcall GetActiveDetailIndex(void);
	Cxgridlevel::TcxGridLevel* __fastcall GetActiveDetailLevel(void);
	Cxgridcustomview::TcxCustomGridView* __fastcall GetDetailGridView(int Index);
	int __fastcall GetDetailGridViewCount(void);
	int __fastcall GetInternalActiveDetailIndex(void);
	void __fastcall SetActiveDetailIndex(int Value);
	
protected:
	virtual void __fastcall DoCollapse(bool ARecurse);
	virtual void __fastcall DoExpand(bool ARecurse);
	virtual bool __fastcall GetExpandable(void);
	virtual bool __fastcall GetExpanded(void);
	virtual bool __fastcall GetHasChildren(void);
	virtual TMetaClass* __fastcall GetViewInfoClass(void);
	__property int InternalActiveDetailIndex = {read=GetInternalActiveDetailIndex, nodefault};
	
public:
	virtual bool __fastcall ExpandOnDblClick(void);
	virtual Cxgridcustomtableview::TcxCustomGridRecord* __fastcall GetFirstFocusableChild(void);
	virtual Cxgridcustomtableview::TcxCustomGridRecord* __fastcall GetLastFocusableChild(bool ARecursive);
	__property Cxgridcustomview::TcxCustomGridView* ActiveDetailGridView = {read=GetActiveDetailGridView};
	__property bool ActiveDetailGridViewExists = {read=GetActiveDetailGridViewExists, nodefault};
	__property int ActiveDetailIndex = {read=GetActiveDetailIndex, write=SetActiveDetailIndex, nodefault};
	__property Cxgridlevel::TcxGridLevel* ActiveDetailLevel = {read=GetActiveDetailLevel};
	__property int DetailGridViewCount = {read=GetDetailGridViewCount, nodefault};
	__property Cxgridcustomview::TcxCustomGridView* DetailGridViews[int Index] = {read=GetDetailGridView};
	__property bool HasChildren = {read=GetHasChildren, nodefault};
public:
	#pragma option push -w-inl
	/* TcxCustomGridRecord.Create */ inline __fastcall virtual TcxGridMasterDataRow(Cxgridcustomtableview::TcxCustomGridTableViewData* AViewData, int AIndex, const Cxcustomdata::TcxRowInfo &ARecordInfo) : TcxGridDataRow(AViewData, AIndex, ARecordInfo) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomGridRecord.Destroy */ inline __fastcall virtual ~TcxGridMasterDataRow(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridGroupRow;
class PASCALIMPLEMENTATION TcxGridGroupRow : public TcxCustomGridRow 
{
	typedef TcxCustomGridRow inherited;
	
protected:
	virtual void __fastcall DoCollapse(bool ARecurse);
	virtual void __fastcall DoExpand(bool ARecurse);
	virtual bool __fastcall GetDestroyingOnExpanding(void);
	virtual bool __fastcall GetExpandable(void);
	virtual bool __fastcall GetExpanded(void);
	HIDESBASE AnsiString __fastcall GetDisplayText();
	virtual bool __fastcall GetIsData(void);
	virtual bool __fastcall GetIsParent(void);
	HIDESBASE Variant __fastcall GetValue();
	virtual TMetaClass* __fastcall GetViewInfoClass(void);
	
public:
	DYNAMIC void __fastcall KeyDown(Word &Key, Classes::TShiftState Shift);
	__property AnsiString DisplayText = {read=GetDisplayText};
	__property Variant Value = {read=GetValue};
public:
	#pragma option push -w-inl
	/* TcxCustomGridRecord.Create */ inline __fastcall virtual TcxGridGroupRow(Cxgridcustomtableview::TcxCustomGridTableViewData* AViewData, int AIndex, const Cxcustomdata::TcxRowInfo &ARecordInfo) : TcxCustomGridRow(AViewData, AIndex, ARecordInfo) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomGridRecord.Destroy */ inline __fastcall virtual ~TcxGridGroupRow(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxGridViewData : public Cxgridcustomtableview::TcxCustomGridTableViewData 
{
	typedef Cxgridcustomtableview::TcxCustomGridTableViewData inherited;
	
private:
	TcxGridNewItemRow* __fastcall GetNewItemRow(void);
	TcxCustomGridRow* __fastcall GetRow(int Index);
	int __fastcall GetRowCount(void);
	
protected:
	virtual TMetaClass* __fastcall GetNewItemRecordClass(void);
	virtual TMetaClass* __fastcall GetRecordClass(const Cxcustomdata::TcxRowInfo &ARecordInfo);
	
public:
	virtual bool __fastcall HasNewItemRecord(void);
	__property TcxGridNewItemRow* NewItemRow = {read=GetNewItemRow};
	__property int RowCount = {read=GetRowCount, nodefault};
	__property TcxCustomGridRow* Rows[int Index] = {read=GetRow};
public:
	#pragma option push -w-inl
	/* TcxCustomGridTableViewData.Create */ inline __fastcall virtual TcxGridViewData(Cxgridcustomview::TcxCustomGridView* AGridView) : Cxgridcustomtableview::TcxCustomGridTableViewData(AGridView) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomGridTableViewData.Destroy */ inline __fastcall virtual ~TcxGridViewData(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxgridviewdata */
using namespace Cxgridviewdata;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxGridViewData
