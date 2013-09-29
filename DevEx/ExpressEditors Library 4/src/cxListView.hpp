// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxListView.pas' rev: 6.00

#ifndef cxListViewHPP
#define cxListViewHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxScrollBar.hpp>	// Pascal unit
#include <cxLookAndFeels.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <cxExtEditConsts.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <ImgList.hpp>	// Pascal unit
#include <CommCtrl.hpp>	// Pascal unit
#include <ComCtrls.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxlistview
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxIconOptions;
class PASCALIMPLEMENTATION TcxIconOptions : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	Comctrls::TIconArrangement FArrangement;
	bool FAutoArrange;
	bool FWrapText;
	Classes::TNotifyEvent FArrangementChange;
	Classes::TNotifyEvent FAutoArrangeChange;
	Classes::TNotifyEvent FWrapTextChange;
	void __fastcall SetArrangement(Comctrls::TIconArrangement Value);
	void __fastcall SetAutoArrange(bool Value);
	void __fastcall SetWrapText(bool Value);
	
public:
	__fastcall TcxIconOptions(Classes::TPersistent* AOwner);
	
__published:
	__property Comctrls::TIconArrangement Arrangement = {read=FArrangement, write=SetArrangement, default=0};
	__property bool AutoArrange = {read=FAutoArrange, write=SetAutoArrange, default=0};
	__property bool WrapText = {read=FWrapText, write=SetWrapText, default=1};
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxIconOptions(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomInnerListView;
class DELPHICLASS TcxCustomListView;
class PASCALIMPLEMENTATION TcxCustomInnerListView : public Comctrls::TListView 
{
	typedef Comctrls::TListView inherited;
	
private:
	Comctrls::TListItem* FOldItem;
	AnsiString FOldHint;
	Cxgraphics::TcxCanvas* FCanvas;
	Cxscrollbar::TcxScrollBar* FHScrollBar;
	Cxlookandfeels::TcxLookAndFeel* FLookAndFeel;
	Cxscrollbar::TcxScrollBar* FVScrollBar;
	bool FScrollBarsCalculating;
	int FScrollBarsLockCount;
	void __fastcall CreateScrollBars(void);
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
	HIDESBASE MESSAGE void __fastcall CMHintShow(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CNNotify(Messages::TWMNotify &Message);
	TcxCustomListView* __fastcall GetContainer(void);
	HIDESBASE MESSAGE void __fastcall WMLButtonDown(Messages::TWMMouse &Message);
	
protected:
	TcxCustomListView* FContainer;
	DYNAMIC void __fastcall Click(void);
	DYNAMIC void __fastcall DblClick(void);
	virtual void __fastcall Loaded(void);
	DYNAMIC bool __fastcall CanEdit(Comctrls::TListItem* Item);
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
	virtual void __fastcall CreateParams(Controls::TCreateParams &Params);
	virtual void __fastcall WndProc(Messages::TMessage &Message);
	virtual void __fastcall DoCancelEdit(void);
	Types::TRect __fastcall GetSizeGripRect();
	void __fastcall LockScrollBarsUpdate(bool ALock);
	void __fastcall SetScrollBarsParameters(void);
	__property TcxCustomListView* Container = {read=GetContainer};
	__property Cxlookandfeels::TcxLookAndFeel* LookAndFeel = {read=FLookAndFeel, write=SetLookAndFeel};
	
public:
	__fastcall virtual TcxCustomInnerListView(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxCustomInnerListView(void);
	DYNAMIC void __fastcall DragDrop(System::TObject* Source, int X, int Y);
	__property Cxgraphics::TcxCanvas* Canvas = {read=FCanvas};
	__property Cxscrollbar::TcxScrollBar* HScrollBar = {read=FHScrollBar};
	__property Cxscrollbar::TcxScrollBar* VScrollBar = {read=FVScrollBar};
	DYNAMIC bool __fastcall CanFocus(void);
	virtual void __fastcall DeleteSelected(void);
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomInnerListView(HWND ParentWindow) : Comctrls::TListView(ParentWindow) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxCustomInnerListViewClass;

class PASCALIMPLEMENTATION TcxCustomListView : public Cxcontainer::TcxContainer 
{
	typedef Cxcontainer::TcxContainer inherited;
	
private:
	TcxCustomInnerListView* FListView;
	TcxIconOptions* FIconOptions;
	Classes::TNotifyEvent FOnCancelEdit;
	bool FOwnerDraw;
	bool __fastcall GetReadOnly(void);
	Comctrls::TListItems* __fastcall GetListItems(void);
	Comctrls::TListColumns* __fastcall GetListColumns(void);
	Cxgraphics::TcxCanvas* __fastcall GetListViewCanvas(void);
	bool __fastcall GetColumnClick(void);
	bool __fastcall GetHideSelection(void);
	TcxIconOptions* __fastcall GetIconOptions(void);
	int __fastcall GetAllocBy(void);
	int __fastcall GetHoverTime(void);
	Imglist::TCustomImageList* __fastcall GetLargeImages(void);
	bool __fastcall GetMultiSelect(void);
	bool __fastcall GetOwnerData(void);
	bool __fastcall GetOwnerDraw(void);
	Comctrls::TLVAdvancedCustomDrawEvent __fastcall GetOnAdvancedCustomDraw();
	Comctrls::TLVAdvancedCustomDrawItemEvent __fastcall GetOnAdvancedCustomDrawItem();
	Comctrls::TLVAdvancedCustomDrawSubItemEvent __fastcall GetOnAdvancedCustomDrawSubItem();
	Comctrls::TLVChangeEvent __fastcall GetOnChange();
	Comctrls::TLVChangingEvent __fastcall GetOnChanging();
	Comctrls::TLVColumnClickEvent __fastcall GetOnColumnClick();
	Classes::TNotifyEvent __fastcall GetOnColumnDragged();
	Comctrls::TLVColumnRClickEvent __fastcall GetOnColumnRightClick();
	Comctrls::TLVCompareEvent __fastcall GetOnCompare();
	Comctrls::TLVCustomDrawEvent __fastcall GetOnCustomDraw();
	Comctrls::TLVCustomDrawItemEvent __fastcall GetOnCustomDrawItem();
	Comctrls::TLVCustomDrawSubItemEvent __fastcall GetOnCustomDrawSubItem();
	Comctrls::TLVOwnerDataEvent __fastcall GetOnData();
	Comctrls::TLVOwnerDataFindEvent __fastcall GetOnDataFind();
	Comctrls::TLVOwnerDataHintEvent __fastcall GetOnDataHint();
	Comctrls::TLVOwnerDataStateChangeEvent __fastcall GetOnDataStateChange();
	Comctrls::TLVDeletedEvent __fastcall GetOnDeletion();
	Comctrls::TLVDrawItemEvent __fastcall GetOnDrawItem();
	Comctrls::TLVEditedEvent __fastcall GetOnEdited();
	Comctrls::TLVEditingEvent __fastcall GetOnEditing();
	Comctrls::TLVInfoTipEvent __fastcall GetOnInfoTip();
	Comctrls::TLVDeletedEvent __fastcall GetOnInsert();
	Comctrls::TLVNotifyEvent __fastcall GetOnGetImageIndex();
	Comctrls::TLVSubItemImageEvent __fastcall GetOnGetSubItemImage();
	bool __fastcall GetShowWorkAreas(void);
	Comctrls::TLVSelectItemEvent __fastcall GetOnSelectItem();
	bool __fastcall GetShowColumnHeaders(void);
	Imglist::TCustomImageList* __fastcall GetSmallImages(void);
	Comctrls::TSortType __fastcall GetSortType(void);
	Imglist::TCustomImageList* __fastcall GetStateImages(void);
	Comctrls::TViewStyle __fastcall GetViewStyle(void);
	Comctrls::TLVCreateItemClassEvent __fastcall GetOnCreateItemClass();
	void __fastcall SetReadOnly(bool Value);
	void __fastcall SetListItems(Comctrls::TListItems* Value);
	void __fastcall SetListColumns(Comctrls::TListColumns* Value);
	void __fastcall SetColumnClick(bool Value);
	void __fastcall SetHideSelection(bool Value);
	void __fastcall SetIconOptions(TcxIconOptions* Value);
	void __fastcall SetAllocBy(int Value);
	void __fastcall SetHoverTime(int Value);
	void __fastcall SetLargeImages(Imglist::TCustomImageList* Value);
	void __fastcall SetMultiSelect(bool Value);
	void __fastcall SetOwnerData(bool Value);
	void __fastcall SetOwnerDraw(bool Value);
	void __fastcall SetOnAdvancedCustomDraw(Comctrls::TLVAdvancedCustomDrawEvent Value);
	void __fastcall SetOnAdvancedCustomDrawItem(Comctrls::TLVAdvancedCustomDrawItemEvent Value);
	void __fastcall SetOnAdvancedCustomDrawSubItem(Comctrls::TLVAdvancedCustomDrawSubItemEvent Value);
	void __fastcall SetOnChange(Comctrls::TLVChangeEvent Value);
	void __fastcall SetOnChanging(Comctrls::TLVChangingEvent Value);
	void __fastcall SetOnColumnClick(Comctrls::TLVColumnClickEvent Value);
	void __fastcall SetOnColumnDragged(Classes::TNotifyEvent Value);
	void __fastcall SetOnColumnRightClick(Comctrls::TLVColumnRClickEvent Value);
	void __fastcall SetOnCompare(Comctrls::TLVCompareEvent Value);
	void __fastcall SetOnCustomDraw(Comctrls::TLVCustomDrawEvent Value);
	void __fastcall SetOnCustomDrawItem(Comctrls::TLVCustomDrawItemEvent Value);
	void __fastcall SetOnCustomDrawSubItem(Comctrls::TLVCustomDrawSubItemEvent Value);
	void __fastcall SetOnData(Comctrls::TLVOwnerDataEvent Value);
	void __fastcall SetOnDataFind(Comctrls::TLVOwnerDataFindEvent Value);
	void __fastcall SetOnDataHint(Comctrls::TLVOwnerDataHintEvent Value);
	void __fastcall SetOnDataStateChange(Comctrls::TLVOwnerDataStateChangeEvent Value);
	void __fastcall SetOnDeletion(Comctrls::TLVDeletedEvent Value);
	void __fastcall SetOnDrawItem(Comctrls::TLVDrawItemEvent Value);
	void __fastcall SetOnEdited(Comctrls::TLVEditedEvent Value);
	void __fastcall SetOnEditing(Comctrls::TLVEditingEvent Value);
	void __fastcall SetOnInfoTip(Comctrls::TLVInfoTipEvent Value);
	void __fastcall SetOnInsert(Comctrls::TLVDeletedEvent Value);
	void __fastcall SetOnGetImageIndex(Comctrls::TLVNotifyEvent Value);
	void __fastcall SetOnGetSubItemImage(Comctrls::TLVSubItemImageEvent Value);
	void __fastcall SetShowWorkAreas(bool Value);
	void __fastcall SetOnSelectItem(Comctrls::TLVSelectItemEvent Value);
	void __fastcall SetShowColumnHeaders(bool Value);
	void __fastcall SetSmallImages(Imglist::TCustomImageList* Value);
	void __fastcall SetSortType(Comctrls::TSortType Value);
	void __fastcall SetStateImages(Imglist::TCustomImageList* Value);
	void __fastcall SetOnCreateItemClass(Comctrls::TLVCreateItemClassEvent Value);
	bool __fastcall GetCheckBoxes(void);
	Comctrls::TListColumn* __fastcall GetColumnFromIndex(int Index);
	Comctrls::TListItem* __fastcall GetDropTarget(void);
	bool __fastcall GetFullDrag(void);
	bool __fastcall GetGridLines(void);
	bool __fastcall GetHotTrack(void);
	Comctrls::TListHotTrackStyles __fastcall GetHotTrackStyles(void);
	Comctrls::TListItem* __fastcall GetItemFocused(void);
	bool __fastcall GetRowSelect(void);
	Comctrls::TListItem* __fastcall GetSelected(void);
	Comctrls::TListItem* __fastcall GetTopItem(void);
	Types::TPoint __fastcall GetViewOrigin();
	int __fastcall GetVisibleRowCount(void);
	Types::TRect __fastcall GetBoundingRect();
	Comctrls::TWorkAreas* __fastcall GetWorkAreas(void);
	void __fastcall SetCheckboxes(bool Value);
	void __fastcall SetDropTarget(Comctrls::TListItem* Value);
	void __fastcall SetFullDrag(bool Value);
	void __fastcall SetGridLines(bool Value);
	void __fastcall SetHotTrack(bool Value);
	void __fastcall SetHotTrackStyles(Comctrls::TListHotTrackStyles Value);
	void __fastcall SetItemFocused(Comctrls::TListItem* Value);
	void __fastcall SetRowSelect(bool Value);
	void __fastcall SetSelected(Comctrls::TListItem* Value);
	void __fastcall ArrangementChangeHandler(System::TObject* Sender);
	void __fastcall AutoArrangeChangeHandler(System::TObject* Sender);
	void __fastcall WrapTextChangeHandler(System::TObject* Sender);
	void __fastcall UpdateIconOptions(void);
	
protected:
	virtual void __fastcall AdjustInnerControl(void);
	DYNAMIC void __fastcall DoExit(void);
	DYNAMIC void __fastcall FontChanged(void);
	virtual void __fastcall ContainerStyleChanged(System::TObject* Sender);
	/* virtual class method */ virtual TMetaClass* __fastcall GetStyleClass(TMetaClass* vmt);
	virtual bool __fastcall IsInternalControl(Controls::TControl* AControl);
	virtual bool __fastcall RefreshContainer(const Types::TPoint &P, Cxcontainer::TcxMouseButton Button, Classes::TShiftState Shift, bool AIsMouseEvent);
	virtual bool __fastcall CanResize(int &NewWidth, int &NewHeight);
	virtual void __fastcall SetSize(void);
	virtual void __fastcall WndProc(Messages::TMessage &Message);
	virtual TcxCustomInnerListView* __fastcall GetInnerListView(void);
	virtual void __fastcall SetInnerListView(const TcxCustomInnerListView* Value);
	/* virtual class method */ virtual TMetaClass* __fastcall GetListViewClass(TMetaClass* vmt);
	virtual void __fastcall InternalInitListView(void);
	DYNAMIC void __fastcall ActionChange(System::TObject* Sender, bool CheckDefaults);
	DYNAMIC bool __fastcall CanChange(Comctrls::TListItem* Item, int Change);
	DYNAMIC bool __fastcall CanEdit(Comctrls::TListItem* Item);
	DYNAMIC void __fastcall Change(Comctrls::TListItem* Item, int Change);
	DYNAMIC void __fastcall ChangeScale(int M, int D);
	DYNAMIC void __fastcall ColClick(Comctrls::TListColumn* Column);
	DYNAMIC void __fastcall ColRightClick(Comctrls::TListColumn* Column, const Types::TPoint &Point);
	bool __fastcall ColumnsShowing(void);
	virtual Comctrls::TListItem* __fastcall CreateListItem(void);
	virtual Comctrls::TListItems* __fastcall CreateListItems(void);
	virtual bool __fastcall CustomDraw(const Types::TRect &ARect, Comctrls::TCustomDrawStage Stage);
	virtual bool __fastcall CustomDrawItem(Comctrls::TListItem* Item, Comctrls::TCustomDrawState State, Comctrls::TCustomDrawStage Stage);
	virtual bool __fastcall CustomDrawSubItem(Comctrls::TListItem* Item, int SubItem, Comctrls::TCustomDrawState State, Comctrls::TCustomDrawStage Stage);
	DYNAMIC void __fastcall Delete(Comctrls::TListItem* Item);
	DYNAMIC void __fastcall DoEndDrag(System::TObject* Target, int X, int Y);
	DYNAMIC void __fastcall DoStartDrag(Controls::TDragObject* &DragObject);
	virtual void __fastcall DoInfoTip(Comctrls::TListItem* Item, AnsiString &InfoTip);
	virtual void __fastcall DrawItem(Comctrls::TListItem* Item, const Types::TRect &Rect, Windows::TOwnerDrawState State);
	DYNAMIC void __fastcall Edit(const tagLVITEMA &Item);
	virtual bool __fastcall OwnerDataFetch(Comctrls::TListItem* Item, Comctrls::TItemRequest Request);
	virtual int __fastcall OwnerDataFind(Comctrls::TItemFind Find, const AnsiString FindString, const Types::TPoint &FindPosition, void * FindData, int StartIndex, Comctrls::TSearchDirection Direction, bool Wrap);
	virtual bool __fastcall OwnerDataHint(int StartIndex, int EndIndex);
	virtual bool __fastcall OwnerDataStateChange(int StartIndex, int EndIndex, Comctrls::TItemStates OldState, Comctrls::TItemStates NewState);
	DYNAMIC TMetaClass* __fastcall GetActionLinkClass(void);
	virtual int __fastcall GetCount(void);
	virtual Controls::TDragImageList* __fastcall GetDragImages(void);
	int __fastcall GetItemIndex(void)/* overload */;
	int __fastcall GetListViewItemIndex(void);
	virtual int __fastcall GetSelCount(void);
	virtual void __fastcall SetItemIndex(const int Value);
	int __fastcall GetItemIndex(Comctrls::TListItem* Value)/* overload */;
	DYNAMIC void __fastcall InsertItem(Comctrls::TListItem* Item);
	virtual bool __fastcall IsCustomDrawn(Comctrls::TCustomDrawTarget Target, Comctrls::TCustomDrawStage Stage);
	virtual void __fastcall SetViewStyle(Comctrls::TViewStyle Value);
	void __fastcall UpdateColumn(int AnIndex);
	void __fastcall UpdateColumns(void);
	__property Comctrls::TListColumns* Columns = {read=GetListColumns, write=SetListColumns};
	__property bool ColumnClick = {read=GetColumnClick, write=SetColumnClick, default=1};
	__property bool HideSelection = {read=GetHideSelection, write=SetHideSelection, default=1};
	__property TcxIconOptions* IconOptions = {read=GetIconOptions, write=SetIconOptions};
	__property Comctrls::TListItems* Items = {read=GetListItems, write=SetListItems};
	__property int AllocBy = {read=GetAllocBy, write=SetAllocBy, default=0};
	__property int HoverTime = {read=GetHoverTime, write=SetHoverTime, default=-1};
	__property Cxgraphics::TcxCanvas* ListViewCanvas = {read=GetListViewCanvas};
	__property Imglist::TCustomImageList* LargeImages = {read=GetLargeImages, write=SetLargeImages};
	__property bool MultiSelect = {read=GetMultiSelect, write=SetMultiSelect, default=0};
	__property bool ReadOnly = {read=GetReadOnly, write=SetReadOnly, default=0};
	__property bool OwnerData = {read=GetOwnerData, write=SetOwnerData, default=0};
	__property bool OwnerDraw = {read=GetOwnerDraw, write=SetOwnerDraw, default=0};
	__property bool RowSelect = {read=GetRowSelect, write=SetRowSelect, default=0};
	__property bool ShowColumnHeaders = {read=GetShowColumnHeaders, write=SetShowColumnHeaders, default=1};
	__property bool ShowWorkAreas = {read=GetShowWorkAreas, write=SetShowWorkAreas, default=0};
	__property Imglist::TCustomImageList* SmallImages = {read=GetSmallImages, write=SetSmallImages};
	__property Comctrls::TSortType SortType = {read=GetSortType, write=SetSortType, default=0};
	__property Imglist::TCustomImageList* StateImages = {read=GetStateImages, write=SetStateImages};
	__property Comctrls::TViewStyle ViewStyle = {read=GetViewStyle, write=SetViewStyle, default=0};
	__property Comctrls::TLVAdvancedCustomDrawEvent OnAdvancedCustomDraw = {read=GetOnAdvancedCustomDraw, write=SetOnAdvancedCustomDraw};
	__property Comctrls::TLVAdvancedCustomDrawItemEvent OnAdvancedCustomDrawItem = {read=GetOnAdvancedCustomDrawItem, write=SetOnAdvancedCustomDrawItem};
	__property Comctrls::TLVAdvancedCustomDrawSubItemEvent OnAdvancedCustomDrawSubItem = {read=GetOnAdvancedCustomDrawSubItem, write=SetOnAdvancedCustomDrawSubItem};
	__property Classes::TNotifyEvent OnCancelEdit = {read=FOnCancelEdit, write=FOnCancelEdit};
	__property Comctrls::TLVChangeEvent OnChange = {read=GetOnChange, write=SetOnChange};
	__property Comctrls::TLVChangingEvent OnChanging = {read=GetOnChanging, write=SetOnChanging};
	__property Comctrls::TLVColumnClickEvent OnColumnClick = {read=GetOnColumnClick, write=SetOnColumnClick};
	__property Classes::TNotifyEvent OnColumnDragged = {read=GetOnColumnDragged, write=SetOnColumnDragged};
	__property Comctrls::TLVColumnRClickEvent OnColumnRightClick = {read=GetOnColumnRightClick, write=SetOnColumnRightClick};
	__property Comctrls::TLVCompareEvent OnCompare = {read=GetOnCompare, write=SetOnCompare};
	__property Comctrls::TLVCustomDrawEvent OnCustomDraw = {read=GetOnCustomDraw, write=SetOnCustomDraw};
	__property Comctrls::TLVCustomDrawItemEvent OnCustomDrawItem = {read=GetOnCustomDrawItem, write=SetOnCustomDrawItem};
	__property Comctrls::TLVCustomDrawSubItemEvent OnCustomDrawSubItem = {read=GetOnCustomDrawSubItem, write=SetOnCustomDrawSubItem};
	__property Comctrls::TLVOwnerDataEvent OnData = {read=GetOnData, write=SetOnData};
	__property Comctrls::TLVOwnerDataFindEvent OnDataFind = {read=GetOnDataFind, write=SetOnDataFind};
	__property Comctrls::TLVOwnerDataHintEvent OnDataHint = {read=GetOnDataHint, write=SetOnDataHint};
	__property Comctrls::TLVOwnerDataStateChangeEvent OnDataStateChange = {read=GetOnDataStateChange, write=SetOnDataStateChange};
	__property Comctrls::TLVDeletedEvent OnDeletion = {read=GetOnDeletion, write=SetOnDeletion};
	__property Comctrls::TLVDrawItemEvent OnDrawItem = {read=GetOnDrawItem, write=SetOnDrawItem};
	__property Comctrls::TLVEditedEvent OnEdited = {read=GetOnEdited, write=SetOnEdited};
	__property Comctrls::TLVEditingEvent OnEditing = {read=GetOnEditing, write=SetOnEditing};
	__property Comctrls::TLVInfoTipEvent OnInfoTip = {read=GetOnInfoTip, write=SetOnInfoTip};
	__property Comctrls::TLVDeletedEvent OnInsert = {read=GetOnInsert, write=SetOnInsert};
	__property Comctrls::TLVNotifyEvent OnGetImageIndex = {read=GetOnGetImageIndex, write=SetOnGetImageIndex};
	__property Comctrls::TLVSubItemImageEvent OnGetSubItemImage = {read=GetOnGetSubItemImage, write=SetOnGetSubItemImage};
	__property Comctrls::TLVSelectItemEvent OnSelectItem = {read=GetOnSelectItem, write=SetOnSelectItem};
	__property Comctrls::TLVCreateItemClassEvent OnCreateItemClass = {read=GetOnCreateItemClass, write=SetOnCreateItemClass};
	
public:
	__fastcall virtual TcxCustomListView(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxCustomListView(void);
	virtual void __fastcall Loaded(void);
	__property TcxCustomInnerListView* InnerListView = {read=GetInnerListView, write=SetInnerListView};
	bool __fastcall AlphaSort(void);
	void __fastcall Arrange(Comctrls::TListArrangement Code);
	void __fastcall Clear(void);
	void __fastcall ClearSelection(void);
	void __fastcall AddItem(AnsiString Item, System::TObject* AObject);
	void __fastcall CopySelection(Controls::TCustomListControl* Destination);
	void __fastcall DeleteSelected(void);
	void __fastcall SelectAll(void);
	Comctrls::TListItem* __fastcall FindCaption(int StartIndex, AnsiString Value, bool Partial, bool Inclusive, bool Wrap);
	Comctrls::TListItem* __fastcall FindData(int StartIndex, void * Value, bool Inclusive, bool Wrap);
	Comctrls::THitTests __fastcall GetHitTestInfoAt(int X, int Y);
	Comctrls::TListItem* __fastcall GetItemAt(int X, int Y);
	Comctrls::TListItem* __fastcall GetNearestItem(const Types::TPoint &Point, Comctrls::TSearchDirection Direction);
	Comctrls::TListItem* __fastcall GetNextItem(Comctrls::TListItem* StartItem, Comctrls::TSearchDirection Direction, Comctrls::TItemStates States);
	AnsiString __fastcall GetSearchString();
	bool __fastcall IsEditing(void);
	bool __fastcall CustomSort(PFNLVCOMPARE SortProc, int lParam);
	int __fastcall StringWidth(AnsiString S);
	void __fastcall UpdateItems(int FirstIndex, int LastIndex);
	__property bool Checkboxes = {read=GetCheckBoxes, write=SetCheckboxes, default=0};
	__property Comctrls::TListColumn* Column[int Index] = {read=GetColumnFromIndex};
	__property Comctrls::TListItem* DropTarget = {read=GetDropTarget, write=SetDropTarget};
	__property bool FullDrag = {read=GetFullDrag, write=SetFullDrag, default=0};
	__property bool GridLines = {read=GetGridLines, write=SetGridLines, default=0};
	__property bool HotTrack = {read=GetHotTrack, write=SetHotTrack, default=0};
	__property Comctrls::TListHotTrackStyles HotTrackStyles = {read=GetHotTrackStyles, write=SetHotTrackStyles, default=0};
	__property Comctrls::TListItem* ItemFocused = {read=GetItemFocused, write=SetItemFocused};
	__property int ItemIndex = {read=GetListViewItemIndex, write=SetItemIndex, nodefault};
	__property int SelCount = {read=GetSelCount, nodefault};
	__property Comctrls::TListItem* Selected = {read=GetSelected, write=SetSelected};
	__property Comctrls::TListItem* TopItem = {read=GetTopItem};
	__property Types::TPoint ViewOrigin = {read=GetViewOrigin};
	__property int VisibleRowCount = {read=GetVisibleRowCount, nodefault};
	__property Types::TRect BoundingRect = {read=GetBoundingRect};
	__property Comctrls::TWorkAreas* WorkAreas = {read=GetWorkAreas};
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomListView(HWND ParentWindow) : Cxcontainer::TcxContainer(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxListView;
class PASCALIMPLEMENTATION TcxListView : public TcxCustomListView 
{
	typedef TcxCustomListView inherited;
	
public:
	__property ListViewCanvas ;
	
__published:
	__property Checkboxes  = {default=0};
	__property Columns ;
	__property ColumnClick  = {default=1};
	__property HideSelection  = {default=1};
	__property IconOptions ;
	__property Items ;
	__property ItemIndex ;
	__property AllocBy  = {default=0};
	__property HotTrack  = {default=0};
	__property HoverTime  = {default=-1};
	__property LargeImages ;
	__property MultiSelect  = {default=0};
	__property OwnerData  = {default=0};
	__property OwnerDraw  = {default=0};
	__property RowSelect  = {default=0};
	__property ReadOnly  = {default=0};
	__property ShowColumnHeaders  = {default=1};
	__property SmallImages ;
	__property SortType  = {default=0};
	__property StateImages ;
	__property ViewStyle  = {default=0};
	__property ShowWorkAreas  = {default=0};
	__property OnAdvancedCustomDraw ;
	__property OnAdvancedCustomDrawItem ;
	__property OnAdvancedCustomDrawSubItem ;
	__property OnCancelEdit ;
	__property OnChange ;
	__property OnChanging ;
	__property OnColumnClick ;
	__property OnColumnDragged ;
	__property OnColumnRightClick ;
	__property OnCompare ;
	__property OnCustomDraw ;
	__property OnCustomDrawItem ;
	__property OnCustomDrawSubItem ;
	__property OnData ;
	__property OnDataFind ;
	__property OnDataHint ;
	__property OnDataStateChange ;
	__property OnDeletion ;
	__property OnDrawItem ;
	__property OnEdited ;
	__property OnEditing ;
	__property OnInfoTip ;
	__property OnInsert ;
	__property OnGetImageIndex ;
	__property OnGetSubItemImage ;
	__property OnSelectItem ;
	__property OnCreateItemClass ;
	__property Align  = {default=0};
	__property Anchors  = {default=3};
	__property Constraints ;
	__property DragMode  = {default=0};
	__property Enabled  = {default=1};
	__property ParentColor  = {default=1};
	__property ParentFont  = {default=1};
	__property ParentShowHint  = {default=1};
	__property PopupMenu ;
	__property ShowHint ;
	__property Style ;
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=1};
	__property Visible  = {default=1};
	__property BiDiMode ;
	__property DragCursor  = {default=-12};
	__property DragKind  = {default=0};
	__property ImeMode  = {default=3};
	__property ImeName ;
	__property ParentBiDiMode  = {default=1};
	__property OnClick ;
	__property OnDblClick ;
	__property OnDragDrop ;
	__property OnDragOver ;
	__property OnEndDrag ;
	__property OnEnter ;
	__property OnExit ;
	__property OnKeyDown ;
	__property OnKeyPress ;
	__property OnKeyUp ;
	__property OnMouseDown ;
	__property OnMouseMove ;
	__property OnMouseUp ;
	__property OnStartDrag ;
	__property OnContextPopup ;
	__property OnEndDock ;
	__property OnStartDock ;
public:
	#pragma option push -w-inl
	/* TcxCustomListView.Create */ inline __fastcall virtual TcxListView(Classes::TComponent* AOwner) : TcxCustomListView(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomListView.Destroy */ inline __fastcall virtual ~TcxListView(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxListView(HWND ParentWindow) : TcxCustomListView(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxlistview */
using namespace Cxlistview;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxListView
