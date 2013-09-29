// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxGridCustomTableView.pas' rev: 6.00

#ifndef cxGridCustomTableViewHPP
#define cxGridCustomTableViewHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxGridCustomView.hpp>	// Pascal unit
#include <cxGridCommon.hpp>	// Pascal unit
#include <cxStyles.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <cxDataUtils.hpp>	// Pascal unit
#include <cxFilter.hpp>	// Pascal unit
#include <cxData.hpp>	// Pascal unit
#include <cxCustomData.hpp>	// Pascal unit
#include <cxDataStorage.hpp>	// Pascal unit
#include <cxNavigator.hpp>	// Pascal unit
#include <cxFilterControl.hpp>	// Pascal unit
#include <cxStorage.hpp>	// Pascal unit
#include <cxLookAndFeels.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxgridcustomtableview
{
//-- type declarations -------------------------------------------------------
typedef TMetaClass*TcxGridItemDataBindingClass;

typedef TMetaClass*TcxCustomGridRecordViewInfoClass;

class DELPHICLASS TcxGridDataChange;
class PASCALIMPLEMENTATION TcxGridDataChange : public Cxgridcustomview::TcxCustomGridViewChange 
{
	typedef Cxgridcustomview::TcxCustomGridViewChange inherited;
	
public:
	virtual void __fastcall Execute(void);
	virtual bool __fastcall IsLockable(void);
public:
	#pragma option push -w-inl
	/* TcxCustomGridViewChange.Create */ inline __fastcall virtual TcxGridDataChange(Cxgridcustomview::TcxCustomGridView* AGridView) : Cxgridcustomview::TcxCustomGridViewChange(AGridView) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridDataChange(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridRecordChange;
class DELPHICLASS TcxCustomGridTableItem;
class DELPHICLASS TcxGridItemDataBinding;
class DELPHICLASS TcxCustomGridTableView;
class PASCALIMPLEMENTATION TcxGridItemDataBinding : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	void *FData;
	Cxedit::TcxCustomEditDefaultValuesProvider* FDefaultValuesProvider;
	TcxCustomGridTableItem* FItem;
	Cxcustomdata::TcxCustomDataController* __fastcall GetDataController(void);
	Cxcustomdata::TcxDataFilterCriteria* __fastcall GetFilter(void);
	Cxfilter::TcxFilterCriteriaItem* __fastcall GetFilterCriteriaItem(void);
	bool __fastcall GetFiltered(void);
	TcxCustomGridTableView* __fastcall GetGridView(void);
	TMetaClass* __fastcall GetValueTypeClass(void);
	void __fastcall SetFiltered(bool Value);
	void __fastcall SetValueTypeClass(TMetaClass* Value);
	
protected:
	TMetaClass* __fastcall GetDefaultValuesProviderClass(void);
	virtual void __fastcall Init(void);
	__property Cxedit::TcxCustomEditDefaultValuesProvider* DefaultValuesProvider = {read=FDefaultValuesProvider};
	
public:
	__fastcall virtual TcxGridItemDataBinding(TcxCustomGridTableItem* AItem);
	__fastcall virtual ~TcxGridItemDataBinding(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual AnsiString __fastcall DefaultCaption();
	virtual Cxedit::TcxEditRepositoryItem* __fastcall DefaultRepositoryItem(void);
	virtual int __fastcall DefaultWidth(bool ATakeHeaderIntoAccount = true);
	Cxedit::_di_IcxEditDefaultValuesProvider __fastcall GetDefaultValuesProvider(Cxedit::TcxCustomEditProperties* AProperties = (Cxedit::TcxCustomEditProperties*)(0x0));
	bool __fastcall IsDisplayFormatDefined(void);
	Cxfilter::TcxFilterCriteriaItem* __fastcall AddToFilter(Cxfilter::TcxFilterCriteriaItemList* AParent, Cxfilter::TcxFilterOperatorKind AOperatorKind, const Variant &AValue, const AnsiString ADisplayText = "", bool AReplaceExistent = true);
	void __fastcall GetFilterDisplayText(const Variant &AValue, AnsiString &ADisplayText);
	void __fastcall GetFilterStrings(Classes::TStrings* AStrings, Cxcustomdata::TcxDataFilterValueList* AValueList);
	__property void * Data = {read=FData, write=FData};
	__property Cxcustomdata::TcxCustomDataController* DataController = {read=GetDataController};
	__property Cxcustomdata::TcxDataFilterCriteria* Filter = {read=GetFilter};
	__property Cxfilter::TcxFilterCriteriaItem* FilterCriteriaItem = {read=GetFilterCriteriaItem};
	__property bool Filtered = {read=GetFiltered, write=SetFiltered, nodefault};
	__property TcxCustomGridTableView* GridView = {read=GetGridView};
	__property TcxCustomGridTableItem* Item = {read=FItem};
	__property TMetaClass* ValueTypeClass = {read=GetValueTypeClass, write=SetValueTypeClass};
};


class DELPHICLASS TcxCustomGridTableItemOptions;
class DELPHICLASS TcxCustomGridTableItemCustomOptions;
class PASCALIMPLEMENTATION TcxCustomGridTableItemCustomOptions : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	TcxCustomGridTableItem* FItem;
	TcxCustomGridTableView* __fastcall GetGridView(void);
	
protected:
	virtual void __fastcall Changed(void);
	__property TcxCustomGridTableView* GridView = {read=GetGridView};
	__property TcxCustomGridTableItem* Item = {read=FItem};
	
public:
	__fastcall virtual TcxCustomGridTableItemCustomOptions(TcxCustomGridTableItem* AItem);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxCustomGridTableItemCustomOptions(void) { }
	#pragma option pop
	
};


#pragma option push -b-
enum TcxGridItemShowEditButtons { isebDefault, isebNever, isebAlways };
#pragma option pop

class PASCALIMPLEMENTATION TcxCustomGridTableItemOptions : public TcxCustomGridTableItemCustomOptions 
{
	typedef TcxCustomGridTableItemCustomOptions inherited;
	
private:
	bool FEditing;
	bool FFiltering;
	bool FFocusing;
	bool FGrouping;
	bool FIncSearch;
	bool FMoving;
	TcxGridItemShowEditButtons FShowEditButtons;
	bool FSorting;
	void __fastcall SetEditing(bool Value);
	void __fastcall SetFiltering(bool Value);
	void __fastcall SetFocusing(bool Value);
	void __fastcall SetIncSearch(bool Value);
	void __fastcall SetShowEditButtons(TcxGridItemShowEditButtons Value);
	
protected:
	__property bool Grouping = {read=FGrouping, write=FGrouping, default=1};
	__property bool Moving = {read=FMoving, write=FMoving, default=1};
	__property bool Sorting = {read=FSorting, write=FSorting, default=1};
	
public:
	__fastcall virtual TcxCustomGridTableItemOptions(TcxCustomGridTableItem* AItem);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	
__published:
	__property bool Editing = {read=FEditing, write=SetEditing, default=1};
	__property bool Filtering = {read=FFiltering, write=SetFiltering, default=1};
	__property bool Focusing = {read=FFocusing, write=SetFocusing, default=1};
	__property bool IncSearch = {read=FIncSearch, write=SetIncSearch, default=1};
	__property TcxGridItemShowEditButtons ShowEditButtons = {read=FShowEditButtons, write=SetShowEditButtons, default=0};
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxCustomGridTableItemOptions(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomGridTableItemStyles;
class DELPHICLASS TcxCustomGridRecord;
typedef void __fastcall (__closure *TcxGridGetCellStyleEvent)(TcxCustomGridTableView* Sender, TcxCustomGridRecord* ARecord, TcxCustomGridTableItem* AItem, Cxstyles::TcxStyle* &AStyle);

class PASCALIMPLEMENTATION TcxCustomGridTableItemStyles : public Cxgridcustomview::TcxCustomGridStyles 
{
	typedef Cxgridcustomview::TcxCustomGridStyles inherited;
	
private:
	TcxGridGetCellStyleEvent FOnGetContentStyle;
	TcxCustomGridTableView* __fastcall GetGridViewValue(void);
	HIDESBASE TcxCustomGridTableItem* __fastcall GetItem(void);
	
protected:
	virtual void __fastcall GetDefaultViewParams(int Index, void * AData, /* out */ Cxgraphics::TcxViewParams &AParams);
	virtual Cxgridcustomview::TcxCustomGridView* __fastcall GetGridView(void);
	
public:
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual void __fastcall GetContentParams(TcxCustomGridRecord* ARecord, /* out */ Cxgraphics::TcxViewParams &AParams);
	__property TcxCustomGridTableView* GridView = {read=GetGridViewValue};
	__property TcxCustomGridTableItem* Item = {read=GetItem};
	
__published:
	__property Cxstyles::TcxStyle* Content = {read=GetValue, write=SetValue, index=0};
	__property TcxGridGetCellStyleEvent OnGetContentStyle = {read=FOnGetContentStyle, write=FOnGetContentStyle};
public:
	#pragma option push -w-inl
	/* TcxCustomStyles.Create */ inline __fastcall virtual TcxCustomGridTableItemStyles(Classes::TPersistent* AOwner) : Cxgridcustomview::TcxCustomGridStyles(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomStyles.Destroy */ inline __fastcall virtual ~TcxCustomGridTableItemStyles(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridTableDataCellViewInfo;
typedef void __fastcall (__closure *TcxGridTableDataCellCustomDrawEvent)(TcxCustomGridTableView* Sender, Cxgraphics::TcxCanvas* ACanvas, TcxGridTableDataCellViewInfo* AViewInfo, bool &ADone);

typedef void __fastcall (__closure *TcxGridGetDisplayTextEvent)(TcxCustomGridTableItem* Sender, TcxCustomGridRecord* ARecord, AnsiString &AText);

typedef void __fastcall (__closure *TcxGridGetFilterDisplayTextEvent)(TcxCustomGridTableItem* Sender, const Variant &AValue, AnsiString &ADisplayText);

typedef void __fastcall (__closure *TcxGridGetFilterValuesEvent)(TcxCustomGridTableItem* Sender, Cxcustomdata::TcxDataFilterValueList* AValueList);

typedef void __fastcall (__closure *TcxGridGetPropertiesEvent)(TcxCustomGridTableItem* Sender, TcxCustomGridRecord* ARecord, Cxedit::TcxCustomEditProperties* &AProperties);

class DELPHICLASS TcxCustomGridTableController;
class DELPHICLASS TcxCustomGridTableViewData;
#pragma option push -b-
enum TcxGridTableItemChange { ticLayout, ticSize };
#pragma option pop

typedef TMetaClass*TcxCustomGridTableItemOptionsClass;

typedef TMetaClass*TcxCustomGridTableItemStylesClass;

class PASCALIMPLEMENTATION TcxCustomGridTableItem : public Classes::TComponent 
{
	typedef Classes::TComponent inherited;
	
private:
	AnsiString FCaption;
	Classes::TList* FCells;
	Cxedit::TcxCustomEditStyle* FCellStyle;
	int FCellStyleUseCounter;
	TcxGridItemDataBinding* FDataBinding;
	Cxedit::TcxCustomEditData* FEditData;
	Cxedit::TcxCustomEditViewData* FEditViewData;
	TcxCustomGridTableView* FGridView;
	Classes::TAlignment FHeaderAlignmentHorz;
	Cxclasses::TcxAlignmentVert FHeaderAlignmentVert;
	int FID;
	bool FIgnoreLoadingStatus;
	int FIndex;
	bool FIsCaptionAssigned;
	bool FIsHeaderAlignmentHorzAssigned;
	bool FIsHeaderAlignmentVertAssigned;
	bool FIsWidthAssigned;
	Cxedit::TcxEditRepositoryItem* FLastUsedDefaultRepositoryItem;
	int FMinWidth;
	TcxCustomGridTableItemOptions* FOptions;
	Cxedit::TcxCustomEditProperties* FProperties;
	TMetaClass*FPropertiesClass;
	Cxedit::TcxCustomEditProperties* FPropertiesValue;
	Cxedit::TcxEditRepositoryItem* FRepositoryItem;
	TcxCustomGridTableItemStyles* FStyles;
	bool FVisible;
	int FVisibleIndex;
	bool FWasVisibleBeforeGrouping;
	int FWidth;
	TcxGridTableDataCellCustomDrawEvent FOnCustomDrawCell;
	TcxGridGetDisplayTextEvent FOnGetDisplayText;
	TcxGridGetFilterDisplayTextEvent FOnGetFilterDisplayText;
	TcxGridGetFilterValuesEvent FOnGetFilterValues;
	TcxGridGetPropertiesEvent FOnGetProperties;
	Classes::TNotifyEvent FSubClassEvents;
	int __fastcall GetActualMinWidth(void);
	AnsiString __fastcall GetCaption();
	TcxGridTableDataCellViewInfo* __fastcall GetCell(int Index);
	int __fastcall GetCellCount(void);
	TcxCustomGridTableController* __fastcall GetController(void);
	Cxcustomdata::TcxCustomDataController* __fastcall GetDataController(void);
	bool __fastcall GetEditing(void);
	Cxedit::TcxCustomEditProperties* __fastcall GetEditingProperties(void);
	AnsiString __fastcall GetFilterCaption();
	bool __fastcall GetFiltered(void);
	bool __fastcall GetFocused(void);
	int __fastcall GetGroupIndex(void);
	Classes::TAlignment __fastcall GetHeaderAlignmentHorz(void);
	Cxclasses::TcxAlignmentVert __fastcall GetHeaderAlignmentVert(void);
	bool __fastcall GetIsLoading(void);
	bool __fastcall GetIncSearching(void);
	bool __fastcall GetIsDestroying(void);
	bool __fastcall GetIsFirst(void);
	bool __fastcall GetIsLast(void);
	bool __fastcall GetIsUpdating(void);
	int __fastcall GetMinWidth(void);
	AnsiString __fastcall GetPropertiesClassName();
	int __fastcall GetSortIndex(void);
	Cxcustomdata::TcxDataSortOrder __fastcall GetSortOrder(void);
	TcxCustomGridTableViewData* __fastcall GetViewData(void);
	int __fastcall GetWidth(void);
	void __fastcall SetCaption(const AnsiString Value);
	void __fastcall SetDataBinding(TcxGridItemDataBinding* Value);
	void __fastcall SetEditing(bool Value);
	void __fastcall SetFiltered(bool Value);
	void __fastcall SetFocused(bool Value);
	void __fastcall SetGroupIndex(int Value);
	void __fastcall SetHeaderAlignmentHorz(Classes::TAlignment Value);
	void __fastcall SetHeaderAlignmentVert(Cxclasses::TcxAlignmentVert Value);
	void __fastcall SetIndex(int Value);
	void __fastcall SetMinWidth(int Value);
	void __fastcall SetOnGetProperties(TcxGridGetPropertiesEvent Value);
	void __fastcall SetOptions(TcxCustomGridTableItemOptions* Value);
	void __fastcall SetProperties(Cxedit::TcxCustomEditProperties* Value);
	void __fastcall SetPropertiesClass(TMetaClass* Value);
	void __fastcall SetPropertiesClassName(const AnsiString Value);
	void __fastcall SetRepositoryItem(Cxedit::TcxEditRepositoryItem* Value);
	void __fastcall SetSortIndex(int Value);
	void __fastcall SetSortOrder(Cxcustomdata::TcxDataSortOrder Value);
	void __fastcall SetStyles(TcxCustomGridTableItemStyles* Value);
	void __fastcall SetVisible(bool Value);
	void __fastcall SetVisibleIndex(int Value);
	void __fastcall SetWidth(int Value);
	void __fastcall ReadIsCaptionAssigned(Classes::TReader* Reader);
	void __fastcall WriteIsCaptionAssigned(Classes::TWriter* Writer);
	bool __fastcall IsCaptionStored(void);
	bool __fastcall IsWidthStored(void);
	TMetaClass* __fastcall GetDataBindingClass(void);
	void __fastcall CreateProperties(void);
	void __fastcall DestroyProperties(void);
	void __fastcall RecreateProperties(void);
	
protected:
	virtual void __fastcall DefineProperties(Classes::TFiler* Filer);
	DYNAMIC void __fastcall SetParentComponent(Classes::TComponent* AParent);
	void __fastcall ItemRemoved(Cxedit::TcxEditRepositoryItem* Sender);
	virtual void __fastcall PropertiesChanged(Cxedit::TcxEditRepositoryItem* Sender)/* overload */;
	virtual AnsiString __fastcall GetObjectName();
	virtual bool __fastcall GetStoredProperties(Classes::TStrings* AProperties);
	virtual void __fastcall GetPropertyValue(const AnsiString AName, Variant &AValue);
	virtual void __fastcall SetPropertyValue(const AnsiString AName, const Variant &AValue);
	virtual void __fastcall CreateDataBinding(void);
	virtual void __fastcall DestroyDataBinding(void);
	virtual void __fastcall CreateSubClasses(void);
	virtual void __fastcall DestroySubClasses(void);
	bool __fastcall IsHeaderAlignmentHorzStored(void);
	bool __fastcall IsHeaderAlignmentVertStored(void);
	virtual bool __fastcall CanAutoHeight(void);
	virtual bool __fastcall CanEdit(void);
	virtual bool __fastcall CanFilter(bool ACheckGridViewOptions);
	virtual bool __fastcall CanFocus(void);
	virtual bool __fastcall CanGroup(void);
	virtual bool __fastcall CanHide(void);
	virtual bool __fastcall CanHorzSize(void);
	virtual bool __fastcall CanIncSearch(void);
	virtual bool __fastcall CanInitEditing(void);
	virtual bool __fastcall CanMove(void);
	virtual bool __fastcall CanScroll(void);
	virtual bool __fastcall CanSort(void);
	virtual void __fastcall CaptionChanged(void);
	virtual void __fastcall Changed(TcxGridTableItemChange AChange);
	void __fastcall CheckWidthValue(int &Value);
	virtual void __fastcall DataChanged(void);
	virtual void __fastcall ForceWidth(int Value);
	virtual bool __fastcall GetActuallyVisible(void);
	virtual int __fastcall GetBestFitWidth(void);
	virtual bool __fastcall GetEditPartVisible(void);
	virtual Variant __fastcall GetEditValue();
	virtual bool __fastcall GetFilterable(void);
	virtual void __fastcall GetFilterDisplayText(const Variant &AValue, AnsiString &ADisplayText);
	virtual bool __fastcall GetFixed(void);
	virtual TcxGridTableDataCellViewInfo* __fastcall GetFocusedCellViewInfo(void);
	Cxedit::TcxCustomEditProperties* __fastcall GetPropertiesValue(void);
	virtual bool __fastcall GetVisible(void);
	int __fastcall GetVisibleIndex(void);
	bool __fastcall HasCustomDrawCell(void);
	virtual void __fastcall InitProperties(Cxedit::TcxCustomEditProperties* AProperties);
	virtual bool __fastcall IsVisibleStored(void);
	virtual void __fastcall PropertiesChanged(void)/* overload */;
	virtual void __fastcall PropertiesChanged(System::TObject* Sender)/* overload */;
	void __fastcall PropertiesValueChanged(void);
	void __fastcall RecalculateDefaultWidth(void);
	virtual void __fastcall SetEditValue(const Variant &Value);
	virtual void __fastcall SetGridView(TcxCustomGridTableView* Value);
	virtual bool __fastcall ShowButtons(bool AFocused);
	virtual bool __fastcall ShowOnUngrouping(void);
	bool __fastcall UseOwnProperties(void);
	virtual void __fastcall ValueTypeClassChanged(void);
	virtual TMetaClass* __fastcall GetOptionsClass(void);
	virtual TMetaClass* __fastcall GetStylesClass(void);
	virtual AnsiString __fastcall DefaultCaption();
	Classes::TAlignment __fastcall DefaultHeaderAlignmentHorz(void);
	Cxclasses::TcxAlignmentVert __fastcall DefaultHeaderAlignmentVert(void);
	Cxedit::TcxEditRepositoryItem* __fastcall DefaultRepositoryItem(void);
	virtual int __fastcall DefaultWidth(void);
	Cxedit::TcxCustomEditStyle* __fastcall GetCellStyle(void);
	virtual void __fastcall InitStyle(Cxedit::TcxCustomEditStyle* AStyle, const Cxgraphics::TcxViewParams &AParams, bool AFocused);
	void __fastcall ReleaseCellStyle(void);
	void __fastcall AddCell(TcxGridTableDataCellViewInfo* ACell);
	void __fastcall RemoveCell(TcxGridTableDataCellViewInfo* ACell);
	__property int CellCount = {read=GetCellCount, nodefault};
	__property TcxGridTableDataCellViewInfo* Cells[int Index] = {read=GetCell};
	Cxedit::TcxCustomEditViewData* __fastcall CreateEditViewData(Cxedit::TcxCustomEditProperties* AProperties);
	void __fastcall DestroyEditViewData(Cxedit::TcxCustomEditViewData* &AEditViewData);
	void __fastcall DoCreateEditViewData(void);
	void __fastcall DoDestroyEditViewData(void);
	Cxedit::TcxCustomEditViewData* __fastcall GetEditViewData(Cxedit::TcxCustomEditProperties* AProperties, /* out */ bool &AIsLocalCopy);
	void __fastcall ReleaseEditViewData(Cxedit::TcxCustomEditViewData* &AEditViewData, bool AIsLocalCopy);
	__property Cxedit::TcxCustomEditViewData* EditViewData = {read=FEditViewData};
	virtual void __fastcall DoCustomDrawCell(Cxgraphics::TcxCanvas* ACanvas, TcxGridTableDataCellViewInfo* AViewInfo, bool &ADone);
	virtual void __fastcall DoGetDisplayText(TcxCustomGridRecord* ARecord, AnsiString &AText);
	virtual void __fastcall DoGetFilterValues(Cxcustomdata::TcxDataFilterValueList* AValueList);
	virtual Cxedit::TcxCustomEditProperties* __fastcall DoGetProperties(TcxCustomGridRecord* ARecord);
	__property bool IsDestroying = {read=GetIsDestroying, nodefault};
	__property bool IsLoading = {read=GetIsLoading, nodefault};
	__property bool IsUpdating = {read=GetIsUpdating, nodefault};
	__property int ActualMinWidth = {read=GetActualMinWidth, nodefault};
	__property TcxCustomGridTableController* Controller = {read=GetController};
	__property Cxcustomdata::TcxCustomDataController* DataController = {read=GetDataController};
	__property Cxedit::TcxCustomEditProperties* EditingProperties = {read=GetEditingProperties};
	__property bool EditPartVisible = {read=GetEditPartVisible, nodefault};
	__property bool Filterable = {read=GetFilterable, nodefault};
	__property AnsiString FilterCaption = {read=GetFilterCaption};
	__property bool Filtered = {read=GetFiltered, write=SetFiltered, nodefault};
	__property bool Fixed = {read=GetFixed, nodefault};
	__property int GroupIndex = {read=GetGroupIndex, write=SetGroupIndex, default=-1};
	__property Classes::TAlignment HeaderAlignmentHorz = {read=GetHeaderAlignmentHorz, write=SetHeaderAlignmentHorz, stored=IsHeaderAlignmentHorzStored, nodefault};
	__property Cxclasses::TcxAlignmentVert HeaderAlignmentVert = {read=GetHeaderAlignmentVert, write=SetHeaderAlignmentVert, stored=IsHeaderAlignmentVertStored, nodefault};
	__property bool IgnoreLoadingStatus = {read=FIgnoreLoadingStatus, write=FIgnoreLoadingStatus, nodefault};
	__property bool InternalVisible = {read=FVisible, nodefault};
	__property int MinWidth = {read=GetMinWidth, write=SetMinWidth, default=20};
	__property TcxCustomGridTableViewData* ViewData = {read=GetViewData};
	__property bool WasVisibleBeforeGrouping = {read=FWasVisibleBeforeGrouping, nodefault};
	__property int Width = {read=GetWidth, write=SetWidth, stored=IsWidthStored, nodefault};
	__property TcxGridGetFilterDisplayTextEvent OnGetFilterDisplayText = {read=FOnGetFilterDisplayText, write=FOnGetFilterDisplayText};
	__property TcxGridGetFilterValuesEvent OnGetFilterValues = {read=FOnGetFilterValues, write=FOnGetFilterValues};
	
public:
	__fastcall virtual TcxCustomGridTableItem(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxCustomGridTableItem(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	DYNAMIC Classes::TComponent* __fastcall GetParentComponent(void);
	DYNAMIC bool __fastcall HasParent(void);
	virtual void __fastcall ApplyBestFit(void);
	virtual int __fastcall CalculateDefaultCellHeight(Cxgraphics::TcxCanvas* ACanvas, Graphics::TFont* AFont);
	virtual Cxedit::TcxCustomEditStyle* __fastcall CreateEditStyle(void);
	Cxedit::_di_IcxEditDefaultValuesProvider __fastcall GetDefaultValuesProvider(Cxedit::TcxCustomEditProperties* AProperties = (Cxedit::TcxCustomEditProperties*)(0x0));
	Cxedit::TcxCustomEditProperties* __fastcall GetProperties(void)/* overload */;
	Cxedit::TcxCustomEditProperties* __fastcall GetProperties(TcxCustomGridRecord* ARecord)/* overload */;
	Cxedit::TcxEditRepositoryItem* __fastcall GetRepositoryItem(void);
	virtual void __fastcall RestoreDefaults(void);
	__property bool ActuallyVisible = {read=GetActuallyVisible, nodefault};
	__property TcxGridItemDataBinding* DataBinding = {read=FDataBinding, write=SetDataBinding};
	__property bool Editing = {read=GetEditing, write=SetEditing, nodefault};
	__property Variant EditValue = {read=GetEditValue, write=SetEditValue};
	__property bool Focused = {read=GetFocused, write=SetFocused, nodefault};
	__property TcxGridTableDataCellViewInfo* FocusedCellViewInfo = {read=GetFocusedCellViewInfo};
	__property TcxCustomGridTableView* GridView = {read=FGridView};
	__property bool Hideable = {read=CanHide, nodefault};
	__property int ID = {read=FID, nodefault};
	__property bool IncSearching = {read=GetIncSearching, nodefault};
	__property int Index = {read=FIndex, write=SetIndex, nodefault};
	__property bool IsFirst = {read=GetIsFirst, nodefault};
	__property bool IsLast = {read=GetIsLast, nodefault};
	__property TcxCustomGridTableItemOptions* Options = {read=FOptions, write=SetOptions};
	__property TMetaClass* PropertiesClass = {read=FPropertiesClass, write=SetPropertiesClass};
	__property int SortIndex = {read=GetSortIndex, write=SetSortIndex, nodefault};
	__property Cxcustomdata::TcxDataSortOrder SortOrder = {read=GetSortOrder, write=SetSortOrder, default=0};
	__property TcxCustomGridTableItemStyles* Styles = {read=FStyles, write=SetStyles};
	__property int VisibleIndex = {read=FVisibleIndex, write=SetVisibleIndex, nodefault};
	
__published:
	__property AnsiString Caption = {read=GetCaption, write=SetCaption, stored=IsCaptionStored};
	__property AnsiString PropertiesClassName = {read=GetPropertiesClassName, write=SetPropertiesClassName};
	__property Cxedit::TcxCustomEditProperties* Properties = {read=FProperties, write=SetProperties};
	__property Cxedit::TcxEditRepositoryItem* RepositoryItem = {read=FRepositoryItem, write=SetRepositoryItem};
	__property bool Visible = {read=GetVisible, write=SetVisible, stored=IsVisibleStored, nodefault};
	__property Classes::TNotifyEvent PropertiesEvents = {read=FSubClassEvents, write=FSubClassEvents};
	__property Classes::TNotifyEvent StylesEvents = {read=FSubClassEvents, write=FSubClassEvents};
	__property TcxGridTableDataCellCustomDrawEvent OnCustomDrawCell = {read=FOnCustomDrawCell, write=FOnCustomDrawCell};
	__property TcxGridGetDisplayTextEvent OnGetDisplayText = {read=FOnGetDisplayText, write=FOnGetDisplayText};
	__property TcxGridGetPropertiesEvent OnGetProperties = {read=FOnGetProperties, write=SetOnGetProperties};
private:
	void *__IcxEditRepositoryItemListener;	/* Cxedit::IcxEditRepositoryItemListener */
	void *__IcxStoredObject;	/* Cxstorage::IcxStoredObject [GetProperties=GetStoredProperties] */
	
public:
	operator IcxStoredObject*(void) { return (IcxStoredObject*)&__IcxStoredObject; }
	operator IcxEditRepositoryItemListener*(void) { return (IcxEditRepositoryItemListener*)&__IcxEditRepositoryItemListener; }
	
};


class DELPHICLASS TcxCustomGridRecordViewInfo;
class PASCALIMPLEMENTATION TcxGridRecordChange : public Cxgridcustomview::TcxCustomGridViewChange 
{
	typedef Cxgridcustomview::TcxCustomGridViewChange inherited;
	
private:
	TcxCustomGridTableItem* FItem;
	TcxCustomGridRecord* FRecord;
	int FRecordIndex;
	TcxCustomGridTableView* __fastcall GetGridView(void);
	TcxCustomGridRecordViewInfo* __fastcall GetRecordViewInfo(void);
	
public:
	__fastcall virtual TcxGridRecordChange(Cxgridcustomview::TcxCustomGridView* AGridView, TcxCustomGridRecord* ARecord, int ARecordIndex, TcxCustomGridTableItem* AItem);
	virtual void __fastcall Execute(void);
	virtual bool __fastcall IsCompatibleWith(Cxgridcommon::TcxCustomGridChange* AChange);
	virtual bool __fastcall IsEqual(Cxgridcommon::TcxCustomGridChange* AChange);
	bool __fastcall IsItemVisible(void);
	__property TcxCustomGridRecord* GridRecord = {read=FRecord};
	__property TcxCustomGridTableView* GridView = {read=GetGridView};
	__property TcxCustomGridTableItem* Item = {read=FItem};
	__property int RecordIndex = {read=FRecordIndex, nodefault};
	__property TcxCustomGridRecordViewInfo* RecordViewInfo = {read=GetRecordViewInfo};
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridRecordChange(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridFocusedRecordChange;
class PASCALIMPLEMENTATION TcxGridFocusedRecordChange : public Cxgridcustomview::TcxCustomGridViewChange 
{
	typedef Cxgridcustomview::TcxCustomGridViewChange inherited;
	
private:
	int FFocusedRecordIndex;
	bool FNewItemRecordFocusingChanged;
	int FPrevFocusedRecordIndex;
	
public:
	__fastcall virtual TcxGridFocusedRecordChange(Cxgridcustomview::TcxCustomGridView* AGridView, int APrevFocusedRecordIndex, int AFocusedRecordIndex, bool ANewItemRecordFocusingChanged);
	virtual void __fastcall Execute(void);
	__property int FocusedRecordIndex = {read=FFocusedRecordIndex, nodefault};
	__property bool NewItemRecordFocusingChanged = {read=FNewItemRecordFocusingChanged, nodefault};
	__property int PrevFocusedRecordIndex = {read=FPrevFocusedRecordIndex, nodefault};
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridFocusedRecordChange(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxGridRecordHitTestClass;

class DELPHICLASS TcxGridRecordHitTest;
class PASCALIMPLEMENTATION TcxGridRecordHitTest : public Cxgridcustomview::TcxCustomGridViewHitTest 
{
	typedef Cxgridcustomview::TcxCustomGridViewHitTest inherited;
	
private:
	int FGridRecordIndex;
	bool FIsNewItemRecord;
	TcxCustomGridTableViewData* FViewData;
	TcxCustomGridRecord* __fastcall GetGridRecord(void);
	void __fastcall SetGridRecord(TcxCustomGridRecord* Value);
	
protected:
	/* virtual class method */ virtual int __fastcall GetHitTestCode(TMetaClass* vmt);
	
public:
	/* virtual class method */ virtual bool __fastcall CanClick(TMetaClass* vmt);
	__property TcxCustomGridRecord* GridRecord = {read=GetGridRecord, write=SetGridRecord};
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxGridRecordHitTest(void) : Cxgridcustomview::TcxCustomGridViewHitTest() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridRecordHitTest(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridRecordCellHitTest;
class PASCALIMPLEMENTATION TcxGridRecordCellHitTest : public TcxGridRecordHitTest 
{
	typedef TcxGridRecordHitTest inherited;
	
protected:
	/* virtual class method */ virtual int __fastcall GetHitTestCode(TMetaClass* vmt);
	
public:
	TcxCustomGridTableItem* Item;
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxGridRecordCellHitTest(void) : TcxGridRecordHitTest() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridRecordCellHitTest(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridExpandButtonHitTest;
class PASCALIMPLEMENTATION TcxGridExpandButtonHitTest : public TcxGridRecordHitTest 
{
	typedef TcxGridRecordHitTest inherited;
	
protected:
	/* virtual class method */ virtual int __fastcall GetHitTestCode(TMetaClass* vmt);
	
public:
	/* virtual class method */ virtual bool __fastcall CanClick(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxGridExpandButtonHitTest(void) : TcxGridRecordHitTest() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridExpandButtonHitTest(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridNavigatorHitTest;
class PASCALIMPLEMENTATION TcxGridNavigatorHitTest : public Cxgridcustomview::TcxCustomGridViewHitTest 
{
	typedef Cxgridcustomview::TcxCustomGridViewHitTest inherited;
	
protected:
	/* virtual class method */ virtual int __fastcall GetHitTestCode(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxGridNavigatorHitTest(void) : Cxgridcustomview::TcxCustomGridViewHitTest() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridNavigatorHitTest(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridDefaultValuesProvider;
class PASCALIMPLEMENTATION TcxGridDefaultValuesProvider : public Cxedit::TcxCustomEditDefaultValuesProvider 
{
	typedef Cxedit::TcxCustomEditDefaultValuesProvider inherited;
	
public:
	virtual bool __fastcall IsDisplayFormatDefined(bool AIsCurrencyValueAccepted);
public:
	#pragma option push -w-inl
	/* TcxCustomEditDefaultValuesProvider.Destroy */ inline __fastcall virtual ~TcxGridDefaultValuesProvider(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxInterfacedPersistent.Create */ inline __fastcall virtual TcxGridDefaultValuesProvider(Classes::TPersistent* AOwner) : Cxedit::TcxCustomEditDefaultValuesProvider(AOwner) { }
	#pragma option pop
	
};


__interface IcxGridDataController;
typedef System::DelphiInterface<IcxGridDataController> _di_IcxGridDataController;
__interface INTERFACE_UUID("{FEEE7E69-BD54-4B5D-BA0B-B6116B69C0CC}") IcxGridDataController  : public IInterface 
{
	
public:
	virtual void __fastcall CheckGridModeBufferCount(void) = 0 ;
	virtual bool __fastcall DoScroll(bool AForward) = 0 ;
	virtual bool __fastcall DoScrollPage(bool AForward) = 0 ;
	virtual TMetaClass* __fastcall GetItemDataBindingClass(void) = 0 ;
	virtual TMetaClass* __fastcall GetItemDefaultValuesProviderClass(void) = 0 ;
	virtual bool __fastcall GetNavigatorIsBof(void) = 0 ;
	virtual bool __fastcall GetNavigatorIsEof(void) = 0 ;
	virtual bool __fastcall GetFilterPropertyValue(const AnsiString AName, Variant &AValue) = 0 ;
	virtual int __fastcall GetScrollBarPos(void) = 0 ;
	virtual int __fastcall GetScrollBarRecordCount(void) = 0 ;
	virtual bool __fastcall SetFilterPropertyValue(const AnsiString AName, const Variant &AValue) = 0 ;
	virtual bool __fastcall SetScrollBarPos(int Value) = 0 ;
};

class DELPHICLASS TcxGridDataController;
class PASCALIMPLEMENTATION TcxGridDataController : public Cxdata::TcxDataController 
{
	typedef Cxdata::TcxDataController inherited;
	
private:
	TcxCustomGridTableView* __fastcall GetGridViewValue(void);
	
protected:
	void __fastcall GetFakeComponentLinks(Classes::TList* AList);
	Cxgridcustomview::TcxCustomGridView* __fastcall GetGridView(void);
	void __fastcall CheckGridModeBufferCount(void);
	bool __fastcall DoScroll(bool AForward);
	bool __fastcall DoScrollPage(bool AForward);
	bool __fastcall GetFilterPropertyValue(const AnsiString AName, Variant &AValue);
	TMetaClass* __fastcall GetItemDataBindingClass(void);
	TMetaClass* __fastcall GetItemDefaultValuesProviderClass(void);
	bool __fastcall GetNavigatorIsBof(void);
	bool __fastcall GetNavigatorIsEof(void);
	int __fastcall GetScrollBarPos(void);
	int __fastcall GetScrollBarRecordCount(void);
	bool __fastcall SetFilterPropertyValue(const AnsiString AName, const Variant &AValue);
	bool __fastcall SetScrollBarPos(int Value);
	virtual bool __fastcall CanSelectRow(int ARowIndex);
	virtual void __fastcall DoValueTypeClassChanged(int AItemIndex);
	virtual int __fastcall GetDefaultActiveRelationIndex(void);
	/* virtual class method */ virtual int __fastcall GetItemID(TMetaClass* vmt, System::TObject* AItem);
	virtual TMetaClass* __fastcall GetSummaryGroupItemLinkClass(void);
	virtual TMetaClass* __fastcall GetSummaryItemClass(void);
	
public:
	virtual System::TObject* __fastcall CreateDetailLinkObject(Cxcustomdata::TcxCustomDataRelation* ARelation, int ARecordIndex);
	virtual void __fastcall FocusControl(int AItemIndex, bool &Done);
	virtual Cxcustomdata::TcxCustomDataController* __fastcall GetDetailDataControllerByLinkObject(System::TObject* ALinkObject);
	virtual AnsiString __fastcall GetDisplayText(int ARecordIndex, int AItemIndex);
	virtual AnsiString __fastcall GetFilterItemFieldCaption(System::TObject* AItem);
	virtual System::TObject* __fastcall GetItem(int Index);
	virtual bool __fastcall GetItemSortByDisplayText(int AItemIndex);
	virtual Cxdatautils::TcxDataEditValueSource __fastcall GetItemValueSource(int AItemIndex);
	virtual void __fastcall UpdateData(void);
	Cxfilter::TcxFilterCriteriaItem* __fastcall AddItemToFilter(Cxfilter::TcxFilterCriteriaItemList* AParent, TcxCustomGridTableItem* AItem, Cxfilter::TcxFilterOperatorKind AOperatorKind, const Variant &AValue, AnsiString ADisplayText = "", bool AReplaceExistent = true);
	__property TcxCustomGridTableView* GridView = {read=GetGridViewValue};
	
__published:
	__property Filter ;
	__property Options  = {default=28};
	__property Summary ;
	__property OnCompare ;
	__property OnDataChanged ;
	__property OnGroupingChanged ;
	__property OnRecordChanged ;
	__property OnSortingChanged ;
public:
	#pragma option push -w-inl
	/* TcxDataController.Create */ inline __fastcall virtual TcxGridDataController(Classes::TComponent* AOwner) : Cxdata::TcxDataController(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxDataController.Destroy */ inline __fastcall virtual ~TcxGridDataController(void) { }
	#pragma option pop
	
private:
	void *__IcxCustomGridDataController;	/* Cxgridcustomview::IcxCustomGridDataController */
	void *__IcxGridDataController;	/* Cxgridcustomtableview::IcxGridDataController */
	
public:
	operator IcxGridDataController*(void) { return (IcxGridDataController*)&__IcxGridDataController; }
	operator IcxCustomGridDataController*(void) { return (IcxCustomGridDataController*)&__IcxCustomGridDataController; }
	
};


class DELPHICLASS TcxCustomGridTableDragAndDropObject;
class DELPHICLASS TcxCustomGridTableViewInfo;
class PASCALIMPLEMENTATION TcxCustomGridTableDragAndDropObject : public Cxgridcustomview::TcxCustomGridDragAndDropObject 
{
	typedef Cxgridcustomview::TcxCustomGridDragAndDropObject inherited;
	
private:
	HIDESBASE TcxCustomGridTableController* __fastcall GetController(void);
	HIDESBASE TcxCustomGridTableView* __fastcall GetGridView(void);
	HIDESBASE TcxCustomGridTableViewInfo* __fastcall GetViewInfo(void);
	
protected:
	__property TcxCustomGridTableController* Controller = {read=GetController};
	__property TcxCustomGridTableView* GridView = {read=GetGridView};
	__property TcxCustomGridTableViewInfo* ViewInfo = {read=GetViewInfo};
public:
	#pragma option push -w-inl
	/* TcxDragAndDropObject.Create */ inline __fastcall virtual TcxCustomGridTableDragAndDropObject(Cxcontrols::TcxControl* AControl) : Cxgridcustomview::TcxCustomGridDragAndDropObject(AControl) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxCustomGridTableDragAndDropObject(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxGridEditingControllerClass;

class DELPHICLASS TcxGridEditingController;
class PASCALIMPLEMENTATION TcxGridEditingController : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	TcxCustomGridTableController* FController;
	Cxedit::TcxCustomEdit* FEdit;
	bool FEditHiding;
	TcxCustomGridTableItem* FEditingItem;
	bool FEditingItemSetting;
	Cxedit::TcxInplaceEditList* FEditList;
	bool FEditPreparing;
	Extctrls::TTimer* FEditShowingTimer;
	TcxCustomGridTableItem* FEditShowingTimerItem;
	bool FEditUpdateNeeded;
	bool FInitiatingEditing;
	bool FIsEditPlaced;
	bool FIsErrorOnEditExit;
	Classes::TNotifyEvent FPrevEditOnChange;
	Classes::TNotifyEvent FPrevEditOnEditValueChanged;
	Cxedit::TcxCustomEditProperties* __fastcall GetEditingProperties(void);
	TcxCustomGridTableView* __fastcall GetGridView(void);
	bool __fastcall GetIsEditing(void);
	void __fastcall SetEditingItem(TcxCustomGridTableItem* Value);
	void __fastcall EditShowingTimerHandler(System::TObject* Sender);
	
protected:
	virtual void __fastcall AfterViewInfoCalculate(void);
	virtual void __fastcall BeforeViewInfoCalculate(void);
	void __fastcall CancelEditUpdatePost(void);
	virtual bool __fastcall CanRemoveEditFocus(void);
	void __fastcall CheckEditUpdatePost(void);
	void __fastcall DoUpdateEdit(void);
	virtual bool __fastcall GetHideEditOnExit(void);
	virtual bool __fastcall GetHideEditOnFocusedRecordChange(void);
	virtual void __fastcall InitEdit(void);
	void __fastcall PostEditUpdate(void);
	virtual bool __fastcall PrepareEdit(TcxCustomGridTableItem* AItem, bool AOnMouseEvent);
	void __fastcall UpdateEditValue(void);
	void __fastcall UpdateValue(void);
	virtual void __fastcall EditAfterKeyDown(System::TObject* Sender, Word &Key, Classes::TShiftState Shift);
	virtual void __fastcall EditChanged(System::TObject* Sender);
	virtual void __fastcall EditEditing(System::TObject* Sender, bool &CanEdit);
	virtual void __fastcall EditExit(System::TObject* Sender);
	virtual void __fastcall EditFocusChanged(System::TObject* Sender);
	virtual void __fastcall EditKeyDown(System::TObject* Sender, Word &Key, Classes::TShiftState Shift);
	virtual void __fastcall EditPostEditValue(System::TObject* Sender);
	virtual void __fastcall EditValueChanged(System::TObject* Sender);
	__property bool EditHiding = {read=FEditHiding, nodefault};
	__property Cxedit::TcxCustomEditProperties* EditingProperties = {read=GetEditingProperties};
	__property Cxedit::TcxInplaceEditList* EditList = {read=FEditList};
	__property bool EditUpdateNeeded = {read=FEditUpdateNeeded, nodefault};
	__property bool HideEditOnExit = {read=GetHideEditOnExit, nodefault};
	__property bool HideEditOnFocusedRecordChange = {read=GetHideEditOnFocusedRecordChange, nodefault};
	__property bool InitiatingEditing = {read=FInitiatingEditing, nodefault};
	__property bool IsEditPlaced = {read=FIsEditPlaced, nodefault};
	__property bool IsErrorOnEditExit = {read=FIsErrorOnEditExit, nodefault};
	
public:
	__fastcall virtual TcxGridEditingController(TcxCustomGridTableController* AController);
	__fastcall virtual ~TcxGridEditingController(void);
	virtual void __fastcall HideEdit(bool Accept);
	virtual void __fastcall RemoveEdit(Cxedit::TcxCustomEditProperties* AProperties);
	void __fastcall ShowEdit(TcxCustomGridTableItem* AItem = (TcxCustomGridTableItem*)(0x0))/* overload */;
	void __fastcall ShowEdit(TcxCustomGridTableItem* AItem, char Key)/* overload */;
	void __fastcall ShowEdit(TcxCustomGridTableItem* AItem, Classes::TShiftState Shift, int X, int Y)/* overload */;
	void __fastcall UpdateEdit(void);
	void __fastcall StartEditShowingTimer(TcxCustomGridTableItem* AItem);
	void __fastcall StopEditShowingTimer(void);
	__property TcxCustomGridTableController* Controller = {read=FController};
	__property Cxedit::TcxCustomEdit* Edit = {read=FEdit};
	__property TcxCustomGridTableItem* EditingItem = {read=FEditingItem, write=SetEditingItem};
	__property TcxCustomGridTableView* GridView = {read=GetGridView};
	__property bool IsEditing = {read=GetIsEditing, nodefault};
};


class DELPHICLASS TcxGridDragOpenInfoExpand;
class PASCALIMPLEMENTATION TcxGridDragOpenInfoExpand : public Cxgridcommon::TcxCustomGridDragOpenInfo 
{
	typedef Cxgridcommon::TcxCustomGridDragOpenInfo inherited;
	
public:
	TcxCustomGridRecord* GridRecord;
	__fastcall virtual TcxGridDragOpenInfoExpand(TcxCustomGridRecord* AGridRecord);
	virtual bool __fastcall Equals(Cxgridcommon::TcxCustomGridDragOpenInfo* AInfo);
	virtual void __fastcall Run(void);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridDragOpenInfoExpand(void) { }
	#pragma option pop
	
};


typedef bool __fastcall (*TcxCustomGridTableCanItemFocus)(TcxCustomGridTableView* AOwner, int AItemIndex, void * AData);

class PASCALIMPLEMENTATION TcxCustomGridTableController : public Cxgridcustomview::TcxCustomGridController 
{
	typedef Cxgridcustomview::TcxCustomGridController inherited;
	
private:
	bool FAllowCheckEdit;
	bool FBlockRecordKeyboardHandling;
	bool FCheckEditNeeded;
	bool FCheckingCoordinate;
	Cxclasses::TcxDirection FDragScrollDirection;
	Extctrls::TTimer* FDragScrollTimer;
	Extctrls::TTimer* FDragFocusingScrollTimer;
	TcxCustomGridRecord* FDragHighlightedRecord;
	bool FEatKeyPress;
	TcxGridEditingController* FEditingController;
	TcxCustomGridTableItem* FFocusedItem;
	bool FFocusOnRecordFocusing;
	TcxCustomGridTableItem* FForcingWidthItem;
	bool FGridModeBufferCountUpdateNeeded;
	Extctrls::TTimer* FGridModeBufferCountUpdateTimer;
	bool FIsDragFocusing;
	bool FIsDragFocusingScrollForward;
	bool FIsRecordUnselecting;
	int FTopRecordIndex;
	int FUnselectingRecordIndex;
	TcxCustomGridTableItem* __fastcall GetEditingItem(void);
	int __fastcall GetFocusedItemIndex(void);
	int __fastcall GetFocusedRecordIndex(void);
	TcxCustomGridTableView* __fastcall GetGridView(void);
	TcxCustomGridTableItem* __fastcall GetIncSearchingItem(void);
	AnsiString __fastcall GetIncSearchingText();
	bool __fastcall GetIsEditing(void);
	bool __fastcall GetIsIncSearching(void);
	TcxCustomGridTableController* __fastcall GetMasterController(void);
	bool __fastcall GetMultiSelect(void);
	TcxCustomGridRecord* __fastcall GetSelectedRecord(int Index);
	int __fastcall GetSelectedRecordCount(void);
	HIDESBASE TcxCustomGridTableViewData* __fastcall GetViewData(void);
	HIDESBASE TcxCustomGridTableViewInfo* __fastcall GetViewInfo(void);
	void __fastcall SetDragHighlightedRecord(TcxCustomGridRecord* Value);
	void __fastcall SetEditingItem(TcxCustomGridTableItem* Value);
	void __fastcall SetFocusedItem(TcxCustomGridTableItem* Value);
	void __fastcall SetFocusedItemIndex(int Value);
	void __fastcall SetFocusedRecordIndex(int Value);
	void __fastcall SetIncSearchingText(const AnsiString Value);
	void __fastcall SetInternalTopRecordIndex(int Value);
	void __fastcall SetTopRecordIndex(int Value);
	void __fastcall DragFocusingScrollTimerHandler(System::TObject* Sender);
	void __fastcall DragScrollTimerHandler(System::TObject* Sender);
	void __fastcall GridModeBufferCountUpdateTimerHandler(System::TObject* Sender);
	
protected:
	virtual void __fastcall AfterPaint(void);
	virtual void __fastcall BeforePaint(void);
	virtual void __fastcall DetailFocused(Cxgridcustomview::TcxCustomGridView* ADetail);
	virtual void __fastcall DoExit(void);
	virtual bool __fastcall MayFocus(void);
	virtual void __fastcall RemoveFocus(void);
	virtual void __fastcall SetFocus(void);
	virtual void __fastcall AfterOffset(void);
	virtual void __fastcall BeforeKillFocus(void);
	virtual void __fastcall BeforeOffset(void);
	virtual bool __fastcall CanAppend(void);
	void __fastcall CancelCheckEditPost(void);
	virtual bool __fastcall CanDelete(bool ACheckOptions);
	virtual bool __fastcall CanEdit(void);
	virtual bool __fastcall CanHScrollBarHide(void);
	virtual bool __fastcall CanInsert(bool ACheckOptions);
	virtual void __fastcall CheckEdit(void);
	virtual void __fastcall CheckTopRecordIndex(int &Value);
	bool __fastcall FindNextCustomItem(int AFocusedItemIndex, int AItemCount, bool AGoForward, bool AGoOnCycle, TcxCustomGridTableCanItemFocus ACanFocus, void * AData, int &AItemIndex, /* out */ bool &ACycleChanged);
	virtual void __fastcall FocusedItemChanged(TcxCustomGridTableItem* APrevFocusedItem);
	virtual bool __fastcall GetCancelEditingOnExit(void);
	virtual TcxCustomGridRecord* __fastcall GetFocusedRecord(void);
	virtual bool __fastcall GetIsRecordsScrollHorizontal(void) = 0 ;
	virtual int __fastcall GetMaxTopRecordIndexValue(void);
	virtual int __fastcall GetScrollBarOffsetBegin(void);
	virtual int __fastcall GetScrollBarOffsetEnd(void);
	virtual int __fastcall GetScrollBarPos(void);
	virtual int __fastcall GetScrollBarRecordCount(void);
	virtual int __fastcall GetVisibleRecordCount(int AFirstRecordIndex, bool ACalculateDown = true);
	void __fastcall PostCheckEdit(void);
	void __fastcall ProcessCheckEditPost(void);
	virtual void __fastcall SetFocusedRecord(TcxCustomGridRecord* Value);
	virtual void __fastcall SetScrollBarPos(int Value);
	void __fastcall CancelGridModeBufferCountUpdate(void);
	void __fastcall CheckGridModeBufferCountUpdatePost(void);
	void __fastcall PostGridModeBufferCountUpdate(void);
	__property bool GridModeBufferCountUpdateNeeded = {read=FGridModeBufferCountUpdateNeeded, nodefault};
	virtual bool __fastcall CanProcessMultiSelect(bool AIsKeyboard)/* overload */;
	virtual bool __fastcall CanProcessMultiSelect(Cxgridcustomview::TcxCustomGridHitTest* AHitTest)/* overload */;
	virtual bool __fastcall CanProcessMultiSelect(Word AKey, Classes::TShiftState AShift, bool AFocusedRecordChanged)/* overload */;
	void __fastcall ChangeRecordSelection(TcxCustomGridRecord* ARecord, bool Value);
	void __fastcall CheckFocusedRecordSelectionWhenExit(TcxCustomGridRecord* ARecord);
	void __fastcall DoNormalSelection(void);
	void __fastcall DoNormalSelectionWithAnchor(bool ASelect = true);
	void __fastcall DoRangeSelection(bool AClearSelection = true);
	void __fastcall DoToggleRecordSelection(void);
	virtual void __fastcall FinishSelection(void);
	virtual void __fastcall InvalidateFocusedRecord(void);
	virtual void __fastcall InvalidateSelection(void);
	virtual bool __fastcall IsKeyForMultiSelect(Word AKey, Classes::TShiftState AShift, bool AFocusedRecordChanged);
	bool __fastcall IsRecordSelected(TcxCustomGridRecord* ARecord);
	virtual void __fastcall MultiSelectKeyDown(Word &Key, Classes::TShiftState Shift);
	virtual void __fastcall MultiSelectMouseDown(Cxgridcustomview::TcxCustomGridHitTest* AHitTest, Classes::TShiftState AShift);
	virtual void __fastcall MultiSelectMouseUp(Cxgridcustomview::TcxCustomGridHitTest* AHitTest, Classes::TShiftState AShift);
	void __fastcall SetSelectionAnchor(int AGridRecordIndex);
	bool __fastcall FocusedRecordHasCells(bool ACheckCellSelect);
	virtual void __fastcall FocusNextPage(bool ASyncSelection);
	virtual void __fastcall FocusPrevPage(bool ASyncSelection);
	virtual bool __fastcall IsKeyForController(Word AKey, Classes::TShiftState AShift);
	virtual void __fastcall ScrollPage(bool AForward);
	virtual void __fastcall ScrollRecords(bool AForward, int ACount);
	virtual void __fastcall ShowNextPage(void);
	virtual void __fastcall ShowPrevPage(void);
	virtual bool __fastcall GetDragFocusingScrollDirection(int X, int Y, /* out */ bool &AMoveForward);
	void __fastcall StartDragFocusing(void);
	void __fastcall StopDragFocusing(void);
	void __fastcall StartDragFocusingScroll(bool AMoveForward);
	void __fastcall StopDragFocusingScroll(void);
	virtual Cxclasses::TcxDirection __fastcall GetDragScrollDirection(int X, int Y);
	void __fastcall ProcessDragFocusing(int X, int Y);
	void __fastcall StartDragScroll(Cxclasses::TcxDirection ADirection);
	void __fastcall StopDragScroll(void);
	bool __fastcall IsDragScroll(void);
	virtual Cxgridcommon::TcxCustomGridDragOpenInfo* __fastcall GetDragOpenInfo(Cxgridcustomview::TcxCustomGridHitTest* AHitTest);
	bool __fastcall IsDragOpenHitTest(Cxgridcustomview::TcxCustomGridHitTest* AHitTest, /* out */ Cxgridcommon::TcxCustomGridDragOpenInfo* &ADragOpenInfo);
	__property TcxCustomGridRecord* DragHighlightedRecord = {read=FDragHighlightedRecord, write=SetDragHighlightedRecord};
	virtual TcxCustomGridTableItem* __fastcall GetItemForIncSearching(void);
	virtual void __fastcall IncSearchKeyDown(Word &Key, Classes::TShiftState Shift);
	__property TcxCustomGridTableItem* ItemForIncSearching = {read=GetItemForIncSearching};
	virtual TMetaClass* __fastcall GetEditingControllerClass(void);
	__property bool AllowCheckEdit = {read=FAllowCheckEdit, write=FAllowCheckEdit, nodefault};
	__property bool BlockRecordKeyboardHandling = {read=FBlockRecordKeyboardHandling, write=FBlockRecordKeyboardHandling, nodefault};
	__property bool CancelEditingOnExit = {read=GetCancelEditingOnExit, nodefault};
	__property bool EatKeyPress = {read=FEatKeyPress, write=FEatKeyPress, nodefault};
	__property bool FocusOnRecordFocusing = {read=FFocusOnRecordFocusing, write=FFocusOnRecordFocusing, nodefault};
	__property TcxCustomGridTableItem* ForcingWidthItem = {read=FForcingWidthItem, write=FForcingWidthItem};
	__property int InternalTopRecordIndex = {read=FTopRecordIndex, write=SetInternalTopRecordIndex, nodefault};
	__property bool IsRecordsScrollHorizontal = {read=GetIsRecordsScrollHorizontal, nodefault};
	__property bool MultiSelect = {read=GetMultiSelect, nodefault};
	__property int ScrollBarOffsetBegin = {read=GetScrollBarOffsetBegin, nodefault};
	__property int ScrollBarOffsetEnd = {read=GetScrollBarOffsetEnd, nodefault};
	__property int ScrollBarRecordCount = {read=GetScrollBarRecordCount, nodefault};
	__property int ScrollBarPos = {read=GetScrollBarPos, write=SetScrollBarPos, nodefault};
	__property TcxCustomGridTableViewData* ViewData = {read=GetViewData};
	__property TcxCustomGridTableViewInfo* ViewInfo = {read=GetViewInfo};
	
public:
	__fastcall virtual TcxCustomGridTableController(Cxgridcustomview::TcxCustomGridView* AGridView);
	__fastcall virtual ~TcxCustomGridTableController(void);
	virtual void __fastcall BeginDragAndDrop(void);
	virtual void __fastcall ControlFocusChanged(void);
	virtual void __fastcall DoCancelMode(void);
	virtual void __fastcall DoKeyDown(Word &Key, Classes::TShiftState Shift);
	virtual void __fastcall EndDragAndDrop(bool Accepted);
	virtual int __fastcall FindNextItem(int AFocusedItemIndex, bool AGoForward, bool AGoOnCycle, /* out */ bool &ACycleChanged);
	int __fastcall FindNextRecord(int AFocusedRecordIndex, bool AGoForward, bool AGoOnCycle, /* out */ bool &ACycleChanged);
	virtual bool __fastcall HasFocusedControls(void);
	virtual bool __fastcall IsDataFullyVisible(bool AIsCallFromMaster = false);
	virtual void __fastcall KeyDown(Word &Key, Classes::TShiftState Shift);
	virtual void __fastcall KeyPress(char &Key);
	virtual void __fastcall MouseDown(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall MouseMove(Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall MouseUp(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall WndProc(Messages::TMessage &Message);
	virtual void __fastcall BeforeStartDrag(void);
	virtual bool __fastcall CanDrag(int X, int Y);
	virtual void __fastcall DragDrop(System::TObject* Source, int X, int Y);
	virtual void __fastcall DragOver(System::TObject* Source, int X, int Y, Controls::TDragState State, bool &Accept);
	virtual void __fastcall EndDrag(System::TObject* Target, int X, int Y);
	virtual void __fastcall StartDrag(Controls::TDragObject* &DragObject);
	void __fastcall CancelIncSearching(void);
	virtual void __fastcall CheckCoordinates(void);
	void __fastcall ClearSelection(void);
	virtual void __fastcall CreateNewRecord(bool AtEnd);
	virtual void __fastcall DeleteSelection(void);
	bool __fastcall FocusFirstAvailableItem(void);
	bool __fastcall FocusNextCell(bool AGoForward, bool AProcessCellsOnly = true);
	bool __fastcall FocusNextItem(int AFocusedItemIndex, bool AGoForward, bool AGoOnCycle, bool AGoToNextRecordOnCycle);
	bool __fastcall FocusNextRecord(int AFocusedRecordIndex, bool AGoForward, bool AGoOnCycle, bool AGoIntoDetail);
	bool __fastcall FocusNextRecordWithSelection(int AFocusedRecordIndex, bool AGoForward, bool AGoOnCycle, bool AGoIntoDetail, bool ASyncSelection = true);
	bool __fastcall FocusRecord(int AFocusedRecordIndex, bool ASyncSelection);
	void __fastcall MakeFocusedItemVisible(void);
	void __fastcall MakeFocusedRecordVisible(void);
	virtual void __fastcall MakeItemVisible(TcxCustomGridTableItem* AItem) = 0 ;
	virtual void __fastcall MakeRecordVisible(TcxCustomGridRecord* ARecord);
	bool __fastcall GoToFirst(void);
	bool __fastcall GoToLast(bool AGoIntoDetail);
	bool __fastcall GoToNext(bool AGoIntoDetail, bool ASyncSelection = true);
	bool __fastcall GoToPrev(bool AGoIntoDetail, bool ASyncSelection = true);
	bool __fastcall IsFinish(void);
	bool __fastcall IsStart(void);
	__property TcxGridEditingController* EditingController = {read=FEditingController};
	__property TcxCustomGridTableItem* EditingItem = {read=GetEditingItem, write=SetEditingItem};
	__property TcxCustomGridTableItem* FocusedItem = {read=FFocusedItem, write=SetFocusedItem};
	__property int FocusedItemIndex = {read=GetFocusedItemIndex, write=SetFocusedItemIndex, nodefault};
	__property TcxCustomGridRecord* FocusedRecord = {read=GetFocusedRecord, write=SetFocusedRecord};
	__property int FocusedRecordIndex = {read=GetFocusedRecordIndex, write=SetFocusedRecordIndex, nodefault};
	__property TcxCustomGridTableView* GridView = {read=GetGridView};
	__property TcxCustomGridTableItem* IncSearchingItem = {read=GetIncSearchingItem};
	__property AnsiString IncSearchingText = {read=GetIncSearchingText, write=SetIncSearchingText};
	__property bool IsDragFocusing = {read=FIsDragFocusing, nodefault};
	__property bool IsEditing = {read=GetIsEditing, nodefault};
	__property bool IsIncSearching = {read=GetIsIncSearching, nodefault};
	__property TcxCustomGridTableController* MasterController = {read=GetMasterController};
	__property int SelectedRecordCount = {read=GetSelectedRecordCount, nodefault};
	__property TcxCustomGridRecord* SelectedRecords[int Index] = {read=GetSelectedRecord};
	__property int TopRecordIndex = {read=FTopRecordIndex, write=SetTopRecordIndex, nodefault};
};


typedef TMetaClass*TcxGridTableDataCellPainterClass;

class DELPHICLASS TcxGridTableDataCellPainter;
class PASCALIMPLEMENTATION TcxGridTableDataCellPainter : public Cxgridcustomview::TcxCustomGridCellPainter 
{
	typedef Cxgridcustomview::TcxCustomGridCellPainter inherited;
	
private:
	TcxGridTableDataCellViewInfo* __fastcall GetViewInfo(void);
	
protected:
	virtual void __fastcall DrawContent(void);
	virtual void __fastcall DrawFocusRect(void);
	virtual void __fastcall Paint(void);
	__property TcxGridTableDataCellViewInfo* ViewInfo = {read=GetViewInfo};
public:
	#pragma option push -w-inl
	/* TcxCustomGridCellPainter.Create */ inline __fastcall virtual TcxGridTableDataCellPainter(Cxgraphics::TcxCanvas* ACanvas, Cxgridcustomview::TcxCustomGridCellViewInfo* AViewInfo) : Cxgridcustomview::TcxCustomGridCellPainter(ACanvas, AViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridTableDataCellPainter(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxCustomGridRecordPainterClass;

class DELPHICLASS TcxCustomGridRecordPainter;
class PASCALIMPLEMENTATION TcxCustomGridRecordPainter : public Cxgridcustomview::TcxCustomGridCellPainter 
{
	typedef Cxgridcustomview::TcxCustomGridCellPainter inherited;
	
private:
	TcxCustomGridRecordViewInfo* __fastcall GetViewInfo(void);
	
protected:
	virtual void __fastcall AfterPaint(void);
	virtual void __fastcall BeforePaint(void);
	virtual void __fastcall DrawBackground(void);
	virtual void __fastcall DrawExpandButton(void);
	virtual void __fastcall DrawFocusRect(void);
	virtual void __fastcall Paint(void);
	__property TcxCustomGridRecordViewInfo* ViewInfo = {read=GetViewInfo};
public:
	#pragma option push -w-inl
	/* TcxCustomGridCellPainter.Create */ inline __fastcall virtual TcxCustomGridRecordPainter(Cxgraphics::TcxCanvas* ACanvas, Cxgridcustomview::TcxCustomGridCellViewInfo* AViewInfo) : Cxgridcustomview::TcxCustomGridCellPainter(ACanvas, AViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxCustomGridRecordPainter(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxCustomGridRecordsPainterClass;

class DELPHICLASS TcxCustomGridRecordsPainter;
class DELPHICLASS TcxCustomGridRecordsViewInfo;
class PASCALIMPLEMENTATION TcxCustomGridRecordsViewInfo : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	TcxCustomGridRecordViewInfo* operator[](int Index) { return Items[Index]; }
	
private:
	Graphics::TBitmap* FBackgroundBitmap;
	#pragma pack(push, 1)
	Types::TRect FBounds;
	#pragma pack(pop)
	
	TcxCustomGridTableViewInfo* FGridViewInfo;
	TcxGridTableDataCellViewInfo* FIncSearchingCellViewInfo;
	bool FIsIncSearchingCellViewInfoCalculated;
	Classes::TList* FItems;
	int FItemsOffset;
	Cxgraphics::TcxCanvas* __fastcall GetCanvas(void);
	TcxCustomGridTableController* __fastcall GetController(void);
	int __fastcall GetCount(void);
	int __fastcall GetFirstRecordIndex(void);
	TcxCustomGridTableView* __fastcall GetGridView(void);
	TcxGridTableDataCellViewInfo* __fastcall GetIncSearchingCellViewInfo(void);
	TcxCustomGridRecordViewInfo* __fastcall GetItem(int Index);
	int __fastcall GetMaxCount(void);
	int __fastcall GetTopRecordIndex(void);
	TcxCustomGridTableViewData* __fastcall GetViewData(void);
	void __fastcall CreateItems(void);
	void __fastcall DestroyItems(void);
	TcxCustomGridRecordViewInfo* __fastcall CreateRecordViewInfo(int AIndex);
	
protected:
	int FVisibleCount;
	virtual void __fastcall AfterCalculate(void);
	virtual void __fastcall BeforeCalculate(void);
	virtual void __fastcall BeforeItemRecalculation(void);
	virtual void __fastcall BeforeOffset(void);
	virtual void __fastcall Calculate(void);
	virtual Types::TRect __fastcall CalculateBounds();
	virtual TcxGridTableDataCellViewInfo* __fastcall CalculateIncSearchingCellViewInfo(void);
	virtual void __fastcall CalculateVisibleCount(void);
	void __fastcall CreateEditViewDatas(void);
	void __fastcall DestroyEditViewDatas(void);
	virtual bool __fastcall GetAutoDataRecordHeight(void);
	virtual bool __fastcall GetAutoRecordHeight(void);
	virtual Graphics::TBitmap* __fastcall GetBackgroundBitmap(void);
	virtual int __fastcall GetItemLeftBound(int AIndex) = 0 ;
	virtual int __fastcall GetItemsOffset(int AItemCountDelta) = 0 ;
	virtual int __fastcall GetItemTopBound(int AIndex) = 0 ;
	int __fastcall GetRecordIndex(int AViewInfoIndex);
	int __fastcall GetViewInfoIndex(int ARecordIndex);
	virtual void __fastcall OffsetItem(int AIndex, int AOffset) = 0 ;
	virtual void __fastcall ControlFocusChanged(void);
	virtual void __fastcall VisibilityChanged(bool AVisible);
	virtual TMetaClass* __fastcall GetPainterClass(void);
	__property Cxgraphics::TcxCanvas* Canvas = {read=GetCanvas};
	__property TcxCustomGridTableController* Controller = {read=GetController};
	__property int FirstRecordIndex = {read=GetFirstRecordIndex, nodefault};
	__property TcxCustomGridTableViewInfo* GridViewInfo = {read=FGridViewInfo};
	__property TcxGridTableDataCellViewInfo* IncSearchingCellViewInfo = {read=GetIncSearchingCellViewInfo};
	__property int MaxCount = {read=GetMaxCount, nodefault};
	__property int TopRecordIndex = {read=GetTopRecordIndex, nodefault};
	__property TcxCustomGridTableViewData* ViewData = {read=GetViewData};
	
public:
	__fastcall virtual TcxCustomGridRecordsViewInfo(TcxCustomGridTableViewInfo* AGridViewInfo);
	__fastcall virtual ~TcxCustomGridRecordsViewInfo(void);
	virtual bool __fastcall CanOffset(int AItemCountDelta);
	virtual int __fastcall GetCellHeight(int ACellContentHeight);
	virtual Cxgridcustomview::TcxCustomGridHitTest* __fastcall GetHitTest(const Types::TPoint &P);
	virtual TcxCustomGridRecordViewInfo* __fastcall GetRealItem(TcxCustomGridRecord* ARecord, int ARecordIndex);
	virtual void __fastcall MainCalculate(void);
	virtual void __fastcall Offset(int AItemCountDelta)/* overload */;
	virtual void __fastcall Offset(int DX, int DY)/* overload */;
	void __fastcall Paint(void);
	__property bool AutoDataRecordHeight = {read=GetAutoDataRecordHeight, nodefault};
	__property bool AutoRecordHeight = {read=GetAutoRecordHeight, nodefault};
	__property Graphics::TBitmap* BackgroundBitmap = {read=FBackgroundBitmap, write=FBackgroundBitmap};
	__property Types::TRect Bounds = {read=FBounds};
	__property int Count = {read=GetCount, nodefault};
	__property TcxCustomGridTableView* GridView = {read=GetGridView};
	__property TcxCustomGridRecordViewInfo* Items[int Index] = {read=GetItem/*, default*/};
	__property int ItemsOffset = {read=FItemsOffset, nodefault};
	__property int VisibleCount = {read=FVisibleCount, nodefault};
};


class PASCALIMPLEMENTATION TcxCustomGridRecordsPainter : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	Cxgraphics::TcxCanvas* FCanvas;
	TcxCustomGridRecordsViewInfo* FViewInfo;
	
protected:
	virtual void __fastcall Paint(void);
	__property Cxgraphics::TcxCanvas* Canvas = {read=FCanvas};
	__property TcxCustomGridRecordsViewInfo* ViewInfo = {read=FViewInfo};
	
public:
	__fastcall virtual TcxCustomGridRecordsPainter(Cxgraphics::TcxCanvas* ACanvas, TcxCustomGridRecordsViewInfo* AViewInfo);
	void __fastcall MainPaint(void);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxCustomGridRecordsPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxNavigatorSitePainter;
class PASCALIMPLEMENTATION TcxNavigatorSitePainter : public Cxgridcustomview::TcxCustomGridCellPainter 
{
	typedef Cxgridcustomview::TcxCustomGridCellPainter inherited;
	
protected:
	virtual bool __fastcall ExcludeFromClipRect(void);
public:
	#pragma option push -w-inl
	/* TcxCustomGridCellPainter.Create */ inline __fastcall virtual TcxNavigatorSitePainter(Cxgraphics::TcxCanvas* ACanvas, Cxgridcustomview::TcxCustomGridCellViewInfo* AViewInfo) : Cxgridcustomview::TcxCustomGridCellPainter(ACanvas, AViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxNavigatorSitePainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomGridTablePainter;
class PASCALIMPLEMENTATION TcxCustomGridTablePainter : public Cxgridcustomview::TcxCustomGridPainter 
{
	typedef Cxgridcustomview::TcxCustomGridPainter inherited;
	
private:
	HIDESBASE TcxCustomGridTableController* __fastcall GetController(void);
	HIDESBASE TcxCustomGridTableViewInfo* __fastcall GetViewInfo(void);
	
protected:
	virtual bool __fastcall CanOffset(int AItemsOffset, int DX, int DY);
	virtual void __fastcall DrawNavigator(void);
	virtual void __fastcall DrawRecords(void);
	virtual void __fastcall Offset(int AItemsOffset)/* overload */;
	virtual void __fastcall Offset(int DX, int DY)/* overload */;
	virtual void __fastcall PaintBefore(void);
	virtual void __fastcall PaintContent(void);
	
public:
	void __fastcall DoOffset(int AItemsOffset, int DX, int DY);
	__property TcxCustomGridTableController* Controller = {read=GetController};
	__property TcxCustomGridTableViewInfo* ViewInfo = {read=GetViewInfo};
public:
	#pragma option push -w-inl
	/* TcxGridViewHandler.Create */ inline __fastcall virtual TcxCustomGridTablePainter(Cxgridcustomview::TcxCustomGridView* AGridView) : Cxgridcustomview::TcxCustomGridPainter(AGridView) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxCustomGridTablePainter(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxCustomGridRecordClass;

class PASCALIMPLEMENTATION TcxCustomGridRecord : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	bool FEatKeyPress;
	int FIndex;
	Cxcustomdata::TcxRowInfo FRecordInfo;
	TcxCustomGridTableViewData* FViewData;
	TcxCustomGridRecordViewInfo* FViewInfo;
	TcxCustomGridTableController* __fastcall GetController(void);
	Cxcustomdata::TcxCustomDataController* __fastcall GetDataController(void);
	bool __fastcall GetDragHighlighted(void);
	bool __fastcall GetFocused(void);
	TcxCustomGridTableView* __fastcall GetGridView(void);
	bool __fastcall GetIsEditing(void);
	bool __fastcall GetIsNewItemRecord(void);
	bool __fastcall GetIsValid(void);
	int __fastcall GetLevel(void);
	bool __fastcall GetPartVisible(void);
	int __fastcall GetRecordIndex(void);
	void __fastcall SetExpanded(bool Value);
	void __fastcall SetFocused(bool Value);
	
protected:
	void __fastcall RefreshRecordInfo(void);
	virtual void __fastcall DoCollapse(bool ARecurse) = 0 ;
	virtual void __fastcall DoExpand(bool ARecurse) = 0 ;
	virtual bool __fastcall GetDestroyingOnExpanding(void);
	virtual bool __fastcall GetExpandable(void);
	virtual bool __fastcall GetExpanded(void);
	virtual bool __fastcall GetDrawFocused(void);
	virtual bool __fastcall GetDrawSelected(void);
	virtual bool __fastcall GetHasCells(void);
	virtual bool __fastcall GetIsData(void);
	virtual bool __fastcall GetIsFirst(void);
	virtual bool __fastcall GetIsLast(void);
	virtual bool __fastcall GetIsParent(void);
	bool __fastcall GetIsParentRecordLast(int AIndex);
	virtual TcxCustomGridRecord* __fastcall GetParentRecord(void);
	virtual bool __fastcall GetSelected(void);
	virtual bool __fastcall GetVisible(void);
	virtual void __fastcall SetSelected(bool Value);
	virtual AnsiString __fastcall GetDisplayText(int Index);
	virtual int __fastcall GetValueCount(void);
	virtual Variant __fastcall GetValue(int Index);
	virtual TMetaClass* __fastcall GetViewInfoClass(void) = 0 ;
	__property bool EatKeyPress = {read=FEatKeyPress, write=FEatKeyPress, nodefault};
	__property bool IsParent = {read=GetIsParent, nodefault};
	__property Cxcustomdata::TcxRowInfo RecordInfo = {read=FRecordInfo};
	__property TcxCustomGridTableController* Controller = {read=GetController};
	__property Cxcustomdata::TcxCustomDataController* DataController = {read=GetDataController};
	__property bool DestroyingOnExpanding = {read=GetDestroyingOnExpanding, nodefault};
	
public:
	__fastcall virtual TcxCustomGridRecord(TcxCustomGridTableViewData* AViewData, int AIndex, const Cxcustomdata::TcxRowInfo &ARecordInfo);
	__fastcall virtual ~TcxCustomGridRecord(void);
	virtual bool __fastcall CanFocus(void);
	void __fastcall Collapse(bool ARecurse);
	void __fastcall DoKeyPress(char &Key);
	void __fastcall Expand(bool ARecurse);
	virtual TcxCustomGridRecord* __fastcall GetFirstFocusableChild(void);
	virtual TcxCustomGridRecord* __fastcall GetLastFocusableChild(bool ARecursive);
	virtual void __fastcall Invalidate(TcxCustomGridTableItem* AItem = (TcxCustomGridTableItem*)(0x0));
	DYNAMIC void __fastcall KeyDown(Word &Key, Classes::TShiftState Shift);
	DYNAMIC void __fastcall KeyPress(char &Key);
	void __fastcall MakeVisible(void);
	__property bool DragHighlighted = {read=GetDragHighlighted, nodefault};
	__property bool DrawFocused = {read=GetDrawFocused, nodefault};
	__property bool DrawSelected = {read=GetDrawSelected, nodefault};
	__property AnsiString DisplayTexts[int Index] = {read=GetDisplayText};
	__property bool Expandable = {read=GetExpandable, nodefault};
	__property bool Expanded = {read=GetExpanded, write=SetExpanded, nodefault};
	__property bool Focused = {read=GetFocused, write=SetFocused, nodefault};
	__property TcxCustomGridTableView* GridView = {read=GetGridView};
	__property bool HasCells = {read=GetHasCells, nodefault};
	__property int Index = {read=FIndex, nodefault};
	__property bool IsData = {read=GetIsData, nodefault};
	__property bool IsEditing = {read=GetIsEditing, nodefault};
	__property bool IsFirst = {read=GetIsFirst, nodefault};
	__property bool IsLast = {read=GetIsLast, nodefault};
	__property bool IsNewItemRecord = {read=GetIsNewItemRecord, nodefault};
	__property bool IsParentRecordLast[int AIndex] = {read=GetIsParentRecordLast};
	__property bool IsValid = {read=GetIsValid, nodefault};
	__property int Level = {read=GetLevel, nodefault};
	__property TcxCustomGridRecord* ParentRecord = {read=GetParentRecord};
	__property bool PartVisible = {read=GetPartVisible, nodefault};
	__property int RecordIndex = {read=GetRecordIndex, nodefault};
	__property bool Selected = {read=GetSelected, write=SetSelected, nodefault};
	__property int ValueCount = {read=GetValueCount, nodefault};
	__property Variant Values[int Index] = {read=GetValue};
	__property TcxCustomGridTableViewData* ViewData = {read=FViewData};
	__property TcxCustomGridRecordViewInfo* ViewInfo = {read=FViewInfo};
	__property bool Visible = {read=GetVisible, nodefault};
};


class PASCALIMPLEMENTATION TcxCustomGridTableViewData : public Cxgridcustomview::TcxCustomGridViewData 
{
	typedef Cxgridcustomview::TcxCustomGridViewData inherited;
	
private:
	TcxCustomGridRecord* FEditingRecord;
	TcxCustomGridRecord* FNewItemRecord;
	Classes::TList* FRecords;
	HIDESBASE TcxCustomGridTableController* __fastcall GetController(void);
	TcxCustomGridRecord* __fastcall GetEditingRecord(void);
	TcxCustomGridTableView* __fastcall GetGridView(void);
	TcxCustomGridRecord* __fastcall GetInternalRecord(int Index);
	TcxCustomGridRecord* __fastcall GetRecord(int Index);
	int __fastcall GetRecordCount(void);
	HIDESBASE TcxCustomGridTableViewInfo* __fastcall GetViewInfo(void);
	TcxCustomGridRecord* __fastcall CreateRecord(int AIndex);
	
protected:
	virtual TMetaClass* __fastcall GetRecordClass(const Cxcustomdata::TcxRowInfo &ARecordInfo) = 0 ;
	void __fastcall AssignEditingRecord(void);
	void __fastcall CreateNewItemRecord(void);
	void __fastcall DestroyNewItemRecord(void);
	virtual TMetaClass* __fastcall GetNewItemRecordClass(void) = 0 ;
	void __fastcall RecreateNewItemRecord(void);
	__property TcxCustomGridTableController* Controller = {read=GetController};
	__property TcxCustomGridRecord* InternalRecords[int Index] = {read=GetInternalRecord};
	__property TcxCustomGridTableViewInfo* ViewInfo = {read=GetViewInfo};
	
public:
	__fastcall virtual TcxCustomGridTableViewData(Cxgridcustomview::TcxCustomGridView* AGridView);
	__fastcall virtual ~TcxCustomGridTableViewData(void);
	void __fastcall Collapse(bool ARecurse);
	void __fastcall DestroyRecords(void);
	void __fastcall Expand(bool ARecurse);
	TcxCustomGridRecord* __fastcall GetRecordByIndex(int AIndex);
	TcxCustomGridRecord* __fastcall GetRecordByRecordIndex(int ARecordIndex);
	int __fastcall GetRecordIndexByRecord(TcxCustomGridRecord* ARecord);
	bool __fastcall IsRecordIndexValid(int AIndex);
	virtual void __fastcall Refresh(int ARecordCount);
	void __fastcall RefreshRecords(void);
	void __fastcall CheckNewItemRecord(void);
	virtual bool __fastcall HasNewItemRecord(void);
	__property TcxCustomGridRecord* EditingRecord = {read=FEditingRecord};
	__property TcxCustomGridTableView* GridView = {read=GetGridView};
	__property TcxCustomGridRecord* NewItemRecord = {read=FNewItemRecord};
	__property int RecordCount = {read=GetRecordCount, nodefault};
	__property TcxCustomGridRecord* Records[int Index] = {read=GetRecord};
};


class DELPHICLASS TcxGridTableCellViewInfo;
class DELPHICLASS TcxCustomGridTableViewInfoCacheItem;
class PASCALIMPLEMENTATION TcxGridTableCellViewInfo : public Cxgridcustomview::TcxCustomGridViewCellViewInfo 
{
	typedef Cxgridcustomview::TcxCustomGridViewCellViewInfo inherited;
	
private:
	TcxCustomGridRecordViewInfo* FRecordViewInfo;
	bool FSelected;
	bool FSelectedCalculated;
	TcxCustomGridTableViewInfoCacheItem* __fastcall GetCacheItem(void);
	HIDESBASE TcxCustomGridTableController* __fastcall GetController(void);
	HIDESBASE TcxCustomGridTableView* __fastcall GetGridView(void);
	TcxCustomGridRecord* __fastcall GetGridRecord(void);
	bool __fastcall GetSelected(void);
	
protected:
	virtual bool __fastcall CalculateSelected(void);
	virtual bool __fastcall GetAlwaysSelected(void);
	virtual Cxgraphics::TcxCanvas* __fastcall GetCanvas(void);
	TcxCustomGridTableViewInfo* __fastcall GetGridViewInfo(void);
	virtual TMetaClass* __fastcall GetHitTestClass(void);
	virtual bool __fastcall GetTransparent(void);
	virtual void __fastcall InitHitTest(Cxgridcustomview::TcxCustomGridHitTest* AHitTest);
	__property bool AlwaysSelected = {read=GetAlwaysSelected, nodefault};
	__property TcxCustomGridTableViewInfoCacheItem* CacheItem = {read=GetCacheItem};
	__property TcxCustomGridTableController* Controller = {read=GetController};
	__property TcxCustomGridTableView* GridView = {read=GetGridView};
	__property TcxCustomGridTableViewInfo* GridViewInfo = {read=GetGridViewInfo};
	
public:
	__fastcall virtual TcxGridTableCellViewInfo(TcxCustomGridRecordViewInfo* ARecordViewInfo);
	virtual void __fastcall Calculate(int ALeftBound, int ATopBound, int AWidth = 0xffffffff, int AHeight = 0xffffffff)/* overload */;
	virtual bool __fastcall CanDrawSelected(void);
	virtual bool __fastcall MouseDown(Cxgridcustomview::TcxCustomGridHitTest* AHitTest, Controls::TMouseButton AButton, Classes::TShiftState AShift);
	__property TcxCustomGridRecord* GridRecord = {read=GetGridRecord};
	__property TcxCustomGridRecordViewInfo* RecordViewInfo = {read=FRecordViewInfo};
	__property bool Selected = {read=GetSelected, nodefault};
public:
	#pragma option push -w-inl
	/* TcxCustomGridViewCellViewInfo.Destroy */ inline __fastcall virtual ~TcxGridTableCellViewInfo(void) { }
	#pragma option pop
	
	
/* Hoisted overloads: */
	
public:
	inline void __fastcall  Calculate(const Types::TRect &ABounds){ TcxCustomGridCellViewInfo::Calculate(ABounds); }
	
};


class PASCALIMPLEMENTATION TcxGridTableDataCellViewInfo : public TcxGridTableCellViewInfo 
{
	typedef TcxGridTableCellViewInfo inherited;
	
private:
	Cxedit::TcxCustomEditViewData* FEditViewData;
	Cxedit::TcxCustomEditViewInfo* FEditViewInfo;
	bool FIsLocalCopyOfEditViewData;
	TcxCustomGridTableItem* FItem;
	Cxedit::TcxCustomEditProperties* FProperties;
	Cxedit::TcxCustomEditStyle* FStyle;
	bool FWasFocusedBeforeClick;
	bool __fastcall GetEditing(void);
	bool __fastcall GetFocused(void);
	Types::TPoint __fastcall GetMousePos();
	Cxedit::TcxCustomEditProperties* __fastcall GetProperties(void);
	bool __fastcall GetShowButtons(void);
	
protected:
	virtual void __fastcall AfterCustomDraw(Cxgraphics::TcxCanvas* ACanvas);
	virtual void __fastcall BeforeCustomDraw(Cxgraphics::TcxCanvas* ACanvas);
	virtual void __fastcall CalculateEditViewInfo(Cxedit::TcxCustomEditViewInfo* AEditViewInfo, const Types::TPoint &AMousePos);
	virtual int __fastcall CalculateHeight(void);
	virtual bool __fastcall CalculateSelected(void);
	virtual bool __fastcall CanShowHint(void);
	void __fastcall CheckEditHotTrack(const Types::TPoint &AMousePos);
	virtual bool __fastcall CustomDraw(Cxgraphics::TcxCanvas* ACanvas);
	virtual void __fastcall DoCalculateParams(void);
	void __fastcall EditHotTrackChanged(void);
	virtual bool __fastcall GetActivateEditOnMouseDown(void);
	virtual bool __fastcall GetAutoHeight(void);
	virtual Types::TRect __fastcall GetBoundsForHint();
	virtual Variant __fastcall GetDisplayValue();
	virtual Types::TRect __fastcall GetEditBounds();
	virtual Types::TRect __fastcall GetEditViewDataBounds();
	virtual void __fastcall GetEditViewDataContentOffsets(Types::TRect &R);
	virtual TMetaClass* __fastcall GetHitTestClass(void);
	virtual bool __fastcall GetHotTrack(void);
	virtual int __fastcall GetMaxLineCount(void);
	virtual TMetaClass* __fastcall GetPainterClass(void);
	virtual bool __fastcall GetShowEndEllipsis(void);
	virtual AnsiString __fastcall GetText();
	virtual Variant __fastcall GetValue();
	virtual void __fastcall GetViewParams(Cxgraphics::TcxViewParams &AParams);
	virtual bool __fastcall HasCustomDraw(void);
	virtual void __fastcall InitHitTest(Cxgridcustomview::TcxCustomGridHitTest* AHitTest);
	virtual void __fastcall InitTextSelection(void);
	virtual bool __fastcall InvalidateOnStateChange(void);
	virtual bool __fastcall IsTextSelected(void);
	virtual void __fastcall MouseLeave(void);
	virtual bool __fastcall NeedShowHint(const Types::TPoint &AMousePos, /* out */ AnsiString &AHintText, /* out */ bool &AIsHintMultiLine, /* out */ Types::TRect &ATextRect);
	virtual void __fastcall Offset(int DX, int DY);
	virtual void __fastcall RestoreParams(const Cxgraphics::TcxViewParams &AParams);
	virtual void __fastcall SaveParams(/* out */ Cxgraphics::TcxViewParams &AParams);
	virtual void __fastcall StateChanged(void);
	virtual void __fastcall InitStyle(void);
	Cxedit::TcxCustomEditViewInfo* __fastcall CreateEditViewInfo(void);
	void __fastcall CreateEditViewData(void);
	void __fastcall DestroyEditViewData(void);
	__property Cxedit::TcxCustomEditViewData* EditViewData = {read=FEditViewData};
	void __fastcall UpdateEdit(void);
	__property bool ActivateEditOnMouseDown = {read=GetActivateEditOnMouseDown, nodefault};
	__property bool AutoHeight = {read=GetAutoHeight, nodefault};
	__property Types::TRect EditBounds = {read=GetEditBounds};
	__property Types::TRect EditViewDataBounds = {read=GetEditViewDataBounds};
	__property int MaxLineCount = {read=GetMaxLineCount, nodefault};
	__property Types::TPoint MousePos = {read=GetMousePos};
	__property bool ShowButtons = {read=GetShowButtons, nodefault};
	__property bool WasFocusedBeforeClick = {read=FWasFocusedBeforeClick, nodefault};
	
public:
	__fastcall virtual TcxGridTableDataCellViewInfo(TcxCustomGridRecordViewInfo* ARecordViewInfo, TcxCustomGridTableItem* AItem);
	__fastcall virtual ~TcxGridTableDataCellViewInfo(void);
	virtual void __fastcall BeforeRecalculation(void);
	virtual void __fastcall Calculate(int ALeftBound, int ATopBound, int AWidth = 0xffffffff, int AHeight = 0xffffffff)/* overload */;
	virtual bool __fastcall CanDrawSelected(void);
	HIDESBASE virtual void __fastcall Invalidate(bool ARecalculate);
	virtual bool __fastcall MouseDown(Cxgridcustomview::TcxCustomGridHitTest* AHitTest, Controls::TMouseButton AButton, Classes::TShiftState AShift);
	virtual bool __fastcall MouseMove(Cxgridcustomview::TcxCustomGridHitTest* AHitTest, Classes::TShiftState AShift);
	virtual bool __fastcall MouseUp(Cxgridcustomview::TcxCustomGridHitTest* AHitTest, Controls::TMouseButton AButton, Classes::TShiftState AShift);
	__property Variant DisplayValue = {read=GetDisplayValue};
	__property bool Editing = {read=GetEditing, nodefault};
	__property Cxedit::TcxCustomEditViewInfo* EditViewInfo = {read=FEditViewInfo};
	__property bool Focused = {read=GetFocused, nodefault};
	__property TcxCustomGridTableItem* Item = {read=FItem};
	__property Cxedit::TcxCustomEditProperties* Properties = {read=GetProperties};
	__property Cxedit::TcxCustomEditStyle* Style = {read=FStyle};
	__property Variant Value = {read=GetValue};
	
/* Hoisted overloads: */
	
public:
	inline void __fastcall  Calculate(const Types::TRect &ABounds){ TcxCustomGridCellViewInfo::Calculate(ABounds); }
	
};


class PASCALIMPLEMENTATION TcxCustomGridRecordViewInfo : public Cxgridcustomview::TcxCustomGridViewCellViewInfo 
{
	typedef Cxgridcustomview::TcxCustomGridViewCellViewInfo inherited;
	
private:
	#pragma pack(push, 1)
	Types::TRect FExpandButtonBounds;
	#pragma pack(pop)
	
	bool FExpanded;
	bool FExpandedCalculated;
	bool FIsRecordViewInfoAssigned;
	TcxCustomGridRecordsViewInfo* FRecordsViewInfo;
	bool FSelected;
	bool FSelectedCalculated;
	TcxCustomGridTableViewInfoCacheItem* __fastcall GetCacheItem(void);
	bool __fastcall GetExpanded(void);
	bool __fastcall GetFocused(void);
	HIDESBASE TcxCustomGridTableView* __fastcall GetGridView(void);
	TcxCustomGridTableViewInfo* __fastcall GetGridViewInfo(void);
	int __fastcall GetIndex(void);
	bool __fastcall GetSelected(void);
	
protected:
	TcxCustomGridRecord* FRecord;
	virtual void __fastcall CalculateExpandButtonBounds(Types::TRect &ABounds);
	virtual bool __fastcall CalculateSelected(void);
	virtual void __fastcall ControlFocusChanged(void);
	virtual bool __fastcall GetAutoHeight(void);
	virtual Graphics::TBitmap* __fastcall GetBackgroundBitmap(void);
	virtual Types::TRect __fastcall GetBackgroundBitmapBounds();
	virtual Cxgraphics::TcxCanvas* __fastcall GetCanvas(void);
	virtual bool __fastcall GetCellTransparent(TcxGridTableCellViewInfo* ACell);
	HIDESBASE virtual Types::TRect __fastcall GetContentBounds();
	virtual Types::TRect __fastcall GetExpandButtonAreaBounds(void) = 0 ;
	virtual Types::TRect __fastcall GetFocusRectBounds();
	virtual int __fastcall GetHeight(void);
	virtual bool __fastcall GetHideFocusRect(void);
	virtual TMetaClass* __fastcall GetHitTestClass(void);
	virtual bool __fastcall GetVisible(void);
	virtual bool __fastcall HasFocusRect(void);
	virtual void __fastcall InitHitTest(Cxgridcustomview::TcxCustomGridHitTest* AHitTest);
	virtual bool __fastcall IsClickHitTest(Cxgridcustomview::TcxCustomGridHitTest* AHitTest);
	virtual bool __fastcall IsDetailVisible(Cxgridcustomview::TcxCustomGridView* ADetail);
	virtual void __fastcall Offset(int DX, int DY);
	virtual void __fastcall VisibilityChanged(bool AVisible);
	__property bool AutoHeight = {read=GetAutoHeight, nodefault};
	__property Types::TRect BackgroundBitmapBounds = {read=GetBackgroundBitmapBounds};
	__property TcxCustomGridTableViewInfoCacheItem* CacheItem = {read=GetCacheItem};
	__property Types::TRect ExpandButtonAreaBounds = {read=GetExpandButtonAreaBounds};
	__property bool Expanded = {read=GetExpanded, nodefault};
	
public:
	__fastcall virtual TcxCustomGridRecordViewInfo(TcxCustomGridRecordsViewInfo* ARecordsViewInfo, TcxCustomGridRecord* ARecord);
	__fastcall virtual ~TcxCustomGridRecordViewInfo(void);
	virtual void __fastcall BeforeRecalculation(void);
	HIDESBASE virtual bool __fastcall Click(Cxgridcustomview::TcxCustomGridHitTest* AHitTest, Controls::TMouseButton AButton, Classes::TShiftState AShift);
	virtual Types::TRect __fastcall GetBoundsForInvalidate(TcxCustomGridTableItem* AItem);
	virtual Types::TRect __fastcall GetBoundsForItem(TcxCustomGridTableItem* AItem);
	virtual TcxGridTableDataCellViewInfo* __fastcall GetCellViewInfoByItem(TcxCustomGridTableItem* AItem);
	virtual Cxgridcustomview::TcxCustomGridHitTest* __fastcall GetHitTest(const Types::TPoint &P);
	virtual void __fastcall MainCalculate(int ALeftBound, int ATopBound);
	virtual bool __fastcall MouseDown(Cxgridcustomview::TcxCustomGridHitTest* AHitTest, Controls::TMouseButton AButton, Classes::TShiftState AShift);
	HIDESBASE void __fastcall Recalculate(void);
	__property Types::TRect ContentBounds = {read=GetContentBounds};
	__property Types::TRect ExpandButtonBounds = {read=FExpandButtonBounds};
	__property bool Focused = {read=GetFocused, nodefault};
	__property Types::TRect FocusRectBounds = {read=GetFocusRectBounds};
	__property TcxCustomGridTableView* GridView = {read=GetGridView};
	__property TcxCustomGridRecord* GridRecord = {read=FRecord};
	__property TcxCustomGridTableViewInfo* GridViewInfo = {read=GetGridViewInfo};
	__property int Index = {read=GetIndex, nodefault};
	__property bool HideFocusRect = {read=GetHideFocusRect, nodefault};
	__property TcxCustomGridRecordsViewInfo* RecordsViewInfo = {read=FRecordsViewInfo};
	__property bool Selected = {read=GetSelected, nodefault};
};


typedef TMetaClass*TcxCustomGridRecordsViewInfoClass;

typedef TMetaClass*TcxNavigatorSiteViewInfoClass;

class DELPHICLASS TcxNavigatorSiteViewInfo;
class PASCALIMPLEMENTATION TcxNavigatorSiteViewInfo : public Cxgridcustomview::TcxCustomGridViewCellViewInfo 
{
	typedef Cxgridcustomview::TcxCustomGridViewCellViewInfo inherited;
	
private:
	TcxCustomGridTableViewInfo* __fastcall GetGridViewInfo(void);
	Cxnavigator::TcxNavigatorViewInfo* __fastcall GetNavigatorViewInfo(void);
	
protected:
	virtual int __fastcall CalculateWidth(void);
	virtual TMetaClass* __fastcall GetHitTestClass(void);
	virtual bool __fastcall GetHotTrack(void);
	virtual TMetaClass* __fastcall GetPainterClass(void);
	virtual bool __fastcall GetVisible(void);
	virtual void __fastcall MouseLeave(void);
	virtual void __fastcall GetViewParams(Cxgraphics::TcxViewParams &AParams);
	virtual int __fastcall GetWidth(void);
	
public:
	virtual bool __fastcall MouseDown(Cxgridcustomview::TcxCustomGridHitTest* AHitTest, Controls::TMouseButton AButton, Classes::TShiftState AShift);
	virtual bool __fastcall MouseMove(Cxgridcustomview::TcxCustomGridHitTest* AHitTest, Classes::TShiftState AShift);
	virtual bool __fastcall MouseUp(Cxgridcustomview::TcxCustomGridHitTest* AHitTest, Controls::TMouseButton AButton, Classes::TShiftState AShift);
	__property TcxCustomGridTableViewInfo* GridViewInfo = {read=GetGridViewInfo};
	__property Cxnavigator::TcxNavigatorViewInfo* NavigatorViewInfo = {read=GetNavigatorViewInfo};
public:
	#pragma option push -w-inl
	/* TcxCustomGridViewCellViewInfo.Create */ inline __fastcall TcxNavigatorSiteViewInfo(Cxgridcustomview::TcxCustomGridViewInfo* AGridViewInfo) : Cxgridcustomview::TcxCustomGridViewCellViewInfo(AGridViewInfo) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomGridViewCellViewInfo.Destroy */ inline __fastcall virtual ~TcxNavigatorSiteViewInfo(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxCustomGridTableViewInfo : public Cxgridcustomview::TcxCustomGridViewInfo 
{
	typedef Cxgridcustomview::TcxCustomGridViewInfo inherited;
	
protected:
	bool FAllowCheckCoordinates;
	bool FCalculateDown;
	int FExpandButtonIndent;
	int FFirstRecordIndex;
	int FLevelIndent;
	#pragma pack(push, 1)
	Types::TPoint FNavigatorSize;
	#pragma pack(pop)
	
	TcxNavigatorSiteViewInfo* FNavigatorSiteViewInfo;
	Cxnavigator::TcxNavigatorViewInfo* FNavigatorViewInfo;
	TcxCustomGridRecordsViewInfo* FRecordsViewInfo;
	HIDESBASE TcxCustomGridTableController* __fastcall GetController(void);
	int __fastcall GetExpandButtonSize(void);
	int __fastcall GetFirstRecordIndex(void);
	TcxCustomGridTableView* __fastcall GetGridView(void);
	int __fastcall GetScrollableAreaWidth(void);
	HIDESBASE TcxCustomGridTableViewData* __fastcall GetViewData(void);
	int __fastcall GetVisibleRecordCount(void);
	virtual Types::TRect __fastcall GetNavigatorBounds();
	Cxnavigator::TcxCustomNavigatorButtons* __fastcall GetNavigatorButtons(void);
	Graphics::TCanvas* __fastcall GetNavigatorCanvas(void);
	Controls::TWinControl* __fastcall GetNavigatorControl(void);
	bool __fastcall GetNavigatorFocused(void);
	Cxlookandfeels::TcxLookAndFeel* __fastcall GetNavigatorLookAndFeel(void);
	Classes::TComponent* __fastcall GetNavigatorOwner(void);
	bool __fastcall GetNavigatorShowHint(void);
	bool __fastcall GetNavigatorTabStop(void);
	void __fastcall NavigatorButtonsStateChanged(void);
	void __fastcall RefreshNavigator(void);
	virtual void __fastcall CreateViewInfos(void);
	virtual void __fastcall DestroyViewInfos(bool AIsRecreating);
	virtual void __fastcall AfterCalculating(void);
	virtual void __fastcall BeforeCalculating(void);
	virtual void __fastcall BeforeOffset(void);
	virtual void __fastcall Calculate(void);
	virtual int __fastcall CalculateVisibleEqualHeightRecordCount(void);
	virtual void __fastcall ControlFocusChanged(void);
	virtual int __fastcall GetDefaultGridModeBufferCount(void);
	virtual void __fastcall GetHScrollBarBounds(Types::TRect &ABounds);
	virtual bool __fastcall GetIsInternalUse(void);
	virtual int __fastcall GetNavigatorOffset(void);
	virtual Types::TRect __fastcall GetNavigatorSiteBounds();
	virtual TMetaClass* __fastcall GetNavigatorSiteViewInfoClass(void);
	virtual TMetaClass* __fastcall GetNavigatorViewInfoClass(void);
	virtual TMetaClass* __fastcall GetRecordsViewInfoClass(void) = 0 ;
	virtual Types::TRect __fastcall GetScrollableAreaBounds();
	virtual Types::TRect __fastcall GetScrollableAreaBoundsForEdit();
	virtual Types::TRect __fastcall GetScrollableAreaBoundsHorz();
	virtual Types::TRect __fastcall GetScrollableAreaBoundsVert();
	bool __fastcall FirstRecordIndexAssigned(void);
	virtual void __fastcall Offset(int ARecordCountDelta)/* overload */;
	virtual void __fastcall Offset(int DX, int DY)/* overload */;
	virtual void __fastcall VisibilityChanged(bool AVisible);
	virtual void __fastcall CalculateExpandButtonParams(void);
	virtual bool __fastcall CanCheckCoordinates(void);
	__property bool AllowCheckCoordinates = {read=FAllowCheckCoordinates, write=FAllowCheckCoordinates, nodefault};
	__property TcxCustomGridTableController* Controller = {read=GetController};
	__property TcxCustomGridTableViewData* ViewData = {read=GetViewData};
	
public:
	__fastcall virtual TcxCustomGridTableViewInfo(Cxgridcustomview::TcxCustomGridView* AGridView);
	virtual bool __fastcall CanOffset(int ARecordCountDelta, int DX, int DY);
	virtual bool __fastcall CanOffsetView(int ARecordCountDelta);
	virtual Cxgridcustomview::TcxCustomGridHitTest* __fastcall GetHitTest(const Types::TPoint &P)/* overload */;
	virtual void __fastcall DoOffset(int ARecordCountDelta, int DX, int DY);
	virtual int __fastcall GetNearestPopupHeight(int AHeight, bool AAdditionalRecord = false);
	virtual int __fastcall GetPopupHeight(int ADropDownRecordCount);
	__property bool CalculateDown = {read=FCalculateDown, write=FCalculateDown, nodefault};
	__property int ExpandButtonIndent = {read=FExpandButtonIndent, write=FExpandButtonIndent, nodefault};
	__property int ExpandButtonSize = {read=GetExpandButtonSize, nodefault};
	__property int FirstRecordIndex = {read=GetFirstRecordIndex, write=FFirstRecordIndex, nodefault};
	__property TcxCustomGridTableView* GridView = {read=GetGridView};
	__property int LevelIndent = {read=FLevelIndent, write=FLevelIndent, nodefault};
	__property Types::TRect NavigatorBounds = {read=GetNavigatorBounds};
	__property int NavigatorOffset = {read=GetNavigatorOffset, nodefault};
	__property Types::TPoint NavigatorSize = {read=FNavigatorSize};
	__property TcxNavigatorSiteViewInfo* NavigatorSiteViewInfo = {read=FNavigatorSiteViewInfo};
	__property Cxnavigator::TcxNavigatorViewInfo* NavigatorViewInfo = {read=FNavigatorViewInfo};
	__property TcxCustomGridRecordsViewInfo* RecordsViewInfo = {read=FRecordsViewInfo};
	__property Types::TRect ScrollableAreaBounds = {read=GetScrollableAreaBounds};
	__property Types::TRect ScrollableAreaBoundsForEdit = {read=GetScrollableAreaBoundsForEdit};
	__property Types::TRect ScrollableAreaBoundsHorz = {read=GetScrollableAreaBoundsHorz};
	__property Types::TRect ScrollableAreaBoundsVert = {read=GetScrollableAreaBoundsVert};
	__property int ScrollableAreaWidth = {read=GetScrollableAreaWidth, nodefault};
	__property int VisibleRecordCount = {read=GetVisibleRecordCount, nodefault};
public:
	#pragma option push -w-inl
	/* TcxCustomGridViewInfo.Destroy */ inline __fastcall virtual ~TcxCustomGridTableViewInfo(void) { }
	#pragma option pop
	
	
/* Hoisted overloads: */
	
public:
	inline Cxgridcustomview::TcxCustomGridHitTest* __fastcall  GetHitTest(int X, int Y){ return TcxCustomGridViewInfo::GetHitTest(X, Y); }
	
private:
	void *__IcxNavigatorOwner;	/* Cxnavigator::IcxNavigatorOwner */
	
public:
	operator IcxNavigatorOwner*(void) { return (IcxNavigatorOwner*)&__IcxNavigatorOwner; }
	
};


class PASCALIMPLEMENTATION TcxCustomGridTableViewInfoCacheItem : public Cxgridcustomview::TcxCustomGridViewInfoCacheItem 
{
	typedef Cxgridcustomview::TcxCustomGridViewInfoCacheItem inherited;
	
private:
	int FHeight;
	bool FIsHeightAssigned;
	TcxCustomGridRecord* __fastcall GetGridRecord(void);
	void __fastcall SetHeight(int Value);
	
protected:
	__property TcxCustomGridRecord* GridRecord = {read=GetGridRecord};
	
public:
	virtual void __fastcall UnassignValues(bool AKeepMaster);
	__property int Height = {read=FHeight, write=SetHeight, nodefault};
	__property bool IsHeightAssigned = {read=FIsHeightAssigned, write=FIsHeightAssigned, nodefault};
public:
	#pragma option push -w-inl
	/* TcxCustomGridViewInfoCacheItem.Create */ inline __fastcall virtual TcxCustomGridTableViewInfoCacheItem(Cxgridcustomview::TcxCustomGridViewInfoCache* AOwner, int AIndex) : Cxgridcustomview::TcxCustomGridViewInfoCacheItem(AOwner, AIndex) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxCustomGridTableViewInfoCacheItem(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomGridTableViewInfoCache;
class PASCALIMPLEMENTATION TcxCustomGridTableViewInfoCache : public Cxgridcustomview::TcxCustomGridViewInfoCache 
{
	typedef Cxgridcustomview::TcxCustomGridViewInfoCache inherited;
	
private:
	HIDESBASE TcxCustomGridTableViewData* __fastcall GetViewData(void);
	
protected:
	virtual TMetaClass* __fastcall GetItemClass(void);
	__property TcxCustomGridTableViewData* ViewData = {read=GetViewData};
public:
	#pragma option push -w-inl
	/* TcxCustomGridViewInfoCache.Create */ inline __fastcall virtual TcxCustomGridTableViewInfoCache(Cxgridcustomview::TcxCustomGridView* AGridView) : Cxgridcustomview::TcxCustomGridViewInfoCache(AGridView) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomGridViewInfoCache.Destroy */ inline __fastcall virtual ~TcxCustomGridTableViewInfoCache(void) { }
	#pragma option pop
	
};


typedef void __fastcall (__closure *TcxGridGetRecordStyleEvent)(TcxCustomGridTableView* Sender, TcxCustomGridRecord* ARecord, Cxstyles::TcxStyle* &AStyle);

typedef Cxcustomdata::TcxDataSortOrder TcxGridSortOrder;

typedef TMetaClass*TcxCustomGridTableItemClass;

class DELPHICLASS TcxCustomGridTableBackgroundBitmaps;
class PASCALIMPLEMENTATION TcxCustomGridTableBackgroundBitmaps : public Cxgridcustomview::TcxCustomGridBackgroundBitmaps 
{
	typedef Cxgridcustomview::TcxCustomGridBackgroundBitmaps inherited;
	
protected:
	virtual int __fastcall GetBitmapStyleIndex(int Index);
	
public:
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	
__published:
	__property Graphics::TBitmap* Content = {read=GetValue, write=SetValue, index=1};
public:
	#pragma option push -w-inl
	/* TcxCustomGridBackgroundBitmaps.Create */ inline __fastcall virtual TcxCustomGridTableBackgroundBitmaps(Cxgridcustomview::TcxCustomGridView* AGridView) : Cxgridcustomview::TcxCustomGridBackgroundBitmaps(AGridView) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomGridBackgroundBitmaps.Destroy */ inline __fastcall virtual ~TcxCustomGridTableBackgroundBitmaps(void) { }
	#pragma option pop
	
};


#pragma option push -b-
enum TcxGridTableFilterVisible { fvNever, fvNonEmpty, fvAlways };
#pragma option pop

typedef TMetaClass*TcxCustomGridTableFilteringClass;

class DELPHICLASS TcxCustomGridTableFiltering;
class PASCALIMPLEMENTATION TcxCustomGridTableFiltering : public Cxgridcustomview::TcxCustomGridOptions 
{
	typedef Cxgridcustomview::TcxCustomGridOptions inherited;
	
private:
	bool FCustomizeDialog;
	int FDropDownWidth;
	int FMaxDropDownCount;
	TcxGridTableFilterVisible FVisible;
	TcxCustomGridTableView* __fastcall GetGridView(void);
	void __fastcall SetCustomizeDialog(bool Value);
	void __fastcall SetDropDownWidth(int Value);
	void __fastcall SetMaxDropDownCount(int Value);
	void __fastcall SetVisible(TcxGridTableFilterVisible Value);
	void __fastcall FilterControlDialogApply(System::TObject* Sender);
	
protected:
	__property bool CustomizeDialog = {read=FCustomizeDialog, write=SetCustomizeDialog, default=1};
	__property int DropDownWidth = {read=FDropDownWidth, write=SetDropDownWidth, default=0};
	__property int MaxDropDownCount = {read=FMaxDropDownCount, write=SetMaxDropDownCount, default=15};
	__property TcxGridTableFilterVisible Visible = {read=FVisible, write=SetVisible, default=1};
	
public:
	__fastcall virtual TcxCustomGridTableFiltering(Cxgridcustomview::TcxCustomGridView* AGridView);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	int __fastcall GetDropDownCount(int AItemCount);
	void __fastcall RunCustomizeDialog(TcxCustomGridTableItem* AItem = (TcxCustomGridTableItem*)(0x0));
	__property TcxCustomGridTableView* GridView = {read=GetGridView};
public:
	#pragma option push -w-inl
	/* TcxCustomGridOptions.Destroy */ inline __fastcall virtual ~TcxCustomGridTableFiltering(void) { }
	#pragma option pop
	
};


#pragma option push -b-
enum TcxGridDragFocusing { dfNone, dfDragOver, dfDragDrop };
#pragma option pop

typedef TMetaClass*TcxCustomGridTableOptionsBehaviorClass;

class DELPHICLASS TcxCustomGridTableOptionsBehavior;
class PASCALIMPLEMENTATION TcxCustomGridTableOptionsBehavior : public Cxgridcustomview::TcxCustomGridOptions 
{
	typedef Cxgridcustomview::TcxCustomGridOptions inherited;
	
private:
	bool FAlwaysShowEditor;
	int FBestFitMaxRecordCount;
	bool FCellHints;
	TcxGridDragFocusing FDragFocusing;
	bool FDragHighlighting;
	bool FDragOpening;
	bool FDragScrolling;
	bool FFocusCellOnCycle;
	bool FFocusCellOnTab;
	bool FFocusFirstCellOnNewRecord;
	bool FGoToNextCellOnEnter;
	bool FImmediateEditor;
	bool FIncSearch;
	TcxCustomGridTableItem* FIncSearchItem;
	bool FNavigatorHints;
	bool FPullFocusing;
	TcxCustomGridTableView* __fastcall GetGridView(void);
	void __fastcall SetBestFitMaxRecordCount(int Value);
	void __fastcall SetFocusCellOnTab(bool Value);
	void __fastcall SetIncSearch(bool Value);
	
protected:
	__property bool FocusCellOnCycle = {read=FFocusCellOnCycle, write=FFocusCellOnCycle, default=0};
	__property bool PullFocusing = {read=FPullFocusing, write=FPullFocusing, default=0};
	
public:
	__fastcall virtual TcxCustomGridTableOptionsBehavior(Cxgridcustomview::TcxCustomGridView* AGridView);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	__property int BestFitMaxRecordCount = {read=FBestFitMaxRecordCount, write=SetBestFitMaxRecordCount, default=0};
	__property TcxCustomGridTableView* GridView = {read=GetGridView};
	
__published:
	__property bool AlwaysShowEditor = {read=FAlwaysShowEditor, write=FAlwaysShowEditor, default=0};
	__property bool CellHints = {read=FCellHints, write=FCellHints, default=0};
	__property TcxGridDragFocusing DragFocusing = {read=FDragFocusing, write=FDragFocusing, default=0};
	__property bool DragHighlighting = {read=FDragHighlighting, write=FDragHighlighting, default=1};
	__property bool DragOpening = {read=FDragOpening, write=FDragOpening, default=1};
	__property bool DragScrolling = {read=FDragScrolling, write=FDragScrolling, default=1};
	__property bool FocusCellOnTab = {read=FFocusCellOnTab, write=SetFocusCellOnTab, default=0};
	__property bool FocusFirstCellOnNewRecord = {read=FFocusFirstCellOnNewRecord, write=FFocusFirstCellOnNewRecord, default=0};
	__property bool GoToNextCellOnEnter = {read=FGoToNextCellOnEnter, write=FGoToNextCellOnEnter, default=0};
	__property bool ImmediateEditor = {read=FImmediateEditor, write=FImmediateEditor, default=1};
	__property bool IncSearch = {read=FIncSearch, write=SetIncSearch, default=0};
	__property TcxCustomGridTableItem* IncSearchItem = {read=FIncSearchItem, write=FIncSearchItem};
	__property bool NavigatorHints = {read=FNavigatorHints, write=FNavigatorHints, default=0};
public:
	#pragma option push -w-inl
	/* TcxCustomGridOptions.Destroy */ inline __fastcall virtual ~TcxCustomGridTableOptionsBehavior(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxCustomGridTableOptionsCustomizeClass;

class DELPHICLASS TcxCustomGridTableOptionsCustomize;
class PASCALIMPLEMENTATION TcxCustomGridTableOptionsCustomize : public Cxgridcustomview::TcxCustomGridOptions 
{
	typedef Cxgridcustomview::TcxCustomGridOptions inherited;
	
private:
	bool FItemGrouping;
	bool FItemMoving;
	bool FItemSorting;
	
protected:
	__property bool ItemGrouping = {read=FItemGrouping, write=FItemGrouping, default=1};
	__property bool ItemMoving = {read=FItemMoving, write=FItemMoving, default=1};
	__property bool ItemSorting = {read=FItemSorting, write=FItemSorting, default=1};
	
public:
	__fastcall virtual TcxCustomGridTableOptionsCustomize(Cxgridcustomview::TcxCustomGridView* AGridView);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
public:
	#pragma option push -w-inl
	/* TcxCustomGridOptions.Destroy */ inline __fastcall virtual ~TcxCustomGridTableOptionsCustomize(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxCustomGridTableOptionsDataClass;

class DELPHICLASS TcxCustomGridTableOptionsData;
class PASCALIMPLEMENTATION TcxCustomGridTableOptionsData : public Cxgridcustomview::TcxCustomGridOptions 
{
	typedef Cxgridcustomview::TcxCustomGridOptions inherited;
	
private:
	bool FAppending;
	bool FCancelOnExit;
	bool FDeleting;
	bool FDeletingConfirmation;
	bool FEditing;
	bool FInserting;
	TcxCustomGridTableView* __fastcall GetGridView(void);
	void __fastcall SetDeleting(bool Value);
	void __fastcall SetEditing(bool Value);
	void __fastcall SetInserting(bool Value);
	
public:
	__fastcall virtual TcxCustomGridTableOptionsData(Cxgridcustomview::TcxCustomGridView* AGridView);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	__property TcxCustomGridTableView* GridView = {read=GetGridView};
	
__published:
	__property bool Appending = {read=FAppending, write=FAppending, default=0};
	__property bool CancelOnExit = {read=FCancelOnExit, write=FCancelOnExit, default=1};
	__property bool Deleting = {read=FDeleting, write=SetDeleting, default=1};
	__property bool DeletingConfirmation = {read=FDeletingConfirmation, write=FDeletingConfirmation, default=1};
	__property bool Editing = {read=FEditing, write=SetEditing, default=1};
	__property bool Inserting = {read=FInserting, write=SetInserting, default=1};
public:
	#pragma option push -w-inl
	/* TcxCustomGridOptions.Destroy */ inline __fastcall virtual ~TcxCustomGridTableOptionsData(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomGridTableOptionsSelection;
class PASCALIMPLEMENTATION TcxCustomGridTableOptionsSelection : public Cxgridcustomview::TcxCustomGridOptionsSelection 
{
	typedef Cxgridcustomview::TcxCustomGridOptionsSelection inherited;
	
private:
	bool FCellSelect;
	bool FHideFocusRect;
	bool FHideSelection;
	bool FInvertSelect;
	bool FUnselectFocusedRecordOnExit;
	bool __fastcall GetMultiSelect(void);
	void __fastcall SetCellSelect(bool Value);
	void __fastcall SetHideFocusRect(bool Value);
	void __fastcall SetHideSelection(bool Value);
	void __fastcall SetInvertSelect(bool Value);
	void __fastcall SetMultiSelect(bool Value);
	
protected:
	HIDESBASE TcxCustomGridTableView* __fastcall GridView(void);
	
public:
	__fastcall virtual TcxCustomGridTableOptionsSelection(Cxgridcustomview::TcxCustomGridView* AGridView);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	
__published:
	__property bool CellSelect = {read=FCellSelect, write=SetCellSelect, default=1};
	__property bool HideFocusRect = {read=FHideFocusRect, write=SetHideFocusRect, default=1};
	__property bool HideSelection = {read=FHideSelection, write=SetHideSelection, default=0};
	__property bool InvertSelect = {read=FInvertSelect, write=SetInvertSelect, default=1};
	__property bool MultiSelect = {read=GetMultiSelect, write=SetMultiSelect, default=0};
	__property bool UnselectFocusedRecordOnExit = {read=FUnselectFocusedRecordOnExit, write=FUnselectFocusedRecordOnExit, default=1};
public:
	#pragma option push -w-inl
	/* TcxCustomGridOptions.Destroy */ inline __fastcall virtual ~TcxCustomGridTableOptionsSelection(void) { }
	#pragma option pop
	
};


#pragma option push -b-
enum TcxGridShowEditButtons { gsebNever, gsebForFocusedRecord, gsebAlways };
#pragma option pop

class DELPHICLASS TcxCustomGridTableOptionsView;
class PASCALIMPLEMENTATION TcxCustomGridTableOptionsView : public Cxgridcustomview::TcxCustomGridOptionsView 
{
	typedef Cxgridcustomview::TcxCustomGridOptionsView inherited;
	
private:
	bool FCellAutoHeight;
	bool FCellEndEllipsis;
	int FCellTextMaxLineCount;
	bool FItemCaptionAutoHeight;
	bool FItemCaptionEndEllipsis;
	bool FNavigator;
	int FNavigatorOffset;
	TcxGridShowEditButtons FShowEditButtons;
	TcxCustomGridTableView* __fastcall GetGridView(void);
	void __fastcall SetCellAutoHeight(bool Value);
	void __fastcall SetCellEndEllipsis(bool Value);
	void __fastcall SetCellTextMaxLineCount(int Value);
	void __fastcall SetItemCaptionAutoHeight(bool Value);
	void __fastcall SetItemCaptionEndEllipsis(bool Value);
	void __fastcall SetNavigator(bool Value);
	void __fastcall SetNavigatorOffset(int Value);
	void __fastcall SetShowEditButtons(TcxGridShowEditButtons Value);
	
protected:
	DYNAMIC void __fastcall ItemCaptionAutoHeightChanged(void);
	void __fastcall SizeChanged(void);
	__property bool CellAutoHeight = {read=FCellAutoHeight, write=SetCellAutoHeight, default=0};
	__property int CellTextMaxLineCount = {read=FCellTextMaxLineCount, write=SetCellTextMaxLineCount, default=0};
	__property bool ItemCaptionAutoHeight = {read=FItemCaptionAutoHeight, write=SetItemCaptionAutoHeight, default=0};
	__property bool ItemCaptionEndEllipsis = {read=FItemCaptionEndEllipsis, write=SetItemCaptionEndEllipsis, default=0};
	
public:
	__fastcall virtual TcxCustomGridTableOptionsView(Cxgridcustomview::TcxCustomGridView* AGridView);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	__property TcxCustomGridTableView* GridView = {read=GetGridView};
	
__published:
	__property bool CellEndEllipsis = {read=FCellEndEllipsis, write=SetCellEndEllipsis, default=0};
	__property bool Navigator = {read=FNavigator, write=SetNavigator, default=0};
	__property int NavigatorOffset = {read=FNavigatorOffset, write=SetNavigatorOffset, default=50};
	__property TcxGridShowEditButtons ShowEditButtons = {read=FShowEditButtons, write=SetShowEditButtons, default=0};
public:
	#pragma option push -w-inl
	/* TcxCustomGridOptions.Destroy */ inline __fastcall virtual ~TcxCustomGridTableOptionsView(void) { }
	#pragma option pop
	
};


#pragma pack(push, 4)
struct TcxGridDataCellPos
{
	TcxCustomGridRecord* GridRecord;
	TcxCustomGridTableItem* Item;
} ;
#pragma pack(pop)

typedef TcxGridDataCellPos *PcxGridDataCellPos;

class DELPHICLASS TcxCustomGridTableViewStyles;
class PASCALIMPLEMENTATION TcxCustomGridTableViewStyles : public Cxgridcustomview::TcxCustomGridViewStyles 
{
	typedef Cxgridcustomview::TcxCustomGridViewStyles inherited;
	
private:
	TcxGridGetCellStyleEvent FOnGetContentStyle;
	TcxCustomGridTableView* __fastcall GetGridViewValue(void);
	
protected:
	virtual void __fastcall GetDefaultViewParams(int Index, void * AData, /* out */ Cxgraphics::TcxViewParams &AParams);
	
public:
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual void __fastcall GetContentParams(TcxCustomGridRecord* ARecord, TcxCustomGridTableItem* AItem, /* out */ Cxgraphics::TcxViewParams &AParams);
	virtual void __fastcall GetDataCellContentParams(TcxCustomGridRecord* ARecord, TcxCustomGridTableItem* AItem, /* out */ Cxgraphics::TcxViewParams &AParams);
	virtual void __fastcall GetDataCellParams(TcxCustomGridRecord* ARecord, TcxCustomGridTableItem* AItem, /* out */ Cxgraphics::TcxViewParams &AParams, bool AUseViewInfo = false, TcxGridTableCellViewInfo* ACellViewInfo = (TcxGridTableCellViewInfo*)(0x0));
	virtual void __fastcall GetRecordContentParams(TcxCustomGridRecord* ARecord, TcxCustomGridTableItem* AItem, /* out */ Cxgraphics::TcxViewParams &AParams);
	__property TcxCustomGridTableView* GridView = {read=GetGridViewValue};
	
__published:
	__property Cxstyles::TcxStyle* Content = {read=GetValue, write=SetValue, index=1};
	__property Cxstyles::TcxStyle* ContentEven = {read=GetValue, write=SetValue, index=2};
	__property Cxstyles::TcxStyle* ContentOdd = {read=GetValue, write=SetValue, index=3};
	__property Cxstyles::TcxStyle* Inactive = {read=GetValue, write=SetValue, index=4};
	__property Cxstyles::TcxStyle* IncSearch = {read=GetValue, write=SetValue, index=5};
	__property Cxstyles::TcxStyle* Selection = {read=GetValue, write=SetValue, index=6};
	__property TcxGridGetCellStyleEvent OnGetContentStyle = {read=FOnGetContentStyle, write=FOnGetContentStyle};
public:
	#pragma option push -w-inl
	/* TcxCustomStyles.Create */ inline __fastcall virtual TcxCustomGridTableViewStyles(Classes::TPersistent* AOwner) : Cxgridcustomview::TcxCustomGridViewStyles(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomStyles.Destroy */ inline __fastcall virtual ~TcxCustomGridTableViewStyles(void) { }
	#pragma option pop
	
};


typedef void __fastcall (__closure *TcxGridTableCellCustomDrawEvent)(TcxCustomGridTableView* Sender, Cxgraphics::TcxCanvas* ACanvas, TcxGridTableCellViewInfo* AViewInfo, bool &ADone);

typedef void __fastcall (__closure *TcxGridCanSelectRecordEvent)(TcxCustomGridTableView* Sender, TcxCustomGridRecord* ARecord, bool &AAllow);

typedef void __fastcall (__closure *TcxGridCellClickEvent)(TcxCustomGridTableView* Sender, TcxGridTableDataCellViewInfo* ACellViewInfo, Controls::TMouseButton AButton, Classes::TShiftState AShift, bool &AHandled);

typedef void __fastcall (__closure *TcxGridCustomTableViewEvent)(TcxCustomGridTableView* Sender);

typedef void __fastcall (__closure *TcxGridEditingEvent)(TcxCustomGridTableView* Sender, TcxCustomGridTableItem* AItem, bool &AAllow);

typedef void __fastcall (__closure *TcxGridCustomTableItemEvent)(TcxCustomGridTableView* Sender, TcxCustomGridTableItem* AItem);

typedef void __fastcall (__closure *TcxGridFocusedItemChangedEvent)(TcxCustomGridTableView* Sender, TcxCustomGridTableItem* APrevFocusedItem, TcxCustomGridTableItem* AFocusedItem);

typedef void __fastcall (__closure *TcxGridFocusedRecordChangedEvent)(TcxCustomGridTableView* Sender, TcxCustomGridRecord* APrevFocusedRecord, TcxCustomGridRecord* AFocusedRecord, bool ANewItemRecordFocusingChanged);

typedef void __fastcall (__closure *TcxGridInitEditEvent)(TcxCustomGridTableView* Sender, TcxCustomGridTableItem* AItem, Cxedit::TcxCustomEdit* AEdit);

typedef void __fastcall (__closure *TcxGridRecordEvent)(TcxCustomGridTableView* Sender, TcxCustomGridRecord* ARecord);

#pragma option push -b-
enum TcxGridDataControllerChange { dccGlobal, dccItemAdded, dccItemRemoved, dccIndexesChanged };
#pragma option pop

class PASCALIMPLEMENTATION TcxCustomGridTableView : public Cxgridcustomview::TcxCustomGridView 
{
	typedef Cxgridcustomview::TcxCustomGridView inherited;
	
private:
	AnsiString FCopyToClipboardStr;
	bool FDontMakeMasterRecordVisible;
	Classes::TList* FFilterableItems;
	TcxCustomGridTableFiltering* FFiltering;
	Classes::TList* FItems;
	Cxnavigator::TcxNavigatorControlButtons* FNavigatorButtons;
	Cxnavigator::TcxNavigatorControlNotifier* FNavigatorNotifier;
	int FNextID;
	TcxCustomGridTableOptionsBehavior* FOptionsBehavior;
	TcxCustomGridTableOptionsCustomize* FOptionsCustomize;
	TcxCustomGridTableOptionsData* FOptionsData;
	Classes::TList* FVisibleItems;
	TcxGridCanSelectRecordEvent FOnCanSelectRecord;
	TcxGridCellClickEvent FOnCellClick;
	TcxGridTableDataCellCustomDrawEvent FOnCustomDrawCell;
	TcxGridEditingEvent FOnEditing;
	TcxGridCustomTableItemEvent FOnEditChanged;
	TcxGridCustomTableItemEvent FOnEditValueChanged;
	Classes::TNotifyEvent FOnFilterControlDialogShow;
	TcxGridFocusedItemChangedEvent FOnFocusedItemChanged;
	TcxGridFocusedRecordChangedEvent FOnFocusedRecordChanged;
	TcxGridInitEditEvent FOnInitEdit;
	TcxGridCustomTableViewEvent FOnSelectionChanged;
	Classes::TNotifyEvent FOnTopRecordIndexChanged;
	TcxCustomGridTableBackgroundBitmaps* __fastcall GetBackgroundBitmaps(void);
	TcxCustomGridTableController* __fastcall GetController(void);
	TcxGridDataController* __fastcall GetDataController(void);
	TcxCustomGridTableItem* __fastcall GetFilterableItem(int Index);
	int __fastcall GetFilterableItemCount(void);
	TcxCustomGridTableItem* __fastcall GetGroupedItem(int Index);
	int __fastcall GetGroupedItemCount(void);
	TcxCustomGridTableItem* __fastcall GetItem(int Index);
	int __fastcall GetItemCount(void);
	TcxCustomGridRecord* __fastcall GetMasterGridRecord(void);
	TcxCustomGridTableOptionsSelection* __fastcall GetOptionsSelection(void);
	TcxCustomGridTableOptionsView* __fastcall GetOptionsView(void);
	TcxCustomGridTablePainter* __fastcall GetPainter(void);
	Cxnavigator::_di_IcxNavigator __fastcall GetNavigatorButtonsControl();
	TcxCustomGridTableItem* __fastcall GetSortedItem(int Index);
	int __fastcall GetSortedItemCount(void);
	TcxCustomGridTableViewStyles* __fastcall GetStyles(void);
	TcxCustomGridTableViewData* __fastcall GetViewData(void);
	TcxCustomGridTableViewInfo* __fastcall GetViewInfo(void);
	TcxCustomGridTableItem* __fastcall GetVisibleItem(int Index);
	int __fastcall GetVisibleItemCount(void);
	HIDESBASE void __fastcall SetBackgroundBitmaps(TcxCustomGridTableBackgroundBitmaps* Value);
	void __fastcall SetDataController(TcxGridDataController* Value);
	void __fastcall SetFiltering(TcxCustomGridTableFiltering* Value);
	void __fastcall SetItem(int Index, TcxCustomGridTableItem* Value);
	void __fastcall SetNavigatorButtons(Cxnavigator::TcxNavigatorControlButtons* Value);
	void __fastcall SetOptionsBehavior(TcxCustomGridTableOptionsBehavior* Value);
	void __fastcall SetOptionsCustomize(TcxCustomGridTableOptionsCustomize* Value);
	void __fastcall SetOptionsData(TcxCustomGridTableOptionsData* Value);
	HIDESBASE void __fastcall SetOptionsSelection(TcxCustomGridTableOptionsSelection* Value);
	HIDESBASE void __fastcall SetOptionsView(TcxCustomGridTableOptionsView* Value);
	HIDESBASE void __fastcall SetStyles(TcxCustomGridTableViewStyles* Value);
	void __fastcall CopyForEachRowProc(int ARowIndex, const Cxcustomdata::TcxRowInfo &ARowInfo);
	void __fastcall RefreshItemIndexes(void);
	
protected:
	AnsiString __fastcall GetFilterCaption(int Index);
	int __fastcall GetFilterCount(void);
	Cxfilter::TcxFilterCriteria* __fastcall GetFilterCriteria(void);
	AnsiString __fastcall GetFilterFieldName(int Index);
	System::TObject* __fastcall GetFilterItemLink(int Index);
	Cxedit::TcxCustomEditProperties* __fastcall GetFilterProperties(int Index);
	TMetaClass* __fastcall GetFilterValueType(int Index);
	bool __fastcall NavigatorIsBof(void);
	bool __fastcall NavigatorIsEof(void);
	bool __fastcall NavigatorCanEdit(void);
	bool __fastcall NavigatorCanDelete(void);
	bool __fastcall NavigatorCanInsert(void);
	bool __fastcall NavigatorIsEditing(void);
	void __fastcall NavigatorClearBookmark(void);
	bool __fastcall NavigatorIsBookmarkAvailable(void);
	void __fastcall NavigatorDoAction(int AButtonIndex);
	Cxnavigator::TcxNavigatorControlNotifier* __fastcall NavigatorGetNotifier(void);
	bool __fastcall NavigatorIsActionSupported(int AButtonIndex);
	virtual bool __fastcall GetProperties(Classes::TStrings* AProperties);
	virtual void __fastcall GetPropertyValue(const AnsiString AName, Variant &AValue);
	virtual void __fastcall SetPropertyValue(const AnsiString AName, const Variant &AValue);
	virtual System::TObject* __fastcall CreateChild(const AnsiString AObjectName, const AnsiString AClassName);
	virtual void __fastcall GetStoredChildren(Classes::TStringList* AChildren);
	virtual bool __fastcall CanOffset(int ARecordCountDelta);
	virtual bool __fastcall CanSelectRecord(int ARecordIndex);
	virtual bool __fastcall CanTabStop(void);
	virtual void __fastcall DetailVisibleChanged(Classes::TComponent* ADetailLevel, int APrevVisibleDetailCount, int AVisibleDetailCount);
	virtual void __fastcall DoAssign(Cxgridcustomview::TcxCustomGridView* ASource);
	virtual void __fastcall FocusEdit(int AItemIndex, bool &ADone);
	DYNAMIC void __fastcall GetChildren(Classes::TGetChildProc Proc, Classes::TComponent* Root);
	virtual int __fastcall GetDefaultActiveDetailIndex(void);
	bool __fastcall GetDisplayText(int ARecordIndex, int AItemIndex, /* out */ AnsiString &AText);
	virtual void __fastcall GetFakeComponentLinks(Classes::TList* AList);
	virtual bool __fastcall GetIsControlFocused(void);
	bool __fastcall GetItemSortByDisplayText(int AItemIndex);
	Cxdatautils::TcxDataEditValueSource __fastcall GetItemValueSource(int AItemIndex);
	bool __fastcall HasCustomDrawCell(void);
	virtual void __fastcall Init(void);
	virtual bool __fastcall IsDetailVisible(Cxgridcustomview::TcxCustomGridView* AGridView);
	virtual bool __fastcall IsEqualHeightRecords(void);
	virtual void __fastcall LoadingComplete(void);
	virtual void __fastcall Offset(int ARecordCountDelta, int DX, int DY);
	DYNAMIC void __fastcall SetChildOrder(Classes::TComponent* Child, int Order);
	virtual void __fastcall SetName(const AnsiString NewName);
	virtual void __fastcall UpdateControl(Cxcustomdata::TcxUpdateControlInfo* AInfo);
	void __fastcall UpdateDataController(TcxGridDataControllerChange AChange, TcxCustomGridTableItem* AItem = (TcxCustomGridTableItem*)(0x0));
	virtual void __fastcall UpdateRecord(void);
	virtual void __fastcall CreateHandlers(void);
	virtual void __fastcall DestroyHandlers(void);
	virtual void __fastcall CreateOptions(void);
	virtual void __fastcall DestroyOptions(void);
	virtual void __fastcall AddItem(TcxCustomGridTableItem* AItem);
	virtual void __fastcall RemoveItem(TcxCustomGridTableItem* AItem);
	void __fastcall AssignVisibleItemsIndexes(void);
	virtual void __fastcall ChangeItemIndex(TcxCustomGridTableItem* AItem, int Value);
	virtual void __fastcall ItemVisibilityChanged(TcxCustomGridTableItem* AItem, bool Value);
	virtual void __fastcall RefreshVisibleItemsList(void);
	virtual TMetaClass* __fastcall GetItemClass(void) = 0 ;
	virtual TMetaClass* __fastcall GetItemDataBindingClass(void);
	int __fastcall GetNextID(void);
	void __fastcall ReleaseID(int AID);
	virtual void __fastcall DataChanged(void);
	virtual void __fastcall DataLayoutChanged(void);
	virtual bool __fastcall DoCellClick(TcxGridTableDataCellViewInfo* ACellViewInfo, Controls::TMouseButton AButton, Classes::TShiftState AShift);
	virtual bool __fastcall DoEditing(TcxCustomGridTableItem* AItem);
	virtual void __fastcall DoGetDisplayText(TcxCustomGridRecord* ARecord, int AItemIndex, AnsiString &AText);
	virtual void __fastcall DoTopRecordIndexChanged(void);
	virtual void __fastcall FocusedItemChanged(TcxCustomGridTableItem* APrevFocusedItem, TcxCustomGridTableItem* AFocusedItem);
	virtual void __fastcall FocusedRecordChanged(int APrevFocusedRecordIndex, int AFocusedRecordIndex, bool ANewItemRecordFocusingChanged);
	virtual void __fastcall ItemValueTypeClassChanged(int AItemIndex);
	void __fastcall RecalculateDefaultWidths(void);
	virtual void __fastcall RecordChanged(int ARecordIndex);
	virtual void __fastcall RecordCountChanged(void);
	void __fastcall RefreshFilterableItemsList(void);
	void __fastcall RefreshNavigators(void);
	virtual void __fastcall SearchChanged(void);
	virtual void __fastcall SelectionChanged(Cxcustomdata::TcxSelectionChangedInfo* AInfo);
	virtual bool __fastcall DrawDataCellSelected(TcxCustomGridRecord* ARecord, TcxCustomGridTableItem* AItem, bool AUseViewInfo = false, TcxGridTableCellViewInfo* ACellViewInfo = (TcxGridTableCellViewInfo*)(0x0));
	virtual bool __fastcall DrawRecordActive(TcxCustomGridRecord* ARecord);
	virtual bool __fastcall DrawRecordFocused(TcxCustomGridRecord* ARecord);
	virtual bool __fastcall DrawRecordSelected(TcxCustomGridRecord* ARecord);
	virtual void __fastcall DoCustomDrawCell(Cxgraphics::TcxCanvas* ACanvas, TcxGridTableDataCellViewInfo* AViewInfo, bool &ADone);
	virtual void __fastcall DoEditChanged(TcxCustomGridTableItem* AItem);
	virtual void __fastcall DoEditValueChanged(TcxCustomGridTableItem* AItem);
	virtual void __fastcall DoInitEdit(TcxCustomGridTableItem* AItem, Cxedit::TcxCustomEdit* AEdit);
	virtual TMetaClass* __fastcall GetControllerClass(void);
	virtual TMetaClass* __fastcall GetPainterClass(void);
	virtual TMetaClass* __fastcall GetViewDataClass(void);
	virtual TMetaClass* __fastcall GetViewInfoCacheClass(void);
	virtual TMetaClass* __fastcall GetViewInfoClass(void);
	virtual TMetaClass* __fastcall GetBackgroundBitmapsClass(void);
	virtual TMetaClass* __fastcall GetFilteringClass(void);
	virtual TMetaClass* __fastcall GetNavigatorButtonsClass(void);
	virtual TMetaClass* __fastcall GetOptionsBehaviorClass(void);
	virtual TMetaClass* __fastcall GetOptionsCustomizeClass(void);
	virtual TMetaClass* __fastcall GetOptionsDataClass(void);
	virtual TMetaClass* __fastcall GetOptionsSelectionClass(void);
	virtual TMetaClass* __fastcall GetOptionsViewClass(void);
	virtual TMetaClass* __fastcall GetStylesClass(void);
	virtual TMetaClass* __fastcall GetSummaryGroupItemLinkClass(void);
	virtual TMetaClass* __fastcall GetSummaryItemClass(void);
	__property TcxCustomGridTableBackgroundBitmaps* BackgroundBitmaps = {read=GetBackgroundBitmaps, write=SetBackgroundBitmaps};
	__property bool DontMakeMasterRecordVisible = {read=FDontMakeMasterRecordVisible, write=FDontMakeMasterRecordVisible, nodefault};
	__property int FilterableItemCount = {read=GetFilterableItemCount, nodefault};
	__property TcxCustomGridTableItem* FilterableItems[int Index] = {read=GetFilterableItem};
	__property Cxnavigator::TcxNavigatorControlNotifier* NavigatorNotifier = {read=FNavigatorNotifier};
	__property int NextID = {read=FNextID, nodefault};
	__property Classes::TList* VisibleItemsList = {read=FVisibleItems};
	__property Classes::TNotifyEvent OnFilterControlDialogShow = {read=FOnFilterControlDialogShow, write=FOnFilterControlDialogShow};
	
public:
	__fastcall virtual ~TcxCustomGridTableView(void);
	void __fastcall ApplyBestFit(TcxCustomGridTableItem* AItem = (TcxCustomGridTableItem*)(0x0));
	void __fastcall ClearItems(void);
	void __fastcall CopyToClipboard(bool ACopyAll);
	TcxCustomGridTableItem* __fastcall CreateItem(void);
	TcxCustomGridTableItem* __fastcall FindItemByID(int AID);
	TcxCustomGridTableItem* __fastcall FindItemByName(const AnsiString AName);
	int __fastcall IndexOfItem(TcxCustomGridTableItem* AItem);
	void __fastcall MakeMasterGridRecordVisible(void);
	virtual void __fastcall RestoreDefaults(void);
	/* virtual class method */ virtual bool __fastcall CanBeLookupList(TMetaClass* vmt);
	__property TcxCustomGridTableController* Controller = {read=GetController};
	__property TcxCustomGridTableFiltering* Filtering = {read=FFiltering, write=SetFiltering};
	__property int GroupedItemCount = {read=GetGroupedItemCount, nodefault};
	__property TcxCustomGridTableItem* GroupedItems[int Index] = {read=GetGroupedItem};
	__property int ItemCount = {read=GetItemCount, nodefault};
	__property TcxCustomGridTableItem* Items[int Index] = {read=GetItem, write=SetItem};
	__property TcxCustomGridRecord* MasterGridRecord = {read=GetMasterGridRecord};
	__property TcxCustomGridTableOptionsBehavior* OptionsBehavior = {read=FOptionsBehavior, write=SetOptionsBehavior};
	__property TcxCustomGridTableOptionsCustomize* OptionsCustomize = {read=FOptionsCustomize, write=SetOptionsCustomize};
	__property TcxCustomGridTableOptionsData* OptionsData = {read=FOptionsData, write=SetOptionsData};
	__property TcxCustomGridTableOptionsSelection* OptionsSelection = {read=GetOptionsSelection, write=SetOptionsSelection};
	__property TcxCustomGridTableOptionsView* OptionsView = {read=GetOptionsView, write=SetOptionsView};
	__property TcxCustomGridTablePainter* Painter = {read=GetPainter};
	__property int SortedItemCount = {read=GetSortedItemCount, nodefault};
	__property TcxCustomGridTableItem* SortedItems[int Index] = {read=GetSortedItem};
	__property TcxCustomGridTableViewStyles* Styles = {read=GetStyles, write=SetStyles};
	__property TcxCustomGridTableViewData* ViewData = {read=GetViewData};
	__property TcxCustomGridTableViewInfo* ViewInfo = {read=GetViewInfo};
	__property int VisibleItemCount = {read=GetVisibleItemCount, nodefault};
	__property TcxCustomGridTableItem* VisibleItems[int Index] = {read=GetVisibleItem};
	
__published:
	__property TcxGridDataController* DataController = {read=GetDataController, write=SetDataController};
	__property Cxnavigator::TcxNavigatorControlButtons* NavigatorButtons = {read=FNavigatorButtons, write=SetNavigatorButtons};
	__property TcxGridCanSelectRecordEvent OnCanSelectRecord = {read=FOnCanSelectRecord, write=FOnCanSelectRecord};
	__property TcxGridCellClickEvent OnCellClick = {read=FOnCellClick, write=FOnCellClick};
	__property TcxGridTableDataCellCustomDrawEvent OnCustomDrawCell = {read=FOnCustomDrawCell, write=FOnCustomDrawCell};
	__property TcxGridEditingEvent OnEditing = {read=FOnEditing, write=FOnEditing};
	__property TcxGridCustomTableItemEvent OnEditChanged = {read=FOnEditChanged, write=FOnEditChanged};
	__property TcxGridCustomTableItemEvent OnEditValueChanged = {read=FOnEditValueChanged, write=FOnEditValueChanged};
	__property TcxGridFocusedItemChangedEvent OnFocusedItemChanged = {read=FOnFocusedItemChanged, write=FOnFocusedItemChanged};
	__property TcxGridFocusedRecordChangedEvent OnFocusedRecordChanged = {read=FOnFocusedRecordChanged, write=FOnFocusedRecordChanged};
	__property TcxGridInitEditEvent OnInitEdit = {read=FOnInitEdit, write=FOnInitEdit};
	__property TcxGridCustomTableViewEvent OnSelectionChanged = {read=FOnSelectionChanged, write=FOnSelectionChanged};
	__property Classes::TNotifyEvent OnTopRecordIndexChanged = {read=FOnTopRecordIndexChanged, write=FOnTopRecordIndexChanged};
public:
	#pragma option push -w-inl
	/* TcxCustomGridView.Create */ inline __fastcall virtual TcxCustomGridTableView(Classes::TComponent* AOwner) : Cxgridcustomview::TcxCustomGridView(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxControlChildComponent.CreateEx */ inline __fastcall TcxCustomGridTableView(Cxcontrols::TcxControl* AControl, bool AAssignOwner) : Cxgridcustomview::TcxCustomGridView(AControl, AAssignOwner) { }
	#pragma option pop
	
private:
	void *__IcxFilterControl;	/* Cxfiltercontrol::IcxFilterControl [GetValueType=GetFilterValueType, GetProperties=GetFilterProperties, GetItemLink=GetFilterItemLink, GetFieldName=GetFilterFieldName, GetCriteria=GetFilterCriteria, GetCount=GetFilterCount, GetCaption=GetFilterCaption] */
	void *__IcxNavigator;	/* Cxnavigator::IcxNavigator [IsActionSupported=NavigatorIsActionSupported, GetNotifier=NavigatorGetNotifier, DoAction=NavigatorDoAction, IsBookmarkAvailable=NavigatorIsBookmarkAvailable, ClearBookmark=NavigatorClearBookmark, IsEditing=NavigatorIsEditing, CanInsert=NavigatorCanInsert, CanDelete=NavigatorCanDelete, CanEdit=NavigatorCanEdit, IsEof=NavigatorIsEof, IsBof=NavigatorIsBof] */
	
public:
	operator IcxNavigator*(void) { return (IcxNavigator*)&__IcxNavigator; }
	operator IcxFilterControl*(void) { return (IcxFilterControl*)&__IcxFilterControl; }
	
};


//-- var, const, procedure ---------------------------------------------------
static const Shortint cxGridFilterDefaultMaxDropDownCount = 0xf;
static const Shortint cxGridItemDefaultMinWidth = 0x14;
static const Shortint cxGridNavigatorDefaultOffset = 0x32;
static const Shortint htCustomGridTableBase = 0x64;
static const Shortint htRecord = 0x65;
static const Shortint htCell = 0x66;
static const Shortint htExpandButton = 0x67;
static const Shortint htNavigator = 0x68;
static const Shortint isCustomItemFirst = 0x0;
static const Shortint isContent = 0x0;
static const Shortint isCustomItemLast = 0x0;
static const Shortint bbCustomTableFirst = 0x1;
static const Shortint bbContent = 0x1;
static const Shortint bbCustomTableLast = 0x1;
static const Shortint vsCustomTableFirst = 0x1;
static const Shortint vsContent = 0x1;
static const Shortint vsContentEven = 0x2;
static const Shortint vsContentOdd = 0x3;
static const Shortint vsInactive = 0x4;
static const Shortint vsIncSearch = 0x5;
static const Shortint vsSelection = 0x6;
static const Shortint vsCustomTableLast = 0x6;

}	/* namespace Cxgridcustomtableview */
using namespace Cxgridcustomtableview;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxGridCustomTableView
