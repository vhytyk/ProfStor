// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxImportDialog.pas' rev: 6.00

#ifndef cxImportDialogHPP
#define cxImportDialogHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxStyles.hpp>	// Pascal unit
#include <TypInfo.hpp>	// Pascal unit
#include <cxConverterFactory.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <ComCtrls.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
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

namespace Cximportdialog
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxImportDialogForm;
class PASCALIMPLEMENTATION TcxImportDialogForm : public Forms::TForm 
{
	typedef Forms::TForm inherited;
	
__published:
	Extctrls::TPanel* Panel1;
	Stdctrls::TButton* Button1;
	Stdctrls::TButton* Button2;
	Stdctrls::TButton* Button3;
	Stdctrls::TListBox* ListBox1;
	Extctrls::TPanel* Panel2;
	Comctrls::TPageControl* PageControl1;
	Comctrls::TTabSheet* TabSheet2;
	Stdctrls::TGroupBox* GroupBox2;
	Stdctrls::TRadioButton* RadioButton1;
	Stdctrls::TRadioButton* RadioButton2;
	Stdctrls::TEdit* Edit1;
	Stdctrls::TComboBox* ComboBox1;
	Stdctrls::TCheckBox* cbImportStyles;
	void __fastcall Button2Click(System::TObject* Sender);
	void __fastcall Button3Click(System::TObject* Sender);
	void __fastcall FormShow(System::TObject* Sender);
	void __fastcall ListBox1Click(System::TObject* Sender);
	void __fastcall Button1Click(System::TObject* Sender);
	void __fastcall ListBox1DblClick(System::TObject* Sender);
	void __fastcall cbImportStylesClick(System::TObject* Sender);
	void __fastcall RadioButton1Click(System::TObject* Sender);
	void __fastcall RadioButton2Click(System::TObject* Sender);
	void __fastcall FormCreate(System::TObject* Sender);
	void __fastcall TabSheet2Show(System::TObject* Sender);
	
private:
	Designintf::_di_IDesigner FDesigner;
	System::TObject* FDestination;
	AnsiString FGroupConverterName;
	bool FStyleOptionsFirstShow;
	void __fastcall DisableStylesOptions(void);
	void __fastcall DoImport(void);
	void __fastcall EnableStylesOptions(void);
	int __fastcall GetConverterIndex(System::TObject* ASource);
	bool __fastcall IsParent(System::TObject* ASource, const AnsiString AParentClassName);
	void __fastcall LoadComponent(const AnsiString S);
	void __fastcall LoadStyleRepositories(const AnsiString S);
	void __fastcall ShowStyleOptions(void);
	void __fastcall UpdateComboBox(void);
	
protected:
	TMetaClass* __fastcall GetConverterClass(System::TObject* ASource);
	AnsiString __fastcall GetConverterName(System::TObject* ASource);
	virtual void __fastcall InitializeConverter(Cxconverterfactory::TcxCustomConverterWithStyles* AConverter);
	virtual void __fastcall InitializeOptions(void);
	
public:
	__property Designintf::_di_IDesigner Designer_ = {read=FDesigner, write=FDesigner};
	__property System::TObject* Destination = {read=FDestination, write=FDestination};
	__property AnsiString GroupConverterName = {read=FGroupConverterName, write=FGroupConverterName};
public:
	#pragma option push -w-inl
	/* TCustomForm.Create */ inline __fastcall virtual TcxImportDialogForm(Classes::TComponent* AOwner) : Forms::TForm(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual TcxImportDialogForm(Classes::TComponent* AOwner, int Dummy) : Forms::TForm(AOwner, Dummy) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TcxImportDialogForm(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxImportDialogForm(HWND ParentWindow) : Forms::TForm(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE TcxImportDialogForm* cxImportDialogForm;
extern PACKAGE void __fastcall ShowImportDialog(Designintf::_di_IDesigner ADesigner, System::TObject* ADestination, const AnsiString AGroupConverterName);

}	/* namespace Cximportdialog */
using namespace Cximportdialog;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxImportDialog
