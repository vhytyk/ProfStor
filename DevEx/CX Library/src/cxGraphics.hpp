// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxGraphics.pas' rev: 6.00

#ifndef cxGraphicsHPP
#define cxGraphicsHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <ImgList.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxgraphics
{
//-- type declarations -------------------------------------------------------
__interface IcxFontListener;
typedef System::DelphiInterface<IcxFontListener> _di_IcxFontListener;
__interface INTERFACE_UUID("{B144DD7E-0B27-439A-B908-FC3ACFE6A2D3}") IcxFontListener  : public IInterface 
{
	
public:
	virtual void __fastcall Changed(System::TObject* Sender, Graphics::TFont* AFont) = 0 ;
};

#pragma option push -b-
enum TcxBorder { bLeft, bTop, bRight, bBottom };
#pragma option pop

typedef Set<TcxBorder, bLeft, bBottom>  TcxBorders;

typedef HBRUSH TBrushHandle;

typedef DynamicArray<Types::TRect >  TRectArray;

typedef Shortint TcxColorPart;

#pragma option push -b-
enum TcxGridLines { glBoth, glNone, glVertical, glHorizontal };
#pragma option pop

#pragma pack(push, 4)
struct TcxViewParams
{
	Graphics::TBitmap* Bitmap;
	Graphics::TColor Color;
	Graphics::TFont* Font;
	Graphics::TColor TextColor;
} ;
#pragma pack(pop)

typedef HRGN TcxRegionHandle;

#pragma option push -b-
enum TcxRegionOperation { roSet, roAdd, roSubtract, roIntersect };
#pragma option pop

class DELPHICLASS TcxRegion;
class PASCALIMPLEMENTATION TcxRegion : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	HRGN FHandle;
	bool __fastcall GetIsEmpty(void);
	
protected:
	void __fastcall DestroyHandle(void);
	
public:
	__fastcall virtual TcxRegion(HRGN AHandle)/* overload */;
	__fastcall TcxRegion(const Types::TRect &ABounds)/* overload */;
	__fastcall TcxRegion(void)/* overload */;
	__fastcall TcxRegion(int ALeft, int ATop, int ARight, int ABottom)/* overload */;
	__fastcall virtual ~TcxRegion(void);
	void __fastcall Combine(TcxRegion* ARegion, TcxRegionOperation AOperation, bool ADestroyRegion = true);
	void __fastcall Offset(int DX, int DY);
	__property HRGN Handle = {read=FHandle, write=FHandle, nodefault};
	__property bool IsEmpty = {read=GetIsEmpty, nodefault};
};


class DELPHICLASS TcxCanvas;
class PASCALIMPLEMENTATION TcxCanvas : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	Graphics::TCanvas* FCanvas;
	Graphics::TBrush* __fastcall GetBrush(void);
	int __fastcall GetCopyMode(void);
	Graphics::TFont* __fastcall GetFont(void);
	HDC __fastcall GetHandle(void);
	Graphics::TPen* __fastcall GetPen(void);
	Types::TPoint __fastcall GetWindowOrg();
	void __fastcall SetBrush(Graphics::TBrush* Value);
	void __fastcall SetCopyMode(int Value);
	void __fastcall SetFont(Graphics::TFont* Value);
	void __fastcall SetPen(Graphics::TPen* Value);
	void __fastcall SetPixel(int X, int Y, Graphics::TColor Value);
	void __fastcall SetWindowOrg(const Types::TPoint &P);
	
public:
	__fastcall virtual TcxCanvas(Graphics::TCanvas* ACanvas);
	void __fastcall CopyRect(const Types::TRect &Dest, Graphics::TCanvas* ACanvas, const Types::TRect &Source);
	void __fastcall Draw(int X, int Y, Graphics::TGraphic* Graphic);
	void __fastcall DrawComplexFrame(const Types::TRect &R, Graphics::TColor ALeftTopColor, Graphics::TColor ARightBottomColor, TcxBorders ABorders = (System::Set<TcxBorder, bLeft, bBottom> () << TcxBorder(0) << TcxBorder(1) << TcxBorder(2) << TcxBorder(3) ), int ABorderWidth = 0x1);
	void __fastcall DrawEdge(const Types::TRect &R, bool ASunken, bool AOuter, TcxBorders ABorders = (System::Set<TcxBorder, bLeft, bBottom> () << TcxBorder(0) << TcxBorder(1) << TcxBorder(2) << TcxBorder(3) ));
	void __fastcall DrawFocusRect(const Types::TRect &R);
	void __fastcall DrawGlyph(int X, int Y, Graphics::TBitmap* AGlyph, bool AEnabled = true, Graphics::TColor ABackgroundColor = (Graphics::TColor)(0x1fffffff));
	void __fastcall DrawImage(Imglist::TCustomImageList* Images, int X, int Y, int Index, bool Enabled = true);
	void __fastcall DrawTexT(const AnsiString Text, const Types::TRect &R, int Flags, bool Enabled = true);
	void __fastcall FillRect(const Types::TRect &R)/* overload */;
	void __fastcall FillRect(const Types::TRect &R, Graphics::TBitmap* ABitmap)/* overload */;
	int __fastcall FontHeight(Graphics::TFont* AFont);
	void __fastcall FrameRect(const Types::TRect &R, Graphics::TColor Color = (Graphics::TColor)(0x20000000), int ALineWidth = 0x1, TcxBorders ABorders = (System::Set<TcxBorder, bLeft, bBottom> () << TcxBorder(0) << TcxBorder(1) << TcxBorder(2) << TcxBorder(3) ));
	void __fastcall InvertFrame(const Types::TRect &R, int ABorderSize);
	void __fastcall InvertRect(const Types::TRect &R);
	void __fastcall LineTo(int X, int Y);
	void __fastcall MoveTo(int X, int Y);
	void __fastcall Polygon(const Types::TPoint * Points, const int Points_Size);
	void __fastcall Polyline(const Types::TPoint * Points, const int Points_Size);
	tagSIZE __fastcall TextExtent(const AnsiString Text)/* overload */;
	void __fastcall TextExtent(const AnsiString Text, Types::TRect &R, int Flags)/* overload */;
	int __fastcall TextHeight(const AnsiString Text);
	int __fastcall TextWidth(const AnsiString Text);
	void __fastcall SetBrushColor(Graphics::TColor Value);
	void __fastcall GetTextStringsBounds(AnsiString Text, const Types::TRect &R, int Flags, bool Enabled, TRectArray &ABounds);
	void __fastcall ExcludeClipRect(const Types::TRect &R);
	void __fastcall IntersectClipRect(const Types::TRect &R);
	TcxRegion* __fastcall GetClipRegion(void);
	void __fastcall SetClipRegion(TcxRegion* ARegion, TcxRegionOperation AOperation, bool ADestroyRegion = true);
	bool __fastcall RectVisible(const Types::TRect &R);
	__property Graphics::TBrush* Brush = {read=GetBrush, write=SetBrush};
	__property Graphics::TCanvas* Canvas = {read=FCanvas, write=FCanvas};
	__property int CopyMode = {read=GetCopyMode, write=SetCopyMode, nodefault};
	__property Graphics::TFont* Font = {read=GetFont, write=SetFont};
	__property HDC Handle = {read=GetHandle, nodefault};
	__property Graphics::TPen* Pen = {read=GetPen, write=SetPen};
	__property Graphics::TColor Pixels[int X][int Y] = {write=SetPixel};
	__property Types::TPoint WindowOrg = {read=GetWindowOrg, write=SetWindowOrg};
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxCanvas(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxScreenCanvas;
class PASCALIMPLEMENTATION TcxScreenCanvas : public TcxCanvas 
{
	typedef TcxCanvas inherited;
	
public:
	__fastcall virtual TcxScreenCanvas(void);
	__fastcall virtual ~TcxScreenCanvas(void);
};


//-- var, const, procedure ---------------------------------------------------
static const Shortint cxAlignLeft = 0x1;
static const Shortint cxAlignRight = 0x2;
static const Shortint cxAlignHCenter = 0x4;
static const Shortint cxAlignTop = 0x8;
static const Shortint cxAlignBottom = 0x10;
static const Shortint cxAlignVCenter = 0x20;
static const Shortint cxAlignCenter = 0x24;
static const Shortint cxSingleLine = 0x40;
static const Byte cxDontClip = 0x80;
static const Word cxExpandTabs = 0x100;
static const Word cxShowPrefix = 0x200;
static const Word cxWordBreak = 0x400;
static const Word cxShowEndEllipsis = 0x800;
static const Word cxDontPrint = 0x1000;
static const Word cxShowPathEllipsis = 0x2000;
#define cxBordersAll (System::Set<TcxBorder, bLeft, bBottom> () << TcxBorder(0) << TcxBorder(1) << TcxBorder(2) << TcxBorder(3) )
extern PACKAGE int __fastcall cxFlagsToDTFlags(int Flags);
extern PACKAGE Graphics::TColor __fastcall GetRealColor(Graphics::TColor AColor);
extern PACKAGE Graphics::TColor __fastcall GetLightColor(TcxColorPart ABtnFaceColorPart, TcxColorPart AHighlightColorPart, TcxColorPart AWindowColorPart);
extern PACKAGE Graphics::TColor __fastcall GetLightBtnFaceColor(void);
extern PACKAGE Graphics::TColor __fastcall GetLightDownedColor(void);
extern PACKAGE Graphics::TColor __fastcall GetLightDownedSelColor(void);
extern PACKAGE Graphics::TColor __fastcall GetLightSelColor(void);

}	/* namespace Cxgraphics */
using namespace Cxgraphics;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxGraphics
