// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxStorage.pas' rev: 6.00

#ifndef cxStorageHPP
#define cxStorageHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxLibraryStrs.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <IniFiles.hpp>	// Pascal unit
#include <TypInfo.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Registry.hpp>	// Pascal unit
#include <Variants.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxstorage
{
//-- type declarations -------------------------------------------------------
__interface IcxStoredObject;
typedef System::DelphiInterface<IcxStoredObject> _di_IcxStoredObject;
__interface INTERFACE_UUID("{79A05009-CAC3-47E8-B454-F6F3D91F495D}") IcxStoredObject  : public IInterface 
{
	
public:
	virtual AnsiString __fastcall GetObjectName(void) = 0 ;
	virtual bool __fastcall GetProperties(Classes::TStrings* AProperties) = 0 ;
	virtual void __fastcall GetPropertyValue(const AnsiString AName, Variant &AValue) = 0 ;
	virtual void __fastcall SetPropertyValue(const AnsiString AName, const Variant &AValue) = 0 ;
};

__interface IcxStoredParent;
typedef System::DelphiInterface<IcxStoredParent> _di_IcxStoredParent;
__interface INTERFACE_UUID("{6AF48CD0-3A0B-4BEC-AC88-5D323432A686}") IcxStoredParent  : public IInterface 
{
	
public:
	virtual System::TObject* __fastcall CreateChild(const AnsiString AObjectName, const AnsiString AClassName) = 0 ;
	virtual void __fastcall DeleteChild(const AnsiString AObjectName, System::TObject* AObject) = 0 ;
	virtual void __fastcall GetChildren(Classes::TStringList* AChildren) = 0 ;
};

class DELPHICLASS EcxStorage;
class PASCALIMPLEMENTATION EcxStorage : public Sysutils::Exception 
{
	typedef Sysutils::Exception inherited;
	
public:
	#pragma option push -w-inl
	/* Exception.Create */ inline __fastcall EcxStorage(const AnsiString Msg) : Sysutils::Exception(Msg) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateFmt */ inline __fastcall EcxStorage(const AnsiString Msg, const System::TVarRec * Args, const int Args_Size) : Sysutils::Exception(Msg, Args, Args_Size) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateRes */ inline __fastcall EcxStorage(int Ident)/* overload */ : Sysutils::Exception(Ident) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResFmt */ inline __fastcall EcxStorage(int Ident, const System::TVarRec * Args, const int Args_Size)/* overload */ : Sysutils::Exception(Ident, Args, Args_Size) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateHelp */ inline __fastcall EcxStorage(const AnsiString Msg, int AHelpContext) : Sysutils::Exception(Msg, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateFmtHelp */ inline __fastcall EcxStorage(const AnsiString Msg, const System::TVarRec * Args, const int Args_Size, int AHelpContext) : Sysutils::Exception(Msg, Args, Args_Size, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResHelp */ inline __fastcall EcxStorage(int Ident, int AHelpContext)/* overload */ : Sysutils::Exception(Ident, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResFmtHelp */ inline __fastcall EcxStorage(System::PResStringRec ResStringRec, const System::TVarRec * Args, const int Args_Size, int AHelpContext)/* overload */ : Sysutils::Exception(ResStringRec, Args, Args_Size, AHelpContext) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~EcxStorage(void) { }
	#pragma option pop
	
};


class DELPHICLASS EcxHexStringConvertError;
class PASCALIMPLEMENTATION EcxHexStringConvertError : public Sysutils::Exception 
{
	typedef Sysutils::Exception inherited;
	
public:
	#pragma option push -w-inl
	/* Exception.Create */ inline __fastcall EcxHexStringConvertError(const AnsiString Msg) : Sysutils::Exception(Msg) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateFmt */ inline __fastcall EcxHexStringConvertError(const AnsiString Msg, const System::TVarRec * Args, const int Args_Size) : Sysutils::Exception(Msg, Args, Args_Size) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateRes */ inline __fastcall EcxHexStringConvertError(int Ident)/* overload */ : Sysutils::Exception(Ident) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResFmt */ inline __fastcall EcxHexStringConvertError(int Ident, const System::TVarRec * Args, const int Args_Size)/* overload */ : Sysutils::Exception(Ident, Args, Args_Size) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateHelp */ inline __fastcall EcxHexStringConvertError(const AnsiString Msg, int AHelpContext) : Sysutils::Exception(Msg, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateFmtHelp */ inline __fastcall EcxHexStringConvertError(const AnsiString Msg, const System::TVarRec * Args, const int Args_Size, int AHelpContext) : Sysutils::Exception(Msg, Args, Args_Size, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResHelp */ inline __fastcall EcxHexStringConvertError(int Ident, int AHelpContext)/* overload */ : Sysutils::Exception(Ident, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResFmtHelp */ inline __fastcall EcxHexStringConvertError(System::PResStringRec ResStringRec, const System::TVarRec * Args, const int Args_Size, int AHelpContext)/* overload */ : Sysutils::Exception(ResStringRec, Args, Args_Size, AHelpContext) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~EcxHexStringConvertError(void) { }
	#pragma option pop
	
};


#pragma option push -b-
enum TcxStorageMode { smChildrenCreating, smChildrenDeleting, smSavePublishedClassProperties };
#pragma option pop

typedef Set<TcxStorageMode, smChildrenCreating, smSavePublishedClassProperties>  TcxStorageModes;

typedef TMetaClass*TcxCustomReaderClass;

typedef TMetaClass*TcxCustomWriterClass;

typedef TcxStorageModes __fastcall (__closure *TcxGetStorageModesEvent)(void);

typedef bool __fastcall (__closure *TcxTestClassPropertyEvent)(const AnsiString AName, System::TObject* AObject);

typedef Classes::TComponent* __fastcall (__closure *TcxGetComponentByNameEvent)(const AnsiString AName);

typedef bool __fastcall (__closure *TcxGetUseInterfaceOnlyEvent)(void);

class DELPHICLASS TcxStorage;
class DELPHICLASS TcxCustomReader;
class DELPHICLASS TcxCustomWriter;
class PASCALIMPLEMENTATION TcxStorage : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	AnsiString FNamePrefix;
	TcxStorageModes FModes;
	AnsiString FObjectNamePrefix;
	bool FReCreate;
	AnsiString FStorageName;
	Classes::TStream* FStream;
	System::TObject* FStoredObject;
	bool FSaveComponentPropertiesByName;
	bool FUseInterfaceOnly;
	TcxGetStorageModesEvent FOnGetStorageModes;
	TcxGetComponentByNameEvent FOnGetComponentByName;
	TcxTestClassPropertyEvent FOnTestClassProperty;
	TcxGetUseInterfaceOnlyEvent FOnGetUseInterfaceOnly;
	System::TObject* __fastcall CreateChild(const AnsiString AObjectName, const AnsiString AClassName);
	void __fastcall CreateChildrenNames(Classes::TStringList* AChildren);
	void __fastcall DeleteChild(const AnsiString AObjectName, System::TObject* AObject);
	void __fastcall GetAllPublishedClassProperties(Classes::TStrings* AProperties);
	void __fastcall GetAllPublishedProperties(Classes::TStrings* AProperties);
	void __fastcall GetChildren(Classes::TStringList* AChildren);
	System::TObject* __fastcall GetClassProperty(const AnsiString AName);
	Classes::TComponent* __fastcall GetComponentByName(const AnsiString AName);
	AnsiString __fastcall GetObjectName(System::TObject* AObject);
	void __fastcall GetProperties(Classes::TStrings* AProperties);
	Variant __fastcall GetPropertyValue(AnsiString AName);
	TcxStorageModes __fastcall GetStorageModes(void);
	bool __fastcall GetUseInterfaceOnly(void);
	void __fastcall SetPropertyValue(AnsiString AName, const Variant &AValue);
	bool __fastcall TestClassProperty(const AnsiString AName, System::TObject* AObject);
	
protected:
	virtual void __fastcall InternalRestoreFrom(TcxCustomReader* AReader, const AnsiString ADefaultObjectName = "");
	virtual void __fastcall InternalStoreTo(TcxCustomWriter* AWriter, const AnsiString ADefaultObjectName = "");
	void __fastcall SetStoredObject(System::TObject* AObject);
	
public:
	__fastcall TcxStorage(const AnsiString AStorageName)/* overload */;
	__fastcall TcxStorage(Classes::TStream* AStream)/* overload */;
	__fastcall virtual ~TcxStorage(void);
	virtual void __fastcall RestoreFrom(System::TObject* AObject, TMetaClass* AReaderClass);
	virtual void __fastcall RestoreWithExistingReader(System::TObject* AObject, TcxCustomReader* AReader);
	void __fastcall RestoreFromIni(System::TObject* AObject);
	void __fastcall RestoreFromRegistry(System::TObject* AObject);
	void __fastcall RestoreFromStream(System::TObject* AObject);
	virtual void __fastcall StoreTo(System::TObject* AObject, TMetaClass* AWriterClass);
	virtual void __fastcall StoreWithExistingWriter(System::TObject* AObject, TcxCustomWriter* AWriter);
	void __fastcall StoreToIni(System::TObject* AObject);
	void __fastcall StoreToRegistry(System::TObject* AObject);
	void __fastcall StoreToStream(System::TObject* AObject);
	__property AnsiString NamePrefix = {read=FNamePrefix, write=FNamePrefix};
	__property TcxStorageModes Modes = {read=FModes, write=FModes, nodefault};
	__property bool ReCreate = {read=FReCreate, write=FReCreate, nodefault};
	__property bool SaveComponentPropertiesByName = {read=FSaveComponentPropertiesByName, write=FSaveComponentPropertiesByName, nodefault};
	__property System::TObject* StoredObject = {read=FStoredObject};
	__property AnsiString StorageName = {read=FStorageName, write=FStorageName};
	__property bool UseInterfaceOnly = {read=FUseInterfaceOnly, write=FUseInterfaceOnly, nodefault};
	__property TcxGetComponentByNameEvent OnGetComponentByName = {read=FOnGetComponentByName, write=FOnGetComponentByName};
	__property TcxGetStorageModesEvent OnGetStorageModes = {read=FOnGetStorageModes, write=FOnGetStorageModes};
	__property TcxGetUseInterfaceOnlyEvent OnGetUseInterfaceOnly = {read=FOnGetUseInterfaceOnly, write=FOnGetUseInterfaceOnly};
	__property TcxTestClassPropertyEvent OnTestClassProperty = {read=FOnTestClassProperty, write=FOnTestClassProperty};
};


class PASCALIMPLEMENTATION TcxCustomReader : public System::TObject 
{
	typedef System::TObject inherited;
	
protected:
	AnsiString StorageName;
	
public:
	__fastcall virtual TcxCustomReader(const AnsiString AStorageName);
	virtual void __fastcall ReadProperties(const AnsiString AObjectName, const AnsiString AClassName, Classes::TStrings* AProperties);
	virtual Variant __fastcall ReadProperty(const AnsiString AObjectName, const AnsiString AClassName, const AnsiString AName);
	virtual void __fastcall ReadChildren(const AnsiString AObjectName, const AnsiString AClassName, Classes::TStrings* AChildrenNames, Classes::TStrings* AChildrenClassNames);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxCustomReader(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxCustomWriter : public System::TObject 
{
	typedef System::TObject inherited;
	
protected:
	bool FReCreate;
	AnsiString FStorageName;
	
public:
	__fastcall virtual TcxCustomWriter(const AnsiString AStorageName, bool AReCreate);
	virtual void __fastcall BeginWriteObject(const AnsiString AObjectName, const AnsiString AClassName);
	virtual void __fastcall EndWriteObject(const AnsiString AObjectName, const AnsiString AClassName);
	virtual void __fastcall WriteProperty(const AnsiString AObjectName, const AnsiString AClassName, const AnsiString AName, const Variant &AValue);
	__property bool ReCreate = {read=FReCreate, write=FReCreate, nodefault};
	__property AnsiString StorageName = {read=FStorageName};
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxCustomWriter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxRegistryReader;
class PASCALIMPLEMENTATION TcxRegistryReader : public TcxCustomReader 
{
	typedef TcxCustomReader inherited;
	
private:
	Registry::TRegistry* FRegistry;
	
public:
	__fastcall virtual TcxRegistryReader(const AnsiString AStorageName);
	__fastcall virtual ~TcxRegistryReader(void);
	virtual void __fastcall ReadProperties(const AnsiString AObjectName, const AnsiString AClassName, Classes::TStrings* AProperties);
	virtual Variant __fastcall ReadProperty(const AnsiString AObjectName, const AnsiString AClassName, const AnsiString AName);
	virtual void __fastcall ReadChildren(const AnsiString AObjectName, const AnsiString AClassName, Classes::TStrings* AChildrenNames, Classes::TStrings* AChildrenClassNames);
};


class DELPHICLASS TcxRegistryWriter;
class PASCALIMPLEMENTATION TcxRegistryWriter : public TcxCustomWriter 
{
	typedef TcxCustomWriter inherited;
	
private:
	Registry::TRegistry* FRegistry;
	bool FRootKeyCreated;
	bool FRootKeyOpened;
	void __fastcall CreateRootKey(void);
	
public:
	__fastcall virtual TcxRegistryWriter(const AnsiString AStorageName, bool AReCreate);
	__fastcall virtual ~TcxRegistryWriter(void);
	virtual void __fastcall BeginWriteObject(const AnsiString AObjectName, const AnsiString AClassName);
	virtual void __fastcall EndWriteObject(const AnsiString AObjectName, const AnsiString AClassName);
	virtual void __fastcall WriteProperty(const AnsiString AObjectName, const AnsiString AClassName, const AnsiString AName, const Variant &AValue);
};


class DELPHICLASS TcxIniFileReader;
class PASCALIMPLEMENTATION TcxIniFileReader : public TcxCustomReader 
{
	typedef TcxCustomReader inherited;
	
private:
	Inifiles::TMemIniFile* FIniFile;
	Classes::TStringList* FPathList;
	Classes::TStringList* FObjectNameList;
	Classes::TStringList* FClassNameList;
	void __fastcall CreateLists(void);
	void __fastcall GetSectionDetail(const AnsiString ASection, AnsiString &APath, AnsiString &AObjectName, AnsiString &AClassName);
	
public:
	__fastcall virtual TcxIniFileReader(const AnsiString AStorageName);
	__fastcall virtual ~TcxIniFileReader(void);
	virtual void __fastcall ReadProperties(const AnsiString AObjectName, const AnsiString AClassName, Classes::TStrings* AProperties);
	virtual Variant __fastcall ReadProperty(const AnsiString AObjectName, const AnsiString AClassName, const AnsiString AName);
	virtual void __fastcall ReadChildren(const AnsiString AObjectName, const AnsiString AClassName, Classes::TStrings* AChildrenNames, Classes::TStrings* AChildrenClassNames);
};


class DELPHICLASS TcxIniFileWriter;
class PASCALIMPLEMENTATION TcxIniFileWriter : public TcxCustomWriter 
{
	typedef TcxCustomWriter inherited;
	
private:
	Inifiles::TMemIniFile* FIniFile;
	
public:
	__fastcall virtual TcxIniFileWriter(const AnsiString AStorageName, bool AReCreate);
	__fastcall virtual ~TcxIniFileWriter(void);
	virtual void __fastcall BeginWriteObject(const AnsiString AObjectName, const AnsiString AClassName);
	virtual void __fastcall WriteProperty(const AnsiString AObjectName, const AnsiString AClassName, const AnsiString AName, const Variant &AValue);
};


class DELPHICLASS TcxStreamReader;
class DELPHICLASS TcxStreamObjectData;
class DELPHICLASS TcxStreamPropertyData;
class PASCALIMPLEMENTATION TcxStreamObjectData : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	AnsiString FClassName;
	Classes::TList* FChildren;
	AnsiString FName;
	Classes::TList* FProperties;
	void __fastcall Clear(void);
	int __fastcall GetChildCount(void);
	TcxStreamObjectData* __fastcall GetChildren(int AIndex);
	TcxStreamPropertyData* __fastcall GetProperties(int AIndex);
	int __fastcall GetPropertyCount(void);
	
public:
	__fastcall TcxStreamObjectData(const AnsiString AName, const AnsiString AClassName);
	__fastcall virtual ~TcxStreamObjectData(void);
	void __fastcall AddChild(TcxStreamObjectData* AChild);
	void __fastcall AddProperty(TcxStreamPropertyData* AProperty);
	void __fastcall Read(Classes::TReader* AReader);
	void __fastcall Write(Classes::TWriter* AWriter);
	__property int ChildCount = {read=GetChildCount, nodefault};
	__property TcxStreamObjectData* Children[int AIndex] = {read=GetChildren};
	__property AnsiString Name = {read=FName};
	__property AnsiString ClassName_ = {read=FClassName};
	__property TcxStreamPropertyData* Properties[int AIndex] = {read=GetProperties};
	__property int PropertyCount = {read=GetPropertyCount, nodefault};
};


class PASCALIMPLEMENTATION TcxStreamReader : public TcxCustomReader 
{
	typedef TcxCustomReader inherited;
	
private:
	TcxStreamObjectData* FCurrentObject;
	AnsiString FCurrentObjectFullName;
	TcxStreamObjectData* FRootObject;
	Classes::TReader* FReader;
	TcxStreamObjectData* __fastcall GetObject(const AnsiString AObjectFullName);
	TcxStreamPropertyData* __fastcall GetProperty(TcxStreamObjectData* AObject, const AnsiString AName);
	TcxStreamObjectData* __fastcall InternalGetObject(const AnsiString AObjectName, Classes::TStrings* AParents);
	
public:
	__fastcall virtual TcxStreamReader(const AnsiString AStorageName);
	__fastcall virtual ~TcxStreamReader(void);
	void __fastcall Read(void);
	virtual void __fastcall ReadProperties(const AnsiString AObjectName, const AnsiString AClassName, Classes::TStrings* AProperties);
	virtual Variant __fastcall ReadProperty(const AnsiString AObjectName, const AnsiString AClassName, const AnsiString AName);
	virtual void __fastcall ReadChildren(const AnsiString AObjectName, const AnsiString AClassName, Classes::TStrings* AChildrenNames, Classes::TStrings* AChildrenClassNames);
	void __fastcall SetStream(Classes::TStream* AStream);
};


class DELPHICLASS TcxStreamWriter;
class PASCALIMPLEMENTATION TcxStreamWriter : public TcxCustomWriter 
{
	typedef TcxCustomWriter inherited;
	
private:
	TcxStreamObjectData* FCurrentObject;
	TcxStreamObjectData* FRootObject;
	Classes::TWriter* FWriter;
	void __fastcall CreateObject(const AnsiString AObjectName, const AnsiString AClassName, Classes::TStrings* AParents);
	
public:
	__fastcall virtual TcxStreamWriter(const AnsiString AStorageName, bool AReCreate);
	__fastcall virtual ~TcxStreamWriter(void);
	virtual void __fastcall BeginWriteObject(const AnsiString AObjectName, const AnsiString AClassName);
	void __fastcall SetStream(Classes::TStream* AStream);
	void __fastcall Write(void);
	virtual void __fastcall WriteProperty(const AnsiString AObjectName, const AnsiString AClassName, const AnsiString AName, const Variant &AValue);
};


class PASCALIMPLEMENTATION TcxStreamPropertyData : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	AnsiString FName;
	Variant FValue;
	void __fastcall ReadValue(Classes::TReader* AReader);
	void __fastcall WriteValue(Classes::TWriter* AWriter);
	
public:
	__fastcall TcxStreamPropertyData(AnsiString AName, const Variant &AValue);
	void __fastcall Read(Classes::TReader* AReader);
	void __fastcall Write(Classes::TWriter* AWriter);
	__property AnsiString Name = {read=FName};
	__property Variant Value = {read=FValue};
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxStreamPropertyData(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE int cxBufferSize;
static const Shortint cxStreamBoolean = 0x1;
static const Shortint cxStreamChar = 0x2;
static const Shortint cxStreamCurrency = 0x3;
static const Shortint cxStreamDate = 0x4;
static const Shortint cxStreamFloat = 0x5;
static const Shortint cxStreamInteger = 0x6;
static const Shortint cxStreamSingle = 0x7;
static const Shortint cxStreamString = 0x8;
static const Shortint cxStreamWideString = 0x9;
extern PACKAGE AnsiString __fastcall StringToHexString(const AnsiString AString);
extern PACKAGE AnsiString __fastcall HexStringToString(const AnsiString AHexString);
extern PACKAGE bool __fastcall StringToBoolean(const AnsiString AString);
extern PACKAGE AnsiString __fastcall EnumerationToString(const int AValue, const AnsiString * AEnumNames, const int AEnumNames_Size);
extern PACKAGE int __fastcall StringToEnumeration(const AnsiString AValue, const AnsiString * AEnumNames, const int AEnumNames_Size);
extern PACKAGE AnsiString __fastcall SetToString(const void *ASet, int ASize, const AnsiString * AEnumNames, const int AEnumNames_Size);
extern PACKAGE void __fastcall StringToSet(AnsiString AString, void *ASet, int ASize, const AnsiString * AEnumNames, const int AEnumNames_Size);

}	/* namespace Cxstorage */
using namespace Cxstorage;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxStorage
