// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxEditDataRegisteredRepositoryItems.pas' rev: 6.00

#ifndef cxEditDataRegisteredRepositoryItemsHPP
#define cxEditDataRegisteredRepositoryItemsHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Classes.hpp>	// Pascal unit
#include <cxEditRepositoryItems.hpp>	// Pascal unit
#include <cxEditRegisteredRepositoryItems.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxDataStorage.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxeditdataregisteredrepositoryitems
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxEditDataRegisteredRepositoryItems;
class PASCALIMPLEMENTATION TcxEditDataRegisteredRepositoryItems : public Cxeditregisteredrepositoryitems::TcxEditRegisteredRepositoryItems 
{
	typedef Cxeditregisteredrepositoryitems::TcxEditRegisteredRepositoryItems inherited;
	
public:
	HIDESBASE Cxedit::TcxEditRepositoryItem* __fastcall GetItem(TMetaClass* AValueTypeClass);
	HIDESBASE void __fastcall RegisterItem(TMetaClass* AValueTypeClass, int AVersion, Cxedit::TcxEditRepositoryItem* ARepositoryItem);
	HIDESBASE void __fastcall UnregisterItem(TMetaClass* AValueTypeClass, int AVersion);
public:
	#pragma option push -w-inl
	/* TcxEditRegisteredRepositoryItems.Create */ inline __fastcall virtual TcxEditDataRegisteredRepositoryItems(Classes::TPersistent* AOwner) : Cxeditregisteredrepositoryitems::TcxEditRegisteredRepositoryItems(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxEditRegisteredRepositoryItems.Destroy */ inline __fastcall virtual ~TcxEditDataRegisteredRepositoryItems(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE TcxEditDataRegisteredRepositoryItems* __fastcall GetDefaultEditDataRepositoryItems(void);

}	/* namespace Cxeditdataregisteredrepositoryitems */
using namespace Cxeditdataregisteredrepositoryitems;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxEditDataRegisteredRepositoryItems
