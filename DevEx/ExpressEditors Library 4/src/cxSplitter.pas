
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

unit cxSplitter;

{$I cxExtEdVer.inc}

interface

uses
{$IFDEF VCL}
  Windows, Messages,
{$ENDIF}
  SysUtils, Classes, Controls, Graphics, Forms, cxClasses, cxControls, cxGraphics,
  cxEditUtils, cxExtEditConsts, cxExtEditUtils;

type
  TcxPositionAfterOpen = 2..High(Integer);
  TcxSplitterAlign = (salBottom, salLeft, salRight, salTop);
  TcxSplitterDragState = (sstNormal, sstResizing, sstHotZoneClick);
  TcxSplitterMouseState = (smsClicked, smsInHotZone);
  TcxSplitterMouseStates = set of TcxSplitterMouseState;
  TcxSplitterState = (ssOpened, ssClosed);
  TcxSplitterDirection = (cxsdLeftToRight, cxsdRightToLeft, cxsdTopToBottom, cxsdBottomToTop);
  TCanResizeEvent = procedure(Sender: TObject; var NewSize: Integer; var Accept: Boolean) of object;
  TBeforeOpenHotZoneEvent = procedure(Sender: TObject; var AllowOpen: Boolean) of object;
  TBeforeCloseHotZoneEvent = procedure(Sender: TObject; var AllowClose: Boolean) of object;

type
  TcxCustomSplitter = class;

  { TcxHotZoneStyle }
  TcxHotZoneStyle = class(TPersistent)
  private
    FOwner: TcxCustomSplitter;
    FSizePercent: TcxNaturalNumber;
    FVisible: Boolean;
    FHotZoneRect: TRect;
    procedure SetSizePercent(Value: TcxNaturalNumber);
    procedure SetVisible(Value: Boolean);
  protected
    procedure Changed; virtual;
    function SplitterDirection: TcxSplitterDirection; virtual;
    function CalculateHotZoneRect(const ABounds: TRect): TRect; virtual;
    function GetMinSize: TcxNaturalNumber; virtual;
    function GetMaxSize: TcxNaturalNumber; virtual;
    function DrawHotZone(ACanvas: TcxCanvas; const ARect: TRect;
      const AHighlighted, AClicked: Boolean): TRect; virtual;
    procedure DrawBackground(ACanvas: TcxCanvas; const ARect: TRect;
      const AHighlighted, AClicked: Boolean); virtual;
  public
    property SizePercent: TcxNaturalNumber read FSizePercent write SetSizePercent default 30;
    property Visible: Boolean read FVisible write SetVisible default True;
    property HotZoneRect: TRect read FHotZoneRect write FHotZoneRect;
    property Owner: TcxCustomSplitter read FOwner;
    constructor Create(AOwner: TcxCustomSplitter); virtual;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
  end;

  TcxHotZoneStyleClass = class of TcxHotZoneStyle;

  { TcxMediaPlayer9Style }
  TcxMediaPlayer9Style = class(TcxHotZoneStyle)
  private
    FArrowRect: TRect;
    FArrowColor: TColor;
    FArrowHighlightColor: TColor;
    FLightColor: TColor;
    FBorderColor: TColor;
    FShadowStartColor: TColor;
    FShadowHighlightStartColor: TColor;
    procedure SetArrowColor(Value: TColor);
    procedure SetArrowHighlightColor(Value: TColor);
    procedure SetLightColor(Value: TColor);
    procedure SetBorderColor(Value: TColor);
    procedure SetShadowStartColor(Value: TColor);
    procedure SetShadowHighlightStartColor(Value: TColor);
  protected
    function DrawHotZone(ACanvas: TcxCanvas; const ARect: TRect;
      const AHighlighted, AClicked: Boolean): TRect; override;
    procedure DrawBackground(ACanvas: TcxCanvas; const ARect: TRect;
      const AHighlighted, AClicked: Boolean); override;
    function CalculateHotZoneRect(const ABounds: TRect): TRect; override;
  public
    constructor Create(AOwner: TcxCustomSplitter); override;
    procedure Assign(Source: TPersistent); override;
  published
    property SizePercent;
    property Visible;
    property ArrowColor: TColor read FArrowColor write SetArrowColor default clWindowText;
    property ArrowHighlightColor: TColor read FArrowHighlightColor write SetArrowHighlightColor default clBlue;
    property LightColor: TColor read FLightColor write SetLightColor default clWindow;
    property BorderColor: TColor read FBorderColor write SetBorderColor default clBtnShadow;
    property ShadowStartColor: TColor read FShadowStartColor write SetShadowStartColor default $00F5E6CD;
    property ShadowHighlightStartColor: TColor read FShadowHighlightStartColor
      write SetShadowHighlightStartColor default $00AFF5C3;
  end;

  { TcxMediaPlayer8Style }
  TcxMediaPlayer8Style = class(TcxHotZoneStyle)
  private
    FLTPointsRect: TRect;
    FRBPointsRect: TRect;
    FArrowRect: TRect;
    FArrowColor: TColor;
    FArrowHighlightColor: TColor;
    FLightColor: TColor;
    FShadowColor: TColor;
    procedure SetArrowColor(Value: TColor);
    procedure SetArrowHighlightColor(Value: TColor);
    procedure SetLightColor(Value: TColor);
    procedure SetShadowColor(Value: TColor);
    procedure DrawArrowRect(ACanvas: TcxCanvas; const ARect: TRect;
      const AHighlighted, AClicked: Boolean);
  protected
    function DrawHotZone(ACanvas: TcxCanvas; const ARect: TRect;
      const AHighlighted, AClicked: Boolean): TRect; override;
    procedure DrawBackground(ACanvas: TcxCanvas; const ARect: TRect;
      const AHighlighted, AClicked: Boolean); override;
    function CalculateHotZoneRect(const ABounds: TRect): TRect; override;
  public
    constructor Create(AOwner: TcxCustomSplitter); override;
    procedure Assign(Source : TPersistent); override;
  published
    property SizePercent;
    property Visible;
    property ArrowColor: TColor read FArrowColor write SetArrowColor default clWindowText;
    property ArrowHighlightColor: TColor read FArrowHighlightColor write SetArrowHighlightColor default clWindow;
    property LightColor: TColor read FLightColor write SetLightColor default clWindow;
    property ShadowColor: TColor read FShadowColor write SetShadowColor default clBtnShadow;
  end;

  { TcxXPTaskBarStyle }
  TcxXPTaskBarStyle = class(TcxHotZoneStyle)
  private
    FLightColor: TColor;
    FShadowColor: TColor;
    FLTPointsRect: TRect;
    FRBPointsRect: TRect;
    procedure SetLightColor(Value: TColor);
    procedure SetShadowColor(Value: TColor);
  protected
    function DrawHotZone(ACanvas: TcxCanvas; const ARect: TRect;
      const AHighlighted, AClicked: Boolean): TRect; override;
    procedure DrawBackground(ACanvas: TcxCanvas; const ARect: TRect;
      const AHighlighted, AClicked: Boolean); override;
    function CalculateHotZoneRect(const ABounds: TRect): TRect; override;
  public
    constructor Create(AOwner: TcxCustomSplitter); override;
    procedure Assign(Source : TPersistent); override;
  published
    property SizePercent;
    property Visible;
    property LightColor: TColor read FLightColor write SetLightColor default clWindow;
    property ShadowColor: TColor read FShadowColor write SetShadowColor default clBtnShadow;
  end;

  { TcxSimpleStyle }
  TcxSimpleStyle = class(TcxHotZoneStyle)
  private
    FArrowColor: TColor;
    FArrowHighlightColor: TColor;
    FLightColor: TColor;
    FShadowColor: TColor;
    FDotsColor: TColor;
    FDotsShadowColor: TColor;
    FLTArrowRect: TRect;
    FRBArrowRect: TRect;
    procedure SetArrowColor(Value: TColor);
    procedure SetArrowHighlightColor(Value: TColor);
    procedure SetLightColor(Value: TColor);
    procedure SetShadowColor(Value: TColor);
    procedure SetDotsColor(Value: TColor);
    procedure SetDotsShadowColor(Value: TColor);
  protected
    function DrawHotZone(ACanvas: TcxCanvas; const ARect: TRect;
      const AHighlighted, AClicked: Boolean): TRect; override;
    procedure DrawBackground(ACanvas: TcxCanvas; const ARect: TRect;
      const AHighlighted, AClicked: Boolean); override;
    function CalculateHotZoneRect(const ABounds: TRect): TRect; override;
  public
    constructor Create(AOwner: TcxCustomSplitter); override;
    procedure Assign(Source : TPersistent); override;
  published
    property SizePercent;
    property Visible;
    property ArrowColor: TColor read FArrowColor write SetArrowColor default clWindowText;
    property ArrowHighlightColor: TColor read FArrowHighlightColor write SetArrowHighlightColor default clWindow;
    property LightColor: TColor read FLightColor write SetLightColor default clWindow;
    property ShadowColor: TColor read FShadowColor write SetShadowColor default clBtnShadow;
    property DotsColor: TColor read FDotsColor write SetDotsColor default clHighlight;
    property DotsShadowColor: TColor read FDotsShadowColor write SetDotsShadowColor default clWindow;
  end;

  { TcxCustomSplitter }
  TcxCustomSplitter = class(TcxControl)
  private
    { Private declarations }
    FAlignSplitter: TcxSplitterAlign;
    FAutoPosition: Boolean;
    FAutoSnap: Boolean;
    FAllowHotZoneDrag: Boolean;
    FDragThreshold: TcxNaturalNumber;
    FInvertDirection: Boolean;
    FMinSize: TcxNaturalNumber;
    FPositionAfterOpen: TcxPositionAfterOpen;
    FResizeUpdate: Boolean;
    FResizeIgnoreSnap: Boolean;
    FOnCanResize: TCanResizeEvent;
    FOnMoved: TNotifyEvent;
    FOnBeforeOpen: TBeforeOpenHotZoneEvent;
    FOnAfterOpen: TNotifyEvent;
    FOnBeforeClose: TBeforeCloseHotZoneEvent;
    FOnAfterClose: TNotifyEvent;
    FNativeBackground: Boolean;
    {Local variables}
    FActiveControl: TWinControl;
    FState: TcxSplitterState;
    FMouseStates: TcxSplitterMouseStates;
    FPositionBeforeClose: Integer;
    FSplitterState: TcxSplitterDragState;
    FControl: TControl;
    FSplitterClickPoint: TPoint;
    FHotZoneClickPoint: TPoint;
    FBrush: TBrush;
    FLineDC: HDC;
    FLineVisible: Boolean;
    FPrevBrush: HBrush;
    FMaxSize: Word;
    FNewSize: Integer;
    FOldSize: Integer;
    FOldKeyDown: TKeyEvent;
    FSplit: Integer;
    FHotZone: TcxHotZoneStyle;
    FHotZoneStyleClass: TcxHotZoneStyleClass;
    FHotZoneEvents: TNotifyEvent;
    FDrawCanvas: TcxCanvas;
    FLastPatternDrawPosition: Integer;
    FSavedShowHint: Boolean;
    FSavedParentShowHint: Boolean;
    procedure CalcSplitSize(X, Y: Integer; var NewSize, Split: Integer);
    function FindControl: TControl;
    procedure FocusKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure AllocateSplitLineDC;
    procedure ReleaseSplitLine;
    procedure UpdateControlSize;
    procedure UpdateSize(X, Y: Integer);
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure CMTabStopChanged(var Message: TMessage); message CM_TABSTOPCHANGED;
    procedure SetAlignSplitter(Value: TcxSplitterAlign);
    procedure SetSplitterState(Value: TcxSplitterState);
    procedure SetAllowHotZoneDrag(Value: Boolean);
    procedure SetInvertDirection(Value: Boolean);
    procedure SetHotZone(Value: TcxHotZoneStyle);
    procedure SetNativeBackground(Value: Boolean);
    procedure RecalcLastPosition;
    procedure NormalizeSplitterSize;
    procedure SetHotZoneStyleClass(const Value: TcxHotZoneStyleClass);
    function GetHotZoneClassName: string;
    procedure SetHotZoneClassName(Value: string);
    procedure InitResize(X, Y: Integer);
  protected
    { Protected declarations }
    FDrawBitmap: TBitmap;
    function CanResize(var NewSize: Integer): Boolean; {$IFDEF DELPHI4}reintroduce; {$ENDIF} virtual;
    function DoCanResize(var NewSize: Integer): Boolean; virtual;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure DrawSplitLine; virtual;
    procedure HotZoneStyleChanged; virtual;
    procedure DrawHotZone; virtual;
    procedure Paint; override;
    procedure StopSizing; virtual;
    function GetSplitterMinSize: TcxNaturalNumber; virtual;
    function GetSplitterMaxSize: TcxNaturalNumber; virtual;
    procedure CreateHotZone; virtual;
    procedure DestroyHotZone; virtual;
    procedure DoEventBeforeOpen(var AllowOpenHotZone: Boolean); virtual;
    procedure DoEventAfterOpen; virtual;
    procedure DoEventBeforeClose(var AllowCloseHotZone: Boolean); virtual;
    procedure DoEventAfterClose; virtual;
    procedure DoEventMoved; virtual;
    procedure Notification(ACOmponent: TComponent; Operation: TOperation); override;
    procedure Loaded; override;
    function CalculateSplitterDirection: TcxSplitterDirection; virtual;
    procedure UpdateMouseStates(X, Y: Integer); virtual;
    property AlignSplitter: TcxSplitterAlign read FAlignSplitter
      write SetAlignSplitter default salLeft;
    property AutoPosition: Boolean read FAutoPosition write FAutoPosition default True;
    property AutoSnap: Boolean read FAutoSnap write FAutoSnap default False;
    property AllowHotZoneDrag: Boolean read FAllowHotZoneDrag write SetAllowHotZoneDrag default True;
    property DragThreshold: TcxNaturalNumber read FDragThreshold write FDragThreshold default 3;
    property InvertDirection: Boolean read FInvertDirection
      write SetInvertDirection default False;
    property MinSize: TcxNaturalNumber read FMinSize write FMinSize default 30;
    property PositionAfterOpen: TcxPositionAfterOpen read FPositionAfterOpen
      write FPositionAfterOpen default 30;
    property ResizeUpdate: Boolean read FResizeUpdate
      write FResizeUpdate default False;
    property ResizeIgnoreSnap: Boolean read FResizeIgnoreSnap
      write FResizeIgnoreSnap default True;
    property Control: TControl read FControl write FControl;
    property NativeBackground: Boolean read FNativeBackground write SetNativeBackground default True;
    property OnCanResize: TCanResizeEvent read FOnCanResize write FOnCanResize;
    property OnMoved: TNotifyEvent read FOnMoved write FOnMoved;
    property OnBeforeOpen: TBeforeOpenHotZoneEvent read FOnBeforeOpen write FOnBeforeOpen;
    property OnAfterOpen: TNotifyEvent read FOnAfterOpen write FOnAfterOpen;
    property OnBeforeClose: TBeforeCloseHotZoneEvent read FOnBeforeClose write FOnBeforeClose;
    property OnAfterClose: TNotifyEvent read FOnAfterClose write FOnAfterClose;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure OpenSplitter;
    procedure CloseSplitter;
    property State: TcxSplitterState read FState write SetSplitterState;
    function IsPointInHotZone(const X, Y: Integer): Boolean;
    function IsPointInSplitter(const X, Y: Integer): Boolean;
    property HotZoneStyleClass: TcxHotZoneStyleClass read FHotZoneStyleClass
      write SetHotZoneStyleClass;
    property Direction: TcxSplitterDirection read CalculateSplitterDirection;
  published
    property HotZoneClassName: string read GetHotZoneClassName write SetHotZoneClassName;
    property HotZone: TcxHotZoneStyle read FHotZone write SetHotZone;
    property HotZoneEvents: TNotifyEvent read FHotZoneEvents write FHotZoneEvents;
  end;

  { TcxSplitter }
  TcxSplitter = class(TcxCustomSplitter)
  published
    { Public declarations }
    property AlignSplitter;
    property AllowHotZoneDrag;
    property AutoPosition;
    property DragThreshold;
    property NativeBackground;
    property PositionAfterOpen;
    property AutoSnap;
    property InvertDirection;
    property MinSize;
    property ResizeUpdate;
    property ResizeIgnoreSnap;
    property Control;
    property OnCanResize;
    property OnMoved;
    property OnBeforeOpen;
    property OnAfterOpen;
    property OnBeforeClose;
    property OnAfterClose;
    property Color;
    property ShowHint;
    property ParentColor;
    property ParentShowHint;
    property Visible;
  end;

function GetRegisteredHotZoneStyles: TcxRegisteredClasses;

implementation

{$IFDEF VCL}
uses
  dxThemeConsts, dxThemeManager, dxUxTheme;
{$ENDIF}

type
  TWinControlAccess = class(TWinControl);

const
  SplitterDefaultSize = 8;

var
  FRegisteredHotZoneStyles: TcxRegisteredClasses;

function GetRegisteredHotZoneStyles: TcxRegisteredClasses;
begin
  if FRegisteredHotZoneStyles = nil then
    FRegisteredHotZoneStyles := TcxRegisteredClasses.Create;
  Result := FRegisteredHotZoneStyles;
end;

procedure DrawSplitterDots(ACanvas: TcxCanvas; const ARect: TRect; const AClicked: Boolean;
  const AFromLeftTop: Boolean; const ALightColor, AShadowColor: TColor;
  const ASplitterDirection: TcxSplitterDirection; const ABetweenPoints, AIndent: Integer);
var
  I, FNextDotPoint: Integer;

  procedure PaintOuterDot(X, Y: Integer);
  begin
    ACanvas.Brush.Color := ALightColor;
    ACanvas.FillRect(Rect(X, Y, X + 2, Y + 2));
    ACanvas.Brush.Color := AShadowColor;
    ACanvas.FillRect(Rect(X + 1, Y + 1, X + 3, Y + 3));
  end;

  procedure PaintInnerDot(X, Y: Integer);
  begin
    ACanvas.Brush.Color := ALightColor;
    ACanvas.FillRect(Rect(X + 1, Y + 1, X + 3, Y + 3));
    ACanvas.Brush.Color := AShadowColor;
    ACanvas.FillRect(Rect(X, Y, X + 2, Y + 2));
  end;

begin
  if AFromLeftTop = True then
  begin
    if (ASplitterDirection = cxsdLeftToRight) or (ASplitterDirection = cxsdRightToLeft) then
    begin
      FNextDotPoint := ARect.Top + ABetweenPoints;
      for I := ARect.Top + ABetweenPoints to ARect.Bottom - ABetweenPoints do
        if (I = FNextDotPoint) and ((I + ABetweenPoints) <= ARect.Bottom) then
        begin
          if AClicked = False then
            PaintOuterDot(ARect.Left + AIndent, I)
          else
            PaintInnerDot(ARect.Left + AIndent, I);
          Inc(FNextDotPoint, ABetweenPoints + 2);
        end;
    end
    else
    begin
      FNextDotPoint := ARect.Left + ABetweenPoints;
      for I := ARect.Left + ABetweenPoints to ARect.Right - ABetweenPoints do
        if (I = FNextDotPoint) and ((I + ABetweenPoints) <= ARect.Right) then
        begin
          if AClicked = False then
            PaintOuterDot(I, ARect.Top + AIndent)
          else
            PaintInnerDot(I, ARect.Top + AIndent);
          Inc(FNextDotPoint, ABetweenPoints + 2);
        end;
    end;
  end
  else
  begin
    if (ASplitterDirection = cxsdLeftToRight) or (ASplitterDirection = cxsdRightToLeft) then
    begin
      FNextDotPoint := ARect.Bottom - (ABetweenPoints * 2);
      for I := ARect.Bottom - (ABetweenPoints * 2) downto ARect.Top do
        if (I = FNextDotPoint) and (I >= ARect.Top) then
        begin
          if AClicked = False then
            PaintOuterDot(ARect.Left + AIndent, I)
          else
            PaintInnerDot(ARect.Left + AIndent, I);
          Dec(FNextDotPoint, ABetweenPoints + 2);
        end;
    end
    else
    begin
      FNextDotPoint := ARect.Right - (ABetweenPoints * 2);
      for I := ARect.Right - (ABetweenPoints * 2) downto ARect.Left do
        if (I = FNextDotPoint) and (I >= ARect.Left) then
        begin
          if AClicked = False then
            PaintOuterDot(I, ARect.Top + AIndent)
          else
            PaintInnerDot(I, ARect.Top + AIndent);
          Dec(FNextDotPoint, ABetweenPoints + 2);
        end;
    end;
  end;
end;

procedure DrawHotZoneArrow(ACanvas: TcxCanvas; const ARect: TRect;
  const AHighlighted, AClicked: Boolean; const ArrowColor, ArrowHighlightColor: TColor;
  const ASplitterDirection: TcxSplitterDirection);
var
  I, FDelta, FCenter, FRectSize: Integer;
  FLocalArrowColor: TColor;
begin
  if (AHighlighted = False) or (AClicked = True) then
    FLocalArrowColor := ArrowColor
  else
    FLocalArrowColor := ArrowHighlightColor;
  if (ASplitterDirection = cxsdLeftToRight) or (ASplitterDirection = cxsdRightToLeft) then
  begin
    FRectSize := ARect.Bottom - ARect.Top;
    if (FRectSize mod 2) <> 0 then Dec(FRectSize, 1);
    FCenter := (FRectSize div 2) + 1;
  end
  else
  begin
    FRectSize := ARect.Right - ARect.Left;
    if (FRectSize mod 2) <> 0 then Dec(FRectSize, 1);
    FCenter := (FRectSize div 2) + 1;
  end;
  case ASplitterDirection of
    cxsdLeftToRight:
    begin
      for I := 0 to 3 do
      begin
        if I = 3 then
          FDelta := 1
        else
          FDelta := 0;
        DrawCanvasLine(ACanvas.Canvas, FLocalArrowColor, Point(ARect.Left + 4 - I + FDelta,
          ARect.Top + FCenter - I), Point(ARect.Left + 6 - I, ARect.Top + FCenter - I));
        DrawCanvasLine(ACanvas.Canvas, FLocalArrowColor, Point(ARect.Left + 4 - I + FDelta,
          ARect.Top + FCenter + I), Point(ARect.Left + 6 - I, ARect.Top + FCenter + I));
      end;
    end;
    cxsdRightToLeft:
    begin
      for I := 0 to 3 do
      begin
        if I = 3 then
          FDelta := -1
        else
          FDelta := 0;
        DrawCanvasLine(ACanvas.Canvas, FLocalArrowColor, Point(ARect.Left + 2 + I,
          ARect.Top + FCenter - I), Point(ARect.Left + 4 + I + FDelta, ARect.Top + FCenter - I));
        DrawCanvasLine(ACanvas.Canvas, FLocalArrowColor, Point(ARect.Left + 2 + I,
          ARect.Top + FCenter + I), Point(ARect.Left + 4 + I + FDelta, ARect.Top + FCenter + I));
      end;
    end;
    cxsdTopToBottom:
    begin
      for I := 0 to 3 do
      begin
        if I = 3 then
          FDelta := 1
        else
          FDelta := 0;
        DrawCanvasLine(ACanvas.Canvas, FLocalArrowColor, Point(ARect.Left + FCenter - I,
          ARect.Top + 4 - I + FDelta), Point(ARect.Left + FCenter - I, ARect.Top + 6 - I));
        DrawCanvasLine(ACanvas.Canvas, FLocalArrowColor, Point(ARect.Left + FCenter + I,
          ARect.Top + 4 - I + FDelta), Point(ARect.Left + FCenter + I, ARect.Top + 6 - I));
      end;
    end;
    cxsdBottomToTop:
    begin
      for I := 0 to 3 do
      begin
        if I = 3 then
          FDelta := -1
        else
          FDelta := 0;
        DrawCanvasLine(ACanvas.Canvas, FLocalArrowColor, Point(ARect.Left + FCenter - I,
          ARect.Top + 2 + I), Point(ARect.Left + FCenter - I, ARect.Top + 4 + I + FDelta));
        DrawCanvasLine(ACanvas.Canvas, FLocalArrowColor, Point(ARect.Left + FCenter + I,
          ARect.Top + 2 + I), Point(ARect.Left + FCenter + I, ARect.Top + 4 + I + FDelta));
      end;
    end;
  end;
end;

{ TcxHotZoneStyle }
constructor TcxHotZoneStyle.Create(AOwner: TcxCustomSplitter);
begin
  inherited Create;
  FOwner := AOwner;
  FSizePercent := 30;
  FVisible := True;
end;

destructor TcxHotZoneStyle.Destroy;
begin
  FOwner := nil;
  inherited;
end;

procedure TcxHotZoneStyle.Assign(Source: TPersistent);
begin
  if (Source is TcxHotZoneStyle) then
  begin
    with (Source as TcxHotZoneStyle) do
    begin
      Self.SizePercent := SizePercent;
      Self.Visible := Visible;
    end;
  end
  else
    inherited Assign(Source);
end;

procedure TcxHotZoneStyle.Changed;
begin
  if Assigned(FOwner) then FOwner.HotZoneStyleChanged;
end;

function TcxHotZoneStyle.SplitterDirection: TcxSplitterDirection;
begin
  if Assigned(FOwner) then
    Result := FOwner.CalculateSplitterDirection
  else
    Result := Low(TcxSplitterDirection);
end;

procedure TcxHotZoneStyle.SetSizePercent(Value: TcxNaturalNumber);
begin
  if FSizePercent <> Value then
  begin
    FSizePercent := Value;
    Changed;
  end;
end;

procedure TcxHotZoneStyle.SetVisible(Value: Boolean);
begin
  if FVisible <> Value then
  begin
    FVisible := Value;
    Changed;
  end;
end;

function TcxHotZoneStyle.DrawHotZone(ACanvas: TcxCanvas; const ARect: TRect;
  const AHighlighted, AClicked: Boolean): TRect;
begin
  { Dummy }
end;

procedure TcxHotZoneStyle.DrawBackground(ACanvas: TcxCanvas; const ARect: TRect;
  const AHighlighted, AClicked: Boolean);
begin
  { Dummy }
end;

function TcxHotZoneStyle.GetMinSize: TcxNaturalNumber;
begin
  Result := SplitterDefaultSize;
end;

function TcxHotZoneStyle.GetMaxSize: TcxNaturalNumber;
begin
  Result := SplitterDefaultSize;
end;

function TcxHotZoneStyle.CalculateHotZoneRect(const ABounds: TRect): TRect;
var
  FRect : TRect;
  FHotZoneRectSize, FPos: Integer;
begin
  FRect := ABounds;
  if (SplitterDirection = cxsdLeftToRight) or (SplitterDirection = cxsdRightToLeft) then
  begin
    FRect.Right := FRect.Left + SplitterDefaultSize - 1;
    FHotZoneRectSize := ((FRect.Bottom - FRect.Top) * SizePercent) div 100;
    FPos := ((FRect.Bottom - FRect.Top) div 2) - (FHotZoneRectSize div 2);
    Result := Rect(FRect.Left, FPos, FRect.Right, FPos + FHotZoneRectSize);
  end
  else
  begin
    FRect.Bottom := FRect.Top + SplitterDefaultSize - 1;
    FHotZoneRectSize := ((FRect.Right - FRect.Left) * SizePercent) div 100;
    FPos := ((FRect.Right - FRect.Left) div 2) - (FHotZoneRectSize div 2);
    Result := Rect(FPos, FRect.Top, FPos + FHotZoneRectSize, FRect.Bottom);
  end;
  HotZoneRect := Result;
end;
{ TcxHotZoneStyle }

{ TcxMediaPlayer9Style }
constructor TcxMediaPlayer9Style.Create(AOwner: TcxCustomSplitter);
begin
  inherited Create(AOwner);
  FArrowColor := clWindowText;
  FArrowHighlightColor := clBlue;
  FLightColor := clWindow;
  FBorderColor := clBtnShadow;
  FShadowStartColor := $00F5E6CD;
  FShadowHighlightStartColor := $00AFF5C3;
end;

procedure TcxMediaPlayer9Style.Assign(Source: TPersistent);
begin
  if (Source is TcxMediaPlayer9Style) then
  begin
    inherited Assign(Source);
    with (Source as TcxMediaPlayer9Style) do
    begin
      Self.ArrowColor := ArrowColor;
      Self.ArrowHighlightColor := ArrowHighlightColor;
      Self.LightColor := LightColor;
      Self.BorderColor := BorderColor;
      Self.ShadowStartColor := ShadowStartColor;
      Self.ShadowHighlightStartColor := ShadowHighlightStartColor;
    end;
  end
  else
    inherited Assign(Source);
end;

procedure TcxMediaPlayer9Style.SetArrowColor(Value: TColor);
begin
  if FArrowColor <> Value then
  begin
    FArrowColor := Value;
    Changed;
  end;
end;

procedure TcxMediaPlayer9Style.SetArrowHighlightColor(Value: TColor);
begin
  if FArrowHighlightColor <> Value then
  begin
    FArrowHighlightColor := Value;
    Changed;
  end;
end;

procedure TcxMediaPlayer9Style.SetLightColor(Value: TColor);
begin
  if FLightColor <> Value then
  begin
    FLightColor := Value;
    Changed;
  end;
end;

procedure TcxMediaPlayer9Style.SetBorderColor(Value: TColor);
begin
  if FBorderColor <> Value then
  begin
    FBorderColor := Value;
    Changed;
  end;
end;

procedure TcxMediaPlayer9Style.SetShadowStartColor(Value: TColor);
begin
  if FShadowStartColor <> Value then
  begin
    FShadowStartColor := Value;
    Changed;
  end;
end;

procedure TcxMediaPlayer9Style.SetShadowHighlightStartColor(Value: TColor);
begin
  if FShadowHighlightStartColor <> Value then
  begin
    FShadowHighlightStartColor := Value;
    Changed;
  end;
end;

function TcxMediaPlayer9Style.DrawHotZone(ACanvas: TcxCanvas; const ARect: TRect;
  const AHighlighted, AClicked: Boolean): TRect;
begin
  Result := CalculateHotZoneRect(ARect);
  ACanvas.Canvas.Lock;
  try
    ACanvas.Canvas.Brush.Color := Owner.Color;
    DrawBackground(ACanvas, HotZoneRect, AHighlighted, AClicked);
    DrawHotZoneArrow(ACanvas, FArrowRect, AHighlighted, AClicked, FArrowColor,
      FArrowHighlightColor, SplitterDirection);
  finally
    ACanvas.Canvas.Unlock;
  end;
end;

function TcxMediaPlayer9Style.CalculateHotZoneRect(const ABounds: TRect): TRect;
begin
  Result := inherited CalculateHotZoneRect(ABounds);
  if (SplitterDirection = cxsdLeftToRight) or (SplitterDirection = cxsdRightToLeft) then
    FArrowRect := Rect(Result.Left, Result.Top + (RectHeight(Result) div 2) - 7,
      Result.Left + SplitterDefaultSize - 1,
      Result.Top + (RectHeight(Result) div 2) + 7)
  else
    FArrowRect := Rect(Result.Left + (RectWidth(Result) div 2) - 7,
      Result.Top, Result.Left + (RectWidth(Result) div 2) + 7,
      Result.Top + SplitterDefaultSize - 1);
  HotZoneRect := Result;
end;

procedure TcxMediaPlayer9Style.DrawBackground(ACanvas: TcxCanvas; const ARect: TRect;
  const AHighlighted, AClicked: Boolean);
var
  FRect: TRect;
  FXDelta, FYDelta, FShadowStepDelta, FShadowStep: Integer;
  FLocalShadowColor: TColor;
begin
  FRect := ARect;
  case SplitterDirection of
    cxsdLeftToRight, cxsdRightToLeft: InflateRectEx(FRect, 0, 1, 0, -1);
    cxsdTopToBottom, cxsdBottomToTop: InflateRectEx(FRect, 1, 0, -1, 0);
  end;
  ACanvas.Pen.Color := BorderColor;
  ACanvas.Brush.Color := LightColor;
  ACanvas.FillRect(FRect);
  DrawBounds(ACanvas, FRect, BorderColor, BorderColor);
  if AHighlighted = False then
    FLocalShadowColor := ShadowStartColor
  else
    FLocalShadowColor := ShadowHighlightStartColor;
  if not AClicked then
  begin
    FXDelta := 4;
    FYDelta := 2;
    FShadowStep := 0;
    FShadowStepDelta := -30;
  end
  else
  begin
    FXDelta := 1;
    FYDelta := 0;
    FShadowStep := -60;
    FShadowStepDelta := 30;
  end;
  case SplitterDirection of
    cxsdLeftToRight, cxsdRightToLeft:
    begin
      DrawCanvasLine(ACanvas.Canvas, LightColor, Point(ARect.Left + 2, ARect.Top + 1),
        Point(ARect.Right - 1, ARect.Top + 1));
      DrawCanvasLine(ACanvas.Canvas, BorderColor, Point(ARect.Left + 1, ARect.Top),
        Point(ARect.Right, ARect.Top));
      DrawCanvasLine(ACanvas.Canvas, LightColor, Point(ARect.Left + 2, ARect.Bottom - 1),
        Point(ARect.Right - 1, ARect.Bottom - 1));
      DrawCanvasLine(ACanvas.Canvas, BorderColor, Point(ARect.Left + 1, ARect.Bottom),
        Point(ARect.Right, ARect.Bottom));
      DrawCanvasLine(ACanvas.Canvas, IncColor(FLocalShadowColor, FShadowStep, FShadowStep, FShadowStep),
        Point(ARect.Left + FXDelta, ARect.Top + FYDelta), Point(ARect.Left + FXDelta,
        ARect.Bottom + FYDelta - 2));
      Inc(FShadowStep, FShadowStepDelta);
      DrawCanvasLine(ACanvas.Canvas, IncColor(FLocalShadowColor, FShadowStep, FShadowStep, FShadowStep),
        Point(ARect.Left + FXDelta + 1, ARect.Top + FYDelta + 1),
        Point(ARect.Left + FXDelta + 1, ARect.Bottom + FYDelta - 2));
      Inc(FShadowStep, FShadowStepDelta);
      DrawCanvasLine(ACanvas.Canvas, IncColor(FLocalShadowColor, FShadowStep, FShadowStep, FShadowStep),
        Point(ARect.Left + FXDelta + 2, ARect.Top + FYDelta + 1),
        Point(ARect.Left + FXDelta + 2, ARect.Bottom + FYDelta - 3));
    end;
    cxsdTopToBottom, cxsdBottomToTop:
    begin
      DrawCanvasLine(ACanvas.Canvas, LightColor, Point(ARect.Left + 1, ARect.Top + 2),
        Point(ARect.Left + 1, ARect.Bottom - 1));
      DrawCanvasLine(ACanvas.Canvas, BorderColor, Point(ARect.Left, ARect.Top + 1),
        Point(ARect.Left, ARect.Bottom));
      DrawCanvasLine(ACanvas.Canvas, LightColor, Point(ARect.Right - 1, ARect.Top + 2),
        Point(ARect.Right - 1, ARect.Bottom - 1));
      DrawCanvasLine(ACanvas.Canvas, BorderColor, Point(ARect.Right, ARect.Top + 1),
        Point(ARect.Right, ARect.Bottom));
      DrawCanvasLine(ACanvas.Canvas, IncColor(FLocalShadowColor, FShadowStep, FShadowStep, FShadowStep),
        Point(ARect.Left + FYDelta, ARect.Top + FXDelta),
        Point(ARect.Right + FYDelta - 2, ARect.Top + FXDelta));
      Inc(FShadowStep, FShadowStepDelta);
      DrawCanvasLine(ACanvas.Canvas, IncColor(FLocalShadowColor, FShadowStep, FShadowStep, FShadowStep),
        Point(ARect.Left + FYDelta + 1, ARect.Top + FXDelta + 1),
        Point(ARect.Right + FYDelta - 2, ARect.Top + FXDelta + 1));
      Inc(FShadowStep, FShadowStepDelta);
      DrawCanvasLine(ACanvas.Canvas, IncColor(FLocalShadowColor, FShadowStep, FShadowStep, FShadowStep),
        Point(ARect.Left + FYDelta + 1, ARect.Top + FXDelta + 2),
        Point(ARect.Right + FYDelta - 3, ARect.Top + FXDelta + 2));
    end;
  end;
  ACanvas.Pen.Color := FOwner.Color;
  ACanvas.Brush.Color := FOwner.Color;
end;
{ TcxMediaPlayer9Style }

{ TcxMediaPlayer8Style }
constructor TcxMediaPlayer8Style.Create(AOwner: TcxCustomSplitter);
begin
  inherited Create(AOwner);
  FArrowColor := clWindowText;
  FArrowHighlightColor := clWindow;
  FLightColor := clWindow;
  FShadowColor := clBtnShadow;
end;

procedure TcxMediaPlayer8Style.Assign(Source: TPersistent);
begin
  if (Source is TcxMediaPlayer8Style) then
  begin
    inherited Assign(Source);
    with (Source as TcxMediaPlayer8Style) do
    begin
      Self.ShadowColor := ShadowColor;
      Self.LightColor := LightColor;
      Self.ArrowColor := ArrowColor;
      Self.ArrowHighlightColor := ArrowHighlightColor;
    end;
  end
  else
    inherited Assign(Source);
end;

procedure TcxMediaPlayer8Style.SetShadowColor(Value: TColor);
begin
  if FShadowColor <> Value then
  begin
    FShadowColor := Value;
    Changed;
  end;
end;

procedure TcxMediaPlayer8Style.SetLightColor(Value: TColor);
begin
  if FLightColor <> Value then
  begin
    FLightColor := Value;
    Changed;
  end;
end;

procedure TcxMediaPlayer8Style.SetArrowColor(Value: TColor);
begin
  if FArrowColor <> Value then
  begin
    FArrowColor := Value;
    Changed;
  end;
end;

procedure TcxMediaPlayer8Style.SetArrowHighlightColor(Value: TColor);
begin
  if FArrowHighlightColor <> Value then
  begin
    FArrowHighlightColor := Value;
    Changed;
  end;
end;

function TcxMediaPlayer8Style.DrawHotZone(ACanvas: TcxCanvas; const ARect: TRect;
  const AHighlighted, AClicked: Boolean): TRect;
begin
  Result := CalculateHotZoneRect(ARect);
  ACanvas.Canvas.Lock;
  try
    ACanvas.Canvas.Brush.Color := Owner.Color;
    DrawBackground(ACanvas, HotZoneRect, AHighlighted, AClicked);
    DrawSplitterDots(ACanvas, FLTPointsRect, AClicked, False, FLightColor,
      FShadowColor, SplitterDirection, 3, 3);
    DrawSplitterDots(ACanvas, FRBPointsRect, AClicked, True, FLightColor,
      FShadowColor, SplitterDirection, 3, 3);
    DrawArrowRect(ACanvas, FArrowRect, AHighlighted, AClicked);
    DrawHotZoneArrow(ACanvas, FArrowRect, AHighlighted, AClicked, FArrowColor,
      FArrowHighlightColor, SplitterDirection);
  finally
    ACanvas.Canvas.Unlock;
  end;
end;

function TcxMediaPlayer8Style.CalculateHotZoneRect(const ABounds: TRect): TRect;
var
  FRect : TRect;
  FHotZoneRectSize, FPos: Integer;
  FHotZonePointsRectHeight, FHotZoneRoundRectHeight: Integer;
begin
  FRect := ABounds;
  if (SplitterDirection = cxsdLeftToRight) or (SplitterDirection = cxsdRightToLeft) then
  begin
    FRect.Right := FRect.Left + SplitterDefaultSize - 1;
    FHotZoneRectSize := ((FRect.Bottom - FRect.Top) * SizePercent) div 100;
    FPos := ((FRect.Bottom - FRect.Top) div 2) - (FHotZoneRectSize div 2);
    HotZoneRect := Rect(FRect.Left, FPos, FRect.Right, FPos + FHotZoneRectSize);
  end
  else
  begin
    FRect.Bottom := FRect.Top + SplitterDefaultSize - 1;
    FHotZoneRectSize := ((FRect.Right - FRect.Left) * SizePercent) div 100;
    FPos := ((FRect.Right - FRect.Left) div 2) - (FHotZoneRectSize div 2);
    HotZoneRect := Rect(FPos, FRect.Top, FPos + FHotZoneRectSize, FRect.Bottom);
  end;

  FHotZoneRoundRectHeight := 4;
  FHotZonePointsRectHeight := (FHotZoneRectSize - (FHotZoneRoundRectHeight * 2) - 19) div 2;
  if (SplitterDirection = cxsdLeftToRight) or (SplitterDirection = cxsdRightToLeft) then
  begin
    FLTPointsRect := Rect(HotZoneRect.Left, HotZoneRect.Top + FHotZoneRoundRectHeight,
      HotZoneRect.Left + HotZoneRect.Right - HotZoneRect.Left,
      HotZoneRect.Top + FHotZoneRoundRectHeight + FHotZonePointsRectHeight);
    FRBPointsRect := Rect(HotZoneRect.Left, HotZoneRect.Bottom - FHotZoneRoundRectHeight - FHotZonePointsRectHeight,
      HotZoneRect.Left + HotZoneRect.Right - HotZoneRect.Left,
      HotZoneRect.Bottom - FHotZoneRoundRectHeight - FHotZonePointsRectHeight + FHotZonePointsRectHeight);
    FArrowRect := Rect(HotZoneRect.Left, HotZoneRect.Top + FHotZonePointsRectHeight + FHotZoneRoundRectHeight,
      HotZoneRect.Left + SplitterDefaultSize - 1,
      HotZoneRect.Top + FHotZonePointsRectHeight + FHotZoneRoundRectHeight + 19);
  end
  else
  begin
    FLTPointsRect := Rect(HotZoneRect.Left + FHotZoneRoundRectHeight,
      HotZoneRect.Top, HotZoneRect.Left + FHotZoneRoundRectHeight + FHotZonePointsRectHeight,
      HotZoneRect.Bottom);
    FRBPointsRect := Rect(HotZoneRect.Right - FHotZoneRoundRectHeight - FHotZonePointsRectHeight,
      HotZoneRect.Top, HotZoneRect.Right - FHotZoneRoundRectHeight - FHotZonePointsRectHeight + FHotZonePointsRectHeight,
      HotZoneRect.Bottom);
    FArrowRect := Rect(HotZoneRect.Left + FHotZonePointsRectHeight + FHotZoneRoundRectHeight,
      HotZoneRect.Top, HotZoneRect.Left + FHotZonePointsRectHeight + FHotZoneRoundRectHeight + 19,
      HotZoneRect.Top + SplitterDefaultSize - 1);
  end;
  Result := HotZoneRect;
end;

procedure TcxMediaPlayer8Style.DrawBackground(ACanvas: TcxCanvas; const ARect: TRect;
  const AHighlighted, AClicked: Boolean);
begin
  ACanvas.Pen.Color := FOwner.Color;
  ACanvas.Brush.Color := FOwner.Color;
  ACanvas.FillRect(ARect);
  case SplitterDirection of
    cxsdLeftToRight:
    begin
      {Shadow border}
      DrawCanvasLine(ACanvas.Canvas, ShadowColor, Point(ARect.Left, ARect.Bottom - 4),
        Point(ARect.Left, ARect.Top + 3));
      DrawCanvasLine(ACanvas.Canvas, ShadowColor, Point(ARect.Right, ARect.Bottom),
        Point(ARect.Right, ARect.Top));
      DrawCanvasLine(ACanvas.Canvas, ShadowColor, Point(ARect.Left + 1, ARect.Bottom - 2),
        Point(ARect.Left + 1, ARect.Bottom - 4));
      DrawCanvasLine(ACanvas.Canvas, ShadowColor, Point(ARect.Left + 1, ARect.Top + 2),
        Point(ARect.Left + 1, ARect.Top + 4));
      DrawCanvasLine(ACanvas.Canvas, ShadowColor, Point(ARect.Left + 2, ARect.Bottom - 1),
        Point(ARect.Left + 4, ARect.Bottom - 1));
      DrawCanvasLine(ACanvas.Canvas, ShadowColor, Point(ARect.Left + 2, ARect.Top + 1),
        Point(ARect.Left + 4, ARect.Top + 1));
      DrawCanvasLine(ACanvas.Canvas, ShadowColor, Point(ARect.Left + 4, ARect.Bottom),
        Point(ARect.Right, ARect.Bottom));
      DrawCanvasLine(ACanvas.Canvas, ShadowColor, Point(ARect.Left + 4, ARect.Top),
        Point(ARect.Right + 1, ARect.Top));
      {Light border}
      if AClicked = False then
      begin
        DrawCanvasLine(ACanvas.Canvas, LightColor, Point(ARect.Left + 1, ARect.Bottom - 4),
          Point(ARect.Left + 1, ARect.Top + 3));
        DrawCanvasLine(ACanvas.Canvas, LightColor, Point(ARect.Left + 2, ARect.Top + 2),
          Point(ARect.Left + 2, ARect.Top + 4));
        DrawCanvasLine(ACanvas.Canvas, LightColor, Point(ARect.Left + 2, ARect.Top + 2),
          Point(ARect.Left + 4, ARect.Top + 2));
        DrawCanvasLine(ACanvas.Canvas, LightColor, Point(ARect.Left + 4, ARect.Top + 1),
          Point(ARect.Right, ARect.Top + 1));
        DrawCanvasLine(ACanvas.Canvas, LightColor, Point(ARect.Left + 2, ARect.Bottom - 2),
          Point(ARect.Left + 2, ARect.Bottom - 4));
        DrawCanvasLine(ACanvas.Canvas, LightColor, Point(ARect.Left + 2, ARect.Bottom - 2),
          Point(ARect.Left + 4, ARect.Bottom - 2));
        DrawCanvasLine(ACanvas.Canvas, LightColor, Point(ARect.Left + 4, ARect.Bottom - 1),
          Point(ARect.Left + 5, ARect.Bottom - 1));
      end
      else
      begin
        DrawCanvasLine(ACanvas.Canvas, LightColor, Point(ARect.Right - 1, ARect.Bottom - 1),
          Point(ARect.Right - 1, ARect.Top + 1));
        DrawCanvasLine(ACanvas.Canvas, LightColor, Point(ARect.Left + 2, ARect.Bottom - 2),
          Point(ARect.Left + 4, ARect.Bottom - 2));
        DrawCanvasLine(ACanvas.Canvas, LightColor, Point(ARect.Left + 4, ARect.Bottom - 1),
          Point(ARect.Left + 7, ARect.Bottom - 1));
      end;
    end;
    cxsdRightToLeft:
    begin
      {Shadow border}
      DrawCanvasLine(ACanvas.Canvas, ShadowColor, Point(ARect.Right, ARect.Bottom - 4),
        Point(ARect.Right, ARect.Top + 3));
      DrawCanvasLine(ACanvas.Canvas, ShadowColor, Point(ARect.Left, ARect.Bottom),
        Point(ARect.Left, ARect.Top));
      DrawCanvasLine(ACanvas.Canvas, ShadowColor, Point(ARect.Right - 1, ARect.Bottom - 2),
        Point(ARect.Right - 1, ARect.Bottom - 4));
      DrawCanvasLine(ACanvas.Canvas, ShadowColor, Point(ARect.Right - 1, ARect.Top + 2),
        Point(ARect.Right - 1, ARect.Top + 4));
      DrawCanvasLine(ACanvas.Canvas, ShadowColor, Point(ARect.Right - 2, ARect.Bottom - 1),
        Point(ARect.Right - 4, ARect.Bottom - 1));
      DrawCanvasLine(ACanvas.Canvas, ShadowColor, Point(ARect.Right - 2, ARect.Top + 1),
        Point(ARect.Right - 4, ARect.Top + 1));
      DrawCanvasLine(ACanvas.Canvas, ShadowColor, Point(ARect.Right - 4, ARect.Bottom),
        Point(ARect.Left, ARect.Bottom));
      DrawCanvasLine(ACanvas.Canvas, ShadowColor, Point(ARect.Right - 3, ARect.Top),
        Point(ARect.Left - 1, ARect.Top));
      {Light border}
      if AClicked = False then
      begin
        DrawCanvasLine(ACanvas.Canvas, LightColor, Point(ARect.Left + 1, ARect.Bottom - 1),
          Point(ARect.Left + 1, ARect.Top + 1));
        DrawCanvasLine(ACanvas.Canvas, LightColor, Point(ARect.Left + 1, ARect.Top + 1),
          Point(ARect.Left + 4, ARect.Top + 1));
        DrawCanvasLine(ACanvas.Canvas, LightColor, Point(ARect.Left + 4, ARect.Top + 2),
          Point(ARect.Left + 6, ARect.Top + 2));
      end
      else
      begin
        DrawCanvasLine(ACanvas.Canvas, LightColor, Point(ARect.Left + 3, ARect.Top + 1),
          Point(ARect.Left + 4, ARect.Top + 1));
        DrawCanvasLine(ACanvas.Canvas, LightColor, Point(ARect.Left + 4, ARect.Top + 2),
          Point(ARect.Left + 6, ARect.Top + 2));
        DrawCanvasLine(ACanvas.Canvas, LightColor, Point(ARect.Left + 5, ARect.Top + 2),
          Point(ARect.Left + 5, ARect.Top + 4));
        DrawCanvasLine(ACanvas.Canvas, LightColor, Point(ARect.Left + 6, ARect.Top + 4),
          Point(ARect.Left + 6, ARect.Bottom - 3));
        DrawCanvasLine(ACanvas.Canvas, LightColor, Point(ARect.Left + 1, ARect.Bottom - 1),
          Point(ARect.Left + 4, ARect.Bottom - 1));
        DrawCanvasLine(ACanvas.Canvas, LightColor, Point(ARect.Left + 4, ARect.Bottom - 2),
          Point(ARect.Left + 6, ARect.Bottom - 2));
        DrawCanvasLine(ACanvas.Canvas, LightColor, Point(ARect.Left + 5, ARect.Bottom - 2),
          Point(ARect.Left + 5, ARect.Bottom - 4));
      end;
    end;
    cxsdTopToBottom:
    begin
      {Shadow border}
      DrawCanvasLine(ACanvas.Canvas, ShadowColor, Point(ARect.Left + 4, ARect.Top),
        Point(ARect.Right - 3, ARect.Top));
      DrawCanvasLine(ACanvas.Canvas, ShadowColor, Point(ARect.Left, ARect.Bottom),
        Point(ARect.Right, ARect.Bottom));
      DrawCanvasLine(ACanvas.Canvas, ShadowColor, Point(ARect.Left + 2, ARect.Top + 1),
        Point(ARect.Left + 4, ARect.Top + 1));
      DrawCanvasLine(ACanvas.Canvas, ShadowColor, Point(ARect.Right - 2, ARect.Top + 1),
        Point(ARect.Right - 4, ARect.Top + 1 ));
      DrawCanvasLine(ACanvas.Canvas, ShadowColor, Point(ARect.Left + 1, ARect.Top + 2),
        Point(ARect.Left + 1, ARect.Top + 4));
      DrawCanvasLine(ACanvas.Canvas, ShadowColor, Point(ARect.Right - 1, ARect.Top + 2),
        Point(ARect.Right - 1,ARect.Top + 4));
      DrawCanvasLine(ACanvas.Canvas, ShadowColor, Point(ARect.Left, ARect.Top + 4),
        Point(ARect.Left, ARect.Bottom));
      DrawCanvasLine(ACanvas.Canvas, ShadowColor, Point(ARect.Right, ARect.Top + 4),
        Point(ARect.Right, ARect.Bottom + 1));
      {Light border}
      if AClicked = False then
      begin
        DrawCanvasLine(ACanvas.Canvas, LightColor, Point(ARect.Left + 4, ARect.Top + 1),
          Point(ARect.Right - 3, ARect.Top + 1));
        DrawCanvasLine(ACanvas.Canvas, LightColor, Point(ARect.Right - 2, ARect.Top + 2),
          Point(ARect.Right - 4, ARect.Top + 2));
        DrawCanvasLine(ACanvas.Canvas, LightColor, Point(ARect.Right - 2, ARect.Top + 2),
          Point(ARect.Right - 2, ARect.Top + 4));
        DrawCanvasLine(ACanvas.Canvas, LightColor, Point(ARect.Right - 1, ARect.Top + 4),
          Point(ARect.Right - 1, ARect.Bottom));
        DrawCanvasLine(ACanvas.Canvas, LightColor, Point(ARect.Left + 2, ARect.Top + 2),
          Point(ARect.Left + 4, ARect.Top + 2));
        DrawCanvasLine(ACanvas.Canvas, LightColor, Point(ARect.Left + 2, ARect.Top + 2),
          Point(ARect.Left + 2, ARect.Top + 4));
        DrawCanvasLine(ACanvas.Canvas, LightColor, Point(ARect.Left + 1, ARect.Top + 4),
          Point(ARect.Left + 1, ARect.Top + 5));
      end
      else
      begin
        DrawCanvasLine(ACanvas.Canvas, LightColor, Point(ARect.Left + 1, ARect.Bottom - 1),
          Point(ARect.Right - 1, ARect.Bottom - 1));
        DrawCanvasLine(ACanvas.Canvas, LightColor, Point(ARect.Left + 2, ARect.Top + 2),
          Point(ARect.Left + 2, ARect.Top + 4));
        DrawCanvasLine(ACanvas.Canvas, LightColor, Point(ARect.Left + 1, ARect.Top + 4),
          Point(ARect.Left + 1, ARect.Top + 7));
      end;
    end;
    cxsdBottomToTop:
    begin
      {Shadow border}
      DrawCanvasLine(ACanvas.Canvas, ShadowColor, Point(ARect.Left + 4, ARect.Bottom),
        Point(ARect.Right - 3, ARect.Bottom));
      DrawCanvasLine(ACanvas.Canvas, ShadowColor, Point(ARect.Left, ARect.Top),
        Point(ARect.Right, ARect.Top));
      DrawCanvasLine(ACanvas.Canvas, ShadowColor, Point(ARect.Left + 2, ARect.Bottom - 1),
        Point(ARect.Left + 4, ARect.Bottom - 1));
      DrawCanvasLine(ACanvas.Canvas, ShadowColor, Point(ARect.Right - 2, ARect.Bottom - 1),
        Point(ARect.Right - 4, ARect.Bottom - 1 ));
      DrawCanvasLine(ACanvas.Canvas, ShadowColor, Point(ARect.Left + 1, ARect.Bottom - 2),
        Point(ARect.Left + 1, ARect.Bottom - 4));
      DrawCanvasLine(ACanvas.Canvas, ShadowColor, Point(ARect.Right - 1, ARect.Bottom - 2),
        Point(ARect.Right - 1,ARect.Bottom - 4));
      DrawCanvasLine(ACanvas.Canvas, ShadowColor, Point(ARect.Left, ARect.Bottom - 4),
        Point(ARect.Left, ARect.Top));
      DrawCanvasLine(ACanvas.Canvas, ShadowColor, Point(ARect.Right, ARect.Bottom - 3),
        Point(ARect.Right, ARect.Top - 1));
      {Light border}
      if AClicked = False then
      begin
        DrawCanvasLine(ACanvas.Canvas, LightColor, Point(ARect.Left + 1, ARect.Top + 1),
          Point(ARect.Right - 1, ARect.Top + 1));
        DrawCanvasLine(ACanvas.Canvas, LightColor, Point(ARect.Left + 2, ARect.Bottom - 2),
          Point(ARect.Left + 2, ARect.Bottom - 4));
        DrawCanvasLine(ACanvas.Canvas, LightColor, Point(ARect.Left + 1, ARect.Bottom - 4),
          Point(ARect.Left + 1, ARect.Bottom - 7));
      end
      else
      begin
        DrawCanvasLine(ACanvas.Canvas, LightColor, Point(ARect.Left + 4, ARect.Bottom - 1),
          Point(ARect.Right - 3, ARect.Bottom - 1));
        DrawCanvasLine(ACanvas.Canvas, LightColor, Point(ARect.Right - 2, ARect.Bottom - 2),
          Point(ARect.Right - 4, ARect.Bottom - 2));
        DrawCanvasLine(ACanvas.Canvas, LightColor, Point(ARect.Right - 2, ARect.Bottom - 2),
          Point(ARect.Right - 2, ARect.Bottom - 4));
        DrawCanvasLine(ACanvas.Canvas, LightColor, Point(ARect.Right - 1, ARect.Bottom - 4),
          Point(ARect.Right - 1, ARect.Top));
        DrawCanvasLine(ACanvas.Canvas, LightColor, Point(ARect.Left + 2, ARect.Bottom - 2),
          Point(ARect.Left + 4, ARect.Bottom - 2));
        DrawCanvasLine(ACanvas.Canvas, LightColor, Point(ARect.Left + 2, ARect.Bottom - 2),
          Point(ARect.Left + 2, ARect.Bottom - 4));
        DrawCanvasLine(ACanvas.Canvas, LightColor, Point(ARect.Left + 1, ARect.Bottom - 4),
          Point(ARect.Left + 1, ARect.Bottom - 5));
      end;
    end;
  end;
end;

procedure TcxMediaPlayer8Style.DrawArrowRect(ACanvas: TcxCanvas; const ARect: TRect;
  const AHighlighted, AClicked: Boolean);
begin
  ACanvas.Brush.Color := FOwner.Color;
  ACanvas.FillRect(ARect);
  if AClicked = False then
    DrawBounds(ACanvas, ARect, FShadowColor, FLightColor)
  else
    DrawBounds(ACanvas, ARect, FLightColor, FShadowColor);
end;
{ TcxMediaPlayer8Style }

{ TcxXPTaskBarStyle }
constructor TcxXPTaskBarStyle.Create(AOwner: TcxCustomSplitter);
begin
  inherited Create(AOwner);
  FLightColor := clWindow;
  FShadowColor := clBtnShadow;
end;

procedure TcxXPTaskBarStyle.Assign(Source: TPersistent);
begin
  if (Source is TcxXPTaskBarStyle) then
  begin
    inherited Assign(Source);
    with (Source as TcxXPTaskBarStyle) do
    begin
      Self.LightColor := LightColor;
      Self.ShadowColor := ShadowColor;
    end;
  end
  else
    inherited Assign(Source);
end;

procedure TcxXPTaskBarStyle.SetLightColor(Value: TColor);
begin
  if FLightColor <> Value then
  begin
    FLightColor := Value;
    Changed;
  end;
end;

procedure TcxXPTaskBarStyle.SetShadowColor(Value: TColor);
begin
  if FShadowColor <> Value then
  begin
    FShadowColor := Value;
    Changed;
  end;
end;

function TcxXPTaskBarStyle.DrawHotZone(ACanvas: TcxCanvas; const ARect: TRect;
  const AHighlighted, AClicked: Boolean): TRect;
begin
  Result := CalculateHotZoneRect(ARect);
  ACanvas.Canvas.Lock;
  try
    ACanvas.Canvas.Brush.Color := Owner.Color;
    DrawBackground(ACanvas, HotZoneRect, AHighlighted, AClicked);
    DrawSplitterDots(ACanvas, FLTPointsRect, not AClicked, True, FLightColor,
      FShadowColor, SplitterDirection, 4, 0);
    DrawSplitterDots(ACanvas, FRBPointsRect, not AClicked, True, FLightColor,
      FShadowColor, SplitterDirection, 4, 0);
  finally
    ACanvas.Canvas.Unlock;
  end;
end;

function TcxXPTaskBarStyle.CalculateHotZoneRect(const ABounds: TRect): TRect;
var
  FRect : TRect;
  FHotZoneRectSize, FPos: Integer;
begin
  Result := inherited CalculateHotZoneRect(ABounds);

  FRect := ABounds;
  case SplitterDirection of
    cxsdLeftToRight, cxsdRightToLeft:
    begin
      FRect.Right := FRect.Left + SplitterDefaultSize - 1;
      FHotZoneRectSize := ((FRect.Bottom - FRect.Top) * SizePercent) div 100;
      FPos := ((FRect.Bottom - FRect.Top) div 2) - (FHotZoneRectSize div 2);
      Result := Rect(FRect.Left, FPos, FRect.Right, FPos + FHotZoneRectSize);
      FLTPointsRect := Rect(Result.Left + 1, Result.Top,
        (Result.Right div 2), Result.Bottom);
      FRBPointsRect := Rect((Result.Right div 2) + 1, Result.Top + 3,
        Result.Right, Result.Bottom);
    end;
    else
    begin
      FRect.Bottom := FRect.Top + SplitterDefaultSize - 1;
      FHotZoneRectSize := ((FRect.Right - FRect.Left) * SizePercent) div 100;
      FPos := ((FRect.Right - FRect.Left) div 2) - (FHotZoneRectSize div 2);
      Result := Rect(FPos, FRect.Top, FPos + FHotZoneRectSize, FRect.Bottom);
      FLTPointsRect := Rect(Result.Left, Result.Top + 1,
        Result.Right, Result.Bottom div 2);
      FRBPointsRect := Rect(Result.Left + 3, (Result.Bottom div 2) + 1,
        Result.Right, Result.Bottom);
    end;
  end;
  HotZoneRect := Result;
end;

procedure TcxXPTaskBarStyle.DrawBackground(ACanvas: TcxCanvas; const ARect: TRect;
  const AHighlighted, AClicked: Boolean);
var
  FRect: TRect;
begin
  FRect := ARect;
  ACanvas.Pen.Color := Owner.Color;
  ACanvas.Brush.Color := Owner.Color;
  ACanvas.FillRect(FRect);
end;
{ TcxXPTaskBarStyle }

{ TcxSimpleStyle }
constructor TcxSimpleStyle.Create(AOwner: TcxCustomSplitter);
begin
  inherited Create(AOwner);
  FLightColor := clWindow;
  FShadowColor := clBtnShadow;
  FArrowColor := clWindowText;
  FArrowHighlightColor := clWindow;
  FDotsColor := clHighlight;
  FDotsShadowColor := clWindow;
end;

procedure TcxSimpleStyle.Assign(Source: TPersistent);
begin
  if (Source is TcxSimpleStyle) then
  begin
    inherited Assign(Source);
    with (Source as TcxSimpleStyle) do
    begin
      Self.LightColor := LightColor;
      Self.ShadowColor := ShadowColor;
      Self.ArrowColor := ArrowColor;
      Self.ArrowHighlightColor := ArrowHighlightColor;
      Self.DotsColor := DotsColor;
      Self.DotsShadowColor := DotsShadowColor;
    end;
  end
  else
    inherited Assign(Source);
end;

procedure TcxSimpleStyle.SetLightColor(Value: TColor);
begin
  if FLightColor <> Value then
  begin
    FLightColor := Value;
    Changed;
  end;
end;

procedure TcxSimpleStyle.SetShadowColor(Value: TColor);
begin
  if FShadowColor <> Value then
  begin
    FShadowColor := Value;
    Changed;
  end;
end;

procedure TcxSimpleStyle.SetArrowColor(Value: TColor);
begin
  if FArrowColor <> Value then
  begin
    FArrowColor := Value;
    Changed;
  end;
end;

procedure TcxSimpleStyle.SetArrowHighlightColor(Value: TColor);
begin
  if FArrowHighlightColor <> Value then
  begin
    FArrowHighlightColor := Value;
    Changed;
  end;
end;

procedure TcxSimpleStyle.SetDotsColor(Value: TColor);
begin
  if FDotsColor <> Value then
  begin
    FDotsColor := Value;
    Changed;
  end;
end;

procedure TcxSimpleStyle.SetDotsShadowColor(Value: TColor);
begin
  if FDotsShadowColor <> Value then
  begin
    FDotsShadowColor := Value;
    Changed;
  end;
end;

function TcxSimpleStyle.DrawHotZone(ACanvas: TcxCanvas; const ARect: TRect;
  const AHighlighted, AClicked: Boolean): TRect;
begin
  Result := CalculateHotZoneRect(ARect);
  ACanvas.Canvas.Lock;
  try
    ACanvas.Canvas.Brush.Color := Owner.Color;
    DrawBackground(ACanvas, HotZoneRect, AHighlighted, AClicked);
    DrawHotZoneArrow(ACanvas, FLTArrowRect, AHighlighted, AClicked, FArrowColor,
      FArrowHighlightColor, SplitterDirection);
    DrawHotZoneArrow(ACanvas, FRBArrowRect, AHighlighted, AClicked, FArrowColor,
      FArrowHighlightColor, SplitterDirection);
  finally
    ACanvas.Canvas.Unlock;
  end;
end;

function TcxSimpleStyle.CalculateHotZoneRect(const ABounds: TRect): TRect;
begin
  Result := inherited CalculateHotZoneRect(ABounds);
  case SplitterDirection of
    cxsdLeftToRight, cxsdRightToLeft:
    begin
      FLTArrowRect := Rect(Result.Left, Result.Top + 5, Result.Right, Result.Top + 12);
      FRBArrowRect := Rect(Result.Left, Result.Bottom - 12, Result.Right, Result.Bottom - 5);
    end;
    else
    begin
      FLTArrowRect := Rect(Result.Left + 5, Result.Top, Result.Left + 12, Result.Bottom);
      FRBArrowRect := Rect(Result.Right - 12, Result.Top, Result.Right - 5, Result.Bottom);
    end;
  end;
  HotZoneRect := Result;
end;

procedure TcxSimpleStyle.DrawBackground(ACanvas: TcxCanvas; const ARect: TRect;
  const AHighlighted, AClicked: Boolean);
var
  MiddlePos, I_count : Integer;
  FRect: TRect;
begin
  with ACanvas, ARect do
  begin
    FRect := DrawBounds(ACanvas, HotZoneRect, ShadowColor, ShadowColor);
    Brush.Color := Owner.Color;
    FillRect(FRect);
    {Draw Border}
    if AClicked = False then
      DrawBounds(ACanvas, FRect, LightColor, Owner.Color)
    else
      DrawBounds(ACanvas, FRect, Owner.Color, LightColor);

    Pen.Color := clHighlight;
    Brush.Color := clHighlight;
    if (SplitterDirection = cxsdTopToBottom) or (SplitterDirection = cxsdBottomToTop) then
    begin
      MiddlePos:=Top + (Bottom - Top) div 2;
      for I_count := 0 to ((Right - Left - 32) div 3) do
      begin
        if AClicked = False then
        begin
          Pixels[Left + 15 + I_count * 3, MiddlePos] := DotsShadowColor;
          Pixels[Left + 16 + I_count * 3, MiddlePos + 1] := DotsColor;
        end
        else
        begin
          Pixels[Left + 15 + I_count * 3, MiddlePos] := DotsColor;
          Pixels[Left + 16 + I_count * 3, MiddlePos + 1] := DotsShadowColor;
        end;
      end;
    end
    else
    begin
      MiddlePos := Left + (Right - Left) div 2;
      for I_count := 0 to ((Bottom - Top - 32) div 3) do
      begin
        if AClicked = False then
        begin
          Pixels[MiddlePos, Top + 15 + I_count * 3] := DotsShadowColor;
          Pixels[MiddlePos + 1, Top + 16 + I_count * 3] := DotsColor;
        end
        else
        begin
          Pixels[MiddlePos, Top + 15 + I_count * 3] := DotsColor;
          Pixels[MiddlePos + 1, Top + 16 + I_count * 3] := DotsShadowColor;
        end;
      end;
    end;
  end;
end;
{ TcxSimpleStyle }

{ TcxCustomSplitter }
constructor TcxCustomSplitter.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle - [csAcceptsControls, csSetCaption];
  FState := ssOpened;
  FResizeUpdate := False;
  FLineVisible := False;
  FSplitterState := sstNormal;
  FMouseStates := [];
  FAllowHotZoneDrag := True;
  FDragThreshold := 3;
  FAutoSnap := False;
  FResizeIgnoreSnap := True;
  FAutoPosition := True;
  FMinSize := 30;
  FPositionAfterOpen := 30;
  FNativeBackground := True;
  FInvertDirection := False;
  FOldSize := -1;
  FNewSize := 30;
  FPositionBeforeClose := FMinSize;
  FHotZone := nil;
  FHotZoneClickPoint := Point(-1, -1);
  FLastPatternDrawPosition := -1;
  FDrawBitmap := TBitmap.Create;
  FDrawCanvas := TcxCanvas.Create(FDrawBitmap.Canvas);
  BorderStyle := cxcbsNone;
  Align := alNone;
  Width := SplitterDefaultSize;
  SetAlignSplitter(salLeft);
  AutoSize := True;
  TabStop := False;
end;

destructor TcxCustomSplitter.Destroy;
begin
  FControl := nil;
  DestroyHotZone;
  if Assigned(FBrush) then FreeAndNil(FBrush);
  if Assigned(FDrawCanvas) then FreeAndNil(FDrawCanvas);
  if Assigned(FDrawBitmap) then FreeAndNil(FDrawBitmap);
  inherited Destroy;
end;

procedure TcxCustomSplitter.Loaded;
begin
  inherited Loaded;
  if (csDesigning in ComponentState) then
  begin
    if FControl = nil then
      FControl := FindControl;
  end;
  SetAlignSplitter(FAlignSplitter);
end;

procedure TcxCustomSplitter.Notification(AComponent: TComponent; Operation: Toperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (FControl <> nil) and
    (AComponent = FControl) then
    FControl := nil;
end;

procedure TcxCustomSplitter.SetHotZoneStyleClass(const Value: TcxHotZoneStyleClass);
var
  ASavedHotZone: TcxHotZoneStyle;
begin
  if FHotZoneStyleClass <> Value then
  begin
    ASavedHotZone := nil;
    try
      if Assigned(FHotZone) then
      begin
        ASavedHotZone := TcxHotZoneStyle.Create(Self);
        ASavedHotZone.Assign(FHotZone);
      end;
      DestroyHotZone;
      FHotZoneStyleClass := Value;
      CreateHotZone;
      if Assigned(FHotZone) and Assigned(ASavedHotZone) then
        FHotZone.Assign(ASavedHotZone);
    finally
      if Assigned(ASavedHotZone) then
        FreeAndNil(ASavedHotZone);
    end;
  end;
end;

function TcxCustomSplitter.GetHotZoneClassName: string;
begin
  if FHotZone = nil then
    Result := ''
  else
    Result := FHotZone.ClassName;
end;

procedure TcxCustomSplitter.SetHotZoneClassName(Value: string);
begin
  HotZoneStyleClass := TcxHotZoneStyleClass(GetRegisteredHotZoneStyles.FindByClassName(Value));
end;

procedure TcxCustomSplitter.CreateHotZone;
begin
  if FHotZoneStyleClass <> nil then
    FHotZone := FHotZoneStyleClass.Create(Self);
  Invalidate;
end;

procedure TcxCustomSplitter.DestroyHotZone;
begin
  if Assigned(FHotZone) then FreeAndNil(FHotZone);
end;

procedure TcxCustomSplitter.SetHotZone(Value: TcxHotZoneStyle);
begin
  FHotZone := Value;
  Invalidate;
end;

procedure TcxCustomSplitter.SetNativeBackground(Value: Boolean);
begin
  if FNativeBackground <> Value then
  begin
    FNativeBackground := Value;
    Invalidate;
  end;
end;

procedure TcxCustomSplitter.AllocateSplitLineDC;
begin
  FLineDC := GetDCEx(Parent.Handle, 0, DCX_CACHE or DCX_CLIPSIBLINGS or DCX_LOCKWINDOWUPDATE);
  if not ResizeUpdate then
  begin
    if not Assigned(FBrush) then
    begin
      FBrush := TBrush.Create;
      {$IFDEF DELPHI4}
      FBrush.Bitmap := AllocPatternBitmap(clBlack, clWhite);
      {$ENDIF}
    end;
    FPrevBrush := SelectObject(FLineDC, FBrush.Handle);
  end;
end;

procedure TcxCustomSplitter.DrawSplitLine;
var
  FPoint : TPoint;
begin
  FLineVisible := not FLineVisible;
  FPoint := Point(Left, Top);
  if Align in [alLeft, alRight] then
    FPoint.X := Left + FSplit
  else
    FPoint.Y := Top + FSplit;
  PatBlt(FLineDC, FPoint.X + 1, FPoint.Y + 1, Width - 1, Height - 1, DSTINVERT);
end;

procedure TcxCustomSplitter.ReleaseSplitLine;
begin
  if FPrevBrush <> 0 then
    SelectObject(FLineDC, FPrevBrush);
  ReleaseDC(Parent.Handle, FLineDC);
  if FBrush <> nil then
    FreeAndNil(FBrush);
end;

procedure TcxCustomSplitter.CMMouseEnter(var Message: TMessage);
begin
  inherited;
end;

procedure TcxCustomSplitter.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  Exclude(FMouseStates, smsInHotZone);
  Invalidate;
end;

procedure TcxCustomSplitter.CMTabStopChanged(var Message: TMessage);
begin
  inherited;
  if TabStop then
    TabStop := False;
end;

procedure TcxCustomSplitter.SetAlignSplitter(Value: TcxSplitterAlign);
begin
  FAlignSplitter := Value;
  NormalizeSplitterSize;
  case FAlignSplitter of
    salBottom: Align := alBottom;
    salLeft: Align := alLeft;
    salRight: Align := alRight;
    salTop: Align := alTop;
  end;
  CalculateSplitterDirection;
end;

function TcxCustomSplitter.GetSplitterMinSize: TcxNaturalNumber;
begin
  if Assigned(FHotZone) then
    Result := FHotZone.GetMinSize
  else
    Result := SplitterDefaultSize;
end;

function TcxCustomSplitter.GetSplitterMaxSize: TcxNaturalNumber;
begin
  if Assigned(FHotZone) then
    Result := FHotZone.GetMaxSize
  else
    Result := SplitterDefaultSize;
end;

procedure TcxCustomSplitter.NormalizeSplitterSize;
begin
  case FAlignSplitter of
    salBottom, salTop: Height := GetSplitterMinSize;
    salLeft, salRight: Width := GetSplitterMinSize;
  end;
  {$IFDEF DELPHI4}
  case FAlignSplitter of
    salBottom, salTop:begin
      Constraints.MinWidth := 0;
      Constraints.MaxWidth := 0;
      Constraints.MinHeight := GetSplitterMinSize;
      Constraints.MaxHeight := GetSplitterMaxSize;
      if (Height < Constraints.MinHeight) or (Height > Constraints.MaxHeight) then
        Height := Constraints.MinHeight;
    end;
    salLeft, salRight:begin
      Constraints.MinWidth := GetSplitterMinSize;
      Constraints.MaxWidth := GetSplitterMaxSize;
      Constraints.MinHeight := 0;
      Constraints.MaxHeight := 0;
      if (Width < Constraints.MinWidth) or (Width > Constraints.MaxWidth) then
        Width := Constraints.MinWidth;
      Align := alLeft;
    end;
  end;
  {$ENDIF}
end;

function TcxCustomSplitter.CalculateSplitterDirection: TcxSplitterDirection;
begin
  Result := Low(TcxSplitterDirection);
  case FAlignSplitter of
    salTop:
      if ((State = ssOpened) and (not InvertDirection)) or
        ((State = ssClosed) and (InvertDirection)) then
        Result := cxsdBottomToTop
      else
        Result := cxsdTopToBottom;
    salBottom:
      if ((State = ssOpened) and (not InvertDirection)) or
        ((State = ssClosed) and (InvertDirection)) then
        Result := cxsdTopToBottom
      else
        Result := cxsdBottomToTop;
    salLeft:
      if ((State = ssOpened) and (not InvertDirection)) or
        ((State = ssClosed) and (InvertDirection)) then
        Result := cxsdRightToLeft
      else
        Result := cxsdLeftToRight;
    salRight:
      if ((State = ssOpened) and (not InvertDirection)) or
        ((State = ssClosed) and (InvertDirection)) then
        Result := cxsdLeftToRight
      else
        Result := cxsdRightToLeft;
  end;
end;

procedure TcxCustomSplitter.UpdateMouseStates(X, Y: Integer);
begin
  if IsPointInHotZone(X, Y) then
    Include(FMouseStates, smsInHotZone)
  else
    Exclude(FMouseStates, smsInHotZone);
end;

procedure TcxCustomSplitter.SetSplitterState(Value: TcxSplitterState);
begin
  if FState <> Value then
  begin
    if Assigned(FControl) then
    begin
      case Value of
        ssOpened: OpenSplitter;
        ssClosed: CloseSplitter;
      end;
    end;
    FState := Value;
  end;
end;

procedure TcxCustomSplitter.SetAllowHotZoneDrag(Value: Boolean);
begin
  if FAllowHotZoneDrag <> Value then
  begin
    StopSizing;
    FAllowHotZoneDrag := Value;
  end;
end;

procedure TcxCustomSplitter.SetInvertDirection(Value: Boolean);
begin
  if FInvertDirection <> Value then
  begin
    FInvertDirection := Value;
    StopSizing;
    Invalidate;
  end;
end;

function TcxCustomSplitter.FindControl: TControl;
var
  P: TPoint;
  I_count: Integer;
  R, FRReligned: TRect;
begin
  Result := nil;
  P := Point(Left, Top);
  case Align of
    alLeft: Dec(P.X);
    alRight: Inc(P.X, Width);
    alTop: Dec(P.Y);
    alBottom: Inc(P.Y, Height);
    else Exit;
  end;
  for I_count:=0 to Parent.ControlCount-1 do
  begin
    Result := Parent.Controls[I_count];
    if (Result.Visible) and (Result.Enabled) then
    begin
      R := Result.BoundsRect;
      if (R.Right - R.Left) = 0 then
        if (Align in [alTop, alLeft]) then
          Dec(R.Left)
        else
          Inc(R.Right);
      if (R.Bottom - R.Top) = 0 then
        if (Align in [alTop, alLeft]) then
          Dec(R.Top)
        else
          Inc(R.Bottom);
      if PtInRect(R, P) = True then Exit
      else
      begin
         if (Result.Align = Self.Align) then
         begin
           FRReligned := Result.BoundsRect;
           case Result.Align of
             alLeft: if (FRReligned.Right = FRReligned.Left) and
               (FRReligned.Left = Self.Width) then Exit;
             alRight: if (FRReligned.Right = FRReligned.Left) and
               (FRReligned.Right = Self.Left) then Exit;
             alTop: if (FRReligned.Bottom = FRReligned.Top) and
               (FRReligned.Top = Self.Height) then Exit;
             alBottom: if (FRReligned.Bottom = FRReligned.Top) and
               (FRReligned.Bottom = Self.Top) then Exit;
           end;
         end;
      end;
    end;
  end;
  Result := nil;
end;

procedure TcxCustomSplitter.HotZoneStyleChanged;
begin
  Invalidate;
end;

procedure TcxCustomSplitter.Paint;
var
  R: TRect;
  ANativeState: Integer;
  ATheme: TTheme;
begin
  R := ClientRect;
  FDrawBitmap.Width := RectWidth(R);
  FDrawBitmap.Height := RectHeight(R);
  FDrawBitmap.Canvas.Brush.Color := Color;
  {$IFDEF VCL}
  if AreVisualStylesMustBeUsed(True, totButton) and NativeBackground then
  begin
    ATheme := OpenTheme(totButton);
    if Enabled then
      ANativeState := GBS_NORMAL
    else
      ANativeState := GBS_DISABLED;
    if IsThemeBackgroundPartiallyTransparent(ATheme, BP_RADIOBUTTON, ANativeState) then
      DrawThemeParentBackground(Handle, Canvas.Handle, @R);
    BitBlt(FDrawBitmap.Canvas.Handle, 0, 0, RectWidth(R), RectHeight(R),
      Canvas.Handle, 0, 0, SRCCOPY);
  end
  else
  {$ENDIF}
  begin
    FDrawBitmap.Canvas.FillRect(R);
  end;
  if (HotZone <> nil) and HotZone.Visible then
    DrawHotZone;
  BitBlt(Canvas.Handle, 0, 0, RectWidth(R), RectHeight(R),
    FDrawBitmap.Canvas.Handle, 0, 0, SRCCOPY);
end;

procedure TcxCustomSplitter.DrawHotZone;
begin
  if HotZone <> nil then
    HotZone.DrawHotZone(FDrawCanvas, FDrawCanvas.Canvas.ClipRect,
      (smsInHotZone in FMouseStates),
      (smsClicked in FMouseStates) and (smsInHotZone in FMouseStates));
end;

function TcxCustomSplitter.DoCanResize(var NewSize: Integer): Boolean;
begin
  Result := CanResize(NewSize);
  if Result and FAutoSnap and (NewSize <= MinSize) then
  begin
    if ((not ResizeIgnoreSnap) and (FSplitterState <> sstResizing)) or
      (ResizeIgnoreSnap and (FSplitterState = sstNormal)) then
      NewSize := 1;
  end;
end;

function TcxCustomSplitter.CanResize(var NewSize: Integer): Boolean;
begin
  Result := True;
  if Assigned(FOnCanResize) then FOnCanResize(Self, NewSize, Result);
end;

procedure TcxCustomSplitter.UpdateControlSize;
begin
  if Assigned(FControl) then
  begin
    if FNewSize <> FOldSize then
    begin
      Application.ProcessMessages;
      case Align of
        alLeft: FControl.SetBounds(FControl.Left, FControl.Top, FNewSize, FControl.Height);
        alTop: FControl.SetBounds(FControl.Left, FControl.Top, FControl.Width, FNewSize);
        alRight:
        begin
          Parent.DisableAlign;
          try
            FControl.SetBounds(FControl.Left + (FControl.Width - FNewSize), FControl.Top, FNewSize, FControl.Height);
          finally
            Parent.EnableAlign;
          end;
        end;
        alBottom:
        begin
          Parent.DisableAlign;
          try
            FControl.SetBounds(FControl.Left, FControl.Top + (FControl.Height - FNewSize), FControl.Width, FNewSize);
          finally
            Parent.EnableAlign;
          end;
        end;
      end;
      Application.ProcessMessages;
      DoEventMoved;
    end;
    if (FState = ssClosed) and (FNewSize > 1) then
    begin
      FState := ssOpened;
      DoEventAfterOpen;
    end;
    if (FState = ssOpened) and (FNewSize = 1) then
    begin
      FState := ssClosed;
      DoEventAfterOpen;
    end;
    FOldSize := FNewSize;
  end;
end;

procedure TcxCustomSplitter.CalcSplitSize(X, Y: Integer; var NewSize, Split: Integer);
var
  S: Integer;
begin
  if not Assigned(FControl) then Exit;
  if Align in [alLeft, alRight] then
    Split := X - FSplitterClickPoint.X
  else
    Split := Y - FSplitterClickPoint.Y;
  S:=0;
  case Align of
    alLeft: S := FControl.Width + Split;
    alRight: S := FControl.Width - Split;
    alTop: S := FControl.Height + Split;
    alBottom: S := FControl.Height - Split;
  end;
  NewSize := S;
  if (S < FMinSize) and (AutoSnap) and (not ResizeIgnoreSnap) then
    NewSize := FMinSize
  else
    if S > FMaxSize then NewSize := FMaxSize;
  if S <> NewSize then
  begin
    if Align in [alRight, alBottom] then
      S := S - NewSize
    else
      S := NewSize - S;
    Inc(Split, S);
  end;
end;

procedure TcxCustomSplitter.UpdateSize(X, Y: Integer);
begin
  CalcSplitSize(X, Y, FNewSize, FSplit);
end;

function TcxCustomSplitter.IsPointInHotZone(const X, Y: Integer): Boolean;
var
  AHotZoneRect: TRect;
begin
  if HotZone <> nil then
  begin
    AHotZoneRect := HotZone.CalculateHotZoneRect(ClientRect);
    Result:=(X >= AHotZoneRect.Left) and (X <= AHotZoneRect.Right) and
      (Y >= AHotZoneRect.Top) and (Y <= AHotZoneRect.Bottom);
  end
  else
    Result := False;
end;

function TcxCustomSplitter.IsPointInSplitter(const X, Y: Integer): Boolean;
var
  FRect : TRect;
begin
  FRect := ClientRect;
  Result := ((X >= FRect.Left) and (X <= FRect.Right) and
    (Y >= FRect.Top) and (Y <= FRect.Bottom));
end;

procedure TcxCustomSplitter.InitResize(X, Y: Integer);
begin
  if (Align in [alLeft, alRight]) then
    FMaxSize := Parent.ClientWidth - Width
  else
    FMaxSize := Parent.ClientHeight - Height;
  UpdateSize(X, Y);
  AllocateSplitLineDC;
  with ValidParentForm(Self) do
    if ActiveControl <> nil then
    begin
      FActiveControl := ActiveControl;
      FOldKeyDown := TWinControlAccess(FActiveControl).OnKeyDown;
      TWinControlAccess(FActiveControl).OnKeyDown := FocusKeyDown;
    end;
  if not ResizeUpdate then
    DrawSplitLine;
end;

procedure TcxCustomSplitter.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited MouseDown(Button, Shift, X, Y);
  if (Button = mbLeft) and Assigned(FControl) then
  begin
    FSplitterClickPoint := Point(X, Y);
    FSavedShowHint := ShowHint;
    FSavedParentShowHint := ParentShowHint;
    ShowHint := False;
    Include(FMouseStates, smsClicked);
    UpdateMouseStates(X, Y);
    if (smsInHotZone in FMouseStates) then
    begin
      FSplitterState := sstHotZoneClick;
      FHotZoneClickPoint := Point(X, Y);
      Invalidate;
    end
    else
    begin
      FSplitterState := sstResizing;
      InitResize(X, Y);
    end;
  end;
end;

procedure TcxCustomSplitter.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  FLocalNewSize, FLocalSplit: Integer;
  FSavedMouseStates: TcxSplitterMouseStates;
begin
  inherited;
  FSavedMouseStates := FMouseStates;
  UpdateMouseStates(X, Y);
  if (ssLeft in Shift) and (Assigned(FControl)) then
  begin
    case FSplitterState of
      sstResizing:
      begin
        CalcSplitSize(X, Y, FLocalNewSize, FLocalSplit);
        if DoCanResize(FLocalNewSize) then
        begin
          if not ResizeUpdate then
            DrawSplitLine;
          FNewSize := FLocalNewSize;
          FSplit := FLocalSplit;
          if not ResizeUpdate then
            DrawSplitLine
          else
          begin
            RecalcLastPosition;
            UpdateControlSize;
          end;
          Invalidate;
        end;
      end;
      sstHotZoneClick:
      begin
        if AllowHotZoneDrag then
        begin
          if ((FHotZoneClickPoint.X + DragThreshold) <= X) or
             ((FHotZoneClickPoint.X - DragThreshold) >= X) or
             ((FHotZoneClickPoint.Y + DragThreshold) <= Y) or
             ((FHotZoneClickPoint.Y - DragThreshold) >= Y) then
          begin
            FSplitterState := sstResizing;
            InitResize(X, Y);
          end;
        end
        else
          if (FMouseStates <> FSavedMouseStates) then
            Invalidate;
      end;
    end;
  end;
  if (not ((ssLeft in Shift) and (ssRight in Shift))) then
  begin
    if (FMouseStates <> FSavedMouseStates) then
      Invalidate;
    if not (smsInHotZone in FMouseStates) then
    begin
      case FAlignSplitter of
        salBottom, salTop: if Cursor <> crVSplit then Cursor := crVSplit;
        salLeft, salRight: if Cursor <> crHSplit then Cursor := crHSplit;
      end;
    end
    else
      if Cursor <> crDefault then Cursor := crDefault;
  end;
end;

procedure TcxCustomSplitter.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var
  FStopAction: Boolean;
begin
  inherited;
  FLastPatternDrawPosition := -1;
  ParentShowHint := FSavedParentShowHint;
  ShowHint := FSavedShowHint;
  if Assigned(FControl) then
  begin
    FStopAction := False;
    UpdateMouseStates(X, Y);
    FHotZoneClickPoint := Point(-1, -1);
    if (FSplitterState = sstHotZoneClick) and (smsInHotZone in FMouseStates) then
    begin
      FStopAction := True;
      case FState of
        ssClosed: OpenSplitter;
        ssOpened: CloseSplitter;
      end;
    end
    else
      RecalcLastPosition;
    if (FSplitterState = sstResizing) and (not ResizeUpdate) then
      DrawSplitLine;
    if (FSplitterState = sstHotZoneClick) and not (smsInHotZone in FMouseStates) then
      FOldSize := FNewSize;
    FMouseStates := [];
    StopSizing;
    if ResizeIgnoreSnap then
    begin
      FOldSize := -1;
      DoCanResize(FNewSize);
    end;
    if (FNewSize <= MinSize) and (FNewSize <> 1) and not FStopAction then
    begin
      case FState of
        ssClosed: OpenSplitter;
        ssOpened: CloseSplitter;
      end;
    end;
    UpdateControlSize;
  end;
  Invalidate;
end;

procedure TcxCustomSplitter.FocusKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) then
  begin
    MouseUp(mbLeft, [], Left, Top)
  end
  else
    if Assigned(FOldKeyDown) then FOldKeyDown(Sender, Key, Shift);
end;

procedure TcxCustomSplitter.StopSizing;
begin
  if Assigned(FControl) then
  begin
    if FLineVisible then DrawSplitLine;
    ReleaseSplitLine;
    if Assigned(FActiveControl) then
    begin
      TWinControlAccess(FActiveControl).OnKeyDown := FOldKeyDown;
      FActiveControl := nil;
    end;
    FSplitterState := sstNormal;
    DoEventMoved;
  end;
end;

procedure TcxCustomSplitter.OpenSplitter;
var
  FAllowOpenHotZone: Boolean;
begin
  if State = ssOpened then Exit;
  FAllowOpenHotZone := True;
  DoEventBeforeOpen(FAllowOpenHotZone);
  if FAllowOpenHotZone = False then Exit;
  FState := ssOpened;
  if FAutoPosition = True then
  begin
    if FPositionBeforeClose <= 1 then
      FNewSize := FMinSize + 1
    else
      FNewSize := FPositionBeforeClose;
   end
   else
    FNewSize := FPositionAfterOpen;
  FOldSize := -1;
  RecalcLastPosition;
  UpdateControlSize;
  DoEventAfterOpen;
  Invalidate;
end;

procedure TcxCustomSplitter.CloseSplitter;
var
  FAllowCloseHotZone: Boolean;
begin
  if State = ssClosed then Exit;
  FAllowCloseHotZone := True;
  DoEventBeforeClose(FAllowCloseHotZone);
  if FAllowCloseHotZone = False then Exit;
  FState := ssClosed;
  FNewSize := 1;
  FOldSize := -1;
  RecalcLastPosition;
  UpdateControlSize;
  DoEventAfterClose;
  Invalidate;
end;

procedure TcxCustomSplitter.RecalcLastPosition;
begin
  case FAlignSplitter of
    salBottom:
    begin
      if (FControl<>nil) then
        FPositionBeforeClose := FControl.Height
      else
        FPositionBeforeClose := Top;
    end;
    salLeft: FPositionBeforeClose := Left;
    salRight:
    begin
      if (FControl<>nil) then
        FPositionBeforeClose := FControl.Width
      else
        FPositionBeforeClose := Top;
    end;
    salTop: FPositionBeforeClose := Top;
  end;
end;

procedure TcxCustomSplitter.DoEventBeforeOpen(var AllowOpenHotZone: Boolean);
begin
  if Assigned(FOnBeforeOpen) then FOnBeforeOpen(Self, AllowOpenHotZone);
end;

procedure TcxCustomSplitter.DoEventAfterOpen;
begin
  if Assigned(FOnAfterOpen) then FOnAfterOpen(Self);
end;

procedure TcxCustomSplitter.DoEventBeforeClose(var AllowCloseHotZone: Boolean);
begin
  if Assigned(FOnBeforeClose) then FOnBeforeClose(Self, AllowCloseHotZone);
end;

procedure TcxCustomSplitter.DoEventAfterClose;
begin
  if Assigned(FOnAfterClose) then FOnAfterClose(Self);
end;

procedure TcxCustomSplitter.DoEventMoved;
begin
  if Assigned(FOnMoved) then FOnMoved(Self);
end;
{ TcxCustomSplitter }

initialization
  GetRegisteredHotZoneStyles.Register(TcxMediaPlayer8Style, scxHotZoneStyleMediaPlayer8);
  GetRegisteredHotZoneStyles.Register(TcxMediaPlayer9Style, scxHotZoneStyleMediaPlayer9);
  GetRegisteredHotZoneStyles.Register(TcxXPTaskBarStyle, scxHotZoneStyleXPTaskBar);
  GetRegisteredHotZoneStyles.Register(TcxSimpleStyle, scxHotZoneStyleSimple);

finalization
  GetRegisteredHotZoneStyles.Unregister(TcxMediaPlayer8Style);
  GetRegisteredHotZoneStyles.Unregister(TcxMediaPlayer9Style);
  GetRegisteredHotZoneStyles.Unregister(TcxXPTaskBarStyle);
  GetRegisteredHotZoneStyles.Unregister(TcxSimpleStyle);

end.