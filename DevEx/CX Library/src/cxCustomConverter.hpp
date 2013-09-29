// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxCustomConverter.pas' rev: 6.00

#ifndef cxCustomConverterHPP
#define cxCustomConverterHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <SysUtils.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <TypInfo.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxcustomconverter
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS EcxUnknownProperty;
class PASCALIMPLEMENTATION EcxUnknownProperty : public Sysutils::Exception 
{
	typedef Sysutils::Exception inherited;
	
public:
	#pragma option push -w-inl
	/* Exception.Create */ inline __fastcall EcxUnknownProperty(const AnsiString Msg) : Sysutils::Exception(Msg) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateFmt */ inline __fastcall EcxUnknownProperty(const AnsiString Msg, const System::TVarRec * Args, const int Args_Size) : Sysutils::Exception(Msg, Args, Args_Size) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateRes */ inline __fastcall EcxUnknownProperty(int Ident)/* overload */ : Sysutils::Exception(Ident) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResFmt */ inline __fastcall EcxUnknownProperty(int Ident, const System::TVarRec * Args, const int Args_Size)/* overload */ : Sysutils::Exception(Ident, Args, Args_Size) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateHelp */ inline __fastcall EcxUnknownProperty(const AnsiString Msg, int AHelpContext) : Sysutils::Exception(Msg, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateFmtHelp */ inline __fastcall EcxUnknownProperty(const AnsiString Msg, const System::TVarRec * Args, const int Args_Size, int AHelpContext) : Sysutils::Exception(Msg, Args, Args_Size, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResHelp */ inline __fastcall EcxUnknownProperty(int Ident, int AHelpContext)/* overload */ : Sysutils::Exception(Ident, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResFmtHelp */ inline __fastcall EcxUnknownProperty(System::PResStringRec ResStringRec, const System::TVarRec * Args, const int Args_Size, int AHelpContext)/* overload */ : Sysutils::Exception(ResStringRec, Args, Args_Size, AHelpContext) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~EcxUnknownProperty(void) { }
	#pragma option pop
	
};


class DELPHICLASS EcxConverterError;
class PASCALIMPLEMENTATION EcxConverterError : public Sysutils::Exception 
{
	typedef Sysutils::Exception inherited;
	
public:
	#pragma option push -w-inl
	/* Exception.Create */ inline __fastcall EcxConverterError(const AnsiString Msg) : Sysutils::Exception(Msg) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateFmt */ inline __fastcall EcxConverterError(const AnsiString Msg, const System::TVarRec * Args, const int Args_Size) : Sysutils::Exception(Msg, Args, Args_Size) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateRes */ inline __fastcall EcxConverterError(int Ident)/* overload */ : Sysutils::Exception(Ident) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResFmt */ inline __fastcall EcxConverterError(int Ident, const System::TVarRec * Args, const int Args_Size)/* overload */ : Sysutils::Exception(Ident, Args, Args_Size) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateHelp */ inline __fastcall EcxConverterError(const AnsiString Msg, int AHelpContext) : Sysutils::Exception(Msg, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateFmtHelp */ inline __fastcall EcxConverterError(const AnsiString Msg, const System::TVarRec * Args, const int Args_Size, int AHelpContext) : Sysutils::Exception(Msg, Args, Args_Size, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResHelp */ inline __fastcall EcxConverterError(int Ident, int AHelpContext)/* overload */ : Sysutils::Exception(Ident, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResFmtHelp */ inline __fastcall EcxConverterError(System::PResStringRec ResStringRec, const System::TVarRec * Args, const int Args_Size, int AHelpContext)/* overload */ : Sysutils::Exception(ResStringRec, Args, Args_Size, AHelpContext) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~EcxConverterError(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxCustomConverterClass;

class DELPHICLASS TcxCustomConverter;
class PASCALIMPLEMENTATION TcxCustomConverter : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	System::TObject* FDestination;
	bool FPropertyExceptionEnabled;
	System::TObject* FSource;
	System::TObject* __fastcall GetObject(System::TObject* AObject);
	Typinfo::PPropInfo __fastcall GetPropInfo_(System::TObject* AObject, const AnsiString AName);
	bool __fastcall TestProperty(System::TObject* AObject, const AnsiString AName, Typinfo::TTypeKind ATypeKind);
	
protected:
	virtual bool __fastcall CanConvert(void);
	void __fastcall DisablePropertyException(void);
	virtual void __fastcall DoImport(void);
	void __fastcall EnablePropertyException(void);
	bool __fastcall GetBooleanProperty(System::TObject* AObject, const AnsiString AName, const bool ADefaultValue = false);
	char __fastcall GetCharProperty(System::TObject* AObject, const AnsiString AName, const char ADefaultValue = '\x0');
	System::TObject* __fastcall GetClassProperty(System::TObject* AObject, const AnsiString AName, const System::TObject* ADefaultValue = (System::TObject*)(0x0));
	AnsiString __fastcall GetEnumProperty(System::TObject* AObject, const AnsiString AName, const AnsiString ADefaultValue = "");
	Extended __fastcall GetFloatProperty(System::TObject* AObject, const AnsiString AName, const Extended ADefaultValue = 0.000000E+00);
	int __fastcall GetIntegerProperty(System::TObject* AObject, const AnsiString AName, const int ADefaultValue = 0x0);
	System::_di_IInterface __fastcall GetInterfaceProperty(System::TObject* AObject, const AnsiString AName, const System::_di_IInterface ADefaultValue);
	System::TMethod __fastcall GetMethodProperty(System::TObject* AObject, const AnsiString AName, const System::TMethod &ADefaultValue);
	void __fastcall GetSetProperty(System::TObject* AObject, const AnsiString AName, Classes::TStrings* AValues);
	AnsiString __fastcall GetStringProperty(System::TObject* AObject, const AnsiString AName, const AnsiString ADefaultValue = "");
	Variant __fastcall GetVariantProperty(System::TObject* AObject, const AnsiString AName, const Variant &ADefaultValue);
	wchar_t __fastcall GetWideCharProperty(System::TObject* AObject, const AnsiString AName, const wchar_t ADefaultValue = wchar_t(0x0));
	WideString __fastcall GetWideStringProperty(System::TObject* AObject, const AnsiString AName, const WideString ADefaultValue = L"");
	virtual void __fastcall PostImport(void);
	virtual void __fastcall PreImport(void);
	
public:
	__fastcall virtual TcxCustomConverter(System::TObject* ADestination);
	/* virtual class method */ virtual AnsiString __fastcall GetSourceClassName(TMetaClass* vmt);
	void __fastcall ImportFrom(System::TObject* ASource);
	__property System::TObject* Destination = {read=FDestination};
	__property System::TObject* Source = {read=FSource, write=FSource};
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxCustomConverter(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxcustomconverter */
using namespace Cxcustomconverter;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxCustomConverter
