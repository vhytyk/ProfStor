// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxCustomData.pas' rev: 6.00

#ifndef cxCustomDataHPP
#define cxCustomDataHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxFilter.hpp>	// Pascal unit
#include <cxDataStorage.hpp>	// Pascal unit
#include <cxDataUtils.hpp>	// Pascal unit
#include <cxVariants.hpp>	// Pascal unit
#include <Variants.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxcustomdata
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS EcxInvalidDataControllerOperation;
class PASCALIMPLEMENTATION EcxInvalidDataControllerOperation : public Sysutils::Exception 
{
	typedef Sysutils::Exception inherited;
	
public:
	#pragma option push -w-inl
	/* Exception.Create */ inline __fastcall EcxInvalidDataControllerOperation(const AnsiString Msg) : Sysutils::Exception(Msg) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateFmt */ inline __fastcall EcxInvalidDataControllerOperation(const AnsiString Msg, const System::TVarRec * Args, const int Args_Size) : Sysutils::Exception(Msg, Args, Args_Size) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateRes */ inline __fastcall EcxInvalidDataControllerOperation(int Ident)/* overload */ : Sysutils::Exception(Ident) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResFmt */ inline __fastcall EcxInvalidDataControllerOperation(int Ident, const System::TVarRec * Args, const int Args_Size)/* overload */ : Sysutils::Exception(Ident, Args, Args_Size) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateHelp */ inline __fastcall EcxInvalidDataControllerOperation(const AnsiString Msg, int AHelpContext) : Sysutils::Exception(Msg, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateFmtHelp */ inline __fastcall EcxInvalidDataControllerOperation(const AnsiString Msg, const System::TVarRec * Args, const int Args_Size, int AHelpContext) : Sysutils::Exception(Msg, Args, Args_Size, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResHelp */ inline __fastcall EcxInvalidDataControllerOperation(int Ident, int AHelpContext)/* overload */ : Sysutils::Exception(Ident, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResFmtHelp */ inline __fastcall EcxInvalidDataControllerOperation(System::PResStringRec ResStringRec, const System::TVarRec * Args, const int Args_Size, int AHelpContext)/* overload */ : Sysutils::Exception(ResStringRec, Args, Args_Size, AHelpContext) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~EcxInvalidDataControllerOperation(void) { }
	#pragma option pop
	
};


typedef void *TcxDataRecordHandle;

typedef void *TcxDataItemHandle;

class DELPHICLASS TcxCustomDataSource;
class DELPHICLASS TcxCustomDataProvider;
class DELPHICLASS TcxCustomDataController;
#pragma option push -b-
enum TcxDataControllerChange { dccLayout, dccData, dccFocus, dccSelection, dccDetail, dccSummary, dccSearch, dccSorting, dccGrouping, dccSyncMasterPost, dccBookmark, dccUpdateRecord };
#pragma option pop

typedef Set<TcxDataControllerChange, dccLayout, dccUpdateRecord>  TcxDataControllerChanges;

class DELPHICLASS TcxCustomDataControllerInfo;
#pragma option push -b-
enum TcxDataControllerInfoChange { dcicLoad, dcicGrouping, dcicSorting, dcicFocusedRow, dcicView, dcicExpanding, dcicResetFocusedRow, dcicSelection, dcicSummary, dcicFocusedRecord };
#pragma option pop

typedef Set<TcxDataControllerInfoChange, dcicLoad, dcicFocusedRecord>  TcxDataControllerInfoChanges;

class DELPHICLASS TcxDataGroups;
class DELPHICLASS TcxCustomDataField;
struct TcxDataGroupInfo;
typedef TcxDataGroupInfo *PcxDataGroupInfo;

struct TcxGroupsRowInfo;
class PASCALIMPLEMENTATION TcxDataGroups : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	PcxDataGroupInfo operator[](int Index) { return Items[Index]; }
	
private:
	Classes::TList* FFields;
	Classes::TList* FItems;
	TcxCustomDataField* __fastcall GetField(int Index);
	int __fastcall GetFieldCount(void);
	PcxDataGroupInfo __fastcall GetItem(int Index);
	int __fastcall GetItemCount(void);
	int __fastcall GetRowCount(void);
	TcxGroupsRowInfo __fastcall GetRowInfo(int ARowIndex);
	PcxDataGroupInfo __fastcall GetTopVisibleItem(int ARowIndex, int &ACurIndex);
	void __fastcall Rebuild(void);
	
protected:
	void __fastcall Add(const TcxDataGroupInfo &ADataGroupInfo);
	void __fastcall AddField(TcxCustomDataField* AField);
	PcxDataGroupInfo __fastcall AddEmpty(void);
	void __fastcall Clear(void);
	int __fastcall Find(int ARowIndex, PcxDataGroupInfo &PItem);
	int __fastcall FindByIndex(int ARecordListIndex, int ALevel);
	bool __fastcall IsVisible(int AIndex);
	bool __fastcall MakeVisible(int AIndex, bool AExpand);
	__property int Count = {read=GetItemCount, nodefault};
	__property int FieldCount = {read=GetFieldCount, nodefault};
	__property TcxCustomDataField* Fields[int Index] = {read=GetField};
	__property PcxDataGroupInfo Items[int Index] = {read=GetItem/*, default*/};
	__property int LevelCount = {read=GetFieldCount, nodefault};
	
public:
	__fastcall TcxDataGroups(void);
	__fastcall virtual ~TcxDataGroups(void);
	void __fastcall ChangeExpanding(int ARowIndex, bool AExpanded, bool ARecursive);
	void __fastcall FullExpanding(bool AExpanded);
	int __fastcall GetChildCount(int AIndex);
	int __fastcall GetChildIndex(int AParentIndex, int AIndex);
	int __fastcall GetChildRecordListIndex(int AParentIndex, int AIndex);
	int __fastcall GetFirstLevelCount(void);
	int __fastcall GetFirstLevelIndex(int AIndex);
	int __fastcall GetIndexByRowIndex(int ARowIndex);
	int __fastcall GetIndexByRowIndexLevel(int ARowIndex, int ALevel);
	int __fastcall GetLevel(int AIndex);
	int __fastcall GetParentIndex(int AChildIndex);
	__property TcxGroupsRowInfo RowInfo[int RowIndex] = {read=GetRowInfo};
	__property int RowCount = {read=GetRowCount, nodefault};
};


class DELPHICLASS TcxDataExpandingInfos;
#pragma option push -b-
enum TcxDataExpandingInfoState { eisExpanded, eisSelected };
#pragma option pop

typedef Set<TcxDataExpandingInfoState, eisExpanded, eisSelected>  TcxDataExpandingInfoStateSet;

struct TcxDataExpandingInfo;
typedef TcxDataExpandingInfo *PcxDataExpandingInfo;

class PASCALIMPLEMENTATION TcxDataExpandingInfos : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	PcxDataExpandingInfo operator[](int Index) { return Items[Index]; }
	
private:
	Classes::TList* FFields;
	Classes::TList* FItems;
	TcxDataExpandingInfoStateSet FSaveStates;
	int __fastcall Find(TcxCustomDataField* AField);
	int __fastcall GetCount(void);
	bool __fastcall GetEmpty(void);
	TcxCustomDataField* __fastcall GetField(int Index);
	int __fastcall GetFieldCount(void);
	PcxDataExpandingInfo __fastcall GetItem(int Index);
	
protected:
	void __fastcall AddField(TcxCustomDataField* AField);
	void __fastcall AddItem(int ALevel, const Variant &AValue, TcxDataExpandingInfoStateSet AState);
	void __fastcall CheckField(TcxCustomDataField* AField);
	void __fastcall Clear(void);
	void __fastcall ClearFields(void);
	void __fastcall ClearValues(void);
	
public:
	__fastcall TcxDataExpandingInfos(void);
	__fastcall virtual ~TcxDataExpandingInfos(void);
	__property int Count = {read=GetCount, nodefault};
	__property bool Empty = {read=GetEmpty, nodefault};
	__property int FieldCount = {read=GetFieldCount, nodefault};
	__property TcxCustomDataField* Fields[int Index] = {read=GetField};
	__property PcxDataExpandingInfo Items[int Index] = {read=GetItem/*, default*/};
	__property TcxDataExpandingInfoStateSet SaveStates = {read=FSaveStates, write=FSaveStates, nodefault};
};


class DELPHICLASS TcxDataFocusingInfo;
class PASCALIMPLEMENTATION TcxDataFocusingInfo : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	bool FChangedFlag;
	TcxCustomDataControllerInfo* FDataControllerInfo;
	int FLevel;
	bool FPrevNewItemRowFocused;
	int FPrevRecordIndex;
	int FRecordIndex;
	int FRowIndex;
	
protected:
	void __fastcall Assign(TcxDataFocusingInfo* AFocusingInfo);
	void __fastcall Clear(void);
	bool __fastcall IsEqual(TcxDataFocusingInfo* AFocusingInfo);
	void __fastcall ResetPos(void);
	void __fastcall SavePos(void);
	__property int Level = {read=FLevel, write=FLevel, nodefault};
	__property int RecordIndex = {read=FRecordIndex, write=FRecordIndex, nodefault};
	__property int RowIndex = {read=FRowIndex, write=FRowIndex, nodefault};
	
public:
	__fastcall TcxDataFocusingInfo(TcxCustomDataControllerInfo* ADataControllerInfo);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxDataFocusingInfo(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGroupingFieldList;
class DELPHICLASS TcxSortingFieldList;
typedef void __fastcall (__closure *TcxNoParamsEvent)(void);

struct TcxDataSortInfo;
#pragma option push -b-
enum TcxDataSortOrder { soNone, soAscending, soDescending };
#pragma option pop

class PASCALIMPLEMENTATION TcxSortingFieldList : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	TcxDataSortInfo operator[](int Index) { return Items[Index]; }
	
private:
	Classes::TList* FItems;
	TcxNoParamsEvent FOnChanged;
	int __fastcall GetCount(void);
	TcxDataSortInfo __fastcall GetItem(int Index);
	
protected:
	void __fastcall Add(TcxCustomDataField* AField, TcxDataSortOrder ASortOrder);
	void __fastcall Changed(void);
	void __fastcall Delete(int Index);
	int __fastcall Find(TcxCustomDataField* AField);
	void __fastcall Insert(int Index, TcxCustomDataField* AField, TcxDataSortOrder ASortOrder);
	void __fastcall Move(int ACurIndex, int ANewIndex);
	void __fastcall Remove(TcxCustomDataField* AField);
	void __fastcall SetSortOrder(int Index, TcxDataSortOrder ASortOrder);
	
public:
	__fastcall TcxSortingFieldList(void);
	__fastcall virtual ~TcxSortingFieldList(void);
	void __fastcall AppendFrom(TcxSortingFieldList* AList);
	virtual void __fastcall ChangeSorting(TcxCustomDataField* AField, TcxDataSortOrder ASortOrder);
	void __fastcall CheckField(TcxCustomDataField* AField);
	void __fastcall Clear(void);
	int __fastcall SortIndexByField(TcxCustomDataField* AField);
	TcxDataSortOrder __fastcall SortOrderByField(TcxCustomDataField* AField);
	__property int Count = {read=GetCount, nodefault};
	__property TcxDataSortInfo Items[int Index] = {read=GetItem/*, default*/};
	__property TcxNoParamsEvent OnChanged = {read=FOnChanged, write=FOnChanged};
};


class PASCALIMPLEMENTATION TcxGroupingFieldList : public TcxSortingFieldList 
{
	typedef TcxSortingFieldList inherited;
	
public:
	void __fastcall ChangeGrouping(TcxCustomDataField* AField, int AGroupIndex);
	virtual void __fastcall ChangeSorting(TcxCustomDataField* AField, TcxDataSortOrder ASortOrder);
	int __fastcall GroupIndexByField(TcxCustomDataField* AField);
	void __fastcall UpdateSorting(TcxSortingFieldList* ASortingFieldList);
public:
	#pragma option push -w-inl
	/* TcxSortingFieldList.Create */ inline __fastcall TcxGroupingFieldList(void) : TcxSortingFieldList() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxSortingFieldList.Destroy */ inline __fastcall virtual ~TcxGroupingFieldList(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxDataSelection;
struct TcxDataSelectionInfo;
typedef TcxDataSelectionInfo *PcxDataSelectionInfo;

class PASCALIMPLEMENTATION TcxDataSelection : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	PcxDataSelectionInfo operator[](int Index) { return Items[Index]; }
	
private:
	int FAnchorRowIndex;
	TcxCustomDataController* FDataController;
	Classes::TList* FItems;
	Classes::TList* FFields;
	TcxNoParamsEvent FOnChanged;
	int __fastcall GetCount(void);
	TcxCustomDataField* __fastcall GetField(int Index);
	int __fastcall GetFieldCount(void);
	PcxDataSelectionInfo __fastcall GetItem(int Index);
	
protected:
	void __fastcall Changed(void);
	virtual void __fastcall ClearAnchor(void);
	virtual void __fastcall InternalAdd(int AIndex, int ARowIndex, int ARecordIndex, int ALevel);
	virtual void __fastcall InternalClear(void);
	virtual void __fastcall InternalDelete(int AIndex);
	virtual void __fastcall SetInternalCount(int ACount);
	
public:
	__fastcall virtual TcxDataSelection(TcxCustomDataController* ADataController);
	__fastcall virtual ~TcxDataSelection(void);
	virtual void __fastcall Add(int AIndex, int ARowIndex, int ARecordIndex, int ALevel);
	void __fastcall AddField(TcxCustomDataField* AField);
	void __fastcall Clear(void);
	void __fastcall ClearAll(void);
	void __fastcall ClearFields(void);
	void __fastcall Delete(int AIndex);
	int __fastcall FindByGroupIndex(int AGroupIndex);
	int __fastcall FindByRecordIndex(int ARecordIndex);
	virtual bool __fastcall FindByRowIndex(int ARowIndex, int &AIndex);
	bool __fastcall IsRecordSelected(int ARecordIndex);
	bool __fastcall IsRowSelected(int ARowIndex);
	void __fastcall Sort(void);
	__property int Count = {read=GetCount, nodefault};
	__property TcxCustomDataController* DataController = {read=FDataController};
	__property int FieldCount = {read=GetFieldCount, nodefault};
	__property TcxCustomDataField* Fields[int Index] = {read=GetField};
	__property PcxDataSelectionInfo Items[int Index] = {read=GetItem/*, default*/};
	__property int AnchorRowIndex = {read=FAnchorRowIndex, nodefault};
	__property TcxNoParamsEvent OnChanged = {read=FOnChanged, write=FOnChanged};
};


struct TcxRowInfo;
class PASCALIMPLEMENTATION TcxCustomDataControllerInfo : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	TcxDataControllerInfoChanges FChanges;
	TcxCustomDataController* FDataController;
	TcxDataGroups* FDataGroups;
	TcxDataExpandingInfos* FExpandingInfo;
	bool FExpandingFlag;
	bool FFocusingFlag;
	TcxDataFocusingInfo* FFocusingInfo;
	TcxGroupingFieldList* FGroupingFieldList;
	int FLockCount;
	TcxDataFocusingInfo* FPrevFocusingInfo;
	Classes::TList* FRecordList;
	TcxDataSelection* FSelection;
	TcxSortingFieldList* FSortingFieldList;
	TcxSortingFieldList* FTotalSortingFieldList;
	void __fastcall CheckAfterCollapsing(void);
	void __fastcall CheckExpanding(void);
	void __fastcall CheckFocusing(void);
	void __fastcall CheckInfo(void);
	void __fastcall ClearInfo(void);
	int __fastcall CompareGroupRecords(int ARecordIndex1, int ARecordIndex2, int AIndex);
	int __fastcall CompareRecords(void * ARecord1, void * ARecord2);
	int __fastcall GetFocusedRecordIndex(void);
	int __fastcall GetFocusedRowIndex(void);
	bool __fastcall GetNewItemRowFocusingChanged(void);
	int __fastcall GetPrevFocusedRecordIndex(void);
	int __fastcall GetPrevFocusedRowIndex(void);
	void __fastcall QuickSortRecords(Classes::PPointerList ASortList, int L, int R);
	void __fastcall RecalcSelection(void);
	void __fastcall SaveInfo(void);
	void __fastcall SetFocusedRowIndex(int Value);
	
protected:
	bool __fastcall CanFocusedRowChanging(int ARowIndex);
	void __fastcall CheckChanges(void);
	void __fastcall CheckRowIndex(int ARowIndex);
	void __fastcall DoChangeFocusedRow(int AValue, bool AIsInternal);
	void __fastcall DoFilter(void);
	void __fastcall DoGrouping(void);
	void __fastcall DoLoad(void);
	void __fastcall DoSort(void);
	void __fastcall DoSummary(void);
	int __fastcall FindDataGroup(int ARecordListIndex);
	int __fastcall FindFocusedRow(bool ANearest);
	void __fastcall ForwardChanges(void);
	int __fastcall GetInternalRecordCount(void);
	int __fastcall GetInternalRecordIndex(int ARecordListIndex);
	int __fastcall GetInternalRecordListIndex(int ARecordIndex);
	bool __fastcall IsGrouped(void);
	int __fastcall LocateGroupByLevel(int AGroupIndex, int ALevel);
	int __fastcall LocateDetail(int AGroupIndex, int ARecordListIndex, bool AMakeVisible);
	void __fastcall PrepareSorting(void);
	void __fastcall ResetFocusing(void);
	void __fastcall SaveExpanding(TcxDataExpandingInfoStateSet ASaveStates);
	virtual void __fastcall TruncateSelection(void);
	void __fastcall UnprepareSorting(void);
	virtual void __fastcall Update(void);
	__property TcxCustomDataController* DataController = {read=FDataController};
	__property TcxDataGroups* DataGroups = {read=FDataGroups};
	__property TcxGroupingFieldList* GroupingFieldList = {read=FGroupingFieldList};
	__property TcxDataSelection* Selection = {read=FSelection};
	__property TcxSortingFieldList* SortingFieldList = {read=FSortingFieldList};
	__property TcxSortingFieldList* TotalSortingFieldList = {read=FTotalSortingFieldList};
	
public:
	__fastcall virtual TcxCustomDataControllerInfo(TcxCustomDataController* ADataController);
	__fastcall virtual ~TcxCustomDataControllerInfo(void);
	void __fastcall BeginUpdate(void);
	void __fastcall EndUpdate(void);
	void __fastcall Refresh(void);
	void __fastcall RefreshFocused(void);
	void __fastcall RefreshSummary(bool ARedrawOnly);
	void __fastcall ExpandingChanged(void);
	void __fastcall FocusedRecordChanged(bool AChangedFlag);
	void __fastcall GroupingChanged(void);
	void __fastcall SelectionChanged(void);
	void __fastcall SortingChanged(void);
	void __fastcall RemoveField(TcxCustomDataField* AField);
	void __fastcall UpdateField(TcxCustomDataField* AField);
	void __fastcall ChangeSortIndex(TcxCustomDataField* AField, int ASortIndex);
	void __fastcall ChangeSorting(TcxCustomDataField* AField, TcxDataSortOrder ASortOrder);
	void __fastcall ClearSorting(bool AKeepGroupedItems);
	void __fastcall ChangeExpanding(int ARowIndex, bool AExpanded, bool ARecursive);
	void __fastcall ChangeGrouping(TcxCustomDataField* AField, int AGroupIndex);
	void __fastcall ClearGrouping(void);
	void __fastcall FullCollapse(void);
	void __fastcall FullExpand(void);
	int __fastcall GetRowCount(void);
	int __fastcall GetRowIndexByRecordIndex(int ARecordIndex, bool AMakeVisible);
	TcxRowInfo __fastcall GetRowInfo(int ARowIndex);
	void __fastcall ChangeRowSelection(int ARowIndex, bool ASelection);
	void __fastcall ClearSelection(void);
	void __fastcall ClearSelectionAnchor(void);
	int __fastcall GetSelectedCount(void);
	int __fastcall GetSelectedRowIndex(int Index);
	bool __fastcall IsRowSelected(int ARowIndex);
	__property int FocusedRecordIndex = {read=GetFocusedRecordIndex, nodefault};
	__property int FocusedRowIndex = {read=GetFocusedRowIndex, write=SetFocusedRowIndex, nodefault};
	__property bool NewItemRowFocusingChanged = {read=GetNewItemRowFocusingChanged, nodefault};
	__property int PrevFocusedRecordIndex = {read=GetPrevFocusedRecordIndex, nodefault};
	__property int PrevFocusedRowIndex = {read=GetPrevFocusedRowIndex, nodefault};
	__property int LockCount = {read=FLockCount, nodefault};
};


class DELPHICLASS TcxDataControllerGroups;
class PASCALIMPLEMENTATION TcxDataControllerGroups : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	TcxCustomDataController* FDataController;
	int __fastcall GetChildCount(int DataGroupIndex);
	int __fastcall GetChildDataGroupIndex(int ParentDataGroupIndex, int ChildIndex);
	int __fastcall GetChildRecordIndex(int ParentDataGroupIndex, int ChildIndex);
	TcxCustomDataControllerInfo* __fastcall GetDataControllerInfo(void);
	int __fastcall GetDataGroupIndexByRowIndex(int RowIndex);
	int __fastcall GetGroupingItemCount(void);
	int __fastcall GetGroupingItemIndex(int Index);
	int __fastcall GetItemGroupIndex(int AItemIndex);
	int __fastcall GetLevel(int ADataGroupIndex);
	int __fastcall GetParentDataGroupIndex(int ChildDataGroupIndex);
	
protected:
	__property TcxCustomDataControllerInfo* DataControllerInfo = {read=GetDataControllerInfo};
	__property int LevelCount = {read=GetGroupingItemCount, nodefault};
	
public:
	__fastcall TcxDataControllerGroups(TcxCustomDataController* ADataController);
	void __fastcall ChangeExpanding(int ARowIndex, bool AExpanded, bool ARecursive);
	void __fastcall ChangeGrouping(int AItemIndex, int AGroupIndex);
	void __fastcall ClearGrouping(void);
	void __fastcall FullCollapse(void);
	void __fastcall FullExpand(void);
	void __fastcall LoadRecordIndexes(Classes::TList* AList, int ADataGroupIndex);
	void __fastcall LoadRecordIndexesByRowIndex(Classes::TList* AList, int ARowIndex);
	__property TcxCustomDataController* DataController = {read=FDataController};
	__property int GroupingItemCount = {read=GetGroupingItemCount, nodefault};
	__property int GroupingItemIndex[int Index] = {read=GetGroupingItemIndex};
	__property int ItemGroupIndex[int ItemIndex] = {read=GetItemGroupIndex};
	__property int DataGroupIndexByRowIndex[int RowIndex] = {read=GetDataGroupIndexByRowIndex};
	__property int Level[int ADataGroupIndex] = {read=GetLevel};
	__property int ChildCount[int DataGroupIndex] = {read=GetChildCount};
	__property int ChildDataGroupIndex[int ParentDataGroupIndex][int ChildIndex] = {read=GetChildDataGroupIndex};
	__property int ChildRecordIndex[int ParentDataGroupIndex][int ChildIndex] = {read=GetChildRecordIndex};
	__property int ParentDataGroupIndex[int ChildDataGroupIndex] = {read=GetParentDataGroupIndex};
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxDataControllerGroups(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomDataFieldList;
class PASCALIMPLEMENTATION TcxCustomDataFieldList : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	TcxCustomDataField* operator[](int Index) { return Items[Index]; }
	
private:
	TcxCustomDataController* FDataController;
	bool FFieldDestroyed;
	int FInternalCount;
	Classes::TList* FItems;
	int __fastcall GetCount(void);
	TcxCustomDataField* __fastcall GetItem(int Index);
	int __fastcall GetItemCount(void);
	
protected:
	void __fastcall Add(TcxCustomDataField* AField);
	void __fastcall Clear(void);
	void __fastcall ReassignFields(TcxCustomDataField* ADestroyedField);
	void __fastcall RemoveField(TcxCustomDataField* AField);
	virtual void __fastcall RemoveNotification(Classes::TComponent* AComponent);
	void __fastcall Update(void);
	
public:
	__fastcall virtual TcxCustomDataFieldList(TcxCustomDataController* ADataController);
	__fastcall virtual ~TcxCustomDataFieldList(void);
	TcxCustomDataField* __fastcall FieldByItem(System::TObject* AItem);
	__property int Count = {read=GetCount, nodefault};
	__property TcxCustomDataController* DataController = {read=FDataController};
	__property int ItemCount = {read=GetItemCount, nodefault};
	__property TcxCustomDataField* Items[int Index] = {read=GetItem/*, default*/};
};


class DELPHICLASS TcxDataFilterCriteria;
class DELPHICLASS TcxDataFilterValueList;
typedef void __fastcall (__closure *TcxDataFilterGetValueListEvent)(Cxfilter::TcxFilterCriteria* Sender, int AItemIndex, TcxDataFilterValueList* AValueList);

class PASCALIMPLEMENTATION TcxDataFilterCriteria : public Cxfilter::TcxFilterCriteria 
{
	typedef Cxfilter::TcxFilterCriteria inherited;
	
private:
	bool FActive;
	TcxCustomDataController* FDataController;
	bool FDestroying;
	TcxDataFilterGetValueListEvent FOnGetValueList;
	void __fastcall SetActive(bool Value);
	
protected:
	virtual void __fastcall DefineProperties(Classes::TFiler* Filer);
	bool __fastcall DoFilterRecord(int ARecordIndex);
	virtual int __fastcall GetIDByItemLink(System::TObject* AItemLink);
	virtual TMetaClass* __fastcall GetItemClass(void);
	virtual System::TObject* __fastcall GetItemLinkByID(int AID);
	virtual TMetaClass* __fastcall GetValueListClass(void);
	virtual void __fastcall Update(void);
	__property bool Destroying = {read=FDestroying, nodefault};
	
public:
	__fastcall virtual TcxDataFilterCriteria(TcxCustomDataController* ADataController);
	__fastcall virtual ~TcxDataFilterCriteria(void);
	virtual Cxfilter::TcxFilterCriteriaItem* __fastcall AddItem(Cxfilter::TcxFilterCriteriaItemList* AParent, System::TObject* AItemLink, Cxfilter::TcxFilterOperatorKind AOperatorKind, const Variant &AValue, const AnsiString ADisplayValue);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual void __fastcall AssignEvents(Classes::TPersistent* Source);
	virtual TcxDataFilterValueList* __fastcall CreateValueList(void);
	virtual Cxfilter::TcxFilterCriteriaItem* __fastcall FindItemByItemLink(System::TObject* AItemLink);
	virtual bool __fastcall IsFiltering(void);
	void __fastcall RemoveItemByField(TcxCustomDataField* AField);
	__property TcxCustomDataController* DataController = {read=FDataController};
	
__published:
	__property bool Active = {read=FActive, write=SetActive, default=0};
	__property TcxDataFilterGetValueListEvent OnGetValueList = {read=FOnGetValueList, write=FOnGetValueList};
};


class DELPHICLASS TcxCustomDataRelation;
class DELPHICLASS TcxCustomDataRelationList;
class DELPHICLASS TcxDetailObject;
class PASCALIMPLEMENTATION TcxCustomDataRelationList : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	TcxCustomDataRelation* operator[](int Index) { return Items[Index]; }
	
private:
	TcxCustomDataController* FDataController;
	TcxCustomDataField* FDataField;
	Classes::TList* FItems;
	int FLockCount;
	void __fastcall AddItem(TcxCustomDataRelation* AItem);
	int __fastcall GetCount(void);
	TcxCustomDataRelation* __fastcall GetItem(int Index);
	void __fastcall RemoveItem(TcxCustomDataRelation* AItem);
	
protected:
	void __fastcall Changed(TcxCustomDataRelation* ARelation);
	TcxDetailObject* __fastcall GetValueAsDetailObject(int ARecordIndex);
	void __fastcall RemoveDataField(TcxCustomDataField* ADataField);
	void __fastcall Update(TcxCustomDataRelation* ARelation);
	__property TcxCustomDataController* DataController = {read=FDataController};
	__property int LockCount = {read=FLockCount, nodefault};
	
public:
	__fastcall TcxCustomDataRelationList(TcxCustomDataController* ADataController);
	__fastcall virtual ~TcxCustomDataRelationList(void);
	TcxCustomDataRelation* __fastcall Add(System::TObject* AItem);
	void __fastcall Assign(TcxCustomDataRelationList* ASource);
	void __fastcall BeginUpdate(void);
	void __fastcall Clear(void);
	bool __fastcall ClearDetailObject(int ARecordIndex, int ARelationIndex);
	void __fastcall EndUpdate(void);
	TcxCustomDataRelation* __fastcall FindByItem(System::TObject* AItem);
	TcxDetailObject* __fastcall GetDetailObject(int ARecordIndex);
	bool __fastcall IsDetailObjectExist(int ARecordIndex, int ARelationIndex);
	bool __fastcall IsEmpty(void);
	void __fastcall Move(int ACurIndex, int ANewIndex);
	void __fastcall RemoveByItem(System::TObject* AItem);
	__property int Count = {read=GetCount, nodefault};
	__property TcxCustomDataRelation* Items[int Index] = {read=GetItem/*, default*/};
};


class PASCALIMPLEMENTATION TcxCustomDataRelation : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	TcxCustomDataController* FDetailDataController;
	System::TObject* FItem;
	TcxCustomDataRelationList* FRelationList;
	TcxCustomDataController* __fastcall GetDataController(void);
	int __fastcall GetIndex(void);
	
protected:
	void __fastcall Changed(void);
	virtual void __fastcall RemoveDataField(TcxCustomDataField* ADataField);
	
public:
	__fastcall TcxCustomDataRelation(TcxCustomDataRelationList* ARelationList, System::TObject* AItem);
	__fastcall virtual ~TcxCustomDataRelation(void);
	virtual void __fastcall Assign(TcxCustomDataRelation* ASource);
	__property TcxCustomDataController* DataController = {read=GetDataController};
	__property TcxCustomDataController* DetailDataController = {read=FDetailDataController};
	__property int Index = {read=GetIndex, nodefault};
	__property System::TObject* Item = {read=FItem};
	__property TcxCustomDataRelationList* RelationList = {read=FRelationList};
};


class DELPHICLASS TcxDataControllerNotifier;
class PASCALIMPLEMENTATION TcxDataControllerNotifier : public Classes::TComponent 
{
	typedef Classes::TComponent inherited;
	
private:
	TcxCustomDataController* FDataController;
	
protected:
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	
public:
	__fastcall TcxDataControllerNotifier(Classes::TComponent* AOwner, TcxCustomDataController* ADataController);
	__property TcxCustomDataController* DataController = {read=FDataController};
public:
	#pragma option push -w-inl
	/* TComponent.Destroy */ inline __fastcall virtual ~TcxDataControllerNotifier(void) { }
	#pragma option pop
	
};


#pragma option push -b-
enum TcxDataControllerOption { dcoAnsiSort, dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoSortByDisplayText };
#pragma option pop

typedef Set<TcxDataControllerOption, dcoAnsiSort, dcoSortByDisplayText>  TcxDataControllerOptions;

#pragma pack(push, 4)
struct TcxDataSelectionChangedInfo
{
	int SelectedCount;
	int RowIndex;
} ;
#pragma pack(pop)

class DELPHICLASS TcxDataControllerSearch;
class PASCALIMPLEMENTATION TcxDataControllerSearch : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	TcxCustomDataController* FDataController;
	bool FLocked;
	int __fastcall GetItemIndex(void);
	bool __fastcall GetSearching(void);
	AnsiString __fastcall GetSearchText();
	void __fastcall SetItemIndex(const int Value);
	
protected:
	void __fastcall DoFocusedRecord(int AFilteredRecordIndex);
	int __fastcall DoSearch(int AStartFilteredRecordIndex, int AEndFilteredRecordIndex, const AnsiString ASubText, bool AForward);
	void __fastcall Lock(void);
	void __fastcall Unlock(void);
	
public:
	__fastcall TcxDataControllerSearch(TcxCustomDataController* ADataController);
	void __fastcall Cancel(void);
	bool __fastcall Locate(int AItemIndex, const AnsiString ASubText);
	bool __fastcall LocateNext(bool AForward);
	__property TcxCustomDataController* DataController = {read=FDataController};
	__property int ItemIndex = {read=GetItemIndex, write=SetItemIndex, nodefault};
	__property bool Locked = {read=FLocked, nodefault};
	__property bool Searching = {read=GetSearching, nodefault};
	__property AnsiString SearchText = {read=GetSearchText};
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxDataControllerSearch(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxDataSummary;
class DELPHICLASS TcxDataGroupSummaryItems;
class DELPHICLASS TcxDataSummaryItems;
struct TcxSummaryEventArguments;
struct TcxSummaryEventOutArguments;
typedef void __fastcall (__closure *TcxSummaryEvent)(TcxDataSummaryItems* ASender, const TcxSummaryEventArguments &Arguments, TcxSummaryEventOutArguments &OutArguments);

class DELPHICLASS TcxDataSummaryItem;
#pragma option push -b-
enum TcxSummaryPosition { spGroup, spFooter };
#pragma option pop

typedef TMetaClass*TcxDataSummaryItemClass;

#pragma option push -b-
enum TcxSummaryKind { skNone, skSum, skMin, skMax, skCount, skAverage };
#pragma option pop

class PASCALIMPLEMENTATION TcxDataSummaryItems : public Classes::TCollection 
{
	typedef Classes::TCollection inherited;
	
public:
	TcxDataSummaryItem* operator[](int Index) { return Items[Index]; }
	
private:
	TcxDataSummary* FSummary;
	TcxSummaryEvent FOnSummary;
	TcxCustomDataController* __fastcall GetDataController(void);
	HIDESBASE TcxDataSummaryItem* __fastcall GetItem(int Index);
	HIDESBASE void __fastcall SetItem(int Index, TcxDataSummaryItem* Value);
	
protected:
	void __fastcall ChangedView(void);
	virtual TcxSummaryPosition __fastcall GetItemPosition(TcxDataSummaryItem* AItem);
	DYNAMIC Classes::TPersistent* __fastcall GetOwner(void);
	int __fastcall IndexOfField(TcxCustomDataField* AField);
	virtual bool __fastcall IsPositionStored(TcxDataSummaryItem* AItem);
	TcxDataSummaryItem* __fastcall ItemOfField(TcxCustomDataField* AField);
	virtual void __fastcall Update(Classes::TCollectionItem* Item);
	
public:
	__fastcall virtual TcxDataSummaryItems(TcxDataSummary* ASummary, TMetaClass* AItemClass);
	HIDESBASE TcxDataSummaryItem* __fastcall Add(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual void __fastcall AssignEvents(Classes::TPersistent* Source);
	virtual AnsiString __fastcall DefaultFormat(Word AVarType, TcxSummaryKind ASummaryKind, bool AIsFooter);
	virtual AnsiString __fastcall GetGroupText(const Variant &ASummaryValues);
	int __fastcall IndexOfItemLink(System::TObject* AItemLink);
	TcxDataSummaryItem* __fastcall ItemOfItemLink(System::TObject* AItemLink);
	__property TcxCustomDataController* DataController = {read=GetDataController};
	__property TcxDataSummaryItem* Items[int Index] = {read=GetItem, write=SetItem/*, default*/};
	__property TcxDataSummary* Summary = {read=FSummary};
	
__published:
	__property TcxSummaryEvent OnSummary = {read=FOnSummary, write=FOnSummary};
public:
	#pragma option push -w-inl
	/* TCollection.Destroy */ inline __fastcall virtual ~TcxDataSummaryItems(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxDataGroupSummaryItems : public TcxDataSummaryItems 
{
	typedef TcxDataSummaryItems inherited;
	
private:
	AnsiString FBeginText;
	AnsiString FEndText;
	AnsiString FSeparator;
	bool __fastcall IsBeginTextStored(void);
	bool __fastcall IsEndTextStored(void);
	bool __fastcall IsSeparatorStored(void);
	void __fastcall SetBeginText(const AnsiString Value);
	void __fastcall SetEndText(const AnsiString Value);
	void __fastcall SetSeparator(const AnsiString Value);
	
public:
	__fastcall virtual TcxDataGroupSummaryItems(TcxDataSummary* ASummary, TMetaClass* AItemClass);
	virtual AnsiString __fastcall GetGroupText(const Variant &ASummaryValues);
	
__published:
	__property AnsiString BeginText = {read=FBeginText, write=SetBeginText, stored=IsBeginTextStored};
	__property AnsiString EndText = {read=FEndText, write=SetEndText, stored=IsEndTextStored};
	__property AnsiString Separator = {read=FSeparator, write=SetSeparator, stored=IsSeparatorStored};
public:
	#pragma option push -w-inl
	/* TCollection.Destroy */ inline __fastcall virtual ~TcxDataGroupSummaryItems(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxDataFooterSummaryItems;
class PASCALIMPLEMENTATION TcxDataFooterSummaryItems : public TcxDataSummaryItems 
{
	typedef TcxDataSummaryItems inherited;
	
protected:
	virtual TcxSummaryPosition __fastcall GetItemPosition(TcxDataSummaryItem* AItem);
	virtual bool __fastcall IsPositionStored(TcxDataSummaryItem* AItem);
public:
	#pragma option push -w-inl
	/* TcxDataSummaryItems.Create */ inline __fastcall virtual TcxDataFooterSummaryItems(TcxDataSummary* ASummary, TMetaClass* AItemClass) : TcxDataSummaryItems(ASummary, AItemClass) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TCollection.Destroy */ inline __fastcall virtual ~TcxDataFooterSummaryItems(void) { }
	#pragma option pop
	
};


#pragma option push -b-
enum TcxSummaryOption { soNullIgnore, soSelectedRecords };
#pragma option pop

typedef Set<TcxSummaryOption, soNullIgnore, soSelectedRecords>  TcxSummaryOptions;

class DELPHICLASS TcxDataSummaryGroups;
class DELPHICLASS TcxDataSummaryGroup;
class PASCALIMPLEMENTATION TcxDataSummaryGroups : public Classes::TCollection 
{
	typedef Classes::TCollection inherited;
	
public:
	TcxDataSummaryGroup* operator[](int Index) { return Items[Index]; }
	
private:
	TcxDataSummary* FSummary;
	HIDESBASE TcxDataSummaryGroup* __fastcall GetItem(int Index);
	HIDESBASE void __fastcall SetItem(int Index, TcxDataSummaryGroup* Value);
	
protected:
	DYNAMIC Classes::TPersistent* __fastcall GetOwner(void);
	virtual void __fastcall Update(Classes::TCollectionItem* Item);
	
public:
	__fastcall TcxDataSummaryGroups(TcxDataSummary* ASummary);
	HIDESBASE TcxDataSummaryGroup* __fastcall Add(void);
	TcxDataSummaryGroup* __fastcall FindByItemLink(System::TObject* AItemLink);
	__property TcxDataSummary* Summary = {read=FSummary};
	__property TcxDataSummaryGroup* Items[int Index] = {read=GetItem, write=SetItem/*, default*/};
public:
	#pragma option push -w-inl
	/* TCollection.Destroy */ inline __fastcall virtual ~TcxDataSummaryGroups(void) { }
	#pragma option pop
	
};


typedef void __fastcall (__closure *TcxAfterSummaryEvent)(TcxDataSummary* ASender);

typedef DynamicArray<int >  TcxDataSummaryCountValues;

typedef DynamicArray<Variant >  TcxDataSummaryValues;

typedef TMetaClass*TcxDataSummaryGroupItemLinkClass;

class PASCALIMPLEMENTATION TcxDataSummary : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	TcxCustomDataController* FDataController;
	TcxDataGroupSummaryItems* FDefaultGroupSummaryItems;
	bool FDestroying;
	TcxDataFooterSummaryItems* FFooterSummaryItems;
	Variant FFooterSummaryValues;
	bool FInAfterSummary;
	int FLockCount;
	TcxSummaryOptions FOptions;
	bool FSetCustomSummary;
	TcxDataSummaryGroups* FSummaryGroups;
	TcxAfterSummaryEvent FOnAfterSummary;
	Variant __fastcall GetFooterSummaryValue(int Index);
	AnsiString __fastcall GetFooterSummaryText(int Index);
	TcxDataGroupSummaryItems* __fastcall GetGroupSummaryItems(int Level);
	AnsiString __fastcall GetGroupSummaryText(int RowIndex);
	Variant __fastcall GetGroupSummaryDisplayValue(int RowIndex, int Level, int Index);
	Variant __fastcall GetGroupSummaryValue(int DataGroupIndex, int Index);
	int __fastcall GetGroupFooterIndexOfItemLink(int Level, System::TObject* ItemLink);
	AnsiString __fastcall GetGroupFooterSummaryText(int RowIndex, int Level, int Index);
	TcxSummaryOptions __fastcall GetOptions(void);
	void __fastcall SetDefaultGroupSummaryItems(TcxDataGroupSummaryItems* Value);
	void __fastcall SetFooterSummaryItems(TcxDataFooterSummaryItems* Value);
	void __fastcall SetFooterSummaryValue(int Index, const Variant &Value);
	void __fastcall SetGroupSummaryDisplayValue(int RowIndex, int Level, int Index, const Variant &Value);
	void __fastcall SetGroupSummaryValue(int DataGroupIndex, int Index, const Variant &Value);
	void __fastcall SetOptions(TcxSummaryOptions Value);
	void __fastcall SetSummaryGroups(TcxDataSummaryGroups* Value);
	
protected:
	virtual void __fastcall BeginCalculateSummary(TcxDataSummaryItems* ASummaryItems, TcxDataSummaryCountValues &ACountValues, TcxDataSummaryValues &ASummaryValues);
	virtual void __fastcall CalculateSummary(TcxDataSummaryItems* ASummaryItems, int ABeginIndex, int AEndIndex, TcxDataSummaryCountValues &ACountValues, TcxDataSummaryValues &ASummaryValues, Variant &SummaryValues);
	virtual void __fastcall Changed(bool ARedrawOnly);
	virtual void __fastcall DoAfterSummary(void);
	virtual void __fastcall DoFinishSummaryValue(TcxDataSummaryItem* ASummaryItem, Variant &SummaryValue, int &CountValue);
	virtual void __fastcall DoSummaryValue(TcxDataSummaryItem* ASummaryItem, int ARecordIndex, Variant &SummaryValue, int &CountValue);
	virtual void __fastcall EndCalculateSummary(TcxDataSummaryItems* ASummaryItems, TcxDataSummaryCountValues &ACountValues, TcxDataSummaryValues &ASummaryValues, Variant &SummaryValues);
	System::PVariant __fastcall GetGroupSummaryValues(int ADataGroupIndex);
	DYNAMIC Classes::TPersistent* __fastcall GetOwner(void);
	virtual int __fastcall GetRecordIndex(int ARecordListIndex);
	virtual TMetaClass* __fastcall GetSummaryGroupItemLinkClass(void);
	virtual TMetaClass* __fastcall GetSummaryItemClass(void);
	virtual bool __fastcall IsValidSummaryValuesIndex(const Variant &ASummaryValues, int AIndex);
	virtual void __fastcall Update(bool ARedrawOnly);
	__property bool Destroying = {read=FDestroying, nodefault};
	__property int LockCount = {read=FLockCount, nodefault};
	
public:
	__fastcall TcxDataSummary(TcxCustomDataController* ADataController);
	__fastcall virtual ~TcxDataSummary(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual void __fastcall AssignEvents(Classes::TPersistent* Source);
	void __fastcall BeginUpdate(void);
	virtual void __fastcall Calculate(void);
	virtual void __fastcall CalculateFooterSummary(void);
	virtual void __fastcall CalculateGroupSummary(void);
	void __fastcall CancelUpdate(void);
	void __fastcall EndUpdate(void);
	void __fastcall RemoveItemByField(TcxCustomDataField* AField);
	__property TcxCustomDataController* DataController = {read=FDataController};
	__property Variant FooterSummaryValues[int Index] = {read=GetFooterSummaryValue, write=SetFooterSummaryValue};
	__property AnsiString FooterSummaryTexts[int Index] = {read=GetFooterSummaryText};
	__property int GroupFooterIndexOfItemLink[int Level][System::TObject* ItemLink] = {read=GetGroupFooterIndexOfItemLink};
	__property TcxDataGroupSummaryItems* GroupSummaryItems[int Level] = {read=GetGroupSummaryItems};
	__property AnsiString GroupFooterSummaryTexts[int RowIndex][int Level][int Index] = {read=GetGroupFooterSummaryText};
	__property AnsiString GroupSummaryText[int RowIndex] = {read=GetGroupSummaryText};
	__property Variant GroupSummaryDisplayValues[int RowIndex][int Level][int Index] = {read=GetGroupSummaryDisplayValue, write=SetGroupSummaryDisplayValue};
	__property Variant GroupSummaryValues[int DataGroupIndex][int Index] = {read=GetGroupSummaryValue, write=SetGroupSummaryValue};
	
__published:
	__property TcxDataGroupSummaryItems* DefaultGroupSummaryItems = {read=FDefaultGroupSummaryItems, write=SetDefaultGroupSummaryItems};
	__property TcxDataFooterSummaryItems* FooterSummaryItems = {read=FFooterSummaryItems, write=SetFooterSummaryItems};
	__property TcxDataSummaryGroups* SummaryGroups = {read=FSummaryGroups, write=SetSummaryGroups};
	__property TcxSummaryOptions Options = {read=GetOptions, write=SetOptions, default=0};
	__property TcxAfterSummaryEvent OnAfterSummary = {read=FOnAfterSummary, write=FOnAfterSummary};
};


typedef void __fastcall (__closure *TcxDataControllerCompareEvent)(TcxCustomDataController* ADataController, int ARecordIndex1, int ARecordIndex2, int AItemIndex, const Variant &V1, const Variant &V2, int &Compare);

typedef void __fastcall (__closure *TcxDataRecordChangedEvent)(TcxCustomDataController* ADataController, int ARecordIndex, int AItemIndex);

class DELPHICLASS TcxUpdateControlInfo;
typedef void __fastcall (__closure *TcxUpdateControlEvent)(TcxUpdateControlInfo* AInfo);

#pragma option push -b-
enum TcxDataControllerDetailMode { dcdmNone, dcdmPattern, dcdmClone };
#pragma option pop

#pragma option push -b-
enum TcxDataChange { dcField, dcRecord, dcNew, dcDeleted, dcTotal };
#pragma option pop

#pragma pack(push, 4)
struct TcxDataChangeInfo
{
	TcxDataChange Kind;
	int ItemIndex;
	int RecordIndex;
} ;
#pragma pack(pop)

typedef TMetaClass*TcxCustomDataProviderClass;

typedef TMetaClass*TcxDataSelectionClass;

#pragma option push -b-
enum TcxDataControllerEditOperation { dceoAppend, dceoDelete, dceoEdit, dceoInsert, dceoShowEdit };
#pragma option pop

typedef Set<TcxDataControllerEditOperation, dceoAppend, dceoShowEdit>  TcxDataControllerEditOperations;

#pragma option push -b-
enum TcxDataControllerEditKind { dceInsert, dceEdit, dceChanging, dceModified };
#pragma option pop

typedef Set<TcxDataControllerEditKind, dceInsert, dceModified>  TcxDataControllerEditState;

typedef TMetaClass*TcxCustomDataFieldClass;

typedef TMetaClass*TcxDataFilterCriteriaClass;

typedef TMetaClass*TcxCustomDataRelationClass;

typedef TMetaClass*TcxDataSummaryClass;

#pragma option push -b-
enum TcxDataLayoutChange { lcStructure, lcData };
#pragma option pop

typedef Set<TcxDataLayoutChange, lcStructure, lcData>  TcxDataLayoutChanges;

typedef void __fastcall (__closure *TcxDataControllerEachDetailProc)(TcxCustomDataController* ADataController);

typedef void __fastcall (__closure *TcxDataControllerEachRowProc)(int ARowIndex, const TcxRowInfo &ARowInfo);

class PASCALIMPLEMENTATION TcxCustomDataController : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	bool FActive;
	bool FAfterSummaryFlag;
	int FBookmarkRecordIndex;
	bool FDataChangedFlag;
	int FDataChangedLockCount;
	TcxDataControllerChanges FChanges;
	bool FCreatingLinkObject;
	Classes::TList* FDataChangedListeners;
	int FDataChangeRefCount;
	TcxCustomDataControllerInfo* FDataControllerInfo;
	Cxdatastorage::TcxDataStorage* FDataStorage;
	bool FDestroying;
	bool FGroupingChanged;
	TcxDataControllerGroups* FGroups;
	TcxCustomDataFieldList* FFields;
	TcxDataFilterCriteria* FFilter;
	bool FFocusedSelected;
	TcxCustomDataField* FIncrementalFilterField;
	AnsiString FIncrementalFilterText;
	TcxCustomDataField* FIncrementalSearchField;
	bool FIncrementalSearching;
	AnsiString FIncrementalSearchText;
	bool FInOnSortingChanged;
	bool FInternalFindRecord;
	bool FIsPattern;
	bool FIsPatternSave;
	bool FInSmartLoad;
	Classes::TList* FListenerLinks;
	int FLockGridModeNotifyCount;
	int FNewItemRecordIndex;
	bool FNewItemRowFocused;
	int FMasterRecordIndex;
	TcxCustomDataRelation* FMasterRelation;
	bool FMultiSelect;
	TcxDataControllerNotifier* FNotifier;
	TcxDataControllerOptions FOptions;
	Classes::TComponent* FOwner;
	TcxDataSelectionChangedInfo FPrevSelectionChangedInfo;
	TcxCustomDataProvider* FProvider;
	TcxCustomDataField* FRecordHandlesField;
	bool FRecreatingLinkObject;
	TcxCustomDataRelationList* FRelations;
	TcxDataControllerSearch* FSearch;
	TcxDataSelectionChangedInfo FSelectionChangedInfo;
	bool FSortingChanged;
	bool FStructureChanged;
	bool FStructureRecreated;
	TcxDataSummary* FSummary;
	bool FUpdateItems;
	bool FUseNewItemRowForEditing;
	TcxDataControllerCompareEvent FOnCompare;
	Classes::TNotifyEvent FOnDataChanged;
	Classes::TNotifyEvent FOnGroupingChanged;
	TcxDataRecordChangedEvent FOnRecordChanged;
	Classes::TNotifyEvent FOnSortingChanged;
	TcxUpdateControlEvent FOnUpdateControl;
	TcxCustomDataSource* __fastcall GetCustomDataSource(void);
	TcxDataControllerDetailMode __fastcall GetDetailMode(void);
	int __fastcall GetFilteredIndexByRecordIndex(int Index);
	int __fastcall GetFilteredRecordCount(void);
	int __fastcall GetFilteredRecordIndex(int Index);
	bool __fastcall GetIsEditing(void);
	bool __fastcall GetIsPattern(void);
	int __fastcall GetLockCount(void);
	bool __fastcall GetNewItemRowFocused(void);
	TcxDataControllerOptions __fastcall GetOptions(void);
	TcxCustomDataRelationList* __fastcall GetRelations(void);
	void __fastcall SetCustomDataSource(TcxCustomDataSource* Value);
	void __fastcall SetIsPattern(bool Value);
	void __fastcall SetFilter(TcxDataFilterCriteria* Value);
	void __fastcall SetFocusedRowIndex(int Value);
	void __fastcall SetMultiSelect(bool Value);
	void __fastcall SetNewItemRowFocused(bool Value);
	void __fastcall SetOptions(TcxDataControllerOptions Value);
	void __fastcall SetSummary(TcxDataSummary* Value);
	void __fastcall SetUseNewItemRowForEditing(bool Value);
	void __fastcall Update(void);
	void __fastcall BookmarkNotification(void);
	void __fastcall DataNotification(void);
	void __fastcall DoGroupingChanged(void);
	void __fastcall DoSortingChanged(void);
	void __fastcall FocusedNotification(void);
	void __fastcall LayoutNotification(void);
	void __fastcall UpdateRecordNotification(void);
	void __fastcall SearchNotification(void);
	void __fastcall SelectionNotification(void);
	void __fastcall NotifyControl(TcxUpdateControlInfo* AUpdateControlInfo);
	void __fastcall NotifyListenerLinks(void);
	void __fastcall ResetDataChangeInfo(void);
	
protected:
	TcxDataChangeInfo FDataChangeInfo;
	HRESULT __stdcall QueryInterface(const GUID &IID, /* out */ void *Obj);
	int __stdcall _AddRef(void);
	int __stdcall _Release(void);
	virtual TcxCustomDataField* __fastcall AddInternalField(void);
	virtual TcxCustomDataField* __fastcall AddField(void);
	virtual int __fastcall AppendInSmartLoad(void);
	virtual int __fastcall CalcEditingRecordIndex(void);
	virtual bool __fastcall CanChangeDetailExpanding(int ARecordIndex, bool AExpanded);
	virtual bool __fastcall CanFocusRecord(int ARecordIndex);
	virtual bool __fastcall CanSelectRow(int ARowIndex);
	void __fastcall CheckChanges(void);
	void __fastcall Change(TcxDataControllerChanges AChanges);
	virtual void __fastcall CheckBookmarkValid(int ADeletedRecordIndex);
	virtual void __fastcall CheckBrowseMode(void);
	virtual void __fastcall CheckEditingRecordIndex(int ARecordIndex);
	void __fastcall CheckInternalRecordRange(int ARecordIndex);
	void __fastcall CheckItemRange(int AItemIndex);
	virtual bool __fastcall CheckMasterBrowseMode(void);
	void __fastcall CheckMode(void);
	void __fastcall CheckNearestFocusRow(void);
	void __fastcall CheckRange(int ARecordIndex, int AItemIndex);
	void __fastcall CheckRecordRange(int ARecordIndex);
	void __fastcall CheckSelectedCount(int ADeletedRecordIndex);
	void __fastcall ClearDataChangedListeners(void);
	void __fastcall ClearDetailsMasterRelation(TcxCustomDataRelation* ARelation);
	virtual void __fastcall CopyRecord(int AFromRecordIndex, int AToRecordIndex);
	virtual void __fastcall CorrectAfterInsert(int ARecordIndex);
	virtual void __fastcall CorrectAfterDelete(int ARecordIndex);
	void __fastcall CorrectPrevSelectionChangedInfo(void);
	virtual void __fastcall DeleteInSmartLoad(int ARecordIndex);
	virtual void __fastcall DoDataChanged(void);
	virtual bool __fastcall DoIncrementalFilterRecord(int ARecordIndex);
	virtual void __fastcall DoReadRecord(int ARecordIndex);
	virtual bool __fastcall DoSearchInGridMode(const AnsiString ASubText, bool AForward, bool ANext);
	virtual System::TObject* __fastcall FindItemByInternalID(int AID);
	virtual System::TObject* __fastcall FindProperItemLink(System::TObject* AItemLink);
	virtual int __fastcall GetActiveRecordIndex(void);
	virtual TMetaClass* __fastcall GetDataProviderClass(void);
	virtual TMetaClass* __fastcall GetDataSelectionClass(void);
	virtual TcxDataControllerEditOperations __fastcall GetEditOperations(void);
	virtual TcxDataControllerEditState __fastcall GetEditState(void);
	virtual int __fastcall GetDefaultActiveRelationIndex(void);
	virtual TMetaClass* __fastcall GetFieldClass(void);
	virtual TMetaClass* __fastcall GetFilterCriteriaClass(void);
	virtual AnsiString __fastcall GetInternalDisplayText(int ARecordIndex, TcxCustomDataField* AField);
	/* virtual class method */ virtual int __fastcall GetItemID(TMetaClass* vmt, System::TObject* AItem);
	virtual Variant __fastcall GetInternalValue(int ARecordIndex, TcxCustomDataField* AField);
	int __fastcall GetLastRecordIndex(void);
	virtual int __fastcall GetRecordIndex(void);
	virtual TMetaClass* __fastcall GetRelationClass(void);
	AnsiString __fastcall GetStoredDisplayText(int ARecordIndex, TcxCustomDataField* AField);
	Variant __fastcall GetStoredValue(int ARecordIndex, TcxCustomDataField* AField);
	virtual TMetaClass* __fastcall GetSummaryClass(void);
	virtual TMetaClass* __fastcall GetSummaryItemClass(void);
	virtual TMetaClass* __fastcall GetSummaryGroupItemLinkClass(void);
	virtual bool __fastcall InternalCheckBookmark(int ADeletedRecordIndex);
	virtual void __fastcall InternalClearBookmark(void);
	virtual void __fastcall InternalGotoBookmark(void);
	virtual bool __fastcall InternalSaveBookmark(void);
	bool __fastcall IsDataChangedListenersExist(void);
	virtual bool __fastcall IsDataField(TcxCustomDataField* AField);
	virtual bool __fastcall IsDestroying(void);
	virtual bool __fastcall IsFocusedSelectedMode(void);
	virtual bool __fastcall IsLoading(void);
	virtual bool __fastcall IsProviderDataSource(void);
	virtual bool __fastcall IsProviderMode(void);
	virtual bool __fastcall IsSmartLoad(void);
	virtual void __fastcall LoadStorage(void);
	void __fastcall NotifyDataChangedListeners(void);
	virtual void __fastcall NotifyDataControllers(void);
	virtual void __fastcall PrepareField(TcxCustomDataField* AField);
	virtual void __fastcall ProviderValueDefSetProc(Cxdatastorage::TcxValueDef* AValueDef, int AFromRecordIndex, int AToRecordIndex, Cxdatastorage::TcxValueDefReader* AValueDefReader);
	virtual void __fastcall RemoveNotification(Classes::TComponent* AComponent);
	void __fastcall ResetNewItemRowFocused(void);
	virtual void __fastcall RestructData(void);
	void __fastcall SetStoredValue(int ARecordIndex, TcxCustomDataField* AField, const Variant &Value);
	virtual void __fastcall SyncMasterPos(void);
	virtual void __fastcall UpdateFields(void);
	virtual void __fastcall UpdateFocused(void);
	virtual void __fastcall UpdateRelations(TcxCustomDataRelation* ARelation);
	void __fastcall UpdateStorage(bool AUpdateFields);
	void __fastcall AddListenerLink(void * ALink);
	void __fastcall RemoveListenerLink(void * ALink);
	virtual void __fastcall DataStorageClearInternalRecords(System::TObject* Sender);
	virtual void __fastcall RemoveField(TcxCustomDataField* ADataField);
	virtual void __fastcall FilterChanged(void);
	virtual void __fastcall SummaryChanged(bool ARedrawOnly);
	virtual void __fastcall ActiveChanged(bool AActive);
	virtual void __fastcall DataChanged(TcxDataChange ADataChange, int AItemIndex, int ARecordIndex);
	virtual void __fastcall DataScrolled(int ADistance);
	virtual void __fastcall LayoutChanged(TcxDataLayoutChanges ADataLayoutChanges);
	virtual void __fastcall DoBeforeFocusedRowChange(int ARowIndex);
	virtual void __fastcall DoValueTypeClassChanged(int AItemIndex);
	virtual void __fastcall UpdateControl(TcxUpdateControlInfo* AInfo);
	virtual AnsiString __fastcall GetIncrementalSearchText(int ARecordIndex, int AItemIndex);
	virtual AnsiString __fastcall GetFilterDisplayText(int ARecordIndex, int AItemIndex);
	virtual int __fastcall CompareByField(int ARecordIndex1, int ARecordIndex2, TcxCustomDataField* AField);
	virtual int __fastcall CompareEqualRecords(int ARecordIndex1, int ARecordIndex2);
	virtual int __fastcall CompareRecords(int ARecordIndex1, int ARecordIndex2, const TcxDataSortInfo &ASortInfo);
	int __fastcall FindGroupRecord(int ABufferRecordIndex, int AGroupItemCount);
	int __fastcall FindRecordByFields(int ABufferRecordIndex, Classes::TList* AFields);
	virtual Variant __fastcall GetComparedValue(int ARecordIndex, TcxCustomDataField* AField);
	virtual bool __fastcall IsConversionNeededForCompare(TcxCustomDataField* AField);
	virtual bool __fastcall IsStringConversionNeeded(TcxCustomDataField* AField);
	virtual bool __fastcall IsSortByDisplayTextNeeded(TcxCustomDataField* AField);
	int __fastcall NativeCompare(int ARecordIndex1, int ARecordIndex2, TcxCustomDataField* AField);
	void __fastcall DeleteRecords(Classes::TList* AList);
	virtual void __fastcall BeginSmartLoad(void);
	virtual void __fastcall EndSmartLoad(void);
	virtual int __fastcall LoadRecord(void * AData);
	__property TcxCustomDataControllerInfo* DataControllerInfo = {read=FDataControllerInfo};
	__property Cxdatastorage::TcxDataStorage* DataStorage = {read=FDataStorage};
	__property TcxCustomDataFieldList* Fields = {read=FFields};
	__property bool IsCreatingLinkObject = {read=FCreatingLinkObject, nodefault};
	__property TcxDataControllerNotifier* Notifier = {read=FNotifier};
	__property TcxCustomDataProvider* Provider = {read=FProvider};
	
public:
	__fastcall virtual TcxCustomDataController(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxCustomDataController(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual void __fastcall BeforeDestruction(void);
	DYNAMIC Classes::TPersistent* __fastcall GetOwner(void);
	void __fastcall BeginUpdate(void);
	void __fastcall EndUpdate(void);
	virtual void __fastcall AddItem(System::TObject* AItem);
	virtual void __fastcall Loaded(void);
	virtual void __fastcall RemoveItem(System::TObject* AItem);
	virtual void __fastcall UpdateItemIndexes(void);
	void __fastcall UpdateItems(bool AUpdateFields);
	virtual bool __fastcall ExecuteAction(Classes::TBasicAction* Action);
	virtual bool __fastcall UpdateAction(Classes::TBasicAction* Action);
	void __fastcall AddDataChangedListener(Classes::TNotifyEvent ADataChangedEvent);
	void __fastcall RemoveDataChangedListener(Classes::TNotifyEvent ADataChangedEvent);
	void __fastcall AddDataChangeRefCount(void);
	void __fastcall RemoveDataChangeRefCount(void);
	bool __fastcall DataChangedNotifyLocked(void);
	void __fastcall LockDataChangedNotify(void);
	void __fastcall UnlockDataChangedNotify(void);
	void __fastcall LockGridModeNotify(void);
	void __fastcall UnlockGridModeNotify(void);
	virtual void __fastcall ChangeNeedConversion(int AItemIndex, bool ANeedConversion);
	virtual void __fastcall ChangeTextStored(int AItemIndex, bool ATextStored);
	virtual void __fastcall ChangeValueTypeClass(int AItemIndex, TMetaClass* AValueTypeClass);
	virtual System::TObject* __fastcall GetItem(int Index) = 0 ;
	virtual int __fastcall GetItemCount(void);
	virtual bool __fastcall GetItemNeedConversion(int AItemIndex);
	virtual bool __fastcall GetItemTextStored(int AItemIndex);
	TMetaClass* __fastcall GetItemValueTypeClass(int AItemIndex);
	int __fastcall AppendRecord(void);
	void __fastcall DeleteRecord(int ARecordIndex);
	virtual Variant __fastcall GetGroupValue(int ARecordIndex, TcxCustomDataField* AField);
	virtual void __fastcall GetGroupValues(int ARecordIndex, TcxDataSummaryValues &AValues);
	virtual AnsiString __fastcall GetDisplayText(int ARecordIndex, int AItemIndex);
	virtual int __fastcall GetRecordCount(void);
	virtual Variant __fastcall GetValue(int ARecordIndex, int AItemIndex);
	int __fastcall InsertRecord(int ARecordIndex);
	virtual void __fastcall Refresh(void);
	virtual void __fastcall SetDisplayText(int ARecordIndex, int AItemIndex, const AnsiString Value);
	virtual void __fastcall SetRecordCount(int Value);
	virtual void __fastcall SetValue(int ARecordIndex, int AItemIndex, const Variant &Value);
	virtual void __fastcall Append(void);
	virtual void __fastcall Cancel(void);
	virtual bool __fastcall CanInitEditing(int AItemIndex);
	virtual void __fastcall DeleteFocused(void);
	virtual void __fastcall DeleteSelection(void);
	virtual void __fastcall Edit(void);
	virtual void __fastcall FocusControl(int AItemIndex, bool &Done);
	virtual Variant __fastcall GetEditValue(int AItemIndex, Cxdatautils::TcxDataEditValueSource AEditValueSource);
	virtual Cxdatautils::TcxDataEditValueSource __fastcall GetItemValueSource(int AItemIndex);
	virtual void __fastcall Insert(void);
	virtual void __fastcall Post(void);
	virtual void __fastcall PostEditingData(void);
	virtual void __fastcall RefreshExternalData(void);
	virtual bool __fastcall SetEditValue(int AItemIndex, const Variant &AValue, Cxdatautils::TcxDataEditValueSource AEditValueSource);
	virtual void __fastcall UpdateData(void);
	virtual int __fastcall GetEditingRecordIndex(void);
	virtual int __fastcall GetNewItemRecordIndex(void);
	void __fastcall LoadFromStream(Classes::TStream* AStream);
	void __fastcall SaveToStream(Classes::TStream* AStream);
	virtual TcxCustomDataController* __fastcall GetMasterDataController(void);
	virtual int __fastcall GetMasterRecordIndex(void);
	virtual TcxCustomDataRelation* __fastcall GetMasterRelation(void);
	TcxCustomDataController* __fastcall GetPatternDataController(void);
	TcxCustomDataController* __fastcall GetRootDataController(void);
	virtual bool __fastcall IsDetailMode(void);
	virtual System::TObject* __fastcall CreateDetailLinkObject(TcxCustomDataRelation* ARelation, int ARecordIndex);
	virtual TcxCustomDataController* __fastcall GetDetailDataControllerByLinkObject(System::TObject* ALinkObject);
	virtual void __fastcall ResetRelationByItem(System::TObject* AItem);
	void __fastcall SetMasterMode(TcxCustomDataRelation* AMasterRelation, bool AIsPattern);
	virtual void __fastcall SetMasterRelation(TcxCustomDataRelation* AMasterRelation, int AMasterRecordIndex);
	void __fastcall ChangeDetailActiveRelationIndex(int ARecordIndex, int ARelationIndex);
	bool __fastcall ChangeDetailExpanding(int ARecordIndex, bool AExpanded);
	void __fastcall ClearDetailLinkObject(int ARecordIndex, int ARelationIndex);
	void __fastcall ClearDetails(void);
	void __fastcall CollapseDetails(void);
	void __fastcall ForEachDetail(TcxCustomDataRelation* AMasterRelation, TcxDataControllerEachDetailProc AProc);
	int __fastcall GetDetailActiveRelationIndex(int ARecordIndex);
	TcxCustomDataController* __fastcall GetDetailDataController(int ARecordIndex, int ARelationIndex);
	bool __fastcall GetDetailExpanding(int ARecordIndex);
	bool __fastcall GetDetailHasChildren(int ARecordIndex, int ARelationIndex);
	System::TObject* __fastcall GetDetailLinkObject(int ARecordIndex, int ARelationIndex);
	bool __fastcall IsDetailDataControllerExist(int ARecordIndex, int ARelationIndex);
	void __fastcall ResetHasChildrenFlag(void);
	virtual void __fastcall ForEachRow(bool ASelectedRows, TcxDataControllerEachRowProc AProc);
	int __fastcall GetRowCount(void);
	int __fastcall GetRowIndexByRecordIndex(int ARecordIndex, bool AMakeVisible);
	TcxRowInfo __fastcall GetRowInfo(int ARowIndex);
	AnsiString __fastcall GetRowDisplayText(const TcxRowInfo &ARowInfo, int AItemIndex);
	Variant __fastcall GetRowValue(const TcxRowInfo &ARowInfo, int AItemIndex);
	void __fastcall MakeRecordVisible(int ARecordIndex);
	void __fastcall ChangeFocusedRecordIndex(int ARecordIndex);
	bool __fastcall ChangeFocusedRowIndex(int ARowIndex);
	int __fastcall GetFocusedRecordIndex(void);
	int __fastcall GetFocusedRowIndex(void);
	void __fastcall GotoFirst(void);
	void __fastcall GotoLast(void);
	void __fastcall GotoNext(void);
	void __fastcall GotoPrev(void);
	bool __fastcall IsBOF(void);
	bool __fastcall IsEOF(void);
	bool __fastcall IsGridMode(void);
	void __fastcall MoveBy(int ADistance);
	void __fastcall Scroll(int ADistance);
	void __fastcall ClearBookmark(void);
	void __fastcall GotoBookmark(void);
	virtual bool __fastcall IsBookmarkAvailable(void);
	virtual bool __fastcall IsBookmarkRow(int ARowIndex);
	void __fastcall SaveBookmark(void);
	virtual Variant __fastcall GetFilterDataValue(int ARecordIndex, TcxCustomDataField* AField);
	virtual AnsiString __fastcall GetFilterItemFieldCaption(System::TObject* AItem);
	virtual AnsiString __fastcall GetFilterItemFieldName(System::TObject* AItem);
	bool __fastcall ChangeIncrementalFilterText(const AnsiString AText);
	virtual int __fastcall FindRecordIndexByText(int AStartRecordIndex, int AItemIndex, const AnsiString AText, bool APartialCompare, bool ACircular, bool AForward);
	virtual AnsiString __fastcall GetIncrementalFilterText();
	virtual bool __fastcall IsIncrementalFilter(void);
	virtual void __fastcall ResetIncrementalFilter(void);
	virtual int __fastcall SetIncrementalFilter(int AItemIndex, const AnsiString AText);
	void __fastcall ChangeItemSortingIndex(int AItemIndex, int ASortingIndex);
	void __fastcall ChangeSorting(int AItemIndex, TcxDataSortOrder ASortOrder);
	void __fastcall ClearSorting(bool AKeepGroupedItems);
	virtual bool __fastcall GetItemSortByDisplayText(int AItemIndex);
	TcxDataSortOrder __fastcall GetItemSortOrder(int AItemIndex);
	int __fastcall GetItemSortingIndex(int AItemIndex);
	int __fastcall GetSortingItemCount(void);
	int __fastcall GetSortingItemIndex(int Index);
	virtual void __fastcall ChangeRowSelection(int ARowIndex, bool ASelection);
	void __fastcall CheckFocusedSelected(void);
	void __fastcall ClearSelection(void);
	virtual void __fastcall ClearSelectionAnchor(void);
	int __fastcall GetSelectedCount(void);
	virtual int __fastcall GetSelectedRowIndex(int Index);
	virtual int __fastcall GetSelectionAnchorRowIndex(void);
	bool __fastcall IsRowSelected(int ARowIndex);
	virtual bool __fastcall IsSelectionAnchorExist(void);
	virtual void __fastcall SelectAll(void);
	virtual void __fastcall SelectFromAnchor(int ARowIndex, bool AKeepSelection);
	void __fastcall SelectRows(int AStartRowIndex, int AEndRowIndex);
	virtual void __fastcall SetSelectionAnchor(int ARowIndex);
	void __fastcall SyncSelected(bool ASelected);
	virtual void __fastcall SyncSelectionFocusedRecord(void);
	__property bool Active = {read=FActive, nodefault};
	__property TcxCustomDataSource* CustomDataSource = {read=GetCustomDataSource, write=SetCustomDataSource};
	__property TcxDataControllerDetailMode DetailMode = {read=GetDetailMode, nodefault};
	__property AnsiString DisplayTexts[int RecordIndex][int ItemIndex] = {read=GetDisplayText, write=SetDisplayText};
	__property TcxDataControllerGroups* Groups = {read=FGroups};
	__property int EditingRecordIndex = {read=GetEditingRecordIndex, nodefault};
	__property TcxDataControllerEditOperations EditOperations = {read=GetEditOperations, nodefault};
	__property TcxDataControllerEditState EditState = {read=GetEditState, nodefault};
	__property TcxDataFilterCriteria* Filter = {read=FFilter, write=SetFilter};
	__property int FilteredIndexByRecordIndex[int Index] = {read=GetFilteredIndexByRecordIndex};
	__property int FilteredRecordCount = {read=GetFilteredRecordCount, nodefault};
	__property int FilteredRecordIndex[int Index] = {read=GetFilteredRecordIndex};
	__property int FocusedRecordIndex = {read=GetFocusedRecordIndex, write=ChangeFocusedRecordIndex, nodefault};
	__property int FocusedRowIndex = {read=GetFocusedRowIndex, write=SetFocusedRowIndex, nodefault};
	__property bool IsEditing = {read=GetIsEditing, nodefault};
	__property bool IsPattern = {read=GetIsPattern, write=SetIsPattern, nodefault};
	__property int ItemCount = {read=GetItemCount, nodefault};
	__property int LockCount = {read=GetLockCount, nodefault};
	__property int LockGridModeNotifyCount = {read=FLockGridModeNotifyCount, nodefault};
	__property bool MultiSelect = {read=FMultiSelect, write=SetMultiSelect, nodefault};
	__property int NewItemRecordIndex = {read=GetNewItemRecordIndex, nodefault};
	__property bool NewItemRowFocused = {read=GetNewItemRowFocused, write=SetNewItemRowFocused, nodefault};
	__property TcxDataControllerOptions Options = {read=GetOptions, write=SetOptions, default=28};
	__property int RecordCount = {read=GetRecordCount, write=SetRecordCount, nodefault};
	__property TcxCustomDataRelationList* Relations = {read=GetRelations};
	__property int RowCount = {read=GetRowCount, nodefault};
	__property TcxDataControllerSearch* Search = {read=FSearch};
	__property TcxDataSummary* Summary = {read=FSummary, write=SetSummary};
	__property bool UseNewItemRowForEditing = {read=FUseNewItemRowForEditing, write=SetUseNewItemRowForEditing, nodefault};
	__property Variant Values[int RecordIndex][int ItemIndex] = {read=GetValue, write=SetValue};
	__property TcxDataControllerCompareEvent OnCompare = {read=FOnCompare, write=FOnCompare};
	__property Classes::TNotifyEvent OnDataChanged = {read=FOnDataChanged, write=FOnDataChanged};
	__property Classes::TNotifyEvent OnGroupingChanged = {read=FOnGroupingChanged, write=FOnGroupingChanged};
	__property TcxDataRecordChangedEvent OnRecordChanged = {read=FOnRecordChanged, write=FOnRecordChanged};
	__property Classes::TNotifyEvent OnSortingChanged = {read=FOnSortingChanged, write=FOnSortingChanged};
	__property TcxUpdateControlEvent OnUpdateControl = {read=FOnUpdateControl, write=FOnUpdateControl};
private:
	void *__IInterface;	/* System::IInterface */
	
public:
	operator IInterface*(void) { return (IInterface*)&__IInterface; }
	
};


class PASCALIMPLEMENTATION TcxCustomDataProvider : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	bool FChanging;
	TcxCustomDataSource* FCustomDataSource;
	bool FDataChangedLocked;
	TcxCustomDataController* FDataController;
	int FEditingRecordIndex;
	int FInsertedRecordIndex;
	bool FInserting;
	int FLocateCount;
	int FLockCount;
	bool FModified;
	bool FRecreatedFieldsAfterFirst;
	int FSavedRecordIndex;
	void __fastcall SetCustomDataSource(TcxCustomDataSource* Value);
	
protected:
	bool FInInserting;
	bool FLoadAllNeeded;
	virtual bool __fastcall IsCustomDataSourceSupported(void);
	virtual bool __fastcall IsGridMode(void);
	virtual bool __fastcall IsDataSource(void);
	virtual bool __fastcall IsOtherInsert(void);
	virtual bool __fastcall IsSyncMode(void);
	virtual bool __fastcall IsActive(void);
	virtual bool __fastcall IsActiveDataSet(void);
	virtual bool __fastcall IsBOF(void);
	virtual bool __fastcall IsChanging(void);
	virtual bool __fastcall IsEditing(void);
	virtual bool __fastcall IsEOF(void);
	virtual bool __fastcall IsInserting(void);
	virtual bool __fastcall IsModified(void);
	virtual void __fastcall CorrectRecordIndex(int ARecordIndex);
	virtual void __fastcall First(void);
	virtual void __fastcall Prev(void);
	virtual void __fastcall Next(void);
	virtual void __fastcall Last(void);
	virtual void __fastcall MoveBy(int ADistance);
	virtual void __fastcall Scroll(int ADistance);
	virtual void __fastcall SavePos(void);
	virtual void __fastcall RestorePos(void);
	virtual bool __fastcall CanAppend(void);
	virtual bool __fastcall CanDelete(void);
	virtual bool __fastcall CanInitEditing(int ARecordIndex);
	virtual bool __fastcall CanInsert(void);
	virtual bool __fastcall CanModify(void);
	virtual void __fastcall Append(void);
	virtual void __fastcall Cancel(void);
	virtual void __fastcall Delete(void);
	virtual void __fastcall DeleteRecords(Classes::TList* AList);
	virtual void __fastcall DeleteSelection(void);
	virtual void __fastcall Edit(void);
	virtual Variant __fastcall GetEditValue(int ARecordIndex, TcxCustomDataField* AField, Cxdatautils::TcxDataEditValueSource AEditValueSource);
	virtual void __fastcall Insert(void);
	virtual void __fastcall Post(void);
	virtual void __fastcall PostEditingData(void);
	virtual bool __fastcall SetEditValue(int ARecordIndex, TcxCustomDataField* AField, const Variant &AValue, Cxdatautils::TcxDataEditValueSource AEditValueSource);
	virtual void __fastcall AssignItemValue(int ARecordIndex, TcxCustomDataField* AField, const Variant &AValue);
	void __fastcall ClearSavedRecord(void);
	void __fastcall CreateSavedRecord(int ARecordIndex);
	virtual void __fastcall DoInitInsertingRecord(int AInsertingRecordIndex, const TcxDataSummaryValues AGroupValues);
	virtual void __fastcall EditingRecord(void);
	virtual void __fastcall InsertingRecord(bool AIsAppending);
	virtual void __fastcall ResetChanging(void);
	virtual void __fastcall ResetEditing(void);
	virtual void __fastcall ResetModified(void);
	virtual void __fastcall SetChanging(void);
	virtual void __fastcall SetEditing(void);
	virtual void __fastcall SetModified(void);
	virtual void __fastcall BeginLocate(void);
	virtual void __fastcall EndLocate(void);
	virtual void __fastcall Freeze(void);
	virtual void __fastcall Unfreeze(void);
	int __fastcall AddRecordHandle(void * AData);
	virtual int __fastcall AppendRecord(void);
	virtual void __fastcall DeleteRecord(int ARecordIndex);
	virtual bool __fastcall GetDetailHasChildren(int ARecordIndex, int ARelationIndex);
	virtual AnsiString __fastcall GetDisplayText(int ARecordIndex, TcxCustomDataField* AField);
	virtual AnsiString __fastcall GetExternalDataDisplayText(int ARecordIndex, TcxCustomDataField* AField);
	virtual Variant __fastcall GetExternalDataValue(int ARecordIndex, TcxCustomDataField* AField);
	virtual int __fastcall GetRecordIndex(void);
	virtual Variant __fastcall GetValue(int ARecordIndex, TcxCustomDataField* AField);
	virtual TMetaClass* __fastcall GetValueDefReaderClass(void) = 0 ;
	virtual int __fastcall InsertRecord(int ARecordIndex);
	virtual void __fastcall LoadDataBuffer(void);
	void __fastcall LoadRecordHandles(void);
	virtual int __fastcall NativeCompare(int ARecordIndex1, int ARecordIndex2, TcxCustomDataField* AField);
	virtual int __fastcall NativeCompareFunc(int ARecordIndex1, int ARecordIndex2, TcxCustomDataField* AField);
	virtual void __fastcall SetDisplayText(int ARecordIndex, TcxCustomDataField* AField, const AnsiString Value);
	virtual void __fastcall SetRecordCount(int ARecordCount);
	virtual void __fastcall SetValue(int ARecordIndex, TcxCustomDataField* AField, const Variant &Value);
	virtual void __fastcall ActiveChanged(bool AActive);
	virtual void __fastcall DataChanged(TcxDataChange ADataChange, int AItemIndex, int ARecordIndex);
	virtual void __fastcall DataScrolled(int ADistance);
	virtual void __fastcall LayoutChanged(TcxDataLayoutChanges ADataLayoutChanges);
	__property TcxCustomDataSource* CustomDataSource = {read=FCustomDataSource, write=SetCustomDataSource};
	__property TcxCustomDataController* DataController = {read=FDataController};
	__property int EditingRecordIndex = {read=FEditingRecordIndex, nodefault};
	__property int InsertedRecordIndex = {read=FInsertedRecordIndex, nodefault};
	__property int LocateCount = {read=FLocateCount, nodefault};
	__property int LockCount = {read=FLockCount, nodefault};
	__property bool RecreatedFieldsAfterFirst = {read=FRecreatedFieldsAfterFirst, write=FRecreatedFieldsAfterFirst, nodefault};
	
public:
	__fastcall virtual TcxCustomDataProvider(TcxCustomDataController* ADataController);
	__fastcall virtual ~TcxCustomDataProvider(void);
};


class PASCALIMPLEMENTATION TcxCustomDataSource : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	TcxCustomDataProvider* FCurrentProvider;
	TcxCustomDataProvider* FProvider;
	TcxCustomDataController* __fastcall GetDataController(void);
	TcxCustomDataProvider* __fastcall GetProvider(void);
	
protected:
	virtual void * __fastcall AppendRecord(void);
	virtual void __fastcall DeleteRecord(void * ARecordHandle);
	virtual int __fastcall GetDefaultItemID(int AItemIndex);
	virtual bool __fastcall GetDetailHasChildren(int ARecordIndex, int ARelationIndex);
	virtual AnsiString __fastcall GetDisplayText(void * ARecordHandle, void * AItemHandle);
	virtual bool __fastcall GetInfoForCompare(void * ARecordHandle, void * AItemHandle, char * &PValueBuffer);
	virtual void * __fastcall GetItemHandle(int AItemIndex);
	virtual int __fastcall GetRecordCount(void);
	virtual void * __fastcall GetRecordHandle(int ARecordIndex);
	virtual Variant __fastcall GetValue(void * ARecordHandle, void * AItemHandle);
	virtual void * __fastcall InsertRecord(void * ARecordHandle);
	virtual bool __fastcall IsNativeCompare(void);
	virtual bool __fastcall IsNativeCompareFunc(void);
	virtual void __fastcall LoadRecordHandles(void);
	virtual int __fastcall NativeCompareFunc(void * ARecordHandle1, void * ARecordHandle2, void * AItemHandle);
	virtual void __fastcall SetRecordCount(int ARecordCount);
	virtual void __fastcall SetValue(void * ARecordHandle, void * AItemHandle, const Variant &AValue);
	__property TcxCustomDataProvider* CurrentProvider = {read=FCurrentProvider, write=FCurrentProvider};
	int __fastcall AddRecordHandle(void * ARecordHandle);
	
public:
	__fastcall virtual ~TcxCustomDataSource(void);
	virtual void __fastcall DataChanged(void);
	void * __fastcall GetRecordHandleByIndex(int ARecordIndex);
	int __fastcall GetRecordIndexByHandle(void * ARecordHandle);
	__property TcxCustomDataController* DataController = {read=GetDataController};
	__property TcxCustomDataProvider* Provider = {read=GetProvider};
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxCustomDataSource(void) : System::TObject() { }
	#pragma option pop
	
};


typedef TMetaClass*TcxCustomDataSourceClass;

class PASCALIMPLEMENTATION TcxCustomDataField : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	TcxCustomDataFieldList* FFieldList;
	bool FIsInternal;
	System::TObject* FItem;
	int FLockRecreateData;
	bool FNeedConversion;
	int FNeedConversionFlag;
	bool FPrepared;
	TcxCustomDataField* FReferenceField;
	bool FTextStored;
	Cxdatastorage::TcxValueDef* FValueDef;
	TMetaClass*FValueTypeClass;
	TcxCustomDataController* __fastcall GetDataController(void);
	int __fastcall GetIndex(void);
	Classes::TComponent* __fastcall GetNotifier(void);
	bool __fastcall GetTextStored(void);
	Cxdatastorage::TcxValueDef* __fastcall GetValueDef(void);
	TMetaClass* __fastcall GetValueTypeClass(void);
	void __fastcall SetIndex(int Value);
	void __fastcall SetIsInternal(bool Value);
	void __fastcall SetReferenceField(TcxCustomDataField* Value);
	void __fastcall SetTextStored(bool Value);
	void __fastcall SetValueTypeClass(TMetaClass* Value);
	
protected:
	void __fastcall BeginRecreateData(void);
	void __fastcall Changed(void);
	void __fastcall ClearData(void);
	void __fastcall CreateData(void);
	void __fastcall EndRecreateData(void);
	virtual void __fastcall Reassign(TcxCustomDataField* ASource);
	virtual void __fastcall RemoveNotification(Classes::TComponent* AComponent);
	__property TcxCustomDataFieldList* FieldList = {read=FFieldList};
	__property System::TObject* Item = {read=FItem, write=FItem};
	__property bool NeedConversion = {read=FNeedConversion, write=FNeedConversion, nodefault};
	__property Classes::TComponent* Notifier = {read=GetNotifier};
	__property bool TextStored = {read=GetTextStored, write=SetTextStored, nodefault};
	__property Cxdatastorage::TcxValueDef* ValueDef = {read=GetValueDef};
	__property TMetaClass* ValueTypeClass = {read=GetValueTypeClass, write=SetValueTypeClass};
	
public:
	__fastcall virtual TcxCustomDataField(TcxCustomDataFieldList* AFieldList);
	__fastcall virtual ~TcxCustomDataField(void);
	virtual bool __fastcall CanModify(Cxdatautils::TcxDataEditValueSource AEditValueSource);
	virtual bool __fastcall IsValueDefInternal(void);
	__property TcxCustomDataController* DataController = {read=GetDataController};
	__property int Index = {read=GetIndex, write=SetIndex, nodefault};
	__property bool IsInternal = {read=FIsInternal, write=SetIsInternal, nodefault};
	__property TcxCustomDataField* ReferenceField = {read=FReferenceField, write=SetReferenceField};
};


class DELPHICLASS TcxDetailInfoObject;
class PASCALIMPLEMENTATION TcxDetailInfoObject : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	System::TObject* LinkObject;
	bool HasChildren;
	bool HasChildrenAssigned;
	__fastcall virtual ~TcxDetailInfoObject(void);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxDetailInfoObject(void) : System::TObject() { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxDetailObject : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	int FActiveRelationIndex;
	Classes::TList* FInfoObjects;
	bool FExpanded;
	TcxDetailInfoObject* __fastcall GetInfoObject(int Index);
	int __fastcall GetInfoObjectCount(void);
	bool __fastcall GetIsEmpty(void);
	System::TObject* __fastcall GetLinkObject(int Index);
	int __fastcall GetLinkObjectCount(void);
	void __fastcall SetInfoObject(int Index, TcxDetailInfoObject* Value);
	void __fastcall SetLinkObject(int Index, System::TObject* Value);
	
protected:
	void __fastcall CorrectCount(int ARelationCount);
	
public:
	__fastcall TcxDetailObject(void);
	__fastcall virtual ~TcxDetailObject(void);
	void __fastcall Clear(void);
	bool __fastcall ClearHasChildrenFlag(void);
	void __fastcall ClearInfoObject(int AIndex);
	__property int ActiveRelationIndex = {read=FActiveRelationIndex, write=FActiveRelationIndex, nodefault};
	__property bool Expanded = {read=FExpanded, write=FExpanded, nodefault};
	__property int InfoObjectCount = {read=GetInfoObjectCount, nodefault};
	__property TcxDetailInfoObject* InfoObjects[int Index] = {read=GetInfoObject, write=SetInfoObject};
	__property bool IsEmpty = {read=GetIsEmpty, nodefault};
	__property int LinkObjectCount = {read=GetLinkObjectCount, nodefault};
	__property System::TObject* LinkObjects[int Index] = {read=GetLinkObject, write=SetLinkObject};
};


typedef TcxDataSortInfo *PcxDataSortInfo;

#pragma pack(push, 4)
struct TcxDataSortInfo
{
	TcxCustomDataField* Field;
	TcxDataSortOrder SortOrder;
} ;
#pragma pack(pop)

struct TcxDataGroupInfo
{
	int RowIndex;
	bool Expanded;
	int Level;
	int BeginRecordListIndex;
	int EndRecordListIndex;
	Variant SummaryValues;
} ;

#pragma pack(push, 4)
struct TcxGroupsRowInfo
{
	bool Expanded;
	int Level;
	int RecordListIndex;
} ;
#pragma pack(pop)

#pragma pack(push, 4)
struct TcxRowInfo
{
	bool Expanded;
	int Level;
	int RecordIndex;
} ;
#pragma pack(pop)

struct TcxDataExpandingInfo
{
	int Level;
	Variant Value;
	TcxDataExpandingInfoStateSet State;
} ;

#pragma pack(push, 4)
struct TcxDataSelectionInfo
{
	int Level;
	int RecordIndex;
	int RowIndex;
} ;
#pragma pack(pop)

class DELPHICLASS TcxDataFilterCriteriaItem;
class PASCALIMPLEMENTATION TcxDataFilterCriteriaItem : public Cxfilter::TcxFilterCriteriaItem 
{
	typedef Cxfilter::TcxFilterCriteriaItem inherited;
	
private:
	TcxCustomDataController* __fastcall GetDataController(void);
	TcxCustomDataField* __fastcall GetField(void);
	
protected:
	virtual Variant __fastcall GetDataValue(void * AData);
	virtual AnsiString __fastcall GetFieldCaption();
	virtual AnsiString __fastcall GetFieldName();
	virtual System::TObject* __fastcall GetItemLink(void);
	
public:
	__property TcxCustomDataController* DataController = {read=GetDataController};
	__property TcxCustomDataField* Field = {read=GetField};
public:
	#pragma option push -w-inl
	/* TcxFilterCriteriaItem.Create */ inline __fastcall virtual TcxDataFilterCriteriaItem(Cxfilter::TcxFilterCriteriaItemList* AOwner, System::TObject* AItemLink, Cxfilter::TcxFilterOperatorKind AOperatorKind, const Variant &AValue, const AnsiString ADisplayValue) : Cxfilter::TcxFilterCriteriaItem(AOwner, AItemLink, AOperatorKind, AValue, ADisplayValue) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxFilterCriteriaItem.Destroy */ inline __fastcall virtual ~TcxDataFilterCriteriaItem(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxDataFilterValueList : public Cxfilter::TcxFilterValueList 
{
	typedef Cxfilter::TcxFilterValueList inherited;
	
private:
	TcxCustomDataController* __fastcall GetDataController(void);
	
public:
	virtual void __fastcall Load(int AItemIndex);
	__property TcxCustomDataController* DataController = {read=GetDataController};
public:
	#pragma option push -w-inl
	/* TcxFilterValueList.Create */ inline __fastcall virtual TcxDataFilterValueList(Cxfilter::TcxFilterCriteria* ACriteria) : Cxfilter::TcxFilterValueList(ACriteria) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxFilterValueList.Destroy */ inline __fastcall virtual ~TcxDataFilterValueList(void) { }
	#pragma option pop
	
};


typedef int TcxDataGroupIndex;

class DELPHICLASS TcxCustomDataSummaryItem;
class PASCALIMPLEMENTATION TcxCustomDataSummaryItem : public Classes::TCollectionItem 
{
	typedef Classes::TCollectionItem inherited;
	
private:
	TcxCustomDataField* FField;
	System::TObject* __fastcall GetItemLink(void);
	void __fastcall SetItemLink(System::TObject* Value);
	
protected:
	virtual TcxCustomDataController* __fastcall GetDataController(void) = 0 ;
	virtual void __fastcall ItemLinkChanging(TcxCustomDataField* AField);
	
public:
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	void __fastcall BeginUpdate(void);
	void __fastcall EndUpdate(void);
	__property TcxCustomDataController* DataController = {read=GetDataController};
	__property System::TObject* ItemLink = {read=GetItemLink, write=SetItemLink};
	__property TcxCustomDataField* Field = {read=FField};
public:
	#pragma option push -w-inl
	/* TCollectionItem.Create */ inline __fastcall virtual TcxCustomDataSummaryItem(Classes::TCollection* Collection) : Classes::TCollectionItem(Collection) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCollectionItem.Destroy */ inline __fastcall virtual ~TcxCustomDataSummaryItem(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxDataSummaryItem : public TcxCustomDataSummaryItem 
{
	typedef TcxCustomDataSummaryItem inherited;
	
private:
	AnsiString FFormat;
	TcxSummaryKind FKind;
	TcxSummaryPosition __fastcall GetPosition(void);
	TcxDataSummaryItems* __fastcall GetSummaryItems(void);
	void __fastcall SetFormat(const AnsiString Value);
	void __fastcall SetKind(TcxSummaryKind Value);
	void __fastcall SetPosition(TcxSummaryPosition Value);
	
protected:
	TcxSummaryPosition FPosition;
	virtual TcxCustomDataController* __fastcall GetDataController(void);
	virtual bool __fastcall IsPositionStored(void);
	
public:
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual TcxCustomDataField* __fastcall DataField(void);
	virtual AnsiString __fastcall FormatValue(const Variant &AValue, bool AIsFooter);
	__property TcxCustomDataController* DataController = {read=GetDataController};
	__property TcxDataSummaryItems* SummaryItems = {read=GetSummaryItems};
	
__published:
	__property AnsiString Format = {read=FFormat, write=SetFormat};
	__property TcxSummaryKind Kind = {read=FKind, write=SetKind, default=0};
	__property TcxSummaryPosition Position = {read=GetPosition, write=SetPosition, stored=IsPositionStored, nodefault};
public:
	#pragma option push -w-inl
	/* TCollectionItem.Create */ inline __fastcall virtual TcxDataSummaryItem(Classes::TCollection* Collection) : TcxCustomDataSummaryItem(Collection) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCollectionItem.Destroy */ inline __fastcall virtual ~TcxDataSummaryItem(void) { }
	#pragma option pop
	
};


#pragma pack(push, 4)
struct TcxSummaryEventArguments
{
	int RecordIndex;
	TcxDataSummaryItem* SummaryItem;
} ;
#pragma pack(pop)

struct TcxSummaryEventOutArguments
{
	Variant Value;
	Variant SummaryValue;
	int CountValue;
	bool Done;
} ;

class DELPHICLASS TcxDataSummaryGroupItemLink;
class DELPHICLASS TcxDataSummaryGroupItemLinks;
class PASCALIMPLEMENTATION TcxDataSummaryGroupItemLink : public TcxCustomDataSummaryItem 
{
	typedef TcxCustomDataSummaryItem inherited;
	
private:
	TcxDataSummaryGroupItemLinks* __fastcall GetSummaryGroupItemLinks(void);
	
protected:
	virtual TcxCustomDataController* __fastcall GetDataController(void);
	virtual void __fastcall ItemLinkChanging(TcxCustomDataField* AField);
	
public:
	__property TcxDataSummaryGroupItemLinks* SummaryGroupItemLinks = {read=GetSummaryGroupItemLinks};
public:
	#pragma option push -w-inl
	/* TCollectionItem.Create */ inline __fastcall virtual TcxDataSummaryGroupItemLink(Classes::TCollection* Collection) : TcxCustomDataSummaryItem(Collection) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCollectionItem.Destroy */ inline __fastcall virtual ~TcxDataSummaryGroupItemLink(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxDataSummaryGroupItemLinks : public Classes::TCollection 
{
	typedef Classes::TCollection inherited;
	
public:
	TcxDataSummaryGroupItemLink* operator[](int Index) { return Items[Index]; }
	
private:
	TcxDataSummaryGroup* FSummaryGroup;
	HIDESBASE TcxDataSummaryGroupItemLink* __fastcall GetItem(int Index);
	HIDESBASE void __fastcall SetItem(int Index, TcxDataSummaryGroupItemLink* Value);
	
protected:
	DYNAMIC Classes::TPersistent* __fastcall GetOwner(void);
	int __fastcall IndexOfField(TcxCustomDataField* AField);
	TcxDataSummaryGroupItemLink* __fastcall ItemOfField(TcxCustomDataField* AField);
	virtual void __fastcall Update(Classes::TCollectionItem* Item);
	
public:
	__fastcall virtual TcxDataSummaryGroupItemLinks(TcxDataSummaryGroup* ASummaryGroup, TMetaClass* AItemClass);
	HIDESBASE TcxDataSummaryGroupItemLink* __fastcall Add(void);
	int __fastcall IndexOfItemLink(System::TObject* AItemLink);
	TcxDataSummaryGroupItemLink* __fastcall ItemOfItemLink(System::TObject* AItemLink);
	__property TcxDataSummaryGroupItemLink* Items[int Index] = {read=GetItem, write=SetItem/*, default*/};
	__property TcxDataSummaryGroup* SummaryGroup = {read=FSummaryGroup};
public:
	#pragma option push -w-inl
	/* TCollection.Destroy */ inline __fastcall virtual ~TcxDataSummaryGroupItemLinks(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxDataSummaryGroup : public Classes::TCollectionItem 
{
	typedef Classes::TCollectionItem inherited;
	
private:
	TcxDataSummaryGroupItemLinks* FItemLinks;
	TcxDataGroupSummaryItems* FSummaryItems;
	TcxDataSummaryGroups* __fastcall GetSummaryGroups(void);
	void __fastcall SetItemLinks(TcxDataSummaryGroupItemLinks* Value);
	void __fastcall SetSummaryItems(TcxDataGroupSummaryItems* Value);
	
public:
	__fastcall virtual TcxDataSummaryGroup(Classes::TCollection* Collection);
	__fastcall virtual ~TcxDataSummaryGroup(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	__property TcxDataSummaryGroups* SummaryGroups = {read=GetSummaryGroups};
	
__published:
	__property TcxDataSummaryGroupItemLinks* Links = {read=FItemLinks, write=SetItemLinks};
	__property TcxDataGroupSummaryItems* SummaryItems = {read=FSummaryItems, write=SetSummaryItems};
};


class PASCALIMPLEMENTATION TcxUpdateControlInfo : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxUpdateControlInfo(void) : System::TObject() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxUpdateControlInfo(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxUpdateControlInfoClass;

class DELPHICLASS TcxFocusedRecordChangedInfo;
class PASCALIMPLEMENTATION TcxFocusedRecordChangedInfo : public TcxUpdateControlInfo 
{
	typedef TcxUpdateControlInfo inherited;
	
private:
	int FFocusedRecordIndex;
	int FPrevFocusedRecordIndex;
	int FFocusedRowIndex;
	int FPrevFocusedRowIndex;
	bool FNewItemRowFocusingChanged;
	
public:
	__fastcall TcxFocusedRecordChangedInfo(int APrevFocusedRecordIndex, int AFocusedRecordIndex, int APrevFocusedRowIndex, int AFocusedRowIndex, bool ANewItemRowFocusingChanged);
	__property int FocusedRecordIndex = {read=FFocusedRecordIndex, nodefault};
	__property int PrevFocusedRecordIndex = {read=FPrevFocusedRecordIndex, nodefault};
	__property int FocusedRowIndex = {read=FFocusedRowIndex, nodefault};
	__property int PrevFocusedRowIndex = {read=FPrevFocusedRowIndex, nodefault};
	__property bool NewItemRowFocusingChanged = {read=FNewItemRowFocusingChanged, nodefault};
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFocusedRecordChangedInfo(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFocusedRowChangedInfo;
class PASCALIMPLEMENTATION TcxFocusedRowChangedInfo : public TcxUpdateControlInfo 
{
	typedef TcxUpdateControlInfo inherited;
	
private:
	int FFocusedRowIndex;
	int FPrevFocusedRowIndex;
	
public:
	__fastcall TcxFocusedRowChangedInfo(int APrevFocusedRowIndex, int AFocusedRowIndex);
	__property int FocusedRowIndex = {read=FFocusedRowIndex, nodefault};
	__property int PrevFocusedRowIndex = {read=FPrevFocusedRowIndex, nodefault};
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFocusedRowChangedInfo(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxLayoutChangedInfo;
class PASCALIMPLEMENTATION TcxLayoutChangedInfo : public TcxUpdateControlInfo 
{
	typedef TcxUpdateControlInfo inherited;
	
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxLayoutChangedInfo(void) : TcxUpdateControlInfo() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxLayoutChangedInfo(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxUpdateRecordInfo;
class PASCALIMPLEMENTATION TcxUpdateRecordInfo : public TcxUpdateControlInfo 
{
	typedef TcxUpdateControlInfo inherited;
	
private:
	int FRecordIndex;
	
public:
	__fastcall TcxUpdateRecordInfo(int ARecordIndex);
	__property int RecordIndex = {read=FRecordIndex, nodefault};
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxUpdateRecordInfo(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxDataChangedInfo;
class PASCALIMPLEMENTATION TcxDataChangedInfo : public TcxUpdateControlInfo 
{
	typedef TcxUpdateControlInfo inherited;
	
public:
	TcxDataChange Kind;
	int ItemIndex;
	int RecordIndex;
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxDataChangedInfo(void) : TcxUpdateControlInfo() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxDataChangedInfo(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxBookmarkChangedInfo;
class PASCALIMPLEMENTATION TcxBookmarkChangedInfo : public TcxUpdateControlInfo 
{
	typedef TcxUpdateControlInfo inherited;
	
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxBookmarkChangedInfo(void) : TcxUpdateControlInfo() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxBookmarkChangedInfo(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxSelectionChangedInfo;
class PASCALIMPLEMENTATION TcxSelectionChangedInfo : public TcxUpdateControlInfo 
{
	typedef TcxUpdateControlInfo inherited;
	
private:
	Classes::TList* FRowIndexes;
	int __fastcall GetCount(void);
	int __fastcall GetRowIndex(int Index);
	
public:
	__fastcall TcxSelectionChangedInfo(void);
	__fastcall TcxSelectionChangedInfo(int ARowIndex1, int ARowIndex2);
	__fastcall virtual ~TcxSelectionChangedInfo(void);
	__property int Count = {read=GetCount, nodefault};
	__property int RowIndexes[int Index] = {read=GetRowIndex};
};


class DELPHICLASS TcxSearchChangedInfo;
class PASCALIMPLEMENTATION TcxSearchChangedInfo : public TcxUpdateControlInfo 
{
	typedef TcxUpdateControlInfo inherited;
	
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxSearchChangedInfo(void) : TcxUpdateControlInfo() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxSearchChangedInfo(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxDataControllerLocateObject;
class PASCALIMPLEMENTATION TcxDataControllerLocateObject : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	TcxCustomDataController* FDataController;
	int FInternalRecordIndex;
	
protected:
	__property TcxCustomDataController* DataController = {read=FDataController};
	__property int InternalRecordIndex = {read=FInternalRecordIndex, nodefault};
	
public:
	__fastcall virtual TcxDataControllerLocateObject(TcxCustomDataController* ADataController);
	__fastcall virtual ~TcxDataControllerLocateObject(void);
	virtual void __fastcall Clear(void);
	virtual int __fastcall FindRecordIndex(void) = 0 ;
	void __fastcall ReadData(Cxdatastorage::TcxValueDefReader* AValueDefReader);
};


class DELPHICLASS TcxDataControllerKeyLocateObject;
class PASCALIMPLEMENTATION TcxDataControllerKeyLocateObject : public TcxDataControllerLocateObject 
{
	typedef TcxDataControllerLocateObject inherited;
	
private:
	Classes::TList* FFields;
	
public:
	__fastcall virtual TcxDataControllerKeyLocateObject(TcxCustomDataController* ADataController);
	__fastcall virtual ~TcxDataControllerKeyLocateObject(void);
	void __fastcall AddField(TcxCustomDataField* AField);
	void __fastcall ClearFields(void);
	virtual int __fastcall FindRecordIndex(void);
	__property Classes::TList* FieldList = {read=FFields};
};


class DELPHICLASS TcxDataControllerGroupLocateObject;
class PASCALIMPLEMENTATION TcxDataControllerGroupLocateObject : public TcxDataControllerLocateObject 
{
	typedef TcxDataControllerLocateObject inherited;
	
private:
	Classes::TList* FFields;
	Classes::TList* FFindFields;
	bool FFindGroupRecordEnabled;
	int FLevel;
	void __fastcall CorrectFindFields(void);
	void __fastcall SetLevel(int Value);
	
public:
	__fastcall virtual TcxDataControllerGroupLocateObject(TcxCustomDataController* ADataController);
	__fastcall virtual ~TcxDataControllerGroupLocateObject(void);
	virtual int __fastcall FindRecordIndex(void);
	__property int Level = {read=FLevel, write=SetLevel, nodefault};
};


class DELPHICLASS TcxValueDefUnboundReader;
class PASCALIMPLEMENTATION TcxValueDefUnboundReader : public Cxdatastorage::TcxValueDefReader 
{
	typedef Cxdatastorage::TcxValueDefReader inherited;
	
private:
	Classes::TList* FItems;
	Classes::TList* FValues;
	
public:
	__fastcall TcxValueDefUnboundReader(void);
	__fastcall virtual ~TcxValueDefUnboundReader(void);
	void __fastcall Clear(void);
	virtual Variant __fastcall GetValue(Cxdatastorage::TcxValueDef* AValueDef);
	virtual bool __fastcall IsInternal(Cxdatastorage::TcxValueDef* AValueDef);
	void __fastcall SetValue(Cxdatastorage::TcxValueDef* AValueDef, const Variant &AValue);
	void __fastcall Truncate(int AItemCount);
};


class DELPHICLASS TcxValueDefRecordReader;
class PASCALIMPLEMENTATION TcxValueDefRecordReader : public Cxdatastorage::TcxValueDefReader 
{
	typedef Cxdatastorage::TcxValueDefReader inherited;
	
private:
	TcxCustomDataController* FDataController;
	int FRecordIndex;
	
public:
	__fastcall TcxValueDefRecordReader(TcxCustomDataController* ADataController, int ARecordIndex);
	virtual AnsiString __fastcall GetDisplayText(Cxdatastorage::TcxValueDef* AValueDef);
	virtual Variant __fastcall GetValue(Cxdatastorage::TcxValueDef* AValueDef);
	virtual bool __fastcall IsInternal(Cxdatastorage::TcxValueDef* AValueDef);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxValueDefRecordReader(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxCustomDataControllerClass;

//-- var, const, procedure ---------------------------------------------------
static const int cxNullEditingRecordIndex = 0x80000001;
extern PACKAGE void __fastcall InvalidOperation(const AnsiString S);

}	/* namespace Cxcustomdata */
using namespace Cxcustomdata;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxCustomData
