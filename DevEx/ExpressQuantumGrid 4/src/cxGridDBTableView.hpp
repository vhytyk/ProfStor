// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxGridDBTableView.pas' rev: 6.00

#ifndef cxGridDBTableViewHPP
#define cxGridDBTableViewHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxClasses.hpp>	// Pascal unit
#include <cxGridCustomView.hpp>	// Pascal unit
#include <cxDBData.hpp>	// Pascal unit
#include <cxCustomData.hpp>	// Pascal unit
#include <cxStorage.hpp>	// Pascal unit
#include <cxGridDBDataDefinitions.hpp>	// Pascal unit
#include <cxGridTableView.hpp>	// Pascal unit
#include <cxGridCustomTableView.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxgriddbtableview
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxGridDBColumn;
class PASCALIMPLEMENTATION TcxGridDBColumn : public Cxgridtableview::TcxGridColumn 
{
	typedef Cxgridtableview::TcxGridColumn inherited;
	
private:
	Cxgriddbdatadefinitions::TcxGridItemDBDataBinding* __fastcall GetDataBinding(void);
	HIDESBASE void __fastcall SetDataBinding(Cxgriddbdatadefinitions::TcxGridItemDBDataBinding* Value);
	
protected:
	virtual bool __fastcall GetStoredProperties(Classes::TStrings* AProperties);
	virtual void __fastcall GetPropertyValue(const AnsiString AName, Variant &AValue);
	virtual void __fastcall SetPropertyValue(const AnsiString AName, const Variant &AValue);
	
__published:
	__property Cxgriddbdatadefinitions::TcxGridItemDBDataBinding* DataBinding = {read=GetDataBinding, write=SetDataBinding};
public:
	#pragma option push -w-inl
	/* TcxGridColumn.Create */ inline __fastcall virtual TcxGridDBColumn(Classes::TComponent* AOwner) : Cxgridtableview::TcxGridColumn(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxGridColumn.Destroy */ inline __fastcall virtual ~TcxGridDBColumn(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridDBTableSummaryItem;
class PASCALIMPLEMENTATION TcxGridDBTableSummaryItem : public Cxdbdata::TcxDBDataSummaryItem 
{
	typedef Cxdbdata::TcxDBDataSummaryItem inherited;
	
private:
	TcxGridDBColumn* __fastcall GetColumn(void);
	void __fastcall SetColumn(TcxGridDBColumn* Value);
	
protected:
	HRESULT __stdcall QueryInterface(const GUID &IID, /* out */ void *Obj);
	int __stdcall _AddRef(void);
	int __stdcall _Release(void);
	AnsiString __fastcall GetObjectName();
	bool __fastcall GetProperties(Classes::TStrings* AProperties);
	void __fastcall GetPropertyValue(const AnsiString AName, Variant &AValue);
	void __fastcall SetPropertyValue(const AnsiString AName, const Variant &AValue);
	
__published:
	__property TcxGridDBColumn* Column = {read=GetColumn, write=SetColumn};
public:
	#pragma option push -w-inl
	/* TCollectionItem.Create */ inline __fastcall virtual TcxGridDBTableSummaryItem(Classes::TCollection* Collection) : Cxdbdata::TcxDBDataSummaryItem(Collection) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCollectionItem.Destroy */ inline __fastcall virtual ~TcxGridDBTableSummaryItem(void) { }
	#pragma option pop
	
private:
	void *__IcxStoredObject;	/* Cxstorage::IcxStoredObject */
	
public:
	operator IcxStoredObject*(void) { return (IcxStoredObject*)&__IcxStoredObject; }
	
};


class DELPHICLASS TcxGridDBTableView;
class PASCALIMPLEMENTATION TcxGridDBTableView : public Cxgridtableview::TcxGridTableView 
{
	typedef Cxgridtableview::TcxGridTableView inherited;
	
private:
	HIDESBASE TcxGridDBColumn* __fastcall GetColumn(int Index);
	HIDESBASE Cxgriddbdatadefinitions::TcxGridDBDataController* __fastcall GetDataController(void);
	HIDESBASE void __fastcall SetColumn(int Index, TcxGridDBColumn* Value);
	HIDESBASE void __fastcall SetDataController(Cxgriddbdatadefinitions::TcxGridDBDataController* Value);
	
protected:
	virtual TMetaClass* __fastcall GetDataControllerClass(void);
	virtual TMetaClass* __fastcall GetItemClass(void);
	virtual TMetaClass* __fastcall GetSummaryItemClass(void);
	
public:
	HIDESBASE TcxGridDBColumn* __fastcall CreateColumn(void);
	TcxGridDBColumn* __fastcall GetColumnByFieldName(const AnsiString AFieldName);
	__property TcxGridDBColumn* Columns[int Index] = {read=GetColumn, write=SetColumn};
	
__published:
	__property Cxgriddbdatadefinitions::TcxGridDBDataController* DataController = {read=GetDataController, write=SetDataController};
public:
	#pragma option push -w-inl
	/* TcxGridTableView.Destroy */ inline __fastcall virtual ~TcxGridDBTableView(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomGridView.Create */ inline __fastcall virtual TcxGridDBTableView(Classes::TComponent* AOwner) : Cxgridtableview::TcxGridTableView(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxControlChildComponent.CreateEx */ inline __fastcall TcxGridDBTableView(Cxcontrols::TcxControl* AControl, bool AAssignOwner) : Cxgridtableview::TcxGridTableView(AControl, AAssignOwner) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxgriddbtableview */
using namespace Cxgriddbtableview;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxGridDBTableView
