
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

unit cxLabel;

{$I cxExtEdVer.inc}

interface

uses
{$IFDEF VCL}
  Messages, Windows,
{$ELSE}
  Qt, QTypes,
{$ENDIF}
{$IFDEF DELPHI6}
  Types, Variants,
{$ENDIF}
  Classes, Controls, Forms, Graphics, SysUtils, cxClasses, cxContainer, cxEdit,
  cxControls, cxCustomData, cxGraphics, cxTextEdit, cxVariants, cxExtEditConsts,
  cxDataUtils;

type
  TcxLabelEffect = (cxleNormal, cxleFun, cxleExtrude, cxleCool);
  TcxLabelStyle = (cxlsNormal, cxlsRaised, cxlsLowered, cxlsOutLine);
  TcxLabelOrientation = (cxoLeft, cxoRight, cxoTop, cxoBottom,
                         cxoLeftTop, cxoLeftBottom, cxoRightTop, cxoRightBottom);

  { TcxLabelEditStyle }

  TcxLabelEditStyle = class(TcxCustomEditStyle)
  protected
    function DefaultBorderStyle: TcxContainerBorderStyle; override;
    function DefaultColor: TColor; override;
    function DefaultHotTrack: Boolean; override;
  public
    procedure RestoreDefaults; override;
  end;

  { TcxCustomLabelViewInfo }

  TcxCustomLabelViewInfo = class(TcxCustomTextEditViewInfo)
  private
    FAlignment: TcxEditAlignment;
    FLabelEffect: TcxLabelEffect;
    FLabelStyle: TcxLabelStyle;
    FOrientation: TcxLabelOrientation;
    FDepth: Word;
    FDepthDeltaSize: TSize;
    FShadowedColor: TColor;
    FShowEndEllipsis: Boolean;
    FAngle: Integer;
    FPenWidth: Integer;
    FWordWrap: Boolean;
    FLabelTextRect: TRect;
    FLabelRect: TRect;
    FGlyph: TBitmap;
  protected
    property Alignment: TcxEditAlignment read FAlignment write FAlignment;
    property LabelEffect: TcxLabelEffect read FLabelEffect write FLabelEffect;
    property LabelStyle: TcxLabelStyle read FLabelStyle write FLabelStyle;
    property Orientation: TcxLabelOrientation read FOrientation write FOrientation;
    property Depth: Word read FDepth write FDepth;
    property DepthDeltaSize: TSize read FDepthDeltaSize write FDepthDeltaSize;
    property ShadowedColor: TColor read FShadowedColor write FShadowedColor;
    property ShowEndEllipsis: Boolean read FShowEndEllipsis write FShowEndEllipsis;
    property Angle: Integer read FAngle write FAngle;
    property PenWidth: Integer read FPenWidth write FPenWidth;
    property WordWrap: Boolean read FWordWrap write FWordWrap;
    property Glyph: TBitmap read FGlyph write FGlyph;
    property LabelTextRect: TRect read FLabelTextRect write FLabelTextRect;
    property LabelRect: TRect read FLabelRect write FLabelRect;
  public
    FocusRect: TRect;
    HasGlyph: Boolean;
    constructor Create; override;
    destructor Destroy; override;
    procedure Offset(DX, DY: Integer); override;
    procedure DrawText(ACanvas: TcxCanvas); override;
    procedure Paint(ACanvas: TcxCanvas); override;
    procedure DrawLabel(ACanvas: TcxCanvas); virtual;
  end;

  { TcxCustomLabelViewData }
  TcxCustomLabelProperties = class;
  TcxCustomLabelViewData = class(TcxCustomEditViewData)
  private
    function GetProperties: TcxCustomLabelProperties;
    procedure SetProperties(Value: TcxCustomLabelProperties);
    procedure CalculateLabelViewInfoProps(AViewInfo: TcxCustomEditViewInfo);
  protected
    function GetBorderStyle(AEditHotState: TcxContainerHotState): TcxEditBorderStyle; override;
    function GetDrawTextFlags: Integer; virtual;
    function GetIsEditClass: Boolean;
    function InternalGetEditConstantPartSize(ACanvas: TcxCanvas; AIsInplace: Boolean;
      const AEditSizeProperties: TcxEditSizeProperties;
      var MinContentSize: TSize; AViewInfo: TcxCustomEditViewInfo): TSize; override;
  public
    procedure Calculate(ACanvas: TcxCanvas; const ABounds: TRect; const P: TPoint;
      Button: TcxMouseButton; Shift: TShiftState; AViewInfo: TcxCustomEditViewInfo;
      AIsMouseEvent: Boolean); override;
    procedure EditValueToDrawValue(ACanvas: TcxCanvas; const AEditValue: TcxEditValue;
      AViewInfo: TcxCustomEditViewInfo); override;
    property Properties: TcxCustomLabelProperties read GetProperties write SetProperties;
    function GetEditContentSize(ACanvas: TcxCanvas; const AEditValue: TcxEditValue;
      const AEditSizeProperties: TcxEditSizeProperties): TSize; override;
  end;

  { TcxCustomLabelProperties }
  TcxCustomLabelProperties = class(TcxCustomEditProperties)
  private
    FLabelEffect: TcxLabelEffect;
    FLabelStyle: TcxLabelStyle;
    FOrientation: TcxLabelOrientation;
    FDepth: Word;
    FShadowedColor: TColor;
    FShowEndEllipsis: Boolean;
    FAngle: Integer;
    FPenWidth: Integer;
    FGlyph: TBitmap;
    FWordWrap: Boolean;
    FTransparent: Boolean;
    FOnChangeTransparent: TNotifyEvent;
    procedure SetLabelEffect(Value : TcxLabelEffect);
    procedure SetLabelStyle(Value : TcxLabelStyle);
    procedure SetOrientation(Value : TcxLabelOrientation);
    procedure SetDepth(Value : Word);
    procedure SetShadowedColor(Value : TColor);
    procedure SetShowEndEllipsis(Value: Boolean);
    procedure SetAngle(Value: Integer);
    procedure SetPenWidth(Value: Integer);
    function GetGlyph: TBitmap;
    procedure GlyphChanged(Sender: TObject);
    procedure SetGlyph(Value: TBitmap);
    procedure SetWordWrap(Value: Boolean);
    procedure SetTransparent(Value: Boolean);
  protected
    procedure Changed; override;
    function CompareEditValue: Boolean; override;
    class function GetViewDataClass: TcxCustomEditViewDataClass; override;
    function HasDisplayValue: Boolean; override;
    function CalculateDepthDelta: TSize; virtual;
    function CalculateSizeDelta: TSize; virtual;
    function GetDisplayFormatOptions: TcxEditDisplayFormatOptions; override;
    property LabelEffect: TcxLabelEffect read FLabelEffect
      write SetLabelEffect default cxleNormal;
    property LabelStyle: TcxLabelStyle read FLabelStyle
      write SetLabelStyle default cxlsNormal;
    property Orientation: TcxLabelOrientation read FOrientation
      write SetOrientation default cxoRightBottom;
    property Depth: Word read FDepth write SetDepth default 0;
    property ShadowedColor: TColor read FShadowedColor
      write SetShadowedColor default clGrayText;
    property ShowEndEllipsis: Boolean read FShowEndEllipsis
      write SetShowEndEllipsis default False;
    property Angle: Integer read FAngle write SetAngle default 0;
    property PenWidth: Integer read FPenWidth write SetPenWidth default 1;
    property Glyph: TBitmap read GetGlyph write SetGlyph;
    property WordWrap: Boolean read FWordWrap write SetWordWrap default False;
    property Transparent: Boolean read FTransparent write SetTransparent default False;
  public
    constructor Create(AOwner: TPersistent); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    class function GetContainerClass: TcxContainerClass; override;
    function GetDisplayText(const AEditValue: TcxEditValue;
      AFullText: Boolean = False): WideString; override;
    function GetSupportedOperations: TcxEditSupportedOperations; override;
    class function GetViewInfoClass: TcxContainerViewInfoClass; override;
    function IsEditValueValid(var EditValue: TcxEditValue; AEditFocused: Boolean): Boolean; override;
    procedure PrepareDisplayValue(const AEditValue: TcxEditValue;
      var DisplayValue: TcxEditValue; AEditFocused: Boolean); override;
    function GetEditValueSource(AEditFocused: Boolean): TcxDataEditValueSource; override;
  end;

  { TcxLabelProperties }
  TcxLabelProperties = class(TcxCustomLabelProperties)
  published
    property Alignment;
    property OnChange;
    property OnEditValueChanged;
    property OnValidate;
    property LabelEffect;
    property LabelStyle;
    property Orientation;
    property Depth;
    property ShadowedColor;
    property ShowEndEllipsis;
    property Angle;
    property PenWidth;
    property Glyph;
    property WordWrap;
    property Transparent;
  end;

  { TcxCustomLabel }
  TcxCustomLabel = class(TcxCustomEdit)
  private
    FIsEditValueAssigned: Boolean;
{$IFDEF LINUX}
    FSpaceBarAutoRepeat: Boolean;
{$ENDIF}
    FCaption: TCaption;
    FFocusControl: TWinControl;
    FIsCaptionAssigned: Boolean;
    function GetProperties: TcxLabelProperties;
    function GetViewInfo: TcxCustomLabelViewInfo;
    procedure SetProperties(Value: TcxLabelProperties);
    procedure SetFocusControl(Value: TWinControl);
    procedure ReadCaption(Reader: TReader);
    procedure WriteCaption(Writer: TWriter);
    procedure ChangeTransparentHandler(Sender: TObject);
{$IFDEF VCL}
    procedure CMDialogChar(var Message: TCMDialogChar); message CM_DIALOGCHAR;
    procedure CMChanged(var Message: TMessage); message CM_CHANGED;
    procedure WMLButtonUp(var Message: TWMLButtonUp); message WM_LBUTTONUP;
    procedure WMWindowPosChanged(var Message: TWMWindowPosChanged); message WM_WINDOWPOSCHANGED;
    procedure WMEraseBkgnd(var Message: TWMEraseBkgnd); message WM_ERASEBKGND;
{$ENDIF}
  protected
    function GetCaption: TCaption; virtual;
    procedure SetCaption(Value: TCaption); virtual;
    procedure SetName(const Value: TComponentName); override;
{$IFDEF DELPHI6}
    procedure SetAutoSize(Value: Boolean); override;
{$ELSE}
    procedure AdjustSize; override;
{$ENDIF}
    procedure DefineProperties(Filer: TFiler); override;
    function CanResize(var NewWidth, NewHeight: Integer): Boolean; override;
    function CalcSizeRect(const NewWidth, NewHeight: Integer): TRect;
    procedure FillSizeProperties(var AEditSizeProperties: TcxEditSizeProperties); override;
    procedure SynchronizeDisplayValue; override;
    procedure InternalSetEditValue(const Value: TcxEditValue; AValidateEditValue: Boolean); override;
    procedure ProcessViewInfoChanges(APrevViewInfo: TcxCustomEditViewInfo;
      AIsMouseDownUpEvent: Boolean); override;
    procedure PropertiesChanged(Sender: TObject); override;
{$IFNDEF VCL}
    function EventFilter(Sender: QObjectH; Event: QEventH): Boolean; override;
    function WantKey(Key: Integer; Shift: TShiftState; const KeyText: WideString): Boolean; override;
{$ENDIF}
    function CanFocusOnClick: Boolean; override;
    property Properties: TcxLabelProperties read GetProperties write SetProperties;
    property ViewInfo: TcxCustomLabelViewInfo read GetViewInfo;
    property Caption: TCaption read GetCaption write SetCaption stored False;
    property FocusControl: TWinControl read FFocusControl write SetFocusControl;
    procedure Notification(ACOmponent: TComponent; Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Loaded; override;
    class function GetPropertiesClass: TcxCustomEditPropertiesClass; override;
    class function GetStyleClass: TcxContainerStyleClass; override;
{$IFDEF DELPHI5}
    function CanFocus: Boolean; override;
{$ENDIF}
  end;

  { TcxCustomLabel }
  TcxLabel = class(TcxCustomLabel)
  published
    property Align;
    property Anchors;
    property AutoSize;
    property Caption;
    property Constraints;
    property DragMode;
    property Enabled;
    property FocusControl;
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
{$IFDEF VCL}
    property DragCursor;
    property DragKind;
    property ImeMode;
    property ImeName;
{$ENDIF}
    property OnClick;
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
  dxThemeManager,
{$ENDIF}
  cxEditTextUtils, cxEditUtils, cxEditConsts, cxExtEditUtils;

type
  TControlAccess = class(TControl);
  TcxCustomEditAccess = class(TcxCustomEdit);
  TcxCustomEditStyleAccess = class(TcxCustomEditStyle);
  TWinControlAccess = class(TWinControl);

{ TcxLabelEditStyle }

procedure TcxLabelEditStyle.RestoreDefaults;
var
  AEdit: TcxCustomEditAccess;
begin
  inherited RestoreDefaults;
  AEdit := TcxCustomEditAccess(Edit);
  if (AEdit <> nil) and ((StyleController = nil) or
      not TcxCustomEditStyleAccess(StyleController.Style).IsValueDefined(svColor)) then
    AEdit.ParentColor := True;
end;

function TcxLabelEditStyle.DefaultBorderStyle: TcxContainerBorderStyle;
begin
  Result := cbsNone;
end;

function TcxLabelEditStyle.DefaultColor: TColor;
var
  AEdit: TcxCustomEdit;
begin
  AEdit := TcxCustomEdit(Edit);
  if (AEdit <> nil) and (AEdit.Parent <> nil) then
    Result := TWinControlAccess(Edit.Parent).Color
  else
    Result := clWindow;
end;

function TcxLabelEditStyle.DefaultHotTrack: Boolean;
begin
  Result := False;
end;

{ TcxCustomLabelViewInfo }

constructor TcxCustomLabelViewInfo.Create;
begin
  inherited;
  FAlignment := TcxEditAlignment.Create(nil);
end;

destructor TcxCustomLabelViewInfo.Destroy;
begin
  if Assigned(FAlignment) then FreeAndNil(FAlignment);
  inherited;
end;

procedure TcxCustomLabelViewInfo.DrawText(ACanvas: TcxCanvas);
begin
  {Dummy}
end;

procedure TcxCustomLabelViewInfo.Offset(DX, DY: Integer);
begin
  inherited Offset(DX, DY);
  OffsetRect(FLabelTextRect, DX, DY);
  OffsetRect(FLabelRect, DX, DY);
  OffsetRect(FocusRect, DX, DY);
end;

procedure TcxCustomLabelViewInfo.Paint(ACanvas: TcxCanvas);
begin
  DrawCustomEdit(ACanvas, Self, False, bpsSolid);
  DrawLabel(ACanvas);
end;

procedure TcxCustomLabelViewInfo.DrawLabel(ACanvas: TcxCanvas);
var
  FLogFont: TLogFont;
  I, N, X, Y: Integer;
  FTextWidth, FTextHeight: Integer;
  FDeltaX, FDeltaY: Integer;
  Center: TPoint;
  FShadowColor: TColor;
  PaintGlyph, FIsTTFFont: Boolean;
  FTextMetric: TTextMetric;
  FFontHandle: HFont;
  DrawBmp: TBitmap;
  FTextRect, FRect: TRect;
  FRectWidth, FRectHeight: Integer;
  FCalculatedAngle: Integer;
  FAlignStartPoint: TPoint;
  FBkgDeltaX, FBkgDeltaY: Integer;

  function GetColor(BColor, EColor: TColor; N,H: Integer) : TColor;
  begin
    Result := RGB(Trunc(GetRValue(BColor) + (GetRValue(EColor) - GetRValue(BColor)) * N / H),
                  Trunc(GetGValue(BColor) + (GetGValue(EColor) - GetGValue(BColor)) * N / H),
                  Trunc(GetBValue(BColor) + (GetBValue(EColor) - GetBValue(BColor)) * N / H));
  end;

  function RealAlignment: TAlignment;
  begin
    Result := taLeftJustify;
    if Alignment.Horz = taRightJustify then
      Result := taRightJustify;
  end;

  procedure DrawActualText(XVal, YVal: Integer);
  begin
    if (FCalculatedAngle = 0) or not FIsTTFFont then
    begin
      if WordWrap and (FAngle = 0) then
        FTextRect := Rect(XVal, YVal, XVal + RectWidth(FRect),
          YVal + RectHeight(FRect))
      else
        FTextRect := Rect(XVal + 1, YVal, RectWidth(FRect) - 1, RectHeight(FRect));
      Windows.DrawText(DrawBmp.Canvas.Handle, PChar(Text), Length(Text), FTextRect,
        PrepareTextFlag(0, RealAlignment, TcxAlignmentVert(Ord(Alignment.Vert)),
          ShowEndEllipsis, WordWrap and (FAngle = 0), 0));
    end
    else
      DrawBmp.Canvas.TextOut(XVal, YVal, Text);
  end;

begin
  FRect := LabelTextRect;
  FRectWidth := RectWidth(FRect);
  FRectHeight := RectHeight(FRect);
  if FRectWidth < 0 then FRectWidth := 0;
  if FRectHeight < 0 then FRectHeight := 0;
  DrawBmp := TBitmap.Create;
  try
    DrawBmp.Width := FRectWidth;
    DrawBmp.Height := FRectHeight;
    DrawBmp.Canvas.Font.Assign(Self.Font);
    PaintGlyph := False;
    FCalculatedAngle := FAngle mod 360;
    GetTextMetrics(DrawBmp.Canvas.Handle, FTextMetric);
    FIsTTFFont := (FTextMetric.tmPitchAndFamily and TMPF_TRUETYPE) <> 0;
    if (not FGlyph.Empty) and FIsTTFFont then
      PaintGlyph := True;

    Center.X := (FRectWidth + DepthDeltaSize.cx) div 2;
    Center.Y := (FRectHeight + DepthDeltaSize.cy) div 2;

    FTextWidth := DrawBmp.Canvas.TextWidth(Text);
    FTextHeight := DrawBmp.Canvas.TextHeight(Text);
    FShadowColor := ColorToRGB(BackgroundColor);
    if FIsTTFFont and ((FCalculatedAngle mod 360) <> 0) then
    begin
      GetObject(DrawBmp.Canvas.Font.Handle, SizeOf(FLogFont), @FLogFont);
      FLogFont.lfEscapement := (((FCalculatedAngle mod 360) + 360) mod 360) * 10;
      FFontHandle := CreateFontIndirect(FLogFont);
      DrawBmp.Canvas.Font.Handle := FFontHandle;
    end
    else
      FCalculatedAngle := 0;

    if (FCalculatedAngle <> 0) or not WordWrap then
    begin
      X := Center.X - Round(FTextWidth / 2  * Cos(FCalculatedAngle * PI / 180)) -
        Round(FTextHeight / 2 * Sin(FCalculatedAngle * PI / 180));
      Y := Center.Y + Round(FTextWidth / 2 * Sin(FCalculatedAngle * PI / 180)) -
        Round(FTextHeight / 2 * Cos(FCalculatedAngle * PI / 180));
    end
    else
    begin
      X := 0;
      Y := 0;
    end;

    if (X < 0) and (Alignment.Horz <> taCenter) then X := 0;
    if (Y < 0) and (Alignment.Horz <> taCenter) then Y := 0;

    DrawBmp.Canvas.Brush.Color := BackgroundColor;
    if not Transparent or (IsInplace and Focused) then
    begin
      DrawBmp.Canvas.Brush.Style := bsSolid;
      DrawBmp.Canvas.FillRect(Rect(0, 0, DrawBmp.Width, DrawBmp.Height));
    end;
    DrawBmp.Canvas.Brush.Style := bsClear;

    FDeltaX := 0;
    FDeltaY := 0;
    FAlignStartPoint.X := X;
    FAlignStartPoint.Y := Y;
    if Depth > 0 then
    begin
      case Orientation of
        cxoLeft: FDeltaX := - Depth;
        cxoRight: FDeltaX := Depth;
        cxoTop: FDeltaY := - Depth;
        cxoBottom: FDeltaY := Depth;
        cxoLeftTop:
        begin
          FDeltaX := - Depth;
          FDeltaY := - Depth;
        end;
        cxoLeftBottom:
        begin
          FDeltaX := - Depth;
          FDeltaY := Depth;
        end;
        cxoRightTop:
        begin
          FDeltaX := Depth;
          FDeltaY := - Depth;
        end;
        cxoRightBottom:
        begin
          FDeltaX := Depth;
          FDeltaY := Depth;
        end;
      end;
    end;

    if FDeltaX < 0 then
      Inc(FAlignStartPoint.X, FDeltaX);
    if FDeltaY < 0 then
      Inc(FAlignStartPoint.Y, FDeltaY);

    FBkgDeltaX := 0;
    FBkgDeltaY := 0;
    if (FCalculatedAngle = 0) and not WordWrap then
    begin
      case FAlignment.Horz of
        taLeftJustify: FBkgDeltaX := FAlignStartPoint.X;
      end;
    end;

    if Transparent and ((not IsInplace) or (IsInplace and not Focused)) then
    begin
      BitBlt(DrawBmp.Canvas.Handle, 0, 0,
        DrawBmp.Width, DrawBmp.Height,
        ACanvas.Handle, FRect.Left - FBkgDeltaX, FRect.Top - FBkgDeltaY, SRCCOPY);
    end;

    if Depth > 0 then
    begin
      case LabelEffect of
        cxleCool:
        begin
          DrawBmp.Canvas.Font.Color := ShadowedColor;
          DrawActualText(X + FDeltaX, Y + FDeltaY);
        end;
        cxleExtrude:
        begin
          if Abs(FDeltaX) > Abs(FDeltaY) then
            N := Abs(FDeltaX)
          else
            N := Abs(FDeltaY);
          DrawBmp.Canvas.Font.Color := ShadowedColor;
          for I := N downto 1 do
          begin
            if FDeltaX > 0 then FDeltaX := I;
            if FDeltaX < 0 then FDeltaX := -I;
            if FDeltaY > 0 then FDeltaY := I;
            if FDeltaY < 0 then FDeltaY := -I;
            DrawActualText(X + FDeltaX, Y + FDeltaY);
          end;
        end;
        cxleFun:
        begin
          if Abs(FDeltaX) > Abs(FDeltaY) then
            N := Abs(FDeltaX)
          else
            N := Abs(FDeltaY);
          for I := N downto 1 do
          begin
            if FDeltaX > 0 then FDeltaX := I;
            if FDeltaX < 0 then FDeltaX := -I;
            if FDeltaY > 0 then FDeltaY := I;
            if FDeltaY < 0 then FDeltaY := -I;
            DrawBmp.Canvas.Font.Color := GetColor(ShadowedColor, FShadowColor, I-1, N);
            DrawActualText(X + FDeltaX, Y + FDeltaY);
          end;
        end;
      end;
    end;

    if Enabled then
      DrawBmp.Canvas.Font.Color := TextColor
     else
      DrawBmp.Canvas.Font.Color := {$IFDEF VCL}clBtnShadow{$ELSE}clDisabledButtonText{$ENDIF};

    case LabelStyle of
      cxlsNormal:
      begin
        if not PaintGlyph then
          DrawActualText(X, Y);
      end;
      cxlsRaised:
      begin
        DrawBmp.Canvas.Font.Color := clBtnHighlight;
        DrawActualText(X, Y);
        DrawBmp.Canvas.Font.Color := clBtnShadow;
        if Font.Size >= 12 then DrawActualText(X + 2, Y + 2);
        DrawBmp.Canvas.Font.Color := TextColor;
        if not PaintGlyph then DrawActualText(X + 1, Y + 1);
      end;
      cxlsLowered:
      begin
        DrawBmp.Canvas.Font.Color := clBtnHighlight;
        DrawActualText(X + 2, Y + 2);
        DrawBmp.Canvas.Font.Color := clBtnShadow;
        if not PaintGlyph then DrawActualText(X + 1, Y + 1);
      end;
      cxlsOutLine:
      begin
        if FIsTTFFont then
        begin
          BeginPath(DrawBmp.Canvas.Handle);
          DrawActualText(X, Y);
          EndPath(DrawBmp.Canvas.Handle);
          DrawBmp.Canvas.Pen.Color := TextColor;
          DrawBmp.Canvas.Pen.Width := FPenWidth;
          StrokePath(DrawBmp.Canvas.Handle);
          DrawBmp.Canvas.Pen.Width := 1;
        end
        else
          DrawActualText(X, Y);
      end;
    end;

    if (PaintGlyph) and (FGLyph.Width > 0) and (FGlyph.Height > 0) then
    begin
      BeginPath(DrawBmp.Canvas.Handle);
      if LabelStyle = cxlsNormal then
        DrawActualText(X, Y)
       else
        DrawActualText(X + 1, Y + 1);
      EndPath(DrawBmp.Canvas.Handle);
      SelectClipPath(DrawBmp.Canvas.Handle, RGN_COPY);
      while X < FRectWidth do
      begin
        Y := 0;
        while Y < FRectHeight do
        begin
          DrawBmp.Canvas.Draw(X, Y, FGlyph);
          Inc(Y, FGlyph.Height);
        end;
        Inc(X, FGlyph.Width);
      end;
      SelectClipRgn(DrawBmp.Canvas.Handle, 0);
    end;

    if (FCalculatedAngle = 0) then
    begin
      if (not Transparent or (IsInplace and Focused)) and
        ((FBkgDeltaX <> 0) or (FBkgDeltaY <> 0)) then
      begin
        DrawBmp.Canvas.Brush.Color := BackgroundColor;
        DrawBmp.Canvas.Brush.Style := bsSolid;
        case Alignment.Horz of
          taLeftJustify:
          begin
            FBkgDeltaY := 0;
            DrawBmp.Width := DrawBmp.Width + FBkgDeltaX;
            DrawBmp.Height := DrawBmp.Height + FBkgDeltaY;
            DrawBmp.Canvas.FillRect(Rect(DrawBmp.Width - FBkgDeltaX,
              DrawBmp.Height - FBkgDeltaY, DrawBmp.Width, DrawBmp.Height));
          end;
          else
          begin
            FBkgDeltaX := 0;
            FBkgDeltaY := 0;
          end;
        end;
      end;
      BitBlt(ACanvas.Handle, FRect.Left, FRect.Top,
        FRectWidth, FRectHeight,
        DrawBmp.Canvas.Handle, FBkgDeltaX, FBkgDeltaY, SRCCOPY);
    end
    else
      BitBlt(ACanvas.Handle, FRect.Left, FRect.Top,
        FRectWidth, FRectHeight,
        DrawBmp.Canvas.Handle, 0, 0, SRCCOPY);
  finally
    DrawBmp.Free;
  end;
end;
{ TcxCustomLabelViewInfo }

{ TcxCustomLabelViewData }
procedure TcxCustomLabelViewData.CalculateLabelViewInfoProps(AViewInfo: TcxCustomEditViewInfo);
begin
  with TcxCustomLabelViewInfo(AViewInfo) do
  begin
    LabelEffect := Properties.LabelEffect;
    LabelStyle := Properties.LabelStyle;
    Orientation := Properties.Orientation;
    Depth := Properties.Depth;
    ShadowedColor := Properties.ShadowedColor;
    ShowEndEllipsis := Properties.ShowEndEllipsis;
    Angle := Properties.Angle;
    PenWidth := Properties.PenWidth;
    WordWrap := Properties.WordWrap;
    Alignment.Assign(Properties.Alignment);
    Glyph := Properties.Glyph;
  end;
end;

procedure TcxCustomLabelViewData.Calculate(ACanvas: TcxCanvas; const ABounds: TRect;
  const P: TPoint; Button: TcxMouseButton; Shift: TShiftState; AViewInfo: TcxCustomEditViewInfo;
  AIsMouseEvent: Boolean);
var
  FBounds: TRect;
  FViewInfo: TcxCustomLabelViewInfo;
begin
  inherited Calculate(ACanvas, ABounds, P, Button, Shift, AViewInfo, AIsMouseEvent);
  if ((ABounds.Bottom >= MaxInt) or (ABounds.Right >= MaxInt)) and IsInplace then
    Exit;

  FViewInfo := TcxCustomLabelViewInfo(AViewInfo);
  {Standart properties}
  CalculateCustomEditViewInfo(Self, FViewInfo, AIsMouseEvent);
  FViewInfo.Font := Style.Font;
  FViewInfo.BorderStyle := Style.BorderStyle;
  FViewInfo.IsEditClass := GetIsEditClass;
  FViewInfo.DrawSelectionBar := False;
  FViewInfo.HasPopupWindow := False;
  FViewInfo.DrawTextFlags := GetDrawTextFlags;
{$IFDEF VCL}
  if AreVisualStylesMustBeUsed(FViewInfo.NativeStyle, totButton) and
    (FViewInfo.BorderStyle = ebsNone) then
    FViewInfo.NativeStyle := False;
{$ENDIF}
  if not IsInplace then
    FViewInfo.Transparent := Properties.Transparent;
  {Label properties}
  CalculateLabelViewInfoProps(FViewInfo);
  FViewInfo.DepthDeltaSize := Properties.CalculateDepthDelta;
  FBounds := AViewInfo.ClientRect;
  if ((not IsInplace) or (IsInplace and Focused)) and Assigned(Edit) then
    FViewInfo.Text := TcxLabel(Edit).Caption;
  FViewInfo.TextRect := FBounds;
  InflateRect(FBounds, -AViewInfo.BorderWidth , -AViewInfo.BorderWidth);
  FViewInfo.LabelTextRect := FBounds;
  FViewInfo.LabelRect := ABounds;
  CalculateCustomLabelViewInfo(ACanvas, Self, FViewInfo);
  if not IsInplace then FViewInfo.DrawSelectionBar := False;
end;

procedure TcxCustomLabelViewData.EditValueToDrawValue(ACanvas: TcxCanvas;
  const AEditValue: TcxEditValue; AViewInfo: TcxCustomEditViewInfo);
var
  ADisplayValue: TcxEditValue;
begin
  inherited;
  Properties.PrepareDisplayValue(AEditValue, ADisplayValue, Focused);
  TcxCustomLabelViewInfo(AViewInfo).Text := ADisplayValue;
end;

function TcxCustomLabelViewData.GetBorderStyle(AEditHotState: TcxContainerHotState): TcxEditBorderStyle;
begin
  if IsInplace or not TcxCustomEditStyleAccess(Style).IsValueDefined(svBorderStyle) then
    Result := ebsNone
  else
    Result := GetDefaultBorderStyle(AEditHotState);
end;

function TcxCustomLabelViewData.InternalGetEditConstantPartSize(ACanvas: TcxCanvas;
  AIsInplace: Boolean; const AEditSizeProperties: TcxEditSizeProperties;
  var MinContentSize: TSize; AViewInfo: TcxCustomEditViewInfo): TSize;
var
  ASize1, ASize2: TSize;
  AText: TCaption;
  R: TRect;
begin
  Result := inherited InternalGetEditConstantPartSize(ACanvas, AIsInplace,
    AEditSizeProperties, MinContentSize, AViewInfo);
  if (Bounds.Right = MaxInt) or (Bounds.Bottom = MaxInt) then
    Exit;

  with TcxCustomLabelViewInfo(AViewInfo) do
  begin
    R := LabelTextRect;
    ASize1.cx := RectWidth(R);
    ASize1.cy := RectHeight(R);

    if not (AIsInplace{$IFDEF VCL} or AreVisualStylesMustBeUsed(AViewInfo.NativeStyle,
      totButton){$ENDIF}) then
    begin
      Inc(ASize1.cx, 4);
      Inc(ASize1.cy, 4);
    end;

    AText := '';
    ASize2 := GetTextEditContentSize(ACanvas, Self, AText,
      DrawTextFlagsTocxTextOutFlags(cxTextOutFlagsToDrawTextFlags(GetDrawTextFlags) and
        not(CXTO_CENTER_VERTICALLY or CXTO_BOTTOM) or CXTO_TOP), @AEditSizeProperties, False);
    Inc(ASize2.cx, 2);
    Inc(ASize1.cx, ASize2.cx);
    if ASize1.cy < ASize2.cy then
      ASize1.cy := ASize2.cy;
  end;
  Inc(Result.cx, ASize1.cx);
  Inc(Result.cy, ASize1.cy);
end;

function TcxCustomLabelViewData.GetEditContentSize(ACanvas: TcxCanvas;
  const AEditValue: TcxEditValue; const AEditSizeProperties: TcxEditSizeProperties): TSize;
var
  ADisplayValue: TcxEditValue;
begin
  Properties.PrepareDisplayValue(AEditValue, ADisplayValue, Focused);
  Result.cx := ACanvas.TextWidth(ADisplayValue) + 2 + Properties.CalculateSizeDelta.cx;
  Result.cy := ACanvas.TextHeight(ADisplayValue) + Properties.CalculateSizeDelta.cy;
end;

function TcxCustomLabelViewData.GetDrawTextFlags: Integer;
var
  FRealAutoSize: Boolean;
  FRealAngle: Integer;
begin
  if IsInplace or (not IsInplace and not Assigned(Edit)) then
    FRealAutoSize := True
  else
    FRealAutoSize := TcxCustomLabel(Edit).AutoSize;
  if Properties.Angle = 0 then
    FRealAngle := 0
  else
    FRealAngle := (Abs(Properties.Angle) + 360) mod 360;
  Result := PrepareTextFlag(0, Properties.Alignment.Horz,
    TcxAlignmentVert(Ord(Properties.Alignment.Vert)),
    Properties.ShowEndEllipsis and not FRealAutoSize,
    Properties.WordWrap and (FRealAngle = 0), 0);
end;

function TcxCustomLabelViewData.GetIsEditClass: Boolean;
begin
  Result := False;
end;

function TcxCustomLabelViewData.GetProperties: TcxCustomLabelProperties;
begin
  Result := TcxCustomLabelProperties(FProperties);
end;

procedure TcxCustomLabelViewData.SetProperties(Value: TcxCustomLabelProperties);
begin
  FProperties := Value;
end;
{ TcxCustomLabelViewData }

{ TcxCustomLabelProperties }
constructor TcxCustomLabelProperties.Create(AOwner: TPersistent);
begin
  inherited Create(AOwner);
  FLabelEffect := cxleNormal;
  FLabelStyle := cxlsNormal;
  FOrientation := cxoRightBottom;
  FDepth := 0;
  FShadowedColor := clGrayText;
  FShowEndEllipsis := False;
  FAngle := 0;
  FPenWidth := 1;
  FWordWrap := False;
  FTransparent := False;
end;

destructor TcxCustomLabelProperties.Destroy;
begin
  if FGlyph <> nil then FreeAndNil(FGlyph);
  inherited Destroy;
end;

procedure TcxCustomLabelProperties.Assign(Source: TPersistent);
begin
  if Source is TcxCustomLabelProperties then
  begin
    BeginUpdate;
    try
      inherited Assign(Source);
      with Source as TcxCustomLabelProperties do
      begin
        Self.LabelEffect := LabelEffect;
        Self.LabelStyle := LabelStyle;
        Self.Orientation := Orientation;
        Self.Depth := Depth;
        Self.ShadowedColor := ShadowedColor;
        Self.Angle := Angle;
        Self.PenWidth := PenWidth;
        Self.Glyph := Glyph;
        Self.WordWrap := WordWrap;
        Self.Transparent := Transparent;
      end;
    finally
      EndUpdate;
    end
  end
  else
    inherited Assign(Source);
end;

class function TcxCustomLabelProperties.GetContainerClass: TcxContainerClass;
begin
  Result := TcxLabel;
end;

function TcxCustomLabelProperties.GetDisplayText(const AEditValue: TcxEditValue;
  AFullText: Boolean = False): WideString;
var
  ADisplayValue: TcxEditValue;
begin
  PrepareDisplayValue(AEditValue, ADisplayValue, False);
end;

function TcxCustomLabelProperties.GetSupportedOperations: TcxEditSupportedOperations;
begin
  Result := [esoAlwaysHotTrack, esoFiltering, esoSorting];
end;

class function TcxCustomLabelProperties.GetViewInfoClass: TcxContainerViewInfoClass;
begin
  Result := TcxCustomLabelViewInfo;
end;

function TcxCustomLabelProperties.IsEditValueValid(var EditValue: TcxEditValue; AEditFocused: Boolean): Boolean;
begin
  Result := inherited IsEditValueValid(EditValue, AEditFocused);
end;

procedure TcxCustomLabelProperties.PrepareDisplayValue(const AEditValue:
  TcxEditValue; var DisplayValue: TcxEditValue; AEditFocused: Boolean);
begin
  LockUpdate(True);
  try
    if IsVarEmpty(AEditValue) then
      DisplayValue := ''
    else
      DisplayValue := VarAsType(AEditValue, varString);
  finally
    LockUpdate(False);
  end;
end;

function TcxCustomLabelProperties.CompareEditValue: Boolean;
begin
  Result := True;
end;

procedure TcxCustomLabelProperties.Changed;
begin
  inherited Changed;
  if Assigned(FOnChangeTransparent) then
    FOnChangeTransparent(Self);
end;

class function TcxCustomLabelProperties.GetViewDataClass: TcxCustomEditViewDataClass;
begin
  Result := TcxCustomLabelViewData;
end;

function TcxCustomLabelProperties.HasDisplayValue: Boolean;
begin
  Result := True;
end;

procedure TcxCustomLabelProperties.SetLabelEffect(Value : TcxLabelEffect);
begin
  if FLabelEffect <> Value then
  begin
    FLabelEffect := Value;
    Changed;
  end;
end;

procedure TcxCustomLabelProperties.SetLabelStyle(Value : TcxLabelStyle);
begin
  if FLabelStyle <> Value then
  begin
    FLabelStyle := Value;
    Changed;
  end;
end;

procedure TcxCustomLabelProperties.SetOrientation(Value : TcxLabelOrientation);
begin
  if FOrientation <> Value then
  begin
    FOrientation := Value;
    Changed;
  end;
end;

procedure TcxCustomLabelProperties.SetDepth(Value : Word);
begin
  if FDepth <> Value then
  begin
    FDepth := Value;
    Changed;
  end;
end;

procedure TcxCustomLabelProperties.SetShadowedColor(Value : TColor);
begin
  if FShadowedColor <> Value then
  begin
    FShadowedColor := Value;
    Changed;
  end;
end;

procedure TcxCustomLabelProperties.SetShowEndEllipsis(Value: Boolean);
begin
  if FShowEndEllipsis <> Value then
  begin
    FShowEndEllipsis := Value;
    Changed;
  end;
end;

procedure TcxCustomLabelProperties.SetAngle(Value: Integer);
begin
  if FAngle <> Value then
  begin
    FAngle := Value;
    Changed;
  end;
end;

procedure TcxCustomLabelProperties.SetPenWidth(Value: Integer);
begin
  if FPenWidth <> Value then
  begin
    FPenWidth := Value;
    Changed;
  end;
end;

function TcxCustomLabelProperties.GetGlyph: TBitmap;
begin
  if FGlyph = nil then
  begin
    FGlyph := TBitmap.Create;
    FGlyph.OnChange := GlyphChanged;
  end;
  Result := FGlyph;
end;

procedure TcxCustomLabelProperties.GlyphChanged(Sender: TObject);
begin
  Changed;
end;

procedure TcxCustomLabelProperties.SetGlyph(Value: TBitmap);
begin
  if Value = nil then
    FreeAndNil(FGlyph)
  else
    Glyph.Assign(Value);
  Changed;
end;

procedure TcxCustomLabelProperties.SetWordWrap(Value: Boolean);
begin
  if FWordWrap <> Value then
  begin
    FWordWrap := Value;
    Changed;
  end;
end;

procedure TcxCustomLabelProperties.SetTransparent(Value: Boolean);
begin
  if FTransparent <> Value then
  begin
    FTransparent := Value;
    Changed;
  end;
end;

function TcxCustomLabelProperties.CalculateDepthDelta: TSize;
begin
  Result.cx := 0;
  Result.cy := 0;
  case FOrientation of
    cxoLeft: Result.cx := FDepth;
    cxoRight: Result.cx := -FDepth;
    cxoTop: Result.cy := FDepth;
    cxoBottom: Result.cy := -FDepth;
    cxoLeftTop:
    begin
      Result.cx := FDepth;
      Result.cy := FDepth;
    end;
    cxoLeftBottom:
    begin
      Result.cx := FDepth;
      Result.cy := -FDepth;
    end;
    cxoRightTop:
    begin
      Result.cx := -FDepth;
      Result.cy := FDepth;
    end;
    cxoRightBottom:
    begin
      Result.cx := -FDepth;
      Result.cy := -FDepth;
    end;
  end;
end;

function TcxCustomLabelProperties.CalculateSizeDelta: TSize;
begin
  Result.cx := 0;
  Result.cy := 0;
  case FOrientation of
    cxoLeft, cxoRight: Result.cx := FDepth;
    cxoTop, cxoBottom: Result.cy := FDepth;
    cxoLeftTop, cxoLeftBottom, cxoRightTop, cxoRightBottom:
    begin
      Result.cx := FDepth;
      Result.cy := FDepth;
    end;
  end;
end;

function TcxCustomLabelProperties.GetDisplayFormatOptions: TcxEditDisplayFormatOptions;
begin
  Result := [];
end;

function TcxCustomLabelProperties.GetEditValueSource(AEditFocused: Boolean): TcxDataEditValueSource;
begin
  Result := evsText;
end;
{ TcxCustomLabelProperties }

{ TcxCustomLabel }
constructor TcxCustomLabel.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FIsCreating := True;
  FIsEditValueAssigned := False;
  ControlStyle := ControlStyle - [csDoubleClicks, csAcceptsControls, csCaptureMouse, csClickEvents];
  ParentColor := not IsInplace;
  Width := 121;
  Height := 21;
  FIsCreating := False;
  Properties.FOnChangeTransparent := ChangeTransparentHandler;
end;

destructor TcxCustomLabel.Destroy;
begin
  FFocusControl := nil;
  inherited;
end;

procedure TcxCustomLabel.Loaded;
begin
  inherited;
end;

procedure TcxCustomLabel.Notification(ACOmponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (FFocusControl <> nil) and
    (AComponent = FFocusControl) then FFocusControl := nil;
end;

class function TcxCustomLabel.GetPropertiesClass: TcxCustomEditPropertiesClass;
begin
  Result := TcxLabelProperties;
end;

class function TcxCustomLabel.GetStyleClass: TcxContainerStyleClass;
begin
  Result := TcxLabelEditStyle;
end;

procedure TcxCustomLabel.DefineProperties(Filer: TFiler);
begin
  inherited DefineProperties(Filer);
  Filer.DefineProperty('Caption', ReadCaption, WriteCaption, FIsCaptionAssigned);
end;

procedure TcxCustomLabel.SetName(const Value: TComponentName);
begin
  inherited SetName(Value);
  if not FIsCaptionAssigned then
  begin
    Caption := Value;
    FIsCaptionAssigned := False;
  end;
end;

{$IFDEF DELPHI6}
procedure TcxCustomLabel.SetAutoSize(Value: Boolean);
begin
  inherited SetAutoSize(Value);
  Invalidate;
end;
{$ELSE}
procedure TcxCustomLabel.AdjustSize;
begin
  inherited AdjustSize;
  Invalidate;
end;
{$ENDIF}

function TcxCustomLabel.CalcSizeRect(const NewWidth, NewHeight: Integer): TRect;
var
  FTextFlag: LongWord;
  FDefaultRect: TRect;
  FNewHeight, FRectW, FRectH: Integer;
  FRealAngle: Integer;
  FDepthSizeDelta: TSize;
  FCalcCaption: string;
begin
  Result := Rect(0, 0, NewWidth, NewHeight);
  if not HandleAllocated or not Assigned(Parent) then Exit;
  if Trim(Caption) = '' then
  begin
    Result := Rect(0, 0, 0, Canvas.TextHeight('1'));
    Exit;
  end;
  FCalcCaption := Caption;
  if Align <> alClient then
  begin
    if Properties.Angle = 0 then
      FRealAngle := 0
    else
      FRealAngle := (Abs(Properties.Angle) + 360) mod 360;
    FDefaultRect := Rect(0, 0, NewWidth, NewHeight);
    FTextFlag := PrepareTextFlag(DT_CALCRECT, Properties.Alignment.Horz,
      TcxAlignmentVert(Ord(Properties.Alignment.Vert)),
      Properties.ShowEndEllipsis and not AutoSize,
      Properties.WordWrap and (FRealAngle = 0), 0);
    FNewHeight := Windows.DrawTextEx(Canvas.Handle, PChar(FCalcCaption),
      Length(FCalcCaption), FDefaultRect, FTextFlag, nil);
    if not Properties.WordWrap then
      FDefaultRect.Bottom := FNewHeight;
    if FRealAngle > 0 then
    begin
      FRectW := RectWidth(FDefaultRect);
      FRectH := RectHeight(FDefaultRect);
      FDefaultRect.Right := Abs(Trunc(FRectW * COS(FRealAngle  * PI / 180)));
      FDefaultRect.Bottom := Abs(Trunc(FRectW * SIN(FRealAngle  * PI / 180)));
      if (FRealAngle > 45) and (FRealAngle < 135) or
        (FRealAngle > 225) and (FRealAngle < 315) then
      begin
        Inc(FDefaultRect.Right, FRectH);
        Inc(FDefaultRect.Bottom, Canvas.TextWidth('w'));
      end
      else
      begin
        Inc(FDefaultRect.Bottom, FRectH);
        Inc(FDefaultRect.Right, Canvas.TextWidth('w'));
      end;
    end;
  end;

  FDepthSizeDelta := Properties.CalculateSizeDelta;
  case Align of
    alLeft, alRight:
    begin
      Result := Rect(0, 0, RectWidth(FDefaultRect), Parent.ClientHeight);
      if AutoSize then
        Inc(Result.Right, FDepthSizeDelta.cx + 8);
    end;
    alTop, alBottom:
    begin
      Result := Rect(0, 0, Parent.ClientWidth, RectHeight(FDefaultRect));
      if AutoSize then
        Inc(Result.Bottom, FDepthSizeDelta.cy + 4);
    end;
    alClient: Result := Rect(0, 0, Parent.ClientWidth, Parent.ClientHeight);
    else
    begin
      if AutoSize then
      begin
        Result := FDefaultRect;
        Inc(Result.Right, FDepthSizeDelta.cx + 8);
        Inc(Result.Bottom, FDepthSizeDelta.cy + 4);
      end
      else
        Result := Rect(0, 0, NewWidth, NewHeight);
    end;
  end;
end;

function TcxCustomLabel.CanResize(var NewWidth, NewHeight: Integer): Boolean;
var
  R: TRect;
begin
  Result := inherited CanResize(NewWidth, NewHeight);
  if Result and AutoSize and not IsLoading then
  begin
    R := CalcSizeRect(NewWidth, NewHeight);
    NewWidth := RectWidth(R);
    NewHeight := RectHeight(R);
  end;
end;

procedure TcxCustomLabel.FillSizeProperties(var AEditSizeProperties: TcxEditSizeProperties);
begin
  with AEditSizeProperties do
  begin
    MaxLineCount := 1;
    Width := ViewInfo.TextRect.Right - ViewInfo.TextRect.Left;
  end;
end;

procedure TcxCustomLabel.SetFocusControl(Value: TWinControl);
begin
  if (FFocusControl <> Value) and (Value <> Self) then
    FFocusControl := Value;
end;

procedure TcxCustomLabel.ReadCaption(Reader: TReader);
begin
{$IFDEF VCL}
  Caption := Reader.ReadString;
{$ELSE}
  Caption := Reader.ReadWideString;
{$ENDIF}
end;

procedure TcxCustomLabel.ChangeTransparentHandler(Sender: TObject);
begin
  Invalidate;
end;

procedure TcxCustomLabel.WriteCaption(Writer: TWriter);
begin
{$IFDEF VCL}
  Writer.WriteString(Caption);
{$ELSE}
  Writer.WriteWideString(Caption);
{$ENDIF}
end;

function TcxCustomLabel.GetCaption: TCaption;
begin
  Result := FCaption;
end;

procedure TcxCustomLabel.SetCaption(Value: TCaption);
begin
  FIsCaptionAssigned := True;
  if not SameText(FCaption, Value) then
    EditValue := Value;
end;

procedure TcxCustomLabel.InternalSetEditValue(const Value: TcxEditValue;
  AValidateEditValue: Boolean);
begin
  inherited InternalSetEditValue(Value, AValidateEditValue);
  if IsVarEmpty(Value) then
    FCaption := ''
  else
    FCaption := VarAsType(Value, varString);

  FIsEditValueAssigned := True;
  Properties.Changed;
end;

procedure TcxCustomLabel.SynchronizeDisplayValue;
var
  Display: TcxEditValue;
begin
  Properties.PrepareDisplayValue(FCaption, Display, Focused);
  Properties.Changed;
end;

procedure TcxCustomLabel.ProcessViewInfoChanges(APrevViewInfo: TcxCustomEditViewInfo;
  AIsMouseDownUpEvent: Boolean);
begin
  inherited;
end;

procedure TcxCustomLabel.PropertiesChanged(Sender: TObject);
begin
  ViewInfo.Text := '';
  inherited PropertiesChanged(Sender);
end;

{$IFDEF DELPHI5}
function TcxCustomLabel.CanFocus: Boolean;
begin
  Result := IsInplace;
end;
{$ENDIF}

function TcxCustomLabel.CanFocusOnClick: Boolean;
begin
  Result := IsInplace;
end;

{$IFDEF VCL}
procedure TcxCustomLabel.WMLButtonUp(var Message: TWMLButtonUp);
begin
  ControlState := ControlState + [csClicked];
  inherited;
end;

procedure TcxCustomLabel.WMWindowPosChanged(var Message: TWMWindowPosChanged);
begin
  inherited;
  Invalidate;
end;

procedure TcxCustomLabel.WMEraseBkgnd(var Message: TWMEraseBkgnd);
begin
  if not IsDestroying and Assigned(Properties) and Properties.Transparent then
  begin
    PaintBackground(Self, Message.DC, True);
    Message.Result := 1;
  end
  else
    inherited;
end;

procedure TcxCustomLabel.CMChanged(var Message: TMessage);
begin
  inherited;
  Invalidate;
end;

procedure TcxCustomLabel.CMDialogChar(var Message: TCMDialogChar);
begin
  with Message do
    if IsAccel(CharCode, Caption) then
    begin
      if Assigned(FocusControl) and FocusControl.CanFocus then
        FocusControl.SetFocus
      else
        MessageBeep(0);

      Result := 1;
    end
    else
    inherited;
end;
{$ENDIF}

{$IFNDEF VCL}
function TcxCustomLabel.EventFilter(Sender: QObjectH; Event: QEventH): Boolean;
  {$IFDEF LINUX}
var
  AKeyEvent: QKeyEventH;
  {$ENDIF}
begin
  case QEvent_type(Event) of
  {$IFDEF LINUX}
    QEventType_KeyPress, QEventType_KeyRelease:
      begin
        AKeyEvent := QKeyEventH(Event);
        FSpaceBarAutoRepeat := QKeyEvent_count(AKeyEvent) > 1;
        FSpaceBarAutoRepeat := FSpaceBarAutoRepeat or QKeyEvent_isAutoRepeat(AKeyEvent);
      end;
  {$ENDIF}
    QEventType_MouseButtonRelease:
      if ButtonStateToMouseButton(QMouseEvent_button(QMouseEventH(Event))) = mbLeft then
        ControlState := ControlState - [csClicked];
  end;
  Result := inherited EventFilter(Sender, Event);
end;
{$ENDIF}

function TcxCustomLabel.GetProperties: TcxLabelProperties;
begin
  Result := TcxLabelProperties(InternalGetProperties);
end;

function TcxCustomLabel.GetViewInfo: TcxCustomLabelViewInfo;
begin
  Result := TcxCustomLabelViewInfo(FViewInfo);
end;

procedure TcxCustomLabel.SetProperties(Value: TcxLabelProperties);
begin
  FProperties.Assign(Value);
end;
{ TcxCustomLabel }

initialization
  GetRegisteredEditProperties.Register(TcxLabelProperties, scxSEditRepositoryLabelItem);

finalization
  GetRegisteredEditProperties.Unregister(TcxLabelProperties);

end.