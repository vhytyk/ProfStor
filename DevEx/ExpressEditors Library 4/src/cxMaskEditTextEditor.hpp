// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxMaskEditTextEditor.pas' rev: 6.00

#ifndef cxMaskEditTextEditorHPP
#define cxMaskEditTextEditorHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxEditConsts.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <cxTextEdit.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <cxButtons.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <cxMaskEdit.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Variants.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxmaskedittexteditor
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxMaskEditTextEditorDlg;
class PASCALIMPLEMENTATION TcxMaskEditTextEditorDlg : public Forms::TForm 
{
	typedef Forms::TForm inherited;
	
__published:
	Stdctrls::TLabel* Label1;
	Stdctrls::TLabel* Label2;
	Cxmaskedit::TcxMaskEdit* cxMaskEdit1;
	Stdctrls::TLabel* Label3;
	Extctrls::TBevel* Bevel1;
	Stdctrls::TButton* cxButton2;
	Stdctrls::TButton* cxButton1;
	void __fastcall FormShow(System::TObject* Sender);
	void __fastcall cxButton1Click(System::TObject* Sender);
	void __fastcall cxButton2Click(System::TObject* Sender);
	void __fastcall FormKeyDown(System::TObject* Sender, Word &Key, Classes::TShiftState Shift);
	
private:
	Cxmaskedit::TcxCustomMaskEdit* FMaskEdit;
	
public:
	__property Cxmaskedit::TcxCustomMaskEdit* MaskEdit = {read=FMaskEdit, write=FMaskEdit};
public:
	#pragma option push -w-inl
	/* TCustomForm.Create */ inline __fastcall virtual TcxMaskEditTextEditorDlg(Classes::TComponent* AOwner) : Forms::TForm(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual TcxMaskEditTextEditorDlg(Classes::TComponent* AOwner, int Dummy) : Forms::TForm(AOwner, Dummy) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TcxMaskEditTextEditorDlg(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxMaskEditTextEditorDlg(HWND ParentWindow) : Forms::TForm(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE TcxMaskEditTextEditorDlg* cxMaskEditTextEditorDlg;

}	/* namespace Cxmaskedittexteditor */
using namespace Cxmaskedittexteditor;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxMaskEditTextEditor
