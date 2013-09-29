// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxShellBrowser.pas' rev: 6.00

#ifndef cxShellBrowserHPP
#define cxShellBrowserHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxButtons.hpp>	// Pascal unit
#include <cxLookAndFeelPainters.hpp>	// Pascal unit
#include <cxLookAndFeels.hpp>	// Pascal unit
#include <ComCtrls.hpp>	// Pascal unit
#include <FileCtrl.hpp>	// Pascal unit
#include <cxTextEdit.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <ActiveX.hpp>	// Pascal unit
#include <ComObj.hpp>	// Pascal unit
#include <ShlObj.hpp>	// Pascal unit
#include <cxShellDlgs.hpp>	// Pascal unit
#include <cxShellControls.hpp>	// Pascal unit
#include <cxShellCommon.hpp>	// Pascal unit
#include <cxShellTreeView.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
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

namespace Cxshellbrowser
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxShellBrowserDlg;
class PASCALIMPLEMENTATION TcxShellBrowserDlg : public Forms::TForm 
{
	typedef Forms::TForm inherited;
	
__published:
	Cxshelltreeview::TcxShellTreeView* cxStv;
	Stdctrls::TLabel* lblFolder;
	Cxtextedit::TcxTextEdit* cxTeFolder;
	Cxbuttons::TcxButton* cxButton1;
	Cxbuttons::TcxButton* cxButton2;
	void __fastcall FormResize(System::TObject* Sender);
	void __fastcall cxStvChange(System::TObject* Sender, Comctrls::TTreeNode* Node);
	void __fastcall FormPaint(System::TObject* Sender);
	void __fastcall FormCreate(System::TObject* Sender);
	
private:
	Cxlookandfeels::TcxLookAndFeel* FLookAndFeel;
	int FSizeGripWidth;
	int FSizeGripHeight;
	#pragma pack(push, 1)
	Types::TRect FSizeGripRect;
	#pragma pack(pop)
	
	AnsiString __fastcall GetFolder();
	void __fastcall SetFolder(const AnsiString Value);
	AnsiString __fastcall GetCaption();
	void __fastcall SetCaption(const AnsiString Value);
	AnsiString __fastcall GetFolderCaption();
	void __fastcall SetFolderCaption(const AnsiString Value);
	Cxshellcommon::TcxShellOptions* __fastcall GetShellOptions(void);
	void __fastcall SetShellOptions(const Cxshellcommon::TcxShellOptions* Value);
	Cxshellcontrols::TcxShellTreeRoot* __fastcall GetRoot(void);
	void __fastcall SetRoot(const Cxshellcontrols::TcxShellTreeRoot* Value);
	bool __fastcall GetShButtons(void);
	bool __fastcall GetShInfoTips(void);
	bool __fastcall GetShShowLines(void);
	bool __fastcall GetShShowRoot(void);
	void __fastcall SetSfShowRoot(const bool Value);
	void __fastcall SetShButtons(const bool Value);
	void __fastcall SetShInfoTips(const bool Value);
	void __fastcall SetShShowLines(const bool Value);
	HIDESBASE MESSAGE void __fastcall WMNCHitTest(Messages::TWMNCHitTest &Message);
	void __fastcall LFChanged(Cxlookandfeels::TcxLookAndFeel* Sender, Cxlookandfeels::TcxLookAndFeelValues AChangedValues);
	void __fastcall SetLookAndFeel(Cxlookandfeels::TcxLookAndFeel* Value);
	
public:
	__fastcall virtual TcxShellBrowserDlg(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxShellBrowserDlg(void);
	__property AnsiString DlgCaption = {read=GetCaption, write=SetCaption};
	__property AnsiString DlgFolderLabelCaption = {read=GetFolderCaption, write=SetFolderCaption};
	__property Cxshellcommon::TcxShellOptions* DlgOptions = {read=GetShellOptions, write=SetShellOptions};
	__property bool DlgShowButtons = {read=GetShButtons, write=SetShButtons, nodefault};
	__property bool DlgShowInfoTips = {read=GetShInfoTips, write=SetShInfoTips, nodefault};
	__property bool DlgShowLines = {read=GetShShowLines, write=SetShShowLines, nodefault};
	__property bool DlgShowRoot = {read=GetShShowRoot, write=SetSfShowRoot, nodefault};
	__property Cxshellcontrols::TcxShellTreeRoot* DlgRoot = {read=GetRoot, write=SetRoot};
	__property AnsiString DlgFolder = {read=GetFolder, write=SetFolder};
	__property Cxlookandfeels::TcxLookAndFeel* LookAndFeel = {read=FLookAndFeel, write=SetLookAndFeel};
public:
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual TcxShellBrowserDlg(Classes::TComponent* AOwner, int Dummy) : Forms::TForm(AOwner, Dummy) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxShellBrowserDlg(HWND ParentWindow) : Forms::TForm(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxshellbrowser */
using namespace Cxshellbrowser;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxShellBrowser
