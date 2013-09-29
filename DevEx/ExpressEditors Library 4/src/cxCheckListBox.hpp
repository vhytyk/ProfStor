// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxCheckListBox.pas' rev: 6.00

#ifndef cxCheckListBoxHPP
#define cxCheckListBoxHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Menus.hpp>	// Pascal unit
#include <cxLookAndFeels.hpp>	// Pascal unit
#include <cxScrollBar.hpp>	// Pascal unit
#include <cxDataUtils.hpp>	// Pascal unit
#include <cxDB.hpp>	// Pascal unit
#include <cxVariants.hpp>	// Pascal unit
#include <cxExtEditUtils.hpp>	// Pascal unit
#include <cxExtEditConsts.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxCheckBox.hpp>	// Pascal unit
#include <cxListBox.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <Math.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Variants.hpp>	// Pascal unit
#include <Types.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxchecklistbox
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


typedef void __fastcall (__closure *TcxClickCheckEvent)(System::TObject* Sender, const int AIndex, const Cxcheckbox::TcxCheckBoxState OldState, const Cxcheckbox::TcxCheckBoxState NewState);

typedef void __fastcall (__closure *TcxCustomMapStateToEditValueEvent)(System::TObject* Sender, Variant &EditValue);

typedef void __fastcall (__closure *TcxCustomMapEditValueToStateEvent)(System::TObject* Sender, const int Index, const Variant &EditValue, Cxcheckbox::TcxCheckBoxState &CheckState);

class DELPHICLASS TcxCheckListBoxItem;
class PASCALIMPLEMENTATION TcxCheckListBoxItem : public Classes::TCollectionItem 
{
	typedef Classes::TCollectionItem inherited;
	
private:
	AnsiString FText;
	Cxcheckbox::TcxCheckBoxState FState;
	bool FEnabled;
	bool __fastcall GetChecked(void);
	void __fastcall SetText(const AnsiString Value);
	void __fastcall SetEnabled(bool Value);
	void __fastcall SetState(Cxcheckbox::TcxCheckBoxState Value);
	void __fastcall SetChecked(bool Value);
	void __fastcall NormalizeAddedItemsCount(int Index);
	void __fastcall NormalizeDeletedItemsCount(void);
	
public:
	__fastcall virtual TcxCheckListBoxItem(Classes::TCollection* Collection);
	__fastcall virtual ~TcxCheckListBoxItem(void);
	virtual AnsiString __fastcall GetDisplayName();
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	__property bool Checked = {read=GetChecked, write=SetChecked, nodefault};
	
__published:
	__property AnsiString Text = {read=FText, write=SetText};
	__property bool Enabled = {read=FEnabled, write=SetEnabled, default=1};
	__property Cxcheckbox::TcxCheckBoxState State = {read=FState, write=SetState, default=0};
};


class DELPHICLASS TcxCheckListBoxItems;
class DELPHICLASS TcxCustomInnerCheckListBox;
class DELPHICLASS TcxCustomCheckListBox;
class PASCALIMPLEMENTATION TcxCustomInnerCheckListBox : public Cxcontainer::TcxCustomInnerListBox 
{
	typedef Cxcontainer::TcxCustomInnerListBox inherited;
	
private:
	bool FAllowGrayed;
	bool FAllowDblClickToggle;
	int FStandardItemHeight;
	TcxClickCheckEvent FOnClickCheck;
	Classes::TNotifyEvent FOnEditValueChanged;
	TcxCheckPaintHelper* FCheckPaintHelper;
	Graphics::TBitmap* FGlyph;
	int FGlyphCount;
	TcxCheckListBoxItems* FCheckItems;
	TcxCustomMapStateToEditValueEvent FOnCustomMapStateToEditValue;
	TcxCustomMapEditValueToStateEvent FOnCustomMapEditValueToState;
	TcxCustomCheckListBox* __fastcall GetContainer(void);
	void __fastcall ResetItemHeight(void);
	void __fastcall DrawCheck(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, Cxcheckbox::TcxCheckBoxState AState, bool AEnabled);
	void __fastcall SetAllowGrayed(bool Value);
	__int64 __fastcall GetIntegerMappedValue(const __int64 AMaxValue);
	void __fastcall SetIntegerMappedValue(const __int64 AValue);
	Graphics::TBitmap* __fastcall GetGlyph(void);
	void __fastcall GlyphChanged(System::TObject* Sender);
	void __fastcall SetGlyph(Graphics::TBitmap* Value);
	void __fastcall SetGlyphCount(int Value);
	void __fastcall ToggleClickCheck(int Index);
	void __fastcall InvalidateCheck(int Index);
	HIDESBASE MESSAGE void __fastcall CNDrawItem(Messages::TWMDrawItem &Message);
	HIDESBASE MESSAGE void __fastcall CMFontChanged(Messages::TMessage &Message);
	
protected:
	__property TcxCustomCheckListBox* Container = {read=GetContainer};
	virtual void __fastcall LookAndFeelChanged(void);
	virtual void __fastcall FullRepaint(void);
	virtual void __fastcall InvalidateItem(int Index);
	virtual void __fastcall UpdateEditValueFromMapped(void);
	DYNAMIC int __fastcall InternalGetItemData(int Index);
	DYNAMIC void __fastcall InternalSetItemData(int Index, int AData);
	DYNAMIC void __fastcall KeyPress(char &Key);
	DYNAMIC void __fastcall MouseDown(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseUp(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall DoClickCheckEvent(const int AIndex, const Cxcheckbox::TcxCheckBoxState OldState, const Cxcheckbox::TcxCheckBoxState NewState);
	virtual void __fastcall ClickCheck(void);
	virtual void __fastcall CreateParams(Controls::TCreateParams &Params);
	virtual void __fastcall CreateWnd(void);
	virtual void __fastcall DestroyWnd(void);
	int __fastcall GetCheckWidth(void);
	virtual void __fastcall ClearCheck(void);
	DYNAMIC void __fastcall DblClick(void);
	__property TcxClickCheckEvent OnClickCheck = {read=FOnClickCheck, write=FOnClickCheck};
	__property bool AllowGrayed = {read=FAllowGrayed, write=SetAllowGrayed, default=0};
	__property bool AllowDblClickToggle = {read=FAllowDblClickToggle, write=FAllowDblClickToggle, default=1};
	__property Graphics::TBitmap* Glyph = {read=GetGlyph, write=SetGlyph};
	__property int GlyphCount = {read=FGlyphCount, write=SetGlyphCount, default=6};
	__property TcxCheckListBoxItems* CheckItems = {read=FCheckItems, write=FCheckItems};
	__property TcxCustomMapStateToEditValueEvent OnCustomMapStateToEditValue = {read=FOnCustomMapStateToEditValue, write=FOnCustomMapStateToEditValue};
	__property TcxCustomMapEditValueToStateEvent OnCustomMapEditValueToState = {read=FOnCustomMapEditValueToState, write=FOnCustomMapEditValueToState};
	__property Classes::TNotifyEvent OnEditValueChanged = {read=FOnEditValueChanged, write=FOnEditValueChanged};
	
public:
	__fastcall virtual TcxCustomInnerCheckListBox(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxCustomInnerCheckListBox(void);
	DYNAMIC bool __fastcall ExecuteAction(Classes::TBasicAction* Action);
	DYNAMIC bool __fastcall UpdateAction(Classes::TBasicAction* Action);
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomInnerCheckListBox(HWND ParentWindow) : Cxcontainer::TcxCustomInnerListBox(ParentWindow) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxCheckListBoxItems : public Classes::TCollection 
{
	typedef Classes::TCollection inherited;
	
public:
	TcxCheckListBoxItem* operator[](int Index) { return Items[Index]; }
	
private:
	TcxCustomInnerCheckListBox* FCheckListBox;
	TcxCheckListBoxItem* __fastcall GetItems(int Index);
	void __fastcall SetItems(int Index, const TcxCheckListBoxItem* Value);
	
protected:
	virtual void __fastcall Update(Classes::TCollectionItem* Item);
	
public:
	__fastcall TcxCheckListBoxItems(TcxCustomInnerCheckListBox* AOwner, TMetaClass* ItemClass);
	__fastcall virtual ~TcxCheckListBoxItems(void);
	__property TcxCustomInnerCheckListBox* CheckListBox = {read=FCheckListBox};
	__property TcxCheckListBoxItem* Items[int Index] = {read=GetItems, write=SetItems/*, default*/};
	HIDESBASE TcxCheckListBoxItem* __fastcall Add(void);
	HIDESBASE void __fastcall Delete(int Index);
	void __fastcall LoadStrings(Classes::TStrings* AStrings);
};


class PASCALIMPLEMENTATION TcxCustomCheckListBox : public Cxcontainer::TcxContainer 
{
	typedef Cxcontainer::TcxContainer inherited;
	
private:
	Cxdatautils::TcxCustomDataBinding* FDataBinding;
	TcxCustomInnerCheckListBox* FInnerCheckListBox;
	bool FIntegralHeight;
	Variant FEditValue;
	bool FInternalUpdate;
	Stdctrls::TDrawItemEvent FOnDrawItem;
	Stdctrls::TMeasureItemEvent FOnMeasureItem;
	TcxClickCheckEvent __fastcall GetOnClickCheck();
	bool __fastcall GetAllowGrayed(void);
	bool __fastcall GetAllowDblClickToggle(void);
	Graphics::TBitmap* __fastcall GetGlyph(void);
	int __fastcall GetGlyphCount(void);
	TcxCheckListBoxItems* __fastcall GetItems(void);
	int __fastcall GetColumns(void);
	int __fastcall GetCount(void);
	int __fastcall GetItemIndex(void);
	int __fastcall GetScrollWidth(void);
	bool __fastcall GetSelected(int Index);
	bool __fastcall GetSorted(void);
	int __fastcall GetTabWidth(void);
	int __fastcall GetTopIndex(void);
	TcxCustomMapStateToEditValueEvent __fastcall GetOnCustomMapStateToEditValue();
	TcxCustomMapEditValueToStateEvent __fastcall GetOnCustomMapEditValueToState();
	Classes::TNotifyEvent __fastcall GetOnEditValueChanged();
	void __fastcall SetOnClickCheck(TcxClickCheckEvent Value);
	void __fastcall SetAllowGrayed(bool Value);
	void __fastcall SetAllowDblClickToggle(bool Value);
	void __fastcall SetGlyph(Graphics::TBitmap* Value);
	void __fastcall SetGlyphCount(int Value);
	void __fastcall SetItems(TcxCheckListBoxItems* Value);
	void __fastcall SetColumns(int Value);
	void __fastcall SetIntegralHeight(bool Value);
	void __fastcall SetItemIndex(int Value);
	void __fastcall SetScrollWidth(int Value);
	void __fastcall SetSelected(int Index, bool Value);
	void __fastcall SetSorted(bool Value);
	void __fastcall SetTabWidth(int Value);
	void __fastcall SetTopIndex(int Value);
	void __fastcall SetOnCustomMapStateToEditValue(TcxCustomMapStateToEditValueEvent Value);
	void __fastcall SetOnCustomMapEditValueToState(TcxCustomMapEditValueToStateEvent Value);
	void __fastcall SetOnEditValueChanged(Classes::TNotifyEvent Value);
	bool __fastcall GetAutoComplete(void);
	void __fastcall SetAutoComplete(bool Value);
	void __fastcall SetCount(int Value);
	bool __fastcall GetReadOnly(void);
	void __fastcall SetReadOnly(bool Value);
	
protected:
	virtual void __fastcall ContainerStyleChanged(System::TObject* Sender);
	virtual void __fastcall AdjustInnerControl(void);
	/* virtual class method */ virtual TMetaClass* __fastcall GetStyleClass(TMetaClass* vmt);
	virtual bool __fastcall CanResize(int &NewWidth, int &NewHeight);
	DYNAMIC void __fastcall FontChanged(void);
	void __fastcall GetOptimalHeight(int &ANewHeight);
	virtual bool __fastcall IsInternalControl(Controls::TControl* AControl);
	virtual bool __fastcall RefreshContainer(const Types::TPoint &P, Cxcontainer::TcxMouseButton Button, Classes::TShiftState Shift, bool AIsMouseEvent);
	virtual void __fastcall SetSize(void);
	virtual void __fastcall FullRepaint(void);
	/* virtual class method */ virtual TMetaClass* __fastcall GetDataBindingClass(TMetaClass* vmt);
	virtual Cxdatautils::TcxCustomDataBinding* __fastcall GetDataBinding(void);
	virtual void __fastcall SetDataBinding(Cxdatautils::TcxCustomDataBinding* Value);
	__property Cxdatautils::TcxCustomDataBinding* DataBinding = {read=GetDataBinding, write=SetDataBinding};
	__property bool ReadOnly = {read=GetReadOnly, write=SetReadOnly, nodefault};
	virtual void __fastcall DataChange(void);
	virtual void __fastcall UpdateData(void);
	virtual void __fastcall WndProc(Messages::TMessage &Message);
	__property TcxClickCheckEvent OnClickCheck = {read=GetOnClickCheck, write=SetOnClickCheck};
	__property bool AllowGrayed = {read=GetAllowGrayed, write=SetAllowGrayed, default=0};
	__property bool AllowDblClickToggle = {read=GetAllowDblClickToggle, write=SetAllowDblClickToggle, default=1};
	__property Graphics::TBitmap* Glyph = {read=GetGlyph, write=SetGlyph};
	__property int GlyphCount = {read=GetGlyphCount, write=SetGlyphCount, default=6};
	__property int Columns = {read=GetColumns, write=SetColumns, nodefault};
	__property bool IntegralHeight = {read=FIntegralHeight, write=SetIntegralHeight, nodefault};
	__property TcxCheckListBoxItems* Items = {read=GetItems, write=SetItems};
	__property int ScrollWidth = {read=GetScrollWidth, write=SetScrollWidth, nodefault};
	__property bool Sorted = {read=GetSorted, write=SetSorted, nodefault};
	__property int TabWidth = {read=GetTabWidth, write=SetTabWidth, nodefault};
	HIDESBASE MESSAGE void __fastcall CMParentColorChanged(Messages::TMessage &Message);
	void __fastcall DrawItem(Controls::TWinControl* Control, int Index, const Types::TRect &Rect, Windows::TOwnerDrawState State);
	void __fastcall MeasureItem(Controls::TWinControl* Control, int Index, int &Height);
	__property bool AutoComplete = {read=GetAutoComplete, write=SetAutoComplete, nodefault};
	__property Stdctrls::TDrawItemEvent OnDrawItem = {read=FOnDrawItem, write=FOnDrawItem};
	__property Stdctrls::TMeasureItemEvent OnMeasureItem = {read=FOnMeasureItem, write=FOnMeasureItem};
	bool __fastcall IsValueStored(void);
	virtual int __fastcall GetMaxMappedLength(void);
	virtual Variant __fastcall GetEditValue();
	virtual void __fastcall SetEditValue(const Variant &Value);
	__property Variant EditValue = {read=GetEditValue, write=SetEditValue, stored=IsValueStored};
	virtual void __fastcall Loaded(void);
	virtual bool __fastcall IsEditValueValid(const Variant &AEditValue, bool AllowEmpty);
	virtual Variant __fastcall NormalizeEditValue(const Variant &AEditValue);
	virtual Variant __fastcall TranslateEditValue(const Variant &AEditValue);
	virtual __int64 __fastcall GetIntegerMappedValue(const __int64 AMaxValue);
	
public:
	__fastcall virtual TcxCustomCheckListBox(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxCustomCheckListBox(void);
	/* virtual class method */ virtual Cxcontainer::TcxContainerStyleValues __fastcall GetNotPublishedStyleValues(TMetaClass* vmt);
	void __fastcall Clear(void);
	int __fastcall ItemAtPos(const Types::TPoint &APos, bool AExisting);
	Types::TRect __fastcall ItemRect(int Index);
	void __fastcall AddItem(AnsiString AItem);
	void __fastcall CopySelection(TcxCustomCheckListBox* ADestination);
	void __fastcall DeleteSelected(void);
	void __fastcall MoveSelection(TcxCustomCheckListBox* ADestination);
	DYNAMIC bool __fastcall ExecuteAction(Classes::TBasicAction* Action);
	DYNAMIC bool __fastcall UpdateAction(Classes::TBasicAction* Action);
	__property TcxCustomInnerCheckListBox* InnerCheckListBox = {read=FInnerCheckListBox, write=FInnerCheckListBox};
	__property int Count = {read=GetCount, write=SetCount, nodefault};
	__property int ItemIndex = {read=GetItemIndex, write=SetItemIndex, nodefault};
	__property bool Selected[int Index] = {read=GetSelected, write=SetSelected};
	__property int TopIndex = {read=GetTopIndex, write=SetTopIndex, nodefault};
	__property TcxCustomMapStateToEditValueEvent OnCustomMapStateToEditValue = {read=GetOnCustomMapStateToEditValue, write=SetOnCustomMapStateToEditValue};
	__property TcxCustomMapEditValueToStateEvent OnCustomMapEditValueToState = {read=GetOnCustomMapEditValueToState, write=SetOnCustomMapEditValueToState};
	__property Classes::TNotifyEvent OnEditValueChanged = {read=GetOnEditValueChanged, write=SetOnEditValueChanged};
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomCheckListBox(HWND ParentWindow) : Cxcontainer::TcxContainer(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCheckListBox;
class PASCALIMPLEMENTATION TcxCheckListBox : public TcxCustomCheckListBox 
{
	typedef TcxCustomCheckListBox inherited;
	
__published:
	__property AllowGrayed  = {default=0};
	__property AllowDblClickToggle  = {default=1};
	__property EditValue ;
	__property Glyph ;
	__property GlyphCount  = {default=6};
	__property OnClickCheck ;
	__property OnCustomMapStateToEditValue ;
	__property OnCustomMapEditValueToState ;
	__property OnEditValueChanged ;
	__property Align  = {default=0};
	__property Anchors  = {default=3};
	__property BiDiMode ;
	__property Columns ;
	__property Constraints ;
	__property DragCursor  = {default=-12};
	__property DragKind  = {default=0};
	__property DragMode  = {default=0};
	__property Enabled  = {default=1};
	__property ImeMode  = {default=3};
	__property ImeName ;
	__property IntegralHeight  = {default=0};
	__property Items ;
	__property ParentBiDiMode  = {default=1};
	__property ParentColor  = {default=0};
	__property ParentFont  = {default=1};
	__property ParentShowHint  = {default=1};
	__property PopupMenu ;
	__property ScrollWidth ;
	__property ShowHint ;
	__property Sorted  = {default=0};
	__property Style ;
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=1};
	__property TabWidth ;
	__property Visible  = {default=1};
	__property AutoComplete  = {default=1};
	__property OnClick ;
	__property OnDblClick ;
	__property OnDragDrop ;
	__property OnDragOver ;
	__property OnDrawItem ;
	__property OnEndDock ;
	__property OnEndDrag ;
	__property OnEnter ;
	__property OnExit ;
	__property OnKeyDown ;
	__property OnKeyPress ;
	__property OnKeyUp ;
	__property OnMeasureItem ;
	__property OnMouseDown ;
	__property OnMouseMove ;
	__property OnMouseUp ;
	__property OnStartDock ;
	__property OnStartDrag ;
	__property OnContextPopup ;
public:
	#pragma option push -w-inl
	/* TcxCustomCheckListBox.Create */ inline __fastcall virtual TcxCheckListBox(Classes::TComponent* AOwner) : TcxCustomCheckListBox(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomCheckListBox.Destroy */ inline __fastcall virtual ~TcxCheckListBox(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCheckListBox(HWND ParentWindow) : TcxCustomCheckListBox(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxchecklistbox */
using namespace Cxchecklistbox;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxCheckListBox
