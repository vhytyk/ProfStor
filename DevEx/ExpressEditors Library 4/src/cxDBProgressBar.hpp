// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxDBProgressBar.pas' rev: 6.00

#ifndef cxDBProgressBarHPP
#define cxDBProgressBarHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Menus.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <cxProgressBar.hpp>	// Pascal unit
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

namespace Cxdbprogressbar
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxDBProgressBar;
class PASCALIMPLEMENTATION TcxDBProgressBar : public Cxprogressbar::TcxCustomProgressBar 
{
	typedef Cxprogressbar::TcxCustomProgressBar inherited;
	
private:
	Cxdbedit::TcxDBEditDataBinding* __fastcall GetDataBinding(void);
	HIDESBASE void __fastcall SetDataBinding(const Cxdbedit::TcxDBEditDataBinding* Value);
	MESSAGE void __fastcall CMGetDataLink(Messages::TMessage &Message);
	
protected:
	/* virtual class method */ virtual TMetaClass* __fastcall GetDataBindingClass(TMetaClass* vmt);
	
__published:
	__property Cxdbedit::TcxDBEditDataBinding* DataBinding = {read=GetDataBinding, write=SetDataBinding};
	__property Anchors  = {default=3};
	__property AutoSize  = {default=1};
	__property Constraints ;
	__property DragMode  = {default=0};
	__property Enabled  = {default=1};
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
	__property DragCursor  = {default=-12};
	__property DragKind  = {default=0};
	__property ImeMode  = {default=3};
	__property ImeName ;
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
	/* TcxCustomProgressBar.Create */ inline __fastcall virtual TcxDBProgressBar(Classes::TComponent* AOwner)/* overload */ : Cxprogressbar::TcxCustomProgressBar(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomEdit.Destroy */ inline __fastcall virtual ~TcxDBProgressBar(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxDBProgressBar(HWND ParentWindow) : Cxprogressbar::TcxCustomProgressBar(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxdbprogressbar */
using namespace Cxdbprogressbar;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxDBProgressBar
