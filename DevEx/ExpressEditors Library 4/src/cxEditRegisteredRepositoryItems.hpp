// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxEditRegisteredRepositoryItems.pas' rev: 6.00

#ifndef cxEditRegisteredRepositoryItemsHPP
#define cxEditRegisteredRepositoryItemsHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxEdit.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxeditregisteredrepositoryitems
{
//-- type declarations -------------------------------------------------------
struct TcxEditRegisteredRepositoryItemsData;
typedef TcxEditRegisteredRepositoryItemsData *PcxEditRegisteredRepositoryItemsData;

#pragma pack(push, 4)
struct TcxEditRegisteredRepositoryItemsData
{
	int DataType;
	int Version;
	Cxedit::TcxEditRepositoryItem* RepositoryItem;
} ;
#pragma pack(pop)

class DELPHICLASS TcxEditRegisteredRepositoryItems;
class PASCALIMPLEMENTATION TcxEditRegisteredRepositoryItems : public Cxclasses::TcxInterfacedPersistent 
{
	typedef Cxclasses::TcxInterfacedPersistent inherited;
	
private:
	bool FDestroying;
	Classes::TList* FDefaultItems;
	Classes::TList* FItems;
	int __fastcall GetDefaultCount(void);
	int __fastcall GetCount(void);
	PcxEditRegisteredRepositoryItemsData __fastcall GetDefaultRepositoryItem(int Index);
	PcxEditRegisteredRepositoryItemsData __fastcall GetRepositoryItem(int Index);
	
protected:
	virtual void __fastcall ItemRemoved(Cxedit::TcxEditRepositoryItem* Sender);
	virtual void __fastcall PropertiesChanged(Cxedit::TcxEditRepositoryItem* Sender);
	virtual int __fastcall Add(Classes::TList* AList, int ADataType, int AVersion, Cxedit::TcxEditRepositoryItem* ARepositoryItem);
	virtual void __fastcall Changed(void);
	void __fastcall Clear(void);
	void __fastcall Delete(Classes::TList* AList, int AIndex);
	bool __fastcall Find(Classes::TList* AList, int ADataType, int AVersion, int &Index);
	bool __fastcall FindByData(const TcxEditRegisteredRepositoryItemsData &AData, int &Index);
	__property int DefaultCount = {read=GetDefaultCount, nodefault};
	__property int Count = {read=GetCount, nodefault};
	__property PcxEditRegisteredRepositoryItemsData DefaultItems[int Index] = {read=GetDefaultRepositoryItem};
	__property PcxEditRegisteredRepositoryItemsData Items[int Index] = {read=GetRepositoryItem};
	
public:
	__fastcall virtual TcxEditRegisteredRepositoryItems(Classes::TPersistent* AOwner);
	__fastcall virtual ~TcxEditRegisteredRepositoryItems(void);
	virtual void __fastcall BeforeDestruction(void);
	virtual Cxedit::TcxEditRepositoryItem* __fastcall GetDefaultItem(void);
	virtual Cxedit::TcxEditRepositoryItem* __fastcall GetItem(int ADataType);
	virtual void __fastcall RegisterDefaultItem(int AVersion, Cxedit::TcxEditRepositoryItem* ARepositoryItem);
	virtual void __fastcall RegisterItem(int ADataType, int AVersion, Cxedit::TcxEditRepositoryItem* ARepositoryItem);
	virtual void __fastcall UnregisterDefaultItem(int AVersion);
	virtual void __fastcall UnregisterItem(int ADataType, int AVersion);
private:
	void *__IcxEditRepositoryItemListener;	/* Cxedit::IcxEditRepositoryItemListener */
	
public:
	operator IcxEditRepositoryItemListener*(void) { return (IcxEditRepositoryItemListener*)&__IcxEditRepositoryItemListener; }
	
};


//-- var, const, procedure ---------------------------------------------------
static const Shortint cxEditRegisteredItemsStandardVersion = 0xffffffff;
static const int cxEditRegisteredItemsDefaultVersion = 0x7fffffff;

}	/* namespace Cxeditregisteredrepositoryitems */
using namespace Cxeditregisteredrepositoryitems;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxEditRegisteredRepositoryItems
