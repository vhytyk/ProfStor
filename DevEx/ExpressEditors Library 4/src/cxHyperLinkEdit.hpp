// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxHyperLinkEdit.pas' rev: 6.00

#ifndef cxHyperLinkEditHPP
#define cxHyperLinkEditHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxTextEdit.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Types.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxhyperlinkedit
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxHyperLinkEditViewInfo;
class PASCALIMPLEMENTATION TcxHyperLinkEditViewInfo : public Cxtextedit::TcxCustomTextEditViewInfo 
{
	typedef Cxtextedit::TcxCustomTextEditViewInfo inherited;
	
public:
	Graphics::TColor LinkColor;
	bool SingleClick;
	virtual bool __fastcall IsHotTrack(void);
	virtual void __fastcall PrepareCanvasFont(Graphics::TFont* AFont);
public:
	#pragma option push -w-inl
	/* TcxCustomTextEditViewInfo.Destroy */ inline __fastcall virtual ~TcxHyperLinkEditViewInfo(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomEditViewInfo.Create */ inline __fastcall virtual TcxHyperLinkEditViewInfo(void) : Cxtextedit::TcxCustomTextEditViewInfo() { }
	#pragma option pop
	
};


class DELPHICLASS TcxHyperLinkEditViewData;
class PASCALIMPLEMENTATION TcxHyperLinkEditViewData : public Cxtextedit::TcxCustomTextEditViewData 
{
	typedef Cxtextedit::TcxCustomTextEditViewData inherited;
	
public:
	virtual void __fastcall Calculate(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ABounds, const Types::TPoint &P, Cxcontainer::TcxMouseButton Button, Classes::TShiftState Shift, Cxedit::TcxCustomEditViewInfo* AViewInfo, bool AIsMouseEvent);
public:
	#pragma option push -w-inl
	/* TcxCustomEditViewData.Create */ inline __fastcall virtual TcxHyperLinkEditViewData(Cxedit::TcxCustomEditProperties* AProperties, Cxcontainer::TcxContainerStyle* AStyle, bool AIsInplace) : Cxtextedit::TcxCustomTextEditViewData(AProperties, AStyle, AIsInplace) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxHyperLinkEditViewData(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomHyperLinkEditProperties;
class PASCALIMPLEMENTATION TcxCustomHyperLinkEditProperties : public Cxtextedit::TcxCustomTextEditProperties 
{
	typedef Cxtextedit::TcxCustomTextEditProperties inherited;
	
private:
	bool FSingleClick;
	Graphics::TColor FLinkColor;
	Classes::TNotifyEvent FOnStartClick;
	Classes::TShortCut FStartKey;
	void __fastcall SetLinkColor(const Graphics::TColor Value);
	void __fastcall SetSingleClick(bool Value);
	
protected:
	__property AutoSelect  = {default=0};
	__property Graphics::TColor LinkColor = {read=FLinkColor, write=SetLinkColor, default=16711680};
	__property bool SingleClick = {read=FSingleClick, write=SetSingleClick, default=0};
	__property Classes::TShortCut StartKey = {read=FStartKey, write=FStartKey, default=16397};
	__property Classes::TNotifyEvent OnStartClick = {read=FOnStartClick, write=FOnStartClick};
	
public:
	__fastcall virtual TcxCustomHyperLinkEditProperties(Classes::TPersistent* AOwner);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	/* virtual class method */ virtual TMetaClass* __fastcall GetContainerClass(TMetaClass* vmt);
	virtual Cxedit::TcxEditSupportedOperations __fastcall GetSupportedOperations(void);
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewDataClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewInfoClass(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TcxCustomTextEditProperties.Destroy */ inline __fastcall virtual ~TcxCustomHyperLinkEditProperties(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxHyperLinkEditProperties;
class PASCALIMPLEMENTATION TcxHyperLinkEditProperties : public TcxCustomHyperLinkEditProperties 
{
	typedef TcxCustomHyperLinkEditProperties inherited;
	
__published:
	__property Alignment ;
	__property AutoSelect  = {default=0};
	__property LinkColor  = {default=16711680};
	__property LookupItems ;
	__property LookupItemsSorted  = {default=0};
	__property ReadOnly ;
	__property StartKey  = {default=16397};
	__property SingleClick  = {default=0};
	__property UseLeftAlignmentOnEditing ;
	__property OnChange ;
	__property OnEditValueChanged ;
	__property OnStartClick ;
	__property OnValidate ;
public:
	#pragma option push -w-inl
	/* TcxCustomHyperLinkEditProperties.Create */ inline __fastcall virtual TcxHyperLinkEditProperties(Classes::TPersistent* AOwner) : TcxCustomHyperLinkEditProperties(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomTextEditProperties.Destroy */ inline __fastcall virtual ~TcxHyperLinkEditProperties(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomHyperLinkEdit;
class PASCALIMPLEMENTATION TcxCustomHyperLinkEdit : public Cxtextedit::TcxCustomTextEdit 
{
	typedef Cxtextedit::TcxCustomTextEdit inherited;
	
private:
	Controls::TCursor FSaveCursor;
	HIDESBASE TcxHyperLinkEditProperties* __fastcall GetProperties(void);
	HIDESBASE void __fastcall SetProperties(const TcxHyperLinkEditProperties* Value);
	
protected:
	virtual void __fastcall AdjustInnerEdit(void);
	virtual void __fastcall DoStart(void);
	DYNAMIC void __fastcall KeyDown(Word &Key, Classes::TShiftState Shift);
	DYNAMIC void __fastcall MouseDown(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseEnter(Controls::TControl* AControl);
	DYNAMIC void __fastcall MouseLeave(Controls::TControl* AControl);
	DYNAMIC void __fastcall MouseUp(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	
public:
	virtual void __fastcall ActivateByMouse(Classes::TShiftState Shift, int X, int Y, Cxedit::TcxCustomEditData* &AEditData);
	/* virtual class method */ virtual TMetaClass* __fastcall GetPropertiesClass(TMetaClass* vmt);
	virtual void __fastcall SelectAll(void);
	__property TcxHyperLinkEditProperties* Properties = {read=GetProperties, write=SetProperties};
public:
	#pragma option push -w-inl
	/* TcxCustomTextEdit.Create */ inline __fastcall virtual TcxCustomHyperLinkEdit(Classes::TComponent* AOwner)/* overload */ : Cxtextedit::TcxCustomTextEdit(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomTextEdit.Destroy */ inline __fastcall virtual ~TcxCustomHyperLinkEdit(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomHyperLinkEdit(HWND ParentWindow) : Cxtextedit::TcxCustomTextEdit(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxHyperLinkEdit;
class PASCALIMPLEMENTATION TcxHyperLinkEdit : public TcxCustomHyperLinkEdit 
{
	typedef TcxCustomHyperLinkEdit inherited;
	
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
	__property Properties ;
	__property ShowHint ;
	__property Style ;
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=1};
	__property Text ;
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
	/* TcxCustomTextEdit.Create */ inline __fastcall virtual TcxHyperLinkEdit(Classes::TComponent* AOwner)/* overload */ : TcxCustomHyperLinkEdit(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomTextEdit.Destroy */ inline __fastcall virtual ~TcxHyperLinkEdit(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxHyperLinkEdit(HWND ParentWindow) : TcxCustomHyperLinkEdit(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxhyperlinkedit */
using namespace Cxhyperlinkedit;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxHyperLinkEdit
