// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxFilterControl.pas' rev: 6.00

#ifndef cxFilterControlHPP
#define cxFilterControlHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxFormats.hpp>	// Pascal unit
#include <cxDataStorage.hpp>	// Pascal unit
#include <cxFilterControlUtils.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <cxTextEdit.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <cxDropDownEdit.hpp>	// Pascal unit
#include <cxLookAndFeelPainters.hpp>	// Pascal unit
#include <cxLookAndFeels.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxFilter.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Types.hpp>	// Pascal unit
#include <dxThemeManager.hpp>	// Pascal unit
#include <dxThemeConsts.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxfiltercontrol
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS EcxFilterControlError;
class PASCALIMPLEMENTATION EcxFilterControlError : public Sysutils::Exception 
{
	typedef Sysutils::Exception inherited;
	
public:
	#pragma option push -w-inl
	/* Exception.Create */ inline __fastcall EcxFilterControlError(const AnsiString Msg) : Sysutils::Exception(Msg) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateFmt */ inline __fastcall EcxFilterControlError(const AnsiString Msg, const System::TVarRec * Args, const int Args_Size) : Sysutils::Exception(Msg, Args, Args_Size) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateRes */ inline __fastcall EcxFilterControlError(int Ident)/* overload */ : Sysutils::Exception(Ident) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResFmt */ inline __fastcall EcxFilterControlError(int Ident, const System::TVarRec * Args, const int Args_Size)/* overload */ : Sysutils::Exception(Ident, Args, Args_Size) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateHelp */ inline __fastcall EcxFilterControlError(const AnsiString Msg, int AHelpContext) : Sysutils::Exception(Msg, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateFmtHelp */ inline __fastcall EcxFilterControlError(const AnsiString Msg, const System::TVarRec * Args, const int Args_Size, int AHelpContext) : Sysutils::Exception(Msg, Args, Args_Size, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResHelp */ inline __fastcall EcxFilterControlError(int Ident, int AHelpContext)/* overload */ : Sysutils::Exception(Ident, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResFmtHelp */ inline __fastcall EcxFilterControlError(System::PResStringRec ResStringRec, const System::TVarRec * Args, const int Args_Size, int AHelpContext)/* overload */ : Sysutils::Exception(ResStringRec, Args, Args_Size, AHelpContext) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~EcxFilterControlError(void) { }
	#pragma option pop
	
};


__interface IcxFilterControl;
typedef System::DelphiInterface<IcxFilterControl> _di_IcxFilterControl;
__interface INTERFACE_UUID("{B9890E09-5400-428D-8F72-1FF8FD15937C}") IcxFilterControl  : public IInterface 
{
	
public:
	virtual AnsiString __fastcall GetCaption(int Index) = 0 ;
	virtual int __fastcall GetCount(void) = 0 ;
	virtual Cxfilter::TcxFilterCriteria* __fastcall GetCriteria(void) = 0 ;
	virtual System::TObject* __fastcall GetItemLink(int Index) = 0 ;
	virtual AnsiString __fastcall GetFieldName(int Index) = 0 ;
	virtual Cxedit::TcxCustomEditProperties* __fastcall GetProperties(int Index) = 0 ;
	virtual TMetaClass* __fastcall GetValueType(int Index) = 0 ;
	__property AnsiString Captions[int Index] = {read=GetCaption};
	__property int Count = {read=GetCount};
	__property Cxfilter::TcxFilterCriteria* Criteria = {read=GetCriteria};
	__property System::TObject* ItemLinks[int Index] = {read=GetItemLink};
	__property AnsiString FieldNames[int Index] = {read=GetFieldName};
	__property Cxedit::TcxCustomEditProperties* Properties[int Index] = {read=GetProperties};
	__property TMetaClass* ValueTypes[int Index] = {read=GetValueType};
};

__interface IcxFilterControlDialog;
typedef System::DelphiInterface<IcxFilterControlDialog> _di_IcxFilterControlDialog;
__interface INTERFACE_UUID("{D2369F8D-3B22-41A8-881E-B01BEB624B7D}") IcxFilterControlDialog  : public IInterface 
{
	
public:
	virtual void __fastcall SetDialogLinkComponent(Classes::TComponent* ALink) = 0 ;
};

typedef TMetaClass*TcxCustomFilterControlClass;

typedef TMetaClass*TcxFilterControlViewInfoClass;

class DELPHICLASS TcxFilterControlCriteriaItem;
class PASCALIMPLEMENTATION TcxFilterControlCriteriaItem : public Cxfilter::TcxFilterCriteriaItem 
{
	typedef Cxfilter::TcxFilterCriteriaItem inherited;
	
private:
	_di_IcxFilterControl __fastcall GetFilter();
	int __fastcall GetItemIndex(void);
	bool __fastcall ValidItem(void);
	
protected:
	virtual Variant __fastcall GetDataValue(void * AData);
	virtual AnsiString __fastcall GetFieldCaption();
	virtual AnsiString __fastcall GetFieldName();
	virtual TMetaClass* __fastcall GetFilterOperatorClass(void);
	__property int ItemIndex = {read=GetItemIndex, nodefault};
	
public:
	__property _di_IcxFilterControl Filter = {read=GetFilter};
public:
	#pragma option push -w-inl
	/* TcxFilterCriteriaItem.Create */ inline __fastcall virtual TcxFilterControlCriteriaItem(Cxfilter::TcxFilterCriteriaItemList* AOwner, System::TObject* AItemLink, Cxfilter::TcxFilterOperatorKind AOperatorKind, const Variant &AValue, const AnsiString ADisplayValue) : Cxfilter::TcxFilterCriteriaItem(AOwner, AItemLink, AOperatorKind, AValue, ADisplayValue) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxFilterCriteriaItem.Destroy */ inline __fastcall virtual ~TcxFilterControlCriteriaItem(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFilterControlCriteria;
class DELPHICLASS TcxCustomFilterControl;
#pragma option push -b-
enum TcxFilterControlHitTest { fhtNone, fhtButton, fhtBoolOperator, fhtItem, fhtOperator, fhtValue, fhtAddCondition, fhtAddValue };
#pragma option pop

class DELPHICLASS TcxCustomRowViewInfo;
class DELPHICLASS TcxConditionViewInfo;
class DELPHICLASS TcxGroupViewInfo;
struct TcxFilterControlHitTestInfo;
class PASCALIMPLEMENTATION TcxCustomRowViewInfo : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	AnsiString FButtonText;
	#pragma pack(push, 1)
	Types::TRect FButtonRect;
	#pragma pack(pop)
	
	Cxlookandfeelpainters::TcxButtonState FButtonState;
	TcxCustomFilterControl* FControl;
	Cxfilter::TcxCustomFilterCriteriaItem* FCriteriaItem;
	int FLevel;
	int FIndent;
	TcxCustomRowViewInfo* FParent;
	#pragma pack(push, 1)
	Types::TRect FRowRect;
	#pragma pack(pop)
	
	TcxConditionViewInfo* __fastcall GetCondition(void);
	bool __fastcall GetFocused(void);
	TcxGroupViewInfo* __fastcall GetGroup(void);
	void __fastcall GetInternal(void);
	
protected:
	virtual int __fastcall GetWidth(void);
	bool __fastcall IsLast(void);
	
public:
	__fastcall virtual TcxCustomRowViewInfo(TcxCustomFilterControl* AControl, TcxCustomRowViewInfo* AParent, Cxfilter::TcxCustomFilterCriteriaItem* ACriteriaItem);
	__fastcall virtual ~TcxCustomRowViewInfo(void);
	virtual void __fastcall Calc(const Types::TRect &ARowRect);
	virtual void __fastcall GetHitTestInfo(const Types::TPoint &P, TcxFilterControlHitTestInfo &HitInfo);
	virtual bool __fastcall Ready(void);
	__property TcxGroupViewInfo* Group = {read=GetGroup};
	__property AnsiString ButtonText = {read=FButtonText, write=FButtonText};
	__property Types::TRect ButtonRect = {read=FButtonRect, write=FButtonRect};
	__property Cxlookandfeelpainters::TcxButtonState ButtonState = {read=FButtonState, write=FButtonState, nodefault};
	__property TcxConditionViewInfo* Condition = {read=GetCondition};
	__property TcxCustomFilterControl* Control = {read=FControl};
	__property bool Focused = {read=GetFocused, nodefault};
	__property int Level = {read=FLevel, nodefault};
	__property int Indent = {read=FIndent, nodefault};
	__property TcxCustomRowViewInfo* Parent = {read=FParent};
	__property Types::TRect RowRect = {read=FRowRect, write=FRowRect};
	__property int Width = {read=GetWidth, nodefault};
};


#pragma pack(push, 4)
struct TcxFilterControlHitTestInfo
{
	TcxFilterControlHitTest HitTest;
	Types::TPoint Mouse;
	Classes::TShiftState Shift;
	TcxCustomRowViewInfo* Row;
	int ValueIndex;
} ;
#pragma pack(pop)

#pragma option push -b-
enum TFilterControlState { fcsNormal, fcsSelectingAction, fcsSelectingItem, fcsSelectingBoolOperator, fcsSelectingCondition, fcsSelectingValue };
#pragma option pop

class DELPHICLASS TcxFilterControlViewInfo;
class DELPHICLASS TcxFilterControlPainter;
class PASCALIMPLEMENTATION TcxFilterControlPainter : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	TcxCustomFilterControl* FControl;
	Cxgraphics::TcxCanvas* __fastcall GetCanvas(void);
	TMetaClass* __fastcall GetPainter(void);
	TcxFilterControlViewInfo* __fastcall GetViewInfo(void);
	void __fastcall DrawGroup(TcxGroupViewInfo* ARow);
	void __fastcall DrawCondition(TcxConditionViewInfo* ARow);
	void __fastcall DrawValues(TcxConditionViewInfo* ARow);
	
protected:
	void __fastcall DrawBorder(void);
	void __fastcall DrawDotLine(const Types::TRect &R);
	virtual void __fastcall DrawRow(TcxCustomRowViewInfo* ARow);
	void __fastcall TextDraw(int X, int Y, const AnsiString AText);
	
public:
	__fastcall TcxFilterControlPainter(TcxCustomFilterControl* AOwner);
	__property TcxCustomFilterControl* Control = {read=FControl};
	__property Cxgraphics::TcxCanvas* Canvas = {read=GetCanvas};
	__property TMetaClass* Painter = {read=GetPainter};
	__property TcxFilterControlViewInfo* ViewInfo = {read=GetViewInfo};
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFilterControlPainter(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxFilterControlViewInfo : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	TcxCustomFilterControl* FControl;
	#pragma pack(push, 1)
	Types::TRect FAddConditionRect;
	#pragma pack(pop)
	
	AnsiString FAddConditionCaption;
	Graphics::TBitmap* FBitmap;
	Cxgraphics::TcxCanvas* FBitmapCanvas;
	Cxlookandfeelpainters::TcxButtonState FButtonState;
	#pragma pack(push, 1)
	Types::TRect FFocusRect;
	#pragma pack(pop)
	
	int FMaxRowWidth;
	TcxFilterControlPainter* FPainter;
	int FRowHeight;
	int FMinValueWidth;
	bool FEnabled;
	void __fastcall CalcButtonState(void);
	void __fastcall CheckBitmap(void);
	Cxgraphics::TcxCanvas* __fastcall GetCanvas(void);
	int __fastcall GetEditHeight(void);
	
protected:
	virtual void __fastcall CalcFocusRect(void);
	
public:
	__fastcall virtual TcxFilterControlViewInfo(TcxCustomFilterControl* AOwner);
	__fastcall virtual ~TcxFilterControlViewInfo(void);
	void __fastcall Calc(void);
	virtual void __fastcall GetHitTestInfo(Classes::TShiftState AShift, const Types::TPoint &P, TcxFilterControlHitTestInfo &HitInfo);
	void __fastcall Paint(void);
	void __fastcall InvalidateRow(TcxCustomRowViewInfo* ARow);
	void __fastcall Update(void);
	__property AnsiString AddConditionCaption = {read=FAddConditionCaption};
	__property Types::TRect AddConditionRect = {read=FAddConditionRect};
	__property Cxlookandfeelpainters::TcxButtonState ButtonState = {read=FButtonState, nodefault};
	__property Cxgraphics::TcxCanvas* Canvas = {read=GetCanvas};
	__property TcxCustomFilterControl* Control = {read=FControl};
	__property bool Enabled = {read=FEnabled, nodefault};
	__property int MaxRowWidth = {read=FMaxRowWidth, nodefault};
	__property int MinValueWidth = {read=FMinValueWidth, nodefault};
	__property TcxFilterControlPainter* Painter = {read=FPainter};
	__property int RowHeight = {read=FRowHeight, nodefault};
};


typedef TMetaClass*TcxFilterControlCriteriaClass;

#pragma option push -b-
enum TcxActivateValueEditKind { aveEnter, aveKey, aveMouse };
#pragma option pop

class PASCALIMPLEMENTATION TcxCustomFilterControl : public Cxcontrols::TcxControl 
{
	typedef Cxcontrols::TcxControl inherited;
	
private:
	Menus::TPopupMenu* FActionMenu;
	Cxdropdownedit::TcxComboBox* FComboBox;
	TcxFilterControlCriteria* FCriteria;
	TcxFilterControlHitTestInfo FFocused;
	Graphics::TFont* FFonts[4];
	TcxFilterControlHitTestInfo FHotTrack;
	Cxedit::TcxInplaceEditList* FInplaceEditors;
	int FLeftOffset;
	int FLockCount;
	TcxCustomRowViewInfo* FRoot;
	Classes::TList* FRows;
	TFilterControlState FState;
	Cxtextedit::TcxTextEditProperties* FTextEditProperties;
	int FTopVisibleRow;
	Cxedit::TcxCustomEdit* FValueEditor;
	Cxedit::TcxCustomEditStyle* FValueEditorStyle;
	TcxFilterControlViewInfo* FViewInfo;
	bool FHotTrackOnUnfocused;
	AnsiString FNullString;
	bool FShowLevelLines;
	bool FWantTabs;
	Classes::TNotifyEvent FOnApplyFilter;
	void __fastcall CreateFonts(void);
	void __fastcall DoFontChanged(System::TObject* Sender);
	Graphics::TFont* __fastcall GetFont(int Index);
	HIDESBASE bool __fastcall IsFontStored(int Index);
	HIDESBASE void __fastcall SetFont(int Index, const Graphics::TFont* Value);
	int __fastcall FocusedRowIndex(void);
	void __fastcall FormatChanged(void);
	TcxCustomRowViewInfo* __fastcall GetRow(int Index);
	int __fastcall GetRowCount(void);
	TcxCustomRowViewInfo* __fastcall GetFocusedRow(void);
	void __fastcall ComboBoxCloseUp(System::TObject* Sender);
	void __fastcall ComboBoxExit(System::TObject* Sender);
	void __fastcall ComboBoxKeyDown(System::TObject* Sender, Word &Key, Classes::TShiftState Shift);
	void __fastcall ComboBoxKeyPress(System::TObject* Sender, char &Key);
	void __fastcall ComboBoxPopup(System::TObject* Sender);
	void __fastcall DoComboDropDown(const Types::TRect &R, const AnsiString AText);
	void __fastcall FocusNext(bool ATab);
	void __fastcall FocusPrev(bool ATab);
	void __fastcall FocusUp(bool ATab);
	void __fastcall FocusDown(bool ATab);
	void __fastcall RowNavigate(TcxFilterControlHitTest AElement);
	void __fastcall SetFocusedRow(TcxCustomRowViewInfo* ARow);
	void __fastcall PopupMenuClick(System::TObject* Sender);
	void __fastcall DoLayoutChange(void);
	void __fastcall DoMouseLeave(void);
	bool __fastcall IsNullStringStored(void);
	void __fastcall ReadData(Classes::TStream* AStream);
	void __fastcall RecalcRows(void);
	void __fastcall RefreshMenuCaptions(void);
	void __fastcall SetLeftOffset(int Value);
	void __fastcall SetNullString(const AnsiString Value);
	void __fastcall SetTopVisibleRow(int Value);
	void __fastcall SetShowLevelLines(const bool Value);
	void __fastcall SetWantTabs(const bool Value);
	void __fastcall ValueEditorInit(void);
	void __fastcall ValueEditorHide(bool AAccept);
	void __fastcall ValueEditorAfterKeyDown(System::TObject* Sender, Word &Key, Classes::TShiftState Shift);
	void __fastcall ValueEditorExit(System::TObject* Sender);
	void __fastcall ValueEditorFocusChanged(System::TObject* Sender);
	void __fastcall ValueEditorKeyDown(System::TObject* Sender, Word &Key, Classes::TShiftState Shift);
	void __fastcall WriteData(Classes::TStream* AStream);
	
protected:
	virtual void __fastcall DefineProperties(Classes::TFiler* Filer);
	DYNAMIC void __fastcall KeyDown(Word &Key, Classes::TShiftState Shift);
	DYNAMIC void __fastcall KeyPress(char &Key);
	virtual void __fastcall Loaded(void);
	DYNAMIC void __fastcall MouseDown(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseMove(Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall SetEnabled(bool Value);
	virtual void __fastcall SetParent(Controls::TWinControl* AParent);
	DYNAMIC void __fastcall BoundsChanged(void);
	DYNAMIC void __fastcall FocusChanged(void);
	DYNAMIC void __fastcall FontChanged(void);
	virtual int __fastcall GetBorderSize(void);
	virtual void __fastcall InitControl(void);
	virtual void __fastcall InitScrollBarsParameters(void);
	virtual void __fastcall LookAndFeelChanged(Cxlookandfeels::TcxLookAndFeel* Sender, Cxlookandfeels::TcxLookAndFeelValues AChangedValues);
	DYNAMIC void __fastcall MouseEnter(Controls::TControl* AControl);
	DYNAMIC void __fastcall MouseLeave(Controls::TControl* AControl);
	virtual void __fastcall Scroll(Forms::TScrollBarKind AScrollBarKind, Stdctrls::TScrollCode AScrollCode, int &AScrollPos);
	void __fastcall AddCondition(TcxCustomRowViewInfo* ARow);
	void __fastcall AddGroup(void);
	void __fastcall AddValue(void);
	void __fastcall ClearRows(void);
	HIDESBASE void __fastcall Remove(void);
	void __fastcall RemoveRow(void);
	void __fastcall RemoveValue(void);
	void __fastcall EnsureRowVisible(void);
	void __fastcall LayoutChanged(void);
	void __fastcall RefreshProperties(void);
	void __fastcall BuildFromCriteria(void);
	void __fastcall BuildFromRows(void);
	virtual void __fastcall CreateInternalControls(void);
	virtual void __fastcall DestroyInternalControls(void);
	virtual void __fastcall DoApplyFilter(void);
	virtual Cxedit::TcxCustomEditProperties* __fastcall GetDefaultProperties(void);
	Cxedit::TcxCustomEditViewInfo* __fastcall GetDefaultPropertiesViewInfo(void);
	virtual TMetaClass* __fastcall GetFilterControlCriteriaClass(void);
	virtual TMetaClass* __fastcall GetViewInfoClass(void);
	bool __fastcall HasFocus(void);
	bool __fastcall HasHotTrack(void);
	virtual void __fastcall FillFilterItemList(Classes::TStrings* AStrings);
	virtual void __fastcall FillConditionList(Classes::TStrings* AStrings);
	virtual void __fastcall CorrectOperatorClass(TMetaClass* &AOperatorClass);
	virtual AnsiString __fastcall GetFilterCaption();
	virtual _di_IcxFilterControl __fastcall GetFilterLink();
	virtual AnsiString __fastcall GetFilterText();
	virtual void __fastcall SelectAction(void);
	virtual void __fastcall SelectBoolOperator(void);
	virtual void __fastcall SelectCondition(void);
	virtual void __fastcall SelectItem(void);
	virtual void __fastcall SelectValue(TcxActivateValueEditKind AActivateKind, char AKey);
	__property TcxFilterControlCriteria* Criteria = {read=FCriteria};
	__property _di_IcxFilterControl FilterLink = {read=GetFilterLink};
	__property TcxCustomRowViewInfo* FocusedRow = {read=GetFocusedRow, write=SetFocusedRow};
	__property int LeftOffset = {read=FLeftOffset, write=SetLeftOffset, nodefault};
	__property AnsiString NullString = {read=FNullString, write=SetNullString, stored=IsNullStringStored};
	__property int RowCount = {read=GetRowCount, nodefault};
	__property TcxCustomRowViewInfo* Rows[int Index] = {read=GetRow};
	__property TFilterControlState State = {read=FState, write=FState, nodefault};
	__property int TopVisibleRow = {read=FTopVisibleRow, write=SetTopVisibleRow, nodefault};
	__property TcxFilterControlViewInfo* ViewInfo = {read=FViewInfo};
	
public:
	__fastcall virtual TcxCustomFilterControl(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxCustomFilterControl(void);
	void __fastcall ApplyFilter(void);
	void __fastcall BeginUpdate(void);
	virtual void __fastcall Clear(void);
	void __fastcall EndUpdate(void);
	virtual bool __fastcall IsValid(void);
	bool __fastcall HasItems(void);
	void __fastcall Localize(void);
	virtual void __fastcall Paint(void);
	void __fastcall LoadFromStream(Classes::TStream* AStream);
	void __fastcall SaveToStream(Classes::TStream* AStream);
	void __fastcall LoadFromFile(const AnsiString AFileName);
	void __fastcall SaveToFile(const AnsiString AFileName);
	__property Color  = {default=-2147483633};
	__property AnsiString FilterCaption = {read=GetFilterCaption};
	__property AnsiString FilterText = {read=GetFilterText};
	__property Graphics::TFont* FontBoolOperator = {read=GetFont, write=SetFont, stored=IsFontStored, index=0};
	__property Graphics::TFont* FontCondition = {read=GetFont, write=SetFont, stored=IsFontStored, index=2};
	__property Graphics::TFont* FontItem = {read=GetFont, write=SetFont, stored=IsFontStored, index=1};
	__property Graphics::TFont* FontValue = {read=GetFont, write=SetFont, stored=IsFontStored, index=3};
	__property bool HotTrackOnUnfocused = {read=FHotTrackOnUnfocused, write=FHotTrackOnUnfocused, default=1};
	__property ParentColor  = {default=0};
	__property bool ShowLevelLines = {read=FShowLevelLines, write=SetShowLevelLines, default=1};
	__property bool WantTabs = {read=FWantTabs, write=SetWantTabs, default=0};
	__property Classes::TNotifyEvent OnApplyFilter = {read=FOnApplyFilter, write=FOnApplyFilter};
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomFilterControl(HWND ParentWindow) : Cxcontrols::TcxControl(ParentWindow) { }
	#pragma option pop
	
private:
	void *__IcxMouseTrackingCaller;	/* Cxcontrols::IcxMouseTrackingCaller [MouseLeave=DoMouseLeave] */
	void *__IcxFormatContollerListener;	/* Cxformats::IcxFormatContollerListener */
	
public:
	operator IcxFormatContollerListener*(void) { return (IcxFormatContollerListener*)&__IcxFormatContollerListener; }
	operator IcxMouseTrackingCaller*(void) { return (IcxMouseTrackingCaller*)&__IcxMouseTrackingCaller; }
	
};


class PASCALIMPLEMENTATION TcxFilterControlCriteria : public Cxfilter::TcxFilterCriteria 
{
	typedef Cxfilter::TcxFilterCriteria inherited;
	
private:
	TcxCustomFilterControl* FControl;
	
protected:
	virtual int __fastcall GetIDByItemLink(System::TObject* AItemLink);
	virtual TMetaClass* __fastcall GetItemClass(void);
	virtual System::TObject* __fastcall GetItemLinkByID(int AID);
	__property TcxCustomFilterControl* Control = {read=FControl};
	
public:
	__fastcall virtual TcxFilterControlCriteria(TcxCustomFilterControl* AOwner);
	virtual void __fastcall AssignEvents(Classes::TPersistent* Source);
public:
	#pragma option push -w-inl
	/* TcxFilterCriteria.Destroy */ inline __fastcall virtual ~TcxFilterControlCriteria(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxGroupViewInfo : public TcxCustomRowViewInfo 
{
	typedef TcxCustomRowViewInfo inherited;
	
private:
	Cxfilter::TcxFilterBoolOperatorKind FBoolOperator;
	AnsiString FBoolOperatorText;
	#pragma pack(push, 1)
	Types::TRect FBoolOperatorRect;
	#pragma pack(pop)
	
	AnsiString FCaption;
	#pragma pack(push, 1)
	Types::TRect FCaptionRect;
	#pragma pack(pop)
	
	Classes::TList* FRows;
	TcxCustomRowViewInfo* __fastcall GetRow(int Index);
	int __fastcall GetRowCount(void);
	void __fastcall SetRow(int Index, const TcxCustomRowViewInfo* Value);
	
protected:
	virtual int __fastcall GetWidth(void);
	
public:
	__fastcall virtual TcxGroupViewInfo(TcxCustomFilterControl* AControl, TcxCustomRowViewInfo* AParent, Cxfilter::TcxCustomFilterCriteriaItem* ACriteriaItem);
	__fastcall virtual ~TcxGroupViewInfo(void);
	void __fastcall Add(TcxCustomRowViewInfo* ARow);
	void __fastcall Remove(TcxCustomRowViewInfo* ARow);
	virtual void __fastcall Calc(const Types::TRect &ARowRect);
	virtual void __fastcall GetHitTestInfo(const Types::TPoint &P, TcxFilterControlHitTestInfo &HitInfo);
	__property Cxfilter::TcxFilterBoolOperatorKind BoolOperator = {read=FBoolOperator, write=FBoolOperator, nodefault};
	__property AnsiString BoolOperatorText = {read=FBoolOperatorText, write=FBoolOperatorText};
	__property Types::TRect BoolOperatorRect = {read=FBoolOperatorRect};
	__property AnsiString Caption = {read=FCaption, write=FCaption};
	__property Types::TRect CaptionRect = {read=FCaptionRect};
	__property int RowCount = {read=GetRowCount, nodefault};
	__property TcxCustomRowViewInfo* Rows[int Index] = {read=GetRow, write=SetRow};
};


class DELPHICLASS TcxValueInfo;
class PASCALIMPLEMENTATION TcxValueInfo : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	Variant FValue;
	AnsiString FValueText;
	#pragma pack(push, 1)
	Types::TRect FValueRect;
	#pragma pack(pop)
	
	Cxedit::TcxCustomEditViewInfo* FValueViewInfo;
	void __fastcall SetValueViewInfo(const Cxedit::TcxCustomEditViewInfo* Value);
	
public:
	__fastcall TcxValueInfo(void);
	__fastcall virtual ~TcxValueInfo(void);
	__property Variant Value = {read=FValue, write=FValue};
	__property AnsiString ValueText = {read=FValueText, write=FValueText};
	__property Types::TRect ValueRect = {read=FValueRect, write=FValueRect};
	__property Cxedit::TcxCustomEditViewInfo* ValueViewInfo = {read=FValueViewInfo, write=SetValueViewInfo};
};


class DELPHICLASS TcxValuesViewInfo;
class PASCALIMPLEMENTATION TcxValuesViewInfo : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	TcxValueInfo* operator[](int Index) { return Values[Index]; }
	
private:
	#pragma pack(push, 1)
	Types::TRect FAddButtonRect;
	#pragma pack(pop)
	
	Cxlookandfeelpainters::TcxButtonState FAddButtonState;
	TcxConditionViewInfo* FCondition;
	Classes::TList* FList;
	AnsiString FSeparator;
	TcxCustomFilterControl* __fastcall GetControl(void);
	TcxValueInfo* __fastcall GetValue(int Index);
	int __fastcall GetWidth(void);
	
protected:
	int __fastcall GetCount(void);
	
public:
	__fastcall TcxValuesViewInfo(TcxConditionViewInfo* ACondition);
	__fastcall virtual ~TcxValuesViewInfo(void);
	void __fastcall AddValue(void);
	void __fastcall Calc(void);
	void __fastcall Clear(void);
	virtual void __fastcall GetHitTestInfo(const Types::TPoint &P, TcxFilterControlHitTestInfo &HitInfo);
	void __fastcall RemoveValue(int AIndex);
	__property Types::TRect AddButtonRect = {read=FAddButtonRect};
	__property Cxlookandfeelpainters::TcxButtonState AddButtonState = {read=FAddButtonState, nodefault};
	__property TcxConditionViewInfo* Condition = {read=FCondition};
	__property TcxCustomFilterControl* Control = {read=GetControl};
	__property int Count = {read=GetCount, nodefault};
	__property AnsiString Separator = {read=FSeparator};
	__property TcxValueInfo* Values[int Index] = {read=GetValue/*, default*/};
	__property int Width = {read=GetWidth, nodefault};
};


class PASCALIMPLEMENTATION TcxConditionViewInfo : public TcxCustomRowViewInfo 
{
	typedef TcxCustomRowViewInfo inherited;
	
private:
	Cxfiltercontrolutils::TcxFilterControlOperator FOperator;
	#pragma pack(push, 1)
	Types::TRect FOperatorRect;
	#pragma pack(pop)
	
	AnsiString FOperatorText;
	int FItemIndex;
	System::TObject* FItemLink;
	#pragma pack(push, 1)
	Types::TRect FItemRect;
	#pragma pack(pop)
	
	AnsiString FItemText;
	TMetaClass*FEditorHelper;
	Cxedit::TcxCustomEditProperties* FEditorProperties;
	Cxfiltercontrolutils::TcxFilterControlOperators FSupportedOperators;
	TMetaClass*FValueType;
	TcxValuesViewInfo* FValues;
	int __fastcall GetItemIndex(void);
	
protected:
	Cxedit::TcxCustomEditData* ValueEditorData;
	void __fastcall AddValue(void);
	virtual int __fastcall GetWidth(void);
	virtual bool __fastcall HasDisplayValues(void);
	void __fastcall InitValues(bool ASaveValue);
	void __fastcall InternalInit(void);
	void __fastcall SetItem(int AIndex);
	
public:
	__fastcall virtual TcxConditionViewInfo(TcxCustomFilterControl* AControl, TcxCustomRowViewInfo* AParent, Cxfilter::TcxCustomFilterCriteriaItem* ACriteriaItem);
	__fastcall virtual ~TcxConditionViewInfo(void);
	virtual void __fastcall Calc(const Types::TRect &ARowRect);
	virtual void __fastcall GetHitTestInfo(const Types::TPoint &P, TcxFilterControlHitTestInfo &HitInfo);
	Cxedit::TcxCustomEditProperties* __fastcall GetProperties(void);
	virtual bool __fastcall Ready(void);
	__property TMetaClass* EditorHelper = {read=FEditorHelper};
	__property Cxedit::TcxCustomEditProperties* EditorProperties = {read=FEditorProperties};
	__property System::TObject* ItemLink = {read=FItemLink};
	__property int ItemIndex = {read=FItemIndex, nodefault};
	__property Types::TRect ItemRect = {read=FItemRect};
	__property AnsiString ItemText = {read=FItemText, write=FItemText};
	__property Cxfiltercontrolutils::TcxFilterControlOperator Operator = {read=FOperator, write=FOperator, nodefault};
	__property Types::TRect OperatorRect = {read=FOperatorRect};
	__property AnsiString OperatorText = {read=FOperatorText, write=FOperatorText};
	__property Cxfiltercontrolutils::TcxFilterControlOperators SupportedOperators = {read=FSupportedOperators, nodefault};
	__property TMetaClass* ValueType = {read=FValueType};
	__property TcxValuesViewInfo* Values = {read=FValues};
};


#pragma option push -b-
enum TcxFilterControlFont { fcfBoolOperator, fcfItem, fcfCondition, fcfValue };
#pragma option pop

class DELPHICLASS TcxFilterControl;
class PASCALIMPLEMENTATION TcxFilterControl : public TcxCustomFilterControl 
{
	typedef TcxCustomFilterControl inherited;
	
private:
	Classes::TComponent* FLinkComponent;
	Classes::TComponent* __fastcall GetLinkComponent(void);
	void __fastcall SetLinkComponent(Classes::TComponent* Value);
	
protected:
	virtual _di_IcxFilterControl __fastcall GetFilterLink();
	
public:
	void __fastcall UpdateFilter(void);
	
__published:
	__property Align  = {default=0};
	__property Anchors  = {default=3};
	__property Color  = {default=-2147483633};
	__property DragCursor  = {default=-12};
	__property DragKind  = {default=0};
	__property DragMode  = {default=0};
	__property Enabled  = {default=1};
	__property Font ;
	__property FontBoolOperator ;
	__property FontCondition ;
	__property FontItem ;
	__property FontValue ;
	__property HelpContext  = {default=0};
	__property HelpKeyword ;
	__property HelpType  = {default=1};
	__property Hint ;
	__property HotTrackOnUnfocused  = {default=1};
	__property Classes::TComponent* LinkComponent = {read=GetLinkComponent, write=SetLinkComponent};
	__property LookAndFeel ;
	__property NullString ;
	__property ParentColor  = {default=0};
	__property ParentFont  = {default=1};
	__property ParentShowHint  = {default=1};
	__property PopupMenu ;
	__property ShowHint ;
	__property ShowLevelLines  = {default=1};
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=0};
	__property Visible  = {default=1};
	__property WantTabs  = {default=0};
	__property OnApplyFilter ;
	__property OnClick ;
	__property OnContextPopup ;
	__property OnDragDrop ;
	__property OnDragOver ;
	__property OnEndDock ;
	__property OnEndDrag ;
	__property OnEnter ;
	__property OnExit ;
	__property OnKeyDown ;
	__property OnKeyPress ;
	__property OnKeyUp ;
	__property OnMouseDown ;
	__property OnMouseMove ;
	__property OnMouseUp ;
	__property OnStartDock ;
	__property OnStartDrag ;
public:
	#pragma option push -w-inl
	/* TcxCustomFilterControl.Create */ inline __fastcall virtual TcxFilterControl(Classes::TComponent* AOwner) : TcxCustomFilterControl(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomFilterControl.Destroy */ inline __fastcall virtual ~TcxFilterControl(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxFilterControl(HWND ParentWindow) : TcxCustomFilterControl(ParentWindow) { }
	#pragma option pop
	
private:
	void *__IcxFilterControlDialog;	/* Cxfiltercontrol::IcxFilterControlDialog [SetDialogLinkComponent=SetLinkComponent] */
	
public:
	operator IcxFilterControlDialog*(void) { return (IcxFilterControlDialog*)&__IcxFilterControlDialog; }
	
};


//-- var, const, procedure ---------------------------------------------------
static const Shortint cxFilterControlMaxDropDownRows = 0xc;
extern PACKAGE AnsiString __fastcall cxGetConditionText(Cxfiltercontrolutils::TcxFilterControlOperator AOperator);
extern PACKAGE bool __fastcall IsSupportFiltering(TMetaClass* AClass);

}	/* namespace Cxfiltercontrol */
using namespace Cxfiltercontrol;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxFilterControl
