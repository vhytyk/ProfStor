// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxCalc.pas' rev: 6.00

#ifndef cxCalcHPP
#define cxCalcHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Menus.hpp>	// Pascal unit
#include <cxTextEdit.hpp>	// Pascal unit
#include <cxMaskEdit.hpp>	// Pascal unit
#include <cxDataUtils.hpp>	// Pascal unit
#include <cxLookAndFeelPainters.hpp>	// Pascal unit
#include <cxFormats.hpp>	// Pascal unit
#include <cxEditConsts.hpp>	// Pascal unit
#include <cxDropDownEdit.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <cxButtons.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <Clipbrd.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxcalc
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TcxCalcState { csFirst, csValid, csError };
#pragma option pop

#pragma option push -b-
enum TcxCalcButtonKind { cbBack, cbCancel, cbClear, cbMC, cbMR, cbMS, cbMP, cbNum0, cbNum1, cbNum2, cbNum3, cbNum4, cbNum5, cbNum6, cbNum7, cbNum8, cbNum9, cbSign, cbDecimal, cbDiv, cbMul, cbSub, cbAdd, cbSqrt, cbPercent, cbRev, cbEqual, cbNone };
#pragma option pop

#pragma pack(push, 4)
struct TcxButtonInfo
{
	TcxCalcButtonKind Kind;
	System::SmallString<4>  Text;
	Graphics::TColor FontColor;
	Types::TRect BtnRect;
	bool Down;
	bool Grayed;
} ;
#pragma pack(pop)

typedef TcxButtonInfo TCalcButtons[28];

typedef void __fastcall (__closure *TcxCalcButtonClick)(System::TObject* Sender, TcxCalcButtonKind &ButtonKind);

typedef void __fastcall (__closure *TcxCalcGetEditValue)(System::TObject* Sender, AnsiString &Value);

typedef void __fastcall (__closure *TcxCalcSetEditValue)(System::TObject* Sender, const AnsiString Value);

class DELPHICLASS TcxCustomCalculator;
class PASCALIMPLEMENTATION TcxCustomCalculator : public Cxcontrols::TcxControl 
{
	typedef Cxcontrols::TcxControl inherited;
	
private:
	bool FAutoFontSize;
	bool FBeepOnError;
	Forms::TFormBorderStyle FBorderStyle;
	bool FFocusRectVisible;
	int FCalcFontSize;
	int FCalcBtnWidth;
	int FCalcBtnHeight;
	int FCalcLargeBtnWidth;
	int FCalcXOfs;
	int FCalcYOfs;
	int FCalcWidth;
	int FCalcHeight;
	Extended FMemory;
	TcxCalcButtonKind FOperator;
	Extended FOperand;
	Byte FPrecision;
	TcxCalcState FStatus;
	TcxButtonInfo FButtons[28];
	TcxCalcButtonKind FActiveButton;
	TcxCalcButtonKind FDownButton;
	TcxCalcButtonKind FPressedButton;
	bool FTracking;
	Classes::TNotifyEvent FOnDisplayChange;
	TcxCalcButtonClick FOnButtonClick;
	Classes::TNotifyEvent FOnError;
	Classes::TNotifyEvent FOnResult;
	Classes::TNotifyEvent FOnHidePopup;
	Extended __fastcall GetDisplay(void);
	void __fastcall SetDisplay(Extended Value);
	Extended __fastcall GetMemory(void);
	void __fastcall SetAutoFontSize(bool Value);
	HIDESBASE void __fastcall SetBorderStyle(Forms::TBorderStyle Value);
	void __fastcall SetFocusRectVisible(bool Value);
	void __fastcall StopTracking(void);
	void __fastcall TrackButton(int X, int Y);
	void __fastcall InvalidateButton(TcxCalcButtonKind ButtonKind);
	void __fastcall DoButtonDown(TcxCalcButtonKind ButtonKind);
	void __fastcall DoButtonUp(TcxCalcButtonKind ButtonKind);
	void __fastcall Error(void);
	void __fastcall CheckFirst(void);
	void __fastcall Clear(void);
	void __fastcall CalcSize(int AWidth, int AHeight);
	void __fastcall UpdateMemoryButtons(void);
	void __fastcall InvalidateMemoryButtons(void);
	void __fastcall ResetOperands(void);
	
protected:
	bool IsPopupControl;
	virtual TMetaClass* __fastcall GetPainter(void);
	virtual void __fastcall Paint(void);
	virtual void __fastcall CreateParams(Controls::TCreateParams &Params);
	DYNAMIC void __fastcall FontChanged(void);
	DYNAMIC void __fastcall FocusChanged(void);
	DYNAMIC void __fastcall MouseDown(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseLeave(Controls::TControl* AControl);
	DYNAMIC void __fastcall MouseMove(Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseUp(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall KeyDown(Word &Key, Classes::TShiftState Shift);
	DYNAMIC void __fastcall KeyPress(char &Key);
	DYNAMIC void __fastcall KeyUp(Word &Key, Classes::TShiftState Shift);
	DYNAMIC void __fastcall Resize(void);
	virtual void __fastcall SetEnabled(bool Value);
	void __fastcall CreateLayout(void);
	void __fastcall ButtonClick(TcxCalcButtonKind ButtonKind);
	virtual AnsiString __fastcall GetEditorValue();
	virtual void __fastcall SetEditorValue(const AnsiString Value);
	virtual void __fastcall HidePopup(void);
	__property Color  = {default=-2147483633};
	__property ParentColor  = {default=0};
	__property Forms::TBorderStyle BorderStyle = {read=FBorderStyle, write=SetBorderStyle, default=0};
	__property bool AutoFontSize = {read=FAutoFontSize, write=SetAutoFontSize, default=1};
	__property bool BeepOnError = {read=FBeepOnError, write=FBeepOnError, default=1};
	__property bool ShowFocusRect = {read=FFocusRectVisible, write=SetFocusRectVisible, default=1};
	__property Byte Precision = {read=FPrecision, write=FPrecision, default=13};
	__property AnsiString EditorValue = {read=GetEditorValue, write=SetEditorValue};
	__property Classes::TNotifyEvent OnHidePopup = {read=FOnHidePopup, write=FOnHidePopup};
	__property Classes::TNotifyEvent OnDisplayChange = {read=FOnDisplayChange, write=FOnDisplayChange};
	__property TcxCalcButtonClick OnButtonClick = {read=FOnButtonClick, write=FOnButtonClick};
	__property Classes::TNotifyEvent OnError = {read=FOnError, write=FOnError};
	__property Classes::TNotifyEvent OnResult = {read=FOnResult, write=FOnResult};
	
public:
	__fastcall virtual TcxCustomCalculator(Classes::TComponent* AOwner);
	TcxCalcButtonKind __fastcall GetButtonKindAt(int X, int Y);
	TcxCalcButtonKind __fastcall GetButtonKindChar(char Ch);
	TcxCalcButtonKind __fastcall GetButtonKindKey(Word Key, Classes::TShiftState Shift);
	void __fastcall CopyToClipboard(void);
	void __fastcall PasteFromClipboard(void);
	__property Extended Memory = {read=GetMemory};
	__property Extended Value = {read=GetDisplay, write=SetDisplay};
	
__published:
	__property TabStop  = {default=1};
public:
	#pragma option push -w-inl
	/* TcxControl.Destroy */ inline __fastcall virtual ~TcxCustomCalculator(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomCalculator(HWND ParentWindow) : Cxcontrols::TcxControl(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxPopupCalculator;
class DELPHICLASS TcxCustomCalcEdit;
class DELPHICLASS TcxCalcEditProperties;
class PASCALIMPLEMENTATION TcxCustomCalcEdit : public Cxdropdownedit::TcxCustomPopupEdit 
{
	typedef Cxdropdownedit::TcxCustomPopupEdit inherited;
	
private:
	TcxPopupCalculator* FCalculator;
	HIDESBASE TcxCalcEditProperties* __fastcall GetProperties(void);
	Extended __fastcall GetValue(void);
	void __fastcall HideCalculator(System::TObject* Sender);
	HIDESBASE void __fastcall SetProperties(TcxCalcEditProperties* Value);
	void __fastcall SetValue(const Extended Value);
	
protected:
	void __fastcall FormatChanged(void);
	virtual bool __fastcall CanDropDown(void);
	virtual void __fastcall CreatePopupWindow(void);
	DYNAMIC void __fastcall DoEnter(void);
	DYNAMIC void __fastcall DoExit(void);
	virtual void __fastcall DoInitPopup(void);
	virtual void __fastcall InitializePopupWindow(void);
	virtual bool __fastcall IsValidChar(char Key);
	DYNAMIC void __fastcall KeyPress(char &Key);
	DYNAMIC void __fastcall PopupWindowClosed(System::TObject* Sender);
	virtual void __fastcall PropertiesChanged(System::TObject* Sender);
	__property TcxPopupCalculator* Calculator = {read=FCalculator};
	__property TcxCalcEditProperties* Properties = {read=GetProperties, write=SetProperties};
	
public:
	__fastcall virtual TcxCustomCalcEdit(Classes::TComponent* AOwner)/* overload */;
	__fastcall virtual ~TcxCustomCalcEdit(void);
	/* virtual class method */ virtual TMetaClass* __fastcall GetPropertiesClass(TMetaClass* vmt);
	virtual void __fastcall PasteFromClipboard(void);
	virtual void __fastcall PrepareEditValue(const Variant &ADisplayValue, /* out */ Variant &EditValue, bool AEditFocused);
	__property Extended Value = {read=GetValue, write=SetValue, stored=false};
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomCalcEdit(HWND ParentWindow) : Cxdropdownedit::TcxCustomPopupEdit(ParentWindow) { }
	#pragma option pop
	
private:
	void *__IcxFormatContollerListener;	/* Cxformats::IcxFormatContollerListener */
	
public:
	operator IcxFormatContollerListener*(void) { return (IcxFormatContollerListener*)&__IcxFormatContollerListener; }
	
};


class PASCALIMPLEMENTATION TcxPopupCalculator : public TcxCustomCalculator 
{
	typedef TcxCustomCalculator inherited;
	
private:
	TcxCustomCalcEdit* FEdit;
	
protected:
	virtual AnsiString __fastcall GetEditorValue();
	virtual TMetaClass* __fastcall GetPainter(void);
	DYNAMIC void __fastcall KeyDown(Word &Key, Classes::TShiftState Shift);
	DYNAMIC void __fastcall KeyPress(char &Key);
	virtual void __fastcall SetEditorValue(const AnsiString Value);
	__property TcxCustomCalcEdit* Edit = {read=FEdit, write=FEdit};
	
public:
	__fastcall virtual TcxPopupCalculator(Classes::TComponent* AOwner);
public:
	#pragma option push -w-inl
	/* TcxControl.Destroy */ inline __fastcall virtual ~TcxPopupCalculator(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxPopupCalculator(HWND ParentWindow) : TcxCustomCalculator(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomCalcEditProperties;
class PASCALIMPLEMENTATION TcxCustomCalcEditProperties : public Cxdropdownedit::TcxCustomPopupEditProperties 
{
	typedef Cxdropdownedit::TcxCustomPopupEditProperties inherited;
	
private:
	bool FBeepOnError;
	bool FFormatChanging;
	Byte FPrecision;
	bool FQuickClose;
	void __fastcall SetBeepOnError(const bool Value);
	void __fastcall SetPrecision(const Byte Value);
	void __fastcall SetQuickClose(const bool Value);
	
protected:
	void __fastcall FormatChanged(void);
	virtual bool __fastcall GetAlwaysPostEditValue(void);
	bool __fastcall StrToFloatEx(AnsiString S, double &Value);
	__property bool BeepOnError = {read=FBeepOnError, write=SetBeepOnError, default=1};
	__property ImmediateDropDown  = {default=0};
	__property Byte Precision = {read=FPrecision, write=SetPrecision, default=13};
	__property bool QuickClose = {read=FQuickClose, write=SetQuickClose, default=0};
	
public:
	__fastcall virtual TcxCustomCalcEditProperties(Classes::TPersistent* AOwner);
	__fastcall virtual ~TcxCustomCalcEditProperties(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	/* virtual class method */ virtual TMetaClass* __fastcall GetContainerClass(TMetaClass* vmt);
	virtual Cxdatautils::TcxDataEditValueSource __fastcall GetEditValueSource(bool AEditFocused);
	virtual bool __fastcall IsDisplayValueValid(Variant &DisplayValue, bool AEditFocused);
	virtual void __fastcall PrepareDisplayValue(const Variant &AEditValue, Variant &DisplayValue, bool AEditFocused);
	virtual void __fastcall ValidateDisplayValue(Variant &ADisplayValue, AnsiString &AErrorText, bool &Error, Cxedit::TcxCustomEdit* AEdit);
private:
	void *__IcxFormatContollerListener;	/* Cxformats::IcxFormatContollerListener */
	
public:
	operator IcxFormatContollerListener*(void) { return (IcxFormatContollerListener*)&__IcxFormatContollerListener; }
	
};


class PASCALIMPLEMENTATION TcxCalcEditProperties : public TcxCustomCalcEditProperties 
{
	typedef TcxCustomCalcEditProperties inherited;
	
__published:
	__property Alignment ;
	__property AutoSelect  = {default=1};
	__property BeepOnError  = {default=1};
	__property ButtonGlyph ;
	__property ImmediatePost  = {default=0};
	__property Precision  = {default=13};
	__property ReadOnly ;
	__property QuickClose  = {default=0};
	__property UseLeftAlignmentOnEditing ;
	__property OnChange ;
	__property OnCloseUp ;
	__property OnEditValueChanged ;
	__property OnInitPopup ;
	__property OnPopup ;
	__property OnValidate ;
public:
	#pragma option push -w-inl
	/* TcxCustomCalcEditProperties.Create */ inline __fastcall virtual TcxCalcEditProperties(Classes::TPersistent* AOwner) : TcxCustomCalcEditProperties(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomCalcEditProperties.Destroy */ inline __fastcall virtual ~TcxCalcEditProperties(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCalcEdit;
class PASCALIMPLEMENTATION TcxCalcEdit : public TcxCustomCalcEdit 
{
	typedef TcxCustomCalcEdit inherited;
	
__published:
	__property Anchors  = {default=3};
	__property AutoSize  = {default=1};
	__property BeepOnEnter  = {default=1};
	__property Constraints ;
	__property DragCursor  = {default=-12};
	__property DragKind  = {default=0};
	__property DragMode  = {default=0};
	__property EditValue ;
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
	__property Value ;
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
	/* TcxCustomCalcEdit.Create */ inline __fastcall virtual TcxCalcEdit(Classes::TComponent* AOwner)/* overload */ : TcxCustomCalcEdit(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomCalcEdit.Destroy */ inline __fastcall virtual ~TcxCalcEdit(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCalcEdit(HWND ParentWindow) : TcxCustomCalcEdit(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
static const Shortint cxDefCalcPrecision = 0xd;
static const Shortint cxMinCalcFontSize = 0x8;
static const Shortint cxCalcMinBoldFontSize = 0xa;
static const Shortint cxMinCalcBtnWidth = 0x1c;
static const Shortint cxMinCalcBtnHeight = 0x16;
static const int cxMinCalcLargeBtnWidth = 0x2f;
static const Shortint cxMinCalcXOfs = 0x3;
static const Shortint cxMinCalcYOfs = 0x3;
static const Byte cxMinCalcWidth = 0xc6;
static const Byte cxMinCalcHeight = 0x83;
extern PACKAGE System::SmallString<4>  BtnCaptions[27];

}	/* namespace Cxcalc */
using namespace Cxcalc;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxCalc
