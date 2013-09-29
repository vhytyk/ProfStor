// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxStyles.pas' rev: 6.00

#ifndef cxStylesHPP
#define cxStylesHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxGraphics.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxstyles
{
//-- type declarations -------------------------------------------------------
__interface IcxStyleListener;
typedef System::DelphiInterface<IcxStyleListener> _di_IcxStyleListener;
class DELPHICLASS TcxCustomStyle;
__interface INTERFACE_UUID("{4496153D-2D78-44E3-AB67-D05DC9F0E3EE}") IcxStyleListener  : public IInterface 
{
	
public:
	virtual void __fastcall StyleChanged(TcxCustomStyle* Sender) = 0 ;
	virtual void __fastcall StyleRemoved(TcxCustomStyle* Sender) = 0 ;
};

class DELPHICLASS TcxStyleRepository;
class DELPHICLASS TcxCustomStyleSheet;
typedef TMetaClass*TcxCustomStyleClass;

typedef TMetaClass*TcxCustomStyleSheetClass;

class PASCALIMPLEMENTATION TcxStyleRepository : public Classes::TComponent 
{
	typedef Classes::TComponent inherited;
	
public:
	TcxCustomStyle* operator[](int Index) { return Items[Index]; }
	
private:
	Classes::TList* FItems;
	Classes::TList* FStyleSheets;
	int __fastcall GetCount(void);
	TcxCustomStyle* __fastcall GetItem(int Index);
	int __fastcall GetStyleSheetCount(void);
	TcxCustomStyleSheet* __fastcall GetStyleSheet(int Index);
	
protected:
	void __fastcall AddItem(TcxCustomStyle* AItem);
	void __fastcall AddStyleSheet(TcxCustomStyleSheet* AStyleSheet);
	DYNAMIC void __fastcall GetChildren(Classes::TGetChildProc Proc, Classes::TComponent* Root);
	void __fastcall RemoveItem(TcxCustomStyle* AItem);
	void __fastcall RemoveStyleSheet(TcxCustomStyleSheet* AStyleSheet);
	
public:
	__fastcall virtual TcxStyleRepository(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxStyleRepository(void);
	void __fastcall Clear(void);
	void __fastcall ClearStyleSheets(void);
	virtual TcxCustomStyle* __fastcall CreateItem(TMetaClass* AStyleClass);
	virtual TcxCustomStyle* __fastcall CreateItemEx(TMetaClass* AStyleClass, Classes::TComponent* AOwner);
	virtual TcxCustomStyleSheet* __fastcall CreateStyleSheet(TMetaClass* AStyleSheetClass);
	virtual TcxCustomStyleSheet* __fastcall CreateStyleSheetEx(TMetaClass* AStyleSheetClass, Classes::TComponent* AOwner);
	int __fastcall StyleIndexOf(TcxCustomStyle* AStyle);
	int __fastcall StyleSheetIndexOf(TcxCustomStyleSheet* AStyleSheet);
	__property int Count = {read=GetCount, nodefault};
	__property int StyleSheetCount = {read=GetStyleSheetCount, nodefault};
	__property TcxCustomStyle* Items[int Index] = {read=GetItem/*, default*/};
	__property TcxCustomStyleSheet* StyleSheets[int Index] = {read=GetStyleSheet};
};


class PASCALIMPLEMENTATION TcxCustomStyle : public Classes::TComponent 
{
	typedef Classes::TComponent inherited;
	
private:
	Classes::_di_IInterfaceList FListenerList;
	TcxStyleRepository* FStyleRepository;
	int __fastcall GetIndex(void);
	void __fastcall SetStyleRepository(TcxStyleRepository* Value);
	
protected:
	virtual void __fastcall Changed(void);
	virtual void __fastcall ReadState(Classes::TReader* Reader);
	
public:
	__fastcall virtual TcxCustomStyle(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxCustomStyle(void);
	virtual void __fastcall AddListener(_di_IcxStyleListener AListener);
	DYNAMIC Classes::TComponent* __fastcall GetParentComponent(void);
	DYNAMIC bool __fastcall HasParent(void);
	virtual void __fastcall RemoveListener(_di_IcxStyleListener AListener);
	virtual void __fastcall RestoreDefaults(void);
	DYNAMIC void __fastcall SetParentComponent(Classes::TComponent* AParent);
	__property int Index = {read=GetIndex, nodefault};
	__property TcxStyleRepository* StyleRepository = {read=FStyleRepository, write=SetStyleRepository};
};


typedef TMetaClass*TcxCustomStylesClass;

class DELPHICLASS TcxCustomStyles;
struct TcxCustomStylesItem;
typedef TcxCustomStylesItem *PcxCustomStylesItem;

class PASCALIMPLEMENTATION TcxCustomStyles : public Cxclasses::TcxInterfacedPersistent 
{
	typedef Cxclasses::TcxInterfacedPersistent inherited;
	
private:
	bool FDestroying;
	Classes::TList* FItems;
	TcxCustomStyleSheet* FStyleSheet;
	TcxCustomStyleSheet* FOwnerStyleSheet;
	int __fastcall GetCount(void);
	PcxCustomStylesItem __fastcall GetItem(int Index);
	void __fastcall SetStyleSheet(const TcxCustomStyleSheet* Value);
	
protected:
	void __fastcall StyleChanged(TcxCustomStyle* Sender);
	void __fastcall StyleRemoved(TcxCustomStyle* Sender);
	virtual void __fastcall Changed(int AIndex);
	void __fastcall Clear(void);
	void __fastcall Delete(int AItemIndex);
	virtual void __fastcall DoChanged(int AIndex);
	bool __fastcall Find(int AIndex, int &AItemIndex);
	TcxCustomStyle* __fastcall GetValue(int Index);
	void __fastcall SetValue(int Index, TcxCustomStyle* Value);
	__property int Count = {read=GetCount, nodefault};
	__property bool Destroying = {read=FDestroying, nodefault};
	__property PcxCustomStylesItem Items[int Index] = {read=GetItem};
	__property TcxCustomStyleSheet* OwnerStyleSheet = {read=FOwnerStyleSheet};
	__property TcxCustomStyleSheet* StyleSheet = {read=FStyleSheet, write=SetStyleSheet};
	
public:
	__fastcall virtual TcxCustomStyles(Classes::TPersistent* AOwner);
	__fastcall virtual ~TcxCustomStyles(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	bool __fastcall IsValidStyleSheet(TcxCustomStyleSheet* AStyleSheet);
	void __fastcall ResetStyles(void);
	__property TcxCustomStyle* Values[int Index] = {read=GetValue, write=SetValue};
private:
	void *__IcxStyleListener;	/* Cxstyles::IcxStyleListener */
	
public:
	operator IcxStyleListener*(void) { return (IcxStyleListener*)&__IcxStyleListener; }
	
};


class PASCALIMPLEMENTATION TcxCustomStyleSheet : public Cxclasses::TcxComponent 
{
	typedef Cxclasses::TcxComponent inherited;
	
private:
	bool FBuiltIn;
	AnsiString FCaption;
	TcxCustomStyles* FStyles;
	Classes::TList* FStylesList;
	TcxStyleRepository* FStyleRepository;
	bool __fastcall GetCaptionStored(void);
	AnsiString __fastcall GetCaption();
	int __fastcall GetIndex(void);
	void __fastcall SetCaption(const AnsiString Value);
	void __fastcall SetStyleRepository(TcxStyleRepository* Value);
	void __fastcall ReadBuiltIn(Classes::TReader* AReader);
	void __fastcall WriteBuiltIn(Classes::TWriter* AWriter);
	
protected:
	virtual void __fastcall DefineProperties(Classes::TFiler* AFiler);
	void __fastcall DoStyleChanged(int AIndex);
	virtual void __fastcall GetFakeComponentLinks(Classes::TList* AList);
	virtual void __fastcall ReadState(Classes::TReader* Reader);
	
public:
	__fastcall virtual TcxCustomStyleSheet(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxCustomStyleSheet(void);
	void __fastcall AddStyles(TcxCustomStyles* AStyles);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	void __fastcall CopyFrom(TcxCustomStyleSheet* AStyleSheet);
	/* virtual class method */ virtual TMetaClass* __fastcall GetStylesClass(TMetaClass* vmt);
	DYNAMIC Classes::TComponent* __fastcall GetParentComponent(void);
	DYNAMIC bool __fastcall HasParent(void);
	TcxCustomStyles* __fastcall GetStyles(void);
	void __fastcall RemoveStyles(TcxCustomStyles* AStyles);
	void __fastcall SetStyles(const TcxCustomStyles* Value);
	DYNAMIC void __fastcall SetParentComponent(Classes::TComponent* AParent);
	__property bool BuiltIn = {read=FBuiltIn, nodefault};
	__property int Index = {read=GetIndex, nodefault};
	__property TcxStyleRepository* StyleRepository = {read=FStyleRepository, write=SetStyleRepository};
	
__published:
	__property AnsiString Caption = {read=GetCaption, write=SetCaption, stored=GetCaptionStored};
};


#pragma pack(push, 4)
struct TcxCustomStylesItem
{
	int Index;
	TcxCustomStyle* Item;
} ;
#pragma pack(pop)

#pragma option push -b-
enum TcxStyleValue { svBitmap, svColor, svFont, svTextColor };
#pragma option pop

typedef Set<TcxStyleValue, svBitmap, svTextColor>  TcxStyleValues;

class DELPHICLASS TcxStyle;
class PASCALIMPLEMENTATION TcxStyle : public TcxCustomStyle 
{
	typedef TcxCustomStyle inherited;
	
private:
	TcxStyleValues FAssignedValues;
	Graphics::TBitmap* FBitmap;
	Graphics::TColor FColor;
	Graphics::TFont* FFont;
	Graphics::TColor FTextColor;
	void __fastcall SetAssignedValues(TcxStyleValues Value);
	void __fastcall SetBitmap(Graphics::TBitmap* Value);
	void __fastcall SetColor(Graphics::TColor Value);
	void __fastcall SetFont(Graphics::TFont* Value);
	void __fastcall SetTextColor(Graphics::TColor Value);
	void __fastcall BitmapChanged(System::TObject* Sender);
	void __fastcall FontChanged(System::TObject* Sender);
	bool __fastcall IsBitmapStored(void);
	bool __fastcall IsColorStored(void);
	bool __fastcall IsFontStored(void);
	bool __fastcall IsTextColorStored(void);
	
public:
	__fastcall virtual TcxStyle(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxStyle(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual void __fastcall RestoreDefaults(void);
	
__published:
	__property TcxStyleValues AssignedValues = {read=FAssignedValues, write=SetAssignedValues, default=0};
	__property Graphics::TColor Color = {read=FColor, write=SetColor, stored=IsColorStored, nodefault};
	__property Graphics::TBitmap* Bitmap = {read=FBitmap, write=SetBitmap, stored=IsBitmapStored};
	__property Graphics::TFont* Font = {read=FFont, write=SetFont, stored=IsFontStored};
	__property Graphics::TColor TextColor = {read=FTextColor, write=SetTextColor, stored=IsTextColorStored, nodefault};
};


typedef AnsiString __fastcall (__closure *TcxStyleGetName)(TcxStyle* AStyle);

class DELPHICLASS TcxStyles;
class PASCALIMPLEMENTATION TcxStyles : public TcxCustomStyles 
{
	typedef TcxCustomStyles inherited;
	
private:
	int FMaxDefaultViewParamsIndex;
	
protected:
	bool BitmapInViewParams;
	void __fastcall DefaultFontChanged(System::TObject* Sender, Graphics::TFont* AFont);
	HIDESBASE TcxStyle* __fastcall GetValue(int Index);
	HIDESBASE void __fastcall SetValue(int Index, TcxStyle* Value);
	virtual void __fastcall GetDefaultViewParams(int Index, void * AData, /* out */ Cxgraphics::TcxViewParams &AParams);
	virtual bool __fastcall IsDefaultFont(int Index);
	__property int MaxDefaultViewParamsIndex = {read=FMaxDefaultViewParamsIndex, nodefault};
	
public:
	Graphics::TBitmap* __fastcall GetBitmap(int Index);
	void __fastcall GetViewParams(int Index, void * AData, TcxStyle* AStyle, /* out */ Cxgraphics::TcxViewParams &AParams);
	__property TcxStyle* Values[int Index] = {read=GetValue, write=SetValue};
public:
	#pragma option push -w-inl
	/* TcxCustomStyles.Create */ inline __fastcall virtual TcxStyles(Classes::TPersistent* AOwner) : TcxCustomStyles(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomStyles.Destroy */ inline __fastcall virtual ~TcxStyles(void) { }
	#pragma option pop
	
private:
	void *__IcxFontListener;	/* Cxgraphics::IcxFontListener [Changed=DefaultFontChanged] */
	
public:
	operator IcxFontListener*(void) { return (IcxFontListener*)&__IcxFontListener; }
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE bool __fastcall UseStyle(TcxStyle* AStyle, TcxStyleValue AStyleValue);
extern PACKAGE void __fastcall CreateStyleSheetStyles(TcxCustomStyleSheet* ADestStyleSheet, TcxCustomStyleSheet* ASourceStyleSheet, TcxStyleGetName AStyleGetName = 0x0);
extern PACKAGE void __fastcall RegisterStyleSheetClass(TMetaClass* AStyleSheetClass);
extern PACKAGE void __fastcall UnregisterStyleSheetClass(TMetaClass* AStyleSheetClass);
extern PACKAGE void __fastcall GetRegisteredStyleSheetClasses(Classes::TList* AList);
extern PACKAGE void __fastcall SaveStyleSheetsToIniFile(const AnsiString AIniFileName, const Classes::TList* AList);
extern PACKAGE void __fastcall LoadStyleSheetsFromIniFile(const AnsiString AIniFileName, TcxStyleRepository* AStyleRepository, TMetaClass* AStyleSheetClass, const Classes::TStrings* AStyleSheetNames = (Classes::TStrings*)(0x0), Classes::TComponent* AOwner = (Classes::TComponent*)(0x0), const Classes::TList* AStyleSheetList = (Classes::TList*)(0x0), TcxStyleGetName AStyleGetName = 0x0);

}	/* namespace Cxstyles */
using namespace Cxstyles;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxStyles
