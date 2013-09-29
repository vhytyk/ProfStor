// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxMCListBox.pas' rev: 6.00

#ifndef cxMCListBoxHPP
#define cxMCListBoxHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Menus.hpp>	// Pascal unit
#include <cxExtEditUtils.hpp>	// Pascal unit
#include <cxLookAndFeelPainters.hpp>	// Pascal unit
#include <cxHeader.hpp>	// Pascal unit
#include <cxScrollBar.hpp>	// Pascal unit
#include <cxLookAndFeels.hpp>	// Pascal unit
#include <cxDataUtils.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxExtEditConsts.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <ImgList.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxmclistbox
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxMCInnerHeader;
class DELPHICLASS TcxMCListBox;
class PASCALIMPLEMENTATION TcxMCInnerHeader : public Cxheader::TcxHeader 
{
	typedef Cxheader::TcxHeader inherited;
	
private:
	Cxcontainer::TcxContainer* FContainer;
	Cxcontainer::TcxContainer* __fastcall GetControlContainer(void);
	HIDESBASE Controls::TWinControl* __fastcall GetControl(void);
	TcxMCListBox* __fastcall GetContainer(void);
	
protected:
	DYNAMIC void __fastcall Click(void);
	__property TcxMCListBox* Container = {read=GetContainer};
	
public:
	DYNAMIC bool __fastcall ExecuteAction(Classes::TBasicAction* Action);
	DYNAMIC bool __fastcall UpdateAction(Classes::TBasicAction* Action);
	DYNAMIC bool __fastcall CanFocus(void);
public:
	#pragma option push -w-inl
	/* TcxCustomHeader.Create */ inline __fastcall virtual TcxMCInnerHeader(Classes::TComponent* AOwner) : Cxheader::TcxHeader(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomHeader.Destroy */ inline __fastcall virtual ~TcxMCInnerHeader(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxMCInnerHeader(HWND ParentWindow) : Cxheader::TcxHeader(ParentWindow) { }
	#pragma option pop
	
private:
	void *__IcxContainerInnerControl;	/* Cxcontainer::IcxContainerInnerControl */
	
public:
	operator IcxContainerInnerControl*(void) { return (IcxContainerInnerControl*)&__IcxContainerInnerControl; }
	
};


class DELPHICLASS TcxMCInnerListBox;
class PASCALIMPLEMENTATION TcxMCInnerListBox : public Cxcontainer::TcxCustomInnerListBox 
{
	typedef Cxcontainer::TcxCustomInnerListBox inherited;
	
private:
	TcxMCListBox* __fastcall GetContainer(void);
	HIDESBASE MESSAGE void __fastcall WMPaint(Messages::TWMPaint &Message);
	
protected:
	__property TcxMCListBox* Container = {read=GetContainer};
	DYNAMIC void __fastcall Click(void);
	virtual void __fastcall RecalcItemRects(void);
	virtual void __fastcall DrawLines(void);
	virtual void __fastcall FullRepaint(void);
	
public:
	DYNAMIC bool __fastcall ExecuteAction(Classes::TBasicAction* Action);
	DYNAMIC bool __fastcall UpdateAction(Classes::TBasicAction* Action);
	DYNAMIC bool __fastcall CanFocus(void);
public:
	#pragma option push -w-inl
	/* TcxCustomInnerListBox.Create */ inline __fastcall virtual TcxMCInnerListBox(Classes::TComponent* AOwner) : Cxcontainer::TcxCustomInnerListBox(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomInnerListBox.Destroy */ inline __fastcall virtual ~TcxMCInnerListBox(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxMCInnerListBox(HWND ParentWindow) : Cxcontainer::TcxCustomInnerListBox(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxMCInnerPanel;
class PASCALIMPLEMENTATION TcxMCInnerPanel : public Extctrls::TCustomPanel 
{
	typedef Extctrls::TCustomPanel inherited;
	
public:
	__fastcall virtual TcxMCInnerPanel(Classes::TComponent* AOwner);
public:
	#pragma option push -w-inl
	/* TCustomControl.Destroy */ inline __fastcall virtual ~TcxMCInnerPanel(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxMCInnerPanel(HWND ParentWindow) : Extctrls::TCustomPanel(ParentWindow) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxMCListBox : public Cxcontainer::TcxContainer 
{
	typedef Cxcontainer::TcxContainer inherited;
	
private:
	Classes::TAlignment FAlignment;
	TcxMCInnerPanel* FInnerPanel;
	TcxMCInnerListBox* FInnerListBox;
	TcxMCInnerHeader* FInnerHeader;
	bool FIsExitProcessing;
	bool FMultiLines;
	bool FShowEndEllipsis;
	char FDelimiter;
	bool FShowColumnLines;
	Graphics::TColor FColumnLineColor;
	bool FOverflowEmptyColumn;
	bool FInternalPaint;
	int FSavedIndex;
	Classes::TStringList* FOverLoadList;
	Stdctrls::TScrollEvent FSavedHScroll;
	bool FInternalFlagCreatedHeader;
	bool FIntegralHeight;
	Imglist::TCustomImageList* __fastcall GetImages(void);
	void __fastcall SetImages(Imglist::TCustomImageList* Value);
	Cxheader::TcxHeaderSections* __fastcall GetHeaderSections(void);
	void __fastcall SetHeaderSections(Cxheader::TcxHeaderSections* Value);
	void __fastcall SectionEndResizeHandler(Cxheader::TcxCustomHeader* HeaderControl, Cxheader::TcxHeaderSection* Section);
	void __fastcall SectionTrackHandler(Cxheader::TcxCustomHeader* HeaderControl, Cxheader::TcxHeaderSection* Section, int Width, Cxheader::TcxSectionTrackState State);
	void __fastcall SetMultiLines(bool Value);
	void __fastcall SetAlignment(Classes::TAlignment Value);
	void __fastcall SetShowEndEllipsis(bool Value);
	void __fastcall SetDelimiter(char Value);
	bool __fastcall GetHeaderDragReorder(void);
	void __fastcall SetHeaderDragReorder(bool Value);
	void __fastcall SetShowColumnLines(bool Value);
	void __fastcall SetColumnLineColor(Graphics::TColor Value);
	void __fastcall SetOverflowEmptyColumn(bool Value);
	AnsiString __fastcall GetTextPart(const int ItemIndex, const int PartIndex);
	void __fastcall SectionChangeHandler(System::TObject* Sender);
	void __fastcall SectionSortChangedHandler(System::TObject* Sender, const Cxheader::TcxHeaderSection* Section, const Cxheader::TcxHeaderSortOrder ASortOrder);
	void __fastcall HScrollHandler(System::TObject* Sender, Stdctrls::TScrollCode ScrollCode, int &ScrollPos);
	void __fastcall SectionEndDragHandler(System::TObject* Sender);
	void __fastcall DrawItem(Controls::TWinControl* Control, int Index, const Types::TRect &Rect, Windows::TOwnerDrawState State);
	void __fastcall MeasureItem(Controls::TWinControl* Control, int Index, int &Height);
	int __fastcall GetCount(void);
	bool __fastcall GetExtendedSelect(void);
	int __fastcall GetItemHeight(void);
	int __fastcall GetItemIndex(void);
	Classes::TStrings* __fastcall GetItems(void);
	bool __fastcall GetMultiSelect(void);
	bool __fastcall GetReadOnly(void);
	int __fastcall GetSelCount(void);
	bool __fastcall GetSelected(int Index);
	bool __fastcall GetSorted(void);
	int __fastcall GetTopIndex(void);
	void __fastcall SetExtendedSelect(bool Value);
	void __fastcall SetItemHeight(int Value);
	void __fastcall SetItemIndex(int Value);
	void __fastcall SetItems(Classes::TStrings* Value);
	void __fastcall SetMultiSelect(bool Value);
	void __fastcall SetReadOnly(bool Value);
	void __fastcall SetSelected(int Index, bool Value);
	void __fastcall SetSorted(bool Value);
	void __fastcall SetTopIndex(int Value);
	bool __fastcall GetAutoComplete(void);
	void __fastcall SetAutoComplete(bool Value);
	int __fastcall GetScrollWidth(void);
	int __fastcall GetTabWidth(void);
	void __fastcall SetIntegralHeight(bool Value);
	void __fastcall SetScrollWidth(int Value);
	void __fastcall SetTabWidth(int Value);
	
protected:
	Cxdatautils::TcxCustomDataBinding* FDataBinding;
	virtual int __fastcall CalcItemHeight(const int AIndex);
	int __fastcall GetTextFlag(const int AStartFlag, const int ASectionIndex, const bool AIgnoreEndEllips, const int ATabWidth);
	virtual void __fastcall ContainerStyleChanged(System::TObject* Sender);
	DYNAMIC void __fastcall CursorChanged(void);
	DYNAMIC void __fastcall FontChanged(void);
	virtual void __fastcall AdjustInnerControl(void);
	/* virtual class method */ virtual TMetaClass* __fastcall GetStyleClass(TMetaClass* vmt);
	virtual void __fastcall DataChange(void);
	DYNAMIC void __fastcall DoExit(void);
	virtual bool __fastcall IsInternalControl(Controls::TControl* AControl);
	DYNAMIC void __fastcall KeyDown(Word &Key, Classes::TShiftState Shift);
	DYNAMIC void __fastcall KeyPress(char &Key);
	virtual bool __fastcall RefreshContainer(const Types::TPoint &P, Cxcontainer::TcxMouseButton Button, Classes::TShiftState Shift, bool AIsMouseEvent);
	virtual void __fastcall SetScrollBarsParameters(void);
	virtual void __fastcall UpdateData(void);
	virtual bool __fastcall CanResize(int &NewWidth, int &NewHeight);
	virtual void __fastcall SetSize(void);
	void __fastcall FullRepaint(void);
	virtual void __fastcall WndProc(Messages::TMessage &Message);
	virtual TMetaClass* __fastcall GetDataBindingClass(void);
	void __fastcall GetOptimalHeight(int &ANewHeight);
	__property Cxdatautils::TcxCustomDataBinding* DataBinding = {read=FDataBinding};
	__property bool ReadOnly = {read=GetReadOnly, write=SetReadOnly, nodefault};
	__property int ScrollWidth = {read=GetScrollWidth, write=SetScrollWidth, default=0};
	
public:
	__fastcall virtual TcxMCListBox(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxMCListBox(void);
	virtual void __fastcall Loaded(void);
	virtual void __fastcall CreateWnd(void);
	DYNAMIC bool __fastcall ExecuteAction(Classes::TBasicAction* Action);
	DYNAMIC bool __fastcall UpdateAction(Classes::TBasicAction* Action);
	void __fastcall AddItem(AnsiString AItem, System::TObject* AObject);
	void __fastcall Clear(void);
	void __fastcall ClearSelection(void);
	void __fastcall DeleteSelected(void);
	int __fastcall ItemAtPos(const Types::TPoint &APos, bool AExisting);
	Types::TRect __fastcall ItemRect(int Index);
	bool __fastcall ItemVisible(int Index);
	void __fastcall SelectAll(void);
	void __fastcall CopySelection(Controls::TCustomListControl* ADestination);
	void __fastcall MoveSelection(Controls::TCustomListControl* ADestination);
	__property int Count = {read=GetCount, nodefault};
	__property TcxMCInnerListBox* InnerListBox = {read=FInnerListBox, write=FInnerListBox};
	__property int ItemIndex = {read=GetItemIndex, write=SetItemIndex, nodefault};
	__property int SelCount = {read=GetSelCount, nodefault};
	__property bool Selected[int Index] = {read=GetSelected, write=SetSelected};
	__property int TopIndex = {read=GetTopIndex, write=SetTopIndex, nodefault};
	
__published:
	__property Align  = {default=0};
	__property Classes::TAlignment Alignment = {read=FAlignment, write=SetAlignment, default=0};
	__property bool MultiLines = {read=FMultiLines, write=SetMultiLines, default=0};
	__property bool ShowEndEllipsis = {read=FShowEndEllipsis, write=SetShowEndEllipsis, default=1};
	__property char Delimiter = {read=FDelimiter, write=SetDelimiter, default=59};
	__property bool HeaderDragReorder = {read=GetHeaderDragReorder, write=SetHeaderDragReorder, default=0};
	__property bool ShowColumnLines = {read=FShowColumnLines, write=SetShowColumnLines, default=1};
	__property Imglist::TCustomImageList* Images = {read=GetImages, write=SetImages};
	__property Graphics::TColor ColumnLineColor = {read=FColumnLineColor, write=SetColumnLineColor, default=-2147483632};
	__property bool OverflowEmptyColumn = {read=FOverflowEmptyColumn, write=SetOverflowEmptyColumn, default=1};
	__property Anchors  = {default=3};
	__property Constraints ;
	__property DragMode  = {default=0};
	__property Enabled  = {default=1};
	__property bool ExtendedSelect = {read=GetExtendedSelect, write=SetExtendedSelect, default=1};
	__property int ItemHeight = {read=GetItemHeight, write=SetItemHeight, default=16};
	__property Classes::TStrings* Items = {read=GetItems, write=SetItems};
	__property Cxheader::TcxHeaderSections* HeaderSections = {read=GetHeaderSections, write=SetHeaderSections};
	__property bool MultiSelect = {read=GetMultiSelect, write=SetMultiSelect, default=0};
	__property ParentColor  = {default=1};
	__property ParentFont  = {default=1};
	__property ParentShowHint  = {default=1};
	__property PopupMenu ;
	__property ShowHint ;
	__property bool Sorted = {read=GetSorted, write=SetSorted, default=0};
	__property Style ;
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=1};
	__property Visible  = {default=1};
	__property bool AutoComplete = {read=GetAutoComplete, write=SetAutoComplete, default=1};
	__property BiDiMode ;
	__property DragCursor  = {default=-12};
	__property DragKind  = {default=0};
	__property ImeMode  = {default=3};
	__property ImeName ;
	__property bool IntegralHeight = {read=FIntegralHeight, write=SetIntegralHeight, default=0};
	__property ParentBiDiMode  = {default=1};
	__property int TabWidth = {read=GetTabWidth, write=SetTabWidth, default=0};
	__property OnClick ;
	__property OnDblClick ;
	__property OnDragDrop ;
	__property OnDragOver ;
	__property OnEndDrag ;
	__property OnEnter ;
	__property OnExit ;
	__property OnKeyDown ;
	__property OnKeyPress ;
	__property OnKeyUp ;
	__property OnMouseDown ;
	__property OnMouseMove ;
	__property OnMouseUp ;
	__property OnStartDrag ;
	__property OnContextPopup ;
	__property OnEndDock ;
	__property OnStartDock ;
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxMCListBox(HWND ParentWindow) : Cxcontainer::TcxContainer(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxmclistbox */
using namespace Cxmclistbox;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxMCListBox
