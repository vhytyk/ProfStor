// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxDBFilter.pas' rev: 6.00

#ifndef cxDBFilterHPP
#define cxDBFilterHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxDB.hpp>	// Pascal unit
#include <cxFilter.hpp>	// Pascal unit
#include <DB.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxdbfilter
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxFilterSQLNullOperator;
class PASCALIMPLEMENTATION TcxFilterSQLNullOperator : public Cxfilter::TcxFilterNullOperator 
{
	typedef Cxfilter::TcxFilterNullOperator inherited;
	
public:
	virtual AnsiString __fastcall FilterText();
public:
	#pragma option push -w-inl
	/* TcxFilterOperator.Create */ inline __fastcall virtual TcxFilterSQLNullOperator(Cxfilter::TcxFilterCriteriaItem* ACriteriaItem) : Cxfilter::TcxFilterNullOperator(ACriteriaItem) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFilterSQLNullOperator(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFilterSQLNotNullOperator;
class PASCALIMPLEMENTATION TcxFilterSQLNotNullOperator : public Cxfilter::TcxFilterNotNullOperator 
{
	typedef Cxfilter::TcxFilterNotNullOperator inherited;
	
public:
	virtual AnsiString __fastcall FilterText();
public:
	#pragma option push -w-inl
	/* TcxFilterOperator.Create */ inline __fastcall virtual TcxFilterSQLNotNullOperator(Cxfilter::TcxFilterCriteriaItem* ACriteriaItem) : Cxfilter::TcxFilterNotNullOperator(ACriteriaItem) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFilterSQLNotNullOperator(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxDBFilterOperatorAdapter;
class PASCALIMPLEMENTATION TcxDBFilterOperatorAdapter : public Cxdb::TcxDBAdapterItem 
{
	typedef Cxdb::TcxDBAdapterItem inherited;
	
public:
	virtual void __fastcall PrepareOperatorClass(System::TObject* ASender, Db::TDataSet* ADataSet, TMetaClass* &AOperatorClass);
public:
	#pragma option push -w-inl
	/* TcxDBAdapterItem.Create */ inline __fastcall TcxDBFilterOperatorAdapter(TMetaClass* ADataSetClass) : Cxdb::TcxDBAdapterItem(ADataSetClass) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxDBFilterOperatorAdapter(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE Cxdb::TcxDBAdapterList* cxFilterOperatorAdapters;
extern PACKAGE TcxDBFilterOperatorAdapter* __fastcall cxGetFilterOperatorAdapter(Db::TDataSet* ADataSet);

}	/* namespace Cxdbfilter */
using namespace Cxdbfilter;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxDBFilter
