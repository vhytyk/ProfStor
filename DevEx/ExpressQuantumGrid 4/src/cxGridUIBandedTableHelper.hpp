// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxGridUIBandedTableHelper.pas' rev: 6.00

#ifndef cxGridUIBandedTableHelperHPP
#define cxGridUIBandedTableHelperHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxGridUITableHelper.hpp>	// Pascal unit
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

namespace Cxgriduibandedtablehelper
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxGridBandedTableViewOperationHelper;
class PASCALIMPLEMENTATION TcxGridBandedTableViewOperationHelper : public Cxgriduitablehelper::TcxGridTableViewOperationHelper 
{
	typedef Cxgriduitablehelper::TcxGridTableViewOperationHelper inherited;
	
protected:
	virtual void __fastcall RegisterOperations(void);
	void __fastcall DoShowBands(const Cxgriduihelper::TcxCustomGridOperationHelperParameters* AParameter);
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewClass(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TcxCustomGridViewOperationHelper.Create */ inline __fastcall TcxGridBandedTableViewOperationHelper(void) : Cxgriduitablehelper::TcxGridTableViewOperationHelper() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomGridViewOperationHelper.Destroy */ inline __fastcall virtual ~TcxGridBandedTableViewOperationHelper(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxgriduibandedtablehelper */
using namespace Cxgriduibandedtablehelper;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxGridUIBandedTableHelper
