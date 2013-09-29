// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxDBCheckListBox.pas' rev: 6.00

#ifndef cxDBCheckListBoxHPP
#define cxDBCheckListBoxHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Menus.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <cxCheckListBox.hpp>	// Pascal unit
#include <cxVariants.hpp>	// Pascal unit
#include <cxDBEdit.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxDataUtils.hpp>	// Pascal unit
#include <cxDB.hpp>	// Pascal unit
#include <Variants.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxdbchecklistbox
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxDBCheckListBox;
class PASCALIMPLEMENTATION TcxDBCheckListBox : public Cxchecklistbox::TcxCustomCheckListBox 
{
	typedef Cxchecklistbox::TcxCustomCheckListBox inherited;
	
private:
	MESSAGE void __fastcall CMGetDataLink(Messages::TMessage &Message);
	
protected:
	virtual Cxdatautils::TcxCustomDataBinding* __fastcall GetDataBinding(void);
	virtual void __fastcall SetDataBinding(Cxdatautils::TcxCustomDataBinding* Value);
	/* virtual class method */ virtual TMetaClass* __fastcall GetDataBindingClass(TMetaClass* vmt);
	
public:
	__fastcall virtual TcxDBCheckListBox(Classes::TComponent* AOwner);
	
__published:
	__property Cxdatautils::TcxCustomDataBinding* DataBinding = {read=GetDataBinding, write=SetDataBinding};
	__property ReadOnly ;
	__property OnClickCheck ;
	__property AllowGrayed  = {default=0};
	__property OnCustomMapStateToEditValue ;
	__property OnCustomMapEditValueToState ;
	__property Align  = {default=0};
	__property Anchors  = {default=3};
	__property BiDiMode ;
	__property Columns ;
	__property Constraints ;
	__property DragCursor  = {default=-12};
	__property DragKind  = {default=0};
	__property DragMode  = {default=0};
	__property Glyph ;
	__property GlyphCount  = {default=6};
	__property Enabled  = {default=1};
	__property ImeMode  = {default=3};
	__property ImeName ;
	__property IntegralHeight ;
	__property Items ;
	__property ParentBiDiMode  = {default=1};
	__property ParentColor  = {default=1};
	__property ParentFont  = {default=1};
	__property ParentShowHint  = {default=1};
	__property PopupMenu ;
	__property ScrollWidth ;
	__property ShowHint ;
	__property Sorted ;
	__property Style ;
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=1};
	__property TabWidth ;
	__property Visible  = {default=1};
	__property AutoComplete ;
	__property OnClick ;
	__property OnDblClick ;
	__property OnDragDrop ;
	__property OnDragOver ;
	__property OnDrawItem ;
	__property OnEndDock ;
	__property OnEndDrag ;
	__property OnEnter ;
	__property OnExit ;
	__property OnKeyDown ;
	__property OnKeyPress ;
	__property OnKeyUp ;
	__property OnMeasureItem ;
	__property OnMouseDown ;
	__property OnMouseMove ;
	__property OnMouseUp ;
	__property OnStartDock ;
	__property OnStartDrag ;
	__property OnContextPopup ;
public:
	#pragma option push -w-inl
	/* TcxCustomCheckListBox.Destroy */ inline __fastcall virtual ~TcxDBCheckListBox(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxDBCheckListBox(HWND ParentWindow) : Cxchecklistbox::TcxCustomCheckListBox(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxdbchecklistbox */
using namespace Cxdbchecklistbox;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxDBCheckListBox
