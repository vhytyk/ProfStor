// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'dxNavBarBase.pas' rev: 6.00

#ifndef dxNavBarBaseHPP
#define dxNavBarBaseHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Classes.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Dxnavbarbase
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TdxNavBarChangeType { doRecreate, doRecalc, doRedraw };
#pragma option pop

typedef void __fastcall (__closure *TdxNavBarChangeEvent)(System::TObject* Sender, TdxNavBarChangeType AType);

class DELPHICLASS TdxNavBarComponentCollectionItem;
class DELPHICLASS TdxNavBarComponentCollection;
typedef TMetaClass*TdxNavBarComponentCollectionItemClass;

class PASCALIMPLEMENTATION TdxNavBarComponentCollection : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
public:
	TdxNavBarComponentCollectionItem* operator[](int Index) { return Items[Index]; }
	
private:
	TMetaClass*FItemClass;
	Classes::TList* FItems;
	Classes::TComponent* FOwner;
	int FUpdateCount;
	TdxNavBarChangeEvent FOnChange;
	int __fastcall GetCount(void);
	void __fastcall InsertItem(TdxNavBarComponentCollectionItem* Item);
	void __fastcall RemoveItem(TdxNavBarComponentCollectionItem* Item);
	
protected:
	TdxNavBarComponentCollectionItem* __fastcall GetItem(int Index);
	void __fastcall SetItem(int Index, TdxNavBarComponentCollectionItem* Value);
	DYNAMIC void __fastcall DoChanged(TdxNavBarChangeType AType);
	void __fastcall BeginUpdate(void);
	void __fastcall EndUpdate(void);
	__property int UpdateCount = {read=FUpdateCount, nodefault};
	__property TMetaClass* ItemClass = {read=FItemClass};
	
public:
	__fastcall TdxNavBarComponentCollection(Classes::TComponent* AOwner, TMetaClass* AItemClass);
	__fastcall virtual ~TdxNavBarComponentCollection(void);
	TdxNavBarComponentCollectionItem* __fastcall Add(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	void __fastcall Clear(void);
	void __fastcall Delete(int Index);
	int __fastcall IndexOf(TdxNavBarComponentCollectionItem* Item);
	TdxNavBarComponentCollectionItem* __fastcall ItemByName(const AnsiString AName);
	void __fastcall Remove(TdxNavBarComponentCollectionItem* Item);
	__property int Count = {read=GetCount, nodefault};
	__property TdxNavBarComponentCollectionItem* Items[int Index] = {read=GetItem, write=SetItem/*, default*/};
	__property Classes::TComponent* Owner = {read=FOwner};
	__property TdxNavBarChangeEvent OnChange = {read=FOnChange, write=FOnChange};
};


class PASCALIMPLEMENTATION TdxNavBarComponentCollectionItem : public Classes::TComponent 
{
	typedef Classes::TComponent inherited;
	
private:
	TdxNavBarComponentCollection* FCollection;
	int __fastcall GetIndex(void);
	void __fastcall SetIndex(int Value);
	
protected:
	void __fastcall Changed(TdxNavBarChangeType AType);
	
public:
	DYNAMIC Classes::TComponent* __fastcall GetParentComponent(void);
	DYNAMIC bool __fastcall HasParent(void);
	void __fastcall AddToCollection(TdxNavBarComponentCollection* ACollection);
	void __fastcall RemoveFromCollection(TdxNavBarComponentCollection* ACollection);
	__property TdxNavBarComponentCollection* Collection = {read=FCollection};
	__property int Index = {read=GetIndex, write=SetIndex, nodefault};
public:
	#pragma option push -w-inl
	/* TComponent.Create */ inline __fastcall virtual TdxNavBarComponentCollectionItem(Classes::TComponent* AOwner) : Classes::TComponent(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TComponent.Destroy */ inline __fastcall virtual ~TdxNavBarComponentCollectionItem(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Dxnavbarbase */
using namespace Dxnavbarbase;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// dxNavBarBase
