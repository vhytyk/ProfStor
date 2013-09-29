// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'dxDockZones.pas' rev: 6.00

#ifndef dxDockZonesHPP
#define dxDockZonesHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <dxDockControl.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Dxdockzones
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TdxLeftZone;
class PASCALIMPLEMENTATION TdxLeftZone : public Dxdockcontrol::TdxZone 
{
	typedef Dxdockcontrol::TdxZone inherited;
	
protected:
	virtual Dxdockcontrol::TdxZoneDirection __fastcall GetDirection(void);
	virtual Dxdockcontrol::TdxDockingType __fastcall GetDockType(void);
	virtual Types::TRect __fastcall GetRectangle();
	virtual bool __fastcall CanConstrainedResize(int NewWidth, int NewHeight);
	virtual void __fastcall DoResize(const Types::TPoint &StartPoint, const Types::TPoint &EndPoint);
	
public:
	virtual bool __fastcall CanResize(const Types::TPoint &StartPoint, const Types::TPoint &EndPoint);
	virtual Types::TRect __fastcall GetDockingSelection(Dxdockcontrol::TdxCustomDockControl* AControl);
	virtual Types::TRect __fastcall GetResizingSelection(const Types::TPoint &pt);
	/* virtual class method */ virtual bool __fastcall ValidateDockZone(TMetaClass* vmt, Dxdockcontrol::TdxCustomDockControl* AOwner, Dxdockcontrol::TdxCustomDockControl* AControl);
	/* virtual class method */ virtual bool __fastcall ValidateResizeZone(TMetaClass* vmt, Dxdockcontrol::TdxCustomDockControl* AOwner, Dxdockcontrol::TdxCustomDockControl* AControl);
public:
	#pragma option push -w-inl
	/* TdxZone.Create */ inline __fastcall TdxLeftZone(Dxdockcontrol::TdxCustomDockControl* AOwner, int AWidth) : Dxdockcontrol::TdxZone(AOwner, AWidth) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxLeftZone(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxRightZone;
class PASCALIMPLEMENTATION TdxRightZone : public Dxdockcontrol::TdxZone 
{
	typedef Dxdockcontrol::TdxZone inherited;
	
protected:
	virtual Dxdockcontrol::TdxZoneDirection __fastcall GetDirection(void);
	virtual Dxdockcontrol::TdxDockingType __fastcall GetDockType(void);
	virtual Types::TRect __fastcall GetRectangle();
	virtual bool __fastcall CanConstrainedResize(int NewWidth, int NewHeight);
	virtual void __fastcall DoResize(const Types::TPoint &StartPoint, const Types::TPoint &EndPoint);
	
public:
	virtual bool __fastcall CanResize(const Types::TPoint &StartPoint, const Types::TPoint &EndPoint);
	virtual Types::TRect __fastcall GetDockingSelection(Dxdockcontrol::TdxCustomDockControl* AControl);
	virtual Types::TRect __fastcall GetResizingSelection(const Types::TPoint &pt);
	/* virtual class method */ virtual bool __fastcall ValidateDockZone(TMetaClass* vmt, Dxdockcontrol::TdxCustomDockControl* AOwner, Dxdockcontrol::TdxCustomDockControl* AControl);
	/* virtual class method */ virtual bool __fastcall ValidateResizeZone(TMetaClass* vmt, Dxdockcontrol::TdxCustomDockControl* AOwner, Dxdockcontrol::TdxCustomDockControl* AControl);
public:
	#pragma option push -w-inl
	/* TdxZone.Create */ inline __fastcall TdxRightZone(Dxdockcontrol::TdxCustomDockControl* AOwner, int AWidth) : Dxdockcontrol::TdxZone(AOwner, AWidth) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxRightZone(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxTopZone;
class PASCALIMPLEMENTATION TdxTopZone : public Dxdockcontrol::TdxZone 
{
	typedef Dxdockcontrol::TdxZone inherited;
	
protected:
	virtual Dxdockcontrol::TdxZoneDirection __fastcall GetDirection(void);
	virtual Dxdockcontrol::TdxDockingType __fastcall GetDockType(void);
	virtual Types::TRect __fastcall GetRectangle();
	virtual bool __fastcall CanConstrainedResize(int NewWidth, int NewHeight);
	virtual void __fastcall DoResize(const Types::TPoint &StartPoint, const Types::TPoint &EndPoint);
	
public:
	virtual bool __fastcall CanResize(const Types::TPoint &StartPoint, const Types::TPoint &EndPoint);
	virtual Types::TRect __fastcall GetDockingSelection(Dxdockcontrol::TdxCustomDockControl* AControl);
	virtual Types::TRect __fastcall GetResizingSelection(const Types::TPoint &pt);
	/* virtual class method */ virtual bool __fastcall ValidateDockZone(TMetaClass* vmt, Dxdockcontrol::TdxCustomDockControl* AOwner, Dxdockcontrol::TdxCustomDockControl* AControl);
	/* virtual class method */ virtual bool __fastcall ValidateResizeZone(TMetaClass* vmt, Dxdockcontrol::TdxCustomDockControl* AOwner, Dxdockcontrol::TdxCustomDockControl* AControl);
public:
	#pragma option push -w-inl
	/* TdxZone.Create */ inline __fastcall TdxTopZone(Dxdockcontrol::TdxCustomDockControl* AOwner, int AWidth) : Dxdockcontrol::TdxZone(AOwner, AWidth) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxTopZone(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxBottomZone;
class PASCALIMPLEMENTATION TdxBottomZone : public Dxdockcontrol::TdxZone 
{
	typedef Dxdockcontrol::TdxZone inherited;
	
protected:
	virtual Dxdockcontrol::TdxZoneDirection __fastcall GetDirection(void);
	virtual Dxdockcontrol::TdxDockingType __fastcall GetDockType(void);
	virtual Types::TRect __fastcall GetRectangle();
	virtual bool __fastcall CanConstrainedResize(int NewWidth, int NewHeight);
	virtual void __fastcall DoResize(const Types::TPoint &StartPoint, const Types::TPoint &EndPoint);
	
public:
	virtual bool __fastcall CanResize(const Types::TPoint &StartPoint, const Types::TPoint &EndPoint);
	virtual Types::TRect __fastcall GetDockingSelection(Dxdockcontrol::TdxCustomDockControl* AControl);
	virtual Types::TRect __fastcall GetResizingSelection(const Types::TPoint &pt);
	/* virtual class method */ virtual bool __fastcall ValidateDockZone(TMetaClass* vmt, Dxdockcontrol::TdxCustomDockControl* AOwner, Dxdockcontrol::TdxCustomDockControl* AControl);
	/* virtual class method */ virtual bool __fastcall ValidateResizeZone(TMetaClass* vmt, Dxdockcontrol::TdxCustomDockControl* AOwner, Dxdockcontrol::TdxCustomDockControl* AControl);
public:
	#pragma option push -w-inl
	/* TdxZone.Create */ inline __fastcall TdxBottomZone(Dxdockcontrol::TdxCustomDockControl* AOwner, int AWidth) : Dxdockcontrol::TdxZone(AOwner, AWidth) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxBottomZone(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxClientZone;
class PASCALIMPLEMENTATION TdxClientZone : public Dxdockcontrol::TdxZone 
{
	typedef Dxdockcontrol::TdxZone inherited;
	
protected:
	virtual Dxdockcontrol::TdxZoneDirection __fastcall GetDirection(void);
	virtual Dxdockcontrol::TdxDockingType __fastcall GetDockType(void);
	virtual Types::TRect __fastcall GetRectangle();
	
public:
	/* virtual class method */ virtual bool __fastcall ValidateDockZone(TMetaClass* vmt, Dxdockcontrol::TdxCustomDockControl* AOwner, Dxdockcontrol::TdxCustomDockControl* AControl);
public:
	#pragma option push -w-inl
	/* TdxZone.Create */ inline __fastcall TdxClientZone(Dxdockcontrol::TdxCustomDockControl* AOwner, int AWidth) : Dxdockcontrol::TdxZone(AOwner, AWidth) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxClientZone(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxAutoHideLeftZone;
class PASCALIMPLEMENTATION TdxAutoHideLeftZone : public TdxLeftZone 
{
	typedef TdxLeftZone inherited;
	
public:
	virtual bool __fastcall CanResize(const Types::TPoint &StartPoint, const Types::TPoint &EndPoint);
	/* virtual class method */ virtual bool __fastcall ValidateResizeZone(TMetaClass* vmt, Dxdockcontrol::TdxCustomDockControl* AOwner, Dxdockcontrol::TdxCustomDockControl* AControl);
public:
	#pragma option push -w-inl
	/* TdxZone.Create */ inline __fastcall TdxAutoHideLeftZone(Dxdockcontrol::TdxCustomDockControl* AOwner, int AWidth) : TdxLeftZone(AOwner, AWidth) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxAutoHideLeftZone(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxAutoHideRightZone;
class PASCALIMPLEMENTATION TdxAutoHideRightZone : public TdxRightZone 
{
	typedef TdxRightZone inherited;
	
public:
	virtual bool __fastcall CanResize(const Types::TPoint &StartPoint, const Types::TPoint &EndPoint);
	/* virtual class method */ virtual bool __fastcall ValidateResizeZone(TMetaClass* vmt, Dxdockcontrol::TdxCustomDockControl* AOwner, Dxdockcontrol::TdxCustomDockControl* AControl);
public:
	#pragma option push -w-inl
	/* TdxZone.Create */ inline __fastcall TdxAutoHideRightZone(Dxdockcontrol::TdxCustomDockControl* AOwner, int AWidth) : TdxRightZone(AOwner, AWidth) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxAutoHideRightZone(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxAutoHideTopZone;
class PASCALIMPLEMENTATION TdxAutoHideTopZone : public TdxTopZone 
{
	typedef TdxTopZone inherited;
	
public:
	virtual bool __fastcall CanResize(const Types::TPoint &StartPoint, const Types::TPoint &EndPoint);
	/* virtual class method */ virtual bool __fastcall ValidateResizeZone(TMetaClass* vmt, Dxdockcontrol::TdxCustomDockControl* AOwner, Dxdockcontrol::TdxCustomDockControl* AControl);
public:
	#pragma option push -w-inl
	/* TdxZone.Create */ inline __fastcall TdxAutoHideTopZone(Dxdockcontrol::TdxCustomDockControl* AOwner, int AWidth) : TdxTopZone(AOwner, AWidth) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxAutoHideTopZone(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxAutoHideBottomZone;
class PASCALIMPLEMENTATION TdxAutoHideBottomZone : public TdxBottomZone 
{
	typedef TdxBottomZone inherited;
	
public:
	virtual bool __fastcall CanResize(const Types::TPoint &StartPoint, const Types::TPoint &EndPoint);
	/* virtual class method */ virtual bool __fastcall ValidateResizeZone(TMetaClass* vmt, Dxdockcontrol::TdxCustomDockControl* AOwner, Dxdockcontrol::TdxCustomDockControl* AControl);
public:
	#pragma option push -w-inl
	/* TdxZone.Create */ inline __fastcall TdxAutoHideBottomZone(Dxdockcontrol::TdxCustomDockControl* AOwner, int AWidth) : TdxBottomZone(AOwner, AWidth) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxAutoHideBottomZone(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxAutoSizeLeftZone;
class PASCALIMPLEMENTATION TdxAutoSizeLeftZone : public TdxLeftZone 
{
	typedef TdxLeftZone inherited;
	
public:
	/* virtual class method */ virtual bool __fastcall ValidateResizeZone(TMetaClass* vmt, Dxdockcontrol::TdxCustomDockControl* AOwner, Dxdockcontrol::TdxCustomDockControl* AControl);
public:
	#pragma option push -w-inl
	/* TdxZone.Create */ inline __fastcall TdxAutoSizeLeftZone(Dxdockcontrol::TdxCustomDockControl* AOwner, int AWidth) : TdxLeftZone(AOwner, AWidth) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxAutoSizeLeftZone(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxAutoSizeRightZone;
class PASCALIMPLEMENTATION TdxAutoSizeRightZone : public TdxRightZone 
{
	typedef TdxRightZone inherited;
	
public:
	/* virtual class method */ virtual bool __fastcall ValidateResizeZone(TMetaClass* vmt, Dxdockcontrol::TdxCustomDockControl* AOwner, Dxdockcontrol::TdxCustomDockControl* AControl);
public:
	#pragma option push -w-inl
	/* TdxZone.Create */ inline __fastcall TdxAutoSizeRightZone(Dxdockcontrol::TdxCustomDockControl* AOwner, int AWidth) : TdxRightZone(AOwner, AWidth) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxAutoSizeRightZone(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxAutoSizeTopZone;
class PASCALIMPLEMENTATION TdxAutoSizeTopZone : public TdxTopZone 
{
	typedef TdxTopZone inherited;
	
public:
	/* virtual class method */ virtual bool __fastcall ValidateResizeZone(TMetaClass* vmt, Dxdockcontrol::TdxCustomDockControl* AOwner, Dxdockcontrol::TdxCustomDockControl* AControl);
public:
	#pragma option push -w-inl
	/* TdxZone.Create */ inline __fastcall TdxAutoSizeTopZone(Dxdockcontrol::TdxCustomDockControl* AOwner, int AWidth) : TdxTopZone(AOwner, AWidth) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxAutoSizeTopZone(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxAutoSizeBottomZone;
class PASCALIMPLEMENTATION TdxAutoSizeBottomZone : public TdxBottomZone 
{
	typedef TdxBottomZone inherited;
	
public:
	/* virtual class method */ virtual bool __fastcall ValidateResizeZone(TMetaClass* vmt, Dxdockcontrol::TdxCustomDockControl* AOwner, Dxdockcontrol::TdxCustomDockControl* AControl);
public:
	#pragma option push -w-inl
	/* TdxZone.Create */ inline __fastcall TdxAutoSizeBottomZone(Dxdockcontrol::TdxCustomDockControl* AOwner, int AWidth) : TdxBottomZone(AOwner, AWidth) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxAutoSizeBottomZone(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxAutoSizeClientZone;
class PASCALIMPLEMENTATION TdxAutoSizeClientZone : public TdxClientZone 
{
	typedef TdxClientZone inherited;
	
public:
	virtual Types::TRect __fastcall GetDockingSelection(Dxdockcontrol::TdxCustomDockControl* AControl);
public:
	#pragma option push -w-inl
	/* TdxZone.Create */ inline __fastcall TdxAutoSizeClientZone(Dxdockcontrol::TdxCustomDockControl* AOwner, int AWidth) : TdxClientZone(AOwner, AWidth) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxAutoSizeClientZone(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxTabContainerZone;
class PASCALIMPLEMENTATION TdxTabContainerZone : public TdxClientZone 
{
	typedef TdxClientZone inherited;
	
private:
	Dxdockcontrol::TdxTabContainerDockSite* __fastcall GetTabContainer(void);
	
protected:
	virtual int __fastcall GetDockIndex(void);
	virtual Types::TRect __fastcall GetTabRect(Dxdockcontrol::TdxCustomDockControl* AControl);
	virtual Types::TRect __fastcall GetTabsRect();
	virtual void __fastcall DrawDockingSelection(HDC DC, Dxdockcontrol::TdxCustomDockControl* AControl, const Types::TPoint &pt);
	
public:
	__fastcall TdxTabContainerZone(Dxdockcontrol::TdxTabContainerDockSite* AControl);
	__property Dxdockcontrol::TdxTabContainerDockSite* TabContainer = {read=GetTabContainer};
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxTabContainerZone(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxTabContainerTabZone;
class PASCALIMPLEMENTATION TdxTabContainerTabZone : public TdxTabContainerZone 
{
	typedef TdxTabContainerZone inherited;
	
private:
	int FDockIndex;
	
protected:
	virtual int __fastcall GetDockIndex(void);
	
public:
	__fastcall TdxTabContainerTabZone(Dxdockcontrol::TdxTabContainerDockSite* AControl, int ADockIndex);
	virtual bool __fastcall IsZonePoint(const Types::TPoint &pt);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxTabContainerTabZone(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxHorizContainerZone;
class PASCALIMPLEMENTATION TdxHorizContainerZone : public TdxRightZone 
{
	typedef TdxRightZone inherited;
	
protected:
	virtual void __fastcall DoResize(const Types::TPoint &StartPoint, const Types::TPoint &EndPoint);
	
public:
	virtual bool __fastcall CanResize(const Types::TPoint &StartPoint, const Types::TPoint &EndPoint);
public:
	#pragma option push -w-inl
	/* TdxZone.Create */ inline __fastcall TdxHorizContainerZone(Dxdockcontrol::TdxCustomDockControl* AOwner, int AWidth) : TdxRightZone(AOwner, AWidth) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxHorizContainerZone(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxVertContainerZone;
class PASCALIMPLEMENTATION TdxVertContainerZone : public TdxBottomZone 
{
	typedef TdxBottomZone inherited;
	
protected:
	virtual void __fastcall DoResize(const Types::TPoint &StartPoint, const Types::TPoint &EndPoint);
	
public:
	virtual bool __fastcall CanResize(const Types::TPoint &StartPoint, const Types::TPoint &EndPoint);
public:
	#pragma option push -w-inl
	/* TdxZone.Create */ inline __fastcall TdxVertContainerZone(Dxdockcontrol::TdxCustomDockControl* AOwner, int AWidth) : TdxBottomZone(AOwner, AWidth) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxVertContainerZone(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxDockPanelClientZone;
class PASCALIMPLEMENTATION TdxDockPanelClientZone : public TdxClientZone 
{
	typedef TdxClientZone inherited;
	
protected:
	virtual void __fastcall DrawDockingSelection(HDC DC, Dxdockcontrol::TdxCustomDockControl* AControl, const Types::TPoint &pt);
public:
	#pragma option push -w-inl
	/* TdxZone.Create */ inline __fastcall TdxDockPanelClientZone(Dxdockcontrol::TdxCustomDockControl* AOwner, int AWidth) : TdxClientZone(AOwner, AWidth) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxDockPanelClientZone(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Dxdockzones */
using namespace Dxdockzones;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// dxDockZones
