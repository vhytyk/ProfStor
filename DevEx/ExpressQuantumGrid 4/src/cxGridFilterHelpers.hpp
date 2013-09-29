// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxGridFilterHelpers.pas' rev: 6.00

#ifndef cxGridFilterHelpersHPP
#define cxGridFilterHelpersHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxFilterControlUtils.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxgridfilterhelpers
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxFilterExtLookupComboBoxHelper;
class PASCALIMPLEMENTATION TcxFilterExtLookupComboBoxHelper : public Cxfiltercontrolutils::TcxFilterComboBoxHelper 
{
	typedef Cxfiltercontrolutils::TcxFilterComboBoxHelper inherited;
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetFilterEditClass(TMetaClass* vmt);
	/* virtual class method */ virtual Cxfiltercontrolutils::TcxFilterControlOperators __fastcall GetSupportedFilterOperators(TMetaClass* vmt, Cxedit::TcxCustomEditProperties* AEditProperties, bool AExtendedSet = false);
	/* virtual class method */ virtual void __fastcall InitializeProperties(TMetaClass* vmt, Cxedit::TcxCustomEditProperties* AProperties, Cxedit::TcxCustomEditProperties* AEditProperties, bool AHasButtons);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxFilterExtLookupComboBoxHelper(void) : Cxfiltercontrolutils::TcxFilterComboBoxHelper() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFilterExtLookupComboBoxHelper(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxgridfilterhelpers */
using namespace Cxgridfilterhelpers;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxGridFilterHelpers
