// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxExtEditConsts.pas' rev: 6.00

#ifndef cxExtEditConstsHPP
#define cxExtEditConstsHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxContainer.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Variants.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxexteditconsts
{
//-- type declarations -------------------------------------------------------
typedef int TcxNaturalNumber;

typedef int TcxPositiveNumber;

class DELPHICLASS TcxExtContainerStyle;
class PASCALIMPLEMENTATION TcxExtContainerStyle : public Cxcontainer::TcxContainerStyle 
{
	typedef Cxcontainer::TcxContainerStyle inherited;
	
public:
	virtual void __fastcall RestoreDefaults(void);
public:
	#pragma option push -w-inl
	/* TcxContainerStyle.Create */ inline __fastcall virtual TcxExtContainerStyle(Classes::TPersistent* AOwner, bool ADirectAccessMode) : Cxcontainer::TcxContainerStyle(AOwner, ADirectAccessMode) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxContainerStyle.Destroy */ inline __fastcall virtual ~TcxExtContainerStyle(void) { }
	#pragma option pop
	
};


typedef AnsiString cxExtEditConsts__2[52];

typedef AnsiString cxExtEditConsts__3[16];

typedef AnsiString cxExtEditConsts__4[140];

typedef AnsiString cxExtEditConsts__5[140];

//-- var, const, procedure ---------------------------------------------------
extern PACKAGE System::ResourceString _scxSEditRepositoryColorComboBoxItem;
#define Cxexteditconsts_scxSEditRepositoryColorComboBoxItem System::LoadResourceString(&Cxexteditconsts::_scxSEditRepositoryColorComboBoxItem)
extern PACKAGE System::ResourceString _scxSEditRepositoryFontNameComboBoxItem;
#define Cxexteditconsts_scxSEditRepositoryFontNameComboBoxItem System::LoadResourceString(&Cxexteditconsts::_scxSEditRepositoryFontNameComboBoxItem)
extern PACKAGE System::ResourceString _scxSEditRepositoryLabelItem;
#define Cxexteditconsts_scxSEditRepositoryLabelItem System::LoadResourceString(&Cxexteditconsts::_scxSEditRepositoryLabelItem)
extern PACKAGE System::ResourceString _scxSEditRepositoryProgressBarItem;
#define Cxexteditconsts_scxSEditRepositoryProgressBarItem System::LoadResourceString(&Cxexteditconsts::_scxSEditRepositoryProgressBarItem)
extern PACKAGE System::ResourceString _scxSEditRepositoryTrackBarItem;
#define Cxexteditconsts_scxSEditRepositoryTrackBarItem System::LoadResourceString(&Cxexteditconsts::_scxSEditRepositoryTrackBarItem)
extern PACKAGE System::ResourceString _scxSEditRepositorySpinButtonItem;
#define Cxexteditconsts_scxSEditRepositorySpinButtonItem System::LoadResourceString(&Cxexteditconsts::_scxSEditRepositorySpinButtonItem)
extern PACKAGE System::ResourceString _scxSEditRepositoryCheckComboBox;
#define Cxexteditconsts_scxSEditRepositoryCheckComboBox System::LoadResourceString(&Cxexteditconsts::_scxSEditRepositoryCheckComboBox)
extern PACKAGE System::ResourceString _scxSEditRepositoryShellComboBoxItem;
#define Cxexteditconsts_scxSEditRepositoryShellComboBoxItem System::LoadResourceString(&Cxexteditconsts::_scxSEditRepositoryShellComboBoxItem)
extern PACKAGE System::ResourceString _scxUDAssociated;
#define Cxexteditconsts_scxUDAssociated System::LoadResourceString(&Cxexteditconsts::_scxUDAssociated)
extern PACKAGE System::ResourceString _scxHotZoneStyleMediaPlayer9;
#define Cxexteditconsts_scxHotZoneStyleMediaPlayer9 System::LoadResourceString(&Cxexteditconsts::_scxHotZoneStyleMediaPlayer9)
extern PACKAGE System::ResourceString _scxHotZoneStyleMediaPlayer8;
#define Cxexteditconsts_scxHotZoneStyleMediaPlayer8 System::LoadResourceString(&Cxexteditconsts::_scxHotZoneStyleMediaPlayer8)
extern PACKAGE System::ResourceString _scxHotZoneStyleXPTaskBar;
#define Cxexteditconsts_scxHotZoneStyleXPTaskBar System::LoadResourceString(&Cxexteditconsts::_scxHotZoneStyleXPTaskBar)
extern PACKAGE System::ResourceString _scxHotZoneStyleSimple;
#define Cxexteditconsts_scxHotZoneStyleSimple System::LoadResourceString(&Cxexteditconsts::_scxHotZoneStyleSimple)
extern PACKAGE Graphics::TColor cxDelphiColorValues[52];
extern PACKAGE AnsiString cxDelphiColorNames[52];
extern PACKAGE int cxHTML4ColorValues[16];
extern PACKAGE AnsiString cxHTML4ColorNames[16];
extern PACKAGE int cxX11ColorValues[140];
extern PACKAGE AnsiString cxX11ColorNames[140];
extern PACKAGE int cxX11OrderedColorValues[140];
extern PACKAGE AnsiString cxX11OrderedColorNames[140];

}	/* namespace Cxexteditconsts */
using namespace Cxexteditconsts;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxExtEditConsts
