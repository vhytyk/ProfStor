// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxShellBrowserDialog.pas' rev: 6.00

#ifndef cxShellBrowserDialogHPP
#define cxShellBrowserDialogHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxLookAndFeels.hpp>	// Pascal unit
#include <cxShellBrowser.hpp>	// Pascal unit
#include <cxShellDlgs.hpp>	// Pascal unit
#include <cxShellControls.hpp>	// Pascal unit
#include <cxShellCommon.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxshellbrowserdialog
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxCustomShellBrowserDialog;
class PASCALIMPLEMENTATION TcxCustomShellBrowserDialog : public Cxshelldlgs::TcxShellDialog 
{
	typedef Cxshelldlgs::TcxShellDialog inherited;
	
private:
	Cxshellbrowser::TcxShellBrowserDlg* FDlg;
	AnsiString FFolderCaption;
	bool FShShowRoot;
	bool FShButtons;
	bool FShInfoTips;
	bool fShShowLines;
	AnsiString fPath;
	Cxlookandfeels::TcxLookAndFeel* FLookAndFeel;
	Cxshelldlgs::TcxDlgShellOptions* fShellOptions;
	Cxshelldlgs::TcxDlgShellRoot* fRoot;
	void __fastcall SetLookAndFeel(Cxlookandfeels::TcxLookAndFeel* Value);
	
protected:
	DYNAMIC Cxshellbrowser::TcxShellBrowserDlg* __fastcall CreateForm(void);
	DYNAMIC bool __fastcall DoExecute(void);
	void __fastcall AssertDlgActive(void);
	void __fastcall AssertDlgNotActive(void);
	__property AnsiString FolderLabelCaption = {read=FFolderCaption, write=FFolderCaption};
	__property Cxshelldlgs::TcxDlgShellOptions* Options = {read=fShellOptions, write=fShellOptions};
	__property bool ShowButtons = {read=FShButtons, write=FShButtons, default=1};
	__property bool ShowInfoTips = {read=FShInfoTips, write=FShInfoTips, default=1};
	__property bool ShowLines = {read=fShShowLines, write=fShShowLines, default=1};
	__property bool ShowRoot = {read=FShShowRoot, write=FShShowRoot, default=1};
	__property Cxshelldlgs::TcxDlgShellRoot* Root = {read=fRoot, write=fRoot};
	__property AnsiString Path = {read=fPath, write=fPath};
	__property Cxlookandfeels::TcxLookAndFeel* LookAndFeel = {read=FLookAndFeel, write=SetLookAndFeel};
	
public:
	__fastcall virtual TcxCustomShellBrowserDialog(Classes::TComponent* aOwner);
	__fastcall virtual ~TcxCustomShellBrowserDialog(void);
};


class DELPHICLASS TcxShellBrowserDialog;
class PASCALIMPLEMENTATION TcxShellBrowserDialog : public TcxCustomShellBrowserDialog 
{
	typedef TcxCustomShellBrowserDialog inherited;
	
__published:
	__property FolderLabelCaption ;
	__property LookAndFeel ;
	__property Options ;
	__property Path ;
	__property Root ;
	__property ShowButtons  = {default=1};
	__property ShowInfoTips  = {default=1};
	__property ShowLines  = {default=1};
	__property ShowRoot  = {default=1};
	__property Title ;
	__property OnFormClose ;
	__property OnFormShow ;
public:
	#pragma option push -w-inl
	/* TcxCustomShellBrowserDialog.Create */ inline __fastcall virtual TcxShellBrowserDialog(Classes::TComponent* aOwner) : TcxCustomShellBrowserDialog(aOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomShellBrowserDialog.Destroy */ inline __fastcall virtual ~TcxShellBrowserDialog(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxshellbrowserdialog */
using namespace Cxshellbrowserdialog;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxShellBrowserDialog
