
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

unit cxBlobEdit;

{$I cxEdVer.inc}

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
  SysUtils, Classes, Graphics, Controls, Forms, ExtCtrls,
  Dialogs, StdCtrls, ImgList, Clipbrd,
  cxGraphics, cxControls, cxContainer, cxEdit, cxDropDownEdit, cxEditConsts,
  cxTextEdit, cxButtons, cxImage, cxMemo, cxDataUtils, cxClasses;

const
  cxIdentityTextLength = 80;

type
  TcxBlobPaintStyle = (bpsDefault, bpsIcon, bpsText);
  TcxBlobEditKind = (bekAuto, bekMemo, bekPict, bekOle, bekBlob);

  { TcxBlobEditViewData }

  TcxBlobEditViewData = class(TcxCustomDropDownEditViewData)
  public
    procedure Calculate(ACanvas: TcxCanvas; const ABounds: TRect; const P: TPoint;
      Button: TcxMouseButton; Shift: TShiftState;
      AViewInfo: TcxCustomEditViewInfo; AIsMouseEvent: Boolean); override;
    function GetEditContentSize(ACanvas: TcxCanvas;
      const AEditValue: TcxEditValue;
      const AEditSizeProperties: TcxEditSizeProperties): TSize; override;
    procedure EditValueToDrawValue(ACanvas: TcxCanvas; const AEditValue: TcxEditValue;
      AViewInfo: TcxCustomEditViewInfo); override;
  end;

  { TcxBlobEditViewInfo }

  TcxBlobEditViewInfo = class(TcxCustomTextEditViewInfo)
  protected
    procedure InternalPaint(ACanvas: TcxCanvas); override;
  public
    IconRect: TRect;
    ImageIndex: TImageIndex;
    function NeedShowHint(ACanvas: TcxCanvas; const P: TPoint; out AText: TCaption;
      out AIsMultiLine: Boolean; out ATextRect: TRect): Boolean; override;
    procedure Offset(DX, DY: Integer); override;
  end;

  { TcxCustomBlobEditProperties }

  TcxCustomBlobEditProperties = class(TcxCustomPopupEditProperties)
  private
    // common
    FAlwaysSaveData: Boolean;
    FBlobEditKind: TcxBlobEditKind;
    FBlobPaintStyle: TcxBlobPaintStyle;
    // memo
    FMemoAutoReplace: Boolean;
    FMemoWantReturns: Boolean;
    FMemoWantTabs: Boolean;
  {$IFDEF VCL}
    FMemoOEMConvert: Boolean;
  {$ENDIF}
    FMemoWordWrap: Boolean;
    FMemoMaxLength: Integer;
    FMemoCharCase: TEditCharCase;
    FMemoScrollBars: TScrollStyle;
    // picture
    FPictureAutoSize: Boolean;
    FPictureClipboardFormat: Word;
    FPictureFilter: string;
    FPictureGraphicClass: TGraphicClass;
    FPictureGraphicClassName: string;
    FPictureTransparency: TcxImageTransparency;
    FShowExPopupItems: Boolean;
    FShowPicturePopup: Boolean;

    FOnAssignPicture: TcxImageAssignPictureEvent;
//    FOnGetGraphicClass: TcxImageGraphicClassEvent;
    procedure SetBlobEditKind(const Value: TcxBlobEditKind);
    procedure SetBlobPaintStyle(const Value: TcxBlobPaintStyle);
  protected
    function DropDownOnClick: Boolean; override;
    function GetDisplayFormatOptions: TcxEditDisplayFormatOptions; override;
    class function GetPopupWindowClass: TcxCustomEditPopupWindowClass; override;
    function HasDisplayValue: Boolean; override;
    procedure CorrectBlobEditKind;
    property PopupSysPanelStyle;
    // Common
    property AlwaysSaveData: Boolean
      read FAlwaysSaveData write FAlwaysSaveData default True;
    property BlobEditKind: TcxBlobEditKind
      read FBlobEditKind write SetBlobEditKind default bekAuto;
    property BlobPaintStyle: TcxBlobPaintStyle
      read FBlobPaintStyle write SetBlobPaintStyle default bpsIcon;
    property ImmediatePopup default True;
    // Memo
    property MemoAutoReplace: Boolean
      read FMemoAutoReplace write FMemoAutoReplace default False;
    property MemoCharCase: TEditCharCase
      read FMemoCharCase write FMemoCharCase default ecNormal;
    property MemoMaxLength: Integer
      read FMemoMaxLength write FMemoMaxLength default 0;
  {$IFDEF VCL}
    property MemoOEMConvert: Boolean
      read FMemoOEMConvert write FMemoOEMConvert default False;
  {$ENDIF}
    property MemoScrollBars: TScrollStyle
      read FMemoScrollBars write FMemoScrollBars default ssNone;
    property MemoWantReturns: Boolean
      read FMemoWantReturns write FMemoWantReturns default True;
    property MemoWantTabs: Boolean
      read FMemoWantTabs write FMemoWantTabs default True;
    property MemoWordWrap: Boolean
      read FMemoWordWrap write FMemoWordWrap default True;
    // Picture
    property PictureAutoSize: Boolean
      read FPictureAutoSize write FPictureAutoSize default True;
    property PictureClipboardFormat: Word
      read FPictureClipboardFormat write FPictureClipboardFormat;
    property PictureGraphicClass: TGraphicClass
      read FPictureGraphicClass write FPictureGraphicClass;
    property PictureGraphicClassName: string
      read FPictureGraphicClassName write FPictureGraphicClassName;
    property PictureFilter: string
      read FPictureFilter write FPictureFilter;
    property PictureTransparency: TcxImageTransparency
      read FPictureTransparency write FPictureTransparency default gtDefault;
    property ShowExPopupItems: Boolean
      read FShowExPopupItems write FShowExPopupItems default True;
    property ShowPicturePopup: Boolean
      read FShowPicturePopup write FShowPicturePopup default True;

    property OnAssignPicture: TcxImageAssignPictureEvent
      read FOnAssignPicture write FOnAssignPicture;
//    property OnGetGraphicClass: TcxImageGraphicClassEvent
//      read FOnGetGraphicClass write FOnGetGraphicClass;
  public
    constructor Create(AOwner: TPersistent); override;
    procedure Assign(Source: TPersistent); override;
    class function GetContainerClass: TcxContainerClass; override;
    function GetDisplayText(const AEditValue: TcxEditValue;
      AFullText: Boolean = False): WideString; override;
    function GetEditValueSource(AEditFocused: Boolean): TcxDataEditValueSource; override;
    function GetSupportedOperations: TcxEditSupportedOperations; override;
    class function GetViewDataClass: TcxCustomEditViewDataClass; override;
    class function GetViewInfoClass: TcxContainerViewInfoClass; override;
    function IsEditValueValid(var AEditValue: TcxEditValue; AEditFocused: Boolean): Boolean; override;
  end;

  { TcxBlobEditProperties }

  TcxBlobEditProperties = class(TcxCustomBlobEditProperties)
  public
    property PictureGraphicClass;
  published
    // Common
    property AlwaysSaveData;
    property BlobEditKind;
    property BlobPaintStyle;
    property ImmediatePopup;
    property ImmediatePost;
    // Memo
    property MemoAutoReplace;
    property MemoCharCase;
    property MemoMaxLength;
{$IFDEF VCL}
    property MemoOEMConvert;
{$ENDIF}
    property MemoScrollBars;
    property MemoWantReturns;
    property MemoWantTabs;
    property MemoWordWrap;
    // Picture
    property PictureAutoSize;
    property PictureFilter;
    property PictureGraphicClassName;
    property PictureTransparency;
    property PopupHeight;
    property PopupWidth;
    property ShowExPopupItems;
    property ShowPicturePopup;

    property ReadOnly;
    property OnAssignPicture;
    property OnButtonClick;
    property OnChange;
    property OnCloseQuery;
    property OnCloseUp;
//    property OnGetGraphicClass;
    property OnEditValueChanged;
    property OnInitPopup;
    property OnPopup;
    property OnValidate;
  end;

  { TcxCustomBlobEdit }

  TcxCustomBlobEdit = class(TcxCustomPopupEdit)
  private
    FButtonWidth: Integer;
    FCancelButton: TcxButton;
    FGraphicClass: TGraphicClass;
    FOkButton: TcxButton;
//    FSaveKey: Char;
    FStorage: TcxCustomEdit;
    function GetProperties: TcxBlobEditProperties;
    procedure InternalChanged(Sender: TObject);
    procedure SetProperties(Value: TcxBlobEditProperties);
  protected
    function GetText: TCaption; {$IFNDEF VCL} override; {$ENDIF}
    procedure SetText(const Value: TCaption); {$IFNDEF VCL} override; {$ENDIF}

    procedure ColorChanged; override;
    procedure CreatePopupControls; virtual;
    procedure DoEditKeyPress(var Key: Char); override;
    function GetPopupFocusedControl: TWinControl; override;
    function GetPopupWindowClientPreferredSize: TSize; override;
    procedure FontChanged; override;
    procedure DestroyPopupControls; virtual;
    procedure DoInitPopup; override;
    function IsEditClass: Boolean; override;
    procedure PopupWindowClosed(Sender: TObject); override;
    procedure PropertiesChanged(Sender: TObject); override;
    procedure SetupPopupWindow; override;
    procedure StorageEditingHandler(Sender: TObject; var CanEdit: Boolean); virtual;
    procedure SynchronizeDisplayValue; override;
    procedure SynchronizeEditValue; override;
    property Properties: TcxBlobEditProperties
      read GetProperties write SetProperties;
    property TabStop default True;
    property Text: TCaption read GetText write SetText;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    class function GetPropertiesClass: TcxCustomEditPropertiesClass; override;
  end;

  { TcxBlobEdit }

  TcxBlobEdit = class(TcxCustomBlobEdit)
  published
    property Anchors;
    property AutoSize;
    property BeepOnEnter;
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
    property Text;
    property Visible;
    property OnClick;
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
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
  {$IFDEF VCL}
    property BiDiMode;
    property ParentBiDiMode;
    property OnEndDock;
    property OnStartDock;
  {$ENDIF}
  end;

  { TcxBlobEditPopupWindow }

  TcxBlobEditPopupWindow = class(TcxPopupEditPopupWindow)
  protected
    procedure DoPopupControlKey(Key: Char); override;
  end;

function GetBlobText(const Value: TcxEditValue;
  AProperties: TcxCustomBlobEditProperties; AFullText: Boolean): string;

var
  imgBlobImages: TImageList = nil;

implementation

uses
{$IFDEF DELPHI6}
  Variants,
{$ELSE}
  cxVariants,
{$ENDIF}
  cxEditUtils, cxEditTextUtils;

const
  cxbmBlobNull = 'CXBMBLOB_BLOB_NULL';
  cxbmBlob     = 'CXBMBLOB_BLOB';
  cxbmMemoNull = 'CXBMBLOB_MEMO_NULL';
  cxbmMemo     = 'CXBMBLOB_MEMO';
  cxbmPictNull = 'CXBMBLOB_PICT_NULL';
  cxbmPict     = 'CXBMBLOB_PICT';
  cxbmOleNull  = 'CXBMBLOB_OLE_NULL';
  cxbmOle      = 'CXBMBLOB_OLE';

type
  TcxCustomEditStyleAccess = class(TcxCustomEditStyle);
  TcxMemoAccess = class(TcxMemo);

function GetBlobText(const Value: TcxEditValue;
  AProperties: TcxCustomBlobEditProperties; AFullText: Boolean): string;
var
  I: Integer;
begin
  with AProperties do
  begin
    Result := '';
    if AFullText and (BlobEditKind = bekMemo) and VarIsStr(Value) then
      Result := Value
    else if BlobPaintStyle = bpsDefault then
      case BlobEditKind of
        bekMemo:
          if not VarIsNull(Value) then
            Result := cxGetResourceString(@cxSBlobMemo)
          else
            Result := cxGetResourceString(@cxSBlobMemoEmpty);
        bekPict:
          if not VarIsNull(Value) then
            Result := cxGetResourceString(@cxSBlobPicture)
          else
            Result := cxGetResourceString(@cxSBlobPictureEmpty);
      end
    else
      if (BlobPaintStyle = bpsText) and (BlobEditKind = bekMemo) and VarIsStr(Value) then
      begin
        Result := Copy(TrimLeft(Value), 1, cxIdentityTextLength);
        for I := 1 to Length(Result) do
          if Result[I] < ' ' then Result[I] := ' ';
      end;
  end;
end;

{ TcxBlobEditViewData }

procedure TcxBlobEditViewData.Calculate(ACanvas: TcxCanvas;
  const ABounds: TRect; const P: TPoint; Button: TcxMouseButton;
  Shift: TShiftState; AViewInfo: TcxCustomEditViewInfo; AIsMouseEvent: Boolean);
begin
  inherited Calculate(ACanvas, ABounds, P, Button, Shift, AViewInfo,
    AIsMouseEvent);
  with AViewInfo.ClientRect do
    TcxBlobEditViewInfo(AViewInfo).IconRect.TopLeft :=
      Point(Left + (Right - Left - imgBlobImages.Width) div 2,
      Top + (Bottom - Top - imgBlobImages.Height) div 2);
  with TcxBlobEditViewInfo(AViewInfo).IconRect do
  begin
    Right := Left + imgBlobImages.Width;
    Bottom := Top + imgBlobImages.Height;
  end;
  if Edit <> nil then
    EditValueToDrawValue(ACanvas, Edit.EditValue, AViewInfo);
end;

function TcxBlobEditViewData.GetEditContentSize(ACanvas: TcxCanvas;
  const AEditValue: TcxEditValue;
  const AEditSizeProperties: TcxEditSizeProperties): TSize;
begin
  with TcxBlobEditProperties(Properties) do
  begin
    Result := inherited GetEditContentSize(ACanvas, GetBlobText(AEditValue,
      TcxBlobEditProperties(Properties), False), AEditSizeProperties);
    if (BlobPaintStyle = bpsIcon) then Inc(Result.cx, imgBlobImages.Width);
  end;
end;

procedure TcxBlobEditViewData.EditValueToDrawValue(ACanvas: TcxCanvas;
  const AEditValue: TcxEditValue; AViewInfo: TcxCustomEditViewInfo);
begin
  with TcxBlobEditProperties(Properties), TcxBlobEditViewInfo(AViewInfo) do
  begin
    CorrectBlobEditKind;
    if BlobPaintStyle = bpsIcon then
    begin
      Text := '';
      case BlobEditKind of
        bekMemo: ImageIndex := 2;
        bekPict: ImageIndex := 4;
        bekOle: ImageIndex := 6;
        bekBlob: ImageIndex := 0;
      end;
      if not VarIsNull(AEditValue) then
        Inc(TcxBlobEditViewInfo(AViewInfo).ImageIndex);
    end
    else
    begin
      Text := GetBlobText(AEditValue, TcxBlobEditProperties(Properties), False);
      ImageIndex := -1;
    end;
  end;
end;

{ TcxBlobEditViewInfo }

function TcxBlobEditViewInfo.NeedShowHint(ACanvas: TcxCanvas; const P: TPoint;
  out AText: TCaption; out AIsMultiLine: Boolean; out ATextRect: TRect): Boolean;
begin
  Result := False;
end;

procedure TcxBlobEditViewInfo.Offset(DX, DY: Integer);
begin
  inherited Offset(DX, DY);
  OffsetRect(IconRect, DX, DY);
end;

procedure TcxBlobEditViewInfo.InternalPaint(ACanvas: TcxCanvas);
var
  AClipRgn, APrevClipRgn: TcxRegion;
  R: TRect;
begin
  if not RectVisible(ACanvas.Handle, Bounds) then
    Exit;

  with ACanvas do
  begin
    if (ImageIndex = -1) and (Text <> '') then
    begin
      DrawCustomEdit(ACanvas, Self, True, bpsComboListEdit);
      Brush.Style := bsClear;
      if not Enabled then
      begin
        OffsetRect(TextRect, 1, 1);
        Font.Color := clBtnHighlight;
        cxTextOut(Canvas, PcxCaptionChar(Text), TextRect, CXTO_END_ELLIPSIS or
          CXTO_CENTER_VERTICALLY or CXTO_SINGLELINE);
        OffsetRect(TextRect, -1, -1);
      end;
      Font.Color := TextColor;
      cxTextOut(Canvas, PcxCaptionChar(Text), TextRect, CXTO_END_ELLIPSIS or
        CXTO_CENTER_VERTICALLY or CXTO_SINGLELINE);
      Brush.Style := bsSolid;
    end
    else
    begin
      if Assigned(imgBlobImages) and (ImageIndex <> -1) then
      begin
        APrevClipRgn := ACanvas.GetClipRegion;
        IntersectRect(R, IconRect, ClientRect);
        AClipRgn := TcxRegion.Create(R);
        ACanvas.SetClipRegion(AClipRgn, roIntersect);
        try
          if Transparent then
            imgBlobImages.Draw(Canvas, IconRect.Left, IconRect.Top, ImageIndex,
              {$IFNDEF VCL}itImage,{$ENDIF} Enabled)
            else
              {$IFDEF VCL}cxEditUtils{$ELSE}QcxEditUtils{$ENDIF}.DrawGlyph(ACanvas,
                imgBlobImages, ImageIndex, IconRect, BackgroundColor, Enabled);
        finally
          ACanvas.SetClipRegion(APrevClipRgn, roSet);
        end;
        if not Transparent then
          ACanvas.ExcludeClipRect(R);
      end;
      DrawCustomEdit(ACanvas, Self, True, bpsComboListEdit);
    end;
    if Focused and not IsInplace and not HasPopupWindow then
    begin
      R := ClientRect;
      InflateRect(R, -1, -1);
      Font.Color := clWhite;
      Brush.Color := clBlack;
      DrawFocusRect(R);
    end;
  end;
end;

{ TcxCustomBlobEditProperties }

constructor TcxCustomBlobEditProperties.Create(AOwner: TPersistent);
begin
  inherited Create(AOwner);
  ImmediatePopup := True;
  PopupMinWidth := 160;
  PopupMinHeight := 140;
  FAlwaysSaveData := True;
  FBlobEditKind := bekAuto;
  FBlobPaintStyle := bpsIcon;
  // Memo
  FMemoCharCase := ecNormal;
  FMemoMaxLength := 0;
{$IFDEF VCL}
  FMemoOEMConvert := False;
{$ENDIF}
  FMemoScrollBars := ssNone;
  FMemoWantReturns := True;
  FMemoWantTabs := True;
  FMemoWordWrap := True;
  // Picture
  FPictureAutoSize := True;
{$IFDEF VCL}
  FPictureClipboardFormat := CF_PICTURE;
{$ENDIF}
  FPictureTransparency := gtDefault;
  FShowExPopupItems := True;
  FShowPicturePopup := True;
end;

procedure TcxCustomBlobEditProperties.SetBlobEditKind(
  const Value: TcxBlobEditKind);
begin
  if FBlobEditKind <> Value then
  begin
    FBlobEditKind := Value;
    if Value in [bekPict, bekMemo] then
    begin
      Buttons[0].Kind := bkDown;
      if (Value = bekPict) and not (GetOwner is TcxCustomEdit) then
        FPictureGraphicClassName := 'TBitmap';
    end
    else
      Buttons[0].Kind := bkEllipsis;
    Changed;
  end;
end;

procedure TcxCustomBlobEditProperties.SetBlobPaintStyle(
  const Value: TcxBlobPaintStyle);
begin
  if FBlobPaintStyle <> Value then
  begin
    FBlobPaintStyle := Value;
    Changed;
  end;
end;

function TcxCustomBlobEditProperties.DropDownOnClick: Boolean;
begin
  Result := True;
end;

function TcxCustomBlobEditProperties.GetDisplayFormatOptions: TcxEditDisplayFormatOptions;
begin
  Result := [];
end;

class function TcxCustomBlobEditProperties.GetPopupWindowClass: TcxCustomEditPopupWindowClass;
begin
  Result := TcxBlobEditPopupWindow;
end;

function TcxCustomBlobEditProperties.HasDisplayValue: Boolean;
begin
  Result := False;
end;

procedure TcxCustomBlobEditProperties.CorrectBlobEditKind;
const
  ABlobEditKindCorrectionA: array[TcxBlobKind] of TcxBlobEditKind =
    (bekBlob, bekBlob, bekPict, bekMemo, bekOle);
begin
  if BlobEditKind = bekAuto then
  begin
    LockUpdate(True);
    try
      if IDefaultValuesProvider <> nil then
        BlobEditKind := ABlobEditKindCorrectionA[IDefaultValuesProvider.DefaultBlobKind]
      else
        BlobEditKind := bekBlob;
    finally
      LockUpdate(False);
    end;
  end;
end;

procedure TcxCustomBlobEditProperties.Assign(Source: TPersistent);
begin
  if Source is TcxCustomBlobEditProperties then
  begin
    BeginUpdate;
    try
      inherited Assign(Source);
      with TcxCustomBlobEditProperties(Source) do
      begin
        // Common
        Self.AlwaysSaveData := AlwaysSaveData;
        Self.BlobEditKind := BlobEditKind;
        Self.BlobPaintStyle := BlobPaintStyle;
        // Memo
        Self.MemoAutoReplace := MemoAutoReplace;
        Self.MemoCharCase := MemoCharCase;
        Self.MemoMaxLength := MemoMaxLength;
  {$IFDEF VCL}
        Self.MemoOEMConvert := MemoOEMConvert;
  {$ENDIF}
        Self.MemoScrollBars := MemoScrollBars;
        Self.MemoWantReturns := MemoWantReturns;
        Self.MemoWantTabs := MemoWantTabs;
        Self.MemoWordWrap := MemoWordWrap;
        // Picture
        Self.PictureAutoSize := PictureAutoSize;
        Self.PictureFilter := PictureFilter;
        Self.PictureGraphicClassName := PictureGraphicClassName;
        if (PictureGraphicClassName = '') and (PictureGraphicClass <> nil) then
          Self.PictureGraphicClass := PictureGraphicClass;
        Self.PictureTransparency := PictureTransparency;
        Self.ShowExPopupItems := ShowExPopupItems;
        Self.ShowPicturePopup := ShowPicturePopup;
        Self.OnAssignPicture := OnAssignPicture;
  //      Self.OnGetGraphicClass := OnGetGraphicClass;
      end;
    finally
      EndUpdate
    end
  end  
  else
    inherited Assign(Source);
end;

class function TcxCustomBlobEditProperties.GetContainerClass: TcxContainerClass;
begin
  Result := TcxCustomBlobEdit;
end;

function TcxCustomBlobEditProperties.GetDisplayText(
  const AEditValue: TcxEditValue; AFullText: Boolean = False): WideString;
begin
  Result := '';
  if not VarIsNull(AEditValue) then
    case BlobEditKind of
      bekMemo:
        Result := GetBlobText(AEditValue, Self, AFullText);
      bekPict:
        Result := cxGetResourceString(@cxSBlobPicture);
      bekOle:
        Result := 'OLE';
      bekBlob:
        Result := 'BLOB';
    end;
end;

function TcxCustomBlobEditProperties.GetEditValueSource(AEditFocused: Boolean): TcxDataEditValueSource;
begin
  CorrectBlobEditKind;
  if BlobEditKind = bekMemo then
    if (IDefaultValuesProvider <> nil) and IDefaultValuesProvider.IsBlob then
      Result := evsValue
    else
      Result := evsText
  else
    Result := evsValue;
end;

function TcxCustomBlobEditProperties.GetSupportedOperations: TcxEditSupportedOperations;
begin
  if Buttons.Count > 0 then
    Result := [esoHotTrack]
  else
    Result := [];
end;

class function TcxCustomBlobEditProperties.GetViewDataClass: TcxCustomEditViewDataClass;
begin
  Result := TcxBlobEditViewData;
end;

class function TcxCustomBlobEditProperties.GetViewInfoClass: TcxContainerViewInfoClass;
begin
  Result := TcxBlobEditViewInfo;
end;

function TcxCustomBlobEditProperties.IsEditValueValid(
  var AEditValue: TcxEditValue; AEditFocused: Boolean): Boolean;
begin
  Result := True;
end;

type
  { TcxPopupMemo }

  TcxPopupMemo = class(TcxMemo)
  private
    FBlobEdit: TcxCustomBlobEdit;
  protected
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  end;

  { TcxPopupImage }

  TcxPopupImage = class(TcxImage)
  private
    FBlobEdit: TcxCustomBlobEdit;
  protected
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  end;

function KeyDownToModalResult(var Key: Word; Shift: TShiftState;
  AReturnClosed, AAlwaysSaveData: Boolean): TModalResult;
begin
  Result := mrNone;
{$IFDEF VCL}
  if ((Key = VK_F4) and not (ssAlt in Shift)) or (Key = VK_ESCAPE) or
    ((Key in [VK_UP, VK_DOWN]) and (ssAlt in Shift)) then
{$ELSE}
  if (Key = Key_F4) or (Key = Key_Escape) or
    (((Key = Key_Up) or (Key = Key_Down)) and (ssAlt in Shift)) then
{$ENDIF}
    if AAlwaysSaveData and not (Key = VK_ESCAPE) then
      Result := mrOk
    else
      Result := mrCancel
  else
    if (TranslateKey(Key) = VK_RETURN) and (AReturnClosed or (ssCtrl in Shift)) then
      Result := mrOk;
  if Result <> mrNone then Key := 0;
end;

{ TcxPopupMemo }

procedure TcxPopupMemo.KeyDown(var Key: Word; Shift: TShiftState);
begin
  TcxCustomEditPopupWindow(Parent).ModalResult :=
    KeyDownToModalResult(Key, Shift, not Properties.WantReturns,
      FBlobEdit.Properties.AlwaysSaveData);
  inherited KeyDown(Key, Shift);
end;

{ TcxPopupImage }

procedure TcxPopupImage.KeyDown(var Key: Word; Shift: TShiftState);
begin
  TcxCustomEditPopupWindow(Parent).ModalResult :=
    KeyDownToModalResult(Key, Shift, True,
      FBlobEdit.Properties.AlwaysSaveData);
  inherited KeyDown(Key, Shift);
end;

{ TcxCustomBlobEdit }

constructor TcxCustomBlobEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle - [csSetCaption];
  TabStop := True;
end;

destructor TcxCustomBlobEdit.Destroy;
begin
  DestroyPopupControls;
  inherited Destroy;
end;

function TcxCustomBlobEdit.GetProperties: TcxBlobEditProperties;
begin
  Result := TcxBlobEditProperties(InternalGetProperties);
end;

function TcxCustomBlobEdit.GetText: TCaption;
begin
  Result := '';
  if (Properties.BlobEditKind = bekMemo) then
    if (FStorage <> nil) then
      Result := TcxMemo(FStorage).Lines.Text
    else
      if not VarIsNull(EditValue) and VarIsStr(EditValue) then
        Result := EditValue;
end;

procedure TcxCustomBlobEdit.SetText(const Value: TCaption);
begin
  if (Properties.BlobEditKind = bekMemo) then
    EditValue := Value;
end;

procedure TcxCustomBlobEdit.InternalChanged(Sender: TObject);
begin
  if FOkButton <> nil then
  begin
    FOkButton.Enabled := True(*FStorage.ModifiedAfterEnter*);
    FOkButton.Default := FOkButton.Enabled;
  end;
end;

procedure TcxCustomBlobEdit.SetProperties(Value: TcxBlobEditProperties);
begin
  FProperties.Assign(Value);
end;

procedure TcxCustomBlobEdit.ColorChanged;
begin
  inherited ColorChanged;
  if not IsDestroying and HasPopupWindow and (FStorage is TcxPopupMemo) then
    TcxPopupMemo(FStorage).Style.Color := Style.Color;
end;

type
  TcxCustomEditPopupWindowAccess = class(TcxCustomEditPopupWindow);

procedure TcxCustomBlobEdit.CreatePopupControls;
var
  W: Integer;
{$IFNDEF VCL}
  AScrollBarSize: TSize;
{$ENDIF}
begin
  case Properties.BlobEditKind of
    bekPict:
      begin
        if FStorage = nil then
        begin
          FStorage := TcxPopupImage.Create(nil);
          FStorage.OnEditing := StorageEditingHandler;
        end;
        with TcxPopupImage(FStorage) do
        begin
          Parent := PopupWindow;
          FBlobEdit := Self;
          Style.BorderStyle := ebsNone;
          with Properties do
          begin
            ShowFocusRect := False;
            Stretch := True;
            CustomFilter := Self.Properties.PictureFilter;
            GraphicTransparency := Self.Properties.PictureTransparency;
            if not Self.Properties.ShowPicturePopup then
              PopupMenuLayout.MenuItems := []
            else
              if not Self.Properties.ShowExPopupItems then
                PopupMenuLayout.MenuItems := PopupMenuLayout.MenuItems - [pmiSave, pmiLoad];

            ReadOnly := Self.Properties.ReadOnly;
            GraphicClassName := Self.Properties.PictureGraphicClassName;
            if (GraphicClassName = '') and (Self.Properties.PictureGraphicClass <> nil) then
              GraphicClass := Self.Properties.PictureGraphicClass;
            OnAssignPicture := Self.Properties.OnAssignPicture;
          //OnGetGraphicClass := Self.Properties.OnGetGraphicClass;
          end;
          Self.Properties.PopupControl := FStorage;
          Self.Properties.PopupSysPanelStyle := True;
          LoadPicture(Picture, GetGraphicClass, Self.EditValue);
          EditModified := False;
          Style.LookAndFeel.MasterLookAndFeel := Self.LookAndFeel;
          Properties.OnChange := InternalChanged;
        end;
        with Properties do
          PopupAutoSize := PictureAutoSize;
      end;
    bekMemo:
      begin
        if FStorage = nil then
        begin
          FStorage := TcxPopupMemo.Create(nil);
          FStorage.OnEditing := StorageEditingHandler;
        end;
        with TcxPopupMemo(FStorage) do
        begin
          Parent := PopupWindow;
          FBlobEdit := Self;
          Style.BorderStyle := ebsNone;
          with Properties do
          begin
            CharCase := Self.Properties.MemoCharCase;
            MaxLength := Self.Properties.MemoMaxLength;
          {$IFDEF VCL}
            OEMConvert := Self.Properties.MemoOEMConvert;
          {$ENDIF}
            ScrollBars := Self.Properties.MemoScrollBars;
            WantReturns := Self.Properties.MemoWantReturns;
            WantTabs := Self.Properties.MemoWantTabs;
            WordWrap := Self.Properties.MemoWordWrap;
            ReadOnly := Self.Properties.ReadOnly;
          end;
          Self.Properties.PopupSysPanelStyle := True;
          Self.Properties.PopupAutoSize := False;
          Self.Properties.PopupControl := FStorage;
            EditValue := Self.EditValue;
          Style.LookAndFeel.MasterLookAndFeel := Self.LookAndFeel;
          Style.Font.Assign(Self.Style.Font);
          Style.Color := Self.Style.Color;
          Properties.OnChange := InternalChanged;
        end;
      end;
  end;
  if Properties.BlobEditKind in [bekPict, bekMemo] then
  begin
    if FCancelButton = nil then
      FCancelButton := TcxButton.Create(nil);
    with FCancelButton do
    begin
      Parent := PopupWindow;
      UseSystemPaint := False;
      if Properties.ReadOnly then
        Caption := cxGetResourceString(@cxSBlobButtonClose)
      else
        Caption := cxGetResourceString(@cxSBlobButtonCancel);
      Cancel := True;
      ModalResult := mrCancel;
      Font.Assign(Self.Style.Font);
      LookAndFeel.MasterLookAndFeel := Self.Style.LookAndFeel;
      Height := MulDiv(Canvas.TextHeight('Wg'), 20, 13);
      FButtonWidth := Canvas.TextWidth(Caption + '00');
    end;
    if not Properties.ReadOnly then
    begin
      if FOkButton = nil then
        FOkButton := TcxButton.Create(nil);
      with FOkButton do
      begin
        Parent := PopupWindow;
        UseSystemPaint := False;
        Caption := cxGetResourceString(@cxSBlobButtonOK);
        Enabled := FStorage.EditModified;
        ModalResult := mrOk;
        Font.Assign(Self.Style.Font);
        LookAndFeel.MasterLookAndFeel := Self.Style.LookAndFeel;
        W := Canvas.TextWidth(Caption + '00');
        if W > FButtonWidth then FButtonWidth := W;
        SetBounds(0, 0, FButtonWidth, FCancelButton.Height);
      end;
    end;
    FCancelButton.Width := FButtonWidth;
    with TcxCustomEditPopupWindowAccess(PopupWindow) do
      MinSysPanelHeight := FCancelButton.Height + (FCancelButton.Height div 3);
    W := (FCancelButton.Height div 3) + FButtonWidth;
    if FOkButton <> nil then W := W * 2;
  {$IFDEF VCL}
    Properties.PopupMinWidth := W + GetSystemMetrics(SM_CXVSCROLL) + FCancelButton.Height div 2;
  {$ELSE}
    QStyle_scrollBarExtent(QApplication_style, @AScrollBarSize);
    Properties.PopupMinWidth := W + AScrollBarSize.cx + FCancelButton.Height div 2;
  {$ENDIF}
  end;
end;

procedure TcxCustomBlobEdit.DoEditKeyPress(var Key: Char);
begin
//  if (Key >= #32) and (Key <= #255) and Properties.ImmediateDropDown and
//    not Properties.ReadOnly and not HasPopupWindow then
//      FSaveKey := Key;
  inherited DoEditKeyPress(Key);
end;

function TcxCustomBlobEdit.GetPopupFocusedControl: TWinControl;
begin
  if FStorage <> nil then
    Result := FStorage
  else
    Result := inherited GetPopupFocusedControl;
end;

function TcxCustomBlobEdit.GetPopupWindowClientPreferredSize: TSize;
begin
  with Properties do
    if (BlobEditKind = bekPict) and PictureAutoSize then
    begin
      with TcxPopupImage(FStorage).Picture do
        Result := Size(Width + 4, Height + 4);
    end
    else
      Result := inherited GetPopupWindowClientPreferredSize;
end;

procedure TcxCustomBlobEdit.FontChanged;
begin
  inherited FontChanged;
  if not IsDestroying and HasPopupWindow then
  begin
    if FStorage is TcxPopupMemo then
      TcxPopupMemo(FStorage).Style.Font.Assign(Style.Font);
    if FOkButton <> nil then
      FOkButton.Font.Assign(Style.Font);
    if FCancelButton <> nil then
      FCancelButton.Font.Assign(Style.Font);
  end;
end;

procedure TcxCustomBlobEdit.DestroyPopupControls;
begin
  Properties.PopupControl := nil;
  FreeAndNil(FOkButton);
  FreeAndNil(FCancelButton);
  FreeAndNil(FStorage);
end;

procedure TcxCustomBlobEdit.DoInitPopup;
begin
  CreatePopupControls;
  inherited DoInitPopup;
end;

function TcxCustomBlobEdit.IsEditClass: Boolean;
begin
  Result := False;
end;

procedure TcxCustomBlobEdit.PopupWindowClosed(Sender: TObject);
begin
  LockChangeEvents(True);
  try
    inherited PopupWindowClosed(Sender);
    if FStorage.EditModified and ((PopupWindow.ModalResult = mrOk) or
      ((PopupWindow.ModalResult <> mrCancel) and Properties.AlwaysSaveData)) and
      DoEditing then
    begin
      if FStorage is TcxMemo then
        EditValue := TcxMemo(FStorage).Lines.Text
      else
      begin
        if FStorage is TcxImage then
          with TcxImage(FStorage).Picture do
            if Graphic = nil then
              FGraphicClass := nil
            else
              FGraphicClass := TGraphicClass(Graphic.ClassType);
        EditValue := FStorage.EditValue;
      end;
      ModifiedAfterEnter := True;
      if Properties.ImmediatePost and AutoPostEditValue and ValidateEdit(True) then
        PostEditValue;
    end;
    DestroyPopupControls;
    ShortRefreshContainer(False);
  finally
    LockChangeEvents(False);
  end;
end;

procedure TcxCustomBlobEdit.PropertiesChanged(Sender: TObject);
begin
  if IsDestroying then Exit;
  inherited PropertiesChanged(Sender);
  ShortRefreshContainer(False);
end;

procedure TcxCustomBlobEdit.SetupPopupWindow;
var
  AHeight, ADelta: Integer;
  R: TRect;
begin
  if FCancelButton = nil then
  begin
    inherited SetupPopupWindow;
    Exit;
  end;
  TcxCustomEditStyleAccess(Style).PopupCloseButton := False;
  inherited SetupPopupWindow;
  AHeight := FCancelButton.Height;
  ADelta := FButtonWidth + AHeight div 6;
  with TcxCustomEditPopupWindowAccess(PopupWindow) do
  begin
    R := ViewInfo.SizeGripRect;
    if ViewInfo.SizeGripCorner in [ecoTopRight, ecoBottomRight] then
      Inc(ADelta, R.Right - R.Left)
    else
      Inc(ADelta, AHeight div 6);
    if ViewInfo.SizeGripCorner in [ecoTopLeft, ecoTopRight] then
    begin
      FCancelButton.SetBounds(PopupWindow.Width - ADelta,
        R.Top + (MinSysPanelHeight - AHeight) div 2 - 2, FButtonWidth, AHeight);
      FCancelButton.Anchors := [akTop, akRight];
    end
    else
    begin
      FCancelButton.SetBounds(PopupWindow.Width - ADelta,
        R.Bottom - (AHeight + (MinSysPanelHeight - AHeight) div 2 - 2),
        FButtonWidth, AHeight);
      FCancelButton.Anchors := [akBottom, akRight];
    end;
  end;
  if FOkButton <> nil then
  begin
    FOkButton.SetBounds(FCancelButton.Left - (FButtonWidth + (AHeight div 3)),
      FCancelButton.Top, FButtonWidth, AHeight);
    FOkButton.Anchors := FCancelButton.Anchors;
  end;
end;

procedure TcxCustomBlobEdit.StorageEditingHandler(Sender: TObject;
  var CanEdit: Boolean);
begin
  CanEdit := CanModify;
end;

procedure TcxCustomBlobEdit.SynchronizeDisplayValue;
begin
  ShortRefreshContainer(False);
end;

procedure TcxCustomBlobEdit.SynchronizeEditValue;
begin
end;

class function TcxCustomBlobEdit.GetPropertiesClass: TcxCustomEditPropertiesClass; 
begin
  Result := TcxBlobEditProperties;
end;

{ TcxBlobEditPopupWindow }

procedure TcxBlobEditPopupWindow.DoPopupControlKey(Key: Char);
var
  AStorage: TcxCustomEdit;
begin
  AStorage := TcxCustomBlobEdit(Edit).FStorage;
  if AStorage is TcxMemo then
    with TcxMemoAccess(AStorage) do
      if not Properties.ReadOnly then
        if TcxCustomBlobEdit(Edit).Properties.MemoAutoReplace then
        begin
          SetInternalDisplayValue(Key);
          SelStart := 1;
          ModifiedAfterEnter := True;
        end
        else
          inherited DoPopupControlKey(Key);
end;

procedure LoadBlobImages;
var
  Bmp: TBitmap;
begin
  Bmp := TBitmap.Create;
  try
    Bmp.LoadFromResourceName(HInstance, cxbmBlobNull);
    imgBlobImages := TImageList.CreateSize(Bmp.Width, Bmp.Height);
    imgBlobImages.AddMasked(Bmp, clOlive);
    Bmp.LoadFromResourceName(HInstance, cxbmBlob);
    imgBlobImages.AddMasked(Bmp, clOlive);
    Bmp.LoadFromResourceName(HInstance, cxbmMemoNull);
    imgBlobImages.AddMasked(Bmp, clOlive);
    Bmp.LoadFromResourceName(HInstance, cxbmMemo);
    imgBlobImages.AddMasked(Bmp, clOlive);
    Bmp.LoadFromResourceName(HInstance, cxbmPictNull);
    imgBlobImages.AddMasked(Bmp, clOlive);
    Bmp.LoadFromResourceName(HInstance, cxbmPict);
    imgBlobImages.AddMasked(Bmp, clOlive);
    Bmp.LoadFromResourceName(HInstance, cxbmOleNull);
    imgBlobImages.AddMasked(Bmp, clOlive);
    Bmp.LoadFromResourceName(HInstance, cxbmOle);
    imgBlobImages.AddMasked(Bmp, clOlive);
  finally
    Bmp.Free;
  end;
end;

initialization
  LoadBlobImages;
  GetRegisteredEditProperties.Register(TcxBlobEditProperties, scxSEditRepositoryBlobItem);

finalization
  FreeAndNil(imgBlobImages);

end.
