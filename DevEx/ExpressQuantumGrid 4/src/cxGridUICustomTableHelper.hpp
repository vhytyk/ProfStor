// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxGridUICustomTableHelper.pas' rev: 6.00

#ifndef cxGridUICustomTableHelperHPP
#define cxGridUICustomTableHelperHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxGridCustomTableView.hpp>	// Pascal unit
#include <cxGridUIHelper.hpp>	// Pascal unit
#include <cxGridCustomView.hpp>	// Pascal unit
#include <cxGrid.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxgriduicustomtablehelper
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxGridCustomTableViewOperationHelper;
class PASCALIMPLEMENTATION TcxGridCustomTableViewOperationHelper : public Cxgriduihelper::TcxCustomGridViewOperationHelper 
{
	typedef Cxgriduihelper::TcxCustomGridViewOperationHelper inherited;
	
protected:
	virtual void __fastcall RegisterOperations(void);
	void __fastcall DoCopyToClipboard(const Cxgriduihelper::TcxCustomGridOperationHelperParameters* AParameter);
	void __fastcall DoShowEditButtons(const Cxgriduihelper::TcxCustomGridOperationHelperParameters* AParameter);
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewClass(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TcxCustomGridViewOperationHelper.Create */ inline __fastcall TcxGridCustomTableViewOperationHelper(void) : Cxgriduihelper::TcxCustomGridViewOperationHelper() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomGridViewOperationHelper.Destroy */ inline __fastcall virtual ~TcxGridCustomTableViewOperationHelper(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxgriduicustomtablehelper */
using namespace Cxgriduicustomtablehelper;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxGridUICustomTableHelper
