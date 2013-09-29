// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxTableViewEditor.pas' rev: 6.00

#ifndef cxTableViewEditorHPP
#define cxTableViewEditorHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxClasses.hpp>	// Pascal unit
#include <cxGridTableView.hpp>	// Pascal unit
#include <cxGridCustomView.hpp>	// Pascal unit
#include <cxCustomTableViewEditor.hpp>	// Pascal unit
#include <cxViewEditor.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <ComCtrls.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Variants.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxtablevieweditor
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxTableViewEditor;
class PASCALIMPLEMENTATION TcxTableViewEditor : public Cxcustomtablevieweditor::TcxCustomTableViewEditor 
{
	typedef Cxcustomtablevieweditor::TcxCustomTableViewEditor inherited;
	
public:
	#pragma option push -w-inl
	/* TCustomForm.Create */ inline __fastcall virtual TcxTableViewEditor(Classes::TComponent* AOwner) : Cxcustomtablevieweditor::TcxCustomTableViewEditor(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual TcxTableViewEditor(Classes::TComponent* AOwner, int Dummy) : Cxcustomtablevieweditor::TcxCustomTableViewEditor(AOwner, Dummy) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TcxTableViewEditor(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxTableViewEditor(HWND ParentWindow) : Cxcustomtablevieweditor::TcxCustomTableViewEditor(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridTableViewStorage;
class PASCALIMPLEMENTATION TcxGridTableViewStorage : public Cxcustomtablevieweditor::TcxCustomGridTableViewStorage 
{
	typedef Cxcustomtablevieweditor::TcxCustomGridTableViewStorage inherited;
	
private:
	Cxgridtableview::TcxGridTableFiltering* __fastcall GetFiltering(void);
	Cxgridtableview::TcxGridTableOptionsBehavior* __fastcall GetOptionsBehavior(void);
	Cxgridtableview::TcxGridTableOptionsCustomize* __fastcall GetOptionsCustomize(void);
	Cxgridtableview::TcxGridTableOptionsData* __fastcall GetOptionsData(void);
	Cxgridtableview::TcxGridTableOptionsSelection* __fastcall GetOptionsSelection(void);
	Cxgridtableview::TcxGridTableOptionsView* __fastcall GetOptionsView(void);
	Cxgridtableview::TcxGridPreview* __fastcall GetPreview(void);
	
protected:
	Cxgridtableview::TcxGridTableView* __fastcall TableView(void);
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewClass(TMetaClass* vmt);
	
__published:
	__property Cxgridtableview::TcxGridTableFiltering* Filtering = {read=GetFiltering};
	__property Cxgridtableview::TcxGridTableOptionsBehavior* OptionsBehavior = {read=GetOptionsBehavior};
	__property Cxgridtableview::TcxGridTableOptionsCustomize* OptionsCustomize = {read=GetOptionsCustomize};
	__property Cxgridtableview::TcxGridTableOptionsData* OptionsData = {read=GetOptionsData};
	__property Cxgridtableview::TcxGridTableOptionsSelection* OptionsSelection = {read=GetOptionsSelection};
	__property Cxgridtableview::TcxGridTableOptionsView* OptionsView = {read=GetOptionsView};
	__property Cxgridtableview::TcxGridPreview* Preview = {read=GetPreview};
public:
	#pragma option push -w-inl
	/* TcxCustomGridViewStorage.Create */ inline __fastcall TcxGridTableViewStorage(Cxgridcustomview::TcxCustomGridView* AView) : Cxcustomtablevieweditor::TcxCustomGridTableViewStorage(AView) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxGridTableViewStorage(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxtablevieweditor */
using namespace Cxtablevieweditor;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxTableViewEditor
