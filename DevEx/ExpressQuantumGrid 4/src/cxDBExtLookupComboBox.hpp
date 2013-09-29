// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxDBExtLookupComboBox.pas' rev: 6.00

#ifndef cxDBExtLookupComboBoxHPP
#define cxDBExtLookupComboBoxHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Menus.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <cxTextEdit.hpp>	// Pascal unit
#include <cxMaskEdit.hpp>	// Pascal unit
#include <cxDropDownEdit.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <cxGridTableView.hpp>	// Pascal unit
#include <cxGridCustomTableView.hpp>	// Pascal unit
#include <cxGridCustomView.hpp>	// Pascal unit
#include <cxGridStrs.hpp>	// Pascal unit
#include <cxGrid.hpp>	// Pascal unit
#include <cxDBLookupEdit.hpp>	// Pascal unit
#include <cxLookupEdit.hpp>	// Pascal unit
#include <cxDBData.hpp>	// Pascal unit
#include <cxCustomData.hpp>	// Pascal unit
#include <cxDB.hpp>	// Pascal unit
#include <cxEditConsts.hpp>	// Pascal unit
#include <cxDBEdit.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxLookAndFeels.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <DB.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Variants.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxdbextlookupcombobox
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxExtLookupGrid;
class PASCALIMPLEMENTATION TcxExtLookupGrid : public Cxgrid::TcxGrid 
{
	typedef Cxgrid::TcxGrid inherited;
	
private:
	bool FEditable;
	bool FPopupMouseMoveLocked;
	bool FRowPressed;
	Cxlookupedit::TcxLookupGridCloseUpEvent FOnCloseUp;
	HIDESBASE Cxgridcustomtableview::TcxCustomGridTableView* __fastcall GetView(void);
	void __fastcall ViewKeyDown(System::TObject* Sender, Word &Key, Classes::TShiftState Shift);
	void __fastcall ViewMouseDown(System::TObject* Sender, Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	void __fastcall ViewMouseMove(System::TObject* Sender, Classes::TShiftState Shift, int X, int Y);
	void __fastcall ViewMouseUp(System::TObject* Sender, Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	
protected:
	DYNAMIC void __fastcall DoCancelMode(void);
	virtual void __fastcall DoCloseUp(bool AAccept);
	bool __fastcall IsDataRow(Cxgridcustomview::TcxCustomGridHitTest* AHitTest);
	__property bool Editable = {read=FEditable, write=FEditable, nodefault};
	__property bool PopupMouseMoveLocked = {read=FPopupMouseMoveLocked, write=FPopupMouseMoveLocked, nodefault};
	__property Cxlookupedit::TcxLookupGridCloseUpEvent OnCloseUp = {read=FOnCloseUp, write=FOnCloseUp};
	
public:
	__property Cxgridcustomtableview::TcxCustomGridTableView* View = {read=GetView};
public:
	#pragma option push -w-inl
	/* TcxCustomGrid.Create */ inline __fastcall virtual TcxExtLookupGrid(Classes::TComponent* AOwner) : Cxgrid::TcxGrid(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomGrid.Destroy */ inline __fastcall virtual ~TcxExtLookupGrid(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxExtLookupGrid(HWND ParentWindow) : Cxgrid::TcxGrid(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxExtLookupComboBoxProperties;
class PASCALIMPLEMENTATION TcxExtLookupComboBoxProperties : public Cxdblookupedit::TcxCustomDBLookupEditProperties 
{
	typedef Cxdblookupedit::TcxCustomDBLookupEditProperties inherited;
	
private:
	bool FAutoSearchOnPopup;
	bool FFocusPopup;
	TcxExtLookupGrid* FGrid;
	bool FInCheckListFieldItem;
	Cxgridcustomtableview::TcxCustomGridTableItem* FListFieldItem;
	bool FPrevColumnFiltering;
	bool FPrevPullFocusing;
	bool FPrevImmediateEditor;
	bool FPrevIncSearch;
	bool FPrevMultiSelect;
	Cxgridcustomtableview::TcxCustomGridTableView* FView;
	bool __fastcall GetGridMode(void);
	HIDESBASE int __fastcall GetListFieldIndex(void);
	Cxgridcustomtableview::TcxCustomGridTableItem* __fastcall GetListFieldItem(void);
	void __fastcall SetGridMode(bool Value);
	void __fastcall SetListFieldItem(Cxgridcustomtableview::TcxCustomGridTableItem* Value);
	void __fastcall SetView(Cxgridcustomtableview::TcxCustomGridTableView* Value);
	
protected:
	void __fastcall CheckListFieldItem(void);
	virtual void __fastcall DeinitializeDataController(void);
	virtual void __fastcall FreeNotification(Classes::TComponent* Sender);
	virtual bool __fastcall GetIncrementalFiltering(void);
	virtual int __fastcall GetListIndex(void);
	virtual void __fastcall InitializeDataController(void);
	void __fastcall LinkView(Cxgridcustomtableview::TcxCustomGridTableView* AView);
	virtual bool __fastcall PopupWindowCapturesFocus(void);
	void __fastcall UnlinkView(Cxgridcustomtableview::TcxCustomGridTableView* AView);
	virtual Controls::TWinControl* __fastcall GetLookupGridActiveControl(void);
	virtual bool __fastcall GetLookupGridCanResize(void);
	virtual int __fastcall GetLookupGridColumnCount(void);
	virtual Controls::TWinControl* __fastcall GetLookupGridControl(void);
	virtual Cxcustomdata::TcxCustomDataController* __fastcall GetLookupGridDataController(void);
	virtual int __fastcall GetLookupGridVisualAreaPreferredWidth(void);
	virtual int __fastcall GetLookupGridNearestPopupHeight(int AHeight);
	virtual int __fastcall GetLookupGridPopupHeight(int ADropDownRowCount);
	virtual bool __fastcall IsLookupGridMouseOverList(const Types::TPoint &P);
	virtual void __fastcall LookupGridDeinitialize(void);
	virtual void __fastcall LookupGridDropedDown(const AnsiString AFindStr);
	virtual void __fastcall LookupGridInitEvents(Classes::TNotifyEvent AOnClick, Classes::TNotifyEvent AOnFocusedRowChanged, Cxlookupedit::TcxLookupGridCloseUpEvent AOnCloseUp);
	virtual void __fastcall LookupGridInitialize(void);
	virtual void __fastcall LookupGridInitLookAndFeel(Cxlookandfeels::TcxLookAndFeel* ALookAndFeel, Graphics::TColor AColor, Graphics::TFont* AFont);
	virtual void __fastcall LookupGridLockMouseMove(void);
	virtual void __fastcall LookupGridMakeFocusedRowVisible(void);
	virtual void __fastcall LookupGridUnlockMouseMove(void);
	virtual void __fastcall DBLookupGridBeginUpdate(void);
	virtual void __fastcall DBLookupGridCheckColumnByFieldName(const AnsiString AFieldName);
	virtual void __fastcall DBLookupGridCreateColumnsByFieldNames(const AnsiString AFieldNames);
	virtual void __fastcall DBLookupGridEndUpdate(void);
	virtual Db::TField* __fastcall GetDBLookupGridColumnField(int AIndex);
	virtual AnsiString __fastcall GetDBLookupGridColumnFieldName(int AIndex);
	virtual int __fastcall GetDBLookupGridColumnIndexByFieldName(const AnsiString AFieldName);
	virtual Cxdbdata::TcxDBDataController* __fastcall GetDBLookupGridDataController(void);
	
public:
	__fastcall virtual TcxExtLookupComboBoxProperties(Classes::TPersistent* AOwner);
	__fastcall virtual ~TcxExtLookupComboBoxProperties(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	/* virtual class method */ virtual TMetaClass* __fastcall GetContainerClass(TMetaClass* vmt);
	/*         class method */ static bool __fastcall IsViewSupported(TMetaClass* vmt, Cxgridcustomtableview::TcxCustomGridTableView* Value);
	__property TcxExtLookupGrid* Grid = {read=FGrid};
	__property int ListFieldIndex = {read=GetListFieldIndex, nodefault};
	
__published:
	__property Alignment ;
	__property bool AutoSearchOnPopup = {read=FAutoSearchOnPopup, write=FAutoSearchOnPopup, default=1};
	__property AutoSelect  = {default=1};
	__property ButtonGlyph ;
	__property CharCase  = {default=0};
	__property ClearKey  = {default=0};
	__property DropDownAutoSize  = {default=0};
	__property DropDownHeight  = {default=0};
	__property DropDownListStyle  = {default=0};
	__property DropDownRows  = {default=8};
	__property DropDownSizeable  = {default=0};
	__property DropDownWidth  = {default=0};
	__property bool FocusPopup = {read=FFocusPopup, write=FFocusPopup, default=0};
	__property bool GridMode = {read=GetGridMode, write=SetGridMode, default=0};
	__property HideSelection  = {default=1};
	__property ImmediateDropDown  = {default=1};
	__property ImmediatePost  = {default=0};
	__property IncrementalFiltering  = {default=1};
	__property Cxgridcustomtableview::TcxCustomGridTableView* View = {read=FView, write=SetView};
	__property KeyFieldNames ;
	__property Cxgridcustomtableview::TcxCustomGridTableItem* ListFieldItem = {read=GetListFieldItem, write=SetListFieldItem};
	__property MaxLength ;
	__property OEMConvert  = {default=0};
	__property PopupAlignment  = {default=0};
	__property ReadOnly ;
	__property Revertable  = {default=0};
	__property UseLeftAlignmentOnEditing ;
	__property OnChange ;
	__property OnCloseUp ;
	__property OnEditValueChanged ;
	__property OnInitPopup ;
	__property OnNewLookupDisplayText ;
	__property OnPopup ;
	__property OnValidate ;
};


class DELPHICLASS TcxCustomExtLookupComboBox;
class PASCALIMPLEMENTATION TcxCustomExtLookupComboBox : public Cxdblookupedit::TcxCustomDBLookupEdit 
{
	typedef Cxdblookupedit::TcxCustomDBLookupEdit inherited;
	
private:
	HIDESBASE TcxExtLookupComboBoxProperties* __fastcall GetProperties(void);
	HIDESBASE void __fastcall SetProperties(TcxExtLookupComboBoxProperties* Value);
	
protected:
	virtual bool __fastcall CanDropDown(void);
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetPropertiesClass(TMetaClass* vmt);
	__property TcxExtLookupComboBoxProperties* Properties = {read=GetProperties, write=SetProperties};
	__property EditValue ;
	__property Text ;
public:
	#pragma option push -w-inl
	/* TcxCustomLookupEdit.Create */ inline __fastcall virtual TcxCustomExtLookupComboBox(Classes::TComponent* AOwner)/* overload */ : Cxdblookupedit::TcxCustomDBLookupEdit(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomDropDownEdit.Destroy */ inline __fastcall virtual ~TcxCustomExtLookupComboBox(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomExtLookupComboBox(HWND ParentWindow) : Cxdblookupedit::TcxCustomDBLookupEdit(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxExtLookupComboBox;
class PASCALIMPLEMENTATION TcxExtLookupComboBox : public TcxCustomExtLookupComboBox 
{
	typedef TcxCustomExtLookupComboBox inherited;
	
__published:
	__property Anchors  = {default=3};
	__property AutoSize  = {default=1};
	__property BeepOnEnter  = {default=1};
	__property Constraints ;
	__property DragCursor  = {default=-12};
	__property DragKind  = {default=0};
	__property DragMode  = {default=0};
	__property Enabled  = {default=1};
	__property ImeMode  = {default=3};
	__property ImeName ;
	__property ParentColor  = {default=0};
	__property ParentFont  = {default=1};
	__property ParentShowHint  = {default=1};
	__property PopupMenu ;
	__property Properties ;
	__property EditValue ;
	__property ShowHint ;
	__property Style ;
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=1};
	__property Visible  = {default=1};
	__property OnClick ;
	__property OnDblClick ;
	__property OnEnter ;
	__property OnExit ;
	__property OnKeyDown ;
	__property OnKeyPress ;
	__property OnKeyUp ;
	__property OnMouseDown ;
	__property OnMouseMove ;
	__property OnMouseUp ;
public:
	#pragma option push -w-inl
	/* TcxCustomLookupEdit.Create */ inline __fastcall virtual TcxExtLookupComboBox(Classes::TComponent* AOwner)/* overload */ : TcxCustomExtLookupComboBox(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomDropDownEdit.Destroy */ inline __fastcall virtual ~TcxExtLookupComboBox(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxExtLookupComboBox(HWND ParentWindow) : TcxCustomExtLookupComboBox(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxDBExtLookupComboBox;
class PASCALIMPLEMENTATION TcxDBExtLookupComboBox : public TcxCustomExtLookupComboBox 
{
	typedef TcxCustomExtLookupComboBox inherited;
	
private:
	Cxdbedit::TcxDBEditDataBinding* __fastcall GetDataBinding(void);
	HIDESBASE void __fastcall SetDataBinding(Cxdbedit::TcxDBEditDataBinding* Value);
	MESSAGE void __fastcall CMGetDataLink(Messages::TMessage &Message);
	
protected:
	/* virtual class method */ virtual TMetaClass* __fastcall GetDataBindingClass(TMetaClass* vmt);
	
__published:
	__property Anchors  = {default=3};
	__property AutoSize  = {default=1};
	__property BeepOnEnter  = {default=1};
	__property Constraints ;
	__property DragCursor  = {default=-12};
	__property DragKind  = {default=0};
	__property Cxdbedit::TcxDBEditDataBinding* DataBinding = {read=GetDataBinding, write=SetDataBinding};
	__property DragMode  = {default=0};
	__property Enabled  = {default=1};
	__property ImeMode  = {default=3};
	__property ImeName ;
	__property ParentColor  = {default=0};
	__property ParentFont  = {default=1};
	__property ParentShowHint  = {default=1};
	__property PopupMenu ;
	__property Properties ;
	__property ShowHint ;
	__property Style ;
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=1};
	__property Visible  = {default=1};
	__property OnClick ;
	__property OnDblClick ;
	__property OnEnter ;
	__property OnExit ;
	__property OnKeyDown ;
	__property OnKeyPress ;
	__property OnKeyUp ;
	__property OnMouseDown ;
	__property OnMouseMove ;
	__property OnMouseUp ;
public:
	#pragma option push -w-inl
	/* TcxCustomLookupEdit.Create */ inline __fastcall virtual TcxDBExtLookupComboBox(Classes::TComponent* AOwner)/* overload */ : TcxCustomExtLookupComboBox(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomDropDownEdit.Destroy */ inline __fastcall virtual ~TcxDBExtLookupComboBox(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxDBExtLookupComboBox(HWND ParentWindow) : TcxCustomExtLookupComboBox(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxEditRepositoryExtLookupComboBoxItem;
class PASCALIMPLEMENTATION TcxEditRepositoryExtLookupComboBoxItem : public Cxedit::TcxEditRepositoryItem 
{
	typedef Cxedit::TcxEditRepositoryItem inherited;
	
private:
	TcxExtLookupComboBoxProperties* __fastcall GetProperties(void);
	HIDESBASE void __fastcall SetProperties(TcxExtLookupComboBoxProperties* Value);
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetEditPropertiesClass(TMetaClass* vmt);
	
__published:
	__property TcxExtLookupComboBoxProperties* Properties = {read=GetProperties, write=SetProperties};
public:
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Create */ inline __fastcall virtual TcxEditRepositoryExtLookupComboBoxItem(Classes::TComponent* AOwner) : Cxedit::TcxEditRepositoryItem(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Destroy */ inline __fastcall virtual ~TcxEditRepositoryExtLookupComboBoxItem(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxdbextlookupcombobox */
using namespace Cxdbextlookupcombobox;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxDBExtLookupComboBox
