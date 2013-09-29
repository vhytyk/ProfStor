// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'dxNavBarConsts.pas' rev: 6.00

#ifndef dxNavBarConstsHPP
#define dxNavBarConstsHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Classes.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Dxnavbarconsts
{
//-- type declarations -------------------------------------------------------
typedef Classes::TIdentMapEntry dxNavBarConsts__1[3];

//-- var, const, procedure ---------------------------------------------------
static const Shortint dxNavBarDefaultLargeImageHeight = 0x20;
static const Shortint dxNavBarDefaultLargeImageWidth = 0x20;
static const Shortint dxNavBarDefaultSmallImageHeight = 0x10;
static const Shortint dxNavBarDefaultSmallImageWidth = 0x10;
static const Word dxNavBarScrollInterval = 0x12c;
static const Word dxNavBarHintShowingInterval = 0x3e8;
static const short dxNavBarDragCursor = 0xfffffba0;
static const short dxNavBarDragCopyCursor = 0xfffffba1;
static const short dxNavBarLinksCursor = 0xfffffba2;
extern PACKAGE Classes::TIdentMapEntry dxNavBarCursors[3];
extern PACKAGE System::ResourceString _sdxInvalideGroupControl;
#define Dxnavbarconsts_sdxInvalideGroupControl System::LoadResourceString(&Dxnavbarconsts::_sdxInvalideGroupControl)

}	/* namespace Dxnavbarconsts */
using namespace Dxnavbarconsts;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// dxNavBarConsts
