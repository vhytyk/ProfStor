// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxGridDBBandedTableView.pas' rev: 6.00

#ifndef cxGridDBBandedTableViewHPP
#define cxGridDBBandedTableViewHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxClasses.hpp>	// Pascal unit
#include <cxGridCustomView.hpp>	// Pascal unit
#include <cxGridTableView.hpp>	// Pascal unit
#include <cxGridBandedTableView.hpp>	// Pascal unit
#include <cxGridDBDataDefinitions.hpp>	// Pascal unit
#include <cxGridCustomTableView.hpp>	// Pascal unit
#include <cxDBData.hpp>	// Pascal unit
#include <cxCustomData.hpp>	// Pascal unit
#include <cxStorage.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxgriddbbandedtableview
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxGridDBBandedColumn;
class PASCALIMPLEMENTATION TcxGridDBBandedColumn : public Cxgridbandedtableview::TcxGridBandedColumn 
{
	typedef Cxgridbandedtableview::TcxGridBandedColumn inherited;
	
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
	/* TcxGridBandedColumn.Destroy */ inline __fastcall virtual ~TcxGridDBBandedColumn(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxGridColumn.Create */ inline __fastcall virtual TcxGridDBBandedColumn(Classes::TComponent* AOwner) : Cxgridbandedtableview::TcxGridBandedColumn(AOwner) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridDBBandedTableSummaryItem;
class PASCALIMPLEMENTATION TcxGridDBBandedTableSummaryItem : public Cxdbdata::TcxDBDataSummaryItem 
{
	typedef Cxdbdata::TcxDBDataSummaryItem inherited;
	
private:
	TcxGridDBBandedColumn* __fastcall GetColumn(void);
	void __fastcall SetColumn(TcxGridDBBandedColumn* Value);
	
protected:
	HRESULT __stdcall QueryInterface(const GUID &IID, /* out */ void *Obj);
	int __stdcall _AddRef(void);
	int __stdcall _Release(void);
	AnsiString __fastcall GetObjectName();
	bool __fastcall GetProperties(Classes::TStrings* AProperties);
	void __fastcall GetPropertyValue(const AnsiString AName, Variant &AValue);
	void __fastcall SetPropertyValue(const AnsiString AName, const Variant &AValue);
	
__published:
	__property TcxGridDBBandedColumn* Column = {read=GetColumn, write=SetColumn};
public:
	#pragma option push -w-inl
	/* TCollectionItem.Create */ inline __fastcall virtual TcxGridDBBandedTableSummaryItem(Classes::TCollection* Collection) : Cxdbdata::TcxDBDataSummaryItem(Collection) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCollectionItem.Destroy */ inline __fastcall virtual ~TcxGridDBBandedTableSummaryItem(void) { }
	#pragma option pop
	
private:
	void *__IcxStoredObject;	/* Cxstorage::IcxStoredObject */
	
public:
	operator IcxStoredObject*(void) { return (IcxStoredObject*)&__IcxStoredObject; }
	
};


class DELPHICLASS TcxGridDBBandedTableView;
class PASCALIMPLEMENTATION TcxGridDBBandedTableView : public Cxgridbandedtableview::TcxGridBandedTableView 
{
	typedef Cxgridbandedtableview::TcxGridBandedTableView inherited;
	
private:
	HIDESBASE TcxGridDBBandedColumn* __fastcall GetColumn(int Index);
	HIDESBASE Cxgriddbdatadefinitions::TcxGridDBDataController* __fastcall GetDataController(void);
	HIDESBASE void __fastcall SetColumn(int Index, TcxGridDBBandedColumn* Value);
	HIDESBASE void __fastcall SetDataController(Cxgriddbdatadefinitions::TcxGridDBDataController* Value);
	
protected:
	virtual TMetaClass* __fastcall GetDataControllerClass(void);
	virtual TMetaClass* __fastcall GetItemClass(void);
	virtual TMetaClass* __fastcall GetSummaryItemClass(void);
	
public:
	HIDESBASE TcxGridDBBandedColumn* __fastcall CreateColumn(void);
	TcxGridDBBandedColumn* __fastcall GetColumnByFieldName(const AnsiString AFieldName);
	__property TcxGridDBBandedColumn* Columns[int Index] = {read=GetColumn, write=SetColumn};
	
__published:
	__property Cxgriddbdatadefinitions::TcxGridDBDataController* DataController = {read=GetDataController, write=SetDataController};
public:
	#pragma option push -w-inl
	/* TcxGridBandedTableView.Create */ inline __fastcall virtual TcxGridDBBandedTableView(Classes::TComponent* AOwner) : Cxgridbandedtableview::TcxGridBandedTableView(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxGridTableView.Destroy */ inline __fastcall virtual ~TcxGridDBBandedTableView(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxControlChildComponent.CreateEx */ inline __fastcall TcxGridDBBandedTableView(Cxcontrols::TcxControl* AControl, bool AAssignOwner) : Cxgridbandedtableview::TcxGridBandedTableView(AControl, AAssignOwner) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxgriddbbandedtableview */
using namespace Cxgriddbbandedtableview;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxGridDBBandedTableView
