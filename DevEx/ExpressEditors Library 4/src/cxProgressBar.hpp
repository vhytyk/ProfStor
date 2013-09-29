// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxProgressBar.pas' rev: 6.00

#ifndef cxProgressBarHPP
#define cxProgressBarHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Menus.hpp>	// Pascal unit
#include <cxExtEditConsts.hpp>	// Pascal unit
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

namespace Cxprogressbar
{
//-- type declarations -------------------------------------------------------
typedef Word TcxBorderWidth;

#pragma option push -b-
enum TcxProgressBarBevelOuter { cxbvNone, cxbvLowered, cxbvRaised };
#pragma option pop

#pragma option push -b-
enum TcxProgressBarOrientation { cxorHorizontal, cxorVertical };
#pragma option pop

#pragma option push -b-
enum TcxProgressBarTextStyle { cxtsPercent, cxtsPosition };
#pragma option pop

#pragma option push -b-
enum TcxProgressBarBarStyle { cxbsSolid, cxbsLEDs, cxbsGradient, cxbsGradientLEDs, cxbsBitmap, cxbsBitmapLEDs };
#pragma option pop

class DELPHICLASS TcxProgressBarStyle;
class PASCALIMPLEMENTATION TcxProgressBarStyle : public Cxedit::TcxCustomEditStyle 
{
	typedef Cxedit::TcxCustomEditStyle inherited;
	
public:
	virtual Graphics::TColor __fastcall DefaultColor(void);
	virtual void __fastcall RestoreDefaults(void);
public:
	#pragma option push -w-inl
	/* TcxCustomEditStyle.Create */ inline __fastcall virtual TcxProgressBarStyle(Classes::TPersistent* AOwner, bool ADirectAccessMode) : Cxedit::TcxCustomEditStyle(AOwner, ADirectAccessMode) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxContainerStyle.Destroy */ inline __fastcall virtual ~TcxProgressBarStyle(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomProgressBarViewInfo;
class PASCALIMPLEMENTATION TcxCustomProgressBarViewInfo : public Cxtextedit::TcxCustomTextEditViewInfo 
{
	typedef Cxtextedit::TcxCustomTextEditViewInfo inherited;
	
private:
	Graphics::TColor FBeginColor;
	TcxProgressBarBevelOuter FBarBevelOuter;
	Graphics::TColor FEndColor;
	int FMin;
	int FMax;
	int FPosition;
	Graphics::TBitmap* FForegroundImage;
	TcxProgressBarOrientation FOrientation;
	bool FShowText;
	TcxProgressBarTextStyle FShowTextStyle;
	TcxProgressBarOrientation FTextOrientation;
	bool FSolidTextColor;
	TcxProgressBarBarStyle FBarStyle;
	int FOverloadValue;
	Graphics::TColor FOverloadBeginColor;
	Graphics::TColor FOverloadEndColor;
	bool FShowOverload;
	int FPeakValue;
	Graphics::TColor FPeakColor;
	Cxexteditconsts::TcxNaturalNumber FPeakSize;
	bool FShowPeak;
	bool FRealShowOverload;
	bool FRealShowPeak;
	bool FPropTransparent;
	
protected:
	#pragma pack(push, 1)
	Types::TRect BarRect;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect ProgressBarRect;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect OverloadBarRect;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect PeakBarRect;
	#pragma pack(pop)
	
	__property Graphics::TColor BeginColor = {read=FBeginColor, write=FBeginColor, nodefault};
	__property TcxProgressBarBevelOuter BarBevelOuter = {read=FBarBevelOuter, write=FBarBevelOuter, nodefault};
	__property Graphics::TColor EndColor = {read=FEndColor, write=FEndColor, nodefault};
	__property int Min = {read=FMin, write=FMin, nodefault};
	__property int Max = {read=FMax, write=FMax, nodefault};
	__property int Position = {read=FPosition, write=FPosition, nodefault};
	__property Graphics::TBitmap* ForegroundImage = {read=FForegroundImage, write=FForegroundImage};
	__property TcxProgressBarOrientation Orientation = {read=FOrientation, write=FOrientation, nodefault};
	__property bool ShowText = {read=FShowText, write=FShowText, nodefault};
	__property TcxProgressBarTextStyle ShowTextStyle = {read=FShowTextStyle, write=FShowTextStyle, nodefault};
	__property TcxProgressBarOrientation TextOrientation = {read=FTextOrientation, write=FTextOrientation, nodefault};
	__property bool SolidTextColor = {read=FSolidTextColor, write=FSolidTextColor, nodefault};
	__property TcxProgressBarBarStyle BarStyle = {read=FBarStyle, write=FBarStyle, nodefault};
	__property int OverloadValue = {read=FOverloadValue, write=FOverloadValue, nodefault};
	__property Graphics::TColor OverloadBeginColor = {read=FOverloadBeginColor, write=FOverloadBeginColor, nodefault};
	__property Graphics::TColor OverloadEndColor = {read=FOverloadEndColor, write=FOverloadEndColor, nodefault};
	__property int PeakValue = {read=FPeakValue, write=FPeakValue, nodefault};
	__property Graphics::TColor PeakColor = {read=FPeakColor, write=FPeakColor, nodefault};
	__property Cxexteditconsts::TcxNaturalNumber PeakSize = {read=FPeakSize, write=FPeakSize, nodefault};
	__property bool ShowOverload = {read=FShowOverload, write=FShowOverload, nodefault};
	__property bool ShowPeak = {read=FShowPeak, write=FShowPeak, nodefault};
	__property bool PropTransparent = {read=FPropTransparent, write=FPropTransparent, nodefault};
	
public:
	#pragma pack(push, 1)
	Types::TRect FocusRect;
	#pragma pack(pop)
	
	bool HasForegroundImage;
	__fastcall virtual TcxCustomProgressBarViewInfo(void);
	__fastcall virtual ~TcxCustomProgressBarViewInfo(void);
	virtual void __fastcall DrawText(Cxgraphics::TcxCanvas* ACanvas);
	virtual Cxgraphics::TcxRegion* __fastcall GetUpdateRegion(Cxcontainer::TcxContainerViewInfo* AViewInfo);
	virtual bool __fastcall NeedShowHint(Cxgraphics::TcxCanvas* ACanvas, const Types::TPoint &P, /* out */ AnsiString &AText, /* out */ bool &AIsMultiLine, /* out */ Types::TRect &ATextRect)/* overload */;
	virtual void __fastcall Paint(Cxgraphics::TcxCanvas* ACanvas);
	virtual void __fastcall PaintProgressBar(Cxgraphics::TcxCanvas* ACanvas);
	virtual void __fastcall Offset(int DX, int DY);
	
/* Hoisted overloads: */
	
public:
	inline bool __fastcall  NeedShowHint(Cxgraphics::TcxCanvas* ACanvas, const Types::TPoint &P, const Types::TRect &AVisibleBounds, /* out */ AnsiString &AText, /* out */ bool &AIsMultiLine, /* out */ Types::TRect &ATextRect){ return TcxCustomTextEditViewInfo::NeedShowHint(ACanvas, P, AVisibleBounds, AText, AIsMultiLine, ATextRect); }
	
};


class DELPHICLASS TcxCustomProgressBarViewData;
class DELPHICLASS TcxCustomProgressBarProperties;
class PASCALIMPLEMENTATION TcxCustomProgressBarViewData : public Cxedit::TcxCustomEditViewData 
{
	typedef Cxedit::TcxCustomEditViewData inherited;
	
private:
	HIDESBASE TcxCustomProgressBarProperties* __fastcall GetProperties(void);
	HIDESBASE void __fastcall SetProperties(TcxCustomProgressBarProperties* Value);
	
protected:
	virtual void __fastcall CalculateViewInfoProperties(Cxedit::TcxCustomEditViewInfo* AViewInfo);
	virtual tagSIZE __fastcall InternalGetEditConstantPartSize(Cxgraphics::TcxCanvas* ACanvas, bool AIsInplace, const Cxedit::TcxEditSizeProperties &AEditSizeProperties, tagSIZE &MinContentSize, Cxedit::TcxCustomEditViewInfo* AViewInfo);
	virtual int __fastcall GetDrawTextFlags(void);
	bool __fastcall GetIsEditClass(void);
	
public:
	virtual void __fastcall Calculate(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ABounds, const Types::TPoint &P, Cxcontainer::TcxMouseButton Button, Classes::TShiftState Shift, Cxedit::TcxCustomEditViewInfo* AViewInfo, bool AIsMouseEvent);
	virtual void __fastcall EditValueToDrawValue(Cxgraphics::TcxCanvas* ACanvas, const Variant &AEditValue, Cxedit::TcxCustomEditViewInfo* AViewInfo);
	__property TcxCustomProgressBarProperties* Properties = {read=GetProperties, write=SetProperties};
public:
	#pragma option push -w-inl
	/* TcxCustomEditViewData.Create */ inline __fastcall virtual TcxCustomProgressBarViewData(Cxedit::TcxCustomEditProperties* AProperties, Cxcontainer::TcxContainerStyle* AStyle, bool AIsInplace) : Cxedit::TcxCustomEditViewData(AProperties, AStyle, AIsInplace) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxCustomProgressBarViewData(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxCustomProgressBarProperties : public Cxedit::TcxCustomEditProperties 
{
	typedef Cxedit::TcxCustomEditProperties inherited;
	
private:
	int FCurrentPosition;
	Graphics::TColor FBeginColor;
	TcxProgressBarBevelOuter FBarBevelOuter;
	Graphics::TColor FEndColor;
	Graphics::TBitmap* FForegroundImage;
	int FMin;
	int FMax;
	TcxProgressBarOrientation FOrientation;
	bool FShowText;
	TcxProgressBarTextStyle FShowTextStyle;
	TcxProgressBarOrientation FTextOrientation;
	bool FSolidTextColor;
	TcxProgressBarBarStyle FBarStyle;
	bool FTransparentImage;
	TcxBorderWidth FBorderWidth;
	int FOverloadValue;
	bool FShowOverload;
	Graphics::TColor FOverloadBeginColor;
	Graphics::TColor FOverloadEndColor;
	int FPeakValue;
	bool FShowPeak;
	Graphics::TColor FPeakColor;
	Cxexteditconsts::TcxNaturalNumber FPeakSize;
	bool FTransparent;
	Classes::TNotifyEvent FOnChangeTransparent;
	Graphics::TBitmap* __fastcall GetForegroundImage(void);
	void __fastcall ForegroundImageChanged(System::TObject* Sender);
	int __fastcall GetRealPeakValue(void);
	void __fastcall SetBeginColor(Graphics::TColor Value);
	void __fastcall SetBarBevelOuter(TcxProgressBarBevelOuter Value);
	void __fastcall SetEndColor(Graphics::TColor Value);
	void __fastcall SetForegroundImage(Graphics::TBitmap* Value);
	void __fastcall SetMin(int Value);
	void __fastcall SetMax(int Value);
	void __fastcall SetOrientation(TcxProgressBarOrientation Value);
	void __fastcall SetShowText(bool Value);
	void __fastcall SetShowTextStyle(TcxProgressBarTextStyle Value);
	void __fastcall SetTextOrientation(TcxProgressBarOrientation Value);
	void __fastcall SetSolidTextColor(bool Value);
	void __fastcall SetBarStyle(TcxProgressBarBarStyle Value);
	void __fastcall SetTransparentImage(bool Value);
	void __fastcall SetBorderWidth(TcxBorderWidth Value);
	void __fastcall SetOverloadValue(int Value);
	void __fastcall SetShowOverload(bool Value);
	void __fastcall SetOverloadBeginColor(Graphics::TColor Value);
	void __fastcall SetOverloadEndColor(Graphics::TColor Value);
	void __fastcall SetPeakValue(int Value);
	void __fastcall SetShowPeak(bool Value);
	void __fastcall SetPeakColor(Graphics::TColor Value);
	void __fastcall SetPeakSize(Cxexteditconsts::TcxNaturalNumber Value);
	void __fastcall SetTransparent(bool Value);
	void __fastcall PostMinValue(void);
	void __fastcall PostMaxValue(void);
	void __fastcall PostOverloadValue(void);
	
protected:
	virtual bool __fastcall CompareEditValue(void);
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewDataClass(TMetaClass* vmt);
	virtual bool __fastcall HasDisplayValue(void);
	virtual void __fastcall PrepareCurrentPosition(int Value);
	__property Graphics::TColor BeginColor = {read=FBeginColor, write=SetBeginColor, default=8388608};
	__property TcxProgressBarBevelOuter BarBevelOuter = {read=FBarBevelOuter, write=SetBarBevelOuter, default=0};
	__property Graphics::TColor EndColor = {read=FEndColor, write=SetEndColor, default=16777215};
	__property Graphics::TBitmap* ForegroundImage = {read=GetForegroundImage, write=SetForegroundImage};
	__property int Min = {read=FMin, write=SetMin, default=0};
	__property int Max = {read=FMax, write=SetMax, default=100};
	__property TcxProgressBarOrientation Orientation = {read=FOrientation, write=SetOrientation, default=0};
	__property bool ShowText = {read=FShowText, write=SetShowText, default=1};
	__property TcxProgressBarTextStyle ShowTextStyle = {read=FShowTextStyle, write=SetShowTextStyle, default=0};
	__property TcxProgressBarOrientation TextOrientation = {read=FTextOrientation, write=SetTextOrientation, default=0};
	__property bool SolidTextColor = {read=FSolidTextColor, write=SetSolidTextColor, default=0};
	__property TcxProgressBarBarStyle BarStyle = {read=FBarStyle, write=SetBarStyle, default=0};
	__property bool TransparentImage = {read=FTransparentImage, write=SetTransparentImage, default=1};
	__property TcxBorderWidth BorderWidth = {read=FBorderWidth, write=SetBorderWidth, default=0};
	__property int OverloadValue = {read=FOverloadValue, write=SetOverloadValue, default=80};
	__property bool ShowOverload = {read=FShowOverload, write=SetShowOverload, default=0};
	__property Graphics::TColor OverloadBeginColor = {read=FOverloadBeginColor, write=SetOverloadBeginColor, default=8421631};
	__property Graphics::TColor OverloadEndColor = {read=FOverloadEndColor, write=SetOverloadEndColor, default=16711935};
	__property int PeakValue = {read=FPeakValue, write=SetPeakValue, default=0};
	__property bool ShowPeak = {read=FShowPeak, write=SetShowPeak, default=0};
	__property Graphics::TColor PeakColor = {read=FPeakColor, write=SetPeakColor, default=255};
	__property Cxexteditconsts::TcxNaturalNumber PeakSize = {read=FPeakSize, write=SetPeakSize, default=2};
	__property bool Transparent = {read=FTransparent, write=SetTransparent, default=0};
	
public:
	__fastcall virtual TcxCustomProgressBarProperties(Classes::TPersistent* AOwner);
	__fastcall virtual ~TcxCustomProgressBarProperties(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	/* virtual class method */ virtual TMetaClass* __fastcall GetContainerClass(TMetaClass* vmt);
	virtual WideString __fastcall GetDisplayText(const Variant &AEditValue, bool AFullText = false);
	/* virtual class method */ virtual TMetaClass* __fastcall GetStyleClass(TMetaClass* vmt);
	virtual Cxedit::TcxEditSupportedOperations __fastcall GetSupportedOperations(void);
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewInfoClass(TMetaClass* vmt);
	virtual bool __fastcall IsEditValueValid(Variant &EditValue, bool AEditFocused);
	virtual void __fastcall PrepareDisplayValue(const Variant &AEditValue, Variant &DisplayValue, bool AEditFocused);
	__property int RealPeakValue = {read=GetRealPeakValue, nodefault};
};


class DELPHICLASS TcxProgressBarProperties;
class PASCALIMPLEMENTATION TcxProgressBarProperties : public TcxCustomProgressBarProperties 
{
	typedef TcxCustomProgressBarProperties inherited;
	
public:
	__property RealPeakValue ;
	
__published:
	__property BeginColor  = {default=8388608};
	__property BarBevelOuter  = {default=0};
	__property EndColor  = {default=16777215};
	__property ForegroundImage ;
	__property Min  = {default=0};
	__property Max  = {default=100};
	__property Orientation  = {default=0};
	__property ShowText  = {default=1};
	__property ShowTextStyle  = {default=0};
	__property TextOrientation  = {default=0};
	__property SolidTextColor  = {default=0};
	__property BarStyle  = {default=0};
	__property TransparentImage  = {default=1};
	__property BorderWidth  = {default=0};
	__property OverloadValue  = {default=80};
	__property ShowOverload  = {default=0};
	__property OverloadBeginColor  = {default=8421631};
	__property OverloadEndColor  = {default=16711935};
	__property PeakValue  = {default=0};
	__property ShowPeak  = {default=0};
	__property PeakColor  = {default=255};
	__property PeakSize  = {default=2};
	__property Transparent  = {default=0};
public:
	#pragma option push -w-inl
	/* TcxCustomProgressBarProperties.Create */ inline __fastcall virtual TcxProgressBarProperties(Classes::TPersistent* AOwner) : TcxCustomProgressBarProperties(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomProgressBarProperties.Destroy */ inline __fastcall virtual ~TcxProgressBarProperties(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomProgressBar;
class PASCALIMPLEMENTATION TcxCustomProgressBar : public Cxedit::TcxCustomEdit 
{
	typedef Cxedit::TcxCustomEdit inherited;
	
private:
	int FPosition;
	HIDESBASE TcxProgressBarProperties* __fastcall GetProperties(void);
	HIDESBASE TcxCustomProgressBarViewInfo* __fastcall GetViewInfo(void);
	HIDESBASE void __fastcall SetProperties(TcxProgressBarProperties* Value);
	void __fastcall SetPosition(int Value);
	void __fastcall ChangeTransparentHandler(System::TObject* Sender);
	HIDESBASE MESSAGE void __fastcall WMEraseBkgnd(Messages::TWMEraseBkgnd &Message);
	
protected:
	virtual bool __fastcall CanResize(int &NewWidth, int &NewHeight);
	virtual void __fastcall FillSizeProperties(Cxedit::TcxEditSizeProperties &AEditSizeProperties);
	virtual void __fastcall InternalSetEditValue(const Variant &Value, bool AValidateEditValue);
	virtual void __fastcall SynchronizeDisplayValue(void);
	virtual void __fastcall ProcessViewInfoChanges(Cxedit::TcxCustomEditViewInfo* APrevViewInfo, bool AIsMouseDownUpEvent);
	virtual void __fastcall PropertiesChanged(System::TObject* Sender);
	__property TcxProgressBarProperties* Properties = {read=GetProperties, write=SetProperties};
	__property TcxCustomProgressBarViewInfo* ViewInfo = {read=GetViewInfo};
	virtual bool __fastcall CanFocusOnClick(void);
	__property int Position = {read=FPosition, write=SetPosition, default=0};
	
public:
	__fastcall virtual TcxCustomProgressBar(Classes::TComponent* AOwner)/* overload */;
	/* virtual class method */ virtual TMetaClass* __fastcall GetPropertiesClass(TMetaClass* vmt);
	/* virtual class method */ virtual Cxcontainer::TcxContainerStyleValues __fastcall GetNotPublishedStyleValues(TMetaClass* vmt);
	DYNAMIC bool __fastcall CanFocus(void);
public:
	#pragma option push -w-inl
	/* TcxCustomEdit.Destroy */ inline __fastcall virtual ~TcxCustomProgressBar(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomProgressBar(HWND ParentWindow) : Cxedit::TcxCustomEdit(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxProgressBar;
class PASCALIMPLEMENTATION TcxProgressBar : public TcxCustomProgressBar 
{
	typedef TcxCustomProgressBar inherited;
	
__published:
	__property Position  = {default=0};
	__property Anchors  = {default=3};
	__property AutoSize  = {default=1};
	__property Constraints ;
	__property DragMode  = {default=0};
	__property Enabled  = {default=1};
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
	/* TcxCustomProgressBar.Create */ inline __fastcall virtual TcxProgressBar(Classes::TComponent* AOwner)/* overload */ : TcxCustomProgressBar(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomEdit.Destroy */ inline __fastcall virtual ~TcxProgressBar(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxProgressBar(HWND ParentWindow) : TcxCustomProgressBar(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxprogressbar */
using namespace Cxprogressbar;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxProgressBar
