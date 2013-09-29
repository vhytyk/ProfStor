// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxGrid.pas' rev: 6.00

#ifndef cxGridHPP
#define cxGridHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Menus.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <cxGridCustomView.hpp>	// Pascal unit
#include <cxGridDetailsSite.hpp>	// Pascal unit
#include <cxGridLevel.hpp>	// Pascal unit
#include <cxGridCommon.hpp>	// Pascal unit
#include <cxCustomData.hpp>	// Pascal unit
#include <cxNavigator.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <cxLookAndFeelPainters.hpp>	// Pascal unit
#include <cxLookAndFeels.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Types.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxgrid
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxGridLayoutChange;
class PASCALIMPLEMENTATION TcxGridLayoutChange : public Cxgridcustomview::TcxCustomGridViewChange 
{
	typedef Cxgridcustomview::TcxCustomGridViewChange inherited;
	
public:
	virtual void __fastcall Execute(void);
	virtual bool __fastcall IsCompatibleWith(Cxgridcommon::TcxCustomGridChange* AChange);
public:
	#pragma option push -w-inl
	/* TcxCustomGridViewChange.Create */ inline __fastcall virtual TcxGridLayoutChange(Cxgridcustomview::TcxCustomGridView* AGridView) : Cxgridcustomview::TcxCustomGridViewChange(AGridView) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridLayoutChange(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridSizeChange;
class PASCALIMPLEMENTATION TcxGridSizeChange : public Cxgridcustomview::TcxCustomGridViewChange 
{
	typedef Cxgridcustomview::TcxCustomGridViewChange inherited;
	
private:
	bool FKeepMaster;
	bool FUpdateGridViewOnly;
	
public:
	__fastcall virtual TcxGridSizeChange(Cxgridcustomview::TcxCustomGridView* AGridView, bool AUpdateGridViewOnly, bool AKeepMaster);
	virtual void __fastcall Execute(void);
	virtual bool __fastcall IsCompatibleWith(Cxgridcommon::TcxCustomGridChange* AChange);
	virtual bool __fastcall IsEqual(Cxgridcommon::TcxCustomGridChange* AChange);
	__property bool KeepMaster = {read=FKeepMaster, nodefault};
	__property bool UpdateGridViewOnly = {read=FUpdateGridViewOnly, write=FUpdateGridViewOnly, nodefault};
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridSizeChange(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridViewChange;
class PASCALIMPLEMENTATION TcxGridViewChange : public Cxgridcustomview::TcxCustomGridViewChange 
{
	typedef Cxgridcustomview::TcxCustomGridViewChange inherited;
	
private:
	#pragma pack(push, 1)
	Types::TRect FUpdateBounds;
	#pragma pack(pop)
	
	
public:
	__fastcall virtual TcxGridViewChange(Cxgridcustomview::TcxCustomGridView* AGridView, const Types::TRect &AUpdateBounds)/* overload */;
	__fastcall TcxGridViewChange(Cxgridcustomview::TcxCustomGridView* AGridView)/* overload */;
	virtual void __fastcall Execute(void);
	virtual bool __fastcall IsCumulative(void);
	__property Types::TRect UpdateBounds = {read=FUpdateBounds};
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridViewChange(void) { }
	#pragma option pop
	
};


#pragma option push -b-
enum TcxGridNotificationKind { gnkFocusedViewChanged, gnkFocusedRecordChanged, gnkRecordCountChanged, gnkContextMenu, gnkCustomization, gnkKeyDown };
#pragma option pop

typedef Set<TcxGridNotificationKind, gnkFocusedViewChanged, gnkKeyDown>  TcxGridNotificationKinds;

class DELPHICLASS TcxCustomGridNotification;
class PASCALIMPLEMENTATION TcxCustomGridNotification : public System::TObject 
{
	typedef System::TObject inherited;
	
protected:
	virtual TcxGridNotificationKinds __fastcall NotificationKinds(void) = 0 ;
	virtual void __fastcall Notify(TcxGridNotificationKind AKind, void * AData = (void *)(0x0)) = 0 ;
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxCustomGridNotification(void) : System::TObject() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxCustomGridNotification(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxCustomGridStructureNavigatorClass;

class DELPHICLASS TcxCustomGridStructureNavigator;
class DELPHICLASS TcxCustomGrid;
class DELPHICLASS TcxGridController;
class DELPHICLASS TcxCustomGridHandler;
class DELPHICLASS TcxGridViewInfo;
class PASCALIMPLEMENTATION TcxCustomGridHandler : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	TcxCustomGrid* FControl;
	Cxgridcustomview::TcxCustomGridController* __fastcall GetActiveController(void);
	Cxgridcustomview::TcxCustomGridView* __fastcall GetActiveGridView(void);
	TMetaClass* __fastcall GetLookAndFeelPainter(void);
	TcxGridViewInfo* __fastcall GetViewInfo(void);
	
protected:
	__property Cxgridcustomview::TcxCustomGridController* ActiveController = {read=GetActiveController};
	__property Cxgridcustomview::TcxCustomGridView* ActiveGridView = {read=GetActiveGridView};
	__property TMetaClass* LookAndFeelPainter = {read=GetLookAndFeelPainter};
	__property TcxGridViewInfo* ViewInfo = {read=GetViewInfo};
	
public:
	__fastcall virtual TcxCustomGridHandler(TcxCustomGrid* AControl);
	__property TcxCustomGrid* Control = {read=FControl};
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxCustomGridHandler(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxGridController : public TcxCustomGridHandler 
{
	typedef TcxCustomGridHandler inherited;
	
private:
	Cxgridcommon::TcxCustomGridDragOpenInfo* FDragOpenInfo;
	Extctrls::TTimer* FDragOpenTimer;
	void __fastcall DragOpenTimerHandler(System::TObject* Sender);
	
public:
	virtual void __fastcall DoCancelMode(void);
	virtual void __fastcall FocusChanged(void);
	DYNAMIC void __fastcall KeyDown(Word &Key, Classes::TShiftState Shift);
	DYNAMIC void __fastcall KeyUp(Word &Key, Classes::TShiftState Shift);
	virtual Controls::TCursor __fastcall GetCursor(int X, int Y);
	DYNAMIC void __fastcall MouseDown(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseMove(Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseUp(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall DragOver(System::TObject* Source, int X, int Y, Controls::TDragState State, bool &Accept);
	virtual void __fastcall EndDrag(System::TObject* Target, int X, int Y);
	virtual void __fastcall StartDrag(Controls::TDragObject* &DragObject);
	virtual Cxgridcommon::TcxCustomGridDragOpenInfo* __fastcall GetDragOpenInfo(Cxgridcustomview::TcxCustomGridHitTest* AHitTest);
	bool __fastcall IsDragOpenHitTest(Cxgridcustomview::TcxCustomGridHitTest* AHitTest, /* out */ Cxgridcommon::TcxCustomGridDragOpenInfo* &ADragOpenInfo);
	void __fastcall StartDragOpen(Cxgridcommon::TcxCustomGridDragOpenInfo* ADragOpenInfo);
	void __fastcall StopDragOpen(void);
	__property Cxgridcommon::TcxCustomGridDragOpenInfo* DragOpenInfo = {read=FDragOpenInfo};
	DYNAMIC void __fastcall DragAndDrop(const Types::TPoint &P, bool &Accepted);
	DYNAMIC void __fastcall EndDragAndDrop(bool Accepted);
	virtual TMetaClass* __fastcall GetDragAndDropObjectClass(void);
	DYNAMIC bool __fastcall StartDragAndDrop(const Types::TPoint &P);
public:
	#pragma option push -w-inl
	/* TcxCustomGridHandler.Create */ inline __fastcall virtual TcxGridController(TcxCustomGrid* AControl) : TcxCustomGridHandler(AControl) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridController(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridPainter;
class PASCALIMPLEMENTATION TcxGridPainter : public TcxCustomGridHandler 
{
	typedef TcxCustomGridHandler inherited;
	
private:
	Cxgraphics::TcxCanvas* __fastcall GetCanvas(void);
	
protected:
	virtual void __fastcall DrawDetailsSite(void);
	virtual void __fastcall DrawEmptyArea(void);
	
public:
	virtual void __fastcall Invalidate(bool AInvalidateDetails)/* overload */;
	virtual void __fastcall Invalidate(const Types::TRect &R)/* overload */;
	virtual void __fastcall Paint(void);
	__property Cxgraphics::TcxCanvas* Canvas = {read=GetCanvas};
public:
	#pragma option push -w-inl
	/* TcxCustomGridHandler.Create */ inline __fastcall virtual TcxGridPainter(TcxCustomGrid* AControl) : TcxCustomGridHandler(AControl) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridPainter(void) { }
	#pragma option pop
	
};


typedef void __fastcall (__closure *TcxGridActiveTabChangedEvent)(TcxCustomGrid* Sender, Cxgridlevel::TcxGridLevel* ALevel);

typedef void __fastcall (__closure *TcxGridFocusedViewChangedEvent)(TcxCustomGrid* Sender, Cxgridcustomview::TcxCustomGridView* APrevFocusedView, Cxgridcustomview::TcxCustomGridView* AFocusedView);

typedef void __fastcall (__closure *TcxGridLayoutChangedEvent)(TcxCustomGrid* Sender, Cxgridcustomview::TcxCustomGridView* AGridView);

typedef TMetaClass*TcxGridControllerClass;

typedef TMetaClass*TcxGridPainterClass;

typedef TMetaClass*TcxGridViewInfoClass;

class PASCALIMPLEMENTATION TcxCustomGrid : public Cxcontrols::TcxControl 
{
	typedef Cxcontrols::TcxControl inherited;
	
private:
	Cxgridlevel::TcxGridLevel* FActiveLevel;
	Classes::TList* FChanges;
	Classes::TList* FChangesStack;
	TcxGridController* FController;
	bool FDragOpening;
	int FDragOpeningWaitTime;
	Cxgridcustomview::TcxCustomGridView* FFocusedView;
	bool FIsPopupControl;
	bool FLastFocused;
	Cxgridlevel::TcxGridLevel* FLevels;
	Cxnavigator::TcxNavigatorControlNotifier* FNavigatorNotifier;
	Classes::TList* FNotifications;
	TcxGridPainter* FPainter;
	bool FProcessingChangesStack;
	TcxCustomGridStructureNavigator* FStructureNavigator;
	bool FTabStop;
	int FUpdateLockCount;
	TcxGridViewInfo* FViewInfo;
	Classes::TList* FViews;
	TcxGridActiveTabChangedEvent FOnActiveTabChanged;
	TcxGridFocusedViewChangedEvent FOnFocusedViewChanged;
	TcxGridLayoutChangedEvent FOnLayoutChanged;
	Classes::TNotifyEvent FSubClassEvents;
	Cxgridcustomview::TcxCustomGridView* __fastcall GetActiveView(void);
	Cxnavigator::_di_IcxNavigator __fastcall GetFocusedViewNavigator();
	Cxgridcustomview::TcxCustomGridView* __fastcall GetView(int Index);
	int __fastcall GetViewCount(void);
	Cxgridlevel::TcxGridLevelOptions* __fastcall GetRootLevelOptions(void);
	Cxgridlevel::TcxGridLevelStyles* __fastcall GetRootLevelStyles(void);
	bool __fastcall GetUpdateLocked(void);
	void __fastcall SetActiveLevel(Cxgridlevel::TcxGridLevel* Value);
	void __fastcall SetDragOpeningWaitTime(int Value);
	void __fastcall SetFocusedView(Cxgridcustomview::TcxCustomGridView* Value);
	void __fastcall SetLevels(Cxgridlevel::TcxGridLevel* Value);
	void __fastcall SetRootLevelOptions(Cxgridlevel::TcxGridLevelOptions* Value);
	void __fastcall SetRootLevelStyles(Cxgridlevel::TcxGridLevelStyles* Value);
	HIDESBASE void __fastcall SetTabStop(bool Value);
	void __fastcall AddView(Cxgridcustomview::TcxCustomGridView* AView);
	void __fastcall RemoveView(Cxgridcustomview::TcxCustomGridView* AView);
	void __fastcall DestroyViews(void);
	void __fastcall DestroyChanges(Classes::TList* AChanges);
	void __fastcall DestroyViewChanges(Cxgridcustomview::TcxCustomGridView* AView);
	void __fastcall CreateLevels(void);
	
protected:
	bool __fastcall NavigatorIsBof(void);
	bool __fastcall NavigatorIsEof(void);
	bool __fastcall NavigatorCanEdit(void);
	bool __fastcall NavigatorCanDelete(void);
	bool __fastcall NavigatorCanInsert(void);
	bool __fastcall NavigatorIsEditing(void);
	void __fastcall NavigatorClearBookmark(void);
	bool __fastcall NavigatorIsBookmarkAvailable(void);
	void __fastcall NavigatorDoAction(int AButtonIndex);
	Cxnavigator::TcxNavigatorControlNotifier* __fastcall NavigatorGetNotifier(void);
	bool __fastcall NavigatorIsActionSupported(int AButtonIndex);
	DYNAMIC void __fastcall AddChildComponent(Cxcontrols::TcxControlChildComponent* AComponent);
	DYNAMIC void __fastcall RemoveChildComponent(Cxcontrols::TcxControlChildComponent* AComponent);
	DYNAMIC void __fastcall BoundsChanged(void);
	DYNAMIC void __fastcall DoCancelMode(void);
	DYNAMIC void __fastcall FocusChanged(void);
	DYNAMIC void __fastcall GetChildren(Classes::TGetChildProc Proc, Classes::TComponent* Root);
	virtual Controls::TCursor __fastcall GetCursor(int X, int Y);
	DYNAMIC bool __fastcall GetDesignHitTest(int X, int Y, Classes::TShiftState Shift);
	virtual bool __fastcall GetIsFocused(void);
	DYNAMIC void __fastcall KeyDown(Word &Key, Classes::TShiftState Shift);
	DYNAMIC void __fastcall KeyUp(Word &Key, Classes::TShiftState Shift);
	virtual void __fastcall Loaded(void);
	DYNAMIC bool __fastcall MayFocus(void);
	DYNAMIC void __fastcall MouseDown(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseMove(Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseUp(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall LookAndFeelChanged(Cxlookandfeels::TcxLookAndFeel* Sender, Cxlookandfeels::TcxLookAndFeelValues AChangedValues);
	virtual void __fastcall Paint(void);
	virtual void __fastcall ReadState(Classes::TReader* Reader);
	virtual void __fastcall SetName(const AnsiString NewName);
	DYNAMIC void __fastcall DragAndDrop(const Types::TPoint &P, bool &Accepted);
	DYNAMIC void __fastcall EndDragAndDrop(bool Accepted);
	virtual TMetaClass* __fastcall GetDragAndDropObjectClass(void);
	DYNAMIC bool __fastcall StartDragAndDrop(const Types::TPoint &P);
	DYNAMIC void __fastcall DoEndDrag(System::TObject* Target, int X, int Y);
	DYNAMIC void __fastcall DoStartDrag(Controls::TDragObject* &DragObject);
	DYNAMIC void __fastcall DragOver(System::TObject* Source, int X, int Y, Controls::TDragState State, bool &Accept);
	virtual void __fastcall CreateHandlers(void);
	virtual void __fastcall DestroyHandlers(void);
	virtual void __fastcall DoActiveTabChanged(Cxgridlevel::TcxGridLevel* ALevel);
	void __fastcall DoChange(Cxgridcommon::TcxCustomGridChange* AGridChange);
	virtual void __fastcall DoLayoutChanged(Cxgridcustomview::TcxCustomGridView* AGridView);
	void __fastcall DoProcessChangesStack(void);
	void __fastcall DoUpdate(Classes::TList* AChanges);
	virtual void __fastcall FocusedViewChanged(Cxgridcustomview::TcxCustomGridView* APrevFocusedView, Cxgridcustomview::TcxCustomGridView* AFocusedView);
	virtual TMetaClass* __fastcall GetControllerClass(void);
	virtual TMetaClass* __fastcall GetLevelsClass(void);
	virtual TMetaClass* __fastcall GetPainterClass(void);
	virtual TMetaClass* __fastcall GetViewInfoClass(void);
	void __fastcall LevelChanged(Cxgridlevel::TcxGridLevel* ALevel, Cxgridlevel::TcxGridLevelChangeKind AChangeKind);
	void __fastcall RefreshNavigators(void);
	void __fastcall StructureNavigatorChanged(void);
	void __fastcall ViewChanged(Cxgridcustomview::TcxCustomGridView* AView, Cxgridcustomview::TcxGridViewChangeKind AChangeKind);
	void __fastcall UpdateFocusing(bool AChildFocused);
	__property bool LastFocused = {read=FLastFocused, nodefault};
	__property Cxnavigator::_di_IcxNavigator FocusedViewNavigator = {read=GetFocusedViewNavigator};
	__property bool IsPopupControl = {read=FIsPopupControl, write=FIsPopupControl, nodefault};
	__property Cxnavigator::TcxNavigatorControlNotifier* NavigatorNotifier = {read=FNavigatorNotifier};
	__property TcxCustomGridStructureNavigator* StructureNavigator = {read=FStructureNavigator};
	
public:
	__fastcall virtual TcxCustomGrid(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxCustomGrid(void);
	HIDESBASE void __fastcall Invalidate(bool AHardUpdate = false);
	void __fastcall BeginUpdate(void);
	void __fastcall CancelUpdate(void);
	HIDESBASE void __fastcall Changed(Cxgridcommon::TcxCustomGridChange* AGridChange);
	void __fastcall CheckFocusedView(void);
	void __fastcall EndUpdate(void);
	virtual void __fastcall LayoutChanged(void);
	virtual void __fastcall SizeChanged(void);
	__property bool UpdateLocked = {read=GetUpdateLocked, nodefault};
	Cxgridcustomview::TcxCustomGridView* __fastcall CreateView(TMetaClass* AViewClass);
	bool __fastcall ViewExists(Cxgridcustomview::TcxCustomGridView* AView);
	void __fastcall RegisterNotification(TcxCustomGridNotification* ANotification);
	void __fastcall UnregisterNotification(TcxCustomGridNotification* ANotification);
	void __fastcall SendNotifications(TcxGridNotificationKind AKind, void * AData = (void *)(0x0));
	__property Cxgridcustomview::TcxCustomGridView* ActiveView = {read=GetActiveView};
	__property Cxgridlevel::TcxGridLevel* ActiveLevel = {read=FActiveLevel, write=SetActiveLevel};
	__property BorderStyle  = {default=1};
	__property TcxGridController* Controller = {read=FController};
	__property bool DragOpening = {read=FDragOpening, write=FDragOpening, default=1};
	__property int DragOpeningWaitTime = {read=FDragOpeningWaitTime, write=SetDragOpeningWaitTime, default=500};
	__property Cxgridcustomview::TcxCustomGridView* FocusedView = {read=FFocusedView, write=SetFocusedView};
	__property Font ;
	__property Cxgridlevel::TcxGridLevel* Levels = {read=FLevels, write=SetLevels};
	__property LookAndFeel ;
	__property LookAndFeelPainter ;
	__property TcxGridPainter* Painter = {read=FPainter};
	__property Cxgridlevel::TcxGridLevelOptions* RootLevelOptions = {read=GetRootLevelOptions, write=SetRootLevelOptions};
	__property Cxgridlevel::TcxGridLevelStyles* RootLevelStyles = {read=GetRootLevelStyles, write=SetRootLevelStyles};
	__property bool TabStop = {read=FTabStop, write=SetTabStop, default=1};
	__property int ViewCount = {read=GetViewCount, nodefault};
	__property TcxGridViewInfo* ViewInfo = {read=FViewInfo};
	__property Cxgridcustomview::TcxCustomGridView* Views[int Index] = {read=GetView};
	__property TcxGridActiveTabChangedEvent OnActiveTabChanged = {read=FOnActiveTabChanged, write=FOnActiveTabChanged};
	__property TcxGridFocusedViewChangedEvent OnFocusedViewChanged = {read=FOnFocusedViewChanged, write=FOnFocusedViewChanged};
	__property TcxGridLayoutChangedEvent OnLayoutChanged = {read=FOnLayoutChanged, write=FOnLayoutChanged};
	
__published:
	__property Classes::TNotifyEvent RootLevelStylesEvents = {read=FSubClassEvents, write=FSubClassEvents};
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomGrid(HWND ParentWindow) : Cxcontrols::TcxControl(ParentWindow) { }
	#pragma option pop
	
private:
	void *__IcxNavigator;	/* Cxnavigator::IcxNavigator [IsActionSupported=NavigatorIsActionSupported, GetNotifier=NavigatorGetNotifier, DoAction=NavigatorDoAction, IsBookmarkAvailable=NavigatorIsBookmarkAvailable, IsEditing=NavigatorIsEditing, ClearBookmark=NavigatorClearBookmark, CanInsert=NavigatorCanInsert, CanDelete=NavigatorCanDelete, CanEdit=NavigatorCanEdit, IsEof=NavigatorIsEof, IsBof=NavigatorIsBof] */
	
public:
	operator IcxNavigator*(void) { return (IcxNavigator*)&__IcxNavigator; }
	
};


class PASCALIMPLEMENTATION TcxCustomGridStructureNavigator : public Cxcontrols::TcxControl 
{
	typedef Cxcontrols::TcxControl inherited;
	
private:
	TcxCustomGrid* FGrid;
	
protected:
	HIDESBASE virtual void __fastcall Changed(void);
	DYNAMIC void __fastcall FontChanged(void);
	DYNAMIC bool __fastcall MayFocus(void);
	virtual Types::TRect __fastcall CalculateBoundsRect(void) = 0 ;
	
public:
	__fastcall virtual TcxCustomGridStructureNavigator(TcxCustomGrid* AGrid);
	virtual void __fastcall BeforeGridLoading(void);
	__property TcxCustomGrid* Grid = {read=FGrid};
public:
	#pragma option push -w-inl
	/* TcxControl.Destroy */ inline __fastcall virtual ~TcxCustomGridStructureNavigator(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomGridStructureNavigator(HWND ParentWindow) : Cxcontrols::TcxControl(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridDragOpenInfoTab;
class PASCALIMPLEMENTATION TcxGridDragOpenInfoTab : public Cxgridcommon::TcxCustomGridDragOpenInfo 
{
	typedef Cxgridcommon::TcxCustomGridDragOpenInfo inherited;
	
public:
	Cxgridlevel::TcxGridLevel* Level;
	__fastcall virtual TcxGridDragOpenInfoTab(Cxgridlevel::TcxGridLevel* ALevel);
	virtual bool __fastcall Equals(Cxgridcommon::TcxCustomGridDragOpenInfo* AInfo);
	virtual void __fastcall Run(void);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridDragOpenInfoTab(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxGridTopDetailsSiteViewInfoClass;

class DELPHICLASS TcxGridTopDetailsSiteViewInfo;
class PASCALIMPLEMENTATION TcxGridTopDetailsSiteViewInfo : public Cxgriddetailssite::TcxCustomGridDetailsSiteViewInfo 
{
	typedef Cxgriddetailssite::TcxCustomGridDetailsSiteViewInfo inherited;
	
private:
	TcxCustomGrid* __fastcall GetControl(void);
	
protected:
	virtual int __fastcall CalculateHeight(void);
	virtual int __fastcall CalculateWidth(void);
	virtual Cxgridcustomview::TcxCustomGridView* __fastcall GetActiveGridView(void);
	virtual Cxgridlevel::TcxGridLevel* __fastcall GetActiveLevel(void);
	virtual Cxgraphics::TcxCanvas* __fastcall GetCanvas(void);
	virtual TMetaClass* __fastcall GetLookAndFeelPainter(void);
	virtual int __fastcall GetMaxHeight(void);
	virtual int __fastcall GetMaxWidth(void);
	virtual void __fastcall InitTabHitTest(Cxgriddetailssite::TcxGridDetailsSiteTabHitTest* AHitTest);
	__property TcxCustomGrid* Control = {read=GetControl};
	
public:
	virtual void __fastcall ChangeActiveTab(Cxgridlevel::TcxGridLevel* ALevel);
	virtual void __fastcall VisibilityChanged(bool AVisible);
public:
	#pragma option push -w-inl
	/* TcxCustomGridDetailsSiteViewInfo.Create */ inline __fastcall virtual TcxGridTopDetailsSiteViewInfo(Cxgridlevel::TcxGridLevel* ALevel) : Cxgriddetailssite::TcxCustomGridDetailsSiteViewInfo(ALevel) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomGridDetailsSiteViewInfo.Destroy */ inline __fastcall virtual ~TcxGridTopDetailsSiteViewInfo(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxGridViewInfo : public TcxCustomGridHandler 
{
	typedef TcxCustomGridHandler inherited;
	
private:
	System::TObject* FDetailsSiteViewInfo;
	Types::TRect __fastcall GetBounds();
	Types::TRect __fastcall GetClientBounds();
	Graphics::TColor __fastcall GetEmptyAreaColor(void);
	
protected:
	virtual void __fastcall CreateViewInfos(void);
	virtual void __fastcall DestroyViewInfos(void);
	virtual TMetaClass* __fastcall GetDetailsSiteViewInfoClass(void);
	void __fastcall RecreateViewInfos(void);
	
public:
	__fastcall virtual TcxGridViewInfo(TcxCustomGrid* AControl);
	__fastcall virtual ~TcxGridViewInfo(void);
	virtual void __fastcall Calculate(void);
	virtual Cxgridcustomview::TcxCustomGridHitTest* __fastcall GetHitTest(int X, int Y);
	__property Types::TRect Bounds = {read=GetBounds};
	__property Types::TRect ClientBounds = {read=GetClientBounds};
	__property System::TObject* DetailsSiteViewInfo = {read=FDetailsSiteViewInfo};
	__property Graphics::TColor EmptyAreaColor = {read=GetEmptyAreaColor, nodefault};
};


class DELPHICLASS TcxGrid;
class PASCALIMPLEMENTATION TcxGrid : public TcxCustomGrid 
{
	typedef TcxCustomGrid inherited;
	
__published:
	__property Align  = {default=0};
	__property Anchors  = {default=3};
	__property BevelEdges  = {default=15};
	__property BevelInner  = {index=0, default=2};
	__property BevelOuter  = {index=1, default=1};
	__property BevelKind  = {default=0};
	__property BevelWidth  = {default=1};
	__property BorderWidth  = {default=0};
	__property BorderStyle  = {default=1};
	__property Constraints ;
	__property DragCursor  = {default=-12};
	__property DragKind  = {default=0};
	__property DragMode  = {default=0};
	__property DragOpening  = {default=1};
	__property DragOpeningWaitTime  = {default=500};
	__property Enabled  = {default=1};
	__property Font ;
	__property ParentFont  = {default=1};
	__property PopupMenu ;
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=1};
	__property Visible  = {default=1};
	__property OnClick ;
	__property OnContextPopup ;
	__property OnDblClick ;
	__property OnDragDrop ;
	__property OnDragOver ;
	__property OnEndDock ;
	__property OnEndDrag ;
	__property OnEnter ;
	__property OnExit ;
	__property OnMouseDown ;
	__property OnMouseMove ;
	__property OnMouseUp ;
	__property OnMouseWheel ;
	__property OnMouseWheelDown ;
	__property OnMouseWheelUp ;
	__property OnResize ;
	__property OnStartDock ;
	__property OnStartDrag ;
	__property LookAndFeel ;
	__property RootLevelOptions ;
	__property RootLevelStyles ;
	__property OnActiveTabChanged ;
	__property OnFocusedViewChanged ;
	__property OnLayoutChanged ;
	__property OnMouseEnter ;
	__property OnMouseLeave ;
public:
	#pragma option push -w-inl
	/* TcxCustomGrid.Create */ inline __fastcall virtual TcxGrid(Classes::TComponent* AOwner) : TcxCustomGrid(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomGrid.Destroy */ inline __fastcall virtual ~TcxGrid(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxGrid(HWND ParentWindow) : TcxCustomGrid(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridViewRepository;
class PASCALIMPLEMENTATION TcxGridViewRepository : public Classes::TComponent 
{
	typedef Classes::TComponent inherited;
	
public:
	Cxgridcustomview::TcxCustomGridView* operator[](int Index) { return Items[Index]; }
	
private:
	Classes::TList* FItems;
	int __fastcall GetCount(void);
	Cxgridcustomview::TcxCustomGridView* __fastcall GetItem(int Index);
	void __fastcall DestroyItems(void);
	
protected:
	DYNAMIC void __fastcall GetChildren(Classes::TGetChildProc Proc, Classes::TComponent* Root);
	void __fastcall AddItem(Cxgridcustomview::TcxCustomGridView* AItem);
	void __fastcall RemoveItem(Cxgridcustomview::TcxCustomGridView* AItem);
	
public:
	__fastcall virtual TcxGridViewRepository(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxGridViewRepository(void);
	Cxgridcustomview::TcxCustomGridView* __fastcall CreateItem(TMetaClass* AItemClass);
	__property int Count = {read=GetCount, nodefault};
	__property Cxgridcustomview::TcxCustomGridView* Items[int Index] = {read=GetItem/*, default*/};
};


//-- var, const, procedure ---------------------------------------------------
static const Word cxGridDefaultDragOpeningWaitTime = 0x1f4;
extern PACKAGE TMetaClass*cxGridStructureNavigatorClass;
extern PACKAGE TcxCustomGrid* __fastcall GetParentGrid(Controls::TControl* AControl);

}	/* namespace Cxgrid */
using namespace Cxgrid;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxGrid
