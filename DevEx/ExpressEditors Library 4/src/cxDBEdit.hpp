// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxDBEdit.pas' rev: 6.00

#ifndef cxDBEditHPP
#define cxDBEditHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Menus.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <cxTimeEdit.hpp>	// Pascal unit
#include <cxTextEdit.hpp>	// Pascal unit
#include <cxSpinEdit.hpp>	// Pascal unit
#include <cxRadioGroup.hpp>	// Pascal unit
#include <cxMRUEdit.hpp>	// Pascal unit
#include <cxMemo.hpp>	// Pascal unit
#include <cxMaskEdit.hpp>	// Pascal unit
#include <cxListBox.hpp>	// Pascal unit
#include <cxImageComboBox.hpp>	// Pascal unit
#include <cxImage.hpp>	// Pascal unit
#include <cxHyperLinkEdit.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxDropDownEdit.hpp>	// Pascal unit
#include <cxDB.hpp>	// Pascal unit
#include <cxDataUtils.hpp>	// Pascal unit
#include <cxCustomData.hpp>	// Pascal unit
#include <cxCurrencyEdit.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <cxCheckBox.hpp>	// Pascal unit
#include <cxCalendar.hpp>	// Pascal unit
#include <cxCalc.hpp>	// Pascal unit
#include <cxButtonEdit.hpp>	// Pascal unit
#include <cxBlobEdit.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <DBCtrls.hpp>	// Pascal unit
#include <DB.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <Variants.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxdbedit
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxCustomDBEditDefaultValuesProvider;
class PASCALIMPLEMENTATION TcxCustomDBEditDefaultValuesProvider : public Cxedit::TcxCustomEditDefaultValuesProvider 
{
	typedef Cxedit::TcxCustomEditDefaultValuesProvider inherited;
	
private:
	Db::TField* FField;
	Cxcontainer::TcxFreeNotificator* FFreeNotifier;
	void __fastcall FieldFreeNotification(Classes::TComponent* Sender);
	void __fastcall SetField(Db::TField* Value);
	
public:
	__fastcall virtual TcxCustomDBEditDefaultValuesProvider(Classes::TPersistent* AOwner);
	__fastcall virtual ~TcxCustomDBEditDefaultValuesProvider(void);
	virtual Classes::TAlignment __fastcall DefaultAlignment(void);
	virtual Cxedit::TcxBlobKind __fastcall DefaultBlobKind(void);
	virtual bool __fastcall DefaultCanModify(void);
	virtual AnsiString __fastcall DefaultDisplayFormat();
	virtual AnsiString __fastcall DefaultEditMask();
	virtual bool __fastcall DefaultIsFloatValue(void);
	virtual int __fastcall DefaultMaxLength(void);
	virtual double __fastcall DefaultMaxValue(void);
	virtual double __fastcall DefaultMinValue(void);
	virtual bool __fastcall DefaultReadOnly(void);
	virtual bool __fastcall DefaultRequired(void);
	virtual bool __fastcall HasDisplayValueFormatting(void);
	virtual bool __fastcall IsBlob(void);
	virtual bool __fastcall IsDBConnectionLive(void);
	virtual bool __fastcall IsDisplayFormatDefined(bool AIsCurrencyValueAccepted);
	virtual bool __fastcall IsValidChar(char AChar);
	__property Db::TField* Field = {read=FField, write=SetField};
};


class DELPHICLASS TcxDBFieldDataLink;
class PASCALIMPLEMENTATION TcxDBFieldDataLink : public Cxdb::TcxCustomFieldDataLink 
{
	typedef Cxdb::TcxCustomFieldDataLink inherited;
	
protected:
	virtual void __fastcall FocusControl(Db::TFieldRef Field);
	virtual void __fastcall VisualControlChanged(void);
	virtual void __fastcall UpdateRightToLeft(void);
public:
	#pragma option push -w-inl
	/* TcxCustomFieldDataLink.Create */ inline __fastcall TcxDBFieldDataLink(Cxdb::TcxCustomDBDataBinding* ADataBinding) : Cxdb::TcxCustomFieldDataLink(ADataBinding) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TDataLink.Destroy */ inline __fastcall virtual ~TcxDBFieldDataLink(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxDBDataBinding;
class PASCALIMPLEMENTATION TcxDBDataBinding : public Cxdb::TcxCustomDBDataBinding 
{
	typedef Cxdb::TcxCustomDBDataBinding inherited;
	
protected:
	virtual TMetaClass* __fastcall GetDataLinkClass(void);
	
__published:
	__property DataSource ;
	__property DataField ;
public:
	#pragma option push -w-inl
	/* TcxCustomDBDataBinding.Create */ inline __fastcall virtual TcxDBDataBinding(Classes::TComponent* AOwner, Classes::TComponent* ADataComponent) : Cxdb::TcxCustomDBDataBinding(AOwner, ADataComponent) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomDBDataBinding.Destroy */ inline __fastcall virtual ~TcxDBDataBinding(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxEditFieldDataLink;
class DELPHICLASS TcxDBEditDataBinding;
class PASCALIMPLEMENTATION TcxDBEditDataBinding : public Cxedit::TcxEditDataBinding 
{
	typedef Cxedit::TcxEditDataBinding inherited;
	
private:
	TcxEditFieldDataLink* FDataLink;
	int FRefreshCount;
	AnsiString __fastcall GetDataField();
	Db::TDataSource* __fastcall GetDataSource(void);
	TcxCustomDBEditDefaultValuesProvider* __fastcall GetDefaultValuesProvider(void);
	Db::TField* __fastcall GetField(void);
	void __fastcall SetDataField(const AnsiString Value);
	void __fastcall SetDataSource(Db::TDataSource* Value);
	
protected:
	virtual bool __fastcall CanCheckEditorValue(void);
	virtual bool __fastcall CanSetEditMode(void);
	virtual void __fastcall DefaultValuesChanged(void);
	void __fastcall DisableRefresh(void);
	void __fastcall EnableRefresh(void);
	virtual bool __fastcall ExecuteAction(Classes::TBasicAction* Action);
	virtual Variant __fastcall GetStoredValue();
	virtual bool __fastcall GetModified(void);
	bool __fastcall IsDBConnectionLive(void);
	bool __fastcall IsRefreshDisabled(void);
	virtual bool __fastcall IsTextEdit(void);
	bool __fastcall IsTextEditInDesignMode(void);
	virtual void __fastcall Reset(void);
	virtual void __fastcall SetDisplayValue(const Variant &Value);
	virtual bool __fastcall SetEditMode(void);
	virtual void __fastcall SetStoredValue(const Variant &Value);
	virtual bool __fastcall UpdateAction(Classes::TBasicAction* Action);
	virtual void __fastcall UpdateDisplayValue(void);
	virtual void __fastcall DataChanged(void);
	virtual void __fastcall DataSetChange(void);
	virtual void __fastcall UpdateData(void);
	__property TcxCustomDBEditDefaultValuesProvider* DefaultValuesProvider = {read=GetDefaultValuesProvider};
	
public:
	__fastcall virtual TcxDBEditDataBinding(Cxedit::TcxCustomEdit* AEdit);
	__fastcall virtual ~TcxDBEditDataBinding(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	/* virtual class method */ virtual TMetaClass* __fastcall GetDefaultValuesProviderClass(TMetaClass* vmt);
	virtual void __fastcall UpdateEdit(void);
	__property TcxEditFieldDataLink* DataLink = {read=FDataLink};
	__property Db::TField* Field = {read=GetField};
	
__published:
	__property AnsiString DataField = {read=GetDataField, write=SetDataField};
	__property Db::TDataSource* DataSource = {read=GetDataSource, write=SetDataSource};
};


class PASCALIMPLEMENTATION TcxEditFieldDataLink : public Db::TDataLink 
{
	typedef Db::TDataLink inherited;
	
private:
	TcxDBEditDataBinding* FDataBinding;
	Db::TField* FField;
	AnsiString FFieldName;
	Classes::TComponent* FControl;
	bool FEditing;
	bool FModified;
	bool __fastcall GetCanModify(void);
	HIDESBASE void __fastcall SetEditing(bool Value);
	void __fastcall SetField(Db::TField* Value);
	void __fastcall SetFieldName(const AnsiString Value);
	void __fastcall UpdateField(void);
	void __fastcall UpdateRightToLeft(void);
	
protected:
	virtual void __fastcall ActiveChanged(void);
	virtual void __fastcall DataEvent(Db::TDataEvent Event, int Info);
	virtual void __fastcall EditingChanged(void);
	virtual void __fastcall FocusControl(Db::TFieldRef Field);
	virtual void __fastcall LayoutChanged(void);
	virtual void __fastcall RecordChanged(Db::TField* Field);
	virtual void __fastcall UpdateData(void);
	
public:
	__fastcall TcxEditFieldDataLink(TcxDBEditDataBinding* ADataBinding);
	HIDESBASE bool __fastcall Edit(void);
	void __fastcall Modified(void);
	void __fastcall Reset(void);
	__property bool CanModify = {read=GetCanModify, nodefault};
	__property Classes::TComponent* Control = {read=FControl, write=FControl};
	__property bool Editing = {read=FEditing, nodefault};
	__property Db::TField* Field = {read=FField};
	__property AnsiString FieldName = {read=FFieldName, write=SetFieldName};
public:
	#pragma option push -w-inl
	/* TDataLink.Destroy */ inline __fastcall virtual ~TcxEditFieldDataLink(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxDBTextEditDataBinding;
class PASCALIMPLEMENTATION TcxDBTextEditDataBinding : public TcxDBEditDataBinding 
{
	typedef TcxDBEditDataBinding inherited;
	
protected:
	virtual bool __fastcall IsTextEdit(void);
	virtual void __fastcall SetDisplayValue(const Variant &Value);
	
public:
	virtual void __fastcall UpdateEdit(void);
public:
	#pragma option push -w-inl
	/* TcxDBEditDataBinding.Create */ inline __fastcall virtual TcxDBTextEditDataBinding(Cxedit::TcxCustomEdit* AEdit) : TcxDBEditDataBinding(AEdit) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxDBEditDataBinding.Destroy */ inline __fastcall virtual ~TcxDBTextEditDataBinding(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxDBTextEdit;
class PASCALIMPLEMENTATION TcxDBTextEdit : public Cxtextedit::TcxCustomTextEdit 
{
	typedef Cxtextedit::TcxCustomTextEdit inherited;
	
private:
	TcxDBTextEditDataBinding* __fastcall GetDataBinding(void);
	HIDESBASE void __fastcall SetDataBinding(TcxDBTextEditDataBinding* Value);
	MESSAGE void __fastcall CMGetDataLink(Messages::TMessage &Message);
	
protected:
	/* virtual class method */ virtual TMetaClass* __fastcall GetDataBindingClass(TMetaClass* vmt);
	
__published:
	__property Anchors  = {default=3};
	__property AutoSize  = {default=1};
	__property BeepOnEnter  = {default=1};
	__property Constraints ;
	__property TcxDBTextEditDataBinding* DataBinding = {read=GetDataBinding, write=SetDataBinding};
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
	__property ShowHint ;
	__property Style ;
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=1};
	__property Visible  = {default=1};
	__property OnClick ;
	__property OnContextPopup ;
	__property OnDblClick ;
	__property OnDragDrop ;
	__property OnDragOver ;
	__property OnEditing ;
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
	/* TcxCustomTextEdit.Create */ inline __fastcall virtual TcxDBTextEdit(Classes::TComponent* AOwner)/* overload */ : Cxtextedit::TcxCustomTextEdit(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomTextEdit.Destroy */ inline __fastcall virtual ~TcxDBTextEdit(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxDBTextEdit(HWND ParentWindow) : Cxtextedit::TcxCustomTextEdit(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxDBMemo;
class PASCALIMPLEMENTATION TcxDBMemo : public Cxmemo::TcxCustomMemo 
{
	typedef Cxmemo::TcxCustomMemo inherited;
	
private:
	TcxDBTextEditDataBinding* __fastcall GetDataBinding(void);
	HIDESBASE void __fastcall SetDataBinding(TcxDBTextEditDataBinding* Value);
	MESSAGE void __fastcall CMGetDataLink(Messages::TMessage &Message);
	
protected:
	/* virtual class method */ virtual TMetaClass* __fastcall GetDataBindingClass(TMetaClass* vmt);
	
__published:
	__property Align  = {default=0};
	__property Anchors  = {default=3};
	__property Constraints ;
	__property TcxDBTextEditDataBinding* DataBinding = {read=GetDataBinding, write=SetDataBinding};
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
	__property ShowHint ;
	__property Style ;
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=1};
	__property Visible  = {default=1};
	__property OnClick ;
	__property OnContextPopup ;
	__property OnDblClick ;
	__property OnDragDrop ;
	__property OnDragOver ;
	__property OnEditing ;
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
	/* TcxCustomMemo.Create */ inline __fastcall virtual TcxDBMemo(Classes::TComponent* AOwner)/* overload */ : Cxmemo::TcxCustomMemo(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomTextEdit.Destroy */ inline __fastcall virtual ~TcxDBMemo(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxDBMemo(HWND ParentWindow) : Cxmemo::TcxCustomMemo(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxDBMaskEdit;
class PASCALIMPLEMENTATION TcxDBMaskEdit : public Cxmaskedit::TcxCustomMaskEdit 
{
	typedef Cxmaskedit::TcxCustomMaskEdit inherited;
	
private:
	TcxDBTextEditDataBinding* __fastcall GetDataBinding(void);
	HIDESBASE void __fastcall SetDataBinding(TcxDBTextEditDataBinding* Value);
	MESSAGE void __fastcall CMGetDataLink(Messages::TMessage &Message);
	
protected:
	/* virtual class method */ virtual TMetaClass* __fastcall GetDataBindingClass(TMetaClass* vmt);
	
__published:
	__property Anchors  = {default=3};
	__property AutoSize  = {default=1};
	__property BeepOnEnter  = {default=1};
	__property Constraints ;
	__property TcxDBTextEditDataBinding* DataBinding = {read=GetDataBinding, write=SetDataBinding};
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
	__property ShowHint ;
	__property Style ;
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=1};
	__property Visible  = {default=1};
	__property OnClick ;
	__property OnContextPopup ;
	__property OnDblClick ;
	__property OnDragDrop ;
	__property OnDragOver ;
	__property OnEditing ;
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
	/* TcxCustomMaskEdit.Create */ inline __fastcall virtual TcxDBMaskEdit(Classes::TComponent* AOwner)/* overload */ : Cxmaskedit::TcxCustomMaskEdit(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomMaskEdit.Destroy */ inline __fastcall virtual ~TcxDBMaskEdit(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxDBMaskEdit(HWND ParentWindow) : Cxmaskedit::TcxCustomMaskEdit(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxDBButtonEdit;
class PASCALIMPLEMENTATION TcxDBButtonEdit : public Cxbuttonedit::TcxCustomButtonEdit 
{
	typedef Cxbuttonedit::TcxCustomButtonEdit inherited;
	
private:
	TcxDBTextEditDataBinding* __fastcall GetDataBinding(void);
	HIDESBASE void __fastcall SetDataBinding(TcxDBTextEditDataBinding* Value);
	MESSAGE void __fastcall CMGetDataLink(Messages::TMessage &Message);
	
protected:
	/* virtual class method */ virtual TMetaClass* __fastcall GetDataBindingClass(TMetaClass* vmt);
	
__published:
	__property Anchors  = {default=3};
	__property AutoSize  = {default=1};
	__property BeepOnEnter  = {default=1};
	__property Constraints ;
	__property TcxDBTextEditDataBinding* DataBinding = {read=GetDataBinding, write=SetDataBinding};
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
	__property ShowHint ;
	__property Style ;
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=1};
	__property Visible  = {default=1};
	__property OnClick ;
	__property OnContextPopup ;
	__property OnDblClick ;
	__property OnDragDrop ;
	__property OnDragOver ;
	__property OnEditing ;
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
	/* TcxCustomMaskEdit.Create */ inline __fastcall virtual TcxDBButtonEdit(Classes::TComponent* AOwner)/* overload */ : Cxbuttonedit::TcxCustomButtonEdit(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomMaskEdit.Destroy */ inline __fastcall virtual ~TcxDBButtonEdit(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxDBButtonEdit(HWND ParentWindow) : Cxbuttonedit::TcxCustomButtonEdit(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxDBCheckBox;
class PASCALIMPLEMENTATION TcxDBCheckBox : public Cxcheckbox::TcxCustomCheckBox 
{
	typedef Cxcheckbox::TcxCustomCheckBox inherited;
	
private:
	TcxDBEditDataBinding* __fastcall GetDataBinding(void);
	HIDESBASE void __fastcall SetDataBinding(TcxDBEditDataBinding* Value);
	MESSAGE void __fastcall CMGetDataLink(Messages::TMessage &Message);
	
protected:
	/* virtual class method */ virtual TMetaClass* __fastcall GetDataBindingClass(TMetaClass* vmt);
	
public:
	__property Checked ;
	__property State  = {default=0};
	
__published:
	__property Anchors  = {default=3};
	__property AutoSize  = {default=1};
	__property Constraints ;
	__property TcxDBEditDataBinding* DataBinding = {read=GetDataBinding, write=SetDataBinding};
	__property DragCursor  = {default=-12};
	__property DragKind  = {default=0};
	__property DragMode  = {default=0};
	__property Enabled  = {default=1};
	__property ImeMode  = {default=3};
	__property ImeName ;
	__property ParentColor  = {default=1};
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
	__property OnDragDrop ;
	__property OnDragOver ;
	__property OnEditing ;
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
	/* TcxCustomCheckBox.Create */ inline __fastcall virtual TcxDBCheckBox(Classes::TComponent* AOwner)/* overload */ : Cxcheckbox::TcxCustomCheckBox(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomEdit.Destroy */ inline __fastcall virtual ~TcxDBCheckBox(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxDBCheckBox(HWND ParentWindow) : Cxcheckbox::TcxCustomCheckBox(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxDBComboBox;
class PASCALIMPLEMENTATION TcxDBComboBox : public Cxdropdownedit::TcxCustomComboBox 
{
	typedef Cxdropdownedit::TcxCustomComboBox inherited;
	
private:
	TcxDBTextEditDataBinding* __fastcall GetDataBinding(void);
	HIDESBASE void __fastcall SetDataBinding(TcxDBTextEditDataBinding* Value);
	MESSAGE void __fastcall CMGetDataLink(Messages::TMessage &Message);
	
protected:
	/* virtual class method */ virtual TMetaClass* __fastcall GetDataBindingClass(TMetaClass* vmt);
	
public:
	__property ItemIndex ;
	
__published:
	__property Anchors  = {default=3};
	__property AutoSize  = {default=1};
	__property BeepOnEnter  = {default=1};
	__property Constraints ;
	__property TcxDBTextEditDataBinding* DataBinding = {read=GetDataBinding, write=SetDataBinding};
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
	__property ShowHint ;
	__property Style ;
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=1};
	__property Visible  = {default=1};
	__property OnClick ;
	__property OnContextPopup ;
	__property OnDblClick ;
	__property OnDragDrop ;
	__property OnDragOver ;
	__property OnEditing ;
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
	/* TcxCustomComboBox.Create */ inline __fastcall virtual TcxDBComboBox(Classes::TComponent* AOwner)/* overload */ : Cxdropdownedit::TcxCustomComboBox(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomDropDownEdit.Destroy */ inline __fastcall virtual ~TcxDBComboBox(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxDBComboBox(HWND ParentWindow) : Cxdropdownedit::TcxCustomComboBox(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxDBPopupEdit;
class PASCALIMPLEMENTATION TcxDBPopupEdit : public Cxdropdownedit::TcxCustomPopupEdit 
{
	typedef Cxdropdownedit::TcxCustomPopupEdit inherited;
	
private:
	TcxDBTextEditDataBinding* __fastcall GetDataBinding(void);
	HIDESBASE void __fastcall SetDataBinding(TcxDBTextEditDataBinding* Value);
	MESSAGE void __fastcall CMGetDataLink(Messages::TMessage &Message);
	
protected:
	/* virtual class method */ virtual TMetaClass* __fastcall GetDataBindingClass(TMetaClass* vmt);
	
__published:
	__property Anchors  = {default=3};
	__property AutoSize  = {default=1};
	__property BeepOnEnter  = {default=1};
	__property Constraints ;
	__property TcxDBTextEditDataBinding* DataBinding = {read=GetDataBinding, write=SetDataBinding};
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
	__property ShowHint ;
	__property Style ;
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=1};
	__property Visible  = {default=1};
	__property OnClick ;
	__property OnContextPopup ;
	__property OnDblClick ;
	__property OnDragDrop ;
	__property OnDragOver ;
	__property OnEditing ;
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
	/* TcxCustomPopupEdit.Destroy */ inline __fastcall virtual ~TcxDBPopupEdit(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomDropDownEdit.Create */ inline __fastcall virtual TcxDBPopupEdit(Classes::TComponent* AOwner)/* overload */ : Cxdropdownedit::TcxCustomPopupEdit(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxDBPopupEdit(HWND ParentWindow) : Cxdropdownedit::TcxCustomPopupEdit(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxDBSpinEdit;
class PASCALIMPLEMENTATION TcxDBSpinEdit : public Cxspinedit::TcxCustomSpinEdit 
{
	typedef Cxspinedit::TcxCustomSpinEdit inherited;
	
private:
	TcxDBEditDataBinding* __fastcall GetDataBinding(void);
	HIDESBASE void __fastcall SetDataBinding(TcxDBEditDataBinding* Value);
	MESSAGE void __fastcall CMGetDataLink(Messages::TMessage &Message);
	
protected:
	/* virtual class method */ virtual TMetaClass* __fastcall GetDataBindingClass(TMetaClass* vmt);
	
public:
	__property Value ;
	
__published:
	__property Anchors  = {default=3};
	__property AutoSize  = {default=1};
	__property BeepOnEnter  = {default=1};
	__property Constraints ;
	__property TcxDBEditDataBinding* DataBinding = {read=GetDataBinding, write=SetDataBinding};
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
	__property ShowHint ;
	__property Style ;
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=1};
	__property Visible  = {default=1};
	__property OnClick ;
	__property OnContextPopup ;
	__property OnDblClick ;
	__property OnDragDrop ;
	__property OnDragOver ;
	__property OnEditing ;
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
	/* TcxCustomSpinEdit.Create */ inline __fastcall virtual TcxDBSpinEdit(Classes::TComponent* AOwner)/* overload */ : Cxspinedit::TcxCustomSpinEdit(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomMaskEdit.Destroy */ inline __fastcall virtual ~TcxDBSpinEdit(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxDBSpinEdit(HWND ParentWindow) : Cxspinedit::TcxCustomSpinEdit(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxDBTimeEdit;
class PASCALIMPLEMENTATION TcxDBTimeEdit : public Cxtimeedit::TcxCustomTimeEdit 
{
	typedef Cxtimeedit::TcxCustomTimeEdit inherited;
	
private:
	TcxDBEditDataBinding* __fastcall GetDataBinding(void);
	HIDESBASE void __fastcall SetDataBinding(TcxDBEditDataBinding* Value);
	MESSAGE void __fastcall CMGetDataLink(Messages::TMessage &Message);
	
protected:
	/* virtual class method */ virtual TMetaClass* __fastcall GetDataBindingClass(TMetaClass* vmt);
	
public:
	__property Time ;
	
__published:
	__property Anchors  = {default=3};
	__property AutoSize  = {default=1};
	__property BeepOnEnter  = {default=1};
	__property Constraints ;
	__property TcxDBEditDataBinding* DataBinding = {read=GetDataBinding, write=SetDataBinding};
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
	__property ShowHint ;
	__property Style ;
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=1};
	__property Visible  = {default=1};
	__property OnClick ;
	__property OnContextPopup ;
	__property OnDblClick ;
	__property OnDragDrop ;
	__property OnDragOver ;
	__property OnEditing ;
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
	/* TcxCustomSpinEdit.Create */ inline __fastcall virtual TcxDBTimeEdit(Classes::TComponent* AOwner)/* overload */ : Cxtimeedit::TcxCustomTimeEdit(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomMaskEdit.Destroy */ inline __fastcall virtual ~TcxDBTimeEdit(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxDBTimeEdit(HWND ParentWindow) : Cxtimeedit::TcxCustomTimeEdit(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxDBBlobEdit;
class PASCALIMPLEMENTATION TcxDBBlobEdit : public Cxblobedit::TcxCustomBlobEdit 
{
	typedef Cxblobedit::TcxCustomBlobEdit inherited;
	
private:
	TcxDBEditDataBinding* __fastcall GetDataBinding(void);
	HIDESBASE void __fastcall SetDataBinding(const TcxDBEditDataBinding* Value);
	MESSAGE void __fastcall CMGetDataLink(Messages::TMessage &Message);
	
protected:
	/* virtual class method */ virtual TMetaClass* __fastcall GetDataBindingClass(TMetaClass* vmt);
	
__published:
	__property Anchors  = {default=3};
	__property AutoSize  = {default=1};
	__property BeepOnEnter  = {default=1};
	__property Constraints ;
	__property TcxDBEditDataBinding* DataBinding = {read=GetDataBinding, write=SetDataBinding};
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
	__property ShowHint ;
	__property Style ;
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=1};
	__property Visible  = {default=1};
	__property OnClick ;
	__property OnDblClick ;
	__property OnDragDrop ;
	__property OnDragOver ;
	__property OnEditing ;
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
	__property BiDiMode ;
	__property ParentBiDiMode  = {default=1};
	__property OnEndDock ;
	__property OnStartDock ;
public:
	#pragma option push -w-inl
	/* TcxCustomBlobEdit.Create */ inline __fastcall virtual TcxDBBlobEdit(Classes::TComponent* AOwner)/* overload */ : Cxblobedit::TcxCustomBlobEdit(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomBlobEdit.Destroy */ inline __fastcall virtual ~TcxDBBlobEdit(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxDBBlobEdit(HWND ParentWindow) : Cxblobedit::TcxCustomBlobEdit(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxDBCalcEdit;
class PASCALIMPLEMENTATION TcxDBCalcEdit : public Cxcalc::TcxCustomCalcEdit 
{
	typedef Cxcalc::TcxCustomCalcEdit inherited;
	
private:
	TcxDBEditDataBinding* __fastcall GetDataBinding(void);
	HIDESBASE void __fastcall SetDataBinding(const TcxDBEditDataBinding* Value);
	MESSAGE void __fastcall CMGetDataLink(Messages::TMessage &Message);
	
protected:
	/* virtual class method */ virtual TMetaClass* __fastcall GetDataBindingClass(TMetaClass* vmt);
	
public:
	__property Value ;
	
__published:
	__property Anchors  = {default=3};
	__property AutoSize  = {default=1};
	__property BeepOnEnter  = {default=1};
	__property Constraints ;
	__property TcxDBEditDataBinding* DataBinding = {read=GetDataBinding, write=SetDataBinding};
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
	__property ShowHint ;
	__property Style ;
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=1};
	__property Visible  = {default=1};
	__property OnClick ;
	__property OnDblClick ;
	__property OnDragDrop ;
	__property OnDragOver ;
	__property OnEditing ;
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
	__property BiDiMode ;
	__property ParentBiDiMode  = {default=1};
	__property OnEndDock ;
	__property OnStartDock ;
public:
	#pragma option push -w-inl
	/* TcxCustomCalcEdit.Create */ inline __fastcall virtual TcxDBCalcEdit(Classes::TComponent* AOwner)/* overload */ : Cxcalc::TcxCustomCalcEdit(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomCalcEdit.Destroy */ inline __fastcall virtual ~TcxDBCalcEdit(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxDBCalcEdit(HWND ParentWindow) : Cxcalc::TcxCustomCalcEdit(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxDBDateEdit;
class PASCALIMPLEMENTATION TcxDBDateEdit : public Cxcalendar::TcxCustomDateEdit 
{
	typedef Cxcalendar::TcxCustomDateEdit inherited;
	
private:
	TcxDBEditDataBinding* __fastcall GetDataBinding(void);
	HIDESBASE void __fastcall SetDataBinding(const TcxDBEditDataBinding* Value);
	MESSAGE void __fastcall CMGetDataLink(Messages::TMessage &Message);
	
protected:
	/* virtual class method */ virtual TMetaClass* __fastcall GetDataBindingClass(TMetaClass* vmt);
	
public:
	__property Date ;
	
__published:
	__property Anchors  = {default=3};
	__property AutoSize  = {default=1};
	__property BeepOnEnter  = {default=1};
	__property Constraints ;
	__property TcxDBEditDataBinding* DataBinding = {read=GetDataBinding, write=SetDataBinding};
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
	__property ShowHint ;
	__property Style ;
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=1};
	__property Visible  = {default=1};
	__property OnClick ;
	__property OnDblClick ;
	__property OnDragDrop ;
	__property OnDragOver ;
	__property OnEditing ;
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
	__property BiDiMode ;
	__property ParentBiDiMode  = {default=1};
	__property OnEndDock ;
	__property OnStartDock ;
public:
	#pragma option push -w-inl
	/* TcxCustomDateEdit.Create */ inline __fastcall virtual TcxDBDateEdit(Classes::TComponent* AOwner)/* overload */ : Cxcalendar::TcxCustomDateEdit(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomDateEdit.Destroy */ inline __fastcall virtual ~TcxDBDateEdit(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxDBDateEdit(HWND ParentWindow) : Cxcalendar::TcxCustomDateEdit(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxDBCurrencyEdit;
class PASCALIMPLEMENTATION TcxDBCurrencyEdit : public Cxcurrencyedit::TcxCustomCurrencyEdit 
{
	typedef Cxcurrencyedit::TcxCustomCurrencyEdit inherited;
	
private:
	TcxDBEditDataBinding* __fastcall GetDataBinding(void);
	HIDESBASE void __fastcall SetDataBinding(const TcxDBEditDataBinding* Value);
	MESSAGE void __fastcall CMGetDataLink(Messages::TMessage &Message);
	
protected:
	/* virtual class method */ virtual TMetaClass* __fastcall GetDataBindingClass(TMetaClass* vmt);
	
public:
	__property Value ;
	
__published:
	__property Anchors  = {default=3};
	__property AutoSize  = {default=1};
	__property BeepOnEnter  = {default=1};
	__property Constraints ;
	__property TcxDBEditDataBinding* DataBinding = {read=GetDataBinding, write=SetDataBinding};
	__property DragCursor  = {default=-12};
	__property DragKind  = {default=0};
	__property DragMode  = {default=0};
	__property Enabled  = {default=1};
	__property ImeMode  = {default=3};
	__property ImeName ;
	__property ParentColor  = {default=0};
	__property ParentFont  = {default=1};
	__property ParentShowHint  = {default=1};
	__property Properties ;
	__property ShowHint ;
	__property Style ;
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=1};
	__property Visible  = {default=1};
	__property OnClick ;
	__property OnDblClick ;
	__property OnEditing ;
	__property OnEnter ;
	__property OnExit ;
	__property OnKeyDown ;
	__property OnKeyPress ;
	__property OnKeyUp ;
	__property OnMouseDown ;
	__property OnMouseMove ;
	__property OnMouseUp ;
	__property BiDiMode ;
	__property ParentBiDiMode  = {default=1};
	__property OnEndDock ;
	__property OnStartDock ;
public:
	#pragma option push -w-inl
	/* TcxCustomCurrencyEdit.Create */ inline __fastcall virtual TcxDBCurrencyEdit(Classes::TComponent* AOwner)/* overload */ : Cxcurrencyedit::TcxCustomCurrencyEdit(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomCurrencyEdit.Destroy */ inline __fastcall virtual ~TcxDBCurrencyEdit(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxDBCurrencyEdit(HWND ParentWindow) : Cxcurrencyedit::TcxCustomCurrencyEdit(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxDBHyperLinkEdit;
class PASCALIMPLEMENTATION TcxDBHyperLinkEdit : public Cxhyperlinkedit::TcxCustomHyperLinkEdit 
{
	typedef Cxhyperlinkedit::TcxCustomHyperLinkEdit inherited;
	
private:
	TcxDBTextEditDataBinding* __fastcall GetDataBinding(void);
	HIDESBASE void __fastcall SetDataBinding(const TcxDBTextEditDataBinding* Value);
	MESSAGE void __fastcall CMGetDataLink(Messages::TMessage &Message);
	
protected:
	/* virtual class method */ virtual TMetaClass* __fastcall GetDataBindingClass(TMetaClass* vmt);
	
__published:
	__property Anchors  = {default=3};
	__property AutoSize  = {default=1};
	__property BeepOnEnter  = {default=1};
	__property Constraints ;
	__property TcxDBTextEditDataBinding* DataBinding = {read=GetDataBinding, write=SetDataBinding};
	__property DragCursor  = {default=-12};
	__property DragKind  = {default=0};
	__property DragMode  = {default=0};
	__property Enabled  = {default=1};
	__property ImeMode  = {default=3};
	__property ImeName ;
	__property ParentColor  = {default=0};
	__property ParentFont  = {default=1};
	__property ParentShowHint  = {default=1};
	__property Properties ;
	__property ShowHint ;
	__property Style ;
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=1};
	__property Visible  = {default=1};
	__property OnClick ;
	__property OnDblClick ;
	__property OnEditing ;
	__property OnEnter ;
	__property OnExit ;
	__property OnKeyDown ;
	__property OnKeyPress ;
	__property OnKeyUp ;
	__property OnMouseDown ;
	__property OnMouseMove ;
	__property OnMouseUp ;
	__property BiDiMode ;
	__property ParentBiDiMode  = {default=1};
	__property OnEndDock ;
	__property OnStartDock ;
public:
	#pragma option push -w-inl
	/* TcxCustomTextEdit.Create */ inline __fastcall virtual TcxDBHyperLinkEdit(Classes::TComponent* AOwner)/* overload */ : Cxhyperlinkedit::TcxCustomHyperLinkEdit(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomTextEdit.Destroy */ inline __fastcall virtual ~TcxDBHyperLinkEdit(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxDBHyperLinkEdit(HWND ParentWindow) : Cxhyperlinkedit::TcxCustomHyperLinkEdit(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxDBImage;
class PASCALIMPLEMENTATION TcxDBImage : public Cximage::TcxCustomImage 
{
	typedef Cximage::TcxCustomImage inherited;
	
private:
	TcxDBEditDataBinding* __fastcall GetDataBinding(void);
	HIDESBASE void __fastcall SetDataBinding(const TcxDBEditDataBinding* Value);
	MESSAGE void __fastcall CMGetDataLink(Messages::TMessage &Message);
	
protected:
	/* virtual class method */ virtual TMetaClass* __fastcall GetDataBindingClass(TMetaClass* vmt);
	
public:
	__property Picture ;
	
__published:
	__property Align  = {default=0};
	__property Anchors  = {default=3};
	__property AutoSize  = {default=0};
	__property Constraints ;
	__property TcxDBEditDataBinding* DataBinding = {read=GetDataBinding, write=SetDataBinding};
	__property DragCursor  = {default=-12};
	__property DragKind  = {default=0};
	__property DragMode  = {default=0};
	__property Enabled  = {default=1};
	__property ImeMode  = {default=3};
	__property ImeName ;
	__property ParentColor  = {default=0};
	__property Properties ;
	__property Style ;
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=1};
	__property Visible  = {default=1};
	__property OnClick ;
	__property OnDblClick ;
	__property OnEditing ;
	__property OnEnter ;
	__property OnExit ;
	__property OnKeyDown ;
	__property OnKeyPress ;
	__property OnKeyUp ;
	__property OnMouseDown ;
	__property OnMouseMove ;
	__property OnMouseUp ;
	__property OnEndDock ;
	__property OnStartDock ;
public:
	#pragma option push -w-inl
	/* TcxCustomImage.Create */ inline __fastcall virtual TcxDBImage(Classes::TComponent* AOwner)/* overload */ : Cximage::TcxCustomImage(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomImage.Destroy */ inline __fastcall virtual ~TcxDBImage(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxDBImage(HWND ParentWindow) : Cximage::TcxCustomImage(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxDBImageComboBox;
class PASCALIMPLEMENTATION TcxDBImageComboBox : public Cximagecombobox::TcxCustomImageComboBox 
{
	typedef Cximagecombobox::TcxCustomImageComboBox inherited;
	
private:
	TcxDBEditDataBinding* __fastcall GetDataBinding(void);
	HIDESBASE void __fastcall SetDataBinding(const TcxDBEditDataBinding* Value);
	MESSAGE void __fastcall CMGetDataLink(Messages::TMessage &Message);
	
protected:
	/* virtual class method */ virtual TMetaClass* __fastcall GetDataBindingClass(TMetaClass* vmt);
	
public:
	__property ItemIndex ;
	
__published:
	__property Anchors  = {default=3};
	__property AutoSize  = {default=1};
	__property BeepOnEnter  = {default=1};
	__property Constraints ;
	__property TcxDBEditDataBinding* DataBinding = {read=GetDataBinding, write=SetDataBinding};
	__property DragCursor  = {default=-12};
	__property DragKind  = {default=0};
	__property DragMode  = {default=0};
	__property Enabled  = {default=1};
	__property ImeMode  = {default=3};
	__property ImeName ;
	__property ParentColor  = {default=0};
	__property ParentFont  = {default=1};
	__property ParentShowHint  = {default=1};
	__property Properties ;
	__property ShowHint ;
	__property Style ;
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=1};
	__property Visible  = {default=1};
	__property OnClick ;
	__property OnDblClick ;
	__property OnEditing ;
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
	/* TcxCustomComboBox.Create */ inline __fastcall virtual TcxDBImageComboBox(Classes::TComponent* AOwner)/* overload */ : Cximagecombobox::TcxCustomImageComboBox(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomDropDownEdit.Destroy */ inline __fastcall virtual ~TcxDBImageComboBox(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxDBImageComboBox(HWND ParentWindow) : Cximagecombobox::TcxCustomImageComboBox(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxDBMRUEdit;
class PASCALIMPLEMENTATION TcxDBMRUEdit : public Cxmruedit::TcxCustomMRUEdit 
{
	typedef Cxmruedit::TcxCustomMRUEdit inherited;
	
private:
	TcxDBTextEditDataBinding* __fastcall GetDataBinding(void);
	HIDESBASE void __fastcall SetDataBinding(const TcxDBTextEditDataBinding* Value);
	MESSAGE void __fastcall CMGetDataLink(Messages::TMessage &Message);
	
protected:
	/* virtual class method */ virtual TMetaClass* __fastcall GetDataBindingClass(TMetaClass* vmt);
	
__published:
	__property Anchors  = {default=3};
	__property AutoSize  = {default=1};
	__property BeepOnEnter  = {default=1};
	__property Constraints ;
	__property TcxDBTextEditDataBinding* DataBinding = {read=GetDataBinding, write=SetDataBinding};
	__property DragCursor  = {default=-12};
	__property DragKind  = {default=0};
	__property DragMode  = {default=0};
	__property Enabled  = {default=1};
	__property ImeMode  = {default=3};
	__property ImeName ;
	__property ParentColor  = {default=0};
	__property ParentFont  = {default=1};
	__property ParentShowHint  = {default=1};
	__property Properties ;
	__property ShowHint ;
	__property Style ;
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=1};
	__property Visible  = {default=1};
	__property OnClick ;
	__property OnDblClick ;
	__property OnEditing ;
	__property OnEnter ;
	__property OnExit ;
	__property OnKeyDown ;
	__property OnKeyPress ;
	__property OnKeyUp ;
	__property OnMouseDown ;
	__property OnMouseMove ;
	__property OnMouseUp ;
	__property BiDiMode ;
	__property ParentBiDiMode  = {default=1};
	__property OnEndDock ;
	__property OnStartDock ;
public:
	#pragma option push -w-inl
	/* TcxCustomComboBox.Create */ inline __fastcall virtual TcxDBMRUEdit(Classes::TComponent* AOwner)/* overload */ : Cxmruedit::TcxCustomMRUEdit(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomDropDownEdit.Destroy */ inline __fastcall virtual ~TcxDBMRUEdit(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxDBMRUEdit(HWND ParentWindow) : Cxmruedit::TcxCustomMRUEdit(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxDBRadioGroup;
class PASCALIMPLEMENTATION TcxDBRadioGroup : public Cxradiogroup::TcxCustomRadioGroup 
{
	typedef Cxradiogroup::TcxCustomRadioGroup inherited;
	
private:
	TcxDBEditDataBinding* __fastcall GetDataBinding(void);
	HIDESBASE void __fastcall SetDataBinding(const TcxDBEditDataBinding* Value);
	MESSAGE void __fastcall CMGetDataLink(Messages::TMessage &Message);
	
protected:
	/* virtual class method */ virtual TMetaClass* __fastcall GetDataBindingClass(TMetaClass* vmt);
	
__published:
	__property Align  = {default=0};
	__property Anchors  = {default=3};
	__property Caption ;
	__property Constraints ;
	__property TcxDBEditDataBinding* DataBinding = {read=GetDataBinding, write=SetDataBinding};
	__property DragMode  = {default=0};
	__property Enabled  = {default=1};
	__property ParentBiDiMode  = {default=1};
	__property ParentColor  = {default=1};
	__property ParentCtl3D  = {default=1};
	__property ParentFont  = {default=1};
	__property ParentShowHint  = {default=1};
	__property PopupMenu ;
	__property Properties ;
	__property ShowHint ;
	__property Style ;
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=0};
	__property Visible  = {default=1};
	__property BiDiMode ;
	__property Ctl3D ;
	__property DragCursor  = {default=-12};
	__property DragKind  = {default=0};
	__property OnClick ;
	__property OnDragDrop ;
	__property OnDragOver ;
	__property OnEndDrag ;
	__property OnEnter ;
	__property OnExit ;
	__property OnStartDrag ;
	__property OnContextPopup ;
	__property OnEndDock ;
	__property OnStartDock ;
public:
	#pragma option push -w-inl
	/* TcxCustomRadioGroup.Create */ inline __fastcall virtual TcxDBRadioGroup(Classes::TComponent* AOwner)/* overload */ : Cxradiogroup::TcxCustomRadioGroup(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomRadioGroup.Destroy */ inline __fastcall virtual ~TcxDBRadioGroup(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxDBRadioGroup(HWND ParentWindow) : Cxradiogroup::TcxCustomRadioGroup(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxDBListBox;
class PASCALIMPLEMENTATION TcxDBListBox : public Cxlistbox::TcxListBox 
{
	typedef Cxlistbox::TcxListBox inherited;
	
private:
	TcxDBDataBinding* __fastcall GetDataBinding(void);
	void __fastcall SetDataBinding(TcxDBDataBinding* Value);
	MESSAGE void __fastcall CMGetDataLink(Messages::TMessage &Message);
	
protected:
	virtual TMetaClass* __fastcall GetDataBindingClass(void);
	
__published:
	__property TcxDBDataBinding* DataBinding = {read=GetDataBinding, write=SetDataBinding};
	__property ReadOnly ;
public:
	#pragma option push -w-inl
	/* TcxListBox.Create */ inline __fastcall virtual TcxDBListBox(Classes::TComponent* AOwner) : Cxlistbox::TcxListBox(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxListBox.Destroy */ inline __fastcall virtual ~TcxDBListBox(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxDBListBox(HWND ParentWindow) : Cxlistbox::TcxListBox(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxdbedit */
using namespace Cxdbedit;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxDBEdit
