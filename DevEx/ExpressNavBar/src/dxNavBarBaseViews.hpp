// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'dxNavBarBaseViews.pas' rev: 6.00

#ifndef dxNavBarBaseViewsHPP
#define dxNavBarBaseViewsHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <dxNavBarStyles.hpp>	// Pascal unit
#include <dxNavBar.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Dxnavbarbaseviews
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TdxNavBarBaseViewInfo;
class PASCALIMPLEMENTATION TdxNavBarBaseViewInfo : public Dxnavbar::TdxNavBarViewInfo 
{
	typedef Dxnavbar::TdxNavBarViewInfo inherited;
	
protected:
	virtual void __fastcall Recalculate(void);
public:
	#pragma option push -w-inl
	/* TdxNavBarViewInfo.Create */ inline __fastcall virtual TdxNavBarBaseViewInfo(Dxnavbar::TdxNavBarPainter* APainter) : Dxnavbar::TdxNavBarViewInfo(APainter) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TdxNavBarViewInfo.Destroy */ inline __fastcall virtual ~TdxNavBarBaseViewInfo(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxNavBarBasePainter;
class PASCALIMPLEMENTATION TdxNavBarBasePainter : public Dxnavbar::TdxNavBarPainter 
{
	typedef Dxnavbar::TdxNavBarPainter inherited;
	
protected:
	virtual void __fastcall DrawItemSelection(Dxnavbar::TdxNavBarLinkViewInfo* ALinkViewInfo);
	/* virtual class method */ virtual TMetaClass* __fastcall ViewInfoClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall BackgroundPainterClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall ButtonPainterClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall ScrollButtonsPainterClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall ImagePainterClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall SelectionPainterClass(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TdxNavBarPainter.Create */ inline __fastcall virtual TdxNavBarBasePainter(Dxnavbar::TdxCustomNavBar* ANavBar) : Dxnavbar::TdxNavBarPainter(ANavBar) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TdxNavBarPainter.Destroy */ inline __fastcall virtual ~TdxNavBarBasePainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxNavBarFlatPainter;
class PASCALIMPLEMENTATION TdxNavBarFlatPainter : public TdxNavBarBasePainter 
{
	typedef TdxNavBarBasePainter inherited;
	
protected:
	/* virtual class method */ virtual TMetaClass* __fastcall ButtonPainterClass(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TdxNavBarPainter.Create */ inline __fastcall virtual TdxNavBarFlatPainter(Dxnavbar::TdxCustomNavBar* ANavBar) : TdxNavBarBasePainter(ANavBar) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TdxNavBarPainter.Destroy */ inline __fastcall virtual ~TdxNavBarFlatPainter(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Dxnavbarbaseviews */
using namespace Dxnavbarbaseviews;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// dxNavBarBaseViews
