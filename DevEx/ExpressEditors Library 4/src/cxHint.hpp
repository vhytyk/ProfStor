// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxHint.pas' rev: 6.00

#ifndef cxHintHPP
#define cxHintHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxTextEdit.hpp>	// Pascal unit
#include <cxLookAndFeels.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <ImgList.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Variants.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxhint
{
//-- type declarations -------------------------------------------------------
typedef Word TcxHintAnimationDelay;

class DELPHICLASS TcxCustomHintStyle;
typedef void __fastcall (__closure *TcxHintStyleChangedEvent)(System::TObject* Sender, TcxCustomHintStyle* AStyle);

typedef void __fastcall (__closure *TcxShowHintEvent)(System::TObject* Sender, AnsiString &HintStr, bool &CanShow, Forms::THintInfo &HintInfo);

#pragma option push -b-
enum TcxCallOutPosition { cxbpNone, cxbpAuto, cxbpLeftBottom, cxbpLeftTop, cxbpTopLeft, cxbpTopRight, cxbpRightBottom, cxbpRightTop, cxbpBottomRight, cxbpBottomLeft };
#pragma option pop

#pragma option push -b-
enum TcxHintIconType { cxhiNone, cxhiApplication, cxhiInformation, cxhiWarning, cxhiError, cxhiQuestion, cxhiWinLogo, cxhiCurrentApplication, cxhiCustom };
#pragma option pop

#pragma option push -b-
enum TcxHintAnimate { cxhaSlideFromLeft, cxhaSlideFromRight, cxhaSlideDownward, cxhaSlideUpward, cxhaSlideFromCenter, cxhaHide, cxhaActivate, cxhaFadeIn, cxhaAuto, cxhaNone };
#pragma option pop

#pragma option push -b-
enum TcxHintIconSize { cxisDefault, cxisLarge, cxisSmall };
#pragma option pop

__interface IcxHint;
typedef System::DelphiInterface<IcxHint> _di_IcxHint;
__interface INTERFACE_UUID("{0680CE5D-391B-45A1-B55D-AFCAE92F2DA6}") IcxHint  : public IInterface 
{
	
public:
	virtual TcxHintAnimate __fastcall GetAnimate(void) = 0 ;
	virtual TcxHintAnimationDelay __fastcall GetAnimationDelay(void) = 0 ;
	virtual Graphics::TColor __fastcall GetBorderColor(void) = 0 ;
	virtual TcxCallOutPosition __fastcall GetCallOutPosition(void) = 0 ;
	virtual Graphics::TColor __fastcall GetColor(void) = 0 ;
	virtual TcxHintIconSize __fastcall GetIconSize(void) = 0 ;
	virtual TcxHintIconType __fastcall GetIconType(void) = 0 ;
	virtual AnsiString __fastcall GetHintCaption(void) = 0 ;
	virtual bool __fastcall GetRounded(void) = 0 ;
	virtual int __fastcall GetRoundRadius(void) = 0 ;
	virtual bool __fastcall GetStandard(void) = 0 ;
	virtual Graphics::TFont* __fastcall GetHintFont(void) = 0 ;
	virtual Graphics::TFont* __fastcall GetHintCaptionFont(void) = 0 ;
	virtual Graphics::TIcon* __fastcall GetHintIcon(void) = 0 ;
	virtual void __fastcall SetHintCaption(AnsiString Value) = 0 ;
	__property AnsiString HintCaption = {read=GetHintCaption, write=SetHintCaption};
};

class DELPHICLASS TcxCustomHintStyleController;
class DELPHICLASS TcxCustomHintWindow;
class PASCALIMPLEMENTATION TcxCustomHintWindow : public Controls::THintWindow 
{
	typedef Controls::THintWindow inherited;
	
private:
	TcxHintAnimate FAnimate;
	TcxHintAnimationDelay FAnimationDelay;
	TcxCallOutPosition FCallOutPosition;
	Graphics::TColor FBorderColor;
	Graphics::TColor FHintColor;
	AnsiString FCaption;
	AnsiString FText;
	Graphics::TFont* FCaptionFont;
	Graphics::TIcon* FIcon;
	TcxHintIconSize FIconSize;
	TcxHintIconType FIconType;
	bool FRounded;
	int FRoundRadius;
	bool FStandardHint;
	bool FWordWrap;
	HRGN Rgn;
	int FLeftRightMargint;
	int FIconLeftMargin;
	int FTopBottomMargin;
	int FIconTopMargin;
	int FIconHeight;
	int FIconWidth;
	#pragma pack(push, 1)
	Types::TRect FCaptionRect;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect FTextRect;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect FHintWndRect;
	#pragma pack(pop)
	
	Byte FCallOutSize;
	TcxCallOutPosition FCalculatedCallOutPos;
	int FIndentDelta;
	void __fastcall FreeAndNilRgn(HRGN ARgn);
	bool __fastcall FindHintControllerInForm(const Controls::TWinControl* AControl);
	int __fastcall CalcMaxWidth(const AnsiString AText);
	void __fastcall SetIcon(Graphics::TIcon* Value);
	HIDESBASE MESSAGE void __fastcall WMEraseBkgnd(Messages::TWMEraseBkgnd &Message);
	
protected:
	__property TcxHintAnimate Animate = {read=FAnimate, write=FAnimate, nodefault};
	__property TcxHintAnimationDelay AnimationDelay = {read=FAnimationDelay, write=FAnimationDelay, nodefault};
	__property TcxCallOutPosition CallOutPosition = {read=FCallOutPosition, write=FCallOutPosition, nodefault};
	__property Graphics::TColor BorderColor = {read=FBorderColor, write=FBorderColor, nodefault};
	__property AnsiString Caption = {read=FCaption, write=FCaption};
	__property Graphics::TFont* CaptionFont = {read=FCaptionFont, write=FCaptionFont};
	__property Graphics::TIcon* Icon = {read=FIcon, write=SetIcon};
	__property TcxHintIconSize IconSize = {read=FIconSize, write=FIconSize, nodefault};
	__property TcxHintIconType IconType = {read=FIconType, write=FIconType, nodefault};
	__property bool Rounded = {read=FRounded, write=FRounded, nodefault};
	__property int RoundRadius = {read=FRoundRadius, write=FRoundRadius, nodefault};
	__property bool StandardHint = {read=FStandardHint, write=FStandardHint, nodefault};
	__property bool WordWrap = {read=FWordWrap, write=FWordWrap, nodefault};
	virtual void __fastcall CreateBalloonForm(void);
	virtual void __fastcall DisableRegion(void);
	virtual void __fastcall Paint(void);
	virtual void __fastcall CalculateValues(void);
	virtual void __fastcall CalculateControler(void);
	virtual void __fastcall CalculateIcon(void);
	virtual TcxCallOutPosition __fastcall CalculateAutoCallOutPosition(const Types::TRect &ARect);
	virtual void __fastcall CalculateRects(const AnsiString ACaption, const AnsiString AText);
	void __fastcall LoadPropertiesFromController(const TcxCustomHintStyleController* AHintController);
	void __fastcall LoadPropertiesFromHintInterface(const _di_IcxHint AHintIntf);
	void __fastcall LoadPropertiesFromHintStyle(const TcxCustomHintStyle* AHintStyle);
	
public:
	__fastcall virtual TcxCustomHintWindow(Classes::TComponent* aOwner);
	__fastcall virtual ~TcxCustomHintWindow(void);
	virtual bool __fastcall IsHintMsg(tagMSG &Msg);
	virtual void __fastcall ActivateHint(const Types::TRect &Rect, const AnsiString AHint);
	virtual Types::TRect __fastcall CalcHintRect(int MaxWidth, const AnsiString AHint, void * AData);
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomHintWindow(HWND ParentWindow) : Controls::THintWindow(ParentWindow) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxHintStyleClass;

typedef TMetaClass*TcxCustomHintWindowClass;

class PASCALIMPLEMENTATION TcxCustomHintStyleController : public Classes::TComponent 
{
	typedef Classes::TComponent inherited;
	
private:
	bool FActive;
	bool FIsDestruction;
	Classes::TList* FListeners;
	TcxHintStyleChangedEvent FOnHintStyleChanged;
	TcxShowHintEvent FOnShowHint;
	int FHintShortPause;
	int FHintPause;
	int FHintHidePause;
	Forms::TShowHintEvent FSavedShowHintEvent;
	TcxCustomHintWindow* FHintWindow;
	int FUpdateCount;
	void __fastcall SetHintStyle(TcxCustomHintStyle* Value);
	void __fastcall HintStyleChanged(System::TObject* Sender);
	void __fastcall SetHintShortPause(int Value);
	void __fastcall SetHintPause(int Value);
	void __fastcall SetHintHidePause(int Value);
	void __fastcall SetApplicationHintProperties(void);
	void __fastcall ShowHintHandler(AnsiString &HintStr, bool &CanShow, Forms::THintInfo &HintInfo);
	
protected:
	TcxCustomHintStyle* FHintStyle;
	virtual TMetaClass* __fastcall GetHintStyleClass(void);
	virtual TMetaClass* __fastcall GetHintWindowClass(void);
	virtual void __fastcall Loaded(void);
	virtual void __fastcall BeginUpdate(void);
	virtual void __fastcall EndUpdate(void);
	virtual void __fastcall AddListener(TcxCustomHintStyle* AListener);
	void __fastcall Changed(void);
	virtual void __fastcall DoHintStyleChanged(TcxCustomHintStyle* AStyle);
	bool __fastcall IsDestruction(void);
	virtual void __fastcall RemoveListener(TcxCustomHintStyle* AListener);
	__property Classes::TList* Listeners = {read=FListeners};
	__property bool Active = {read=FActive, nodefault};
	__property TcxCustomHintStyle* HintStyle = {read=FHintStyle, write=SetHintStyle};
	__property int HintShortPause = {read=FHintShortPause, write=SetHintShortPause, default=50};
	__property int HintPause = {read=FHintPause, write=SetHintPause, default=500};
	__property int HintHidePause = {read=FHintHidePause, write=SetHintHidePause, default=2500};
	__property TcxHintStyleChangedEvent OnHintStyleChanged = {read=FOnHintStyleChanged, write=FOnHintStyleChanged};
	__property TcxShowHintEvent OnShowHint = {read=FOnShowHint, write=FOnShowHint};
	
public:
	__fastcall virtual TcxCustomHintStyleController(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxCustomHintStyleController(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual void __fastcall BeforeDestruction(void);
	virtual void __fastcall SaveShowHintEvent(void);
	virtual void __fastcall RestoreShowHintEvent(void);
	void __fastcall ShowHint(int X, int Y, AnsiString ACaption, AnsiString AHint);
	void __fastcall HideHint(void);
	int __fastcall GetHintWidth(AnsiString AHint);
	int __fastcall GetHintHeight(AnsiString AHint);
};


class PASCALIMPLEMENTATION TcxCustomHintStyle : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	TcxHintAnimate FAnimate;
	TcxHintAnimationDelay FAnimationDelay;
	TcxCallOutPosition FCallOutPosition;
	Graphics::TColor FBorderColor;
	Graphics::TColor FColor;
	Graphics::TFont* FFont;
	Graphics::TFont* FCaptionFont;
	Graphics::TIcon* FIcon;
	TcxHintIconSize FIconSize;
	TcxHintIconType FIconType;
	bool FRounded;
	int FRoundRadius;
	bool FStandard;
	bool FDirectAccessMode;
	bool FIsDestroying;
	bool FModified;
	Classes::TPersistent* FOwner;
	int FUpdateCount;
	Classes::TNotifyEvent FOnChanged;
	Cxcontrols::TcxControl* __fastcall GetControl(void);
	Graphics::TFont* __fastcall GetFont(void);
	void __fastcall SetAnimate(TcxHintAnimate Value);
	void __fastcall SetAnimationDelay(TcxHintAnimationDelay Value);
	void __fastcall SetCallOutPosition(TcxCallOutPosition Value);
	void __fastcall SetBorderColor(Graphics::TColor Value);
	void __fastcall SetCaptionFont(Graphics::TFont* Value);
	void __fastcall SetColor(Graphics::TColor Value);
	void __fastcall SetFont(Graphics::TFont* Value);
	void __fastcall SetIcon(Graphics::TIcon* Value);
	void __fastcall SetIconSize(TcxHintIconSize Value);
	void __fastcall SetIconType(TcxHintIconType Value);
	void __fastcall SetRounded(bool Value);
	void __fastcall SetRoundRadius(int Value);
	void __fastcall SetStandard(bool Value);
	void __fastcall IconChangeHandler(System::TObject* Sender);
	void __fastcall InternalRestoreDefault(void);
	
protected:
	TcxCustomHintStyleController* FHintStyleController;
	DYNAMIC Classes::TPersistent* __fastcall GetOwner(void);
	TcxCustomHintStyleController* __fastcall BaseGetHintStyleController(void);
	void __fastcall BaseSetHintStyleController(TcxCustomHintStyleController* Value);
	virtual void __fastcall Changed(void);
	virtual void __fastcall ControllerChangedNotification(TcxCustomHintStyleController* AStyleController);
	virtual void __fastcall ControllerFreeNotification(TcxCustomHintStyleController* AHintStyleController);
	bool __fastcall IsDestroying(void);
	virtual void __fastcall HintStyleControllerChanged(void);
	__property TcxCustomHintStyleController* HintStyleController = {read=BaseGetHintStyleController, write=BaseSetHintStyleController};
	__property Classes::TNotifyEvent OnChanged = {read=FOnChanged, write=FOnChanged};
	
public:
	__fastcall virtual TcxCustomHintStyle(Classes::TPersistent* AOwner, bool ADirectAccessMode);
	__fastcall virtual ~TcxCustomHintStyle(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual void __fastcall BeforeDestruction(void);
	void __fastcall BeginUpdate(void);
	void __fastcall EndUpdate(void);
	/* virtual class method */ virtual TcxCustomHintStyleController* __fastcall GetDefaultHintStyleController(TMetaClass* vmt);
	virtual void __fastcall RestoreDefaults(void);
	__property Cxcontrols::TcxControl* Control = {read=GetControl};
	__property bool DirectAccessMode = {read=FDirectAccessMode, nodefault};
	
__published:
	__property TcxHintAnimate Animate = {read=FAnimate, write=SetAnimate, default=8};
	__property TcxHintAnimationDelay AnimationDelay = {read=FAnimationDelay, write=SetAnimationDelay, default=100};
	__property Graphics::TColor BorderColor = {read=FBorderColor, write=SetBorderColor, default=-2147483642};
	__property TcxCallOutPosition CallOutPosition = {read=FCallOutPosition, write=SetCallOutPosition, default=0};
	__property Graphics::TFont* CaptionFont = {read=FCaptionFont, write=SetCaptionFont};
	__property Graphics::TColor Color = {read=FColor, write=SetColor, default=-2147483624};
	__property Graphics::TFont* Font = {read=GetFont, write=SetFont};
	__property Graphics::TIcon* Icon = {read=FIcon, write=SetIcon};
	__property TcxHintIconSize IconSize = {read=FIconSize, write=SetIconSize, default=0};
	__property TcxHintIconType IconType = {read=FIconType, write=SetIconType, default=0};
	__property bool Rounded = {read=FRounded, write=SetRounded, default=0};
	__property int RoundRadius = {read=FRoundRadius, write=SetRoundRadius, default=11};
	__property bool Standard = {read=FStandard, write=SetStandard, default=0};
};


class DELPHICLASS TcxHintStyleController;
class PASCALIMPLEMENTATION TcxHintStyleController : public TcxCustomHintStyleController 
{
	typedef TcxCustomHintStyleController inherited;
	
__published:
	__property HintStyle ;
	__property HintShortPause  = {default=50};
	__property HintPause  = {default=500};
	__property HintHidePause  = {default=2500};
	__property OnHintStyleChanged ;
	__property OnShowHint ;
public:
	#pragma option push -w-inl
	/* TcxCustomHintStyleController.Create */ inline __fastcall virtual TcxHintStyleController(Classes::TComponent* AOwner) : TcxCustomHintStyleController(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomHintStyleController.Destroy */ inline __fastcall virtual ~TcxHintStyleController(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxHintWindow;
class PASCALIMPLEMENTATION TcxHintWindow : public TcxCustomHintWindow 
{
	typedef TcxCustomHintWindow inherited;
	
public:
	__property Animate ;
	__property AnimationDelay ;
	__property CallOutPosition ;
	__property BorderColor ;
	__property Caption ;
	__property CaptionFont ;
	__property Icon ;
	__property IconSize ;
	__property IconType ;
	__property Rounded ;
	__property RoundRadius ;
	__property WordWrap ;
public:
	#pragma option push -w-inl
	/* TcxCustomHintWindow.Create */ inline __fastcall virtual TcxHintWindow(Classes::TComponent* aOwner) : TcxCustomHintWindow(aOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomHintWindow.Destroy */ inline __fastcall virtual ~TcxHintWindow(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxHintWindow(HWND ParentWindow) : TcxCustomHintWindow(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxhint */
using namespace Cxhint;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxHint
