// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxRadioGroup.pas' rev: 6.00

#ifndef cxRadioGroupHPP
#define cxRadioGroupHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxTextEdit.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <cxLookAndFeels.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <ImgList.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Variants.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxradiogroup
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TcxRadioButtonState { rbsDisabled, rbsHot, rbsNormal, rbsPressed };
#pragma option pop

#pragma option push -b-
enum TcxRadioGroupState { rgsActive, rgsDisabled, rgsHot, rgsNormal };
#pragma option pop

class DELPHICLASS TcxRadioButton;
class PASCALIMPLEMENTATION TcxRadioButton : public Stdctrls::TRadioButton 
{
	typedef Stdctrls::TRadioButton inherited;
	
private:
	#pragma pack(push, 1)
	Types::TRect FButtonRect;
	#pragma pack(pop)
	
	Cxgraphics::TcxCanvas* FCanvas;
	int FColumn;
	Controls::TControlCanvas* FControlCanvas;
	Cxlookandfeels::TcxLookAndFeel* FLookAndFeel;
	int FRow;
	TcxRadioButtonState FState;
	bool FParentBackground;
	bool FWordWrap;
	void __fastcall MouseTrackingCallerMouseLeave(void);
	void __fastcall SetLookAndFeel(Cxlookandfeels::TcxLookAndFeel* Value);
	void __fastcall SetState(TcxRadioButtonState Value);
	void __fastcall DrawItem(const tagDRAWITEMSTRUCT &DrawItemStruct);
	void __fastcall SetParentBackground(bool Value);
	void __fastcall SetWordWrap(bool Value);
	HIDESBASE MESSAGE void __fastcall WMEraseBkgnd(Messages::TWMEraseBkgnd &Message);
	MESSAGE void __fastcall BMSetCheck(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMEnabledChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMMouseEnter(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMMouseLeave(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMSysColorChange(Messages::TMessage &Message);
	MESSAGE void __fastcall CNDrawItem(Messages::TWMDrawItem &Message);
	MESSAGE void __fastcall CNMeasureItem(Messages::TWMMeasureItem &Message);
	
protected:
	DYNAMIC void __fastcall DoEnter(void);
	DYNAMIC void __fastcall MouseDown(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseMove(Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseUp(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall CreateParams(Controls::TCreateParams &Params);
	virtual void __fastcall CorrectTextRect(Types::TRect &R, bool ANativeStyle);
	DYNAMIC void __fastcall EnabledChanged(void);
	void __fastcall InternalPolyLine(const Types::TPoint * APoints, const int APoints_Size);
	virtual bool __fastcall IsInplace(void);
	virtual void __fastcall LookAndFeelChanged(Cxlookandfeels::TcxLookAndFeel* Sender, Cxlookandfeels::TcxLookAndFeelValues AChangedValues);
	DYNAMIC void __fastcall MouseEnter(Controls::TControl* AControl);
	DYNAMIC void __fastcall MouseLeave(Controls::TControl* AControl);
	virtual void __fastcall Paint(void);
	void __fastcall ShortUpdateState(void);
	virtual void __fastcall UpdateState(Cxcontainer::TcxMouseButton Button, Classes::TShiftState Shift, const Types::TPoint &P);
	__property Cxgraphics::TcxCanvas* Canvas = {read=FCanvas};
	__property int Column = {read=FColumn, nodefault};
	__property int Row = {read=FRow, nodefault};
	__property TcxRadioButtonState State = {read=FState, write=SetState, nodefault};
	
public:
	__fastcall virtual TcxRadioButton(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxRadioButton(void);
	DYNAMIC bool __fastcall Focused(void);
	virtual void __fastcall Invalidate(void);
	
__published:
	__property Cxlookandfeels::TcxLookAndFeel* LookAndFeel = {read=FLookAndFeel, write=SetLookAndFeel};
	__property bool ParentBackground = {read=FParentBackground, write=SetParentBackground, default=1};
	__property bool WordWrap = {read=FWordWrap, write=SetWordWrap, default=0};
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxRadioButton(HWND ParentWindow) : Stdctrls::TRadioButton(ParentWindow) { }
	#pragma option pop
	
private:
	void *__IcxMouseTrackingCaller;	/* Cxcontrols::IcxMouseTrackingCaller [MouseLeave=MouseTrackingCallerMouseLeave] */
	
public:
	operator IcxMouseTrackingCaller*(void) { return (IcxMouseTrackingCaller*)&__IcxMouseTrackingCaller; }
	
};


class DELPHICLASS TcxRadioGroupButtonViewInfo;
class PASCALIMPLEMENTATION TcxRadioGroupButtonViewInfo : public Cxedit::TcxEditButtonViewInfo 
{
	typedef Cxedit::TcxEditButtonViewInfo inherited;
	
public:
	AnsiString Caption;
	int Column;
	int Row;
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxRadioGroupButtonViewInfo(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxRadioGroupButtonViewInfo(void) : Cxedit::TcxEditButtonViewInfo() { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomRadioGroupViewInfo;
class PASCALIMPLEMENTATION TcxCustomRadioGroupViewInfo : public Cxtextedit::TcxCustomTextEditViewInfo 
{
	typedef Cxtextedit::TcxCustomTextEditViewInfo inherited;
	
protected:
	virtual TMetaClass* __fastcall GetButtonViewInfoClass(void);
	
public:
	Classes::TAlignment Alignment;
	bool IsDesigning;
	int ItemIndex;
	virtual void __fastcall DrawButton(Cxgraphics::TcxCanvas* ACanvas, int AButtonVisibleIndex);
public:
	#pragma option push -w-inl
	/* TcxCustomTextEditViewInfo.Destroy */ inline __fastcall virtual ~TcxCustomRadioGroupViewInfo(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomEditViewInfo.Create */ inline __fastcall virtual TcxCustomRadioGroupViewInfo(void) : Cxtextedit::TcxCustomTextEditViewInfo() { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomRadioGroupViewData;
class DELPHICLASS TcxCustomRadioGroupProperties;
class PASCALIMPLEMENTATION TcxCustomRadioGroupViewData : public Cxedit::TcxCustomEditViewData 
{
	typedef Cxedit::TcxCustomEditViewData inherited;
	
private:
	HIDESBASE TcxCustomRadioGroupProperties* __fastcall GetProperties(void);
	HIDESBASE void __fastcall SetProperties(TcxCustomRadioGroupProperties* Value);
	
protected:
	virtual Cxedit::TcxEditBorderStyle __fastcall GetBorderStyle(Cxcontainer::TcxContainerHotState AEditHotState);
	virtual int __fastcall GetDrawTextFlags(void);
	
public:
	virtual void __fastcall Calculate(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ABounds, const Types::TPoint &P, Cxcontainer::TcxMouseButton Button, Classes::TShiftState Shift, Cxedit::TcxCustomEditViewInfo* AViewInfo, bool AIsMouseEvent);
	virtual void __fastcall CalculateButtonsViewInfo(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ABounds, const Types::TPoint &P, Cxcontainer::TcxMouseButton Button, Classes::TShiftState Shift, Cxedit::TcxCustomEditViewInfo* AViewInfo, bool AIsMouseEvent);
	virtual void __fastcall EditValueToDrawValue(Cxgraphics::TcxCanvas* ACanvas, const Variant &AEditValue, Cxedit::TcxCustomEditViewInfo* AViewInfo);
	virtual Types::TRect __fastcall GetBorderExtent();
	virtual Types::TRect __fastcall GetClientExtent(Cxedit::TcxCustomEditViewInfo* AViewInfo);
	virtual tagSIZE __fastcall GetEditConstantPartSize(Cxgraphics::TcxCanvas* ACanvas, const Cxedit::TcxEditSizeProperties &AEditSizeProperties, tagSIZE &MinContentSize, Cxedit::TcxCustomEditViewInfo* AViewInfo = (Cxedit::TcxCustomEditViewInfo*)(0x0));
	__property TcxCustomRadioGroupProperties* Properties = {read=GetProperties, write=SetProperties};
public:
	#pragma option push -w-inl
	/* TcxCustomEditViewData.Create */ inline __fastcall virtual TcxCustomRadioGroupViewData(Cxedit::TcxCustomEditProperties* AProperties, Cxcontainer::TcxContainerStyle* AStyle, bool AIsInplace) : Cxedit::TcxCustomEditViewData(AProperties, AStyle, AIsInplace) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxCustomRadioGroupViewData(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxRadioGroupItem;
class PASCALIMPLEMENTATION TcxRadioGroupItem : public Classes::TCollectionItem 
{
	typedef Classes::TCollectionItem inherited;
	
private:
	AnsiString FCaption;
	Variant FValue;
	bool __fastcall IsValueStored(void);
	void __fastcall SetCaption(const AnsiString Value);
	void __fastcall SetValue(const Variant &Value);
	
public:
	__fastcall virtual TcxRadioGroupItem(Classes::TCollection* Collection);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	
__published:
	__property AnsiString Caption = {read=FCaption, write=SetCaption};
	__property Variant Value = {read=FValue, write=SetValue, stored=IsValueStored};
public:
	#pragma option push -w-inl
	/* TCollectionItem.Destroy */ inline __fastcall virtual ~TcxRadioGroupItem(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxRadioGroupItems;
class PASCALIMPLEMENTATION TcxRadioGroupItems : public Classes::TOwnedCollection 
{
	typedef Classes::TOwnedCollection inherited;
	
public:
	TcxRadioGroupItem* operator[](int Index) { return Items[Index]; }
	
private:
	HIDESBASE TcxRadioGroupItem* __fastcall GetItem(int Index);
	HIDESBASE void __fastcall SetItem(int Index, TcxRadioGroupItem* Value);
	
protected:
	virtual void __fastcall Update(Classes::TCollectionItem* Item);
	
public:
	__property TcxRadioGroupItem* Items[int Index] = {read=GetItem, write=SetItem/*, default*/};
public:
	#pragma option push -w-inl
	/* TOwnedCollection.Create */ inline __fastcall TcxRadioGroupItems(Classes::TPersistent* AOwner, TMetaClass* ItemClass) : Classes::TOwnedCollection(AOwner, ItemClass) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TCollection.Destroy */ inline __fastcall virtual ~TcxRadioGroupItems(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxRadioGroupStyle;
class PASCALIMPLEMENTATION TcxRadioGroupStyle : public Cxedit::TcxCustomEditStyle 
{
	typedef Cxedit::TcxCustomEditStyle inherited;
	
protected:
	virtual Graphics::TColor __fastcall DefaultColor(void);
	
public:
	virtual void __fastcall RestoreDefaults(void);
public:
	#pragma option push -w-inl
	/* TcxCustomEditStyle.Create */ inline __fastcall virtual TcxRadioGroupStyle(Classes::TPersistent* AOwner, bool ADirectAccessMode) : Cxedit::TcxCustomEditStyle(AOwner, ADirectAccessMode) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxContainerStyle.Destroy */ inline __fastcall virtual ~TcxRadioGroupStyle(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxCustomRadioGroupProperties : public Cxedit::TcxCustomEditProperties 
{
	typedef Cxedit::TcxCustomEditProperties inherited;
	
private:
	int FColumns;
	WideString FDefaultCaption;
	Variant FDefaultValue;
	TcxRadioGroupItems* FItems;
	bool FWordWrap;
	Classes::TLeftRight __fastcall GetAlignment(void);
	bool __fastcall IsDefaultCaptionStored(void);
	bool __fastcall IsDefaultValueStored(void);
	void __fastcall SetAlignment(Classes::TLeftRight Value);
	void __fastcall SetColumns(int Value);
	void __fastcall SetDefaultValue(const Variant &Value);
	void __fastcall SetItems(TcxRadioGroupItems* Value);
	void __fastcall SetWordWrap(bool Value);
	
protected:
	virtual bool __fastcall CompareEditValue(void);
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewDataClass(TMetaClass* vmt);
	virtual bool __fastcall HasDisplayValue(void);
	__property Classes::TLeftRight Alignment = {read=GetAlignment, write=SetAlignment, default=1};
	__property int Columns = {read=FColumns, write=SetColumns, default=1};
	__property WideString DefaultCaption = {read=FDefaultCaption, write=FDefaultCaption, stored=IsDefaultCaptionStored};
	__property Variant DefaultValue = {read=FDefaultValue, write=SetDefaultValue, stored=IsDefaultValueStored};
	__property TcxRadioGroupItems* Items = {read=FItems, write=SetItems};
	__property bool WordWrap = {read=FWordWrap, write=SetWordWrap, default=0};
	
public:
	__fastcall virtual TcxCustomRadioGroupProperties(Classes::TPersistent* AOwner);
	__fastcall virtual ~TcxCustomRadioGroupProperties(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	/* virtual class method */ virtual TMetaClass* __fastcall GetContainerClass(TMetaClass* vmt);
	virtual WideString __fastcall GetDisplayText(const Variant &AEditValue, bool AFullText = false);
	/* virtual class method */ virtual TMetaClass* __fastcall GetStyleClass(TMetaClass* vmt);
	virtual Cxedit::TcxEditSupportedOperations __fastcall GetSupportedOperations(void);
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewInfoClass(TMetaClass* vmt);
	virtual bool __fastcall IsResetEditClass(void);
	virtual void __fastcall PrepareDisplayValue(const Variant &AEditValue, Variant &DisplayValue, bool AEditFocused);
};


class DELPHICLASS TcxRadioGroupProperties;
class PASCALIMPLEMENTATION TcxRadioGroupProperties : public TcxCustomRadioGroupProperties 
{
	typedef TcxCustomRadioGroupProperties inherited;
	
__published:
	__property Columns  = {default=1};
	__property DefaultCaption ;
	__property DefaultValue ;
	__property ImmediatePost  = {default=0};
	__property Items ;
	__property ReadOnly ;
	__property WordWrap  = {default=0};
	__property OnChange ;
	__property OnEditValueChanged ;
public:
	#pragma option push -w-inl
	/* TcxCustomRadioGroupProperties.Create */ inline __fastcall virtual TcxRadioGroupProperties(Classes::TPersistent* AOwner) : TcxCustomRadioGroupProperties(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomRadioGroupProperties.Destroy */ inline __fastcall virtual ~TcxRadioGroupProperties(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomRadioGroupButton;
class DELPHICLASS TcxCustomRadioGroup;
class PASCALIMPLEMENTATION TcxCustomRadioGroupButton : public TcxRadioButton 
{
	typedef TcxRadioButton inherited;
	
private:
	bool FIsClickLocked;
	Cxcontainer::TcxContainer* __fastcall GetControlContainer(void);
	HIDESBASE Controls::TWinControl* __fastcall GetControl(void);
	TcxCustomRadioGroup* __fastcall GetRadioGroup(void);
	MESSAGE void __fastcall WMGetDlgCode(Messages::TWMNoParams &Message);
	HIDESBASE MESSAGE void __fastcall CNCommand(Messages::TWMCommand &Message);
	
protected:
	virtual void __fastcall CorrectTextRect(Types::TRect &R, bool ANativeStyle);
	DYNAMIC void __fastcall DoEnter(void);
	DYNAMIC void __fastcall DoExit(void);
	DYNAMIC bool __fastcall DoMouseWheel(Classes::TShiftState Shift, int WheelDelta, const Types::TPoint &MousePos);
	DYNAMIC void __fastcall DragOver(System::TObject* Source, int X, int Y, Controls::TDragState State, bool &Accept);
	DYNAMIC Menus::TPopupMenu* __fastcall GetPopupMenu(void);
	virtual bool __fastcall IsInplace(void);
	DYNAMIC void __fastcall KeyDown(Word &Key, Classes::TShiftState Shift);
	DYNAMIC void __fastcall KeyPress(char &Key);
	DYNAMIC void __fastcall KeyUp(Word &Key, Classes::TShiftState Shift);
	DYNAMIC void __fastcall MouseDown(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseMove(Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseUp(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall Click(void);
	virtual void __fastcall WndProc(Messages::TMessage &Message);
	__property TcxCustomRadioGroup* RadioGroup = {read=GetRadioGroup};
	
public:
	__fastcall virtual TcxCustomRadioGroupButton(TcxCustomRadioGroup* ARadioGroup);
	__fastcall virtual ~TcxCustomRadioGroupButton(void);
	DYNAMIC void __fastcall DragDrop(System::TObject* Source, int X, int Y);
	DYNAMIC bool __fastcall ExecuteAction(Classes::TBasicAction* Action);
	DYNAMIC bool __fastcall UpdateAction(Classes::TBasicAction* Action);
	DYNAMIC bool __fastcall CanFocus(void);
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomRadioGroupButton(HWND ParentWindow) : TcxRadioButton(ParentWindow) { }
	#pragma option pop
	
private:
	void *__IcxContainerInnerControl;	/* Cxcontainer::IcxContainerInnerControl */
	
public:
	operator IcxContainerInnerControl*(void) { return (IcxContainerInnerControl*)&__IcxContainerInnerControl; }
	
};


typedef TMetaClass*TcxCustomRadioGroupButtonClass;

class DELPHICLASS TcxCustomRadioGroupData;
class PASCALIMPLEMENTATION TcxCustomRadioGroupData : public Cxedit::TcxCustomEditData 
{
	typedef Cxedit::TcxCustomEditData inherited;
	
public:
	int FocusedButton;
public:
	#pragma option push -w-inl
	/* TcxCustomEditData.Create */ inline __fastcall TcxCustomRadioGroupData(Cxedit::TcxCustomEdit* AEdit) : Cxedit::TcxCustomEditData(AEdit) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomEditData.Destroy */ inline __fastcall virtual ~TcxCustomRadioGroupData(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxCustomRadioGroup : public Cxedit::TcxCustomEdit 
{
	typedef Cxedit::TcxCustomEdit inherited;
	
private:
	Classes::TList* FButtons;
	AnsiString FCaption;
	bool FInternalUpdating;
	bool FIsCaptionAssigned;
	int FItemIndex;
	bool FDrawingParentBackground;
	bool FParentBackground;
	TcxRadioButton* __fastcall GetButton(int Index);
	HIDESBASE TcxRadioGroupProperties* __fastcall GetProperties(void);
	HIDESBASE TcxCustomRadioGroupViewInfo* __fastcall GetViewInfo(void);
	void __fastcall ReadCaption(Classes::TReader* Reader);
	void __fastcall SetButtonCount(int Value);
	void __fastcall SetCaption(AnsiString Value);
	void __fastcall SetItemIndex(int Value);
	HIDESBASE void __fastcall SetProperties(TcxRadioGroupProperties* Value);
	void __fastcall WriteCaption(Classes::TWriter* Writer);
	void __fastcall SetParentBackground(bool Value);
	HIDESBASE MESSAGE void __fastcall WMEraseBkgnd(Messages::TWMEraseBkgnd &Message);
	HIDESBASE MESSAGE void __fastcall CMDialogChar(Messages::TWMKey &Message);
	HIDESBASE MESSAGE void __fastcall CMCtl3DChanged(Messages::TMessage &Message);
	MESSAGE void __fastcall CMFocusRadioButton(Messages::TMessage &Message);
	
protected:
	virtual void __fastcall ContainerStyleChanged(System::TObject* Sender);
	DYNAMIC void __fastcall CursorChanged(void);
	virtual void __fastcall DefineProperties(Classes::TFiler* Filer);
	virtual void __fastcall DoEditKeyDown(Word &Key, Classes::TShiftState Shift);
	DYNAMIC void __fastcall EnabledChanged(void);
	DYNAMIC void __fastcall GetChildren(Classes::TGetChildProc Proc, Classes::TComponent* Root);
	virtual TMetaClass* __fastcall GetEditDataClass(void);
	virtual void __fastcall InitializeEditData(void);
	virtual void __fastcall InternalSetEditValue(const Variant &Value, bool AValidateEditValue);
	virtual bool __fastcall IsInternalControl(Controls::TControl* AControl);
	virtual void __fastcall Loaded(void);
	virtual void __fastcall Paint(void);
	virtual void __fastcall PropertiesChanged(System::TObject* Sender);
	virtual void __fastcall ReadState(Classes::TReader* Reader);
	virtual bool __fastcall RefreshContainer(const Types::TPoint &P, Cxcontainer::TcxMouseButton Button, Classes::TShiftState Shift, bool AIsMouseEvent);
	virtual void __fastcall SetDragMode(Controls::TDragMode Value);
	virtual void __fastcall SetName(const AnsiString Value);
	virtual void __fastcall SetSize(void);
	virtual bool __fastcall TabsNeeded(void);
	virtual void __fastcall CreateHandle(void);
	DYNAMIC void __fastcall Resize(void);
	virtual void __fastcall SetDragKind(Controls::TDragKind Value);
	virtual void __fastcall ArrangeButtons(void);
	virtual void __fastcall ButtonClick(System::TObject* Sender);
	int __fastcall GetButtonIndexAt(const Types::TPoint &P);
	virtual TMetaClass* __fastcall GetButtonClass(void);
	virtual void __fastcall UpdateButtons(void);
	__property AnsiString Caption = {read=FCaption, write=SetCaption, stored=false};
	__property TcxRadioGroupProperties* Properties = {read=GetProperties, write=SetProperties};
	__property TabStop  = {default=0};
	__property TcxCustomRadioGroupViewInfo* ViewInfo = {read=GetViewInfo};
	__property bool ParentBackground = {read=FParentBackground, write=SetParentBackground, default=1};
	
public:
	__fastcall virtual TcxCustomRadioGroup(Classes::TComponent* AOwner)/* overload */;
	__fastcall virtual ~TcxCustomRadioGroup(void);
	virtual void __fastcall Activate(Cxedit::TcxCustomEditData* &AEditData);
	virtual void __fastcall ActivateByMouse(Classes::TShiftState Shift, int X, int Y, Cxedit::TcxCustomEditData* &AEditData);
	virtual void __fastcall Clear(void);
	DYNAMIC bool __fastcall Focused(void);
	DYNAMIC void __fastcall FlipChildren(bool AllLevels);
	/* virtual class method */ virtual TMetaClass* __fastcall GetPropertiesClass(TMetaClass* vmt);
	DYNAMIC void __fastcall GetTabOrderList(Classes::TList* List);
	virtual void __fastcall PrepareEditValue(const Variant &ADisplayValue, /* out */ Variant &EditValue, bool AEditFocused);
	__property TcxRadioButton* Buttons[int Index] = {read=GetButton};
	__property int ItemIndex = {read=FItemIndex, write=SetItemIndex, default=-1};
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomRadioGroup(HWND ParentWindow) : Cxedit::TcxCustomEdit(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxRadioGroup;
class PASCALIMPLEMENTATION TcxRadioGroup : public TcxCustomRadioGroup 
{
	typedef TcxCustomRadioGroup inherited;
	
__published:
	__property Align  = {default=0};
	__property Anchors  = {default=3};
	__property Caption ;
	__property Constraints ;
	__property DragMode  = {default=0};
	__property Enabled  = {default=1};
	__property ItemIndex  = {default=-1};
	__property ParentBackground  = {default=1};
	__property ParentBiDiMode  = {default=1};
	__property ParentColor  = {default=1};
	__property ParentCtl3D  = {default=1};
	__property ParentFont  = {default=1};
	__property ParentShowHint  = {default=1};
	__property PopupMenu ;
	__property Properties ;
	__property ShowHint ;
	__property Style ;
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=0};
	__property Visible  = {default=1};
	__property BiDiMode ;
	__property Ctl3D ;
	__property DragCursor  = {default=-12};
	__property DragKind  = {default=0};
	__property OnClick ;
	__property OnDragDrop ;
	__property OnDragOver ;
	__property OnEndDrag ;
	__property OnEnter ;
	__property OnExit ;
	__property OnStartDrag ;
	__property OnContextPopup ;
	__property OnEndDock ;
	__property OnStartDock ;
public:
	#pragma option push -w-inl
	/* TcxCustomRadioGroup.Create */ inline __fastcall virtual TcxRadioGroup(Classes::TComponent* AOwner)/* overload */ : TcxCustomRadioGroup(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomRadioGroup.Destroy */ inline __fastcall virtual ~TcxRadioGroup(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxRadioGroup(HWND ParentWindow) : TcxCustomRadioGroup(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxRadioButtonImageList;
class PASCALIMPLEMENTATION TcxRadioButtonImageList : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	Graphics::TBitmap* FButtonMask;
	Controls::TImageList* FList;
	bool FFilledButtonList[48];
	
protected:
	void __fastcall PrepareButtonImage(int AImageIndex, Cxlookandfeels::TcxLookAndFeelKind ALookAndFeelKind, Cxedit::TcxEditButtonState AButtonState, bool AChecked, bool AFocused, bool AIsDesigning);
	
public:
	__fastcall TcxRadioButtonImageList(void);
	__fastcall virtual ~TcxRadioButtonImageList(void);
	void __fastcall DrawRadioButton(Cxgraphics::TcxCanvas* ACanvas, int X, int Y, Cxlookandfeels::TcxLookAndFeelKind ALookAndFeelKind, Cxedit::TcxEditButtonState AButtonState, bool AChecked, bool AFocused, bool AIsDesigning, Graphics::TColor ABrushColor, bool ATransparent);
	void __fastcall Reset(void);
};


//-- var, const, procedure ---------------------------------------------------
static const Word CM_FOCUSRADIOBUTTON = 0x806a;
static const Shortint FilledRadioButtonListSize = 0x30;
extern PACKAGE TcxRadioButtonImageList* __fastcall GetRadioButtonImageList(void);

}	/* namespace Cxradiogroup */
using namespace Cxradiogroup;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxRadioGroup
