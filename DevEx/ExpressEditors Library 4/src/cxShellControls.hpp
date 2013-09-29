// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxShellControls.pas' rev: 6.00

#ifndef cxShellControlsHPP
#define cxShellControlsHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <ComObj.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <CommCtrl.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <cxShellCommon.hpp>	// Pascal unit
#include <ComCtrls.hpp>	// Pascal unit
#include <ActiveX.hpp>	// Pascal unit
#include <ShlObj.hpp>	// Pascal unit
#include <ShellAPI.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxshellcontrols
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TcxListViewStyle { lvsIcon, lvsSmallIcon, lvsList, lvsReport };
#pragma option pop

class DELPHICLASS TcxCustomInnerShellListView;
typedef void __fastcall (__closure *TcxNavigationEvent)(TcxCustomInnerShellListView* Sender, Shlobj::PItemIDList fqPidl, WideString FolderPath);

class DELPHICLASS TcxShellListViewProducer;
class PASCALIMPLEMENTATION TcxShellListViewProducer : public Cxshellcommon::TcxCustomItemProducer 
{
	typedef Cxshellcommon::TcxCustomItemProducer inherited;
	
protected:
	virtual unsigned __fastcall GetEnumFlags(void);
	virtual bool __fastcall AllowBackgroundProcessing(void);
	virtual bool __fastcall GetShowToolTip(void);
	
public:
	virtual void __fastcall ProcessDetails(_di_IShellFolder ShellFolder, int CharWidth);
public:
	#pragma option push -w-inl
	/* TcxCustomItemProducer.Create */ inline __fastcall virtual TcxShellListViewProducer(Controls::TWinControl* AOwner) : Cxshellcommon::TcxCustomItemProducer(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomItemProducer.Destroy */ inline __fastcall virtual ~TcxShellListViewProducer(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxShellListRoot;
class PASCALIMPLEMENTATION TcxShellListRoot : public Cxshellcommon::TcxCustomShellRoot 
{
	typedef Cxshellcommon::TcxCustomShellRoot inherited;
	
protected:
	virtual void __fastcall RootUpdated(void);
public:
	#pragma option push -w-inl
	/* TcxCustomShellRoot.Create */ inline __fastcall virtual TcxShellListRoot(Classes::TPersistent* AOwner, HWND AParentWindow) : Cxshellcommon::TcxCustomShellRoot(AOwner, AParentWindow) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomShellRoot.Destroy */ inline __fastcall virtual ~TcxShellListRoot(void) { }
	#pragma option pop
	
};


#pragma option push -b-
enum TDropTargetType { dttNone, dttOpenFolder, dttItem };
#pragma option pop

__interface IcxDropTarget;
typedef System::DelphiInterface<IcxDropTarget> _di_IcxDropTarget;
__interface INTERFACE_UUID("{F688E250-96A6-4222-AF9D-049EB6E7D05B}") IcxDropTarget  : public IDropTarget 
{
	
};

class PASCALIMPLEMENTATION TcxCustomInnerShellListView : public Comctrls::TCustomListView 
{
	typedef Comctrls::TCustomListView inherited;
	
private:
	Controls::TWinControl* FComboBoxControl;
	TcxShellListRoot* FRoot;
	Cxshellcommon::TcxDragDropSettings* FDragDropSettings;
	TcxShellListViewProducer* FItemProducer;
	Cxshellcommon::TcxShellOptions* FOptions;
	unsigned FInternalSmallImages;
	unsigned FInternalLargeImages;
	int FLastUpdateItem;
	int FFirstUpdateItem;
	TcxNavigationEvent FBeforeNavigation;
	TcxNavigationEvent FAfterNavigation;
	TcxListViewStyle FListViewStyle;
	_di_IcxDropTarget FCurrentDropTarget;
	Comctrls::TListItem* FDropTargetItem;
	_di_IDataObject FDraggedObject;
	int FChangeNotifyHandle;
	bool FNotificationLock;
	Controls::TWinControl* FTreeViewControl;
	Cxshellcommon::TcxRootChangedEvent FRootChanged;
	void __fastcall SetListViewStyle(const TcxListViewStyle Value);
	void __fastcall SetDropTargetItem(const Comctrls::TListItem* Value);
	
protected:
	virtual void __fastcall CreateWnd(void);
	virtual void __fastcall DestroyWnd(void);
	virtual bool __fastcall OwnerDataFetch(Comctrls::TListItem* Item, Comctrls::TItemRequest Request);
	DYNAMIC void __fastcall DblClick(void);
	DYNAMIC void __fastcall DoContextPopup(const Types::TPoint &MousePos, bool &Handled);
	DYNAMIC bool __fastcall CanEdit(Comctrls::TListItem* Item);
	virtual void __fastcall Loaded(void);
	DYNAMIC void __fastcall Edit(const tagLVITEMA &Item);
	DYNAMIC void __fastcall KeyDown(Word &Key, Classes::TShiftState Shift);
	void __fastcall DoProcessDefaultCommand(Cxshellcommon::TcxShellItemInfo* Item);
	void __fastcall DoProcessNavigation(Cxshellcommon::TcxShellItemInfo* Item);
	void __fastcall DoBeforeNavigation(Shlobj::PItemIDList fqPidl);
	void __fastcall DoAfterNavigation(void);
	void __fastcall CreateColumns(void);
	void __fastcall CreateDropTarget(void);
	void __fastcall CreateChangeNotification(void);
	void __fastcall RemoveColumns(void);
	void __fastcall RemoveDropTarget(void);
	void __fastcall RemoveChangeNotification(void);
	void __fastcall CheckUpdateItems(void);
	void __fastcall DoBeginDrag(void);
	void __fastcall DoNavigateTreeView(void);
	HIDESBASE void __fastcall GetDropTarget(const Types::TPoint &pt, /* out */ bool &New);
	HRESULT __fastcall TryReleaseDropTarget(void);
	HIDESBASE MESSAGE void __fastcall CNNotify(Messages::TWMNotify &Message);
	MESSAGE void __fastcall DsmSetCount(Messages::TMessage &Message);
	MESSAGE void __fastcall DsmNotifyUpdateItem(Messages::TMessage &Message);
	MESSAGE void __fastcall DsmNotifyUpdateContents(Messages::TMessage &Message);
	MESSAGE void __fastcall DsmShellChangeNotify(Messages::TMessage &Message);
	__property Controls::TWinControl* ComboBoxControl = {read=FComboBoxControl, write=FComboBoxControl};
	__property int FirstUpdateItem = {read=FFirstUpdateItem, write=FFirstUpdateItem, nodefault};
	__property int LastUpdateItem = {read=FLastUpdateItem, write=FLastUpdateItem, nodefault};
	__property TcxShellListViewProducer* ItemProducer = {read=FItemProducer};
	__property _di_IcxDropTarget CurrentDropTarget = {read=FCurrentDropTarget, write=FCurrentDropTarget};
	__property Comctrls::TListItem* DropTargetItem = {read=FDropTargetItem, write=SetDropTargetItem};
	__property _di_IDataObject DraggedObject = {read=FDraggedObject, write=FDraggedObject};
	__property int ChangeNotifyHandle = {read=FChangeNotifyHandle, write=FChangeNotifyHandle, nodefault};
	__property Controls::TWinControl* TreeViewControl = {read=FTreeViewControl, write=FTreeViewControl};
	HRESULT __stdcall DragEnter(const _di_IDataObject dataObj, int grfKeyState, const Types::TPoint pt, int &dwEffect);
	HRESULT __stdcall IDropTargetDragOver(int grfKeyState, const Types::TPoint pt, int &dwEffect);
	HRESULT __stdcall DragLeave(void);
	HRESULT __stdcall Drop(const _di_IDataObject dataObj, int grfKeyState, const Types::TPoint pt, int &dwEffect);
	
public:
	__fastcall virtual TcxCustomInnerShellListView(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxCustomInnerShellListView(void);
	void __fastcall BrowseParent(void);
	void __fastcall SetTreeView(Controls::TWinControl* ATreeView);
	void __fastcall ProcessTreeViewNavigate(Shlobj::PItemIDList apidl);
	__property TcxShellListRoot* Root = {read=FRoot, write=FRoot};
	__property Cxshellcommon::TcxDragDropSettings* DragDropSettings = {read=FDragDropSettings, write=FDragDropSettings};
	__property Cxshellcommon::TcxShellOptions* Options = {read=FOptions, write=FOptions};
	__property TcxListViewStyle ListViewStyle = {read=FListViewStyle, write=SetListViewStyle, nodefault};
	__property TcxNavigationEvent BeforeNavigation = {read=FBeforeNavigation, write=FBeforeNavigation};
	__property TcxNavigationEvent AfterNavigation = {read=FAfterNavigation, write=FAfterNavigation};
	__property Cxshellcommon::TcxRootChangedEvent OnRootChanged = {read=FRootChanged, write=FRootChanged};
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomInnerShellListView(HWND ParentWindow) : Comctrls::TCustomListView(ParentWindow) { }
	#pragma option pop
	
private:
	void *__IcxDropTarget;	/* Cxshellcontrols::IcxDropTarget [DragOver=IDropTargetDragOver] */
	
public:
	operator IcxDropTarget*(void) { return (IcxDropTarget*)&__IcxDropTarget; }
	
};


class DELPHICLASS TcxShellTreeRoot;
class PASCALIMPLEMENTATION TcxShellTreeRoot : public Cxshellcommon::TcxCustomShellRoot 
{
	typedef Cxshellcommon::TcxCustomShellRoot inherited;
	
protected:
	virtual void __fastcall RootUpdated(void);
public:
	#pragma option push -w-inl
	/* TcxCustomShellRoot.Create */ inline __fastcall virtual TcxShellTreeRoot(Classes::TPersistent* AOwner, HWND AParentWindow) : Cxshellcommon::TcxCustomShellRoot(AOwner, AParentWindow) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomShellRoot.Destroy */ inline __fastcall virtual ~TcxShellTreeRoot(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxShellTreeItemProducer;
class PASCALIMPLEMENTATION TcxShellTreeItemProducer : public Cxshellcommon::TcxCustomItemProducer 
{
	typedef Cxshellcommon::TcxCustomItemProducer inherited;
	
private:
	Comctrls::TTreeNode* FNode;
	
protected:
	virtual unsigned __fastcall GetEnumFlags(void);
	virtual bool __fastcall AllowBackgroundProcessing(void);
	virtual bool __fastcall GetShowToolTip(void);
	__property Comctrls::TTreeNode* Node = {read=FNode, write=FNode};
	virtual void __fastcall InitializeItem(Cxshellcommon::TcxShellItemInfo* Item);
	virtual void __fastcall CheckForSubitems(Cxshellcommon::TcxShellItemInfo* Item);
	
public:
	__fastcall virtual TcxShellTreeItemProducer(Controls::TWinControl* AOwner);
	__fastcall virtual ~TcxShellTreeItemProducer(void);
	virtual void __fastcall SetItemsCount(int Count);
	virtual void __fastcall NotifyUpdateItem(int Index);
	virtual void __fastcall NotifyRemoveItem(int Index);
	virtual void __fastcall NotifyAddItem(int Index);
	HIDESBASE void __fastcall ProcessItems(_di_IShellFolder Folder, Shlobj::PItemIDList apidl, Comctrls::TTreeNode* ANode, int cPreloadItems)/* overload */;
	bool __fastcall CheckUpdates(void);
};


typedef TcxShellTreeItemProducer* *PcxShellTreeItemProducer;

class DELPHICLASS TcxCustomInnerShellTreeView;
class PASCALIMPLEMENTATION TcxCustomInnerShellTreeView : public Comctrls::TCustomTreeView 
{
	typedef Comctrls::TCustomTreeView inherited;
	
private:
	Controls::TWinControl* FComboBoxControl;
	bool FNavigation;
	_di_IDataObject FDraggedObject;
	bool FShowInfoTips;
	int FChangeNotifyHandle;
	_di_IcxDropTarget FCurrentDropTarget;
	Comctrls::TTreeNode* FPrevTargetNode;
	TcxShellTreeRoot* FRoot;
	Cxshellcommon::TcxDragDropSettings* FDragDropSettings;
	Cxshellcommon::TcxShellOptions* FOptions;
	Classes::TThreadList* FItemProducersList;
	unsigned FInternalSmallImages;
	bool FNotificationLock;
	TcxCustomInnerShellListView* FListView;
	Cxshellcommon::TcxRootChangedEvent FRootChanged;
	void __fastcall SetPrevTargetNode(const Comctrls::TTreeNode* Value);
	HIDESBASE Comctrls::TTreeNode* __fastcall GetNodeFromItem(const tagTVITEMA &Item);
	void __fastcall SetListView(const TcxCustomInnerShellListView* Value);
	__property Classes::TThreadList* ItemProducersList = {read=FItemProducersList};
	__property _di_IcxDropTarget CurrentDropTarget = {read=FCurrentDropTarget, write=FCurrentDropTarget};
	__property Comctrls::TTreeNode* PrevTargetNode = {read=FPrevTargetNode, write=SetPrevTargetNode};
	__property _di_IDataObject DraggedObject = {read=FDraggedObject, write=FDraggedObject};
	__property bool Navigation = {read=FNavigation, write=FNavigation, nodefault};
	
protected:
	virtual void __fastcall CreateWnd(void);
	virtual void __fastcall DestroyWnd(void);
	DYNAMIC void __fastcall Change(Comctrls::TTreeNode* Node);
	DYNAMIC bool __fastcall CanEdit(Comctrls::TTreeNode* Node);
	DYNAMIC void __fastcall Edit(const tagTVITEMA &Item);
	DYNAMIC bool __fastcall CanExpand(Comctrls::TTreeNode* Node);
	DYNAMIC void __fastcall Delete(Comctrls::TTreeNode* Node);
	DYNAMIC void __fastcall Collapse(Comctrls::TTreeNode* Node);
	virtual void __fastcall CreateParams(Controls::TCreateParams &Params);
	virtual void __fastcall Loaded(void);
	DYNAMIC void __fastcall DoContextPopup(const Types::TPoint &MousePos, bool &Handled);
	void __fastcall CreateDropTarget(void);
	void __fastcall RemoveDropTarget(void);
	void __fastcall AddItemProducer(TcxShellTreeItemProducer* Producer);
	void __fastcall RemoveItemProducer(TcxShellTreeItemProducer* Producer);
	void __fastcall DoBeginDrag(void);
	void __fastcall DoNavigateListView(void);
	HRESULT __fastcall TryReleaseDropTarget(void);
	HIDESBASE void __fastcall GetDropTarget(/* out */ bool &New, const Types::TPoint &pt);
	MESSAGE void __fastcall DsmSetCount(Messages::TMessage &Message);
	MESSAGE void __fastcall DsmNotifyUpdateItem(Messages::TMessage &Message);
	MESSAGE void __fastcall DsmNotifyRemoveItem(Messages::TMessage &Message);
	MESSAGE void __fastcall DsmNotifyAddItem(Messages::TMessage &Message);
	MESSAGE void __fastcall DsmNotifyUpdateContents(Messages::TMessage &Message);
	MESSAGE void __fastcall DsmShellChangeNotify(Messages::TMessage &Message);
	MESSAGE void __fastcall DsmDoNavigate(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CNNotify(Messages::TWMNotify &Message);
	__property int ChangeNotifyHandle = {read=FChangeNotifyHandle, write=FChangeNotifyHandle, nodefault};
	HRESULT __stdcall DragEnter(const _di_IDataObject dataObj, int grfKeyState, const Types::TPoint pt, int &dwEffect);
	HRESULT __stdcall IDropTargetDragOver(int grfKeyState, const Types::TPoint pt, int &dwEffect);
	HRESULT __stdcall DragLeave(void);
	HRESULT __stdcall Drop(const _di_IDataObject dataObj, int grfKeyState, const Types::TPoint pt, int &dwEffect);
	__property Controls::TWinControl* ComboBoxControl = {read=FComboBoxControl, write=FComboBoxControl};
	
public:
	__fastcall virtual TcxCustomInnerShellTreeView(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxCustomInnerShellTreeView(void);
	void __fastcall UpdateNode(Comctrls::TTreeNode* ANode);
	__property TcxShellTreeRoot* Root = {read=FRoot, write=FRoot};
	__property Cxshellcommon::TcxDragDropSettings* DragDropSettings = {read=FDragDropSettings, write=FDragDropSettings};
	__property Cxshellcommon::TcxShellOptions* Options = {read=FOptions, write=FOptions};
	__property bool ShowInfoTips = {read=FShowInfoTips, write=FShowInfoTips, nodefault};
	__property TcxCustomInnerShellListView* ListView = {read=FListView, write=SetListView};
	__property Cxshellcommon::TcxRootChangedEvent OnRootChanged = {read=FRootChanged, write=FRootChanged};
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomInnerShellTreeView(HWND ParentWindow) : Comctrls::TCustomTreeView(ParentWindow) { }
	#pragma option pop
	
private:
	void *__IcxDropTarget;	/* Cxshellcontrols::IcxDropTarget [DragOver=IDropTargetDragOver] */
	
public:
	operator IcxDropTarget*(void) { return (IcxDropTarget*)&__IcxDropTarget; }
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxshellcontrols */
using namespace Cxshellcontrols;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxShellControls
