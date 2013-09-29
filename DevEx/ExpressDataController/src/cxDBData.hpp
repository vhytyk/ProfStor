// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxDBData.pas' rev: 6.00

#ifndef cxDBDataHPP
#define cxDBDataHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxDB.hpp>	// Pascal unit
#include <cxDBFilter.hpp>	// Pascal unit
#include <cxFilter.hpp>	// Pascal unit
#include <cxVariants.hpp>	// Pascal unit
#include <cxDataStorage.hpp>	// Pascal unit
#include <cxCustomData.hpp>	// Pascal unit
#include <cxDataUtils.hpp>	// Pascal unit
#include <DB.hpp>	// Pascal unit
#include <Variants.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxdbdata
{
//-- type declarations -------------------------------------------------------
typedef void __fastcall (__closure *TGetListProc)(Classes::TList* AList);

class DELPHICLASS TcxDBProviderDetailFilterAdapter;
class PASCALIMPLEMENTATION TcxDBProviderDetailFilterAdapter : public Cxdb::TcxDBAdapterItem 
{
	typedef Cxdb::TcxDBAdapterItem inherited;
	
public:
	virtual bool __fastcall IsCurrentQuery(Db::TDataSet* ADataSet, const AnsiString AParamNames, const Variant &AParamValues);
	virtual void __fastcall ReopenSQL(Db::TDataSet* ADataSet, const AnsiString AParamNames, const Variant &AParamValues, bool &AReopened);
	virtual void __fastcall SetFilter(Db::TDataSet* ADataSet, const AnsiString AMasterDetailKeyFieldNames, const Variant &AMasterDetailKeyValues, bool AIsSQLMode, bool &AReopened);
public:
	#pragma option push -w-inl
	/* TcxDBAdapterItem.Create */ inline __fastcall TcxDBProviderDetailFilterAdapter(TMetaClass* ADataSetClass) : Cxdb::TcxDBAdapterItem(ADataSetClass) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxDBProviderDetailFilterAdapter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxDBDataLink;
class DELPHICLASS TcxDBDataProvider;
#pragma pack(push, 4)
struct TcxDBDataProviderSavePosInfo
{
	AnsiString Bookmark;
	bool Bof;
	bool Eof;
	int ActiveRecord;
} ;
#pragma pack(pop)

class DELPHICLASS TcxDBDataController;
class PASCALIMPLEMENTATION TcxDBDataProvider : public Cxcustomdata::TcxCustomDataProvider 
{
	typedef Cxcustomdata::TcxCustomDataProvider inherited;
	
private:
	bool FActiveChanging;
	TcxDBDataLink* FDataLink;
	bool FInCanInitEditing;
	bool FIncrementalSearching;
	bool FInFirst;
	bool FInInsert;
	bool FInUpdateGridMode;
	bool FIsDataSetCurrent;
	bool FInNotify;
	Classes::TList* FListeners;
	bool FPostLocateFlag;
	int FRecordIndex;
	TcxDBDataProviderSavePosInfo FSavePosInfo;
	int FUpdatingPrevFocusedRecordIndex;
	int FUpdatingRecordIndex;
	bool FUpdatingRecordIsInserting;
	int FUpdatingNewRecordIndex;
	void __fastcall AddNewRecord(Db::TDataOperation AOperation);
	TcxDBDataController* __fastcall GetDataController(void);
	Db::TDataSet* __fastcall GetDataSet(void);
	Db::TDataSource* __fastcall GetDataSource(void);
	bool __fastcall GetIsDataSetCurrent(void);
	bool __fastcall GetIsSmartRefresh(void);
	void __fastcall RemoveFromListeners(void);
	void __fastcall SetDataSource(Db::TDataSource* Value);
	void __fastcall SetIsDataSetCurrent(bool Value);
	
protected:
	virtual bool __fastcall IsCustomDataSourceSupported(void);
	virtual bool __fastcall IsGridMode(void);
	virtual bool __fastcall IsDataSource(void);
	bool __fastcall IsKeyNavigation(void);
	virtual bool __fastcall IsOtherInsert(void);
	bool __fastcall IsSyncInsert(void);
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
	virtual bool __fastcall CanDelete(void);
	virtual bool __fastcall CanInitEditing(int ARecordIndex);
	virtual bool __fastcall CanModify(void);
	virtual void __fastcall Append(void);
	virtual void __fastcall Cancel(void);
	virtual void __fastcall Delete(void);
	virtual void __fastcall DeleteRecords(Classes::TList* AList);
	virtual void __fastcall DeleteSelection(void);
	virtual void __fastcall Edit(void);
	virtual Variant __fastcall GetEditValue(int ARecordIndex, Cxcustomdata::TcxCustomDataField* AField, Cxdatautils::TcxDataEditValueSource AEditValueSource);
	virtual void __fastcall Insert(void);
	virtual void __fastcall Post(void);
	virtual void __fastcall PostEditingData(void);
	virtual bool __fastcall SetEditValue(int ARecordIndex, Cxcustomdata::TcxCustomDataField* AField, const Variant &AValue, Cxdatautils::TcxDataEditValueSource AEditValueSource);
	virtual void __fastcall AssignItemValue(int ARecordIndex, Cxcustomdata::TcxCustomDataField* AField, const Variant &AValue);
	virtual void __fastcall DoInitInsertingRecord(int AInsertingRecordIndex, const Cxcustomdata::TcxDataSummaryValues AGroupValues);
	virtual void __fastcall ActiveChanged(bool AActive);
	void __fastcall AddListener(TcxDBDataProvider* AProvider);
	virtual void __fastcall BeginLocate(void);
	virtual void __fastcall DataScrolled(int ADistance);
	virtual void __fastcall Freeze(void);
	virtual void __fastcall LayoutChanged(Cxcustomdata::TcxDataLayoutChanges ADataLayoutChanges);
	virtual void __fastcall RecordChanged(Db::TField* Field);
	void __fastcall ResetPostLocateFlag(void);
	void __fastcall ResetSmartRefresh(void);
	void __fastcall SetPostLocateFlag(void);
	virtual void __fastcall Unfreeze(void);
	void __fastcall SmartDataChanged(void);
	bool __fastcall DoLocate(const AnsiString ASubText, bool AForward, bool ANext);
	int __fastcall GetDataBufferCount(void);
	int __fastcall GetDataRecordCount(void);
	virtual AnsiString __fastcall GetExternalDataDisplayText(int ARecordIndex, Cxcustomdata::TcxCustomDataField* AField);
	virtual Variant __fastcall GetExternalDataValue(int ARecordIndex, Cxcustomdata::TcxCustomDataField* AField);
	virtual void __fastcall LoadDataBuffer(void);
	void __fastcall UpdateGridMode(void);
	virtual bool __fastcall GetDetailHasChildren(int ARecordIndex, int ARelationIndex);
	virtual int __fastcall GetRecordIndex(void);
	virtual TMetaClass* __fastcall GetValueDefReaderClass(void);
	__property TcxDBDataController* DataController = {read=GetDataController};
	__property TcxDBDataLink* DataLink = {read=FDataLink};
	__property int UpdatingRecordIndex = {read=FUpdatingRecordIndex, nodefault};
	
public:
	__fastcall virtual TcxDBDataProvider(Cxcustomdata::TcxCustomDataController* ADataController);
	__fastcall virtual ~TcxDBDataProvider(void);
	bool __fastcall IsCanInitEditingBusy(void);
	bool __fastcall IsDataSetBusy(void);
	bool __fastcall IsDetailDataSetBusy(void);
	bool __fastcall IsOtherDataControllerUpdating(void);
	bool __fastcall IsOtherDetailDataSetInInsert(void);
	bool __fastcall IsOtherDetailChanged(void);
	bool __fastcall IsUniDirectional(void);
	__property Db::TDataSet* DataSet = {read=GetDataSet};
	__property Db::TDataSource* DataSource = {read=GetDataSource, write=SetDataSource};
	__property bool IsDataSetCurrent = {read=GetIsDataSetCurrent, write=SetIsDataSetCurrent, nodefault};
	__property bool IsSmartRefresh = {read=GetIsSmartRefresh, nodefault};
};


class PASCALIMPLEMENTATION TcxDBDataLink : public Db::TDataLink 
{
	typedef Db::TDataLink inherited;
	
private:
	TcxDBDataProvider* FProvider;
	
protected:
	virtual void __fastcall ActiveChanged(void);
	virtual void __fastcall DataSetChanged(void);
	virtual void __fastcall DataSetScrolled(int Distance);
	virtual void __fastcall EditingChanged(void);
	virtual void __fastcall FocusControl(Db::TFieldRef Field);
	virtual void __fastcall LayoutChanged(void);
	virtual void __fastcall RecordChanged(Db::TField* Field);
	virtual void __fastcall UpdateData(void);
	__property TcxDBDataProvider* Provider = {read=FProvider};
	
public:
	__fastcall TcxDBDataLink(TcxDBDataProvider* AProvider);
public:
	#pragma option push -w-inl
	/* TDataLink.Destroy */ inline __fastcall virtual ~TcxDBDataLink(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxValueDefDBReader;
class PASCALIMPLEMENTATION TcxValueDefDBReader : public Cxdatastorage::TcxValueDefReader 
{
	typedef Cxdatastorage::TcxValueDefReader inherited;
	
public:
	virtual AnsiString __fastcall GetDisplayText(Cxdatastorage::TcxValueDef* AValueDef);
	virtual Variant __fastcall GetValue(Cxdatastorage::TcxValueDef* AValueDef);
	virtual bool __fastcall IsInternal(Cxdatastorage::TcxValueDef* AValueDef);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxValueDefDBReader(void) : Cxdatastorage::TcxValueDefReader() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxValueDefDBReader(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxDBDataField;
class PASCALIMPLEMENTATION TcxDBDataField : public Cxcustomdata::TcxCustomDataField 
{
	typedef Cxcustomdata::TcxCustomDataField inherited;
	
public:
	TcxDBDataField* operator[](int Index) { return Fields[Index]; }
	
private:
	Db::TField* FField;
	AnsiString FFieldName;
	Classes::TList* FFields;
	TcxDBDataField* FParentField;
	HIDESBASE TcxDBDataController* __fastcall GetDataController(void);
	Db::TField* __fastcall GetField(void);
	TcxDBDataField* __fastcall GetFieldItem(int Index);
	int __fastcall GetFieldCount(void);
	bool __fastcall GetIsLookup(void);
	TcxDBDataProvider* __fastcall GetProvider(void);
	void __fastcall SetField(Db::TField* Value);
	
protected:
	void __fastcall AddField(TcxDBDataField* ADataField);
	void __fastcall ClearFields(void);
	virtual void __fastcall Reassign(Cxcustomdata::TcxCustomDataField* ASource);
	void __fastcall RemoveField(TcxDBDataField* ADataField);
	virtual void __fastcall RemoveNotification(Classes::TComponent* AComponent);
	void __fastcall SetPropertiesByField(Db::TField* AField);
	__property TcxDBDataController* DataController = {read=GetDataController};
	__property Db::TField* Field = {read=GetField, write=SetField};
	__property int FieldCount = {read=GetFieldCount, nodefault};
	__property AnsiString FieldName = {read=FFieldName, write=FFieldName};
	__property TcxDBDataField* Fields[int Index] = {read=GetFieldItem/*, default*/};
	__property bool IsLookup = {read=GetIsLookup, nodefault};
	__property TcxDBDataField* ParentField = {read=FParentField};
	__property TcxDBDataProvider* Provider = {read=GetProvider};
	
public:
	__fastcall virtual ~TcxDBDataField(void);
	virtual bool __fastcall CanModify(Cxdatautils::TcxDataEditValueSource AEditValueSource);
	virtual bool __fastcall IsValueDefInternal(void);
public:
	#pragma option push -w-inl
	/* TcxCustomDataField.Create */ inline __fastcall virtual TcxDBDataField(Cxcustomdata::TcxCustomDataFieldList* AFieldList) : Cxcustomdata::TcxCustomDataField(AFieldList) { }
	#pragma option pop
	
};


class DELPHICLASS TcxDBDataRelation;
class PASCALIMPLEMENTATION TcxDBDataRelation : public Cxcustomdata::TcxCustomDataRelation 
{
	typedef Cxcustomdata::TcxCustomDataRelation inherited;
	
private:
	TcxDBDataField* FMasterKeyField;
	HIDESBASE TcxDBDataController* __fastcall GetDataController(void);
	AnsiString __fastcall GetDetailKeyFieldNames();
	AnsiString __fastcall GetMasterKeyFieldNames();
	
protected:
	void __fastcall GetMasterKeyFields(Classes::TList* AList);
	virtual bool __fastcall IsLinked(void);
	virtual void __fastcall RemoveDataField(Cxcustomdata::TcxCustomDataField* ADataField);
	void __fastcall RemoveMasterKeyField(void);
	void __fastcall UpdateMasterDetailKeyFieldNames(void);
	
public:
	__fastcall virtual ~TcxDBDataRelation(void);
	Variant __fastcall GetMasterRecordID(int ARecordIndex);
	__property TcxDBDataController* DataController = {read=GetDataController};
	__property AnsiString DetailKeyFieldNames = {read=GetDetailKeyFieldNames};
	__property AnsiString MasterKeyFieldNames = {read=GetMasterKeyFieldNames};
public:
	#pragma option push -w-inl
	/* TcxCustomDataRelation.Create */ inline __fastcall TcxDBDataRelation(Cxcustomdata::TcxCustomDataRelationList* ARelationList, System::TObject* AItem) : Cxcustomdata::TcxCustomDataRelation(ARelationList, AItem) { }
	#pragma option pop
	
};


class DELPHICLASS TcxDBDataFilterCriteriaItem;
class PASCALIMPLEMENTATION TcxDBDataFilterCriteriaItem : public Cxcustomdata::TcxDataFilterCriteriaItem 
{
	typedef Cxcustomdata::TcxDataFilterCriteriaItem inherited;
	
private:
	HIDESBASE TcxDBDataController* __fastcall GetDataController(void);
	TcxDBDataField* __fastcall GetDBField(void);
	
protected:
	virtual TMetaClass* __fastcall GetFilterOperatorClass(void);
	
public:
	__property TcxDBDataController* DataController = {read=GetDataController};
	__property TcxDBDataField* DBField = {read=GetDBField};
public:
	#pragma option push -w-inl
	/* TcxFilterCriteriaItem.Create */ inline __fastcall virtual TcxDBDataFilterCriteriaItem(Cxfilter::TcxFilterCriteriaItemList* AOwner, System::TObject* AItemLink, Cxfilter::TcxFilterOperatorKind AOperatorKind, const Variant &AValue, const AnsiString ADisplayValue) : Cxcustomdata::TcxDataFilterCriteriaItem(AOwner, AItemLink, AOperatorKind, AValue, ADisplayValue) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxFilterCriteriaItem.Destroy */ inline __fastcall virtual ~TcxDBDataFilterCriteriaItem(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxDBDataFilterCriteria;
typedef void __fastcall (__closure *TcxDBDataFilterBeforeChangeEvent)(TcxDBDataFilterCriteria* Sender, Db::TDataSet* ADataSet, const AnsiString AFilterText);

class PASCALIMPLEMENTATION TcxDBDataFilterCriteria : public Cxcustomdata::TcxDataFilterCriteria 
{
	typedef Cxcustomdata::TcxDataFilterCriteria inherited;
	
private:
	bool FAutoDataSetFilter;
	bool FIgnoreOrigin;
	TcxDBDataFilterBeforeChangeEvent FOnBeforeChange;
	TcxDBDataController* __fastcall GetDataController(void);
	void __fastcall SetAutoDataSetFilter(bool Value);
	void __fastcall SetIgnoreOrigin(bool Value);
	
protected:
	virtual TMetaClass* __fastcall GetItemClass(void);
	virtual void __fastcall Update(void);
	
public:
	__fastcall virtual TcxDBDataFilterCriteria(Cxcustomdata::TcxCustomDataController* ADataController);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual void __fastcall AssignEvents(Classes::TPersistent* Source);
	bool __fastcall IsAutoDataSetFilter(void);
	virtual bool __fastcall IsFiltering(void);
	virtual void __fastcall RestoreDefaults(void);
	__property TcxDBDataController* DataController = {read=GetDataController};
	
__published:
	__property bool AutoDataSetFilter = {read=FAutoDataSetFilter, write=SetAutoDataSetFilter, default=0};
	__property DateTimeFormat ;
	__property bool IgnoreOrigin = {read=FIgnoreOrigin, write=SetIgnoreOrigin, default=1};
	__property TcxDBDataFilterBeforeChangeEvent OnBeforeChange = {read=FOnBeforeChange, write=FOnBeforeChange};
public:
	#pragma option push -w-inl
	/* TcxDataFilterCriteria.Destroy */ inline __fastcall virtual ~TcxDBDataFilterCriteria(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxDBDataSummaryItem;
class PASCALIMPLEMENTATION TcxDBDataSummaryItem : public Cxcustomdata::TcxDataSummaryItem 
{
	typedef Cxcustomdata::TcxDataSummaryItem inherited;
	
private:
	TcxDBDataField* FDataField;
	AnsiString FFieldName;
	TcxDBDataController* __fastcall GetDBDataController(void);
	void __fastcall SetFieldName(const AnsiString Value);
	
public:
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	__property TcxDBDataController* DataController = {read=GetDBDataController};
	virtual Cxcustomdata::TcxCustomDataField* __fastcall DataField(void);
	
__published:
	__property AnsiString FieldName = {read=FFieldName, write=SetFieldName};
public:
	#pragma option push -w-inl
	/* TCollectionItem.Create */ inline __fastcall virtual TcxDBDataSummaryItem(Classes::TCollection* Collection) : Cxcustomdata::TcxDataSummaryItem(Collection) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCollectionItem.Destroy */ inline __fastcall virtual ~TcxDBDataSummaryItem(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxDBDataModeController;
typedef bool __fastcall (__closure *TcxDBDataModeControllerDetailIsCurrentQueryEvent)(TcxDBDataModeController* Sender, Db::TDataSet* ADataSet, const AnsiString AMasterDetailKeyFieldNames, const Variant &AMasterDetailKeyValues);

typedef void __fastcall (__closure *TcxDBDataModeControllerDetailFirstEvent)(TcxDBDataModeController* Sender, Db::TDataSet* ADataSet, const AnsiString AMasterDetailKeyFieldNames, const Variant &AMasterDetailKeyValues, bool &AReopened);

class PASCALIMPLEMENTATION TcxDBDataModeController : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	TcxDBDataController* FDataController;
	bool FDetailInSQLMode;
	bool FDetailInSyncMode;
	bool FGridMode;
	int FGridModeBufferCount;
	bool FSmartRefresh;
	bool FSyncInsert;
	bool FSyncMode;
	TcxDBDataModeControllerDetailFirstEvent FOnDetailFirst;
	TcxDBDataModeControllerDetailIsCurrentQueryEvent FOnDetailIsCurrentQuery;
	void __fastcall SetGridMode(bool Value);
	void __fastcall SetGridModeBufferCount(int Value);
	void __fastcall SetSmartRefresh(bool Value);
	void __fastcall SetSyncMode(bool Value);
	
protected:
	virtual bool __fastcall DetailIsCurrentQuery(const AnsiString AMasterDetailKeyFieldNames, const Variant &AMasterDetailKeyValues);
	virtual void __fastcall DoDetailFirst(const AnsiString AMasterDetailKeyFieldNames, const Variant &AMasterDetailKeyValues, bool &AReopened);
	__property bool DetailInSyncMode = {read=FDetailInSyncMode, write=FDetailInSyncMode, default=1};
	
public:
	__fastcall TcxDBDataModeController(TcxDBDataController* ADataController);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	__property TcxDBDataController* DataController = {read=FDataController};
	__property bool SyncInsert = {read=FSyncInsert, write=FSyncInsert, default=1};
	
__published:
	__property bool DetailInSQLMode = {read=FDetailInSQLMode, write=FDetailInSQLMode, default=0};
	__property bool GridMode = {read=FGridMode, write=SetGridMode, default=0};
	__property int GridModeBufferCount = {read=FGridModeBufferCount, write=SetGridModeBufferCount, default=0};
	__property bool SmartRefresh = {read=FSmartRefresh, write=SetSmartRefresh, default=0};
	__property bool SyncMode = {read=FSyncMode, write=SetSyncMode, default=1};
	__property TcxDBDataModeControllerDetailFirstEvent OnDetailFirst = {read=FOnDetailFirst, write=FOnDetailFirst};
	__property TcxDBDataModeControllerDetailIsCurrentQueryEvent OnDetailIsCurrentQuery = {read=FOnDetailIsCurrentQuery, write=FOnDetailIsCurrentQuery};
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxDBDataModeController(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxDBDataSelection;
class PASCALIMPLEMENTATION TcxDBDataSelection : public Cxcustomdata::TcxDataSelection 
{
	typedef Cxcustomdata::TcxDataSelection inherited;
	
private:
	AnsiString FAnchorBookmark;
	Classes::TStrings* FBookmarks;
	bool FInSelectAll;
	TcxDBDataController* __fastcall GetDataController(void);
	
protected:
	virtual void __fastcall ClearAnchor(void);
	int __fastcall CompareBookmarks(const AnsiString AItem1, const AnsiString AItem2);
	virtual void __fastcall InternalAdd(int AIndex, int ARowIndex, int ARecordIndex, int ALevel);
	virtual void __fastcall InternalClear(void);
	virtual void __fastcall InternalDelete(int AIndex);
	bool __fastcall FindBookmark(const AnsiString ABookmark, int &AIndex);
	AnsiString __fastcall GetRowBookmark(int ARowIndex);
	bool __fastcall RefreshBookmarks(void);
	void __fastcall SyncCount(void);
	
public:
	__fastcall virtual TcxDBDataSelection(Cxcustomdata::TcxCustomDataController* ADataController);
	__fastcall virtual ~TcxDBDataSelection(void);
	virtual bool __fastcall FindByRowIndex(int ARowIndex, int &AIndex);
	void __fastcall SelectAll(void);
	void __fastcall SelectFromAnchor(AnsiString AToBookmark, bool AKeepSelection);
	__property TcxDBDataController* DataController = {read=GetDataController};
};


typedef void __fastcall (__closure *TcxDBDataDetailHasChildrenEvent)(TcxDBDataController* Sender, int ARecordIndex, int ARelationIndex, const AnsiString AMasterDetailKeyFieldNames, const Variant &AMasterDetailKeyValues, bool &HasChildren);

class PASCALIMPLEMENTATION TcxDBDataController : public Cxcustomdata::TcxCustomDataController 
{
	typedef Cxcustomdata::TcxCustomDataController inherited;
	
private:
	AnsiString FBookmark;
	TcxDBDataModeController* FDataModeController;
	AnsiString FDetailKeyFieldNames;
	bool FInCheckBrowseMode;
	bool FInCheckCurrentQuery;
	bool FInResetDataSetCurrent;
	TcxDBDataField* FKeyField;
	AnsiString FKeyFieldNames;
	Classes::TList* FMasterDetailKeyFields;
	Variant FMasterDetailKeyValues;
	AnsiString FMasterKeyFieldNames;
	bool FResetDBFields;
	bool FUpdateDataSetPos;
	TcxDBDataDetailHasChildrenEvent FOnDetailHasChildren;
	TcxDBDataField* __fastcall AddInternalDBField(void);
	Db::TDataSet* __fastcall GetDataSet(void);
	int __fastcall GetDataSetRecordCount(void);
	Db::TDataSource* __fastcall GetDataSource(void);
	TcxDBDataField* __fastcall GetDBField(int Index);
	TcxDBDataSelection* __fastcall GetDBSelection(void);
	TcxDBDataFilterCriteria* __fastcall GetFilter(void);
	AnsiString __fastcall GetMasterDetailKeyFieldNames();
	Classes::TList* __fastcall GetMasterDetailKeyFields(void);
	TcxDBDataProvider* __fastcall GetProvider(void);
	int __fastcall GetRecNo(void);
	void __fastcall MasterDetailKeyFieldsRemoveNotification(Classes::TComponent* AComponent);
	void __fastcall RemoveKeyField(void);
	void __fastcall SetDataModeController(TcxDBDataModeController* Value);
	void __fastcall SetDataSource(Db::TDataSource* Value);
	void __fastcall SetDetailKeyFieldNames(const AnsiString Value);
	HIDESBASE void __fastcall SetFilter(TcxDBDataFilterCriteria* Value);
	void __fastcall SetKeyFieldNames(const AnsiString Value);
	void __fastcall SetMasterKeyFieldNames(const AnsiString Value);
	void __fastcall SetRecNo(int Value);
	void __fastcall SyncDataSetPos(void);
	Cxcustomdata::TcxCustomDataController* __fastcall SyncMasterDetail(void);
	void __fastcall SyncMasterDetailDataSetPos(void);
	void __fastcall UpdateRelationFields(void);
	
protected:
	virtual bool __fastcall CanChangeDetailExpanding(int ARecordIndex, bool AExpanded);
	virtual bool __fastcall CanFocusRecord(int ARecordIndex);
	virtual void __fastcall CheckBrowseMode(void);
	virtual bool __fastcall CheckMasterBrowseMode(void);
	void __fastcall ClearMasterDetailKeyFields(void);
	virtual void __fastcall CorrectAfterDelete(int ARecordIndex);
	virtual void __fastcall DoDataSourceChanged(void);
	virtual void __fastcall DoInitInsertingRecord(int AInsertingRecordIndex);
	virtual bool __fastcall DoSearchInGridMode(const AnsiString ASubText, bool AForward, bool ANext);
	virtual int __fastcall GetActiveRecordIndex(void);
	virtual TMetaClass* __fastcall GetDataProviderClass(void);
	virtual TMetaClass* __fastcall GetDataSelectionClass(void);
	virtual int __fastcall GetDefaultGridModeBufferCount(void);
	virtual TMetaClass* __fastcall GetFieldClass(void);
	virtual TMetaClass* __fastcall GetFilterCriteriaClass(void);
	Variant __fastcall GetInternalRecordId(int ARecordIndex, Classes::TList* AList);
	void __fastcall GetKeyFields(Classes::TList* AList);
	virtual TMetaClass* __fastcall GetRelationClass(void);
	virtual TMetaClass* __fastcall GetSummaryItemClass(void);
	virtual bool __fastcall InternalCheckBookmark(int ADeletedRecordIndex);
	virtual void __fastcall InternalClearBookmark(void);
	virtual void __fastcall InternalGotoBookmark(void);
	virtual bool __fastcall InternalSaveBookmark(void);
	virtual void __fastcall InvalidateDataBuffer(void);
	virtual bool __fastcall IsDataField(Cxcustomdata::TcxCustomDataField* AField);
	bool __fastcall IsKeyNavigation(void);
	bool __fastcall IsOtherDetailChanged(void);
	bool __fastcall IsOtherDetailCreating(void);
	virtual bool __fastcall IsProviderDataSource(void);
	virtual void __fastcall LoadStorage(void);
	virtual int __fastcall LocateRecordIndex(TGetListProc AGetFieldsProc);
	virtual void __fastcall NotifyDataControllers(void);
	virtual void __fastcall PrepareField(Cxcustomdata::TcxCustomDataField* AField);
	virtual void __fastcall RemoveNotification(Classes::TComponent* AComponent);
	void __fastcall ResetDataSetCurrent(Cxcustomdata::TcxCustomDataController* ADataController);
	void __fastcall ResetDBFields(void);
	virtual void __fastcall RestructData(void);
	void __fastcall ResyncDBFields(void);
	void __fastcall RetrieveField(TcxDBDataField* ADataField, bool AIsLookupKeyOnly);
	void __fastcall UpdateEditingRecord(void);
	void __fastcall UpdateField(TcxDBDataField* ADataField, const AnsiString AFieldNames, bool AIsLookup);
	virtual void __fastcall UpdateFields(void);
	virtual void __fastcall UpdateFocused(void);
	void __fastcall UpdateInternalKeyFields(const AnsiString AFieldNames, TcxDBDataField* &AField);
	void __fastcall UpdateLookupFields(void);
	virtual void __fastcall UpdateRelations(Cxcustomdata::TcxCustomDataRelation* ARelation);
	virtual void __fastcall UpdateScrollBars(void);
	__property TcxDBDataField* DBFields[int Index] = {read=GetDBField};
	__property TcxDBDataSelection* DBSelection = {read=GetDBSelection};
	__property TcxDBDataField* KeyField = {read=FKeyField};
	__property AnsiString MasterDetailKeyFieldNames = {read=GetMasterDetailKeyFieldNames};
	__property Classes::TList* MasterDetailKeyFields = {read=GetMasterDetailKeyFields};
	__property Variant MasterDetailKeyValues = {read=FMasterDetailKeyValues};
	
public:
	__fastcall virtual TcxDBDataController(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxDBDataController(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual bool __fastcall ExecuteAction(Classes::TBasicAction* Action);
	virtual bool __fastcall UpdateAction(Classes::TBasicAction* Action);
	void __fastcall ChangeFieldName(int AItemIndex, const AnsiString AFieldName);
	virtual void __fastcall ChangeValueTypeClass(int AItemIndex, TMetaClass* AValueTypeClass);
	System::TObject* __fastcall GetItemByFieldName(const AnsiString AFieldName);
	Db::TField* __fastcall GetItemField(int AItemIndex);
	AnsiString __fastcall GetItemFieldName(int AItemIndex);
	virtual void __fastcall Loaded(void);
	void __fastcall BeginLocate(void);
	void __fastcall EndLocate(void);
	void __fastcall DoUpdateRecord(int ARecordIndex);
	virtual Variant __fastcall GetGroupValue(int ARecordIndex, Cxcustomdata::TcxCustomDataField* AField);
	Variant __fastcall GetRecordId(int ARecordIndex);
	void __fastcall UpdateGridModeBufferCount(void);
	virtual void __fastcall RefreshExternalData(void);
	virtual bool __fastcall IsBookmarkAvailable(void);
	virtual bool __fastcall IsBookmarkRow(int ARowIndex);
	virtual Variant __fastcall GetFilterDataValue(int ARecordIndex, Cxcustomdata::TcxCustomDataField* AField);
	virtual AnsiString __fastcall GetFilterItemFieldName(System::TObject* AItem);
	int __fastcall FindRecordIndexByKey(const Variant &AKeyFieldValues);
	bool __fastcall LocateByKey(const Variant &AKeyFieldValues);
	void __fastcall CheckCurrentQuery(void);
	virtual TcxDBProviderDetailFilterAdapter* __fastcall GetDetailFilterAdapter(void);
	virtual void __fastcall SetMasterRelation(Cxcustomdata::TcxCustomDataRelation* AMasterRelation, int AMasterRecordIndex);
	AnsiString __fastcall GetSelectedBookmark(int Index);
	virtual int __fastcall GetSelectedRowIndex(int Index);
	AnsiString __fastcall GetSelectionAnchorBookmark();
	virtual int __fastcall GetSelectionAnchorRowIndex(void);
	virtual bool __fastcall IsSelectionAnchorExist(void);
	virtual void __fastcall SelectAll(void);
	virtual void __fastcall SelectFromAnchor(int ARowIndex, bool AKeepSelection);
	virtual void __fastcall SetSelectionAnchor(int ARowIndex);
	virtual void __fastcall ForEachRow(bool ASelectedRows, Cxcustomdata::TcxDataControllerEachRowProc AProc);
	bool __fastcall IsSequenced(void);
	__property TcxDBDataModeController* DataModeController = {read=FDataModeController, write=SetDataModeController};
	__property Db::TDataSet* DataSet = {read=GetDataSet};
	__property Db::TDataSource* DataSource = {read=GetDataSource, write=SetDataSource};
	__property AnsiString DetailKeyFieldNames = {read=FDetailKeyFieldNames, write=SetDetailKeyFieldNames};
	__property TcxDBDataFilterCriteria* Filter = {read=GetFilter, write=SetFilter};
	__property AnsiString KeyFieldNames = {read=FKeyFieldNames, write=SetKeyFieldNames};
	__property AnsiString MasterKeyFieldNames = {read=FMasterKeyFieldNames, write=SetMasterKeyFieldNames};
	__property TcxDBDataProvider* Provider = {read=GetProvider};
	__property int RecNo = {read=GetRecNo, write=SetRecNo, nodefault};
	__property int DataSetRecordCount = {read=GetDataSetRecordCount, nodefault};
	__property TcxDBDataDetailHasChildrenEvent OnDetailHasChildren = {read=FOnDetailHasChildren, write=FOnDetailHasChildren};
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE Cxdb::TcxDBAdapterList* cxDetailFilterControllers;
extern PACKAGE TMetaClass* __fastcall GetValueTypeClassByField(Db::TField* AField);

}	/* namespace Cxdbdata */
using namespace Cxdbdata;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxDBData
