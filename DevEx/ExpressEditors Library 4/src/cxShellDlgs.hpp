// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxShellDlgs.pas' rev: 6.00

#ifndef cxShellDlgsHPP
#define cxShellDlgsHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxLookAndFeels.hpp>	// Pascal unit
#include <cxShellCommon.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxshelldlgs
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxDlgShellOptions;
class PASCALIMPLEMENTATION TcxDlgShellOptions : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	bool FShowFolders;
	bool FShowToolTip;
	bool FTrackShellChanges;
	bool FContextMenus;
	bool FShowNonFolders;
	bool FShowHidden;
	bool FAutoBrowseFolder;
	
public:
	__fastcall TcxDlgShellOptions(void);
	
__published:
	__property bool ShowFolders = {read=FShowFolders, write=FShowFolders, default=1};
	__property bool ShowNonFolders = {read=FShowNonFolders, write=FShowNonFolders, default=0};
	__property bool ShowHidden = {read=FShowHidden, write=FShowHidden, default=0};
	__property bool ContextMenus = {read=FContextMenus, write=FContextMenus, default=1};
	__property bool TrackShellChanges = {read=FTrackShellChanges, write=FTrackShellChanges, default=1};
	__property bool ShowToolTip = {read=FShowToolTip, write=FShowToolTip, default=0};
	__property bool AutoBrowseFolder = {read=FAutoBrowseFolder, write=FAutoBrowseFolder, default=1};
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxDlgShellOptions(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxDlgShellRoot;
class PASCALIMPLEMENTATION TcxDlgShellRoot : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	AnsiString fCustomPath;
	Cxshellcommon::TcxBrowseFolder fBroFold;
	
public:
	__fastcall TcxDlgShellRoot(void);
	
__published:
	__property Cxshellcommon::TcxBrowseFolder BrowseFolder = {read=fBroFold, write=fBroFold, default=11};
	__property AnsiString CustomPath = {read=fCustomPath, write=fCustomPath};
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxDlgShellRoot(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxShellDialog;
class PASCALIMPLEMENTATION TcxShellDialog : public Classes::TComponent 
{
	typedef Classes::TComponent inherited;
	
private:
	AnsiString fTitle;
	Classes::TNotifyEvent fOnFormShow;
	Classes::TNotifyEvent fOnFormClose;
	bool fExecuting;
	
protected:
	DYNAMIC bool __fastcall DoExecute(void) = 0 ;
	__property bool Executing = {read=fExecuting, nodefault};
	__property AnsiString Title = {read=fTitle, write=fTitle};
	__property Classes::TNotifyEvent OnFormClose = {read=fOnFormClose, write=fOnFormClose};
	__property Classes::TNotifyEvent OnFormShow = {read=fOnFormShow, write=fOnFormShow};
	
public:
	__fastcall virtual TcxShellDialog(Classes::TComponent* aOwner);
	bool __fastcall Execute(void);
public:
	#pragma option push -w-inl
	/* TComponent.Destroy */ inline __fastcall virtual ~TcxShellDialog(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxshelldlgs */
using namespace Cxshelldlgs;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxShellDlgs
