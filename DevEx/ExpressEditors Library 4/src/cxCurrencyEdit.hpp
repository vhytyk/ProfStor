// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxCurrencyEdit.pas' rev: 6.00

#ifndef cxCurrencyEditHPP
#define cxCurrencyEditHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxControls.hpp>	// Pascal unit
#include <cxFormats.hpp>	// Pascal unit
#include <cxTextEdit.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxDataUtils.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <Clipbrd.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Types.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxcurrencyedit
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxCurrencyEditPropertiesValues;
class PASCALIMPLEMENTATION TcxCurrencyEditPropertiesValues : public Cxedit::TcxCustomEditPropertiesValues 
{
	typedef Cxedit::TcxCustomEditPropertiesValues inherited;
	
public:
	bool DisplayFormat;
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual void __fastcall Reset(void);
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxCurrencyEditPropertiesValues(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxCurrencyEditPropertiesValues(void) : Cxedit::TcxCustomEditPropertiesValues() { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomCurrencyEditProperties;
class PASCALIMPLEMENTATION TcxCustomCurrencyEditProperties : public Cxtextedit::TcxCustomTextEditProperties 
{
	typedef Cxtextedit::TcxCustomTextEditProperties inherited;
	
private:
	int FDecimalPlaces;
	AnsiString FDisplayFormat;
	bool FFormatChanging;
	bool FNullable;
	AnsiString FNullString;
	bool FUseThousandSeparator;
	bool __fastcall FormatDisplayValue(bool AEditFocused);
	HIDESBASE TcxCurrencyEditPropertiesValues* __fastcall GetAssignedValues(void);
	AnsiString __fastcall GetDisplayFormat();
	bool __fastcall IsDisplayFormatStored(void);
	void __fastcall SetDisplayFormat(const AnsiString Value);
	void __fastcall SetNullable(const bool Value);
	void __fastcall SetNullString(const AnsiString Value);
	void __fastcall SetUseThousandSeparator(const bool Value);
	
protected:
	void __fastcall FormatChanged(void);
	virtual Cxedit::TcxEditDisplayFormatOptions __fastcall GetDisplayFormatOptions(void);
	bool __fastcall StrToFloatEx(AnsiString S, double &Value);
	__property TcxCurrencyEditPropertiesValues* AssignedValues = {read=GetAssignedValues};
	__property int DecimalPlaces = {read=FDecimalPlaces, write=FDecimalPlaces, default=2};
	__property AnsiString DisplayFormat = {read=GetDisplayFormat, write=SetDisplayFormat, stored=IsDisplayFormatStored};
	__property bool Nullable = {read=FNullable, write=SetNullable, default=1};
	__property AnsiString NullString = {read=FNullString, write=SetNullString};
	__property bool UseThousandSeparator = {read=FUseThousandSeparator, write=SetUseThousandSeparator, default=0};
	
public:
	__fastcall virtual TcxCustomCurrencyEditProperties(Classes::TPersistent* AOwner);
	__fastcall virtual ~TcxCustomCurrencyEditProperties(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	/* virtual class method */ virtual TMetaClass* __fastcall GetAssignedValuesClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall GetContainerClass(TMetaClass* vmt);
	virtual Cxdatautils::TcxDataEditValueSource __fastcall GetEditValueSource(bool AEditFocused);
	virtual bool __fastcall IsDisplayValueValid(Variant &DisplayValue, bool AEditFocused);
	virtual bool __fastcall IsEditValueNumeric(void);
	virtual void __fastcall PrepareDisplayValue(const Variant &AEditValue, Variant &DisplayValue, bool AEditFocused);
	virtual void __fastcall ValidateDisplayValue(Variant &ADisplayValue, AnsiString &AErrorText, bool &Error, Cxedit::TcxCustomEdit* AEdit);
private:
	void *__IcxFormatContollerListener;	/* Cxformats::IcxFormatContollerListener */
	
public:
	operator IcxFormatContollerListener*(void) { return (IcxFormatContollerListener*)&__IcxFormatContollerListener; }
	
};


class DELPHICLASS TcxCurrencyEditProperties;
class PASCALIMPLEMENTATION TcxCurrencyEditProperties : public TcxCustomCurrencyEditProperties 
{
	typedef TcxCustomCurrencyEditProperties inherited;
	
__published:
	__property Alignment ;
	__property AutoSelect  = {default=1};
	__property DecimalPlaces  = {default=2};
	__property DisplayFormat ;
	__property HideSelection  = {default=1};
	__property MaxValue ;
	__property MinValue ;
	__property Nullable  = {default=1};
	__property NullString ;
	__property ReadOnly ;
	__property UseLeftAlignmentOnEditing ;
	__property UseThousandSeparator  = {default=0};
	__property OnChange ;
	__property OnEditValueChanged ;
	__property OnValidate ;
public:
	#pragma option push -w-inl
	/* TcxCustomCurrencyEditProperties.Create */ inline __fastcall virtual TcxCurrencyEditProperties(Classes::TPersistent* AOwner) : TcxCustomCurrencyEditProperties(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomCurrencyEditProperties.Destroy */ inline __fastcall virtual ~TcxCurrencyEditProperties(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomCurrencyEdit;
class PASCALIMPLEMENTATION TcxCustomCurrencyEdit : public Cxtextedit::TcxCustomTextEdit 
{
	typedef Cxtextedit::TcxCustomTextEdit inherited;
	
private:
	HIDESBASE TcxCurrencyEditProperties* __fastcall GetProperties(void);
	double __fastcall GetValue(void);
	HIDESBASE void __fastcall SetProperties(TcxCurrencyEditProperties* Value);
	void __fastcall SetValue(double Value);
	
protected:
	void __fastcall FormatChanged(void);
	virtual bool __fastcall IsValidChar(char Key);
	DYNAMIC void __fastcall KeyPress(char &Key);
	virtual void __fastcall PropertiesChanged(System::TObject* Sender);
	__property TcxCurrencyEditProperties* Properties = {read=GetProperties, write=SetProperties};
	__property double Value = {read=GetValue, write=SetValue, stored=false};
	
public:
	__fastcall virtual TcxCustomCurrencyEdit(Classes::TComponent* AOwner)/* overload */;
	__fastcall virtual ~TcxCustomCurrencyEdit(void);
	/* virtual class method */ virtual TMetaClass* __fastcall GetPropertiesClass(TMetaClass* vmt);
	virtual void __fastcall PasteFromClipboard(void);
	virtual void __fastcall PrepareEditValue(const Variant &ADisplayValue, /* out */ Variant &EditValue, bool AEditFocused);
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomCurrencyEdit(HWND ParentWindow) : Cxtextedit::TcxCustomTextEdit(ParentWindow) { }
	#pragma option pop
	
private:
	void *__IcxFormatContollerListener;	/* Cxformats::IcxFormatContollerListener */
	
public:
	operator IcxFormatContollerListener*(void) { return (IcxFormatContollerListener*)&__IcxFormatContollerListener; }
	
};


class DELPHICLASS TcxCurrencyEdit;
class PASCALIMPLEMENTATION TcxCurrencyEdit : public TcxCustomCurrencyEdit 
{
	typedef TcxCustomCurrencyEdit inherited;
	
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
	__property Properties ;
	__property ShowHint ;
	__property Style ;
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=1};
	__property Value ;
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
	/* TcxCustomCurrencyEdit.Create */ inline __fastcall virtual TcxCurrencyEdit(Classes::TComponent* AOwner)/* overload */ : TcxCustomCurrencyEdit(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomCurrencyEdit.Destroy */ inline __fastcall virtual ~TcxCurrencyEdit(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCurrencyEdit(HWND ParentWindow) : TcxCustomCurrencyEdit(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxcurrencyedit */
using namespace Cxcurrencyedit;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxCurrencyEdit
