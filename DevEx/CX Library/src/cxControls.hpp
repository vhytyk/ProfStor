// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxControls.pas' rev: 6.00

#ifndef cxControlsHPP
#define cxControlsHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxLookAndFeelPainters.hpp>	// Pascal unit
#include <cxLookAndFeels.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <cxScrollBar.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxcontrols
{
//-- type declarations -------------------------------------------------------
typedef HWND TcxHandle;

#pragma option push -b-
enum TcxDragDetect { ddNone, ddDrag, ddCancel };
#pragma option pop

typedef TMetaClass*TDragControlObjectClass;

__interface IcxMouseCaptureObject;
typedef System::DelphiInterface<IcxMouseCaptureObject> _di_IcxMouseCaptureObject;
__interface INTERFACE_UUID("{ACB73657-6066-4564-9A3D-D4D0273AA82F}") IcxMouseCaptureObject  : public IInterface 
{
	
public:
	virtual void __fastcall DoCancelMode(void) = 0 ;
};

__interface IcxMouseTrackingCaller;
typedef System::DelphiInterface<IcxMouseTrackingCaller> _di_IcxMouseTrackingCaller;
__interface INTERFACE_UUID("{84A4BCBE-E001-4D60-B7A6-75E2B0DCD3E9}") IcxMouseTrackingCaller  : public IInterface 
{
	
public:
	virtual void __fastcall MouseLeave(void) = 0 ;
};

__interface IcxCompoundControl;
typedef System::DelphiInterface<IcxCompoundControl> _di_IcxCompoundControl;
__interface INTERFACE_UUID("{A4A77F28-1D03-425B-9A83-0B853B5D8DEF}") IcxCompoundControl  : public IInterface 
{
	
public:
	virtual Controls::TWinControl* __fastcall GetActiveControl(void) = 0 ;
	__property Controls::TWinControl* ActiveControl = {read=GetActiveControl};
};

class DELPHICLASS TcxControlChildComponent;
class DELPHICLASS TcxControl;
#pragma option push -b-
enum TcxControlBorderStyle { cxcbsNone, cxcbsDefault };
#pragma option pop

class DELPHICLASS TcxDragAndDropObject;
class PASCALIMPLEMENTATION TcxDragAndDropObject : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	Cxgraphics::TcxCanvas* FCanvas;
	TcxControl* FControl;
	bool FDirty;
	void __fastcall SetDirty(bool Value);
	
protected:
	void __fastcall ChangeMousePos(const Types::TPoint &P);
	virtual void __fastcall DirtyChanged(void);
	virtual Controls::TCursor __fastcall GetDragAndDropCursor(bool Accepted);
	virtual bool __fastcall GetImmediateStart(void);
	virtual void __fastcall AfterDragAndDrop(bool Accepted);
	virtual void __fastcall BeginDragAndDrop(void);
	virtual void __fastcall DragAndDrop(const Types::TPoint &P, bool &Accepted);
	virtual void __fastcall EndDragAndDrop(bool Accepted);
	__property Cxgraphics::TcxCanvas* Canvas = {read=FCanvas, write=FCanvas};
	__property TcxControl* Control = {read=FControl};
	__property bool Dirty = {read=FDirty, write=SetDirty, nodefault};
	
public:
	#pragma pack(push, 1)
	Types::TPoint CurMousePos;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TPoint PrevMousePos;
	#pragma pack(pop)
	
	__fastcall virtual TcxDragAndDropObject(TcxControl* AControl);
	void __fastcall DoBeginDragAndDrop(void);
	void __fastcall DoDragAndDrop(const Types::TPoint &P, bool &Accepted);
	void __fastcall DoEndDragAndDrop(bool Accepted);
	__property bool ImmediateStart = {read=GetImmediateStart, nodefault};
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxDragAndDropObject(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxDragAndDropObjectClass;

#pragma option push -b-
enum TcxDragAndDropState { ddsNone, ddsStarting, ddsInProcess };
#pragma option pop

class DELPHICLASS TcxControlScrollBar;
#pragma pack(push, 4)
struct TcxScrollBarData
{
	int Min;
	int Max;
	int Position;
	int PageSize;
	Forms::TScrollBarInc SmallChange;
	Forms::TScrollBarInc LargeChange;
	bool Enabled;
	bool Visible;
	bool AllowShow;
	bool AllowHide;
} ;
#pragma pack(pop)

class PASCALIMPLEMENTATION TcxControlScrollBar : public Cxscrollbar::TcxScrollBar 
{
	typedef Cxscrollbar::TcxScrollBar inherited;
	
private:
	bool __fastcall GetVisible(void);
	HIDESBASE void __fastcall SetVisible(bool Value);
	HIDESBASE MESSAGE void __fastcall CMDesignHitTest(Messages::TWMMouse &Message);
	
protected:
	virtual void __fastcall WndProc(Messages::TMessage &Message);
	virtual void __fastcall FocusParent(void);
	
public:
	TcxScrollBarData Data;
	__fastcall virtual TcxControlScrollBar(Classes::TComponent* AOwner);
	void __fastcall ApplyData(void);
	__property bool Visible = {read=GetVisible, write=SetVisible, nodefault};
public:
	#pragma option push -w-inl
	/* TcxScrollBar.Destroy */ inline __fastcall virtual ~TcxControlScrollBar(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxControlScrollBar(HWND ParentWindow) : Cxscrollbar::TcxScrollBar(ParentWindow) { }
	#pragma option pop
	
};


#pragma option push -b-
enum TcxKey { kAll, kArrows, kChars, kTab };
#pragma option pop

typedef Set<TcxKey, kAll, kTab>  TcxKeys;

class DELPHICLASS TcxSizeGrip;
class PASCALIMPLEMENTATION TcxSizeGrip : public Controls::TCustomControl 
{
	typedef Controls::TCustomControl inherited;
	
protected:
	virtual void __fastcall Paint(void);
	
public:
	__fastcall virtual TcxSizeGrip(Classes::TComponent* AOwner);
public:
	#pragma option push -w-inl
	/* TCustomControl.Destroy */ inline __fastcall virtual ~TcxSizeGrip(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxSizeGrip(HWND ParentWindow) : Controls::TCustomControl(ParentWindow) { }
	#pragma option pop
	
};


#pragma option push -b-
enum TcxMouseWheelScrollingKind { mwskNone, mwskHorizontal, mwskVertical };
#pragma option pop

class PASCALIMPLEMENTATION TcxControl : public Controls::TCustomControl 
{
	typedef Controls::TCustomControl inherited;
	
private:
	Cxgraphics::TcxCanvas* FActiveCanvas;
	TcxControlBorderStyle FBorderStyle;
	bool FCalculatingScrollBarsParams;
	Cxgraphics::TcxCanvas* FCanvas;
	Controls::TCursor FDefaultCursor;
	TcxDragAndDropObject* FDragAndDropObject;
	TMetaClass*FDragAndDropObjectClass;
	Controls::TCursor FDragAndDropPrevCursor;
	TcxDragAndDropState FDragAndDropState;
	bool FFinishingDragAndDrop;
	Classes::_di_IInterfaceList FFontListenerList;
	TcxControlScrollBar* FHScrollBar;
	bool FInitialHScrollBarVisible;
	bool FInitialVScrollBarVisible;
	bool FIsInitialScrollBarsParams;
	TcxKeys FKeys;
	Classes::TList* FListenerLinks;
	Cxlookandfeels::TcxLookAndFeel* FLookAndFeel;
	System::TObject* FMouseCaptureObject;
	#pragma pack(push, 1)
	Types::TPoint FMouseDownPos;
	#pragma pack(pop)
	
	Stdctrls::TScrollStyle FScrollBars;
	TcxSizeGrip* FSizeGrip;
	bool FUpdatingScrollBars;
	TcxControlScrollBar* FVScrollBar;
	Classes::TNotifyEvent FOnFocusChanged;
	Classes::TNotifyEvent FOnMouseEnter;
	Classes::TNotifyEvent FOnMouseLeave;
	Cxgraphics::TcxCanvas* __fastcall GetActiveCanvas(void);
	TcxDragAndDropObject* __fastcall GetDragAndDropObject(void);
	bool __fastcall GetHScrollBarVisible(void);
	bool __fastcall GetIsCopyDragDrop(void);
	bool __fastcall GetIsDestroying(void);
	bool __fastcall GetIsLoading(void);
	bool __fastcall GetVScrollBarVisible(void);
	void __fastcall SetBorderStyle(TcxControlBorderStyle Value);
	void __fastcall SetDragAndDropState(TcxDragAndDropState Value);
	void __fastcall SetKeys(TcxKeys Value);
	void __fastcall SetLookAndFeel(Cxlookandfeels::TcxLookAndFeel* Value);
	void __fastcall SetMouseCaptureObject(System::TObject* Value);
	void __fastcall SetScrollBars(Stdctrls::TScrollStyle Value);
	HIDESBASE MESSAGE void __fastcall WMCancelMode(Messages::TWMNoParams &Message);
	HIDESBASE MESSAGE void __fastcall WMEraseBkgnd(Messages::TWMEraseBkgnd &Message);
	MESSAGE void __fastcall WMGetDlgCode(Messages::TWMNoParams &Message);
	HIDESBASE MESSAGE void __fastcall WMNCCalcSize(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMSetCursor(Messages::TWMSetCursor &Message);
	HIDESBASE MESSAGE void __fastcall CMColorChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMCursorChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMDesignHitTest(Messages::TWMMouse &Message);
	HIDESBASE MESSAGE void __fastcall CMFontChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMMouseEnter(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMMouseLeave(Messages::TMessage &Message);
	MESSAGE void __fastcall CMNCSizeChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMVisibleChanged(Messages::TMessage &Message);
	void __fastcall ClearListenerLinks(void);
	void __fastcall CreateScrollBars(void);
	void __fastcall DestroyScrollBars(void);
	void __fastcall ScrollEvent(System::TObject* Sender, Stdctrls::TScrollCode ScrollCode, int &ScrollPos);
	
protected:
	virtual void __fastcall CreateParams(Controls::TCreateParams &Params);
	virtual void __fastcall CreateWnd(void);
	DYNAMIC void __fastcall Resize(void);
	virtual void __fastcall WndProc(Messages::TMessage &Message);
	DYNAMIC bool __fastcall DoMouseWheel(Classes::TShiftState Shift, int WheelDelta, const Types::TPoint &MousePos);
	DYNAMIC void __fastcall DoStartDrag(Controls::TDragObject* &DragObject);
	DYNAMIC void __fastcall KeyDown(Word &Key, Classes::TShiftState Shift);
	void __fastcall Modified(void);
	DYNAMIC void __fastcall MouseDown(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseMove(Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseUp(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall Paint(void);
	DYNAMIC void __fastcall ColorChanged(void);
	void __fastcall DoScrolling(void);
	DYNAMIC void __fastcall VisibleChanged(void);
	DYNAMIC void __fastcall AddChildComponent(TcxControlChildComponent* AComponent);
	DYNAMIC void __fastcall RemoveChildComponent(TcxControlChildComponent* AComponent);
	void __fastcall AddFontListener(Cxgraphics::_di_IcxFontListener AListener);
	void __fastcall RemoveFontListener(Cxgraphics::_di_IcxFontListener AListener);
	__property Classes::_di_IInterfaceList FontListenerList = {read=FFontListenerList};
	virtual void __fastcall AfterMouseDown(Controls::TMouseButton AButton, int X, int Y);
	virtual bool __fastcall AllowAutoDragAndDropAtDesignTime(int X, int Y, Classes::TShiftState Shift);
	DYNAMIC bool __fastcall AllowDragAndDropWithoutFocus(void);
	virtual void __fastcall BeforeMouseDown(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall BoundsChanged(void);
	virtual void __fastcall CancelMouseOperations(void);
	DYNAMIC bool __fastcall CanDrag(int X, int Y);
	virtual bool __fastcall CanFocusOnClick(void);
	DYNAMIC void __fastcall CursorChanged(void);
	DYNAMIC void __fastcall DoCancelMode(void);
	DYNAMIC void __fastcall FocusChanged(void);
	virtual bool __fastcall FocusWhenChildIsClicked(Controls::TControl* AChild);
	HIDESBASEDYNAMIC void __fastcall FontChanged(void);
	virtual int __fastcall GetBorderSize(void);
	virtual Types::TRect __fastcall GetBounds();
	virtual Types::TRect __fastcall GetClientBounds();
	virtual Controls::TCursor __fastcall GetCursor(int X, int Y);
	DYNAMIC bool __fastcall GetDesignHitTest(int X, int Y, Classes::TShiftState Shift);
	DYNAMIC TMetaClass* __fastcall GetDragObjectClass(void);
	virtual bool __fastcall GetIsDesigning(void);
	virtual bool __fastcall GetIsFocused(void);
	virtual TcxMouseWheelScrollingKind __fastcall GetMouseWheelScrollingKind(void);
	virtual bool __fastcall HasBackground(void);
	virtual void __fastcall InitControl(void);
	virtual bool __fastcall IsInternalControl(Controls::TControl* AControl);
	DYNAMIC bool __fastcall MayFocus(void);
	DYNAMIC void __fastcall MouseEnter(Controls::TControl* AControl);
	DYNAMIC void __fastcall MouseLeave(Controls::TControl* AControl);
	virtual TMetaClass* __fastcall GetLookAndFeelPainter(void);
	virtual void __fastcall LookAndFeelChanged(Cxlookandfeels::TcxLookAndFeel* Sender, Cxlookandfeels::TcxLookAndFeelValues AChangedValues);
	__property Cxlookandfeels::TcxLookAndFeel* LookAndFeel = {read=FLookAndFeel, write=SetLookAndFeel};
	__property TMetaClass* LookAndFeelPainter = {read=GetLookAndFeelPainter};
	virtual Types::TRect __fastcall GetHScrollBarBounds();
	virtual Types::TRect __fastcall GetSizeGripBounds();
	virtual Types::TRect __fastcall GetVScrollBarBounds();
	virtual void __fastcall InitScrollBarsParameters(void);
	virtual bool __fastcall IsPixelScrollBar(Forms::TScrollBarKind AKind);
	virtual bool __fastcall NeedsScrollBars(void);
	virtual void __fastcall Scroll(Forms::TScrollBarKind AScrollBarKind, Stdctrls::TScrollCode AScrollCode, int &AScrollPos);
	virtual void __fastcall SetInternalControlsBounds(void);
	virtual void __fastcall UpdateScrollBars(void);
	__property bool CalculatingScrollBarsParams = {read=FCalculatingScrollBarsParams, nodefault};
	__property TcxControlScrollBar* HScrollBar = {read=FHScrollBar};
	__property bool HScrollBarVisible = {read=GetHScrollBarVisible, nodefault};
	__property Stdctrls::TScrollStyle ScrollBars = {read=FScrollBars, write=SetScrollBars, default=3};
	__property TcxSizeGrip* SizeGrip = {read=FSizeGrip};
	__property bool UpdatingScrollBars = {read=FUpdatingScrollBars, nodefault};
	__property TcxControlScrollBar* VScrollBar = {read=FVScrollBar};
	__property bool VScrollBarVisible = {read=GetVScrollBarVisible, nodefault};
	DYNAMIC void __fastcall DragAndDrop(const Types::TPoint &P, bool &Accepted);
	DYNAMIC void __fastcall EndDragAndDrop(bool Accepted);
	virtual TMetaClass* __fastcall GetDragAndDropObjectClass(void);
	DYNAMIC bool __fastcall StartDragAndDrop(const Types::TPoint &P);
	__property TcxDragAndDropState DragAndDropState = {read=FDragAndDropState, write=SetDragAndDropState, nodefault};
	void __fastcall AddListenerLink(void * ALink);
	void __fastcall RemoveListenerLink(void * ALink);
	__property int BorderSize = {read=GetBorderSize, nodefault};
	__property TcxControlBorderStyle BorderStyle = {read=FBorderStyle, write=SetBorderStyle, nodefault};
	__property bool IsCopyDragDrop = {read=GetIsCopyDragDrop, nodefault};
	__property TcxKeys Keys = {read=FKeys, write=SetKeys, nodefault};
	__property TcxMouseWheelScrollingKind MouseWheelScrollingKind = {read=GetMouseWheelScrollingKind, nodefault};
	__property Classes::TNotifyEvent OnFocusChanged = {read=FOnFocusChanged, write=FOnFocusChanged};
	__property Classes::TNotifyEvent OnMouseEnter = {read=FOnMouseEnter, write=FOnMouseEnter};
	__property Classes::TNotifyEvent OnMouseLeave = {read=FOnMouseLeave, write=FOnMouseLeave};
	
public:
	__fastcall virtual TcxControl(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxControl(void);
	virtual void __fastcall BeforeDestruction(void);
	virtual bool __fastcall CanFocusEx(void);
	virtual bool __fastcall AcceptMousePosForClick(int X, int Y);
	void __fastcall InvalidateRect(const Types::TRect &R, bool EraseBackground);
	bool __fastcall IsMouseInPressedArea(int X, int Y);
	void __fastcall ScrollContent(Cxclasses::TcxDirection ADirection);
	void __fastcall SetScrollBarInfo(Forms::TScrollBarKind AScrollBarKind, int AMin, int AMax, int AStep, int APage, int APos, bool AAllowShow, bool AAllowHide);
	DYNAMIC bool __fastcall StartDrag(Controls::TDragObject* DragObject);
	void __fastcall PostMouseMove(Types::PPoint AMousePos = (void *)(0x0));
	DYNAMIC void __fastcall BeginDragAndDrop(void);
	void __fastcall FinishDragAndDrop(bool Accepted);
	__property TcxDragAndDropObject* DragAndDropObject = {read=GetDragAndDropObject};
	__property TMetaClass* DragAndDropObjectClass = {read=GetDragAndDropObjectClass, write=FDragAndDropObjectClass};
	__property Cxgraphics::TcxCanvas* ActiveCanvas = {read=GetActiveCanvas};
	__property Types::TRect Bounds = {read=GetBounds};
	__property Cxgraphics::TcxCanvas* Canvas = {read=FCanvas};
	__property Types::TRect ClientBounds = {read=GetClientBounds};
	__property bool IsDesigning = {read=GetIsDesigning, nodefault};
	__property bool IsDestroying = {read=GetIsDestroying, nodefault};
	__property bool IsLoading = {read=GetIsLoading, nodefault};
	__property bool IsFocused = {read=GetIsFocused, nodefault};
	__property System::TObject* MouseCaptureObject = {read=FMouseCaptureObject, write=SetMouseCaptureObject};
	__property Types::TPoint MouseDownPos = {read=FMouseDownPos, write=FMouseDownPos};
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxControl(HWND ParentWindow) : Controls::TCustomControl(ParentWindow) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxControlChildComponent : public Cxclasses::TcxComponent 
{
	typedef Cxclasses::TcxComponent inherited;
	
private:
	TcxControl* FControl;
	bool __fastcall GetIsLoading(void);
	
protected:
	virtual bool __fastcall GetIsDestroying(void);
	virtual void __fastcall SetControl(TcxControl* Value);
	DYNAMIC void __fastcall SetParentComponent(Classes::TComponent* Value);
	
public:
	__fastcall TcxControlChildComponent(TcxControl* AControl, bool AAssignOwner);
	__fastcall virtual ~TcxControlChildComponent(void);
	DYNAMIC Classes::TComponent* __fastcall GetParentComponent(void);
	DYNAMIC bool __fastcall HasParent(void);
	__property TcxControl* Control = {read=FControl, write=SetControl};
	__property bool IsDestroying = {read=GetIsDestroying, nodefault};
	__property bool IsLoading = {read=GetIsLoading, nodefault};
public:
	#pragma option push -w-inl
	/* TComponent.Create */ inline __fastcall virtual TcxControlChildComponent(Classes::TComponent* AOwner) : Cxclasses::TcxComponent(AOwner) { }
	#pragma option pop
	
};


class DELPHICLASS TcxDragControlObject;
class PASCALIMPLEMENTATION TcxDragControlObject : public Controls::TDragControlObject 
{
	typedef Controls::TDragControlObject inherited;
	
protected:
	virtual Controls::TCursor __fastcall GetDragCursor(bool Accepted, int X, int Y);
public:
	#pragma option push -w-inl
	/* TBaseDragControlObject.Create */ inline __fastcall virtual TcxDragControlObject(Controls::TControl* AControl) : Controls::TDragControlObject(AControl) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxDragControlObject(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomizeListBox;
class PASCALIMPLEMENTATION TcxCustomizeListBox : public Stdctrls::TListBox 
{
	typedef Stdctrls::TListBox inherited;
	
private:
	int FDragAndDropItemIndex;
	#pragma pack(push, 1)
	Types::TPoint FMouseDownPos;
	#pragma pack(pop)
	
	System::TObject* __fastcall GetDragAndDropItemObject(void);
	System::TObject* __fastcall GetItemObject(void);
	void __fastcall SetItemObject(System::TObject* Value);
	HIDESBASE MESSAGE void __fastcall WMCancelMode(Messages::TWMNoParams &Message);
	HIDESBASE MESSAGE void __fastcall WMMouseMove(Messages::TWMMouse &Message);
	
protected:
	virtual void __fastcall CreateParams(Controls::TCreateParams &Params);
	DYNAMIC void __fastcall MouseDown(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseMove(Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseUp(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall BeginDragAndDrop(void);
	__property int DragAndDropItemIndex = {read=FDragAndDropItemIndex, nodefault};
	__property System::TObject* DragAndDropItemObject = {read=GetDragAndDropItemObject};
	
public:
	__fastcall virtual TcxCustomizeListBox(Classes::TComponent* AOwner);
	__property System::TObject* ItemObject = {read=GetItemObject, write=SetItemObject};
public:
	#pragma option push -w-inl
	/* TCustomListBox.Destroy */ inline __fastcall virtual ~TcxCustomizeListBox(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomizeListBox(HWND ParentWindow) : Stdctrls::TListBox(ParentWindow) { }
	#pragma option pop
	
};


#pragma option push -b-
enum TcxPopupAlignHorz { pahLeft, pahCenter, pahRight };
#pragma option pop

#pragma option push -b-
enum TcxPopupAlignVert { pavTop, pavCenter, pavBottom };
#pragma option pop

#pragma option push -b-
enum TcxPopupDirection { pdHorizontal, pdVertical };
#pragma option pop

class DELPHICLASS TcxPopupWindow;
class PASCALIMPLEMENTATION TcxPopupWindow : public Forms::TForm 
{
	typedef Forms::TForm inherited;
	
private:
	bool FAdjustable;
	TcxPopupAlignHorz FAlignHorz;
	TcxPopupAlignVert FAlignVert;
	int FBorderSpace;
	Cxlookandfeelpainters::TcxPopupBorderStyle FBorderStyle;
	Cxgraphics::TcxCanvas* FCanvas;
	TcxPopupDirection FDirection;
	Graphics::TColor FFrameColor;
	#pragma pack(push, 1)
	Types::TRect FOwnerBounds;
	#pragma pack(pop)
	
	Controls::TControl* FOwnerParent;
	HWND FPrevActiveWindow;
	int __fastcall GetNCHeight(void);
	int __fastcall GetNCWidth(void);
	void __fastcall SetBorderSpace(int Value);
	HIDESBASE void __fastcall SetBorderStyle(Cxlookandfeelpainters::TcxPopupBorderStyle Value);
	HIDESBASE MESSAGE void __fastcall WMActivate(Messages::TWMActivate &Message);
	MESSAGE void __fastcall WMActivateApp(Messages::TWMActivateApp &Message);
	HIDESBASE MESSAGE void __fastcall CMVisibleChanged(Messages::TMessage &Message);
	
protected:
	DYNAMIC void __fastcall Deactivate(void);
	DYNAMIC void __fastcall Paint(void);
	DYNAMIC void __fastcall VisibleChanged(void);
	virtual Types::TPoint __fastcall CalculatePosition();
	virtual void __fastcall CalculateSize(void);
	virtual int __fastcall GetBorderWidth(Cxgraphics::TcxBorder ABorder);
	virtual int __fastcall GetFrameWidth(Cxgraphics::TcxBorder ABorder);
	virtual void __fastcall InitPopup(void);
	void __fastcall RestoreControlsBounds(void);
	virtual void __fastcall DrawFrame(void);
	__property int BorderWidths[Cxgraphics::TcxBorder ABorder] = {read=GetBorderWidth};
	__property Cxgraphics::TcxCanvas* Canvas = {read=FCanvas};
	__property int FrameWidths[Cxgraphics::TcxBorder ABorder] = {read=GetFrameWidth};
	__property int NCHeight = {read=GetNCHeight, nodefault};
	__property int NCWidth = {read=GetNCWidth, nodefault};
	
public:
	__fastcall virtual TcxPopupWindow(void);
	__fastcall virtual ~TcxPopupWindow(void);
	virtual void __fastcall CloseUp(void);
	virtual void __fastcall Popup(void);
	__property bool Adjustable = {read=FAdjustable, write=FAdjustable, nodefault};
	__property TcxPopupAlignHorz AlignHorz = {read=FAlignHorz, write=FAlignHorz, nodefault};
	__property TcxPopupAlignVert AlignVert = {read=FAlignVert, write=FAlignVert, nodefault};
	__property int BorderSpace = {read=FBorderSpace, write=SetBorderSpace, nodefault};
	__property Cxlookandfeelpainters::TcxPopupBorderStyle BorderStyle = {read=FBorderStyle, write=SetBorderStyle, nodefault};
	__property TcxPopupDirection Direction = {read=FDirection, write=FDirection, nodefault};
	__property Graphics::TColor FrameColor = {read=FFrameColor, write=FFrameColor, nodefault};
	__property Types::TRect OwnerBounds = {read=FOwnerBounds, write=FOwnerBounds};
	__property Controls::TControl* OwnerParent = {read=FOwnerParent, write=FOwnerParent};
public:
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual TcxPopupWindow(Classes::TComponent* AOwner, int Dummy) : Forms::TForm(AOwner, Dummy) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxPopupWindow(HWND ParentWindow) : Forms::TForm(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
static const Word CM_NCSIZECHANGED = 0x8131;
static const Word crBase = 0x834;
static const Word crDragCopy = 0x834;
static const Word crcxRemove = 0x83c;
static const Word crcxVertSize = 0x83d;
static const Word crcxHorzSize = 0x83e;
static const Word crcxDragMulti = 0x83f;
static const Word crcxNoDrop = 0x840;
static const Word crcxDrag = 0x841;
extern PACKAGE TcxDragDetect __fastcall DragDetect(HWND Wnd);
extern PACKAGE int __fastcall GetMouseKeys(void);
extern PACKAGE int __fastcall GetDblClickInterval(void);
extern PACKAGE Types::TRect __fastcall GetDesktopWorkArea(const Types::TPoint &P);
extern PACKAGE Types::TPoint __fastcall GetMouseCursorPos();
extern PACKAGE bool __fastcall IsCtrlPressed(void);
extern PACKAGE bool __fastcall IsPointInDragDetectArea(const Types::TPoint &AMouseDownPos, int X, int Y);
extern PACKAGE void __fastcall MapWindowPoint(HWND AHandleFrom, HWND AHandleTo, Types::TPoint &P);
extern PACKAGE void __fastcall MapWindowRect(HWND AHandleFrom, HWND AHandleTo, Types::TRect &R);
extern PACKAGE Word __fastcall TranslateKey(Word Key);
extern PACKAGE void __fastcall BeginMouseTracking(Controls::TWinControl* AControl, const Types::TRect &ABounds, _di_IcxMouseTrackingCaller ACaller);
extern PACKAGE void __fastcall EndMouseTracking(_di_IcxMouseTrackingCaller ACaller);
extern PACKAGE bool __fastcall IsMouseTracking(_di_IcxMouseTrackingCaller ACaller);
extern PACKAGE void __fastcall HideHourglassCursor(void);
extern PACKAGE void __fastcall ShowHourglassCursor(void);

}	/* namespace Cxcontrols */
using namespace Cxcontrols;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxControls
