
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

unit cxTrackBar;

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
  cxCustomData, cxEdit, cxGraphics, cxTextEdit, cxVariants, cxExtEditConsts,
  cxLookAndFeels;

type
  TcxTrackBarOrientation = (tboHorizontal, tboVertical);
  TcxTrackBarTextOrientation = (tbtoHorizontal, tbtoVertical);
  TcxTrackBarTickMarks = (cxtmBoth, cxtmTopLeft, cxtmBottomRight);
  TcxTrackBarTickType = (tbttTicks, tbttNumbers, tbttValueNumber);
  TcxTrackBarMouseState = (tbmpInControl, tbmpUnderThumb, tbmpSliding);
  TcxTrackBarMouseStates = set of TcxTrackBarMouseState;
  TcxTrackBarSlideState = (tbksNormal, tbksIncludeSelection);
  TcxTrackBarThumbType = (cxttNone, cxttRegular, cxttCustom);
  TcxTrackBarThumbStep = (cxtsNormal, cxtsJump);

  TcxGetThumbRectEvent = procedure(Sender: TObject; var ARect: TRect) of object;
  TcxDrawThumbEvent = procedure(Sender: TObject; ACanvas: TcxCanvas;
    const ARect: TRect) of object;

  { TcxTrackBarStyle }
  TcxTrackBarStyle = class(TcxCustomEditStyle)
  public
    function DefaultColor: TColor; override;
    procedure RestoreDefaults; override;
  end;

  { TcxCustomTrackBarViewInfo }
  TcxCustomTrackBarViewInfo = class(TcxCustomTextEditViewInfo)
  private
    FTrackBarState: Integer;
    FLookAndFeel: TcxLookAndFeel;
    FFrequency: Integer;
    FAutoSize: Boolean;
    FMin: Integer;
    FMax: Integer;
    FOrientation: TcxTrackBarOrientation;
    FTextOrientation: TcxTrackBarTextOrientation;
    FPageSize: Integer;
    FPosition: Integer;
    FTrackColor: TColor;
    FTrackSize: Integer;
    FSelectionStart: Integer;
    FSelectionEnd: Integer;
    FSelectionColor: TColor;
    FShowTicks: Boolean;
    FThumbType: TcxTrackBarThumbType;
    FShowTrack: Boolean;
    FTickColor: TColor;
    FTickType: TcxTrackBarTickType;
    FTickMarks: TcxTrackBarTickMarks;
    FTickSize: TcxNaturalNumber;
    FThumbHeight: Integer;
    FThumbWidth: Integer;
    FThumbColor: TColor;
    FThumbHighlightColor: TColor;
    FTrackBarBorderWidth: Integer;
    FTBCanvas: TcxCanvas;
    FTBBitmap: TBitmap;
    FShortRefresh: Boolean;
    FShowSelection: Boolean;
  protected
    RealTrackBarRect: TRect;
    TrackBarRect: TRect;
    TrackZoneRect: TRect;
    TrackRect: TRect;
    ThumbRect: TRect;
    SelectionRect: TRect;
    FromBorderIndent: Integer;
    OnDrawThumb: TcxDrawThumbEvent;
    procedure DrawTrack(ACanvas: TcxCanvas); virtual;
    procedure DrawSelection(ACanvas: TcxCanvas); virtual;
    procedure DrawTicks(ACanvas: TcxCanvas); virtual;
    procedure DrawThumb(ACanvas: TcxCanvas); virtual;
    procedure PaintTrackBar(ACanvas: TcxCanvas); virtual;
  public
    ThumbSize, ThumbLargeSize, TrackRectDelta: Integer;
    TrackHeight, TrackWidth: Integer;
    TickOffset: Double;
    NeedPointer: Boolean;
    FocusRect: TRect;
    HasForegroundImage: Boolean;
    property LookAndFeel: TcxLookAndFeel read FLookAndFeel write FLookAndFeel;
    property TrackBarState: Integer read FTrackBarState write FTrackBarState;
    property Frequency: Integer read FFrequency write FFrequency;
    property AutoSize: Boolean read FAutoSize write FAutoSize;
    property Min: Integer read FMin write FMin;
    property Max: Integer read FMax write FMax;
    property Orientation: TcxTrackBarOrientation read FOrientation write FOrientation;
    property TextOrientation: TcxTrackBarTextOrientation read FTextOrientation
      write FTextOrientation;
    property PageSize: Integer read FPageSize write FPageSize;
    property Position: Integer read FPosition write FPosition;
    property TrackColor: TColor read FTrackColor write FTrackColor;
    property TrackSize: Integer read FTrackSize write FTrackSize;
    property SelectionStart: Integer read FSelectionStart write FSelectionStart;
    property SelectionEnd: Integer read FSelectionEnd write FSelectionEnd;
    property SelectionColor: TColor read FSelectionColor write FSelectionColor;
    property ShowTicks: Boolean read FShowTicks write FShowTicks;
    property ThumbType: TcxTrackBarThumbType read FThumbType write FThumbType;
    property ShowTrack: Boolean read FShowTrack write FShowTrack;
    property TickColor: TColor read FTickColor write FTickColor;
    property TickType: TcxTrackBarTickType read FTickType write FTickType;
    property TickMarks: TcxTrackBarTickMarks read FTickMarks write FTickMarks;
    property TickSize: TcxNaturalNumber read FTickSize write FTickSize;
    property ThumbHeight: Integer read FThumbHeight write FThumbHeight;
    property ThumbWidth: Integer read FThumbWidth write FThumbWidth;
    property ThumbColor: TColor read FThumbColor write FThumbColor;
    property ThumbHighlightColor: TColor read FThumbHighlightColor
      write FThumbHighlightColor;
    property TrackBarBorderWidth: Integer read FTrackBarBorderWidth
      write FTrackBarBorderWidth;
    procedure Assign(Source: TObject); override;
    procedure DrawText(ACanvas: TcxCanvas); override;
    function GetUpdateRegion(AViewInfo: TcxContainerViewInfo): TcxRegion; override;
    function NeedShowHint(ACanvas: TcxCanvas; const P: TPoint; out AText: TCaption;
      out AIsMultiLine: Boolean; out ATextRect: TRect): Boolean; override;
    procedure Offset(DX, DY: Integer); override;
    procedure Paint(ACanvas: TcxCanvas); override;
    constructor Create; override;
    destructor Destroy; override;
  end;

  { TcxCustomTrackBarViewData }
  TcxCustomTrackBarProperties = class;
  TcxCustomTrackBarViewData = class(TcxCustomEditViewData)
  private
    function GetProperties: TcxCustomTrackBarProperties;
    procedure SetProperties(Value: TcxCustomTrackBarProperties);
  protected
    procedure CalculateCustomTrackBarRects(ACanvas: TcxCanvas;
      AViewInfo: TcxCustomTrackBarViewInfo); virtual;
    function InternalGetEditConstantPartSize(ACanvas: TcxCanvas; AIsInplace: Boolean;
      const AEditSizeProperties: TcxEditSizeProperties;
      var MinContentSize: TSize; AViewInfo: TcxCustomEditViewInfo): TSize; override;
    function GetDrawTextFlags: Integer; virtual;
    function GetIsEditClass: Boolean;
    function GetTopLeftTickSize(ACanvas: TcxCanvas;
      AViewInfo: TcxCustomTrackBarViewInfo; ALeftTop: Boolean): Integer; virtual;
    procedure CalculateTBViewInfoProps(AViewInfo: TcxCustomEditViewInfo); virtual;
    procedure CalculateTrackBarRect(AViewInfo: TcxCustomTrackBarViewInfo); virtual;
    procedure CalculateTrackZoneRect(ACanvas: TcxCanvas;
      AViewInfo: TcxCustomTrackBarViewInfo); virtual;
    procedure CalculateTrackRect(AViewInfo: TcxCustomTrackBarViewInfo); virtual;
    procedure CalculateThumbSize(AViewInfo: TcxCustomTrackBarViewInfo); virtual;
    procedure CalculateThumbRect(AViewInfo: TcxCustomTrackBarViewInfo); virtual;
    procedure CalculateSelectionRect(AViewInfo: TcxCustomTrackBarViewInfo); virtual;
  public
    procedure Calculate(ACanvas: TcxCanvas; const ABounds: TRect; const P: TPoint;
      Button: TcxMouseButton; Shift: TShiftState; AViewInfo: TcxCustomEditViewInfo;
      AIsMouseEvent: Boolean); override;
    procedure EditValueToDrawValue(ACanvas: TcxCanvas; const AEditValue: TcxEditValue;
      AViewInfo: TcxCustomEditViewInfo); override;
    property Properties: TcxCustomTrackBarProperties read GetProperties write SetProperties;
  end;

  { TcxCustomTrackBarProperties }
  TcxCustomTrackBarProperties = class(TcxCustomEditProperties)
  private
    FAutoSize: Boolean;
    FMouseStates: TcxTrackBarMouseStates;
    FShortRefresh: Boolean;
    FBorderWidth: Integer;
    FFrequency: Integer;
    FMin: Integer;
    FMax: Integer;
    FOrientation: TcxTrackBarOrientation;
    FTextOrientation: TcxTrackBarTextOrientation;
    FPageSize: TcxNaturalNumber;
    FSelectionStart: Integer;
    FSelectionEnd: Integer;
    FSelectionColor: TColor;
    FShowTicks: Boolean;
    FThumbType: TcxTrackBarThumbType;
    FShowTrack: Boolean;
    FTickColor: TColor;
    FTickType: TcxTrackBarTickType;
    FTickMarks: TcxTrackBarTickMarks;
    FTickSize: TcxNaturalNumber;
    FTrackColor: TColor;
    FTrackSize: Integer;
    FTrackRect: TRect;
    FThumbRect: TRect;
    FThumbHeight: Integer;
    FThumbWidth: Integer;
    FThumbColor: TColor;
    FThumbHighlightColor: TColor;
    FThumbStep: TcxTrackBarThumbStep;
    FThumbSize: Integer;
    FTickOffset: Double;
    FOnChange: TNotifyEvent;
    FOnGetThumbRect: TcxGetThumbRectEvent;
    FOnDrawThumb: TcxDrawThumbEvent;
    procedure SetAutoSize(Value: Boolean);
    procedure SetBorderWidth(Value: Integer);
    procedure SetFrequency(Value: Integer);
    procedure SetMin(Value: Integer);
    procedure SetMax(Value: Integer);
    procedure SetOrientation(Value: TcxTrackBarOrientation);
    procedure SetTextOrientation(Value: TcxTrackBarTextOrientation);
    procedure SetPageSize(Value: TcxNaturalNumber);
    procedure SetSelectionStart(Value: Integer);
    procedure SetSelectionEnd(Value: Integer);
    procedure SetSelectionColor(Value: TColor);
    procedure SetShowTicks(Value: Boolean);
    procedure SetThumbType(Value: TcxTrackBarThumbType);
    procedure SetShowTrack(Value: Boolean);
    procedure SetTickColor(Value: TColor);
    procedure SetTickType(Value: TcxTrackBarTickType);
    procedure SetTickMarks(Value: TcxTrackBarTickMarks);
    procedure SetTickSize(Value: TcxNaturalNumber);
    procedure SetTrackColor(Value: TColor);
    procedure SetTrackSize(Value: Integer);
    procedure SetThumbHeight(Value: Integer);
    procedure SetThumbWidth(Value: Integer);
    procedure SetThumbColor(Value: TColor);
    procedure SetThumbHighlightColor(Value: TColor);
    procedure DoDrawThumb(Sender: TObject; ACanvas: TcxCanvas; const ARect: TRect);
  protected
    function CompareEditValue: Boolean; override;
    class function GetViewDataClass: TcxCustomEditViewDataClass; override;
    function HasDisplayValue: Boolean; override;
    function FixPosition(const APosition: Integer): Integer; virtual;
    procedure ThumbChanged; virtual;
    function EditValueToPosition(const AEditValue: TcxEditValue): Integer;
    property MouseStates: TcxTrackBarMouseStates read FMouseStates;
    property AutoSize: Boolean read FAutoSize write SetAutoSize default True;
    property BorderWidth: Integer read FBorderWidth write SetBorderWidth default 0;
    property Frequency: Integer read FFrequency write SetFrequency default 1;
    property Min: Integer read FMin write SetMin default 0;
    property Max: Integer read FMax write SetMax default 10;
    property Orientation: TcxTrackBarOrientation read FOrientation
      write SetOrientation default tboHorizontal;
    property TextOrientation: TcxTrackBarTextOrientation read FTextOrientation
      write SetTextOrientation default tbtoHorizontal;
    property PageSize: TcxNaturalNumber read FPageSize write SetPageSize default 1;
    property SelectionStart: Integer read FSelectionStart write SetSelectionStart default 0;
    property SelectionEnd: Integer read FSelectionEnd write SetSelectionEnd default 0;
    property SelectionColor: TColor read FSelectionColor write SetSelectionColor default clHighlight;
    property ShowTicks: Boolean read FShowTicks write SetShowTicks default True;
    property ThumbType: TcxTrackBarThumbType read FThumbType write SetThumbType
      default cxttRegular;
    property ShowTrack: Boolean read FShowTrack write SetShowTrack default True;
    property TickColor: TColor read FTickColor write SetTickColor default clWindowText;
    property TickType: TcxTrackBarTickType read FTickType write SetTickType default tbttTicks;
    property TickMarks: TcxTrackBarTickMarks read FTickMarks write SetTickMarks
      default cxtmBottomRight;
    property TickSize: TcxNaturalNumber read FTickSize write SetTickSize default 3;
    property TrackColor: TColor read FTrackColor write SetTrackColor default clWindow;
    property TrackSize : Integer read FTrackSize write SetTrackSize default 5;
    property ThumbHeight: Integer read FThumbHeight write SetThumbHeight default 12;
    property ThumbWidth: Integer read FThumbWidth write SetThumbWidth default 7;
    property ThumbColor: TColor read FThumbColor write SetThumbColor default clBtnFace;
    property ThumbHighlightColor: TColor read FThumbHighlightColor
      write SetThumbHighlightColor default clSilver;
    property ThumbStep: TcxTrackBarThumbStep read FThumbStep write FThumbStep default cxtsNormal;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnGetThumbRect: TcxGetThumbRectEvent read FOnGetThumbRect
      write FOnGetThumbRect;
    property OnDrawThumb: TcxDrawThumbEvent read FOnDrawThumb write FOnDrawThumb;
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
    function IsEditValueValid(var EditValue: TcxEditValue; AEditFocused: Boolean): Boolean; override;
    procedure PrepareDisplayValue(const AEditValue: TcxEditValue;
      var DisplayValue: TcxEditValue; AEditFocused: Boolean); override;
  end;

  { TcxTrackBarProperties }
  TcxTrackBarProperties = class(TcxCustomTrackBarProperties)
  published
    property AutoSize;
    property BorderWidth;
    property Frequency;
    property Min;
    property Max;
    property Orientation;
    property TextOrientation;
    property PageSize;
    property SelectionStart;
    property SelectionEnd;
    property SelectionColor;
    property ShowTicks;
    property ThumbType;
    property ShowTrack;
    property TickColor;
    property TickType;
    property TickMarks;
    property TickSize;
    property TrackColor;
    property TrackSize;
    property ThumbHeight;
    property ThumbWidth;
    property ThumbColor;
    property ThumbHighlightColor;
    property ThumbStep;
    property OnChange;
    property OnGetThumbRect;
    property OnDrawThumb;
  end;

  { TcxCustomTrackBar }
  TcxCustomTrackBar = class(TcxCustomEdit)
  private
    FStartSelectionPosition: Integer;
    FSlideState: TcxTrackBarSlideState;
{$IFDEF LINUX}
    FSpaceBarAutoRepeat: Boolean;
{$ENDIF}
    procedure SetNewSelectionPosition(const ANewPosition: Integer);
    function GetPosition: Integer;
    procedure SetPosition(Value: Integer);
    function GetProperties: TcxTrackBarProperties;
    function GetViewInfo: TcxCustomTrackBarViewInfo;
    procedure SetProperties(Value: TcxTrackBarProperties);
{$IFDEF VCL}
    procedure WMLButtonUp(var Message: TWMLButtonUp); message WM_LBUTTONUP;
    procedure WMGetDlgCode(var Message: TWMGetDlgCode); message WM_GETDLGCODE;
    procedure WMEraseBkgnd(var Message: TWMEraseBkgnd); message WM_ERASEBKGND;
{$ENDIF}
  protected
    function CanResize(var NewWidth, NewHeight: Integer): Boolean; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyUp(var Key: Word; Shift: TShiftState); override;
    procedure MouseEnter(AControl: TControl); override;
    procedure MouseLeave(AControl: TControl); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure FillSizeProperties(var AEditSizeProperties: TcxEditSizeProperties); override;
    procedure InternalSetEditValue(const Value: TcxEditValue;
      AValidateEditValue: Boolean); override;
    procedure SynchronizeDisplayValue; override;
    procedure PropertiesChanged(Sender: TObject); override;
{$IFNDEF VCL}
    function EventFilter(Sender: QObjectH; Event: QEventH): Boolean; override;
    function WantKey(Key: Integer; Shift: TShiftState; const KeyText: WideString): Boolean; override;
{$ENDIF}
    property Properties: TcxTrackBarProperties read GetProperties write SetProperties;
    property ViewInfo: TcxCustomTrackBarViewInfo read GetViewInfo;
    property Position: Integer read GetPosition write SetPosition default 0;
    function CanFocusOnClick: Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
    class function GetPropertiesClass: TcxCustomEditPropertiesClass; override;
{$IFDEF DELPHI5}
    function CanFocus: Boolean; override;
{$ENDIF}
  end;

  { TcxCustomTrackBar }
  TcxTrackBar = class(TcxCustomTrackBar)
  published
    property Position;
    property Anchors;
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

const
  BetweenTrackAndTick = 1;
  FromBorderIndent = 7;

{ TcxTrackBarStyle }
procedure TcxTrackBarStyle.RestoreDefaults;
begin
  inherited RestoreDefaults;
end;

function TcxTrackBarStyle.DefaultColor: TColor;
begin
  Result := inherited DefaultColor;
end;
{ TcxTrackBarStyle }

{ TcxCustomTrackBarViewInfo }
constructor TcxCustomTrackBarViewInfo.Create;
begin
  inherited Create;
  FLookAndFeel := TcxLookAndFeel.Create(nil);
  FTBBitmap := TBitmap.Create;
{$IFDEF VCL}
  FTBBitmap.PixelFormat := pfDevice;
{$ENDIF}
  FTBCanvas := TcxCanvas.Create(FTBBitmap.Canvas);
end;

destructor TcxCustomTrackBarViewInfo.Destroy;
begin
  FreeAndNil(FTBBitmap);
  FreeAndNil(FTBCanvas);
  FreeAndNil(FLookAndFeel);
  inherited Destroy;
end;

procedure TcxCustomTrackBarViewInfo.Assign(Source: TObject);
begin
  inherited Assign(Source);
  if Source is TcxCustomTrackBarViewInfo then
    with Source as TcxCustomTrackBarViewInfo do
    begin
      Self.AutoSize := AutoSize;
      Self.LookAndFeel.Assign(LookAndFeel);
      Self.Frequency := Frequency;
      Self.Min := Min;
      Self.Max := Max;
      Self.Orientation := Orientation;
      Self.PageSize := PageSize;
      Self.Position := Position;
      Self.ShowTicks := ShowTicks;
      Self.ThumbType := ThumbType;
      Self.ShowTrack := ShowTrack;
      Self.TextOrientation := TextOrientation;
      Self.TickColor := TickColor;
      Self.TickMarks := TickMarks;
      Self.TickSize := TickSize;
      Self.TickType := TickType;
      Self.TrackColor := TrackColor;
      Self.TrackSize := TrackSize;
      Self.ThumbColor := ThumbColor;
      Self.ThumbHighlightColor := ThumbHighlightColor;
      Self.ThumbWidth := ThumbWidth;
      Self.ThumbHeight := ThumbHeight;
      Self.TrackBarBorderWidth := TrackBarBorderWidth;
      Self.TrackBarState := TrackBarState;
      Self.SelectionStart := SelectionStart;
      Self.SelectionEnd := SelectionEnd;
      Self.SelectionColor := SelectionColor;
    end;
end;

function TcxCustomTrackBarViewInfo.GetUpdateRegion(AViewInfo: TcxContainerViewInfo): TcxRegion;
begin
  Result := inherited GetUpdateRegion(AViewInfo);
  if not (AViewInfo is TcxCustomTrackBarViewInfo) then Exit;
end;

function TcxCustomTrackBarViewInfo.NeedShowHint(ACanvas: TcxCanvas;
  const P: TPoint; out AText: TCaption; out AIsMultiLine: Boolean;
  out ATextRect: TRect): Boolean;
begin
  Result := False;
end;

procedure TcxCustomTrackBarViewInfo.DrawText(ACanvas: TcxCanvas);
begin
  {Dummy}
end;

procedure TcxCustomTrackBarViewInfo.Offset(DX, DY: Integer);
begin
  inherited;
  OffsetRect(RealTrackBarRect, DX, DY);
  OffsetRect(TrackBarRect, DX, DY);
end;

procedure TcxCustomTrackBarViewInfo.Paint(ACanvas: TcxCanvas);
var
  R: TRect;
  FParentDC: HDC;
begin
  DrawCustomEdit(ACanvas, Self, False, bpsSolid);
  FTBBitmap.Width := RectWidth(TrackBarRect);
  FTBBitmap.Height := RectHeight(TrackBarRect);
  FTBBitmap.Canvas.Brush.Color := BackgroundColor;
  FTBBitmap.Canvas.FillRect(TrackBarRect);
  if Transparent then
  begin
    if not IsInplace then
    begin
      GetWindowRect(WindowHandle, R);
      FParentDC := GetDCEx(GetDesktopWindow, 0,
        DCX_CACHE or DCX_CLIPSIBLINGS or DCX_LOCKWINDOWUPDATE);
      BitBlt(FTBBitmap.Canvas.Handle, 0, 0,
        FTBBitmap.Width, FTBBitmap.Height,
        FParentDC, R.Left + 2, R.Top + 2, SRCCOPY);
    end
    else
    begin
      BitBlt(FTBBitmap.Canvas.Handle, 0, 0,
        FTBBitmap.Width, FTBBitmap.Height,
        ACanvas.Handle, RealTrackBarRect.Left, RealTrackBarRect.Top, SRCCOPY);
    end
  end;
  PaintTrackBar(FTBCanvas);
  BitBlt(ACanvas.Canvas.Handle, RealTrackBarRect.Left, RealTrackBarRect.Top,
    RectWidth(TrackBarRect), RectHeight(TrackBarRect),
    FTBBitmap.Canvas.Handle, 0, 0, SRCCOPY);
end;

procedure TcxCustomTrackBarViewInfo.PaintTrackBar(ACanvas: TcxCanvas);
begin
  if ShowTrack then
  begin
    DrawTrack(ACanvas);
    if FShowSelection then
      DrawSelection(ACanvas);
  end;
  if ShowTicks then
    DrawTicks(ACanvas);
  case ThumbType of
    cxttRegular: DrawThumb(ACanvas);
    cxttCustom:
      if Assigned(OnDrawThumb) then
        OnDrawThumb(Self, ACanvas, ThumbRect);
  end;
end;

procedure TcxCustomTrackBarViewInfo.DrawTrack(ACanvas: TcxCanvas);
var
  FEdgeTrackRect: TRect;
  FTheme: TTheme;
  FTrackThemeType: Byte;
begin
  FEdgeTrackRect := TrackRect;
{$IFDEF VCL}
  if AreVisualStylesMustBeUsed(LookAndFeel.NativeStyle, totTrackBar) then
  begin
    FTheme := OpenTheme(totTrackBar);
    if Orientation = tboHorizontal then
      FTrackThemeType := TKP_TRACK
    else
      FTrackThemeType := TKP_TRACKVERT;
    DrawThemeBackground(FTheme, ACanvas.Handle, FTrackThemeType,
      FTrackBarState, @FEdgeTrackRect);
  end
  else
{$ENDIF}
  begin
    ACanvas.Brush.Color := FTrackColor;
    ACanvas.FillRect(FEdgeTrackRect);
    Dec(FEdgeTrackRect.Right);
    case LookAndFeel.Kind of
      lfStandard:
      begin
        FEdgeTrackRect := DrawBounds(ACanvas, FEdgeTrackRect, clBtnShadow, clWindow);
        FEdgeTrackRect := DrawBounds(ACanvas, FEdgeTrackRect, clWindowFrame, clBtnFace);
      end;
      lfFlat:
      begin                
        FEdgeTrackRect := DrawBounds(ACanvas, FEdgeTrackRect, clBtnShadow, clWindow);
        FEdgeTrackRect := DrawBounds(ACanvas, FEdgeTrackRect, clBtnFace, clBtnFace);
      end;
      lfUltraFlat:
      begin
        FEdgeTrackRect := DrawBounds(ACanvas, FEdgeTrackRect, clWindowFrame, clWindowFrame);
      end;
    end;
  end;
end;

procedure TcxCustomTrackBarViewInfo.DrawSelection(ACanvas: TcxCanvas);
begin
  ACanvas.Brush.Color := FSelectionColor;
  ACanvas.FillRect(SelectionRect);
end;

procedure TcxCustomTrackBarViewInfo.DrawTicks(ACanvas: TcxCanvas);
var
  I, X, Y, FDeltaTopLeft, FDeltaX, FDeltaY: Integer;
  FCalcTickSize: Integer;
  FFrequencyCondition: Boolean;
  FTickAsLine: Boolean;
  FTextWidth, FTextHeight: Integer;
  FLocalFont: TFont;
  FTM: TTextMetric;
  FLF: TLogFont;
  FFontHandle: hFont;

  procedure PrepareIndirectFont(const Angle: Integer);
  begin
    FLocalFont := TFont.Create;
    FLocalFont.Assign(Font);
    GetTextMetrics(FLocalFont.Handle, FTM);
    if (FTM.tmPitchAndFamily and TMPF_TRUETYPE) = 0 then
      FLocalFont.Name := 'Arial';
    GetObject(FLocalFont.Handle, SizeOf(FLF), @FLF);
    FLF.lfEscapement := Angle * 10;
    FFontHandle := CreateFontIndirect(FLF);
    ACanvas.Font.Handle := FFontHandle;
  end;

  procedure RemoveIndirectFont;
  begin
    FLF.lfEscapement := 0;
    FFontHandle := CreateFontIndirect(FLF);
    ACanvas.Font.Handle := FFontHandle;
    FLocalFont.Free;
  end;
  
begin
  ACanvas.Font.Assign(Font);
  ACanvas.Font.Color := TextColor;
  ACanvas.Pen.Color := TickColor;
  ACanvas.Brush.Color := clBtnFace;
  if FTextOrientation = tbtoVertical then PrepareIndirectFont(90);
  try
    if FOrientation = tboVertical then
    begin
      for I := FMin to FMax do
      begin
        Y := Trunc(TickOffset * (I - FMin)) + TrackRect.Top + (ThumbSize div 2);
        FTickAsLine := (TickType = tbttTicks) or
          ((TickType = tbttValueNumber) and not (I in [FMin, FMax, Position]));
        FCalcTickSize := TickSize;
        if (I = FMin) or (I = FMax) then FCalcTickSize := FCalcTickSize + (TickSize div 2);
        FFrequencyCondition := (I = FMin) or (I = FMax) or ((Frequency > 0) and ((I mod Frequency) = 0));
        if not FFrequencyCondition then Continue;
        if not FTickAsLine then
        begin
          FTextWidth := ACanvas.TextWidth(IntToStr(I));
          FTextHeight := ACanvas.TextHeight(IntToStr(I));
          if FTextOrientation = tbtoVertical then
          begin
            FDeltaTopLeft := FTextWidth div 2;
            FDeltaX := FTextHeight;
           end else
          begin
            FDeltaTopLeft := -(FTextHeight div 2);
            FDeltaX := FTextWidth;
          end;
          SetBkMode(ACanvas.Handle, Windows.Transparent);
          if (FTickMarks = cxtmBottomRight) or (FTickMarks = cxtmBoth) then
            ACanvas.DrawText(IntToStr(I),
            {$IFDEF DELPHI6}
              Types.Bounds(ThumbRect.Right + BetweenTrackAndTick + 1, Y + FDeltaTopLeft,
            {$ELSE}
              Classes.Bounds(ThumbRect.Right + BetweenTrackAndTick + 1, Y + FDeltaTopLeft,
            {$ENDIF}
              FTextWidth + 2, FTextHeight + 2), 0, True);
          if (FTickMarks = cxtmTopLeft) or (FTickMarks = cxtmBoth) then
            ACanvas.DrawText(IntToStr(I),
            {$IFDEF DELPHI6}
              Types.Bounds(ThumbRect.Left - BetweenTrackAndTick - FDeltaX, Y + FDeltaTopLeft,
            {$ELSE}
              Classes.Bounds(ThumbRect.Left - BetweenTrackAndTick - FDeltaX, Y + FDeltaTopLeft,
            {$ENDIF}
              FTextWidth + 2, FTextHeight + 2), 0, True);
        end else
        begin
          if (FTickMarks = cxtmBottomRight) or (FTickMarks = cxtmBoth) then
          begin
            ACanvas.MoveTo(ThumbRect.Right + BetweenTrackAndTick + 1, Y);
            ACanvas.LineTo(ThumbRect.Right + BetweenTrackAndTick + FCalcTickSize + 1, Y);
          end;
          if (FTickMarks = cxtmTopLeft) or (FTickMarks = cxtmBoth) then
          begin
            ACanvas.MoveTo(ThumbRect.Left - (BetweenTrackAndTick + FCalcTickSize), Y);
            ACanvas.LineTo(ThumbRect.left - BetweenTrackAndTick, Y);
          end;
        end;
      end;
    end
    else
    begin
      for I := FMin to FMax do
      begin
        X := Trunc(TickOffset * (I - FMin)) + TrackRect.Left + (ThumbSize div 2);
        FTickAsLine := (TickType = tbttTicks) or
          ((TickType = tbttValueNumber) and not (I in [FMin, FMax, Position]));
        FCalcTickSize := TickSize;
        if (I = FMin) or (I = FMax) then FCalcTickSize := FCalcTickSize + (TickSize div 2);
        FFrequencyCondition := (I = FMin) or (I = FMax) or ((Frequency > 0) and ((I mod Frequency) = 0));
        if not FFrequencyCondition then Continue;
        if not FTickAsLine then
        begin
          FTextWidth := ACanvas.TextWidth(IntToStr(I));
          FTextHeight := ACanvas.TextHeight(IntToStr(I));
          if FTextOrientation = tbtoVertical then
          begin
            FDeltaTopLeft := (FTextHeight div 2) - 1;
            FDeltaX := FTextWidth;
            FDeltaY := 0;
          end else
          begin
            FDeltaTopLeft := (FTextWidth div 2);
            FDeltaX := 0;
            FDeltaY := FTextHeight;
          end;
          SetBkMode(ACanvas.Handle, Windows.Transparent);
          if (FTickMarks = cxtmBottomRight) or (FTickMarks = cxtmBoth) then
            ACanvas.DrawText(IntToStr(I),
            {$IFDEF DELPHI6}
              Types.Bounds(X - FDeltaTopLeft, ThumbRect.Bottom + BetweenTrackAndTick + FDeltaX,
            {$ELSE}
              Classes.Bounds(X - FDeltaTopLeft, ThumbRect.Bottom + BetweenTrackAndTick + FDeltaX,
            {$ENDIF}
              FTextWidth + 2, FTextHeight + 2), 0, True);
          if (FTickMarks = cxtmTopLeft) or (FTickMarks = cxtmBoth) then
            ACanvas.DrawText(IntToStr(I),
            {$IFDEF DELPHI6}
              Types.Bounds(X - FDeltaTopLeft, ThumbRect.Top - (BetweenTrackAndTick + FDeltaY),
            {$ELSE}
              Classes.Bounds(X - FDeltaTopLeft, ThumbRect.Top - (BetweenTrackAndTick + FDeltaY),
            {$ENDIF}
              FTextWidth + 2, FTextHeight + 2), 0, True);
        end else
        begin
          if (FTickMarks = cxtmBottomRight) or (FTickMarks = cxtmBoth) then
          begin
            ACanvas.MoveTo(X, ThumbRect.Bottom + BetweenTrackAndTick + 1);
            ACanvas.LineTo(X, ThumbRect.Bottom + BetweenTrackAndTick + FCalcTickSize + 1);
          end;
          if (FTickMarks = cxtmTopLeft) or (FTickMarks = cxtmBoth) then
          begin
            ACanvas.MoveTo(X, ThumbRect.Top - (BetweenTrackAndTick + FCalcTickSize));
            ACanvas.LineTo(X, ThumbRect.Top - BetweenTrackAndTick);
          end;
        end;
      end;
    end;
  finally
    if FTextOrientation = tbtoVertical then RemoveIndirectFont;
  end;
end;

procedure TcxCustomTrackBarViewInfo.DrawThumb(ACanvas: TcxCanvas);
var
  FDrawThumbRect: TRect;
  FTheme: TTheme;
  FThumbThemeType: Byte;
  FThumbRealColor: TColor;
begin
{$IFDEF VCL}
  if AreVisualStylesMustBeUsed(LookAndFeel.NativeStyle, totTrackBar) then
  begin
    FTheme := OpenTheme(totTrackBar);
    FThumbThemeType := TKP_THUMB;
    case FTickMarks of
      cxtmBoth:
      begin
        if Orientation = tboHorizontal then
          FThumbThemeType := TKP_THUMB
        else
          FThumbThemeType := TKP_THUMBVERT;
      end;
      cxtmTopLeft:
      begin
        if Orientation = tboHorizontal then
          FThumbThemeType := TKP_THUMBTOP
        else
          FThumbThemeType := TKP_THUMBLEFT;
      end;
      cxtmBottomRight:
      begin
        if Orientation = tboHorizontal then
          FThumbThemeType := TKP_THUMBBOTTOM
        else
          FThumbThemeType := TKP_THUMBRIGHT;
      end;
    end;
    DrawThemeBackground(FTheme, ACanvas.Handle, FThumbThemeType, FTrackBarState, @ThumbRect);
  end else
{$ENDIF}
  begin

    case TrackBarState of
      TUS_DISABLED: FThumbRealColor := clBtnShadow;
      TUS_PRESSED, TUS_HOT: FThumbRealColor := ThumbHighLightColor;
      else FThumbRealColor := ThumbColor;
    end;

    if NeedPointer = True then
    begin
      if (FTickMarks = cxtmBottomRight) then
        DrawBottomRightThumb(ACanvas, ThumbRect, FOrientation, ThumbSize, LookAndFeel.Kind, FThumbRealColor)
       else
        DrawTopLeftThumb(ACanvas, ThumbRect, FOrientation, ThumbSize, LookAndFeel.Kind, FThumbRealColor);
    end else
    begin
      case LookAndFeel.Kind of
        lfStandard:
        begin
          FDrawThumbRect := DrawBounds(ACanvas, ThumbRect, clWindow, clWindowFrame);
          FDrawThumbRect := DrawBounds(ACanvas, FDrawThumbRect, clBtnFace, clBtnShadow);
        end;
        lfFlat:
        begin
          FDrawThumbRect := DrawBounds(ACanvas, ThumbRect, clWindow, clBtnShadow);
        end;
        lfUltraFlat:
        begin
          FDrawThumbRect := DrawBounds(ACanvas, ThumbRect, clWindowFrame, clWindowFrame);
        end;
      end;

      Inc(FDrawThumbRect.Right);
      Inc(FDrawThumbRect.Bottom);
      ACanvas.Brush.Color := FThumbRealColor;
      ACanvas.FillRect(FDrawThumbRect);
    end;
  end;
end;
{ TcxCustomTrackBarViewInfo }

{ TcxCustomTrackBarViewData }
procedure TcxCustomTrackBarViewData.CalculateTBViewInfoProps(AViewInfo: TcxCustomEditViewInfo);
begin
  with TcxCustomTrackBarViewInfo(AViewInfo) do
  begin
    FShortRefresh := Properties.FShortRefresh;
    TrackBarBorderWidth := Properties.BorderWidth;
    Frequency := Properties.Frequency;
    Min := Properties.Min;
    Max := Properties.Max;
    Orientation := Properties.Orientation;
    TextOrientation := Properties.TextOrientation;
    PageSize := Properties.PageSize;
    TrackColor := Properties.TrackColor;
    TrackSize := Properties.TrackSize;
    SelectionStart := Properties.SelectionStart;
    SelectionEnd := Properties.SelectionEnd;
    SelectionColor := Properties.SelectionColor;
    ShowTicks := Properties.ShowTicks;
    ThumbType := Properties.ThumbType;
    ShowTrack := Properties.ShowTrack;
    if not Enabled then
      TickColor := clBtnShadow
    else
      TickColor := Properties.TickColor;
    TickType := Properties.TickType;
    TickMarks := Properties.TickMarks;
    TickSize := Properties.TickSize;
    ThumbHeight := Properties.ThumbHeight;
    ThumbWidth := Properties.ThumbWidth;
    AutoSize := Properties.AutoSize;
    ThumbColor := Properties.ThumbColor;
    ThumbHighlightColor := Properties.ThumbHighlightColor;
    OnDrawThumb := Properties.DoDrawThumb;
  end;
end;

function TcxCustomTrackBarViewData.GetTopLeftTickSize(
  ACanvas: TcxCanvas; AViewInfo: TcxCustomTrackBarViewInfo;
  ALeftTop: Boolean): Integer;
var
  ACalcNumValue: string;
begin
  Result := 0;
  if ((AViewInfo.TickMarks <> cxtmBottomRight) and (ALeftTop = True)) or
    (AViewInfo.TickMarks <> cxtmTopLeft) and (ALeftTop = False) then
    case AViewInfo.TickType of
      tbttTicks: Result := AViewInfo.TickSize + BetweenTrackAndTick;
      tbttNumbers, tbttValueNumber:
      begin
        if ((AViewInfo.Orientation = tboHorizontal) and
          (AViewInfo.TextOrientation = tbtoHorizontal)) or
          ((AViewInfo.Orientation = tboVertical) and
          (AViewInfo.TextOrientation = tbtoVertical)) then
          Result := ACanvas.TextHeight(IntToStr(AViewInfo.Min))
        else
        begin
          if Length(IntToStr(AViewInfo.Min)) > Length(IntToStr(AViewInfo.Max)) then
            ACalcNumValue := IntToStr(AViewInfo.Min)
          else
            ACalcNumValue := IntToStr(AViewInfo.Max);
          Result := ACanvas.TextWidth(ACalcNumValue);
        end;
      end;
    end;
  if AViewInfo.TrackBarBorderWidth = 0 then
    Inc(Result, 1);
end;

procedure TcxCustomTrackBarViewData.CalculateTrackBarRect(
  AViewInfo: TcxCustomTrackBarViewInfo);
begin
  AViewInfo.RealTrackBarRect := AViewInfo.ClientRect;
  AViewInfo.TrackBarRect := AViewInfo.ClientRect;
  InflateRectEx(AViewInfo.TrackBarRect,
    -AViewInfo.TrackBarRect.Left, -AViewInfo.TrackBarRect.Top,
    -AViewInfo.TrackBarRect.Left, -AViewInfo.TrackBarRect.Top);
  if (RectWidth(AViewInfo.TrackBarRect) div 2) < AViewInfo.TrackBarBorderWidth then
    AViewInfo.TrackBarBorderWidth := RectWidth(AViewInfo.TrackBarRect) div 2;
  if (RectHeight(AViewInfo.TrackBarRect) div 2) < AViewInfo.TrackBarBorderWidth then
    AViewInfo.TrackBarBorderWidth := RectHeight(AViewInfo.TrackBarRect) div 2;
end;

procedure TcxCustomTrackBarViewData.CalculateTrackZoneRect(ACanvas: TcxCanvas;
  AViewInfo: TcxCustomTrackBarViewInfo);
var
  FTopLeftIndent, FBottomRightIndent: Integer;
  FTrackZoneSize, FRealTrackZoneSize: Integer;
  FCustomRect: TRect;
begin
  FTopLeftIndent := GetTopLeftTickSize(ACanvas, AViewInfo, True);
  FBottomRightIndent := GetTopLeftTickSize(ACanvas, AViewInfo, False);
  if AViewInfo.Orientation = tboHorizontal then
    FTrackZoneSize := RectHeight(AViewInfo.TrackBarRect) - FTopLeftIndent - FBottomRightIndent
  else
    FTrackZoneSize := RectWidth(AViewInfo.TrackBarRect) - FTopLeftIndent - FBottomRightIndent;
  FRealTrackZoneSize := FTrackZoneSize;
  if FTrackZoneSize < 10 then FRealTrackZoneSize := 10;
  if FTrackZoneSize > 21 then FRealTrackZoneSize := 21;

  if (Properties.ThumbType = cxttCustom) and
    Assigned(Properties.OnGetThumbRect) then
  begin
    Properties.OnGetThumbRect(Properties, FCustomRect);
    if (AViewInfo.Orientation = tboHorizontal) and
      (RectHeight(FCustomRect) > FRealTrackZoneSize) then
      FRealTrackZoneSize := RectHeight(FCustomRect);
    if (AViewInfo.Orientation = tboVertical) and
      (RectWidth(FCustomRect) > FRealTrackZoneSize) then
      FRealTrackZoneSize := RectWidth(FCustomRect);
  end;

  AViewInfo.FromBorderIndent := FromBorderIndent;
  if AViewInfo.AutoSize then
    AViewInfo.TrackSize := FRealTrackZoneSize div 2;
  if AViewInfo.Orientation = tboHorizontal then
  begin
    AViewInfo.TrackZoneRect.Top := AViewInfo.TrackBarRect.Top +
      ((FTrackZoneSize - FRealTrackZoneSize) div 2) + FTopLeftIndent;
    AViewInfo.TrackZoneRect.Bottom := AViewInfo.TrackZoneRect.Top + FRealTrackZoneSize;
    AViewInfo.TrackZoneRect.Left := AViewInfo.TrackBarRect.Left +
      AViewInfo.TrackBarBorderWidth + AViewInfo.FromBorderIndent;
    AViewInfo.TrackZoneRect.Right := AViewInfo.TrackBarRect.Right -
      AViewInfo.TrackBarBorderWidth - AViewInfo.FromBorderIndent;
  end
  else
  begin
    AViewInfo.TrackZoneRect.Left := AViewInfo.TrackBarRect.Left +
      ((FTrackZoneSize - FRealTrackZoneSize) div 2) + FTopLeftIndent;
    AViewInfo.TrackZoneRect.Right := AViewInfo.TrackZoneRect.Left + FRealTrackZoneSize;
    AViewInfo.TrackZoneRect.Top := AViewInfo.TrackBarRect.Top +
      AViewInfo.TrackBarBorderWidth + AViewInfo.FromBorderIndent;
    AViewInfo.TrackZoneRect.Bottom := AViewInfo.TrackBarRect.Bottom -
      AViewInfo.TrackBarBorderWidth - AViewInfo.FromBorderIndent;
  end;
end;

procedure TcxCustomTrackBarViewData.CalculateTrackRect(
  AViewInfo: TcxCustomTrackBarViewInfo);
begin
  if AViewInfo.Orientation = tboHorizontal then
  begin
    AViewInfo.TrackRect.Left := AViewInfo.TrackZoneRect.Left;
    AViewInfo.TrackRect.Right := AViewInfo.TrackZoneRect.Right;
    AViewInfo.TrackRect.Top := AViewInfo.TrackZoneRect.Top +
      (RectHeight(AViewInfo.TrackZoneRect) - AViewInfo.TrackSize) div 2;
    AViewInfo.TrackRect.Bottom := AViewInfo.TrackRect.Top + AViewInfo.TrackSize;
  end
  else
  begin
    AViewInfo.TrackRect.Top := AViewInfo.TrackZoneRect.Top;
    AViewInfo.TrackRect.Bottom := AViewInfo.TrackZoneRect.Bottom;
    AViewInfo.TrackRect.Left := AViewInfo.TrackZoneRect.Left +
      (RectWidth(AViewInfo.TrackZoneRect) - AViewInfo.TrackSize) div 2;
    AViewInfo.TrackRect.Right := AViewInfo.TrackRect.Left + AViewInfo.TrackSize;
  end;
  Properties.FTrackRect := AViewInfo.TrackRect;
end;

procedure TcxCustomTrackBarViewData.CalculateThumbSize(
  AViewInfo: TcxCustomTrackBarViewInfo);
var
  FMinMaxDiff: Integer;
  FTickOffset: Double;
  FThumbSize, FThumbLargeSize: Integer;
  FCustomRect: TRect;
begin
  FMinMaxDiff := AViewInfo.Max - AViewInfo.Min;
  if FMinMaxDiff = 0 then FMinMaxDiff := 1;
  AViewInfo.NeedPointer := (AViewInfo.TickMarks <> cxtmBoth);
  if (Properties.ThumbType = cxttCustom) and
    Assigned(Properties.OnGetThumbRect) then
  begin
    Properties.OnGetThumbRect(Properties, FCustomRect);
    if AViewInfo.Orientation = tboHorizontal then
    begin
      FThumbSize := RectWidth(FCustomRect);
      FThumbLargeSize := RectHeight(FCustomRect);
    end
    else
    begin
      FThumbSize := RectHeight(FCustomRect);
      FThumbLargeSize := RectWidth(FCustomRect);
    end;
    AViewInfo.ThumbWidth := FThumbSize;
    AViewInfo.ThumbHeight := FThumbLargeSize;
  end
  else
  begin
    if AViewInfo.AutoSize then
    begin
      FThumbSize := AViewInfo.TrackSize;
      if AViewInfo.Orientation = tboHorizontal then
      begin
        if (FThumbSize mod 2) = 1 then Inc(FThumbSize);
      end
      else
      begin
        if (FThumbSize mod 2) = 1 then Dec(FThumbSize);
      end;
      FThumbLargeSize := FThumbSize * 2 - 1;
    end
    else
    begin
      FThumbSize := AViewInfo.ThumbWidth;
      FThumbLargeSize := AViewInfo.ThumbHeight - 1;
    end;
  end;
  if AViewInfo.Orientation = tboHorizontal then
    FTickOffset := (RectWidth(AViewInfo.TrackRect) - FThumbSize) / FMinMaxDiff
  else
    FTickOffset := (RectHeight(AViewInfo.TrackRect) - FThumbSize) / FMinMaxDiff;
  AViewInfo.ThumbSize := FThumbSize;
  AViewInfo.ThumbLargeSize := FThumbLargeSize;
  AViewInfo.TickOffset := FTickOffset;
  Properties.FTickOffset := FTickOffset;
  Properties.FThumbSize := FThumbSize;
end;

procedure TcxCustomTrackBarViewData.CalculateThumbRect(
  AViewInfo: TcxCustomTrackBarViewInfo);
var
  FCurrentTickOffset: Integer;
  FDelta: Integer;
begin
  if AViewInfo.Orientation = tboHorizontal then
  begin
    FCurrentTickOffset := Trunc((AViewInfo.TickOffset * (AViewInfo.Position - AViewInfo.Min)) +
      AViewInfo.TrackRect.Left) + (AViewInfo.ThumbSize div 2);
    AViewInfo.ThumbRect.Left := FCurrentTickOffset - (AViewInfo.ThumbSize div 2);
    AViewInfo.ThumbRect.Right := FCurrentTickOffset + (AViewInfo.ThumbSize div 2);
    AViewInfo.ThumbRect.Top := AViewInfo.TrackRect.Top + (AViewInfo.TrackSize div 2) -
      (AViewInfo.ThumbLargeSize div 2);
    AViewInfo.ThumbRect.Bottom := AViewInfo.ThumbRect.Top + AViewInfo.ThumbLargeSize;
  end
  else
  begin
    FCurrentTickOffset := Trunc((AViewInfo.TickOffset * (AViewInfo.Position - AViewInfo.Min)) +
      AViewInfo.TrackRect.Top) + (AViewInfo.ThumbSize div 2);
    AViewInfo.ThumbRect.Top := FCurrentTickOffset - (AViewInfo.ThumbSize div 2);
    AViewInfo.ThumbRect.Bottom := FCurrentTickOffset + (AViewInfo.ThumbSize div 2);
    case AViewInfo.TickMarks of
      cxtmTopLeft: FDelta := -1;
      else
        FDelta := 0;
    end;
    AViewInfo.ThumbRect.Left := AViewInfo.TrackRect.Left + (AViewInfo.TrackSize div 2) -
      (AViewInfo.ThumbLargeSize div 2) + FDelta;
    AViewInfo.ThumbRect.Right := AViewInfo.ThumbRect.Left + AViewInfo.ThumbLargeSize + FDelta;
  end;
  if NativeStyle then
  begin
    if AViewInfo.Orientation = tboHorizontal then
      InflateRectEx(AViewInfo.ThumbRect, 1, 0, 1, 0)
    else
      InflateRectEx(AViewInfo.ThumbRect, 0, 1, 0, 1);
  end;
  Properties.FThumbRect := AViewInfo.ThumbRect;
end;

procedure TcxCustomTrackBarViewData.CalculateSelectionRect(
  AViewInfo: TcxCustomTrackBarViewInfo);
begin
  if AViewInfo.SelectionStart < AViewInfo.Min then
    AViewInfo.SelectionStart := AViewInfo.Min;
  if AViewInfo.SelectionEnd < AViewInfo.Min then
    AViewInfo.SelectionEnd := AViewInfo.Min;
  if AViewInfo.SelectionStart > AViewInfo.Max then
    AViewInfo.SelectionStart := AViewInfo.Max;
  if AViewInfo.SelectionEnd > AViewInfo.Max then
    AViewInfo.SelectionEnd := AViewInfo.Max;
  AViewInfo.FShowSelection := (AViewInfo.SelectionStart < AViewInfo.SelectionEnd);
  if AViewInfo.FShowSelection then
  begin
    if AViewInfo.Orientation = tboHorizontal then
    begin
      AViewInfo.SelectionRect.Left := Trunc((AViewInfo.TickOffset * (AViewInfo.SelectionStart - AViewInfo.Min)) +
        AViewInfo.TrackRect.Left) + (AViewInfo.ThumbSize div 2);
      AViewInfo.SelectionRect.Right := Trunc((AViewInfo.TickOffset * (AViewInfo.SelectionEnd - AViewInfo.Min)) +
        AViewInfo.TrackRect.Left) + (AViewInfo.ThumbSize div 2) + 1;
      AViewInfo.SelectionRect.Top := AViewInfo.TrackRect.Top + 2;
      AViewInfo.SelectionRect.Bottom := AViewInfo.TrackRect.Bottom - 1;
    end
    else
    begin
      AViewInfo.SelectionRect.Top := Trunc((AViewInfo.TickOffset * (AViewInfo.SelectionStart - AViewInfo.Min)) +
        AViewInfo.TrackRect.Top) + (AViewInfo.ThumbSize div 2);
      AViewInfo.SelectionRect.Bottom := Trunc((AViewInfo.TickOffset * (AViewInfo.SelectionEnd - AViewInfo.Min)) +
        AViewInfo.TrackRect.Top) + (AViewInfo.ThumbSize div 2) + 1;
      AViewInfo.SelectionRect.Left := AViewInfo.TrackRect.Left + 2;
      AViewInfo.SelectionRect.Right := AViewInfo.TrackRect.Right - 2;
    end;
  end;
end;

procedure TcxCustomTrackBarViewData.CalculateCustomTrackBarRects(ACanvas: TcxCanvas;
  AViewInfo: TcxCustomTrackBarViewInfo);
begin
  CalculateTrackBarRect(AViewInfo);
  CalculateTrackZoneRect(ACanvas, AViewInfo);
  CalculateTrackRect(AViewInfo);
  CalculateThumbSize(AViewInfo);
  CalculateThumbRect(AViewInfo);
  CalculateSelectionRect(AViewInfo);
end;

procedure TcxCustomTrackBarViewData.Calculate(ACanvas: TcxCanvas; const ABounds: TRect;
  const P: TPoint; Button: TcxMouseButton; Shift: TShiftState; AViewInfo: TcxCustomEditViewInfo;
  AIsMouseEvent: Boolean);
var
  FViewInfo : TcxCustomTrackBarViewInfo;
  FDisplayValue: TcxEditValue;
begin
  inherited Calculate(ACanvas, ABounds, P, Button, Shift, AViewInfo, AIsMouseEvent);
  if (ABounds.Right = MaxInt) or (ABounds.Bottom = MaxInt) then Exit;

  FViewInfo := TcxCustomTrackBarViewInfo(AViewInfo);
  FViewInfo.Font := Style.Font;

  {Standart properties}
  FViewInfo.LookAndFeel.Assign(Style.LookAndFeel);
  FViewInfo.IsEditClass := GetIsEditClass;
  FViewInfo.DrawSelectionBar := False;
  FViewInfo.HasPopupWindow := False;
  FViewInfo.DrawTextFlags := GetDrawTextFlags;
  FViewInfo.DrawSelectionBar := False;
  if not FViewInfo.Enabled then
    FViewInfo.TrackBarState := TUS_DISABLED
  else
  begin
    if (tbmpSliding in Properties.MouseStates) then
      FViewInfo.TrackBarState := TUS_PRESSED
    else
      if (tbmpUnderThumb in Properties.MouseStates) then
        FViewInfo.TrackBarState := TUS_HOT
      else
        FViewInfo.TrackBarState := TUS_NORMAL;
  end;
  {TrackBar properties}
  if Assigned(TcxCustomTrackBar(Edit)) then
  begin
    Properties.PrepareDisplayValue(TcxCustomTrackBar(Edit).EditValue,
      FDisplayValue, Focused);
    FViewInfo.Position := FDisplayValue;
  end;
  CalculateTBViewInfoProps(AViewInfo);
  CalculateCustomTrackBarViewInfo(ACanvas, Self, FViewInfo);
  CalculateCustomTrackBarRects(ACanvas, FViewInfo);
end;

procedure TcxCustomTrackBarViewData.EditValueToDrawValue(ACanvas: TcxCanvas;
  const AEditValue: TcxEditValue; AViewInfo: TcxCustomEditViewInfo);
var
  ADisplayValue: TcxEditValue;
begin
  Properties.PrepareDisplayValue(AEditValue, ADisplayValue, InternalFocused);
  TcxCustomTrackBarViewInfo(AViewInfo).Position := ADisplayValue;
end;

function TcxCustomTrackBarViewData.InternalGetEditConstantPartSize(ACanvas: TcxCanvas;
  AIsInplace: Boolean; const AEditSizeProperties: TcxEditSizeProperties;
  var MinContentSize: TSize; AViewInfo: TcxCustomEditViewInfo): TSize;
var
  ASize1, ASize2: TSize;
  AText: TCaption;
begin
  Result := inherited InternalGetEditConstantPartSize(ACanvas, AIsInplace,
    AEditSizeProperties, MinContentSize, AViewInfo);

  with TcxCustomTrackBarViewInfo(AViewInfo) do
  begin
    ASize1.cx := RectWidth(TrackRect);
    ASize1.cy := RectHeight(TrackRect);

    if not(IsInplace{$IFDEF VCL} or AreVisualStylesMustBeUsed(AViewInfo.NativeStyle,
      totButton){$ENDIF}) then
    begin
      Inc(ASize1.cx, 4);
      Inc(ASize1.cy, 4);
    end;

    AText := 'Wg';
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

function TcxCustomTrackBarViewData.GetDrawTextFlags: Integer;
begin
  Result := 0;
end;

function TcxCustomTrackBarViewData.GetIsEditClass: Boolean;
begin
  Result := False;
end;

function TcxCustomTrackBarViewData.GetProperties: TcxCustomTrackBarProperties;
begin
  Result := TcxCustomTrackBarProperties(FProperties);
end;

procedure TcxCustomTrackBarViewData.SetProperties(Value: TcxCustomTrackBarProperties);
begin
  FProperties := Value;
end;
{ TcxCustomTrackBarViewData }

{ TcxCustomTrackBarProperties }
constructor TcxCustomTrackBarProperties.Create(AOwner: TPersistent);
begin
  inherited Create(AOwner);
  FMouseStates := [];
  FShortRefresh := False;
  FAutoSize := True;
  FBorderWidth := 0;
  FFrequency := 1;
  FMin := 0;
  FMax := 10;
  FOrientation := tboHorizontal;
  FTextOrientation := tbtoHorizontal;
  FPageSize := 1;
  FTrackColor := clWindow;
  FTrackSize := 5;
  FTickColor := clWindowText;
  FSelectionStart := 0;
  FSelectionEnd := 0;
  FSelectionColor := clHighlight;
  FShowTicks := True;
  FThumbType := cxttRegular;
  FShowTrack := True;
  FTickType := tbttTicks;
  FTickMarks := cxtmBottomRight;
  FTickSize := 3;
  FThumbHeight := 12;
  FThumbWidth := 7;
  FThumbColor := clBtnFace;
  FThumbHighlightColor := clSilver;
  FThumbStep := cxtsNormal;
end;

destructor TcxCustomTrackBarProperties.Destroy;
begin
  inherited Destroy;
end;

procedure TcxCustomTrackBarProperties.Assign(Source: TPersistent);
begin
  if Source is TcxCustomTrackBarProperties then
  begin
    BeginUpdate;
    try
      inherited Assign(Source);
      with Source as TcxCustomTrackBarProperties do
      begin
        Self.AutoSize := AutoSize;
        Self.BorderWidth := BorderWidth;
        Self.Frequency := Frequency;
        Self.Min := Min;
        Self.Max := Max;
        Self.Orientation := Orientation;
        Self.TextOrientation := TextOrientation;
        Self.PageSize := PageSize;
        Self.SelectionStart := SelectionStart;
        Self.SelectionEnd := SelectionEnd;
        Self.SelectionColor := SelectionColor;
        Self.ShowTicks := ShowTicks;
        Self.ThumbType := ThumbType;
        Self.ShowTrack := ShowTrack;
        Self.TickColor := TickColor;
        Self.TickType := TickType;
        Self.TickMarks := TickMarks;
        Self.TickSize := TickSize;
        Self.TrackColor := TrackColor;
        Self.TrackSize := TrackSize;
        Self.ThumbHeight := ThumbHeight;
        Self.ThumbWidth := ThumbWidth;
        Self.ThumbColor := ThumbColor;
        Self.ThumbHighlightColor := ThumbHighlightColor;
        Self.OnChange := OnChange;
        Self.OnGetThumbRect := OnGetThumbRect;
        Self.OnDrawThumb := OnDrawThumb;
      end;
    finally
      EndUpdate;
    end
  end
  else
    inherited Assign(Source);
end;

class function TcxCustomTrackBarProperties.GetContainerClass: TcxContainerClass;
begin
  Result := TcxTrackBar;
end;

function TcxCustomTrackBarProperties.GetDisplayText(const AEditValue: TcxEditValue;
  AFullText: Boolean = False): WideString;
var
  ADisplayValue: TcxEditValue;
begin
  PrepareDisplayValue(AEditValue, ADisplayValue, False);
  Result := ADisplayValue;
end;

class function TcxCustomTrackBarProperties.GetStyleClass: TcxContainerStyleClass;
begin
  Result := TcxTrackBarStyle;
end;

function TcxCustomTrackBarProperties.GetSupportedOperations: TcxEditSupportedOperations;
begin
  Result := [esoAlwaysHotTrack, esoFiltering, esoSorting];
end;

class function TcxCustomTrackBarProperties.GetViewInfoClass: TcxContainerViewInfoClass;
begin
  Result := TcxCustomTrackBarViewInfo;
end;

function TcxCustomTrackBarProperties.IsEditValueValid(var EditValue: TcxEditValue;
  AEditFocused: Boolean): Boolean;
begin
  Result := inherited IsEditValueValid(EditValue, AEditFocused);
end;

procedure TcxCustomTrackBarProperties.PrepareDisplayValue(const AEditValue:
  TcxEditValue; var DisplayValue: TcxEditValue; AEditFocused: Boolean);
begin
  LockUpdate(True);
  try
    DisplayValue := FixPosition(EditValueToPosition(AEditValue));
  finally
    LockUpdate(False);
  end;
end;

function TcxCustomTrackBarProperties.EditValueToPosition(
  const AEditValue: TcxEditValue): Integer;
begin
  if IsVarEmpty(AEditValue) or
    not (VarIsInteger(AEditValue) or VarIsStr(AEditValue)) then
    Result := FMin
  else
  begin
    if VarIsInteger(AEditValue) then
      Result := VarAsType(AEditValue, varInteger)
    else
    begin
      if IsValidStringForInt(VarToStr(AEditValue)) then
        Result := cxStrToInt(VarToStr(AEditValue), False)
      else
        Result := FMin;
      end;
  end;
end;

function TcxCustomTrackBarProperties.CompareEditValue: Boolean;
begin
  Result := True;
end;

class function TcxCustomTrackBarProperties.GetViewDataClass: TcxCustomEditViewDataClass;
begin
  Result := TcxCustomTrackBarViewData;
end;

function TcxCustomTrackBarProperties.HasDisplayValue: Boolean;
begin
  Result := False;
end;

procedure TcxCustomTrackBarProperties.ThumbChanged;
begin
  FShortRefresh := True;
  try
    Changed;
  finally
    FShortRefresh := False;
  end;
end;

procedure TcxCustomTrackBarProperties.SetTrackColor(Value: TColor);
begin
  if FTrackColor <> Value then
  begin
    FTrackColor := Value;
    Changed;
  end;
end;

procedure TcxCustomTrackBarProperties.SetPageSize(Value: TcxNaturalNumber);
begin
  if Value <> FPageSize then
  begin
    FPageSize := Value;
    Changed;
  end;
end;

procedure TcxCustomTrackBarProperties.SetSelectionStart(Value: Integer);
begin
  if FSelectionStart <> Value then
  begin
    FSelectionStart := Value;
    Changed;
  end;
end;

procedure TcxCustomTrackBarProperties.SetSelectionEnd(Value: Integer);
begin
  if FSelectionEnd <> Value then
  begin
    FSelectionEnd := Value;
    Changed;
  end;
end;

procedure TcxCustomTrackBarProperties.SetSelectionColor(Value: TColor);
begin
  if FSelectionColor <> Value then
  begin
    FSelectionColor := Value;
    Changed;
  end;
end;

procedure TcxCustomTrackBarProperties.SetBorderWidth(Value: Integer);
begin
  if FBorderWidth <> Value then
  begin
    if Value < 0 then
      FBorderWidth := 0
    else
      FBorderWidth := Value;
    Changed;
  end;
end;

procedure TcxCustomTrackBarProperties.SetFrequency(Value: Integer);
begin
  if FFrequency <> Value then
  begin
    if Value < 0 then
      FFrequency := 0
    else
      FFrequency := Value;
    Changed;
  end;
end;

procedure TcxCustomTrackBarProperties.SetMin(Value: Integer);
begin
  if FMin <> Value then
  begin
    FMin := Value;
    if FMax < FMin then FMax := FMin;
    Changed;
  end;
end;

procedure TcxCustomTrackBarProperties.SetMax(Value: Integer);
begin
  if (Value <> FMax) and (Value > FMin) then
  begin
    FMax := Value;
    if FMin > FMax then FMin := FMax;
    Changed;
  end;
end;

procedure TcxCustomTrackBarProperties.SetOrientation(Value: TcxTrackBarOrientation);
begin
  if FOrientation <> Value then
  begin
    FOrientation := Value;
    Changed;
  end;
end;

procedure TcxCustomTrackBarProperties.SetTextOrientation(Value: TcxTrackBarTextOrientation);
begin
  if FTextOrientation <> Value then
  begin
    FTextOrientation := Value;
    Changed;
  end;
end;

procedure TcxCustomTrackBarProperties.SetShowTrack(Value: Boolean);
begin
  if FShowTrack <> Value then
  begin
    FShowTrack := Value;
    Changed;
  end;
end;

procedure TcxCustomTrackBarProperties.SetShowTicks(Value: Boolean);
begin
  if FShowTicks <> Value then
  begin
    FShowTicks := Value;
    Changed;
  end;
end;

procedure TcxCustomTrackBarProperties.SetThumbType(Value: TcxTrackBarThumbType);
begin
  if FThumbType <> Value then
  begin
    FThumbType := Value;
    Changed;
  end;
end;

procedure TcxCustomTrackBarProperties.SetTickColor(Value: TColor);
begin
  if FTickColor <> Value then
  begin
    FTickColor := Value;
    Changed;
  end;
end;

procedure TcxCustomTrackBarProperties.SetTickType(Value: TcxTrackBarTickType);
begin
  if FTickType <> Value then
  begin
    FTickType := Value;
    Changed;
  end;
end;

procedure TcxCustomTrackBarProperties.SetTickMarks(Value: TcxTrackBarTickMarks);
begin
  if FTickMarks <> Value then
  begin
    FTickMarks := Value;
    Changed;
  end;
end;

procedure TcxCustomTrackBarProperties.SetTickSize(Value: TcxNaturalNumber);
begin
  if FTickSize <> Value then
  begin
    FTickSize := Value;
    Changed;
  end;
end;

procedure TcxCustomTrackBarProperties.SetTrackSize(Value: Integer);
begin
  if FTrackSize <> Value then
  begin
    FTrackSize := Value;
    Changed;
  end;
end;

procedure TcxCustomTrackBarProperties.SetThumbHeight(Value: Integer);
begin
  if FThumbHeight <> Value then
  begin
    FThumbHeight := Value;
    Changed;
  end;
end;

procedure TcxCustomTrackBarProperties.SetThumbWidth(Value: Integer);
begin
  if FThumbWidth <> Value then
  begin
    FThumbWidth := Value;
    Changed;
  end;
end;

procedure TcxCustomTrackBarProperties.SetAutoSize(Value: Boolean);
begin
  if FAutoSize <> Value then
  begin
    FAutoSize := Value;
    Changed;
  end;
end;

procedure TcxCustomTrackBarProperties.SetThumbColor(Value: TColor);
begin
  if FThumbColor <> Value then
  begin
    FThumbColor := Value;
    Changed;
  end;
end;

procedure TcxCustomTrackBarProperties.SetThumbHighlightColor(Value: TColor);
begin
  if FThumbHighlightColor <> Value then
  begin
    FThumbHighlightColor := Value;
    Changed;
  end;
end;

function TcxCustomTrackBarProperties.FixPosition(const APosition: Integer): Integer;
begin
  Result := APosition;
  if Result < Min then Result := Min
  else
  begin
    if Result > Max then Result := Max;
  end;
end;

procedure TcxCustomTrackBarProperties.DoDrawThumb(Sender: TObject; ACanvas: TcxCanvas;
  const ARect: TRect);
begin
  if Assigned(OnDrawThumb) then OnDrawThumb(Self, ACanvas, ARect);
end;
{ TcxCustomTrackBarProperties }

{ TcxCustomTrackBar }
constructor TcxCustomTrackBar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  AutoSize := False;
  FIsCreating := True;
  FSlideState := tbksNormal;
  ControlStyle := ControlStyle - [csDoubleClicks, csAcceptsControls,
    csCaptureMouse, csClickEvents];
  ParentColor := not IsInplace;
  Width := 196;
  Height := 76;
  FEditValue := 0;
  FIsCreating := False;
end;

class function TcxCustomTrackBar.GetPropertiesClass: TcxCustomEditPropertiesClass;
begin
  Result := TcxTrackBarProperties;
end;

function TcxCustomTrackBar.CanFocusOnClick: Boolean;
begin
  Result := True;
end;

{$IFDEF DELPHI5}
function TcxCustomTrackBar.CanFocus: Boolean;
begin
  Result := True;
end;
{$ENDIF}

function TcxCustomTrackBar.CanResize(var NewWidth, NewHeight: Integer): Boolean;
var
  AEditSizeProperties: TcxEditSizeProperties;
begin
  Result := inherited CanResize(NewWidth, NewHeight);
  if Result and AutoSize and not IsLoading then
  begin
    FillSizeProperties(AEditSizeProperties);
    NewHeight := Properties.GetEditSize(Canvas, Style, IsInplace, Null, AEditSizeProperties).cy;
    if NewHeight < 0 then NewHeight := Canvas.TextHeight('Wg') + 8;
  end;
end;

procedure TcxCustomTrackBar.SetNewSelectionPosition(const ANewPosition: Integer);
begin
  if ANewPosition < FStartSelectionPosition then
  begin
    Properties.FSelectionStart := ANewPosition;
    Properties.FSelectionEnd := FStartSelectionPosition;
  end
  else
  begin
    Properties.FSelectionStart := FStartSelectionPosition;
    Properties.FSelectionEnd := ANewPosition;
  end;
end;

procedure TcxCustomTrackBar.KeyDown(var Key: Word; Shift: TShiftState);
var
  FNewPosition: Integer;
begin
  if Enabled then
    case Key of
      VK_SHIFT:
      begin
        if FSlideState <> tbksIncludeSelection then
        begin
          FSlideState := tbksIncludeSelection;
          FStartSelectionPosition := Position;
        end;
      end;
      VK_PRIOR:
      begin
        FNewPosition := Properties.FixPosition(Position - Properties.PageSize);
        if (Position <> FNewPosition) then
        begin
          if (FSlideState = tbksIncludeSelection) then SetNewSelectionPosition(FNewPosition);
          Position := FNewPosition;
        end;
      end;
      VK_NEXT:
      begin
        FNewPosition := Properties.FixPosition(Position + Properties.PageSize);
        if (Position <> FNewPosition) then
        begin
          if (FSlideState = tbksIncludeSelection) then SetNewSelectionPosition(FNewPosition);
          Position := FNewPosition;
        end;
      end;
      VK_END:
      begin
        FNewPosition := Properties.Max;
        if (Position <> FNewPosition) then
        begin
          if (FSlideState = tbksIncludeSelection) then SetNewSelectionPosition(FNewPosition);
          Position := FNewPosition;
        end;
      end;
      VK_HOME:
      begin
        FNewPosition := Properties.Min;
        if (Position <> FNewPosition) then
        begin
          if (FSlideState = tbksIncludeSelection) then SetNewSelectionPosition(FNewPosition);
          Position := FNewPosition;
        end;
      end;
      VK_LEFT:
      begin
        FNewPosition := Properties.FixPosition(Pred(Position));
        if (Position <> FNewPosition) then
        begin
          if (FSlideState = tbksIncludeSelection) then SetNewSelectionPosition(FNewPosition);
          Position := FNewPosition;
        end;
      end;
      VK_RIGHT:
      begin
        FNewPosition := Properties.FixPosition(Succ(Position));
        if (Position <> FNewPosition) then
        begin
          if (FSlideState = tbksIncludeSelection) then SetNewSelectionPosition(FNewPosition);
          Position := FNewPosition;
        end;
      end;
      VK_DOWN:
      begin
        FNewPosition := Properties.FixPosition(Succ(Position));
        if (Position <> FNewPosition) then
        begin
          if (FSlideState = tbksIncludeSelection) then SetNewSelectionPosition(FNewPosition);
          Position := FNewPosition;
        end;
      end;
      VK_UP:
      begin
        FNewPosition := Properties.FixPosition(Pred(Position));
        if (Position <> FNewPosition) then
        begin
          if (FSlideState = tbksIncludeSelection) then SetNewSelectionPosition(FNewPosition);
          Position := FNewPosition;
        end;
      end;
    end;
  inherited KeyDown(Key, Shift);
end;

procedure TcxCustomTrackBar.KeyUp(var Key: Word; Shift: TShiftState);
begin
  if Enabled then
    if Key = VK_SHIFT then
      FSlideState := tbksNormal;
  inherited KeyDown(Key, Shift);
end;

procedure TcxCustomTrackBar.MouseEnter(AControl: TControl);
begin
  inherited;
  Include(Properties.FMouseStates, tbmpInControl);
  if (tbmpSliding in Properties.MouseStates) and
    not (ssLeft in CurrentShiftState) then
  begin
    Exclude(Properties.FMouseStates, tbmpSliding);
    Exclude(Properties.FMouseStates, tbmpUnderThumb);
  end;
end;

procedure TcxCustomTrackBar.MouseLeave(AControl: TControl);
begin
  inherited;
  Exclude(Properties.FMouseStates, tbmpInControl);
end;

procedure TcxCustomTrackBar.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  FNewPosition: Integer;

  function CalculateThumbJump: Integer;
  var
    FX, FY: Integer;
  begin
    if Properties.FOrientation = tboVertical then
    begin
      FY := Y - Properties.FTrackRect.Top;
      Result := Trunc(FY / Properties.FTickOffset);
    end
    else
    begin
      FX := X - Properties.FTrackRect.Left;
      Result := Trunc(FX / Properties.FTickOffset);
    end;
  end;

begin
  inherited MouseDown(Button, Shift, X, Y);
  if (Button = mbLeft) and Enabled then
  begin
    SetCaptureControl(Self);
    if PtInRect(Properties.FThumbRect, Point(X, Y)) then
    begin
      Include(Properties.FMouseStates, tbmpSliding);
      if ssCtrl in Shift then
      begin
        FSlideState := tbksNormal;
        Properties.FSelectionStart := 0;
        Properties.FSelectionEnd := 0;
      end;
      Properties.ThumbChanged;
    end
    else
      if PtInRect(ClientRect, Point(X, Y)) then
      begin
        FNewPosition := Position;
        if Properties.FOrientation = tboVertical then
        begin
          if Y > Properties.FThumbRect.Bottom then
          begin
            if Properties.ThumbStep = cxtsNormal then
              FNewPosition := Succ(Position)
            else
              FNewPosition := CalculateThumbJump;
          end
          else
            if Y < Properties.FThumbRect.Top then
            begin
              if Properties.ThumbStep = cxtsNormal then
                FNewPosition := Pred(Position)
              else
                FNewPosition := CalculateThumbJump;
            end;
        end
        else
        begin
          if X > Properties.FThumbRect.Right then
          begin
            if Properties.ThumbStep = cxtsNormal then
              FNewPosition := Succ(Position)
            else
              FNewPosition := CalculateThumbJump;
          end
          else
            if X < Properties.FThumbRect.Left then
            begin
              if Properties.ThumbStep = cxtsNormal then
                FNewPosition := Pred(Position)
              else
                FNewPosition := CalculateThumbJump;
            end;
        end;
        if FNewPosition <> Position then
          Position := FNewPosition;
      end;
  end;
end;

procedure TcxCustomTrackBar.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  FThumbOffset: Double;
  NewPos: Integer;
  FOldMouseStates: TcxTrackBarMouseStates;
  FNewPosition: Integer;
begin
  inherited MouseMove(Shift, X, Y);
  if (tbmpSliding in Properties.MouseStates) and (ssLeft in CurrentShiftState) then
  begin
    if Properties.Orientation = tboVertical then
    begin
      FThumbOffset := (Properties.FMax - Properties.FMin) / Height;
      NewPos := Round((Y - Properties.FThumbRect.Top -
        ((Properties.FThumbRect.Bottom - Properties.FThumbRect.Top) div 2)) * FThumbOffset);
      FNewPosition := Properties.FixPosition(Position + NewPos);
    end
    else
    begin
      FThumbOffset := (Properties.Max - Properties.Min) / Width;
      NewPos := Round((X - Properties.FThumbRect.Left -
        ((Properties.FThumbRect.Right - Properties.FThumbRect.Left) div 2)) * FThumbOffset);
      FNewPosition := Properties.FixPosition(Position + NewPos);
    end;
    if FNewPosition <> Position then
    begin
      if (ssShift in CurrentShiftState) and
        (FSlideState = tbksIncludeSelection) then
          SetNewSelectionPosition(FNewPosition);
    end;
    Position := FNewPosition;
  end
  else
  begin
    FOldMouseStates := Properties.MouseStates;
    if PtInRect(Properties.FThumbRect, Point(X, Y)) then
      Include(Properties.FMouseStates, tbmpUnderThumb)
     else
      Exclude(Properties.FMouseStates, tbmpUnderThumb);
    if Properties.MouseStates <> FOldMouseStates then
      Properties.ThumbChanged;
  end;
end;

procedure TcxCustomTrackBar.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  FOldMouseStates: TcxTrackBarMouseStates;
begin
  inherited MouseUp(Button, Shift, X, Y);
  FOldMouseStates := Properties.FMouseStates;
  Exclude(Properties.FMouseStates, tbmpSliding);
  if PtInRect(Properties.FThumbRect, Point(X, Y)) then
    Include(Properties.FMouseStates, tbmpUnderThumb)
   else
    Exclude(Properties.FMouseStates, tbmpUnderThumb);
  if FOldMouseStates <> Properties.MouseStates then
    Properties.ThumbChanged;
  SetCaptureControl(nil);
end;

procedure TcxCustomTrackBar.FillSizeProperties(var AEditSizeProperties: TcxEditSizeProperties);
begin
  with AEditSizeProperties do
  begin
    MaxLineCount := 1;
    Width := ViewInfo.TextRect.Right - ViewInfo.TextRect.Left;
  end;
end;

procedure TcxCustomTrackBar.InternalSetEditValue(const Value: TcxEditValue;
  AValidateEditValue: Boolean);
begin
  inherited InternalSetEditValue(Value, AValidateEditValue);
end;

procedure TcxCustomTrackBar.SynchronizeDisplayValue;
var
  Display: TcxEditValue;
begin
  Properties.PrepareDisplayValue(FEditValue, Display, Focused);
  Properties.Changed;
end;

procedure TcxCustomTrackBar.PropertiesChanged(Sender: TObject);
begin
  ViewInfo.Text := '';
  inherited PropertiesChanged(Sender);
end;

{$IFNDEF VCL}
function TcxCustomTrackBar.EventFilter(Sender: QObjectH; Event: QEventH): Boolean;
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

function TcxCustomTrackBar.GetProperties: TcxTrackBarProperties;
begin
  Result := TcxTrackBarProperties(InternalGetProperties);
end;

function TcxCustomTrackBar.GetViewInfo: TcxCustomTrackBarViewInfo;
begin
  Result := TcxCustomTrackBarViewInfo(FViewInfo);
end;

procedure TcxCustomTrackBar.SetProperties(Value: TcxTrackBarProperties);
begin
  FProperties.Assign(Value);
end;

{$IFDEF VCL}
procedure TcxCustomTrackBar.WMLButtonUp(var Message: TWMLButtonUp);
begin
  ControlState := ControlState - [csClicked];
  inherited;
end;

procedure TcxCustomTrackBar.WMGetDlgCode(var Message: TWMGetDlgCode);
begin
  Message.Result := DLGC_WANTARROWS;
end;

procedure TcxCustomTrackBar.WMEraseBkgnd(var Message: TWMEraseBkgnd);
begin
  if not IsDestroying and Assigned(ViewInfo) and ViewInfo.Transparent then
    PaintBackground(Self, Message.DC, True)
  else
    inherited;
end;
{$ENDIF}

function TcxCustomTrackBar.GetPosition: Integer;
begin
  Result := Properties.EditValueToPosition(FEditValue);
end;

procedure TcxCustomTrackBar.SetPosition(Value: Integer);
var
  FOldValue: Integer;
begin
  FOldValue := Properties.EditValueToPosition(EditValue);
  if (FOldValue <> Value) and DoEditing then
  begin
    EditValue := Value;
    if Assigned(Properties.OnChange) then Properties.OnChange(Self);
    Properties.Changed;
    EditModified := True;
    ModifiedAfterEnter := True;
    PostEditValue;
  end;
end;
{ TcxCustomTrackBar }

initialization
  GetRegisteredEditProperties.Register(TcxTrackBarProperties, scxSEditRepositoryTrackBarItem);

finalization
  GetRegisteredEditProperties.Unregister(TcxTrackBarProperties);

end.

