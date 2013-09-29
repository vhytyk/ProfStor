// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxMaskEdit.pas' rev: 6.00

#ifndef cxMaskEditHPP
#define cxMaskEditHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Menus.hpp>	// Pascal unit
#include <cxDataUtils.hpp>	// Pascal unit
#include <cxTextEdit.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <cxEditConsts.hpp>	// Pascal unit
#include <Clipbrd.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <cxStandardMask.hpp>	// Pascal unit
#include <cxRegExpr.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <Variants.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxmaskedit
{
//-- type declarations -------------------------------------------------------
typedef AnsiString TcxEditMask;

#pragma option push -b-
enum TcxEditMaskKind { emkStandard, emkRegExpr, emkRegExprEx };
#pragma option pop

class DELPHICLASS TcxCustomTextEditAccessor;
class PASCALIMPLEMENTATION TcxCustomTextEditAccessor : public Cxtextedit::TcxCustomTextEdit 
{
	typedef Cxtextedit::TcxCustomTextEdit inherited;
	
public:
	#pragma option push -w-inl
	/* TcxCustomTextEdit.Create */ inline __fastcall virtual TcxCustomTextEditAccessor(Classes::TComponent* AOwner)/* overload */ : Cxtextedit::TcxCustomTextEdit(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomTextEdit.Destroy */ inline __fastcall virtual ~TcxCustomTextEditAccessor(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomTextEditAccessor(HWND ParentWindow) : Cxtextedit::TcxCustomTextEdit(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS EcxMaskEditError;
class PASCALIMPLEMENTATION EcxMaskEditError : public Sysutils::Exception 
{
	typedef Sysutils::Exception inherited;
	
public:
	#pragma option push -w-inl
	/* Exception.Create */ inline __fastcall EcxMaskEditError(const AnsiString Msg) : Sysutils::Exception(Msg) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateFmt */ inline __fastcall EcxMaskEditError(const AnsiString Msg, const System::TVarRec * Args, const int Args_Size) : Sysutils::Exception(Msg, Args, Args_Size) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateRes */ inline __fastcall EcxMaskEditError(int Ident)/* overload */ : Sysutils::Exception(Ident) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResFmt */ inline __fastcall EcxMaskEditError(int Ident, const System::TVarRec * Args, const int Args_Size)/* overload */ : Sysutils::Exception(Ident, Args, Args_Size) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateHelp */ inline __fastcall EcxMaskEditError(const AnsiString Msg, int AHelpContext) : Sysutils::Exception(Msg, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateFmtHelp */ inline __fastcall EcxMaskEditError(const AnsiString Msg, const System::TVarRec * Args, const int Args_Size, int AHelpContext) : Sysutils::Exception(Msg, Args, Args_Size, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResHelp */ inline __fastcall EcxMaskEditError(int Ident, int AHelpContext)/* overload */ : Sysutils::Exception(Ident, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResFmtHelp */ inline __fastcall EcxMaskEditError(System::PResStringRec ResStringRec, const System::TVarRec * Args, const int Args_Size, int AHelpContext)/* overload */ : Sysutils::Exception(ResStringRec, Args, Args_Size, AHelpContext) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~EcxMaskEditError(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxMaskEditCustomMode;
class DELPHICLASS TcxCustomMaskEditProperties;
class DELPHICLASS TcxCustomMaskEdit;
class DELPHICLASS TcxMaskEditProperties;
class PASCALIMPLEMENTATION TcxCustomMaskEdit : public Cxtextedit::TcxCustomTextEdit 
{
	typedef Cxtextedit::TcxCustomTextEdit inherited;
	
private:
	TcxMaskEditCustomMode* FMode;
	bool FMyMessage;
	bool FShiftOn;
	AnsiString FText;
	AnsiString __fastcall GetEditText();
	HIDESBASE TcxMaskEditProperties* __fastcall GetProperties(void);
	AnsiString __fastcall InternalGetEmptyString();
	void __fastcall InternalSetValue(AnsiString AValue);
	bool __fastcall IsCursorBegin(void);
	bool __fastcall IsCursorEnd(void);
	void __fastcall SetEditText(AnsiString AValue);
	HIDESBASE void __fastcall SetProperties(const TcxMaskEditProperties* Value);
	void __fastcall SendMyKeyDown(Word Key, Classes::TShiftState Shift);
	void __fastcall SendMyKeyPress(char AKey);
	
protected:
	virtual void __fastcall ChangeHandler(System::TObject* Sender);
	DYNAMIC void __fastcall DblClick(void);
	DYNAMIC void __fastcall DoEnter(void);
	virtual void __fastcall DoEditKeyDown(Word &Key, Classes::TShiftState Shift);
	virtual void __fastcall DoEditKeyPress(char &Key);
	virtual void __fastcall DoEditKeyUp(Word &Key, Classes::TShiftState Shift);
	virtual AnsiString __fastcall InternalGetText();
	virtual void __fastcall InternalSetDisplayValue(const Variant &Value);
	virtual bool __fastcall InternalSetText(const AnsiString Value);
	virtual void __fastcall Loaded(void);
	DYNAMIC void __fastcall MouseDown(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseMove(Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseUp(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall PropertiesChanged(System::TObject* Sender);
	virtual void __fastcall RepositoryItemAssigned(void);
	virtual void __fastcall SetSelLength(int Value);
	virtual void __fastcall SetSelStart(int Value);
	virtual void __fastcall SetSelText(const AnsiString Value);
	virtual void __fastcall SynchronizeDisplayValue(void);
	__property TcxMaskEditCustomMode* Mode = {read=FMode};
	__property TcxMaskEditProperties* Properties = {read=GetProperties, write=SetProperties};
	
public:
	__fastcall virtual TcxCustomMaskEdit(Classes::TComponent* AOwner)/* overload */;
	__fastcall virtual ~TcxCustomMaskEdit(void);
	virtual void __fastcall CutToClipboard(void);
	/* virtual class method */ virtual TMetaClass* __fastcall GetPropertiesClass(TMetaClass* vmt);
	virtual void __fastcall PasteFromClipboard(void);
	virtual void __fastcall PrepareEditValue(const Variant &ADisplayValue, /* out */ Variant &EditValue, bool AEditFocused);
	__property AnsiString EditText = {read=GetEditText, write=SetEditText};
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomMaskEdit(HWND ParentWindow) : Cxtextedit::TcxCustomTextEdit(ParentWindow) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxMaskEditCustomMode : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	AnsiString FEditMask;
	Stdctrls::TEditCharCase FCharCase;
	Cxedit::TcxEditEchoMode FEchoMode;
	TcxCustomMaskEditProperties* __fastcall GetProperties(void);
	
protected:
	int FClipboardTextLength;
	TcxCustomMaskEdit* FEdit;
	bool FNeedUpdateEditValue;
	TcxCustomMaskEditProperties* FProperties;
	void __fastcall ClearText(void);
	void __fastcall DirectSetSelLength(int AValue);
	void __fastcall DirectSetSelStart(int AValue);
	virtual TcxEditMaskKind __fastcall GetMaskKind(void);
	bool __fastcall HasEdit(void);
	__property Stdctrls::TEditCharCase CharCase = {read=FCharCase, write=FCharCase, nodefault};
	__property Cxedit::TcxEditEchoMode EchoMode = {read=FEchoMode, write=FEchoMode, nodefault};
	__property AnsiString EditMask = {read=FEditMask};
	__property TcxCustomMaskEditProperties* Properties = {read=GetProperties, write=FProperties};
	
public:
	__fastcall virtual TcxMaskEditCustomMode(TcxCustomMaskEdit* AEdit, TcxCustomMaskEditProperties* AProperties);
	virtual void __fastcall AfterPasteFromClipboard(void) = 0 ;
	void __fastcall BeepOnError(void);
	virtual void __fastcall Compile(AnsiString AMask) = 0 ;
	virtual AnsiString __fastcall GetEmptyString(void) = 0 ;
	virtual AnsiString __fastcall GetFormattedText(AnsiString AText) = 0 ;
	virtual void __fastcall GotoEnd(void) = 0 ;
	virtual bool __fastcall IsCursorBegin(void) = 0 ;
	virtual bool __fastcall IsCursorEnd(void) = 0 ;
	virtual bool __fastcall IsFullValidText(AnsiString AText) = 0 ;
	virtual void __fastcall LMouseDown(void) = 0 ;
	virtual void __fastcall PrePasteFromClipboard(void) = 0 ;
	virtual bool __fastcall PressBackSpace(void) = 0 ;
	virtual bool __fastcall PressDelete(void) = 0 ;
	virtual bool __fastcall PressEnd(void) = 0 ;
	virtual bool __fastcall PressHome(void) = 0 ;
	virtual bool __fastcall PressLeft(void) = 0 ;
	virtual bool __fastcall PressRight(void) = 0 ;
	virtual bool __fastcall PressSymbol(char &ASymbol) = 0 ;
	virtual void __fastcall SetText(AnsiString AText) = 0 ;
	virtual void __fastcall SynchronizeEditValue(void);
	virtual void __fastcall UpdateEditValue(void) = 0 ;
	virtual AnsiString __fastcall GetUpdatedText(const AnsiString AText) = 0 ;
	__property int ClipboardTextLength = {read=FClipboardTextLength, write=FClipboardTextLength, nodefault};
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxMaskEditCustomMode(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxMaskEditStandardMode;
class PASCALIMPLEMENTATION TcxMaskEditStandardMode : public TcxMaskEditCustomMode 
{
	typedef TcxMaskEditCustomMode inherited;
	
protected:
	Cxstandardmask::TcxStandardMask* FMask;
	int FSelStart;
	
public:
	__fastcall virtual TcxMaskEditStandardMode(TcxCustomMaskEdit* AEdit, TcxCustomMaskEditProperties* AProperties);
	__fastcall virtual ~TcxMaskEditStandardMode(void);
	virtual void __fastcall AfterPasteFromClipboard(void);
	virtual void __fastcall Compile(AnsiString AMask);
	char __fastcall GetBlank(void);
	virtual AnsiString __fastcall GetEmptyString();
	virtual AnsiString __fastcall GetFormattedText(AnsiString AText);
	virtual void __fastcall GotoEnd(void);
	virtual bool __fastcall IsCursorBegin(void);
	virtual bool __fastcall IsCursorEnd(void);
	virtual bool __fastcall IsFullValidText(AnsiString AText);
	virtual void __fastcall LMouseDown(void);
	virtual void __fastcall PrePasteFromClipboard(void);
	virtual bool __fastcall PressBackSpace(void);
	virtual bool __fastcall PressDelete(void);
	virtual bool __fastcall PressEnd(void);
	virtual bool __fastcall PressHome(void);
	virtual bool __fastcall PressLeft(void);
	virtual bool __fastcall PressRight(void);
	virtual bool __fastcall PressSymbol(char &ASymbol);
	virtual void __fastcall SetText(AnsiString AText);
	virtual void __fastcall SynchronizeEditValue(void);
	virtual void __fastcall UpdateEditValue(void);
	virtual AnsiString __fastcall GetUpdatedText(const AnsiString AText);
};


class DELPHICLASS TcxMaskEditRegExprMode;
class PASCALIMPLEMENTATION TcxMaskEditRegExprMode : public TcxMaskEditCustomMode 
{
	typedef TcxMaskEditCustomMode inherited;
	
protected:
	bool FBeginCursor;
	AnsiString FHead;
	Cxregexpr::TcxRegExpr* FRegExpr;
	AnsiString FSelect;
	AnsiString FTail;
	bool FMouseAction;
	void __fastcall ClearTail(void);
	bool __fastcall CompileRegExpr(Cxregexpr::TcxRegExpr* ARegExpr);
	void __fastcall CursorCorrection(void);
	virtual void __fastcall DeleteSelection(void);
	virtual TcxEditMaskKind __fastcall GetMaskKind(void);
	bool __fastcall NextTail(void);
	virtual void __fastcall RestoreSelection(void);
	
public:
	__fastcall virtual TcxMaskEditRegExprMode(TcxCustomMaskEdit* AEdit, TcxCustomMaskEditProperties* AProperties);
	__fastcall virtual ~TcxMaskEditRegExprMode(void);
	virtual void __fastcall AfterPasteFromClipboard(void);
	virtual void __fastcall Compile(AnsiString AMask);
	virtual AnsiString __fastcall GetEmptyString();
	virtual AnsiString __fastcall GetFormattedText(AnsiString AText);
	virtual void __fastcall GotoEnd(void);
	virtual bool __fastcall IsCursorBegin(void);
	virtual bool __fastcall IsCursorEnd(void);
	virtual bool __fastcall IsFullValidText(AnsiString AText);
	virtual void __fastcall LMouseDown(void);
	virtual void __fastcall PrePasteFromClipboard(void);
	virtual bool __fastcall PressBackSpace(void);
	virtual bool __fastcall PressDelete(void);
	virtual bool __fastcall PressEnd(void);
	virtual bool __fastcall PressHome(void);
	virtual bool __fastcall PressLeft(void);
	virtual bool __fastcall PressRight(void);
	virtual bool __fastcall PressSymbol(char &ASymbol);
	virtual void __fastcall SetText(AnsiString AText);
	void __fastcall SetRegExprCaseInsensitive(void);
	virtual void __fastcall SynchronizeEditValue(void);
	virtual void __fastcall UpdateEditValue(void);
	virtual AnsiString __fastcall GetUpdatedText(const AnsiString AText);
};


class DELPHICLASS TcxMaskEditRegExprExMode;
class PASCALIMPLEMENTATION TcxMaskEditRegExprExMode : public TcxMaskEditRegExprMode 
{
	typedef TcxMaskEditRegExprMode inherited;
	
private:
	AnsiString FInternalUpdate;
	void __fastcall InternalSymbolUpdate(char ASymbol);
	
protected:
	int FDeleteNumber;
	int FNewCursorPos;
	AnsiString FUpdate;
	void __fastcall Clear(void);
	HIDESBASE void __fastcall CursorCorrection(void);
	virtual void __fastcall DeleteSelection(void);
	virtual TcxEditMaskKind __fastcall GetMaskKind(void);
	virtual void __fastcall RestoreSelection(void);
	void __fastcall SymbolDelete(void);
	void __fastcall SymbolUpdate(char ASymbol);
	void __fastcall UpdateTail(void);
	
public:
	__fastcall virtual TcxMaskEditRegExprExMode(TcxCustomMaskEdit* AEdit, TcxCustomMaskEditProperties* AProperties);
	__fastcall virtual ~TcxMaskEditRegExprExMode(void);
	virtual void __fastcall AfterPasteFromClipboard(void);
	virtual void __fastcall Compile(AnsiString AMask);
	virtual AnsiString __fastcall GetEmptyString();
	virtual AnsiString __fastcall GetFormattedText(AnsiString AText);
	virtual void __fastcall GotoEnd(void);
	virtual bool __fastcall IsFullValidText(AnsiString AText);
	virtual void __fastcall PrePasteFromClipboard(void);
	virtual bool __fastcall PressBackSpace(void);
	virtual bool __fastcall PressDelete(void);
	virtual bool __fastcall PressEnd(void);
	virtual bool __fastcall PressHome(void);
	virtual bool __fastcall PressLeft(void);
	virtual bool __fastcall PressRight(void);
	virtual bool __fastcall PressSymbol(char &ASymbol);
	virtual void __fastcall SetText(AnsiString AText);
	virtual void __fastcall UpdateEditValue(void);
};


class PASCALIMPLEMENTATION TcxCustomMaskEditProperties : public Cxtextedit::TcxCustomTextEditProperties 
{
	typedef Cxtextedit::TcxCustomTextEditProperties inherited;
	
private:
	bool FCaseInsensitive;
	AnsiString FEditMask;
	AnsiString FEmptyString;
	bool FIgnoreMaskBlank;
	TcxEditMaskKind FMaskKind;
	TcxMaskEditCustomMode* FTempMode;
	bool FAlwaysShowBlanksAndLiterals;
	TcxMaskEditCustomMode* __fastcall CreateMode(void);
	TcxMaskEditCustomMode* __fastcall CreateMode1(void);
	AnsiString __fastcall GetEditMask();
	bool __fastcall GetIsMasked(void);
	void __fastcall SetAlwaysShowBlanksAndLiterals(bool AValue);
	void __fastcall SetCaseInsensitive(bool AValue);
	void __fastcall SetEditMask(AnsiString Value);
	void __fastcall SetMaskKind(TcxEditMaskKind Value);
	bool __fastcall SpaceToken(char AToken);
	bool __fastcall TestTempEditMask(void);
	bool __fastcall TestTempMaskKind(void);
	
protected:
	bool __fastcall EmptyMask(AnsiString AMask);
	AnsiString __fastcall GetEmptyString();
	virtual void __fastcall SetCharCase(Stdctrls::TEditCharCase Value);
	virtual void __fastcall SetMaxLength(int Value);
	virtual Cxedit::TcxEditDisplayFormatOptions __fastcall GetDisplayFormatOptions(void);
	virtual bool __fastcall UseLookupData(void);
	__property bool CaseInsensitive = {read=FCaseInsensitive, write=SetCaseInsensitive, default=1};
	__property AnsiString EditMask = {read=GetEditMask, write=SetEditMask};
	__property bool IgnoreMaskBlank = {read=FIgnoreMaskBlank, write=FIgnoreMaskBlank, default=0};
	__property TcxEditMaskKind MaskKind = {read=FMaskKind, write=SetMaskKind, default=0};
	__property ValidateOnEnter  = {default=1};
	
public:
	__fastcall virtual TcxCustomMaskEditProperties(Classes::TPersistent* AOwner);
	__fastcall virtual ~TcxCustomMaskEditProperties(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	/* virtual class method */ virtual TMetaClass* __fastcall GetContainerClass(TMetaClass* vmt);
	virtual bool __fastcall IsEditValueValid(Variant &EditValue, bool AEditFocused);
	virtual void __fastcall PrepareDisplayValue(const Variant &AEditValue, Variant &DisplayValue, bool AEditFocused);
	virtual void __fastcall ValidateDisplayValue(Variant &ADisplayValue, AnsiString &AErrorText, bool &Error, Cxedit::TcxCustomEdit* AEdit);
	__property bool IsMasked = {read=GetIsMasked, nodefault};
	__property bool AlwaysShowBlanksAndLiterals = {read=FAlwaysShowBlanksAndLiterals, write=SetAlwaysShowBlanksAndLiterals, nodefault};
};


class PASCALIMPLEMENTATION TcxMaskEditProperties : public TcxCustomMaskEditProperties 
{
	typedef TcxCustomMaskEditProperties inherited;
	
__published:
	__property Alignment ;
	__property AutoSelect  = {default=1};
	__property BeepOnError  = {default=0};
	__property CaseInsensitive  = {default=1};
	__property CharCase  = {default=0};
	__property EchoMode  = {default=0};
	__property HideSelection  = {default=1};
	__property IgnoreMaskBlank  = {default=0};
	__property LookupItems ;
	__property LookupItemsSorted  = {default=0};
	__property MaskKind  = {default=0};
	__property EditMask ;
	__property MaxLength ;
	__property OEMConvert  = {default=0};
	__property ReadOnly ;
	__property UseLeftAlignmentOnEditing ;
	__property ValidateOnEnter  = {default=1};
	__property OnChange ;
	__property OnEditValueChanged ;
	__property OnNewLookupDisplayText ;
	__property OnValidate ;
public:
	#pragma option push -w-inl
	/* TcxCustomMaskEditProperties.Create */ inline __fastcall virtual TcxMaskEditProperties(Classes::TPersistent* AOwner) : TcxCustomMaskEditProperties(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomMaskEditProperties.Destroy */ inline __fastcall virtual ~TcxMaskEditProperties(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxMaskEdit;
class PASCALIMPLEMENTATION TcxMaskEdit : public TcxCustomMaskEdit 
{
	typedef TcxCustomMaskEdit inherited;
	
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
	__property Text ;
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
	/* TcxCustomMaskEdit.Create */ inline __fastcall virtual TcxMaskEdit(Classes::TComponent* AOwner)/* overload */ : TcxCustomMaskEdit(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomMaskEdit.Destroy */ inline __fastcall virtual ~TcxMaskEdit(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxMaskEdit(HWND ParentWindow) : TcxCustomMaskEdit(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE bool __fastcall IsAlphaChar(char ch);

}	/* namespace Cxmaskedit */
using namespace Cxmaskedit;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxMaskEdit
