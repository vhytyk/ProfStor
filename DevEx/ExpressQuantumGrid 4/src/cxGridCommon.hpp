// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxGridCommon.pas' rev: 6.00

#ifndef cxGridCommonHPP
#define cxGridCommonHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Windows.hpp>	// Pascal unit
#include <cxLookAndFeelPainters.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxgridcommon
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TcxGridCellState { gcsNone, gcsSelected, gcsPressed };
#pragma option pop

typedef void __fastcall (__closure *TcxGridClassEnumeratorProc)(TMetaClass* AClass);

typedef Classes::TComponent* __fastcall (*TcxGridGetComponent)(Classes::TComponent* ACaller, int Index);

class DELPHICLASS TcxCustomGridChange;
class PASCALIMPLEMENTATION TcxCustomGridChange : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	Cxcontrols::TcxControl* FControl;
	
public:
	virtual void __fastcall Execute(void) = 0 ;
	virtual bool __fastcall IsCompatibleWith(TcxCustomGridChange* AChange);
	virtual bool __fastcall IsCumulative(void);
	virtual bool __fastcall IsEqual(TcxCustomGridChange* AChange);
	virtual bool __fastcall IsLockable(void);
	__property Cxcontrols::TcxControl* Control = {read=FControl, write=FControl};
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxCustomGridChange(void) : System::TObject() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxCustomGridChange(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomGridDragOpenInfo;
class PASCALIMPLEMENTATION TcxCustomGridDragOpenInfo : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	virtual bool __fastcall Equals(TcxCustomGridDragOpenInfo* AInfo);
	virtual void __fastcall Run(void) = 0 ;
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxCustomGridDragOpenInfo(void) : System::TObject() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxCustomGridDragOpenInfo(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
static const Word cxGridInvisibleCoordinate = 0x7530;
static const Shortint cxGridCellTextOffset = 0x2;
static const Shortint cxGridEditOffset = 0x1;
static const Shortint cxGridHeaderTextOffset = 0x2;
static const Word crcxGridBase = 0xfa0;
extern PACKAGE int crcxGridHorzSize;
extern PACKAGE int crcxGridVertSize;
extern PACKAGE int crcxGridRemove;
extern PACKAGE int crcxGridNoDrop;
extern PACKAGE int crcxGridDrag;
extern PACKAGE int crcxGridMultiDrag;
extern PACKAGE AnsiString __fastcall GetValidName(Classes::TComponent* AComponent, const AnsiString AName, bool AIsBaseName = false);
extern PACKAGE void __fastcall RenameComponents(Classes::TComponent* ACaller, Classes::TComponent* AOwner, AnsiString ANewName, AnsiString AOldName, int AComponentCount, TcxGridGetComponent AGetComponent);
extern PACKAGE void __fastcall GetCellTextAreaSize(int &ATextSize);
extern PACKAGE Cxlookandfeelpainters::TcxButtonState __fastcall GridCellStateToButtonState(TcxGridCellState ACellState);

}	/* namespace Cxgridcommon */
using namespace Cxgridcommon;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxGridCommon
