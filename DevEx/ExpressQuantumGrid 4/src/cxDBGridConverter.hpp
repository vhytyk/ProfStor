// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxDBGridConverter.pas' rev: 6.00

#ifndef cxDBGridConverterHPP
#define cxDBGridConverterHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxCustomConverter.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <cxStyles.hpp>	// Pascal unit
#include <cxDBLookupComboBox.hpp>	// Pascal unit
#include <cxTextEdit.hpp>	// Pascal unit
#include <cxDropDownEdit.hpp>	// Pascal unit
#include <cxButtonEdit.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <DB.hpp>	// Pascal unit
#include <cxGridCustomView.hpp>	// Pascal unit
#include <cxGridDBTableView.hpp>	// Pascal unit
#include <cxConverterUtils.hpp>	// Pascal unit
#include <cxGridConverter.hpp>	// Pascal unit
#include <cxConverterFactory.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxdbgridconverter
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxDBGridConverter;
class PASCALIMPLEMENTATION TcxDBGridConverter : public Cxgridconverter::TcxCustomGridConverter 
{
	typedef Cxgridconverter::TcxCustomGridConverter inherited;
	
private:
	int FColor;
	int FFixedColor;
	Graphics::TFont* FFont;
	Graphics::TFont* FTitleFont;
	Cxgriddbtableview::TcxGridDBColumn* __fastcall FindcxColumn(const AnsiString AFieldName);
	HIDESBASE Cxgriddbtableview::TcxGridDBTableView* __fastcall GetcxGridView(void);
	void __fastcall ImportColumns(void);
	void __fastcall ImportColumnsStyles(void);
	void __fastcall ImportGrid(void);
	void __fastcall ImportGridStyles(void);
	
protected:
	virtual void __fastcall DoRealImport(void);
	virtual void __fastcall DoImportStyles(void);
	virtual TMetaClass* __fastcall GetGridViewClass(void);
	__property Cxgriddbtableview::TcxGridDBTableView* cxGridView = {read=GetcxGridView};
	
public:
	/* virtual class method */ virtual AnsiString __fastcall GetSourceClassName(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TcxCustomGridConverter.Create */ inline __fastcall virtual TcxDBGridConverter(System::TObject* ADestination) : Cxgridconverter::TcxCustomGridConverter(ADestination) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxDBGridConverter(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxdbgridconverter */
using namespace Cxdbgridconverter;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxDBGridConverter
