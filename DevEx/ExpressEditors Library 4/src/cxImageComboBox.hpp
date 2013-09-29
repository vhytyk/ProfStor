// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxImageComboBox.pas' rev: 6.00

#ifndef cxImageComboBoxHPP
#define cxImageComboBoxHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxMaskEdit.hpp>	// Pascal unit
#include <cxDataUtils.hpp>	// Pascal unit
#include <cxTextEdit.hpp>	// Pascal unit
#include <cxDropDownEdit.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <ImgList.hpp>	// Pascal unit
#include <Clipbrd.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <cxVariants.hpp>	// Pascal unit
#include <Variants.hpp>	// Pascal unit
#include <Types.hpp>	// Pascal unit
#include <ComCtrls.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cximagecombobox
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxImageComboBoxItem;
class PASCALIMPLEMENTATION TcxImageComboBoxItem : public Classes::TCollectionItem 
{
	typedef Classes::TCollectionItem inherited;
	
private:
	AnsiString FDescription;
	Imglist::TImageIndex FImageIndex;
	Variant FValue;
	bool __fastcall IsStoredValue(void);
	void __fastcall SetDescription(const AnsiString Value);
	void __fastcall SetImageIndex(const Imglist::TImageIndex Value);
	void __fastcall SetValue(const Variant &AValue);
	
public:
	__fastcall virtual TcxImageComboBoxItem(Classes::TCollection* Collection);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	
__published:
	__property AnsiString Description = {read=FDescription, write=SetDescription};
	__property Imglist::TImageIndex ImageIndex = {read=FImageIndex, write=SetImageIndex, default=-1};
	__property Variant Value = {read=FValue, write=SetValue, stored=IsStoredValue};
public:
	#pragma option push -w-inl
	/* TCollectionItem.Destroy */ inline __fastcall virtual ~TcxImageComboBoxItem(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxImageComboBoxItems;
class PASCALIMPLEMENTATION TcxImageComboBoxItems : public Classes::TOwnedCollection 
{
	typedef Classes::TOwnedCollection inherited;
	
public:
	TcxImageComboBoxItem* operator[](int Index) { return Items[Index]; }
	
private:
	TcxImageComboBoxItem* __fastcall GetItems(int Index);
	void __fastcall SetItems(int Index, const TcxImageComboBoxItem* Value);
	
protected:
	virtual void __fastcall Update(Classes::TCollectionItem* Item);
	
public:
	__property TcxImageComboBoxItem* Items[int Index] = {read=GetItems, write=SetItems/*, default*/};
public:
	#pragma option push -w-inl
	/* TOwnedCollection.Create */ inline __fastcall TcxImageComboBoxItems(Classes::TPersistent* AOwner, TMetaClass* ItemClass) : Classes::TOwnedCollection(AOwner, ItemClass) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TCollection.Destroy */ inline __fastcall virtual ~TcxImageComboBoxItems(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxImageComboBoxListBox;
class DELPHICLASS TcxCustomImageComboBoxProperties;
#pragma option push -b-
enum TcxImageAlign { iaLeft, iaRight };
#pragma option pop

class DELPHICLASS TcxImageComboBoxViewInfo;
class PASCALIMPLEMENTATION TcxCustomImageComboBoxProperties : public Cxdropdownedit::TcxCustomComboBoxProperties 
{
	typedef Cxdropdownedit::TcxCustomComboBoxProperties inherited;
	
private:
	AnsiString FDefaultDescription;
	Imglist::TImageIndex FDefaultImageIndex;
	TcxImageAlign FImageAlign;
	Controls::TImageList* FImages;
	Imglist::TChangeLink* FImagesChangeLink;
	TcxImageComboBoxItems* FItems;
	Controls::TImageList* FLargeImages;
	Imglist::TChangeLink* FLargeImagesChangeLink;
	bool FMultiLineText;
	bool FShowDescriptions;
	void __fastcall ImagesChange(System::TObject* Sender);
	void __fastcall LargeImagesChange(System::TObject* Sender);
	void __fastcall SetDefaultDescription(const AnsiString Value);
	void __fastcall SetDefaultImageIndex(const Imglist::TImageIndex Value);
	void __fastcall SetImageAlign(const TcxImageAlign Value);
	void __fastcall SetImages(const Controls::TImageList* Value);
	HIDESBASE void __fastcall SetItems(const TcxImageComboBoxItems* Value);
	void __fastcall SetLargeImages(const Controls::TImageList* Value);
	void __fastcall SetMultiLineText(const bool Value);
	void __fastcall SetShowDescriptions(const bool Value);
	void __fastcall SetupViewInfoByItem(TcxImageComboBoxItem* AItem, TcxImageComboBoxViewInfo* AViewInfo);
	
protected:
	virtual Cxedit::TcxEditDisplayFormatOptions __fastcall GetDisplayFormatOptions(void);
	TcxImageComboBoxItem* __fastcall FindItemByValue(const Variant &AValue);
	TcxImageComboBoxItem* __fastcall FindItemByText(const AnsiString AText);
	virtual bool __fastcall FindLookupText(const AnsiString AText);
	virtual void __fastcall FreeNotification(Classes::TComponent* Sender);
	__property AnsiString DefaultDescription = {read=FDefaultDescription, write=SetDefaultDescription};
	__property Imglist::TImageIndex DefaultImageIndex = {read=FDefaultImageIndex, write=SetDefaultImageIndex, default=-1};
	__property TcxImageAlign ImageAlign = {read=FImageAlign, write=SetImageAlign, default=0};
	__property Controls::TImageList* Images = {read=FImages, write=SetImages};
	__property TcxImageComboBoxItems* Items = {read=FItems, write=SetItems};
	__property Controls::TImageList* LargeImages = {read=FLargeImages, write=SetLargeImages};
	__property bool MultiLineText = {read=FMultiLineText, write=SetMultiLineText, default=0};
	__property bool ShowDescriptions = {read=FShowDescriptions, write=SetShowDescriptions, default=1};
	
public:
	__fastcall virtual TcxCustomImageComboBoxProperties(Classes::TPersistent* AOwner);
	__fastcall virtual ~TcxCustomImageComboBoxProperties(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	/* virtual class method */ virtual TMetaClass* __fastcall GetContainerClass(TMetaClass* vmt);
	virtual WideString __fastcall GetDisplayText(const Variant &AEditValue, bool AFullText = false);
	virtual Cxdatautils::TcxDataEditValueSource __fastcall GetEditValueSource(bool AEditFocused);
	/* virtual class method */ virtual TMetaClass* __fastcall GetLookupDataClass(TMetaClass* vmt);
	virtual Cxedit::TcxEditSupportedOperations __fastcall GetSupportedOperations(void);
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewDataClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewInfoClass(TMetaClass* vmt);
	virtual bool __fastcall IsEditValueValid(Variant &AEditValue, bool AEditFocused);
	virtual void __fastcall PrepareDisplayValue(const Variant &AEditValue, Variant &DisplayValue, bool AEditFocused);
};


class PASCALIMPLEMENTATION TcxImageComboBoxListBox : public Cxdropdownedit::TcxComboBoxListBox 
{
	typedef Cxdropdownedit::TcxComboBoxListBox inherited;
	
private:
	TcxCustomImageComboBoxProperties* FProperties;
	bool FHasScrollbar;
	int FClientWidth;
	
protected:
	virtual int __fastcall GetHeight(int ARowCount, int AMaxHeight);
	virtual void __fastcall RecreateWindow(void);
	Types::TRect __fastcall GetImageRect(const Types::TRect &R);
	Controls::TImageList* __fastcall GetImages(void);
	virtual int __fastcall GetMaxItemWidth(void);
	virtual void __fastcall DrawItem(int Index, const Types::TRect &Rect, Windows::TOwnerDrawState State);
	virtual void __fastcall MeasureItem(int Index, int &Height);
	__property TcxCustomImageComboBoxProperties* Properties = {read=FProperties};
	
public:
	__fastcall virtual TcxImageComboBoxListBox(Classes::TComponent* AOwner);
public:
	#pragma option push -w-inl
	/* TcxCustomInnerListBox.Destroy */ inline __fastcall virtual ~TcxImageComboBoxListBox(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxImageComboBoxListBox(HWND ParentWindow) : Cxdropdownedit::TcxComboBoxListBox(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxImageComboBoxLookupData;
class PASCALIMPLEMENTATION TcxImageComboBoxLookupData : public Cxdropdownedit::TcxComboBoxLookupData 
{
	typedef Cxdropdownedit::TcxComboBoxLookupData inherited;
	
protected:
	virtual TMetaClass* __fastcall GetListBoxClass(void);
	virtual AnsiString __fastcall GetItem(int Index);
	virtual int __fastcall GetItemCount(void);
	
public:
	virtual void __fastcall TextChanged(void);
public:
	#pragma option push -w-inl
	/* TcxCustomTextEditLookupData.Create */ inline __fastcall virtual TcxImageComboBoxLookupData(Classes::TPersistent* AOwner) : Cxdropdownedit::TcxComboBoxLookupData(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxImageComboBoxLookupData(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxImageComboBoxViewData;
class PASCALIMPLEMENTATION TcxImageComboBoxViewData : public Cxdropdownedit::TcxCustomDropDownEditViewData 
{
	typedef Cxdropdownedit::TcxCustomDropDownEditViewData inherited;
	
public:
	virtual void __fastcall Calculate(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ABounds, const Types::TPoint &P, Cxcontainer::TcxMouseButton Button, Classes::TShiftState Shift, Cxedit::TcxCustomEditViewInfo* AViewInfo, bool AIsMouseEvent);
	virtual void __fastcall DisplayValueToDrawValue(const Variant &ADisplayValue, Cxedit::TcxCustomEditViewInfo* AViewInfo);
	virtual void __fastcall EditValueToDrawValue(Cxgraphics::TcxCanvas* ACanvas, const Variant &AEditValue, Cxedit::TcxCustomEditViewInfo* AViewInfo);
	virtual tagSIZE __fastcall GetEditContentSize(Cxgraphics::TcxCanvas* ACanvas, const Variant &AEditValue, const Cxedit::TcxEditSizeProperties &AEditSizeProperties);
public:
	#pragma option push -w-inl
	/* TcxCustomEditViewData.Create */ inline __fastcall virtual TcxImageComboBoxViewData(Cxedit::TcxCustomEditProperties* AProperties, Cxcontainer::TcxContainerStyle* AStyle, bool AIsInplace) : Cxdropdownedit::TcxCustomDropDownEditViewData(AProperties, AStyle, AIsInplace) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxImageComboBoxViewData(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxImageComboBoxViewInfo : public Cxtextedit::TcxCustomTextEditViewInfo 
{
	typedef Cxtextedit::TcxCustomTextEditViewInfo inherited;
	
protected:
	virtual void __fastcall InternalPaint(Cxgraphics::TcxCanvas* ACanvas);
	
public:
	#pragma pack(push, 1)
	Types::TRect ImageRect;
	#pragma pack(pop)
	
	bool ShowDescriptions;
	TcxImageAlign ImageAlign;
	Imglist::TImageIndex ImageIndex;
	Controls::TImageList* Images;
	virtual void __fastcall Offset(int DX, int DY);
public:
	#pragma option push -w-inl
	/* TcxCustomTextEditViewInfo.Destroy */ inline __fastcall virtual ~TcxImageComboBoxViewInfo(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomEditViewInfo.Create */ inline __fastcall virtual TcxImageComboBoxViewInfo(void) : Cxtextedit::TcxCustomTextEditViewInfo() { }
	#pragma option pop
	
};


class DELPHICLASS TcxImageComboBoxProperties;
class PASCALIMPLEMENTATION TcxImageComboBoxProperties : public TcxCustomImageComboBoxProperties 
{
	typedef TcxCustomImageComboBoxProperties inherited;
	
__published:
	__property Alignment ;
	__property ButtonGlyph ;
	__property DefaultDescription ;
	__property DefaultImageIndex  = {default=-1};
	__property DropDownRows  = {default=8};
	__property ImageAlign  = {default=0};
	__property Images ;
	__property ImmediateDropDown  = {default=1};
	__property ImmediatePost  = {default=0};
	__property ImmediateUpdateText  = {default=0};
	__property Items ;
	__property LargeImages ;
	__property MultiLineText  = {default=0};
	__property ReadOnly ;
	__property Revertable  = {default=0};
	__property ShowDescriptions  = {default=1};
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
	/* TcxCustomImageComboBoxProperties.Create */ inline __fastcall virtual TcxImageComboBoxProperties(Classes::TPersistent* AOwner) : TcxCustomImageComboBoxProperties(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomImageComboBoxProperties.Destroy */ inline __fastcall virtual ~TcxImageComboBoxProperties(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomImageComboBox;
class PASCALIMPLEMENTATION TcxCustomImageComboBox : public Cxdropdownedit::TcxCustomComboBox 
{
	typedef Cxdropdownedit::TcxCustomComboBox inherited;
	
private:
	HIDESBASE TcxImageComboBoxProperties* __fastcall GetProperties(void);
	HIDESBASE void __fastcall SetProperties(const TcxImageComboBoxProperties* Value);
	
protected:
	virtual tagSIZE __fastcall GetPopupWindowClientPreferredSize();
	virtual void __fastcall InitializeLookupData(void);
	virtual bool __fastcall IsValidChar(char AChar);
	virtual Variant __fastcall LookupKeyToEditValue(const Variant &AKey);
	virtual void __fastcall SynchronizeDisplayValue(void);
	virtual void __fastcall UpdateDrawValue(void);
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetPropertiesClass(TMetaClass* vmt);
	virtual void __fastcall PrepareEditValue(const Variant &ADisplayValue, /* out */ Variant &EditValue, bool AEditFocused);
	__property TcxImageComboBoxProperties* Properties = {read=GetProperties, write=SetProperties};
public:
	#pragma option push -w-inl
	/* TcxCustomComboBox.Create */ inline __fastcall virtual TcxCustomImageComboBox(Classes::TComponent* AOwner)/* overload */ : Cxdropdownedit::TcxCustomComboBox(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomDropDownEdit.Destroy */ inline __fastcall virtual ~TcxCustomImageComboBox(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomImageComboBox(HWND ParentWindow) : Cxdropdownedit::TcxCustomComboBox(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxImageComboBox;
class PASCALIMPLEMENTATION TcxImageComboBox : public TcxCustomImageComboBox 
{
	typedef TcxCustomImageComboBox inherited;
	
public:
	__property ItemIndex ;
	
__published:
	__property Anchors  = {default=3};
	__property AutoSize  = {default=1};
	__property BeepOnEnter  = {default=1};
	__property Constraints ;
	__property DragCursor  = {default=-12};
	__property DragKind  = {default=0};
	__property DragMode  = {default=0};
	__property EditValue ;
	__property Enabled  = {default=1};
	__property ImeMode  = {default=3};
	__property ImeName ;
	__property ParentColor  = {default=0};
	__property ParentFont  = {default=1};
	__property ParentShowHint  = {default=1};
	__property Properties ;
	__property ShowHint ;
	__property Style ;
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=1};
	__property Visible  = {default=1};
	__property OnClick ;
	__property OnEditing ;
	__property OnEnter ;
	__property OnExit ;
	__property OnKeyDown ;
	__property OnKeyPress ;
	__property OnKeyUp ;
	__property OnMouseDown ;
	__property OnMouseMove ;
	__property OnMouseUp ;
public:
	#pragma option push -w-inl
	/* TcxCustomComboBox.Create */ inline __fastcall virtual TcxImageComboBox(Classes::TComponent* AOwner)/* overload */ : TcxCustomImageComboBox(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomDropDownEdit.Destroy */ inline __fastcall virtual ~TcxImageComboBox(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxImageComboBox(HWND ParentWindow) : TcxCustomImageComboBox(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cximagecombobox */
using namespace Cximagecombobox;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxImageComboBox
