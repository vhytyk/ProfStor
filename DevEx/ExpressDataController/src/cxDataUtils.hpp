// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxDataUtils.pas' rev: 6.00

#ifndef cxDataUtilsHPP
#define cxDataUtilsHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <SysUtils.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Variants.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxdatautils
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TcxDataEditValueSource { evsValue, evsText, evsKey };
#pragma option pop

typedef void __fastcall (__closure *TcxDataBindingNotifyEvent)(void);

class DELPHICLASS TcxCustomDataBinding;
class PASCALIMPLEMENTATION TcxCustomDataBinding : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	Classes::TComponent* FDataComponent;
	Classes::TComponent* FOwner;
	Classes::TComponent* FVisualControl;
	TcxDataBindingNotifyEvent FOnDataChange;
	TcxDataBindingNotifyEvent FOnDataSetChange;
	TcxDataBindingNotifyEvent FOnUpdateData;
	void __fastcall SetVisualControl(Classes::TComponent* Value);
	
protected:
	DYNAMIC Classes::TPersistent* __fastcall GetOwner(void);
	virtual void __fastcall DataChange(void);
	virtual void __fastcall DataSetChange(void);
	virtual bool __fastcall ExecuteAction(Classes::TBasicAction* Action);
	virtual bool __fastcall GetModified(void);
	virtual bool __fastcall GetReadOnly(void);
	virtual void __fastcall SetReadOnly(bool Value);
	virtual bool __fastcall UpdateAction(Classes::TBasicAction* Action);
	virtual void __fastcall UpdateData(void);
	virtual void __fastcall VisualControlChanged(void);
	__property Classes::TComponent* DataComponent = {read=FDataComponent};
	__property bool ReadOnly = {read=GetReadOnly, write=SetReadOnly, nodefault};
	__property TcxDataBindingNotifyEvent OnDataChange = {read=FOnDataChange, write=FOnDataChange};
	__property TcxDataBindingNotifyEvent OnDataSetChange = {read=FOnDataSetChange, write=FOnDataSetChange};
	__property TcxDataBindingNotifyEvent OnUpdateData = {read=FOnUpdateData, write=FOnUpdateData};
	
public:
	__fastcall virtual TcxCustomDataBinding(Classes::TComponent* AOwner, Classes::TComponent* ADataComponent);
	virtual bool __fastcall CanModify(void);
	virtual Variant __fastcall GetStoredValue(TcxDataEditValueSource AValueSource, bool AFocused);
	virtual bool __fastcall IsDataSourceLive(void);
	virtual void __fastcall Reset(void);
	virtual bool __fastcall SetEditMode(void);
	virtual void __fastcall SetStoredValue(TcxDataEditValueSource AValueSource, const Variant &Value);
	virtual void __fastcall UpdateDataSource(void);
	__property bool Modified = {read=GetModified, nodefault};
	__property Classes::TComponent* VisualControl = {read=FVisualControl, write=SetVisualControl};
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxCustomDataBinding(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxCustomDataBindingClass;

//-- var, const, procedure ---------------------------------------------------
extern PACKAGE AnsiString __fastcall DefaultCurrencyDisplayFormat();
extern PACKAGE System::TDateTime __fastcall DateOf(const System::TDateTime AValue);
extern PACKAGE System::TDateTime __fastcall TimeOf(const System::TDateTime AValue);
extern PACKAGE System::TDateTime __fastcall GetStartDateOfWeek(const System::TDateTime AValue);
extern PACKAGE Word __fastcall GetStartOfWeek(void);
extern PACKAGE bool __fastcall DataCompareText(const AnsiString S1, const AnsiString S2, bool APartialCompare);

}	/* namespace Cxdatautils */
using namespace Cxdatautils;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxDataUtils
