// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxGridUIHelper.pas' rev: 6.00

#ifndef cxGridUIHelperHPP
#define cxGridUIHelperHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxGridCustomView.hpp>	// Pascal unit
#include <cxGrid.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxgriduihelper
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxCustomGridOperationHelperParameters;
class PASCALIMPLEMENTATION TcxCustomGridOperationHelperParameters : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	Cxgridcustomview::TcxCustomGridView* FView;
	bool FIsPerform;
	
public:
	__fastcall virtual TcxCustomGridOperationHelperParameters(Cxgridcustomview::TcxCustomGridView* AView, bool AIsPerform);
	__property Cxgridcustomview::TcxCustomGridView* View = {read=FView};
	__property bool IsPerform = {read=FIsPerform, nodefault};
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxCustomGridOperationHelperParameters(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxShowingGridOperationHelperParameters;
class PASCALIMPLEMENTATION TcxShowingGridOperationHelperParameters : public TcxCustomGridOperationHelperParameters 
{
	typedef TcxCustomGridOperationHelperParameters inherited;
	
private:
	bool FShowing;
	
public:
	__property bool Showing = {read=FShowing, write=FShowing, nodefault};
public:
	#pragma option push -w-inl
	/* TcxCustomGridOperationHelperParameters.Create */ inline __fastcall virtual TcxShowingGridOperationHelperParameters(Cxgridcustomview::TcxCustomGridView* AView, bool AIsPerform) : TcxCustomGridOperationHelperParameters(AView, AIsPerform) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxShowingGridOperationHelperParameters(void) { }
	#pragma option pop
	
};


typedef void __fastcall (__closure *TcxGridOperationHelperProc)(const TcxCustomGridOperationHelperParameters* AParameter);

class DELPHICLASS TcxCustomGridViewOperationHelper;
class PASCALIMPLEMENTATION TcxCustomGridViewOperationHelper : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	Classes::TList* FList;
	
protected:
	void __fastcall RegisterOperation(int AOperationIndex, const TcxGridOperationHelperProc AProc);
	virtual void __fastcall RegisterOperations(void);
	bool __fastcall GetShowProperty(const TcxCustomGridOperationHelperParameters* AParameter);
	void __fastcall SetShowProperty(const TcxCustomGridOperationHelperParameters* AParameter, bool AShow);
	void __fastcall DoFirst(const TcxCustomGridOperationHelperParameters* AParameter);
	void __fastcall DoLast(const TcxCustomGridOperationHelperParameters* AParameter);
	void __fastcall DoNext(const TcxCustomGridOperationHelperParameters* AParameter);
	void __fastcall DoPrev(const TcxCustomGridOperationHelperParameters* AParameter);
	void __fastcall DoInsert(const TcxCustomGridOperationHelperParameters* AParameter);
	void __fastcall DoDelete(const TcxCustomGridOperationHelperParameters* AParameter);
	
public:
	__fastcall TcxCustomGridViewOperationHelper(void);
	__fastcall virtual ~TcxCustomGridViewOperationHelper(void);
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewClass(TMetaClass* vmt);
	virtual bool __fastcall IsOperationAccessible(int AOperationIndex);
	virtual bool __fastcall IsOperationEnabled(Cxgridcustomview::TcxCustomGridView* AView, int AOperationIndex);
	virtual void __fastcall PerformOperation(int AOperationIndex, const TcxCustomGridOperationHelperParameters* AParameter);
};


typedef TMetaClass*TcxCustomGridViewOperationHelperClass;

class DELPHICLASS TcxCustomGridOperationHelper;
class PASCALIMPLEMENTATION TcxCustomGridOperationHelper : public Classes::TComponent 
{
	typedef Classes::TComponent inherited;
	
private:
	Cxgrid::TcxCustomGridNotification* FFocusedViewChangedNotification;
	Cxgrid::TcxGrid* FGrid;
	Classes::TNotifyEvent FOnUpdateOperations;
	Classes::TNotifyEvent FOnFocusedRecordChanged;
	Classes::TNotifyEvent FOnCustomizationFormVisibleChanged;
	bool __fastcall GetIsOperationAccessible(int AOperationIndex);
	bool __fastcall GetIsOperationEnabled(int AOperationIndex);
	bool __fastcall GetIsOperationShowing(int AOperationIndex);
	void __fastcall SetGrid(const Cxgrid::TcxGrid* Value);
	void __fastcall DoFocusedViewChanged(void);
	
protected:
	DYNAMIC void __fastcall DoUpdateOperations(void);
	DYNAMIC void __fastcall DoFocusedRecordChanged(void);
	DYNAMIC void __fastcall DoCustomizationFormVisibleChanged(void);
	
public:
	__fastcall virtual TcxCustomGridOperationHelper(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxCustomGridOperationHelper(void);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	Cxgridcustomview::TcxCustomGridView* __fastcall FocusedView(void);
	TMetaClass* __fastcall FocusedViewClass(void);
	void __fastcall PerformOperation(int AOperationIndex, const TcxCustomGridOperationHelperParameters* AParameters);
	void __fastcall PerformStarndardOperation(int AOperationIndex);
	void __fastcall PerformShowingOperation(int AOperationIndex, bool AShow);
	__property bool IsOperationAccessible[int AOperationIndex] = {read=GetIsOperationAccessible};
	__property bool IsOperationEnabled[int AOperationIndex] = {read=GetIsOperationEnabled};
	__property bool IsOperationShowing[int AOperationIndex] = {read=GetIsOperationShowing};
	void __fastcall DoFirst(void);
	void __fastcall DoLast(void);
	void __fastcall DoNext(void);
	void __fastcall DoPrev(void);
	void __fastcall DoInsert(void);
	void __fastcall DoDelete(void);
	void __fastcall CopyToClipboard(void);
	void __fastcall DoShowColumnCustomizing(bool AShow);
	void __fastcall DoShowGroupingPanel(bool AShow);
	void __fastcall DoShowHeaders(bool AShow);
	void __fastcall DoShowBands(bool AShow);
	void __fastcall DoShowSummaryFooter(bool AShow);
	void __fastcall DoShowGrid(bool AShow);
	void __fastcall DoColumnAutoWidth(bool AShow);
	void __fastcall DoShowPreview(bool AShow);
	void __fastcall DoShowEditButtons(bool AShow);
	void __fastcall DoLayoutDirection(bool AShow);
	void __fastcall DoInvertSelect(bool AShow);
	void __fastcall DoShowIndicator(bool AShow);
	bool __fastcall IsColumnsCustomizingShowing(void);
	bool __fastcall IsGroupingPanelShowing(void);
	bool __fastcall IsHeadersShowing(void);
	bool __fastcall IsBandsShowing(void);
	bool __fastcall IsSummaryFooterShowing(void);
	bool __fastcall IsGridShowing(void);
	bool __fastcall IsColumnAutoWidth(void);
	bool __fastcall IsShowPreview(void);
	bool __fastcall IsShowEditButtons(void);
	bool __fastcall IsVertLayoutDirection(void);
	bool __fastcall IsInvertSelect(void);
	bool __fastcall IsShowIndicator(void);
	__property Cxgrid::TcxGrid* Grid = {read=FGrid, write=SetGrid};
	__property Classes::TNotifyEvent OnUpdateOperations = {read=FOnUpdateOperations, write=FOnUpdateOperations};
	__property Classes::TNotifyEvent onFocusedRecordChanged = {read=FOnFocusedRecordChanged, write=FOnFocusedRecordChanged};
	__property Classes::TNotifyEvent OnCustomizationFormVisibleChanged = {read=FOnCustomizationFormVisibleChanged, write=FOnCustomizationFormVisibleChanged};
};


class DELPHICLASS TcxGridOperationHelper;
class PASCALIMPLEMENTATION TcxGridOperationHelper : public TcxCustomGridOperationHelper 
{
	typedef TcxCustomGridOperationHelper inherited;
	
__published:
	__property Grid ;
	__property OnUpdateOperations ;
public:
	#pragma option push -w-inl
	/* TcxCustomGridOperationHelper.Create */ inline __fastcall virtual TcxGridOperationHelper(Classes::TComponent* AOwner) : TcxCustomGridOperationHelper(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomGridOperationHelper.Destroy */ inline __fastcall virtual ~TcxGridOperationHelper(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
static const Shortint GROP_FIRST = 0x0;
static const Shortint GROP_LAST = 0x1;
static const Shortint GROP_PREV = 0x2;
static const Shortint GROP_NEXT = 0x3;
static const Shortint GROP_INSERT = 0x4;
static const Shortint GROP_DELETE = 0x5;
static const Shortint GROP_COPYTOCLIPBOARD = 0x6;
static const Shortint GROP_SHOWCOLUMNCUSTOMIZING = 0x64;
static const Shortint GROP_SHOWGROUPINGPANEL = 0x65;
static const Shortint GROP_SHOWINDICATOR = 0x66;
static const Shortint GROP_INVERTSELECT = 0x67;
static const Shortint GROP_SHOWHEADERS = 0x68;
static const Shortint GROP_SHOWSUMMARYFOOTER = 0x69;
static const Shortint GROP_SHOWBANDS = 0x6a;
static const Shortint GROP_SHOWGRID = 0x6b;
static const Shortint GROP_COLUMNAUTOWIDTH = 0x6c;
static const Shortint GROP_SHOWPREVIEW = 0x6d;
static const Shortint GROP_SHOWEDITBUTTONS = 0x6e;
static const Shortint GROP_LAYOUTDIRECTION = 0x6f;
extern PACKAGE void __fastcall RegisterGridViewOperationHelper(TMetaClass* AGridViewOperationHelperClass);
extern PACKAGE void __fastcall UnregisterGridViewOperationHelper(TMetaClass* AGridViewOperationHelperClass);
extern PACKAGE TcxCustomGridViewOperationHelper* __fastcall GetGridViewOperationHelperByGridViewClass(const TMetaClass* AGridViewClass);

}	/* namespace Cxgriduihelper */
using namespace Cxgriduihelper;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxGridUIHelper
