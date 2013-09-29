// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxDB.pas' rev: 6.00

#ifndef cxDBHPP
#define cxDBHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxDataUtils.hpp>	// Pascal unit
#include <DB.hpp>	// Pascal unit
#include <Variants.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxdb
{
//-- type declarations -------------------------------------------------------
typedef TMetaClass*TDataSetClass;

class DELPHICLASS TcxDBAdapterItem;
class PASCALIMPLEMENTATION TcxDBAdapterItem : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	TMetaClass*FDataSetClass;
	
public:
	__fastcall TcxDBAdapterItem(TMetaClass* ADataSetClass);
	__property TMetaClass* DataSetClass = {read=FDataSetClass};
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxDBAdapterItem(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxDBAdapterItemClass;

class DELPHICLASS TcxDBAdapterList;
class PASCALIMPLEMENTATION TcxDBAdapterList : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	TcxDBAdapterItem* operator[](int Index) { return Items[Index]; }
	
private:
	Classes::TList* FItems;
	TcxDBAdapterItem* __fastcall GetItem(int Index);
	int __fastcall GetItemCount(void);
	
public:
	__fastcall TcxDBAdapterList(void);
	__fastcall virtual ~TcxDBAdapterList(void);
	void __fastcall Clear(void);
	virtual bool __fastcall FindAdapter(TMetaClass* ADataSetClass, int &AIndex);
	virtual void __fastcall RegisterAdapter(TMetaClass* ADataSetClass, TMetaClass* AItemClass);
	virtual void __fastcall UnregisterAdapter(TMetaClass* ADataSetClass, TMetaClass* AItemClass);
	__property int ItemCount = {read=GetItemCount, nodefault};
	__property TcxDBAdapterItem* Items[int Index] = {read=GetItem/*, default*/};
};


class DELPHICLASS TcxCustomFieldDataLink;
class DELPHICLASS TcxCustomDBDataBinding;
typedef TMetaClass*TcxCustomFieldDataLinkClass;

class PASCALIMPLEMENTATION TcxCustomDBDataBinding : public Cxdatautils::TcxCustomDataBinding 
{
	typedef Cxdatautils::TcxCustomDataBinding inherited;
	
private:
	int FRefreshCount;
	AnsiString __fastcall GetDataField();
	Db::TDataSource* __fastcall GetDataSource(void);
	Db::TField* __fastcall GetField(void);
	void __fastcall InternalDataChange(void);
	void __fastcall SetDataField(const AnsiString Value);
	void __fastcall SetDataSource(Db::TDataSource* Value);
	
protected:
	TcxCustomFieldDataLink* FDataLink;
	virtual bool __fastcall ExecuteAction(Classes::TBasicAction* Action);
	virtual bool __fastcall GetModified(void);
	virtual bool __fastcall GetReadOnly(void);
	virtual void __fastcall SetReadOnly(bool Value);
	virtual bool __fastcall UpdateAction(Classes::TBasicAction* Action);
	virtual void __fastcall VisualControlChanged(void);
	void __fastcall DisableRefresh(void);
	void __fastcall EnableRefresh(void);
	virtual TMetaClass* __fastcall GetDataLinkClass(void);
	bool __fastcall IsRefreshDisabled(void);
	__property TcxCustomFieldDataLink* DataLink = {read=FDataLink};
	
public:
	__fastcall virtual TcxCustomDBDataBinding(Classes::TComponent* AOwner, Classes::TComponent* ADataComponent);
	__fastcall virtual ~TcxCustomDBDataBinding(void);
	virtual bool __fastcall CanModify(void);
	virtual Variant __fastcall GetStoredValue(Cxdatautils::TcxDataEditValueSource AValueSource, bool AFocused);
	virtual bool __fastcall IsDataSourceLive(void);
	virtual void __fastcall Reset(void);
	virtual bool __fastcall SetEditMode(void);
	virtual void __fastcall SetStoredValue(Cxdatautils::TcxDataEditValueSource AValueSource, const Variant &Value);
	virtual void __fastcall UpdateDataSource(void);
	__property Db::TField* Field = {read=GetField};
	__property Db::TDataSource* DataSource = {read=GetDataSource, write=SetDataSource};
	__property AnsiString DataField = {read=GetDataField, write=SetDataField};
};


class PASCALIMPLEMENTATION TcxCustomFieldDataLink : public Db::TDataLink 
{
	typedef Db::TDataLink inherited;
	
private:
	Db::TField* FField;
	AnsiString FFieldName;
	bool FEditing;
	bool FModified;
	bool __fastcall GetCanModify(void);
	Classes::TComponent* __fastcall GetDataComponent(void);
	HIDESBASE void __fastcall SetEditing(bool Value);
	void __fastcall SetField(Db::TField* Value);
	void __fastcall SetFieldName(const AnsiString Value);
	void __fastcall UpdateField(void);
	
protected:
	TcxCustomDBDataBinding* FDataBinding;
	virtual void __fastcall ActiveChanged(void);
	virtual void __fastcall DataEvent(Db::TDataEvent Event, int Info);
	virtual void __fastcall EditingChanged(void);
	virtual void __fastcall LayoutChanged(void);
	virtual void __fastcall RecordChanged(Db::TField* Field);
	virtual void __fastcall UpdateData(void);
	virtual void __fastcall DataComponentChanged(void);
	virtual void __fastcall UpdateRightToLeft(void);
	virtual void __fastcall VisualControlChanged(void);
	__property TcxCustomDBDataBinding* DataBinding = {read=FDataBinding};
	__property Classes::TComponent* DataComponent = {read=GetDataComponent};
	
public:
	__fastcall TcxCustomFieldDataLink(TcxCustomDBDataBinding* ADataBinding);
	HIDESBASE bool __fastcall Edit(void);
	void __fastcall Modified(void);
	void __fastcall Reset(void);
	__property bool CanModify = {read=GetCanModify, nodefault};
	__property bool Editing = {read=FEditing, nodefault};
	__property Db::TField* Field = {read=FField};
	__property AnsiString FieldName = {read=FFieldName, write=SetFieldName};
public:
	#pragma option push -w-inl
	/* TDataLink.Destroy */ inline __fastcall virtual ~TcxCustomFieldDataLink(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE bool __fastcall CanModifyLookupField(Db::TField* AField);
extern PACKAGE void __fastcall CheckFilterFieldName(AnsiString &AFieldName);
extern PACKAGE Variant __fastcall GetDataSetValues(Db::TDataSet* ADataSet, Classes::TList* AFields);
extern PACKAGE AnsiString __fastcall GetFilterFieldName(Db::TField* AField, bool AIgnoreOrigin);
extern PACKAGE bool __fastcall IsEqualFieldNames(const AnsiString AFieldName1, const AnsiString AFieldName2);
extern PACKAGE bool __fastcall IsFieldCanModify(Db::TField* AField, bool AIsValueSource);
extern PACKAGE bool __fastcall IsFieldFormatted(Db::TField* AField, bool AIsTextEdit);
extern PACKAGE bool __fastcall IsMultipleFieldNames(const AnsiString AFieldNames);
extern PACKAGE int __fastcall GetFieldNamesCount(const AnsiString AFieldNames);
extern PACKAGE void __fastcall GetFieldNames(const AnsiString AFieldNames, Classes::TStrings* AList);
extern PACKAGE void __fastcall SetDataSetValues(Db::TDataSet* ADataSet, Classes::TList* AFields, const Variant &AValues);

}	/* namespace Cxdb */
using namespace Cxdb;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxDB
