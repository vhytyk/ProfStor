// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'dxStatusIndicatorEditor.pas' rev: 6.00

#ifndef dxStatusIndicatorEditorHPP
#define dxStatusIndicatorEditorHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <dxStatusBar.hpp>	// Pascal unit
#include <CheckLst.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Variants.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Dxstatusindicatoreditor
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TdxStatusBarIndicatorEditor;
class PASCALIMPLEMENTATION TdxStatusBarIndicatorEditor : public Forms::TForm 
{
	typedef Forms::TForm inherited;
	
__published:
	Stdctrls::TButton* BtnOK;
	Stdctrls::TButton* BtnCancel;
	Checklst::TCheckListBox* chlbIndicators;
	Extctrls::TBevel* Bevel1;
	Stdctrls::TButton* BtnAdd;
	Stdctrls::TButton* BtnDelete;
	Stdctrls::TButton* BtnClear;
	Stdctrls::TComboBox* cbItemTypes;
	Stdctrls::TGroupBox* GroupBox1;
	Extctrls::TImage* imgExample;
	void __fastcall FormShow(System::TObject* Sender);
	void __fastcall BtnAddClick(System::TObject* Sender);
	void __fastcall BtnDeleteClick(System::TObject* Sender);
	void __fastcall BtnClearClick(System::TObject* Sender);
	void __fastcall chlbIndicatorsClick(System::TObject* Sender);
	void __fastcall chlbIndicatorsKeyDown(System::TObject* Sender, Word &Key, Classes::TShiftState Shift);
	void __fastcall cbItemTypesChange(System::TObject* Sender);
	
private:
	void __fastcall IndicatorChangeHandler(System::TObject* Sender);
	AnsiString __fastcall IndicatorTypeToStr(const Dxstatusbar::TdxStatusBarStateIndicatorType AIndicatorType);
	Dxstatusbar::TdxStatusBarStateIndicatorType __fastcall StrToIndicatorType(const AnsiString AStr);
	void __fastcall SetControlsState(void);
	void __fastcall SetItemType(void);
	
public:
	Dxstatusbar::TdxStatusBarStateIndicators* Indicators;
	__fastcall virtual TdxStatusBarIndicatorEditor(Classes::TComponent* AOwner);
	__fastcall virtual ~TdxStatusBarIndicatorEditor(void);
	void __fastcall PrepareIndicators(void);
public:
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual TdxStatusBarIndicatorEditor(Classes::TComponent* AOwner, int Dummy) : Forms::TForm(AOwner, Dummy) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TdxStatusBarIndicatorEditor(HWND ParentWindow) : Forms::TForm(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Dxstatusindicatoreditor */
using namespace Dxstatusindicatoreditor;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// dxStatusIndicatorEditor
