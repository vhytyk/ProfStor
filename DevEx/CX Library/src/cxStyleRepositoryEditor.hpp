// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxStyleRepositoryEditor.pas' rev: 6.00

#ifndef cxStyleRepositoryEditorHPP
#define cxStyleRepositoryEditorHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <DesignWindows.hpp>	// Pascal unit
#include <ComCtrls.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <cxStyles.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <cxDesignWindows.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Variants.hpp>	// Pascal unit
#include <DesignIntf.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxstylerepositoryeditor
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxStyleRepositoryEditor;
class PASCALIMPLEMENTATION TcxStyleRepositoryEditor : public Cxdesignwindows::TcxDesignFormEditor 
{
	typedef Cxdesignwindows::TcxDesignFormEditor inherited;
	
__published:
	Stdctrls::TListBox* lbStyles;
	Stdctrls::TButton* btStyleAdd;
	Stdctrls::TButton* btStyleDelete;
	Stdctrls::TButton* btClose;
	Extctrls::TPanel* pnlStyles;
	Menus::TPopupMenu* pmStyles;
	Menus::TMenuItem* miStyleAdd;
	Menus::TMenuItem* miStyleDelete;
	Menus::TMenuItem* N1;
	Menus::TMenuItem* miStyleSelectAll;
	Comctrls::TPageControl* PageControl1;
	Comctrls::TTabSheet* tsStyles;
	Comctrls::TTabSheet* tsStyleSheets;
	Stdctrls::TListBox* lbStyleSheets;
	Extctrls::TPanel* pnlStyleSheets;
	Stdctrls::TButton* btStyleSheetAdd;
	Stdctrls::TButton* btStyleSheetDelete;
	Stdctrls::TButton* Button3;
	Menus::TPopupMenu* pmStyleSheets;
	Menus::TMenuItem* miStyleSheetAdd;
	Menus::TMenuItem* miStyleSheetDelete;
	Menus::TMenuItem* MenuItem3;
	Menus::TMenuItem* miStyleSheetSelectAll;
	Stdctrls::TButton* btnStyleSheetEdit;
	Menus::TMenuItem* imStyleSheetEdit;
	Menus::TPopupMenu* pmAddStyleSheet;
	Stdctrls::TButton* btnStyleSheetsSave;
	Dialogs::TSaveDialog* SaveDialog;
	Stdctrls::TButton* btnStyleSheetsLoad;
	Dialogs::TOpenDialog* OpenDialog;
	Stdctrls::TButton* btnStyleSheetsPredefine;
	void __fastcall lbStylesClick(System::TObject* Sender);
	void __fastcall btStyleDeleteClick(System::TObject* Sender);
	void __fastcall btCloseClick(System::TObject* Sender);
	void __fastcall btStyleAddClick(System::TObject* Sender);
	void __fastcall miStyleSelectAllClick(System::TObject* Sender);
	void __fastcall btStyleSheetAddClick(System::TObject* Sender);
	void __fastcall btStyleSheetDeleteClick(System::TObject* Sender);
	void __fastcall miStyleSheetSelectAllClick(System::TObject* Sender);
	void __fastcall lbStyleSheetsClick(System::TObject* Sender);
	void __fastcall btnStyleSheetEditClick(System::TObject* Sender);
	void __fastcall btnStyleSheetsSaveClick(System::TObject* Sender);
	void __fastcall btnStyleSheetsLoadClick(System::TObject* Sender);
	void __fastcall btnStyleSheetsPredefineClick(System::TObject* Sender);
	
private:
	void __fastcall AddStyleSheets(Classes::TList* AList);
	AnsiString __fastcall DoStyleGetName(Cxstyles::TcxStyle* AStyle);
	void __fastcall DoAddStyleSheetMenuItemClick(System::TObject* Sender);
	void __fastcall InitAddStyleSheetMenu(void);
	void __fastcall ListBoxSelectComponents(Stdctrls::TListBox* AListBox);
	Cxstyles::TcxStyleRepository* __fastcall GetStyleRepository(void);
	void __fastcall UpdateButtons(void);
	void __fastcall UpdateDesigner(System::TObject* Sender);
	void __fastcall UpdateItems(void);
	void __fastcall SelectItem(Stdctrls::TListBox* AListBox, void * AItem);
	void * __fastcall FindItemToSelect(Stdctrls::TListBox* AListBox);
	void __fastcall DeleteSelectedComponents(Stdctrls::TListBox* AListBox);
	
protected:
	virtual void __fastcall InitFormEditor(void);
	
public:
	virtual void __fastcall DoItemsModified(void);
	virtual void __fastcall SelectionsChanged(const Designintf::_di_IDesignerSelections ASelection);
	__property Cxstyles::TcxStyleRepository* StyleRepository = {read=GetStyleRepository};
public:
	#pragma option push -w-inl
	/* TDesignWindow.Create */ inline __fastcall virtual TcxStyleRepositoryEditor(Classes::TComponent* AOwner) : Cxdesignwindows::TcxDesignFormEditor(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TDesignWindow.Destroy */ inline __fastcall virtual ~TcxStyleRepositoryEditor(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual TcxStyleRepositoryEditor(Classes::TComponent* AOwner, int Dummy) : Cxdesignwindows::TcxDesignFormEditor(AOwner, Dummy) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxStyleRepositoryEditor(HWND ParentWindow) : Cxdesignwindows::TcxDesignFormEditor(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE void __fastcall ShowStyleRepositoryEditor(Designintf::_di_IDesigner ADesigner, Cxstyles::TcxStyleRepository* AStyleRepository);

}	/* namespace Cxstylerepositoryeditor */
using namespace Cxstylerepositoryeditor;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxStyleRepositoryEditor
