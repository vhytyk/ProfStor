// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxGridHeaderPopupMenuItems.pas' rev: 6.00

#ifndef cxGridHeaderPopupMenuItemsHPP
#define cxGridHeaderPopupMenuItemsHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxGridMenuOperations.hpp>	// Pascal unit
#include <cxGridCustomPopupMenu.hpp>	// Pascal unit
#include <cxGridTableView.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxgridheaderpopupmenuitems
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxGridHeaderPopupMenuOperation;
class PASCALIMPLEMENTATION TcxGridHeaderPopupMenuOperation : public Cxgridmenuoperations::TcxGridTablePopupMenuOperation 
{
	typedef Cxgridmenuoperations::TcxGridTablePopupMenuOperation inherited;
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetPopupMenuClass(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TcxGridPopupMenuOperation.Create */ inline __fastcall virtual TcxGridHeaderPopupMenuOperation(const Classes::TComponent* AMenuItem) : Cxgridmenuoperations::TcxGridTablePopupMenuOperation(AMenuItem) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridHeaderPopupMenuOperation(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridSortColumn;
class PASCALIMPLEMENTATION TcxGridSortColumn : public TcxGridHeaderPopupMenuOperation 
{
	typedef TcxGridHeaderPopupMenuOperation inherited;
	
protected:
	void __fastcall DoSort(System::TObject* Sender);
	virtual bool __fastcall GetDown(void);
	virtual bool __fastcall GetEnabled(void);
public:
	#pragma option push -w-inl
	/* TcxGridPopupMenuOperation.Create */ inline __fastcall virtual TcxGridSortColumn(const Classes::TComponent* AMenuItem) : TcxGridHeaderPopupMenuOperation(AMenuItem) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridSortColumn(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridSortColumnAsc;
class PASCALIMPLEMENTATION TcxGridSortColumnAsc : public TcxGridSortColumn 
{
	typedef TcxGridSortColumn inherited;
	
public:
	__fastcall virtual TcxGridSortColumnAsc(const Classes::TComponent* AMenuItem);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridSortColumnAsc(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridSortColumnDesc;
class PASCALIMPLEMENTATION TcxGridSortColumnDesc : public TcxGridSortColumn 
{
	typedef TcxGridSortColumn inherited;
	
public:
	__fastcall virtual TcxGridSortColumnDesc(const Classes::TComponent* AMenuItem);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridSortColumnDesc(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridGroupByThisField;
class PASCALIMPLEMENTATION TcxGridGroupByThisField : public TcxGridHeaderPopupMenuOperation 
{
	typedef TcxGridHeaderPopupMenuOperation inherited;
	
protected:
	virtual AnsiString __fastcall GetCaption();
	virtual bool __fastcall GetEnabled(void);
	void __fastcall DoGroupBy(System::TObject* Sender);
	
public:
	__fastcall virtual TcxGridGroupByThisField(const Classes::TComponent* AMenuItem);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridGroupByThisField(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridGroupByBox;
class PASCALIMPLEMENTATION TcxGridGroupByBox : public TcxGridHeaderPopupMenuOperation 
{
	typedef TcxGridHeaderPopupMenuOperation inherited;
	
protected:
	virtual bool __fastcall GetDown(void);
	void __fastcall DoGroupByBox(System::TObject* Sender);
	
public:
	__fastcall virtual TcxGridGroupByBox(const Classes::TComponent* AMenuItem);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridGroupByBox(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridAlignmentSubMenu;
class PASCALIMPLEMENTATION TcxGridAlignmentSubMenu : public TcxGridHeaderPopupMenuOperation 
{
	typedef TcxGridHeaderPopupMenuOperation inherited;
	
protected:
	void __fastcall DoAlign(System::TObject* Sender);
	
public:
	__fastcall virtual TcxGridAlignmentSubMenu(const Classes::TComponent* AMenuItem);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridAlignmentSubMenu(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridAlign;
class PASCALIMPLEMENTATION TcxGridAlign : public TcxGridHeaderPopupMenuOperation 
{
	typedef TcxGridHeaderPopupMenuOperation inherited;
	
protected:
	void __fastcall DoAlign(System::TObject* Sender);
	virtual bool __fastcall GetDown(void);
	virtual bool __fastcall GetEnabled(void);
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetSubOperationClass(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TcxGridPopupMenuOperation.Create */ inline __fastcall virtual TcxGridAlign(const Classes::TComponent* AMenuItem) : TcxGridHeaderPopupMenuOperation(AMenuItem) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridAlign(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridAlignLeft;
class PASCALIMPLEMENTATION TcxGridAlignLeft : public TcxGridAlign 
{
	typedef TcxGridAlign inherited;
	
public:
	__fastcall virtual TcxGridAlignLeft(const Classes::TComponent* AMenuItem);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridAlignLeft(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridAlignRight;
class PASCALIMPLEMENTATION TcxGridAlignRight : public TcxGridAlign 
{
	typedef TcxGridAlign inherited;
	
public:
	__fastcall virtual TcxGridAlignRight(const Classes::TComponent* AMenuItem);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridAlignRight(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridAlignCenter;
class PASCALIMPLEMENTATION TcxGridAlignCenter : public TcxGridAlign 
{
	typedef TcxGridAlign inherited;
	
public:
	__fastcall virtual TcxGridAlignCenter(const Classes::TComponent* AMenuItem);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridAlignCenter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridBestFit;
class PASCALIMPLEMENTATION TcxGridBestFit : public TcxGridHeaderPopupMenuOperation 
{
	typedef TcxGridHeaderPopupMenuOperation inherited;
	
protected:
	void __fastcall DoBestFit(System::TObject* Sender);
	
public:
	__fastcall virtual TcxGridBestFit(const Classes::TComponent* AMenuItem);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridBestFit(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridBestFitAllColumns;
class PASCALIMPLEMENTATION TcxGridBestFitAllColumns : public TcxGridHeaderPopupMenuOperation 
{
	typedef TcxGridHeaderPopupMenuOperation inherited;
	
protected:
	void __fastcall DoBestFitAllColumns(System::TObject* Sender);
	
public:
	__fastcall virtual TcxGridBestFitAllColumns(const Classes::TComponent* AMenuItem);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridBestFitAllColumns(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridRemoveColumn;
class PASCALIMPLEMENTATION TcxGridRemoveColumn : public TcxGridHeaderPopupMenuOperation 
{
	typedef TcxGridHeaderPopupMenuOperation inherited;
	
protected:
	void __fastcall DoRemoveThisColumn(System::TObject* Sender);
	
public:
	__fastcall virtual TcxGridRemoveColumn(const Classes::TComponent* AMenuItem);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridRemoveColumn(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridFieldChooser;
class PASCALIMPLEMENTATION TcxGridFieldChooser : public TcxGridHeaderPopupMenuOperation 
{
	typedef TcxGridHeaderPopupMenuOperation inherited;
	
protected:
	void __fastcall DoFieldChooser(System::TObject* Sender);
	virtual bool __fastcall GetDown(void);
	
public:
	__fastcall virtual TcxGridFieldChooser(const Classes::TComponent* AMenuItem);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridFieldChooser(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridShowFooter;
class PASCALIMPLEMENTATION TcxGridShowFooter : public TcxGridHeaderPopupMenuOperation 
{
	typedef TcxGridHeaderPopupMenuOperation inherited;
	
protected:
	void __fastcall DoShowFooter(System::TObject* Sender);
	virtual bool __fastcall GetDown(void);
	
public:
	__fastcall virtual TcxGridShowFooter(const Classes::TComponent* AMenuItem);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridShowFooter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridShowGroupFooter;
class PASCALIMPLEMENTATION TcxGridShowGroupFooter : public TcxGridHeaderPopupMenuOperation 
{
	typedef TcxGridHeaderPopupMenuOperation inherited;
	
protected:
	void __fastcall DoShowFooter(System::TObject* Sender);
	virtual bool __fastcall GetDown(void);
	
public:
	__fastcall virtual TcxGridShowGroupFooter(const Classes::TComponent* AMenuItem);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridShowGroupFooter(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE Classes::TList* AOperationList;

}	/* namespace Cxgridheaderpopupmenuitems */
using namespace Cxgridheaderpopupmenuitems;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxGridHeaderPopupMenuItems
