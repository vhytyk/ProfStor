// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxGridEditor.pas' rev: 6.00

#ifndef cxGridEditorHPP
#define cxGridEditorHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <DesignWindows.hpp>	// Pascal unit
#include <cxGridViewLayoutEditor.hpp>	// Pascal unit
#include <cxViewEditor.hpp>	// Pascal unit
#include <cxGridCustomView.hpp>	// Pascal unit
#include <cxGridLevel.hpp>	// Pascal unit
#include <cxGrid.hpp>	// Pascal unit
#include <cxGridStructureNavigator.hpp>	// Pascal unit
#include <cxDesignWindows.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <ComCtrls.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <DesignIntf.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxgrideditor
{
//-- type declarations -------------------------------------------------------
#pragma pack(push, 4)
struct TSelectedViewInfo
{
	Cxgridcustomview::TcxCustomGridView* View;
	bool MultiView;
} ;
#pragma pack(pop)

class DELPHICLASS TcxGridEditor;
class PASCALIMPLEMENTATION TcxGridEditor : public Cxdesignwindows::TcxDesignFormEditor 
{
	typedef Cxdesignwindows::TcxDesignFormEditor inherited;
	
__published:
	Extctrls::TPanel* Panel1;
	Extctrls::TPanel* Panel2;
	Extctrls::TPanel* Panel3;
	Stdctrls::TButton* BClose;
	Extctrls::TPanel* Panel4;
	Extctrls::TPanel* PLeft;
	Comctrls::TPageControl* PageControl1;
	Comctrls::TTabSheet* tsLevels;
	Comctrls::TTabSheet* TabSheet2;
	Extctrls::TSplitter* Splitter1;
	Extctrls::TPanel* PLevels;
	Extctrls::TPanel* PViews;
	Stdctrls::TListBox* LBViews;
	Extctrls::TPanel* Panel7;
	Extctrls::TPanel* Panel8;
	Menus::TPopupMenu* PMGridStructureControl;
	Extctrls::TPanel* Panel6;
	Stdctrls::TButton* BAddLevel;
	Stdctrls::TButton* BDeleteLevel;
	Extctrls::TPanel* Panel9;
	Stdctrls::TButton* BAddView;
	Stdctrls::TButton* BDeleteView;
	Menus::TPopupMenu* PMViews;
	Extctrls::TPanel* PViewFrame;
	Extctrls::TPanel* Panel11;
	Stdctrls::TLabel* Label1;
	Stdctrls::TLabel* LSelectedView;
	Extctrls::TPanel* Panel10;
	Menus::TPopupMenu* PMViewList;
	Menus::TMenuItem* miDeleteView;
	Menus::TMenuItem* N1;
	Menus::TMenuItem* miEditLayout;
	void __fastcall BCloseClick(System::TObject* Sender);
	void __fastcall BDeleteLevelClick(System::TObject* Sender);
	void __fastcall BAddLevelClick(System::TObject* Sender);
	void __fastcall LBViewsClick(System::TObject* Sender);
	void __fastcall BAddViewClick(System::TObject* Sender);
	void __fastcall BDeleteViewClick(System::TObject* Sender);
	void __fastcall GridStructureControlKeyPress(System::TObject* Sender, char &Key);
	HIDESBASE void __fastcall FormClose(System::TObject* Sender, Forms::TCloseAction &Action);
	void __fastcall miEditLayoutClick(System::TObject* Sender);
	
private:
	Cxgridstructurenavigator::TcxGridStructureControl* FGridStructureControl;
	Cxgridstructurenavigator::TcxGridStructureHelper* FGridStructureHelper;
	Cxvieweditor::TcxViewEditor* FViewEditor;
	void __fastcall CreateViewClick(System::TObject* Sender);
	Cxgrid::TcxCustomGrid* __fastcall GetGrid(void);
	Cxgridcustomview::TcxCustomGridView* __fastcall GetView(int Index);
	int __fastcall GetViewCount(void);
	Cxgrid::TcxGridViewRepository* __fastcall GetViewRepository(void);
	void __fastcall GridStructureControlSelectionChanged(System::TObject* Sender);
	void __fastcall HideViewFrame(void);
	void __fastcall ShowViewFrame(Cxgridcustomview::TcxCustomGridView* AView, bool AMultiView, bool ARefreshNeeded);
	void __fastcall UpdateButtons(void);
	void __fastcall UpdateDesigner(System::TObject* Sender);
	void __fastcall UpdateGridStructureControl(void);
	void __fastcall UpdateGridStructureControlSelection(void);
	void __fastcall UpdateViewFrame(bool ARefreshNeeded);
	void __fastcall UpdateViewFrameCaption(void);
	void __fastcall UpdateViewList(void);
	void __fastcall UpdateViewListSelection(void);
	
protected:
	TSelectedViewInfo __fastcall GetSelectedViewInfo();
	virtual TMetaClass* __fastcall GetViewEditorClass(Cxgridcustomview::TcxCustomGridView* AView);
	virtual void __fastcall InitFormEditor(void);
	void __fastcall LoadSettings(void);
	void __fastcall SaveSettings(void);
	void __fastcall ShowDefaultView(void);
	virtual AnsiString __fastcall UniqueName(Classes::TComponent* Component);
	virtual void __fastcall UpdateContent(void);
	
public:
	__fastcall virtual TcxGridEditor(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxGridEditor(void);
	virtual void __fastcall DoItemsModified(void);
	AnsiString __fastcall GetRegKey();
	AnsiString __fastcall GetRegSectionName();
	virtual void __fastcall SelectionsChanged(const Designintf::_di_IDesignerSelections ASelection);
	__property Cxgrid::TcxCustomGrid* Grid = {read=GetGrid};
	__property int ViewCount = {read=GetViewCount, nodefault};
	__property Cxgrid::TcxGridViewRepository* ViewRepository = {read=GetViewRepository};
	__property Cxgridcustomview::TcxCustomGridView* Views[int Index] = {read=GetView};
public:
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual TcxGridEditor(Classes::TComponent* AOwner, int Dummy) : Cxdesignwindows::TcxDesignFormEditor(AOwner, Dummy) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxGridEditor(HWND ParentWindow) : Cxdesignwindows::TcxDesignFormEditor(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE void __fastcall ShowGridEditor(Designintf::_di_IDesigner ADesigner, Cxgrid::TcxCustomGrid* AGrid);
extern PACKAGE void __fastcall ShowViewRepositoryEditor(Designintf::_di_IDesigner ADesigner, Cxgrid::TcxGridViewRepository* AViewRepository);

}	/* namespace Cxgrideditor */
using namespace Cxgrideditor;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxGridEditor
