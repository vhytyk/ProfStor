// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxGridConverter.pas' rev: 6.00

#ifndef cxGridConverterHPP
#define cxGridConverterHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxCustomConverter.hpp>	// Pascal unit
#include <cxDesignWindows.hpp>	// Pascal unit
#include <cxGridStructureNavigator.hpp>	// Pascal unit
#include <cxGridStrs.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <cxStyles.hpp>	// Pascal unit
#include <cxGridDBBandedTableView.hpp>	// Pascal unit
#include <cxGridLevel.hpp>	// Pascal unit
#include <cxGridCustomView.hpp>	// Pascal unit
#include <cxGrid.hpp>	// Pascal unit
#include <cxConverterFactory.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <DesignIntf.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxgridconverter
{
//-- type declarations -------------------------------------------------------
typedef TMetaClass*TcxCustomGridConverterClass;

class DELPHICLASS TcxCustomGridConverter;
class PASCALIMPLEMENTATION TcxCustomGridConverter : public Cxconverterfactory::TcxCustomConverterWithStyles 
{
	typedef Cxconverterfactory::TcxCustomConverterWithStyles inherited;
	
private:
	bool FDeleteAllSublevels;
	Cxgridlevel::TcxGridLevel* FDestinationLevel;
	Classes::TComponent* FIntermediary;
	void __fastcall ClearAllSublevels(Cxgridlevel::TcxGridLevel* ALevel);
	void __fastcall ClearGrid(void);
	void __fastcall ClearSublevels(Cxgridlevel::TcxGridLevel* ALevel);
	Cxgrid::TcxCustomGrid* __fastcall GetDestination(void);
	Cxgridlevel::TcxGridLevel* __fastcall GetDestinationLevel(void);
	Cxgridcustomview::TcxCustomGridView* __fastcall GetcxGridView(void);
	Classes::TComponent* __fastcall GetSource(void);
	void __fastcall SetIntermediary(Classes::TComponent* AIntermediary);
	void __fastcall SetSource(Classes::TComponent* ASource);
	
protected:
	virtual bool __fastcall CanConvert(void);
	virtual void __fastcall DoImport(void);
	virtual void __fastcall DoRealImport(void);
	virtual TMetaClass* __fastcall GetGridViewClass(void);
	virtual bool __fastcall TestIntermediary(void);
	AnsiString __fastcall UniqueColumnName(Classes::TComponent* AColumn, const AnsiString AFieldName = "");
	__property Cxgridcustomview::TcxCustomGridView* cxGridView = {read=GetcxGridView};
	
public:
	__fastcall virtual TcxCustomGridConverter(System::TObject* ADestination);
	/* virtual class method */ virtual AnsiString __fastcall GetIntermediaryClassName(TMetaClass* vmt);
	__property bool DeleteAllSublevels = {read=FDeleteAllSublevels, write=FDeleteAllSublevels, nodefault};
	__property Cxgrid::TcxCustomGrid* Destination = {read=GetDestination};
	__property Cxgridlevel::TcxGridLevel* DestinationLevel = {read=FDestinationLevel, write=FDestinationLevel};
	__property Classes::TComponent* Intermediary = {read=FIntermediary, write=SetIntermediary};
	__property Classes::TComponent* Source = {read=GetSource, write=SetSource};
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxCustomGridConverter(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
#define cxGridGroupConverterName "Grid Converters"

}	/* namespace Cxgridconverter */
using namespace Cxgridconverter;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxGridConverter
