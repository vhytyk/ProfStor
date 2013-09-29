// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxDesignWindows.pas' rev: 6.00

#ifndef cxDesignWindowsHPP
#define cxDesignWindowsHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxClasses.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <TypInfo.hpp>	// Pascal unit
#include <DesignWindows.hpp>	// Pascal unit
#include <ComponentDesigner.hpp>	// Pascal unit
#include <DesignIntf.hpp>	// Pascal unit
#include <DesignConst.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxdesignwindows
{
//-- type declarations -------------------------------------------------------
typedef IDesignerSelections TDesignerSelectionList;
;

class DELPHICLASS TcxDesignWindow;
class PASCALIMPLEMENTATION TcxDesignWindow : public Designwindows::TDesignWindow 
{
	typedef Designwindows::TDesignWindow inherited;
	
private:
	int FLockCount;
	
protected:
	DYNAMIC void __fastcall Activated(void);
	virtual AnsiString __fastcall UniqueName(Classes::TComponent* Component);
	
public:
	void __fastcall BeginUpdate(void);
	Designintf::_di_IDesignerSelections __fastcall CreateDesignerSelectionList();
	void __fastcall EndUpdate(void);
	/*         class method */ static AnsiString __fastcall GetBaseRegKey(TMetaClass* vmt);
	void __fastcall GetSelectionList(Classes::TList* AList);
	virtual void __fastcall SelectionChanged(const Designintf::_di_IDesigner ADesigner, const Designintf::_di_IDesignerSelections ASelection);
	virtual void __fastcall SelectionsChanged(const Designintf::_di_IDesignerSelections ASelection);
	void __fastcall SetSelectionList(Classes::TList* AList);
	void __fastcall UpdateSelection(void);
	__property int LockCount = {read=FLockCount, nodefault};
public:
	#pragma option push -w-inl
	/* TDesignWindow.Create */ inline __fastcall virtual TcxDesignWindow(Classes::TComponent* AOwner) : Designwindows::TDesignWindow(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TDesignWindow.Destroy */ inline __fastcall virtual ~TcxDesignWindow(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual TcxDesignWindow(Classes::TComponent* AOwner, int Dummy) : Designwindows::TDesignWindow(AOwner, Dummy) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxDesignWindow(HWND ParentWindow) : Designwindows::TDesignWindow(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxDesignFormEditor;
class PASCALIMPLEMENTATION TcxDesignFormEditor : public TcxDesignWindow 
{
	typedef TcxDesignWindow inherited;
	
__published:
	void __fastcall FormClose(System::TObject* Sender, Forms::TCloseAction &Action);
	void __fastcall FormDestroy(System::TObject* Sender);
	void __fastcall FormCreate(System::TObject* Sender);
	
private:
	bool FClosing;
	void __fastcall UpdateCaption(void);
	
protected:
	virtual void __fastcall CloseEditor(void);
	virtual void __fastcall InitFormEditor(void);
	virtual void __fastcall UpdateContent(void);
	
public:
	Classes::TComponent* Component;
	AnsiString ComponentClassName;
	virtual void __fastcall DesignerClosed(const Designintf::_di_IDesigner ADesigner, bool AGoingDormant);
	virtual void __fastcall DoItemsModified(void);
	virtual void __fastcall ItemDeleted(const Designintf::_di_IDesigner ADesigner, Classes::TPersistent* AItem);
	virtual void __fastcall ItemsModified(const Designintf::_di_IDesigner Designer);
	virtual void __fastcall SelectComponents(Classes::TList* AList, Classes::TPersistent* ADefaultComponent);
	__property bool Closing = {read=FClosing, nodefault};
public:
	#pragma option push -w-inl
	/* TDesignWindow.Create */ inline __fastcall virtual TcxDesignFormEditor(Classes::TComponent* AOwner) : TcxDesignWindow(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TDesignWindow.Destroy */ inline __fastcall virtual ~TcxDesignFormEditor(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual TcxDesignFormEditor(Classes::TComponent* AOwner, int Dummy) : TcxDesignWindow(AOwner, Dummy) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxDesignFormEditor(HWND ParentWindow) : TcxDesignWindow(ParentWindow) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxDesignFormEditorClass;

typedef void __fastcall (__closure *TcxListBoxReindexProc)(Classes::TList* AList, int ANewIndex);

//-- var, const, procedure ---------------------------------------------------
extern PACKAGE TcxDesignFormEditor* __fastcall ShowFormEditorClass(Designintf::_di_IDesigner ADesigner, Classes::TComponent* AComponent, TMetaClass* AFormEditorClass);
extern PACKAGE void __fastcall UpdateDesignFormEditors(Classes::TComponent* AComponent);
extern PACKAGE Classes::TNotifyEvent __fastcall LockListBox(Stdctrls::TListBox* AListBox);
extern PACKAGE void __fastcall UnlockListBox(Stdctrls::TListBox* AListBox, Classes::TNotifyEvent APrevOnClick);
extern PACKAGE void __fastcall ListBoxSetItemIndex(Stdctrls::TListBox* AListBox, int AItemIndex);
extern PACKAGE void __fastcall ListBoxSetSelected(Stdctrls::TListBox* AListBox, int AItemIndex, bool ASelected);
extern PACKAGE void __fastcall ListBoxRestoreSelection(Stdctrls::TListBox* AListBox, Classes::TStringList* &ASelection, int AItemIndex, int ATopIndex);
extern PACKAGE void __fastcall ListBoxSaveSelection(Stdctrls::TListBox* AListBox, Classes::TStringList* &ASelection, int &AItemIndex, int &ATopIndex);
extern PACKAGE void __fastcall ListBoxRestorePos(Stdctrls::TListBox* AListBox, int AItemIndex, int ATopIndex);
extern PACKAGE void __fastcall ListBoxSavePos(Stdctrls::TListBox* AListBox, int &AItemIndex, int &ATopIndex);
extern PACKAGE void __fastcall ListBoxDeleteSelection(Stdctrls::TListBox* AListBox, bool ASetFocus);
extern PACKAGE void __fastcall ListBoxGetSelection(Stdctrls::TListBox* AListBox, Classes::TList* AList);
extern PACKAGE void __fastcall ListBoxLoadCollection(Stdctrls::TListBox* AListBox, Classes::TCollection* ACollection);
extern PACKAGE void __fastcall ListBoxSelectByObject(Stdctrls::TListBox* AListBox, System::TObject* AObject);
extern PACKAGE void __fastcall ListBoxSyncSelection(Stdctrls::TListBox* AListBox, Classes::TList* AList);
extern PACKAGE void __fastcall ListBoxClearSelection(Stdctrls::TListBox* AListBox);
extern PACKAGE void __fastcall ListBoxSelectAll(Stdctrls::TListBox* AListBox);
extern PACKAGE void __fastcall ListBoxMoveUpItems(Stdctrls::TListBox* AListBox, int &APrevDragIndex, TcxListBoxReindexProc AReindexProc);
extern PACKAGE void __fastcall ListBoxMoveDownItems(Stdctrls::TListBox* AListBox, int &APrevDragIndex, TcxListBoxReindexProc AReindexProc);
extern PACKAGE void __fastcall ListBoxDragOver(Stdctrls::TListBox* AListBox, System::TObject* Sender, System::TObject* Source, int X, int Y, Controls::TDragState State, bool &Accept, int &APrevDragIndex);
extern PACKAGE void __fastcall ListBoxDragDrop(Stdctrls::TListBox* AListBox, System::TObject* Sender, System::TObject* Source, int X, int Y, int &APrevDragIndex, TcxListBoxReindexProc AReindexProc);
extern PACKAGE void __fastcall ListBoxEndDrag(Stdctrls::TListBox* AListBox, System::TObject* Sender, System::TObject* Target, int X, int Y, int &APrevDragIndex);
extern PACKAGE AnsiString __fastcall CreateUniqueName(Classes::TComponent* AOwnerForm, Classes::TComponent* AOwnerComponent, Classes::TComponent* AChildComponent, const AnsiString ATruncateClassName, const AnsiString AFieldName);

}	/* namespace Cxdesignwindows */
using namespace Cxdesignwindows;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxDesignWindows
