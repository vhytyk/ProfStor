// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxScrollBar.pas' rev: 6.00

#ifndef cxScrollBarHPP
#define cxScrollBarHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Menus.hpp>	// Pascal unit
#include <cxLookAndFeelPainters.hpp>	// Pascal unit
#include <cxLookAndFeels.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Types.hpp>	// Pascal unit
#include <dxThemeManager.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxscrollbar
{
//-- type declarations -------------------------------------------------------
#pragma pack(push, 1)
struct TcxScrollBarState
{
	Cxlookandfeelpainters::TcxScrollBarPart PressedPart;
	Cxlookandfeelpainters::TcxScrollBarPart HotPart;
} ;
#pragma pack(pop)

class DELPHICLASS TcxScrollBar;
class PASCALIMPLEMENTATION TcxScrollBar : public Controls::TCustomControl 
{
	typedef Controls::TCustomControl inherited;
	
private:
	Graphics::TBitmap* FBitmap;
	#pragma pack(push, 1)
	TcxScrollBarState FState;
	#pragma pack(pop)
	
	Extctrls::TTimer* FTimer;
	Cxgraphics::TcxCanvas* FCanvas;
	Cxlookandfeels::TcxLookAndFeel* FLookAndFeel;
	Dxthememanager::TdxThemeChangedNotificator* FThemeChangedNotificator;
	int FThumbnailSize;
	#pragma pack(push, 1)
	Types::TRect FTopLeftArrow;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect FBottomRightArrow;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect FThumbnail;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect FPageUp;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect FPageDown;
	#pragma pack(pop)
	
	Forms::TScrollBarKind FKind;
	int FPosition;
	int FSavePosition;
	#pragma pack(push, 1)
	Types::TPoint FSaveThumbnailPos;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TPoint FDownMousePos;
	#pragma pack(pop)
	
	int FMin;
	int FMax;
	int FPageSize;
	Forms::TScrollBarInc FSmallChange;
	Forms::TScrollBarInc FLargeChange;
	bool FUnlimitedTracking;
	Classes::TNotifyEvent FOnChange;
	Stdctrls::TScrollEvent FOnScroll;
	void __fastcall AdjustPagesRects(void);
	void __fastcall CalcMinThumnailSize(void);
	void __fastcall CalculateRects(void);
	void __fastcall CalculateThumbnailRect(void);
	void __fastcall CancelScroll(void);
	void __fastcall DoScroll(Cxlookandfeelpainters::TcxScrollBarPart APart);
	int __fastcall GetPositionFromThumbnail(void);
	Cxlookandfeelpainters::TcxScrollBarPart __fastcall GetScrollBarPart(const Types::TPoint &P);
	void __fastcall InternalScroll(Stdctrls::TScrollCode AScrollCode);
	void __fastcall OnTimer(System::TObject* Sender);
	void __fastcall SetKind(Forms::TScrollBarKind Value);
	void __fastcall SetLookAndFeel(Cxlookandfeels::TcxLookAndFeel* Value);
	void __fastcall SetMax(int Value);
	void __fastcall SetMin(int Value);
	void __fastcall SetPageSize(int Value);
	void __fastcall SetPosition(int Value);
	void __fastcall ThemeChanged(void);
	HIDESBASE MESSAGE void __fastcall CMEnabledChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMMouseEnter(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMMouseLeave(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMSysColorChange(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMVisibleChanged(Messages::TMessage &Message);
	MESSAGE void __fastcall CNHScroll(Messages::TWMScroll &Message);
	MESSAGE void __fastcall CNVScroll(Messages::TWMScroll &Message);
	MESSAGE void __fastcall CNCtlColorScrollBar(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMCancelMode(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMEraseBkgnd(Messages::TWMEraseBkgnd &Message);
	
protected:
	virtual void __fastcall Change(void);
	void __fastcall LookAndFeelChanged(Cxlookandfeels::TcxLookAndFeel* Sender, Cxlookandfeels::TcxLookAndFeelValues AChangedValues);
	DYNAMIC void __fastcall MouseDown(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseEnter(Controls::TControl* AControl);
	DYNAMIC void __fastcall MouseLeave(Controls::TControl* AControl);
	DYNAMIC void __fastcall MouseMove(Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseUp(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall Paint(void);
	virtual void __fastcall Scroll(Stdctrls::TScrollCode ScrollCode, int &ScrollPos);
	
public:
	__fastcall virtual TcxScrollBar(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxScrollBar(void);
	virtual void __fastcall SetBounds(int ALeft, int ATop, int AWidth, int AHeight);
	void __fastcall SetScrollParams(int AMin, int AMax, int APosition, int APageSize, bool ARedraw = true);
	void __fastcall SetParams(int APosition, int AMin, int AMax);
	
__published:
	__property Align  = {default=0};
	__property Anchors  = {default=3};
	__property Constraints ;
	__property Ctl3D ;
	__property DragCursor  = {default=-12};
	__property DragKind  = {default=0};
	__property DragMode  = {default=0};
	__property Enabled  = {default=1};
	__property Forms::TScrollBarKind Kind = {read=FKind, write=SetKind, default=0};
	__property Forms::TScrollBarInc LargeChange = {read=FLargeChange, write=FLargeChange, default=1};
	__property Cxlookandfeels::TcxLookAndFeel* LookAndFeel = {read=FLookAndFeel, write=SetLookAndFeel};
	__property int Max = {read=FMax, write=SetMax, default=100};
	__property int Min = {read=FMin, write=SetMin, default=0};
	__property int PageSize = {read=FPageSize, write=SetPageSize, nodefault};
	__property ParentCtl3D  = {default=1};
	__property ParentShowHint  = {default=1};
	__property PopupMenu ;
	__property int Position = {read=FPosition, write=SetPosition, default=0};
	__property ShowHint ;
	__property Forms::TScrollBarInc SmallChange = {read=FSmallChange, write=FSmallChange, default=1};
	__property bool UnlimitedTracking = {read=FUnlimitedTracking, write=FUnlimitedTracking, default=0};
	__property Visible  = {default=1};
	__property OnContextPopup ;
	__property Classes::TNotifyEvent OnChange = {read=FOnChange, write=FOnChange};
	__property OnDragDrop ;
	__property OnDragOver ;
	__property OnEndDock ;
	__property OnEndDrag ;
	__property OnEnter ;
	__property OnExit ;
	__property OnKeyDown ;
	__property OnKeyPress ;
	__property OnKeyUp ;
	__property Stdctrls::TScrollEvent OnScroll = {read=FOnScroll, write=FOnScroll};
	__property OnStartDock ;
	__property OnStartDrag ;
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxScrollBar(HWND ParentWindow) : Controls::TCustomControl(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE tagSIZE __fastcall GetScrollBarSize();

}	/* namespace Cxscrollbar */
using namespace Cxscrollbar;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxScrollBar
