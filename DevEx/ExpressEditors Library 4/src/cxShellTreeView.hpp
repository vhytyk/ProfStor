// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxShellTreeView.pas' rev: 6.00

#ifndef cxShellTreeViewHPP
#define cxShellTreeViewHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxControls.hpp>	// Pascal unit
#include <cxShellControls.hpp>	// Pascal unit
#include <cxShellCommon.hpp>	// Pascal unit
#include <cxShellListView.hpp>	// Pascal unit
#include <cxDataUtils.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <ShlObj.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <ImgList.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <CommCtrl.hpp>	// Pascal unit
#include <ComCtrls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxshelltreeview
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxInnerShellTreeView;
class DELPHICLASS TcxCustomShellTreeView;
class PASCALIMPLEMENTATION TcxCustomShellTreeView : public Cxcontainer::TcxContainer 
{
	typedef Cxcontainer::TcxContainer inherited;
	
private:
	TcxInnerShellTreeView* FInnerTreeView;
	bool FIsExitProcessing;
	bool FScrollBarsCalculating;
	Comctrls::TTVChangedEvent FOnChange;
	Comctrls::TTVChangingEvent FOnChanging;
	Comctrls::TTVExpandedEvent FOnCollapsed;
	Comctrls::TTVCollapsingEvent FOnCollapsing;
	Comctrls::TTVEditedEvent FOnEdited;
	Comctrls::TTVEditingEvent FOnEditing;
	Comctrls::TTVExpandedEvent FOnExpanded;
	Comctrls::TTVExpandingEvent FOnExpanding;
	void __fastcall ChangeHandler(System::TObject* Sender, Comctrls::TTreeNode* Node);
	void __fastcall ChangingHandler(System::TObject* Sender, Comctrls::TTreeNode* Node, bool &AllowChange);
	void __fastcall CollapsedHandler(System::TObject* Sender, Comctrls::TTreeNode* Node);
	void __fastcall CollapsingHandler(System::TObject* Sender, Comctrls::TTreeNode* Node, bool &AllowCollapse);
	void __fastcall EditedHandler(System::TObject* Sender, Comctrls::TTreeNode* Node, AnsiString &S);
	void __fastcall EditingHandler(System::TObject* Sender, Comctrls::TTreeNode* Node, bool &AllowEdit);
	void __fastcall ExpandedHandler(System::TObject* Sender, Comctrls::TTreeNode* Node);
	void __fastcall ExpandingHandler(System::TObject* Sender, Comctrls::TTreeNode* Node, bool &AllowExpansion);
	AnsiString __fastcall GetAbsolutePath();
	Shlobj::PItemIDList __fastcall GetAbsolutePIDL(void);
	bool __fastcall GetAutoExpand(void);
	int __fastcall GetChangeDelay(void);
	Cxshellcommon::TcxDragDropSettings* __fastcall GetDragDropSettings(void);
	bool __fastcall GetHideSelection(void);
	int __fastcall GetIndent(void);
	bool __fastcall GetShowInfoTips(void);
	Cxshellcommon::TcxShellOptions* __fastcall GetOptions(void);
	bool __fastcall GetRightClickSelect(void);
	Cxshellcontrols::TcxShellTreeRoot* __fastcall GetRoot(void);
	Cxshelllistview::TcxCustomShellListView* __fastcall GetShellListView(void);
	bool __fastcall GetShowButtons(void);
	bool __fastcall GetShowLines(void);
	bool __fastcall GetShowRoot(void);
	Imglist::TCustomImageList* __fastcall GetStateImages(void);
	bool __fastcall GetTreeHotTrack(void);
	void __fastcall SetAbsolutePath(AnsiString Value);
	void __fastcall SetAbsolutePIDL(Shlobj::PItemIDList Value);
	void __fastcall SetAutoExpand(bool Value);
	void __fastcall SetChangeDelay(int Value);
	void __fastcall SetDragDropSettings(Cxshellcommon::TcxDragDropSettings* Value);
	void __fastcall SetHideSelection(bool Value);
	void __fastcall SetIndent(int Value);
	void __fastcall SetShowInfoTips(bool Value);
	void __fastcall SetOptions(Cxshellcommon::TcxShellOptions* Value);
	void __fastcall SetRightClickSelect(bool Value);
	void __fastcall SetRoot(Cxshellcontrols::TcxShellTreeRoot* Value);
	void __fastcall SetShellListView(Cxshelllistview::TcxCustomShellListView* Value);
	void __fastcall SetShowButtons(bool Value);
	void __fastcall SetShowLines(bool Value);
	void __fastcall SetShowRoot(bool Value);
	void __fastcall SetStateImages(Imglist::TCustomImageList* Value);
	void __fastcall SetTreeHotTrack(bool Value);
	
protected:
	Cxdatautils::TcxCustomDataBinding* FDataBinding;
	DYNAMIC void __fastcall DoExit(void);
	virtual void __fastcall Loaded(void);
	virtual bool __fastcall NeedsScrollBars(void);
	virtual void __fastcall Scroll(Forms::TScrollBarKind AScrollBarKind, Stdctrls::TScrollCode AScrollCode, int &AScrollPos);
	virtual void __fastcall CurrentFolderChangedHandler(System::TObject* Sender, Cxshellcommon::TcxCustomShellRoot* Root);
	virtual TMetaClass* __fastcall GetDataBindingClass(void);
	Cxshelllistview::TcxShellViewOptions __fastcall GetViewOptions(bool AForNavigation = false);
	virtual void __fastcall SetScrollBarsParameters(void);
	__property bool AutoExpand = {read=GetAutoExpand, write=SetAutoExpand, default=0};
	__property int ChangeDelay = {read=GetChangeDelay, write=SetChangeDelay, default=0};
	__property Cxdatautils::TcxCustomDataBinding* DataBinding = {read=FDataBinding};
	__property Cxshellcommon::TcxDragDropSettings* DragDropSettings = {read=GetDragDropSettings, write=SetDragDropSettings};
	__property bool HideSelection = {read=GetHideSelection, write=SetHideSelection, default=1};
	__property int Indent = {read=GetIndent, write=SetIndent, nodefault};
	__property Cxshellcommon::TcxShellOptions* Options = {read=GetOptions, write=SetOptions};
	__property bool RightClickSelect = {read=GetRightClickSelect, write=SetRightClickSelect, default=0};
	__property Cxshellcontrols::TcxShellTreeRoot* Root = {read=GetRoot, write=SetRoot};
	__property Cxshelllistview::TcxCustomShellListView* ShellListView = {read=GetShellListView, write=SetShellListView};
	__property bool ShowButtons = {read=GetShowButtons, write=SetShowButtons, default=1};
	__property bool ShowInfoTips = {read=GetShowInfoTips, write=SetShowInfoTips, default=1};
	__property bool ShowLines = {read=GetShowLines, write=SetShowLines, default=1};
	__property bool ShowRoot = {read=GetShowRoot, write=SetShowRoot, default=1};
	__property Imglist::TCustomImageList* StateImages = {read=GetStateImages, write=SetStateImages};
	__property bool TreeHotTrack = {read=GetTreeHotTrack, write=SetTreeHotTrack, default=0};
	__property Comctrls::TTVChangedEvent OnChange = {read=FOnChange, write=FOnChange};
	__property Comctrls::TTVChangingEvent OnChanging = {read=FOnChanging, write=FOnChanging};
	__property Comctrls::TTVExpandedEvent OnCollapsed = {read=FOnCollapsed, write=FOnCollapsed};
	__property Comctrls::TTVCollapsingEvent OnCollapsing = {read=FOnCollapsing, write=FOnCollapsing};
	__property Comctrls::TTVEditedEvent OnEdited = {read=FOnEdited, write=FOnEdited};
	__property Comctrls::TTVEditingEvent OnEditing = {read=FOnEditing, write=FOnEditing};
	__property Comctrls::TTVExpandedEvent OnExpanded = {read=FOnExpanded, write=FOnExpanded};
	__property Comctrls::TTVExpandingEvent OnExpanding = {read=FOnExpanding, write=FOnExpanding};
	
public:
	__fastcall virtual TcxCustomShellTreeView(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxCustomShellTreeView(void);
	DYNAMIC bool __fastcall ExecuteAction(Classes::TBasicAction* Action);
	Shlobj::PItemIDList __fastcall GetNodeAbsolutePIDL(Comctrls::TTreeNode* ANode);
	DYNAMIC bool __fastcall UpdateAction(Classes::TBasicAction* Action);
	virtual void __fastcall SetFocus(void);
	__property AnsiString AbsolutePath = {read=GetAbsolutePath, write=SetAbsolutePath};
	__property Shlobj::PItemIDList AbsolutePIDL = {read=GetAbsolutePIDL, write=SetAbsolutePIDL};
	__property TcxInnerShellTreeView* InnerTreeView = {read=FInnerTreeView};
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomShellTreeView(HWND ParentWindow) : Cxcontainer::TcxContainer(ParentWindow) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxInnerShellTreeView : public Cxshellcontrols::TcxCustomInnerShellTreeView 
{
	typedef Cxshellcontrols::TcxCustomInnerShellTreeView inherited;
	
private:
	HIDESBASE Controls::TWinControl* __fastcall GetControl(void);
	Cxcontainer::TcxContainer* __fastcall GetControlContainer(void);
	MESSAGE void __fastcall WMGetDlgCode(Messages::TWMNoParams &Message);
	HIDESBASE MESSAGE void __fastcall WMKillFocus(Messages::TWMKillFocus &Message);
	HIDESBASE MESSAGE void __fastcall WMNCCalcSize(Messages::TWMNCCalcSize &Message);
	HIDESBASE MESSAGE void __fastcall WMNCPaint(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMSetFocus(Messages::TWMSetFocus &Message);
	HIDESBASE MESSAGE void __fastcall WMWindowPosChanged(Messages::TWMWindowPosMsg &Message);
	HIDESBASE MESSAGE void __fastcall CMMouseEnter(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMMouseLeave(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall DSMShellChangeNotify(Messages::TMessage &Message);
	MESSAGE void __fastcall TVMEnsureVisible(Messages::TMessage &Message);
	
protected:
	TcxCustomShellTreeView* FContainer;
	DYNAMIC void __fastcall Click(void);
	DYNAMIC void __fastcall DblClick(void);
	DYNAMIC bool __fastcall DoMouseWheel(Classes::TShiftState Shift, int WheelDelta, const Types::TPoint &MousePos);
	DYNAMIC void __fastcall DragOver(System::TObject* Source, int X, int Y, Controls::TDragState State, bool &Accept);
	DYNAMIC Menus::TPopupMenu* __fastcall GetPopupMenu(void);
	DYNAMIC void __fastcall KeyDown(Word &Key, Classes::TShiftState Shift);
	DYNAMIC void __fastcall KeyPress(char &Key);
	DYNAMIC void __fastcall KeyUp(Word &Key, Classes::TShiftState Shift);
	DYNAMIC void __fastcall MouseDown(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseMove(Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseUp(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall CreateWindowHandle(const Controls::TCreateParams &Params);
	virtual void __fastcall WndProc(Messages::TMessage &Message);
	DYNAMIC void __fastcall MouseEnter(Controls::TControl* AControl);
	DYNAMIC void __fastcall MouseLeave(Controls::TControl* AControl);
	__property TcxCustomShellTreeView* Container = {read=FContainer};
	
public:
	__fastcall virtual TcxInnerShellTreeView(Classes::TComponent* AOwner);
	DYNAMIC void __fastcall DragDrop(System::TObject* Source, int X, int Y);
	DYNAMIC bool __fastcall ExecuteAction(Classes::TBasicAction* Action);
	DYNAMIC bool __fastcall UpdateAction(Classes::TBasicAction* Action);
	DYNAMIC bool __fastcall CanFocus(void);
	__property Align  = {default=0};
	__property Anchors  = {default=3};
	__property AutoExpand  = {default=0};
	__property BorderStyle  = {default=1};
	__property ChangeDelay  = {default=0};
	__property Color  = {default=-2147483643};
	__property Ctl3D ;
	__property Cursor  = {default=0};
	__property DragDropSettings ;
	__property Enabled  = {default=1};
	__property Font ;
	__property HideSelection  = {default=1};
	__property HotTrack  = {default=0};
	__property Indent ;
	__property Items ;
	__property ListView ;
	__property Options ;
	__property ParentColor  = {default=1};
	__property ParentCtl3D  = {default=1};
	__property ParentFont  = {default=1};
	__property ParentShowHint  = {default=1};
	__property PopupMenu ;
	__property RightClickSelect  = {default=0};
	__property Root ;
	__property ShowButtons  = {default=1};
	__property ShowHint ;
	__property ShowLines  = {default=1};
	__property ShowRoot  = {default=1};
	__property StateImages ;
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=1};
	__property Visible  = {default=1};
	__property OnClick ;
	__property OnEnter ;
	__property OnExit ;
	__property OnMouseDown ;
	__property OnMouseMove ;
	__property OnMouseUp ;
	__property OnDblClick ;
	__property OnKeyDown ;
	__property OnKeyPress ;
	__property OnKeyUp ;
	__property OnChanging ;
	__property OnChange ;
	__property OnExpanding ;
	__property OnCollapsing ;
	__property OnCollapsed ;
	__property OnExpanded ;
	__property OnEditing ;
	__property OnEdited ;
	__property OnRootChanged ;
public:
	#pragma option push -w-inl
	/* TcxCustomInnerShellTreeView.Destroy */ inline __fastcall virtual ~TcxInnerShellTreeView(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxInnerShellTreeView(HWND ParentWindow) : Cxshellcontrols::TcxCustomInnerShellTreeView(ParentWindow) { }
	#pragma option pop
	
private:
	void *__IcxContainerInnerControl;	/* Cxcontainer::IcxContainerInnerControl */
	
public:
	operator IcxContainerInnerControl*(void) { return (IcxContainerInnerControl*)&__IcxContainerInnerControl; }
	
};


class DELPHICLASS TcxShellTreeView;
class PASCALIMPLEMENTATION TcxShellTreeView : public TcxCustomShellTreeView 
{
	typedef TcxCustomShellTreeView inherited;
	
__published:
	__property Align  = {default=0};
	__property Anchors  = {default=3};
	__property AutoExpand  = {default=0};
	__property ChangeDelay  = {default=0};
	__property Constraints ;
	__property DragDropSettings ;
	__property Enabled  = {default=1};
	__property HideSelection  = {default=1};
	__property Indent ;
	__property Options ;
	__property ParentColor  = {default=1};
	__property ParentFont  = {default=1};
	__property ParentShowHint  = {default=1};
	__property PopupMenu ;
	__property RightClickSelect  = {default=0};
	__property Root ;
	__property ShellListView ;
	__property ShowButtons  = {default=1};
	__property ShowHint ;
	__property ShowInfoTips  = {default=1};
	__property ShowLines  = {default=1};
	__property ShowRoot  = {default=1};
	__property StateImages ;
	__property Style ;
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=1};
	__property TreeHotTrack  = {default=0};
	__property Visible  = {default=1};
	__property OnChange ;
	__property OnChanging ;
	__property OnClick ;
	__property OnCollapsed ;
	__property OnCollapsing ;
	__property OnDblClick ;
	__property OnEdited ;
	__property OnEditing ;
	__property OnEnter ;
	__property OnExit ;
	__property OnExpanded ;
	__property OnExpanding ;
	__property OnKeyDown ;
	__property OnKeyPress ;
	__property OnKeyUp ;
	__property OnMouseDown ;
	__property OnMouseMove ;
	__property OnMouseUp ;
public:
	#pragma option push -w-inl
	/* TcxCustomShellTreeView.Create */ inline __fastcall virtual TcxShellTreeView(Classes::TComponent* AOwner) : TcxCustomShellTreeView(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomShellTreeView.Destroy */ inline __fastcall virtual ~TcxShellTreeView(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxShellTreeView(HWND ParentWindow) : TcxCustomShellTreeView(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxshelltreeview */
using namespace Cxshelltreeview;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxShellTreeView
