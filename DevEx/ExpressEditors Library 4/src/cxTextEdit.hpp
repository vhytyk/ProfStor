// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxTextEdit.pas' rev: 6.00

#ifndef cxTextEditHPP
#define cxTextEditHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxVariants.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <cxEditTextUtils.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxDataUtils.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Clipbrd.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Variants.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxtextedit
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TcxEditScrollCause { escKeyboard, escMouseWheel };
#pragma option pop

__interface IcxInnerTextEdit;
typedef System::DelphiInterface<IcxInnerTextEdit> _di_IcxInnerTextEdit;
__interface INTERFACE_UUID("{263EBB8D-1EA9-4CAC-8367-ADD74D2A9651}") IcxInnerTextEdit  : public IcxCustomInnerEdit 
{
	
public:
	virtual void __fastcall CopyToClipboard(void) = 0 ;
	virtual Classes::TAlignment __fastcall GetAlignment(void) = 0 ;
	virtual bool __fastcall GetAutoSelect(void) = 0 ;
	virtual Stdctrls::TEditCharCase __fastcall GetCharCase(void) = 0 ;
	virtual Cxedit::TcxEditEchoMode __fastcall GetEchoMode(void) = 0 ;
	virtual bool __fastcall GetHideSelection(void) = 0 ;
	virtual char __fastcall GetImeLastChar(void) = 0 ;
	virtual bool __fastcall GetInternalUpdating(void) = 0 ;
	virtual int __fastcall GetMaxLength(void) = 0 ;
	virtual bool __fastcall GetMultiLine(void) = 0 ;
	virtual bool __fastcall GetOEMConvert(void) = 0 ;
	virtual int __fastcall GetSelLength(void) = 0 ;
	virtual int __fastcall GetSelStart(void) = 0 ;
	virtual AnsiString __fastcall GetSelText(void) = 0 ;
	virtual void __fastcall SelectAll(void) = 0 ;
	virtual void __fastcall SetAlignment(Classes::TAlignment Value) = 0 ;
	virtual void __fastcall SetAutoSelect(bool Value) = 0 ;
	virtual void __fastcall SetCharCase(Stdctrls::TEditCharCase Value) = 0 ;
	virtual void __fastcall SetEchoMode(Cxedit::TcxEditEchoMode Value) = 0 ;
	virtual void __fastcall SetHideSelection(bool Value) = 0 ;
	virtual void __fastcall SetInternalUpdating(bool Value) = 0 ;
	virtual void __fastcall SetMaxLength(int Value) = 0 ;
	virtual void __fastcall SetOEMConvert(bool Value) = 0 ;
	virtual void __fastcall SetSelLength(int Value) = 0 ;
	virtual void __fastcall SetSelStart(int Value) = 0 ;
	virtual void __fastcall SetSelText(AnsiString Value) = 0 ;
	__property Classes::TAlignment Alignment = {read=GetAlignment, write=SetAlignment};
	__property bool AutoSelect = {read=GetAutoSelect, write=SetAutoSelect};
	__property Stdctrls::TEditCharCase CharCase = {read=GetCharCase, write=SetCharCase};
	__property Cxedit::TcxEditEchoMode EchoMode = {read=GetEchoMode, write=SetEchoMode};
	__property bool HideSelection = {read=GetHideSelection, write=SetHideSelection};
	__property char ImeLastChar = {read=GetImeLastChar};
	__property bool InternalUpdating = {read=GetInternalUpdating, write=SetInternalUpdating};
	__property int MaxLength = {read=GetMaxLength, write=SetMaxLength};
	__property bool MultiLine = {read=GetMultiLine};
	__property bool OEMConvert = {read=GetOEMConvert, write=SetOEMConvert};
	__property int SelLength = {read=GetSelLength, write=SetSelLength};
	__property int SelStart = {read=GetSelStart, write=SetSelStart};
	__property AnsiString SelText = {read=GetSelText, write=SetSelText};
};

class DELPHICLASS TcxCustomInnerTextEditHelper;
class DELPHICLASS TcxCustomInnerTextEdit;
class DELPHICLASS TcxCustomTextEdit;
class PASCALIMPLEMENTATION TcxCustomInnerTextEdit : public Stdctrls::TCustomEdit 
{
	typedef Stdctrls::TCustomEdit inherited;
	
private:
	Cxedit::TcxEditEchoMode FEchoMode;
	TcxCustomInnerTextEditHelper* FHelper;
	bool FInternalUpdating;
	bool FIsCreating;
	int FLockBoundsCount;
	Classes::TAlignment FAlignment;
	int FImeCharCount;
	char FImeLastChar;
	TcxCustomTextEdit* __fastcall GetContainer(void);
	int __fastcall GetCursorPos(void);
	void __fastcall UpdateEchoMode(void);
	HIDESBASE MESSAGE void __fastcall WMChar(Messages::TWMKey &Message);
	MESSAGE void __fastcall WMClear(void *Message);
	HIDESBASE MESSAGE void __fastcall WMContextMenu(Messages::TWMContextMenu &Message);
	MESSAGE void __fastcall WMCut(void *Message);
	HIDESBASE MESSAGE void __fastcall WMEraseBkgnd(Messages::TWMEraseBkgnd &Message);
	MESSAGE void __fastcall WMGetDlgCode(Messages::TWMNoParams &Message);
	MESSAGE void __fastcall WMIMEChar(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMKeyDown(Messages::TWMKey &Message);
	HIDESBASE MESSAGE void __fastcall WMKillFocus(Messages::TWMKillFocus &Message);
	HIDESBASE MESSAGE void __fastcall WMNCPaint(Messages::TMessage &Message);
	MESSAGE void __fastcall WMPaste(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMSetFocus(Messages::TWMSetFocus &Message);
	HIDESBASE MESSAGE void __fastcall WMSize(Messages::TWMSize &Message);
	HIDESBASE MESSAGE void __fastcall CMMouseEnter(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMMouseLeave(Messages::TMessage &Message);
	
protected:
	DYNAMIC void __fastcall Click(void);
	DYNAMIC void __fastcall DblClick(void);
	DYNAMIC bool __fastcall DoMouseWheel(Classes::TShiftState Shift, int WheelDelta, const Types::TPoint &MousePos);
	DYNAMIC void __fastcall DragOver(System::TObject* Source, int X, int Y, Controls::TDragState State, bool &Accept);
	DYNAMIC Menus::TPopupMenu* __fastcall GetPopupMenu(void);
	HIDESBASE virtual AnsiString __fastcall GetText();
	DYNAMIC void __fastcall KeyDown(Word &Key, Classes::TShiftState Shift);
	DYNAMIC void __fastcall KeyPress(char &Key);
	DYNAMIC void __fastcall KeyUp(Word &Key, Classes::TShiftState Shift);
	DYNAMIC void __fastcall MouseDown(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseEnter(Controls::TControl* AControl);
	DYNAMIC void __fastcall MouseLeave(Controls::TControl* AControl);
	DYNAMIC void __fastcall MouseMove(Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseUp(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	HIDESBASE virtual void __fastcall SetText(const AnsiString Value);
	virtual void __fastcall CreateHandle(void);
	virtual void __fastcall CreateParams(Controls::TCreateParams &Params);
	virtual void __fastcall CreateWnd(void);
	virtual void __fastcall WndProc(Messages::TMessage &Message);
	virtual void __fastcall AdjustMargins(void);
	__property TcxCustomTextEdit* Container = {read=GetContainer};
	__property int CursorPos = {read=GetCursorPos, nodefault};
	__property TcxCustomInnerTextEditHelper* Helper = {read=FHelper};
	__property AnsiString Text = {read=GetText, write=SetText};
	__property Classes::TAlignment Alignment = {read=FAlignment, nodefault};
	
public:
	__fastcall virtual TcxCustomInnerTextEdit(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxCustomInnerTextEdit(void);
	DYNAMIC void __fastcall DragDrop(System::TObject* Source, int X, int Y);
	DYNAMIC bool __fastcall ExecuteAction(Classes::TBasicAction* Action);
	DYNAMIC bool __fastcall UpdateAction(Classes::TBasicAction* Action);
	DYNAMIC bool __fastcall CanFocus(void);
	virtual void __fastcall SetBounds(int ALeft, int ATop, int AWidth, int AHeight);
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomInnerTextEdit(HWND ParentWindow) : Stdctrls::TCustomEdit(ParentWindow) { }
	#pragma option pop
	
private:
	void *__IcxContainerInnerControl;	/* Cxcontainer::IcxContainerInnerControl */
	void *__IcxCustomInnerEdit;	/* Cxedit::IcxCustomInnerEdit */
	void *__IcxInnerTextEdit;	/* Cxtextedit::IcxInnerTextEdit */
	
public:
	operator IcxInnerTextEdit*(void) { return (IcxInnerTextEdit*)&__IcxInnerTextEdit; }
	operator IcxCustomInnerEdit*(void) { return (IcxCustomInnerEdit*)&__IcxCustomInnerEdit; }
	operator IcxContainerInnerControl*(void) { return (IcxContainerInnerControl*)&__IcxContainerInnerControl; }
	
};


class PASCALIMPLEMENTATION TcxCustomInnerTextEditHelper : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	TcxCustomInnerTextEdit* FEdit;
	int FSelLength;
	int FSelStart;
	
protected:
	__property TcxCustomInnerTextEdit* Edit = {read=FEdit};
	
public:
	__fastcall virtual TcxCustomInnerTextEditHelper(TcxCustomInnerTextEdit* AEdit);
	Cxcontainer::TcxContainer* __fastcall GetControlContainer(void);
	Controls::TWinControl* __fastcall GetControl(void);
	Variant __fastcall GetEditValue();
	Classes::TNotifyEvent __fastcall GetOnChange();
	void __fastcall LockBounds(bool ALock);
	void __fastcall SafelySetFocus(void);
	void __fastcall SetEditValue(const Variant &Value);
	void __fastcall SetParent(Controls::TWinControl* Value);
	void __fastcall SetOnChange(Classes::TNotifyEvent Value);
	void __fastcall CopyToClipboard(void);
	Classes::TAlignment __fastcall GetAlignment(void);
	bool __fastcall GetAutoSelect(void);
	Stdctrls::TEditCharCase __fastcall GetCharCase(void);
	Cxedit::TcxEditEchoMode __fastcall GetEchoMode(void);
	bool __fastcall GetHideSelection(void);
	char __fastcall GetImeLastChar(void);
	bool __fastcall GetInternalUpdating(void);
	int __fastcall GetMaxLength(void);
	bool __fastcall GetMultiLine(void);
	bool __fastcall GetOEMConvert(void);
	bool __fastcall GetReadOnly(void);
	int __fastcall GetSelLength(void);
	int __fastcall GetSelStart(void);
	AnsiString __fastcall GetSelText();
	void __fastcall SelectAll(void);
	void __fastcall SetAlignment(Classes::TAlignment Value);
	void __fastcall SetAutoSelect(bool Value);
	void __fastcall SetCharCase(Stdctrls::TEditCharCase Value);
	void __fastcall SetEchoMode(Cxedit::TcxEditEchoMode Value);
	void __fastcall SetHideSelection(bool Value);
	void __fastcall SetInternalUpdating(bool Value);
	void __fastcall SetMaxLength(int Value);
	void __fastcall SetOEMConvert(bool Value);
	void __fastcall SetReadOnly(bool Value);
	void __fastcall SetSelLength(int Value);
	void __fastcall SetSelStart(int Value);
	void __fastcall SetSelText(AnsiString Value);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxCustomInnerTextEditHelper(void) { }
	#pragma option pop
	
};


#pragma pack(push, 4)
struct TcxCustomInnerTextEditPrevState
{
	AnsiString PrevText;
	int PrevSelLength;
	int PrevSelStart;
} ;
#pragma pack(pop)

class DELPHICLASS TcxTextEditPropertiesValues;
class PASCALIMPLEMENTATION TcxTextEditPropertiesValues : public Cxedit::TcxCustomEditPropertiesValues 
{
	typedef Cxedit::TcxCustomEditPropertiesValues inherited;
	
public:
	bool MaxLength;
	bool MaxValue;
	bool MinValue;
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual void __fastcall Reset(void);
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxTextEditPropertiesValues(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxTextEditPropertiesValues(void) : Cxedit::TcxCustomEditPropertiesValues() { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomEditListBox;
class PASCALIMPLEMENTATION TcxCustomEditListBox : public Cxcontainer::TcxCustomInnerListBox 
{
	typedef Cxcontainer::TcxCustomInnerListBox inherited;
	
private:
	bool FHotTrack;
	Classes::TNotifyEvent FOnSelectItem;
	HIDESBASE MESSAGE void __fastcall CMShowingChanged(Messages::TMessage &Message);
	
protected:
	DYNAMIC void __fastcall Click(void);
	DYNAMIC bool __fastcall DoMouseWheel(Classes::TShiftState Shift, int WheelDelta, const Types::TPoint &MousePos);
	DYNAMIC void __fastcall MouseMove(Classes::TShiftState Shift, int X, int Y);
	virtual bool __fastcall DoDrawItem(int AIndex, const Types::TRect &ARect, Windows::TOwnerDrawState AState);
	void __fastcall DoSelectItem(void);
	int __fastcall GetDefaultItemHeight(void);
	virtual int __fastcall GetHeight(int ARowCount, int AMaxHeight);
	virtual AnsiString __fastcall GetItem(int Index);
	HIDESBASE virtual int __fastcall GetItemHeight(int AIndex = 0xffffffff);
	void __fastcall InternalRecreateWindow(void);
	virtual void __fastcall RecreateWindow(void);
	void __fastcall SetItemCount(int Value);
	virtual void __fastcall DrawItem(int Index, const Types::TRect &Rect, Windows::TOwnerDrawState State);
	virtual void __fastcall MeasureItem(int Index, int &Height);
	virtual void __fastcall SetItemIndex(const int Value)/* overload */;
	__property bool HotTrack = {read=FHotTrack, write=FHotTrack, nodefault};
	__property Classes::TNotifyEvent OnSelectItem = {read=FOnSelectItem, write=FOnSelectItem};
	
public:
	__fastcall virtual TcxCustomEditListBox(Classes::TComponent* AOwner);
	bool __fastcall IsVisible(void);
public:
	#pragma option push -w-inl
	/* TcxCustomInnerListBox.Destroy */ inline __fastcall virtual ~TcxCustomEditListBox(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomEditListBox(HWND ParentWindow) : Cxcontainer::TcxCustomInnerListBox(ParentWindow) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxCustomEditListBoxClass;

#pragma option push -b-
enum TcxEditLookupDataGoDirection { egdBegin, egdEnd, egdNext, egdPrev, egdPageUp, egdPageDown };
#pragma option pop

__interface IcxTextEditLookupData;
typedef System::DelphiInterface<IcxTextEditLookupData> _di_IcxTextEditLookupData;
__interface INTERFACE_UUID("{F49C5F08-7758-4362-A360-1DF02354E708}") IcxTextEditLookupData  : public IInterface 
{
	
public:
	virtual bool __fastcall CanResizeVisualArea(tagSIZE &NewSize) = 0 ;
	virtual void __fastcall CloseUp(void) = 0 ;
	virtual void __fastcall Deinitialize(void) = 0 ;
	virtual void __fastcall DropDown(void) = 0 ;
	virtual void __fastcall DroppedDown(const AnsiString AFindStr) = 0 ;
	virtual bool __fastcall Find(const AnsiString AText) = 0 ;
	virtual Controls::TControl* __fastcall GetActiveControl(void) = 0 ;
	virtual Variant __fastcall GetCurrentKey(void) = 0 ;
	virtual AnsiString __fastcall GetDisplayText(const Variant &AKey) = 0 /* overload */;
	virtual Classes::TNotifyEvent __fastcall GetOnCurrentKeyChanged(void) = 0 ;
	virtual Classes::TNotifyEvent __fastcall GetOnSelectItem(void) = 0 ;
	virtual tagSIZE __fastcall GetVisualAreaPreferredSize(int AMaxHeight, int AWidth = 0x0) = 0 ;
	virtual void __fastcall Go(TcxEditLookupDataGoDirection ADirection, bool ACircular) = 0 ;
	virtual void __fastcall Initialize(Controls::TWinControl* AVisualControlsParent) = 0 ;
	virtual bool __fastcall IsEmpty(void) = 0 ;
	virtual bool __fastcall IsMouseOverList(const Types::TPoint &P) = 0 ;
	virtual bool __fastcall Locate(AnsiString &AText, AnsiString &ATail, bool ANext) = 0 ;
	virtual void __fastcall PositionVisualArea(const Types::TRect &AClientRect) = 0 ;
	virtual void __fastcall PropertiesChanged(void) = 0 ;
	virtual void __fastcall SelectItem(void) = 0 ;
	virtual void __fastcall SetCurrentKey(const Variant &AKey) = 0 ;
	virtual void __fastcall SetOnCurrentKeyChanged(Classes::TNotifyEvent Value) = 0 ;
	virtual void __fastcall SetOnSelectItem(Classes::TNotifyEvent Value) = 0 ;
	virtual void __fastcall TextChanged(void) = 0 ;
	__property Controls::TControl* ActiveControl = {read=GetActiveControl};
	__property Variant CurrentKey = {read=GetCurrentKey, write=SetCurrentKey};
	__property Classes::TNotifyEvent OnCurrentKeyChanged = {read=GetOnCurrentKeyChanged, write=SetOnCurrentKeyChanged};
	__property Classes::TNotifyEvent OnSelectItem = {read=GetOnSelectItem, write=SetOnSelectItem};
};

class DELPHICLASS TcxCustomTextEditLookupData;
class DELPHICLASS TcxCustomTextEditProperties;
class PASCALIMPLEMENTATION TcxCustomTextEditLookupData : public Cxclasses::TcxInterfacedPersistent 
{
	typedef Cxclasses::TcxInterfacedPersistent inherited;
	
private:
	int FCurrentKey;
	int FItemIndex;
	TcxCustomEditListBox* FList;
	Classes::TPersistent* FOwner;
	Classes::TNotifyEvent FOnCurrentKeyChanged;
	Classes::TNotifyEvent FOnSelectItem;
	TcxCustomTextEdit* __fastcall GetEdit(void);
	Classes::TStrings* __fastcall GetItems(void);
	TcxCustomTextEditProperties* __fastcall GetProperties(void);
	void __fastcall SetItemIndex(int Value);
	void __fastcall SetItems(Classes::TStrings* Value);
	
protected:
	DYNAMIC Classes::TPersistent* __fastcall GetOwner(void);
	void __fastcall DoCurrentKeyChanged(void);
	void __fastcall DoSelectItem(void);
	virtual AnsiString __fastcall GetItem(int Index);
	virtual int __fastcall GetItemCount(void);
	virtual TMetaClass* __fastcall GetListBoxClass(void);
	virtual void __fastcall HandleSelectItem(System::TObject* Sender);
	virtual bool __fastcall InternalLocate(AnsiString &AText, AnsiString &ATail, bool ANext, bool ASynchronizeWithText);
	void __fastcall InternalSetCurrentKey(int Value);
	void __fastcall InternalSetItemIndex(int Value);
	virtual void __fastcall ListChanged(void);
	void __fastcall SetListItemIndex(int Value);
	__property TcxCustomTextEdit* Edit = {read=GetEdit};
	__property int ItemIndex = {read=FItemIndex, write=SetItemIndex, stored=false, nodefault};
	__property Classes::TStrings* Items = {read=GetItems, write=SetItems};
	__property TcxCustomEditListBox* List = {read=FList};
	__property TcxCustomTextEditProperties* Properties = {read=GetProperties};
	
public:
	__fastcall virtual TcxCustomTextEditLookupData(Classes::TPersistent* AOwner);
	virtual bool __fastcall CanResizeVisualArea(tagSIZE &NewSize);
	void __fastcall CloseUp(void);
	void __fastcall Deinitialize(void);
	virtual void __fastcall DropDown(void);
	virtual void __fastcall DroppedDown(const AnsiString AFindStr);
	virtual bool __fastcall Find(const AnsiString AText);
	Controls::TControl* __fastcall GetActiveControl(void);
	Variant __fastcall GetCurrentKey();
	AnsiString __fastcall GetDisplayText(const Variant &AKey)/* overload */;
	Classes::TNotifyEvent __fastcall GetOnCurrentKeyChanged();
	Classes::TNotifyEvent __fastcall GetOnSelectItem();
	virtual tagSIZE __fastcall GetVisualAreaPreferredSize(int AMaxHeight, int AWidth = 0x0);
	void __fastcall Go(TcxEditLookupDataGoDirection ADirection, bool ACircular);
	virtual void __fastcall Initialize(Controls::TWinControl* AVisualControlsParent);
	bool __fastcall IsEmpty(void);
	bool __fastcall IsMouseOverList(const Types::TPoint &P);
	bool __fastcall Locate(AnsiString &AText, AnsiString &ATail, bool ANext);
	virtual void __fastcall PositionVisualArea(const Types::TRect &AClientRect);
	virtual void __fastcall PropertiesChanged(void);
	void __fastcall SelectItem(void);
	void __fastcall SetCurrentKey(const Variant &AKey);
	void __fastcall SetOnCurrentKeyChanged(Classes::TNotifyEvent Value);
	void __fastcall SetOnSelectItem(Classes::TNotifyEvent Value);
	virtual void __fastcall TextChanged(void);
	__property Controls::TControl* ActiveControl = {read=GetActiveControl};
	__property Variant CurrentKey = {read=GetCurrentKey, write=SetCurrentKey};
	__property Classes::TNotifyEvent OnCurrentKeyChanged = {read=GetOnCurrentKeyChanged, write=SetOnCurrentKeyChanged};
	__property Classes::TNotifyEvent OnSelectItem = {read=GetOnSelectItem, write=SetOnSelectItem};
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxCustomTextEditLookupData(void) { }
	#pragma option pop
	
private:
	void *__IcxTextEditLookupData;	/* Cxtextedit::IcxTextEditLookupData */
	
public:
	operator IcxTextEditLookupData*(void) { return (IcxTextEditLookupData*)&__IcxTextEditLookupData; }
	
};


class DELPHICLASS TcxCustomTextEditViewData;
class PASCALIMPLEMENTATION TcxCustomTextEditViewData : public Cxedit::TcxCustomEditViewData 
{
	typedef Cxedit::TcxCustomEditViewData inherited;
	
private:
	bool FIsValueEditorWithValueFormatting;
	HIDESBASE TcxCustomTextEditProperties* __fastcall GetProperties(void);
	HIDESBASE void __fastcall SetProperties(TcxCustomTextEditProperties* Value);
	
protected:
	virtual bool __fastcall GetIsEditClass(void);
	virtual void __fastcall InitCacheData(void);
	virtual bool __fastcall IsComboBoxStyle(void);
	virtual void __fastcall PrepareDrawTextFlags(Cxgraphics::TcxCanvas* ACanvas, Cxedit::TcxCustomEditViewInfo* AViewInfo);
	
public:
	virtual void __fastcall Calculate(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ABounds, const Types::TPoint &P, Cxcontainer::TcxMouseButton Button, Classes::TShiftState Shift, Cxedit::TcxCustomEditViewInfo* AViewInfo, bool AIsMouseEvent);
	virtual void __fastcall DisplayValueToDrawValue(const Variant &ADisplayValue, Cxedit::TcxCustomEditViewInfo* AViewInfo);
	virtual void __fastcall EditValueToDrawValue(Cxgraphics::TcxCanvas* ACanvas, const Variant &AEditValue, Cxedit::TcxCustomEditViewInfo* AViewInfo);
	virtual Types::TRect __fastcall GetClientExtent(Cxedit::TcxCustomEditViewInfo* AViewInfo);
	virtual unsigned __fastcall GetDrawTextFlags(void);
	virtual Types::TRect __fastcall GetDrawTextOffset();
	virtual tagSIZE __fastcall GetEditContentSize(Cxgraphics::TcxCanvas* ACanvas, const Variant &AEditValue, const Cxedit::TcxEditSizeProperties &AEditSizeProperties);
	void __fastcall PrepareSelection(Cxedit::TcxCustomEditViewInfo* AViewInfo);
	__property TcxCustomTextEditProperties* Properties = {read=GetProperties, write=SetProperties};
public:
	#pragma option push -w-inl
	/* TcxCustomEditViewData.Create */ inline __fastcall virtual TcxCustomTextEditViewData(Cxedit::TcxCustomEditProperties* AProperties, Cxcontainer::TcxContainerStyle* AStyle, bool AIsInplace) : Cxedit::TcxCustomEditViewData(AProperties, AStyle, AIsInplace) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxCustomTextEditViewData(void) { }
	#pragma option pop
	
};


#pragma pack(push, 4)
struct TcxTextOutData
{
	bool ForceEndEllipsis;
	bool Initialized;
	int RowCount;
	int SelStart;
	int SelLength;
	Graphics::TColor SelBackgroundColor;
	Graphics::TColor SelTextColor;
	Cxedittextutils::TcxTextParams TextParams;
	Types::TRect TextRect;
	DynamicArray<Cxedittextutils::TcxTextRow >  TextRows;
} ;
#pragma pack(pop)

class DELPHICLASS TcxCustomTextEditViewInfo;
class PASCALIMPLEMENTATION TcxCustomTextEditViewInfo : public Cxedit::TcxCustomEditViewInfo 
{
	typedef Cxedit::TcxCustomEditViewInfo inherited;
	
protected:
	virtual void __fastcall InternalPaint(Cxgraphics::TcxCanvas* ACanvas);
	
public:
	bool ComboBoxStyle;
	bool DrawSelectionBar;
	unsigned DrawTextFlags;
	Cxedit::TcxEditEditingStyle EditingStyle;
	bool HasPopupWindow;
	bool IsEditClass;
	int MaxLineCount;
	int SelStart;
	int SelLength;
	Graphics::TColor SelTextColor;
	Graphics::TColor SelBackgroundColor;
	AnsiString Text;
	TcxTextOutData TextOutData;
	#pragma pack(push, 1)
	Types::TRect TextRect;
	#pragma pack(pop)
	
	__fastcall virtual ~TcxCustomTextEditViewInfo(void);
	virtual void __fastcall DrawText(Cxgraphics::TcxCanvas* ACanvas);
	virtual bool __fastcall NeedShowHint(Cxgraphics::TcxCanvas* ACanvas, const Types::TPoint &P, const Types::TRect &AVisibleBounds, /* out */ AnsiString &AText, /* out */ bool &AIsMultiLine, /* out */ Types::TRect &ATextRect)/* overload */;
	virtual void __fastcall Offset(int DX, int DY);
	virtual void __fastcall PrepareCanvasFont(Graphics::TFont* AFont);
public:
	#pragma option push -w-inl
	/* TcxCustomEditViewInfo.Create */ inline __fastcall virtual TcxCustomTextEditViewInfo(void) : Cxedit::TcxCustomEditViewInfo() { }
	#pragma option pop
	
	
/* Hoisted overloads: */
	
public:
	inline bool __fastcall  NeedShowHint(Cxgraphics::TcxCanvas* ACanvas, const Types::TPoint &P, /* out */ AnsiString &AText, /* out */ bool &AIsMultiLine, /* out */ Types::TRect &ATextRect){ return TcxCustomEditViewInfo::NeedShowHint(ACanvas, P, AText, AIsMultiLine, ATextRect); }
	
};


typedef void __fastcall (__closure *TcxNewLookupDisplayTextEvent)(System::TObject* Sender, const AnsiString AText);

typedef Set<char, 0, 255>  TcxTextEditChars;

class PASCALIMPLEMENTATION TcxCustomTextEditProperties : public Cxedit::TcxCustomEditProperties 
{
	typedef Cxedit::TcxCustomEditProperties inherited;
	
private:
	Stdctrls::TEditCharCase FCharCase;
	Cxedit::TcxEditEchoMode FEchoMode;
	bool FFixedListSelection;
	bool FHideCursor;
	bool FHideSelection;
	bool FImmediateUpdateText;
	Classes::TStringList* FLookupItems;
	int FMaxLength;
	double FMaxValue;
	double FMinValue;
	TcxTextEditChars FValidChars;
	bool FOEMConvert;
	TcxNewLookupDisplayTextEvent FOnNewLookupDisplayText;
	TcxTextEditPropertiesValues* __fastcall GetAssignedValues(void);
	int __fastcall GetInnerEditMaxLength(void);
	Classes::TStrings* __fastcall GetLookupItems(void);
	bool __fastcall GetLookupItemsSorted(void);
	int __fastcall GetMaxLength(void);
	double __fastcall GetMaxValue(void);
	double __fastcall GetMinValue(void);
	bool __fastcall IsMaxLengthStored(void);
	bool __fastcall IsMaxValueStored(void);
	bool __fastcall IsMinValueStored(void);
	void __fastcall LookupItemsChanged(System::TObject* Sender);
	void __fastcall SetEchoMode(Cxedit::TcxEditEchoMode Value);
	void __fastcall SetFixedListSelection(bool Value);
	void __fastcall SetHideCursor(bool Value);
	void __fastcall SetHideSelection(bool Value);
	void __fastcall SetLookupItems(Classes::TStrings* Value);
	void __fastcall SetLookupItemsSorted(bool Value);
	void __fastcall SetMaxValue(double Value);
	void __fastcall SetMinValue(double Value);
	void __fastcall SetOEMConvert(bool Value);
	
protected:
	virtual void __fastcall AlignmentChangedHandler(System::TObject* Sender);
	virtual void __fastcall BaseSetAlignment(Cxedit::TcxEditAlignment* Value);
	virtual bool __fastcall CanValidate(void);
	virtual bool __fastcall CompareEditValue(void);
	/* virtual class method */ virtual TMetaClass* __fastcall GetAssignedValuesClass(TMetaClass* vmt);
	virtual Cxedit::TcxEditDisplayFormatOptions __fastcall GetDisplayFormatOptions(void);
	virtual AnsiString __fastcall GetValidateErrorText(int AErrorKind);
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewDataClass(TMetaClass* vmt);
	virtual bool __fastcall HasDisplayValue(void);
	virtual bool __fastcall WantNavigationKeys(void);
	virtual void __fastcall CheckEditorValueBounds(Variant &DisplayValue, AnsiString &ErrorText, bool &Error, Cxedit::TcxCustomEdit* AEdit);
	void __fastcall CheckValueBounds(double &Value);
	virtual Variant __fastcall DefaultFocusedDisplayValue();
	virtual void __fastcall DisplayValueToDisplayText(const Variant &ADisplayValue, AnsiString &DisplayText);
	virtual void __fastcall DoNewLookupDisplayText(TcxCustomTextEdit* AEdit, const AnsiString AText);
	virtual bool __fastcall FindLookupText(const AnsiString AText);
	Variant __fastcall GetDefaultDisplayValue(const Variant &AEditValue, bool AEditFocused);
	virtual int __fastcall GetDefaultMaxLength(void);
	virtual int __fastcall GetDropDownPageRowCount(void);
	virtual Cxedit::TcxEditEditingStyle __fastcall GetEditingStyle(void);
	/* virtual class method */ virtual TMetaClass* __fastcall GetLookupDataClass(TMetaClass* vmt);
	virtual bool __fastcall IsEditValueNumeric(void);
	virtual bool __fastcall IsLookupDataVisual(void);
	virtual bool __fastcall IsMultiLine(void);
	virtual bool __fastcall IsPopupKey(Word Key, Classes::TShiftState Shift);
	virtual void __fastcall LookupDataChanged(System::TObject* Sender);
	virtual void __fastcall SetCharCase(Stdctrls::TEditCharCase Value);
	virtual void __fastcall SetMaxLength(int Value);
	virtual bool __fastcall UseLookupData(void);
	__property TcxTextEditPropertiesValues* AssignedValues = {read=GetAssignedValues};
	__property Stdctrls::TEditCharCase CharCase = {read=FCharCase, write=SetCharCase, default=0};
	__property Cxedit::TcxEditEchoMode EchoMode = {read=FEchoMode, write=SetEchoMode, default=0};
	__property Cxedit::TcxEditEditingStyle EditingStyle = {read=GetEditingStyle, nodefault};
	__property bool FixedListSelection = {read=FFixedListSelection, write=SetFixedListSelection, default=1};
	__property bool HideCursor = {read=FHideCursor, write=SetHideCursor, default=0};
	__property bool HideSelection = {read=FHideSelection, write=SetHideSelection, default=1};
	__property bool ImmediateUpdateText = {read=FImmediateUpdateText, write=FImmediateUpdateText, default=0};
	__property Classes::TStrings* LookupItems = {read=GetLookupItems, write=SetLookupItems};
	__property bool LookupItemsSorted = {read=GetLookupItemsSorted, write=SetLookupItemsSorted, default=0};
	__property int MaxLength = {read=GetMaxLength, write=SetMaxLength, stored=IsMaxLengthStored, nodefault};
	__property double MaxValue = {read=GetMaxValue, write=SetMaxValue, stored=IsMaxValueStored};
	__property double MinValue = {read=GetMinValue, write=SetMinValue, stored=IsMinValueStored};
	__property bool OEMConvert = {read=FOEMConvert, write=SetOEMConvert, default=0};
	__property TcxNewLookupDisplayTextEvent OnNewLookupDisplayText = {read=FOnNewLookupDisplayText, write=FOnNewLookupDisplayText};
	
public:
	__fastcall virtual TcxCustomTextEditProperties(Classes::TPersistent* AOwner);
	__fastcall virtual ~TcxCustomTextEditProperties(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	/* virtual class method */ virtual TMetaClass* __fastcall GetContainerClass(TMetaClass* vmt);
	virtual WideString __fastcall GetDisplayText(const Variant &AEditValue, bool AFullText = false);
	virtual Cxdatautils::TcxDataEditValueSource __fastcall GetEditValueSource(bool AEditFocused);
	virtual Cxedit::TcxEditSupportedOperations __fastcall GetSupportedOperations(void);
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewInfoClass(TMetaClass* vmt);
	virtual bool __fastcall IsDisplayValueValid(Variant &DisplayValue, bool AEditFocused);
	virtual bool __fastcall IsEditValueValid(Variant &EditValue, bool AEditFocused);
	virtual bool __fastcall IsResetEditClass(void);
	virtual void __fastcall PrepareDisplayValue(const Variant &AEditValue, Variant &DisplayValue, bool AEditFocused);
	void __fastcall SetMinMaxValues(double AMinValue, double AMaxValue);
	virtual void __fastcall ValidateDisplayValue(Variant &DisplayValue, AnsiString &ErrorText, bool &Error, Cxedit::TcxCustomEdit* AEdit);
	__property TcxTextEditChars ValidChars = {read=FValidChars, write=FValidChars};
};


class DELPHICLASS TcxTextEditProperties;
class PASCALIMPLEMENTATION TcxTextEditProperties : public TcxCustomTextEditProperties 
{
	typedef TcxCustomTextEditProperties inherited;
	
__published:
	__property Alignment ;
	__property AutoSelect  = {default=1};
	__property BeepOnError  = {default=0};
	__property CharCase  = {default=0};
	__property EchoMode  = {default=0};
	__property HideSelection  = {default=1};
	__property LookupItems ;
	__property LookupItemsSorted  = {default=0};
	__property MaxLength ;
	__property OEMConvert  = {default=0};
	__property ReadOnly ;
	__property UseLeftAlignmentOnEditing ;
	__property OnChange ;
	__property OnEditValueChanged ;
	__property OnNewLookupDisplayText ;
	__property OnValidate ;
public:
	#pragma option push -w-inl
	/* TcxCustomTextEditProperties.Create */ inline __fastcall virtual TcxTextEditProperties(Classes::TPersistent* AOwner) : TcxCustomTextEditProperties(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomTextEditProperties.Destroy */ inline __fastcall virtual ~TcxTextEditProperties(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxCustomTextEdit : public Cxedit::TcxCustomEdit 
{
	typedef Cxedit::TcxCustomEdit inherited;
	
private:
	bool FBeepOnEnter;
	bool FDisableRefresh;
	int FClickLockCount;
	bool FFindSelection;
	bool FHideInnerEdit;
	bool FLookupItemsScrolling;
	bool FShowInnerEdit;
	bool FTesting;
	bool FInternalTextSetting;
	int __fastcall GetCursorPos(void);
	AnsiString __fastcall GetEditingText();
	_di_IcxInnerTextEdit __fastcall GetInnerTextEdit();
	_di_IcxTextEditLookupData __fastcall GetILookupData();
	TcxCustomTextEditLookupData* __fastcall GetLookupData(void);
	HIDESBASE TcxTextEditProperties* __fastcall GetProperties(void);
	int __fastcall GetSelLength(void);
	int __fastcall GetSelStart(void);
	AnsiString __fastcall GetSelText();
	HIDESBASE TcxCustomTextEditViewInfo* __fastcall GetViewInfo(void);
	void __fastcall SetEditingText(const AnsiString Value);
	void __fastcall SetFindSelection(bool Value);
	void __fastcall SetHideInnerEdit(bool Value);
	HIDESBASE void __fastcall SetProperties(TcxTextEditProperties* Value);
	void __fastcall SetShowInnerEdit(bool Value);
	void __fastcall SetTesting(bool Value);
	MESSAGE void __fastcall WMClear(Messages::TMessage &Message);
	MESSAGE void __fastcall WMGetText(Messages::TWMGetText &Message);
	MESSAGE void __fastcall WMGetTextLength(Messages::TWMNoParams &Message);
	MESSAGE void __fastcall WMSetText(Messages::TWMSetText &Message);
	
protected:
	bool FInnerEditPositionAdjusting;
	bool FIsPopupWindowJustClosed;
	Cxclasses::TcxInterfacedPersistent* FLookupData;
	bool FLookupDataTextChangedLocked;
	virtual void __fastcall AdjustInnerEditPosition(int AInnerEditHeight);
	virtual bool __fastcall CanKeyDownModifyEdit(Word Key, Classes::TShiftState Shift);
	virtual bool __fastcall CanKeyPressModifyEdit(char Key);
	virtual void __fastcall ChangeHandler(System::TObject* Sender);
	virtual void __fastcall DoEditKeyDown(Word &Key, Classes::TShiftState Shift);
	virtual void __fastcall DoEditKeyPress(char &Key);
	DYNAMIC void __fastcall DoExit(void);
	DYNAMIC bool __fastcall DoMouseWheel(Classes::TShiftState Shift, int WheelDelta, const Types::TPoint &MousePos);
	virtual void __fastcall FillSizeProperties(Cxedit::TcxEditSizeProperties &AEditSizeProperties);
	virtual void __fastcall GetChildControlBounds(const Types::TRect &AChildControlBounds, Controls::TControl* AChildControl, Types::PRect &PR);
	virtual AnsiString __fastcall GetDisplayValue();
	virtual TMetaClass* __fastcall GetInnerEditClass(void);
	virtual bool __fastcall InternalDoEditing(void);
	virtual Menus::TPopupMenu* __fastcall InternalGetPopupMenu(void);
	virtual void __fastcall InternalSetDisplayValue(const Variant &Value);
	virtual void __fastcall InternalValidateDisplayValue(const Variant &ADisplayValue);
	virtual bool __fastcall IsEditClass(void);
	virtual bool __fastcall IsValidChar(char AChar);
	virtual void __fastcall Loaded(void);
	virtual void __fastcall LockedInnerEditWindowProc(Messages::TMessage &Message);
	virtual void __fastcall PropertiesChanged(System::TObject* Sender);
	virtual bool __fastcall RefreshContainer(const Types::TPoint &P, Cxcontainer::TcxMouseButton Button, Classes::TShiftState Shift, bool AIsMouseEvent);
	virtual bool __fastcall SetDisplayText(const AnsiString Value);
	virtual void __fastcall UnlockInnerEditRepainting(void);
	virtual void __fastcall AdjustInnerEdit(void);
	virtual void __fastcall SetInternalDisplayValue(const Variant &Value);
	virtual void __fastcall CheckEditValue(void);
	virtual void __fastcall CheckEditorValueBounds(void);
	void __fastcall DoClick(void);
	virtual bool __fastcall GetScrollLookupDataList(TcxEditScrollCause AScrollCause);
	virtual void __fastcall HandleSelectItem(System::TObject* Sender);
	virtual AnsiString __fastcall InternalGetText();
	virtual bool __fastcall InternalSetText(const AnsiString Value);
	void __fastcall LockClick(bool ALock);
	void __fastcall LockLookupDataTextChanged(void);
	virtual Variant __fastcall LookupKeyToEditValue(const Variant &AKey);
	virtual void __fastcall ResetOnNewDisplayValue(void);
	virtual void __fastcall SetSelLength(int Value);
	virtual void __fastcall SetSelStart(int Value);
	virtual void __fastcall SetSelText(const AnsiString Value);
	virtual void __fastcall SynchronizeDisplayValue(void);
	virtual void __fastcall SynchronizeEditValue(void);
	void __fastcall UnlockLookupDataTextChanged(void);
	virtual void __fastcall UpdateDrawValue(void);
	void __fastcall UpdateEditValue(void);
	__property bool BeepOnEnter = {read=FBeepOnEnter, write=FBeepOnEnter, default=1};
	__property int CursorPos = {read=GetCursorPos, nodefault};
	__property bool FindSelection = {read=FFindSelection, write=SetFindSelection, nodefault};
	__property bool HideInnerEdit = {read=FHideInnerEdit, write=SetHideInnerEdit, nodefault};
	__property _di_IcxTextEditLookupData ILookupData = {read=GetILookupData};
	__property _di_IcxInnerTextEdit InnerTextEdit = {read=GetInnerTextEdit};
	__property TcxCustomTextEditLookupData* LookupData = {read=GetLookupData};
	__property bool LookupItemsScrolling = {read=FLookupItemsScrolling, write=FLookupItemsScrolling, nodefault};
	__property ParentColor  = {default=0};
	__property TcxTextEditProperties* Properties = {read=GetProperties, write=SetProperties};
	__property bool ShowInnerEdit = {read=FShowInnerEdit, write=SetShowInnerEdit, nodefault};
	__property bool Testing = {read=FTesting, write=SetTesting, nodefault};
	__property TcxCustomTextEditViewInfo* ViewInfo = {read=GetViewInfo};
	
public:
	__fastcall virtual TcxCustomTextEdit(Classes::TComponent* AOwner)/* overload */;
	__fastcall virtual ~TcxCustomTextEdit(void);
	virtual void __fastcall Activate(Cxedit::TcxCustomEditData* &AEditData);
	/* virtual class method */ virtual TMetaClass* __fastcall GetPropertiesClass(TMetaClass* vmt);
	virtual void __fastcall Clear(void);
	virtual void __fastcall ClearSelection(void);
	virtual void __fastcall CopyToClipboard(void);
	virtual void __fastcall CutToClipboard(void);
	virtual void __fastcall PasteFromClipboard(void);
	virtual void __fastcall PrepareEditValue(const Variant &ADisplayValue, /* out */ Variant &EditValue, bool AEditFocused);
	virtual void __fastcall SelectAll(void);
	void __fastcall SetSelection(int ASelStart, int ASelLength);
	void __fastcall Undo(void);
	__property AnsiString EditingText = {read=GetEditingText, write=SetEditingText};
	__property int SelLength = {read=GetSelLength, write=SetSelLength, nodefault};
	__property int SelStart = {read=GetSelStart, write=SetSelStart, nodefault};
	__property AnsiString SelText = {read=GetSelText, write=SetSelText};
	__property Text ;
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomTextEdit(HWND ParentWindow) : Cxedit::TcxCustomEdit(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxTextEdit;
class PASCALIMPLEMENTATION TcxTextEdit : public TcxCustomTextEdit 
{
	typedef TcxCustomTextEdit inherited;
	
__published:
	__property Anchors  = {default=3};
	__property AutoSize  = {default=1};
	__property BeepOnEnter  = {default=1};
	__property Constraints ;
	__property DragMode  = {default=0};
	__property Enabled  = {default=1};
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
	__property DragCursor  = {default=-12};
	__property DragKind  = {default=0};
	__property ImeMode  = {default=3};
	__property ImeName ;
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
	/* TcxCustomTextEdit.Create */ inline __fastcall virtual TcxTextEdit(Classes::TComponent* AOwner)/* overload */ : TcxCustomTextEdit(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomTextEdit.Destroy */ inline __fastcall virtual ~TcxTextEdit(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxTextEdit(HWND ParentWindow) : TcxCustomTextEdit(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
static const Shortint cxEditDefaultDropDownPageRowCount = 0x8;
static const Shortint ekValueOutOfBounds = 0x1;
extern PACKAGE bool __fastcall CheckTextEditState(_di_IcxInnerTextEdit ATextEdit, const TcxCustomInnerTextEditPrevState &APrevState);
extern PACKAGE void __fastcall SaveTextEditState(_di_IcxInnerTextEdit ATextEdit, TcxCustomInnerTextEditPrevState &APrevState);

}	/* namespace Cxtextedit */
using namespace Cxtextedit;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxTextEdit
