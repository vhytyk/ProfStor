
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

unit cxCalc;

{$I cxEdVer.inc}

interface

uses
{$IFDEF VCL}
  Windows, Messages,
{$ELSE}
  Qt, QTypes, Types,
{$ENDIF}
  SysUtils, Classes, Graphics, Controls, Forms, StdCtrls, Clipbrd,
  cxClasses, cxControls, cxGraphics, cxButtons, cxContainer, cxEdit,
  cxDropDownEdit, cxEditConsts, cxFormats, cxLookAndFeelPainters, cxDataUtils;

const
  cxDefCalcPrecision     = 13;
  // Size
  cxMinCalcFontSize      = 8;
  cxCalcMinBoldFontSize  = 10;
  cxMinCalcBtnWidth      = 28;
  cxMinCalcBtnHeight     = 22;
  cxMinCalcLargeBtnWidth = Integer(Trunc(1.7*cxMinCalcBtnWidth));
  cxMinCalcXOfs          = 3;
  cxMinCalcYOfs          = 3;
  cxMinCalcWidth         = (cxMinCalcXOfs+cxMinCalcBtnWidth)*6+cxMinCalcXOfs*3+3;
  cxMinCalcHeight        = (cxMinCalcYOfs+cxMinCalcBtnHeight)*5+cxMinCalcYOfs+3;

type
  TcxCalcState = (csFirst, csValid, csError);

  TcxCalcButtonKind =
   (cbBack, cbCancel, cbClear,
    cbMC, cbMR, cbMS, cbMP,
    cbNum0, cbNum1, cbNum2, cbNum3, cbNum4, cbNum5, cbNum6, cbNum7, cbNum8, cbNum9,
    cbSign, cbDecimal,
    cbDiv, cbMul, cbSub, cbAdd,
    cbSqrt, cbPercent, cbRev, cbEqual, cbNone);

const
  BtnCaptions : array [cbBack..cbEqual] of string[4] = ('Back', 'CE', 'C',
    'MC', 'MR', 'MS', 'M+',
    '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
    '+/-', ',', '/', '*', '-', '+', 'sqrt', '%', '1/x', '=');

type
  TcxButtonInfo = record
    Kind : TcxCalcButtonKind;
    Text : String[4];
    FontColor : TColor;
    BtnRect : TRect;
    Down : Boolean;
    Grayed : Boolean;
  end;

  TCalcButtons = array [TcxCalcButtonKind] of TcxButtonInfo;

  { TcxCustomCalculator }

  TcxCalcButtonClick = procedure(Sender: TObject; var ButtonKind : TcxCalcButtonKind) of object;
  TcxCalcGetEditValue = procedure(Sender: TObject; var Value : String) of object;
  TcxCalcSetEditValue = procedure(Sender: TObject; const Value : String) of object;

  TcxCustomCalculator = class(TcxControl)
  private
    {calc style}
    FAutoFontSize : Boolean;
    FBeepOnError: Boolean;
    FBorderStyle : TBorderStyle;
    FFocusRectVisible : Boolean;
    {calc size}
    FCalcFontSize      : Integer;
    FCalcBtnWidth      : Integer;
    FCalcBtnHeight     : Integer;
    FCalcLargeBtnWidth : Integer;
    FCalcXOfs          : Integer;
    FCalcYOfs          : Integer;
    FCalcWidth         : Integer;
    FCalcHeight        : Integer;
    {math}
    FMemory : Extended;
    FOperator: TcxCalcButtonKind;
    FOperand: Extended;
    FPrecision: Byte;
    FStatus: TcxCalcState;
    {control}
    FButtons : TCalcButtons;
    FActiveButton : TcxCalcButtonKind;
    FDownButton : TcxCalcButtonKind;
    FPressedButton : TcxCalcButtonKind;
    FTracking: Boolean;
    // events
    FOnDisplayChange: TNotifyEvent;
    FOnButtonClick: TcxCalcButtonClick;
    FOnError: TNotifyEvent;
    FOnResult: TNotifyEvent;
    FOnHidePopup: TNotifyEvent;

    function GetDisplay: Extended;
    procedure SetDisplay(Value: Extended);
    function GetMemory: Extended;

    procedure SetAutoFontSize(Value : Boolean);
    procedure SetBorderStyle(Value: TBorderStyle);
    procedure SetFocusRectVisible(Value : Boolean);

    procedure StopTracking;
    procedure TrackButton(X,Y: Integer);
    procedure InvalidateButton(ButtonKind : TcxCalcButtonKind);
    procedure DoButtonDown(ButtonKind : TcxCalcButtonKind);
    procedure DoButtonUp(ButtonKind : TcxCalcButtonKind);
    procedure Error;
    procedure CheckFirst;
    procedure Clear;
    procedure CalcSize(AWidth, AHeight : Integer);
    procedure UpdateMemoryButtons;
    procedure InvalidateMemoryButtons;
    procedure ResetOperands;
  protected
    IsPopupControl : Boolean;
    function GetPainter: TcxCustomLookAndFeelPainterClass; virtual;
    procedure Paint; override;
  {$IFDEF VCL}
    procedure CreateParams(var Params: TCreateParams); override;
  {$ENDIF}
    procedure FontChanged; override;
    procedure FocusChanged; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseLeave(AControl: TControl); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure KeyUp(var Key: Word; Shift: TShiftState); override;
    procedure Resize; override;
    procedure SetEnabled({$IFNDEF VCL}const{$ENDIF} Value: Boolean); override;
    procedure CreateLayout;
    procedure ButtonClick(ButtonKind : TcxCalcButtonKind);
    // for link with EditControl
    function GetEditorValue: String; virtual;
    procedure SetEditorValue(const Value: String); virtual;
    procedure HidePopup; virtual;

    property Color default clBtnFace;
    property ParentColor default False;
    property BorderStyle: TBorderStyle read FBorderStyle write SetBorderStyle
      default bsNone;

    property AutoFontSize : Boolean read FAutoFontSize write SetAutoFontSize
      default True;
    property BeepOnError: Boolean read FBeepOnError write FBeepOnError
      default True;
    property ShowFocusRect : Boolean
      read FFocusRectVisible write SetFocusRectVisible default True;

    property Precision: Byte read FPrecision write FPrecision
      default cxDefCalcPrecision;
    property EditorValue : string read GetEditorValue write SetEditorValue;

    property OnHidePopup: TNotifyEvent read FOnHidePopup write FOnHidePopup;
    property OnDisplayChange: TNotifyEvent
      read FOnDisplayChange write FOnDisplayChange;
    property OnButtonClick: TcxCalcButtonClick
      read FOnButtonClick write FOnButtonClick;
    property OnError: TNotifyEvent read FOnError write FOnError;
    property OnResult: TNotifyEvent read FOnResult write FOnResult;
  public
    constructor Create(AOwner: TComponent); override;
    function GetButtonKindAt(X, Y : Integer) : TcxCalcButtonKind;
    function GetButtonKindChar(Ch : Char) : TcxCalcbuttonKind;
    function GetButtonKindKey(Key: Word; Shift: TShiftState) : TcxCalcbuttonKind;
    procedure CopyToClipboard;
    procedure PasteFromClipboard;
    property Memory: Extended read GetMemory;
    property Value: Extended read GetDisplay write SetDisplay;
  published
    property TabStop default True;
  end;

  { TcxPopupCalculator }

  TcxCustomCalcEdit = class;

  TcxPopupCalculator = class(TcxCustomCalculator)
  private
    FEdit: TcxCustomCalcEdit;
  protected
    function GetEditorValue: string; override;
    function GetPainter: TcxCustomLookAndFeelPainterClass; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure SetEditorValue(const Value: string); override;
    property Edit: TcxCustomCalcEdit read FEdit write FEdit;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  { TcxCustomCalcEditProperties }

  TcxCustomCalcEditProperties = class(TcxCustomPopupEditProperties, IcxFormatContollerListener)
  private
    FBeepOnError: Boolean;
    FFormatChanging: Boolean;
    FPrecision: Byte;
    FQuickClose: Boolean;
    procedure SetBeepOnError(const Value: Boolean);
    procedure SetPrecision(const Value: Byte);
    procedure SetQuickClose(const Value: Boolean);
  protected
    // IcxFormatContollerListener
    procedure FormatChanged;

    function GetAlwaysPostEditValue: Boolean; override;
    function StrToFloatEx(S: string; var Value: Double): Boolean;
    property BeepOnError: Boolean read FBeepOnError write SetBeepOnError
      default True;
    property ImmediateDropDown default False;
    property Precision: Byte read FPrecision write SetPrecision
      default cxDefCalcPrecision;
    property QuickClose: Boolean read FQuickClose write SetQuickClose
      default False;
  public
    constructor Create(AOwner: TPersistent); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    class function GetContainerClass: TcxContainerClass; override;
    function GetEditValueSource(AEditFocused: Boolean): TcxDataEditValueSource; override;
    function IsDisplayValueValid(var DisplayValue: TcxEditValue;
      AEditFocused: Boolean): Boolean; override;
    procedure PrepareDisplayValue(const AEditValue: TcxEditValue;
      var DisplayValue: TcxEditValue; AEditFocused: Boolean); override;
    procedure ValidateDisplayValue(var ADisplayValue: TcxEditValue;
      var AErrorText: TCaption; var Error: Boolean; AEdit: TcxCustomEdit); override;
  end;

  { TcxCalcEditProperties }

  TcxCalcEditProperties = class(TcxCustomCalcEditProperties)
  published
    property Alignment;
    property AutoSelect;
    property BeepOnError;
    property ButtonGlyph;
    property ImmediatePost;
    property Precision;
    property ReadOnly;
    property QuickClose;
    property UseLeftAlignmentOnEditing;
    property OnChange;
    property OnCloseUp;
    property OnEditValueChanged;
    property OnInitPopup;
    property OnPopup;
    property OnValidate;
  end;

  { TcxCustomCalcEdit }

  TcxCustomCalcEdit = class(TcxCustomPopupEdit, IcxFormatContollerListener)
  private
    FCalculator: TcxPopupCalculator;
    function GetProperties: TcxCalcEditProperties;
    function GetValue: Extended;
    procedure HideCalculator(Sender: TObject);
    procedure SetProperties(Value: TcxCalcEditProperties);
    procedure SetValue(const Value: Extended);
  protected
    // IcxFormatContollerListener
    procedure FormatChanged;

    function CanDropDown: Boolean; override;
    procedure CreatePopupWindow; override;
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure DoInitPopup; override;
    procedure InitializePopupWindow; override;
    function IsValidChar(Key: Char): Boolean; override;
    procedure KeyPress(var Key: Char); override;
    procedure PopupWindowClosed(Sender: TObject); override;
    procedure PropertiesChanged(Sender: TObject); override;
    property Calculator: TcxPopupCalculator read FCalculator;
    property Properties: TcxCalcEditProperties
      read GetProperties write SetProperties;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    class function GetPropertiesClass: TcxCustomEditPropertiesClass; override;
    procedure PasteFromClipboard; override;
    procedure PrepareEditValue(const ADisplayValue: TcxEditValue;
      out EditValue: TcxEditValue; AEditFocused: Boolean); override;
    property Value: Extended read GetValue write SetValue stored False;
  end;

  { TcxCalcEdit }

  TcxCalcEdit = class(TcxCustomCalcEdit)
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
    property EditValue;
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
    property Value;
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

implementation

uses
{$IFDEF VCL}
  dxuxTheme,
{$ENDIF}
{$IFDEF DELPHI6}
  Variants,
{$ELSE}
  cxVariants,
{$ENDIF}
  cxLookAndFeels, cxTextEdit;

const
  ResultButtons    = [cbEqual, cbPercent];
  RepeatButtons    = [cbBack];
  OperationButtons = [cbAdd, cbSub, cbMul, cbDiv];
  BorderWidth = 4;

function Max(X, Y: Integer): Integer;
begin
  Result := Y;
  if X > Y then
    Result := X;
end;

type
  TcxCustomEditAccess = class(TcxCustomEdit);
  TcxEditDataBindingAccess = class(TcxEditDataBinding);

{TcxCustomCalculator}
constructor TcxCustomCalculator.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  {init size variables}
  FCalcFontSize      := cxMinCalcFontSize;
  FCalcBtnWidth      := cxMinCalcBtnWidth;
  FCalcBtnHeight     := cxMinCalcBtnHeight;
  FCalcLargeBtnWidth := cxMinCalcLargeBtnWidth;
  FCalcXOfs          := cxMinCalcXOfs;
  FCalcYOfs          := cxMinCalcYOfs;
  FCalcWidth         := cxMinCalcWidth;
  FCalcHeight        := cxMinCalcHeight;
  {default size}
  Width := FCalcWidth;
  Height := FCalcHeight;
  {style}
  ControlStyle := [csCaptureMouse, csOpaque];
  Color := clBtnFace;
  ParentColor := False;
  TabStop := True;
  FAutoFontSize := True;
  FBorderStyle := bsNone;
  FBeepOnError := True;
  FDownButton := cbNone;
  FActiveButton := cbNone;
  FPressedButton := cbNone;
  FFocusRectVisible := True;
  FOperator := cbEqual;
  FPrecision := cxDefCalcPrecision;
  Keys := [kAll, kArrows, kChars, kTab];
  CreateLayout;
end;

function TcxCustomCalculator.GetButtonKindAt(X, Y : Integer) : TcxCalcButtonKind;
var i : TcxCalcButtonKind;
begin
  Result := cbNone;
  for i := cbBack to cbEqual do
    if PtInRect(FButtons[i].BtnRect, Point(X, Y)) then
    begin
      Result := i;
      Exit;
    end;
end;

function TcxCustomCalculator.GetPainter: TcxCustomLookAndFeelPainterClass;
begin
  Result := TcxStandardLookAndFeelPainter;
end;

procedure TcxCustomCalculator.Paint;
var
  i : TcxCalcButtonKind;
  State: TcxButtonState;
begin
  if not HandleAllocated then Exit;
{$IFNDEF VCL}
  Canvas.Canvas.Start;
  try
{$ENDIF}
    with Canvas do
    begin
      {Fill Background}
      Brush.Color := Self.Color;
      if IsPopupControl then FillRect(ClientRect) else FillRect(BoundsRect);
      {Draw buttons}
      Font := Self.Font;
      if AutoFontSize then
      begin
        Font.Size := FCalcFontSize;
        if Font.Size >= cxCalcMinBoldFontSize then
          Font.Style := [fsBold]
        else
          Font.Style := [];
      end;
      Brush.Color := Self.Color;
    end;

    for i := cbBack to cbEqual do
      with FButtons[i] do
    {$IFDEF VCL}
      if RectVisible(Canvas.Handle, BtnRect) then
    {$ENDIF}
      begin
        if Grayed or not Enabled then State := cxbsDisabled
        else if Down then State := cxbsPressed
        else if (FActiveButton = i) and (FDownButton <> i) then State := cxbsHot
        else if IsFocused and (i = cbEqual) then State := cxbsDefault
        else State := cxbsNormal;
        with GetPainter, Canvas do
        begin
          DrawButton(Self.Canvas, BtnRect, '', State);
          Font.Color := FontColor;
          Brush.Style := bsClear;
          if State = cxbsPressed then
          begin
            OffsetRect(BtnRect, ButtonTextShift, ButtonTextShift);
            DrawText(Text, BtnRect, cxAlignHCenter or cxAlignVCenter or cxSingleLine or
              cxShowPrefix, State <> cxbsDisabled);
            OffsetRect(BtnRect, -ButtonTextShift, -ButtonTextShift);
          end
          else
            DrawText(Text, BtnRect, cxAlignHCenter or cxAlignVCenter or cxSingleLine or
              cxShowPrefix, State <> cxbsDisabled);
          Brush.Style := bsSolid;
        end;
        if FFocusRectVisible and IsFocused and (i = cbEqual) then
        begin
          InflateRect(BtnRect, -3, -3);
          Canvas.DrawFocusRect(BtnRect);
          InflateRect(BtnRect, 3, 3);
        end;
      end;
{$IFNDEF VCL}
  finally
    Canvas.Canvas.Stop;
  end;
{$ENDIF}
end;

{$IFDEF VCL}

procedure TcxCustomCalculator.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
  begin
    Style := Style or WS_TABSTOP or WS_CLIPCHILDREN;
    WindowClass.Style := WindowClass.Style and not CS_DBLCLKS;
    if IsPopupControl then
      Style := Style and not WS_BORDER
    else
      if FBorderStyle = bsSingle then
        if NewStyleControls and Ctl3D then
        begin
          Style := Style and not WS_BORDER;
          ExStyle := ExStyle or WS_EX_CLIENTEDGE;
        end
        else
          Style := Style or WS_BORDER;
  end;
end;

{$ENDIF}

procedure TcxCustomCalculator.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var ButtonKind : TcxCalcButtonkind;
begin
  if not (csDesigning in ComponentState) and
      (CanFocus or (GetParentForm(Self) = nil)) and not IsPopupControl then
    SetFocus;

  ButtonKind := GetButtonKindAt(X, Y);
  if (Button = mbLeft) and (ButtonKind <> cbNone) and not FButtons[ButtonKind].Grayed then
  begin
    MouseCapture := True;
    FTracking := True;
    FDownButton := ButtonKind;
    TrackButton(X, Y);
  end;
  inherited MouseDown(Button, Shift, X, Y);
end;

procedure TcxCustomCalculator.MouseMove(Shift: TShiftState; X, Y: Integer);
var OldButton : TcxCalcButtonKind;
begin
  if FTracking then
    TrackButton(X, Y)
  else
    if GetPainter.IsButtonHotTrack and Enabled and not Dragging then
    begin
      OldButton := FActiveButton;
      FActiveButton := GetButtonKindAt(X, Y);
      if FActiveButton <> OldButton then
      begin
        if not FButtons[OldButton].Grayed then
          InvalidateButton(OldButton);
        if not FButtons[FActiveButton].Grayed then
          InvalidateButton(FActiveButton);
      end;
    end;
  inherited MouseMove(Shift, X, Y);
end;

procedure TcxCustomCalculator.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var
  WasPressed: Boolean;
begin
  WasPressed := (FDownButton <> cbNone) and FButtons[FDownButton].Down;
  StopTracking;
  if (Button = mbLeft) and WasPressed then
    ButtonClick(FDownButton);
  FDownButton := cbNone;
  inherited MouseUp(Button, Shift, X, Y);
end;

procedure TcxCustomCalculator.KeyDown(var Key: Word; Shift: TShiftState);
var
  NewButton, OldButton : TcxCalcButtonKind;
begin
  inherited KeyDown(Key, Shift);
  OldButton := FPressedButton;
  NewButton := GetButtonKindKey(Key, Shift);
  if (NewButton <> cbNone) and (OldButton <> NewButton) then
  begin
    DoButtonUp(OldButton);
    FPressedButton := NewButton;
    DoButtonDown(FPressedButton);
  end;
end;

procedure TcxCustomCalculator.KeyPress(var Key: Char);
var
  NewButton, OldButton : TcxCalcButtonKind;
begin
  inherited KeyPress(Key);
  if (Key = ^V) then
    PasteFromClipboard
  else
    if (Key = ^C) then CopyToClipboard;

  OldButton := FPressedButton;
  NewButton := GetButtonKindChar(Key);
  if (NewButton <> cbNone) and (OldButton <> NewButton) then
  begin
    DoButtonUp(OldButton);
    FPressedButton := NewButton;
    DoButtonDown(FPressedButton);
  end;
  if FPressedButton in RepeatButtons {cbBack} then ButtonClick(FPressedButton);
end;

procedure TcxCustomCalculator.KeyUp(var Key: Word; Shift: TShiftState);
begin
  inherited KeyUp(Key, Shift);
  DoButtonUp(FPressedButton);
end;

procedure TcxCustomCalculator.Resize;
begin
  CalcSize(ClientWidth, ClientHeight);
  ClientWidth := FCalcWidth;
  ClientHeight := FCalcHeight;
  inherited;
end;

procedure TcxCustomCalculator.DoButtonDown(ButtonKind : TcxCalcButtonKind);
begin
  if ButtonKind <> cbNone then
  begin
    FButtons[ButtonKind].Down := True;
    InvalidateButton(ButtonKind);
    Update;
    if not (ButtonKind in RepeatButtons) {cbBack} then ButtonClick(ButtonKind);
  end;
end;

procedure TcxCustomCalculator.DoButtonUp(ButtonKind : TcxCalcButtonKind);
begin
  if ButtonKind <> cbNone then
  begin
    FButtons[ButtonKind].Down := False;
    InvalidateButton(ButtonKind);
    FPressedButton := cbNone;
    Update;
  end;
end;

function TcxCustomCalculator.GetEditorValue: String;
begin
  Result := '';
end;

procedure TcxCustomCalculator.SetEditorValue(const Value: String);
begin
end;

procedure TcxCustomCalculator.CreateLayout;
const
  BtnColors : array [cbBack..cbEqual] of TColor = (clMaroon, clMaroon, clMaroon,
    clRed, clRed, clRed, clRed,
    clBlue, clBlue, clBlue, clBlue, clBlue, clBlue, clBlue, clBlue, clBlue, clBlue,
    clBlue, clBlue,
    clRed, clRed, clRed, clRed,
    clNavy, clNavy, clNavy, clRed);
var i : TcxCalcButtonKind;
    X : Integer;
begin
  for i := cbBack to cbEqual do
  begin
    FButtons[i].Kind := i;
    FButtons[i].Text := BtnCaptions[i];
    if i = cbDecimal then FButtons[i].Text := SysUtils.DecimalSeparator
    else  FButtons[i].Text := BtnCaptions[i];
    FButtons[i].FontColor := BtnColors[i];
    FButtons[i].BtnRect := Rect(0, 0, 0, 0);
    FButtons[i].Down := False;
    FButtons[i].Grayed := False;
  end;
  {coord buttons}
  FButtons[cbMC].BtnRect := Rect(FCalcXOfs,
                                 (FCalcYOfs+FCalcBtnHeight)+FCalcYOfs,
                                 FCalcXOfs+FCalcBtnWidth,
                                 (FCalcYOfs+FCalcBtnHeight)*2);
  FButtons[cbMR].BtnRect := Rect(FCalcXOfs,
                                 (FCalcYOfs+FCalcBtnHeight)*2+FCalcYOfs,
                                 FCalcXOfs+FCalcBtnWidth,
                                 (FCalcYOfs+FCalcBtnHeight)*3);
  FButtons[cbMS].BtnRect := Rect(FCalcXOfs,
                                 (FCalcYOfs+FCalcBtnHeight)*3+FCalcYOfs,
                                 FCalcXOfs+FCalcBtnWidth,
                                 (FCalcYOfs+FCalcBtnHeight)*4);
  FButtons[cbMP].BtnRect := Rect(FCalcXOfs,
                                 (FCalcYOfs+FCalcBtnHeight)*4+FCalcYOfs,
                                 FCalcXOfs+FCalcBtnWidth,
                                 (FCalcYOfs+FCalcBtnHeight)*5);
  X := FCalcXOfs+FCalcBtnWidth + FCalcXOfs + 4;
  {7, 8, 9, /, sqrt}
  FButtons[cbNum7].BtnRect := Rect(X+FCalcXOfs,
                                   (FCalcYOfs+FCalcBtnHeight)+FCalcYOfs,
                                   X+FCalcXOfs+FCalcBtnWidth,
                                   (FCalcYOfs+FCalcBtnHeight)*2);
  FButtons[cbNum8].BtnRect := Rect(X+FCalcXOfs+(FCalcXOfs+FCalcBtnWidth),
                                   (FCalcYOfs+FCalcBtnHeight)+FCalcYOfs,
                                   X+(FCalcXOfs+FCalcBtnWidth)*2,
                                   (FCalcYOfs+FCalcBtnHeight)*2);
  FButtons[cbNum9].BtnRect := Rect(X+FCalcXOfs+(FCalcXOfs+FCalcBtnWidth)*2,
                                   (FCalcYOfs+FCalcBtnHeight)+FCalcYOfs,
                                   X+(FCalcXOfs+FCalcBtnWidth)*3,
                                   (FCalcYOfs+FCalcBtnHeight)*2);
  FButtons[cbDiv].BtnRect := Rect(X+FCalcXOfs+(FCalcXOfs+FCalcBtnWidth)*3,
                                   (FCalcYOfs+FCalcBtnHeight)+FCalcYOfs,
                                   X+(FCalcXOfs+FCalcBtnWidth)*4,
                                   (FCalcYOfs+FCalcBtnHeight)*2);
  FButtons[cbSqrt].BtnRect := Rect(X+FCalcXOfs+(FCalcXOfs+FCalcBtnWidth)*4,
                                   (FCalcYOfs+FCalcBtnHeight)+FCalcYOfs,
                                   X+(FCalcXOfs+FCalcBtnWidth)*5,
                                   (FCalcYOfs+FCalcBtnHeight)*2);

  {4, 5, 6, *, %}
  FButtons[cbNum4].BtnRect := Rect(X+FCalcXOfs,
                                  (FCalcYOfs+FCalcBtnHeight)*2+FCalcYOfs,
                                   X+FCalcXOfs+FCalcBtnWidth,
                                 (FCalcYOfs+FCalcBtnHeight)*3);
  FButtons[cbNum5].BtnRect := Rect(X+FCalcXOfs+(FCalcXOfs+FCalcBtnWidth),
                                  (FCalcYOfs+FCalcBtnHeight)*2+FCalcYOfs,
                                   X+(FCalcXOfs+FCalcBtnWidth)*2,
                                 (FCalcYOfs+FCalcBtnHeight)*3);
  FButtons[cbNum6].BtnRect := Rect(X+FCalcXOfs+(FCalcXOfs+FCalcBtnWidth)*2,
                                  (FCalcYOfs+FCalcBtnHeight)*2+FCalcYOfs,
                                   X+(FCalcXOfs+FCalcBtnWidth)*3,
                                 (FCalcYOfs+FCalcBtnHeight)*3);
  FButtons[cbMul].BtnRect := Rect(X+FCalcXOfs+(FCalcXOfs+FCalcBtnWidth)*3,
                                  (FCalcYOfs+FCalcBtnHeight)*2+FCalcYOfs,
                                   X+(FCalcXOfs+FCalcBtnWidth)*4,
                                 (FCalcYOfs+FCalcBtnHeight)*3);
  FButtons[cbPercent].BtnRect := Rect(X+FCalcXOfs+(FCalcXOfs+FCalcBtnWidth)*4,
                                  (FCalcYOfs+FCalcBtnHeight)*2+FCalcYOfs,
                                   X+(FCalcXOfs+FCalcBtnWidth)*5,
                                 (FCalcYOfs+FCalcBtnHeight)*3);

  {1, 2, 3, -, 1/x}
  FButtons[cbNum1].BtnRect := Rect(X+FCalcXOfs,
                                  (FCalcYOfs+FCalcBtnHeight)*3+FCalcYOfs,
                                   X+FCalcXOfs+FCalcBtnWidth,
                                 (FCalcYOfs+FCalcBtnHeight)*4);
  FButtons[cbNum2].BtnRect := Rect(X+FCalcXOfs+(FCalcXOfs+FCalcBtnWidth),
                                  (FCalcYOfs+FCalcBtnHeight)*3+FCalcYOfs,
                                   X+(FCalcXOfs+FCalcBtnWidth)*2,
                                 (FCalcYOfs+FCalcBtnHeight)*4);
  FButtons[cbNum3].BtnRect := Rect(X+FCalcXOfs+(FCalcXOfs+FCalcBtnWidth)*2,
                                  (FCalcYOfs+FCalcBtnHeight)*3+FCalcYOfs,
                                   X+(FCalcXOfs+FCalcBtnWidth)*3,
                                 (FCalcYOfs+FCalcBtnHeight)*4);
  FButtons[cbSub].BtnRect := Rect(X+FCalcXOfs+(FCalcXOfs+FCalcBtnWidth)*3,
                                  (FCalcYOfs+FCalcBtnHeight)*3+FCalcYOfs,
                                   X+(FCalcXOfs+FCalcBtnWidth)*4,
                                 (FCalcYOfs+FCalcBtnHeight)*4);
  FButtons[cbRev].BtnRect := Rect(X+FCalcXOfs+(FCalcXOfs+FCalcBtnWidth)*4,
                                  (FCalcYOfs+FCalcBtnHeight)*3+FCalcYOfs,
                                   X+(FCalcXOfs+FCalcBtnWidth)*5,
                                 (FCalcYOfs+FCalcBtnHeight)*4);

  {0, +/-, ., +, =}
  FButtons[cbNum0].BtnRect := Rect(X+FCalcXOfs,
                                  (FCalcYOfs+FCalcBtnHeight)*4+FCalcYOfs,
                                   X+FCalcXOfs+FCalcBtnWidth,
                                 (FCalcYOfs+FCalcBtnHeight)*5);
  FButtons[cbSign].BtnRect := Rect(X+FCalcXOfs+(FCalcXOfs+FCalcBtnWidth),
                                  (FCalcYOfs+FCalcBtnHeight)*4+FCalcYOfs,
                                   X+(FCalcXOfs+FCalcBtnWidth)*2,
                                 (FCalcYOfs+FCalcBtnHeight)*5);
  FButtons[cbDecimal].BtnRect := Rect(X+FCalcXOfs+(FCalcXOfs+FCalcBtnWidth)*2,
                                  (FCalcYOfs+FCalcBtnHeight)*4+FCalcYOfs,
                                   X+(FCalcXOfs+FCalcBtnWidth)*3,
                                 (FCalcYOfs+FCalcBtnHeight)*5);
  FButtons[cbAdd].BtnRect := Rect(X+FCalcXOfs+(FCalcXOfs+FCalcBtnWidth)*3,
                                  (FCalcYOfs+FCalcBtnHeight)*4+FCalcYOfs,
                                   X+(FCalcXOfs+FCalcBtnWidth)*4,
                                 (FCalcYOfs+FCalcBtnHeight)*5);
  FButtons[cbEqual].BtnRect := Rect(X+FCalcXOfs+(FCalcXOfs+FCalcBtnWidth)*4,
                                  (FCalcYOfs+FCalcBtnHeight)*4+FCalcYOfs,
                                   X+(FCalcXOfs+FCalcBtnWidth)*5,
                                 (FCalcYOfs+FCalcBtnHeight)*5);
  {C}
  FButtons[cbClear].BtnRect := FButtons[cbEqual].BtnRect;
  FButtons[cbClear].BtnRect.Left := FButtons[cbClear].BtnRect.Right - FCalcLargeBtnWidth;
  FButtons[cbClear].BtnRect.Top := FCalcYOfs;
  FButtons[cbClear].BtnRect.Bottom := FCalcYOfs + FCalcBtnHeight;
  {CE}
  FButtons[cbCancel].BtnRect := FButtons[cbClear].BtnRect;
  FButtons[cbCancel].BtnRect.Right := FButtons[cbClear].BtnRect.Left - FCalcYOfs;
  FButtons[cbCancel].BtnRect.Left := FButtons[cbCancel].BtnRect.Right - FCalcLargeBtnWidth;
  {Back}
  FButtons[cbBack].BtnRect := FButtons[cbCancel].BtnRect;
  FButtons[cbBack].BtnRect.Right := FButtons[cbBack].BtnRect.Left - FCalcYOfs;
  FButtons[cbBack].BtnRect.Left := FButtons[cbBack].BtnRect.Right - FCalcLargeBtnWidth;
  // ResetOperands;
  ResetOperands;
  // Update Memory display
  UpdateMemoryButtons;
end;

procedure TcxCustomCalculator.ResetOperands;
begin
  FOperator := cbEqual;
  FStatus := csFirst;
  FMemory := 0.0;
end;

procedure TcxCustomCalculator.SetBorderStyle(Value: TBorderStyle);
begin
  if FBorderStyle <> Value then
  begin
    FBorderStyle := Value;
  {$IFDEF VCL}
    RecreateWnd;
  {$ELSE}
    Invalidate;
  {$ENDIF}
  end;
end;

procedure TcxCustomCalculator.SetFocusRectVisible(Value : Boolean);
begin
  if FFocusRectVisible <> Value then
  begin
    FFocusRectVisible := Value;
    Invalidate;
  end;
end;

procedure TcxCustomCalculator.CalcSize(AWidth, AHeight : Integer);
var
  h, NearHeight, d, dMin : Integer;

  function CalcHeight(ABtnHeight:Integer):Integer;
  var FYOfs : Integer;
  begin
    FYOfs := MulDiv(ABtnHeight, cxMinCalcYOfs, cxMinCalcBtnHeight);
    Result := (FYOfs + ABtnHeight) * 5 + FYOfs;
  end;

begin
  if AutoFontSize then
  begin
    h := MulDiv(AWidth, cxMinCalcHeight, cxMinCalcWidth);
    if AHeight > h then AHeight := h;
    {Calculate nearest FCalcHeight }
    h := cxMinCalcBtnHeight;
    NearHeight := h;
    dMin := AHeight;
    while True do
    begin
      d := abs(CalcHeight(h) - AHeight);
      if d < dMin then
      begin
        dMin := d;
        NearHeight := h;
      end
      else
        Break;
      inc(h);
    end;
  end
  else
    NearHeight := Canvas.FontHeight(Font) * 2;
  FCalcBtnHeight     := NearHeight;
  FCalcBtnWidth      := MulDiv(FCalcBtnHeight, cxMinCalcBtnWidth, cxMinCalcBtnHeight);
  FCalcYOfs          := MulDiv(FCalcBtnHeight, cxMinCalcYOfs, cxMinCalcBtnHeight);
  FCalcXOfs          := FCalcYOfs;
  FCalcLargeBtnWidth := MulDiv(FCalcBtnWidth, 17, 10);
  FCalcFontSize      := MulDiv(FCalcBtnHeight, cxMinCalcFontSize, cxMinCalcBtnHeight);
  FCalcHeight        := (FCalcYOfs+FCalcBtnHeight)*5+FCalcYOfs;
  FCalcWidth         := (FCalcXOfs+FCalcBtnWidth)*6+FCalcXOfs*2+4;
  // reCalc rect buttons
  CreateLayout;
end;

procedure TcxCustomCalculator.FontChanged;
begin
  if not (csLoading in ComponentState) then ParentFont := False;
  inherited FontChanged;
end;

procedure TcxCustomCalculator.FocusChanged;
begin
  inherited;
  InvalidateButton(cbEqual);
end;

procedure TcxCustomCalculator.SetEnabled({$IFNDEF VCL}const{$ENDIF} Value: Boolean);
begin
  inherited;
  Invalidate;
end;

procedure TcxCustomCalculator.StopTracking;
begin
  if FTracking then
  begin
    TrackButton(-1, -1);
    FTracking := False;
    MouseCapture := False;
    if FDownButton <> cbNone then
      FButtons[FDownButton].Down := False;
  end;
end;

procedure TcxCustomCalculator.TrackButton(X,Y: Integer);
var
  FlagRepaint : Boolean;
begin
  if FDownButton <> cbNone then
  begin
    FlagRepaint := (GetButtonKindAt(X, Y) = FDownButton) <> FButtons[FDownButton].Down;
    FButtons[FDownButton].Down := (GetButtonKindAt(X, Y) = FDownButton);
    if FlagRepaint then
      InvalidateButton(FDownButton);
  end;
end;

procedure TcxCustomCalculator.InvalidateButton(ButtonKind : TcxCalcButtonKind);
var
  R: TRect;
begin
  if ButtonKind <> cbNone then
  begin
    R := FButtons[ButtonKind].BtnRect;
  {$IFNDEF VCL}
    InflateRect(R, 1, 0);
  {$ENDIF}
    InvalidateRect(R, False);
  end;
end;

procedure TcxCustomCalculator.MouseLeave(AControl: TControl);
begin
  inherited;
  if GetPainter.IsButtonHotTrack and Enabled and
     not Dragging and (FActiveButton <> cbNone) then
  begin
    InvalidateButton(FActiveButton);
    FActiveButton := cbNone;
  end;
end;

function TcxCustomCalculator.GetButtonKindChar(Ch : Char) : TcxCalcbuttonKind;
begin
  Result := cbNone;
  case Ch of
  '0'..'9' : Result := TcxCalcbuttonKind(Ord(cbNum0)+Ord(Ch)-Ord('0'));
  '+' : Result := cbAdd;
  '-' : Result := cbSub;
  '*' : Result := cbMul;
  '/' : Result := cbDiv;
  '%' : Result := cbPercent;
  '=' : Result := cbEqual;
  #8 : Result := cbBack;
  '@' : Result := cbSqrt;
  else
    if DecimalSeparator = Ch then Result := cbDecimal;
  end;
end;

function TcxCustomCalculator.GetButtonKindKey(Key: Word; Shift: TShiftState) : TcxCalcbuttonKind;
begin
  Result := cbNone;
  case Key of
    VK_RETURN : Result := cbEqual;
    VK_ESCAPE : Result := cbClear;
{$IFDEF VCL}
    VK_F9 : Result := cbSign;
    VK_DELETE : Result := cbCancel;
    Ord('C'){VK_C} : if not (ssCtrl in Shift) then Result := cbClear;
    Ord('P'){VK_P} : if ssCtrl in Shift then Result := cbMP;
    Ord('L'){VK_L} : if ssCtrl in Shift then Result := cbMC;
    Ord('R'){VK_R} : if ssCtrl in Shift then Result := cbMR
                     else Result := cbRev;
    Ord('M'){VK_M} : if ssCtrl in Shift then Result := cbMS;
{$ELSE}
    Key_Enter : Result := cbEqual;
    Key_F9 : Result := cbSign;
    Key_Delete : Result := cbCancel;
    Key_C : if not (ssCtrl in Shift) then Result := cbClear;
    Key_P : if ssCtrl in Shift then Result := cbMP;
    Key_L : if ssCtrl in Shift then Result := cbMC;
    Key_R : if ssCtrl in Shift then Result := cbMR
                 else Result := cbRev;
    Key_M : if ssCtrl in Shift then Result := cbMS;
{$ENDIF}
  end;
end;

procedure TcxCustomCalculator.CopyToClipboard;
begin
  Clipboard.AsText := GetEditorValue;
end;

procedure TcxCustomCalculator.PasteFromClipboard;
var
  S, S1 : String;
  i : Integer;
begin
{$IFDEF VCL}
  if Clipboard.HasFormat(CF_TEXT) then
{$ELSE}
  if Clipboard.Provides('text/plain') then
{$ENDIF}
    try
      S := Clipboard.AsText;
      S1 := '';
      repeat
        i := Pos(CurrencyString, S);
        if i > 0 then
        begin
          S1 := S1 + Copy(S, 1, i - 1);
          S := Copy(S, i + Length(CurrencyString), MaxInt);
        end
        else
          S1 := S1 + S;
      until i <= 0;
      SetDisplay(StrToFloat(Trim(S1)));
      FStatus := csValid;
    except
      SetDisplay(0.0);
    end;
end;

procedure TcxCustomCalculator.SetAutoFontSize(Value : Boolean);
begin
  if AutoFontSize <> Value then
  begin
    FAutoFontSize := Value;
    Font.OnChange(nil);
  end;
end;

// math routines
procedure TcxCustomCalculator.Error;
begin
  FStatus := csError;
  SetEditorValue(cxGetResourceString(@scxSCalcError));
  if FBeepOnError then {$IFDEF VCL}MessageBeep(0){$ELSE}QControls.Beep{$ENDIF};
  if Assigned(FOnError) then FOnError(Self);
end;

procedure TcxCustomCalculator.CheckFirst;
begin
  if FStatus = csFirst then
  begin
    FStatus := csValid;
    SetEditorValue('0');
  end;
end;

procedure TcxCustomCalculator.Clear;
begin
  FStatus := csFirst;
  SetDisplay(0.0);
  FOperator := cbEqual;
end;

procedure TcxCustomCalculator.ButtonClick(ButtonKind : TcxCalcButtonKind);
var Value : Extended;
begin
  if Assigned(FOnButtonClick) then FOnButtonClick(Self, ButtonKind);
  if (FStatus = csError) and not (ButtonKind in [cbClear, cbCancel]) then
  begin
    Error;
    Exit;
  end;
  if ButtonKind = cbDecimal then
  begin
    CheckFirst;
    if Pos(DecimalSeparator, EditorValue) = 0 then
      SetEditorValue(EditorValue + DecimalSeparator);
    Exit;
  end;
  case ButtonKind of
    cbRev:
      if FStatus in [csValid, csFirst] then
      begin
        FStatus := csFirst;
        if FOperator in OperationButtons then
           FStatus := csValid;
        if GetDisplay = 0 then Error else SetDisplay(1.0 / GetDisplay);
      end;
    cbSqrt:
      if FStatus in [csValid, csFirst] then
      begin
        FStatus := csFirst;
        if FOperator in OperationButtons then
           FStatus := csValid;
        if GetDisplay < 0 then Error else SetDisplay(Sqrt(GetDisplay));
      end;
    cbNum0..cbNum9:
      begin
        CheckFirst;
        if EditorValue = '0' then SetEditorValue('');
        if Length(EditorValue) < Max(2, FPrecision) + Ord(Boolean(Pos('-', EditorValue))) then
          SetEditorValue(EditorValue + Char(Ord('0')+Byte(ButtonKind)-Byte(cbNum0)))
        else
          if FBeepOnError then {$IFDEF VCL}MessageBeep(0){$ELSE}QControls.Beep{$ENDIF};
      end;
    cbBack:
      begin
        CheckFirst;
        if (Length(EditorValue) = 1) or ((Length(EditorValue) = 2) and (EditorValue[1] = '-')) then
          SetEditorValue('0')
        else
          SetEditorValue(System.Copy(EditorValue, 1, Length(EditorValue) - 1));
      end;
    cbSign: SetDisplay(-GetDisplay);
    cbAdd, cbSub, cbMul, cbDiv, cbEqual, cbPercent :
      begin
        if FStatus = csValid then
        begin
          FStatus := csFirst;
          Value := GetDisplay;
          if ButtonKind = cbPercent then
            case FOperator of
              cbAdd, cbSub : Value := FOperand * Value / 100.0;
              cbMul, cbDiv : Value := Value / 100.0;
            end;
          case FOperator of
            cbAdd : SetDisplay(FOperand + Value);
            cbSub : SetDisplay(FOperand - Value);
            cbMul : SetDisplay(FOperand * Value);
            cbDiv : if Value = 0 then Error else SetDisplay(FOperand / Value);
          end;
        end;
        FOperator := ButtonKind;
        FOperand := GetDisplay;
        if (ButtonKind in ResultButtons) and Assigned(FOnResult) then FOnResult(Self);
      end;
    cbClear, cbCancel: Clear;
    cbMP:
      if FStatus in [csValid, csFirst] then
      begin
        FStatus := csFirst;
        FMemory := FMemory + GetDisplay;
        UpdateMemoryButtons;
        InvalidateMemoryButtons;
      end;
    cbMS:
      if FStatus in [csValid, csFirst] then
      begin
        FStatus := csFirst;
        FMemory := GetDisplay;
        UpdateMemoryButtons;
        InvalidateMemoryButtons;
      end;
    cbMR:
      if FStatus in [csValid, csFirst] then
      begin
        FStatus := csFirst;
        CheckFirst;
        SetDisplay(FMemory);
      end;
    cbMC:
      begin
        FMemory := 0.0;
        UpdateMemoryButtons;
        InvalidateMemoryButtons;
      end;
  end;
end;

procedure TcxCustomCalculator.UpdateMemoryButtons;
begin
  // Disable buttons
  if FMemory <> 0.0 then
  begin
    FButtons[cbMC].Grayed := False;
    FButtons[cbMR].Grayed := False;
  end
  else
  begin
    FButtons[cbMC].Grayed := True;
    FButtons[cbMR].Grayed := True;
  end;
end;

procedure TcxCustomCalculator.InvalidateMemoryButtons;
begin
  InvalidateButton(cbMC);
  InvalidateButton(cbMR);
end;

function TcxCustomCalculator.GetDisplay: Extended;
var
  S: string;
begin
  if FStatus = csError then
    Result := 0.0
  else
  begin
    S := Trim(GetEditorValue);
    if S = '' then S := '0';
    Result := StrToFloat(S);
  end;
end;

procedure TcxCustomCalculator.SetDisplay(Value: Extended);
var
  S: string;
begin
  S := FloatToStrF(Value, ffGeneral, Max(2, FPrecision), 0);
  if GetEditorValue <> S then
  begin
    SetEditorValue(S);
    if Assigned(FOnDisplayChange) then FOnDisplayChange(Self);
  end;
end;

function TcxCustomCalculator.GetMemory: Extended;
begin
  Result := FMemory;
end;

procedure TcxCustomCalculator.HidePopup;
begin
  if Assigned(FOnHidePopup) then FOnHidePopup(Self);
end;

{ TcxPopupCalculator }

constructor TcxPopupCalculator.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  IsPopupControl := True;
end;

function TcxPopupCalculator.GetEditorValue: string;
begin
  Result := TcxCustomEditAccess(Edit).Text;
end;

function TcxPopupCalculator.GetPainter: TcxCustomLookAndFeelPainterClass;
begin
  with Edit.Style do
  if LookAndFeel.NativeStyle then
    Result := LookAndFeel.Painter
  else
    case PopupBorderStyle of
      epbsSingle: Result := TcxUltraFlatLookAndFeelPainter;
      epbsFrame3D: Result := TcxStandardLookAndFeelPainter;
      epbsFlat: Result := TcxFlatLookAndFeelPainter;
    else
      Result := LookAndFeel.Painter; {epbsDefault}
    end;
end;

procedure TcxPopupCalculator.KeyDown(var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    HidePopup;
    Key := 0;
  end;
{$IFDEF VCL}
  if (Key = VK_INSERT) then
{$ELSE}
  if (Key = Key_Insert) then
{$ENDIF}
    if (Shift = [ssShift]) then PasteFromClipboard
    else if (Shift = [ssCtrl]) then CopyToClipboard;
{$IFDEF VCL}
  if (Key = VK_F4) or
    ((Key in [VK_UP, VK_DOWN]) and (ssAlt in Shift)) then HidePopup;
{$ELSE}
  if (Key = Key_F4) or
    (((Key = Key_Up) or (Key = Key_Down)) and (ssAlt in Shift)) then HidePopup;
{$ENDIF}
  inherited KeyDown(Key, Shift);
end;

procedure TcxPopupCalculator.KeyPress(var Key: Char);
begin
  inherited KeyPress(Key);
  if (Key = #13) or ((Key = '=') and FEdit.Properties.QuickClose) then
    HidePopup;
{$IFNDEF VCL}
  if Key = #27 then Key := #0;
{$ENDIF}
end;

procedure TcxPopupCalculator.SetEditorValue(const Value: string);
begin
  with TcxCustomEditAccess(Edit) do
    if DoEditing then
    begin
      Text := Value;
      TcxCustomEditAccess(Edit).ModifiedAfterEnter := True;
    end;
end;

{ TcxCustomCalcEditProperties }

constructor TcxCustomCalcEditProperties.Create(AOwner: TPersistent);
begin
  inherited Create(AOwner);
  FBeepOnError := True;
  FPrecision := cxDefCalcPrecision;
  MaxLength := cxDefCalcPrecision + 2;
  FQuickClose := False;
  PopupSizeable := False;
  ImmediateDropDown := False;
  ValidateOnEnter := True;
  cxFormatController.AddListener(Self);
end;

destructor TcxCustomCalcEditProperties.Destroy;
begin
  cxFormatController.RemoveListener(Self);
  inherited Destroy;
end;

procedure TcxCustomCalcEditProperties.SetBeepOnError(const Value: Boolean);
begin
  if Value <> FBeepOnError then
  begin
    FBeepOnError := Value;
    Changed;
  end;
end;

procedure TcxCustomCalcEditProperties.SetPrecision(const Value: Byte);
begin
  if Value <> FPrecision then
  begin
    FPrecision := Value;
    MaxLength := Precision + 2;
    Changed;
  end;
end;

procedure TcxCustomCalcEditProperties.SetQuickClose(const Value: Boolean);
begin
  if Value <> FQuickClose then
  begin
    FQuickClose := Value;
    Changed;
  end;
end;

procedure TcxCustomCalcEditProperties.FormatChanged;
begin
  FFormatChanging := True;
  try
    Changed;
  finally
    FFormatChanging := False;
  end;
end;

function TcxCustomCalcEditProperties.GetAlwaysPostEditValue: Boolean;
begin
  Result := True;
end;

function TcxCustomCalcEditProperties.StrToFloatEx(S: string;
  var Value: Double): Boolean;
const
  MinDouble = 5.0e-324;
  MaxDouble = 1.7e+308;
var
  I: Integer;
  E: Extended;
begin
  // Ignore Thousand Separators
  for I := Length(S) downto 1 do
    if S[I] = ThousandSeparator then
      Delete(S, I, 1);
  if not TextToFloat(PChar(S), E, fvExtended) or
    ((E <> 0) and ((Abs(E) < MinDouble) or (Abs(E) > MaxDouble))) then
  begin
    Value := 0;
    Result := False;
  end
  else
    begin
      Value := E;
      Result := True;
    end;
end;

procedure TcxCustomCalcEditProperties.Assign(Source: TPersistent);
begin
  if Source is TcxCustomCalcEditProperties then
  begin
    BeginUpdate;
    try
      inherited Assign(Source);
      with TcxCustomCalcEditProperties(Source) do
      begin
        Self.BeepOnError := BeepOnError;
        Self.Precision := Precision;
        Self.QuickClose := QuickClose;
      end;
    finally
      EndUpdate
    end
  end  
  else
    inherited Assign(Source);
end;

class function TcxCustomCalcEditProperties.GetContainerClass: TcxContainerClass;
begin
  Result := TcxCustomCalcEdit;
end;

function TcxCustomCalcEditProperties.GetEditValueSource(AEditFocused: Boolean): TcxDataEditValueSource;
begin
  if AEditFocused then
    Result := evsValue
  else
    Result := evsText;
end;

function TcxCustomCalcEditProperties.IsDisplayValueValid(
  var DisplayValue: TcxEditValue; AEditFocused: Boolean): Boolean;
begin
  Result := True;
end;

procedure TcxCustomCalcEditProperties.PrepareDisplayValue(
  const AEditValue: TcxEditValue; var DisplayValue: TcxEditValue;
  AEditFocused: Boolean);
begin
  if VarIsNull(AEditValue) or (VarIsStr(AEditValue) and (AEditValue = '')) then
    DisplayValue := ''
  else
    try
      if AEditFocused then
        DisplayValue := FloatToStr(AEditValue)
      else
        inherited PrepareDisplayValue(AEditValue, DisplayValue, AEditFocused);
    except
      on EVariantError do
    end;
end;

procedure TcxCustomCalcEditProperties.ValidateDisplayValue(
  var ADisplayValue: TcxEditValue; var AErrorText: TCaption;
  var Error: Boolean; AEdit: TcxCustomEdit);
begin
  Error := False;
  inherited;
end;

{ TcxCustomCalcEdit }

constructor TcxCustomCalcEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCalculator := TcxPopupCalculator.Create(Self);
  with FCalculator do
  begin
    Parent := PopupWindow;
    Edit := Self;
    AutoFontSize := False;
    OnHidePopup := HideCalculator;
  end;
  Properties.PopupControl := FCalculator;
  cxFormatController.AddListener(Self);
end;

destructor TcxCustomCalcEdit.Destroy;
begin
  cxFormatController.RemoveListener(Self);
  FreeAndNil(FCalculator);
  inherited Destroy;
end;

function TcxCustomCalcEdit.GetProperties: TcxCalcEditProperties;
begin
  Result := TcxCalcEditProperties(InternalGetProperties);
end;

function TcxCustomCalcEdit.GetValue: Extended;
begin
  if VarIsNull(EditValue) or (VarIsStr(EditValue) and (EditValue = '')) then
    Result := 0
  else
    Result := EditValue;
end;

procedure TcxCustomCalcEdit.HideCalculator(Sender: TObject);
begin
  PopupWindow.CloseUp;
end;

procedure TcxCustomCalcEdit.SetProperties(Value: TcxCalcEditProperties);
begin
  FProperties.Assign(Value);
end;

procedure TcxCustomCalcEdit.SetValue(const Value: Extended);
begin
  EditValue := Value;
end;

procedure TcxCustomCalcEdit.FormatChanged;
begin
  TcxEditDataBindingAccess(DataBinding).UpdateDisplayValue;
end;

function TcxCustomCalcEdit.CanDropDown: Boolean;
begin
  Result := not Properties.ReadOnly;
end;

procedure TcxCustomCalcEdit.CreatePopupWindow;
begin
  inherited;
  PopupWindow.ModalMode := False;
end;

procedure TcxCustomCalcEdit.DoEnter;
begin
  SynchronizeDisplayValue;
  inherited;
end;

procedure TcxCustomCalcEdit.DoExit;
begin
  inherited;
  TcxEditDataBindingAccess(DataBinding).UpdateDisplayValue;
end;

procedure TcxCustomCalcEdit.DoInitPopup;
begin
  inherited DoInitPopup;
  Properties.PopupControl := FCalculator;
end;

procedure TcxCustomCalcEdit.InitializePopupWindow;
begin
  inherited InitializePopupWindow;
  with Calculator do
  begin
    HandleNeeded;
    Font.Assign(Self.Style.Font);
    FontChanged;
    Resize;
  end;
end;

function TcxCustomCalcEdit.IsValidChar(Key: Char): Boolean;

  function NumDigits(const S: string): Byte;
  var
    I: Integer;
  begin
    Result := 0;
    for I := 1 to Length(S) do
      if S[I] in ['0'..'9'] then Inc(Result);
  end;

var
  S: string;
  V: Double;
  StartPos, StopPos, DecPos: Integer;
  ValidChars: set of Char;
begin
  Result := False;
  ValidChars := [DecimalSeparator, '-', '+', '0'..'9', 'e', 'E'];
  if not (Key in ValidChars) then
    Exit;
  S := Text;
  StartPos := SelStart;
  StopPos := SelStart + SelLength;
  System.Delete(S, SelStart + 1, StopPos - StartPos);
  if (Key = '-') and (S = '') then
  begin
    Result := True;
    Exit;
  end;
  System.Insert(Key, S, StartPos + 1);
  DecPos := Pos(DecimalSeparator, S);
  if (DecPos > 0) then
  begin
    StartPos := Pos('E', UpperCase(S));
    if (StartPos > DecPos) then
      DecPos := StartPos - DecPos - 1
    else
      DecPos := Length(S) - DecPos;
    if DecPos > Properties.Precision then Exit;
  end;
  Result := (NumDigits(S) <= Properties.Precision) and
    Properties.StrToFloatEx(S, V);
end;

procedure TcxCustomCalcEdit.KeyPress(var Key: Char);
begin
  if (Key in ['.', ',']) then Key := DecimalSeparator;
  if (Key in [#32 .. #255]) and not IsValidChar(Key) then
  begin
    Key := #0;
    if Properties.BeepOnError then Beep;
  end;
  if Key <> #0 then inherited KeyPress(Key);
end;

procedure TcxCustomCalcEdit.PopupWindowClosed(Sender: TObject);
begin
  if Text = cxGetResourceString(@scxSCalcError) then EditValue := 0;
  if Properties.AutoSelect then SelectAll else SelStart := Length(Text);
  inherited PopupWindowClosed(Sender);
end;

procedure TcxCustomCalcEdit.PropertiesChanged(Sender: TObject);
begin
  if (Sender <> nil) and TcxCustomCalcEditProperties(Properties).FFormatChanging then
    Exit;
  inherited PropertiesChanged(Sender);
  if not PropertiesChangeLocked then
  begin
    FCalculator.BeepOnError := Properties.BeepOnError;
    FCalculator.Precision := Properties.Precision;
    Properties.FChangedLocked := True;
    Properties.PopupControl := FCalculator;
    Properties.FChangedLocked := False;
  end;
end;

class function TcxCustomCalcEdit.GetPropertiesClass: TcxCustomEditPropertiesClass; 
begin
  Result := TcxCalcEditProperties;
end;

procedure TcxCustomCalcEdit.PasteFromClipboard;
begin
  if DoEditing then
    Calculator.PasteFromClipboard;
end;

procedure TcxCustomCalcEdit.PrepareEditValue(
  const ADisplayValue: TcxEditValue; out EditValue: TcxEditValue; AEditFocused: Boolean);
begin
  if Trim(ADisplayValue) = '' then EditValue := Null
  else
    try
      EditValue := StrToFloat(ADisplayValue)
    except
      on EConvertError do
    end
end;

initialization
  GetRegisteredEditProperties.Register(TcxCalcEditProperties, scxSEditRepositoryCalcItem);

end.
