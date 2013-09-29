// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'dxNavBarXPViews.pas' rev: 6.00

#ifndef dxNavBarXPViewsHPP
#define dxNavBarXPViewsHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <dxNavBarExplorerViews.hpp>	// Pascal unit
#include <dxNavBarOfficeViews.hpp>	// Pascal unit
#include <dxNavBarBaseViews.hpp>	// Pascal unit
#include <dxNavBarStyles.hpp>	// Pascal unit
#include <dxNavBar.hpp>	// Pascal unit
#include <dxThemeConsts.hpp>	// Pascal unit
#include <dxThemeManager.hpp>	// Pascal unit
#include <dxUxTheme.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Dxnavbarxpviews
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TdxNavBarXP1GroupViewInfo;
class PASCALIMPLEMENTATION TdxNavBarXP1GroupViewInfo : public Dxnavbar::TdxNavBarGroupViewInfo 
{
	typedef Dxnavbar::TdxNavBarGroupViewInfo inherited;
	
public:
	virtual Graphics::TColor __fastcall BgBackColor(void);
	virtual Graphics::TColor __fastcall BgBackColor2(void);
	virtual Byte __fastcall BgAlphaBlend(void);
	virtual Byte __fastcall BgAlphaBlend2(void);
	virtual Dxnavbarstyles::TdxBarStyleGradientMode __fastcall BgGradientMode(void);
	virtual Graphics::TColor __fastcall CaptionBackColor(void);
	virtual Graphics::TColor __fastcall CaptionBackColor2(void);
	virtual Byte __fastcall CaptionAlphaBlend(void);
	virtual Byte __fastcall CaptionAlphaBlend2(void);
	virtual Dxnavbarstyles::TdxBarStyleGradientMode __fastcall CaptionGradientMode(void);
public:
	#pragma option push -w-inl
	/* TdxNavBarGroupViewInfo.Create */ inline __fastcall TdxNavBarXP1GroupViewInfo(Dxnavbar::TdxNavBarViewInfo* AViewInfo, Dxnavbarcollns::TdxNavBarGroup* AGroup) : Dxnavbar::TdxNavBarGroupViewInfo(AViewInfo, AGroup) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TdxNavBarGroupViewInfo.Destroy */ inline __fastcall virtual ~TdxNavBarXP1GroupViewInfo(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxNavBarXP1Painter;
class PASCALIMPLEMENTATION TdxNavBarXP1Painter : public Dxnavbarbaseviews::TdxNavBarFlatPainter 
{
	typedef Dxnavbarbaseviews::TdxNavBarFlatPainter inherited;
	
protected:
	virtual void __fastcall DrawGroupCaptionButton(Dxnavbar::TdxNavBarGroupViewInfo* AGroupViewInfo);
	/* virtual class method */ virtual TMetaClass* __fastcall GroupViewInfoClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall ScrollButtonsPainterClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall SelectionPainterClass(TMetaClass* vmt);
	
public:
	virtual void __fastcall AssignDefaultBackgroundStyle(void);
	virtual void __fastcall AssignDefaultGroupBackgroundStyle(void);
	virtual void __fastcall AssignDefaultGroupHeaderStyle(void);
	virtual void __fastcall AssignDefaultItemStyle(void);
	virtual void __fastcall AssignDefaultItemDisabledStyle(void);
public:
	#pragma option push -w-inl
	/* TdxNavBarPainter.Create */ inline __fastcall virtual TdxNavBarXP1Painter(Dxnavbar::TdxCustomNavBar* ANavBar) : Dxnavbarbaseviews::TdxNavBarFlatPainter(ANavBar) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TdxNavBarPainter.Destroy */ inline __fastcall virtual ~TdxNavBarXP1Painter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxNavBarXP2Painter;
class PASCALIMPLEMENTATION TdxNavBarXP2Painter : public Dxnavbarofficeviews::TdxNavBarOffice1Painter 
{
	typedef Dxnavbarofficeviews::TdxNavBarOffice1Painter inherited;
	
protected:
	virtual void __fastcall DrawGroupBackground(Dxnavbar::TdxNavBarGroupViewInfo* AGroupViewInfo);
	/* virtual class method */ virtual TMetaClass* __fastcall ButtonPainterClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall ScrollButtonsPainterClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall SelectionPainterClass(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TdxNavBarPainter.Create */ inline __fastcall virtual TdxNavBarXP2Painter(Dxnavbar::TdxCustomNavBar* ANavBar) : Dxnavbarofficeviews::TdxNavBarOffice1Painter(ANavBar) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TdxNavBarPainter.Destroy */ inline __fastcall virtual ~TdxNavBarXP2Painter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxNavBarXPExplorerBarLinkViewInfo;
class PASCALIMPLEMENTATION TdxNavBarXPExplorerBarLinkViewInfo : public Dxnavbar::TdxNavBarLinkViewInfo 
{
	typedef Dxnavbar::TdxNavBarLinkViewInfo inherited;
	
public:
	virtual Graphics::TColor __fastcall FontColor(void);
public:
	#pragma option push -w-inl
	/* TdxNavBarLinkViewInfo.Create */ inline __fastcall TdxNavBarXPExplorerBarLinkViewInfo(Dxnavbar::TdxNavBarGroupViewInfo* AGroupViewInfo, Dxnavbarcollns::TdxNavBarItemLink* ALink) : Dxnavbar::TdxNavBarLinkViewInfo(AGroupViewInfo, ALink) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxNavBarXPExplorerBarLinkViewInfo(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxNavBarXPExplorerBarGroupViewInfo;
class PASCALIMPLEMENTATION TdxNavBarXPExplorerBarGroupViewInfo : public Dxnavbar::TdxNavBarGroupViewInfo 
{
	typedef Dxnavbar::TdxNavBarGroupViewInfo inherited;
	
public:
	virtual Graphics::TColor __fastcall CaptionFontColor(void);
	virtual Graphics::TColor __fastcall CaptionSignColor(void);
public:
	#pragma option push -w-inl
	/* TdxNavBarGroupViewInfo.Create */ inline __fastcall TdxNavBarXPExplorerBarGroupViewInfo(Dxnavbar::TdxNavBarViewInfo* AViewInfo, Dxnavbarcollns::TdxNavBarGroup* AGroup) : Dxnavbar::TdxNavBarGroupViewInfo(AViewInfo, AGroup) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TdxNavBarGroupViewInfo.Destroy */ inline __fastcall virtual ~TdxNavBarXPExplorerBarGroupViewInfo(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxNavBarXPExplorerBarViewInfo;
class PASCALIMPLEMENTATION TdxNavBarXPExplorerBarViewInfo : public Dxnavbarexplorerviews::TdxNavBarExplorerBarViewInfo 
{
	typedef Dxnavbarexplorerviews::TdxNavBarExplorerBarViewInfo inherited;
	
public:
	/* virtual class method */ virtual int __fastcall GetGroupCaptionHeightAddon(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall GetGroupCaptionSignSize(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TdxNavBarViewInfo.Create */ inline __fastcall virtual TdxNavBarXPExplorerBarViewInfo(Dxnavbar::TdxNavBarPainter* APainter) : Dxnavbarexplorerviews::TdxNavBarExplorerBarViewInfo(APainter) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TdxNavBarViewInfo.Destroy */ inline __fastcall virtual ~TdxNavBarXPExplorerBarViewInfo(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxNavBarXPExplorerBarPainter;
class PASCALIMPLEMENTATION TdxNavBarXPExplorerBarPainter : public Dxnavbarexplorerviews::TdxNavBarExplorerBarPainter 
{
	typedef Dxnavbarexplorerviews::TdxNavBarExplorerBarPainter inherited;
	
protected:
	virtual void __fastcall DrawBackground(void);
	virtual void __fastcall DrawGroupBackground(Dxnavbar::TdxNavBarGroupViewInfo* AGroupViewInfo);
	virtual void __fastcall DrawGroupBorder(Dxnavbar::TdxNavBarGroupViewInfo* AGroupViewInfo);
	/* virtual class method */ virtual TMetaClass* __fastcall ViewInfoClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall GroupViewInfoClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall LinkViewInfoClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall ButtonPainterClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall SignPainterClass(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TdxNavBarPainter.Create */ inline __fastcall virtual TdxNavBarXPExplorerBarPainter(Dxnavbar::TdxCustomNavBar* ANavBar) : Dxnavbarexplorerviews::TdxNavBarExplorerBarPainter(ANavBar) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TdxNavBarPainter.Destroy */ inline __fastcall virtual ~TdxNavBarXPExplorerBarPainter(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Dxnavbarxpviews */
using namespace Dxnavbarxpviews;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// dxNavBarXPViews
