// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxFontNameComboBox.pas' rev: 6.00

#ifndef cxFontNameComboBoxHPP
#define cxFontNameComboBoxHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Menus.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <cxLookAndFeels.hpp>	// Pascal unit
#include <cxExtEditConsts.hpp>	// Pascal unit
#include <cxExtEditUtils.hpp>	// Pascal unit
#include <cxButtons.hpp>	// Pascal unit
#include <cxVariants.hpp>	// Pascal unit
#include <cxImageComboBox.hpp>	// Pascal unit
#include <cxDropDownEdit.hpp>	// Pascal unit
#include <cxMaskEdit.hpp>	// Pascal unit
#include <cxTextEdit.hpp>	// Pascal unit
#include <cxEditUtils.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <Variants.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Printers.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxfontnamecombobox
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TcxFontType { cxftTTF, cxftRaster, cxftDevice, cxftFixed, cxftSymbol };
#pragma option pop

typedef Set<TcxFontType, cxftTTF, cxftSymbol>  TcxFontTypes;

#pragma option push -b-
enum TcxShowFontIconType { ftiShowInCombo, ftiShowInList };
#pragma option pop

typedef Set<TcxShowFontIconType, ftiShowInCombo, ftiShowInList>  TcxShowFontIconTypes;

#pragma option push -b-
enum TcxMRUFontNameAction { mfaInvalidFontName, mfaNone, mfaMoved, mfaAdded, mfaDeleted };
#pragma option pop

#pragma option push -b-
enum TcxFontPreviewType { cxfpFontName, cxfpCustom, cxfpFullAlphabet };
#pragma option pop

typedef void __fastcall (__closure *TcxDeleteMRUFontEvent)(System::TObject* Sender, const AnsiString DeletedMRUFontName);

class DELPHICLASS TcxMRUFontNameItem;
class PASCALIMPLEMENTATION TcxMRUFontNameItem : public Classes::TCollectionItem 
{
	typedef Classes::TCollectionItem inherited;
	
private:
	AnsiString FFontName;
	void __fastcall SetFontName(const AnsiString Value);
	
public:
	__fastcall virtual TcxMRUFontNameItem(Classes::TCollection* Collection);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	
__published:
	__property AnsiString FontName = {read=FFontName, write=SetFontName};
public:
	#pragma option push -w-inl
	/* TCollectionItem.Destroy */ inline __fastcall virtual ~TcxMRUFontNameItem(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxMRUFontNameItems;
class PASCALIMPLEMENTATION TcxMRUFontNameItems : public Classes::TOwnedCollection 
{
	typedef Classes::TOwnedCollection inherited;
	
public:
	TcxMRUFontNameItem* operator[](int Index) { return Items[Index]; }
	
private:
	TcxMRUFontNameItem* __fastcall GetItems(int Index);
	void __fastcall SetItems(int Index, const TcxMRUFontNameItem* Value);
	
protected:
	virtual void __fastcall Update(Classes::TCollectionItem* Item);
	HIDESBASE TcxMRUFontNameItem* __fastcall Add(void);
	HIDESBASE TcxMRUFontNameItem* __fastcall Insert(int Index);
	virtual TcxMRUFontNameItem* __fastcall AddMRUFontName(const AnsiString AFontName);
	virtual TcxMRUFontNameItem* __fastcall InsertMRUFontName(int Index, const AnsiString AFontName);
	virtual void __fastcall Move(int CurIndex, int NewIndex);
	
public:
	__fastcall TcxMRUFontNameItems(Classes::TPersistent* AOwner, TMetaClass* ItemClass);
	__fastcall virtual ~TcxMRUFontNameItems(void);
	__property TcxMRUFontNameItem* Items[int Index] = {read=GetItems, write=SetItems/*, default*/};
	virtual TcxMRUFontNameItem* __fastcall FindFontName(const AnsiString AFontName);
};


class DELPHICLASS TcxFontLoader;
class PASCALIMPLEMENTATION TcxFontLoader : public Classes::TThread 
{
	typedef Classes::TThread inherited;
	
private:
	TcxFontTypes FFontTypes;
	void __fastcall DoCompleteEvent(void);
	void __fastcall DoDestroyEvent(void);
	
protected:
	virtual void __fastcall Execute(void);
	
public:
	Classes::TNotifyEvent OnCompleteThread;
	Classes::TNotifyEvent OnDestroyThread;
	Classes::TStringList* FontList;
	__fastcall virtual TcxFontLoader(const TcxFontTypes AFontTypes);
	__fastcall virtual ~TcxFontLoader(void);
};


#pragma option push -b-
enum TcxFontButtonType { cxfbtBold, cxfbtItalic, cxfbtUnderline, cxfbtStrikeOut };
#pragma option pop

typedef void __fastcall (__closure *TcxFontButtonClickEvent)(System::TObject* Sender, TcxFontButtonType ButtonType);

class DELPHICLASS TcxFontPreview;
class PASCALIMPLEMENTATION TcxFontPreview : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	Classes::TPersistent* FOwner;
	int FUpdateCount;
	Classes::TNotifyEvent FOnChanged;
	Graphics::TFontStyles FFontStyle;
	bool FModified;
	bool FIsDestroying;
	bool FVisible;
	TcxFontPreviewType FPreviewType;
	AnsiString FPreviewText;
	Classes::TAlignment FAlignment;
	bool FShowEndEllipsis;
	Graphics::TColor FColor;
	bool FWordWrap;
	bool FShowButtons;
	TcxFontButtonClickEvent FOnButtonClick;
	void __fastcall BeginUpdate(void);
	void __fastcall EndUpdate(void);
	bool __fastcall IsDestroying(void);
	void __fastcall SetFontStyle(Graphics::TFontStyles Value);
	void __fastcall SetVisible(bool Value);
	void __fastcall SetPreviewType(TcxFontPreviewType Value);
	void __fastcall SetPreviewText(AnsiString Value);
	void __fastcall SetAlignment(Classes::TAlignment Value);
	void __fastcall SetShowEndEllipsis(bool Value);
	void __fastcall SetColor(Graphics::TColor Value);
	void __fastcall SetWordWrap(bool Value);
	void __fastcall SetShowButtons(bool Value);
	
protected:
	DYNAMIC Classes::TPersistent* __fastcall GetOwner(void);
	virtual void __fastcall Changed(void);
	
public:
	__fastcall virtual TcxFontPreview(Classes::TPersistent* AOwner);
	__fastcall virtual ~TcxFontPreview(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual void __fastcall BeforeDestruction(void);
	
__published:
	__property Graphics::TFontStyles FontStyle = {read=FFontStyle, write=SetFontStyle, default=0};
	__property bool Visible = {read=FVisible, write=SetVisible, default=1};
	__property TcxFontPreviewType PreviewType = {read=FPreviewType, write=SetPreviewType, default=0};
	__property AnsiString PreviewText = {read=FPreviewText, write=SetPreviewText};
	__property Classes::TAlignment Alignment = {read=FAlignment, write=SetAlignment, default=2};
	__property bool ShowButtons = {read=FShowButtons, write=SetShowButtons, default=1};
	__property bool ShowEndEllipsis = {read=FShowEndEllipsis, write=SetShowEndEllipsis, default=1};
	__property Graphics::TColor Color = {read=FColor, write=SetColor, default=-2147483643};
	__property bool WordWrap = {read=FWordWrap, write=SetWordWrap, default=0};
	__property TcxFontButtonClickEvent OnButtonClick = {read=FOnButtonClick, write=FOnButtonClick};
};


class DELPHICLASS TcxFontPanelButton;
class PASCALIMPLEMENTATION TcxFontPanelButton : public Cxbuttons::TcxButton 
{
	typedef Cxbuttons::TcxButton inherited;
	
protected:
	virtual void __fastcall WndProc(Messages::TMessage &Message);
public:
	#pragma option push -w-inl
	/* TcxCustomButton.Create */ inline __fastcall virtual TcxFontPanelButton(Classes::TComponent* AOwner) : Cxbuttons::TcxButton(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomButton.Destroy */ inline __fastcall virtual ~TcxFontPanelButton(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxFontPanelButton(HWND ParentWindow) : Cxbuttons::TcxButton(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TFontPreviewPanel;
class PASCALIMPLEMENTATION TFontPreviewPanel : public Controls::TCustomControl 
{
	typedef Controls::TCustomControl inherited;
	
private:
	bool FLocked;
	Cxgraphics::TcxCanvas* FcxCanvas;
	Graphics::TFontStyles FFontStyle;
	Classes::TAlignment FAlignment;
	bool FShowEndEllipsis;
	Cxgraphics::TcxBorders FEdges;
	Graphics::TColor FBorderColor;
	AnsiString FFontName;
	bool FWordWrap;
	bool FShowButtons;
	Cxlookandfeels::TcxLookAndFeel* FLookAndFeel;
	TcxFontPanelButton* FBoldButton;
	TcxFontPanelButton* FItalicButton;
	TcxFontPanelButton* FUnderLineButton;
	TcxFontPanelButton* FStrikeOutButton;
	void __fastcall SetLocked(bool Value);
	void __fastcall SetAlignment(Classes::TAlignment Value);
	void __fastcall SetShowEndEllipsis(bool Value);
	void __fastcall SetEdges(Cxgraphics::TcxBorders Value);
	void __fastcall SetFontName(AnsiString Value);
	void __fastcall SetFontStyle(Graphics::TFontStyles Value);
	void __fastcall SetWordWrap(bool Value);
	void __fastcall SetShowButtons(bool Value);
	void __fastcall SetLookAndFeel(Cxlookandfeels::TcxLookAndFeel* Value);
	int __fastcall GetTextFlag(const int AStartFlag);
	void __fastcall CreateButtons(void);
	void __fastcall SetFontStyleButtonsState(void);
	void __fastcall FontButtonsClickHandler(System::TObject* Sender);
	
protected:
	TcxFontPreview* FontPreview;
	virtual void __fastcall Paint(void);
	virtual void __fastcall CalculateFont(const Types::TRect &ARect);
	virtual Graphics::TFontStyles __fastcall CalculateFontStyle(void);
	__property Cxgraphics::TcxCanvas* cxCanvas = {read=FcxCanvas, write=FcxCanvas};
	__property bool Locked = {read=FLocked, write=SetLocked, default=0};
	
public:
	__property Graphics::TColor BorderColor = {read=FBorderColor, write=FBorderColor, nodefault};
	__property Color  = {default=-2147483643};
	__property Classes::TAlignment Alignment = {read=FAlignment, write=SetAlignment, default=2};
	__property bool ShowEndEllipsis = {read=FShowEndEllipsis, write=SetShowEndEllipsis, default=1};
	__property Cxgraphics::TcxBorders Edges = {read=FEdges, write=SetEdges, default=15};
	__property Graphics::TFontStyles FontStyle = {read=FFontStyle, write=SetFontStyle, default=0};
	__property AnsiString FontName = {read=FFontName, write=SetFontName};
	__property bool WordWrap = {read=FWordWrap, write=SetWordWrap, default=0};
	__property bool ShowButtons = {read=FShowButtons, write=SetShowButtons, default=1};
	__property Cxlookandfeels::TcxLookAndFeel* LookAndFeel = {read=FLookAndFeel, write=SetLookAndFeel};
	__fastcall virtual TFontPreviewPanel(Classes::TComponent* AOwner);
	__fastcall virtual ~TFontPreviewPanel(void);
	void __fastcall RealignButtons(void);
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TFontPreviewPanel(HWND ParentWindow) : Controls::TCustomControl(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomFontNameComboBoxViewInfo;
class PASCALIMPLEMENTATION TcxCustomFontNameComboBoxViewInfo : public Cxtextedit::TcxCustomTextEditViewInfo 
{
	typedef Cxtextedit::TcxCustomTextEditViewInfo inherited;
	
private:
	int FCurrentIndex;
	bool FIsTrueTypeFont;
	#pragma pack(push, 1)
	Types::TRect ImageRect;
	#pragma pack(pop)
	
	TcxShowFontIconTypes FShowFontTypeIcon;
	
protected:
	#pragma pack(push, 1)
	Types::TRect SaveClient;
	#pragma pack(pop)
	
	__property bool IsTrueTypeFont = {read=FIsTrueTypeFont, write=FIsTrueTypeFont, nodefault};
	__property TcxShowFontIconTypes ShowFontTypeIcon = {read=FShowFontTypeIcon, write=FShowFontTypeIcon, nodefault};
	
public:
	virtual void __fastcall Paint(Cxgraphics::TcxCanvas* ACanvas);
	virtual void __fastcall Offset(int DX, int DY);
public:
	#pragma option push -w-inl
	/* TcxCustomTextEditViewInfo.Destroy */ inline __fastcall virtual ~TcxCustomFontNameComboBoxViewInfo(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomEditViewInfo.Create */ inline __fastcall virtual TcxCustomFontNameComboBoxViewInfo(void) : Cxtextedit::TcxCustomTextEditViewInfo() { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomFontNameComboBoxViewData;
class PASCALIMPLEMENTATION TcxCustomFontNameComboBoxViewData : public Cxdropdownedit::TcxCustomDropDownEditViewData 
{
	typedef Cxdropdownedit::TcxCustomDropDownEditViewData inherited;
	
public:
	virtual bool __fastcall IsComboBoxStyle(void);
	virtual void __fastcall Calculate(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ABounds, const Types::TPoint &P, Cxcontainer::TcxMouseButton Button, Classes::TShiftState Shift, Cxedit::TcxCustomEditViewInfo* AViewInfo, bool AIsMouseEvent);
	virtual void __fastcall DisplayValueToDrawValue(const Variant &ADisplayValue, Cxedit::TcxCustomEditViewInfo* AViewInfo);
	virtual void __fastcall EditValueToDrawValue(Cxgraphics::TcxCanvas* ACanvas, const Variant &AEditValue, Cxedit::TcxCustomEditViewInfo* AViewInfo);
	virtual tagSIZE __fastcall GetEditContentSize(Cxgraphics::TcxCanvas* ACanvas, const Variant &AEditValue, const Cxedit::TcxEditSizeProperties &AEditSizeProperties);
public:
	#pragma option push -w-inl
	/* TcxCustomEditViewData.Create */ inline __fastcall virtual TcxCustomFontNameComboBoxViewData(Cxedit::TcxCustomEditProperties* AProperties, Cxcontainer::TcxContainerStyle* AStyle, bool AIsInplace) : Cxdropdownedit::TcxCustomDropDownEditViewData(AProperties, AStyle, AIsInplace) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxCustomFontNameComboBoxViewData(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFontNameComboBoxListBox;
class DELPHICLASS TcxCustomFontNameComboBox;
class PASCALIMPLEMENTATION TcxFontNameComboBoxListBox : public Cxtextedit::TcxCustomEditListBox 
{
	typedef Cxtextedit::TcxCustomEditListBox inherited;
	
private:
	TcxCustomFontNameComboBox* __fastcall GetEdit(void);
	
protected:
	TcxCustomFontNameComboBox* FEdit;
	virtual bool __fastcall DoDrawItem(int AIndex, const Types::TRect &ARect, Windows::TOwnerDrawState AState);
	virtual int __fastcall GetHeight(int ARowCount, int AMaxHeight);
	virtual AnsiString __fastcall GetItem(int Index);
	virtual int __fastcall GetItemHeight(int AIndex = 0xffffffff);
	DYNAMIC void __fastcall MouseMove(Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseUp(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall DrawItem(int Index, const Types::TRect &Rect, Windows::TOwnerDrawState State);
	virtual void __fastcall MeasureItem(int Index, int &Height);
	__property TcxCustomFontNameComboBox* Edit = {read=GetEdit};
public:
	#pragma option push -w-inl
	/* TcxCustomEditListBox.Create */ inline __fastcall virtual TcxFontNameComboBoxListBox(Classes::TComponent* AOwner) : Cxtextedit::TcxCustomEditListBox(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomInnerListBox.Destroy */ inline __fastcall virtual ~TcxFontNameComboBoxListBox(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxFontNameComboBoxListBox(HWND ParentWindow) : Cxtextedit::TcxCustomEditListBox(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFontNameComboBoxLookupData;
class PASCALIMPLEMENTATION TcxFontNameComboBoxLookupData : public Cxdropdownedit::TcxComboBoxLookupData 
{
	typedef Cxdropdownedit::TcxComboBoxLookupData inherited;
	
private:
	TFontPreviewPanel* FPanel;
	int FDefaultPreviewHeight;
	AnsiString __fastcall GetFontName();
	AnsiString __fastcall GetPreviewText();
	
protected:
	virtual TMetaClass* __fastcall GetListBoxClass(void);
	virtual void __fastcall InternalChangeCurrentMRUFontNamePosition(void);
	
public:
	__fastcall virtual TcxFontNameComboBoxLookupData(Classes::TPersistent* AOwner);
	__fastcall virtual ~TcxFontNameComboBoxLookupData(void);
	virtual void __fastcall HandleSelectItem(System::TObject* Sender);
	virtual bool __fastcall CanResizeVisualArea(tagSIZE &NewSize);
	virtual tagSIZE __fastcall GetVisualAreaPreferredSize(int AMaxHeight, int AWidth = 0x0);
	virtual void __fastcall Initialize(Controls::TWinControl* AVisualControlsParent);
	virtual void __fastcall PositionVisualArea(const Types::TRect &AClientRect);
};


class DELPHICLASS TcxCustomFontNameComboBoxProperties;
class PASCALIMPLEMENTATION TcxCustomFontNameComboBoxProperties : public Cxdropdownedit::TcxCustomComboBoxProperties 
{
	typedef Cxdropdownedit::TcxCustomComboBoxProperties inherited;
	
private:
	TcxMRUFontNameItems* FMRUFontNames;
	Byte FMaxMRUFonts;
	TcxFontTypes FFontTypes;
	bool FUseOwnFont;
	TcxShowFontIconTypes FShowFontTypeIcon;
	Classes::TNotifyEvent FOnAddedMRUFont;
	Classes::TNotifyEvent FOnMovedMRUFont;
	TcxDeleteMRUFontEvent FOnDeletedMRUFont;
	Classes::TNotifyEvent FOnInternalLoadFontComplete;
	Classes::TNotifyEvent FOnLoadFontComplete;
	bool FLoadFontComplete;
	TcxFontLoader* FFontLoader;
	TcxFontPreview* FFontPreview;
	Classes::TStrings* FFontItems;
	TcxFontTypes __fastcall GetFontTypes(void);
	bool __fastcall GetUseOwnFont(void);
	void __fastcall SetMaxMRUFonts(Byte Value);
	void __fastcall SetFontTypes(TcxFontTypes Value);
	void __fastcall SetUseOwnFont(bool Value);
	void __fastcall SetShowFontTypeIcon(TcxShowFontIconTypes Value);
	void __fastcall SetupViewInfoByItem(const Variant &AEditValue, TcxCustomFontNameComboBoxViewInfo* AViewInfo);
	int __fastcall FindItemByValue(const Variant &AEditValue);
	void __fastcall DeleteOverMRUFonts(void);
	void __fastcall FontLoaderCompleteHandler(System::TObject* Sender);
	void __fastcall FontLoaderDestroyHandler(System::TObject* Sender);
	TcxFontTypes __fastcall GetItemTypes(int Index);
	void __fastcall SetFontPreview(TcxFontPreview* Value);
	void __fastcall ShutDownFontLoader(void);
	
protected:
	__property Byte MaxMRUFonts = {read=FMaxMRUFonts, write=SetMaxMRUFonts, default=10};
	__property TcxMRUFontNameItems* MRUFontNames = {read=FMRUFontNames};
	__property bool UseOwnFont = {read=GetUseOwnFont, write=SetUseOwnFont, default=0};
	__property TcxFontPreview* FontPreview = {read=FFontPreview, write=SetFontPreview};
	__property TcxFontTypes FontTypes = {read=GetFontTypes, write=SetFontTypes, default=31};
	__property TcxShowFontIconTypes ShowFontTypeIcon = {read=FShowFontTypeIcon, write=SetShowFontTypeIcon, default=3};
	__property Classes::TNotifyEvent OnAddedMRUFont = {read=FOnAddedMRUFont, write=FOnAddedMRUFont};
	__property Classes::TNotifyEvent OnMovedMRUFont = {read=FOnMovedMRUFont, write=FOnMovedMRUFont};
	__property TcxDeleteMRUFontEvent OnDeletedMRUFont = {read=FOnDeletedMRUFont, write=FOnDeletedMRUFont};
	__property Classes::TNotifyEvent OnLoadFontComplete = {read=FOnLoadFontComplete, write=FOnLoadFontComplete};
	/* virtual class method */ virtual TMetaClass* __fastcall GetPopupWindowClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewDataClass(TMetaClass* vmt);
	virtual TcxMRUFontNameAction __fastcall AddMRUFontName(const AnsiString AFontName);
	virtual TcxMRUFontNameAction __fastcall DelMRUFontName(const AnsiString AFontName);
	__property TcxFontTypes ItemTypes[int Index] = {read=GetItemTypes};
	__property Classes::TStrings* FontItems = {read=FFontItems};
	
public:
	__fastcall virtual TcxCustomFontNameComboBoxProperties(Classes::TPersistent* AOwner);
	__fastcall virtual ~TcxCustomFontNameComboBoxProperties(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	/* virtual class method */ virtual TMetaClass* __fastcall GetContainerClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall GetLookupDataClass(TMetaClass* vmt);
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewInfoClass(TMetaClass* vmt);
	__property bool LoadFontComplete = {read=FLoadFontComplete, nodefault};
	virtual void __fastcall LoadFontNames(void);
	virtual void __fastcall Update(Cxedit::TcxCustomEditProperties* AProperties);
};


class DELPHICLASS TcxFontNameComboBoxProperties;
class PASCALIMPLEMENTATION TcxFontNameComboBoxProperties : public TcxCustomFontNameComboBoxProperties 
{
	typedef TcxCustomFontNameComboBoxProperties inherited;
	
__published:
	__property MaxMRUFonts  = {default=10};
	__property FontTypes  = {default=31};
	__property FontPreview ;
	__property ShowFontTypeIcon  = {default=3};
	__property UseOwnFont  = {default=0};
	__property Alignment ;
	__property AutoSelect  = {default=1};
	__property BeepOnError  = {default=0};
	__property ButtonGlyph ;
	__property CaseInsensitive  = {default=1};
	__property CharCase  = {default=0};
	__property DropDownAutoWidth  = {default=1};
	__property DropDownRows  = {default=8};
	__property DropDownSizeable  = {default=0};
	__property DropDownWidth  = {default=0};
	__property HideSelection  = {default=1};
	__property ImmediateDropDown  = {default=1};
	__property ImmediatePost  = {default=0};
	__property ImmediateUpdateText  = {default=0};
	__property ItemHeight  = {default=0};
	__property OEMConvert  = {default=0};
	__property PopupAlignment  = {default=0};
	__property ReadOnly ;
	__property OnAddedMRUFont ;
	__property OnMovedMRUFont ;
	__property OnDeletedMRUFont ;
	__property OnLoadFontComplete ;
	__property OnChange ;
	__property OnCloseUp ;
	__property OnDrawItem ;
	__property OnEditValueChanged ;
	__property OnInitPopup ;
	__property OnMeasureItem ;
	__property OnNewLookupDisplayText ;
	__property OnPopup ;
	__property OnValidate ;
	
public:
	__property FontItems ;
	__property MRUFontNames ;
public:
	#pragma option push -w-inl
	/* TcxCustomFontNameComboBoxProperties.Create */ inline __fastcall virtual TcxFontNameComboBoxProperties(Classes::TPersistent* AOwner) : TcxCustomFontNameComboBoxProperties(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomFontNameComboBoxProperties.Destroy */ inline __fastcall virtual ~TcxFontNameComboBoxProperties(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomFontNamePopupWindowViewInfo;
class PASCALIMPLEMENTATION TcxCustomFontNamePopupWindowViewInfo : public Cxdropdownedit::TcxCustomEditPopupWindowViewInfo 
{
	typedef Cxdropdownedit::TcxCustomEditPopupWindowViewInfo inherited;
	
public:
	virtual void __fastcall Calculate(void);
	virtual Types::TRect __fastcall GetBorderExtent();
	virtual Types::TRect __fastcall GetClientExtent();
	virtual void __fastcall Paint(Cxgraphics::TcxCanvas* ACanvas);
public:
	#pragma option push -w-inl
	/* TcxContainerViewInfo.Create */ inline __fastcall virtual TcxCustomFontNamePopupWindowViewInfo(void) : Cxdropdownedit::TcxCustomEditPopupWindowViewInfo() { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxCustomFontNamePopupWindowViewInfo(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomFontNameComboBoxInnerEdit;
class PASCALIMPLEMENTATION TcxCustomFontNameComboBoxInnerEdit : public Cxdropdownedit::TcxCustomComboBoxInnerEdit 
{
	typedef Cxdropdownedit::TcxCustomComboBoxInnerEdit inherited;
	
public:
	#pragma option push -w-inl
	/* TcxCustomInnerTextEdit.Create */ inline __fastcall virtual TcxCustomFontNameComboBoxInnerEdit(Classes::TComponent* AOwner) : Cxdropdownedit::TcxCustomComboBoxInnerEdit(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomInnerTextEdit.Destroy */ inline __fastcall virtual ~TcxCustomFontNameComboBoxInnerEdit(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomFontNameComboBoxInnerEdit(HWND ParentWindow) : Cxdropdownedit::TcxCustomComboBoxInnerEdit(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFontNameComboBoxPopupWindow;
class PASCALIMPLEMENTATION TcxFontNameComboBoxPopupWindow : public Cxdropdownedit::TcxComboBoxPopupWindow 
{
	typedef Cxdropdownedit::TcxComboBoxPopupWindow inherited;
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetViewInfoClass(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TcxCustomEditPopupWindow.Create */ inline __fastcall virtual TcxFontNameComboBoxPopupWindow(Controls::TWinControl* AOwnerControl) : Cxdropdownedit::TcxComboBoxPopupWindow(AOwnerControl) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomPopupWindow.Destroy */ inline __fastcall virtual ~TcxFontNameComboBoxPopupWindow(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual TcxFontNameComboBoxPopupWindow(Classes::TComponent* AOwner, int Dummy) : Cxdropdownedit::TcxComboBoxPopupWindow(AOwner, Dummy) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxFontNameComboBoxPopupWindow(HWND ParentWindow) : Cxdropdownedit::TcxComboBoxPopupWindow(ParentWindow) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxCustomFontNameComboBox : public Cxdropdownedit::TcxCustomComboBox 
{
	typedef Cxdropdownedit::TcxCustomComboBox inherited;
	
private:
	AnsiString FFontNameQueue;
	AnsiString __fastcall GetFontName();
	void __fastcall SetFontName(AnsiString Value);
	HIDESBASE int __fastcall GetItemIndex(void);
	HIDESBASE TcxFontNameComboBoxLookupData* __fastcall GetLookupData(void);
	HIDESBASE TcxFontNameComboBoxProperties* __fastcall GetProperties(void);
	HIDESBASE void __fastcall SetItemIndex(int Value);
	HIDESBASE void __fastcall SetProperties(TcxFontNameComboBoxProperties* Value);
	void __fastcall InternalLoadFontCompleteHandler(System::TObject* Sender);
	
protected:
	virtual void __fastcall InternalSetEditValue(const Variant &Value, bool AValidateEditValue);
	virtual void __fastcall ContainerStyleChanged(System::TObject* Sender);
	DYNAMIC void __fastcall DblClick(void);
	virtual TMetaClass* __fastcall GetInnerEditClass(void);
	virtual tagSIZE __fastcall GetPopupWindowClientPreferredSize();
	virtual void __fastcall InitializePopupWindow(void);
	DYNAMIC void __fastcall MouseMove(Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall PopupWindowShowed(System::TObject* Sender);
	virtual void __fastcall CloseUp(bool AAccept);
	__property int ItemIndex = {read=GetItemIndex, write=SetItemIndex, nodefault};
	__property TcxFontNameComboBoxLookupData* LookupData = {read=GetLookupData};
	__property TcxFontNameComboBoxProperties* Properties = {read=GetProperties, write=SetProperties};
	
public:
	__fastcall virtual TcxCustomFontNameComboBox(Classes::TComponent* AOwner)/* overload */;
	/* virtual class method */ virtual TMetaClass* __fastcall GetPropertiesClass(TMetaClass* vmt);
	TcxMRUFontNameAction __fastcall AddMRUFontName(const AnsiString AFontName);
	TcxMRUFontNameAction __fastcall DelMRUFontName(const AnsiString AFontName);
	__property AnsiString FontName = {read=GetFontName, write=SetFontName};
public:
	#pragma option push -w-inl
	/* TcxCustomDropDownEdit.Destroy */ inline __fastcall virtual ~TcxCustomFontNameComboBox(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomFontNameComboBox(HWND ParentWindow) : Cxdropdownedit::TcxCustomComboBox(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFontNameComboBox;
class PASCALIMPLEMENTATION TcxFontNameComboBox : public TcxCustomFontNameComboBox 
{
	typedef TcxCustomFontNameComboBox inherited;
	
public:
	__property ItemIndex ;
	
__published:
	__property Anchors  = {default=3};
	__property AutoSize  = {default=1};
	__property BeepOnEnter  = {default=1};
	__property Constraints ;
	__property DragMode  = {default=0};
	__property Enabled  = {default=1};
	__property ParentColor  = {default=0};
	__property ParentFont  = {default=1};
	__property ParentShowHint  = {default=1};
	__property PopupMenu ;
	__property Properties ;
	__property ShowHint ;
	__property Style ;
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=1};
	__property Text ;
	__property Visible  = {default=1};
	__property DragCursor  = {default=-12};
	__property DragKind  = {default=0};
	__property ImeMode  = {default=3};
	__property ImeName ;
	__property OnClick ;
	__property OnContextPopup ;
	__property OnDblClick ;
	__property OnDragDrop ;
	__property OnDragOver ;
	__property OnEditing ;
	__property OnEndDrag ;
	__property OnEnter ;
	__property OnExit ;
	__property OnKeyDown ;
	__property OnKeyPress ;
	__property OnKeyUp ;
	__property OnMouseDown ;
	__property OnMouseEnter ;
	__property OnMouseLeave ;
	__property OnMouseMove ;
	__property OnMouseUp ;
	__property OnStartDrag ;
	__property OnEndDock ;
	__property OnStartDock ;
public:
	#pragma option push -w-inl
	/* TcxCustomFontNameComboBox.Create */ inline __fastcall virtual TcxFontNameComboBox(Classes::TComponent* AOwner)/* overload */ : TcxCustomFontNameComboBox(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomDropDownEdit.Destroy */ inline __fastcall virtual ~TcxFontNameComboBox(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxFontNameComboBox(HWND ParentWindow) : TcxCustomFontNameComboBox(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
static const Word SYMBOL_FONTTYPE = 0x100;
static const Word FIXEDPITCH_FONTTYPE = 0x200;
extern PACKAGE Graphics::TBitmap* FTrueTypeFontBitmap;
extern PACKAGE Graphics::TBitmap* FNonTrueTypeFontBitmap;
extern PACKAGE TcxFontTypes __fastcall RealFontTypeToCxTypes(const int AFontType);
extern PACKAGE TcxFontTypes __fastcall GetFontTypes(const AnsiString AFontName);
extern PACKAGE void __fastcall GetFontSizes(const AnsiString aFontName, Classes::TStrings* aDestItems);

}	/* namespace Cxfontnamecombobox */
using namespace Cxfontnamecombobox;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxFontNameComboBox
