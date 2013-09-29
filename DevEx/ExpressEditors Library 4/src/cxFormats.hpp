// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxFormats.pas' rev: 6.00

#ifndef cxFormatsHPP
#define cxFormatsHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Classes.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxformats
{
//-- type declarations -------------------------------------------------------
__interface IcxFormatContollerListener;
typedef System::DelphiInterface<IcxFormatContollerListener> _di_IcxFormatContollerListener;
__interface INTERFACE_UUID("{A7F2F6D3-1A7D-4295-A6E6-9297BD83D0DE}") IcxFormatContollerListener  : public IInterface 
{
	
public:
	virtual void __fastcall FormatChanged(void) = 0 ;
};

typedef Shortint TDayOfWeek;

class DELPHICLASS TcxFormatController;
class PASCALIMPLEMENTATION TcxFormatController : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	AnsiString FCurrencyFormat;
	AnsiString FDateEditFormat;
	AnsiString FDateEditMask;
	Classes::TList* FList;
	int FLockCount;
	AnsiString FMaskedDateEditFormat;
	AnsiString FRegExprDateEditMask;
	AnsiString FStandardDateEditMask;
	TDayOfWeek FStartOfWeek;
	bool FUseDelphiDateTimeFormats;
	AnsiString __fastcall GetCurrencyFormat();
	AnsiString __fastcall GetDateEditFormat(bool AIsMasked);
	AnsiString __fastcall GetDateEditMask();
	TDayOfWeek __fastcall GetStartOfWeek(void);
	void __fastcall SetCurrencyFormat(const AnsiString Value);
	void __fastcall SetRegExprDateEditMask(const AnsiString Value);
	void __fastcall SetStandardDateEditMask(const AnsiString Value);
	void __fastcall SetStartOfWeek(const TDayOfWeek Value);
	void __fastcall SetUseDelphiDateTimeFormats(const bool Value);
	
protected:
	HWND FWindow;
	void __fastcall MainWndProc(Messages::TMessage &Message);
	virtual void __fastcall WndProc(Messages::TMessage &Message);
	void __fastcall FormatChanged(void);
	
public:
	__fastcall TcxFormatController(void);
	__fastcall virtual ~TcxFormatController(void);
	virtual void __fastcall AddListener(_di_IcxFormatContollerListener AListener);
	void __fastcall BeginUpdate(void);
	void __fastcall EndUpdate(void);
	void __fastcall GetFormats(void);
	void __fastcall NotifyListeners(void);
	virtual void __fastcall RemoveListener(_di_IcxFormatContollerListener AListener);
	__property AnsiString CurrencyFormat = {read=FCurrencyFormat, write=SetCurrencyFormat};
	__property AnsiString DateEditFormat = {read=FDateEditFormat};
	__property AnsiString DateEditMask = {read=FDateEditMask};
	__property AnsiString MaskedDateEditFormat = {read=FMaskedDateEditFormat};
	__property AnsiString RegExprDateEditMask = {read=FRegExprDateEditMask, write=SetRegExprDateEditMask};
	__property AnsiString StandardDateEditMask = {read=FStandardDateEditMask, write=SetStandardDateEditMask};
	__property TDayOfWeek StartOfWeek = {read=FStartOfWeek, write=SetStartOfWeek, nodefault};
	__property bool UseDelphiDateTimeFormats = {read=FUseDelphiDateTimeFormats, write=SetUseDelphiDateTimeFormats, nodefault};
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE TcxFormatController* __fastcall cxFormatController(void);

}	/* namespace Cxformats */
using namespace Cxformats;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxFormats
