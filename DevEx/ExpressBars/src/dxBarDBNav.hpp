// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'dxBarDBNav.pas' rev: 6.00

#ifndef dxBarDBNavHPP
#define dxBarDBNavHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <dxBar.hpp>	// Pascal unit
#include <DB.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Dxbardbnav
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TdxBarDBNavDataLink;
class DELPHICLASS TdxBarDBNavigator;
class DELPHICLASS TdxBarDBCheckLinks;
class DELPHICLASS TdxBarDBCheckLink;
class PASCALIMPLEMENTATION TdxBarDBCheckLinks : public Classes::TCollection 
{
	typedef Classes::TCollection inherited;
	
public:
	TdxBarDBCheckLink* operator[](int Index) { return Items[Index]; }
	
private:
	TdxBarDBNavigator* FDBNavigator;
	HIDESBASE TdxBarDBCheckLink* __fastcall GetItem(int Index);
	
protected:
	DYNAMIC Classes::TPersistent* __fastcall GetOwner(void);
	HIDESBASE void __fastcall RemoveItem(Dxbar::TdxBarItem* Item);
	
public:
	HIDESBASE TdxBarDBCheckLink* __fastcall Add(void);
	__property TdxBarDBCheckLink* Items[int Index] = {read=GetItem/*, default*/};
public:
	#pragma option push -w-inl
	/* TCollection.Create */ inline __fastcall TdxBarDBCheckLinks(TMetaClass* ItemClass) : Classes::TCollection(ItemClass) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCollection.Destroy */ inline __fastcall virtual ~TdxBarDBCheckLinks(void) { }
	#pragma option pop
	
};


#pragma option push -b-
enum TdxBarDBNavButtonType { dxbnFirst, dxbnPrior, dxbnNext, dxbnLast, dxbnInsert, dxbnDelete, dxbnEdit, dxbnPost, dxbnCancel, dxbnRefresh };
#pragma option pop

typedef Set<TdxBarDBNavButtonType, dxbnFirst, dxbnRefresh>  TdxBarDBNavButtonTypes;

class DELPHICLASS TdxBarDBNavButton;
class PASCALIMPLEMENTATION TdxBarDBNavigator : public Classes::TComponent 
{
	typedef Classes::TComponent inherited;
	
private:
	Dxbar::TdxBarManager* FBarManager;
	AnsiString FCategoryName;
	bool FConfirmDelete;
	TdxBarDBNavDataLink* FDataLink;
	TdxBarDBCheckLinks* FDBCheckLinks;
	bool FSetVisFlag;
	TdxBarDBNavButtonTypes FVisibleButtons;
	Db::TDataSource* __fastcall GetDataSource(void);
	void __fastcall SetBarManager(Dxbar::TdxBarManager* Value);
	void __fastcall SetCategoryName(AnsiString Value);
	void __fastcall SetDataSource(Db::TDataSource* Value);
	void __fastcall SetDBNavItems(TdxBarDBCheckLinks* Value);
	void __fastcall SetVisibleButtons(TdxBarDBNavButtonTypes Value);
	void __fastcall AddButton(TdxBarDBNavButton* AButton);
	void __fastcall RemoveButton(TdxBarDBNavButton* AButton);
	void __fastcall CheckItemsEnable(void);
	
protected:
	TdxBarDBNavButton* Buttons[10];
	void __fastcall ActiveChanged(void);
	void __fastcall DataChanged(void);
	void __fastcall EditingChanged(void);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	
public:
	__fastcall virtual TdxBarDBNavigator(Classes::TComponent* AOwner);
	__fastcall virtual ~TdxBarDBNavigator(void);
	
__published:
	__property Dxbar::TdxBarManager* BarManager = {read=FBarManager, write=SetBarManager};
	__property AnsiString CategoryName = {read=FCategoryName, write=SetCategoryName};
	__property bool ConfirmDelete = {read=FConfirmDelete, write=FConfirmDelete, nodefault};
	__property Db::TDataSource* DataSource = {read=GetDataSource, write=SetDataSource};
	__property TdxBarDBCheckLinks* DBCheckLinks = {read=FDBCheckLinks, write=SetDBNavItems};
	__property TdxBarDBNavButtonTypes VisibleButtons = {read=FVisibleButtons, write=SetVisibleButtons, default=0};
};


class PASCALIMPLEMENTATION TdxBarDBNavDataLink : public Db::TDataLink 
{
	typedef Db::TDataLink inherited;
	
private:
	TdxBarDBNavigator* FNavigator;
	
protected:
	virtual void __fastcall ActiveChanged(void);
	virtual void __fastcall DataSetChanged(void);
	virtual void __fastcall EditingChanged(void);
public:
	#pragma option push -w-inl
	/* TDataLink.Create */ inline __fastcall TdxBarDBNavDataLink(void) : Db::TDataLink() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TDataLink.Destroy */ inline __fastcall virtual ~TdxBarDBNavDataLink(void) { }
	#pragma option pop
	
};


#pragma option push -b-
enum TdxBarDBEnableType { dxdbtCanModify, dxdbtNotEOF, dxdbtNotBOF, dxdbtHasRecords, dxdbtIsModified, dxdbtIsNotModified };
#pragma option pop

typedef Set<TdxBarDBEnableType, dxdbtCanModify, dxdbtIsNotModified>  TdxBarDBEnableTypes;

class PASCALIMPLEMENTATION TdxBarDBCheckLink : public Classes::TCollectionItem 
{
	typedef Classes::TCollectionItem inherited;
	
private:
	Dxbar::TdxBarItem* FItem;
	TdxBarDBEnableTypes FEnableTypes;
	void __fastcall SetEnableTypes(TdxBarDBEnableTypes Value);
	
public:
	virtual void __fastcall Assign(Classes::TPersistent* Value);
	
__published:
	__property Dxbar::TdxBarItem* Item = {read=FItem, write=FItem};
	__property TdxBarDBEnableTypes EnableTypes = {read=FEnableTypes, write=SetEnableTypes, nodefault};
public:
	#pragma option push -w-inl
	/* TCollectionItem.Create */ inline __fastcall virtual TdxBarDBCheckLink(Classes::TCollection* Collection) : Classes::TCollectionItem(Collection) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCollectionItem.Destroy */ inline __fastcall virtual ~TdxBarDBCheckLink(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TdxBarDBNavButton : public Dxbar::TdxBarButton 
{
	typedef Dxbar::TdxBarButton inherited;
	
private:
	TdxBarDBNavigator* FBarDBNavigator;
	TdxBarDBNavButtonType FNavButton;
	void __fastcall SetNavButton(TdxBarDBNavButtonType Value);
	
protected:
	virtual void __fastcall Loaded(void);
	
public:
	__fastcall virtual ~TdxBarDBNavButton(void);
	DYNAMIC void __fastcall DoClick(void);
	
__published:
	__property TdxBarDBNavigator* BarDBNavigator = {read=FBarDBNavigator, write=FBarDBNavigator};
	__property TdxBarDBNavButtonType NavButton = {read=FNavButton, write=SetNavButton, nodefault};
public:
	#pragma option push -w-inl
	/* TdxBarButton.Create */ inline __fastcall virtual TdxBarDBNavButton(Classes::TComponent* AOwner) : Dxbar::TdxBarButton(AOwner) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Dxbardbnav */
using namespace Dxbardbnav;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// dxBarDBNav
