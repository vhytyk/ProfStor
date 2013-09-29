// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'dxNavBar.pas' rev: 6.00

#ifndef dxNavBarHPP
#define dxNavBarHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Menus.hpp>	// Pascal unit
#include <dxThemeManager.hpp>	// Pascal unit
#include <dxNavBarStyles.hpp>	// Pascal unit
#include <dxNavBarCollns.hpp>	// Pascal unit
#include <dxNavBarBase.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <ImgList.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <Registry.hpp>	// Pascal unit
#include <IniFiles.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Dxnavbar
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TdxNavBarObjectState { sActive, sDisabled, sExpanded, sHotTracked, sPressed, sSelected };
#pragma option pop

typedef Set<TdxNavBarObjectState, sActive, sSelected>  TdxNavBarObjectStates;

class DELPHICLASS TdxNavBarLinkViewInfo;
class DELPHICLASS TdxNavBarGroupViewInfo;
class DELPHICLASS TdxNavBarViewInfo;
class DELPHICLASS TdxNavBarPainter;
class DELPHICLASS TdxCustomNavBar;
class DELPHICLASS TAbstractcxNavBarDesigner;
class PASCALIMPLEMENTATION TAbstractcxNavBarDesigner : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	TdxCustomNavBar* FNavBar;
	
protected:
	virtual void __fastcall Modified(void) = 0 ;
	virtual void __fastcall Update(Classes::TComponent* AItem) = 0 ;
	
public:
	__fastcall TAbstractcxNavBarDesigner(TdxCustomNavBar* ANavBar);
	__fastcall virtual ~TAbstractcxNavBarDesigner(void);
	virtual void __fastcall BeginUpdate(void) = 0 ;
	virtual void __fastcall CancelUpdate(void) = 0 ;
	virtual void __fastcall EndUpdate(void) = 0 ;
	__property TdxCustomNavBar* NavBar = {read=FNavBar};
};


#pragma option push -b-
enum TdxNavBarDragDropFlag { fAllowDragLink, fAllowDropLink, fAllowDragGroup, fAllowDropGroup };
#pragma option pop

typedef Set<TdxNavBarDragDropFlag, fAllowDragLink, fAllowDropGroup>  TdxNavBarDragDropFlags;

class DELPHICLASS TdxNavBarHintWindow;
class PASCALIMPLEMENTATION TdxNavBarHintWindow : public Controls::TCustomControl 
{
	typedef Controls::TCustomControl inherited;
	
private:
	HIDESBASE MESSAGE void __fastcall WMNCHitTest(Messages::TWMNCHitTest &Message);
	HIDESBASE MESSAGE void __fastcall WMEraseBkgnd(Messages::TWMEraseBkgnd &Message);
	
protected:
	virtual void __fastcall CreateParams(Controls::TCreateParams &Params);
	virtual void __fastcall Paint(void);
	
public:
	void __fastcall ActivateHint(const Types::TRect &Rect, const AnsiString AHint);
	TdxCustomNavBar* __fastcall NavBar(void);
public:
	#pragma option push -w-inl
	/* TCustomControl.Create */ inline __fastcall virtual TdxNavBarHintWindow(Classes::TComponent* AOwner) : Controls::TCustomControl(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomControl.Destroy */ inline __fastcall virtual ~TdxNavBarHintWindow(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TdxNavBarHintWindow(HWND ParentWindow) : Controls::TCustomControl(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TdxNavBarScrollBar;
class PASCALIMPLEMENTATION TdxNavBarScrollBar : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	TdxCustomNavBar* FNavBar;
	int FPageSize;
	int FMin;
	int FPosition;
	int FMax;
	int FLargeChange;
	int FSmallChange;
	bool FVisible;
	int __fastcall GetHeight(void);
	int __fastcall GetWidth(void);
	void __fastcall SetMax(const int Value);
	void __fastcall SetMin(const int Value);
	void __fastcall SetPageSize(const int Value);
	void __fastcall SetPosition(const int Value);
	void __fastcall SetVisible(const bool Value);
	
protected:
	void __fastcall DoScroll(Messages::TWMScroll &Message);
	
public:
	__fastcall TdxNavBarScrollBar(TdxCustomNavBar* ANavBar);
	void __fastcall SetParams(int APosition, int AMin, int AMax);
	__property int Height = {read=GetHeight, nodefault};
	__property int LargeChange = {read=FLargeChange, write=FLargeChange, default=1};
	__property int Max = {read=FMax, write=SetMax, default=100};
	__property int Min = {read=FMin, write=SetMin, default=0};
	__property TdxCustomNavBar* NavBar = {read=FNavBar};
	__property int PageSize = {read=FPageSize, write=SetPageSize, nodefault};
	__property int Position = {read=FPosition, write=SetPosition, default=0};
	__property int SmallChange = {read=FSmallChange, write=FSmallChange, default=1};
	__property int Width = {read=GetWidth, nodefault};
	__property bool Visible = {read=FVisible, write=SetVisible, nodefault};
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxNavBarScrollBar(void) { }
	#pragma option pop
	
};


typedef void __fastcall (__closure *TdxNavBarCalcGroupHintRectEvent)(System::TObject* Sender, Dxnavbarcollns::TdxNavBarGroup* AGroup, TdxNavBarViewInfo* AViewInfo, Types::TRect &R);

typedef void __fastcall (__closure *TdxNavBarCalcGroupClientHeightEvent)(System::TObject* Sender, TdxNavBarGroupViewInfo* AViewInfo, int &AHeight);

typedef void __fastcall (__closure *TdxNavBarCalcLinkHintRectEvent)(System::TObject* Sender, Dxnavbarcollns::TdxNavBarItemLink* ALink, TdxNavBarViewInfo* AViewInfo, Types::TRect &R);

typedef void __fastcall (__closure *TdxNavBarCustomDrawEvent)(System::TObject* Sender, Graphics::TCanvas* ACanvas, TdxNavBarViewInfo* AViewInfo, bool &AHandled);

typedef void __fastcall (__closure *TdxNavBarCustomDrawGroupEvent)(System::TObject* Sender, Graphics::TCanvas* ACanvas, TdxNavBarGroupViewInfo* AViewInfo, bool &AHandled);

typedef void __fastcall (__closure *TdxNavBarCustomDrawGroupHintEvent)(System::TObject* Sender, Graphics::TCanvas* ACanvas, Dxnavbarcollns::TdxNavBarGroup* AGroup, AnsiString AHint, const Types::TRect &R, bool &AHandled);

typedef void __fastcall (__closure *TdxNavBarCustomDrawLinkEvent)(System::TObject* Sender, Graphics::TCanvas* ACanvas, TdxNavBarLinkViewInfo* AViewInfo, bool &AHandled);

typedef void __fastcall (__closure *TdxNavBarCustomDrawLinkHintEvent)(System::TObject* Sender, Graphics::TCanvas* ACanvas, Dxnavbarcollns::TdxNavBarItemLink* ALink, AnsiString AHint, const Types::TRect &R, bool &AHandled);

typedef void __fastcall (__closure *TdxNavBarGetGroupHintEvent)(System::TObject* Sender, Dxnavbarcollns::TdxNavBarGroup* AGroup, AnsiString &AHint);

typedef void __fastcall (__closure *TdxNavBarGetLinkHintEvent)(System::TObject* Sender, Dxnavbarcollns::TdxNavBarItemLink* ALink, AnsiString &AHint);

typedef void __fastcall (__closure *TdxNavBarGroupEvent)(System::TObject* Sender, Dxnavbarcollns::TdxNavBarGroup* AGroup);

typedef void __fastcall (__closure *TdxNavBarLinkEvent)(System::TObject* Sender, Dxnavbarcollns::TdxNavBarItemLink* ALink);

class PASCALIMPLEMENTATION TdxCustomNavBar : public Extctrls::TCustomPanel 
{
	typedef Extctrls::TCustomPanel inherited;
	
private:
	Dxnavbarcollns::TdxNavBarGroup* FActiveGroup;
	int FActiveGroupIndex;
	bool FAllowSelectLinks;
	Graphics::TBitmap* FCanvasBitmap;
	Dxnavbarstyles::TdxNavBarDefaultStyles* FDefaultStyles;
	TAbstractcxNavBarDesigner* FDesigner;
	Controls::TCursor FDragCopyCursor;
	TdxNavBarDragDropFlags FDragDropFlags;
	bool FEachGroupHasSelectedLink;
	TdxNavBarHintWindow* FHintWindow;
	bool FHintWindowShowing;
	int FHintTimerID;
	Controls::TCursor FHotTrackedGroupCursor;
	Controls::TCursor FHotTrackedLinkCursor;
	Dxnavbarcollns::TdxNavBarGroups* FGroups;
	Dxnavbarcollns::TdxNavBarItems* FItems;
	Imglist::TChangeLink* FLargeChangeLink;
	Controls::TImageList* FLargeImages;
	TdxNavBarPainter* FPainter;
	TdxNavBarScrollBar* FScrollBar;
	int FScrollTimerID;
	bool FShowGroupCaptions;
	bool FShowGroupsHint;
	bool FShowLinksHint;
	Imglist::TChangeLink* FSmallChangeLink;
	Controls::TImageList* FSmallImages;
	int FSpaceBetweenGroups;
	Dxnavbarstyles::TdxNavBarStyleItem* FStyleBackground;
	Dxnavbarstyles::TdxNavBarStyleItem* FStyleHint;
	Dxnavbarstyles::TdxNavBarStyleItem* FStyleDropTargetGroup;
	Dxnavbarstyles::TdxNavBarStyleItem* FStyleDropTargetLink;
	Dxnavbarstyles::TdxNavBarStyleItem* FStyleButton;
	Dxnavbarstyles::TdxNavBarStyleItem* FStyleButtonHotTracked;
	Dxnavbarstyles::TdxNavBarStyleItem* FStyleButtonPressed;
	Dxnavbarstyles::TdxNavBarStyles* FStyles;
	Dxthememanager::TdxThemeChangedNotificator* FThemeNotificator;
	int FView;
	Classes::TNotifyEvent FOnActiveGroupChanged;
	TdxNavBarCalcGroupHintRectEvent FOnCalcGroupHintRect;
	TdxNavBarCalcGroupClientHeightEvent FOnCalcGroupClientHeight;
	TdxNavBarCalcLinkHintRectEvent FOnCalcLinkHintRect;
	TdxNavBarCustomDrawEvent FOnCustomDrawBackground;
	TdxNavBarCustomDrawGroupEvent FOnCustomDrawGroupCaption;
	TdxNavBarCustomDrawGroupEvent FOnCustomDrawGroupClientBackground;
	TdxNavBarCustomDrawGroupEvent FOnCustomDrawGroupClientForeground;
	TdxNavBarCustomDrawGroupHintEvent FOnCustomDrawGroupHint;
	TdxNavBarCustomDrawLinkEvent FOnCustomDrawLink;
	TdxNavBarCustomDrawLinkHintEvent FOnCustomDrawLinkHint;
	TdxNavBarCustomDrawEvent FOnCustomDrawBottomScrollButton;
	TdxNavBarCustomDrawEvent FOnCustomDrawTopScrollButton;
	TdxNavBarGetGroupHintEvent FOnGetGroupHint;
	TdxNavBarGetLinkHintEvent FOnGetLinkHint;
	TdxNavBarGroupEvent FOnGroupClick;
	TdxNavBarGroupEvent FOnGroupHotTrack;
	TdxNavBarGroupEvent FOnGroupPress;
	TdxNavBarLinkEvent FOnLinkClick;
	TdxNavBarLinkEvent FOnLinkHotTrack;
	TdxNavBarLinkEvent FOnLinkPress;
	Classes::TNotifyEvent FOnMouseEnter;
	Classes::TNotifyEvent FOnMouseLeave;
	bool FEnableDragging;
	#pragma pack(push, 1)
	Types::TPoint FSourcePoint;
	#pragma pack(pop)
	
	Classes::TShiftState FSourceShift;
	Dxnavbarcollns::TdxNavBarGroup* FSourceGroup;
	Dxnavbarcollns::TdxNavBarItemLink* FSourceLink;
	#pragma pack(push, 1)
	Types::TPoint FTargetPoint;
	#pragma pack(pop)
	
	Dxnavbarcollns::TdxNavBarGroup* FHotTrackedGroup;
	Dxnavbarcollns::TdxNavBarItemLink* FHotTrackedLink;
	Dxnavbarcollns::TdxNavBarGroup* FPressedGroup;
	Dxnavbarcollns::TdxNavBarItemLink* FPressedLink;
	bool FScrollButtonDownIsDown;
	bool FScrollButtonUpIsDown;
	Dxnavbarcollns::TdxNavBarGroup* __fastcall GetActiveGroup(void);
	int __fastcall GetActiveGroupIndex(void);
	bool __fastcall GetEnableDragging(void);
	TdxNavBarPainter* __fastcall GetPainter(void);
	int __fastcall GetScrollPosition(void);
	Dxnavbarcollns::TdxNavBarGroup* __fastcall GetSourceGroup(void);
	Dxnavbarcollns::TdxNavBarItemLink* __fastcall GetSourceLink(void);
	Dxnavbarcollns::TdxNavBarItem* __fastcall GetSourceItem(void);
	Dxnavbarcollns::TdxNavBarGroup* __fastcall GetTargetGroup(void);
	Dxnavbarcollns::TdxNavBarItemLink* __fastcall GetTargetLink1(void);
	Dxnavbarcollns::TdxNavBarItemLink* __fastcall GetTargetLink2(void);
	int __fastcall GetTargetLinkIndex(void);
	TdxNavBarViewInfo* __fastcall GetViewInfo(void);
	void __fastcall SetActiveGroup(Dxnavbarcollns::TdxNavBarGroup* Value);
	void __fastcall SetActiveGroupIndex(int Value);
	void __fastcall SetAllowSelectLinks(const bool Value);
	void __fastcall SetDefaultStyles(const Dxnavbarstyles::TdxNavBarDefaultStyles* Value);
	void __fastcall SetEachGroupHasSelectedLink(const bool Value);
	void __fastcall SetLargeImages(const Controls::TImageList* Value);
	void __fastcall SetShowGroupCaptions(const bool Value);
	void __fastcall SetSmallImages(const Controls::TImageList* Value);
	void __fastcall SetSpaceBetweenGroups(int Value);
	void __fastcall SetStyleBackground(const Dxnavbarstyles::TdxNavBarStyleItem* Value);
	void __fastcall SetStyleHint(const Dxnavbarstyles::TdxNavBarStyleItem* Value);
	void __fastcall SetStyleDropTargetGroup(const Dxnavbarstyles::TdxNavBarStyleItem* Value);
	void __fastcall SetStyleDropTargetLink(const Dxnavbarstyles::TdxNavBarStyleItem* Value);
	void __fastcall SetStyleButton(const Dxnavbarstyles::TdxNavBarStyleItem* Value);
	void __fastcall SetStyleButtonHotTracked(const Dxnavbarstyles::TdxNavBarStyleItem* Value);
	void __fastcall SetStyleButtonPressed(const Dxnavbarstyles::TdxNavBarStyleItem* Value);
	void __fastcall SetView(int Value);
	void __fastcall DeSelectLinks(void);
	bool __fastcall IsAllowDragLink(void);
	bool __fastcall IsAllowDropLink(void);
	bool __fastcall IsAllowDragGroup(void);
	bool __fastcall IsAllowDropGroup(void);
	void __fastcall OnGroupsChanged(System::TObject* Sender, Dxnavbarbase::TdxNavBarChangeType AType);
	void __fastcall OnLinksChanged(System::TObject* Sender, Dxnavbarcollns::TdxNavBarItemLink* ALink);
	void __fastcall OnItemsChanged(System::TObject* Sender, Dxnavbarbase::TdxNavBarChangeType AType);
	void __fastcall OnDefaultStylesChanged(System::TObject* Sender, Dxnavbarbase::TdxNavBarChangeType AType);
	void __fastcall OnStylesChanged(System::TObject* Sender, Dxnavbarbase::TdxNavBarChangeType AType);
	void __fastcall OnImagesChanged(System::TObject* Sender);
	void __fastcall OnThemeChanged(void);
	HIDESBASE MESSAGE void __fastcall CMMouseLeave(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMMouseEnter(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMSysColorChange(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMVScroll(Messages::TWMScroll &Message);
	HIDESBASE MESSAGE void __fastcall WMEraseBkgnd(Messages::TWMEraseBkgnd &Message);
	HIDESBASE MESSAGE void __fastcall WMSetCursor(Messages::TWMSetCursor &Msg);
	MESSAGE void __fastcall WMCreate(Messages::TWMCreate &Msg);
	
protected:
	virtual void __fastcall Loaded(void);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	DYNAMIC void __fastcall GetChildren(Classes::TGetChildProc Proc, Classes::TComponent* Root);
	virtual void __fastcall SetName(const AnsiString NewName);
	virtual void __fastcall WndProc(Messages::TMessage &Message);
	DYNAMIC void __fastcall MouseDown(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseUp(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseMove(Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall DragOver(System::TObject* Source, int X, int Y, Controls::TDragState State, bool &Accept);
	DYNAMIC void __fastcall DoEndDrag(System::TObject* Target, int X, int Y);
	DYNAMIC void __fastcall DoStartDrag(Controls::TDragObject* &DragObject);
	virtual void __fastcall DoActiveGroupChanged(void);
	virtual void __fastcall DoGroupDragDrop(Dxnavbarcollns::TdxNavBarGroup* Group);
	virtual void __fastcall DoGroupDragOver(Dxnavbarcollns::TdxNavBarGroup* Group, bool &Accept);
	virtual void __fastcall DoGroupHotTrack(Dxnavbarcollns::TdxNavBarGroup* Group);
	virtual void __fastcall DoGroupMouseDown(Dxnavbarcollns::TdxNavBarGroup* Group);
	virtual void __fastcall DoGroupMouseUp(Dxnavbarcollns::TdxNavBarGroup* Group);
	virtual void __fastcall DoLinkDragDrop(Dxnavbarcollns::TdxNavBarItemLink* Link);
	virtual void __fastcall DoLinkDragOver(Dxnavbarcollns::TdxNavBarItemLink* Link, bool &Accept);
	virtual void __fastcall DoLinkHotTrack(Dxnavbarcollns::TdxNavBarItemLink* Link);
	virtual void __fastcall DoLinkMouseDown(Dxnavbarcollns::TdxNavBarItemLink* Link);
	virtual void __fastcall DoLinkMouseUp(Dxnavbarcollns::TdxNavBarItemLink* Link);
	virtual void __fastcall DoItemDragDrop(Dxnavbarcollns::TdxNavBarItem* Item);
	virtual void __fastcall DoItemDragOver(Dxnavbarcollns::TdxNavBarItem* Item, bool &Accept);
	virtual void __fastcall DoBottomScrollButtonDown(void);
	virtual void __fastcall DoBottomScrollButtonUp(void);
	virtual void __fastcall DoTopScrollButtonDown(void);
	virtual void __fastcall DoTopScrollButtonUp(void);
	virtual void __fastcall DoGroupHintActivate(void);
	virtual void __fastcall DoLinkHintActivate(void);
	virtual void __fastcall DoHintDeactivate(void);
	void __fastcall DesignerModified(void);
	void __fastcall DesignerUpdate(Classes::TComponent* AItem);
	virtual void __fastcall Paint(void);
	void __fastcall InvalidateAll(Dxnavbarbase::TdxNavBarChangeType AType);
	void __fastcall InvalidateScrollButtons(void);
	virtual void __fastcall LoadFromRegIni(Inifiles::TCustomIniFile* AStorage, bool LoadStyles);
	virtual void __fastcall SaveToRegIni(Inifiles::TCustomIniFile* AStorage, bool SaveStyles);
	virtual TdxNavBarPainter* __fastcall CreatePainter(void);
	__property Graphics::TBitmap* CanvasBitmap = {read=FCanvasBitmap};
	__property TdxNavBarPainter* Painter = {read=GetPainter};
	__property TdxNavBarScrollBar* ScrollBar = {read=FScrollBar};
	__property TdxNavBarViewInfo* ViewInfo = {read=GetViewInfo};
	
public:
	__fastcall virtual TdxCustomNavBar(Classes::TComponent* AOwner);
	__fastcall virtual ~TdxCustomNavBar(void);
	virtual void __fastcall Invalidate(void);
	virtual void __fastcall SetBounds(int ALeft, int ATop, int AWidth, int AHeight);
	void __fastcall AssignDefaultStyles(void);
	void __fastcall LoadFromIniFile(AnsiString AFileName, bool LoadStyles = true);
	void __fastcall LoadFromRegistry(AnsiString ARegistryPath, bool LoadStyles = true);
	void __fastcall LoadFromStream(Classes::TStream* AStream, bool LoadStyles = true);
	void __fastcall SaveToIniFile(AnsiString AFileName, bool SaveStyles = true);
	void __fastcall SaveToRegistry(AnsiString ARegistryPath, bool SaveStyles = true);
	void __fastcall SaveToStream(Classes::TStream* AStream, bool SaveStyles = true);
	Dxnavbarcollns::TdxNavBarGroup* __fastcall GetGroupAtCaptionPos(const Types::TPoint &pt);
	Dxnavbarcollns::TdxNavBarGroup* __fastcall GetGroupAtItemsPos(const Types::TPoint &pt);
	Dxnavbarcollns::TdxNavBarItemLink* __fastcall GetLinkAtPos(const Types::TPoint &pt);
	Dxnavbarcollns::TdxNavBarItemLink* __fastcall GetLinkAtSelectedPos(const Types::TPoint &pt);
	bool __fastcall IsPtTopScrollButton(const Types::TPoint &pt);
	bool __fastcall IsPtBottomScrollButton(const Types::TPoint &pt);
	__property bool EnableDragging = {read=GetEnableDragging, nodefault};
	__property Types::TPoint SourcePoint = {read=FSourcePoint};
	__property Dxnavbarcollns::TdxNavBarGroup* SourceGroup = {read=GetSourceGroup};
	__property Dxnavbarcollns::TdxNavBarItemLink* SourceLink = {read=GetSourceLink};
	__property Dxnavbarcollns::TdxNavBarItem* SourceItem = {read=GetSourceItem};
	__property Types::TPoint TargetPoint = {read=FTargetPoint};
	__property Dxnavbarcollns::TdxNavBarGroup* TargetGroup = {read=GetTargetGroup};
	__property Dxnavbarcollns::TdxNavBarItemLink* TargetLink1 = {read=GetTargetLink1};
	__property Dxnavbarcollns::TdxNavBarItemLink* TargetLink2 = {read=GetTargetLink2};
	__property int TargetLinkIndex = {read=GetTargetLinkIndex, nodefault};
	__property TdxNavBarHintWindow* HintWindow = {read=FHintWindow};
	__property bool HintWindowShowing = {read=FHintWindowShowing, nodefault};
	__property Dxnavbarcollns::TdxNavBarGroup* HotTrackedGroup = {read=FHotTrackedGroup};
	__property Dxnavbarcollns::TdxNavBarItemLink* HotTrackedLink = {read=FHotTrackedLink};
	__property Dxnavbarcollns::TdxNavBarGroup* PressedGroup = {read=FPressedGroup};
	__property Dxnavbarcollns::TdxNavBarItemLink* PressedLink = {read=FPressedLink};
	__property bool ScrollButtonDownIsDown = {read=FScrollButtonDownIsDown, nodefault};
	__property bool ScrollButtonUpIsDown = {read=FScrollButtonUpIsDown, nodefault};
	__property int ScrollPosition = {read=GetScrollPosition, nodefault};
	__property int ActiveGroupIndex = {read=GetActiveGroupIndex, write=SetActiveGroupIndex, nodefault};
	__property Dxnavbarcollns::TdxNavBarGroup* ActiveGroup = {read=GetActiveGroup, write=SetActiveGroup};
	__property bool AllowSelectLinks = {read=FAllowSelectLinks, write=SetAllowSelectLinks, default=0};
	__property Dxnavbarstyles::TdxNavBarDefaultStyles* DefaultStyles = {read=FDefaultStyles, write=SetDefaultStyles};
	__property TAbstractcxNavBarDesigner* Designer = {read=FDesigner};
	__property Controls::TCursor DragCopyCursor = {read=FDragCopyCursor, write=FDragCopyCursor, nodefault};
	__property TdxNavBarDragDropFlags DragDropFlags = {read=FDragDropFlags, write=FDragDropFlags, nodefault};
	__property bool EachGroupHasSelectedLink = {read=FEachGroupHasSelectedLink, write=SetEachGroupHasSelectedLink, default=0};
	__property Controls::TCursor HotTrackedGroupCursor = {read=FHotTrackedGroupCursor, write=FHotTrackedGroupCursor, nodefault};
	__property Controls::TCursor HotTrackedLinkCursor = {read=FHotTrackedLinkCursor, write=FHotTrackedLinkCursor, nodefault};
	__property Dxnavbarcollns::TdxNavBarGroups* Groups = {read=FGroups};
	__property Dxnavbarcollns::TdxNavBarItems* Items = {read=FItems};
	__property Controls::TImageList* LargeImages = {read=FLargeImages, write=SetLargeImages};
	__property bool ShowGroupCaptions = {read=FShowGroupCaptions, write=SetShowGroupCaptions, default=1};
	__property bool ShowGroupsHint = {read=FShowGroupsHint, write=FShowGroupsHint, default=0};
	__property bool ShowLinksHint = {read=FShowLinksHint, write=FShowLinksHint, default=0};
	__property Controls::TImageList* SmallImages = {read=FSmallImages, write=SetSmallImages};
	__property int SpaceBetweenGroups = {read=FSpaceBetweenGroups, write=SetSpaceBetweenGroups, default=0};
	__property Dxnavbarstyles::TdxNavBarStyleItem* StyleBackground = {read=FStyleBackground, write=SetStyleBackground};
	__property Dxnavbarstyles::TdxNavBarStyleItem* StyleHint = {read=FStyleHint, write=SetStyleHint};
	__property Dxnavbarstyles::TdxNavBarStyleItem* StyleDropTargetGroup = {read=FStyleDropTargetGroup, write=SetStyleDropTargetGroup};
	__property Dxnavbarstyles::TdxNavBarStyleItem* StyleDropTargetLink = {read=FStyleDropTargetLink, write=SetStyleDropTargetLink};
	__property Dxnavbarstyles::TdxNavBarStyleItem* StyleButton = {read=FStyleButton, write=SetStyleButton};
	__property Dxnavbarstyles::TdxNavBarStyleItem* StyleButtonHotTracked = {read=FStyleButtonHotTracked, write=SetStyleButtonHotTracked};
	__property Dxnavbarstyles::TdxNavBarStyleItem* StyleButtonPressed = {read=FStyleButtonPressed, write=SetStyleButtonPressed};
	__property Dxnavbarstyles::TdxNavBarStyles* Styles = {read=FStyles};
	__property int View = {read=FView, write=SetView, nodefault};
	__property Classes::TNotifyEvent OnActiveGroupChanged = {read=FOnActiveGroupChanged, write=FOnActiveGroupChanged};
	__property TdxNavBarCalcGroupClientHeightEvent OnCalcGroupClientHeight = {read=FOnCalcGroupClientHeight, write=FOnCalcGroupClientHeight};
	__property TdxNavBarCalcGroupHintRectEvent OnCalcGroupHintRect = {read=FOnCalcGroupHintRect, write=FOnCalcGroupHintRect};
	__property TdxNavBarCalcLinkHintRectEvent OnCalcLinkHintRect = {read=FOnCalcLinkHintRect, write=FOnCalcLinkHintRect};
	__property TdxNavBarCustomDrawEvent OnCustomDrawBackground = {read=FOnCustomDrawBackground, write=FOnCustomDrawBackground};
	__property TdxNavBarCustomDrawGroupEvent OnCustomDrawGroupCaption = {read=FOnCustomDrawGroupCaption, write=FOnCustomDrawGroupCaption};
	__property TdxNavBarCustomDrawGroupEvent OnCustomDrawGroupClientBackground = {read=FOnCustomDrawGroupClientBackground, write=FOnCustomDrawGroupClientBackground};
	__property TdxNavBarCustomDrawGroupEvent OnCustomDrawGroupClientForeground = {read=FOnCustomDrawGroupClientForeground, write=FOnCustomDrawGroupClientForeground};
	__property TdxNavBarCustomDrawGroupHintEvent OnCustomDrawGroupHint = {read=FOnCustomDrawGroupHint, write=FOnCustomDrawGroupHint};
	__property TdxNavBarCustomDrawLinkEvent OnCustomDrawLink = {read=FOnCustomDrawLink, write=FOnCustomDrawLink};
	__property TdxNavBarCustomDrawLinkHintEvent OnCustomDrawLinkHint = {read=FOnCustomDrawLinkHint, write=FOnCustomDrawLinkHint};
	__property TdxNavBarCustomDrawEvent OnCustomDrawBottomScrollButton = {read=FOnCustomDrawBottomScrollButton, write=FOnCustomDrawBottomScrollButton};
	__property TdxNavBarCustomDrawEvent OnCustomDrawTopScrollButton = {read=FOnCustomDrawTopScrollButton, write=FOnCustomDrawTopScrollButton};
	__property TdxNavBarGetGroupHintEvent OnGetGroupHint = {read=FOnGetGroupHint, write=FOnGetGroupHint};
	__property TdxNavBarGetLinkHintEvent OnGetLinkHint = {read=FOnGetLinkHint, write=FOnGetLinkHint};
	__property TdxNavBarGroupEvent OnGroupClick = {read=FOnGroupClick, write=FOnGroupClick};
	__property TdxNavBarGroupEvent OnGroupHotTrack = {read=FOnGroupHotTrack, write=FOnGroupHotTrack};
	__property TdxNavBarGroupEvent OnGroupPress = {read=FOnGroupPress, write=FOnGroupPress};
	__property TdxNavBarLinkEvent OnLinkClick = {read=FOnLinkClick, write=FOnLinkClick};
	__property TdxNavBarLinkEvent OnLinkHotTrack = {read=FOnLinkHotTrack, write=FOnLinkHotTrack};
	__property TdxNavBarLinkEvent OnLinkPress = {read=FOnLinkPress, write=FOnLinkPress};
	__property Classes::TNotifyEvent OnMouseEnter = {read=FOnMouseEnter, write=FOnMouseEnter};
	__property Classes::TNotifyEvent OnMouseLeave = {read=FOnMouseLeave, write=FOnMouseLeave};
	
__published:
	__property Align  = {default=0};
	__property Anchors  = {default=3};
	__property BorderStyle  = {default=0};
	__property Constraints ;
	__property Ctl3D ;
	__property Enabled  = {default=1};
	__property Locked  = {default=0};
	__property PopupMenu ;
	__property Visible  = {default=1};
	__property OnContextPopup ;
	__property OnMouseDown ;
	__property OnMouseMove ;
	__property OnMouseUp ;
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TdxCustomNavBar(HWND ParentWindow) : Extctrls::TCustomPanel(ParentWindow) { }
	#pragma option pop
	
};


typedef TMetaClass*TdxNavBarViewInfoClass;

typedef TMetaClass*TdxNavBarGroupViewInfoClass;

typedef TMetaClass*TdxNavBarLinkViewInfoClass;

typedef TMetaClass*TdxBaseBackgroundPainterClass;

typedef TMetaClass*TdxBaseButtonPainterClass;

typedef TMetaClass*TdxBaseDropTargetGroupPainterClass;

typedef TMetaClass*TdxBaseDropTargetLinkPainterClass;

typedef TMetaClass*TdxBaseScrollButtonsPainterClass;

typedef TMetaClass*TdxBaseImagePainterClass;

typedef TMetaClass*TdxBaseSelectionPainterClass;

typedef TMetaClass*TdxBaseSignPainterClass;

class PASCALIMPLEMENTATION TdxNavBarPainter : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	bool FNeedRecreateViewInfo;
	bool FNeedRecalculateViewInfo;
	bool FNeedRedrawCanvas;
	TdxCustomNavBar* FNavBar;
	TdxNavBarViewInfo* FViewInfo;
	
protected:
	int __fastcall ClientHeight(void);
	int __fastcall ClientWidth(void);
	virtual void __fastcall DrawNavBarControl(void);
	virtual void __fastcall DrawBackground(void);
	virtual void __fastcall DrawGroups(void);
	virtual void __fastcall DrawGroup(TdxNavBarGroupViewInfo* AGroupViewInfo);
	virtual void __fastcall DrawGroupBackground(TdxNavBarGroupViewInfo* AGroupViewInfo);
	virtual void __fastcall DrawGroupBorder(TdxNavBarGroupViewInfo* AGroupViewInfo);
	virtual void __fastcall DrawGroupCaption(TdxNavBarGroupViewInfo* AGroupViewInfo);
	virtual void __fastcall DrawGroupCaptionButton(TdxNavBarGroupViewInfo* AGroupViewInfo);
	virtual void __fastcall DrawGroupCaptionText(TdxNavBarGroupViewInfo* AGroupViewInfo);
	virtual void __fastcall DrawGroupCaptionImage(TdxNavBarGroupViewInfo* AGroupViewInfo);
	virtual void __fastcall DrawGroupCaptionSign(TdxNavBarGroupViewInfo* AGroupViewInfo);
	virtual void __fastcall DrawGroupItems(TdxNavBarGroupViewInfo* AGroupViewInfo);
	virtual void __fastcall DrawItem(TdxNavBarLinkViewInfo* ALinkViewInfo);
	virtual void __fastcall DrawItemCaption(TdxNavBarLinkViewInfo* ALinkViewInfo);
	virtual void __fastcall DrawItemImage(TdxNavBarLinkViewInfo* ALinkViewInfo);
	virtual void __fastcall DrawItemSelection(TdxNavBarLinkViewInfo* ALinkViewInfo);
	virtual void __fastcall DrawScrollButtons(void);
	virtual void __fastcall DrawBottomScrollButton(void);
	virtual void __fastcall DrawTopScrollButton(void);
	virtual void __fastcall DrawDropTargetGroupSelection(void);
	virtual void __fastcall DrawDropTargetLinkSelection(void);
	virtual void __fastcall DrawGroupHintWindow(void);
	virtual void __fastcall DrawLinkHintWindow(void);
	/* virtual class method */ virtual TMetaClass* __fastcall ViewInfoClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall GroupViewInfoClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall LinkViewInfoClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall BackgroundPainterClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall ButtonPainterClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall DropTargetGroupPainterClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall DropTargetLinkPainterClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall ScrollButtonsPainterClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall ImagePainterClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall SelectionPainterClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall SignPainterClass(TMetaClass* vmt);
	
public:
	__fastcall virtual TdxNavBarPainter(TdxCustomNavBar* ANavBar);
	__fastcall virtual ~TdxNavBarPainter(void);
	Graphics::TCanvas* __fastcall Canvas(void);
	HDC __fastcall DC(void);
	Graphics::TCanvas* __fastcall HintWindowCanvas(void);
	HDC __fastcall HintWindowDC(void);
	virtual void __fastcall AssignDefaultBackgroundStyle(void);
	virtual void __fastcall AssignDefaultButtonStyle(void);
	virtual void __fastcall AssignDefaultButtonPressedStyle(void);
	virtual void __fastcall AssignDefaultButtonHotTrackedStyle(void);
	virtual void __fastcall AssignDefaultGroupBackgroundStyle(void);
	virtual void __fastcall AssignDefaultGroupHeaderStyle(void);
	virtual void __fastcall AssignDefaultGroupHeaderActiveStyle(void);
	virtual void __fastcall AssignDefaultGroupHeaderHotTrackedStyle(void);
	virtual void __fastcall AssignDefaultGroupHeaderPressedStyle(void);
	virtual void __fastcall AssignDefaultHintStyle(void);
	virtual void __fastcall AssignDefaultItemStyle(void);
	virtual void __fastcall AssignDefaultItemDisabledStyle(void);
	virtual void __fastcall AssignDefaultItemHotTrackedStyle(void);
	virtual void __fastcall AssignDefaultItemPressedStyle(void);
	virtual void __fastcall AssignDefaultDropTargetGroupStyle(void);
	virtual void __fastcall AssignDefaultDropTargetLinkStyle(void);
	virtual void __fastcall DoActivate(void);
	virtual void __fastcall DoGroupActivate(Dxnavbarcollns::TdxNavBarGroup* AGroup);
	virtual void __fastcall DoGroupDeactivate(Dxnavbarcollns::TdxNavBarGroup* AGroup);
	virtual bool __fastcall IsGroupActive(Dxnavbarcollns::TdxNavBarGroup* AGroup);
	void __fastcall Paint(void);
	void __fastcall InvalidateViewInfo(Dxnavbarbase::TdxNavBarChangeType AType);
	void __fastcall InvalidateScrollButtons(void);
	__property TdxCustomNavBar* NavBar = {read=FNavBar};
	__property TdxNavBarViewInfo* ViewInfo = {read=FViewInfo};
};


class PASCALIMPLEMENTATION TdxNavBarViewInfo : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	TdxNavBarPainter* FPainter;
	TdxCustomNavBar* FNavBar;
	Classes::TList* FGroups;
	#pragma pack(push, 1)
	Types::TRect FTopScrollButtonRect;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect FBottomScrollButtonRect;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect FHintRect;
	#pragma pack(pop)
	
	AnsiString FHintText;
	int __fastcall GetGroupCount(void);
	TdxNavBarGroupViewInfo* __fastcall GetGroup(int Index);
	TdxNavBarObjectStates __fastcall GetBottomScrollButtonState(void);
	TdxNavBarObjectStates __fastcall GetTopScrollButtonState(void);
	
protected:
	int __fastcall GetLargeImageHeight(void);
	int __fastcall GetLargeImageWidth(void);
	int __fastcall GetSmallImageHeight(void);
	int __fastcall GetSmallImageWidth(void);
	int __fastcall GetSpaceBetweenGroups(void);
	/* virtual class method */ virtual int __fastcall GetGroupBorderWidth(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall GetGroupCaptionHeightAddon(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall GetGroupSeparatorWidth(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall GetGroupCaptionSignSize(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall GetGroupHorizontalEdge(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall GetGroupCaptionSeparatorWidth(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall GetLinksLargeSeparatorWidth(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall GetLinksSmallSeparatorWidth(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall GetLinksIconViewSeparatorWidth(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall GetLinksImageVerticalEdge(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall GetLinksImageHorizontalEdge(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall GetDragArrowHeight(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall GetDragArrowWidth(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall GetScrollButtonVerticalEdge(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall GetScrollButtonHorizontalEdge(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall GetScrollButtonVerticalSize(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall GetScrollButtonHorizontalSize(TMetaClass* vmt);
	virtual bool __fastcall CanHasScrollButtonInGroupCaption(void);
	virtual bool __fastcall CanHasImageInGroupCaption(void);
	virtual bool __fastcall CanHasSignInGroupCaption(void);
	virtual bool __fastcall CanHasGroupViewAsIconView(void);
	virtual bool __fastcall CanHasVisibleItemsInGroup(Dxnavbarcollns::TdxNavBarGroup* AGroup);
	virtual bool __fastcall CanGroupsUseLargeImages(void);
	virtual bool __fastcall CanLinksUseLargeImages(void);
	void __fastcall AddGroup(TdxNavBarViewInfo* AViewInfo, Dxnavbarcollns::TdxNavBarGroup* AGroup);
	void __fastcall ClearGroups(void);
	virtual void __fastcall AdjustControlsBounds(void);
	virtual void __fastcall RecreateInfo(void);
	virtual void __fastcall Recalculate(void);
	virtual void __fastcall CorrectViewInfo(void);
	virtual void __fastcall CorrectScrollInfo(void);
	virtual Types::TRect __fastcall GetTopScrollButtonRect();
	virtual Types::TRect __fastcall GetBottomScrollButtonRect();
	virtual void __fastcall RecalculateHint(void);
	virtual Types::TRect __fastcall GetGroupHintRect(Dxnavbarcollns::TdxNavBarGroup* AGroup);
	virtual AnsiString __fastcall GetGroupHintText(Dxnavbarcollns::TdxNavBarGroup* AGroup);
	virtual Types::TRect __fastcall GetLinkHintRect(Dxnavbarcollns::TdxNavBarItemLink* ALink);
	virtual AnsiString __fastcall GetLinkHintText(Dxnavbarcollns::TdxNavBarItemLink* ALink);
	
public:
	__fastcall virtual TdxNavBarViewInfo(TdxNavBarPainter* APainter);
	__fastcall virtual ~TdxNavBarViewInfo(void);
	virtual Graphics::TPicture* __fastcall BgImage(void);
	virtual Graphics::TColor __fastcall BgBackColor(void);
	virtual Graphics::TColor __fastcall BgBackColor2(void);
	virtual Byte __fastcall BgAlphaBlend(void);
	virtual Byte __fastcall BgAlphaBlend2(void);
	virtual Dxnavbarstyles::TdxBarStyleGradientMode __fastcall BgGradientMode(void);
	virtual Dxnavbarstyles::TdxNavBarStyleItem* __fastcall BottomButtonStyleItem(void);
	virtual Dxnavbarstyles::TdxBaseNavBarStyle* __fastcall BottomButtonStyle(void);
	virtual Graphics::TPicture* __fastcall BottomButtonImage(void);
	virtual Graphics::TColor __fastcall BottomButtonBackColor(void);
	virtual Graphics::TColor __fastcall BottomButtonBackColor2(void);
	virtual Byte __fastcall BottomButtonAlphaBlend(void);
	virtual Byte __fastcall BottomButtonAlphaBlend2(void);
	virtual Dxnavbarstyles::TdxBarStyleGradientMode __fastcall BottomButtonGradientMode(void);
	virtual Dxnavbarstyles::TdxNavBarStyleItem* __fastcall TopButtonStyleItem(void);
	virtual Dxnavbarstyles::TdxBaseNavBarStyle* __fastcall TopButtonStyle(void);
	virtual Graphics::TPicture* __fastcall TopButtonImage(void);
	virtual Graphics::TColor __fastcall TopButtonBackColor(void);
	virtual Graphics::TColor __fastcall TopButtonBackColor2(void);
	virtual Byte __fastcall TopButtonAlphaBlend(void);
	virtual Byte __fastcall TopButtonAlphaBlend2(void);
	virtual Dxnavbarstyles::TdxBarStyleGradientMode __fastcall TopButtonGradientMode(void);
	virtual Graphics::TPicture* __fastcall HintImage(void);
	virtual Graphics::TColor __fastcall HintBackColor(void);
	virtual Graphics::TColor __fastcall HintBackColor2(void);
	virtual Byte __fastcall HintAlphaBlend(void);
	virtual Byte __fastcall HintAlphaBlend2(void);
	virtual Dxnavbarstyles::TdxBarStyleGradientMode __fastcall HintGradientMode(void);
	virtual Graphics::TFont* __fastcall HintFont(void);
	virtual Graphics::TColor __fastcall DrarDropItemTargetBackColor(void);
	virtual Graphics::TColor __fastcall DrarDropGroupTargetBackColor(void);
	virtual Graphics::TColor __fastcall DrarDropGroupTargetBackColor2(void);
	virtual Byte __fastcall DrarDropGroupTargetAlphaBlend(void);
	virtual Byte __fastcall DrarDropGroupTargetAlphaBlend2(void);
	virtual Dxnavbarstyles::TdxBarStyleGradientMode __fastcall DrarDropGroupTargetGradient(void);
	TdxNavBarGroupViewInfo* __fastcall ActiveGroupViewInfo(void);
	TdxNavBarGroupViewInfo* __fastcall GetGroupViewInfoByGroup(Dxnavbarcollns::TdxNavBarGroup* AGroup);
	TdxNavBarLinkViewInfo* __fastcall GetLinkViewInfoByLink(Dxnavbarcollns::TdxNavBarItemLink* ALink);
	int __fastcall IndexOfGroupViewInfo(TdxNavBarGroupViewInfo* AViewInfo);
	virtual TdxNavBarGroupViewInfo* __fastcall GetGroupViewInfoAtCaptionPos(const Types::TPoint &pt);
	Dxnavbarcollns::TdxNavBarGroup* __fastcall GetGroupAtCaptionPos(const Types::TPoint &pt);
	virtual TdxNavBarGroupViewInfo* __fastcall GetGroupViewInfoAtItemsPos(const Types::TPoint &pt);
	Dxnavbarcollns::TdxNavBarGroup* __fastcall GetGroupAtItemsPos(const Types::TPoint &pt);
	virtual TdxNavBarLinkViewInfo* __fastcall GetLinkViewInfoAtPos(const Types::TPoint &pt);
	Dxnavbarcollns::TdxNavBarItemLink* __fastcall GetLinkAtPos(const Types::TPoint &pt);
	virtual TdxNavBarLinkViewInfo* __fastcall GetLinkViewInfoAtSelectedPos(const Types::TPoint &pt);
	Dxnavbarcollns::TdxNavBarItemLink* __fastcall GetLinkAtSelectedPos(const Types::TPoint &pt);
	virtual int __fastcall GetViewInfoAtDragPosition(const Types::TPoint &pt, TdxNavBarGroupViewInfo* &ItemGroup, TdxNavBarLinkViewInfo* &Item1, TdxNavBarLinkViewInfo* &Item2);
	int __fastcall GetLinksAtDragPosition(const Types::TPoint &pt, Dxnavbarcollns::TdxNavBarGroup* &ItemGroup, Dxnavbarcollns::TdxNavBarItemLink* &Item1, Dxnavbarcollns::TdxNavBarItemLink* &Item2);
	bool __fastcall IsTopScrollButtonVisible(void);
	bool __fastcall IsBottomScrollButtonVisible(void);
	bool __fastcall IsPtTopScrollButton(const Types::TPoint &pt);
	bool __fastcall IsPtBottomScrollButton(const Types::TPoint &pt);
	__property Types::TRect TopScrollButtonRect = {read=FTopScrollButtonRect};
	__property Types::TRect BottomScrollButtonRect = {read=FBottomScrollButtonRect};
	__property TdxNavBarObjectStates TopScrollButtonState = {read=GetTopScrollButtonState, nodefault};
	__property TdxNavBarObjectStates BottomScrollButtonState = {read=GetBottomScrollButtonState, nodefault};
	virtual int __fastcall HintDelay(void);
	__property Types::TRect HintRect = {read=FHintRect};
	__property AnsiString HintText = {read=FHintText};
	__property int GroupCount = {read=GetGroupCount, nodefault};
	__property TdxNavBarGroupViewInfo* Groups[int Index] = {read=GetGroup};
	__property TdxCustomNavBar* NavBar = {read=FNavBar};
	__property TdxNavBarPainter* Painter = {read=FPainter};
};


class PASCALIMPLEMENTATION TdxNavBarGroupViewInfo : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	TdxNavBarViewInfo* FViewInfo;
	Classes::TList* FItems;
	Dxnavbarcollns::TdxNavBarGroup* FGroup;
	TdxCustomNavBar* FNavBar;
	TdxNavBarPainter* FPainter;
	#pragma pack(push, 1)
	Types::TRect FCaptionRect;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect FCaptionImageRect;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect FCaptionSignRect;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect FCaptionTextRect;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect FItemsRect;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect FRect;
	#pragma pack(pop)
	
	Dxnavbarcollns::TdxNavBarGroupControl* __fastcall GetControl(void);
	Types::TRect __fastcall GetControlRect();
	int __fastcall GetItemCount(void);
	TdxNavBarLinkViewInfo* __fastcall GetItem(int Index);
	TdxNavBarObjectStates __fastcall GetState(void);
	
protected:
	void __fastcall AddLink(TdxNavBarViewInfo* AViewInfo, Dxnavbarcollns::TdxNavBarItemLink* ALink);
	void __fastcall ClearItems(void);
	virtual void __fastcall AdjustControlBounds(void);
	virtual void __fastcall RecreateInfo(void);
	virtual void __fastcall Recalculate(int X, int Y);
	virtual void __fastcall CorrectViewInfo(int dX, int dY);
	virtual void __fastcall CorrectActiveGroupViewInfo(int dX, int dY);
	
public:
	__fastcall TdxNavBarGroupViewInfo(TdxNavBarViewInfo* AViewInfo, Dxnavbarcollns::TdxNavBarGroup* AGroup);
	__fastcall virtual ~TdxNavBarGroupViewInfo(void);
	TdxNavBarLinkViewInfo* __fastcall GetLinkViewInfoByLink(Dxnavbarcollns::TdxNavBarItemLink* ALink);
	int __fastcall IndexOfLinkViewInfo(TdxNavBarLinkViewInfo* AViewInfo);
	virtual int __fastcall GetCaptionHeight(void);
	virtual int __fastcall GetDrawEdgeFlag(void);
	virtual int __fastcall GetImageHeight(void);
	virtual int __fastcall GetImageWidth(void);
	bool __fastcall IsCaptionVisible(void);
	bool __fastcall IsCaptionImageVisible(void);
	bool __fastcall IsCaptionSignVisible(void);
	bool __fastcall IsCaptionUseSmallImages(void);
	bool __fastcall IsItemsVisible(void);
	bool __fastcall IsLinksUseSmallImages(void);
	bool __fastcall IsViewAsIconView(void);
	virtual Graphics::TPicture* __fastcall BgImage(void);
	virtual Graphics::TColor __fastcall BgBackColor(void);
	virtual Graphics::TColor __fastcall BgBackColor2(void);
	virtual Byte __fastcall BgAlphaBlend(void);
	virtual Byte __fastcall BgAlphaBlend2(void);
	virtual Dxnavbarstyles::TdxBarStyleGradientMode __fastcall BgGradientMode(void);
	virtual Dxnavbarstyles::TdxNavBarStyleItem* __fastcall CaptionStyleItem(void);
	virtual Dxnavbarstyles::TdxBaseNavBarStyle* __fastcall CaptionStyle(void);
	virtual Graphics::TPicture* __fastcall CaptionImage(void);
	virtual Graphics::TColor __fastcall CaptionBackColor(void);
	virtual Graphics::TColor __fastcall CaptionBackColor2(void);
	virtual Byte __fastcall CaptionAlphaBlend(void);
	virtual Byte __fastcall CaptionAlphaBlend2(void);
	virtual Dxnavbarstyles::TdxBarStyleGradientMode __fastcall CaptionGradientMode(void);
	virtual Graphics::TFont* __fastcall CaptionFont(void);
	virtual Graphics::TColor __fastcall CaptionFontColor(void);
	virtual Graphics::TColor __fastcall CaptionSignColor(void);
	virtual Dxnavbarstyles::TdxBarStyleHAlignment __fastcall CaptionHAlignment(void);
	virtual Dxnavbarstyles::TdxBarStyleVAlignment __fastcall CaptionVAlignment(void);
	virtual int __fastcall ImageIndex(void);
	virtual Controls::TImageList* __fastcall ImageList(void);
	__property Types::TRect CaptionRect = {read=FCaptionRect};
	__property Types::TRect CaptionImageRect = {read=FCaptionImageRect};
	__property Types::TRect CaptionSignRect = {read=FCaptionSignRect};
	__property Types::TRect CaptionTextRect = {read=FCaptionTextRect};
	__property Types::TRect ControlRect = {read=GetControlRect};
	__property Types::TRect ItemsRect = {read=FItemsRect};
	__property Types::TRect Rect = {read=FRect};
	__property Dxnavbarcollns::TdxNavBarGroupControl* Control = {read=GetControl};
	__property int ItemCount = {read=GetItemCount, nodefault};
	__property TdxNavBarLinkViewInfo* Items[int Index] = {read=GetItem};
	__property Dxnavbarcollns::TdxNavBarGroup* Group = {read=FGroup};
	__property TdxCustomNavBar* NavBar = {read=FNavBar};
	__property TdxNavBarPainter* Painter = {read=FPainter};
	__property TdxNavBarObjectStates State = {read=GetState, nodefault};
	__property TdxNavBarViewInfo* ViewInfo = {read=FViewInfo};
};


class PASCALIMPLEMENTATION TdxNavBarLinkViewInfo : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	TdxNavBarGroupViewInfo* FGroupViewInfo;
	TdxCustomNavBar* FNavBar;
	TdxNavBarPainter* FPainter;
	TdxNavBarViewInfo* FViewInfo;
	Dxnavbarcollns::TdxNavBarItemLink* FLink;
	Dxnavbarcollns::TdxNavBarItem* FItem;
	#pragma pack(push, 1)
	Types::TRect FRect;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect FImageRect;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect FCaptionRect;
	#pragma pack(pop)
	
	TdxNavBarObjectStates __fastcall GetState(void);
	
protected:
	virtual void __fastcall Recalculate(int X, int Y);
	virtual void __fastcall CorrectViewInfo(int dX, int dY);
	
public:
	__fastcall TdxNavBarLinkViewInfo(TdxNavBarGroupViewInfo* AGroupViewInfo, Dxnavbarcollns::TdxNavBarItemLink* ALink);
	virtual int __fastcall GetCaptionHeight(void);
	virtual int __fastcall GetDrawEdgeFlag(void);
	virtual int __fastcall GetImageHeight(void);
	virtual int __fastcall GetImageWidth(void);
	bool __fastcall IsCaptionVisible(void);
	bool __fastcall IsImageVisible(void);
	virtual Dxnavbarstyles::TdxNavBarStyleItem* __fastcall StyleItem(void);
	virtual Dxnavbarstyles::TdxBaseNavBarStyle* __fastcall Style(void);
	virtual Graphics::TFont* __fastcall Font(void);
	virtual Graphics::TColor __fastcall FontColor(void);
	virtual int __fastcall ImageIndex(void);
	virtual Controls::TImageList* __fastcall ImageList(void);
	virtual Types::TRect __fastcall SelectionRect();
	__property Types::TRect Rect = {read=FRect};
	__property Types::TRect CaptionRect = {read=FCaptionRect};
	__property Types::TRect ImageRect = {read=FImageRect};
	__property Dxnavbarcollns::TdxNavBarItemLink* Link = {read=FLink};
	__property Dxnavbarcollns::TdxNavBarItem* Item = {read=FItem};
	__property TdxNavBarGroupViewInfo* GroupViewInfo = {read=FGroupViewInfo};
	__property TdxCustomNavBar* NavBar = {read=FNavBar};
	__property TdxNavBarPainter* Painter = {read=FPainter};
	__property TdxNavBarObjectStates State = {read=GetState, nodefault};
	__property TdxNavBarViewInfo* ViewInfo = {read=FViewInfo};
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxNavBarLinkViewInfo(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxBaseImagePainter;
class PASCALIMPLEMENTATION TdxBaseImagePainter : public System::TObject 
{
	typedef System::TObject inherited;
	
protected:
	/* virtual class method */ virtual void __fastcall InternalDrawImage(TMetaClass* vmt, Graphics::TCanvas* ACanvas, Controls::TImageList* AImageList, int AImageIndex, const Types::TRect &R);
	
public:
	/*         class method */ static void __fastcall DrawImage(TMetaClass* vmt, Graphics::TCanvas* ACanvas, Controls::TImageList* AImageList, int AImageIndex, const Types::TRect &R);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TdxBaseImagePainter(void) : System::TObject() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxBaseImagePainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxBaseSelectionPainter;
class PASCALIMPLEMENTATION TdxBaseSelectionPainter : public System::TObject 
{
	typedef System::TObject inherited;
	
protected:
	/* virtual class method */ virtual void __fastcall InternalDrawSelection(TMetaClass* vmt, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, Graphics::TColor ABackColor, TdxNavBarObjectStates AState);
	
public:
	/*         class method */ static void __fastcall DrawSelection(TMetaClass* vmt, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, Graphics::TColor ABackColor, TdxNavBarObjectStates AState);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TdxBaseSelectionPainter(void) : System::TObject() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxBaseSelectionPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxBaseBackgroundPainter;
class PASCALIMPLEMENTATION TdxBaseBackgroundPainter : public System::TObject 
{
	typedef System::TObject inherited;
	
protected:
	/* virtual class method */ virtual void __fastcall InternalDrawBackground(TMetaClass* vmt, Graphics::TCanvas* ACanvas, const Types::TRect &R, Graphics::TPicture* APicture, bool AEraseBackground, Graphics::TColor AColor1, Graphics::TColor AColor2, Byte AAlphaBlend1, Byte AAlphaBlend2, Dxnavbarstyles::TdxBarStyleGradientMode AGradientMode);
	
public:
	/*         class method */ static void __fastcall DrawBackground(TMetaClass* vmt, Graphics::TCanvas* ACanvas, const Types::TRect &R, Graphics::TPicture* APicture, bool AEraseBackground, Graphics::TColor AColor1, Graphics::TColor AColor2, Byte AAlphaBlend1, Byte AAlphaBlend2, Dxnavbarstyles::TdxBarStyleGradientMode AGradientMode);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TdxBaseBackgroundPainter(void) : System::TObject() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxBaseBackgroundPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxBaseSignPainter;
class PASCALIMPLEMENTATION TdxBaseSignPainter : public System::TObject 
{
	typedef System::TObject inherited;
	
protected:
	/* virtual class method */ virtual void __fastcall InternalDrawSign(TMetaClass* vmt, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, Graphics::TColor AForeColor, Graphics::TColor ABackColor, TdxNavBarObjectStates AState);
	
public:
	/*         class method */ static void __fastcall DrawSign(TMetaClass* vmt, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, Graphics::TColor AForeColor, Graphics::TColor ABackColor, TdxNavBarObjectStates AState);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TdxBaseSignPainter(void) : System::TObject() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxBaseSignPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxBaseHintPainter;
class PASCALIMPLEMENTATION TdxBaseHintPainter : public System::TObject 
{
	typedef System::TObject inherited;
	
protected:
	/* virtual class method */ virtual void __fastcall InternalDrawHint(TMetaClass* vmt, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, AnsiString AHint, Graphics::TPicture* APicture, Graphics::TColor AColor1, Graphics::TColor AColor2, Byte AAlphaBlend1, Byte AAlphaBlend2, Dxnavbarstyles::TdxBarStyleGradientMode AGradientMode, Graphics::TFont* AFont);
	
public:
	/*         class method */ static void __fastcall DrawHint(TMetaClass* vmt, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, AnsiString AHint, Graphics::TPicture* APicture, Graphics::TColor AColor1, Graphics::TColor AColor2, Byte AAlphaBlend1, Byte AAlphaBlend2, Dxnavbarstyles::TdxBarStyleGradientMode AGradientMode, Graphics::TFont* AFont);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TdxBaseHintPainter(void) : System::TObject() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxBaseHintPainter(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TdxBaseHintPainterClass;

class DELPHICLASS TdxBaseButtonPainter;
class PASCALIMPLEMENTATION TdxBaseButtonPainter : public System::TObject 
{
	typedef System::TObject inherited;
	
protected:
	/* virtual class method */ virtual void __fastcall InternalDrawButton(TMetaClass* vmt, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, Graphics::TPicture* APicture, Graphics::TColor AColor1, Graphics::TColor AColor2, Byte AAlphaBlend1, Byte AAlphaBlend2, Dxnavbarstyles::TdxBarStyleGradientMode AGradientMode, TdxNavBarObjectStates AState);
	
public:
	/*         class method */ static void __fastcall DrawButton(TMetaClass* vmt, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, Graphics::TPicture* APicture, Graphics::TColor AColor1, Graphics::TColor AColor2, Byte AAlphaBlend1, Byte AAlphaBlend2, Dxnavbarstyles::TdxBarStyleGradientMode AGradientMode, TdxNavBarObjectStates AState);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TdxBaseButtonPainter(void) : System::TObject() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxBaseButtonPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxBaseScrollButtonsPainter;
class PASCALIMPLEMENTATION TdxBaseScrollButtonsPainter : public System::TObject 
{
	typedef System::TObject inherited;
	
protected:
	/* virtual class method */ virtual void __fastcall InternalDrawBottomButton(TMetaClass* vmt, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, TMetaClass* AButtonPainterClass, Graphics::TColor AColor1, Graphics::TColor AColor2, Byte AAlphaBlend1, Byte AAlphaBlend2, Dxnavbarstyles::TdxBarStyleGradientMode AGradientMode, TdxNavBarObjectStates AState);
	/* virtual class method */ virtual void __fastcall InternalDrawTopButton(TMetaClass* vmt, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, TMetaClass* AButtonPainterClass, Graphics::TColor AColor1, Graphics::TColor AColor2, Byte AAlphaBlend1, Byte AAlphaBlend2, Dxnavbarstyles::TdxBarStyleGradientMode AGradientMode, TdxNavBarObjectStates AState);
	
public:
	/*         class method */ static void __fastcall DrawBottomButton(TMetaClass* vmt, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, TMetaClass* AButtonPainterClass, Graphics::TColor AColor1, Graphics::TColor AColor2, Byte AAlphaBlend1, Byte AAlphaBlend2, Dxnavbarstyles::TdxBarStyleGradientMode AGradientMode, TdxNavBarObjectStates AState);
	/*         class method */ static void __fastcall DrawTopButton(TMetaClass* vmt, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, TMetaClass* AButtonPainterClass, Graphics::TColor AColor1, Graphics::TColor AColor2, Byte AAlphaBlend1, Byte AAlphaBlend2, Dxnavbarstyles::TdxBarStyleGradientMode AGradientMode, TdxNavBarObjectStates AState);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TdxBaseScrollButtonsPainter(void) : System::TObject() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxBaseScrollButtonsPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxBaseDropTargetLinkPainter;
class PASCALIMPLEMENTATION TdxBaseDropTargetLinkPainter : public System::TObject 
{
	typedef System::TObject inherited;
	
protected:
	/* virtual class method */ virtual void __fastcall InternalDrawTargetLink(TMetaClass* vmt, Graphics::TCanvas* ACanvas, const Types::TPoint &pt1, const Types::TPoint &pt2, const Types::TPoint &pt3, const Types::TPoint &pt4, const Types::TPoint &pt5, const Types::TPoint &pt6, Graphics::TColor AColor);
	
public:
	/*         class method */ static void __fastcall DrawTargetLink(TMetaClass* vmt, Graphics::TCanvas* ACanvas, const Types::TPoint &pt1, const Types::TPoint &pt2, const Types::TPoint &pt3, const Types::TPoint &pt4, const Types::TPoint &pt5, const Types::TPoint &pt6, Graphics::TColor AColor);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TdxBaseDropTargetLinkPainter(void) : System::TObject() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxBaseDropTargetLinkPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxBaseDropTargetGroupPainter;
class PASCALIMPLEMENTATION TdxBaseDropTargetGroupPainter : public System::TObject 
{
	typedef System::TObject inherited;
	
protected:
	/* virtual class method */ virtual void __fastcall InternalDrawTargetGroup(TMetaClass* vmt, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, Graphics::TColor AColor1, Graphics::TColor AColor2, Byte AAlphaBlend1, Byte AAlphaBlend2, Dxnavbarstyles::TdxBarStyleGradientMode AGradientMode);
	
public:
	/*         class method */ static void __fastcall DrawTargetGroup(TMetaClass* vmt, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, Graphics::TColor AColor1, Graphics::TColor AColor2, Byte AAlphaBlend1, Byte AAlphaBlend2, Dxnavbarstyles::TdxBarStyleGradientMode AGradientMode);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TdxBaseDropTargetGroupPainter(void) : System::TObject() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxBaseDropTargetGroupPainter(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TdxNavBarPainterClass;

class DELPHICLASS TdxNavBarDragObject;
class PASCALIMPLEMENTATION TdxNavBarDragObject : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	Controls::TDragObject* FDragObject;
	TdxCustomNavBar* FNavBar;
	Dxnavbarcollns::TdxNavBarGroup* FSourceGroup;
	Dxnavbarcollns::TdxNavBarItemLink* FSourceLink;
	Dxnavbarcollns::TdxNavBarItem* FSourceItem;
	Dxnavbarcollns::TdxNavBarGroup* FTargetGroup;
	Dxnavbarcollns::TdxNavBarItemLink* FTargetLink1;
	Dxnavbarcollns::TdxNavBarItemLink* FTargetLink2;
	int FTargetLinkIndex;
	Dxnavbarcollns::TdxNavBarItem* __fastcall GetSourceItem(void);
	
protected:
	virtual void __fastcall UpdateTargets(void);
	
public:
	__fastcall TdxNavBarDragObject(TdxCustomNavBar* ANavBar, Controls::TDragObject* &DragObject, Dxnavbarcollns::TdxNavBarGroup* ASourceGroup, Dxnavbarcollns::TdxNavBarItemLink* ASourceLink, Dxnavbarcollns::TdxNavBarItem* ASourceItem);
	__fastcall virtual ~TdxNavBarDragObject(void);
	__property TdxCustomNavBar* NavBar = {read=FNavBar};
	__property Dxnavbarcollns::TdxNavBarGroup* SourceGroup = {read=FSourceGroup};
	__property Dxnavbarcollns::TdxNavBarItemLink* SourceLink = {read=FSourceLink};
	__property Dxnavbarcollns::TdxNavBarItem* SourceItem = {read=GetSourceItem};
	__property Dxnavbarcollns::TdxNavBarGroup* TargetGroup = {read=FTargetGroup};
	__property Dxnavbarcollns::TdxNavBarItemLink* TargetLink1 = {read=FTargetLink1};
	__property Dxnavbarcollns::TdxNavBarItemLink* TargetLink2 = {read=FTargetLink2};
	__property int TargetLinkIndex = {read=FTargetLinkIndex, nodefault};
};


class DELPHICLASS TdxNavBar;
class PASCALIMPLEMENTATION TdxNavBar : public TdxCustomNavBar 
{
	typedef TdxCustomNavBar inherited;
	
__published:
	__property ActiveGroupIndex ;
	__property AllowSelectLinks  = {default=0};
	__property DefaultStyles ;
	__property DragCopyCursor ;
	__property DragCursor  = {default=-12};
	__property DragDropFlags ;
	__property EachGroupHasSelectedLink  = {default=0};
	__property HotTrackedGroupCursor ;
	__property HotTrackedLinkCursor ;
	__property LargeImages ;
	__property ShowGroupCaptions  = {default=1};
	__property ShowGroupsHint  = {default=0};
	__property ShowLinksHint  = {default=0};
	__property SmallImages ;
	__property SpaceBetweenGroups  = {default=0};
	__property StyleBackground ;
	__property StyleHint ;
	__property StyleDropTargetGroup ;
	__property StyleDropTargetLink ;
	__property StyleButton ;
	__property StyleButtonHotTracked ;
	__property StyleButtonPressed ;
	__property View ;
	__property OnActiveGroupChanged ;
	__property OnCalcGroupClientHeight ;
	__property OnCalcGroupHintRect ;
	__property OnCalcLinkHintRect ;
	__property OnCustomDrawBackground ;
	__property OnCustomDrawGroupCaption ;
	__property OnCustomDrawGroupClientBackground ;
	__property OnCustomDrawGroupClientForeground ;
	__property OnCustomDrawGroupHint ;
	__property OnCustomDrawLink ;
	__property OnCustomDrawLinkHint ;
	__property OnCustomDrawBottomScrollButton ;
	__property OnCustomDrawTopScrollButton ;
	__property OnDragDrop ;
	__property OnDragOver ;
	__property OnEndDrag ;
	__property OnGetGroupHint ;
	__property OnGetLinkHint ;
	__property OnGroupClick ;
	__property OnGroupHotTrack ;
	__property OnGroupPress ;
	__property OnLinkClick ;
	__property OnLinkHotTrack ;
	__property OnLinkPress ;
	__property OnMouseEnter ;
	__property OnMouseLeave ;
	__property OnStartDrag ;
public:
	#pragma option push -w-inl
	/* TdxCustomNavBar.Create */ inline __fastcall virtual TdxNavBar(Classes::TComponent* AOwner) : TdxCustomNavBar(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TdxCustomNavBar.Destroy */ inline __fastcall virtual ~TdxNavBar(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TdxNavBar(HWND ParentWindow) : TdxCustomNavBar(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE TdxNavBarDragObject* dxNavBarDragObject;

}	/* namespace Dxnavbar */
using namespace Dxnavbar;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// dxNavBar
