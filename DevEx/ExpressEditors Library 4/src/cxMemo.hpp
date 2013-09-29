// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxMemo.pas' rev: 6.00

#ifndef cxMemoHPP
#define cxMemoHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxTextEdit.hpp>	// Pascal unit
#include <cxLookAndFeels.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
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
#include <Classes.hpp>	// Pascal unit
#include <Types.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxmemo
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxCustomMemoViewInfo;
class PASCALIMPLEMENTATION TcxCustomMemoViewInfo : public Cxtextedit::TcxCustomTextEditViewInfo 
{
	typedef Cxtextedit::TcxCustomTextEditViewInfo inherited;
	
public:
	virtual void __fastcall DrawText(Cxgraphics::TcxCanvas* ACanvas);
public:
	#pragma option push -w-inl
	/* TcxCustomTextEditViewInfo.Destroy */ inline __fastcall virtual ~TcxCustomMemoViewInfo(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomEditViewInfo.Create */ inline __fastcall virtual TcxCustomMemoViewInfo(void) : Cxtextedit::TcxCustomTextEditViewInfo() { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomMemoViewData;
class DELPHICLASS TcxCustomMemoProperties;
class PASCALIMPLEMENTATION TcxCustomMemoViewData : public Cxtextedit::TcxCustomTextEditViewData 
{
	typedef Cxtextedit::TcxCustomTextEditViewData inherited;
	
private:
	HIDESBASE TcxCustomMemoProperties* __fastcall GetProperties(void);
	HIDESBASE void __fastcall SetProperties(TcxCustomMemoProperties* Value);
	
public:
	virtual unsigned __fastcall GetDrawTextFlags(void);
	virtual Types::TRect __fastcall GetDrawTextOffset();
	__property TcxCustomMemoProperties* Properties = {read=GetProperties, write=SetProperties};
public:
	#pragma option push -w-inl
	/* TcxCustomEditViewData.Create */ inline __fastcall virtual TcxCustomMemoViewData(Cxedit::TcxCustomEditProperties* AProperties, Cxcontainer::TcxContainerStyle* AStyle, bool AIsInplace) : Cxtextedit::TcxCustomTextEditViewData(AProperties, AStyle, AIsInplace) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxCustomMemoViewData(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxCustomMemoProperties : public Cxtextedit::TcxCustomTextEditProperties 
{
	typedef Cxtextedit::TcxCustomTextEditProperties inherited;
	
private:
	Stdctrls::TScrollStyle FScrollBars;
	bool FWantReturns;
	bool FWantTabs;
	bool FWordWrap;
	Classes::TAlignment __fastcall GetAlignment(void);
	HIDESBASE bool __fastcall IsAlignmentStored(void);
	void __fastcall SetAlignment(Classes::TAlignment Value);
	void __fastcall SetScrollBars(Stdctrls::TScrollStyle Value);
	void __fastcall SetWantReturns(bool Value);
	void __fastcall SetWantTabs(bool Value);
	void __fastcall SetWordWrap(bool Value);
	
protected:
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewDataClass(TMetaClass* vmt);
	virtual bool __fastcall IsMultiLine(void);
	virtual bool __fastcall TabsNeed(void);
	__property Classes::TAlignment Alignment = {read=GetAlignment, write=SetAlignment, stored=IsAlignmentStored, nodefault};
	__property AutoSelect  = {default=0};
	__property Stdctrls::TScrollStyle ScrollBars = {read=FScrollBars, write=SetScrollBars, default=0};
	__property bool WantReturns = {read=FWantReturns, write=SetWantReturns, default=1};
	__property bool WantTabs = {read=FWantTabs, write=SetWantTabs, default=0};
	__property bool WordWrap = {read=FWordWrap, write=SetWordWrap, default=1};
	
public:
	__fastcall virtual TcxCustomMemoProperties(Classes::TPersistent* AOwner);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	/* virtual class method */ virtual TMetaClass* __fastcall GetContainerClass(TMetaClass* vmt);
	virtual WideString __fastcall GetDisplayText(const Variant &AEditValue, bool AFullText = false);
	virtual Cxdatautils::TcxDataEditValueSource __fastcall GetEditValueSource(bool AEditFocused);
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewInfoClass(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TcxCustomTextEditProperties.Destroy */ inline __fastcall virtual ~TcxCustomMemoProperties(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxMemoProperties;
class PASCALIMPLEMENTATION TcxMemoProperties : public TcxCustomMemoProperties 
{
	typedef TcxCustomMemoProperties inherited;
	
__published:
	__property Alignment ;
	__property AutoSelect  = {default=0};
	__property CharCase  = {default=0};
	__property HideSelection  = {default=1};
	__property MaxLength ;
	__property OEMConvert  = {default=0};
	__property ReadOnly ;
	__property ScrollBars  = {default=0};
	__property WantReturns  = {default=1};
	__property WantTabs  = {default=0};
	__property WordWrap  = {default=1};
	__property OnChange ;
	__property OnEditValueChanged ;
	__property OnValidate ;
public:
	#pragma option push -w-inl
	/* TcxCustomMemoProperties.Create */ inline __fastcall virtual TcxMemoProperties(Classes::TPersistent* AOwner) : TcxCustomMemoProperties(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomTextEditProperties.Destroy */ inline __fastcall virtual ~TcxMemoProperties(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomMemo;
class DELPHICLASS TcxCustomInnerMemo;
class PASCALIMPLEMENTATION TcxCustomMemo : public Cxtextedit::TcxCustomTextEdit 
{
	typedef Cxtextedit::TcxCustomTextEdit inherited;
	
private:
	bool FInternalAction;
	bool FScrollBarsCalculating;
	Classes::TStrings* __fastcall GetLines(void);
	TcxCustomInnerMemo* __fastcall GetInnerMemo(void);
	HIDESBASE TcxMemoProperties* __fastcall GetProperties(void);
	void __fastcall SetLines(Classes::TStrings* Value);
	HIDESBASE void __fastcall SetProperties(TcxMemoProperties* Value);
	void __fastcall UpdateScrollBarsParameters(void);
	HIDESBASE MESSAGE void __fastcall WMCommand(Messages::TWMCommand &Message);
	MESSAGE void __fastcall CMUpdateScrollBars(Messages::TMessage &Message);
	
protected:
	virtual void __fastcall AdjustInnerEditPosition(int AInnerEditHeight);
	virtual bool __fastcall CanKeyDownModifyEdit(Word Key, Classes::TShiftState Shift);
	virtual void __fastcall ChangeHandler(System::TObject* Sender);
	virtual void __fastcall DoEditKeyDown(Word &Key, Classes::TShiftState Shift);
	DYNAMIC void __fastcall FontChanged(void);
	virtual TMetaClass* __fastcall GetInnerEditClass(void);
	virtual void __fastcall InitializeViewData(Cxedit::TcxCustomEditViewData* AViewData);
	virtual bool __fastcall IsEditClass(void);
	DYNAMIC void __fastcall KeyDown(Word &Key, Classes::TShiftState Shift);
	virtual bool __fastcall NeedsScrollBars(void);
	virtual void __fastcall PropertiesChanged(System::TObject* Sender);
	virtual void __fastcall ReadState(Classes::TReader* Reader);
	virtual void __fastcall Scroll(Forms::TScrollBarKind AScrollBarKind, Stdctrls::TScrollCode AScrollCode, int &AScrollPos);
	virtual bool __fastcall SendActivationKey(char Key);
	virtual void __fastcall SetSelText(const AnsiString Value);
	virtual void __fastcall SetSize(void);
	virtual void __fastcall CreateParams(Controls::TCreateParams &Params);
	virtual void __fastcall WndProc(Messages::TMessage &Message);
	void __fastcall InternalSynchronizeEditValue(void);
	virtual void __fastcall SetScrollBarsParameters(void);
	__property TcxCustomInnerMemo* InnerMemo = {read=GetInnerMemo};
	__property TcxMemoProperties* Properties = {read=GetProperties, write=SetProperties};
	
public:
	__fastcall virtual TcxCustomMemo(Classes::TComponent* AOwner)/* overload */;
	virtual void __fastcall ClearSelection(void);
	virtual void __fastcall CutToClipboard(void);
	/* virtual class method */ virtual TMetaClass* __fastcall GetPropertiesClass(TMetaClass* vmt);
	__property Classes::TStrings* Lines = {read=GetLines, write=SetLines};
public:
	#pragma option push -w-inl
	/* TcxCustomTextEdit.Destroy */ inline __fastcall virtual ~TcxCustomMemo(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomMemo(HWND ParentWindow) : Cxtextedit::TcxCustomTextEdit(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxMemo;
class PASCALIMPLEMENTATION TcxMemo : public TcxCustomMemo 
{
	typedef TcxCustomMemo inherited;
	
__published:
	__property Align  = {default=0};
	__property Anchors  = {default=3};
	__property Constraints ;
	__property DragCursor  = {default=-12};
	__property DragKind  = {default=0};
	__property DragMode  = {default=0};
	__property Enabled  = {default=1};
	__property ImeMode  = {default=3};
	__property ImeName ;
	__property Lines ;
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
	/* TcxCustomMemo.Create */ inline __fastcall virtual TcxMemo(Classes::TComponent* AOwner)/* overload */ : TcxCustomMemo(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomTextEdit.Destroy */ inline __fastcall virtual ~TcxMemo(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxMemo(HWND ParentWindow) : TcxCustomMemo(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomInnerMemoHelper;
class PASCALIMPLEMENTATION TcxCustomInnerMemoHelper : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	TcxCustomInnerMemo* FEdit;
	
protected:
	__property TcxCustomInnerMemo* Edit = {read=FEdit};
	
public:
	__fastcall virtual TcxCustomInnerMemoHelper(TcxCustomInnerMemo* AEdit);
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
	/* TObject.Destroy */ inline __fastcall virtual ~TcxCustomInnerMemoHelper(void) { }
	#pragma option pop
	
};


#pragma pack(push, 1)
struct TcxMultiLineEditCharPosition
{
	int Line;
	int Col;
} ;
#pragma pack(pop)

#pragma pack(push, 1)
struct TcxInnerMemoSelectionState
{
	TcxMultiLineEditCharPosition CursorPosition;
	TcxMultiLineEditCharPosition SelectionStart;
	TcxMultiLineEditCharPosition SelectionEnd;
} ;
#pragma pack(pop)

class PASCALIMPLEMENTATION TcxCustomInnerMemo : public Stdctrls::TMemo 
{
	typedef Stdctrls::TMemo inherited;
	
private:
	bool FAutoSelect;
	Cxedit::TcxEditEchoMode FEchoMode;
	TcxCustomInnerMemoHelper* FHelper;
	bool FInternalUpdating;
	bool FIsCreating;
	int FLockBoundsCount;
	bool FInternalTextSetting;
	bool FResizing;
	TcxCustomMemo* __fastcall GetContainer(void);
	MESSAGE void __fastcall WMClear(void *Message);
	MESSAGE void __fastcall WMCut(void *Message);
	HIDESBASE MESSAGE void __fastcall WMEraseBkgnd(Messages::TWMEraseBkgnd &Message);
	HIDESBASE MESSAGE void __fastcall WMGetDlgCode(Messages::TWMNoParams &Message);
	HIDESBASE MESSAGE void __fastcall WMKeyDown(Messages::TWMKey &Message);
	HIDESBASE MESSAGE void __fastcall WMKillFocus(Messages::TWMKillFocus &Message);
	HIDESBASE MESSAGE void __fastcall WMNCPaint(Messages::TMessage &Message);
	MESSAGE void __fastcall WMPaste(void *Message);
	HIDESBASE MESSAGE void __fastcall WMSetFocus(Messages::TWMSetFocus &Message);
	HIDESBASE MESSAGE void __fastcall WMSetFont(Messages::TWMSetFont &Message);
	MESSAGE void __fastcall WMSetText(Messages::TWMSetText &Message);
	HIDESBASE MESSAGE void __fastcall WMWindowPosChanged(Messages::TWMWindowPosMsg &Message);
	HIDESBASE MESSAGE void __fastcall WMWindowPosChanging(Messages::TWMWindowPosMsg &Message);
	HIDESBASE MESSAGE void __fastcall CMMouseLeave(Messages::TMessage &Message);
	MESSAGE void __fastcall EMReplaceSel(Messages::TMessage &Message);
	
protected:
	DYNAMIC void __fastcall Click(void);
	DYNAMIC void __fastcall DblClick(void);
	DYNAMIC void __fastcall DoEnter(void);
	DYNAMIC void __fastcall DragOver(System::TObject* Source, int X, int Y, Controls::TDragState State, bool &Accept);
	DYNAMIC Menus::TPopupMenu* __fastcall GetPopupMenu(void);
	DYNAMIC void __fastcall KeyDown(Word &Key, Classes::TShiftState Shift);
	DYNAMIC void __fastcall KeyPress(char &Key);
	DYNAMIC void __fastcall KeyUp(Word &Key, Classes::TShiftState Shift);
	DYNAMIC void __fastcall MouseDown(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseLeave(Controls::TControl* AControl);
	DYNAMIC void __fastcall MouseMove(Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseUp(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall CreateHandle(void);
	virtual void __fastcall CreateParams(Controls::TCreateParams &Params);
	virtual void __fastcall CreateWindowHandle(const Controls::TCreateParams &Params);
	virtual void __fastcall WndProc(Messages::TMessage &Message);
	__property bool AutoSelect = {read=FAutoSelect, write=FAutoSelect, default=0};
	__property TcxCustomMemo* Container = {read=GetContainer};
	__property TcxCustomInnerMemoHelper* Helper = {read=FHelper};
	
public:
	__fastcall virtual TcxCustomInnerMemo(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxCustomInnerMemo(void);
	DYNAMIC void __fastcall DragDrop(System::TObject* Source, int X, int Y);
	DYNAMIC bool __fastcall ExecuteAction(Classes::TBasicAction* Action);
	DYNAMIC bool __fastcall UpdateAction(Classes::TBasicAction* Action);
	DYNAMIC bool __fastcall CanFocus(void);
	virtual void __fastcall SetBounds(int ALeft, int ATop, int AWidth, int AHeight);
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomInnerMemo(HWND ParentWindow) : Stdctrls::TMemo(ParentWindow) { }
	#pragma option pop
	
private:
	void *__IcxCustomInnerEdit;	/* Cxedit::IcxCustomInnerEdit */
	void *__IcxInnerTextEdit;	/* Cxtextedit::IcxInnerTextEdit */
	
public:
	operator IcxInnerTextEdit*(void) { return (IcxInnerTextEdit*)&__IcxInnerTextEdit; }
	operator IcxCustomInnerEdit*(void) { return (IcxCustomInnerEdit*)&__IcxCustomInnerEdit; }
	
};


//-- var, const, procedure ---------------------------------------------------
static const Word CM_UPDATESCROLLBARS = 0x8068;

}	/* namespace Cxmemo */
using namespace Cxmemo;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxMemo
