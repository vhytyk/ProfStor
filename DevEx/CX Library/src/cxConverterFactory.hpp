// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxConverterFactory.pas' rev: 6.00

#ifndef cxConverterFactoryHPP
#define cxConverterFactoryHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxCustomConverter.hpp>	// Pascal unit
#include <cxDesignWindows.hpp>	// Pascal unit
#include <cxLibraryStrs.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <cxStyles.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <DesignIntf.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxconverterfactory
{
//-- type declarations -------------------------------------------------------
typedef TMetaClass*TcxCustomConverterWithStylesClass;

class DELPHICLASS TcxCustomConverterWithStyles;
class PASCALIMPLEMENTATION TcxCustomConverterWithStyles : public Cxcustomconverter::TcxCustomConverter 
{
	typedef Cxcustomconverter::TcxCustomConverter inherited;
	
private:
	bool FConvertWithStyles;
	Designintf::_di_IDesigner FDesigner;
	AnsiString FNameOfNewStyleRepository;
	Cxstyles::TcxStyleRepository* FStyleRepository;
	Cxstyles::TcxStyleRepository* __fastcall GetStyleRepository(void);
	
protected:
	Cxstyles::TcxCustomStyle* __fastcall CreateStyleItem(void);
	virtual void __fastcall DoImport(void);
	virtual void __fastcall DoImportStyles(void);
	
public:
	__property bool ConvertWithStyles = {read=FConvertWithStyles, write=FConvertWithStyles, nodefault};
	__property Designintf::_di_IDesigner Designer_ = {read=FDesigner, write=FDesigner};
	__property AnsiString NameOfNewStyleRepository = {read=FNameOfNewStyleRepository, write=FNameOfNewStyleRepository};
	__property Cxstyles::TcxStyleRepository* StyleRepository = {read=GetStyleRepository, write=FStyleRepository};
public:
	#pragma option push -w-inl
	/* TcxCustomConverter.Create */ inline __fastcall virtual TcxCustomConverterWithStyles(System::TObject* ADestination) : Cxcustomconverter::TcxCustomConverter(ADestination) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxCustomConverterWithStyles(void) { }
	#pragma option pop
	
};


struct TcxConverterFactoryItem;
typedef TcxConverterFactoryItem *PcxConverterFactoryItem;

#pragma pack(push, 4)
struct TcxConverterFactoryItem
{
	TMetaClass*Class_;
	AnsiString Name;
} ;
#pragma pack(pop)

class DELPHICLASS TcxConverterFactory;
class PASCALIMPLEMENTATION TcxConverterFactory : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	TcxConverterFactoryItem operator[](int AIndex) { return Items[AIndex]; }
	
private:
	Classes::TList* FItems;
	__fastcall TcxConverterFactory(int AParam);
	int __fastcall GetCount(void);
	TcxConverterFactoryItem __fastcall GetItems(int AIndex);
	int __fastcall IndexOf(TMetaClass* AClass);
	
public:
	__fastcall TcxConverterFactory(void);
	__fastcall virtual ~TcxConverterFactory(void);
	/*         class method */ static TcxConverterFactory* __fastcall Instance(TMetaClass* vmt, AnsiString AConverterGroupName);
	void __fastcall RegisterConverter(const AnsiString AName, const TMetaClass* AClass);
	void __fastcall UnregisterConverter(const TMetaClass* AClass);
	__property int Count = {read=GetCount, nodefault};
	__property TcxConverterFactoryItem Items[int AIndex] = {read=GetItems/*, default*/};
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE TcxConverterFactory* __fastcall ConverterFactory(AnsiString AConverterGroupName);

}	/* namespace Cxconverterfactory */
using namespace Cxconverterfactory;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxConverterFactory
