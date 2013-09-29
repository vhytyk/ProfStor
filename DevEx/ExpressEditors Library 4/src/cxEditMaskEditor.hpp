// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxEditMaskEditor.pas' rev: 6.00

#ifndef cxEditMaskEditorHPP
#define cxEditMaskEditorHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxCheckBox.hpp>	// Pascal unit
#include <cxEditConsts.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <cxStandardMask.hpp>	// Pascal unit
#include <cxDropDownEdit.hpp>	// Pascal unit
#include <cxTextEdit.hpp>	// Pascal unit
#include <IniFiles.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <cxButtons.hpp>	// Pascal unit
#include <cxMaskEdit.hpp>	// Pascal unit
#include <ComCtrls.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <cxButtonEdit.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
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

namespace Cxeditmaskeditor
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS EcxLoadMaskException;
class PASCALIMPLEMENTATION EcxLoadMaskException : public Sysutils::Exception 
{
	typedef Sysutils::Exception inherited;
	
public:
	#pragma option push -w-inl
	/* Exception.Create */ inline __fastcall EcxLoadMaskException(const AnsiString Msg) : Sysutils::Exception(Msg) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateFmt */ inline __fastcall EcxLoadMaskException(const AnsiString Msg, const System::TVarRec * Args, const int Args_Size) : Sysutils::Exception(Msg, Args, Args_Size) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateRes */ inline __fastcall EcxLoadMaskException(int Ident)/* overload */ : Sysutils::Exception(Ident) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResFmt */ inline __fastcall EcxLoadMaskException(int Ident, const System::TVarRec * Args, const int Args_Size)/* overload */ : Sysutils::Exception(Ident, Args, Args_Size) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateHelp */ inline __fastcall EcxLoadMaskException(const AnsiString Msg, int AHelpContext) : Sysutils::Exception(Msg, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateFmtHelp */ inline __fastcall EcxLoadMaskException(const AnsiString Msg, const System::TVarRec * Args, const int Args_Size, int AHelpContext) : Sysutils::Exception(Msg, Args, Args_Size, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResHelp */ inline __fastcall EcxLoadMaskException(int Ident, int AHelpContext)/* overload */ : Sysutils::Exception(Ident, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResFmtHelp */ inline __fastcall EcxLoadMaskException(System::PResStringRec ResStringRec, const System::TVarRec * Args, const int Args_Size, int AHelpContext)/* overload */ : Sysutils::Exception(ResStringRec, Args, Args_Size, AHelpContext) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~EcxLoadMaskException(void) { }
	#pragma option pop
	
};


struct TcxSample;
typedef TcxSample *PcxSample;

#pragma pack(push, 4)
struct TcxSample
{
	AnsiString ShortDescription;
	AnsiString Description;
	AnsiString Mask;
} ;
#pragma pack(pop)

typedef TcxSample cxEditMaskEditor__2[20];

typedef TcxSample cxEditMaskEditor__3[8];

class DELPHICLASS TcxEditMaskEditorDlg;
class PASCALIMPLEMENTATION TcxEditMaskEditorDlg : public Forms::TForm 
{
	typedef Forms::TForm inherited;
	
__published:
	Cxdropdownedit::TcxComboBox* cxMaskKindPickEdit1;
	Stdctrls::TLabel* Label1;
	Extctrls::TPanel* StandardMaskPanel;
	Extctrls::TPanel* RegExprMaskPanel;
	Cxtextedit::TcxTextEdit* cxEditMaskEdit;
	Stdctrls::TLabel* Label2;
	Stdctrls::TLabel* Label3;
	Cxmaskedit::TcxMaskEdit* cxMaskEdit1;
	Extctrls::TBevel* Bevel1;
	Stdctrls::TListBox* ListBox1;
	Stdctrls::TMemo* Memo1;
	Stdctrls::TLabel* Label4;
	Stdctrls::TLabel* Label5;
	Extctrls::TBevel* Bevel2;
	Cxtextedit::TcxTextEdit* cxTextEdit1;
	Cxmaskedit::TcxMaskEdit* cxMaskEdit2;
	Extctrls::TBevel* Bevel3;
	Stdctrls::TLabel* Label6;
	Stdctrls::TLabel* Label7;
	Stdctrls::TLabel* Label8;
	Stdctrls::TLabel* Label9;
	Cxtextedit::TcxTextEdit* cxTextEdit2;
	Comctrls::TListView* ListView1;
	Stdctrls::TButton* ButtonCancel;
	Stdctrls::TButton* ButtonOK;
	Stdctrls::TButton* RegExprMasksButton;
	Stdctrls::TButton* StandardCancelButton;
	Stdctrls::TButton* StandardOKButton;
	Stdctrls::TButton* StandardMasksButton;
	Cxcheckbox::TcxCheckBox* cxCheckBox1;
	void __fastcall FormShow(System::TObject* Sender);
	void __fastcall cxMaskKindPickEdit1PropertiesChange(System::TObject* Sender);
	void __fastcall FormCreate(System::TObject* Sender);
	void __fastcall cxEditMaskEditKeyDown(System::TObject* Sender, Word &Key, Classes::TShiftState Shift);
	void __fastcall ButtonCancelClick(System::TObject* Sender);
	void __fastcall ButtonOKClick(System::TObject* Sender);
	void __fastcall ListBox1Click(System::TObject* Sender);
	void __fastcall ListBox1Exit(System::TObject* Sender);
	void __fastcall StandardOKButtonClick(System::TObject* Sender);
	void __fastcall StandardCancelButtonClick(System::TObject* Sender);
	void __fastcall ListView1SelectItem(System::TObject* Sender, Comctrls::TListItem* Item, bool Selected);
	void __fastcall cxTextEdit1Exit(System::TObject* Sender);
	void __fastcall cxTextEdit1KeyDown(System::TObject* Sender, Word &Key, Classes::TShiftState Shift);
	void __fastcall cxTextEdit2Exit(System::TObject* Sender);
	void __fastcall cxTextEdit2PropertiesChange(System::TObject* Sender);
	void __fastcall StandardMasksButtonClick(System::TObject* Sender);
	void __fastcall RegExprMasksButtonClick(System::TObject* Sender);
	void __fastcall cxMaskEdit1Enter(System::TObject* Sender);
	void __fastcall cxCheckBox1PropertiesChange(System::TObject* Sender);
	
private:
	Cxmaskedit::TcxCustomMaskEditProperties* FMaskEditProperties;
	int FLastItemIndex;
	void __fastcall ConvertMaskBlank(void);
	void __fastcall CorrectMaskBlank(void);
	void __fastcall FormatStandardMask(AnsiString &AMask, char ANewMaskBlank)/* overload */;
	void __fastcall FormatStandardMask(AnsiString &AMask, bool ANewSaveLiteralChars)/* overload */;
	char __fastcall GetCurrentMaskBlank(void);
	bool __fastcall GetSaveLiteralChars(const AnsiString AEditMask);
	AnsiString __fastcall GetSaveLiteralChartSymbol(const bool AValue);
	void __fastcall LoadMaskDem(AnsiString AFileName);
	void __fastcall LoadMaskDxm(AnsiString AFileName);
	void __fastcall OpenMask(void);
	void __fastcall ShowRegExprSamples(void);
	void __fastcall ShowStandardSamples(void);
	
public:
	__property Cxmaskedit::TcxCustomMaskEditProperties* MaskEditProperties = {read=FMaskEditProperties, write=FMaskEditProperties};
public:
	#pragma option push -w-inl
	/* TCustomForm.Create */ inline __fastcall virtual TcxEditMaskEditorDlg(Classes::TComponent* AOwner) : Forms::TForm(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual TcxEditMaskEditorDlg(Classes::TComponent* AOwner, int Dummy) : Forms::TForm(AOwner, Dummy) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TcxEditMaskEditorDlg(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxEditMaskEditorDlg(HWND ParentWindow) : Forms::TForm(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE Classes::TList* RegExprSamples;
extern PACKAGE Classes::TList* StandardSamples;
static const Shortint DefaultRegExprSamplesCount = 0x14;
extern PACKAGE TcxSample DefaultRegExprSamples[20];
static const Shortint DefaultStandardSamplesCount = 0x8;
extern PACKAGE TcxSample DefaultStandardSamples[8];
extern PACKAGE TcxEditMaskEditorDlg* cxEditMaskEditorDlg;

}	/* namespace Cxeditmaskeditor */
using namespace Cxeditmaskeditor;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxEditMaskEditor
