// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'dxGDIPlusClasses.pas' rev: 6.00

#ifndef dxGDIPlusClassesHPP
#define dxGDIPlusClassesHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <dxGDIPlusAPI.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Dxgdiplusclasses
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TdxGPBrush;
class PASCALIMPLEMENTATION TdxGPBrush : public Dxgdiplusapi::TdxGPBase 
{
	typedef Dxgdiplusapi::TdxGPBase inherited;
	
private:
	void *FNativeBrush;
	Status FLastResult;
	
protected:
	__fastcall TdxGPBrush(void * nativeBrush, Status AStatus);
	void __fastcall SetNativeBrush(void * ANativeBrush);
	Status __fastcall SetStatus(Status AStatus);
	
public:
	__fastcall TdxGPBrush(void);
	__fastcall virtual ~TdxGPBrush(void);
	virtual TdxGPBrush* __fastcall Clone(void);
	BrushType __fastcall GetType(void);
	Status __fastcall GetLastStatus(void);
};


class DELPHICLASS TdxGPSolidBrush;
class PASCALIMPLEMENTATION TdxGPSolidBrush : public TdxGPBrush 
{
	typedef TdxGPBrush inherited;
	
private:
	unsigned __fastcall GetColor(void);
	void __fastcall SetColor(const unsigned Value);
	
public:
	__fastcall TdxGPSolidBrush(void)/* overload */;
	__fastcall TdxGPSolidBrush(Graphics::TColor color)/* overload */;
	__property unsigned Color = {read=GetColor, write=SetColor, nodefault};
protected:
	#pragma option push -w-inl
	/* TdxGPBrush.CreateNative */ inline __fastcall TdxGPSolidBrush(void * nativeBrush, Status AStatus) : TdxGPBrush(nativeBrush, AStatus) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TdxGPBrush.Destroy */ inline __fastcall virtual ~TdxGPSolidBrush(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxGPTextureBrush;
class PASCALIMPLEMENTATION TdxGPTextureBrush : public TdxGPBrush 
{
	typedef TdxGPBrush inherited;
	
protected:
	#pragma option push -w-inl
	/* TdxGPBrush.CreateNative */ inline __fastcall TdxGPTextureBrush(void * nativeBrush, Status AStatus) : TdxGPBrush(nativeBrush, AStatus) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TdxGPBrush.Create */ inline __fastcall TdxGPTextureBrush(void) : TdxGPBrush() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TdxGPBrush.Destroy */ inline __fastcall virtual ~TdxGPTextureBrush(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxGPLinearGradientBrush;
class PASCALIMPLEMENTATION TdxGPLinearGradientBrush : public TdxGPBrush 
{
	typedef TdxGPBrush inherited;
	
private:
	void __fastcall SetWrapMode(const WrapMode Value);
	WrapMode __fastcall GetWrapMode(void);
	
public:
	__fastcall TdxGPLinearGradientBrush(void)/* overload */;
	__fastcall TdxGPLinearGradientBrush(const Dxgdiplusapi::TdxGPRect &rect, unsigned color1, unsigned color2, LinearGradientMode mode)/* overload */;
	Status __fastcall SetLinearColors(unsigned color1, unsigned color2);
	Status __fastcall GetLinearColors(/* out */ unsigned &color1, /* out */ unsigned &color2);
	Dxgdiplusapi::TdxGPRect __fastcall GetRectangle()/* overload */;
	__property WrapMode WrapMode = {read=GetWrapMode, write=SetWrapMode, nodefault};
protected:
	#pragma option push -w-inl
	/* TdxGPBrush.CreateNative */ inline __fastcall TdxGPLinearGradientBrush(void * nativeBrush, Status AStatus) : TdxGPBrush(nativeBrush, AStatus) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TdxGPBrush.Destroy */ inline __fastcall virtual ~TdxGPLinearGradientBrush(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxGPHatchBrush;
class PASCALIMPLEMENTATION TdxGPHatchBrush : public TdxGPBrush 
{
	typedef TdxGPBrush inherited;
	
public:
	__fastcall TdxGPHatchBrush(void)/* overload */;
	__fastcall TdxGPHatchBrush(HatchStyle hatchStyle, unsigned foreColor, unsigned backColor)/* overload */;
	HatchStyle __fastcall GetHatchStyle(void);
	unsigned __fastcall GetForegroundColor(void);
	unsigned __fastcall GetBackgroundColor(void);
protected:
	#pragma option push -w-inl
	/* TdxGPBrush.CreateNative */ inline __fastcall TdxGPHatchBrush(void * nativeBrush, Status AStatus) : TdxGPBrush(nativeBrush, AStatus) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TdxGPBrush.Destroy */ inline __fastcall virtual ~TdxGPHatchBrush(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxGPPen;
class PASCALIMPLEMENTATION TdxGPPen : public Dxgdiplusapi::TdxGPBase 
{
	typedef Dxgdiplusapi::TdxGPBase inherited;
	
private:
	void *FNativePen;
	Status FLastResult;
	PenAlignment __fastcall GetAlignment(void);
	unsigned __fastcall GetColor(void);
	TdxGPBrush* __fastcall GetBrush(void);
	float __fastcall GetWidth(void);
	void __fastcall SetAlignment(const PenAlignment Value);
	void __fastcall SetColor(const unsigned Value);
	void __fastcall SetBrush(const TdxGPBrush* Value);
	void __fastcall SetWidth(const float Value);
	
protected:
	void __fastcall SetNativePen(void * ANativePen);
	Status __fastcall SetStatus(Status status);
	
public:
	__fastcall TdxGPPen(unsigned color, float width)/* overload */;
	__fastcall TdxGPPen(TdxGPBrush* brush, float width)/* overload */;
	__fastcall virtual ~TdxGPPen(void);
	Status __fastcall GetLastStatus(void);
	int __fastcall GetPenType(void);
	__property PenAlignment ALignment = {read=GetAlignment, write=SetAlignment, nodefault};
	__property TdxGPBrush* Brush = {read=GetBrush, write=SetBrush};
	__property unsigned Color = {read=GetColor, write=SetColor, nodefault};
	__property float Width = {read=GetWidth, write=SetWidth};
};


class DELPHICLASS TdxGPGraphics;
class PASCALIMPLEMENTATION TdxGPGraphics : public Dxgdiplusapi::TdxGPBase 
{
	typedef Dxgdiplusapi::TdxGPBase inherited;
	
private:
	void *FNativeGraphics;
	Status FLastResult;
	
protected:
	void __fastcall SetNativeGraphics(void * AGraphics);
	Status __fastcall SetStatus(Status status);
	void * __fastcall GetNativeGraphics(void);
	void * __fastcall GetNativePen(TdxGPPen* pen);
	
public:
	__fastcall TdxGPGraphics(HDC hdc)/* overload */;
	__fastcall virtual ~TdxGPGraphics(void);
	HDC __fastcall GetHDC(void);
	void __fastcall ReleaseHDC(HDC hdc);
	Status __fastcall GetLastStatus(void);
	Status __fastcall DrawLine(TdxGPPen* pen, int x1, int y1, int x2, int y2)/* overload */;
	Status __fastcall DrawLine(TdxGPPen* pen, const Dxgdiplusapi::TdxGPPoint &pt1, const Dxgdiplusapi::TdxGPPoint &pt2)/* overload */;
	Status __fastcall DrawArc(TdxGPPen* pen, const Dxgdiplusapi::TdxGPRect &rect, float startAngle, float sweepAngle)/* overload */;
	Status __fastcall DrawBezier(TdxGPPen* pen, int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4)/* overload */;
	Status __fastcall DrawBezier(TdxGPPen* pen, const Dxgdiplusapi::TdxGPPoint &pt1, const Dxgdiplusapi::TdxGPPoint &pt2, const Dxgdiplusapi::TdxGPPoint &pt3, const Dxgdiplusapi::TdxGPPoint &pt4)/* overload */;
	Status __fastcall DrawRectangle(TdxGPPen* pen, const Dxgdiplusapi::TdxGPRect &rect)/* overload */;
	Status __fastcall DrawEllipse(TdxGPPen* pen, const Dxgdiplusapi::TdxGPRect &rect)/* overload */;
	Status __fastcall DrawPie(TdxGPPen* pen, const Dxgdiplusapi::TdxGPRect &rect, float startAngle, float sweepAngle)/* overload */;
	Status __fastcall DrawPolygon(TdxGPPen* pen, Dxgdiplusapi::PdxGPPoint points, int count)/* overload */;
	Status __fastcall DrawCurve(TdxGPPen* pen, Dxgdiplusapi::PdxGPPoint points, int count, float tension)/* overload */;
	Status __fastcall DrawClosedCurve(TdxGPPen* pen, Dxgdiplusapi::PdxGPPoint points, int count, float tension)/* overload */;
	Status __fastcall Clear(Graphics::TColor color);
	void __fastcall FillRectangle(TdxGPBrush* brush, const Dxgdiplusapi::TdxGPRect &rect);
	Status __fastcall FillPolygon(TdxGPBrush* brush, Dxgdiplusapi::PdxGPPoint points, int count)/* overload */;
	Status __fastcall FillEllipse(TdxGPBrush* brush, const Dxgdiplusapi::TdxGPRect &rect)/* overload */;
	Status __fastcall FillPie(TdxGPBrush* brush, const Dxgdiplusapi::TdxGPRect &rect, float startAngle, float sweepAngle)/* overload */;
	Status __fastcall FillClosedCurve(TdxGPBrush* brush, Dxgdiplusapi::PdxGPPoint points, int count)/* overload */;
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Dxgdiplusclasses */
using namespace Dxgdiplusclasses;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// dxGDIPlusClasses
