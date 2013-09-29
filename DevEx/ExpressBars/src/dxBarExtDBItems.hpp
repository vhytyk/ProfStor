// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'dxBarExtDBItems.pas' rev: 6.00

#ifndef dxBarExtDBItemsHPP
#define dxBarExtDBItemsHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <dxBar.hpp>	// Pascal unit
#include <dxCommon.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <DB.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Dxbarextdbitems
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TdxBarLookupLink;
class DELPHICLASS TdxBarLookupCombo;
class DELPHICLASS TdxBarPopupLookupControl;
class DELPHICLASS TdxBarPopupLookupLink;
class PASCALIMPLEMENTATION TdxBarPopupLookupLink : public Db::TDataLink 
{
	typedef Db::TDataLink inherited;
	
private:
	TdxBarPopupLookupControl* FBarPopupLookup;
	
protected:
	virtual void __fastcall ActiveChanged(void);
	virtual void __fastcall DataSetChanged(void);
	virtual void __fastcall LayoutChanged(void);
	virtual void __fastcall DataSetScrolled(int Distance);
public:
	#pragma option push -w-inl
	/* TDataLink.Create */ inline __fastcall TdxBarPopupLookupLink(void) : Db::TDataLink() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TDataLink.Destroy */ inline __fastcall virtual ~TdxBarPopupLookupLink(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TdxBarPopupLookupControl : public Controls::TCustomControl 
{
	typedef Controls::TCustomControl inherited;
	
private:
	TdxBarPopupLookupLink* FListLink;
	AnsiString FListFieldName;
	int FListFieldIndex;
	Db::TField* FListField;
	Classes::TList* FListFields;
	bool FListActive;
	int FRecordIndex;
	int FRecordCount;
	int FRowCount;
	bool FTracking;
	bool FTimerActive;
	int FMousePos;
	AnsiString FSelectedItem;
	int FHScrollWidth;
	int FVScrollWidth;
	bool FCloseBtnDown;
	bool FCloseBtnPaint;
	int FComboTop;
	TdxBarLookupCombo* FCombo;
	Dxcommon::TdxCorner FCorner;
	#pragma pack(push, 1)
	Types::TRect FCloseButtonRect;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect FGripRect;
	#pragma pack(pop)
	
	bool FCloseButtonIsTracking;
	bool FMouseAboveCloseButton;
	Db::TDataSource* __fastcall GetListSource(void);
	void __fastcall SetListFieldName(const AnsiString Value);
	void __fastcall SetListSource(Db::TDataSource* Value);
	void __fastcall SelectCurrent(void);
	void __fastcall SelectItemAt(int X, int Y);
	void __fastcall SetRowCount(int Value);
	void __fastcall StopTimer(void);
	void __fastcall StopTracking(void);
	void __fastcall TimerScroll(void);
	void __fastcall UpdateScrollBar(void);
	HIDESBASE MESSAGE void __fastcall WMCancelMode(Messages::TMessage &Message);
	MESSAGE void __fastcall WMCaptureChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMEraseBkgnd(Messages::TWMEraseBkgnd &Message);
	MESSAGE void __fastcall WMGetDlgCode(Messages::TMessage &Message);
	MESSAGE void __fastcall WMGetMinMaxInfo(Messages::TWMGetMinMaxInfo &Message);
	HIDESBASE MESSAGE void __fastcall WMLButtonUp(Messages::TWMMouse &Message);
	HIDESBASE MESSAGE void __fastcall WMNCCalcSize(Messages::TWMNCCalcSize &Message);
	HIDESBASE MESSAGE void __fastcall WMNCHitTest(Messages::TWMNCHitTest &Message);
	HIDESBASE MESSAGE void __fastcall WMNCLButtonDown(Messages::TWMNCHitMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMNCPaint(Messages::TWMNCPaint &Message);
	HIDESBASE MESSAGE void __fastcall WMSize(Messages::TWMSize &Message);
	MESSAGE void __fastcall WMTimer(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMVScroll(Messages::TWMScroll &Message);
	HIDESBASE MESSAGE void __fastcall WMWindowPosChanging(Messages::TWMWindowPosMsg &Message);
	HIDESBASE MESSAGE void __fastcall CMMouseLeave(Messages::TMessage &Message);
	
protected:
	virtual void __fastcall CreateParams(Controls::TCreateParams &Params);
	virtual void __fastcall CreateWnd(void);
	DYNAMIC void __fastcall DblClick(void);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	DYNAMIC void __fastcall KeyDown(Word &Key, Classes::TShiftState Shift);
	void __fastcall ListLinkDataChanged(void);
	DYNAMIC void __fastcall MouseDown(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseMove(Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseUp(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall Paint(void);
	int __fastcall GetTextHeight(void);
	void __fastcall UpdateListFields(void);
	__property AnsiString ListField = {read=FListFieldName, write=SetListFieldName};
	__property int ListFieldIndex = {read=FListFieldIndex, write=FListFieldIndex, default=0};
	__property Classes::TList* ListFields = {read=FListFields};
	__property TdxBarPopupLookupLink* ListLink = {read=FListLink};
	__property Db::TDataSource* ListSource = {read=GetListSource, write=SetListSource};
	
public:
	bool IsPopup;
	__fastcall virtual TdxBarPopupLookupControl(Classes::TComponent* AOwner);
	__fastcall virtual ~TdxBarPopupLookupControl(void);
	__property int ComboTop = {read=FComboTop, write=FComboTop, nodefault};
	__property int RowCount = {read=FRowCount, write=SetRowCount, stored=false, nodefault};
	__property AnsiString SelectedItem = {read=FSelectedItem};
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TdxBarPopupLookupControl(HWND ParentWindow) : Controls::TCustomControl(ParentWindow) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TdxBarLookupCombo : public Dxbar::TCustomdxBarCombo 
{
	typedef Dxbar::TCustomdxBarCombo inherited;
	
private:
	bool FAllowResizing;
	Variant FCurKeyValue;
	TdxBarLookupLink* FListLink;
	TdxBarPopupLookupControl* FPopupList;
	AnsiString FKeyFieldName;
	AnsiString FListFieldName;
	int FListFieldIndex;
	Db::TField* FKeyField;
	Db::TField* FListField;
	Classes::TList* FListFields;
	Variant FKeyValue;
	bool FSetValue;
	bool FListActive;
	Graphics::TColor FColor;
	bool FImmediateDropDown;
	int FPopupWidth;
	int FRowCount;
	bool FListVisible;
	bool FFindSelection;
	AnsiString FFindStr;
	Stdctrls::TEdit* FLocateEdit;
	TdxBarPopupLookupControl* FLocateList;
	Classes::TNotifyEvent FOnKeyValueChange;
	Forms::TForm* FForm;
	Stdctrls::TButton* ButtonOk;
	Stdctrls::TButton* ButtonCancel;
	Db::TDataSource* __fastcall GetListSource(void);
	void __fastcall SetKeyFieldName(const AnsiString Value);
	void __fastcall SetKeyValue(const Variant &Value);
	void __fastcall SetListFieldIndex(int Value);
	void __fastcall SetListFieldName(const AnsiString Value);
	void __fastcall SetListSource(Db::TDataSource* Value);
	void __fastcall SetRowCount(int Value);
	int __fastcall GetEditHandle(void);
	AnsiString __fastcall GetEditText();
	void __fastcall SetEditText(AnsiString AText);
	void __fastcall DoKeyPress(System::TObject* Sender, char &Key);
	void __fastcall DoKeyDown(System::TObject* Sender, Word &Key, Classes::TShiftState Shift);
	void __fastcall FormSize(System::TObject* Sender);
	
protected:
	DYNAMIC void __fastcall CloseUp(void);
	DYNAMIC void __fastcall DoEnter(void);
	DYNAMIC void __fastcall DropDown(int X, int Y);
	virtual HWND __fastcall GetDropDownWindow(void);
	virtual bool __fastcall CheckKeyForDropDownWindow(Word Key, Classes::TShiftState Shift);
	DYNAMIC void __fastcall KeyDown(Word &Key, Classes::TShiftState Shift);
	DYNAMIC void __fastcall KeyPress(char &Key);
	void __fastcall UpdateListFields(void);
	void __fastcall ListLinkDataChanged(void);
	void __fastcall KeyValueChanged(void);
	bool __fastcall LocateKey(void);
	void __fastcall ResetFindStr(void);
	__property AnsiString EditText = {read=GetEditText, write=SetEditText};
	__property Classes::TList* ListFields = {read=FListFields};
	__property TdxBarLookupLink* ListLink = {read=FListLink};
	
public:
	__fastcall virtual TdxBarLookupCombo(Classes::TComponent* AOwner);
	__fastcall virtual ~TdxBarLookupCombo(void);
	DYNAMIC void __fastcall DoClick(void);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	__property Variant KeyValue = {read=FKeyValue, write=SetKeyValue};
	
__published:
	__property bool AllowResizing = {read=FAllowResizing, write=FAllowResizing, default=1};
	__property Graphics::TColor Color = {read=FColor, write=FColor, default=-2147483643};
	__property bool ImmediateDropDown = {read=FImmediateDropDown, write=FImmediateDropDown, default=0};
	__property AnsiString KeyField = {read=FKeyFieldName, write=SetKeyFieldName};
	__property AnsiString ListField = {read=FListFieldName, write=SetListFieldName};
	__property int ListFieldIndex = {read=FListFieldIndex, write=SetListFieldIndex, default=0};
	__property Db::TDataSource* ListSource = {read=GetListSource, write=SetListSource};
	__property int RowCount = {read=FRowCount, write=SetRowCount, nodefault};
	__property Text  = {stored=false};
	__property int PopupWidth = {read=FPopupWidth, write=FPopupWidth, default=0};
	__property Classes::TNotifyEvent OnKeyValueChange = {read=FOnKeyValueChange, write=FOnKeyValueChange};
};


class PASCALIMPLEMENTATION TdxBarLookupLink : public Db::TDataLink 
{
	typedef Db::TDataLink inherited;
	
private:
	TdxBarLookupCombo* FBarLookupCombo;
	
protected:
	virtual void __fastcall ActiveChanged(void);
	virtual void __fastcall DataSetChanged(void);
	virtual void __fastcall LayoutChanged(void);
public:
	#pragma option push -w-inl
	/* TDataLink.Create */ inline __fastcall TdxBarLookupLink(void) : Db::TDataLink() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TDataLink.Destroy */ inline __fastcall virtual ~TdxBarLookupLink(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxBarLookupComboControl;
class PASCALIMPLEMENTATION TdxBarLookupComboControl : public Dxbar::TCustomdxBarComboControl 
{
	typedef Dxbar::TCustomdxBarComboControl inherited;
	
protected:
	virtual void __fastcall SetFocused(bool Value);
	virtual void __fastcall WndProc(Messages::TMessage &Message);
public:
	#pragma option push -w-inl
	/* TdxBarWinControl.Create */ inline __fastcall virtual TdxBarLookupComboControl(Dxbar::TdxBarItemLink* AItemLink) : Dxbar::TCustomdxBarComboControl(AItemLink) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TdxBarWinControl.Destroy */ inline __fastcall virtual ~TdxBarLookupComboControl(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Dxbarextdbitems */
using namespace Dxbarextdbitems;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// dxBarExtDBItems
