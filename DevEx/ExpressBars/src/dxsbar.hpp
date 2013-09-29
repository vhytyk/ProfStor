// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'dxsbar.pas' rev: 6.00

#ifndef dxsbarHPP
#define dxsbarHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <ActnList.hpp>	// Pascal unit
#include <ImgList.hpp>	// Pascal unit
#include <CommCtrl.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <Buttons.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Dxsbar
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TdxSideBarItem;
typedef void __fastcall (__closure *TdxSideBarItemClickEvent)(System::TObject* Sender, TdxSideBarItem* Item);

class DELPHICLASS TdxSideBarItemActionLink;
class DELPHICLASS TdxStoredSideItem;
class DELPHICLASS TdxSideBarStore;
class DELPHICLASS TdxSideBar;
class DELPHICLASS TdxSideBarStoreDesigner;
class PASCALIMPLEMENTATION TdxSideBarStoreDesigner : public Forms::TForm 
{
	typedef Forms::TForm inherited;
	
protected:
	TdxSideBarStore* Store;
	virtual void __fastcall CloseSideBarStoreEditor(void) = 0 ;
	virtual void __fastcall SideBarStoreEditorUpdate(void) = 0 ;
	virtual void __fastcall SideBarStoreEditorUpdateItem(TdxStoredSideItem* AItem) = 0 ;
public:
	#pragma option push -w-inl
	/* TCustomForm.Create */ inline __fastcall virtual TdxSideBarStoreDesigner(Classes::TComponent* AOwner) : Forms::TForm(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual TdxSideBarStoreDesigner(Classes::TComponent* AOwner, int Dummy) : Forms::TForm(AOwner, Dummy) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TdxSideBarStoreDesigner(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TdxSideBarStoreDesigner(HWND ParentWindow) : Forms::TForm(ParentWindow) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TdxSideBarStore : public Classes::TComponent 
{
	typedef Classes::TComponent inherited;
	
private:
	Classes::TList* FList;
	Classes::TList* FBars;
	Classes::TStrings* FCategories;
	Controls::TImageList* FLargeImages;
	Controls::TImageList* FSmallImages;
	Imglist::TChangeLink* FSmallChangeLink;
	Imglist::TChangeLink* FLargeChangeLink;
	int FDefaultLargeImage;
	int FDefaultSmallImage;
	bool FIsCustomizing;
	int __fastcall GetCount(void);
	int __fastcall GetSideBarCount(void);
	TdxStoredSideItem* __fastcall GetItem(int Index);
	TdxSideBar* __fastcall GetSideBar(int Index);
	void __fastcall SetCategories(Classes::TStrings* Value);
	void __fastcall SetDefaultLargeImage(int Value);
	void __fastcall SetDefaultSmallImage(int Value);
	void __fastcall SetLargeImages(Controls::TImageList* Value);
	void __fastcall SetSmallImages(Controls::TImageList* Value);
	void __fastcall DestroyItems(void);
	void __fastcall OnChangeLink(System::TObject* Sender);
	void __fastcall RedrawBars(void);
	void __fastcall RemoveBarItem(TdxStoredSideItem* StoredItem);
	
protected:
	DYNAMIC void __fastcall GetChildren(Classes::TGetChildProc Proc, Classes::TComponent* Root);
	virtual void __fastcall SetName(const AnsiString Value);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	
public:
	TdxSideBarStoreDesigner* Designer;
	__fastcall virtual TdxSideBarStore(Classes::TComponent* AOwner);
	__fastcall virtual ~TdxSideBarStore(void);
	void __fastcall AddItem(TdxStoredSideItem* Item);
	void __fastcall ExchangeItems(TdxStoredSideItem* Item1, TdxStoredSideItem* Item2);
	void __fastcall RemoveItem(TdxStoredSideItem* Item);
	void __fastcall UpdateItem(TdxStoredSideItem* Item);
	int __fastcall GetCountByCategory(AnsiString St);
	TdxStoredSideItem* __fastcall GetItemByCategory(AnsiString St, int Index);
	int __fastcall GetItemsByCategory(AnsiString St, Classes::TList* List);
	void __fastcall Customize(void);
	void __fastcall UpdateEditorItem(TdxStoredSideItem* Item);
	__property int Count = {read=GetCount, nodefault};
	__property bool IsCustomizing = {read=FIsCustomizing, nodefault};
	__property TdxStoredSideItem* Items[int Index] = {read=GetItem};
	__property int SideBarCount = {read=GetSideBarCount, nodefault};
	__property TdxSideBar* SideBars[int Index] = {read=GetSideBar};
	
__published:
	__property Classes::TStrings* Categories = {read=FCategories, write=SetCategories};
	__property int DefaultLargeImage = {read=FDefaultLargeImage, write=SetDefaultLargeImage, nodefault};
	__property int DefaultSmallImage = {read=FDefaultSmallImage, write=SetDefaultSmallImage, nodefault};
	__property Controls::TImageList* LargeImages = {read=FLargeImages, write=SetLargeImages};
	__property Controls::TImageList* SmallImages = {read=FSmallImages, write=SetSmallImages};
};


typedef TMetaClass*TdxSideBarItemActionLinkClass;

class PASCALIMPLEMENTATION TdxStoredSideItem : public Classes::TComponent 
{
	typedef Classes::TComponent inherited;
	
private:
	int FCategory;
	AnsiString FCaption;
	bool FEnabled;
	AnsiString FHint;
	int FLargeImage;
	int FSmallImage;
	TdxSideBarItemClickEvent FOnClick;
	TdxSideBarStore* FStore;
	Menus::TPopupMenu* FPopupMenu;
	bool FAvailableInCustomizeForm;
	TdxSideBarItemActionLink* FActionLink;
	Classes::TBasicAction* __fastcall GetAction(void);
	void __fastcall SetAction(Classes::TBasicAction* Value);
	void __fastcall SetCaption(AnsiString Value);
	void __fastcall SetCategory(int Value);
	void __fastcall SetEnabled(bool Value);
	void __fastcall SetHint(AnsiString Value);
	void __fastcall SetLargeImage(int Value);
	void __fastcall SetSmallImage(int Value);
	void __fastcall SetStore(TdxSideBarStore* Value);
	void __fastcall DoActionChange(System::TObject* Sender);
	bool __fastcall IsCaptionStored(void);
	bool __fastcall IsEnabledStored(void);
	bool __fastcall IsHintStored(void);
	bool __fastcall IsImageIndexStored(void);
	
protected:
	void __fastcall DoClick(System::TObject* Sender, TdxSideBarItem* Item);
	virtual void __fastcall ReadState(Classes::TReader* Reader);
	DYNAMIC void __fastcall SetParentComponent(Classes::TComponent* AParent);
	virtual void __fastcall Loaded(void);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	DYNAMIC void __fastcall ActionChange(System::TObject* Sender, bool CheckDefaults);
	DYNAMIC TMetaClass* __fastcall GetActionLinkClass(void);
	__property TdxSideBarItemActionLink* ActionLink = {read=FActionLink, write=FActionLink};
	
public:
	__fastcall virtual TdxStoredSideItem(Classes::TComponent* AOwner);
	__fastcall virtual ~TdxStoredSideItem(void);
	DYNAMIC Classes::TComponent* __fastcall GetParentComponent(void);
	DYNAMIC bool __fastcall HasParent(void);
	__property bool AvailableInCustomizeForm = {read=FAvailableInCustomizeForm, write=FAvailableInCustomizeForm, nodefault};
	__property TdxSideBarStore* Store = {read=FStore, write=SetStore};
	
__published:
	__property Classes::TBasicAction* Action = {read=GetAction, write=SetAction};
	__property AnsiString Caption = {read=FCaption, write=SetCaption, stored=IsCaptionStored};
	__property int Category = {read=FCategory, write=SetCategory, nodefault};
	__property bool Enabled = {read=FEnabled, write=SetEnabled, stored=IsEnabledStored, nodefault};
	__property AnsiString Hint = {read=FHint, write=SetHint, stored=IsHintStored};
	__property int LargeImage = {read=FLargeImage, write=SetLargeImage, stored=IsImageIndexStored, nodefault};
	__property int SmallImage = {read=FSmallImage, write=SetSmallImage, nodefault};
	__property Menus::TPopupMenu* PopupMenu = {read=FPopupMenu, write=FPopupMenu};
	__property TdxSideBarItemClickEvent OnClick = {read=FOnClick, write=FOnClick};
};


class PASCALIMPLEMENTATION TdxSideBarItemActionLink : public Actnlist::TActionLink 
{
	typedef Actnlist::TActionLink inherited;
	
protected:
	TdxStoredSideItem* FClient;
	virtual void __fastcall AssignClient(System::TObject* AClient);
	virtual bool __fastcall IsCaptionLinked(void);
	virtual bool __fastcall IsEnabledLinked(void);
	virtual bool __fastcall IsHintLinked(void);
	virtual bool __fastcall IsImageIndexLinked(void);
	virtual void __fastcall SetCaption(const AnsiString Value);
	virtual void __fastcall SetEnabled(bool Value);
	virtual void __fastcall SetHint(const AnsiString Value);
	virtual void __fastcall SetImageIndex(int Value);
	virtual void __fastcall SetVisible(bool Value);
public:
	#pragma option push -w-inl
	/* TBasicActionLink.Create */ inline __fastcall virtual TdxSideBarItemActionLink(System::TObject* AClient) : Actnlist::TActionLink(AClient) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TBasicActionLink.Destroy */ inline __fastcall virtual ~TdxSideBarItemActionLink(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxSideBarStoreCustomizeForm;
class PASCALIMPLEMENTATION TdxSideBarStoreCustomizeForm : public Forms::TForm 
{
	typedef Forms::TForm inherited;
	
protected:
	TdxSideBarStore* Store;
	void __fastcall BeginCustomizing(void);
	void __fastcall EndCustomizing(void);
public:
	#pragma option push -w-inl
	/* TCustomForm.Create */ inline __fastcall virtual TdxSideBarStoreCustomizeForm(Classes::TComponent* AOwner) : Forms::TForm(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual TdxSideBarStoreCustomizeForm(Classes::TComponent* AOwner, int Dummy) : Forms::TForm(AOwner, Dummy) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TdxSideBarStoreCustomizeForm(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TdxSideBarStoreCustomizeForm(HWND ParentWindow) : Forms::TForm(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TdxSideGroup;
class PASCALIMPLEMENTATION TdxSideBarItem : public Classes::TCollectionItem 
{
	typedef Classes::TCollectionItem inherited;
	
private:
	AnsiString FCaption;
	bool FIsDefault;
	int FLargeImage;
	int FSmallImage;
	TdxStoredSideItem* FStoredItem;
	AnsiString FCustomData;
	AnsiString FHint;
	System::TObject* FObject;
	int FTag;
	bool FEnabled;
	AnsiString __fastcall GetCaption();
	bool __fastcall GetEnabled(void);
	AnsiString __fastcall GetHint();
	TdxSideGroup* __fastcall GetGroup(void);
	TdxSideBar* __fastcall GetSideBar(void);
	int __fastcall GetLargeImage(void);
	int __fastcall GetSmallImage(void);
	void __fastcall SetCaption(AnsiString Value);
	void __fastcall SetEnabled(bool Value);
	void __fastcall SetHint(AnsiString Value);
	void __fastcall SetIsDefault(bool Value);
	void __fastcall SetLargeImage(int Value);
	void __fastcall SetSmallImage(int Value);
	void __fastcall SetStoredItem(TdxStoredSideItem* Value);
	
public:
	__fastcall virtual TdxSideBarItem(Classes::TCollection* Collection);
	__fastcall virtual ~TdxSideBarItem(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	bool __fastcall MakeVisible(void);
	bool __fastcall IsSelected(void);
	bool __fastcall IsFocused(void);
	bool __fastcall IsFullVisible(void);
	bool __fastcall Visible(void);
	__property bool Enabled = {read=GetEnabled, write=SetEnabled, nodefault};
	__property TdxSideGroup* Group = {read=GetGroup};
	__property TdxSideBar* SideBar = {read=GetSideBar};
	__property System::TObject* ItemObject = {read=FObject, write=FObject};
	
__published:
	__property AnsiString Caption = {read=GetCaption, write=SetCaption};
	__property AnsiString CustomData = {read=FCustomData, write=FCustomData};
	__property AnsiString Hint = {read=GetHint, write=SetHint};
	__property Index ;
	__property bool IsDefault = {read=FIsDefault, write=SetIsDefault, default=1};
	__property int LargeImage = {read=GetLargeImage, write=SetLargeImage, default=-1};
	__property int SmallImage = {read=GetSmallImage, write=SetSmallImage, default=-1};
	__property TdxStoredSideItem* StoredItem = {read=FStoredItem, write=SetStoredItem};
	__property int Tag = {read=FTag, write=FTag, default=0};
};


class DELPHICLASS TdxSideBarItems;
class PASCALIMPLEMENTATION TdxSideBarItems : public Classes::TCollection 
{
	typedef Classes::TCollection inherited;
	
public:
	TdxSideBarItem* operator[](int Index) { return Items[Index]; }
	
private:
	TdxSideGroup* Group;
	TdxSideBar* SideBar;
	HIDESBASE TdxSideBarItem* __fastcall GetItem(int Index);
	HIDESBASE void __fastcall SetItem(int Index, TdxSideBarItem* Value);
	
protected:
	virtual void __fastcall Update(Classes::TCollectionItem* Item);
	
public:
	__fastcall TdxSideBarItems(TdxSideGroup* AOwner);
	HIDESBASE TdxSideBarItem* __fastcall Add(void);
	__property TdxSideBarItem* Items[int Index] = {read=GetItem, write=SetItem/*, default*/};
public:
	#pragma option push -w-inl
	/* TCollection.Destroy */ inline __fastcall virtual ~TdxSideBarItems(void) { }
	#pragma option pop
	
};


#pragma option push -b-
enum TdxSideGroupIconType { dxsgLargeIcon, dxsgSmallIcon };
#pragma option pop

class PASCALIMPLEMENTATION TdxSideGroup : public Classes::TCollectionItem 
{
	typedef Classes::TCollectionItem inherited;
	
private:
	TdxSideBarItems* FItems;
	int FTopVisibleItem;
	AnsiString FCaption;
	TdxSideGroupIconType FIconType;
	bool FIsAssigning;
	bool FVisible;
	int FTag;
	bool FDestroying;
	bool __fastcall GetActive(void);
	int __fastcall GetItemCount(void);
	void __fastcall SetCaption(AnsiString Value);
	void __fastcall SetIconType(TdxSideGroupIconType Value);
	void __fastcall SetItems(TdxSideBarItems* Value);
	void __fastcall SetTopVisibleItem(int Value);
	void __fastcall SetVisible(bool Value);
	
public:
	__fastcall virtual TdxSideGroup(Classes::TCollection* Collection);
	__fastcall virtual ~TdxSideGroup(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	void __fastcall MakeActive(void);
	int __fastcall GetVisibleCount(void);
	TdxSideBar* __fastcall SideBar(void);
	__property bool Active = {read=GetActive, nodefault};
	__property int ItemCount = {read=GetItemCount, nodefault};
	__property int TopVisibleItem = {read=FTopVisibleItem, write=SetTopVisibleItem, nodefault};
	__property int Tag = {read=FTag, write=FTag, nodefault};
	
__published:
	__property AnsiString Caption = {read=FCaption, write=SetCaption};
	__property Index ;
	__property TdxSideGroupIconType IconType = {read=FIconType, write=SetIconType, default=0};
	__property TdxSideBarItems* Items = {read=FItems, write=SetItems};
	__property bool Visible = {read=FVisible, write=SetVisible, default=1};
};


class DELPHICLASS TdxSideGroups;
class PASCALIMPLEMENTATION TdxSideGroups : public Classes::TCollection 
{
	typedef Classes::TCollection inherited;
	
public:
	TdxSideGroup* operator[](int Index) { return Items[Index]; }
	
private:
	TdxSideBar* SideBar;
	HIDESBASE TdxSideGroup* __fastcall GetItem(int Index);
	TdxSideGroup* __fastcall GetVisibleItem(int Index);
	int __fastcall GetVisibleCount(void);
	HIDESBASE void __fastcall SetItem(int Index, TdxSideGroup* Value);
	
protected:
	virtual void __fastcall Update(Classes::TCollectionItem* Item);
	
public:
	__fastcall TdxSideGroups(TdxSideBar* AOwner);
	HIDESBASE TdxSideGroup* __fastcall Add(void);
	__property TdxSideGroup* Items[int Index] = {read=GetItem, write=SetItem/*, default*/};
	__property TdxSideGroup* VisibleItems[int Index] = {read=GetVisibleItem};
	__property int VisibleCount = {read=GetVisibleCount, nodefault};
public:
	#pragma option push -w-inl
	/* TCollection.Destroy */ inline __fastcall virtual ~TdxSideGroups(void) { }
	#pragma option pop
	
};


typedef void __fastcall (__closure *TdxSideBarChangeGroupCaptionEvent)(System::TObject* Sender, TdxSideGroup* Group);

typedef void __fastcall (__closure *TdxSideBarDragDropItemEvent)(System::TObject* Sender, TdxSideBarItem* Source, TdxSideBarItem* Target, bool IsCopy);

typedef void __fastcall (__closure *TdxSideBarDeleteItemEvent)(System::TObject* Sender, TdxSideBarItem* Item);

#pragma option push -b-
enum TdxSideBarFillStyle { bfsNone, bfsHorz, bfsVert };
#pragma option pop

class DELPHICLASS TdxSideBarBackGround;
class PASCALIMPLEMENTATION TdxSideBarBackGround : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	Graphics::TColor FBeginColor;
	Graphics::TColor FEndColor;
	Classes::TNotifyEvent FOnChange;
	TdxSideBarFillStyle FFillStyle;
	int FStep;
	void __fastcall SetBeginColor(Graphics::TColor Value);
	void __fastcall SetEndColor(Graphics::TColor Value);
	void __fastcall SetFillStyle(TdxSideBarFillStyle Value);
	void __fastcall SetStep(int Value);
	void __fastcall DoChange(void);
	
public:
	__fastcall TdxSideBarBackGround(void);
	bool __fastcall IsUsed(void);
	__property Classes::TNotifyEvent OnChange = {read=FOnChange, write=FOnChange};
	
__published:
	__property Graphics::TColor BeginColor = {read=FBeginColor, write=SetBeginColor, default=-2147483631};
	__property Graphics::TColor EndColor = {read=FEndColor, write=SetEndColor, default=-2147483631};
	__property TdxSideBarFillStyle FillStyle = {read=FFillStyle, write=SetFillStyle, default=0};
	__property int Step = {read=FStep, write=SetStep, default=2};
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TdxSideBarBackGround(void) { }
	#pragma option pop
	
};


#pragma option push -b-
enum TdxsbPaintStyle { sbpsStandard, sbpsFlat, sbpsXP, sbpsW2K };
#pragma option pop

class DELPHICLASS TdxSideGroupViewInfo;
class DELPHICLASS TdxSideBarViewInfo;
class DELPHICLASS TdxSideBarPainter;
class DELPHICLASS TdxSideItemViewInfo;
class PASCALIMPLEMENTATION TdxSideBarPainter : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	TdxSideBar* FSideBar;
	TdxSideBarViewInfo* FViewInfo;
	
protected:
	int __fastcall ClientHeight(void);
	int __fastcall ClientWidth(void);
	void __fastcall ExcludeClipRect(const Types::TRect &ARect);
	void __fastcall IntersectClipRect(const Types::TRect &ARect);
	virtual TdxSideBarViewInfo* __fastcall CreateViewInfo(void);
	void __fastcall ScrollGroups(void);
	void __fastcall DrawFillRect(const Types::TRect &ARect);
	void __fastcall DrawGroups(void);
	void __fastcall DrawItems(void);
	virtual void __fastcall DrawBorder(void);
	virtual void __fastcall DrawGroup(TdxSideGroupViewInfo* AGroupViewInfo);
	virtual void __fastcall DrawItem(TdxSideItemViewInfo* AItemViewInfo);
	virtual void __fastcall DrawItemCaption(TdxSideItemViewInfo* AItemViewInfo);
	virtual void __fastcall DrawImageRect(TdxSideItemViewInfo* AItemViewInfo, const Types::TRect &ARect);
	virtual void __fastcall DrawItemImage(TdxSideItemViewInfo* AItemViewInfo);
	virtual void __fastcall DrawItemImageBorder(TdxSideItemViewInfo* AItemViewInfo);
	virtual void __fastcall DrawScrollButtons(void);
	virtual void __fastcall DrawDragDestinationArrow(void);
	
public:
	__fastcall virtual TdxSideBarPainter(TdxSideBar* ASideBar);
	__fastcall virtual ~TdxSideBarPainter(void);
	Graphics::TCanvas* __fastcall Canvas(void);
	HDC __fastcall DC(void);
	void __fastcall NeedRecalViewInfo(void);
	void __fastcall Paint(void);
	void __fastcall InvalidateGroup(TdxSideGroup* AGroup);
	virtual void __fastcall InvalidateItem(TdxSideBarItem* AItem);
	void __fastcall InvalidateItemImage(TdxSideBarItem* AItem);
	virtual void __fastcall InvalidateItemImageBorder(TdxSideBarItem* AItem);
	void __fastcall InvalidateItems(void);
	void __fastcall InvalidateScrollButtons(void);
	virtual bool __fastcall IsGroupFocused(void);
	__property TdxSideBar* SideBar = {read=FSideBar};
	__property TdxSideBarViewInfo* ViewInfo = {read=FViewInfo};
};


typedef TMetaClass*TdxSideItemViewInfoClass;

#pragma option push -b-
enum TdxSideBarDragSourcePosition { sbdspTop, sbdspBottom, sbdspIn };
#pragma option pop

class PASCALIMPLEMENTATION TdxSideBarViewInfo : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	TdxSideBarPainter* FPainter;
	Classes::TList* FGroups;
	Classes::TList* FItems;
	bool FIsReady;
	#pragma pack(push, 1)
	Types::TRect FItemsRect;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect FTopScrollButtonRect;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect FBottomScrollButtonRect;
	#pragma pack(pop)
	
	TdxSideGroupViewInfo* __fastcall GetGroup(int Index);
	TdxSideItemViewInfo* __fastcall GetItem(int Index);
	Types::TRect __fastcall GetItemCorrectedCaptionRect(AnsiString ACaption, const Types::TRect &ARect);
	
protected:
	virtual TdxSideGroupViewInfo* __fastcall CreateGroup(TdxSideGroup* AGroup, const Types::TRect &ARect);
	void __fastcall CreateGroups(void);
	void __fastcall ClearGroups(void);
	virtual TMetaClass* __fastcall GetItemInfoClass(void);
	virtual TdxSideItemViewInfo* __fastcall CreateItem(TdxSideBarItem* AItem, int ATop);
	void __fastcall CreateItems(void);
	void __fastcall ClearItems(void);
	virtual int __fastcall GetGroupHeight(void);
	virtual Types::TRect __fastcall GetPaintRect();
	virtual int __fastcall GetGroupOffSet(void);
	virtual int __fastcall GetImageBorderOffSet(void);
	virtual int __fastcall GetSideBarTopItemSpaceHeight(void);
	TdxSideItemViewInfo* __fastcall GetItemViewInfo(TdxSideBarItem* AItem);
	Types::TRect __fastcall GetItemImageRect(TdxSideBarItem* AItem, int ATop);
	Types::TRect __fastcall GetItemCaptionRect(TdxSideBarItem* AItem, int ATop, const Types::TRect &AImageRect);
	Types::TRect __fastcall GetItemEditRect(TdxSideBarItem* AItem, AnsiString ACaption);
	int __fastcall GetDrawEdgeFlag(void);
	int __fastcall GetItemHeight(void);
	int __fastcall GetLargeImageHeight(void);
	int __fastcall GetLargeImageWidth(void);
	int __fastcall GetSmallImageHeight(void);
	int __fastcall GetSmallImageWidth(void);
	void __fastcall CalcItemsRect(void);
	void __fastcall CalcScrollButtonsRect(void);
	int __fastcall GroupIndexOf(TdxSideGroupViewInfo* AGroup);
	int __fastcall ItemIndexOf(TdxSideItemViewInfo* AItem);
	__property Types::TRect ItemsRect = {read=FItemsRect};
	__property Types::TRect TopScrollButtonRect = {read=FTopScrollButtonRect};
	__property Types::TRect BottomScrollButtonRect = {read=FBottomScrollButtonRect};
	
public:
	__fastcall virtual TdxSideBarViewInfo(TdxSideBarPainter* APainter);
	__fastcall virtual ~TdxSideBarViewInfo(void);
	TdxSideBar* __fastcall SideBar(void);
	void __fastcall Clear(void);
	void __fastcall CalcViewInfo(void);
	void __fastcall Unready(void);
	int __fastcall GroupCount(void);
	int __fastcall ItemCount(void);
	TdxSideGroupViewInfo* __fastcall GetGroupViewInfoByGroup(TdxSideGroup* AGroup);
	TdxSideItemViewInfo* __fastcall GetItemViewInfoByItem(TdxSideBarItem* AItem);
	TdxSideGroupViewInfo* __fastcall ActiveGroupViewInfo(void);
	TdxSideGroupViewInfo* __fastcall GetGroupViewInfoAtPos(const Types::TPoint &p);
	TdxSideGroup* __fastcall GetGroupAtPos(const Types::TPoint &p);
	TdxSideItemViewInfo* __fastcall GetItemViewInfoAtPos(const Types::TPoint &p);
	TdxSideBarItem* __fastcall GetItemAtPos(const Types::TPoint &p);
	TdxSideItemViewInfo* __fastcall GetNearestItemViewInfoAtPost(const Types::TPoint &p, TdxSideBarDragSourcePosition &APosition);
	TdxSideBarItem* __fastcall GetNearestItemAtPost(const Types::TPoint &p, TdxSideBarDragSourcePosition &APosition);
	bool __fastcall IsTopScrollButtonVisible(void);
	bool __fastcall IsBottomScrollButtonVisible(void);
	bool __fastcall IsPtTopScrollButton(const Types::TPoint &pt);
	bool __fastcall IsPtBottomScrollButton(const Types::TPoint &pt);
	__property bool IsReady = {read=FIsReady, nodefault};
	__property TdxSideBarPainter* Painter = {read=FPainter};
	__property TdxSideGroupViewInfo* Groups[int Index] = {read=GetGroup};
	__property TdxSideItemViewInfo* Items[int Index] = {read=GetItem};
};


class PASCALIMPLEMENTATION TdxSideGroupViewInfo : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	TdxSideBarViewInfo* FViewInfo;
	TdxSideGroup* FGroup;
	#pragma pack(push, 1)
	Types::TRect FRect;
	#pragma pack(pop)
	
	AnsiString __fastcall GetCaption();
	TdxSideBarPainter* __fastcall GetPainter(void);
	
public:
	__fastcall TdxSideGroupViewInfo(TdxSideBarViewInfo* AViewInfo, TdxSideGroup* AGroup, const Types::TRect &ARect);
	int __fastcall Index(void);
	__property TdxSideGroup* Group = {read=FGroup};
	__property AnsiString Caption = {read=GetCaption};
	__property TdxSideBarPainter* Painter = {read=GetPainter};
	__property Types::TRect Rect = {read=FRect};
	__property TdxSideBarViewInfo* ViewInfo = {read=FViewInfo};
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxSideGroupViewInfo(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TdxSideItemViewInfo : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	TdxSideBarViewInfo* FViewInfo;
	TdxSideBarItem* FItem;
	#pragma pack(push, 1)
	Types::TRect FImageRect;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect FCaptionRect;
	#pragma pack(pop)
	
	AnsiString __fastcall GetCaption();
	int __fastcall GetImageIndex(void);
	Controls::TImageList* __fastcall GetImageList(void);
	TdxSideBarPainter* __fastcall GetPainter(void);
	
public:
	__fastcall TdxSideItemViewInfo(TdxSideBarViewInfo* AViewInfo, TdxSideBarItem* AItem, const Types::TRect &AImageRect, const Types::TRect &ACaptionRect);
	int __fastcall Index(void);
	bool __fastcall IsPartialVisible(void);
	int __fastcall Bottom(void);
	int __fastcall Top(void);
	Types::TRect __fastcall ImageBorderRect();
	virtual Types::TRect __fastcall ItemBorderRect();
	Types::TRect __fastcall FocusedCaptionRect();
	Types::TRect __fastcall GetItemDragSourceSpace(TdxSideBarDragSourcePosition APosition);
	__property AnsiString Caption = {read=GetCaption};
	__property int ImageIndex = {read=GetImageIndex, nodefault};
	__property Controls::TImageList* ImageList = {read=GetImageList};
	__property TdxSideBarItem* Item = {read=FItem};
	__property TdxSideBarPainter* Painter = {read=GetPainter};
	__property Types::TRect CaptionRect = {read=FCaptionRect};
	__property Types::TRect ImageRect = {read=FImageRect};
	__property TdxSideBarViewInfo* ViewInfo = {read=FViewInfo};
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TdxSideItemViewInfo(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TdxSideBarViewInfoClass;

typedef TMetaClass*TdxSideBarPainterClass;

class PASCALIMPLEMENTATION TdxSideBar : public Extctrls::TCustomPanel 
{
	typedef Extctrls::TCustomPanel inherited;
	
private:
	Controls::TImageList* FLargeImages;
	Controls::TImageList* FSmallImages;
	Imglist::TChangeLink* FSmallChangeLink;
	Imglist::TChangeLink* FLargeChangeLink;
	int FActiveGroupIndex;
	TdxSideGroup* FOldActiveGroup;
	TdxSideGroup* FActiveGroup;
	TdxSideGroups* FGroups;
	TdxSideBarStore* FStore;
	Graphics::TFont* FGroupFont;
	Graphics::TFont* FItemFont;
	TdxSideGroup* FRenameGroup;
	TdxSideBarItem* FRenameItem;
	Stdctrls::TEdit* FRenameEdit;
	bool FCanSelected;
	Controls::THintWindow* FHintWindow;
	bool FHintWindowShowing;
	int FHintTimerID;
	TdxSideBarItem* FSelectedItem;
	TdxSideBarDeleteItemEvent FOnDeleteItem;
	Classes::TNotifyEvent FOnChangeActiveGroup;
	Classes::TNotifyEvent FOnChangeFocusedItem;
	Classes::TNotifyEvent FOnChangeSelectedItem;
	TdxSideBarChangeGroupCaptionEvent FOnChangeGroupCaption;
	int FSpaceHeight;
	int FScrollDelay;
	bool FScrollButtonUpIsDown;
	bool FScrollButtonDownIsDown;
	int FScrollTimerID;
	TdxSideBarItem* FMouseDownItem;
	TdxSideBarItem* FMouseFocusedItem;
	bool FMouseFocusedItemIsDown;
	TdxSideGroup* FMouseFocusedGroup;
	bool FMouseFocusedGroupIsDown;
	TdxSideBarItem* FDestDropItem;
	TdxSideBarDragSourcePosition FDropItemPosition;
	bool FEnableDraging;
	Controls::TDragMode FDragMode;
	#pragma pack(push, 1)
	Types::TPoint FPointDragging;
	#pragma pack(pop)
	
	Menus::TPopupMenu* FGroupPopupMenu;
	Menus::TPopupMenu* FItemPopupMenu;
	bool FTransparentImages;
	Controls::TImageList* FImageList;
	bool FAssignFlag;
	Classes::TNotifyEvent FOnMouseEnter;
	Classes::TNotifyEvent FOnMouseLeave;
	Classes::TNotifyEvent FOnAfterEdit;
	Classes::TNotifyEvent FOnBeforeEdit;
	TdxSideBarDragDropItemEvent FOnDragDropItem;
	TdxSideBarItemClickEvent FOnItemClick;
	Graphics::TPicture* FBkPicture;
	TdxSideBarBackGround* FBkGround;
	TdxsbPaintStyle FPaintStyle;
	AnsiString FRegistryPath;
	bool FStoreInRegistry;
	bool FIsMakingUpdate;
	int FGroupHeightOffSet;
	bool FShowGroups;
	bool FDestroying;
	TdxSideBarPainter* FPainter;
	int __fastcall GetGroupCount(void);
	Controls::THintWindow* __fastcall GetHintWindow(void);
	TdxSideBarPainter* __fastcall GetPainter(void);
	TdxSideBarViewInfo* __fastcall GetViewInfo(void);
	void __fastcall SetActiveGroup(TdxSideGroup* Value);
	void __fastcall SetActiveGroupIndex(int Value);
	void __fastcall SetBkGround(TdxSideBarBackGround* Value);
	void __fastcall SetBkPicture(Graphics::TPicture* Value);
	void __fastcall SetCanSelected(bool Value);
	void __fastcall SetGroupFont(Graphics::TFont* Value);
	void __fastcall SetGroups(TdxSideGroups* Value);
	void __fastcall SetGroupHeightOffSet(int Value);
	void __fastcall SetItemFont(Graphics::TFont* Value);
	void __fastcall SetLargeImages(Controls::TImageList* Value);
	void __fastcall SetSmallImages(Controls::TImageList* Value);
	void __fastcall SetPaintStyle(TdxsbPaintStyle Value);
	void __fastcall SetScrollDelay(int Value);
	void __fastcall SetShowGroups(bool Value);
	void __fastcall SetSpaceHeight(int Value);
	void __fastcall SetStore(TdxSideBarStore* Value);
	void __fastcall SetTransparentImages(bool Value);
	void __fastcall SetDestDropItem(TdxSideBarItem* Value);
	void __fastcall SetDropItemPosition(TdxSideBarDragSourcePosition Value);
	void __fastcall SetDestDropItemandPosition(TdxSideBarItem* AItem, TdxSideBarDragSourcePosition APosition);
	void __fastcall SetMouseFocusedItem(TdxSideBarItem* Item);
	void __fastcall SetSelectedItem(TdxSideBarItem* Item);
	void __fastcall HintActivate(bool AShow);
	TdxSideGroup* __fastcall GetVisibleGroup(int Index);
	int __fastcall GetVisibleIndexByGroup(TdxSideGroup* AGroup);
	TdxSideBarItem* __fastcall GetFocusedItem(int X, int Y);
	int __fastcall GetTopVisibleToMakeItemVisible(TdxSideBarItem* AItem);
	TdxSideItemViewInfo* __fastcall GetDestDropItemViewInfo(void);
	void __fastcall RenameEditExit(System::TObject* Sender);
	void __fastcall DoGroupMouseFocused(TdxSideGroup* Group, bool IsDown);
	void __fastcall DoItemMouseFocused(TdxSideBarItem* Item, bool IsDown);
	void __fastcall DoItemSelected(TdxSideBarItem* Item);
	void __fastcall DoBkPictureChange(System::TObject* Sender);
	HIDESBASE MESSAGE void __fastcall CMMouseLeave(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMMouseEnter(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMEraseBkgnd(Messages::TWMEraseBkgnd &Message);
	HIDESBASE MESSAGE void __fastcall WMSetCursor(Messages::TWMSetCursor &Message);
	HIDESBASE MESSAGE void __fastcall WMSize(Messages::TWMSize &Message);
	void __fastcall OnChangeLink(System::TObject* Sender);
	void __fastcall OnFontChange(System::TObject* Sender);
	
protected:
	virtual void __fastcall Paint(void);
	void __fastcall RepaintAll(void);
	void __fastcall InvalidateGroup(TdxSideGroup* AGroup);
	void __fastcall InvalidateItem(TdxSideBarItem* AItem);
	void __fastcall InvalidateItemImage(TdxSideBarItem* AItem);
	void __fastcall InvalidateItemImageBorder(TdxSideBarItem* AItem);
	void __fastcall InvalidateItems(bool AUpdateCalcInfo);
	void __fastcall InvalidateScrollButtons(void);
	virtual void __fastcall WndProc(Messages::TMessage &Message);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	DYNAMIC void __fastcall MouseDown(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseUp(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseMove(Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall DoItemClick(TdxSideBarItem* Item);
	DYNAMIC void __fastcall DragOver(System::TObject* Source, int X, int Y, Controls::TDragState State, bool &Accept);
	DYNAMIC void __fastcall DoEndDrag(System::TObject* Target, int X, int Y);
	DYNAMIC void __fastcall DoStartDrag(Controls::TDragObject* &DragObject);
	virtual TdxSideBarPainter* __fastcall CreatePainter(void);
	int __fastcall VisibleGroupCount(void);
	__property TdxSideBarItem* DestDropItem = {read=FDestDropItem, write=SetDestDropItem};
	__property TdxSideItemViewInfo* DestDropItemViewInfo = {read=GetDestDropItemViewInfo};
	__property TdxSideBarDragSourcePosition DropItemPosition = {read=FDropItemPosition, write=SetDropItemPosition, nodefault};
	__property Controls::THintWindow* HintWindow = {read=GetHintWindow};
	__property bool MouseFocusedItemIsDown = {read=FMouseFocusedItemIsDown, nodefault};
	__property TdxSideBarPainter* Painter = {read=GetPainter};
	__property TdxSideBarViewInfo* ViewInfo = {read=GetViewInfo};
	__property TdxSideGroup* VisibleGroups[int Index] = {read=GetVisibleGroup};
	
public:
	__property bool IsMakingUpdate = {read=FIsMakingUpdate, write=FIsMakingUpdate, nodefault};
	__fastcall virtual TdxSideBar(Classes::TComponent* AOwner);
	__fastcall virtual ~TdxSideBar(void);
	virtual void __fastcall Loaded(void);
	virtual void __fastcall SetBounds(int ALeft, int ATop, int AWidth, int AHeight);
	/*         class method */ static unsigned __fastcall XPBackgroundColor(TMetaClass* vmt);
	/*         class method */ static unsigned __fastcall XPSelectedItemColor(TMetaClass* vmt);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	TdxSideGroup* __fastcall GetGroupAtPos(const Types::TPoint &p);
	TdxSideBarItem* __fastcall GetItemAtPos(const Types::TPoint &p);
	TdxSideGroup* __fastcall GetPopupGroup(void);
	bool __fastcall IsGroupEditing(void);
	bool __fastcall IsItemEditing(void);
	bool __fastcall IsEditing(void);
	void __fastcall EditGroup(TdxSideGroup* Group);
	void __fastcall EditItem(TdxSideBarItem* Item);
	void __fastcall EndEdit(bool Accept);
	Controls::TImageList* __fastcall GetSmallImages(void);
	Controls::TImageList* __fastcall GetLargeImages(void);
	void __fastcall LoadFromRegistry(AnsiString ARegistryPath);
	void __fastcall SaveToRegistry(AnsiString ARegistryPath);
	__property TdxSideGroup* ActiveGroup = {read=FActiveGroup, write=SetActiveGroup};
	__property Stdctrls::TEdit* EditControl = {read=FRenameEdit};
	__property TdxSideGroup* EditingGroup = {read=FRenameGroup};
	__property TdxSideBarItem* EditingItem = {read=FRenameItem};
	__property TdxSideBarItem* FocusedItem = {read=FMouseFocusedItem};
	__property int GroupCount = {read=GetGroupCount, nodefault};
	__property TdxSideBarItem* SelectedItem = {read=FSelectedItem, write=DoItemSelected};
	
__published:
	__property Align  = {default=3};
	__property TdxSideBarBackGround* BkGround = {read=FBkGround, write=SetBkGround};
	__property Graphics::TPicture* BkPicture = {read=FBkPicture, write=SetBkPicture};
	__property Color  = {default=-2147483631};
	__property bool CanSelected = {read=FCanSelected, write=SetCanSelected, default=0};
	__property Graphics::TFont* GroupFont = {read=FGroupFont, write=SetGroupFont};
	__property TdxSideGroups* Groups = {read=FGroups, write=SetGroups};
	__property int ActiveGroupIndex = {read=FActiveGroupIndex, write=SetActiveGroupIndex, nodefault};
	__property Menus::TPopupMenu* GroupPopupMenu = {read=FGroupPopupMenu, write=FGroupPopupMenu};
	__property int GroupHeightOffSet = {read=FGroupHeightOffSet, write=SetGroupHeightOffSet, default=0};
	__property Graphics::TFont* ItemFont = {read=FItemFont, write=SetItemFont};
	__property Menus::TPopupMenu* ItemPopupMenu = {read=FItemPopupMenu, write=FItemPopupMenu};
	__property Controls::TImageList* LargeImages = {read=FLargeImages, write=SetLargeImages};
	__property TdxsbPaintStyle PaintStyle = {read=FPaintStyle, write=SetPaintStyle, default=1};
	__property Controls::TImageList* SmallImages = {read=FSmallImages, write=SetSmallImages};
	__property int ScrollDelay = {read=FScrollDelay, write=SetScrollDelay, default=300};
	__property int SpaceHeight = {read=FSpaceHeight, write=SetSpaceHeight, default=7};
	__property TdxSideBarStore* Store = {read=FStore, write=SetStore};
	__property bool TransparentImages = {read=FTransparentImages, write=SetTransparentImages, default=0};
	__property AnsiString RegistryPath = {read=FRegistryPath, write=FRegistryPath};
	__property bool ShowGroups = {read=FShowGroups, write=SetShowGroups, default=1};
	__property bool StoreInRegistry = {read=FStoreInRegistry, write=FStoreInRegistry, default=0};
	__property TdxSideBarItemClickEvent OnItemClick = {read=FOnItemClick, write=FOnItemClick};
	__property TdxSideBarDeleteItemEvent OnDeleteItem = {read=FOnDeleteItem, write=FOnDeleteItem};
	__property Classes::TNotifyEvent OnChangeActiveGroup = {read=FOnChangeActiveGroup, write=FOnChangeActiveGroup};
	__property Classes::TNotifyEvent OnChangeFocusedItem = {read=FOnChangeFocusedItem, write=FOnChangeFocusedItem};
	__property TdxSideBarChangeGroupCaptionEvent OnChangeGroupCaption = {read=FOnChangeGroupCaption, write=FOnChangeGroupCaption};
	__property Classes::TNotifyEvent OnChangeSelectedItem = {read=FOnChangeSelectedItem, write=FOnChangeSelectedItem};
	__property BorderStyle  = {default=0};
	__property DragCursor  = {default=-12};
	__property DragMode  = {read=FDragMode, write=FDragMode, default=0};
	__property Enabled  = {default=1};
	__property Ctl3D ;
	__property Locked  = {default=0};
	__property ParentColor  = {default=0};
	__property ParentCtl3D  = {default=1};
	__property ParentShowHint  = {default=1};
	__property ShowHint ;
	__property Visible  = {default=1};
	__property Classes::TNotifyEvent OnAfterEdit = {read=FOnAfterEdit, write=FOnAfterEdit};
	__property Classes::TNotifyEvent OnBeforeEdit = {read=FOnBeforeEdit, write=FOnBeforeEdit};
	__property OnClick ;
	__property OnDblClick ;
	__property OnDragDrop ;
	__property TdxSideBarDragDropItemEvent OnDragDropItem = {read=FOnDragDropItem, write=FOnDragDropItem};
	__property OnDragOver ;
	__property OnEndDrag ;
	__property OnEnter ;
	__property OnExit ;
	__property OnMouseDown ;
	__property Classes::TNotifyEvent OnMouseEnter = {read=FOnMouseEnter, write=FOnMouseEnter};
	__property Classes::TNotifyEvent OnMouseLeave = {read=FOnMouseLeave, write=FOnMouseLeave};
	__property OnMouseMove ;
	__property OnMouseUp ;
	__property OnResize ;
	__property OnStartDrag ;
	__property Anchors  = {default=3};
	__property Constraints ;
	__property OnStartDock ;
	__property OnEndDock ;
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TdxSideBar(HWND ParentWindow) : Extctrls::TCustomPanel(ParentWindow) { }
	#pragma option pop
	
};


#pragma option push -b-
enum TdxSideBarPopupMenuOption { sbmIconType, sbmAddGroup, sbmRemoveGroup, sbmCustomize, sbmRenameGroup, sbmRenameItem, sbmRemoveItem };
#pragma option pop

typedef Set<TdxSideBarPopupMenuOption, sbmIconType, sbmRemoveItem>  TdxSideBarPopupMenuOptions;

class DELPHICLASS TdxSideBarPopupMenu;
class PASCALIMPLEMENTATION TdxSideBarPopupMenu : public Menus::TPopupMenu 
{
	typedef Menus::TPopupMenu inherited;
	
private:
	TdxSideBarPopupMenuOptions FOptions;
	Classes::TList* List;
	TdxSideBar* Bar;
	TdxSideGroup* Group;
	Classes::TNotifyEvent FOnAfterClick;
	Classes::TNotifyEvent FOnPopupClose;
	
protected:
	void __fastcall BarMenuClick(System::TObject* Sender);
	void __fastcall DestroyBarItems(void);
	
public:
	__fastcall virtual TdxSideBarPopupMenu(Classes::TComponent* AOwner);
	__fastcall virtual ~TdxSideBarPopupMenu(void);
	virtual void __fastcall Popup(int X, int Y);
	
__published:
	__property TdxSideBarPopupMenuOptions Options = {read=FOptions, write=FOptions, nodefault};
	__property Classes::TNotifyEvent OnAfterClick = {read=FOnAfterClick, write=FOnAfterClick};
	__property Classes::TNotifyEvent OnPopupClose = {read=FOnPopupClose, write=FOnPopupClose};
};


class DELPHICLASS EdxSideBarError;
class PASCALIMPLEMENTATION EdxSideBarError : public Sysutils::Exception 
{
	typedef Sysutils::Exception inherited;
	
public:
	#pragma option push -w-inl
	/* Exception.Create */ inline __fastcall EdxSideBarError(const AnsiString Msg) : Sysutils::Exception(Msg) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateFmt */ inline __fastcall EdxSideBarError(const AnsiString Msg, const System::TVarRec * Args, const int Args_Size) : Sysutils::Exception(Msg, Args, Args_Size) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateRes */ inline __fastcall EdxSideBarError(int Ident)/* overload */ : Sysutils::Exception(Ident) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResFmt */ inline __fastcall EdxSideBarError(int Ident, const System::TVarRec * Args, const int Args_Size)/* overload */ : Sysutils::Exception(Ident, Args, Args_Size) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateHelp */ inline __fastcall EdxSideBarError(const AnsiString Msg, int AHelpContext) : Sysutils::Exception(Msg, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateFmtHelp */ inline __fastcall EdxSideBarError(const AnsiString Msg, const System::TVarRec * Args, const int Args_Size, int AHelpContext) : Sysutils::Exception(Msg, Args, Args_Size, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResHelp */ inline __fastcall EdxSideBarError(int Ident, int AHelpContext)/* overload */ : Sysutils::Exception(Ident, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResFmtHelp */ inline __fastcall EdxSideBarError(System::PResStringRec ResStringRec, const System::TVarRec * Args, const int Args_Size, int AHelpContext)/* overload */ : Sysutils::Exception(ResStringRec, Args, Args_Size, AHelpContext) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~EdxSideBarError(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxSideBarDragObject;
class PASCALIMPLEMENTATION TdxSideBarDragObject : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	TdxStoredSideItem* FStoredItem;
	TdxSideBarItem* FItem;
	bool FDeleteItem;
	Controls::TDragControlObject* FDragObject;
	bool FCancelDrag;
	
public:
	__fastcall TdxSideBarDragObject(Controls::TControl* Control, Controls::TDragObject* &DragObject, TdxSideBarItem* AItem, TdxStoredSideItem* AStoredItem);
	__fastcall virtual ~TdxSideBarDragObject(void);
	TdxSideBarItem* __fastcall EndDrag(System::TObject* Target, int X, int Y);
	__property bool CancelDrag = {read=FCancelDrag, write=FCancelDrag, nodefault};
	__property bool DeleteItem = {read=FDeleteItem, write=FDeleteItem, nodefault};
	__property TdxSideBarItem* Item = {read=FItem};
	__property TdxStoredSideItem* StoredItem = {read=FStoredItem};
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE TdxSideBarDragObject* dxSideBarDragObject;
extern PACKAGE int dxSideBarGroupScrollStep;
extern PACKAGE int dxSideBarGroupScrollIncrement;
extern PACKAGE int dxSideBarGroupScrollTimeToIncrement;

}	/* namespace Dxsbar */
using namespace Dxsbar;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// dxsbar
