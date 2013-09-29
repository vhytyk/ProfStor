
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

unit cxColorComboBox;

interface

{$I cxExtEdVer.inc}

uses
  Windows, Messages, TypInfo, SysUtils, Classes, Controls, Graphics, StdCtrls,
  Forms, Dialogs, cxVariants, cxControls, cxContainer, cxGraphics, cxClasses,
  cxEdit, cxTextEdit, cxEditUtils, cxMaskEdit, cxDropDownEdit, cxImageComboBox,
  cxCustomData,
{$IFDEF DELPHI6}
  Variants,
{$ENDIF}
  cxExtEditConsts, cxDataUtils;

type
  TcxColorBoxAlign = (cbaLeft, cbaRight);
  TcxColorNamingConvention = (cxncNone, cxncDelphi, cxncHTML4, cxncX11);
  TcxColorPrepareList = (cxplNone, cxplDelphi, cxplHTML4, cxplX11, cxplX11Ordered);
  TcxColorValueFormat = (cxcvRGB, cxcvHexadecimal, cxcvInteger);
  TcxDefaultColorStyle = (cxdcClear, cxdcColor, cxdcHatched, cxdcText, cxdcCustom);
  TcxMRUColorAction = (mcaNone, mcaMoved, mcaAdded, mcaDeleted);

type
  { TcxColorComboBoxItem }
  TcxColorComboBoxItem = class(TCollectionItem)
  private
    FColor: TColor;
    FDescription: TCaption;
    FIsCustomColor: Boolean;
    function IsDescriptionStored: Boolean;
    procedure SetColor(const Value: TColor);
    procedure SetDescription(const Value: TCaption);
  public
    constructor Create(Collection: TCollection); override;
    procedure Assign(Source: TPersistent); override;
    property IsCustomColor: Boolean read FIsCustomColor;
  published
    property Color: TColor read FColor write SetColor;
    property Description: TCaption read FDescription write SetDescription stored IsDescriptionStored;
  end;

  { TcxColorComboBoxItems }
  TcxColorComboBoxItems = class(TOwnedCollection)
  private
    function GetItems(Index: Integer): TcxColorComboBoxItem;
    procedure SetItems(Index: Integer; const Value: TcxColorComboBoxItem);
  protected
    procedure Update(Item: TCollectionItem); override;
  public
  {$IFNDEF DELPHI6}
    function Owner: TPersistent;
  {$ENDIF}
    property Items[Index: Integer]: TcxColorComboBoxItem read GetItems write SetItems; default;
    function FindColorItem(const AColor: TColor): TcxColorComboBoxItem; virtual;
    function GetIndexByColor(AColor: TColor): Integer;
    function GetColorByIndex(AIndex: Integer; ADefaultColor: TColor): TColor;
    function AddColor(const AColor: TColor;
      const ADescription: string): TcxColorComboBoxItem; virtual;
    function InsertColor(Index: Integer; const AColor: TColor;
      const ADescription: string): TcxColorComboBoxItem; virtual;
    function Add: TcxColorComboBoxItem;
    function Insert(Index: Integer): TcxColorComboBoxItem;
    procedure Move(CurIndex, NewIndex: Integer); virtual;
    procedure ClearNonCustom; virtual;
  end;

  { TcxCustomColorComboBoxViewInfo }
  TcxCustomColorComboBoxViewInfo = class(TcxCustomTextEditViewInfo)
  private
    FBkColor: TColor;
    FColorBoxWidth: Integer;
    FColorBoxAlign: TcxColorBoxAlign;
    FColorBoxRect: TRect;
    FColorBoxFrameColor: TColor;
    FColorBoxColor: TColor;
    FShowDescriptions: Boolean;
    FDefaultColorStyle: TcxDefaultColorStyle;
    FFoundItem: Boolean;
  public
    property BkColor: TColor read FBkColor write FBkColor;
    property ColorBoxWidth: Integer read FColorBoxWidth write FColorBoxWidth;
    property ColorBoxAlign: TcxColorBoxAlign read FColorBoxAlign write FColorBoxAlign;
    property ColorBoxFrameColor: TColor read FColorBoxFrameColor write FColorBoxFrameColor;
    property ColorBoxColor: TColor read FColorBoxColor write FColorBoxColor;
    property ColorBoxRect: TRect read FColorBoxRect write FColorBoxRect;
    property DefaultColorStyle: TcxDefaultColorStyle read FDefaultColorStyle write FDefaultColorStyle;
    property ShowDescriptions: Boolean read FShowDescriptions write FShowDescriptions;
    property FoundItem: Boolean read FFoundItem write FFoundItem;
    procedure Paint(ACanvas: TcxCanvas); override;
    procedure Offset(DX, DY: Integer); override;
  end;

  { TcxCustomColorComboBoxViewData }
  TcxCustomColorComboBoxViewData = class(TcxCustomDropDownEditViewData)
  protected
    procedure CalculateViewInfoProperties(AViewInfo: TcxCustomEditViewInfo); virtual;
  public
    function IsComboBoxStyle: Boolean; override;
    procedure Calculate(ACanvas: TcxCanvas; const ABounds: TRect;
      const P: TPoint; Button: TcxMouseButton; Shift: TShiftState;
      AViewInfo: TcxCustomEditViewInfo; AIsMouseEvent: Boolean); override;
    procedure DisplayValueToDrawValue(const ADisplayValue: TcxEditValue;
      AViewInfo: TcxCustomEditViewInfo); override;
    procedure EditValueToDrawValue(ACanvas: TcxCanvas; const AEditValue: TcxEditValue;
      AViewInfo: TcxCustomEditViewInfo); override;
    function GetEditContentSize(ACanvas: TcxCanvas; const AEditValue: TcxEditValue;
      const AEditSizeProperties: TcxEditSizeProperties): TSize; override;
  end;

  { TcxColorComboBoxListBox }
  TcxCustomColorComboBox = class;
  TcxCustomColorComboBoxProperties = class;
  TcxCustomColorComboBoxListBox = class(TcxCustomEditListBox)
  private
    FProperties: TcxCustomColorComboBoxProperties;
    function GetEdit: TcxCustomColorComboBox;
  protected
    FEdit: TcxCustomColorComboBox;
    function DoDrawItem(AIndex: Integer; const ARect: TRect;
      AState: TOwnerDrawState): Boolean; override;
    function GetHeight(ARowCount: Integer; AMaxHeight: Integer): Integer; override;
    function GetItem(Index: Integer): TCaption; override;
    function GetItemHeight(AIndex: Integer = -1): Integer; override;
    procedure Click; override;
    procedure Resize; override;
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
  public
    property Edit: TcxCustomColorComboBox read GetEdit;
    property Properties: TcxCustomColorComboBoxProperties read FProperties;
    constructor Create(AOwner: TComponent); override;
  end;

  { TcxColorComboBoxLookupData }
  TcxColorComboBoxLookupData = class(TcxComboBoxLookupData)
  protected
    function GetListBoxClass: TcxCustomEditListBoxClass; override;
    function GetItem(Index: Integer): TCaption; override;
    function GetItemCount: Integer; override;
    function InternalChangeCurrentMRUColorPosition(const AColor: TColor): Integer; virtual;
  public
    procedure TextChanged; override;
  end;

  TcxColorComboStyle = (cxccsComboList, cxccsComboEdit);
  TcxColorDialogType = (cxcdtDefault, cxcdtCustom);
  TcxSelectCustomColorEvent = procedure(Sender: TObject; var AColor: TColor;
    var AColorDescription: string; var AddToList: Boolean) of object;
  TcxNamingConventionEvent = procedure(Sender: TObject; const AColor: TColor;
    var AColorDescription: string) of object;
  TcxChangeItemIndexEvent = procedure(Sender: TObject; const AIndex: Integer) of object;
  TcxGetDefaultColorEvent = procedure(Sender: TObject; var AColor: TColor) of object;

  { TcxCustomColorComboBoxProperties }
  TcxCustomColorComboBoxProperties = class(TcxCustomComboBoxProperties)
  private
    FAllowSelectColor: Boolean;
    FColorComboStyle: TcxColorComboStyle;
    FColorBoxAlign: TcxColorBoxAlign;
    FColorBoxFrameColor: TColor;
    FColorBoxWidth: Integer;
    FColorDialogType: TcxColorDialogType;
    FDefaultColor: TColor;
    FDefaultDescription: string;
    FDefaultColorStyle: TcxDefaultColorStyle;
    FItems: TcxColorComboBoxItems;
    FMRUColors: TcxColorComboBoxItems;
    FMaxMRUColors: Byte;
    FNamingConvention: TcxColorNamingConvention;
    FColorValueFormat: TcxColorValueFormat;
    FShowDescriptions: Boolean;
    FOnNamingConvention: TcxNamingConventionEvent;
    FOnSelectCustomColor: TcxSelectCustomColorEvent;
    FOnAddedMRUColor: TNotifyEvent;
    FOnDeletedMRUColor: TNotifyEvent;
    FOnGetDefaultColor: TcxGetDefaultColorEvent;
    FOnLoadColorList: TNotifyEvent;
    FInternalUpdate: Boolean;
    FPrepareList: TcxColorPrepareList;
    FPrepareInfo: string;
    function GetItems: TcxColorComboBoxItems;
    procedure SetColorBoxWidth(Value: Integer);
    procedure SetColorBoxAlign(Value: TcxColorBoxAlign);
    procedure SetColorBoxFrameColor(Value: TColor);
    procedure SetDefaultColor(Value: TColor);
    procedure SetDefaultDescription(Value: string);
    procedure SetDefaultColorStyle(Value: TcxDefaultColorStyle);
    procedure SetShowDescriptions(const Value: Boolean);
    procedure SetAllowSelectColor(Value: Boolean);
    procedure SetColorComboStyle(Value: TcxColorComboStyle);
    procedure SetItems(const Value: TcxColorComboBoxItems);
    procedure SetMaxMRUColors(Value: Byte);
    procedure SetNamingConvention(Value: TcxColorNamingConvention);
    procedure SetColorValueFormat(Value: TcxColorValueFormat);
    procedure SetPrepareInfo(Value: string);
    procedure SetupViewInfoByItem(AIndex: Integer;
      AViewInfo: TcxCustomColorComboBoxViewInfo; const AEditValue: TcxEditValue);
    function DoConvertNaming(AIndex: Integer): string;
    procedure DeleteOverMRUColors;
    function ColorItemByIndex(AIndex: Integer): TcxColorComboBoxItem;
    procedure ValidateMRUColors;
    procedure InternalPrepareDelphiColorList;
    procedure InternalPrepareHTML4ColorList;
    procedure InternalPrepareX11ColorList;
    procedure InternalPrepareX11OrderedColorList;
    procedure ReadPrepareInfo(Reader: TReader);
    procedure WritePrepareInfo(Writer: TWriter);
    procedure ReadColorItems(Reader: TReader);
    procedure WriteColorItems(Writer: TWriter);
  protected
    procedure DefineProperties(Filer: TFiler); override;
    property MRUColors: TcxColorComboBoxItems read FMRUColors write FMRUColors;
    property MaxMRUColors: Byte read FMaxMRUColors write SetMaxMRUColors default 10;
    property ColorBoxWidth: Integer read FColorBoxWidth write SetColorBoxWidth default 30;
    property ColorBoxAlign: TcxColorBoxAlign read FColorBoxAlign
      write SetColorBoxAlign default cbaLeft;
    property ColorBoxFrameColor: TColor read FColorBoxFrameColor
      write SetColorBoxFrameColor default clBtnShadow;
    property ColorDialogType: TcxColorDialogType read FColorDialogType
      write FColorDialogType default cxcdtDefault;
    property DefaultColor: TColor read FDefaultColor write SetDefaultColor default clWindow;
    property DefaultDescription: string read FDefaultDescription write SetDefaultDescription;
    property DefaultColorStyle: TcxDefaultColorStyle read FDefaultColorStyle
      write SetDefaultColorStyle default cxdcColor;
    property AllowSelectColor: Boolean read FAllowSelectColor write SetAllowSelectColor default False;
    property ColorComboStyle: TcxColorComboStyle read FColorComboStyle
      write SetColorComboStyle default cxccsComboEdit;
    property NamingConvention: TcxColorNamingConvention read FNamingConvention
      write SetNamingConvention default cxncDelphi;
    property ColorValueFormat: TcxColorValueFormat read FColorValueFormat
      write SetColorValueFormat default cxcvRGB;
    property ShowDescriptions: Boolean read FShowDescriptions write SetShowDescriptions default True;
    property OnSelectCustomColor: TcxSelectCustomColorEvent read FOnSelectCustomColor
      write FOnSelectCustomColor;
    property OnNamingConvention: TcxNamingConventionEvent read FOnNamingConvention
      write FOnNamingConvention;
    property OnAddedMRUColor: TNotifyEvent read FOnAddedMRUColor write FOnAddedMRUColor;
    property OnDeletedMRUColor: TNotifyEvent read FOnDeletedMRUColor write FOnDeletedMRUColor;
    property OnGetDefaultColor: TcxGetDefaultColorEvent read FOnGetDefaultColor
      write FOnGetDefaultColor;
    class function GetPopupWindowClass: TcxCustomEditPopupWindowClass; override;
    class function GetViewDataClass: TcxCustomEditViewDataClass; override;
    function IndexByValue(const AValue: TcxEditValue): Integer;
    function GetColorByIndex(AIndex: Integer): TColor;
    function GetIndexByColor(AColor: TColor): Integer;
    function GetDescriptionByIndex(AIndex: Integer): string;
    function IsDisplayValueNumeric: Boolean; virtual;
    function IsEditValueNumeric: Boolean; override;
    function AddMRUColor(const AColor: TColor): TcxMRUColorAction; virtual;
    function DelMRUColor(const AColor: TColor): TcxMRUColorAction; virtual;
    procedure ClearMRUColors; virtual;
    procedure Changed; override;
    procedure DoGetDefaultColor(var AColor: TColor); virtual;
    procedure TranslateValues(const AEditValue: TcxEditValue;
      var AColor: TColor; var ADescription: string);
    property PrepareList: TcxColorPrepareList read FPrepareList
      write FPrepareList default cxplDelphi;
    property Items: TcxColorComboBoxItems read GetItems write SetItems stored False;
    property PrepareInfo: string read FPrepareInfo write SetPrepareInfo stored False;
  public
    constructor Create(AOwner: TPersistent); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    class function GetContainerClass: TcxContainerClass; override;
    class function GetLookupDataClass: TcxInterfacedPersistentClass; override;
    class function GetViewInfoClass: TcxContainerViewInfoClass; override;
    function GetEditValueSource(AEditFocused: Boolean): TcxDataEditValueSource; override;
    procedure PrepareDisplayValue(const AEditValue: TcxEditValue;
      var DisplayValue: TcxEditValue; AEditFocused: Boolean); override;
    function GetSupportedOperations: TcxEditSupportedOperations; override;
    function GetDisplayText(const AEditValue: TcxEditValue; AFullText:
      Boolean = False): WideString; override;
    procedure Update(AProperties: TcxCustomEditProperties); override;
    procedure PrepareDelphiColorList(const ASaveCustom, ASaveMRU: Boolean);
    procedure PrepareHTML4ColorList(const ASaveCustom, ASaveMRU: Boolean);
    procedure PrepareX11ColorList(const ASaveCustom, ASaveMRU: Boolean);
    procedure PrepareX11OrderedColorList(const ASaveCustom, ASaveMRU: Boolean);
  end;

  { TcxColorComboBoxProperties }
  TcxColorComboBoxProperties = class(TcxCustomColorComboBoxProperties)
  published
    property AllowSelectColor;
    property ColorComboStyle;
    property ColorBoxAlign;
    property ColorBoxFrameColor;
    property ColorBoxWidth;
    property ColorDialogType;
    property ColorValueFormat;
    property DefaultColor;
    property DefaultDescription;
    property DefaultColorStyle;
    property ShowDescriptions;
    property MaxMRUColors;
    property NamingConvention;
    property PrepareList;
    property Items;
    property PrepareInfo;
    property OnSelectCustomColor;
    property OnNamingConvention;
    property OnAddedMRUColor;
    property OnDeletedMRUColor;
    property OnGetDefaultColor;
    property Alignment;
    property BeepOnError;
    property ButtonGlyph;
    property CharCase;
    property DropDownAutoWidth;
    property DropDownRows;
    property DropDownSizeable;
    property DropDownWidth;
    property ImmediateDropDown;
    property ImmediatePost;
    property ImmediateUpdateText;
{$IFDEF VCL}
    property OEMConvert;
{$ENDIF}
    property PopupAlignment;
    property ReadOnly;
    property Revertable;
    property ValidateOnEnter;
    property OnChange;
    property OnCloseUp;
    property OnEditValueChanged;
    property OnInitPopup;
    property OnNewLookupDisplayText;
    property OnPopup;
    property OnValidate;
  public
    property MRUColors;
  end;

  { TcxCustomColorComboBoxInnerEdit }
  TcxCustomColorComboBoxInnerEdit = class(TcxCustomComboBoxInnerEdit);

  { TcxColorComboBoxPopupWindow }
  TcxColorComboBoxPopupWindow = class(TcxComboBoxPopupWindow)
  public
    property ViewInfo;
    property SysPanelStyle;
  end;

  { TcxCustomColorComboBox }
  TcxCustomColorComboBox = class(TcxCustomComboBox)
  private
    FColorValue: TColor;
    FSavedColor: TColor;
    FPropertiesUpdate: Boolean;
    FIsDialogShowed: Boolean;
    procedure SetColorValue(Value: TColor);
    function GetItemIndex: Integer;
    function GetLookupData: TcxColorComboBoxLookupData;
    function GetProperties: TcxColorComboBoxProperties;
    procedure SetItemIndex(Value: Integer);
    procedure SetProperties(Value: TcxColorComboBoxProperties);
    procedure PropertiesLoadColorListHandler(Sender: TObject);
    procedure FlushEditValue;
  protected
    procedure ContainerStyleChanged(Sender: TObject); override;
    procedure PropertiesChanged(Sender: TObject); override;
    procedure DblClick; override;
    procedure DoButtonClick(AButtonVisibleIndex: Integer); override;
    function GetInnerEditClass: TControlClass; override;
    function GetPopupWindowClientPreferredSize: TSize; override;
    procedure InitializePopupWindow; override;
    procedure InitializeLookupData; override;
    function IsValidChar(AChar: Char): Boolean; override;
    procedure DoEditKeyDown(var Key: Word; Shift: TShiftState); override;
    property ColorValue: TColor read FColorValue write SetColorValue default clWindow;
    property ItemIndex: Integer read GetItemIndex write SetItemIndex;
    property LookupData: TcxColorComboBoxLookupData read GetLookupData;
    property Properties: TcxColorComboBoxProperties read GetProperties write SetProperties;
    function LookupKeyToEditValue(const AKey: TcxEditValue): TcxEditValue; override;
    procedure InternalSetEditValue(const Value: TcxEditValue;
      AValidateEditValue: Boolean); override;
    procedure SynchronizeDisplayValue; override;
    procedure CloseUp(AAccept: Boolean); override;
    procedure DoSelectCustomColor(Sender: TObject); virtual;
    procedure FixMRUPosition(AColor: TColor); virtual;
    procedure ClearEditValue; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Loaded; override;
    class function GetPropertiesClass: TcxCustomEditPropertiesClass; override;
    procedure PrepareEditValue(const ADisplayValue: TcxEditValue;
      out EditValue: TcxEditValue; AEditFocused: Boolean); override;
    procedure PrepareDisplayValue(const AEditValue: TcxEditValue;
      var DisplayValue: TcxEditValue; AEditFocused: Boolean); override;
    function AddMRUColor(const AColor: TColor): TcxMRUColorAction;
    function DelMRUColor(const AColor: TColor): TcxMRUColorAction;
    procedure PrepareDelphiColorList(const ASaveCustom, ASaveMRU: Boolean);
    procedure PrepareHTML4ColorList(const ASaveCustom, ASaveMRU: Boolean);
    procedure PrepareX11ColorList(const ASaveCustom, ASaveMRU: Boolean);
    procedure PrepareX11OrderedColorList(const ASaveCustom, ASaveMRU: Boolean);
    function Focused: Boolean; override;
  end;

  { TcxColorComboBox }
  TcxColorComboBox = class(TcxCustomColorComboBox)
  public
    property ItemIndex;
  published
    property Anchors;
    property AutoSize;
    property BeepOnEnter;
    property ColorValue;
    property Constraints;
    {$IFDEF VCL}
    property DragCursor;
    property DragKind;
    {$ENDIF}
    property DragMode;
    property Enabled;
    {$IFDEF VCL}
    property ImeMode;
    property ImeName;
    {$ENDIF}
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property Properties;
    property ShowHint;
    property Style;
    property TabOrder;
    property TabStop;
    property Visible;
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

implementation

uses
{$IFDEF VCL}
  dxThemeConsts, dxThemeManager, dxUxTheme,
{$ENDIF}
  cxExtEditUtils;

type
  TControlAccess = class(TControl);
  TcxTextEditAccess = class(TcxTextEdit);
  TcxCustomEditListBoxAccess = class(TcxCustomEditListBox);
  TWinControlAccess = class(TWinControl);
  TWriterAccess = class(TWriter);

function ConvertColorName(AColor: TColor; ADescription: string;
  const ANamingConvention: TcxColorNamingConvention;
  const AColorValueFormat: TcxColorValueFormat): string;
var
  FColorName: string;
  FFound: Boolean;

  function FindColorInDelphiColorValues(const AColor: TColor;
    var AName: string): Boolean;
  var
    I: Integer;
  begin
    Result := False;
    for I := Low(cxDelphiColorValues) to High(cxDelphiColorValues) do
    begin
      if TColor(cxDelphiColorValues[I]) = AColor then
      begin
        AName := cxDelphiColorNames[I];
        Result := True;
        Break;
      end;
    end;
  end;

  function FindColorInHTML4ColorValues(const AColor: TColor;
    var AName: string): Boolean;
  var
    I: Integer;
  begin
    Result := False;
    for I := Low(cxHTML4ColorValues) to High(cxHTML4ColorValues) do
    begin
      if TColor(cxHTML4ColorValues[I]) = AColor then
      begin
        AName := cxHTML4ColorNames[I];
        Result := True;
        Break;
      end;
    end;
  end;

  function FindColorInX11ColorValues(const AColor: TColor;
    var AName: string): Boolean;
  var
    I: Integer;
  begin
    Result := False;
    for I := Low(cxX11ColorValues) to High(cxX11ColorValues) do
    begin
      if TColor(cxX11ColorValues[I]) = AColor then
      begin
        AName := cxX11ColorNames[I];
        Result := True;
        Break;
      end;
    end;
  end;

  function ConvertUnknowColor(const AColor: TColor;
    const AColorValueFormat: TcxColorValueFormat): string;
  var
    R, G, B: Byte;
  begin
    case AColorValueFormat of
      cxcvRGB, cxcvHexadecimal:
      begin
        R := GetRValue(ColorToRGB(AColor));
        G := GetGValue(ColorToRGB(AColor));
        B := GetBValue(ColorToRGB(AColor));
        case AColorValueFormat of
          cxcvRGB: Result := IntToStr(R) + '.' + IntToStr(G) + '.' + IntToStr(B);
          cxcvHexadecimal: Result := IntToHex(R, 2) + IntToHex(G, 2) + IntToHex(B, 2);
        end;
      end;
      else
        Result := IntToStr(AColor);
    end;
  end;

begin
  FColorName := '';
  FFound := True;
  case ANamingConvention of
    cxncNone: Result := ADescription;
    cxncDelphi:
    begin
      FFound := FindColorInDelphiColorValues(AColor, FColorName);
      if FFound then
        Result := FColorName;
    end;
    cxncHTML4:
    begin
      FFound := FindColorInHTML4ColorValues(AColor, FColorName);
      if FFound then
        Result := FColorName
    end;
    cxncX11:
    begin
      FFound := FindColorInX11ColorValues(AColor, FColorName);
      if FFound then
        Result := FColorName
    end;
  end;
  if not FFound then
    Result := ConvertUnknowColor(AColor, AColorValueFormat);
end;

{ TcxColorComboBoxItem }
constructor TcxColorComboBoxItem.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  FIsCustomColor := True;
  FDescription := '';
end;

procedure TcxColorComboBoxItem.Assign(Source: TPersistent);
begin
  if Source is TcxColorComboBoxItem then
    with TcxColorComboBoxItem(Source) do
    begin
      Self.Color := Color;
      Self.Description := Description;
      Self.FIsCustomColor := IsCustomColor;
    end
  else
    inherited Assign(Source);
end;

procedure TcxColorComboBoxItem.SetDescription(const Value: TCaption);
begin
  if FDescription <> Value then
  begin
    FDescription := Value;
    TcxColorComboBoxItems(Collection).Changed;
  end;
end;

function TcxColorComboBoxItem.IsDescriptionStored: Boolean;
begin
  Result := FDescription <> '';
end;

procedure TcxColorComboBoxItem.SetColor(const Value: TColor);
begin
  if FColor <> Value then
  begin
    FColor := Value;
    TcxColorComboBoxItems(Collection).Changed;
  end;
end;
{ TcxColorComboBoxItem }

{ TcxColorComboBoxItems }
function TcxColorComboBoxItems.GetItems(Index: Integer): TcxColorComboBoxItem;
begin
  Result := TcxColorComboBoxItem(inherited Items[Index]);
end;

procedure TcxColorComboBoxItems.SetItems(Index: Integer;const Value: TcxColorComboBoxItem);
begin
  inherited Items[Index] := Value;
end;

procedure TcxColorComboBoxItems.Update(Item: TCollectionItem);
begin
  if (Owner <> nil) and (Owner is TcxColorComboBoxProperties) then
    with TcxColorComboBoxProperties(Owner) do
      Changed;
end;

{$IFNDEF DELPHI6}
function TcxColorComboBoxItems.Owner: TPersistent;
begin
  Result := GetOwner;
end;
{$ENDIF}

function TcxColorComboBoxItems.FindColorItem(const AColor: TColor): TcxColorComboBoxItem;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to Count - 1 do
  begin
    if Items[I].Color = AColor then
    begin
      Result := Items[I];
      Break;
    end;
  end;
end;

function TcxColorComboBoxItems.GetIndexByColor(AColor: TColor): Integer;
var
  I : Integer;
begin
  Result := -1;
  for I := 0 to Count-1 do
  begin
    if Items[I].Color = AColor then
    begin
      Result := I;
      Break;
    end;
  end;
end;

function TcxColorComboBoxItems.GetColorByIndex(AIndex: Integer;
  ADefaultColor: TColor): TColor;
begin
  Result := ADefaultColor;
  if (AIndex >= 0) and (AIndex <= (Count - 1)) then
    Result := Items[AIndex].Color;
end;

function TcxColorComboBoxItems.Add: TcxColorComboBoxItem;
begin
  Result := TcxColorComboBoxItem(inherited Add);
end;

function TcxColorComboBoxItems.Insert(Index: Integer): TcxColorComboBoxItem;
begin
  Result := TcxColorComboBoxItem(inherited Insert(Index));
end;

function TcxColorComboBoxItems.AddColor(const AColor: TColor;
  const ADescription: string): TcxColorComboBoxItem;
begin
  Result := nil;
  if (FindColorItem(AColor) <> nil) then Exit;
  Result := Add;
  Result.Color := AColor;
  Result.Description := ADescription;
end;

function TcxColorComboBoxItems.InsertColor(Index: Integer; const AColor: TColor;
  const ADescription: string): TcxColorComboBoxItem;
begin
  Result := nil;
  if (FindColorItem(AColor) <> nil) then Exit;
  Result := Insert(Index);
  Result.Color := AColor;
  Result.Description := ADescription;
end;

procedure TcxColorComboBoxItems.Move(CurIndex, NewIndex: Integer);
var
  FNewColorItem, FOldColorItem: TcxColorComboBoxItem;
begin
  if CurIndex = NewIndex then Exit;
  FOldColorItem := Items[CurIndex];
  FNewColorItem := Insert(NewIndex);
  FNewColorItem.Assign(FOldColorItem);
  FOldColorItem.Free;
end;

procedure TcxColorComboBoxItems.ClearNonCustom;
var
  I: Integer;
begin
  for I := (Count - 1) downto 0 do
  begin
    if not Items[I].IsCustomColor then
{$IFDEF DELPHI5}
      Delete(I);
{$ELSE}
      TcxColorComboBoxItem(Items[I]).Free;
{$ENDIF}
  end;
end;
{ TcxColorComboBoxItems }

{ TcxCustomColorComboBoxViewInfo }
procedure TcxCustomColorComboBoxViewInfo.Paint(ACanvas: TcxCanvas);
var
  FRealDefaultColorStyle: TcxDefaultColorStyle;
begin
  inherited Paint(ACanvas);
  if (FoundItem = False) and (DefaultColorStyle = cxdcText) then Exit;
  FRealDefaultColorStyle := DefaultColorStyle;
  if (DefaultColorStyle <> cxdcText) and FoundItem then
    FRealDefaultColorStyle := cxdcColor;
  DrawColorBox(ACanvas, ColorBoxRect, ColorBoxFrameColor, ColorBoxColor,
    BkColor, FRealDefaultColorStyle);
end;

procedure TcxCustomColorComboBoxViewInfo.Offset(DX, DY: Integer);
begin
  inherited Offset(DX, DY);
  OffsetRect(FColorBoxRect, DX, DY);
end;
{ TcxCustomColorComboBoxViewInfo }

{ TcxCustomColorComboBoxViewData }
function TcxCustomColorComboBoxViewData.IsComboBoxStyle: Boolean;
begin
  Result := True;
end;

procedure TcxCustomColorComboBoxViewData.Calculate(ACanvas: TcxCanvas;
  const ABounds: TRect; const P: TPoint; Button: TcxMouseButton;
  Shift: TShiftState; AViewInfo: TcxCustomEditViewInfo; AIsMouseEvent: Boolean);
var
  R: TRect;
  FViewInfo: TcxCustomColorComboBoxViewInfo;
begin
  if IsRectEmpty(ABounds) then begin
    inherited;
    Exit;
  end;
  inherited Calculate(ACanvas, ABounds, P, Button, Shift, AViewInfo, AIsMouseEvent);
  if (ABounds.Right = MaxInt) or (ABounds.Bottom = MaxInt) then Exit;

  FViewInfo := TcxCustomColorComboBoxViewInfo(AViewInfo);
  CalculateViewInfoProperties(FViewInfo);
  R := FViewInfo.ClientRect;
  FViewInfo.FColorBoxRect := R;
  if (FViewInfo.DefaultColorStyle = cxdcText) and not FViewInfo.FoundItem then
    FViewInfo.FColorBoxRect.Right := FViewInfo.FColorBoxRect.Left
  else
  begin
    if FViewInfo.ShowDescriptions then
    begin
      if FViewInfo.ColorBoxAlign = cbaLeft then
      begin
        FViewInfo.FColorBoxRect.Right := FViewInfo.FColorBoxRect.Left + FViewInfo.ColorBoxWidth ;
        R.Left := FViewInfo.FColorBoxRect.Right;
      end
      else
      begin
        FViewInfo.FColorBoxRect.Left := FViewInfo.FColorBoxRect.Right - FViewInfo.ColorBoxWidth ;
        R.Right := FViewInfo.FColorBoxRect.Left;
      end;
    end;
  end;
  FViewInfo.ClientRect := R;
  if not IsInplace then
    InflateRect(R, -2, -2)
  else
    InflateRect(R, -2, -1);
  FViewInfo.TextRect := R;
  if not FViewInfo.ShowDescriptions then FViewInfo.Text := '';
  if not IsInplace then FViewInfo.DrawSelectionBar := False;
end;

procedure TcxCustomColorComboBoxViewData.CalculateViewInfoProperties(AViewInfo: TcxCustomEditViewInfo);
var
  AProperties: TcxColorComboBoxProperties;
begin
  AProperties := TcxColorComboBoxProperties(Properties);
  with TcxCustomColorComboBoxViewInfo(AViewInfo) do
  begin
    BkColor := BackgroundColor;
    ColorBoxAlign := AProperties.ColorBoxAlign;
    ColorBoxWidth := AProperties.ColorBoxWidth;
    ColorBoxFrameColor := AProperties.ColorBoxFrameColor;
    ShowDescriptions := AProperties.ShowDescriptions;
    DefaultColorStyle := AProperties.DefaultColorStyle;
    if (DefaultColorStyle = cxdcCustom) and (not FoundItem) then
      AProperties.DoGetDefaultColor(FColorBoxColor);
  end;
end;

function TcxCustomColorComboBoxViewData.GetEditContentSize(ACanvas: TcxCanvas;
  const AEditValue: TcxEditValue; const AEditSizeProperties: TcxEditSizeProperties): TSize;
var
  S: string;
  FValue: TColor;
  AProperties: TcxColorComboBoxProperties;
begin
  AProperties := TcxColorComboBoxProperties(Properties);
  if AProperties.ShowDescriptions then
    AProperties.TranslateValues(AEditValue, FValue, S)
  else
    S := '';
  Result := GetTextEditContentSize(ACanvas, Self, S, GetDrawTextFlags,
    @AEditSizeProperties);
  if AProperties.ShowDescriptions then
    Inc(Result.cx, AProperties.ColorBoxWidth + 6);
end;

procedure TcxCustomColorComboBoxViewData.DisplayValueToDrawValue(const ADisplayValue: TcxEditValue;
  AViewInfo: TcxCustomEditViewInfo);
begin
  if (Edit = nil) or IsVarEmpty(ADisplayValue) then Exit;
  with TcxColorComboBoxProperties(Properties), TcxTextEditAccess(Edit).ILookupData do
    SetupViewInfoByItem(CurrentKey, TcxCustomColorComboBoxViewInfo(AViewInfo),
      TcxColorComboBox(Edit).EditValue);
end;

procedure TcxCustomColorComboBoxViewData.EditValueToDrawValue(ACanvas: TcxCanvas;
  const AEditValue: TcxEditValue; AViewInfo: TcxCustomEditViewInfo);
begin
  inherited;
  with TcxColorComboBoxProperties(Properties) do
    SetupViewInfoByItem(IndexByValue(AEditValue), TcxCustomColorComboBoxViewInfo(AViewInfo),
      AEditValue);
end;
{ TcxCustomColorComboBoxViewData }

{ TcxCustomColorComboBoxListBox }
constructor TcxCustomColorComboBoxListBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FProperties := TcxCustomColorComboBox(Edit).Properties;
  BorderStyle := bsNone;
  Style := lbOwnerDrawVariable;
end;

function TcxCustomColorComboBoxListBox.DoDrawItem(AIndex: Integer; const ARect: TRect;
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

function TcxCustomColorComboBoxListBox.GetHeight(ARowCount: Integer; AMaxHeight: Integer): Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to ARowCount - 1 do
    Inc(Result, GetItemHeight(I));
end;

function TcxCustomColorComboBoxListBox.GetItem(Index: Integer): TCaption;
begin
  Result := Edit.LookupData.GetItem(Index);
end;

function TcxCustomColorComboBoxListBox.GetItemHeight(AIndex: Integer = -1): Integer;
begin
  Result := inherited GetItemHeight;
  if Result < 16 then Result := 16;
  if (AIndex >= 0) and Assigned(OnMeasureItem) then
    Edit.Properties.OnMeasureItem((TcxCustomColorComboBox(Edit) as TcxCustomComboBox),
      AIndex, Canvas, Result);
  if AIndex = (Edit.Properties.FMRUColors.Count - 1) then Inc(Result, 3);
end;

procedure TcxCustomColorComboBoxListBox.Click;
begin
  inherited;
end;

procedure TcxCustomColorComboBoxListBox.Resize;
begin
  inherited Resize;
end;

procedure TcxCustomColorComboBoxListBox.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  if Edit.PopupMouseMoveLocked then
  begin
    Edit.PopupMouseMoveLocked := False;
    Exit;
  end;
  inherited MouseMove(Shift, X, Y);
end;

procedure TcxCustomColorComboBoxListBox.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseDown(Button, Shift, X, Y);
  if Button <> mbLeft then Exit;
  SetCaptureControl(nil);
  Edit.CloseUp(True);
end;

{$IFDEF VCL}
procedure TcxCustomColorComboBoxListBox.DrawItem(Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  PrevBrushColor: TColor;
  ASelColor: TColor;
  S: string;
  FColorBoxRect, FTextRect : TRect;
  FFlags: Longint;
  FText: string;
begin
  if DoDrawItem(Index, Rect, State) then Exit;
  with Canvas, Rect do begin
    PrevBrushColor := Brush.Color;
    ASelColor := Edit.Properties.GetColorByIndex(Index);
    S := Edit.Properties.GetDescriptionByIndex(Index);
    FColorBoxRect := Rect;
    if Index = (Edit.Properties.MRUColors.Count - 1) then Dec(FColorBoxRect.Bottom, 3);
    FTextRect := FColorBoxRect;
    if Edit.Properties.ShowDescriptions = True then
    begin
      FFlags := DrawTextBiDiModeFlags(DT_SINGLELINE or DT_LEFT or DT_NOPREFIX);
      if Edit.Properties.ColorBoxAlign = cbaRight then
      begin
        Dec(FTextRect.Right, Edit.Properties.ColorBoxWidth);
        FColorBoxRect.Left := FTextRect.Right;
      end
      else
      begin
        Inc(FTextRect.Left, Edit.Properties.ColorBoxWidth);
        FColorBoxRect.Right := FTextRect.Left;
      end;
      Canvas.FillRect(Rect);
      FText := ' ' + GetItem(Index);
      DrawText(PChar(FText), FTextRect, FFlags);
    end
    else
      FTextRect.Left := FColorBoxRect.Right;
    DrawColorBox(Self.Canvas, FColorBoxRect, Edit.Properties.ColorBoxFrameColor,
      ASelColor, Brush.Color, cxdcColor);
    if (Edit <> nil) and (Index = (Edit.Properties.FMRUColors.Count - 1)) then
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
procedure TcxCustomColorComboBoxListBox.MeasureItem(Index: Integer; var Height: Integer);
{$ELSE}
procedure TcxCustomColorComboBoxListBox.MeasureItem(Control: TWinControl;
  {$IFDEF LINUX}item: QClxListBoxItemH{$ELSE}Index: Integer{$ENDIF};
  var Height, Width: Integer);
{$ENDIF}
begin
  Height := GetItemHeight(Index);
end;

function TcxCustomColorComboBoxListBox.GetEdit: TcxCustomColorComboBox;
begin
  Result := TcxCustomColorComboBox(TcxCustomEditPopupWindow(Owner).OwnerControl);
end;
{ TcxCustomColorComboBoxListBox }

{ TcxColorComboBoxLookupData }
function TcxColorComboBoxLookupData.GetListBoxClass: TcxCustomEditListBoxClass;
begin
  Result := TcxCustomColorComboBoxListBox;
end;

function TcxColorComboBoxLookupData.GetItem(Index: Integer): TCaption;
begin
  with TcxCustomColorComboBox(Edit).Properties do
    Result := GetDescriptionByIndex(Index);
end;

function TcxColorComboBoxLookupData.GetItemCount: Integer;
begin
  with TcxCustomColorComboBox(Edit).Properties do
    Result := MRUColors.Count + Items.Count;
end;

procedure TcxColorComboBoxLookupData.TextChanged;
begin
  with TcxColorComboBoxProperties(Properties) do
    InternalSetCurrentKey(IndexByValue(Edit.EditValue));
end;

function TcxColorComboBoxLookupData.InternalChangeCurrentMRUColorPosition(
  const AColor: TColor): Integer;
var
  FIndex: Integer;
begin
  Result := ItemIndex;
  with TcxCustomColorComboBoxProperties(Properties) do
    if ItemIndex >= (FMRUColors.Count - 1) then
    begin
      FIndex := FMRUColors.GetIndexByColor(AColor);
      if FIndex >= 0 then
      begin
        Result := FIndex;
        InternalSetCurrentKey(FIndex);
      end;
    end;
end;
{ TcxColorComboBoxLookupData }

{ TcxCustomColorComboBoxProperties }
constructor TcxCustomColorComboBoxProperties.Create(AOwner: TPersistent);
begin
  inherited Create(AOwner);
  DropDownListStyle := lsFixedList;
  FInternalUpdate := False;
  FColorBoxAlign := cbaLeft;
  FColorBoxWidth := 30;
  FColorBoxFrameColor := clBtnShadow;
  FColorDialogType := cxcdtDefault;
  FShowDescriptions := True;
  FDefaultColor := clWindow;
  FDefaultDescription := 'Color not selected';
  FDefaultColorStyle := cxdcColor;
  FAllowSelectColor := False;
  FColorComboStyle := cxccsComboEdit;
  FNamingConvention := cxncDelphi;
  FColorValueFormat := cxcvRGB;
  FMaxMRUColors := 10;
  FPrepareInfo := '';
  FPrepareList := cxplDelphi;
  Buttons.Add;
  GlyphButtonIndex := 1;
  Buttons[1].Kind := bkEllipsis;
  Buttons[1].Default := False;
  Buttons[1].Visible := False;
  FItems := TcxColorComboBoxItems.Create(Self, TcxColorComboBoxItem);
  FMRUColors := TcxColorComboBoxItems.Create(Self, TcxColorComboBoxItem);
end;

destructor TcxCustomColorComboBoxProperties.Destroy;
begin
  if Assigned(FMRUColors) then FreeAndNil(FMRUColors);
  if Assigned(FItems) then FreeAndNil(FItems);
  inherited;
end;

procedure TcxCustomColorComboBoxProperties.Assign(Source: TPersistent);
begin
  if Source is TcxCustomColorComboBoxProperties then
  begin
    BeginUpdate;
    try
      inherited Assign(Source);
      with Source as TcxCustomColorComboBoxProperties do
      begin
        Self.ColorBoxWidth := ColorBoxWidth;
        Self.ColorBoxAlign := ColorBoxAlign;
        Self.ColorBoxFrameColor := ColorBoxFrameColor;
        Self.ColorDialogType := ColorDialogType;
        Self.DefaultColor := DefaultColor;
        Self.DefaultDescription := DefaultDescription;
        Self.DefaultColorStyle := DefaultColorStyle;
        Self.ShowDescriptions := ShowDescriptions;
        Self.AllowSelectColor := AllowSelectColor;
        Self.ColorComboStyle := ColorComboStyle;
        Self.MaxMRUColors := MaxMRUColors;
        Self.NamingConvention := NamingConvention;
        Self.PrepareList := PrepareList;
        Self.ColorValueFormat := ColorValueFormat;
        Self.OnSelectCustomColor := OnSelectCustomColor;
        Self.OnNamingConvention := OnNamingConvention;
        Self.OnGetDefaultColor := OnGetDefaultColor;
        Self.OnAddedMRUColor := OnAddedMRUColor;
        Self.OnDeletedMRUColor := OnDeletedMRUColor;
        Self.Items.Assign(Items);
        Self.MRUColors.Assign(MRUColors);
      end;
    finally
      EndUpdate;
    end
  end
  else
    inherited Assign(Source);
end;

class function TcxCustomColorComboBoxProperties.GetContainerClass: TcxContainerClass;
begin
  Result := TcxColorComboBox;
end;

class function TcxCustomColorComboBoxProperties.GetLookupDataClass: TcxInterfacedPersistentClass;
begin
  Result := TcxColorComboBoxLookupData;
end;

class function TcxCustomColorComboBoxProperties.GetPopupWindowClass: TcxCustomEditPopupWindowClass;
begin
  Result := TcxColorComboBoxPopupWindow;
end;

class function TcxCustomColorComboBoxProperties.GetViewDataClass: TcxCustomEditViewDataClass;
begin
  Result := TcxCustomColorComboBoxViewData;
end;

class function TcxCustomColorComboBoxProperties.GetViewInfoClass: TcxContainerViewInfoClass;
begin
  Result := TcxCustomColorComboBoxViewInfo;
end;

procedure TcxCustomColorComboBoxProperties.SetColorBoxFrameColor(Value: TColor);
begin
  if FColorBoxFrameColor <> Value then
  begin
    FColorBoxFrameColor := Value;
    Changed;
  end;
end;

procedure TcxCustomColorComboBoxProperties.SetDefaultColor(Value: TColor);
begin
  if FDefaultColor <> Value then
  begin
    FDefaultColor := Value;
    Changed;
  end;
end;

procedure TcxCustomColorComboBoxProperties.SetShowDescriptions(const Value: Boolean);
begin
  if FShowDescriptions <> Value then
  begin
    FShowDescriptions := Value;
    Changed;
  end;
end;

procedure TcxCustomColorComboBoxProperties.SetAllowSelectColor(Value: Boolean);
begin
  if FAllowSelectColor <> Value then
  try
    FAllowSelectColor := Value;
    BeginUpdate;
    Buttons[1].Visible := Value;
    if Value then
      GlyphButtonIndex := 1
    else
      GlyphButtonIndex := 0;
  finally
    EndUpdate;
  end;
end;

procedure TcxCustomColorComboBoxProperties.SetColorComboStyle(Value: TcxColorComboStyle);
begin
  if FColorComboStyle <> Value then
  begin
    FColorComboStyle := Value;
    Changed;
  end;
end;

procedure TcxCustomColorComboBoxProperties.SetNamingConvention(Value: TcxColorNamingConvention);
begin
  if FNamingConvention <> Value then
  begin
    FNamingConvention := Value;
    Changed;
  end;
end;

procedure TcxCustomColorComboBoxProperties.SetColorValueFormat(Value: TcxColorValueFormat);
begin
  if FColorValueFormat <> Value then
  begin
    FColorValueFormat := Value;
    Changed;
  end;
end;

function TcxCustomColorComboBoxProperties.GetItems: TcxColorComboBoxItems;
begin
  Result := FItems;
end;

procedure TcxCustomColorComboBoxProperties.SetColorBoxWidth(Value: Integer);
begin
  if FColorBoxWidth <> Value then
  begin
    if Value < 0 then Value := 0;
    FColorBoxWidth := Value;
    Changed;
  end;
end;

procedure TcxCustomColorComboBoxProperties.SetColorBoxAlign(Value : TcxColorBoxAlign);
begin
  if FColorBoxAlign <> Value then
  begin
    FColorBoxAlign := Value;
    Changed;
  end;
end;

procedure TcxCustomColorComboBoxProperties.SetDefaultDescription(Value: string);
begin
  if FDefaultDescription <> Value then
  begin
    FDefaultDescription := Value;
    Changed;
  end;
end;

procedure TcxCustomColorComboBoxProperties.SetDefaultColorStyle(Value: TcxDefaultColorStyle);
begin
  if FDefaultColorStyle <> Value then
  begin
    FDefaultColorStyle := Value;
    Changed;
  end;
end;

procedure TcxCustomColorComboBoxProperties.SetItems(const Value: TcxColorComboBoxItems);
begin
  FItems.Assign(Value);
  Changed;
end;

procedure TcxCustomColorComboBoxProperties.SetMaxMRUColors(Value: Byte);
var
  FOldMaxMRUColors: Byte;
begin
  if FMaxMRUColors <> Value then
  begin
    FOldMaxMRUColors := FMaxMRUColors;
    FMaxMRUColors := Value;
    if FOldMaxMRUColors > Value then
    begin
      DeleteOverMRUColors;
      Changed;
    end;
  end;
end;

function TcxCustomColorComboBoxProperties.GetEditValueSource(AEditFocused: Boolean):
  TcxDataEditValueSource;
begin
  Result := evsValue;
end;

procedure TcxCustomColorComboBoxProperties.SetupViewInfoByItem(AIndex: Integer;
  AViewInfo: TcxCustomColorComboBoxViewInfo; const AEditValue: TcxEditValue);
var
  FValue: TColor;
  FValueText: string;
begin
  AViewInfo.FoundItem := (AIndex <> -1);
  AViewInfo.Text := GetDescriptionByIndex(AIndex);
  if (AIndex = -1) and (ColorComboStyle = cxccsComboList) and not IsVarEmpty(AEditValue) then
    AViewInfo.ColorBoxColor := DefaultColor
  else
  begin
    if (AIndex <> -1) then
      AViewInfo.ColorBoxColor := GetColorByIndex(AIndex)
    else
    begin
      TranslateValues(AEditValue, FValue, FValueText);
      AViewInfo.ColorBoxColor := FValue;
      AViewInfo.Text := FValueText;
    end;
  end;
end;

procedure TcxCustomColorComboBoxProperties.PrepareDisplayValue(
  const AEditValue: TcxEditValue; var DisplayValue: TcxEditValue; AEditFocused: Boolean);
var
  FValue: TColor;
  FValueText: string;
begin
  TranslateValues(AEditValue, FValue, FValueText);
  DisplayValue := FValueText;
end;

procedure TcxCustomColorComboBoxProperties.TranslateValues(const AEditValue: TcxEditValue;
  var AColor: TColor; var ADescription: string);
var
  FFoundIndex: Integer;
  FValid: Boolean;
begin
  FFoundIndex := IndexByValue(AEditValue);
  if ((FFoundIndex <> -1) or ((FFoundIndex = -1) and (ColorComboStyle = cxccsComboList))) and
    (not IsVarEmpty(AEditValue)) then
    ADescription := GetDescriptionByIndex(FFoundIndex)
  else
  begin
    AColor := cxStringToColor(VarToStr(AEditValue), FValid);
    if FValid then
    begin
      ADescription := ConvertColorName(AColor, '',
        NamingConvention, ColorValueFormat);
      if Assigned(OnNamingConvention) then
        OnNamingConvention(Self, AColor, ADescription);
    end
    else
    begin
      AColor := DefaultColor;
      ADescription := DefaultDescription;
    end;
  end;
end;

function TcxCustomColorComboBoxProperties.IndexByValue(const AValue: TcxEditValue): Integer;
var
  I: Integer;
  FValue: Integer;
  FValid: Boolean;
begin
  Result := -1;
  if IsVarEmpty(AValue) then Exit;
  FValue := cxStringToColor(VarToStr(AValue), FValid);
  if FValid = False then
    Exit;
  for I := 0 to MRUColors.Count - 1 do
    with MRUColors[I] do
      if FValue = Color then begin
        Result := I;
        Break;
      end;
  if Result = -1 then
  begin
    for I := 0 to Items.Count - 1 do
      with Items[I] do
        if FValue = Color then begin
          Result := I + MRUColors.Count;
          Break;
        end;
  end;
end;

function TcxCustomColorComboBoxProperties.GetColorByIndex(AIndex: Integer): TColor;
begin
  if AIndex = -1 then
    Result := DefaultColor
  else
  begin
    if AIndex <= (MRUColors.Count - 1) then
      Result := MRUColors.GetColorByIndex(AIndex, DefaultColor)
    else
      Result := Items.GetColorByIndex(AIndex - MRUColors.Count, DefaultColor);
  end;
end;

function TcxCustomColorComboBoxProperties.GetIndexByColor(AColor: TColor): Integer;
begin
  Result := MRUColors.GetIndexByColor(AColor);
  if Result = -1 then
    Result := Items.GetIndexByColor(AColor)
  else
    Result := Result + MRUColors.Count;
end;

function TcxCustomColorComboBoxProperties.GetDescriptionByIndex(AIndex: Integer): string;
begin
  if not ShowDescriptions then
    Result := ''
  else
  begin
    if AIndex = -1 then
      Result := DefaultDescription
    else
      Result := DoConvertNaming(AIndex);
  end;
end;

function TcxCustomColorComboBoxProperties.ColorItemByIndex(AIndex: Integer): TcxColorComboBoxItem;
begin
  if AIndex = -1 then
    Result := nil
  else
  begin
    if AIndex <= (MRUColors.Count - 1) then
      Result := MRUColors.Items[AIndex]
    else
      Result := Items[AIndex - MRUColors.Count];
  end;
end;

function TcxCustomColorComboBoxProperties.DoConvertNaming(AIndex: Integer): string;
var
  FItem: TcxColorComboBoxItem;
begin
  FItem := ColorItemByIndex(AIndex);
  if FItem = nil then
    Result := ''
  else
    Result := ConvertColorName(FItem.Color, FItem.Description,
      NamingConvention, ColorValueFormat);
  if Assigned(OnNamingConvention) then
  begin
    if FItem = nil then
      OnNamingConvention(Self, DefaultColor, Result)
    else
      OnNamingConvention(Self, FItem.Color, Result);
  end;
end;

procedure TcxCustomColorComboBoxProperties.DeleteOverMRUColors;
var
  I: Integer;
begin
  BeginUpdate;
  try
    for I := FMRUColors.Count - 1 downto 0 do
    begin
      if I >= FMaxMRUColors then
      begin
{$IFDEF DELPHI5}
        FMRUColors.Delete(I);
{$ELSE}
        TcxColorComboBoxItem(FMRUColors.Items[I]).Free;
{$ENDIF}
        if Assigned(FOnDeletedMRUColor) then FOnDeletedMRUColor(Self);
      end
      else
        Break;
    end;
  finally
    EndUpdate;
  end;
end;

function TcxCustomColorComboBoxProperties.IsDisplayValueNumeric: Boolean;
begin
  Result := False;
end;

function TcxCustomColorComboBoxProperties.IsEditValueNumeric: Boolean;
begin
  Result := True;
end;

function TcxCustomColorComboBoxProperties.GetSupportedOperations: TcxEditSupportedOperations;
begin
  Result := [esoFiltering, esoHorzAlignment, esoSorting, esoSortingByDisplayText];
  if Buttons.Count > 0 then
    Include(Result, esoHotTrack);
  if ShowDescriptions then
    Include(Result, esoIncSearch);
end;

function TcxCustomColorComboBoxProperties.GetDisplayText(const AEditValue: TcxEditValue;
  AFullText: Boolean = False): WideString;
var
  ADisplayValue: TcxEditValue;
begin
  if ShowDescriptions then
  begin
    PrepareDisplayValue(AEditValue, ADisplayValue, False);
    Result := ADisplayValue;
  end
  else
    Result := '';
end;

procedure TcxCustomColorComboBoxProperties.Update(AProperties: TcxCustomEditProperties);
var
  FProperties: TcxCustomColorComboBoxProperties;
begin
  if AProperties is TcxCustomColorComboBoxProperties then
  begin
    FProperties := (AProperties as TcxCustomColorComboBoxProperties);
    FProperties.Items.Assign(Items);
    FProperties.MRUColors.Assign(MRUColors);
  end;
end;

procedure TcxCustomColorComboBoxProperties.ValidateMRUColors;
var
  I: Integer;
begin
  for I := (MRUColors.Count - 1) downto 0 do
  begin
    if Items.GetIndexByColor(MRUColors[I].Color) = -1 then
{$IFDEF DELPHI5}
      MRUColors.Delete(I);
{$ELSE}
      TcxColorComboBoxItem(MRUColors.Items[I]).Free;
{$ENDIF}
  end;
end;

procedure TcxCustomColorComboBoxProperties.InternalPrepareDelphiColorList;
var
  I: Integer;
  FItem: TcxColorComboBoxItem;
begin
  for I := Low(cxDelphiColorValues) to High(cxDelphiColorValues) do
  begin
    FItem := Items.AddColor(cxDelphiColorValues[I], cxDelphiColorNames[I]);
    if FItem <> nil then
      FItem.FIsCustomColor := False;
  end;
end;

procedure TcxCustomColorComboBoxProperties.InternalPrepareHTML4ColorList;
var
  I: Integer;
  FItem: TcxColorComboBoxItem;
begin
  for I := Low(cxHTML4ColorValues) to High(cxHTML4ColorValues) do
  begin
    FItem := Items.AddColor(TColor(cxHTML4ColorValues[I]), cxHTML4ColorNames[I]);
    if FItem <> nil then
      FItem.FIsCustomColor := False;
  end;
end;

procedure TcxCustomColorComboBoxProperties.InternalPrepareX11ColorList;
var
  I: Integer;
  FItem: TcxColorComboBoxItem;
begin
  for I := Low(cxX11ColorValues) to High(cxX11ColorValues) do
  begin
    FItem := Items.AddColor(cxX11ColorValues[I], cxX11ColorNames[I]);
    if FItem <> nil then
      FItem.FIsCustomColor := False;
  end;
end;

procedure TcxCustomColorComboBoxProperties.InternalPrepareX11OrderedColorList;
var
  I: Integer;
  FItem: TcxColorComboBoxItem;
begin
  for I := Low(cxX11OrderedColorValues) to High(cxX11OrderedColorValues) do
  begin
    FItem := Items.AddColor(cxX11OrderedColorValues[I], cxX11OrderedColorNames[I]);
    if FItem <> nil then
      FItem.FIsCustomColor := False;
  end;
end;

procedure TcxCustomColorComboBoxProperties.PrepareDelphiColorList(
  const ASaveCustom, ASaveMRU: Boolean);
begin
  LockUpdate(True);
  try
    if not ASaveCustom then
      Items.Clear
    else
      Items.ClearNonCustom;
    if not ASaveMRU then
      ClearMRUColors;
    InternalPrepareDelphiColorList;
    if ASaveMRU then
      ValidateMRUColors;
    if Assigned(FOnLoadColorList) then
      FOnLoadColorList(Self);
  finally
    LockUpdate(False);
  end;
end;

procedure TcxCustomColorComboBoxProperties.PrepareHTML4ColorList(
  const ASaveCustom, ASaveMRU: Boolean);
begin
  LockUpdate(True);
  try
    if not ASaveCustom then
      Items.Clear
    else
      Items.ClearNonCustom;
    if not ASaveMRU then
      ClearMRUColors;
    InternalPrepareHTML4ColorList;
    if ASaveMRU then
      ValidateMRUColors;
    if Assigned(FOnLoadColorList) then
      FOnLoadColorList(Self);
  finally
    LockUpdate(False);
  end;
end;

procedure TcxCustomColorComboBoxProperties.PrepareX11ColorList(
  const ASaveCustom, ASaveMRU: Boolean);
begin
  LockUpdate(True);
  try
    if not ASaveCustom then
      Items.Clear
    else
      Items.ClearNonCustom;
    if not ASaveMRU then
      ClearMRUColors;
    InternalPrepareX11ColorList;
    if ASaveMRU then
      ValidateMRUColors;
    if Assigned(FOnLoadColorList) then
      FOnLoadColorList(Self);
  finally
    LockUpdate(False);
  end;
end;

procedure TcxCustomColorComboBoxProperties.PrepareX11OrderedColorList(
  const ASaveCustom, ASaveMRU: Boolean);
begin
  LockUpdate(True);
  try
    if not ASaveCustom then
      Items.Clear
    else
      Items.ClearNonCustom;
    if not ASaveMRU then
      ClearMRUColors;
    InternalPrepareX11OrderedColorList;
    if ASaveMRU then
      ValidateMRUColors;
    if Assigned(FOnLoadColorList) then
      FOnLoadColorList(Self);
  finally
    LockUpdate(False);
  end;
end;

function TcxCustomColorComboBoxProperties.AddMRUColor(const AColor: TColor): TcxMRUColorAction;
var
  FIndex: Integer;
begin
  Result := mcaNone;
  if MaxMRUColors = 0 then Exit;
  FIndex := FMRUColors.GetIndexByColor(AColor);
  if FIndex <> -1 then
  begin
    if (FIndex > 0) and (FIndex < FMRUColors.Count) then
    begin
      Result := mcaMoved;
      FMRUColors.Move(FIndex, 0);
      if Assigned(FOnAddedMRUColor) then FOnAddedMRUColor(Self);
    end
    else
      Result := mcaNone;
  end
  else
    Result := mcaAdded;
  if Result = mcaAdded then
  begin
    FIndex := Items.GetIndexByColor(AColor);
    if FIndex > -1 then
    begin
      FInternalUpdate := True;
      try
        FMRUColors.InsertColor(0, AColor, Items[FIndex].Description);
        DeleteOverMRUColors;
      finally
        FInternalUpdate := False;
      end;
      if Assigned(FOnAddedMRUColor) then FOnAddedMRUColor(Self);
    end
    else
      Result := mcaNone;
  end;
end;

function TcxCustomColorComboBoxProperties.DelMRUColor(const AColor: TColor): TcxMRUColorAction;
var
  FIndex: Integer;
begin
  Result := mcaNone;
  {Check for right Color}
  FIndex := Items.GetIndexByColor(AColor);
  if FIndex < 0 then Exit;
  if FMRUColors.FindColorItem(AColor) <> nil then
  begin
{$IFDEF DELPHI5}
    FMRUColors.Delete(FIndex);
{$ELSE}
    TcxColorComboBoxItem(FMRUColors.Items[FIndex]).Free;
{$ENDIF}
    Result := mcaDeleted;
    if Assigned(FOnDeletedMRUColor) then FOnDeletedMRUColor(Self);
  end;
end;

procedure TcxCustomColorComboBoxProperties.ClearMRUColors;
begin
  FMRUColors.Clear;
  Changed;
end;

procedure TcxCustomColorComboBoxProperties.Changed;
begin
  if FInternalUpdate then Exit;
  inherited;
end;

procedure TcxCustomColorComboBoxProperties.DoGetDefaultColor(var AColor: TColor);
begin
  if Assigned(FOnGetDefaultColor) then FOnGetDefaultColor(Self, AColor);
end;

procedure TcxCustomColorComboBoxProperties.DefineProperties(Filer: TFiler);
begin
  inherited DefineProperties(Filer);
  Filer.DefineProperty('Items', ReadColorItems, WriteColorItems, True);
  Filer.DefineProperty('PrepareInfo', ReadPrepareInfo, WritePrepareInfo, True);
end;

procedure TcxCustomColorComboBoxProperties.ReadPrepareInfo(Reader: TReader);
begin
  Reader.ReadValue;
  PrepareInfo := Reader.ReadWideString;
end;

procedure TcxCustomColorComboBoxProperties.WritePrepareInfo(Writer: TWriter);
begin
  Writer.WriteString(PrepareInfo);
end;

procedure TcxCustomColorComboBoxProperties.SetPrepareInfo(Value: string);
begin
  FPrepareInfo := Value;
  case FPrepareList of
    cxplDelphi: InternalPrepareDelphiColorList;
    cxplHTML4: InternalPrepareHTML4ColorList;
    cxplX11: InternalPrepareX11ColorList;
    cxplX11Ordered: InternalPrepareX11OrderedColorList;
  end;
end;

procedure TcxCustomColorComboBoxProperties.ReadColorItems(Reader: TReader);
begin
  Reader.ReadValue;
  Reader.ReadCollection(FItems);
end;

procedure TcxCustomColorComboBoxProperties.WriteColorItems(Writer: TWriter);
var
  I: Integer;
  AOldAncestor: TPersistent;
  FValueType: TValueType;

  procedure LocalWriteProperties(var AWriter: TWriter; Instance: TPersistent);
  var
    I, Count: Integer;
    PropInfo: PPropInfo;
    PropList: PPropList;

    procedure WriteIntProp(IntType: PTypeInfo; Value: Longint);
{$IFDEF DELPHI6}
    var
      Ident: string;
      IntToIdent: TIntToIdent;
{$ENDIF}
    begin
{$IFDEF DELPHI6}
      IntToIdent := FindIntToIdent(IntType);
      if Assigned(IntToIdent) and IntToIdent(Value, Ident) then
        AWriter.WriteIdent(Ident)
      else
{$ENDIF}
        AWriter.WriteInteger(Value);
    end;

  begin
    Count := GetTypeData(Instance.ClassInfo)^.PropCount;
    if Count > 0 then
    begin
      GetMem(PropList, Count * SizeOf(Pointer));
      try
        GetPropInfos(Instance.ClassInfo, PropList);
        for I := 0 to Count - 1 do
        begin
          PropInfo := PropList^[I];
          if PropInfo = nil then
            Break;
          if IsStoredProp(Instance, PropInfo) then
          begin
            if PropInfo.Name = 'Color' then
            begin
              AWriter.WriteStr(PropInfo.Name);
              WriteIntProp(PPropInfo(PropInfo)^.PropType^,
                TcxColorComboBoxItem(Instance).Color);
            end;
            if PropInfo.Name = 'Description' then
            begin
              AWriter.WriteStr(PropInfo.Name);
              AWriter.WriteWideString(TcxColorComboBoxItem(Instance).Description);
            end;
          end;
        end;
      finally
        FreeMem(PropList, Count * SizeOf(Pointer));
      end;
    end;
  end;

begin
  AOldAncestor := Writer.Ancestor;
  Writer.Ancestor := nil;
  try
    FInternalUpdate := True;
    FValueType := vaCollection;
    Writer.Write(FValueType, SizeOf(FValueType));
    if Assigned(FItems) then
    begin
      for I := 0 to FItems.Count - 1 do
      begin
        if FItems.Items[I].FIsCustomColor then
        begin
          Writer.WriteListBegin;
          LocalWriteProperties(Writer, FItems.Items[I]);
          Writer.WriteListEnd;
        end;
      end;
    end;
    Writer.WriteListEnd;
  finally
    FInternalUpdate := False;
    Writer.Ancestor := AOldAncestor;
  end;
end;
{ TcxCustomColorComboBoxProperties }

{ TcxCustomColorComboBox }
constructor TcxCustomColorComboBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FIsDialogShowed := False;
  FColorValue := clWindow;
  FSavedColor := clWindow;
  FPropertiesUpdate := False;
  ControlStyle := ControlStyle - [csClickEvents];
  Properties.FOnLoadColorList := PropertiesLoadColorListHandler;
end;

procedure TcxCustomColorComboBox.Loaded;
begin
  inherited Loaded;
  if Properties.Items.GetIndexByColor(ColorValue) >= 0 then
    InternalSetEditValue(ColorValue, False);
end;

class function TcxCustomColorComboBox.GetPropertiesClass: TcxCustomEditPropertiesClass;
begin
  Result := TcxColorComboBoxProperties;
end;

procedure TcxCustomColorComboBox.ContainerStyleChanged(Sender: TObject);
begin
  inherited ContainerStyleChanged(Sender);
end;

procedure TcxCustomColorComboBox.PropertiesChanged(Sender: TObject);
begin
  if FPropertiesUpdate then Exit;
  FPropertiesUpdate := True;
  try
    inherited;
    with Properties do
      if AllowSelectColor then
        if ButtonGlyph.Empty then
          Buttons[1].Kind := bkEllipsis
        else
          Buttons[1].Kind := bkGlyph
      else
        if ButtonGlyph.Empty then
          Buttons[0].Kind := bkDown
        else
          Buttons[0].Kind := bkGlyph;
  finally
    FPropertiesUpdate := False;
  end;
end;

procedure TcxCustomColorComboBox.SetColorValue(Value: TColor);
begin
  if FColorValue <> Value then
  begin
    FColorValue := Value;
    FSavedColor := FColorValue;
    LockClick(True);
    try
      EditValue := FColorValue;
    finally
      LockClick(False);
    end;
  end;
end;

procedure TcxCustomColorComboBox.DblClick;
begin
  inherited DblClick;
end;

procedure TcxCustomColorComboBox.DoButtonClick(AButtonVisibleIndex: Integer);
begin
  if (AButtonVisibleIndex = 1) then
    DoSelectCustomColor(Self);
end;

procedure TcxCustomColorComboBox.DoSelectCustomColor(Sender: TObject);
var
  FColorProvided: TColor;
  FColorDialog: TColorDialog;
  FColorDescription: string;
  FAddToList: Boolean;
  FIndex: Integer;
  FAddedItem: TcxColorComboBoxItem;
begin
  FColorProvided := clNone;
  FColorDescription := '';
  FAddToList := True;

  if Properties.ColorDialogType = cxcdtDefault then
  begin
    FColorDialog := TColorDialog.Create(nil);
    try
      FIsDialogShowed := True;
      FColorDialog.Color := Self.ColorValue;
      if FColorDialog.Execute then
        FColorProvided := FColorDialog.Color
      else
        Exit;
    finally
      FIsDialogShowed := False;
      FreeAndNil(FColorDialog);
    end;
  end;

  if Assigned(Properties.OnSelectCustomColor) then
    Properties.OnSelectCustomColor(Self,
    FColorProvided, FColorDescription, FAddToList);

  FIndex := Properties.GetIndexByColor(FColorProvided);
  if FAddToList and (FIndex = -1) then
  begin
    FAddedItem := Properties.Items.AddColor(FColorProvided, FColorDescription);
    FAddedItem.FIsCustomColor := True;
    Properties.AddMRUColor(FColorProvided);
  end
  else
    ItemIndex := FIndex;

  FixMRUPosition(FColorProvided);

  if DoEditing and FAddToList then
  begin
    ColorValue := FColorProvided;
    ItemIndex := Properties.MRUColors.GetIndexByColor(FColorProvided);
    EditModified := True;
    PostEditValue;
  end;
end;

function TcxCustomColorComboBox.GetInnerEditClass: TControlClass;
begin
  Result := TcxCustomColorComboBoxInnerEdit;
end;

function TcxCustomColorComboBox.GetPopupWindowClientPreferredSize: TSize;
begin
  Result := inherited GetPopupWindowClientPreferredSize;
  Inc(Result.cx, Properties.ColorBoxWidth);
end;

procedure TcxCustomColorComboBox.InitializePopupWindow;
begin
  inherited InitializePopupWindow;
  (PopupWindow as TcxColorComboBoxPopupWindow).SysPanelStyle := Properties.PopupSizeable;
end;

procedure TcxCustomColorComboBox.InitializeLookupData;
begin
  inherited InitializeLookupData;
  if LookupData.ActiveControl <> nil then
    with TcxCustomColorComboBoxListBox(LookupData.ActiveControl) do
      FProperties := Properties;
end;

procedure TcxCustomColorComboBox.ClearEditValue;
begin
  EditValue := null;
  ModifiedAfterEnter := True;
  SynchronizeDisplayValue;
  if Properties.ImmediatePost and AutoPostEditValue then
    PostEditValue;
end;

function TcxCustomColorComboBox.Focused: Boolean;
begin
  Result := FIsDialogShowed or inherited Focused;
end;

procedure TcxCustomColorComboBox.DoEditKeyDown(var Key: Word; Shift: TShiftState);
var
  AKey: Word;
begin
  AKey := TranslateKey(Key);
  if (AKey = VK_DELETE) and DoEditing then
    ClearEditValue
  else
    inherited DoEditKeyDown(Key, Shift);
end;

function TcxCustomColorComboBox.IsValidChar(AChar: Char): Boolean;
begin
  Result := AChar in [#32..#255];
end;

function TcxCustomColorComboBox.GetProperties: TcxColorComboBoxProperties;
begin
  Result := TcxColorComboBoxProperties(InternalGetProperties);
end;

function TcxCustomColorComboBox.GetItemIndex: Integer;
begin
  Result := LookupData.CurrentKey;
end;

function TcxCustomColorComboBox.GetLookupData: TcxColorComboBoxLookupData;
begin
  Result := TcxColorComboBoxLookupData(FLookupData);
end;

procedure TcxCustomColorComboBox.SetItemIndex(Value: Integer);
var
  APrevItemIndex: Integer;
begin
  APrevItemIndex := ItemIndex;
  LookupData.CurrentKey := Value;
  if ItemIndex <> APrevItemIndex then
    EditModified := False;
end;

procedure TcxCustomColorComboBox.SetProperties(Value: TcxColorComboBoxProperties);
begin
  FProperties.Assign(Value);
end;

function TcxCustomColorComboBox.AddMRUColor(const AColor: TColor): TcxMRUColorAction;
begin
  Result := Properties.AddMRUColor(AColor);
end;

function TcxCustomColorComboBox.DelMRUColor(const AColor: TColor): TcxMRUColorAction;
begin
  Result := Properties.DelMRUColor(AColor);
end;

function TcxCustomColorComboBox.LookupKeyToEditValue(const AKey: TcxEditValue): TcxEditValue;
begin
  if not VarEqualsExact(AKey, -1) then
    Result := Properties.GetColorByIndex(AKey)
  else
    Result := Null;
end;

procedure TcxCustomColorComboBox.PrepareEditValue(const ADisplayValue: TcxEditValue;
  out EditValue: TcxEditValue; AEditFocused: Boolean);
begin
  if VarEqualsExact(LookupData.CurrentKey, -1) then
  begin
    EditValue := Null;
    FColorValue := FSavedColor;
  end
  else
  begin
    FColorValue := Properties.GetColorByIndex(LookupData.CurrentKey);
    EditValue := FColorValue;
  end;
end;

procedure TcxCustomColorComboBox.PrepareDisplayValue(const AEditValue: TcxEditValue;
  var DisplayValue: TcxEditValue; AEditFocused: Boolean);
begin
  inherited;
end;

procedure TcxCustomColorComboBox.SynchronizeDisplayValue;
begin
  inherited;
  ILookupData.TextChanged;
  ResetOnNewDisplayValue;
  UpdateDrawValue;
  if LookupData.CurrentKey = -1 then
    FColorValue := FSavedColor
  else
    FColorValue := Properties.GetColorByIndex(LookupData.CurrentKey);
end;

procedure TcxCustomColorComboBox.CloseUp(AAccept: Boolean);
var
  FSavedColor: TColor;
begin
  inherited;
  if AAccept = True then
  begin
    with Properties do
      FSavedColor := GetColorByIndex(ILookupData.CurrentKey);
      FixMRUPosition(FSavedColor);
  end;
end;

procedure TcxCustomColorComboBox.FixMRUPosition(AColor: TColor);
var
  FMRUColorAction: TcxMRUColorAction;
begin
  FMRUColorAction := AddMRUColor(AColor);
  if (FMRUColorAction = mcaAdded) or
     (FMRUColorAction = mcaMoved) then
    ItemIndex := LookupData.InternalChangeCurrentMRUColorPosition(AColor);
end;

procedure TcxCustomColorComboBox.InternalSetEditValue(const Value: TcxEditValue;
  AValidateEditValue: Boolean);
begin
  if IsDestroying then Exit;
  inherited InternalSetEditValue(Value, AValidateEditValue);
end;

procedure TcxCustomColorComboBox.PropertiesLoadColorListHandler(Sender: TObject);
begin
  FlushEditValue;
end;

procedure TcxCustomColorComboBox.FlushEditValue;
begin
  ItemIndex := -1;
  if DoEditing then
    ClearEditValue;
  PostEditValue;
end;

procedure TcxCustomColorComboBox.PrepareDelphiColorList(
  const ASaveCustom, ASaveMRU: Boolean);
var
  FBeforeLoadColor: TColor;
  FNewIndex: Integer;
begin
  FBeforeLoadColor := ColorValue;

  Properties.FOnLoadColorList := nil;
  Properties.PrepareDelphiColorList(ASaveCustom, ASaveMRU);
  Properties.FOnLoadColorList := PropertiesLoadColorListHandler;
  FNewIndex := Properties.Items.GetIndexByColor(FBeforeLoadColor);
  if FNewIndex = -1 then
    FlushEditValue
  else
  begin
    FEditValue := FBeforeLoadColor;
    InternalSetEditValue(FBeforeLoadColor, False);
  end;
end;

procedure TcxCustomColorComboBox.PrepareHTML4ColorList(const ASaveCustom,
  ASaveMRU: Boolean);
var
  FBeforeLoadColor: TColor;
  FNewIndex: Integer;
begin
  FBeforeLoadColor := ColorValue;

  Properties.FOnLoadColorList := nil;
  Properties.PrepareHTML4ColorList(ASaveCustom, ASaveMRU);
  Properties.FOnLoadColorList := PropertiesLoadColorListHandler;
  FNewIndex := Properties.Items.GetIndexByColor(FBeforeLoadColor);
  if FNewIndex = -1 then
    FlushEditValue
  else
  begin
    FEditValue := FBeforeLoadColor;
    InternalSetEditValue(FBeforeLoadColor, False);
  end;
end;

procedure TcxCustomColorComboBox.PrepareX11ColorList(const ASaveCustom,
  ASaveMRU: Boolean);
var
  FBeforeLoadColor: TColor;
  FNewIndex: Integer;
begin
  FBeforeLoadColor := ColorValue;

  Properties.FOnLoadColorList := nil;
  Properties.PrepareX11ColorList(ASaveCustom, ASaveMRU);
  Properties.FOnLoadColorList := PropertiesLoadColorListHandler;
  FNewIndex := Properties.Items.GetIndexByColor(FBeforeLoadColor);
  if FNewIndex = -1 then
    FlushEditValue
  else
  begin
    FEditValue := FBeforeLoadColor;
    InternalSetEditValue(FBeforeLoadColor, False);
  end;
end;

procedure TcxCustomColorComboBox.PrepareX11OrderedColorList(const ASaveCustom,
  ASaveMRU: Boolean);
var
  FBeforeLoadColor: TColor;
  FNewIndex: Integer;
begin
  FBeforeLoadColor := ColorValue;

  Properties.FOnLoadColorList := nil;
  Properties.PrepareX11OrderedColorList(ASaveCustom, ASaveMRU);
  Properties.FOnLoadColorList := PropertiesLoadColorListHandler;
  FNewIndex := Properties.Items.GetIndexByColor(FBeforeLoadColor);
  if FNewIndex = -1 then
    FlushEditValue
  else
  begin
    FEditValue := FBeforeLoadColor;
    InternalSetEditValue(FBeforeLoadColor, False);
  end;
end;
{ TcxCustomColorComboBox }

initialization
  GetRegisteredEditProperties.Register(TcxColorComboBoxProperties, scxSEditRepositoryColorComboBoxItem);

finalization
  GetRegisteredEditProperties.Unregister(TcxColorComboBoxProperties);

end.
