// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxGridFooterPopupMenuItems.pas' rev: 6.00

#ifndef cxGridFooterPopupMenuItemsHPP
#define cxGridFooterPopupMenuItemsHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxCustomData.hpp>	// Pascal unit
#include <cxGridMenuOperations.hpp>	// Pascal unit
#include <cxGridCustomPopupMenu.hpp>	// Pascal unit
#include <cxGridTableView.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <Types.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxgridfooterpopupmenuitems
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxGridFooterPopupMenuOperation;
class PASCALIMPLEMENTATION TcxGridFooterPopupMenuOperation : public Cxgridmenuoperations::TcxGridTablePopupMenuOperation 
{
	typedef Cxgridmenuoperations::TcxGridTablePopupMenuOperation inherited;
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetPopupMenuClass(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TcxGridPopupMenuOperation.Create */ inline __fastcall virtual TcxGridFooterPopupMenuOperation(const Classes::TComponent* AMenuItem) : Cxgridmenuoperations::TcxGridTablePopupMenuOperation(AMenuItem) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridFooterPopupMenuOperation(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridFooterMenuItem;
class PASCALIMPLEMENTATION TcxGridFooterMenuItem : public TcxGridFooterPopupMenuOperation 
{
	typedef TcxGridFooterPopupMenuOperation inherited;
	
private:
	Cxcustomdata::TcxSummaryKind __fastcall GetKind(void);
	Cxcustomdata::TcxDataSummaryItems* __fastcall GetGroupSummaryItemsByGroupedColumn(void);
	void __fastcall AddSummaryItem(Cxcustomdata::TcxDataSummaryItems* ASummaryItems);
	
protected:
	virtual void __fastcall DoFooter(System::TObject* Sender);
	virtual bool __fastcall GetDown(void);
	virtual bool __fastcall GetEnabled(void);
public:
	#pragma option push -w-inl
	/* TcxGridPopupMenuOperation.Create */ inline __fastcall virtual TcxGridFooterMenuItem(const Classes::TComponent* AMenuItem) : TcxGridFooterPopupMenuOperation(AMenuItem) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridFooterMenuItem(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridSumMenuItem;
class PASCALIMPLEMENTATION TcxGridSumMenuItem : public TcxGridFooterMenuItem 
{
	typedef TcxGridFooterMenuItem inherited;
	
public:
	__fastcall virtual TcxGridSumMenuItem(const Classes::TComponent* AMenuItem);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridSumMenuItem(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridMinMenuItem;
class PASCALIMPLEMENTATION TcxGridMinMenuItem : public TcxGridFooterMenuItem 
{
	typedef TcxGridFooterMenuItem inherited;
	
public:
	__fastcall virtual TcxGridMinMenuItem(const Classes::TComponent* AMenuItem);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridMinMenuItem(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridMaxMenuItem;
class PASCALIMPLEMENTATION TcxGridMaxMenuItem : public TcxGridFooterMenuItem 
{
	typedef TcxGridFooterMenuItem inherited;
	
public:
	__fastcall virtual TcxGridMaxMenuItem(const Classes::TComponent* AMenuItem);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridMaxMenuItem(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridCountMenuItem;
class PASCALIMPLEMENTATION TcxGridCountMenuItem : public TcxGridFooterMenuItem 
{
	typedef TcxGridFooterMenuItem inherited;
	
public:
	__fastcall virtual TcxGridCountMenuItem(const Classes::TComponent* AMenuItem);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridCountMenuItem(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridAvgMenuItem;
class PASCALIMPLEMENTATION TcxGridAvgMenuItem : public TcxGridFooterMenuItem 
{
	typedef TcxGridFooterMenuItem inherited;
	
public:
	__fastcall virtual TcxGridAvgMenuItem(const Classes::TComponent* AMenuItem);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridAvgMenuItem(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridNoneMenuItem;
class PASCALIMPLEMENTATION TcxGridNoneMenuItem : public TcxGridFooterMenuItem 
{
	typedef TcxGridFooterMenuItem inherited;
	
public:
	__fastcall virtual TcxGridNoneMenuItem(const Classes::TComponent* AMenuItem);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridNoneMenuItem(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxgridfooterpopupmenuitems */
using namespace Cxgridfooterpopupmenuitems;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxGridFooterPopupMenuItems
