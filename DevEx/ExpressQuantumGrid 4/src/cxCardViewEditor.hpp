// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxCardViewEditor.pas' rev: 6.00

#ifndef cxCardViewEditorHPP
#define cxCardViewEditorHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxClasses.hpp>	// Pascal unit
#include <cxGridCardView.hpp>	// Pascal unit
#include <cxGridCustomView.hpp>	// Pascal unit
#include <cxCustomTableViewEditor.hpp>	// Pascal unit
#include <cxViewEditor.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <ComCtrls.hpp>	// Pascal unit
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

namespace Cxcardvieweditor
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxCardViewEditor;
class PASCALIMPLEMENTATION TcxCardViewEditor : public Cxcustomtablevieweditor::TcxCustomTableViewEditor 
{
	typedef Cxcustomtablevieweditor::TcxCustomTableViewEditor inherited;
	
protected:
	virtual AnsiString __fastcall GetDeleteItemsCaption();
public:
	#pragma option push -w-inl
	/* TCustomForm.Create */ inline __fastcall virtual TcxCardViewEditor(Classes::TComponent* AOwner) : Cxcustomtablevieweditor::TcxCustomTableViewEditor(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual TcxCardViewEditor(Classes::TComponent* AOwner, int Dummy) : Cxcustomtablevieweditor::TcxCustomTableViewEditor(AOwner, Dummy) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TcxCardViewEditor(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCardViewEditor(HWND ParentWindow) : Cxcustomtablevieweditor::TcxCustomTableViewEditor(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridCardViewStorage;
class PASCALIMPLEMENTATION TcxGridCardViewStorage : public Cxvieweditor::TcxCustomGridViewStorage 
{
	typedef Cxvieweditor::TcxCustomGridViewStorage inherited;
	
private:
	Cxgridcardview::TcxGridCardViewLayoutDirection __fastcall GetLayoutDirection(void);
	Cxgridcardview::TcxGridCardViewOptionsBehavior* __fastcall GetOptionsBehavior(void);
	Cxgridcardview::TcxGridCardViewOptionsData* __fastcall GetOptionsData(void);
	Cxgridcardview::TcxGridCardViewOptionsSelection* __fastcall GetOptionsSelection(void);
	Cxgridcardview::TcxGridCardViewOptionsView* __fastcall GetOptionsView(void);
	
protected:
	Cxgridcardview::TcxGridCardView* __fastcall CardView(void);
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewClass(TMetaClass* vmt);
	
__published:
	__property Cxgridcardview::TcxGridCardViewLayoutDirection LayoutDirection = {read=GetLayoutDirection, nodefault};
	__property Cxgridcardview::TcxGridCardViewOptionsBehavior* OptionsBehavior = {read=GetOptionsBehavior};
	__property Cxgridcardview::TcxGridCardViewOptionsData* OptionsData = {read=GetOptionsData};
	__property Cxgridcardview::TcxGridCardViewOptionsSelection* OptionsSelection = {read=GetOptionsSelection};
	__property Cxgridcardview::TcxGridCardViewOptionsView* OptionsView = {read=GetOptionsView};
public:
	#pragma option push -w-inl
	/* TcxCustomGridViewStorage.Create */ inline __fastcall TcxGridCardViewStorage(Cxgridcustomview::TcxCustomGridView* AView) : Cxvieweditor::TcxCustomGridViewStorage(AView) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxGridCardViewStorage(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxcardvieweditor */
using namespace Cxcardvieweditor;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxCardViewEditor
