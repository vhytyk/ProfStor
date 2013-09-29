// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxFilterControlUtils.pas' rev: 6.00

#ifndef cxFilterControlUtilsHPP
#define cxFilterControlUtilsHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxDataStorage.hpp>	// Pascal unit
#include <cxRadioGroup.hpp>	// Pascal unit
#include <cxTimeEdit.hpp>	// Pascal unit
#include <cxTextEdit.hpp>	// Pascal unit
#include <cxSpinEdit.hpp>	// Pascal unit
#include <cxMRUEdit.hpp>	// Pascal unit
#include <cxMemo.hpp>	// Pascal unit
#include <cxMaskEdit.hpp>	// Pascal unit
#include <cxImageComboBox.hpp>	// Pascal unit
#include <cxHyperLinkEdit.hpp>	// Pascal unit
#include <cxFilter.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxDropDownEdit.hpp>	// Pascal unit
#include <cxDBLookupComboBox.hpp>	// Pascal unit
#include <cxCurrencyEdit.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <cxCheckBox.hpp>	// Pascal unit
#include <cxCalendar.hpp>	// Pascal unit
#include <cxCalc.hpp>	// Pascal unit
#include <cxButtonEdit.hpp>	// Pascal unit
#include <cxBlobEdit.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxfiltercontrolutils
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TcxFilterControlOperator { fcoNone, fcoEqual, fcoNotEqual, fcoLess, fcoLessEqual, fcoGreater, fcoGreaterEqual, fcoLike, fcoNotLike, fcoBlanks, fcoNonBlanks, fcoBetween, fcoNotBetween, fcoInList, fcoNotInList, fcoYesterday, fcoToday, fcoTomorrow, fcoLastWeek, fcoLastMonth, fcoLastYear, fcoThisWeek, fcoThisMonth, fcoThisYear, fcoNextWeek, fcoNextMonth, fcoNextYear };
#pragma option pop

typedef Set<TcxFilterControlOperator, fcoNone, fcoNextYear>  TcxFilterControlOperators;

class DELPHICLASS TcxCustomFilterEditHelper;
class PASCALIMPLEMENTATION TcxCustomFilterEditHelper : public System::TObject 
{
	typedef System::TObject inherited;
	
protected:
	/* virtual class method */ virtual void __fastcall ClearPropertiesEvents(TMetaClass* vmt, Cxedit::TcxCustomEditProperties* AProperties);
	/* virtual class method */ virtual void __fastcall InitializeEdit(TMetaClass* vmt, Cxedit::TcxCustomEdit* AEdit, Cxedit::TcxCustomEditProperties* AEditProperties);
	
public:
	/* virtual class method */ virtual bool __fastcall EditPropertiesHasButtons(TMetaClass* vmt, Cxedit::TcxCustomEditProperties* AEditProperties);
	/*         class method */ static Cxedit::TcxCustomEdit* __fastcall GetFilterEdit(TMetaClass* vmt, Cxedit::TcxCustomEditProperties* AEditProperties, Cxedit::TcxInplaceEditList* AInplaceEditList = (Cxedit::TcxInplaceEditList*)(0x0));
	/* virtual class method */ virtual TMetaClass* __fastcall GetFilterEditClass(TMetaClass* vmt);
	/* virtual class method */ virtual void __fastcall GetFilterValue(TMetaClass* vmt, Cxedit::TcxCustomEdit* AEdit, Cxedit::TcxCustomEditProperties* AEditProperties, Variant &V, AnsiString &S);
	/* virtual class method */ virtual TcxFilterControlOperators __fastcall GetSupportedFilterOperators(TMetaClass* vmt, Cxedit::TcxCustomEditProperties* AEditProperties, bool AExtendedSet = false);
	/* virtual class method */ virtual void __fastcall InitializeProperties(TMetaClass* vmt, Cxedit::TcxCustomEditProperties* AProperties, Cxedit::TcxCustomEditProperties* AEditProperties, bool AHasButtons);
	/* virtual class method */ virtual void __fastcall SetFilterValue(TMetaClass* vmt, Cxedit::TcxCustomEdit* AEdit, Cxedit::TcxCustomEditProperties* AEditProperties, const Variant &AValue);
	/* virtual class method */ virtual bool __fastcall UseDisplayValue(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxCustomFilterEditHelper(void) : System::TObject() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxCustomFilterEditHelper(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxCustomFilterEditHelperClass;

class DELPHICLASS TcxFilterTextEditHelper;
class PASCALIMPLEMENTATION TcxFilterTextEditHelper : public TcxCustomFilterEditHelper 
{
	typedef TcxCustomFilterEditHelper inherited;
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetFilterEditClass(TMetaClass* vmt);
	/* virtual class method */ virtual void __fastcall GetFilterValue(TMetaClass* vmt, Cxedit::TcxCustomEdit* AEdit, Cxedit::TcxCustomEditProperties* AEditProperties, Variant &V, AnsiString &S);
	/* virtual class method */ virtual void __fastcall InitializeProperties(TMetaClass* vmt, Cxedit::TcxCustomEditProperties* AProperties, Cxedit::TcxCustomEditProperties* AEditProperties, bool AHasButtons);
	/* virtual class method */ virtual void __fastcall SetFilterValue(TMetaClass* vmt, Cxedit::TcxCustomEdit* AEdit, Cxedit::TcxCustomEditProperties* AEditProperties, const Variant &AValue);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxFilterTextEditHelper(void) : TcxCustomFilterEditHelper() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFilterTextEditHelper(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFilterMemoHelper;
class PASCALIMPLEMENTATION TcxFilterMemoHelper : public TcxFilterTextEditHelper 
{
	typedef TcxFilterTextEditHelper inherited;
	
public:
	/* virtual class method */ virtual TcxFilterControlOperators __fastcall GetSupportedFilterOperators(TMetaClass* vmt, Cxedit::TcxCustomEditProperties* AEditProperties, bool AExtendedSet = false);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxFilterMemoHelper(void) : TcxFilterTextEditHelper() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFilterMemoHelper(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFilterMaskEditHelper;
class PASCALIMPLEMENTATION TcxFilterMaskEditHelper : public TcxFilterTextEditHelper 
{
	typedef TcxFilterTextEditHelper inherited;
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetFilterEditClass(TMetaClass* vmt);
	/* virtual class method */ virtual TcxFilterControlOperators __fastcall GetSupportedFilterOperators(TMetaClass* vmt, Cxedit::TcxCustomEditProperties* AEditProperties, bool AExtendedSet = false);
	/* virtual class method */ virtual void __fastcall InitializeProperties(TMetaClass* vmt, Cxedit::TcxCustomEditProperties* AProperties, Cxedit::TcxCustomEditProperties* AEditProperties, bool AHasButtons);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxFilterMaskEditHelper(void) : TcxFilterTextEditHelper() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFilterMaskEditHelper(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFilterComboBoxHelper;
class PASCALIMPLEMENTATION TcxFilterComboBoxHelper : public TcxFilterMaskEditHelper 
{
	typedef TcxFilterMaskEditHelper inherited;
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetFilterEditClass(TMetaClass* vmt);
	/* virtual class method */ virtual void __fastcall InitializeProperties(TMetaClass* vmt, Cxedit::TcxCustomEditProperties* AProperties, Cxedit::TcxCustomEditProperties* AEditProperties, bool AHasButtons);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxFilterComboBoxHelper(void) : TcxFilterMaskEditHelper() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFilterComboBoxHelper(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFilterCheckBoxHelper;
class PASCALIMPLEMENTATION TcxFilterCheckBoxHelper : public TcxCustomFilterEditHelper 
{
	typedef TcxCustomFilterEditHelper inherited;
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetFilterEditClass(TMetaClass* vmt);
	/* virtual class method */ virtual void __fastcall GetFilterValue(TMetaClass* vmt, Cxedit::TcxCustomEdit* AEdit, Cxedit::TcxCustomEditProperties* AEditProperties, Variant &V, AnsiString &S);
	/* virtual class method */ virtual TcxFilterControlOperators __fastcall GetSupportedFilterOperators(TMetaClass* vmt, Cxedit::TcxCustomEditProperties* AEditProperties, bool AExtendedSet = false);
	/* virtual class method */ virtual void __fastcall InitializeProperties(TMetaClass* vmt, Cxedit::TcxCustomEditProperties* AProperties, Cxedit::TcxCustomEditProperties* AEditProperties, bool AHasButtons);
	/* virtual class method */ virtual void __fastcall SetFilterValue(TMetaClass* vmt, Cxedit::TcxCustomEdit* AEdit, Cxedit::TcxCustomEditProperties* AEditProperties, const Variant &AValue);
	/* virtual class method */ virtual bool __fastcall UseDisplayValue(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxFilterCheckBoxHelper(void) : TcxCustomFilterEditHelper() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFilterCheckBoxHelper(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFilterCalcEditHelper;
class PASCALIMPLEMENTATION TcxFilterCalcEditHelper : public TcxFilterMaskEditHelper 
{
	typedef TcxFilterMaskEditHelper inherited;
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetFilterEditClass(TMetaClass* vmt);
	/* virtual class method */ virtual TcxFilterControlOperators __fastcall GetSupportedFilterOperators(TMetaClass* vmt, Cxedit::TcxCustomEditProperties* AEditProperties, bool AExtendedSet = false);
	/* virtual class method */ virtual void __fastcall InitializeProperties(TMetaClass* vmt, Cxedit::TcxCustomEditProperties* AProperties, Cxedit::TcxCustomEditProperties* AEditProperties, bool AHasButtons);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxFilterCalcEditHelper(void) : TcxFilterMaskEditHelper() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFilterCalcEditHelper(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFilterDateEditHelper;
class PASCALIMPLEMENTATION TcxFilterDateEditHelper : public TcxFilterMaskEditHelper 
{
	typedef TcxFilterMaskEditHelper inherited;
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetFilterEditClass(TMetaClass* vmt);
	/* virtual class method */ virtual TcxFilterControlOperators __fastcall GetSupportedFilterOperators(TMetaClass* vmt, Cxedit::TcxCustomEditProperties* AEditProperties, bool AExtendedSet = false);
	/* virtual class method */ virtual void __fastcall InitializeProperties(TMetaClass* vmt, Cxedit::TcxCustomEditProperties* AProperties, Cxedit::TcxCustomEditProperties* AEditProperties, bool AHasButtons);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxFilterDateEditHelper(void) : TcxFilterMaskEditHelper() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFilterDateEditHelper(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFilterCurrencyEditHelper;
class PASCALIMPLEMENTATION TcxFilterCurrencyEditHelper : public TcxFilterTextEditHelper 
{
	typedef TcxFilterTextEditHelper inherited;
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetFilterEditClass(TMetaClass* vmt);
	/* virtual class method */ virtual TcxFilterControlOperators __fastcall GetSupportedFilterOperators(TMetaClass* vmt, Cxedit::TcxCustomEditProperties* AEditProperties, bool AExtendedSet = false);
	/* virtual class method */ virtual void __fastcall InitializeProperties(TMetaClass* vmt, Cxedit::TcxCustomEditProperties* AProperties, Cxedit::TcxCustomEditProperties* AEditProperties, bool AHasButtons);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxFilterCurrencyEditHelper(void) : TcxFilterTextEditHelper() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFilterCurrencyEditHelper(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFilterSpinEditHelper;
class PASCALIMPLEMENTATION TcxFilterSpinEditHelper : public TcxFilterMaskEditHelper 
{
	typedef TcxFilterMaskEditHelper inherited;
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetFilterEditClass(TMetaClass* vmt);
	/* virtual class method */ virtual TcxFilterControlOperators __fastcall GetSupportedFilterOperators(TMetaClass* vmt, Cxedit::TcxCustomEditProperties* AEditProperties, bool AExtendedSet = false);
	/* virtual class method */ virtual void __fastcall InitializeProperties(TMetaClass* vmt, Cxedit::TcxCustomEditProperties* AProperties, Cxedit::TcxCustomEditProperties* AEditProperties, bool AHasButtons);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxFilterSpinEditHelper(void) : TcxFilterMaskEditHelper() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFilterSpinEditHelper(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFilterImageComboBoxHelper;
class PASCALIMPLEMENTATION TcxFilterImageComboBoxHelper : public TcxFilterComboBoxHelper 
{
	typedef TcxFilterComboBoxHelper inherited;
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetFilterEditClass(TMetaClass* vmt);
	/* virtual class method */ virtual void __fastcall GetFilterValue(TMetaClass* vmt, Cxedit::TcxCustomEdit* AEdit, Cxedit::TcxCustomEditProperties* AEditProperties, Variant &V, AnsiString &S);
	/* virtual class method */ virtual TcxFilterControlOperators __fastcall GetSupportedFilterOperators(TMetaClass* vmt, Cxedit::TcxCustomEditProperties* AEditProperties, bool AExtendedSet = false);
	/* virtual class method */ virtual void __fastcall InitializeProperties(TMetaClass* vmt, Cxedit::TcxCustomEditProperties* AProperties, Cxedit::TcxCustomEditProperties* AEditProperties, bool AHasButtons);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxFilterImageComboBoxHelper(void) : TcxFilterComboBoxHelper() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFilterImageComboBoxHelper(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFilterTimeEditHelper;
class PASCALIMPLEMENTATION TcxFilterTimeEditHelper : public TcxFilterSpinEditHelper 
{
	typedef TcxFilterSpinEditHelper inherited;
	
protected:
	/* virtual class method */ virtual void __fastcall InitializeEdit(TMetaClass* vmt, Cxedit::TcxCustomEdit* AEdit, Cxedit::TcxCustomEditProperties* AEditProperties);
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetFilterEditClass(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxFilterTimeEditHelper(void) : TcxFilterSpinEditHelper() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFilterTimeEditHelper(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFilterMRUEditHelper;
class PASCALIMPLEMENTATION TcxFilterMRUEditHelper : public TcxFilterTextEditHelper 
{
	typedef TcxFilterTextEditHelper inherited;
	
public:
	/* virtual class method */ virtual bool __fastcall EditPropertiesHasButtons(TMetaClass* vmt, Cxedit::TcxCustomEditProperties* AEditProperties);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxFilterMRUEditHelper(void) : TcxFilterTextEditHelper() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFilterMRUEditHelper(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFilterHyperLinkEditHelper;
class PASCALIMPLEMENTATION TcxFilterHyperLinkEditHelper : public TcxFilterTextEditHelper 
{
	typedef TcxFilterTextEditHelper inherited;
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetFilterEditClass(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxFilterHyperLinkEditHelper(void) : TcxFilterTextEditHelper() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFilterHyperLinkEditHelper(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFilterLookupComboBoxHelper;
class PASCALIMPLEMENTATION TcxFilterLookupComboBoxHelper : public TcxFilterComboBoxHelper 
{
	typedef TcxFilterComboBoxHelper inherited;
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetFilterEditClass(TMetaClass* vmt);
	/* virtual class method */ virtual TcxFilterControlOperators __fastcall GetSupportedFilterOperators(TMetaClass* vmt, Cxedit::TcxCustomEditProperties* AEditProperties, bool AExtendedSet = false);
	/* virtual class method */ virtual void __fastcall InitializeProperties(TMetaClass* vmt, Cxedit::TcxCustomEditProperties* AProperties, Cxedit::TcxCustomEditProperties* AEditProperties, bool AHasButtons);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxFilterLookupComboBoxHelper(void) : TcxFilterComboBoxHelper() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFilterLookupComboBoxHelper(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFilterRadioGroupHelper;
class PASCALIMPLEMENTATION TcxFilterRadioGroupHelper : public TcxCustomFilterEditHelper 
{
	typedef TcxCustomFilterEditHelper inherited;
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetFilterEditClass(TMetaClass* vmt);
	/* virtual class method */ virtual void __fastcall GetFilterValue(TMetaClass* vmt, Cxedit::TcxCustomEdit* AEdit, Cxedit::TcxCustomEditProperties* AEditProperties, Variant &V, AnsiString &S);
	/* virtual class method */ virtual TcxFilterControlOperators __fastcall GetSupportedFilterOperators(TMetaClass* vmt, Cxedit::TcxCustomEditProperties* AEditProperties, bool AExtendedSet = false);
	/* virtual class method */ virtual void __fastcall InitializeProperties(TMetaClass* vmt, Cxedit::TcxCustomEditProperties* AProperties, Cxedit::TcxCustomEditProperties* AEditProperties, bool AHasButtons);
	/* virtual class method */ virtual void __fastcall SetFilterValue(TMetaClass* vmt, Cxedit::TcxCustomEdit* AEdit, Cxedit::TcxCustomEditProperties* AEditProperties, const Variant &AValue);
	/* virtual class method */ virtual bool __fastcall UseDisplayValue(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxFilterRadioGroupHelper(void) : TcxCustomFilterEditHelper() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFilterRadioGroupHelper(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFilterEditsController;
class PASCALIMPLEMENTATION TcxFilterEditsController : public Cxclasses::TcxRegisteredClassList 
{
	typedef Cxclasses::TcxRegisteredClassList inherited;
	
private:
	TMetaClass* __fastcall GetItemClass(TMetaClass* AItemClass);
	
public:
	TMetaClass* __fastcall FindHelper(TMetaClass* APropertiesClass);
	virtual void __fastcall Register(TMetaClass* AItemClass, TMetaClass* ARegisteredClass);
	virtual void __fastcall Unregister(TMetaClass* AItemClass, TMetaClass* ARegisteredClass);
public:
	#pragma option push -w-inl
	/* TcxRegisteredClassList.Create */ inline __fastcall TcxFilterEditsController(void) : Cxclasses::TcxRegisteredClassList() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxRegisteredClassList.Destroy */ inline __fastcall virtual ~TcxFilterEditsController(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE void __fastcall FilterControlValidateValue(Cxedit::TcxCustomEdit* AEdit, Variant &AValue, TcxFilterControlOperator AOperator, TMetaClass* AValueTypeClass);
extern PACKAGE TcxFilterEditsController* __fastcall FilterEditsController(void);
extern PACKAGE AnsiString __fastcall GetFilterControlOperatorText(TcxFilterControlOperator AOperator);

}	/* namespace Cxfiltercontrolutils */
using namespace Cxfiltercontrolutils;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxFilterControlUtils
