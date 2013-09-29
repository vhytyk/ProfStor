// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'dxDockControlXPView.pas' rev: 6.00

#ifndef dxDockControlXPViewHPP
#define dxDockControlXPViewHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <dxThemeConsts.hpp>	// Pascal unit
#include <dxThemeManager.hpp>	// Pascal unit
#include <dxUxTheme.hpp>	// Pascal unit
#include <dxDockControl.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Dxdockcontrolxpview
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TdxDockControlXPPainter;
class PASCALIMPLEMENTATION TdxDockControlXPPainter : public Dxdockcontrol::TdxDockControlPainter 
{
	typedef Dxdockcontrol::TdxDockControlPainter inherited;
	
public:
	virtual bool __fastcall CanVerticalCaption(void);
	virtual int __fastcall GetCaptionButtonSize(void);
	virtual int __fastcall GetCaptionHeight(void);
	virtual void __fastcall DrawBorder(Graphics::TCanvas* ACanvas, const Types::TRect &ARect);
	virtual void __fastcall DrawCaption(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool IsActive);
	virtual void __fastcall DrawCaptionText(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool IsActive);
	virtual void __fastcall DrawCaptionCloseButton(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool IsActive, bool IsDown, bool IsHot, bool IsSwitched);
	virtual void __fastcall DrawCaptionHideButton(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool IsActive, bool IsDown, bool IsHot, bool IsSwitched);
	virtual void __fastcall DrawCaptionMaximizeButton(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool IsActive, bool IsDown, bool IsHot, bool IsSwitched);
	virtual void __fastcall DrawClient(Graphics::TCanvas* ACanvas, const Types::TRect &ARect);
	virtual void __fastcall DrawTabs(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const Types::TRect &AActiveTabRect);
	virtual void __fastcall DrawTab(Graphics::TCanvas* ACanvas, Dxdockcontrol::TdxCustomDockControl* AControl, const Types::TRect &ARect, bool IsActive);
	virtual void __fastcall DrawTabsNextTabButton(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool IsDown, bool IsHot, bool IsEnable);
	virtual void __fastcall DrawTabsPrevTabButton(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool IsDown, bool IsHot, bool IsEnable);
	virtual void __fastcall DrawHideBar(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, Dxdockcontrol::TdxAutoHidePosition APosition);
	virtual void __fastcall DrawHideBarButton(Graphics::TCanvas* ACanvas, Dxdockcontrol::TdxCustomDockControl* AControl, const Types::TRect &ARect, Dxdockcontrol::TdxAutoHidePosition APosition);
public:
	#pragma option push -w-inl
	/* TdxDockControlPainter.Create */ inline __fastcall TdxDockControlXPPainter(Dxdockcontrol::TdxCustomDockControl* ADockControl) : Dxdockcontrol::TdxDockControlPainter(ADockControl) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxDockControlXPPainter(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Dxdockcontrolxpview */
using namespace Dxdockcontrolxpview;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// dxDockControlXPView
