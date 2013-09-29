// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxStyleSheetEditor.pas' rev: 6.00

#ifndef cxStyleSheetEditorHPP
#define cxStyleSheetEditorHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxStyles.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <ExtDlgs.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <Variants.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxstylesheeteditor
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxStyleSheetEditorPreview;
class PASCALIMPLEMENTATION TcxStyleSheetEditorPreview : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	__fastcall virtual TcxStyleSheetEditorPreview(Classes::TComponent* AOwner) = 0 ;
	virtual Controls::TWinControl* __fastcall Control(void) = 0 ;
	virtual Types::TPoint __fastcall GetSize();
	/* virtual class method */ virtual TMetaClass* __fastcall GetStyleSheetClass(TMetaClass* vmt);
	virtual void __fastcall SetStyleSheet(Cxstyles::TcxCustomStyleSheet* AStyleSheet) = 0 ;
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxStyleSheetEditorPreview(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxStyleSheetEditorPreviewClass;

class DELPHICLASS TfrmcxStyleSheetEditor;
class PASCALIMPLEMENTATION TfrmcxStyleSheetEditor : public Forms::TForm 
{
	typedef Forms::TForm inherited;
	
__published:
	Extctrls::TPanel* pnlBottom;
	Extctrls::TPanel* pnlButtons;
	Stdctrls::TButton* btnOK;
	Stdctrls::TButton* bntCancel;
	Dialogs::TFontDialog* FontDialog;
	Dialogs::TColorDialog* ColorDialog;
	Extctrls::TPanel* pnlClient;
	Extctrls::TBevel* Bevel;
	Extctrls::TPanel* pnlStyles;
	Extctrls::TPanel* pnlStylesCaption;
	Extctrls::TPanel* pnlStylesButtons;
	Extctrls::TPanel* pnlStylesClient;
	Stdctrls::TListBox* lbStyles;
	Extctrls::TPanel* pnlPreview;
	Extctrls::TPanel* pnlPreviewCaption;
	Extctrls::TPanel* pnlPreviewClient;
	Stdctrls::TCheckBox* cbColor;
	Stdctrls::TButton* btnBitmap;
	Stdctrls::TButton* btnColor1;
	Stdctrls::TButton* btnFont1;
	Stdctrls::TCheckBox* cbFont;
	Stdctrls::TCheckBox* cbBitmap;
	void __fastcall lbStylesClick(System::TObject* Sender);
	void __fastcall lbStylesMeasureItem(Controls::TWinControl* Control, int Index, int &Height);
	void __fastcall lbStylesDrawItem(Controls::TWinControl* Control, int Index, const Types::TRect &Rect, Windows::TOwnerDrawState State);
	void __fastcall cbClick(System::TObject* Sender);
	void __fastcall btnColor1Click(System::TObject* Sender);
	void __fastcall btnFont1Click(System::TObject* Sender);
	void __fastcall btnBitmapClick(System::TObject* Sender);
	
private:
	Cxgraphics::TcxCanvas* FCanvas;
	TcxStyleSheetEditorPreview* FPreview;
	bool FStateUpdating;
	Classes::TList* FStyleList;
	Cxstyles::TcxCustomStyleSheet* FStyleSheet;
	Cxstyles::TcxStyleValue __fastcall GetCheckBoxStyleValue(Stdctrls::TCheckBox* ACheckBox);
	Cxstyles::TcxStyle* __fastcall GetFirstSelectedStyle(void);
	void __fastcall RecreateListBox(Stdctrls::TListBox* AListBox);
	void __fastcall SetSelectedStylesAssignValue(Stdctrls::TCheckBox* ACheckBox);
	void __fastcall SetStyles(Cxstyles::TcxCustomStyleSheet* AStyleSheet);
	void __fastcall UpdateStyles(Cxstyles::TcxCustomStyleSheet* AStyleSheet, Cxstyles::TcxStyleGetName AGetStyleName);
	void __fastcall UpdateState(void);
	
public:
	__fastcall virtual TfrmcxStyleSheetEditor(Classes::TComponent* AOwner);
	__fastcall virtual ~TfrmcxStyleSheetEditor(void);
public:
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual TfrmcxStyleSheetEditor(Classes::TComponent* AOwner, int Dummy) : Forms::TForm(AOwner, Dummy) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TfrmcxStyleSheetEditor(HWND ParentWindow) : Forms::TForm(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE bool __fastcall ShowcxStyleSheetEditor(Cxstyles::TcxCustomStyleSheet* AStyleSheet, Cxstyles::TcxStyleGetName AGetStyleName);
extern PACKAGE void __fastcall RegisterStyleSheetEditorPreview(TMetaClass* APreviewClass);
extern PACKAGE void __fastcall UnregisterStyleSheetEditorPreview(TMetaClass* APreviewClass);
extern PACKAGE TMetaClass* __fastcall GetPreviewByStyleSheetClass(TMetaClass* AStyleSheetClass);

}	/* namespace Cxstylesheeteditor */
using namespace Cxstylesheeteditor;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxStyleSheetEditor
