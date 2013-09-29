// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxTreeView.pas' rev: 6.00

#ifndef cxTreeViewHPP
#define cxTreeViewHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxScrollBar.hpp>	// Pascal unit
#include <cxLookAndFeels.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <cxExtEditConsts.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <ImgList.hpp>	// Pascal unit
#include <ComCtrls.hpp>	// Pascal unit
#include <CommCtrl.hpp>	// Pascal unit
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

namespace Cxtreeview
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxCustomInnerTreeView;
class PASCALIMPLEMENTATION TcxCustomInnerTreeView : public Comctrls::TTreeView 
{
	typedef Comctrls::TTreeView inherited;
	
private:
	Cxgraphics::TcxCanvas* FCanvas;
	Cxcontainer::TcxContainer* FContainer;
	Cxscrollbar::TcxScrollBar* FHScrollBar;
	Cxlookandfeels::TcxLookAndFeel* FLookAndFeel;
	bool FScrollBarsCalculating;
	int FScrollBarsLockCount;
	Cxscrollbar::TcxScrollBar* FVScrollBar;
	bool FIsHScrollBarParented;
	bool FIsVScrollBarParented;
	void __fastcall StyleChanged(void);
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
	HIDESBASE MESSAGE void __fastcall CNNotify(Messages::TWMNotify &Message);
	HIDESBASE MESSAGE void __fastcall WMFontChange(Messages::TMessage &Message);
	
protected:
	DYNAMIC void __fastcall Click(void);
	DYNAMIC void __fastcall DblClick(void);
	DYNAMIC bool __fastcall DoMouseWheel(Classes::TShiftState Shift, int WheelDelta, const Types::TPoint &MousePos);
	DYNAMIC Menus::TPopupMenu* __fastcall GetPopupMenu(void);
	DYNAMIC void __fastcall KeyDown(Word &Key, Classes::TShiftState Shift);
	DYNAMIC void __fastcall KeyPress(char &Key);
	DYNAMIC void __fastcall KeyUp(Word &Key, Classes::TShiftState Shift);
	DYNAMIC void __fastcall MouseDown(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseMove(Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseUp(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	virtual void __fastcall WndProc(Messages::TMessage &Message);
	Types::TRect __fastcall GetSizeGripRect();
	void __fastcall LockScrollBarsUpdate(bool ALock);
	DYNAMIC void __fastcall MouseEnter(Controls::TControl* AControl);
	DYNAMIC void __fastcall MouseLeave(Controls::TControl* AControl);
	void __fastcall SetScrollBarsParameters(void);
	__property Cxcontainer::TcxContainer* Container = {read=FContainer};
	__property Cxlookandfeels::TcxLookAndFeel* LookAndFeel = {read=FLookAndFeel, write=SetLookAndFeel};
	DYNAMIC void __fastcall Expand(Comctrls::TTreeNode* Node);
	DYNAMIC void __fastcall Change(Comctrls::TTreeNode* Node);
	DYNAMIC void __fastcall Collapse(Comctrls::TTreeNode* Node);
	
public:
	__fastcall virtual TcxCustomInnerTreeView(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxCustomInnerTreeView(void);
	__property Cxgraphics::TcxCanvas* Canvas = {read=FCanvas};
	__property Cxscrollbar::TcxScrollBar* HScrollBar = {read=FHScrollBar};
	__property Cxscrollbar::TcxScrollBar* VScrollBar = {read=FVScrollBar};
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomInnerTreeView(HWND ParentWindow) : Comctrls::TTreeView(ParentWindow) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxCustomInnerTreeViewClass;

class DELPHICLASS TcxCustomTreeView;
class PASCALIMPLEMENTATION TcxCustomTreeView : public Cxcontainer::TcxContainer 
{
	typedef Cxcontainer::TcxContainer inherited;
	
private:
	TcxCustomInnerTreeView* FTreeView;
	bool __fastcall GetAutoExpand(void);
	int __fastcall GetChangeDelay(void);
	bool __fastcall GetHideSelection(void);
	bool __fastcall GetHotTrack(void);
	Imglist::TCustomImageList* __fastcall GetImages(void);
	Comctrls::TTreeNodes* __fastcall GetTreeNodes(void);
	int __fastcall GetIndent(void);
	Controls::TDragMode __fastcall GetDragMode(void);
	bool __fastcall GetMultiSelect(void);
	Comctrls::TMultiSelectStyle __fastcall GetMultiSelectStyle(void);
	Comctrls::TTVCreateNodeClassEvent __fastcall GetOnCreateNodeClass();
	void __fastcall SetMultiSelectStyle(Comctrls::TMultiSelectStyle Value);
	void __fastcall SetOnCreateNodeClass(Comctrls::TTVCreateNodeClassEvent Value);
	Comctrls::TTVExpandedEvent __fastcall GetOnAddition();
	Comctrls::TTVChangedEvent __fastcall GetOnCancelEdit();
	bool __fastcall GetReadOnly(void);
	bool __fastcall GetRightClickSelect(void);
	bool __fastcall GetRowSelect(void);
	bool __fastcall GetShowButtons(void);
	bool __fastcall GetShowLines(void);
	bool __fastcall GetShowRoot(void);
	Comctrls::TSortType __fastcall GetSortType(void);
	Imglist::TCustomImageList* __fastcall GetStateImages(void);
	bool __fastcall GetToolTips(void);
	Cxgraphics::TcxCanvas* __fastcall GetTreeViewCanvas(void);
	Comctrls::TTVAdvancedCustomDrawEvent __fastcall GetOnAdvancedCustomDraw();
	Comctrls::TTVAdvancedCustomDrawItemEvent __fastcall GetOnAdvancedCustomDrawItem();
	Comctrls::TTVChangedEvent __fastcall GetOnChange();
	Comctrls::TTVChangingEvent __fastcall GetOnChanging();
	Comctrls::TTVExpandedEvent __fastcall GetOnCollapsed();
	Comctrls::TTVCollapsingEvent __fastcall GetOnCollapsing();
	Comctrls::TTVCompareEvent __fastcall GetOnCompare();
	Comctrls::TTVCustomDrawEvent __fastcall GetOnCustomDraw();
	Comctrls::TTVCustomDrawItemEvent __fastcall GetOnCustomDrawItem();
	Comctrls::TTVExpandedEvent __fastcall GetOnDeletion();
	Comctrls::TTVEditingEvent __fastcall GetOnEditing();
	Comctrls::TTVEditedEvent __fastcall GetOnEdited();
	Comctrls::TTVExpandingEvent __fastcall GetOnExpanding();
	Comctrls::TTVExpandedEvent __fastcall GetOnExpanded();
	Comctrls::TTVExpandedEvent __fastcall GetOnGetImageIndex();
	Comctrls::TTVExpandedEvent __fastcall GetOnGetSelectedIndex();
	Comctrls::TTreeNode* __fastcall GetDropTarget(void);
	Comctrls::TTreeNode* __fastcall GetSelected(void);
	Comctrls::TTreeNode* __fastcall GetTopItem(void);
	unsigned __fastcall GetSelectionCount(void);
	Comctrls::TTreeNode* __fastcall GetSelection(int Index);
	void __fastcall SetMultiSelect(bool Value);
	void __fastcall SetAutoExpand(bool Value);
	void __fastcall SetChangeDelay(int Value);
	void __fastcall SetHideSelection(bool Value);
	void __fastcall SetHotTrack(bool Value);
	void __fastcall SetImages(Imglist::TCustomImageList* Value);
	void __fastcall SetTreeNodes(Comctrls::TTreeNodes* Value);
	void __fastcall SetIndent(int Value);
	void __fastcall SetRightClickSelect(bool Value);
	void __fastcall SetReadOnly(bool Value);
	void __fastcall SetRowSelect(bool Value);
	void __fastcall SetShowButtons(bool Value);
	void __fastcall SetShowLines(bool Value);
	void __fastcall SetShowRoot(bool Value);
	void __fastcall SetSortType(Comctrls::TSortType Value);
	void __fastcall SetStateImages(Imglist::TCustomImageList* Value);
	void __fastcall SetToolTips(bool Value);
	void __fastcall SetOnAddition(Comctrls::TTVExpandedEvent Value);
	void __fastcall SetOnCancelEdit(Comctrls::TTVChangedEvent Value);
	void __fastcall SetOnAdvancedCustomDraw(Comctrls::TTVAdvancedCustomDrawEvent Value);
	void __fastcall SetOnAdvancedCustomDrawItem(Comctrls::TTVAdvancedCustomDrawItemEvent Value);
	void __fastcall SetOnChange(Comctrls::TTVChangedEvent Value);
	void __fastcall SetOnChanging(Comctrls::TTVChangingEvent Value);
	void __fastcall SetOnCollapsed(Comctrls::TTVExpandedEvent Value);
	void __fastcall SetOnCollapsing(Comctrls::TTVCollapsingEvent Value);
	void __fastcall SetOnCompare(Comctrls::TTVCompareEvent Value);
	void __fastcall SetOnCustomDraw(Comctrls::TTVCustomDrawEvent Value);
	void __fastcall SetOnCustomDrawItem(Comctrls::TTVCustomDrawItemEvent Value);
	void __fastcall SetOnDeletion(Comctrls::TTVExpandedEvent Value);
	void __fastcall SetOnEditing(Comctrls::TTVEditingEvent Value);
	void __fastcall SetOnEdited(Comctrls::TTVEditedEvent Value);
	void __fastcall SetOnExpanding(Comctrls::TTVExpandingEvent Value);
	void __fastcall SetOnExpanded(Comctrls::TTVExpandedEvent Value);
	void __fastcall SetOnGetImageIndex(Comctrls::TTVExpandedEvent Value);
	void __fastcall SetOnGetSelectedIndex(Comctrls::TTVExpandedEvent Value);
	void __fastcall SetDropTarget(Comctrls::TTreeNode* Value);
	void __fastcall SetSelected(Comctrls::TTreeNode* Value);
	void __fastcall SetTopItem(Comctrls::TTreeNode* Value);
	MESSAGE void __fastcall CNNotify(Messages::TWMNotify &Message);
	
protected:
	virtual void __fastcall ContainerStyleChanged(System::TObject* Sender);
	virtual void __fastcall AdjustInnerControl(void);
	/* virtual class method */ virtual TMetaClass* __fastcall GetStyleClass(TMetaClass* vmt);
	virtual bool __fastcall CanResize(int &NewWidth, int &NewHeight);
	DYNAMIC void __fastcall FontChanged(void);
	virtual bool __fastcall IsInternalControl(Controls::TControl* AControl);
	virtual void __fastcall SetSize(void);
	virtual void __fastcall WndProc(Messages::TMessage &Message);
	virtual TcxCustomInnerTreeView* __fastcall GetInnerTreeView(void);
	virtual void __fastcall SetInnerTreeView(const TcxCustomInnerTreeView* Value);
	/* virtual class method */ virtual TMetaClass* __fastcall GetTreeViewClass(TMetaClass* vmt);
	virtual void __fastcall InternalInitTreeView(void);
	DYNAMIC bool __fastcall CanEdit(Comctrls::TTreeNode* Node);
	DYNAMIC bool __fastcall CanChange(Comctrls::TTreeNode* Node);
	DYNAMIC bool __fastcall CanCollapse(Comctrls::TTreeNode* Node);
	DYNAMIC bool __fastcall CanExpand(Comctrls::TTreeNode* Node);
	DYNAMIC void __fastcall Change(Comctrls::TTreeNode* Node);
	DYNAMIC void __fastcall Collapse(Comctrls::TTreeNode* Node);
	virtual Comctrls::TTreeNode* __fastcall CreateNode(void);
	virtual Comctrls::TTreeNodes* __fastcall CreateNodes(void);
	virtual bool __fastcall CustomDraw(const Types::TRect &ARect, Comctrls::TCustomDrawStage Stage);
	virtual bool __fastcall CustomDrawItem(Comctrls::TTreeNode* Node, Comctrls::TCustomDrawState State, Comctrls::TCustomDrawStage Stage, bool &PaintImages);
	DYNAMIC void __fastcall Delete(Comctrls::TTreeNode* Node);
	DYNAMIC void __fastcall Added(Comctrls::TTreeNode* Node);
	DYNAMIC void __fastcall DoEndDrag(System::TObject* Target, int X, int Y);
	DYNAMIC void __fastcall DoStartDrag(Controls::TDragObject* &DragObject);
	DYNAMIC void __fastcall Edit(const tagTVITEMA &Item);
	DYNAMIC void __fastcall Expand(Comctrls::TTreeNode* Node);
	virtual Controls::TDragImageList* __fastcall GetDragImages(void);
	virtual void __fastcall GetImageIndex(Comctrls::TTreeNode* Node);
	virtual void __fastcall GetSelectedIndex(Comctrls::TTreeNode* Node);
	virtual bool __fastcall IsCustomDrawn(Comctrls::TCustomDrawTarget Target, Comctrls::TCustomDrawStage Stage);
	virtual void __fastcall SetDragMode(Controls::TDragMode Value);
	__property bool AutoExpand = {read=GetAutoExpand, write=SetAutoExpand, nodefault};
	__property int ChangeDelay = {read=GetChangeDelay, write=SetChangeDelay, default=0};
	__property bool HideSelection = {read=GetHideSelection, write=SetHideSelection, default=1};
	__property bool HotTrack = {read=GetHotTrack, write=SetHotTrack, nodefault};
	__property Imglist::TCustomImageList* Images = {read=GetImages, write=SetImages};
	__property Comctrls::TTreeNodes* Items = {read=GetTreeNodes, write=SetTreeNodes};
	__property int Indent = {read=GetIndent, write=SetIndent, default=19};
	__property Controls::TDragMode DragMode = {read=GetDragMode, write=SetDragMode, default=0};
	__property bool MultiSelect = {read=GetMultiSelect, write=SetMultiSelect, nodefault};
	__property Comctrls::TMultiSelectStyle MultiSelectStyle = {read=GetMultiSelectStyle, write=SetMultiSelectStyle, nodefault};
	__property bool ReadOnly = {read=GetReadOnly, write=SetReadOnly, default=0};
	__property bool RightClickSelect = {read=GetRightClickSelect, write=SetRightClickSelect, nodefault};
	__property bool RowSelect = {read=GetRowSelect, write=SetRowSelect, nodefault};
	__property bool ShowButtons = {read=GetShowButtons, write=SetShowButtons, nodefault};
	__property bool ShowLines = {read=GetShowLines, write=SetShowLines, nodefault};
	__property bool ShowRoot = {read=GetShowRoot, write=SetShowRoot, nodefault};
	__property Comctrls::TSortType SortType = {read=GetSortType, write=SetSortType, nodefault};
	__property Imglist::TCustomImageList* StateImages = {read=GetStateImages, write=SetStateImages};
	__property bool ToolTips = {read=GetToolTips, write=SetToolTips, nodefault};
	__property Comctrls::TTVExpandedEvent OnAddition = {read=GetOnAddition, write=SetOnAddition};
	__property Comctrls::TTVChangedEvent OnCancelEdit = {read=GetOnCancelEdit, write=SetOnCancelEdit};
	__property Comctrls::TTVAdvancedCustomDrawEvent OnAdvancedCustomDraw = {read=GetOnAdvancedCustomDraw, write=SetOnAdvancedCustomDraw};
	__property Comctrls::TTVAdvancedCustomDrawItemEvent OnAdvancedCustomDrawItem = {read=GetOnAdvancedCustomDrawItem, write=SetOnAdvancedCustomDrawItem};
	__property Comctrls::TTVChangedEvent OnChange = {read=GetOnChange, write=SetOnChange};
	__property Comctrls::TTVChangingEvent OnChanging = {read=GetOnChanging, write=SetOnChanging};
	__property Comctrls::TTVExpandedEvent OnCollapsed = {read=GetOnCollapsed, write=SetOnCollapsed};
	__property Comctrls::TTVCollapsingEvent OnCollapsing = {read=GetOnCollapsing, write=SetOnCollapsing};
	__property Comctrls::TTVCompareEvent OnCompare = {read=GetOnCompare, write=SetOnCompare};
	__property Comctrls::TTVCustomDrawEvent OnCustomDraw = {read=GetOnCustomDraw, write=SetOnCustomDraw};
	__property Comctrls::TTVCustomDrawItemEvent OnCustomDrawItem = {read=GetOnCustomDrawItem, write=SetOnCustomDrawItem};
	__property Comctrls::TTVExpandedEvent OnDeletion = {read=GetOnDeletion, write=SetOnDeletion};
	__property Comctrls::TTVEditingEvent OnEditing = {read=GetOnEditing, write=SetOnEditing};
	__property Comctrls::TTVEditedEvent OnEdited = {read=GetOnEdited, write=SetOnEdited};
	__property Comctrls::TTVExpandingEvent OnExpanding = {read=GetOnExpanding, write=SetOnExpanding};
	__property Comctrls::TTVExpandedEvent OnExpanded = {read=GetOnExpanded, write=SetOnExpanded};
	__property Comctrls::TTVExpandedEvent OnGetImageIndex = {read=GetOnGetImageIndex, write=SetOnGetImageIndex};
	__property Comctrls::TTVExpandedEvent OnGetSelectedIndex = {read=GetOnGetSelectedIndex, write=SetOnGetSelectedIndex};
	__property Comctrls::TTVCreateNodeClassEvent OnCreateNodeClass = {read=GetOnCreateNodeClass, write=SetOnCreateNodeClass};
	
public:
	__fastcall virtual TcxCustomTreeView(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxCustomTreeView(void);
	bool __fastcall AlphaSort(bool ARecurse = true);
	bool __fastcall CustomSort(PFNTVCOMPARE SortProc, int Data, bool ARecurse = true);
	void __fastcall FullCollapse(void);
	void __fastcall FullExpand(void);
	Comctrls::THitTests __fastcall GetHitTestInfoAt(int X, int Y);
	Comctrls::TTreeNode* __fastcall GetNodeAt(int X, int Y);
	bool __fastcall IsEditing(void);
	void __fastcall LoadFromFile(const AnsiString FileName);
	void __fastcall LoadFromStream(Classes::TStream* Stream);
	void __fastcall SaveToFile(const AnsiString FileName);
	void __fastcall SaveToStream(Classes::TStream* Stream);
	__property Comctrls::TTreeNode* DropTarget = {read=GetDropTarget, write=SetDropTarget};
	__property Comctrls::TTreeNode* Selected = {read=GetSelected, write=SetSelected};
	__property Comctrls::TTreeNode* TopItem = {read=GetTopItem, write=SetTopItem};
	__property Cxgraphics::TcxCanvas* TreeViewCanvas = {read=GetTreeViewCanvas};
	virtual void __fastcall Select(Comctrls::TTreeNode* Node, Classes::TShiftState ShiftState = System::Set<Classes__1, ssShift, ssDouble> () )/* overload */;
	virtual void __fastcall Select(const Comctrls::TTreeNode* * Nodes, const int Nodes_Size)/* overload */;
	virtual void __fastcall Select(Classes::TList* Nodes)/* overload */;
	virtual void __fastcall Deselect(Comctrls::TTreeNode* Node);
	virtual void __fastcall Subselect(Comctrls::TTreeNode* Node, bool Validate = false);
	__property unsigned SelectionCount = {read=GetSelectionCount, nodefault};
	__property Comctrls::TTreeNode* Selections[int Index] = {read=GetSelection};
	virtual void __fastcall ClearSelection(bool KeepPrimary = false);
	Comctrls::TTreeNode* __fastcall GetSelections(Classes::TList* AList);
	virtual Comctrls::TTreeNode* __fastcall FindNextToSelect(void);
	__property TcxCustomInnerTreeView* InnerTreeView = {read=GetInnerTreeView, write=SetInnerTreeView};
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomTreeView(HWND ParentWindow) : Cxcontainer::TcxContainer(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxTreeView;
class PASCALIMPLEMENTATION TcxTreeView : public TcxCustomTreeView 
{
	typedef TcxCustomTreeView inherited;
	
public:
	__property TreeViewCanvas ;
	
__published:
	__property Align  = {default=0};
	__property Anchors  = {default=3};
	__property BiDiMode ;
	__property Constraints ;
	__property DragCursor  = {default=-12};
	__property DragKind  = {default=0};
	__property DragMode  = {default=0};
	__property Enabled  = {default=1};
	__property Height  = {default=100};
	__property ParentBiDiMode  = {default=1};
	__property ParentColor  = {default=0};
	__property ParentFont  = {default=1};
	__property ParentShowHint  = {default=1};
	__property PopupMenu ;
	__property ShowHint ;
	__property Style ;
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=1};
	__property Visible  = {default=1};
	__property Width  = {default=120};
	__property OnClick ;
	__property OnDblClick ;
	__property OnDragDrop ;
	__property OnDragOver ;
	__property OnEndDock ;
	__property OnEndDrag ;
	__property OnEnter ;
	__property OnExit ;
	__property OnKeyDown ;
	__property OnKeyPress ;
	__property OnKeyUp ;
	__property OnMouseDown ;
	__property OnMouseMove ;
	__property OnMouseUp ;
	__property OnStartDock ;
	__property OnStartDrag ;
	__property OnContextPopup ;
	__property AutoExpand  = {default=0};
	__property ChangeDelay  = {default=0};
	__property HideSelection  = {default=1};
	__property HotTrack  = {default=0};
	__property Images ;
	__property Items ;
	__property Indent  = {default=19};
	__property MultiSelect  = {default=0};
	__property MultiSelectStyle ;
	__property ReadOnly  = {default=0};
	__property RightClickSelect  = {default=0};
	__property RowSelect  = {default=0};
	__property ShowButtons  = {default=1};
	__property ShowLines  = {default=1};
	__property ShowRoot  = {default=1};
	__property SortType  = {default=0};
	__property StateImages ;
	__property ToolTips  = {default=1};
	__property OnAddition ;
	__property OnCancelEdit ;
	__property OnAdvancedCustomDraw ;
	__property OnAdvancedCustomDrawItem ;
	__property OnChange ;
	__property OnChanging ;
	__property OnCollapsed ;
	__property OnCollapsing ;
	__property OnCompare ;
	__property OnCustomDraw ;
	__property OnCustomDrawItem ;
	__property OnDeletion ;
	__property OnEditing ;
	__property OnEdited ;
	__property OnExpanding ;
	__property OnExpanded ;
	__property OnGetImageIndex ;
	__property OnGetSelectedIndex ;
	__property OnCreateNodeClass ;
public:
	#pragma option push -w-inl
	/* TcxCustomTreeView.Create */ inline __fastcall virtual TcxTreeView(Classes::TComponent* AOwner) : TcxCustomTreeView(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomTreeView.Destroy */ inline __fastcall virtual ~TcxTreeView(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxTreeView(HWND ParentWindow) : TcxCustomTreeView(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxtreeview */
using namespace Cxtreeview;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxTreeView
