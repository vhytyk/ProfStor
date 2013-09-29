// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxPropertiesStoreEditor.pas' rev: 6.00

#ifndef cxPropertiesStoreEditorHPP
#define cxPropertiesStoreEditorHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <ImgList.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <DesignIntf.hpp>	// Pascal unit
#include <ActnList.hpp>	// Pascal unit
#include <cxStorage.hpp>	// Pascal unit
#include <cxPropertiesStore.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <ToolWin.hpp>	// Pascal unit
#include <ComCtrls.hpp>	// Pascal unit
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

namespace Cxpropertiesstoreeditor
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TfrmPropertiesStoreFilter { psfNone, psfStored, psfUnStored };
#pragma option pop

#pragma option push -b-
enum TfrmPropertiesStoreGrouping { psgComponents, psgProperties };
#pragma option pop

struct TfrmPropertiesStoreRecord;
typedef TfrmPropertiesStoreRecord *PfrmPropertiesStoreRecord;

#pragma pack(push, 4)
struct TfrmPropertiesStoreRecord
{
	Classes::TPersistent* Persistent;
	AnsiString PropertyName;
	bool Stored;
} ;
#pragma pack(pop)

class DELPHICLASS TfrmPropertiesStoreEditor;
class PASCALIMPLEMENTATION TfrmPropertiesStoreEditor : public Forms::TForm 
{
	typedef Forms::TForm inherited;
	
__published:
	Extctrls::TPanel* pnlClient;
	Comctrls::TToolBar* ToolBar;
	Extctrls::TPanel* pnlLeftTree;
	Extctrls::TPanel* pnlLeftTreeTop;
	Comctrls::TTreeView* Tree;
	Extctrls::TPanel* pnlButtons;
	Stdctrls::TLabel* lblFindComponent;
	Stdctrls::TEdit* edFindComponent;
	Comctrls::TToolButton* btnGroupByComponents;
	Comctrls::TToolButton* btnGroupByProperties;
	Comctrls::TToolButton* ToolButton3;
	Comctrls::TToolButton* btnReset;
	Comctrls::TToolButton* btnCheckAll;
	Comctrls::TToolButton* btnUncheckAll;
	Actnlist::TActionList* ActionList1;
	Actnlist::TAction* actGroupByComponents;
	Actnlist::TAction* actGroupByProperties;
	Extctrls::TPanel* Panel1;
	Extctrls::TPanel* Panel2;
	Stdctrls::TButton* btnOK;
	Stdctrls::TButton* btnCancel;
	Comctrls::TToolButton* btnInvertChecking;
	Controls::TImageList* ImageList1;
	void __fastcall TreeDeletion(System::TObject* Sender, Comctrls::TTreeNode* Node);
	void __fastcall TreeCustomDrawItem(Comctrls::TCustomTreeView* Sender, Comctrls::TTreeNode* Node, Comctrls::TCustomDrawState State, bool &DefaultDraw);
	void __fastcall FormCreate(System::TObject* Sender);
	void __fastcall actGroupByComponentsExecute(System::TObject* Sender);
	void __fastcall actGroupByPropertiesExecute(System::TObject* Sender);
	void __fastcall btnOKClick(System::TObject* Sender);
	void __fastcall btnCancelClick(System::TObject* Sender);
	void __fastcall TreeKeyDown(System::TObject* Sender, Word &Key, Classes::TShiftState Shift);
	void __fastcall btnCheckAllClick(System::TObject* Sender);
	void __fastcall btnUncheckAllClick(System::TObject* Sender);
	void __fastcall FormShow(System::TObject* Sender);
	void __fastcall btnResetClick(System::TObject* Sender);
	void __fastcall btnInvertCheckingClick(System::TObject* Sender);
	void __fastcall edFindComponentKeyDown(System::TObject* Sender, Word &Key, Classes::TShiftState Shift);
	void __fastcall TreeMouseUp(System::TObject* Sender, Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	
private:
	TfrmPropertiesStoreFilter FFilter;
	TfrmPropertiesStoreGrouping FGrouping;
	Cxpropertiesstore::TcxPropertiesStore* FPropertiesStore;
	Classes::TComponent* FOwnerComponent;
	Designintf::_di_IDesigner FDesigner;
	void __fastcall SetOwnerComponent(const Classes::TComponent* Value);
	void __fastcall SetFilter(const TfrmPropertiesStoreFilter Value);
	void __fastcall SetGrouping(const TfrmPropertiesStoreGrouping Value);
	void __fastcall SetFindText(void);
	void __fastcall ChangeCheckState(Comctrls::TTreeNode* ANode);
	void __fastcall CheckNode(Comctrls::TTreeNode* ANode, bool AWithChildren = true, bool AWithParents = true);
	void __fastcall UncheckNode(Comctrls::TTreeNode* ANode, bool AWithChildren = true, bool AWithParents = true);
	void __fastcall InvertCheck(void);
	void __fastcall LoadFromPropertiesStore(Cxpropertiesstore::TcxPropertiesStore* APropertiesStore);
	void __fastcall SaveToPropertiesStore(Cxpropertiesstore::TcxPropertiesStore* APropertiesStore);
	bool __fastcall IsNodeChecked(Comctrls::TTreeNode* ANode);
	bool __fastcall IsNodeFullChecked(Comctrls::TTreeNode* ANode);
	void __fastcall BeginUpdate(void);
	void __fastcall EndUpdate(void);
	Comctrls::TTreeNode* __fastcall FindNode(const AnsiString AText);
	void __fastcall Reset(void);
	void __fastcall CheckAll(void);
	void __fastcall UncheckAll(void);
	void __fastcall InvertChecking(void);
	
protected:
	void __fastcall RefreshTree(void);
	
public:
	__property TfrmPropertiesStoreFilter Filter = {read=FFilter, write=SetFilter, nodefault};
	__property TfrmPropertiesStoreGrouping Grouping = {read=FGrouping, write=SetGrouping, nodefault};
	__property Classes::TComponent* OwnerComponent = {read=FOwnerComponent, write=SetOwnerComponent};
	__property Cxpropertiesstore::TcxPropertiesStore* PropertiesStore = {read=FPropertiesStore, write=FPropertiesStore};
	__property Designintf::_di_IDesigner Designer = {read=FDesigner, write=FDesigner};
public:
	#pragma option push -w-inl
	/* TCustomForm.Create */ inline __fastcall virtual TfrmPropertiesStoreEditor(Classes::TComponent* AOwner) : Forms::TForm(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual TfrmPropertiesStoreEditor(Classes::TComponent* AOwner, int Dummy) : Forms::TForm(AOwner, Dummy) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TfrmPropertiesStoreEditor(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TfrmPropertiesStoreEditor(HWND ParentWindow) : Forms::TForm(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
#define scxFindComponent "Find Component:"
#define scxFindProperty "Find Property:"
extern PACKAGE void __fastcall ShowPropertiesStoreEditor(Cxpropertiesstore::TcxPropertiesStore* APropertiesStore, Classes::TComponent* AOwnerComponent, Designintf::_di_IDesigner ADesigner);

}	/* namespace Cxpropertiesstoreeditor */
using namespace Cxpropertiesstoreeditor;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxPropertiesStoreEditor
