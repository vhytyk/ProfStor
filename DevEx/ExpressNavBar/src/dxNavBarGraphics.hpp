// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'dxNavBarGraphics.pas' rev: 6.00

#ifndef dxNavBarGraphicsHPP
#define dxNavBarGraphicsHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <dxNavBarStyles.hpp>	// Pascal unit
#include <dxNavBar.hpp>	// Pascal unit
#include <dxThemeConsts.hpp>	// Pascal unit
#include <dxThemeManager.hpp>	// Pascal unit
#include <dxUxTheme.hpp>	// Pascal unit
#include <dxGDIPlusClasses.hpp>	// Pascal unit
#include <dxGDIPlusAPI.hpp>	// Pascal unit
#include <jpeg.hpp>	// Pascal unit
#include <ImgList.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <CommCtrl.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Dxnavbargraphics
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TdxNavBarBackgroundPainter;
class PASCALIMPLEMENTATION TdxNavBarBackgroundPainter : public Dxnavbar::TdxBaseBackgroundPainter 
{
	typedef Dxnavbar::TdxBaseBackgroundPainter inherited;
	
protected:
	/*         class method */ static void __fastcall DrawPicture(TMetaClass* vmt, Graphics::TCanvas* ACanvas, const Types::TRect &R, Graphics::TPicture* APicture);
	/* virtual class method */ virtual void __fastcall InternalDrawBackground(TMetaClass* vmt, Graphics::TCanvas* ACanvas, const Types::TRect &R, Graphics::TPicture* APicture, bool AEraseBackground, Graphics::TColor AColor1, Graphics::TColor AColor2, Byte AAlphaBlend1, Byte AAlphaBlend2, Dxnavbarstyles::TdxBarStyleGradientMode AGradientMode);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TdxNavBarBackgroundPainter(void) : Dxnavbar::TdxBaseBackgroundPainter() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxNavBarBackgroundPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxNavBarImagePainter;
class PASCALIMPLEMENTATION TdxNavBarImagePainter : public Dxnavbar::TdxBaseImagePainter 
{
	typedef Dxnavbar::TdxBaseImagePainter inherited;
	
protected:
	/*         class method */ static unsigned __fastcall GetRGBColor(TMetaClass* vmt, Graphics::TColor Value);
	/* virtual class method */ virtual void __fastcall InternalDrawImage(TMetaClass* vmt, Graphics::TCanvas* ACanvas, Controls::TImageList* AImageList, int AImageIndex, const Types::TRect &R);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TdxNavBarImagePainter(void) : Dxnavbar::TdxBaseImagePainter() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxNavBarImagePainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxNavBarSelectionPainter;
class PASCALIMPLEMENTATION TdxNavBarSelectionPainter : public Dxnavbar::TdxBaseSelectionPainter 
{
	typedef Dxnavbar::TdxBaseSelectionPainter inherited;
	
protected:
	/* virtual class method */ virtual void __fastcall InternalDrawSelection(TMetaClass* vmt, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, Graphics::TColor ABackColor, Dxnavbar::TdxNavBarObjectStates AState);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TdxNavBarSelectionPainter(void) : Dxnavbar::TdxBaseSelectionPainter() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxNavBarSelectionPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxNavBarUltraFlatSelectionPainter;
class PASCALIMPLEMENTATION TdxNavBarUltraFlatSelectionPainter : public Dxnavbar::TdxBaseSelectionPainter 
{
	typedef Dxnavbar::TdxBaseSelectionPainter inherited;
	
protected:
	/*         class method */ static Graphics::TColor __fastcall FlatBarItemPressedBackColor(TMetaClass* vmt);
	/*         class method */ static Graphics::TColor __fastcall FlatBarItemHighLightBackColor(TMetaClass* vmt);
	/* virtual class method */ virtual void __fastcall InternalDrawSelection(TMetaClass* vmt, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, Graphics::TColor ABackColor, Dxnavbar::TdxNavBarObjectStates AState);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TdxNavBarUltraFlatSelectionPainter(void) : Dxnavbar::TdxBaseSelectionPainter() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxNavBarUltraFlatSelectionPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxNavBarVSToolBoxSelectionPainter;
class PASCALIMPLEMENTATION TdxNavBarVSToolBoxSelectionPainter : public Dxnavbar::TdxBaseSelectionPainter 
{
	typedef Dxnavbar::TdxBaseSelectionPainter inherited;
	
protected:
	/* virtual class method */ virtual void __fastcall InternalDrawSelection(TMetaClass* vmt, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, Graphics::TColor ABackColor, Dxnavbar::TdxNavBarObjectStates AState);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TdxNavBarVSToolBoxSelectionPainter(void) : Dxnavbar::TdxBaseSelectionPainter() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxNavBarVSToolBoxSelectionPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxNavBarExplorerBarSignPainter;
class PASCALIMPLEMENTATION TdxNavBarExplorerBarSignPainter : public Dxnavbar::TdxBaseSignPainter 
{
	typedef Dxnavbar::TdxBaseSignPainter inherited;
	
protected:
	/* virtual class method */ virtual void __fastcall DrawSignSelection(TMetaClass* vmt, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, Graphics::TColor AForeColor, Graphics::TColor ABackColor, Dxnavbar::TdxNavBarObjectStates AState);
	/* virtual class method */ virtual void __fastcall InternalDrawSign(TMetaClass* vmt, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, Graphics::TColor AForeColor, Graphics::TColor ABackColor, Dxnavbar::TdxNavBarObjectStates AState);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TdxNavBarExplorerBarSignPainter(void) : Dxnavbar::TdxBaseSignPainter() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxNavBarExplorerBarSignPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxNavBarAdvExplorerBarSignPainter;
class PASCALIMPLEMENTATION TdxNavBarAdvExplorerBarSignPainter : public TdxNavBarExplorerBarSignPainter 
{
	typedef TdxNavBarExplorerBarSignPainter inherited;
	
protected:
	/* virtual class method */ virtual void __fastcall DrawSignSelection(TMetaClass* vmt, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, Graphics::TColor AForeColor, Graphics::TColor ABackColor, Dxnavbar::TdxNavBarObjectStates AState);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TdxNavBarAdvExplorerBarSignPainter(void) : TdxNavBarExplorerBarSignPainter() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxNavBarAdvExplorerBarSignPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxNavBarHintPainter;
class PASCALIMPLEMENTATION TdxNavBarHintPainter : public Dxnavbar::TdxBaseHintPainter 
{
	typedef Dxnavbar::TdxBaseHintPainter inherited;
	
protected:
	/* virtual class method */ virtual void __fastcall InternalDrawHint(TMetaClass* vmt, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, AnsiString AHint, Graphics::TPicture* APicture, Graphics::TColor AColor1, Graphics::TColor AColor2, Byte AAlphaBlend1, Byte AAlphaBlend2, Dxnavbarstyles::TdxBarStyleGradientMode AGradientMode, Graphics::TFont* AFont);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TdxNavBarHintPainter(void) : Dxnavbar::TdxBaseHintPainter() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxNavBarHintPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxNavBarButtonPainter;
class PASCALIMPLEMENTATION TdxNavBarButtonPainter : public Dxnavbar::TdxBaseButtonPainter 
{
	typedef Dxnavbar::TdxBaseButtonPainter inherited;
	
protected:
	/* virtual class method */ virtual void __fastcall InternalDrawButton(TMetaClass* vmt, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, Graphics::TPicture* APicture, Graphics::TColor AColor1, Graphics::TColor AColor2, Byte AAlphaBlend1, Byte AAlphaBlend2, Dxnavbarstyles::TdxBarStyleGradientMode AGradientMode, Dxnavbar::TdxNavBarObjectStates AState);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TdxNavBarButtonPainter(void) : Dxnavbar::TdxBaseButtonPainter() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxNavBarButtonPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxNavBarFlatButtonPainter;
class PASCALIMPLEMENTATION TdxNavBarFlatButtonPainter : public Dxnavbar::TdxBaseButtonPainter 
{
	typedef Dxnavbar::TdxBaseButtonPainter inherited;
	
protected:
	/* virtual class method */ virtual void __fastcall InternalDrawButton(TMetaClass* vmt, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, Graphics::TPicture* APicture, Graphics::TColor AColor1, Graphics::TColor AColor2, Byte AAlphaBlend1, Byte AAlphaBlend2, Dxnavbarstyles::TdxBarStyleGradientMode AGradientMode, Dxnavbar::TdxNavBarObjectStates AState);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TdxNavBarFlatButtonPainter(void) : Dxnavbar::TdxBaseButtonPainter() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxNavBarFlatButtonPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxNavBarVSToolBoxButtonPainter;
class PASCALIMPLEMENTATION TdxNavBarVSToolBoxButtonPainter : public Dxnavbar::TdxBaseButtonPainter 
{
	typedef Dxnavbar::TdxBaseButtonPainter inherited;
	
protected:
	/* virtual class method */ virtual void __fastcall InternalDrawButton(TMetaClass* vmt, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, Graphics::TPicture* APicture, Graphics::TColor AColor1, Graphics::TColor AColor2, Byte AAlphaBlend1, Byte AAlphaBlend2, Dxnavbarstyles::TdxBarStyleGradientMode AGradientMode, Dxnavbar::TdxNavBarObjectStates AState);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TdxNavBarVSToolBoxButtonPainter(void) : Dxnavbar::TdxBaseButtonPainter() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxNavBarVSToolBoxButtonPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxNavBarOfficeButtonPainter;
class PASCALIMPLEMENTATION TdxNavBarOfficeButtonPainter : public Dxnavbar::TdxBaseButtonPainter 
{
	typedef Dxnavbar::TdxBaseButtonPainter inherited;
	
protected:
	/* virtual class method */ virtual void __fastcall InternalDrawButton(TMetaClass* vmt, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, Graphics::TPicture* APicture, Graphics::TColor AColor1, Graphics::TColor AColor2, Byte AAlphaBlend1, Byte AAlphaBlend2, Dxnavbarstyles::TdxBarStyleGradientMode AGradientMode, Dxnavbar::TdxNavBarObjectStates AState);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TdxNavBarOfficeButtonPainter(void) : Dxnavbar::TdxBaseButtonPainter() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxNavBarOfficeButtonPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxNavBarExplorerButtonPainter;
class PASCALIMPLEMENTATION TdxNavBarExplorerButtonPainter : public Dxnavbar::TdxBaseButtonPainter 
{
	typedef Dxnavbar::TdxBaseButtonPainter inherited;
	
protected:
	/* virtual class method */ virtual void __fastcall InternalDrawButton(TMetaClass* vmt, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, Graphics::TPicture* APicture, Graphics::TColor AColor1, Graphics::TColor AColor2, Byte AAlphaBlend1, Byte AAlphaBlend2, Dxnavbarstyles::TdxBarStyleGradientMode AGradientMode, Dxnavbar::TdxNavBarObjectStates AState);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TdxNavBarExplorerButtonPainter(void) : Dxnavbar::TdxBaseButtonPainter() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxNavBarExplorerButtonPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxNavBarAdvExplorerButtonPainter;
class PASCALIMPLEMENTATION TdxNavBarAdvExplorerButtonPainter : public Dxnavbar::TdxBaseButtonPainter 
{
	typedef Dxnavbar::TdxBaseButtonPainter inherited;
	
protected:
	/* virtual class method */ virtual void __fastcall InternalDrawButton(TMetaClass* vmt, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, Graphics::TPicture* APicture, Graphics::TColor AColor1, Graphics::TColor AColor2, Byte AAlphaBlend1, Byte AAlphaBlend2, Dxnavbarstyles::TdxBarStyleGradientMode AGradientMode, Dxnavbar::TdxNavBarObjectStates AState);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TdxNavBarAdvExplorerButtonPainter(void) : Dxnavbar::TdxBaseButtonPainter() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxNavBarAdvExplorerButtonPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxNavBarScrollButtonsPainter;
class PASCALIMPLEMENTATION TdxNavBarScrollButtonsPainter : public Dxnavbar::TdxBaseScrollButtonsPainter 
{
	typedef Dxnavbar::TdxBaseScrollButtonsPainter inherited;
	
protected:
	/* virtual class method */ virtual void __fastcall InternalDrawBottomButton(TMetaClass* vmt, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, TMetaClass* AButtonPainterClass, Graphics::TColor AColor1, Graphics::TColor AColor2, Byte AAlphaBlend1, Byte AAlphaBlend2, Dxnavbarstyles::TdxBarStyleGradientMode AGradientMode, Dxnavbar::TdxNavBarObjectStates AState);
	/* virtual class method */ virtual void __fastcall InternalDrawTopButton(TMetaClass* vmt, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, TMetaClass* AButtonPainterClass, Graphics::TColor AColor1, Graphics::TColor AColor2, Byte AAlphaBlend1, Byte AAlphaBlend2, Dxnavbarstyles::TdxBarStyleGradientMode AGradientMode, Dxnavbar::TdxNavBarObjectStates AState);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TdxNavBarScrollButtonsPainter(void) : Dxnavbar::TdxBaseScrollButtonsPainter() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxNavBarScrollButtonsPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxNavBarDropTargetLinkPainter;
class PASCALIMPLEMENTATION TdxNavBarDropTargetLinkPainter : public Dxnavbar::TdxBaseDropTargetLinkPainter 
{
	typedef Dxnavbar::TdxBaseDropTargetLinkPainter inherited;
	
protected:
	/* virtual class method */ virtual void __fastcall InternalDrawTargetLink(TMetaClass* vmt, Graphics::TCanvas* ACanvas, const Types::TPoint &pt1, const Types::TPoint &pt2, const Types::TPoint &pt3, const Types::TPoint &pt4, const Types::TPoint &pt5, const Types::TPoint &pt6, Graphics::TColor AColor);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TdxNavBarDropTargetLinkPainter(void) : Dxnavbar::TdxBaseDropTargetLinkPainter() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxNavBarDropTargetLinkPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxNavBarDropTargetGroupPainter;
class PASCALIMPLEMENTATION TdxNavBarDropTargetGroupPainter : public Dxnavbar::TdxBaseDropTargetGroupPainter 
{
	typedef Dxnavbar::TdxBaseDropTargetGroupPainter inherited;
	
protected:
	/* virtual class method */ virtual void __fastcall InternalDrawTargetGroup(TMetaClass* vmt, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, Graphics::TColor AColor1, Graphics::TColor AColor2, Byte AAlphaBlend1, Byte AAlphaBlend2, Dxnavbarstyles::TdxBarStyleGradientMode AGradientMode);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TdxNavBarDropTargetGroupPainter(void) : Dxnavbar::TdxBaseDropTargetGroupPainter() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxNavBarDropTargetGroupPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxNavBarXPPainter;
class PASCALIMPLEMENTATION TdxNavBarXPPainter : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	/*         class method */ static bool __fastcall DrawObject(TMetaClass* vmt, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, Dxthememanager::TdxThemedObjectType AObject, int iPartId, int iStateId);
	/*         class method */ static bool __fastcall DrawText(TMetaClass* vmt, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, AnsiString ACaption, int ADrawTextFlag, Dxthememanager::TdxThemedObjectType AObject, int iPartId, int iStateId);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TdxNavBarXPPainter(void) : System::TObject() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxNavBarXPPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxNavBarXPSelectionPainter;
class PASCALIMPLEMENTATION TdxNavBarXPSelectionPainter : public TdxNavBarSelectionPainter 
{
	typedef TdxNavBarSelectionPainter inherited;
	
protected:
	/* virtual class method */ virtual void __fastcall InternalDrawSelection(TMetaClass* vmt, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, Graphics::TColor ABackColor, Dxnavbar::TdxNavBarObjectStates AState);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TdxNavBarXPSelectionPainter(void) : TdxNavBarSelectionPainter() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxNavBarXPSelectionPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxNavBarXPExplorerBarSignPainter;
class PASCALIMPLEMENTATION TdxNavBarXPExplorerBarSignPainter : public TdxNavBarExplorerBarSignPainter 
{
	typedef TdxNavBarExplorerBarSignPainter inherited;
	
protected:
	/* virtual class method */ virtual void __fastcall InternalDrawSign(TMetaClass* vmt, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, Graphics::TColor AForeColor, Graphics::TColor ABackColor, Dxnavbar::TdxNavBarObjectStates AState);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TdxNavBarXPExplorerBarSignPainter(void) : TdxNavBarExplorerBarSignPainter() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxNavBarXPExplorerBarSignPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxNavBarXPScrollButtonsPainter;
class PASCALIMPLEMENTATION TdxNavBarXPScrollButtonsPainter : public TdxNavBarScrollButtonsPainter 
{
	typedef TdxNavBarScrollButtonsPainter inherited;
	
protected:
	/* virtual class method */ virtual void __fastcall InternalDrawBottomButton(TMetaClass* vmt, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, TMetaClass* AButtonPainterClass, Graphics::TColor AColor1, Graphics::TColor AColor2, Byte AAlphaBlend1, Byte AAlphaBlend2, Dxnavbarstyles::TdxBarStyleGradientMode AGradientMode, Dxnavbar::TdxNavBarObjectStates AState);
	/* virtual class method */ virtual void __fastcall InternalDrawTopButton(TMetaClass* vmt, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, TMetaClass* AButtonPainterClass, Graphics::TColor AColor1, Graphics::TColor AColor2, Byte AAlphaBlend1, Byte AAlphaBlend2, Dxnavbarstyles::TdxBarStyleGradientMode AGradientMode, Dxnavbar::TdxNavBarObjectStates AState);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TdxNavBarXPScrollButtonsPainter(void) : TdxNavBarScrollButtonsPainter() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxNavBarXPScrollButtonsPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxNavBarXPButtonPainter;
class PASCALIMPLEMENTATION TdxNavBarXPButtonPainter : public TdxNavBarOfficeButtonPainter 
{
	typedef TdxNavBarOfficeButtonPainter inherited;
	
protected:
	/* virtual class method */ virtual void __fastcall InternalDrawButton(TMetaClass* vmt, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, Graphics::TPicture* APicture, Graphics::TColor AColor1, Graphics::TColor AColor2, Byte AAlphaBlend1, Byte AAlphaBlend2, Dxnavbarstyles::TdxBarStyleGradientMode AGradientMode, Dxnavbar::TdxNavBarObjectStates AState);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TdxNavBarXPButtonPainter(void) : TdxNavBarOfficeButtonPainter() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxNavBarXPButtonPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxNavBarXPExplorerBarButtonPainter;
class PASCALIMPLEMENTATION TdxNavBarXPExplorerBarButtonPainter : public TdxNavBarExplorerButtonPainter 
{
	typedef TdxNavBarExplorerButtonPainter inherited;
	
protected:
	/* virtual class method */ virtual void __fastcall InternalDrawButton(TMetaClass* vmt, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, Graphics::TPicture* APicture, Graphics::TColor AColor1, Graphics::TColor AColor2, Byte AAlphaBlend1, Byte AAlphaBlend2, Dxnavbarstyles::TdxBarStyleGradientMode AGradientMode, Dxnavbar::TdxNavBarObjectStates AState);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TdxNavBarXPExplorerBarButtonPainter(void) : TdxNavBarExplorerButtonPainter() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxNavBarXPExplorerBarButtonPainter(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE Graphics::TColor __fastcall LightColor(Graphics::TColor AColor);
extern PACKAGE Graphics::TColor __fastcall LightLightColor(Graphics::TColor AColor);
extern PACKAGE Graphics::TColor __fastcall DarkColor(Graphics::TColor AColor);
extern PACKAGE Graphics::TColor __fastcall DarkDarkColor(Graphics::TColor AColor);
extern PACKAGE Graphics::TColor __fastcall LightBorderColor(Graphics::TColor AColor);
extern PACKAGE Graphics::TColor __fastcall LightLightBorderColor(Graphics::TColor AColor);
extern PACKAGE Graphics::TColor __fastcall DarkBorderColor(Graphics::TColor AColor);
extern PACKAGE Graphics::TColor __fastcall DarkDarkBorderColor(Graphics::TColor AColor);
extern PACKAGE Graphics::TColor __fastcall CalcColor(int d);
extern PACKAGE Graphics::TColor __fastcall CalcTextColor(Graphics::TColor AColor, Dxnavbar::TdxNavBarObjectStates AState);
extern PACKAGE int __fastcall GetFontHeight(Graphics::TFont* AFont);

}	/* namespace Dxnavbargraphics */
using namespace Dxnavbargraphics;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// dxNavBarGraphics
