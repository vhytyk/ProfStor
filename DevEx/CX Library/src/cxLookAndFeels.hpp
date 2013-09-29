// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxLookAndFeels.pas' rev: 6.00

#ifndef cxLookAndFeelsHPP
#define cxLookAndFeelsHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxLookAndFeelPainters.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <dxThemeManager.hpp>	// Pascal unit
#include <dxThemeConsts.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxlookandfeels
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TcxLookAndFeelKind { lfFlat, lfStandard, lfUltraFlat };
#pragma option pop

#pragma option push -b-
enum TcxLookAndFeelValue { lfvKind, lfvNativeStyle };
#pragma option pop

typedef Set<TcxLookAndFeelValue, lfvKind, lfvNativeStyle>  TcxLookAndFeelValues;

__interface IcxLookAndFeelNotificationListener;
typedef System::DelphiInterface<IcxLookAndFeelNotificationListener> _di_IcxLookAndFeelNotificationListener;
class DELPHICLASS TcxLookAndFeel;
__interface INTERFACE_UUID("{205538BF-F19E-4285-B11F-B182D9635881}") IcxLookAndFeelNotificationListener  : public IInterface 
{
	
public:
	virtual System::TObject* __fastcall GetObject(void) = 0 ;
	virtual void __fastcall MasterLookAndFeelChanged(TcxLookAndFeel* Sender, TcxLookAndFeelValues AChangedValues) = 0 ;
	virtual void __fastcall MasterLookAndFeelDestroying(TcxLookAndFeel* Sender) = 0 ;
};

typedef void __fastcall (__closure *TcxLookAndFeelChangedEvent)(TcxLookAndFeel* Sender, TcxLookAndFeelValues AChangedValues);

#pragma pack(push, 1)
struct TcxLookAndFeelData
{
	TcxLookAndFeelKind Kind;
	bool NativeStyle;
} ;
#pragma pack(pop)

class PASCALIMPLEMENTATION TcxLookAndFeel : public Cxclasses::TcxInterfacedPersistent 
{
	typedef Cxclasses::TcxInterfacedPersistent inherited;
	
private:
	TcxLookAndFeelValues FAssignedValues;
	Classes::TList* FChangeListenerList;
	#pragma pack(push, 1)
	TcxLookAndFeelData FCurrentState;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	TcxLookAndFeelData FData;
	#pragma pack(pop)
	
	bool FIsDestruction;
	bool FIsRootLookAndFeel;
	TcxLookAndFeel* FMasterLookAndFeel;
	#pragma pack(push, 1)
	TcxLookAndFeelData FPrevState;
	#pragma pack(pop)
	
	TcxLookAndFeelChangedEvent FOnChanged;
	Cxlookandfeelpainters::TcxLookAndFeelStyle __fastcall GetActiveStyle(void);
	TcxLookAndFeelKind __fastcall GetKind(void);
	TcxLookAndFeel* __fastcall GetMasterLookAndFeel(void);
	bool __fastcall GetNativeStyle(void);
	TMetaClass* __fastcall GetPainter(void);
	void __fastcall SetAssignedValues(TcxLookAndFeelValues Value);
	void __fastcall SetKind(TcxLookAndFeelKind Value);
	void __fastcall SetMasterLookAndFeel(TcxLookAndFeel* Value);
	void __fastcall SetNativeStyle(bool Value);
	void __fastcall Changed(TcxLookAndFeelValues AChangedValues);
	void __fastcall CheckStateChanges(void);
	TcxLookAndFeelKind __fastcall GetDefaultKind(void);
	bool __fastcall GetDefaultNativeStyle(void);
	bool __fastcall IsKindStored(void);
	bool __fastcall IsNativeStyleStored(void);
	void __fastcall SaveState(void);
	System::TObject* __fastcall GetObject(void);
	void __fastcall MasterLookAndFeelDestroying(TcxLookAndFeel* Sender);
	
protected:
	virtual TcxLookAndFeelKind __fastcall InternalGetKind(void);
	virtual bool __fastcall InternalGetNativeStyle(void);
	void __fastcall MasterLookAndFeelChanged(TcxLookAndFeel* Sender, TcxLookAndFeelValues AChangedValues);
	
public:
	__fastcall virtual TcxLookAndFeel(Classes::TPersistent* AOwner);
	__fastcall virtual ~TcxLookAndFeel(void);
	virtual void __fastcall AfterConstruction(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	void __fastcall AddChangeListener(_di_IcxLookAndFeelNotificationListener AListener);
	TMetaClass* __fastcall GetAvailablePainter(Dxthememanager::TdxThemedObjectTypes ANeededThemedObjectTypes = System::Set<Dxthememanager::TdxThemedObjectType, totButton, totWindow> () );
	void __fastcall RemoveChangeListener(_di_IcxLookAndFeelNotificationListener AListener);
	void __fastcall Reset(void);
	__property Cxlookandfeelpainters::TcxLookAndFeelStyle ActiveStyle = {read=GetActiveStyle, nodefault};
	__property TcxLookAndFeel* MasterLookAndFeel = {read=GetMasterLookAndFeel, write=SetMasterLookAndFeel};
	__property TMetaClass* Painter = {read=GetPainter};
	__property TcxLookAndFeelChangedEvent OnChanged = {read=FOnChanged, write=FOnChanged};
	
__published:
	__property TcxLookAndFeelValues AssignedValues = {read=FAssignedValues, write=SetAssignedValues, stored=false, nodefault};
	__property TcxLookAndFeelKind Kind = {read=GetKind, write=SetKind, stored=IsKindStored, nodefault};
	__property bool NativeStyle = {read=GetNativeStyle, write=SetNativeStyle, stored=IsNativeStyleStored, nodefault};
private:
	void *__IcxLookAndFeelNotificationListener;	/* Cxlookandfeels::IcxLookAndFeelNotificationListener */
	
public:
	operator IcxLookAndFeelNotificationListener*(void) { return (IcxLookAndFeelNotificationListener*)&__IcxLookAndFeelNotificationListener; }
	
};


class DELPHICLASS TcxLookAndFeelController;
class PASCALIMPLEMENTATION TcxLookAndFeelController : public Classes::TComponent 
{
	typedef Classes::TComponent inherited;
	
private:
	TcxLookAndFeelKind __fastcall GetKind(void);
	bool __fastcall GetNativeStyle(void);
	void __fastcall SetKind(TcxLookAndFeelKind Value);
	void __fastcall SetNativeStyle(bool Value);
	void __fastcall Modified(void);
	System::TObject* __fastcall GetObject(void);
	void __fastcall MasterLookAndFeelChanged(TcxLookAndFeel* Sender, TcxLookAndFeelValues AChangedValues);
	void __fastcall MasterLookAndFeelDestroying(TcxLookAndFeel* Sender);
	
public:
	__fastcall virtual TcxLookAndFeelController(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxLookAndFeelController(void);
	
__published:
	__property TcxLookAndFeelKind Kind = {read=GetKind, write=SetKind, default=2};
	__property bool NativeStyle = {read=GetNativeStyle, write=SetNativeStyle, default=0};
private:
	void *__IcxLookAndFeelNotificationListener;	/* Cxlookandfeels::IcxLookAndFeelNotificationListener */
	
public:
	operator IcxLookAndFeelNotificationListener*(void) { return (IcxLookAndFeelNotificationListener*)&__IcxLookAndFeelNotificationListener; }
	
};


//-- var, const, procedure ---------------------------------------------------
#define cxDefaultLookAndFeelKind (TcxLookAndFeelKind)(2)
static const bool cxDefaultLookAndFeelNativeStyle = false;
extern PACKAGE TcxLookAndFeel* __fastcall RootLookAndFeel(void);

}	/* namespace Cxlookandfeels */
using namespace Cxlookandfeels;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxLookAndFeels
