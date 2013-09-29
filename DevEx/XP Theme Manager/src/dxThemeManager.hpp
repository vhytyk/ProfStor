// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'dxThemeManager.pas' rev: 6.00

#ifndef dxThemeManagerHPP
#define dxThemeManagerHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <dxUxTheme.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Dxthememanager
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TdxThemedObjectType { totButton, totClock, totComboBox, totEdit, totExplorerBar, totHeader, totListView, totMenu, totPage, totProgress, totRebar, totScrollBar, totSpin, totStartPanel, totStatus, totTab, totTaskBand, totTaskBar, totToolBar, totToolTip, totTrackBar, totTrayNotify, totTreeview, totWindow };
#pragma option pop

typedef Set<TdxThemedObjectType, totButton, totWindow>  TdxThemedObjectTypes;

typedef void __fastcall (__closure *TdxThemeChangedEvent)(void);

class DELPHICLASS TdxThemeChangedNotificator;
class PASCALIMPLEMENTATION TdxThemeChangedNotificator : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	TdxThemeChangedEvent FOnThemeChanged;
	
public:
	__fastcall TdxThemeChangedNotificator(void);
	__fastcall virtual ~TdxThemeChangedNotificator(void);
	__property TdxThemeChangedEvent OnThemeChanged = {read=FOnThemeChanged, write=FOnThemeChanged};
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE bool __fastcall AreVisualStylesAvailable(TdxThemedObjectTypes ANeededThemedObjectTypes = System::Set<TdxThemedObjectType, totButton, totWindow> () );
extern PACKAGE unsigned __fastcall OpenTheme(TdxThemedObjectType AThemedObjectType, wchar_t * APClassNameList = (void *)(0x0));
extern PACKAGE void __fastcall CloseAllThemes(void);
extern PACKAGE HRESULT __fastcall CloseTheme(TdxThemedObjectType AThemedObjectType);

}	/* namespace Dxthememanager */
using namespace Dxthememanager;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// dxThemeManager
