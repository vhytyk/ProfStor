// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxEditPaintUtils.pas' rev: 6.00

#ifndef cxEditPaintUtilsHPP
#define cxEditPaintUtilsHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxGraphics.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxeditpaintutils
{
//-- type declarations -------------------------------------------------------
typedef void __fastcall (__closure *TcxSystemPaletteChangedEvent)(void);

class DELPHICLASS TcxSystemPaletteChangedNotifier;
class PASCALIMPLEMENTATION TcxSystemPaletteChangedNotifier : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	TcxSystemPaletteChangedEvent FOnSystemPaletteChanged;
	
public:
	__fastcall TcxSystemPaletteChangedNotifier(void);
	__fastcall virtual ~TcxSystemPaletteChangedNotifier(void);
	__property TcxSystemPaletteChangedEvent OnSystemPaletteChanged = {read=FOnSystemPaletteChanged, write=FOnSystemPaletteChanged};
};


typedef DynamicArray<Graphics::TColor >  cxEditPaintUtils__3;

typedef DynamicArray<HBRUSH >  cxEditPaintUtils__4;

typedef DynamicArray<unsigned >  cxEditPaintUtils__5;

class DELPHICLASS TcxSolidBrushCache;
class PASCALIMPLEMENTATION TcxSolidBrushCache : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	DynamicArray<Graphics::TColor >  FBrushColors;
	DynamicArray<HBRUSH >  FBrushes;
	DynamicArray<unsigned >  FCounts;
	int FDepth;
	int FMaxDepth;
	TcxSystemPaletteChangedNotifier* FSystemPaletteChangedNotifier;
	
protected:
	virtual void __fastcall SystemPaletteChanged(void);
	
public:
	__fastcall TcxSolidBrushCache(void)/* overload */;
	__fastcall TcxSolidBrushCache(int AMaxDepth)/* overload */;
	__fastcall virtual ~TcxSolidBrushCache(void);
	void __fastcall Clear(void);
	HBRUSH __fastcall GetBrush(Graphics::TColor ABrushColor);
};


//-- var, const, procedure ---------------------------------------------------
static const Byte cxSolidBrushCacheDefaultMaxDepth = 0x80;
extern PACKAGE HBRUSH __fastcall GetSolidBrush(Graphics::TColor ABrushColor)/* overload */;
extern PACKAGE HBRUSH __fastcall GetSolidBrush(Graphics::TCanvas* ACanvas, Graphics::TColor ABrushColor)/* overload */;
extern PACKAGE HBRUSH __fastcall GetSolidBrush(Cxgraphics::TcxCanvas* ACanvas, Graphics::TColor ABrushColor)/* overload */;
extern PACKAGE void __fastcall ResetSolidBrushCache(void);

}	/* namespace Cxeditpaintutils */
using namespace Cxeditpaintutils;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxEditPaintUtils
