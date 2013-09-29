// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxExportGrid4Link.pas' rev: 6.00

#ifndef cxExportGrid4LinkHPP
#define cxExportGrid4LinkHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxDataUtils.hpp>	// Pascal unit
#include <cxGridStrs.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <cxTimeEdit.hpp>	// Pascal unit
#include <cxCalc.hpp>	// Pascal unit
#include <cxSpinEdit.hpp>	// Pascal unit
#include <cxCurrencyEdit.hpp>	// Pascal unit
#include <cxCalendar.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxGridLevel.hpp>	// Pascal unit
#include <cxGridCardView.hpp>	// Pascal unit
#include <cxStyles.hpp>	// Pascal unit
#include <cxGridCustomTableView.hpp>	// Pascal unit
#include <cxCustomData.hpp>	// Pascal unit
#include <cxGridViewData.hpp>	// Pascal unit
#include <cxGridCustomView.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <cxGridBandedTableView.hpp>	// Pascal unit
#include <cxGridTableView.hpp>	// Pascal unit
#include <cxExport.hpp>	// Pascal unit
#include <cxGrid.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Variants.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <Types.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxexportgrid4link
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS EcxGridExport;
class PASCALIMPLEMENTATION EcxGridExport : public Sysutils::Exception 
{
	typedef Sysutils::Exception inherited;
	
public:
	#pragma option push -w-inl
	/* Exception.Create */ inline __fastcall EcxGridExport(const AnsiString Msg) : Sysutils::Exception(Msg) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateFmt */ inline __fastcall EcxGridExport(const AnsiString Msg, const System::TVarRec * Args, const int Args_Size) : Sysutils::Exception(Msg, Args, Args_Size) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateRes */ inline __fastcall EcxGridExport(int Ident)/* overload */ : Sysutils::Exception(Ident) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResFmt */ inline __fastcall EcxGridExport(int Ident, const System::TVarRec * Args, const int Args_Size)/* overload */ : Sysutils::Exception(Ident, Args, Args_Size) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateHelp */ inline __fastcall EcxGridExport(const AnsiString Msg, int AHelpContext) : Sysutils::Exception(Msg, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateFmtHelp */ inline __fastcall EcxGridExport(const AnsiString Msg, const System::TVarRec * Args, const int Args_Size, int AHelpContext) : Sysutils::Exception(Msg, Args, Args_Size, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResHelp */ inline __fastcall EcxGridExport(int Ident, int AHelpContext)/* overload */ : Sysutils::Exception(Ident, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResFmtHelp */ inline __fastcall EcxGridExport(System::PResStringRec ResStringRec, const System::TVarRec * Args, const int Args_Size, int AHelpContext)/* overload */ : Sysutils::Exception(ResStringRec, Args, Args_Size, AHelpContext) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~EcxGridExport(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE void __fastcall ExportGrid4ToHTML(const AnsiString AFileName, Cxgrid::TcxGrid* AGrid, bool AExpand = true, bool ASaveAll = true, const AnsiString AFileExt = "html");
extern PACKAGE void __fastcall ExportGrid4ToXML(const AnsiString AFileName, Cxgrid::TcxGrid* AGrid, bool AExpand = true, bool ASaveAll = true, const AnsiString AFileExt = "xml");
extern PACKAGE void __fastcall ExportGrid4ToExcel(const AnsiString AFileName, Cxgrid::TcxGrid* AGrid, bool AExpand = true, bool ASaveAll = true, bool AUseNativeFormat = true, const AnsiString AFileExt = "xls");
extern PACKAGE void __fastcall ExportGrid4ToText(const AnsiString AFileName, Cxgrid::TcxGrid* AGrid, bool AExpand = true, bool ASaveAll = true, const AnsiString ASeparator = "", const AnsiString ABeginString = "", const AnsiString AEndString = "", const AnsiString AFileExt = "txt");

}	/* namespace Cxexportgrid4link */
using namespace Cxexportgrid4link;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxExportGrid4Link
