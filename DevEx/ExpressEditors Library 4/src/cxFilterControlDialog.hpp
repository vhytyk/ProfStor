// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxFilterControlDialog.pas' rev: 6.00

#ifndef cxFilterControlDialogHPP
#define cxFilterControlDialogHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Types.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <cxLookAndFeels.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <cxFilterControl.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <cxButtons.hpp>	// Pascal unit
#include <cxLookAndFeelPainters.hpp>	// Pascal unit
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

namespace Cxfiltercontroldialog
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TfmFilterControlDialog;
class PASCALIMPLEMENTATION TfmFilterControlDialog : public Forms::TForm 
{
	typedef Forms::TForm inherited;
	
__published:
	Extctrls::TPanel* pnlBottom;
	Cxbuttons::TcxButton* btOpen;
	Cxbuttons::TcxButton* btSave;
	Dialogs::TOpenDialog* OpenDialog;
	Dialogs::TSaveDialog* SaveDialog;
	Extctrls::TPanel* pnlBottomRight;
	Cxbuttons::TcxButton* btApply;
	Cxbuttons::TcxButton* btCancel;
	Cxbuttons::TcxButton* btOk;
	void __fastcall acApplyExecute(System::TObject* Sender);
	void __fastcall acOkExecute(System::TObject* Sender);
	void __fastcall acOpenExecute(System::TObject* Sender);
	void __fastcall acSaveExecute(System::TObject* Sender);
	void __fastcall FormClose(System::TObject* Sender, Forms::TCloseAction &Action);
	void __fastcall btCancelClick(System::TObject* Sender);
	void __fastcall FormKeyPress(System::TObject* Sender, char &Key);
	
private:
	HWND FParentWindow;
	Cxfiltercontrol::TcxCustomFilterControl* FFilterControl;
	void __fastcall Initialize(const AnsiString AInitialDir);
	void __fastcall SetLookAndFeel(Cxlookandfeels::TcxLookAndFeel* ALookAndFeel);
	void __fastcall SetTitle(const AnsiString ATitle);
	
protected:
	virtual void __fastcall CreateParams(Controls::TCreateParams &Params);
	
public:
	__fastcall virtual TfmFilterControlDialog(Classes::TComponent* AOwner);
	__property Cxfiltercontrol::TcxCustomFilterControl* FilterControl = {read=FFilterControl};
public:
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual TfmFilterControlDialog(Classes::TComponent* AOwner, int Dummy) : Forms::TForm(AOwner, Dummy) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TfmFilterControlDialog(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TfmFilterControlDialog(HWND ParentWindow) : Forms::TForm(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE Types::TRect cxFilterDialogPosition;
extern PACKAGE bool __fastcall cxInternalExecuteFilterControlDialog(TMetaClass* AFilterControlClass, Classes::TComponent* ALink, Cxlookandfeels::TcxLookAndFeel* ALookAndFeel, Classes::TNotifyEvent AOnApplyProc = 0x0, Classes::TNotifyEvent AOnShowDialog = 0x0, Graphics::TColor AColor = (Graphics::TColor)(0x20000000), const AnsiString AInitialDir = "");
extern PACKAGE bool __fastcall ExecuteFilterControlDialog(Classes::TComponent* ALinkComponent, Cxlookandfeels::TcxLookAndFeel* ALookAndFeel, Classes::TNotifyEvent AOnApplyProc = 0x0, Classes::TNotifyEvent AOnShowDialog = 0x0, Graphics::TColor AColor = (Graphics::TColor)(0x20000000), const AnsiString AInitialDir = "");

}	/* namespace Cxfiltercontroldialog */
using namespace Cxfiltercontroldialog;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxFilterControlDialog
