// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxGroupBox.pas' rev: 6.00

#ifndef cxGroupBoxHPP
#define cxGroupBoxHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Menus.hpp>	// Pascal unit
#include <cxEditPaintUtils.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <cxLookAndFeels.hpp>	// Pascal unit
#include <cxExtEditConsts.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxgroupbox
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TcxAlignment { alTopLeft, alTopCenter, alTopRight, alBottomLeft, alBottomCenter, alBottomRight, alLeftTop, alLeftCenter, alLeftBottom, alRightTop, alRightCenter, alRightBottom, alCenterCenter };
#pragma option pop

class DELPHICLASS TcxCustomGroupBox;
class PASCALIMPLEMENTATION TcxCustomGroupBox : public Cxcontrols::TcxControl 
{
	typedef Cxcontrols::TcxControl inherited;
	
private:
	TcxAlignment FAlignment;
	Graphics::TColor FCaptionBkColor;
	void __fastcall SetAlignment(TcxAlignment Value);
	void __fastcall SetCaptionBkColor(Graphics::TColor Value);
	HIDESBASE MESSAGE void __fastcall WMEraseBkgnd(Messages::TWMEraseBkgnd &Message);
	MESSAGE void __fastcall WMPrintClient(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMDialogChar(Messages::TWMKey &Message);
	MESSAGE void __fastcall CMTextChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMParentColorChanged(Messages::TMessage &Message);
	
protected:
	virtual void __fastcall AdjustClientRect(Types::TRect &Rect);
	virtual void __fastcall LookAndFeelChanged(Cxlookandfeels::TcxLookAndFeel* Sender, Cxlookandfeels::TcxLookAndFeelValues AChangedValues);
	virtual bool __fastcall NeedsScrollBars(void);
	virtual void __fastcall Paint(void);
	__property TcxAlignment Alignment = {read=FAlignment, write=SetAlignment, nodefault};
	__property Graphics::TColor CaptionBkColor = {read=FCaptionBkColor, write=SetCaptionBkColor, nodefault};
	
public:
	__fastcall virtual TcxCustomGroupBox(Classes::TComponent* AOwner);
public:
	#pragma option push -w-inl
	/* TcxControl.Destroy */ inline __fastcall virtual ~TcxCustomGroupBox(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomGroupBox(HWND ParentWindow) : Cxcontrols::TcxControl(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGroupBox;
class PASCALIMPLEMENTATION TcxGroupBox : public TcxCustomGroupBox 
{
	typedef TcxCustomGroupBox inherited;
	
__published:
	__property Align  = {default=0};
	__property Alignment ;
	__property Anchors  = {default=3};
	__property Caption ;
	__property CaptionBkColor  = {default=-2147483633};
	__property Color  = {default=-2147483643};
	__property Constraints ;
	__property DragMode  = {default=0};
	__property Enabled  = {default=1};
	__property Font ;
	__property LookAndFeel ;
	__property ParentBiDiMode  = {default=1};
	__property ParentColor  = {default=1};
	__property ParentCtl3D  = {default=1};
	__property ParentFont  = {default=1};
	__property ParentShowHint  = {default=1};
	__property PopupMenu ;
	__property ShowHint ;
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=1};
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
	/* TcxCustomGroupBox.Create */ inline __fastcall virtual TcxGroupBox(Classes::TComponent* AOwner) : TcxCustomGroupBox(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxControl.Destroy */ inline __fastcall virtual ~TcxGroupBox(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxGroupBox(HWND ParentWindow) : TcxCustomGroupBox(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxgroupbox */
using namespace Cxgroupbox;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxGroupBox
