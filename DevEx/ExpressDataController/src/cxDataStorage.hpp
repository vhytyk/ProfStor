// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxDataStorage.pas' rev: 6.00

#ifndef cxDataStorageHPP
#define cxDataStorageHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <SqlTimSt.hpp>	// Pascal unit
#include <FMTBcd.hpp>	// Pascal unit
#include <Variants.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxdatastorage
{
//-- type declarations -------------------------------------------------------
typedef __int64 LargeInt;

typedef __int64 *PLargeInt;

typedef AnsiString *PStringValue;

typedef WideString *PWideStringValue;

class DELPHICLASS TcxValueType;
class PASCALIMPLEMENTATION TcxValueType : public System::TObject 
{
	typedef System::TObject inherited;
	
protected:
	/* virtual class method */ virtual int __fastcall Compare(TMetaClass* vmt, void * P1, void * P2);
	/* virtual class method */ virtual void __fastcall FreeBuffer(TMetaClass* vmt, char * PBuffer);
	/* virtual class method */ virtual int __fastcall GetDataSize(TMetaClass* vmt);
	/* virtual class method */ virtual Variant __fastcall GetDataValue(TMetaClass* vmt, char * PBuffer);
	/* virtual class method */ virtual AnsiString __fastcall GetDefaultDisplayText(TMetaClass* vmt, char * PBuffer);
	/* virtual class method */ virtual AnsiString __fastcall GetDisplayText(TMetaClass* vmt, char * PBuffer);
	/* virtual class method */ virtual void __fastcall ReadDataValue(TMetaClass* vmt, char * PBuffer, Classes::TStream* AStream);
	/* virtual class method */ virtual void __fastcall ReadDisplayText(TMetaClass* vmt, char * PBuffer, Classes::TStream* AStream);
	/* virtual class method */ virtual void __fastcall SetDataValue(TMetaClass* vmt, char * PBuffer, const Variant &Value);
	/* virtual class method */ virtual void __fastcall SetDisplayText(TMetaClass* vmt, char * PBuffer, const AnsiString DisplayText);
	/* virtual class method */ virtual void __fastcall WriteDataValue(TMetaClass* vmt, char * PBuffer, Classes::TStream* AStream);
	/* virtual class method */ virtual void __fastcall WriteDisplayText(TMetaClass* vmt, char * PBuffer, Classes::TStream* AStream);
	
public:
	/* virtual class method */ virtual int __fastcall CompareValues(TMetaClass* vmt, void * P1, void * P2);
	/* virtual class method */ virtual Variant __fastcall GetValue(TMetaClass* vmt, char * PBuffer);
	/* virtual class method */ virtual int __fastcall GetVarType(TMetaClass* vmt);
	/* virtual class method */ virtual bool __fastcall IsValueValid(TMetaClass* vmt, const Variant &Value);
	/* virtual class method */ virtual bool __fastcall IsString(TMetaClass* vmt);
	/* virtual class method */ virtual void __fastcall PrepareValueBuffer(TMetaClass* vmt, char * &PBuffer);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxValueType(void) : System::TObject() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxValueType(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxValueTypeClass;

class DELPHICLASS TcxStringValueType;
class PASCALIMPLEMENTATION TcxStringValueType : public TcxValueType 
{
	typedef TcxValueType inherited;
	
protected:
	/* virtual class method */ virtual int __fastcall Compare(TMetaClass* vmt, void * P1, void * P2);
	/* virtual class method */ virtual void __fastcall FreeBuffer(TMetaClass* vmt, char * PBuffer);
	/* virtual class method */ virtual int __fastcall GetDataSize(TMetaClass* vmt);
	/* virtual class method */ virtual Variant __fastcall GetDataValue(TMetaClass* vmt, char * PBuffer);
	/* virtual class method */ virtual void __fastcall ReadDataValue(TMetaClass* vmt, char * PBuffer, Classes::TStream* AStream);
	/* virtual class method */ virtual void __fastcall SetDataValue(TMetaClass* vmt, char * PBuffer, const Variant &Value);
	/* virtual class method */ virtual void __fastcall WriteDataValue(TMetaClass* vmt, char * PBuffer, Classes::TStream* AStream);
	
public:
	/* virtual class method */ virtual int __fastcall CompareValues(TMetaClass* vmt, void * P1, void * P2);
	/* virtual class method */ virtual Variant __fastcall GetValue(TMetaClass* vmt, char * PBuffer);
	/* virtual class method */ virtual int __fastcall GetVarType(TMetaClass* vmt);
	/* virtual class method */ virtual bool __fastcall IsString(TMetaClass* vmt);
	/* virtual class method */ virtual void __fastcall PrepareValueBuffer(TMetaClass* vmt, char * &PBuffer);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxStringValueType(void) : TcxValueType() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxStringValueType(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxWideStringValueType;
class PASCALIMPLEMENTATION TcxWideStringValueType : public TcxStringValueType 
{
	typedef TcxStringValueType inherited;
	
protected:
	/* virtual class method */ virtual int __fastcall Compare(TMetaClass* vmt, void * P1, void * P2);
	/* virtual class method */ virtual void __fastcall FreeBuffer(TMetaClass* vmt, char * PBuffer);
	/* virtual class method */ virtual int __fastcall GetDataSize(TMetaClass* vmt);
	/* virtual class method */ virtual Variant __fastcall GetDataValue(TMetaClass* vmt, char * PBuffer);
	/* virtual class method */ virtual void __fastcall ReadDataValue(TMetaClass* vmt, char * PBuffer, Classes::TStream* AStream);
	/* virtual class method */ virtual void __fastcall SetDataValue(TMetaClass* vmt, char * PBuffer, const Variant &Value);
	/* virtual class method */ virtual void __fastcall WriteDataValue(TMetaClass* vmt, char * PBuffer, Classes::TStream* AStream);
	
public:
	/* virtual class method */ virtual int __fastcall CompareValues(TMetaClass* vmt, void * P1, void * P2);
	/* virtual class method */ virtual Variant __fastcall GetValue(TMetaClass* vmt, char * PBuffer);
	/* virtual class method */ virtual int __fastcall GetVarType(TMetaClass* vmt);
	/* virtual class method */ virtual bool __fastcall IsString(TMetaClass* vmt);
	/* virtual class method */ virtual void __fastcall PrepareValueBuffer(TMetaClass* vmt, char * &PBuffer);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxWideStringValueType(void) : TcxStringValueType() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxWideStringValueType(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxSmallintValueType;
class PASCALIMPLEMENTATION TcxSmallintValueType : public TcxValueType 
{
	typedef TcxValueType inherited;
	
protected:
	/* virtual class method */ virtual int __fastcall GetDataSize(TMetaClass* vmt);
	/* virtual class method */ virtual Variant __fastcall GetDataValue(TMetaClass* vmt, char * PBuffer);
	/* virtual class method */ virtual void __fastcall ReadDataValue(TMetaClass* vmt, char * PBuffer, Classes::TStream* AStream);
	/* virtual class method */ virtual void __fastcall SetDataValue(TMetaClass* vmt, char * PBuffer, const Variant &Value);
	/* virtual class method */ virtual void __fastcall WriteDataValue(TMetaClass* vmt, char * PBuffer, Classes::TStream* AStream);
	
public:
	/* virtual class method */ virtual int __fastcall CompareValues(TMetaClass* vmt, void * P1, void * P2);
	/* virtual class method */ virtual int __fastcall GetVarType(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxSmallintValueType(void) : TcxValueType() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxSmallintValueType(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxIntegerValueType;
class PASCALIMPLEMENTATION TcxIntegerValueType : public TcxValueType 
{
	typedef TcxValueType inherited;
	
protected:
	/* virtual class method */ virtual int __fastcall GetDataSize(TMetaClass* vmt);
	/* virtual class method */ virtual Variant __fastcall GetDataValue(TMetaClass* vmt, char * PBuffer);
	/* virtual class method */ virtual void __fastcall ReadDataValue(TMetaClass* vmt, char * PBuffer, Classes::TStream* AStream);
	/* virtual class method */ virtual void __fastcall SetDataValue(TMetaClass* vmt, char * PBuffer, const Variant &Value);
	/* virtual class method */ virtual void __fastcall WriteDataValue(TMetaClass* vmt, char * PBuffer, Classes::TStream* AStream);
	
public:
	/* virtual class method */ virtual int __fastcall CompareValues(TMetaClass* vmt, void * P1, void * P2);
	/* virtual class method */ virtual int __fastcall GetVarType(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxIntegerValueType(void) : TcxValueType() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxIntegerValueType(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxWordValueType;
class PASCALIMPLEMENTATION TcxWordValueType : public TcxValueType 
{
	typedef TcxValueType inherited;
	
protected:
	/* virtual class method */ virtual int __fastcall GetDataSize(TMetaClass* vmt);
	/* virtual class method */ virtual Variant __fastcall GetDataValue(TMetaClass* vmt, char * PBuffer);
	/* virtual class method */ virtual void __fastcall ReadDataValue(TMetaClass* vmt, char * PBuffer, Classes::TStream* AStream);
	/* virtual class method */ virtual void __fastcall SetDataValue(TMetaClass* vmt, char * PBuffer, const Variant &Value);
	/* virtual class method */ virtual void __fastcall WriteDataValue(TMetaClass* vmt, char * PBuffer, Classes::TStream* AStream);
	
public:
	/* virtual class method */ virtual int __fastcall CompareValues(TMetaClass* vmt, void * P1, void * P2);
	/* virtual class method */ virtual int __fastcall GetVarType(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxWordValueType(void) : TcxValueType() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxWordValueType(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxBooleanValueType;
class PASCALIMPLEMENTATION TcxBooleanValueType : public TcxValueType 
{
	typedef TcxValueType inherited;
	
protected:
	/* virtual class method */ virtual int __fastcall GetDataSize(TMetaClass* vmt);
	/* virtual class method */ virtual Variant __fastcall GetDataValue(TMetaClass* vmt, char * PBuffer);
	/* virtual class method */ virtual AnsiString __fastcall GetDefaultDisplayText(TMetaClass* vmt, char * PBuffer);
	/* virtual class method */ virtual void __fastcall ReadDataValue(TMetaClass* vmt, char * PBuffer, Classes::TStream* AStream);
	/* virtual class method */ virtual void __fastcall SetDataValue(TMetaClass* vmt, char * PBuffer, const Variant &Value);
	/* virtual class method */ virtual void __fastcall WriteDataValue(TMetaClass* vmt, char * PBuffer, Classes::TStream* AStream);
	
public:
	/* virtual class method */ virtual int __fastcall CompareValues(TMetaClass* vmt, void * P1, void * P2);
	/* virtual class method */ virtual int __fastcall GetVarType(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxBooleanValueType(void) : TcxValueType() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxBooleanValueType(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFloatValueType;
class PASCALIMPLEMENTATION TcxFloatValueType : public TcxValueType 
{
	typedef TcxValueType inherited;
	
protected:
	/* virtual class method */ virtual int __fastcall GetDataSize(TMetaClass* vmt);
	/* virtual class method */ virtual Variant __fastcall GetDataValue(TMetaClass* vmt, char * PBuffer);
	/* virtual class method */ virtual void __fastcall ReadDataValue(TMetaClass* vmt, char * PBuffer, Classes::TStream* AStream);
	/* virtual class method */ virtual void __fastcall SetDataValue(TMetaClass* vmt, char * PBuffer, const Variant &Value);
	/* virtual class method */ virtual void __fastcall WriteDataValue(TMetaClass* vmt, char * PBuffer, Classes::TStream* AStream);
	
public:
	/* virtual class method */ virtual int __fastcall CompareValues(TMetaClass* vmt, void * P1, void * P2);
	/* virtual class method */ virtual int __fastcall GetVarType(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxFloatValueType(void) : TcxValueType() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFloatValueType(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCurrencyValueType;
class PASCALIMPLEMENTATION TcxCurrencyValueType : public TcxValueType 
{
	typedef TcxValueType inherited;
	
protected:
	/* virtual class method */ virtual int __fastcall GetDataSize(TMetaClass* vmt);
	/* virtual class method */ virtual Variant __fastcall GetDataValue(TMetaClass* vmt, char * PBuffer);
	/* virtual class method */ virtual void __fastcall ReadDataValue(TMetaClass* vmt, char * PBuffer, Classes::TStream* AStream);
	/* virtual class method */ virtual void __fastcall SetDataValue(TMetaClass* vmt, char * PBuffer, const Variant &Value);
	/* virtual class method */ virtual void __fastcall WriteDataValue(TMetaClass* vmt, char * PBuffer, Classes::TStream* AStream);
	
public:
	/* virtual class method */ virtual int __fastcall CompareValues(TMetaClass* vmt, void * P1, void * P2);
	/* virtual class method */ virtual int __fastcall GetVarType(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxCurrencyValueType(void) : TcxValueType() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxCurrencyValueType(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxDateTimeValueType;
class PASCALIMPLEMENTATION TcxDateTimeValueType : public TcxValueType 
{
	typedef TcxValueType inherited;
	
protected:
	/* virtual class method */ virtual int __fastcall GetDataSize(TMetaClass* vmt);
	/* virtual class method */ virtual Variant __fastcall GetDataValue(TMetaClass* vmt, char * PBuffer);
	/* virtual class method */ virtual void __fastcall ReadDataValue(TMetaClass* vmt, char * PBuffer, Classes::TStream* AStream);
	/* virtual class method */ virtual void __fastcall SetDataValue(TMetaClass* vmt, char * PBuffer, const Variant &Value);
	/* virtual class method */ virtual void __fastcall WriteDataValue(TMetaClass* vmt, char * PBuffer, Classes::TStream* AStream);
	
public:
	/* virtual class method */ virtual int __fastcall CompareValues(TMetaClass* vmt, void * P1, void * P2);
	/* virtual class method */ virtual int __fastcall GetVarType(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxDateTimeValueType(void) : TcxValueType() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxDateTimeValueType(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxLargeIntValueType;
class PASCALIMPLEMENTATION TcxLargeIntValueType : public TcxValueType 
{
	typedef TcxValueType inherited;
	
protected:
	/* virtual class method */ virtual int __fastcall GetDataSize(TMetaClass* vmt);
	/* virtual class method */ virtual Variant __fastcall GetDataValue(TMetaClass* vmt, char * PBuffer);
	/* virtual class method */ virtual void __fastcall ReadDataValue(TMetaClass* vmt, char * PBuffer, Classes::TStream* AStream);
	/* virtual class method */ virtual void __fastcall SetDataValue(TMetaClass* vmt, char * PBuffer, const Variant &Value);
	/* virtual class method */ virtual void __fastcall WriteDataValue(TMetaClass* vmt, char * PBuffer, Classes::TStream* AStream);
	
public:
	/* virtual class method */ virtual int __fastcall CompareValues(TMetaClass* vmt, void * P1, void * P2);
	/* virtual class method */ virtual int __fastcall GetVarType(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxLargeIntValueType(void) : TcxValueType() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxLargeIntValueType(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFMTBcdValueType;
class PASCALIMPLEMENTATION TcxFMTBcdValueType : public TcxValueType 
{
	typedef TcxValueType inherited;
	
protected:
	/* virtual class method */ virtual int __fastcall GetDataSize(TMetaClass* vmt);
	/* virtual class method */ virtual Variant __fastcall GetDataValue(TMetaClass* vmt, char * PBuffer);
	/* virtual class method */ virtual void __fastcall SetDataValue(TMetaClass* vmt, char * PBuffer, const Variant &Value);
	
public:
	/* virtual class method */ virtual int __fastcall CompareValues(TMetaClass* vmt, void * P1, void * P2);
	/* virtual class method */ virtual int __fastcall GetVarType(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxFMTBcdValueType(void) : TcxValueType() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFMTBcdValueType(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxSQLTimeStampValueType;
class PASCALIMPLEMENTATION TcxSQLTimeStampValueType : public TcxValueType 
{
	typedef TcxValueType inherited;
	
protected:
	/* virtual class method */ virtual int __fastcall GetDataSize(TMetaClass* vmt);
	/* virtual class method */ virtual Variant __fastcall GetDataValue(TMetaClass* vmt, char * PBuffer);
	/* virtual class method */ virtual void __fastcall SetDataValue(TMetaClass* vmt, char * PBuffer, const Variant &Value);
	
public:
	/* virtual class method */ virtual int __fastcall CompareValues(TMetaClass* vmt, void * P1, void * P2);
	/* virtual class method */ virtual int __fastcall GetVarType(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxSQLTimeStampValueType(void) : TcxValueType() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxSQLTimeStampValueType(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxVariantValueType;
class PASCALIMPLEMENTATION TcxVariantValueType : public TcxValueType 
{
	typedef TcxValueType inherited;
	
protected:
	/* virtual class method */ virtual int __fastcall Compare(TMetaClass* vmt, void * P1, void * P2);
	/* virtual class method */ virtual void __fastcall FreeBuffer(TMetaClass* vmt, char * PBuffer);
	/* virtual class method */ virtual int __fastcall GetDataSize(TMetaClass* vmt);
	/* virtual class method */ virtual Variant __fastcall GetDataValue(TMetaClass* vmt, char * PBuffer);
	/* virtual class method */ virtual void __fastcall SetDataValue(TMetaClass* vmt, char * PBuffer, const Variant &Value);
	
public:
	/* virtual class method */ virtual int __fastcall CompareValues(TMetaClass* vmt, void * P1, void * P2);
	/* virtual class method */ virtual Variant __fastcall GetValue(TMetaClass* vmt, char * PBuffer);
	/* virtual class method */ virtual void __fastcall PrepareValueBuffer(TMetaClass* vmt, char * &PBuffer);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxVariantValueType(void) : TcxValueType() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxVariantValueType(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxObjectValueType;
class PASCALIMPLEMENTATION TcxObjectValueType : public TcxIntegerValueType 
{
	typedef TcxIntegerValueType inherited;
	
protected:
	/* virtual class method */ virtual void __fastcall FreeBuffer(TMetaClass* vmt, char * PBuffer);
	/* virtual class method */ virtual void __fastcall ReadDataValue(TMetaClass* vmt, char * PBuffer, Classes::TStream* AStream);
	/* virtual class method */ virtual void __fastcall SetDataValue(TMetaClass* vmt, char * PBuffer, const Variant &Value);
	/* virtual class method */ virtual void __fastcall WriteDataValue(TMetaClass* vmt, char * PBuffer, Classes::TStream* AStream);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxObjectValueType(void) : TcxIntegerValueType() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxObjectValueType(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxValueDef;
class DELPHICLASS TcxValueDefs;
class DELPHICLASS TcxDataStorage;
class DELPHICLASS TcxInternalValueDefs;
typedef TMetaClass*TcxValueDefClass;

class PASCALIMPLEMENTATION TcxValueDefs : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	TcxValueDef* operator[](int Index) { return Items[Index]; }
	
private:
	TcxDataStorage* FDataStorage;
	Classes::TList* FItems;
	int FRecordOffset;
	int FRecordSize;
	int __fastcall GetStoredCount(void);
	int __fastcall GetCount(void);
	TcxValueDef* __fastcall GetItem(int Index);
	
protected:
	virtual void __fastcall Changed(TcxValueDef* AValueDef, bool AResyncNeeded);
	virtual TMetaClass* __fastcall GetValueDefClass(void);
	virtual void __fastcall Prepare(int AStartOffset);
	void __fastcall Remove(TcxValueDef* AItem);
	__property TcxDataStorage* DataStorage = {read=FDataStorage};
	
public:
	__fastcall virtual TcxValueDefs(TcxDataStorage* ADataStorage);
	__fastcall virtual ~TcxValueDefs(void);
	TcxValueDef* __fastcall Add(TMetaClass* AValueTypeClass, bool AStored, bool ATextStored, System::TObject* ALinkObject);
	void __fastcall Clear(void);
	__property int StoredCount = {read=GetStoredCount, nodefault};
	__property int Count = {read=GetCount, nodefault};
	__property TcxValueDef* Items[int Index] = {read=GetItem/*, default*/};
	__property int RecordSize = {read=FRecordSize, nodefault};
};


class PASCALIMPLEMENTATION TcxInternalValueDefs : public TcxValueDefs 
{
	typedef TcxValueDefs inherited;
	
protected:
	virtual TMetaClass* __fastcall GetValueDefClass(void);
	
public:
	TcxValueDef* __fastcall FindByLinkObject(System::TObject* ALinkObject);
	void __fastcall RemoveByLinkObject(System::TObject* ALinkObject);
public:
	#pragma option push -w-inl
	/* TcxValueDefs.Create */ inline __fastcall virtual TcxInternalValueDefs(TcxDataStorage* ADataStorage) : TcxValueDefs(ADataStorage) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxValueDefs.Destroy */ inline __fastcall virtual ~TcxInternalValueDefs(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxValueDefReader;
typedef void __fastcall (__closure *TcxValueDefSetProc)(TcxValueDef* AValueDef, int AFromRecordIndex, int AToRecordIndex, TcxValueDefReader* AValueDefReader);

class PASCALIMPLEMENTATION TcxDataStorage : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	bool FDestroying;
	Classes::TList* FInternalRecordBuffers;
	TcxInternalValueDefs* FInternalValueDefs;
	bool FStoredValuesOnly;
	Classes::TList* FRecordBuffers;
	TcxValueDefs* FValueDefs;
	bool FValueDefsChanged;
	Classes::TNotifyEvent FOnClearInternalRecords;
	char * __fastcall GetRecordBuffer(int Index);
	int __fastcall GetRecordCount(void);
	void __fastcall SetStoredValuesOnly(bool Value);
	void __fastcall SetRecordBuffer(int Index, char * Value);
	void __fastcall SetRecordCount(int Value);
	
protected:
	char * __fastcall AllocRecordBuffer(int Index);
	int __fastcall CalcRecordOffset(void);
	void __fastcall ChangeRecordFlag(char * PBuffer, Byte AFlag, bool ATurnOn);
	bool __fastcall CheckValueDef(int ARecordIndex, TcxValueDef* &AValueDef);
	void __fastcall DeleteInternalRecord(int ARecordIndex);
	void __fastcall FreeAndNilRecordBuffer(int AIndex);
	virtual void __fastcall InitStructure(TcxValueDefs* AValueDefs);
	void __fastcall InsertValueDef(int AIndex, TcxValueDef* AValueDef);
	bool __fastcall IsRecordFlag(char * PBuffer, Byte AFlag);
	void __fastcall RemoveValueDef(TcxValueDef* AValueDef);
	virtual void __fastcall ValueDefsChanged(TcxValueDef* AValueDef, bool AResyncNeeded);
	virtual TcxValueDefs* __fastcall ValueDefsByRecordIndex(int Index);
	__property TcxInternalValueDefs* InternalValueDefs = {read=FInternalValueDefs};
	
public:
	__fastcall virtual TcxDataStorage(void);
	__fastcall virtual ~TcxDataStorage(void);
	int __fastcall AddInternalRecord(void);
	int __fastcall AppendRecord(void);
	virtual void __fastcall BeforeDestruction(void);
	void __fastcall BeginLoad(void);
	void __fastcall CheckStructure(void);
	void __fastcall Clear(bool AWithoutInternal);
	void __fastcall ClearInternalRecords(void);
	void __fastcall ClearRecords(bool AClearList);
	int __fastcall CompareRecords(int ARecordIndex1, int ARecordIndex2, TcxValueDef* AValueDef);
	void __fastcall DeleteRecord(int ARecordIndex);
	void __fastcall EndLoad(void);
	AnsiString __fastcall GetDisplayText(int ARecordIndex, TcxValueDef* AValueDef);
	bool __fastcall GetCompareInfo(int ARecordIndex, TcxValueDef* AValueDef, char * &P);
	Variant __fastcall GetValue(int ARecordIndex, TcxValueDef* AValueDef);
	void __fastcall InsertRecord(int ARecordIndex);
	void __fastcall ReadData(int ARecordIndex, Classes::TStream* AStream);
	void __fastcall ReadRecord(int ARecordIndex, TcxValueDefReader* AValueDefReader, bool AExceptInternal);
	void __fastcall ReadRecordFrom(int AFromRecordIndex, int AToRecordIndex, TcxValueDefReader* AValueDefReader, TcxValueDefSetProc ASetProc);
	void __fastcall SetDisplayText(int ARecordIndex, TcxValueDef* AValueDef, const AnsiString Value);
	void __fastcall SetValue(int ARecordIndex, TcxValueDef* AValueDef, const Variant &Value);
	void __fastcall WriteData(int ARecordIndex, Classes::TStream* AStream);
	__property bool StoredValuesOnly = {read=FStoredValuesOnly, write=SetStoredValuesOnly, nodefault};
	__property char * RecordBuffers[int Index] = {read=GetRecordBuffer, write=SetRecordBuffer};
	__property int RecordCount = {read=GetRecordCount, write=SetRecordCount, nodefault};
	__property TcxValueDefs* ValueDefs = {read=FValueDefs};
	__property Classes::TNotifyEvent OnClearInternalRecords = {read=FOnClearInternalRecords, write=FOnClearInternalRecords};
};



class PASCALIMPLEMENTATION TcxValueDef : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	int FBufferSize;
	int FDataSize;
	bool FStored;
	System::TObject* FLinkObject;
	int FOffset;
	bool FTextStored;
	TcxValueDefs* FValueDefs;
	TMetaClass*FValueTypeClass;
	bool __fastcall GetIsNeedConversion(void);
	bool __fastcall GetTextStored(void);
	void __fastcall SetStored(bool Value);
	void __fastcall SetTextStored(bool Value);
	void __fastcall SetValueTypeClass(TMetaClass* Value);
	
protected:
	void __fastcall Changed(bool AResyncNeeded);
	int __fastcall Compare(char * P1, char * P2);
	void __fastcall FreeBuffer(char * PBuffer);
	void __fastcall FreeTextBuffer(char * PBuffer);
	Variant __fastcall GetDataValue(char * PBuffer);
	AnsiString __fastcall GetDisplayText(char * PBuffer);
	virtual System::TObject* __fastcall GetLinkObject(void);
	virtual bool __fastcall GetStored(void);
	void __fastcall Init(int &AOffset);
	bool __fastcall IsNullValue(char * PBuffer);
	void __fastcall ReadDataValue(char * PBuffer, Classes::TStream* AStream);
	void __fastcall ReadDisplayText(char * PBuffer, Classes::TStream* AStream);
	void __fastcall SetDataValue(char * PBuffer, const Variant &Value);
	void __fastcall SetDisplayText(char * PBuffer, const AnsiString DisplayText);
	virtual void __fastcall SetLinkObject(System::TObject* Value);
	void __fastcall SetNull(char * PBuffer, bool IsNull);
	void __fastcall WriteDataValue(char * PBuffer, Classes::TStream* AStream);
	void __fastcall WriteDisplayText(char * PBuffer, Classes::TStream* AStream);
	__property int BufferSize = {read=FBufferSize, nodefault};
	__property int DataSize = {read=FDataSize, nodefault};
	__property int Offset = {read=FOffset, nodefault};
	__property TcxValueDefs* ValueDefs = {read=FValueDefs};
	
public:
	__fastcall TcxValueDef(TcxValueDefs* AValueDefs, TMetaClass* AValueTypeClass);
	__fastcall virtual ~TcxValueDef(void);
	virtual void __fastcall Assign(TcxValueDef* ASource);
	int __fastcall CompareValues(bool AIsNull1, bool AIsNull2, char * P1, char * P2);
	__property bool IsNeedConversion = {read=GetIsNeedConversion, nodefault};
	__property System::TObject* LinkObject = {read=GetLinkObject, write=SetLinkObject};
	__property bool Stored = {read=GetStored, write=SetStored, default=1};
	__property bool TextStored = {read=GetTextStored, write=SetTextStored, default=0};
	__property TMetaClass* ValueTypeClass = {read=FValueTypeClass, write=SetValueTypeClass};
};


class DELPHICLASS TcxInternalValueDef;
class PASCALIMPLEMENTATION TcxInternalValueDef : public TcxValueDef 
{
	typedef TcxValueDef inherited;
	
protected:
	virtual System::TObject* __fastcall GetLinkObject(void);
	virtual bool __fastcall GetStored(void);
	TcxValueDef* __fastcall GetValueDef(void);
public:
	#pragma option push -w-inl
	/* TcxValueDef.Create */ inline __fastcall TcxInternalValueDef(TcxValueDefs* AValueDefs, TMetaClass* AValueTypeClass) : TcxValueDef(AValueDefs, AValueTypeClass) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxValueDef.Destroy */ inline __fastcall virtual ~TcxInternalValueDef(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxValueDefReader : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	virtual AnsiString __fastcall GetDisplayText(TcxValueDef* AValueDef);
	virtual Variant __fastcall GetValue(TcxValueDef* AValueDef);
	virtual bool __fastcall IsInternal(TcxValueDef* AValueDef);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxValueDefReader(void) : System::TObject() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxValueDefReader(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxValueDefReaderClass;

struct TcxLookupListItem;
typedef TcxLookupListItem *PcxLookupListItem;

struct TcxLookupListItem
{
	Variant KeyValue;
	AnsiString DisplayText;
} ;

class DELPHICLASS TcxLookupList;
class PASCALIMPLEMENTATION TcxLookupList : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	PcxLookupListItem operator[](int Index) { return Items[Index]; }
	
private:
	Classes::TList* FItems;
	int __fastcall GetCount(void);
	PcxLookupListItem __fastcall GetItem(int Index);
	
public:
	__fastcall TcxLookupList(void);
	__fastcall virtual ~TcxLookupList(void);
	void __fastcall Clear(void);
	bool __fastcall Find(const Variant &AKeyValue, int &AIndex);
	void __fastcall Insert(int AIndex, const Variant &AKeyValue, const AnsiString ADisplayText);
	__property int Count = {read=GetCount, nodefault};
	__property PcxLookupListItem Items[int Index] = {read=GetItem/*, default*/};
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxdatastorage */
using namespace Cxdatastorage;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxDataStorage
