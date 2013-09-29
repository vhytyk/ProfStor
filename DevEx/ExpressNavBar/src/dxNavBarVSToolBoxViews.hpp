// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'dxNavBarVSToolBoxViews.pas' rev: 6.00

#ifndef dxNavBarVSToolBoxViewsHPP
#define dxNavBarVSToolBoxViewsHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <dxNavBarBaseViews.hpp>	// Pascal unit
#include <dxNavBarStyles.hpp>	// Pascal unit
#include <dxNavBarCollns.hpp>	// Pascal unit
#include <dxNavBar.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Dxnavbarvstoolboxviews
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TdxNavBarVSToolBoxLinkViewInfo;
class PASCALIMPLEMENTATION TdxNavBarVSToolBoxLinkViewInfo : public Dxnavbar::TdxNavBarLinkViewInfo 
{
	typedef Dxnavbar::TdxNavBarLinkViewInfo inherited;
	
public:
	virtual Types::TRect __fastcall SelectionRect();
public:
	#pragma option push -w-inl
	/* TdxNavBarLinkViewInfo.Create */ inline __fastcall TdxNavBarVSToolBoxLinkViewInfo(Dxnavbar::TdxNavBarGroupViewInfo* AGroupViewInfo, Dxnavbarcollns::TdxNavBarItemLink* ALink) : Dxnavbar::TdxNavBarLinkViewInfo(AGroupViewInfo, ALink) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxNavBarVSToolBoxLinkViewInfo(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxNavBarVSToolBoxViewInfo;
class PASCALIMPLEMENTATION TdxNavBarVSToolBoxViewInfo : public Dxnavbarbaseviews::TdxNavBarBaseViewInfo 
{
	typedef Dxnavbarbaseviews::TdxNavBarBaseViewInfo inherited;
	
protected:
	/* virtual class method */ virtual int __fastcall GetGroupCaptionHeightAddon(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall GetGroupSeparatorWidth(TMetaClass* vmt);
	/* virtual class method */ virtual int __fastcall GetGroupCaptionSeparatorWidth(TMetaClass* vmt);
	virtual bool __fastcall CanHasScrollButtonInGroupCaption(void);
	virtual bool __fastcall CanLinksUseLargeImages(void);
	virtual Types::TRect __fastcall GetTopScrollButtonRect();
	virtual Types::TRect __fastcall GetBottomScrollButtonRect();
	virtual Types::TRect __fastcall GetLinkHintRect(Dxnavbarcollns::TdxNavBarItemLink* ALink);
	virtual AnsiString __fastcall GetLinkHintText(Dxnavbarcollns::TdxNavBarItemLink* ALink);
	
public:
	virtual Dxnavbar::TdxNavBarLinkViewInfo* __fastcall GetLinkViewInfoAtSelectedPos(const Types::TPoint &pt);
	virtual int __fastcall HintDelay(void);
public:
	#pragma option push -w-inl
	/* TdxNavBarViewInfo.Create */ inline __fastcall virtual TdxNavBarVSToolBoxViewInfo(Dxnavbar::TdxNavBarPainter* APainter) : Dxnavbarbaseviews::TdxNavBarBaseViewInfo(APainter) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TdxNavBarViewInfo.Destroy */ inline __fastcall virtual ~TdxNavBarVSToolBoxViewInfo(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxNavBarVSToolBoxPainter;
class PASCALIMPLEMENTATION TdxNavBarVSToolBoxPainter : public Dxnavbarbaseviews::TdxNavBarFlatPainter 
{
	typedef Dxnavbarbaseviews::TdxNavBarFlatPainter inherited;
	
protected:
	virtual void __fastcall DrawLinkHintWindow(void);
	/* virtual class method */ virtual TMetaClass* __fastcall ViewInfoClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall LinkViewInfoClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall ButtonPainterClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall SelectionPainterClass(TMetaClass* vmt);
	
public:
	virtual void __fastcall AssignDefaultBackgroundStyle(void);
	virtual void __fastcall AssignDefaultGroupBackgroundStyle(void);
	virtual void __fastcall AssignDefaultGroupHeaderStyle(void);
	virtual void __fastcall AssignDefaultItemStyle(void);
	virtual void __fastcall AssignDefaultItemDisabledStyle(void);
public:
	#pragma option push -w-inl
	/* TdxNavBarPainter.Create */ inline __fastcall virtual TdxNavBarVSToolBoxPainter(Dxnavbar::TdxCustomNavBar* ANavBar) : Dxnavbarbaseviews::TdxNavBarFlatPainter(ANavBar) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TdxNavBarPainter.Destroy */ inline __fastcall virtual ~TdxNavBarVSToolBoxPainter(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Dxnavbarvstoolboxviews */
using namespace Dxnavbarvstoolboxviews;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// dxNavBarVSToolBoxViews
