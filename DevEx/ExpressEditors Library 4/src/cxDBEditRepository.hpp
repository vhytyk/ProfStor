// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxDBEditRepository.pas' rev: 6.00

#ifndef cxDBEditRepositoryHPP
#define cxDBEditRepositoryHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxDBLookupComboBox.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <ComCtrls.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxdbeditrepository
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxEditRepositoryLookupComboBoxItem;
class PASCALIMPLEMENTATION TcxEditRepositoryLookupComboBoxItem : public Cxedit::TcxEditRepositoryItem 
{
	typedef Cxedit::TcxEditRepositoryItem inherited;
	
private:
	Cxdblookupcombobox::TcxLookupComboBoxProperties* __fastcall GetProperties(void);
	HIDESBASE void __fastcall SetProperties(Cxdblookupcombobox::TcxLookupComboBoxProperties* Value);
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetEditPropertiesClass(TMetaClass* vmt);
	
__published:
	__property Cxdblookupcombobox::TcxLookupComboBoxProperties* Properties = {read=GetProperties, write=SetProperties};
public:
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Create */ inline __fastcall virtual TcxEditRepositoryLookupComboBoxItem(Classes::TComponent* AOwner) : Cxedit::TcxEditRepositoryItem(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Destroy */ inline __fastcall virtual ~TcxEditRepositoryLookupComboBoxItem(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxdbeditrepository */
using namespace Cxdbeditrepository;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxDBEditRepository
