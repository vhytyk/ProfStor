// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxSpinButton.pas' rev: 6.00

#ifndef cxSpinButtonHPP
#define cxSpinButtonHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Menus.hpp>	// Pascal unit
#include <cxExtEditUtils.hpp>	// Pascal unit
#include <cxExtEditConsts.hpp>	// Pascal unit
#include <cxVariants.hpp>	// Pascal unit
#include <cxSpinEdit.hpp>	// Pascal unit
#include <cxTextEdit.hpp>	// Pascal unit
#include <cxMaskEdit.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxCustomData.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Variants.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxspinbutton
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxSpinButtonViewInfo;
class PASCALIMPLEMENTATION TcxSpinButtonViewInfo : public Cxspinedit::TcxSpinEditViewInfo 
{
	typedef Cxspinedit::TcxSpinEditViewInfo inherited;
	
public:
	virtual void __fastcall DrawButtonBorder(Cxgraphics::TcxCanvas* ACanvas, int AButtonVisibleIndex, Cxedit::TcxEditButtonStyle AButtonStyle, const Types::TRect &ARect);
	virtual void __fastcall DrawButtonContent(Cxgraphics::TcxCanvas* ACanvas, int AButtonVisibleIndex, const Types::TRect &AContentRect, Graphics::TColor APenColor, Graphics::TColor ABrushColor);
	virtual void __fastcall Paint(Cxgraphics::TcxCanvas* ACanvas);
public:
	#pragma option push -w-inl
	/* TcxCustomTextEditViewInfo.Destroy */ inline __fastcall virtual ~TcxSpinButtonViewInfo(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomEditViewInfo.Create */ inline __fastcall virtual TcxSpinButtonViewInfo(void) : Cxspinedit::TcxSpinEditViewInfo() { }
	#pragma option pop
	
};


class DELPHICLASS TcxSpinButtonViewData;
class DELPHICLASS TcxCustomSpinButtonProperties;
class PASCALIMPLEMENTATION TcxSpinButtonViewData : public Cxspinedit::TcxSpinEditViewData 
{
	typedef Cxspinedit::TcxSpinEditViewData inherited;
	
private:
	HIDESBASE TcxCustomSpinButtonProperties* __fastcall GetProperties(void);
	HIDESBASE void __fastcall SetProperties(TcxCustomSpinButtonProperties* Value);
	
protected:
	virtual bool __fastcall CanPressButton(Cxedit::TcxCustomEditViewInfo* AViewInfo, int AButtonVisibleIndex);
	virtual bool __fastcall IsButtonPressed(Cxedit::TcxCustomEditViewInfo* AViewInfo, int AButtonVisibleIndex);
	
public:
	Cxspinedit::TcxSpinEditPressedState PressedState;
	virtual void __fastcall Calculate(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ABounds, const Types::TPoint &P, Cxcontainer::TcxMouseButton Button, Classes::TShiftState Shift, Cxedit::TcxCustomEditViewInfo* AViewInfo, bool AIsMouseEvent);
	__property TcxCustomSpinButtonProperties* Properties = {read=GetProperties, write=SetProperties};
public:
	#pragma option push -w-inl
	/* TcxCustomEditViewData.Create */ inline __fastcall virtual TcxSpinButtonViewData(Cxedit::TcxCustomEditProperties* AProperties, Cxcontainer::TcxContainerStyle* AStyle, bool AIsInplace) : Cxspinedit::TcxSpinEditViewData(AProperties, AStyle, AIsInplace) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxSpinButtonViewData(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxCustomSpinButtonProperties : public Cxspinedit::TcxCustomSpinEditProperties 
{
	typedef Cxspinedit::TcxCustomSpinEditProperties inherited;
	
protected:
	/* virtual class method */ virtual TMetaClass* __fastcall GetAssignedValuesClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewDataClass(TMetaClass* vmt);
	virtual bool __fastcall IsDisplayValueNumeric(void);
	virtual bool __fastcall IsEditValueNumeric(void);
	virtual bool __fastcall PreserveSelection(void);
	
public:
	__fastcall virtual TcxCustomSpinButtonProperties(Classes::TPersistent* AOwner);
	/* virtual class method */ virtual TMetaClass* __fastcall GetContainerClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewInfoClass(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TcxCustomSpinEditProperties.Destroy */ inline __fastcall virtual ~TcxCustomSpinButtonProperties(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxSpinButtonProperties;
class PASCALIMPLEMENTATION TcxSpinButtonProperties : public TcxCustomSpinButtonProperties 
{
	typedef TcxCustomSpinButtonProperties inherited;
	
__published:
	__property Alignment ;
	__property AutoSelect  = {default=1};
	__property BeepOnError  = {default=0};
	__property HideSelection  = {default=1};
	__property ImmediatePost  = {default=0};
	__property Increment ;
	__property LargeIncrement ;
	__property MaxValue ;
	__property MinValue ;
	__property ReadOnly ;
	__property SpinButtons ;
	__property UseCtrlIncrement  = {default=0};
	__property UseLeftAlignmentOnEditing ;
	__property ValueType  = {default=0};
	__property OnChange ;
	__property OnEditValueChanged ;
	__property OnValidate ;
public:
	#pragma option push -w-inl
	/* TcxCustomSpinButtonProperties.Create */ inline __fastcall virtual TcxSpinButtonProperties(Classes::TPersistent* AOwner) : TcxCustomSpinButtonProperties(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomSpinEditProperties.Destroy */ inline __fastcall virtual ~TcxSpinButtonProperties(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxSpinButtonControlHook;
class PASCALIMPLEMENTATION TcxSpinButtonControlHook : public Cxexteditutils::TcxControlHook 
{
	typedef Cxexteditutils::TcxControlHook inherited;
	
private:
	Controls::TWinControl* FParent;
	
protected:
	virtual void __fastcall HookWndProc(Messages::TMessage &AMsg);
	
public:
	__fastcall TcxSpinButtonControlHook(void);
	__fastcall virtual ~TcxSpinButtonControlHook(void);
};


class DELPHICLASS TcxCustomSpinButton;
class PASCALIMPLEMENTATION TcxCustomSpinButton : public Cxspinedit::TcxCustomSpinEdit 
{
	typedef Cxspinedit::TcxCustomSpinEdit inherited;
	
private:
	Controls::TWinControl* FAssociate;
	TcxSpinButtonControlHook* FSpinButtonControlHook;
	HIDESBASE TcxSpinButtonProperties* __fastcall GetProperties(void);
	HIDESBASE void __fastcall SetProperties(TcxSpinButtonProperties* Value);
	void __fastcall SetAssociate(Controls::TWinControl* AValue);
	
protected:
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	virtual bool __fastcall CanFocusOnClick(void);
	virtual bool __fastcall CanResize(int &NewWidth, int &NewHeight);
	virtual void __fastcall SetSize(void);
	virtual bool __fastcall InternalDoEditing(void);
	__property TcxSpinButtonProperties* Properties = {read=GetProperties, write=SetProperties};
	__property Controls::TWinControl* Associate = {read=FAssociate, write=SetAssociate};
	virtual void __fastcall JoinToAssociate(void);
	virtual void __fastcall SetAssociateText(const Variant &AValue);
	virtual Variant __fastcall GetValue();
	virtual void __fastcall SynchronizeEditValueFromAssociate(void);
	
public:
	__fastcall virtual TcxCustomSpinButton(Classes::TComponent* AOwner)/* overload */;
	__fastcall virtual ~TcxCustomSpinButton(void);
	/* virtual class method */ virtual TMetaClass* __fastcall GetPropertiesClass(TMetaClass* vmt);
	virtual void __fastcall InternalSetEditValue(const Variant &Value, bool AValidateEditValue);
	virtual void __fastcall InternalSetDisplayValue(const Variant &Value);
	DYNAMIC bool __fastcall CanFocus(void);
	virtual bool __fastcall Increment(Cxspinedit::TcxSpinEditButton AButton);
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomSpinButton(HWND ParentWindow) : Cxspinedit::TcxCustomSpinEdit(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxSpinButton;
class PASCALIMPLEMENTATION TcxSpinButton : public TcxCustomSpinButton 
{
	typedef TcxCustomSpinButton inherited;
	
__published:
	__property AutoSize  = {default=1};
	__property Anchors  = {default=3};
	__property Associate ;
	__property BeepOnEnter  = {default=1};
	__property Constraints ;
	__property DragMode  = {default=0};
	__property Enabled  = {default=1};
	__property ParentColor  = {default=0};
	__property ParentFont  = {default=1};
	__property ParentShowHint  = {default=1};
	__property PopupMenu ;
	__property Properties ;
	__property ShowHint ;
	__property Style ;
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=1};
	__property Value ;
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
	/* TcxCustomSpinButton.Create */ inline __fastcall virtual TcxSpinButton(Classes::TComponent* AOwner)/* overload */ : TcxCustomSpinButton(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomSpinButton.Destroy */ inline __fastcall virtual ~TcxSpinButton(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxSpinButton(HWND ParentWindow) : TcxCustomSpinButton(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxspinbutton */
using namespace Cxspinbutton;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxSpinButton
