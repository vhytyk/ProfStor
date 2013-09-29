
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

unit cxCalendar;

{$I cxEdVer.inc}

interface

uses
{$IFDEF VCL}
  Windows, Messages, ComCtrls,
{$ELSE}
  Qt, QTypes,
{$ENDIF}
{$IFDEF DELPHI6}
  Types,
{$ENDIF}
  SysUtils, Classes, Graphics, Controls, Forms, StdCtrls, ExtCtrls, Clipbrd,
  cxClasses, cxGraphics, cxControls, cxContainer, cxEdit, cxDropDownEdit,
  cxTextEdit, cxMaskEdit, cxDataUtils, cxButtons, cxDateUtils, cxEditConsts,
  cxFormats;

type
  { TcxCustomCalendar }

  TDateButton = (btnToday, btnClear);
  TDateButtons = set of TDateButton;

  TcxCustomCalendar = class(TcxControl)
  private
    FFirstDate: TDateTime;
    FSelectDate: TDateTime;
    FFlat: Boolean;
    FColWidth, FSideWidth,
    FRowHeight, FHeaderHeight, FDaysOfWeekHeight: Integer;
    FTodayButtonWidth, FClearButtonWidth,
    FButtonsOffset, FButtonsHeight, FButtonsRegionHeight: Integer;
    FListBox: TcxCustomPopupWindow;
    FTimer: TTimer;
    FTodayButton: TcxButton;
    FClearButton: TcxButton;
    FCalendarButtons: TDateButtons;
    FOnDateTimeChanged: TNotifyEvent;
    procedure AdjustButtonsPosition;
    procedure ButtonClick(Sender: TObject);
    procedure CreateButtons;
    function ColOfDate(ADate: TDateTime): Integer;
    procedure DoDateTimeChanged;
    procedure DoScrollArrow(Sender: TObject);
    function GetHeaderRect: TRect;
    function GetInternalRect: TRect;
    function GetLeftArrowRect: TRect;
    function GetRightArrowRect: TRect;
    function GetMonthNameRect: TRect;
    function GetTodayButtonRect: TRect;
    function GetClearButtonRect: TRect;
    function GetShowButtonsArea: Boolean;
    procedure SetFlat(Value: Boolean);
    procedure SetCalendarButtons(const Value: TDateButtons);
  protected
    IsPopupControl: Boolean;
    procedure FontChanged; override;
    function HasBackground: Boolean; override;
    procedure InitControl; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure Paint; override;
    procedure Resize; override;

    function GetLastDate: TDateTime; virtual;
    function GetRealFirstDate: TDateTime; virtual;
    function GetRealLastDate: TDateTime; virtual;
    procedure SetFirstDate(Value: TDateTime); virtual;
    procedure SetSelectDate(Value: TDateTime); virtual;
    procedure StepToFuture;
    procedure StepToPast;
    function PosToDateTime(P: TPoint): TDateTime; virtual;

    procedure HidePopup; virtual;
    procedure SetSize;

    property ShowButtonsArea: Boolean read GetShowButtonsArea;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure BeforeDestruction; override;
    function GetHeight: Integer;
    function GetWidth: Integer;
    property CalendarButtons: TDateButtons
      read FCalendarButtons write SetCalendarButtons;
    property FirstDate: TDateTime read FFirstDate write SetFirstDate;
    property Flat: Boolean read FFlat write SetFlat default True;
    property SelectDate: TDateTime read FSelectDate write SetSelectDate;

    property Font;
    property OnDateTimeChanged: TNotifyEvent read FOnDateTimeChanged
      write FOnDateTimeChanged;
  end;

  { TcxPopupCalendar }

  TcxPopupCalendar = class(TcxCustomCalendar)
  private
    FEdit: TcxCustomPopupEdit;
    FOnHidePopup: TNotifyEvent;
  protected
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure HidePopup; override;
    property Edit: TcxCustomPopupEdit read FEdit write FEdit;
    property OnHidePopup: TNotifyEvent read FOnHidePopup write FOnHidePopup;
  end;

  { TcxCustomDateEditProperties }

  TDateOnError = (deNoChange, deToday, deNull);
  TcxInputKind = (ikStandard, ikMask, ikRegExpr);

  TcxCustomDateEditProperties = class(TcxCustomPopupEditProperties, IcxFormatContollerListener)
  private
    FDateButtons: TDateButtons;
    FDateOnError: TDateOnError;
    FInputKind: TcxInputKind;
    FSaveTime: Boolean;
    FShowTime: Boolean;
    procedure BuildEditMask;
    function GetMaxDate: TDateTime;
    function GetMinDate: TDateTime;
    procedure SetDateButtons(const Value: TDateButtons);
    procedure SetDateOnError(const Value: TDateOnError);
    procedure SetInputKind(const Value: TcxInputKind);
    procedure SetMaxDate(const Value: TDateTime);
    procedure SetMinDate(const Value: TDateTime);
    procedure SetSaveTime(const Value: Boolean);
    procedure SetShowTime(const Value: Boolean);
  protected
    procedure Changed; override;

    // IcxFormatContollerListener
    procedure FormatChanged;

    function GetAlwaysPostEditValue: Boolean; override;
    function GetDisplayFormatOptions: TcxEditDisplayFormatOptions; override;
    function IsEditValueNumeric: Boolean; override;
    property DateButtons: TDateButtons read FDateButtons write SetDateButtons
      default [btnToday, btnClear];
    property DateOnError: TDateOnError read FDateOnError write SetDateOnError
      default deNoChange;
    property InputKind: TcxInputKind read FInputKind write SetInputKind
      default ikRegExpr;
    property ImmediateDropDown default False;
    property MaxDate: TDateTime read GetMaxDate write SetMaxDate;
    property MinDate: TDateTime read GetMinDate write SetMinDate;
    property SaveTime: Boolean read FSaveTime write SetSaveTime default True;
    property ShowTime: Boolean read FShowTime write SetShowTime default True;
  public
    constructor Create(AOwner: TPersistent); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    class function GetContainerClass: TcxContainerClass; override;
    function GetEditValueSource(AEditFocused: Boolean): TcxDataEditValueSource; override;
    function IsEditValueValid(var EditValue: TcxEditValue;
      AEditFocused: Boolean): Boolean; override;
    procedure PrepareDisplayValue(const AEditValue: TcxEditValue;
      var DisplayValue: TcxEditValue; AEditFocused: Boolean); override;
    procedure ValidateDisplayValue(var ADisplayValue: TcxEditValue;
      var AErrorText: TCaption; var Error: Boolean; AEdit: TcxCustomEdit); override;
  end;

  { TcxDateEditProperties }

  TcxDateEditProperties = class(TcxCustomDateEditProperties)
  published
    property Alignment;
    property ButtonGlyph;
    property DateButtons;
    property DateOnError;
    property ImmediatePost;
    property InputKind;
    property MaxDate;
    property MinDate;
    property ReadOnly;
    property SaveTime;
    property ShowTime;
    property OnChange;
    property OnCloseUp;
    property OnEditValueChanged;
    property OnInitPopup;
    property OnPopup;
    property OnValidate;
  end;

  { TcxCustomDateEdit }

  TcxCustomDateEdit = class(TcxCustomPopupEdit)
  private
    FCalendar: TcxPopupCalendar;
    FDateDropDown: TDateTime;
    FSavedTime: TDateTime;
    procedure DateChange(Sender: TObject);
    function GetDate: TDateTime;
    function GetProperties: TcxDateEditProperties;
    procedure HideCalendar(Sender: TObject);
    procedure SetDate(Value: TDateTime);
    procedure SetProperties(Value: TcxDateEditProperties);
  protected
    procedure CheckEditorValueBounds; override;
    procedure CreatePopupWindow; override;
    procedure DropDown; override;
    procedure InitializePopupWindow; override;
    function InternalGetText: TCaption; override;
    procedure InternalSetDisplayValue(const Value: TcxEditValue); override;
    procedure InternalSetEditValue(const Value: TcxEditValue;
      AValidateEditValue: Boolean); override;
    function InternalSetText(const Value: TCaption): Boolean; override;
    procedure PropertiesChanged(Sender: TObject); override;
    property Calendar: TcxPopupCalendar read FCalendar;
    property Properties: TcxDateEditProperties
      read GetProperties write SetProperties;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    class function GetPropertiesClass: TcxCustomEditPropertiesClass; override;
    procedure PrepareEditValue(const ADisplayValue: TcxEditValue;
      out EditValue: TcxEditValue; AEditFocused: Boolean); override;
    property Date: TDateTime read GetDate write SetDate stored False;
  end;

  { TcxDateEdit }

  TcxDateEdit = class(TcxCustomDateEdit)
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
    property TabStop default True;
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

    property EditValue;
    property Date;

  {$IFDEF VCL}
    property BiDiMode;
    property ParentBiDiMode;
    property OnEndDock;
    property OnStartDock;
  {$ENDIF}
  end;

implementation

uses
{$IFDEF VCL}
  dxThemeManager,
{$ENDIF}
{$IFDEF DELPHI6}
  Variants,
{$ENDIF}
  cxLookAndFeelPainters, cxLookAndFeels, cxVariants;

const
  ADateNavigatorTime = 200;
{$IFNDEF VCL}
  VK_F4 = Key_F4;

type
  TCanvasAccess = class(TCanvas);
{$ENDIF}

procedure TrueTextRect(ACanvas: TCanvas; R: TRect; X, Y: Integer;
  const Text: WideString);
{$IFNDEF VCL}
var
  Temp, ABounds: TRect;
  AColor: QColorH;
  ASaveBGMode: BGMode;
  ASaveBGColor: QColorH;
  AClipRgn, ARgn, ASaveClipRgn: QRegionH;
  ASaveClipping: Boolean;
  ABrush: QBrushH;
{$ENDIF}
begin
{$IFDEF VCL}
  ACanvas.TextRect(R, X, Y, Text);
{$ELSE}
  with TCanvasAccess(ACanvas) do
    if Brush.Style = bsSolid then
    begin
      Start(False);
      try
        RequiredState([csHandleValid, csBrushValid]);
        ASaveBGMode := QPainter_BackgroundMode(Handle);
        ASaveBGColor := QPainter_BackgroundColor(Handle);
        ASaveClipping := QPainter_hasClipping(Handle);
        ASaveClipRgn := QRegion_create(QPainter_clipRegion(Handle));
        AClipRgn := QRegion_create(@R, QRegionRegionType_Rectangle);
        if ASaveClipping then
          QRegion_intersect(AClipRgn, AClipRgn, ASaveClipRgn);
        QPainter_setClipRegion(Handle, AClipRgn);

        AColor := QColor(Brush.Color);
        ABrush := QBrush_create(AColor, BrushStyle_SolidPattern);
        QPainter_setBackgroundColor(Handle, AColor);
        QColor_destroy(AColor);

        Temp.Left := X;
        Temp.Top  := Y;
        Temp.BottomRight := R.BottomRight;

        RequiredState([csFontValid]);
        QPainter_setBackgroundMode(Handle, BGMode_OpaqueMode);
        QPainter_drawText(Handle, @Temp, 0, PWideString(@Text), -1, @ABounds, nil);
      {$IFDEF LINUX}
        Inc(ABounds.Top);
      {$ENDIF}
        if not IsRectEmpty(ABounds) then begin
          ARgn := QRegion_create(@ABounds, QRegionRegionType_Rectangle);
          QRegion_subtract(AClipRgn, AClipRgn, ARgn);
          QPainter_setClipRegion(Handle, AClipRgn);
          QPainter_fillRect(Handle, @R, ABrush);
          QRegion_destroy(ARgn);
        end;
        QPainter_setClipRegion(Handle, ASaveClipRgn);
        QPainter_setClipping(Handle, ASaveClipping);
        QPainter_setBackgroundColor(Handle, ASaveBGColor);
        QPainter_setBackgroundMode(Handle, ASaveBGMode);
        QBrush_destroy(ABrush);
        QRegion_destroy(AClipRgn);
        QRegion_destroy(ASaveClipRgn);
      finally
        Stop;
      end
    end
    else
      TextRect(R, X, Y, Text);
{$ENDIF}
end;

{ TMonthListBox }

type
  TcxCustomTextEditAccess = class(TcxCustomTextEdit);

  TMonthListBox = class(TcxCustomPopupWindow)
  private
    FOrigin: TPoint;
    FTopDate: TDateTime;
    FItemHeight: Integer;
    FItemIndex: Integer;
    FItems: TStrings;
    FTimer: TTimer;
    FSign: Integer;
    function GetDate: TDateTime;
    procedure SetItemIndex(Value: Integer);
    procedure SetTopDate(Value: TDateTime);
    procedure DoTimer(Sender: TObject);
  protected
    function CalculatePosition: TPoint; override;
{$IFDEF VCL}
    procedure CreateParams(var Params: TCreateParams); override;
{$ENDIF}
    procedure DoShowed; override;
    procedure FontChanged; {$IFNDEF VCL}override;{$ENDIF}
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure Paint; override;
    property ItemHeight: Integer read FItemHeight;
    property ItemIndex: Integer read FItemIndex write SetItemIndex;
    property Items: TStrings read FItems;
    property TopDate: TDateTime read FTopDate write SetTopDate;
  public
    procedure BeforeDestruction; override;
    constructor Create(AOwnerControl: TWinControl); override;
    procedure CloseUp(AModalResult: Boolean = False); override;
    procedure Popup(AFocusedControl: TWinControl); override;
    property Date: TDateTime read GetDate;
  end;

constructor TMonthListBox.Create(AOwnerControl: TWinControl);
begin
  inherited Create(AOwnerControl);
  ControlStyle := [csCaptureMouse, csOpaque];
  FTopDate := NullDate;
  FTimer := TTimer.Create(nil);
  FTimer.Enabled := False;
  FTimer.Interval := 200;
  FTimer.OnTimer := DoTimer;
  FItemIndex := 3;
  Adjustable := False;
  BorderStyle := pbsFlat;
end;

procedure TMonthListBox.BeforeDestruction;
begin
  FTimer.Free;
  FTimer := nil;
  inherited;
end;

procedure TMonthListBox.CloseUp(AModalResult: Boolean = False);
var
  ADate: TDateTime;
begin
  if GetCaptureControl = Self then SetCaptureControl(nil);
  if not Visible then Exit;
  inherited CloseUp(AModalResult);
  FTimer.Enabled := False;
  ADate := GetDate;
  if ADate <> NullDate then
    TcxCustomCalendar(OwnerParent).SetFirstDate(ADate);
end;

procedure TMonthListBox.Popup(AFocusedControl: TWinControl);
var
  Year, Month, Day: Word;
  R: TRect;
begin
  with TcxCustomCalendar(OwnerParent) do
  begin
    Self.Font.Assign(Font);
    Self.FontChanged;
    DecodeDate(FirstDate, Year, Month, Day);
    ChangeMonth(Year, Month, -3);
    R := GetMonthNameRect;
    R.TopLeft := ClientToScreen(R.TopLeft);
    R.BottomRight := ClientToScreen(R.BottomRight);
    TopDate := EncodeDate(Year, Month, 1);
    FOrigin.X := (R.Left + R.Right - Self.Width) div 2;
    FOrigin.Y := (R.Top + R.Bottom) div 2 - Self.Height div 2;
  end;
  FItemIndex := 3;
  inherited Popup(AFocusedControl);
end;

function TMonthListBox.GetDate: TDateTime;
var
  Year, Month, Day: Word;
begin
  if ItemIndex = -1 then Result := NullDate
  else
  begin
    DecodeDate(TopDate, Year, Month, Day);
    ChangeMonth(Year, Month, ItemIndex);
    Result := EncodeDate(Year, Month, 1);
  end;
end;

procedure TMonthListBox.SetItemIndex(Value: Integer);
var
  PrevItemIndex: Integer;

  procedure InvalidateItemRect(Index: Integer);
  var
    R: TRect;
  begin
    if Index = -1 then Exit;
    with R do
    begin
      Left := BorderWidths[bLeft];
      Top := Index * ItemHeight + BorderWidths[bTop];
      Right := Width - BorderWidths[bRight];
      Bottom := Top + ItemHeight;
    end;
  {$IFDEF VCL}
    InvalidateRect(Handle, @R, False);
  {$ELSE}
    InvalidateRect(R, False);
  {$ENDIF}
  end;

begin
  if not HandleAllocated then Exit;
  if FItemIndex <> Value then
  begin
    PrevItemIndex := FItemIndex;
    FItemIndex := Value;
    InvalidateItemRect(PrevItemIndex);
    InvalidateItemRect(FItemIndex);
  end;
end;

procedure TMonthListBox.SetTopDate(Value: TDateTime);
begin
  if FTopDate <> Value then
  begin
    FTopDate := Value;
    Repaint;
  end;
end;

procedure TMonthListBox.DoTimer(Sender: TObject);
var
  Year, Month, Day: Word;
begin
  DecodeDate(TopDate, Year, Month, Day);
  ChangeMonth(Year, Month, FSign);
  TopDate := EncodeDate(Year, Month, 1);
end;

function TMonthListBox.CalculatePosition: TPoint;
begin
  Result := FOrigin;
end;

{$IFDEF VCL}
procedure TMonthListBox.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
    WindowClass.Style := WindowClass.Style or CS_SAVEBITS;
end;
{$ENDIF}

procedure TMonthListBox.DoShowed;
begin
  SetCaptureControl(Self);
end;

procedure TMonthListBox.FontChanged;
begin
  inherited;
  Canvas.Font.Assign(Font);
  with TcxCustomCalendar(OwnerParent) do
  begin
    FItemHeight := FHeaderHeight - 2;
    Self.Width := BorderWidths[bLeft] + BorderWidths[bRight] + 6 * FColWidth;
    Self.Height := BorderWidths[bTop] + BorderWidths[bBottom] + 7 * FItemHeight;
  end;
end;

procedure TMonthListBox.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  CloseUp;
  inherited MouseUp(Button, Shift, X, Y);
end;

procedure TMonthListBox.MouseMove(Shift: TShiftState; X, Y: Integer);
const
  Times: array[0..3] of UINT = (500, 250, 100, 50);
var
  Delta: Integer;
  Interval: Integer;
begin
  if PtInRect(ClientRect, Point(X, Y)) then
  begin
    FTimer.Enabled := False;
    ItemIndex := Y div ItemHeight;
  end
  else
  begin
    ItemIndex := -1;
    if Y < 0 then Delta := Y
    else
      if Y >= ClientHeight then
        Delta := 1 + Y - ClientHeight
      else
      begin
        FTimer.Enabled := False;
        Exit;
      end;
    FSign := Delta div Abs(Delta);
    Interval := Abs(Delta) div ItemHeight;
    if Interval > 3 then Interval := 3;
    if not FTimer.Enabled or (Times[Interval] <> FTimer.Interval) then
    begin
      FTimer.Interval := Times[Interval];
      FTimer.Enabled := True;
    end;
  end;
end;

procedure TMonthListBox.Paint;
const
  Colors: array[Boolean] of TColor = (clWindow, clWindowText);
var
  I: Integer;
  Year, Month, Day: Word;
  Selected: Boolean;
  R: TRect;
  S: string;
begin
{$IFNDEF VCL}
  Canvas.Canvas.Start;
  try
{$ENDIF}
    with Canvas do
    begin
      Brush.Style := bsClear;
      Pen.Color := clBlack;
    {$IFDEF DELPHI5}
      Canvas.Rectangle(ClientRect);
    {$ELSE}
      with ClientRect do
        Canvas.Rectangle(Left, Top, Right, Bottom);
    {$ENDIF}
      Brush.Style := bsSolid;
    end;
    DecodeDate(TopDate, Year, Month, Day);
    with R do
    begin
      Left  := BorderWidths[bLeft];
      Top   := BorderWidths[bTop];
      Right := Width - BorderWidths[bRight];
      Bottom := Top + ItemHeight;
    end;
    for I := 0 to 6 do
    begin
      Selected := I = ItemIndex;
      with Canvas do
      begin
        Font.Color := Colors[not Selected];
        Brush.Color := Colors[Selected];
        FillRect(R);
        S := LongMonthNames[Month] + ' ' + IntToStr(Year);
        DrawText(S, R, cxAlignCenter or cxSingleLine, True);
      end;
      IncMonth(Year, Month);
      OffsetRect(R, 0, ItemHeight);
    end;
{$IFNDEF VCL}
  finally
    Canvas.Canvas.Stop;
  end;
{$ENDIF}
end;

{ TcxCustomCalendar }

type
  TcxCustomEditAccess = class(TcxCustomEdit);

constructor TcxCustomCalendar.Create(AOwner: TComponent);
var
  Year, Month, Day: Word;
begin
  inherited Create(AOwner);
  ControlStyle := [csCaptureMouse, csOpaque];
  FSelectDate := Date;
  DecodeDate(FSelectDate, Year, Month, Day);
  FFirstDate := EncodeDate(Year, Month, 1);
  Width := 20;
  Height := 20;
  FTimer := TTimer.Create(nil);
  with FTimer do
  begin
    Enabled := False;
    Interval := ADateNavigatorTime;
    OnTimer := DoScrollArrow;
  end;
  FListBox := TMonthListBox.Create(Self);
  FListBox.CaptureFocus := False;
  FListBox.IsTopMost := True;
  FListBox.OwnerParent := Self;
  Keys := [kAll, kArrows, kChars, kTab];
  CreateButtons;
  SetCalendarButtons([btnClear, btnToday]);
  FFlat := True;
end;

destructor TcxCustomCalendar.Destroy;
begin
  FreeAndNil(FListBox);
  inherited Destroy;
end;

procedure TcxCustomCalendar.AdjustButtonsPosition;
var
  R: TRect;
begin
  if not HandleAllocated then Exit;
  R := GetTodayButtonRect;
  FTodayButton.SetBounds(R.Left, R.Top, R.Right - R.Left + 1, R.Bottom - R.Top + 1);
  R := GetClearButtonRect;
  FClearButton.SetBounds(R.Left, R.Top, R.Right - R.Left + 1, R.Bottom - R.Top + 1);
end;

procedure TcxCustomCalendar.ButtonClick(Sender: TObject);
var
  ADate: TDateTime;
begin
  if Sender = FTodayButton then ADate := Date else ADate := NullDate;
  SelectDate := ADate;
  DoDateTimeChanged;
  HidePopup;
end;

procedure TcxCustomCalendar.CreateButtons;
begin
  FTodayButton := TcxButton.Create(Self);
  with FTodayButton do
  begin
    UseSystemPaint := False;
    Caption := cxGetResourceString(@cxSDatePopupToday);
    OnClick := ButtonClick;
    TabStop := False;
  end;
  FClearButton := TcxButton.Create(Self);
  with FClearButton do
  begin
    UseSystemPaint := False;
    Caption := cxGetResourceString(@cxSDatePopupClear);
    OnClick := ButtonClick;
    TabStop := False;
  end;
end;

function TcxCustomCalendar.ColOfDate(ADate: TDateTime): Integer;
begin
  Result := DayOfWeek(ADate) - cxFormatController.StartOfWeek - 1;
  if Result < 0 then Inc(Result, 7);
end;

procedure TcxCustomCalendar.DoDateTimeChanged;
begin
  if Assigned(FOnDateTimeChanged) then FOnDateTimeChanged(Self);
end;

procedure TcxCustomCalendar.DoScrollArrow(Sender: TObject);
var
  P: TPoint;
begin
  GetCursorPos(P);
  P := ScreenToClient(P);
  if PtInRect(GetLeftArrowRect, P) then StepToPast;
  if PtInRect(GetRightArrowRect, P) then StepToFuture;
end;

function TcxCustomCalendar.GetHeaderRect: TRect;
begin
  with Result do
  begin
    Left := 0;
    Top := 0;
    Right := ClientWidth;
    Bottom := Top + FHeaderHeight;
  end;
end;

function TcxCustomCalendar.GetInternalRect: TRect;
begin
  with Result do
  begin
    Left := 0;
    Top := FHeaderHeight + Byte(not FFlat);
    Right := ClientWidth;
    Bottom := Top + FDaysOfWeekHeight + 6 * FRowHeight + 1;
  end;
end;

function TcxCustomCalendar.GetLeftArrowRect: TRect;
begin
  Result := Rect(1, 1, FColWidth - 1, FHeaderHeight - 2);
end;

function TcxCustomCalendar.GetRightArrowRect: TRect;
begin
  Result := Rect(ClientWidth - FColWidth, 1,
    ClientWidth -1 - Byte(not FFlat), FHeaderHeight - 2);
end;

function TcxCustomCalendar.GetMonthNameRect: TRect;
begin
  Result := GetInternalRect;
  with Result do
  begin
    Inc(Left, FColWidth);
    Dec(Right, FColWidth + Byte(not FFlat));
    Bottom := Top - Byte(not FFlat)- 1;
    Top := Bottom - (FHeaderHeight - 2);
  end;
end;

function TcxCustomCalendar.GetTodayButtonRect: TRect;
begin
  Result :=
  {$IFDEF DELPHI6}
    Types.Bounds(
  {$ELSE}
    Classes.Bounds(
  {$ENDIF}
      (ClientWidth - FTodayButtonWidth - Byte(FClearButton.Visible) * FClearButtonWidth) div
       (3 - Byte(not FClearButton.Visible)),
      ClientHeight - FButtonsRegionHeight + FButtonsOffset,
      FTodayButtonWidth, FButtonsHeight);
end;

function TcxCustomCalendar.GetClearButtonRect: TRect;
begin
  Result :=
  {$IFDEF DELPHI6}
    Types.Bounds(
  {$ELSE}
    Classes.Bounds(
  {$ENDIF}
      ClientWidth - FClearButtonWidth -
      (ClientWidth - Byte(FTodayButton.Visible) * FTodayButtonWidth - FClearButtonWidth) div
       (3 - Byte(not FTodayButton.Visible)),
      ClientHeight - FButtonsRegionHeight + FButtonsOffset,
      FClearButtonWidth, FButtonsHeight);
end;

function TcxCustomCalendar.GetShowButtonsArea: Boolean;
begin
  Result := FTodayButton.Visible or FClearButton.Visible;
end;

procedure TcxCustomCalendar.SetFlat(Value: Boolean);
begin
  if FFlat <> Value then
  begin
    FFlat := Value;
    Invalidate;
  end;
end;

procedure TcxCustomCalendar.SetCalendarButtons(const Value: TDateButtons);
begin
  if Value <> FCalendarButtons then
  begin
    FCalendarButtons := Value;
    FTodayButton.Visible := btnToday in Value;
    FClearButton.Visible := btnClear in Value;
    AdjustButtonsPosition;
  end;
end;

procedure TcxCustomCalendar.FontChanged;

   function Max(A, B: Integer): Integer;
   begin
     if A > B then Result := A else Result := B;
   end;

begin
  inherited;
  Canvas.Font.Assign(Font);
  FColWidth := 3 * Canvas.TextWidth('0');
  FSideWidth := 2 * Canvas.TextWidth('0');
  FRowHeight := Canvas.TextHeight('0') + 2;
  FHeaderHeight := FRowHeight + 2 + Byte(FFlat);
  FDaysOfWeekHeight := FRowHeight + 1;

  FTodayButton.Font.Assign(Font);
  FClearButton.Font.Assign(Font);

  // find max width of buttons
  FTodayButtonWidth := Canvas.TextWidth(cxGetResourceString(@cxSDatePopupToday)) +
    FColWidth;
  FClearButtonWidth := Max(FTodayButtonWidth,
    Canvas.TextWidth(cxGetResourceString(@cxSDatePopupClear)) + FColWidth);
  FTodayButtonWidth := FClearButtonWidth;
  
  FButtonsOffset := Font.Size div 2;
  FButtonsHeight := MulDiv(Canvas.TextHeight('Wg'), 20, 13);
  FButtonsRegionHeight := FButtonsOffset + FButtonsHeight +
    Font.Size * 3 div 4;
  SetSize;
end;

function TcxCustomCalendar.HasBackground: Boolean;
begin
{$IFDEF VCL}
  // for correctly work with manifest
  Result := FTodayButton.LookAndFeel.NativeStyle and AreVisualStylesAvailable;
{$ELSE}
  Result := False;
{$ENDIF}
end;

procedure TcxCustomCalendar.InitControl;
begin
  inherited;
  FTodayButton.Parent := Self;
  FClearButton.Parent := Self;
  FontChanged;
end;

procedure TcxCustomCalendar.KeyDown(var Key: Word; Shift: TShiftState);
var
  AYear, AMonth, ADay: Word;

  procedure MoveByMonth(AForward: Boolean);
  begin
    DecodeDate(SelectDate, AYear, AMonth, ADay);
    if AForward then
      IncMonth(AYear, AMonth)
    else
      DecMonth(AYear, AMonth);
    ADay := CheckDay(AYear, AMonth, ADay);
    SelectDate := EncodeDate(AYear, AMonth, ADay);
  end;

begin
  case Key of
    VK_LEFT:
        SelectDate := SelectDate - 1;
    VK_RIGHT: SelectDate := SelectDate + 1;
    VK_UP:
      if not (Shift = [ssAlt]) then SelectDate := SelectDate - 7;
    VK_DOWN:
      if not (Shift = [ssAlt]) then SelectDate := SelectDate + 7;
    VK_HOME:
      if Shift = [ssCtrl] then
        SelectDate := SelectDate - (GetDateElement(SelectDate, deDay) - 1)
      else
        SelectDate := SelectDate - ColOfDate(SelectDate);
    VK_END:
      if Shift = [ssCtrl] then
      begin
        DecodeDate(SelectDate, AYear, AMonth, ADay);
        SelectDate := SelectDate + (DaysPerMonth(AYear, AMonth) - ADay)
      end
      else SelectDate := SelectDate + (6 - ColOfDate(SelectDate));
    VK_PRIOR: MoveByMonth(False);
    VK_NEXT: MoveByMonth(True)
  end;
  inherited KeyDown(Key, Shift);
end;

procedure TcxCustomCalendar.MouseDown(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  ADate: TDateTime;
begin
  inherited MouseDown(Button, Shift, X, Y);
  if Button = mbLeft then
  begin
    ADate := PosToDateTime(Point(X, Y));
    if (ADate <> NullDate) then SelectDate := ADate;

    if PtInRect(GetMonthNameRect, Point(X, Y)) then
      // show month's list box
      FListBox.Popup(Self)
    else if PtInRect(GetLeftArrowRect, Point(X, Y)) then
    begin
      // shift by month to past
      StepToPast;
      FTimer.Enabled := True;
    end
    else if PtInRect(GetRightArrowRect, Point(X, Y)) then
    begin
      // shift by month to future
      StepToFuture;
      FTimer.Enabled := True;
    end;
  end;
end;

procedure TcxCustomCalendar.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  ADate: TDateTime;
  R: TRect;
begin
  if FTimer.Enabled then Exit;

  ADate := NullDate;
  if ssLeft in Shift then
    ADate := PosToDateTime(Point(X, Y));
  inherited MouseMove(Shift, X, Y);
  if (ssLeft in Shift) and (ADate <> NullDate) then
  begin
    FSelectDate := ADate;
    R := GetInternalRect;
    Inc(R.Top, FDaysOfWeekHeight);
    InvalidateRect(R, False);
  end;
end;

procedure TcxCustomCalendar.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  if FTimer.Enabled then
  begin
    FTimer.Enabled := False;
    Exit;
  end;
  if PtInRect(ClientRect, Point(X, Y)) then
    HidePopup;
  inherited MouseUp(Button, Shift, X, Y);
  if not (ssDouble in Shift) and PtInRect(ClientRect, Point(X, Y)) and
    (PosToDateTime(Point(X, Y))<> NullDate) then
      DoDateTimeChanged;
end;

procedure TcxCustomCalendar.Paint;
var
  CurDate, ALastDate: TDateTime;
  Year, Month, Day: Word;
  R, TextR: TRect;
  Size: TSize;
  S: string;
  SaveRgn: TcxRegion;

  procedure DrawHeader;
  begin
    R := GetLeftArrowRect;
    TcxUltraFlatLookAndFeelPainter.DrawArrow(Canvas, R, cxbsNormal, adLeft, False);
    Canvas.ExcludeClipRect(R);
    R := GetRightArrowRect;
    TcxUltraFlatLookAndFeelPainter.DrawArrow(Canvas, R, cxbsNormal, adRight, False);
    Canvas.ExcludeClipRect(R);
    DecodeDate(FirstDate, Year, Month, Day);
    with Canvas do
    begin
      TextR := GetHeaderRect;
      if not FFlat then InflateRect(TextR, 0, 1);
      S := LongMonthNames[Month] + ' ' + IntToStr(Year);
      Size := TextExtent(S);
      Font.Color  := clBtnText;
      Brush.Color := clBtnFace;
      if FFlat then
        with TextR do
        begin
          Pen.Color := clBtnText;
          Dec(Bottom);
          with TextR do
            TrueTextRect(Canvas, TextR, (Left + Right - Size.cX) div 2,
              (Top + Bottom - Size.cY) div 2, S);
          MoveTo(Left, Bottom);
          LineTo(Right, Bottom);
          Inc(Bottom);
        end
        else
        begin
          InflateRect(TextR, -1, -2);
          with TextR do
            TrueTextRect(Canvas, TextR, (Left + Right - Size.cX) div 2, (Top + Bottom - Size.cY) div 2, S);
          InflateRect(TextR, 1, 1);
          DrawEdge(TextR, False, False, cxBordersAll);
          InflateRect(TextR, 0, 1);
        end;
      if not FFlat then InflateRect(TextR, 0, -1);
      ExcludeClipRect(TextR);
    end;
  end;

  procedure DrawMonth;
  var
    SideR: TRect;
    I, J, DayBase: Integer;
    ADate, DateBase: TDateTime;
    Selected: Boolean;
    AFontCharset: TFontCharset;
  begin
    DecodeDate(FirstDate, Year, Month, Day);
    with Canvas do
    begin
      // write first letters of day's names
      Brush.Color := Self.Color;
      R := GetInternalRect;
      with TextR do
      begin
        Left := R.Left + FSideWidth;
        Right := R.Right - FSideWidth;
        Top := R.Top;
        Bottom := Top + FDaysOfWeekHeight - 2;
        FillRect(Rect(Left - 8, Top, Left, Bottom + 2));
        FillRect(Rect(Right, Top, Right + 8, Bottom + 2));
        Pen.Color := clBtnShadow;
        MoveTo(Left, Bottom);
        LineTo(Right, Bottom);
        Pen.Color := clWindow;
        MoveTo(Left, Bottom + 1);
        LineTo(Right, Bottom + 1);
        Right := Left;
      end;

      for I := 0 to 6 do
      begin
        with TextR do
        begin
          Left := Right;
          Right := Left + FColWidth;
        end;
        J := cxFormatController.StartOfWeek + 1 + I;
        if J > 7 then
          Dec(J, 7);
        AFontCharset := Font.Charset;
{$IFDEF VCL}
        if AFontCharset = DEFAULT_CHARSET then
          AFontCharset := GetDefFontCharset;
{$ELSE}
// TODO
{$ENDIF}
        if AFontCharset in [ARABIC_CHARSET, CHINESEBIG5_CHARSET, GB2312_CHARSET] then
          S := AnsiLastChar(ShortDayNames[J])
        else
          S := WideString(ShortDayNames[J])[1];
        Size := TextExtent(S);
        with TextR do
          TrueTextRect(Canvas, TextR, Right - 3 - Size.cX, (Top + Bottom - Size.cY) div 2, S);
      end;
      // write numbers of days
      DateBase := EncodeDate(Year, Month, 1) - 1;
      DayBase := 1 - ColOfDate(DateBase + 1);
      if DayBase = 1 then Dec(DayBase, 7);
      for I := 0 to 6 do
        for J := 0 to 5 do
        begin
          with TextR do
          begin
            Left := R.Left + FSideWidth + I * FColWidth;
            Top := R.Top + FDaysOfWeekHeight + J * FRowHeight;
            Right := Left + FColWidth;
            Bottom := Top + FRowHeight;
          end;
          ADate := DateBase + DayBase + J * 7 + I;
          Selected := (ADate = FSelectDate) or
            ((FSelectDate = NullDate) and (ADate = CurDate));
          SideR := TextR;
          // draw frame around current date
          if Selected then
            Brush.Color := clHighlight
          else
            Brush.Color := Self.Color;
          if (ADate = CurDate) or (CurDate = NullDate) then
          begin
            Pen.Color := clMaroon;
            with TextR do
              Polyline([Point(Left, Bottom - 1), Point(Left, Top),
                Point(Right - 1, Top), Point(Right - 1, Bottom - 1),
                Point(Left, Bottom - 1)]);
            InflateRect(TextR, -1, -1);
          end;
          // draw text of day's number
          if not Selected and ((ADate < FirstDate) or (ADate > ALastDate)) then
            Font.Color := {$IFDEF VCL} clGrayText {$ELSE} clDisabledText {$ENDIF}
          else
            if Selected then
              Font.Color := clHighlightText
            else
              Font.Color := clWindowText;

          S := IntToStr(GetDateElement(ADate, deDay));
          Size := TextExtent(S);
          with SideR do
            TrueTextRect(Canvas, TextR, Right - 3 - Size.cX, (Top + Bottom - Size.cY) div 2, S);
        end;
      with R do
        ExcludeClipRect(Rect(Left + FSideWidth, Top, Right - FSideWidth, Bottom - 1));
    end;
  end;

begin
{$IFNDEF VCL}
  Canvas.Canvas.Start;
  try
{$ENDIF}
    CurDate := Date;
    ALastDate := GetLastDate;
    with Canvas do
    begin
      SaveRgn := GetClipRegion;
      Brush.Style := bsSolid;
      DrawHeader;
      DrawMonth;
      if ShowButtonsArea then
      begin
        R := Rect(FSideWidth, ClientHeight - FButtonsRegionHeight - 1,
          ClientWidth - FSideWidth + 1, ClientHeight - FButtonsRegionHeight);
        Pen.Color := clBtnShadow;
        MoveTo(R.Left, R.Top);
        LineTo(R.Right - 1, R.Bottom - 1);
        ExcludeClipRect(R);
      end;
      Brush.Color := Self.Color;
      FillRect(ClientRect);
      SetClipRegion(SaveRgn, roSet);
    end;
{$IFNDEF VCL}
  finally
    Canvas.Canvas.Stop;
  end;
{$ENDIF}
end;

procedure TcxCustomCalendar.Resize;
begin
  SetSize;
  inherited;
end;

function TcxCustomCalendar.GetLastDate: TDateTime;
var
  Year, Month, Day: Word;
begin
  DecodeDate(FirstDate, Year, Month, Day);
  Result := EncodeDate(Year, Month, DaysPerMonth(Year, Month));
end;

function TcxCustomCalendar.GetRealFirstDate: TDateTime;
var
  ACol: Integer;
begin
  Result := FirstDate;
  ACol := ColOfDate(FirstDate);
  if ACol = 0 then
    Result := Result - 7
  else
    Result := Result - ACol;
end;

function TcxCustomCalendar.GetRealLastDate: TDateTime;
var
  Year, Month, Day: Word;
  ACol: Integer;
begin
  Result := GetLastDate;
  DecodeDate(Result, Year, Month, Day);
  ACol := ColOfDate(EncodeDate(Year, Month, 1));
  Result := Result + 6 * 7 - DaysPerMonth(Year, Month) - ACol;
  if ACol = 0 then Result := Result - 7;
end;

procedure TcxCustomCalendar.SetFirstDate(Value: TDateTime);
begin
  Value := DateOf(Value) - (GetDateElement(Value, deDay) - 1);
  if FFirstDate <> Value then
  begin
    FFirstDate := Value;
    Repaint;
  end;
end;

procedure TcxCustomCalendar.SetSelectDate(Value: TDateTime);
var
  Year, Month, Day: Word;
begin
  if FSelectDate <> Value then
  begin
    FSelectDate := Value;
    if Value <> NullDate then
    begin
      if FSelectDate < GetRealFirstDate then
      begin
        DecodeDate(FSelectDate, Year, Month, Day);
        ChangeMonth(Year, Month, -1);
        FirstDate := EncodeDate(Year, Month, CheckDay(Year, Month, Day));
      end;
      if FSelectDate > GetRealLastDate then
        FirstDate := DateOf(FSelectDate);
      Repaint;
    end;
  end;
end;

procedure TcxCustomCalendar.StepToFuture;
var
  Year, Month, Day: Word;
begin
  DecodeDate(FirstDate, Year, Month, Day);
  IncMonth(Year, Month);
  FirstDate := EncodeDate(Year, Month, 1);
  Repaint;
end;

procedure TcxCustomCalendar.StepToPast;
var
  Year, Month, Day: Word;
begin
  DecodeDate(FirstDate, Year, Month, Day);
  DecMonth(Year, Month);
  FirstDate := EncodeDate(Year, Month, 1);
  Repaint;
end;

function TcxCustomCalendar.PosToDateTime(P: TPoint): TDateTime;
var
  X, Y: Integer;
  R: TRect;
  Year, Month, Day: Word;
  ADate: TDateTime;
begin
  if PtInRect(ClientRect, P) then
  begin
    R := GetInternalRect;
    with R do
    begin
      Inc(Top, FDaysOfWeekHeight);
      Inc(Left, FSideWidth);
      Dec(Right, FSideWidth);
      Bottom := Top + 6 * FRowHeight;
      if PtInRect(R, P) then
      begin
        Dec(P.X, Left);
        Dec(P.Y, Top);
        X := P.X div FColWidth;
        Y := P.Y div FRowHeight;
        DecodeDate(FirstDate, Year, Month, Day);
        ADate := EncodeDate(Year, Month, 1);
        Result := ADate - ColOfDate(ADate) + Y * 7 + X;
        if ColOfDate(FirstDate) = 0 then
          Result := Result - 7;
      end
      else Result := NullDate;
    end;
  end
  else Result := NullDate;
end;

procedure TcxCustomCalendar.HidePopup;
begin
  FTimer.Enabled := False;
  TMonthListBox(FListBox).FTimer.Enabled := False;
  if FListBox.Showing then FListBox.CloseUp;
end;

procedure TcxCustomCalendar.SetSize;
begin
  SetBounds(Left, Top, GetWidth, GetHeight);
  AdjustButtonsPosition;
end;

procedure TcxCustomCalendar.BeforeDestruction;
begin
  FTimer.Free;
  FTimer := nil;
  inherited;
end;

function TcxCustomCalendar.GetHeight: Integer;
begin
  Result := BorderSize * 2 +
    FHeaderHeight + Byte(not FFlat) + FDaysOfWeekHeight + 6 * FRowHeight + 1;
  if ShowButtonsArea then
    Inc(Result, FButtonsRegionHeight);
end;

function TcxCustomCalendar.GetWidth: Integer;
begin
  Result := BorderSize * 2 + 2 * FSideWidth + 7 * FColWidth;
end;

{ TcxPopupCalendar }

constructor TcxPopupCalendar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  IsPopupControl := True;
end;

procedure TcxPopupCalendar.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited KeyDown(Key, Shift);
  case Key of
    VK_ESCAPE: HidePopup;
    VK_F4: if not (ssAlt in Shift) then HidePopup;
    VK_RETURN:
      if not FListBox.Showing then
      begin
        HidePopup;
        DoDateTimeChanged;
      end;
    VK_UP:
      if Shift = [ssAlt] then HidePopup;
    VK_DOWN:
      if Shift = [ssAlt] then HidePopup;
  end;
end;

procedure TcxPopupCalendar.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  R: TRect;
begin
  inherited MouseMove(Shift, X, Y);
  if FTimer.Enabled then Exit;
  if (ssLeft in Shift) and not PtInRect(ClientRect, Point(X, Y)) then
  begin
    FSelectDate := TcxCustomDateEdit(Edit).Date;
    R := GetInternalRect;
    Inc(R.Top, FDaysOfWeekHeight);
    InvalidateRect(R, False);
  end;
end;

procedure TcxPopupCalendar.HidePopup;
begin
  inherited HidePopup;
  if Assigned(FOnHidePopup) then FOnHidePopup(Self);
end;

{ TcxCustomDateEditProperties }

constructor TcxCustomDateEditProperties.Create(AOwner: TPersistent);
begin
  inherited Create(AOwner);
  FDateButtons := [btnToday, btnClear];
  FDateOnError := deNoChange;
  CaseInsensitive := True;
  FInputKind := ikRegExpr;
  BuildEditMask;
  FSaveTime := True;
  FShowTime := True;
  ImmediateDropDown := False;
  PopupSizeable := False;
  ValidateOnEnter := True;
  cxFormatController.AddListener(Self);
end;

destructor TcxCustomDateEditProperties.Destroy;
begin
  cxFormatController.RemoveListener(Self);
  inherited Destroy;
end;

procedure TcxCustomDateEditProperties.BuildEditMask;
begin
  LockUpdate(True);
  try
    case InputKind of
      ikMask:
        begin
          MaskKind := emkStandard;
          EditMask := cxFormatController.StandardDateEditMask;
        end;
      ikRegExpr:
        begin
          MaskKind := emkRegExprEx;
          EditMask := cxFormatController.RegExprDateEditMask;
        end;
    else
      EditMask := '';
    end;
  finally
    LockUpdate(False);
  end;
end;

function TcxCustomDateEditProperties.GetMaxDate: TDateTime;
begin
  Result := inherited MaxValue;
end;

function TcxCustomDateEditProperties.GetMinDate: TDateTime;
begin
  Result := inherited MinValue;
end;

procedure TcxCustomDateEditProperties.SetDateButtons(const Value: TDateButtons);
begin
  if Value <> FDateButtons then
  begin
    FDateButtons := Value;
    Changed;
  end;
end;

procedure TcxCustomDateEditProperties.SetDateOnError(const Value: TDateOnError);
begin
  if Value <> FDateOnError then
  begin
    FDateOnError := Value;
    Changed;
  end;
end;

procedure TcxCustomDateEditProperties.SetInputKind(
  const Value: TcxInputKind);
begin
  if Value <> FInputKind then
  begin
    FInputKind := Value;
    Changed;
  end;
end;

procedure TcxCustomDateEditProperties.SetMaxDate(const Value: TDateTime);
begin
  inherited MaxValue := Value;
end;

procedure TcxCustomDateEditProperties.SetMinDate(const Value: TDateTime);
begin
  inherited MinValue := Value;
end;

procedure TcxCustomDateEditProperties.SetSaveTime(const Value: Boolean);
begin
  if Value <> FSaveTime then
  begin
    FSaveTime := Value;
    Changed;
  end;
end;

procedure TcxCustomDateEditProperties.SetShowTime(const Value: Boolean);
begin
  if Value <> FShowTime then
  begin
    FShowTime := Value;
    Changed;
  end;
end;

procedure TcxCustomDateEditProperties.Changed;
begin
  if ChangedLocked then
    Exit;
  BeginUpdate;
  try
    BuildEditMask;
  finally
    EndUpdate(False);
  end;
  inherited Changed;
end;

procedure TcxCustomDateEditProperties.FormatChanged;
begin
  Changed;
end;

function TcxCustomDateEditProperties.GetAlwaysPostEditValue: Boolean;
begin
  Result := True;
end;

function TcxCustomDateEditProperties.GetDisplayFormatOptions: TcxEditDisplayFormatOptions;
begin
  Result := [dfoSupports, dfoNoCurrencyValue];
end;

function TcxCustomDateEditProperties.IsEditValueNumeric: Boolean;
begin
  Result := True;
end;

procedure TcxCustomDateEditProperties.Assign(Source: TPersistent);
begin
  if Source is TcxCustomDateEditProperties then
  begin
    BeginUpdate;
    try
      inherited Assign(Source);
      with TcxCustomDateEditProperties(Source) do
      begin
        Self.DateButtons := DateButtons;
        Self.DateOnError := DateOnError;
        Self.InputKind := InputKind;
        Self.SaveTime := SaveTime;
        Self.ShowTime := ShowTime;
      end;
    finally
      EndUpdate
    end
  end  
  else
    inherited Assign(Source);
end;

class function TcxCustomDateEditProperties.GetContainerClass: TcxContainerClass;
begin
  Result := TcxCustomDateEdit;
end;

function TcxCustomDateEditProperties.GetEditValueSource(AEditFocused: Boolean): TcxDataEditValueSource;
begin
  Result := GetValueEditorEditValueSource(AEditFocused);
end;

function TcxCustomDateEditProperties.IsEditValueValid(
  var EditValue: TcxEditValue; AEditFocused: Boolean): Boolean;
begin
  Result := VarIsNull(EditValue) or VarIsDate(EditValue) or
    VarIsNumericEx(EditValue);
end;

procedure TcxCustomDateEditProperties.PrepareDisplayValue(
  const AEditValue: TcxEditValue; var DisplayValue: TcxEditValue;
  AEditFocused: Boolean);
begin
  if VarIsNull(AEditValue) then
    DisplayValue := GetEmptyString
  else
    if VarIsStr(AEditValue) or not (VarIsDate(AEditValue) or VarIsNumericEx(AEditValue)) then
      DisplayValue := AEditValue
    else
      if AEditFocused then
        if ShowTime then
          DisplayValue := DateTimeToTextEx(AEditValue, InputKind = ikMask)
        else
          DisplayValue := DateTimeToTextEx(DateOf(AEditValue), InputKind = ikMask)
      else
        if ShowTime then
          DisplayValue := DateTimeToTextEx(AEditValue, False)
        else
          DisplayValue := DateTimeToTextEx(DateOf(AEditValue), False);
  if AEditFocused then
    inherited PrepareDisplayValue(DisplayValue, DisplayValue, AEditFocused);
end;

procedure TcxCustomDateEditProperties.ValidateDisplayValue(
  var ADisplayValue: TcxEditValue; var AErrorText: TCaption; var Error: Boolean;
  AEdit: TcxCustomEdit);
var
  ADate: TDateTime;
begin
  if ADisplayValue <> GetEmptyString then
  begin
    Error := not TextToDateEx(ADisplayValue, ADate);
    if not Error then
      ADisplayValue := DateTimeToTextEx(ADate, InputKind = ikMask);
  end;
  if Error then
    AErrorText := cxGetResourceString(@cxSDateError);
  if Assigned(OnValidate) then
  begin
    OnValidate(AEdit, ADisplayValue, AErrorText, Error);
    Error := Error or ((ADisplayValue <> GetEmptyString) and not TextToDateEx(ADisplayValue, ADate));
  end
  else
    if Error then
    begin
      case DateOnError of
        deToday: ADate := SysUtils.Date;
        deNull: ADate := NullDate;
      end;
      if DateOnError <> deNoChange then
        Error := False;
    end;

  if not Error then
    if ADisplayValue = GetEmptyString then
      with TcxCustomDateEdit(AEdit) do
      begin
        FEditValue := Null;
        FSavedTime := 0;
      end
    else
    begin
      if not SaveTime then ADate := DateOf(ADate);
      if IsEditValueNumeric and (MinValue <> MaxValue) and (ADate <> NullDate) then
      begin
        ADisplayValue := ADate;
        CheckEditorValueBounds(ADisplayValue, AErrorText, Error, AEdit);
      end;
      // support for time in the SmartInput
      if not AEdit.IsDestroying then
        with TcxCustomDateEdit(AEdit) do
        begin
          if (TimeOf(ADate) = 0) and (FSavedTime <> 0) then
            if ADate >= 0 then
              ADate := ADate + FSavedTime
            else
              ADate := ADate - FSavedTime;
          FEditValue := ADate;
          if SaveTime then FSavedTime := TimeOf(ADate) else FSavedTime := 0;
        end;
    end;
end;

{ TcxCustomDateEdit }

constructor TcxCustomDateEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCalendar := TcxPopupCalendar.Create(Self);
  ControlStyle := ControlStyle - [csSetCaption];
  with FCalendar do
  begin
    Parent := PopupWindow;
    FEdit := Self;
    OnHidePopup := HideCalendar;
    FTodayButton.LookAndFeel.MasterLookAndFeel := Self.Style.LookAndFeel;
    FClearButton.LookAndFeel.MasterLookAndFeel := Self.Style.LookAndFeel;
  end;
  Properties.PopupControl := Calendar;
  FDateDropDown := NullDate;
end;

destructor TcxCustomDateEdit.Destroy;
begin
  FreeAndNil(FCalendar);
  inherited Destroy;
end;

procedure TcxCustomDateEdit.DateChange(Sender: TObject);
var
  ADate: TDateTime;
  ADisplayValue: TcxEditValue;
begin
  ADate := Calendar.SelectDate;
  if Properties.SaveTime and (ADate <> NullDate) then
    if ADate >= 0 then
      ADate := ADate + TimeOf(FDateDropDown)
    else
      ADate := ADate - TimeOf(FDateDropDown);
  Properties.PrepareDisplayValue(ADate, ADisplayValue, True);
  if ((Date <> ADate) or not InternalCompareString(DisplayValue, VarToStr(ADisplayValue), True)) and
    DoEditing then
  begin
    if ADate = NullDate then
      EditValue := Null
    else
      EditValue := ADate;
    ModifiedAfterEnter := True;
  end;
end;

function TcxCustomDateEdit.GetDate: TDateTime;
begin
  if VarIsNull(EditValue) or VarIsEmpty(EditValue) or
    (VarIsStr(EditValue) and (EditValue = '')) then
      Result := NullDate
  else
    try
      Result := EditValue;
    except
      on EConvertError do Result := NullDate;
      on EVariantError do Result := NullDate;
    end
end;

function TcxCustomDateEdit.GetProperties: TcxDateEditProperties;
begin
  Result := TcxDateEditProperties(InternalGetProperties);
end;

procedure TcxCustomDateEdit.HideCalendar(Sender: TObject);
begin
  PopupWindow.ClosePopup;
end;

procedure TcxCustomDateEdit.SetDate(Value: TDateTime);
begin
  if (GetDate <> Value) then
    if Value = NullDate then EditValue := Null else EditValue := Value;
end;

procedure TcxCustomDateEdit.SetProperties(Value: TcxDateEditProperties);
begin
  FProperties.Assign(Value);
end;

procedure TcxCustomDateEdit.CheckEditorValueBounds;
begin
  KeyboardAction := ModifiedAfterEnter;
  try
    with Properties do
      if Date < MinValue then
        Date := MinValue
      else if Date > MaxValue then
        Date := MaxValue;
  finally
    KeyboardAction := False;
  end;
end;

procedure TcxCustomDateEdit.CreatePopupWindow;
begin
  inherited;
  PopupWindow.ModalMode := False;
end;

procedure TcxCustomDateEdit.DropDown;
begin
  Properties.PopupControl := FCalendar;
  inherited DropDown;
end;

procedure TcxCustomDateEdit.InitializePopupWindow;
var
  ADate: TDateTime;
begin
  inherited InitializePopupWindow;
  with Calendar do
  begin
    HandleNeeded;
    Color := Self.Style.Color;
    Flat := Self.Style.LookAndFeel.Kind in [lfFlat, lfUltraFlat];
    CalendarButtons := Properties.DateButtons;
    OnDateTimeChanged := nil;
    if Self.Date = NullDate then
    begin
      FDateDropDown := NullDate;
      ADate := SysUtils.Date;
    end
    else
    begin
      FDateDropDown := Self.Date;
      ADate := DateOf(FDateDropDown);
    end;
    FirstDate := ADate;
    SelectDate := ADate;
    FTodayButton.Caption := cxGetResourceString(@cxSDatePopupToday);
    FClearButton.Caption := cxGetResourceString(@cxSDatePopupClear);
    Font.Assign(Self.Style.Font);
    SetSize; // force recalculate size
    OnDateTimeChanged := DateChange;
  end;
end;

function TcxCustomDateEdit.InternalGetText: TCaption;
begin
  Result := DisplayValue;
end;

procedure TcxCustomDateEdit.InternalSetDisplayValue(const Value: TcxEditValue);
var
  Temp, Display: TcxEditValue;
begin
  if Focused then
  begin
    Temp := FEditValue;
    inherited InternalSetDisplayValue(Value);
    FEditValue := Temp;
  end
  else
  begin
    Properties.PrepareDisplayValue(FEditValue, Display, Focused);
    InnerTextEdit.EditValue := Display;
  end;
end;

procedure TcxCustomDateEdit.InternalSetEditValue(const Value: TcxEditValue;
  AValidateEditValue: Boolean);
begin
  if IsDestroying then Exit;
  if VarIsNumericEx(Value) or VarIsDate(Value) then
    if not Properties.SaveTime then
    begin
      FSavedTime := 0;
      inherited InternalSetEditValue(DateOf(Value), AValidateEditValue);
    end else
    begin
      FSavedTime := TimeOf(Value);
      inherited InternalSetEditValue(Value, AValidateEditValue)
    end
  else
    inherited InternalSetEditValue(Value, AValidateEditValue)
end;

function TcxCustomDateEdit.InternalSetText(const Value: TCaption): Boolean;
begin
  Result := SetDisplayText(Value);
end;

procedure TcxCustomDateEdit.PropertiesChanged(Sender: TObject);
var
  ADate: TDateTime;
begin
  if not PropertiesChangeLocked then
  begin
    IsEditValidated := False;
    ValidateEdit(False);
    if not Properties.FSaveTime and not VarIsNull(FEditValue) and
     (VarIsNumericEx(FEditValue) or VarIsDate(FEditValue)) then
    begin
      ADate := FEditValue;
      ADate := DateOf(ADate);
      FEditValue := ADate;
    end;
    Properties.BuildEditMask;
    inherited PropertiesChanged(Sender);
  end;
end;

class function TcxCustomDateEdit.GetPropertiesClass: TcxCustomEditPropertiesClass; 
begin
  Result := TcxDateEditProperties;
end;

procedure TcxCustomDateEdit.PrepareEditValue(
  const ADisplayValue: TcxEditValue; out EditValue: TcxEditValue;
  AEditFocused: Boolean);
var
  ADate: TDateTime;
begin
  if CompareStr(ADisplayValue, Properties.GetEmptyString) = 0 then
    EditValue := Null
  else
  begin
    DateTextValid(ADisplayValue, not cxFormatController.UseDelphiDateTimeFormats,
      ADate);
    if ADate = NullDate then
      if Properties.DateOnError = deToday then
        EditValue := SysUtils.Date
      else
        EditValue := Null
    else
      EditValue := ADate;
  end;
end;

initialization
  GetRegisteredEditProperties.Register(TcxDateEditProperties, scxSEditRepositoryDateItem);

end.

