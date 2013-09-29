// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxGridUICardHelper.pas' rev: 6.00

#ifndef cxGridUICardHelperHPP
#define cxGridUICardHelperHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxGridUICustomTableHelper.hpp>	// Pascal unit
#include <cxGridCustomTableView.hpp>	// Pascal unit
#include <cxGridUIHelper.hpp>	// Pascal unit
#include <cxGridCustomView.hpp>	// Pascal unit
#include <cxGrid.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxgriduicardhelper
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxGridCardViewOperationHelper;
class PASCALIMPLEMENTATION TcxGridCardViewOperationHelper : public Cxgriduicustomtablehelper::TcxGridCustomTableViewOperationHelper 
{
	typedef Cxgriduicustomtablehelper::TcxGridCustomTableViewOperationHelper inherited;
	
protected:
	virtual void __fastcall RegisterOperations(void);
	void __fastcall DoLayoutDirection(const Cxgriduihelper::TcxCustomGridOperationHelperParameters* AParameter);
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewClass(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TcxCustomGridViewOperationHelper.Create */ inline __fastcall TcxGridCardViewOperationHelper(void) : Cxgriduicustomtablehelper::TcxGridCustomTableViewOperationHelper() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomGridViewOperationHelper.Destroy */ inline __fastcall virtual ~TcxGridCardViewOperationHelper(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxgriduicardhelper */
using namespace Cxgriduicardhelper;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxGridUICardHelper
