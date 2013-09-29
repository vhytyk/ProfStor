// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxContainer.pas' rev: 6.00

#ifndef cxContainerHPP
#define cxContainerHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxScrollBar.hpp>	// Pascal unit
#include <cxLookAndFeels.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <dxUxTheme.hpp>	// Pascal unit
#include <dxThemeManager.hpp>	// Pascal unit
#include <dxThemeConsts.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxcontainer
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TcxContainerBorderStyle { cbsNone, cbsSingle, cbsThick, cbsFlat, cbs3D, cbsUltraFlat };
#pragma option pop

#pragma option push -b-
enum TcxContainerHotState { chsNoHotTrack, chsNormal, chsSelected };
#pragma option pop

#pragma option push -b-
enum TcxContainerStateItem { csActive, csDisabled, csHotTrack, csNormal };
#pragma option pop

typedef Set<TcxContainerStateItem, csActive, csNormal>  TcxContainerState;

#pragma option push -b-
enum TcxMouseButton { cxmbNone, cxmbLeft, cxmbRight, cxmbMiddle };
#pragma option pop

typedef HWND TcxNativeHandle;

typedef Shortint TcxContainerStyleValue;

typedef Set<TcxContainerStyleValue, 0, 31>  TcxContainerStyleValues;

typedef AnsiString cxContainer__1[8];

class DELPHICLASS TcxContainerStyle;
typedef void __fastcall (__closure *TcxStyleChangedEvent)(System::TObject* Sender, TcxContainerStyle* AStyle);

typedef TMetaClass*TcxContainerClass;

class DELPHICLASS TPersistentAccess;
class PASCALIMPLEMENTATION TPersistentAccess : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TPersistentAccess(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TPersistentAccess(void) : Classes::TPersistent() { }
	#pragma option pop
	
};


class DELPHICLASS TWinControlAccess;
class PASCALIMPLEMENTATION TWinControlAccess : public Controls::TWinControl 
{
	typedef Controls::TWinControl inherited;
	
public:
	#pragma option push -w-inl
	/* TWinControl.Create */ inline __fastcall virtual TWinControlAccess(Classes::TComponent* AOwner) : Controls::TWinControl(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TWinControlAccess(HWND ParentWindow) : Controls::TWinControl(ParentWindow) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TWinControl.Destroy */ inline __fastcall virtual ~TWinControlAccess(void) { }
	#pragma option pop
	
};


typedef void __fastcall (__closure *TcxFreeNotificationEvent)(Classes::TComponent* Sender);

class DELPHICLASS TcxFreeNotificator;
class PASCALIMPLEMENTATION TcxFreeNotificator : public Classes::TComponent 
{
	typedef Classes::TComponent inherited;
	
private:
	TcxFreeNotificationEvent FOnFreeNotification;
	
protected:
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	
public:
	void __fastcall AddSender(Classes::TComponent* ASender);
	void __fastcall RemoveSender(Classes::TComponent* ASender);
	__property TcxFreeNotificationEvent OnFreeNotification = {read=FOnFreeNotification, write=FOnFreeNotification};
public:
	#pragma option push -w-inl
	/* TComponent.Create */ inline __fastcall virtual TcxFreeNotificator(Classes::TComponent* AOwner) : Classes::TComponent(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TComponent.Destroy */ inline __fastcall virtual ~TcxFreeNotificator(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxContainerViewInfo;
class PASCALIMPLEMENTATION TcxContainerViewInfo : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	Graphics::TColor FBackgroundColor;
	void __fastcall SetBackgroundColor(Graphics::TColor Value);
	
protected:
	virtual void __fastcall InternalPaint(Cxgraphics::TcxCanvas* ACanvas);
	
public:
	HBRUSH BackgroundBrush;
	Graphics::TColor BorderColor;
	#pragma pack(push, 1)
	Types::TRect BorderRect;
	#pragma pack(pop)
	
	TcxContainerBorderStyle BorderStyle;
	int BorderWidth;
	#pragma pack(push, 1)
	Types::TRect Bounds;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect ClientRect;
	#pragma pack(pop)
	
	TcxContainerState ContainerState;
	Cxgraphics::TcxBorders Edges;
	bool NativeStyle;
	int NativePart;
	int NativeState;
	Dxthememanager::TdxThemedObjectType ThemedObjectType;
	bool Shadow;
	__property Graphics::TColor BackgroundColor = {read=FBackgroundColor, write=SetBackgroundColor, nodefault};
	__fastcall virtual TcxContainerViewInfo(void);
	virtual void __fastcall Assign(System::TObject* Source);
	virtual Cxgraphics::TcxRegion* __fastcall GetUpdateRegion(TcxContainerViewInfo* AViewInfo);
	virtual void __fastcall Offset(int DX, int DY);
	virtual void __fastcall Paint(Cxgraphics::TcxCanvas* ACanvas);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxContainerViewInfo(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxContainerViewInfoClass;

#pragma pack(push, 4)
struct TcxContainerStyleData
{
	Graphics::TColor Color;
	Graphics::TFont* Font;
	Graphics::TColor FontColor;
} ;
#pragma pack(pop)

class DELPHICLASS TcxContainer;
class DELPHICLASS TcxStyleController;
typedef TMetaClass*TcxContainerStyleClass;

class PASCALIMPLEMENTATION TcxStyleController : public Classes::TComponent 
{
	typedef Classes::TComponent inherited;
	
private:
	bool FIsDestruction;
	Classes::TList* FListeners;
	TcxStyleChangedEvent FOnStyleChanged;
	void __fastcall SetStyle(TcxContainerStyle* Value);
	void __fastcall StyleChanged(System::TObject* Sender);
	
protected:
	TcxContainerStyle* FStyle;
	virtual void __fastcall Loaded(void);
	virtual void __fastcall AddListener(TcxContainerStyle* AListener);
	void __fastcall Changed(void);
	virtual void __fastcall DoStyleChanged(TcxContainerStyle* AStyle);
	virtual TMetaClass* __fastcall GetStyleClass(void);
	bool __fastcall IsDestruction(void);
	virtual void __fastcall RemoveListener(TcxContainerStyle* AListener);
	__property Classes::TList* Listeners = {read=FListeners};
	__property TcxContainerStyle* Style = {read=FStyle, write=SetStyle};
	__property TcxStyleChangedEvent OnStyleChanged = {read=FOnStyleChanged, write=FOnStyleChanged};
	
public:
	__fastcall virtual TcxStyleController(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxStyleController(void);
	virtual void __fastcall BeforeDestruction(void);
};


class PASCALIMPLEMENTATION TcxContainerStyle : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	Graphics::TColor FBorderColor;
	TcxContainerBorderStyle FBorderStyle;
	Cxgraphics::TcxBorders FEdges;
	bool FHotTrack;
	bool FShadow;
	bool FTransparentBorder;
	bool FDirectAccessMode;
	bool FIsDestroying;
	Cxlookandfeels::TcxLookAndFeel* FLookAndFeel;
	bool FModified;
	Classes::TPersistent* FOwner;
	int FUpdateCount;
	Classes::TNotifyEvent FOnChanged;
	TcxContainerStyleValues __fastcall GetAssignedValues(void);
	Graphics::TColor __fastcall GetBorderColor(void);
	TcxContainerBorderStyle __fastcall GetBorderStyle(void);
	Cxgraphics::TcxBorders __fastcall GetEdges(void);
	Graphics::TFont* __fastcall GetFont(void);
	bool __fastcall GetHotTrack(void);
	bool __fastcall GetShadow(void);
	bool __fastcall GetTransparentBorder(void);
	bool __fastcall InternalGetBorderColor(Graphics::TColor &BorderColor);
	bool __fastcall InternalGetBorderStyle(TcxContainerBorderStyle &BorderStyle);
	bool __fastcall InternalGetEdges(Cxgraphics::TcxBorders &Edges);
	bool __fastcall InternalGetFont(Graphics::TFont* &Font);
	bool __fastcall InternalGetHotTrack(bool &HotTrack);
	bool __fastcall InternalGetShadow(bool &Shadow);
	bool __fastcall InternalGetTransparentBorder(bool &TransparentBorder);
	bool __fastcall IsBorderColorStored(void);
	bool __fastcall IsBorderStyleStored(void);
	bool __fastcall IsColorStored(void);
	bool __fastcall IsEdgesStored(void);
	bool __fastcall IsFontStored(void);
	bool __fastcall IsHotTrackStored(void);
	bool __fastcall IsShadowStored(void);
	bool __fastcall IsTransparentBorderStored(void);
	void __fastcall SetAssignedValues(TcxContainerStyleValues Value);
	void __fastcall SetBorderColor(Graphics::TColor Value);
	void __fastcall SetBorderStyle(TcxContainerBorderStyle Value);
	void __fastcall SetColor(Graphics::TColor Value);
	void __fastcall SetEdges(Cxgraphics::TcxBorders Value);
	void __fastcall SetFont(Graphics::TFont* Value);
	void __fastcall SetHotTrack(bool Value);
	void __fastcall SetShadow(bool Value);
	void __fastcall SetTransparentBorder(bool Value);
	TcxContainer* __fastcall GetContainer(void);
	void __fastcall LFChanged(Cxlookandfeels::TcxLookAndFeel* Sender, Cxlookandfeels::TcxLookAndFeelValues AChangedValues);
	void __fastcall SetLookAndFeel(Cxlookandfeels::TcxLookAndFeel* Value);
	
protected:
	TcxContainerStyleValues FAssignedValues;
	bool FInternalSetting;
	TcxStyleController* FStyleController;
	DYNAMIC Classes::TPersistent* __fastcall GetOwner(void);
	TcxStyleController* __fastcall BaseGetStyleController(void);
	void __fastcall BaseSetStyleController(TcxStyleController* Value);
	virtual void __fastcall Changed(void);
	virtual void __fastcall ControllerChangedNotification(TcxStyleController* AStyleController);
	virtual void __fastcall ControllerFreeNotification(TcxStyleController* AStyleController);
	void __fastcall CreateFont(void);
	virtual Graphics::TColor __fastcall DefaultBorderColor(void);
	virtual TcxContainerBorderStyle __fastcall DefaultBorderStyle(void);
	virtual Graphics::TColor __fastcall DefaultColor(void);
	virtual Cxgraphics::TcxBorders __fastcall DefaultEdges(void);
	virtual bool __fastcall DefaultHotTrack(void);
	virtual bool __fastcall DefaultShadow(void);
	virtual bool __fastcall DefaultTransparentBorder(void);
	virtual void __fastcall FontChanged(System::TObject* Sender);
	virtual Graphics::TColor __fastcall GetColor(void);
	virtual Graphics::TColor __fastcall GetInternalColor(void);
	bool __fastcall InternalGetColor(Graphics::TColor &Color);
	bool __fastcall IsDestroying(void);
	virtual bool __fastcall IsValueDefined(TcxContainerStyleValue AValue);
	virtual void __fastcall StyleControllerChanged(void);
	void __fastcall UpdateFont(void);
	__property Classes::TNotifyEvent OnChanged = {read=FOnChanged, write=FOnChanged};
	
public:
	TcxContainerStyleData StyleData;
	__fastcall virtual TcxContainerStyle(Classes::TPersistent* AOwner, bool ADirectAccessMode);
	__fastcall virtual ~TcxContainerStyle(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual void __fastcall BeforeDestruction(void);
	void __fastcall BeginUpdate(void);
	void __fastcall EndUpdate(void);
	/* virtual class method */ virtual TcxStyleController* __fastcall GetDefaultStyleController(TMetaClass* vmt);
	/*         class method */ static bool __fastcall GetStyleValue(TMetaClass* vmt, const AnsiString APropertyName, /* out */ TcxContainerStyleValue &StyleValue);
	/* virtual class method */ virtual int __fastcall GetStyleValueCount(TMetaClass* vmt);
	/* virtual class method */ virtual bool __fastcall GetStyleValueName(TMetaClass* vmt, TcxContainerStyleValue AStyleValue, /* out */ AnsiString &StyleValueName);
	virtual void __fastcall RestoreDefaults(void);
	__property TcxContainer* Container = {read=GetContainer};
	__property bool DirectAccessMode = {read=FDirectAccessMode, nodefault};
	
__published:
	__property TcxContainerStyleValues AssignedValues = {read=GetAssignedValues, write=SetAssignedValues, stored=false, nodefault};
	__property Graphics::TColor BorderColor = {read=GetBorderColor, write=SetBorderColor, stored=IsBorderColorStored, nodefault};
	__property TcxContainerBorderStyle BorderStyle = {read=GetBorderStyle, write=SetBorderStyle, stored=IsBorderStyleStored, nodefault};
	__property Graphics::TColor Color = {read=GetColor, write=SetColor, stored=IsColorStored, nodefault};
	__property Cxgraphics::TcxBorders Edges = {read=GetEdges, write=SetEdges, stored=IsEdgesStored, nodefault};
	__property Graphics::TFont* Font = {read=GetFont, write=SetFont, stored=IsFontStored};
	__property bool HotTrack = {read=GetHotTrack, write=SetHotTrack, stored=IsHotTrackStored, nodefault};
	__property Cxlookandfeels::TcxLookAndFeel* LookAndFeel = {read=FLookAndFeel, write=SetLookAndFeel};
	__property bool Shadow = {read=GetShadow, write=SetShadow, stored=IsShadowStored, nodefault};
	__property TcxStyleController* StyleController = {read=BaseGetStyleController, write=BaseSetStyleController};
	__property bool TransparentBorder = {read=GetTransparentBorder, write=SetTransparentBorder, stored=IsTransparentBorderStored, nodefault};
};


class DELPHICLASS TcxContainerMouseTrackingHelper;
class PASCALIMPLEMENTATION TcxContainerMouseTrackingHelper : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	TcxContainer* FOwner;
	
public:
	__fastcall TcxContainerMouseTrackingHelper(TcxContainer* AOwner);
	void __fastcall MouseLeave(void);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxContainerMouseTrackingHelper(void) { }
	#pragma option pop
	
};


__interface IcxContainerInnerControl;
typedef System::DelphiInterface<IcxContainerInnerControl> _di_IcxContainerInnerControl;
__interface INTERFACE_UUID("{1B111318-D9C9-4C35-9EFF-5D95793C0106}") IcxContainerInnerControl  : public IInterface 
{
	
public:
	virtual Controls::TWinControl* __fastcall GetControl(void) = 0 ;
	virtual TcxContainer* __fastcall GetControlContainer(void) = 0 ;
	__property Controls::TWinControl* Control = {read=GetControl};
	__property TcxContainer* ControlContainer = {read=GetControlContainer};
};

class PASCALIMPLEMENTATION TcxContainer : public Cxcontrols::TcxControl 
{
	typedef Cxcontrols::TcxControl inherited;
	
private:
	Controls::TWinControl* FInnerControl;
	bool FInnerControlMouseDown;
	#pragma pack(push, 1)
	Types::TRect FInnerControlRect;
	#pragma pack(pop)
	
	Types::TRect *FPInnerControlRect;
	bool FIsDestroying;
	bool FIsRefreshLocked;
	int FLockAlignControlsCount;
	TcxContainerMouseTrackingHelper* FMouseTrackingHelper;
	bool FScrollBarsCalculating;
	Dxthememanager::TdxThemeChangedNotificator* FThemeChangedNotificator;
	Controls::TWinControl* __fastcall GetActiveControl(void);
	HIDESBASE bool __fastcall GetIsDestroying(void);
	void __fastcall SetStyle(const TcxContainerStyle* Value);
	Controls::TDragKind __fastcall GetDragKind(void);
	HIDESBASE MESSAGE void __fastcall WMKillFocus(Messages::TWMKillFocus &Message);
	HIDESBASE MESSAGE void __fastcall WMNCPaint(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMSetCursor(Messages::TWMSetCursor &Message);
	HIDESBASE MESSAGE void __fastcall WMSetFocus(Messages::TWMSetFocus &Message);
	MESSAGE void __fastcall WMThemeChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMWindowPosChanging(Messages::TWMWindowPosMsg &Message);
	HIDESBASE MESSAGE void __fastcall CMCtl3DChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMEnabledChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMNCSizeChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMParentColorChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMParentFontChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMSysColorChange(Messages::TMessage &Message);
	
protected:
	bool FInternalSetting;
	bool FIsCreating;
	TcxContainerStyle* FStyle;
	TcxContainerViewInfo* FViewInfo;
	virtual void __fastcall AdjustClientRect(Types::TRect &Rect);
	virtual void __fastcall AlignControls(Controls::TControl* AControl, Types::TRect &Rect);
	virtual bool __fastcall CanFocusOnClick(void);
	DYNAMIC void __fastcall ColorChanged(void);
	DYNAMIC void __fastcall CursorChanged(void);
	DYNAMIC void __fastcall FontChanged(void);
	DYNAMIC void __fastcall FocusChanged(void);
	virtual Types::TRect __fastcall GetClientBounds();
	DYNAMIC void __fastcall KeyDown(Word &Key, Classes::TShiftState Shift);
	virtual void __fastcall Loaded(void);
	DYNAMIC bool __fastcall MayFocus(void);
	DYNAMIC void __fastcall MouseDown(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseEnter(Controls::TControl* AControl);
	DYNAMIC void __fastcall MouseLeave(Controls::TControl* AControl);
	DYNAMIC void __fastcall MouseMove(Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseUp(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	virtual bool __fastcall NeedsScrollBars(void);
	virtual void __fastcall Paint(void);
	DYNAMIC void __fastcall Resize(void);
	virtual void __fastcall SetDragMode(Controls::TDragMode Value);
	virtual void __fastcall CreateHandle(void);
	virtual void __fastcall CreateParams(Controls::TCreateParams &Params);
	virtual void __fastcall WndProc(Messages::TMessage &Message);
	virtual void __fastcall AdjustInnerControl(void);
	virtual void __fastcall CalculateViewInfo(const Types::TPoint &P, bool AMouseTracking);
	virtual void __fastcall ClearSavedChildControlRegions(void);
	virtual void __fastcall ContainerStyleChanged(System::TObject* Sender);
	virtual void __fastcall DataChange(void);
	virtual void __fastcall DataSetChange(void);
	DYNAMIC void __fastcall EnabledChanged(void);
	virtual void __fastcall EndMouseTracking(void);
	virtual Types::TRect __fastcall GetBorderExtent();
	int __fastcall GetBorderWidth(TcxContainerBorderStyle ABorderStyle);
	virtual void __fastcall GetChildControlBounds(const Types::TRect &AChildControlBounds, Controls::TControl* AChildControl, Types::PRect &PR);
	/* virtual class method */ virtual TMetaClass* __fastcall GetStyleClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewInfoClass(TMetaClass* vmt);
	virtual Types::TRect __fastcall GetVisibleBounds();
	bool __fastcall IsAlignControlsLocked(void);
	virtual bool __fastcall IsChildControlRegionChanged(Controls::TWinControl* AControl, Types::PRect PR);
	virtual bool __fastcall IsStyleInDirectAccessMode(void);
	void __fastcall LockAlignControls(bool ALock);
	virtual bool __fastcall RefreshContainer(const Types::TPoint &P, TcxMouseButton Button, Classes::TShiftState Shift, bool AIsMouseEvent);
	virtual void __fastcall SaveChildControlRegion(Controls::TWinControl* AControl, Types::PRect PR);
	virtual void __fastcall SetScrollBarsParameters(void);
	void __fastcall SetShadowRegion(void);
	virtual void __fastcall SetSize(void);
	bool __fastcall ShortRefreshContainer(bool AIsMouseEvent);
	virtual bool __fastcall TabsNeeded(void);
	virtual void __fastcall UpdateData(void);
	virtual Dxthememanager::TdxThemedObjectType __fastcall GetBackgroundThemedObjectType(void);
	virtual int __fastcall GetBackgroundNativePart(void);
	virtual int __fastcall GetBackgroundNativeState(void);
	virtual void __fastcall SetDragKind(Controls::TDragKind Value);
	virtual void __fastcall ThemeChanged(void);
	__property Controls::TWinControl* InnerControl = {read=FInnerControl, write=FInnerControl};
	__property bool InnerControlMouseDown = {read=FInnerControlMouseDown, write=FInnerControlMouseDown, nodefault};
	__property TcxContainerMouseTrackingHelper* MouseTrackingHelper = {read=FMouseTrackingHelper};
	__property TcxContainerStyle* Style = {read=FStyle, write=SetStyle};
	__property TcxContainerViewInfo* ViewInfo = {read=FViewInfo};
	__property Controls::TDragKind DragKind = {read=GetDragKind, write=SetDragKind, default=0};
	__property bool ScrollBarsCalculating = {read=FScrollBarsCalculating, nodefault};
	
public:
	__fastcall virtual TcxContainer(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxContainer(void);
	virtual void __fastcall BeforeDestruction(void);
	DYNAMIC bool __fastcall Focused(void);
	virtual void __fastcall SetFocus(void);
	/* virtual class method */ virtual TcxContainerStyleValues __fastcall GetNotPublishedStyleValues(TMetaClass* vmt);
	__property bool IsDestroying = {read=GetIsDestroying, nodefault};
	__property Types::TRect VisibleBounds = {read=GetVisibleBounds};
	
__published:
	__property TabStop  = {default=1};
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxContainer(HWND ParentWindow) : Cxcontrols::TcxControl(ParentWindow) { }
	#pragma option pop
	
private:
	void *__IcxCompoundControl;	/* Cxcontrols::IcxCompoundControl */
	void *__IcxMouseTrackingCaller;	/* Cxcontrols::IcxMouseTrackingCaller */
	
public:
	operator IcxMouseTrackingCaller*(void) { return (IcxMouseTrackingCaller*)&__IcxMouseTrackingCaller; }
	operator IcxCompoundControl*(void) { return (IcxCompoundControl*)&__IcxCompoundControl; }
	
};


class DELPHICLASS TcxCustomPopupWindow;
class PASCALIMPLEMENTATION TcxCustomPopupWindow : public Cxcontrols::TcxPopupWindow 
{
	typedef Cxcontrols::TcxPopupWindow inherited;
	
private:
	bool FCaptureFocus;
	bool FDeactivation;
	Controls::TWinControl* FFocusedControl;
	bool FIsDeactivateLocked;
	bool FIsTopMost;
	bool FJustClosed;
	bool FModalMode;
	bool FTerminateOnDestroy;
	Controls::TWinControl* FOwnerControl;
	Classes::TNotifyEvent FOnClosed;
	Classes::TNotifyEvent FOnClosing;
	Classes::TNotifyEvent FOnShowed;
	Classes::TNotifyEvent FOnShowing;
	void __fastcall SetCaptureFocus(bool Value);
	void __fastcall SetIsTopMost(bool Value);
	HIDESBASE MESSAGE void __fastcall WMActivateApp(Messages::TWMActivateApp &Message);
	HIDESBASE MESSAGE void __fastcall WMEraseBkgnd(Messages::TWMEraseBkgnd &Message);
	MESSAGE void __fastcall CMClosePopupWindow(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMMouseEnter(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMMouseLeave(Messages::TMessage &Message);
	MESSAGE void __fastcall CMShowPopupWindow(Messages::TMessage &Message);
	
protected:
	TcxContainerStyle* FStyle;
	TcxContainerViewInfo* FViewInfo;
	virtual void __fastcall AdjustClientRect(Types::TRect &Rect);
	DYNAMIC void __fastcall Deactivate(void);
	virtual void __fastcall InitPopup(void);
	DYNAMIC void __fastcall KeyDown(Word &Key, Classes::TShiftState Shift);
	DYNAMIC void __fastcall Paint(void);
	DYNAMIC void __fastcall VisibleChanged(void);
	virtual void __fastcall CreateHandle(void);
	virtual void __fastcall CreateParams(Controls::TCreateParams &Params);
	virtual void __fastcall CreateWnd(void);
	virtual void __fastcall DoClosed(void);
	virtual void __fastcall DoClosing(void);
	virtual void __fastcall DoShowed(void);
	void __fastcall DoShowing(void);
	Controls::TWinControl* __fastcall GetFirstFocusControl(Controls::TWinControl* AControl);
	virtual bool __fastcall HasBackground(void);
	bool __fastcall IsDeactivateLocked(void);
	void __fastcall LockDeactivate(bool ALock);
	DYNAMIC void __fastcall MouseEnter(Controls::TControl* AControl);
	DYNAMIC void __fastcall MouseLeave(Controls::TControl* AControl);
	virtual void __fastcall PopupWindowStyleChanged(System::TObject* Sender);
	void __fastcall RecreateWindow(void);
	virtual bool __fastcall IsSysKeyAccepted(Word Key);
	__property TcxContainerStyle* Style = {read=FStyle};
	__property TcxContainerViewInfo* ViewInfo = {read=FViewInfo};
	
public:
	__fastcall virtual TcxCustomPopupWindow(Controls::TWinControl* AOwnerControl);
	__fastcall virtual ~TcxCustomPopupWindow(void);
	DYNAMIC bool __fastcall CanFocus(void);
	void __fastcall ClosePopup(void);
	HIDESBASE virtual void __fastcall CloseUp(bool AModalResult = false)/* overload */;
	DYNAMIC bool __fastcall Focused(void);
	/* virtual class method */ virtual TMetaClass* __fastcall GetStyleClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewInfoClass(TMetaClass* vmt);
	bool __fastcall HasCapture(void);
	bool __fastcall IsVisible(void);
	HIDESBASE virtual void __fastcall Popup(Controls::TWinControl* AFocusedControl);
	__property bool CaptureFocus = {read=FCaptureFocus, write=SetCaptureFocus, default=1};
	__property bool IsTopMost = {read=FIsTopMost, write=SetIsTopMost, nodefault};
	__property bool JustClosed = {read=FJustClosed, write=FJustClosed, nodefault};
	__property bool ModalMode = {read=FModalMode, write=FModalMode, default=1};
	__property Controls::TWinControl* OwnerControl = {read=FOwnerControl};
	__property bool TerminateOnDestroy = {read=FTerminateOnDestroy, write=FTerminateOnDestroy, nodefault};
	__property Classes::TNotifyEvent OnClosed = {read=FOnClosed, write=FOnClosed};
	__property Classes::TNotifyEvent OnClosing = {read=FOnClosing, write=FOnClosing};
	__property OnCloseQuery ;
	__property Classes::TNotifyEvent OnShowed = {read=FOnShowed, write=FOnShowed};
	__property Classes::TNotifyEvent OnShowing = {read=FOnShowing, write=FOnShowing};
public:
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual TcxCustomPopupWindow(Classes::TComponent* AOwner, int Dummy) : Cxcontrols::TcxPopupWindow(AOwner, Dummy) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomPopupWindow(HWND ParentWindow) : Cxcontrols::TcxPopupWindow(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomInnerListBox;
class PASCALIMPLEMENTATION TcxCustomInnerListBox : public Stdctrls::TListBox 
{
	typedef Stdctrls::TListBox inherited;
	
private:
	Cxgraphics::TcxCanvas* FCanvas;
	Cxscrollbar::TcxScrollBar* FHScrollBar;
	Cxlookandfeels::TcxLookAndFeel* FLookAndFeel;
	Cxscrollbar::TcxScrollBar* FVScrollBar;
	bool FScrollBarsCalculating;
	int FScrollBarsLockCount;
	void __fastcall CreateScrollBars(void);
	TcxContainer* __fastcall GetControlContainer(void);
	HIDESBASE Controls::TWinControl* __fastcall GetControl(void);
	void __fastcall HScrollHandler(System::TObject* Sender, Stdctrls::TScrollCode ScrollCode, int &ScrollPos);
	void __fastcall SetLookAndFeel(Cxlookandfeels::TcxLookAndFeel* Value);
	void __fastcall VScrollHandler(System::TObject* Sender, Stdctrls::TScrollCode ScrollCode, int &ScrollPos);
	MESSAGE void __fastcall WMGetDlgCode(Messages::TWMNoParams &Message);
	HIDESBASE MESSAGE void __fastcall WMKillFocus(Messages::TWMKillFocus &Message);
	HIDESBASE MESSAGE void __fastcall WMNCCalcSize(Messages::TWMNCCalcSize &Message);
	HIDESBASE MESSAGE void __fastcall WMNCPaint(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMSetFocus(Messages::TWMSetFocus &Message);
	HIDESBASE MESSAGE void __fastcall WMWindowPosChanged(Messages::TWMWindowPosMsg &Message);
	HIDESBASE MESSAGE void __fastcall CMMouseEnter(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMMouseLeave(Messages::TMessage &Message);
	
protected:
	TcxContainer* FContainer;
	DYNAMIC void __fastcall Click(void);
	DYNAMIC void __fastcall DblClick(void);
	DYNAMIC bool __fastcall DoMouseWheel(Classes::TShiftState Shift, int WheelDelta, const Types::TPoint &MousePos);
	DYNAMIC void __fastcall DragOver(System::TObject* Source, int X, int Y, Controls::TDragState State, bool &Accept);
	DYNAMIC Menus::TPopupMenu* __fastcall GetPopupMenu(void);
	DYNAMIC void __fastcall KeyDown(Word &Key, Classes::TShiftState Shift);
	DYNAMIC void __fastcall KeyPress(char &Key);
	DYNAMIC void __fastcall KeyUp(Word &Key, Classes::TShiftState Shift);
	DYNAMIC void __fastcall MouseDown(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseEnter(Controls::TControl* AControl);
	DYNAMIC void __fastcall MouseLeave(Controls::TControl* AControl);
	DYNAMIC void __fastcall MouseMove(Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseUp(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	virtual void __fastcall WndProc(Messages::TMessage &Message);
	Types::TRect __fastcall GetSizeGripRect();
	void __fastcall LockScrollBarsUpdate(bool ALock);
	void __fastcall SetExternalScrollBarsParameters(void);
	__property TcxContainer* Container = {read=FContainer};
	__property Cxlookandfeels::TcxLookAndFeel* LookAndFeel = {read=FLookAndFeel, write=SetLookAndFeel};
	
public:
	__fastcall virtual TcxCustomInnerListBox(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxCustomInnerListBox(void);
	DYNAMIC void __fastcall DragDrop(System::TObject* Source, int X, int Y);
	bool __fastcall ItemVisible(int Index);
	__property Cxgraphics::TcxCanvas* Canvas = {read=FCanvas};
	__property Cxscrollbar::TcxScrollBar* HScrollBar = {read=FHScrollBar};
	__property Cxscrollbar::TcxScrollBar* VScrollBar = {read=FVScrollBar};
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomInnerListBox(HWND ParentWindow) : Stdctrls::TListBox(ParentWindow) { }
	#pragma option pop
	
private:
	void *__IcxContainerInnerControl;	/* Cxcontainer::IcxContainerInnerControl */
	
public:
	operator IcxContainerInnerControl*(void) { return (IcxContainerInnerControl*)&__IcxContainerInnerControl; }
	
};


typedef TcxCustomInnerListBox TcxCustomListBox;
;

typedef BOOL __stdcall (*TGetScrollBarInfo)(HWND hwnd, int idObject, tagSCROLLBARINFO &psbi);

//-- var, const, procedure ---------------------------------------------------
static const Word CM_CLOSEPOPUPWINDOW = 0x8065;
static const Word CM_SHOWPOPUPWINDOW = 0x8066;
static const Shortint cxContainerMaxBorderWidth = 0x2;
static const Shortint cxContainerShadowWidth = 0x3;
extern PACKAGE HBRUSH cxEmptyBrush;
static const Shortint csvBorderColor = 0x0;
static const Shortint csvBorderStyle = 0x1;
static const Shortint csvColor = 0x2;
static const Shortint csvEdges = 0x3;
static const Shortint csvFont = 0x4;
static const Shortint csvHotTrack = 0x5;
static const Shortint csvShadow = 0x6;
static const Shortint csvTransparentBorder = 0x7;
static const Shortint cxContainerStyleValueCount = 0x8;
extern PACKAGE AnsiString cxContainerStyleValueNameA[8];
extern PACKAGE Graphics::TColor cxContainerShadowColor;
extern PACKAGE TGetScrollBarInfo GetScrollBarInfoProc;
extern PACKAGE TcxMouseButton __fastcall ButtonTocxButton(Controls::TMouseButton Button);
extern PACKAGE bool __fastcall CheckParentsNativeHandle(Controls::TWinControl* AControl, HWND ANativeHandle);
extern PACKAGE AnsiString __fastcall cxContainerStyleValuesToStr(const TcxContainerStyleValues AStyleValues, TcxContainerStyle* AStyle);
extern PACKAGE void __fastcall DrawContainerShadow(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ARect);
extern PACKAGE void __fastcall ExtendRect(Types::TRect &Rect, const Types::TRect &AExtension);
extern PACKAGE Types::TRect __fastcall GetControlRect(Controls::TControl* AControl);
extern PACKAGE System::TObject* __fastcall GetInnerControlContainer(System::TObject* AObject);
extern PACKAGE bool __fastcall HasHandle(Controls::TWinControl* AControl, HWND AHandle);
extern PACKAGE bool __fastcall HasNativeHandle(Controls::TWinControl* AControl, HWND ANativeHandle);
extern PACKAGE bool __fastcall InternalCompareString(const AnsiString S1, const AnsiString S2, bool ACaseSensitive);
extern PACKAGE Types::TPoint __fastcall InternalGetCursorPos();
extern PACKAGE Classes::TShiftState __fastcall InternalGetShiftState(void);
extern PACKAGE void __fastcall InternalInvalidate(HWND AHandle, const Types::TRect &AOuterRect, const Types::TRect &AInternalRect, bool AEraseBackground = false);
extern PACKAGE void __fastcall InternalInvalidateRect(Controls::TWinControl* AControl, const Types::TRect &R, bool AEraseBackground);
extern PACKAGE bool __fastcall InternalIsWindowVisible(Controls::TWinControl* AControl);
extern PACKAGE bool __fastcall IsChildWindow(Controls::TWinControl* AParent, HWND AChildHandle);
extern PACKAGE Classes::TShiftState __fastcall MouseButtonToShift(Controls::TMouseButton Button);
extern PACKAGE HWND __fastcall NativeHandle(HWND Handle);
extern PACKAGE Cxgraphics::TcxScreenCanvas* __fastcall ScreenCanvas(void);
extern PACKAGE void __fastcall SetWindowRegion(Controls::TWinControl* AControl, Types::PRect PR);
extern PACKAGE void __fastcall SetWindowShadowRegion(HWND AWindowHandle, const Types::TRect &AOuterRect, const Types::TRect &AInnerRect, const Types::TRect &R, bool ANativeStyle, bool AShadow, Types::PRect APExcludeRect = (void *)(0x0));
extern PACKAGE bool __fastcall UsecxScrollBars(void);
extern PACKAGE bool __fastcall AreVisualStylesMustBeUsed(bool ANativeStyle, Dxthememanager::TdxThemedObjectType AThemedObjectType);
extern PACKAGE Types::TRect __fastcall GetSizeGripRect(_di_IcxContainerInnerControl AControl);

}	/* namespace Cxcontainer */
using namespace Cxcontainer;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxContainer
