// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxDBFilterControl.pas' rev: 6.00

#ifndef cxDBFilterControlHPP
#define cxDBFilterControlHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Menus.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <DB.hpp>	// Pascal unit
#include <cxFilterControlUtils.hpp>	// Pascal unit
#include <cxFilterControl.hpp>	// Pascal unit
#include <cxLookAndFeels.hpp>	// Pascal unit
#include <cxDataStorage.hpp>	// Pascal unit
#include <cxFilter.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxdbfiltercontrol
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxFilterItem;
class DELPHICLASS TcxDBFilterControl;
class DELPHICLASS TcxFilterPropertiesList;
class PASCALIMPLEMENTATION TcxFilterPropertiesList : public Classes::TList 
{
	typedef Classes::TList inherited;
	
public:
	virtual void __fastcall Clear(void);
	Cxedit::TcxCustomEditProperties* __fastcall GetProperties(TMetaClass* AClass);
public:
	#pragma option push -w-inl
	/* TList.Destroy */ inline __fastcall virtual ~TcxFilterPropertiesList(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxFilterPropertiesList(void) : Classes::TList() { }
	#pragma option pop
	
};


class DELPHICLASS TcxDBFilterOptions;
class PASCALIMPLEMENTATION TcxDBFilterOptions : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	TcxDBFilterControl* FFilterControl;
	bool FSupportedBetween;
	bool FSupportedIn;
	bool FSupportedLike;
	AnsiString __fastcall GetDateTimeFormat();
	char __fastcall GetPercentWildcard(void);
	bool __fastcall GetSoftNull(void);
	char __fastcall GetUnderscoreWildcard(void);
	void __fastcall SetDateTimeFormat(const AnsiString Value);
	void __fastcall SetPercentWildcard(char Value);
	void __fastcall SetSoftNull(bool Value);
	void __fastcall SetUnderscoreWildcard(char Value);
	
public:
	__fastcall TcxDBFilterOptions(TcxDBFilterControl* AFilterControl);
	void __fastcall ProcessFilterOperators(Cxfiltercontrolutils::TcxFilterControlOperators &SupportedOperations);
	
__published:
	__property AnsiString DateTimeFormat = {read=GetDateTimeFormat, write=SetDateTimeFormat};
	__property char PercentWildcard = {read=GetPercentWildcard, write=SetPercentWildcard, default=37};
	__property bool SoftNull = {read=GetSoftNull, write=SetSoftNull, default=0};
	__property bool SupportedBetween = {read=FSupportedBetween, write=FSupportedBetween, default=1};
	__property bool SupportedIn = {read=FSupportedIn, write=FSupportedIn, default=1};
	__property bool SupportedLike = {read=FSupportedLike, write=FSupportedLike, default=1};
	__property char UnderscoreWildcard = {read=GetUnderscoreWildcard, write=SetUnderscoreWildcard, default=95};
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxDBFilterOptions(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFilterItemCollection;
class PASCALIMPLEMENTATION TcxFilterItemCollection : public Classes::TOwnedCollection 
{
	typedef Classes::TOwnedCollection inherited;
	
public:
	TcxFilterItem* operator[](int Index) { return Items[Index]; }
	
private:
	TcxDBFilterControl* __fastcall GetControl(void);
	TcxFilterItem* __fastcall GetItems(int Index);
	void __fastcall SetItems(int Index, const TcxFilterItem* Value);
	
protected:
	virtual void __fastcall Update(Classes::TCollectionItem* Item);
	
public:
	__property TcxDBFilterControl* Control = {read=GetControl};
	__property TcxFilterItem* Items[int Index] = {read=GetItems, write=SetItems/*, default*/};
public:
	#pragma option push -w-inl
	/* TOwnedCollection.Create */ inline __fastcall TcxFilterItemCollection(Classes::TPersistent* AOwner, TMetaClass* ItemClass) : Classes::TOwnedCollection(AOwner, ItemClass) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TCollection.Destroy */ inline __fastcall virtual ~TcxFilterItemCollection(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxDBFilterControl : public Cxfiltercontrol::TcxCustomFilterControl 
{
	typedef Cxfiltercontrol::TcxCustomFilterControl inherited;
	
private:
	bool FApplyingFilter;
	Db::TDataSource* FDataSource;
	Db::TDataSet* FDataSet;
	TcxFilterPropertiesList* FFieldsProperties;
	TcxDBFilterOptions* FFilterOptions;
	TcxFilterItemCollection* FItems;
	Db::TDataSet* __fastcall GetDataSet(void);
	void __fastcall DataSetStateChange(System::TObject* Sender);
	void __fastcall SetDataSet(const Db::TDataSet* Value);
	
protected:
	AnsiString __fastcall GetCaption(int Index);
	int __fastcall GetCount(void);
	Cxfilter::TcxFilterCriteria* __fastcall GetCriteria(void);
	System::TObject* __fastcall GetItemLink(int Index);
	AnsiString __fastcall GetFieldName(int Index);
	Cxedit::TcxCustomEditProperties* __fastcall GetProperties(int Index);
	TMetaClass* __fastcall GetValueType(int Index);
	void __fastcall SetDialogLinkComponent(Classes::TComponent* ALink);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	virtual void __fastcall CorrectOperatorClass(TMetaClass* &AOperatorClass);
	virtual void __fastcall DoApplyFilter(void);
	virtual void __fastcall FillConditionList(Classes::TStrings* AStrings);
	virtual Cxfiltercontrol::_di_IcxFilterControl __fastcall GetFilterLink();
	virtual TMetaClass* __fastcall GetPropertiesClassFromFieldType(Db::TFieldType AFieldType);
	__property Db::TDataSource* DataSource = {read=FDataSource};
	
public:
	__fastcall virtual TcxDBFilterControl(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxDBFilterControl(void);
	virtual void __fastcall Clear(void);
	
__published:
	__property Align  = {default=0};
	__property Anchors  = {default=3};
	__property Color  = {default=-2147483633};
	__property Db::TDataSet* DataSet = {read=GetDataSet, write=SetDataSet};
	__property DragCursor  = {default=-12};
	__property DragKind  = {default=0};
	__property DragMode  = {default=0};
	__property Enabled  = {default=1};
	__property TcxDBFilterOptions* FilterOptions = {read=FFilterOptions, write=FFilterOptions};
	__property Font ;
	__property FontBoolOperator ;
	__property FontCondition ;
	__property FontItem ;
	__property FontValue ;
	__property HelpContext  = {default=0};
	__property HelpKeyword ;
	__property HelpType  = {default=1};
	__property Hint ;
	__property HotTrackOnUnfocused  = {default=1};
	__property TcxFilterItemCollection* Items = {read=FItems, write=FItems};
	__property LookAndFeel ;
	__property NullString ;
	__property ParentColor  = {default=0};
	__property ParentFont  = {default=1};
	__property ParentShowHint  = {default=1};
	__property PopupMenu ;
	__property ShowHint ;
	__property ShowLevelLines  = {default=1};
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=0};
	__property Visible  = {default=1};
	__property WantTabs  = {default=0};
	__property OnApplyFilter ;
	__property OnClick ;
	__property OnContextPopup ;
	__property OnDragDrop ;
	__property OnDragOver ;
	__property OnEndDock ;
	__property OnEndDrag ;
	__property OnEnter ;
	__property OnExit ;
	__property OnKeyDown ;
	__property OnKeyPress ;
	__property OnKeyUp ;
	__property OnMouseDown ;
	__property OnMouseMove ;
	__property OnMouseUp ;
	__property OnStartDock ;
	__property OnStartDrag ;
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxDBFilterControl(HWND ParentWindow) : Cxfiltercontrol::TcxCustomFilterControl(ParentWindow) { }
	#pragma option pop
	
private:
	void *__IcxFilterControl;	/* Cxfiltercontrol::IcxFilterControl */
	void *__IcxFilterControlDialog;	/* Cxfiltercontrol::IcxFilterControlDialog */
	
public:
	operator IcxFilterControlDialog*(void) { return (IcxFilterControlDialog*)&__IcxFilterControlDialog; }
	operator IcxFilterControl*(void) { return (IcxFilterControl*)&__IcxFilterControl; }
	
};


class PASCALIMPLEMENTATION TcxFilterItem : public Classes::TCollectionItem 
{
	typedef Classes::TCollectionItem inherited;
	
private:
	System::_di_IInterface FOwnerInterface;
	TcxDBFilterControl* FFilterControl;
	AnsiString FCaption;
	AnsiString FFieldName;
	Cxedit::TcxCustomEditProperties* FProperties;
	Cxedit::TcxEditRepositoryItem* FRepositoryItem;
	TMetaClass*FPropertiesClass;
	void __fastcall DoPropertiesChanged(System::TObject* Sender);
	AnsiString __fastcall GetPropertiesClassName();
	bool __fastcall IsCaptionStored(void);
	void __fastcall RecreateProperties(void);
	void __fastcall SetCaption(const AnsiString Value);
	void __fastcall SetFieldName(const AnsiString Value);
	void __fastcall SetProperties(const Cxedit::TcxCustomEditProperties* Value);
	void __fastcall SetPropertiesClass(const TMetaClass* Value);
	void __fastcall SetPropertiesClassName(const AnsiString Value);
	void __fastcall SetRepositoryItem(const Cxedit::TcxEditRepositoryItem* Value);
	
protected:
	int __stdcall _AddRef(void);
	int __stdcall _Release(void);
	virtual HRESULT __stdcall QueryInterface(const GUID &IID, /* out */ void *Obj);
	void __fastcall ItemRemoved(Cxedit::TcxEditRepositoryItem* Sender);
	void __fastcall PropertiesChanged(Cxedit::TcxEditRepositoryItem* Sender);
	virtual AnsiString __fastcall GetDisplayName();
	virtual void __fastcall CreateProperties(void);
	virtual void __fastcall DestroyProperties(void);
	__property TcxDBFilterControl* FilterControl = {read=FFilterControl};
	
public:
	__fastcall virtual TcxFilterItem(Classes::TCollection* Collection);
	__fastcall virtual ~TcxFilterItem(void);
	virtual void __fastcall AfterConstruction(void);
	Cxedit::TcxCustomEditProperties* __fastcall GetProperties(void);
	__property TMetaClass* PropertiesClass = {read=FPropertiesClass, write=SetPropertiesClass};
	
__published:
	__property AnsiString Caption = {read=FCaption, write=SetCaption, stored=IsCaptionStored};
	__property AnsiString FieldName = {read=FFieldName, write=SetFieldName};
	__property AnsiString PropertiesClassName = {read=GetPropertiesClassName, write=SetPropertiesClassName};
	__property Cxedit::TcxCustomEditProperties* Properties = {read=FProperties, write=SetProperties};
	__property Cxedit::TcxEditRepositoryItem* RepositoryItem = {read=FRepositoryItem, write=SetRepositoryItem};
private:
	void *__IcxEditRepositoryItemListener;	/* Cxedit::IcxEditRepositoryItemListener */
	
public:
	operator IcxEditRepositoryItemListener*(void) { return (IcxEditRepositoryItemListener*)&__IcxEditRepositoryItemListener; }
	operator IInterface*(void) { return (IInterface*)&__IcxEditRepositoryItemListener; }
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE bool __fastcall ExecuteDBFilterControlDialog(Db::TDataSet* ADataSet, Cxlookandfeels::TcxLookAndFeel* ALookAndFeel, Classes::TNotifyEvent AOnApplyProc = 0x0, Classes::TNotifyEvent AOnShowDialog = 0x0, Graphics::TColor AColor = (Graphics::TColor)(0x20000000), const AnsiString AInitialDir = "");

}	/* namespace Cxdbfiltercontrol */
using namespace Cxdbfiltercontrol;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxDBFilterControl
