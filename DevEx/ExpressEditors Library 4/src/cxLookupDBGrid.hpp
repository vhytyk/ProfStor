// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxLookupDBGrid.pas' rev: 6.00

#ifndef cxLookupDBGridHPP
#define cxLookupDBGridHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxLookAndFeels.hpp>	// Pascal unit
#include <cxLookupGrid.hpp>	// Pascal unit
#include <cxEditRepositoryItems.hpp>	// Pascal unit
#include <cxDBData.hpp>	// Pascal unit
#include <cxDB.hpp>	// Pascal unit
#include <cxCustomData.hpp>	// Pascal unit
#include <cxDBEdit.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxLookAndFeelPainters.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <DB.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxlookupdbgrid
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxLookupGridDBDataController;
class DELPHICLASS TcxCustomLookupDBGrid;
class PASCALIMPLEMENTATION TcxLookupGridDBDataController : public Cxdbdata::TcxDBDataController 
{
	typedef Cxdbdata::TcxDBDataController inherited;
	
private:
	TcxCustomLookupDBGrid* __fastcall GetGrid(void);
	
protected:
	virtual void __fastcall UpdateScrollBars(void);
	
public:
	__fastcall virtual TcxLookupGridDBDataController(Classes::TComponent* AOwner);
	virtual System::TObject* __fastcall GetItem(int Index);
	__property TcxCustomLookupDBGrid* Grid = {read=GetGrid};
	
__published:
	__property OnCompare ;
public:
	#pragma option push -w-inl
	/* TcxDBDataController.Destroy */ inline __fastcall virtual ~TcxLookupGridDBDataController(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxLookupDBGridDefaultValuesProvider;
class PASCALIMPLEMENTATION TcxLookupDBGridDefaultValuesProvider : public Cxdbedit::TcxCustomDBEditDefaultValuesProvider 
{
	typedef Cxdbedit::TcxCustomDBEditDefaultValuesProvider inherited;
	
__published:
	virtual bool __fastcall IsDisplayFormatDefined(bool AIsCurrencyValueAccepted);
public:
	#pragma option push -w-inl
	/* TcxCustomDBEditDefaultValuesProvider.Create */ inline __fastcall virtual TcxLookupDBGridDefaultValuesProvider(Classes::TPersistent* AOwner) : Cxdbedit::TcxCustomDBEditDefaultValuesProvider(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomDBEditDefaultValuesProvider.Destroy */ inline __fastcall virtual ~TcxLookupDBGridDefaultValuesProvider(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxLookupDBGridColumn;
class PASCALIMPLEMENTATION TcxLookupDBGridColumn : public Cxlookupgrid::TcxLookupGridColumn 
{
	typedef Cxlookupgrid::TcxLookupGridColumn inherited;
	
private:
	HIDESBASE TcxLookupGridDBDataController* __fastcall GetDataController(void);
	Db::TField* __fastcall GetField(void);
	AnsiString __fastcall GetFieldName();
	void __fastcall SetFieldName(const AnsiString Value);
	
protected:
	virtual TMetaClass* __fastcall GetDefaultValuesProviderClass(void);
	void __fastcall InitDefaultValuesProvider(void);
	__property TcxLookupGridDBDataController* DataController = {read=GetDataController};
	
public:
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual AnsiString __fastcall DefaultCaption();
	virtual Cxedit::TcxEditRepositoryItem* __fastcall DefaultRepositoryItem(void);
	virtual int __fastcall DefaultWidth(void);
	__property Db::TField* Field = {read=GetField};
	
__published:
	__property AnsiString FieldName = {read=GetFieldName, write=SetFieldName};
public:
	#pragma option push -w-inl
	/* TcxLookupGridColumn.Create */ inline __fastcall virtual TcxLookupDBGridColumn(Classes::TCollection* Collection) : Cxlookupgrid::TcxLookupGridColumn(Collection) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxLookupGridColumn.Destroy */ inline __fastcall virtual ~TcxLookupDBGridColumn(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxLookupDBGridColumns;
class PASCALIMPLEMENTATION TcxLookupDBGridColumns : public Cxlookupgrid::TcxLookupGridColumns 
{
	typedef Cxlookupgrid::TcxLookupGridColumns inherited;
	
public:
	TcxLookupDBGridColumn* operator[](int Index) { return Items[Index]; }
	
private:
	HIDESBASE TcxLookupDBGridColumn* __fastcall GetColumn(int Index);
	HIDESBASE void __fastcall SetColumn(int Index, TcxLookupDBGridColumn* Value);
	
public:
	HIDESBASE TcxLookupDBGridColumn* __fastcall Add(void);
	TcxLookupDBGridColumn* __fastcall ColumnByFieldName(const AnsiString AFieldName);
	__property TcxLookupDBGridColumn* Items[int Index] = {read=GetColumn, write=SetColumn/*, default*/};
public:
	#pragma option push -w-inl
	/* TcxLookupGridColumns.Create */ inline __fastcall virtual TcxLookupDBGridColumns(Cxlookupgrid::TcxCustomLookupGrid* AGrid, TMetaClass* AColumnClass) : Cxlookupgrid::TcxLookupGridColumns(AGrid, AColumnClass) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TCollection.Destroy */ inline __fastcall virtual ~TcxLookupDBGridColumns(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxCustomLookupDBGrid : public Cxlookupgrid::TcxCustomLookupGrid 
{
	typedef Cxlookupgrid::TcxCustomLookupGrid inherited;
	
private:
	TcxLookupDBGridColumns* __fastcall GetColumns(void);
	HIDESBASE TcxLookupGridDBDataController* __fastcall GetDataController(void);
	Db::TDataSource* __fastcall GetDataSource(void);
	AnsiString __fastcall GetKeyFieldNames();
	HIDESBASE void __fastcall SetColumns(TcxLookupDBGridColumns* Value);
	HIDESBASE void __fastcall SetDataController(TcxLookupGridDBDataController* Value);
	void __fastcall SetDataSource(Db::TDataSource* Value);
	void __fastcall SetKeyFieldNames(const AnsiString Value);
	
protected:
	virtual void __fastcall CreateColumnsByFields(Classes::TStrings* AFieldNames);
	virtual void __fastcall DataChanged(void);
	virtual TMetaClass* __fastcall GetColumnClass(void);
	virtual TMetaClass* __fastcall GetColumnsClass(void);
	virtual TMetaClass* __fastcall GetDataControllerClass(void);
	virtual void __fastcall InitScrollBarsParameters(void);
	virtual void __fastcall Scroll(Forms::TScrollBarKind AScrollBarKind, Stdctrls::TScrollCode AScrollCode, int &AScrollPos);
	
public:
	void __fastcall CreateAllColumns(void);
	void __fastcall CreateColumnsByFieldNames(const AnsiString AFieldNames);
	__property TcxLookupDBGridColumns* Columns = {read=GetColumns, write=SetColumns};
	__property TcxLookupGridDBDataController* DataController = {read=GetDataController, write=SetDataController};
	
__published:
	__property Db::TDataSource* DataSource = {read=GetDataSource, write=SetDataSource};
	__property AnsiString KeyFieldNames = {read=GetKeyFieldNames, write=SetKeyFieldNames};
public:
	#pragma option push -w-inl
	/* TcxCustomLookupGrid.Create */ inline __fastcall virtual TcxCustomLookupDBGrid(Classes::TComponent* AOwner) : Cxlookupgrid::TcxCustomLookupGrid(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomLookupGrid.Destroy */ inline __fastcall virtual ~TcxCustomLookupDBGrid(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomLookupDBGrid(HWND ParentWindow) : Cxlookupgrid::TcxCustomLookupGrid(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxLookupDBGrid;
class PASCALIMPLEMENTATION TcxLookupDBGrid : public TcxCustomLookupDBGrid 
{
	typedef TcxCustomLookupDBGrid inherited;
	
__published:
	__property Align  = {default=0};
	__property Anchors  = {default=3};
	__property Color  = {default=-2147483643};
	__property Font ;
	__property ParentFont  = {default=1};
	__property Visible  = {default=1};
	__property Columns ;
	__property Options ;
	__property LookAndFeel ;
public:
	#pragma option push -w-inl
	/* TcxCustomLookupGrid.Create */ inline __fastcall virtual TcxLookupDBGrid(Classes::TComponent* AOwner) : TcxCustomLookupDBGrid(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomLookupGrid.Destroy */ inline __fastcall virtual ~TcxLookupDBGrid(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxLookupDBGrid(HWND ParentWindow) : TcxCustomLookupDBGrid(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxlookupdbgrid */
using namespace Cxlookupdbgrid;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxLookupDBGrid
