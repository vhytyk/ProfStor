// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxMRUEdit.pas' rev: 6.00

#ifndef cxMRUEditHPP
#define cxMRUEditHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Menus.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <cxTextEdit.hpp>	// Pascal unit
#include <cxMaskEdit.hpp>	// Pascal unit
#include <cxDropDownEdit.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Types.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxmruedit
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxCustomMRUEditProperties;
class PASCALIMPLEMENTATION TcxCustomMRUEditProperties : public Cxdropdownedit::TcxCustomComboBoxProperties 
{
	typedef Cxdropdownedit::TcxCustomComboBoxProperties inherited;
	
private:
	int FMaxItemCount;
	bool FShowEllipsis;
	Classes::TNotifyEvent FOnButtonClick;
	void __fastcall CheckItemCount(void);
	void __fastcall SetMaxItemCount(int Value);
	void __fastcall SetShowEllipsis(bool Value);
	
protected:
	__property int MaxItemCount = {read=FMaxItemCount, write=SetMaxItemCount, default=0};
	__property bool ShowEllipsis = {read=FShowEllipsis, write=SetShowEllipsis, default=1};
	__property Classes::TNotifyEvent OnButtonClick = {read=FOnButtonClick, write=FOnButtonClick};
	
public:
	__fastcall virtual TcxCustomMRUEditProperties(Classes::TPersistent* AOwner);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	/* virtual class method */ virtual TMetaClass* __fastcall GetContainerClass(TMetaClass* vmt);
	virtual void __fastcall Update(Cxedit::TcxCustomEditProperties* AProperties);
public:
	#pragma option push -w-inl
	/* TcxCustomMaskEditProperties.Destroy */ inline __fastcall virtual ~TcxCustomMRUEditProperties(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxMRUEditProperties;
class PASCALIMPLEMENTATION TcxMRUEditProperties : public TcxCustomMRUEditProperties 
{
	typedef TcxCustomMRUEditProperties inherited;
	
__published:
	__property Alignment ;
	__property AutoSelect  = {default=1};
	__property BeepOnError  = {default=0};
	__property ButtonGlyph ;
	__property CaseInsensitive  = {default=1};
	__property CharCase  = {default=0};
	__property ClickKey  = {default=16397};
	__property DropDownAutoWidth  = {default=1};
	__property DropDownListStyle  = {default=1};
	__property DropDownRows  = {default=8};
	__property DropDownSizeable  = {default=0};
	__property DropDownWidth  = {default=0};
	__property EchoMode  = {default=0};
	__property HideSelection  = {default=1};
	__property IgnoreMaskBlank  = {default=0};
	__property ImmediateDropDown  = {default=1};
	__property ImmediatePost  = {default=0};
	__property ImmediateUpdateText  = {default=0};
	__property ItemHeight  = {default=0};
	__property LookupItems ;
	__property MaskKind  = {default=0};
	__property EditMask ;
	__property MaxItemCount  = {default=0};
	__property MaxLength ;
	__property OEMConvert  = {default=0};
	__property PopupAlignment  = {default=0};
	__property ReadOnly ;
	__property Revertable  = {default=0};
	__property ShowEllipsis  = {default=1};
	__property UseLeftAlignmentOnEditing ;
	__property OnButtonClick ;
	__property OnChange ;
	__property OnCloseUp ;
	__property OnDrawItem ;
	__property OnEditValueChanged ;
	__property OnInitPopup ;
	__property OnMeasureItem ;
	__property OnPopup ;
	__property OnValidate ;
public:
	#pragma option push -w-inl
	/* TcxCustomMRUEditProperties.Create */ inline __fastcall virtual TcxMRUEditProperties(Classes::TPersistent* AOwner) : TcxCustomMRUEditProperties(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomMaskEditProperties.Destroy */ inline __fastcall virtual ~TcxMRUEditProperties(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomMRUEdit;
class PASCALIMPLEMENTATION TcxCustomMRUEdit : public Cxdropdownedit::TcxCustomComboBox 
{
	typedef Cxdropdownedit::TcxCustomComboBox inherited;
	
private:
	AnsiString FSaveText;
	HIDESBASE TcxMRUEditProperties* __fastcall GetProperties(void);
	HIDESBASE void __fastcall SetProperties(const TcxMRUEditProperties* Value);
	
protected:
	virtual void __fastcall BeforePosting(void);
	virtual void __fastcall DoButtonClick(int AButtonVisibleIndex);
	DYNAMIC void __fastcall DoEnter(void);
	virtual void __fastcall PropertiesChanged(System::TObject* Sender);
	__property TcxMRUEditProperties* Properties = {read=GetProperties, write=SetProperties};
	
public:
	virtual void __fastcall AddItem(const AnsiString Value);
	virtual bool __fastcall Deactivate(void);
	/* virtual class method */ virtual TMetaClass* __fastcall GetPropertiesClass(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TcxCustomComboBox.Create */ inline __fastcall virtual TcxCustomMRUEdit(Classes::TComponent* AOwner)/* overload */ : Cxdropdownedit::TcxCustomComboBox(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomDropDownEdit.Destroy */ inline __fastcall virtual ~TcxCustomMRUEdit(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomMRUEdit(HWND ParentWindow) : Cxdropdownedit::TcxCustomComboBox(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxMRUEdit;
class PASCALIMPLEMENTATION TcxMRUEdit : public TcxCustomMRUEdit 
{
	typedef TcxCustomMRUEdit inherited;
	
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
	__property ShowHint ;
	__property Style ;
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=1};
	__property Text ;
	__property Visible  = {default=1};
	__property OnClick ;
	__property OnContextPopup ;
	__property OnDblClick ;
	__property OnDragDrop ;
	__property OnDragOver ;
	__property OnEditing ;
	__property OnEndDock ;
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
	__property OnStartDock ;
	__property OnStartDrag ;
public:
	#pragma option push -w-inl
	/* TcxCustomComboBox.Create */ inline __fastcall virtual TcxMRUEdit(Classes::TComponent* AOwner)/* overload */ : TcxCustomMRUEdit(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomDropDownEdit.Destroy */ inline __fastcall virtual ~TcxMRUEdit(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxMRUEdit(HWND ParentWindow) : TcxCustomMRUEdit(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxmruedit */
using namespace Cxmruedit;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxMRUEdit
