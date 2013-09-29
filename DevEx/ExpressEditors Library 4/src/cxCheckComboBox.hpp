// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxCheckComboBox.pas' rev: 6.00

#ifndef cxCheckComboBoxHPP
#define cxCheckComboBoxHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Menus.hpp>	// Pascal unit
#include <cxDataUtils.hpp>	// Pascal unit
#include <cxExtEditConsts.hpp>	// Pascal unit
#include <cxLookAndFeels.hpp>	// Pascal unit
#include <cxCheckBox.hpp>	// Pascal unit
#include <Math.hpp>	// Pascal unit
#include <cxExtEditUtils.hpp>	// Pascal unit
#include <cxVariants.hpp>	// Pascal unit
#include <cxImageComboBox.hpp>	// Pascal unit
#include <cxDropDownEdit.hpp>	// Pascal unit
#include <cxMaskEdit.hpp>	// Pascal unit
#include <cxTextEdit.hpp>	// Pascal unit
#include <cxEditUtils.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <Variants.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxcheckcombobox
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxCheckPaintHelper;
class PASCALIMPLEMENTATION TcxCheckPaintHelper : public Cxexteditutils::TcxCustomCheckPaintHelper 
{
	typedef Cxexteditutils::TcxCustomCheckPaintHelper inherited;
	
public:
	#pragma option push -w-inl
	/* TcxCustomCheckPaintHelper.Create */ inline __fastcall TcxCheckPaintHelper(Classes::TPersistent* AOwner) : Cxexteditutils::TcxCustomCheckPaintHelper(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomCheckPaintHelper.Destroy */ inline __fastcall virtual ~TcxCheckPaintHelper(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCheckComboBoxItem;
class PASCALIMPLEMENTATION TcxCheckComboBoxItem : public Classes::TCollectionItem 
{
	typedef Classes::TCollectionItem inherited;
	
private:
	AnsiString FDescription;
	Cxcheckbox::TcxCheckBoxState FState;
	bool FEnabled;
	void __fastcall SetDescription(const AnsiString Value);
	void __fastcall SetEnabled(bool Value);
	
public:
	__fastcall virtual TcxCheckComboBoxItem(Classes::TCollection* Collection);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	
__published:
	__property AnsiString Description = {read=FDescription, write=SetDescription};
	__property bool Enabled = {read=FEnabled, write=SetEnabled, default=1};
public:
	#pragma option push -w-inl
	/* TCollectionItem.Destroy */ inline __fastcall virtual ~TcxCheckComboBoxItem(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCheckComboBoxItems;
class PASCALIMPLEMENTATION TcxCheckComboBoxItems : public Classes::TOwnedCollection 
{
	typedef Classes::TOwnedCollection inherited;
	
public:
	TcxCheckComboBoxItem* operator[](int Index) { return Items[Index]; }
	
private:
	TcxCheckComboBoxItem* __fastcall GetItems(int Index);
	void __fastcall SetItems(int Index, const TcxCheckComboBoxItem* Value);
	
protected:
	virtual void __fastcall Update(Classes::TCollectionItem* Item);
	
public:
	__property TcxCheckComboBoxItem* Items[int Index] = {read=GetItems, write=SetItems/*, default*/};
	Cxcheckbox::TcxCheckBoxState __fastcall GetStateByIndex(int AIndex, Cxcheckbox::TcxCheckBoxState ADefaultState);
	HIDESBASE TcxCheckComboBoxItem* __fastcall Add(void);
	TcxCheckComboBoxItem* __fastcall AddCheckItem(const AnsiString ADescription);
public:
	#pragma option push -w-inl
	/* TOwnedCollection.Create */ inline __fastcall TcxCheckComboBoxItems(Classes::TPersistent* AOwner, TMetaClass* ItemClass) : Classes::TOwnedCollection(AOwner, ItemClass) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TCollection.Destroy */ inline __fastcall virtual ~TcxCheckComboBoxItems(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomCheckComboBoxViewInfo;
class PASCALIMPLEMENTATION TcxCustomCheckComboBoxViewInfo : public Cxtextedit::TcxCustomTextEditViewInfo 
{
	typedef Cxtextedit::TcxCustomTextEditViewInfo inherited;
	
public:
	virtual void __fastcall Paint(Cxgraphics::TcxCanvas* ACanvas);
public:
	#pragma option push -w-inl
	/* TcxCustomTextEditViewInfo.Destroy */ inline __fastcall virtual ~TcxCustomCheckComboBoxViewInfo(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomEditViewInfo.Create */ inline __fastcall virtual TcxCustomCheckComboBoxViewInfo(void) : Cxtextedit::TcxCustomTextEditViewInfo() { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomCheckComboBoxViewData;
class PASCALIMPLEMENTATION TcxCustomCheckComboBoxViewData : public Cxdropdownedit::TcxCustomDropDownEditViewData 
{
	typedef Cxdropdownedit::TcxCustomDropDownEditViewData inherited;
	
public:
	virtual bool __fastcall IsComboBoxStyle(void);
	virtual void __fastcall Calculate(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ABounds, const Types::TPoint &P, Cxcontainer::TcxMouseButton Button, Classes::TShiftState Shift, Cxedit::TcxCustomEditViewInfo* AViewInfo, bool AIsMouseEvent);
	virtual void __fastcall DisplayValueToDrawValue(const Variant &ADisplayValue, Cxedit::TcxCustomEditViewInfo* AViewInfo);
	virtual void __fastcall EditValueToDrawValue(Cxgraphics::TcxCanvas* ACanvas, const Variant &AEditValue, Cxedit::TcxCustomEditViewInfo* AViewInfo);
	virtual tagSIZE __fastcall GetEditContentSize(Cxgraphics::TcxCanvas* ACanvas, const Variant &AEditValue, const Cxedit::TcxEditSizeProperties &AEditSizeProperties);
public:
	#pragma option push -w-inl
	/* TcxCustomEditViewData.Create */ inline __fastcall virtual TcxCustomCheckComboBoxViewData(Cxedit::TcxCustomEditProperties* AProperties, Cxcontainer::TcxContainerStyle* AStyle, bool AIsInplace) : Cxdropdownedit::TcxCustomDropDownEditViewData(AProperties, AStyle, AIsInplace) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxCustomCheckComboBoxViewData(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomCheckComboBoxListBox;
class DELPHICLASS TcxCustomCheckComboBox;
class PASCALIMPLEMENTATION TcxCustomCheckComboBoxListBox : public Cxtextedit::TcxCustomEditListBox 
{
	typedef Cxtextedit::TcxCustomEditListBox inherited;
	
private:
	bool FInternalUpdate;
	TcxCustomCheckComboBox* __fastcall GetEdit(void);
	
protected:
	TcxCustomCheckComboBox* FEdit;
	virtual bool __fastcall DoDrawItem(int AIndex, const Types::TRect &ARect, Windows::TOwnerDrawState AState);
	virtual int __fastcall GetHeight(int ARowCount, int AMaxHeight);
	virtual AnsiString __fastcall GetItem(int Index);
	virtual int __fastcall GetItemHeight(int AIndex = 0xffffffff);
	DYNAMIC void __fastcall Resize(void);
	DYNAMIC void __fastcall MouseMove(Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseUp(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall KeyDown(Word &Key, Classes::TShiftState Shift);
	DYNAMIC void __fastcall KeyPress(char &Key);
	virtual void __fastcall UpdateItemState(const int AIndex);
	virtual void __fastcall SetItemIndex(const int Value)/* overload */;
	virtual void __fastcall DrawItem(int Index, const Types::TRect &Rect, Windows::TOwnerDrawState State);
	virtual void __fastcall MeasureItem(int Index, int &Height);
	__property TcxCustomCheckComboBox* Edit = {read=GetEdit};
	
public:
	__fastcall virtual TcxCustomCheckComboBoxListBox(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxCustomCheckComboBoxListBox(void);
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomCheckComboBoxListBox(HWND ParentWindow) : Cxtextedit::TcxCustomEditListBox(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCheckComboBoxLookupData;
class PASCALIMPLEMENTATION TcxCheckComboBoxLookupData : public Cxdropdownedit::TcxComboBoxLookupData 
{
	typedef Cxdropdownedit::TcxComboBoxLookupData inherited;
	
protected:
	virtual TMetaClass* __fastcall GetListBoxClass(void);
	virtual AnsiString __fastcall GetItem(int Index);
	virtual int __fastcall GetItemCount(void);
	
public:
	virtual bool __fastcall CanResizeVisualArea(tagSIZE &NewSize);
	virtual tagSIZE __fastcall GetVisualAreaPreferredSize(int AMaxHeight, int AWidth = 0x0);
	virtual void __fastcall Initialize(Controls::TWinControl* AVisualControlsParent);
public:
	#pragma option push -w-inl
	/* TcxCustomTextEditLookupData.Create */ inline __fastcall virtual TcxCheckComboBoxLookupData(Classes::TPersistent* AOwner) : Cxdropdownedit::TcxComboBoxLookupData(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxCheckComboBoxLookupData(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCheckComboPropertiesValues;
class PASCALIMPLEMENTATION TcxCheckComboPropertiesValues : public Cxtextedit::TcxTextEditPropertiesValues 
{
	typedef Cxtextedit::TcxTextEditPropertiesValues inherited;
	
public:
	bool ValueType;
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual void __fastcall Reset(void);
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxCheckComboPropertiesValues(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxCheckComboPropertiesValues(void) : Cxtextedit::TcxTextEditPropertiesValues() { }
	#pragma option pop
	
};


#pragma option push -b-
enum TcxCheckComboValueType { vtInt, vtFloat };
#pragma option pop

class DELPHICLASS TcxCustomCheckComboBoxProperties;
class PASCALIMPLEMENTATION TcxCustomCheckComboBoxProperties : public Cxdropdownedit::TcxCustomComboBoxProperties 
{
	typedef Cxdropdownedit::TcxCustomComboBoxProperties inherited;
	
private:
	AnsiString FDelimiter;
	AnsiString FEmptySelectionText;
	bool FShowEmptyText;
	TcxCheckComboBoxItems* FItems;
	TcxCheckPaintHelper* FCheckPaintHelper;
	TcxCheckComboValueType FValueType;
	Graphics::TBitmap* FGlyph;
	int FGlyphCount;
	Graphics::TBitmap* __fastcall GetGlyph(void);
	void __fastcall GlyphChanged(System::TObject* Sender);
	void __fastcall SetGlyph(Graphics::TBitmap* Value);
	void __fastcall SetGlyphCount(int Value);
	HIDESBASE TcxCheckComboPropertiesValues* __fastcall GetAssignedValues(void);
	TcxCheckComboValueType __fastcall GetValueType(void);
	bool __fastcall IsValueTypeStored(void);
	void __fastcall SetValueType(TcxCheckComboValueType Value);
	void __fastcall SetDelimiter(AnsiString Value);
	void __fastcall SetEmptySelectionText(AnsiString Value);
	void __fastcall SetShowEmptyText(bool Value);
	HIDESBASE void __fastcall SetItems(const TcxCheckComboBoxItems* Value);
	void __fastcall SetupViewInfoByItem(const Variant &AEditValue, TcxCustomCheckComboBoxViewInfo* AViewInfo);
	
protected:
	/* virtual class method */ virtual TMetaClass* __fastcall GetAssignedValuesClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall GetPopupWindowClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewDataClass(TMetaClass* vmt);
	virtual Cxcheckbox::TcxCheckBoxState __fastcall CalculateItemState(const int AIndex, const Variant &AEditValue);
	virtual Variant __fastcall UpdateCheckEditValue(const int AIndex, const Variant &AEditValue);
	__property TcxCheckComboPropertiesValues* AssignedValues = {read=GetAssignedValues};
	__property Graphics::TBitmap* Glyph = {read=GetGlyph, write=SetGlyph};
	__property int GlyphCount = {read=FGlyphCount, write=SetGlyphCount, default=6};
	__property TcxCheckComboValueType ValueType = {read=GetValueType, write=SetValueType, stored=IsValueTypeStored, nodefault};
	__property AnsiString Delimiter = {read=FDelimiter, write=SetDelimiter};
	__property AnsiString EmptySelectionText = {read=FEmptySelectionText, write=SetEmptySelectionText};
	__property bool ShowEmptyText = {read=FShowEmptyText, write=SetShowEmptyText, default=1};
	__property TcxCheckComboBoxItems* Items = {read=FItems, write=SetItems};
	virtual void __fastcall ClearCheck(void);
	__int64 __fastcall TranslateEditValue(const Variant &AEditValue);
	virtual AnsiString __fastcall CalculateDisplayValue(const Variant &AEditValue);
	
public:
	__fastcall virtual TcxCustomCheckComboBoxProperties(Classes::TPersistent* AOwner);
	__fastcall virtual ~TcxCustomCheckComboBoxProperties(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	/* virtual class method */ virtual TMetaClass* __fastcall GetContainerClass(TMetaClass* vmt);
	virtual Cxdatautils::TcxDataEditValueSource __fastcall GetEditValueSource(bool AEditFocused);
	/* virtual class method */ virtual TMetaClass* __fastcall GetLookupDataClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewInfoClass(TMetaClass* vmt);
	virtual void __fastcall PrepareDisplayValue(const Variant &AEditValue, Variant &DisplayValue, bool AEditFocused);
	virtual bool __fastcall IsEditValueValid(Variant &EditValue, bool AEditFocused);
};


class DELPHICLASS TcxCheckComboBoxProperties;
class PASCALIMPLEMENTATION TcxCheckComboBoxProperties : public TcxCustomCheckComboBoxProperties 
{
	typedef TcxCustomCheckComboBoxProperties inherited;
	
__published:
	__property AssignedValues ;
	__property ValueType ;
	__property Delimiter ;
	__property EmptySelectionText ;
	__property ShowEmptyText  = {default=1};
	__property Alignment ;
	__property BeepOnError  = {default=0};
	__property ButtonGlyph ;
	__property CharCase  = {default=0};
	__property DropDownAutoWidth  = {default=1};
	__property DropDownRows  = {default=8};
	__property DropDownSizeable  = {default=0};
	__property DropDownWidth  = {default=0};
	__property Glyph ;
	__property GlyphCount  = {default=6};
	__property ImmediateDropDown  = {default=1};
	__property ImmediatePost  = {default=0};
	__property Items ;
	__property PopupAlignment  = {default=0};
	__property ReadOnly ;
	__property ValidateOnEnter  = {default=1};
	__property OnChange ;
	__property OnCloseUp ;
	__property OnEditValueChanged ;
	__property OnInitPopup ;
	__property OnPopup ;
public:
	#pragma option push -w-inl
	/* TcxCustomCheckComboBoxProperties.Create */ inline __fastcall virtual TcxCheckComboBoxProperties(Classes::TPersistent* AOwner) : TcxCustomCheckComboBoxProperties(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomCheckComboBoxProperties.Destroy */ inline __fastcall virtual ~TcxCheckComboBoxProperties(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomCheckComboBoxInnerEdit;
class PASCALIMPLEMENTATION TcxCustomCheckComboBoxInnerEdit : public Cxdropdownedit::TcxCustomComboBoxInnerEdit 
{
	typedef Cxdropdownedit::TcxCustomComboBoxInnerEdit inherited;
	
public:
	#pragma option push -w-inl
	/* TcxCustomInnerTextEdit.Create */ inline __fastcall virtual TcxCustomCheckComboBoxInnerEdit(Classes::TComponent* AOwner) : Cxdropdownedit::TcxCustomComboBoxInnerEdit(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomInnerTextEdit.Destroy */ inline __fastcall virtual ~TcxCustomCheckComboBoxInnerEdit(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomCheckComboBoxInnerEdit(HWND ParentWindow) : Cxdropdownedit::TcxCustomComboBoxInnerEdit(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCheckComboBoxPopupWindow;
class PASCALIMPLEMENTATION TcxCheckComboBoxPopupWindow : public Cxdropdownedit::TcxComboBoxPopupWindow 
{
	typedef Cxdropdownedit::TcxComboBoxPopupWindow inherited;
	
public:
	__property ViewInfo ;
	__property SysPanelStyle ;
public:
	#pragma option push -w-inl
	/* TcxCustomEditPopupWindow.Create */ inline __fastcall virtual TcxCheckComboBoxPopupWindow(Controls::TWinControl* AOwnerControl) : Cxdropdownedit::TcxComboBoxPopupWindow(AOwnerControl) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomPopupWindow.Destroy */ inline __fastcall virtual ~TcxCheckComboBoxPopupWindow(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual TcxCheckComboBoxPopupWindow(Classes::TComponent* AOwner, int Dummy) : Cxdropdownedit::TcxComboBoxPopupWindow(AOwner, Dummy) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCheckComboBoxPopupWindow(HWND ParentWindow) : Cxdropdownedit::TcxComboBoxPopupWindow(ParentWindow) { }
	#pragma option pop
	
};


typedef void __fastcall (__closure *TcxCheckComboClickCheckEvent)(System::TObject* Sender, int ItemIndex, bool &AllowToggle);

class PASCALIMPLEMENTATION TcxCustomCheckComboBox : public Cxdropdownedit::TcxCustomComboBox 
{
	typedef Cxdropdownedit::TcxCustomComboBox inherited;
	
private:
	bool FInternalUpdate;
	TcxCheckComboClickCheckEvent FOnClickCheck;
	HIDESBASE int __fastcall GetItemIndex(void);
	HIDESBASE TcxCheckComboBoxLookupData* __fastcall GetLookupData(void);
	HIDESBASE TcxCheckComboBoxProperties* __fastcall GetProperties(void);
	HIDESBASE void __fastcall SetItemIndex(int Value);
	HIDESBASE void __fastcall SetProperties(TcxCheckComboBoxProperties* Value);
	bool __fastcall IsValueStored(void);
	
protected:
	virtual Variant __fastcall GetValue();
	virtual void __fastcall SetValue(const Variant &AValue);
	virtual bool __fastcall ClickCheck(const int AItemIndex);
	virtual void __fastcall ContainerStyleChanged(System::TObject* Sender);
	virtual TMetaClass* __fastcall GetInnerEditClass(void);
	virtual void __fastcall InitializePopupWindow(void);
	virtual void __fastcall InternalValidateDisplayValue(const Variant &ADisplayValue);
	DYNAMIC void __fastcall KeyPress(char &Key);
	virtual void __fastcall DataChange(void);
	virtual void __fastcall UpdateData(void);
	__property int ItemIndex = {read=GetItemIndex, write=SetItemIndex, nodefault};
	__property TcxCheckComboBoxLookupData* LookupData = {read=GetLookupData};
	__property TcxCheckComboBoxProperties* Properties = {read=GetProperties, write=SetProperties};
	virtual Variant __fastcall LookupKeyToEditValue(const Variant &AKey);
	__property Variant Value = {read=GetValue, write=SetValue, stored=IsValueStored};
	virtual void __fastcall CloseUp(bool AAccept);
	__property TcxCheckComboClickCheckEvent OnClickCheck = {read=FOnClickCheck, write=FOnClickCheck};
	virtual void __fastcall InternalSetEditValue(const Variant &Value, bool AValidateEditValue);
	virtual void __fastcall SynchronizeDisplayValue(void);
	
public:
	__fastcall virtual TcxCustomCheckComboBox(Classes::TComponent* AOwner)/* overload */;
	__fastcall virtual ~TcxCustomCheckComboBox(void);
	/* virtual class method */ virtual TMetaClass* __fastcall GetPropertiesClass(TMetaClass* vmt);
	virtual void __fastcall PrepareEditValue(const Variant &ADisplayValue, /* out */ Variant &EditValue, bool AEditFocused);
	Cxcheckbox::TcxCheckBoxState __fastcall GetItemState(const int AIndex);
	void __fastcall SetItemState(const int AIndex, Cxcheckbox::TcxCheckBoxState AState);
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomCheckComboBox(HWND ParentWindow) : Cxdropdownedit::TcxCustomComboBox(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCheckComboBox;
class PASCALIMPLEMENTATION TcxCheckComboBox : public TcxCustomCheckComboBox 
{
	typedef TcxCustomCheckComboBox inherited;
	
public:
	__property ItemIndex ;
	__property Text ;
	
__published:
	__property Anchors  = {default=3};
	__property AutoSize  = {default=1};
	__property BeepOnEnter  = {default=1};
	__property Constraints ;
	__property DragCursor  = {default=-12};
	__property DragKind  = {default=0};
	__property DragMode  = {default=0};
	__property Value ;
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
	__property OnClickCheck ;
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
	/* TcxCustomCheckComboBox.Create */ inline __fastcall virtual TcxCheckComboBox(Classes::TComponent* AOwner)/* overload */ : TcxCustomCheckComboBox(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomCheckComboBox.Destroy */ inline __fastcall virtual ~TcxCheckComboBox(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCheckComboBox(HWND ParentWindow) : TcxCustomCheckComboBox(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxcheckcombobox */
using namespace Cxcheckcombobox;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxCheckComboBox
