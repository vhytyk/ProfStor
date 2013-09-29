// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxDBNavigator.pas' rev: 6.00

#ifndef cxDBNavigatorHPP
#define cxDBNavigatorHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Menus.hpp>	// Pascal unit
#include <cxLookAndFeels.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <ImgList.hpp>	// Pascal unit
#include <cxNavigator.hpp>	// Pascal unit
#include <cxDBFilterControl.hpp>	// Pascal unit
#include <DB.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxdbnavigator
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxDBNavigatorDataLink;
class DELPHICLASS TcxCustomDBNavigator;
typedef void __fastcall (__closure *TcxDBNavigatorFilterEvent)(TcxCustomDBNavigator* ANavigator, Cxdbfiltercontrol::TcxDBFilterControl* AFilterControl);

class DELPHICLASS TcxDBNavigatorButtons;
class PASCALIMPLEMENTATION TcxCustomDBNavigator : public Cxnavigator::TcxCustomNavigator 
{
	typedef Cxnavigator::TcxCustomNavigator inherited;
	
private:
	TcxDBNavigatorDataLink* FDataLink;
	TcxDBNavigatorFilterEvent FOnApplyFilter;
	TcxDBNavigatorFilterEvent FOnShowFilterDialog;
	void __fastcall DoApplyFilter(System::TObject* Sender, Cxdbfiltercontrol::TcxDBFilterControl* AFilterControl);
	void __fastcall DoShowFilterDialog(System::TObject* Sender, Cxdbfiltercontrol::TcxDBFilterControl* AFilterControl);
	TcxDBNavigatorButtons* __fastcall GetButtons(void);
	Db::TDataLink* __fastcall GetDataLink(void);
	Db::TDataSource* __fastcall GetDataSource(void);
	Db::TDataSet* __fastcall GetDataSet(void);
	void __fastcall SetButtons(TcxDBNavigatorButtons* Value);
	void __fastcall SetDataSource(Db::TDataSource* Value);
	void __fastcall SetOnApplyFilter(TcxDBNavigatorFilterEvent Value);
	void __fastcall SetOnShowFilterDialog(TcxDBNavigatorFilterEvent Value);
	
protected:
	virtual Cxnavigator::TcxCustomNavigatorButtons* __fastcall CreateButtons(void);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	virtual void __fastcall DataSetActiveChanged(void);
	virtual void __fastcall DataSetDataChanged(void);
	__property TcxDBNavigatorButtons* Buttons = {read=GetButtons, write=SetButtons};
	__property Db::TDataSource* DataSource = {read=GetDataSource, write=SetDataSource};
	__property TcxDBNavigatorFilterEvent OnApplyFilter = {read=FOnApplyFilter, write=SetOnApplyFilter};
	__property TcxDBNavigatorFilterEvent OnShowFilterDialog = {read=FOnShowFilterDialog, write=SetOnShowFilterDialog};
	
public:
	__fastcall virtual TcxCustomDBNavigator(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxCustomDBNavigator(void);
	__property Db::TDataSet* DataSet = {read=GetDataSet};
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomDBNavigator(HWND ParentWindow) : Cxnavigator::TcxCustomNavigator(ParentWindow) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxDBNavigatorDataLink : public Db::TDataLink 
{
	typedef Db::TDataLink inherited;
	
private:
	TcxCustomDBNavigator* FNavigator;
	
protected:
	virtual void __fastcall EditingChanged(void);
	virtual void __fastcall DataSetChanged(void);
	virtual void __fastcall ActiveChanged(void);
	
public:
	__fastcall TcxDBNavigatorDataLink(TcxCustomDBNavigator* ANavigator);
	__fastcall virtual ~TcxDBNavigatorDataLink(void);
};


typedef void __fastcall (__closure *TcxDBNavigatorButtonsFilterEvent)(System::TObject* Sender, Cxdbfiltercontrol::TcxDBFilterControl* AFilterControl);

typedef Db::TDataLink* __fastcall (__closure *TcxDBNavigatorButtonsGetDataLink)(void);

class PASCALIMPLEMENTATION TcxDBNavigatorButtons : public Cxnavigator::TcxCustomNavigatorButtons 
{
	typedef Cxnavigator::TcxCustomNavigatorButtons inherited;
	
private:
	void *FBookmark;
	Classes::TMemoryStream* FFilterCriteria;
	bool FFilterSetting;
	int FPageSize;
	TcxDBNavigatorButtonsFilterEvent FOnApplyFilter;
	TcxDBNavigatorButtonsGetDataLink FOnGetDataLink;
	TcxDBNavigatorButtonsFilterEvent FOnShowFilterDialog;
	void __fastcall DoApplyFilter(System::TObject* Sender);
	void __fastcall DoShowFilterDialog(System::TObject* Sender);
	Db::TDataLink* __fastcall GetDataLink(void);
	Db::TDataSet* __fastcall GetDataSet(void);
	int __fastcall GetInternalPageSize(void);
	void __fastcall SetBookmark(void * Value);
	void __fastcall SetPageSize(int Value);
	void __fastcall ShowFilter(void);
	
protected:
	virtual void __fastcall DoButtonClick(int ADefaultIndex);
	virtual bool __fastcall GetButtonEnabled(int ADefaultIndex);
	void __fastcall CheckBookmark(void);
	void __fastcall ClearFilterCriteria(void);
	__property void * Bookmark = {read=FBookmark, write=SetBookmark};
	__property Db::TDataLink* DataLink = {read=GetDataLink};
	__property Db::TDataSet* DataSet = {read=GetDataSet};
	__property int InternalPageSize = {read=GetInternalPageSize, nodefault};
	__property TcxDBNavigatorButtonsGetDataLink OnGetDataLink = {read=FOnGetDataLink, write=FOnGetDataLink};
	
public:
	__fastcall virtual TcxDBNavigatorButtons(Cxnavigator::_di_IcxNavigatorOwner ANavigator);
	__fastcall virtual ~TcxDBNavigatorButtons(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual void __fastcall ReleaseBookmark(void);
	
__published:
	__property ConfirmDelete  = {default=1};
	__property Images ;
	__property int PageSize = {read=FPageSize, write=SetPageSize, default=0};
	__property TcxDBNavigatorButtonsFilterEvent OnShowFilterDialog = {read=FOnShowFilterDialog, write=FOnShowFilterDialog};
	__property TcxDBNavigatorButtonsFilterEvent OnApplyFilter = {read=FOnApplyFilter, write=FOnApplyFilter};
	__property First ;
	__property PriorPage ;
	__property Prior ;
	__property Next ;
	__property NextPage ;
	__property Last ;
	__property Insert ;
	__property Delete ;
	__property Edit ;
	__property Post ;
	__property Cancel ;
	__property Refresh ;
	__property SaveBookmark ;
	__property GotoBookmark ;
	__property Filter ;
};


class DELPHICLASS TcxDBNavigator;
class PASCALIMPLEMENTATION TcxDBNavigator : public TcxCustomDBNavigator 
{
	typedef TcxCustomDBNavigator inherited;
	
__published:
	__property Buttons ;
	__property DataSource ;
	__property LookAndFeel ;
	__property OnApplyFilter ;
	__property OnShowFilterDialog ;
	__property Align  = {default=0};
	__property Anchors  = {default=3};
	__property Constraints ;
	__property DragCursor  = {default=-12};
	__property DragKind  = {default=0};
	__property DragMode  = {default=0};
	__property Enabled  = {default=1};
	__property Ctl3D ;
	__property ParentCtl3D  = {default=1};
	__property ParentShowHint  = {default=1};
	__property PopupMenu ;
	__property ShowHint ;
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=0};
	__property Visible  = {default=1};
	__property OnContextPopup ;
	__property OnDblClick ;
	__property OnDragDrop ;
	__property OnDragOver ;
	__property OnEndDock ;
	__property OnEndDrag ;
	__property OnEnter ;
	__property OnExit ;
	__property OnResize ;
	__property OnStartDock ;
	__property OnStartDrag ;
public:
	#pragma option push -w-inl
	/* TcxCustomDBNavigator.Create */ inline __fastcall virtual TcxDBNavigator(Classes::TComponent* AOwner) : TcxCustomDBNavigator(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomDBNavigator.Destroy */ inline __fastcall virtual ~TcxDBNavigator(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxDBNavigator(HWND ParentWindow) : TcxCustomDBNavigator(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxdbnavigator */
using namespace Cxdbnavigator;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxDBNavigator
