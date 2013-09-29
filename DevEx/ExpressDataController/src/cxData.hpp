// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxData.pas' rev: 6.00

#ifndef cxDataHPP
#define cxDataHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxCustomData.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxdata
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxDataController;
class PASCALIMPLEMENTATION TcxDataController : public Cxcustomdata::TcxCustomDataController 
{
	typedef Cxcustomdata::TcxCustomDataController inherited;
	
public:
	__fastcall virtual TcxDataController(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxDataController(void);
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxdata */
using namespace Cxdata;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxData
