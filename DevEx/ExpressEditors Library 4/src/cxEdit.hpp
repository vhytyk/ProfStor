// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxEdit.pas' rev: 6.00

#ifndef cxEditHPP
#define cxEditHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxVariants.hpp>	// Pascal unit
#include <cxLookAndFeels.hpp>	// Pascal unit
#include <cxListBox.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <cxEditPaintUtils.hpp>	// Pascal unit
#include <cxDataUtils.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <dxThemeManager.hpp>	// Pascal unit
#include <dxThemeConsts.hpp>	// Pascal unit
#include <ComCtrls.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxedit
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TcxBlobKind { bkNone, bkBlob, bkGraphic, bkMemo, bkOle };
#pragma option pop

#pragma option push -b-
enum TcxEditBorderStyle { ebsNone, ebsSingle, ebsThick, ebsFlat, ebs3D, ebsUltraFlat };
#pragma option pop

#pragma option push -b-
enum TcxEditButtonKind { bkEllipsis, bkDown, bkGlyph };
#pragma option pop

#pragma option push -b-
enum TcxEditButtonState { ebsDisabled, ebsNormal, ebsPressed, ebsSelected };
#pragma option pop

#pragma option push -b-
enum TcxEditButtonStyle { btsDefault, bts3D, btsFlat, btsSimple, btsHotFlat, btsUltraFlat };
#pragma option pop

#pragma option push -b-
enum TcxEditButtonTransparency { ebtNone, ebtInactive, ebtAlways, ebtHideInactive, ebtHideUnselected };
#pragma option pop

#pragma option push -b-
enum TcxEditPopupBorderStyle { epbsDefault, epbsSingle, epbsFrame3D, epbsFlat };
#pragma option pop

typedef Cxcontainer::TcxContainerStyleValue TcxEditStyleValue;

typedef TcxContainerStyleValues TcxEditStyleValues;
;

typedef Classes::TAlignment TcxEditHorzAlignment;

#pragma option push -b-
enum TcxEditVertAlignment { taTopJustify, taBottomJustify, taVCenter };
#pragma option pop

typedef AnsiString cxEdit__1[3];

#pragma option push -b-
enum TcxEditDisplayFormatOption { dfoSupports, dfoNoCurrencyValue };
#pragma option pop

typedef Set<TcxEditDisplayFormatOption, dfoSupports, dfoNoCurrencyValue>  TcxEditDisplayFormatOptions;

#pragma option push -b-
enum TcxEditEchoMode { eemNormal, eemPassword };
#pragma option pop

#pragma option push -b-
enum TcxEditEditingStyle { esEdit, esEditList, esFixedList, esNoEdit };
#pragma option pop

#pragma option push -b-
enum TcxEditPaintOption { epoAllowZeroHeight, epoAutoHeight, epoShowEndEllipsis };
#pragma option pop

typedef Set<TcxEditPaintOption, epoAllowZeroHeight, epoShowEndEllipsis>  TcxEditPaintOptions;

#pragma option push -b-
enum TcxEditStateItem { esActive, esDisabled, esHotTrack, esNormal };
#pragma option pop

typedef Set<TcxEditStateItem, esActive, esNormal>  TcxEditState;

#pragma option push -b-
enum TcxEditSupportedOperation { esoAlwaysHotTrack, esoAutoHeight, esoFiltering, esoHorzAlignment, esoHotTrack, esoIncSearch, esoSorting, esoSortingByDisplayText };
#pragma option pop

typedef Set<TcxEditSupportedOperation, esoAlwaysHotTrack, esoSortingByDisplayText>  TcxEditSupportedOperations;

typedef Variant TcxEditValue;

typedef Variant *PcxEditValue;

typedef void __fastcall (__closure *TcxEditValidateEvent)(System::TObject* Sender, Variant &DisplayValue, AnsiString &ErrorText, bool &Error);

typedef int TcxEditErrorKind;

__interface IcxCustomInnerEdit;
typedef System::DelphiInterface<IcxCustomInnerEdit> _di_IcxCustomInnerEdit;
__interface INTERFACE_UUID("{468D21B5-48AA-4077-8ED5-4C6112D460B1}") IcxCustomInnerEdit  : public IcxContainerInnerControl 
{
	
public:
	virtual Variant __fastcall GetEditValue(void) = 0 ;
	virtual Classes::TNotifyEvent __fastcall GetOnChange(void) = 0 ;
	virtual bool __fastcall GetReadOnly(void) = 0 ;
	virtual void __fastcall LockBounds(bool ALock) = 0 ;
	virtual void __fastcall SafelySetFocus(void) = 0 ;
	virtual void __fastcall SetEditValue(const Variant &Value) = 0 ;
	virtual void __fastcall SetParent(Controls::TWinControl* Value) = 0 ;
	virtual void __fastcall SetOnChange(Classes::TNotifyEvent Value) = 0 ;
	virtual void __fastcall SetReadOnly(bool Value) = 0 ;
	__property Variant EditValue = {read=GetEditValue, write=SetEditValue};
	__property Controls::TWinControl* Parent = {write=SetParent};
	__property bool ReadOnly = {read=GetReadOnly, write=SetReadOnly};
	__property Classes::TNotifyEvent OnChange = {read=GetOnChange, write=SetOnChange};
};

typedef TMetaClass*TcxCustomEditPropertiesClass;

__interface IcxEditRepositoryItemListener;
typedef System::DelphiInterface<IcxEditRepositoryItemListener> _di_IcxEditRepositoryItemListener;
class DELPHICLASS TcxEditRepositoryItem;
__interface INTERFACE_UUID("{4E27D642-022B-4CD2-AB96-64C7CF9B3299}") IcxEditRepositoryItemListener  : public IInterface 
{
	
public:
	virtual void __fastcall ItemRemoved(TcxEditRepositoryItem* Sender) = 0 ;
	virtual void __fastcall PropertiesChanged(TcxEditRepositoryItem* Sender) = 0 ;
};

class DELPHICLASS TcxCustomEditProperties;
class DELPHICLASS TcxEditButtons;
class DELPHICLASS TcxEditButton;
class PASCALIMPLEMENTATION TcxEditButtons : public Classes::TCollection 
{
	typedef Classes::TCollection inherited;
	
public:
	TcxEditButton* operator[](int Index) { return Items[Index]; }
	
private:
	Classes::TPersistent* FOwner;
	Classes::TNotifyEvent FOnChange;
	HIDESBASE TcxEditButton* __fastcall GetItem(int Index);
	int __fastcall GetVisibleCount(void);
	HIDESBASE void __fastcall SetItem(int Index, TcxEditButton* Value);
	
protected:
	DYNAMIC Classes::TPersistent* __fastcall GetOwner(void);
	virtual void __fastcall Update(Classes::TCollectionItem* Item);
	__property Classes::TNotifyEvent OnChange = {read=FOnChange, write=FOnChange};
	
public:
	__fastcall virtual TcxEditButtons(Classes::TPersistent* AOwner);
	__property TcxEditButton* Items[int Index] = {read=GetItem, write=SetItem/*, default*/};
	__property int VisibleCount = {read=GetVisibleCount, nodefault};
public:
	#pragma option push -w-inl
	/* TCollection.Destroy */ inline __fastcall virtual ~TcxEditButtons(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomEdit;
#pragma pack(push, 1)
struct TcxEditChangeEventsCatcher
{
	bool OnChangeEvent;
	bool OnEditValueChangedEvent;
} ;
#pragma pack(pop)

class DELPHICLASS TcxCustomEditData;
class PASCALIMPLEMENTATION TcxCustomEditData : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	bool FCleared;
	TcxCustomEdit* FEdit;
	Cxcontainer::TcxFreeNotificator* FFreeNotificator;
	void __fastcall FreeNotification(Classes::TComponent* AComponent);
	
protected:
	__property bool Cleared = {read=FCleared, write=FCleared, nodefault};
	
public:
	__fastcall TcxCustomEditData(TcxCustomEdit* AEdit);
	__fastcall virtual ~TcxCustomEditData(void);
	void __fastcall Clear(void);
};


class DELPHICLASS TcxEditRepositoryItemListenerEditHelper;
class PASCALIMPLEMENTATION TcxEditRepositoryItemListenerEditHelper : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	TcxCustomEdit* FEdit;
	
public:
	__fastcall TcxEditRepositoryItemListenerEditHelper(TcxCustomEdit* AEdit);
	void __fastcall ItemRemoved(TcxEditRepositoryItem* Sender);
	void __fastcall PropertiesChanged(TcxEditRepositoryItem* Sender);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxEditRepositoryItemListenerEditHelper(void) { }
	#pragma option pop
	
};


typedef void __fastcall (__closure *TcxEditEditingEvent)(System::TObject* Sender, bool &CanEdit);

class DELPHICLASS TcxCustomEditStyle;
class DELPHICLASS TcxCustomEditViewInfo;
class DELPHICLASS TcxEditDataBinding;
class DELPHICLASS TcxCustomEditViewData;
struct TcxEditSizeProperties;
typedef TMetaClass*TcxEditDataBindingClass;

typedef TMetaClass*TcxCustomEditDataClass;

class PASCALIMPLEMENTATION TcxCustomEdit : public Cxcontainer::TcxContainer 
{
	typedef Cxcontainer::TcxContainer inherited;
	
private:
	bool FAutoSize;
	int FCaptureButtonVisibleIndex;
	#pragma pack(push, 1)
	TcxEditChangeEventsCatcher FChangeEventsCatcher;
	#pragma pack(pop)
	
	int FChangeEventsLockCount;
	Extctrls::TTimer* FDblClickTimer;
	TcxCustomEditData* FEditData;
	TcxEditRepositoryItemListenerEditHelper* FEditRepositoryItemListenerHelper;
	bool FEditValueChangingLocked;
	bool FFocused;
	_di_IcxCustomInnerEdit FInnerEdit;
	bool FIsEditValidated;
	bool FIsInplace;
	bool FIsPosting;
	bool FKeyboardAction;
	int FLockValidate;
	bool FModified;
	bool FModifiedAfterEnter;
	Menus::TPopupMenu* FPopupMenu;
	Variant FPrevEditValue;
	Classes::TList* FPrevModifiedList;
	TcxEditRepositoryItem* FRepositoryItem;
	bool FUpdate;
	bool FValidateErrorProcessing;
	Controls::TKeyEvent FOnAfterKeyDown;
	TcxEditEditingEvent FOnEditing;
	Classes::TNotifyEvent FOnPostEditValue;
	void *FObjectInstance;
	void *FInnerEditDefWindowProc;
	void __fastcall DblClickTimerHandler(System::TObject* Sender);
	void __fastcall DoClearEditData(TcxCustomEditData* AEditData);
	TcxCustomEditProperties* __fastcall GetProperties(void);
	TcxCustomEditStyle* __fastcall GetStyle(void);
	TcxCustomEditViewInfo* __fastcall GetViewInfo(void);
	bool __fastcall IsPropertiesStored(void);
	void __fastcall SetDataBinding(TcxEditDataBinding* Value);
	void __fastcall SetEditAutoSize(bool Value);
	void __fastcall SetModified(bool Value);
	void __fastcall SetModifiedAfterEnter(bool Value);
	void __fastcall SetProperties(TcxCustomEditProperties* Value);
	void __fastcall SetRepositoryItem(TcxEditRepositoryItem* Value);
	HIDESBASE void __fastcall SetStyle(TcxCustomEditStyle* Value);
	MESSAGE void __fastcall WMCopy(Messages::TMessage &Message);
	MESSAGE void __fastcall WMCut(void *Message);
	MESSAGE void __fastcall WMPaste(Messages::TMessage &Message);
	MESSAGE void __fastcall CMEditValidationError(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMShowingChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMSysColorChange(Messages::TMessage &Message);
	
protected:
	TcxEditDataBinding* FDataBinding;
	Variant FEditValue;
	TcxCustomEditProperties* FProperties;
	bool FSettingEditWindowRegion;
	Classes::TNotifyEvent FPropertiesEvents;
	virtual bool __fastcall CanResize(int &NewWidth, int &NewHeight);
	DYNAMIC void __fastcall Click(void);
	DYNAMIC void __fastcall DblClick(void);
	DYNAMIC void __fastcall DoEnter(void);
	DYNAMIC void __fastcall DoExit(void);
	DYNAMIC void __fastcall FocusChanged(void);
	DYNAMIC Menus::TPopupMenu* __fastcall GetPopupMenu(void);
	/* virtual class method */ virtual TMetaClass* __fastcall GetStyleClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewInfoClass(TMetaClass* vmt);
	virtual Types::TRect __fastcall GetVisibleBounds();
	DYNAMIC void __fastcall KeyDown(Word &Key, Classes::TShiftState Shift);
	DYNAMIC void __fastcall KeyPress(char &Key);
	DYNAMIC void __fastcall KeyUp(Word &Key, Classes::TShiftState Shift);
	virtual void __fastcall Loaded(void);
	DYNAMIC void __fastcall MouseDown(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseLeave(Controls::TControl* AControl);
	DYNAMIC void __fastcall MouseUp(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	virtual void __fastcall Paint(void);
	virtual void __fastcall ReadState(Classes::TReader* Reader);
	virtual bool __fastcall RefreshContainer(const Types::TPoint &P, Cxcontainer::TcxMouseButton Button, Classes::TShiftState Shift, bool AIsMouseEvent);
	virtual void __fastcall SetName(const AnsiString Value);
	virtual void __fastcall SetSize(void);
	virtual bool __fastcall TabsNeeded(void);
	virtual void __fastcall CreateHandle(void);
	virtual void __fastcall WndProc(Messages::TMessage &Message);
	virtual void __fastcall AdjustInnerEditPosition(int AInnerEditHeight);
	virtual void __fastcall AfterPosting(void);
	bool __fastcall AreChangeEventsLocked(void);
	virtual void __fastcall BeforePosting(void);
	int __fastcall ButtonVisibleIndexAt(const Types::TPoint &P);
	HIDESBASE void __fastcall CalculateViewInfo(bool AIsMouseEvent)/* overload */;
	HIDESBASE void __fastcall CalculateViewInfo(const Types::TPoint &P, Cxcontainer::TcxMouseButton Button, Classes::TShiftState Shift, bool AIsMouseEvent)/* overload */;
	HIDESBASE virtual bool __fastcall CanAutoSize(void);
	virtual bool __fastcall CanAutoWidth(void);
	virtual bool __fastcall CanKeyDownModifyEdit(Word Key, Classes::TShiftState Shift);
	virtual bool __fastcall CanKeyPressModifyEdit(char Key);
	virtual bool __fastcall CanModify(void);
	virtual void __fastcall ChangeHandler(System::TObject* Sender);
	virtual _di_IcxCustomInnerEdit __fastcall CreateInnerEdit();
	virtual TcxCustomEditViewData* __fastcall CreateViewData(void);
	virtual void __fastcall DefaultButtonClick(void);
	void __fastcall DisableValidate(void);
	void __fastcall DoAfterKeyDown(Word &Key, Classes::TShiftState Shift);
	virtual void __fastcall DoButtonClick(int AButtonVisibleIndex);
	virtual void __fastcall DoButtonDown(int AButtonVisibleIndex);
	virtual void __fastcall DoButtonUp(int AButtonVisibleIndex);
	void __fastcall DoChange(void);
	bool __fastcall DoEditing(void);
	void __fastcall DoEditValueChanged(void);
	virtual void __fastcall DoEditKeyDown(Word &Key, Classes::TShiftState Shift);
	virtual void __fastcall DoEditKeyPress(char &Key);
	virtual void __fastcall DoEditKeyUp(Word &Key, Classes::TShiftState Shift);
	void __fastcall DoHideEdit(bool AExit);
	void __fastcall DoPostEditValue(void);
	void __fastcall EnableValidate(void);
	virtual void __fastcall FillSizeProperties(TcxEditSizeProperties &AEditSizeProperties);
	bool __fastcall GetAutoPostEditValue(void);
	/* virtual class method */ virtual TMetaClass* __fastcall GetDataBindingClass(TMetaClass* vmt);
	virtual AnsiString __fastcall GetDisplayValue();
	virtual TMetaClass* __fastcall GetEditDataClass(void);
	virtual Variant __fastcall GetEditValue();
	virtual TMetaClass* __fastcall GetInnerEditClass(void);
	bool __fastcall HandleMouseWheel(Classes::TShiftState Shift);
	virtual void __fastcall HandleValidationError(const AnsiString ErrorText);
	bool __fastcall HasInnerEdit(void);
	virtual void __fastcall InitializeEditData(void);
	virtual void __fastcall InitializeInnerEdit(void);
	virtual void __fastcall InitializeViewData(TcxCustomEditViewData* AViewData);
	virtual bool __fastcall InternalDoEditing(void);
	virtual Menus::TPopupMenu* __fastcall InternalGetPopupMenu(void);
	TcxCustomEditProperties* __fastcall InternalGetProperties(void);
	virtual void __fastcall InternalSetDisplayValue(const Variant &Value);
	virtual void __fastcall InternalSetEditValue(const Variant &Value, bool AValidateEditValue);
	virtual void __fastcall InternalValidateDisplayValue(const Variant &ADisplayValue);
	virtual bool __fastcall IsActiveControl(void);
	virtual bool __fastcall IsClickEnabledDuringLoading(void);
	virtual bool __fastcall IsEditClass(void);
	virtual bool __fastcall IsEditorKey(Word Key, Classes::TShiftState Shift);
	virtual bool __fastcall IsEditValueStored(void);
	virtual bool __fastcall IsRepositoryItemAcceptable(TcxEditRepositoryItem* ARepositoryItem);
	virtual bool __fastcall IsValidChar(char AChar);
	virtual void __fastcall PrepareDisplayValue(const Variant &AEditValue, Variant &DisplayValue, bool AEditFocused);
	void __fastcall PostEditValue(void);
	virtual void __fastcall ProcessViewInfoChanges(TcxCustomEditViewInfo* APrevViewInfo, bool AIsMouseDownUpEvent);
	virtual void __fastcall PropertiesChanged(System::TObject* Sender);
	bool __fastcall PropertiesChangeLocked(void);
	virtual void __fastcall RepositoryItemAssigned(void);
	virtual void __fastcall RepositoryItemAssigning(void);
	virtual void __fastcall ResetEditValue(void);
	void __fastcall RestoreModified(void);
	void __fastcall SaveModified(void);
	virtual bool __fastcall SendActivationKey(char Key);
	virtual bool __fastcall SetDisplayText(const AnsiString Value);
	virtual void __fastcall SetEditValue(const Variant &Value);
	virtual void __fastcall SetInternalDisplayValue(const Variant &Value);
	HIDESBASE bool __fastcall ShortRefreshContainer(bool AIsMouseEvent);
	virtual void __fastcall SynchronizeDisplayValue(void);
	virtual void __fastcall SynchronizeEditValue(void);
	virtual void __fastcall UpdateDrawValue(void);
	virtual bool __fastcall ValidateKeyDown(Word &Key, Classes::TShiftState Shift);
	virtual bool __fastcall ValidateKeyPress(char &Key);
	virtual void __fastcall LockedInnerEditWindowProc(Messages::TMessage &Message);
	virtual void __fastcall LockInnerEditRepainting(void);
	virtual void __fastcall ThemeChanged(void);
	virtual void __fastcall UnlockInnerEditRepainting(void);
	__property bool AutoPostEditValue = {read=GetAutoPostEditValue, nodefault};
	__property bool AutoSize = {read=FAutoSize, write=SetEditAutoSize, default=1};
	__property int CaptureButtonVisibleIndex = {read=FCaptureButtonVisibleIndex, write=FCaptureButtonVisibleIndex, nodefault};
	__property TcxEditDataBinding* DataBinding = {read=FDataBinding, write=SetDataBinding};
	__property AnsiString DisplayValue = {read=GetDisplayValue};
	__property TcxCustomEditData* EditData = {read=FEditData};
	__property TcxEditRepositoryItemListenerEditHelper* EditRepositoryItemListenerHelper = {read=FEditRepositoryItemListenerHelper};
	__property bool EditValueChangingLocked = {read=FEditValueChangingLocked, nodefault};
	__property _di_IcxCustomInnerEdit InnerEdit = {read=FInnerEdit};
	__property bool IsEditValidated = {read=FIsEditValidated, write=FIsEditValidated, nodefault};
	__property bool IsInplace = {read=FIsInplace, nodefault};
	__property bool KeyboardAction = {read=FKeyboardAction, write=FKeyboardAction, nodefault};
	__property Variant PrevEditValue = {read=FPrevEditValue, write=FPrevEditValue};
	__property TcxCustomEditProperties* Properties = {read=GetProperties, write=SetProperties, stored=IsPropertiesStored};
	__property TcxCustomEditStyle* Style = {read=GetStyle, write=SetStyle};
	__property TcxCustomEditViewInfo* ViewInfo = {read=GetViewInfo};
	
public:
	__fastcall virtual TcxCustomEdit(Classes::TComponent* AOwner)/* overload */;
	__fastcall TcxCustomEdit(Classes::TComponent* AOwner, bool AIsInplace)/* overload */;
	__fastcall virtual ~TcxCustomEdit(void);
	virtual void __fastcall AfterConstruction(void);
	DYNAMIC bool __fastcall ExecuteAction(Classes::TBasicAction* Action);
	/* virtual class method */ virtual Cxcontainer::TcxContainerStyleValues __fastcall GetNotPublishedStyleValues(TMetaClass* vmt);
	DYNAMIC void __fastcall GetTabOrderList(Classes::TList* List);
	DYNAMIC bool __fastcall UpdateAction(Classes::TBasicAction* Action);
	virtual void __fastcall SetFocus(void);
	virtual void __fastcall Activate(TcxCustomEditData* &AEditData);
	virtual void __fastcall ActivateByKey(char Key, TcxCustomEditData* &AEditData);
	virtual void __fastcall ActivateByMouse(Classes::TShiftState Shift, int X, int Y, TcxCustomEditData* &AEditData);
	virtual bool __fastcall Deactivate(void);
	virtual void __fastcall Clear(void);
	virtual void __fastcall CopyToClipboard(void);
	virtual void __fastcall CutToClipboard(void);
	/* virtual class method */ virtual TMetaClass* __fastcall GetPropertiesClass(TMetaClass* vmt);
	virtual bool __fastcall HasPopupWindow(void);
	virtual bool __fastcall InternalFocused(void);
	void __fastcall LockChangeEvents(bool ALock, bool AInvokeChangedOnUnlock = true);
	virtual void __fastcall PasteFromClipboard(void);
	virtual void __fastcall PrepareEditValue(const Variant &ADisplayValue, /* out */ Variant &EditValue, bool AEditFocused);
	void __fastcall Reset(void);
	virtual void __fastcall SelectAll(void);
	bool __fastcall ValidateEdit(bool ARaiseExceptionOnError);
	__property bool EditModified = {read=FModified, write=SetModified, nodefault};
	__property Variant EditValue = {read=GetEditValue, write=SetEditValue, stored=IsEditValueStored};
	__property bool IsPosting = {read=FIsPosting, nodefault};
	__property bool ModifiedAfterEnter = {read=FModifiedAfterEnter, write=SetModifiedAfterEnter, nodefault};
	__property TabStop  = {default=1};
	__property Controls::TKeyEvent OnAfterKeyDown = {read=FOnAfterKeyDown, write=FOnAfterKeyDown};
	__property TcxEditEditingEvent OnEditing = {read=FOnEditing, write=FOnEditing};
	__property Classes::TNotifyEvent OnPostEditValue = {read=FOnPostEditValue, write=FOnPostEditValue};
	
__published:
	__property Classes::TNotifyEvent PropertiesEvents = {read=FPropertiesEvents, write=FPropertiesEvents};
	__property TcxEditRepositoryItem* RepositoryItem = {read=FRepositoryItem, write=SetRepositoryItem};
	__property OnFocusChanged ;
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomEdit(HWND ParentWindow) : Cxcontainer::TcxContainer(ParentWindow) { }
	#pragma option pop
	
private:
	void *__IcxEditRepositoryItemListener;	/* Cxedit::IcxEditRepositoryItemListener */
	
public:
	operator IcxEditRepositoryItemListener*(void) { return (IcxEditRepositoryItemListener*)&__IcxEditRepositoryItemListener; }
	
};


class DELPHICLASS TcxEditAlignment;
class PASCALIMPLEMENTATION TcxEditAlignment : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	Classes::TAlignment FHorz;
	bool FIsHorzAssigned;
	Classes::TPersistent* FOwner;
	TcxEditVertAlignment FVert;
	Classes::TNotifyEvent FOnChanged;
	TcxCustomEditProperties* __fastcall GetProperties(void);
	void __fastcall SetHorz(const Classes::TAlignment Value);
	void __fastcall SetVert(const TcxEditVertAlignment Value);
	
protected:
	TcxEditVertAlignment __fastcall DefaultVertAlignment(void);
	void __fastcall DoChanged(void);
	DYNAMIC Classes::TPersistent* __fastcall GetOwner(void);
	__property TcxCustomEditProperties* Properties = {read=GetProperties};
	__property Classes::TNotifyEvent OnChanged = {read=FOnChanged, write=FOnChanged};
	
public:
	__fastcall virtual TcxEditAlignment(Classes::TPersistent* AOwner);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	bool __fastcall IsHorzStored(void);
	bool __fastcall IsVertStored(void);
	void __fastcall Reset(void);
	
__published:
	__property Classes::TAlignment Horz = {read=FHorz, write=SetHorz, stored=IsHorzStored, nodefault};
	__property TcxEditVertAlignment Vert = {read=FVert, write=SetVert, stored=IsVertStored, nodefault};
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxEditAlignment(void) { }
	#pragma option pop
	
};


typedef void __fastcall (__closure *TcxEditButtonClickEvent)(System::TObject* Sender, int AButtonIndex);

__interface IcxEditDefaultValuesProvider;
typedef System::DelphiInterface<IcxEditDefaultValuesProvider> _di_IcxEditDefaultValuesProvider;
class DELPHICLASS TcxCustomEditPropertiesValues;
class PASCALIMPLEMENTATION TcxCustomEditPropertiesValues : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
public:
	bool ReadOnly;
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual void __fastcall Reset(void);
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxCustomEditPropertiesValues(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxCustomEditPropertiesValues(void) : Classes::TPersistent() { }
	#pragma option pop
	
};


typedef TMetaClass*TcxCustomEditPropertiesValuesClass;

typedef TMetaClass*TcxCustomEditViewDataClass;

class PASCALIMPLEMENTATION TcxCustomEditProperties : public Cxclasses::TcxInterfacedPersistent 
{
	typedef Cxclasses::TcxInterfacedPersistent inherited;
	
private:
	bool FAutoSelect;
	bool FBeepOnError;
	TcxEditButtons* FButtons;
	Classes::TShortCut FClearKey;
	Classes::TShortCut FClickKey;
	TcxCustomEdit* FEdit;
	Cxcontainer::TcxFreeNotificator* FFreeNotificator;
	bool FImmediatePost;
	TcxEditAlignment* FInnerAlignment;
	Classes::TComponentState FOwnerComponentState;
	bool FReadOnly;
	int FUpdateCount;
	bool FUseLeftAlignmentOnEditing;
	bool FUseMouseWheel;
	bool FValidateOnEnter;
	TcxEditButtonClickEvent FOnButtonClick;
	Classes::TNotifyEvent FOnChange;
	Classes::TNotifyEvent FOnEditValueChanged;
	TcxEditValidateEvent FOnValidate;
	Classes::TNotifyEvent FOnPropertiesChanged;
	TcxEditAlignment* __fastcall BaseGetAlignment(void);
	void __fastcall DefaultValuesChanged(System::TObject* Sender);
	bool __fastcall GetReadOnly(void);
	bool __fastcall IsAlignmentStored(void);
	bool __fastcall IsUseLeftAlignmentOnEditingStored(void);
	bool __fastcall IsReadOnlyStored(void);
	void __fastcall SetAutoSelect(bool Value);
	void __fastcall SetButtons(TcxEditButtons* Value);
	void __fastcall SetUseLeftAlignmentOnEditing(bool Value);
	void __fastcall SetIDefaultValuesProvider(_di_IcxEditDefaultValuesProvider Value);
	void __fastcall SetReadOnly(const bool Value);
	
protected:
	TcxEditAlignment* FAlignment;
	TcxCustomEditPropertiesValues* FAssignedValues;
	bool FChangedLocked;
	_di_IcxEditDefaultValuesProvider FIDefaultValuesProvider;
	Classes::TPersistent* FOwner;
	virtual void __fastcall AlignmentChangedHandler(System::TObject* Sender);
	virtual void __fastcall BaseSetAlignment(TcxEditAlignment* Value);
	virtual void __fastcall ButtonsChanged(System::TObject* Sender);
	bool __fastcall CanModify(void);
	virtual bool __fastcall CanValidate(void);
	virtual void __fastcall Changed(void);
	bool __fastcall ChangedLocked(void);
	virtual bool __fastcall CompareEditValue(void);
	virtual bool __fastcall DefaultUseLeftAlignmentOnEditing(void);
	virtual void __fastcall FreeNotification(Classes::TComponent* Sender);
	/* virtual class method */ virtual TMetaClass* __fastcall GetAssignedValuesClass(TMetaClass* vmt);
	virtual Classes::TAlignment __fastcall GetDefaultHorzAlignment(void);
	virtual TcxEditDisplayFormatOptions __fastcall GetDisplayFormatOptions(void);
	virtual AnsiString __fastcall GetValidateErrorText(int AErrorKind);
	virtual Cxdatautils::TcxDataEditValueSource __fastcall GetValueEditorEditValueSource(bool AEditFocused);
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewDataClass(TMetaClass* vmt);
	virtual bool __fastcall HasDisplayValue(void);
	bool __fastcall IsValueEditorWithValueFormatting(void);
	virtual bool __fastcall TabsNeed(void);
	virtual bool __fastcall WantNavigationKeys(void);
	__property TcxEditAlignment* Alignment = {read=BaseGetAlignment, write=BaseSetAlignment, stored=IsAlignmentStored};
	__property TcxCustomEditPropertiesValues* AssignedValues = {read=FAssignedValues};
	__property bool AutoSelect = {read=FAutoSelect, write=SetAutoSelect, default=1};
	__property bool BeepOnError = {read=FBeepOnError, write=FBeepOnError, default=0};
	__property TcxEditButtons* Buttons = {read=FButtons, write=SetButtons};
	__property Classes::TShortCut ClearKey = {read=FClearKey, write=FClearKey, default=0};
	__property Classes::TShortCut ClickKey = {read=FClickKey, write=FClickKey, default=16397};
	__property TcxEditDisplayFormatOptions DisplayFormatOptions = {read=GetDisplayFormatOptions, nodefault};
	__property Cxcontainer::TcxFreeNotificator* FreeNotificator = {read=FFreeNotificator};
	__property _di_IcxEditDefaultValuesProvider IDefaultValuesProvider = {read=FIDefaultValuesProvider, write=SetIDefaultValuesProvider};
	__property bool ImmediatePost = {read=FImmediatePost, write=FImmediatePost, default=0};
	__property bool ValidateOnEnter = {read=FValidateOnEnter, write=FValidateOnEnter, default=0};
	__property TcxEditButtonClickEvent OnButtonClick = {read=FOnButtonClick, write=FOnButtonClick};
	__property Classes::TNotifyEvent OnChange = {read=FOnChange, write=FOnChange};
	__property Classes::TNotifyEvent OnEditValueChanged = {read=FOnEditValueChanged, write=FOnEditValueChanged};
	__property Classes::TNotifyEvent OnPropertiesChanged = {read=FOnPropertiesChanged, write=FOnPropertiesChanged};
	__property TcxEditValidateEvent OnValidate = {read=FOnValidate, write=FOnValidate};
	
public:
	__fastcall virtual TcxCustomEditProperties(Classes::TPersistent* AOwner);
	__fastcall virtual ~TcxCustomEditProperties(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	/* virtual class method */ virtual TMetaClass* __fastcall GetContainerClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall GetStyleClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewInfoClass(TMetaClass* vmt);
	void __fastcall BeginUpdate(void);
	virtual TcxCustomEditViewData* __fastcall CreateViewData(Cxcontainer::TcxContainerStyle* AStyle, bool AIsInplace);
	void __fastcall EndUpdate(bool AInvokeChanged = true);
	virtual WideString __fastcall GetDisplayText(const Variant &AEditValue, bool AFullText = false);
	tagSIZE __fastcall GetEditConstantPartSize(Cxgraphics::TcxCanvas* ACanvas, TcxCustomEditStyle* AEditStyle, bool AIsInplace, const TcxEditSizeProperties &AEditSizeProperties, tagSIZE &MinContentSize);
	tagSIZE __fastcall GetEditContentSize(Cxgraphics::TcxCanvas* ACanvas, TcxCustomEditStyle* AEditStyle, bool AIsInplace, const Variant &AEditValue, const TcxEditSizeProperties &AEditSizeProperties);
	tagSIZE __fastcall GetEditSize(Cxgraphics::TcxCanvas* ACanvas, TcxCustomEditStyle* AEditStyle, bool AIsInplace, const Variant &AEditValue, const TcxEditSizeProperties &AEditSizeProperties);
	virtual TcxEditSupportedOperations __fastcall GetSupportedOperations(void);
	virtual bool __fastcall IsEditValueValid(Variant &EditValue, bool AEditFocused);
	virtual bool __fastcall IsResetEditClass(void);
	virtual void __fastcall Loaded(void);
	void __fastcall LockUpdate(bool ALock);
	virtual void __fastcall PrepareDisplayValue(const Variant &AEditValue, Variant &DisplayValue, bool AEditFocused);
	void __fastcall RestoreDefaults(void);
	virtual void __fastcall Update(TcxCustomEditProperties* AProperties);
	virtual void __fastcall ValidateDisplayValue(Variant &DisplayValue, AnsiString &ErrorText, bool &Error, TcxCustomEdit* AEdit);
	virtual Cxdatautils::TcxDataEditValueSource __fastcall GetEditValueSource(bool AEditFocused);
	__property Classes::TComponentState OwnerComponentState = {read=FOwnerComponentState, write=FOwnerComponentState, nodefault};
	__property bool ReadOnly = {read=GetReadOnly, write=SetReadOnly, stored=IsReadOnlyStored, nodefault};
	__property bool UseLeftAlignmentOnEditing = {read=FUseLeftAlignmentOnEditing, write=SetUseLeftAlignmentOnEditing, stored=IsUseLeftAlignmentOnEditingStored, nodefault};
	__property bool UseMouseWheel = {read=FUseMouseWheel, write=FUseMouseWheel, default=1};
};


class DELPHICLASS TcxEditRepository;
typedef TMetaClass*TcxEditRepositoryItemClass;

class PASCALIMPLEMENTATION TcxEditRepository : public Classes::TComponent 
{
	typedef Classes::TComponent inherited;
	
public:
	TcxEditRepositoryItem* operator[](int Index) { return Items[Index]; }
	
private:
	Classes::TList* FItems;
	int __fastcall GetCount(void);
	TcxEditRepositoryItem* __fastcall GetItem(int Index);
	
protected:
	void __fastcall AddItem(TcxEditRepositoryItem* AItem);
	DYNAMIC void __fastcall GetChildren(Classes::TGetChildProc Proc, Classes::TComponent* Root);
	void __fastcall RemoveItem(TcxEditRepositoryItem* AItem);
	
public:
	__fastcall virtual TcxEditRepository(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxEditRepository(void);
	void __fastcall Clear(void);
	virtual TcxEditRepositoryItem* __fastcall CreateItem(TMetaClass* ARepositoryItemClass);
	virtual TcxEditRepositoryItem* __fastcall CreateItemEx(TMetaClass* ARepositoryItemClass, Classes::TComponent* AOwner);
	TcxEditRepositoryItem* __fastcall ItemByName(AnsiString ARepositoryItemName);
	__property int Count = {read=GetCount, nodefault};
	__property TcxEditRepositoryItem* Items[int Index] = {read=GetItem/*, default*/};
};


class PASCALIMPLEMENTATION TcxEditRepositoryItem : public Classes::TComponent 
{
	typedef Classes::TComponent inherited;
	
private:
	Classes::_di_IInterfaceList FListenerList;
	TcxCustomEditProperties* FProperties;
	Classes::TNotifyEvent FPropertiesEvents;
	TcxEditRepository* FRepository;
	void __fastcall SetProperties(TcxCustomEditProperties* Value);
	void __fastcall SetRepository(TcxEditRepository* Value);
	
protected:
	virtual void __fastcall PropertiesChanged(System::TObject* Sender);
	virtual void __fastcall ReadState(Classes::TReader* Reader);
	
public:
	__fastcall virtual TcxEditRepositoryItem(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxEditRepositoryItem(void);
	virtual void __fastcall AddListener(_di_IcxEditRepositoryItemListener AListener);
	/* virtual class method */ virtual TMetaClass* __fastcall GetEditPropertiesClass(TMetaClass* vmt);
	DYNAMIC Classes::TComponent* __fastcall GetParentComponent(void);
	DYNAMIC bool __fastcall HasParent(void);
	virtual void __fastcall RemoveListener(_di_IcxEditRepositoryItemListener AListener);
	DYNAMIC void __fastcall SetParentComponent(Classes::TComponent* AParent);
	__property TcxEditRepository* Repository = {read=FRepository, write=SetRepository};
	
__published:
	__property TcxCustomEditProperties* Properties = {read=FProperties, write=SetProperties};
	__property Classes::TNotifyEvent PropertiesEvents = {read=FPropertiesEvents, write=FPropertiesEvents};
};


__interface INTERFACE_UUID("{AE727882-6FDF-4E3A-AB35-E58AB28EFE7B}") IcxEditDefaultValuesProvider  : public IInterface 
{
	
public:
	virtual void __fastcall ChangedNotification(void) = 0 ;
	virtual void __fastcall ClearUsers(void) = 0 ;
	virtual Classes::TAlignment __fastcall DefaultAlignment(void) = 0 ;
	virtual TcxBlobKind __fastcall DefaultBlobKind(void) = 0 ;
	virtual bool __fastcall DefaultCanModify(void) = 0 ;
	virtual AnsiString __fastcall DefaultDisplayFormat(void) = 0 ;
	virtual AnsiString __fastcall DefaultEditMask(void) = 0 ;
	virtual bool __fastcall DefaultIsFloatValue(void) = 0 ;
	virtual int __fastcall DefaultMaxLength(void) = 0 ;
	virtual double __fastcall DefaultMaxValue(void) = 0 ;
	virtual double __fastcall DefaultMinValue(void) = 0 ;
	virtual bool __fastcall DefaultReadOnly(void) = 0 ;
	virtual bool __fastcall DefaultRequired(void) = 0 ;
	virtual System::TObject* __fastcall GetInstance(void) = 0 ;
	virtual Classes::TNotifyEvent __fastcall GetOnChanged(void) = 0 ;
	virtual bool __fastcall HasDisplayValueFormatting(void) = 0 ;
	virtual bool __fastcall IsBlob(void) = 0 ;
	virtual bool __fastcall IsDisplayFormatDefined(bool AIsCurrencyValueAccepted) = 0 ;
	virtual bool __fastcall IsValidChar(char AChar) = 0 ;
	virtual void __fastcall SetOnChanged(Classes::TNotifyEvent Value) = 0 ;
	__property Classes::TNotifyEvent OnChanged = {read=GetOnChanged, write=SetOnChanged};
};

#pragma pack(push, 4)
struct TcxEditButtonViewInfoData
{
	Graphics::TColor BackgroundColor;
	bool Default;
	bool IsInplace;
	TcxEditButtonKind Kind;
	bool LeftAlignment;
	bool Leftmost;
	bool NativeStyle;
	bool Rightmost;
	TcxEditButtonState State;
	TcxEditButtonStyle Style;
	bool Transparent;
	bool BackgroundPartiallyTransparent;
	bool ComboBoxStyle;
	int NativePart;
	int NativeState;
} ;
#pragma pack(pop)

typedef TcxEditButtonViewInfoData *PcxEditButtonViewInfoData;

class DELPHICLASS TcxEditButtonViewInfo;
class PASCALIMPLEMENTATION TcxEditButtonViewInfo : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
public:
	#pragma pack(push, 1)
	Types::TRect Bounds;
	#pragma pack(pop)
	
	TcxEditButtonViewInfoData Data;
	Graphics::TBitmap* Glyph;
	bool HasBackground;
	int Index;
	#pragma pack(push, 1)
	Types::TRect VisibleBounds;
	#pragma pack(pop)
	
	int Width;
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual Cxgraphics::TcxRegion* __fastcall GetUpdateRegion(TcxEditButtonViewInfo* AViewInfo);
	virtual bool __fastcall Repaint(Controls::TWinControl* AControl, TcxEditButtonViewInfo* AViewInfo, const Types::TPoint &AEditPosition);
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxEditButtonViewInfo(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxEditButtonViewInfo(void) : Classes::TPersistent() { }
	#pragma option pop
	
};


typedef TMetaClass*TcxEditButtonViewInfoClass;

class PASCALIMPLEMENTATION TcxEditButton : public Classes::TCollectionItem 
{
	typedef Classes::TCollectionItem inherited;
	
private:
	bool FDefault;
	Graphics::TBitmap* FGlyph;
	TcxEditButtonKind FKind;
	bool FLeftAlignment;
	bool FVisible;
	int FWidth;
	Graphics::TBitmap* __fastcall GetGlyph(void);
	void __fastcall GlyphChanged(System::TObject* Sender);
	void __fastcall SetDefault(bool Value);
	void __fastcall SetGlyph(Graphics::TBitmap* Value);
	void __fastcall SetKind(TcxEditButtonKind Value);
	void __fastcall SetLeftAlignment(bool Value);
	void __fastcall SetVisible(bool Value);
	void __fastcall SetWidth(int Value);
	
public:
	__fastcall virtual TcxEditButton(Classes::TCollection* Collection);
	__fastcall virtual ~TcxEditButton(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	
__published:
	__property bool Default = {read=FDefault, write=SetDefault, default=0};
	__property Graphics::TBitmap* Glyph = {read=GetGlyph, write=SetGlyph};
	__property TcxEditButtonKind Kind = {read=FKind, write=SetKind, default=1};
	__property bool LeftAlignment = {read=FLeftAlignment, write=SetLeftAlignment, default=0};
	__property bool Visible = {read=FVisible, write=SetVisible, default=1};
	__property int Width = {read=FWidth, write=SetWidth, default=0};
};


typedef TMetaClass*TcxEditButtonClass;

typedef DynamicArray<TcxEditButtonViewInfo* >  cxEdit__8;

class PASCALIMPLEMENTATION TcxCustomEditViewInfo : public Cxcontainer::TcxContainerViewInfo 
{
	typedef Cxcontainer::TcxContainerViewInfo inherited;
	
protected:
	virtual void __fastcall InternalPaint(Cxgraphics::TcxCanvas* ACanvas);
	virtual TMetaClass* __fastcall GetButtonViewInfoClass(void);
	void __fastcall SetButtonCount(int ACount);
	
public:
	#pragma pack(push, 1)
	Types::TRect BorderExtent;
	#pragma pack(pop)
	
	TcxEditBorderStyle BorderStyle;
	DynamicArray<TcxEditButtonViewInfo* >  ButtonsInfo;
	Cxgraphics::TcxBorders Edges;
	int EditNativeState;
	TcxEditState EditState;
	bool Enabled;
	bool Focused;
	Graphics::TFont* Font;
	bool HasBackground;
	bool HasInnerEdit;
	int HitTestInfo;
	Cxcontainer::TcxContainerHotState HotState;
	#pragma pack(push, 1)
	Types::TRect InnerEditRect;
	#pragma pack(pop)
	
	bool IsButtonReallyPressed;
	bool IsInplace;
	bool IsSelected;
	int Left;
	bool NativeStyle;
	TcxEditPaintOptions PaintOptions;
	TcxEditPopupBorderStyle PopupBorderStyle;
	int PressedButton;
	bool PreviewMode;
	int SelectedButton;
	#pragma pack(push, 1)
	Types::TRect ShadowRect;
	#pragma pack(pop)
	
	Graphics::TColor TextColor;
	int Top;
	bool Transparent;
	HWND WindowHandle;
	__fastcall virtual TcxCustomEditViewInfo(void);
	__fastcall virtual ~TcxCustomEditViewInfo(void);
	virtual void __fastcall Assign(System::TObject* Source);
	virtual void __fastcall DrawButton(Cxgraphics::TcxCanvas* ACanvas, int AButtonVisibleIndex);
	virtual void __fastcall DrawButtonBorder(Cxgraphics::TcxCanvas* ACanvas, int AButtonVisibleIndex, TcxEditButtonStyle AButtonStyle, const Types::TRect &ARect);
	virtual void __fastcall DrawButtonContent(Cxgraphics::TcxCanvas* ACanvas, int AButtonVisibleIndex, const Types::TRect &AContentRect, Graphics::TColor APenColor, Graphics::TColor ABrushColor);
	virtual Cxgraphics::TcxRegion* __fastcall GetUpdateRegion(Cxcontainer::TcxContainerViewInfo* AViewInfo);
	virtual bool __fastcall IsHotTrack(void);
	virtual bool __fastcall NeedShowHint(Cxgraphics::TcxCanvas* ACanvas, const Types::TPoint &P, /* out */ AnsiString &AText, /* out */ bool &AIsMultiLine, /* out */ Types::TRect &ATextRect)/* overload */;
	virtual bool __fastcall NeedShowHint(Cxgraphics::TcxCanvas* ACanvas, const Types::TPoint &P, const Types::TRect &AVisibleBounds, /* out */ AnsiString &AText, /* out */ bool &AIsMultiLine, /* out */ Types::TRect &ATextRect)/* overload */;
	virtual void __fastcall Offset(int DX, int DY);
	void __fastcall PaintEx(Cxgraphics::TcxCanvas* ACanvas);
	virtual bool __fastcall Repaint(Controls::TWinControl* AControl, Cxcontainer::TcxContainerViewInfo* AViewInfo = (Cxcontainer::TcxContainerViewInfo*)(0x0), Types::PRect APInnerEditRect = (void *)(0x0));
};


#pragma pack(push, 4)
struct TcxEditSizeProperties
{
	int MaxLineCount;
	int Width;
} ;
#pragma pack(pop)

typedef TcxEditSizeProperties *PcxEditSizeProperties;

class PASCALIMPLEMENTATION TcxCustomEditViewData : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	bool FIsInplace;
	int FLeftSideLeftmostButtonIndex;
	int FLeftSideRightmostButtonIndex;
	int FRightSideLeftmostButtonIndex;
	int FRightSideRightmostButtonIndex;
	TcxCustomEditProperties* __fastcall GetProperties(void);
	TcxCustomEditStyle* __fastcall GetStyle(void);
	void __fastcall SetProperties(TcxCustomEditProperties* Value);
	void __fastcall SetStyle(TcxCustomEditStyle* Value);
	
protected:
	TcxCustomEditProperties* FProperties;
	Cxcontainer::TcxContainerStyle* FStyle;
	virtual bool __fastcall CanPressButton(TcxCustomEditViewInfo* AViewInfo, int AButtonVisibleIndex);
	virtual TcxEditBorderStyle __fastcall GetBorderStyle(Cxcontainer::TcxContainerHotState AEditHotState);
	int __fastcall GetCaptureButtonVisibleIndex(void);
	TcxEditBorderStyle __fastcall GetDefaultBorderStyle(Cxcontainer::TcxContainerHotState AEditHotState);
	virtual void __fastcall Initialize(void);
	virtual void __fastcall InitCacheData(void);
	bool __fastcall InternalFocused(void);
	virtual tagSIZE __fastcall InternalGetEditConstantPartSize(Cxgraphics::TcxCanvas* ACanvas, bool AIsInplace, const TcxEditSizeProperties &AEditSizeProperties, tagSIZE &MinContentSize, TcxCustomEditViewInfo* AViewInfo);
	virtual bool __fastcall IsButtonPressed(TcxCustomEditViewInfo* AViewInfo, int AButtonVisibleIndex);
	virtual void __fastcall CalculateButtonNativeInfo(TcxEditButtonViewInfo* AButtonViewInfo);
	
public:
	bool AutoHeight;
	TcxEditBorderStyle BorderStyle;
	#pragma pack(push, 1)
	Types::TRect Bounds;
	#pragma pack(pop)
	
	int ButtonVisibleCount;
	#pragma pack(push, 1)
	Types::TRect ContentOffset;
	#pragma pack(pop)
	
	TcxCustomEdit* Edit;
	TcxEditState EditState;
	bool Enabled;
	bool Focused;
	Classes::TAlignment HorzAlignment;
	Cxcontrols::TcxControlScrollBar* HScrollBar;
	_di_IcxCustomInnerEdit InnerEdit;
	bool IsDesigning;
	bool IsSelected;
	bool IsValueSource;
	int MaxLineCount;
	bool NativeStyle;
	TcxEditPaintOptions PaintOptions;
	bool Selected;
	int SelStart;
	int SelLength;
	Graphics::TColor SelTextColor;
	Graphics::TColor SelBackgroundColor;
	TcxEditVertAlignment VertAlignment;
	Cxcontrols::TcxControlScrollBar* VScrollBar;
	HWND WindowHandle;
	__fastcall virtual TcxCustomEditViewData(TcxCustomEditProperties* AProperties, Cxcontainer::TcxContainerStyle* AStyle, bool AIsInplace);
	virtual void __fastcall Calculate(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ABounds, const Types::TPoint &P, Cxcontainer::TcxMouseButton Button, Classes::TShiftState Shift, TcxCustomEditViewInfo* AViewInfo, bool AIsMouseEvent);
	virtual void __fastcall CalculateButtonBounds(Cxgraphics::TcxCanvas* ACanvas, TcxCustomEditViewInfo* AViewInfo, int AButtonVisibleIndex, Types::TRect &ButtonsRect);
	virtual void __fastcall CalculateButtonsViewInfo(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ABounds, const Types::TPoint &P, Cxcontainer::TcxMouseButton Button, Classes::TShiftState Shift, TcxCustomEditViewInfo* AViewInfo, bool AIsMouseEvent);
	virtual void __fastcall CalculateButtonViewInfo(Cxgraphics::TcxCanvas* ACanvas, TcxCustomEditViewInfo* AViewInfo, int AButtonVisibleIndex, Types::TRect &ButtonsRect);
	void __fastcall CalculateEx(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ABounds, const Types::TPoint &P, Cxcontainer::TcxMouseButton Button, Classes::TShiftState Shift, TcxCustomEditViewInfo* AViewInfo, bool AIsMouseEvent);
	virtual void __fastcall EditValueToDrawValue(Cxgraphics::TcxCanvas* ACanvas, const Variant &AEditValue, TcxCustomEditViewInfo* AViewInfo);
	virtual Types::TRect __fastcall GetBorderExtent();
	virtual Types::TRect __fastcall GetClientExtent(TcxCustomEditViewInfo* AViewInfo);
	virtual tagSIZE __fastcall GetEditConstantPartSize(Cxgraphics::TcxCanvas* ACanvas, const TcxEditSizeProperties &AEditSizeProperties, tagSIZE &MinContentSize, TcxCustomEditViewInfo* AViewInfo = (TcxCustomEditViewInfo*)(0x0));
	virtual tagSIZE __fastcall GetEditContentSize(Cxgraphics::TcxCanvas* ACanvas, const Variant &AEditValue, const TcxEditSizeProperties &AEditSizeProperties);
	tagSIZE __fastcall GetEditSize(Cxgraphics::TcxCanvas* ACanvas, const Variant &AEditValue, const TcxEditSizeProperties &AEditSizeProperties);
	__property bool IsInplace = {read=FIsInplace, nodefault};
	__property TcxCustomEditProperties* Properties = {read=GetProperties, write=SetProperties};
	__property TcxCustomEditStyle* Style = {read=GetStyle, write=SetStyle};
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxCustomEditViewData(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxEditStyleController;
class DELPHICLASS TcxEditStyle;
class PASCALIMPLEMENTATION TcxEditStyleController : public Cxcontainer::TcxStyleController 
{
	typedef Cxcontainer::TcxStyleController inherited;
	
private:
	TcxEditStyle* __fastcall GetStyle(void);
	HIDESBASE void __fastcall SetStyle(TcxEditStyle* Value);
	
protected:
	virtual TMetaClass* __fastcall GetStyleClass(void);
	
__published:
	__property TcxEditStyle* Style = {read=GetStyle, write=SetStyle};
	__property OnStyleChanged ;
public:
	#pragma option push -w-inl
	/* TcxStyleController.Create */ inline __fastcall virtual TcxEditStyleController(Classes::TComponent* AOwner) : Cxcontainer::TcxStyleController(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxStyleController.Destroy */ inline __fastcall virtual ~TcxEditStyleController(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxCustomEditStyle : public Cxcontainer::TcxContainerStyle 
{
	typedef Cxcontainer::TcxContainerStyle inherited;
	
private:
	TcxEditButtonStyle FButtonStyle;
	TcxEditButtonTransparency FButtonTransparency;
	TcxEditPopupBorderStyle FPopupBorderStyle;
	bool FPopupCloseButton;
	HIDESBASE Cxcontainer::TcxContainerStyleValues __fastcall GetAssignedValues(void);
	HIDESBASE TcxEditBorderStyle __fastcall GetBorderStyle(void);
	TcxEditButtonStyle __fastcall GetButtonStyle(void);
	TcxEditButtonTransparency __fastcall GetButtonTransparency(void);
	TcxCustomEdit* __fastcall GetEdit(void);
	TcxEditPopupBorderStyle __fastcall GetPopupBorderStyle(void);
	TcxEditStyleController* __fastcall GetStyleController(void);
	bool __fastcall InternalGetButtonStyle(TcxEditButtonStyle &ButtonStyle);
	bool __fastcall InternalGetButtonTransparency(TcxEditButtonTransparency &ButtonTransparency);
	bool __fastcall InternalGetPopupBorderStyle(TcxEditPopupBorderStyle &PopupBorderStyle);
	HIDESBASE bool __fastcall IsBorderStyleStored(void);
	bool __fastcall IsButtonStyleStored(void);
	bool __fastcall IsButtonTransparencyStored(void);
	bool __fastcall IsPopupBorderStyleStored(void);
	HIDESBASE void __fastcall SetAssignedValues(Cxcontainer::TcxContainerStyleValues Value);
	HIDESBASE void __fastcall SetBorderStyle(TcxEditBorderStyle Value);
	void __fastcall SetButtonStyle(TcxEditButtonStyle Value);
	void __fastcall SetButtonTransparency(TcxEditButtonTransparency Value);
	void __fastcall SetPopupBorderStyle(TcxEditPopupBorderStyle Value);
	void __fastcall SetPopupCloseButton(bool Value);
	void __fastcall SetStyleController(TcxEditStyleController* Value);
	
protected:
	virtual Graphics::TColor __fastcall DefaultColor(void);
	virtual bool __fastcall IsValueDefined(Cxcontainer::TcxContainerStyleValue AValue);
	virtual TcxEditButtonStyle __fastcall DefaultButtonStyle(void);
	virtual TcxEditButtonTransparency __fastcall DefaultButtonTransparency(void);
	virtual TcxEditPopupBorderStyle __fastcall DefaultPopupBorderStyle(void);
	__property bool PopupCloseButton = {read=FPopupCloseButton, write=SetPopupCloseButton, default=1};
	
public:
	__fastcall virtual TcxCustomEditStyle(Classes::TPersistent* AOwner, bool ADirectAccessMode);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	/* virtual class method */ virtual int __fastcall GetStyleValueCount(TMetaClass* vmt);
	/* virtual class method */ virtual bool __fastcall GetStyleValueName(TMetaClass* vmt, Cxcontainer::TcxContainerStyleValue AStyleValue, /* out */ AnsiString &StyleValueName);
	__property TcxCustomEdit* Edit = {read=GetEdit};
	
__published:
	__property Cxcontainer::TcxContainerStyleValues AssignedValues = {read=GetAssignedValues, write=SetAssignedValues, stored=false, nodefault};
	__property TcxEditBorderStyle BorderStyle = {read=GetBorderStyle, write=SetBorderStyle, stored=IsBorderStyleStored, nodefault};
	__property TcxEditButtonStyle ButtonStyle = {read=GetButtonStyle, write=SetButtonStyle, stored=IsButtonStyleStored, nodefault};
	__property TcxEditButtonTransparency ButtonTransparency = {read=GetButtonTransparency, write=SetButtonTransparency, stored=IsButtonTransparencyStored, nodefault};
	__property TcxEditPopupBorderStyle PopupBorderStyle = {read=GetPopupBorderStyle, write=SetPopupBorderStyle, stored=IsPopupBorderStyleStored, nodefault};
	__property TcxEditStyleController* StyleController = {read=GetStyleController, write=SetStyleController};
public:
	#pragma option push -w-inl
	/* TcxContainerStyle.Destroy */ inline __fastcall virtual ~TcxCustomEditStyle(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxEditStyle : public TcxCustomEditStyle 
{
	typedef TcxCustomEditStyle inherited;
	
public:
	#pragma option push -w-inl
	/* TcxCustomEditStyle.Create */ inline __fastcall virtual TcxEditStyle(Classes::TPersistent* AOwner, bool ADirectAccessMode) : TcxCustomEditStyle(AOwner, ADirectAccessMode) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxContainerStyle.Destroy */ inline __fastcall virtual ~TcxEditStyle(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomEditDefaultValuesProvider;
class PASCALIMPLEMENTATION TcxCustomEditDefaultValuesProvider : public Cxclasses::TcxInterfacedPersistent 
{
	typedef Cxclasses::TcxInterfacedPersistent inherited;
	
private:
	Classes::TNotifyEvent FOnChanged;
	Classes::TNotifyEvent __fastcall GetOnChanged();
	void __fastcall SetOnChanged(Classes::TNotifyEvent Value);
	
protected:
	void __fastcall DoChanged(void);
	
public:
	__fastcall virtual ~TcxCustomEditDefaultValuesProvider(void);
	void __fastcall ChangedNotification(void);
	void __fastcall ClearUsers(void);
	virtual Classes::TAlignment __fastcall DefaultAlignment(void);
	virtual TcxBlobKind __fastcall DefaultBlobKind(void);
	virtual bool __fastcall DefaultCanModify(void);
	virtual AnsiString __fastcall DefaultDisplayFormat();
	virtual AnsiString __fastcall DefaultEditMask();
	virtual bool __fastcall DefaultIsFloatValue(void);
	virtual int __fastcall DefaultMaxLength(void);
	virtual double __fastcall DefaultMaxValue(void);
	virtual double __fastcall DefaultMinValue(void);
	virtual bool __fastcall DefaultReadOnly(void);
	virtual bool __fastcall DefaultRequired(void);
	System::TObject* __fastcall GetInstance(void);
	virtual bool __fastcall HasDisplayValueFormatting(void);
	virtual bool __fastcall IsBlob(void);
	virtual bool __fastcall IsDisplayFormatDefined(bool AIsCurrencyValueAccepted);
	virtual bool __fastcall IsValidChar(char AChar);
	__property Classes::TNotifyEvent OnChanged = {read=GetOnChanged, write=SetOnChanged};
public:
	#pragma option push -w-inl
	/* TcxInterfacedPersistent.Create */ inline __fastcall virtual TcxCustomEditDefaultValuesProvider(Classes::TPersistent* AOwner) : Cxclasses::TcxInterfacedPersistent(AOwner) { }
	#pragma option pop
	
private:
	void *__IcxEditDefaultValuesProvider;	/* Cxedit::IcxEditDefaultValuesProvider */
	
public:
	operator IcxEditDefaultValuesProvider*(void) { return (IcxEditDefaultValuesProvider*)&__IcxEditDefaultValuesProvider; }
	
};


typedef TMetaClass*TcxCustomEditDefaultValuesProviderClass;

class DELPHICLASS TcxDataBinding;
class PASCALIMPLEMENTATION TcxDataBinding : public Cxdatautils::TcxCustomDataBinding 
{
	typedef Cxdatautils::TcxCustomDataBinding inherited;
	
public:
	#pragma option push -w-inl
	/* TcxCustomDataBinding.Create */ inline __fastcall virtual TcxDataBinding(Classes::TComponent* AOwner, Classes::TComponent* ADataComponent) : Cxdatautils::TcxCustomDataBinding(AOwner, ADataComponent) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxDataBinding(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TInterfacedObjectClass;

class PASCALIMPLEMENTATION TcxEditDataBinding : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	TcxCustomEditDefaultValuesProvider* FIDefaultValuesProvider;
	_di_IcxEditDefaultValuesProvider __fastcall GetIDefaultValuesProvider();
	
protected:
	TcxCustomEdit* FEdit;
	virtual bool __fastcall CanCheckEditorValue(void);
	virtual bool __fastcall CanSetEditMode(void);
	virtual void __fastcall DefaultValuesChanged(void);
	virtual bool __fastcall ExecuteAction(Classes::TBasicAction* Action);
	virtual Variant __fastcall GetDisplayValue();
	TcxEditDataBinding* __fastcall GetEditDataBindingInstance(void);
	virtual bool __fastcall GetModified(void);
	DYNAMIC Classes::TPersistent* __fastcall GetOwner(void);
	virtual Variant __fastcall GetStoredValue();
	virtual void __fastcall Reset(void);
	void __fastcall SetInternalDisplayValue(const Variant &Value);
	virtual void __fastcall SetDisplayValue(const Variant &Value);
	virtual bool __fastcall SetEditMode(void);
	virtual void __fastcall SetStoredValue(const Variant &Value);
	virtual bool __fastcall UpdateAction(Classes::TBasicAction* Action);
	virtual void __fastcall UpdateDisplayValue(void);
	__property TcxCustomEdit* Edit = {read=FEdit};
	__property _di_IcxEditDefaultValuesProvider IDefaultValuesProvider = {read=GetIDefaultValuesProvider};
	
public:
	__fastcall virtual TcxEditDataBinding(TcxCustomEdit* AEdit);
	__fastcall virtual ~TcxEditDataBinding(void);
	/* virtual class method */ virtual TMetaClass* __fastcall GetDefaultValuesProviderClass(TMetaClass* vmt);
	virtual void __fastcall UpdateEdit(void);
	__property Variant DisplayValue = {read=GetDisplayValue, write=SetDisplayValue};
	__property bool Modified = {read=GetModified, nodefault};
	__property Variant StoredValue = {read=GetStoredValue, write=SetStoredValue};
};


#pragma pack(push, 1)
struct TcxEditModifiedState
{
	bool Modified;
	bool ModifiedAfterEnter;
} ;
#pragma pack(pop)

typedef TMetaClass*TcxCustomEditClass;

#pragma pack(push, 4)
struct TcxEditListItem
{
	TcxCustomEdit* Edit;
	TcxCustomEditProperties* Properties;
} ;
#pragma pack(pop)

typedef TcxEditListItem *PcxEditListItem;

class DELPHICLASS TcxInplaceEditList;
class PASCALIMPLEMENTATION TcxInplaceEditList : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	Classes::TList* FItems;
	int __fastcall GetCount(void);
	PcxEditListItem __fastcall GetItem(int Index);
	void __fastcall DestroyItems(void);
	
protected:
	virtual TcxCustomEdit* __fastcall CreateEdit(TcxCustomEditProperties* AProperties);
	TcxCustomEdit* __fastcall FindEdit(TcxCustomEditProperties* AProperties);
	PcxEditListItem __fastcall FindItem(TcxCustomEditProperties* AProperties);
	__property int Count = {read=GetCount, nodefault};
	__property PcxEditListItem Items[int Index] = {read=GetItem};
	
public:
	__fastcall TcxInplaceEditList(void);
	__fastcall virtual ~TcxInplaceEditList(void);
	TcxCustomEdit* __fastcall GetEdit(TcxCustomEditProperties* AProperties)/* overload */;
	TcxCustomEdit* __fastcall GetEdit(TMetaClass* APropertiesClass)/* overload */;
	void __fastcall RemoveItem(PcxEditListItem AItem)/* overload */;
	void __fastcall RemoveItem(TcxCustomEditProperties* AProperties)/* overload */;
};


//-- var, const, procedure ---------------------------------------------------
static const bool cxEditDefaultUseLeftAlignmentOnEditing = true;
extern PACKAGE Classes::TAlignment cxEditDefaultHorzAlignment;
extern PACKAGE TcxEditVertAlignment cxEditDefaultVertAlignment;
static const Shortint ekDefault = 0x0;
static const Shortint svBorderColor = 0x0;
static const Shortint svBorderStyle = 0x1;
static const Shortint svColor = 0x2;
static const Shortint svEdges = 0x3;
static const Shortint svFont = 0x4;
static const Shortint svHotTrack = 0x5;
static const Shortint svShadow = 0x6;
static const Shortint svTransparentBorder = 0x7;
static const Shortint svButtonStyle = 0x8;
static const Shortint svButtonTransparency = 0x9;
static const Shortint svPopupBorderStyle = 0xa;
static const Shortint cxEditStyleValueCount = 0xb;
extern PACKAGE AnsiString cxEditStyleValueNameA[3];
static const Word CM_EDITVALIDATIONERROR = 0x8069;
extern PACKAGE Classes::TShiftState __fastcall ButtonToShift(Controls::TMouseButton Button);
extern PACKAGE void __fastcall CheckSize(tagSIZE &Size, const tagSIZE &ANewSize);
extern PACKAGE Classes::TShiftState __fastcall cxButtonToShift(Cxcontainer::TcxMouseButton Button);
extern PACKAGE TcxEditRepository* __fastcall GetDefaultEditRepository(void);
extern PACKAGE Classes::TComponent* __fastcall GetOwnerComponent(Classes::TPersistent* APersistent);
extern PACKAGE Cxclasses::TcxRegisteredClasses* __fastcall GetRegisteredEditProperties(void);
extern PACKAGE bool __fastcall InternalVarEqualsExact(const Variant &V1, const Variant &V2);
extern PACKAGE void __fastcall SendKeyDown(Controls::TWinControl* AReceiver, Word Key, Classes::TShiftState Shift);
extern PACKAGE void __fastcall SendKeyPress(Controls::TWinControl* AReceiver, char Key);
extern PACKAGE void __fastcall SendKeyUp(Controls::TWinControl* AReceiver, Word Key, Classes::TShiftState Shift);
extern PACKAGE void __fastcall UniteRegions(Cxgraphics::TcxRegion* ADestRgn, Cxgraphics::TcxRegion* ASrcRgn);
extern PACKAGE Word __fastcall ShiftStateToKeys(Classes::TShiftState Shift);

}	/* namespace Cxedit */
using namespace Cxedit;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxEdit
