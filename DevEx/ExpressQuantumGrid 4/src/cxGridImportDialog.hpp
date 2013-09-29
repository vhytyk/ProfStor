// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxGridImportDialog.pas' rev: 6.00

#ifndef cxGridImportDialogHPP
#define cxGridImportDialogHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxStyles.hpp>	// Pascal unit
#include <ComCtrls.hpp>	// Pascal unit
#include <cxGridCustomView.hpp>	// Pascal unit
#include <cxGridLevel.hpp>	// Pascal unit
#include <cxGridStructureNavigator.hpp>	// Pascal unit
#include <TypInfo.hpp>	// Pascal unit
#include <cxGrid.hpp>	// Pascal unit
#include <cxGridConverter.hpp>	// Pascal unit
#include <cxConverterFactory.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <Variants.hpp>	// Pascal unit
#include <DesignIntf.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxgridimportdialog
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TImportDialog;
class PASCALIMPLEMENTATION TImportDialog : public Forms::TForm 
{
	typedef Forms::TForm inherited;
	
__published:
	Extctrls::TPanel* Panel1;
	Stdctrls::TButton* Button1;
	Stdctrls::TButton* Button2;
	Stdctrls::TListBox* ListBox1;
	Stdctrls::TButton* Button3;
	Extctrls::TPanel* Panel2;
	Extctrls::TPanel* Panel3;
	Stdctrls::TLabel* lbCurrentLevelName;
	Stdctrls::TCheckBox* cbDeleteAllSublevels;
	Stdctrls::TGroupBox* GroupBox1;
	Stdctrls::TLabel* Label1;
	Comctrls::TPageControl* PageControl1;
	Comctrls::TTabSheet* TabSheet1;
	Comctrls::TTabSheet* TabSheet2;
	Stdctrls::TRadioButton* RadioButton1;
	Stdctrls::TRadioButton* RadioButton2;
	Stdctrls::TEdit* Edit1;
	Stdctrls::TGroupBox* GroupBox2;
	Stdctrls::TCheckBox* cbImportStyles;
	Stdctrls::TComboBox* ComboBox1;
	void __fastcall Button2Click(System::TObject* Sender);
	void __fastcall FormShow(System::TObject* Sender);
	void __fastcall Button1Click(System::TObject* Sender);
	void __fastcall FormCreate(System::TObject* Sender);
	void __fastcall FormKeyDown(System::TObject* Sender, Word &Key, Classes::TShiftState Shift);
	void __fastcall ListBox1Click(System::TObject* Sender);
	void __fastcall ListBox1DblClick(System::TObject* Sender);
	void __fastcall Button3Click(System::TObject* Sender);
	void __fastcall FormDestroy(System::TObject* Sender);
	void __fastcall cbImportStylesClick(System::TObject* Sender);
	void __fastcall RadioButton1Click(System::TObject* Sender);
	void __fastcall RadioButton2Click(System::TObject* Sender);
	void __fastcall TabSheet2Show(System::TObject* Sender);
	
private:
	Cxgrid::TcxCustomGrid* FcxGrid;
	Cxgridlevel::TcxGridLevel* FCurrentLevel;
	Designintf::_di_IDesigner FDesigner;
	Cxgridstructurenavigator::TcxGridStructureControl* FGridStructureControl;
	Cxgridstructurenavigator::TcxGridStructureHelper* FGridStructureHelper;
	Classes::TStringList* FIntermediaryList;
	bool FStyleOptionsFirstShow;
	TMetaClass* __fastcall GetConverterClass(System::TObject* ASource);
	int __fastcall GetConverterIndex(System::TObject* ASource);
	void __fastcall LoadComponent(const AnsiString S);
	void __fastcall LoadIntermediary(const AnsiString S);
	void __fastcall LoadStyleRepositories(const AnsiString S);
	void __fastcall DoImport(void);
	void __fastcall DisableStylesOptions(void);
	void __fastcall EnableStylesOptions(void);
	Classes::TComponent* __fastcall GetIntermediaryComponent(void);
	bool __fastcall IsParent(System::TObject* ASource, const AnsiString AParentClassName);
	void __fastcall UpdateComboBox(void);
	void __fastcall UpdateDesigner(System::TObject* Sender);
	
public:
	void __fastcall SelectionChanged(System::TObject* Sender);
	__property Cxgrid::TcxCustomGrid* cxGrid = {read=FcxGrid, write=FcxGrid};
	__property Designintf::_di_IDesigner Designer_ = {read=FDesigner, write=FDesigner};
public:
	#pragma option push -w-inl
	/* TCustomForm.Create */ inline __fastcall virtual TImportDialog(Classes::TComponent* AOwner) : Forms::TForm(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual TImportDialog(Classes::TComponent* AOwner, int Dummy) : Forms::TForm(AOwner, Dummy) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TImportDialog(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TImportDialog(HWND ParentWindow) : Forms::TForm(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE TImportDialog* ImportDialog;
extern PACKAGE void __fastcall ShowGridImportDialog(Designintf::_di_IDesigner ADesigner, Cxgrid::TcxCustomGrid* AGrid);

}	/* namespace Cxgridimportdialog */
using namespace Cxgridimportdialog;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxGridImportDialog
