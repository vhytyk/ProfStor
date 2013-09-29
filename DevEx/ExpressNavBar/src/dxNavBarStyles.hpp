// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'dxNavBarStyles.pas' rev: 6.00

#ifndef dxNavBarStylesHPP
#define dxNavBarStylesHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <dxNavBarBase.hpp>	// Pascal unit
#include <jpeg.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Dxnavbarstyles
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TdxBarStyleHAlignment { haLeft, haCenter, haRight };
#pragma option pop

#pragma option push -b-
enum TdxBarStyleVAlignment { vaTop, vaCenter, vaBottom };
#pragma option pop

#pragma option push -b-
enum TdxBarStyleAssignedValue { savAlphaBlending, savAlphaBlending2, savBackColor, savBackColor2, savFont, savGradientMode, savHAlignment, savVAlignment, savImage };
#pragma option pop

typedef Set<TdxBarStyleAssignedValue, savAlphaBlending, savImage>  TdxBarStyleAssignedValues;

#pragma option push -b-
enum TdxBarStyleGradientMode { gmHorizontal, gmVertical, gmForwardDiagonal, gmBackwardDiagonal };
#pragma option pop

typedef void __fastcall (__closure *TdxBaseNavBarStyleChangeEvent)(System::TObject* Sender, Dxnavbarbase::TdxNavBarChangeType AType);

class DELPHICLASS TdxBaseNavBarStyle;
class PASCALIMPLEMENTATION TdxBaseNavBarStyle : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	Classes::TPersistent* FOwner;
	Byte FAlphaBlending;
	Byte FAlphaBlending2;
	TdxBarStyleAssignedValues FAssignedValues;
	Graphics::TColor FBackColor;
	Graphics::TColor FBackColor2;
	TdxBarStyleGradientMode FGradientMode;
	Graphics::TFont* FFont;
	Graphics::TPicture* FImage;
	TdxBarStyleHAlignment FHAlignment;
	TdxBarStyleVAlignment FVAlignment;
	TdxBaseNavBarStyleChangeEvent FOnChange;
	void __fastcall SetAlphaBlending(const Byte Value);
	void __fastcall SetAlphaBlending2(const Byte Value);
	void __fastcall SetAssignedValues(const TdxBarStyleAssignedValues Value);
	void __fastcall SetBackColor(const Graphics::TColor Value);
	void __fastcall SetBackColor2(const Graphics::TColor Value);
	void __fastcall SetFont(const Graphics::TFont* Value);
	void __fastcall SetGradientMode(const TdxBarStyleGradientMode Value);
	void __fastcall SetHAlignment(const TdxBarStyleHAlignment Value);
	void __fastcall SetImage(const Graphics::TPicture* Value);
	void __fastcall SetVAlignment(const TdxBarStyleVAlignment Value);
	
protected:
	DYNAMIC Classes::TPersistent* __fastcall GetOwner(void);
	virtual bool __fastcall CanAssignValue(void);
	virtual void __fastcall Changed(Dxnavbarbase::TdxNavBarChangeType AType);
	void __fastcall FontChanged(System::TObject* Sender);
	void __fastcall ImageChanged(System::TObject* Sender);
	
public:
	__fastcall TdxBaseNavBarStyle(Classes::TPersistent* AOwner);
	__fastcall virtual ~TdxBaseNavBarStyle(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	__property TdxBarStyleAssignedValues AssignedValues = {read=FAssignedValues, write=SetAssignedValues, default=0};
	
__published:
	__property Byte AlphaBlending = {read=FAlphaBlending, write=SetAlphaBlending, default=255};
	__property Byte AlphaBlending2 = {read=FAlphaBlending2, write=SetAlphaBlending2, default=255};
	__property Graphics::TColor BackColor = {read=FBackColor, write=SetBackColor, nodefault};
	__property Graphics::TColor BackColor2 = {read=FBackColor2, write=SetBackColor2, nodefault};
	__property TdxBarStyleGradientMode GradientMode = {read=FGradientMode, write=SetGradientMode, default=0};
	__property Graphics::TFont* Font = {read=FFont, write=SetFont};
	__property Graphics::TPicture* Image = {read=FImage, write=SetImage};
	__property TdxBarStyleHAlignment HAlignment = {read=FHAlignment, write=SetHAlignment, default=1};
	__property TdxBarStyleVAlignment VAlignment = {read=FVAlignment, write=SetVAlignment, default=1};
	__property TdxBaseNavBarStyleChangeEvent OnChange = {read=FOnChange, write=FOnChange};
};


typedef void __fastcall (__closure *TdxNavBarDefaultStyleAssignProc)(void);

class DELPHICLASS TdxNavBarDefaultStyle;
class DELPHICLASS TdxNavBarDefaultStyles;
class PASCALIMPLEMENTATION TdxNavBarDefaultStyle : public TdxBaseNavBarStyle 
{
	typedef TdxBaseNavBarStyle inherited;
	
private:
	bool FDefaultValues;
	TdxNavBarDefaultStyleAssignProc FDefaultValuesProc;
	TdxNavBarDefaultStyles* __fastcall GetCollection(void);
	
protected:
	virtual void __fastcall Changed(Dxnavbarbase::TdxNavBarChangeType AType);
	void __fastcall AssignDefaultValues(bool CheckDefault);
	__property TdxNavBarDefaultStyleAssignProc DefaultValuesProc = {read=FDefaultValuesProc, write=FDefaultValuesProc};
	
public:
	__fastcall TdxNavBarDefaultStyle(Classes::TPersistent* AOwner);
	__property TdxNavBarDefaultStyles* Collection = {read=GetCollection};
	__property bool DefaultValues = {read=FDefaultValues, write=FDefaultValues, nodefault};
public:
	#pragma option push -w-inl
	/* TdxBaseNavBarStyle.Destroy */ inline __fastcall virtual ~TdxNavBarDefaultStyle(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TdxNavBarDefaultStyles : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	Classes::TList* FDefaultStyles;
	Classes::TPersistent* FOwner;
	int FUpdateCount;
	Dxnavbarbase::TdxNavBarChangeEvent FOnChange;
	bool __fastcall IsDefaultStyleStored(int Index);
	TdxNavBarDefaultStyle* __fastcall GetDefaultStyle(int Index);
	void __fastcall SetDefaultStyle(int Index, const TdxNavBarDefaultStyle* Value);
	
protected:
	void __fastcall AssignDefaultBackgroundStyle(void);
	void __fastcall AssignDefaultButtonStyle(void);
	void __fastcall AssignDefaultButtonPressedStyle(void);
	void __fastcall AssignDefaultButtonHotTrackedStyle(void);
	void __fastcall AssignDefaultGroupBackgroundStyle(void);
	void __fastcall AssignDefaultGroupHeaderStyle(void);
	void __fastcall AssignDefaultGroupHeaderActiveStyle(void);
	void __fastcall AssignDefaultGroupHeaderHotTrackedStyle(void);
	void __fastcall AssignDefaultGroupHeaderPressedStyle(void);
	void __fastcall AssignDefaultHintStyle(void);
	void __fastcall AssignDefaultItemStyle(void);
	void __fastcall AssignDefaultItemDisabledStyle(void);
	void __fastcall AssignDefaultItemHotTrackedStyle(void);
	void __fastcall AssignDefaultItemPressedStyle(void);
	void __fastcall AssignDefaultDropTargetGroupStyle(void);
	void __fastcall AssignDefaultDropTargetLinkStyle(void);
	virtual void __fastcall CreateDefaultStyleList(void);
	virtual void __fastcall DestroyDefaultStyleList(void);
	DYNAMIC Classes::TPersistent* __fastcall GetOwner(void);
	void __fastcall OnStyleChange(System::TObject* Sender, Dxnavbarbase::TdxNavBarChangeType AType);
	
public:
	__fastcall virtual TdxNavBarDefaultStyles(Classes::TPersistent* AOwner);
	__fastcall virtual ~TdxNavBarDefaultStyles(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	void __fastcall AssignDefaultValues(bool CheckDefault);
	void __fastcall BeginUpdate(void);
	void __fastcall EndUpdate(void);
	
__published:
	__property TdxNavBarDefaultStyle* Background = {read=GetDefaultStyle, write=SetDefaultStyle, stored=IsDefaultStyleStored, index=0};
	__property TdxNavBarDefaultStyle* Button = {read=GetDefaultStyle, write=SetDefaultStyle, stored=IsDefaultStyleStored, index=1};
	__property TdxNavBarDefaultStyle* ButtonPressed = {read=GetDefaultStyle, write=SetDefaultStyle, stored=IsDefaultStyleStored, index=2};
	__property TdxNavBarDefaultStyle* ButtonHotTracked = {read=GetDefaultStyle, write=SetDefaultStyle, stored=IsDefaultStyleStored, index=3};
	__property TdxNavBarDefaultStyle* GroupBackground = {read=GetDefaultStyle, write=SetDefaultStyle, stored=IsDefaultStyleStored, index=4};
	__property TdxNavBarDefaultStyle* GroupHeader = {read=GetDefaultStyle, write=SetDefaultStyle, stored=IsDefaultStyleStored, index=5};
	__property TdxNavBarDefaultStyle* GroupHeaderActive = {read=GetDefaultStyle, write=SetDefaultStyle, stored=IsDefaultStyleStored, index=6};
	__property TdxNavBarDefaultStyle* GroupHeaderHotTracked = {read=GetDefaultStyle, write=SetDefaultStyle, stored=IsDefaultStyleStored, index=7};
	__property TdxNavBarDefaultStyle* GroupHeaderPressed = {read=GetDefaultStyle, write=SetDefaultStyle, stored=IsDefaultStyleStored, index=8};
	__property TdxNavBarDefaultStyle* Hint = {read=GetDefaultStyle, write=SetDefaultStyle, stored=IsDefaultStyleStored, index=9};
	__property TdxNavBarDefaultStyle* Item = {read=GetDefaultStyle, write=SetDefaultStyle, stored=IsDefaultStyleStored, index=10};
	__property TdxNavBarDefaultStyle* ItemDisabled = {read=GetDefaultStyle, write=SetDefaultStyle, stored=IsDefaultStyleStored, index=11};
	__property TdxNavBarDefaultStyle* ItemHotTracked = {read=GetDefaultStyle, write=SetDefaultStyle, stored=IsDefaultStyleStored, index=12};
	__property TdxNavBarDefaultStyle* ItemPressed = {read=GetDefaultStyle, write=SetDefaultStyle, stored=IsDefaultStyleStored, index=13};
	__property TdxNavBarDefaultStyle* DropTargetGroup = {read=GetDefaultStyle, write=SetDefaultStyle, stored=IsDefaultStyleStored, index=14};
	__property TdxNavBarDefaultStyle* DropTargetLink = {read=GetDefaultStyle, write=SetDefaultStyle, stored=IsDefaultStyleStored, index=15};
	__property Dxnavbarbase::TdxNavBarChangeEvent OnChange = {read=FOnChange, write=FOnChange};
};


class DELPHICLASS TdxNavBarStyle;
class PASCALIMPLEMENTATION TdxNavBarStyle : public TdxBaseNavBarStyle 
{
	typedef TdxBaseNavBarStyle inherited;
	
__published:
	__property AssignedValues  = {default=0};
public:
	#pragma option push -w-inl
	/* TdxBaseNavBarStyle.Create */ inline __fastcall TdxNavBarStyle(Classes::TPersistent* AOwner) : TdxBaseNavBarStyle(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TdxBaseNavBarStyle.Destroy */ inline __fastcall virtual ~TdxNavBarStyle(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxNavBarStyleItem;
class PASCALIMPLEMENTATION TdxNavBarStyleItem : public Dxnavbarbase::TdxNavBarComponentCollectionItem 
{
	typedef Dxnavbarbase::TdxNavBarComponentCollectionItem inherited;
	
private:
	TdxNavBarStyle* FStyle;
	void __fastcall SetStyle(const TdxNavBarStyle* Value);
	
protected:
	virtual void __fastcall ReadState(Classes::TReader* Reader);
	virtual void __fastcall SetName(const AnsiString NewName);
	DYNAMIC void __fastcall SetParentComponent(Classes::TComponent* AParent);
	void __fastcall OnStyleChange(System::TObject* Sender, Dxnavbarbase::TdxNavBarChangeType AType);
	
public:
	__fastcall virtual TdxNavBarStyleItem(Classes::TComponent* AOwner);
	__fastcall virtual ~TdxNavBarStyleItem(void);
	
__published:
	__property TdxNavBarStyle* Style = {read=FStyle, write=SetStyle};
};


class DELPHICLASS TdxNavBarStyles;
class PASCALIMPLEMENTATION TdxNavBarStyles : public Dxnavbarbase::TdxNavBarComponentCollection 
{
	typedef Dxnavbarbase::TdxNavBarComponentCollection inherited;
	
public:
	TdxNavBarStyleItem* operator[](int Index) { return Items[Index]; }
	
protected:
	HIDESBASE TdxNavBarStyleItem* __fastcall GetItem(int Index);
	HIDESBASE void __fastcall SetItem(int Index, TdxNavBarStyleItem* Value);
	
public:
	HIDESBASE TdxNavBarStyleItem* __fastcall Add(void);
	__property TdxNavBarStyleItem* Items[int Index] = {read=GetItem, write=SetItem/*, default*/};
public:
	#pragma option push -w-inl
	/* TdxNavBarComponentCollection.Create */ inline __fastcall TdxNavBarStyles(Classes::TComponent* AOwner, TMetaClass* AItemClass) : Dxnavbarbase::TdxNavBarComponentCollection(AOwner, AItemClass) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TdxNavBarComponentCollection.Destroy */ inline __fastcall virtual ~TdxNavBarStyles(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Dxnavbarstyles */
using namespace Dxnavbarstyles;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// dxNavBarStyles
