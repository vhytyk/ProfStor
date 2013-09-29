// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'dxGDIPlusAPI.pas' rev: 6.00

#ifndef dxGDIPlusAPIHPP
#define dxGDIPlusAPIHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <ActiveX.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Dxgdiplusapi
{
//-- type declarations -------------------------------------------------------
typedef short INT16;

typedef Word UINT16;

typedef UINT16 *PUINT16;

typedef unsigned UINT32;

typedef DynamicArray<float >  TSingleDynArray;

class DELPHICLASS TdxGPBase;
class PASCALIMPLEMENTATION TdxGPBase : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	/* virtual class method */ virtual System::TObject* __fastcall NewInstance(TMetaClass* vmt);
	virtual void __fastcall FreeInstance(void);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TdxGPBase(void) : System::TObject() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxGPBase(void) { }
	#pragma option pop
	
};


#pragma option push -b
enum Unit_ { UnitWorld, UnitDisplay, UnitPixel, UnitPoint, UnitInch, UnitDocument, UnitMillimeter };
#pragma option pop

typedef Unit_ TdxGPUnit;

typedef FillMode TdxGPFillMode;

typedef WrapMode TdxGPWrapMode;

typedef HatchStyle TdxGPHatchStyle;

typedef DashStyle TdxGPDashStyle;

typedef WarpMode TdxGPWarpMode;

typedef LinearGradientMode TdxGPLinearGradientMode;

typedef PenAlignment TdxGPPenAlignment;

typedef BrushType TdxGPBrushType;

typedef int TdxGPPenType;

typedef Status TdxGPStatus;

struct TdxGPSizeF;
typedef TdxGPSizeF *PdxGPSizeF;

#pragma pack(push, 1)
struct TdxGPSizeF
{
	float Width;
	float Height;
} ;
#pragma pack(pop)

#pragma pack(push, 1)
struct TdxGPSize
{
	int Width;
	int Height;
} ;
#pragma pack(pop)

typedef TdxGPSize *PdxGPSize;

struct TdxGPPointF;
typedef TdxGPPointF *PdxGPPointF;

#pragma pack(push, 1)
struct TdxGPPointF
{
	float X;
	float Y;
} ;
#pragma pack(pop)

typedef DynamicArray<TdxGPPointF >  TdxGPPointFDynArray;

#pragma pack(push, 1)
struct TdxGPPoint
{
	int X;
	int Y;
} ;
#pragma pack(pop)

typedef TdxGPPoint *PdxGPPoint;

typedef DynamicArray<TdxGPPoint >  TdxGPPointDynArray;

struct TdxGPRectF;
typedef TdxGPRectF *PdxGPRectF;

#pragma pack(push, 1)
struct TdxGPRectF
{
	float X;
	float Y;
	float Width;
	float Height;
} ;
#pragma pack(pop)

typedef DynamicArray<TdxGPRectF >  TdxGPRectFDynArray;

#pragma pack(push, 1)
struct TdxGPRect
{
	int X;
	int Y;
	int Width;
	int Height;
} ;
#pragma pack(pop)

typedef TdxGPRect *PdxGPRect;

typedef DynamicArray<TdxGPRect >  TdxGPRectDynArray;

typedef DebugEventLevel TDebugEventLevel;

typedef GdiplusStartupInput  TGdiplusStartupInput;

typedef GdiplusStartupInput *PGdiplusStartupInput;

typedef GdiplusStartupOutput  TGdiplusStartupOutput;

typedef GdiplusStartupOutput *PGdiplusStartupOutput;

typedef unsigned *PARGB;

typedef unsigned *PdxGPColor;

typedef unsigned TdxGPColor;

typedef DynamicArray<unsigned >  TdxGPColorDynArray;

typedef void *GpGraphics;

typedef void *GpBrush;

typedef void *GpTexture;

typedef void *GpSolidFill;

typedef void *GpLineGradient;

typedef void *GpPathGradient;

typedef void *GpHatch;

typedef void *GpPen;

typedef Status GpStatus;

typedef FillMode GpFillMode;

typedef WrapMode GpWrapMode;

typedef Unit_ GpUnit;

typedef TdxGPPointF *GpPointF;

typedef TdxGPPoint *GpPoint;

typedef TdxGPRectF *GpRectF;

typedef TdxGPRect *GpRect;

typedef TdxGPSizeF *GpSizeF;

typedef HatchStyle GpHatchStyle;

typedef DashStyle GpDashStyle;

typedef PenAlignment GpPenAlignment;

typedef int GpPenType;

typedef BrushType GpBrushType;

//-- var, const, procedure ---------------------------------------------------
#define HatchStyleLargeGrid (HatchStyle)(4)
#define HatchStyleMin (HatchStyle)(0)
#define HatchStyleMax (HatchStyle)(52)
static const Shortint PenTypeSolidColor = 0x0;
static const Shortint PenTypeHatchFill = 0x1;
static const Shortint PenTypeTextureFill = 0x2;
static const Shortint PenTypePathGradient = 0x3;
static const Shortint PenTypeLinearGradient = 0x4;
static const Shortint PenTypeUnknown = 0xffffffff;
extern PACKAGE void * __stdcall (*GdipAlloc)(unsigned size);
extern PACKAGE void __stdcall (*GdipFree)(void * ptr);
extern PACKAGE Status __stdcall (*GdiplusStartup)(/* out */ unsigned &token, const GdiplusStartupInput &input, PGdiplusStartupOutput output);
extern PACKAGE void __stdcall (*GdiplusShutdown)(unsigned token);
extern PACKAGE Status __stdcall (*GdipCloneBrush)(void * brush, void * &clonebrush);
extern PACKAGE Status __stdcall (*GdipDeleteBrush)(void * brush);
extern PACKAGE Status __stdcall (*GdipGetBrushType)(void * brush, BrushType &bt);
extern PACKAGE Status __stdcall (*GdipCreateSolidFill)(unsigned color, void * &brush);
extern PACKAGE Status __stdcall (*GdipSetSolidFillColor)(void * brush, unsigned color);
extern PACKAGE Status __stdcall (*GdipGetSolidFillColor)(void * brush, unsigned &color);
extern PACKAGE Status __stdcall (*GdipCreateLineBrushFromRectI)(const PdxGPRectF rect, unsigned color1, unsigned color2, LinearGradientMode mode, WrapMode wrapmode, void * &lineGradient);
extern PACKAGE Status __stdcall (*GdipGetLineRectI)(void * brush, PdxGPRect &rect);
extern PACKAGE Status __stdcall (*GdipSetLineColors)(void * brush, unsigned color1, unsigned color2);
extern PACKAGE Status __stdcall (*GdipGetLineColors)(void * brush, PARGB colors);
extern PACKAGE Status __stdcall (*GdipSetLineWrapMode)(void * brush, WrapMode wrapmode);
extern PACKAGE Status __stdcall (*GdipGetLineWrapMode)(void * brush, WrapMode wrapmode);
extern PACKAGE Status __stdcall (*GdipCreateHatchBrush)(HatchStyle hatchstyle, unsigned forecol, unsigned backcol, void * &brush);
extern PACKAGE Status __stdcall (*GdipGetHatchStyle)(void * brush, HatchStyle &hatchstyle);
extern PACKAGE Status __stdcall (*GdipGetHatchForegroundColor)(void * brush, unsigned &forecol);
extern PACKAGE Status __stdcall (*GdipGetHatchBackgroundColor)(void * brush, unsigned &backcol);
extern PACKAGE Status __stdcall (*GdipCreatePen1)(unsigned color, float width, Unit_ u, void * &pen);
extern PACKAGE Status __stdcall (*GdipCreatePen2)(void * brush, float width, Unit_ u, void * &pen);
extern PACKAGE Status __stdcall (*GdipClonePen)(void * pen, void * &clonepen);
extern PACKAGE Status __stdcall (*GdipDeletePen)(void * pen);
extern PACKAGE Status __stdcall (*GdipGetPenFillType)(void * pen, int &penType);
extern PACKAGE Status __stdcall (*GdipSetPenBrushFill)(void * pen, void * brush);
extern PACKAGE Status __stdcall (*GdipGetPenBrushFill)(void * pen, void * &brush);
extern PACKAGE Status __stdcall (*GdipSetPenColor)(void * pen, unsigned color);
extern PACKAGE Status __stdcall (*GdipGetPenColor)(void * pen, unsigned &color);
extern PACKAGE Status __stdcall (*GdipSetPenMode)(void * pen, PenAlignment penMode);
extern PACKAGE Status __stdcall (*GdipGetPenMode)(void * pen, PenAlignment &penMode);
extern PACKAGE Status __stdcall (*GdipSetPenWidth)(void * pen, float width);
extern PACKAGE Status __stdcall (*GdipGetPenWidth)(void * pen, float &width);
extern PACKAGE Status __stdcall (*GdipCreateFromHDC)(HDC hdc, void * &graphics);
extern PACKAGE Status __stdcall (*GdipDeleteGraphics)(void * graphics);
extern PACKAGE Status __stdcall (*GdipGetDC)(void * graphics, HDC &hdc);
extern PACKAGE Status __stdcall (*GdipReleaseDC)(void * graphics, HDC hdc);
extern PACKAGE Status __stdcall (*GdipGraphicsClear)(void * graphics, unsigned color);
extern PACKAGE Status __stdcall (*GdipDrawLineI)(void * graphics, void * pen, int x1, int y1, int x2, int y2);
extern PACKAGE Status __stdcall (*GdipFillRectangleI)(void * graphics, void * brush, int x, int y, int width, int height);
extern PACKAGE Status __stdcall (*GdipDrawArcI)(void * graphics, void * pen, int x, int y, int width, int height, float startAngle, float sweepAngle);
extern PACKAGE Status __stdcall (*GdipDrawBezierI)(void * graphics, void * pen, int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4);
extern PACKAGE Status __stdcall (*GdipDrawRectangleI)(void * graphics, void * pen, int x, int y, int width, int height);
extern PACKAGE Status __stdcall (*GdipDrawEllipseI)(void * graphics, void * pen, int x, int y, int width, int height);
extern PACKAGE Status __stdcall (*GdipDrawPieI)(void * graphics, void * pen, int x, int y, int width, int height, float startAngle, float sweepAngle);
extern PACKAGE Status __stdcall (*GdipDrawPolygonI)(void * graphics, void * pen, const PdxGPPoint points, int count);
extern PACKAGE Status __stdcall (*GdipDrawCurve2I)(void * graphics, void * pen, const PdxGPPoint points, int count, float tension);
extern PACKAGE Status __stdcall (*GdipDrawClosedCurve2I)(void * graphics, void * pen, const PdxGPPoint points, int count, float tension);
extern PACKAGE Status __stdcall (*GdipFillPolygonI)(void * graphics, void * brush, const PdxGPPoint points, int count, FillMode fillmode);
extern PACKAGE Status __stdcall (*GdipFillEllipseI)(void * graphics, void * brush, int x, int y, int width, int height);
extern PACKAGE Status __stdcall (*GdipFillPieI)(void * graphics, void * brush, int x, int y, int width, int height, float startAngle, float sweepAngle);
extern PACKAGE Status __stdcall (*GdipFillClosedCurveI)(void * graphics, void * brush, const PdxGPPoint points, int count);
extern PACKAGE bool __fastcall CheckGdiPlus(void);
extern PACKAGE TdxGPPoint __fastcall MakePoint(int X, int Y)/* overload */;
extern PACKAGE TdxGPPointF __fastcall MakePoint(float X, float Y)/* overload */;
extern PACKAGE TdxGPSizeF __fastcall MakeSize(float Width, float Height)/* overload */;
extern PACKAGE TdxGPSize __fastcall MakeSize(int Width, int Height)/* overload */;
extern PACKAGE TdxGPRectF __fastcall MakeRect(float x, float y, float width, float height)/* overload */;
extern PACKAGE TdxGPRectF __fastcall MakeRect(const TdxGPPointF &location, const TdxGPSizeF &size)/* overload */;
extern PACKAGE TdxGPRect __fastcall MakeRect(int x, int y, int width, int height)/* overload */;
extern PACKAGE TdxGPRect __fastcall MakeRect(const TdxGPPoint &location, const TdxGPSize &size)/* overload */;
extern PACKAGE TdxGPRect __fastcall MakeRect(const Types::TRect &Rect)/* overload */;
extern PACKAGE unsigned __fastcall MakeColor(Byte r, Byte g, Byte b)/* overload */;
extern PACKAGE unsigned __fastcall MakeColor(Byte a, Byte r, Byte g, Byte b)/* overload */;
extern PACKAGE unsigned __fastcall MakeColor(Graphics::TColor color, Byte alpha)/* overload */;
extern PACKAGE Byte __fastcall GetAlpha(unsigned color);
extern PACKAGE Byte __fastcall GetRed(unsigned color);
extern PACKAGE Byte __fastcall GetGreen(unsigned color);
extern PACKAGE Byte __fastcall GetBlue(unsigned color);
extern PACKAGE unsigned __fastcall ColorRefToARGB(unsigned rgb);
extern PACKAGE unsigned __fastcall ARGBToColorRef(unsigned Color);

}	/* namespace Dxgdiplusapi */
using namespace Dxgdiplusapi;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// dxGDIPlusAPI
