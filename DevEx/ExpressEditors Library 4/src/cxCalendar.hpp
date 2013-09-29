// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxCalendar.pas' rev: 6.00

#ifndef cxCalendarHPP
#define cxCalendarHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Menus.hpp>	// Pascal unit
#include <cxFormats.hpp>	// Pascal unit
#include <cxEditConsts.hpp>	// Pascal unit
#include <cxDateUtils.hpp>	// Pascal unit
#include <cxButtons.hpp>	// Pascal unit
#include <cxDataUtils.hpp>	// Pascal unit
#include <cxMaskEdit.hpp>	// Pascal unit
#include <cxTextEdit.hpp>	// Pascal unit
#include <cxDropDownEdit.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <Clipbrd.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Types.hpp>	// Pascal unit
#include <ComCtrls.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxcalendar
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TDateButton { btnToday, btnClear };
#pragma option pop

typedef Set<TDateButton, btnToday, btnClear>  TDateButtons;

class DELPHICLASS TcxCustomCalendar;
class PASCALIMPLEMENTATION TcxCustomCalendar : public Cxcontrols::TcxControl 
{
	typedef Cxcontrols::TcxControl inherited;
	
private:
	System::TDateTime FFirstDate;
	System::TDateTime FSelectDate;
	bool FFlat;
	int FColWidth;
	int FSideWidth;
	int FRowHeight;
	int FHeaderHeight;
	int FDaysOfWeekHeight;
	int FTodayButtonWidth;
	int FClearButtonWidth;
	int FButtonsOffset;
	int FButtonsHeight;
	int FButtonsRegionHeight;
	Cxcontainer::TcxCustomPopupWindow* FListBox;
	Extctrls::TTimer* FTimer;
	Cxbuttons::TcxButton* FTodayButton;
	Cxbuttons::TcxButton* FClearButton;
	TDateButtons FCalendarButtons;
	Classes::TNotifyEvent FOnDateTimeChanged;
	void __fastcall AdjustButtonsPosition(void);
	void __fastcall ButtonClick(System::TObject* Sender);
	void __fastcall CreateButtons(void);
	int __fastcall ColOfDate(System::TDateTime ADate);
	void __fastcall DoDateTimeChanged(void);
	void __fastcall DoScrollArrow(System::TObject* Sender);
	Types::TRect __fastcall GetHeaderRect();
	Types::TRect __fastcall GetInternalRect();
	Types::TRect __fastcall GetLeftArrowRect();
	Types::TRect __fastcall GetRightArrowRect();
	Types::TRect __fastcall GetMonthNameRect();
	Types::TRect __fastcall GetTodayButtonRect();
	Types::TRect __fastcall GetClearButtonRect();
	bool __fastcall GetShowButtonsArea(void);
	void __fastcall SetFlat(bool Value);
	void __fastcall SetCalendarButtons(const TDateButtons Value);
	
protected:
	bool IsPopupControl;
	DYNAMIC void __fastcall FontChanged(void);
	virtual bool __fastcall HasBackground(void);
	virtual void __fastcall InitControl(void);
	DYNAMIC void __fastcall KeyDown(Word &Key, Classes::TShiftState Shift);
	DYNAMIC void __fastcall MouseDown(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseMove(Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseUp(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall Paint(void);
	DYNAMIC void __fastcall Resize(void);
	virtual System::TDateTime __fastcall GetLastDate(void);
	virtual System::TDateTime __fastcall GetRealFirstDate(void);
	virtual System::TDateTime __fastcall GetRealLastDate(void);
	virtual void __fastcall SetFirstDate(System::TDateTime Value);
	virtual void __fastcall SetSelectDate(System::TDateTime Value);
	void __fastcall StepToFuture(void);
	void __fastcall StepToPast(void);
	virtual System::TDateTime __fastcall PosToDateTime(const Types::TPoint &P);
	virtual void __fastcall HidePopup(void);
	void __fastcall SetSize(void);
	__property bool ShowButtonsArea = {read=GetShowButtonsArea, nodefault};
	
public:
	__fastcall virtual TcxCustomCalendar(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxCustomCalendar(void);
	virtual void __fastcall BeforeDestruction(void);
	int __fastcall GetHeight(void);
	int __fastcall GetWidth(void);
	__property TDateButtons CalendarButtons = {read=FCalendarButtons, write=SetCalendarButtons, nodefault};
	__property System::TDateTime FirstDate = {read=FFirstDate, write=SetFirstDate};
	__property bool Flat = {read=FFlat, write=SetFlat, default=1};
	__property System::TDateTime SelectDate = {read=FSelectDate, write=SetSelectDate};
	__property Font ;
	__property Classes::TNotifyEvent OnDateTimeChanged = {read=FOnDateTimeChanged, write=FOnDateTimeChanged};
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomCalendar(HWND ParentWindow) : Cxcontrols::TcxControl(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxPopupCalendar;
class PASCALIMPLEMENTATION TcxPopupCalendar : public TcxCustomCalendar 
{
	typedef TcxCustomCalendar inherited;
	
private:
	Cxdropdownedit::TcxCustomPopupEdit* FEdit;
	Classes::TNotifyEvent FOnHidePopup;
	
protected:
	DYNAMIC void __fastcall KeyDown(Word &Key, Classes::TShiftState Shift);
	DYNAMIC void __fastcall MouseMove(Classes::TShiftState Shift, int X, int Y);
	
public:
	__fastcall virtual TcxPopupCalendar(Classes::TComponent* AOwner);
	virtual void __fastcall HidePopup(void);
	__property Cxdropdownedit::TcxCustomPopupEdit* Edit = {read=FEdit, write=FEdit};
	__property Classes::TNotifyEvent OnHidePopup = {read=FOnHidePopup, write=FOnHidePopup};
public:
	#pragma option push -w-inl
	/* TcxCustomCalendar.Destroy */ inline __fastcall virtual ~TcxPopupCalendar(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxPopupCalendar(HWND ParentWindow) : TcxCustomCalendar(ParentWindow) { }
	#pragma option pop
	
};


#pragma option push -b-
enum TDateOnError { deNoChange, deToday, deNull };
#pragma option pop

#pragma option push -b-
enum TcxInputKind { ikStandard, ikMask, ikRegExpr };
#pragma option pop

class DELPHICLASS TcxCustomDateEditProperties;
class PASCALIMPLEMENTATION TcxCustomDateEditProperties : public Cxdropdownedit::TcxCustomPopupEditProperties 
{
	typedef Cxdropdownedit::TcxCustomPopupEditProperties inherited;
	
private:
	TDateButtons FDateButtons;
	TDateOnError FDateOnError;
	TcxInputKind FInputKind;
	bool FSaveTime;
	bool FShowTime;
	void __fastcall BuildEditMask(void);
	System::TDateTime __fastcall GetMaxDate(void);
	System::TDateTime __fastcall GetMinDate(void);
	void __fastcall SetDateButtons(const TDateButtons Value);
	void __fastcall SetDateOnError(const TDateOnError Value);
	void __fastcall SetInputKind(const TcxInputKind Value);
	void __fastcall SetMaxDate(const System::TDateTime Value);
	void __fastcall SetMinDate(const System::TDateTime Value);
	void __fastcall SetSaveTime(const bool Value);
	void __fastcall SetShowTime(const bool Value);
	
protected:
	virtual void __fastcall Changed(void);
	void __fastcall FormatChanged(void);
	virtual bool __fastcall GetAlwaysPostEditValue(void);
	virtual Cxedit::TcxEditDisplayFormatOptions __fastcall GetDisplayFormatOptions(void);
	virtual bool __fastcall IsEditValueNumeric(void);
	__property TDateButtons DateButtons = {read=FDateButtons, write=SetDateButtons, default=3};
	__property TDateOnError DateOnError = {read=FDateOnError, write=SetDateOnError, default=0};
	__property TcxInputKind InputKind = {read=FInputKind, write=SetInputKind, default=2};
	__property ImmediateDropDown  = {default=0};
	__property System::TDateTime MaxDate = {read=GetMaxDate, write=SetMaxDate};
	__property System::TDateTime MinDate = {read=GetMinDate, write=SetMinDate};
	__property bool SaveTime = {read=FSaveTime, write=SetSaveTime, default=1};
	__property bool ShowTime = {read=FShowTime, write=SetShowTime, default=1};
	
public:
	__fastcall virtual TcxCustomDateEditProperties(Classes::TPersistent* AOwner);
	__fastcall virtual ~TcxCustomDateEditProperties(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	/* virtual class method */ virtual TMetaClass* __fastcall GetContainerClass(TMetaClass* vmt);
	virtual Cxdatautils::TcxDataEditValueSource __fastcall GetEditValueSource(bool AEditFocused);
	virtual bool __fastcall IsEditValueValid(Variant &EditValue, bool AEditFocused);
	virtual void __fastcall PrepareDisplayValue(const Variant &AEditValue, Variant &DisplayValue, bool AEditFocused);
	virtual void __fastcall ValidateDisplayValue(Variant &ADisplayValue, AnsiString &AErrorText, bool &Error, Cxedit::TcxCustomEdit* AEdit);
private:
	void *__IcxFormatContollerListener;	/* Cxformats::IcxFormatContollerListener */
	
public:
	operator IcxFormatContollerListener*(void) { return (IcxFormatContollerListener*)&__IcxFormatContollerListener; }
	
};


class DELPHICLASS TcxDateEditProperties;
class PASCALIMPLEMENTATION TcxDateEditProperties : public TcxCustomDateEditProperties 
{
	typedef TcxCustomDateEditProperties inherited;
	
__published:
	__property Alignment ;
	__property ButtonGlyph ;
	__property DateButtons  = {default=3};
	__property DateOnError  = {default=0};
	__property ImmediatePost  = {default=0};
	__property InputKind  = {default=2};
	__property MaxDate ;
	__property MinDate ;
	__property ReadOnly ;
	__property SaveTime  = {default=1};
	__property ShowTime  = {default=1};
	__property OnChange ;
	__property OnCloseUp ;
	__property OnEditValueChanged ;
	__property OnInitPopup ;
	__property OnPopup ;
	__property OnValidate ;
public:
	#pragma option push -w-inl
	/* TcxCustomDateEditProperties.Create */ inline __fastcall virtual TcxDateEditProperties(Classes::TPersistent* AOwner) : TcxCustomDateEditProperties(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomDateEditProperties.Destroy */ inline __fastcall virtual ~TcxDateEditProperties(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomDateEdit;
class PASCALIMPLEMENTATION TcxCustomDateEdit : public Cxdropdownedit::TcxCustomPopupEdit 
{
	typedef Cxdropdownedit::TcxCustomPopupEdit inherited;
	
private:
	TcxPopupCalendar* FCalendar;
	System::TDateTime FDateDropDown;
	System::TDateTime FSavedTime;
	void __fastcall DateChange(System::TObject* Sender);
	System::TDateTime __fastcall GetDate(void);
	HIDESBASE TcxDateEditProperties* __fastcall GetProperties(void);
	void __fastcall HideCalendar(System::TObject* Sender);
	void __fastcall SetDate(System::TDateTime Value);
	HIDESBASE void __fastcall SetProperties(TcxDateEditProperties* Value);
	
protected:
	virtual void __fastcall CheckEditorValueBounds(void);
	virtual void __fastcall CreatePopupWindow(void);
	virtual void __fastcall DropDown(void);
	virtual void __fastcall InitializePopupWindow(void);
	virtual AnsiString __fastcall InternalGetText();
	virtual void __fastcall InternalSetDisplayValue(const Variant &Value);
	virtual void __fastcall InternalSetEditValue(const Variant &Value, bool AValidateEditValue);
	virtual bool __fastcall InternalSetText(const AnsiString Value);
	virtual void __fastcall PropertiesChanged(System::TObject* Sender);
	__property TcxPopupCalendar* Calendar = {read=FCalendar};
	__property TcxDateEditProperties* Properties = {read=GetProperties, write=SetProperties};
	
public:
	__fastcall virtual TcxCustomDateEdit(Classes::TComponent* AOwner)/* overload */;
	__fastcall virtual ~TcxCustomDateEdit(void);
	/* virtual class method */ virtual TMetaClass* __fastcall GetPropertiesClass(TMetaClass* vmt);
	virtual void __fastcall PrepareEditValue(const Variant &ADisplayValue, /* out */ Variant &EditValue, bool AEditFocused);
	__property System::TDateTime Date = {read=GetDate, write=SetDate, stored=false};
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomDateEdit(HWND ParentWindow) : Cxdropdownedit::TcxCustomPopupEdit(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxDateEdit;
class PASCALIMPLEMENTATION TcxDateEdit : public TcxCustomDateEdit 
{
	typedef TcxCustomDateEdit inherited;
	
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
	__property EditValue ;
	__property Date ;
	__property BiDiMode ;
	__property ParentBiDiMode  = {default=1};
	__property OnEndDock ;
	__property OnStartDock ;
public:
	#pragma option push -w-inl
	/* TcxCustomDateEdit.Create */ inline __fastcall virtual TcxDateEdit(Classes::TComponent* AOwner)/* overload */ : TcxCustomDateEdit(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomDateEdit.Destroy */ inline __fastcall virtual ~TcxDateEdit(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxDateEdit(HWND ParentWindow) : TcxCustomDateEdit(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxcalendar */
using namespace Cxcalendar;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxCalendar
