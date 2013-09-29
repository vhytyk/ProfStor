// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxColorComboBox.pas' rev: 6.00

#ifndef cxColorComboBoxHPP
#define cxColorComboBoxHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Menus.hpp>	// Pascal unit
#include <cxDataUtils.hpp>	// Pascal unit
#include <cxExtEditConsts.hpp>	// Pascal unit
#include <Variants.hpp>	// Pascal unit
#include <cxCustomData.hpp>	// Pascal unit
#include <cxImageComboBox.hpp>	// Pascal unit
#include <cxDropDownEdit.hpp>	// Pascal unit
#include <cxMaskEdit.hpp>	// Pascal unit
#include <cxEditUtils.hpp>	// Pascal unit
#include <cxTextEdit.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <cxVariants.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <TypInfo.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxcolorcombobox
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TcxColorBoxAlign { cbaLeft, cbaRight };
#pragma option pop

#pragma option push -b-
enum TcxColorNamingConvention { cxncNone, cxncDelphi, cxncHTML4, cxncX11 };
#pragma option pop

#pragma option push -b-
enum TcxColorPrepareList { cxplNone, cxplDelphi, cxplHTML4, cxplX11, cxplX11Ordered };
#pragma option pop

#pragma option push -b-
enum TcxColorValueFormat { cxcvRGB, cxcvHexadecimal, cxcvInteger };
#pragma option pop

#pragma option push -b-
enum TcxDefaultColorStyle { cxdcClear, cxdcColor, cxdcHatched, cxdcText, cxdcCustom };
#pragma option pop

#pragma option push -b-
enum TcxMRUColorAction { mcaNone, mcaMoved, mcaAdded, mcaDeleted };
#pragma option pop

class DELPHICLASS TcxColorComboBoxItem;
class PASCALIMPLEMENTATION TcxColorComboBoxItem : public Classes::TCollectionItem 
{
	typedef Classes::TCollectionItem inherited;
	
private:
	Graphics::TColor FColor;
	AnsiString FDescription;
	bool FIsCustomColor;
	bool __fastcall IsDescriptionStored(void);
	void __fastcall SetColor(const Graphics::TColor Value);
	void __fastcall SetDescription(const AnsiString Value);
	
public:
	__fastcall virtual TcxColorComboBoxItem(Classes::TCollection* Collection);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	__property bool IsCustomColor = {read=FIsCustomColor, nodefault};
	
__published:
	__property Graphics::TColor Color = {read=FColor, write=SetColor, nodefault};
	__property AnsiString Description = {read=FDescription, write=SetDescription, stored=IsDescriptionStored};
public:
	#pragma option push -w-inl
	/* TCollectionItem.Destroy */ inline __fastcall virtual ~TcxColorComboBoxItem(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxColorComboBoxItems;
class PASCALIMPLEMENTATION TcxColorComboBoxItems : public Classes::TOwnedCollection 
{
	typedef Classes::TOwnedCollection inherited;
	
public:
	TcxColorComboBoxItem* operator[](int Index) { return Items[Index]; }
	
private:
	TcxColorComboBoxItem* __fastcall GetItems(int Index);
	void __fastcall SetItems(int Index, const TcxColorComboBoxItem* Value);
	
protected:
	virtual void __fastcall Update(Classes::TCollectionItem* Item);
	
public:
	__property TcxColorComboBoxItem* Items[int Index] = {read=GetItems, write=SetItems/*, default*/};
	virtual TcxColorComboBoxItem* __fastcall FindColorItem(const Graphics::TColor AColor);
	int __fastcall GetIndexByColor(Graphics::TColor AColor);
	Graphics::TColor __fastcall GetColorByIndex(int AIndex, Graphics::TColor ADefaultColor);
	virtual TcxColorComboBoxItem* __fastcall AddColor(const Graphics::TColor AColor, const AnsiString ADescription);
	virtual TcxColorComboBoxItem* __fastcall InsertColor(int Index, const Graphics::TColor AColor, const AnsiString ADescription);
	HIDESBASE TcxColorComboBoxItem* __fastcall Add(void);
	HIDESBASE TcxColorComboBoxItem* __fastcall Insert(int Index);
	virtual void __fastcall Move(int CurIndex, int NewIndex);
	virtual void __fastcall ClearNonCustom(void);
public:
	#pragma option push -w-inl
	/* TOwnedCollection.Create */ inline __fastcall TcxColorComboBoxItems(Classes::TPersistent* AOwner, TMetaClass* ItemClass) : Classes::TOwnedCollection(AOwner, ItemClass) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TCollection.Destroy */ inline __fastcall virtual ~TcxColorComboBoxItems(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomColorComboBoxViewInfo;
class PASCALIMPLEMENTATION TcxCustomColorComboBoxViewInfo : public Cxtextedit::TcxCustomTextEditViewInfo 
{
	typedef Cxtextedit::TcxCustomTextEditViewInfo inherited;
	
private:
	Graphics::TColor FBkColor;
	int FColorBoxWidth;
	TcxColorBoxAlign FColorBoxAlign;
	#pragma pack(push, 1)
	Types::TRect FColorBoxRect;
	#pragma pack(pop)
	
	Graphics::TColor FColorBoxFrameColor;
	Graphics::TColor FColorBoxColor;
	bool FShowDescriptions;
	TcxDefaultColorStyle FDefaultColorStyle;
	bool FFoundItem;
	
public:
	__property Graphics::TColor BkColor = {read=FBkColor, write=FBkColor, nodefault};
	__property int ColorBoxWidth = {read=FColorBoxWidth, write=FColorBoxWidth, nodefault};
	__property TcxColorBoxAlign ColorBoxAlign = {read=FColorBoxAlign, write=FColorBoxAlign, nodefault};
	__property Graphics::TColor ColorBoxFrameColor = {read=FColorBoxFrameColor, write=FColorBoxFrameColor, nodefault};
	__property Graphics::TColor ColorBoxColor = {read=FColorBoxColor, write=FColorBoxColor, nodefault};
	__property Types::TRect ColorBoxRect = {read=FColorBoxRect, write=FColorBoxRect};
	__property TcxDefaultColorStyle DefaultColorStyle = {read=FDefaultColorStyle, write=FDefaultColorStyle, nodefault};
	__property bool ShowDescriptions = {read=FShowDescriptions, write=FShowDescriptions, nodefault};
	__property bool FoundItem = {read=FFoundItem, write=FFoundItem, nodefault};
	virtual void __fastcall Paint(Cxgraphics::TcxCanvas* ACanvas);
	virtual void __fastcall Offset(int DX, int DY);
public:
	#pragma option push -w-inl
	/* TcxCustomTextEditViewInfo.Destroy */ inline __fastcall virtual ~TcxCustomColorComboBoxViewInfo(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomEditViewInfo.Create */ inline __fastcall virtual TcxCustomColorComboBoxViewInfo(void) : Cxtextedit::TcxCustomTextEditViewInfo() { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomColorComboBoxViewData;
class PASCALIMPLEMENTATION TcxCustomColorComboBoxViewData : public Cxdropdownedit::TcxCustomDropDownEditViewData 
{
	typedef Cxdropdownedit::TcxCustomDropDownEditViewData inherited;
	
protected:
	virtual void __fastcall CalculateViewInfoProperties(Cxedit::TcxCustomEditViewInfo* AViewInfo);
	
public:
	virtual bool __fastcall IsComboBoxStyle(void);
	virtual void __fastcall Calculate(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ABounds, const Types::TPoint &P, Cxcontainer::TcxMouseButton Button, Classes::TShiftState Shift, Cxedit::TcxCustomEditViewInfo* AViewInfo, bool AIsMouseEvent);
	virtual void __fastcall DisplayValueToDrawValue(const Variant &ADisplayValue, Cxedit::TcxCustomEditViewInfo* AViewInfo);
	virtual void __fastcall EditValueToDrawValue(Cxgraphics::TcxCanvas* ACanvas, const Variant &AEditValue, Cxedit::TcxCustomEditViewInfo* AViewInfo);
	virtual tagSIZE __fastcall GetEditContentSize(Cxgraphics::TcxCanvas* ACanvas, const Variant &AEditValue, const Cxedit::TcxEditSizeProperties &AEditSizeProperties);
public:
	#pragma option push -w-inl
	/* TcxCustomEditViewData.Create */ inline __fastcall virtual TcxCustomColorComboBoxViewData(Cxedit::TcxCustomEditProperties* AProperties, Cxcontainer::TcxContainerStyle* AStyle, bool AIsInplace) : Cxdropdownedit::TcxCustomDropDownEditViewData(AProperties, AStyle, AIsInplace) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxCustomColorComboBoxViewData(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomColorComboBoxListBox;
class DELPHICLASS TcxCustomColorComboBoxProperties;
#pragma option push -b-
enum TcxColorComboStyle { cxccsComboList, cxccsComboEdit };
#pragma option pop

#pragma option push -b-
enum TcxColorDialogType { cxcdtDefault, cxcdtCustom };
#pragma option pop

typedef void __fastcall (__closure *TcxNamingConventionEvent)(System::TObject* Sender, const Graphics::TColor AColor, AnsiString &AColorDescription);

typedef void __fastcall (__closure *TcxSelectCustomColorEvent)(System::TObject* Sender, Graphics::TColor &AColor, AnsiString &AColorDescription, bool &AddToList);

typedef void __fastcall (__closure *TcxGetDefaultColorEvent)(System::TObject* Sender, Graphics::TColor &AColor);

class PASCALIMPLEMENTATION TcxCustomColorComboBoxProperties : public Cxdropdownedit::TcxCustomComboBoxProperties 
{
	typedef Cxdropdownedit::TcxCustomComboBoxProperties inherited;
	
private:
	bool FAllowSelectColor;
	TcxColorComboStyle FColorComboStyle;
	TcxColorBoxAlign FColorBoxAlign;
	Graphics::TColor FColorBoxFrameColor;
	int FColorBoxWidth;
	TcxColorDialogType FColorDialogType;
	Graphics::TColor FDefaultColor;
	AnsiString FDefaultDescription;
	TcxDefaultColorStyle FDefaultColorStyle;
	TcxColorComboBoxItems* FItems;
	TcxColorComboBoxItems* FMRUColors;
	Byte FMaxMRUColors;
	TcxColorNamingConvention FNamingConvention;
	TcxColorValueFormat FColorValueFormat;
	bool FShowDescriptions;
	TcxNamingConventionEvent FOnNamingConvention;
	TcxSelectCustomColorEvent FOnSelectCustomColor;
	Classes::TNotifyEvent FOnAddedMRUColor;
	Classes::TNotifyEvent FOnDeletedMRUColor;
	TcxGetDefaultColorEvent FOnGetDefaultColor;
	Classes::TNotifyEvent FOnLoadColorList;
	bool FInternalUpdate;
	TcxColorPrepareList FPrepareList;
	AnsiString FPrepareInfo;
	HIDESBASE TcxColorComboBoxItems* __fastcall GetItems(void);
	void __fastcall SetColorBoxWidth(int Value);
	void __fastcall SetColorBoxAlign(TcxColorBoxAlign Value);
	void __fastcall SetColorBoxFrameColor(Graphics::TColor Value);
	void __fastcall SetDefaultColor(Graphics::TColor Value);
	void __fastcall SetDefaultDescription(AnsiString Value);
	void __fastcall SetDefaultColorStyle(TcxDefaultColorStyle Value);
	void __fastcall SetShowDescriptions(const bool Value);
	void __fastcall SetAllowSelectColor(bool Value);
	void __fastcall SetColorComboStyle(TcxColorComboStyle Value);
	HIDESBASE void __fastcall SetItems(const TcxColorComboBoxItems* Value);
	void __fastcall SetMaxMRUColors(Byte Value);
	void __fastcall SetNamingConvention(TcxColorNamingConvention Value);
	void __fastcall SetColorValueFormat(TcxColorValueFormat Value);
	void __fastcall SetPrepareInfo(AnsiString Value);
	void __fastcall SetupViewInfoByItem(int AIndex, TcxCustomColorComboBoxViewInfo* AViewInfo, const Variant &AEditValue);
	AnsiString __fastcall DoConvertNaming(int AIndex);
	void __fastcall DeleteOverMRUColors(void);
	TcxColorComboBoxItem* __fastcall ColorItemByIndex(int AIndex);
	void __fastcall ValidateMRUColors(void);
	void __fastcall InternalPrepareDelphiColorList(void);
	void __fastcall InternalPrepareHTML4ColorList(void);
	void __fastcall InternalPrepareX11ColorList(void);
	void __fastcall InternalPrepareX11OrderedColorList(void);
	void __fastcall ReadPrepareInfo(Classes::TReader* Reader);
	void __fastcall WritePrepareInfo(Classes::TWriter* Writer);
	void __fastcall ReadColorItems(Classes::TReader* Reader);
	void __fastcall WriteColorItems(Classes::TWriter* Writer);
	
protected:
	virtual void __fastcall DefineProperties(Classes::TFiler* Filer);
	__property TcxColorComboBoxItems* MRUColors = {read=FMRUColors, write=FMRUColors};
	__property Byte MaxMRUColors = {read=FMaxMRUColors, write=SetMaxMRUColors, default=10};
	__property int ColorBoxWidth = {read=FColorBoxWidth, write=SetColorBoxWidth, default=30};
	__property TcxColorBoxAlign ColorBoxAlign = {read=FColorBoxAlign, write=SetColorBoxAlign, default=0};
	__property Graphics::TColor ColorBoxFrameColor = {read=FColorBoxFrameColor, write=SetColorBoxFrameColor, default=-2147483632};
	__property TcxColorDialogType ColorDialogType = {read=FColorDialogType, write=FColorDialogType, default=0};
	__property Graphics::TColor DefaultColor = {read=FDefaultColor, write=SetDefaultColor, default=-2147483643};
	__property AnsiString DefaultDescription = {read=FDefaultDescription, write=SetDefaultDescription};
	__property TcxDefaultColorStyle DefaultColorStyle = {read=FDefaultColorStyle, write=SetDefaultColorStyle, default=1};
	__property bool AllowSelectColor = {read=FAllowSelectColor, write=SetAllowSelectColor, default=0};
	__property TcxColorComboStyle ColorComboStyle = {read=FColorComboStyle, write=SetColorComboStyle, default=1};
	__property TcxColorNamingConvention NamingConvention = {read=FNamingConvention, write=SetNamingConvention, default=1};
	__property TcxColorValueFormat ColorValueFormat = {read=FColorValueFormat, write=SetColorValueFormat, default=0};
	__property bool ShowDescriptions = {read=FShowDescriptions, write=SetShowDescriptions, default=1};
	__property TcxSelectCustomColorEvent OnSelectCustomColor = {read=FOnSelectCustomColor, write=FOnSelectCustomColor};
	__property TcxNamingConventionEvent OnNamingConvention = {read=FOnNamingConvention, write=FOnNamingConvention};
	__property Classes::TNotifyEvent OnAddedMRUColor = {read=FOnAddedMRUColor, write=FOnAddedMRUColor};
	__property Classes::TNotifyEvent OnDeletedMRUColor = {read=FOnDeletedMRUColor, write=FOnDeletedMRUColor};
	__property TcxGetDefaultColorEvent OnGetDefaultColor = {read=FOnGetDefaultColor, write=FOnGetDefaultColor};
	/* virtual class method */ virtual TMetaClass* __fastcall GetPopupWindowClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewDataClass(TMetaClass* vmt);
	int __fastcall IndexByValue(const Variant &AValue);
	Graphics::TColor __fastcall GetColorByIndex(int AIndex);
	int __fastcall GetIndexByColor(Graphics::TColor AColor);
	AnsiString __fastcall GetDescriptionByIndex(int AIndex);
	virtual bool __fastcall IsDisplayValueNumeric(void);
	virtual bool __fastcall IsEditValueNumeric(void);
	virtual TcxMRUColorAction __fastcall AddMRUColor(const Graphics::TColor AColor);
	virtual TcxMRUColorAction __fastcall DelMRUColor(const Graphics::TColor AColor);
	virtual void __fastcall ClearMRUColors(void);
	virtual void __fastcall Changed(void);
	virtual void __fastcall DoGetDefaultColor(Graphics::TColor &AColor);
	void __fastcall TranslateValues(const Variant &AEditValue, Graphics::TColor &AColor, AnsiString &ADescription);
	__property TcxColorPrepareList PrepareList = {read=FPrepareList, write=FPrepareList, default=1};
	__property TcxColorComboBoxItems* Items = {read=GetItems, write=SetItems, stored=false};
	__property AnsiString PrepareInfo = {read=FPrepareInfo, write=SetPrepareInfo, stored=false};
	
public:
	__fastcall virtual TcxCustomColorComboBoxProperties(Classes::TPersistent* AOwner);
	__fastcall virtual ~TcxCustomColorComboBoxProperties(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	/* virtual class method */ virtual TMetaClass* __fastcall GetContainerClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall GetLookupDataClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewInfoClass(TMetaClass* vmt);
	virtual Cxdatautils::TcxDataEditValueSource __fastcall GetEditValueSource(bool AEditFocused);
	virtual void __fastcall PrepareDisplayValue(const Variant &AEditValue, Variant &DisplayValue, bool AEditFocused);
	virtual Cxedit::TcxEditSupportedOperations __fastcall GetSupportedOperations(void);
	virtual WideString __fastcall GetDisplayText(const Variant &AEditValue, bool AFullText = false);
	virtual void __fastcall Update(Cxedit::TcxCustomEditProperties* AProperties);
	void __fastcall PrepareDelphiColorList(const bool ASaveCustom, const bool ASaveMRU);
	void __fastcall PrepareHTML4ColorList(const bool ASaveCustom, const bool ASaveMRU);
	void __fastcall PrepareX11ColorList(const bool ASaveCustom, const bool ASaveMRU);
	void __fastcall PrepareX11OrderedColorList(const bool ASaveCustom, const bool ASaveMRU);
};


class DELPHICLASS TcxCustomColorComboBox;
class PASCALIMPLEMENTATION TcxCustomColorComboBoxListBox : public Cxtextedit::TcxCustomEditListBox 
{
	typedef Cxtextedit::TcxCustomEditListBox inherited;
	
private:
	TcxCustomColorComboBoxProperties* FProperties;
	TcxCustomColorComboBox* __fastcall GetEdit(void);
	
protected:
	TcxCustomColorComboBox* FEdit;
	virtual bool __fastcall DoDrawItem(int AIndex, const Types::TRect &ARect, Windows::TOwnerDrawState AState);
	virtual int __fastcall GetHeight(int ARowCount, int AMaxHeight);
	virtual AnsiString __fastcall GetItem(int Index);
	virtual int __fastcall GetItemHeight(int AIndex = 0xffffffff);
	DYNAMIC void __fastcall Click(void);
	DYNAMIC void __fastcall Resize(void);
	DYNAMIC void __fastcall MouseMove(Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseUp(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall DrawItem(int Index, const Types::TRect &Rect, Windows::TOwnerDrawState State);
	virtual void __fastcall MeasureItem(int Index, int &Height);
	
public:
	__property TcxCustomColorComboBox* Edit = {read=GetEdit};
	__property TcxCustomColorComboBoxProperties* Properties = {read=FProperties};
	__fastcall virtual TcxCustomColorComboBoxListBox(Classes::TComponent* AOwner);
public:
	#pragma option push -w-inl
	/* TcxCustomInnerListBox.Destroy */ inline __fastcall virtual ~TcxCustomColorComboBoxListBox(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomColorComboBoxListBox(HWND ParentWindow) : Cxtextedit::TcxCustomEditListBox(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxColorComboBoxLookupData;
class PASCALIMPLEMENTATION TcxColorComboBoxLookupData : public Cxdropdownedit::TcxComboBoxLookupData 
{
	typedef Cxdropdownedit::TcxComboBoxLookupData inherited;
	
protected:
	virtual TMetaClass* __fastcall GetListBoxClass(void);
	virtual AnsiString __fastcall GetItem(int Index);
	virtual int __fastcall GetItemCount(void);
	virtual int __fastcall InternalChangeCurrentMRUColorPosition(const Graphics::TColor AColor);
	
public:
	virtual void __fastcall TextChanged(void);
public:
	#pragma option push -w-inl
	/* TcxCustomTextEditLookupData.Create */ inline __fastcall virtual TcxColorComboBoxLookupData(Classes::TPersistent* AOwner) : Cxdropdownedit::TcxComboBoxLookupData(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxColorComboBoxLookupData(void) { }
	#pragma option pop
	
};


typedef void __fastcall (__closure *TcxChangeItemIndexEvent)(System::TObject* Sender, const int AIndex);

class DELPHICLASS TcxColorComboBoxProperties;
class PASCALIMPLEMENTATION TcxColorComboBoxProperties : public TcxCustomColorComboBoxProperties 
{
	typedef TcxCustomColorComboBoxProperties inherited;
	
__published:
	__property AllowSelectColor  = {default=0};
	__property ColorComboStyle  = {default=1};
	__property ColorBoxAlign  = {default=0};
	__property ColorBoxFrameColor  = {default=-2147483632};
	__property ColorBoxWidth  = {default=30};
	__property ColorDialogType  = {default=0};
	__property ColorValueFormat  = {default=0};
	__property DefaultColor  = {default=-2147483643};
	__property DefaultDescription ;
	__property DefaultColorStyle  = {default=1};
	__property ShowDescriptions  = {default=1};
	__property MaxMRUColors  = {default=10};
	__property NamingConvention  = {default=1};
	__property PrepareList  = {default=1};
	__property Items ;
	__property PrepareInfo ;
	__property OnSelectCustomColor ;
	__property OnNamingConvention ;
	__property OnAddedMRUColor ;
	__property OnDeletedMRUColor ;
	__property OnGetDefaultColor ;
	__property Alignment ;
	__property BeepOnError  = {default=0};
	__property ButtonGlyph ;
	__property CharCase  = {default=0};
	__property DropDownAutoWidth  = {default=1};
	__property DropDownRows  = {default=8};
	__property DropDownSizeable  = {default=0};
	__property DropDownWidth  = {default=0};
	__property ImmediateDropDown  = {default=1};
	__property ImmediatePost  = {default=0};
	__property ImmediateUpdateText  = {default=0};
	__property OEMConvert  = {default=0};
	__property PopupAlignment  = {default=0};
	__property ReadOnly ;
	__property Revertable  = {default=0};
	__property ValidateOnEnter  = {default=1};
	__property OnChange ;
	__property OnCloseUp ;
	__property OnEditValueChanged ;
	__property OnInitPopup ;
	__property OnNewLookupDisplayText ;
	__property OnPopup ;
	__property OnValidate ;
	
public:
	__property MRUColors ;
public:
	#pragma option push -w-inl
	/* TcxCustomColorComboBoxProperties.Create */ inline __fastcall virtual TcxColorComboBoxProperties(Classes::TPersistent* AOwner) : TcxCustomColorComboBoxProperties(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomColorComboBoxProperties.Destroy */ inline __fastcall virtual ~TcxColorComboBoxProperties(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomColorComboBoxInnerEdit;
class PASCALIMPLEMENTATION TcxCustomColorComboBoxInnerEdit : public Cxdropdownedit::TcxCustomComboBoxInnerEdit 
{
	typedef Cxdropdownedit::TcxCustomComboBoxInnerEdit inherited;
	
public:
	#pragma option push -w-inl
	/* TcxCustomInnerTextEdit.Create */ inline __fastcall virtual TcxCustomColorComboBoxInnerEdit(Classes::TComponent* AOwner) : Cxdropdownedit::TcxCustomComboBoxInnerEdit(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomInnerTextEdit.Destroy */ inline __fastcall virtual ~TcxCustomColorComboBoxInnerEdit(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomColorComboBoxInnerEdit(HWND ParentWindow) : Cxdropdownedit::TcxCustomComboBoxInnerEdit(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxColorComboBoxPopupWindow;
class PASCALIMPLEMENTATION TcxColorComboBoxPopupWindow : public Cxdropdownedit::TcxComboBoxPopupWindow 
{
	typedef Cxdropdownedit::TcxComboBoxPopupWindow inherited;
	
public:
	__property ViewInfo ;
	__property SysPanelStyle ;
public:
	#pragma option push -w-inl
	/* TcxCustomEditPopupWindow.Create */ inline __fastcall virtual TcxColorComboBoxPopupWindow(Controls::TWinControl* AOwnerControl) : Cxdropdownedit::TcxComboBoxPopupWindow(AOwnerControl) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomPopupWindow.Destroy */ inline __fastcall virtual ~TcxColorComboBoxPopupWindow(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual TcxColorComboBoxPopupWindow(Classes::TComponent* AOwner, int Dummy) : Cxdropdownedit::TcxComboBoxPopupWindow(AOwner, Dummy) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxColorComboBoxPopupWindow(HWND ParentWindow) : Cxdropdownedit::TcxComboBoxPopupWindow(ParentWindow) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxCustomColorComboBox : public Cxdropdownedit::TcxCustomComboBox 
{
	typedef Cxdropdownedit::TcxCustomComboBox inherited;
	
private:
	Graphics::TColor FColorValue;
	Graphics::TColor FSavedColor;
	bool FPropertiesUpdate;
	bool FIsDialogShowed;
	void __fastcall SetColorValue(Graphics::TColor Value);
	HIDESBASE int __fastcall GetItemIndex(void);
	HIDESBASE TcxColorComboBoxLookupData* __fastcall GetLookupData(void);
	HIDESBASE TcxColorComboBoxProperties* __fastcall GetProperties(void);
	HIDESBASE void __fastcall SetItemIndex(int Value);
	HIDESBASE void __fastcall SetProperties(TcxColorComboBoxProperties* Value);
	void __fastcall PropertiesLoadColorListHandler(System::TObject* Sender);
	void __fastcall FlushEditValue(void);
	
protected:
	virtual void __fastcall ContainerStyleChanged(System::TObject* Sender);
	virtual void __fastcall PropertiesChanged(System::TObject* Sender);
	DYNAMIC void __fastcall DblClick(void);
	virtual void __fastcall DoButtonClick(int AButtonVisibleIndex);
	virtual TMetaClass* __fastcall GetInnerEditClass(void);
	virtual tagSIZE __fastcall GetPopupWindowClientPreferredSize();
	virtual void __fastcall InitializePopupWindow(void);
	virtual void __fastcall InitializeLookupData(void);
	virtual bool __fastcall IsValidChar(char AChar);
	virtual void __fastcall DoEditKeyDown(Word &Key, Classes::TShiftState Shift);
	__property Graphics::TColor ColorValue = {read=FColorValue, write=SetColorValue, default=-2147483643};
	__property int ItemIndex = {read=GetItemIndex, write=SetItemIndex, nodefault};
	__property TcxColorComboBoxLookupData* LookupData = {read=GetLookupData};
	__property TcxColorComboBoxProperties* Properties = {read=GetProperties, write=SetProperties};
	virtual Variant __fastcall LookupKeyToEditValue(const Variant &AKey);
	virtual void __fastcall InternalSetEditValue(const Variant &Value, bool AValidateEditValue);
	virtual void __fastcall SynchronizeDisplayValue(void);
	virtual void __fastcall CloseUp(bool AAccept);
	virtual void __fastcall DoSelectCustomColor(System::TObject* Sender);
	virtual void __fastcall FixMRUPosition(Graphics::TColor AColor);
	virtual void __fastcall ClearEditValue(void);
	
public:
	__fastcall virtual TcxCustomColorComboBox(Classes::TComponent* AOwner)/* overload */;
	virtual void __fastcall Loaded(void);
	/* virtual class method */ virtual TMetaClass* __fastcall GetPropertiesClass(TMetaClass* vmt);
	virtual void __fastcall PrepareEditValue(const Variant &ADisplayValue, /* out */ Variant &EditValue, bool AEditFocused);
	virtual void __fastcall PrepareDisplayValue(const Variant &AEditValue, Variant &DisplayValue, bool AEditFocused);
	TcxMRUColorAction __fastcall AddMRUColor(const Graphics::TColor AColor);
	TcxMRUColorAction __fastcall DelMRUColor(const Graphics::TColor AColor);
	void __fastcall PrepareDelphiColorList(const bool ASaveCustom, const bool ASaveMRU);
	void __fastcall PrepareHTML4ColorList(const bool ASaveCustom, const bool ASaveMRU);
	void __fastcall PrepareX11ColorList(const bool ASaveCustom, const bool ASaveMRU);
	void __fastcall PrepareX11OrderedColorList(const bool ASaveCustom, const bool ASaveMRU);
	DYNAMIC bool __fastcall Focused(void);
public:
	#pragma option push -w-inl
	/* TcxCustomDropDownEdit.Destroy */ inline __fastcall virtual ~TcxCustomColorComboBox(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomColorComboBox(HWND ParentWindow) : Cxdropdownedit::TcxCustomComboBox(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxColorComboBox;
class PASCALIMPLEMENTATION TcxColorComboBox : public TcxCustomColorComboBox 
{
	typedef TcxCustomColorComboBox inherited;
	
public:
	__property ItemIndex ;
	
__published:
	__property Anchors  = {default=3};
	__property AutoSize  = {default=1};
	__property BeepOnEnter  = {default=1};
	__property ColorValue  = {default=-2147483643};
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
	__property Visible  = {default=1};
	__property OnClick ;
	__property OnContextPopup ;
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
	__property OnMouseEnter ;
	__property OnMouseLeave ;
	__property OnMouseMove ;
	__property OnMouseUp ;
	__property OnStartDrag ;
	__property OnEndDock ;
	__property OnStartDock ;
public:
	#pragma option push -w-inl
	/* TcxCustomColorComboBox.Create */ inline __fastcall virtual TcxColorComboBox(Classes::TComponent* AOwner)/* overload */ : TcxCustomColorComboBox(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomDropDownEdit.Destroy */ inline __fastcall virtual ~TcxColorComboBox(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxColorComboBox(HWND ParentWindow) : TcxCustomColorComboBox(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxcolorcombobox */
using namespace Cxcolorcombobox;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxColorComboBox
