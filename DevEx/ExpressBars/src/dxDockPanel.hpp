// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'dxDockPanel.pas' rev: 6.00

#ifndef dxDockPanelHPP
#define dxDockPanelHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <dxDockControl.hpp>	// Pascal unit
#include <dxDockConsts.hpp>	// Pascal unit
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

namespace Dxdockpanel
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TdxDockPanel;
class PASCALIMPLEMENTATION TdxDockPanel : public Dxdockcontrol::TdxCustomDockControl 
{
	typedef Dxdockcontrol::TdxCustomDockControl inherited;
	
protected:
	virtual void __fastcall SetParent(Controls::TWinControl* AParent);
	DYNAMIC void __fastcall ValidateInsert(Classes::TComponent* AComponent);
	virtual void __fastcall UpdateControlDockZones(Dxdockcontrol::TdxCustomDockControl* AControl, int AZoneWidth);
	virtual void __fastcall CreateLayout(Dxdockcontrol::TdxCustomDockControl* AControl, Dxdockcontrol::TdxDockingType AType, int Index);
	virtual bool __fastcall CanAcceptSideContainerItems(Dxdockcontrol::TdxSideContainerDockSite* AContainer);
	virtual bool __fastcall CanAcceptTabContainerItems(Dxdockcontrol::TdxTabContainerDockSite* AContainer);
	virtual bool __fastcall HasBorder(void);
	virtual bool __fastcall HasCaption(void);
	
public:
	__fastcall virtual TdxDockPanel(Classes::TComponent* AOwner);
	__fastcall virtual ~TdxDockPanel(void);
	virtual bool __fastcall CanActive(void);
	virtual bool __fastcall CanAutoHide(void);
	virtual bool __fastcall CanDock(void);
	virtual bool __fastcall CanDockHost(Dxdockcontrol::TdxCustomDockControl* AControl, Dxdockcontrol::TdxDockingType AType);
	virtual bool __fastcall CanMaximize(void);
	
__published:
	__property AllowDockClients  = {default=62};
	__property AllowFloating ;
	__property AllowDock  = {default=62};
	__property AutoHide ;
	__property Caption ;
	__property CaptionButtons  = {default=7};
	__property Dockable  = {default=1};
	__property ImageIndex  = {default=-1};
	__property ShowCaption  = {default=1};
	__property OnActivate ;
	__property OnAutoHideChanged ;
	__property OnAutoHideChanging ;
	__property OnCanResize ;
	__property OnClose ;
	__property OnCloseQuery ;
	__property OnCreateFloatSite ;
	__property OnCreateSideContainer ;
	__property OnCreateTabContainer ;
	__property OnCustomDrawDockingSelection ;
	__property OnCustomDrawResizingSelection ;
	__property OnDock ;
	__property OnDocking ;
	__property OnEndDocking ;
	__property OnEndResizing ;
	__property OnGetAutoHidePosition ;
	__property OnLayoutChanged ;
	__property OnMakeFloating ;
	__property OnResize ;
	__property OnResizing ;
	__property OnRestoreDockPosition ;
	__property OnStartDocking ;
	__property OnStartResizing ;
	__property OnStoreDockPosition ;
	__property OnUnDock ;
	__property OnUpdateDockZones ;
	__property OnUpdateResizeZones ;
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TdxDockPanel(HWND ParentWindow) : Dxdockcontrol::TdxCustomDockControl(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Dxdockpanel */
using namespace Dxdockpanel;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// dxDockPanel
