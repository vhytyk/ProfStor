// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxIBXAdapters.pas' rev: 6.00

#ifndef cxIBXAdaptersHPP
#define cxIBXAdaptersHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxDBFilter.hpp>	// Pascal unit
#include <cxFilter.hpp>	// Pascal unit
#include <cxDBData.hpp>	// Pascal unit
#include <IBSQL.hpp>	// Pascal unit
#include <DB.hpp>	// Pascal unit
#include <Variants.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxibxadapters
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxIBXProviderDetailFilterAdapter;
class PASCALIMPLEMENTATION TcxIBXProviderDetailFilterAdapter : public Cxdbdata::TcxDBProviderDetailFilterAdapter 
{
	typedef Cxdbdata::TcxDBProviderDetailFilterAdapter inherited;
	
protected:
	Variant __fastcall GetParamValues(Ibsql::TIBXSQLDA* ASQLParams);
	void __fastcall SetParamValues(Ibsql::TIBXSQLDA* ASQLParams, const Variant &AValues);
	
public:
	virtual bool __fastcall IsCurrentQuery(Db::TDataSet* ADataSet, const AnsiString AParamNames, const Variant &AParamValues);
	virtual void __fastcall ReopenSQL(Db::TDataSet* ADataSet, const AnsiString AParamNames, const Variant &AParamValues, bool &AReopened);
public:
	#pragma option push -w-inl
	/* TcxDBAdapterItem.Create */ inline __fastcall TcxIBXProviderDetailFilterAdapter(TMetaClass* ADataSetClass) : Cxdbdata::TcxDBProviderDetailFilterAdapter(ADataSetClass) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxIBXProviderDetailFilterAdapter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxIBXFilterOperatorAdapter;
class PASCALIMPLEMENTATION TcxIBXFilterOperatorAdapter : public Cxdbfilter::TcxDBFilterOperatorAdapter 
{
	typedef Cxdbfilter::TcxDBFilterOperatorAdapter inherited;
	
public:
	virtual void __fastcall PrepareOperatorClass(System::TObject* ASender, Db::TDataSet* ADataSet, TMetaClass* &AOperatorClass);
public:
	#pragma option push -w-inl
	/* TcxDBAdapterItem.Create */ inline __fastcall TcxIBXFilterOperatorAdapter(TMetaClass* ADataSetClass) : Cxdbfilter::TcxDBFilterOperatorAdapter(ADataSetClass) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxIBXFilterOperatorAdapter(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxibxadapters */
using namespace Cxibxadapters;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxIBXAdapters
