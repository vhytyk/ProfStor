// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxDBLookupComboBox.pas' rev: 6.00

#ifndef cxDBLookupComboBoxHPP
#define cxDBLookupComboBoxHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Menus.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <cxTextEdit.hpp>	// Pascal unit
#include <cxMaskEdit.hpp>	// Pascal unit
#include <cxDropDownEdit.hpp>	// Pascal unit
#include <cxLookupDBGrid.hpp>	// Pascal unit
#include <cxLookupGrid.hpp>	// Pascal unit
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
#include <cxClasses.hpp>	// Pascal unit
#include <DB.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Variants.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxdblookupcombobox
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxLookupComboBoxProperties;
class PASCALIMPLEMENTATION TcxLookupComboBoxProperties : public Cxdblookupedit::TcxCustomDBLookupEditProperties 
{
	typedef Cxdblookupedit::TcxCustomDBLookupEditProperties inherited;
	
private:
	Cxlookupdbgrid::TcxLookupDBGrid* FGrid;
	Cxlookupdbgrid::TcxLookupDBGrid* __fastcall GetGrid(void);
	bool __fastcall GetGridMode(void);
	Cxlookupdbgrid::TcxLookupDBGridColumns* __fastcall GetListColumns(void);
	Cxlookupgrid::TcxLookupGridOptions* __fastcall GetListOptions(void);
	Db::TDataSource* __fastcall GetListSource(void);
	Classes::TNotifyEvent __fastcall GetOnSortingChanged();
	void __fastcall SetGridMode(bool Value);
	void __fastcall SetListColumns(Cxlookupdbgrid::TcxLookupDBGridColumns* Value);
	void __fastcall SetListOptions(Cxlookupgrid::TcxLookupGridOptions* Value);
	void __fastcall SetListSource(Db::TDataSource* Value);
	void __fastcall SetOnSortingChanged(Classes::TNotifyEvent Value);
	
protected:
	virtual void __fastcall ListOptionsChanged(System::TObject* Sender);
	virtual int __fastcall GetLookupGridColumnCount(void);
	virtual Controls::TWinControl* __fastcall GetLookupGridControl(void);
	virtual Cxcustomdata::TcxCustomDataController* __fastcall GetLookupGridDataController(void);
	virtual int __fastcall GetLookupGridVisualAreaPreferredWidth(void);
	virtual int __fastcall GetLookupGridNearestPopupHeight(int AHeight);
	virtual int __fastcall GetLookupGridPopupHeight(int ADropDownRowCount);
	virtual bool __fastcall IsLookupGridMouseOverList(const Types::TPoint &P);
	virtual void __fastcall LookupGridInitEvents(Classes::TNotifyEvent AOnClick, Classes::TNotifyEvent AOnFocusedRowChanged, Cxlookupedit::TcxLookupGridCloseUpEvent AOnCloseUp);
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
	__fastcall virtual TcxLookupComboBoxProperties(Classes::TPersistent* AOwner);
	__fastcall virtual ~TcxLookupComboBoxProperties(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	/* virtual class method */ virtual TMetaClass* __fastcall GetContainerClass(TMetaClass* vmt);
	__property Cxlookupdbgrid::TcxLookupDBGrid* Grid = {read=GetGrid};
	
__published:
	__property Alignment ;
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
	__property bool GridMode = {read=GetGridMode, write=SetGridMode, default=0};
	__property HideSelection  = {default=1};
	__property ImmediateDropDown  = {default=1};
	__property ImmediatePost  = {default=0};
	__property IncrementalFiltering  = {default=1};
	__property KeyFieldNames ;
	__property Cxlookupdbgrid::TcxLookupDBGridColumns* ListColumns = {read=GetListColumns, write=SetListColumns};
	__property ListFieldNames ;
	__property ListFieldIndex  = {default=0};
	__property Cxlookupgrid::TcxLookupGridOptions* ListOptions = {read=GetListOptions, write=SetListOptions};
	__property Db::TDataSource* ListSource = {read=GetListSource, write=SetListSource};
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
	__property Classes::TNotifyEvent OnSortingChanged = {read=GetOnSortingChanged, write=SetOnSortingChanged};
	__property OnValidate ;
};


class DELPHICLASS TcxCustomLookupComboBox;
class PASCALIMPLEMENTATION TcxCustomLookupComboBox : public Cxdblookupedit::TcxCustomDBLookupEdit 
{
	typedef Cxdblookupedit::TcxCustomDBLookupEdit inherited;
	
private:
	HIDESBASE TcxLookupComboBoxProperties* __fastcall GetProperties(void);
	HIDESBASE void __fastcall SetProperties(TcxLookupComboBoxProperties* Value);
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetPropertiesClass(TMetaClass* vmt);
	__property TcxLookupComboBoxProperties* Properties = {read=GetProperties, write=SetProperties};
	__property EditValue ;
	__property Text ;
public:
	#pragma option push -w-inl
	/* TcxCustomLookupEdit.Create */ inline __fastcall virtual TcxCustomLookupComboBox(Classes::TComponent* AOwner)/* overload */ : Cxdblookupedit::TcxCustomDBLookupEdit(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomDropDownEdit.Destroy */ inline __fastcall virtual ~TcxCustomLookupComboBox(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomLookupComboBox(HWND ParentWindow) : Cxdblookupedit::TcxCustomDBLookupEdit(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxLookupComboBox;
class PASCALIMPLEMENTATION TcxLookupComboBox : public TcxCustomLookupComboBox 
{
	typedef TcxCustomLookupComboBox inherited;
	
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
	/* TcxCustomLookupEdit.Create */ inline __fastcall virtual TcxLookupComboBox(Classes::TComponent* AOwner)/* overload */ : TcxCustomLookupComboBox(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomDropDownEdit.Destroy */ inline __fastcall virtual ~TcxLookupComboBox(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxLookupComboBox(HWND ParentWindow) : TcxCustomLookupComboBox(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxDBLookupComboBox;
class PASCALIMPLEMENTATION TcxDBLookupComboBox : public TcxCustomLookupComboBox 
{
	typedef TcxCustomLookupComboBox inherited;
	
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
	/* TcxCustomLookupEdit.Create */ inline __fastcall virtual TcxDBLookupComboBox(Classes::TComponent* AOwner)/* overload */ : TcxCustomLookupComboBox(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomDropDownEdit.Destroy */ inline __fastcall virtual ~TcxDBLookupComboBox(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxDBLookupComboBox(HWND ParentWindow) : TcxCustomLookupComboBox(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxdblookupcombobox */
using namespace Cxdblookupcombobox;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxDBLookupComboBox
