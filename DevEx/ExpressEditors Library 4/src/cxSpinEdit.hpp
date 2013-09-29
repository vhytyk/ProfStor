// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxSpinEdit.pas' rev: 6.00

#ifndef cxSpinEditHPP
#define cxSpinEditHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Menus.hpp>	// Pascal unit
#include <cxLookAndFeelPainters.hpp>	// Pascal unit
#include <cxVariants.hpp>	// Pascal unit
#include <cxTextEdit.hpp>	// Pascal unit
#include <cxMaskEdit.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxDataUtils.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Variants.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxspinedit
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TcxSpinEditButtonsPosition { sbpHorzLeftRight, sbpHorzRight, sbpVert };
#pragma option pop

#pragma option push -b-
enum TcxSpinEditButton { sebBackward, sebForward, sebFastBackward, sebFastForward };
#pragma option pop

class DELPHICLASS TcxSpinEditViewInfo;
class PASCALIMPLEMENTATION TcxSpinEditViewInfo : public Cxtextedit::TcxCustomTextEditViewInfo 
{
	typedef Cxtextedit::TcxCustomTextEditViewInfo inherited;
	
protected:
	virtual void __fastcall InternalPaint(Cxgraphics::TcxCanvas* ACanvas);
	
public:
	int ArrowSize;
	TcxSpinEditButtonsPosition ButtonsPosition;
	Types::TPoint DelimiterLine[2];
	virtual void __fastcall DrawButtonBorder(Cxgraphics::TcxCanvas* ACanvas, int AButtonVisibleIndex, Cxedit::TcxEditButtonStyle AButtonStyle, const Types::TRect &ARect);
	virtual void __fastcall DrawButtonContent(Cxgraphics::TcxCanvas* ACanvas, int AButtonVisibleIndex, const Types::TRect &AContentRect, Graphics::TColor APenColor, Graphics::TColor ABrushColor);
public:
	#pragma option push -w-inl
	/* TcxCustomTextEditViewInfo.Destroy */ inline __fastcall virtual ~TcxSpinEditViewInfo(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomEditViewInfo.Create */ inline __fastcall virtual TcxSpinEditViewInfo(void) : Cxtextedit::TcxCustomTextEditViewInfo() { }
	#pragma option pop
	
};


#pragma option push -b-
enum TcxSpinEditPressedState { epsNone, epsDown, epsUp, epsFastDown, epsFastUp };
#pragma option pop

class DELPHICLASS TcxSpinEditViewData;
class DELPHICLASS TcxCustomSpinEditProperties;
class PASCALIMPLEMENTATION TcxSpinEditViewData : public Cxtextedit::TcxCustomTextEditViewData 
{
	typedef Cxtextedit::TcxCustomTextEditViewData inherited;
	
private:
	HIDESBASE TcxCustomSpinEditProperties* __fastcall GetProperties(void);
	HIDESBASE void __fastcall SetProperties(TcxCustomSpinEditProperties* Value);
	
protected:
	virtual bool __fastcall CanPressButton(Cxedit::TcxCustomEditViewInfo* AViewInfo, int AButtonVisibleIndex);
	virtual bool __fastcall IsButtonPressed(Cxedit::TcxCustomEditViewInfo* AViewInfo, int AButtonVisibleIndex);
	virtual void __fastcall CalculateButtonNativeInfo(Cxedit::TcxEditButtonViewInfo* AButtonViewInfo);
	
public:
	TcxSpinEditPressedState PressedState;
	virtual void __fastcall Calculate(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ABounds, const Types::TPoint &P, Cxcontainer::TcxMouseButton Button, Classes::TShiftState Shift, Cxedit::TcxCustomEditViewInfo* AViewInfo, bool AIsMouseEvent);
	virtual void __fastcall CalculateButtonBounds(Cxgraphics::TcxCanvas* ACanvas, Cxedit::TcxCustomEditViewInfo* AViewInfo, int AButtonVisibleIndex, Types::TRect &ButtonsRect);
	virtual void __fastcall CalculateButtonViewInfo(Cxgraphics::TcxCanvas* ACanvas, Cxedit::TcxCustomEditViewInfo* AViewInfo, int AButtonVisibleIndex, Types::TRect &ButtonsRect);
	__property TcxCustomSpinEditProperties* Properties = {read=GetProperties, write=SetProperties};
public:
	#pragma option push -w-inl
	/* TcxCustomEditViewData.Create */ inline __fastcall virtual TcxSpinEditViewData(Cxedit::TcxCustomEditProperties* AProperties, Cxcontainer::TcxContainerStyle* AStyle, bool AIsInplace) : Cxtextedit::TcxCustomTextEditViewData(AProperties, AStyle, AIsInplace) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxSpinEditViewData(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxSpinEditButtons;
class PASCALIMPLEMENTATION TcxSpinEditButtons : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	TcxSpinEditButtonsPosition FPosition;
	TcxCustomSpinEditProperties* FProperties;
	bool FShowFastButtons;
	void __fastcall SetPosition(TcxSpinEditButtonsPosition Value);
	void __fastcall SetShowFastButtons(bool Value);
	
protected:
	void __fastcall Changed(void);
	__property TcxCustomSpinEditProperties* Properties = {read=FProperties};
	
public:
	__fastcall virtual TcxSpinEditButtons(TcxCustomSpinEditProperties* AProperties);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	
__published:
	__property TcxSpinEditButtonsPosition Position = {read=FPosition, write=SetPosition, default=2};
	__property bool ShowFastButtons = {read=FShowFastButtons, write=SetShowFastButtons, default=0};
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxSpinEditButtons(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxSpinEditPropertiesValues;
class PASCALIMPLEMENTATION TcxSpinEditPropertiesValues : public Cxtextedit::TcxTextEditPropertiesValues 
{
	typedef Cxtextedit::TcxTextEditPropertiesValues inherited;
	
public:
	bool ValueType;
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual void __fastcall Reset(void);
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxSpinEditPropertiesValues(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxSpinEditPropertiesValues(void) : Cxtextedit::TcxTextEditPropertiesValues() { }
	#pragma option pop
	
};


#pragma option push -b-
enum TcxSpinEditValueType { vtInt, vtFloat };
#pragma option pop

class PASCALIMPLEMENTATION TcxCustomSpinEditProperties : public Cxmaskedit::TcxCustomMaskEditProperties 
{
	typedef Cxmaskedit::TcxCustomMaskEditProperties inherited;
	
private:
	TcxSpinEditButtons* FSpinButtons;
	bool FCanEdit;
	double FIncrement;
	double FLargeIncrement;
	bool FUseCtrlIncrement;
	TcxSpinEditValueType FValueType;
	HIDESBASE TcxSpinEditPropertiesValues* __fastcall GetAssignedValues(void);
	double __fastcall GetMin(void);
	TcxSpinEditValueType __fastcall GetValueType(void);
	bool __fastcall IsIncrementStored(void);
	bool __fastcall IsLargeIncrementStored(void);
	bool __fastcall IsValueTypeStored(void);
	void __fastcall SetSpinButtons(TcxSpinEditButtons* Value);
	void __fastcall SetValueType(TcxSpinEditValueType Value);
	
protected:
	virtual void __fastcall Changed(void);
	virtual Variant __fastcall DefaultFocusedDisplayValue();
	/* virtual class method */ virtual TMetaClass* __fastcall GetAssignedValuesClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewDataClass(TMetaClass* vmt);
	virtual bool __fastcall IsEditValueNumeric(void);
	virtual bool __fastcall IsDisplayValueNumeric(void);
	double __fastcall PrepareValue(const Variant &AValue);
	virtual bool __fastcall PreserveSelection(void);
	void __fastcall SetVariantType(Variant &Value);
	__property TcxSpinEditPropertiesValues* AssignedValues = {read=GetAssignedValues};
	__property bool CanEdit = {read=FCanEdit, write=FCanEdit, default=1};
	__property double Increment = {read=FIncrement, write=FIncrement, stored=IsIncrementStored};
	__property double LargeIncrement = {read=FLargeIncrement, write=FLargeIncrement, stored=IsLargeIncrementStored};
	__property TcxSpinEditButtons* SpinButtons = {read=FSpinButtons, write=SetSpinButtons};
	__property bool UseCtrlIncrement = {read=FUseCtrlIncrement, write=FUseCtrlIncrement, default=0};
	__property TcxSpinEditValueType ValueType = {read=GetValueType, write=SetValueType, stored=IsValueTypeStored, nodefault};
	
public:
	__fastcall virtual TcxCustomSpinEditProperties(Classes::TPersistent* AOwner);
	__fastcall virtual ~TcxCustomSpinEditProperties(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual Cxedit::TcxCustomEditViewData* __fastcall CreateViewData(Cxcontainer::TcxContainerStyle* AStyle, bool AIsInplace);
	/* virtual class method */ virtual TMetaClass* __fastcall GetContainerClass(TMetaClass* vmt);
	virtual Cxdatautils::TcxDataEditValueSource __fastcall GetEditValueSource(bool AEditFocused);
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewInfoClass(TMetaClass* vmt);
	virtual bool __fastcall IsDisplayValueValid(Variant &DisplayValue, bool AEditFocused);
	virtual bool __fastcall IsEditValueValid(Variant &EditValue, bool AEditFocused);
	virtual void __fastcall PrepareDisplayValue(const Variant &AEditValue, Variant &DisplayValue, bool AEditFocused);
	virtual void __fastcall ValidateDisplayValue(Variant &DisplayValue, AnsiString &ErrorText, bool &Error, Cxedit::TcxCustomEdit* AEdit);
};


class DELPHICLASS TcxSpinEditProperties;
class PASCALIMPLEMENTATION TcxSpinEditProperties : public TcxCustomSpinEditProperties 
{
	typedef TcxCustomSpinEditProperties inherited;
	
__published:
	__property Alignment ;
	__property AutoSelect  = {default=1};
	__property BeepOnError  = {default=0};
	__property CanEdit  = {default=1};
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
	__property ValueType ;
	__property OnChange ;
	__property OnEditValueChanged ;
	__property OnValidate ;
public:
	#pragma option push -w-inl
	/* TcxCustomSpinEditProperties.Create */ inline __fastcall virtual TcxSpinEditProperties(Classes::TPersistent* AOwner) : TcxCustomSpinEditProperties(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomSpinEditProperties.Destroy */ inline __fastcall virtual ~TcxSpinEditProperties(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomSpinEdit;
class PASCALIMPLEMENTATION TcxCustomSpinEdit : public Cxmaskedit::TcxCustomMaskEdit 
{
	typedef Cxmaskedit::TcxCustomMaskEdit inherited;
	
private:
	TcxSpinEditPressedState FPressedState;
	Extctrls::TTimer* FTimer;
	HIDESBASE TcxSpinEditProperties* __fastcall GetProperties(void);
	void __fastcall HandleTimer(System::TObject* Sender);
	bool __fastcall IsValueStored(void);
	void __fastcall SetPressedState(TcxSpinEditPressedState Value);
	HIDESBASE void __fastcall SetProperties(TcxSpinEditProperties* Value);
	void __fastcall StopTracking(void);
	
protected:
	virtual void __fastcall CheckEditorValueBounds(void);
	DYNAMIC void __fastcall DblClick(void);
	virtual void __fastcall DoButtonDown(int AButtonVisibleIndex);
	virtual void __fastcall DoEditKeyDown(Word &Key, Classes::TShiftState Shift);
	virtual void __fastcall DoEditKeyPress(char &Key);
	virtual void __fastcall DoEditKeyUp(Word &Key, Classes::TShiftState Shift);
	DYNAMIC bool __fastcall DoMouseWheelDown(Classes::TShiftState Shift, const Types::TPoint &MousePos);
	DYNAMIC bool __fastcall DoMouseWheelUp(Classes::TShiftState Shift, const Types::TPoint &MousePos);
	DYNAMIC void __fastcall FocusChanged(void);
	virtual bool __fastcall IsValidChar(char AChar);
	DYNAMIC void __fastcall MouseUp(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall PropertiesChanged(System::TObject* Sender);
	virtual bool __fastcall RefreshContainer(const Types::TPoint &P, Cxcontainer::TcxMouseButton Button, Classes::TShiftState Shift, bool AIsMouseEvent);
	virtual bool __fastcall ExtendValueUpToBound(void);
	virtual double __fastcall GetIncrement(TcxSpinEditButton AButton);
	virtual Variant __fastcall GetValue();
	virtual void __fastcall SetValue(const Variant &Value);
	__property TcxSpinEditPressedState PressedState = {read=FPressedState, write=SetPressedState, nodefault};
	__property TcxSpinEditProperties* Properties = {read=GetProperties, write=SetProperties};
	__property Variant Value = {read=GetValue, write=SetValue, stored=IsValueStored};
	
public:
	__fastcall virtual TcxCustomSpinEdit(Classes::TComponent* AOwner)/* overload */;
	virtual void __fastcall CutToClipboard(void);
	/* virtual class method */ virtual TMetaClass* __fastcall GetPropertiesClass(TMetaClass* vmt);
	/* virtual class method */ virtual Cxcontainer::TcxContainerStyleValues __fastcall GetNotPublishedStyleValues(TMetaClass* vmt);
	virtual bool __fastcall Increment(TcxSpinEditButton AButton);
	virtual void __fastcall PasteFromClipboard(void);
	virtual void __fastcall PrepareEditValue(const Variant &ADisplayValue, /* out */ Variant &EditValue, bool AEditFocused);
public:
	#pragma option push -w-inl
	/* TcxCustomMaskEdit.Destroy */ inline __fastcall virtual ~TcxCustomSpinEdit(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomSpinEdit(HWND ParentWindow) : Cxmaskedit::TcxCustomMaskEdit(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxSpinEdit;
class PASCALIMPLEMENTATION TcxSpinEdit : public TcxCustomSpinEdit 
{
	typedef TcxCustomSpinEdit inherited;
	
__published:
	__property Anchors  = {default=3};
	__property AutoSize  = {default=1};
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
	/* TcxCustomSpinEdit.Create */ inline __fastcall virtual TcxSpinEdit(Classes::TComponent* AOwner)/* overload */ : TcxCustomSpinEdit(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomMaskEdit.Destroy */ inline __fastcall virtual ~TcxSpinEdit(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxSpinEdit(HWND ParentWindow) : TcxCustomSpinEdit(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
static const Shortint cxSpinBackwardButtonIndex = 0x0;
static const Shortint cxSpinForwardButtonIndex = 0x1;
static const Shortint cxSpinFastBackwardButtonIndex = 0x2;
static const Shortint cxSpinFastForwardButtonIndex = 0x3;

}	/* namespace Cxspinedit */
using namespace Cxspinedit;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxSpinEdit
