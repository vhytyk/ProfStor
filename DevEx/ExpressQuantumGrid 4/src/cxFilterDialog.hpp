// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxFilterDialog.pas' rev: 6.00

#ifndef cxFilterDialogHPP
#define cxFilterDialogHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxRadioGroup.hpp>	// Pascal unit
#include <cxLookAndFeelPainters.hpp>	// Pascal unit
#include <cxTextEdit.hpp>	// Pascal unit
#include <cxMaskEdit.hpp>	// Pascal unit
#include <cxLookAndFeels.hpp>	// Pascal unit
#include <cxFilterControlUtils.hpp>	// Pascal unit
#include <cxFilterConsts.hpp>	// Pascal unit
#include <cxFilter.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxDropDownEdit.hpp>	// Pascal unit
#include <cxDataStorage.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <cxButtons.hpp>	// Pascal unit
#include <cxButtonEdit.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxfilterdialog
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxFilterDialog;
class PASCALIMPLEMENTATION TcxFilterDialog : public Forms::TForm 
{
	typedef Forms::TForm inherited;
	
__published:
	Stdctrls::TLabel* lblTitle;
	Stdctrls::TLabel* lblColumnCaption;
	Extctrls::TBevel* bvlLine;
	Stdctrls::TLabel* lblSingle;
	Stdctrls::TLabel* lblSeries;
	Cxbuttons::TcxButton* btnOK;
	Cxbuttons::TcxButton* btnCancel;
	Stdctrls::TLabel* lblEdit1PlaceHolder;
	Stdctrls::TLabel* lblEdit2PlaceHolder;
	Cxdropdownedit::TcxComboBox* cbOperator1;
	Cxdropdownedit::TcxComboBox* cbOperator2;
	Cxradiogroup::TcxRadioButton* rbAnd;
	Cxradiogroup::TcxRadioButton* rbOr;
	void __fastcall FormCloseQuery(System::TObject* Sender, bool &CanClose);
	void __fastcall cbOperator1Click(System::TObject* Sender);
	void __fastcall cbOperator2PropertiesChange(System::TObject* Sender);
	
private:
	Cxfilter::TcxFilterCriteria* FCriteria;
	AnsiString FDisplayValue1;
	AnsiString FDisplayValue2;
	Cxedit::TcxCustomEdit* FEdit1;
	Cxedit::TcxCustomEdit* FEdit2;
	TMetaClass*FFilterEditHelper;
	Cxedit::TcxCustomEditProperties* FEditProperties;
	Cxfiltercontrolutils::TcxFilterControlOperators FSupportedOperators;
	Variant FValue1;
	Variant FValue2;
	TMetaClass*FValueTypeClass;
	HWND FParentWindow;
	void __fastcall CheckVisibleDesc(void);
	Cxdropdownedit::TcxComboBox* __fastcall GetcbOperator(Cxedit::TcxCustomEdit* AEdit);
	void __fastcall SetEditValidChars(Cxedit::TcxCustomEdit* AEdit);
	void __fastcall ValidateValue(Cxedit::TcxCustomEdit* AEdit, Variant &AValue);
	
protected:
	virtual void __fastcall CreateParams(Controls::TCreateParams &Params);
	
public:
	__fastcall virtual TcxFilterDialog(Classes::TComponent* AOwner);
public:
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual TcxFilterDialog(Classes::TComponent* AOwner, int Dummy) : Forms::TForm(AOwner, Dummy) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TcxFilterDialog(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxFilterDialog(HWND ParentWindow) : Forms::TForm(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE bool __fastcall IsFilterControlDialogNeeded(Cxfilter::TcxFilterCriteria* ACriteria);
extern PACKAGE bool __fastcall ShowFilterDialog(Cxfilter::TcxFilterCriteria* ACriteria, System::TObject* AItemLink, Cxedit::TcxCustomEditProperties* AEditProperties, const AnsiString ACriteriaItemCaption, TMetaClass* AValueTypeClass, Cxlookandfeels::TcxLookAndFeel* ALookAndFeel = (Cxlookandfeels::TcxLookAndFeel*)(0x0));

}	/* namespace Cxfilterdialog */
using namespace Cxfilterdialog;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxFilterDialog
