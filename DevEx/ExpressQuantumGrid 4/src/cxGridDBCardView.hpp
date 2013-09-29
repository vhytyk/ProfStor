// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxGridDBCardView.pas' rev: 6.00

#ifndef cxGridDBCardViewHPP
#define cxGridDBCardViewHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxClasses.hpp>	// Pascal unit
#include <cxGridCustomView.hpp>	// Pascal unit
#include <cxDBData.hpp>	// Pascal unit
#include <cxCustomData.hpp>	// Pascal unit
#include <cxGridDBDataDefinitions.hpp>	// Pascal unit
#include <cxGridCardView.hpp>	// Pascal unit
#include <cxGridCustomTableView.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxgriddbcardview
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxGridDBCardViewRow;
class PASCALIMPLEMENTATION TcxGridDBCardViewRow : public Cxgridcardview::TcxGridCardViewRow 
{
	typedef Cxgridcardview::TcxGridCardViewRow inherited;
	
private:
	Cxgriddbdatadefinitions::TcxGridItemDBDataBinding* __fastcall GetDataBinding(void);
	HIDESBASE void __fastcall SetDataBinding(Cxgriddbdatadefinitions::TcxGridItemDBDataBinding* Value);
	
protected:
	virtual bool __fastcall GetStoredProperties(Classes::TStrings* AProperties);
	virtual void __fastcall GetPropertyValue(const AnsiString AName, Variant &AValue);
	virtual void __fastcall SetPropertyValue(const AnsiString AName, const Variant &AValue);
	
__published:
	__property Cxgriddbdatadefinitions::TcxGridItemDBDataBinding* DataBinding = {read=GetDataBinding, write=SetDataBinding};
public:
	#pragma option push -w-inl
	/* TcxCustomGridTableItem.Create */ inline __fastcall virtual TcxGridDBCardViewRow(Classes::TComponent* AOwner) : Cxgridcardview::TcxGridCardViewRow(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomGridTableItem.Destroy */ inline __fastcall virtual ~TcxGridDBCardViewRow(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridDBCardView;
class PASCALIMPLEMENTATION TcxGridDBCardView : public Cxgridcardview::TcxGridCardView 
{
	typedef Cxgridcardview::TcxGridCardView inherited;
	
private:
	HIDESBASE Cxgriddbdatadefinitions::TcxGridDBDataController* __fastcall GetDataController(void);
	HIDESBASE TcxGridDBCardViewRow* __fastcall GetRow(int Index);
	HIDESBASE void __fastcall SetDataController(Cxgriddbdatadefinitions::TcxGridDBDataController* Value);
	HIDESBASE void __fastcall SetRow(int Index, TcxGridDBCardViewRow* Value);
	
protected:
	virtual TMetaClass* __fastcall GetDataControllerClass(void);
	virtual TMetaClass* __fastcall GetItemClass(void);
	
public:
	HIDESBASE TcxGridDBCardViewRow* __fastcall CreateRow(void);
	TcxGridDBCardViewRow* __fastcall GetRowByFieldName(const AnsiString AFieldName);
	__property TcxGridDBCardViewRow* Rows[int Index] = {read=GetRow, write=SetRow};
	
__published:
	__property Cxgriddbdatadefinitions::TcxGridDBDataController* DataController = {read=GetDataController, write=SetDataController};
public:
	#pragma option push -w-inl
	/* TcxCustomGridTableView.Destroy */ inline __fastcall virtual ~TcxGridDBCardView(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomGridView.Create */ inline __fastcall virtual TcxGridDBCardView(Classes::TComponent* AOwner) : Cxgridcardview::TcxGridCardView(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxControlChildComponent.CreateEx */ inline __fastcall TcxGridDBCardView(Cxcontrols::TcxControl* AControl, bool AAssignOwner) : Cxgridcardview::TcxGridCardView(AControl, AAssignOwner) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxgriddbcardview */
using namespace Cxgriddbcardview;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxGridDBCardView
