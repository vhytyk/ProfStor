
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

unit cxProgressBar;

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
  Classes, Controls, Forms, Graphics, SysUtils, cxClasses, cxContainer, cxControls,
  cxCustomData, cxEdit, cxGraphics, cxTextEdit, cxVariants, cxExtEditConsts;

type
  TcxBorderWidth = 0..MaxWord;
  TcxProgressBarBevelOuter = (cxbvNone, cxbvLowered, cxbvRaised);
  TcxProgressBarOrientation = (cxorHorizontal, cxorVertical);
  TcxProgressBarTextStyle = (cxtsPercent, cxtsPosition);
  TcxProgressBarBarStyle = (cxbsSolid, cxbsLEDs, cxbsGradient,
    cxbsGradientLEDs, cxbsBitmap, cxbsBitmapLEDs);

  { TcxProgressBarStyle }
  TcxProgressBarStyle = class(TcxCustomEditStyle)
  public
    function DefaultColor: TColor; override;
    procedure RestoreDefaults; override;
  end;

  { TcxCustomProgressBarViewInfo }
  TcxCustomProgressBarViewInfo = class(TcxCustomTextEditViewInfo)
  private
    FBeginColor: TColor;
    FBarBevelOuter: TcxProgressBarBevelOuter;
    FEndColor: TColor;
    FMin: Integer;
    FMax: Integer;
    FPosition: Integer;
    FForegroundImage: TBitmap;
    FOrientation: TcxProgressBarOrientation;
    FShowText: Boolean;
    FShowTextStyle: TcxProgressBarTextStyle;
    FTextOrientation: TcxProgressBarOrientation;
    FSolidTextColor: Boolean;
    FBarStyle: TcxProgressBarBarStyle;
    FOverloadValue: Integer;
    FOverloadBeginColor: TColor;
    FOverloadEndColor: TColor;
    FShowOverload: Boolean;
    FPeakValue: Integer;
    FPeakColor: TColor;
    FPeakSize: TcxNaturalNumber;
    FShowPeak: Boolean;
    FRealShowOverload: Boolean;
    FRealShowPeak: Boolean;
    FPropTransparent: Boolean;
  protected
    BarRect: TRect;
    ProgressBarRect: TRect;
    OverloadBarRect: TRect;
    PeakBarRect: TRect;
    property BeginColor: TColor read FBeginColor write FBeginColor;
    property BarBevelOuter: TcxProgressBarBevelOuter read FBarBevelOuter
      write FBarBevelOuter;
    property EndColor: TColor read FEndColor write FEndColor;
    property Min: Integer read FMin write FMin;
    property Max: Integer read FMax write FMax;
    property Position : Integer read FPosition write FPosition;
    property ForegroundImage: TBitmap read FForegroundImage write FForegroundImage;
    property Orientation: TcxProgressBarOrientation read FOrientation write FOrientation;
    property ShowText: Boolean read FShowText write FShowText;
    property ShowTextStyle: TcxProgressBarTextStyle read FShowTextStyle write FShowTextStyle;
    property TextOrientation: TcxProgressBarOrientation read FTextOrientation
      write FTextOrientation;
    property SolidTextColor: Boolean read FSolidTextColor write FSolidTextColor;
    property BarStyle: TcxProgressBarBarStyle read FBarStyle write FBarStyle;
    property OverloadValue: Integer read FOverloadValue write FOverloadValue;
    property OverloadBeginColor: TColor read FOverloadBeginColor write FOverloadBeginColor;
    property OverloadEndColor: TColor read FOverloadEndColor write FOverloadEndColor;
    property PeakValue: Integer read FPeakValue write FPeakValue;
    property PeakColor: TColor read FPeakColor write FPeakColor;
    property PeakSize: TcxNaturalNumber read FPeakSize write FPeakSize;
    property ShowOverload: Boolean read FShowOverload write FShowOverload;
    property ShowPeak: Boolean read FShowPeak write FShowPeak;
    property PropTransparent: Boolean read FPropTransparent write FPropTransparent;
  public
    FocusRect: TRect;
    HasForegroundImage: Boolean;
    constructor Create; override;
    destructor Destroy; override;
    procedure DrawText(ACanvas: TcxCanvas); override;
    function GetUpdateRegion(AViewInfo: TcxContainerViewInfo): TcxRegion; override;
    function NeedShowHint(ACanvas: TcxCanvas; const P: TPoint; out AText: TCaption;
      out AIsMultiLine: Boolean; out ATextRect: TRect): Boolean; override;
    procedure Paint(ACanvas: TcxCanvas); override;
    procedure PaintProgressBar(ACanvas: TcxCanvas); virtual;
    procedure Offset(DX: Integer; DY: Integer); override;
  end;

  { TcxCustomProgressBarViewData }
  TcxCustomProgressBarProperties = class;
  TcxCustomProgressBarViewData = class(TcxCustomEditViewData)
  private
    function GetProperties: TcxCustomProgressBarProperties;
    procedure SetProperties(Value: TcxCustomProgressBarProperties);
  protected
    procedure CalculateViewInfoProperties(AViewInfo: TcxCustomEditViewInfo); virtual;
    function InternalGetEditConstantPartSize(ACanvas: TcxCanvas; AIsInplace: Boolean;
      const AEditSizeProperties: TcxEditSizeProperties;
      var MinContentSize: TSize; AViewInfo: TcxCustomEditViewInfo): TSize; override;
    function GetDrawTextFlags: Integer; virtual;
    function GetIsEditClass: Boolean;
  public
    procedure Calculate(ACanvas: TcxCanvas; const ABounds: TRect; const P: TPoint;
      Button: TcxMouseButton; Shift: TShiftState; AViewInfo: TcxCustomEditViewInfo;
      AIsMouseEvent: Boolean); override;
    procedure EditValueToDrawValue(ACanvas: TcxCanvas; const AEditValue: TcxEditValue;
      AViewInfo: TcxCustomEditViewInfo); override;
    property Properties: TcxCustomProgressBarProperties read GetProperties write SetProperties;
  end;

  { TcxCustomProgressBarProperties }
  TcxCustomProgressBarProperties = class(TcxCustomEditProperties)
  private
    FCurrentPosition: Integer;
    FBeginColor: TColor;
    FBarBevelOuter: TcxProgressBarBevelOuter;
    FEndColor: TColor;
    FForegroundImage: TBitmap;
    FMin: Integer;
    FMax: Integer;
    FOrientation: TcxProgressBarOrientation;
    FShowText: Boolean;
    FShowTextStyle: TcxProgressBarTextStyle;
    FTextOrientation: TcxProgressBarOrientation;
    FSolidTextColor: Boolean;
    FBarStyle: TcxProgressBarBarStyle;
    FTransparentImage: Boolean;
    FBorderWidth: TcxBorderWidth;
    FOverloadValue: Integer;
    FShowOverload: Boolean;
    FOverloadBeginColor: TColor;
    FOverloadEndColor: TColor;
    FPeakValue: Integer;
    FShowPeak: Boolean;
    FPeakColor: TColor;
    FPeakSize: TcxNaturalNumber;
    FTransparent: Boolean;
    FOnChangeTransparent: TNotifyEvent;
    function GetForegroundImage: TBitmap;
    procedure ForegroundImageChanged(Sender: TObject);
    function GetRealPeakValue: Integer;
    procedure SetBeginColor(Value: TColor);
    procedure SetBarBevelOuter(Value: TcxProgressBarBevelOuter);
    procedure SetEndColor(Value: TColor);
    procedure SetForegroundImage(Value: TBitmap);
    procedure SetMin(Value: Integer);
    procedure SetMax(Value: Integer);
    procedure SetOrientation(Value: TcxProgressBarOrientation);
    procedure SetShowText(Value: Boolean);
    procedure SetShowTextStyle(Value: TcxProgressBarTextStyle);
    procedure SetTextOrientation(Value: TcxProgressBarOrientation);
    procedure SetSolidTextColor(Value: Boolean);
    procedure SetBarStyle(Value: TcxProgressBarBarStyle);
    procedure SetTransparentImage(Value: Boolean);
    procedure SetBorderWidth(Value: TcxBorderWidth);
    procedure SetOverloadValue(Value: Integer);
    procedure SetShowOverload(Value: Boolean);
    procedure SetOverloadBeginColor(Value: TColor);
    procedure SetOverloadEndColor(Value: TColor);
    procedure SetPeakValue(Value: Integer);
    procedure SetShowPeak(Value: Boolean);
    procedure SetPeakColor(Value: TColor);
    procedure SetPeakSize(Value: TcxNaturalNumber);
    procedure SetTransparent(Value: Boolean);
    procedure PostMinValue;
    procedure PostMaxValue;
    procedure PostOverloadValue;
  protected
    function CompareEditValue: Boolean; override;
    class function GetViewDataClass: TcxCustomEditViewDataClass; override;
    function HasDisplayValue: Boolean; override;
    procedure PrepareCurrentPosition(Value: Integer); virtual;
    property BeginColor: TColor read FBeginColor write SetBeginColor default clNavy;
    property BarBevelOuter: TcxProgressBarBevelOuter read FBarBevelOuter
      write SetBarBevelOuter default cxbvNone;
    property EndColor: TColor read FEndColor write SetEndColor default clWhite;
    property ForegroundImage: TBitmap read GetForegroundImage write SetForegroundImage;
    property Min: Integer read FMin write SetMin default 0;
    property Max: Integer read FMax write SetMax default 100;
    property Orientation: TcxProgressBarOrientation read FOrientation
      write SetOrientation default cxorHorizontal;
    property ShowText: Boolean read FShowText write SetShowText default True;
    property ShowTextStyle: TcxProgressBarTextStyle read FShowTextStyle
      write SetShowTextStyle default cxtsPercent;
    property TextOrientation: TcxProgressBarOrientation read FTextOrientation
      write SetTextOrientation default cxorHorizontal;
    property SolidTextColor: Boolean read FSolidTextColor write SetSolidTextColor default False;
    property BarStyle: TcxProgressBarBarStyle read FBarStyle write SetBarStyle default cxbsSolid;
    property TransparentImage: Boolean read FTransparentImage write SetTransparentImage default True;
    property BorderWidth : TcxBorderWidth read FBorderWidth write SetBorderWidth default 0;
    property OverloadValue: Integer read FOverloadValue write SetOverloadValue default 80;
    property ShowOverload: Boolean read FShowOverload write SetShowOverload default False;
    property OverloadBeginColor: TColor read FOverloadBeginColor
      write SetOverloadBeginColor default $008080FF;
    property OverloadEndColor: TColor read FOverloadEndColor
      write SetOverloadEndColor default clFuchsia;
    property PeakValue: Integer read FPeakValue write SetPeakValue default 0;
    property ShowPeak: Boolean read FShowPeak write SetShowPeak default False;
    property PeakColor: TColor read FPeakColor write SetPeakColor default clRed;
    property PeakSize: TcxNaturalNumber read FPeakSize write SetPeakSize default 2;
    property Transparent: Boolean read FTransparent write SetTransparent default False;
  public
    constructor Create(AOwner: TPersistent); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    class function GetContainerClass: TcxContainerClass; override;
    function GetDisplayText(const AEditValue: TcxEditValue;
      AFullText: Boolean = False): WideString; override;
    class function GetStyleClass: TcxContainerStyleClass; override;
    function GetSupportedOperations: TcxEditSupportedOperations; override;
    class function GetViewInfoClass: TcxContainerViewInfoClass; override;
    function IsEditValueValid(var EditValue: TcxEditValue;
      AEditFocused: Boolean): Boolean; override;
    procedure PrepareDisplayValue(const AEditValue: TcxEditValue;
      var DisplayValue: TcxEditValue; AEditFocused: Boolean); override;
    property RealPeakValue: Integer read GetRealPeakValue;
  end;

  { TcxProgressBarProperties }
  TcxProgressBarProperties = class(TcxCustomProgressBarProperties)
  public
    property RealPeakValue;
  published
    property BeginColor;
    property BarBevelOuter;
    property EndColor;
    property ForegroundImage;
    property Min;
    property Max;
    property Orientation;
    property ShowText;
    property ShowTextStyle;
    property TextOrientation;
    property SolidTextColor;
    property BarStyle;
    property TransparentImage;
    property BorderWidth;
    property OverloadValue;
    property ShowOverload;
    property OverloadBeginColor;
    property OverloadEndColor;
    property PeakValue;
    property ShowPeak;
    property PeakColor;
    property PeakSize;
    property Transparent;
  end;

  { TcxCustomProgressBar }
  TcxCustomProgressBar = class(TcxCustomEdit)
  private
    FPosition : Integer;
{$IFDEF LINUX}
    FSpaceBarAutoRepeat: Boolean;
{$ENDIF}
    function GetProperties: TcxProgressBarProperties;
    function GetViewInfo: TcxCustomProgressBarViewInfo;
    procedure SetProperties(Value: TcxProgressBarProperties);
    procedure SetPosition(Value: Integer);
    procedure ChangeTransparentHandler(Sender: TObject);
{$IFDEF VCL}
    procedure WMEraseBkgnd(var Message: TWMEraseBkgnd); message WM_ERASEBKGND;
{$ENDIF}
  protected
    function CanResize(var NewWidth, NewHeight: Integer): Boolean; override;
    procedure FillSizeProperties(var AEditSizeProperties: TcxEditSizeProperties); override;
    procedure InternalSetEditValue(const Value: TcxEditValue; AValidateEditValue: Boolean); override;
    procedure SynchronizeDisplayValue; override;
    procedure ProcessViewInfoChanges(APrevViewInfo: TcxCustomEditViewInfo;
      AIsMouseDownUpEvent: Boolean); override;
    procedure PropertiesChanged(Sender: TObject); override;
    property Properties: TcxProgressBarProperties read GetProperties write SetProperties;
    property ViewInfo: TcxCustomProgressBarViewInfo read GetViewInfo;
    function CanFocusOnClick: Boolean; override;
    property Position: Integer read FPosition write SetPosition default 0;
  public
    constructor Create(AOwner: TComponent); override;
    class function GetPropertiesClass: TcxCustomEditPropertiesClass; override;
    class function GetNotPublishedStyleValues: TcxEditStyleValues; override;
{$IFDEF DELPHI5}
    function CanFocus: Boolean; override;
{$ENDIF}    
  end;

  { TcxCustomProgressBar }
  TcxProgressBar = class(TcxCustomProgressBar)
  published
    property Position;
    property Anchors;
    property AutoSize;
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
    property Visible;
{$IFDEF VCL}
    property DragCursor;
    property DragKind;
    property ImeMode;
    property ImeName;
{$ENDIF}
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
  cxEditTextUtils, cxEditUtils, cxEditConsts, cxExtEditUtils;

function MaxMinDiff(AMax, AMin: Integer): Integer;
begin
  Result := AMax - AMin;
  if Result < 1 then
    Result := 1;
end;

function CalculateDelta(const APositionDelta, ARectWidth, AMaxMinDelta: Double): Integer;
var
  ACalc: Double;
begin
  ACalc := (APositionDelta * ARectWidth) / AMaxMinDelta;
  Result := Trunc(ACalc);
end;

{ TcxProgressBarStyle }
procedure TcxProgressBarStyle.RestoreDefaults;
begin
  inherited RestoreDefaults;
end;

function TcxProgressBarStyle.DefaultColor: TColor;
begin
  Result := inherited DefaultColor;
end;
{ TcxProgressBarStyle }

{ TcxCustomProgressBarViewInfo }
constructor TcxCustomProgressBarViewInfo.Create;
begin
  inherited;
  FForegroundImage := TBitmap.Create;
end;

destructor TcxCustomProgressBarViewInfo.Destroy;
begin
  if Assigned(FForegroundImage) then FreeAndNil(FForegroundImage);
  inherited;
end;

function TcxCustomProgressBarViewInfo.GetUpdateRegion(AViewInfo: TcxContainerViewInfo): TcxRegion;
begin
  Result := inherited GetUpdateRegion(AViewInfo);
  if not (AViewInfo is TcxCustomProgressBarViewInfo) then Exit;
end;

function TcxCustomProgressBarViewInfo.NeedShowHint(ACanvas: TcxCanvas;
  const P: TPoint; out AText: TCaption; out AIsMultiLine: Boolean;
  out ATextRect: TRect): Boolean;
begin
  Result := False;
end;

procedure TcxCustomProgressBarViewInfo.DrawText(ACanvas: TcxCanvas);
begin
  {Dummy}
end;

procedure TcxCustomProgressBarViewInfo.Offset(DX: Integer; DY: Integer);
begin
  inherited Offset(DX, DY);
  InflateRectEx(BarRect, DX, DY, DX, DY);
  InflateRectEx(ProgressBarRect, DX, DY, DX, DY);
  InflateRectEx(OverloadBarRect, DX, DY, DX, DY);
  InflateRectEx(PeakBarRect, DX, DY, DX, DY);
end;

procedure TcxCustomProgressBarViewInfo.Paint(ACanvas: TcxCanvas);
begin
  {$IFDEF VCL}
  if AreVisualStylesMustBeUsed(NativeStyle, totProgress) or
    IsInplace and Transparent then
  else
  {$ENDIF}
  begin
    DrawCustomEdit(ACanvas, Self, False, bpsSolid);
  end;
  PaintProgressBar(ACanvas);
end;

procedure TcxCustomProgressBarViewInfo.PaintProgressBar(ACanvas: TcxCanvas);
var
  R, FSolidRect, FRealSolidRect, FChunkRect: TRect;
  I, J, FRectWidth, FRectHeight, FOld, FModValue, FPercent: Integer;
  FBarText: string;
  FTextWidth, FTextHeight: Integer;
  FTM: TTextMetric;
  FLF: TLogFont;
  FLocalFont: TFont;
  FFontHandle: hFont;
  FBarWidth, FBarHeight : Integer;
  FPos, FMaxPos, FAbsolutePos: Integer;
  FRealBeginColor, FRealEndColor: TColor;
  FBmp, FChunkBmp, FTextBmp, FTextSavedBmp: TBitmap;
  FTextDeltaX, FTextDeltaY: Integer;
  FTopX, FDrawDelta: Integer;
  FTheme: TTheme;
  FBarThemeType, FChunkThemeType: Integer;
  FCondition: Boolean;
  FParentDC: HDC;
  FDrawProgressBarRect: TRect;
  FDrawOverloadBarRect: TRect;
  FDrawPeakBarRect: TRect;

  procedure PaintBarBevelOuter(ABBORect: TRect);
  begin
    if FBarBevelOuter = cxbvLowered then
    begin
      DrawEdge(FBmp.Canvas.Handle, ABBORect, BDR_SUNKENOUTER, BF_TOPLEFT);
      DrawEdge(FBmp.Canvas.Handle, ABBORect, BDR_SUNKENOUTER, BF_BOTTOMRIGHT);
    end;
    if FBarBevelOuter = cxbvRaised then
    begin
      DrawEdge(FBmp.Canvas.Handle, ABBORect, BDR_RAISEDINNER, BF_TOPLEFT);
      DrawEdge(FBmp.Canvas.Handle, ABBORect, BDR_RAISEDINNER, BF_BOTTOMRIGHT);
    end;
  end;

  function GetColor(const ABeginColor, AEndColor: TColor; const N, H: Integer): TColor;
  begin
    Result := RGB(Trunc(GetRValue(ABeginColor) + (GetRValue(AEndColor)-GetRValue(ABeginColor)) * N / H),
      Trunc(GetGValue(ABeginColor) + (GetGValue(AEndColor)-GetGValue(ABeginColor)) * N / H),
      Trunc(GetBValue(ABeginColor) + (GetBValue(AEndColor)-GetBValue(ABeginColor)) * N / H));
  end;

begin
  FBarWidth := RectWidth(BarRect);
  FBarHeight := RectHeight(BarRect);
  FDrawProgressBarRect := ProgressBarRect;
  FDrawOverloadBarRect := OverloadBarRect;
  FDrawPeakBarRect := PeakBarRect;
  if NativeStyle or IsInplace then
    FDrawDelta := 0
  else
    FDrawDelta := 2;
  if IsInplace then
  begin
    InflateRectEx(FDrawProgressBarRect, -BarRect.Left, -BarRect.Top, -BarRect.Left, -BarRect.Top);
    InflateRectEx(FDrawOverloadBarRect, -BarRect.Left, -BarRect.Top, -BarRect.Left, -BarRect.Top);
    InflateRectEx(FDrawPeakBarRect, -BarRect.Left, -BarRect.Top, -BarRect.Left, -BarRect.Top);
  end;
  FBmp := TBitmap.Create;
  FChunkBmp := TBitmap.Create;
  try
    FBmp.Width := FBarWidth + FDrawDelta;
    FBmp.Height := FBarHeight + FDrawDelta;
    {Draw Background section}

    if PropTransparent then
    begin
      if not IsInplace then
      begin
        GetWindowRect(WindowHandle, R);
        FParentDC := GetDCEx(GetDesktopWindow, 0,
          DCX_CACHE or DCX_CLIPSIBLINGS or DCX_LOCKWINDOWUPDATE);
        BitBlt(FBmp.Canvas.Handle, 0, 0,
          FBmp.Width, FBmp.Height,
          FParentDC, R.Left, R.Top, SRCCOPY);
      end
      else
      begin
        BitBlt(FBmp.Canvas.Handle, 0, 0,
          FBarWidth, FBarHeight,
          ACanvas.Handle, BarRect.Left, BarRect.Top, SRCCOPY);
      end;
    end;

    if not PropTransparent then
    begin
      FBmp.Canvas.Brush.Style := bsSolid;
      FBmp.Canvas.Brush.Color := BackgroundColor;
      FBmp.Canvas.FillRect(Rect(0, 0, FBmp.Width, FBmp.Height));
    end;

    if NativeStyle then
    begin
      FTheme := OpenTheme(totProgress);
      if FOrientation = cxorHorizontal then
      begin
        FBarThemeType := PP_BAR;
        FChunkThemeType := PP_CHUNK;
        FChunkBmp.Width := 1;
        if RectHeight(FDrawProgressBarRect) < 0 then
          FChunkBmp.Height := 0
        else
          FChunkBmp.Height := RectHeight(FDrawProgressBarRect);
        FChunkRect := FChunkBmp.Canvas.ClipRect;
        FChunkRect.Left := -4;
      end
      else
      begin
        FBarThemeType := PP_BARVERT;
        FChunkThemeType := PP_CHUNKVERT;
        FChunkBmp.Height := 1;
        if RectWidth(FDrawProgressBarRect) < 0 then
          FChunkBmp.Width := 0
        else
          FChunkBmp.Width := RectWidth(FDrawProgressBarRect);
        FChunkRect := FChunkBmp.Canvas.ClipRect;
        FChunkRect.Top := -4;
      end;
      if not PropTransparent then
        DrawThemeBackground(FTheme, FBmp.Canvas.Handle, FBarThemeType, 1, @BarRect);
      DrawThemeBackground(FTheme, FChunkBmp.Canvas.Handle, FChunkThemeType, 1, @FChunkRect);
    end;

    if FRealShowOverload = False then
      FSolidRect := FDrawProgressBarRect
    else
    begin
      if FOrientation = cxorHorizontal then
        FSolidRect := Rect(FDrawProgressBarRect.Left, FDrawProgressBarRect.Top,
          FDrawOverloadBarRect.Right, FDrawOverloadBarRect.Bottom)
       else
        FSolidRect := Rect(FDrawOverloadBarRect.Left, FDrawOverloadBarRect.Top,
          FDrawProgressBarRect.Right, FDrawProgressBarRect.Bottom)
    end;
    {FRealSolidRect neeed only for draw inverted Text under rectangles}
    FRealSolidRect := FSolidRect;

    if NativeStyle then
    begin
      if FBarStyle = cxbsSolid then
        FBarStyle := cxbsGradient
      else
        if FBarStyle = cxbsLEDs then
          FBarStyle := cxbsGradientLEDs;
    end;

    if FBarStyle = cxbsSolid then
    begin
      FBmp.Canvas.Brush.Color := FBeginColor;
      if FRealShowOverload = False then
        FBmp.Canvas.FillRect(FSolidRect)
      else
      begin
        FBmp.Canvas.FillRect(FDrawProgressBarRect);
        FBmp.Canvas.Brush.Color := FOverloadBeginColor;
        FBmp.Canvas.FillRect(FDrawOverloadBarRect);
      end;
      PaintBarBevelOuter(FSolidRect);
    end;

    if FBarStyle = cxbsGradient then begin
      FRealBeginColor := FBeginColor;
      FRealEndColor := FEndColor;
      if FOrientation = cxorHorizontal then
      begin
        for I := FSolidRect.Left to FSolidRect.Right - 1 do
        begin
          FPos := I - FSolidRect.Left;
          if NativeStyle then
            BitBlt(FBmp.Canvas.Handle, I, FSolidRect.Top, FChunkBmp.Width, FChunkBmp.Height,
              FChunkBmp.Canvas.Handle, 0, 0, SRCCOPY)
          else
          begin
            FMaxPos := FBarWidth;
            if (FRealShowOverload = True) and (FPos >= FDrawOverloadBarRect.Left - 1) then
            begin
              FPos := (I - FDrawOverloadBarRect.Left);
              FMaxPos := FDrawOverloadBarRect.Left;
              FRealBeginColor := FOverloadBeginColor;
              FRealEndColor := FOverloadEndColor;
            end;
            FBmp.Canvas.Pen.Color := GetColor(FRealBeginColor, FRealEndColor, FPos, FMaxPos);
            FBmp.Canvas.MoveTo(I, FSolidRect.Top);
            FBmp.Canvas.LineTo(I, FSolidRect.Bottom);
          end;
        end;
      end else
      begin
        for I := FSolidRect.Bottom - 1 downto FSolidRect.Top do
        begin
          FPos := FSolidRect.Bottom - I;
          if NativeStyle then
            BitBlt(FBmp.Canvas.Handle, FSolidRect.Left, I, FChunkBmp.Width, FChunkBmp.Height,
              FChunkBmp.Canvas.Handle, 0, 0, SRCCOPY)
          else
          begin
            FMaxPos := FBarHeight;
            if (FRealShowOverload = True) and (I < FDrawOverloadBarRect.Bottom) then
            begin
              FPos := (FDrawOverloadBarRect.Bottom - I);
              FMaxPos := FDrawOverloadBarRect.Bottom;
              FRealBeginColor := FOverloadBeginColor;
              FRealEndColor := FOverloadEndColor;
            end;
            FBmp.Canvas.Pen.Color := GetColor(FRealBeginColor, FRealEndColor, FPos, FMaxPos);
            FBmp.Canvas.MoveTo(FSolidRect.Left, I);
            FBmp.Canvas.LineTo(FSolidRect.Right, I);
          end;
        end;
      end;
      PaintBarBevelOuter(FSolidRect);
    end;

    if FBarStyle = cxbsLEDs then
    begin
      FOld := 0;
      FRealBeginColor := FBeginColor;
      if FOrientation = cxorHorizontal then
      begin
        FRectWidth := Trunc(FBarHeight * 2 / 3) + 2;
        for I := FSolidRect.Left to FSolidRect.Right - 1 do
          if (((I - FSolidRect.Left) mod FRectWidth) = 0) and (I - FRectWidth >= FSolidRect.Left) then
          begin
            if (FRealShowOverload = True) and (I >= FDrawOverloadBarRect.Left - 1) then
              FRealBeginColor := FOverloadBeginColor;

            FBmp.Canvas.Pen.Color := FRealBeginColor;
            FBmp.Canvas.Brush.Color := FRealBeginColor;

            //
            // The leds...
            //
            FBmp.Canvas.FillRect(Rect(I - FRectWidth, FSolidRect.Top, I - 2, FSolidRect.Bottom));
            PaintBarBevelOuter(Rect(I - FRectWidth, FSolidRect.Top, I - 2, FSolidRect.Bottom));
            FOld := I;
            FRealSolidRect.Right := I - 2;

            //
            // Partial rect in the right.
            //
            if FSolidRect.Right - I - 2 < FRectWidth then
            begin
              FBmp.Canvas.FillRect(Rect(I, FSolidRect.Top, FSolidRect.Right, FSolidRect.Bottom));
              PaintBarBevelOuter(Rect(I, FSolidRect.Top, FSolidRect.Right, FSolidRect.Bottom));
            end;
          end;
        if FPosition >= FMax then
        begin
          if (FRealShowOverload = True) then FRealBeginColor := FOverloadBeginColor;
          FBmp.Canvas.Pen.Color := FRealBeginColor;
          FBmp.Canvas.Brush.Color := FRealBeginColor;
          FBmp.Canvas.FillRect(Rect(FOld, FSolidRect.Top, FSolidRect.Right, FSolidRect.Bottom));
          PaintBarBevelOuter(Rect(FOld, FSolidRect.Top, FSolidRect.Right, FSolidRect.Bottom));
        end;
      end
      else
      begin
        FRectHeight := Trunc(FBarWidth * 2 / 3) + 2;
        for I := FSolidRect.Bottom - 1 downto FSolidRect.Top do
          if (((FSolidRect.Bottom - I - 1) mod FRectHeight) = 0) and
            (I + FRectHeight <= FSolidRect.Bottom) then
          begin
            if (FRealShowOverload = True) and (I < FDrawOverloadBarRect.Bottom) then
              FRealBeginColor := FOverloadBeginColor;

            FBmp.Canvas.Pen.Color := FRealBeginColor;
            FBmp.Canvas.Brush.Color := FRealBeginColor;

            FBmp.Canvas.FillRect(Rect(FSolidRect.Left, I + 2, FSolidRect.Right, I + FRectHeight));
            PaintBarBevelOuter(Rect(FSolidRect.Left, I + 2, FSolidRect.Right, I + FRectHeight));

            FOld := I;
            FRealSolidRect.Top := I + 2;

            if I - FSolidRect.Top  < FRectHeight then
            begin
              FBmp.Canvas.FillRect(Rect(FSolidRect.Left, FSolidRect.Top, FSolidRect.Right, I));
              PaintBarBevelOuter(Rect(FSolidRect.Left, FSolidRect.Top, FSolidRect.Right, I));
            end;
          end;
        if FPosition >= FMax then
        begin
          if (FRealShowOverload = True) then FRealBeginColor := FOverloadBeginColor;
          FBmp.Canvas.Pen.Color := FRealBeginColor;
          FBmp.Canvas.Brush.Color := FRealBeginColor;
          FBmp.Canvas.FillRect(Rect(FSolidRect.Left, FSolidRect.Top, FSolidRect.Right, FOld));
          PaintBarBevelOuter(Rect(FSolidRect.Left, FSolidRect.Top, FSolidRect.Right, FOld));
        end;
      end;
    end;

    if FBarStyle = cxbsGradientLEDs then
    begin
      FOld := 0;
      FRealBeginColor := FBeginColor;
      FRealEndColor := FEndColor;
      if FOrientation = cxorHorizontal then
      begin
        FRectWidth := Trunc(RectHeight(FSolidRect) * 2 / 3) + 2;
        for I := FSolidRect.Left to FSolidRect.Right - 1 do
        begin
          FModValue := (I - FSolidRect.Left) mod FRectWidth;
          FCondition := (FModValue = 0);
          if FCondition and (I - FRectWidth >= FSolidRect.Left) then
          begin
            FPos := I - FSolidRect.Left;
            if NativeStyle then
            begin
              if I - FRectWidth >= FSolidRect.Left then
                for J := (I - FRectWidth) to (I - 3) do
                  BitBlt(FBmp.Canvas.Handle, J, FSolidRect.Top, FChunkBmp.Width, FChunkBmp.Height,
                    FChunkBmp.Canvas.Handle, 0, 0, SRCCOPY);

              if FSolidRect.Right - I - 2 < FRectWidth then
              begin
                for J := I to FSolidRect.Right do
                  BitBlt(FBmp.Canvas.Handle, J, FSolidRect.Top, FChunkBmp.Width, FChunkBmp.Height,
                    FChunkBmp.Canvas.Handle, 0, 0, SRCCOPY);
              end;
            end
            else
            begin
              FMaxPos := FBarWidth;
              if (FRealShowOverload = True) and (FPos >= FDrawOverloadBarRect.Left - 1) then
              begin
                FPos := (I - FDrawOverloadBarRect.Left);
                FMaxPos := FDrawOverloadBarRect.Left;
                FRealBeginColor := FOverloadBeginColor;
                FRealEndColor := FOverloadEndColor;
              end;
              FBmp.Canvas.Pen.Color := GetColor(FRealBeginColor, FRealEndColor, FPos, FMaxPos);
              FBmp.Canvas.Brush.Color := FBmp.Canvas.Pen.Color;

              //
              // The leds...
              //
              FBmp.Canvas.FillRect(Rect(I - FRectWidth, FSolidRect.Top, I - 2, FSolidRect.Bottom));
              PaintBarBevelOuter(Rect(I - FRectWidth, FSolidRect.Top, I - 2, FSolidRect.Bottom));
              FRealSolidRect.Right := I - 2;

              //
              // Partial rect
              //
              if FSolidRect.Right - I - 2 < FRectWidth then
              begin
                FBmp.Canvas.FillRect(Rect(I, FSolidRect.Top, FSolidRect.Right, FSolidRect.Bottom));
                PaintBarBevelOuter(Rect(I, FSolidRect.Top, FSolidRect.Right, FSolidRect.Bottom));
              end;
            end;
            FOld := I;
          end;
        end;
        if (FPosition >= FMax) then
        begin
          if NativeStyle then
          begin
            for J := FOld to FSolidRect.Right - 1 do
              BitBlt(FBmp.Canvas.Handle, J, FSolidRect.Top, FChunkBmp.Width, FChunkBmp.Height,
                FChunkBmp.Canvas.Handle, 0, 0, SRCCOPY);
          end
          else
          begin
            if (FRealShowOverload = True) then
            begin
              FRealBeginColor := FOverloadBeginColor;
              FRealEndColor := FOverloadEndColor;
            end;
            FBmp.Canvas.Pen.Color := GetColor(FRealBeginColor, FRealEndColor, FOld - FSolidRect.Left, FBarWidth);
            FBmp.Canvas.Brush.Color := GetColor(FRealBeginColor, FRealEndColor, FOld - FSolidRect.Left, FBarWidth);
            FBmp.Canvas.FillRect(Rect(FOld, FSolidRect.Top, FSolidRect.Right, FSolidRect.Bottom));
            PaintBarBevelOuter(Rect(FOld, FSolidRect.Top, FSolidRect.Right, FSolidRect.Bottom));
          end;
        end;
      end
      else
      begin
        FRectHeight := Trunc(RectWidth(FSolidRect) * 2 / 3) + 2;
        for I := FSolidRect.Bottom - 1 downto FSolidRect.Top do
        begin
          FModValue := (FSolidRect.Bottom - I - 1) mod FRectHeight;
          FCondition := (FModValue = 0);
          if FCondition and (I + FRectHeight <= FSolidRect.Bottom) then
          begin
            FPos := FSolidRect.Bottom - I;
            if NativeStyle then
            begin
              if I + FRectHeight <= FSolidRect.Bottom then
                for J := (I + 3) to I + FRectHeight do
                  BitBlt(FBmp.Canvas.Handle, FSolidRect.Left, J, FChunkBmp.Width, FChunkBmp.Height,
                    FChunkBmp.Canvas.Handle, 0, 0, SRCCOPY);

              if I - FSolidRect.Top  < FRectHeight then
              begin
                for J := FSolidRect.Top to I do
                  BitBlt(FBmp.Canvas.Handle, FSolidRect.Left, J, FChunkBmp.Width, FChunkBmp.Height,
                    FChunkBmp.Canvas.Handle, 0, 0, SRCCOPY);
              end;
            end
            else
            begin
              FMaxPos := FBarHeight;
              if (FRealShowOverload = True) and (I < FDrawOverloadBarRect.Bottom) then
              begin
                FPos := (FDrawOverloadBarRect.Bottom - I);
                FMaxPos := FDrawOverloadBarRect.Bottom;
                FRealBeginColor := FOverloadBeginColor;
                FRealEndColor := FOverloadEndColor;
              end;
              FBmp.Canvas.Pen.Color := GetColor(FRealBeginColor, FRealEndColor, FPos, FMaxPos);
              FBmp.Canvas.Brush.Color := GetColor(FRealBeginColor, FRealEndColor, FPos, FMaxPos);
              FBmp.Canvas.FillRect(Rect(FSolidRect.Left, I + 2, FSolidRect.Right, I + FRectHeight));
              PaintBarBevelOuter(Rect(FSolidRect.Left, I + 2, FSolidRect.Right, I + FRectHeight));
              FRealSolidRect.Top := I + 2;

              if I - FSolidRect.Top  < FRectHeight then
              begin
                FBmp.Canvas.FillRect(Rect(FSolidRect.Left, FSolidRect.Top, FSolidRect.Right, I));
                PaintBarBevelOuter(Rect(FSolidRect.Left, FSolidRect.Top, FSolidRect.Right, I));
              end;
            end;
            FOld := I;
          end;
        end;
        if (FPosition >= FMax) then
        begin
          if NativeStyle then
          begin
            for J := FSolidRect.Top to FOld do
              BitBlt(FBmp.Canvas.Handle, FSolidRect.Left, J, FChunkBmp.Width, FChunkBmp.Height,
                FChunkBmp.Canvas.Handle, 0, 0, SRCCOPY);
          end
          else
          begin
            if (FRealShowOverload = True) then
            begin
              FRealBeginColor := FOverloadBeginColor;
              FRealEndColor := FOverloadEndColor;
            end;
            FBmp.Canvas.Pen.Color := GetColor(FRealBeginColor, FRealEndColor, FSolidRect.Bottom - FOld, FBarHeight);
            FBmp.Canvas.Brush.Color := GetColor(FRealBeginColor, FRealEndColor, FSolidRect.Bottom - FOld, FBarHeight);
            FBmp.Canvas.FillRect(Rect(FSolidRect.Left, FSolidRect.Top, FSolidRect.Right, FOld));
            PaintBarBevelOuter(Rect(FSolidRect.Left, FSolidRect.Top, FSolidRect.Right, FOld));
          end;
        end;
      end;
    end;

    if ((FBarStyle = cxbsBitmap) or (FBarStyle = cxbsBitmapLEDs)) and
      (FForegroundImage.Width > 0) and (FForegroundImage.Height > 0) then
    begin
      FBmp.Canvas.Brush.Bitmap := FForegroundImage;
      if FBarStyle = cxbsBitmap then
        FBmp.Canvas.FillRect(FSolidRect)
      else
      begin
        if FOrientation = cxorHorizontal then
        begin
          FRectWidth := FForegroundImage.Width;
          if FRectWidth > RectHeight(FSolidRect) then
            FRectWidth := RectHeight(FSolidRect);
          for I := FSolidRect.Left to FSolidRect.Right - 1 do
            if (((I - FSolidRect.Left) mod (FRectWidth + 2)) = 0) then
            begin
              FRealSolidRect.Right := I - 2;
              FBmp.Canvas.FillRect(FRealSolidRect);
              FRealSolidRect.Left := I;

              if FSolidRect.Right - I - 2 < FRectWidth then
                FBmp.Canvas.FillRect(Rect(I, FSolidRect.Top, FSolidRect.Right, FSolidRect.Bottom));
            end;
          if FPosition = FMax then
          begin
            FRealSolidRect.Right := FSolidRect.Right;
            FBmp.Canvas.FillRect(FRealSolidRect);
          end;
        end
        else
        begin
          FRectHeight := FForegroundImage.Height;
          if FRectHeight > RectWidth(FSolidRect) then
            FRectHeight := RectWidth(FSolidRect);
          for I := FSolidRect.Bottom - 1 downto FSolidRect.Top do
            if (((FSolidRect.Bottom - I - 1) mod (FRectHeight - 2)) = 0) then
            begin
              FRealSolidRect.Top := I + 2;
              FBmp.Canvas.FillRect(FRealSolidRect);
              FRealSolidRect.Bottom := I;

              if I - FSolidRect.Top  < FRectHeight then
                FBmp.Canvas.FillRect(Rect(FSolidRect.Left, FSolidRect.Top, FSolidRect.Right, I));
            end;
          if FPosition = FMax then
          begin
            FRealSolidRect.Top := FSolidRect.Top;
            FBmp.Canvas.FillRect(FRealSolidRect);
          end;
        end;
      end;
    end;

    if FRealShowPeak = True then
    begin
      FBmp.Canvas.Brush.Color := FPeakColor;
      FBmp.Canvas.FillRect(FDrawPeakBarRect);
    end;

    if FShowText then
    begin
      if FShowTextStyle = cxtsPosition then
        FBarText := IntToStr(FPosition);
      if FShowTextStyle = cxtsPercent then
      begin
        FPercent := Round((FPosition-FMin) / MaxMinDiff(FMax, FMin) * 100);
        if FPercent > 100 then FPercent := 100;
        FBarText := IntToStr(FPercent)+ ' %';
      end;
      FBmp.Canvas.Font.Assign(Font);
      FBmp.Canvas.Font.Color := TextColor;
      FBmp.Canvas.Brush.Style := bsClear;
      FTextWidth := FBmp.Canvas.TextWidth(FBarText);
      FTextHeight := FBmp.Canvas.TextHeight(FBarText);
      if TextOrientation = cxorHorizontal then
      begin
        FTextDeltaX := ((FBarWidth - FTextWidth) div 2) + FDrawDelta;
        FTextDeltaY := ((FBarHeight - FTextHeight) div 2) + FDrawDelta;
        if (FTextDeltaX < FRealSolidRect.Right) and (SolidTextColor = False) then
        begin
          FTextBmp := TBitmap.Create;
          FTextSavedBmp := TBitmap.Create;
          try
            if (FRealSolidRect.Right - FTextDeltaX) < FTextWidth then
              FTextBmp.Width := (FRealSolidRect.Right - FTextDeltaX)
            else
              FTextBmp.Width := FTextWidth;
            FTextBmp.Height := FTextHeight;
            FTextSavedBmp.Width := FTextBmp.Width;
            FTextSavedBmp.Height := FTextHeight;
            FTextBmp.Canvas.Font.Assign(FBmp.Canvas.Font);
            FTextBmp.Canvas.Font.Color := clBlack;
            FTextBmp.Canvas.Brush.Color := clWhite;
            FTextBmp.Canvas.FillRect(FTextBmp.Canvas.ClipRect);
            FTextBmp.Canvas.TextOut(0, 0, FBarText);
            {Save original Background under Text}
            BitBlt(FTextSavedBmp.Canvas.Handle, 0, 0, FTextBmp.Width, FTextHeight,
              FBmp.Canvas.Handle, FTextDeltaX, FTextDeltaY, SRCCOPY);
            {Draw Inverted Background on Text}
            BitBlt(FTextBmp.Canvas.Handle, 0, 0, FTextBmp.Width, FTextHeight,
              FBmp.Canvas.Handle, FTextDeltaX, FTextDeltaY, DSTINVERT);
            FBmp.Canvas.TextOut(FTextDeltaX, FTextDeltaY, FBarText);
            FBmp.Canvas.CopyMode := cmSrcCopy;
            {Restore original Background}
            FBmp.Canvas.Draw(FTextDeltaX, FTextDeltaY, FTextSavedBmp);
            FBmp.Canvas.CopyMode := cmSrcInvert;
            {Draw inverted Text}
            FBmp.Canvas.Draw(FTextDeltaX, FTextDeltaY, FTextBmp);
          finally
            FTextSavedBmp.Free;
            FTextBmp.Free;
          end;
        end
        else
          FBmp.Canvas.TextOut(FTextDeltaX, FTextDeltaY, FBarText);
      end;
      if TextOrientation = cxorVertical then
      begin
        FLocalFont := TFont.Create;
        FLocalFont.Assign(Font);
        GetTextMetrics(FLocalFont.Handle, FTM);
        if (FTM.tmPitchAndFamily and TMPF_TRUETYPE) = 0 then
          FLocalFont.Name := 'Arial';
        GetObject(FLocalFont.Handle, SizeOf(FLF), @FLF);
        FLF.lfEscapement := 2700;
        FFontHandle := CreateFontIndirect(FLF);
        FBmp.Canvas.Font.Handle := FFontHandle;
        FTextDeltaX := FTextHeight + ((FBarWidth - FTextHeight) div 2) + FDrawDelta;
        FTextDeltaY := (FBarHeight - FTextWidth) div 2 + FDrawDelta;
        if (FRealSolidRect.Top < (FTextDeltaY + FTextWidth)) and (SolidTextColor = False) then
        begin
          FTextBmp := TBitmap.Create;
          FTextSavedBmp := TBitmap.Create;
          try
            FTextBmp.Height := FTextWidth;
            FTextBmp.Width := FTextHeight;
            FTextSavedBmp.Width := FTextBmp.Width;
            FTextSavedBmp.Height := FTextBmp.Height;
            FTextBmp.Canvas.Font.Assign(FBmp.Canvas.Font);
            FTextBmp.Canvas.Font.Color := clBlack;
            FTextBmp.Canvas.Brush.Color := clWhite;
            FTextBmp.Canvas.FillRect(FTextBmp.Canvas.ClipRect);
            if FRealSolidRect.Top < FTextDeltaY then
            begin
              FTextBmp.Canvas.TextOut(FTextBmp.Width, 0, FBarText);
              FTopX := FTextDeltaY;
            end else
            begin
              FTextBmp.Canvas.TextOut(FTextBmp.Width, FTextDeltaY - FRealSolidRect.Top, FBarText);
              FTopX := FRealSolidRect.Top;
            end;
            {Save original Background under Text}
            BitBlt(FTextSavedBmp.Canvas.Handle, 0, 0, FTextBmp.Width, FTextBmp.Height,
                   FBmp.Canvas.Handle, FTextDeltaX - FTextBmp.Width, FTopX, SRCCOPY);
            {Draw Inverted Background on Text}
            BitBlt(FTextBmp.Canvas.Handle, 0, 0, FTextBmp.Width, FTextBmp.Height,
                   FBmp.Canvas.Handle, FTextDeltaX - FTextBmp.Width, FTopX, DSTINVERT);
            FBmp.Canvas.TextOut(FTextDeltaX, FTextDeltaY, FBarText);
            FBmp.Canvas.CopyMode := cmSrcCopy;
            {Restore original Background}
            FBmp.Canvas.Draw(FTextDeltaX - FTextBmp.Width, FTopX, FTextSavedBmp);
            FBmp.Canvas.CopyMode := cmSrcInvert;
            {Draw inverted Text}
            FBmp.Canvas.Draw(FTextDeltaX - FTextBmp.Width, FTopX, FTextBmp);
          finally
            FTextSavedBmp.Free;
            FTextBmp.Free;
          end;
        end
        else
          FBmp.Canvas.TextOut(FTextDeltaX, FTextDeltaY, FBarText);

        FLocalFont.Free;
      end;
    end;
    BitBlt(ACanvas.Canvas.Handle, BarRect.Left, BarRect.Top,
      FBarWidth, FBarHeight,
      FBmp.Canvas.Handle, FDrawDelta, FDrawDelta, SRCCOPY);
  finally
    FChunkBmp.Free;
    FBmp.Free;
  end;
end;
{ TcxCustomProgressBarViewInfo }

{ TcxCustomProgressBarViewData }
procedure TcxCustomProgressBarViewData.CalculateViewInfoProperties(AViewInfo: TcxCustomEditViewInfo);
begin
  with TcxCustomProgressBarViewInfo(AViewInfo) do
  begin
    BeginColor := Properties.BeginColor;
    EndColor := Properties.EndColor;
    BarBevelOuter := Properties.BarBevelOuter;
    Min := Properties.Min;
    Max := Properties.Max;
    Orientation := Properties.Orientation;
    ShowText := Properties.ShowText;
    ShowTextStyle := Properties.ShowTextStyle;
    TextOrientation := Properties.TextOrientation;
    SolidTextColor := Properties.SolidTextColor;
    BarStyle := Properties.BarStyle;
    BorderWidth := Properties.BorderWidth;
    OverloadValue := Properties.OverloadValue;
    OverloadBeginColor := Properties.OverloadBeginColor;
    OverloadEndColor := Properties.OverloadEndColor;
    ShowOverload := Properties.ShowOverload;
    PeakValue := Properties.GetRealPeakValue;
    PeakColor := Properties.PeakColor;
    PeakSize := Properties.PeakSize;
    ShowPeak := Properties.ShowPeak;
    Position := Properties.FCurrentPosition;
    if IsInplace then
      PropTransparent := Transparent
    else
      PropTransparent := Properties.Transparent;
  end;
end;

procedure TcxCustomProgressBarViewData.Calculate(ACanvas: TcxCanvas; const ABounds: TRect;
  const P: TPoint; Button: TcxMouseButton; Shift: TShiftState; AViewInfo: TcxCustomEditViewInfo;
  AIsMouseEvent: Boolean);
var
  FBounds : TRect;
  FViewInfo : TcxCustomProgressBarViewInfo;
  FRealNativeStyle: Boolean;
  FBmp: TBitmap;
begin
  inherited Calculate(ACanvas, ABounds, P, Button, Shift, AViewInfo, AIsMouseEvent);
  if (ABounds.Bottom = MaxInt) or (ABounds.Right = MaxInt) then Exit;

  FViewInfo := TcxCustomProgressBarViewInfo(AViewInfo);
  CalculateCustomEditViewInfo(Self, FViewInfo, AIsMouseEvent);
  FViewInfo.Font := Style.Font;
  CalculateViewInfoProperties(AViewInfo);
  {$IFDEF VCL}
  if AreVisualStylesMustBeUsed(NativeStyle, totProgress) then
  begin
    FBounds := ABounds;
    FRealNativeStyle := True;
    FViewInfo.BarRect := ABounds;
    if IsInplace then
      InflateRectEx(FBounds, (AViewInfo.BorderWidth + 2), (AViewInfo.BorderWidth + 2),
        -(AViewInfo.BorderWidth + 2), -(AViewInfo.BorderWidth + 2))
    else
      InflateRectEx(FBounds, (AViewInfo.BorderWidth + 3), (AViewInfo.BorderWidth + 3),
        -(AViewInfo.BorderWidth + 2), -(AViewInfo.BorderWidth + 2));
    FViewInfo.ProgressBarRect := FBounds;
  end
  else
  {$ENDIF}
  begin
    if IsInplace then
      FViewInfo.BarRect := ABounds
    else
      FViewInfo.BarRect := FViewInfo.BorderRect;
    FBounds := FViewInfo.BorderRect;
    FRealNativeStyle := False;
    InflateRect(FBounds, -AViewInfo.BorderWidth, -AViewInfo.BorderWidth);
    FViewInfo.ProgressBarRect := FBounds;
  end;
  FViewInfo.NativeStyle := FRealNativeStyle;
  CalculateCustomProgressBarViewInfo(ACanvas, Self, FViewInfo);

  if FViewInfo.FOrientation = cxorHorizontal then
    FViewInfo.ProgressBarRect.Right := FBounds.Left +
      CalculateDelta(FViewInfo.Position - FViewInfo.Min, RectWidth(FBounds),
        MaxMinDiff(FViewInfo.Max, FViewInfo.Min))
  else
    FViewInfo.ProgressBarRect.Top := FBounds.Bottom -
      CalculateDelta((FViewInfo.Position - FViewInfo.Min), RectHeight(FBounds),
        MaxMinDiff(FViewInfo.Max, FViewInfo.Min));

  FViewInfo.FRealShowOverload := False;
  if (Properties.ShowOverload) and (not FRealNativeStyle) and
    (FViewInfo.Position >= FViewInfo.OverloadValue) then
  begin
    FViewInfo.FRealShowOverload := True;
    FViewInfo.OverloadBarRect := FViewInfo.ProgressBarRect;
    if FViewInfo.FOrientation = cxorHorizontal then
    begin
      FViewInfo.OverloadBarRect.Left := FBounds.Left +
        CalculateDelta(FViewInfo.OverloadValue - FViewInfo.Min, RectWidth(FBounds),
          MaxMinDiff(FViewInfo.Max, FViewInfo.Min));
      if FViewInfo.OverloadBarRect.Right > FBounds.Right then
        FViewInfo.OverloadBarRect.Right := FBounds.Right;
      FViewInfo.ProgressBarRect.Right := FViewInfo.OverloadBarRect.Left;
    end else
    begin
      FViewInfo.OverloadBarRect.Top := FViewInfo.OverloadBarRect.Bottom -
        CalculateDelta(FViewInfo.Position - FViewInfo.Min, RectHeight(FBounds),
          MaxMinDiff(FViewInfo.Max, FViewInfo.Min));
      FViewInfo.OverloadBarRect.Bottom := FViewInfo.OverloadBarRect.Bottom -
        CalculateDelta(FViewInfo.OverloadValue - FViewInfo.Min, RectHeight(FBounds),
          MaxMinDiff(FViewInfo.Max, FViewInfo.Min));
      if FViewInfo.OverloadBarRect.Bottom < FBounds.Top then
        FViewInfo.OverloadBarRect.Bottom := FBounds.Top;
      FViewInfo.ProgressBarRect.Top := FViewInfo.OverloadBarRect.Bottom;
    end;
  end;

  FViewInfo.FRealShowPeak := FViewInfo.ShowPeak;
  FViewInfo.PeakBarRect := FViewInfo.ProgressBarRect;
  if FViewInfo.FOrientation = cxorHorizontal then
  begin
    FViewInfo.PeakBarRect.Left := FBounds.Left +
      CalculateDelta(FViewInfo.PeakValue - FViewInfo.Min, RectWidth(FBounds),
        MaxMinDiff(FViewInfo.Max, FViewInfo.Min));
    if (FViewInfo.PeakBarRect.Left + FViewInfo.PeakSize) > FBounds.Right then
      FViewInfo.PeakBarRect.Left := FBounds.Right - FViewInfo.PeakSize;
    FViewInfo.PeakBarRect.Right := FViewInfo.PeakBarRect.Left + FViewInfo.PeakSize;
  end
  else
  begin
    FViewInfo.PeakBarRect.Bottom := FBounds.Bottom -
      CalculateDelta(FViewInfo.PeakValue - FViewInfo.Min, RectHeight(FBounds),
        MaxMinDiff(FViewInfo.Max, FViewInfo.Min));
    if (FViewInfo.PeakBarRect.Bottom - FViewInfo.PeakSize) < FBounds.Top then
      FViewInfo.PeakBarRect.Bottom := FBounds.Top + FViewInfo.PeakSize;
    FViewInfo.PeakBarRect.Top := FViewInfo.PeakBarRect.Bottom - FViewInfo.PeakSize;
  end;

  FViewInfo.ForegroundImage.Assign(Properties.ForegroundImage);
  if Properties.TransparentImage then
  begin
    FBmp := TBitmap.Create;
    try
      FViewInfo.ForegroundImage.Transparent := True;
      FBmp.Width := FViewInfo.ForegroundImage.Width;
      FBmp.Height := FViewInfo.ForegroundImage.Height;
      FBmp.Canvas.Brush.Color := FViewInfo.BackgroundColor;
      FBmp.Canvas.FillRect(FBmp.Canvas.ClipRect);
      FBmp.Canvas.Draw(0, 0, FViewInfo.ForegroundImage);
      FViewInfo.ForegroundImage.Assign(FBmp);
    finally
      FBmp.Free;
    end;
  end;

  if not IsInplace then FViewInfo.ClientRect := ABounds;
  if not IsInplace then FViewInfo.DrawSelectionBar := False;
end;

procedure TcxCustomProgressBarViewData.EditValueToDrawValue(ACanvas: TcxCanvas;
  const AEditValue: TcxEditValue; AViewInfo: TcxCustomEditViewInfo);
var
  ADisplayValue: TcxEditValue;
begin
  inherited;
  CalculateCustomProgressBarViewInfo(ACanvas, Self,
    TcxCustomProgressBarViewInfo(AViewInfo));
  Properties.PrepareDisplayValue(AEditValue, ADisplayValue, InternalFocused);
  TcxCustomProgressBarViewInfo(AViewInfo).Position := ADisplayValue;
end;

function TcxCustomProgressBarViewData.InternalGetEditConstantPartSize(ACanvas: TcxCanvas;
  AIsInplace: Boolean; const AEditSizeProperties: TcxEditSizeProperties;
  var MinContentSize: TSize; AViewInfo: TcxCustomEditViewInfo): TSize;
var
  ASize1, ASize2: TSize;
  AText: TCaption;
begin
  Result := inherited InternalGetEditConstantPartSize(ACanvas, AIsInplace,
    AEditSizeProperties, MinContentSize, AViewInfo);

  with TcxCustomProgressBarViewInfo(AViewInfo) do
  begin
    ASize1.cx := RectWidth(ProgressBarRect);
    ASize1.cy := RectHeight(ProgressBarRect);

    if not(IsInplace{$IFDEF VCL} or AreVisualStylesMustBeUsed(AViewInfo.NativeStyle,
      totButton){$ENDIF}) then
    begin
      Inc(ASize1.cx, 4);
      Inc(ASize1.cy, 4);
    end;

    AText := '';
    ASize2 := GetTextEditContentSize(ACanvas, Self, AText,
      DrawTextFlagsTocxTextOutFlags(cxTextOutFlagsToDrawTextFlags(GetDrawTextFlags) and
        not(CXTO_CENTER_VERTICALLY or CXTO_BOTTOM) or CXTO_TOP), @AEditSizeProperties, False);
    Inc(ASize2.cx, 3);
    Inc(ASize1.cx, ASize2.cx);
    if ASize1.cy < ASize2.cy then
      ASize1.cy := ASize2.cy;
  end;
  Inc(Result.cx, ASize1.cx);
  Inc(Result.cy, ASize1.cy);
end;

function TcxCustomProgressBarViewData.GetDrawTextFlags: Integer;
begin
  Result := 0;
end;

function TcxCustomProgressBarViewData.GetIsEditClass: Boolean;
begin
  Result := False;
end;

function TcxCustomProgressBarViewData.GetProperties: TcxCustomProgressBarProperties;
begin
  Result := TcxCustomProgressBarProperties(FProperties);
end;

procedure TcxCustomProgressBarViewData.SetProperties(Value: TcxCustomProgressBarProperties);
begin
  FProperties := Value;
end;
{ TcxCustomProgressBarViewData }

{ TcxCustomProgressBarProperties }
constructor TcxCustomProgressBarProperties.Create(AOwner: TPersistent);
begin
  inherited Create(AOwner);
  FCurrentPosition := 0;
  FBeginColor := clNavy;
  FEndColor := clWhite;
  FBarBevelOuter := cxbvNone;
  FMin := 0;
  FMax := 100;
  FPeakValue := 0;
  FOverloadValue := 80;
  FPeakSize := 2;
  FOrientation := cxorHorizontal;
  FShowText := True;
  FShowTextStyle := cxtsPercent;
  FTextOrientation := cxorHorizontal;
  FSolidTextColor := False;
  FBarStyle := cxbsSolid;
  FTransparentImage := True;
  FOverloadValue := 80;
  FBorderWidth := 0;
  FShowOverload := False;
  FOverloadBeginColor := $008080FF;
  FOverloadEndColor := clFuchsia;
  FShowPeak := False;
  FPeakColor := clRed;
  FTransparent := False;
end;

destructor TcxCustomProgressBarProperties.Destroy;
begin
  if FForegroundImage <> nil then
    FreeAndNil(FForegroundImage);
  inherited Destroy;
end;

procedure TcxCustomProgressBarProperties.Assign(Source: TPersistent);
begin
  if Source is TcxCustomProgressBarProperties then
  begin
    BeginUpdate;
    try
      inherited Assign(Source);
      with Source as TcxCustomProgressBarProperties do
      begin
        Self.BeginColor := BeginColor;
        Self.BarBevelOuter := BarBevelOuter;
        Self.EndColor := EndColor;
        Self.ForegroundImage := ForegroundImage;
        Self.Min := Min;
        Self.Max := Max;
        Self.Orientation := Orientation;
        Self.ShowText := ShowText;
        Self.ShowTextStyle := ShowTextStyle;
        Self.TextOrientation := TextOrientation;
        Self.SolidTextColor := SolidTextColor;
        Self.BarStyle := BarStyle;
        Self.TransparentImage := TransparentImage;
        Self.BorderWidth := BorderWidth;
        Self.OverloadValue := OverloadValue;
        Self.ShowOverload := ShowOverload;
        Self.OverloadBeginColor := OverloadBeginColor;
        Self.OverloadEndColor := OverloadEndColor;
        Self.PeakValue := PeakValue;
        Self.ShowPeak := ShowPeak;
        Self.PeakColor := PeakColor;
        Self.PeakSize := PeakSize;
      end;
    finally
      EndUpdate;
    end
  end
  else
    inherited Assign(Source);
end;

class function TcxCustomProgressBarProperties.GetContainerClass: TcxContainerClass;
begin
  Result := TcxProgressBar;
end;

function TcxCustomProgressBarProperties.GetDisplayText(const AEditValue: TcxEditValue;
  AFullText: Boolean = False): WideString;
var
  ADisplayValue: TcxEditValue;
begin
  PrepareDisplayValue(AEditValue, ADisplayValue, False);
  if FShowTextStyle = cxtsPercent then
    ADisplayValue := VarToStr(ADisplayValue) + ' %';
  Result := VarToStr(ADisplayValue);
end;

class function TcxCustomProgressBarProperties.GetStyleClass: TcxContainerStyleClass;
begin
  Result := TcxProgressBarStyle;
end;

function TcxCustomProgressBarProperties.GetSupportedOperations: TcxEditSupportedOperations;
begin
  Result := [esoAlwaysHotTrack, esoFiltering, esoSorting];
end;

class function TcxCustomProgressBarProperties.GetViewInfoClass: TcxContainerViewInfoClass;
begin
  Result := TcxCustomProgressBarViewInfo;
end;

function TcxCustomProgressBarProperties.IsEditValueValid(var EditValue: TcxEditValue;
  AEditFocused: Boolean): Boolean;
begin
  Result := inherited IsEditValueValid(EditValue, AEditFocused);
end;

procedure TcxCustomProgressBarProperties.PrepareDisplayValue(const AEditValue:
  TcxEditValue; var DisplayValue: TcxEditValue; AEditFocused: Boolean);
begin
  LockUpdate(True);
  try
    if IsVarEmpty(AEditValue) or
       not (VarIsInteger(AEditValue) or VarIsStr(AEditValue)) then
      DisplayValue := 0
    else
    begin
      if VarIsInteger(AEditValue) then
        DisplayValue := VarAsType(AEditValue, varInteger)
      else
      begin
        if IsValidStringForInt(VarToStr(AEditValue)) then
          DisplayValue := cxStrToInt(VarToStr(AEditValue), False)
        else
          DisplayValue := 0;
      end;
    end;
    PrepareCurrentPosition(DisplayValue);
  finally
    LockUpdate(False);
  end;
end;

function TcxCustomProgressBarProperties.CompareEditValue: Boolean;
begin
  Result := True;
end;

class function TcxCustomProgressBarProperties.GetViewDataClass: TcxCustomEditViewDataClass;
begin
  Result := TcxCustomProgressBarViewData;
end;

function TcxCustomProgressBarProperties.HasDisplayValue: Boolean;
begin
  Result := True;
end;

procedure TcxCustomProgressBarProperties.PrepareCurrentPosition(Value: Integer);
begin
  FCurrentPosition := Value;
end;

function TcxCustomProgressBarProperties.GetForegroundImage: TBitmap;
begin
  if FForegroundImage = nil then
  begin
    FForegroundImage := TBitmap.Create;
    FForegroundImage.OnChange := ForegroundImageChanged;
  end;
  Result := FForegroundImage;
end;

procedure TcxCustomProgressBarProperties.ForegroundImageChanged(Sender: TObject);
begin
  Changed;
end;

procedure TcxCustomProgressBarProperties.SetBeginColor(Value: TColor);
begin
  if FBeginColor <> Value then
  begin
    FBeginColor := Value;
    Changed;
  end;
end;

procedure TcxCustomProgressBarProperties.SetBarBevelOuter(Value: TcxProgressBarBevelOuter);
begin
  if FBarBevelOuter <> Value then
  begin
    FBarBevelOuter := Value;
    Changed;
  end;
end;

procedure TcxCustomProgressBarProperties.SetEndColor(Value: TColor);
begin
  if Value <> FEndColor then
  begin
    FEndColor := Value;
    Changed;
  end;
end;

procedure TcxCustomProgressBarProperties.SetForegroundImage(Value: TBitmap);
begin
  if Value = nil then
    FreeAndNil(FForegroundImage)
  else
    ForegroundImage.Assign(Value);
  Changed;
end;

procedure TcxCustomProgressBarProperties.SetMin(Value: Integer);
begin
  if FMin <> Value then
  begin
    FMin := Value;
    PostMinValue;
    Changed;
  end;
end;

procedure TcxCustomProgressBarProperties.SetMax(Value: Integer);
begin
  if (Value <> FMax) and (Value > FMin) then
  begin
    FMax := Value;
    PostMaxValue;
    Changed;
  end;
end;

procedure TcxCustomProgressBarProperties.SetOverloadValue(Value: Integer);
begin
  if FOverloadValue <> Value then
  begin
    FOverloadValue := Value;
    PostOverloadValue;
    Changed;
  end;
end;

function TcxCustomProgressBarProperties.GetRealPeakValue: Integer;
begin
  Result := FPeakValue;
  if Result < FMin then Result := FMin;
  if Result > FMax then Result := FMax;
  if Result < FCurrentPosition then Result := FCurrentPosition;
  if Result > FPeakValue then FPeakValue := Result;
end;

procedure TcxCustomProgressBarProperties.SetPeakValue(Value: Integer);
begin
  if FPeakValue <> Value then
  begin
    FPeakValue := Value;
    Changed;
  end;
end;

procedure TcxCustomProgressBarProperties.PostMinValue;
begin
  if FMin > FMax then FMax := FMin;
  if FCurrentPosition < FMin then FCurrentPosition := FMin;
  if FOverloadValue < FMin then FOverloadValue := FMin;
  if FPeakValue < FMin then FPeakValue := FMin;
end;

procedure TcxCustomProgressBarProperties.PostMaxValue;
begin
  if FMin > FMax then FMin := FMax;
  if FCurrentPosition > FMax then FCurrentPosition := FMax;
  if FOverloadValue > FMax then FOverloadValue := FMax;
  if FPeakValue > FMax then FPeakValue := FMax;
end;

procedure TcxCustomProgressBarProperties.PostOverloadValue;
begin
  if FOverloadValue < FMin then
    FOverloadValue := FMin;
  if FOverloadValue > FMax then
    FOverloadValue := FMax;
end;

procedure TcxCustomProgressBarProperties.SetOrientation(Value: TcxProgressBarOrientation);
begin
  if FOrientation <> Value then
  begin
    FOrientation := Value;
    Changed;
  end;
end;

procedure TcxCustomProgressBarProperties.SetShowText(Value: Boolean);
begin
  if FShowText <> Value then
  begin
    FShowText := Value;
    Changed;
  end;
end;

procedure TcxCustomProgressBarProperties.SetShowTextStyle(Value: TcxProgressBarTextStyle);
begin
  if FShowTextStyle <> Value then
  begin
    FShowTextStyle := Value;
    Changed;
  end;
end;

procedure TcxCustomProgressBarProperties.SetTextOrientation(Value: TcxProgressBarOrientation);
begin
  if FTextOrientation <> Value then
  begin
    FTextOrientation := Value;
    Changed;
  end;
end;

procedure TcxCustomProgressBarProperties.SetSolidTextColor(Value: Boolean);
begin
  if FSolidTextColor <> Value then
  begin
    FSolidTextColor := Value;
    Changed;
  end;
end;

procedure TcxCustomProgressBarProperties.SetBarStyle(Value: TcxProgressBarBarStyle);
begin
  if FBarStyle <> Value then
  begin
    FBarStyle := Value;
    Changed;
  end;
end;

procedure TcxCustomProgressBarProperties.SetTransparentImage(Value: Boolean);
begin
  if FTransparentImage <> Value then
  begin
    FTransparentImage := Value;
    Changed;
  end;
end;

procedure TcxCustomProgressBarProperties.SetBorderWidth(Value: TcxBorderWidth);
begin
  if FBorderWidth <> Value then
  begin
    FBorderWidth := Value;
    Changed;
  end;
end;

procedure TcxCustomProgressBarProperties.SetShowOverload(Value: Boolean);
begin
  if FShowOverload <> Value then
  begin
    FShowOverload := Value;
    Changed;
  end;
end;

procedure TcxCustomProgressBarProperties.SetOverloadBeginColor(Value: TColor);
begin
  if FOverloadBeginColor <> Value then
  begin
    FOverloadBeginColor := Value;
    Changed;
  end;
end;

procedure TcxCustomProgressBarProperties.SetOverloadEndColor(Value: TColor);
begin
  if FOverloadEndColor <> Value then
  begin
    FOverloadEndColor := Value;
    Changed;
  end;
end;

procedure TcxCustomProgressBarProperties.SetShowPeak(Value: Boolean);
begin
  if FShowPeak <> Value then
  begin
    FShowPeak := Value;
    Changed;
  end;
end;

procedure TcxCustomProgressBarProperties.SetPeakColor(Value: TColor);
begin
  if FPeakColor <> Value then
  begin
    FPeakColor := Value;
    Changed;
  end;
end;

procedure TcxCustomProgressBarProperties.SetPeakSize(Value: TcxNaturalNumber);
begin
  if FPeakSize <> Value then
  begin
    FPeakSize := Value;
    Changed;
  end;
end;

procedure TcxCustomProgressBarProperties.SetTransparent(Value: Boolean);
begin
  if FTransparent <> Value then
  begin
    FTransparent := Value;
    Changed;
    if Assigned(FOnChangeTransparent) then
      FOnChangeTransparent(Self);
  end;
end;
{ TcxCustomProgressBarProperties }

{ TcxCustomProgressBar }
constructor TcxCustomProgressBar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FIsCreating := True;
  FPosition := 0;
  ControlStyle := ControlStyle - [csDoubleClicks, csAcceptsControls, csCaptureMouse, csClickEvents];
  ParentColor := not IsInplace;
  Width := 121;
  Height := 21;
  FIsCreating := False;
  Properties.FOnChangeTransparent := ChangeTransparentHandler;
end;

class function TcxCustomProgressBar.GetNotPublishedStyleValues: TcxEditStyleValues;
begin
  Result := [svBorderStyle, svButtonStyle, svButtonTransparency, svHotTrack,
    svPopupBorderStyle];
end;

class function TcxCustomProgressBar.GetPropertiesClass: TcxCustomEditPropertiesClass;
begin
  Result := TcxProgressBarProperties;
end;

{$IFDEF VCL}
procedure TcxCustomProgressBar.WMEraseBkgnd(var Message: TWMEraseBkgnd);
begin
  if not IsDestroying and Assigned(Properties) and Properties.Transparent then
    PaintBackground(Self, Message.DC, True)
  else
    inherited;
end;
{$ENDIF}

function TcxCustomProgressBar.CanResize(var NewWidth, NewHeight: Integer): Boolean;
var
  AEditSizeProperties: TcxEditSizeProperties;
begin
  Result := inherited CanResize(NewWidth, NewHeight);
  if Result and AutoSize and not IsLoading then
  begin
    FillSizeProperties(AEditSizeProperties);
    NewHeight := Properties.GetEditSize(Canvas, Style, IsInplace, Null, AEditSizeProperties).cy;
    if NewHeight < 0 then
      NewHeight := Canvas.TextHeight('Wg') + 8;
  end;
end;

procedure TcxCustomProgressBar.FillSizeProperties(var AEditSizeProperties: TcxEditSizeProperties);
begin
  with AEditSizeProperties do
  begin
    MaxLineCount := 1;
    Width := ViewInfo.TextRect.Right - ViewInfo.TextRect.Left;
  end;
end;

procedure TcxCustomProgressBar.InternalSetEditValue(const Value: TcxEditValue;
  AValidateEditValue: Boolean);
begin
  inherited InternalSetEditValue(Value, AValidateEditValue);
end;

procedure TcxCustomProgressBar.SynchronizeDisplayValue;
var
  Display: TcxEditValue;
begin
  Properties.PrepareDisplayValue(FEditValue, Display, Focused);
  Properties.Changed;
end;

procedure TcxCustomProgressBar.ProcessViewInfoChanges(APrevViewInfo: TcxCustomEditViewInfo;
  AIsMouseDownUpEvent: Boolean);
begin
  inherited;
end;

procedure TcxCustomProgressBar.PropertiesChanged(Sender: TObject);
begin
  ViewInfo.Text := '';
  inherited PropertiesChanged(Sender);
end;

procedure TcxCustomProgressBar.ChangeTransparentHandler(Sender: TObject);
begin
  Invalidate;
end;

{$IFDEF DELPHI5}
function TcxCustomProgressBar.CanFocus: Boolean;
begin
  Result := IsInplace;
end;
{$ENDIF}

function TcxCustomProgressBar.CanFocusOnClick: Boolean;
begin
  Result := IsInplace;
end;

function TcxCustomProgressBar.GetProperties: TcxProgressBarProperties;
begin
  Result := TcxProgressBarProperties(InternalGetProperties);
end;

function TcxCustomProgressBar.GetViewInfo: TcxCustomProgressBarViewInfo;
begin
  Result := TcxCustomProgressBarViewInfo(FViewInfo);
end;

procedure TcxCustomProgressBar.SetProperties(Value: TcxProgressBarProperties);
begin
  FProperties.Assign(Value);
end;

procedure TcxCustomProgressBar.SetPosition(Value: Integer);
begin
  if Value <> FPosition then
  begin
    if not IsLoading then
    begin
      if Value < Properties.Min then Value := Properties.Min;
      if Value > Properties.Max then Value := Properties.Max;
    end;
    FPosition := Value;
    FEditValue := Value;
    if Properties.Transparent then
      Invalidate;
    Properties.PrepareCurrentPosition(Value);
    Properties.Changed;
  end;
end;
{ TcxCustomProgressBar }

initialization
  GetRegisteredEditProperties.Register(TcxProgressBarProperties, scxSEditRepositoryProgressBarItem);

finalization
  GetRegisteredEditProperties.Unregister(TcxProgressBarProperties);

end.

