// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxDropDownEdit.pas' rev: 6.00

#ifndef cxDropDownEditHPP
#define cxDropDownEditHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Menus.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <cxVariants.hpp>	// Pascal unit
#include <cxTextEdit.hpp>	// Pascal unit
#include <cxMaskEdit.hpp>	// Pascal unit
#include <cxLookAndFeels.hpp>	// Pascal unit
#include <cxLookAndFeelPainters.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Variants.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxdropdownedit
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TcxEditDropDownListStyle { lsEditFixedList, lsEditList, lsFixedList };
#pragma option pop

#pragma option push -b-
enum TcxEditCorner { ecoTopLeft, ecoTopRight, ecoBottomLeft, ecoBottomRight };
#pragma option pop

#pragma option push -b-
enum TcxEditMouseSizingDirection { mmdWE, mmdNS, mmdNWSE, mmdNESW, mmdNone };
#pragma option pop

class DELPHICLASS TcxCustomEditPopupWindowViewInfo;
class PASCALIMPLEMENTATION TcxCustomEditPopupWindowViewInfo : public Cxcontainer::TcxContainerViewInfo 
{
	typedef Cxcontainer::TcxContainerViewInfo inherited;
	
protected:
	virtual void __fastcall InternalPaint(Cxgraphics::TcxCanvas* ACanvas);
	
public:
	Cxedit::TcxEditPopupBorderStyle BorderStyle;
	bool ClientEdge;
	bool CloseButton;
	#pragma pack(push, 1)
	Types::TRect CloseButtonRect;
	#pragma pack(pop)
	
	Cxlookandfeels::TcxLookAndFeelKind CloseButtonStyle;
	int CloseButtonNativeState;
	Cxlookandfeelpainters::TcxButtonState CloseButtonState;
	int MinSysPanelHeight;
	bool NativeStyle;
	bool Shadow;
	bool Sizeable;
	TcxEditCorner SizeGripCorner;
	#pragma pack(push, 1)
	Types::TRect SizeGripRect;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect SizeGripSizingRect;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect SizingRegionBounds;
	#pragma pack(pop)
	
	int SizingOffset;
	int SysPanelHeight;
	bool SysPanelStyle;
	virtual void __fastcall Calculate(void);
	virtual void __fastcall DrawBorder(Cxgraphics::TcxCanvas* ACanvas, Types::TRect &R);
	virtual Types::TRect __fastcall GetBorderExtent();
	virtual Types::TRect __fastcall GetClientExtent();
	virtual int __fastcall GetSysPanelHeight(void);
	virtual bool __fastcall IsSizingPlace(int X, int Y);
public:
	#pragma option push -w-inl
	/* TcxContainerViewInfo.Create */ inline __fastcall virtual TcxCustomEditPopupWindowViewInfo(void) : Cxcontainer::TcxContainerViewInfo() { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxCustomEditPopupWindowViewInfo(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomEditPopupWindow;
class DELPHICLASS TcxCustomDropDownEdit;
class PASCALIMPLEMENTATION TcxCustomEditPopupWindow : public Cxcontainer::TcxCustomPopupWindow 
{
	typedef Cxcontainer::TcxCustomPopupWindow inherited;
	
private:
	bool FPopupAutoSize;
	Cxedit::TcxEditPopupBorderStyle FBorderStyle;
	bool FClientEdge;
	bool FCloseButton;
	int FMinHeight;
	int FMinWidth;
	bool FNativeStyle;
	int FPopupHeight;
	int FPopupWidth;
	bool FShadow;
	bool FShowContentWhileResize;
	bool FSizeable;
	bool FSysPanelStyle;
	TcxCustomDropDownEdit* __fastcall GetEdit(void);
	int __fastcall GetMinSysPanelHeight(void);
	TcxCustomEditPopupWindowViewInfo* __fastcall GetViewInfo(void);
	void __fastcall SetPopupAutoSize(bool Value);
	HIDESBASE void __fastcall SetBorderStyle(Cxedit::TcxEditPopupBorderStyle Value);
	void __fastcall SetClientEdge(bool Value);
	void __fastcall SetCloseButton(bool Value);
	void __fastcall SetMinSysPanelHeight(int Value);
	void __fastcall SetNativeStyle(bool Value);
	void __fastcall SetShadow(bool Value);
	void __fastcall SetSizeable(bool Value);
	void __fastcall SetSysPanelStyle(bool Value);
	MESSAGE void __fastcall CMPopupControlKey(Messages::TMessage &Message);
	
protected:
	virtual void __fastcall AdjustClientRect(Types::TRect &Rect);
	virtual Types::TPoint __fastcall CalculatePosition();
	virtual void __fastcall CalculateSize(void);
	virtual void __fastcall DoClosed(void);
	virtual void __fastcall DoClosing(void);
	DYNAMIC void __fastcall MouseDown(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseLeave(Controls::TControl* AControl);
	DYNAMIC void __fastcall MouseMove(Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseUp(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall Resize(void);
	virtual void __fastcall CalculateViewInfo(void);
	virtual bool __fastcall CanResize(int &NewWidth, int &NewHeight);
	virtual void __fastcall DoPopupControlKey(char Key);
	void __fastcall DrawSizeFrame(const Types::TRect &R);
	virtual tagSIZE __fastcall GetMinSize();
	void __fastcall InternalInvalidateRect(const Types::TRect &ARect);
	void __fastcall RefreshPopupWindow(void);
	__property TcxCustomEditPopupWindowViewInfo* ViewInfo = {read=GetViewInfo};
	
public:
	__fastcall virtual TcxCustomEditPopupWindow(Controls::TWinControl* AOwnerControl);
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewInfoClass(TMetaClass* vmt);
	__property Cxedit::TcxEditPopupBorderStyle BorderStyle = {read=FBorderStyle, write=SetBorderStyle, nodefault};
	__property bool ClientEdge = {read=FClientEdge, write=SetClientEdge, nodefault};
	__property bool CloseButton = {read=FCloseButton, write=SetCloseButton, nodefault};
	__property TcxCustomDropDownEdit* Edit = {read=GetEdit};
	__property int MinHeight = {read=FMinHeight, write=FMinHeight, nodefault};
	__property tagSIZE MinSize = {read=GetMinSize};
	__property int MinSysPanelHeight = {read=GetMinSysPanelHeight, write=SetMinSysPanelHeight, nodefault};
	__property int MinWidth = {read=FMinWidth, write=FMinWidth, nodefault};
	__property bool NativeStyle = {read=FNativeStyle, write=SetNativeStyle, nodefault};
	__property bool PopupAutoSize = {read=FPopupAutoSize, write=SetPopupAutoSize, nodefault};
	__property int PopupHeight = {read=FPopupHeight, write=FPopupHeight, nodefault};
	__property int PopupWidth = {read=FPopupWidth, write=FPopupWidth, nodefault};
	__property bool Shadow = {read=FShadow, write=SetShadow, nodefault};
	__property bool ShowContentWhileResize = {read=FShowContentWhileResize, write=FShowContentWhileResize, default=0};
	__property bool Sizeable = {read=FSizeable, write=SetSizeable, nodefault};
	__property bool SysPanelStyle = {read=FSysPanelStyle, write=SetSysPanelStyle, nodefault};
	__property OnClosed ;
public:
	#pragma option push -w-inl
	/* TcxCustomPopupWindow.Destroy */ inline __fastcall virtual ~TcxCustomEditPopupWindow(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual TcxCustomEditPopupWindow(Classes::TComponent* AOwner, int Dummy) : Cxcontainer::TcxCustomPopupWindow(AOwner, Dummy) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomEditPopupWindow(HWND ParentWindow) : Cxcontainer::TcxCustomPopupWindow(ParentWindow) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxCustomEditPopupWindowClass;

typedef void __fastcall (__closure *TcxPopupEditPopupEvent)(System::TObject* Sender, const AnsiString AEditText);

class DELPHICLASS TcxCustomDropDownEditProperties;
class PASCALIMPLEMENTATION TcxCustomDropDownEditProperties : public Cxmaskedit::TcxCustomMaskEditProperties 
{
	typedef Cxmaskedit::TcxCustomMaskEditProperties inherited;
	
private:
	int FGlyphButtonIndex;
	bool FImmediateDropDown;
	bool FImmediatePopup;
	bool FInternalChanging;
	Classes::TAlignment FPopupAlignment;
	bool FPopupAutoSize;
	bool FPopupClientEdge;
	int FPopupHeight;
	int FPopupMinHeight;
	int FPopupMinWidth;
	bool FPopupSizeable;
	bool FPopupSysPanelStyle;
	int FPopupWidth;
	Forms::TCloseQueryEvent FOnCloseQuery;
	Classes::TNotifyEvent FOnCloseUp;
	Classes::TNotifyEvent FOnInitPopup;
	Classes::TNotifyEvent FOnPopup;
	Graphics::TBitmap* __fastcall GetButtonGlyph(void);
	void __fastcall SetButtonGlyph(Graphics::TBitmap* Value);
	void __fastcall SetGlyphButtonIndex(int Value);
	void __fastcall SetOnPopup(Classes::TNotifyEvent Value);
	void __fastcall SetPopupAlignment(Classes::TAlignment Value);
	void __fastcall SetPopupClientEdge(bool Value);
	void __fastcall SetPopupHeight(int Value);
	void __fastcall SetPopupMinHeight(int Value);
	void __fastcall SetPopupMinWidth(int Value);
	void __fastcall SetPopupSizeable(bool Value);
	void __fastcall SetPopupSysPanelStyle(bool Value);
	void __fastcall SetPopupWidth(int Value);
	
protected:
	virtual void __fastcall Changed(void);
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewDataClass(TMetaClass* vmt);
	virtual bool __fastcall IsLookupDataVisual(void);
	virtual int __fastcall DropDownButtonVisibleIndex(void);
	virtual bool __fastcall DropDownOnClick(void);
	virtual bool __fastcall GetAlwaysPostEditValue(void);
	/* virtual class method */ virtual TMetaClass* __fastcall GetPopupWindowClass(TMetaClass* vmt);
	virtual bool __fastcall PopupWindowCapturesFocus(void);
	__property bool AlwaysPostEditValue = {read=GetAlwaysPostEditValue, nodefault};
	__property Graphics::TBitmap* ButtonGlyph = {read=GetButtonGlyph, write=SetButtonGlyph};
	__property int GlyphButtonIndex = {read=FGlyphButtonIndex, write=SetGlyphButtonIndex, nodefault};
	__property bool ImmediateDropDown = {read=FImmediateDropDown, write=FImmediateDropDown, default=1};
	__property bool ImmediatePopup = {read=FImmediatePopup, write=FImmediatePopup, default=0};
	__property bool PopupAutoSize = {read=FPopupAutoSize, write=FPopupAutoSize, default=1};
	__property Classes::TAlignment PopupAlignment = {read=FPopupAlignment, write=SetPopupAlignment, default=0};
	__property bool PopupClientEdge = {read=FPopupClientEdge, write=SetPopupClientEdge, default=0};
	__property int PopupHeight = {read=FPopupHeight, write=SetPopupHeight, default=200};
	__property int PopupMinHeight = {read=FPopupMinHeight, write=SetPopupMinHeight, default=100};
	__property int PopupMinWidth = {read=FPopupMinWidth, write=SetPopupMinWidth, default=100};
	__property bool PopupSizeable = {read=FPopupSizeable, write=SetPopupSizeable, default=0};
	__property bool PopupSysPanelStyle = {read=FPopupSysPanelStyle, write=SetPopupSysPanelStyle, default=0};
	__property int PopupWidth = {read=FPopupWidth, write=SetPopupWidth, default=250};
	__property Forms::TCloseQueryEvent OnCloseQuery = {read=FOnCloseQuery, write=FOnCloseQuery};
	__property Classes::TNotifyEvent OnCloseUp = {read=FOnCloseUp, write=FOnCloseUp};
	__property Classes::TNotifyEvent OnInitPopup = {read=FOnInitPopup, write=FOnInitPopup};
	__property Classes::TNotifyEvent OnPopup = {read=FOnPopup, write=SetOnPopup};
	
public:
	__fastcall virtual TcxCustomDropDownEditProperties(Classes::TPersistent* AOwner);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	/* virtual class method */ virtual TMetaClass* __fastcall GetContainerClass(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TcxCustomMaskEditProperties.Destroy */ inline __fastcall virtual ~TcxCustomDropDownEditProperties(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxCustomDropDownEditPropertiesClass;

class DELPHICLASS TcxCustomDropDownEditViewData;
class PASCALIMPLEMENTATION TcxCustomDropDownEditViewData : public Cxtextedit::TcxCustomTextEditViewData 
{
	typedef Cxtextedit::TcxCustomTextEditViewData inherited;
	
private:
	HIDESBASE TcxCustomDropDownEditProperties* __fastcall GetProperties(void);
	
protected:
	virtual bool __fastcall CanPressButton(Cxedit::TcxCustomEditViewInfo* AViewInfo, int AButtonVisibleIndex);
	
public:
	bool HasPopupWindow;
	bool IsHotAndPopup;
	virtual void __fastcall Calculate(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ABounds, const Types::TPoint &P, Cxcontainer::TcxMouseButton Button, Classes::TShiftState Shift, Cxedit::TcxCustomEditViewInfo* AViewInfo, bool AIsMouseEvent);
	__property TcxCustomDropDownEditProperties* Properties = {read=GetProperties};
public:
	#pragma option push -w-inl
	/* TcxCustomEditViewData.Create */ inline __fastcall virtual TcxCustomDropDownEditViewData(Cxedit::TcxCustomEditProperties* AProperties, Cxcontainer::TcxContainerStyle* AStyle, bool AIsInplace) : Cxtextedit::TcxCustomTextEditViewData(AProperties, AStyle, AIsInplace) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxCustomDropDownEditViewData(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomDropDownEditData;
class PASCALIMPLEMENTATION TcxCustomDropDownEditData : public Cxedit::TcxCustomEditData 
{
	typedef Cxedit::TcxCustomEditData inherited;
	
protected:
	bool Initialized;
	int Width;
	int Height;
public:
	#pragma option push -w-inl
	/* TcxCustomEditData.Create */ inline __fastcall TcxCustomDropDownEditData(Cxedit::TcxCustomEdit* AEdit) : Cxedit::TcxCustomEditData(AEdit) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomEditData.Destroy */ inline __fastcall virtual ~TcxCustomDropDownEditData(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxCustomDropDownEditDataClass;

class DELPHICLASS TcxEditPopupControlLookAndFeel;
class PASCALIMPLEMENTATION TcxEditPopupControlLookAndFeel : public Cxlookandfeels::TcxLookAndFeel 
{
	typedef Cxlookandfeels::TcxLookAndFeel inherited;
	
private:
	TcxCustomDropDownEdit* __fastcall GetEdit(void);
	
protected:
	void __fastcall EditStyleChanged(void);
	virtual Cxlookandfeels::TcxLookAndFeelKind __fastcall InternalGetKind(void);
	virtual bool __fastcall InternalGetNativeStyle(void);
	__property TcxCustomDropDownEdit* Edit = {read=GetEdit};
public:
	#pragma option push -w-inl
	/* TcxLookAndFeel.Create */ inline __fastcall virtual TcxEditPopupControlLookAndFeel(Classes::TPersistent* AOwner) : Cxlookandfeels::TcxLookAndFeel(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxLookAndFeel.Destroy */ inline __fastcall virtual ~TcxEditPopupControlLookAndFeel(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomDropDownInnerEdit;
class PASCALIMPLEMENTATION TcxCustomDropDownInnerEdit : public Cxtextedit::TcxCustomInnerTextEdit 
{
	typedef Cxtextedit::TcxCustomInnerTextEdit inherited;
	
private:
	HIDESBASE TcxCustomDropDownEdit* __fastcall GetContainer(void);
	HIDESBASE MESSAGE void __fastcall CMHintShow(Messages::TMessage &Message);
	
protected:
	DYNAMIC void __fastcall KeyUp(Word &Key, Classes::TShiftState Shift);
	__property TcxCustomDropDownEdit* Container = {read=GetContainer};
public:
	#pragma option push -w-inl
	/* TcxCustomInnerTextEdit.Create */ inline __fastcall virtual TcxCustomDropDownInnerEdit(Classes::TComponent* AOwner) : Cxtextedit::TcxCustomInnerTextEdit(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomInnerTextEdit.Destroy */ inline __fastcall virtual ~TcxCustomDropDownInnerEdit(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomDropDownInnerEdit(HWND ParentWindow) : Cxtextedit::TcxCustomInnerTextEdit(ParentWindow) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxCustomDropDownEdit : public Cxmaskedit::TcxCustomMaskEdit 
{
	typedef Cxmaskedit::TcxCustomMaskEdit inherited;
	
private:
	bool FIsActivatingByMouse;
	bool FIsHotAndPopup;
	TcxEditPopupControlLookAndFeel* FPopupControlLookAndFeel;
	bool FPopupMouseMoveLocked;
	bool FPopupSizeChanged;
	bool FSendChildrenStyle;
	bool __fastcall GetDroppedDown(void);
	HIDESBASE TcxCustomDropDownEditProperties* __fastcall GetProperties(void);
	void __fastcall SetDroppedDown(bool Value);
	HIDESBASE void __fastcall SetProperties(TcxCustomDropDownEditProperties* Value);
	HIDESBASE MESSAGE void __fastcall CMBiDiModeChanged(Messages::TMessage &Message);
	MESSAGE void __fastcall CMDropDown(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMHintShow(Messages::TMessage &Message);
	
protected:
	TcxCustomEditPopupWindow* FPopupWindow;
	virtual void __fastcall ContainerStyleChanged(System::TObject* Sender);
	virtual Cxedit::TcxCustomEditViewData* __fastcall CreateViewData(void);
	virtual void __fastcall DoButtonDown(int AButtonVisibleIndex);
	DYNAMIC void __fastcall DoExit(void);
	virtual void __fastcall DoEditKeyDown(Word &Key, Classes::TShiftState Shift);
	virtual void __fastcall DoEditKeyPress(char &Key);
	DYNAMIC bool __fastcall DoMouseWheel(Classes::TShiftState Shift, int WheelDelta, const Types::TPoint &MousePos);
	virtual TMetaClass* __fastcall GetEditDataClass(void);
	virtual TMetaClass* __fastcall GetInnerEditClass(void);
	virtual bool __fastcall GetScrollLookupDataList(Cxtextedit::TcxEditScrollCause AScrollCause);
	virtual void __fastcall InitializeEditData(void);
	virtual bool __fastcall IsEditorKey(Word Key, Classes::TShiftState Shift);
	virtual void __fastcall PropertiesChanged(System::TObject* Sender);
	DYNAMIC void __fastcall MouseDown(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	virtual bool __fastcall RefreshContainer(const Types::TPoint &P, Cxcontainer::TcxMouseButton Button, Classes::TShiftState Shift, bool AIsMouseEvent);
	virtual bool __fastcall SendActivationKey(char Key);
	virtual void __fastcall CreateHandle(void);
	virtual void __fastcall ThemeChanged(void);
	virtual bool __fastcall CanDropDown(void);
	virtual void __fastcall CloseUp(bool AAccept);
	virtual void __fastcall CreatePopupWindow(void);
	void __fastcall DoCloseQuery(bool &CanClose);
	void __fastcall DoCloseUp(void);
	virtual void __fastcall DoInitPopup(void);
	virtual void __fastcall DoPopup(void);
	virtual void __fastcall DropDown(void);
	virtual void __fastcall EditButtonClick(void);
	virtual Controls::TWinControl* __fastcall GetPopupFocusedControl(void);
	virtual tagSIZE __fastcall GetPopupWindowClientPreferredSize(void) = 0 ;
	Types::TRect __fastcall GetPopupWindowOwnerControlBounds();
	virtual void __fastcall InitializeLookupData(void);
	virtual void __fastcall InitializePopupWindow(void);
	DYNAMIC void __fastcall PopupWindowClosed(System::TObject* Sender);
	DYNAMIC void __fastcall PopupWindowCloseQuery(System::TObject* Sender, bool &CanClose);
	DYNAMIC void __fastcall PopupWindowClosing(System::TObject* Sender);
	DYNAMIC void __fastcall PopupWindowShowing(System::TObject* Sender);
	DYNAMIC void __fastcall PopupWindowShowed(System::TObject* Sender);
	virtual void __fastcall PositionPopupWindowChilds(const Types::TRect &AClientRect);
	void __fastcall SetIsHotAndPopup(void);
	virtual void __fastcall SetupPopupWindow(void);
	void __fastcall UpdatePopupWindow(void);
	__property bool IsHotAndPopup = {read=FIsHotAndPopup, nodefault};
	__property TcxEditPopupControlLookAndFeel* PopupControlsLookAndFeel = {read=FPopupControlLookAndFeel};
	__property bool PopupMouseMoveLocked = {read=FPopupMouseMoveLocked, write=FPopupMouseMoveLocked, nodefault};
	__property bool PopupSizeChanged = {read=FPopupSizeChanged, nodefault};
	__property TcxCustomEditPopupWindow* PopupWindow = {read=FPopupWindow};
	__property TcxCustomDropDownEditProperties* Properties = {read=GetProperties, write=SetProperties};
	__property bool SendChildrenStyle = {read=FSendChildrenStyle, write=FSendChildrenStyle, nodefault};
	
public:
	__fastcall virtual TcxCustomDropDownEdit(Classes::TComponent* AOwner)/* overload */;
	__fastcall virtual ~TcxCustomDropDownEdit(void);
	virtual void __fastcall Activate(Cxedit::TcxCustomEditData* &AEditData);
	virtual void __fastcall ActivateByKey(char Key, Cxedit::TcxCustomEditData* &AEditData);
	virtual void __fastcall ActivateByMouse(Classes::TShiftState Shift, int X, int Y, Cxedit::TcxCustomEditData* &AEditData);
	virtual void __fastcall BeforeDestruction(void);
	virtual bool __fastcall Deactivate(void);
	DYNAMIC bool __fastcall Focused(void);
	/* virtual class method */ virtual TMetaClass* __fastcall GetPropertiesClass(TMetaClass* vmt);
	/* virtual class method */ virtual Cxcontainer::TcxContainerStyleValues __fastcall GetNotPublishedStyleValues(TMetaClass* vmt);
	virtual bool __fastcall HasPopupWindow(void);
	__property bool DroppedDown = {read=GetDroppedDown, write=SetDroppedDown, nodefault};
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomDropDownEdit(HWND ParentWindow) : Cxmaskedit::TcxCustomMaskEdit(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxComboBoxPopupWindow;
class PASCALIMPLEMENTATION TcxComboBoxPopupWindow : public TcxCustomEditPopupWindow 
{
	typedef TcxCustomEditPopupWindow inherited;
	
protected:
	virtual void __fastcall CalculateSize(void);
public:
	#pragma option push -w-inl
	/* TcxCustomEditPopupWindow.Create */ inline __fastcall virtual TcxComboBoxPopupWindow(Controls::TWinControl* AOwnerControl) : TcxCustomEditPopupWindow(AOwnerControl) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomPopupWindow.Destroy */ inline __fastcall virtual ~TcxComboBoxPopupWindow(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual TcxComboBoxPopupWindow(Classes::TComponent* AOwner, int Dummy) : TcxCustomEditPopupWindow(AOwner, Dummy) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxComboBoxPopupWindow(HWND ParentWindow) : TcxCustomEditPopupWindow(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxComboBoxListBox;
class DELPHICLASS TcxCustomComboBox;
class PASCALIMPLEMENTATION TcxComboBoxListBox : public Cxtextedit::TcxCustomEditListBox 
{
	typedef Cxtextedit::TcxCustomEditListBox inherited;
	
private:
	bool FIsFirstWindowRecreation;
	bool FPrevIsOnMeasureItemAssigned;
	int FPrevItemHeight;
	TcxCustomComboBox* __fastcall GetEdit(void);
	
protected:
	TcxCustomComboBox* FEdit;
	virtual bool __fastcall DoDrawItem(int AIndex, const Types::TRect &ARect, Windows::TOwnerDrawState AState);
	virtual int __fastcall GetHeight(int ARowCount, int AMaxHeight);
	virtual AnsiString __fastcall GetItem(int Index);
	virtual int __fastcall GetItemHeight(int AIndex = 0xffffffff);
	DYNAMIC void __fastcall MouseMove(Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseUp(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall RecreateWindow(void);
	virtual void __fastcall SetItemIndex(const int Value)/* overload */;
	virtual void __fastcall MeasureItem(int Index, int &Height);
	DYNAMIC void __fastcall Resize(void);
	__property TcxCustomComboBox* Edit = {read=GetEdit};
	
public:
	__fastcall virtual TcxComboBoxListBox(Classes::TComponent* AOwner);
public:
	#pragma option push -w-inl
	/* TcxCustomInnerListBox.Destroy */ inline __fastcall virtual ~TcxComboBoxListBox(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxComboBoxListBox(HWND ParentWindow) : Cxtextedit::TcxCustomEditListBox(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxComboBoxLookupData;
class PASCALIMPLEMENTATION TcxComboBoxLookupData : public Cxtextedit::TcxCustomTextEditLookupData 
{
	typedef Cxtextedit::TcxCustomTextEditLookupData inherited;
	
protected:
	virtual TMetaClass* __fastcall GetListBoxClass(void);
	virtual void __fastcall ListChanged(void);
	
public:
	virtual bool __fastcall CanResizeVisualArea(tagSIZE &NewSize);
	virtual tagSIZE __fastcall GetVisualAreaPreferredSize(int AMaxHeight, int AWidth = 0x0);
	virtual void __fastcall Initialize(Controls::TWinControl* AVisualControlsParent);
public:
	#pragma option push -w-inl
	/* TcxCustomTextEditLookupData.Create */ inline __fastcall virtual TcxComboBoxLookupData(Classes::TPersistent* AOwner) : Cxtextedit::TcxCustomTextEditLookupData(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxComboBoxLookupData(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomComboBoxViewData;
class PASCALIMPLEMENTATION TcxCustomComboBoxViewData : public TcxCustomDropDownEditViewData 
{
	typedef TcxCustomDropDownEditViewData inherited;
	
__published:
	virtual bool __fastcall IsComboBoxStyle(void);
public:
	#pragma option push -w-inl
	/* TcxCustomEditViewData.Create */ inline __fastcall virtual TcxCustomComboBoxViewData(Cxedit::TcxCustomEditProperties* AProperties, Cxcontainer::TcxContainerStyle* AStyle, bool AIsInplace) : TcxCustomDropDownEditViewData(AProperties, AStyle, AIsInplace) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxCustomComboBoxViewData(void) { }
	#pragma option pop
	
};


typedef void __fastcall (__closure *TcxEditDrawItemEvent)(TcxCustomComboBox* AControl, Cxgraphics::TcxCanvas* ACanvas, int AIndex, const Types::TRect &ARect, Windows::TOwnerDrawState AState);

typedef void __fastcall (__closure *TMeasureItemEvent)(TcxCustomComboBox* AControl, int AIndex, Cxgraphics::TcxCanvas* ACanvas, int &AHeight);

class DELPHICLASS TcxCustomComboBoxProperties;
class PASCALIMPLEMENTATION TcxCustomComboBoxProperties : public TcxCustomDropDownEditProperties 
{
	typedef TcxCustomDropDownEditProperties inherited;
	
private:
	TcxEditDropDownListStyle FDropDownListStyle;
	int FDropDownRows;
	int FItemHeight;
	bool FRevertable;
	TcxEditDrawItemEvent FOnDrawItem;
	TMeasureItemEvent FOnMeasureItem;
	bool __fastcall GetDropDownAutoWidth(void);
	bool __fastcall GetDropDownSizeable(void);
	int __fastcall GetDropDownWidth(void);
	Classes::TStrings* __fastcall GetItems(void);
	bool __fastcall GetSorted(void);
	void __fastcall SetDropDownAutoWidth(bool Value);
	void __fastcall SetDropDownListStyle(TcxEditDropDownListStyle Value);
	void __fastcall SetDropDownRows(int Value);
	void __fastcall SetDropDownSizeable(bool Value);
	void __fastcall SetDropDownWidth(int Value);
	void __fastcall SetItemHeight(int Value);
	void __fastcall SetItems(Classes::TStrings* Value);
	void __fastcall SetSorted(bool Value);
	
protected:
	virtual bool __fastcall DropDownOnClick(void);
	virtual int __fastcall GetDropDownPageRowCount(void);
	virtual Cxedit::TcxEditEditingStyle __fastcall GetEditingStyle(void);
	/* virtual class method */ virtual TMetaClass* __fastcall GetPopupWindowClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewDataClass(TMetaClass* vmt);
	virtual bool __fastcall UseLookupData(void);
	__property bool DropDownAutoWidth = {read=GetDropDownAutoWidth, write=SetDropDownAutoWidth, default=1};
	__property TcxEditDropDownListStyle DropDownListStyle = {read=FDropDownListStyle, write=SetDropDownListStyle, default=1};
	__property int DropDownRows = {read=FDropDownRows, write=SetDropDownRows, default=8};
	__property bool DropDownSizeable = {read=GetDropDownSizeable, write=SetDropDownSizeable, default=0};
	__property int DropDownWidth = {read=GetDropDownWidth, write=SetDropDownWidth, default=0};
	__property int ItemHeight = {read=FItemHeight, write=SetItemHeight, default=0};
	__property Classes::TStrings* Items = {read=GetItems, write=SetItems};
	__property bool Revertable = {read=FRevertable, write=FRevertable, default=0};
	__property bool Sorted = {read=GetSorted, write=SetSorted, default=0};
	__property TcxEditDrawItemEvent OnDrawItem = {read=FOnDrawItem, write=FOnDrawItem};
	__property TMeasureItemEvent OnMeasureItem = {read=FOnMeasureItem, write=FOnMeasureItem};
	
public:
	__fastcall virtual TcxCustomComboBoxProperties(Classes::TPersistent* AOwner);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	/* virtual class method */ virtual TMetaClass* __fastcall GetContainerClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall GetLookupDataClass(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TcxCustomMaskEditProperties.Destroy */ inline __fastcall virtual ~TcxCustomComboBoxProperties(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxComboBoxProperties;
class PASCALIMPLEMENTATION TcxComboBoxProperties : public TcxCustomComboBoxProperties 
{
	typedef TcxCustomComboBoxProperties inherited;
	
__published:
	__property Alignment ;
	__property AutoSelect  = {default=1};
	__property BeepOnError  = {default=0};
	__property ButtonGlyph ;
	__property CaseInsensitive  = {default=1};
	__property CharCase  = {default=0};
	__property DropDownAutoWidth  = {default=1};
	__property DropDownListStyle  = {default=1};
	__property DropDownRows  = {default=8};
	__property DropDownSizeable  = {default=0};
	__property DropDownWidth  = {default=0};
	__property EchoMode  = {default=0};
	__property HideSelection  = {default=1};
	__property IgnoreMaskBlank  = {default=0};
	__property ImmediateDropDown  = {default=1};
	__property ImmediatePost  = {default=0};
	__property ImmediateUpdateText  = {default=0};
	__property ItemHeight  = {default=0};
	__property Items ;
	__property MaskKind  = {default=0};
	__property EditMask ;
	__property MaxLength ;
	__property OEMConvert  = {default=0};
	__property PopupAlignment  = {default=0};
	__property ReadOnly ;
	__property Revertable  = {default=0};
	__property Sorted  = {default=0};
	__property UseLeftAlignmentOnEditing ;
	__property ValidateOnEnter  = {default=1};
	__property OnChange ;
	__property OnCloseUp ;
	__property OnDrawItem ;
	__property OnEditValueChanged ;
	__property OnInitPopup ;
	__property OnMeasureItem ;
	__property OnNewLookupDisplayText ;
	__property OnPopup ;
	__property OnValidate ;
public:
	#pragma option push -w-inl
	/* TcxCustomComboBoxProperties.Create */ inline __fastcall virtual TcxComboBoxProperties(Classes::TPersistent* AOwner) : TcxCustomComboBoxProperties(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomMaskEditProperties.Destroy */ inline __fastcall virtual ~TcxComboBoxProperties(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomComboBoxInnerEdit;
class PASCALIMPLEMENTATION TcxCustomComboBoxInnerEdit : public TcxCustomDropDownInnerEdit 
{
	typedef TcxCustomDropDownInnerEdit inherited;
	
private:
	HIDESBASE MESSAGE void __fastcall WMLButtonUp(Messages::TWMMouse &Message);
public:
	#pragma option push -w-inl
	/* TcxCustomInnerTextEdit.Create */ inline __fastcall virtual TcxCustomComboBoxInnerEdit(Classes::TComponent* AOwner) : TcxCustomDropDownInnerEdit(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomInnerTextEdit.Destroy */ inline __fastcall virtual ~TcxCustomComboBoxInnerEdit(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomComboBoxInnerEdit(HWND ParentWindow) : TcxCustomDropDownInnerEdit(ParentWindow) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxCustomComboBox : public TcxCustomDropDownEdit 
{
	typedef TcxCustomDropDownEdit inherited;
	
private:
	int __fastcall GetItemIndex(void);
	HIDESBASE TcxComboBoxLookupData* __fastcall GetLookupData(void);
	HIDESBASE TcxComboBoxProperties* __fastcall GetProperties(void);
	void __fastcall SetItemIndex(int Value);
	HIDESBASE void __fastcall SetProperties(TcxComboBoxProperties* Value);
	HIDESBASE MESSAGE void __fastcall WMLButtonUp(Messages::TWMMouse &Message);
	
protected:
	virtual bool __fastcall CanDropDown(void);
	virtual void __fastcall ChangeHandler(System::TObject* Sender);
	DYNAMIC void __fastcall DblClick(void);
	virtual TMetaClass* __fastcall GetInnerEditClass(void);
	virtual tagSIZE __fastcall GetPopupWindowClientPreferredSize();
	virtual void __fastcall InitializePopupWindow(void);
	DYNAMIC void __fastcall MouseMove(Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall PopupWindowShowed(System::TObject* Sender);
	void __fastcall ResetPopupHeight(void);
	void __fastcall SynchronizeItemIndex(void);
	__property int ItemIndex = {read=GetItemIndex, write=SetItemIndex, nodefault};
	__property TcxComboBoxLookupData* LookupData = {read=GetLookupData};
	__property TcxComboBoxProperties* Properties = {read=GetProperties, write=SetProperties};
	
public:
	__fastcall virtual TcxCustomComboBox(Classes::TComponent* AOwner)/* overload */;
	virtual void __fastcall Activate(Cxedit::TcxCustomEditData* &AEditData);
	/* virtual class method */ virtual TMetaClass* __fastcall GetPropertiesClass(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TcxCustomDropDownEdit.Destroy */ inline __fastcall virtual ~TcxCustomComboBox(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomComboBox(HWND ParentWindow) : TcxCustomDropDownEdit(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxComboBox;
class PASCALIMPLEMENTATION TcxComboBox : public TcxCustomComboBox 
{
	typedef TcxCustomComboBox inherited;
	
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
	__property OnContextPopup ;
	__property OnDblClick ;
	__property OnDragDrop ;
	__property OnDragOver ;
	__property OnEditing ;
	__property OnEndDock ;
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
	__property OnStartDock ;
	__property OnStartDrag ;
public:
	#pragma option push -w-inl
	/* TcxCustomComboBox.Create */ inline __fastcall virtual TcxComboBox(Classes::TComponent* AOwner)/* overload */ : TcxCustomComboBox(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomDropDownEdit.Destroy */ inline __fastcall virtual ~TcxComboBox(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxComboBox(HWND ParentWindow) : TcxCustomComboBox(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxPopupEditPopupWindowViewInfo;
class PASCALIMPLEMENTATION TcxPopupEditPopupWindowViewInfo : public TcxCustomEditPopupWindowViewInfo 
{
	typedef TcxCustomEditPopupWindowViewInfo inherited;
	
public:
	virtual void __fastcall DrawBorder(Cxgraphics::TcxCanvas* ACanvas, Types::TRect &R);
public:
	#pragma option push -w-inl
	/* TcxContainerViewInfo.Create */ inline __fastcall virtual TcxPopupEditPopupWindowViewInfo(void) : TcxCustomEditPopupWindowViewInfo() { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxPopupEditPopupWindowViewInfo(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxPopupEditPopupWindow;
class PASCALIMPLEMENTATION TcxPopupEditPopupWindow : public TcxCustomEditPopupWindow 
{
	typedef TcxCustomEditPopupWindow inherited;
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewInfoClass(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TcxCustomEditPopupWindow.Create */ inline __fastcall virtual TcxPopupEditPopupWindow(Controls::TWinControl* AOwnerControl) : TcxCustomEditPopupWindow(AOwnerControl) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomPopupWindow.Destroy */ inline __fastcall virtual ~TcxPopupEditPopupWindow(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual TcxPopupEditPopupWindow(Classes::TComponent* AOwner, int Dummy) : TcxCustomEditPopupWindow(AOwner, Dummy) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxPopupEditPopupWindow(HWND ParentWindow) : TcxCustomEditPopupWindow(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomPopupEditProperties;
class PASCALIMPLEMENTATION TcxCustomPopupEditProperties : public TcxCustomDropDownEditProperties 
{
	typedef TcxCustomDropDownEditProperties inherited;
	
private:
	Controls::TControl* FPopupControl;
	void __fastcall SetPopupControl(Controls::TControl* Value);
	
protected:
	virtual void __fastcall FreeNotification(Classes::TComponent* Sender);
	/* virtual class method */ virtual TMetaClass* __fastcall GetPopupWindowClass(TMetaClass* vmt);
	virtual bool __fastcall IsLookupDataVisual(void);
	virtual bool __fastcall PopupWindowCapturesFocus(void);
	__property Controls::TControl* PopupControl = {read=FPopupControl, write=SetPopupControl};
	__property PopupSizeable  = {default=1};
	
public:
	__fastcall virtual TcxCustomPopupEditProperties(Classes::TPersistent* AOwner);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	/* virtual class method */ virtual TMetaClass* __fastcall GetContainerClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall GetLookupDataClass(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TcxCustomMaskEditProperties.Destroy */ inline __fastcall virtual ~TcxCustomPopupEditProperties(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxPopupEditProperties;
class PASCALIMPLEMENTATION TcxPopupEditProperties : public TcxCustomPopupEditProperties 
{
	typedef TcxCustomPopupEditProperties inherited;
	
public:
	__fastcall virtual TcxPopupEditProperties(Classes::TPersistent* AOwner);
	
__published:
	__property Alignment ;
	__property AutoSelect  = {default=1};
	__property BeepOnError  = {default=0};
	__property ButtonGlyph ;
	__property CaseInsensitive  = {default=1};
	__property CharCase  = {default=0};
	__property EchoMode  = {default=0};
	__property HideSelection  = {default=1};
	__property IgnoreMaskBlank  = {default=0};
	__property ImmediateDropDown  = {default=1};
	__property ImmediatePopup  = {default=1};
	__property LookupItems ;
	__property LookupItemsSorted  = {default=0};
	__property MaxLength ;
	__property MaskKind  = {default=0};
	__property EditMask ;
	__property OEMConvert  = {default=0};
	__property PopupAlignment  = {default=0};
	__property PopupAutoSize  = {default=1};
	__property PopupClientEdge  = {default=0};
	__property PopupControl ;
	__property PopupHeight  = {default=200};
	__property PopupMinHeight  = {default=100};
	__property PopupMinWidth  = {default=100};
	__property PopupSizeable  = {default=1};
	__property PopupSysPanelStyle  = {default=0};
	__property PopupWidth  = {default=250};
	__property ReadOnly ;
	__property UseLeftAlignmentOnEditing ;
	__property ValidateOnEnter  = {default=1};
	__property OnChange ;
	__property OnCloseQuery ;
	__property OnCloseUp ;
	__property OnEditValueChanged ;
	__property OnInitPopup ;
	__property OnPopup ;
	__property OnValidate ;
public:
	#pragma option push -w-inl
	/* TcxCustomMaskEditProperties.Destroy */ inline __fastcall virtual ~TcxPopupEditProperties(void) { }
	#pragma option pop
	
};


#pragma pack(push, 4)
struct TcxPrevPopupControlData
{
	Controls::TAlign Align;
	Types::TRect Bounds;
	Controls::TWinControl* Parent;
	bool Visible;
	Forms::TFormBorderStyle BorderStyle;
} ;
#pragma pack(pop)

class DELPHICLASS TcxCustomPopupEdit;
class PASCALIMPLEMENTATION TcxCustomPopupEdit : public TcxCustomDropDownEdit 
{
	typedef TcxCustomDropDownEdit inherited;
	
private:
	TcxPrevPopupControlData FPrevPopupControlData;
	HIDESBASE TcxPopupEditProperties* __fastcall GetProperties(void);
	HIDESBASE void __fastcall SetProperties(TcxPopupEditProperties* Value);
	
protected:
	virtual bool __fastcall CanDropDown(void);
	virtual void __fastcall DoInitPopup(void);
	virtual Controls::TWinControl* __fastcall GetPopupFocusedControl(void);
	virtual tagSIZE __fastcall GetPopupWindowClientPreferredSize();
	DYNAMIC void __fastcall PopupWindowClosed(System::TObject* Sender);
	virtual void __fastcall PositionPopupWindowChilds(const Types::TRect &AClientRect);
	virtual void __fastcall SetupPopupWindow(void);
	virtual void __fastcall RestorePopupControlData(void);
	virtual void __fastcall SavePopupControlData(void);
	__property TcxPopupEditProperties* Properties = {read=GetProperties, write=SetProperties};
	
public:
	__fastcall virtual ~TcxCustomPopupEdit(void);
	/* virtual class method */ virtual TMetaClass* __fastcall GetPropertiesClass(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TcxCustomDropDownEdit.Create */ inline __fastcall virtual TcxCustomPopupEdit(Classes::TComponent* AOwner)/* overload */ : TcxCustomDropDownEdit(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomPopupEdit(HWND ParentWindow) : TcxCustomDropDownEdit(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxPopupEdit;
class PASCALIMPLEMENTATION TcxPopupEdit : public TcxCustomPopupEdit 
{
	typedef TcxCustomPopupEdit inherited;
	
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
	/* TcxCustomPopupEdit.Destroy */ inline __fastcall virtual ~TcxPopupEdit(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomDropDownEdit.Create */ inline __fastcall virtual TcxPopupEdit(Classes::TComponent* AOwner)/* overload */ : TcxCustomPopupEdit(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxPopupEdit(HWND ParentWindow) : TcxCustomPopupEdit(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
static const Word CM_DROPDOWN = 0x8067;
static const Word CM_POPUPCONTROLKEY = 0x806b;

}	/* namespace Cxdropdownedit */
using namespace Cxdropdownedit;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxDropDownEdit
