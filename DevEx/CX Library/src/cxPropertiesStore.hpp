// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxPropertiesStore.pas' rev: 6.00

#ifndef cxPropertiesStoreHPP
#define cxPropertiesStoreHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxStorage.hpp>	// Pascal unit
#include <Variants.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <TypInfo.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxpropertiesstore
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxPropertiesStoreComponent;
class DELPHICLASS TcxCustomPropertiesStore;
class PASCALIMPLEMENTATION TcxPropertiesStoreComponent : public Classes::TCollectionItem 
{
	typedef Classes::TCollectionItem inherited;
	
private:
	Classes::TComponent* FComponent;
	Classes::TStrings* FProperties;
	Classes::TStrings* FPropertiesEx;
	void __fastcall ExtractProperties(void);
	Classes::TPersistent* __fastcall ExtractPersistentAndPropertyName(Classes::TPersistent* AStartPersistent, const AnsiString AStartName, AnsiString &AResultName);
	Classes::TCollectionItem* __fastcall GetCollectionItemByName(Classes::TCollection* ACollection, const AnsiString AName);
	Classes::TPersistent* __fastcall GetPersistentAndPropertyName(const AnsiString AStartName, AnsiString &AResultName);
	Cxstorage::TcxStorageModes __fastcall GetStorageModes(void);
	Classes::TComponent* __fastcall GetComponentByName(const AnsiString AName);
	bool __fastcall GetUseInterfaceOnly(void);
	void __fastcall InternalGetPropertyValue(const AnsiString AName, Variant &AValue);
	void __fastcall InternalSetPropertyValue(const AnsiString AName, const Variant &AValue);
	void __fastcall SetComponent(const Classes::TComponent* Value);
	void __fastcall SetProperties(const Classes::TStrings* Value);
	bool __fastcall TestClassProperty(const AnsiString AName, System::TObject* AObject);
	
protected:
	System::TObject* __fastcall CreateChild(const AnsiString AObjectName, const AnsiString AClassName);
	void __fastcall DeleteChild(const AnsiString AObjectName, System::TObject* AObject);
	void __fastcall GetChildren(Classes::TStringList* AChildren);
	AnsiString __fastcall GetObjectName();
	bool __fastcall GetProperties(Classes::TStrings* AProperties);
	void __fastcall GetPropertyValue(const AnsiString AName, Variant &AValue);
	void __fastcall SetPropertyValue(const AnsiString AName, const Variant &AValue);
	HRESULT __stdcall QueryInterface(const GUID &IID, /* out */ void *Obj);
	int __stdcall _AddRef(void);
	int __stdcall _Release(void);
	TcxCustomPropertiesStore* __fastcall GetPropertiesStore(void);
	
public:
	__fastcall virtual TcxPropertiesStoreComponent(Classes::TCollection* Collection);
	__fastcall virtual ~TcxPropertiesStoreComponent(void);
	void __fastcall RestoreFrom(Cxstorage::TcxStorage* AStorage, Cxstorage::TcxCustomReader* AReader);
	void __fastcall StoreTo(Cxstorage::TcxStorage* AStorage, Cxstorage::TcxCustomWriter* AWriter);
	
__published:
	__property Classes::TComponent* Component = {read=FComponent, write=SetComponent};
	__property Classes::TStrings* Properties = {read=FProperties, write=SetProperties};
private:
	void *__IcxStoredObject;	/* Cxstorage::IcxStoredObject */
	void *__IcxStoredParent;	/* Cxstorage::IcxStoredParent */
	
public:
	operator IcxStoredParent*(void) { return (IcxStoredParent*)&__IcxStoredParent; }
	operator IcxStoredObject*(void) { return (IcxStoredObject*)&__IcxStoredObject; }
	
};


class DELPHICLASS TcxPropertiesStoreComponents;
class PASCALIMPLEMENTATION TcxPropertiesStoreComponents : public Classes::TOwnedCollection 
{
	typedef Classes::TOwnedCollection inherited;
	
public:
	TcxPropertiesStoreComponent* operator[](int Index) { return ComponentItems[Index]; }
	
private:
	TcxPropertiesStoreComponent* __fastcall GetComponentItem(int Index);
	void __fastcall SetComponentItem(int Index, const TcxPropertiesStoreComponent* Value);
	
protected:
	TcxCustomPropertiesStore* __fastcall GetPropertiesStore(void);
	void __fastcall RemoveComponent(const Classes::TComponent* AComponent);
	
public:
	__property TcxPropertiesStoreComponent* ComponentItems[int Index] = {read=GetComponentItem, write=SetComponentItem/*, default*/};
public:
	#pragma option push -w-inl
	/* TOwnedCollection.Create */ inline __fastcall TcxPropertiesStoreComponents(Classes::TPersistent* AOwner, TMetaClass* ItemClass) : Classes::TOwnedCollection(AOwner, ItemClass) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TCollection.Destroy */ inline __fastcall virtual ~TcxPropertiesStoreComponents(void) { }
	#pragma option pop
	
};


#pragma option push -b-
enum TcxStorageType { stIniFile, stRegistry, stStream };
#pragma option pop

class PASCALIMPLEMENTATION TcxCustomPropertiesStore : public Classes::TComponent 
{
	typedef Classes::TComponent inherited;
	
private:
	bool FActive;
	TcxPropertiesStoreComponents* FComponents;
	AnsiString FStorageName;
	Classes::TStream* FStorageStream;
	TcxStorageType FStorageType;
	Classes::TNotifyEvent FOnCreateHandler;
	Classes::TNotifyEvent FOnDestroyHandler;
	AnsiString __fastcall GetStorageName();
	void __fastcall SetComponents(const TcxPropertiesStoreComponents* Value);
	
protected:
	virtual void __fastcall Loaded(void);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	void __fastcall OwnerCreate(System::TObject* Sender);
	void __fastcall OwnerDestroy(System::TObject* Sender);
	Cxstorage::TcxCustomReader* __fastcall CreateReader(void);
	Cxstorage::TcxCustomWriter* __fastcall CreateWriter(bool AReCreate = true);
	Cxstorage::TcxStorage* __fastcall CreateStorage(void);
	__property bool Active = {read=FActive, write=FActive, default=1};
	__property TcxPropertiesStoreComponents* Components = {read=FComponents, write=SetComponents};
	__property AnsiString StorageName = {read=GetStorageName, write=FStorageName};
	__property TcxStorageType StorageType = {read=FStorageType, write=FStorageType, default=0};
	
public:
	__fastcall virtual TcxCustomPropertiesStore(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxCustomPropertiesStore(void);
	void __fastcall RestoreFrom(void);
	void __fastcall StoreTo(const bool AReCreate = true);
	__property Classes::TStream* StorageStream = {read=FStorageStream, write=FStorageStream};
};


class DELPHICLASS TcxPropertiesStore;
class PASCALIMPLEMENTATION TcxPropertiesStore : public TcxCustomPropertiesStore 
{
	typedef TcxCustomPropertiesStore inherited;
	
__published:
	__property Active  = {default=1};
	__property Components ;
	__property StorageName ;
	__property StorageType  = {default=0};
public:
	#pragma option push -w-inl
	/* TcxCustomPropertiesStore.Create */ inline __fastcall virtual TcxPropertiesStore(Classes::TComponent* AOwner) : TcxCustomPropertiesStore(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomPropertiesStore.Destroy */ inline __fastcall virtual ~TcxPropertiesStore(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxpropertiesstore */
using namespace Cxpropertiesstore;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxPropertiesStore
