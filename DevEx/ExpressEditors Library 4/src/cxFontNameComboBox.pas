
{********************************************************************}
{                                                                    }
{       Developer Express Visual Component Library                   }
{       ExpressEditors                                               }
{                                                                    }
{       Copyright (c) 1998-2003 Developer Express Inc.               }
{       ALL RIGHTS RESERVED                                          }
{                                                                    }
{   The entire contents of this file is protected by U.S. and        }
{   International Copyright Laws. Unauthorized reproduction,         }
{   reverse-engineering, and distribution of all or any portion of   }
{   the code contained in this file is strictly prohibited and may   }
{   result in severe civil and criminal penalties and will be        }
{   prosecuted to the maximum extent possible under the law.         }
{                                                                    }
{   RESTRICTIONS                                                     }
{                                                                    }
{   THIS SOURCE CODE AND ALL RESULTING INTERMEDIATE FILES            }
{   (DCU, OBJ, DLL, ETC.) ARE CONFIDENTIAL AND PROPRIETARY TRADE     }
{   SECRETS OF DEVELOPER EXPRESS INC. THE REGISTERED DEVELOPER IS    }
{   LICENSED TO DISTRIBUTE THE EXPRESSEDITORS AND ALL                }
{   ACCOMPANYING VCL CONTROLS AS PART OF AN EXECUTABLE PROGRAM ONLY. }
{                                                                    }
{   THE SOURCE CODE CONTAINED WITHIN THIS FILE AND ALL RELATED       }
{   FILES OR ANY PORTION OF ITS CONTENTS SHALL AT NO TIME BE         }
{   COPIED, TRANSFERRED, SOLD, DISTRIBUTED, OR OTHERWISE MADE        }
{   AVAILABLE TO OTHER INDIVIDUALS WITHOUT EXPRESS WRITTEN CONSENT   }
{   AND PERMISSION FROM DEVELOPER EXPRESS INC.                       }
{                                                                    }
{   CONSULT THE END USER LICENSE AGREEMENT FOR INFORMATION ON        }
{   ADDITIONAL RESTRICTIONS.                                         }
{                                                                    }
{********************************************************************}

unit cxFontNameComboBox;

interface

{$I cxExtEdVer.inc}

uses
  Windows, Messages, SysUtils, Classes, Controls, Graphics, Printers, Forms,
  Dialogs,
{$IFDEF DELPHI6}
  Variants,
{$ENDIF}
{$IFNDEF DELPHI5}
  StdCtrls,
{$ENDIF}
  cxControls, cxContainer, cxGraphics, cxClasses, cxEdit, cxEditUtils,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxImageComboBox, cxVariants, cxButtons,
  cxExtEditUtils, cxExtEditConsts, cxLookAndFeels;

const
  SYMBOL_FONTTYPE = 256;
  FIXEDPITCH_FONTTYPE = 512;

type
  TcxFontType = (cxftTTF, cxftRaster, cxftDevice, cxftFixed, cxftSymbol);
  TcxFontTypes = set of TcxFontType;
  TcxShowFontIconType = (ftiShowInCombo, ftiShowInList);
  TcxShowFontIconTypes = set of TcxShowFontIconType;
  TcxMRUFontNameAction = (mfaInvalidFontName, mfaNone, mfaMoved, mfaAdded, mfaDeleted);
  TcxFontPreviewType = (cxfpFontName, cxfpCustom, cxfpFullAlphabet);
  TcxDeleteMRUFontEvent = procedure(Sender: TObject; const DeletedMRUFontName: string) of object;

  { TcxMRUFontNameItem }
  TcxMRUFontNameItem = class(TCollectionItem)
  private
    FFontName: TFontName;
    procedure SetFontName(const Value: TFontName);
  public
    constructor Create(Collection: TCollection); override;
    procedure Assign(Source: TPersistent); override;
  published
    property FontName: TFontName read FFontName write SetFontName;
  end;

  { TcxMRUFontNameItems }
  TcxMRUFontNameItems = class(TOwnedCollection)
  private
    function GetItems(Index: Integer): TcxMRUFontNameItem;
    procedure SetItems(Index: Integer; const Value: TcxMRUFontNameItem);
  protected
    procedure Update(Item: TCollectionItem); override;
    function Add: TcxMRUFontNameItem;
    function Insert(Index: Integer): TcxMRUFontNameItem;
    function AddMRUFontName(const AFontName: TFontName): TcxMRUFontNameItem; virtual;
    function InsertMRUFontName(Index: Integer; const AFontName: TFontName): TcxMRUFontNameItem; virtual;
    procedure Move(CurIndex, NewIndex: Integer); virtual;
  public
    constructor Create(AOwner: TPersistent; ItemClass: TCollectionItemClass);
    destructor Destroy; override;
  {$IFNDEF DELPHI6}
    function Owner: TPersistent;
  {$ENDIF}
    property Items[Index: Integer]: TcxMRUFontNameItem read GetItems write SetItems; default;
    function FindFontName(const AFontName: TFontName): TcxMRUFontNameItem; virtual;
  end;

  { TcxFontLoader }
  TcxFontLoader = class(TThread)
  private
    FFontTypes: TcxFontTypes;
    procedure DoCompleteEvent;
    procedure DoDestroyEvent;
  protected
    procedure Execute; override;
  public
    OnCompleteThread: TNotifyEvent;
    OnDestroyThread: TNotifyEvent;
    FontList: TStringList;
    constructor Create(const AFontTypes: TcxFontTypes); virtual;
    destructor Destroy; override;
  end;

  TcxFontButtonType = (cxfbtBold, cxfbtItalic, cxfbtUnderline, cxfbtStrikeOut);
  TcxFontButtonClickEvent = procedure(Sender: TObject; ButtonType: TcxFontButtonType) of Object;

  { TcxFontPreview }
  TcxFontPreview = class(TPersistent)
  private
    FOwner: TPersistent;
    FUpdateCount: Integer;
    FOnChanged: TNotifyEvent;
    FFontStyle: TFontStyles;
    FModified: Boolean;
    FIsDestroying: Boolean;
    FVisible: Boolean;
    FPreviewType: TcxFontPreviewType;
    FPreviewText: TCaption;
    FAlignment: TAlignment;
    FShowEndEllipsis: Boolean;
    FColor: TColor;
    FWordWrap: Boolean;
    FShowButtons: Boolean;
    FOnButtonClick: TcxFontButtonClickEvent;
    procedure BeginUpdate;
    procedure EndUpdate;
    function IsDestroying: Boolean;
    procedure SetFontStyle(Value: TFontStyles);
    procedure SetVisible(Value: Boolean);
    procedure SetPreviewType(Value: TcxFontPreviewType);
    procedure SetPreviewText(Value: TCaption);
    procedure SetAlignment(Value: TAlignment);
    procedure SetShowEndEllipsis(Value: Boolean);
    procedure SetColor(Value: TColor);
    procedure SetWordWrap(Value: Boolean);
    procedure SetShowButtons(Value: Boolean);
  protected
    function GetOwner: TPersistent; override;
    procedure Changed; virtual;
  public
    constructor Create(AOwner: TPersistent); virtual;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure BeforeDestruction; override;
  published
    property FontStyle: TFontStyles read FFontStyle write SetFontStyle default [];
    property Visible: Boolean read FVisible write SetVisible default True;
    property PreviewType: TcxFontPreviewType read FPreviewType write SetPreviewType default cxfpFontName;
    property PreviewText: TCaption read FPreviewText write SetPreviewText;
    property Alignment: TAlignment read FAlignment write SetAlignment default taCenter;
    property ShowButtons: Boolean read FShowButtons write SetShowButtons default True;
    property ShowEndEllipsis: Boolean read FShowEndEllipsis write SetShowEndEllipsis default True;
    property Color: TColor read FColor write SetColor default clWindow;
    property WordWrap: Boolean read FWordWrap write SetWordWrap default False;
    property OnButtonClick: TcxFontButtonClickEvent read FOnButtonClick write FOnButtonClick;
  end;

  { TcxFontPanelButton }
  TcxFontPanelButton = class(TcxButton)
  protected
    procedure WndProc(var Message: TMessage); override;
  end;

  { TFontPreviewPanel }
  TFontPreviewPanel = class(TCustomControl)
  private
    FLocked: Boolean;
    FcxCanvas: TcxCanvas;
    FFontStyle: TFontStyles;
    FAlignment: TAlignment;
    FShowEndEllipsis: Boolean;
    FEdges: TcxBorders;
    FBorderColor: TColor;
    FFontName: string;
    FWordWrap: Boolean;
    FShowButtons: Boolean;
    FLookAndFeel: TcxLookAndFeel;
    FBoldButton: TcxFontPanelButton;
    FItalicButton: TcxFontPanelButton;
    FUnderLineButton: TcxFontPanelButton;
    FStrikeOutButton: TcxFontPanelButton;
    procedure SetLocked(Value: Boolean);
    procedure SetAlignment(Value: TAlignment);
    procedure SetShowEndEllipsis(Value: Boolean);
    procedure SetEdges(Value: TcxBorders);
    procedure SetFontName(Value: string);
    procedure SetFontStyle(Value: TFontStyles);
    procedure SetWordWrap(Value: Boolean);
    procedure SetShowButtons(Value: Boolean);
    procedure SetLookAndFeel(Value: TcxLookAndFeel);
    function GetTextFlag(const AStartFlag: Longint): Longint;
    procedure CreateButtons;
    procedure SetFontStyleButtonsState;
    procedure FontButtonsClickHandler(Sender: TObject);
  protected
    FontPreview: TcxFontPreview;
    procedure Paint; override;
    procedure CalculateFont(const ARect: TRect); virtual;
    function CalculateFontStyle: TFontStyles; virtual;
    property cxCanvas: TcxCanvas read FcxCanvas write FcxCanvas;
    property Locked: Boolean read FLocked write SetLocked default False;
  public
    property BorderColor: TColor read FBorderColor write FBorderColor;
    property Color default clWindow;
    property Alignment: TAlignment read FAlignment write SetAlignment default taCenter;
    property ShowEndEllipsis: Boolean read FShowEndEllipsis write SetShowEndEllipsis default True;
    property Edges: TcxBorders read FEdges write SetEdges default [bLeft, bTop, bRight, bBottom];
    property FontStyle: TFontStyles read FFontStyle write SetFontStyle default [];
    property FontName: string read FFontName write SetFontName;
    property WordWrap: Boolean read FWordWrap write SetWordWrap default False;
    property ShowButtons: Boolean read FShowButtons write SetShowButtons default True;
    property LookAndFeel: TcxLookAndFeel read FLookAndFeel write SetLookAndFeel;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure RealignButtons;
  end;

  { TcxCustomFontNameComboBoxViewInfo }
  TcxCustomFontNameComboBoxViewInfo = class(TcxCustomTextEditViewInfo)
  private
    FCurrentIndex: Integer;
    FIsTrueTypeFont: Boolean;
    ImageRect: TRect;
    FShowFontTypeIcon: TcxShowFontIconTypes;
  protected
    SaveClient: TRect;
    property IsTrueTypeFont: Boolean read FIsTrueTypeFont write FIsTrueTypeFont;
    property ShowFontTypeIcon: TcxShowFontIconTypes read FShowFontTypeIcon write FShowFontTypeIcon;
  public
    procedure Paint(ACanvas: TcxCanvas); override;
    procedure Offset(DX, DY: Integer); override;
  end;

  { TcxCustomFontNameComboBoxViewData }
  TcxCustomFontNameComboBoxViewData = class(TcxCustomDropDownEditViewData)
  public
    function IsComboBoxStyle: Boolean; override;
    procedure Calculate(ACanvas: TcxCanvas; const ABounds: TRect;
      const P: TPoint; Button: TcxMouseButton; Shift: TShiftState;
      AViewInfo: TcxCustomEditViewInfo; AIsMouseEvent: Boolean); override;
    procedure DisplayValueToDrawValue(const ADisplayValue: TcxEditValue;
      AViewInfo: TcxCustomEditViewInfo); override;
    procedure EditValueToDrawValue(ACanvas: TcxCanvas; const AEditValue: TcxEditValue;
      AViewInfo: TcxCustomEditViewInfo); override;
    function GetEditContentSize(ACanvas: TcxCanvas;
      const AEditValue: TcxEditValue;
      const AEditSizeProperties: TcxEditSizeProperties): TSize; override;
  end;

  { TcxFontNameComboBoxListBox }
  TcxCustomFontNameComboBox = class;
  TcxFontNameComboBoxListBox = class(TcxCustomEditListBox)
  private
    function GetEdit: TcxCustomFontNameComboBox;
  protected
    FEdit: TcxCustomFontNameComboBox;
    function DoDrawItem(AIndex: Integer; const ARect: TRect; AState: TOwnerDrawState): Boolean; override;
    function GetHeight(ARowCount: Integer; AMaxHeight: Integer): Integer; override;
    function GetItem(Index: Integer): TCaption; override;
    function GetItemHeight(AIndex: Integer = -1): Integer; override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
{$IFDEF VCL}
    procedure DrawItem(Index: Integer; Rect: TRect; State: TOwnerDrawState); override;
    procedure MeasureItem(Index: Integer; var Height: Integer); override;
{$ELSE}
    procedure MeasureItem(Control: TWinControl;
      {$IFDEF LINUX}item: QClxListBoxItemH{$ELSE}Index: Integer{$ENDIF};
      var Height, Width: Integer); override;
{$ENDIF}
    property Edit: TcxCustomFontNameComboBox read GetEdit;
  end;

  { TcxFontNameComboBoxLookupData }
  TcxFontNameComboBoxLookupData = class(TcxComboBoxLookupData)
  private
    FPanel: TFontPreviewPanel;
    FDefaultPreviewHeight: Integer;
    function GetFontName: string;
    function GetPreviewText: string;
  protected
    function GetListBoxClass: TcxCustomEditListBoxClass; override;
    procedure InternalChangeCurrentMRUFontNamePosition; virtual;
  public
    constructor Create(AOwner: TPersistent); override;
    destructor Destroy; override;
    procedure HandleSelectItem(Sender: TObject); override;
    function CanResizeVisualArea(var NewSize: TSize): Boolean; override;
    function GetVisualAreaPreferredSize(AMaxHeight: Integer; AWidth: Integer = 0): TSize; override;
    procedure Initialize(AVisualControlsParent: TWinControl); override;
    procedure PositionVisualArea(const AClientRect: TRect); override;
  end;

  { TcxCustomFontNameComboBoxProperties }
  TcxCustomFontNameComboBoxProperties = class(TcxCustomComboBoxProperties)
  private
    FMRUFontNames: TcxMRUFontNameItems;
    FMaxMRUFonts: Byte;
    FFontTypes: TcxFontTypes;
    FUseOwnFont: Boolean;
    FShowFontTypeIcon: TcxShowFontIconTypes;
    FOnAddedMRUFont: TNotifyEvent;
    FOnMovedMRUFont: TNotifyEvent;
    FOnDeletedMRUFont: TcxDeleteMRUFontEvent;
    FOnInternalLoadFontComplete: TNotifyEvent;
    FOnLoadFontComplete: TNotifyEvent;
    FLoadFontComplete: Boolean;
    FFontLoader: TcxFontLoader;
    FFontPreview: TcxFontPreview;
    FFontItems: TStrings;
    function GetFontTypes: TcxFontTypes;
    function GetUseOwnFont: Boolean;
    procedure SetMaxMRUFonts(Value: Byte);
    procedure SetFontTypes(Value: TcxFontTypes);
    procedure SetUseOwnFont(Value: Boolean);
    procedure SetShowFontTypeIcon(Value: TcxShowFontIconTypes);
    procedure SetupViewInfoByItem(const AEditValue: TcxEditValue;
      AViewInfo: TcxCustomFontNameComboBoxViewInfo);
    function FindItemByValue(const AEditValue: TcxEditValue): Integer;
    procedure DeleteOverMRUFonts;
    procedure FontLoaderCompleteHandler(Sender: TObject);
    procedure FontLoaderDestroyHandler(Sender: TObject);
    function GetItemTypes(Index: Integer): TcxFontTypes;
    procedure SetFontPreview(Value: TcxFontPreview);
    procedure ShutDownFontLoader;
  protected
    property MaxMRUFonts: Byte read FMaxMRUFonts write SetMaxMRUFonts default 10;
    property MRUFontNames: TcxMRUFontNameItems read FMRUFontNames;
    property UseOwnFont: Boolean read GetUseOwnFont write SetUseOwnFont default False;
    property FontPreview: TcxFontPreview read FFontPreview write SetFontPreview;
    property FontTypes: TcxFontTypes read GetFontTypes write SetFontTypes default [cxftTTF, cxftRaster, cxftDevice, cxftFixed, cxftSymbol];
    property ShowFontTypeIcon: TcxShowFontIconTypes read FShowFontTypeIcon write SetShowFontTypeIcon default [ftiShowInCombo, ftiShowInList];
    property OnAddedMRUFont: TNotifyEvent read FOnAddedMRUFont write FOnAddedMRUFont;
    property OnMovedMRUFont: TNotifyEvent read FOnMovedMRUFont write FOnMovedMRUFont;
    property OnDeletedMRUFont: TcxDeleteMRUFontEvent read FOnDeletedMRUFont write FOnDeletedMRUFont;
    property OnLoadFontComplete: TNotifyEvent read FOnLoadFontComplete write FOnLoadFontComplete;
    class function GetPopupWindowClass: TcxCustomEditPopupWindowClass; override;
    class function GetViewDataClass: TcxCustomEditViewDataClass; override;
    function AddMRUFontName(const AFontName: TFontName): TcxMRUFontNameAction; virtual;
    function DelMRUFontName(const AFontName: TFontName): TcxMRUFontNameAction; virtual;
    property ItemTypes[Index: Integer]: TcxFontTypes read GetItemTypes;
    property FontItems: TStrings read FFontItems;
  public
    constructor Create(AOwner: TPersistent); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    class function GetContainerClass: TcxContainerClass; override;
    class function GetLookupDataClass: TcxInterfacedPersistentClass; override;
    class function GetViewInfoClass: TcxContainerViewInfoClass; override;
    property LoadFontComplete: Boolean read FLoadFontComplete;
    procedure LoadFontNames; virtual;
    procedure Update(AProperties: TcxCustomEditProperties); override;
  end;

  { TcxFontNameComboBoxProperties }
  TcxFontNameComboBoxProperties = class(TcxCustomFontNameComboBoxProperties)
  published
    property MaxMRUFonts;
    property FontTypes;
    property FontPreview;
    property ShowFontTypeIcon;
    property UseOwnFont;
    property Alignment;
    property AutoSelect;
    property BeepOnError;
    property ButtonGlyph;
    property CaseInsensitive;
    property CharCase;
    property DropDownAutoWidth;
    property DropDownRows;
    property DropDownSizeable;
    property DropDownWidth;
    property HideSelection;
    property ImmediateDropDown;
    property ImmediatePost;
    property ImmediateUpdateText;
    property ItemHeight;
{$IFDEF VCL}
    property OEMConvert;
{$ENDIF}
    property PopupAlignment;
    property ReadOnly;
    property OnAddedMRUFont;
    property OnMovedMRUFont;
    property OnDeletedMRUFont;
    property OnLoadFontComplete;
    property OnChange;
    property OnCloseUp;
    property OnDrawItem;
    property OnEditValueChanged;
    property OnInitPopup;
    property OnMeasureItem;
    property OnNewLookupDisplayText;
    property OnPopup;
    property OnValidate;
  public
    property FontItems;
    property MRUFontNames;
  end;

  { TcxCustomFontNamePopupWindowViewInfo }
  TcxCustomFontNamePopupWindowViewInfo = class(TcxCustomEditPopupWindowViewInfo)
  public
    procedure Calculate; override;
    function GetBorderExtent: TRect; override;
    function GetClientExtent: TRect; override;
    procedure Paint(ACanvas: TcxCanvas); override;
  end;

  { TcxCustomFontNameComboBoxInnerEdit }
  TcxCustomFontNameComboBoxInnerEdit = class(TcxCustomComboBoxInnerEdit);

  { TcxFontNameComboBoxPopupWindow }
  TcxFontNameComboBoxPopupWindow = class(TcxComboBoxPopupWindow)
  public
    class function GetViewInfoClass: TcxContainerViewInfoClass; override;
  end;

  { TcxCustomFontNameComboBox }
  TcxCustomFontNameComboBox = class(TcxCustomComboBox)
  private
    FFontNameQueue: string;
    function GetFontName: string;
    procedure SetFontName(Value: string);
    function GetItemIndex: Integer;
    function GetLookupData: TcxFontNameComboBoxLookupData;
    function GetProperties: TcxFontNameComboBoxProperties;
    procedure SetItemIndex(Value: Integer);
    procedure SetProperties(Value: TcxFontNameComboBoxProperties);
    procedure InternalLoadFontCompleteHandler(Sender: TObject);
  protected
    procedure InternalSetEditValue(const Value: TcxEditValue;
      AValidateEditValue: Boolean); override;
    procedure ContainerStyleChanged(Sender: TObject); override;
    procedure DblClick; override;
    function GetInnerEditClass: TControlClass; override;
    function GetPopupWindowClientPreferredSize: TSize; override;
    procedure InitializePopupWindow; override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure PopupWindowShowed(Sender: TObject); override;
{$IFNDEF VCL}
    function EventFilter(Sender: QObjectH; Event: QEventH): Boolean; override;
{$ENDIF}
    procedure CloseUp(AAccept: Boolean); override;
    property ItemIndex: Integer read GetItemIndex write SetItemIndex;
    property LookupData: TcxFontNameComboBoxLookupData read GetLookupData;
    property Properties: TcxFontNameComboBoxProperties read GetProperties write SetProperties;
  public
    constructor Create(AOwner: TComponent); override;
    class function GetPropertiesClass: TcxCustomEditPropertiesClass; override;
    function AddMRUFontName(const AFontName: TFontName): TcxMRUFontNameAction;
    function DelMRUFontName(const AFontName: TFontName): TcxMRUFontNameAction;
    property FontName: string read GetFontName write SetFontName;
  end;

  { TcxFontNameComboBox }
  TcxFontNameComboBox = class(TcxCustomFontNameComboBox)
  public
    property ItemIndex;
  published
    property Anchors;
    property AutoSize;
    property BeepOnEnter;
    property Constraints;
    property DragMode;
    property Enabled;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property Properties;
    property ShowHint;
    property Style;
    property TabOrder;
    property TabStop;
    property Text;
    property Visible;
{$IFDEF VCL}
    property DragCursor;
    property DragKind;
    property ImeMode;
    property ImeName;
{$ENDIF}
    property OnClick;
{$IFDEF DELPHI5}
    property OnContextPopup;
{$ENDIF}
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEditing;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
{$IFDEF VCL}
    property OnEndDock;
    property OnStartDock;
{$ENDIF}
  end;

var
  FTrueTypeFontBitmap, FNonTrueTypeFontBitmap : TBitmap;

function GetFontTypes(const AFontName: string): TcxFontTypes;
function RealFontTypeToCxTypes(const AFontType: Integer): TcxFontTypes;
procedure GetFontSizes(const aFontName: string; aDestItems: TStrings);

implementation

uses cxListBox;

{$R cxFontNameComboBox.res}

type
  TcxCustomEditAccess = class(TcxCustomEdit);

const
  NUM_SIZES = 16;
  caiFontSizes : array[0..NUM_SIZES - 1] of Integer =
    (8, 9, 10, 11, 12, 14, 16, 18, 20, 22, 24, 26, 28, 36, 48, 72);

var
  vbFtt : Boolean;

function RealFontTypeToCxTypes(const AFontType: Integer): TcxFontTypes;
begin
  Result := [];
  if (AFontType and TRUETYPE_FONTTYPE) <> 0 then
    Result := Result + [cxftTTF];
  if (AFontType and RASTER_FONTTYPE) <> 0 then
    Result := Result + [cxftRaster];
  if (AFontType and DEVICE_FONTTYPE) <> 0 then
    Result := Result + [cxftDevice];
  if (AFontType and FIXEDPITCH_FONTTYPE) <> 0 then
    Result := Result + [cxftFixed];
  if (AFontType and SYMBOL_FONTTYPE) <> 0 then
    Result := Result + [cxftSymbol];
end;

function GetFontTypes(const AFontName: string): TcxFontTypes;
var
  FFontList: TStringList;

  function EnumFontsProc(var EnumLogFont: TEnumLogFont;
    var TextMetric: TNewTextMetric; FontType: Integer; Data: LPARAM): Integer;
    export; stdcall;
  var
    FaceName: string;
  begin
    FaceName := StrPas(EnumLogFont.elfLogFont.lfFaceName);
    with TStringList(Data) do
    begin
      if EnumLogFont.elfLogFont.lfCharSet = SYMBOL_CHARSET then
        FontType := FontType or SYMBOL_FONTTYPE;
      if EnumLogFont.elfLogFont.lfPitchAndFamily = FIXED_PITCH then
        FontType := FontType or FIXEDPITCH_FONTTYPE;
      AddObject(FaceName, TObject(FontType));
    end;
    Result := 0;
  end;

  procedure EnumFonts;
  var
    FDC: HDC;
  begin
    FDC := GetDC(0);
    try
      EnumFontFamilies(FDC, PChar(AFontName), @EnumFontsProc, Integer(FFontList));
    finally
      ReleaseDC(0, FDC);
    end;
  end;

begin
  FFontList := TStringList.Create;
  try
    Result := [];
    EnumFonts;
    if FFontList.Count > 0 then begin
      Result := RealFontTypeToCxTypes(Integer(FFontList.Objects[0]));
    end;
  finally
    FFontList.Free;
  end;
end;

function IsValidFontCondition(const AFontTypes: TcxFontTypes;
         LogFont: TLogFont; FontType: Integer): Boolean;
begin
  Result := ((cxftTTF in AFontTypes) and (FontType and TRUETYPE_FONTTYPE = TRUETYPE_FONTTYPE)) or
            ((cxftDevice in AFontTypes) and (FontType and DEVICE_FONTTYPE = DEVICE_FONTTYPE)) or
            ((cxftRaster in AFontTypes) and (FontType and RASTER_FONTTYPE = RASTER_FONTTYPE)) or
            ((cxftFixed in AFontTypes) and (LogFont.lfPitchAndFamily and FIXED_PITCH = FIXED_PITCH)) or
            ((cxftSymbol in AFontTypes) and (LogFont.lfCharSet = SYMBOL_CHARSET));
end;

function SetFontSizes(var LogFont: TEnumLogFont; var ptm: TNewTextMetric;
  FontType: Integer; Data: Pointer): Integer; stdcall;
var
  vS : string;
begin
  vS := IntToStr(((ptm.tmHeight -
    ptm.tmInternalLeading) * 72 +
    ptm.tmDigitizedAspectX div 2) div
    ptm.tmDigitizedAspectY);
  if TStrings(Data).IndexOf(vS) = -1 then
    TStrings(Data).Add(Vs);
  Result := 1;
end;

function SetFTypeFlag(var LogFont: TEnumLogFont; var ptm: TNewTextMetric;
  FontType: integer; Data: Pointer): Integer; stdcall;
begin
  vbFtt := (ptm.tmPitchAndFamily and TMPF_TRUETYPE) = TMPF_TRUETYPE;
  Result := 0;
end;

function IsTT(FontName: string; aDc: HDC): Boolean;
begin
  EnumFontFamilies(aDC, PChar(FontName), @SetFTypeFlag, 0);
  Result := vbFtt;
end;

procedure GetFontSizes(const aFontName: string; aDestItems: TStrings);
var
  vI: Integer;
  vFtt: Boolean;
  vDc: HDC;
begin
  vDc := GetDc(0);
  try
    vFtt := IsTT(aFontName,vDc);
    aDestItems.Clear;
    if vFtt then
      for vI := 0 to NUM_SIZES - 1 do
        aDestItems.Add(Format('%d',[caiFontSizes[vi]]))
    else
        EnumFontFamilies(vDc, PChar(aFontName), @SetFontSizes, Longint(aDestItems));
  finally
    ReleaseDc(0,vDc);
  end;
end;

{ TcxFontLoader }
constructor TcxFontLoader.Create(const AFontTypes: TcxFontTypes);
begin
  FFontTypes := AFontTypes;
  FontList := TStringList.Create;
  FreeOnTerminate := True;
  inherited Create(True);
end;

destructor TcxFontLoader.Destroy;
begin
  Synchronize(DoCompleteEvent);
  if Assigned(FontList) then FreeAndNil(FontList);
  Synchronize(DoDestroyEvent);
  inherited;
end;

procedure TcxFontLoader.DoCompleteEvent;
begin
  if Assigned(OnCompleteThread) then OnCompleteThread(Self);
end;

procedure TcxFontLoader.DoDestroyEvent;
begin
  if Assigned(OnDestroyThread) then OnDestroyThread(Self);
end;

procedure TcxFontLoader.Execute;

  function EnumFontsProc(var EnumLogFont: TEnumLogFont;
    var TextMetric: TNewTextMetric; FontType: Integer; Data: LPARAM): Integer;
    export; stdcall;
  var
    FaceName: string;
  begin
    FaceName := StrPas(EnumLogFont.elfLogFont.lfFaceName);
    with TcxFontLoader(Data) do
      if (FontList.IndexOf(FaceName) < 0) and
        IsValidFontCondition(FFontTypes, EnumLogFont.elfLogFont, FontType) then
      begin
        if EnumLogFont.elfLogFont.lfCharSet = SYMBOL_CHARSET then
          FontType := FontType or SYMBOL_FONTTYPE;
        if EnumLogFont.elfLogFont.lfPitchAndFamily = FIXED_PITCH then
          FontType := FontType or FIXEDPITCH_FONTTYPE;
        FontList.AddObject(FaceName, TObject(FontType));
      end;
    if TcxFontLoader(Data).Terminated = True then Result := 0
     else Result := 1;
  end;

  procedure EnumFonts;
  var
    LogFont: TLogFont;
    FDC: HDC;
  begin
    FDC := GetDC(0);
    try
      LogFont.lfCharset := DEFAULT_CHARSET;
      LogFont.lfFaceName := '';
      LogFont.lfPitchAndFamily := 0;
      EnumFontFamiliesEx(FDC, LogFont, @EnumFontsProc, Integer(Self), 0);
    finally
      ReleaseDC(0, FDC);
    end;
  end;

begin
  try
    FontList.BeginUpdate;
    FontList.Clear;
    EnumFonts;
    TStringList(FontList).Sort;
  finally
    FontList.EndUpdate;
  end;
end;
{ TcxFontLoader }

{ TcxFontPreview }
constructor TcxFontPreview.Create(AOwner: TPersistent);
begin
  inherited Create;
  FOwner := AOwner;
  FUpdateCount := 0;
  FModified := False;
  FFontStyle := [];
  FVisible := True;
  FPreviewType := cxfpFontName;
  FPreviewText := '';
  FAlignment := taCenter;
  FShowEndEllipsis := True;
  FColor := clWindow;
  FWordWrap := False;
  FShowButtons := True;
end;

destructor TcxFontPreview.Destroy;
begin
  inherited;
end;

procedure TcxFontPreview.Assign(Source: TPersistent);
begin
  if Source is TcxFontPreview then
  begin
    BeginUpdate;
    try
      with Source as TcxFontPreview do
      begin
        Self.Visible := Visible;
        Self.FontStyle := FontStyle;
        Self.PreviewType := PreviewType;
        Self.PreviewText := PreviewText;
        Self.Alignment := Alignment;
        Self.ShowEndEllipsis := ShowEndEllipsis;
        Self.Color := Color;
        Self.WordWrap := WordWrap;
        Self.ShowButtons := ShowButtons;
      end;
    finally
      EndUpdate;
    end
  end
  else
    inherited Assign(Source);
end;

procedure TcxFontPreview.BeforeDestruction;
begin
  FIsDestroying := True;
  inherited BeforeDestruction;
end;

function TcxFontPreview.GetOwner: TPersistent;
begin
  Result := FOwner;
end;

procedure TcxFontPreview.Changed;
begin
  if FUpdateCount = 0 then
  begin
    if Assigned(FOnChanged) and not IsDestroying then
      FOnChanged(Self);
    FModified := False;
  end
  else
    FModified := True;
end;

procedure TcxFontPreview.BeginUpdate;
begin
  Inc(FUpdateCount);
end;

procedure TcxFontPreview.EndUpdate;
begin
  if FUpdateCount <> 0 then
  begin
    Dec(FUpdateCount);
    if FModified then Changed;
  end;
end;

function TcxFontPreview.IsDestroying: Boolean;
begin
  Result := FIsDestroying;
end;

procedure TcxFontPreview.SetFontStyle(Value: TFontStyles);
begin
  if FFontStyle <> Value then
  begin
    FFontStyle := Value;
    Changed;
  end;
end;

procedure TcxFontPreview.SetVisible(Value: Boolean);
begin
  if FVisible <> Value then
  begin
    FVisible := Value;
    Changed;
  end;
end;

procedure TcxFontPreview.SetPreviewType(Value: TcxFontPreviewType);
begin
  if FPreviewType <> Value then
  begin
    FPreviewType := Value;
    Changed;
  end;
end;

procedure TcxFontPreview.SetPreviewText(Value: TCaption);
begin
  if FPreviewText <> Value then
  begin
    FPreviewText := Value;
    Changed;
  end;
end;

procedure TcxFontPreview.SetAlignment(Value: TAlignment);
begin
  if FAlignment <> Value then
  begin
    FAlignment := Value;
    Changed;
  end;
end;

procedure TcxFontPreview.SetShowEndEllipsis(Value: Boolean);
begin
  if FShowEndEllipsis <> Value then
  begin
    FShowEndEllipsis := Value;
    Changed;
  end;
end;

procedure TcxFontPreview.SetColor(Value: TColor);
begin
  if FColor <> Value then
  begin
    FColor := Value;
    Changed;
  end;
end;

procedure TcxFontPreview.SetWordWrap(Value: Boolean);
begin
  if FWordWrap <> Value then
  begin
    FWordWrap := Value;
    Changed;
  end;
end;

procedure TcxFontPreview.SetShowButtons(Value: Boolean);
begin
  if FShowButtons <> Value then
  begin
    FShowButtons := Value;
    Changed;
  end;
end;
{ TcxFontPreview }

{ TcxFontPanelButton }
procedure TcxFontPanelButton.WndProc(var Message: TMessage);
begin
  inherited;
  case Message.Msg of
    WM_LBUTTONDOWN, WM_LBUTTONUP: Dispatch(Message);
  end;
end;
{ TcxFontPanelButton }

{ TFontPreviewPanel }
constructor TFontPreviewPanel.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := [csAcceptsControls, csCaptureMouse, csClickEvents,
    csSetCaption, csOpaque, csDoubleClicks, csReplicatable];
  Width := 100;
  Height := 40;
  FAlignment := taCenter;
  FShowEndEllipsis := True;
  FShowButtons := True;
  FEdges := [bLeft, bTop, bRight, bBottom];
  FBorderColor := clWindowFrame;
  FWordWrap := False;
  FFontStyle := [];
  Color := clWindow;
  UseDockManager := True;
  FcxCanvas := TcxCanvas.Create(Canvas);
  FLookAndFeel := TcxLookAndFeel.Create(Self);
  CreateButtons;
end;

destructor TFontPreviewPanel.Destroy;
begin
  FreeAndNil(FStrikeOutButton);
  FreeAndNil(FUnderLineButton);
  FreeAndNil(FItalicButton);
  FreeAndNil(FBoldButton);
  FreeAndNil(FLookAndFeel);
  FreeAndNil(FcxCanvas);
  inherited;
end;

procedure TFontPreviewPanel.CreateButtons;
var
  FBtnWidth, FBtnHeight: Integer;
begin
  FBoldButton := TcxFontPanelButton.Create(Self);
  FBoldButton.Parent := Self;
  FBoldButton.Caption := 'B';
  FBoldButton.Font.Name := 'Arial';
  FBoldButton.Font.Size := 8;
  FBtnWidth := NonCanvasTextWidth(FBoldButton.Font, 'B');
  FBtnHeight := NonCanvasTextHeight(FBoldButton.Font);
  FBoldButton.Width := FBtnWidth + 8;
  FBoldButton.Height := FBtnHeight + 2;
  FBoldButton.UseSystemPaint := True;
  FBoldButton.Tag := 0;
  FBoldButton.OnClick := FontButtonsClickHandler;

  FItalicButton := TcxFontPanelButton.Create(Self);
  FItalicButton.Parent := Self;
  FItalicButton.Caption := 'I';
  FItalicButton.Font.Assign(FBoldButton.Font);
  FItalicButton.Width := FBoldButton.Width;
  FItalicButton.Height := FBoldButton.Height;
  FItalicButton.UseSystemPaint := FBoldButton.UseSystemPaint;
  FItalicButton.Tag := 1;
  FItalicButton.OnClick := FontButtonsClickHandler;

  FUnderLineButton := TcxFontPanelButton.Create(Self);
  FUnderLineButton.Parent := Self;
  FUnderLineButton.Caption := 'U';
  FUnderLineButton.Font.Assign(FBoldButton.Font);
  FUnderLineButton.Width := FBoldButton.Width;
  FUnderLineButton.Height := FBoldButton.Height;
  FUnderLineButton.UseSystemPaint := FBoldButton.UseSystemPaint;
  FUnderLineButton.Tag := 2;
  FUnderLineButton.OnClick := FontButtonsClickHandler;

  FStrikeOutButton := TcxFontPanelButton.Create(Self);
  FStrikeOutButton.Parent := Self;
  FStrikeOutButton.Caption := 'S';
  FStrikeOutButton.Font.Assign(FBoldButton.Font);
  FStrikeOutButton.Width := FBoldButton.Width;
  FStrikeOutButton.Height := FBoldButton.Height;
  FStrikeOutButton.UseSystemPaint := FBoldButton.UseSystemPaint;
  FStrikeOutButton.Tag := 3;
  FStrikeOutButton.OnClick := FontButtonsClickHandler;
end;

procedure TFontPreviewPanel.RealignButtons;
begin
  FBoldButton.Visible := ShowButtons;
  FItalicButton.Visible := ShowButtons;
  FUnderLineButton.Visible := ShowButtons;
  FStrikeOutButton.Visible := ShowButtons;
  if ShowButtons = True then
  begin
    FBoldButton.LookAndFeel.Assign(FLookAndFeel);
    FItalicButton.LookAndFeel.Assign(FLookAndFeel);
    FUnderLineButton.LookAndFeel.Assign(FLookAndFeel);
    FStrikeOutButton.LookAndFeel.Assign(FLookAndFeel);
    FBoldButton.Top := Height - FBoldButton.Height - 2;
    FItalicButton.Top := FBoldButton.Top;
    FUnderLineButton.Top := FBoldButton.Top;
    FStrikeOutButton.Top := FBoldButton.Top;

    FStrikeOutButton.Left := Width - FStrikeOutButton.Width - 1;
    FUnderLineButton.Left := FStrikeOutButton.Left - FUnderLineButton.Width - 1;
    FItalicButton.Left := FUnderLineButton.Left - FItalicButton.Width - 1;
    FBoldButton.Left := FItalicButton.Left - FBoldButton.Width - 1;
  end;
end;

procedure TFontPreviewPanel.SetFontStyleButtonsState;
begin
  if (fsBold in FFontStyle) then
  begin
    FBoldButton.Colors.Normal := GetLightSelColor;
    FBoldButton.Font.Style := [fsBold];
  end
  else
  begin
    FBoldButton.Colors.Normal := clDefault;
    FBoldButton.Font.Style := [];
  end;
  if (fsItalic in FFontStyle) then
  begin
    FItalicButton.Colors.Normal := GetLightSelColor;
    FItalicButton.Font.Style := [fsBold];
  end
  else
  begin
    FItalicButton.Colors.Normal := clDefault;
    FItalicButton.Font.Style := [];
  end;
  if (fsUnderLine in FFontStyle) then
  begin
    FUnderLineButton.Colors.Normal := GetLightSelColor;
    FUnderLineButton.Font.Style := [fsBold];
  end
  else
  begin
    FUnderLineButton.Colors.Normal := clDefault;
    FUnderLineButton.Font.Style := [];
  end;
  if (fsStrikeOut in FFontStyle) then
  begin
    FStrikeOutButton.Colors.Normal := GetLightSelColor;
    FStrikeOutButton.Font.Style := [fsBold];
  end
  else
  begin
    FStrikeOutButton.Colors.Normal := clDefault;
    FStrikeOutButton.Font.Style := [];
  end;
end;

procedure TFontPreviewPanel.Paint;
const
  Alignments: array[TAlignment] of Longint = (DT_LEFT, DT_RIGHT, DT_CENTER);
var
  FRect: TRect;
begin
  FRect := GetClientRect;
  with cxCanvas do
  begin
    Brush.Color := Color;
    FillRect(FRect);
    DrawComplexFrame(FRect, FBorderColor, FBorderColor, FEdges);
    InflateRect(FRect, -2, -2);
    Brush.Style := bsClear;
    CalculateFont(FRect);
    Windows.DrawText(Canvas.Handle, @Caption[1], Length(Caption),
      FRect, GetTextFlag(DT_NOPREFIX));
  end;
end;

procedure TFontPreviewPanel.CalculateFont(const ARect: TRect);
var
  FTextRect: TRect;
begin
  if FontName = '' then
    Canvas.Font.Name := 'Arial'
  else
    Canvas.Font.Name := FontName;
  Canvas.Font.Size := 8;
  Canvas.Font.Style := CalculateFontStyle;
  if Trim(Caption) = '' then Exit;
  FTextRect := Rect(ARect.Left, ARect.Top, ARect.Right - 1, ARect.Top + 1);
  while (RectHeight(FTextRect) <= RectHeight(ARect)) and
        (RectWidth(FTextRect) <= RectWidth(ARect)) do
  begin
    DrawText(Canvas.Handle, @Caption[1], Length(Caption),
      FTextRect, GetTextFlag(DT_CALCRECT or DT_NOPREFIX));
    if (RectHeight(FTextRect) <= RectHeight(ARect)) and
       (RectWidth(FTextRect) <= RectWidth(ARect)) then
      Canvas.Font.Size := Canvas.Font.Size + 1
    else
      if Canvas.Font.Size > 8 then Canvas.Font.Size := Canvas.Font.Size - 1;
  end;
end;

function TFontPreviewPanel.GetTextFlag(const AStartFlag: Longint): Longint;
const
  AlignmentsHorzArray: array[TAlignment] of Integer =
    (DT_LEFT, DT_RIGHT, DT_CENTER);
  AlignmentsVertArray: array[TcxAlignmentVert] of Integer =
    (DT_TOP, DT_BOTTOM, DT_VCENTER);
  ShowEndEllipsisArray: array[Boolean] of Integer = (0, DT_END_ELLIPSIS);
  WordWrapArray: array[Boolean] of Integer = (0, DT_WORDBREAK);
begin
  Result := AStartFlag or AlignmentsHorzArray[Alignment] or DT_VCENTER or
    ShowEndEllipsisArray[ShowEndEllipsis] or WordWrapArray[WordWrap];
end;

function TFontPreviewPanel.CalculateFontStyle: TFontStyles;
begin
  Result := FFontStyle;
end;

procedure TFontPreviewPanel.FontButtonsClickHandler(Sender: TObject);
begin
  case (Sender as TComponent).Tag of
    0: if (fsBold in FFontStyle) then
         FFontStyle := FFontStyle - [fsBold]
       else
         FFontStyle := FFontStyle + [fsBold];
    1: if (fsItalic in FFontStyle) then
         FFontStyle := FFontStyle - [fsItalic]
       else
         FFontStyle := FFontStyle + [fsItalic];
    2: if (fsUnderLine in FFontStyle) then
         FFontStyle := FFontStyle - [fsUnderLine]
       else
         FFontStyle := FFontStyle + [fsUnderLine];
    3: if (fsStrikeOut in FFontStyle) then
         FFontStyle := FFontStyle - [fsStrikeOut]
       else
         FFontStyle := FFontStyle + [fsStrikeOut];
  end;

  FontPreview.FontStyle := FFontStyle;
  if Assigned(FontPreview.OnButtonClick) then
    FontPreview.OnButtonClick(Self, TcxFontButtonType((Sender as TComponent).Tag));

  if TcxFontPanelButton(Sender).Colors.Normal <> clDefault then
  begin
    TcxFontPanelButton(Sender).Colors.Normal := clDefault;
    TcxFontPanelButton(Sender).Font.Style := [];
  end else
  begin
    TcxFontPanelButton(Sender).Colors.Normal := GetLightSelColor;
    TcxFontPanelButton(Sender).Font.Style := [fsBold];
  end;

  Invalidate;
end;

procedure TFontPreviewPanel.SetLocked(Value: Boolean);
begin
  FLocked := Value;
  if FLocked = False then Invalidate;
end;

procedure TFontPreviewPanel.SetAlignment(Value: TAlignment);
begin
  FAlignment := Value;
  if FLocked = False then Invalidate;
end;

procedure TFontPreviewPanel.SetShowEndEllipsis(Value: Boolean);
begin
  FShowEndEllipsis := Value;
  if FLocked = False then Invalidate;
end;

procedure TFontPreviewPanel.SetEdges(Value: TcxBorders);
begin
  FEdges := Value;
  if FLocked = False then Invalidate;
end;

procedure TFontPreviewPanel.SetFontName(Value: string);
begin
  FFontName := Value;
  if FLocked = False then Invalidate;
end;

procedure TFontPreviewPanel.SetFontStyle(Value: TFontStyles);
begin
  FFontStyle := Value;
  SetFontStyleButtonsState;
end;

procedure TFontPreviewPanel.SetWordWrap(Value: Boolean);
begin
  FWordWrap := Value;
  if FLocked = False then Invalidate;
end;

procedure TFontPreviewPanel.SetShowButtons(Value: Boolean);
begin
  if FShowButtons <> Value then
  begin
    FShowButtons := Value;
    RealignButtons;
  end;
end;

procedure TFontPreviewPanel.SetLookAndFeel(Value: TcxLookAndFeel);
begin
  FLookAndFeel.Assign(Value);
  RealignButtons;
end;
{ TFontPreviewPanel }

{ TcxMRUFontNameItem }
constructor TcxMRUFontNameItem.Create(Collection: TCollection);
begin
  inherited Create(Collection);
end;

procedure TcxMRUFontNameItem.Assign(Source: TPersistent);
begin
  if Source is TcxMRUFontNameItem then
    with TcxMRUFontNameItem(Source) do
    begin
      Self.FontName := FontName;
    end
  else
    inherited Assign(Source);
end;

procedure TcxMRUFontNameItem.SetFontName(const Value: TFontName);
begin
  if FFontName <> Value then begin
    FFontName := Value;
    TcxMRUFontNameItems(Collection).Changed;
  end;
end;
{ TcxMRUFontNameItem }

{ TcxMRUFontNameItems }
constructor TcxMRUFontNameItems.Create(AOwner: TPersistent; ItemClass: TCollectionItemClass);
begin
  inherited Create(AOwner, ItemClass);
end;

destructor TcxMRUFontNameItems.Destroy;
begin
  inherited Destroy;
end;

function TcxMRUFontNameItems.GetItems(Index: Integer): TcxMRUFontNameItem;
begin
  Result := TcxMRUFontNameItem(inherited Items[Index]);
end;

procedure TcxMRUFontNameItems.SetItems(Index: Integer; const Value: TcxMRUFontNameItem);
begin
  inherited Items[Index] := Value;
end;

procedure TcxMRUFontNameItems.Update(Item: TCollectionItem);
begin
  with TcxFontNameComboBoxProperties(Owner) do
  begin
    Changed;
  end;
end;

{$IFNDEF DELPHI6}
function TcxMRUFontNameItems.Owner: TPersistent;
begin
  Result := GetOwner;
end;
{$ENDIF}

function TcxMRUFontNameItems.Add: TcxMRUFontNameItem;
begin
  Result := TcxMRUFontNameItem(inherited Add);
end;

function TcxMRUFontNameItems.Insert(Index: Integer): TcxMRUFontNameItem;
begin
  Result := TcxMRUFontNameItem(inherited Insert(Index));
end;

procedure TcxMRUFontNameItems.Move(CurIndex, NewIndex: Integer);
var
  FNewFontNameItem, FOldFontNameItem: TcxMRUFontNameItem;
begin
  if CurIndex = NewIndex then Exit;
  FOldFontNameItem := Items[CurIndex];
  FNewFontNameItem := Insert(NewIndex);
  FNewFontNameItem.Assign(FOldFontNameItem);
  FOldFontNameItem.Free;
end;

function TcxMRUFontNameItems.AddMRUFontName(const AFontName: TFontName): TcxMRUFontNameItem;
begin
  Result := nil;
  if (AFontName = '') or (FindFontName(AFontName) <> nil) then Exit;
  Result := Add;
  Result.FontName := AFontName;
end;

function TcxMRUFontNameItems.InsertMRUFontName(Index: Integer;const AFontName: TFontName): TcxMRUFontNameItem;
begin
  Result := nil;
  if (AFontName = '') or (FindFontName(AFontName) <> nil) then Exit;
  Result := Insert(Index);
  Result.FontName := AFontName;
end;

function TcxMRUFontNameItems.FindFontName(const AFontName: TFontName): TcxMRUFontNameItem;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to Count - 1 do
  begin
    if Items[I].FontName = AFontName then
    begin
      Result := Items[I];
      Break;
    end;
  end;
end;
{ TcxMRUFontNameItems }

{ TcxCustomFontNameComboBoxViewInfo }
procedure TcxCustomFontNameComboBoxViewInfo.Paint(ACanvas: TcxCanvas);
var
  CurrentBitmap: TBitmap;
  FTextRectHeight, FH, FDeltaX, FDeltaY: Integer;
begin
  inherited Paint(ACanvas);
  if (FCurrentIndex <> -1) and (ftiShowInCombo in ShowFontTypeIcon) then
  begin
    if IsTrueTypeFont then
      CurrentBitmap := FTrueTypeFontBitmap
    else
      CurrentBitmap := FNonTrueTypeFontBitmap;
    FH := CurrentBitmap.Height;
    FTextRectHeight := RectHeight(TextRect);
    FDeltaX := 0;
    FDeltaY := ((FTextRectHeight - FH) div 2);
    if not IsInplace then
    begin
      Inc(FDeltaX, 2);
      Inc(FDeltaY, 2);
    end
    else
    begin
      if Focused then
      begin
        Dec(FDeltaX, 1);
        Dec(FDeltaY, 1);
      end;
    end;
    ACanvas.Draw(ImageRect.Left + FDeltaX, ImageRect.Top + FDeltaY, CurrentBitmap);
  end;
end;

procedure TcxCustomFontNameComboBoxViewInfo.Offset(DX, DY: Integer);
begin
  inherited;
  OffsetRect(ImageRect, DX, DY);
end;
{ TcxCustomFontNameComboBoxViewInfo }

{ TcxCustomFontNameComboBoxViewData }
function TcxCustomFontNameComboBoxViewData.IsComboBoxStyle: Boolean;
begin
  Result := True;
end;

procedure TcxCustomFontNameComboBoxViewData.Calculate(ACanvas: TcxCanvas;
  const ABounds: TRect; const P: TPoint; Button: TcxMouseButton;
  Shift: TShiftState; AViewInfo: TcxCustomEditViewInfo; AIsMouseEvent: Boolean);
var
  FViewInfo: TcxCustomFontNameComboBoxViewInfo;
  FW: Integer;
  FRect: TRect;
begin
  if IsRectEmpty(ABounds) then
  begin
    inherited;
    Exit;
  end;
  inherited Calculate(ACanvas, ABounds, P, Button, Shift, AViewInfo, AIsMouseEvent);
  if (ABounds.Right = MaxInt) or (ABounds.Bottom = MaxInt) then Exit;

  FViewInfo := TcxCustomFontNameComboBoxViewInfo(AViewInfo);
  FViewInfo.ShowFontTypeIcon := TcxCustomFontNameComboBoxProperties(Properties).ShowFontTypeIcon;
  FW := FTrueTypeFontBitmap.Width;
  FRect := ABounds;
  InflateRect(FRect, -2, -2);
  if (ftiShowInCombo in FViewInfo.ShowFontTypeIcon) then
    FRect.Right := FRect.Left + FW;
  FViewInfo.ImageRect := FRect;
  if (ftiShowInCombo in FViewInfo.ShowFontTypeIcon) then
    Inc(FViewInfo.TextRect.Left, FW + 4);
  if not IsInplace then
    FViewInfo.DrawSelectionBar := False;
end;

procedure TcxCustomFontNameComboBoxViewData.DisplayValueToDrawValue(
  const ADisplayValue: TcxEditValue; AViewInfo: TcxCustomEditViewInfo);
var
  FProperties: TcxFontNameComboBoxProperties;
  FViewInfo: TcxCustomFontNameComboBoxViewInfo;
begin
  FProperties := TcxFontNameComboBoxProperties(Properties);
  FViewInfo := TcxCustomFontNameComboBoxViewInfo(AViewInfo);
  FProperties.SetupViewInfoByItem(ADisplayValue, FViewInfo);
  if FViewInfo.FCurrentIndex <> -1 then
    FViewInfo.IsTrueTypeFont := (cxftTTF in FProperties.ItemTypes[FViewInfo.FCurrentIndex]);
end;

procedure TcxCustomFontNameComboBoxViewData.EditValueToDrawValue(ACanvas: TcxCanvas;
  const AEditValue: TcxEditValue; AViewInfo: TcxCustomEditViewInfo);
var
  FProperties: TcxFontNameComboBoxProperties;
  FViewInfo: TcxCustomFontNameComboBoxViewInfo;
begin
  PrepareSelection(AViewInfo);
  FProperties := TcxFontNameComboBoxProperties(Properties);
  FViewInfo := TcxCustomFontNameComboBoxViewInfo(AViewInfo);
  FProperties.SetupViewInfoByItem(AEditValue, FViewInfo);
  if FViewInfo.FCurrentIndex <> -1 then
    FViewInfo.IsTrueTypeFont := (cxftTTF in FProperties.ItemTypes[FViewInfo.FCurrentIndex]);
end;

function TcxCustomFontNameComboBoxViewData.GetEditContentSize(ACanvas: TcxCanvas;
  const AEditValue: TcxEditValue;
  const AEditSizeProperties: TcxEditSizeProperties): TSize;
var
  FProperties: TcxFontNameComboBoxProperties;
  FItemIndex: Integer;
begin
  Result := inherited GetEditContentSize(ACanvas, AEditValue, AEditSizeProperties);
  FProperties := TcxFontNameComboBoxProperties(Properties);
  FItemIndex := FProperties.FindItemByValue(AEditValue);
  if (FItemIndex >= 0) and (ftiShowInCombo in FProperties.ShowFontTypeIcon) then
    Inc(Result.cx, FTrueTypeFontBitmap.Width + 4);
end;
{ TcxCustomFontNameComboBoxViewData }

{ TcxFontNameComboBoxListBox }
function TcxFontNameComboBoxListBox.DoDrawItem(AIndex: Integer; const ARect: TRect;
  AState: TOwnerDrawState): Boolean;
{$IFNDEF VCL}
var
  R: TRect;
{$ENDIF}
begin
  with Edit.Properties do
  begin
    Result := Assigned(OnDrawItem);
    if Result then
{$IFDEF VCL}
      OnDrawItem(Edit, Canvas, AIndex, ARect, AState);
{$ELSE}
    begin
      if odSelected in State then
      begin
        R := ARect;
        R.Right := Width;
        Canvas.Brush.Color := clHighlight;
        Canvas.FillRect(R);
  {$IFDEF LINUX}
        Canvas.DrawFocusRect(R);
  {$ENDIF}
      end;
      OnDrawItem(Edit, Canvas, AIndex, R, AState);
    end;
{$ENDIF}
  end;
end;

function TcxFontNameComboBoxListBox.GetHeight(ARowCount: Integer; AMaxHeight: Integer): Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to ARowCount - 1 do
    Inc(Result, GetItemHeight(I));
end;

function TcxFontNameComboBoxListBox.GetItem(Index: Integer): TCaption;
begin
  Result := Edit.LookupData.GetItem(Index);
end;

function TcxFontNameComboBoxListBox.GetItemHeight(AIndex: Integer = -1): Integer;
begin
  Result := inherited GetItemHeight;
  if Edit.Properties.UseOwnFont = True then
    Inc(Result, 4)
   else
    if Result <= FTrueTypeFontBitmap.Height then
      Result := FTrueTypeFontBitmap.Height + 4;
  if (AIndex >= 0) and Assigned(OnMeasureItem) then
    Edit.Properties.OnMeasureItem((TcxCustomFontNameComboBox(Edit) as TcxCustomComboBox),
      AIndex, Canvas, Result);
  if AIndex = (Edit.Properties.FMRUFontNames.Count - 1) then Inc(Result, 3);
end;

procedure TcxFontNameComboBoxListBox.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  if (Edit <> nil) and (Edit.PopupMouseMoveLocked) then
  begin
    Edit.PopupMouseMoveLocked := False;
    Exit;
  end;
  inherited MouseMove(Shift, X, Y);
end;

procedure TcxFontNameComboBoxListBox.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  AItemIndex: Integer;
begin
  inherited MouseDown(Button, Shift, X, Y);
  if Button <> mbLeft then
    Exit;
  AItemIndex := ItemAtPos(Point(X, Y), True);
  if AItemIndex <> -1 then
  begin
    SetCaptureControl(nil);
    ItemIndex := AItemIndex;
    Edit.CloseUp(True);
  end;
end;

{$IFDEF VCL}
procedure TcxFontNameComboBoxListBox.DrawItem(Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  PrevBrushColor: TColor;
  PrevCanvasFont : TFont;
  S: string;
  AFlags: Longint;
  FW, FH, FDelta : Integer;
  AText: string;
  CurrentBitmap: TBitmap;
  FTextRect: TRect;
begin
  if DoDrawItem(Index, Rect, State) then Exit;
  with Canvas, Rect do begin
    PrevBrushColor := Brush.Color;
    PrevCanvasFont := Font;
    if Index = -1 then
      S := ''
    else
      S := Edit.Properties.Items[Index];
    AText := GetItem(Index);
    if (Edit <> nil) and (Edit.Properties.UseOwnFont = True) then
      Canvas.Font.Name:=AText;
    if (Edit <> nil) and (cxftTTF in Edit.Properties.ItemTypes[Index]) then
      CurrentBitmap := FTrueTypeFontBitmap
    else
      CurrentBitmap := FNonTrueTypeFontBitmap;
    FTextRect := Rect;
    Canvas.FillRect(Rect);
    FW := CurrentBitmap.Width;
    FH := CurrentBitmap.Height;
    AFlags := DrawTextBiDiModeFlags(DT_SINGLELINE or DT_LEFT or DT_NOPREFIX);
    if (ftiShowInList in Edit.Properties.ShowFontTypeIcon) then
    begin
      FDelta := ((Rect.Bottom - Rect.Top - FH) div 2);
      Canvas.Draw(FTextRect.Left + FDelta , FTextRect.Top + FDelta , CurrentBitmap);
      Inc(FTextRect.Left, FW + FDelta + 6);
    end
    else
      Inc(FTextRect.Left, 2);
    if (Edit <> nil) and (Edit.Properties.UseOwnFont = True) and
       ((Integer(Edit.Properties.Items.Objects[Index]) and SYMBOL_FONTTYPE) <> 0) then
    begin
      Canvas.Font.Name := 'MS Sans Serif';
      DrawText(PChar(AText), FTextRect, AFlags);
      Inc(FTextRect.Left, Canvas.TextWidth(AText) + 4);
      Canvas.Font.Name := AText;
    end;
    DrawText(PChar(AText), FTextRect, AFlags);
    if (Edit <> nil) and (Index = (Edit.Properties.FMRUFontNames.Count - 1)) then
    begin
      if odSelected in State then
        Canvas.Pen.Color := clWindow
      else
        Canvas.Pen.Color := clWindowText;
      Canvas.MoveTo(Rect.Left, Rect.Bottom - 3);
      Canvas.LineTo(Rect.Right, Rect.Bottom - 3);
      Canvas.MoveTo(Rect.Left, Rect.Bottom - 1);
      Canvas.LineTo(Rect.Right, Rect.Bottom - 1);
    end;
    Brush.Color := PrevBrushColor;
    Font := PrevCanvasFont;
    if odSelected in State then Windows.DrawFocusRect(Handle, Rect);
  end;
end;
{$ELSE}
function TcxCustomEditListBox.DrawItem(Index: Integer; Rect: TRect; State: TOwnerDrawState): Boolean;
begin
  Result := inherited DrawItem(Index, Rect, State);
end;
{$ENDIF}

{$IFDEF VCL}
procedure TcxFontNameComboBoxListBox.MeasureItem(Index: Integer; var Height: Integer);
{$ELSE}
procedure TcxFontNameComboBoxListBox.MeasureItem(Control: TWinControl;
  {$IFDEF LINUX}item: QClxListBoxItemH{$ELSE}Index: Integer{$ENDIF};
  var Height, Width: Integer);
{$ENDIF}
begin
  Height := GetItemHeight(Index);
end;

function TcxFontNameComboBoxListBox.GetEdit: TcxCustomFontNameComboBox;
begin
  Result := TcxCustomFontNameComboBox(TcxCustomEditPopupWindow(Owner).OwnerControl);
end;
{ TcxFontNameComboBoxListBox }

{ TcxFontNameComboBoxLookupData }
constructor TcxFontNameComboBoxLookupData.Create(AOwner: TPersistent);
begin
  inherited Create(AOwner);
  FDefaultPreviewHeight := 38;
end;

destructor TcxFontNameComboBoxLookupData.Destroy;
begin
  FPanel := nil;
  inherited;
end;

function TcxFontNameComboBoxLookupData.CanResizeVisualArea(var NewSize: TSize): Boolean;
begin
  Result := inherited CanResizeVisualArea(NewSize);
end;

function TcxFontNameComboBoxLookupData.GetVisualAreaPreferredSize(AMaxHeight: Integer; AWidth: Integer = 0): TSize;
begin
  Result := inherited GetVisualAreaPreferredSize(AMaxHeight, AWidth);
  if TcxCustomFontNameComboBoxProperties(Properties).FontPreview.Visible then
    Inc(Result.cy, FDefaultPreviewHeight);
end;

procedure TcxFontNameComboBoxLookupData.Initialize(AVisualControlsParent: TWinControl);
begin
  inherited Initialize(AVisualControlsParent);
  if TcxCustomFontNameComboBoxProperties(Properties).FontPreview.Visible and
    Assigned(AVisualControlsParent) and AVisualControlsParent.HandleAllocated then
  begin
    if not Assigned(FPanel) then
    begin
      FPanel := TFontPreviewPanel.Create(AVisualControlsParent);
      FPanel.FontPreview := TcxCustomFontNameComboBoxProperties(Properties).FontPreview;
    end;

    FPanel.Locked := True;
    try
      FPanel.Edges := [bBottom];
      FPanel.Caption := GetPreviewText;
      FPanel.FontName := GetFontName;
      FPanel.Height := FDefaultPreviewHeight;
      with TcxCustomFontNameComboBoxProperties(Properties) do
      begin
        FPanel.FontStyle := FontPreview.FontStyle;
        FPanel.Color := FontPreview.Color;
        FPanel.ShowEndEllipsis := FontPreview.ShowEndEllipsis and
          (FontPreview.PreviewType <> cxfpFontName);
        FPanel.Alignment := FontPreview.Alignment;
        FPanel.WordWrap := FontPreview.WordWrap and (FontPreview.PreviewType <> cxfpFontName);
        if Edit <> nil then
          FPanel.FLookAndFeel.Assign(TcxCustomEditAccess(Edit).Style.LookAndFeel);
        FPanel.ShowButtons := FontPreview.ShowButtons;
      end;
      FPanel.Parent := AVisualControlsParent;
      FPanel.Visible := True;
    finally
      FPanel.Locked := False;
    end;
  end
  else
    if Assigned(FPanel) and FPanel.HandleAllocated then FPanel.Visible := False;
end;

procedure TcxFontNameComboBoxLookupData.PositionVisualArea(const AClientRect: TRect);
begin
  inherited;
  if TcxCustomFontNameComboBoxProperties(Properties).FontPreview.Visible and
    Assigned(FPanel) and FPanel.HandleAllocated then
  begin
    FPanel.SetBounds(AClientRect.Left, AClientRect.Top,
      AClientRect.Right - 1, AClientRect.Top + FDefaultPreviewHeight);
    FPanel.RealignButtons;
    List.SetBounds(AClientRect.Left, AClientRect.Top + FDefaultPreviewHeight,
      AClientRect.Right - 1, AClientRect.Bottom - FDefaultPreviewHeight - 1);
  end
  else
    List.SetBounds(AClientRect.Left, AClientRect.Top,
      AClientRect.Right - 1, AClientRect.Bottom - 1);
end;

function TcxFontNameComboBoxLookupData.GetListBoxClass: TcxCustomEditListBoxClass;
begin
  Result := TcxFontNameComboBoxListBox;
end;

procedure TcxFontNameComboBoxLookupData.InternalChangeCurrentMRUFontNamePosition;
var
  FIndex: Integer;
begin
  if ItemIndex > (TcxCustomFontNameComboBoxProperties(Properties).FMRUFontNames.Count - 1) then
  begin
    FIndex := Items.IndexOf(Items[ItemIndex]);
    if FIndex >= 0 then
      InternalSetCurrentKey(FIndex);
  end;
end;

function TcxFontNameComboBoxLookupData.GetPreviewText: string;
begin
  with TcxCustomFontNameComboBoxProperties(Properties) do
    case FontPreview.PreviewType of
      cxfpCustom: Result := TcxCustomFontNameComboBoxProperties(Properties).FontPreview.PreviewText;
      cxfpFullAlphabet: Result := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz 1234567890';
      else
        Result := GetFontName;
    end;
end;

function TcxFontNameComboBoxLookupData.GetFontName: string;
begin
  if ItemIndex = -1 then
    Result := ''
  else
    Result := Items[ItemIndex];
end;

procedure TcxFontNameComboBoxLookupData.HandleSelectItem(Sender: TObject);
begin
  inherited;
  if Assigned(FPanel) and FPanel.HandleAllocated then
  begin
    FPanel.Locked := True;
    try
      if ItemIndex >= 0 then
        FPanel.FontName := GetFontName;
      with TcxCustomFontNameComboBoxProperties(Properties) do
        if FontPreview.PreviewType <> cxfpFullAlphabet then
          FPanel.Caption := GetPreviewText;
    finally
      FPanel.Locked := False;
    end;
  end;
end;
{ TcxFontNameComboBoxLookupData }

procedure cxDelay(MSecs: LongWord);
var
  FStartTick, FNowTick: LongWord;
begin
  FStartTick := GetTickCount;
  repeat
    Application.ProcessMessages;
    FNowTick := GetTickCount;
  until (FNowTick - FStartTick >= MSecs) or (FNowTick < FStartTick);
end;

{ TcxCustomFontNameComboBoxProperties }
constructor TcxCustomFontNameComboBoxProperties.Create(AOwner: TPersistent);
begin
  inherited Create(AOwner);
  DropDownListStyle := lsFixedList;
  FMaxMRUFonts := 10;
  FFontTypes := [cxftTTF, cxftRaster, cxftDevice, cxftFixed, cxftSymbol];
  FUseOwnFont := False;
  FShowFontTypeIcon := [ftiShowInCombo, ftiShowInList];
  FMRUFontNames := TcxMRUFontNameItems.Create(Self, TcxMRUFontNameItem);
  FFontPreview := TcxFontPreview.Create(Self);
  FLoadFontComplete := True;
  FFontItems := TStringList.Create;
  LoadFontNames;
end;

destructor TcxCustomFontNameComboBoxProperties.Destroy;
begin
  FreeAndNil(FFontPreview);
  FreeAndNil(FMRUFontNames);
  FreeAndNil(FFontItems);
  ShutDownFontLoader;
  inherited;
end;

procedure TcxCustomFontNameComboBoxProperties.Assign(Source: TPersistent);
begin
  if Source is TcxCustomFontNameComboBoxProperties then
  begin
    BeginUpdate;
    try
      inherited Assign(Source);
      with Source as TcxCustomFontNameComboBoxProperties do
      begin
        Self.UseOwnFont := UseOwnFont;
        Self.FontTypes := FontTypes;
        Self.ShowFontTypeIcon := ShowFontTypeIcon;
        Self.FontPreview := FontPreview;
        Self.MaxMRUFonts := MaxMRUFonts;
        Self.OnAddedMRUFont := OnAddedMRUFont;
        Self.OnMovedMRUFont := OnMovedMRUFont;
        Self.OnDeletedMRUFont := OnDeletedMRUFont;
        Self.OnLoadFontComplete := OnLoadFontComplete;
        Self.FontPreview.Assign(FontPreview);
        Self.FontItems.Assign(FontItems);
        Self.MRUFontNames.Assign(MRUFontNames);
      end;
    finally
      EndUpdate;
    end
  end
  else
    inherited Assign(Source);
end;

class function TcxCustomFontNameComboBoxProperties.GetContainerClass: TcxContainerClass;
begin
  Result := TcxFontNameComboBox;
end;

class function TcxCustomFontNameComboBoxProperties.GetLookupDataClass: TcxInterfacedPersistentClass;
begin
  Result := TcxFontNameComboBoxLookupData;
end;

class function TcxCustomFontNameComboBoxProperties.GetPopupWindowClass: TcxCustomEditPopupWindowClass;
begin
  Result := TcxFontNameComboBoxPopupWindow;
end;

class function TcxCustomFontNameComboBoxProperties.GetViewDataClass: TcxCustomEditViewDataClass;
begin
  Result := TcxCustomFontNameComboBoxViewData;
end;

class function TcxCustomFontNameComboBoxProperties.GetViewInfoClass: TcxContainerViewInfoClass;
begin
  Result := TcxCustomFontNameComboBoxViewInfo;
end;

procedure TcxCustomFontNameComboBoxProperties.ShutDownFontLoader;
begin
  if Assigned(FFontLoader) then
  begin
    FFontLoader.OnCompleteThread := nil;
    FFontLoader.Terminate;
    while Assigned(FFontLoader) do
      cxDelay(100);
  end;
end;

function TcxCustomFontNameComboBoxProperties.GetFontTypes: TcxFontTypes;
begin
  Result := FFontTypes;
end;

procedure TcxCustomFontNameComboBoxProperties.SetFontTypes(Value: TcxFontTypes);
begin
  if FFontTypes <> Value then begin
    FFontTypes := Value;
    FMRUFontNames.Clear;
    LoadFontNames;
    Changed;
  end;
end;

procedure TcxCustomFontNameComboBoxProperties.SetMaxMRUFonts(Value: Byte);
var
  FOldMaxMRUFonts: Byte;
begin
  if FMaxMRUFonts <> Value then
  begin
    FOldMaxMRUFonts := FMaxMRUFonts;
    FMaxMRUFonts := Value;
    if FOldMaxMRUFonts > Value then
    begin
      DeleteOverMRUFonts;
      Changed;
    end;
  end;
end;

function TcxCustomFontNameComboBoxProperties.GetUseOwnFont: Boolean;
begin
  Result := FUseOwnFont;
end;

procedure TcxCustomFontNameComboBoxProperties.SetUseOwnFont(Value: Boolean);
begin
  if FUseOwnFont <> Value
  then begin
    FUseOwnFont := Value;
    Changed;
  end;
end;

procedure TcxCustomFontNameComboBoxProperties.SetShowFontTypeIcon(Value: TcxShowFontIconTypes);
begin
  if FShowFontTypeIcon <> Value then
  begin
    FShowFontTypeIcon := Value;
    Changed;
  end;
end;

procedure TcxCustomFontNameComboBoxProperties.SetupViewInfoByItem(
  const AEditValue: TcxEditValue; AViewInfo: TcxCustomFontNameComboBoxViewInfo);
begin
  LockUpdate(True);
  try
    if not LoadFontComplete then
    begin
      AViewInfo.Text := 'Loading ...';
      AViewInfo.FCurrentIndex := -1;
    end
    else
    begin
      AViewInfo.FCurrentIndex := FindItemByValue(AEditValue);
      if (AViewInfo.FCurrentIndex = -1) then
        AViewInfo.Text := ''
      else
        AViewInfo.Text := Items[AViewInfo.FCurrentIndex];
    end;
  finally
    LockUpdate(False);
  end;
end;

function TcxCustomFontNameComboBoxProperties.FindItemByValue(const AEditValue: TcxEditValue): Integer;
begin
  if not LoadFontComplete then
    Result := -1
  else
    if IsVarEmpty(AEditValue) then
      Result := -1
    else
      Result := Items.IndexOf(VarToStr(AEditValue));
end;

function TcxCustomFontNameComboBoxProperties.GetItemTypes(Index: Integer): TcxFontTypes;
begin
  Result := RealFontTypeToCxTypes(Integer(Items.Objects[Index]));
end;

procedure TcxCustomFontNameComboBoxProperties.SetFontPreview(Value: TcxFontPreview);
begin
  FontPreview.Assign(Value);
  Changed;
end;

procedure TcxCustomFontNameComboBoxProperties.LoadFontNames;
begin
  { Prepare to ShutDown FontLoader}
  if (not FLoadFontComplete) or (Assigned(FFontLoader)) then
  begin
    if Assigned(FFontLoader) then FFontLoader.OnCompleteThread := nil;
    ShutDownFontLoader;
  end;
  FLoadFontComplete := False;
  FFontLoader := TcxFontLoader.Create(FFontTypes);
  FFontLoader.OnCompleteThread := FontLoaderCompleteHandler;
  FFontLoader.OnDestroyThread := FontLoaderDestroyHandler;
  FFontLoader.Resume;
end;

procedure TcxCustomFontNameComboBoxProperties.Update(AProperties: TcxCustomEditProperties);
var
  FProperties: TcxCustomFontNameComboBoxProperties;
begin
  if (AProperties is TcxCustomFontNameComboBoxProperties) and
    (FLoadFontComplete) then
  begin
    FProperties := (AProperties as TcxCustomFontNameComboBoxProperties);
    FProperties.Items.Assign(Items);
    FProperties.MRUFontNames.Assign(MRUFontNames);
  end;
end;

procedure TcxCustomFontNameComboBoxProperties.FontLoaderCompleteHandler(Sender: TObject);
begin
  Items.BeginUpdate;
  try
    Items.Clear;
    if Assigned(Sender) then Items.Assign((Sender as TcxFontLoader).FontList);
    FFontItems.Assign(Items);
  finally
    Items.EndUpdate;
  end;
  FLoadFontComplete := True;
  if Assigned(FOnInternalLoadFontComplete) then FOnInternalLoadFontComplete(Self);
  if Assigned(OnLoadFontComplete) then OnLoadFontComplete(Self);
  Changed;
end;

procedure TcxCustomFontNameComboBoxProperties.FontLoaderDestroyHandler(Sender: TObject);
begin
  FFontLoader.OnCompleteThread := nil;
  FFontLoader.OnDestroyThread := nil;
  FFontLoader := nil;
  FLoadFontComplete := True;
end;

function TcxCustomFontNameComboBoxProperties.AddMRUFontName(const AFontName: TFontName): TcxMRUFontNameAction;
var
  FIndex: Integer;
begin
  Result := mfaNone;
  if MaxMRUFonts = 0 then Exit;
  Result := mfaInvalidFontName;
  FIndex := Items.IndexOf(AFontName);
  if FIndex < 0 then Exit;
  {If this font exists in MRU list, do not add, only move to first position}
  if FMRUFontNames.FindFontName(AFontName) <> nil then
  begin
    if (FIndex > 0) and (FIndex < FMRUFontNames.Count) then
    begin
      Result := mfaMoved;
      Items.Move(FIndex, 0);
      FMRUFontNames.Move(FIndex, 0);
      if Assigned(OnMovedMRUFont) then
        OnMovedMRUFont(Self);
    end
    else
      Result := mfaNone;
  end
  else
    Result := mfaAdded;
  if Result = mfaAdded then
  begin
    FMRUFontNames.InsertMRUFontName(0, AFontName);
    Items.InsertObject(0, AFontName, Items.Objects[FIndex]);
    DeleteOverMRUFonts;
    if Assigned(OnAddedMRUFont) then
      OnAddedMRUFont(Self);
  end;
end;

function TcxCustomFontNameComboBoxProperties.DelMRUFontName(const AFontName: TFontName): TcxMRUFontNameAction;
var
  FIndex: Integer;
begin
  Result := mfaInvalidFontName;
  {Check for right Font name}
  FIndex := Items.IndexOf(AFontName);
  if FIndex < 0 then Exit;
  if FMRUFontNames.FindFontName(AFontName) <> nil then
  begin
{$IFDEF DELPHI5}
    FMRUFontNames.Delete(FIndex);
{$ELSE}
    TcxMRUFontNameItem(FMRUFontNames.Items[FIndex]).Free;
{$ENDIF}
    Items.Delete(FIndex);
    Result := mfaDeleted;
    if Assigned(OnDeletedMRUFont) then
      OnDeletedMRUFont(Self, AFontName);
  end;
end;

procedure TcxCustomFontNameComboBoxProperties.DeleteOverMRUFonts;
var
  I: Integer;
  FDeletedFontName: string;
begin
  BeginUpdate;
  try
    for I := FMRUFontNames.Count - 1 downto 0 do
    begin
      if I >= FMaxMRUFonts then
      begin
{$IFDEF DELPHI5}
        FMRUFontNames.Delete(I);
{$ELSE}
        TcxMRUFontNameItem(FMRUFontNames.Items[I]).Free;
{$ENDIF}
        FDeletedFontName := Items[I];
        Items.Delete(I);
        if Assigned(OnDeletedMRUFont) then
          OnDeletedMRUFont(Self, FDeletedFontName);
      end
      else Break;
    end;
  finally
    EndUpdate;
  end;
end;
{ TcxCustomFontNameComboBoxProperties }

{ TcxCustomFontNameComboBox }
constructor TcxCustomFontNameComboBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FFontNameQueue := '';
  ControlStyle := ControlStyle - [csClickEvents];
  TcxFontNameComboBoxProperties(FProperties).FOnInternalLoadFontComplete := InternalLoadFontCompleteHandler;
end;

class function TcxCustomFontNameComboBox.GetPropertiesClass: TcxCustomEditPropertiesClass;
begin
  Result := TcxFontNameComboBoxProperties;
end;

procedure TcxCustomFontNameComboBox.ContainerStyleChanged(Sender: TObject);
begin
  inherited ContainerStyleChanged(Sender);
end;

procedure TcxCustomFontNameComboBox.DblClick;
begin
  inherited DblClick;
end;

function TcxCustomFontNameComboBox.GetInnerEditClass: TControlClass;
begin
  Result := TcxCustomFontNameComboBoxInnerEdit;
end;

function TcxCustomFontNameComboBox.GetPopupWindowClientPreferredSize: TSize;
begin
  Result := inherited GetPopupWindowClientPreferredSize;
end;

procedure TcxCustomFontNameComboBox.InitializePopupWindow;
begin
  inherited InitializePopupWindow;
  (PopupWindow as TcxFontNameComboBoxPopupWindow).SysPanelStyle := Properties.PopupSizeable;
end;

procedure TcxCustomFontNameComboBox.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseMove(Shift, X, Y);
end;

procedure TcxCustomFontNameComboBox.PopupWindowShowed(Sender: TObject);
begin
  inherited PopupWindowShowed(Sender);
end;

procedure TcxCustomFontNameComboBox.CloseUp(AAccept: Boolean);
var
  FMRUFontNameAction: TcxMRUFontNameAction;
begin
  inherited;
  if AAccept = True then
  begin
    FMRUFontNameAction := AddMRUFontName(Text);
    if (FMRUFontNameAction = mfaNone) or
       (FMRUFontNameAction = mfaMoved) then
      LookupData.InternalChangeCurrentMRUFontNamePosition;
  end;
end;

function TcxCustomFontNameComboBox.AddMRUFontName(const AFontName: TFontName): TcxMRUFontNameAction;
begin
  Result := Properties.AddMRUFontName(AFontName);
end;

function TcxCustomFontNameComboBox.DelMRUFontName(const AFontName: TFontName): TcxMRUFontNameAction;
begin
  Result := Properties.DelMRUFontName(AFontName);
end;

{$IFNDEF VCL}
function TcxCustomFontNameComboBox.EventFilter(Sender: QObjectH; Event: QEventH): Boolean;
begin
  Result := inherited EventFilter(Sender, Event);
end;
{$ENDIF}

function TcxCustomFontNameComboBox.GetProperties: TcxFontNameComboBoxProperties;
begin
  Result := TcxFontNameComboBoxProperties(InternalGetProperties);
end;

function TcxCustomFontNameComboBox.GetFontName: string;
begin
  if ItemIndex = -1 then
    Result := ''
  else
    Result := Properties.Items[ItemIndex];
end;

procedure TcxCustomFontNameComboBox.SetFontName(Value: string);
begin
  if Value = '' then
    ItemIndex := -1
  else
  begin
    if not Properties.LoadFontComplete then
    begin
      FFontNameQueue := Value;
      Exit;
    end;
    ItemIndex := Properties.Items.IndexOf(Value);
  end;
end;

function TcxCustomFontNameComboBox.GetItemIndex: Integer;
begin
  Result := LookupData.CurrentKey;
end;

function TcxCustomFontNameComboBox.GetLookupData: TcxFontNameComboBoxLookupData;
begin
  Result := TcxFontNameComboBoxLookupData(FLookupData);
end;

procedure TcxCustomFontNameComboBox.SetItemIndex(Value: Integer);
var
  APrevItemIndex: Integer;
begin
  if not Properties.LoadFontComplete then Exit;
  APrevItemIndex := ItemIndex;
  LookupData.CurrentKey := Value;
  if ItemIndex <> APrevItemIndex then EditModified := False;
end;

procedure TcxCustomFontNameComboBox.SetProperties(Value: TcxFontNameComboBoxProperties);
begin
  FProperties.Assign(Value);
end;

procedure TcxCustomFontNameComboBox.InternalLoadFontCompleteHandler(Sender: TObject);
var
  FLocalFontName: string;
begin
  if FFontNameQueue <> '' then
  begin
    SetFontName(FFontNameQueue);
    FFontNameQueue := '';
  end
  else
  begin
    if IsVarEmpty(FEditValue) then
      FLocalFontName := ''
    else
      FLocalFontName := VarToStr(FEditValue);
    LookupData.InternalSetCurrentKey(Properties.Items.IndexOf(FLocalFontName));
    LookupData.InternalSetItemIndex(Properties.Items.IndexOf(FLocalFontName));
  end;
end;

procedure TcxCustomFontNameComboBox.InternalSetEditValue(const Value: TcxEditValue;
  AValidateEditValue: Boolean);
begin
  if IsDestroying then Exit;
  inherited;
end;
{ TcxCustomFontNameComboBox }

{ TcxCustomFontNamePopupWindowViewInfo }
procedure TcxCustomFontNamePopupWindowViewInfo.Calculate;
begin
  inherited;
end;

function TcxCustomFontNamePopupWindowViewInfo.GetBorderExtent: TRect;
begin
  Result := inherited GetBorderExtent;
end;

function TcxCustomFontNamePopupWindowViewInfo.GetClientExtent: TRect;
begin
  Result := inherited GetClientExtent;
end;

procedure TcxCustomFontNamePopupWindowViewInfo.Paint(ACanvas: TcxCanvas);
begin
  inherited;
end;
{ TcxCustomFontNamePopupWindowViewInfo }

{ TcxFontNameComboBoxPopupWindow }
class function TcxFontNameComboBoxPopupWindow.GetViewInfoClass: TcxContainerViewInfoClass;
begin
  Result := TcxCustomFontNamePopupWindowViewInfo;
end;
{ TcxFontNameComboBoxPopupWindow }

initialization
  GetRegisteredEditProperties.Register(TcxFontNameComboBoxProperties, scxSEditRepositoryFontNameComboBoxItem);
  FTrueTypeFontBitmap := TBitmap.Create;
  FTrueTypeFontBitmap.LoadFromResourceName(HInstance, 'CXFONTCOMBO_TTF');
  FTrueTypeFontBitmap.Transparent := True;
  FNonTrueTypeFontBitmap := TBitmap.Create;
  FNonTrueTypeFontBitmap.LoadFromResourceName(HInstance, 'CXFONTCOMBO_NONTTF');
  FNonTrueTypeFontBitmap.Transparent := True;

finalization
  GetRegisteredEditProperties.Unregister(TcxFontNameComboBoxProperties);
  FreeAndNil(FNonTrueTypeFontBitmap);
  FreeAndNil(FTrueTypeFontBitmap);

end.
