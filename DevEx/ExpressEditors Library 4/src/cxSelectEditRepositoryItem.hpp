// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxSelectEditRepositoryItem.pas' rev: 6.00

#ifndef cxSelectEditRepositoryItemHPP
#define cxSelectEditRepositoryItemHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <ExtCtrls.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxselecteditrepositoryitem
{
//-- type declarations -------------------------------------------------------
#pragma pack(push, 4)
struct TcxSelectRepositoryItemSetup
{
	int TopIndex;
	int Selected;
	Cxclasses::TcxRegisteredClasses* List;
	Types::TPoint Pos;
} ;
#pragma pack(pop)

class DELPHICLASS TcxSelectRepositoryItem;
class PASCALIMPLEMENTATION TcxSelectRepositoryItem : public Forms::TForm 
{
	typedef Forms::TForm inherited;
	
__published:
	Stdctrls::TListBox* lbItems;
	Extctrls::TPanel* Panel1;
	Stdctrls::TLabel* lbHint;
	Stdctrls::TLabel* Label1;
	Stdctrls::TButton* btOk;
	Stdctrls::TButton* btCancel;
	void __fastcall lbItemsClick(System::TObject* Sender);
	void __fastcall lbItemsMouseDown(System::TObject* Sender, Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	
private:
	Cxclasses::TcxRegisteredClasses* FList;
	void __fastcall Setup(const TcxSelectRepositoryItemSetup &AData);
	void __fastcall SaveSetup(TcxSelectRepositoryItemSetup &AData);
public:
	#pragma option push -w-inl
	/* TCustomForm.Create */ inline __fastcall virtual TcxSelectRepositoryItem(Classes::TComponent* AOwner) : Forms::TForm(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual TcxSelectRepositoryItem(Classes::TComponent* AOwner, int Dummy) : Forms::TForm(AOwner, Dummy) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TcxSelectRepositoryItem(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxSelectRepositoryItem(HWND ParentWindow) : Forms::TForm(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE TMetaClass* __fastcall GetEditRepositoryItemClass(TcxSelectRepositoryItemSetup &ASetupData);

}	/* namespace Cxselecteditrepositoryitem */
using namespace Cxselecteditrepositoryitem;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxSelectEditRepositoryItem
