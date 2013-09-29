// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxGridUITableHelper.pas' rev: 6.00

#ifndef cxGridUITableHelperHPP
#define cxGridUITableHelperHPP

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

namespace Cxgriduitablehelper
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxGridTableViewOperationHelper;
class PASCALIMPLEMENTATION TcxGridTableViewOperationHelper : public Cxgriduicustomtablehelper::TcxGridCustomTableViewOperationHelper 
{
	typedef Cxgriduicustomtablehelper::TcxGridCustomTableViewOperationHelper inherited;
	
protected:
	virtual void __fastcall RegisterOperations(void);
	void __fastcall DoShowColumnsCustomizing(const Cxgriduihelper::TcxCustomGridOperationHelperParameters* AParameter);
	void __fastcall DoShowGroupingPanel(const Cxgriduihelper::TcxCustomGridOperationHelperParameters* AParameter);
	void __fastcall DoShowSummaryFooter(const Cxgriduihelper::TcxCustomGridOperationHelperParameters* AParameter);
	void __fastcall DoShowGrid(const Cxgriduihelper::TcxCustomGridOperationHelperParameters* AParameter);
	void __fastcall DoColumnAutoWidth(const Cxgriduihelper::TcxCustomGridOperationHelperParameters* AParameter);
	void __fastcall DoShowPreview(const Cxgriduihelper::TcxCustomGridOperationHelperParameters* AParameter);
	void __fastcall DoShowHeaders(const Cxgriduihelper::TcxCustomGridOperationHelperParameters* AParameter);
	void __fastcall DoShowColumnCustomize(const Cxgriduihelper::TcxCustomGridOperationHelperParameters* AParameter);
	void __fastcall DoInvertSelect(const Cxgriduihelper::TcxCustomGridOperationHelperParameters* AParameter);
	void __fastcall DoShowIndicator(const Cxgriduihelper::TcxCustomGridOperationHelperParameters* AParameter);
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewClass(TMetaClass* vmt);
	virtual bool __fastcall IsOperationEnabled(Cxgridcustomview::TcxCustomGridView* AView, int AOperationIndex);
public:
	#pragma option push -w-inl
	/* TcxCustomGridViewOperationHelper.Create */ inline __fastcall TcxGridTableViewOperationHelper(void) : Cxgriduicustomtablehelper::TcxGridCustomTableViewOperationHelper() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomGridViewOperationHelper.Destroy */ inline __fastcall virtual ~TcxGridTableViewOperationHelper(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxgriduitablehelper */
using namespace Cxgriduitablehelper;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxGridUITableHelper
