// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'dxNavBarViewsFact.pas' rev: 6.00

#ifndef dxNavBarViewsFactHPP
#define dxNavBarViewsFactHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <dxNavBar.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Dxnavbarviewsfact
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TdxNavBarViewsFactory;
class PASCALIMPLEMENTATION TdxNavBarViewsFactory : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	Classes::TList* FViews;
	int __fastcall GetCount(void);
	AnsiString __fastcall GetNames(int ID);
	TMetaClass* __fastcall GetPainterClass(int ID);
	void __fastcall Clear(void);
	int __fastcall IndexOfID(const int ID);
	
public:
	__fastcall TdxNavBarViewsFactory(void);
	__fastcall virtual ~TdxNavBarViewsFactory(void);
	void __fastcall RegisterView(int AID, AnsiString AName, TMetaClass* APainterClass);
	int __fastcall IndexOfName(const AnsiString Name);
	__property int Count = {read=GetCount, nodefault};
	__property AnsiString Names[int ID] = {read=GetNames};
	__property TMetaClass* PainterClasses[int ID] = {read=GetPainterClass};
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE TdxNavBarViewsFactory* __fastcall dxNavBarViewsFactory(void);

}	/* namespace Dxnavbarviewsfact */
using namespace Dxnavbarviewsfact;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// dxNavBarViewsFact
