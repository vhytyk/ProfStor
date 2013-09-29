// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'dxDockControl.pas' rev: 6.00

#ifndef dxDockControlHPP
#define dxDockControlHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxLookAndFeels.hpp>	// Pascal unit
#include <IniFiles.hpp>	// Pascal unit
#include <ImgList.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Dxdockcontrol
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TdxDockingState { dsDestroyed, dsUndocked, dsHidden, dsDocked, dsFloating };
#pragma option pop

#pragma option push -b-
enum TdxDockingTypeEx { dtNone, dtClient, dtLeft, dtTop, dtRight, dtBottom };
#pragma option pop

typedef TdxDockingTypeEx TdxDockingType;

typedef Set<TdxDockingType, dtClient, dtBottom>  TdxDockingTypes;

#pragma option push -b-
enum TdxZoneDirection { zdUndefined, zdVertical, zdHorizontal };
#pragma option pop

class DELPHICLASS TdxZone;
class DELPHICLASS TdxCustomDockControl;
#pragma option push -b-
enum TdxCaptionButton { cbMaximize, cbHide, cbClose };
#pragma option pop

typedef Set<TdxCaptionButton, cbMaximize, cbClose>  TdxCaptionButtons;

class DELPHICLASS TdxDockControlPainter;
class DELPHICLASS TdxDockSite;
class DELPHICLASS TdxTabContainerDockSite;
#pragma option push -b-
enum TdxEdgesType { etStandard, etFlat, etRaisedInner, etRaisedOuter, etSunkenInner, etSunkenOuter };
#pragma option pop

#pragma option push -b-
enum TdxEdgePosition { epLeft, epTop, epRight, epBottom, epTopLeft, epBottomRight, epRect };
#pragma option pop

typedef Set<TdxEdgePosition, epLeft, epRect>  TdxEdgePositions;

#pragma option push -b-
enum TdxRotationAngle { ra0, raPlus90, raMinus90, ra180 };
#pragma option pop

#pragma option push -b-
enum TdxAutoHidePosition { ahpLeft, ahpTop, ahpRight, ahpBottom };
#pragma option pop

class PASCALIMPLEMENTATION TdxDockControlPainter : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	TdxCustomDockControl* FDockControl;
	TdxDockSite* __fastcall GetAutoHideHostSite(void);
	TdxTabContainerDockSite* __fastcall GetTabContainer(void);
	
protected:
	/* virtual class method */ virtual void __fastcall AssignDefaultColor(TMetaClass* vmt);
	/* virtual class method */ virtual void __fastcall AssignDefaultFont(TMetaClass* vmt);
	/* virtual class method */ virtual void __fastcall CreateColors(TMetaClass* vmt);
	/* virtual class method */ virtual void __fastcall RefreshColors(TMetaClass* vmt);
	/* virtual class method */ virtual void __fastcall ReleaseColors(TMetaClass* vmt);
	/*         class method */ static Graphics::TColor __fastcall LightColor(TMetaClass* vmt, Graphics::TColor AColor);
	/*         class method */ static Graphics::TColor __fastcall LightLightColor(TMetaClass* vmt, Graphics::TColor AColor);
	/*         class method */ static Graphics::TColor __fastcall DarkColor(TMetaClass* vmt, Graphics::TColor AColor);
	/*         class method */ static Graphics::TColor __fastcall DarkDarkColor(TMetaClass* vmt, Graphics::TColor AColor);
	/*         class method */ static void __fastcall DrawColorEdge(TMetaClass* vmt, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, Graphics::TColor AColor, TdxEdgesType AEdgesType, TdxEdgePositions AEdgePositios);
	/*         class method */ static void __fastcall DrawImage(TMetaClass* vmt, Graphics::TCanvas* ACanvas, Controls::TImageList* AImageList, int AImageIndex, const Types::TRect &R);
	/*         class method */ static bool __fastcall RectInRect(TMetaClass* vmt, const Types::TRect &R1, const Types::TRect &R2);
	/*         class method */ static void __fastcall RotateBitmap(TMetaClass* vmt, Graphics::TBitmap* ABitmap, TdxRotationAngle Angle);
	virtual Graphics::TColor __fastcall GetColor(void);
	virtual Graphics::TFont* __fastcall GetFont(void);
	virtual Graphics::TColor __fastcall GetBorderColor(void);
	virtual Graphics::TColor __fastcall GetCaptionColor(bool IsActive);
	virtual Graphics::TFont* __fastcall GetCaptionFont(bool IsActive);
	virtual Graphics::TColor __fastcall GetCaptionFontColor(bool IsActive);
	virtual Graphics::TColor __fastcall GetCaptionSignColor(bool IsActive, bool IsDown, bool IsHot);
	virtual Graphics::TColor __fastcall GetTabsColor(void);
	virtual Graphics::TColor __fastcall GetTabColor(bool IsActive);
	virtual Graphics::TFont* __fastcall GetTabFont(bool IsActive);
	virtual Graphics::TColor __fastcall GetTabFontColor(bool IsActive);
	virtual Graphics::TColor __fastcall GetTabsScrollButtonsColor(void);
	virtual Graphics::TColor __fastcall GetTabsScrollButtonsSignColor(bool IsEnable);
	virtual Graphics::TColor __fastcall GetHideBarColor(void);
	virtual Graphics::TColor __fastcall GetHideBarButtonColor(void);
	virtual Graphics::TFont* __fastcall GetHideBarButtonFont(void);
	virtual Graphics::TColor __fastcall GetHideBarButtonFontColor(void);
	
public:
	__fastcall TdxDockControlPainter(TdxCustomDockControl* ADockControl);
	virtual bool __fastcall CanVerticalCaption(void);
	virtual int __fastcall GetBorderWidth(void);
	virtual int __fastcall GetCaptionButtonSize(void);
	virtual int __fastcall GetCaptionHeight(void);
	virtual int __fastcall GetCaptionHorizInterval(void);
	virtual int __fastcall GetCaptionVertInterval(void);
	int __fastcall GetDefaultImageHeight(void);
	int __fastcall GetDefaultImageWidth(void);
	int __fastcall GetImageHeight(void);
	int __fastcall GetImageWidth(void);
	bool __fastcall IsValidImageIndex(int AIndex);
	virtual void __fastcall DrawBorder(Graphics::TCanvas* ACanvas, const Types::TRect &ARect);
	virtual void __fastcall DrawCaption(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool IsActive);
	virtual void __fastcall DrawCaptionText(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool IsActive);
	virtual void __fastcall DrawCaptionButtonSelection(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool IsActive, bool IsDown, bool IsHot);
	virtual void __fastcall DrawCaptionCloseButton(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool IsActive, bool IsDown, bool IsHot, bool IsSwitched);
	virtual void __fastcall DrawCaptionHideButton(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool IsActive, bool IsDown, bool IsHot, bool IsSwitched);
	virtual void __fastcall DrawCaptionMaximizeButton(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool IsActive, bool IsDown, bool IsHot, bool IsSwitched);
	virtual void __fastcall DrawClient(Graphics::TCanvas* ACanvas, const Types::TRect &ARect);
	virtual int __fastcall GetTabVertInterval(void);
	virtual int __fastcall GetTabHorizInterval(void);
	virtual int __fastcall GetTabsButtonSize(void);
	virtual int __fastcall GetTabsHeight(void);
	virtual void __fastcall DrawTabs(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const Types::TRect &AActiveTabRect);
	virtual void __fastcall DrawTab(Graphics::TCanvas* ACanvas, TdxCustomDockControl* AControl, const Types::TRect &ARect, bool IsActive);
	virtual void __fastcall DrawTabContent(Graphics::TCanvas* ACanvas, TdxCustomDockControl* AControl, const Types::TRect &ARect, bool IsActive);
	virtual void __fastcall DrawTabsNextTabButton(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool IsDown, bool IsHot, bool IsEnable);
	virtual void __fastcall DrawTabsPrevTabButton(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool IsDown, bool IsHot, bool IsEnable);
	virtual void __fastcall DrawTabsButtonSelection(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool IsDown, bool IsHot, bool IsEnable);
	virtual int __fastcall GetHideBarHeight(void);
	virtual int __fastcall GetHideBarWidth(void);
	virtual int __fastcall GetHideBarVertInterval(void);
	virtual int __fastcall GetHideBarHorizInterval(void);
	virtual void __fastcall DrawHideBar(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, TdxAutoHidePosition APosition);
	virtual void __fastcall DrawHideBarButton(Graphics::TCanvas* ACanvas, TdxCustomDockControl* AControl, const Types::TRect &ARect, TdxAutoHidePosition APosition);
	virtual void __fastcall DrawHideBarButtonContent(Graphics::TCanvas* ACanvas, TdxCustomDockControl* AControl, const Types::TRect &ARect, TdxAutoHidePosition APosition);
	virtual void __fastcall DrawHideBarButtonImage(Graphics::TCanvas* ACanvas, TdxCustomDockControl* AControl, const Types::TRect &ARect);
	virtual void __fastcall DrawHideBarButtonText(Graphics::TCanvas* ACanvas, TdxCustomDockControl* AControl, const Types::TRect &ARect, TdxAutoHidePosition APosition);
	__property TdxDockSite* AutoHideHostSite = {read=GetAutoHideHostSite};
	__property TdxCustomDockControl* DockControl = {read=FDockControl};
	__property TdxTabContainerDockSite* TabContainer = {read=GetTabContainer};
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxDockControlPainter(void) { }
	#pragma option pop
	
};


#pragma pack(push, 4)
struct TdxDockPosition
{
	int DockIndex;
	TdxDockingTypeEx DockType;
	int OriginalHeight;
	int OriginalWidth;
	TdxCustomDockControl* Parent;
	TdxCustomDockControl* SiblingAfter;
	TdxCustomDockControl* SiblingBefore;
} ;
#pragma pack(pop)

typedef void __fastcall (__closure *TdxActivateEvent)(TdxCustomDockControl* Sender, bool Active);

typedef void __fastcall (__closure *TdxDockControlNotifyEvent)(TdxCustomDockControl* Sender);

typedef void __fastcall (__closure *TdxCanResizeEvent)(TdxCustomDockControl* Sender, int NewWidth, int NewHeight, bool &Resize);

typedef void __fastcall (__closure *TdxDockControlCloseQueryEvent)(TdxCustomDockControl* Sender, bool &CanClose);

class DELPHICLASS TdxFloatDockSite;
typedef void __fastcall (__closure *TdxCreateFloatSiteEvent)(TdxCustomDockControl* Sender, TdxFloatDockSite* AFloatSite);

class DELPHICLASS TdxLayoutDockSite;
typedef void __fastcall (__closure *TdxCreateLayoutSiteEvent)(TdxCustomDockControl* Sender, TdxLayoutDockSite* ALayoutSite);

class DELPHICLASS TdxSideContainerDockSite;
typedef void __fastcall (__closure *TdxCreateSideContainerEvent)(TdxCustomDockControl* Sender, TdxSideContainerDockSite* ASideContainer);

typedef void __fastcall (__closure *TdxCreateTabContainerEvent)(TdxCustomDockControl* Sender, TdxTabContainerDockSite* ATabContainer);

typedef void __fastcall (__closure *TdxCustomDrawSelectionEvent)(TdxCustomDockControl* Sender, HDC DC, TdxZone* Zone, const Types::TRect &ARect, bool Erasing, bool &Handled);

typedef void __fastcall (__closure *TdxDockEvent)(TdxCustomDockControl* Sender, TdxCustomDockControl* Site, TdxDockingType ADockType, int AIndex);

typedef void __fastcall (__closure *TdxDockingEvent)(TdxCustomDockControl* Sender, TdxZone* Zone, int X, int Y, bool &Accept);

typedef void __fastcall (__closure *TdxEndDockingEvent)(TdxCustomDockControl* Sender, TdxZone* Zone, int X, int Y);

typedef void __fastcall (__closure *TdxResizingEvent)(TdxCustomDockControl* Sender, TdxZone* Zone, int X, int Y);

typedef void __fastcall (__closure *TdxGetAutoHidePositionEvent)(TdxCustomDockControl* Sender, TdxAutoHidePosition &APosition);

typedef void __fastcall (__closure *TdxMakeFloatingEvent)(TdxCustomDockControl* Sender, int X, int Y);

typedef void __fastcall (__closure *TdxDockPositionEvent)(TdxCustomDockControl* Sender, TdxDockPosition &APosition);

typedef void __fastcall (__closure *TdxStartDockingEvent)(TdxCustomDockControl* Sender, int X, int Y);

typedef void __fastcall (__closure *TdxUnDockEvent)(TdxCustomDockControl* Sender, TdxCustomDockControl* Site);

typedef void __fastcall (__closure *TdxUpdateZonesEvent)(TdxCustomDockControl* Sender, Classes::TList* AZones);

class DELPHICLASS TdxDockingController;
class DELPHICLASS TdxContainerDockSite;
class DELPHICLASS TdxDockSiteAutoHideContainer;
class DELPHICLASS TdxFloatForm;
class PASCALIMPLEMENTATION TdxCustomDockControl : public Controls::TCustomControl 
{
	typedef Controls::TCustomControl inherited;
	
private:
	TdxDockingTypes FAllowDock;
	TdxDockingTypes FAllowDockClients;
	bool FAllowFloating;
	bool FAutoHide;
	Graphics::TBitmap* FCanvasBitmap;
	TdxCaptionButtons FCaptionButtons;
	#pragma pack(push, 1)
	Types::TPoint FCursorPoint;
	#pragma pack(pop)
	
	bool FDestroyed;
	bool FDockable;
	Classes::TList* FDockControls;
	#pragma pack(push, 1)
	Types::TPoint FDockingOrigin;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TPoint FDockingPoint;
	#pragma pack(pop)
	
	TdxZone* FDockingTargetZone;
	TdxDockingTypeEx FDockType;
	Classes::TList* FDockZones;
	int FImageIndex;
	bool FManagerColor;
	bool FManagerFont;
	int FOriginalHeight;
	int FOriginalWidth;
	TdxDockControlPainter* FPainter;
	TdxCustomDockControl* FParentDockControl;
	Classes::TList* FResizeZones;
	#pragma pack(push, 1)
	Types::TPoint FResizingOrigin;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TPoint FResizingPoint;
	#pragma pack(pop)
	
	TdxZone* FResizingSourceZone;
	Controls::TControl* FSavedCaptureControl;
	bool FShowCaption;
	#pragma pack(push, 1)
	Types::TPoint FSourcePoint;
	#pragma pack(pop)
	
	int FUpdateLayoutLock;
	int FUpdateVisibilityLock;
	bool FCaptionIsDown;
	bool FCloseButtonIsDown;
	bool FCloseButtonIsHot;
	bool FHideButtonIsDown;
	bool FHideButtonIsHot;
	bool FMaximizeButtonIsDown;
	bool FMaximizeButtonIsHot;
	#pragma pack(push, 1)
	Types::TRect FCaptionRect;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect FCaptionTextRect;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect FCaptionCloseButtonRect;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect FCaptionHideButtonRect;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect FCaptionMaximizeButtonRect;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect FSavedClientRect;
	#pragma pack(pop)
	
	bool FStoredAutoHide;
	TdxDockPosition FStoredPosition;
	bool FUseDoubleBuffer;
	#pragma pack(push, 1)
	Types::TRect FWindowRect;
	#pragma pack(pop)
	
	TdxActivateEvent FOnActivate;
	TdxDockControlNotifyEvent FOnAutoHideChanging;
	TdxDockControlNotifyEvent FOnAutoHideChanged;
	TdxCanResizeEvent FOnCanResize;
	TdxDockControlNotifyEvent FOnClose;
	TdxDockControlCloseQueryEvent FOnCloseQuery;
	TdxCreateFloatSiteEvent FOnCreateFloatSite;
	TdxCreateLayoutSiteEvent FOnCreateLayoutSite;
	TdxCreateSideContainerEvent FOnCreateSideContainer;
	TdxCreateTabContainerEvent FOnCreateTabContainer;
	TdxCustomDrawSelectionEvent FOnCustomDrawDockingSelection;
	TdxCustomDrawSelectionEvent FOnCustomDrawResizingSelection;
	TdxDockEvent FOnDock;
	TdxDockingEvent FOnDocking;
	TdxEndDockingEvent FOnEndDocking;
	TdxResizingEvent FOnEndResizing;
	TdxGetAutoHidePositionEvent FOnGetAutoHidePosition;
	TdxDockControlNotifyEvent FOnLayoutChanged;
	TdxMakeFloatingEvent FOnMakeFloating;
	TdxDockControlNotifyEvent FOnParentChanged;
	TdxDockControlNotifyEvent FOnParentChanging;
	TdxResizingEvent FOnResizing;
	TdxDockPositionEvent FOnRestoreDockPosition;
	TdxStartDockingEvent FOnStartDocking;
	TdxResizingEvent FOnStartResizing;
	TdxDockPositionEvent FOnStoreDockPosition;
	TdxUnDockEvent FOnUnDock;
	TdxUpdateZonesEvent FOnUpdateDockZones;
	TdxUpdateZonesEvent FOnUpdateResizeZones;
	TdxDockControlNotifyEvent FOnVisibleChanged;
	TdxDockControlNotifyEvent FOnVisibleChanging;
	HIDESBASE bool __fastcall IsColorStored(void);
	HIDESBASE bool __fastcall IsFontStored(void);
	TdxDockingController* __fastcall GetController(void);
	int __fastcall GetDockIndex(void);
	int __fastcall GetDockLevel(void);
	Types::TRect __fastcall GetDockingRect();
	TdxDockingState __fastcall GetDockState(void);
	TdxCustomDockControl* __fastcall GetChild(int Index);
	int __fastcall GetChildCount(void);
	Controls::TImageList* __fastcall GetImages(void);
	TdxDockControlPainter* __fastcall GetPainter(void);
	void __fastcall SetAllowDock(const TdxDockingTypes Value);
	void __fastcall SetAllowDockClients(const TdxDockingTypes Value);
	void __fastcall SetAllowFloating(const bool Value);
	void __fastcall SetAutoHide(const bool Value);
	void __fastcall SetCaptionButtons(TdxCaptionButtons Value);
	void __fastcall SetDockable(const bool Value);
	void __fastcall SetDockType(TdxDockingType Value);
	void __fastcall SetImageIndex(const int Value);
	void __fastcall SetManagerColor(const bool Value);
	void __fastcall SetManagerFont(const bool Value);
	void __fastcall SetParentDockControl(TdxCustomDockControl* Value);
	void __fastcall SetShowCaption(const bool Value);
	void __fastcall SetUseDoubleBuffer(const bool Value);
	void __fastcall ReadDockType(Classes::TReader* Reader);
	void __fastcall ReadOriginalWidth(Classes::TReader* Reader);
	void __fastcall ReadOriginalHeight(Classes::TReader* Reader);
	void __fastcall WriteDockType(Classes::TWriter* Writer);
	void __fastcall WriteOriginalWidth(Classes::TWriter* Writer);
	void __fastcall WriteOriginalHeight(Classes::TWriter* Writer);
	void __fastcall AddDockControl(TdxCustomDockControl* AControl, int AIndex);
	void __fastcall RemoveDockControl(TdxCustomDockControl* AControl);
	int __fastcall IndexOfControl(TdxCustomDockControl* AControl);
	void __fastcall ClearZones(Classes::TList* AZones);
	HIDESBASE MESSAGE void __fastcall CMDesignHitTest(Messages::TWMMouse &Message);
	HIDESBASE MESSAGE void __fastcall CMFontChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMColorChanged(Messages::TMessage &Message);
	MESSAGE void __fastcall CMTextChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMVisibleChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMMouseLeave(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CNKeyDown(Messages::TWMKey &Message);
	HIDESBASE MESSAGE void __fastcall CNKeyUp(Messages::TWMKey &Message);
	HIDESBASE MESSAGE void __fastcall WMContextMenu(Messages::TWMContextMenu &Message);
	HIDESBASE MESSAGE void __fastcall WMEraseBkgnd(Messages::TWMEraseBkgnd &Message);
	MESSAGE void __fastcall WMMouseActivate(Messages::TWMMouseActivate &Message);
	HIDESBASE MESSAGE void __fastcall WMMove(Messages::TWMMove &Message);
	HIDESBASE MESSAGE void __fastcall WMMouseMove(Messages::TWMMouse &Message);
	HIDESBASE MESSAGE void __fastcall WMLButtonDown(Messages::TWMMouse &Message);
	HIDESBASE MESSAGE void __fastcall WMLButtonUp(Messages::TWMMouse &Message);
	HIDESBASE MESSAGE void __fastcall WMLButtonDblClk(Messages::TWMMouse &Message);
	HIDESBASE MESSAGE void __fastcall WMNCCalcSize(Messages::TWMNCCalcSize &Message);
	HIDESBASE MESSAGE void __fastcall WMNCHitTest(Messages::TWMNCHitTest &Message);
	HIDESBASE MESSAGE void __fastcall WMNCPaint(Messages::TWMNCPaint &Message);
	HIDESBASE MESSAGE void __fastcall WMSetCursor(Messages::TWMSetCursor &Message);
	HIDESBASE MESSAGE void __fastcall WMSize(Messages::TWMSize &Message);
	
protected:
	virtual void __fastcall AlignControls(Controls::TControl* AControl, Types::TRect &Rect);
	virtual void __fastcall CreateHandle(void);
	virtual void __fastcall DefineProperties(Classes::TFiler* Filer);
	virtual void __fastcall Loaded(void);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	virtual void __fastcall ReadState(Classes::TReader* Reader);
	virtual void __fastcall SetParent(Controls::TWinControl* AParent);
	DYNAMIC void __fastcall VisibleChanging(void);
	bool __fastcall IsDesigning(void);
	bool __fastcall IsDestroying(void);
	bool __fastcall IsLoading(void);
	void __fastcall CaptureMouse(void);
	void __fastcall ReleaseMouse(void);
	void __fastcall Modified(void);
	void __fastcall NoSelection(void);
	void __fastcall SelectComponent(Classes::TComponent* AComponent);
	AnsiString __fastcall UniqueName();
	virtual bool __fastcall CanResizing(int NewWidth, int NewHeight);
	virtual bool __fastcall CanResizeAtPos(const Types::TPoint &pt);
	bool __fastcall DoCustomDrawResizingSelection(HDC DC, TdxZone* AZone, const Types::TPoint &pt, bool Erasing);
	void __fastcall DoStartResize(const Types::TPoint &pt);
	void __fastcall DoEndResize(const Types::TPoint &pt);
	void __fastcall DoResizing(const Types::TPoint &pt);
	void __fastcall DrawResizingSelection(TdxZone* AZone, const Types::TPoint &pt, bool Erasing);
	virtual void __fastcall StartResize(const Types::TPoint &pt);
	virtual void __fastcall Resizing(const Types::TPoint &pt);
	virtual void __fastcall EndResize(const Types::TPoint &pt, bool Cancel);
	void __fastcall DoUpdateResizeZones(void);
	virtual void __fastcall UpdateControlResizeZones(TdxCustomDockControl* AControl);
	void __fastcall UpdateResizeZones(void);
	TdxCustomDockControl* __fastcall GetDockingTargetControlAtPos(const Types::TPoint &pt);
	Types::TRect __fastcall GetFloatDockRect(const Types::TPoint &pt);
	bool __fastcall DoCustomDrawDockingSelection(HDC DC, TdxZone* AZone, const Types::TRect &R, bool Erasing);
	void __fastcall DoStartDocking(const Types::TPoint &pt);
	void __fastcall DoEndDocking(const Types::TPoint &pt);
	void __fastcall DoDocking(const Types::TPoint &pt, TdxZone* TargetZone, bool &Accept);
	void __fastcall DrawDockingSelection(TdxZone* AZone, const Types::TPoint &pt, bool Erasing);
	virtual void __fastcall StartDocking(const Types::TPoint &pt);
	virtual void __fastcall Docking(const Types::TPoint &pt);
	virtual void __fastcall EndDocking(const Types::TPoint &pt, bool Cancel);
	virtual void __fastcall CheckDockRules(void);
	virtual void __fastcall CheckDockClientsRules(void);
	void __fastcall DoUpdateDockZones(void);
	virtual void __fastcall UpdateControlDockZones(TdxCustomDockControl* AControl, int AZoneWidth);
	void __fastcall UpdateDockZones(void);
	void __fastcall DoParentChanged(void);
	void __fastcall DoParentChanging(void);
	virtual void __fastcall IncludeToDock(TdxCustomDockControl* AControl, TdxDockingType AType, int Index);
	virtual void __fastcall ExcludeFromDock(void);
	virtual void __fastcall CreateLayout(TdxCustomDockControl* AControl, TdxDockingType AType, int Index);
	virtual void __fastcall DestroyLayout(TdxCustomDockControl* AControl);
	virtual void __fastcall RemoveFromLayuot(void);
	virtual void __fastcall UpdateLayout(void);
	void __fastcall DoLayoutChanged(void);
	void __fastcall BeginUpdateLayout(void);
	void __fastcall EndUpdateLayout(void);
	virtual void __fastcall LoadLayoutFromCustomIni(Inifiles::TCustomIniFile* AIniFlie, TdxCustomDockControl* AParentControl, AnsiString ASection);
	virtual void __fastcall SaveLayoutToCustomIni(Inifiles::TCustomIniFile* AIniFlie, AnsiString ASection);
	__property int UpdateLayoutLock = {read=FUpdateLayoutLock, nodefault};
	bool __fastcall InDockControl(TdxCustomDockControl* AControl);
	virtual TdxCustomDockControl* __fastcall GetParentDockControl(void);
	virtual Forms::TCustomForm* __fastcall GetParentForm(void);
	virtual bool __fastcall GetParentFormActive(void);
	virtual TdxCustomDockControl* __fastcall GetTopMostDockControl(void);
	void __fastcall DoCreateLayoutSite(TdxLayoutDockSite* ASite);
	virtual TdxLayoutDockSite* __fastcall GetLayoutDockSite(void);
	void __fastcall CreateContainerLayout(TdxContainerDockSite* AContainer, TdxCustomDockControl* AControl, TdxDockingType AType, int Index);
	virtual TdxContainerDockSite* __fastcall GetContainer(void);
	virtual bool __fastcall CanAcceptSideContainerItems(TdxSideContainerDockSite* AContainer);
	void __fastcall DoCreateSideContainerSite(TdxSideContainerDockSite* ASite);
	virtual void __fastcall CreateSideContainerLayout(TdxCustomDockControl* AControl, TdxDockingType AType, int Index);
	virtual void __fastcall DoMaximize(void);
	virtual TdxSideContainerDockSite* __fastcall GetSideContainer(void);
	virtual TdxCustomDockControl* __fastcall GetSideContainerItem(void);
	virtual int __fastcall GetSideContainerIndex(void);
	virtual int __fastcall GetMinimizedHeight(void);
	virtual int __fastcall GetMinimizedWidth(void);
	virtual bool __fastcall CanAcceptTabContainerItems(TdxTabContainerDockSite* AContainer);
	void __fastcall DoCreateTabContainerSite(TdxTabContainerDockSite* ASite);
	virtual void __fastcall CreateTabContainerLayout(TdxCustomDockControl* AControl, TdxDockingType AType, int Index);
	virtual TdxTabContainerDockSite* __fastcall GetTabContainer(void);
	virtual void __fastcall AutoHideChanged(void);
	void __fastcall DoAutoHideChanged(void);
	void __fastcall DoAutoHideChanging(void);
	virtual TdxAutoHidePosition __fastcall GetControlAutoHidePosition(TdxCustomDockControl* AControl);
	virtual TdxDockSite* __fastcall GetAutoHideHostSite(void);
	virtual TdxDockSiteAutoHideContainer* __fastcall GetAutoHideContainer(void);
	virtual TdxCustomDockControl* __fastcall GetAutoHideControl(void);
	TdxAutoHidePosition __fastcall GetAutoHidePosition(void);
	virtual void __fastcall ChangeAutoHide(void);
	virtual TdxDockSite* __fastcall GetAutoSizeHostSite(void);
	void __fastcall DoCreateFloatSite(TdxFloatDockSite* ASite);
	virtual TdxFloatDockSite* __fastcall GetFloatDockSite(void);
	virtual TdxFloatForm* __fastcall GetFloatForm(void);
	virtual bool __fastcall GetFloatFormActive(void);
	virtual bool __fastcall GetFloatFormVisible(void);
	virtual void __fastcall StoreDockPosition(const Types::TPoint &pt);
	virtual void __fastcall RestoreDockPosition(const Types::TPoint &pt);
	virtual void __fastcall UpdateCaption(void);
	virtual void __fastcall AdjustControlBounds(TdxCustomDockControl* AControl);
	virtual void __fastcall UpdateControlOriginalSize(TdxCustomDockControl* AControl);
	void __fastcall UpdateOriginalSize(void);
	virtual void __fastcall Activate(void);
	virtual void __fastcall DoActiveChanged(bool AActive);
	virtual bool __fastcall IsActive(void);
	virtual void __fastcall DoClose(void);
	virtual bool __fastcall CanDestroy(void);
	virtual void __fastcall DoDestroy(void);
	virtual void __fastcall ChildVisibilityChanged(TdxCustomDockControl* Sender);
	void __fastcall DoVisibleChanged(void);
	void __fastcall DoVisibleChanging(void);
	void __fastcall BeginUpdateVisibility(void);
	void __fastcall EndUpdateVisibility(void);
	void __fastcall SetVisibility(bool Value);
	virtual void __fastcall UpdateAutoHideControlsVisibility(void);
	virtual void __fastcall UpdateLayoutControlsVisibility(void);
	virtual void __fastcall UpdateParentControlsVisibility(void);
	virtual void __fastcall UpdateRelatedControlsVisibility(void);
	__property int UpdateVisibilityLock = {read=FUpdateVisibilityLock, nodefault};
	Types::TPoint __fastcall ClientToWindow(const Types::TPoint &pt);
	Types::TPoint __fastcall ScreenToWindow(const Types::TPoint &pt);
	Types::TPoint __fastcall WindowToClient(const Types::TPoint &pt);
	Types::TPoint __fastcall WindowToScreen(const Types::TPoint &pt);
	virtual void __fastcall CalculateNC(Types::TRect &ARect);
	void __fastcall InvalidateNC(bool ANeedRecalculate);
	void __fastcall NCChanged(void);
	void __fastcall BeginUpdateNC(void);
	void __fastcall EndUpdateNC(void);
	bool __fastcall CanUpdateNC(void);
	bool __fastcall CanCalculateNC(void);
	virtual bool __fastcall HasBorder(void);
	virtual bool __fastcall HasCaption(void);
	virtual bool __fastcall HasCaptionCloseButton(void);
	virtual bool __fastcall HasCaptionHideButton(void);
	virtual bool __fastcall HasCaptionMaximizeButton(void);
	virtual bool __fastcall IsCaptionActive(void);
	virtual bool __fastcall IsCaptionVertical(void);
	bool __fastcall IsCaptionPoint(const Types::TPoint &pt);
	bool __fastcall IsCaptionCloseButtonPoint(const Types::TPoint &pt);
	bool __fastcall IsCaptionHideButtonPoint(const Types::TPoint &pt);
	bool __fastcall IsCaptionMaximizeButtonPoint(const Types::TPoint &pt);
	virtual void __fastcall NCPaint(Graphics::TCanvas* ACanvas);
	virtual void __fastcall Paint(void);
	__property TdxDockControlPainter* Painter = {read=GetPainter};
	__property Types::TRect CaptionRect = {read=FCaptionRect};
	__property Types::TRect CaptionTextRect = {read=FCaptionTextRect};
	__property Types::TRect CaptionCloseButtonRect = {read=FCaptionCloseButtonRect};
	__property Types::TRect CaptionHideButtonRect = {read=FCaptionHideButtonRect};
	__property Types::TRect CaptionMaximizeButtonRect = {read=FCaptionMaximizeButtonRect};
	__property Types::TRect WindowRect = {read=FWindowRect};
	__property bool CaptionIsDown = {read=FCaptionIsDown, nodefault};
	__property bool CloseButtonIsDown = {read=FCloseButtonIsDown, nodefault};
	__property bool CloseButtonIsHot = {read=FCloseButtonIsHot, nodefault};
	__property bool HideButtonIsDown = {read=FHideButtonIsDown, nodefault};
	__property bool HideButtonIsHot = {read=FHideButtonIsHot, nodefault};
	__property bool MaximizeButtonIsDown = {read=FMaximizeButtonIsDown, nodefault};
	__property bool MaximizeButtonIsHot = {read=FMaximizeButtonIsHot, nodefault};
	__property Types::TPoint CursorPoint = {read=FCursorPoint, write=FCursorPoint};
	__property Types::TPoint DockingOrigin = {read=FDockingOrigin};
	__property Types::TPoint DockingPoint = {read=FDockingPoint};
	__property Types::TRect DockingRect = {read=GetDockingRect};
	__property TdxZone* DockingTargetZone = {read=FDockingTargetZone};
	__property Types::TPoint ResizingOrigin = {read=FResizingOrigin};
	__property Types::TPoint ResizingPoint = {read=FResizingPoint};
	__property TdxZone* ResizingSourceZone = {read=FResizingSourceZone};
	__property Types::TPoint SourcePoint = {read=FSourcePoint, write=FSourcePoint};
	__property bool StoredAutoHide = {read=FStoredAutoHide, nodefault};
	__property TdxDockPosition StoredPosition = {read=FStoredPosition};
	
public:
	__fastcall virtual TdxCustomDockControl(Classes::TComponent* AOwner);
	__fastcall virtual ~TdxCustomDockControl(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual void __fastcall BeforeDestruction(void);
	virtual void __fastcall SetBounds(int ALeft, int ATop, int AWidth, int AHeight);
	virtual bool __fastcall CanActive(void);
	virtual bool __fastcall CanAutoHide(void);
	virtual bool __fastcall CanDock(void);
	virtual bool __fastcall CanDockHost(TdxCustomDockControl* AControl, TdxDockingType AType);
	virtual bool __fastcall CanMaximize(void);
	virtual TdxZone* __fastcall GetDockZoneAtPos(TdxCustomDockControl* AControl, const Types::TPoint &pt);
	virtual TdxZone* __fastcall GetResizeZoneAtPos(const Types::TPoint &pt);
	void __fastcall Close(void);
	void __fastcall MakeFloating(void)/* overload */;
	void __fastcall MakeFloating(int XPos, int YPos)/* overload */;
	void __fastcall DockTo(TdxCustomDockControl* AControl, TdxDockingType AType, int AIndex);
	void __fastcall UnDock(void);
	__property TdxDockingTypes AllowDock = {read=FAllowDock, write=SetAllowDock, default=62};
	__property TdxDockingTypes AllowDockClients = {read=FAllowDockClients, write=SetAllowDockClients, default=62};
	__property bool AllowFloating = {read=FAllowFloating, write=SetAllowFloating, nodefault};
	__property bool AutoHide = {read=FAutoHide, write=SetAutoHide, nodefault};
	__property TdxDockSite* AutoHideHostSite = {read=GetAutoHideHostSite};
	__property TdxDockSiteAutoHideContainer* AutoHideContainer = {read=GetAutoHideContainer};
	__property TdxCustomDockControl* AutoHideControl = {read=GetAutoHideControl};
	__property TdxDockSite* AutoSizeHostSite = {read=GetAutoSizeHostSite};
	__property Caption ;
	__property TdxCaptionButtons CaptionButtons = {read=FCaptionButtons, write=SetCaptionButtons, default=7};
	__property int ChildCount = {read=GetChildCount, nodefault};
	__property TdxCustomDockControl* Children[int Index] = {read=GetChild};
	__property TdxContainerDockSite* Container = {read=GetContainer};
	__property TdxDockingController* Controller = {read=GetController};
	__property bool Dockable = {read=FDockable, write=SetDockable, default=1};
	__property int DockIndex = {read=GetDockIndex, nodefault};
	__property int DockLevel = {read=GetDockLevel, nodefault};
	__property TdxDockingState DockState = {read=GetDockState, nodefault};
	__property TdxDockingTypeEx DockType = {read=FDockType, nodefault};
	__property Classes::TList* DockZones = {read=FDockZones};
	__property TdxFloatForm* FloatForm = {read=GetFloatForm};
	__property bool FloatFormActive = {read=GetFloatFormActive, nodefault};
	__property bool FloatFormVisible = {read=GetFloatFormVisible, nodefault};
	__property TdxFloatDockSite* FloatDockSite = {read=GetFloatDockSite};
	__property int ImageIndex = {read=FImageIndex, write=SetImageIndex, default=-1};
	__property Controls::TImageList* Images = {read=GetImages};
	__property TdxLayoutDockSite* LayoutDockSite = {read=GetLayoutDockSite};
	__property int OriginalHeight = {read=FOriginalHeight, nodefault};
	__property int OriginalWidth = {read=FOriginalWidth, nodefault};
	__property TdxCustomDockControl* ParentDockControl = {read=GetParentDockControl};
	__property Forms::TCustomForm* ParentForm = {read=GetParentForm};
	__property bool ParentFormActive = {read=GetParentFormActive, nodefault};
	__property Classes::TList* ResizeZones = {read=FResizeZones, write=FResizeZones};
	__property bool ShowCaption = {read=FShowCaption, write=SetShowCaption, default=1};
	__property TdxSideContainerDockSite* SideContainer = {read=GetSideContainer};
	__property TdxCustomDockControl* SideContainerItem = {read=GetSideContainerItem};
	__property int SideContainerIndex = {read=GetSideContainerIndex, nodefault};
	__property TdxTabContainerDockSite* TabContainer = {read=GetTabContainer};
	__property TdxCustomDockControl* TopMostDockControl = {read=GetTopMostDockControl};
	__property bool UseDoubleBuffer = {read=FUseDoubleBuffer, write=SetUseDoubleBuffer, nodefault};
	__property TdxActivateEvent OnActivate = {read=FOnActivate, write=FOnActivate};
	__property TdxDockControlNotifyEvent OnAutoHideChanged = {read=FOnAutoHideChanged, write=FOnAutoHideChanged};
	__property TdxDockControlNotifyEvent OnAutoHideChanging = {read=FOnAutoHideChanging, write=FOnAutoHideChanging};
	__property TdxCanResizeEvent OnCanResize = {read=FOnCanResize, write=FOnCanResize};
	__property TdxDockControlNotifyEvent OnClose = {read=FOnClose, write=FOnClose};
	__property TdxDockControlCloseQueryEvent OnCloseQuery = {read=FOnCloseQuery, write=FOnCloseQuery};
	__property TdxCreateFloatSiteEvent OnCreateFloatSite = {read=FOnCreateFloatSite, write=FOnCreateFloatSite};
	__property TdxCreateLayoutSiteEvent OnCreateLayoutSite = {read=FOnCreateLayoutSite, write=FOnCreateLayoutSite};
	__property TdxCreateSideContainerEvent OnCreateSideContainer = {read=FOnCreateSideContainer, write=FOnCreateSideContainer};
	__property TdxCreateTabContainerEvent OnCreateTabContainer = {read=FOnCreateTabContainer, write=FOnCreateTabContainer};
	__property TdxCustomDrawSelectionEvent OnCustomDrawDockingSelection = {read=FOnCustomDrawDockingSelection, write=FOnCustomDrawDockingSelection};
	__property TdxCustomDrawSelectionEvent OnCustomDrawResizingSelection = {read=FOnCustomDrawResizingSelection, write=FOnCustomDrawResizingSelection};
	__property TdxDockEvent OnDock = {read=FOnDock, write=FOnDock};
	__property TdxDockingEvent OnDocking = {read=FOnDocking, write=FOnDocking};
	__property TdxEndDockingEvent OnEndDocking = {read=FOnEndDocking, write=FOnEndDocking};
	__property TdxResizingEvent OnEndResizing = {read=FOnEndResizing, write=FOnEndResizing};
	__property TdxGetAutoHidePositionEvent OnGetAutoHidePosition = {read=FOnGetAutoHidePosition, write=FOnGetAutoHidePosition};
	__property TdxDockControlNotifyEvent OnLayoutChanged = {read=FOnLayoutChanged, write=FOnLayoutChanged};
	__property TdxMakeFloatingEvent OnMakeFloating = {read=FOnMakeFloating, write=FOnMakeFloating};
	__property OnResize ;
	__property TdxResizingEvent OnResizing = {read=FOnResizing, write=FOnResizing};
	__property TdxDockPositionEvent OnRestoreDockPosition = {read=FOnRestoreDockPosition, write=FOnRestoreDockPosition};
	__property TdxStartDockingEvent OnStartDocking = {read=FOnStartDocking, write=FOnStartDocking};
	__property TdxResizingEvent OnStartResizing = {read=FOnStartResizing, write=FOnStartResizing};
	__property TdxDockPositionEvent OnStoreDockPosition = {read=FOnStoreDockPosition, write=FOnStoreDockPosition};
	__property TdxUnDockEvent OnUnDock = {read=FOnUnDock, write=FOnUnDock};
	__property TdxUpdateZonesEvent OnUpdateDockZones = {read=FOnUpdateDockZones, write=FOnUpdateDockZones};
	__property TdxUpdateZonesEvent OnUpdateResizeZones = {read=FOnUpdateResizeZones, write=FOnUpdateResizeZones};
	
__published:
	__property Color  = {stored=IsColorStored, default=-2147483643};
	__property Font  = {stored=IsFontStored};
	__property bool ManagerColor = {read=FManagerColor, write=SetManagerColor, default=1};
	__property bool ManagerFont = {read=FManagerFont, write=SetManagerFont, default=1};
	__property ParentColor  = {default=0};
	__property ParentFont  = {default=0};
	__property ParentShowHint  = {default=1};
	__property PopupMenu ;
	__property ShowHint ;
	__property OnContextPopup ;
	__property OnMouseDown ;
	__property OnMouseMove ;
	__property OnMouseUp ;
	__property TdxDockControlNotifyEvent OnParentChanged = {read=FOnParentChanged, write=FOnParentChanged};
	__property TdxDockControlNotifyEvent OnParentChanging = {read=FOnParentChanging, write=FOnParentChanging};
	__property TdxDockControlNotifyEvent OnVisibleChanged = {read=FOnVisibleChanged, write=FOnVisibleChanged};
	__property TdxDockControlNotifyEvent OnVisibleChanging = {read=FOnVisibleChanging, write=FOnVisibleChanging};
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TdxCustomDockControl(HWND ParentWindow) : Controls::TCustomControl(ParentWindow) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TdxZone : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	TdxCustomDockControl* FOwner;
	int FWidth;
	
protected:
	virtual TdxZoneDirection __fastcall GetDirection(void) = 0 ;
	virtual int __fastcall GetDockIndex(void);
	virtual TdxDockingType __fastcall GetDockType(void) = 0 ;
	virtual Types::TRect __fastcall GetRectangle(void) = 0 ;
	virtual int __fastcall GetWidth(void);
	virtual bool __fastcall CanConstrainedResize(int NewWidth, int NewHeight);
	virtual void __fastcall DoDock(TdxCustomDockControl* AControl);
	virtual void __fastcall DoResize(const Types::TPoint &StartPoint, const Types::TPoint &EndPoint);
	virtual void __fastcall DrawDockingSelection(HDC DC, TdxCustomDockControl* AControl, const Types::TPoint &pt);
	virtual void __fastcall DrawResizingSelection(HDC DC, const Types::TPoint &pt);
	
public:
	__fastcall TdxZone(TdxCustomDockControl* AOwner, int AWidth);
	virtual bool __fastcall CanDock(TdxCustomDockControl* AControl);
	virtual bool __fastcall CanResize(const Types::TPoint &StartPoint, const Types::TPoint &EndPoint);
	virtual Types::TRect __fastcall GetDockingSelection(TdxCustomDockControl* AControl);
	virtual Types::TRect __fastcall GetResizingSelection(const Types::TPoint &pt);
	virtual bool __fastcall IsZonePoint(const Types::TPoint &pt);
	/* virtual class method */ virtual bool __fastcall ValidateDockZone(TMetaClass* vmt, TdxCustomDockControl* AOwner, TdxCustomDockControl* AControl);
	/* virtual class method */ virtual bool __fastcall ValidateResizeZone(TMetaClass* vmt, TdxCustomDockControl* AOwner, TdxCustomDockControl* AControl);
	__property TdxZoneDirection Direction = {read=GetDirection, nodefault};
	__property TdxDockingType DockType = {read=GetDockType, nodefault};
	__property int DockIndex = {read=GetDockIndex, nodefault};
	__property TdxCustomDockControl* Owner = {read=FOwner};
	__property Types::TRect Rectangle = {read=GetRectangle};
	__property int Width = {read=GetWidth, nodefault};
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxZone(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TdxDockControlPainterClass;

typedef TMetaClass*TdxCustomDockControlClass;

class DELPHICLASS TdxCustomDockSite;
class PASCALIMPLEMENTATION TdxCustomDockSite : public TdxCustomDockControl 
{
	typedef TdxCustomDockControl inherited;
	
protected:
	DYNAMIC void __fastcall GetChildren(Classes::TGetChildProc Proc, Classes::TComponent* Root);
	DYNAMIC void __fastcall ValidateInsert(Classes::TComponent* AComponent);
	
__published:
	__property AllowDockClients  = {default=62};
	__property OnLayoutChanged ;
	__property OnUpdateDockZones ;
	__property OnUpdateResizeZones ;
public:
	#pragma option push -w-inl
	/* TdxCustomDockControl.Create */ inline __fastcall virtual TdxCustomDockSite(Classes::TComponent* AOwner) : TdxCustomDockControl(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TdxCustomDockControl.Destroy */ inline __fastcall virtual ~TdxCustomDockSite(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TdxCustomDockSite(HWND ParentWindow) : TdxCustomDockControl(ParentWindow) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TdxLayoutDockSite : public TdxCustomDockSite 
{
	typedef TdxCustomDockSite inherited;
	
private:
	HIDESBASE MESSAGE void __fastcall WMNCHitTest(Messages::TWMNCHitTest &Message);
	
protected:
	virtual void __fastcall SetParent(Controls::TWinControl* AParent);
	virtual void __fastcall UpdateControlDockZones(TdxCustomDockControl* AControl, int AZoneWidth);
	virtual TdxCustomDockControl* __fastcall GetSiblingDockControl(void);
	virtual bool __fastcall CanDestroy(void);
	
public:
	__fastcall virtual TdxLayoutDockSite(Classes::TComponent* AOwner);
	virtual void __fastcall BeforeDestruction(void);
	virtual bool __fastcall CanDockHost(TdxCustomDockControl* AControl, TdxDockingType AType);
	__property TdxCustomDockControl* SiblingDockControl = {read=GetSiblingDockControl};
	
__published:
	__property OnCreateLayoutSite ;
public:
	#pragma option push -w-inl
	/* TdxCustomDockControl.Destroy */ inline __fastcall virtual ~TdxLayoutDockSite(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TdxLayoutDockSite(HWND ParentWindow) : TdxCustomDockSite(ParentWindow) { }
	#pragma option pop
	
};


typedef void __fastcall (__closure *TdxActiveChildChangeEvent)(TdxContainerDockSite* Sender, TdxCustomDockControl* Child);

class PASCALIMPLEMENTATION TdxContainerDockSite : public TdxCustomDockSite 
{
	typedef TdxCustomDockSite inherited;
	
private:
	TdxCustomDockControl* FActiveChild;
	int FActiveChildIndex;
	TdxActiveChildChangeEvent FOnActiveChildChanged;
	int __fastcall GetActiveChildIndex(void);
	int __fastcall GetValidChildCount(void);
	TdxCustomDockControl* __fastcall GetValidChild(int Index);
	void __fastcall SetActiveChild(const TdxCustomDockControl* Value);
	void __fastcall SetActiveChildIndex(const int Value);
	
protected:
	virtual void __fastcall Loaded(void);
	virtual void __fastcall SetParent(Controls::TWinControl* AParent);
	virtual void __fastcall CreateLayout(TdxCustomDockControl* AControl, TdxDockingType AType, int Index);
	virtual void __fastcall DestroyLayout(TdxCustomDockControl* AControl);
	virtual void __fastcall UpdateLayout(void);
	virtual void __fastcall LoadLayoutFromCustomIni(Inifiles::TCustomIniFile* AIniFlie, TdxCustomDockControl* AParentControl, AnsiString ASection);
	virtual void __fastcall SaveLayoutToCustomIni(Inifiles::TCustomIniFile* AIniFlie, AnsiString ASection);
	virtual TdxAutoHidePosition __fastcall GetControlAutoHidePosition(TdxCustomDockControl* AControl);
	virtual void __fastcall ChildVisibilityChanged(TdxCustomDockControl* Sender);
	virtual void __fastcall DoActiveChildChanged(void);
	/* virtual class method */ virtual TdxDockingType __fastcall GetHeadDockType(TMetaClass* vmt);
	/* virtual class method */ virtual TdxDockingType __fastcall GetTailDockType(TMetaClass* vmt);
	TdxCustomDockControl* __fastcall GetFirstValidChild(void);
	int __fastcall GetFirstValidChildIndex(void);
	TdxCustomDockControl* __fastcall GetLastValidChild(void);
	int __fastcall GetLastValidChildIndex(void);
	TdxCustomDockControl* __fastcall GetNextValidChild(int AIndex);
	int __fastcall GetNextValidChildIndex(int AIndex);
	TdxCustomDockControl* __fastcall GetPrevValidChild(int AIndex);
	int __fastcall GetPrevValidChildIndex(int AIndex);
	virtual bool __fastcall IsValidActiveChild(TdxCustomDockControl* AControl);
	virtual bool __fastcall IsValidChild(TdxCustomDockControl* AControl);
	virtual void __fastcall ValidateActiveChild(int AIndex);
	
public:
	__fastcall virtual TdxContainerDockSite(Classes::TComponent* AOwner);
	virtual bool __fastcall CanContainerDockHost(TdxDockingType AType);
	virtual bool __fastcall CanDock(void);
	virtual bool __fastcall CanDockHost(TdxCustomDockControl* AControl, TdxDockingType AType);
	__property TdxCustomDockControl* ActiveChild = {read=FActiveChild, write=SetActiveChild};
	__property int ValidChildCount = {read=GetValidChildCount, nodefault};
	__property TdxCustomDockControl* ValidChildren[int Index] = {read=GetValidChild};
	
__published:
	__property int ActiveChildIndex = {read=GetActiveChildIndex, write=SetActiveChildIndex, nodefault};
	__property AllowDock  = {default=62};
	__property AllowFloating ;
	__property TdxActiveChildChangeEvent OnActiveChildChanged = {read=FOnActiveChildChanged, write=FOnActiveChildChanged};
	__property OnCanResize ;
	__property OnCreateFloatSite ;
	__property OnCustomDrawDockingSelection ;
	__property OnCustomDrawResizingSelection ;
	__property OnEndResizing ;
	__property OnResize ;
	__property OnResizing ;
	__property OnRestoreDockPosition ;
	__property OnStartResizing ;
	__property OnStoreDockPosition ;
public:
	#pragma option push -w-inl
	/* TdxCustomDockControl.Destroy */ inline __fastcall virtual ~TdxContainerDockSite(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TdxContainerDockSite(HWND ParentWindow) : TdxCustomDockSite(ParentWindow) { }
	#pragma option pop
	
};


typedef TMetaClass*TdxContainerDockSiteClass;

#pragma option push -b-
enum TdxTabContainerTabsPosition { tctpTop, tctpBottom };
#pragma option pop

typedef DynamicArray<Types::TRect >  dxDockControl__7;

class PASCALIMPLEMENTATION TdxTabContainerDockSite : public TdxContainerDockSite 
{
	typedef TdxContainerDockSite inherited;
	
private:
	int FFirstVisibleTabIndex;
	int FPressedTabIndex;
	TdxTabContainerTabsPosition FTabsPosition;
	#pragma pack(push, 1)
	Types::TRect FTabsRect;
	#pragma pack(pop)
	
	DynamicArray<Types::TRect >  FTabsRects;
	#pragma pack(push, 1)
	Types::TRect FTabsNextTabButtonRect;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect FTabsPrevTabButtonRect;
	#pragma pack(pop)
	
	bool FTabsScroll;
	bool FTabsNextTabButtonIsDown;
	bool FTabsNextTabButtonIsEnabled;
	bool FTabsNextTabButtonIsHot;
	bool FTabsPrevTabButtonIsDown;
	bool FTabsPrevTabButtonIsEnabled;
	bool FTabsPrevTabButtonIsHot;
	int __fastcall GetLastVisibleTabIndex(void);
	int __fastcall GetTabRectCount(void);
	Types::TRect __fastcall GetTabRect(int Index);
	bool __fastcall GetTabsButtonsVisible(void);
	void __fastcall SetTabsPosition(const TdxTabContainerTabsPosition Value);
	void __fastcall SetTabsScroll(const bool Value);
	void __fastcall DecFirstVisibleTabIndex(void);
	void __fastcall IncFirstVisibleTabIndex(void);
	void __fastcall UpdateButtonsState(void);
	HIDESBASE MESSAGE void __fastcall CMDesignHitTest(Messages::TWMMouse &Message);
	HIDESBASE MESSAGE void __fastcall CMMouseLeave(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMLButtonDown(Messages::TWMMouse &Message);
	HIDESBASE MESSAGE void __fastcall WMLButtonUp(Messages::TWMMouse &Message);
	HIDESBASE MESSAGE void __fastcall WMLButtonDblClk(Messages::TWMMouse &Message);
	HIDESBASE MESSAGE void __fastcall WMMouseMove(Messages::TWMMouse &Message);
	
protected:
	virtual bool __fastcall CanResizeAtPos(const Types::TPoint &pt);
	virtual void __fastcall UpdateControlDockZones(TdxCustomDockControl* AControl, int AZoneWidth);
	virtual void __fastcall IncludeToDock(TdxCustomDockControl* AControl, TdxDockingType AType, int Index);
	virtual void __fastcall CreateLayout(TdxCustomDockControl* AControl, TdxDockingType AType, int Index);
	virtual void __fastcall DestroyLayout(TdxCustomDockControl* AControl);
	virtual void __fastcall UpdateLayout(void);
	virtual void __fastcall LoadLayoutFromCustomIni(Inifiles::TCustomIniFile* AIniFlie, TdxCustomDockControl* AParentControl, AnsiString ASection);
	virtual void __fastcall SaveLayoutToCustomIni(Inifiles::TCustomIniFile* AIniFlie, AnsiString ASection);
	virtual bool __fastcall CanAcceptSideContainerItems(TdxSideContainerDockSite* AContainer);
	virtual bool __fastcall CanAcceptTabContainerItems(TdxTabContainerDockSite* AContainer);
	virtual void __fastcall ChangeAutoHide(void);
	virtual void __fastcall UpdateCaption(void);
	virtual void __fastcall DoClose(void);
	virtual void __fastcall ChildVisibilityChanged(TdxCustomDockControl* Sender);
	virtual void __fastcall DoActiveChildChanged(void);
	virtual void __fastcall ValidateActiveChild(int AIndex);
	virtual void __fastcall CalculateNC(Types::TRect &ARect);
	virtual void __fastcall NCPaint(Graphics::TCanvas* ACanvas);
	int __fastcall GetTabIndexAtPos(const Types::TPoint &pt);
	int __fastcall GetTabWidth(TdxCustomDockControl* AControl);
	virtual bool __fastcall HasBorder(void);
	virtual bool __fastcall HasCaption(void);
	virtual bool __fastcall HasTabs(void);
	virtual bool __fastcall IsCaptionActive(void);
	bool __fastcall IsTabsPoint(const Types::TPoint &pt);
	bool __fastcall IsTabsNextTabButtonPoint(const Types::TPoint &pt);
	bool __fastcall IsTabsPrevTabButtonPoint(const Types::TPoint &pt);
	__property int FirstVisibleTabIndex = {read=FFirstVisibleTabIndex, nodefault};
	__property int LastVisibleTabIndex = {read=GetLastVisibleTabIndex, nodefault};
	__property Types::TRect TabsNextTabButtonRect = {read=FTabsNextTabButtonRect};
	__property Types::TRect TabsPrevTabButtonRect = {read=FTabsPrevTabButtonRect};
	__property Types::TRect TabsRect = {read=FTabsRect};
	__property int TabRectCount = {read=GetTabRectCount, nodefault};
	__property Types::TRect TabsRects[int Index] = {read=GetTabRect};
	__property bool TabsButtonsVisible = {read=GetTabsButtonsVisible, nodefault};
	__property bool TabsNextTabButtonIsDown = {read=FTabsNextTabButtonIsDown, nodefault};
	__property bool TabsNextTabButtonIsEnabled = {read=FTabsNextTabButtonIsEnabled, nodefault};
	__property bool TabsNextTabButtonIsHot = {read=FTabsNextTabButtonIsHot, nodefault};
	__property bool TabsPrevTabButtonIsDown = {read=FTabsPrevTabButtonIsDown, nodefault};
	__property bool TabsPrevTabButtonIsEnabled = {read=FTabsPrevTabButtonIsEnabled, nodefault};
	__property bool TabsPrevTabButtonIsHot = {read=FTabsPrevTabButtonIsHot, nodefault};
	
public:
	__fastcall virtual TdxTabContainerDockSite(Classes::TComponent* AOwner);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual bool __fastcall CanActive(void);
	virtual bool __fastcall CanAutoHide(void);
	virtual bool __fastcall CanDockHost(TdxCustomDockControl* AControl, TdxDockingType AType);
	virtual bool __fastcall CanMaximize(void);
	
__published:
	__property AutoHide ;
	__property CaptionButtons  = {default=7};
	__property Dockable  = {default=1};
	__property ImageIndex  = {default=-1};
	__property ShowCaption  = {default=1};
	__property TdxTabContainerTabsPosition TabsPosition = {read=FTabsPosition, write=SetTabsPosition, default=1};
	__property bool TabsScroll = {read=FTabsScroll, write=SetTabsScroll, default=1};
	__property OnActivate ;
	__property OnAutoHideChanged ;
	__property OnAutoHideChanging ;
	__property OnClose ;
	__property OnCloseQuery ;
	__property OnCreateSideContainer ;
	__property OnDock ;
	__property OnDocking ;
	__property OnEndDocking ;
	__property OnGetAutoHidePosition ;
	__property OnMakeFloating ;
	__property OnStartDocking ;
	__property OnUnDock ;
public:
	#pragma option push -w-inl
	/* TdxCustomDockControl.Destroy */ inline __fastcall virtual ~TdxTabContainerDockSite(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TdxTabContainerDockSite(HWND ParentWindow) : TdxContainerDockSite(ParentWindow) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TdxSideContainerDockSite : public TdxContainerDockSite 
{
	typedef TdxContainerDockSite inherited;
	
private:
	int FAdjustBoundsLock;
	
protected:
	virtual void __fastcall UpdateControlDockZones(TdxCustomDockControl* AControl, int AZoneWidth);
	virtual void __fastcall IncludeToDock(TdxCustomDockControl* AControl, TdxDockingType AType, int Index);
	virtual void __fastcall CreateLayout(TdxCustomDockControl* AControl, TdxDockingType AType, int Index);
	virtual void __fastcall UpdateLayout(void);
	virtual void __fastcall LoadLayoutFromCustomIni(Inifiles::TCustomIniFile* AIniFlie, TdxCustomDockControl* AParentControl, AnsiString ASection);
	virtual bool __fastcall CanAcceptSideContainerItems(TdxSideContainerDockSite* AContainer);
	virtual bool __fastcall CanAcceptTabContainerItems(TdxTabContainerDockSite* AContainer);
	virtual void __fastcall UpdateCaption(void);
	virtual void __fastcall ChangeAutoHide(void);
	virtual void __fastcall DoClose(void);
	virtual void __fastcall ChildVisibilityChanged(TdxCustomDockControl* Sender);
	virtual void __fastcall DoActiveChildChanged(void);
	bool __fastcall CanChildResize(TdxCustomDockControl* AControl, int ADeltaSize);
	void __fastcall DoChildResize(TdxCustomDockControl* AControl, int ADeltaSize);
	void __fastcall BeginAdjustBounds(void);
	void __fastcall EndAdjustBounds(void);
	__property int AdjustBoundsLock = {read=FAdjustBoundsLock, nodefault};
	void __fastcall AdjustChildrenBounds(TdxCustomDockControl* AControl);
	void __fastcall NormalizeChildrenBounds(int ADeltaSize);
	void __fastcall SetChildBounds(TdxCustomDockControl* AControl, int AWidth, int AHeight);
	virtual bool __fastcall IsValidActiveChild(TdxCustomDockControl* AControl);
	virtual void __fastcall ValidateActiveChild(int AIndex);
	int __fastcall GetDifferentSize(void);
	virtual int __fastcall GetContainerSize(void) = 0 ;
	virtual int __fastcall GetDimension(int AWidth, int AHeight) = 0 ;
	virtual int __fastcall GetMinSize(int Index) = 0 ;
	virtual int __fastcall GetOriginalSize(int Index) = 0 ;
	virtual int __fastcall GetSize(int Index) = 0 ;
	virtual int __fastcall GetPosition(int Index) = 0 ;
	virtual void __fastcall SetOriginalSize(int Index, const int Value) = 0 ;
	virtual void __fastcall SetSize(int Index, const int Value) = 0 ;
	virtual void __fastcall SetPosition(int Index, const int Value) = 0 ;
	__property int MinSizes[int Index] = {read=GetMinSize};
	__property int OriginalSizes[int Index] = {read=GetOriginalSize, write=SetOriginalSize};
	__property int Sizes[int Index] = {read=GetSize, write=SetSize};
	__property int Positions[int Index] = {read=GetPosition, write=SetPosition};
	virtual bool __fastcall HasBorder(void);
	virtual bool __fastcall HasCaption(void);
	
public:
	virtual void __fastcall SetBounds(int ALeft, int ATop, int AWidth, int AHeight);
	virtual bool __fastcall CanActive(void);
	virtual bool __fastcall CanAutoHide(void);
	virtual bool __fastcall CanDockHost(TdxCustomDockControl* AControl, TdxDockingType AType);
	virtual bool __fastcall CanMaximize(void);
	
__published:
	__property AutoHide ;
	__property CaptionButtons  = {default=7};
	__property Dockable  = {default=1};
	__property ImageIndex  = {default=-1};
	__property ShowCaption  = {default=1};
	__property OnActivate ;
	__property OnAutoHideChanged ;
	__property OnAutoHideChanging ;
	__property OnClose ;
	__property OnCloseQuery ;
	__property OnDock ;
	__property OnDocking ;
	__property OnEndDocking ;
	__property OnGetAutoHidePosition ;
	__property OnMakeFloating ;
	__property OnStartDocking ;
	__property OnUnDock ;
public:
	#pragma option push -w-inl
	/* TdxContainerDockSite.Create */ inline __fastcall virtual TdxSideContainerDockSite(Classes::TComponent* AOwner) : TdxContainerDockSite(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TdxCustomDockControl.Destroy */ inline __fastcall virtual ~TdxSideContainerDockSite(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TdxSideContainerDockSite(HWND ParentWindow) : TdxContainerDockSite(ParentWindow) { }
	#pragma option pop
	
};


typedef TMetaClass*TdxSideContainerDockSiteClass;

class DELPHICLASS TdxHorizContainerDockSite;
class PASCALIMPLEMENTATION TdxHorizContainerDockSite : public TdxSideContainerDockSite 
{
	typedef TdxSideContainerDockSite inherited;
	
protected:
	virtual void __fastcall UpdateControlResizeZones(TdxCustomDockControl* AControl);
	virtual void __fastcall UpdateControlOriginalSize(TdxCustomDockControl* AControl);
	/* virtual class method */ virtual TdxDockingType __fastcall GetHeadDockType(TMetaClass* vmt);
	/* virtual class method */ virtual TdxDockingType __fastcall GetTailDockType(TMetaClass* vmt);
	virtual int __fastcall GetContainerSize(void);
	virtual int __fastcall GetDimension(int AWidth, int AHeight);
	virtual int __fastcall GetMinSize(int Index);
	virtual int __fastcall GetOriginalSize(int Index);
	virtual int __fastcall GetSize(int Index);
	virtual int __fastcall GetPosition(int Index);
	virtual void __fastcall SetOriginalSize(int Index, const int Value);
	virtual void __fastcall SetSize(int Index, const int Value);
	virtual void __fastcall SetPosition(int Index, const int Value);
public:
	#pragma option push -w-inl
	/* TdxContainerDockSite.Create */ inline __fastcall virtual TdxHorizContainerDockSite(Classes::TComponent* AOwner) : TdxSideContainerDockSite(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TdxCustomDockControl.Destroy */ inline __fastcall virtual ~TdxHorizContainerDockSite(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TdxHorizContainerDockSite(HWND ParentWindow) : TdxSideContainerDockSite(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TdxVertContainerDockSite;
class PASCALIMPLEMENTATION TdxVertContainerDockSite : public TdxSideContainerDockSite 
{
	typedef TdxSideContainerDockSite inherited;
	
protected:
	virtual void __fastcall UpdateControlResizeZones(TdxCustomDockControl* AControl);
	virtual void __fastcall UpdateControlOriginalSize(TdxCustomDockControl* AControl);
	/* virtual class method */ virtual TdxDockingType __fastcall GetHeadDockType(TMetaClass* vmt);
	/* virtual class method */ virtual TdxDockingType __fastcall GetTailDockType(TMetaClass* vmt);
	virtual int __fastcall GetContainerSize(void);
	virtual int __fastcall GetDimension(int AWidth, int AHeight);
	virtual int __fastcall GetMinSize(int Index);
	virtual int __fastcall GetOriginalSize(int Index);
	virtual int __fastcall GetSize(int Index);
	virtual int __fastcall GetPosition(int Index);
	virtual void __fastcall SetOriginalSize(int Index, const int Value);
	virtual void __fastcall SetSize(int Index, const int Value);
	virtual void __fastcall SetPosition(int Index, const int Value);
public:
	#pragma option push -w-inl
	/* TdxContainerDockSite.Create */ inline __fastcall virtual TdxVertContainerDockSite(Classes::TComponent* AOwner) : TdxSideContainerDockSite(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TdxCustomDockControl.Destroy */ inline __fastcall virtual ~TdxVertContainerDockSite(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TdxVertContainerDockSite(HWND ParentWindow) : TdxSideContainerDockSite(ParentWindow) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TdxDockSiteAutoHideContainer : public Controls::TWinControl 
{
	typedef Controls::TWinControl inherited;
	
private:
	HIDESBASE MESSAGE void __fastcall WMEraseBkgnd(Messages::TWMEraseBkgnd &Message);
	
public:
	__fastcall virtual TdxDockSiteAutoHideContainer(Classes::TComponent* AOwner);
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TdxDockSiteAutoHideContainer(HWND ParentWindow) : Controls::TWinControl(ParentWindow) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TWinControl.Destroy */ inline __fastcall virtual ~TdxDockSiteAutoHideContainer(void) { }
	#pragma option pop
	
};


typedef DynamicArray<Types::TRect >  dxDockControl__31;

class DELPHICLASS TdxDockSiteHideBar;
class PASCALIMPLEMENTATION TdxDockSiteHideBar : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	Classes::TList* FDockControls;
	#pragma pack(push, 1)
	Types::TRect FRect;
	#pragma pack(pop)
	
	DynamicArray<Types::TRect >  FButtonsRects;
	TdxDockSite* FOwner;
	int __fastcall GetButtonRectCount(void);
	Types::TRect __fastcall GetButtonRect(int Index);
	TdxCustomDockControl* __fastcall GetDockControl(int Index);
	int __fastcall GetDockControlCount(void);
	TdxDockControlPainter* __fastcall GetPainter(void);
	bool __fastcall GetVisible(void);
	
protected:
	virtual void __fastcall Calculate(const Types::TRect &R) = 0 ;
	virtual void __fastcall CalculateButtons(const Types::TRect &R) = 0 ;
	virtual Controls::TAnchors __fastcall GetContainersAnchors(void) = 0 ;
	virtual Controls::TAlign __fastcall GetControlsAlign(void) = 0 ;
	virtual TdxAutoHidePosition __fastcall GetPosition(void) = 0 ;
	virtual int __fastcall GetButtonWidth(TdxCustomDockControl* AControl) = 0 ;
	virtual bool __fastcall CheckHidingFinish(void) = 0 ;
	virtual bool __fastcall CheckShowingFinish(void) = 0 ;
	virtual void __fastcall SetFinalPosition(TdxCustomDockControl* AControl) = 0 ;
	virtual void __fastcall SetInitialPosition(TdxCustomDockControl* AControl) = 0 ;
	virtual void __fastcall UpdatePosition(int ADelta) = 0 ;
	virtual void __fastcall UpdateOwnerAutoSizeBounds(TdxCustomDockControl* AControl) = 0 ;
	virtual TdxCustomDockControl* __fastcall GetControlAtPos(const Types::TPoint &pt, TdxCustomDockControl* &SubControl);
	virtual TdxCustomDockControl* __fastcall GetTabContainerChildAtPos(const Types::TPoint &pt, TdxTabContainerDockSite* TabContainer);
	int __fastcall IndexOfDockControl(TdxCustomDockControl* AControl);
	virtual void __fastcall CreateAutoHideContainer(TdxCustomDockControl* AControl);
	virtual void __fastcall DestroyAutoHideContainer(TdxCustomDockControl* AControl);
	void __fastcall RegisterDockControl(TdxCustomDockControl* AControl);
	void __fastcall UnregisterDockControl(TdxCustomDockControl* AControl);
	__property int ButtonRectCount = {read=GetButtonRectCount, nodefault};
	__property Types::TRect ButtonsRects[int Index] = {read=GetButtonRect};
	__property TdxDockControlPainter* Painter = {read=GetPainter};
	__property Types::TRect Rect = {read=FRect};
	
public:
	__fastcall TdxDockSiteHideBar(TdxDockSite* AOwner);
	__fastcall virtual ~TdxDockSiteHideBar(void);
	__property int DockControlCount = {read=GetDockControlCount, nodefault};
	__property TdxCustomDockControl* DockControls[int Index] = {read=GetDockControl};
	__property TdxDockSite* Owner = {read=FOwner};
	__property TdxAutoHidePosition Position = {read=GetPosition, nodefault};
	__property bool Visible = {read=GetVisible, nodefault};
};


class DELPHICLASS TdxDockSiteLeftHideBar;
class PASCALIMPLEMENTATION TdxDockSiteLeftHideBar : public TdxDockSiteHideBar 
{
	typedef TdxDockSiteHideBar inherited;
	
protected:
	virtual void __fastcall Calculate(const Types::TRect &R);
	virtual void __fastcall CalculateButtons(const Types::TRect &R);
	virtual int __fastcall GetButtonWidth(TdxCustomDockControl* AControl);
	virtual Controls::TAnchors __fastcall GetContainersAnchors(void);
	virtual Controls::TAlign __fastcall GetControlsAlign(void);
	virtual TdxAutoHidePosition __fastcall GetPosition(void);
	virtual bool __fastcall CheckHidingFinish(void);
	virtual bool __fastcall CheckShowingFinish(void);
	virtual void __fastcall SetFinalPosition(TdxCustomDockControl* AControl);
	virtual void __fastcall SetInitialPosition(TdxCustomDockControl* AControl);
	virtual void __fastcall UpdatePosition(int ADelta);
	virtual void __fastcall UpdateOwnerAutoSizeBounds(TdxCustomDockControl* AControl);
	virtual TdxCustomDockControl* __fastcall GetTabContainerChildAtPos(const Types::TPoint &pt, TdxTabContainerDockSite* TabContainer);
public:
	#pragma option push -w-inl
	/* TdxDockSiteHideBar.Create */ inline __fastcall TdxDockSiteLeftHideBar(TdxDockSite* AOwner) : TdxDockSiteHideBar(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TdxDockSiteHideBar.Destroy */ inline __fastcall virtual ~TdxDockSiteLeftHideBar(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxDockSiteTopHideBar;
class PASCALIMPLEMENTATION TdxDockSiteTopHideBar : public TdxDockSiteHideBar 
{
	typedef TdxDockSiteHideBar inherited;
	
protected:
	virtual void __fastcall Calculate(const Types::TRect &R);
	virtual void __fastcall CalculateButtons(const Types::TRect &R);
	virtual int __fastcall GetButtonWidth(TdxCustomDockControl* AControl);
	virtual Controls::TAnchors __fastcall GetContainersAnchors(void);
	virtual Controls::TAlign __fastcall GetControlsAlign(void);
	virtual TdxAutoHidePosition __fastcall GetPosition(void);
	virtual bool __fastcall CheckHidingFinish(void);
	virtual bool __fastcall CheckShowingFinish(void);
	virtual void __fastcall SetFinalPosition(TdxCustomDockControl* AControl);
	virtual void __fastcall SetInitialPosition(TdxCustomDockControl* AControl);
	virtual void __fastcall UpdatePosition(int ADelta);
	virtual void __fastcall UpdateOwnerAutoSizeBounds(TdxCustomDockControl* AControl);
	virtual TdxCustomDockControl* __fastcall GetTabContainerChildAtPos(const Types::TPoint &pt, TdxTabContainerDockSite* TabContainer);
public:
	#pragma option push -w-inl
	/* TdxDockSiteHideBar.Create */ inline __fastcall TdxDockSiteTopHideBar(TdxDockSite* AOwner) : TdxDockSiteHideBar(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TdxDockSiteHideBar.Destroy */ inline __fastcall virtual ~TdxDockSiteTopHideBar(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxDockSiteRightHideBar;
class PASCALIMPLEMENTATION TdxDockSiteRightHideBar : public TdxDockSiteLeftHideBar 
{
	typedef TdxDockSiteLeftHideBar inherited;
	
protected:
	virtual void __fastcall Calculate(const Types::TRect &R);
	virtual Controls::TAnchors __fastcall GetContainersAnchors(void);
	virtual Controls::TAlign __fastcall GetControlsAlign(void);
	virtual TdxAutoHidePosition __fastcall GetPosition(void);
	virtual void __fastcall SetFinalPosition(TdxCustomDockControl* AControl);
	virtual void __fastcall SetInitialPosition(TdxCustomDockControl* AControl);
	virtual void __fastcall UpdatePosition(int ADelta);
public:
	#pragma option push -w-inl
	/* TdxDockSiteHideBar.Create */ inline __fastcall TdxDockSiteRightHideBar(TdxDockSite* AOwner) : TdxDockSiteLeftHideBar(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TdxDockSiteHideBar.Destroy */ inline __fastcall virtual ~TdxDockSiteRightHideBar(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxDockSiteBottomHideBar;
class PASCALIMPLEMENTATION TdxDockSiteBottomHideBar : public TdxDockSiteTopHideBar 
{
	typedef TdxDockSiteTopHideBar inherited;
	
protected:
	virtual void __fastcall Calculate(const Types::TRect &R);
	virtual Controls::TAnchors __fastcall GetContainersAnchors(void);
	virtual Controls::TAlign __fastcall GetControlsAlign(void);
	virtual TdxAutoHidePosition __fastcall GetPosition(void);
	virtual void __fastcall SetFinalPosition(TdxCustomDockControl* AControl);
	virtual void __fastcall SetInitialPosition(TdxCustomDockControl* AControl);
	virtual void __fastcall UpdatePosition(int ADelta);
public:
	#pragma option push -w-inl
	/* TdxDockSiteHideBar.Create */ inline __fastcall TdxDockSiteBottomHideBar(TdxDockSite* AOwner) : TdxDockSiteTopHideBar(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TdxDockSiteHideBar.Destroy */ inline __fastcall virtual ~TdxDockSiteBottomHideBar(void) { }
	#pragma option pop
	
};


typedef void __fastcall (__closure *TdxAutoHideControlEvent)(TdxDockSite* Sender, TdxCustomDockControl* AControl);

class PASCALIMPLEMENTATION TdxDockSite : public TdxCustomDockSite 
{
	typedef TdxCustomDockSite inherited;
	
private:
	bool FAutoSize;
	int FAutoSizeHeight;
	int FAutoSizeWidth;
	Classes::TList* FHideBars;
	int FHidingTimerID;
	TdxCustomDockControl* FMovingControl;
	TdxDockSiteHideBar* FMovingControlHideBar;
	int FMovingTimerID;
	TdxCustomDockControl* FShowingControl;
	TdxCustomDockControl* FShowingControlCandidate;
	int FShowingTimerID;
	TdxAutoHideControlEvent FOnHideControl;
	TdxAutoHideControlEvent FOnShowControl;
	int __fastcall GetHideBarCount(void);
	TdxDockSiteHideBar* __fastcall GetHideBar(int Index);
	TdxDockSiteAutoHideContainer* __fastcall GetMovingContainer(void);
	void __fastcall SetShowingControl(TdxCustomDockControl* Value);
	HIDESBASE MESSAGE void __fastcall CMDesignHitTest(Messages::TWMMouse &Message);
	HIDESBASE MESSAGE void __fastcall CMMouseLeave(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMLButtonDown(Messages::TWMMouse &Message);
	HIDESBASE MESSAGE void __fastcall WMMouseMove(Messages::TWMMouse &Message);
	
protected:
	virtual void __fastcall ReadState(Classes::TReader* Reader);
	virtual void __fastcall SetAutoSize(bool Value);
	virtual void __fastcall SetParent(Controls::TWinControl* AParent);
	DYNAMIC void __fastcall ValidateInsert(Classes::TComponent* AComponent);
	virtual void __fastcall UpdateControlResizeZones(TdxCustomDockControl* AControl);
	virtual void __fastcall UpdateControlDockZones(TdxCustomDockControl* AControl, int AZoneWidth);
	virtual void __fastcall CreateLayout(TdxCustomDockControl* AControl, TdxDockingType AType, int Index);
	virtual void __fastcall DestroyLayout(TdxCustomDockControl* AControl);
	virtual void __fastcall LoadLayoutFromCustomIni(Inifiles::TCustomIniFile* AIniFlie, TdxCustomDockControl* AParentControl, AnsiString ASection);
	virtual void __fastcall SaveLayoutToCustomIni(Inifiles::TCustomIniFile* AIniFlie, AnsiString ASection);
	virtual void __fastcall UpdateControlOriginalSize(TdxCustomDockControl* AControl);
	virtual void __fastcall ChildVisibilityChanged(TdxCustomDockControl* Sender);
	virtual void __fastcall CalculateNC(Types::TRect &ARect);
	virtual void __fastcall NCPaint(Graphics::TCanvas* ACanvas);
	virtual TdxAutoHidePosition __fastcall GetControlAutoHidePosition(TdxCustomDockControl* AControl);
	void __fastcall RegisterAutoHideDockControl(TdxCustomDockControl* AControl, TdxAutoHidePosition APosition);
	void __fastcall UnregisterAutoHideDockControl(TdxCustomDockControl* AControl);
	virtual void __fastcall AdjustAutoSizeBounds(void);
	virtual bool __fastcall CanAutoSizeChange(void);
	virtual TdxCustomDockControl* __fastcall GetAutoSizeClientControl(void);
	virtual void __fastcall UpdateAutoSizeBounds(int AWidth, int AHeight);
	void __fastcall DoHideControl(TdxCustomDockControl* AControl);
	void __fastcall DoShowControl(TdxCustomDockControl* AControl);
	void __fastcall DoShowMovement(void);
	void __fastcall DoHideMovement(void);
	void __fastcall ImmediatelyHide(void);
	void __fastcall ImmediatelyShow(TdxCustomDockControl* AControl);
	void __fastcall InitializeHiding(void);
	void __fastcall InitializeShowing(void);
	void __fastcall FinalizeHiding(void);
	void __fastcall FinalizeShowing(void);
	void __fastcall SetFinalPosition(TdxCustomDockControl* AControl);
	void __fastcall SetInitialPosition(TdxCustomDockControl* AControl);
	int __fastcall GetClientLeft(void);
	int __fastcall GetClientTop(void);
	HIDESBASE int __fastcall GetClientWidth(void);
	HIDESBASE int __fastcall GetClientHeight(void);
	TdxCustomDockControl* __fastcall GetControlAtPos(const Types::TPoint &pt, TdxCustomDockControl* &SubControl);
	TdxDockSiteHideBar* __fastcall GetHideBarAtPos(const Types::TPoint &pt);
	TdxDockSiteHideBar* __fastcall GetHideBarByControl(TdxCustomDockControl* AControl);
	TdxDockSiteHideBar* __fastcall GetHideBarByPosition(TdxAutoHidePosition APosition);
	virtual void __fastcall CreateHideBars(void);
	virtual void __fastcall DestroyHideBars(void);
	__property int HideBarCount = {read=GetHideBarCount, nodefault};
	__property TdxDockSiteHideBar* HideBars[int Index] = {read=GetHideBar};
	__property TdxDockSiteHideBar* BottomHideBar = {read=GetHideBar, index=1};
	__property TdxDockSiteHideBar* LeftHideBar = {read=GetHideBar, index=2};
	__property TdxDockSiteHideBar* RightHideBar = {read=GetHideBar, index=3};
	__property TdxDockSiteHideBar* TopHideBar = {read=GetHideBar, index=0};
	__property TdxDockSiteAutoHideContainer* MovingContainer = {read=GetMovingContainer};
	__property TdxCustomDockControl* MovingControl = {read=FMovingControl};
	__property TdxDockSiteHideBar* MovingControlHideBar = {read=FMovingControlHideBar};
	
public:
	__fastcall virtual TdxDockSite(Classes::TComponent* AOwner);
	__fastcall virtual ~TdxDockSite(void);
	virtual bool __fastcall CanDockHost(TdxCustomDockControl* AControl, TdxDockingType AType);
	virtual TdxZone* __fastcall GetDockZoneAtPos(TdxCustomDockControl* AControl, const Types::TPoint &pt);
	TdxAutoHidePosition __fastcall GetPositionByControl(TdxCustomDockControl* AControl);
	__property TdxCustomDockControl* AutoSizeClientControl = {read=GetAutoSizeClientControl};
	__property TdxCustomDockControl* ShowingControl = {read=FShowingControl, write=SetShowingControl};
	
__published:
	__property Align  = {default=0};
	__property Anchors  = {default=3};
	__property bool AutoSize = {read=FAutoSize, write=SetAutoSize, default=0};
	__property Visible  = {default=1};
	__property OnCreateLayoutSite ;
	__property TdxAutoHideControlEvent OnHideControl = {read=FOnHideControl, write=FOnHideControl};
	__property TdxAutoHideControlEvent OnShowControl = {read=FOnShowControl, write=FOnShowControl};
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TdxDockSite(HWND ParentWindow) : TdxCustomDockSite(ParentWindow) { }
	#pragma option pop
	
};


typedef void __fastcall (__closure *TdxSetFloatFormCaptionEvent)(TdxCustomDockControl* Sender, TdxFloatForm* AFloatForm);

class PASCALIMPLEMENTATION TdxFloatDockSite : public TdxCustomDockSite 
{
	typedef TdxCustomDockSite inherited;
	
private:
	TdxFloatForm* FFloatForm;
	int FFloatLeft;
	int FFloatTop;
	TdxSetFloatFormCaptionEvent FOnSetFloatFormCaption;
	HIDESBASE TdxCustomDockControl* __fastcall GetChild(void);
	void __fastcall SetFloatLeft(const int Value);
	void __fastcall SetFloatTop(const int Value);
	HIDESBASE MESSAGE void __fastcall WMNCHitTest(Messages::TWMNCHitTest &Message);
	
protected:
	virtual void __fastcall Loaded(void);
	virtual void __fastcall SetParent(Controls::TWinControl* AParent);
	virtual void __fastcall StartDocking(const Types::TPoint &pt);
	virtual void __fastcall CheckDockClientsRules(void);
	virtual void __fastcall CreateLayout(TdxCustomDockControl* AControl, TdxDockingType AType, int Index);
	virtual void __fastcall DestroyLayout(TdxCustomDockControl* AControl);
	virtual void __fastcall LoadLayoutFromCustomIni(Inifiles::TCustomIniFile* AIniFlie, TdxCustomDockControl* AParentControl, AnsiString ASection);
	virtual void __fastcall SaveLayoutToCustomIni(Inifiles::TCustomIniFile* AIniFlie, AnsiString ASection);
	void __fastcall DoSetFloatFormCaption(void);
	virtual TdxFloatForm* __fastcall GetFloatForm(void);
	virtual void __fastcall RestoreDockPosition(const Types::TPoint &pt);
	virtual void __fastcall CreateFloatForm(void);
	virtual void __fastcall DestroyFloatForm(void);
	void __fastcall HideFloatForm(void);
	void __fastcall ShowFloatForm(void);
	void __fastcall SetFloatFormPosition(int ALeft, int ATop);
	void __fastcall SetFloatFormSize(int AWidth, int AHeight);
	virtual void __fastcall UpdateCaption(void);
	virtual void __fastcall AdjustControlBounds(TdxCustomDockControl* AControl);
	virtual void __fastcall UpdateControlOriginalSize(TdxCustomDockControl* AControl);
	virtual void __fastcall UpdateFloatPosition(void);
	virtual void __fastcall ChildVisibilityChanged(TdxCustomDockControl* Sender);
	virtual void __fastcall Activate(void);
	virtual void __fastcall DoClose(void);
	virtual bool __fastcall CanDestroy(void);
	
public:
	__fastcall virtual TdxFloatDockSite(Classes::TComponent* AOwner);
	__fastcall virtual ~TdxFloatDockSite(void);
	virtual void __fastcall BeforeDestruction(void);
	DYNAMIC bool __fastcall HasParent(void);
	virtual bool __fastcall CanDockHost(TdxCustomDockControl* AControl, TdxDockingType AType);
	__property TdxCustomDockControl* Child = {read=GetChild};
	
__published:
	__property int FloatLeft = {read=FFloatLeft, write=SetFloatLeft, nodefault};
	__property int FloatTop = {read=FFloatTop, write=SetFloatTop, nodefault};
	__property TdxSetFloatFormCaptionEvent OnSetFloatFormCaption = {read=FOnSetFloatFormCaption, write=FOnSetFloatFormCaption};
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TdxFloatDockSite(HWND ParentWindow) : TdxCustomDockSite(ParentWindow) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TdxFloatForm : public Forms::TCustomForm 
{
	typedef Forms::TCustomForm inherited;
	
private:
	bool FCanDesigning;
	bool FCaptionIsDown;
	#pragma pack(push, 1)
	Types::TPoint FCaptionPoint;
	#pragma pack(pop)
	
	TdxFloatDockSite* FDockSite;
	bool FOnTopMost;
	Forms::TCustomForm* __fastcall GetParentForm(void);
	MESSAGE void __fastcall WMHideForm(Messages::TWMNoParams &Message);
	MESSAGE void __fastcall WMShowForm(Messages::TWMNoParams &Message);
	HIDESBASE MESSAGE void __fastcall WMClose(Messages::TWMNoParams &Message);
	HIDESBASE MESSAGE void __fastcall WMMove(Messages::TWMMove &Message);
	HIDESBASE MESSAGE void __fastcall WMSize(Messages::TWMSize &Message);
	MESSAGE void __fastcall WMMouseActivate(Messages::TWMMouseActivate &Message);
	HIDESBASE MESSAGE void __fastcall WMNCLButtonDown(Messages::TWMNCHitMessage &Message);
	MESSAGE void __fastcall WMNCLButtonUp(Messages::TWMNCHitMessage &Message);
	MESSAGE void __fastcall WMNCLButtonDblClk(Messages::TWMNCHitMessage &Message);
	MESSAGE void __fastcall WMNCMouseMove(Messages::TWMNCHitMessage &Message);
	
protected:
	virtual void __fastcall CreateParams(Controls::TCreateParams &Params);
	virtual void __fastcall WndProc(Messages::TMessage &Message);
	bool __fastcall CanDesigning(void);
	bool __fastcall IsDesigning(void);
	bool __fastcall IsDestroying(void);
	void __fastcall InsertDockSite(TdxFloatDockSite* ADockSite);
	void __fastcall RemoveDockSite(void);
	void __fastcall SendOnTop(void);
	void __fastcall SendOnTopMost(void);
	
public:
	__fastcall virtual TdxFloatForm(Classes::TComponent* AOwner);
	__fastcall virtual ~TdxFloatForm(void);
	DYNAMIC bool __fastcall IsShortCut(Messages::TWMKey &Message);
	__property AutoScroll  = {default=0};
	__property BorderStyle  = {default=5};
	__property TdxFloatDockSite* DockSite = {read=FDockSite};
	__property FormStyle  = {default=0};
	__property Icon ;
	__property Forms::TCustomForm* ParentForm = {read=GetParentForm};
public:
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual TdxFloatForm(Classes::TComponent* AOwner, int Dummy) : Forms::TCustomForm(AOwner, Dummy) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TdxFloatForm(HWND ParentWindow) : Forms::TCustomForm(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TdxCustomDockControlProperties;
class DELPHICLASS TdxDockingManager;
#pragma option push -b-
enum TdxDockingOption { doActivateAfterDocking, doDblClickDocking, doFloatingOnTop, doFreeOnClose, doUndockOnClose, doTabContainerHasCaption, doTabContainerCanClose, doTabContainerCanAutoHide, doSideContainerHasCaption, doSideContainerCanClose, doSideContainerCanAutoHide, doTabContainerCanInSideContainer, doSideContainerCanInTabContainer, doSideContainerCanInSideContainer, doImmediatelyHideOnAutoHide };
#pragma option pop

typedef Set<TdxDockingOption, doActivateAfterDocking, doImmediatelyHideOnAutoHide>  TdxDockingOptions;

#pragma option push -b-
enum TdxDockingViewStyle { vsStandard, vsNET, vsOffice11, vsXP, vsUseLookAndFeel };
#pragma option pop

class DELPHICLASS TdxLayoutDockSiteProperties;
class DELPHICLASS TdxFloatDockSiteProperties;
class DELPHICLASS TdxSideContainerDockSiteProperties;
class DELPHICLASS TdxTabContainerDockSiteProperties;
class PASCALIMPLEMENTATION TdxDockingManager : public Classes::TComponent 
{
	typedef Classes::TComponent inherited;
	
private:
	Imglist::TChangeLink* FChangeLink;
	Graphics::TColor FColor;
	Classes::TList* FDefaultSitesPropertiesList;
	Graphics::TFont* FFont;
	Controls::TImageList* FImages;
	Cxlookandfeels::TcxLookAndFeel* FLookAndFeel;
	TdxDockingOptions FOptions;
	bool FUseDefaultSitesProperties;
	TdxDockingViewStyle FViewStyle;
	Classes::TNotifyEvent FOnActiveDockControlChanged;
	TdxCreateFloatSiteEvent FOnCreateFloatSite;
	TdxCreateLayoutSiteEvent FOnCreateLayoutSite;
	TdxCreateSideContainerEvent FOnCreateSideContainer;
	TdxCreateTabContainerEvent FOnCreateTabContainer;
	TdxCustomDrawSelectionEvent FOnCustomDrawDockingSelection;
	TdxCustomDrawSelectionEvent FOnCustomDrawResizingSelection;
	TdxDockControlNotifyEvent FOnLayoutChanged;
	TdxSetFloatFormCaptionEvent FOnSetFloatFormCaption;
	Classes::TNotifyEvent FOnViewChanged;
	TdxUpdateZonesEvent FOnUpdateDockZones;
	TdxUpdateZonesEvent FOnUpdateResizeZones;
	bool __fastcall IsDefaultSitePropertiesStored(void);
	TdxCustomDockControlProperties* __fastcall GetDefaultSiteProperties(int Index);
	int __fastcall GetDefaultSitesPropertiesCount(void);
	TdxLayoutDockSiteProperties* __fastcall GetDefaultLayoutSiteProperties(void);
	TdxFloatDockSiteProperties* __fastcall GetDefaultFloatSiteProperties(void);
	TdxSideContainerDockSiteProperties* __fastcall GetDefaultHorizContainerSiteProperties(void);
	TdxSideContainerDockSiteProperties* __fastcall GetDefaultVertContainerSiteProperties(void);
	TdxTabContainerDockSiteProperties* __fastcall GetDefaultTabContainerSiteProperties(void);
	void __fastcall SetColor(const Graphics::TColor Value);
	void __fastcall SetDefaultLayoutSiteProperties(TdxLayoutDockSiteProperties* Value);
	void __fastcall SetDefaultFloatSiteProperties(TdxFloatDockSiteProperties* Value);
	void __fastcall SetDefaultHorizContainerSiteProperties(TdxSideContainerDockSiteProperties* Value);
	void __fastcall SetDefaultVertContainerSiteProperties(TdxSideContainerDockSiteProperties* Value);
	void __fastcall SetDefaultTabContainerSiteProperties(TdxTabContainerDockSiteProperties* Value);
	void __fastcall SetFont(const Graphics::TFont* Value);
	void __fastcall SetImages(const Controls::TImageList* Value);
	void __fastcall SetLookAndFeel(Cxlookandfeels::TcxLookAndFeel* Value);
	void __fastcall SetOptions(const TdxDockingOptions Value);
	void __fastcall SetViewStyle(const TdxDockingViewStyle Value);
	void __fastcall DoOnImagesChanged(System::TObject* Sender);
	void __fastcall DoOnFontChanged(System::TObject* Sender);
	void __fastcall DoOnLFChanged(Cxlookandfeels::TcxLookAndFeel* Sender, Cxlookandfeels::TcxLookAndFeelValues AChangedValues);
	
protected:
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	virtual void __fastcall Loaded(void);
	bool __fastcall IsLoading(void);
	void __fastcall DoColorChanged(void);
	void __fastcall DoFontChanged(void);
	virtual void __fastcall CreateDefaultSitesProperties(void);
	virtual void __fastcall DestroyDefaultSitesProperties(void);
	void __fastcall UpdateDefaultSitesPropertiesColor(void);
	void __fastcall UpdateDefaultSitesPropertiesFont(void);
	
public:
	__fastcall virtual TdxDockingManager(Classes::TComponent* AOwner);
	__fastcall virtual ~TdxDockingManager(void);
	void __fastcall LoadLayoutFromIniFile(AnsiString AFileName);
	void __fastcall LoadLayoutFromRegistry(AnsiString ARegistryPath);
	void __fastcall LoadLayoutFromStream(Classes::TStream* AStream);
	void __fastcall SaveLayoutToIniFile(AnsiString AFileName);
	void __fastcall SaveLayoutToRegistry(AnsiString ARegistryPath);
	void __fastcall SaveLayoutToStream(Classes::TStream* AStream);
	__property TdxCustomDockControlProperties* DefaultSitesProperties[int Index] = {read=GetDefaultSiteProperties};
	__property int DefaultSitesPropertiesCount = {read=GetDefaultSitesPropertiesCount, nodefault};
	
__published:
	__property Graphics::TColor Color = {read=FColor, write=SetColor, nodefault};
	__property TdxLayoutDockSiteProperties* DefaultLayoutSiteProperties = {read=GetDefaultLayoutSiteProperties, write=SetDefaultLayoutSiteProperties, stored=IsDefaultSitePropertiesStored};
	__property TdxFloatDockSiteProperties* DefaultFloatSiteProperties = {read=GetDefaultFloatSiteProperties, write=SetDefaultFloatSiteProperties, stored=IsDefaultSitePropertiesStored};
	__property TdxSideContainerDockSiteProperties* DefaultHorizContainerSiteProperties = {read=GetDefaultHorizContainerSiteProperties, write=SetDefaultHorizContainerSiteProperties, stored=IsDefaultSitePropertiesStored};
	__property TdxSideContainerDockSiteProperties* DefaultVertContainerSiteProperties = {read=GetDefaultVertContainerSiteProperties, write=SetDefaultVertContainerSiteProperties, stored=IsDefaultSitePropertiesStored};
	__property TdxTabContainerDockSiteProperties* DefaultTabContainerSiteProperties = {read=GetDefaultTabContainerSiteProperties, write=SetDefaultTabContainerSiteProperties, stored=IsDefaultSitePropertiesStored};
	__property Graphics::TFont* Font = {read=FFont, write=SetFont};
	__property Controls::TImageList* Images = {read=FImages, write=SetImages};
	__property Cxlookandfeels::TcxLookAndFeel* LookAndFeel = {read=FLookAndFeel, write=SetLookAndFeel};
	__property TdxDockingOptions Options = {read=FOptions, write=SetOptions, nodefault};
	__property bool UseDefaultSitesProperties = {read=FUseDefaultSitesProperties, write=FUseDefaultSitesProperties, default=1};
	__property TdxDockingViewStyle ViewStyle = {read=FViewStyle, write=SetViewStyle, nodefault};
	__property Classes::TNotifyEvent OnActiveDockControlChanged = {read=FOnActiveDockControlChanged, write=FOnActiveDockControlChanged};
	__property TdxCreateFloatSiteEvent OnCreateFloatSite = {read=FOnCreateFloatSite, write=FOnCreateFloatSite};
	__property TdxCreateLayoutSiteEvent OnCreateLayoutSite = {read=FOnCreateLayoutSite, write=FOnCreateLayoutSite};
	__property TdxCreateSideContainerEvent OnCreateSideContainer = {read=FOnCreateSideContainer, write=FOnCreateSideContainer};
	__property TdxCreateTabContainerEvent OnCreateTabContainer = {read=FOnCreateTabContainer, write=FOnCreateTabContainer};
	__property TdxCustomDrawSelectionEvent OnCustomDrawDockingSelection = {read=FOnCustomDrawDockingSelection, write=FOnCustomDrawDockingSelection};
	__property TdxCustomDrawSelectionEvent OnCustomDrawResizingSelection = {read=FOnCustomDrawResizingSelection, write=FOnCustomDrawResizingSelection};
	__property TdxDockControlNotifyEvent OnLayoutChanged = {read=FOnLayoutChanged, write=FOnLayoutChanged};
	__property TdxSetFloatFormCaptionEvent OnSetFloatFormCaption = {read=FOnSetFloatFormCaption, write=FOnSetFloatFormCaption};
	__property Classes::TNotifyEvent OnViewChanged = {read=FOnViewChanged, write=FOnViewChanged};
	__property TdxUpdateZonesEvent OnUpdateDockZones = {read=FOnUpdateDockZones, write=FOnUpdateDockZones};
	__property TdxUpdateZonesEvent OnUpdateResizeZones = {read=FOnUpdateResizeZones, write=FOnUpdateResizeZones};
};


class PASCALIMPLEMENTATION TdxCustomDockControlProperties : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	TdxDockingManager* FOwner;
	TdxDockingTypes FAllowDock;
	TdxDockingTypes FAllowDockClients;
	bool FAllowFloating;
	AnsiString FCaption;
	TdxCaptionButtons FCaptionButtons;
	bool FDockable;
	int FImageIndex;
	bool FShowCaption;
	Graphics::TColor FColor;
	Controls::TCursor FCursor;
	Graphics::TFont* FFont;
	AnsiString FHint;
	bool FManagerColor;
	bool FManagerFont;
	Menus::TPopupMenu* FPopupMenu;
	bool FShowHint;
	int FTag;
	bool __fastcall IsColorStored(void);
	bool __fastcall IsFontStored(void);
	void __fastcall SetColor(const Graphics::TColor Value);
	void __fastcall SetFont(const Graphics::TFont* Value);
	void __fastcall SetManagerColor(const bool Value);
	void __fastcall SetManagerFont(const bool Value);
	
protected:
	virtual void __fastcall AssignTo(Classes::TPersistent* Dest);
	DYNAMIC Classes::TPersistent* __fastcall GetOwner(void);
	
public:
	__fastcall virtual TdxCustomDockControlProperties(TdxDockingManager* AOwner);
	__fastcall virtual ~TdxCustomDockControlProperties(void);
	__property TdxDockingTypes AllowDock = {read=FAllowDock, write=FAllowDock, default=62};
	__property TdxDockingTypes AllowDockClients = {read=FAllowDockClients, write=FAllowDockClients, default=62};
	__property bool AllowFloating = {read=FAllowFloating, write=FAllowFloating, default=1};
	__property AnsiString Caption = {read=FCaption, write=FCaption};
	__property TdxCaptionButtons CaptionButtons = {read=FCaptionButtons, write=FCaptionButtons, default=7};
	__property bool Dockable = {read=FDockable, write=FDockable, nodefault};
	__property int ImageIndex = {read=FImageIndex, write=FImageIndex, nodefault};
	__property bool ShowCaption = {read=FShowCaption, write=FShowCaption, default=1};
	
__published:
	__property Graphics::TColor Color = {read=FColor, write=SetColor, stored=IsColorStored, default=-2147483633};
	__property Controls::TCursor Cursor = {read=FCursor, write=FCursor, default=0};
	__property Graphics::TFont* Font = {read=FFont, write=SetFont, stored=IsFontStored};
	__property AnsiString Hint = {read=FHint, write=FHint};
	__property bool ManagerColor = {read=FManagerColor, write=SetManagerColor, default=1};
	__property bool ManagerFont = {read=FManagerFont, write=SetManagerFont, default=1};
	__property Menus::TPopupMenu* PopupMenu = {read=FPopupMenu, write=FPopupMenu};
	__property bool ShowHint = {read=FShowHint, write=FShowHint, default=0};
	__property int Tag = {read=FTag, write=FTag, default=0};
};


class PASCALIMPLEMENTATION TdxLayoutDockSiteProperties : public TdxCustomDockControlProperties 
{
	typedef TdxCustomDockControlProperties inherited;
	
__published:
	__property AllowDockClients  = {default=62};
public:
	#pragma option push -w-inl
	/* TdxCustomDockControlProperties.Create */ inline __fastcall virtual TdxLayoutDockSiteProperties(TdxDockingManager* AOwner) : TdxCustomDockControlProperties(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TdxCustomDockControlProperties.Destroy */ inline __fastcall virtual ~TdxLayoutDockSiteProperties(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TdxFloatDockSiteProperties : public TdxCustomDockControlProperties 
{
	typedef TdxCustomDockControlProperties inherited;
	
__published:
	__property AllowDockClients  = {default=62};
public:
	#pragma option push -w-inl
	/* TdxCustomDockControlProperties.Create */ inline __fastcall virtual TdxFloatDockSiteProperties(TdxDockingManager* AOwner) : TdxCustomDockControlProperties(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TdxCustomDockControlProperties.Destroy */ inline __fastcall virtual ~TdxFloatDockSiteProperties(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TdxSideContainerDockSiteProperties : public TdxCustomDockControlProperties 
{
	typedef TdxCustomDockControlProperties inherited;
	
__published:
	__property AllowDock  = {default=62};
	__property AllowDockClients  = {default=62};
	__property AllowFloating  = {default=1};
	__property CaptionButtons  = {default=7};
	__property Dockable ;
	__property ImageIndex ;
	__property ShowCaption  = {default=1};
public:
	#pragma option push -w-inl
	/* TdxCustomDockControlProperties.Create */ inline __fastcall virtual TdxSideContainerDockSiteProperties(TdxDockingManager* AOwner) : TdxCustomDockControlProperties(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TdxCustomDockControlProperties.Destroy */ inline __fastcall virtual ~TdxSideContainerDockSiteProperties(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TdxTabContainerDockSiteProperties : public TdxCustomDockControlProperties 
{
	typedef TdxCustomDockControlProperties inherited;
	
private:
	TdxTabContainerTabsPosition FTabsPosition;
	bool FTabsScroll;
	
protected:
	virtual void __fastcall AssignTo(Classes::TPersistent* Dest);
	
public:
	__fastcall virtual TdxTabContainerDockSiteProperties(TdxDockingManager* AOwner);
	
__published:
	__property AllowDock  = {default=62};
	__property AllowDockClients  = {default=62};
	__property AllowFloating  = {default=1};
	__property CaptionButtons  = {default=7};
	__property Dockable ;
	__property ImageIndex ;
	__property ShowCaption  = {default=1};
	__property TdxTabContainerTabsPosition TabsPosition = {read=FTabsPosition, write=FTabsPosition, default=1};
	__property bool TabsScroll = {read=FTabsScroll, write=FTabsScroll, default=1};
public:
	#pragma option push -w-inl
	/* TdxCustomDockControlProperties.Destroy */ inline __fastcall virtual ~TdxTabContainerDockSiteProperties(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TdxDockingController : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	TdxCustomDockControl* FActiveDockControl;
	TdxCustomDockControl* FCalculatingControl;
	Graphics::TColor FColor;
	Classes::TList* FDestroyedDockControls;
	Classes::TList* FDockControls;
	TdxCustomDockControl* FDockingDockControl;
	Graphics::TFont* FFont;
	HWND FHandle;
	Classes::TList* FInvalidNC;
	Classes::TList* FInvalidNCBounds;
	Classes::TList* FInvalidRedraw;
	TdxDockingManager* FManager;
	TdxDockingOptions FOptions;
	TMetaClass*FPainterClass;
	TdxCustomDockControl* FResizingDockControl;
	Graphics::TBrush* FSelectionBrush;
	int FUpdateNCLock;
	TdxDockingViewStyle FViewStyle;
	Graphics::TColor __fastcall GetColor(void);
	TdxCustomDockControl* __fastcall GetDockControl(int Index);
	int __fastcall GetDockControlCount(void);
	Graphics::TFont* __fastcall GetFont(void);
	Controls::TImageList* __fastcall GetImages(void);
	bool __fastcall GetIsDocking(void);
	bool __fastcall GetIsResizing(void);
	TdxDockingOptions __fastcall GetOptions(void);
	TdxDockingViewStyle __fastcall GetViewStyle(void);
	void __fastcall SetActiveDockControl(TdxCustomDockControl* Value);
	void __fastcall SetColor(const Graphics::TColor Value);
	void __fastcall SetFont(const Graphics::TFont* Value);
	void __fastcall SetOptions(const TdxDockingOptions Value);
	void __fastcall SetSelectionBrush(Graphics::TBrush* Value);
	void __fastcall SetViewStyle(const TdxDockingViewStyle Value);
	void __fastcall CalculateControls(void);
	bool __fastcall CheckControlsHandles(void);
	void __fastcall DestroyControls(void);
	void __fastcall InvalidateControls(bool ANeedRecalculate);
	void __fastcall UpdateInvalidControlsNC(void);
	void __fastcall UpdateControlsLayout(void);
	void __fastcall WndProc(Messages::TMessage &Message);
	void __fastcall DoOnFontChanged(System::TObject* Sender);
	
protected:
	void __fastcall FloatFormsOnTop(Forms::TCustomForm* AParentForm);
	void __fastcall FloatFormsOnTopMost(Forms::TCustomForm* AParentForm);
	void __fastcall FloatFormsHide(Forms::TCustomForm* AParentForm);
	void __fastcall FloatFormsShow(Forms::TCustomForm* AParentForm);
	int __fastcall IndexOfDockControl(TdxCustomDockControl* AControl);
	void __fastcall RegisterDestroyedDockControl(TdxCustomDockControl* AControl);
	void __fastcall RegisterDockControl(TdxCustomDockControl* AControl);
	void __fastcall UnregisterDockControl(TdxCustomDockControl* AControl);
	void __fastcall LoadControlFromCustomIni(Inifiles::TCustomIniFile* AIniFlie, TdxCustomDockControl* AParentControl, AnsiString ASection);
	void __fastcall SaveControlToCustomIni(Inifiles::TCustomIniFile* AIniFlie, TdxCustomDockControl* AControl);
	void __fastcall RegisterManager(TdxDockingManager* AManager);
	void __fastcall UnregisterManager(TdxDockingManager* AManager);
	void __fastcall DoActiveDockControlChanged(void);
	void __fastcall DoCreateFloatSite(TdxCustomDockControl* ASender, TdxFloatDockSite* ASite);
	void __fastcall DoCreateLayoutSite(TdxCustomDockControl* ASender, TdxLayoutDockSite* ASite);
	void __fastcall DoCreateSideContainerSite(TdxCustomDockControl* ASender, TdxSideContainerDockSite* ASite);
	void __fastcall DoCreateTabContainerSite(TdxCustomDockControl* ASender, TdxTabContainerDockSite* ASite);
	bool __fastcall DoCustomDrawResizingSelection(TdxCustomDockControl* ASender, HDC DC, TdxZone* AZone, const Types::TPoint &pt, bool Erasing);
	bool __fastcall DoCustomDrawDockingSelection(TdxCustomDockControl* ASender, HDC DC, TdxZone* AZone, const Types::TRect &R, bool Erasing);
	void __fastcall DoSetFloatFormCaption(TdxCustomDockControl* ASender, TdxFloatForm* AFloatForm);
	void __fastcall DoLayoutChanged(TdxCustomDockControl* ASender);
	void __fastcall DoUpdateDockZones(TdxCustomDockControl* ASender);
	void __fastcall DoUpdateResizeZones(TdxCustomDockControl* ASender);
	void __fastcall DoColorChanged(void);
	void __fastcall DoFontChanged(void);
	void __fastcall DoImagesChanged(void);
	void __fastcall DoLookAndFeelChanged(void);
	void __fastcall DoManagerChanged(void);
	void __fastcall DoOptionsChanged(TdxDockingOptions AOldOptions, TdxDockingOptions ANewOptions);
	void __fastcall DoPainterChanged(bool AssignDefaultStyle);
	void __fastcall DoViewStyleChanged(bool AssignDefaultStyle);
	void __fastcall ClearLayout(void);
	void __fastcall LoadLayoutFromCustomIni(Inifiles::TCustomIniFile* AIniFile);
	void __fastcall SaveLayoutToCustomIni(Inifiles::TCustomIniFile* AIniFile);
	void __fastcall BeginUpdateNC(void);
	void __fastcall EndUpdateNC(void);
	bool __fastcall CanUpdateNC(TdxCustomDockControl* AControl);
	bool __fastcall CanCalculateNC(TdxCustomDockControl* AControl);
	TMetaClass* __fastcall PainterClass(void);
	void __fastcall CreatePainterColors(void);
	void __fastcall RefreshPainterColors(void);
	void __fastcall ReleasePainterColors(void);
	
public:
	__fastcall virtual TdxDockingController(void);
	__fastcall virtual ~TdxDockingController(void);
	void __fastcall BeginUpdate(void);
	void __fastcall EndUpdate(void);
	TdxCustomDockControl* __fastcall GetDockControlAtPos(const Types::TPoint &pt);
	TdxCustomDockControl* __fastcall GetFloatDockSiteAtPos(const Types::TPoint &pt);
	TdxCustomDockControl* __fastcall GetNearestDockSiteAtPos(const Types::TPoint &pt);
	TdxLayoutDockSiteProperties* __fastcall DefaultLayoutSiteProperties(void);
	TdxFloatDockSiteProperties* __fastcall DefaultFloatSiteProperties(void);
	TdxSideContainerDockSiteProperties* __fastcall DefaultHorizContainerSiteProperties(void);
	TdxSideContainerDockSiteProperties* __fastcall DefaultVertContainerSiteProperties(void);
	TdxTabContainerDockSiteProperties* __fastcall DefaultTabContainerSiteProperties(void);
	__property TdxCustomDockControl* ActiveDockControl = {read=FActiveDockControl, write=SetActiveDockControl};
	__property Graphics::TColor Color = {read=GetColor, write=SetColor, nodefault};
	__property int DockControlCount = {read=GetDockControlCount, nodefault};
	__property TdxCustomDockControl* DockControls[int Index] = {read=GetDockControl};
	__property TdxCustomDockControl* DockingDockControl = {read=FDockingDockControl};
	__property Graphics::TFont* Font = {read=GetFont, write=SetFont};
	__property Controls::TImageList* Images = {read=GetImages};
	__property bool IsDocking = {read=GetIsDocking, nodefault};
	__property bool IsResizing = {read=GetIsResizing, nodefault};
	__property TdxDockingManager* Manager = {read=FManager};
	__property TdxDockingOptions Options = {read=GetOptions, write=SetOptions, nodefault};
	__property TdxCustomDockControl* ResizingDockControl = {read=FResizingDockControl};
	__property Graphics::TBrush* SelectionBrush = {read=FSelectionBrush, write=SetSelectionBrush};
	__property TdxDockingViewStyle ViewStyle = {read=GetViewStyle, write=SetViewStyle, nodefault};
};


class DELPHICLASS TdxAbstractIDEDesigner;
class PASCALIMPLEMENTATION TdxAbstractIDEDesigner : public System::TObject 
{
	typedef System::TObject inherited;
	
protected:
	virtual void __fastcall Modified(Forms::TCustomForm* Root) = 0 ;
	virtual void __fastcall NoSelection(Forms::TCustomForm* Root) = 0 ;
	virtual void __fastcall SelectComponent(Forms::TCustomForm* Root, Classes::TPersistent* Component) = 0 ;
	virtual AnsiString __fastcall UniqueName(Forms::TCustomForm* Root, const AnsiString BaseName) = 0 ;
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TdxAbstractIDEDesigner(void) : System::TObject() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxAbstractIDEDesigner(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
static const Word WM_DESTROYCONTROLS = 0x8065;
static const Word WM_HIDEFORM = 0x8066;
static const Word WM_SHOWFORM = 0x8067;
extern PACKAGE TdxAbstractIDEDesigner* IDEDesigner;
extern PACKAGE TdxDockingController* __fastcall dxDockingController(void);

}	/* namespace Dxdockcontrol */
using namespace Dxdockcontrol;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// dxDockControl
