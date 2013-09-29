// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxWWGridConverter.pas' rev: 6.00

#ifndef cxWWGridConverterHPP
#define cxWWGridConverterHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxCustomConverter.hpp>	// Pascal unit
#include <cxConverterUtils.hpp>	// Pascal unit
#include <cxStyles.hpp>	// Pascal unit
#include <cxGridCustomTableView.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <cxCalendar.hpp>	// Pascal unit
#include <cxMemo.hpp>	// Pascal unit
#include <cxMRUEdit.hpp>	// Pascal unit
#include <cxDropDownEdit.hpp>	// Pascal unit
#include <cxLookupDBGrid.hpp>	// Pascal unit
#include <cxGrid.hpp>	// Pascal unit
#include <cxDBLookupComboBox.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxButtonEdit.hpp>	// Pascal unit
#include <cxImageComboBox.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <cxSpinEdit.hpp>	// Pascal unit
#include <cxImage.hpp>	// Pascal unit
#include <cxTextEdit.hpp>	// Pascal unit
#include <cxHyperLinkEdit.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <cxCheckBox.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <DB.hpp>	// Pascal unit
#include <cxGridCustomView.hpp>	// Pascal unit
#include <cxGridDBBandedTableView.hpp>	// Pascal unit
#include <cxGridConverter.hpp>	// Pascal unit
#include <cxConverterFactory.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxwwgridconverter
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxWWGridConverter;
class PASCALIMPLEMENTATION TcxWWGridConverter : public Cxgridconverter::TcxCustomGridConverter 
{
	typedef Cxgridconverter::TcxCustomGridConverter inherited;
	
private:
	int FColor;
	Graphics::TFont* FFont;
	int FTitleColor;
	Graphics::TFont* FTitleFont;
	int __fastcall ExtractData(const AnsiString AData, AnsiString &AResultData, int AStartIndex, char ASeparator);
	Stdctrls::TEditCharCase __fastcall GetCharCase(const AnsiString ACharCase);
	HIDESBASE Cxgriddbbandedtableview::TcxGridDBBandedTableView* __fastcall GetcxGridView(void);
	void __fastcall GetFieldNames(Classes::TStringList* AList);
	int __fastcall GetFontWidth(Graphics::TFont* AFont);
	void __fastcall ImportColumnCheckBox(Cxgriddbbandedtableview::TcxGridDBBandedColumn* AcxColumn, const AnsiString AColumnData, const bool AReadOnly);
	void __fastcall ImportColumnCustomEdit(Cxgriddbbandedtableview::TcxGridDBBandedColumn* AcxColumn, const AnsiString AColumnData);
	void __fastcall ImportColumnImage(Cxgriddbbandedtableview::TcxGridDBBandedColumn* AcxColumn, const AnsiString AColumnData, const bool AReadOnly);
	void __fastcall ImportColumnRichEdit(Cxgriddbbandedtableview::TcxGridDBBandedColumn* AcxColumn, const AnsiString AColumnData);
	void __fastcall ImportColumnText(Cxgriddbbandedtableview::TcxGridDBBandedColumn* AcxColumn, const bool AReadOnly);
	void __fastcall ImportColumnUrlLink(Cxgriddbbandedtableview::TcxGridDBBandedColumn* AcxColumn, const bool AReadOnly);
	void __fastcall ImportBands(void);
	void __fastcall ImportColumns(void);
	void __fastcall ImportGrid(void);
	void __fastcall ImportGridStyles(void);
	void __fastcall ImportWWCheckBox(Cxgriddbbandedtableview::TcxGridDBBandedColumn* AcxColumn, Classes::TComponent* AComponent);
	void __fastcall ImportWWComboBox(Cxgriddbbandedtableview::TcxGridDBBandedColumn* AcxColumn, Classes::TComponent* AComponent);
	void __fastcall ImportWWComboDlg(Cxgriddbbandedtableview::TcxGridDBBandedColumn* AcxColumn, Classes::TComponent* AComponent);
	void __fastcall ImportWWDateTimePicker(Cxgriddbbandedtableview::TcxGridDBBandedColumn* AcxColumn, Classes::TComponent* AComponent);
	void __fastcall ImportWWExpandButton(Cxgriddbbandedtableview::TcxGridDBBandedColumn* AcxColumn, Classes::TComponent* AComponent);
	void __fastcall ImportWWLookupCombo(Cxgriddbbandedtableview::TcxGridDBBandedColumn* AcxColumn, Classes::TComponent* AComponent);
	void __fastcall ImportWWLookupComboDlg(Cxgriddbbandedtableview::TcxGridDBBandedColumn* AcxColumn, Classes::TComponent* AComponent);
	void __fastcall ImportWWMonthCalendar(Cxgriddbbandedtableview::TcxGridDBBandedColumn* AcxColumn, Classes::TComponent* AComponent);
	void __fastcall ImportWWOptions(void);
	void __fastcall ImportWWRadioGroup(Cxgriddbbandedtableview::TcxGridDBBandedColumn* AcxColumn, Classes::TComponent* AComponent);
	void __fastcall ImportWWSpinEdit(Cxgriddbbandedtableview::TcxGridDBBandedColumn* AcxColumn, Classes::TComponent* AComponent);
	void __fastcall ImportWWTextEdit(Cxgriddbbandedtableview::TcxGridDBBandedColumn* AcxColumn, Classes::TComponent* AComponent);
	AnsiString __fastcall IsColumnDefault(const AnsiString AFieldName);
	int __fastcall Pass(const AnsiString AData, int AStartIndex, int AFieldCount, char ASeparator);
	
protected:
	virtual void __fastcall DoRealImport(void);
	virtual void __fastcall DoImportStyles(void);
	virtual TMetaClass* __fastcall GetGridViewClass(void);
	__property Cxgriddbbandedtableview::TcxGridDBBandedTableView* cxGridView = {read=GetcxGridView};
	
public:
	/* virtual class method */ virtual AnsiString __fastcall GetSourceClassName(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TcxCustomGridConverter.Create */ inline __fastcall virtual TcxWWGridConverter(System::TObject* ADestination) : Cxgridconverter::TcxCustomGridConverter(ADestination) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxWWGridConverter(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxwwgridconverter */
using namespace Cxwwgridconverter;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxWWGridConverter
