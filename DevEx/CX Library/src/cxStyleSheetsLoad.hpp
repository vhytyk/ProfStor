// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxStyleSheetsLoad.pas' rev: 6.00

#ifndef cxStyleSheetsLoadHPP
#define cxStyleSheetsLoadHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxStyleSheetEditor.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <cxStyles.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
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

namespace Cxstylesheetsload
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxPredefinedStyleSheets;
class PASCALIMPLEMENTATION TcxPredefinedStyleSheets : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	Classes::TList* FList;
	
protected:
	void __fastcall AddStyleSheet(Cxstyles::TcxCustomStyleSheet* AStyleSheet);
	virtual void __fastcall AddStyleSheets(void) = 0 ;
	
public:
	__fastcall virtual TcxPredefinedStyleSheets(void);
	__fastcall virtual ~TcxPredefinedStyleSheets(void);
	void __fastcall GetStyleSheetsByClass(TMetaClass* AStyleSheetClass, const Classes::TList* AList);
};


class DELPHICLASS TcxPredefinedStyleSheetsList;
class PASCALIMPLEMENTATION TcxPredefinedStyleSheetsList : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	Classes::TList* FList;
	Stdctrls::TComboBox* FStyleSheetClassComboBox;
	Stdctrls::TListBox* FStyleSheetsListBox;
	Stdctrls::TButton* FLoadButton;
	Cxstylesheeteditor::TcxStyleSheetEditorPreview* FPreview;
	void __fastcall StyleSheetClassComboBoxClick(System::TObject* Sender);
	void __fastcall StyleSheetsListBoxClick(System::TObject* Sender);
	
protected:
	void __fastcall UpdateButton(void);
	
public:
	__fastcall TcxPredefinedStyleSheetsList(Stdctrls::TComboBox* AStyleSheetClassComboBox, Stdctrls::TListBox* AStyleSheetsListBox, Stdctrls::TButton* ALoadButton);
	__fastcall virtual ~TcxPredefinedStyleSheetsList(void);
	Cxstyles::TcxCustomStyleSheet* __fastcall CurrentStyleSheet(void);
	TMetaClass* __fastcall CurrentStyleSheetClass(void);
	void __fastcall FillListBox(void);
};


class DELPHICLASS TfrmcxStyleSheetsLoad;
class PASCALIMPLEMENTATION TfrmcxStyleSheetsLoad : public Forms::TForm 
{
	typedef Forms::TForm inherited;
	
__published:
	Extctrls::TPanel* pnlBottom;
	Extctrls::TPanel* pnlBottomButtons;
	Stdctrls::TButton* btnLoad;
	Stdctrls::TButton* btnClose;
	Extctrls::TBevel* Bevel;
	Extctrls::TPanel* pnlStyles;
	Extctrls::TPanel* pnlStyleSheetClasses;
	Stdctrls::TLabel* lbStyleSheetClass;
	Stdctrls::TComboBox* cbStyleSheetClasses;
	Stdctrls::TListBox* lbStyleSheets;
	Extctrls::TPanel* pnlPreview;
	Extctrls::TPanel* Panel1;
	Extctrls::TPanel* pnlPreviewClient;
	Extctrls::TPanel* pnlClient;
	Stdctrls::TLabel* lbPreview;
	void __fastcall FormCreate(System::TObject* Sender);
	
public:
	__fastcall virtual TfrmcxStyleSheetsLoad(Classes::TComponent* AOwner);
	TMetaClass* __fastcall CurrentStyleSheetClass(void);
	void __fastcall SetShowPreview(bool Value);
public:
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual TfrmcxStyleSheetsLoad(Classes::TComponent* AOwner, int Dummy) : Forms::TForm(AOwner, Dummy) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TfrmcxStyleSheetsLoad(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TfrmcxStyleSheetsLoad(HWND ParentWindow) : Forms::TForm(ParentWindow) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxPredefinedStyleSheetsClass;

//-- var, const, procedure ---------------------------------------------------
extern PACKAGE void __fastcall RegisterPredefinedStyleSheets(TMetaClass* APredefinedStyleSheetsClass);
extern PACKAGE void __fastcall UnregisterPredefinedStyleSheets(TMetaClass* APredefinedStyleSheetsClass);
extern PACKAGE void __fastcall ShowLoadStyleSheetsFromIniFile(const AnsiString AIniFileName, Cxstyles::TcxStyleRepository* AStyleRepository, Classes::TComponent* AOwner, const Classes::TList* AStyleSheetList, Cxstyles::TcxStyleGetName AStyleGetName);
extern PACKAGE void __fastcall ShowLoadStyleSheetsFromPreDefineStyles(Cxstyles::TcxStyleRepository* AStyleRepository, Classes::TComponent* AOwner, const Classes::TList* AStyleSheetList, Cxstyles::TcxStyleGetName AStyleGetName);

}	/* namespace Cxstylesheetsload */
using namespace Cxstylesheetsload;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxStyleSheetsLoad
