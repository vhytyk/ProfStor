// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxEditDBRegisteredRepositoryItems.pas' rev: 6.00

#ifndef cxEditDBRegisteredRepositoryItemsHPP
#define cxEditDBRegisteredRepositoryItemsHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxEditRepositoryItems.hpp>	// Pascal unit
#include <cxEditRegisteredRepositoryItems.hpp>	// Pascal unit
#include <cxDBEditRepository.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxDropDownEdit.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <DB.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxeditdbregisteredrepositoryitems
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxEditDBRegisteredRepositoryItems;
class PASCALIMPLEMENTATION TcxEditDBRegisteredRepositoryItems : public Cxeditregisteredrepositoryitems::TcxEditRegisteredRepositoryItems 
{
	typedef Cxeditregisteredrepositoryitems::TcxEditRegisteredRepositoryItems inherited;
	
private:
	Classes::TList* FLookupItems;
	int __fastcall GetLookupCount(void);
	Cxeditregisteredrepositoryitems::PcxEditRegisteredRepositoryItemsData __fastcall GetLookupRepositoryItem(int Index);
	
protected:
	virtual void __fastcall ItemRemoved(Cxedit::TcxEditRepositoryItem* Sender);
	HIDESBASE int __fastcall Add(Classes::TList* AList, Db::TFieldType AFieldType, int AVersion, Cxedit::TcxEditRepositoryItem* ARepositoryItem);
	HIDESBASE void __fastcall Clear(void);
	__property int LookupCount = {read=GetLookupCount, nodefault};
	__property Cxeditregisteredrepositoryitems::PcxEditRegisteredRepositoryItemsData LookupItems[int Index] = {read=GetLookupRepositoryItem};
	
public:
	__fastcall virtual TcxEditDBRegisteredRepositoryItems(Classes::TPersistent* AOwner);
	__fastcall virtual ~TcxEditDBRegisteredRepositoryItems(void);
	HIDESBASE Cxedit::TcxEditRepositoryItem* __fastcall GetItem(Db::TFieldType AFieldType);
	Cxedit::TcxEditRepositoryItem* __fastcall GetItemByField(Db::TField* AField);
	Cxedit::TcxEditRepositoryItem* __fastcall GetLookupItem(void);
	HIDESBASE void __fastcall RegisterItem(Db::TFieldType AFieldType, int AVersion, Cxedit::TcxEditRepositoryItem* ARepositoryItem);
	void __fastcall RegisterLookupItem(int AVersion, Cxedit::TcxEditRepositoryItem* ARepositoryItem);
	HIDESBASE void __fastcall UnregisterItem(Db::TFieldType AFieldType, int AVersion);
	void __fastcall UnregisterLookupItem(int AVersion);
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE TcxEditDBRegisteredRepositoryItems* __fastcall GetDefaultEditDBRepositoryItems(void);

}	/* namespace Cxeditdbregisteredrepositoryitems */
using namespace Cxeditdbregisteredrepositoryitems;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxEditDBRegisteredRepositoryItems
