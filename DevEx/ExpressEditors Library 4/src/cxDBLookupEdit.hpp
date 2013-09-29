// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxDBLookupEdit.pas' rev: 6.00

#ifndef cxDBLookupEditHPP
#define cxDBLookupEditHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxControls.hpp>	// Pascal unit
#include <cxTextEdit.hpp>	// Pascal unit
#include <cxMaskEdit.hpp>	// Pascal unit
#include <cxDropDownEdit.hpp>	// Pascal unit
#include <cxLookupEdit.hpp>	// Pascal unit
#include <cxDBData.hpp>	// Pascal unit
#include <cxCustomData.hpp>	// Pascal unit
#include <cxDataStorage.hpp>	// Pascal unit
#include <cxDataUtils.hpp>	// Pascal unit
#include <cxDB.hpp>	// Pascal unit
#include <cxEditConsts.hpp>	// Pascal unit
#include <cxDBEdit.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <DB.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Variants.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxdblookupedit
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxCustomDBLookupEditLookupData;
class DELPHICLASS TcxCustomDBLookupEditProperties;
class PASCALIMPLEMENTATION TcxCustomDBLookupEditLookupData : public Cxlookupedit::TcxCustomLookupEditLookupData 
{
	typedef Cxlookupedit::TcxCustomLookupEditLookupData inherited;
	
private:
	HIDESBASE Cxdbdata::TcxDBDataController* __fastcall GetDataController(void);
	HIDESBASE TcxCustomDBLookupEditProperties* __fastcall GetProperties(void);
	
protected:
	virtual void __fastcall DoSetCurrentKey(int ARecordIndex);
	virtual void __fastcall DoSyncGrid(void);
	__property Cxdbdata::TcxDBDataController* DataController = {read=GetDataController};
	__property TcxCustomDBLookupEditProperties* Properties = {read=GetProperties};
public:
	#pragma option push -w-inl
	/* TcxCustomLookupEditLookupData.Create */ inline __fastcall virtual TcxCustomDBLookupEditLookupData(Classes::TPersistent* AOwner) : Cxlookupedit::TcxCustomLookupEditLookupData(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxCustomDBLookupEditLookupData(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxCustomDBLookupEditProperties : public Cxlookupedit::TcxCustomLookupEditProperties 
{
	typedef Cxlookupedit::TcxCustomLookupEditProperties inherited;
	
private:
	int FLockGridModeCount;
	Db::TField* FLookupField;
	Cxdatastorage::TcxLookupList* FLookupList;
	Db::TDataSource* FLookupSource;
	bool FSyncLookup;
	bool __fastcall GetIsUseLookupList(void);
	AnsiString __fastcall GetKeyFieldNames();
	Db::TField* __fastcall GetListField(void);
	int __fastcall GetListFieldIndex(void);
	AnsiString __fastcall GetListFieldNames();
	void __fastcall SetIsUseLookupList(bool Value);
	void __fastcall SetKeyFieldNames(const AnsiString Value);
	void __fastcall SetListFieldIndex(int Value);
	void __fastcall SetListFieldNames(const AnsiString Value);
	
protected:
	virtual void __fastcall DBLookupGridBeginUpdate(void);
	virtual void __fastcall DBLookupGridCheckColumnByFieldName(const AnsiString AFieldName);
	virtual void __fastcall DBLookupGridCreateColumnsByFieldNames(const AnsiString AFieldNames);
	virtual void __fastcall DBLookupGridEndUpdate(void);
	virtual Db::TField* __fastcall GetDBLookupGridColumnField(int AIndex);
	virtual AnsiString __fastcall GetDBLookupGridColumnFieldName(int AIndex);
	virtual int __fastcall GetDBLookupGridColumnIndexByFieldName(const AnsiString AFieldName);
	virtual Cxdbdata::TcxDBDataController* __fastcall GetDBLookupGridDataController(void);
	virtual void __fastcall Changed(void);
	virtual void __fastcall CheckLookup(void);
	virtual void __fastcall CheckLookupColumn(void);
	void __fastcall CheckLookupList(void);
	void __fastcall DefineByLookupError(void);
	virtual int __fastcall FindByText(int AItemIndex, const AnsiString AText, bool APartialCompare);
	virtual int __fastcall GetDisplayColumnIndex(void);
	virtual AnsiString __fastcall GetDisplayLookupText(const Variant &AKey);
	virtual Classes::TAlignment __fastcall GetDefaultHorzAlignment(void);
	virtual int __fastcall GetDefaultMaxLength(void);
	virtual bool __fastcall GetIncrementalFiltering(void);
	AnsiString __fastcall GetLookupResultFieldName();
	virtual Variant __fastcall GetNullKey();
	virtual bool __fastcall IsPickMode(void);
	virtual void __fastcall LockDataChanged(void);
	virtual void __fastcall SetDisplayColumnIndex(int Value);
	void __fastcall SetLookupField(Db::TField* ALookupField);
	virtual void __fastcall UnlockDataChanged(void);
	__property bool InSyncLookup = {read=FSyncLookup, nodefault};
	__property bool IsUseLookupList = {read=GetIsUseLookupList, write=SetIsUseLookupList, nodefault};
	
public:
	__fastcall virtual ~TcxCustomDBLookupEditProperties(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	/* virtual class method */ virtual TMetaClass* __fastcall GetContainerClass(TMetaClass* vmt);
	Db::TField* __fastcall GetDataField(void);
	virtual Cxdatautils::TcxDataEditValueSource __fastcall GetEditValueSource(bool AEditFocused);
	/* virtual class method */ virtual TMetaClass* __fastcall GetLookupDataClass(TMetaClass* vmt);
	Db::TField* __fastcall GetLookupField(void);
	virtual bool __fastcall IsLookupField(void);
	__property Cxdbdata::TcxDBDataController* DataController = {read=GetDBLookupGridDataController};
	__property AnsiString KeyFieldNames = {read=GetKeyFieldNames, write=SetKeyFieldNames};
	__property Db::TField* ListField = {read=GetListField};
	__property AnsiString ListFieldNames = {read=GetListFieldNames, write=SetListFieldNames, stored=false};
	__property int ListFieldIndex = {read=GetListFieldIndex, write=SetListFieldIndex, default=0};
public:
	#pragma option push -w-inl
	/* TcxCustomLookupEditProperties.Create */ inline __fastcall virtual TcxCustomDBLookupEditProperties(Classes::TPersistent* AOwner) : Cxlookupedit::TcxCustomLookupEditProperties(AOwner) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomDBLookupEdit;
class PASCALIMPLEMENTATION TcxCustomDBLookupEdit : public Cxlookupedit::TcxCustomLookupEdit 
{
	typedef Cxlookupedit::TcxCustomLookupEdit inherited;
	
private:
	HIDESBASE TcxCustomDBLookupEditProperties* __fastcall GetProperties(void);
	HIDESBASE void __fastcall SetProperties(TcxCustomDBLookupEditProperties* Value);
	
protected:
	virtual bool __fastcall IsValidChar(char AChar);
	virtual Variant __fastcall LookupKeyToEditValue(const Variant &AKey);
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetPropertiesClass(TMetaClass* vmt);
	__property TcxCustomDBLookupEditProperties* Properties = {read=GetProperties, write=SetProperties};
public:
	#pragma option push -w-inl
	/* TcxCustomLookupEdit.Create */ inline __fastcall virtual TcxCustomDBLookupEdit(Classes::TComponent* AOwner)/* overload */ : Cxlookupedit::TcxCustomLookupEdit(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomDropDownEdit.Destroy */ inline __fastcall virtual ~TcxCustomDBLookupEdit(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomDBLookupEdit(HWND ParentWindow) : Cxlookupedit::TcxCustomLookupEdit(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE bool __fastcall IsLinkedToDataSet(Db::TDataSource* ADataSource, Db::TDataSet* ADataSet);

}	/* namespace Cxdblookupedit */
using namespace Cxdblookupedit;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxDBLookupEdit
