// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxNavigator.pas' rev: 6.00

#ifndef cxNavigatorHPP
#define cxNavigatorHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Menus.hpp>	// Pascal unit
#include <cxLookAndFeelPainters.hpp>	// Pascal unit
#include <cxLookAndFeels.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <cxFilter.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <ImgList.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Types.hpp>	// Pascal unit
#include <dxThemeManager.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxnavigator
{
//-- type declarations -------------------------------------------------------
__interface IcxNavigatorOwner;
typedef System::DelphiInterface<IcxNavigatorOwner> _di_IcxNavigatorOwner;
class DELPHICLASS TcxCustomNavigatorButtons;
__interface INTERFACE_UUID("{504B7F43-8847-46C5-B84A-C24F8E5E61A6}") IcxNavigatorOwner  : public IInterface 
{
	
public:
	virtual Types::TRect __fastcall GetNavigatorBounds(void) = 0 ;
	virtual TcxCustomNavigatorButtons* __fastcall GetNavigatorButtons(void) = 0 ;
	virtual Graphics::TCanvas* __fastcall GetNavigatorCanvas(void) = 0 ;
	virtual Controls::TWinControl* __fastcall GetNavigatorControl(void) = 0 ;
	virtual bool __fastcall GetNavigatorFocused(void) = 0 ;
	virtual Cxlookandfeels::TcxLookAndFeel* __fastcall GetNavigatorLookAndFeel(void) = 0 ;
	virtual Classes::TComponent* __fastcall GetNavigatorOwner(void) = 0 ;
	virtual bool __fastcall GetNavigatorShowHint(void) = 0 ;
	virtual bool __fastcall GetNavigatorTabStop(void) = 0 ;
	virtual void __fastcall NavigatorButtonsStateChanged(void) = 0 ;
	virtual void __fastcall RefreshNavigator(void) = 0 ;
};

class DELPHICLASS TcxNavigatorButton;
class PASCALIMPLEMENTATION TcxNavigatorButton : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	bool FEnabled;
	AnsiString FHint;
	int FDefaultIndex;
	int FImageIndex;
	bool FVisible;
	Classes::TNotifyEvent FonClick;
	TcxCustomNavigatorButtons* FButtons;
	int __fastcall GetInternalImageIndex(void);
	Imglist::TCustomImageList* __fastcall GetIternalImages(void);
	void __fastcall SetEnabled(bool Value);
	void __fastcall SetImageIndex(int Value);
	void __fastcall SetVisible(const bool Value);
	
protected:
	DYNAMIC Classes::TPersistent* __fastcall GetOwner(void);
	bool __fastcall GetInternalEnabled(void);
	AnsiString __fastcall GetInternalHint();
	DYNAMIC void __fastcall DoClick(void);
	_di_IcxNavigatorOwner __fastcall GetNavigator();
	__property int DefaultIndex = {read=FDefaultIndex, write=FDefaultIndex, nodefault};
	__property int InternalImageIndex = {read=GetInternalImageIndex, nodefault};
	__property Imglist::TCustomImageList* InternalImages = {read=GetIternalImages};
	
public:
	__fastcall TcxNavigatorButton(TcxCustomNavigatorButtons* AButtons);
	__fastcall virtual ~TcxNavigatorButton(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	void __fastcall Click(void);
	tagSIZE __fastcall GetImageSize();
	__property TcxCustomNavigatorButtons* Buttons = {read=FButtons};
	__property _di_IcxNavigatorOwner Navigator = {read=GetNavigator};
	__property Classes::TNotifyEvent OnClick = {read=FonClick, write=FonClick};
	
__published:
	__property bool Enabled = {read=FEnabled, write=SetEnabled, default=1};
	__property AnsiString Hint = {read=FHint, write=FHint};
	__property int ImageIndex = {read=FImageIndex, write=SetImageIndex, default=-1};
	__property bool Visible = {read=FVisible, write=SetVisible, default=1};
};


typedef void __fastcall (__closure *TcxNavigatorButtonClickEvent)(System::TObject* Sender, int AButtonIndex, bool &ADone);

class PASCALIMPLEMENTATION TcxCustomNavigatorButtons : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
public:
	TcxNavigatorButton* operator[](int Index) { return Buttons[Index]; }
	
private:
	_di_IcxNavigatorOwner FNavigator;
	TcxNavigatorButton* FButtons[15];
	Imglist::TCustomImageList* FImages;
	Imglist::TChangeLink* FImageChangeLink;
	bool FConfirmDelete;
	TcxNavigatorButtonClickEvent FOnButtonClick;
	TcxNavigatorButton* __fastcall GetButton(int Index);
	int __fastcall GetButtonCount(void);
	Imglist::TCustomImageList* __fastcall GetDefaultImages(void);
	void __fastcall SetButton(int Index, const TcxNavigatorButton* Value);
	void __fastcall SetImages(const Imglist::TCustomImageList* Value);
	void __fastcall ImageListChange(System::TObject* Sender);
	
protected:
	DYNAMIC Classes::TPersistent* __fastcall GetOwner(void);
	virtual void __fastcall CreateButtons(void);
	virtual void __fastcall DestroyButtons(void);
	virtual void __fastcall DoButtonClick(int ADefaultIndex);
	virtual bool __fastcall GetButtonEnabled(int ADefaultIndex);
	virtual AnsiString __fastcall GetButtonHint(int ADefaultIndex);
	virtual int __fastcall GetButtonImageOffset(void);
	bool __fastcall IsNavigatorEnabled(void);
	__property bool ConfirmDelete = {read=FConfirmDelete, write=FConfirmDelete, default=1};
	__property Imglist::TCustomImageList* Images = {read=FImages, write=SetImages};
	__property TcxNavigatorButton* First = {read=GetButton, write=SetButton, index=0};
	__property TcxNavigatorButton* PriorPage = {read=GetButton, write=SetButton, index=1};
	__property TcxNavigatorButton* Prior = {read=GetButton, write=SetButton, index=2};
	__property TcxNavigatorButton* Next = {read=GetButton, write=SetButton, index=3};
	__property TcxNavigatorButton* NextPage = {read=GetButton, write=SetButton, index=4};
	__property TcxNavigatorButton* Last = {read=GetButton, write=SetButton, index=5};
	__property TcxNavigatorButton* Insert = {read=GetButton, write=SetButton, index=6};
	__property TcxNavigatorButton* Delete = {read=GetButton, write=SetButton, index=7};
	__property TcxNavigatorButton* Edit = {read=GetButton, write=SetButton, index=8};
	__property TcxNavigatorButton* Post = {read=GetButton, write=SetButton, index=9};
	__property TcxNavigatorButton* Cancel = {read=GetButton, write=SetButton, index=10};
	__property TcxNavigatorButton* Refresh = {read=GetButton, write=SetButton, index=11};
	__property TcxNavigatorButton* SaveBookmark = {read=GetButton, write=SetButton, index=12};
	__property TcxNavigatorButton* GotoBookmark = {read=GetButton, write=SetButton, index=13};
	__property TcxNavigatorButton* Filter = {read=GetButton, write=SetButton, index=14};
	
public:
	__fastcall virtual TcxCustomNavigatorButtons(_di_IcxNavigatorOwner ANavigator);
	__fastcall virtual ~TcxCustomNavigatorButtons(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	void __fastcall ClickButton(int Index);
	virtual void __fastcall ReleaseBookmark(void);
	__property int ButtonCount = {read=GetButtonCount, nodefault};
	__property TcxNavigatorButton* Buttons[int Index] = {read=GetButton/*, default*/};
	__property Imglist::TCustomImageList* DefaultImages = {read=GetDefaultImages};
	__property _di_IcxNavigatorOwner Navigator = {read=FNavigator};
	
__published:
	__property TcxNavigatorButtonClickEvent OnButtonClick = {read=FOnButtonClick, write=FOnButtonClick};
};


struct TcxNavigatorButtonViewInfo;
typedef TcxNavigatorButtonViewInfo *PcxNavigatorButtonViewInfo;

#pragma pack(push, 4)
struct TcxNavigatorButtonViewInfo
{
	TcxNavigatorButton* Button;
	Types::TRect Bounds;
	bool Enabled;
	AnsiString Hint;
} ;
#pragma pack(pop)

class DELPHICLASS TcxNavigatorViewInfo;
class PASCALIMPLEMENTATION TcxNavigatorViewInfo : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	Extctrls::TTimer* FButtonPressTimer;
	Classes::TList* FButtons;
	Cxgraphics::TcxCanvas* FCanvas;
	TcxNavigatorButton* FFocusedButton;
	Extctrls::TTimer* FHintTimer;
	Controls::THintWindow* FHintWindow;
	bool FHintWindowShowing;
	TcxNavigatorButtonViewInfo *FHotTrackButtonViewInfo;
	bool FIsDirty;
	bool FIsInplace;
	bool FIsSelected;
	_di_IcxNavigatorOwner FNavigator;
	TcxNavigatorButtonViewInfo *FPressedButtonViewInfo;
	PcxNavigatorButtonViewInfo __fastcall GetButton(int Index);
	int __fastcall GetButtonCount(void);
	PcxNavigatorButtonViewInfo __fastcall GetFocusedButton(void);
	void __fastcall SetFocusedButton(PcxNavigatorButtonViewInfo Value);
	void __fastcall DoButtonPressTimer(System::TObject* Sender);
	void __fastcall DoHintTimer(System::TObject* Sender);
	void __fastcall UpdateSelected(void);
	
protected:
	Types::TRect __fastcall GetButtonBorderExtent(TMetaClass* APainter, int AButtonIndex, int AButtonCount);
	Cxlookandfeelpainters::TcxButtonState __fastcall GetButtonState(PcxNavigatorButtonViewInfo AButton);
	tagSIZE __fastcall GetMinButtonSize(int AButtonIndex, int AButtonCount);
	int __fastcall GetVisibleButtonCount(void);
	void __fastcall InvalidateButton(PcxNavigatorButtonViewInfo AButton);
	void __fastcall PaintButton(int AButtonIndex);
	void __fastcall HintActivate(bool AShow);
	__property Cxgraphics::TcxCanvas* Canvas = {read=FCanvas};
	__property PcxNavigatorButtonViewInfo FocusedButton = {read=GetFocusedButton, write=SetFocusedButton};
	__property PcxNavigatorButtonViewInfo HotTrackButtonViewInfo = {read=FHotTrackButtonViewInfo, write=FHotTrackButtonViewInfo};
	__property _di_IcxNavigatorOwner Navigator = {read=FNavigator};
	__property PcxNavigatorButtonViewInfo PressedButtonViewInfo = {read=FPressedButtonViewInfo, write=FPressedButtonViewInfo};
	
public:
	__fastcall TcxNavigatorViewInfo(_di_IcxNavigatorOwner ANavigator, bool AIsInplace);
	__fastcall virtual ~TcxNavigatorViewInfo(void);
	void __fastcall Calculate(void);
	void __fastcall CheckSize(int &AWidth, int &AHeight);
	void __fastcall Clear(void);
	void __fastcall DoEnter(void);
	void __fastcall DoExit(void);
	TcxNavigatorButton* __fastcall GetButtonAt(const Types::TPoint &pt);
	PcxNavigatorButtonViewInfo __fastcall GetButtonViewInfoAt(const Types::TPoint &pt);
	PcxNavigatorButtonViewInfo __fastcall GetButtonViewInfoByButton(TcxNavigatorButton* AButton);
	void __fastcall MakeIsDirty(void);
	void __fastcall MouseDown(int X, int Y);
	void __fastcall MouseMove(int X, int Y);
	void __fastcall MouseUp(int X, int Y);
	void __fastcall Paint(void);
	void __fastcall PressArrowKey(bool ALeftKey);
	void __fastcall UpdateButtonsEnabled(void);
	__property int ButtonCount = {read=GetButtonCount, nodefault};
	__property PcxNavigatorButtonViewInfo Buttons[int Index] = {read=GetButton};
};


typedef TMetaClass*TcxNavigatorViewInfoClass;

class DELPHICLASS TcxCustomNavigator;
class PASCALIMPLEMENTATION TcxCustomNavigator : public Cxcontrols::TcxControl 
{
	typedef Cxcontrols::TcxControl inherited;
	
private:
	TcxCustomNavigatorButtons* FButtons;
	Classes::TNotifyEvent FButtonsEvents;
	bool FMouseInControl;
	TcxNavigatorViewInfo* FViewInfo;
	HIDESBASE MESSAGE void __fastcall CMEnabledChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMGetDlgCode(Messages::TWMNoParams &Message);
	
protected:
	virtual bool __fastcall CanFocusOnClick(void);
	virtual TcxCustomNavigatorButtons* __fastcall CreateButtons(void);
	DYNAMIC void __fastcall DoEnter(void);
	DYNAMIC void __fastcall DoExit(void);
	DYNAMIC void __fastcall EnabledChanged(void);
	DYNAMIC void __fastcall KeyDown(Word &Key, Classes::TShiftState Shift);
	virtual void __fastcall LookAndFeelChanged(Cxlookandfeels::TcxLookAndFeel* Sender, Cxlookandfeels::TcxLookAndFeelValues AChangedValues);
	DYNAMIC void __fastcall MouseDown(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseEnter(Controls::TControl* AControl);
	DYNAMIC void __fastcall MouseLeave(Controls::TControl* AControl);
	DYNAMIC void __fastcall MouseMove(Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseUp(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall Paint(void);
	void __fastcall NavigatorMouseLeave(void);
	Types::TRect __fastcall GetNavigatorBounds();
	TcxCustomNavigatorButtons* __fastcall GetNavigatorButtons(void);
	Graphics::TCanvas* __fastcall GetNavigatorCanvas(void);
	Controls::TWinControl* __fastcall GetNavigatorControl(void);
	bool __fastcall GetNavigatorFocused(void);
	Cxlookandfeels::TcxLookAndFeel* __fastcall GetNavigatorLookAndFeel(void);
	Classes::TComponent* __fastcall GetNavigatorOwner(void);
	bool __fastcall GetNavigatorShowHint(void);
	bool __fastcall GetNavigatorTabStop(void);
	virtual TMetaClass* __fastcall GetViewInfoClass(void);
	void __fastcall NavigatorButtonsStateChanged(void);
	void __fastcall RefreshNavigator(void);
	virtual void __fastcall CreateWnd(void);
	virtual void __fastcall WndProc(Messages::TMessage &Message);
	__property TcxCustomNavigatorButtons* CustomButtons = {read=FButtons};
	
public:
	__fastcall virtual TcxCustomNavigator(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxCustomNavigator(void);
	virtual void __fastcall SetBounds(int ALeft, int ATop, int AWidth, int AHeight);
	void __fastcall ClickButton(int Index);
	
__published:
	__property TabStop  = {default=0};
	__property Classes::TNotifyEvent ButtonsEvents = {read=FButtonsEvents, write=FButtonsEvents};
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomNavigator(HWND ParentWindow) : Cxcontrols::TcxControl(ParentWindow) { }
	#pragma option pop
	
private:
	void *__IcxNavigatorOwner;	/* Cxnavigator::IcxNavigatorOwner */
	void *__IcxMouseTrackingCaller;	/* Cxcontrols::IcxMouseTrackingCaller [MouseLeave=NavigatorMouseLeave] */
	
public:
	operator IcxMouseTrackingCaller*(void) { return (IcxMouseTrackingCaller*)&__IcxMouseTrackingCaller; }
	operator IcxNavigatorOwner*(void) { return (IcxNavigatorOwner*)&__IcxNavigatorOwner; }
	
};


class DELPHICLASS TcxNavigatorControlNotifier;
class PASCALIMPLEMENTATION TcxNavigatorControlNotifier : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	Classes::TList* FList;
	
public:
	__fastcall TcxNavigatorControlNotifier(void);
	__fastcall virtual ~TcxNavigatorControlNotifier(void);
	void __fastcall AddNavigator(_di_IcxNavigatorOwner ANavigator);
	void __fastcall RemoveNavigator(_di_IcxNavigatorOwner ANavigator);
	void __fastcall RefreshNavigatorButtons(void);
};


__interface IcxNavigator;
typedef System::DelphiInterface<IcxNavigator> _di_IcxNavigator;
__interface INTERFACE_UUID("{A15F80CA-DE56-47CB-B0EB-035D0BF90E9D}") IcxNavigator  : public IInterface 
{
	
public:
	virtual bool __fastcall CanDelete(void) = 0 ;
	virtual bool __fastcall CanEdit(void) = 0 ;
	virtual bool __fastcall CanInsert(void) = 0 ;
	virtual bool __fastcall IsBof(void) = 0 ;
	virtual bool __fastcall IsBookmarkAvailable(void) = 0 ;
	virtual bool __fastcall IsEditing(void) = 0 ;
	virtual bool __fastcall IsEof(void) = 0 ;
	virtual void __fastcall ClearBookmark(void) = 0 ;
	virtual void __fastcall DoAction(int AButtonIndex) = 0 ;
	virtual TcxNavigatorControlNotifier* __fastcall GetNotifier(void) = 0 ;
	virtual bool __fastcall IsActionSupported(int AButtonIndex) = 0 ;
};

typedef _di_IcxNavigator __fastcall (__closure *TcxNavigatorControlButtonsGetControl)(void);

class DELPHICLASS TcxNavigatorControlButtons;
class PASCALIMPLEMENTATION TcxNavigatorControlButtons : public TcxCustomNavigatorButtons 
{
	typedef TcxCustomNavigatorButtons inherited;
	
private:
	TcxNavigatorControlButtonsGetControl FOnGetControl;
	_di_IcxNavigator __fastcall GetControl();
	
protected:
	virtual void __fastcall DoButtonClick(int ADefaultIndex);
	virtual bool __fastcall GetButtonEnabled(int ADefaultIndex);
	__property _di_IcxNavigator Control = {read=GetControl};
	
public:
	virtual void __fastcall ReleaseBookmark(void);
	__property TcxNavigatorControlButtonsGetControl OnGetControl = {read=FOnGetControl, write=FOnGetControl};
	
__published:
	__property ConfirmDelete  = {default=1};
	__property Images ;
	__property First ;
	__property PriorPage ;
	__property Prior ;
	__property Next ;
	__property NextPage ;
	__property Last ;
	__property Insert ;
	__property Delete ;
	__property Edit ;
	__property Post ;
	__property Cancel ;
	__property Refresh ;
	__property SaveBookmark ;
	__property GotoBookmark ;
	__property Filter ;
public:
	#pragma option push -w-inl
	/* TcxCustomNavigatorButtons.Create */ inline __fastcall virtual TcxNavigatorControlButtons(_di_IcxNavigatorOwner ANavigator) : TcxCustomNavigatorButtons(ANavigator) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomNavigatorButtons.Destroy */ inline __fastcall virtual ~TcxNavigatorControlButtons(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxNavigatorControlButtonsClass;

class DELPHICLASS TcxCustomNavigatorControl;
class PASCALIMPLEMENTATION TcxCustomNavigatorControl : public TcxCustomNavigator 
{
	typedef TcxCustomNavigator inherited;
	
private:
	Classes::TComponent* FControl;
	TcxNavigatorControlButtons* __fastcall GetButtons(void);
	HIDESBASE _di_IcxNavigator __fastcall GetControl();
	void __fastcall SetButtons(TcxNavigatorControlButtons* Value);
	void __fastcall SetControl(Classes::TComponent* Value);
	
protected:
	virtual TcxCustomNavigatorButtons* __fastcall CreateButtons(void);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	virtual void __fastcall InitButtons(void);
	__property TcxNavigatorControlButtons* Buttons = {read=GetButtons, write=SetButtons};
	__property Classes::TComponent* Control = {read=FControl, write=SetControl};
	
public:
	__fastcall virtual ~TcxCustomNavigatorControl(void);
public:
	#pragma option push -w-inl
	/* TcxCustomNavigator.Create */ inline __fastcall virtual TcxCustomNavigatorControl(Classes::TComponent* AOwner) : TcxCustomNavigator(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomNavigatorControl(HWND ParentWindow) : TcxCustomNavigator(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxNavigator;
class PASCALIMPLEMENTATION TcxNavigator : public TcxCustomNavigatorControl 
{
	typedef TcxCustomNavigatorControl inherited;
	
__published:
	__property Control ;
	__property Buttons ;
	__property LookAndFeel ;
	__property Align  = {default=0};
	__property Anchors  = {default=3};
	__property Constraints ;
	__property DragCursor  = {default=-12};
	__property DragKind  = {default=0};
	__property DragMode  = {default=0};
	__property Enabled  = {default=1};
	__property Ctl3D ;
	__property ParentCtl3D  = {default=1};
	__property ParentShowHint  = {default=1};
	__property PopupMenu ;
	__property ShowHint ;
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=0};
	__property Visible  = {default=1};
	__property OnContextPopup ;
	__property OnDblClick ;
	__property OnDragDrop ;
	__property OnDragOver ;
	__property OnEndDock ;
	__property OnEndDrag ;
	__property OnEnter ;
	__property OnExit ;
	__property OnResize ;
	__property OnStartDock ;
	__property OnStartDrag ;
public:
	#pragma option push -w-inl
	/* TcxCustomNavigatorControl.Destroy */ inline __fastcall virtual ~TcxNavigator(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomNavigator.Create */ inline __fastcall virtual TcxNavigator(Classes::TComponent* AOwner) : TcxCustomNavigatorControl(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxNavigator(HWND ParentWindow) : TcxCustomNavigatorControl(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
static const Shortint NavigatorButtonCount = 0xf;
static const Shortint NBDI_FIRST = 0x0;
static const Shortint NBDI_PRIORPAGE = 0x1;
static const Shortint NBDI_PRIOR = 0x2;
static const Shortint NBDI_NEXT = 0x3;
static const Shortint NBDI_NEXTPAGE = 0x4;
static const Shortint NBDI_LAST = 0x5;
static const Shortint NBDI_INSERT = 0x6;
static const Shortint NBDI_DELETE = 0x7;
static const Shortint NBDI_EDIT = 0x8;
static const Shortint NBDI_POST = 0x9;
static const Shortint NBDI_CANCEL = 0xa;
static const Shortint NBDI_REFRESH = 0xb;
static const Shortint NBDI_SAVEBOOKMARK = 0xc;
static const Shortint NBDI_GOTOBOOKMARK = 0xd;
static const Shortint NBDI_FILTER = 0xe;
extern PACKAGE System::ResourceString _cxNavigatorHint_First;
#define Cxnavigator_cxNavigatorHint_First System::LoadResourceString(&Cxnavigator::_cxNavigatorHint_First)
extern PACKAGE System::ResourceString _cxNavigatorHint_Prior;
#define Cxnavigator_cxNavigatorHint_Prior System::LoadResourceString(&Cxnavigator::_cxNavigatorHint_Prior)
extern PACKAGE System::ResourceString _cxNavigatorHint_PriorPage;
#define Cxnavigator_cxNavigatorHint_PriorPage System::LoadResourceString(&Cxnavigator::_cxNavigatorHint_PriorPage)
extern PACKAGE System::ResourceString _cxNavigatorHint_Next;
#define Cxnavigator_cxNavigatorHint_Next System::LoadResourceString(&Cxnavigator::_cxNavigatorHint_Next)
extern PACKAGE System::ResourceString _cxNavigatorHint_NextPage;
#define Cxnavigator_cxNavigatorHint_NextPage System::LoadResourceString(&Cxnavigator::_cxNavigatorHint_NextPage)
extern PACKAGE System::ResourceString _cxNavigatorHint_Last;
#define Cxnavigator_cxNavigatorHint_Last System::LoadResourceString(&Cxnavigator::_cxNavigatorHint_Last)
extern PACKAGE System::ResourceString _cxNavigatorHint_Insert;
#define Cxnavigator_cxNavigatorHint_Insert System::LoadResourceString(&Cxnavigator::_cxNavigatorHint_Insert)
extern PACKAGE System::ResourceString _cxNavigatorHint_Delete;
#define Cxnavigator_cxNavigatorHint_Delete System::LoadResourceString(&Cxnavigator::_cxNavigatorHint_Delete)
extern PACKAGE System::ResourceString _cxNavigatorHint_Edit;
#define Cxnavigator_cxNavigatorHint_Edit System::LoadResourceString(&Cxnavigator::_cxNavigatorHint_Edit)
extern PACKAGE System::ResourceString _cxNavigatorHint_Post;
#define Cxnavigator_cxNavigatorHint_Post System::LoadResourceString(&Cxnavigator::_cxNavigatorHint_Post)
extern PACKAGE System::ResourceString _cxNavigatorHint_Cancel;
#define Cxnavigator_cxNavigatorHint_Cancel System::LoadResourceString(&Cxnavigator::_cxNavigatorHint_Cancel)
extern PACKAGE System::ResourceString _cxNavigatorHint_Refresh;
#define Cxnavigator_cxNavigatorHint_Refresh System::LoadResourceString(&Cxnavigator::_cxNavigatorHint_Refresh)
extern PACKAGE System::ResourceString _cxNavigatorHint_SaveBookmark;
#define Cxnavigator_cxNavigatorHint_SaveBookmark System::LoadResourceString(&Cxnavigator::_cxNavigatorHint_SaveBookmark)
extern PACKAGE System::ResourceString _cxNavigatorHint_GotoBookmark;
#define Cxnavigator_cxNavigatorHint_GotoBookmark System::LoadResourceString(&Cxnavigator::_cxNavigatorHint_GotoBookmark)
extern PACKAGE System::ResourceString _cxNavigatorHint_Filter;
#define Cxnavigator_cxNavigatorHint_Filter System::LoadResourceString(&Cxnavigator::_cxNavigatorHint_Filter)
extern PACKAGE System::ResourceString _cxNavigator_DeleteRecordQuestion;
#define Cxnavigator_cxNavigator_DeleteRecordQuestion System::LoadResourceString(&Cxnavigator::_cxNavigator_DeleteRecordQuestion)

}	/* namespace Cxnavigator */
using namespace Cxnavigator;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxNavigator
