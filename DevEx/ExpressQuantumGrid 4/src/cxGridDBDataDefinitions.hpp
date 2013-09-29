// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxGridDBDataDefinitions.pas' rev: 6.00

#ifndef cxGridDBDataDefinitionsHPP
#define cxGridDBDataDefinitionsHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxDBEdit.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxDataUtils.hpp>	// Pascal unit
#include <cxDBData.hpp>	// Pascal unit
#include <cxFilter.hpp>	// Pascal unit
#include <cxCustomData.hpp>	// Pascal unit
#include <cxGridCustomTableView.hpp>	// Pascal unit
#include <cxGridCustomView.hpp>	// Pascal unit
#include <DB.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxgriddbdatadefinitions
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxGridDBDefaultValuesProvider;
class PASCALIMPLEMENTATION TcxGridDBDefaultValuesProvider : public Cxdbedit::TcxCustomDBEditDefaultValuesProvider 
{
	typedef Cxdbedit::TcxCustomDBEditDefaultValuesProvider inherited;
	
public:
	virtual bool __fastcall IsDisplayFormatDefined(bool AIsCurrencyValueAccepted);
public:
	#pragma option push -w-inl
	/* TcxCustomDBEditDefaultValuesProvider.Create */ inline __fastcall virtual TcxGridDBDefaultValuesProvider(Classes::TPersistent* AOwner) : Cxdbedit::TcxCustomDBEditDefaultValuesProvider(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomDBEditDefaultValuesProvider.Destroy */ inline __fastcall virtual ~TcxGridDBDefaultValuesProvider(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridDBDataController;
class PASCALIMPLEMENTATION TcxGridDBDataController : public Cxdbdata::TcxDBDataController 
{
	typedef Cxdbdata::TcxDBDataController inherited;
	
private:
	Cxgridcustomtableview::TcxCustomGridTableController* __fastcall GetController(void);
	Cxgridcustomtableview::TcxCustomGridTableView* __fastcall GetGridViewValue(void);
	
protected:
	void __fastcall GetFakeComponentLinks(Classes::TList* AList);
	Cxgridcustomview::TcxCustomGridView* __fastcall GetGridView(void);
	void __fastcall CheckGridModeBufferCount(void);
	bool __fastcall DoScroll(bool AForward);
	bool __fastcall DoScrollPage(bool AForward);
	bool __fastcall GetFilterPropertyValue(const AnsiString AName, Variant &AValue);
	TMetaClass* __fastcall GetItemDataBindingClass(void);
	TMetaClass* __fastcall GetItemDefaultValuesProviderClass(void);
	bool __fastcall GetNavigatorIsBof(void);
	bool __fastcall GetNavigatorIsEof(void);
	int __fastcall GetScrollBarPos(void);
	int __fastcall GetScrollBarRecordCount(void);
	bool __fastcall SetFilterPropertyValue(const AnsiString AName, const Variant &AValue);
	bool __fastcall SetScrollBarPos(int Value);
	virtual bool __fastcall CanSelectRow(int ARowIndex);
	virtual void __fastcall DoDataSourceChanged(void);
	virtual void __fastcall DoValueTypeClassChanged(int AItemIndex);
	virtual int __fastcall GetDefaultActiveRelationIndex(void);
	virtual int __fastcall GetDefaultGridModeBufferCount(void);
	/* virtual class method */ virtual int __fastcall GetItemID(TMetaClass* vmt, System::TObject* AItem);
	virtual TMetaClass* __fastcall GetSummaryGroupItemLinkClass(void);
	virtual TMetaClass* __fastcall GetSummaryItemClass(void);
	virtual bool __fastcall SupportsScrollBarParams(void);
	virtual void __fastcall UpdateScrollBars(void);
	
public:
	virtual System::TObject* __fastcall CreateDetailLinkObject(Cxcustomdata::TcxCustomDataRelation* ARelation, int ARecordIndex);
	virtual void __fastcall FocusControl(int AItemIndex, bool &Done);
	virtual Cxcustomdata::TcxCustomDataController* __fastcall GetDetailDataControllerByLinkObject(System::TObject* ALinkObject);
	virtual AnsiString __fastcall GetDisplayText(int ARecordIndex, int AItemIndex);
	virtual AnsiString __fastcall GetFilterItemFieldCaption(System::TObject* AItem);
	virtual System::TObject* __fastcall GetItem(int Index);
	virtual bool __fastcall GetItemSortByDisplayText(int AItemIndex);
	virtual Cxdatautils::TcxDataEditValueSource __fastcall GetItemValueSource(int AItemIndex);
	virtual void __fastcall UpdateData(void);
	Cxfilter::TcxFilterCriteriaItem* __fastcall AddItemToFilter(Cxfilter::TcxFilterCriteriaItemList* AParent, Cxgridcustomtableview::TcxCustomGridTableItem* AItem, Cxfilter::TcxFilterOperatorKind AOperatorKind, const Variant &AValue, AnsiString ADisplayText = "", bool AReplaceExistent = true);
	void __fastcall CreateAllItems(void);
	HIDESBASE Cxgridcustomtableview::TcxCustomGridTableItem* __fastcall GetItemByFieldName(const AnsiString AFieldName);
	__property Cxgridcustomtableview::TcxCustomGridTableController* Controller = {read=GetController};
	__property Cxgridcustomtableview::TcxCustomGridTableView* GridView = {read=GetGridViewValue};
	
__published:
	__property DataModeController ;
	__property DataSource ;
	__property DetailKeyFieldNames ;
	__property Filter ;
	__property KeyFieldNames ;
	__property MasterKeyFieldNames ;
	__property Options  = {default=28};
	__property Summary ;
	__property OnCompare ;
	__property OnDataChanged ;
	__property OnDetailHasChildren ;
	__property OnGroupingChanged ;
	__property OnRecordChanged ;
	__property OnSortingChanged ;
public:
	#pragma option push -w-inl
	/* TcxDBDataController.Create */ inline __fastcall virtual TcxGridDBDataController(Classes::TComponent* AOwner) : Cxdbdata::TcxDBDataController(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxDBDataController.Destroy */ inline __fastcall virtual ~TcxGridDBDataController(void) { }
	#pragma option pop
	
private:
	void *__IcxCustomGridDataController;	/* Cxgridcustomview::IcxCustomGridDataController */
	void *__IcxGridDataController;	/* Cxgridcustomtableview::IcxGridDataController */
	
public:
	operator IcxGridDataController*(void) { return (IcxGridDataController*)&__IcxGridDataController; }
	operator IcxCustomGridDataController*(void) { return (IcxCustomGridDataController*)&__IcxCustomGridDataController; }
	
};


class DELPHICLASS TcxGridItemDBDataBinding;
class PASCALIMPLEMENTATION TcxGridItemDBDataBinding : public Cxgridcustomtableview::TcxGridItemDataBinding 
{
	typedef Cxgridcustomtableview::TcxGridItemDataBinding inherited;
	
private:
	HIDESBASE TcxGridDBDataController* __fastcall GetDataController(void);
	Db::TField* __fastcall GetField(void);
	AnsiString __fastcall GetFieldName();
	void __fastcall SetFieldName(const AnsiString Value);
	
protected:
	virtual void __fastcall Init(void);
	__property TcxGridDBDataController* DataController = {read=GetDataController};
	
public:
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual AnsiString __fastcall DefaultCaption();
	virtual Cxedit::TcxEditRepositoryItem* __fastcall DefaultRepositoryItem(void);
	virtual int __fastcall DefaultWidth(bool ATakeHeaderIntoAccount = true);
	__property Db::TField* Field = {read=GetField};
	
__published:
	__property AnsiString FieldName = {read=GetFieldName, write=SetFieldName};
public:
	#pragma option push -w-inl
	/* TcxGridItemDataBinding.Create */ inline __fastcall virtual TcxGridItemDBDataBinding(Cxgridcustomtableview::TcxCustomGridTableItem* AItem) : Cxgridcustomtableview::TcxGridItemDataBinding(AItem) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxGridItemDataBinding.Destroy */ inline __fastcall virtual ~TcxGridItemDBDataBinding(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxgriddbdatadefinitions */
using namespace Cxgriddbdatadefinitions;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxGridDBDataDefinitions
