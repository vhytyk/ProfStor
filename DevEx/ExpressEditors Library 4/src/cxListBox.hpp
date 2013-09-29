// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxListBox.pas' rev: 6.00

#ifndef cxListBoxHPP
#define cxListBoxHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxScrollBar.hpp>	// Pascal unit
#include <cxLookAndFeels.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <cxDataUtils.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxlistbox
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxInnerListBox;
class DELPHICLASS TcxListBox;
class PASCALIMPLEMENTATION TcxInnerListBox : public Cxcontainer::TcxCustomInnerListBox 
{
	typedef Cxcontainer::TcxCustomInnerListBox inherited;
	
private:
	TcxListBox* __fastcall GetContainer(void);
	HIDESBASE MESSAGE void __fastcall WMLButtonDown(Messages::TWMMouse &Message);
	
protected:
	DYNAMIC void __fastcall Click(void);
	virtual void __fastcall CreateWindowHandle(const Controls::TCreateParams &Params);
	__property TcxListBox* Container = {read=GetContainer};
	
public:
	DYNAMIC bool __fastcall ExecuteAction(Classes::TBasicAction* Action);
	DYNAMIC bool __fastcall UpdateAction(Classes::TBasicAction* Action);
	DYNAMIC bool __fastcall CanFocus(void);
public:
	#pragma option push -w-inl
	/* TcxCustomInnerListBox.Create */ inline __fastcall virtual TcxInnerListBox(Classes::TComponent* AOwner) : Cxcontainer::TcxCustomInnerListBox(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomInnerListBox.Destroy */ inline __fastcall virtual ~TcxInnerListBox(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxInnerListBox(HWND ParentWindow) : Cxcontainer::TcxCustomInnerListBox(ParentWindow) { }
	#pragma option pop
	
};


typedef void __fastcall (__closure *TcxListBoxDrawItemEvent)(TcxListBox* AControl, Cxgraphics::TcxCanvas* ACanvas, int AIndex, const Types::TRect &ARect, Windows::TOwnerDrawState AState);

typedef void __fastcall (__closure *TcxListBoxMeasureItemEvent)(TcxListBox* AControl, int AIndex, int &Height);

class PASCALIMPLEMENTATION TcxListBox : public Cxcontainer::TcxContainer 
{
	typedef Cxcontainer::TcxContainer inherited;
	
private:
	TcxListBoxDrawItemEvent FOnDrawItem;
	TcxListBoxMeasureItemEvent FOnMeasureItem;
	TcxInnerListBox* FInnerListBox;
	bool FIsExitProcessing;
	bool FIntegralHeight;
	void __fastcall DoDrawItem(Controls::TWinControl* Control, int Index, const Types::TRect &Rect, Windows::TOwnerDrawState State);
	void __fastcall DoMeasureItem(Controls::TWinControl* Control, int Index, int &Height);
	int __fastcall GetColumns(void);
	int __fastcall GetCount(void);
	bool __fastcall GetExtendedSelect(void);
	Stdctrls::TListBox* __fastcall GetInnerListBox(void);
	int __fastcall GetItemHeight(void);
	int __fastcall GetItemIndex(void);
	Classes::TStrings* __fastcall GetItems(void);
	Stdctrls::TListBoxStyle __fastcall GetListStyle(void);
	bool __fastcall GetMultiSelect(void);
	bool __fastcall GetReadOnly(void);
	int __fastcall GetSelCount(void);
	bool __fastcall GetSelected(int Index);
	bool __fastcall GetSorted(void);
	int __fastcall GetTopIndex(void);
	void __fastcall SetColumns(int Value);
	void __fastcall SetExtendedSelect(bool Value);
	void __fastcall SetItemHeight(int Value);
	void __fastcall SetItemIndex(int Value);
	void __fastcall SetItems(Classes::TStrings* Value);
	void __fastcall SetListStyle(Stdctrls::TListBoxStyle Value);
	void __fastcall SetMultiSelect(bool Value);
	void __fastcall SetOnDrawItem(TcxListBoxDrawItemEvent Value);
	void __fastcall SetOnMeasureItem(TcxListBoxMeasureItemEvent Value);
	void __fastcall SetReadOnly(bool Value);
	void __fastcall SetSelected(int Index, bool Value);
	void __fastcall SetSorted(bool Value);
	void __fastcall SetTopIndex(int Value);
	bool __fastcall GetAutoComplete(void);
	Stdctrls::TLBGetDataEvent __fastcall GetOnData();
	Stdctrls::TLBFindDataEvent __fastcall GetOnDataFind();
	Stdctrls::TLBGetDataObjectEvent __fastcall GetOnDataObject();
	void __fastcall SetAutoComplete(bool Value);
	void __fastcall SetCount(int Value);
	void __fastcall SetOnData(Stdctrls::TLBGetDataEvent Value);
	void __fastcall SetOnDataFind(Stdctrls::TLBFindDataEvent Value);
	void __fastcall SetOnDataObject(Stdctrls::TLBGetDataObjectEvent Value);
	int __fastcall GetScrollWidth(void);
	int __fastcall GetTabWidth(void);
	void __fastcall SetIntegralHeight(bool Value);
	void __fastcall SetScrollWidth(int Value);
	void __fastcall SetTabWidth(int Value);
	
protected:
	Cxdatautils::TcxCustomDataBinding* FDataBinding;
	virtual void __fastcall AdjustInnerControl(void);
	virtual void __fastcall DataChange(void);
	DYNAMIC void __fastcall DoExit(void);
	DYNAMIC void __fastcall FontChanged(void);
	virtual bool __fastcall IsInternalControl(Controls::TControl* AControl);
	DYNAMIC void __fastcall KeyDown(Word &Key, Classes::TShiftState Shift);
	DYNAMIC void __fastcall KeyPress(char &Key);
	virtual void __fastcall UpdateData(void);
	virtual bool __fastcall CanResize(int &NewWidth, int &NewHeight);
	virtual void __fastcall SetSize(void);
	virtual void __fastcall WndProc(Messages::TMessage &Message);
	virtual TMetaClass* __fastcall GetDataBindingClass(void);
	void __fastcall GetOptimalHeight(int &ANewHeight);
	__property Cxdatautils::TcxCustomDataBinding* DataBinding = {read=FDataBinding};
	__property bool ReadOnly = {read=GetReadOnly, write=SetReadOnly, nodefault};
	
public:
	__fastcall virtual TcxListBox(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxListBox(void);
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
	__property int Count = {read=GetCount, write=SetCount, nodefault};
	__property Stdctrls::TListBox* InnerListBox = {read=GetInnerListBox};
	__property int ItemIndex = {read=GetItemIndex, write=SetItemIndex, nodefault};
	__property int SelCount = {read=GetSelCount, nodefault};
	__property bool Selected[int Index] = {read=GetSelected, write=SetSelected};
	__property int TopIndex = {read=GetTopIndex, write=SetTopIndex, nodefault};
	
__published:
	__property Align  = {default=0};
	__property Anchors  = {default=3};
	__property int Columns = {read=GetColumns, write=SetColumns, default=0};
	__property Constraints ;
	__property DragMode  = {default=0};
	__property Enabled  = {default=1};
	__property bool ExtendedSelect = {read=GetExtendedSelect, write=SetExtendedSelect, default=1};
	__property int ItemHeight = {read=GetItemHeight, write=SetItemHeight, nodefault};
	__property Classes::TStrings* Items = {read=GetItems, write=SetItems};
	__property Stdctrls::TListBoxStyle ListStyle = {read=GetListStyle, write=SetListStyle, default=0};
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
	__property int ScrollWidth = {read=GetScrollWidth, write=SetScrollWidth, default=0};
	__property int TabWidth = {read=GetTabWidth, write=SetTabWidth, default=0};
	__property OnClick ;
	__property OnDblClick ;
	__property OnDragDrop ;
	__property OnDragOver ;
	__property TcxListBoxDrawItemEvent OnDrawItem = {read=FOnDrawItem, write=SetOnDrawItem};
	__property OnEndDrag ;
	__property OnEnter ;
	__property OnExit ;
	__property OnKeyDown ;
	__property OnKeyPress ;
	__property OnKeyUp ;
	__property TcxListBoxMeasureItemEvent OnMeasureItem = {read=FOnMeasureItem, write=SetOnMeasureItem};
	__property OnMouseDown ;
	__property OnMouseMove ;
	__property OnMouseUp ;
	__property OnStartDrag ;
	__property OnContextPopup ;
	__property Stdctrls::TLBGetDataEvent OnData = {read=GetOnData, write=SetOnData};
	__property Stdctrls::TLBFindDataEvent OnDataFind = {read=GetOnDataFind, write=SetOnDataFind};
	__property Stdctrls::TLBGetDataObjectEvent OnDataObject = {read=GetOnDataObject, write=SetOnDataObject};
	__property OnEndDock ;
	__property OnStartDock ;
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxListBox(HWND ParentWindow) : Cxcontainer::TcxContainer(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxlistbox */
using namespace Cxlistbox;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxListBox
