// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxDXGridConverter.pas' rev: 6.00

#ifndef cxDXGridConverterHPP
#define cxDXGridConverterHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxPropertiesConverters.hpp>	// Pascal unit
#include <cxCustomConverter.hpp>	// Pascal unit
#include <cxConverterUtils.hpp>	// Pascal unit
#include <cxStyles.hpp>	// Pascal unit
#include <cxDBData.hpp>	// Pascal unit
#include <cxGridTableView.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <cxTextEdit.hpp>	// Pascal unit
#include <cxTimeEdit.hpp>	// Pascal unit
#include <cxSpinEdit.hpp>	// Pascal unit
#include <cxMRUEdit.hpp>	// Pascal unit
#include <cxMemo.hpp>	// Pascal unit
#include <cxMaskEdit.hpp>	// Pascal unit
#include <cxDBLookupComboBox.hpp>	// Pascal unit
#include <cxImageComboBox.hpp>	// Pascal unit
#include <cxImage.hpp>	// Pascal unit
#include <cxHyperLinkEdit.hpp>	// Pascal unit
#include <cxDropDownEdit.hpp>	// Pascal unit
#include <cxCurrencyEdit.hpp>	// Pascal unit
#include <cxCheckBox.hpp>	// Pascal unit
#include <cxCalendar.hpp>	// Pascal unit
#include <cxCalc.hpp>	// Pascal unit
#include <cxButtonEdit.hpp>	// Pascal unit
#include <cxBlobEdit.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxLookAndFeels.hpp>	// Pascal unit
#include <cxGrid.hpp>	// Pascal unit
#include <cxFilter.hpp>	// Pascal unit
#include <cxGridCustomTableView.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <cxCustomData.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <DB.hpp>	// Pascal unit
#include <cxGridBandedTableView.hpp>	// Pascal unit
#include <cxGridDBBandedTableView.hpp>	// Pascal unit
#include <cxGridDBTableView.hpp>	// Pascal unit
#include <cxGridCustomView.hpp>	// Pascal unit
#include <cxGridConverter.hpp>	// Pascal unit
#include <cxConverterFactory.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxdxgridconverter
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxDXGridConverter;
class PASCALIMPLEMENTATION TcxDXGridConverter : public Cxgridconverter::TcxCustomGridConverter 
{
	typedef Cxgridconverter::TcxCustomGridConverter inherited;
	
protected:
	virtual void __fastcall DoRealImport(void);
	virtual void __fastcall DoImportStyles(void);
	virtual TMetaClass* __fastcall GetGridViewClass(void);
	
public:
	/* virtual class method */ virtual AnsiString __fastcall GetSourceClassName(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TcxCustomGridConverter.Create */ inline __fastcall virtual TcxDXGridConverter(System::TObject* ADestination) : Cxgridconverter::TcxCustomGridConverter(ADestination) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxDXGridConverter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxDXGridLayoutConverter;
class PASCALIMPLEMENTATION TcxDXGridLayoutConverter : public TcxDXGridConverter 
{
	typedef TcxDXGridConverter inherited;
	
private:
	Classes::TComponent* FdxDBGrid;
	Classes::TComponent* FComponent;
	
protected:
	virtual void __fastcall DoRealImport(void);
	virtual TMetaClass* __fastcall GetGridViewClass(void);
	virtual void __fastcall PostImport(void);
	virtual void __fastcall PreImport(void);
	virtual bool __fastcall TestIntermediary(void);
	
public:
	/* virtual class method */ virtual AnsiString __fastcall GetIntermediaryClassName(TMetaClass* vmt);
	/* virtual class method */ virtual AnsiString __fastcall GetSourceClassName(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TcxCustomGridConverter.Create */ inline __fastcall virtual TcxDXGridLayoutConverter(System::TObject* ADestination) : TcxDXGridConverter(ADestination) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxDXGridLayoutConverter(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxdxgridconverter */
using namespace Cxdxgridconverter;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxDXGridConverter
