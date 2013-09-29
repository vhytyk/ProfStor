// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxGridLevel.pas' rev: 6.00

#ifndef cxGridLevelHPP
#define cxGridLevelHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxGridCustomTableView.hpp>	// Pascal unit
#include <cxGridCustomView.hpp>	// Pascal unit
#include <cxCustomData.hpp>	// Pascal unit
#include <cxStyles.hpp>	// Pascal unit
#include <cxLookAndFeelPainters.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxgridlevel
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TcxGridDetailTabsPosition { dtpNone, dtpLeft, dtpTop };
#pragma option pop

class DELPHICLASS TcxGridLevelOptions;
class DELPHICLASS TcxGridLevel;
class DELPHICLASS TcxGridLevelStyles;
typedef void __fastcall (__closure *TcxGridLevelGetTabStyleEvent)(TcxGridLevel* Sender, TcxGridLevel* ATabLevel, Cxstyles::TcxStyle* &AStyle);

class PASCALIMPLEMENTATION TcxGridLevelStyles : public Cxstyles::TcxStyles 
{
	typedef Cxstyles::TcxStyles inherited;
	
private:
	TcxGridLevelGetTabStyleEvent FOnGetTabStyle;
	TcxGridLevel* __fastcall GetLevel(void);
	TMetaClass* __fastcall GetLookAndFeelPainter(void);
	
protected:
	virtual void __fastcall Changed(int AIndex);
	virtual void __fastcall GetDefaultViewParams(int Index, void * AData, /* out */ Cxgraphics::TcxViewParams &AParams);
	__property TMetaClass* LookAndFeelPainter = {read=GetLookAndFeelPainter};
	
public:
	__property TcxGridLevel* Level = {read=GetLevel};
	virtual void __fastcall GetTabParams(TcxGridLevel* ATabLevel, /* out */ Cxgraphics::TcxViewParams &AParams);
	
__published:
	__property Cxstyles::TcxStyle* Tab = {read=GetValue, write=SetValue, index=0};
	__property Cxstyles::TcxStyle* TabsBackground = {read=GetValue, write=SetValue, index=1};
	__property TcxGridLevelGetTabStyleEvent OnGetTabStyle = {read=FOnGetTabStyle, write=FOnGetTabStyle};
public:
	#pragma option push -w-inl
	/* TcxCustomStyles.Create */ inline __fastcall virtual TcxGridLevelStyles(Classes::TPersistent* AOwner) : Cxstyles::TcxStyles(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomStyles.Destroy */ inline __fastcall virtual ~TcxGridLevelStyles(void) { }
	#pragma option pop
	
};


typedef void __fastcall (__closure *TcxGridLevelGetGridViewEvent)(TcxGridLevel* Sender, Cxgridcustomtableview::TcxCustomGridRecord* AMasterRecord, Cxgridcustomview::TcxCustomGridView* &AGridView);

typedef TMetaClass*TcxGridLevelClass;

typedef TMetaClass*TcxGridLevelStylesClass;

#pragma option push -b-
enum TcxGridLevelChangeKind { lcName, lcCaption, lcGridView, lcStructure, lcVisibility };
#pragma option pop

class PASCALIMPLEMENTATION TcxGridLevel : public Classes::TComponent 
{
	typedef Classes::TComponent inherited;
	
public:
	TcxGridLevel* operator[](int Index) { return Items[Index]; }
	
private:
	AnsiString FCaption;
	Cxcontrols::TcxControl* FControl;
	Cxcustomdata::TcxCustomDataRelation* FDataRelation;
	Cxgridcustomview::TcxCustomGridView* FGridView;
	Classes::TList* FItems;
	int FMaxDetailHeight;
	TcxGridLevelOptions* FOptions;
	TcxGridLevel* FParent;
	TcxGridLevelStyles* FStyles;
	bool FVisible;
	Classes::TList* FVisibleItems;
	Classes::TNotifyEvent FSubClassEvents;
	TcxGridLevelGetGridViewEvent FOnGetGridView;
	bool __fastcall GetActive(void);
	bool __fastcall GetActuallyVisible(void);
	bool __fastcall GetCanBeVisible(void);
	int __fastcall GetCount(void);
	int __fastcall GetIndex(void);
	bool __fastcall GetIsLoading(void);
	bool __fastcall GetIsMaster(void);
	bool __fastcall GetIsRoot(void);
	bool __fastcall GetIsTop(void);
	TcxGridLevel* __fastcall GetItem(int Index);
	int __fastcall GetLevel(void);
	Cxgridcustomview::TcxCustomGridView* __fastcall GetParentGridView(void);
	int __fastcall GetVisibleCount(void);
	int __fastcall GetVisibleIndex(void);
	TcxGridLevel* __fastcall GetVisibleItem(int Index);
	void __fastcall SetActive(bool Value);
	void __fastcall SetCaption(const AnsiString Value);
	void __fastcall SetGridView(Cxgridcustomview::TcxCustomGridView* Value);
	void __fastcall SetIndex(int Value);
	void __fastcall SetMaxDetailHeight(int Value);
	void __fastcall SetParent(TcxGridLevel* Value);
	void __fastcall SetStyles(TcxGridLevelStyles* Value);
	void __fastcall SetVisible(bool Value);
	void __fastcall AddItem(TcxGridLevel* AItem);
	void __fastcall RemoveItem(TcxGridLevel* AItem);
	void __fastcall ChangeItemIndex(TcxGridLevel* AItem, int Value);
	int __fastcall GetItemIndex(TcxGridLevel* AItem);
	void __fastcall DestroyItems(void);
	void __fastcall RefreshVisibleItemsList(void);
	void __fastcall AddDataRelation(TcxGridLevel* AItem);
	void __fastcall MoveDataRelation(TcxGridLevel* AItem, int AIndex);
	void __fastcall RemoveDataRelation(TcxGridLevel* AItem);
	
protected:
	DYNAMIC void __fastcall GetChildren(Classes::TGetChildProc Proc, Classes::TComponent* Root);
	virtual void __fastcall SetName(const AnsiString NewName);
	DYNAMIC void __fastcall SetParentComponent(Classes::TComponent* Value);
	virtual Cxgridcustomview::TcxCustomGridView* __fastcall CreateLinkObject(Cxcustomdata::TcxCustomDataRelation* ARelation, int ARecordIndex);
	virtual void __fastcall Changed(bool AHardChange = true);
	virtual void __fastcall CheckHeight(int &Value);
	virtual TMetaClass* __fastcall GetItemClass(void);
	virtual TMetaClass* __fastcall GetStylesClass(void);
	virtual void __fastcall ItemVisibleChanged(TcxGridLevel* AItem);
	void __fastcall NotifyControl(TcxGridLevelChangeKind AChangeKind);
	void __fastcall SetupMasterRelation(bool AVisible, bool AIsPattern);
	__property bool IsLoading = {read=GetIsLoading, nodefault};
	__property bool IsRoot = {read=GetIsRoot, nodefault};
	__property Cxgridcustomview::TcxCustomGridView* ParentGridView = {read=GetParentGridView};
	
public:
	__fastcall virtual TcxGridLevel(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxGridLevel(void);
	DYNAMIC Classes::TComponent* __fastcall GetParentComponent(void);
	DYNAMIC bool __fastcall HasParent(void);
	TcxGridLevel* __fastcall Add(void);
	TcxGridLevel* __fastcall GetAvailableItem(void);
	bool __fastcall HasAsChild(TcxGridLevel* ALevel);
	__property bool Active = {read=GetActive, write=SetActive, nodefault};
	__property bool ActuallyVisible = {read=GetActuallyVisible, nodefault};
	__property bool CanBeVisible = {read=GetCanBeVisible, nodefault};
	__property Cxcontrols::TcxControl* Control = {read=FControl, write=FControl};
	__property int Count = {read=GetCount, nodefault};
	__property Cxcustomdata::TcxCustomDataRelation* DataRelation = {read=FDataRelation};
	__property int Index = {read=GetIndex, write=SetIndex, nodefault};
	__property bool IsMaster = {read=GetIsMaster, nodefault};
	__property bool IsTop = {read=GetIsTop, nodefault};
	__property TcxGridLevel* Items[int Index] = {read=GetItem/*, default*/};
	__property int Level = {read=GetLevel, nodefault};
	__property TcxGridLevel* Parent = {read=FParent, write=SetParent};
	__property int VisibleCount = {read=GetVisibleCount, nodefault};
	__property int VisibleIndex = {read=GetVisibleIndex, nodefault};
	__property TcxGridLevel* VisibleItems[int Index] = {read=GetVisibleItem};
	
__published:
	__property AnsiString Caption = {read=FCaption, write=SetCaption};
	__property Cxgridcustomview::TcxCustomGridView* GridView = {read=FGridView, write=SetGridView};
	__property int MaxDetailHeight = {read=FMaxDetailHeight, write=SetMaxDetailHeight, default=0};
	__property TcxGridLevelOptions* Options = {read=FOptions, write=FOptions};
	__property TcxGridLevelStyles* Styles = {read=FStyles, write=SetStyles};
	__property bool Visible = {read=FVisible, write=SetVisible, default=1};
	__property Classes::TNotifyEvent StylesEvents = {read=FSubClassEvents, write=FSubClassEvents};
	__property TcxGridLevelGetGridViewEvent OnGetGridView = {read=FOnGetGridView, write=FOnGetGridView};
};


class PASCALIMPLEMENTATION TcxGridLevelOptions : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	Graphics::TColor FDetailFrameColor;
	int FDetailFrameWidth;
	TcxGridDetailTabsPosition FDetailTabsPosition;
	TcxGridLevel* FLevel;
	void __fastcall SetDetailFrameColor(Graphics::TColor Value);
	void __fastcall SetDetailFrameWidth(int Value);
	void __fastcall SetDetailTabsPosition(TcxGridDetailTabsPosition Value);
	int __fastcall DefaultDetailFrameWidth(void);
	TcxGridDetailTabsPosition __fastcall DefaultDetailTabsPosition(void);
	bool __fastcall IsDetailFrameWidthStored(void);
	bool __fastcall IsDetailTabsPositionStored(void);
	
protected:
	void __fastcall Changed(bool AHardChange = true);
	__property TcxGridLevel* Level = {read=FLevel};
	
public:
	__fastcall virtual TcxGridLevelOptions(TcxGridLevel* ALevel);
	Graphics::TColor __fastcall GetDetailFrameColor(void);
	
__published:
	__property Graphics::TColor DetailFrameColor = {read=FDetailFrameColor, write=SetDetailFrameColor, default=536870912};
	__property int DetailFrameWidth = {read=FDetailFrameWidth, write=SetDetailFrameWidth, stored=IsDetailFrameWidthStored, nodefault};
	__property TcxGridDetailTabsPosition DetailTabsPosition = {read=FDetailTabsPosition, write=SetDetailTabsPosition, stored=IsDetailTabsPositionStored, nodefault};
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxGridLevelOptions(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
static const Shortint cxGridLevelDefaultDetailFrameWidth = 0x1;
#define cxGridLevelDefaultDetailTabsPosition (TcxGridDetailTabsPosition)(0)
static const Shortint cxGridLevelDefaultRootDetailFrameWidth = 0x0;
#define cxGridLevelDefaultRootDetailTabsPosition (TcxGridDetailTabsPosition)(0)
static const Shortint lsFirst = 0x0;
static const Shortint lsTab = 0x0;
static const Shortint lsTabsBackground = 0x1;
static const Shortint lsLast = 0x1;

}	/* namespace Cxgridlevel */
using namespace Cxgridlevel;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxGridLevel
