// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'dxNavBarExplorerViews.pas' rev: 6.00

#ifndef dxNavBarExplorerViewsHPP
#define dxNavBarExplorerViewsHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <dxNavBarStyles.hpp>	// Pascal unit
#include <dxNavBarCollns.hpp>	// Pascal unit
#include <dxNavBar.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Dxnavbarexplorerviews
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TdxNavBarExplorerBarViewInfo;
class PASCALIMPLEMENTATION TdxNavBarExplorerBarViewInfo : public Dxnavbar::TdxNavBarViewInfo 
{
	typedef Dxnavbar::TdxNavBarViewInfo inherited;
	
protected:
	/* virtual class method */ virtual int __fastcall GetGroupBorderWidth(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall GetGroupCaptionHeightAddon(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall GetGroupSeparatorWidth(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall GetGroupHorizontalEdge(TMetaClass* vmt);
	virtual bool __fastcall CanHasImageInGroupCaption(void);
	virtual bool __fastcall CanHasSignInGroupCaption(void);
	virtual bool __fastcall CanHasGroupViewAsIconView(void);
	virtual bool __fastcall CanHasVisibleItemsInGroup(Dxnavbarcollns::TdxNavBarGroup* AGroup);
	virtual void __fastcall RecreateInfo(void);
	virtual void __fastcall Recalculate(void);
public:
	#pragma option push -w-inl
	/* TdxNavBarViewInfo.Create */ inline __fastcall virtual TdxNavBarExplorerBarViewInfo(Dxnavbar::TdxNavBarPainter* APainter) : Dxnavbar::TdxNavBarViewInfo(APainter) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TdxNavBarViewInfo.Destroy */ inline __fastcall virtual ~TdxNavBarExplorerBarViewInfo(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxNavBarExplorerBarPainter;
class PASCALIMPLEMENTATION TdxNavBarExplorerBarPainter : public Dxnavbar::TdxNavBarPainter 
{
	typedef Dxnavbar::TdxNavBarPainter inherited;
	
protected:
	virtual void __fastcall DrawGroupBorder(Dxnavbar::TdxNavBarGroupViewInfo* AGroupViewInfo);
	/* virtual class method */ virtual TMetaClass* __fastcall ViewInfoClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall BackgroundPainterClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall ButtonPainterClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall ImagePainterClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall SignPainterClass(TMetaClass* vmt);
	
public:
	virtual void __fastcall AssignDefaultBackgroundStyle(void);
	virtual void __fastcall AssignDefaultGroupBackgroundStyle(void);
	virtual void __fastcall AssignDefaultGroupHeaderStyle(void);
	virtual void __fastcall AssignDefaultItemStyle(void);
	virtual void __fastcall AssignDefaultItemDisabledStyle(void);
	virtual void __fastcall AssignDefaultItemHotTrackedStyle(void);
	virtual void __fastcall DoGroupActivate(Dxnavbarcollns::TdxNavBarGroup* AGroup);
	virtual void __fastcall DoGroupDeactivate(Dxnavbarcollns::TdxNavBarGroup* AGroup);
	virtual bool __fastcall IsGroupActive(Dxnavbarcollns::TdxNavBarGroup* AGroup);
public:
	#pragma option push -w-inl
	/* TdxNavBarPainter.Create */ inline __fastcall virtual TdxNavBarExplorerBarPainter(Dxnavbar::TdxCustomNavBar* ANavBar) : Dxnavbar::TdxNavBarPainter(ANavBar) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TdxNavBarPainter.Destroy */ inline __fastcall virtual ~TdxNavBarExplorerBarPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxNavBarUltraFlatExplorerBarPainter;
class PASCALIMPLEMENTATION TdxNavBarUltraFlatExplorerBarPainter : public TdxNavBarExplorerBarPainter 
{
	typedef TdxNavBarExplorerBarPainter inherited;
	
protected:
	virtual void __fastcall DrawItemSelection(Dxnavbar::TdxNavBarLinkViewInfo* ALinkViewInfo);
	/* virtual class method */ virtual TMetaClass* __fastcall SelectionPainterClass(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TdxNavBarPainter.Create */ inline __fastcall virtual TdxNavBarUltraFlatExplorerBarPainter(Dxnavbar::TdxCustomNavBar* ANavBar) : TdxNavBarExplorerBarPainter(ANavBar) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TdxNavBarPainter.Destroy */ inline __fastcall virtual ~TdxNavBarUltraFlatExplorerBarPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxNavBarAdvExplorerBarLinkViewInfo;
class PASCALIMPLEMENTATION TdxNavBarAdvExplorerBarLinkViewInfo : public Dxnavbar::TdxNavBarLinkViewInfo 
{
	typedef Dxnavbar::TdxNavBarLinkViewInfo inherited;
	
public:
	virtual Graphics::TColor __fastcall FontColor(void);
public:
	#pragma option push -w-inl
	/* TdxNavBarLinkViewInfo.Create */ inline __fastcall TdxNavBarAdvExplorerBarLinkViewInfo(Dxnavbar::TdxNavBarGroupViewInfo* AGroupViewInfo, Dxnavbarcollns::TdxNavBarItemLink* ALink) : Dxnavbar::TdxNavBarLinkViewInfo(AGroupViewInfo, ALink) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxNavBarAdvExplorerBarLinkViewInfo(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxNavBarAdvExplorerBarGroupViewInfo;
class PASCALIMPLEMENTATION TdxNavBarAdvExplorerBarGroupViewInfo : public Dxnavbar::TdxNavBarGroupViewInfo 
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
	virtual Graphics::TColor __fastcall CaptionFontColor(void);
	virtual Graphics::TColor __fastcall CaptionSignColor(void);
public:
	#pragma option push -w-inl
	/* TdxNavBarGroupViewInfo.Create */ inline __fastcall TdxNavBarAdvExplorerBarGroupViewInfo(Dxnavbar::TdxNavBarViewInfo* AViewInfo, Dxnavbarcollns::TdxNavBarGroup* AGroup) : Dxnavbar::TdxNavBarGroupViewInfo(AViewInfo, AGroup) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TdxNavBarGroupViewInfo.Destroy */ inline __fastcall virtual ~TdxNavBarAdvExplorerBarGroupViewInfo(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxNavBarAdvExplorerBarViewInfo;
class PASCALIMPLEMENTATION TdxNavBarAdvExplorerBarViewInfo : public TdxNavBarExplorerBarViewInfo 
{
	typedef TdxNavBarExplorerBarViewInfo inherited;
	
protected:
	/* virtual class method */ virtual int __fastcall GetGroupCaptionHeightAddon(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall GetGroupCaptionSignSize(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TdxNavBarViewInfo.Create */ inline __fastcall virtual TdxNavBarAdvExplorerBarViewInfo(Dxnavbar::TdxNavBarPainter* APainter) : TdxNavBarExplorerBarViewInfo(APainter) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TdxNavBarViewInfo.Destroy */ inline __fastcall virtual ~TdxNavBarAdvExplorerBarViewInfo(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxNavBarAdvExplorerBarPainter;
class PASCALIMPLEMENTATION TdxNavBarAdvExplorerBarPainter : public TdxNavBarExplorerBarPainter 
{
	typedef TdxNavBarExplorerBarPainter inherited;
	
protected:
	/* virtual class method */ virtual TMetaClass* __fastcall ViewInfoClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall GroupViewInfoClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall LinkViewInfoClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall ButtonPainterClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall SignPainterClass(TMetaClass* vmt);
	
public:
	virtual void __fastcall AssignDefaultBackgroundStyle(void);
	virtual void __fastcall AssignDefaultGroupBackgroundStyle(void);
	virtual void __fastcall AssignDefaultGroupHeaderStyle(void);
	virtual void __fastcall AssignDefaultItemStyle(void);
	virtual void __fastcall AssignDefaultItemDisabledStyle(void);
public:
	#pragma option push -w-inl
	/* TdxNavBarPainter.Create */ inline __fastcall virtual TdxNavBarAdvExplorerBarPainter(Dxnavbar::TdxCustomNavBar* ANavBar) : TdxNavBarExplorerBarPainter(ANavBar) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TdxNavBarPainter.Destroy */ inline __fastcall virtual ~TdxNavBarAdvExplorerBarPainter(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Dxnavbarexplorerviews */
using namespace Dxnavbarexplorerviews;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// dxNavBarExplorerViews
