// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxExport.pas' rev: 6.00

#ifndef cxExportHPP
#define cxExportHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxExportStrs.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxexport
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS EcxExportData;
class PASCALIMPLEMENTATION EcxExportData : public Sysutils::Exception 
{
	typedef Sysutils::Exception inherited;
	
public:
	#pragma option push -w-inl
	/* Exception.Create */ inline __fastcall EcxExportData(const AnsiString Msg) : Sysutils::Exception(Msg) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateFmt */ inline __fastcall EcxExportData(const AnsiString Msg, const System::TVarRec * Args, const int Args_Size) : Sysutils::Exception(Msg, Args, Args_Size) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateRes */ inline __fastcall EcxExportData(int Ident)/* overload */ : Sysutils::Exception(Ident) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResFmt */ inline __fastcall EcxExportData(int Ident, const System::TVarRec * Args, const int Args_Size)/* overload */ : Sysutils::Exception(Ident, Args, Args_Size) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateHelp */ inline __fastcall EcxExportData(const AnsiString Msg, int AHelpContext) : Sysutils::Exception(Msg, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateFmtHelp */ inline __fastcall EcxExportData(const AnsiString Msg, const System::TVarRec * Args, const int Args_Size, int AHelpContext) : Sysutils::Exception(Msg, Args, Args_Size, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResHelp */ inline __fastcall EcxExportData(int Ident, int AHelpContext)/* overload */ : Sysutils::Exception(Ident, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResFmtHelp */ inline __fastcall EcxExportData(System::PResStringRec ResStringRec, const System::TVarRec * Args, const int Args_Size, int AHelpContext)/* overload */ : Sysutils::Exception(ResStringRec, Args, Args_Size, AHelpContext) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~EcxExportData(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxExportProviderClass;

typedef Word *PWord;

typedef int *PInteger;

typedef int TIntArray[536870911];

typedef int *PIntArray;

#pragma option push -b-
enum TcxAlignText { catLeft, catCenter, catRight };
#pragma option pop

#pragma option push -b-
enum TcxBrushStyle { cbsClear, cbsSolid };
#pragma option pop

#pragma option push -b-
enum TcxFontStyle { cfsBold, cfsItalic, cfsUnderline, cfsStrikeOut };
#pragma option pop

typedef Set<TcxFontStyle, cfsBold, cfsStrikeOut>  TcxFontStyles;

#pragma pack(push, 1)
struct TcxCellBorders
{
	bool IsDefault;
	int Width;
	int Color;
} ;
#pragma pack(pop)

struct TcxCacheCellStyle;
typedef TcxCacheCellStyle *PcxCacheCellStyle;

#pragma pack(push, 1)
struct TcxCacheCellStyle
{
	TcxAlignText AlignText;
	char FontName[33];
	TcxFontStyles FontStyle;
	int FontColor;
	int FontSize;
	int FontCharset;
	TcxCellBorders Borders[4];
	TcxBrushStyle BrushStyle;
	int BrushBkColor;
	int BrushFgColor;
	int HashCode;
} ;
#pragma pack(pop)

__interface IcxCellInternalCache;
typedef System::DelphiInterface<IcxCellInternalCache> _di_IcxCellInternalCache;
__interface INTERFACE_UUID("{DEF62C25-0B11-4BD0-AE25-BABF7EDD7883}") IcxCellInternalCache  : public IInterface 
{
	
public:
	virtual void __fastcall CommitCache(Classes::TStream* AStream, void * AParam) = 0 ;
	virtual void __fastcall CommitStyle(Classes::TStream* AStream, void * AParam) = 0 ;
	virtual void __fastcall DeleteCacheFromCell(const int ACol, const int ARow) = 0 ;
	virtual void __fastcall SetCacheIntoCell(const int ACol, const int ARow, _di_IcxCellInternalCache ACache) = 0 ;
};

#pragma pack(push, 4)
struct TcxCellInternalCache
{
	_di_IcxCellInternalCache Cache;
	int Index;
} ;
#pragma pack(pop)

#pragma pack(push, 4)
struct TcxCacheItem
{
	TcxCellInternalCache InternalCache;
	void *Data;
	int DataSize;
	int DataType;
	int StyleIndex;
	bool IsHidden;
	bool IsUnion;
	union
	{
		struct 
		{
			int Width;
			int Height;
			
		};
		
	};
} ;
#pragma pack(pop)

typedef void __fastcall (*TcxEnumExportTypes)(const int AExportType, const AnsiString AExportName);

typedef void __fastcall (*TcxEnumTypes)(const int AExportType);

__interface IcxExportProvider;
typedef System::DelphiInterface<IcxExportProvider> _di_IcxExportProvider;
__interface INTERFACE_UUID("{442A08A8-CDDA-4FD6-8E15-9D8BD34554F6}") IcxExportProvider  : public IInterface 
{
	
public:
	virtual void __fastcall Commit(void) = 0 ;
	virtual PcxCacheCellStyle __fastcall GetCellStyle(const int ACol, const int ARow) = 0 ;
	virtual PcxCacheCellStyle __fastcall GetStyle(int AStyleIndex) = 0 ;
	virtual int __fastcall RegisterStyle(const TcxCacheCellStyle &AStyle) = 0 ;
	virtual void __fastcall SetCellDataDouble(const int ACol, const int ARow, const double AValue) = 0 ;
	virtual void __fastcall SetCellDataInteger(const int ACol, const int ARow, const int AValue) = 0 ;
	virtual void __fastcall SetCellDataString(const int ACol, const int ARow, const AnsiString AText) = 0 ;
	virtual void __fastcall SetCellDataWideString(const int ACol, const int ARow, const WideString AText) = 0 ;
	virtual void __fastcall SetCellStyle(const int ACol, const int ARow, const int AStyleIndex) = 0 /* overload */;
	virtual void __fastcall SetCellStyle(const int ACol, const int ARow, const int AExampleCol, const int AExampleRow) = 0 /* overload */;
	virtual void __fastcall SetCellStyle(const int ACol, const int ARow, const TcxCacheCellStyle &AStyle) = 0 /* overload */;
	virtual void __fastcall SetCellStyleEx(const int ACol, const int ARow, const int H, const int W, const int AStyleIndex) = 0 ;
	virtual void __fastcall SetCellUnion(const int ACol, const int ARow, int H, int W) = 0 ;
	virtual void __fastcall SetCellValue(const int ACol, const int ARow, const Variant &AValue) = 0 ;
	virtual void __fastcall SetColumnWidth(const int ACol, const int AWidth) = 0 ;
	virtual void __fastcall SetDefaultStyle(const TcxCacheCellStyle &AStyle) = 0 ;
	virtual void __fastcall SetRange(const int AColCount, const int ARowCount, bool IsVisible = true) = 0 ;
	virtual void __fastcall SetRowHeight(const int ARow, const int AHeight) = 0 ;
};

__interface IcxExportWithSeparators;
typedef System::DelphiInterface<IcxExportWithSeparators> _di_IcxExportWithSeparators;
__interface INTERFACE_UUID("{0E2919A6-8B49-49D7-B55B-B44B6DECF2E5}") IcxExportWithSeparators  : public IInterface 
{
	
public:
	virtual void __fastcall AddSeparator(const AnsiString ASeparator) = 0 ;
};

class DELPHICLASS TcxCustomExportProvider;
class PASCALIMPLEMENTATION TcxCustomExportProvider : public System::TInterfacedObject 
{
	typedef System::TInterfacedObject inherited;
	
private:
	AnsiString FFileName;
	
protected:
	DYNAMIC void __fastcall Clear(void);
	__property AnsiString FileName = {read=FFileName};
	
public:
	__fastcall virtual TcxCustomExportProvider(const AnsiString AFileName);
	virtual void __fastcall BeforeDestruction(void);
	/* virtual class method */ virtual int __fastcall ExportType(TMetaClass* vmt);
	/* virtual class method */ virtual AnsiString __fastcall ExportName(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxCustomExportProvider(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxExport;
class PASCALIMPLEMENTATION TcxExport : public System::TObject 
{
	typedef System::TObject inherited;
	
protected:
	/* virtual class method */ virtual TMetaClass* __fastcall GetExportClassByType(TMetaClass* vmt, int AExportType);
	
public:
	/*         class method */ static TcxCustomExportProvider* __fastcall Provider(TMetaClass* vmt, int AExportType, const AnsiString AFileName);
	/*         class method */ static void __fastcall SupportExportTypes(TMetaClass* vmt, TcxEnumExportTypes EnumSupportTypes);
	/*         class method */ static void __fastcall SupportTypes(TMetaClass* vmt, TcxEnumTypes EnumFunc);
	/*         class method */ static bool __fastcall RegisterProviderClass(TMetaClass* vmt, TMetaClass* AProviderClass);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxExport(void) : System::TObject() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxExport(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxExportStyleManager;
class PASCALIMPLEMENTATION TcxExportStyleManager : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	TcxCacheCellStyle operator[](int AIndex) { return Items[AIndex]; }
	
private:
	int FRefCount;
	Classes::TList* FStyles;
	AnsiString FFileName;
	__fastcall TcxExportStyleManager(const AnsiString AFileName);
	int __fastcall GetCount(void);
	TcxCacheCellStyle __fastcall GetItem(int AIndex);
	bool __fastcall StyleCompare(const PcxCacheCellStyle AStyle1, const PcxCacheCellStyle AStyle2);
	
public:
	__fastcall TcxExportStyleManager(void);
	__fastcall virtual ~TcxExportStyleManager(void);
	void __fastcall Clear(void);
	/*         class method */ static TcxExportStyleManager* __fastcall GetInstance(TMetaClass* vmt, const AnsiString AFileName);
	PcxCacheCellStyle __fastcall GetStyle(const int AIndex);
	int __fastcall RegisterStyle(const TcxCacheCellStyle &AStyle);
	__property TcxCacheCellStyle Items[int AIndex] = {read=GetItem/*, default*/};
	__property int Count = {read=GetCount, nodefault};
};


typedef int __fastcall (*TcxColorToRgbProc)(int AColor);

typedef AnsiString __fastcall (*TcxGetResourceStringProc)(const void * ResString);

//-- var, const, procedure ---------------------------------------------------
extern PACKAGE TcxCacheCellStyle DefaultCellStyle;
extern PACKAGE int cxBlackColor;
extern PACKAGE int cxWindowColor;
extern PACKAGE int cxBtnTextColor;
extern PACKAGE int cxBtnShadowColor;
extern PACKAGE int cxBtnFaceColor;
extern PACKAGE TcxGetResourceStringProc cxGetResString;
static const int cxExportToBinary = 0xffffffff;
static const int cxExportToHtml = 0x2;
static const int cxExportToXml = 0x3;
static const int cxExportToText = 0x4;
static const int cxExportToExcel = 0x1;
static const int cxDataTypeString = 0x1;
static const int cxDataTypeWideString = 0x2;
static const int cxDataTypeDouble = 0x3;
static const int cxDataTypeInteger = 0x4;
extern PACKAGE int __fastcall cxColorToRGB(const int AColor);
extern PACKAGE WideString __fastcall cxStrToUnicode(const AnsiString AText, int ACharset = 0x0);
extern PACKAGE bool __fastcall cxStrUnicodeNeeded(const AnsiString AText, bool ACheckNormal = false);
extern PACKAGE int __fastcall GetHashCode(const void *Buffer, int Count);
extern PACKAGE void __fastcall cxExportInit(TcxGetResourceStringProc AGetResString, void * AColorProc, bool AIsNativeColor);

}	/* namespace Cxexport */
using namespace Cxexport;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxExport
