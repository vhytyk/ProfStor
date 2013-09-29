// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxEditRepositoryEditor.pas' rev: 6.00

#ifndef cxEditRepositoryEditorHPP
#define cxEditRepositoryEditorHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <DesignWindows.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
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

namespace Cxeditrepositoryeditor
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxEditRepositoryEditor;
class PASCALIMPLEMENTATION TcxEditRepositoryEditor : public Cxdesignwindows::TcxDesignFormEditor 
{
	typedef Cxdesignwindows::TcxDesignFormEditor inherited;
	
__published:
	Stdctrls::TListBox* LBItems;
	Stdctrls::TButton* btAdd;
	Stdctrls::TButton* btDelete;
	Stdctrls::TButton* btClose;
	Extctrls::TPanel* Panel1;
	Menus::TPopupMenu* PopupMenu1;
	Menus::TMenuItem* miAdd;
	Menus::TMenuItem* miDelete;
	Menus::TMenuItem* N1;
	Menus::TMenuItem* miSelectAll;
	void __fastcall LBItemsClick(System::TObject* Sender);
	void __fastcall btDeleteClick(System::TObject* Sender);
	void __fastcall btCloseClick(System::TObject* Sender);
	void __fastcall btAddClick(System::TObject* Sender);
	void __fastcall SelectItem(void * AItem);
	void __fastcall miAddClick(System::TObject* Sender);
	void __fastcall miDeleteClick(System::TObject* Sender);
	void __fastcall miSelectAllClick(System::TObject* Sender);
	
private:
	Cxedit::TcxEditRepository* __fastcall GetEditRepository(void);
	void __fastcall UpdateButtons(void);
	void __fastcall UpdateDesigner(System::TObject* Sender);
	void __fastcall UpdateItems(void);
	
protected:
	virtual void __fastcall InitFormEditor(void);
	
public:
	virtual void __fastcall DoItemsModified(void);
	virtual void __fastcall SelectionsChanged(const Designintf::_di_IDesignerSelections ASelection);
	__property Cxedit::TcxEditRepository* EditRepository = {read=GetEditRepository};
public:
	#pragma option push -w-inl
	/* TDesignWindow.Create */ inline __fastcall virtual TcxEditRepositoryEditor(Classes::TComponent* AOwner) : Cxdesignwindows::TcxDesignFormEditor(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TDesignWindow.Destroy */ inline __fastcall virtual ~TcxEditRepositoryEditor(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual TcxEditRepositoryEditor(Classes::TComponent* AOwner, int Dummy) : Cxdesignwindows::TcxDesignFormEditor(AOwner, Dummy) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxEditRepositoryEditor(HWND ParentWindow) : Cxdesignwindows::TcxDesignFormEditor(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE void __fastcall RegisterEditRepositoryItem(TMetaClass* AEditRepositoryItemClass, const AnsiString ADescription);
extern PACKAGE void __fastcall UnRegisterEditRepositoryItem(TMetaClass* AEditRepositoryItemClass);
extern PACKAGE void __fastcall ShowEditRepositoryEditor(Designintf::_di_IDesigner ADesigner, Cxedit::TcxEditRepository* AEditRepository);
extern PACKAGE void __fastcall GenEditRepositoryItemName(Cxedit::TcxEditRepository* AEditRepository, Cxedit::TcxEditRepositoryItem* AItem);

}	/* namespace Cxeditrepositoryeditor */
using namespace Cxeditrepositoryeditor;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxEditRepositoryEditor
