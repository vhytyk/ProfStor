// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxHeader.pas' rev: 6.00

#ifndef cxHeaderHPP
#define cxHeaderHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Menus.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <cxExtEditUtils.hpp>	// Pascal unit
#include <cxExtEditConsts.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxEditUtils.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <cxLookAndFeelPainters.hpp>	// Pascal unit
#include <cxLookAndFeels.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <ImgList.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxheader
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TcxHeaderSortOrder { soNone, soAscending, soDescending };
#pragma option pop

#pragma option push -b-
enum TcxSectionTrackState { tsTrackBegin, tsTrackMove, tsTrackEnd, tsTrackNone };
#pragma option pop

class DELPHICLASS TcxCustomHeader;
class DELPHICLASS TcxHeaderSection;
typedef void __fastcall (__closure *TcxDrawSectionEvent)(TcxCustomHeader* HeaderControl, TcxHeaderSection* Section, const Types::TRect &ARect, bool Pressed);

typedef void __fastcall (__closure *TcxSectionNotifyEvent)(TcxCustomHeader* HeaderControl, TcxHeaderSection* Section);

typedef void __fastcall (__closure *TcxSectionTrackEvent)(TcxCustomHeader* HeaderControl, TcxHeaderSection* Section, int Width, TcxSectionTrackState State);

typedef void __fastcall (__closure *TcxSectionDragEvent)(System::TObject* Sender, TcxHeaderSection* FromSection, TcxHeaderSection* ToSection, bool &AllowDrag);

typedef void __fastcall (__closure *TcxSectionChangingSortOrderEvent)(System::TObject* Sender, const TcxHeaderSection* Section, const TcxHeaderSortOrder AOldSortOrder, TcxHeaderSortOrder &ANewSortOrder, bool &AllowChange);

typedef void __fastcall (__closure *TcxSectionChangedSortOrderEvent)(System::TObject* Sender, const TcxHeaderSection* Section, const TcxHeaderSortOrder ASortOrder);

class PASCALIMPLEMENTATION TcxHeaderSection : public Classes::TCollectionItem 
{
	typedef Classes::TCollectionItem inherited;
	
private:
	AnsiString FText;
	int FWidth;
	Cxexteditconsts::TcxNaturalNumber FMinWidth;
	Cxexteditconsts::TcxNaturalNumber FMaxWidth;
	Classes::TAlignment FAlignment;
	bool FAllowClick;
	bool FAutoSize;
	Imglist::TImageIndex FImageIndex;
	Classes::TBiDiMode FBiDiMode;
	bool FParentBiDiMode;
	TcxHeaderSortOrder FSortOrder;
	int FNativeIndex;
	int __fastcall GetLeft(void);
	int __fastcall GetRight(void);
	bool __fastcall IsBiDiModeStored(void);
	TcxCustomHeader* __fastcall GetHeaderControl(void);
	void __fastcall SetAlignment(Classes::TAlignment Value);
	void __fastcall SetAutoSize(bool Value);
	void __fastcall SetBiDiMode(Classes::TBiDiMode Value);
	void __fastcall SetMaxWidth(Cxexteditconsts::TcxNaturalNumber Value);
	void __fastcall SetMinWidth(Cxexteditconsts::TcxNaturalNumber Value);
	void __fastcall SetParentBiDiMode(bool Value);
	void __fastcall SetText(const AnsiString Value);
	void __fastcall SetWidth(int Value);
	void __fastcall SetImageIndex(const Imglist::TImageIndex Value);
	void __fastcall SetSortOrder(TcxHeaderSortOrder Value);
	
protected:
	virtual AnsiString __fastcall GetDisplayName();
	
public:
	__fastcall virtual TcxHeaderSection(Classes::TCollection* Collection);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	void __fastcall ParentBiDiModeChanged(void);
	bool __fastcall UseRightToLeftAlignment(void);
	bool __fastcall UseRightToLeftReading(void);
	__property int Left = {read=GetLeft, nodefault};
	__property int Right = {read=GetRight, nodefault};
	__property int NativeIndex = {read=FNativeIndex, nodefault};
	__property TcxCustomHeader* HeaderControl = {read=GetHeaderControl};
	
__published:
	__property Classes::TAlignment Alignment = {read=FAlignment, write=SetAlignment, default=0};
	__property bool AllowClick = {read=FAllowClick, write=FAllowClick, default=0};
	__property bool AutoSize = {read=FAutoSize, write=SetAutoSize, default=0};
	__property Classes::TBiDiMode BiDiMode = {read=FBiDiMode, write=SetBiDiMode, stored=IsBiDiModeStored, nodefault};
	__property Imglist::TImageIndex ImageIndex = {read=FImageIndex, write=SetImageIndex, default=-1};
	__property Cxexteditconsts::TcxNaturalNumber MaxWidth = {read=FMaxWidth, write=SetMaxWidth, default=1000};
	__property Cxexteditconsts::TcxNaturalNumber MinWidth = {read=FMinWidth, write=SetMinWidth, default=30};
	__property bool ParentBiDiMode = {read=FParentBiDiMode, write=SetParentBiDiMode, default=1};
	__property TcxHeaderSortOrder SortOrder = {read=FSortOrder, write=SetSortOrder, default=0};
	__property AnsiString Text = {read=FText, write=SetText};
	__property int Width = {read=FWidth, write=SetWidth, default=50};
public:
	#pragma option push -w-inl
	/* TCollectionItem.Destroy */ inline __fastcall virtual ~TcxHeaderSection(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxHeaderSections;
class PASCALIMPLEMENTATION TcxHeaderSections : public Classes::TCollection 
{
	typedef Classes::TCollection inherited;
	
public:
	TcxHeaderSection* operator[](int Index) { return Items[Index]; }
	
private:
	TcxCustomHeader* FHeaderControl;
	Classes::TNotifyEvent FOnSectionAdd;
	Classes::TNotifyEvent FOnSectionDelete;
	HIDESBASE TcxHeaderSection* __fastcall GetItem(int Index);
	HIDESBASE void __fastcall SetItem(int Index, TcxHeaderSection* Value);
	
protected:
	DYNAMIC Classes::TPersistent* __fastcall GetOwner(void);
	virtual void __fastcall Update(Classes::TCollectionItem* Item);
	virtual void __fastcall Notify(Classes::TCollectionItem* Item, Classes::TCollectionNotification Action);
	
public:
	__fastcall TcxHeaderSections(TcxCustomHeader* HeaderControl);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	HIDESBASE void __fastcall Delete(int Index);
	HIDESBASE TcxHeaderSection* __fastcall Add(void);
	HIDESBASE TcxHeaderSection* __fastcall Insert(int Index);
	__property TcxHeaderSection* Items[int Index] = {read=GetItem, write=SetItem/*, default*/};
public:
	#pragma option push -w-inl
	/* TCollection.Destroy */ inline __fastcall virtual ~TcxHeaderSections(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxCustomHeader : public Cxcontrols::TcxControl 
{
	typedef Cxcontrols::TcxControl inherited;
	
private:
	bool FDragReorder;
	int FFromIndex;
	int FToIndex;
	bool FUpdatingSectionOrder;
	bool FSectionDragged;
	bool FMouseOnSizer;
	bool FSectionResize;
	TcxHeaderSections* FSections;
	int FSelectedSection;
	int FTrackedSection;
	Classes::TMemoryStream* FSectionStream;
	Imglist::TCustomImageList* FImages;
	Imglist::TChangeLink* FImageChangeLink;
	TcxSectionNotifyEvent FOnSectionClick;
	TcxSectionNotifyEvent FOnSectionResize;
	TcxSectionNotifyEvent FOnSectionEndResize;
	TcxSectionTrackEvent FOnSectionTrack;
	TcxDrawSectionEvent FOnDrawSection;
	Classes::TNotifyEvent FOnSectionEndDrag;
	TcxSectionDragEvent FOnSectionDrag;
	TcxSectionChangingSortOrderEvent FOnSectionChangingSortOrder;
	TcxSectionChangedSortOrderEvent FOnSectionChangedSortOrder;
	Classes::TNotifyEvent FOnSectionChange;
	#pragma pack(push, 1)
	Types::TPoint FPrevMousePos;
	#pragma pack(pop)
	
	bool FAllowSort;
	bool FResizeUpdate;
	HDC FLineDC;
	bool FLineVisible;
	Graphics::TBrush* FBrush;
	HBRUSH FPrevBrush;
	#pragma pack(push, 1)
	Types::TPoint FLastDrawPointOnMove;
	#pragma pack(pop)
	
	void __fastcall ImageListChange(System::TObject* Sender);
	void __fastcall SetSections(const TcxHeaderSections* Value);
	void __fastcall UpdateSection(int Index);
	void __fastcall UpdateSections(void);
	void __fastcall SetImages(const Imglist::TCustomImageList* Value);
	void __fastcall SetAllowSort(bool Value);
	virtual TMetaClass* __fastcall GetPainterClass(void);
	int __fastcall GetSectionIndexAtPos(int X, int Y);
	void __fastcall PaintDragSection(int X, int Y, int Index);
	HIDESBASE MESSAGE void __fastcall CMBiDiModeChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMMouseEnter(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMMouseLeave(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMLButtonDown(Messages::TWMMouse &Message);
	HIDESBASE MESSAGE void __fastcall WMMouseMove(Messages::TWMMouse &Message);
	HIDESBASE MESSAGE void __fastcall WMLButtonUp(Messages::TWMMouse &Message);
	HIDESBASE MESSAGE void __fastcall WMSize(Messages::TWMSize &Message);
	HIDESBASE MESSAGE void __fastcall WMWindowPosChanged(Messages::TWMWindowPosMsg &Message);
	MESSAGE void __fastcall WMCaptureChanged(Messages::TMessage &Message);
	void __fastcall SectionAddHandler(System::TObject* Sender);
	void __fastcall SectionDeleteHandler(System::TObject* Sender);
	void __fastcall AllocateSplitLineDC(void);
	void __fastcall ReleaseSplitLine(void);
	void __fastcall DrawSplitLine(const Types::TPoint &APoint);
	void __fastcall InitResize(int X, int Y);
	void __fastcall FitToClientWidth(void);
	
protected:
	virtual bool __fastcall DoSectionDrag(TcxHeaderSection* FromSection, TcxHeaderSection* ToSection);
	virtual void __fastcall DoSectionEndDrag(void);
	virtual Types::TRect __fastcall GetSectionRect(int Index);
	virtual TcxHeaderSection* __fastcall CreateSection(void);
	virtual void __fastcall CreateParams(Controls::TCreateParams &Params);
	virtual void __fastcall CreateWnd(void);
	virtual void __fastcall DestroyWnd(void);
	virtual void __fastcall LookAndFeelChanged(Cxlookandfeels::TcxLookAndFeel* Sender, Cxlookandfeels::TcxLookAndFeelValues AChangedValues);
	virtual void __fastcall Notification(Classes::TComponent* ACOmponent, Classes::TOperation Operation);
	DYNAMIC void __fastcall DrawSection(TcxHeaderSection* Section, const Types::TRect &ARect, bool Pressed);
	DYNAMIC void __fastcall DoSectionClickEvent(TcxHeaderSection* Section);
	DYNAMIC void __fastcall DoSectionChangeSortOrderEvent(TcxHeaderSection* Section, bool DisableSort);
	DYNAMIC void __fastcall DoSectionDragEvent(TcxHeaderSection* FromSection, TcxHeaderSection* ToSection, bool &AllowDrag);
	DYNAMIC void __fastcall DoSectionEndDragEvent(void);
	DYNAMIC void __fastcall DoSectionResizeEvent(TcxHeaderSection* Section);
	DYNAMIC void __fastcall DoSectionEndResizeEvent(TcxHeaderSection* Section);
	DYNAMIC void __fastcall DoSectionTrackEvent(TcxHeaderSection* Section, int Width, TcxSectionTrackState State);
	virtual void __fastcall DisableSort(void);
	virtual void __fastcall Paint(void);
	__property bool AllowSort = {read=FAllowSort, write=SetAllowSort, default=1};
	__property bool ResizeUpdate = {read=FResizeUpdate, write=FResizeUpdate, default=1};
	__property TcxSectionChangingSortOrderEvent OnSectionChangingSortOrder = {read=FOnSectionChangingSortOrder, write=FOnSectionChangingSortOrder};
	__property TcxSectionChangedSortOrderEvent OnSectionChangedSortOrder = {read=FOnSectionChangedSortOrder, write=FOnSectionChangedSortOrder};
	__property Classes::TNotifyEvent OnSectionChange = {read=FOnSectionChange, write=FOnSectionChange};
	
public:
	__fastcall virtual TcxCustomHeader(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxCustomHeader(void);
	DYNAMIC void __fastcall FlipChildren(bool AllLevels);
	
__published:
	__property Align  = {default=0};
	__property Anchors  = {default=3};
	__property BiDiMode ;
	__property BorderWidth  = {default=0};
	__property DragCursor  = {default=-12};
	__property DragKind  = {default=0};
	__property DragMode  = {default=0};
	__property bool DragReorder = {read=FDragReorder, write=FDragReorder, default=0};
	__property Enabled  = {default=1};
	__property Imglist::TCustomImageList* Images = {read=FImages, write=SetImages};
	__property Constraints ;
	__property TcxHeaderSections* Sections = {read=FSections, write=SetSections};
	__property LookAndFeel ;
	__property TcxDrawSectionEvent OnDrawSection = {read=FOnDrawSection, write=FOnDrawSection};
	__property TcxSectionNotifyEvent OnSectionClick = {read=FOnSectionClick, write=FOnSectionClick};
	__property TcxSectionDragEvent OnSectionDrag = {read=FOnSectionDrag, write=FOnSectionDrag};
	__property Classes::TNotifyEvent OnSectionEndDrag = {read=FOnSectionEndDrag, write=FOnSectionEndDrag};
	__property TcxSectionNotifyEvent OnSectionResize = {read=FOnSectionResize, write=FOnSectionResize};
	__property TcxSectionNotifyEvent OnSectionEndResize = {read=FOnSectionEndResize, write=FOnSectionEndResize};
	__property TcxSectionTrackEvent OnSectionTrack = {read=FOnSectionTrack, write=FOnSectionTrack};
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomHeader(HWND ParentWindow) : Cxcontrols::TcxControl(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxHeader;
class PASCALIMPLEMENTATION TcxHeader : public TcxCustomHeader 
{
	typedef TcxCustomHeader inherited;
	
private:
	TcxDrawSectionEvent __fastcall GetOnDrawSection();
	TcxSectionNotifyEvent __fastcall GetOnSectionClick();
	TcxSectionNotifyEvent __fastcall GetOnSectionResize();
	TcxSectionNotifyEvent __fastcall GetOnSectionEndResize();
	TcxSectionTrackEvent __fastcall GetOnSectionTrack();
	void __fastcall SetOnDrawSection(const TcxDrawSectionEvent Value);
	void __fastcall SetOnSectionClick(const TcxSectionNotifyEvent Value);
	void __fastcall SetOnSectionResize(const TcxSectionNotifyEvent Value);
	void __fastcall SetOnSectionEndResize(const TcxSectionNotifyEvent Value);
	void __fastcall SetOnSectionTrack(const TcxSectionTrackEvent Value);
	
__published:
	__property Align  = {default=0};
	__property AllowSort  = {default=1};
	__property Anchors  = {default=3};
	__property BiDiMode ;
	__property BorderWidth  = {default=0};
	__property DragCursor  = {default=-12};
	__property DragKind  = {default=0};
	__property DragMode  = {default=0};
	__property Enabled  = {default=1};
	__property Font ;
	__property Images ;
	__property LookAndFeel ;
	__property Color  = {default=-2147483643};
	__property Constraints ;
	__property Sections ;
	__property ShowHint ;
	__property ParentBiDiMode  = {default=1};
	__property ParentFont  = {default=1};
	__property ParentShowHint  = {default=1};
	__property PopupMenu ;
	__property ResizeUpdate  = {default=1};
	__property Visible  = {default=1};
	__property OnContextPopup ;
	__property OnDragDrop ;
	__property OnDragOver ;
	__property TcxDrawSectionEvent OnDrawSection = {read=GetOnDrawSection, write=SetOnDrawSection};
	__property OnEndDock ;
	__property OnEndDrag ;
	__property OnMouseDown ;
	__property OnMouseMove ;
	__property OnMouseUp ;
	__property OnResize ;
	__property TcxSectionNotifyEvent OnSectionClick = {read=GetOnSectionClick, write=SetOnSectionClick};
	__property TcxSectionNotifyEvent OnSectionResize = {read=GetOnSectionResize, write=SetOnSectionResize};
	__property TcxSectionNotifyEvent OnSectionEndResize = {read=GetOnSectionEndResize, write=SetOnSectionEndResize};
	__property TcxSectionTrackEvent OnSectionTrack = {read=GetOnSectionTrack, write=SetOnSectionTrack};
	__property OnSectionDrag ;
	__property OnSectionEndDrag ;
	__property OnSectionChangingSortOrder ;
	__property OnSectionChangedSortOrder ;
	__property OnSectionChange ;
	__property OnStartDock ;
	__property OnStartDrag ;
public:
	#pragma option push -w-inl
	/* TcxCustomHeader.Create */ inline __fastcall virtual TcxHeader(Classes::TComponent* AOwner) : TcxCustomHeader(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomHeader.Destroy */ inline __fastcall virtual ~TcxHeader(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxHeader(HWND ParentWindow) : TcxCustomHeader(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxheader */
using namespace Cxheader;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxHeader
