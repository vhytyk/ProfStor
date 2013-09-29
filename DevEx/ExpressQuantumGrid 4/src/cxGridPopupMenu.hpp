// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxGridPopupMenu.pas' rev: 6.00

#ifndef cxGridPopupMenuHPP
#define cxGridPopupMenuHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxGridCustomPopupMenu.hpp>	// Pascal unit
#include <cxGridUICardHelper.hpp>	// Pascal unit
#include <cxGridUIBandedTableHelper.hpp>	// Pascal unit
#include <cxGridUITableHelper.hpp>	// Pascal unit
#include <cxGridUICustomTableHelper.hpp>	// Pascal unit
#include <cxGridUIHelper.hpp>	// Pascal unit
#include <cxGridTableView.hpp>	// Pascal unit
#include <cxGridCustomView.hpp>	// Pascal unit
#include <cxGrid.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Types.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxgridpopupmenu
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxGridPopupMenu;
class PASCALIMPLEMENTATION TcxGridPopupMenu : public Cxgridcustompopupmenu::TcxCustomGridPopupMenu 
{
	typedef Cxgridcustompopupmenu::TcxCustomGridPopupMenu inherited;
	
private:
	bool FAlwaysFireOnPopup;
	Cxgrid::TcxGrid* FGrid;
	Cxgridcustompopupmenu::TcxGridDefaultPopupMenu* FGridDefaultPopupMenu;
	Cxgriduihelper::TcxGridOperationHelper* FGridOperationHelper;
	Cxgridcustomview::TcxCustomGridView* FHitGridView;
	#pragma pack(push, 1)
	Types::TPoint FHitPoint;
	#pragma pack(pop)
	
	Cxgridcustomview::TcxCustomGridHitTest* FHitTest;
	Cxgridcustompopupmenu::TcxGridViewHitType FHitType;
	Cxgrid::TcxCustomGridNotification* FMouseupNotification;
	Cxgridcustompopupmenu::TcxGridPopupMenuItemClickProc FOnClick;
	Cxgridcustompopupmenu::TcxGridBeforePopupProc FOnPopup;
	bool FUseBuiltInPopupMenus;
	Cxgridcustompopupmenu::TcxPopupMenuInfos* __fastcall GetPopupMenus(void);
	void __fastcall CreateBuiltInPopupMenus(void);
	void __fastcall FreeBuiltInPopupMenus(void);
	void __fastcall SetUseBuiltInPopupMenus(const bool Value);
	void __fastcall SetGrid(const Cxgrid::TcxGrid* AValue);
	void __fastcall SetPopupMenus(const Cxgridcustompopupmenu::TcxPopupMenuInfos* AValue);
	
protected:
	virtual bool __fastcall DoOnPopup(Classes::TComponent* ASenderMenu, Cxgridcustomview::TcxCustomGridHitTest* AHitTest, int X, int Y);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	virtual bool __fastcall DoPopup(void);
	virtual Cxgridcustompopupmenu::TcxPopupMenuInfo* __fastcall GetPopupMenuInfo(const Classes::TComponent* AMenu, const Cxgridcustomview::TcxCustomGridView* AView, bool SearchDefault = true);
	__property Cxgriduihelper::TcxGridOperationHelper* GridOperationHelper = {read=FGridOperationHelper};
	
public:
	__fastcall virtual TcxGridPopupMenu(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxGridPopupMenu(void);
	virtual bool __fastcall CheckShortCuts(Cxgridcustompopupmenu::PWMKeyDown Message);
	Classes::TComponent* __fastcall GetBuiltInPopupMenuByClass(const TMetaClass* AMenuClass);
	virtual void __fastcall RegisterPopupMenu(const Classes::TComponent* AMenu, Cxgridcustompopupmenu::TcxGridViewHitTypes AHitTypes, Cxgridcustompopupmenu::TcxGridOnPopupProc ADoPopupProc, const Cxgridcustomview::TcxCustomGridView* AView)/* overload */;
	virtual void __fastcall RegisterPopupMenu(const Classes::TComponent* AMenu, Cxgridcustompopupmenu::TcxGridViewHitTypes AHitTypes, Cxgridcustompopupmenu::TcxGridOnPopupProc ADoPopupProc, TMetaClass* AViewClass)/* overload */;
	virtual void __fastcall UnregisterPopupMenu(const Classes::TComponent* AMenu, const Cxgridcustomview::TcxCustomGridView* AGridView, Cxgridcustompopupmenu::TcxGridViewHitTypes AHitTypes = System::Set<Cxgridcustompopupmenu::TcxGridViewHitType, gvhtGridNone, gvhtSeparator> () )/* overload */;
	virtual void __fastcall UnregisterPopupMenu(const Classes::TComponent* AMenu, TMetaClass* AGridViewClass, Cxgridcustompopupmenu::TcxGridViewHitTypes AHitTypes = System::Set<Cxgridcustompopupmenu::TcxGridViewHitType, gvhtGridNone, gvhtSeparator> () )/* overload */;
	__property Cxgridcustompopupmenu::TcxGridDefaultPopupMenu* BuiltInPopupMenus = {read=FGridDefaultPopupMenu};
	__property Cxgridcustomview::TcxCustomGridView* HitGridView = {read=FHitGridView};
	__property Types::TPoint HitPoint = {read=FHitPoint};
	__property Cxgridcustomview::TcxCustomGridHitTest* HitTest = {read=FHitTest};
	__property Cxgridcustompopupmenu::TcxGridViewHitType HitType = {read=FHitType, nodefault};
	
__published:
	__property Cxgrid::TcxGrid* Grid = {read=FGrid, write=SetGrid};
	__property Cxgridcustompopupmenu::TcxPopupMenuInfos* PopupMenus = {read=GetPopupMenus, write=SetPopupMenus};
	__property bool UseBuiltInPopupMenus = {read=FUseBuiltInPopupMenus, write=SetUseBuiltInPopupMenus, default=1};
	__property Cxgridcustompopupmenu::TcxGridPopupMenuItemClickProc OnMenuItemClick = {read=FOnClick, write=FOnClick};
	__property Cxgridcustompopupmenu::TcxGridBeforePopupProc OnPopup = {read=FOnPopup, write=FOnPopup};
	__property bool AlwaysFireOnPopup = {read=FAlwaysFireOnPopup, write=FAlwaysFireOnPopup, default=0};
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxgridpopupmenu */
using namespace Cxgridpopupmenu;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxGridPopupMenu
