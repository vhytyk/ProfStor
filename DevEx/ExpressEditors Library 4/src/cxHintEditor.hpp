// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxHintEditor.pas' rev: 6.00

#ifndef cxHintEditorHPP
#define cxHintEditorHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxSpinButton.hpp>	// Pascal unit
#include <cxListBox.hpp>	// Pascal unit
#include <cxCheckListBox.hpp>	// Pascal unit
#include <cxLookAndFeelPainters.hpp>	// Pascal unit
#include <cxLabel.hpp>	// Pascal unit
#include <cxSpinEdit.hpp>	// Pascal unit
#include <cxHint.hpp>	// Pascal unit
#include <cxLookAndFeels.hpp>	// Pascal unit
#include <cxButtons.hpp>	// Pascal unit
#include <cxRadioGroup.hpp>	// Pascal unit
#include <cxListView.hpp>	// Pascal unit
#include <cxTrackBar.hpp>	// Pascal unit
#include <cxExtEditConsts.hpp>	// Pascal unit
#include <cxColorComboBox.hpp>	// Pascal unit
#include <cxCheckBox.hpp>	// Pascal unit
#include <cxGroupBox.hpp>	// Pascal unit
#include <cxFontNameComboBox.hpp>	// Pascal unit
#include <cxDropDownEdit.hpp>	// Pascal unit
#include <cxMaskEdit.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <cxMemo.hpp>	// Pascal unit
#include <cxTextEdit.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <cxSplitter.hpp>	// Pascal unit
#include <ComCtrls.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
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

namespace Cxhinteditor
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxHintStyleEditor;
class PASCALIMPLEMENTATION TcxHintStyleEditor : public Forms::TForm 
{
	typedef Forms::TForm inherited;
	
__published:
	Cxbuttons::TcxButton* cxBtnOk;
	Cxbuttons::TcxButton* cxBtnCancel;
	Cxcheckbox::TcxCheckBox* cxCbStandard;
	Cxgroupbox::TcxGroupBox* cxGbHintFont;
	Stdctrls::TLabel* Label1;
	Stdctrls::TLabel* Label2;
	Stdctrls::TLabel* Label3;
	Cxfontnamecombobox::TcxFontNameComboBox* cxFnHint;
	Cxchecklistbox::TcxCheckListBox* cxClbHintFontStyles;
	Cxlistbox::TcxListBox* cxLbHfSize;
	Cxcolorcombobox::TcxColorComboBox* cxCcbHintFontColour;
	Cxgroupbox::TcxGroupBox* cxgbHintCapFont;
	Stdctrls::TLabel* Label4;
	Stdctrls::TLabel* Label5;
	Stdctrls::TLabel* Label6;
	Cxfontnamecombobox::TcxFontNameComboBox* cxFnHinCap;
	Cxchecklistbox::TcxCheckListBox* cxClbHintCapFontStyles;
	Cxlistbox::TcxListBox* cxLbHcfSize;
	Cxcolorcombobox::TcxColorComboBox* cxCcbHintCapColor;
	Cxgroupbox::TcxGroupBox* cxGbHintShape;
	Stdctrls::TLabel* Label7;
	Stdctrls::TLabel* Label8;
	Cxdropdownedit::TcxComboBox* cxCbHintCalloutPos;
	Cxcheckbox::TcxCheckBox* cxcbHintRounded;
	Cxspinedit::TcxSpinEdit* cxSeHintRadius;
	Cxgroupbox::TcxGroupBox* cxGbHintIcons;
	Stdctrls::TLabel* Label11;
	Cxdropdownedit::TcxComboBox* cxCbHintIconType;
	Cxradiogroup::TcxRadioButton* cxRbHIDef;
	Cxradiogroup::TcxRadioButton* cxRbHILarge;
	Cxradiogroup::TcxRadioButton* cxRbHISmall;
	Cxgroupbox::TcxGroupBox* cxGbHintPause;
	Stdctrls::TLabel* Label18;
	Stdctrls::TLabel* Label19;
	Stdctrls::TLabel* Label20;
	Cxspinedit::TcxSpinEdit* cxSeHintHidePause;
	Cxspinedit::TcxSpinEdit* cxSeHintPause;
	Cxspinedit::TcxSpinEdit* cxSeShortHintPause;
	Stdctrls::TLabel* lblHintColour;
	Cxcolorcombobox::TcxColorComboBox* cxCcbHintColour;
	Cxgroupbox::TcxGroupBox* cxGbHintAnimation;
	Stdctrls::TLabel* Label9;
	Stdctrls::TLabel* Label10;
	Cxdropdownedit::TcxComboBox* cxCbHintAniStyle;
	Cxspinedit::TcxSpinEdit* cxSeHintDelay;
	Cxgroupbox::TcxGroupBox* cxGbPreview;
	Cxlookandfeels::TcxLookAndFeelController* cxLookAndFeelController1;
	Cxhint::TcxHintStyleController* cxHsc;
	Extctrls::TPanel* pnlPreview;
	void __fastcall FormCreate(System::TObject* Sender);
	void __fastcall FormDestroy(System::TObject* Sender);
	void __fastcall cxFnHintClick(System::TObject* Sender);
	void __fastcall cxCcbHintColourClick(System::TObject* Sender);
	void __fastcall cxCbHintCalloutPosClick(System::TObject* Sender);
	void __fastcall cxSeHintRadiusPropertiesChange(System::TObject* Sender);
	void __fastcall cxcbHintRoundedPropertiesChange(System::TObject* Sender);
	void __fastcall cxCbHintAniStylePropertiesChange(System::TObject* Sender);
	void __fastcall cxSeHintDelayPropertiesChange(System::TObject* Sender);
	void __fastcall cxCbHintIconTypeClick(System::TObject* Sender);
	void __fastcall cxRbHIDefClick(System::TObject* Sender);
	void __fastcall cxSeHintHidePausePropertiesChange(System::TObject* Sender);
	void __fastcall cxSeHintPausePropertiesChange(System::TObject* Sender);
	void __fastcall cxSeShortHintPausePropertiesEditValueChanged(System::TObject* Sender);
	void __fastcall cxClbHintFontStylesClick(System::TObject* Sender);
	void __fastcall cxCcbHintFontColourClick(System::TObject* Sender);
	void __fastcall cxCcbHintCapColorClick(System::TObject* Sender);
	void __fastcall cxFnHintPropertiesChange(System::TObject* Sender);
	void __fastcall cxLbHfSizeClick(System::TObject* Sender);
	void __fastcall cxLbHcfSizeClick(System::TObject* Sender);
	void __fastcall cxFnHinCapPropertiesChange(System::TObject* Sender);
	void __fastcall cxCbStandardClick(System::TObject* Sender);
	void __fastcall cxFnHinCapClick(System::TObject* Sender);
	
private:
	Classes::TStringList* fViewerFontSizes;
	int fHintHorz;
	int fHintVert;
	bool fFormLoaded;
	void __fastcall SetHsc(const Cxhint::TcxHintStyleController* Value);
	void __fastcall RefreshHint(void);
	HIDESBASE MESSAGE void __fastcall WMMove(Messages::TWMMove &Message);
	HIDESBASE MESSAGE void __fastcall WMActivate(Messages::TWMActivate &Message);
	
public:
	void __fastcall SetHintController(Cxhint::TcxHintStyleController* aDest);
	void __fastcall LoadHintCtrls(void);
	__property Cxhint::TcxHintStyleController* HintController = {read=cxHsc, write=SetHsc};
public:
	#pragma option push -w-inl
	/* TCustomForm.Create */ inline __fastcall virtual TcxHintStyleEditor(Classes::TComponent* AOwner) : Forms::TForm(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual TcxHintStyleEditor(Classes::TComponent* AOwner, int Dummy) : Forms::TForm(AOwner, Dummy) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TcxHintStyleEditor(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxHintStyleEditor(HWND ParentWindow) : Forms::TForm(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE TcxHintStyleEditor* cxHintStyleEditor;

}	/* namespace Cxhinteditor */
using namespace Cxhinteditor;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxHintEditor
