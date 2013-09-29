// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxSplitter.pas' rev: 6.00

#ifndef cxSplitterHPP
#define cxSplitterHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxExtEditUtils.hpp>	// Pascal unit
#include <cxExtEditConsts.hpp>	// Pascal unit
#include <cxEditUtils.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxsplitter
{
//-- type declarations -------------------------------------------------------
typedef int TcxPositionAfterOpen;

#pragma option push -b-
enum TcxSplitterAlign { salBottom, salLeft, salRight, salTop };
#pragma option pop

#pragma option push -b-
enum TcxSplitterDragState { sstNormal, sstResizing, sstHotZoneClick };
#pragma option pop

#pragma option push -b-
enum TcxSplitterMouseState { smsClicked, smsInHotZone };
#pragma option pop

typedef Set<TcxSplitterMouseState, smsClicked, smsInHotZone>  TcxSplitterMouseStates;

#pragma option push -b-
enum TcxSplitterState { ssOpened, ssClosed };
#pragma option pop

#pragma option push -b-
enum TcxSplitterDirection { cxsdLeftToRight, cxsdRightToLeft, cxsdTopToBottom, cxsdBottomToTop };
#pragma option pop

typedef void __fastcall (__closure *TCanResizeEvent)(System::TObject* Sender, int &NewSize, bool &Accept);

typedef void __fastcall (__closure *TBeforeOpenHotZoneEvent)(System::TObject* Sender, bool &AllowOpen);

typedef void __fastcall (__closure *TBeforeCloseHotZoneEvent)(System::TObject* Sender, bool &AllowClose);

class DELPHICLASS TcxHotZoneStyle;
class DELPHICLASS TcxCustomSplitter;
typedef TMetaClass*TcxHotZoneStyleClass;

class PASCALIMPLEMENTATION TcxCustomSplitter : public Cxcontrols::TcxControl 
{
	typedef Cxcontrols::TcxControl inherited;
	
private:
	TcxSplitterAlign FAlignSplitter;
	bool FAutoPosition;
	bool FAutoSnap;
	bool FAllowHotZoneDrag;
	Cxexteditconsts::TcxNaturalNumber FDragThreshold;
	bool FInvertDirection;
	Cxexteditconsts::TcxNaturalNumber FMinSize;
	TcxPositionAfterOpen FPositionAfterOpen;
	bool FResizeUpdate;
	bool FResizeIgnoreSnap;
	TCanResizeEvent FOnCanResize;
	Classes::TNotifyEvent FOnMoved;
	TBeforeOpenHotZoneEvent FOnBeforeOpen;
	Classes::TNotifyEvent FOnAfterOpen;
	TBeforeCloseHotZoneEvent FOnBeforeClose;
	Classes::TNotifyEvent FOnAfterClose;
	bool FNativeBackground;
	Controls::TWinControl* FActiveControl;
	TcxSplitterState FState;
	TcxSplitterMouseStates FMouseStates;
	int FPositionBeforeClose;
	TcxSplitterDragState FSplitterState;
	Controls::TControl* FControl;
	#pragma pack(push, 1)
	Types::TPoint FSplitterClickPoint;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TPoint FHotZoneClickPoint;
	#pragma pack(pop)
	
	Graphics::TBrush* FBrush;
	HDC FLineDC;
	bool FLineVisible;
	HBRUSH FPrevBrush;
	Word FMaxSize;
	int FNewSize;
	int FOldSize;
	Controls::TKeyEvent FOldKeyDown;
	int FSplit;
	TcxHotZoneStyle* FHotZone;
	TMetaClass*FHotZoneStyleClass;
	Classes::TNotifyEvent FHotZoneEvents;
	Cxgraphics::TcxCanvas* FDrawCanvas;
	int FLastPatternDrawPosition;
	bool FSavedShowHint;
	bool FSavedParentShowHint;
	void __fastcall CalcSplitSize(int X, int Y, int &NewSize, int &Split);
	Controls::TControl* __fastcall FindControl(void);
	void __fastcall FocusKeyDown(System::TObject* Sender, Word &Key, Classes::TShiftState Shift);
	void __fastcall AllocateSplitLineDC(void);
	void __fastcall ReleaseSplitLine(void);
	void __fastcall UpdateControlSize(void);
	void __fastcall UpdateSize(int X, int Y);
	HIDESBASE MESSAGE void __fastcall CMMouseEnter(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMMouseLeave(Messages::TMessage &Message);
	MESSAGE void __fastcall CMTabStopChanged(Messages::TMessage &Message);
	void __fastcall SetAlignSplitter(TcxSplitterAlign Value);
	void __fastcall SetSplitterState(TcxSplitterState Value);
	void __fastcall SetAllowHotZoneDrag(bool Value);
	void __fastcall SetInvertDirection(bool Value);
	void __fastcall SetHotZone(TcxHotZoneStyle* Value);
	void __fastcall SetNativeBackground(bool Value);
	void __fastcall RecalcLastPosition(void);
	void __fastcall NormalizeSplitterSize(void);
	void __fastcall SetHotZoneStyleClass(const TMetaClass* Value);
	AnsiString __fastcall GetHotZoneClassName();
	void __fastcall SetHotZoneClassName(AnsiString Value);
	void __fastcall InitResize(int X, int Y);
	
protected:
	Graphics::TBitmap* FDrawBitmap;
	HIDESBASE virtual bool __fastcall CanResize(int &NewSize);
	HIDESBASE virtual bool __fastcall DoCanResize(int &NewSize);
	DYNAMIC void __fastcall MouseDown(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseMove(Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseUp(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall DrawSplitLine(void);
	virtual void __fastcall HotZoneStyleChanged(void);
	virtual void __fastcall DrawHotZone(void);
	virtual void __fastcall Paint(void);
	virtual void __fastcall StopSizing(void);
	virtual Cxexteditconsts::TcxNaturalNumber __fastcall GetSplitterMinSize(void);
	virtual Cxexteditconsts::TcxNaturalNumber __fastcall GetSplitterMaxSize(void);
	virtual void __fastcall CreateHotZone(void);
	virtual void __fastcall DestroyHotZone(void);
	virtual void __fastcall DoEventBeforeOpen(bool &AllowOpenHotZone);
	virtual void __fastcall DoEventAfterOpen(void);
	virtual void __fastcall DoEventBeforeClose(bool &AllowCloseHotZone);
	virtual void __fastcall DoEventAfterClose(void);
	virtual void __fastcall DoEventMoved(void);
	virtual void __fastcall Notification(Classes::TComponent* ACOmponent, Classes::TOperation Operation);
	virtual void __fastcall Loaded(void);
	virtual TcxSplitterDirection __fastcall CalculateSplitterDirection(void);
	virtual void __fastcall UpdateMouseStates(int X, int Y);
	__property TcxSplitterAlign AlignSplitter = {read=FAlignSplitter, write=SetAlignSplitter, default=1};
	__property bool AutoPosition = {read=FAutoPosition, write=FAutoPosition, default=1};
	__property bool AutoSnap = {read=FAutoSnap, write=FAutoSnap, default=0};
	__property bool AllowHotZoneDrag = {read=FAllowHotZoneDrag, write=SetAllowHotZoneDrag, default=1};
	__property Cxexteditconsts::TcxNaturalNumber DragThreshold = {read=FDragThreshold, write=FDragThreshold, default=3};
	__property bool InvertDirection = {read=FInvertDirection, write=SetInvertDirection, default=0};
	__property Cxexteditconsts::TcxNaturalNumber MinSize = {read=FMinSize, write=FMinSize, default=30};
	__property TcxPositionAfterOpen PositionAfterOpen = {read=FPositionAfterOpen, write=FPositionAfterOpen, default=30};
	__property bool ResizeUpdate = {read=FResizeUpdate, write=FResizeUpdate, default=0};
	__property bool ResizeIgnoreSnap = {read=FResizeIgnoreSnap, write=FResizeIgnoreSnap, default=1};
	__property Controls::TControl* Control = {read=FControl, write=FControl};
	__property bool NativeBackground = {read=FNativeBackground, write=SetNativeBackground, default=1};
	__property TCanResizeEvent OnCanResize = {read=FOnCanResize, write=FOnCanResize};
	__property Classes::TNotifyEvent OnMoved = {read=FOnMoved, write=FOnMoved};
	__property TBeforeOpenHotZoneEvent OnBeforeOpen = {read=FOnBeforeOpen, write=FOnBeforeOpen};
	__property Classes::TNotifyEvent OnAfterOpen = {read=FOnAfterOpen, write=FOnAfterOpen};
	__property TBeforeCloseHotZoneEvent OnBeforeClose = {read=FOnBeforeClose, write=FOnBeforeClose};
	__property Classes::TNotifyEvent OnAfterClose = {read=FOnAfterClose, write=FOnAfterClose};
	
public:
	__fastcall virtual TcxCustomSplitter(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxCustomSplitter(void);
	void __fastcall OpenSplitter(void);
	void __fastcall CloseSplitter(void);
	__property TcxSplitterState State = {read=FState, write=SetSplitterState, nodefault};
	bool __fastcall IsPointInHotZone(const int X, const int Y);
	bool __fastcall IsPointInSplitter(const int X, const int Y);
	__property TMetaClass* HotZoneStyleClass = {read=FHotZoneStyleClass, write=SetHotZoneStyleClass};
	__property TcxSplitterDirection Direction = {read=CalculateSplitterDirection, nodefault};
	
__published:
	__property AnsiString HotZoneClassName = {read=GetHotZoneClassName, write=SetHotZoneClassName};
	__property TcxHotZoneStyle* HotZone = {read=FHotZone, write=SetHotZone};
	__property Classes::TNotifyEvent HotZoneEvents = {read=FHotZoneEvents, write=FHotZoneEvents};
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomSplitter(HWND ParentWindow) : Cxcontrols::TcxControl(ParentWindow) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxHotZoneStyle : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	TcxCustomSplitter* FOwner;
	Cxexteditconsts::TcxNaturalNumber FSizePercent;
	bool FVisible;
	#pragma pack(push, 1)
	Types::TRect FHotZoneRect;
	#pragma pack(pop)
	
	void __fastcall SetSizePercent(Cxexteditconsts::TcxNaturalNumber Value);
	void __fastcall SetVisible(bool Value);
	
protected:
	virtual void __fastcall Changed(void);
	virtual TcxSplitterDirection __fastcall SplitterDirection(void);
	virtual Types::TRect __fastcall CalculateHotZoneRect(const Types::TRect &ABounds);
	virtual Cxexteditconsts::TcxNaturalNumber __fastcall GetMinSize(void);
	virtual Cxexteditconsts::TcxNaturalNumber __fastcall GetMaxSize(void);
	virtual Types::TRect __fastcall DrawHotZone(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ARect, const bool AHighlighted, const bool AClicked);
	virtual void __fastcall DrawBackground(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ARect, const bool AHighlighted, const bool AClicked);
	
public:
	__property Cxexteditconsts::TcxNaturalNumber SizePercent = {read=FSizePercent, write=SetSizePercent, default=30};
	__property bool Visible = {read=FVisible, write=SetVisible, default=1};
	__property Types::TRect HotZoneRect = {read=FHotZoneRect, write=FHotZoneRect};
	__property TcxCustomSplitter* Owner = {read=FOwner};
	__fastcall virtual TcxHotZoneStyle(TcxCustomSplitter* AOwner);
	__fastcall virtual ~TcxHotZoneStyle(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
};


class DELPHICLASS TcxMediaPlayer9Style;
class PASCALIMPLEMENTATION TcxMediaPlayer9Style : public TcxHotZoneStyle 
{
	typedef TcxHotZoneStyle inherited;
	
private:
	#pragma pack(push, 1)
	Types::TRect FArrowRect;
	#pragma pack(pop)
	
	Graphics::TColor FArrowColor;
	Graphics::TColor FArrowHighlightColor;
	Graphics::TColor FLightColor;
	Graphics::TColor FBorderColor;
	Graphics::TColor FShadowStartColor;
	Graphics::TColor FShadowHighlightStartColor;
	void __fastcall SetArrowColor(Graphics::TColor Value);
	void __fastcall SetArrowHighlightColor(Graphics::TColor Value);
	void __fastcall SetLightColor(Graphics::TColor Value);
	void __fastcall SetBorderColor(Graphics::TColor Value);
	void __fastcall SetShadowStartColor(Graphics::TColor Value);
	void __fastcall SetShadowHighlightStartColor(Graphics::TColor Value);
	
protected:
	virtual Types::TRect __fastcall DrawHotZone(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ARect, const bool AHighlighted, const bool AClicked);
	virtual void __fastcall DrawBackground(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ARect, const bool AHighlighted, const bool AClicked);
	virtual Types::TRect __fastcall CalculateHotZoneRect(const Types::TRect &ABounds);
	
public:
	__fastcall virtual TcxMediaPlayer9Style(TcxCustomSplitter* AOwner);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	
__published:
	__property SizePercent  = {default=30};
	__property Visible  = {default=1};
	__property Graphics::TColor ArrowColor = {read=FArrowColor, write=SetArrowColor, default=-2147483640};
	__property Graphics::TColor ArrowHighlightColor = {read=FArrowHighlightColor, write=SetArrowHighlightColor, default=16711680};
	__property Graphics::TColor LightColor = {read=FLightColor, write=SetLightColor, default=-2147483643};
	__property Graphics::TColor BorderColor = {read=FBorderColor, write=SetBorderColor, default=-2147483632};
	__property Graphics::TColor ShadowStartColor = {read=FShadowStartColor, write=SetShadowStartColor, default=16115405};
	__property Graphics::TColor ShadowHighlightStartColor = {read=FShadowHighlightStartColor, write=SetShadowHighlightStartColor, default=11531715};
public:
	#pragma option push -w-inl
	/* TcxHotZoneStyle.Destroy */ inline __fastcall virtual ~TcxMediaPlayer9Style(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxMediaPlayer8Style;
class PASCALIMPLEMENTATION TcxMediaPlayer8Style : public TcxHotZoneStyle 
{
	typedef TcxHotZoneStyle inherited;
	
private:
	#pragma pack(push, 1)
	Types::TRect FLTPointsRect;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect FRBPointsRect;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect FArrowRect;
	#pragma pack(pop)
	
	Graphics::TColor FArrowColor;
	Graphics::TColor FArrowHighlightColor;
	Graphics::TColor FLightColor;
	Graphics::TColor FShadowColor;
	void __fastcall SetArrowColor(Graphics::TColor Value);
	void __fastcall SetArrowHighlightColor(Graphics::TColor Value);
	void __fastcall SetLightColor(Graphics::TColor Value);
	void __fastcall SetShadowColor(Graphics::TColor Value);
	void __fastcall DrawArrowRect(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ARect, const bool AHighlighted, const bool AClicked);
	
protected:
	virtual Types::TRect __fastcall DrawHotZone(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ARect, const bool AHighlighted, const bool AClicked);
	virtual void __fastcall DrawBackground(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ARect, const bool AHighlighted, const bool AClicked);
	virtual Types::TRect __fastcall CalculateHotZoneRect(const Types::TRect &ABounds);
	
public:
	__fastcall virtual TcxMediaPlayer8Style(TcxCustomSplitter* AOwner);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	
__published:
	__property SizePercent  = {default=30};
	__property Visible  = {default=1};
	__property Graphics::TColor ArrowColor = {read=FArrowColor, write=SetArrowColor, default=-2147483640};
	__property Graphics::TColor ArrowHighlightColor = {read=FArrowHighlightColor, write=SetArrowHighlightColor, default=-2147483643};
	__property Graphics::TColor LightColor = {read=FLightColor, write=SetLightColor, default=-2147483643};
	__property Graphics::TColor ShadowColor = {read=FShadowColor, write=SetShadowColor, default=-2147483632};
public:
	#pragma option push -w-inl
	/* TcxHotZoneStyle.Destroy */ inline __fastcall virtual ~TcxMediaPlayer8Style(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxXPTaskBarStyle;
class PASCALIMPLEMENTATION TcxXPTaskBarStyle : public TcxHotZoneStyle 
{
	typedef TcxHotZoneStyle inherited;
	
private:
	Graphics::TColor FLightColor;
	Graphics::TColor FShadowColor;
	#pragma pack(push, 1)
	Types::TRect FLTPointsRect;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect FRBPointsRect;
	#pragma pack(pop)
	
	void __fastcall SetLightColor(Graphics::TColor Value);
	void __fastcall SetShadowColor(Graphics::TColor Value);
	
protected:
	virtual Types::TRect __fastcall DrawHotZone(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ARect, const bool AHighlighted, const bool AClicked);
	virtual void __fastcall DrawBackground(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ARect, const bool AHighlighted, const bool AClicked);
	virtual Types::TRect __fastcall CalculateHotZoneRect(const Types::TRect &ABounds);
	
public:
	__fastcall virtual TcxXPTaskBarStyle(TcxCustomSplitter* AOwner);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	
__published:
	__property SizePercent  = {default=30};
	__property Visible  = {default=1};
	__property Graphics::TColor LightColor = {read=FLightColor, write=SetLightColor, default=-2147483643};
	__property Graphics::TColor ShadowColor = {read=FShadowColor, write=SetShadowColor, default=-2147483632};
public:
	#pragma option push -w-inl
	/* TcxHotZoneStyle.Destroy */ inline __fastcall virtual ~TcxXPTaskBarStyle(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxSimpleStyle;
class PASCALIMPLEMENTATION TcxSimpleStyle : public TcxHotZoneStyle 
{
	typedef TcxHotZoneStyle inherited;
	
private:
	Graphics::TColor FArrowColor;
	Graphics::TColor FArrowHighlightColor;
	Graphics::TColor FLightColor;
	Graphics::TColor FShadowColor;
	Graphics::TColor FDotsColor;
	Graphics::TColor FDotsShadowColor;
	#pragma pack(push, 1)
	Types::TRect FLTArrowRect;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect FRBArrowRect;
	#pragma pack(pop)
	
	void __fastcall SetArrowColor(Graphics::TColor Value);
	void __fastcall SetArrowHighlightColor(Graphics::TColor Value);
	void __fastcall SetLightColor(Graphics::TColor Value);
	void __fastcall SetShadowColor(Graphics::TColor Value);
	void __fastcall SetDotsColor(Graphics::TColor Value);
	void __fastcall SetDotsShadowColor(Graphics::TColor Value);
	
protected:
	virtual Types::TRect __fastcall DrawHotZone(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ARect, const bool AHighlighted, const bool AClicked);
	virtual void __fastcall DrawBackground(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ARect, const bool AHighlighted, const bool AClicked);
	virtual Types::TRect __fastcall CalculateHotZoneRect(const Types::TRect &ABounds);
	
public:
	__fastcall virtual TcxSimpleStyle(TcxCustomSplitter* AOwner);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	
__published:
	__property SizePercent  = {default=30};
	__property Visible  = {default=1};
	__property Graphics::TColor ArrowColor = {read=FArrowColor, write=SetArrowColor, default=-2147483640};
	__property Graphics::TColor ArrowHighlightColor = {read=FArrowHighlightColor, write=SetArrowHighlightColor, default=-2147483643};
	__property Graphics::TColor LightColor = {read=FLightColor, write=SetLightColor, default=-2147483643};
	__property Graphics::TColor ShadowColor = {read=FShadowColor, write=SetShadowColor, default=-2147483632};
	__property Graphics::TColor DotsColor = {read=FDotsColor, write=SetDotsColor, default=-2147483635};
	__property Graphics::TColor DotsShadowColor = {read=FDotsShadowColor, write=SetDotsShadowColor, default=-2147483643};
public:
	#pragma option push -w-inl
	/* TcxHotZoneStyle.Destroy */ inline __fastcall virtual ~TcxSimpleStyle(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxSplitter;
class PASCALIMPLEMENTATION TcxSplitter : public TcxCustomSplitter 
{
	typedef TcxCustomSplitter inherited;
	
__published:
	__property AlignSplitter  = {default=1};
	__property AllowHotZoneDrag  = {default=1};
	__property AutoPosition  = {default=1};
	__property DragThreshold  = {default=3};
	__property NativeBackground  = {default=1};
	__property PositionAfterOpen  = {default=30};
	__property AutoSnap  = {default=0};
	__property InvertDirection  = {default=0};
	__property MinSize  = {default=30};
	__property ResizeUpdate  = {default=0};
	__property ResizeIgnoreSnap  = {default=1};
	__property Control ;
	__property OnCanResize ;
	__property OnMoved ;
	__property OnBeforeOpen ;
	__property OnAfterOpen ;
	__property OnBeforeClose ;
	__property OnAfterClose ;
	__property Color  = {default=-2147483643};
	__property ShowHint ;
	__property ParentColor  = {default=1};
	__property ParentShowHint  = {default=1};
	__property Visible  = {default=1};
public:
	#pragma option push -w-inl
	/* TcxCustomSplitter.Create */ inline __fastcall virtual TcxSplitter(Classes::TComponent* AOwner) : TcxCustomSplitter(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomSplitter.Destroy */ inline __fastcall virtual ~TcxSplitter(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxSplitter(HWND ParentWindow) : TcxCustomSplitter(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE Cxclasses::TcxRegisteredClasses* __fastcall GetRegisteredHotZoneStyles(void);

}	/* namespace Cxsplitter */
using namespace Cxsplitter;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxSplitter
