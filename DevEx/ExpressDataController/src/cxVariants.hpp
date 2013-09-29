// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxVariants.pas' rev: 6.00

#ifndef cxVariantsHPP
#define cxVariantsHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Variants.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxvariants
{
//-- type declarations -------------------------------------------------------
typedef __int64 LargeInt;

class DELPHICLASS TcxFiler;
class PASCALIMPLEMENTATION TcxFiler : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	Classes::TStream* FStream;
	
public:
	__fastcall TcxFiler(Classes::TStream* AStream);
	__property Classes::TStream* Stream = {read=FStream};
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFiler(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxReader;
class PASCALIMPLEMENTATION TcxReader : public TcxFiler 
{
	typedef TcxFiler inherited;
	
public:
	bool __fastcall ReadBoolean(void);
	Byte __fastcall ReadByte(void);
	unsigned __fastcall ReadCardinal(void);
	char __fastcall ReadChar(void);
	System::Currency __fastcall ReadCurrency(void);
	System::TDateTime __fastcall ReadDateTime(void);
	Extended __fastcall ReadFloat(void);
	int __fastcall ReadInteger(void);
	__int64 __fastcall ReadLargeInt(void);
	Shortint __fastcall ReadShortInt(void);
	float __fastcall ReadSingle(void);
	short __fastcall ReadSmallInt(void);
	AnsiString __fastcall ReadString();
	Variant __fastcall ReadVariant();
	WideString __fastcall ReadWideString();
	Word __fastcall ReadWord(void);
public:
	#pragma option push -w-inl
	/* TcxFiler.Create */ inline __fastcall TcxReader(Classes::TStream* AStream) : TcxFiler(AStream) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxReader(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxWriter;
class PASCALIMPLEMENTATION TcxWriter : public TcxFiler 
{
	typedef TcxFiler inherited;
	
public:
	void __fastcall WriteBoolean(bool AValue);
	void __fastcall WriteByte(Byte AValue);
	void __fastcall WriteCardinal(unsigned AValue);
	void __fastcall WriteChar(char AValue);
	void __fastcall WriteCurrency(System::Currency AValue);
	void __fastcall WriteDateTime(System::TDateTime AValue);
	void __fastcall WriteFloat(Extended AValue);
	void __fastcall WriteInteger(int AValue);
	void __fastcall WriteLargeInt(__int64 AValue);
	void __fastcall WriteShortInt(Shortint AValue);
	void __fastcall WriteSingle(float AValue);
	void __fastcall WriteSmallInt(short AValue);
	void __fastcall WriteString(const AnsiString S);
	void __fastcall WriteVariant(const Variant &AValue);
	void __fastcall WriteWideString(const WideString S);
	void __fastcall WriteWord(Word AValue);
public:
	#pragma option push -w-inl
	/* TcxFiler.Create */ inline __fastcall TcxWriter(Classes::TStream* AStream) : TcxFiler(AStream) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxWriter(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE int __fastcall VarCompare(const Variant &V1, const Variant &V2);
extern PACKAGE bool __fastcall VarEquals(const Variant &V1, const Variant &V2);
extern PACKAGE bool __fastcall VarEqualsExact(const Variant &V1, const Variant &V2);
extern PACKAGE bool __fastcall VarIsDate(const Variant &AValue);
extern PACKAGE bool __fastcall VarIsNumericEx(const Variant &AValue);
extern PACKAGE bool __fastcall VarIsSoftNull(const Variant &AValue);
extern PACKAGE Variant __fastcall VarBetweenArrayCreate(const Variant &AValue1, const Variant &AValue2);
extern PACKAGE Variant __fastcall VarListArrayCreate(const Variant &AValue);
extern PACKAGE void __fastcall VarListArrayAddValue(Variant &Value, const Variant &AValue);
extern PACKAGE AnsiString __fastcall ReadStringFunc(Classes::TStream* AStream);
extern PACKAGE void __fastcall ReadStringProc(Classes::TStream* AStream, AnsiString &S);
extern PACKAGE void __fastcall WriteStringProc(Classes::TStream* AStream, const AnsiString S);
extern PACKAGE WideString __fastcall ReadWideStringFunc(Classes::TStream* AStream);
extern PACKAGE void __fastcall ReadWideStringProc(Classes::TStream* AStream, WideString &S);
extern PACKAGE void __fastcall WriteWideStringProc(Classes::TStream* AStream, const WideString S);
extern PACKAGE Variant __fastcall ReadVariantFunc(Classes::TStream* AStream);
extern PACKAGE void __fastcall ReadVariantProc(Classes::TStream* AStream, Variant &Value);
extern PACKAGE void __fastcall WriteVariantProc(Classes::TStream* AStream, const Variant &AValue);
extern PACKAGE bool __fastcall ReadBooleanFunc(Classes::TStream* AStream);
extern PACKAGE void __fastcall ReadBooleanProc(Classes::TStream* AStream, bool &Value);
extern PACKAGE void __fastcall WriteBooleanProc(Classes::TStream* AStream, bool AValue);
extern PACKAGE char __fastcall ReadCharFunc(Classes::TStream* AStream);
extern PACKAGE void __fastcall ReadCharProc(Classes::TStream* AStream, char &Value);
extern PACKAGE void __fastcall WriteCharProc(Classes::TStream* AStream, char AValue);
extern PACKAGE Extended __fastcall ReadFloatFunc(Classes::TStream* AStream);
extern PACKAGE void __fastcall ReadFloatProc(Classes::TStream* AStream, Extended &Value);
extern PACKAGE void __fastcall WriteFloatProc(Classes::TStream* AStream, Extended AValue);
extern PACKAGE float __fastcall ReadSingleFunc(Classes::TStream* AStream);
extern PACKAGE void __fastcall ReadSingleProc(Classes::TStream* AStream, float &Value);
extern PACKAGE void __fastcall WriteSingleProc(Classes::TStream* AStream, float AValue);
extern PACKAGE System::Currency __fastcall ReadCurrencyFunc(Classes::TStream* AStream);
extern PACKAGE void __fastcall ReadCurrencyProc(Classes::TStream* AStream, System::Currency &Value);
extern PACKAGE void __fastcall WriteCurrencyProc(Classes::TStream* AStream, System::Currency AValue);
extern PACKAGE System::TDateTime __fastcall ReadDateTimeFunc(Classes::TStream* AStream);
extern PACKAGE void __fastcall ReadDateTimeProc(Classes::TStream* AStream, System::TDateTime &Value);
extern PACKAGE void __fastcall WriteDateTimeProc(Classes::TStream* AStream, System::TDateTime AValue);
extern PACKAGE int __fastcall ReadIntegerFunc(Classes::TStream* AStream);
extern PACKAGE void __fastcall ReadIntegerProc(Classes::TStream* AStream, int &Value);
extern PACKAGE void __fastcall WriteIntegerProc(Classes::TStream* AStream, int AValue);
extern PACKAGE __int64 __fastcall ReadLargeIntFunc(Classes::TStream* AStream);
extern PACKAGE void __fastcall ReadLargeIntProc(Classes::TStream* AStream, __int64 &Value);
extern PACKAGE void __fastcall WriteLargeIntProc(Classes::TStream* AStream, __int64 AValue);
extern PACKAGE Byte __fastcall ReadByteFunc(Classes::TStream* AStream);
extern PACKAGE void __fastcall ReadByteProc(Classes::TStream* AStream, Byte &Value);
extern PACKAGE void __fastcall WriteByteProc(Classes::TStream* AStream, Byte AValue);
extern PACKAGE short __fastcall ReadSmallIntFunc(Classes::TStream* AStream);
extern PACKAGE void __fastcall ReadSmallIntProc(Classes::TStream* AStream, short &Value);
extern PACKAGE void __fastcall WriteSmallIntProc(Classes::TStream* AStream, short AValue);
extern PACKAGE unsigned __fastcall ReadCardinalFunc(Classes::TStream* AStream);
extern PACKAGE void __fastcall ReadCardinalProc(Classes::TStream* AStream, unsigned &Value);
extern PACKAGE void __fastcall WriteCardinalProc(Classes::TStream* AStream, unsigned AValue);
extern PACKAGE Shortint __fastcall ReadShortIntFunc(Classes::TStream* AStream);
extern PACKAGE void __fastcall ReadShortIntProc(Classes::TStream* AStream, Shortint &Value);
extern PACKAGE void __fastcall WriteShortIntProc(Classes::TStream* AStream, Shortint AValue);
extern PACKAGE Word __fastcall ReadWordFunc(Classes::TStream* AStream);
extern PACKAGE void __fastcall ReadWordProc(Classes::TStream* AStream, Word &Value);
extern PACKAGE void __fastcall WriteWordProc(Classes::TStream* AStream, Word AValue);

}	/* namespace Cxvariants */
using namespace Cxvariants;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxVariants
