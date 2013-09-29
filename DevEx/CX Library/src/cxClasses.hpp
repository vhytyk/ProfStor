// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxClasses.pas' rev: 6.00

#ifndef cxClassesHPP
#define cxClassesHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Classes.hpp>	// Pascal unit
#include <ShellAPI.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxclasses
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TcxAlignmentVert { vaTop, vaBottom, vaCenter };
#pragma option pop

#pragma option push -b-
enum TcxDirection { dirNone, dirLeft, dirRight, dirUp, dirDown };
#pragma option pop

typedef Classes::TComponent* __fastcall (*TcxGetComponent)(Classes::TComponent* ACaller, int Index);

typedef TMetaClass*TcxInterfacedPersistentClass;

class DELPHICLASS TcxInterfacedPersistent;
class PASCALIMPLEMENTATION TcxInterfacedPersistent : public Classes::TInterfacedPersistent 
{
	typedef Classes::TInterfacedPersistent inherited;
	
private:
	Classes::TPersistent* FOwner;
	
protected:
	DYNAMIC Classes::TPersistent* __fastcall GetOwner(void);
	
public:
	__fastcall virtual TcxInterfacedPersistent(Classes::TPersistent* AOwner);
	__property Classes::TPersistent* Owner = {read=FOwner};
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxInterfacedPersistent(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxComponent;
class PASCALIMPLEMENTATION TcxComponent : public Classes::TComponent 
{
	typedef Classes::TComponent inherited;
	
private:
	Classes::TComponent* FFakeComponentLink1;
	Classes::TComponent* FFakeComponentLink2;
	Classes::TComponent* FFakeComponentLink3;
	int __fastcall GetFakeComponentLinkCount(void);
	void __fastcall SetFakeComponentLink(int Index, Classes::TComponent* Value);
	
protected:
	virtual void __fastcall GetFakeComponentLinks(Classes::TList* AList);
	virtual void __fastcall Loaded(void);
	void __fastcall UpdateFakeLinks(void);
	
public:
	virtual void __fastcall BeforeDestruction(void);
	
__published:
	__property Classes::TComponent* FakeComponentLink1 = {read=FFakeComponentLink1, write=FFakeComponentLink1, stored=false};
	__property Classes::TComponent* FakeComponentLink2 = {read=FFakeComponentLink2, write=FFakeComponentLink2, stored=false};
	__property Classes::TComponent* FakeComponentLink3 = {read=FFakeComponentLink3, write=FFakeComponentLink3, stored=false};
public:
	#pragma option push -w-inl
	/* TComponent.Create */ inline __fastcall virtual TcxComponent(Classes::TComponent* AOwner) : Classes::TComponent(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TComponent.Destroy */ inline __fastcall virtual ~TcxComponent(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxObjectList;
class PASCALIMPLEMENTATION TcxObjectList : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	System::TObject* operator[](int Index) { return Items[Index]; }
	
private:
	Classes::TList* FItems;
	int __fastcall GetCount(void);
	System::TObject* __fastcall GetItem(int Index);
	
protected:
	virtual void __fastcall Add(System::TObject* AItem);
	
public:
	__fastcall virtual TcxObjectList(void);
	__fastcall virtual ~TcxObjectList(void);
	virtual void __fastcall Clear(void);
	__property int Count = {read=GetCount, nodefault};
	__property System::TObject* Items[int Index] = {read=GetItem/*, default*/};
};


struct TcxRegisteredClassListItemData;
typedef TcxRegisteredClassListItemData *PcxRegisteredClassListItemData;

#pragma pack(push, 4)
struct TcxRegisteredClassListItemData
{
	TMetaClass*ItemClass;
	TMetaClass*RegisteredClass;
} ;
#pragma pack(pop)

class DELPHICLASS TcxRegisteredClassList;
class PASCALIMPLEMENTATION TcxRegisteredClassList : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	PcxRegisteredClassListItemData operator[](int Index) { return Items[Index]; }
	
private:
	Classes::TList* FItems;
	int __fastcall GetCount(void);
	PcxRegisteredClassListItemData __fastcall GetItem(int Index);
	
protected:
	virtual bool __fastcall Find(TMetaClass* AItemClass, int &AIndex);
	
public:
	__fastcall TcxRegisteredClassList(void);
	__fastcall virtual ~TcxRegisteredClassList(void);
	void __fastcall Clear(void);
	TMetaClass* __fastcall FindClass(TMetaClass* AItemClass);
	virtual void __fastcall Register(TMetaClass* AItemClass, TMetaClass* ARegisteredClass);
	virtual void __fastcall Unregister(TMetaClass* AItemClass, TMetaClass* ARegisteredClass);
	__property int Count = {read=GetCount, nodefault};
	__property PcxRegisteredClassListItemData Items[int Index] = {read=GetItem/*, default*/};
};


class DELPHICLASS TcxRegisteredClasses;
class PASCALIMPLEMENTATION TcxRegisteredClasses : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	TMetaClass* operator[](int Index) { return Items[Index]; }
	
private:
	Classes::TStringList* FItems;
	bool FRegisterClasses;
	int __fastcall GetCount(void);
	AnsiString __fastcall GetDescription(int Index);
	AnsiString __fastcall GetHint(int Index);
	TMetaClass* __fastcall GetItem(int Index);
	
public:
	__fastcall TcxRegisteredClasses(bool ARegisterClasses);
	__fastcall virtual ~TcxRegisteredClasses(void);
	void __fastcall Clear(void);
	TMetaClass* __fastcall FindByClassName(const AnsiString AClassName);
	TMetaClass* __fastcall FindByDescription(const AnsiString ADescription);
	AnsiString __fastcall GetDescriptionByClass(TMetaClass* AClass);
	AnsiString __fastcall GetHintByClass(TMetaClass* AClass);
	int __fastcall GetIndexByClass(TMetaClass* AClass);
	void __fastcall Register(TMetaClass* AClass, const AnsiString ADescription);
	void __fastcall Unregister(TMetaClass* AClass);
	__property int Count = {read=GetCount, nodefault};
	__property AnsiString Descriptions[int Index] = {read=GetDescription};
	__property AnsiString Hints[int Index] = {read=GetHint};
	__property TMetaClass* Items[int Index] = {read=GetItem/*, default*/};
	__property bool RegisterClasses = {read=FRegisterClasses, write=FRegisterClasses, nodefault};
};


class DELPHICLASS TcxAutoWidthItem;
class PASCALIMPLEMENTATION TcxAutoWidthItem : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	int MinWidth;
	int Width;
	bool Fixed;
	int AutoWidth;
	__fastcall TcxAutoWidthItem(void);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxAutoWidthItem(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxAutoWidthObject;
class PASCALIMPLEMENTATION TcxAutoWidthObject : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	TcxAutoWidthItem* operator[](int Index) { return Items[Index]; }
	
private:
	int FAvailableWidth;
	Classes::TList* FItems;
	int __fastcall GetCount(void);
	TcxAutoWidthItem* __fastcall GetItem(int Index);
	int __fastcall GetWidth(void);
	
protected:
	void __fastcall Clear(void);
	
public:
	__fastcall TcxAutoWidthObject(int ACount);
	__fastcall virtual ~TcxAutoWidthObject(void);
	TcxAutoWidthItem* __fastcall AddItem(void);
	void __fastcall Calculate(void);
	__property int AvailableWidth = {read=FAvailableWidth, write=FAvailableWidth, nodefault};
	__property int Count = {read=GetCount, nodefault};
	__property TcxAutoWidthItem* Items[int Index] = {read=GetItem/*, default*/};
	__property int Width = {read=GetWidth, nodefault};
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE AnsiString __fastcall GetValidName(Classes::TComponent* AComponent, const AnsiString AName, bool AIsBaseName = false);
extern PACKAGE void __fastcall RenameComponents(Classes::TComponent* ACaller, Classes::TComponent* AOwner, AnsiString ANewName, AnsiString AOldName, int AComponentCount, TcxGetComponent AGetComponent);
extern PACKAGE int __fastcall RoundDiv(int I1, int I2);
extern PACKAGE tagSIZE __fastcall Size(int cx, int cy);
extern PACKAGE void __fastcall OpenWebPage(const AnsiString AWebAddress);
extern PACKAGE AnsiString __fastcall GetCorrectPath(const AnsiString S);
extern PACKAGE AnsiString __fastcall cxGetResourceString(const void * ResString);
extern PACKAGE void __fastcall cxSetResourceString(const void * ResString, const AnsiString Value);

}	/* namespace Cxclasses */
using namespace Cxclasses;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxClasses
