// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxButtons.pas' rev: 6.00

#ifndef cxButtonsHPP
#define cxButtonsHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxControls.hpp>	// Pascal unit
#include <Buttons.hpp>	// Pascal unit
#include <cxLookAndFeelPainters.hpp>	// Pascal unit
#include <cxLookAndFeels.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Types.hpp>	// Pascal unit
#include <dxThemeManager.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxbuttons
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TcxButtonKind { cxbkStandard, cxbkDropDown, cxbkDropDownButton };
#pragma option pop

typedef Set<Cxlookandfeelpainters::TcxButtonState, cxbsDefault, cxbsDisabled>  TcxButtonAssignedColors;

class DELPHICLASS TcxCustomButton;
typedef void __fastcall (__closure *TcxButtonGetDrawParamsEvent)(TcxCustomButton* Sender, Cxlookandfeelpainters::TcxButtonState AState, Graphics::TColor &AColor, Graphics::TFont* AFont);

class DELPHICLASS TcxButtonColors;
class PASCALIMPLEMENTATION TcxButtonColors : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	TcxCustomButton* FButton;
	TcxButtonAssignedColors FAssignedColors;
	Graphics::TColor FColors[5];
	Graphics::TColor __fastcall GetColor(const int Index);
	bool __fastcall IsStored(const int Index);
	void __fastcall SetAssignedColors(TcxButtonAssignedColors Value);
	void __fastcall SetColor(const int Index, const Graphics::TColor Value);
	
public:
	__fastcall TcxButtonColors(TcxCustomButton* AOwner);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	
__published:
	__property TcxButtonAssignedColors AssignedColors = {read=FAssignedColors, write=SetAssignedColors, stored=false, nodefault};
	__property Graphics::TColor Default = {read=GetColor, write=SetColor, stored=IsStored, index=0, nodefault};
	__property Graphics::TColor Normal = {read=GetColor, write=SetColor, stored=IsStored, index=1, nodefault};
	__property Graphics::TColor Hot = {read=GetColor, write=SetColor, stored=IsStored, index=2, nodefault};
	__property Graphics::TColor Pressed = {read=GetColor, write=SetColor, stored=IsStored, index=3, nodefault};
	__property Graphics::TColor Disabled = {read=GetColor, write=SetColor, stored=IsStored, index=4, nodefault};
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxButtonColors(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxCustomButton : public Stdctrls::TButton 
{
	typedef Stdctrls::TButton inherited;
	
private:
	bool FIsDown;
	bool FIsDefault;
	Cxgraphics::TcxCanvas* FCanvas;
	TcxButtonColors* FColors;
	Controls::TControlCanvas* FControlCanvas;
	bool FLockDown;
	Dxthememanager::TdxThemeChangedNotificator* FThemeChangedNotificator;
	bool FDoPopup;
	Menus::TPopupMenu* FDropDownMenu;
	bool FIsFocused;
	bool FIsMouseClick;
	TcxButtonKind FKind;
	Cxlookandfeels::TcxLookAndFeel* FLookAndFeel;
	bool FUseSystemPaint;
	void *FGlyph;
	Buttons::TButtonLayout FLayout;
	bool FModifiedGlyph;
	int FMargin;
	bool FMenuVisible;
	bool FMouseInControl;
	int FSpacing;
	TcxButtonGetDrawParamsEvent FOnGetDrawParams;
	void __fastcall ButtonMouseLeave(void);
	void __fastcall SetGlyph(Graphics::TBitmap* Value);
	Graphics::TBitmap* __fastcall GetGlyph(void);
	Buttons::TNumGlyphs __fastcall GetNumGlyphs(void);
	void __fastcall SetNumGlyphs(Buttons::TNumGlyphs Value);
	void __fastcall GlyphChanged(System::TObject* Sender);
	void __fastcall SetLayout(Buttons::TButtonLayout Value);
	void __fastcall SetSpacing(int Value);
	void __fastcall SetMargin(int Value);
	void __fastcall DrawItem(const tagDRAWITEMSTRUCT &DrawItemStruct);
	void __fastcall ThemeChanged(void);
	MESSAGE void __fastcall WMCaptureChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMLButtonDblClk(Messages::TWMMouse &Message);
	HIDESBASE MESSAGE void __fastcall WMLButtonDown(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMLButtonUp(Messages::TMessage &Message);
	MESSAGE void __fastcall CNDrawItem(Messages::TWMDrawItem &Message);
	MESSAGE void __fastcall CNMeasureItem(Messages::TWMMeasureItem &Message);
	MESSAGE void __fastcall CMCloseupPopupMenu(Messages::TMessage &Message);
	MESSAGE void __fastcall CMDropDownPopupMenu(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMFontChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMEnabledChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMMouseEnter(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMMouseLeave(Messages::TMessage &Message);
	void __fastcall DoDropDownMenu(void);
	void __fastcall InternalPaint(void);
	void __fastcall InternalRecreateWindow(void);
	bool __fastcall IsColorsStored(void);
	bool __fastcall IsHotTrack(void);
	void __fastcall LookAndFeelChanged(Cxlookandfeels::TcxLookAndFeel* Sender, Cxlookandfeels::TcxLookAndFeelValues AChangedValues);
	void __fastcall SetColors(const TcxButtonColors* Value);
	void __fastcall SetKind(const TcxButtonKind Value);
	void __fastcall SetLookAndFeel(Cxlookandfeels::TcxLookAndFeel* Value);
	void __fastcall SetUseSystemPaint(const bool Value);
	
protected:
	DYNAMIC void __fastcall ActionChange(System::TObject* Sender, bool CheckDefaults);
	virtual void __fastcall CreateHandle(void);
	virtual void __fastcall CreateParams(Controls::TCreateParams &Params);
	DYNAMIC HPALETTE __fastcall GetPalette(void);
	DYNAMIC void __fastcall MouseMove(Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall SetButtonStyle(bool ADefault);
	virtual TMetaClass* __fastcall GetPainterClass(void);
	DYNAMIC void __fastcall KeyDown(Word &Key, Classes::TShiftState Shift);
	DYNAMIC void __fastcall MouseDown(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	virtual bool __fastcall StandardButton(void);
	__property TcxButtonColors* Colors = {read=FColors, write=SetColors, stored=IsColorsStored};
	__property Menus::TPopupMenu* DropDownMenu = {read=FDropDownMenu, write=FDropDownMenu};
	__property Graphics::TBitmap* Glyph = {read=GetGlyph, write=SetGlyph};
	__property TcxButtonKind Kind = {read=FKind, write=SetKind, default=0};
	__property Buttons::TButtonLayout Layout = {read=FLayout, write=SetLayout, default=0};
	__property Cxlookandfeels::TcxLookAndFeel* LookAndFeel = {read=FLookAndFeel, write=SetLookAndFeel};
	__property int Margin = {read=FMargin, write=SetMargin, default=-1};
	__property Buttons::TNumGlyphs NumGlyphs = {read=GetNumGlyphs, write=SetNumGlyphs, default=1};
	__property int Spacing = {read=FSpacing, write=SetSpacing, default=4};
	__property bool UseSystemPaint = {read=FUseSystemPaint, write=SetUseSystemPaint, default=1};
	__property TcxButtonGetDrawParamsEvent OnGetDrawParams = {read=FOnGetDrawParams, write=FOnGetDrawParams};
	
public:
	__fastcall virtual TcxCustomButton(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxCustomButton(void);
	DYNAMIC void __fastcall Click(void);
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomButton(HWND ParentWindow) : Stdctrls::TButton(ParentWindow) { }
	#pragma option pop
	
private:
	void *__IcxMouseTrackingCaller;	/* Cxcontrols::IcxMouseTrackingCaller [MouseLeave=ButtonMouseLeave] */
	
public:
	operator IcxMouseTrackingCaller*(void) { return (IcxMouseTrackingCaller*)&__IcxMouseTrackingCaller; }
	
};


class DELPHICLASS TcxButton;
class PASCALIMPLEMENTATION TcxButton : public TcxCustomButton 
{
	typedef TcxCustomButton inherited;
	
__published:
	__property Action ;
	__property Anchors  = {default=3};
	__property BiDiMode ;
	__property Cancel  = {default=0};
	__property Caption ;
	__property Colors ;
	__property Constraints ;
	__property Default  = {default=0};
	__property DropDownMenu ;
	__property Enabled  = {default=1};
	__property Glyph ;
	__property Kind  = {default=0};
	__property Layout  = {default=0};
	__property LookAndFeel ;
	__property Margin  = {default=-1};
	__property ModalResult  = {default=0};
	__property NumGlyphs  = {default=1};
	__property ParentShowHint  = {default=1};
	__property ParentBiDiMode  = {default=1};
	__property ShowHint ;
	__property Spacing  = {default=4};
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=1};
	__property UseSystemPaint  = {default=1};
	__property Visible  = {default=1};
	__property OnEnter ;
	__property OnExit ;
	__property OnGetDrawParams ;
public:
	#pragma option push -w-inl
	/* TcxCustomButton.Create */ inline __fastcall virtual TcxButton(Classes::TComponent* AOwner) : TcxCustomButton(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomButton.Destroy */ inline __fastcall virtual ~TcxButton(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxButton(HWND ParentWindow) : TcxCustomButton(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
static const Word CM_DROPDOWNPOPUPMENU = 0x812c;
static const Word CM_CLOSEUPPOPUPMENU = 0x812d;

}	/* namespace Cxbuttons */
using namespace Cxbuttons;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxButtons
