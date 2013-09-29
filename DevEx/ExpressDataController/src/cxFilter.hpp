// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxFilter.pas' rev: 6.00

#ifndef cxFilterHPP
#define cxFilterHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Variants.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxfilter
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TcxFilterOperatorKind { foEqual, foNotEqual, foLess, foLessEqual, foGreater, foGreaterEqual, foLike, foNotLike, foBetween, foNotBetween, foInList, foNotInList, foYesterday, foToday, foTomorrow, foLastWeek, foLastMonth, foLastYear, foThisWeek, foThisMonth, foThisYear, foNextWeek, foNextMonth, foNextYear };
#pragma option pop

typedef Set<TcxFilterOperatorKind, foEqual, foNextYear>  TcxFilterOperatorKinds;

#pragma option push -b-
enum TcxFilterBoolOperatorKind { fboAnd, fboOr, fboNotAnd, fboNotOr };
#pragma option pop

class DELPHICLASS TcxFilterOperator;
class DELPHICLASS TcxFilterCriteriaItem;
class DELPHICLASS TcxCustomFilterCriteriaItem;
class DELPHICLASS TcxFilterCriteriaItemList;
class DELPHICLASS TcxFilterCriteria;
class PASCALIMPLEMENTATION TcxCustomFilterCriteriaItem : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	TcxFilterCriteriaItemList* FParent;
	
protected:
	virtual void __fastcall Changed(void);
	virtual TcxFilterCriteria* __fastcall GetCriteria(void);
	virtual bool __fastcall GetIsItemList(void) = 0 ;
	virtual void __fastcall ReadData(Classes::TStream* AStream);
	virtual void __fastcall WriteData(Classes::TStream* AStream);
	
public:
	__fastcall TcxCustomFilterCriteriaItem(TcxFilterCriteriaItemList* AOwner);
	__fastcall virtual ~TcxCustomFilterCriteriaItem(void);
	__property bool IsItemList = {read=GetIsItemList, nodefault};
	__property TcxFilterCriteria* Criteria = {read=GetCriteria};
	__property TcxFilterCriteriaItemList* Parent = {read=FParent};
};


class PASCALIMPLEMENTATION TcxFilterCriteriaItemList : public TcxCustomFilterCriteriaItem 
{
	typedef TcxCustomFilterCriteriaItem inherited;
	
public:
	TcxCustomFilterCriteriaItem* operator[](int Index) { return Items[Index]; }
	
private:
	TcxFilterBoolOperatorKind FBoolOperatorKind;
	TcxFilterCriteria* FCriteria;
	Classes::TList* FItems;
	int __fastcall GetCount(void);
	TcxCustomFilterCriteriaItem* __fastcall GetItem(int Index);
	
protected:
	virtual TcxFilterCriteria* __fastcall GetCriteria(void);
	virtual bool __fastcall GetIsItemList(void);
	virtual void __fastcall RemoveItem(TcxCustomFilterCriteriaItem* AItem);
	virtual void __fastcall WriteData(Classes::TStream* AStream);
	
public:
	__fastcall TcxFilterCriteriaItemList(TcxFilterCriteriaItemList* AOwner, TcxFilterBoolOperatorKind ABoolOperatorKind);
	__fastcall virtual ~TcxFilterCriteriaItemList(void);
	TcxFilterCriteriaItem* __fastcall AddItem(System::TObject* AItemLink, TcxFilterOperatorKind AOperatorKind, const Variant &AValue, const AnsiString ADisplayValue);
	TcxFilterCriteriaItemList* __fastcall AddItemList(TcxFilterBoolOperatorKind ABoolOperatorKind);
	void __fastcall Clear(void);
	__property TcxFilterBoolOperatorKind BoolOperatorKind = {read=FBoolOperatorKind, write=FBoolOperatorKind, default=0};
	__property int Count = {read=GetCount, nodefault};
	__property TcxFilterCriteria* Criteria = {read=GetCriteria};
	__property TcxCustomFilterCriteriaItem* Items[int Index] = {read=GetItem/*, default*/};
};



typedef TMetaClass*TcxFilterOperatorClass;

class PASCALIMPLEMENTATION TcxFilterCriteriaItem : public TcxCustomFilterCriteriaItem 
{
	typedef TcxCustomFilterCriteriaItem inherited;
	
private:
	AnsiString FDisplayValue;
	System::TObject* FItemLink;
	TcxFilterOperator* FOperator;
	TcxFilterOperatorKind FOperatorKind;
	Variant FValue;
	void __fastcall SetDisplayValue(const AnsiString Value);
	void __fastcall SetOperatorKind(TcxFilterOperatorKind Value);
	void __fastcall SetValue(const Variant &Value);
	
protected:
	virtual Variant __fastcall GetDataValue(void * AData) = 0 ;
	virtual AnsiString __fastcall GetDisplayValue();
	virtual AnsiString __fastcall GetExpressionValue(bool AIsCaption);
	virtual AnsiString __fastcall GetFieldCaption(void) = 0 ;
	virtual AnsiString __fastcall GetFieldName(void) = 0 ;
	virtual TMetaClass* __fastcall GetFilterOperatorClass(void);
	virtual System::TObject* __fastcall GetItemLink(void);
	virtual bool __fastcall GetIsItemList(void);
	virtual void __fastcall RecreateOperator(void);
	virtual void __fastcall WriteData(Classes::TStream* AStream);
	
public:
	__fastcall virtual TcxFilterCriteriaItem(TcxFilterCriteriaItemList* AOwner, System::TObject* AItemLink, TcxFilterOperatorKind AOperatorKind, const Variant &AValue, const AnsiString ADisplayValue);
	__fastcall virtual ~TcxFilterCriteriaItem(void);
	virtual bool __fastcall ValueIsNull(const Variant &AValue);
	__property AnsiString DisplayValue = {read=FDisplayValue, write=SetDisplayValue};
	__property System::TObject* ItemLink = {read=GetItemLink};
	__property TcxFilterOperator* Operator = {read=FOperator};
	__property TcxFilterOperatorKind OperatorKind = {read=FOperatorKind, write=SetOperatorKind, nodefault};
	__property Variant Value = {read=FValue, write=SetValue};
};


class PASCALIMPLEMENTATION TcxFilterOperator : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	TcxFilterCriteriaItem* FCriteriaItem;
	
protected:
	virtual AnsiString __fastcall GetExpressionFilterText(const Variant &AValue);
	virtual AnsiString __fastcall GetExpressionValue(const Variant &AValue);
	virtual void __fastcall PrepareDisplayValue(AnsiString &DisplayValue);
	virtual void __fastcall Prepare(void);
	virtual bool __fastcall PrepareExpressionValue(const Variant &AValue, AnsiString &DisplayValue);
	
public:
	__fastcall virtual TcxFilterOperator(TcxFilterCriteriaItem* ACriteriaItem);
	virtual bool __fastcall CompareValues(const Variant &AValue1, const Variant &AValue2) = 0 ;
	virtual AnsiString __fastcall DisplayText();
	virtual AnsiString __fastcall FilterText(void) = 0 ;
	virtual bool __fastcall IsDescription(void);
	virtual bool __fastcall IsExpression(void);
	__property TcxFilterCriteriaItem* CriteriaItem = {read=FCriteriaItem};
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFilterOperator(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFilterEqualOperator;
class PASCALIMPLEMENTATION TcxFilterEqualOperator : public TcxFilterOperator 
{
	typedef TcxFilterOperator inherited;
	
public:
	virtual bool __fastcall CompareValues(const Variant &AValue1, const Variant &AValue2);
	virtual AnsiString __fastcall DisplayText();
	virtual AnsiString __fastcall FilterText();
public:
	#pragma option push -w-inl
	/* TcxFilterOperator.Create */ inline __fastcall virtual TcxFilterEqualOperator(TcxFilterCriteriaItem* ACriteriaItem) : TcxFilterOperator(ACriteriaItem) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFilterEqualOperator(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFilterNotEqualOperator;
class PASCALIMPLEMENTATION TcxFilterNotEqualOperator : public TcxFilterEqualOperator 
{
	typedef TcxFilterEqualOperator inherited;
	
public:
	virtual bool __fastcall CompareValues(const Variant &AValue1, const Variant &AValue2);
	virtual AnsiString __fastcall DisplayText();
	virtual AnsiString __fastcall FilterText();
public:
	#pragma option push -w-inl
	/* TcxFilterOperator.Create */ inline __fastcall virtual TcxFilterNotEqualOperator(TcxFilterCriteriaItem* ACriteriaItem) : TcxFilterEqualOperator(ACriteriaItem) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFilterNotEqualOperator(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFilterLessOperator;
class PASCALIMPLEMENTATION TcxFilterLessOperator : public TcxFilterOperator 
{
	typedef TcxFilterOperator inherited;
	
public:
	virtual bool __fastcall CompareValues(const Variant &AValue1, const Variant &AValue2);
	virtual AnsiString __fastcall DisplayText();
	virtual AnsiString __fastcall FilterText();
public:
	#pragma option push -w-inl
	/* TcxFilterOperator.Create */ inline __fastcall virtual TcxFilterLessOperator(TcxFilterCriteriaItem* ACriteriaItem) : TcxFilterOperator(ACriteriaItem) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFilterLessOperator(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFilterLessEqualOperator;
class PASCALIMPLEMENTATION TcxFilterLessEqualOperator : public TcxFilterOperator 
{
	typedef TcxFilterOperator inherited;
	
public:
	virtual bool __fastcall CompareValues(const Variant &AValue1, const Variant &AValue2);
	virtual AnsiString __fastcall DisplayText();
	virtual AnsiString __fastcall FilterText();
public:
	#pragma option push -w-inl
	/* TcxFilterOperator.Create */ inline __fastcall virtual TcxFilterLessEqualOperator(TcxFilterCriteriaItem* ACriteriaItem) : TcxFilterOperator(ACriteriaItem) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFilterLessEqualOperator(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFilterGreaterOperator;
class PASCALIMPLEMENTATION TcxFilterGreaterOperator : public TcxFilterOperator 
{
	typedef TcxFilterOperator inherited;
	
public:
	virtual bool __fastcall CompareValues(const Variant &AValue1, const Variant &AValue2);
	virtual AnsiString __fastcall DisplayText();
	virtual AnsiString __fastcall FilterText();
public:
	#pragma option push -w-inl
	/* TcxFilterOperator.Create */ inline __fastcall virtual TcxFilterGreaterOperator(TcxFilterCriteriaItem* ACriteriaItem) : TcxFilterOperator(ACriteriaItem) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFilterGreaterOperator(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFilterGreaterEqualOperator;
class PASCALIMPLEMENTATION TcxFilterGreaterEqualOperator : public TcxFilterOperator 
{
	typedef TcxFilterOperator inherited;
	
public:
	virtual bool __fastcall CompareValues(const Variant &AValue1, const Variant &AValue2);
	virtual AnsiString __fastcall DisplayText();
	virtual AnsiString __fastcall FilterText();
public:
	#pragma option push -w-inl
	/* TcxFilterOperator.Create */ inline __fastcall virtual TcxFilterGreaterEqualOperator(TcxFilterCriteriaItem* ACriteriaItem) : TcxFilterOperator(ACriteriaItem) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFilterGreaterEqualOperator(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFilterLikeOperator;
class PASCALIMPLEMENTATION TcxFilterLikeOperator : public TcxFilterOperator 
{
	typedef TcxFilterOperator inherited;
	
protected:
	virtual void __fastcall PrepareDisplayValue(AnsiString &DisplayValue);
	
public:
	virtual bool __fastcall CompareValues(const Variant &AValue1, const Variant &AValue2);
	virtual AnsiString __fastcall DisplayText();
	virtual AnsiString __fastcall FilterText();
public:
	#pragma option push -w-inl
	/* TcxFilterOperator.Create */ inline __fastcall virtual TcxFilterLikeOperator(TcxFilterCriteriaItem* ACriteriaItem) : TcxFilterOperator(ACriteriaItem) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFilterLikeOperator(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFilterNotLikeOperator;
class PASCALIMPLEMENTATION TcxFilterNotLikeOperator : public TcxFilterLikeOperator 
{
	typedef TcxFilterLikeOperator inherited;
	
public:
	virtual bool __fastcall CompareValues(const Variant &AValue1, const Variant &AValue2);
	virtual AnsiString __fastcall DisplayText();
	virtual AnsiString __fastcall FilterText();
public:
	#pragma option push -w-inl
	/* TcxFilterOperator.Create */ inline __fastcall virtual TcxFilterNotLikeOperator(TcxFilterCriteriaItem* ACriteriaItem) : TcxFilterLikeOperator(ACriteriaItem) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFilterNotLikeOperator(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFilterBetweenOperator;
class PASCALIMPLEMENTATION TcxFilterBetweenOperator : public TcxFilterOperator 
{
	typedef TcxFilterOperator inherited;
	
protected:
	virtual void __fastcall PrepareDisplayValue(AnsiString &DisplayValue);
	virtual bool __fastcall PrepareExpressionValue(const Variant &AValue, AnsiString &DisplayValue);
	
public:
	virtual bool __fastcall CompareValues(const Variant &AValue1, const Variant &AValue2);
	virtual AnsiString __fastcall DisplayText();
	virtual AnsiString __fastcall FilterText();
	virtual bool __fastcall IsDescription(void);
public:
	#pragma option push -w-inl
	/* TcxFilterOperator.Create */ inline __fastcall virtual TcxFilterBetweenOperator(TcxFilterCriteriaItem* ACriteriaItem) : TcxFilterOperator(ACriteriaItem) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFilterBetweenOperator(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFilterNotBetweenOperator;
class PASCALIMPLEMENTATION TcxFilterNotBetweenOperator : public TcxFilterBetweenOperator 
{
	typedef TcxFilterBetweenOperator inherited;
	
public:
	virtual bool __fastcall CompareValues(const Variant &AValue1, const Variant &AValue2);
	virtual AnsiString __fastcall DisplayText();
	virtual AnsiString __fastcall FilterText();
public:
	#pragma option push -w-inl
	/* TcxFilterOperator.Create */ inline __fastcall virtual TcxFilterNotBetweenOperator(TcxFilterCriteriaItem* ACriteriaItem) : TcxFilterBetweenOperator(ACriteriaItem) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFilterNotBetweenOperator(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFilterInListOperator;
class PASCALIMPLEMENTATION TcxFilterInListOperator : public TcxFilterOperator 
{
	typedef TcxFilterOperator inherited;
	
protected:
	virtual void __fastcall PrepareDisplayValue(AnsiString &DisplayValue);
	virtual bool __fastcall PrepareExpressionValue(const Variant &AValue, AnsiString &DisplayValue);
	
public:
	virtual bool __fastcall CompareValues(const Variant &AValue1, const Variant &AValue2);
	virtual AnsiString __fastcall DisplayText();
	virtual AnsiString __fastcall FilterText();
	virtual bool __fastcall IsDescription(void);
public:
	#pragma option push -w-inl
	/* TcxFilterOperator.Create */ inline __fastcall virtual TcxFilterInListOperator(TcxFilterCriteriaItem* ACriteriaItem) : TcxFilterOperator(ACriteriaItem) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFilterInListOperator(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFilterNotInListOperator;
class PASCALIMPLEMENTATION TcxFilterNotInListOperator : public TcxFilterInListOperator 
{
	typedef TcxFilterInListOperator inherited;
	
public:
	virtual bool __fastcall CompareValues(const Variant &AValue1, const Variant &AValue2);
	virtual AnsiString __fastcall DisplayText();
	virtual AnsiString __fastcall FilterText();
public:
	#pragma option push -w-inl
	/* TcxFilterOperator.Create */ inline __fastcall virtual TcxFilterNotInListOperator(TcxFilterCriteriaItem* ACriteriaItem) : TcxFilterInListOperator(ACriteriaItem) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFilterNotInListOperator(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFilterNullOperator;
class PASCALIMPLEMENTATION TcxFilterNullOperator : public TcxFilterEqualOperator 
{
	typedef TcxFilterEqualOperator inherited;
	
protected:
	virtual void __fastcall PrepareDisplayValue(AnsiString &DisplayValue);
	
public:
	virtual bool __fastcall CompareValues(const Variant &AValue1, const Variant &AValue2);
	virtual AnsiString __fastcall DisplayText();
public:
	#pragma option push -w-inl
	/* TcxFilterOperator.Create */ inline __fastcall virtual TcxFilterNullOperator(TcxFilterCriteriaItem* ACriteriaItem) : TcxFilterEqualOperator(ACriteriaItem) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFilterNullOperator(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFilterNotNullOperator;
class PASCALIMPLEMENTATION TcxFilterNotNullOperator : public TcxFilterNullOperator 
{
	typedef TcxFilterNullOperator inherited;
	
public:
	virtual bool __fastcall CompareValues(const Variant &AValue1, const Variant &AValue2);
	virtual AnsiString __fastcall DisplayText();
	virtual AnsiString __fastcall FilterText();
public:
	#pragma option push -w-inl
	/* TcxFilterOperator.Create */ inline __fastcall virtual TcxFilterNotNullOperator(TcxFilterCriteriaItem* ACriteriaItem) : TcxFilterNullOperator(ACriteriaItem) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFilterNotNullOperator(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFilterDateOperator;
class PASCALIMPLEMENTATION TcxFilterDateOperator : public TcxFilterOperator 
{
	typedef TcxFilterOperator inherited;
	
private:
	System::TDateTime FDate1;
	System::TDateTime FDate2;
	
protected:
	virtual void __fastcall PrepareDisplayValue(AnsiString &DisplayValue);
	virtual AnsiString __fastcall GetExpressionFilterText(const Variant &AValue);
	
public:
	virtual bool __fastcall CompareValues(const Variant &AValue1, const Variant &AValue2);
	virtual AnsiString __fastcall FilterText();
	virtual bool __fastcall IsExpression(void);
	__property System::TDateTime Date1 = {read=FDate1, write=FDate1};
	__property System::TDateTime Date2 = {read=FDate2, write=FDate2};
public:
	#pragma option push -w-inl
	/* TcxFilterOperator.Create */ inline __fastcall virtual TcxFilterDateOperator(TcxFilterCriteriaItem* ACriteriaItem) : TcxFilterOperator(ACriteriaItem) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFilterDateOperator(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFilterYesterdayOperator;
class PASCALIMPLEMENTATION TcxFilterYesterdayOperator : public TcxFilterDateOperator 
{
	typedef TcxFilterDateOperator inherited;
	
protected:
	virtual void __fastcall Prepare(void);
	
public:
	virtual AnsiString __fastcall DisplayText();
public:
	#pragma option push -w-inl
	/* TcxFilterOperator.Create */ inline __fastcall virtual TcxFilterYesterdayOperator(TcxFilterCriteriaItem* ACriteriaItem) : TcxFilterDateOperator(ACriteriaItem) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFilterYesterdayOperator(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFilterTodayOperator;
class PASCALIMPLEMENTATION TcxFilterTodayOperator : public TcxFilterDateOperator 
{
	typedef TcxFilterDateOperator inherited;
	
protected:
	virtual void __fastcall Prepare(void);
	
public:
	virtual AnsiString __fastcall DisplayText();
public:
	#pragma option push -w-inl
	/* TcxFilterOperator.Create */ inline __fastcall virtual TcxFilterTodayOperator(TcxFilterCriteriaItem* ACriteriaItem) : TcxFilterDateOperator(ACriteriaItem) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFilterTodayOperator(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFilterTomorrowOperator;
class PASCALIMPLEMENTATION TcxFilterTomorrowOperator : public TcxFilterDateOperator 
{
	typedef TcxFilterDateOperator inherited;
	
protected:
	virtual void __fastcall Prepare(void);
	
public:
	virtual AnsiString __fastcall DisplayText();
public:
	#pragma option push -w-inl
	/* TcxFilterOperator.Create */ inline __fastcall virtual TcxFilterTomorrowOperator(TcxFilterCriteriaItem* ACriteriaItem) : TcxFilterDateOperator(ACriteriaItem) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFilterTomorrowOperator(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFilterLastWeekOperator;
class PASCALIMPLEMENTATION TcxFilterLastWeekOperator : public TcxFilterDateOperator 
{
	typedef TcxFilterDateOperator inherited;
	
protected:
	virtual void __fastcall Prepare(void);
	
public:
	virtual AnsiString __fastcall DisplayText();
public:
	#pragma option push -w-inl
	/* TcxFilterOperator.Create */ inline __fastcall virtual TcxFilterLastWeekOperator(TcxFilterCriteriaItem* ACriteriaItem) : TcxFilterDateOperator(ACriteriaItem) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFilterLastWeekOperator(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFilterLastMonthOperator;
class PASCALIMPLEMENTATION TcxFilterLastMonthOperator : public TcxFilterDateOperator 
{
	typedef TcxFilterDateOperator inherited;
	
protected:
	virtual void __fastcall Prepare(void);
	
public:
	virtual AnsiString __fastcall DisplayText();
public:
	#pragma option push -w-inl
	/* TcxFilterOperator.Create */ inline __fastcall virtual TcxFilterLastMonthOperator(TcxFilterCriteriaItem* ACriteriaItem) : TcxFilterDateOperator(ACriteriaItem) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFilterLastMonthOperator(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFilterLastYearOperator;
class PASCALIMPLEMENTATION TcxFilterLastYearOperator : public TcxFilterDateOperator 
{
	typedef TcxFilterDateOperator inherited;
	
protected:
	virtual void __fastcall Prepare(void);
	
public:
	virtual AnsiString __fastcall DisplayText();
public:
	#pragma option push -w-inl
	/* TcxFilterOperator.Create */ inline __fastcall virtual TcxFilterLastYearOperator(TcxFilterCriteriaItem* ACriteriaItem) : TcxFilterDateOperator(ACriteriaItem) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFilterLastYearOperator(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFilterThisWeekOperator;
class PASCALIMPLEMENTATION TcxFilterThisWeekOperator : public TcxFilterDateOperator 
{
	typedef TcxFilterDateOperator inherited;
	
protected:
	virtual void __fastcall Prepare(void);
	
public:
	virtual AnsiString __fastcall DisplayText();
public:
	#pragma option push -w-inl
	/* TcxFilterOperator.Create */ inline __fastcall virtual TcxFilterThisWeekOperator(TcxFilterCriteriaItem* ACriteriaItem) : TcxFilterDateOperator(ACriteriaItem) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFilterThisWeekOperator(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFilterThisMonthOperator;
class PASCALIMPLEMENTATION TcxFilterThisMonthOperator : public TcxFilterDateOperator 
{
	typedef TcxFilterDateOperator inherited;
	
protected:
	virtual void __fastcall Prepare(void);
	
public:
	virtual AnsiString __fastcall DisplayText();
public:
	#pragma option push -w-inl
	/* TcxFilterOperator.Create */ inline __fastcall virtual TcxFilterThisMonthOperator(TcxFilterCriteriaItem* ACriteriaItem) : TcxFilterDateOperator(ACriteriaItem) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFilterThisMonthOperator(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFilterThisYearOperator;
class PASCALIMPLEMENTATION TcxFilterThisYearOperator : public TcxFilterDateOperator 
{
	typedef TcxFilterDateOperator inherited;
	
protected:
	virtual void __fastcall Prepare(void);
	
public:
	virtual AnsiString __fastcall DisplayText();
public:
	#pragma option push -w-inl
	/* TcxFilterOperator.Create */ inline __fastcall virtual TcxFilterThisYearOperator(TcxFilterCriteriaItem* ACriteriaItem) : TcxFilterDateOperator(ACriteriaItem) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFilterThisYearOperator(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFilterNextWeekOperator;
class PASCALIMPLEMENTATION TcxFilterNextWeekOperator : public TcxFilterDateOperator 
{
	typedef TcxFilterDateOperator inherited;
	
protected:
	virtual void __fastcall Prepare(void);
	
public:
	virtual AnsiString __fastcall DisplayText();
public:
	#pragma option push -w-inl
	/* TcxFilterOperator.Create */ inline __fastcall virtual TcxFilterNextWeekOperator(TcxFilterCriteriaItem* ACriteriaItem) : TcxFilterDateOperator(ACriteriaItem) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFilterNextWeekOperator(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFilterNextMonthOperator;
class PASCALIMPLEMENTATION TcxFilterNextMonthOperator : public TcxFilterDateOperator 
{
	typedef TcxFilterDateOperator inherited;
	
protected:
	virtual void __fastcall Prepare(void);
	
public:
	virtual AnsiString __fastcall DisplayText();
public:
	#pragma option push -w-inl
	/* TcxFilterOperator.Create */ inline __fastcall virtual TcxFilterNextMonthOperator(TcxFilterCriteriaItem* ACriteriaItem) : TcxFilterDateOperator(ACriteriaItem) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFilterNextMonthOperator(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFilterNextYearOperator;
class PASCALIMPLEMENTATION TcxFilterNextYearOperator : public TcxFilterDateOperator 
{
	typedef TcxFilterDateOperator inherited;
	
protected:
	virtual void __fastcall Prepare(void);
	
public:
	virtual AnsiString __fastcall DisplayText();
public:
	#pragma option push -w-inl
	/* TcxFilterOperator.Create */ inline __fastcall virtual TcxFilterNextYearOperator(TcxFilterCriteriaItem* ACriteriaItem) : TcxFilterDateOperator(ACriteriaItem) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFilterNextYearOperator(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxFilterCriteriaItemClass;

#pragma option push -b-
enum TcxFilterValueItemKind { fviAll, fviCustom, fviBlanks, fviNonBlanks, fviUser, fviValue };
#pragma option pop

struct TcxFilterValueItem;
typedef TcxFilterValueItem *PcxFilterValueItem;

struct TcxFilterValueItem
{
	TcxFilterValueItemKind Kind;
	Variant Value;
	AnsiString DisplayText;
} ;

class DELPHICLASS TcxFilterValueList;
class PASCALIMPLEMENTATION TcxFilterValueList : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	PcxFilterValueItem operator[](int Index) { return Items[Index]; }
	
private:
	TcxFilterCriteria* FCriteria;
	Classes::TList* FItems;
	bool FSortByDisplayText;
	int __fastcall GetCount(void);
	PcxFilterValueItem __fastcall GetItem(int Index);
	int __fastcall GetMaxCount(void);
	
protected:
	virtual int __fastcall CompareItem(int AIndex, const Variant &AValue, const AnsiString ADisplayText);
	int __fastcall GetStartValueIndex(void);
	
public:
	__fastcall virtual TcxFilterValueList(TcxFilterCriteria* ACriteria);
	__fastcall virtual ~TcxFilterValueList(void);
	virtual void __fastcall Add(TcxFilterValueItemKind AKind, const Variant &AValue, const AnsiString ADisplayText, bool ANoSorting);
	virtual void __fastcall Clear(void);
	void __fastcall Delete(int AIndex);
	virtual bool __fastcall Find(const Variant &AValue, const AnsiString ADisplayText, int &AIndex);
	int __fastcall FindItemByKind(TcxFilterValueItemKind AKind);
	int __fastcall FindItemByValue(const Variant &AValue);
	virtual int __fastcall GetIndexByCriteriaItem(TcxFilterCriteriaItem* ACriteriaItem);
	__property int Count = {read=GetCount, nodefault};
	__property TcxFilterCriteria* Criteria = {read=FCriteria};
	__property PcxFilterValueItem Items[int Index] = {read=GetItem/*, default*/};
	__property int MaxCount = {read=GetMaxCount, nodefault};
	__property bool SortByDisplayText = {read=FSortByDisplayText, write=FSortByDisplayText, nodefault};
};


typedef TMetaClass*TcxFilterValueListClass;

#pragma option push -b-
enum TcxFilterCriteriaOption { fcoCaseInsensitive, fcoShowOperatorDescription, fcoSoftNull, fcoSoftCompare };
#pragma option pop

typedef Set<TcxFilterCriteriaOption, fcoCaseInsensitive, fcoSoftCompare>  TcxFilterCriteriaOptions;

class PASCALIMPLEMENTATION TcxFilterCriteria : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	AnsiString FDateTimeFormat;
	int FLockCount;
	int FMaxValueListCount;
	TcxFilterCriteriaOptions FOptions;
	char FPercentWildcard;
	TcxFilterCriteriaItemList* FRoot;
	char FUnderscoreWildcard;
	Classes::TNotifyEvent FOnChanged;
	TcxFilterCriteriaOptions __fastcall GetOptions(void);
	void __fastcall ReadItem(Classes::TStream* AStream, TcxFilterCriteriaItemList* AItemList);
	void __fastcall SetDateTimeFormat(const AnsiString Value);
	void __fastcall SetOptions(TcxFilterCriteriaOptions Value);
	void __fastcall SetPercentWildcard(char Value);
	void __fastcall SetUnderscoreWildcard(char Value);
	
protected:
	virtual void __fastcall Changed(void);
	virtual AnsiString __fastcall ConvertDateToStr(const Variant &AValue);
	bool __fastcall DoFilterData(void * AData);
	virtual AnsiString __fastcall GetFilterCaption();
	virtual AnsiString __fastcall GetFilterExpression(bool AIsCaption);
	virtual AnsiString __fastcall GetFilterText();
	virtual int __fastcall GetIDByItemLink(System::TObject* AItemLink) = 0 ;
	virtual TMetaClass* __fastcall GetItemClass(void);
	virtual AnsiString __fastcall GetItemExpression(TcxFilterCriteriaItem* AItem, bool AIsCaption);
	virtual AnsiString __fastcall GetItemExpressionFieldName(TcxFilterCriteriaItem* AItem, bool AIsCaption);
	virtual AnsiString __fastcall GetItemExpressionOperator(TcxFilterCriteriaItem* AItem, bool AIsCaption);
	virtual AnsiString __fastcall GetItemExpressionValue(TcxFilterCriteriaItem* AItem, bool AIsCaption);
	virtual System::TObject* __fastcall GetItemLinkByID(int AID) = 0 ;
	virtual TMetaClass* __fastcall GetValueListClass(void);
	virtual void __fastcall Prepare(void);
	virtual Variant __fastcall PrepareValue(const Variant &AValue);
	virtual void __fastcall ReadData(Classes::TStream* AStream);
	virtual void __fastcall SetFilterText(const AnsiString Value);
	virtual void __fastcall Update(void);
	virtual void __fastcall WriteData(Classes::TStream* AStream);
	__property int LockCount = {read=FLockCount, nodefault};
	
public:
	__fastcall TcxFilterCriteria(void);
	__fastcall virtual ~TcxFilterCriteria(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual void __fastcall AssignEvents(Classes::TPersistent* Source);
	virtual void __fastcall AssignItems(TcxFilterCriteria* ASource);
	virtual TcxFilterCriteriaItem* __fastcall AddItem(TcxFilterCriteriaItemList* AParent, System::TObject* AItemLink, TcxFilterOperatorKind AOperatorKind, const Variant &AValue, const AnsiString ADisplayValue);
	void __fastcall BeginUpdate(void);
	void __fastcall CancelUpdate(void);
	void __fastcall Clear(void);
	void __fastcall EndUpdate(void);
	virtual TcxFilterCriteriaItem* __fastcall FindItemByItemLink(System::TObject* AItemLink);
	virtual bool __fastcall IsEmpty(void);
	void __fastcall Refresh(void);
	void __fastcall RemoveItemByItemLink(System::TObject* AItemLink);
	virtual void __fastcall RestoreDefaults(void);
	virtual bool __fastcall ValueIsNull(const Variant &AValue);
	__property AnsiString DateTimeFormat = {read=FDateTimeFormat, write=SetDateTimeFormat};
	__property AnsiString FilterCaption = {read=GetFilterCaption};
	__property AnsiString FilterText = {read=GetFilterText, write=SetFilterText};
	__property TcxFilterCriteriaItemList* Root = {read=FRoot};
	
__published:
	__property int MaxValueListCount = {read=FMaxValueListCount, write=FMaxValueListCount, default=0};
	__property TcxFilterCriteriaOptions Options = {read=GetOptions, write=SetOptions, default=0};
	__property char PercentWildcard = {read=FPercentWildcard, write=SetPercentWildcard, default=37};
	__property char UnderscoreWildcard = {read=FUnderscoreWildcard, write=SetUnderscoreWildcard, default=95};
	__property Classes::TNotifyEvent OnChanged = {read=FOnChanged, write=FOnChanged};
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE AnsiString __fastcall ExtractFilterDisplayValue(const AnsiString AValues, int &Pos);
extern PACKAGE AnsiString __fastcall VarBetweenArrayToStr(const Variant &AValue);
extern PACKAGE AnsiString __fastcall VarListArrayToStr(const Variant &AValue);

}	/* namespace Cxfilter */
using namespace Cxfilter;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxFilter
