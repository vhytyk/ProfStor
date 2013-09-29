// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'dxStatusBar.pas' rev: 6.00

#ifndef dxStatusBarHPP
#define dxStatusBarHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Menus.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <cxLookAndFeels.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <dxThemeManager.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <ImgList.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Dxstatusbar
{
//-- type declarations -------------------------------------------------------
typedef TMetaClass*TdxStatusBarPainterClass;

typedef TMetaClass*TdxStatusBarPanelClass;

class DELPHICLASS TdxStatusBarPanelStyle;
class DELPHICLASS TdxStatusBarPanel;
#pragma option push -b-
enum TdxStatusBarPanelBevel { dxpbNone, dxpbLowered, dxpbRaised };
#pragma option pop

typedef TMetaClass*TdxStatusBarPanelStyleClass;

typedef void __fastcall (__closure *TdxStatusBarDrawPanelEvent)(TdxStatusBarPanel* Sender, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ARect, bool &ADone);

class DELPHICLASS TdxCustomStatusBar;
class PASCALIMPLEMENTATION TdxStatusBarPanel : public Classes::TCollectionItem 
{
	typedef Classes::TCollectionItem inherited;
	
private:
	TdxStatusBarPanelBevel FBevel;
	Classes::TBiDiMode FBiDiMode;
	bool FFixed;
	bool FIsMinWidthAssigned;
	bool FIsWidthAssigned;
	int FMinWidth;
	TdxStatusBarPanelStyle* FPanelStyle;
	TMetaClass*FPanelStyleClass;
	Classes::TNotifyEvent FPanelStyleEvents;
	bool FParentBiDiMode;
	AnsiString FText;
	bool FVisible;
	int FWidth;
	TdxStatusBarDrawPanelEvent FOnDrawPanel;
	bool __fastcall GetFixed(void);
	Cxlookandfeels::TcxLookAndFeel* __fastcall GetLookAndFeel(void);
	int __fastcall GetMinWidth(void);
	AnsiString __fastcall GetPanelStyleClassName();
	TdxCustomStatusBar* __fastcall GetStatusBarControl(void);
	int __fastcall GetWidth(void);
	bool __fastcall IsBiDiModeStored(void);
	bool __fastcall IsMinWidthStored(void);
	bool __fastcall IsWidthStored(void);
	void __fastcall SetBevel(TdxStatusBarPanelBevel Value);
	void __fastcall SetBiDiMode(Classes::TBiDiMode Value);
	void __fastcall SetFixed(bool Value);
	void __fastcall SetMinWidth(int Value);
	void __fastcall SetPanelStyle(TdxStatusBarPanelStyle* Value);
	void __fastcall SetPanelStyleClass(const TMetaClass* Value);
	void __fastcall SetPanelStyleClassName(AnsiString Value);
	void __fastcall SetParentBiDiMode(bool Value);
	void __fastcall SetText(const AnsiString Value);
	void __fastcall SetVisible(bool Value);
	void __fastcall SetWidth(int Value);
	
protected:
	virtual void __fastcall CreatePanelStyle(void);
	virtual int __fastcall DefaultMinWidth(void);
	virtual int __fastcall DefaultWidth(void);
	virtual void __fastcall DestroyPanelStyle(void);
	virtual AnsiString __fastcall GetDisplayName();
	virtual int __fastcall PaintMinWidth(void);
	virtual int __fastcall PaintWidth(void);
	virtual void __fastcall PreparePaintWidth(int &AWidth);
	virtual void __fastcall StatusBarPanelStyleChanged(void);
	__property Cxlookandfeels::TcxLookAndFeel* LookAndFeel = {read=GetLookAndFeel};
	
public:
	__fastcall virtual TdxStatusBarPanel(Classes::TCollection* Collection);
	__fastcall virtual ~TdxStatusBarPanel(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual void __fastcall RestoreDefaults(void);
	void __fastcall ParentBiDiModeChanged(void);
	bool __fastcall UseRightToLeftAlignment(void);
	bool __fastcall UseRightToLeftReading(void);
	__property TMetaClass* PanelStyleClass = {read=FPanelStyleClass, write=SetPanelStyleClass};
	__property TdxCustomStatusBar* StatusBarControl = {read=GetStatusBarControl};
	
__published:
	__property AnsiString PanelStyleClassName = {read=GetPanelStyleClassName, write=SetPanelStyleClassName};
	__property TdxStatusBarPanelStyle* PanelStyle = {read=FPanelStyle, write=SetPanelStyle};
	__property Classes::TNotifyEvent PanelStyleEvents = {read=FPanelStyleEvents, write=FPanelStyleEvents};
	__property TdxStatusBarPanelBevel Bevel = {read=FBevel, write=SetBevel, default=1};
	__property Classes::TBiDiMode BiDiMode = {read=FBiDiMode, write=SetBiDiMode, stored=IsBiDiModeStored, nodefault};
	__property bool Fixed = {read=GetFixed, write=SetFixed, default=1};
	__property int MinWidth = {read=GetMinWidth, write=SetMinWidth, stored=IsMinWidthStored, nodefault};
	__property bool ParentBiDiMode = {read=FParentBiDiMode, write=SetParentBiDiMode, default=1};
	__property AnsiString Text = {read=FText, write=SetText};
	__property bool Visible = {read=FVisible, write=SetVisible, default=1};
	__property int Width = {read=GetWidth, write=SetWidth, stored=IsWidthStored, nodefault};
	__property TdxStatusBarDrawPanelEvent OnDrawPanel = {read=FOnDrawPanel, write=FOnDrawPanel};
};


class PASCALIMPLEMENTATION TdxStatusBarPanelStyle : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	Classes::TAlignment FAlignment;
	Graphics::TColor FColor;
	Graphics::TFont* FFont;
	bool FIsColorAssigned;
	TdxStatusBarPanel* FOwner;
	bool FParentFont;
	void __fastcall FontChanged(System::TObject* Sender);
	Graphics::TColor __fastcall GetColor(void);
	TdxCustomStatusBar* __fastcall GetStatusBarControl(void);
	bool __fastcall IsColorStored(void);
	bool __fastcall IsFontStored(void);
	void __fastcall SetAlignment(Classes::TAlignment Value);
	void __fastcall SetColor(Graphics::TColor Value);
	void __fastcall SetFont(Graphics::TFont* Value);
	void __fastcall SetParentFont(bool Value);
	
protected:
	virtual bool __fastcall CanDelete(void);
	virtual bool __fastcall CanSizing(void);
	virtual void __fastcall Changed(void);
	virtual void __fastcall CheckSizeGripRect(Types::TRect &R);
	virtual Graphics::TColor __fastcall DefaultColor(void);
	virtual void __fastcall DrawContent(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, TMetaClass* APainter);
	virtual int __fastcall GetMinWidth(void);
	virtual bool __fastcall InternalBevel(void);
	virtual void __fastcall PanelVisibleChanged(void);
	virtual void __fastcall ParentFontChanged(void);
	
public:
	__fastcall virtual TdxStatusBarPanelStyle(TdxStatusBarPanel* AOwner);
	__fastcall virtual ~TdxStatusBarPanelStyle(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	void __fastcall BeginUpdate(void);
	void __fastcall EndUpdate(void);
	virtual void __fastcall RestoreDefaults(void);
	__property Classes::TAlignment Alignment = {read=FAlignment, write=SetAlignment, default=0};
	__property Graphics::TColor Color = {read=GetColor, write=SetColor, stored=IsColorStored, nodefault};
	__property Graphics::TFont* Font = {read=FFont, write=SetFont, stored=IsFontStored};
	__property TdxStatusBarPanel* Owner = {read=FOwner};
	__property bool ParentFont = {read=FParentFont, write=SetParentFont, default=1};
	__property TdxCustomStatusBar* StatusBarControl = {read=GetStatusBarControl};
};


#pragma option push -b-
enum TdxStatusBarEllipsisType { dxetNone, dxetTruncate, dxetSmartPath };
#pragma option pop

typedef Set<TdxStatusBarEllipsisType, dxetNone, dxetSmartPath>  TdxStatusBarEllipsisTypes;

typedef void __fastcall (__closure *TdxStatusBarTextEvent)(System::TObject* Sender, const Types::TRect &R, AnsiString &AText);

class DELPHICLASS TdxStatusBarTextPanelStyle;
class PASCALIMPLEMENTATION TdxStatusBarTextPanelStyle : public TdxStatusBarPanelStyle 
{
	typedef TdxStatusBarPanelStyle inherited;
	
private:
	bool FAutoHint;
	TdxStatusBarEllipsisType FEllipsisType;
	Imglist::TImageIndex FImageIndex;
	TdxStatusBarTextEvent FOnGetText;
	void __fastcall SetAutoHint(bool Value);
	void __fastcall SetEllipsisType(TdxStatusBarEllipsisType Value);
	void __fastcall SetImageIndex(Imglist::TImageIndex Value);
	
protected:
	virtual void __fastcall DrawContent(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, TMetaClass* APainter);
	
public:
	__fastcall virtual TdxStatusBarTextPanelStyle(TdxStatusBarPanel* AOwner);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual void __fastcall RestoreDefaults(void);
	
__published:
	__property Alignment  = {default=0};
	__property bool AutoHint = {read=FAutoHint, write=SetAutoHint, default=0};
	__property Color ;
	__property Imglist::TImageIndex ImageIndex = {read=FImageIndex, write=SetImageIndex, default=-1};
	__property TdxStatusBarEllipsisType EllipsisType = {read=FEllipsisType, write=SetEllipsisType, default=0};
	__property Font ;
	__property ParentFont  = {default=1};
	__property TdxStatusBarTextEvent OnGetText = {read=FOnGetText, write=FOnGetText};
public:
	#pragma option push -w-inl
	/* TdxStatusBarPanelStyle.Destroy */ inline __fastcall virtual ~TdxStatusBarTextPanelStyle(void) { }
	#pragma option pop
	
};


#pragma option push -b-
enum TdxStatusBarStateIndicatorType { sitOff, sitYellow, sitBlue, sitGreen, sitRed, sitTeal, sitPurple };
#pragma option pop

class DELPHICLASS TdxStatusBarStateIndicatorItem;
class PASCALIMPLEMENTATION TdxStatusBarStateIndicatorItem : public Classes::TCollectionItem 
{
	typedef Classes::TCollectionItem inherited;
	
private:
	Graphics::TBitmap* FIndicatorBitmap;
	TdxStatusBarStateIndicatorType FIndicatorType;
	bool FVisible;
	void __fastcall SetIndicatorType(TdxStatusBarStateIndicatorType Value);
	void __fastcall SetVisible(bool Value);
	
public:
	__fastcall virtual TdxStatusBarStateIndicatorItem(Classes::TCollection* Collection);
	__fastcall virtual ~TdxStatusBarStateIndicatorItem(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	
__published:
	__property TdxStatusBarStateIndicatorType IndicatorType = {read=FIndicatorType, write=SetIndicatorType, default=0};
	__property bool Visible = {read=FVisible, write=SetVisible, default=1};
};


class DELPHICLASS TdxStatusBarStateIndicators;
class PASCALIMPLEMENTATION TdxStatusBarStateIndicators : public Classes::TCollection 
{
	typedef Classes::TCollection inherited;
	
public:
	TdxStatusBarStateIndicatorItem* operator[](int Index) { return Items[Index]; }
	
private:
	Classes::TNotifyEvent FOnChange;
	HIDESBASE TdxStatusBarStateIndicatorItem* __fastcall GetItem(int Index);
	HIDESBASE void __fastcall SetItem(int Index, TdxStatusBarStateIndicatorItem* Value);
	
protected:
	virtual void __fastcall Update(Classes::TCollectionItem* Item);
	
public:
	__fastcall TdxStatusBarStateIndicators(void);
	HIDESBASE TdxStatusBarStateIndicatorItem* __fastcall Add(void);
	HIDESBASE TdxStatusBarStateIndicatorItem* __fastcall Insert(int Index);
	__property TdxStatusBarStateIndicatorItem* Items[int Index] = {read=GetItem, write=SetItem/*, default*/};
	__property Classes::TNotifyEvent OnChange = {read=FOnChange, write=FOnChange};
public:
	#pragma option push -w-inl
	/* TCollection.Destroy */ inline __fastcall virtual ~TdxStatusBarStateIndicators(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxStatusBarStateIndicatorPanelStyle;
class PASCALIMPLEMENTATION TdxStatusBarStateIndicatorPanelStyle : public TdxStatusBarPanelStyle 
{
	typedef TdxStatusBarPanelStyle inherited;
	
private:
	int FSpacing;
	TdxStatusBarStateIndicators* FIndicators;
	TdxStatusBarStateIndicators* __fastcall GetIndicators(void);
	void __fastcall IndicatorChangeHandler(System::TObject* Sender);
	void __fastcall SetIndicators(TdxStatusBarStateIndicators* Value);
	void __fastcall SetSpacing(int Value);
	
protected:
	virtual bool __fastcall CanSizing(void);
	virtual void __fastcall DrawContent(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, TMetaClass* APainter);
	virtual int __fastcall GetMinWidth(void);
	
public:
	__fastcall virtual TdxStatusBarStateIndicatorPanelStyle(TdxStatusBarPanel* AOwner);
	__fastcall virtual ~TdxStatusBarStateIndicatorPanelStyle(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual void __fastcall RestoreDefaults(void);
	
__published:
	__property Color ;
	__property TdxStatusBarStateIndicators* Indicators = {read=GetIndicators, write=SetIndicators};
	__property int Spacing = {read=FSpacing, write=SetSpacing, default=4};
};


class DELPHICLASS TdxStatusBarKeyboardStateWatchedKey;
class PASCALIMPLEMENTATION TdxStatusBarKeyboardStateWatchedKey : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	int FKeyCode;
	int FKeyState;
	void __fastcall SetKeyState(int Value);
	
public:
	__fastcall TdxStatusBarKeyboardStateWatchedKey(int AKeyCode);
	int __fastcall GetCurrentState(void);
	__property int KeyCode = {read=FKeyCode, nodefault};
	__property int KeyState = {read=FKeyState, write=SetKeyState, nodefault};
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxStatusBarKeyboardStateWatchedKey(void) { }
	#pragma option pop
	
};


typedef DynamicArray<TdxStatusBarKeyboardStateWatchedKey* >  dxStatusBar__8;

class DELPHICLASS TdxStatusBarKeyboardStateNotifier;
class PASCALIMPLEMENTATION TdxStatusBarKeyboardStateNotifier : public Classes::TThread 
{
	typedef Classes::TThread inherited;
	
private:
	TdxCustomStatusBar* FTarget;
	DynamicArray<TdxStatusBarKeyboardStateWatchedKey* >  FKeys;
	
protected:
	virtual void __fastcall Execute(void);
	
public:
	__fastcall TdxStatusBarKeyboardStateNotifier(TdxCustomStatusBar* ATarget);
	void __fastcall SubScribeKey(int AKeyCode);
	void __fastcall UnSubScribeKey(int AKeyCode);
public:
	#pragma option push -w-inl
	/* TThread.Destroy */ inline __fastcall virtual ~TdxStatusBarKeyboardStateNotifier(void) { }
	#pragma option pop
	
};


#pragma option push -b-
enum TdxStatusBarKeyboardState { dxksCapsLock, dxksNumLock, dxksScrollLock, dxksInsert };
#pragma option pop

typedef Set<TdxStatusBarKeyboardState, dxksCapsLock, dxksInsert>  TdxStatusBarKeyboardStates;

class DELPHICLASS TdxStatusBarKeyStateAppearance;
class PASCALIMPLEMENTATION TdxStatusBarKeyStateAppearance : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	TdxStatusBarKeyboardState FId;
	int FCode;
	Graphics::TColor FActiveFontColor;
	Graphics::TColor FInactiveFontColor;
	AnsiString FActiveCaption;
	AnsiString FInactiveCaption;
	Classes::TNotifyEvent FOnChange;
	void __fastcall SetActiveFontColor(Graphics::TColor Value);
	void __fastcall SetInactiveFontColor(Graphics::TColor Value);
	void __fastcall SetActiveCaption(const AnsiString Value);
	void __fastcall SetInactiveCaption(const AnsiString Value);
	
protected:
	virtual void __fastcall Changed(void);
	__property Classes::TNotifyEvent OnChange = {read=FOnChange, write=FOnChange};
	
public:
	__fastcall TdxStatusBarKeyStateAppearance(TdxStatusBarKeyboardState AId, int ACode, const AnsiString AActiveCaption, Graphics::TColor AActiveFontColor, const AnsiString AInactiveCaption, Graphics::TColor AInactiveFontColor, Classes::TNotifyEvent AChangeHandler);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	int __fastcall GetRectWidth(Cxgraphics::TcxCanvas* ACanvas);
	__property int Code = {read=FCode, nodefault};
	__property TdxStatusBarKeyboardState Id = {read=FId, nodefault};
	
__published:
	__property Graphics::TColor ActiveFontColor = {read=FActiveFontColor, write=SetActiveFontColor, default=-2147483640};
	__property Graphics::TColor InactiveFontColor = {read=FInactiveFontColor, write=SetInactiveFontColor, default=-2147483632};
	__property AnsiString ActiveCaption = {read=FActiveCaption, write=SetActiveCaption};
	__property AnsiString InactiveCaption = {read=FInactiveCaption, write=SetInactiveCaption};
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TdxStatusBarKeyStateAppearance(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxStatusBarKeyboardStatePanelStyle;
class PASCALIMPLEMENTATION TdxStatusBarKeyboardStatePanelStyle : public TdxStatusBarPanelStyle 
{
	typedef TdxStatusBarPanelStyle inherited;
	
private:
	bool FFullRect;
	TdxStatusBarKeyboardStates FKeyboardStates;
	TdxStatusBarKeyStateAppearance* FKeyInfos[4];
	TdxStatusBarKeyboardStateNotifier* FNotifier;
	TdxStatusBarKeyStateAppearance* __fastcall GetCapsLockAppearance(void);
	TdxStatusBarKeyStateAppearance* __fastcall GetInsertAppearance(void);
	TdxStatusBarKeyStateAppearance* __fastcall GetNumLockAppearance(void);
	TdxStatusBarKeyStateAppearance* __fastcall GetScrollLockAppearance(void);
	void __fastcall NamesChangeHandler(System::TObject* Sender);
	void __fastcall SetCapsLockAppearance(TdxStatusBarKeyStateAppearance* Value);
	void __fastcall SetFullRect(bool Value);
	void __fastcall SetInsertAppearance(TdxStatusBarKeyStateAppearance* Value);
	void __fastcall SetKeyboardStates(TdxStatusBarKeyboardStates Value);
	void __fastcall SetNumLockAppearance(TdxStatusBarKeyStateAppearance* Value);
	void __fastcall SetScrollLockAppearance(TdxStatusBarKeyStateAppearance* Value);
	
protected:
	virtual bool __fastcall CanSizing(void);
	virtual void __fastcall DrawContent(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, TMetaClass* APainter);
	virtual int __fastcall GetMinWidth(void);
	virtual bool __fastcall InternalBevel(void);
	
public:
	__fastcall virtual TdxStatusBarKeyboardStatePanelStyle(TdxStatusBarPanel* AOwner);
	__fastcall virtual ~TdxStatusBarKeyboardStatePanelStyle(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual void __fastcall RestoreDefaults(void);
	
__published:
	__property Color ;
	__property Font ;
	__property TdxStatusBarKeyboardStates KeyboardStates = {read=FKeyboardStates, write=SetKeyboardStates, default=15};
	__property bool FullRect = {read=FFullRect, write=SetFullRect, default=0};
	__property TdxStatusBarKeyStateAppearance* CapsLockKeyAppearance = {read=GetCapsLockAppearance, write=SetCapsLockAppearance};
	__property TdxStatusBarKeyStateAppearance* NumLockKeyAppearance = {read=GetNumLockAppearance, write=SetNumLockAppearance};
	__property TdxStatusBarKeyStateAppearance* ScrollLockKeyAppearance = {read=GetScrollLockAppearance, write=SetScrollLockAppearance};
	__property TdxStatusBarKeyStateAppearance* InsertKeyAppearance = {read=GetInsertAppearance, write=SetInsertAppearance};
	__property ParentFont  = {default=1};
};


class DELPHICLASS TdxStatusBarContainerControl;
class DELPHICLASS TdxStatusBarContainerPanelStyle;
class PASCALIMPLEMENTATION TdxStatusBarContainerPanelStyle : public TdxStatusBarPanelStyle 
{
	typedef TdxStatusBarPanelStyle inherited;
	
private:
	bool FAlignControl;
	TdxStatusBarContainerControl* FContainer;
	void __fastcall SetContainer(TdxStatusBarContainerControl* Value);
	
protected:
	virtual bool __fastcall CanDelete(void);
	virtual void __fastcall DrawContent(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, TMetaClass* APainter);
	virtual void __fastcall PanelVisibleChanged(void);
	
public:
	__fastcall virtual TdxStatusBarContainerPanelStyle(TdxStatusBarPanel* AOwner);
	__fastcall virtual ~TdxStatusBarContainerPanelStyle(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual void __fastcall RestoreDefaults(void);
	
__published:
	__property bool AlignControl = {read=FAlignControl, write=FAlignControl, default=1};
	__property TdxStatusBarContainerControl* Container = {read=FContainer, write=SetContainer};
};


class PASCALIMPLEMENTATION TdxStatusBarContainerControl : public Cxcontrols::TcxControl 
{
	typedef Cxcontrols::TcxControl inherited;
	
private:
	TdxStatusBarContainerPanelStyle* FPanelStyle;
	
protected:
	virtual void __fastcall Paint(void);
	DYNAMIC bool __fastcall MayFocus(void);
	virtual bool __fastcall NeedsScrollBars(void);
	
public:
	__fastcall virtual TdxStatusBarContainerControl(Classes::TComponent* AOwner);
	__fastcall virtual ~TdxStatusBarContainerControl(void);
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TdxStatusBarContainerControl(HWND ParentWindow) : Cxcontrols::TcxControl(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TdxStatusBarPanels;
class PASCALIMPLEMENTATION TdxStatusBarPanels : public Classes::TCollection 
{
	typedef Classes::TCollection inherited;
	
public:
	TdxStatusBarPanel* operator[](int Index) { return Items[Index]; }
	
private:
	TdxCustomStatusBar* FStatusBarControl;
	HIDESBASE TdxStatusBarPanel* __fastcall GetItem(int Index);
	HIDESBASE void __fastcall SetItem(int Index, TdxStatusBarPanel* Value);
	
protected:
	DYNAMIC Classes::TPersistent* __fastcall GetOwner(void);
	virtual void __fastcall Update(Classes::TCollectionItem* Item);
	
public:
	__fastcall TdxStatusBarPanels(TdxCustomStatusBar* AStatusBarControl);
	HIDESBASE TdxStatusBarPanel* __fastcall Add(void);
	HIDESBASE TdxStatusBarPanel* __fastcall Insert(int Index);
	__property TdxStatusBarPanel* Items[int Index] = {read=GetItem, write=SetItem/*, default*/};
public:
	#pragma option push -w-inl
	/* TCollection.Destroy */ inline __fastcall virtual ~TdxStatusBarPanels(void) { }
	#pragma option pop
	
};


#pragma option push -b-
enum TdxStatusBarPaintStyle { stpsStandard, stpsFlat, stpsXP, stpsOffice11, stpsUseLookAndFeel };
#pragma option pop

class DELPHICLASS TdxStatusBarPainter;
class PASCALIMPLEMENTATION TdxStatusBarPainter : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	/* virtual class method */ virtual tagSIZE __fastcall GripAreaSize(TMetaClass* vmt);
	/* virtual class method */ virtual tagSIZE __fastcall GripSize(TMetaClass* vmt);
	/* virtual class method */ virtual bool __fastcall IsNativeBackground(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall SeparatorSize(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall TopBorderSize(TMetaClass* vmt);
	/* virtual class method */ virtual void __fastcall DrawBorder(TMetaClass* vmt, TdxCustomStatusBar* AStatusBar, Cxgraphics::TcxCanvas* ACanvas, Types::TRect &R);
	/* virtual class method */ virtual void __fastcall DrawEmptyPanel(TMetaClass* vmt, TdxCustomStatusBar* AStatusBar, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R);
	/* virtual class method */ virtual void __fastcall DrawPanel(TMetaClass* vmt, TdxCustomStatusBar* AStatusBar, TdxStatusBarPanel* APanel, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R);
	/* virtual class method */ virtual void __fastcall DrawPanelBorder(TMetaClass* vmt, TdxCustomStatusBar* AStatusBar, TdxStatusBarPanelBevel ABevel, Cxgraphics::TcxCanvas* ACanvas, Types::TRect &R);
	/* virtual class method */ virtual void __fastcall DrawPanelSeparator(TMetaClass* vmt, TdxCustomStatusBar* AStatusBar, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R);
	/* virtual class method */ virtual void __fastcall DrawSizeGrip(TMetaClass* vmt, TdxCustomStatusBar* AStatusBar, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R);
	/* virtual class method */ virtual void __fastcall DrawTopBorder(TMetaClass* vmt, TdxCustomStatusBar* AStatusBar, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R);
	/* virtual class method */ virtual void __fastcall FillBackground(TMetaClass* vmt, TdxCustomStatusBar* AStatusBar, TdxStatusBarPanel* APanel, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R);
	/* virtual class method */ virtual TdxStatusBarPanelBevel __fastcall GetPanelBevel(TMetaClass* vmt, TdxStatusBarPanel* APanel);
	/* virtual class method */ virtual Graphics::TColor __fastcall GetPanelColor(TMetaClass* vmt, TdxCustomStatusBar* AStatusBar, TdxStatusBarPanel* APanel);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TdxStatusBarPainter(void) : System::TObject() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxStatusBarPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxStatusBarStandardPainter;
class PASCALIMPLEMENTATION TdxStatusBarStandardPainter : public TdxStatusBarPainter 
{
	typedef TdxStatusBarPainter inherited;
	
public:
	/* virtual class method */ virtual void __fastcall DrawPanelBorder(TMetaClass* vmt, TdxCustomStatusBar* AStatusBar, TdxStatusBarPanelBevel ABevel, Cxgraphics::TcxCanvas* ACanvas, Types::TRect &R);
	/* virtual class method */ virtual void __fastcall DrawPanelSeparator(TMetaClass* vmt, TdxCustomStatusBar* AStatusBar, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R);
	/* virtual class method */ virtual void __fastcall FillBackground(TMetaClass* vmt, TdxCustomStatusBar* AStatusBar, TdxStatusBarPanel* APanel, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TdxStatusBarStandardPainter(void) : TdxStatusBarPainter() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxStatusBarStandardPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxStatusBarFlatPainter;
class PASCALIMPLEMENTATION TdxStatusBarFlatPainter : public TdxStatusBarStandardPainter 
{
	typedef TdxStatusBarStandardPainter inherited;
	
public:
	/* virtual class method */ virtual void __fastcall DrawPanelBorder(TMetaClass* vmt, TdxCustomStatusBar* AStatusBar, TdxStatusBarPanelBevel ABevel, Cxgraphics::TcxCanvas* ACanvas, Types::TRect &R);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TdxStatusBarFlatPainter(void) : TdxStatusBarStandardPainter() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxStatusBarFlatPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxStatusBarOffice11Painter;
class PASCALIMPLEMENTATION TdxStatusBarOffice11Painter : public TdxStatusBarPainter 
{
	typedef TdxStatusBarPainter inherited;
	
public:
	/* virtual class method */ virtual void __fastcall DrawBorder(TMetaClass* vmt, TdxCustomStatusBar* AStatusBar, Cxgraphics::TcxCanvas* ACanvas, Types::TRect &R);
	/* virtual class method */ virtual void __fastcall DrawPanelBorder(TMetaClass* vmt, TdxCustomStatusBar* AStatusBar, TdxStatusBarPanelBevel ABevel, Cxgraphics::TcxCanvas* ACanvas, Types::TRect &R);
	/* virtual class method */ virtual void __fastcall DrawPanelSeparator(TMetaClass* vmt, TdxCustomStatusBar* AStatusBar, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R);
	/* virtual class method */ virtual void __fastcall DrawSizeGrip(TMetaClass* vmt, TdxCustomStatusBar* AStatusBar, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TdxStatusBarOffice11Painter(void) : TdxStatusBarPainter() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxStatusBarOffice11Painter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxStatusBarXPPainter;
class PASCALIMPLEMENTATION TdxStatusBarXPPainter : public TdxStatusBarPainter 
{
	typedef TdxStatusBarPainter inherited;
	
public:
	/* virtual class method */ virtual tagSIZE __fastcall GripAreaSize(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall SeparatorSize(TMetaClass* vmt);
	/* virtual class method */ virtual void __fastcall DrawBorder(TMetaClass* vmt, TdxCustomStatusBar* AStatusBar, Cxgraphics::TcxCanvas* ACanvas, Types::TRect &R);
	/* virtual class method */ virtual void __fastcall DrawPanelSeparator(TMetaClass* vmt, TdxCustomStatusBar* AStatusBar, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R);
	/* virtual class method */ virtual void __fastcall DrawSizeGrip(TMetaClass* vmt, TdxCustomStatusBar* AStatusBar, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TdxStatusBarXPPainter(void) : TdxStatusBarPainter() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxStatusBarXPPainter(void) { }
	#pragma option pop
	
};


typedef void __fastcall (__closure *TdxStatusBarPanelCreateClassEvent)(TdxCustomStatusBar* Sender, TMetaClass* &AStatusPanelClass);

class PASCALIMPLEMENTATION TdxCustomStatusBar : public Cxcontrols::TcxControl 
{
	typedef Cxcontrols::TcxControl inherited;
	
private:
	int FBorderWidth;
	Imglist::TCustomImageList* FImages;
	Imglist::TChangeLink* FImageChangeLink;
	Cxlookandfeels::TcxLookAndFeel* FLookAndFeel;
	TMetaClass*FPainter;
	TdxStatusBarPaintStyle FPaintStyle;
	TdxStatusBarPanels* FPanels;
	bool FSizeGrip;
	bool FThemeAvailable;
	Dxthememanager::TdxThemeChangedNotificator* FThemeChangedNotificator;
	Classes::TNotifyEvent FOnHint;
	void __fastcall ImageListChange(System::TObject* Sender);
	void __fastcall LookAndFeelChangeHandler(Cxlookandfeels::TcxLookAndFeel* Sender, Cxlookandfeels::TcxLookAndFeelValues AChangedValues);
	HIDESBASE void __fastcall SetBorderWidth(int Value);
	void __fastcall SetImages(const Imglist::TCustomImageList* Value);
	HIDESBASE void __fastcall SetLookAndFeel(Cxlookandfeels::TcxLookAndFeel* Value);
	void __fastcall SetPanels(TdxStatusBarPanels* Value);
	void __fastcall SetPaintStyle(TdxStatusBarPaintStyle Value);
	void __fastcall SetSizeGrip(bool Value);
	HIDESBASE MESSAGE void __fastcall CMBiDiModeChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMColorChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMEnabledChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMParentFontChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMSysColorChange(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMWinIniChange(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMEraseBkGnd(Messages::TWMEraseBkgnd &Message);
	HIDESBASE MESSAGE void __fastcall WMNCHitTest(Messages::TWMNCHitTest &Message);
	HIDESBASE MESSAGE void __fastcall WMSize(Messages::TWMSize &Message);
	
protected:
	DYNAMIC void __fastcall FontChanged(void);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	virtual void __fastcall Paint(void);
	DYNAMIC bool __fastcall MayFocus(void);
	virtual bool __fastcall NeedsScrollBars(void);
	TdxStatusBarContainerControl* __fastcall ContainerByName(const AnsiString AName);
	virtual TdxStatusBarPanel* __fastcall CreatePanel(void);
	virtual TdxStatusBarPanels* __fastcall CreatePanels(void);
	virtual bool __fastcall DoHint(void);
	/* virtual class method */ virtual TMetaClass* __fastcall GetDeafultPanelStyleClass(TMetaClass* vmt);
	virtual TMetaClass* __fastcall GetPainterClass(void);
	virtual TdxStatusBarPaintStyle __fastcall GetPaintStyle(void);
	/* virtual class method */ virtual TMetaClass* __fastcall GetStatusPanelClass(TMetaClass* vmt);
	virtual void __fastcall InitPainterClass(void);
	virtual void __fastcall PaintStyleChanged(void);
	virtual bool __fastcall SizeGripAllocated(void);
	virtual void __fastcall ThemeChanged(void);
	virtual void __fastcall UpdatePanels(void);
	__property TdxStatusBarPanels* Panels = {read=FPanels, write=SetPanels};
	__property bool SizeGrip = {read=FSizeGrip, write=SetSizeGrip, default=1};
	__property Cxlookandfeels::TcxLookAndFeel* LookAndFeel = {read=FLookAndFeel, write=SetLookAndFeel};
	__property TMetaClass* Painter = {read=FPainter};
	__property TdxStatusBarPaintStyle PaintStyle = {read=FPaintStyle, write=SetPaintStyle, default=0};
	__property int BorderWidth = {read=FBorderWidth, write=SetBorderWidth, default=0};
	
public:
	__fastcall virtual TdxCustomStatusBar(Classes::TComponent* AOwner);
	__fastcall virtual ~TdxCustomStatusBar(void);
	DYNAMIC bool __fastcall ExecuteAction(Classes::TBasicAction* Action);
	__property Classes::TNotifyEvent OnHint = {read=FOnHint, write=FOnHint};
	
__published:
	__property Imglist::TCustomImageList* Images = {read=FImages, write=SetImages};
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TdxCustomStatusBar(HWND ParentWindow) : Cxcontrols::TcxControl(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TdxStatusBar;
class PASCALIMPLEMENTATION TdxStatusBar : public TdxCustomStatusBar 
{
	typedef TdxCustomStatusBar inherited;
	
__published:
	__property Images ;
	__property Panels ;
	__property PaintStyle  = {default=0};
	__property SizeGrip  = {default=1};
	__property LookAndFeel ;
	__property OnHint ;
	__property BorderWidth  = {default=0};
	__property Anchors  = {default=3};
	__property BiDiMode ;
	__property DragCursor  = {default=-12};
	__property DragKind  = {default=0};
	__property DragMode  = {default=0};
	__property Enabled  = {default=1};
	__property Font ;
	__property Color  = {default=-2147483633};
	__property Constraints ;
	__property ShowHint ;
	__property ParentBiDiMode  = {default=1};
	__property ParentFont  = {default=0};
	__property ParentShowHint  = {default=1};
	__property PopupMenu ;
	__property Visible  = {default=1};
	__property OnContextPopup ;
	__property OnDragDrop ;
	__property OnDragOver ;
	__property OnEndDock ;
	__property OnEndDrag ;
	__property OnMouseDown ;
	__property OnMouseMove ;
	__property OnMouseUp ;
	__property OnResize ;
	__property OnStartDock ;
	__property OnStartDrag ;
public:
	#pragma option push -w-inl
	/* TdxCustomStatusBar.Create */ inline __fastcall virtual TdxStatusBar(Classes::TComponent* AOwner) : TdxCustomStatusBar(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TdxCustomStatusBar.Destroy */ inline __fastcall virtual ~TdxStatusBar(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TdxStatusBar(HWND ParentWindow) : TdxCustomStatusBar(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE Cxclasses::TcxRegisteredClasses* __fastcall GetRegisteredStatusBarPanelStyles(void);
extern PACKAGE void __fastcall LoadIndicatorBitmap(Graphics::TBitmap* ABitmap, TdxStatusBarStateIndicatorType AIndicatorType);

}	/* namespace Dxstatusbar */
using namespace Dxstatusbar;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// dxStatusBar
