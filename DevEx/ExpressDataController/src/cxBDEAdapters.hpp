// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxBDEAdapters.pas' rev: 6.00

#ifndef cxBDEAdaptersHPP
#define cxBDEAdaptersHPP

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

namespace Cxbdeadapters
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxBDEFilterOperatorAdapter;
class PASCALIMPLEMENTATION TcxBDEFilterOperatorAdapter : public Cxdbfilter::TcxDBFilterOperatorAdapter 
{
	typedef Cxdbfilter::TcxDBFilterOperatorAdapter inherited;
	
public:
	virtual void __fastcall PrepareOperatorClass(System::TObject* ASender, Db::TDataSet* ADataSet, TMetaClass* &AOperatorClass);
public:
	#pragma option push -w-inl
	/* TcxDBAdapterItem.Create */ inline __fastcall TcxBDEFilterOperatorAdapter(TMetaClass* ADataSetClass) : Cxdbfilter::TcxDBFilterOperatorAdapter(ADataSetClass) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxBDEFilterOperatorAdapter(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxbdeadapters */
using namespace Cxbdeadapters;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxBDEAdapters
