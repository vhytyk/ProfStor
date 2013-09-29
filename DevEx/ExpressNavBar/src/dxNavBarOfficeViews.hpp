// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'dxNavBarOfficeViews.pas' rev: 6.00

#ifndef dxNavBarOfficeViewsHPP
#define dxNavBarOfficeViewsHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <dxNavBarBaseViews.hpp>	// Pascal unit
#include <dxNavBarStyles.hpp>	// Pascal unit
#include <dxNavBar.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Dxnavbarofficeviews
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TdxNavBarOffice1ViewInfo;
class PASCALIMPLEMENTATION TdxNavBarOffice1ViewInfo : public Dxnavbarbaseviews::TdxNavBarBaseViewInfo 
{
	typedef Dxnavbarbaseviews::TdxNavBarBaseViewInfo inherited;
	
protected:
	/* virtual class method */ virtual int __fastcall GetGroupCaptionHeightAddon(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall GetGroupSeparatorWidth(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TdxNavBarViewInfo.Create */ inline __fastcall virtual TdxNavBarOffice1ViewInfo(Dxnavbar::TdxNavBarPainter* APainter) : Dxnavbarbaseviews::TdxNavBarBaseViewInfo(APainter) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TdxNavBarViewInfo.Destroy */ inline __fastcall virtual ~TdxNavBarOffice1ViewInfo(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxNavBarOffice1Painter;
class PASCALIMPLEMENTATION TdxNavBarOffice1Painter : public Dxnavbarbaseviews::TdxNavBarBasePainter 
{
	typedef Dxnavbarbaseviews::TdxNavBarBasePainter inherited;
	
protected:
	/* virtual class method */ virtual TMetaClass* __fastcall ViewInfoClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall ButtonPainterClass(TMetaClass* vmt);
	
public:
	virtual void __fastcall AssignDefaultBackgroundStyle(void);
	virtual void __fastcall AssignDefaultGroupBackgroundStyle(void);
	virtual void __fastcall AssignDefaultGroupHeaderStyle(void);
	virtual void __fastcall AssignDefaultItemStyle(void);
	virtual void __fastcall AssignDefaultItemDisabledStyle(void);
public:
	#pragma option push -w-inl
	/* TdxNavBarPainter.Create */ inline __fastcall virtual TdxNavBarOffice1Painter(Dxnavbar::TdxCustomNavBar* ANavBar) : Dxnavbarbaseviews::TdxNavBarBasePainter(ANavBar) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TdxNavBarPainter.Destroy */ inline __fastcall virtual ~TdxNavBarOffice1Painter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxNavBarOffice2Painter;
class PASCALIMPLEMENTATION TdxNavBarOffice2Painter : public TdxNavBarOffice1Painter 
{
	typedef TdxNavBarOffice1Painter inherited;
	
protected:
	/* virtual class method */ virtual TMetaClass* __fastcall SelectionPainterClass(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TdxNavBarPainter.Create */ inline __fastcall virtual TdxNavBarOffice2Painter(Dxnavbar::TdxCustomNavBar* ANavBar) : TdxNavBarOffice1Painter(ANavBar) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TdxNavBarPainter.Destroy */ inline __fastcall virtual ~TdxNavBarOffice2Painter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxNavBarOffice3LinkViewInfo;
class PASCALIMPLEMENTATION TdxNavBarOffice3LinkViewInfo : public Dxnavbar::TdxNavBarLinkViewInfo 
{
	typedef Dxnavbar::TdxNavBarLinkViewInfo inherited;
	
public:
	virtual Types::TRect __fastcall SelectionRect();
public:
	#pragma option push -w-inl
	/* TdxNavBarLinkViewInfo.Create */ inline __fastcall TdxNavBarOffice3LinkViewInfo(Dxnavbar::TdxNavBarGroupViewInfo* AGroupViewInfo, Dxnavbarcollns::TdxNavBarItemLink* ALink) : Dxnavbar::TdxNavBarLinkViewInfo(AGroupViewInfo, ALink) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxNavBarOffice3LinkViewInfo(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxNavBarOffice3ViewInfo;
class PASCALIMPLEMENTATION TdxNavBarOffice3ViewInfo : public TdxNavBarOffice1ViewInfo 
{
	typedef TdxNavBarOffice1ViewInfo inherited;
	
protected:
	/* virtual class method */ virtual int __fastcall GetLinksLargeSeparatorWidth(TMetaClass* vmt);
	
public:
	virtual Dxnavbar::TdxNavBarLinkViewInfo* __fastcall GetLinkViewInfoAtSelectedPos(const Types::TPoint &pt);
public:
	#pragma option push -w-inl
	/* TdxNavBarViewInfo.Create */ inline __fastcall virtual TdxNavBarOffice3ViewInfo(Dxnavbar::TdxNavBarPainter* APainter) : TdxNavBarOffice1ViewInfo(APainter) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TdxNavBarViewInfo.Destroy */ inline __fastcall virtual ~TdxNavBarOffice3ViewInfo(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxNavBarOffice3Painter;
class PASCALIMPLEMENTATION TdxNavBarOffice3Painter : public TdxNavBarOffice2Painter 
{
	typedef TdxNavBarOffice2Painter inherited;
	
protected:
	/* virtual class method */ virtual TMetaClass* __fastcall ViewInfoClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall LinkViewInfoClass(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TdxNavBarPainter.Create */ inline __fastcall virtual TdxNavBarOffice3Painter(Dxnavbar::TdxCustomNavBar* ANavBar) : TdxNavBarOffice2Painter(ANavBar) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TdxNavBarPainter.Destroy */ inline __fastcall virtual ~TdxNavBarOffice3Painter(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Dxnavbarofficeviews */
using namespace Dxnavbarofficeviews;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// dxNavBarOfficeViews
