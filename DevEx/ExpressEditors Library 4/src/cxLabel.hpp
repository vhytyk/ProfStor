// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxLabel.pas' rev: 6.00

#ifndef cxLabelHPP
#define cxLabelHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Menus.hpp>	// Pascal unit
#include <cxDataUtils.hpp>	// Pascal unit
#include <cxExtEditConsts.hpp>	// Pascal unit
#include <cxVariants.hpp>	// Pascal unit
#include <cxTextEdit.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <cxCustomData.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
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

namespace Cxlabel
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TcxLabelEffect { cxleNormal, cxleFun, cxleExtrude, cxleCool };
#pragma option pop

#pragma option push -b-
enum TcxLabelStyle { cxlsNormal, cxlsRaised, cxlsLowered, cxlsOutLine };
#pragma option pop

#pragma option push -b-
enum TcxLabelOrientation { cxoLeft, cxoRight, cxoTop, cxoBottom, cxoLeftTop, cxoLeftBottom, cxoRightTop, cxoRightBottom };
#pragma option pop

class DELPHICLASS TcxLabelEditStyle;
class PASCALIMPLEMENTATION TcxLabelEditStyle : public Cxedit::TcxCustomEditStyle 
{
	typedef Cxedit::TcxCustomEditStyle inherited;
	
protected:
	virtual Cxcontainer::TcxContainerBorderStyle __fastcall DefaultBorderStyle(void);
	virtual Graphics::TColor __fastcall DefaultColor(void);
	virtual bool __fastcall DefaultHotTrack(void);
	
public:
	virtual void __fastcall RestoreDefaults(void);
public:
	#pragma option push -w-inl
	/* TcxCustomEditStyle.Create */ inline __fastcall virtual TcxLabelEditStyle(Classes::TPersistent* AOwner, bool ADirectAccessMode) : Cxedit::TcxCustomEditStyle(AOwner, ADirectAccessMode) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxContainerStyle.Destroy */ inline __fastcall virtual ~TcxLabelEditStyle(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomLabelViewInfo;
class PASCALIMPLEMENTATION TcxCustomLabelViewInfo : public Cxtextedit::TcxCustomTextEditViewInfo 
{
	typedef Cxtextedit::TcxCustomTextEditViewInfo inherited;
	
private:
	Cxedit::TcxEditAlignment* FAlignment;
	TcxLabelEffect FLabelEffect;
	TcxLabelStyle FLabelStyle;
	TcxLabelOrientation FOrientation;
	Word FDepth;
	#pragma pack(push, 1)
	tagSIZE FDepthDeltaSize;
	#pragma pack(pop)
	
	Graphics::TColor FShadowedColor;
	bool FShowEndEllipsis;
	int FAngle;
	int FPenWidth;
	bool FWordWrap;
	#pragma pack(push, 1)
	Types::TRect FLabelTextRect;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect FLabelRect;
	#pragma pack(pop)
	
	Graphics::TBitmap* FGlyph;
	
protected:
	__property Cxedit::TcxEditAlignment* Alignment = {read=FAlignment, write=FAlignment};
	__property TcxLabelEffect LabelEffect = {read=FLabelEffect, write=FLabelEffect, nodefault};
	__property TcxLabelStyle LabelStyle = {read=FLabelStyle, write=FLabelStyle, nodefault};
	__property TcxLabelOrientation Orientation = {read=FOrientation, write=FOrientation, nodefault};
	__property Word Depth = {read=FDepth, write=FDepth, nodefault};
	__property tagSIZE DepthDeltaSize = {read=FDepthDeltaSize, write=FDepthDeltaSize};
	__property Graphics::TColor ShadowedColor = {read=FShadowedColor, write=FShadowedColor, nodefault};
	__property bool ShowEndEllipsis = {read=FShowEndEllipsis, write=FShowEndEllipsis, nodefault};
	__property int Angle = {read=FAngle, write=FAngle, nodefault};
	__property int PenWidth = {read=FPenWidth, write=FPenWidth, nodefault};
	__property bool WordWrap = {read=FWordWrap, write=FWordWrap, nodefault};
	__property Graphics::TBitmap* Glyph = {read=FGlyph, write=FGlyph};
	__property Types::TRect LabelTextRect = {read=FLabelTextRect, write=FLabelTextRect};
	__property Types::TRect LabelRect = {read=FLabelRect, write=FLabelRect};
	
public:
	#pragma pack(push, 1)
	Types::TRect FocusRect;
	#pragma pack(pop)
	
	bool HasGlyph;
	__fastcall virtual TcxCustomLabelViewInfo(void);
	__fastcall virtual ~TcxCustomLabelViewInfo(void);
	virtual void __fastcall Offset(int DX, int DY);
	virtual void __fastcall DrawText(Cxgraphics::TcxCanvas* ACanvas);
	virtual void __fastcall Paint(Cxgraphics::TcxCanvas* ACanvas);
	virtual void __fastcall DrawLabel(Cxgraphics::TcxCanvas* ACanvas);
};


class DELPHICLASS TcxCustomLabelViewData;
class DELPHICLASS TcxCustomLabelProperties;
class PASCALIMPLEMENTATION TcxCustomLabelViewData : public Cxedit::TcxCustomEditViewData 
{
	typedef Cxedit::TcxCustomEditViewData inherited;
	
private:
	HIDESBASE TcxCustomLabelProperties* __fastcall GetProperties(void);
	HIDESBASE void __fastcall SetProperties(TcxCustomLabelProperties* Value);
	void __fastcall CalculateLabelViewInfoProps(Cxedit::TcxCustomEditViewInfo* AViewInfo);
	
protected:
	virtual Cxedit::TcxEditBorderStyle __fastcall GetBorderStyle(Cxcontainer::TcxContainerHotState AEditHotState);
	virtual int __fastcall GetDrawTextFlags(void);
	bool __fastcall GetIsEditClass(void);
	virtual tagSIZE __fastcall InternalGetEditConstantPartSize(Cxgraphics::TcxCanvas* ACanvas, bool AIsInplace, const Cxedit::TcxEditSizeProperties &AEditSizeProperties, tagSIZE &MinContentSize, Cxedit::TcxCustomEditViewInfo* AViewInfo);
	
public:
	virtual void __fastcall Calculate(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ABounds, const Types::TPoint &P, Cxcontainer::TcxMouseButton Button, Classes::TShiftState Shift, Cxedit::TcxCustomEditViewInfo* AViewInfo, bool AIsMouseEvent);
	virtual void __fastcall EditValueToDrawValue(Cxgraphics::TcxCanvas* ACanvas, const Variant &AEditValue, Cxedit::TcxCustomEditViewInfo* AViewInfo);
	__property TcxCustomLabelProperties* Properties = {read=GetProperties, write=SetProperties};
	virtual tagSIZE __fastcall GetEditContentSize(Cxgraphics::TcxCanvas* ACanvas, const Variant &AEditValue, const Cxedit::TcxEditSizeProperties &AEditSizeProperties);
public:
	#pragma option push -w-inl
	/* TcxCustomEditViewData.Create */ inline __fastcall virtual TcxCustomLabelViewData(Cxedit::TcxCustomEditProperties* AProperties, Cxcontainer::TcxContainerStyle* AStyle, bool AIsInplace) : Cxedit::TcxCustomEditViewData(AProperties, AStyle, AIsInplace) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxCustomLabelViewData(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxCustomLabelProperties : public Cxedit::TcxCustomEditProperties 
{
	typedef Cxedit::TcxCustomEditProperties inherited;
	
private:
	TcxLabelEffect FLabelEffect;
	TcxLabelStyle FLabelStyle;
	TcxLabelOrientation FOrientation;
	Word FDepth;
	Graphics::TColor FShadowedColor;
	bool FShowEndEllipsis;
	int FAngle;
	int FPenWidth;
	Graphics::TBitmap* FGlyph;
	bool FWordWrap;
	bool FTransparent;
	Classes::TNotifyEvent FOnChangeTransparent;
	void __fastcall SetLabelEffect(TcxLabelEffect Value);
	void __fastcall SetLabelStyle(TcxLabelStyle Value);
	void __fastcall SetOrientation(TcxLabelOrientation Value);
	void __fastcall SetDepth(Word Value);
	void __fastcall SetShadowedColor(Graphics::TColor Value);
	void __fastcall SetShowEndEllipsis(bool Value);
	void __fastcall SetAngle(int Value);
	void __fastcall SetPenWidth(int Value);
	Graphics::TBitmap* __fastcall GetGlyph(void);
	void __fastcall GlyphChanged(System::TObject* Sender);
	void __fastcall SetGlyph(Graphics::TBitmap* Value);
	void __fastcall SetWordWrap(bool Value);
	void __fastcall SetTransparent(bool Value);
	
protected:
	virtual void __fastcall Changed(void);
	virtual bool __fastcall CompareEditValue(void);
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewDataClass(TMetaClass* vmt);
	virtual bool __fastcall HasDisplayValue(void);
	virtual tagSIZE __fastcall CalculateDepthDelta();
	virtual tagSIZE __fastcall CalculateSizeDelta();
	virtual Cxedit::TcxEditDisplayFormatOptions __fastcall GetDisplayFormatOptions(void);
	__property TcxLabelEffect LabelEffect = {read=FLabelEffect, write=SetLabelEffect, default=0};
	__property TcxLabelStyle LabelStyle = {read=FLabelStyle, write=SetLabelStyle, default=0};
	__property TcxLabelOrientation Orientation = {read=FOrientation, write=SetOrientation, default=7};
	__property Word Depth = {read=FDepth, write=SetDepth, default=0};
	__property Graphics::TColor ShadowedColor = {read=FShadowedColor, write=SetShadowedColor, default=-2147483631};
	__property bool ShowEndEllipsis = {read=FShowEndEllipsis, write=SetShowEndEllipsis, default=0};
	__property int Angle = {read=FAngle, write=SetAngle, default=0};
	__property int PenWidth = {read=FPenWidth, write=SetPenWidth, default=1};
	__property Graphics::TBitmap* Glyph = {read=GetGlyph, write=SetGlyph};
	__property bool WordWrap = {read=FWordWrap, write=SetWordWrap, default=0};
	__property bool Transparent = {read=FTransparent, write=SetTransparent, default=0};
	
public:
	__fastcall virtual TcxCustomLabelProperties(Classes::TPersistent* AOwner);
	__fastcall virtual ~TcxCustomLabelProperties(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	/* virtual class method */ virtual TMetaClass* __fastcall GetContainerClass(TMetaClass* vmt);
	virtual WideString __fastcall GetDisplayText(const Variant &AEditValue, bool AFullText = false);
	virtual Cxedit::TcxEditSupportedOperations __fastcall GetSupportedOperations(void);
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewInfoClass(TMetaClass* vmt);
	virtual bool __fastcall IsEditValueValid(Variant &EditValue, bool AEditFocused);
	virtual void __fastcall PrepareDisplayValue(const Variant &AEditValue, Variant &DisplayValue, bool AEditFocused);
	virtual Cxdatautils::TcxDataEditValueSource __fastcall GetEditValueSource(bool AEditFocused);
};


class DELPHICLASS TcxLabelProperties;
class PASCALIMPLEMENTATION TcxLabelProperties : public TcxCustomLabelProperties 
{
	typedef TcxCustomLabelProperties inherited;
	
__published:
	__property Alignment ;
	__property OnChange ;
	__property OnEditValueChanged ;
	__property OnValidate ;
	__property LabelEffect  = {default=0};
	__property LabelStyle  = {default=0};
	__property Orientation  = {default=7};
	__property Depth  = {default=0};
	__property ShadowedColor  = {default=-2147483631};
	__property ShowEndEllipsis  = {default=0};
	__property Angle  = {default=0};
	__property PenWidth  = {default=1};
	__property Glyph ;
	__property WordWrap  = {default=0};
	__property Transparent  = {default=0};
public:
	#pragma option push -w-inl
	/* TcxCustomLabelProperties.Create */ inline __fastcall virtual TcxLabelProperties(Classes::TPersistent* AOwner) : TcxCustomLabelProperties(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomLabelProperties.Destroy */ inline __fastcall virtual ~TcxLabelProperties(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomLabel;
class PASCALIMPLEMENTATION TcxCustomLabel : public Cxedit::TcxCustomEdit 
{
	typedef Cxedit::TcxCustomEdit inherited;
	
private:
	bool FIsEditValueAssigned;
	AnsiString FCaption;
	Controls::TWinControl* FFocusControl;
	bool FIsCaptionAssigned;
	HIDESBASE TcxLabelProperties* __fastcall GetProperties(void);
	HIDESBASE TcxCustomLabelViewInfo* __fastcall GetViewInfo(void);
	HIDESBASE void __fastcall SetProperties(TcxLabelProperties* Value);
	void __fastcall SetFocusControl(Controls::TWinControl* Value);
	void __fastcall ReadCaption(Classes::TReader* Reader);
	void __fastcall WriteCaption(Classes::TWriter* Writer);
	void __fastcall ChangeTransparentHandler(System::TObject* Sender);
	HIDESBASE MESSAGE void __fastcall CMDialogChar(Messages::TWMKey &Message);
	HIDESBASE MESSAGE void __fastcall CMChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMLButtonUp(Messages::TWMMouse &Message);
	HIDESBASE MESSAGE void __fastcall WMWindowPosChanged(Messages::TWMWindowPosMsg &Message);
	HIDESBASE MESSAGE void __fastcall WMEraseBkgnd(Messages::TWMEraseBkgnd &Message);
	
protected:
	virtual AnsiString __fastcall GetCaption();
	virtual void __fastcall SetCaption(AnsiString Value);
	virtual void __fastcall SetName(const AnsiString Value);
	virtual void __fastcall SetAutoSize(bool Value);
	virtual void __fastcall DefineProperties(Classes::TFiler* Filer);
	virtual bool __fastcall CanResize(int &NewWidth, int &NewHeight);
	Types::TRect __fastcall CalcSizeRect(const int NewWidth, const int NewHeight);
	virtual void __fastcall FillSizeProperties(Cxedit::TcxEditSizeProperties &AEditSizeProperties);
	virtual void __fastcall SynchronizeDisplayValue(void);
	virtual void __fastcall InternalSetEditValue(const Variant &Value, bool AValidateEditValue);
	virtual void __fastcall ProcessViewInfoChanges(Cxedit::TcxCustomEditViewInfo* APrevViewInfo, bool AIsMouseDownUpEvent);
	virtual void __fastcall PropertiesChanged(System::TObject* Sender);
	virtual bool __fastcall CanFocusOnClick(void);
	__property TcxLabelProperties* Properties = {read=GetProperties, write=SetProperties};
	__property TcxCustomLabelViewInfo* ViewInfo = {read=GetViewInfo};
	__property AnsiString Caption = {read=GetCaption, write=SetCaption, stored=false};
	__property Controls::TWinControl* FocusControl = {read=FFocusControl, write=SetFocusControl};
	virtual void __fastcall Notification(Classes::TComponent* ACOmponent, Classes::TOperation Operation);
	
public:
	__fastcall virtual TcxCustomLabel(Classes::TComponent* AOwner)/* overload */;
	__fastcall virtual ~TcxCustomLabel(void);
	virtual void __fastcall Loaded(void);
	/* virtual class method */ virtual TMetaClass* __fastcall GetPropertiesClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall GetStyleClass(TMetaClass* vmt);
	DYNAMIC bool __fastcall CanFocus(void);
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomLabel(HWND ParentWindow) : Cxedit::TcxCustomEdit(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxLabel;
class PASCALIMPLEMENTATION TcxLabel : public TcxCustomLabel 
{
	typedef TcxCustomLabel inherited;
	
__published:
	__property Align  = {default=0};
	__property Anchors  = {default=3};
	__property AutoSize  = {default=1};
	__property Caption ;
	__property Constraints ;
	__property DragMode  = {default=0};
	__property Enabled  = {default=1};
	__property FocusControl ;
	__property ParentColor  = {default=1};
	__property ParentFont  = {default=1};
	__property ParentShowHint  = {default=1};
	__property PopupMenu ;
	__property Properties ;
	__property ShowHint ;
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
	/* TcxCustomLabel.Create */ inline __fastcall virtual TcxLabel(Classes::TComponent* AOwner)/* overload */ : TcxCustomLabel(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomLabel.Destroy */ inline __fastcall virtual ~TcxLabel(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxLabel(HWND ParentWindow) : TcxCustomLabel(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxlabel */
using namespace Cxlabel;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxLabel
