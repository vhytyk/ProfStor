// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxShellComboBox.pas' rev: 6.00

#ifndef cxShellComboBoxHPP
#define cxShellComboBoxHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Menus.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <cxMaskEdit.hpp>	// Pascal unit
#include <cxShellCommon.hpp>	// Pascal unit
#include <cxShellTreeView.hpp>	// Pascal unit
#include <cxShellListView.hpp>	// Pascal unit
#include <cxTextEdit.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxDropDownEdit.hpp>	// Pascal unit
#include <cxDataUtils.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <ShlObj.hpp>	// Pascal unit
#include <ImgList.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <ComCtrls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxshellcombobox
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TcxShellComboBoxViewOption { scvoShowFiles, scvoShowHidden };
#pragma option pop

typedef Set<TcxShellComboBoxViewOption, scvoShowFiles, scvoShowHidden>  TcxShellComboBoxViewOptions;

#pragma option push -b-
enum TcxPopupShellTreeViewOption { tvoContextMenus, tvoHotTrack, tvoShowButtons, tvoShowLines, tvoShowRoot, tvoRightClickSelect };
#pragma option pop

typedef Set<TcxPopupShellTreeViewOption, tvoContextMenus, tvoRightClickSelect>  TcxPopupShellTreeViewOptions;

class DELPHICLASS TcxShellComboBoxViewInfo;
class PASCALIMPLEMENTATION TcxShellComboBoxViewInfo : public Cxtextedit::TcxCustomTextEditViewInfo 
{
	typedef Cxtextedit::TcxCustomTextEditViewInfo inherited;
	
public:
	int ShellIconIndex;
	#pragma pack(push, 1)
	Types::TPoint ShellIconPosition;
	#pragma pack(pop)
	
	virtual void __fastcall Offset(int DX, int DY);
	virtual void __fastcall Paint(Cxgraphics::TcxCanvas* ACanvas);
public:
	#pragma option push -w-inl
	/* TcxCustomTextEditViewInfo.Destroy */ inline __fastcall virtual ~TcxShellComboBoxViewInfo(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomEditViewInfo.Create */ inline __fastcall virtual TcxShellComboBoxViewInfo(void) : Cxtextedit::TcxCustomTextEditViewInfo() { }
	#pragma option pop
	
};


class DELPHICLASS TcxShellComboBoxViewData;
class DELPHICLASS TcxCustomShellComboBoxProperties;
class PASCALIMPLEMENTATION TcxShellComboBoxViewData : public Cxdropdownedit::TcxCustomDropDownEditViewData 
{
	typedef Cxdropdownedit::TcxCustomDropDownEditViewData inherited;
	
private:
	HIDESBASE TcxCustomShellComboBoxProperties* __fastcall GetProperties(void);
	
protected:
	virtual tagSIZE __fastcall InternalGetEditConstantPartSize(Cxgraphics::TcxCanvas* ACanvas, bool AIsInplace, const Cxedit::TcxEditSizeProperties &AEditSizeProperties, tagSIZE &MinContentSize, Cxedit::TcxCustomEditViewInfo* AViewInfo);
	
public:
	virtual void __fastcall Calculate(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ABounds, const Types::TPoint &P, Cxcontainer::TcxMouseButton Button, Classes::TShiftState Shift, Cxedit::TcxCustomEditViewInfo* AViewInfo, bool AIsMouseEvent);
	virtual void __fastcall EditValueToDrawValue(Cxgraphics::TcxCanvas* ACanvas, const Variant &AEditValue, Cxedit::TcxCustomEditViewInfo* AViewInfo);
	virtual Types::TRect __fastcall GetClientExtent(Cxedit::TcxCustomEditViewInfo* AViewInfo);
	virtual tagSIZE __fastcall GetEditContentSize(Cxgraphics::TcxCanvas* ACanvas, const Variant &AEditValue, const Cxedit::TcxEditSizeProperties &AEditSizeProperties);
	__property TcxCustomShellComboBoxProperties* Properties = {read=GetProperties};
public:
	#pragma option push -w-inl
	/* TcxCustomEditViewData.Create */ inline __fastcall virtual TcxShellComboBoxViewData(Cxedit::TcxCustomEditProperties* AProperties, Cxcontainer::TcxContainerStyle* AStyle, bool AIsInplace) : Cxdropdownedit::TcxCustomDropDownEditViewData(AProperties, AStyle, AIsInplace) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxShellComboBoxViewData(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxShellComboBoxRoot;
class PASCALIMPLEMENTATION TcxShellComboBoxRoot : public Cxshellcommon::TcxCustomShellRoot 
{
	typedef Cxshellcommon::TcxCustomShellRoot inherited;
	
private:
	Classes::TNotifyEvent FOnChange;
	
protected:
	virtual void __fastcall RootUpdated(void);
	__property Classes::TNotifyEvent OnChange = {read=FOnChange, write=FOnChange};
public:
	#pragma option push -w-inl
	/* TcxCustomShellRoot.Create */ inline __fastcall virtual TcxShellComboBoxRoot(Classes::TPersistent* AOwner, HWND AParentWindow) : Cxshellcommon::TcxCustomShellRoot(AOwner, AParentWindow) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomShellRoot.Destroy */ inline __fastcall virtual ~TcxShellComboBoxRoot(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxShellComboBoxLookupData;
class DELPHICLASS TcxCustomShellComboBox;
class PASCALIMPLEMENTATION TcxShellComboBoxLookupData : public Cxtextedit::TcxCustomTextEditLookupData 
{
	typedef Cxtextedit::TcxCustomTextEditLookupData inherited;
	
private:
	HIDESBASE TcxCustomShellComboBox* __fastcall GetEdit(void);
	
protected:
	virtual AnsiString __fastcall GetItem(int Index);
	virtual int __fastcall GetItemCount(void);
	virtual void __fastcall ListChanged(void);
	__property TcxCustomShellComboBox* Edit = {read=GetEdit};
public:
	#pragma option push -w-inl
	/* TcxCustomTextEditLookupData.Create */ inline __fastcall virtual TcxShellComboBoxLookupData(Classes::TPersistent* AOwner) : Cxtextedit::TcxCustomTextEditLookupData(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxShellComboBoxLookupData(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxCustomShellComboBoxProperties : public Cxdropdownedit::TcxCustomPopupEditProperties 
{
	typedef Cxdropdownedit::TcxCustomPopupEditProperties inherited;
	
private:
	bool FFastSearch;
	bool FIncrementalSearch;
	TcxShellComboBoxRoot* FRoot;
	bool FShowFullPath;
	bool FStoreRelativePath;
	TcxPopupShellTreeViewOptions FTreeViewOptions;
	TcxShellComboBoxViewOptions FViewOptions;
	bool __fastcall GetDropDownSizeable(void);
	int __fastcall GetDropDownWidth(void);
	void __fastcall RootChangeHandler(System::TObject* Sender);
	void __fastcall SetDropDownSizeable(bool Value);
	void __fastcall SetDropDownWidth(int Value);
	void __fastcall SetFastSearch(bool Value);
	void __fastcall SetIncrementalSearch(bool Value);
	void __fastcall SetShowFullPath(bool Value);
	void __fastcall SetStoreRelativePath(bool Value);
	void __fastcall SetTreeViewOptions(TcxPopupShellTreeViewOptions Value);
	void __fastcall SetViewOptions(TcxShellComboBoxViewOptions Value);
	
protected:
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewDataClass(TMetaClass* vmt);
	void __fastcall CheckRoot(void);
	virtual Shlobj::PItemIDList __fastcall EditValueToPIDL(const Variant &AEditValue);
	Cxshelllistview::TcxShellViewOptions __fastcall GetShellViewOptions(void);
	virtual void __fastcall RootChanged(void);
	__property bool DropDownSizeable = {read=GetDropDownSizeable, write=SetDropDownSizeable, default=1};
	__property int DropDownWidth = {read=GetDropDownWidth, write=SetDropDownWidth, default=0};
	__property bool FastSearch = {read=FFastSearch, write=SetFastSearch, default=0};
	__property bool IncrementalSearch = {read=FIncrementalSearch, write=SetIncrementalSearch, default=0};
	__property TcxShellComboBoxRoot* Root = {read=FRoot, write=FRoot};
	__property bool ShowFullPath = {read=FShowFullPath, write=SetShowFullPath, default=0};
	__property bool StoreRelativePath = {read=FStoreRelativePath, write=SetStoreRelativePath, default=1};
	__property TcxPopupShellTreeViewOptions TreeViewOptions = {read=FTreeViewOptions, write=SetTreeViewOptions, default=31};
	__property TcxShellComboBoxViewOptions ViewOptions = {read=FViewOptions, write=SetViewOptions, default=0};
	
public:
	__fastcall virtual TcxCustomShellComboBoxProperties(Classes::TPersistent* AOwner);
	__fastcall virtual ~TcxCustomShellComboBoxProperties(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	/* virtual class method */ virtual TMetaClass* __fastcall GetContainerClass(TMetaClass* vmt);
	virtual WideString __fastcall GetDisplayText(const Variant &AEditValue, bool AFullText = false);
	virtual Cxdatautils::TcxDataEditValueSource __fastcall GetEditValueSource(bool AEditFocused);
	/* virtual class method */ virtual TMetaClass* __fastcall GetLookupDataClass(TMetaClass* vmt);
	void __fastcall GetShellDisplayValue(const Variant &AEditValue, /* out */ AnsiString &AText, /* out */ int &AShellSysIconIndex);
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewInfoClass(TMetaClass* vmt);
	virtual bool __fastcall IsEditValueValid(Variant &EditValue, bool AEditFocused);
};


class DELPHICLASS TcxShellComboBoxProperties;
class PASCALIMPLEMENTATION TcxShellComboBoxProperties : public TcxCustomShellComboBoxProperties 
{
	typedef TcxCustomShellComboBoxProperties inherited;
	
__published:
	__property Alignment ;
	__property AutoSelect  = {default=1};
	__property ButtonGlyph ;
	__property DropDownSizeable  = {default=1};
	__property DropDownWidth  = {default=0};
	__property FastSearch  = {default=0};
	__property HideSelection  = {default=1};
	__property IncrementalSearch  = {default=0};
	__property PopupAlignment  = {default=0};
	__property ReadOnly ;
	__property Root ;
	__property ShowFullPath  = {default=0};
	__property StoreRelativePath  = {default=1};
	__property TreeViewOptions  = {default=31};
	__property UseLeftAlignmentOnEditing ;
	__property ViewOptions  = {default=0};
	__property OnChange ;
	__property OnCloseUp ;
	__property OnEditValueChanged ;
	__property OnPopup ;
public:
	#pragma option push -w-inl
	/* TcxCustomShellComboBoxProperties.Create */ inline __fastcall virtual TcxShellComboBoxProperties(Classes::TPersistent* AOwner) : TcxCustomShellComboBoxProperties(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomShellComboBoxProperties.Destroy */ inline __fastcall virtual ~TcxShellComboBoxProperties(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxPopupShellTreeView;
class PASCALIMPLEMENTATION TcxPopupShellTreeView : public Cxshelltreeview::TcxShellTreeView 
{
	typedef Cxshelltreeview::TcxShellTreeView inherited;
	
private:
	TcxCustomShellComboBox* __fastcall GetEdit(void);
	
protected:
	DYNAMIC void __fastcall KeyDown(Word &Key, Classes::TShiftState Shift);
	DYNAMIC void __fastcall MouseUp(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall DoSelectNode(bool AAcceptSelection = true);
	__property TcxCustomShellComboBox* Edit = {read=GetEdit};
public:
	#pragma option push -w-inl
	/* TcxCustomShellTreeView.Create */ inline __fastcall virtual TcxPopupShellTreeView(Classes::TComponent* AOwner) : Cxshelltreeview::TcxShellTreeView(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomShellTreeView.Destroy */ inline __fastcall virtual ~TcxPopupShellTreeView(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxPopupShellTreeView(HWND ParentWindow) : Cxshelltreeview::TcxShellTreeView(ParentWindow) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxPopupShellTreeViewClass;

class PASCALIMPLEMENTATION TcxCustomShellComboBox : public Cxdropdownedit::TcxCustomPopupEdit 
{
	typedef Cxdropdownedit::TcxCustomPopupEdit inherited;
	
private:
	_ITEMIDLIST *FAbsolutePIDL;
	bool FIsDependentShellControlsNotification;
	bool FNotificationFromDependentShellControls;
	bool FIsSelectedNodeChangeEventLocked;
	TcxPopupShellTreeView* FPopupShellTreeView;
	Cxshelllistview::TcxCustomShellListView* FShellListView;
	Cxshelltreeview::TcxCustomShellTreeView* FShellTreeView;
	Shlobj::PItemIDList __fastcall GetAbsolutePIDL(void);
	AnsiString __fastcall GetAbsolutePath();
	HIDESBASE TcxShellComboBoxProperties* __fastcall GetProperties(void);
	HIDESBASE TcxShellComboBoxViewInfo* __fastcall GetViewInfo(void);
	void __fastcall RootChangeHandler(System::TObject* Sender);
	void __fastcall SetAbsolutePIDL(Shlobj::PItemIDList Value);
	void __fastcall SetAbsolutePath(const AnsiString Value);
	HIDESBASE void __fastcall SetProperties(TcxShellComboBoxProperties* Value);
	void __fastcall SetRelativePIDL(Shlobj::PItemIDList Value);
	void __fastcall SetShellListView(Cxshelllistview::TcxCustomShellListView* Value);
	void __fastcall SetShellTreeView(Cxshelltreeview::TcxCustomShellTreeView* Value);
	MESSAGE void __fastcall DSMDoNavigate(Messages::TMessage &Message);
	
protected:
	virtual bool __fastcall CanDropDown(void);
	virtual void __fastcall CloseUp(bool AAccept);
	virtual void __fastcall DoInitPopup(void);
	virtual void __fastcall DropDown(void);
	virtual void __fastcall HandleSelectItem(System::TObject* Sender);
	virtual void __fastcall InitializePopupWindow(void);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	DYNAMIC void __fastcall PopupWindowShowed(System::TObject* Sender);
	virtual void __fastcall PropertiesChanged(System::TObject* Sender);
	virtual void __fastcall SynchronizeDisplayValue(void);
	virtual void __fastcall SynchronizeEditValue(void);
	bool __fastcall CheckAbsolutePIDL(Shlobj::PItemIDList &APIDL, bool ACheckObjectExistence);
	void __fastcall CheckPopupShellTreeView(void);
	Comctrls::TTreeNode* __fastcall FindNodeAmongExpandedNodes(AnsiString ANodeText);
	virtual TMetaClass* __fastcall GetPopupShellTreeViewClass(void);
	void __fastcall InternalSetAbsolutePIDL(Shlobj::PItemIDList Value);
	virtual void __fastcall InternalSynchronizeEditValue(Shlobj::PItemIDList APIDL, const AnsiString ADisplayText = "");
	void __fastcall InvalidateShellIconRect(void);
	virtual void __fastcall SelectedNodeChangeHandler(System::TObject* Sender, Comctrls::TTreeNode* ANode);
	void __fastcall SynchronizeDependentShellControls(void);
	void __fastcall SynchronizePopupShellTreeView(void);
	Comctrls::TTreeNode* __fastcall TraverseAllVisibleNodes(int &ANodeIndex, Comctrls::TTreeNode* ATreeNode = (Comctrls::TTreeNode*)(0x0));
	__property TcxPopupShellTreeView* PopupShellTreeView = {read=FPopupShellTreeView};
	__property TcxShellComboBoxProperties* Properties = {read=GetProperties, write=SetProperties};
	__property Cxshelllistview::TcxCustomShellListView* ShellListView = {read=FShellListView, write=SetShellListView};
	__property Cxshelltreeview::TcxCustomShellTreeView* ShellTreeView = {read=FShellTreeView, write=SetShellTreeView};
	__property TcxShellComboBoxViewInfo* ViewInfo = {read=GetViewInfo};
	
public:
	__fastcall virtual TcxCustomShellComboBox(Classes::TComponent* AOwner)/* overload */;
	__fastcall virtual ~TcxCustomShellComboBox(void);
	/* virtual class method */ virtual TMetaClass* __fastcall GetPropertiesClass(TMetaClass* vmt);
	__property Shlobj::PItemIDList AbsolutePIDL = {read=GetAbsolutePIDL, write=SetAbsolutePIDL};
	__property AnsiString AbsolutePath = {read=GetAbsolutePath, write=SetAbsolutePath};
	__property Shlobj::PItemIDList RelativePIDL = {write=SetRelativePIDL};
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomShellComboBox(HWND ParentWindow) : Cxdropdownedit::TcxCustomPopupEdit(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxShellComboBox;
class PASCALIMPLEMENTATION TcxShellComboBox : public TcxCustomShellComboBox 
{
	typedef TcxCustomShellComboBox inherited;
	
__published:
	__property Align  = {default=0};
	__property Anchors  = {default=3};
	__property AutoSize  = {default=1};
	__property BeepOnEnter  = {default=1};
	__property Constraints ;
	__property DragMode  = {default=0};
	__property Enabled  = {default=1};
	__property ParentColor  = {default=0};
	__property ParentFont  = {default=1};
	__property ParentShowHint  = {default=1};
	__property PopupMenu ;
	__property Properties ;
	__property ShellListView ;
	__property ShellTreeView ;
	__property ShowHint ;
	__property Style ;
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=1};
	__property Text ;
	__property Visible  = {default=1};
	__property DragCursor  = {default=-12};
	__property DragKind  = {default=0};
	__property ImeMode  = {default=3};
	__property ImeName ;
	__property OnClick ;
	__property OnContextPopup ;
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
	__property OnMouseEnter ;
	__property OnMouseLeave ;
	__property OnMouseMove ;
	__property OnMouseUp ;
	__property OnStartDrag ;
	__property OnEndDock ;
	__property OnStartDock ;
public:
	#pragma option push -w-inl
	/* TcxCustomShellComboBox.Create */ inline __fastcall virtual TcxShellComboBox(Classes::TComponent* AOwner)/* overload */ : TcxCustomShellComboBox(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomShellComboBox.Destroy */ inline __fastcall virtual ~TcxShellComboBox(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxShellComboBox(HWND ParentWindow) : TcxCustomShellComboBox(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE Imglist::TCustomImageList* cxShellComboBoxImageList;

}	/* namespace Cxshellcombobox */
using namespace Cxshellcombobox;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxShellComboBox
