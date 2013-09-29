// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxGridStructureNavigator.pas' rev: 6.00

#ifndef cxGridStructureNavigatorHPP
#define cxGridStructureNavigatorHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Buttons.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <cxGridViewLayoutEditor.hpp>	// Pascal unit
#include <cxGridDBDataDefinitions.hpp>	// Pascal unit
#include <cxGridDBCardView.hpp>	// Pascal unit
#include <cxGridCardView.hpp>	// Pascal unit
#include <cxGridDBBandedTableView.hpp>	// Pascal unit
#include <cxGridBandedTableView.hpp>	// Pascal unit
#include <cxGridDBTableView.hpp>	// Pascal unit
#include <cxGridTableView.hpp>	// Pascal unit
#include <cxGridCustomTableView.hpp>	// Pascal unit
#include <cxGridCustomView.hpp>	// Pascal unit
#include <cxGridLevel.hpp>	// Pascal unit
#include <cxGrid.hpp>	// Pascal unit
#include <cxGridCommon.hpp>	// Pascal unit
#include <cxDesignWindows.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <TypInfo.hpp>	// Pascal unit
#include <DesignIntf.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxgridstructurenavigator
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxGridStructureControlRowViewInfo;
class PASCALIMPLEMENTATION TcxGridStructureControlRowViewInfo : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	#pragma pack(push, 1)
	Types::TRect Bounds;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect LevelBounds;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect LevelContentBounds;
	#pragma pack(pop)
	
	bool LevelHighlighted;
	bool LevelSelected;
	AnsiString LevelText;
	#pragma pack(push, 1)
	Types::TRect LevelTextArea;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect ViewBounds;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect ViewContentBounds;
	#pragma pack(pop)
	
	bool ViewHighlighted;
	bool ViewSelected;
	AnsiString ViewText;
	#pragma pack(push, 1)
	Types::TRect ViewTextArea;
	#pragma pack(pop)
	
	int TreeLineVertCount;
	bool TreeLineIsParent;
	bool TreeLineIsLast;
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxGridStructureControlRowViewInfo(void) : System::TObject() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridStructureControlRowViewInfo(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridStructureControlRowsViewInfo;
class PASCALIMPLEMENTATION TcxGridStructureControlRowsViewInfo : public Cxclasses::TcxObjectList 
{
	typedef Cxclasses::TcxObjectList inherited;
	
public:
	TcxGridStructureControlRowViewInfo* operator[](int Index) { return Items[Index]; }
	
private:
	HIDESBASE TcxGridStructureControlRowViewInfo* __fastcall GetItem(int Index);
	
public:
	__property TcxGridStructureControlRowViewInfo* Items[int Index] = {read=GetItem/*, default*/};
public:
	#pragma option push -w-inl
	/* TcxObjectList.Create */ inline __fastcall virtual TcxGridStructureControlRowsViewInfo(void) : Cxclasses::TcxObjectList() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxObjectList.Destroy */ inline __fastcall virtual ~TcxGridStructureControlRowsViewInfo(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridStructureControlViewInfo;
class DELPHICLASS TcxGridStructureControl;
#pragma option push -b-
enum TcxGridStructureControlHitTest { htNowhere, htLevel, htView };
#pragma option pop

#pragma pack(push, 4)
struct TcxGridStructureControlHitInfo
{
	TcxGridStructureControlHitTest HitTest;
	int RowIndex;
} ;
#pragma pack(pop)

typedef void __fastcall (__closure *TcxGridStructureControlSelectComponentEvent)(System::TObject* Sender, Classes::TComponent* AComponent);

class PASCALIMPLEMENTATION TcxGridStructureControl : public Cxcontrols::TcxControl 
{
	typedef Cxcontrols::TcxControl inherited;
	
private:
	Cxgrid::TcxCustomGrid* FGrid;
	TcxGridStructureControlHitInfo FHitInfo;
	int FLockCount;
	bool FMayFocused;
	TcxGridStructureControlHitInfo FMouseDownHitInfo;
	bool FMousePressed;
	bool FMultiSelect;
	bool FSelectOneItem;
	TcxGridStructureControlViewInfo* FViewInfo;
	TcxGridStructureControlSelectComponentEvent FOnSelectComponent;
	Classes::TNotifyEvent FOnSelectionChanged;
	void __fastcall ClearSelection(void);
	void __fastcall SetGrid(Cxgrid::TcxCustomGrid* Value);
	void __fastcall SetMultiSelect(bool Value);
	void __fastcall SetSelectOneItem(bool Value);
	
protected:
	DYNAMIC void __fastcall MouseDown(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseMove(Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseUp(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall Paint(void);
	void __fastcall AddToSelection(Classes::TComponent* AComponent, bool AClearSelection);
	void __fastcall CancelPressed(const Types::TPoint &P);
	void __fastcall CheckMousePos(const Types::TPoint &P);
	DYNAMIC void __fastcall BoundsChanged(void);
	DYNAMIC void __fastcall FontChanged(void);
	Classes::TComponent* __fastcall GetComponentByHitInfo(const TcxGridStructureControlHitInfo &AHitInfo);
	virtual Controls::TCursor __fastcall GetCursor(int X, int Y);
	DYNAMIC bool __fastcall MayFocus(void);
	DYNAMIC void __fastcall MouseLeave(Controls::TControl* AControl);
	void __fastcall SelectComponent(Classes::TComponent* AComponent);
	virtual void __fastcall SelectionChanged(void);
	void __fastcall SetPressed(bool APressed);
	virtual void __fastcall UpdateContent(void);
	void __fastcall UpdateHighlighted(void);
	__property int LockCount = {read=FLockCount, nodefault};
	
public:
	__fastcall virtual TcxGridStructureControl(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxGridStructureControl(void);
	void __fastcall BeginUpdate(void);
	HIDESBASE void __fastcall Changed(void);
	void __fastcall EndUpdate(void);
	TcxGridStructureControlHitInfo __fastcall GetHitInfo(const Types::TPoint &P);
	Cxgridlevel::TcxGridLevel* __fastcall GetLevelByRowIndex(int ARowIndex);
	Cxgridlevel::TcxGridLevel* __fastcall GetSelectedLevel(void);
	void __fastcall GetSelection(Classes::TList* ASelectionList);
	void __fastcall GetSelectionLevels(Classes::TList* ASelectionList);
	int __fastcall GetSelectionLevelCount(void);
	void __fastcall GetSelectionViews(Classes::TList* ASelectionList);
	int __fastcall GetSelectionViewCount(void);
	void __fastcall SyncSelection(Classes::TList* ASelectionList);
	__property Cxgrid::TcxCustomGrid* Grid = {read=FGrid, write=SetGrid};
	__property Keys ;
	__property bool MayFocused = {read=FMayFocused, write=FMayFocused, nodefault};
	__property bool MultiSelect = {read=FMultiSelect, write=SetMultiSelect, nodefault};
	__property bool SelectOneItem = {read=FSelectOneItem, write=SetSelectOneItem, nodefault};
	__property TcxGridStructureControlViewInfo* ViewInfo = {read=FViewInfo};
	__property OnKeyPress ;
	__property TcxGridStructureControlSelectComponentEvent OnSelectComponent = {read=FOnSelectComponent, write=FOnSelectComponent};
	__property Classes::TNotifyEvent OnSelectionChanged = {read=FOnSelectionChanged, write=FOnSelectionChanged};
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxGridStructureControl(HWND ParentWindow) : Cxcontrols::TcxControl(ParentWindow) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxGridStructureControlViewInfo : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	Cxgraphics::TcxCanvas* FCanvas;
	TcxGridStructureControl* FStructureControl;
	int FTextHeight;
	int FRowHeight;
	TcxGridStructureControlRowsViewInfo* FRows;
	Cxgraphics::TcxCanvas* __fastcall GetCanvas(void);
	Cxgrid::TcxCustomGrid* __fastcall GetGrid(void);
	Cxgridlevel::TcxGridLevel* __fastcall GetLevelByIndex(int AIndex);
	void __fastcall GetLevelInfo(int AIndex, AnsiString &ALevelText, AnsiString &AViewText, int &ALevelIndex, bool &AIsParent, bool &AIsLast);
	int __fastcall GetRowCount(void);
	
public:
	#pragma pack(push, 1)
	Types::TRect Bounds;
	#pragma pack(pop)
	
	__fastcall TcxGridStructureControlViewInfo(TcxGridStructureControl* AStructureControl);
	__fastcall virtual ~TcxGridStructureControlViewInfo(void);
	void __fastcall Calculate(void);
	Graphics::TColor __fastcall GetContentColor(void);
	Graphics::TFont* __fastcall GetContentFont(void);
	Graphics::TColor __fastcall GetContentFontColor(void);
	Graphics::TColor __fastcall GetGridColor(void);
	int __fastcall GetGridLineWidth(void);
	Graphics::TColor __fastcall GetGridTreeLineColor(void);
	int __fastcall GetGridTreeLineWidth(void);
	Graphics::TColor __fastcall GetHighlightedFontColor(void);
	Graphics::TColor __fastcall GetLevelColor(void);
	Graphics::TColor __fastcall GetRootLevelColor(void);
	Graphics::TColor __fastcall GetSelectedColor(void);
	Graphics::TColor __fastcall GetSelectedFontColor(void);
	Graphics::TColor __fastcall GetViewColor(void);
	void __fastcall Paint(void);
	__property Cxgraphics::TcxCanvas* Canvas = {read=GetCanvas};
	__property Cxgrid::TcxCustomGrid* Grid = {read=GetGrid};
	__property TcxGridStructureControl* StructureControl = {read=FStructureControl};
	__property TcxGridStructureControlRowsViewInfo* Rows = {read=FRows};
};


class DELPHICLASS TcxGridStructureHelper;
class PASCALIMPLEMENTATION TcxGridStructureHelper : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	Menus::TPopupMenu* FPopupMenu;
	Cxgridlevel::TcxGridLevel* FPopupMenuLevel;
	TcxGridStructureControl* FStructureControl;
	Classes::TNotifyEvent FOnUpdateDesigner;
	void __fastcall CreateAllItemsClick(System::TObject* Sender);
	void __fastcall CreateLevelClick(System::TObject* Sender);
	void __fastcall CreateViewClick(System::TObject* Sender);
	void __fastcall DeleteAllItemsClick(System::TObject* Sender);
	void __fastcall DeleteLevelClick(System::TObject* Sender);
	void __fastcall DeleteViewClick(System::TObject* Sender);
	void __fastcall EditViewLayoutClick(System::TObject* Sender);
	void __fastcall SetAsDefaultClick(System::TObject* Sender);
	
protected:
	void __fastcall StructureControlMouseDown(System::TObject* Sender, Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	void __fastcall UpdateDesigner(void);
	
public:
	__fastcall virtual TcxGridStructureHelper(TcxGridStructureControl* AStructureControl);
	__fastcall virtual ~TcxGridStructureHelper(void);
	__property TcxGridStructureControl* StructureControl = {read=FStructureControl};
	__property Classes::TNotifyEvent OnUpdateDesigner = {read=FOnUpdateDesigner, write=FOnUpdateDesigner};
};


class DELPHICLASS TcxGridStructureNavigator;
class PASCALIMPLEMENTATION TcxGridStructureNavigator : public Cxgrid::TcxCustomGridStructureNavigator 
{
	typedef Cxgrid::TcxCustomGridStructureNavigator inherited;
	
private:
	Buttons::TSpeedButton* FCloseButton;
	Buttons::TSpeedButton* FCustomizeButton;
	Cxgridlevel::TcxGridLevel* FDefaultLevel;
	Cxgridcustomview::TcxCustomGridView* FDefaultView;
	Extctrls::TBevel* FSeparator;
	TcxGridStructureControl* FStructureControl;
	TcxGridStructureHelper* FStructureHelper;
	void __fastcall CloseButtonClick(System::TObject* Sender);
	void __fastcall CustomizeButtonClick(System::TObject* Sender);
	void __fastcall UpdateDesigner(System::TObject* Sender);
	MESSAGE void __fastcall CMDeferUpdate(void *Message);
	
protected:
	virtual void __fastcall Paint(void);
	void __fastcall Calculate(void);
	virtual Types::TRect __fastcall CalculateBoundsRect();
	virtual void __fastcall Changed(void);
	void __fastcall CreateDefaultComponents(void);
	Designintf::_di_IDesigner __fastcall GetDesigner();
	void __fastcall NotifyEditors(void);
	void __fastcall SelectComponent(System::TObject* Sender, Classes::TComponent* AComponent);
	
public:
	__fastcall virtual TcxGridStructureNavigator(Cxgrid::TcxCustomGrid* AGrid);
	__fastcall virtual ~TcxGridStructureNavigator(void);
	virtual void __fastcall BeforeGridLoading(void);
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxGridStructureNavigator(HWND ParentWindow) : Cxgrid::TcxCustomGridStructureNavigator(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
static const Word CM_DeferUpdate = 0x8001;
#define ScxGridTruncateClassName "TcxGrid"
extern PACKAGE AnsiString __fastcall GenLevelName(Cxgrid::TcxCustomGrid* AGrid, Cxgridlevel::TcxGridLevel* ALevel);
extern PACKAGE AnsiString __fastcall GenViewName(Classes::TComponent* AOwnerComponent, Cxgridcustomview::TcxCustomGridView* AView);
extern PACKAGE void __fastcall CreateViewAllItems(Classes::TComponent* AOwnerForm, Cxgridcustomview::TcxCustomGridView* AView);
extern PACKAGE bool __fastcall IsViewDataBound(Cxgridcustomview::TcxCustomGridView* AView);
extern PACKAGE bool __fastcall IsViewDataLinked(Cxgridcustomview::TcxCustomGridView* AView);

}	/* namespace Cxgridstructurenavigator */
using namespace Cxgridstructurenavigator;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxGridStructureNavigator
