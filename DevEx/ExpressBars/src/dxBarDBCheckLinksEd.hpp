// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'dxBarDBCheckLinksEd.pas' rev: 6.00

#ifndef dxBarDBCheckLinksEdHPP
#define dxBarDBCheckLinksEdHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <dxBar.hpp>	// Pascal unit
#include <dxBarDBNav.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
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

namespace Dxbardbchecklinksed
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TdxBarDBCheckLinksEditor;
class PASCALIMPLEMENTATION TdxBarDBCheckLinksEditor : public Forms::TForm 
{
	typedef Forms::TForm inherited;
	
__published:
	Stdctrls::TGroupBox* GroupBox1;
	Stdctrls::TListBox* ListBox;
	Stdctrls::TGroupBox* GroupBox2;
	Stdctrls::TComboBox* ComboBox;
	Stdctrls::TCheckBox* CheckBox1;
	Stdctrls::TCheckBox* CheckBox4;
	Stdctrls::TCheckBox* CheckBox2;
	Stdctrls::TCheckBox* CheckBox5;
	Stdctrls::TCheckBox* CheckBox6;
	Stdctrls::TCheckBox* CheckBox3;
	Stdctrls::TLabel* Label1;
	Stdctrls::TLabel* Label2;
	Stdctrls::TButton* Button3;
	Stdctrls::TButton* Button4;
	Stdctrls::TButton* Button1;
	Stdctrls::TButton* Button2;
	Extctrls::TBevel* Bevel1;
	void __fastcall Button3Click(System::TObject* Sender);
	void __fastcall Button4Click(System::TObject* Sender);
	void __fastcall ListBoxClick(System::TObject* Sender);
	void __fastcall Button1Click(System::TObject* Sender);
	void __fastcall Button2Click(System::TObject* Sender);
	
private:
	Dxbardbnav::TdxBarDBNavigator* FBarDBNavigator;
	Dxbardbnav::TdxBarDBCheckLink* SelectedDBCheckLink;
	void __fastcall RefreshItems(int OldIndex);
public:
	#pragma option push -w-inl
	/* TCustomForm.Create */ inline __fastcall virtual TdxBarDBCheckLinksEditor(Classes::TComponent* AOwner) : Forms::TForm(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual TdxBarDBCheckLinksEditor(Classes::TComponent* AOwner, int Dummy) : Forms::TForm(AOwner, Dummy) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TdxBarDBCheckLinksEditor(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TdxBarDBCheckLinksEditor(HWND ParentWindow) : Forms::TForm(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE bool __fastcall dxBarDBCheckLinksEditor(Dxbardbnav::TdxBarDBNavigator* ABarDBNavigator);

}	/* namespace Dxbardbchecklinksed */
using namespace Dxbardbchecklinksed;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// dxBarDBCheckLinksEd
