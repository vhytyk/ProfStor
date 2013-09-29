// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxGridMenuOperations.pas' rev: 6.00

#ifndef cxGridMenuOperationsHPP
#define cxGridMenuOperationsHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxGridUIHelper.hpp>	// Pascal unit
#include <cxGridPopupMenu.hpp>	// Pascal unit
#include <cxGridCustomPopupMenu.hpp>	// Pascal unit
#include <cxGridTableView.hpp>	// Pascal unit
#include <cxGridCustomView.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Types.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxgridmenuoperations
{
//-- type declarations -------------------------------------------------------
typedef TMetaClass*TcxGridPopupMenuOperationClass;

#pragma option push -b-
enum TcxGridPopupMenuOperationState { pmoDefault, pmoTrue, pmoFalse };
#pragma option pop

typedef bool __fastcall (__closure *TcxGetStateFunc)(void);

class DELPHICLASS TcxGridPopupMenuOperation;
class PASCALIMPLEMENTATION TcxGridPopupMenuOperation : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	bool FBeginGroup;
	TcxGridPopupMenuOperationState FDownState;
	TcxGridPopupMenuOperationState FEnabledState;
	Classes::TNotifyEvent FHandler;
	AnsiString FImageName;
	bool FIsSubMenu;
	Classes::TComponent* FMenuItem;
	Classes::TList* FParams;
	void *FResCaption;
	int FTag;
	TcxGridPopupMenuOperationState FVisibleState;
	Cxgriduihelper::TcxGridOperationHelper* __fastcall GetGridOperationHelper(void);
	Cxgridpopupmenu::TcxGridPopupMenu* __fastcall GetGridPopupMenu(void);
	bool __fastcall GetState(TcxGridPopupMenuOperationState AState, TcxGetStateFunc AGetFunc);
	
protected:
	void __fastcall DoExecute(System::TObject* Sender);
	void __fastcall SetProperties(const Classes::TComponent* AMenuItem, Classes::TNotifyEvent AHandler, bool ABeginGroup = false, bool AIsSubMenu = false);
	virtual AnsiString __fastcall GetCaption();
	virtual bool __fastcall GetDown(void);
	virtual bool __fastcall GetCheckedState(void);
	virtual bool __fastcall GetEnabled(void);
	virtual bool __fastcall GetEnabledState(void);
	virtual bool __fastcall GetVisible(void);
	virtual bool __fastcall GetVisibleState(void);
	__property bool BeginGroup = {read=FBeginGroup, nodefault};
	__property AnsiString Caption = {read=GetCaption};
	__property bool Down = {read=GetCheckedState, nodefault};
	__property bool Enabled = {read=GetEnabledState, nodefault};
	__property bool Visible = {read=GetVisibleState, nodefault};
	__property Cxgriduihelper::TcxGridOperationHelper* GridOperationHelper = {read=GetGridOperationHelper};
	__property Classes::TList* Params = {read=FParams, write=FParams};
	__property void * ResCaption = {read=FResCaption, write=FResCaption};
	__property int Tag = {read=FTag, write=FTag, nodefault};
	__property AnsiString ImageName = {read=FImageName};
	
public:
	__fastcall virtual TcxGridPopupMenuOperation(const Classes::TComponent* AMenuItem);
	/* virtual class method */ virtual TMetaClass* __fastcall GetPopupMenuClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall GetSubOperationClass(TMetaClass* vmt);
	__property TcxGridPopupMenuOperationState DownState = {read=FDownState, write=FDownState, default=0};
	__property TcxGridPopupMenuOperationState EnabledState = {read=FEnabledState, write=FEnabledState, default=0};
	__property TcxGridPopupMenuOperationState VisibleState = {read=FVisibleState, write=FVisibleState, default=0};
	__property Cxgridpopupmenu::TcxGridPopupMenu* GridPopupMenu = {read=GetGridPopupMenu};
	__property Classes::TNotifyEvent Handler = {read=FHandler, write=FHandler};
	__property bool IsSubMenu = {read=FIsSubMenu, nodefault};
	__property Classes::TComponent* MenuItem = {read=FMenuItem};
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridPopupMenuOperation(void) { }
	#pragma option pop
	
};


#pragma pack(push, 4)
struct TcxGridPopupMenuOperationsInfo
{
	TMetaClass*OperationClass;
	int ImageIndex;
} ;
#pragma pack(pop)

typedef TcxGridPopupMenuOperationsInfo *PcxGridPopupMenuOperationsInfo;

class DELPHICLASS TcxGridPopupMenuOperations;
class PASCALIMPLEMENTATION TcxGridPopupMenuOperations : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	PcxGridPopupMenuOperationsInfo operator[](int AIndex) { return Items[AIndex]; }
	
private:
	Classes::TList* FOperationList;
	int __fastcall GetCount(void);
	PcxGridPopupMenuOperationsInfo __fastcall GetItem(int AIndex);
	
public:
	__fastcall virtual TcxGridPopupMenuOperations(void);
	__fastcall virtual ~TcxGridPopupMenuOperations(void);
	void __fastcall RegisterOperation(TMetaClass* AOperationClass, AnsiString AResGlyphName);
	int __fastcall IndexOf(TMetaClass* AItem);
	__property int Count = {read=GetCount, nodefault};
	__property PcxGridPopupMenuOperationsInfo Items[int AIndex] = {read=GetItem/*, default*/};
};


class DELPHICLASS TcxGridTablePopupMenuOperation;
class PASCALIMPLEMENTATION TcxGridTablePopupMenuOperation : public TcxGridPopupMenuOperation 
{
	typedef TcxGridPopupMenuOperation inherited;
	
private:
	Cxgridtableview::TcxGridColumn* __fastcall GetHitColumn(void);
	
public:
	__property Cxgridtableview::TcxGridColumn* HitColumn = {read=GetHitColumn};
public:
	#pragma option push -w-inl
	/* TcxGridPopupMenuOperation.Create */ inline __fastcall virtual TcxGridTablePopupMenuOperation(const Classes::TComponent* AMenuItem) : TcxGridPopupMenuOperation(AMenuItem) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridTablePopupMenuOperation(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE TcxGridPopupMenuOperations* __fastcall cxGridPopupMenuOperations(void);
extern PACKAGE TcxGridPopupMenuOperation* __fastcall cxGetGridPopupMenuOperation(Classes::TComponent* AMenuItem);

}	/* namespace Cxgridmenuoperations */
using namespace Cxgridmenuoperations;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxGridMenuOperations
