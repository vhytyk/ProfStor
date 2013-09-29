// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxGridCustomView.pas' rev: 6.00

#ifndef cxGridCustomViewHPP
#define cxGridCustomViewHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxData.hpp>	// Pascal unit
#include <cxCustomData.hpp>	// Pascal unit
#include <cxGridCommon.hpp>	// Pascal unit
#include <cxStorage.hpp>	// Pascal unit
#include <cxStyles.hpp>	// Pascal unit
#include <cxLookAndFeelPainters.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxgridcustomview
{
//-- type declarations -------------------------------------------------------
typedef TMetaClass*TcxCustomGridDragAndDropObjectClass;

class DELPHICLASS TcxCustomGridViewChange;
class DELPHICLASS TcxCustomGridView;
class DELPHICLASS TcxCustomGridBackgroundBitmaps;
class DELPHICLASS TcxCustomGridOptions;
class PASCALIMPLEMENTATION TcxCustomGridOptions : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	TcxCustomGridView* FGridView;
	TMetaClass* __fastcall GetLookAndFeelPainter(void);
	
protected:
	void __fastcall LayoutChanged(void);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation AOperation);
	__property TMetaClass* LookAndFeelPainter = {read=GetLookAndFeelPainter};
	
public:
	__fastcall virtual TcxCustomGridOptions(TcxCustomGridView* AGridView);
	__fastcall virtual ~TcxCustomGridOptions(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	__property TcxCustomGridView* GridView = {read=FGridView};
};


class PASCALIMPLEMENTATION TcxCustomGridBackgroundBitmaps : public TcxCustomGridOptions 
{
	typedef TcxCustomGridOptions inherited;
	
public:
	Graphics::TBitmap* operator[](int Index) { return Values[Index]; }
	
private:
	Classes::TList* FItems;
	int __fastcall GetCount(void);
	void __fastcall BitmapChanged(System::TObject* Sender);
	
protected:
	virtual int __fastcall GetBitmapStyleIndex(int Index);
	virtual Graphics::TBitmap* __fastcall GetDefaultBitmap(int Index);
	Graphics::TBitmap* __fastcall GetValue(int Index);
	void __fastcall SetValue(int Index, Graphics::TBitmap* Value);
	__property int Count = {read=GetCount, nodefault};
	
public:
	__fastcall virtual TcxCustomGridBackgroundBitmaps(TcxCustomGridView* AGridView);
	__fastcall virtual ~TcxCustomGridBackgroundBitmaps(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual Graphics::TBitmap* __fastcall GetBitmap(int Index);
	__property Graphics::TBitmap* Values[int Index] = {read=GetValue, write=SetValue/*, default*/};
	
__published:
	__property Graphics::TBitmap* Background = {read=GetValue, write=SetValue, index=0};
};


class DELPHICLASS TcxCustomGridController;
class DELPHICLASS TcxGridViewHandler;
class DELPHICLASS TcxCustomGridPainter;
class DELPHICLASS TcxGridSite;
class DELPHICLASS TcxCustomGridViewData;
class DELPHICLASS TcxCustomGridViewInfo;
class PASCALIMPLEMENTATION TcxGridViewHandler : public Cxclasses::TcxInterfacedPersistent 
{
	typedef Cxclasses::TcxInterfacedPersistent inherited;
	
private:
	TcxCustomGridView* FGridView;
	Cxcontrols::TcxControl* __fastcall GetControl(void);
	TcxCustomGridController* __fastcall GetController(void);
	Cxcustomdata::TcxCustomDataController* __fastcall GetDataController(void);
	TMetaClass* __fastcall GetLookAndFeelPainter(void);
	TcxCustomGridPainter* __fastcall GetPainter(void);
	TcxGridSite* __fastcall GetSite(void);
	TcxCustomGridViewData* __fastcall GetViewData(void);
	TcxCustomGridViewInfo* __fastcall GetViewInfo(void);
	
protected:
	__property Cxcontrols::TcxControl* Control = {read=GetControl};
	__property TcxCustomGridController* Controller = {read=GetController};
	__property Cxcustomdata::TcxCustomDataController* DataController = {read=GetDataController};
	__property TcxCustomGridViewData* ViewData = {read=GetViewData};
	
public:
	__fastcall virtual TcxGridViewHandler(TcxCustomGridView* AGridView);
	void __fastcall BeginUpdate(void);
	void __fastcall EndUpdate(void);
	__property TcxCustomGridView* GridView = {read=FGridView};
	__property TMetaClass* LookAndFeelPainter = {read=GetLookAndFeelPainter};
	__property TcxCustomGridPainter* Painter = {read=GetPainter};
	__property TcxGridSite* Site = {read=GetSite};
	__property TcxCustomGridViewInfo* ViewInfo = {read=GetViewInfo};
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxGridViewHandler(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomGridDragAndDropObject;
class DELPHICLASS TcxCustomGridCellViewInfo;
class DELPHICLASS TcxCustomGridHitTest;
class PASCALIMPLEMENTATION TcxCustomGridController : public TcxGridViewHandler 
{
	typedef TcxGridViewHandler inherited;
	
private:
	#pragma pack(push, 1)
	Types::TRect FHintTextRect;
	#pragma pack(pop)
	
	Controls::THintWindow* FHintWindow;
	bool FIsDblClick;
	TcxCustomGridDragAndDropObject* __fastcall GetDragAndDropObject(void);
	TMetaClass* __fastcall GetDragAndDropObjectClass(void);
	bool __fastcall GetIsDragging(void);
	TcxCustomGridCellViewInfo* __fastcall GetMouseCaptureViewInfo(void);
	void __fastcall SetDragAndDropObjectClass(TMetaClass* Value);
	void __fastcall SetMouseCaptureViewInfo(TcxCustomGridCellViewInfo* Value);
	
protected:
	virtual void __fastcall MouseLeave(void);
	virtual void __fastcall AfterPaint(void);
	virtual void __fastcall BeforeKillFocus(void);
	virtual void __fastcall BeforePaint(void);
	virtual bool __fastcall CanHandleHitTest(TcxCustomGridHitTest* AHitTest);
	virtual void __fastcall DetailFocused(TcxCustomGridView* ADetail);
	virtual void __fastcall DoExit(void);
	virtual bool __fastcall GetDesignHitTest(TcxCustomGridHitTest* AHitTest);
	virtual Cxcontrols::TcxMouseWheelScrollingKind __fastcall GetMouseWheelScrollingKind(void);
	virtual bool __fastcall IsPixelScrollBar(Forms::TScrollBarKind AKind);
	virtual bool __fastcall MayFocus(void);
	virtual void __fastcall RemoveFocus(void);
	virtual void __fastcall SetFocus(void);
	__property TcxCustomGridDragAndDropObject* DragAndDropObject = {read=GetDragAndDropObject};
	__property bool IsDragging = {read=GetIsDragging, nodefault};
	
public:
	__fastcall virtual ~TcxCustomGridController(void);
	virtual void __fastcall ControlFocusChanged(void);
	void __fastcall DesignerModified(void);
	virtual void __fastcall DoCancelMode(void);
	void __fastcall DoControlFocusChanged(void);
	virtual Controls::TCursor __fastcall GetCursor(int X, int Y);
	virtual bool __fastcall HasFocusedControls(void);
	virtual void __fastcall InitScrollBarsParameters(void);
	virtual bool __fastcall IsDataFullyVisible(bool AIsCallFromMaster = false);
	virtual void __fastcall Scroll(Forms::TScrollBarKind AScrollBarKind, Stdctrls::TScrollCode AScrollCode, int &AScrollPos);
	void __fastcall SetScrollBarInfo(Forms::TScrollBarKind AScrollBarKind, int AMin, int AMax, int AStep, int APage, int APos, bool AAllowShow, bool AAllowHide);
	void __fastcall UpdateScrollBars(void);
	virtual void __fastcall BeginDragAndDrop(void);
	virtual void __fastcall DragAndDrop(const Types::TPoint &P, bool &Accepted);
	virtual void __fastcall EndDragAndDrop(bool Accepted);
	virtual bool __fastcall StartDragAndDrop(const Types::TPoint &P);
	virtual void __fastcall BeforeStartDrag(void);
	virtual bool __fastcall CanDrag(int X, int Y);
	virtual void __fastcall DragDrop(System::TObject* Source, int X, int Y);
	virtual void __fastcall DragOver(System::TObject* Source, int X, int Y, Controls::TDragState State, bool &Accept);
	virtual void __fastcall EndDrag(System::TObject* Target, int X, int Y);
	virtual void __fastcall StartDrag(Controls::TDragObject* &DragObject);
	void __fastcall HideHint(void);
	virtual TMetaClass* __fastcall GetHintWindowClass(void);
	void __fastcall ShowHint(const Types::TRect &AHintAreaBounds, const Types::TRect &ATextRect, const AnsiString AText, bool AIsHintMultiLine, Graphics::TFont* AFont);
	__property Controls::THintWindow* HintWindow = {read=FHintWindow};
	virtual void __fastcall DoKeyDown(Word &Key, Classes::TShiftState Shift);
	virtual void __fastcall KeyDown(Word &Key, Classes::TShiftState Shift);
	virtual void __fastcall KeyPress(char &Key);
	virtual void __fastcall KeyUp(Word &Key, Classes::TShiftState Shift);
	virtual void __fastcall MouseDown(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall MouseMove(Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall MouseUp(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall WndProc(Messages::TMessage &Message);
	__property TMetaClass* DragAndDropObjectClass = {read=GetDragAndDropObjectClass, write=SetDragAndDropObjectClass};
	__property bool IsDblClick = {read=FIsDblClick, nodefault};
	__property TcxCustomGridCellViewInfo* MouseCaptureViewInfo = {read=GetMouseCaptureViewInfo, write=SetMouseCaptureViewInfo};
public:
	#pragma option push -w-inl
	/* TcxGridViewHandler.Create */ inline __fastcall virtual TcxCustomGridController(TcxCustomGridView* AGridView) : TcxGridViewHandler(AGridView) { }
	#pragma option pop
	
private:
	void *__IcxMouseTrackingCaller;	/* Cxcontrols::IcxMouseTrackingCaller */
	
public:
	operator IcxMouseTrackingCaller*(void) { return (IcxMouseTrackingCaller*)&__IcxMouseTrackingCaller; }
	
};


class DELPHICLASS TcxCustomGridOptionsSelection;
class PASCALIMPLEMENTATION TcxCustomGridOptionsSelection : public TcxCustomGridOptions 
{
	typedef TcxCustomGridOptions inherited;
	
public:
	#pragma option push -w-inl
	/* TcxCustomGridOptions.Create */ inline __fastcall virtual TcxCustomGridOptionsSelection(TcxCustomGridView* AGridView) : TcxCustomGridOptions(AGridView) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomGridOptions.Destroy */ inline __fastcall virtual ~TcxCustomGridOptionsSelection(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomGridOptionsView;
class PASCALIMPLEMENTATION TcxCustomGridOptionsView : public TcxCustomGridOptions 
{
	typedef TcxCustomGridOptions inherited;
	
private:
	Stdctrls::TScrollStyle __fastcall GetScrollBars(void);
	void __fastcall SetScrollBars(Stdctrls::TScrollStyle Value);
	
public:
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	
__published:
	__property Stdctrls::TScrollStyle ScrollBars = {read=GetScrollBars, write=SetScrollBars, default=3};
public:
	#pragma option push -w-inl
	/* TcxCustomGridOptions.Create */ inline __fastcall virtual TcxCustomGridOptionsView(TcxCustomGridView* AGridView) : TcxCustomGridOptions(AGridView) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomGridOptions.Destroy */ inline __fastcall virtual ~TcxCustomGridOptionsView(void) { }
	#pragma option pop
	
};


#pragma option push -b-
enum TcxGridStorageOption { gsoUseFilter, gsoUseSummary };
#pragma option pop

typedef Set<TcxGridStorageOption, gsoUseFilter, gsoUseSummary>  TcxGridStorageOptions;

class DELPHICLASS TcxCustomGridStyles;
class PASCALIMPLEMENTATION TcxCustomGridStyles : public Cxstyles::TcxStyles 
{
	typedef Cxstyles::TcxStyles inherited;
	
private:
	TMetaClass* __fastcall GetLookAndFeelPainter(void);
	
protected:
	virtual void __fastcall Changed(int AIndex);
	virtual void __fastcall GetDefaultViewParams(int Index, void * AData, /* out */ Cxgraphics::TcxViewParams &AParams);
	virtual void __fastcall GetFakeComponentLinks(Classes::TList* AList);
	virtual TcxCustomGridView* __fastcall GetGridView(void) = 0 ;
	__property TMetaClass* LookAndFeelPainter = {read=GetLookAndFeelPainter};
	
public:
	__property TcxCustomGridView* GridView = {read=GetGridView};
public:
	#pragma option push -w-inl
	/* TcxCustomStyles.Create */ inline __fastcall virtual TcxCustomGridStyles(Classes::TPersistent* AOwner) : Cxstyles::TcxStyles(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomStyles.Destroy */ inline __fastcall virtual ~TcxCustomGridStyles(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomGridViewInfoCache;
class DELPHICLASS TcxCustomGridViewInfoCacheItem;
typedef TMetaClass*TcxCustomGridViewInfoCacheItemClass;

class PASCALIMPLEMENTATION TcxCustomGridViewInfoCache : public TcxGridViewHandler 
{
	typedef TcxGridViewHandler inherited;
	
public:
	TcxCustomGridViewInfoCacheItem* operator[](int Index) { return Items[Index]; }
	
private:
	Classes::TList* FItems;
	bool FUnassigningValues;
	int __fastcall GetCount(void);
	TcxCustomGridViewInfoCacheItem* __fastcall GetInternalItem(int Index);
	TcxCustomGridViewInfoCacheItem* __fastcall GetItem(int Index);
	void __fastcall SetCount(int Value);
	void __fastcall DestroyItems(void);
	
protected:
	virtual TMetaClass* __fastcall GetItemClass(void);
	__property TcxCustomGridViewInfoCacheItem* InternalItems[int Index] = {read=GetInternalItem};
	
public:
	__fastcall virtual TcxCustomGridViewInfoCache(TcxCustomGridView* AGridView);
	__fastcall virtual ~TcxCustomGridViewInfoCache(void);
	virtual void __fastcall UnassignValues(bool AKeepMaster = false);
	__property int Count = {read=GetCount, write=SetCount, nodefault};
	__property TcxCustomGridViewInfoCacheItem* Items[int Index] = {read=GetItem/*, default*/};
};


#pragma option push -b-
enum TcxGridViewChangeKind { vcName };
#pragma option pop

typedef TMetaClass*TcxCustomGridControllerClass;

typedef TMetaClass*TcxCustomGridPainterClass;

typedef TMetaClass*TcxCustomGridViewDataClass;

typedef TMetaClass*TcxCustomGridViewInfoCacheClass;

typedef TMetaClass*TcxCustomGridViewInfoClass;

typedef TMetaClass*TcxCustomGridBackgroundBitmapsClass;

typedef TMetaClass*TcxCustomGridOptionsSelectionClass;

typedef TMetaClass*TcxCustomGridOptionsViewClass;

typedef TMetaClass*TcxCustomGridViewStylesClass;

class PASCALIMPLEMENTATION TcxCustomGridView : public Cxcontrols::TcxControlChildComponent 
{
	typedef Cxcontrols::TcxControlChildComponent inherited;
	
private:
	bool FAssigningPattern;
	TcxCustomGridBackgroundBitmaps* FBackgroundBitmaps;
	Classes::TList* FClones;
	TcxCustomGridController* FController;
	Cxcustomdata::TcxCustomDataController* FDataController;
	Classes::TComponent* FLevel;
	Classes::TList* FListenerLinks;
	Classes::TList* FOptionsList;
	TcxCustomGridOptionsSelection* FOptionsSelection;
	TcxCustomGridOptionsView* FOptionsView;
	TcxCustomGridPainter* FPainter;
	TcxCustomGridView* FPatternGridView;
	Classes::TComponent* FRepository;
	Cxcontrols::TcxControl* FStorageControl;
	TcxGridStorageOptions FStorageOptions;
	AnsiString FStoringName;
	TcxCustomGridStyles* FStyles;
	TcxCustomGridViewData* FViewData;
	TcxCustomGridViewInfo* FViewInfo;
	TcxCustomGridViewInfoCache* FViewInfoCache;
	Classes::TNotifyEvent FSubClassEvents;
	TcxCustomGridView* __fastcall GetClone(int Index);
	int __fastcall GetCloneCount(void);
	Controls::TDragMode __fastcall GetDragMode(void);
	bool __fastcall GetFocused(void);
	bool __fastcall GetIsDetail(void);
	bool __fastcall GetIsMaster(void);
	bool __fastcall GetIsPattern(void);
	bool __fastcall GetIsStoringNameMode(void);
	TMetaClass* __fastcall GetLookAndFeelPainter(void);
	TcxCustomGridView* __fastcall GetMasterGridView(void);
	int __fastcall GetMasterGridRecordIndex(void);
	int __fastcall GetMasterRecordIndex(void);
	Classes::TNotifyEvent __fastcall GetOnDblClick();
	Controls::TDragDropEvent __fastcall GetOnDragDrop();
	Controls::TDragOverEvent __fastcall GetOnDragOver();
	Controls::TEndDragEvent __fastcall GetOnEndDrag();
	Controls::TKeyEvent __fastcall GetOnKeyDown();
	Controls::TKeyPressEvent __fastcall GetOnKeyPress();
	Controls::TKeyEvent __fastcall GetOnKeyUp();
	Controls::TMouseEvent __fastcall GetOnMouseDown();
	Controls::TMouseMoveEvent __fastcall GetOnMouseMove();
	Controls::TMouseEvent __fastcall GetOnMouseUp();
	Controls::TMouseWheelEvent __fastcall GetOnMouseWheel();
	Controls::TMouseWheelUpDownEvent __fastcall GetOnMouseWheelDown();
	Controls::TMouseWheelUpDownEvent __fastcall GetOnMouseWheelUp();
	Controls::TStartDragEvent __fastcall GetOnStartDrag();
	TcxCustomGridView* __fastcall GetPatternGridView(void);
	TcxGridSite* __fastcall GetSite(void);
	void __fastcall SetBackgroundBitmaps(TcxCustomGridBackgroundBitmaps* Value);
	void __fastcall SetDragMode(Controls::TDragMode Value);
	void __fastcall SetFocused(bool Value);
	void __fastcall SetOnDblClick(Classes::TNotifyEvent Value);
	void __fastcall SetOnDragDrop(Controls::TDragDropEvent Value);
	void __fastcall SetOnDragOver(Controls::TDragOverEvent Value);
	void __fastcall SetOnEndDrag(Controls::TEndDragEvent Value);
	void __fastcall SetOnKeyDown(Controls::TKeyEvent Value);
	void __fastcall SetOnKeyPress(Controls::TKeyPressEvent Value);
	void __fastcall SetOnKeyUp(Controls::TKeyEvent Value);
	void __fastcall SetOnMouseDown(Controls::TMouseEvent Value);
	void __fastcall SetOnMouseMove(Controls::TMouseMoveEvent Value);
	void __fastcall SetOnMouseUp(Controls::TMouseEvent Value);
	void __fastcall SetOnMouseWheel(Controls::TMouseWheelEvent Value);
	void __fastcall SetOnMouseWheelDown(Controls::TMouseWheelUpDownEvent Value);
	void __fastcall SetOnMouseWheelUp(Controls::TMouseWheelUpDownEvent Value);
	void __fastcall SetOnStartDrag(Controls::TStartDragEvent Value);
	void __fastcall SetOptionsSelection(TcxCustomGridOptionsSelection* Value);
	void __fastcall SetOptionsView(TcxCustomGridOptionsView* Value);
	void __fastcall SetStyles(TcxCustomGridStyles* Value);
	void __fastcall ClearListenerLinks(void);
	
protected:
	virtual AnsiString __fastcall GetObjectName();
	virtual bool __fastcall GetProperties(Classes::TStrings* AProperties);
	virtual void __fastcall GetPropertyValue(const AnsiString AName, Variant &AValue);
	virtual void __fastcall SetPropertyValue(const AnsiString AName, const Variant &AValue);
	virtual System::TObject* __fastcall CreateChild(const AnsiString AObjectName, const AnsiString AClassName);
	virtual void __fastcall DeleteChild(const AnsiString AObjectName, System::TObject* AObject);
	virtual void __fastcall GetStoredChildren(Classes::TStringList* AChildren);
	virtual void __fastcall GetFakeComponentLinks(Classes::TList* AList);
	virtual bool __fastcall GetIsDestroying(void);
	virtual void __fastcall Loaded(void);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	virtual void __fastcall SetControl(Cxcontrols::TcxControl* Value);
	virtual void __fastcall SetName(const AnsiString NewName);
	DYNAMIC void __fastcall SetParentComponent(Classes::TComponent* Value);
	virtual void __fastcall CreateHandlers(void);
	virtual void __fastcall DestroyHandlers(void);
	virtual void __fastcall InitDataController(void);
	virtual void __fastcall CreateOptions(void);
	virtual void __fastcall DestroyOptions(void);
	void __fastcall AddOptions(TcxCustomGridOptions* AOptions);
	void __fastcall RemoveOptions(TcxCustomGridOptions* AOptions);
	void __fastcall NotifyOptions(Classes::TComponent* AComponent, Classes::TOperation AOperation);
	void __fastcall AddClone(TcxCustomGridView* AClone);
	void __fastcall RemoveClone(TcxCustomGridView* AClone);
	void __fastcall AddListenerLink(void * ALink);
	void __fastcall RemoveListenerLink(void * ALink);
	void __fastcall AssignPattern(TcxCustomGridView* APattern);
	virtual void __fastcall BeforeAssign(TcxCustomGridView* ASource);
	virtual void __fastcall DoAssign(TcxCustomGridView* ASource);
	virtual void __fastcall AfterAssign(TcxCustomGridView* ASource);
	virtual bool __fastcall CanFocus(void);
	virtual bool __fastcall CanTabStop(void);
	virtual void __fastcall DetailVisibleChanged(Classes::TComponent* ADetailLevel, int APrevVisibleDetailCount, int AVisibleDetailCount);
	virtual bool __fastcall GetChangeable(void);
	virtual bool __fastcall GetCustomVisible(bool ALevelVisible);
	virtual bool __fastcall GetIsControlFocused(void);
	virtual bool __fastcall GetResizeOnBoundsChange(void);
	virtual bool __fastcall GetVisible(void);
	virtual void __fastcall Init(void);
	virtual bool __fastcall IsDetailVisible(TcxCustomGridView* AGridView);
	virtual void __fastcall FocusChanged(bool AFocused);
	virtual void __fastcall LoadingComplete(void);
	virtual void __fastcall LookAndFeelChanged(void);
	void __fastcall NotifyControl(TcxGridViewChangeKind AChangeKind);
	virtual void __fastcall SetLevel(Classes::TComponent* Value);
	virtual void __fastcall SetTabStop(bool Value);
	virtual void __fastcall UpdateControl(Cxcustomdata::TcxUpdateControlInfo* AInfo);
	virtual TMetaClass* __fastcall GetControllerClass(void) = 0 ;
	virtual TMetaClass* __fastcall GetDataControllerClass(void) = 0 ;
	virtual TMetaClass* __fastcall GetPainterClass(void) = 0 ;
	virtual TMetaClass* __fastcall GetViewDataClass(void) = 0 ;
	virtual TMetaClass* __fastcall GetViewInfoCacheClass(void);
	virtual TMetaClass* __fastcall GetViewInfoClass(void) = 0 ;
	virtual TMetaClass* __fastcall GetBackgroundBitmapsClass(void);
	virtual TMetaClass* __fastcall GetOptionsSelectionClass(void);
	virtual TMetaClass* __fastcall GetOptionsViewClass(void);
	virtual TMetaClass* __fastcall GetStylesClass(void);
	__property bool AssigningPattern = {read=FAssigningPattern, nodefault};
	__property TcxCustomGridBackgroundBitmaps* BackgroundBitmaps = {read=FBackgroundBitmaps, write=SetBackgroundBitmaps};
	__property bool Changeable = {read=GetChangeable, nodefault};
	__property bool IsStoringNameMode = {read=GetIsStoringNameMode, nodefault};
	__property TcxCustomGridOptionsSelection* OptionsSelection = {read=FOptionsSelection, write=SetOptionsSelection};
	__property TcxCustomGridOptionsView* OptionsView = {read=FOptionsView, write=SetOptionsView};
	__property bool ResizeOnBoundsChange = {read=GetResizeOnBoundsChange, nodefault};
	__property TcxCustomGridStyles* Styles = {read=FStyles, write=SetStyles};
	
public:
	__fastcall virtual TcxCustomGridView(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxCustomGridView(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	DYNAMIC Classes::TComponent* __fastcall GetParentComponent(void);
	DYNAMIC bool __fastcall HasParent(void);
	bool __fastcall HasAsClone(TcxCustomGridView* AGridView);
	bool __fastcall HasAsMaster(TcxCustomGridView* AGridView);
	void __fastcall Invalidate(bool AHardUpdate = false);
	virtual void __fastcall RestoreDefaults(void);
	void __fastcall BeginUpdate(void);
	void __fastcall CancelUpdate(void);
	bool __fastcall Changed(System::TObject* AGridChange);
	void __fastcall EndUpdate(void);
	virtual void __fastcall BoundsChanged(bool AUpdateSelfOnly = false, bool AKeepMaster = false);
	void __fastcall LayoutChanged(bool AUpdateSelfOnly = true);
	bool __fastcall SizeChanged(bool AUpdateSelfOnly = false, bool AKeepMaster = false);
	void __fastcall ViewChanged(void)/* overload */;
	void __fastcall ViewChanged(const Types::TRect &AUpdateRect)/* overload */;
	void __fastcall RestoreFromIniFile(AnsiString AStorageName, bool AChildrenCreating = false, bool AChildrenDeleting = false, TcxGridStorageOptions AOptions = System::Set<TcxGridStorageOption, gsoUseFilter, gsoUseSummary> () , const AnsiString ARestoreViewName = "");
	void __fastcall RestoreFromRegistry(AnsiString AStorageName, bool AChildrenCreating = false, bool AChildrenDeleting = false, TcxGridStorageOptions AOptions = System::Set<TcxGridStorageOption, gsoUseFilter, gsoUseSummary> () , const AnsiString ARestoreViewName = "");
	void __fastcall RestoreFromStream(Classes::TStream* AStream, bool AChildrenCreating = false, bool AChildrenDeleting = false, TcxGridStorageOptions AOptions = System::Set<TcxGridStorageOption, gsoUseFilter, gsoUseSummary> () , const AnsiString ARestoreViewName = "");
	void __fastcall StoreToIniFile(AnsiString AStorageName, bool AReCreate = true, TcxGridStorageOptions AOptions = System::Set<TcxGridStorageOption, gsoUseFilter, gsoUseSummary> () , const AnsiString ASaveViewName = "");
	void __fastcall StoreToRegistry(AnsiString AStorageName, bool AReCreate = true, TcxGridStorageOptions AOptions = System::Set<TcxGridStorageOption, gsoUseFilter, gsoUseSummary> () , const AnsiString ASaveViewName = "");
	void __fastcall StoreToStream(Classes::TStream* AStream, TcxGridStorageOptions AOptions = System::Set<TcxGridStorageOption, gsoUseFilter, gsoUseSummary> () , const AnsiString ASaveViewName = "");
	__property bool Focused = {read=GetFocused, write=SetFocused, nodefault};
	__property TcxGridStorageOptions StorageOptions = {read=FStorageOptions, write=FStorageOptions, nodefault};
	__property AnsiString StoringName = {read=FStoringName, write=FStoringName};
	__property bool TabStop = {write=SetTabStop, nodefault};
	__property int CloneCount = {read=GetCloneCount, nodefault};
	__property TcxCustomGridView* Clones[int Index] = {read=GetClone};
	__property bool IsControlFocused = {read=GetIsControlFocused, nodefault};
	__property bool IsDetail = {read=GetIsDetail, nodefault};
	__property bool IsMaster = {read=GetIsMaster, nodefault};
	__property bool IsPattern = {read=GetIsPattern, nodefault};
	__property Classes::TComponent* Level = {read=FLevel};
	__property TcxCustomGridView* MasterGridView = {read=GetMasterGridView};
	__property int MasterGridRecordIndex = {read=GetMasterGridRecordIndex, nodefault};
	__property int MasterRecordIndex = {read=GetMasterRecordIndex, nodefault};
	__property TcxCustomGridView* PatternGridView = {read=GetPatternGridView};
	__property Classes::TComponent* Repository = {read=FRepository, write=FRepository};
	__property TcxCustomGridController* Controller = {read=FController};
	__property Cxcustomdata::TcxCustomDataController* DataController = {read=FDataController};
	__property TMetaClass* LookAndFeelPainter = {read=GetLookAndFeelPainter};
	__property TcxCustomGridPainter* Painter = {read=FPainter};
	__property TcxGridSite* Site = {read=GetSite};
	__property Cxcontrols::TcxControl* StorageControl = {read=FStorageControl};
	__property TcxCustomGridViewData* ViewData = {read=FViewData};
	__property TcxCustomGridViewInfo* ViewInfo = {read=FViewInfo};
	__property TcxCustomGridViewInfoCache* ViewInfoCache = {read=FViewInfoCache};
	__property bool Visible = {read=GetVisible, nodefault};
	
__published:
	__property Classes::TNotifyEvent DataControllerEvents = {read=FSubClassEvents, write=FSubClassEvents};
	__property Controls::TDragMode DragMode = {read=GetDragMode, write=SetDragMode, default=0};
	__property Classes::TNotifyEvent StylesEvents = {read=FSubClassEvents, write=FSubClassEvents};
	__property Classes::TNotifyEvent OnDblClick = {read=GetOnDblClick, write=SetOnDblClick};
	__property Controls::TDragDropEvent OnDragDrop = {read=GetOnDragDrop, write=SetOnDragDrop};
	__property Controls::TDragOverEvent OnDragOver = {read=GetOnDragOver, write=SetOnDragOver};
	__property Controls::TEndDragEvent OnEndDrag = {read=GetOnEndDrag, write=SetOnEndDrag};
	__property Controls::TKeyEvent OnKeyDown = {read=GetOnKeyDown, write=SetOnKeyDown};
	__property Controls::TKeyPressEvent OnKeyPress = {read=GetOnKeyPress, write=SetOnKeyPress};
	__property Controls::TKeyEvent OnKeyUp = {read=GetOnKeyUp, write=SetOnKeyUp};
	__property Controls::TMouseEvent OnMouseDown = {read=GetOnMouseDown, write=SetOnMouseDown};
	__property Controls::TMouseMoveEvent OnMouseMove = {read=GetOnMouseMove, write=SetOnMouseMove};
	__property Controls::TMouseEvent OnMouseUp = {read=GetOnMouseUp, write=SetOnMouseUp};
	__property Controls::TMouseWheelEvent OnMouseWheel = {read=GetOnMouseWheel, write=SetOnMouseWheel};
	__property Controls::TMouseWheelUpDownEvent OnMouseWheelDown = {read=GetOnMouseWheelDown, write=SetOnMouseWheelDown};
	__property Controls::TMouseWheelUpDownEvent OnMouseWheelUp = {read=GetOnMouseWheelUp, write=SetOnMouseWheelUp};
	__property Controls::TStartDragEvent OnStartDrag = {read=GetOnStartDrag, write=SetOnStartDrag};
public:
	#pragma option push -w-inl
	/* TcxControlChildComponent.CreateEx */ inline __fastcall TcxCustomGridView(Cxcontrols::TcxControl* AControl, bool AAssignOwner) : Cxcontrols::TcxControlChildComponent(AControl, AAssignOwner) { }
	#pragma option pop
	
private:
	void *__IcxStoredObject;	/* Cxstorage::IcxStoredObject */
	void *__IcxStoredParent;	/* Cxstorage::IcxStoredParent [GetChildren=GetStoredChildren] */
	
public:
	operator IcxStoredParent*(void) { return (IcxStoredParent*)&__IcxStoredParent; }
	operator IcxStoredObject*(void) { return (IcxStoredObject*)&__IcxStoredObject; }
	
};


class PASCALIMPLEMENTATION TcxCustomGridViewChange : public Cxgridcommon::TcxCustomGridChange 
{
	typedef Cxgridcommon::TcxCustomGridChange inherited;
	
private:
	TcxCustomGridView* FGridView;
	
public:
	__fastcall virtual TcxCustomGridViewChange(TcxCustomGridView* AGridView);
	__property TcxCustomGridView* GridView = {read=FGridView, write=FGridView};
	virtual bool __fastcall IsEqual(Cxgridcommon::TcxCustomGridChange* AChange);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxCustomGridViewChange(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridControlFocusChange;
class PASCALIMPLEMENTATION TcxGridControlFocusChange : public TcxCustomGridViewChange 
{
	typedef TcxCustomGridViewChange inherited;
	
public:
	virtual void __fastcall Execute(void);
public:
	#pragma option push -w-inl
	/* TcxCustomGridViewChange.Create */ inline __fastcall virtual TcxGridControlFocusChange(TcxCustomGridView* AGridView) : TcxCustomGridViewChange(AGridView) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridControlFocusChange(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxCustomGridHitTestClass;

class PASCALIMPLEMENTATION TcxCustomGridHitTest : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	#pragma pack(push, 1)
	Types::TPoint FPos;
	#pragma pack(pop)
	
	TcxCustomGridCellViewInfo* FViewInfo;
	
protected:
	/* virtual class method */ virtual int __fastcall GetHitTestCode(TMetaClass* vmt);
	void __fastcall Init(const Types::TPoint &APos);
	
public:
	/* virtual class method */ virtual Controls::TCursor __fastcall Cursor(TMetaClass* vmt);
	virtual TMetaClass* __fastcall DragAndDropObjectClass(void);
	/*         class method */ static int __fastcall HitTestCode(TMetaClass* vmt);
	/*         class method */ static TcxCustomGridHitTest* __fastcall Instance(TMetaClass* vmt, const Types::TPoint &APos);
	__property Types::TPoint Pos = {read=FPos};
	__property TcxCustomGridCellViewInfo* ViewInfo = {read=FViewInfo, write=FViewInfo};
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxCustomGridHitTest(void) : System::TObject() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxCustomGridHitTest(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridNoneHitTest;
class PASCALIMPLEMENTATION TcxGridNoneHitTest : public TcxCustomGridHitTest 
{
	typedef TcxCustomGridHitTest inherited;
	
protected:
	/* virtual class method */ virtual int __fastcall GetHitTestCode(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxGridNoneHitTest(void) : TcxCustomGridHitTest() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridNoneHitTest(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomGridViewHitTest;
class PASCALIMPLEMENTATION TcxCustomGridViewHitTest : public TcxCustomGridHitTest 
{
	typedef TcxCustomGridHitTest inherited;
	
private:
	TcxCustomGridView* FGridView;
	
public:
	__property TcxCustomGridView* GridView = {read=FGridView, write=FGridView};
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxCustomGridViewHitTest(void) : TcxCustomGridHitTest() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxCustomGridViewHitTest(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridViewNoneHitTest;
class PASCALIMPLEMENTATION TcxGridViewNoneHitTest : public TcxCustomGridViewHitTest 
{
	typedef TcxCustomGridViewHitTest inherited;
	
protected:
	/* virtual class method */ virtual int __fastcall GetHitTestCode(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxGridViewNoneHitTest(void) : TcxCustomGridViewHitTest() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridViewNoneHitTest(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxCustomGridDragAndDropObject : public Cxcontrols::TcxDragAndDropObject 
{
	typedef Cxcontrols::TcxDragAndDropObject inherited;
	
private:
	TcxCustomGridController* __fastcall GetController(void);
	TcxCustomGridView* __fastcall GetGridView(void);
	TcxCustomGridViewInfo* __fastcall GetViewInfo(void);
	
protected:
	virtual void __fastcall AfterDragAndDrop(bool Accepted);
	virtual void __fastcall AfterPaint(void);
	virtual void __fastcall BeforePaint(void);
	__property TcxCustomGridController* Controller = {read=GetController};
	__property TcxCustomGridViewInfo* ViewInfo = {read=GetViewInfo};
	
public:
	#pragma pack(push, 1)
	Types::TPoint SourcePoint;
	#pragma pack(pop)
	
	virtual void __fastcall Init(const Types::TPoint &P, TcxCustomGridHitTest* AParams);
	__property TcxCustomGridView* GridView = {read=GetGridView};
public:
	#pragma option push -w-inl
	/* TcxDragAndDropObject.Create */ inline __fastcall virtual TcxCustomGridDragAndDropObject(Cxcontrols::TcxControl* AControl) : Cxcontrols::TcxDragAndDropObject(AControl) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxCustomGridDragAndDropObject(void) { }
	#pragma option pop
	
};


__interface IcxCustomGridDataController;
typedef System::DelphiInterface<IcxCustomGridDataController> _di_IcxCustomGridDataController;
__interface INTERFACE_UUID("{B9ABDC6B-1A4A-4F11-A629-09B6FB9FB4BA}") IcxCustomGridDataController  : public IInterface 
{
	
public:
	virtual void __fastcall GetFakeComponentLinks(Classes::TList* AList) = 0 ;
	virtual TcxCustomGridView* __fastcall GetGridView(void) = 0 ;
	__property TcxCustomGridView* GridView = {read=GetGridView};
};

typedef TMetaClass*TcxCustomGridCellPainterClass;

class DELPHICLASS TcxCustomGridCellPainter;
class PASCALIMPLEMENTATION TcxCustomGridCellPainter : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	Cxgraphics::TcxCanvas* FCanvas;
	TcxCustomGridCellViewInfo* FViewInfo;
	bool __fastcall GetIsMainCanvasInUse(void);
	
protected:
	virtual void __fastcall AfterPaint(void);
	virtual void __fastcall BeforePaint(void);
	virtual void __fastcall DrawBackground(void);
	virtual bool __fastcall DrawBackgroundHandler(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ABounds);
	virtual void __fastcall DrawBorder(Cxgraphics::TcxBorder ABorder);
	virtual void __fastcall DrawBorders(void);
	virtual void __fastcall DrawContent(void);
	virtual void __fastcall DrawText(void);
	virtual bool __fastcall ExcludeFromClipRect(void);
	virtual bool __fastcall NeedsPainting(void);
	virtual void __fastcall Paint(void);
	__property Cxgraphics::TcxCanvas* Canvas = {read=FCanvas};
	__property bool IsMainCanvasInUse = {read=GetIsMainCanvasInUse, nodefault};
	__property TcxCustomGridCellViewInfo* ViewInfo = {read=FViewInfo};
	
public:
	__fastcall virtual TcxCustomGridCellPainter(Cxgraphics::TcxCanvas* ACanvas, TcxCustomGridCellViewInfo* AViewInfo);
	virtual void __fastcall MainPaint(void);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxCustomGridCellPainter(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxCustomGridPainter : public TcxGridViewHandler 
{
	typedef TcxGridViewHandler inherited;
	
private:
	Cxgraphics::TcxRegion* FBackgroundRegion;
	Cxgraphics::TcxRegion* FBeforePaintClipRegion;
	Cxgraphics::TcxCanvas* __fastcall GetCanvas(void);
	
protected:
	virtual void __fastcall DrawBackground(void);
	virtual void __fastcall PaintAfter(void);
	virtual void __fastcall PaintBefore(void);
	virtual void __fastcall PaintContent(void);
	__property Cxgraphics::TcxCanvas* Canvas = {read=GetCanvas};
	
public:
	virtual void __fastcall DrawFocusRect(const Types::TRect &R, bool AHideFocusRect);
	void __fastcall ExcludeFromBackground(const Types::TRect &R);
	void __fastcall Paint(void);
	void __fastcall Invalidate(void)/* overload */;
	void __fastcall Invalidate(const Types::TRect &R)/* overload */;
public:
	#pragma option push -w-inl
	/* TcxGridViewHandler.Create */ inline __fastcall virtual TcxCustomGridPainter(TcxCustomGridView* AGridView) : TcxGridViewHandler(AGridView) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxCustomGridPainter(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxCustomGridViewData : public TcxGridViewHandler 
{
	typedef TcxGridViewHandler inherited;
	
public:
	__property DataController ;
public:
	#pragma option push -w-inl
	/* TcxGridViewHandler.Create */ inline __fastcall virtual TcxCustomGridViewData(TcxCustomGridView* AGridView) : TcxGridViewHandler(AGridView) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxCustomGridViewData(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxGridSiteClass;

class PASCALIMPLEMENTATION TcxGridSite : public Cxcontrols::TcxControl 
{
	typedef Cxcontrols::TcxControl inherited;
	
private:
	#pragma pack(push, 1)
	Types::TPoint FSize;
	#pragma pack(pop)
	
	TcxCustomGridViewInfo* FViewInfo;
	Cxcontrols::TcxControl* __fastcall GetContainer(void);
	TcxCustomGridController* __fastcall GetController(void);
	TcxCustomGridView* __fastcall GetGridView(void);
	TcxCustomGridPainter* __fastcall GetPainter(void);
	void __fastcall SendKeyDownNotification(const Messages::TWMKey &Message);
	MESSAGE void __fastcall CMBoundsChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CNKeyDown(Messages::TWMKey &Message);
	HIDESBASE MESSAGE void __fastcall CNSysKeyDown(Messages::TWMKey &Message);
	
protected:
	virtual bool __fastcall AllowAutoDragAndDropAtDesignTime(int X, int Y, Classes::TShiftState Shift);
	DYNAMIC bool __fastcall AllowDragAndDropWithoutFocus(void);
	virtual void __fastcall BeforeMouseDown(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall BoundsChanged(void);
	DYNAMIC bool __fastcall CanDrag(int X, int Y);
	DYNAMIC void __fastcall DoCancelMode(void);
	DYNAMIC void __fastcall DoExit(void);
	DYNAMIC void __fastcall FocusChanged(void);
	virtual bool __fastcall FocusWhenChildIsClicked(Controls::TControl* AChild);
	virtual Controls::TCursor __fastcall GetCursor(int X, int Y);
	DYNAMIC bool __fastcall GetDesignHitTest(int X, int Y, Classes::TShiftState Shift);
	virtual bool __fastcall GetIsDesigning(void);
	virtual bool __fastcall GetIsFocused(void);
	virtual Cxcontrols::TcxMouseWheelScrollingKind __fastcall GetMouseWheelScrollingKind(void);
	virtual bool __fastcall IsPixelScrollBar(Forms::TScrollBarKind AKind);
	DYNAMIC void __fastcall KeyDown(Word &Key, Classes::TShiftState Shift);
	DYNAMIC void __fastcall KeyPress(char &Key);
	DYNAMIC void __fastcall KeyUp(Word &Key, Classes::TShiftState Shift);
	DYNAMIC bool __fastcall MayFocus(void);
	DYNAMIC void __fastcall MouseMove(Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseUp(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall Paint(void);
	DYNAMIC void __fastcall RequestAlign(void);
	virtual void __fastcall SetParent(Controls::TWinControl* AParent);
	virtual void __fastcall WndProc(Messages::TMessage &Message);
	DYNAMIC void __fastcall DoEndDrag(System::TObject* Target, int X, int Y);
	DYNAMIC void __fastcall DoStartDrag(Controls::TDragObject* &DragObject);
	DYNAMIC void __fastcall DragOver(System::TObject* Source, int X, int Y, Controls::TDragState State, bool &Accept);
	virtual Types::TRect __fastcall GetHScrollBarBounds();
	virtual void __fastcall InitScrollBarsParameters(void);
	virtual void __fastcall Scroll(Forms::TScrollBarKind AScrollBarKind, Stdctrls::TScrollCode AScrollCode, int &AScrollPos);
	virtual void __fastcall UpdateScrollBars(void);
	DYNAMIC void __fastcall DragAndDrop(const Types::TPoint &P, bool &Accepted);
	DYNAMIC void __fastcall EndDragAndDrop(bool Accepted);
	DYNAMIC bool __fastcall StartDragAndDrop(const Types::TPoint &P);
	void __fastcall CancelPostBoundsChanged(void);
	void __fastcall InitTabStop(Controls::TWinControl* AParent);
	void __fastcall PostBoundsChanged(void);
	void __fastcall UpdateSize(void);
	__property TcxCustomGridController* Controller = {read=GetController};
	__property TcxCustomGridPainter* Painter = {read=GetPainter};
	
public:
	__fastcall virtual TcxGridSite(TcxCustomGridViewInfo* AViewInfo);
	__fastcall virtual ~TcxGridSite(void);
	DYNAMIC void __fastcall BeginDragAndDrop(void);
	DYNAMIC void __fastcall DragDrop(System::TObject* Source, int X, int Y);
	DYNAMIC bool __fastcall ExecuteAction(Classes::TBasicAction* Action);
	virtual void __fastcall SetBounds(int ALeft, int ATop, int AWidth, int AHeight);
	virtual void __fastcall SetFocus(void);
	DYNAMIC bool __fastcall UpdateAction(Classes::TBasicAction* Action);
	__property Cxcontrols::TcxControl* Container = {read=GetContainer};
	__property TcxCustomGridView* GridView = {read=GetGridView};
	__property Keys ;
	__property MouseCapture ;
	__property TcxCustomGridViewInfo* ViewInfo = {read=FViewInfo};
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxGridSite(HWND ParentWindow) : Cxcontrols::TcxControl(ParentWindow) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxCustomGridCellViewInfoClass;

class PASCALIMPLEMENTATION TcxCustomGridCellViewInfo : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	bool FCalculated;
	bool FCalculatingParams;
	#pragma pack(push, 1)
	Types::TRect FContentBounds;
	#pragma pack(pop)
	
	Classes::TAlignment FAlignmentHorz;
	Cxclasses::TcxAlignmentVert FAlignmentVert;
	Cxgraphics::TcxBorders FBorders;
	bool FIsDestroying;
	bool FParamsCalculated;
	Cxgridcommon::TcxGridCellState FState;
	AnsiString FText;
	bool FVisible;
	int __fastcall GetBorderSize(Cxgraphics::TcxBorder AIndex);
	Types::TRect __fastcall GetContentBounds();
	int __fastcall GetTextAreaHeight(void);
	int __fastcall GetTextAreaWidth(void);
	int __fastcall GetTextHeight(void);
	int __fastcall GetTextWidth(void);
	void __fastcall SetState(Cxgridcommon::TcxGridCellState Value);
	
protected:
	virtual HRESULT __stdcall QueryInterface(const GUID &IID, /* out */ void *Obj);
	int __stdcall _AddRef(void);
	int __stdcall _Release(void);
	virtual void __fastcall DoCancelMode(void);
	virtual void __fastcall MouseLeave(void);
	virtual void __fastcall AfterCalculateBounds(Types::TRect &ABounds);
	virtual void __fastcall AfterCustomDraw(Cxgraphics::TcxCanvas* ACanvas);
	virtual void __fastcall BeforeCustomDraw(Cxgraphics::TcxCanvas* ACanvas);
	virtual void __fastcall BeforeStateChange(void);
	virtual Types::TRect __fastcall CalculateContentBounds();
	void __fastcall CalculateParams(void);
	virtual int __fastcall CalculateHeight(void) = 0 ;
	virtual int __fastcall CalculateWidth(void) = 0 ;
	virtual void __fastcall Click(void);
	virtual bool __fastcall CustomDraw(Cxgraphics::TcxCanvas* ACanvas);
	virtual bool __fastcall CustomDrawBackground(Cxgraphics::TcxCanvas* ACanvas);
	void __fastcall Destroying(void);
	virtual void __fastcall DoCalculateParams(void);
	virtual bool __fastcall DoCustomDraw(Cxgraphics::TcxCanvas* ACanvas);
	virtual bool __fastcall DoCustomDrawBackground(Cxgraphics::TcxCanvas* ACanvas);
	virtual Classes::TAlignment __fastcall GetAlignmentHorz(void);
	virtual Cxclasses::TcxAlignmentVert __fastcall GetAlignmentVert(void);
	virtual Graphics::TBitmap* __fastcall GetBackgroundBitmap(void);
	virtual Types::TRect __fastcall GetBorderBounds(Cxgraphics::TcxBorder AIndex);
	virtual Graphics::TColor __fastcall GetBorderColor(Cxgraphics::TcxBorder AIndex) = 0 ;
	virtual Cxgraphics::TcxBorders __fastcall GetBorders(void);
	virtual int __fastcall GetBorderWidth(Cxgraphics::TcxBorder AIndex) = 0 ;
	virtual Cxgraphics::TcxCanvas* __fastcall GetCanvas(void) = 0 ;
	/* virtual class method */ virtual int __fastcall GetCellHeight(TMetaClass* vmt, int ATextHeight, TMetaClass* ALookAndFeelPainter);
	virtual int __fastcall GetContentHeight(void);
	virtual int __fastcall GetContentWidth(void);
	virtual Cxcontrols::TcxControl* __fastcall GetControl(void);
	virtual int __fastcall GetHeight(void);
	virtual TMetaClass* __fastcall GetHitTestClass(void) = 0 ;
	virtual bool __fastcall GetHotTrack(void);
	virtual bool __fastcall GetIsCheck(void);
	virtual bool __fastcall GetMouseCapture(void);
	virtual bool __fastcall GetMultiLine(void);
	virtual bool __fastcall GetMultiLinePainting(void);
	virtual TMetaClass* __fastcall GetPainterClass(void);
	virtual bool __fastcall GetShowEndEllipsis(void);
	virtual AnsiString __fastcall GetText();
	virtual Types::TRect __fastcall GetTextAreaBounds();
	int __fastcall GetTextAttributes(bool AForPainting);
	virtual int __fastcall GetTextCellHeight(TcxCustomGridViewInfo* AGridViewInfo, TMetaClass* ALookAndFeelPainter);
	virtual bool __fastcall GetTransparent(void);
	virtual void __fastcall GetViewParams(Cxgraphics::TcxViewParams &AParams);
	virtual bool __fastcall GetVisible(void);
	virtual int __fastcall GetWidth(void);
	virtual bool __fastcall HasCustomDraw(void);
	virtual bool __fastcall HasCustomDrawBackground(void);
	virtual bool __fastcall HasMouse(TcxCustomGridHitTest* AHitTest);
	virtual void __fastcall InitHitTest(TcxCustomGridHitTest* AHitTest);
	virtual bool __fastcall InvalidateOnStateChange(void);
	virtual void __fastcall Offset(int DX, int DY);
	virtual void __fastcall RestoreParams(const Cxgraphics::TcxViewParams &AParams);
	virtual void __fastcall SaveParams(/* out */ Cxgraphics::TcxViewParams &AParams);
	virtual void __fastcall SetMouseCapture(bool Value);
	virtual void __fastcall SetWidth(int Value);
	virtual void __fastcall StateChanged(void);
	__property int BorderWidth[Cxgraphics::TcxBorder AIndex] = {read=GetBorderWidth};
	__property bool CalculatingParams = {read=FCalculatingParams, nodefault};
	__property Cxgraphics::TcxCanvas* Canvas = {read=GetCanvas};
	__property Cxcontrols::TcxControl* Control = {read=GetControl};
	__property bool HotTrack = {read=GetHotTrack, nodefault};
	__property bool IsCheck = {read=GetIsCheck, nodefault};
	__property bool IsDestroying = {read=FIsDestroying, nodefault};
	__property bool ShowEndEllipsis = {read=GetShowEndEllipsis, nodefault};
	
public:
	#pragma pack(push, 1)
	Types::TRect Bounds;
	#pragma pack(pop)
	
	bool MultiLine;
	bool MultiLinePainting;
	Cxgraphics::TcxViewParams Params;
	__fastcall TcxCustomGridCellViewInfo(void);
	__fastcall virtual ~TcxCustomGridCellViewInfo(void);
	virtual void __fastcall AfterRecalculation(void);
	virtual void __fastcall BeforeRecalculation(void);
	virtual void __fastcall Calculate(int ALeftBound, int ATopBound, int AWidth = 0xffffffff, int AHeight = 0xffffffff)/* overload */;
	virtual void __fastcall Calculate(const Types::TRect &ABounds)/* overload */;
	virtual TcxCustomGridHitTest* __fastcall GetHitTest(const Types::TPoint &P);
	virtual void __fastcall Invalidate(void);
	virtual bool __fastcall MouseDown(TcxCustomGridHitTest* AHitTest, Controls::TMouseButton AButton, Classes::TShiftState AShift);
	virtual bool __fastcall MouseMove(TcxCustomGridHitTest* AHitTest, Classes::TShiftState AShift);
	virtual bool __fastcall MouseUp(TcxCustomGridHitTest* AHitTest, Controls::TMouseButton AButton, Classes::TShiftState AShift);
	void __fastcall DoOffset(int DX, int DY);
	virtual void __fastcall Paint(Cxgraphics::TcxCanvas* ACanvas = (Cxgraphics::TcxCanvas*)(0x0));
	void __fastcall Recalculate(void);
	void __fastcall ResetContentBounds(void);
	__property Classes::TAlignment AlignmentHorz = {read=FAlignmentHorz, write=FAlignmentHorz, nodefault};
	__property Cxclasses::TcxAlignmentVert AlignmentVert = {read=FAlignmentVert, write=FAlignmentVert, nodefault};
	__property Graphics::TBitmap* BackgroundBitmap = {read=GetBackgroundBitmap};
	__property Types::TRect BorderBounds[Cxgraphics::TcxBorder AIndex] = {read=GetBorderBounds};
	__property Graphics::TColor BorderColor[Cxgraphics::TcxBorder AIndex] = {read=GetBorderColor};
	__property int BorderSize[Cxgraphics::TcxBorder AIndex] = {read=GetBorderSize};
	__property Cxgraphics::TcxBorders Borders = {read=FBorders, write=FBorders, nodefault};
	__property bool Calculated = {read=FCalculated, write=FCalculated, nodefault};
	__property Types::TRect ContentBounds = {read=GetContentBounds};
	__property int ContentHeight = {read=GetContentHeight, nodefault};
	__property int ContentWidth = {read=GetContentWidth, nodefault};
	__property int Height = {read=GetHeight, nodefault};
	__property bool MouseCapture = {read=GetMouseCapture, write=SetMouseCapture, nodefault};
	__property Cxgridcommon::TcxGridCellState State = {read=FState, write=SetState, nodefault};
	__property AnsiString Text = {read=FText, write=FText};
	__property int TextAreaHeight = {read=GetTextAreaHeight, nodefault};
	__property int TextAreaWidth = {read=GetTextAreaWidth, nodefault};
	__property int TextHeight = {read=GetTextHeight, nodefault};
	__property int TextWidth = {read=GetTextWidth, nodefault};
	__property Types::TRect TextAreaBounds = {read=GetTextAreaBounds};
	__property bool Transparent = {read=GetTransparent, nodefault};
	__property bool Visible = {read=GetVisible, write=FVisible, nodefault};
	__property int Width = {read=GetWidth, write=SetWidth, nodefault};
private:
	void *__IcxMouseCaptureObject;	/* Cxcontrols::IcxMouseCaptureObject */
	void *__IcxMouseTrackingCaller;	/* Cxcontrols::IcxMouseTrackingCaller */
	
public:
	operator IcxMouseTrackingCaller*(void) { return (IcxMouseTrackingCaller*)&__IcxMouseTrackingCaller; }
	operator IcxMouseCaptureObject*(void) { return (IcxMouseCaptureObject*)&__IcxMouseCaptureObject; }
	operator IInterface*(void) { return (IInterface*)&__IcxMouseTrackingCaller; }
	
};


class DELPHICLASS TcxCustomGridViewCellViewInfo;
class PASCALIMPLEMENTATION TcxCustomGridViewCellViewInfo : public TcxCustomGridCellViewInfo 
{
	typedef TcxCustomGridCellViewInfo inherited;
	
private:
	TcxCustomGridViewInfo* FGridViewInfo;
	TcxCustomGridController* __fastcall GetController(void);
	TcxCustomGridView* __fastcall GetGridView(void);
	TMetaClass* __fastcall GetLookAndFeelPainter(void);
	
protected:
	virtual void __fastcall AfterCalculateBounds(Types::TRect &ABounds);
	virtual bool __fastcall EmulateMouseMoveAfterCalculate(void);
	virtual Cxgraphics::TcxCanvas* __fastcall GetCanvas(void);
	virtual Cxcontrols::TcxControl* __fastcall GetControl(void);
	virtual bool __fastcall HasMouse(TcxCustomGridHitTest* AHitTest);
	virtual void __fastcall InitHitTest(TcxCustomGridHitTest* AHitTest);
	virtual bool __fastcall CanShowHint(void);
	void __fastcall CheckHint(TcxCustomGridHitTest* AHitTest);
	virtual Types::TRect __fastcall GetBoundsForHint();
	virtual bool __fastcall NeedShowHint(const Types::TPoint &AMousePos, /* out */ AnsiString &AHintText, /* out */ bool &AIsHintMultiLine, /* out */ Types::TRect &ATextRect);
	__property TcxCustomGridController* Controller = {read=GetController};
	
public:
	__fastcall TcxCustomGridViewCellViewInfo(TcxCustomGridViewInfo* AGridViewInfo);
	__fastcall virtual ~TcxCustomGridViewCellViewInfo(void);
	virtual void __fastcall Invalidate(void);
	virtual bool __fastcall MouseMove(TcxCustomGridHitTest* AHitTest, Classes::TShiftState AShift);
	__property TcxCustomGridView* GridView = {read=GetGridView};
	__property TcxCustomGridViewInfo* GridViewInfo = {read=FGridViewInfo};
	__property TMetaClass* LookAndFeelPainter = {read=GetLookAndFeelPainter};
};


class PASCALIMPLEMENTATION TcxCustomGridViewInfo : public TcxGridViewHandler 
{
	typedef TcxGridViewHandler inherited;
	
private:
	Classes::TList* FActiveViewInfos;
	#pragma pack(push, 1)
	Types::TRect FBounds;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect FClientBounds;
	#pragma pack(pop)
	
	bool FClientBoundsAssigned;
	bool FIsCalculating;
	bool FIsInternalUse;
	_RTL_CRITICAL_SECTION FLock;
	#pragma pack(push, 1)
	Types::TPoint FMousePos;
	#pragma pack(pop)
	
	TcxGridSite* FSite;
	bool FSizeCalculating;
	bool FVisibilityChanging;
	bool __fastcall GetCalculated(void);
	Cxgraphics::TcxCanvas* __fastcall GetCanvas(void);
	Types::TRect __fastcall GetClientBounds();
	int __fastcall GetClientHeight(void);
	int __fastcall GetClientWidth(void);
	bool __fastcall GetIsInternalUseValue(void);
	void __fastcall SetClientBounds(const Types::TRect &Value);
	
protected:
	virtual void __fastcall CreateViewInfos(void);
	virtual void __fastcall DestroyViewInfos(bool AIsRecreating);
	virtual void __fastcall RecreateViewInfos(void);
	void __fastcall CreateSite(void);
	void __fastcall DestroySite(void);
	virtual TMetaClass* __fastcall GetSiteClass(void);
	Controls::TWinControl* __fastcall GetSiteParent(void);
	void __fastcall AddActiveViewInfo(System::TObject* AViewInfo);
	bool __fastcall IsViewInfoActive(System::TObject* AViewInfo);
	void __fastcall RemoveActiveViewInfo(System::TObject* AViewInfo);
	void __fastcall AddScrollBarHeight(int &AHeight);
	virtual void __fastcall AfterCalculating(void);
	virtual void __fastcall BeforeCalculating(void);
	virtual void __fastcall Calculate(void);
	virtual Types::TRect __fastcall CalculateClientBounds();
	virtual void __fastcall CalculateHeight(const Types::TPoint &AMaxSize, int &AHeight, bool &AFullyVisible);
	virtual void __fastcall CalculateWidth(const Types::TPoint &AMaxSize, int &AWidth);
	virtual void __fastcall ControlFocusChanged(void);
	virtual bool __fastcall GetAllowBoundsChangedNotification(void);
	virtual Graphics::TBitmap* __fastcall GetBackgroundBitmap(void);
	virtual Graphics::TColor __fastcall GetBackgroundColor(void);
	virtual void __fastcall GetHScrollBarBounds(Types::TRect &ABounds);
	virtual bool __fastcall GetIsInternalUse(void);
	virtual void __fastcall InitHitTest(TcxCustomGridHitTest* AHitTest);
	void __fastcall UpdateMousePos(void);
	virtual void __fastcall VisibilityChanged(bool AVisible);
	__property bool AllowBoundsChangedNotification = {read=GetAllowBoundsChangedNotification, nodefault};
	__property bool ClientBoundsAssigned = {read=FClientBoundsAssigned, write=FClientBoundsAssigned, nodefault};
	__property bool SizeCalculating = {read=FSizeCalculating, nodefault};
	__property bool VisibilityChanging = {read=FVisibilityChanging, nodefault};
	
public:
	__fastcall virtual TcxCustomGridViewInfo(TcxCustomGridView* AGridView);
	__fastcall virtual ~TcxCustomGridViewInfo(void);
	virtual void __fastcall BeforeDestruction(void);
	void __fastcall DoVisibilityChanged(bool AVisible);
	int __fastcall GetFontHeight(Graphics::TFont* AFont);
	void __fastcall GetHeight(const Types::TPoint &AMaxSize, int &AHeight, bool &AFullyVisible);
	virtual TcxCustomGridHitTest* __fastcall GetHitTest(const Types::TPoint &P)/* overload */;
	virtual TcxCustomGridHitTest* __fastcall GetHitTest(int X, int Y)/* overload */;
	void __fastcall GetWidth(const Types::TPoint &AMaxSize, int &AWidth);
	void __fastcall MainCalculate(const Types::TRect &ABounds);
	void __fastcall Recalculate(void);
	__property Graphics::TColor BackgroundColor = {read=GetBackgroundColor, nodefault};
	__property Graphics::TBitmap* BackgroundBitmap = {read=GetBackgroundBitmap};
	__property Types::TRect Bounds = {read=FBounds};
	__property bool Calculated = {read=GetCalculated, nodefault};
	__property Cxgraphics::TcxCanvas* Canvas = {read=GetCanvas};
	__property Types::TRect ClientBounds = {read=GetClientBounds, write=SetClientBounds};
	__property int ClientHeight = {read=GetClientHeight, nodefault};
	__property int ClientWidth = {read=GetClientWidth, nodefault};
	__property bool IsCalculating = {read=FIsCalculating, nodefault};
	__property bool IsInternalUse = {read=GetIsInternalUseValue, write=FIsInternalUse, nodefault};
	__property Types::TPoint MousePos = {read=FMousePos};
	__property TcxGridSite* Site = {read=FSite};
};


class PASCALIMPLEMENTATION TcxCustomGridViewInfoCacheItem : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	int FIndex;
	TcxCustomGridViewInfoCache* FOwner;
	
protected:
	__property int Index = {read=FIndex, nodefault};
	__property TcxCustomGridViewInfoCache* Owner = {read=FOwner};
	
public:
	__fastcall virtual TcxCustomGridViewInfoCacheItem(TcxCustomGridViewInfoCache* AOwner, int AIndex);
	virtual void __fastcall UnassignValues(bool AKeepMaster);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxCustomGridViewInfoCacheItem(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomGridViewStyles;
class PASCALIMPLEMENTATION TcxCustomGridViewStyles : public TcxCustomGridStyles 
{
	typedef TcxCustomGridStyles inherited;
	
protected:
	virtual void __fastcall GetDefaultViewParams(int Index, void * AData, /* out */ Cxgraphics::TcxViewParams &AParams);
	virtual TcxCustomGridView* __fastcall GetGridView(void);
	
public:
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	
__published:
	__property Cxstyles::TcxStyle* Background = {read=GetValue, write=SetValue, index=0};
	__property StyleSheet ;
public:
	#pragma option push -w-inl
	/* TcxCustomStyles.Create */ inline __fastcall virtual TcxCustomGridViewStyles(Classes::TPersistent* AOwner) : TcxCustomGridStyles(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomStyles.Destroy */ inline __fastcall virtual ~TcxCustomGridViewStyles(void) { }
	#pragma option pop
	
};


typedef void __fastcall (__closure *TcxGridCellCustomDrawEvent)(TcxCustomGridView* Sender, Cxgraphics::TcxCanvas* ACanvas, TcxCustomGridCellViewInfo* AViewInfo, bool &ADone);

typedef TMetaClass*TcxCustomGridViewClass;

//-- var, const, procedure ---------------------------------------------------
static const Shortint htError = 0xffffffff;
static const Shortint htNone = 0x0;
static const Shortint bbCustomFirst = 0x0;
static const Shortint bbBackground = 0x0;
static const Shortint bbCustomLast = 0x0;
static const Shortint vsCustomFirst = 0x0;
static const Shortint vsBackground = 0x0;
static const Shortint vsCustomLast = 0x0;
static const Word CM_BOUNDSCHANGED = 0x401;
extern PACKAGE Cxclasses::TcxRegisteredClasses* cxGridRegisteredViews;
extern PACKAGE TcxCustomGridView* __fastcall GetParentGridView(Controls::TControl* AControl);

}	/* namespace Cxgridcustomview */
using namespace Cxgridcustomview;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxGridCustomView
