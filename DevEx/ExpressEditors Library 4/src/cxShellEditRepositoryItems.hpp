// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxShellEditRepositoryItems.pas' rev: 6.00

#ifndef cxShellEditRepositoryItemsHPP
#define cxShellEditRepositoryItemsHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Classes.hpp>	// Pascal unit
#include <cxShellComboBox.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxshelleditrepositoryitems
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxEditRepositoryShellComboBoxItem;
class PASCALIMPLEMENTATION TcxEditRepositoryShellComboBoxItem : public Cxedit::TcxEditRepositoryItem 
{
	typedef Cxedit::TcxEditRepositoryItem inherited;
	
private:
	Cxshellcombobox::TcxShellComboBoxProperties* __fastcall GetProperties(void);
	HIDESBASE void __fastcall SetProperties(Cxshellcombobox::TcxShellComboBoxProperties* Value);
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetEditPropertiesClass(TMetaClass* vmt);
	
__published:
	__property Cxshellcombobox::TcxShellComboBoxProperties* Properties = {read=GetProperties, write=SetProperties};
public:
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Create */ inline __fastcall virtual TcxEditRepositoryShellComboBoxItem(Classes::TComponent* AOwner) : Cxedit::TcxEditRepositoryItem(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Destroy */ inline __fastcall virtual ~TcxEditRepositoryShellComboBoxItem(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxshelleditrepositoryitems */
using namespace Cxshelleditrepositoryitems;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxShellEditRepositoryItems
