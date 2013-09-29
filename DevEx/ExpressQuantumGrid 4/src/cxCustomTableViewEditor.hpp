// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxCustomTableViewEditor.pas' rev: 6.00

#ifndef cxCustomTableViewEditorHPP
#define cxCustomTableViewEditorHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxViewEditor.hpp>	// Pascal unit
#include <cxGridStructureNavigator.hpp>	// Pascal unit
#include <cxGridCustomTableView.hpp>	// Pascal unit
#include <cxGridCustomView.hpp>	// Pascal unit
#include <cxNavigator.hpp>	// Pascal unit
#include <cxDBData.hpp>	// Pascal unit
#include <cxCustomData.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <ComCtrls.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <Variants.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxcustomtablevieweditor
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxCustomTableViewEditor;
class PASCALIMPLEMENTATION TcxCustomTableViewEditor : public Cxvieweditor::TcxViewEditor 
{
	typedef Cxvieweditor::TcxViewEditor inherited;
	
__published:
	Comctrls::TPageControl* PageControl1;
	Comctrls::TTabSheet* TSItems;
	Comctrls::TTabSheet* TSSummary;
	Extctrls::TPanel* Panel1;
	Stdctrls::TListBox* LBColumns;
	Stdctrls::TButton* BColumnAdd;
	Stdctrls::TButton* BColumnAddEx;
	Stdctrls::TButton* BColumnDelete;
	Stdctrls::TButton* BColumnAddAll;
	Stdctrls::TButton* BColumnRestore;
	Menus::TPopupMenu* PMColumns;
	Menus::TMenuItem* MIColumnAdd;
	Menus::TMenuItem* MIColumnDelete;
	Menus::TMenuItem* MIColumnRestore;
	Menus::TMenuItem* MIColumnSelectAll;
	Comctrls::TPageControl* PageControl2;
	Comctrls::TTabSheet* TSFooterSummaryItems;
	Comctrls::TTabSheet* TSDefaultGroupSummaryItems;
	Comctrls::TTabSheet* TabSheet3;
	Extctrls::TPanel* Panel2;
	Extctrls::TPanel* Panel3;
	Stdctrls::TButton* BAddFooterSummaryItem;
	Stdctrls::TButton* BDeleteFooterSummaryItem;
	Stdctrls::TListBox* LBFooterSummary;
	Extctrls::TPanel* Panel4;
	Stdctrls::TLabel* Label1;
	Extctrls::TPanel* Panel5;
	Extctrls::TPanel* Panel6;
	Stdctrls::TButton* BDefaultGroupSummaryAdd;
	Stdctrls::TButton* BDefaultGroupSummaryDelete;
	Stdctrls::TListBox* LBDefaultGroupsSummary;
	Extctrls::TPanel* Panel7;
	Stdctrls::TLabel* Label2;
	Extctrls::TPanel* PSummaryGroups;
	Extctrls::TPanel* PLinks;
	Stdctrls::TLabel* Label3;
	Extctrls::TPanel* PGroupItems;
	Extctrls::TPanel* Panel11;
	Stdctrls::TButton* BGroupSummaryItemAdd;
	Stdctrls::TButton* BGroupSummaryItemDelete;
	Stdctrls::TListBox* LBGroupSummaryItems;
	Extctrls::TPanel* Panel12;
	Stdctrls::TLabel* Label4;
	Extctrls::TPanel* PGroups;
	Extctrls::TPanel* Panel14;
	Stdctrls::TButton* BSummaryGroupAdd;
	Stdctrls::TButton* BSummaryGroupDelete;
	Stdctrls::TListBox* LBSummaryGroups;
	Extctrls::TPanel* Panel15;
	Stdctrls::TLabel* Label5;
	Extctrls::TPanel* PUnlinkedColumns;
	Stdctrls::TListBox* LBUnlinkedColumns;
	Extctrls::TPanel* Panel19;
	Stdctrls::TLabel* Label6;
	Extctrls::TPanel* PLinkUnlink;
	Extctrls::TPanel* PLinkedColumns;
	Stdctrls::TListBox* LBLinkedColumns;
	Extctrls::TPanel* Panel23;
	Stdctrls::TLabel* Label7;
	Stdctrls::TButton* BColumnLink;
	Stdctrls::TButton* BColumnUnlink;
	Extctrls::TSplitter* Splitter2;
	Extctrls::TPanel* PGSeparator;
	Menus::TMenuItem* N1;
	Stdctrls::TButton* BColumnMoveUp;
	Stdctrls::TButton* BColumnMoveDown;
	Menus::TMenuItem* N2;
	Menus::TMenuItem* MIColumnMoveUp;
	Menus::TMenuItem* MIColumnMoveDown;
	Menus::TPopupMenu* PMFooterSummary;
	Menus::TMenuItem* MIFooterSummaryAdd;
	Menus::TMenuItem* MIFooterSummaryDelete;
	Menus::TMenuItem* MenuItem4a;
	Menus::TMenuItem* MIFooterSummarySelectAll;
	Menus::TPopupMenu* PMDefaultGroupsSummary;
	Menus::TMenuItem* MIDefaultGroupSummaryAdd;
	Menus::TMenuItem* MIDefaultGroupSummaryDelete;
	Menus::TMenuItem* MenuItem3b;
	Menus::TMenuItem* MIDefaultGroupSummarySelectAll;
	Menus::TPopupMenu* PMSummaryGroups;
	Menus::TMenuItem* MISummaryGroupAdd;
	Menus::TMenuItem* MISummaryGroupDelete;
	Menus::TMenuItem* MenuItem5d;
	Menus::TMenuItem* MISummaryGroupSelectAll;
	Menus::TPopupMenu* PMGroupSummaryItems;
	Menus::TMenuItem* MIGroupSummaryItemsAdd;
	Menus::TMenuItem* MIGroupSummaryItemsDelete;
	Menus::TMenuItem* MenuItem6c;
	Menus::TMenuItem* MIGroupSummaryItemsSelectAll;
	void __fastcall LBColumnsClick(System::TObject* Sender);
	void __fastcall BColumnAddClick(System::TObject* Sender);
	void __fastcall BColumnAddExClick(System::TObject* Sender);
	void __fastcall BColumnDeleteClick(System::TObject* Sender);
	void __fastcall BColumnRestoreClick(System::TObject* Sender);
	void __fastcall MIColumnSelectAllClick(System::TObject* Sender);
	void __fastcall LBFooterSummaryClick(System::TObject* Sender);
	void __fastcall BAddFooterSummaryItemClick(System::TObject* Sender);
	void __fastcall BDeleteFooterSummaryItemClick(System::TObject* Sender);
	void __fastcall LBDefaultGroupsSummaryClick(System::TObject* Sender);
	void __fastcall BDefaultGroupSummaryAddClick(System::TObject* Sender);
	void __fastcall BDefaultGroupSummaryDeleteClick(System::TObject* Sender);
	void __fastcall LBSummaryGroupsClick(System::TObject* Sender);
	void __fastcall BSummaryGroupAddClick(System::TObject* Sender);
	void __fastcall BSummaryGroupDeleteClick(System::TObject* Sender);
	void __fastcall LBGroupSummaryItemsClick(System::TObject* Sender);
	void __fastcall BGroupSummaryItemAddClick(System::TObject* Sender);
	void __fastcall BGroupSummaryItemDeleteClick(System::TObject* Sender);
	void __fastcall LBUnlinkedColumnsClick(System::TObject* Sender);
	void __fastcall BColumnLinkClick(System::TObject* Sender);
	void __fastcall BColumnUnlinkClick(System::TObject* Sender);
	void __fastcall BColumnAddAllClick(System::TObject* Sender);
	void __fastcall PLinksResize(System::TObject* Sender);
	void __fastcall PSummaryGroupsResize(System::TObject* Sender);
	void __fastcall LBColumnsDragOver(System::TObject* Sender, System::TObject* Source, int X, int Y, Controls::TDragState State, bool &Accept);
	void __fastcall LBColumnsEndDrag(System::TObject* Sender, System::TObject* Target, int X, int Y);
	void __fastcall LBColumnsStartDrag(System::TObject* Sender, Controls::TDragObject* &DragObject);
	void __fastcall LBColumnsDragDrop(System::TObject* Sender, System::TObject* Source, int X, int Y);
	void __fastcall BColumnMoveUpClick(System::TObject* Sender);
	void __fastcall BColumnMoveDownClick(System::TObject* Sender);
	void __fastcall MIFooterSummarySelectAllClick(System::TObject* Sender);
	void __fastcall MIDefaultGroupSummarySelectAllClick(System::TObject* Sender);
	void __fastcall MISummaryGroupSelectAllClick(System::TObject* Sender);
	void __fastcall MIGroupSummaryItemsSelectAllClick(System::TObject* Sender);
	void __fastcall FormCreate(System::TObject* Sender);
	void __fastcall LBColumnsMouseDown(System::TObject* Sender, Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	
private:
	int FColumnsPrevDragIndex;
	Cxcustomdata::TcxDataGroupSummaryItems* __fastcall GetDefaultGroupSummaryItems(void);
	Cxcustomdata::TcxDataFooterSummaryItems* __fastcall GetFooterSummaryItems(void);
	Cxcustomdata::TcxDataSummaryGroups* __fastcall GetSummaryGroups(void);
	Cxgridcustomtableview::TcxCustomGridTableView* __fastcall GetView(void);
	void __fastcall ReindexColumnsProc(Classes::TList* AList, int ANewIndex);
	void __fastcall UpdateSummaryGroupLinks(void);
	void __fastcall UpdateSummaryGroups(void);
	
protected:
	void __fastcall CollectionItemsAdd(Stdctrls::TListBox* AListBox, Classes::TCollection* ACollection);
	void __fastcall CollectionItemsClick(Stdctrls::TListBox* AListBox, Classes::TPersistent* APersistent);
	void __fastcall CollectionItemsDelete(Stdctrls::TListBox* AListBox, Classes::TCollection* ACollection);
	Cxcustomdata::TcxDataSummaryGroup* __fastcall GetCurrentGroup(void);
	virtual AnsiString __fastcall GetDeleteItemsCaption();
	void __fastcall SelectAllColumns(void);
	virtual void __fastcall UpdateButtons(void);
	virtual void __fastcall UpdateColumnList(void);
	virtual void __fastcall UpdateColumnListSelection(void);
	virtual void __fastcall UpdateEditor(void);
	virtual void __fastcall UpdateSelection(void);
	void __fastcall UpdateSummary(void);
	void __fastcall UpdateSummarySelection(void);
	
public:
	/* virtual class method */ virtual Cxgridcustomview::TcxCustomGridView* __fastcall GetViewByObject(TMetaClass* vmt, Classes::TPersistent* APersistent);
	__property Cxcustomdata::TcxDataGroupSummaryItems* DefaultGroupSummaryItems = {read=GetDefaultGroupSummaryItems};
	__property Cxcustomdata::TcxDataFooterSummaryItems* FooterSummaryItems = {read=GetFooterSummaryItems};
	__property Cxcustomdata::TcxDataSummaryGroups* SummaryGroups = {read=GetSummaryGroups};
	__property Cxgridcustomtableview::TcxCustomGridTableView* View = {read=GetView};
public:
	#pragma option push -w-inl
	/* TCustomForm.Create */ inline __fastcall virtual TcxCustomTableViewEditor(Classes::TComponent* AOwner) : Cxvieweditor::TcxViewEditor(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual TcxCustomTableViewEditor(Classes::TComponent* AOwner, int Dummy) : Cxvieweditor::TcxViewEditor(AOwner, Dummy) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TcxCustomTableViewEditor(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomTableViewEditor(HWND ParentWindow) : Cxvieweditor::TcxViewEditor(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomGridTableViewStorage;
class PASCALIMPLEMENTATION TcxCustomGridTableViewStorage : public Cxvieweditor::TcxCustomGridViewStorage 
{
	typedef Cxvieweditor::TcxCustomGridViewStorage inherited;
	
private:
	Cxnavigator::TcxNavigatorControlButtons* __fastcall GetNavigatorButtons(void);
	
protected:
	Cxgridcustomtableview::TcxCustomGridTableView* __fastcall CustomTableView(void);
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewClass(TMetaClass* vmt);
	
__published:
	__property Cxnavigator::TcxNavigatorControlButtons* NavigatorButtons = {read=GetNavigatorButtons};
public:
	#pragma option push -w-inl
	/* TcxCustomGridViewStorage.Create */ inline __fastcall TcxCustomGridTableViewStorage(Cxgridcustomview::TcxCustomGridView* AView) : Cxvieweditor::TcxCustomGridViewStorage(AView) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxCustomGridTableViewStorage(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxcustomtablevieweditor */
using namespace Cxcustomtablevieweditor;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxCustomTableViewEditor
