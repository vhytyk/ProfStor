// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxADOAdapters.pas' rev: 6.00

#ifndef cxADOAdaptersHPP
#define cxADOAdaptersHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxDBFilter.hpp>	// Pascal unit
#include <cxFilter.hpp>	// Pascal unit
#include <cxDBData.hpp>	// Pascal unit
#include <DB.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxadoadapters
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxADOProviderDetailFilterAdapter;
class PASCALIMPLEMENTATION TcxADOProviderDetailFilterAdapter : public Cxdbdata::TcxDBProviderDetailFilterAdapter 
{
	typedef Cxdbdata::TcxDBProviderDetailFilterAdapter inherited;
	
public:
	virtual bool __fastcall IsCurrentQuery(Db::TDataSet* ADataSet, const AnsiString AParamNames, const Variant &AParamValues);
	virtual void __fastcall ReopenSQL(Db::TDataSet* ADataSet, const AnsiString AParamNames, const Variant &AParamValues, bool &AReopened);
public:
	#pragma option push -w-inl
	/* TcxDBAdapterItem.Create */ inline __fastcall TcxADOProviderDetailFilterAdapter(TMetaClass* ADataSetClass) : Cxdbdata::TcxDBProviderDetailFilterAdapter(ADataSetClass) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxADOProviderDetailFilterAdapter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxADOFilterOperatorAdapter;
class PASCALIMPLEMENTATION TcxADOFilterOperatorAdapter : public Cxdbfilter::TcxDBFilterOperatorAdapter 
{
	typedef Cxdbfilter::TcxDBFilterOperatorAdapter inherited;
	
public:
	virtual void __fastcall PrepareOperatorClass(System::TObject* ASender, Db::TDataSet* ADataSet, TMetaClass* &AOperatorClass);
public:
	#pragma option push -w-inl
	/* TcxDBAdapterItem.Create */ inline __fastcall TcxADOFilterOperatorAdapter(TMetaClass* ADataSetClass) : Cxdbfilter::TcxDBFilterOperatorAdapter(ADataSetClass) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxADOFilterOperatorAdapter(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxadoadapters */
using namespace Cxadoadapters;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxADOAdapters
