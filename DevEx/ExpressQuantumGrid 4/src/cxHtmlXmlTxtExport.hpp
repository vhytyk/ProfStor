// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxHtmlXmlTxtExport.pas' rev: 6.00

#ifndef cxHtmlXmlTxtExportHPP
#define cxHtmlXmlTxtExportHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxExportStrs.hpp>	// Pascal unit
#include <cxExport.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Math.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxhtmlxmltxtexport
{
//-- type declarations -------------------------------------------------------
typedef DynamicArray<Cxexport::TcxCacheItem >  cxHtmlXmlTxtExport__2;

typedef DynamicArray<DynamicArray<Cxexport::TcxCacheItem > >  cxHtmlXmlTxtExport__3;

typedef DynamicArray<int >  cxHtmlXmlTxtExport__4;

typedef DynamicArray<int >  cxHtmlXmlTxtExport__5;

class DELPHICLASS TcxCustomHtmlXmlTXTExportProvider;
class PASCALIMPLEMENTATION TcxCustomHtmlXmlTXTExportProvider : public Cxexport::TcxCustomExportProvider 
{
	typedef Cxexport::TcxCustomExportProvider inherited;
	
private:
	DynamicArray<DynamicArray<Cxexport::TcxCacheItem > >  FCache;
	DynamicArray<int >  FColumns;
	#pragma pack(push, 1)
	Cxexport::TcxCacheCellStyle FDefaultStyle;
	#pragma pack(pop)
	
	Classes::TInterfaceList* FInternalCacheList;
	AnsiString FName;
	DynamicArray<int >  FRows;
	Cxexport::TcxExportStyleManager* FStyleManager;
	Cxexport::TcxCacheItem __fastcall GetCacheItem(int ACol, int ARow);
	int __fastcall GetCellHeight(int ACol, int ARow);
	int __fastcall GetCellWidth(int ACol, int ARow);
	int __fastcall GetColumns(int ACol);
	Cxexport::PcxCacheCellStyle __fastcall GetDefaultStyle(void);
	int __fastcall GetHeight(void);
	int __fastcall GetInternalCacheCount(void);
	Cxexport::_di_IcxCellInternalCache __fastcall GetInternalCacheItems(int AIndex);
	int __fastcall GetRows(int ARow);
	int __fastcall GetStyleCount(void);
	int __fastcall GetWidth(void);
	void __fastcall TestIndex(int ACol, int ARow);
	void __fastcall TestCol(int ACol);
	void __fastcall TestRow(int ARow);
	void __fastcall TestStyleIndex(int AStyleIndex);
	
protected:
	DYNAMIC void __fastcall Clear(void);
	bool __fastcall GetCellData(const int ACol, const int ARow, void *AData);
	void __fastcall SetData(const int ACol, const int ARow, const int ADataSize, const int ADataType, const void *AData);
	void __fastcall SetEmptyData(const int ACol, const int ARow, const int ADataType);
	DYNAMIC void __fastcall Commit(void);
	AnsiString __fastcall GetCacheName();
	Cxexport::PcxCacheCellStyle __fastcall GetCellStyle(const int ACol, const int ARow);
	int __fastcall GetExportType(void);
	AnsiString __fastcall GetExportName();
	Cxexport::PcxCacheCellStyle __fastcall GetStyle(int AStyleIndex);
	int __fastcall RegisterStyle(const Cxexport::TcxCacheCellStyle &AStyle);
	virtual void __fastcall SetCellDataString(const int ACol, const int ARow, const AnsiString AText);
	virtual void __fastcall SetCellDataWideString(const int ACol, const int ARow, const WideString AText);
	virtual void __fastcall SetCellDataDouble(const int ACol, const int ARow, const double AValue);
	virtual void __fastcall SetCellDataInteger(const int ACol, const int ARow, const int AValue);
	virtual void __fastcall SetCellStyle(const int ACol, const int ARow, const int AStyleIndex)/* overload */;
	virtual void __fastcall SetCellStyle(const int ACol, const int ARow, const int AExampleCol, const int AExampleRow)/* overload */;
	virtual void __fastcall SetCellStyle(const int ACol, const int ARow, const Cxexport::TcxCacheCellStyle &AStyle)/* overload */;
	void __fastcall SetCellStyleEx(const int ACol, const int ARow, const int H, const int W, const int AStyleIndex);
	void __fastcall SetCellUnion(const int ACol, const int ARow, int H, int W);
	void __fastcall SetCellValue(const int ACol, const int ARow, const Variant &AValue);
	void __fastcall SetColumnWidth(const int ACol, const int AWidth);
	void __fastcall SetDefaultStyle(const Cxexport::TcxCacheCellStyle &AStyle);
	void __fastcall SetRange(const int AColCount, const int ARowCount, bool IsVisible = true);
	void __fastcall SetRowHeight(const int ARow, const int AHeight);
	__property Cxexport::TcxCacheItem Cache[int ACol][int ARow] = {read=GetCacheItem};
	__property int Columns[int ACol] = {read=GetColumns};
	__property Cxexport::PcxCacheCellStyle DefaultStyle = {read=GetDefaultStyle};
	__property int RowCount = {read=GetHeight, nodefault};
	__property int InternalCacheCount = {read=GetInternalCacheCount, nodefault};
	__property Cxexport::_di_IcxCellInternalCache InternalCacheItems[int AIndex] = {read=GetInternalCacheItems};
	__property AnsiString Name = {read=FName, write=FName};
	__property int Rows[int ARow] = {read=GetRows};
	__property int StyleCount = {read=GetStyleCount, nodefault};
	__property Cxexport::PcxCacheCellStyle Styles[int AIndex] = {read=GetStyle};
	__property int CellHeight[int ACol][int ARow] = {read=GetCellHeight};
	__property int CellWidth[int ACol][int ARow] = {read=GetCellWidth};
	__property int ColCount = {read=GetWidth, nodefault};
	
public:
	__fastcall virtual TcxCustomHtmlXmlTXTExportProvider(const AnsiString AFileName);
	__fastcall virtual ~TcxCustomHtmlXmlTXTExportProvider(void);
private:
	void *__IcxExportProvider;	/* Cxexport::IcxExportProvider */
	
public:
	operator IcxExportProvider*(void) { return (IcxExportProvider*)&__IcxExportProvider; }
	
};


class DELPHICLASS TcxCustomExportProviderSupportedCellInternalChache;
class PASCALIMPLEMENTATION TcxCustomExportProviderSupportedCellInternalChache : public TcxCustomHtmlXmlTXTExportProvider 
{
	typedef TcxCustomHtmlXmlTXTExportProvider inherited;
	
protected:
	virtual void __fastcall CommitCache(Classes::TStream* AStream, void * AParam);
	virtual void __fastcall CommitStyle(Classes::TStream* AStream, void * AParam);
	void __fastcall DeleteCacheFromCell(const int ACol, const int ARow);
	void __fastcall SetCacheIntoCell(const int ACol, const int ARow, Cxexport::_di_IcxCellInternalCache ACache);
public:
	#pragma option push -w-inl
	/* TcxCustomHtmlXmlTXTExportProvider.Create */ inline __fastcall virtual TcxCustomExportProviderSupportedCellInternalChache(const AnsiString AFileName) : TcxCustomHtmlXmlTXTExportProvider(AFileName) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomHtmlXmlTXTExportProvider.Destroy */ inline __fastcall virtual ~TcxCustomExportProviderSupportedCellInternalChache(void) { }
	#pragma option pop
	
private:
	void *__IcxCellInternalCache;	/* Cxexport::IcxCellInternalCache */
	
public:
	operator IcxCellInternalCache*(void) { return (IcxCellInternalCache*)&__IcxCellInternalCache; }
	
};


class DELPHICLASS TcxHTMLExportProvider;
class PASCALIMPLEMENTATION TcxHTMLExportProvider : public TcxCustomExportProviderSupportedCellInternalChache 
{
	typedef TcxCustomExportProviderSupportedCellInternalChache inherited;
	
private:
	void __fastcall CommitHTML(Classes::TStream* AStream);
	HIDESBASE AnsiString __fastcall GetStyle(const Cxexport::TcxCacheCellStyle &AStyle);
	
protected:
	virtual void __fastcall CommitCache(Classes::TStream* AStream, void * AParam);
	virtual void __fastcall CommitStyle(Classes::TStream* AStream, void * AParam);
	
public:
	DYNAMIC void __fastcall Commit(void);
	/* virtual class method */ virtual int __fastcall ExportType(TMetaClass* vmt);
	/* virtual class method */ virtual AnsiString __fastcall ExportName(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TcxCustomHtmlXmlTXTExportProvider.Create */ inline __fastcall virtual TcxHTMLExportProvider(const AnsiString AFileName) : TcxCustomExportProviderSupportedCellInternalChache(AFileName) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomHtmlXmlTXTExportProvider.Destroy */ inline __fastcall virtual ~TcxHTMLExportProvider(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxXMLExportProvider;
class PASCALIMPLEMENTATION TcxXMLExportProvider : public TcxCustomExportProviderSupportedCellInternalChache 
{
	typedef TcxCustomExportProviderSupportedCellInternalChache inherited;
	
private:
	bool FHideDotsOn;
	AnsiString FXSLFileName;
	void __fastcall CommitXML(Classes::TStream* AStream);
	void __fastcall CommitXSL(Classes::TStream* AStream);
	AnsiString __fastcall ConvertTextToXML(const AnsiString AText, int ACol, int ARow);
	AnsiString __fastcall GetBorderStyle(const Cxexport::TcxCacheCellStyle &AStyle);
	AnsiString __fastcall GetCellParams(int ACol, int ARow);
	AnsiString __fastcall GetData(int ACol, int ARow);
	HIDESBASE AnsiString __fastcall GetStyle(const Cxexport::TcxCacheCellStyle &AStyle);
	void __fastcall HideDots(void);
	
protected:
	virtual void __fastcall CommitCache(Classes::TStream* AStream, void * AParam);
	virtual void __fastcall CommitStyle(Classes::TStream* AStream, void * AParam);
	
public:
	__fastcall virtual TcxXMLExportProvider(const AnsiString AFileName);
	DYNAMIC void __fastcall Commit(void);
	/* virtual class method */ virtual int __fastcall ExportType(TMetaClass* vmt);
	/* virtual class method */ virtual AnsiString __fastcall ExportName(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TcxCustomHtmlXmlTXTExportProvider.Destroy */ inline __fastcall virtual ~TcxXMLExportProvider(void) { }
	#pragma option pop
	
};


typedef DynamicArray<int >  cxHtmlXmlTxtExport__01;

class DELPHICLASS TcxTXTExportProvider;
class PASCALIMPLEMENTATION TcxTXTExportProvider : public TcxCustomExportProviderSupportedCellInternalChache 
{
	typedef TcxCustomExportProviderSupportedCellInternalChache inherited;
	
private:
	AnsiString FBeginString;
	DynamicArray<int >  FColMaxWidth;
	AnsiString FEndString;
	int FIndex;
	AnsiString FSeparator;
	void __fastcall CalculateColMaxWidth(void);
	AnsiString __fastcall GetData(int ACol, int ARow);
	
protected:
	virtual void __fastcall CommitCache(Classes::TStream* AStream, void * AParam);
	void __fastcall AddSeparator(const AnsiString ASeparator);
	
public:
	__fastcall virtual TcxTXTExportProvider(const AnsiString AFileName);
	DYNAMIC void __fastcall Commit(void);
	/* virtual class method */ virtual int __fastcall ExportType(TMetaClass* vmt);
	/* virtual class method */ virtual AnsiString __fastcall ExportName(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TcxCustomHtmlXmlTXTExportProvider.Destroy */ inline __fastcall virtual ~TcxTXTExportProvider(void) { }
	#pragma option pop
	
private:
	void *__IcxExportWithSeparators;	/* Cxexport::IcxExportWithSeparators */
	
public:
	operator IcxExportWithSeparators*(void) { return (IcxExportWithSeparators*)&__IcxExportWithSeparators; }
	
};


//-- var, const, procedure ---------------------------------------------------
static const char cxXMLEmptyChar = '\x2e';

}	/* namespace Cxhtmlxmltxtexport */
using namespace Cxhtmlxmltxtexport;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxHtmlXmlTxtExport
