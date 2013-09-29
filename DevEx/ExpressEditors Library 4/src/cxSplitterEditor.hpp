// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxSplitterEditor.pas' rev: 6.00

#ifndef cxSplitterEditorHPP
#define cxSplitterEditorHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxButtons.hpp>	// Pascal unit
#include <cxLookAndFeelPainters.hpp>	// Pascal unit
#include <cxTrackBar.hpp>	// Pascal unit
#include <cxRadioGroup.hpp>	// Pascal unit
#include <cxLookAndFeels.hpp>	// Pascal unit
#include <cxSpinEdit.hpp>	// Pascal unit
#include <cxMaskEdit.hpp>	// Pascal unit
#include <cxTextEdit.hpp>	// Pascal unit
#include <cxGroupBox.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <cxListBox.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <cxSplitter.hpp>	// Pascal unit
#include <cxCheckBox.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxsplittereditor
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxSplitEditor;
class PASCALIMPLEMENTATION TcxSplitEditor : public Forms::TForm 
{
	typedef Forms::TForm inherited;
	
__published:
	Cxgroupbox::TcxGroupBox* cxGroupBox1;
	Extctrls::TPanel* Panel1;
	Cxlistbox::TcxListBox* cxListBox1;
	Cxsplitter::TcxSplitter* cxSplit;
	Cxlistbox::TcxListBox* cxListBox2;
	Cxgroupbox::TcxGroupBox* cxGroupBox2;
	Cxcheckbox::TcxCheckBox* cxCbAhd;
	Cxcheckbox::TcxCheckBox* cxCbAp;
	Cxcheckbox::TcxCheckBox* cxCbSnap;
	Cxcheckbox::TcxCheckBox* cxCbRis;
	Cxcheckbox::TcxCheckBox* cxCbRu;
	Stdctrls::TLabel* Label1;
	Cxspinedit::TcxSpinEdit* cxSeMs;
	Stdctrls::TLabel* Label2;
	Cxspinedit::TcxSpinEdit* cxSePao;
	Cxgroupbox::TcxGroupBox* cxGroupBox3;
	Cxradiogroup::TcxRadioButton* cxRbHzNone;
	Cxradiogroup::TcxRadioButton* cxRbHzMp8;
	Cxradiogroup::TcxRadioButton* cxRbHzMp9;
	Cxradiogroup::TcxRadioButton* cxRbHzSimple;
	Cxradiogroup::TcxRadioButton* cxRbHzXp;
	Cxlookandfeels::TcxLookAndFeelController* cxLookAndFeelController1;
	Cxcheckbox::TcxCheckBox* cxCbHzVisible;
	Cxtrackbar::TcxTrackBar* cxTbHzWidth;
	Stdctrls::TLabel* Label3;
	Cxbuttons::TcxButton* cxBtnOK;
	Cxbuttons::TcxButton* cxBtnCancel;
	void __fastcall cxCbAhdClick(System::TObject* Sender);
	void __fastcall cxCbApClick(System::TObject* Sender);
	void __fastcall cxCbSnapClick(System::TObject* Sender);
	void __fastcall cxCbRisClick(System::TObject* Sender);
	void __fastcall cxCbRuClick(System::TObject* Sender);
	void __fastcall cxSeMsPropertiesChange(System::TObject* Sender);
	void __fastcall cxSePaoPropertiesChange(System::TObject* Sender);
	void __fastcall cxCbHzVisiblePropertiesChange(System::TObject* Sender);
	void __fastcall cxRbHzNoneClick(System::TObject* Sender);
	void __fastcall cxRbHzMp8Click(System::TObject* Sender);
	void __fastcall cxTbHzWidthPropertiesChange(System::TObject* Sender);
	
public:
	void __fastcall SetSplitControls(void);
public:
	#pragma option push -w-inl
	/* TCustomForm.Create */ inline __fastcall virtual TcxSplitEditor(Classes::TComponent* AOwner) : Forms::TForm(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual TcxSplitEditor(Classes::TComponent* AOwner, int Dummy) : Forms::TForm(AOwner, Dummy) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TcxSplitEditor(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxSplitEditor(HWND ParentWindow) : Forms::TForm(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxsplittereditor */
using namespace Cxsplittereditor;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxSplitterEditor
