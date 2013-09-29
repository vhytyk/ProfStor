// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxGridStdPopupMenu.pas' rev: 6.00

#ifndef cxGridStdPopupMenuHPP
#define cxGridStdPopupMenuHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <ImgList.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <cxGridCustomView.hpp>	// Pascal unit
#include <cxGridHeaderPopupMenuItems.hpp>	// Pascal unit
#include <cxGridFooterPopupMenuItems.hpp>	// Pascal unit
#include <cxGridCustomPopupMenu.hpp>	// Pascal unit
#include <cxGridMenuOperations.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxgridstdpopupmenu
{
//-- type declarations -------------------------------------------------------
typedef TMetaClass*TPopupMenuClass;

class DELPHICLASS TStdGridPopupMenu;
class PASCALIMPLEMENTATION TStdGridPopupMenu : public Menus::TPopupMenu 
{
	typedef Menus::TPopupMenu inherited;
	
private:
	void __fastcall InitItems(Menus::TMenuItem* AItems);
	
protected:
	void __fastcall ClearOperations(void);
	virtual void __fastcall CreateMenuItems(void);
	virtual void __fastcall DoPopup(System::TObject* Sender);
	virtual void __fastcall GridMenuPopup(Classes::TComponent* ASenderMenu, Cxgridcustomview::TcxCustomGridHitTest* AHitTest, int X, int Y);
	virtual Cxgridcustompopupmenu::TcxGridOnPopupProc __fastcall GetPopupHandler();
	
public:
	__fastcall virtual TStdGridPopupMenu(Classes::TComponent* AOwner);
	__fastcall virtual ~TStdGridPopupMenu(void);
private:
	void *__IDoPopup;	/* Cxgridcustompopupmenu::IDoPopup */
	
public:
	operator IDoPopup*(void) { return (IDoPopup*)&__IDoPopup; }
	
};


class DELPHICLASS TcxGridStdHeaderMenu;
class PASCALIMPLEMENTATION TcxGridStdHeaderMenu : public TStdGridPopupMenu 
{
	typedef TStdGridPopupMenu inherited;
	
public:
	#pragma option push -w-inl
	/* TStdGridPopupMenu.Create */ inline __fastcall virtual TcxGridStdHeaderMenu(Classes::TComponent* AOwner) : TStdGridPopupMenu(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TStdGridPopupMenu.Destroy */ inline __fastcall virtual ~TcxGridStdHeaderMenu(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridStdFooterMenu;
class PASCALIMPLEMENTATION TcxGridStdFooterMenu : public TStdGridPopupMenu 
{
	typedef TStdGridPopupMenu inherited;
	
public:
	#pragma option push -w-inl
	/* TStdGridPopupMenu.Create */ inline __fastcall virtual TcxGridStdFooterMenu(Classes::TComponent* AOwner) : TStdGridPopupMenu(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TStdGridPopupMenu.Destroy */ inline __fastcall virtual ~TcxGridStdFooterMenu(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxgridstdpopupmenu */
using namespace Cxgridstdpopupmenu;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxGridStdPopupMenu
