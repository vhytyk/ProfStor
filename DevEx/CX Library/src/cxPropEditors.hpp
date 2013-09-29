// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxPropEditors.pas' rev: 6.00

#ifndef cxPropEditorsHPP
#define cxPropEditorsHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <TypInfo.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <DesignEditors.hpp>	// Pascal unit
#include <DesignIntf.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxpropeditors
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxNestedEventProperty;
class PASCALIMPLEMENTATION TcxNestedEventProperty : public Designeditors::TMethodProperty 
{
	typedef Designeditors::TMethodProperty inherited;
	
protected:
	virtual Classes::TPersistent* __fastcall GetInstance(void) = 0 ;
	
public:
	virtual Designintf::TPropertyAttributes __fastcall GetAttributes(void);
	virtual AnsiString __fastcall GetName();
	virtual void __fastcall GetProperties(Designintf::TGetPropProc Proc);
	virtual AnsiString __fastcall GetValue();
	__property Classes::TPersistent* Instance = {read=GetInstance};
public:
	#pragma option push -w-inl
	/* TPropertyEditor.Create */ inline __fastcall virtual TcxNestedEventProperty(const Designintf::_di_IDesigner ADesigner, int APropCount) : Designeditors::TMethodProperty(ADesigner, APropCount) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TcxNestedEventProperty(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxNestedParentElementEventProperty;
class PASCALIMPLEMENTATION TcxNestedParentElementEventProperty : public Designeditors::TNestedProperty 
{
	typedef Designeditors::TNestedProperty inherited;
	
private:
	Classes::TPersistent* FOwner;
	Typinfo::TPropInfo *FPropInfo;
	Designeditors::TPropertyEditor* FParent;
	Classes::TPersistent* __fastcall GetInstance(void);
	
protected:
	__fastcall TcxNestedParentElementEventProperty(Designeditors::TPropertyEditor* Parent, Classes::TPersistent* AOwner, Typinfo::PPropInfo APropInfo);
	
public:
	virtual Designintf::TPropertyAttributes __fastcall GetAttributes(void);
	virtual void __fastcall GetProperties(Designintf::TGetPropProc Proc);
	virtual AnsiString __fastcall GetValue();
	virtual AnsiString __fastcall GetName();
	__property Classes::TPersistent* Instance = {read=GetInstance};
public:
	#pragma option push -w-inl
	/* TNestedProperty.Destroy */ inline __fastcall virtual ~TcxNestedParentElementEventProperty(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxNestedElementEventProperty;
class PASCALIMPLEMENTATION TcxNestedElementEventProperty : public Designeditors::TNestedProperty 
{
	typedef Designeditors::TNestedProperty inherited;
	
private:
	Designeditors::TPropertyEditor* FParent;
	Typinfo::TPropInfo *FPropInfo;
	AnsiString __fastcall GetTrimmedEventName();
	AnsiString __fastcall GetPersistentClassNames();
	Classes::TPersistent* __fastcall GetInstance(void);
	
protected:
	__fastcall TcxNestedElementEventProperty(Designeditors::TPropertyEditor* Parent, Typinfo::PPropInfo APropInfo);
	virtual AnsiString __fastcall GetFormMethodName();
	__property Classes::TPersistent* Instance = {read=GetInstance};
	
public:
	virtual bool __fastcall AllEqual(void);
	virtual void __fastcall Edit(void);
	virtual Designintf::TPropertyAttributes __fastcall GetAttributes(void);
	virtual int __fastcall GetEditLimit(void);
	virtual AnsiString __fastcall GetName();
	virtual AnsiString __fastcall GetValue();
	virtual void __fastcall GetValues(Classes::TGetStrProc Proc);
	virtual void __fastcall SetValue(const AnsiString AValue);
public:
	#pragma option push -w-inl
	/* TNestedProperty.Destroy */ inline __fastcall virtual ~TcxNestedElementEventProperty(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxpropeditors */
using namespace Cxpropeditors;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxPropEditors
