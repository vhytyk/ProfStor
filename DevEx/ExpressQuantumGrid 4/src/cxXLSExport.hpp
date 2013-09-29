// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxXLSExport.pas' rev: 6.00

#ifndef cxXLSExportHPP
#define cxXLSExportHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxExportStrs.hpp>	// Pascal unit
#include <cxExport.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <Math.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxxlsexport
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TxlsExportOptimization { optBySize, optBySpeed };
#pragma option pop

#pragma option push -b-
enum TcxColorItemType { ciFontColor, ciBrushBKColor, ciBrushFGColor, ciBorderColor };
#pragma option pop

#pragma pack(push, 1)
struct TcxMergeRect
{
	Word Top;
	Word Bottom;
	Word Left;
	Word Right;
} ;
#pragma pack(pop)

typedef TcxMergeRect TcxUnionCellsArray[268435455];

typedef TcxMergeRect *PcxUnionCellsArray;

class DELPHICLASS TcxXLSExportProvider;
class DELPHICLASS TcxXLSCellsData;
typedef DynamicArray<PcxXLSCell >  cxXLSExport__3;

struct TcxXLSCell;
typedef TcxXLSCell *PcxXLSCell;

class PASCALIMPLEMENTATION TcxXLSCellsData : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	DynamicArray<PcxXLSCell >  FCellsList;
	int FCellPerCol;
	int __fastcall GetFullSize(void);
	
protected:
	PcxXLSCell __fastcall GetCell(const int ACol, const int ARow);
	Word __fastcall PrepareCellStyle(Word &AType);
	PcxXLSCell __fastcall ReallocCellData(const int ACol, const int ARow, int AVarDataSize = 0x0);
	void __fastcall SetCellDataBoolean(const int ACol, const int ARow, const bool AValue);
	void __fastcall SetCellDataBlank(const int ACol, const int ARow);
	void __fastcall SetCellDataCurrency(const int ACol, const int ARow, const System::Currency AValue);
	void __fastcall SetCellDataDateTime(const int ACol, const int ARow, const System::TDateTime AValue);
	void __fastcall SetCellDataDouble(const int ACol, const int ARow, const double AValue);
	void __fastcall SetCellDataInteger(const int ACol, const int ARow, const int AValue);
	void __fastcall SetCellDataStringA(const int ACol, const int ARow, const AnsiString AText);
	void __fastcall SetCellDataStringW(const int ACol, const int ARow, const WideString AText);
	void __fastcall SetCellDataSSTString(const int ACol, const int ARow, const int AIndex);
	void __fastcall SetRange(const int AColCount, const int ARowCount);
	__property int FullSize = {read=GetFullSize, nodefault};
	
public:
	__fastcall virtual ~TcxXLSCellsData(void);
	void __fastcall SaveToStream(Classes::TStream* AStream);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxXLSCellsData(void) : System::TObject() { }
	#pragma option pop
	
};


class DELPHICLASS TcxXLSRecordsList;
class PASCALIMPLEMENTATION TcxXLSRecordsList : public Classes::TList 
{
	typedef Classes::TList inherited;
	
private:
	Word FID;
	int __fastcall GetFullSize(void);
	void * __fastcall GetItem(int AIndex);
	int __fastcall GetItemSize(int AIndex);
	void * __fastcall GetRealItem(int AIndex);
	
public:
	__fastcall TcxXLSRecordsList(const Word RecordID);
	__fastcall virtual ~TcxXLSRecordsList(void);
	int __fastcall AddData(const void *AData, Word DataSize);
	int __fastcall AddUniqueData(Sysutils::PByteArray &AData);
	virtual void __fastcall Clear(void);
	void __fastcall SaveToStream(Classes::TStream* AStream);
	__property void * Items[int AIndex] = {read=GetItem};
	__property int ItemSize[int AIndex] = {read=GetItemSize};
	__property int FullSize = {read=GetFullSize, nodefault};
};


class DELPHICLASS TcxXLSSharedStringTable;
struct TExtSSTBlock;
#pragma pack(push, 1)
struct TExtSST
{
	Word RecType;
	Word DataSize;
	Word StringPerBlock;
	TExtSSTBlock Data[256];
} ;
#pragma pack(pop)

typedef DynamicArray<TSSTBlock >  TSSTList;

typedef DynamicArray<TSSSTStringInfo >  TSSSTStringsInfo;

struct TSSTBlock;
class PASCALIMPLEMENTATION TcxXLSSharedStringTable : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	#pragma pack(push, 1)
	TExtSST FExtSST;
	#pragma pack(pop)
	
	DynamicArray<TSSTBlock >  FSST;
	bool FOptimaze;
	DynamicArray<TSSSTStringInfo >  FStringsInfo;
	int __fastcall GetStringCount(void);
	int __fastcall GetUniqueStringCount(void);
	
protected:
	void __fastcall AddStringToBlock(void * ASource, TSSTBlock &ADest, Word ASize);
	void __fastcall CreateExtSST(int ASSTOffset);
	int __fastcall GetPackedSize(void);
	int __fastcall IndexOf(const WideString AString);
	void __fastcall InsertStr(const WideString AString);
	__property TExtSST ExtSST = {read=FExtSST};
	__property TSSTList SST = {read=FSST};
	__property TSSSTStringsInfo StringsInfo = {read=FStringsInfo};
	
public:
	__fastcall virtual TcxXLSSharedStringTable(void);
	__fastcall virtual ~TcxXLSSharedStringTable(void);
	int __fastcall Add(const WideString AString);
	void __fastcall Clear(void);
	virtual void __fastcall SaveToStream(Classes::TStream* AStream, int APosition = 0xffffffff);
	__property int PackedSize = {read=GetPackedSize, nodefault};
	__property int TotalStringCount = {read=GetStringCount, nodefault};
	__property int UniqueStringCount = {read=GetUniqueStringCount, nodefault};
};


class DELPHICLASS TcxXLSWorkBookWriter;
typedef int TcxFATSector[128];

typedef int *PcxFATSector;

struct TcxOLEDIREntry;
typedef TcxOLEDIREntry *PcxOLEDIREntry;

struct TcxOLEFileHeader;
typedef TcxOLEFileHeader *PcxOLEFileHeader;

class PASCALIMPLEMENTATION TcxXLSWorkBookWriter : public System::TObject 
{
	typedef System::TObject inherited;
	
protected:
	Byte *FBuffer;
	int FBufferSize;
	int FCapacity;
	int FFATBlockCount;
	bool FIsSmallFile;
	int FSectCount;
	int FStreamSize;
	void __fastcall CreateLocalFAT(void);
	PcxFATSector __fastcall GetDIFSector(int ASector);
	PcxOLEDIREntry __fastcall GetDIREntry(int AIndex);
	PcxOLEFileHeader __fastcall GetHeader(void);
	PcxFATSector __fastcall GetFATSector(int ASector);
	void __fastcall Check(bool ACondition);
	virtual void __fastcall CreateDIF(void);
	virtual void __fastcall CreateDIR(void);
	virtual void __fastcall CreateFAT(void);
	virtual void __fastcall CreateHeader(void);
	virtual void __fastcall CreateSmallFAT(void);
	void __fastcall ReallocBuffer(const int ASize);
	__property bool IsSmallFile = {read=FIsSmallFile, nodefault};
	__property PcxOLEDIREntry DIR[int AEntry] = {read=GetDIREntry};
	__property PcxFATSector DIF[int ASector] = {read=GetDIFSector};
	__property PcxFATSector FAT[int ASector] = {read=GetFATSector};
	__property PcxOLEFileHeader Header = {read=GetHeader};
	__property Sysutils::PByteArray Memory = {read=FBuffer};
	__property int Size = {read=FBufferSize, nodefault};
	
public:
	void __fastcall CreateOLEStream(int ADataSize, Classes::TStream* ADstStream);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxXLSWorkBookWriter(void) : System::TObject() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxXLSWorkBookWriter(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxXLSExportProvider : public Cxexport::TcxCustomExportProvider 
{
	typedef Cxexport::TcxCustomExportProvider inherited;
	
private:
	TcxXLSCellsData* FCells;
	TcxXLSRecordsList* FColStyles;
	TcxXLSRecordsList* FFonts;
	int FMaxCol;
	int FMaxRow;
	TcxXLSRecordsList* FStyles;
	Cxexport::TcxExportStyleManager* FStyleCache;
	TcxMergeRect *FUnionCells;
	int FUnionCellsCapacity;
	int FUnionCellsCount;
	int FUsedColors;
	int FPalette[56];
	TcxXLSRecordsList* FRowStyles;
	AnsiString FSheetName;
	TcxXLSSharedStringTable* FSST;
	Classes::TStream* FStream;
	bool FVisibleGrid;
	TcxXLSWorkBookWriter* FWorkBookWriter;
	
protected:
	virtual void __fastcall Commit(void);
	Cxexport::PcxCacheCellStyle __fastcall GetCellStyle(const int ACol, const int ARow);
	Cxexport::PcxCacheCellStyle __fastcall GetStyle(int AStyleIndex);
	bool __fastcall PlaceParsedString(const int ACol, const int ARow, const AnsiString AText);
	int __fastcall RegisterStyle(const Cxexport::TcxCacheCellStyle &AStyle);
	virtual void __fastcall SetCellDataBoolean(const int ACol, const int ARow, const bool AValue);
	virtual void __fastcall SetCellDataCurrency(const int ACol, const int ARow, const System::Currency AValue);
	virtual void __fastcall SetCellDataDateTime(const int ACol, const int ARow, const System::TDateTime AValue);
	virtual void __fastcall SetCellDataDouble(const int ACol, const int ARow, const double AValue);
	virtual void __fastcall SetCellDataInteger(const int ACol, const int ARow, const int AValue);
	virtual void __fastcall SetCellDataString(const int ACol, const int ARow, const AnsiString AText);
	virtual void __fastcall SetCellDataWideString(const int ACol, const int ARow, const WideString AText);
	void __fastcall SetCellStyle(const int ACol, const int ARow, const int AStyleIndex)/* overload */;
	void __fastcall SetCellStyle(const int ACol, const int ARow, const int AExampleCol, const int AExampleRow)/* overload */;
	void __fastcall SetCellStyle(const int ACol, const int ARow, const Cxexport::TcxCacheCellStyle &AStyle)/* overload */;
	void __fastcall SetCellStyleEx(const int ACol, const int ARow, const int H, const int W, const int AStyleIndex);
	void __fastcall SetCellUnion(const int ACol, const int ARow, int H, int W);
	void __fastcall SetCellValue(const int ACol, const int ARow, const Variant &AValue);
	void __fastcall SetColumnWidth(const int ACol, const int AWidth);
	void __fastcall SetDefaultStyle(const Cxexport::TcxCacheCellStyle &AStyle);
	void __fastcall SetRange(const int AColCount, const int ARowCount, bool IsVisible = true);
	void __fastcall SetRowHeight(const int ARow, const int AHeight);
	DYNAMIC int __fastcall CalculateStoredSize(void);
	Word __fastcall xlsCheckColor(const int AColor, TcxColorItemType AItemType);
	bool __fastcall xlsCheckPos(const int ACol, const int ARow);
	void __fastcall xlsCreateStyles(void);
	int __fastcall xlsRegisterFont(const Cxexport::TcxCacheCellStyle &AStyle);
	int __fastcall xlsRegisterStyle(const Cxexport::TcxCacheCellStyle &AStyle, Word &AType, bool IsMerge = false);
	void __fastcall xlsWriteBuf(const Byte * RecData, const int RecData_Size)/* overload */;
	void __fastcall xlsWriteBuf(const Word RecID, const Byte * RecData, const int RecData_Size)/* overload */;
	void __fastcall xlsWriteBuf(const Word RecID, const Word DataSize, const Byte * RecData, const int RecData_Size)/* overload */;
	void __fastcall xlsWriteBuffer(const Word * ARecData, const int ARecData_Size)/* overload */;
	void __fastcall xlsWriteBuffer(const Word RecID, const Word DataSize, const void *RecData)/* overload */;
	void __fastcall xlsWriteHeader(void);
	void __fastcall xlsWriteWorkBook(void);
	__property Classes::TStream* DataStream = {read=FStream};
	
public:
	__fastcall virtual TcxXLSExportProvider(const AnsiString AFileName);
	__fastcall virtual ~TcxXLSExportProvider(void);
	/* virtual class method */ virtual int __fastcall ExportType(TMetaClass* vmt);
	/* virtual class method */ virtual AnsiString __fastcall ExportName(TMetaClass* vmt);
private:
	void *__IcxExportProvider;	/* Cxexport::IcxExportProvider */
	
public:
	operator IcxExportProvider*(void) { return (IcxExportProvider*)&__IcxExportProvider; }
	
};


typedef PcxXLSCell *PPcxXLSCell;

#pragma pack(push, 1)
struct TcxXLSCell
{
	Word RecType;
	Word RecSize;
	Word Row;
	Word Col;
	Word XF;
	union
	{
		struct 
		{
			bool BoolErrValue;
			bool ErrFlag;
			
		};
		struct 
		{
			Word StrLen;
			bool StrType;
			union
			{
				struct 
				{
					wchar_t StrDataW[128];
					
				};
				struct 
				{
					char StrDataA[256];
					
				};
				
			};
		};
		struct 
		{
			double Num;
			
		};
		struct 
		{
			int SSTIndex;
			
		};
		struct 
		{
			Byte VarBytes[65535];
			
		};
		struct 
		{
			Word VarWords[32767];
			
		};
		
	};
} ;
#pragma pack(pop)

#pragma pack(push, 1)
struct TSSTBlock
{
	Word StringCount;
	Word StringOffset;
	Word RecType;
	Word DataSize;
	Byte Data[8192];
} ;
#pragma pack(pop)

#pragma pack(push, 1)
struct TExtSSTBlock
{
	int StreamOffset;
	Word StringOffset;
	Word Reserved;
} ;
#pragma pack(pop)

#pragma pack(push, 1)
struct TSSSTStringInfo
{
	Word HashCode;
	Word StrSize;
	Word Block;
	Word Offset;
} ;
#pragma pack(pop)

#pragma pack(push, 1)
struct TcxOLEFileHeader
{
	__int64 Signature;
	__int64 CLSID[2];
	int OLEVersion;
	Word ByteOrder;
	Word SectorShift;
	Word MiniSectorShift;
	Word Reserved;
	int Reserved1;
	int Reserved2;
	int CountSectFAT;
	int SectDIRStart;
	int TransSignature;
	int MiniSectorCutOff;
	int SectMiniFATStart;
	int CountSectMiniFAT;
	int SectDIFStart;
	int CountSectDIF;
	int SectFAT[109];
} ;
#pragma pack(pop)

#pragma option push -b-
enum TcxOLEDIREntryType { ET_INVALID, ET_STORAGE, ET_STREAM, ET_LOCKBYTES, ET_PROPERTY, ET_ROOT };
#pragma option pop

#pragma pack(push, 1)
struct TcxOLEDIREntry
{
	wchar_t Name[32];
	Word NameLen;
	TcxOLEDIREntryType EntryType;
	Byte BFlag;
	unsigned LeftSib;
	unsigned RightSib;
	unsigned ChildSib;
	GUID Guid;
	int UserFlag;
	Sysutils::TTimeStamp C_M_Time[2];
	int StartSector;
	int Size;
	int Reserved;
} ;
#pragma pack(pop)

typedef int TcxFATSectors[4194303][128];

typedef int *PcxFATSectors;

//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxxlsexport */
using namespace Cxxlsexport;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxXLSExport
