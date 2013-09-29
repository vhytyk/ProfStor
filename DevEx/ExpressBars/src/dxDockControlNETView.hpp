// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'dxDockControlNETView.pas' rev: 6.00

#ifndef dxDockControlNETViewHPP
#define dxDockControlNETViewHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <dxDockPanel.hpp>	// Pascal unit
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

namespace Dxdockcontrolnetview
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TdxDockControlNETPainter;
class PASCALIMPLEMENTATION TdxDockControlNETPainter : public Dxdockcontrol::TdxDockControlPainter 
{
	typedef Dxdockcontrol::TdxDockControlPainter inherited;
	
protected:
	/* virtual class method */ virtual void __fastcall AssignDefaultFont(TMetaClass* vmt);
	virtual Graphics::TColor __fastcall GetNETBackColor(void);
	virtual Graphics::TColor __fastcall GetCaptionColor(bool IsActive);
	virtual Graphics::TColor __fastcall GetCaptionFontColor(bool IsActive);
	virtual Graphics::TColor __fastcall GetTabsColor(void);
	virtual Graphics::TColor __fastcall GetTabColor(bool IsActive);
	virtual Graphics::TColor __fastcall GetTabFontColor(bool IsActive);
	virtual Graphics::TColor __fastcall GetTabsScrollButtonsSignColor(bool IsEnable);
	virtual Graphics::TColor __fastcall GetHideBarColor(void);
	
public:
	virtual bool __fastcall CanVerticalCaption(void);
	virtual int __fastcall GetCaptionHeight(void);
	virtual int __fastcall GetCaptionVertInterval(void);
	virtual void __fastcall DrawBorder(Graphics::TCanvas* ACanvas, const Types::TRect &ARect);
	virtual void __fastcall DrawCaption(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool IsActive);
	virtual void __fastcall DrawCaptionText(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool IsActive);
	virtual void __fastcall DrawCaptionButtonSelection(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool IsActive, bool IsDown, bool IsHot);
	virtual void __fastcall DrawCaptionCloseButton(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool IsActive, bool IsDown, bool IsHot, bool IsSwitched);
	virtual void __fastcall DrawCaptionHideButton(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool IsActive, bool IsDown, bool IsHot, bool IsSwitched);
	virtual void __fastcall DrawCaptionMaximizeButton(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool IsActive, bool IsDown, bool IsHot, bool IsSwitched);
	virtual int __fastcall GetTabsHeight(void);
	virtual int __fastcall GetTabVertInterval(void);
	virtual void __fastcall DrawTabs(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const Types::TRect &AActiveTabRect);
	virtual void __fastcall DrawTab(Graphics::TCanvas* ACanvas, Dxdockcontrol::TdxCustomDockControl* AControl, const Types::TRect &ARect, bool IsActive);
	virtual void __fastcall DrawTabsNextTabButton(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool IsDown, bool IsHot, bool IsEnable);
	virtual void __fastcall DrawTabsPrevTabButton(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool IsDown, bool IsHot, bool IsEnable);
	virtual void __fastcall DrawTabsButtonSelection(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool IsDown, bool IsHot, bool IsEnable);
	virtual int __fastcall GetHideBarHeight(void);
	virtual int __fastcall GetHideBarWidth(void);
	virtual void __fastcall DrawHideBar(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, Dxdockcontrol::TdxAutoHidePosition APosition);
	virtual void __fastcall DrawHideBarButton(Graphics::TCanvas* ACanvas, Dxdockcontrol::TdxCustomDockControl* AControl, const Types::TRect &ARect, Dxdockcontrol::TdxAutoHidePosition APosition);
public:
	#pragma option push -w-inl
	/* TdxDockControlPainter.Create */ inline __fastcall TdxDockControlNETPainter(Dxdockcontrol::TdxCustomDockControl* ADockControl) : Dxdockcontrol::TdxDockControlPainter(ADockControl) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxDockControlNETPainter(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Dxdockcontrolnetview */
using namespace Dxdockcontrolnetview;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// dxDockControlNETView
