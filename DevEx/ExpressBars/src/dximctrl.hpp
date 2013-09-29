// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'dximctrl.pas' rev: 6.00

#ifndef dximctrlHPP
#define dximctrlHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Menus.hpp>	// Pascal unit
#include <ImgList.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Dximctrl
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TdxImageAlign { dxliLeft, dxliRight };
#pragma option pop

#pragma option push -b-
enum TVertAlignment { tvaTop, tvaCenter, tvaBottom };
#pragma option pop

typedef void __fastcall (__closure *TdxImageDrawItemEvent)(System::TObject* Sender, int Index, const Types::TRect &Rect);

class DELPHICLASS TdxCustomImageListBox;
class PASCALIMPLEMENTATION TdxCustomImageListBox : public Stdctrls::TCustomListBox 
{
	typedef Stdctrls::TCustomListBox inherited;
	
private:
	Controls::TImageList* FImageList;
	Imglist::TChangeLink* FChangeLink;
	Classes::TAlignment FAlignment;
	TVertAlignment FVertAlignment;
	TdxImageAlign FImageAlign;
	bool FMultiLines;
	int FItemHeight;
	TdxImageDrawItemEvent FOnDrawItem;
	int FDrawEdgeIndex;
	bool FDrawImageOnly;
	AnsiString FDeletedSt;
	int FDeletedIndex;
	Controls::THintWindow* FHintWindow;
	bool FHintWindowShowing;
	int FHintIndex;
	int FItemTextHeight;
	int __fastcall GetImageIndex(int Index);
	AnsiString __fastcall GetValue(int Index);
	void __fastcall SetImageIndex(int Index, int Value);
	void __fastcall SetImageList(Controls::TImageList* Value);
	void __fastcall SetAlignment(Classes::TAlignment Value);
	void __fastcall SetImageAlign(TdxImageAlign Value);
	HIDESBASE void __fastcall SetItemHeight(int Value);
	void __fastcall SetMultiLines(bool Value);
	void __fastcall SetVertAlignment(TVertAlignment Value);
	void __fastcall SetValue(int Index, const AnsiString Value);
	void __fastcall StringsRead(Classes::TReader* Reader);
	void __fastcall StringsWrite(Classes::TWriter* Writer);
	void __fastcall SetInheritedItemHeight(void);
	void __fastcall OnChangeLink(System::TObject* Sender);
	HIDESBASE MESSAGE void __fastcall CMFontChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CNDrawItem(Messages::TWMDrawItem &Message);
	Types::TRect __fastcall GetImageRect(int ItemIndex);
	void __fastcall DrawImageFocus(int Index);
	
protected:
	Classes::TStrings* FStrings;
	virtual void __fastcall DrawItem(int Index, const Types::TRect &Rect, Windows::TOwnerDrawState State);
	virtual void __fastcall DefineProperties(Classes::TFiler* Filer);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	virtual void __fastcall WndProc(Messages::TMessage &Message);
	int __fastcall ValuesIndexOf(AnsiString Text);
	__property Classes::TAlignment Alignment = {read=FAlignment, write=SetAlignment, nodefault};
	__property TdxImageAlign ImageAlign = {read=FImageAlign, write=SetImageAlign, nodefault};
	__property int ItemHeight = {read=FItemHeight, write=SetItemHeight, nodefault};
	__property Controls::TImageList* ImageList = {read=FImageList, write=SetImageList};
	__property bool MultiLines = {read=FMultiLines, write=SetMultiLines, nodefault};
	__property TVertAlignment VertAlignment = {read=FVertAlignment, write=SetVertAlignment, nodefault};
	__property TdxImageDrawItemEvent OnDrawItem = {read=FOnDrawItem, write=FOnDrawItem};
	
public:
	__fastcall virtual TdxCustomImageListBox(Classes::TComponent* AOwner);
	__fastcall virtual ~TdxCustomImageListBox(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	HIDESBASE void __fastcall AddItem(AnsiString St, int ImageIndex);
	void __fastcall InsertItem(int Index, AnsiString St, int ImageIndex);
	void __fastcall ExchangeItems(int Index1, int Index2);
	void __fastcall MoveItem(int CurIndex, int NewIndex);
	__property int ImageIndexes[int Index] = {read=GetImageIndex, write=SetImageIndex};
	__property AnsiString Values[int Index] = {read=GetValue, write=SetValue};
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TdxCustomImageListBox(HWND ParentWindow) : Stdctrls::TCustomListBox(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TdxImageListBox;
class PASCALIMPLEMENTATION TdxImageListBox : public TdxCustomImageListBox 
{
	typedef TdxCustomImageListBox inherited;
	
__published:
	__property Alignment ;
	__property ImageAlign ;
	__property ItemHeight ;
	__property ImageList ;
	__property MultiLines ;
	__property VertAlignment ;
	__property OnDrawItem ;
	__property ExtendedSelect  = {default=1};
	__property MultiSelect  = {default=0};
	__property Align  = {default=0};
	__property BorderStyle  = {default=1};
	__property Color  = {default=-2147483643};
	__property Columns  = {default=0};
	__property Ctl3D ;
	__property DragCursor  = {default=-12};
	__property DragMode  = {default=0};
	__property Enabled  = {default=1};
	__property Font ;
	__property IntegralHeight  = {default=0};
	__property Items ;
	__property ParentColor  = {default=0};
	__property ParentCtl3D  = {default=1};
	__property ParentFont  = {default=1};
	__property ParentShowHint  = {default=1};
	__property PopupMenu ;
	__property ShowHint ;
	__property Sorted  = {default=0};
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=1};
	__property TabWidth  = {default=0};
	__property Visible  = {default=1};
	__property OnClick ;
	__property OnDblClick ;
	__property OnDragDrop ;
	__property OnDragOver ;
	__property OnEndDrag ;
	__property OnEnter ;
	__property OnExit ;
	__property OnKeyDown ;
	__property OnKeyPress ;
	__property OnKeyUp ;
	__property OnMouseDown ;
	__property OnMouseMove ;
	__property OnMouseUp ;
	__property OnStartDrag ;
	__property Anchors  = {default=3};
	__property Constraints ;
	__property OnStartDock ;
	__property OnEndDock ;
public:
	#pragma option push -w-inl
	/* TdxCustomImageListBox.Create */ inline __fastcall virtual TdxImageListBox(Classes::TComponent* AOwner) : TdxCustomImageListBox(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TdxCustomImageListBox.Destroy */ inline __fastcall virtual ~TdxImageListBox(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TdxImageListBox(HWND ParentWindow) : TdxCustomImageListBox(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TdxCustomImageComboBox;
class PASCALIMPLEMENTATION TdxCustomImageComboBox : public Stdctrls::TCustomComboBox 
{
	typedef Stdctrls::TCustomComboBox inherited;
	
private:
	Controls::TImageList* FImageList;
	Imglist::TChangeLink* FChangeLink;
	Classes::TAlignment FAlignment;
	TVertAlignment FVertAlignment;
	TdxImageAlign FImageAlign;
	bool FMultiLines;
	int FItemHeight;
	TdxImageDrawItemEvent FOnDrawItem;
	AnsiString FDeletedSt;
	int FDeletedIndex;
	int __fastcall GetImageIndex(int Index);
	AnsiString __fastcall GetValue(int INdex);
	void __fastcall SetImageIndex(int Index, int Value);
	void __fastcall SetImageList(Controls::TImageList* Value);
	void __fastcall SetAlignment(Classes::TAlignment Value);
	void __fastcall SetImageAlign(TdxImageAlign Value);
	void __fastcall SetInternalItemHeight(int Value);
	void __fastcall SetMultiLines(bool Value);
	void __fastcall SetVertAlignment(TVertAlignment Value);
	void __fastcall SetValue(int Index, const AnsiString Value);
	void __fastcall StringsRead(Classes::TReader* Reader);
	void __fastcall StringsWrite(Classes::TWriter* Writer);
	void __fastcall SetInheritedItemHeight(void);
	void __fastcall OnChangeLink(System::TObject* Sender);
	HIDESBASE MESSAGE void __fastcall CMFontChanged(Messages::TMessage &Message);
	
protected:
	Classes::TStrings* FStrings;
	virtual void __fastcall DrawItem(int Index, const Types::TRect &Rect, Windows::TOwnerDrawState State);
	virtual void __fastcall DefineProperties(Classes::TFiler* Filer);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	virtual void __fastcall WndProc(Messages::TMessage &Message);
	int __fastcall ValuesIndexOf(AnsiString Text);
	__property Classes::TAlignment Alignment = {read=FAlignment, write=SetAlignment, nodefault};
	__property TdxImageAlign ImageAlign = {read=FImageAlign, write=SetImageAlign, nodefault};
	__property int ItemHeight = {read=FItemHeight, write=SetInternalItemHeight, nodefault};
	__property Controls::TImageList* ImageList = {read=FImageList, write=SetImageList};
	__property bool MultiLines = {read=FMultiLines, write=SetMultiLines, nodefault};
	__property TVertAlignment VertAlignment = {read=FVertAlignment, write=SetVertAlignment, nodefault};
	__property TdxImageDrawItemEvent OnDrawItem = {read=FOnDrawItem, write=FOnDrawItem};
	
public:
	__fastcall virtual TdxCustomImageComboBox(Classes::TComponent* AOwner);
	__fastcall virtual ~TdxCustomImageComboBox(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	HIDESBASE void __fastcall AddItem(AnsiString St, int ImageIndex);
	void __fastcall InsertItem(int Index, AnsiString St, int ImageIndex);
	void __fastcall ExchangeItems(int Index1, int Index2);
	void __fastcall MoveItem(int CurIndex, int NewIndex);
	__property AnsiString Values[int Index] = {read=GetValue, write=SetValue};
	__property int ImageIndexes[int Index] = {read=GetImageIndex, write=SetImageIndex};
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TdxCustomImageComboBox(HWND ParentWindow) : Stdctrls::TCustomComboBox(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TdxImageComboBox;
class PASCALIMPLEMENTATION TdxImageComboBox : public TdxCustomImageComboBox 
{
	typedef TdxCustomImageComboBox inherited;
	
__published:
	__property Alignment ;
	__property ImageAlign ;
	__property ItemHeight ;
	__property ImageList ;
	__property MultiLines ;
	__property VertAlignment ;
	__property OnDrawItem ;
	__property Color  = {default=-2147483643};
	__property Ctl3D ;
	__property DragMode  = {default=0};
	__property DragCursor  = {default=-12};
	__property DropDownCount  = {default=8};
	__property Enabled  = {default=1};
	__property Font ;
	__property Items ;
	__property MaxLength  = {default=0};
	__property ParentColor  = {default=0};
	__property ParentCtl3D  = {default=1};
	__property ParentFont  = {default=1};
	__property ParentShowHint  = {default=1};
	__property PopupMenu ;
	__property ShowHint ;
	__property Sorted  = {default=0};
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=1};
	__property Visible  = {default=1};
	__property OnChange ;
	__property OnClick ;
	__property OnDblClick ;
	__property OnDragDrop ;
	__property OnDragOver ;
	__property OnDropDown ;
	__property OnEndDrag ;
	__property OnEnter ;
	__property OnExit ;
	__property OnKeyDown ;
	__property OnKeyPress ;
	__property OnKeyUp ;
	__property OnStartDrag ;
	__property Anchors  = {default=3};
	__property Constraints ;
	__property OnStartDock ;
	__property OnEndDock ;
public:
	#pragma option push -w-inl
	/* TdxCustomImageComboBox.Create */ inline __fastcall virtual TdxImageComboBox(Classes::TComponent* AOwner) : TdxCustomImageComboBox(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TdxCustomImageComboBox.Destroy */ inline __fastcall virtual ~TdxImageComboBox(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TdxImageComboBox(HWND ParentWindow) : TdxCustomImageComboBox(ParentWindow) { }
	#pragma option pop
	
};


#pragma option push -b-
enum TdxUpDownAlign { udaBottom, udaLeft, udaRight, udaTop };
#pragma option pop

#pragma option push -b-
enum TdxHSpinImageAlign { hsiLeft, hsiCenter, hsiRight };
#pragma option pop

#pragma option push -b-
enum TdxVSpinImageAlign { vsiTop, vsiCenter, vsiBottom };
#pragma option pop

class DELPHICLASS TdxSpinImageItem;
class DELPHICLASS TdxSpinImageItems;
class DELPHICLASS TdxCustomSpinImage;
typedef void __fastcall (__closure *TdxSIChange)(System::TObject* Sender, int ItemIndex);

#pragma option push -b-
enum TdxsiOrientation { siHorizontal, siVertical };
#pragma option pop

class PASCALIMPLEMENTATION TdxCustomSpinImage : public Controls::TCustomControl 
{
	typedef Controls::TCustomControl inherited;
	
private:
	bool FAutoSize;
	bool FDefaultImages;
	Forms::TFormBorderStyle FBorderStyle;
	Imglist::TChangeLink* FChangeLink;
	int FItemIndex;
	Controls::TImageList* FImageList;
	TdxHSpinImageAlign FImageHAlign;
	TdxVSpinImageAlign FImageVAlign;
	TdxSpinImageItems* FItems;
	TdxSIChange FOnChange;
	bool FReadOnly;
	bool FUseDblClick;
	bool FStretch;
	TdxUpDownAlign FUpDownAlign;
	TdxsiOrientation FUpDownOrientation;
	int FUpDownWidth;
	int FNCSide;
	bool FUpPress;
	bool FDownPress;
	#pragma pack(push, 1)
	Types::TRect FUpButtonRect;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect FDownButtonRect;
	#pragma pack(pop)
	
	bool FUpButtonEnabled;
	bool FDownButtonEnabled;
	void __fastcall SetInternalAutoSize(bool Value);
	void __fastcall SetBorderStyle(Forms::TBorderStyle Value);
	void __fastcall SetDefaultImages(bool Value);
	void __fastcall SetItemIndex(int Value);
	void __fastcall SetImageList(Controls::TImageList* Value);
	void __fastcall SetImageHAlign(TdxHSpinImageAlign Value);
	void __fastcall SetImageVAlign(TdxVSpinImageAlign Value);
	void __fastcall SetItems(TdxSpinImageItems* Value);
	void __fastcall SetStretch(bool Value);
	void __fastcall SetUpDownAlign(TdxUpDownAlign Value);
	void __fastcall SetUpDownOrientation(TdxsiOrientation Value);
	void __fastcall SetUpDownWidth(int Value);
	HIDESBASE MESSAGE void __fastcall CMEnter(Messages::TWMNoParams &Message);
	HIDESBASE MESSAGE void __fastcall CMExit(Messages::TWMNoParams &Message);
	HIDESBASE MESSAGE void __fastcall CMEnabledChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMLButtonDown(Messages::TWMMouse &Message);
	HIDESBASE MESSAGE void __fastcall WMLButtonDblClk(Messages::TWMMouse &Message);
	MESSAGE void __fastcall WMGetDlgCode(Messages::TWMNoParams &Msg);
	HIDESBASE MESSAGE void __fastcall WMNCCalcSize(Messages::TWMNCCalcSize &Message);
	HIDESBASE MESSAGE void __fastcall WMNCPaint(Messages::TWMNCPaint &Message);
	MESSAGE void __fastcall WMNCLButtonDblClk(Messages::TWMNCHitMessage &Message);
	MESSAGE void __fastcall WMNCMouseDown(Messages::TWMNCHitMessage &Message);
	MESSAGE void __fastcall WMNCMouseUp(Messages::TWMNCHitMessage &Message);
	MESSAGE void __fastcall WMMouseUp(Messages::TWMMouse &Message);
	HIDESBASE MESSAGE void __fastcall WMNCHitTest(Messages::TWMNCHitTest &Message);
	void __fastcall UpDownClick(Word AKey);
	void __fastcall OnChangeLink(System::TObject* Sender);
	void __fastcall MakeAutoSize(void);
	void __fastcall SetNextItem(void);
	bool __fastcall IsLastItem(void);
	void __fastcall UpdateNCRegion(void);
	void __fastcall NCMouseDown(int X, int Y);
	
protected:
	virtual void __fastcall CreateWnd(void);
	virtual void __fastcall CreateParams(Controls::TCreateParams &Params);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	virtual void __fastcall Paint(void);
	virtual void __fastcall Change(void);
	virtual bool __fastcall CanChange(void);
	virtual void __fastcall UpdateItems(void);
	__property bool AutoSize = {read=FAutoSize, write=SetInternalAutoSize, nodefault};
	__property Forms::TBorderStyle BorderStyle = {read=FBorderStyle, write=SetBorderStyle, nodefault};
	__property bool DefaultImages = {read=FDefaultImages, write=SetDefaultImages, nodefault};
	__property TdxHSpinImageAlign ImageHAlign = {read=FImageHAlign, write=SetImageHAlign, nodefault};
	__property TdxVSpinImageAlign ImageVAlign = {read=FImageVAlign, write=SetImageVAlign, nodefault};
	__property int ItemIndex = {read=FItemIndex, write=SetItemIndex, nodefault};
	__property bool ReadOnly = {read=FReadOnly, write=FReadOnly, nodefault};
	__property bool Stretch = {read=FStretch, write=SetStretch, nodefault};
	__property TdxUpDownAlign UpDownAlign = {read=FUpDownAlign, write=SetUpDownAlign, nodefault};
	__property TdxsiOrientation UpDownOrientation = {read=FUpDownOrientation, write=SetUpDownOrientation, nodefault};
	__property int UpDownWidth = {read=FUpDownWidth, write=SetUpDownWidth, nodefault};
	__property bool UseDblClick = {read=FUseDblClick, write=FUseDblClick, nodefault};
	__property TdxSIChange OnChange = {read=FOnChange, write=FOnChange};
	
public:
	__fastcall virtual TdxCustomSpinImage(Classes::TComponent* AOwner);
	__fastcall virtual ~TdxCustomSpinImage(void);
	DYNAMIC void __fastcall KeyDown(Word &Key, Classes::TShiftState Shift);
	DYNAMIC void __fastcall KeyUp(Word &Key, Classes::TShiftState Shift);
	__property Controls::TImageList* ImageList = {read=FImageList, write=SetImageList};
	__property TdxSpinImageItems* Items = {read=FItems, write=SetItems};
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TdxCustomSpinImage(HWND ParentWindow) : Controls::TCustomControl(ParentWindow) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TdxSpinImageItems : public Classes::TCollection 
{
	typedef Classes::TCollection inherited;
	
public:
	TdxSpinImageItem* operator[](int Index) { return Items[Index]; }
	
private:
	TdxCustomSpinImage* Owner;
	HIDESBASE TdxSpinImageItem* __fastcall GetItem(int Index);
	HIDESBASE void __fastcall SetItem(int Index, TdxSpinImageItem* Value);
	
protected:
	virtual void __fastcall Update(Classes::TCollectionItem* Item);
	
public:
	__fastcall TdxSpinImageItems(TdxCustomSpinImage* AOwner);
	HIDESBASE TdxSpinImageItem* __fastcall Add(void);
	int __fastcall IndexOf(AnsiString Value);
	__property TdxSpinImageItem* Items[int Index] = {read=GetItem, write=SetItem/*, default*/};
public:
	#pragma option push -w-inl
	/* TCollection.Destroy */ inline __fastcall virtual ~TdxSpinImageItems(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TdxSpinImageItem : public Classes::TCollectionItem 
{
	typedef Classes::TCollectionItem inherited;
	
private:
	TdxSpinImageItems* Owner;
	int FImageIndex;
	AnsiString FValue;
	AnsiString FHint;
	void __fastcall SetImageIndex(int Value);
	void __fastcall SetValue(AnsiString Value);
	void __fastcall SetHint(AnsiString Value);
	
public:
	__fastcall virtual TdxSpinImageItem(Classes::TCollection* Collection);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	
__published:
	__property int ImageIndex = {read=FImageIndex, write=SetImageIndex, nodefault};
	__property AnsiString Hint = {read=FHint, write=SetHint};
	__property AnsiString Value = {read=FValue, write=SetValue};
public:
	#pragma option push -w-inl
	/* TCollectionItem.Destroy */ inline __fastcall virtual ~TdxSpinImageItem(void) { }
	#pragma option pop
	
};


class DELPHICLASS TdxSpinImage;
class PASCALIMPLEMENTATION TdxSpinImage : public TdxCustomSpinImage 
{
	typedef TdxCustomSpinImage inherited;
	
__published:
	__property AutoSize ;
	__property BorderStyle ;
	__property DefaultImages ;
	__property ImageList ;
	__property ImageHAlign ;
	__property ImageVAlign ;
	__property Items ;
	__property ItemIndex ;
	__property ReadOnly ;
	__property Stretch ;
	__property UpDownAlign ;
	__property UpDownOrientation ;
	__property UpDownWidth ;
	__property UseDblClick ;
	__property OnChange ;
	__property Align  = {default=0};
	__property Color  = {default=-2147483643};
	__property Ctl3D ;
	__property DragCursor  = {default=-12};
	__property DragMode  = {default=0};
	__property Enabled  = {default=1};
	__property Font ;
	__property ParentColor  = {default=0};
	__property ParentCtl3D  = {default=1};
	__property ParentFont  = {default=1};
	__property ParentShowHint  = {default=1};
	__property PopupMenu ;
	__property ShowHint ;
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=1};
	__property Visible  = {default=1};
	__property OnClick ;
	__property OnDblClick ;
	__property OnDragDrop ;
	__property OnDragOver ;
	__property OnEndDrag ;
	__property OnEnter ;
	__property OnExit ;
	__property OnKeyDown ;
	__property OnKeyPress ;
	__property OnKeyUp ;
	__property OnMouseDown ;
	__property OnMouseMove ;
	__property OnMouseUp ;
	__property OnStartDrag ;
	__property Anchors  = {default=3};
	__property Constraints ;
	__property OnStartDock ;
	__property OnEndDock ;
public:
	#pragma option push -w-inl
	/* TdxCustomSpinImage.Create */ inline __fastcall virtual TdxSpinImage(Classes::TComponent* AOwner) : TdxCustomSpinImage(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TdxCustomSpinImage.Destroy */ inline __fastcall virtual ~TdxSpinImage(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TdxSpinImage(HWND ParentWindow) : TdxCustomSpinImage(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Dximctrl */
using namespace Dximctrl;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// dximctrl
