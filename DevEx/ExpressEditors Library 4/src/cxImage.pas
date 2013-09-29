
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

unit cxImage;

{$I cxEdVer.inc}

{$DEFINE USEJPEG}

interface

uses
{$IFDEF VCL}
  Windows, Messages, ExtDlgs,
{$ELSE}
  Qt, QTypes,
{$ENDIF}
{$IFDEF DELPHI6}
  Types,
{$ENDIF}
  SysUtils, Classes, Clipbrd, Controls, Dialogs, ExtCtrls, Forms, Graphics, Menus,
  StdCtrls, cxClasses, cxContainer, cxControls, cxDataUtils, cxEdit, cxEditConsts,
  cxGraphics, cxLookAndFeels;

const
  cxImageDefaultInplaceHeight = 15;

type
  TcxCustomImage = class;
  TcxPopupMenuItem = (pmiCut, pmiCopy, pmiPaste, pmiDelete, pmiLoad, pmiSave,
    pmiCustom);
  TcxPopupMenuItems = set of TcxPopupMenuItem;
  TcxPopupMenuItemClick = procedure(Sender: TObject;
    MenuItem: TcxPopupMenuItem) of object;

  { TcxPopupMenuLayout }

  TcxPopupMenuLayout = class(TPersistent)
  private
    FCustomMenuItemCaption: string;
    FCustomMenuItemGlyph: TBitmap;
    FImage: TcxCustomImage;
    FMenuItems: TcxPopupMenuItems;
    function GetCustomMenuItemGlyph: TBitmap; virtual;
    procedure SetCustomMenuItemGlyph(Value: TBitmap);
  public
    constructor Create(AImage: TcxCustomImage);
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
  published
    property MenuItems: TcxPopupMenuItems read FMenuItems write FMenuItems default
      [pmiCut, pmiCopy, pmiPaste, pmiDelete, pmiLoad, pmiSave];
    property CustomMenuItemCaption: string
      read FCustomMenuItemCaption write FCustomMenuItemCaption;
    property CustomMenuItemGlyph: TBitmap
      read GetCustomMenuItemGlyph write SetCustomMenuItemGlyph;
  end;

  { TcxImageViewInfo }

  TcxImageViewInfo = class(TcxCustomEditViewInfo)
  private
    FFreePicture: Boolean;
    FTempBitmap: TBitmap;
  protected
    procedure InternalPaint(ACanvas: TcxCanvas); override;
  public
    ShowFocusRect: Boolean;
    TopLeft: TPoint;
    Caption: string;
    Center: Boolean;
    Picture: TPicture;
    Stretch: Boolean;
    destructor Destroy; override;
  end;

  { TcxImageViewData }

  TcxImageViewData = class(TcxCustomEditViewData)
  public
    procedure Calculate(ACanvas: TcxCanvas; const ABounds: TRect; const P: TPoint;
      Button: TcxMouseButton; Shift: TShiftState; AViewInfo: TcxCustomEditViewInfo;
      AIsMouseEvent: Boolean); override;
    procedure EditValueToDrawValue(ACanvas: TcxCanvas; const AEditValue: TcxEditValue;
      AViewInfo: TcxCustomEditViewInfo); override;
    function GetEditContentSize(ACanvas: TcxCanvas;
      const AEditValue: TcxEditValue;
      const AEditSizeProperties: TcxEditSizeProperties): TSize; override;
  end;

  { TcxCustomImageProperties }

  TcxImageAssignPictureEvent = procedure(Sender: TObject;
    const Picture: TPicture) of object;
  TcxImageGraphicClassEvent = procedure(Sender: TObject;
    var GraphicClass: TGraphicClass) of object;
  TcxImageTransparency = (gtDefault, gtOpaque, gtTransparent);

  TcxCustomImageProperties = class(TcxCustomEditProperties)
  private
    FCaption: string;
    FCenter: Boolean;
    FCustomFilter: string;
    FGraphicClass: TGraphicClass;
    FDefaultHeight: Integer;
    FGraphicClassName: string;
    FGraphicTransparency: TcxImageTransparency;
    FOnAssignPicture: TcxImageAssignPictureEvent;
    FOnCustomClick: TNotifyEvent;
    FPopupMenuLayout: TcxPopupMenuLayout;
    FShowFocusRect: Boolean;
    FStretch: Boolean;
    function GetGraphicClassName: string;
    function IsStoredGraphicClassName: Boolean;
    procedure SetCaption(const Value: string);
    procedure SetCenter(Value: Boolean);
    procedure SetGraphicClass(const Value: TGraphicClass);
    procedure SetGraphicClassName(const Value: string);
    procedure SetGraphicTransparency(Value: TcxImageTransparency);
    procedure SetPopupMenuLayout(Value: TcxPopupMenuLayout);
    procedure SetStretch(Value: Boolean);
  protected
    function CanValidate: Boolean; override;
    function IsDesigning: Boolean;
    property Caption: string read FCaption write SetCaption;
    property Center: Boolean read FCenter write SetCenter default True;
    property CustomFilter: string read FCustomFilter write FCustomFilter;
    property DefaultHeight: Integer read FDefaultHeight write FDefaultHeight
      default cxImageDefaultInplaceHeight;
    property GraphicClass: TGraphicClass read FGraphicClass write SetGraphicClass;
    property GraphicClassName: string read GetGraphicClassName
      write SetGraphicClassName stored IsStoredGraphicClassName;
    property GraphicTransparency: TcxImageTransparency
      read FGraphicTransparency write SetGraphicTransparency default gtDefault;
    property PopupMenuLayout: TcxPopupMenuLayout
      read FPopupMenuLayout write SetPopupMenuLayout;
    property ShowFocusRect: Boolean read FShowFocusRect write FShowFocusRect;
    property Stretch: Boolean read FStretch write SetStretch default False;
    property OnAssignPicture: TcxImageAssignPictureEvent
      read FOnAssignPicture write FOnAssignPicture;
    property OnCustomClick: TNotifyEvent read FOnCustomClick
      write FOnCustomClick;
  public
    constructor Create(AOwner: TPersistent); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    class function GetContainerClass: TcxContainerClass; override;
    function GetDisplayText(const AEditValue: TcxEditValue; AFullText: Boolean = False): WideString; override;
    function GetEditValueSource(AEditFocused: Boolean): TcxDataEditValueSource; override;
    function GetSupportedOperations: TcxEditSupportedOperations; override;
    class function GetViewDataClass: TcxCustomEditViewDataClass; override;
    class function GetViewInfoClass: TcxContainerViewInfoClass; override;
    function IsResetEditClass: Boolean; override;
    procedure ValidateDisplayValue(var DisplayValue: TcxEditValue; var ErrorText: TCaption;
      var Error: Boolean; AEdit: TcxCustomEdit); override;
  end;

  { TcxImageProperties }

  TcxImageProperties = class(TcxCustomImageProperties)
  public
    property GraphicClass;
    property ShowFocusRect;
  published
    property Caption;
    property Center;
    property CustomFilter;
    property GraphicClassName;
    property GraphicTransparency;
    property ImmediatePost;
    property PopupMenuLayout;
    property ReadOnly;
    property Stretch;
    property OnAssignPicture;
    property OnChange;
    property OnEditValueChanged;
    property OnCustomClick;
  end;

  { TcxCustomImage }

  TcxCustomImage = class(TcxCustomEdit)
  private
    FEditPopupMenu: TPopupMenu;
    FIsDialogShowed: Boolean;
  {$IFDEF VCL}
    FClipboardFormat: Word;
  {$ENDIF}
    FInternalChanging: Boolean;
    FPicture: TPicture;
    procedure EditPopupMenuClick(Sender: TObject);
    function GetProperties: TcxImageProperties;
    procedure MenuItemClick(Sender: TObject; MenuItem: TcxPopupMenuItem);
    procedure PictureChanged(Sender: TObject);
    procedure PreparePopup;
    procedure ResetImage;
    procedure SetPicture(Value: TPicture);
    procedure SetProperties(const Value: TcxImageProperties);
    procedure SynchronizeImage;
  {$IFNDEF DELPHI5}
    procedure WMRButtonUp(var Message: TWMRButtonUp); message WM_RBUTTONUP;
  {$ENDIF}
  protected
    function CanAutoSize: Boolean; override;
    function CanAutoWidth: Boolean; override;
    procedure DoContextPopup({$IFNDEF VCL}const{$ENDIF} MousePos: TPoint;
      var Handled: Boolean); {$IFDEF DELPHI5} override; {$ENDIF}
    procedure InitScrollBarsParameters; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
{$IFNDEF VCL}
    procedure LookAndFeelChanged(Sender: TcxLookAndFeel;
      AChangedValues: TcxLookAndFeelValues); override;
{$ENDIF}
    function NeedsScrollBars: Boolean; override;
    procedure Scroll(AScrollBarKind: TScrollBarKind; AScrollCode: TScrollCode;
      var AScrollPos: Integer); override;
    function GetEditValue: TcxEditValue; override;
    procedure InternalSetEditValue(const Value: TcxEditValue;
      AIsValueValid: Boolean); override;
    procedure PropertiesChanged(Sender: TObject); override;
    procedure UpdateScrollBars; override;

    // virtual methods
    procedure CustomClick; virtual;
    function GetGraphicClass: TGraphicClass; virtual;

    property AutoSize default False;
{$IFDEF VCL}
    property ClipboardFormat: Word read FClipboardFormat write FClipboardFormat;
{$ENDIF}
    property ParentColor default False;
    property Picture: TPicture read FPicture write SetPicture;
    property Properties: TcxImageProperties read GetProperties write SetProperties;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Clear; override;
    procedure CopyToClipboard; override;
    procedure CutToClipboard; override;
    function Focused: Boolean; override;
    class function GetPropertiesClass: TcxCustomEditPropertiesClass; override;
    procedure LoadFromFile;
    procedure PasteFromClipboard; override;
    procedure SaveToFile;
  end;

  { TcxImage }

  TcxImage = class(TcxCustomImage)
  published
    property Align;
    property Anchors;
    property AutoSize;
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
    property ParentShowHint;
    property Picture;
    property Properties;
    property Style;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnClick;
    property OnDblClick;
    property OnEditing;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
  {$IFDEF VCL}
    property OnEndDock;
    property OnStartDock;
  {$ENDIF}
  end;

function IsPictureEmpty(APicture: TPicture): Boolean;
procedure LoadPicture(Picture: TPicture; GraphicClass: TGraphicClass; const Value: Variant);
procedure SavePicture(APicture: TPicture; var AValue: string);

function GetRegisteredGraphicClasses: TList;
procedure RegisterGraphicClass(AGraphicClass: TGraphicClass);
procedure UnRegisterGraphicClass(AGraphicClass: TGraphicClass);

implementation

{$IFNDEF VCL}
  {$UNDEF USEJPEG}
{$ENDIF}

{$R cxExEdtr.res}

uses
  ImgList,
{$IFDEF DELPHI6}
  Variants,
{$ELSE}
  cxVariants,
{$ENDIF}
{$IFDEF USEJPEG}
  Jpeg,
{$ENDIF}
  cxEditUtils;

var
  cxGraphicPopupMenuImages: TImageList;
  cxRegisteredGraphicClasses: TList;

function GetRegisteredGraphicClasses: TList;
begin
  if cxRegisteredGraphicClasses = nil then
  begin
    cxRegisteredGraphicClasses := TList.Create;
    RegisterGraphicClass(TBitmap);
    RegisterGraphicClass(TIcon);
  {$IFDEF VCL}
    RegisterGraphicClass(TMetaFile);
  {$ENDIF}
  {$IFDEF USEJPEG}
    RegisterGraphicClass(TJpegImage);
  {$ENDIF}
  end;
  Result := cxRegisteredGraphicClasses
end;

procedure RegisterGraphicClass(AGraphicClass: TGraphicClass);
begin
  if cxRegisteredGraphicClasses.IndexOf(AGraphicClass) = -1 then
    cxRegisteredGraphicClasses.Add(AGraphicClass);
end;

procedure UnRegisterGraphicClass(AGraphicClass: TGraphicClass);
var
  I: Integer;
begin
  I := cxRegisteredGraphicClasses.IndexOf(AGraphicClass);
  if I <> -1 then
    cxRegisteredGraphicClasses.Delete(I);
end;

function GetGraphicClassByName(const AClassName: string): TGraphicClass;
var
  I: Integer;
begin
  Result := nil;
  for i := 0 to GetRegisteredGraphicClasses.Count - 1 do
    if CompareText(AClassName, TClass(GetRegisteredGraphicClasses[I]).ClassName) = 0 then
    begin
      Result := TGraphicClass(GetRegisteredGraphicClasses[I]);
      Break;
    end;
end;

function MinInt(A, B: Integer): Integer;
begin
  Result := A;
  if B < A then Result := B;
end;

procedure CalcStretchRect(R: TRect; W, H: Integer; out CalcRect: TRect);
var
  W1, H1: Integer;
begin
  if IsRectEmpty(R) then
  begin
    CalcRect := R;
    Exit;
  end;
  CalcRect.TopLeft := R.TopLeft;
  W1 := R.Right - R.Left;
  H1 := R.Bottom - R.Top;
  if W / H > W1 / H1 then
  begin
    CalcRect.Right := R.Right;
    CalcRect.Bottom := CalcRect.Top + (W1 * H div W);
  end
  else
  begin
    CalcRect.Bottom := R.Bottom;
    CalcRect.Right := CalcRect.Left + (H1 * W div H);
  end;
end;

type
  TMemoryStreamReadOnly = class(TCustomMemoryStream)
  public
    procedure SetBuffer(const Buffer; Count: Longint);
    function Write(const Buffer; Count: Longint): Longint; override;
  end;

procedure TMemoryStreamReadOnly.SetBuffer(const Buffer; Count: Longint);
begin
  SetPointer(@Buffer, Count);
end;

function TMemoryStreamReadOnly.Write(const Buffer; Count: Longint): Longint;
begin
  Result := 0;
end;

function IsPictureEmpty(APicture: TPicture): Boolean;
begin
  Result := not Assigned(APicture.Graphic) or APicture.Graphic.Empty;
end;

procedure LoadPicture(Picture: TPicture; GraphicClass: TGraphicClass; const Value: Variant);
{ Paradox graphic BLOB header - see DB.pas}
type
  TGraphicHeader = record
    Count: Word;                { Fixed at 1 }
    HType: Word;                { Fixed at $0100 }
    Size: Longint;              { Size not including header }
  end;
var
  Stream: TMemoryStreamReadOnly;
  Size: Longint;
  Header: TGraphicHeader;
  Graphic: TGraphic;
begin
  if VarType(Value) = varString then // Field.Value -> stored as string
  begin
    Stream := TMemoryStreamReadOnly.Create;
    try
      Size := Length(Value);
      if Size >= SizeOf(TGraphicHeader) then
      begin
        Stream.SetBuffer(string(Value)[1], Size);
        Stream.Position := 0;
        Stream.Read(Header, SizeOf(Header));
        if (Header.Count <> 1) or (Header.HType <> $0100) or
          (Header.Size <> Size - SizeOf(Header)) then
          Stream.Position := 0;
      end;
      if Stream.Size > 0 then
        try
          if GraphicClass = nil then
            Picture.Bitmap.LoadFromStream(Stream)
          else
          begin
            Graphic := GraphicClass.Create;
            try
              Graphic.LoadFromStream(Stream);
              Picture.Graphic := Graphic;
            finally
              Graphic.Free;
            end;
          end;
        except
          Picture.Assign(nil);
        end
      else
        Picture.Assign(nil);
    finally
      Stream.Free;
    end;
  end
  else
    Picture.Assign(nil);
end;

procedure SavePicture(APicture: TPicture; var AValue: string);
var
  AStream: TMemoryStream;
begin
  if not Assigned(APicture) or IsPictureEmpty(APicture) then
    AValue := ''
  else
  begin
    AStream := TMemoryStream.Create;
    try
      APicture.Graphic.SaveToStream(AStream);
      AStream.Position := 0;
      SetLength(AValue, AStream.Size);
      AStream.ReadBuffer(AValue[1], AStream.Size);
    finally
      AStream.Free;
    end;
  end;
end;

{ TcxPopupMenuLayout }

constructor TcxPopupMenuLayout.Create(AImage: TcxCustomImage);
begin
  inherited Create;
  FImage := AImage;
  FMenuItems := [pmiCut, pmiCopy, pmiPaste, pmiDelete, pmiLoad, pmiSave];
end;

destructor TcxPopupMenuLayout.Destroy;
begin
  if FCustomMenuItemGlyph <> nil then FCustomMenuItemGlyph.Free;
  inherited Destroy;
end;

function TcxPopupMenuLayout.GetCustomMenuItemGlyph: TBitmap;
begin
  if FCustomMenuItemGlyph = nil then
    FCustomMenuItemGlyph := TBitmap.Create;
  Result := FCustomMenuItemGlyph;
end;

procedure TcxPopupMenuLayout.SetCustomMenuItemGlyph(Value: TBitmap);
begin
  if (Value = nil) then
  begin
    FCustomMenuItemGlyph.Free;
    FCustomMenuItemGlyph := nil;
  end
  else
    CustomMenuItemGlyph.Assign(Value);
end;

procedure TcxPopupMenuLayout.Assign(Source: TPersistent);
begin
  if Source is TcxPopupMenuLayout then
    with TcxPopupMenuLayout(Source) do
    begin
      Self.MenuItems := MenuItems;
      Self.CustomMenuItemCaption := CustomMenuItemCaption;
      Self.CustomMenuItemGlyph.Assign(CustomMenuItemGlyph);
    end
  else
    inherited Assign(Source);
end;

{ TcxCustomImageProperties }

constructor TcxCustomImageProperties.Create(AOwner: TPersistent);
begin
  inherited Create(AOwner);
  FPopupMenuLayout := TcxPopupMenuLayout.Create(nil);
  FCenter := True;
  FDefaultHeight := cxImageDefaultInplaceHeight;
  FGraphicTransparency := gtDefault;
  FShowFocusRect := True;
  FStretch := False;
  if not (GetOwner is TcxCustomEdit) then GraphicClassName := 'TBitmap';
end;

destructor TcxCustomImageProperties.Destroy;
begin
  FPopupMenuLayout.Free;
  inherited Destroy;
end;

function TcxCustomImageProperties.GetGraphicClassName: string;
begin
  if not IsDesigning and (FGraphicClass <> nil) then
    Result := FGraphicClass.ClassName
  else
    Result := FGraphicClassName;
end;

function TcxCustomImageProperties.IsStoredGraphicClassName: Boolean;
begin
  if not (GetOwner is TcxCustomEdit) then // repository item
    Result := CompareText(GraphicClassName, 'TBitmap') <> 0
  else
    Result := GraphicClassName <> '';
end;

procedure TcxCustomImageProperties.SetCaption(const Value: string);
begin
  if FCaption <> Value then
  begin
    FCaption := Value;
    Changed;
  end;
end;

procedure TcxCustomImageProperties.SetCenter(Value: Boolean);
begin
  if FCenter <> Value then
  begin
    FCenter := Value;
    Changed;
  end;
end;

procedure TcxCustomImageProperties.SetGraphicClass(
  const Value: TGraphicClass);
begin
  if FGraphicClass <> Value then
  begin
    FGraphicClass := Value;
    Changed;
  end;
end;

procedure TcxCustomImageProperties.SetGraphicClassName(
  const Value: string);
begin
  if FGraphicClassName <> Value then
  begin
    FGraphicClassName := Value;
    FGraphicClass := GetGraphicClassByName(Value);
    Changed;
  end;
end;

procedure TcxCustomImageProperties.SetGraphicTransparency(
  Value: TcxImageTransparency);
begin
  if FGraphicTransparency <> Value then
  begin
    FGraphicTransparency := Value;
    Changed;
  end;
end;

procedure TcxCustomImageProperties.SetPopupMenuLayout(
  Value: TcxPopupMenuLayout);
begin
  FPopupMenuLayout.Assign(Value);
end;

procedure TcxCustomImageProperties.SetStretch(Value: Boolean);
begin
  if FStretch <> Value then
  begin
    FStretch := Value;
    Changed;
  end;
end;

function TcxCustomImageProperties.CanValidate: Boolean;
begin
  Result := True;
end;

function TcxCustomImageProperties.IsDesigning: Boolean;
var
  AOwner: TPersistent;
begin
  AOwner := GetOwner;
  Result := (AOwner is TComponent) and
    (csDesigning in (AOwner as TComponent).ComponentState);
end;

procedure TcxCustomImageProperties.Assign(Source: TPersistent);
begin
  if Source is TcxCustomImageProperties then
  begin
    BeginUpdate;
    try
      inherited Assign(Source);
      with TcxCustomImageProperties(Source) do
      begin
        Self.Caption := Caption;
        Self.Center := Center;
        Self.CustomFilter := CustomFilter;
        Self.GraphicClassName := GraphicClassName;
        Self.GraphicTransparency := GraphicTransparency;
        Self.PopupMenuLayout := PopupMenuLayout;
        Self.Stretch := Stretch;
        Self.OnAssignPicture := OnAssignPicture;
        Self.OnCustomClick := OnCustomClick;
      end;
    finally
      EndUpdate
    end
  end  
  else
    inherited Assign(Source);
end;

class function TcxCustomImageProperties.GetContainerClass: TcxContainerClass;
begin
  Result := TcxCustomImage;
end;

function TcxCustomImageProperties.GetDisplayText(const AEditValue: TcxEditValue;
  AFullText: Boolean = False): WideString;
begin
  if VarIsNull(AEditValue) then Result := '' else Result := Caption;
end;

function TcxCustomImageProperties.GetEditValueSource(AEditFocused: Boolean): TcxDataEditValueSource;
begin
  Result := evsValue;
end;

function TcxCustomImageProperties.GetSupportedOperations: TcxEditSupportedOperations;
begin
  Result := inherited GetSupportedOperations;
  Include(Result, esoAutoHeight);
end;

class function TcxCustomImageProperties.GetViewDataClass: TcxCustomEditViewDataClass;
begin
  Result := TcxImageViewData;
end;

class function TcxCustomImageProperties.GetViewInfoClass: TcxContainerViewInfoClass;
begin
  Result := TcxImageViewInfo;
end;

function TcxCustomImageProperties.IsResetEditClass: Boolean;
begin
  Result := True;
end;

procedure TcxCustomImageProperties.ValidateDisplayValue(var DisplayValue: TcxEditValue;
  var ErrorText: TCaption; var Error: Boolean; AEdit: TcxCustomEdit);
begin
  if Assigned(FOnAssignPicture) then
    FOnAssignPicture(Self, TcxCustomImage(AEdit).Picture);
end;

{ TcxCustomImage }

constructor TcxCustomImage.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  AutoSize := False;
  Width := 140;
  Height := 100;
{$IFDEF VCL}
  FClipboardFormat := CF_PICTURE;
{$ENDIF}
  FPicture := TPicture.Create;
  FPicture.OnChange := PictureChanged;
  TcxImageViewInfo(ViewInfo).Picture := FPicture;
end;

destructor TcxCustomImage.Destroy;
begin
  if FEditPopupMenu <> nil then FEditPopupMenu.Free;
  FPicture.Free;
  inherited Destroy;
end;

procedure TcxCustomImage.EditPopupMenuClick(Sender: TObject);
begin
  MenuItemClick(Sender, TcxPopupMenuItem(TMenuItem(Sender).Tag));
end;

function TcxCustomImage.GetProperties: TcxImageProperties;
begin
  Result := TcxImageProperties(InternalGetProperties);
end;

procedure TcxCustomImage.MenuItemClick(Sender: TObject;
  MenuItem: TcxPopupMenuItem);
begin
  KeyboardAction := True;
  try
    case MenuItem of
      pmiCut: CutToClipboard;
      pmiCopy: CopyToClipboard;
      pmiPaste: PasteFromClipboard;
      pmiDelete: Clear;
      pmiLoad: LoadFromFile;
      pmiSave: SaveToFile;
      pmiCustom: CustomClick;
    end;
  finally
    KeyboardAction := False;
  end;
end;

procedure TcxCustomImage.PictureChanged(Sender: TObject);
var
  PrevEvent: TNotifyEvent;
begin
  LockChangeEvents(True);
  try
    if Properties.GraphicTransparency <> gtDefault then
    begin
      PrevEvent := FPicture.OnChange;
      try
        FPicture.OnChange := nil;
        if not IsPictureEmpty(FPicture) then
          FPicture.Graphic.Transparent := Properties.GraphicTransparency = gtTransparent;
      finally
        FPicture.OnChange := PrevEvent;
      end;
    end;
    if not (csLoading in ComponentState) then
    begin
      ResetImage;
      SetSize;
    end;
    if not FInternalChanging then
    begin
      if KeyboardAction then
        ModifiedAfterEnter := True;
      DoChange;
      ShortRefreshContainer(False);
    end;
    if Properties.ImmediatePost and AutoPostEditValue and ValidateEdit(True) then
      PostEditValue;
  finally
    LockChangeEvents(False);
  end;
end;

procedure TcxCustomImage.PreparePopup;

  procedure RefreshCaptions;
  begin
    with FEditPopupMenu do
    begin
      Items[0].Caption := cxGetResourceString(@cxSMenuItemCaptionCut);
      Items[1].Caption := cxGetResourceString(@cxSMenuItemCaptionCopy);
      Items[2].Caption := cxGetResourceString(@cxSMenuItemCaptionPaste);
      Items[3].Caption := cxGetResourceString(@cxSMenuItemCaptionDelete);
      Items[5].Caption := cxGetResourceString(@cxSMenuItemCaptionLoad);
      Items[6].Caption := cxGetResourceString(@cxSMenuItemCaptionSave);
    end;
  end;

  function NewItem(const ACaption: string; ABitmap: TBitmap; ATag: Integer): TMenuItem;
  begin
    Result := TMenuItem.Create(Self);
    with Result do
    begin
      Caption := ACaption;
      if Assigned(ABitmap) then Bitmap := ABitmap else ImageIndex := ATag;
      Tag := ATag;
      OnClick := EditPopupMenuClick;
    end;
  end;

  procedure AddItem(AItems: TMenuItem; AMenuItem: TcxPopupMenuItem);
  begin
    with AItems do
    begin
      if AMenuItem = pmiCustom then
      begin
        Properties.PopupMenuLayout.CustomMenuItemGlyph.Transparent := True;
        Add(NewItem(Properties.PopupMenuLayout.CustomMenuItemCaption,
          Properties.PopupMenuLayout.CustomMenuItemGlyph, Integer(AMenuItem)));
      end
      else
        Add(NewItem('', nil, Integer(AMenuItem)));
      if AMenuItem in [pmiDelete, pmiSave] then
        Add(NewItem('-', nil, -1));
    end;
  end;

var
  I: TcxPopupMenuItem;
  AFlagRO, AFlagEmpty, AIsIcon, ACanPaste: Boolean;
  AGraphicClass: TGraphicClass;
begin
  with Properties.PopupMenuLayout do
  begin
    if FEditPopupMenu = nil then
    begin
      FEditPopupMenu := TPopupMenu.Create(nil);
      FEditPopupMenu.Images := cxGraphicPopupMenuImages;
      for I := pmiCut to pmiCustom do
        AddItem(FEditPopupMenu.Items, I);
    end;
    RefreshCaptions;
    // visible
    with FEditPopupMenu do
    begin
      Items[0].Visible := pmiCut in MenuItems;
      Items[1].Visible := pmiCopy in MenuItems;
      Items[2].Visible := pmiPaste in MenuItems;
      Items[3].Visible := pmiDelete in MenuItems;
      Items[5].Visible := pmiLoad in MenuItems;
      Items[6].Visible := pmiSave in MenuItems;
      Items[8].Visible := pmiCustom in MenuItems;
      // Separators
      Items[4].Visible := Items[5].Visible or Items[6].Visible;
      Items[7].Visible := Items[8].Visible;

      AGraphicClass := GetGraphicClass;
      AIsIcon := AGraphicClass = TIcon;

    {$IFDEF VCL}
      if AGraphicClass = TBitmap then
        ACanPaste := Clipboard.HasFormat(CF_BITMAP)
      else if AIsIcon then
        ACanPaste := False
      else if AGraphicClass = TMetafile then
        ACanPaste := Clipboard.HasFormat(CF_METAFILEPICT)
      {$IFDEF USEJPEG}
      else if AGraphicClass = TJPEGImage then
        ACanPaste := Clipboard.HasFormat(CF_BITMAP)
      {$ENDIF}
      else
        ACanPaste := Clipboard.HasFormat(ClipboardFormat);
    {$ELSE}
      if AGraphicClass = TBitmap then
        ACanPaste := Clipboard.Provides('image/delphi.bitmap')
      else
        ACanPaste := Clipboard.Provides('image/delphi.picture');
    {$ENDIF}
      // Custom Item
      with Items[8] do
      begin
        Caption := CustomMenuItemCaption;
        Bitmap := CustomMenuItemGlyph;
      end;

      AFlagRO := not CanModify;
      AFlagEmpty := IsPictureEmpty(FPicture);
      Items[0].Enabled := not (AFlagEmpty or AFlagRO or AIsIcon);
      Items[1].Enabled := not AFlagEmpty and not AIsIcon;
      Items[2].Enabled := not AFlagRO and ACanPaste;
      Items[3].Enabled := not AFlagEmpty and not AFlagRO;
      Items[5].Enabled := not AFlagRO;
      Items[6].Enabled := not AFlagEmpty;
    end;
  end;
end;

procedure TcxCustomImage.ResetImage;
begin
  HScrollBar.Position := 0;
  VScrollBar.Position := 0;
  SynchronizeImage;
end;

procedure TcxCustomImage.SetPicture(Value: TPicture);
begin
  FPicture.Assign(Value);
end;

procedure TcxCustomImage.SetProperties(const Value: TcxImageProperties);
begin
  FProperties.Assign(Value);
end;

procedure TcxCustomImage.SynchronizeImage;
begin
  if not HandleAllocated then Exit;
  with TcxImageViewInfo(ViewInfo) do
  begin
    if HScrollBar.Visible then TopLeft.X := HScrollBar.Position else TopLeft.X := 0;
    if VScrollBar.Visible then TopLeft.Y := VScrollBar.Position else TopLeft.Y := 0;
  end;
  CalculateViewInfo(False);
  InvalidateRect(ViewInfo.ClientRect, False);
end;

{$IFNDEF DELPHI5}
procedure TcxCustomImage.WMRButtonUp(var Message: TWMRButtonUp);
var
  B: Boolean;
begin
  if PopupMenu <> nil then
    inherited
  else
  begin
    if not (csNoStdEvents in ControlStyle) then
      with Message do MouseUp(mbRight, KeysToShiftState(Keys), XPos, YPos);
    if Message.Result = 0 then
      DoContextPopup(SmallPointToPoint(Message.Pos), B);
  end;
end;
{$ENDIF}

function TcxCustomImage.CanAutoSize: Boolean;
begin
  Result := not IsPictureEmpty(Picture) or not IsDesigning;
end;

function TcxCustomImage.CanAutoWidth: Boolean;
begin
  Result := True;
end;

procedure TcxCustomImage.DoContextPopup({$IFNDEF VCL}const{$ENDIF} MousePos: TPoint;
  var Handled: Boolean);
var
  P: TPoint;
begin
  if (PopupMenu = nil) and (Properties.PopupMenuLayout.MenuItems <> []) then
  begin
    Handled := True;
    P := MousePos;
    if (P.X = -1) and (P.Y = -1) then
    begin
      P.X := 10;
      P.Y := 10;
    end;
    // Popup
    PreparePopup;
    P := ClientToScreen(P);
    FEditPopupMenu.Popup(P.X, P.Y);
  end
{$IFDEF DELPHI5}
  else
    inherited;
{$ENDIF}
end;

procedure TcxCustomImage.InitScrollBarsParameters;
begin
  if IsInplace or IsRectEmpty(ClientBounds) or AutoSize or Properties.Center or
    Properties.Stretch or IsPictureEmpty(Picture) then Exit;
  with ClientBounds do
  begin
    SetScrollBarInfo(sbHorizontal, 0, Picture.Width - 1, 8, Right - Left,
      TcxImageViewInfo(ViewInfo).TopLeft.X, True, True);
    SetScrollBarInfo(sbVertical, 0, Picture.Height - 1, 8, Bottom - Top,
      TcxImageViewInfo(ViewInfo).TopLeft.Y, True, True);
  end;
  SynchronizeImage;
end;

procedure TcxCustomImage.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited KeyDown(Key, Shift);
  KeyboardAction := True;
  try
    case Key of
      VK_INSERT:
        if ssShift in Shift then
          PasteFromClipBoard
        else
          if ssCtrl in Shift then CopyToClipBoard;
      VK_DELETE:
        if ssShift in Shift then CutToClipBoard;
    end;
  finally
    KeyboardAction := False;
  end;
end;

procedure TcxCustomImage.KeyPress(var Key: Char);
begin
  inherited KeyPress(Key);
  KeyboardAction := True;
  try
    case Key of
      ^X: CutToClipBoard;
      ^C: CopyToClipBoard;
      ^V: PasteFromClipBoard;
    end;
  finally
    KeyboardAction := False;
  end;
end;

{$IFNDEF VCL}
procedure TcxCustomImage.LookAndFeelChanged(Sender: TcxLookAndFeel;
  AChangedValues: TcxLookAndFeelValues);
begin
  if IsDestroying then Exit;
  inherited LookAndFeelChanged(Sender, AChangedValues);
  UpdateScrollbars;
end;
{$ENDIF}

function TcxCustomImage.NeedsScrollBars: Boolean;
begin
  Result := True;
end;

procedure TcxCustomImage.Scroll(AScrollBarKind: TScrollBarKind;
  AScrollCode: TScrollCode; var AScrollPos: Integer);
begin
  case AScrollCode of
   scLineUp:
     Dec(AScrollPos, 8);
   scLineDown:
     Inc(AScrollPos, 8);
  end;
  case AScrollBarKind of
    sbVertical:
      begin
        AScrollPos := MinInt(AScrollPos, Picture.Height - VScrollBar.PageSize);
        VScrollBar.Position := AScrollPos;
        AScrollPos := VScrollBar.Position;
      end;
    sbHorizontal:
      begin
        AScrollPos := MinInt(AScrollPos, Picture.Width - HScrollBar.PageSize);
        HScrollBar.Position := AScrollPos;
        AScrollPos := HScrollBar.Position;
      end;
  end;
  SynchronizeImage;
end;

function TcxCustomImage.GetEditValue: TcxEditValue;
var
  S: string;
begin
  if IsPictureEmpty(FPicture) then
    Result := Null
  else
  begin
    SavePicture(FPicture, S);
    Result := S;
  end;
end;

procedure TcxCustomImage.InternalSetEditValue(const Value: TcxEditValue; AIsValueValid: Boolean);
begin
  FInternalChanging := True;
  try
    if not VarIsNull(Value) and VarIsStr(Value) then
      LoadPicture(Picture, GetGraphicClass, Value)
    else
      Picture.Assign(nil);
  finally
    EditModified := False;
    FInternalChanging := False;
  end;
end;

procedure TcxCustomImage.PropertiesChanged(Sender: TObject);
begin
  if not PropertiesChangeLocked then
  begin
    PictureChanged(nil);
    UpdateScrollBars;
    inherited PropertiesChanged(Sender)
  end;
end;

procedure TcxCustomImage.UpdateScrollBars;
begin
  inherited UpdateScrollBars;
  SynchronizeImage;
end;

procedure TcxCustomImage.CustomClick;
begin
  if Assigned(Properties.OnCustomClick) then
    Properties.OnCustomClick(Self);
end;

function TcxCustomImage.GetGraphicClass: TGraphicClass;
begin
  Result := Properties.GraphicClass;
  if Result = nil then
    Result := GetGraphicClassByName(Properties.GraphicClassName);
end;

procedure TcxCustomImage.Clear;
begin
  if DoEditing then
    FPicture.Graphic := nil;
end;

procedure TcxCustomImage.CopyToClipboard;
begin
  if (FPicture <> nil) and (FPicture.Graphic <> nil) then
    Clipboard.Assign(FPicture);
end;

procedure TcxCustomImage.CutToClipboard;
begin
  CopyToClipboard;
  Clear;
end;

function TcxCustomImage.Focused: Boolean;
begin
  Result := FIsDialogShowed or inherited Focused;
end;

class function TcxCustomImage.GetPropertiesClass: TcxCustomEditPropertiesClass;
begin
  Result := TcxImageProperties;
end;

procedure TcxCustomImage.LoadFromFile;
var
  ADialog: {$IFDEF VCL}TOpenPictureDialog{$ELSE}TOpenDialog{$ENDIF};
  AGraphicClass: TGraphicClass;
begin
  if CanModify then
  begin
    ADialog := {$IFDEF VCL}TOpenPictureDialog{$ELSE}TOpenDialog{$ENDIF}.Create(nil);
    try
      with ADialog do
      begin
        if Properties.CustomFilter <> '' then
          Filter := Properties.CustomFilter
        else
        begin
          AGraphicClass := GetGraphicClass;
          if AGraphicClass <> nil then
            Filter := GraphicFilter(AGraphicClass)
          else
            Filter := GraphicFilter(TGraphic);
        end;
        FIsDialogShowed := True;
        try
          if Execute and DoEditing then
            FPicture.LoadFromFile(FileName);
        finally
          FIsDialogShowed := False;
        end;
      end;
    finally
      ADialog.Free;
    end;
  end;
end;

{$IFDEF USEJPEG}
type
  TJPEGImageAccess = class(TJPEGImage);
{$ENDIF}

procedure TcxCustomImage.PasteFromClipboard;
{$IFDEF USEJPEG}
var
  AGraphicClass: TGraphicClass;
  AGraphic: TJPEGImage;
{$ENDIF}
begin
{$IFDEF VCL}
  if Clipboard.HasFormat(FClipboardFormat{CF_PICTURE}) then
    if (FClipboardFormat = CF_PICTURE) and Clipboard.HasFormat(CF_BITMAP) then
{$ELSE}
  if Clipboard.Provides('image/delphi.picture') then
    if Clipboard.Provides('image/delphi.bitmap') then
{$ENDIF}
    begin
      if DoEditing then
      begin
      {$IFDEF USEJPEG}
        AGraphicClass := GetGraphicClass;
        if (AGraphicClass = TJPEGImage) then
        begin
          AGraphic := TJPEGImage.Create;
          try
            TJPEGImageAccess(AGraphic).NewBitmap;
            TJPEGImageAccess(AGraphic).Bitmap.Assign(Clipboard);
            AGraphic.JPEGNeeded;
            FPicture.Graphic := AGraphic;
          finally
            AGraphic.Free;
          end;
        end
        else
      {$ENDIF}
          FPicture.Bitmap.Assign(Clipboard);
      end
    end
    else
      if DoEditing then
        FPicture.Assign(Clipboard);
end;

procedure TcxCustomImage.SaveToFile;
var
  Dialog: {$IFDEF VCL}TSavePictureDialog{$ELSE}TSaveDialog{$ENDIF};
begin
  if (FPicture <> nil) and (FPicture.Graphic <> nil) then
  begin
    Dialog := {$IFDEF VCL}TSavePictureDialog{$ELSE}TSaveDialog{$ENDIF}.Create(Application);
    try
      with Dialog do
      begin
        if Properties.CustomFilter <> '' then
          Filter := Properties.CustomFilter
        else
          Filter := GraphicFilter(TGraphicClass(FPicture.Graphic.ClassType));
        DefaultExt := GraphicExtension(TGraphicClass(FPicture.Graphic.ClassType));
        FIsDialogShowed := True;
        try
          if Execute then
            FPicture.SaveToFile(FileName);
        finally
          FIsDialogShowed := False;
        end;
      end;
    finally
      Dialog.Free;
    end;
  end;
end;

{ TcxImageViewInfo }

destructor TcxImageViewInfo.Destroy;
begin
  if FFreePicture then
    Picture.Free;
  FTempBitmap.Free;
  inherited Destroy;
end;

procedure TcxImageViewInfo.InternalPaint(ACanvas: TcxCanvas);

  procedure FocusRect(ACanvas: TCanvas; R: TRect);
  begin
    with ACanvas, R do
    begin
      Brush.Color := clBlack;
      Brush.Style := bsSolid;
      FillRect(Rect(Left, Top, Left + 1, Bottom));
      FillRect(Rect(Right - 1, Top, Right, Bottom));
      FillRect(Rect(Left, Top, Right, Top + 1));
      FillRect(Rect(Left, Bottom - 1, Right, Bottom));
    end;
  end;

var
  CR, R, Temp: TRect;
  NeedDrawBkg: Boolean;
  SaveRgn: TcxRegion;
begin
  CR := ClientRect;
  with ACanvas do
  begin
    if not Assigned(Picture) or IsPictureEmpty(Picture) then
    begin
      inherited InternalPaint(ACanvas);
      Brush.Color := BackgroundColor;
      Brush.Style := bsClear;
      if Caption <> '' then
      begin
        Canvas.Font.Assign(Self.Font);
//        PrepareCanvasFont(Canvas.Font);
        ACanvas.DrawText(Caption, CR, cxAlignCenter + cxSingleLine, Enabled);
      end;
      if ShowFocusRect then FocusRect(Canvas, CR);
      Brush.Style := bsSolid;
      Exit;
    end;
    with CR do
    begin
      if Stretch then
      begin
        CalcStretchRect(CR, Picture.Width, Picture.Height, R);
        if Center then
        begin
          OffsetRect(R, (Right - Left - (R.Right - R.Left)) div 2, 0);
          OffsetRect(R, 0, (Bottom - Top - (R.Bottom - R.Top)) div 2);
        end;
      end
      else
      begin
        R := Rect(Left, Top, Left + Picture.Width, Top + Picture.Height);
        if Center then
        begin
          OffsetRect(R, (Right - Left - Picture.Width) div 2, 0);
          OffsetRect(R, 0, (Bottom - Top - Picture.Height) div 2);
        end
        else
          OffsetRect(R, -Self.TopLeft.X, -Self.TopLeft.Y);
      end;
    end;
    SaveRgn := GetClipRegion; // for native mode
    ExcludeClipRect(CR);
    DrawCustomEdit(ACanvas, Self, False, bpsSolid);
    SetClipRegion(SaveRgn, roSet);
    if not Self.Transparent and Picture.Graphic.Transparent then
    begin
      if FTempBitmap = nil then
      begin
        FTempBitmap := TBitmap.Create;
      {$IFDEF VCL}
        FTempBitmap.PixelFormat := pfDevice;
      {$ENDIF}
      end;
      with FTempBitmap do
      begin
        Width := Picture.Width;
        Height := Picture.Height;
        Canvas.Brush.Color := BackgroundColor;
        Canvas.FillRect(Rect(0, 0, Width, Height));
        Canvas.Draw(0, 0, Picture.Graphic);
      end;
    end;
    if ShowFocusRect then
    begin
      FocusRect(Canvas, CR);
      InflateRect(CR, -1, -1);
    end;
    SaveRgn := GetClipRegion;
    IntersectClipRect(CR);
    if ShowFocusRect then InflateRect(CR, 1, 1);
    if not Self.Transparent and Picture.Graphic.Transparent then
      Canvas.StretchDraw(R, FTempBitmap)
    else
      Canvas.StretchDraw(R, Picture.Graphic);
    NeedDrawBkg := not (IntersectRect(Temp, R, CR) and EqualRect(Temp, CR)) and not Self.Transparent;
    if NeedDrawBkg then
    begin
      ExcludeClipRect(R);
      Brush.Color := BackgroundColor;
      FillRect(CR);
    end;
    SetClipRegion(SaveRgn, roSet);
  end;
end;

{ TcxImageViewData }

procedure TcxImageViewData.Calculate(ACanvas: TcxCanvas;
  const ABounds: TRect; const P: TPoint; Button: TcxMouseButton;
  Shift: TShiftState; AViewInfo: TcxCustomEditViewInfo; AIsMouseEvent: Boolean);
begin
  inherited;
  if IsRectEmpty(ABounds) then Exit;
  with TcxImageViewInfo(AViewInfo) do
  begin
    Caption := TcxImageProperties(Properties).Caption;
    Center := TcxImageProperties(Properties).Center;
    Font := Style.Font; // use pointer on font
    ShowFocusRect := TcxImageProperties(Properties).ShowFocusRect and
      Focused and not IsInplace;
    Stretch := TcxImageProperties(Properties).Stretch;
    if Center or Stretch then TopLeft := Point(0, 0);
  end;
end;

// called from grid
procedure TcxImageViewData.EditValueToDrawValue(ACanvas: TcxCanvas;
  const AEditValue: TcxEditValue; AViewInfo: TcxCustomEditViewInfo);
var
  AGraphicClass: TGraphicClass;
begin
  with TcxImageProperties(Properties) do
  begin
    AGraphicClass := GraphicClass;
    if (AGraphicClass = nil) and IsDesigning then
    begin
      with TcxImageViewInfo(AViewInfo) do
        if Assigned(Picture) then Picture.Assign(nil);
      Exit;
    end;
  end;
  with TcxImageViewInfo(AViewInfo) do
  begin
    if not VarIsNull(AEditValue) and VarIsStr(AEditValue) then
    begin
      if not Assigned(Picture) then
      begin
        Picture := TPicture.Create;
        FFreePicture := True;
      end;
      LoadPicture(Picture, AGraphicClass, AEditValue);
      if TcxImageProperties(Properties).GraphicTransparency <> gtDefault then
        Picture.Graphic.Transparent :=
          TcxImageProperties(Properties).GraphicTransparency = gtTransparent;
    end
    else
      if Assigned(Picture) then Picture.Assign(nil);
  end;
end;

function TcxImageViewData.GetEditContentSize(ACanvas: TcxCanvas;
  const AEditValue: TcxEditValue;
  const AEditSizeProperties: TcxEditSizeProperties): TSize;
var
  APicture: TPicture;
  AGraphicClass: TGraphicClass;
  S: string;
begin
  with TcxImageProperties(Properties) do
    if Self.IsInplace then
    begin
      Result := Size(0, DefaultHeight);
      if not VarIsNull(AEditValue) and VarIsStr(AEditValue) then
      begin
        AGraphicClass := GraphicClass;
        if (AGraphicClass = nil) and IsDesigning then Exit;
        APicture := TPicture.Create;
        try
          S := AEditValue;
          LoadPicture(APicture, AGraphicClass, S);
          Result := Size(APicture.Width, APicture.Height);
        finally
          APicture.Free;
        end;
        if Stretch and (AEditSizeProperties.Width > 0) and (Result.cx > 0) then
          Result := Size(AEditSizeProperties.Width, Round(Result.cy * AEditSizeProperties.Width / Result.cx));
      end
      else
        if Length(Caption) <> 0 then Result := ACanvas.TextExtent(Caption);
    end
    else
      if Self.Edit <> nil then
        with TcxCustomImage(Self.Edit) do
          Result := Size(Picture.Width, Picture.Height)
      else
        Result := Size(0, 0);
end;

procedure LoadPopupMenuImages;
var
  Bmp: TBitmap;
begin
  Bmp := TBitmap.Create;
  try
    //pmiCut, pmiCopy, pmiPaste, pmiDelete, pmiLoad, pmiSave
    Bmp.LoadFromResourceName(HInstance, 'CXMENUIMAGE_CUT');
    if cxGraphicPopupMenuImages = nil then
      cxGraphicPopupMenuImages := TImageList.CreateSize(Bmp.Width, Bmp.Height);
    cxGraphicPopupMenuImages.AddMasked(Bmp, clDefault);
    Bmp.LoadFromResourceName(HInstance, 'CXMENUIMAGE_COPY');
    cxGraphicPopupMenuImages.AddMasked(Bmp, clDefault);
    Bmp.LoadFromResourceName(HInstance, 'CXMENUIMAGE_PASTE');
    cxGraphicPopupMenuImages.AddMasked(Bmp, clDefault);
    Bmp.LoadFromResourceName(HInstance, 'CXMENUIMAGE_DELETE');
    cxGraphicPopupMenuImages.AddMasked(Bmp, clDefault);
    Bmp.LoadFromResourceName(HInstance, 'CXMENUIMAGE_LOAD');
    cxGraphicPopupMenuImages.AddMasked(Bmp, clDefault);
    Bmp.LoadFromResourceName(HInstance, 'CXMENUIMAGE_SAVE');
    cxGraphicPopupMenuImages.AddMasked(Bmp, clDefault);
  finally
    Bmp.Free;
  end;
end;

initialization
  LoadPopupMenuImages;
  GetRegisteredEditProperties.Register(TcxImageProperties, scxSEditRepositoryImageItem);

finalization
  FreeAndNil(cxRegisteredGraphicClasses);
  FreeAndNil(cxGraphicPopupMenuImages);

end.
