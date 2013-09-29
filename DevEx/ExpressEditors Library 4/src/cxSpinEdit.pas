
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

unit cxSpinEdit;

{$I cxEdVer.inc}

interface

uses
{$IFDEF WIN32}
  Windows,
{$ENDIF}
{$IFNDEF VCL}
  Types, Qt, QTypes,
{$ENDIF}
{$IFDEF DELPHI6}
  Variants,
{$ENDIF}
  Classes, Controls, ExtCtrls, Forms, Graphics, SysUtils, cxClasses, cxContainer,
  cxControls, cxDataUtils, cxEdit, cxGraphics, cxMaskEdit, cxTextEdit, cxVariants,
  cxLookAndFeelPainters;

const
  cxSpinBackwardButtonIndex = 0;
  cxSpinForwardButtonIndex = 1;
  cxSpinFastBackwardButtonIndex = 2;
  cxSpinFastForwardButtonIndex = 3;

type
  TcxSpinEditButtonsPosition = (sbpHorzLeftRight, sbpHorzRight, sbpVert);
  TcxSpinEditButton = (sebBackward, sebForward, sebFastBackward, sebFastForward);

  { TcxSpinEditViewInfo }

  TcxSpinEditViewInfo = class(TcxCustomTextEditViewInfo)
  protected
    procedure InternalPaint(ACanvas: TcxCanvas); override;
  public
    ArrowSize: Integer;
    ButtonsPosition: TcxSpinEditButtonsPosition;
{$IFDEF VCL}
    DelimiterLine: array[0..1] of TPoint;
{$ENDIF}
    procedure DrawButtonBorder(ACanvas: TcxCanvas; AButtonVisibleIndex: Integer;
      AButtonStyle: TcxEditButtonStyle; const ARect: TRect); override;
    procedure DrawButtonContent(ACanvas: TcxCanvas; AButtonVisibleIndex: Integer;
      const AContentRect: TRect; APenColor: TColor; ABrushColor: TColor); override;
  end;

  { TcxSpinEditViewData }

  TcxSpinEditPressedState = (epsNone, epsDown, epsUp, epsFastDown, epsFastUp);
  TcxCustomSpinEditProperties = class;

  TcxSpinEditViewData = class(TcxCustomTextEditViewData)
  private
    function GetProperties: TcxCustomSpinEditProperties;
    procedure SetProperties(Value: TcxCustomSpinEditProperties);
  protected
    function CanPressButton(AViewInfo: TcxCustomEditViewInfo; AButtonVisibleIndex: Integer):
      Boolean; override;
    function IsButtonPressed(AViewInfo: TcxCustomEditViewInfo; AButtonVisibleIndex:
      Integer): Boolean; override;
{$IFDEF VCL}
    procedure CalculateButtonNativeInfo(AButtonViewInfo: TcxEditButtonViewInfo); override;
{$ENDIF}
  public
    PressedState: TcxSpinEditPressedState;
    procedure Calculate(ACanvas: TcxCanvas; const ABounds: TRect; const P: TPoint;
      Button: TcxMouseButton; Shift: TShiftState; AViewInfo: TcxCustomEditViewInfo;
      AIsMouseEvent: Boolean); override;
    procedure CalculateButtonBounds(ACanvas: TcxCanvas; AViewInfo: TcxCustomEditViewInfo;
      AButtonVisibleIndex: Integer; var ButtonsRect: TRect); override;
    procedure CalculateButtonViewInfo(ACanvas: TcxCanvas; AViewInfo: TcxCustomEditViewInfo;
      AButtonVisibleIndex: Integer; var ButtonsRect: TRect); override;
    property Properties: TcxCustomSpinEditProperties read GetProperties write SetProperties;
  end;

  { TcxSpinEditButtons }

  TcxSpinEditButtons = class(TPersistent)
  private
    FPosition: TcxSpinEditButtonsPosition;
    FProperties: TcxCustomSpinEditProperties;
    FShowFastButtons: Boolean;
    procedure SetPosition(Value: TcxSpinEditButtonsPosition);
    procedure SetShowFastButtons(Value: Boolean);
  protected
    procedure Changed;
    property Properties: TcxCustomSpinEditProperties read FProperties;
  public
    constructor Create(AProperties: TcxCustomSpinEditProperties); virtual;
    procedure Assign(Source: TPersistent); override;
  published
    property Position: TcxSpinEditButtonsPosition read FPosition
      write SetPosition default sbpVert;
    property ShowFastButtons: Boolean read FShowFastButtons
      write SetShowFastButtons default False;
  end;

  { TcxSpinEditPropertiesValues }

  TcxSpinEditPropertiesValues = class(TcxTextEditPropertiesValues)
  public
    ValueType: Boolean;
    procedure Assign(Source: TPersistent); override;
    procedure Reset; override;
  end;

  { TcxCustomSpinEditProperties }

  TcxSpinEditValueType = (vtInt, vtFloat);

  TcxCustomSpinEdit = class;

  TcxCustomSpinEditProperties = class(TcxCustomMaskEditProperties)
  private
    FSpinButtons: TcxSpinEditButtons;
    FCanEdit: Boolean;
    FIncrement, FLargeIncrement: Double;
    FUseCtrlIncrement: Boolean;
    FValueType: TcxSpinEditValueType;
    function GetAssignedValues: TcxSpinEditPropertiesValues;
    function GetMin: Double;
    function GetValueType: TcxSpinEditValueType;
    function IsIncrementStored: Boolean;
    function IsLargeIncrementStored: Boolean;
    function IsValueTypeStored: Boolean;
    procedure SetSpinButtons(Value: TcxSpinEditButtons);
    procedure SetValueType(Value: TcxSpinEditValueType);
  protected
    procedure Changed; override;
    function DefaultFocusedDisplayValue: TcxEditValue; override;
    class function GetAssignedValuesClass: TcxCustomEditPropertiesValuesClass; override;
    class function GetViewDataClass: TcxCustomEditViewDataClass; override;
    function IsEditValueNumeric: Boolean; override;
    function IsDisplayValueNumeric: Boolean; virtual;
    function PrepareValue(const AValue: TcxEditValue): Double;
    function PreserveSelection: Boolean; virtual;
    procedure SetVariantType(var Value: TcxEditValue);
    property AssignedValues: TcxSpinEditPropertiesValues read GetAssignedValues;
    property CanEdit: Boolean read FCanEdit write FCanEdit default True;
    property Increment: Double read FIncrement write FIncrement stored IsIncrementStored;
    property LargeIncrement: Double read FLargeIncrement write FLargeIncrement
      stored IsLargeIncrementStored;
    property SpinButtons: TcxSpinEditButtons read FSpinButtons write SetSpinButtons;
    property UseCtrlIncrement: Boolean read FUseCtrlIncrement write FUseCtrlIncrement default False;
    property ValueType: TcxSpinEditValueType read GetValueType write SetValueType stored IsValueTypeStored;
  public
    constructor Create(AOwner: TPersistent); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    function CreateViewData(AStyle: TcxContainerStyle; AIsInplace: Boolean): TcxCustomEditViewData; override;
    class function GetContainerClass: TcxContainerClass; override;
    function GetEditValueSource(AEditFocused: Boolean): TcxDataEditValueSource; override;
    class function GetViewInfoClass: TcxContainerViewInfoClass; override;
    function IsDisplayValueValid(var DisplayValue: TcxEditValue; AEditFocused: Boolean): Boolean; override;
    function IsEditValueValid(var EditValue: TcxEditValue; AEditFocused: Boolean): Boolean; override;
    procedure PrepareDisplayValue(const AEditValue: TcxEditValue; var DisplayValue: TcxEditValue;
      AEditFocused: Boolean); override;
    procedure ValidateDisplayValue(var DisplayValue: TcxEditValue; var ErrorText: TCaption;
      var Error: Boolean; AEdit: TcxCustomEdit); override;
  end;

  { TcxSpinEditProperties }

  TcxSpinEditProperties = class(TcxCustomSpinEditProperties)
  published
    property Alignment;
    property AutoSelect;
    property BeepOnError;
    property CanEdit;
    property HideSelection;
    property ImmediatePost;
    property Increment;
    property LargeIncrement;
    property MaxValue;
    property MinValue;
    property ReadOnly;
    property SpinButtons;
    property UseCtrlIncrement;
    property UseLeftAlignmentOnEditing;
    property ValueType;
    property OnChange;
    property OnEditValueChanged;
    property OnValidate;
  end;

  { TcxCustomSpinEdit }

  TcxCustomSpinEdit = class(TcxCustomMaskEdit)
  private
    FPressedState: TcxSpinEditPressedState;
    FTimer: TTimer;
    function GetProperties: TcxSpinEditProperties;
    procedure HandleTimer(Sender: TObject);
    function IsValueStored: Boolean;
    procedure SetPressedState(Value: TcxSpinEditPressedState);
    procedure SetProperties(Value: TcxSpinEditProperties);
    procedure StopTracking;
  protected
    procedure CheckEditorValueBounds; override;
    procedure DblClick; override;
    procedure DoButtonDown(AButtonVisibleIndex: Integer); override;
    procedure DoEditKeyDown(var Key: Word; Shift: TShiftState); override;
    procedure DoEditKeyPress(var Key: Char); override;
    procedure DoEditKeyUp(var Key: Word; Shift: TShiftState); override;
    function DoMouseWheelDown(Shift: TShiftState; {$IFNDEF VCL}const{$ENDIF} MousePos:
      TPoint): Boolean; override;
    function DoMouseWheelUp(Shift: TShiftState; {$IFNDEF VCL}const{$ENDIF} MousePos:
      TPoint): Boolean; override;
    procedure FocusChanged; override;
    function IsValidChar(AChar: Char): Boolean; override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure PropertiesChanged(Sender: TObject); override;
    function RefreshContainer(const P: TPoint; Button: TcxMouseButton; Shift: TShiftState;
      AIsMouseEvent: Boolean): Boolean; override;
    function ExtendValueUpToBound: Boolean; virtual;
    function GetIncrement(AButton: TcxSpinEditButton): Double; virtual;
    function GetValue: Variant; virtual;
    procedure SetValue(const Value: Variant); virtual;
    property PressedState: TcxSpinEditPressedState read FPressedState write SetPressedState;
    property Properties: TcxSpinEditProperties read GetProperties write SetProperties;
    property Value: Variant read GetValue write SetValue stored IsValueStored;
  public
    constructor Create(AOwner: TComponent); override;
    procedure CutToClipboard; override;
    class function GetPropertiesClass: TcxCustomEditPropertiesClass; override;
    class function GetNotPublishedStyleValues: TcxEditStyleValues; override;
    function Increment(AButton: TcxSpinEditButton): Boolean; virtual;
    procedure PasteFromClipboard; override;
    procedure PrepareEditValue(const ADisplayValue: TcxEditValue;
      out EditValue: TcxEditValue; AEditFocused: Boolean); override;
  end;

  { TcxSpinEdit }

  TcxSpinEdit = class(TcxCustomSpinEdit)
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
    property Value;
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

implementation

uses
{$IFDEF VCL}
  dxThemeConsts, dxThemeManager,
{$ENDIF}
  cxEditConsts, cxEditUtils;

const
  cxSpinEditTimerInitialInterval = 400;
  cxSpinEditTimerInterval = 100;

type
  TcxEditDataBindingAccess = class(TcxEditDataBinding);

{ TcxSpinEditViewInfo }

procedure TcxSpinEditViewInfo.DrawButtonBorder(ACanvas: TcxCanvas; AButtonVisibleIndex: Integer;
  AButtonStyle: TcxEditButtonStyle; const ARect: TRect);
begin
  DrawSpinEditButtonBorder(ACanvas, Self, AButtonVisibleIndex, AButtonStyle, ARect);
end;

procedure TcxSpinEditViewInfo.DrawButtonContent(ACanvas: TcxCanvas; AButtonVisibleIndex: Integer;
  const AContentRect: TRect; APenColor: TColor; ABrushColor: TColor);
begin
  DrawSpinEditButtonContent(ACanvas, Self, AButtonVisibleIndex, AContentRect, APenColor,
    ABrushColor);
end;

procedure TcxSpinEditViewInfo.InternalPaint(ACanvas: TcxCanvas);
begin
  DrawSpinEdit(ACanvas, Self);
end;

{ TcxSpinEditViewData }

procedure TcxSpinEditViewData.Calculate(ACanvas: TcxCanvas; const ABounds: TRect;
  const P: TPoint; Button: TcxMouseButton; Shift: TShiftState; AViewInfo: TcxCustomEditViewInfo;
  AIsMouseEvent: Boolean);
begin
  inherited Calculate(ACanvas, ABounds, P, Button, Shift, AViewInfo, AIsMouseEvent);
{$IFDEF VCL}
  CalculateSpinEditViewInfo(Self, TcxSpinEditViewInfo(AViewInfo));
{$ENDIF}
end;

procedure TcxSpinEditViewData.CalculateButtonBounds(ACanvas: TcxCanvas;
  AViewInfo: TcxCustomEditViewInfo; AButtonVisibleIndex: Integer;
  var ButtonsRect: TRect);
var
  AButtonWidth, ADefaultButtonHeight, AFastButtonWidth: Integer;
  ANativeStyle: Boolean;
  ASpinButtonsPosition: TcxSpinEditButtonsPosition;
  Y: Integer;
{$IFDEF VCL}
  ASpinEditViewInfo: TcxSpinEditViewInfo;
{$ENDIF}                                       

  procedure CalculateButtonMetrics;
  var
    AClientExtent: TRect;
    AEditButtonsExtent: TRect;
  begin
    ACanvas.Font := Style.Font;
    AButtonWidth := CalculateEditDefaultButtonWidth(ACanvas, AViewInfo.ButtonsInfo[AButtonVisibleIndex]);

    AClientExtent := GetClientExtent(AViewInfo);
    AEditButtonsExtent := GetEditButtonsExtent(ACanvas, Self);
    if ANativeStyle then
    begin
      ADefaultButtonHeight := ACanvas.TextHeight('Zg') +
        GetTextEditContentSizeCorrection(Self).cy + (AClientExtent.Top + AClientExtent.Bottom) -
        (AEditButtonsExtent.Top + AEditButtonsExtent.Bottom) - 1;
      ADefaultButtonHeight := ADefaultButtonHeight div 2 + Integer(Odd(ADefaultButtonHeight));
    end
    else
    begin
      TcxSpinEditViewInfo(AViewInfo).ArrowSize := GetArrowSize(Size(AButtonWidth + 2,
        (ButtonsRect.Bottom - ButtonsRect.Top) div 2 + 2), adUp).cy;
      ADefaultButtonHeight :=(TcxSpinEditViewInfo(AViewInfo).ArrowSize * 2 - 1) * 2 + 1 - 2;
    end;

    AFastButtonWidth := ADefaultButtonHeight * 3;
    AFastButtonWidth := AFastButtonWidth div 2 + Integer(Odd(AFastButtonWidth));
  end;

{$IFDEF VCL}
  procedure SetButtonsNativePart;
  begin
    if ASpinButtonsPosition = sbpVert then
    begin
      AViewInfo.ButtonsInfo[cxSpinBackwardButtonIndex].Data.NativePart := SPNP_DOWN;
      AViewInfo.ButtonsInfo[cxSpinForwardButtonIndex].Data.NativePart := SPNP_UP;
    end
    else
    begin
      AViewInfo.ButtonsInfo[cxSpinBackwardButtonIndex].Data.NativePart := SPNP_DOWNHORZ;
      AViewInfo.ButtonsInfo[cxSpinForwardButtonIndex].Data.NativePart := SPNP_UPHORZ;
    end;
    if Length(AViewInfo.ButtonsInfo) > 2 then
    begin
      AViewInfo.ButtonsInfo[cxSpinFastBackwardButtonIndex].Data.NativePart := SPNP_DOWNHORZ;
      AViewInfo.ButtonsInfo[cxSpinFastForwardButtonIndex].Data.NativePart := SPNP_UPHORZ;
    end;
  end;
{$ENDIF}

  procedure SetButtonsVisibleBounds;
  var
    I: Integer;
  begin
    for I := 0 to Length(AViewInfo.ButtonsInfo) - 1 do
      with AViewInfo.ButtonsInfo[I] do
      begin
        VisibleBounds := Bounds;
//        if VisibleBounds.Left < ButtonsRect.Left then
//          VisibleBounds.Left := ButtonsRect.Left;
//        if VisibleBounds.Right < ButtonsRect.Right then
//          VisibleBounds.Right := ButtonsRect.Right;
      end;
  end;

var
  AButtonStyle: TcxEditButtonStyle;
  APrevButtonsRect: TRect;
  AShowFastButtons: Boolean;
begin
  if AButtonVisibleIndex <> ButtonVisibleCount - 1 then
    Exit;
  APrevButtonsRect := ButtonsRect;
  AShowFastButtons := Properties.SpinButtons.ShowFastButtons;
  ASpinButtonsPosition := Properties.SpinButtons.Position;
{$IFDEF VCL}
  ANativeStyle := AreVisualStylesMustBeUsed(AViewInfo.NativeStyle, totSpin);
  ASpinEditViewInfo := TcxSpinEditViewInfo(AViewInfo);
{$ELSE}
  ANativeStyle := False;
{$ENDIF}
  TcxSpinEditViewInfo(AViewInfo).ButtonsPosition := Properties.SpinButtons.Position;

  CalculateButtonMetrics;
  AButtonStyle := AViewInfo.ButtonsInfo[0].Data.Style;
  if AShowFastButtons then
    with AViewInfo.ButtonsInfo[cxSpinFastForwardButtonIndex] do
    begin
      Bounds := Rect(ButtonsRect.Right - AFastButtonWidth, ButtonsRect.Top,
        ButtonsRect.Right, ButtonsRect.Bottom);
      ButtonsRect.Right := Bounds.Left;
    end;

  if ASpinButtonsPosition = sbpVert then
  begin
    with AViewInfo.ButtonsInfo[cxSpinForwardButtonIndex] do
    begin
      Bounds := Rect(ButtonsRect.Right - AButtonWidth, ButtonsRect.Top,
        ButtonsRect.Right, ButtonsRect.Top + (ButtonsRect.Bottom -
        ButtonsRect.Top - Integer(ANativeStyle)) div 2);
      Y := Bounds.Bottom + Integer(ANativeStyle);
    end;
    with AViewInfo.ButtonsInfo[cxSpinBackwardButtonIndex] do
    begin
      Bounds := Rect(ButtonsRect.Right - AButtonWidth, Y,
        ButtonsRect.Right, ButtonsRect.Bottom);
      ButtonsRect.Right := Bounds.Left;
    end;
    if not ANativeStyle and (AButtonStyle = btsHotFlat) then
      if Y - ButtonsRect.Top < ButtonsRect.Bottom - Y then
      begin
        Inc(AViewInfo.ButtonsInfo[cxSpinForwardButtonIndex].Bounds.Bottom);
        Inc(AViewInfo.ButtonsInfo[cxSpinBackwardButtonIndex].Bounds.Top);
      end;
  end
  else
  begin
    with AViewInfo.ButtonsInfo[cxSpinForwardButtonIndex] do
    begin
      Bounds := Rect(ButtonsRect.Right - ADefaultButtonHeight, ButtonsRect.Top,
        ButtonsRect.Right, ButtonsRect.Bottom);
      ButtonsRect.Right := Bounds.Left;
      if ANativeStyle then
        Dec(ButtonsRect.Right)
      else
        if (ASpinButtonsPosition = sbpHorzLeftRight) and (AButtonStyle = btsHotFlat) then
        begin
          Dec(Bounds.Left);
          Dec(ButtonsRect.Right);
        end;
    end;
  end;

  if ASpinButtonsPosition = sbpHorzLeftRight then
  begin
    if AShowFastButtons then
      with AViewInfo.ButtonsInfo[cxSpinFastBackwardButtonIndex] do
      begin
        Bounds := Rect(ButtonsRect.Left, ButtonsRect.Top,
          ButtonsRect.Left + AFastButtonWidth, ButtonsRect.Bottom);
        ButtonsRect.Left := Bounds.Right;
      end;
    with AViewInfo.ButtonsInfo[cxSpinBackwardButtonIndex] do
    begin
      Bounds := Rect(ButtonsRect.Left, ButtonsRect.Top,
        ButtonsRect.Left + ADefaultButtonHeight, ButtonsRect.Bottom);
      if not ANativeStyle and (AButtonStyle = btsHotFlat) then
      begin
        Inc(Bounds.Right);
        Inc(ButtonsRect.Left);
      end;
    end;
  end
  else
  begin
    if ASpinButtonsPosition = sbpHorzRight then
    begin
      with AViewInfo.ButtonsInfo[cxSpinBackwardButtonIndex] do
      begin
        Bounds := Rect(ButtonsRect.Right - ADefaultButtonHeight, ButtonsRect.Top,
          ButtonsRect.Right, ButtonsRect.Bottom);
        ButtonsRect.Right := Bounds.Left;
        if not AShowFastButtons and not ANativeStyle and (AButtonStyle = btsHotFlat) then
        begin
          Dec(Bounds.Left);
          Dec(ButtonsRect.Right);
        end;
      end;
    end;
    if AShowFastButtons then
      with AViewInfo.ButtonsInfo[cxSpinFastBackwardButtonIndex] do
      begin
        Bounds := Rect(ButtonsRect.Right - AFastButtonWidth, ButtonsRect.Top,
          ButtonsRect.Right, ButtonsRect.Bottom);
        if not ANativeStyle and (AButtonStyle = btsHotFlat) then
        begin
          Dec(Bounds.Left);
          Dec(ButtonsRect.Right);
        end;
      end;
  end;

{$IFDEF VCL}
  if ANativeStyle then
  begin
    case Properties.SpinButtons.Position of
      sbpHorzLeftRight:
        with ASpinEditViewInfo do
          FillChar(DelimiterLine, SizeOf(DelimiterLine), 0);
      sbpHorzRight:
        with AViewInfo.ButtonsInfo[cxSpinBackwardButtonIndex].Bounds do
        begin
          ASpinEditViewInfo.DelimiterLine[0] := Point(Right, Top);
          ASpinEditViewInfo.DelimiterLine[1] := Point(Right, Bottom - 1);
        end;
      sbpVert:
        with AViewInfo.ButtonsInfo[cxSpinForwardButtonIndex].Bounds do
        begin
          ASpinEditViewInfo.DelimiterLine[0] := Point(Left, Bottom);
          ASpinEditViewInfo.DelimiterLine[1] := Point(Right - 1, Bottom);
        end;
    end;
    SetButtonsNativePart;
  end;
{$ENDIF}
  ButtonsRect := APrevButtonsRect;
  SetButtonsVisibleBounds;
end;

procedure TcxSpinEditViewData.CalculateButtonViewInfo(ACanvas: TcxCanvas;
  AViewInfo: TcxCustomEditViewInfo; AButtonVisibleIndex: Integer;
  var ButtonsRect: TRect);
begin
  inherited CalculateButtonViewInfo(ACanvas, AViewInfo, AButtonVisibleIndex,
    ButtonsRect);
  if Properties.SpinButtons.Position = sbpHorzLeftRight then
  begin
    AViewInfo.ButtonsInfo[cxSpinBackwardButtonIndex].Data.LeftAlignment := True;
    if Length(AViewInfo.ButtonsInfo) > 2 then
      AViewInfo.ButtonsInfo[cxSpinFastBackwardButtonIndex].Data.LeftAlignment := True;
  end;
end;

function TcxSpinEditViewData.CanPressButton(AViewInfo: TcxCustomEditViewInfo;
  AButtonVisibleIndex: Integer): Boolean;
begin
  if Edit <> nil then
    Result := TcxCustomSpinEdit(Edit).PressedState = epsNone
  else
    Result := True;
end;

function TcxSpinEditViewData.IsButtonPressed(AViewInfo: TcxCustomEditViewInfo;
  AButtonVisibleIndex: Integer): Boolean;
var
  APressedState: TcxSpinEditPressedState;
begin
  if Edit = nil then
    APressedState := epsNone
  else
    APressedState := TcxCustomSpinEdit(Edit).PressedState;
  Result := (AButtonVisibleIndex + 1) = Integer(APressedState)
//  Result := (AButtonVisibleIndex = cxSpinForwardButtonIndex) and (APressedState = epsUp) or
//    (AButtonVisibleIndex = cxSpinBackwardButtonIndex) and (APressedState = epsDown);
end;

{$IFDEF VCL}
procedure TcxSpinEditViewData.CalculateButtonNativeInfo(AButtonViewInfo: TcxEditButtonViewInfo);
begin
end;
{$ENDIF}

function TcxSpinEditViewData.GetProperties: TcxCustomSpinEditProperties;
begin
  Result := TcxCustomSpinEditProperties(FProperties);
end;

procedure TcxSpinEditViewData.SetProperties(Value: TcxCustomSpinEditProperties);
begin
  FProperties.Assign(Value);
end;

{ TcxSpinEditButtons }

constructor TcxSpinEditButtons.Create(AProperties: TcxCustomSpinEditProperties);
begin
  inherited Create;
  FPosition := sbpVert;
  FProperties := AProperties;
end;

procedure TcxSpinEditButtons.Assign(Source: TPersistent);
begin
  if Source is TcxSpinEditButtons then
  begin
    Properties.BeginUpdate;
    try
      with TcxSpinEditButtons(Source) do
      begin
        Self.Position := Position;
        Self.ShowFastButtons := ShowFastButtons;
      end;
    finally
      Properties.EndUpdate;
    end;
  end
  else
    inherited Assign(Source);
end;

procedure TcxSpinEditButtons.Changed;
begin
  Properties.Changed;
end;

procedure TcxSpinEditButtons.SetPosition(Value: TcxSpinEditButtonsPosition);
begin
  if Value <> FPosition then
  begin
    FPosition := Value;
    Changed;
  end;
end;

procedure TcxSpinEditButtons.SetShowFastButtons(Value: Boolean);
begin
  if Value <> FShowFastButtons then
  begin
    FShowFastButtons := Value;
    Changed;
  end;
end;

{ TcxSpinEditPropertiesValues }

procedure TcxSpinEditPropertiesValues.Assign(Source: TPersistent);
begin
  if Source is TcxSpinEditPropertiesValues then
    with Source as TcxSpinEditPropertiesValues do
      Self.ValueType := ValueType;
  inherited Assign(Source);
end;

procedure TcxSpinEditPropertiesValues.Reset;
begin
  inherited Reset;
  ValueType := False;
end;

{ TcxCustomSpinEditProperties }

constructor TcxCustomSpinEditProperties.Create(AOwner: TPersistent);
begin
  inherited Create(AOwner);
  Buttons.Add;
  Buttons.Add;
  FSpinButtons := TcxSpinEditButtons.Create(Self);
  FCanEdit := True;
  FIncrement := 1.0;
  FLargeIncrement := 10.0;
end;

destructor TcxCustomSpinEditProperties.Destroy;
begin
  FreeAndNil(FSpinButtons);
  inherited Destroy;
end;

procedure TcxCustomSpinEditProperties.Assign(Source: TPersistent);
begin
  if Source is TcxCustomSpinEditProperties then
  begin
    BeginUpdate;
    try
      with Source as TcxCustomSpinEditProperties do
      begin
        Self.FIDefaultValuesProvider := FIDefaultValuesProvider;
        Self.AssignedValues.ValueType := False;
        if AssignedValues.ValueType then
          Self.ValueType := ValueType;
      end;
      inherited Assign(Source);
      with Source as TcxCustomSpinEditProperties do
      begin
        Self.CanEdit := CanEdit;
        Self.Increment := Increment;
        Self.LargeIncrement := LargeIncrement;
        Self.SpinButtons := SpinButtons;
        Self.UseCtrlIncrement := UseCtrlIncrement;
      end;
    finally
      EndUpdate;
    end
  end
  else
    inherited Assign(Source);
end;

function TcxCustomSpinEditProperties.CreateViewData(AStyle: TcxContainerStyle;
  AIsInplace: Boolean): TcxCustomEditViewData;
begin
  Result := inherited CreateViewData(AStyle, AIsInplace);
  with TcxSpinEditViewData(Result) do
    if Edit <> nil then
      PressedState := TcxCustomSpinEdit(Edit).FPressedState
    else
      PressedState := epsNone;
end;

class function TcxCustomSpinEditProperties.GetContainerClass: TcxContainerClass;
begin
  Result := TcxSpinEdit;
end;

class function TcxCustomSpinEditProperties.GetViewInfoClass: TcxContainerViewInfoClass;
begin
  Result := TcxSpinEditViewInfo;
end;

function TcxCustomSpinEditProperties.IsDisplayValueValid(var DisplayValue: TcxEditValue; AEditFocused: Boolean):
  Boolean;
var
  AValue: TcxEditValue;
  AIntValue: Integer;
  AExtendedValue: Extended;
  AErrorCode: Integer;
begin
  Result := inherited IsDisplayValueValid(DisplayValue, AEditFocused);
  if not Result or not IsDisplayValueNumeric then
    Exit;
  try
    if DisplayValue <> '' then
    begin
      if ValueType = vtFloat then
      begin
        Result := TextToFloat(PChar(VarToStr(DisplayValue)), AExtendedValue, fvExtended);
        AValue := AExtendedValue;
      end else
      begin
        Val(VarToStr(DisplayValue), AIntValue, AErrorCode);
        Result := AErrorCode = 0;
        AValue := AIntValue;
      end;
      if not Result then
        Exit;
      if (MinValue <> MaxValue) and ((AValue < MinValue) or (AValue > MaxValue)) then
        DisplayValue := VarToStr(AValue);
    end;
    Result := True;
  except
    on EConvertError do
      Result := False;
  end;
end;

function TcxCustomSpinEditProperties.IsEditValueValid(var EditValue: TcxEditValue; AEditFocused: Boolean):
  Boolean;
begin
  Result := VarIsNumericEx(EditValue) or VarIsNull(EditValue) or VarIsStr(EditValue);
  if not Result then
    Exit;

  Result := inherited IsEditValueValid(EditValue, AEditFocused);
  if not Result or VarIsNull(EditValue) then
    Exit;
  try
    EditValue := PrepareValue(EditValue);
  except
    Result := False;
  end;
end;

procedure TcxCustomSpinEditProperties.PrepareDisplayValue(const AEditValue: TcxEditValue;
  var DisplayValue: TcxEditValue; AEditFocused: Boolean);
var
  AValue: Double;
begin
  if VarIsNull(AEditValue) then
    DisplayValue := ''
  else
    if not VarIsNumericEx(AEditValue) and not VarIsStr(AEditValue) then
      raise EConvertError.CreateFmt(cxGetResourceString(@cxSEditNumericValueConvertError), [])
    else
    begin
      AValue := AEditValue;
      if ValueType = vtFloat then
        DisplayValue := FloatToStrF(AValue, ffGeneral, 15, 0)
      else
        DisplayValue := IntToStr(Round(AValue));
    end;
end;

procedure TcxCustomSpinEditProperties.ValidateDisplayValue(var DisplayValue: TcxEditValue;
  var ErrorText: TCaption; var Error: Boolean; AEdit: TcxCustomEdit);
begin
  Error := not IsDisplayValueValid(DisplayValue, True);
  inherited ValidateDisplayValue(DisplayValue, ErrorText, Error, AEdit);
end;

procedure TcxCustomSpinEditProperties.Changed;
begin
  if FSpinButtons <> nil then
  begin
    BeginUpdate;
    try
      if SpinButtons.ShowFastButtons and (Buttons.Count = 2) then
      begin
        Buttons.Add;
        Buttons.Add;
      end
      else
        if not SpinButtons.ShowFastButtons and (Buttons.Count = 4) then
        begin
          Buttons[3].Free;
          Buttons[2].Free;
        end
    finally
      EndUpdate(False);
    end;
  end;
  inherited Changed;
end;

function TcxCustomSpinEditProperties.DefaultFocusedDisplayValue: TcxEditValue;
begin
  if MinValue <> MaxValue then
    PrepareDisplayValue(MinValue, Result, True)
  else
    Result := '0';
end;

class function TcxCustomSpinEditProperties.GetAssignedValuesClass: TcxCustomEditPropertiesValuesClass;
begin
  Result := TcxSpinEditPropertiesValues;
end;

function TcxCustomSpinEditProperties.GetEditValueSource(AEditFocused: Boolean): TcxDataEditValueSource;
begin
  Result := GetValueEditorEditValueSource(AEditFocused);
end;

class function TcxCustomSpinEditProperties.GetViewDataClass: TcxCustomEditViewDataClass;
begin
  Result := TcxSpinEditViewData;
end;

function TcxCustomSpinEditProperties.IsEditValueNumeric: Boolean;
begin
  Result := True;
end;

function TcxCustomSpinEditProperties.IsDisplayValueNumeric: Boolean;
begin
  Result := True;
end;

function TcxCustomSpinEditProperties.PrepareValue(const AValue: TcxEditValue): Double;
begin
  if VarIsStr(AValue) and (AValue = '') then
    Result := 0
  else
    if ValueType = vtFloat then
      Result := VarAsType(AValue, varDouble)
    else
      Result := VarAsType(AValue, varInteger);
end;

function TcxCustomSpinEditProperties.PreserveSelection: Boolean;
begin
  Result := False;
end;

procedure TcxCustomSpinEditProperties.SetVariantType(var Value: TcxEditValue);
begin
  if VarIsNumericEx(Value) then
    if ValueType = vtFloat then
      Value := VarAsType(Value, varDouble)
    else
      Value := VarAsType(Value, varInteger);
end;

function TcxCustomSpinEditProperties.GetAssignedValues: TcxSpinEditPropertiesValues;
begin
  Result := TcxSpinEditPropertiesValues(FAssignedValues);
end;

function TcxCustomSpinEditProperties.GetMin: Double;
begin
  if ValueType = vtFloat then
    Result := MinValue
  else
    Result := Trunc(MinValue);
end;

function TcxCustomSpinEditProperties.GetValueType: TcxSpinEditValueType;
const
  ASpinEditValueTypeMap: array [Boolean] of TcxSpinEditValueType = (vtInt, vtFloat);
begin
  if AssignedValues.ValueType then
    Result := FValueType
  else
    if IDefaultValuesProvider <> nil then
      Result := ASpinEditValueTypeMap[IDefaultValuesProvider.DefaultIsFloatValue]
    else
      Result := vtFloat;
end;

function TcxCustomSpinEditProperties.IsIncrementStored: Boolean;
begin
  Result := FIncrement <> 1.0;
end;

function TcxCustomSpinEditProperties.IsLargeIncrementStored: Boolean;
begin
  Result := FLargeIncrement <> 10.0;
end;

function TcxCustomSpinEditProperties.IsValueTypeStored: Boolean;
begin
  Result := AssignedValues.ValueType;
end;

procedure TcxCustomSpinEditProperties.SetSpinButtons(Value: TcxSpinEditButtons);
begin
  FSpinButtons.Assign(Value);
end;

procedure TcxCustomSpinEditProperties.SetValueType(Value: TcxSpinEditValueType);
begin
  if AssignedValues.ValueType and (Value = FValueType) then
    Exit;
  AssignedValues.ValueType := True;
  FValueType := Value;
  Changed;
end;

{ TcxCustomSpinEdit }

constructor TcxCustomSpinEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  EditValue := 0;
  FPressedState := epsNone;
end;

procedure TcxCustomSpinEdit.CutToClipboard;
begin
  if not(KeyboardAction and not Properties.CanEdit) then
    inherited CutToClipboard;
end;

class function TcxCustomSpinEdit.GetPropertiesClass: TcxCustomEditPropertiesClass;
begin
  Result := TcxSpinEditProperties;
end;

class function TcxCustomSpinEdit.GetNotPublishedStyleValues: TcxEditStyleValues;
begin
  Result := [svPopupBorderStyle];
end;

function TcxCustomSpinEdit.Increment(AButton: TcxSpinEditButton): Boolean;
var
  ADisplayValue: TcxEditValue;
  APrevText: TCaption;
  AValue: Double;
  APrevSelStart: Integer;
  APrevSelLength: Integer;
begin
  LockChangeEvents(True);
  try
    Result := False;

    with Properties do
      if MinValue <> MaxValue then
      begin
        AValue := Value;
        if AValue < MinValue then
          if AButton in [sebForward, sebFastForward] then
            AValue := MinValue
          else
            Exit
        else
          if AValue > MaxValue then
            if AButton in [sebBackward, sebFastBackward] then
              AValue := MaxValue
            else
              Exit
          else
          begin
            AValue := AValue + GetIncrement(AButton);
            if (AValue < MinValue) or (AValue > MaxValue) then
              if ExtendValueUpToBound then
                if AValue < MinValue then
                  AValue := MinValue
                else
                  AValue := MaxValue
              else
                Exit
          end;
      end
      else
        AValue := Value + GetIncrement(AButton);

    if not DoEditing then
      Exit;
    APrevText := Text;

    Properties.PrepareDisplayValue(AValue, ADisplayValue, InternalFocused);
    APrevSelStart := SelStart;
    APrevSelLength := SelLength;
    KeyboardAction := True;
    try
      SetDisplayText(ADisplayValue);
    finally
      KeyboardAction := False;
    end;
    Result := not InternalCompareString(APrevText, Text, True);
    if Result then
    begin
      ModifiedAfterEnter := True;
      if Properties.PreserveSelection then
        SetSelection(APrevSelStart, APrevSelLength)
      else
        SelStart := Length(Text);
      if Properties.ImmediatePost and AutoPostEditValue and ValidateEdit(True) then
        PostEditValue;
    end;
  finally
    LockChangeEvents(False);
  end;
end;

procedure TcxCustomSpinEdit.PasteFromClipboard;
begin
  if not(KeyboardAction and not Properties.CanEdit) then
    inherited PasteFromClipboard;
end;

procedure TcxCustomSpinEdit.PrepareEditValue(const ADisplayValue: TcxEditValue;
  out EditValue: TcxEditValue; AEditFocused: Boolean);
var
  AExtendedValue: Extended;
  AError: Boolean;
  AErrorCode: Integer;
  AIntValue: Integer;
begin
  try
    try
      if ADisplayValue = '' then
        with Properties do
          if (IDefaultValuesProvider <> nil) and IDefaultValuesProvider.DefaultRequired then
            EditValue := GetMin
          else
            EditValue := Null
      else
      begin
        if Properties.ValueType = vtFloat then
        begin
          AError := not TextToFloat(PChar(VarToStr(ADisplayValue)), AExtendedValue, fvExtended);
          if not AError then
            EditValue := AExtendedValue;
        end else
        begin
          Val(VarToStr(ADisplayValue), AIntValue, AErrorCode);
          AError := AErrorCode <> 0;
          if not AError then
            EditValue := AIntValue;
        end;
        if AError then
          EditValue := Properties.GetMin;
      end;
    except
      on EConvertError do
        EditValue := Properties.GetMin;
    end
  finally
    Properties.SetVariantType(EditValue);
  end;
end;

procedure TcxCustomSpinEdit.CheckEditorValueBounds;
begin
  KeyboardAction := ModifiedAfterEnter;
  try
    with Properties do
      if Value < MinValue then
        Value := MinValue
      else if Value > MaxValue then
        Value := MaxValue;
  finally
    KeyboardAction := False;
  end;
end;

procedure TcxCustomSpinEdit.DblClick;
var
  P: TPoint;
begin
  inherited DblClick;
  P := ScreenToClient(InternalGetCursorPos);
  if ButtonVisibleIndexAt(P) = -1 then
    StopTracking;
end;

procedure TcxCustomSpinEdit.DoButtonDown(AButtonVisibleIndex: Integer);

  procedure CreateTimer;
  begin
    if Properties.ReadOnly then
      Exit;
    if FTimer <> nil then
      FTimer.Free;
    FTimer := TTimer.Create(Self);
    FTimer.Interval := cxSpinEditTimerInitialInterval;
    FTimer.OnTimer := HandleTimer;
  end;

begin
  inherited DoButtonDown(AButtonVisibleIndex);
  if FPressedState = epsNone then
    with ViewInfo do
      if PressedButton <> -1 then
      begin
        Increment(TcxSpinEditButton(PressedButton));
        CreateTimer;
      end;
end;

procedure TcxCustomSpinEdit.DoEditKeyDown(var Key: Word; Shift: TShiftState);
const
  APressedStateMap: array[TcxSpinEditButton] of TcxSpinEditPressedState =
    (epsDown, epsUp, epsFastDown, epsFastUp);
var
  AButton: TcxSpinEditButton;
begin
  if ((Key = VK_UP) or (Key = VK_DOWN) or (Key = VK_NEXT) or (Key = VK_PRIOR)) and
    not (Properties.UseCtrlIncrement and not (ssCtrl in Shift)) then
  begin
    if not DataBinding.Modified and not DoEditing then
      Exit;

    case Key of
      VK_UP:
        AButton := sebForward;
      VK_DOWN:
        AButton := sebBackward;
      VK_PRIOR:
        AButton := sebFastForward;
      else
        AButton := sebFastBackward;
    end;
    PressedState := APressedStateMap[AButton];

    if {$IFDEF WIN32}HasNativeHandle(Self, GetCapture){$ELSE}HasNativeHandle(Self,
        QWidget_mouseGrabber){$ENDIF} then
      SetCaptureControl(nil);
    Increment(AButton);
    Key := 0;
  end
  else
  begin
    StopTracking;
    if not Properties.CanEdit and CanKeyDownModifyEdit(Key, Shift) then
    begin
      DoAfterKeyDown(Key, Shift);
      Key := 0;
    end;
  end;
  
  if Key <> 0 then
    inherited DoEditKeyDown(Key, Shift);
end;

procedure TcxCustomSpinEdit.DoEditKeyPress(var Key: Char);
begin
  if Key in ['.', ','] then
    Key := DecimalSeparator;
  if (Key in [Char(VK_BACK), Char(VK_DELETE), #32 .. #255]) and not IsValidChar(Key) then
  begin
    Key := #0;
    Beep;
  end;
  if Key <> #0 then
    inherited DoEditKeyPress(Key);
end;

procedure TcxCustomSpinEdit.DoEditKeyUp(var Key: Word; Shift: TShiftState);
begin
  inherited DoEditKeyUp(Key, Shift);
  if Key = 0 then
    Exit;
  if (Key = VK_UP) or (Key = VK_DOWN) or (Key = VK_NEXT) or (Key = VK_PRIOR) then
    StopTracking;
end;

function TcxCustomSpinEdit.DoMouseWheelDown(Shift: TShiftState; {$IFNDEF VCL}const{$ENDIF}
  MousePos: TPoint): Boolean;
begin
  Result := HandleMouseWheel(Shift);
  if Result then
    Increment(sebBackward);
end;

function TcxCustomSpinEdit.DoMouseWheelUp(Shift: TShiftState; {$IFNDEF VCL}const{$ENDIF}
  MousePos: TPoint): Boolean;
begin
  Result := HandleMouseWheel(Shift);
  if Result then
    Increment(sebForward);
end;

procedure TcxCustomSpinEdit.FocusChanged;
begin
  inherited FocusChanged;
  StopTracking;
end;

function TcxCustomSpinEdit.IsValidChar(AChar: Char): Boolean;
var
  AValidChars: set of Char;
begin
  AValidChars := ['+', '-', '0'..'9'];
  if Properties.ValueType = vtFloat then
    Include(AValidChars, DecimalSeparator);
  Result := (AChar in AValidChars) or (AChar < #32);
  Result := Result or (AChar in Properties.ValidChars);
  if not Properties.CanEdit and Result and ((AChar >= #32) or
      (AChar = Char(#8)) or (AChar = Char(VK_DELETE))) then
    Result := False;
end;

procedure TcxCustomSpinEdit.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited MouseUp(Button, Shift, X, Y);
  StopTracking;
end;

procedure TcxCustomSpinEdit.PropertiesChanged(Sender: TObject);
begin
  inherited PropertiesChanged(Sender);
  if not TcxEditDataBindingAccess(DataBinding).CanCheckEditorValue and ModifiedAfterEnter then
    CheckEditorValueBounds;
end;

function TcxCustomSpinEdit.RefreshContainer(const P: TPoint; Button: TcxMouseButton;
  Shift: TShiftState; AIsMouseEvent: Boolean): Boolean;
begin
  Result := inherited RefreshContainer(P, Button, Shift, AIsMouseEvent);
  with ViewInfo do
//    if (Length(ButtonsInfo) > 0) and (ButtonsInfo[cxSpinBackwardButtonIndex].Data.State <> ebsPressed) and
//        (ButtonsInfo[cxSpinForwardButtonIndex].Data.State <> ebsPressed) and (CaptureButtonVisibleIndex = -1) then
    if (Length(ButtonsInfo) > 0) and (PressedButton = -1) and (CaptureButtonVisibleIndex = -1) then
      StopTracking;
end;

function TcxCustomSpinEdit.ExtendValueUpToBound: Boolean;
begin
  Result := True;
end;

function TcxCustomSpinEdit.GetIncrement(AButton: TcxSpinEditButton): Double;
begin
  if AButton in [sebBackward, sebForward] then
    Result := Properties.Increment
  else
    Result := Properties.LargeIncrement;
  if Properties.ValueType = vtInt then
    Result := Round(Result);
  if AButton in [sebBackward, sebFastBackward] then
    Result := -Result;
end;

function TcxCustomSpinEdit.GetProperties: TcxSpinEditProperties;
begin
  Result := TcxSpinEditProperties(InternalGetProperties);
end;

function TcxCustomSpinEdit.GetValue: Variant;
const
  AVarTypeMap: array [TcxSpinEditValueType] of TVarType = (varInteger, varDouble);
begin
  if Focused then
  begin
    PrepareEditValue(Text, Result, InternalFocused);
    if not VarIsNumericEx(Result) then
      Result := VarAsType(Properties.MinValue, AVarTypeMap[Properties.ValueType]);
  end else
  begin
    if VarIsNumericEx(EditValue) or VarIsStr(EditValue) then
      Result := VarAsType(EditValue, AVarTypeMap[Properties.ValueType])
    else
      Result := VarAsType(Properties.MinValue, AVarTypeMap[Properties.ValueType]);
    TVarData(Result).VType := AVarTypeMap[Properties.ValueType];
  end;
end;

procedure TcxCustomSpinEdit.HandleTimer(Sender: TObject);
begin
  if FTimer.Interval = cxSpinEditTimerInitialInterval then
    FTimer.Interval := cxSpinEditTimerInterval;
  if ViewInfo.PressedButton <> -1 then
    Increment(TcxSpinEditButton(ViewInfo.PressedButton));
end;

function TcxCustomSpinEdit.IsValueStored: Boolean;
begin
  Result := not VarEqualsExact(Value, 0);
end;

procedure TcxCustomSpinEdit.SetPressedState(Value: TcxSpinEditPressedState);
const
  ASpinButtonMap: array[TcxSpinEditPressedState] of TcxSpinEditButton =
    (sebBackward, sebBackward, sebForward, sebFastBackward, sebFastForward);
var
  I: Integer;
begin
  if (Length(ViewInfo.ButtonsInfo) > 0) and (Value <> FPressedState) then
  begin
    FPressedState := Value;
    CalculateViewInfo(False);
    for I := 0 to Length(ViewInfo.ButtonsInfo) - 1 do
      InvalidateRect(ViewInfo.ButtonsInfo[I].Bounds, False);
  end;
end;

procedure TcxCustomSpinEdit.SetProperties(Value: TcxSpinEditProperties);
begin
  FProperties.Assign(Value);
end;

procedure TcxCustomSpinEdit.SetValue(const Value: Variant);
var
  AValue: TcxEditValue;
begin
  if not VarIsNull(Value) then
    if Focused then
      SetDisplayText(VarToStr(Value))
    else
    begin
      AValue := Value;
      if Properties.IsEditValueValid(AValue, False) then
        EditValue := AValue;
    end;
end;

procedure TcxCustomSpinEdit.StopTracking;
var
  I: Integer;
begin
  CaptureButtonVisibleIndex := -1;
  PressedState := epsNone;
  if Length(ViewInfo.ButtonsInfo) > 0 then
    for I := 0 to 1 do
      with ViewInfo.ButtonsInfo[I] do
        if Data.State = ebsPressed then
        begin
          Data.State := ebsNormal;
          CalculateViewInfo(False);
          InvalidateRect(Bounds, False);
        end;

  FreeAndNil(FTimer);
  if GetCaptureControl = Self then
    SetCaptureControl(nil);
end;

initialization
  GetRegisteredEditProperties.Register(TcxSpinEditProperties, scxSEditRepositorySpinItem);

end.
