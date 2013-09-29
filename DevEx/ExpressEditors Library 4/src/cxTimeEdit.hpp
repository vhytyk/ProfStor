// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxTimeEdit.pas' rev: 6.00

#ifndef cxTimeEditHPP
#define cxTimeEditHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Menus.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <cxTextEdit.hpp>	// Pascal unit
#include <cxMaskEdit.hpp>	// Pascal unit
#include <cxVariants.hpp>	// Pascal unit
#include <cxSpinEdit.hpp>	// Pascal unit
#include <cxFormats.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxDateUtils.hpp>	// Pascal unit
#include <cxDataUtils.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <Variants.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxtimeedit
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TcxTimeEditTimeFormat { tfHourMinSec, tfHourMin, tfHour };
#pragma option pop

class DELPHICLASS TcxCustomTimeEditProperties;
class PASCALIMPLEMENTATION TcxCustomTimeEditProperties : public Cxspinedit::TcxCustomSpinEditProperties 
{
	typedef Cxspinedit::TcxCustomSpinEditProperties inherited;
	
private:
	bool FShowDate;
	TcxTimeEditTimeFormat FTimeFormat;
	bool FUse24HourFormat;
	void __fastcall FormatChanged(void);
	void __fastcall SetUse24HourFormat(bool Value);
	void __fastcall SetShowDate(bool Value);
	void __fastcall SetTimeFormat(TcxTimeEditTimeFormat Value);
	
protected:
	virtual Variant __fastcall DefaultFocusedDisplayValue();
	virtual Cxedit::TcxEditDisplayFormatOptions __fastcall GetDisplayFormatOptions(void);
	virtual bool __fastcall IsDisplayValueNumeric(void);
	virtual bool __fastcall IsEditValueNumeric(void);
	virtual bool __fastcall PreserveSelection(void);
	void __fastcall UpdateEditMask(void);
	__property bool ShowDate = {read=FShowDate, write=SetShowDate, default=0};
	__property TcxTimeEditTimeFormat TimeFormat = {read=FTimeFormat, write=SetTimeFormat, default=0};
	__property bool Use24HourFormat = {read=FUse24HourFormat, write=SetUse24HourFormat, default=1};
	
public:
	__fastcall virtual TcxCustomTimeEditProperties(Classes::TPersistent* AOwner);
	__fastcall virtual ~TcxCustomTimeEditProperties(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	/* virtual class method */ virtual TMetaClass* __fastcall GetContainerClass(TMetaClass* vmt);
	virtual Cxdatautils::TcxDataEditValueSource __fastcall GetEditValueSource(bool AEditFocused);
	virtual bool __fastcall IsDisplayValueValid(Variant &DisplayValue, bool AEditFocused);
	virtual bool __fastcall IsEditValueValid(Variant &EditValue, bool AEditFocused);
	virtual void __fastcall PrepareDisplayValue(const Variant &AEditValue, Variant &DisplayValue, bool AEditFocused);
private:
	void *__IcxFormatContollerListener;	/* Cxformats::IcxFormatContollerListener */
	
public:
	operator IcxFormatContollerListener*(void) { return (IcxFormatContollerListener*)&__IcxFormatContollerListener; }
	
};


class DELPHICLASS TcxTimeEditProperties;
class PASCALIMPLEMENTATION TcxTimeEditProperties : public TcxCustomTimeEditProperties 
{
	typedef TcxCustomTimeEditProperties inherited;
	
__published:
	__property Alignment ;
	__property AutoSelect  = {default=1};
	__property BeepOnError  = {default=0};
	__property HideSelection  = {default=1};
	__property ImmediatePost  = {default=0};
	__property ReadOnly ;
	__property ShowDate  = {default=0};
	__property TimeFormat  = {default=0};
	__property UseCtrlIncrement  = {default=0};
	__property UseLeftAlignmentOnEditing ;
	__property Use24HourFormat  = {default=1};
	__property OnChange ;
	__property OnEditValueChanged ;
	__property OnValidate ;
public:
	#pragma option push -w-inl
	/* TcxCustomTimeEditProperties.Create */ inline __fastcall virtual TcxTimeEditProperties(Classes::TPersistent* AOwner) : TcxCustomTimeEditProperties(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomTimeEditProperties.Destroy */ inline __fastcall virtual ~TcxTimeEditProperties(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomTimeEdit;
class PASCALIMPLEMENTATION TcxCustomTimeEdit : public Cxspinedit::TcxCustomSpinEdit 
{
	typedef Cxspinedit::TcxCustomSpinEdit inherited;
	
private:
	bool FBackSpaceProcessing;
	TDate FSavedDate;
	HIDESBASE TcxTimeEditProperties* __fastcall GetProperties(void);
	TTime __fastcall GetTime(void);
	HIDESBASE void __fastcall SetProperties(TcxTimeEditProperties* Value);
	void __fastcall SetTime(TTime Value);
	
protected:
	virtual void __fastcall DoEditKeyDown(Word &Key, Classes::TShiftState Shift);
	virtual void __fastcall DoEditKeyPress(char &Key);
	virtual bool __fastcall ExtendValueUpToBound(void);
	virtual double __fastcall GetIncrement(Cxspinedit::TcxSpinEditButton AButton);
	virtual Variant __fastcall GetValue();
	virtual AnsiString __fastcall InternalGetText();
	virtual void __fastcall InternalSetDisplayValue(const Variant &Value);
	virtual void __fastcall InternalSetEditValue(const Variant &Value, bool AValidateEditValue);
	virtual bool __fastcall InternalSetText(const AnsiString Value);
	virtual bool __fastcall IsValidChar(char AChar);
	virtual void __fastcall PropertiesChanged(System::TObject* Sender);
	virtual void __fastcall SetValue(const Variant &Value);
	char __fastcall EditingPlace(void);
	__property TcxTimeEditProperties* Properties = {read=GetProperties, write=SetProperties};
	__property TTime Time = {read=GetTime, write=SetTime, stored=false};
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetPropertiesClass(TMetaClass* vmt);
	virtual bool __fastcall Increment(Cxspinedit::TcxSpinEditButton AButton);
	virtual void __fastcall PrepareEditValue(const Variant &ADisplayValue, /* out */ Variant &EditValue, bool AEditFocused);
public:
	#pragma option push -w-inl
	/* TcxCustomSpinEdit.Create */ inline __fastcall virtual TcxCustomTimeEdit(Classes::TComponent* AOwner)/* overload */ : Cxspinedit::TcxCustomSpinEdit(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomMaskEdit.Destroy */ inline __fastcall virtual ~TcxCustomTimeEdit(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomTimeEdit(HWND ParentWindow) : Cxspinedit::TcxCustomSpinEdit(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxTimeEdit;
class PASCALIMPLEMENTATION TcxTimeEdit : public TcxCustomTimeEdit 
{
	typedef TcxCustomTimeEdit inherited;
	
__published:
	__property Anchors  = {default=3};
	__property AutoSize  = {default=1};
	__property BeepOnEnter  = {default=1};
	__property Constraints ;
	__property DragMode  = {default=0};
	__property EditValue ;
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
	__property Time ;
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
	/* TcxCustomSpinEdit.Create */ inline __fastcall virtual TcxTimeEdit(Classes::TComponent* AOwner)/* overload */ : TcxCustomTimeEdit(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomMaskEdit.Destroy */ inline __fastcall virtual ~TcxTimeEdit(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxTimeEdit(HWND ParentWindow) : TcxCustomTimeEdit(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxtimeedit */
using namespace Cxtimeedit;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxTimeEdit
