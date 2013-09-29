// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxRegExpr.pas' rev: 6.00

#ifndef cxRegExprHPP
#define cxRegExprHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxEditConsts.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxregexpr
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxRegExprError;
class PASCALIMPLEMENTATION TcxRegExprError : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	int FChar;
	int FLine;
	AnsiString FMessage;
	AnsiString __fastcall GetFullMessage();
	
public:
	__fastcall TcxRegExprError(int ALine, int AChar, AnsiString AMessage);
	TcxRegExprError* __fastcall Clone(void);
	__property int Char = {read=FChar, nodefault};
	__property AnsiString FullMessage = {read=GetFullMessage};
	__property int Line = {read=FLine, nodefault};
	__property AnsiString Message = {read=FMessage};
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxRegExprError(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxRegExprErrors;
class PASCALIMPLEMENTATION TcxRegExprErrors : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	TcxRegExprError* operator[](int Index) { return Items[Index]; }
	
private:
	Classes::TList* FErrors;
	int __fastcall GetCount(void);
	TcxRegExprError* __fastcall GetItems(int Index);
	
public:
	__fastcall TcxRegExprErrors(void);
	__fastcall virtual ~TcxRegExprErrors(void);
	void __fastcall Add(TcxRegExprError* AError);
	TcxRegExprErrors* __fastcall Clone(void);
	__property int Count = {read=GetCount, nodefault};
	__property TcxRegExprError* Items[int Index] = {read=GetItems/*, default*/};
};


class DELPHICLASS EcxRegExprError;
class PASCALIMPLEMENTATION EcxRegExprError : public Sysutils::Exception 
{
	typedef Sysutils::Exception inherited;
	
private:
	TcxRegExprErrors* FErrors;
	
public:
	__fastcall EcxRegExprError(TcxRegExprErrors* AErrors);
	__property TcxRegExprErrors* Errors = {read=FErrors};
public:
	#pragma option push -w-inl
	/* Exception.CreateFmt */ inline __fastcall EcxRegExprError(const AnsiString Msg, const System::TVarRec * Args, const int Args_Size) : Sysutils::Exception(Msg, Args, Args_Size) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateRes */ inline __fastcall EcxRegExprError(int Ident)/* overload */ : Sysutils::Exception(Ident) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResFmt */ inline __fastcall EcxRegExprError(int Ident, const System::TVarRec * Args, const int Args_Size)/* overload */ : Sysutils::Exception(Ident, Args, Args_Size) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateHelp */ inline __fastcall EcxRegExprError(const AnsiString Msg, int AHelpContext) : Sysutils::Exception(Msg, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateFmtHelp */ inline __fastcall EcxRegExprError(const AnsiString Msg, const System::TVarRec * Args, const int Args_Size, int AHelpContext) : Sysutils::Exception(Msg, Args, Args_Size, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResHelp */ inline __fastcall EcxRegExprError(int Ident, int AHelpContext)/* overload */ : Sysutils::Exception(Ident, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResFmtHelp */ inline __fastcall EcxRegExprError(System::PResStringRec ResStringRec, const System::TVarRec * Args, const int Args_Size, int AHelpContext)/* overload */ : Sysutils::Exception(ResStringRec, Args, Args_Size, AHelpContext) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~EcxRegExprError(void) { }
	#pragma option pop
	
};


#pragma pack(push, 4)
struct TcxLexem
{
	int Char;
	int Code;
	int Line;
	AnsiString Value;
} ;
#pragma pack(pop)

typedef TcxLexem *PcxLexem;

#pragma option push -b-
enum TcxRegExprLexemCode { relcSymbol, relcSpecial, relcInteger, relcAll, relcId, relcNotId, relcDigit, relcNotDigit, relcSpace, relcNotSpace, relcReference, relcDateSeparator, relcTimeSeparator };
#pragma option pop

class DELPHICLASS TcxLexems;
class PASCALIMPLEMENTATION TcxLexems : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	TcxLexem operator[](int Index) { return Items[Index]; }
	
private:
	Classes::TList* FLexems;
	int __fastcall GetCount(void);
	TcxLexem __fastcall GetItems(int Index);
	
public:
	__fastcall TcxLexems(void);
	__fastcall virtual ~TcxLexems(void);
	void __fastcall Add(const TcxLexem &ALexem);
	__property int Count = {read=GetCount, nodefault};
	__property TcxLexem Items[int Index] = {read=GetItems/*, default*/};
};


class DELPHICLASS TcxRegExprItem;
class PASCALIMPLEMENTATION TcxRegExprItem : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	virtual bool __fastcall Check(char &AToken, bool ACaseInsensitive) = 0 ;
	virtual TcxRegExprItem* __fastcall Clone(void) = 0 ;
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxRegExprItem(void) : System::TObject() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxRegExprItem(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxRegExprSymbol;
class PASCALIMPLEMENTATION TcxRegExprSymbol : public TcxRegExprItem 
{
	typedef TcxRegExprItem inherited;
	
private:
	char FValue;
	
public:
	__fastcall TcxRegExprSymbol(char AValue);
	virtual bool __fastcall Check(char &AToken, bool ACaseInsensitive);
	virtual TcxRegExprItem* __fastcall Clone(void);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxRegExprSymbol(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxRegExprTimeSeparator;
class PASCALIMPLEMENTATION TcxRegExprTimeSeparator : public TcxRegExprItem 
{
	typedef TcxRegExprItem inherited;
	
public:
	virtual bool __fastcall Check(char &AToken, bool ACaseInsensitive);
	virtual TcxRegExprItem* __fastcall Clone(void);
	char __fastcall Value(void);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxRegExprTimeSeparator(void) : TcxRegExprItem() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxRegExprTimeSeparator(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxRegExprDateSeparator;
class PASCALIMPLEMENTATION TcxRegExprDateSeparator : public TcxRegExprItem 
{
	typedef TcxRegExprItem inherited;
	
public:
	virtual bool __fastcall Check(char &AToken, bool ACaseInsensitive);
	virtual TcxRegExprItem* __fastcall Clone(void);
	char __fastcall Value(void);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxRegExprDateSeparator(void) : TcxRegExprItem() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxRegExprDateSeparator(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxRegExprSubrange;
class PASCALIMPLEMENTATION TcxRegExprSubrange : public TcxRegExprItem 
{
	typedef TcxRegExprItem inherited;
	
private:
	char FStartValue;
	char FFinishValue;
	
public:
	__fastcall TcxRegExprSubrange(char AStartValue, char AFinishValue);
	virtual bool __fastcall Check(char &AToken, bool ACaseInsensitive);
	virtual TcxRegExprItem* __fastcall Clone(void);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxRegExprSubrange(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxRegExprEnumeration;
class PASCALIMPLEMENTATION TcxRegExprEnumeration : public TcxRegExprItem 
{
	typedef TcxRegExprItem inherited;
	
private:
	bool FInverse;
	
public:
	__fastcall TcxRegExprEnumeration(bool AInverse);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxRegExprEnumeration(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxRegExprUserEnumeration;
class PASCALIMPLEMENTATION TcxRegExprUserEnumeration : public TcxRegExprEnumeration 
{
	typedef TcxRegExprEnumeration inherited;
	
private:
	Classes::TList* FItems;
	TcxRegExprItem* __fastcall Item(int AIndex);
	
public:
	__fastcall TcxRegExprUserEnumeration(bool AInverse);
	__fastcall virtual ~TcxRegExprUserEnumeration(void);
	void __fastcall Add(TcxRegExprItem* AItem);
	virtual bool __fastcall Check(char &AToken, bool ACaseInsensitive);
	virtual TcxRegExprItem* __fastcall Clone(void);
};


class DELPHICLASS TcxRegExprDigit;
class PASCALIMPLEMENTATION TcxRegExprDigit : public TcxRegExprEnumeration 
{
	typedef TcxRegExprEnumeration inherited;
	
public:
	__fastcall TcxRegExprDigit(bool AInverse);
	virtual bool __fastcall Check(char &AToken, bool ACaseInsensitive);
	virtual TcxRegExprItem* __fastcall Clone(void);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxRegExprDigit(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxRegExprIdLetter;
class PASCALIMPLEMENTATION TcxRegExprIdLetter : public TcxRegExprEnumeration 
{
	typedef TcxRegExprEnumeration inherited;
	
public:
	__fastcall TcxRegExprIdLetter(bool AInverse);
	virtual bool __fastcall Check(char &AToken, bool ACaseInsensitive);
	virtual TcxRegExprItem* __fastcall Clone(void);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxRegExprIdLetter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxRegExprSpace;
class PASCALIMPLEMENTATION TcxRegExprSpace : public TcxRegExprEnumeration 
{
	typedef TcxRegExprEnumeration inherited;
	
public:
	__fastcall TcxRegExprSpace(bool AInverse);
	virtual bool __fastcall Check(char &AToken, bool ACaseInsensitive);
	virtual TcxRegExprItem* __fastcall Clone(void);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxRegExprSpace(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxRegExprAll;
class PASCALIMPLEMENTATION TcxRegExprAll : public TcxRegExprItem 
{
	typedef TcxRegExprItem inherited;
	
public:
	virtual bool __fastcall Check(char &AToken, bool ACaseInsensitive);
	virtual TcxRegExprItem* __fastcall Clone(void);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxRegExprAll(void) : TcxRegExprItem() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxRegExprAll(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxRegExprState;
class DELPHICLASS TcxRegExprStates;
class PASCALIMPLEMENTATION TcxRegExprStates : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	TcxRegExprState* operator[](int AIndex) { return State[AIndex]; }
	
private:
	Classes::TList* FStates;
	int __fastcall GetCount(void);
	TcxRegExprState* __fastcall GetState(int AIndex);
	
public:
	__fastcall TcxRegExprStates(void);
	__fastcall virtual ~TcxRegExprStates(void);
	void __fastcall Add(TcxRegExprState* AState)/* overload */;
	void __fastcall Add(TcxRegExprStates* AStates)/* overload */;
	void __fastcall Clear(void);
	bool __fastcall Equ(char &ASymbol);
	TcxRegExprStates* __fastcall GetAllNextStates(void);
	bool __fastcall IsFinal(void);
	TcxRegExprStates* __fastcall Next(char &AToken, bool ACaseInsensitive);
	__property int Count = {read=GetCount, nodefault};
	__property TcxRegExprState* State[int AIndex] = {read=GetState/*, default*/};
};


class PASCALIMPLEMENTATION TcxRegExprState : public System::TObject 
{
	typedef System::TObject inherited;
	
protected:
	TcxRegExprStates* FStates;
	
public:
	__fastcall TcxRegExprState(void);
	__fastcall virtual ~TcxRegExprState(void);
	void __fastcall Add(TcxRegExprState* AState)/* overload */;
	void __fastcall Add(TcxRegExprStates* AStates)/* overload */;
	virtual TcxRegExprStates* __fastcall Check(char &AToken, bool ACaseInsensitive);
	virtual TcxRegExprState* __fastcall Clone(void);
	TcxRegExprStates* __fastcall GetAllNextStates(void);
	virtual TcxRegExprStates* __fastcall GetSelf(void);
	TcxRegExprStates* __fastcall Next(char &AToken, bool ACaseInsensitive);
	__property TcxRegExprStates* States = {read=FStates};
};


class DELPHICLASS TcxRegExprSimpleState;
class PASCALIMPLEMENTATION TcxRegExprSimpleState : public TcxRegExprState 
{
	typedef TcxRegExprState inherited;
	
private:
	bool FIsFinal;
	TcxRegExprItem* FValue;
	
public:
	__fastcall TcxRegExprSimpleState(TcxRegExprItem* AValue);
	__fastcall virtual ~TcxRegExprSimpleState(void);
	virtual TcxRegExprStates* __fastcall Check(char &AToken, bool ACaseInsensitive);
	virtual TcxRegExprState* __fastcall Clone(void);
	virtual TcxRegExprStates* __fastcall GetSelf(void);
	void __fastcall SetFinal(void);
	__property bool IsFinal = {read=FIsFinal, nodefault};
};


class DELPHICLASS TcxRegExprBlockState;
class PASCALIMPLEMENTATION TcxRegExprBlockState : public TcxRegExprState 
{
	typedef TcxRegExprState inherited;
	
public:
	virtual TcxRegExprStates* __fastcall Check(char &AToken, bool ACaseInsensitive);
	virtual TcxRegExprState* __fastcall Clone(void);
	virtual TcxRegExprStates* __fastcall GetSelf(void);
public:
	#pragma option push -w-inl
	/* TcxRegExprState.Create */ inline __fastcall TcxRegExprBlockState(void) : TcxRegExprState() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxRegExprState.Destroy */ inline __fastcall virtual ~TcxRegExprBlockState(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxRegExprAutomat;
class DELPHICLASS TcxRegExprParserAlts;
class DELPHICLASS TcxRegExprParserAlt;
class PASCALIMPLEMENTATION TcxRegExprParserAlts : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	TcxRegExprParserAlt* operator[](int AIndex) { return Alt[AIndex]; }
	
private:
	Classes::TList* FAlts;
	TcxRegExprParserAlt* __fastcall GetAlt(int AIndex);
	int __fastcall GetCount(void);
	TcxRegExprParserAlt* __fastcall GetLastAlt(void);
	
public:
	__fastcall TcxRegExprParserAlts(void);
	__fastcall virtual ~TcxRegExprParserAlts(void);
	void __fastcall Add(TcxRegExprParserAlt* AAlt);
	void __fastcall AddAlt(void);
	bool __fastcall CanEmpty(void);
	void __fastcall CreateConnections(void);
	void __fastcall CreateFinalStates(void);
	TcxRegExprParserAlts* __fastcall Clone(void);
	TcxRegExprStates* __fastcall GetStartConnections(void);
	AnsiString __fastcall Print();
	void __fastcall SetFinishConnections(TcxRegExprState* AFinishState);
	bool __fastcall StartStateIsFinal(void);
	bool __fastcall ThereIsEmptyAlt(void);
	__property TcxRegExprParserAlt* Alt[int AIndex] = {read=GetAlt/*, default*/};
	__property int Count = {read=GetCount, nodefault};
	__property TcxRegExprParserAlt* LastAlt = {read=GetLastAlt};
};


class DELPHICLASS TcxRegExpr;
typedef void __fastcall (__closure *TcxSymbolDeleteEvent)(void);

typedef void __fastcall (__closure *TcxSymbolUpdateEvent)(char ASymbol);

class DELPHICLASS TcxRegExprParserBlockItem;
class DELPHICLASS TcxRegExprParserSimpleItem;
class PASCALIMPLEMENTATION TcxRegExpr : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	TcxRegExprAutomat* FAutomat;
	Classes::TList* FBlocks;
	int FChar;
	bool FCaseInsensitive;
	bool FCompiled;
	TcxRegExprErrors* FErrors;
	bool FFirstExpr;
	int FIndex;
	int FLexemIndex;
	TcxLexems* FLexems;
	int FLine;
	TcxSymbolDeleteEvent FOnSymbolDelete;
	TcxSymbolUpdateEvent FOnSymbolUpdate;
	Classes::TMemoryStream* FStream;
	bool FUpdateOn;
	void __fastcall Clear(void);
	bool __fastcall Decimal(char AToken);
	bool __fastcall EmptyStream(void);
	TcxLexem __fastcall CreateLexem(int ALine, int AChar, int ACode, AnsiString AValue);
	bool __fastcall GetLexem(TcxLexem &ALexem);
	bool __fastcall GetToken(char &AToken);
	Classes::TStream* __fastcall GetStream(void);
	bool __fastcall Hexadecimal(char AToken);
	bool __fastcall LookToken(char &AToken, int APtr);
	bool __fastcall ParseAlt(TcxRegExprParserAlt* AAlt, bool Global = true);
	TcxRegExprParserBlockItem* __fastcall ParseBlock(void);
	TcxRegExprParserSimpleItem* __fastcall ParseEnumeration(void);
	void __fastcall ParseExpr(void);
	void __fastcall ParseQuantifier(int &A, int &B);
	void __fastcall ScanASCII(int ALine, int AChar);
	void __fastcall ScanClass(void);
	void __fastcall ScanExpr(void);
	void __fastcall ScanEscape(int ALine, int AChar);
	bool __fastcall ScanInteger(int ALine, int AChar, char &AToken);
	void __fastcall ScanQuantifier(void);
	void __fastcall ScanString(void);
	void __fastcall SetUpdateOn(bool AUpdateOn);
	bool __fastcall Space(char AToken);
	void __fastcall SymbolDelete(void);
	void __fastcall SymbolUpdate(char ASymbol);
	void __fastcall TestCompiledStatus(void);
	
public:
	__fastcall TcxRegExpr(void);
	__fastcall virtual ~TcxRegExpr(void);
	void __fastcall Compile(Classes::TStream* AStream);
	bool __fastcall IsCompiled(void);
	bool __fastcall IsFinal(void);
	bool __fastcall IsStart(void);
	bool __fastcall Next(char &AToken);
	AnsiString __fastcall NextEx(const AnsiString AString);
	bool __fastcall Prev(void);
	AnsiString __fastcall Print();
	void __fastcall Reset(void);
	__property bool CaseInsensitive = {read=FCaseInsensitive, write=FCaseInsensitive, nodefault};
	__property Classes::TStream* Stream = {read=GetStream};
	__property bool UpdateOn = {read=FUpdateOn, write=SetUpdateOn, nodefault};
	__property TcxSymbolDeleteEvent OnSymbolDelete = {read=FOnSymbolDelete, write=FOnSymbolDelete};
	__property TcxSymbolUpdateEvent OnSymbolUpdate = {read=FOnSymbolUpdate, write=FOnSymbolUpdate};
};


class PASCALIMPLEMENTATION TcxRegExprAutomat : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	TcxRegExprStates* FCurrentStates;
	TcxRegExprParserAlts* FExpr;
	Classes::TList* FHistory;
	TcxRegExpr* FOwner;
	TcxRegExprSimpleState* FStartState;
	TcxRegExprStates* __fastcall GetAllNextStates(void);
	TcxRegExprStates* __fastcall Pop(void);
	void __fastcall Push(TcxRegExprStates* AStates);
	
public:
	__fastcall TcxRegExprAutomat(TcxRegExprParserAlts* AExpr, TcxRegExpr* AOwner);
	__fastcall virtual ~TcxRegExprAutomat(void);
	bool __fastcall IsFinal(void);
	bool __fastcall IsStart(void);
	bool __fastcall Next(char &AToken, bool ACaseInsensitive);
	bool __fastcall Prev(void);
	AnsiString __fastcall Print();
	void __fastcall Reset(void);
	void __fastcall ReUpdate(void);
	void __fastcall Update(void);
};


class DELPHICLASS TcxRegExprQuantifier;
class PASCALIMPLEMENTATION TcxRegExprQuantifier : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	virtual bool __fastcall CanMissing(void) = 0 ;
	virtual bool __fastcall CanRepeat(void) = 0 ;
	virtual TcxRegExprQuantifier* __fastcall Clone(void) = 0 ;
	virtual AnsiString __fastcall Print(void) = 0 ;
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxRegExprQuantifier(void) : System::TObject() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxRegExprQuantifier(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxRegExprSimpleQuantifier;
class PASCALIMPLEMENTATION TcxRegExprSimpleQuantifier : public TcxRegExprQuantifier 
{
	typedef TcxRegExprQuantifier inherited;
	
public:
	virtual bool __fastcall CanMissing(void);
	virtual bool __fastcall CanRepeat(void);
	virtual TcxRegExprQuantifier* __fastcall Clone(void);
	virtual AnsiString __fastcall Print();
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxRegExprSimpleQuantifier(void) : TcxRegExprQuantifier() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxRegExprSimpleQuantifier(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxRegExprQuestionQuantifier;
class PASCALIMPLEMENTATION TcxRegExprQuestionQuantifier : public TcxRegExprQuantifier 
{
	typedef TcxRegExprQuantifier inherited;
	
public:
	virtual bool __fastcall CanMissing(void);
	virtual bool __fastcall CanRepeat(void);
	virtual TcxRegExprQuantifier* __fastcall Clone(void);
	virtual AnsiString __fastcall Print();
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxRegExprQuestionQuantifier(void) : TcxRegExprQuantifier() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxRegExprQuestionQuantifier(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxRegExprStarQuantifier;
class PASCALIMPLEMENTATION TcxRegExprStarQuantifier : public TcxRegExprQuantifier 
{
	typedef TcxRegExprQuantifier inherited;
	
public:
	virtual bool __fastcall CanMissing(void);
	virtual bool __fastcall CanRepeat(void);
	virtual TcxRegExprQuantifier* __fastcall Clone(void);
	virtual AnsiString __fastcall Print();
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxRegExprStarQuantifier(void) : TcxRegExprQuantifier() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxRegExprStarQuantifier(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxRegExprPlusQuantifier;
class PASCALIMPLEMENTATION TcxRegExprPlusQuantifier : public TcxRegExprQuantifier 
{
	typedef TcxRegExprQuantifier inherited;
	
public:
	virtual bool __fastcall CanMissing(void);
	virtual bool __fastcall CanRepeat(void);
	virtual TcxRegExprQuantifier* __fastcall Clone(void);
	virtual AnsiString __fastcall Print();
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxRegExprPlusQuantifier(void) : TcxRegExprQuantifier() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxRegExprPlusQuantifier(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxRegExprParserItem;
class PASCALIMPLEMENTATION TcxRegExprParserItem : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	TcxRegExprQuantifier* FQuantifier;
	
public:
	__fastcall TcxRegExprParserItem(TcxRegExprQuantifier* AQuantifier);
	__fastcall virtual ~TcxRegExprParserItem(void);
	virtual bool __fastcall CanEmpty(void) = 0 ;
	bool __fastcall CanMissing(void);
	bool __fastcall CanRepeat(void);
	virtual TcxRegExprParserItem* __fastcall Clone(void) = 0 ;
	bool __fastcall NotQuantifier(void);
	virtual AnsiString __fastcall Print(void) = 0 ;
	virtual void __fastcall SetFinal(void) = 0 ;
	void __fastcall SetQuantifier(TcxRegExprQuantifier* AQuantifier);
};


class PASCALIMPLEMENTATION TcxRegExprParserSimpleItem : public TcxRegExprParserItem 
{
	typedef TcxRegExprParserItem inherited;
	
private:
	TcxRegExprState* FState;
	
public:
	__fastcall TcxRegExprParserSimpleItem(TcxRegExprState* AState, TcxRegExprQuantifier* AQuantifier);
	__fastcall virtual ~TcxRegExprParserSimpleItem(void);
	virtual bool __fastcall CanEmpty(void);
	virtual TcxRegExprParserItem* __fastcall Clone(void);
	virtual AnsiString __fastcall Print();
	virtual void __fastcall SetFinal(void);
	__property TcxRegExprState* State = {read=FState};
};


class PASCALIMPLEMENTATION TcxRegExprParserBlockItem : public TcxRegExprParserItem 
{
	typedef TcxRegExprParserItem inherited;
	
private:
	TcxRegExprParserAlts* FAlts;
	TcxRegExprState* FFinishState;
	TcxRegExprState* FStartState;
	
public:
	__fastcall TcxRegExprParserBlockItem(TcxRegExprQuantifier* AQuantifier);
	__fastcall virtual ~TcxRegExprParserBlockItem(void);
	virtual bool __fastcall CanEmpty(void);
	void __fastcall CreateConnections(void);
	void __fastcall AddAlt(TcxRegExprParserAlt* AAlt);
	void __fastcall AddAlts(TcxRegExprParserAlts* AAlts);
	virtual TcxRegExprParserItem* __fastcall Clone(void);
	virtual AnsiString __fastcall Print();
	virtual void __fastcall SetFinal(void);
	__property TcxRegExprParserAlts* Alts = {read=FAlts};
	__property TcxRegExprState* FinishState = {read=FFinishState};
	__property TcxRegExprState* StartState = {read=FStartState};
};


class PASCALIMPLEMENTATION TcxRegExprParserAlt : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	TcxRegExprParserItem* operator[](int AIndex) { return Item[AIndex]; }
	
private:
	Classes::TList* FItems;
	int __fastcall GetCount(void);
	TcxRegExprParserItem* __fastcall GetFirstItem(void);
	TcxRegExprParserItem* __fastcall GetItem(int AIndex);
	TcxRegExprParserItem* __fastcall GetLastItem(void);
	void __fastcall SetLastItem(TcxRegExprParserItem* AItem);
	
public:
	__fastcall TcxRegExprParserAlt(void);
	__fastcall virtual ~TcxRegExprParserAlt(void);
	void __fastcall Add(TcxRegExprParserItem* AItem);
	bool __fastcall CanEmpty(void);
	bool __fastcall CanMissing(void);
	TcxRegExprParserAlt* __fastcall Clone(void);
	void __fastcall CreateConnections(void);
	void __fastcall CreateFinalStates(void);
	TcxRegExprStates* __fastcall GetStartConnections(void);
	AnsiString __fastcall Print();
	void __fastcall SetFinishConnection(TcxRegExprState* AFinishState);
	__property int Count = {read=GetCount, nodefault};
	__property TcxRegExprParserItem* FirstItem = {read=GetFirstItem};
	__property TcxRegExprParserItem* Item[int AIndex] = {read=GetItem/*, default*/};
	__property TcxRegExprParserItem* LastItem = {read=GetLastItem, write=SetLastItem};
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE bool __fastcall IsTextFullValid(const AnsiString AText, const AnsiString AMask);
extern PACKAGE bool __fastcall IsTextValid(const AnsiString AText, const AnsiString AMask);

}	/* namespace Cxregexpr */
using namespace Cxregexpr;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxRegExpr
