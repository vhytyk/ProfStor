// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxTrackBar.pas' rev: 6.00

#ifndef cxTrackBarHPP
#define cxTrackBarHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Menus.hpp>	// Pascal unit
#include <cxLookAndFeels.hpp>	// Pascal unit
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

namespace Cxtrackbar
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TcxTrackBarOrientation { tboHorizontal, tboVertical };
#pragma option pop

#pragma option push -b-
enum TcxTrackBarTextOrientation { tbtoHorizontal, tbtoVertical };
#pragma option pop

#pragma option push -b-
enum TcxTrackBarTickMarks { cxtmBoth, cxtmTopLeft, cxtmBottomRight };
#pragma option pop

#pragma option push -b-
enum TcxTrackBarTickType { tbttTicks, tbttNumbers, tbttValueNumber };
#pragma option pop

#pragma option push -b-
enum TcxTrackBarMouseState { tbmpInControl, tbmpUnderThumb, tbmpSliding };
#pragma option pop

typedef Set<TcxTrackBarMouseState, tbmpInControl, tbmpSliding>  TcxTrackBarMouseStates;

#pragma option push -b-
enum TcxTrackBarSlideState { tbksNormal, tbksIncludeSelection };
#pragma option pop

#pragma option push -b-
enum TcxTrackBarThumbType { cxttNone, cxttRegular, cxttCustom };
#pragma option pop

#pragma option push -b-
enum TcxTrackBarThumbStep { cxtsNormal, cxtsJump };
#pragma option pop

typedef void __fastcall (__closure *TcxGetThumbRectEvent)(System::TObject* Sender, Types::TRect &ARect);

typedef void __fastcall (__closure *TcxDrawThumbEvent)(System::TObject* Sender, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ARect);

class DELPHICLASS TcxTrackBarStyle;
class PASCALIMPLEMENTATION TcxTrackBarStyle : public Cxedit::TcxCustomEditStyle 
{
	typedef Cxedit::TcxCustomEditStyle inherited;
	
public:
	virtual Graphics::TColor __fastcall DefaultColor(void);
	virtual void __fastcall RestoreDefaults(void);
public:
	#pragma option push -w-inl
	/* TcxCustomEditStyle.Create */ inline __fastcall virtual TcxTrackBarStyle(Classes::TPersistent* AOwner, bool ADirectAccessMode) : Cxedit::TcxCustomEditStyle(AOwner, ADirectAccessMode) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxContainerStyle.Destroy */ inline __fastcall virtual ~TcxTrackBarStyle(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomTrackBarViewInfo;
class PASCALIMPLEMENTATION TcxCustomTrackBarViewInfo : public Cxtextedit::TcxCustomTextEditViewInfo 
{
	typedef Cxtextedit::TcxCustomTextEditViewInfo inherited;
	
private:
	int FTrackBarState;
	Cxlookandfeels::TcxLookAndFeel* FLookAndFeel;
	int FFrequency;
	bool FAutoSize;
	int FMin;
	int FMax;
	TcxTrackBarOrientation FOrientation;
	TcxTrackBarTextOrientation FTextOrientation;
	int FPageSize;
	int FPosition;
	Graphics::TColor FTrackColor;
	int FTrackSize;
	int FSelectionStart;
	int FSelectionEnd;
	Graphics::TColor FSelectionColor;
	bool FShowTicks;
	TcxTrackBarThumbType FThumbType;
	bool FShowTrack;
	Graphics::TColor FTickColor;
	TcxTrackBarTickType FTickType;
	TcxTrackBarTickMarks FTickMarks;
	Cxexteditconsts::TcxNaturalNumber FTickSize;
	int FThumbHeight;
	int FThumbWidth;
	Graphics::TColor FThumbColor;
	Graphics::TColor FThumbHighlightColor;
	int FTrackBarBorderWidth;
	Cxgraphics::TcxCanvas* FTBCanvas;
	Graphics::TBitmap* FTBBitmap;
	bool FShortRefresh;
	bool FShowSelection;
	
protected:
	#pragma pack(push, 1)
	Types::TRect RealTrackBarRect;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect TrackBarRect;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect TrackZoneRect;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect TrackRect;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect ThumbRect;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect SelectionRect;
	#pragma pack(pop)
	
	int FromBorderIndent;
	TcxDrawThumbEvent OnDrawThumb;
	virtual void __fastcall DrawTrack(Cxgraphics::TcxCanvas* ACanvas);
	virtual void __fastcall DrawSelection(Cxgraphics::TcxCanvas* ACanvas);
	virtual void __fastcall DrawTicks(Cxgraphics::TcxCanvas* ACanvas);
	virtual void __fastcall DrawThumb(Cxgraphics::TcxCanvas* ACanvas);
	virtual void __fastcall PaintTrackBar(Cxgraphics::TcxCanvas* ACanvas);
	
public:
	int ThumbSize;
	int ThumbLargeSize;
	int TrackRectDelta;
	int TrackHeight;
	int TrackWidth;
	double TickOffset;
	bool NeedPointer;
	#pragma pack(push, 1)
	Types::TRect FocusRect;
	#pragma pack(pop)
	
	bool HasForegroundImage;
	__property Cxlookandfeels::TcxLookAndFeel* LookAndFeel = {read=FLookAndFeel, write=FLookAndFeel};
	__property int TrackBarState = {read=FTrackBarState, write=FTrackBarState, nodefault};
	__property int Frequency = {read=FFrequency, write=FFrequency, nodefault};
	__property bool AutoSize = {read=FAutoSize, write=FAutoSize, nodefault};
	__property int Min = {read=FMin, write=FMin, nodefault};
	__property int Max = {read=FMax, write=FMax, nodefault};
	__property TcxTrackBarOrientation Orientation = {read=FOrientation, write=FOrientation, nodefault};
	__property TcxTrackBarTextOrientation TextOrientation = {read=FTextOrientation, write=FTextOrientation, nodefault};
	__property int PageSize = {read=FPageSize, write=FPageSize, nodefault};
	__property int Position = {read=FPosition, write=FPosition, nodefault};
	__property Graphics::TColor TrackColor = {read=FTrackColor, write=FTrackColor, nodefault};
	__property int TrackSize = {read=FTrackSize, write=FTrackSize, nodefault};
	__property int SelectionStart = {read=FSelectionStart, write=FSelectionStart, nodefault};
	__property int SelectionEnd = {read=FSelectionEnd, write=FSelectionEnd, nodefault};
	__property Graphics::TColor SelectionColor = {read=FSelectionColor, write=FSelectionColor, nodefault};
	__property bool ShowTicks = {read=FShowTicks, write=FShowTicks, nodefault};
	__property TcxTrackBarThumbType ThumbType = {read=FThumbType, write=FThumbType, nodefault};
	__property bool ShowTrack = {read=FShowTrack, write=FShowTrack, nodefault};
	__property Graphics::TColor TickColor = {read=FTickColor, write=FTickColor, nodefault};
	__property TcxTrackBarTickType TickType = {read=FTickType, write=FTickType, nodefault};
	__property TcxTrackBarTickMarks TickMarks = {read=FTickMarks, write=FTickMarks, nodefault};
	__property Cxexteditconsts::TcxNaturalNumber TickSize = {read=FTickSize, write=FTickSize, nodefault};
	__property int ThumbHeight = {read=FThumbHeight, write=FThumbHeight, nodefault};
	__property int ThumbWidth = {read=FThumbWidth, write=FThumbWidth, nodefault};
	__property Graphics::TColor ThumbColor = {read=FThumbColor, write=FThumbColor, nodefault};
	__property Graphics::TColor ThumbHighlightColor = {read=FThumbHighlightColor, write=FThumbHighlightColor, nodefault};
	__property int TrackBarBorderWidth = {read=FTrackBarBorderWidth, write=FTrackBarBorderWidth, nodefault};
	virtual void __fastcall Assign(System::TObject* Source);
	virtual void __fastcall DrawText(Cxgraphics::TcxCanvas* ACanvas);
	virtual Cxgraphics::TcxRegion* __fastcall GetUpdateRegion(Cxcontainer::TcxContainerViewInfo* AViewInfo);
	virtual bool __fastcall NeedShowHint(Cxgraphics::TcxCanvas* ACanvas, const Types::TPoint &P, /* out */ AnsiString &AText, /* out */ bool &AIsMultiLine, /* out */ Types::TRect &ATextRect)/* overload */;
	virtual void __fastcall Offset(int DX, int DY);
	virtual void __fastcall Paint(Cxgraphics::TcxCanvas* ACanvas);
	__fastcall virtual TcxCustomTrackBarViewInfo(void);
	__fastcall virtual ~TcxCustomTrackBarViewInfo(void);
	
/* Hoisted overloads: */
	
public:
	inline bool __fastcall  NeedShowHint(Cxgraphics::TcxCanvas* ACanvas, const Types::TPoint &P, const Types::TRect &AVisibleBounds, /* out */ AnsiString &AText, /* out */ bool &AIsMultiLine, /* out */ Types::TRect &ATextRect){ return TcxCustomTextEditViewInfo::NeedShowHint(ACanvas, P, AVisibleBounds, AText, AIsMultiLine, ATextRect); }
	
};


class DELPHICLASS TcxCustomTrackBarViewData;
class DELPHICLASS TcxCustomTrackBarProperties;
class PASCALIMPLEMENTATION TcxCustomTrackBarViewData : public Cxedit::TcxCustomEditViewData 
{
	typedef Cxedit::TcxCustomEditViewData inherited;
	
private:
	HIDESBASE TcxCustomTrackBarProperties* __fastcall GetProperties(void);
	HIDESBASE void __fastcall SetProperties(TcxCustomTrackBarProperties* Value);
	
protected:
	virtual void __fastcall CalculateCustomTrackBarRects(Cxgraphics::TcxCanvas* ACanvas, TcxCustomTrackBarViewInfo* AViewInfo);
	virtual tagSIZE __fastcall InternalGetEditConstantPartSize(Cxgraphics::TcxCanvas* ACanvas, bool AIsInplace, const Cxedit::TcxEditSizeProperties &AEditSizeProperties, tagSIZE &MinContentSize, Cxedit::TcxCustomEditViewInfo* AViewInfo);
	virtual int __fastcall GetDrawTextFlags(void);
	bool __fastcall GetIsEditClass(void);
	virtual int __fastcall GetTopLeftTickSize(Cxgraphics::TcxCanvas* ACanvas, TcxCustomTrackBarViewInfo* AViewInfo, bool ALeftTop);
	virtual void __fastcall CalculateTBViewInfoProps(Cxedit::TcxCustomEditViewInfo* AViewInfo);
	virtual void __fastcall CalculateTrackBarRect(TcxCustomTrackBarViewInfo* AViewInfo);
	virtual void __fastcall CalculateTrackZoneRect(Cxgraphics::TcxCanvas* ACanvas, TcxCustomTrackBarViewInfo* AViewInfo);
	virtual void __fastcall CalculateTrackRect(TcxCustomTrackBarViewInfo* AViewInfo);
	virtual void __fastcall CalculateThumbSize(TcxCustomTrackBarViewInfo* AViewInfo);
	virtual void __fastcall CalculateThumbRect(TcxCustomTrackBarViewInfo* AViewInfo);
	virtual void __fastcall CalculateSelectionRect(TcxCustomTrackBarViewInfo* AViewInfo);
	
public:
	virtual void __fastcall Calculate(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ABounds, const Types::TPoint &P, Cxcontainer::TcxMouseButton Button, Classes::TShiftState Shift, Cxedit::TcxCustomEditViewInfo* AViewInfo, bool AIsMouseEvent);
	virtual void __fastcall EditValueToDrawValue(Cxgraphics::TcxCanvas* ACanvas, const Variant &AEditValue, Cxedit::TcxCustomEditViewInfo* AViewInfo);
	__property TcxCustomTrackBarProperties* Properties = {read=GetProperties, write=SetProperties};
public:
	#pragma option push -w-inl
	/* TcxCustomEditViewData.Create */ inline __fastcall virtual TcxCustomTrackBarViewData(Cxedit::TcxCustomEditProperties* AProperties, Cxcontainer::TcxContainerStyle* AStyle, bool AIsInplace) : Cxedit::TcxCustomEditViewData(AProperties, AStyle, AIsInplace) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxCustomTrackBarViewData(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxCustomTrackBarProperties : public Cxedit::TcxCustomEditProperties 
{
	typedef Cxedit::TcxCustomEditProperties inherited;
	
private:
	bool FAutoSize;
	TcxTrackBarMouseStates FMouseStates;
	bool FShortRefresh;
	int FBorderWidth;
	int FFrequency;
	int FMin;
	int FMax;
	TcxTrackBarOrientation FOrientation;
	TcxTrackBarTextOrientation FTextOrientation;
	Cxexteditconsts::TcxNaturalNumber FPageSize;
	int FSelectionStart;
	int FSelectionEnd;
	Graphics::TColor FSelectionColor;
	bool FShowTicks;
	TcxTrackBarThumbType FThumbType;
	bool FShowTrack;
	Graphics::TColor FTickColor;
	TcxTrackBarTickType FTickType;
	TcxTrackBarTickMarks FTickMarks;
	Cxexteditconsts::TcxNaturalNumber FTickSize;
	Graphics::TColor FTrackColor;
	int FTrackSize;
	#pragma pack(push, 1)
	Types::TRect FTrackRect;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect FThumbRect;
	#pragma pack(pop)
	
	int FThumbHeight;
	int FThumbWidth;
	Graphics::TColor FThumbColor;
	Graphics::TColor FThumbHighlightColor;
	TcxTrackBarThumbStep FThumbStep;
	int FThumbSize;
	double FTickOffset;
	Classes::TNotifyEvent FOnChange;
	TcxGetThumbRectEvent FOnGetThumbRect;
	TcxDrawThumbEvent FOnDrawThumb;
	void __fastcall SetAutoSize(bool Value);
	void __fastcall SetBorderWidth(int Value);
	void __fastcall SetFrequency(int Value);
	void __fastcall SetMin(int Value);
	void __fastcall SetMax(int Value);
	void __fastcall SetOrientation(TcxTrackBarOrientation Value);
	void __fastcall SetTextOrientation(TcxTrackBarTextOrientation Value);
	void __fastcall SetPageSize(Cxexteditconsts::TcxNaturalNumber Value);
	void __fastcall SetSelectionStart(int Value);
	void __fastcall SetSelectionEnd(int Value);
	void __fastcall SetSelectionColor(Graphics::TColor Value);
	void __fastcall SetShowTicks(bool Value);
	void __fastcall SetThumbType(TcxTrackBarThumbType Value);
	void __fastcall SetShowTrack(bool Value);
	void __fastcall SetTickColor(Graphics::TColor Value);
	void __fastcall SetTickType(TcxTrackBarTickType Value);
	void __fastcall SetTickMarks(TcxTrackBarTickMarks Value);
	void __fastcall SetTickSize(Cxexteditconsts::TcxNaturalNumber Value);
	void __fastcall SetTrackColor(Graphics::TColor Value);
	void __fastcall SetTrackSize(int Value);
	void __fastcall SetThumbHeight(int Value);
	void __fastcall SetThumbWidth(int Value);
	void __fastcall SetThumbColor(Graphics::TColor Value);
	void __fastcall SetThumbHighlightColor(Graphics::TColor Value);
	void __fastcall DoDrawThumb(System::TObject* Sender, Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ARect);
	
protected:
	virtual bool __fastcall CompareEditValue(void);
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewDataClass(TMetaClass* vmt);
	virtual bool __fastcall HasDisplayValue(void);
	virtual int __fastcall FixPosition(const int APosition);
	virtual void __fastcall ThumbChanged(void);
	int __fastcall EditValueToPosition(const Variant &AEditValue);
	__property TcxTrackBarMouseStates MouseStates = {read=FMouseStates, nodefault};
	__property bool AutoSize = {read=FAutoSize, write=SetAutoSize, default=1};
	__property int BorderWidth = {read=FBorderWidth, write=SetBorderWidth, default=0};
	__property int Frequency = {read=FFrequency, write=SetFrequency, default=1};
	__property int Min = {read=FMin, write=SetMin, default=0};
	__property int Max = {read=FMax, write=SetMax, default=10};
	__property TcxTrackBarOrientation Orientation = {read=FOrientation, write=SetOrientation, default=0};
	__property TcxTrackBarTextOrientation TextOrientation = {read=FTextOrientation, write=SetTextOrientation, default=0};
	__property Cxexteditconsts::TcxNaturalNumber PageSize = {read=FPageSize, write=SetPageSize, default=1};
	__property int SelectionStart = {read=FSelectionStart, write=SetSelectionStart, default=0};
	__property int SelectionEnd = {read=FSelectionEnd, write=SetSelectionEnd, default=0};
	__property Graphics::TColor SelectionColor = {read=FSelectionColor, write=SetSelectionColor, default=-2147483635};
	__property bool ShowTicks = {read=FShowTicks, write=SetShowTicks, default=1};
	__property TcxTrackBarThumbType ThumbType = {read=FThumbType, write=SetThumbType, default=1};
	__property bool ShowTrack = {read=FShowTrack, write=SetShowTrack, default=1};
	__property Graphics::TColor TickColor = {read=FTickColor, write=SetTickColor, default=-2147483640};
	__property TcxTrackBarTickType TickType = {read=FTickType, write=SetTickType, default=0};
	__property TcxTrackBarTickMarks TickMarks = {read=FTickMarks, write=SetTickMarks, default=2};
	__property Cxexteditconsts::TcxNaturalNumber TickSize = {read=FTickSize, write=SetTickSize, default=3};
	__property Graphics::TColor TrackColor = {read=FTrackColor, write=SetTrackColor, default=-2147483643};
	__property int TrackSize = {read=FTrackSize, write=SetTrackSize, default=5};
	__property int ThumbHeight = {read=FThumbHeight, write=SetThumbHeight, default=12};
	__property int ThumbWidth = {read=FThumbWidth, write=SetThumbWidth, default=7};
	__property Graphics::TColor ThumbColor = {read=FThumbColor, write=SetThumbColor, default=-2147483633};
	__property Graphics::TColor ThumbHighlightColor = {read=FThumbHighlightColor, write=SetThumbHighlightColor, default=12632256};
	__property TcxTrackBarThumbStep ThumbStep = {read=FThumbStep, write=FThumbStep, default=0};
	__property Classes::TNotifyEvent OnChange = {read=FOnChange, write=FOnChange};
	__property TcxGetThumbRectEvent OnGetThumbRect = {read=FOnGetThumbRect, write=FOnGetThumbRect};
	__property TcxDrawThumbEvent OnDrawThumb = {read=FOnDrawThumb, write=FOnDrawThumb};
	
public:
	__fastcall virtual TcxCustomTrackBarProperties(Classes::TPersistent* AOwner);
	__fastcall virtual ~TcxCustomTrackBarProperties(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	/* virtual class method */ virtual TMetaClass* __fastcall GetContainerClass(TMetaClass* vmt);
	virtual WideString __fastcall GetDisplayText(const Variant &AEditValue, bool AFullText = false);
	/* virtual class method */ virtual TMetaClass* __fastcall GetStyleClass(TMetaClass* vmt);
	virtual Cxedit::TcxEditSupportedOperations __fastcall GetSupportedOperations(void);
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewInfoClass(TMetaClass* vmt);
	virtual bool __fastcall IsEditValueValid(Variant &EditValue, bool AEditFocused);
	virtual void __fastcall PrepareDisplayValue(const Variant &AEditValue, Variant &DisplayValue, bool AEditFocused);
};


class DELPHICLASS TcxTrackBarProperties;
class PASCALIMPLEMENTATION TcxTrackBarProperties : public TcxCustomTrackBarProperties 
{
	typedef TcxCustomTrackBarProperties inherited;
	
__published:
	__property AutoSize  = {default=1};
	__property BorderWidth  = {default=0};
	__property Frequency  = {default=1};
	__property Min  = {default=0};
	__property Max  = {default=10};
	__property Orientation  = {default=0};
	__property TextOrientation  = {default=0};
	__property PageSize  = {default=1};
	__property SelectionStart  = {default=0};
	__property SelectionEnd  = {default=0};
	__property SelectionColor  = {default=-2147483635};
	__property ShowTicks  = {default=1};
	__property ThumbType  = {default=1};
	__property ShowTrack  = {default=1};
	__property TickColor  = {default=-2147483640};
	__property TickType  = {default=0};
	__property TickMarks  = {default=2};
	__property TickSize  = {default=3};
	__property TrackColor  = {default=-2147483643};
	__property TrackSize  = {default=5};
	__property ThumbHeight  = {default=12};
	__property ThumbWidth  = {default=7};
	__property ThumbColor  = {default=-2147483633};
	__property ThumbHighlightColor  = {default=12632256};
	__property ThumbStep  = {default=0};
	__property OnChange ;
	__property OnGetThumbRect ;
	__property OnDrawThumb ;
public:
	#pragma option push -w-inl
	/* TcxCustomTrackBarProperties.Create */ inline __fastcall virtual TcxTrackBarProperties(Classes::TPersistent* AOwner) : TcxCustomTrackBarProperties(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomTrackBarProperties.Destroy */ inline __fastcall virtual ~TcxTrackBarProperties(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomTrackBar;
class PASCALIMPLEMENTATION TcxCustomTrackBar : public Cxedit::TcxCustomEdit 
{
	typedef Cxedit::TcxCustomEdit inherited;
	
private:
	int FStartSelectionPosition;
	TcxTrackBarSlideState FSlideState;
	void __fastcall SetNewSelectionPosition(const int ANewPosition);
	int __fastcall GetPosition(void);
	void __fastcall SetPosition(int Value);
	HIDESBASE TcxTrackBarProperties* __fastcall GetProperties(void);
	HIDESBASE TcxCustomTrackBarViewInfo* __fastcall GetViewInfo(void);
	HIDESBASE void __fastcall SetProperties(TcxTrackBarProperties* Value);
	HIDESBASE MESSAGE void __fastcall WMLButtonUp(Messages::TWMMouse &Message);
	HIDESBASE MESSAGE void __fastcall WMGetDlgCode(Messages::TWMNoParams &Message);
	HIDESBASE MESSAGE void __fastcall WMEraseBkgnd(Messages::TWMEraseBkgnd &Message);
	
protected:
	virtual bool __fastcall CanResize(int &NewWidth, int &NewHeight);
	DYNAMIC void __fastcall KeyDown(Word &Key, Classes::TShiftState Shift);
	DYNAMIC void __fastcall KeyUp(Word &Key, Classes::TShiftState Shift);
	DYNAMIC void __fastcall MouseEnter(Controls::TControl* AControl);
	DYNAMIC void __fastcall MouseLeave(Controls::TControl* AControl);
	DYNAMIC void __fastcall MouseDown(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseUp(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseMove(Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall FillSizeProperties(Cxedit::TcxEditSizeProperties &AEditSizeProperties);
	virtual void __fastcall InternalSetEditValue(const Variant &Value, bool AValidateEditValue);
	virtual void __fastcall SynchronizeDisplayValue(void);
	virtual void __fastcall PropertiesChanged(System::TObject* Sender);
	__property TcxTrackBarProperties* Properties = {read=GetProperties, write=SetProperties};
	__property TcxCustomTrackBarViewInfo* ViewInfo = {read=GetViewInfo};
	__property int Position = {read=GetPosition, write=SetPosition, default=0};
	virtual bool __fastcall CanFocusOnClick(void);
	
public:
	__fastcall virtual TcxCustomTrackBar(Classes::TComponent* AOwner)/* overload */;
	/* virtual class method */ virtual TMetaClass* __fastcall GetPropertiesClass(TMetaClass* vmt);
	DYNAMIC bool __fastcall CanFocus(void);
public:
	#pragma option push -w-inl
	/* TcxCustomEdit.Destroy */ inline __fastcall virtual ~TcxCustomTrackBar(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomTrackBar(HWND ParentWindow) : Cxedit::TcxCustomEdit(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxTrackBar;
class PASCALIMPLEMENTATION TcxTrackBar : public TcxCustomTrackBar 
{
	typedef TcxCustomTrackBar inherited;
	
__published:
	__property Position  = {default=0};
	__property Anchors  = {default=3};
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
	/* TcxCustomTrackBar.Create */ inline __fastcall virtual TcxTrackBar(Classes::TComponent* AOwner)/* overload */ : TcxCustomTrackBar(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomEdit.Destroy */ inline __fastcall virtual ~TcxTrackBar(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxTrackBar(HWND ParentWindow) : TcxCustomTrackBar(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxtrackbar */
using namespace Cxtrackbar;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxTrackBar
