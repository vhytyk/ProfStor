// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxCheckBox.pas' rev: 6.00

#ifndef cxCheckBoxHPP
#define cxCheckBoxHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Menus.hpp>	// Pascal unit
#include <cxVariants.hpp>	// Pascal unit
#include <cxTextEdit.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxCustomData.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Variants.hpp>	// Pascal unit
#include <Types.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxcheckbox
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TcxCheckBoxNullValueShowingStyle { nssUnchecked, nssInactive, nssGrayedChecked };
#pragma option pop

#pragma option push -b-
enum TcxCheckBoxState { cbsUnchecked, cbsChecked, cbsGrayed };
#pragma option pop

typedef Cxedit::TcxEditBorderStyle TcxEditCheckBoxBorderStyle;

#pragma option push -b-
enum TcxEditCheckState { ecsNormal, ecsHot, ecsPressed, ecsDisabled };
#pragma option pop

class DELPHICLASS TcxCustomCheckBoxViewInfo;
class PASCALIMPLEMENTATION TcxCustomCheckBoxViewInfo : public Cxtextedit::TcxCustomTextEditViewInfo 
{
	typedef Cxtextedit::TcxCustomTextEditViewInfo inherited;
	
protected:
	virtual void __fastcall InternalPaint(Cxgraphics::TcxCanvas* ACanvas);
	
public:
	Classes::TAlignment Alignment;
	Cxedit::TcxEditBorderStyle CheckBoxBorderStyle;
	Graphics::TBitmap* CheckBoxGlyph;
	int CheckBoxGlyphCount;
	#pragma pack(push, 1)
	Types::TRect CheckBoxRect;
	#pragma pack(pop)
	
	TcxEditCheckState CheckBoxState;
	int DrawCaptionFlags;
	#pragma pack(push, 1)
	Types::TRect FocusRect;
	#pragma pack(pop)
	
	bool FullFocusRect;
	bool HasGlyph;
	TcxCheckBoxNullValueShowingStyle NullValueShowingStyle;
	TcxCheckBoxState State;
	int NativeCheckBoxState;
	bool ParentBackground;
	virtual void __fastcall Assign(System::TObject* Source);
	virtual void __fastcall DrawText(Cxgraphics::TcxCanvas* ACanvas);
	virtual Cxgraphics::TcxRegion* __fastcall GetUpdateRegion(Cxcontainer::TcxContainerViewInfo* AViewInfo);
	virtual bool __fastcall IsHotTrack(void);
	virtual bool __fastcall NeedShowHint(Cxgraphics::TcxCanvas* ACanvas, const Types::TPoint &P, /* out */ AnsiString &AText, /* out */ bool &AIsMultiLine, /* out */ Types::TRect &ATextRect)/* overload */;
	virtual void __fastcall Offset(int DX, int DY);
	virtual bool __fastcall Repaint(Controls::TWinControl* AControl, Cxcontainer::TcxContainerViewInfo* AViewInfo, Types::PRect APInnerEditRect = (void *)(0x0));
public:
	#pragma option push -w-inl
	/* TcxCustomTextEditViewInfo.Destroy */ inline __fastcall virtual ~TcxCustomCheckBoxViewInfo(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomEditViewInfo.Create */ inline __fastcall virtual TcxCustomCheckBoxViewInfo(void) : Cxtextedit::TcxCustomTextEditViewInfo() { }
	#pragma option pop
	
	
/* Hoisted overloads: */
	
public:
	inline bool __fastcall  NeedShowHint(Cxgraphics::TcxCanvas* ACanvas, const Types::TPoint &P, const Types::TRect &AVisibleBounds, /* out */ AnsiString &AText, /* out */ bool &AIsMultiLine, /* out */ Types::TRect &ATextRect){ return TcxCustomTextEditViewInfo::NeedShowHint(ACanvas, P, AVisibleBounds, AText, AIsMultiLine, ATextRect); }
	
};


class DELPHICLASS TcxCustomCheckBoxViewData;
class DELPHICLASS TcxCustomCheckBoxProperties;
class PASCALIMPLEMENTATION TcxCustomCheckBoxViewData : public Cxedit::TcxCustomEditViewData 
{
	typedef Cxedit::TcxCustomEditViewData inherited;
	
private:
	HIDESBASE TcxCustomCheckBoxProperties* __fastcall GetProperties(void);
	HIDESBASE void __fastcall SetProperties(TcxCustomCheckBoxProperties* Value);
	
protected:
	virtual Cxedit::TcxEditBorderStyle __fastcall GetBorderStyle(Cxcontainer::TcxContainerHotState AEditHotStyle);
	virtual tagSIZE __fastcall InternalGetEditConstantPartSize(Cxgraphics::TcxCanvas* ACanvas, bool AIsInplace, const Cxedit::TcxEditSizeProperties &AEditSizeProperties, tagSIZE &MinContentSize, Cxedit::TcxCustomEditViewInfo* AViewInfo);
	virtual int __fastcall GetDrawTextFlags(void);
	bool __fastcall GetIsEditClass(void);
	bool __fastcall IsCheckPressed(void);
	
public:
	virtual void __fastcall Calculate(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ABounds, const Types::TPoint &P, Cxcontainer::TcxMouseButton Button, Classes::TShiftState Shift, Cxedit::TcxCustomEditViewInfo* AViewInfo, bool AIsMouseEvent);
	virtual void __fastcall EditValueToDrawValue(Cxgraphics::TcxCanvas* ACanvas, const Variant &AEditValue, Cxedit::TcxCustomEditViewInfo* AViewInfo);
	__property TcxCustomCheckBoxProperties* Properties = {read=GetProperties, write=SetProperties};
public:
	#pragma option push -w-inl
	/* TcxCustomEditViewData.Create */ inline __fastcall virtual TcxCustomCheckBoxViewData(Cxedit::TcxCustomEditProperties* AProperties, Cxcontainer::TcxContainerStyle* AStyle, bool AIsInplace) : Cxedit::TcxCustomEditViewData(AProperties, AStyle, AIsInplace) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxCustomCheckBoxViewData(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCheckBoxStyle;
class PASCALIMPLEMENTATION TcxCheckBoxStyle : public Cxedit::TcxCustomEditStyle 
{
	typedef Cxedit::TcxCustomEditStyle inherited;
	
protected:
	virtual Graphics::TColor __fastcall DefaultColor(void);
	
public:
	virtual void __fastcall RestoreDefaults(void);
public:
	#pragma option push -w-inl
	/* TcxCustomEditStyle.Create */ inline __fastcall virtual TcxCheckBoxStyle(Classes::TPersistent* AOwner, bool ADirectAccessMode) : Cxedit::TcxCustomEditStyle(AOwner, ADirectAccessMode) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxContainerStyle.Destroy */ inline __fastcall virtual ~TcxCheckBoxStyle(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxCustomCheckBoxProperties : public Cxedit::TcxCustomEditProperties 
{
	typedef Cxedit::TcxCustomEditProperties inherited;
	
private:
	bool FAllowGrayed;
	AnsiString FCaption;
	WideString FDisplayChecked;
	WideString FDisplayGrayed;
	WideString FDisplayUnchecked;
	bool FFullFocusRect;
	Graphics::TBitmap* FGlyph;
	int FGlyphCount;
	bool FIsCaptionAssigned;
	bool FMultiLine;
	TcxCheckBoxNullValueShowingStyle FNullStyle;
	Variant FValueChecked;
	Variant FValueGrayed;
	Variant FValueUnchecked;
	Classes::TAlignment __fastcall GetAlignment(void);
	Graphics::TBitmap* __fastcall GetGlyph(void);
	Cxedit::TcxEditAlignment* __fastcall GetInternalAlignment(void);
	void __fastcall GlyphChanged(System::TObject* Sender);
	HIDESBASE bool __fastcall IsAlignmentStored(void);
	bool __fastcall IsDisplayCheckedStored(void);
	bool __fastcall IsDisplayGrayedStored(void);
	bool __fastcall IsDisplayUncheckedStored(void);
	bool __fastcall IsValueCheckedStored(void);
	bool __fastcall IsValueGrayedStored(void);
	bool __fastcall IsValueUncheckedStored(void);
	void __fastcall ReadCaption(Classes::TReader* Reader);
	void __fastcall SetAlignment(Classes::TAlignment Value);
	void __fastcall SetCaption(AnsiString Value);
	void __fastcall SetFullFocusRect(bool Value);
	void __fastcall SetGlyph(Graphics::TBitmap* Value);
	void __fastcall SetGlyphCount(int Value);
	void __fastcall SetMultiLine(bool Value);
	void __fastcall SetNullStyle(TcxCheckBoxNullValueShowingStyle Value);
	void __fastcall SetValueChecked(const Variant &Value);
	void __fastcall SetValueGrayed(const Variant &Value);
	void __fastcall SetValueUnchecked(const Variant &Value);
	void __fastcall WriteCaption(Classes::TWriter* Writer);
	
protected:
	bool __fastcall CheckValue(const Variant &AValue);
	virtual bool __fastcall CompareEditValue(void);
	virtual void __fastcall DefineProperties(Classes::TFiler* Filer);
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewDataClass(TMetaClass* vmt);
	virtual bool __fastcall HasDisplayValue(void);
	__property Classes::TAlignment Alignment = {read=GetAlignment, write=SetAlignment, stored=IsAlignmentStored, nodefault};
	__property bool AllowGrayed = {read=FAllowGrayed, write=FAllowGrayed, default=0};
	__property AnsiString Caption = {read=FCaption, write=SetCaption, stored=false};
	__property WideString DisplayChecked = {read=FDisplayChecked, write=FDisplayChecked, stored=IsDisplayCheckedStored};
	__property WideString DisplayGrayed = {read=FDisplayGrayed, write=FDisplayGrayed, stored=IsDisplayGrayedStored};
	__property WideString DisplayUnchecked = {read=FDisplayUnchecked, write=FDisplayUnchecked, stored=IsDisplayUncheckedStored};
	__property bool FullFocusRect = {read=FFullFocusRect, write=SetFullFocusRect, default=0};
	__property Graphics::TBitmap* Glyph = {read=GetGlyph, write=SetGlyph};
	__property int GlyphCount = {read=FGlyphCount, write=SetGlyphCount, default=6};
	__property Cxedit::TcxEditAlignment* InternalAlignment = {read=GetInternalAlignment};
	__property bool MultiLine = {read=FMultiLine, write=SetMultiLine, default=0};
	__property TcxCheckBoxNullValueShowingStyle NullStyle = {read=FNullStyle, write=SetNullStyle, default=2};
	__property Variant ValueChecked = {read=FValueChecked, write=SetValueChecked, stored=IsValueCheckedStored};
	__property Variant ValueGrayed = {read=FValueGrayed, write=SetValueGrayed, stored=IsValueGrayedStored};
	__property Variant ValueUnchecked = {read=FValueUnchecked, write=SetValueUnchecked, stored=IsValueUncheckedStored};
	
public:
	__fastcall virtual TcxCustomCheckBoxProperties(Classes::TPersistent* AOwner);
	__fastcall virtual ~TcxCustomCheckBoxProperties(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	/* virtual class method */ virtual TMetaClass* __fastcall GetContainerClass(TMetaClass* vmt);
	virtual WideString __fastcall GetDisplayText(const Variant &AEditValue, bool AFullText = false);
	/* virtual class method */ virtual TMetaClass* __fastcall GetStyleClass(TMetaClass* vmt);
	virtual Cxedit::TcxEditSupportedOperations __fastcall GetSupportedOperations(void);
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewInfoClass(TMetaClass* vmt);
	virtual bool __fastcall IsEditValueValid(Variant &EditValue, bool AEditFocused);
	virtual void __fastcall PrepareDisplayValue(const Variant &AEditValue, Variant &DisplayValue, bool AEditFocused);
};


class DELPHICLASS TcxCheckBoxProperties;
class PASCALIMPLEMENTATION TcxCheckBoxProperties : public TcxCustomCheckBoxProperties 
{
	typedef TcxCustomCheckBoxProperties inherited;
	
__published:
	__property Alignment ;
	__property AllowGrayed  = {default=0};
	__property Caption ;
	__property DisplayChecked ;
	__property DisplayUnchecked ;
	__property DisplayGrayed ;
	__property FullFocusRect  = {default=0};
	__property Glyph ;
	__property GlyphCount  = {default=6};
	__property ImmediatePost  = {default=0};
	__property MultiLine  = {default=0};
	__property NullStyle  = {default=2};
	__property ReadOnly ;
	__property ValueChecked ;
	__property ValueGrayed ;
	__property ValueUnchecked ;
	__property OnChange ;
	__property OnEditValueChanged ;
public:
	#pragma option push -w-inl
	/* TcxCustomCheckBoxProperties.Create */ inline __fastcall virtual TcxCheckBoxProperties(Classes::TPersistent* AOwner) : TcxCustomCheckBoxProperties(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomCheckBoxProperties.Destroy */ inline __fastcall virtual ~TcxCheckBoxProperties(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomCheckBox;
class PASCALIMPLEMENTATION TcxCustomCheckBox : public Cxedit::TcxCustomEdit 
{
	typedef Cxedit::TcxCustomEdit inherited;
	
private:
	bool FIsCheckPressed;
	bool FParentBackground;
	bool __fastcall GetChecked(void);
	HIDESBASE TcxCheckBoxProperties* __fastcall GetProperties(void);
	TcxCheckBoxState __fastcall GetState(void);
	HIDESBASE TcxCustomCheckBoxViewInfo* __fastcall GetViewInfo(void);
	void __fastcall SetChecked(bool Value);
	HIDESBASE void __fastcall SetProperties(TcxCheckBoxProperties* Value);
	void __fastcall SetState(TcxCheckBoxState Value);
	void __fastcall SetParentBackground(bool Value);
	HIDESBASE MESSAGE void __fastcall WMLButtonUp(Messages::TWMMouse &Message);
	HIDESBASE MESSAGE void __fastcall CMDialogChar(Messages::TWMKey &Message);
	
protected:
	virtual bool __fastcall CanResize(int &NewWidth, int &NewHeight);
	virtual void __fastcall DoEditKeyDown(Word &Key, Classes::TShiftState Shift);
	virtual void __fastcall DoEditKeyPress(char &Key);
	virtual void __fastcall DoEditKeyUp(Word &Key, Classes::TShiftState Shift);
	virtual void __fastcall FillSizeProperties(Cxedit::TcxEditSizeProperties &AEditSizeProperties);
	virtual void __fastcall InternalSetEditValue(const Variant &Value, bool AValidateEditValue);
	virtual bool __fastcall IsClickEnabledDuringLoading(void);
	virtual void __fastcall Paint(void);
	virtual void __fastcall ProcessViewInfoChanges(Cxedit::TcxCustomEditViewInfo* APrevViewInfo, bool AIsMouseDownUpEvent);
	virtual void __fastcall PropertiesChanged(System::TObject* Sender);
	virtual void __fastcall SetName(const AnsiString Value);
	void __fastcall InvalidateCheckRect(void);
	virtual void __fastcall Toggle(void);
	__property bool Checked = {read=GetChecked, write=SetChecked, stored=false, nodefault};
	__property TcxCheckBoxProperties* Properties = {read=GetProperties, write=SetProperties};
	__property TcxCheckBoxState State = {read=GetState, write=SetState, default=0};
	__property TcxCustomCheckBoxViewInfo* ViewInfo = {read=GetViewInfo};
	__property bool ParentBackground = {read=FParentBackground, write=SetParentBackground, default=1};
	
public:
	__fastcall virtual TcxCustomCheckBox(Classes::TComponent* AOwner)/* overload */;
	virtual void __fastcall Clear(void);
	/* virtual class method */ virtual TMetaClass* __fastcall GetPropertiesClass(TMetaClass* vmt);
	/* virtual class method */ virtual Cxcontainer::TcxContainerStyleValues __fastcall GetNotPublishedStyleValues(TMetaClass* vmt);
	virtual void __fastcall PrepareEditValue(const Variant &ADisplayValue, /* out */ Variant &EditValue, bool AEditFocused);
public:
	#pragma option push -w-inl
	/* TcxCustomEdit.Destroy */ inline __fastcall virtual ~TcxCustomCheckBox(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomCheckBox(HWND ParentWindow) : Cxedit::TcxCustomEdit(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCheckBox;
class PASCALIMPLEMENTATION TcxCheckBox : public TcxCustomCheckBox 
{
	typedef TcxCustomCheckBox inherited;
	
__published:
	__property Anchors  = {default=3};
	__property AutoSize  = {default=1};
	__property Checked ;
	__property Constraints ;
	__property DragMode  = {default=0};
	__property Enabled  = {default=1};
	__property ParentBackground  = {default=1};
	__property ParentColor  = {default=1};
	__property ParentFont  = {default=1};
	__property ParentShowHint  = {default=1};
	__property PopupMenu ;
	__property Properties ;
	__property ShowHint ;
	__property State  = {default=0};
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
	/* TcxCustomCheckBox.Create */ inline __fastcall virtual TcxCheckBox(Classes::TComponent* AOwner)/* overload */ : TcxCustomCheckBox(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomEdit.Destroy */ inline __fastcall virtual ~TcxCheckBox(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCheckBox(HWND ParentWindow) : TcxCustomCheckBox(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
static const int cxEditCheckBoxSingleBorderDefaultColor = 0x80000010;

}	/* namespace Cxcheckbox */
using namespace Cxcheckbox;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxCheckBox
