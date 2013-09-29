// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'dxDockControlOfficeView.pas' rev: 6.00

#ifndef dxDockControlOfficeViewHPP
#define dxDockControlOfficeViewHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <dxDockControlNETView.hpp>	// Pascal unit
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

namespace Dxdockcontrolofficeview
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TdxDockControlOfficePainter;
class PASCALIMPLEMENTATION TdxDockControlOfficePainter : public Dxdockcontrolnetview::TdxDockControlNETPainter 
{
	typedef Dxdockcontrolnetview::TdxDockControlNETPainter inherited;
	
protected:
	/* virtual class method */ virtual void __fastcall CreateColors(TMetaClass* vmt);
	/* virtual class method */ virtual void __fastcall RefreshColors(TMetaClass* vmt);
	/* virtual class method */ virtual void __fastcall ReleaseColors(TMetaClass* vmt);
	virtual Graphics::TColor __fastcall GetBorderColor(void);
	virtual Graphics::TColor __fastcall GetCaptionColor(bool IsActive);
	virtual Graphics::TColor __fastcall GetCaptionFontColor(bool IsActive);
	virtual Graphics::TColor __fastcall GetCaptionSignColor(bool IsActive, bool IsDown, bool IsHot);
	virtual Graphics::TColor __fastcall GetTabsScrollButtonsColor(void);
	virtual Graphics::TColor __fastcall GetTabsScrollButtonsSignColor(bool IsEnable);
	
public:
	virtual void __fastcall DrawBorder(Graphics::TCanvas* ACanvas, const Types::TRect &ARect);
	virtual void __fastcall DrawCaptionButtonSelection(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool IsActive, bool IsDown, bool IsHot);
	virtual void __fastcall DrawCaptionMaximizeButton(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool IsActive, bool IsDown, bool IsHot, bool IsSwitched);
	virtual void __fastcall DrawClient(Graphics::TCanvas* ACanvas, const Types::TRect &ARect);
	virtual void __fastcall DrawTabs(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const Types::TRect &AActiveTabRect);
	virtual void __fastcall DrawTab(Graphics::TCanvas* ACanvas, Dxdockcontrol::TdxCustomDockControl* AControl, const Types::TRect &ARect, bool IsActive);
	virtual void __fastcall DrawHideBar(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, Dxdockcontrol::TdxAutoHidePosition APosition);
	virtual void __fastcall DrawHideBarButton(Graphics::TCanvas* ACanvas, Dxdockcontrol::TdxCustomDockControl* AControl, const Types::TRect &ARect, Dxdockcontrol::TdxAutoHidePosition APosition);
public:
	#pragma option push -w-inl
	/* TdxDockControlPainter.Create */ inline __fastcall TdxDockControlOfficePainter(Dxdockcontrol::TdxCustomDockControl* ADockControl) : Dxdockcontrolnetview::TdxDockControlNETPainter(ADockControl) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxDockControlOfficePainter(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Dxdockcontrolofficeview */
using namespace Dxdockcontrolofficeview;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// dxDockControlOfficeView
