// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxImage.pas' rev: 6.00

#ifndef cxImageHPP
#define cxImageHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxLookAndFeels.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <cxEditConsts.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxDataUtils.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Clipbrd.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Types.hpp>	// Pascal unit
#include <ExtDlgs.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cximage
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TcxPopupMenuItem { pmiCut, pmiCopy, pmiPaste, pmiDelete, pmiLoad, pmiSave, pmiCustom };
#pragma option pop

typedef Set<TcxPopupMenuItem, pmiCut, pmiCustom>  TcxPopupMenuItems;

typedef void __fastcall (__closure *TcxPopupMenuItemClick)(System::TObject* Sender, TcxPopupMenuItem MenuItem);

class DELPHICLASS TcxPopupMenuLayout;
class DELPHICLASS TcxCustomImage;
class DELPHICLASS TcxImageProperties;
class PASCALIMPLEMENTATION TcxCustomImage : public Cxedit::TcxCustomEdit 
{
	typedef Cxedit::TcxCustomEdit inherited;
	
private:
	Menus::TPopupMenu* FEditPopupMenu;
	bool FIsDialogShowed;
	Word FClipboardFormat;
	bool FInternalChanging;
	Graphics::TPicture* FPicture;
	void __fastcall EditPopupMenuClick(System::TObject* Sender);
	HIDESBASE TcxImageProperties* __fastcall GetProperties(void);
	void __fastcall MenuItemClick(System::TObject* Sender, TcxPopupMenuItem MenuItem);
	void __fastcall PictureChanged(System::TObject* Sender);
	void __fastcall PreparePopup(void);
	void __fastcall ResetImage(void);
	void __fastcall SetPicture(Graphics::TPicture* Value);
	HIDESBASE void __fastcall SetProperties(const TcxImageProperties* Value);
	void __fastcall SynchronizeImage(void);
	
protected:
	virtual bool __fastcall CanAutoSize(void);
	virtual bool __fastcall CanAutoWidth(void);
	DYNAMIC void __fastcall DoContextPopup(const Types::TPoint &MousePos, bool &Handled);
	virtual void __fastcall InitScrollBarsParameters(void);
	DYNAMIC void __fastcall KeyDown(Word &Key, Classes::TShiftState Shift);
	DYNAMIC void __fastcall KeyPress(char &Key);
	virtual bool __fastcall NeedsScrollBars(void);
	virtual void __fastcall Scroll(Forms::TScrollBarKind AScrollBarKind, Stdctrls::TScrollCode AScrollCode, int &AScrollPos);
	virtual Variant __fastcall GetEditValue();
	virtual void __fastcall InternalSetEditValue(const Variant &Value, bool AIsValueValid);
	virtual void __fastcall PropertiesChanged(System::TObject* Sender);
	virtual void __fastcall UpdateScrollBars(void);
	virtual void __fastcall CustomClick(void);
	virtual TMetaClass* __fastcall GetGraphicClass(void);
	__property AutoSize  = {default=0};
	__property Word ClipboardFormat = {read=FClipboardFormat, write=FClipboardFormat, nodefault};
	__property ParentColor  = {default=0};
	__property Graphics::TPicture* Picture = {read=FPicture, write=SetPicture};
	__property TcxImageProperties* Properties = {read=GetProperties, write=SetProperties};
	
public:
	__fastcall virtual TcxCustomImage(Classes::TComponent* AOwner)/* overload */;
	__fastcall virtual ~TcxCustomImage(void);
	virtual void __fastcall Clear(void);
	virtual void __fastcall CopyToClipboard(void);
	virtual void __fastcall CutToClipboard(void);
	DYNAMIC bool __fastcall Focused(void);
	/* virtual class method */ virtual TMetaClass* __fastcall GetPropertiesClass(TMetaClass* vmt);
	void __fastcall LoadFromFile(void);
	virtual void __fastcall PasteFromClipboard(void);
	void __fastcall SaveToFile(void);
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomImage(HWND ParentWindow) : Cxedit::TcxCustomEdit(ParentWindow) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxPopupMenuLayout : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	AnsiString FCustomMenuItemCaption;
	Graphics::TBitmap* FCustomMenuItemGlyph;
	TcxCustomImage* FImage;
	TcxPopupMenuItems FMenuItems;
	virtual Graphics::TBitmap* __fastcall GetCustomMenuItemGlyph(void);
	void __fastcall SetCustomMenuItemGlyph(Graphics::TBitmap* Value);
	
public:
	__fastcall TcxPopupMenuLayout(TcxCustomImage* AImage);
	__fastcall virtual ~TcxPopupMenuLayout(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	
__published:
	__property TcxPopupMenuItems MenuItems = {read=FMenuItems, write=FMenuItems, default=63};
	__property AnsiString CustomMenuItemCaption = {read=FCustomMenuItemCaption, write=FCustomMenuItemCaption};
	__property Graphics::TBitmap* CustomMenuItemGlyph = {read=GetCustomMenuItemGlyph, write=SetCustomMenuItemGlyph};
};


class DELPHICLASS TcxImageViewInfo;
class PASCALIMPLEMENTATION TcxImageViewInfo : public Cxedit::TcxCustomEditViewInfo 
{
	typedef Cxedit::TcxCustomEditViewInfo inherited;
	
private:
	bool FFreePicture;
	Graphics::TBitmap* FTempBitmap;
	
protected:
	virtual void __fastcall InternalPaint(Cxgraphics::TcxCanvas* ACanvas);
	
public:
	bool ShowFocusRect;
	#pragma pack(push, 1)
	Types::TPoint TopLeft;
	#pragma pack(pop)
	
	AnsiString Caption;
	bool Center;
	Graphics::TPicture* Picture;
	bool Stretch;
	__fastcall virtual ~TcxImageViewInfo(void);
public:
	#pragma option push -w-inl
	/* TcxCustomEditViewInfo.Create */ inline __fastcall virtual TcxImageViewInfo(void) : Cxedit::TcxCustomEditViewInfo() { }
	#pragma option pop
	
};


class DELPHICLASS TcxImageViewData;
class PASCALIMPLEMENTATION TcxImageViewData : public Cxedit::TcxCustomEditViewData 
{
	typedef Cxedit::TcxCustomEditViewData inherited;
	
public:
	virtual void __fastcall Calculate(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ABounds, const Types::TPoint &P, Cxcontainer::TcxMouseButton Button, Classes::TShiftState Shift, Cxedit::TcxCustomEditViewInfo* AViewInfo, bool AIsMouseEvent);
	virtual void __fastcall EditValueToDrawValue(Cxgraphics::TcxCanvas* ACanvas, const Variant &AEditValue, Cxedit::TcxCustomEditViewInfo* AViewInfo);
	virtual tagSIZE __fastcall GetEditContentSize(Cxgraphics::TcxCanvas* ACanvas, const Variant &AEditValue, const Cxedit::TcxEditSizeProperties &AEditSizeProperties);
public:
	#pragma option push -w-inl
	/* TcxCustomEditViewData.Create */ inline __fastcall virtual TcxImageViewData(Cxedit::TcxCustomEditProperties* AProperties, Cxcontainer::TcxContainerStyle* AStyle, bool AIsInplace) : Cxedit::TcxCustomEditViewData(AProperties, AStyle, AIsInplace) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxImageViewData(void) { }
	#pragma option pop
	
};


typedef void __fastcall (__closure *TcxImageAssignPictureEvent)(System::TObject* Sender, const Graphics::TPicture* Picture);

typedef void __fastcall (__closure *TcxImageGraphicClassEvent)(System::TObject* Sender, TMetaClass* &GraphicClass);

#pragma option push -b-
enum TcxImageTransparency { gtDefault, gtOpaque, gtTransparent };
#pragma option pop

class DELPHICLASS TcxCustomImageProperties;
class PASCALIMPLEMENTATION TcxCustomImageProperties : public Cxedit::TcxCustomEditProperties 
{
	typedef Cxedit::TcxCustomEditProperties inherited;
	
private:
	AnsiString FCaption;
	bool FCenter;
	AnsiString FCustomFilter;
	TMetaClass*FGraphicClass;
	int FDefaultHeight;
	AnsiString FGraphicClassName;
	TcxImageTransparency FGraphicTransparency;
	TcxImageAssignPictureEvent FOnAssignPicture;
	Classes::TNotifyEvent FOnCustomClick;
	TcxPopupMenuLayout* FPopupMenuLayout;
	bool FShowFocusRect;
	bool FStretch;
	AnsiString __fastcall GetGraphicClassName();
	bool __fastcall IsStoredGraphicClassName(void);
	void __fastcall SetCaption(const AnsiString Value);
	void __fastcall SetCenter(bool Value);
	void __fastcall SetGraphicClass(const TMetaClass* Value);
	void __fastcall SetGraphicClassName(const AnsiString Value);
	void __fastcall SetGraphicTransparency(TcxImageTransparency Value);
	void __fastcall SetPopupMenuLayout(TcxPopupMenuLayout* Value);
	void __fastcall SetStretch(bool Value);
	
protected:
	virtual bool __fastcall CanValidate(void);
	bool __fastcall IsDesigning(void);
	__property AnsiString Caption = {read=FCaption, write=SetCaption};
	__property bool Center = {read=FCenter, write=SetCenter, default=1};
	__property AnsiString CustomFilter = {read=FCustomFilter, write=FCustomFilter};
	__property int DefaultHeight = {read=FDefaultHeight, write=FDefaultHeight, default=15};
	__property TMetaClass* GraphicClass = {read=FGraphicClass, write=SetGraphicClass};
	__property AnsiString GraphicClassName = {read=GetGraphicClassName, write=SetGraphicClassName, stored=IsStoredGraphicClassName};
	__property TcxImageTransparency GraphicTransparency = {read=FGraphicTransparency, write=SetGraphicTransparency, default=0};
	__property TcxPopupMenuLayout* PopupMenuLayout = {read=FPopupMenuLayout, write=SetPopupMenuLayout};
	__property bool ShowFocusRect = {read=FShowFocusRect, write=FShowFocusRect, nodefault};
	__property bool Stretch = {read=FStretch, write=SetStretch, default=0};
	__property TcxImageAssignPictureEvent OnAssignPicture = {read=FOnAssignPicture, write=FOnAssignPicture};
	__property Classes::TNotifyEvent OnCustomClick = {read=FOnCustomClick, write=FOnCustomClick};
	
public:
	__fastcall virtual TcxCustomImageProperties(Classes::TPersistent* AOwner);
	__fastcall virtual ~TcxCustomImageProperties(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	/* virtual class method */ virtual TMetaClass* __fastcall GetContainerClass(TMetaClass* vmt);
	virtual WideString __fastcall GetDisplayText(const Variant &AEditValue, bool AFullText = false);
	virtual Cxdatautils::TcxDataEditValueSource __fastcall GetEditValueSource(bool AEditFocused);
	virtual Cxedit::TcxEditSupportedOperations __fastcall GetSupportedOperations(void);
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewDataClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewInfoClass(TMetaClass* vmt);
	virtual bool __fastcall IsResetEditClass(void);
	virtual void __fastcall ValidateDisplayValue(Variant &DisplayValue, AnsiString &ErrorText, bool &Error, Cxedit::TcxCustomEdit* AEdit);
};


class PASCALIMPLEMENTATION TcxImageProperties : public TcxCustomImageProperties 
{
	typedef TcxCustomImageProperties inherited;
	
public:
	__property GraphicClass ;
	__property ShowFocusRect ;
	
__published:
	__property Caption ;
	__property Center  = {default=1};
	__property CustomFilter ;
	__property GraphicClassName ;
	__property GraphicTransparency  = {default=0};
	__property ImmediatePost  = {default=0};
	__property PopupMenuLayout ;
	__property ReadOnly ;
	__property Stretch  = {default=0};
	__property OnAssignPicture ;
	__property OnChange ;
	__property OnEditValueChanged ;
	__property OnCustomClick ;
public:
	#pragma option push -w-inl
	/* TcxCustomImageProperties.Create */ inline __fastcall virtual TcxImageProperties(Classes::TPersistent* AOwner) : TcxCustomImageProperties(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomImageProperties.Destroy */ inline __fastcall virtual ~TcxImageProperties(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxImage;
class PASCALIMPLEMENTATION TcxImage : public TcxCustomImage 
{
	typedef TcxCustomImage inherited;
	
__published:
	__property Align  = {default=0};
	__property Anchors  = {default=3};
	__property AutoSize  = {default=0};
	__property Constraints ;
	__property DragCursor  = {default=-12};
	__property DragKind  = {default=0};
	__property DragMode  = {default=0};
	__property Enabled  = {default=1};
	__property ImeMode  = {default=3};
	__property ImeName ;
	__property ParentColor  = {default=0};
	__property ParentShowHint  = {default=1};
	__property Picture ;
	__property Properties ;
	__property Style ;
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=1};
	__property Visible  = {default=1};
	__property OnClick ;
	__property OnDblClick ;
	__property OnEditing ;
	__property OnEnter ;
	__property OnExit ;
	__property OnKeyDown ;
	__property OnKeyPress ;
	__property OnKeyUp ;
	__property OnMouseDown ;
	__property OnMouseMove ;
	__property OnMouseUp ;
	__property OnEndDock ;
	__property OnStartDock ;
public:
	#pragma option push -w-inl
	/* TcxCustomImage.Create */ inline __fastcall virtual TcxImage(Classes::TComponent* AOwner)/* overload */ : TcxCustomImage(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomImage.Destroy */ inline __fastcall virtual ~TcxImage(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxImage(HWND ParentWindow) : TcxCustomImage(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
static const Shortint cxImageDefaultInplaceHeight = 0xf;
extern PACKAGE Classes::TList* __fastcall GetRegisteredGraphicClasses(void);
extern PACKAGE void __fastcall RegisterGraphicClass(TMetaClass* AGraphicClass);
extern PACKAGE void __fastcall UnRegisterGraphicClass(TMetaClass* AGraphicClass);
extern PACKAGE bool __fastcall IsPictureEmpty(Graphics::TPicture* APicture);
extern PACKAGE void __fastcall LoadPicture(Graphics::TPicture* Picture, TMetaClass* GraphicClass, const Variant &Value);
extern PACKAGE void __fastcall SavePicture(Graphics::TPicture* APicture, AnsiString &AValue);

}	/* namespace Cximage */
using namespace Cximage;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxImage
