// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxStandardMask.pas' rev: 6.00

#ifndef cxStandardMaskHPP
#define cxStandardMaskHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <SysUtils.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxstandardmask
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxStandardMaskCustomItem;
class PASCALIMPLEMENTATION TcxStandardMaskCustomItem : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	virtual bool __fastcall Check(char &AChar) = 0 ;
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxStandardMaskCustomItem(void) : System::TObject() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxStandardMaskCustomItem(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxStandardMaskLiteralItem;
class PASCALIMPLEMENTATION TcxStandardMaskLiteralItem : public TcxStandardMaskCustomItem 
{
	typedef TcxStandardMaskCustomItem inherited;
	
private:
	char FLiteral;
	
public:
	__fastcall TcxStandardMaskLiteralItem(char ALiteral);
	virtual bool __fastcall Check(char &AChar);
	__property char Literal = {read=FLiteral, nodefault};
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxStandardMaskLiteralItem(void) { }
	#pragma option pop
	
};


#pragma option push -b-
enum TcxCaseControl { ccUpperCase, ccLowerCase, ccUserCase };
#pragma option pop

class DELPHICLASS TcxStandardMaskManyItem;
class PASCALIMPLEMENTATION TcxStandardMaskManyItem : public TcxStandardMaskCustomItem 
{
	typedef TcxStandardMaskCustomItem inherited;
	
private:
	TcxCaseControl FCaseControl;
	bool FOptional;
	
protected:
	void __fastcall DoCaseControl(char &AChar);
	
public:
	__fastcall TcxStandardMaskManyItem(bool AOptional, TcxCaseControl ACaseControl);
	__property bool Optional = {read=FOptional, nodefault};
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxStandardMaskManyItem(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxStandardMaskAlphaItem;
class PASCALIMPLEMENTATION TcxStandardMaskAlphaItem : public TcxStandardMaskManyItem 
{
	typedef TcxStandardMaskManyItem inherited;
	
public:
	virtual bool __fastcall Check(char &AChar);
public:
	#pragma option push -w-inl
	/* TcxStandardMaskManyItem.Create */ inline __fastcall TcxStandardMaskAlphaItem(bool AOptional, TcxCaseControl ACaseControl) : TcxStandardMaskManyItem(AOptional, ACaseControl) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxStandardMaskAlphaItem(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxStandardMaskAlphaNumericItem;
class PASCALIMPLEMENTATION TcxStandardMaskAlphaNumericItem : public TcxStandardMaskManyItem 
{
	typedef TcxStandardMaskManyItem inherited;
	
public:
	virtual bool __fastcall Check(char &AChar);
public:
	#pragma option push -w-inl
	/* TcxStandardMaskManyItem.Create */ inline __fastcall TcxStandardMaskAlphaNumericItem(bool AOptional, TcxCaseControl ACaseControl) : TcxStandardMaskManyItem(AOptional, ACaseControl) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxStandardMaskAlphaNumericItem(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxStandardMaskASCIIItem;
class PASCALIMPLEMENTATION TcxStandardMaskASCIIItem : public TcxStandardMaskManyItem 
{
	typedef TcxStandardMaskManyItem inherited;
	
public:
	virtual bool __fastcall Check(char &AChar);
public:
	#pragma option push -w-inl
	/* TcxStandardMaskManyItem.Create */ inline __fastcall TcxStandardMaskASCIIItem(bool AOptional, TcxCaseControl ACaseControl) : TcxStandardMaskManyItem(AOptional, ACaseControl) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxStandardMaskASCIIItem(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxStandardMaskNumericItem;
class PASCALIMPLEMENTATION TcxStandardMaskNumericItem : public TcxStandardMaskManyItem 
{
	typedef TcxStandardMaskManyItem inherited;
	
public:
	virtual bool __fastcall Check(char &AChar);
public:
	#pragma option push -w-inl
	/* TcxStandardMaskManyItem.Create */ inline __fastcall TcxStandardMaskNumericItem(bool AOptional, TcxCaseControl ACaseControl) : TcxStandardMaskManyItem(AOptional, ACaseControl) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxStandardMaskNumericItem(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxStandardMaskNumericSymbolItem;
class PASCALIMPLEMENTATION TcxStandardMaskNumericSymbolItem : public TcxStandardMaskManyItem 
{
	typedef TcxStandardMaskManyItem inherited;
	
public:
	__fastcall TcxStandardMaskNumericSymbolItem(bool AOptional, TcxCaseControl ACaseControl);
	virtual bool __fastcall Check(char &AChar);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxStandardMaskNumericSymbolItem(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxStandardMask;
class PASCALIMPLEMENTATION TcxStandardMask : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	char FBlank;
	Classes::TList* FItems;
	bool FLeading;
	bool FSaveLiteralCharacters;
	AnsiString FMask;
	void __fastcall Clear(void);
	void __fastcall DoCompileBody(const AnsiString AMask);
	void __fastcall DoCompileHead(AnsiString &AMask);
	int __fastcall GetCount(void);
	AnsiString __fastcall GetEmptyString();
	AnsiString __fastcall GetFullEmptyString();
	TcxStandardMaskCustomItem* __fastcall GetItems(int AIndex);
	
public:
	__fastcall TcxStandardMask(void);
	__fastcall virtual ~TcxStandardMask(void);
	void __fastcall Compile(AnsiString AMask);
	void __fastcall Format(AnsiString &AText, bool AChangeCharCase = true);
	void __fastcall Format2(AnsiString &AText);
	bool __fastcall IsFullValid(AnsiString &AText);
	bool __fastcall IsValid(AnsiString &AText);
	__property char Blank = {read=FBlank, write=FBlank, nodefault};
	__property int Count = {read=GetCount, nodefault};
	__property AnsiString EmptyString = {read=GetEmptyString};
	__property AnsiString FullEmptyString = {read=GetFullEmptyString};
	__property TcxStandardMaskCustomItem* Items[int AIndex] = {read=GetItems};
	__property AnsiString Mask = {read=FMask};
	__property bool SaveLiteralCharacters = {read=FSaveLiteralCharacters, nodefault};
};


//-- var, const, procedure ---------------------------------------------------
static const char cxDefaultBlank = '\x5f';
extern PACKAGE AnsiString __fastcall EmptyString(const AnsiString AMask, const char ABlank = '\x0');
extern PACKAGE AnsiString __fastcall FormatText(const AnsiString AText, const AnsiString AMask, const char ABlank = '\x0');
extern PACKAGE bool __fastcall IsTextFullValid(const AnsiString AText, const AnsiString AMask);
extern PACKAGE bool __fastcall IsTextValid(const AnsiString AText, const AnsiString AMask);
extern PACKAGE char __fastcall MaskBlank(const AnsiString AMask);
extern PACKAGE bool __fastcall SaveLiteralChars(const AnsiString AMask);

}	/* namespace Cxstandardmask */
using namespace Cxstandardmask;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxStandardMask
