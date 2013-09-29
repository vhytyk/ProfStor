// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxBlobEdit.pas' rev: 6.00

#ifndef cxBlobEditHPP
#define cxBlobEditHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Menus.hpp>	// Pascal unit
#include <cxMaskEdit.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <cxDataUtils.hpp>	// Pascal unit
#include <cxMemo.hpp>	// Pascal unit
#include <cxImage.hpp>	// Pascal unit
#include <cxButtons.hpp>	// Pascal unit
#include <cxTextEdit.hpp>	// Pascal unit
#include <cxEditConsts.hpp>	// Pascal unit
#include <cxDropDownEdit.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <Clipbrd.hpp>	// Pascal unit
#include <ImgList.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Types.hpp>	// Pascal unit
#include <ExtDlgs.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxblobedit
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TcxBlobPaintStyle { bpsDefault, bpsIcon, bpsText };
#pragma option pop

#pragma option push -b-
enum TcxBlobEditKind { bekAuto, bekMemo, bekPict, bekOle, bekBlob };
#pragma option pop

class DELPHICLASS TcxBlobEditViewData;
class PASCALIMPLEMENTATION TcxBlobEditViewData : public Cxdropdownedit::TcxCustomDropDownEditViewData 
{
	typedef Cxdropdownedit::TcxCustomDropDownEditViewData inherited;
	
public:
	virtual void __fastcall Calculate(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ABounds, const Types::TPoint &P, Cxcontainer::TcxMouseButton Button, Classes::TShiftState Shift, Cxedit::TcxCustomEditViewInfo* AViewInfo, bool AIsMouseEvent);
	virtual tagSIZE __fastcall GetEditContentSize(Cxgraphics::TcxCanvas* ACanvas, const Variant &AEditValue, const Cxedit::TcxEditSizeProperties &AEditSizeProperties);
	virtual void __fastcall EditValueToDrawValue(Cxgraphics::TcxCanvas* ACanvas, const Variant &AEditValue, Cxedit::TcxCustomEditViewInfo* AViewInfo);
public:
	#pragma option push -w-inl
	/* TcxCustomEditViewData.Create */ inline __fastcall virtual TcxBlobEditViewData(Cxedit::TcxCustomEditProperties* AProperties, Cxcontainer::TcxContainerStyle* AStyle, bool AIsInplace) : Cxdropdownedit::TcxCustomDropDownEditViewData(AProperties, AStyle, AIsInplace) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxBlobEditViewData(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxBlobEditViewInfo;
class PASCALIMPLEMENTATION TcxBlobEditViewInfo : public Cxtextedit::TcxCustomTextEditViewInfo 
{
	typedef Cxtextedit::TcxCustomTextEditViewInfo inherited;
	
protected:
	virtual void __fastcall InternalPaint(Cxgraphics::TcxCanvas* ACanvas);
	
public:
	#pragma pack(push, 1)
	Types::TRect IconRect;
	#pragma pack(pop)
	
	Imglist::TImageIndex ImageIndex;
	virtual bool __fastcall NeedShowHint(Cxgraphics::TcxCanvas* ACanvas, const Types::TPoint &P, /* out */ AnsiString &AText, /* out */ bool &AIsMultiLine, /* out */ Types::TRect &ATextRect)/* overload */;
	virtual void __fastcall Offset(int DX, int DY);
public:
	#pragma option push -w-inl
	/* TcxCustomTextEditViewInfo.Destroy */ inline __fastcall virtual ~TcxBlobEditViewInfo(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomEditViewInfo.Create */ inline __fastcall virtual TcxBlobEditViewInfo(void) : Cxtextedit::TcxCustomTextEditViewInfo() { }
	#pragma option pop
	
	
/* Hoisted overloads: */
	
public:
	inline bool __fastcall  NeedShowHint(Cxgraphics::TcxCanvas* ACanvas, const Types::TPoint &P, const Types::TRect &AVisibleBounds, /* out */ AnsiString &AText, /* out */ bool &AIsMultiLine, /* out */ Types::TRect &ATextRect){ return TcxCustomTextEditViewInfo::NeedShowHint(ACanvas, P, AVisibleBounds, AText, AIsMultiLine, ATextRect); }
	
};


class DELPHICLASS TcxCustomBlobEditProperties;
class PASCALIMPLEMENTATION TcxCustomBlobEditProperties : public Cxdropdownedit::TcxCustomPopupEditProperties 
{
	typedef Cxdropdownedit::TcxCustomPopupEditProperties inherited;
	
private:
	bool FAlwaysSaveData;
	TcxBlobEditKind FBlobEditKind;
	TcxBlobPaintStyle FBlobPaintStyle;
	bool FMemoAutoReplace;
	bool FMemoWantReturns;
	bool FMemoWantTabs;
	bool FMemoOEMConvert;
	bool FMemoWordWrap;
	int FMemoMaxLength;
	Stdctrls::TEditCharCase FMemoCharCase;
	Stdctrls::TScrollStyle FMemoScrollBars;
	bool FPictureAutoSize;
	Word FPictureClipboardFormat;
	AnsiString FPictureFilter;
	TMetaClass*FPictureGraphicClass;
	AnsiString FPictureGraphicClassName;
	Cximage::TcxImageTransparency FPictureTransparency;
	bool FShowExPopupItems;
	bool FShowPicturePopup;
	Cximage::TcxImageAssignPictureEvent FOnAssignPicture;
	void __fastcall SetBlobEditKind(const TcxBlobEditKind Value);
	void __fastcall SetBlobPaintStyle(const TcxBlobPaintStyle Value);
	
protected:
	virtual bool __fastcall DropDownOnClick(void);
	virtual Cxedit::TcxEditDisplayFormatOptions __fastcall GetDisplayFormatOptions(void);
	/* virtual class method */ virtual TMetaClass* __fastcall GetPopupWindowClass(TMetaClass* vmt);
	virtual bool __fastcall HasDisplayValue(void);
	void __fastcall CorrectBlobEditKind(void);
	__property PopupSysPanelStyle  = {default=0};
	__property bool AlwaysSaveData = {read=FAlwaysSaveData, write=FAlwaysSaveData, default=1};
	__property TcxBlobEditKind BlobEditKind = {read=FBlobEditKind, write=SetBlobEditKind, default=0};
	__property TcxBlobPaintStyle BlobPaintStyle = {read=FBlobPaintStyle, write=SetBlobPaintStyle, default=1};
	__property ImmediatePopup  = {default=1};
	__property bool MemoAutoReplace = {read=FMemoAutoReplace, write=FMemoAutoReplace, default=0};
	__property Stdctrls::TEditCharCase MemoCharCase = {read=FMemoCharCase, write=FMemoCharCase, default=0};
	__property int MemoMaxLength = {read=FMemoMaxLength, write=FMemoMaxLength, default=0};
	__property bool MemoOEMConvert = {read=FMemoOEMConvert, write=FMemoOEMConvert, default=0};
	__property Stdctrls::TScrollStyle MemoScrollBars = {read=FMemoScrollBars, write=FMemoScrollBars, default=0};
	__property bool MemoWantReturns = {read=FMemoWantReturns, write=FMemoWantReturns, default=1};
	__property bool MemoWantTabs = {read=FMemoWantTabs, write=FMemoWantTabs, default=1};
	__property bool MemoWordWrap = {read=FMemoWordWrap, write=FMemoWordWrap, default=1};
	__property bool PictureAutoSize = {read=FPictureAutoSize, write=FPictureAutoSize, default=1};
	__property Word PictureClipboardFormat = {read=FPictureClipboardFormat, write=FPictureClipboardFormat, nodefault};
	__property TMetaClass* PictureGraphicClass = {read=FPictureGraphicClass, write=FPictureGraphicClass};
	__property AnsiString PictureGraphicClassName = {read=FPictureGraphicClassName, write=FPictureGraphicClassName};
	__property AnsiString PictureFilter = {read=FPictureFilter, write=FPictureFilter};
	__property Cximage::TcxImageTransparency PictureTransparency = {read=FPictureTransparency, write=FPictureTransparency, default=0};
	__property bool ShowExPopupItems = {read=FShowExPopupItems, write=FShowExPopupItems, default=1};
	__property bool ShowPicturePopup = {read=FShowPicturePopup, write=FShowPicturePopup, default=1};
	__property Cximage::TcxImageAssignPictureEvent OnAssignPicture = {read=FOnAssignPicture, write=FOnAssignPicture};
	
public:
	__fastcall virtual TcxCustomBlobEditProperties(Classes::TPersistent* AOwner);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	/* virtual class method */ virtual TMetaClass* __fastcall GetContainerClass(TMetaClass* vmt);
	virtual WideString __fastcall GetDisplayText(const Variant &AEditValue, bool AFullText = false);
	virtual Cxdatautils::TcxDataEditValueSource __fastcall GetEditValueSource(bool AEditFocused);
	virtual Cxedit::TcxEditSupportedOperations __fastcall GetSupportedOperations(void);
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewDataClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewInfoClass(TMetaClass* vmt);
	virtual bool __fastcall IsEditValueValid(Variant &AEditValue, bool AEditFocused);
public:
	#pragma option push -w-inl
	/* TcxCustomMaskEditProperties.Destroy */ inline __fastcall virtual ~TcxCustomBlobEditProperties(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxBlobEditProperties;
class PASCALIMPLEMENTATION TcxBlobEditProperties : public TcxCustomBlobEditProperties 
{
	typedef TcxCustomBlobEditProperties inherited;
	
public:
	__property PictureGraphicClass ;
	
__published:
	__property AlwaysSaveData  = {default=1};
	__property BlobEditKind  = {default=0};
	__property BlobPaintStyle  = {default=1};
	__property ImmediatePopup  = {default=1};
	__property ImmediatePost  = {default=0};
	__property MemoAutoReplace  = {default=0};
	__property MemoCharCase  = {default=0};
	__property MemoMaxLength  = {default=0};
	__property MemoOEMConvert  = {default=0};
	__property MemoScrollBars  = {default=0};
	__property MemoWantReturns  = {default=1};
	__property MemoWantTabs  = {default=1};
	__property MemoWordWrap  = {default=1};
	__property PictureAutoSize  = {default=1};
	__property PictureFilter ;
	__property PictureGraphicClassName ;
	__property PictureTransparency  = {default=0};
	__property PopupHeight  = {default=200};
	__property PopupWidth  = {default=250};
	__property ShowExPopupItems  = {default=1};
	__property ShowPicturePopup  = {default=1};
	__property ReadOnly ;
	__property OnAssignPicture ;
	__property OnButtonClick ;
	__property OnChange ;
	__property OnCloseQuery ;
	__property OnCloseUp ;
	__property OnEditValueChanged ;
	__property OnInitPopup ;
	__property OnPopup ;
	__property OnValidate ;
public:
	#pragma option push -w-inl
	/* TcxCustomBlobEditProperties.Create */ inline __fastcall virtual TcxBlobEditProperties(Classes::TPersistent* AOwner) : TcxCustomBlobEditProperties(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomMaskEditProperties.Destroy */ inline __fastcall virtual ~TcxBlobEditProperties(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomBlobEdit;
class PASCALIMPLEMENTATION TcxCustomBlobEdit : public Cxdropdownedit::TcxCustomPopupEdit 
{
	typedef Cxdropdownedit::TcxCustomPopupEdit inherited;
	
private:
	int FButtonWidth;
	Cxbuttons::TcxButton* FCancelButton;
	TMetaClass*FGraphicClass;
	Cxbuttons::TcxButton* FOkButton;
	Cxedit::TcxCustomEdit* FStorage;
	HIDESBASE TcxBlobEditProperties* __fastcall GetProperties(void);
	void __fastcall InternalChanged(System::TObject* Sender);
	HIDESBASE void __fastcall SetProperties(TcxBlobEditProperties* Value);
	
protected:
	HIDESBASE AnsiString __fastcall GetText();
	HIDESBASE void __fastcall SetText(const AnsiString Value);
	DYNAMIC void __fastcall ColorChanged(void);
	virtual void __fastcall CreatePopupControls(void);
	virtual void __fastcall DoEditKeyPress(char &Key);
	virtual Controls::TWinControl* __fastcall GetPopupFocusedControl(void);
	virtual tagSIZE __fastcall GetPopupWindowClientPreferredSize();
	DYNAMIC void __fastcall FontChanged(void);
	virtual void __fastcall DestroyPopupControls(void);
	virtual void __fastcall DoInitPopup(void);
	virtual bool __fastcall IsEditClass(void);
	DYNAMIC void __fastcall PopupWindowClosed(System::TObject* Sender);
	virtual void __fastcall PropertiesChanged(System::TObject* Sender);
	virtual void __fastcall SetupPopupWindow(void);
	virtual void __fastcall StorageEditingHandler(System::TObject* Sender, bool &CanEdit);
	virtual void __fastcall SynchronizeDisplayValue(void);
	virtual void __fastcall SynchronizeEditValue(void);
	__property TcxBlobEditProperties* Properties = {read=GetProperties, write=SetProperties};
	__property TabStop  = {default=1};
	__property AnsiString Text = {read=GetText, write=SetText};
	
public:
	__fastcall virtual TcxCustomBlobEdit(Classes::TComponent* AOwner)/* overload */;
	__fastcall virtual ~TcxCustomBlobEdit(void);
	/* virtual class method */ virtual TMetaClass* __fastcall GetPropertiesClass(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomBlobEdit(HWND ParentWindow) : Cxdropdownedit::TcxCustomPopupEdit(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxBlobEdit;
class PASCALIMPLEMENTATION TcxBlobEdit : public TcxCustomBlobEdit 
{
	typedef TcxCustomBlobEdit inherited;
	
__published:
	__property Anchors  = {default=3};
	__property AutoSize  = {default=1};
	__property BeepOnEnter  = {default=1};
	__property Constraints ;
	__property DragCursor  = {default=-12};
	__property DragKind  = {default=0};
	__property DragMode  = {default=0};
	__property Enabled  = {default=1};
	__property ImeMode  = {default=3};
	__property ImeName ;
	__property ParentColor  = {default=0};
	__property ParentFont  = {default=1};
	__property ParentShowHint  = {default=1};
	__property PopupMenu ;
	__property Properties ;
	__property ShowHint ;
	__property Style ;
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=1};
	__property Text ;
	__property Visible  = {default=1};
	__property OnClick ;
	__property OnDblClick ;
	__property OnDragDrop ;
	__property OnDragOver ;
	__property OnEditing ;
	__property OnEndDrag ;
	__property OnEnter ;
	__property OnExit ;
	__property OnKeyDown ;
	__property OnKeyPress ;
	__property OnKeyUp ;
	__property OnMouseDown ;
	__property OnMouseMove ;
	__property OnMouseUp ;
	__property OnStartDrag ;
	__property BiDiMode ;
	__property ParentBiDiMode  = {default=1};
	__property OnEndDock ;
	__property OnStartDock ;
public:
	#pragma option push -w-inl
	/* TcxCustomBlobEdit.Create */ inline __fastcall virtual TcxBlobEdit(Classes::TComponent* AOwner)/* overload */ : TcxCustomBlobEdit(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomBlobEdit.Destroy */ inline __fastcall virtual ~TcxBlobEdit(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxBlobEdit(HWND ParentWindow) : TcxCustomBlobEdit(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxBlobEditPopupWindow;
class PASCALIMPLEMENTATION TcxBlobEditPopupWindow : public Cxdropdownedit::TcxPopupEditPopupWindow 
{
	typedef Cxdropdownedit::TcxPopupEditPopupWindow inherited;
	
protected:
	virtual void __fastcall DoPopupControlKey(char Key);
public:
	#pragma option push -w-inl
	/* TcxCustomEditPopupWindow.Create */ inline __fastcall virtual TcxBlobEditPopupWindow(Controls::TWinControl* AOwnerControl) : Cxdropdownedit::TcxPopupEditPopupWindow(AOwnerControl) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomPopupWindow.Destroy */ inline __fastcall virtual ~TcxBlobEditPopupWindow(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual TcxBlobEditPopupWindow(Classes::TComponent* AOwner, int Dummy) : Cxdropdownedit::TcxPopupEditPopupWindow(AOwner, Dummy) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxBlobEditPopupWindow(HWND ParentWindow) : Cxdropdownedit::TcxPopupEditPopupWindow(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
static const Shortint cxIdentityTextLength = 0x50;
extern PACKAGE Controls::TImageList* imgBlobImages;
extern PACKAGE AnsiString __fastcall GetBlobText(const Variant &Value, TcxCustomBlobEditProperties* AProperties, bool AFullText);

}	/* namespace Cxblobedit */
using namespace Cxblobedit;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxBlobEdit
