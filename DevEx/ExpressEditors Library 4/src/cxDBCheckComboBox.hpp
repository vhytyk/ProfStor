// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxDBCheckComboBox.pas' rev: 6.00

#ifndef cxDBCheckComboBoxHPP
#define cxDBCheckComboBoxHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Menus.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <cxTextEdit.hpp>	// Pascal unit
#include <cxMaskEdit.hpp>	// Pascal unit
#include <cxDropDownEdit.hpp>	// Pascal unit
#include <cxCheckComboBox.hpp>	// Pascal unit
#include <cxDBEdit.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxdbcheckcombobox
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxDBCheckComboBox;
class PASCALIMPLEMENTATION TcxDBCheckComboBox : public Cxcheckcombobox::TcxCustomCheckComboBox 
{
	typedef Cxcheckcombobox::TcxCustomCheckComboBox inherited;
	
private:
	Cxdbedit::TcxDBEditDataBinding* __fastcall GetDataBinding(void);
	HIDESBASE void __fastcall SetDataBinding(const Cxdbedit::TcxDBEditDataBinding* Value);
	MESSAGE void __fastcall CMGetDataLink(Messages::TMessage &Message);
	
protected:
	/* virtual class method */ virtual TMetaClass* __fastcall GetDataBindingClass(TMetaClass* vmt);
	
public:
	__property ItemIndex ;
	
__published:
	__property Cxdbedit::TcxDBEditDataBinding* DataBinding = {read=GetDataBinding, write=SetDataBinding};
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
	/* TcxCustomCheckComboBox.Create */ inline __fastcall virtual TcxDBCheckComboBox(Classes::TComponent* AOwner)/* overload */ : Cxcheckcombobox::TcxCustomCheckComboBox(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomCheckComboBox.Destroy */ inline __fastcall virtual ~TcxDBCheckComboBox(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxDBCheckComboBox(HWND ParentWindow) : Cxcheckcombobox::TcxCustomCheckComboBox(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxdbcheckcombobox */
using namespace Cxdbcheckcombobox;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxDBCheckComboBox
