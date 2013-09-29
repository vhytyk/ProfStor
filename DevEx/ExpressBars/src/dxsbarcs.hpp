// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'dxsbarcs.pas' rev: 6.00

#ifndef dxsbarcsHPP
#define dxsbarcsHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <dxsbar.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <dximctrl.hpp>	// Pascal unit
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

namespace Dxsbarcs
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TfrmSideBarCustomize;
class PASCALIMPLEMENTATION TfrmSideBarCustomize : public Dxsbar::TdxSideBarStoreCustomizeForm 
{
	typedef Dxsbar::TdxSideBarStoreCustomizeForm inherited;
	
__published:
	Extctrls::TPanel* Panel1;
	Extctrls::TPanel* Panel2;
	Extctrls::TPanel* Panel3;
	Stdctrls::TListBox* ListBox;
	Extctrls::TPanel* Panel4;
	Stdctrls::TButton* Button;
	Dximctrl::TdxImageListBox* ImageListBox;
	void __fastcall FormClose(System::TObject* Sender, Forms::TCloseAction &Action);
	void __fastcall ListBoxClick(System::TObject* Sender);
	void __fastcall ImageListBoxStartDrag(System::TObject* Sender, Controls::TDragObject* &DragObject);
	void __fastcall ImageListBoxEndDrag(System::TObject* Sender, System::TObject* Target, int X, int Y);
	void __fastcall ButtonClick(System::TObject* Sender);
	void __fastcall FormCreate(System::TObject* Sender);
	void __fastcall ImageListBoxDragOver(System::TObject* Sender, System::TObject* Source, int X, int Y, Controls::TDragState State, bool &Accept);
	void __fastcall ImageListBoxDragDrop(System::TObject* Sender, System::TObject* Source, int X, int Y);
	
private:
	HIDESBASE MESSAGE void __fastcall WMGetMinMaxInfo(Messages::TMessage &Message);
	
public:
	__fastcall virtual TfrmSideBarCustomize(Classes::TComponent* AOwner);
public:
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual TfrmSideBarCustomize(Classes::TComponent* AOwner, int Dummy) : Dxsbar::TdxSideBarStoreCustomizeForm(AOwner, Dummy) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TfrmSideBarCustomize(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TfrmSideBarCustomize(HWND ParentWindow) : Dxsbar::TdxSideBarStoreCustomizeForm(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE void __fastcall SideBarCustomize(Dxsbar::TdxSideBarStore* AStore);

}	/* namespace Dxsbarcs */
using namespace Dxsbarcs;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// dxsbarcs
