// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxBandedTableViewEditor.pas' rev: 6.00

#ifndef cxBandedTableViewEditorHPP
#define cxBandedTableViewEditorHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxClasses.hpp>	// Pascal unit
#include <cxTableViewEditor.hpp>	// Pascal unit
#include <cxCustomTableViewEditor.hpp>	// Pascal unit
#include <cxViewEditor.hpp>	// Pascal unit
#include <cxGridBandedTableView.hpp>	// Pascal unit
#include <cxGridCustomView.hpp>	// Pascal unit
#include <ComCtrls.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Variants.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxbandedtablevieweditor
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxBandedTableViewEditor;
class PASCALIMPLEMENTATION TcxBandedTableViewEditor : public Cxtablevieweditor::TcxTableViewEditor 
{
	typedef Cxtablevieweditor::TcxTableViewEditor inherited;
	
__published:
	Comctrls::TTabSheet* TSBands;
	Stdctrls::TListBox* LBBands;
	Extctrls::TPanel* Panel22;
	Stdctrls::TButton* BAddBand;
	Stdctrls::TButton* BDeleteBand;
	Menus::TPopupMenu* PMBands;
	Menus::TMenuItem* MIBandsAdd;
	Menus::TMenuItem* MIBandsDelete;
	Menus::TMenuItem* MenuItem4;
	Menus::TMenuItem* MIBandsMoveUp;
	Menus::TMenuItem* MenuItem7;
	Menus::TMenuItem* MIBandsSelectAll;
	Menus::TMenuItem* MIBandsMoveDown;
	Stdctrls::TButton* BBandMoveDown;
	Stdctrls::TButton* BBandMoveUp;
	void __fastcall BAddBandClick(System::TObject* Sender);
	void __fastcall BDeleteBandClick(System::TObject* Sender);
	void __fastcall LBBandsClick(System::TObject* Sender);
	void __fastcall LBBandsStartDrag(System::TObject* Sender, Controls::TDragObject* &DragObject);
	void __fastcall LBBandsDragOver(System::TObject* Sender, System::TObject* Source, int X, int Y, Controls::TDragState State, bool &Accept);
	void __fastcall LBBandsEndDrag(System::TObject* Sender, System::TObject* Target, int X, int Y);
	void __fastcall LBBandsDragDrop(System::TObject* Sender, System::TObject* Source, int X, int Y);
	void __fastcall BBandMoveUpClick(System::TObject* Sender);
	void __fastcall BBandMoveDownClick(System::TObject* Sender);
	void __fastcall MIBandsSelectAllClick(System::TObject* Sender);
	
private:
	int FBandsPrevDragIndex;
	Cxgridbandedtableview::TcxGridBands* __fastcall GetBands(void);
	void __fastcall ReindexBandsProc(Classes::TList* AList, int ANewIndex);
	void __fastcall UpdateBandList(void);
	void __fastcall UpdateBandListSelection(void);
	
protected:
	void __fastcall SelectAllBands(void);
	virtual void __fastcall UpdateButtons(void);
	virtual void __fastcall UpdateEditor(void);
	virtual void __fastcall UpdateSelection(void);
	
public:
	/* virtual class method */ virtual Cxgridcustomview::TcxCustomGridView* __fastcall GetViewByObject(TMetaClass* vmt, Classes::TPersistent* APersistent);
	__property Cxgridbandedtableview::TcxGridBands* Bands = {read=GetBands};
public:
	#pragma option push -w-inl
	/* TCustomForm.Create */ inline __fastcall virtual TcxBandedTableViewEditor(Classes::TComponent* AOwner) : Cxtablevieweditor::TcxTableViewEditor(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual TcxBandedTableViewEditor(Classes::TComponent* AOwner, int Dummy) : Cxtablevieweditor::TcxTableViewEditor(AOwner, Dummy) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TcxBandedTableViewEditor(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxBandedTableViewEditor(HWND ParentWindow) : Cxtablevieweditor::TcxTableViewEditor(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridBandedTableViewStorage;
class PASCALIMPLEMENTATION TcxGridBandedTableViewStorage : public Cxcustomtablevieweditor::TcxCustomGridTableViewStorage 
{
	typedef Cxcustomtablevieweditor::TcxCustomGridTableViewStorage inherited;
	
private:
	Cxgridbandedtableview::TcxGridBandedTableOptionsCustomize* __fastcall GetOptionsCustomize(void);
	Cxgridbandedtableview::TcxGridBandedTableOptionsView* __fastcall GetOptionsView(void);
	
protected:
	Cxgridbandedtableview::TcxGridBandedTableView* __fastcall BandedTableView(void);
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewClass(TMetaClass* vmt);
	
__published:
	__property Cxgridbandedtableview::TcxGridBandedTableOptionsCustomize* OptionsCustomize = {read=GetOptionsCustomize};
	__property Cxgridbandedtableview::TcxGridBandedTableOptionsView* OptionsView = {read=GetOptionsView};
public:
	#pragma option push -w-inl
	/* TcxCustomGridViewStorage.Create */ inline __fastcall TcxGridBandedTableViewStorage(Cxgridcustomview::TcxCustomGridView* AView) : Cxcustomtablevieweditor::TcxCustomGridTableViewStorage(AView) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxGridBandedTableViewStorage(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxbandedtablevieweditor */
using namespace Cxbandedtablevieweditor;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxBandedTableViewEditor
