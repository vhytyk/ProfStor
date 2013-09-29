// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxShellListView.pas' rev: 6.00

#ifndef cxShellListViewHPP
#define cxShellListViewHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxControls.hpp>	// Pascal unit
#include <cxShellControls.hpp>	// Pascal unit
#include <cxShellCommon.hpp>	// Pascal unit
#include <cxScrollBar.hpp>	// Pascal unit
#include <cxDataUtils.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <ShlObj.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <ComCtrls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxshelllistview
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TcxShellObjectPathType { sptAbsolutePhysical, sptRelativePhysical, sptUNC, sptVirtual, sptInternalAbsoluteVirtual, sptInternalRelativeVirtual, sptIncorrect };
#pragma option pop

#pragma option push -b-
enum TcxShellViewOption { svoShowFiles, svoShowFolders, svoShowHidden };
#pragma option pop

typedef Set<TcxShellViewOption, svoShowFiles, svoShowHidden>  TcxShellViewOptions;

class DELPHICLASS TcxCustomShellListView;
typedef void __fastcall (__closure *TcxBeforeNavigationEvent)(TcxCustomShellListView* Sender, Shlobj::PItemIDList ANewAbsolutePIDL);

typedef void __fastcall (__closure *TcxCurrentFolderChangedEvent)(TcxCustomShellListView* Sender);

class DELPHICLASS TcxInnerShellListView;
class PASCALIMPLEMENTATION TcxInnerShellListView : public Cxshellcontrols::TcxCustomInnerShellListView 
{
	typedef Cxshellcontrols::TcxCustomInnerShellListView inherited;
	
private:
	Comctrls::TLVChangeEvent FOnChange;
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
	
protected:
	TcxCustomShellListView* FContainer;
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
	virtual void __fastcall ChangeHandler(System::TObject* Sender, Comctrls::TListItem* AItem, Comctrls::TItemChange AChange);
	DYNAMIC void __fastcall MouseEnter(Controls::TControl* AControl);
	DYNAMIC void __fastcall MouseLeave(Controls::TControl* AControl);
	__property TcxCustomShellListView* Container = {read=FContainer};
	__property Comctrls::TLVChangeEvent OnChange = {read=FOnChange, write=FOnChange};
	
public:
	__fastcall virtual TcxInnerShellListView(Classes::TComponent* AOwner);
	DYNAMIC void __fastcall DragDrop(System::TObject* Source, int X, int Y);
	DYNAMIC bool __fastcall ExecuteAction(Classes::TBasicAction* Action);
	DYNAMIC bool __fastcall UpdateAction(Classes::TBasicAction* Action);
	DYNAMIC bool __fastcall CanFocus(void);
	__property Align  = {default=0};
	__property Anchors  = {default=3};
	__property BorderStyle  = {default=1};
	__property Color  = {default=-2147483643};
	__property DragDropSettings ;
	__property HotTrack  = {default=0};
	__property IconOptions ;
	__property Items ;
	__property ListViewStyle ;
	__property MultiSelect  = {default=0};
	__property Options ;
	__property Root ;
	__property Visible  = {default=1};
	__property AfterNavigation ;
	__property BeforeNavigation ;
	__property OnSelectItem ;
	__property OnRootChanged ;
public:
	#pragma option push -w-inl
	/* TcxCustomInnerShellListView.Destroy */ inline __fastcall virtual ~TcxInnerShellListView(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxInnerShellListView(HWND ParentWindow) : Cxshellcontrols::TcxCustomInnerShellListView(ParentWindow) { }
	#pragma option pop
	
private:
	void *__IcxContainerInnerControl;	/* Cxcontainer::IcxContainerInnerControl */
	
public:
	operator IcxContainerInnerControl*(void) { return (IcxContainerInnerControl*)&__IcxContainerInnerControl; }
	
};


class PASCALIMPLEMENTATION TcxCustomShellListView : public Cxcontainer::TcxContainer 
{
	typedef Cxcontainer::TcxContainer inherited;
	
private:
	TcxInnerShellListView* FInnerListView;
	bool FIsExitProcessing;
	bool FScrollBarsCalculating;
	TcxBeforeNavigationEvent FOnBeforeNavigation;
	Comctrls::TLVChangeEvent FOnChange;
	TcxCurrentFolderChangedEvent FOnCurrentFolderChanged;
	Comctrls::TLVSelectItemEvent FOnSelectItem;
	void __fastcall BeforeNavigationHandler(Cxshellcontrols::TcxCustomInnerShellListView* Sender, Shlobj::PItemIDList APItemIDList, WideString AFolderPath);
	void __fastcall ChangeHandler(System::TObject* Sender, Comctrls::TListItem* Item, Comctrls::TItemChange Change);
	void __fastcall SelectItemHandler(System::TObject* Sender, Comctrls::TListItem* Item, bool Selected);
	AnsiString __fastcall GetAbsolutePath();
	Shlobj::PItemIDList __fastcall GetAbsolutePIDL(void);
	Cxshellcommon::TcxDragDropSettings* __fastcall GetDragDropSettings(void);
	Comctrls::TIconOptions* __fastcall GetIconOptions(void);
	bool __fastcall GetListHotTrack(void);
	bool __fastcall GetMultiSelect(void);
	Cxshellcommon::TcxShellOptions* __fastcall GetOptions(void);
	Cxshellcontrols::TcxShellListRoot* __fastcall GetRoot(void);
	Comctrls::TViewStyle __fastcall GetViewStyle(void);
	void __fastcall SetAbsolutePath(AnsiString Value);
	void __fastcall SetAbsolutePIDL(Shlobj::PItemIDList Value);
	void __fastcall SetDragDropSettings(Cxshellcommon::TcxDragDropSettings* Value);
	void __fastcall SetIconOptions(Comctrls::TIconOptions* Value);
	void __fastcall SetListHotTrack(bool Value);
	void __fastcall SetMultiSelect(bool Value);
	void __fastcall SetOptions(Cxshellcommon::TcxShellOptions* Value);
	void __fastcall SetRoot(Cxshellcontrols::TcxShellListRoot* Value);
	void __fastcall SetViewStyle(Comctrls::TViewStyle Value);
	
protected:
	Cxdatautils::TcxCustomDataBinding* FDataBinding;
	DYNAMIC void __fastcall DoExit(void);
	virtual void __fastcall Loaded(void);
	virtual bool __fastcall NeedsScrollBars(void);
	virtual void __fastcall Scroll(Forms::TScrollBarKind AScrollBarKind, Stdctrls::TScrollCode AScrollCode, int &AScrollPos);
	virtual void __fastcall CurrentFolderChangedHandler(System::TObject* Sender, Cxshellcommon::TcxCustomShellRoot* Root);
	virtual TMetaClass* __fastcall GetDataBindingClass(void);
	TcxShellViewOptions __fastcall GetViewOptions(bool AForNavigation = false);
	virtual void __fastcall SetScrollBarsParameters(void);
	__property Cxdatautils::TcxCustomDataBinding* DataBinding = {read=FDataBinding};
	__property Cxshellcommon::TcxDragDropSettings* DragDropSettings = {read=GetDragDropSettings, write=SetDragDropSettings};
	__property Comctrls::TIconOptions* IconOptions = {read=GetIconOptions, write=SetIconOptions};
	__property bool ListHotTrack = {read=GetListHotTrack, write=SetListHotTrack, default=0};
	__property bool MultiSelect = {read=GetMultiSelect, write=SetMultiSelect, default=0};
	__property Cxshellcommon::TcxShellOptions* Options = {read=GetOptions, write=SetOptions};
	__property Cxshellcontrols::TcxShellListRoot* Root = {read=GetRoot, write=SetRoot};
	__property Comctrls::TViewStyle ViewStyle = {read=GetViewStyle, write=SetViewStyle, default=0};
	__property TcxBeforeNavigationEvent OnBeforeNavigation = {read=FOnBeforeNavigation, write=FOnBeforeNavigation};
	__property Comctrls::TLVChangeEvent OnChange = {read=FOnChange, write=FOnChange};
	__property TcxCurrentFolderChangedEvent OnCurrentFolderChanged = {read=FOnCurrentFolderChanged, write=FOnCurrentFolderChanged};
	__property Comctrls::TLVSelectItemEvent OnSelectItem = {read=FOnSelectItem, write=FOnSelectItem};
	
public:
	__fastcall virtual TcxCustomShellListView(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxCustomShellListView(void);
	DYNAMIC bool __fastcall ExecuteAction(Classes::TBasicAction* Action);
	DYNAMIC bool __fastcall UpdateAction(Classes::TBasicAction* Action);
	void __fastcall BrowseParent(void);
	Shlobj::PItemIDList __fastcall GetItemAbsolutePIDL(int AIndex);
	void __fastcall ProcessTreeViewNavigate(Shlobj::PItemIDList apidl);
	void __fastcall SetTreeView(Controls::TWinControl* ATreeView);
	virtual void __fastcall SetFocus(void);
	__property TcxInnerShellListView* InnerListView = {read=FInnerListView};
	__property AnsiString AbsolutePath = {read=GetAbsolutePath, write=SetAbsolutePath};
	__property Shlobj::PItemIDList AbsolutePIDL = {read=GetAbsolutePIDL, write=SetAbsolutePIDL};
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomShellListView(HWND ParentWindow) : Cxcontainer::TcxContainer(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxShellListView;
class PASCALIMPLEMENTATION TcxShellListView : public TcxCustomShellListView 
{
	typedef TcxCustomShellListView inherited;
	
__published:
	__property Align  = {default=0};
	__property Anchors  = {default=3};
	__property Constraints ;
	__property DragDropSettings ;
	__property Enabled  = {default=1};
	__property IconOptions ;
	__property ListHotTrack  = {default=0};
	__property MultiSelect  = {default=0};
	__property Options ;
	__property ParentColor  = {default=1};
	__property ParentFont  = {default=1};
	__property ParentShowHint  = {default=1};
	__property PopupMenu ;
	__property Root ;
	__property ShowHint ;
	__property Style ;
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=1};
	__property ViewStyle  = {default=0};
	__property Visible  = {default=1};
	__property OnBeforeNavigation ;
	__property OnChange ;
	__property OnClick ;
	__property OnCurrentFolderChanged ;
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
	__property OnSelectItem ;
	__property OnStartDock ;
	__property OnStartDrag ;
	__property OnContextPopup ;
public:
	#pragma option push -w-inl
	/* TcxCustomShellListView.Create */ inline __fastcall virtual TcxShellListView(Classes::TComponent* AOwner) : TcxCustomShellListView(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomShellListView.Destroy */ inline __fastcall virtual ~TcxShellListView(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxShellListView(HWND ParentWindow) : TcxCustomShellListView(ParentWindow) { }
	#pragma option pop
	
};


#pragma pack(push, 4)
struct TcxShellSpecialFolderInfoTableItem
{
	unsigned Attributes;
	_ITEMIDLIST *PIDL;
	AnsiString PIDLDisplayName;
	AnsiString PIDLName;
	AnsiString PIDLUpperCaseDisplayName;
} ;
#pragma pack(pop)

typedef TcxShellSpecialFolderInfoTableItem cxShellListView__4[35];

//-- var, const, procedure ---------------------------------------------------
#define cxShellObjectInternalAbsoluteVirtualPathPrefix "::{9C211B58-E6F1-456A-9F22-7B3B418A7BB1}"
#define cxShellObjectInternalRelativeVirtualPathPrefix "::{63BE9ADB-E4B5-4623-96AA-57440B4EF5A8}"
static const Shortint cxShellObjectInternalVirtualPathPrefixLength = 0x28;
static const Shortint cxShellSpecialFolderInfoTableLength = 0x23;
extern PACKAGE TcxShellSpecialFolderInfoTableItem cxShellSpecialFolderInfoTable[35];
extern PACKAGE bool __fastcall CheckAbsolutePIDL(Shlobj::PItemIDList &APIDL, Cxshellcommon::TcxCustomShellRoot* ARoot, bool ACheckObjectExistence, bool ACheckIsSubPath = true);
extern PACKAGE bool __fastcall CheckShellObjectExistence(Shlobj::PItemIDList APIDL);
extern PACKAGE TcxShellObjectPathType __fastcall CheckShellObjectPath(AnsiString &APath, AnsiString ACurrentPath, bool AIsDisplayText);
extern PACKAGE void __fastcall CheckShellRoot(Cxshellcommon::TcxCustomShellRoot* ARoot);
extern PACKAGE bool __fastcall CheckViewOptions(TcxShellViewOptions AViewOptions, unsigned AShellObjectAttributes);
extern PACKAGE _di_IShellFolder __fastcall GetDesktopIShellFolder();
extern PACKAGE AnsiString __fastcall GetPIDLDisplayName(Shlobj::PItemIDList APIDL, bool AShowFullPath = false);
extern PACKAGE Types::TRect __fastcall GetSizeGripRect(Cxcontainer::_di_IcxContainerInnerControl AControl);
extern PACKAGE Shlobj::PItemIDList __fastcall InternalParseDisplayName(_di_IShellFolder AParentIFolder, AnsiString ADisplayName, TcxShellViewOptions AViewOptions);
extern PACKAGE bool __fastcall IsSubPath(Shlobj::PItemIDList APIDL1, Shlobj::PItemIDList APIDL2);
extern PACKAGE Shlobj::PItemIDList __fastcall PathToAbsolutePIDL(AnsiString APath, Cxshellcommon::TcxCustomShellRoot* ARoot, TcxShellViewOptions AViewOptions, bool ACheckIsSubPath = true);
extern PACKAGE Shlobj::PItemIDList __fastcall ShellObjectInternalVirtualPathToPIDL(AnsiString APath, Cxshellcommon::TcxCustomShellRoot* ARoot, TcxShellViewOptions AViewOptions);

}	/* namespace Cxshelllistview */
using namespace Cxshelllistview;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxShellListView
