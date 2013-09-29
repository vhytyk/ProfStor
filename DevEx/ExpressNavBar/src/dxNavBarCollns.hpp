// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'dxNavBarCollns.pas' rev: 6.00

#ifndef dxNavBarCollnsHPP
#define dxNavBarCollnsHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Menus.hpp>	// Pascal unit
#include <dxNavBarStyles.hpp>	// Pascal unit
#include <dxNavBarBase.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <ActnList.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Dxnavbarcollns
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TdxNavBarItemLink;
class DELPHICLASS TdxNavBarItem;
class DELPHICLASS TdxNavBarItemActionLink;
class PASCALIMPLEMENTATION TdxNavBarItemActionLink : public Actnlist::TActionLink 
{
	typedef Actnlist::TActionLink inherited;
	
private:
	TdxNavBarItem* FClient;
	
protected:
	virtual void __fastcall AssignClient(System::TObject* AClient);
	virtual bool __fastcall IsCaptionLinked(void);
	virtual bool __fastcall IsEnabledLinked(void);
	virtual bool __fastcall IsHintLinked(void);
	virtual bool __fastcall IsImageIndexLinked(void);
	virtual bool __fastcall IsVisibleLinked(void);
	virtual void __fastcall SetCaption(const AnsiString Value);
	virtual void __fastcall SetEnabled(bool Value);
	virtual void __fastcall SetHint(const AnsiString Value);
	virtual void __fastcall SetImageIndex(int Value);
	virtual void __fastcall SetVisible(bool Value);
public:
	#pragma option push -w-inl
	/* TBasicActionLink.Create */ inline __fastcall virtual TdxNavBarItemActionLink(System::TObject* AClient) : Actnlist::TActionLink(AClient) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TBasicActionLink.Destroy */ inline __fastcall virtual ~TdxNavBarItemActionLink(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TdxNavBarItem : public Dxnavbarbase::TdxNavBarComponentCollectionItem 
{
	typedef Dxnavbarbase::TdxNavBarComponentCollectionItem inherited;
	
private:
	TdxNavBarItemActionLink* FActionLink;
	AnsiString FCaption;
	bool FEnabled;
	AnsiString FHint;
	int FLargeImageIndex;
	int FSmallImageIndex;
	Dxnavbarstyles::TdxNavBarStyleItem* FStyle;
	Dxnavbarstyles::TdxNavBarStyleItem* FStyleDisabled;
	Dxnavbarstyles::TdxNavBarStyleItem* FStyleHotTracked;
	Dxnavbarstyles::TdxNavBarStyleItem* FStylePressed;
	bool FVisible;
	Classes::TNotifyEvent FOnClick;
	Classes::TBasicAction* __fastcall GetAction(void);
	void __fastcall SetAction(Classes::TBasicAction* Value);
	void __fastcall SetCaption(const AnsiString Value);
	void __fastcall SetEnabled(const bool Value);
	void __fastcall SetHint(const AnsiString Value);
	void __fastcall SetLargeImageIndex(const int Value);
	void __fastcall SetSmallImageIndex(const int Value);
	void __fastcall SetStyle(const Dxnavbarstyles::TdxNavBarStyleItem* Value);
	void __fastcall SetStyleDisabled(const Dxnavbarstyles::TdxNavBarStyleItem* Value);
	void __fastcall SetStyleHotTracked(const Dxnavbarstyles::TdxNavBarStyleItem* Value);
	void __fastcall SetStylePressed(const Dxnavbarstyles::TdxNavBarStyleItem* Value);
	void __fastcall SetVisible(const bool Value);
	void __fastcall DoActionChange(System::TObject* Sender);
	bool __fastcall IsCaptionStored(void);
	bool __fastcall IsEnabledStored(void);
	bool __fastcall IsHintStored(void);
	bool __fastcall IsImageIndexStored(void);
	bool __fastcall IsVisibleStored(void);
	
protected:
	virtual void __fastcall Loaded(void);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	virtual void __fastcall ReadState(Classes::TReader* Reader);
	virtual void __fastcall SetName(const AnsiString NewName);
	DYNAMIC void __fastcall SetParentComponent(Classes::TComponent* AParent);
	DYNAMIC void __fastcall ActionChange(System::TObject* Sender, bool CheckDefaults);
	
public:
	__fastcall virtual TdxNavBarItem(Classes::TComponent* AOwner);
	__fastcall virtual ~TdxNavBarItem(void);
	
__published:
	__property Classes::TBasicAction* Action = {read=GetAction, write=SetAction};
	__property AnsiString Caption = {read=FCaption, write=SetCaption, stored=IsCaptionStored};
	__property bool Enabled = {read=FEnabled, write=SetEnabled, stored=IsEnabledStored, nodefault};
	__property AnsiString Hint = {read=FHint, write=SetHint, stored=IsHintStored};
	__property int LargeImageIndex = {read=FLargeImageIndex, write=SetLargeImageIndex, stored=IsImageIndexStored, nodefault};
	__property int SmallImageIndex = {read=FSmallImageIndex, write=SetSmallImageIndex, stored=IsImageIndexStored, nodefault};
	__property Dxnavbarstyles::TdxNavBarStyleItem* Style = {read=FStyle, write=SetStyle};
	__property Dxnavbarstyles::TdxNavBarStyleItem* StyleDisabled = {read=FStyleDisabled, write=SetStyleDisabled};
	__property Dxnavbarstyles::TdxNavBarStyleItem* StyleHotTracked = {read=FStyleHotTracked, write=SetStyleHotTracked};
	__property Dxnavbarstyles::TdxNavBarStyleItem* StylePressed = {read=FStylePressed, write=SetStylePressed};
	__property bool Visible = {read=FVisible, write=SetVisible, stored=IsVisibleStored, nodefault};
	__property Classes::TNotifyEvent OnClick = {read=FOnClick, write=FOnClick};
};


class DELPHICLASS TdxNavBarGroup;
class PASCALIMPLEMENTATION TdxNavBarItemLink : public Classes::TCollectionItem 
{
	typedef Classes::TCollectionItem inherited;
	
private:
	TdxNavBarItem* FItem;
	TdxNavBarGroup* __fastcall GetGroup(void);
	
public:
	__fastcall virtual TdxNavBarItemLink(Classes::TCollection* Collection);
	__fastcall virtual ~TdxNavBarItemLink(void);
	bool __fastcall IsSelected(void);
	__property TdxNavBarGroup* Group = {read=GetGroup};
	
__published:
	__property TdxNavBarItem* Item = {read=FItem, write=FItem};
};


class DELPHICLASS TdxNavBarItemLinks;
class PASCALIMPLEMENTATION TdxNavBarItemLinks : public Classes::TCollection 
{
	typedef Classes::TCollection inherited;
	
public:
	TdxNavBarItemLink* operator[](int Index) { return Items[Index]; }
	
private:
	TdxNavBarGroup* FGroup;
	
protected:
	DYNAMIC Classes::TPersistent* __fastcall GetOwner(void);
	HIDESBASE TdxNavBarItemLink* __fastcall GetItem(int Index);
	HIDESBASE void __fastcall SetItem(int Index, TdxNavBarItemLink* Value);
	virtual void __fastcall Update(Classes::TCollectionItem* Item);
	
public:
	__fastcall TdxNavBarItemLinks(TdxNavBarGroup* AGroup);
	HIDESBASE TdxNavBarItemLink* __fastcall Add(void);
	__property TdxNavBarGroup* Group = {read=FGroup};
	__property TdxNavBarItemLink* Items[int Index] = {read=GetItem, write=SetItem/*, default*/};
public:
	#pragma option push -w-inl
	/* TCollection.Destroy */ inline __fastcall virtual ~TdxNavBarItemLinks(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxNavBarGroupControl;
class PASCALIMPLEMENTATION TdxNavBarGroupControl : public Extctrls::TCustomPanel 
{
	typedef Extctrls::TCustomPanel inherited;
	
private:
	TdxNavBarGroup* FGroup;
	int FGroupIndex;
	int FOriginalHeight;
	int FUpdateLock;
	void __fastcall SetOriginalHeight(const int Value);
	HIDESBASE MESSAGE void __fastcall CMVisibleChanged(Messages::TMessage &Message);
	
protected:
	virtual void __fastcall DefineProperties(Classes::TFiler* Filer);
	void __fastcall ReadOriginalHeight(Classes::TReader* Reader);
	void __fastcall ReadGroupIndex(Classes::TReader* Reader);
	void __fastcall WriteOriginalHeight(Classes::TWriter* Writer);
	void __fastcall WriteGroupIndex(Classes::TWriter* Writer);
	virtual void __fastcall ReadState(Classes::TReader* Reader);
	virtual void __fastcall SetParent(Controls::TWinControl* AParent);
	void __fastcall BeginUpdate(void);
	void __fastcall EndUpdate(void);
	void __fastcall UpdateGroup(void);
	__property TdxNavBarGroup* Group = {read=FGroup, write=FGroup};
	
public:
	__fastcall virtual TdxNavBarGroupControl(Classes::TComponent* AOwner);
	__fastcall virtual ~TdxNavBarGroupControl(void);
	virtual void __fastcall AdjustControl(const Types::TRect &ARect, bool AVisible);
	virtual void __fastcall SetBounds(int ALeft, int ATop, int AWidth, int AHeight);
	__property int OriginalHeight = {read=FOriginalHeight, write=SetOriginalHeight, nodefault};
	
__published:
	__property Alignment  = {default=2};
	__property BiDiMode ;
	__property Caption ;
	__property Color  = {default=-2147483633};
	__property Font ;
	__property ParentBiDiMode  = {default=1};
	__property ParentColor  = {default=0};
	__property ParentFont  = {default=1};
	__property ParentShowHint  = {default=1};
	__property PopupMenu ;
	__property ShowHint ;
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=0};
	__property OnClick ;
	__property OnContextPopup ;
	__property OnDblClick ;
	__property OnEnter ;
	__property OnExit ;
	__property OnMouseDown ;
	__property OnMouseMove ;
	__property OnMouseUp ;
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TdxNavBarGroupControl(HWND ParentWindow) : Extctrls::TCustomPanel(ParentWindow) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TdxNavBarGroup : public Dxnavbarbase::TdxNavBarComponentCollectionItem 
{
	typedef Dxnavbarbase::TdxNavBarComponentCollectionItem inherited;
	
private:
	AnsiString FCaption;
	TdxNavBarGroupControl* FControl;
	bool FExpanded;
	AnsiString FHint;
	int FLargeImageIndex;
	TdxNavBarItemLinks* FLinks;
	bool FLinksUseSmallImages;
	int FSelectedLinkIndex;
	bool FShowAsIconView;
	bool FShowControl;
	bool FShowExpandButton;
	int FSmallImageIndex;
	Dxnavbarstyles::TdxNavBarStyleItem* FStyleBackground;
	Dxnavbarstyles::TdxNavBarStyleItem* FStyleHeader;
	Dxnavbarstyles::TdxNavBarStyleItem* FStyleHeaderActive;
	Dxnavbarstyles::TdxNavBarStyleItem* FStyleHeaderHotTracked;
	Dxnavbarstyles::TdxNavBarStyleItem* FStyleHeaderPressed;
	int FTopVisibleLinkIndex;
	bool FUseControl;
	bool FUseSmallImages;
	bool FVisible;
	Classes::TNotifyEvent FOnClick;
	Classes::TNotifyEvent FOnCollapsed;
	Classes::TNotifyEvent FOnExpanded;
	Classes::TNotifyEvent FOnSelectedLinkChanged;
	Classes::TNotifyEvent FOnTopVisibleLinkChanged;
	int __fastcall GetLinkCount(void);
	TdxNavBarItemLink* __fastcall GetLink(int Index);
	void __fastcall SetCaption(const AnsiString Value);
	void __fastcall SetExpanded(const bool Value);
	void __fastcall SetHint(const AnsiString Value);
	void __fastcall SetLargeImageIndex(const int Value);
	void __fastcall SetLinksUseSmallImages(const bool Value);
	void __fastcall SetSelectedLinkIndex(int Value);
	void __fastcall SetShowAsIconView(const bool Value);
	void __fastcall SetShowControl(const bool Value);
	void __fastcall SetShowExpandButton(const bool Value);
	void __fastcall SetSmallImageIndex(const int Value);
	void __fastcall SetStyleBackground(const Dxnavbarstyles::TdxNavBarStyleItem* Value);
	void __fastcall SetStyleHeader(const Dxnavbarstyles::TdxNavBarStyleItem* Value);
	void __fastcall SetStyleHeaderActive(const Dxnavbarstyles::TdxNavBarStyleItem* Value);
	void __fastcall SetStyleHeaderHotTracked(const Dxnavbarstyles::TdxNavBarStyleItem* Value);
	void __fastcall SetStyleHeaderPressed(const Dxnavbarstyles::TdxNavBarStyleItem* Value);
	void __fastcall SetTopVisibleLinkIndex(int Value);
	void __fastcall SetUseControl(const bool Value);
	void __fastcall SetUseSmallImages(const bool Value);
	void __fastcall SetVisible(const bool Value);
	
protected:
	virtual void __fastcall DefineProperties(Classes::TFiler* Filer);
	virtual void __fastcall Loaded(void);
	void __fastcall ReadLinks(Classes::TReader* Reader);
	void __fastcall WriteLinks(Classes::TWriter* Writer);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	virtual void __fastcall ReadState(Classes::TReader* Reader);
	virtual void __fastcall SetName(const AnsiString NewName);
	DYNAMIC void __fastcall SetParentComponent(Classes::TComponent* AParent);
	DYNAMIC void __fastcall DoExpanded(void);
	DYNAMIC void __fastcall DoCollapsed(void);
	DYNAMIC void __fastcall DoSelectedLinkChanged(void);
	DYNAMIC void __fastcall DoTopVisibleLinkChanged(void);
	virtual void __fastcall CreateControl(void);
	virtual void __fastcall DestroyControl(void);
	void __fastcall LinksChanged(TdxNavBarItemLink* ALink);
	void __fastcall RemoveItemLinks(TdxNavBarItem* AItem);
	
public:
	__fastcall virtual TdxNavBarGroup(Classes::TComponent* AOwner);
	__fastcall virtual ~TdxNavBarGroup(void);
	TdxNavBarItemLink* __fastcall CreateLink(TdxNavBarItem* AItem);
	void __fastcall RemoveLink(int AIndex);
	__property TdxNavBarGroupControl* Control = {read=FControl};
	__property int LinkCount = {read=GetLinkCount, nodefault};
	__property TdxNavBarItemLink* Links[int Index] = {read=GetLink};
	
__published:
	__property AnsiString Caption = {read=FCaption, write=SetCaption};
	__property bool Expanded = {read=FExpanded, write=SetExpanded, nodefault};
	__property AnsiString Hint = {read=FHint, write=SetHint};
	__property int LargeImageIndex = {read=FLargeImageIndex, write=SetLargeImageIndex, default=-1};
	__property bool LinksUseSmallImages = {read=FLinksUseSmallImages, write=SetLinksUseSmallImages, nodefault};
	__property int SelectedLinkIndex = {read=FSelectedLinkIndex, write=SetSelectedLinkIndex, nodefault};
	__property bool ShowAsIconView = {read=FShowAsIconView, write=SetShowAsIconView, nodefault};
	__property bool ShowControl = {read=FShowControl, write=SetShowControl, nodefault};
	__property bool ShowExpandButton = {read=FShowExpandButton, write=SetShowExpandButton, nodefault};
	__property int SmallImageIndex = {read=FSmallImageIndex, write=SetSmallImageIndex, default=-1};
	__property Dxnavbarstyles::TdxNavBarStyleItem* StyleBackground = {read=FStyleBackground, write=SetStyleBackground};
	__property Dxnavbarstyles::TdxNavBarStyleItem* StyleHeaderHotTracked = {read=FStyleHeaderHotTracked, write=SetStyleHeaderHotTracked};
	__property Dxnavbarstyles::TdxNavBarStyleItem* StyleHeader = {read=FStyleHeader, write=SetStyleHeader};
	__property Dxnavbarstyles::TdxNavBarStyleItem* StyleHeaderActive = {read=FStyleHeaderActive, write=SetStyleHeaderActive};
	__property Dxnavbarstyles::TdxNavBarStyleItem* StyleHeaderPressed = {read=FStyleHeaderPressed, write=SetStyleHeaderPressed};
	__property int TopVisibleLinkIndex = {read=FTopVisibleLinkIndex, write=SetTopVisibleLinkIndex, nodefault};
	__property bool UseControl = {read=FUseControl, write=SetUseControl, nodefault};
	__property bool UseSmallImages = {read=FUseSmallImages, write=SetUseSmallImages, nodefault};
	__property bool Visible = {read=FVisible, write=SetVisible, nodefault};
	__property Classes::TNotifyEvent OnClick = {read=FOnClick, write=FOnClick};
	__property Classes::TNotifyEvent OnCollapsed = {read=FOnCollapsed, write=FOnCollapsed};
	__property Classes::TNotifyEvent OnExpanded = {read=FOnExpanded, write=FOnExpanded};
	__property Classes::TNotifyEvent OnSelectedLinkChanged = {read=FOnSelectedLinkChanged, write=FOnSelectedLinkChanged};
	__property Classes::TNotifyEvent OnTopVisibleLinkChanged = {read=FOnTopVisibleLinkChanged, write=FOnTopVisibleLinkChanged};
};


typedef void __fastcall (__closure *TdxNavBarLinksChangeEvent)(System::TObject* Sender, TdxNavBarItemLink* ALink);

class DELPHICLASS TdxNavBarGroups;
class PASCALIMPLEMENTATION TdxNavBarGroups : public Dxnavbarbase::TdxNavBarComponentCollection 
{
	typedef Dxnavbarbase::TdxNavBarComponentCollection inherited;
	
public:
	TdxNavBarGroup* operator[](int Index) { return Items[Index]; }
	
private:
	TdxNavBarLinksChangeEvent FOnLinksChange;
	
protected:
	HIDESBASE TdxNavBarGroup* __fastcall GetItem(int Index);
	HIDESBASE void __fastcall SetItem(int Index, TdxNavBarGroup* Value);
	DYNAMIC void __fastcall DoLinksChanged(TdxNavBarItemLink* ALink);
	
public:
	HIDESBASE TdxNavBarGroup* __fastcall Add(void);
	__property TdxNavBarGroup* Items[int Index] = {read=GetItem, write=SetItem/*, default*/};
	__property TdxNavBarLinksChangeEvent OnLinksChange = {read=FOnLinksChange, write=FOnLinksChange};
public:
	#pragma option push -w-inl
	/* TdxNavBarComponentCollection.Create */ inline __fastcall TdxNavBarGroups(Classes::TComponent* AOwner, TMetaClass* AItemClass) : Dxnavbarbase::TdxNavBarComponentCollection(AOwner, AItemClass) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TdxNavBarComponentCollection.Destroy */ inline __fastcall virtual ~TdxNavBarGroups(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxNavBarItems;
class PASCALIMPLEMENTATION TdxNavBarItems : public Dxnavbarbase::TdxNavBarComponentCollection 
{
	typedef Dxnavbarbase::TdxNavBarComponentCollection inherited;
	
public:
	TdxNavBarItem* operator[](int Index) { return Items[Index]; }
	
protected:
	HIDESBASE TdxNavBarItem* __fastcall GetItem(int Index);
	HIDESBASE void __fastcall SetItem(int Index, TdxNavBarItem* Value);
	
public:
	HIDESBASE TdxNavBarItem* __fastcall Add(void);
	__property TdxNavBarItem* Items[int Index] = {read=GetItem, write=SetItem/*, default*/};
public:
	#pragma option push -w-inl
	/* TdxNavBarComponentCollection.Create */ inline __fastcall TdxNavBarItems(Classes::TComponent* AOwner, TMetaClass* AItemClass) : Dxnavbarbase::TdxNavBarComponentCollection(AOwner, AItemClass) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TdxNavBarComponentCollection.Destroy */ inline __fastcall virtual ~TdxNavBarItems(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Dxnavbarcollns */
using namespace Dxnavbarcollns;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// dxNavBarCollns
