// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxGridCustomPopupMenu.pas' rev: 6.00

#ifndef cxGridCustomPopupMenuHPP
#define cxGridCustomPopupMenuHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <ImgList.hpp>	// Pascal unit
#include <cxGridCustomView.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxgridcustompopupmenu
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS EcxGridPopupMenu;
class PASCALIMPLEMENTATION EcxGridPopupMenu : public Sysutils::Exception 
{
	typedef Sysutils::Exception inherited;
	
public:
	#pragma option push -w-inl
	/* Exception.Create */ inline __fastcall EcxGridPopupMenu(const AnsiString Msg) : Sysutils::Exception(Msg) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateFmt */ inline __fastcall EcxGridPopupMenu(const AnsiString Msg, const System::TVarRec * Args, const int Args_Size) : Sysutils::Exception(Msg, Args, Args_Size) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateRes */ inline __fastcall EcxGridPopupMenu(int Ident)/* overload */ : Sysutils::Exception(Ident) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResFmt */ inline __fastcall EcxGridPopupMenu(int Ident, const System::TVarRec * Args, const int Args_Size)/* overload */ : Sysutils::Exception(Ident, Args, Args_Size) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateHelp */ inline __fastcall EcxGridPopupMenu(const AnsiString Msg, int AHelpContext) : Sysutils::Exception(Msg, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateFmtHelp */ inline __fastcall EcxGridPopupMenu(const AnsiString Msg, const System::TVarRec * Args, const int Args_Size, int AHelpContext) : Sysutils::Exception(Msg, Args, Args_Size, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResHelp */ inline __fastcall EcxGridPopupMenu(int Ident, int AHelpContext)/* overload */ : Sysutils::Exception(Ident, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResFmtHelp */ inline __fastcall EcxGridPopupMenu(System::PResStringRec ResStringRec, const System::TVarRec * Args, const int Args_Size, int AHelpContext)/* overload */ : Sysutils::Exception(ResStringRec, Args, Args_Size, AHelpContext) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~EcxGridPopupMenu(void) { }
	#pragma option pop
	
};


#pragma option push -b-
enum TcxGridViewHitType { gvhtGridNone, gvhtGridTab, gvhtNone, gvhtTab, gvhtCell, gvhtExpandButton, gvhtRecord, gvhtNavigator, gvhtPreview, gvhtColumnHeader, gvhtColumnHeaderFilterButton, gvhtFilter, gvhtFooter, gvhtFooterCell, gvhtGroupFooter, gvhtGroupFooterCell, gvhtGroupByBox, gvhtIndicator, gvhtRowIndicator, gvhtRowLevelIndent, gvhtBand, gvhtBandHeader, gvhtRowCaption, gvhtSeparator };
#pragma option pop

typedef Set<TcxGridViewHitType, gvhtGridNone, gvhtSeparator>  TcxGridViewHitTypes;

typedef void __fastcall (__closure *TcxGridBeforePopupProc)(Classes::TComponent* ASenderMenu, Cxgridcustomview::TcxCustomGridHitTest* AHitTest, int X, int Y, bool &AllowPopup);

typedef void __fastcall (__closure *TcxGridOnPopupProc)(Classes::TComponent* ASenderMenu, Cxgridcustomview::TcxCustomGridHitTest* AHitTest, int X, int Y);

typedef void __fastcall (__closure *TcxGridPopupMenuItemClickProc)(System::TObject* ASender, Cxgridcustomview::TcxCustomGridHitTest* AHitTest, Classes::TNotifyEvent &AHandler, Classes::TList* AParams, bool &AHandled);

typedef TMetaClass*TcxPopupMenuClass;

#pragma pack(push, 4)
struct TcxPopupMenuClassInfoRec
{
	TMetaClass*FMenuClass;
	TcxGridViewHitTypes FHitTypes;
	TMetaClass*FViewClass;
} ;
#pragma pack(pop)

typedef TcxPopupMenuClassInfoRec *PcxPopupMenuClassInfoRec;

typedef Messages::TWMKey *PWMKeyDown;

__interface IDoPopup;
typedef System::DelphiInterface<IDoPopup> _di_IDoPopup;
__interface INTERFACE_UUID("{41999EDE-B9D9-4808-9D01-61B09DF700FA}") IDoPopup  : public IInterface 
{
	
public:
	virtual TcxGridOnPopupProc __fastcall GetPopupHandler(void) = 0 ;
};

class DELPHICLASS TcxPopupMenuInfo;
class PASCALIMPLEMENTATION TcxPopupMenuInfo : public Classes::TCollectionItem 
{
	typedef Classes::TCollectionItem inherited;
	
private:
	Classes::TComponent* FPopupMenu;
	TcxGridOnPopupProc FPopupProc;
	TcxGridViewHitTypes FHitTypes;
	bool FLocked;
	Cxgridcustomview::TcxCustomGridView* FView;
	TMetaClass*FViewClass;
	void __fastcall SetPopupMenu(const Classes::TComponent* AValue);
	void __fastcall SetView(const Cxgridcustomview::TcxCustomGridView* AValue);
	void __fastcall SetViewClass(const TMetaClass* Value);
	
protected:
	virtual void __fastcall BeginUpdate(void);
	virtual void __fastcall EndUpdate(void);
	virtual void __fastcall DoChanged(const Classes::TComponent* APopupMenu, const Cxgridcustomview::TcxCustomGridView* AView, TMetaClass* AViewClass);
	__property TMetaClass* GridViewClass = {read=FViewClass, write=SetViewClass};
	
public:
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	
__published:
	__property Cxgridcustomview::TcxCustomGridView* GridView = {read=FView, write=SetView};
	__property TcxGridViewHitTypes HitTypes = {read=FHitTypes, write=FHitTypes, nodefault};
	__property Index ;
	__property TcxGridOnPopupProc OnPopup = {read=FPopupProc, write=FPopupProc};
	__property Classes::TComponent* PopupMenu = {read=FPopupMenu, write=SetPopupMenu};
public:
	#pragma option push -w-inl
	/* TCollectionItem.Create */ inline __fastcall virtual TcxPopupMenuInfo(Classes::TCollection* Collection) : Classes::TCollectionItem(Collection) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCollectionItem.Destroy */ inline __fastcall virtual ~TcxPopupMenuInfo(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxPopupMenuInfos;
class PASCALIMPLEMENTATION TcxPopupMenuInfos : public Classes::TCollection 
{
	typedef Classes::TCollection inherited;
	
public:
	TcxPopupMenuInfo* operator[](int AIndex) { return Items[AIndex]; }
	
private:
	Classes::TComponent* FOwner;
	HIDESBASE TcxPopupMenuInfo* __fastcall GetItem(int AIndex);
	HIDESBASE void __fastcall SetItem(int AIndex, const TcxPopupMenuInfo* AValue);
	
protected:
	DYNAMIC Classes::TPersistent* __fastcall GetOwner(void);
	virtual void __fastcall Notify(Classes::TCollectionItem* Item, Classes::TCollectionNotification Action);
	
public:
	__fastcall virtual TcxPopupMenuInfos(Classes::TComponent* AOwner);
	int __fastcall GetSameMenuCount(const Classes::TComponent* AMenu);
	__property TcxPopupMenuInfo* Items[int AIndex] = {read=GetItem, write=SetItem/*, default*/};
public:
	#pragma option push -w-inl
	/* TCollection.Destroy */ inline __fastcall virtual ~TcxPopupMenuInfos(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomGridPopupMenu;
class PASCALIMPLEMENTATION TcxCustomGridPopupMenu : public Classes::TComponent 
{
	typedef Classes::TComponent inherited;
	
public:
	TcxPopupMenuInfo* operator[](int AIndex) { return MenuInfos[AIndex]; }
	
private:
	TcxPopupMenuInfos* FPopupMenuInfos;
	TcxPopupMenuInfo* __fastcall GetMenuInfo(int AIndex);
	int __fastcall GetMenuInfoCount(void);
	void __fastcall SetPopupMenuInfos(const TcxPopupMenuInfos* AValue);
	
protected:
	void __fastcall AddMenuInfo(const Classes::TComponent* AMenu, TcxGridViewHitTypes AHitTypes, TcxGridOnPopupProc ADoPopupProc, TMetaClass* AViewClass = 0x0, const Cxgridcustomview::TcxCustomGridView* AView = (Cxgridcustomview::TcxCustomGridView*)(0x0));
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	virtual TcxPopupMenuInfo* __fastcall GetPopupMenuInfo(const Classes::TComponent* AMenu, const Cxgridcustomview::TcxCustomGridView* AView, bool ASearchDefault = true);
	__property TcxPopupMenuInfos* PopupMenuInfos = {read=FPopupMenuInfos, write=SetPopupMenuInfos};
	__property TcxPopupMenuInfo* MenuInfos[int AIndex] = {read=GetMenuInfo/*, default*/};
	
public:
	__fastcall virtual TcxCustomGridPopupMenu(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxCustomGridPopupMenu(void);
	virtual bool __fastcall CheckShortCuts(PWMKeyDown Message);
	__property int Count = {read=GetMenuInfoCount, nodefault};
};


class DELPHICLASS TcxGridDefaultPopupMenu;
class PASCALIMPLEMENTATION TcxGridDefaultPopupMenu : public TcxCustomGridPopupMenu 
{
	typedef TcxCustomGridPopupMenu inherited;
	
public:
	virtual TcxPopupMenuInfo* __fastcall GetPopupMenuInfo(const Classes::TComponent* AMenu, const Cxgridcustomview::TcxCustomGridView* AView, bool ASearchDefault = true)/* overload */;
	HIDESBASE TcxPopupMenuInfo* __fastcall GetPopupMenuInfo(const Classes::TComponent* AMenu, TMetaClass* AViewClass, bool ASearchDefault = true)/* overload */;
	virtual void __fastcall RegisterPopupMenu(const Classes::TComponent* AMenu, TcxGridViewHitTypes AHitTypes, TcxGridOnPopupProc ADoPopupProc, TMetaClass* AViewClass);
	virtual void __fastcall UnRegisterPopupMenu(const Classes::TComponent* AMenu, TMetaClass* AViewClass, TcxGridViewHitTypes AHitTypes = System::Set<TcxGridViewHitType, gvhtGridNone, gvhtSeparator> () );
	__property MenuInfos ;
public:
	#pragma option push -w-inl
	/* TcxCustomGridPopupMenu.Create */ inline __fastcall virtual TcxGridDefaultPopupMenu(Classes::TComponent* AOwner) : TcxCustomGridPopupMenu(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomGridPopupMenu.Destroy */ inline __fastcall virtual ~TcxGridDefaultPopupMenu(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
static const Word cxhtGridBase = 0x3e8;
extern PACKAGE Classes::TList* FBuiltInPopupMenuList;
extern PACKAGE Controls::TImageList* cxGridPopupMenuImages;
extern PACKAGE TcxGridViewHitType __fastcall GetHitTypeByHitCode(int AHitCode);
extern PACKAGE void __fastcall RegisterPopupMenuClass(TMetaClass* APopupMenuClass, TcxGridViewHitTypes AHitTypes, TMetaClass* AViewClass);

}	/* namespace Cxgridcustompopupmenu */
using namespace Cxgridcustompopupmenu;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxGridCustomPopupMenu
