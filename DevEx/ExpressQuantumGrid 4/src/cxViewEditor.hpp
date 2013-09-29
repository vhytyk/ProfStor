// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxViewEditor.pas' rev: 6.00

#ifndef cxViewEditorHPP
#define cxViewEditorHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxGridBandedTableView.hpp>	// Pascal unit
#include <cxGridCustomTableView.hpp>	// Pascal unit
#include <cxGridCustomView.hpp>	// Pascal unit
#include <cxGridStructureNavigator.hpp>	// Pascal unit
#include <cxDesignWindows.hpp>	// Pascal unit
#include <cxStorage.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <Variants.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxvieweditor
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxViewEditor;
class PASCALIMPLEMENTATION TcxViewEditor : public Forms::TForm 
{
	typedef Forms::TForm inherited;
	
__published:
	Extctrls::TPanel* PViewEditor;
	void __fastcall FormKeyPress(System::TObject* Sender, char &Key);
	
private:
	Cxgridcustomview::TcxCustomGridView* FView;
	Classes::TComponent* __fastcall GetOwnerForm(void);
	
protected:
	void __fastcall BeginUpdate(void);
	void __fastcall EndUpdate(void);
	void __fastcall GetSelectionList(Classes::TList* AList);
	virtual AnsiString __fastcall UniqueName(Classes::TComponent* AComponent);
	virtual void __fastcall UpdateDesigner(void);
	virtual void __fastcall UpdateEditor(void);
	virtual void __fastcall UpdateSelection(void);
	
public:
	Cxdesignwindows::TcxDesignFormEditor* FormEditor;
	/* virtual class method */ virtual Cxgridcustomview::TcxCustomGridView* __fastcall GetViewByObject(TMetaClass* vmt, Classes::TPersistent* APersistent);
	virtual void __fastcall HideFrame(void);
	void __fastcall SetView(Cxgridcustomview::TcxCustomGridView* Value, bool ARefreshNeeded);
	virtual void __fastcall ShowFrame(void);
	__property Classes::TComponent* OwnerForm = {read=GetOwnerForm};
	__property Cxgridcustomview::TcxCustomGridView* View = {read=FView};
public:
	#pragma option push -w-inl
	/* TCustomForm.Create */ inline __fastcall virtual TcxViewEditor(Classes::TComponent* AOwner) : Forms::TForm(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual TcxViewEditor(Classes::TComponent* AOwner, int Dummy) : Forms::TForm(AOwner, Dummy) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TcxViewEditor(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxViewEditor(HWND ParentWindow) : Forms::TForm(ParentWindow) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxViewEditorClass;

class DELPHICLASS TcxCustomGridViewStorage;
class PASCALIMPLEMENTATION TcxCustomGridViewStorage : public Cxclasses::TcxInterfacedPersistent 
{
	typedef Cxclasses::TcxInterfacedPersistent inherited;
	
private:
	Cxgridcustomview::TcxCustomGridView* FView;
	
protected:
	AnsiString __fastcall GetObjectName();
	bool __fastcall GetProperties(Classes::TStrings* AProperties);
	void __fastcall GetPropertyValue(const AnsiString AName, Variant &AValue);
	void __fastcall SetPropertyValue(const AnsiString AName, const Variant &AValue);
	__property Cxgridcustomview::TcxCustomGridView* View = {read=FView};
	
public:
	__fastcall TcxCustomGridViewStorage(Cxgridcustomview::TcxCustomGridView* AView);
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewClass(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxCustomGridViewStorage(void) { }
	#pragma option pop
	
private:
	void *__IcxStoredObject;	/* Cxstorage::IcxStoredObject */
	
public:
	operator IcxStoredObject*(void) { return (IcxStoredObject*)&__IcxStoredObject; }
	
};


typedef TMetaClass*TcxCustomGridViewStorageClass;

//-- var, const, procedure ---------------------------------------------------
extern PACKAGE TMetaClass* __fastcall GetViewEditorClass(TMetaClass* AViewClass);
extern PACKAGE void __fastcall RegisterViewEditorClass(TMetaClass* AViewClass, TMetaClass* AViewEditorClass);
extern PACKAGE void __fastcall UnregisterViewEditorClass(TMetaClass* AViewClass, TMetaClass* AViewEditorClass);
extern PACKAGE Cxgridcustomview::TcxCustomGridView* __fastcall GetLinkedView(Classes::TPersistent* APersistent);
extern PACKAGE bool __fastcall IsViewLinkedToComponent(Cxgridcustomview::TcxCustomGridView* AView, Classes::TComponent* AComponent);
extern PACKAGE AnsiString __fastcall GetViewTemplateRegKey();
extern PACKAGE void __fastcall RegisterDefaultViewStorage(TMetaClass* AStorageClass);
extern PACKAGE void __fastcall UnregisterDefaultViewStorage(TMetaClass* AStorageClass);
extern PACKAGE TcxCustomGridViewStorage* __fastcall GetDefaultViewStorageByViewClass(Cxgridcustomview::TcxCustomGridView* AGridView);
extern PACKAGE void __fastcall RestoreViewFromTemplate(const AnsiString ARegPath, Cxgridcustomview::TcxCustomGridView* AView);
extern PACKAGE void __fastcall SaveViewToTemplate(const AnsiString ARegPath, Cxgridcustomview::TcxCustomGridView* AView);

}	/* namespace Cxvieweditor */
using namespace Cxvieweditor;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxViewEditor
