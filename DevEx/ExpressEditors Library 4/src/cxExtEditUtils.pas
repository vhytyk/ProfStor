
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

unit cxExtEditUtils;

{$I cxExtEdVer.inc}

interface

{.$DEFINE NOFLICKER}

uses
{$IFDEF WIN32}
  Windows, Messages,
{$ENDIF}
{$IFDEF VCL}
  dxThemeManager,
{$ELSE}
  Types, Qt, QTypes,
{$ENDIF}
{$IFDEF DELPHI6}
  Variants,
{$ENDIF}
  Classes, Controls, Forms, Graphics, ImgList, StdCtrls, SysUtils, cxClasses,
  cxContainer, cxControls, cxEdit, cxTextEdit, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, cxEditPaintUtils, cxVariants, cxLabel, cxEditUtils,
  cxCheckBox, cxProgressBar, cxTrackBar, cxColorComboBox;

type
  { TcxCustomCheckPaintHelper }
  TcxCustomCheckPaintHelper = class(TPersistent)
  private
    FOwner: TPersistent;
    FStyle: TcxCustomEditStyle;
    FGlyph: TBitmap;
    FGlyphCount: Integer;
    procedure SetStyle(Value: TcxCustomEditStyle);
    function HasGlyph: Boolean;
  protected
    property Owner: TPersistent read FOwner write FOwner;
    function GetNextState(Value: TcxCheckBoxState; AllowGrayed: Boolean): TcxCheckBoxState; virtual;
    property Style: TcxCustomEditStyle read FStyle write SetStyle;
    property Glyph: TBitmap read FGlyph write FGlyph;
    property GlyphCount: Integer read FGlyphCount write FGlyphCount;
    procedure DrawCheck(ACanvas: TcxCanvas; const ARect: TRect;
      const ACheckState: TcxCheckBoxState; const AEnabled: Boolean;
      const MinLeft: Integer = 0; const MinTop: Integer = 0); virtual;
    function CalcTextRect(const ARect: TRect; const ACheckState: TcxCheckBoxState): TRect; virtual;
    function CalcCheckPoint(const ARect: TRect; const ACheckState: TcxCheckBoxState): TPoint; virtual;
    function IsClickInCheck(const AItemRect: TRect; const ACheckState: TcxCheckBoxState;
      X, Y: Integer; const AUseRightToLeftAlignment: Boolean = False): Boolean;
    function GetCheckWidth: Integer; virtual;
  public
    constructor Create(AOwner : TPersistent);
    destructor Destroy; override;
  end;

  { TcxControlHook }
  TcxControlHook = class(TObject)
  private
    FControl: TWinControl;
    FNewWndProc: Pointer;
    FPrevWndProc: Pointer;
    FDestroying: Boolean;
  protected
    procedure SetWinControl(Value: TWinControl); virtual;
    procedure HookWndProc(var AMsg: TMessage); virtual;
  public
    constructor Create;
    destructor Destroy; override;
    procedure HookControl; virtual;
    procedure UnHookControl; virtual;
    property WinControl: TWinControl read FControl write SetWinControl;
    property IsDestroying: Boolean read FDestroying;
  end;

procedure CalculateLabelViewInfo(AViewData: TcxCustomLabelViewData;
  AViewInfo: TcxCustomLabelViewInfo; AIsMouseEvent: Boolean);
procedure DrawColorBox(ACanvas: TcxCanvas; ARect: TRect; const AFrameColor,
  ABoxColor, ABkColor: TColor; const DefaultColorStyle: TcxDefaultColorStyle);
function DrawBounds(ACanvas: TcxCanvas; Bounds: TRect; const AUpperLeftColor,
  ALowerRightColor: TColor): TRect;
procedure DrawCanvasLine(ACanvas: TCanvas; const AColor: TColor;
  const AFromPoint, AToPoint: TPoint);
procedure InflateRectEx(var R: TRect; const AlOffset, AtOffset, ArOffset, AbOffset: Integer);
function RectWidth(const ARect: TRect): Integer;
function NonCanvasTextHeight(const AFont: TFont): Integer;
function NonCanvasTextWidth(const AFont: TFont; const AText: string): Integer;
function CalcMaxWidth(ACanvas: TCanvas; const AText: string): Integer;
function RectHeight(const ARect: TRect): Integer;
function PrepareTextFlag(const AStartFlag: Longint;
  const AHorzAlignments: TAlignment; const AVertAlignments: TcxAlignmentVert;
  const AShowEndEllipsis: Boolean; const AWordWrap: Boolean;
  const ATabWidth: Integer = 0): Longint;
function IncColor(const AColor: TColor; const AR, AG, AB: Integer): TColor;
function CalcCenterPosHeight(const ARect: TRect; const ADrawHeight: Integer): Integer;
function CalcDrawWidth(const ARect: TRect; const ADrawHeight: Integer): Integer;
procedure CalculateCustomProgressBarViewInfo(ACanvas: TcxCanvas; AViewData: TcxCustomProgressBarViewData;
  AViewInfo: TcxCustomProgressBarViewInfo);
procedure CalculateCustomLabelViewInfo(ACanvas: TcxCanvas; AViewData: TcxCustomLabelViewData;
  AViewInfo: TcxCustomLabelViewInfo);
procedure CalculateCustomTrackBarViewInfo(ACanvas: TcxCanvas; AViewData: TcxCustomTrackBarViewData;
  AViewInfo: TcxCustomTrackBarViewInfo);
function IsVarEmpty(const AValue: Variant): Boolean;
function IsValidStringForInt(const AValue: string): Boolean;
function IsValidStringForDouble(const AValue: string): Boolean;
function VarIsInteger(const AValue: Variant): Boolean;
function VarIsDouble(const AValue: Variant): Boolean;
{$IFDEF DELPHI6}
function GetMaxVarInteger(const AValue: Variant): Int64;
{$ELSE}
function GetMaxVarInteger(const AValue: Variant): Integer;
{$ENDIF}
function GetMaxVarDouble(const AValue: Variant): Extended;
function cxStrToInt(const AValue: string; const AToFirstNonNum: Boolean = False): Integer;
function cxStrToFloat(const AValue: string; const AToFirstNonNum: Boolean = False): Extended;
function cxStringToColor(const AString: string; out Valid: Boolean): TColor;
function cxRGBStringColorToColor(const AString: string): TColor;
function cxHexRGBStringColorToColor(const AString: string): TColor;
procedure DrawBottomRightThumb(ACanvas: TcxCanvas; const AThumbRect: TRect;
  const AOrientation: TcxTrackBarOrientation; const AThumbSize: Integer;
  const AKind: TcxLookAndFeelKind; const AThumbColor: TColor);
procedure DrawTopLeftThumb(ACanvas: TcxCanvas; const AThumbRect: TRect;
  const AOrientation: TcxTrackBarOrientation; const AThumbSize: Integer;
  const AKind: TcxLookAndFeelKind; const AThumbColor: TColor);
function CheckStateToString(const Value: TcxCheckBoxState): string;
function StringToCheckState(const Value: string; const AllowGrayed: Boolean): TcxCheckBoxState;
function CurrentShiftState: TShiftState;
function GetWord(const APosition: Integer; const S: string;
  const Delimiter: Char): string;
procedure PaintBackground(const AControl: TWinControl; DC: HDC; DoParent: Boolean);
{$IFNDEF DELPHI5}
function SameText(const S1, S2: string): Boolean; assembler;
{$ENDIF}

implementation

uses
{$IFDEF VCL}
  dxUxTheme, dxThemeConsts,
{$ENDIF}
  cxEditTextUtils, Math;

type
  TcxCustomEditStyleAccess = class(TcxCustomEditStyle);
  TcxCheckBoxAccess = class(TcxCheckBox);
  TWinControlAccess = class(TWinControl);

{ TcxCustomCheckPaintHelper }
constructor TcxCustomCheckPaintHelper.Create(AOwner : TPersistent);
begin
  inherited Create;
  FOwner := AOwner;
  FStyle := TcxCustomEditStyle.Create(Self, False);
end;

destructor TcxCustomCheckPaintHelper.Destroy;
begin
  FOwner := nil;
  FreeAndNil(FStyle);
  inherited Destroy;
end;

procedure TcxCustomCheckPaintHelper.SetStyle(Value: TcxCustomEditStyle);
begin
  FStyle.Assign(Value);
end;

function TcxCustomCheckPaintHelper.HasGlyph: Boolean;
begin
  Result := (FGlyph <> nil) and (not FGlyph.Empty);
end;

function TcxCustomCheckPaintHelper.GetNextState(Value: TcxCheckBoxState; AllowGrayed: Boolean): TcxCheckBoxState;
begin
  case Value of
    cbsChecked: if AllowGrayed=True then Result := cbsGrayed else Result := cbsUnchecked;
    cbsGrayed: Result := cbsUnchecked;
    else Result := cbsChecked;
  end;
end;

function TcxCustomCheckPaintHelper.GetCheckWidth: Integer;
begin
  Result := 13;
end;

procedure TcxCustomCheckPaintHelper.DrawCheck(ACanvas: TcxCanvas; const ARect: TRect;
  const ACheckState: TcxCheckBoxState; const AEnabled: Boolean;
  const MinLeft: Integer = 0; const MinTop: Integer = 0);

{$IFDEF VCL}
const
  ANativeCheckBoxStateMap: array[TcxCheckBoxState, TcxEditCheckState] of Integer = (
    (CBS_UNCHECKEDNORMAL, CBS_UNCHECKEDHOT, CBS_UNCHECKEDPRESSED, CBS_UNCHECKEDDISABLED),
    (CBS_CHECKEDNORMAL, CBS_CHECKEDHOT, CBS_CHECKEDPRESSED, CBS_CHECKEDDISABLED),
    (CBS_MIXEDNORMAL, CBS_MIXEDHOT, CBS_MIXEDPRESSED, CBS_MIXEDDISABLED)
  );
  ANullValueNativeCheckBoxStateMap: array[TcxCheckBoxNullValueShowingStyle, TcxEditCheckState] of Integer = (
    (CBS_UNCHECKEDNORMAL, CBS_UNCHECKEDHOT, CBS_UNCHECKEDPRESSED, CBS_UNCHECKEDDISABLED),
    (CBS_UNCHECKEDDISABLED, CBS_UNCHECKEDDISABLED, CBS_UNCHECKEDDISABLED, CBS_UNCHECKEDDISABLED),
    (CBS_MIXEDNORMAL, CBS_MIXEDHOT, CBS_MIXEDPRESSED, CBS_MIXEDDISABLED)
  );
{$ENDIF}

var
  FCenterPos, FLeftPos, FTopPos: Integer;
  FCheckBoxViewInfo: TcxCustomCheckBoxViewInfo;
begin
  FCenterPos := CalcCenterPosHeight(ARect, 13);
  FLeftPos := ARect.Left + FCenterPos;
  FTopPos := ARect.Top + FCenterPos;
  if FLeftPos < MinLeft then FLeftPos := MinLeft;
  if FTopPos < MinTop then FTopPos := MinTop;
  FCheckBoxViewInfo := TcxCustomCheckBoxViewInfo.Create;
  try
    FCheckBoxViewInfo.Font := TFont.Create;
    FCheckBoxViewInfo.Font.Assign(FStyle.Font);
    FCheckBoxViewInfo.BorderColor := FStyle.BorderColor;
    FCheckBoxViewInfo.BackgroundColor := FStyle.Color;
    FCheckBoxViewInfo.NativeStyle := FStyle.LookAndFeel.NativeStyle;
    FCheckBoxViewInfo.CheckBoxBorderStyle := FStyle.BorderStyle;
    FCheckBoxViewInfo.CheckBoxState := ecsNormal;
    FCheckBoxViewInfo.State := ACheckState;
    FCheckBoxViewInfo.Enabled := AEnabled;
    FCheckBoxViewInfo.HasGlyph := HasGlyph;
    if HasGlyph then
    begin
      FCheckBoxViewInfo.CheckBoxGlyph := FGlyph;
      FCheckBoxViewInfo.CheckBoxGlyphCount := FGlyphCount;
      FCheckBoxViewInfo.CheckBoxRect := Rect(FLeftPos, FTopPos,
        FLeftPos + GetCheckWidth, FTopPos + GetCheckWidth);
    end
    else
      FCheckBoxViewInfo.CheckBoxRect := Rect(FLeftPos, FTopPos,
        FLeftPos + GetCheckWidth, FTopPos + GetCheckWidth);

{$IFDEF VCL}
    if AreVisualStylesMustBeUsed(FCheckBoxViewInfo.NativeStyle, totButton) then
      FCheckBoxViewInfo.NativeCheckBoxState := ANativeCheckBoxStateMap[FCheckBoxViewInfo.State, FCheckBoxViewInfo.CheckBoxState]
    else
      begin
        FCheckBoxViewInfo.NativeCheckBoxState := TC_NONE;
        FCheckBoxViewInfo.NullValueShowingStyle := nssGrayedChecked
      end;
{$ENDIF}

    DrawCustomCheckBox(ACanvas, FCheckBoxViewInfo);
  finally
    FreeAndNil(FCheckBoxViewInfo.Font);
    FreeAndNil(FCheckBoxViewInfo);
  end;
end;

function TcxCustomCheckPaintHelper.CalcTextRect(const ARect: TRect;
  const ACheckState: TcxCheckBoxState): TRect;
begin
  Result := ARect;
  Inc(Result.Left, RectHeight(ARect) + 2);
end;

function TcxCustomCheckPaintHelper.CalcCheckPoint(const ARect: TRect;
  const ACheckState: TcxCheckBoxState): TPoint;
var
  FCenterPos : Integer;
begin
  FCenterPos := CalcCenterPosHeight(ARect, GetCheckWidth);
  Result.X := ARect.Left + FCenterPos;
  Result.Y := ARect.Top + FCenterPos;
end;

function TcxCustomCheckPaintHelper.IsClickInCheck(const AItemRect: TRect;
  const ACheckState: TcxCheckBoxState; X, Y: Integer;
  const AUseRightToLeftAlignment: Boolean = False): Boolean;
var
  FCheckRect : TRect;
  FCenterPos : Integer;
begin
  FCenterPos := CalcCenterPosHeight(AItemRect, GetCheckWidth);
  if not AUseRightToLeftAlignment then
    FCheckRect := Bounds(AItemRect.Left + FCenterPos, AItemRect.Top + FCenterPos,
      GetCheckWidth, GetCheckWidth)
  else
    FCheckRect := Bounds(AItemRect.Right - (FCenterPos * 3), AItemRect.Top + FCenterPos,
      GetCheckWidth, GetCheckWidth);
  Result := (X >= FCheckRect.Left) and (X <= FCheckRect.Right) and
            (Y >= FCheckRect.Top) and (Y <= FCheckRect.Bottom);
end;
{ TcxCustomCheckPaintHelper }

{ TcxControlHook }
constructor TcxControlHook.Create;
begin
  inherited Create;
{$IFDEF LINUX}
  FNewWndProc := WinUtils.MakeObjectInstance(HookWndProc);
{$ENDIF}
{$IFDEF MSWINDOWS}
{$IFDEF DELPHI6}
  FNewWndProc := Classes.MakeObjectInstance(HookWndProc);
{$ELSE}
  FNewWndProc := MakeObjectInstance(HookWndProc);
{$ENDIF}
{$ENDIF}
  FPrevWndProc := nil;
  FControl := nil;
end;

destructor TcxControlHook.Destroy;
begin
  FDestroying := True;
  FControl := nil;
{$IFDEF LINUX}
  WinUtils.FreeObjectInstance(FNewWndProc);
{$ENDIF}
{$IFDEF MSWINDOWS}
{$IFDEF DELPHI6}
  Classes.FreeObjectInstance(FNewWndProc);
{$ELSE}
  FreeObjectInstance(FNewWndProc);
{$ENDIF}
{$ENDIF}
  FNewWndProc := nil;
  inherited Destroy;
end;

procedure TcxControlHook.HookControl;
var
  P: Pointer;
begin
  if Assigned(FControl) and not ((csDesigning in FControl.ComponentState) or
    (csDestroying in FControl.ComponentState) or FDestroying) then
  begin
    FControl.HandleNeeded;
    P := Pointer(GetWindowLong(FControl.Handle, GWL_WNDPROC));
    if (P <> FNewWndProc) then
    begin
      FPrevWndProc := P;
      SetWindowLong(FControl.Handle, GWL_WNDPROC, LongInt(FNewWndProc));
    end;
  end;
end;

procedure TcxControlHook.UnHookControl;
begin
  if Assigned(FControl) then
  begin
    if Assigned(FPrevWndProc) and FControl.HandleAllocated and
    (Pointer(GetWindowLong(FControl.Handle, GWL_WNDPROC)) = FNewWndProc) then
      SetWindowLong(FControl.Handle, GWL_WNDPROC, LongInt(FPrevWndProc));
  end;
  FPrevWndProc := nil;
end;

procedure TcxControlHook.HookWndProc(var AMsg: TMessage);
begin
  if Assigned(FControl) and not IsDestroying then
  begin
    try
      if Assigned(FPrevWndProc) then
        AMsg.Result := CallWindowProc(FPrevWndProc, FControl.Handle, AMsg.Msg,
          AMsg.WParam, AMsg.LParam)
      else
        AMsg.Result := CallWindowProc(TWinControlAccess(FControl).DefWndProc,
          FControl.Handle, AMsg.Msg, AMsg.WParam, AMsg.LParam);
    finally
    end;
    if AMsg.Msg = WM_DESTROY then
      UnHookControl;
  end;
end;

procedure TcxControlHook.SetWinControl(Value: TWinControl);
begin
  if Value <> FControl then
  begin
    UnHookControl;
    FControl := Value;
    if FControl <> nil then HookControl;
  end;
end;
{ TcxControlHook }

procedure CalculateLabelViewInfo(AViewData: TcxCustomLabelViewData; AViewInfo:
          TcxCustomLabelViewInfo; AIsMouseEvent: Boolean);
begin
  CalculateCustomEditViewInfo(AViewData, AViewInfo, AIsMouseEvent);
end;

procedure DrawColorBox(ACanvas: TcxCanvas;ARect: TRect; const AFrameColor,
  ABoxColor, ABkColor: TColor; const DefaultColorStyle: TcxDefaultColorStyle);
var
  FRectangle: TRect;
begin
  if (ARect.Left <> ARect.Right) and (ARect.Bottom <> ARect.Top) then
  begin
    ACanvas.Brush.Style := bsSolid;
    ACanvas.Brush.Color := ABkColor;
    ACanvas.FrameRect(ARect);
    InflateRect(ARect, -1, -1);
    ACanvas.Brush.Color := AFrameColor;
    ACanvas.FrameRect(ARect);
    InflateRect(ARect, -1, -1);
    case DefaultColorStyle of
      cxdcClear:
      begin
        ACanvas.Brush.Color := ABkColor;
        ACanvas.FillRect(ARect);
      end;
      cxdcColor, cxdcCustom, cxdcText:
      begin
        ACanvas.Brush.Color := ABoxColor;
        ACanvas.FillRect(ARect);
      end;
      cxdcHatched: begin
        ACanvas.Brush.Color := ABkColor;
        ACanvas.FillRect(ARect);
        ACanvas.Pen.Color := ABkColor;
        ACanvas.Brush.Color := ABoxColor;
        ACanvas.Brush.Style := bsDiagCross;
        FRectangle := ARect;
        InflateRect(FRectangle, 1, 1);
{$IFDEF DELPHI5}
        ACanvas.Canvas.Rectangle(FRectangle);
{$ELSE}
        ACanvas.Canvas.Rectangle(FRectangle.Left, FRectangle.Top, FRectangle.Right, FRectangle.Bottom);
{$ENDIF}
        ACanvas.Pen.Color := AFrameColor;
        ACanvas.Polyline([Point(ARect.Left -1 , ARect.Top - 1), Point(ARect.Right, ARect.Top - 1),
          Point(ARect.Right, ARect.Bottom), Point(ARect.Left - 1, ARect.Bottom),
          Point(ARect.Left - 1, ARect.Top - 1)]);
      end;
    end;
    ACanvas.Brush.Style := bsSolid;
  end;
end;

function DrawBounds(ACanvas: TcxCanvas; Bounds: TRect;
  const AUpperLeftColor, ALowerRightColor: TColor): TRect;
begin
  ACanvas.Pen.Color:=AUpperLeftColor;
  ACanvas.MoveTo(Bounds.Left, Bounds.Top);
  ACanvas.LineTo(Bounds.Left, Bounds.Bottom + 1);
  ACanvas.MoveTo(Bounds.Left, Bounds.Top);
  ACanvas.LineTo(Bounds.Right + 1, Bounds.Top);
  ACanvas.Pen.Color:=ALowerRightColor;
  ACanvas.MoveTo(Bounds.Right, Bounds.Top + 1);
  ACanvas.LineTo(Bounds.Right, Bounds.Bottom);
  ACanvas.MoveTo(Bounds.Left + 1, Bounds.Bottom);
  ACanvas.LineTo(Bounds.Right + 1, Bounds.Bottom);
  Result.Left := Bounds.Left + 1;
  Result.Top := Bounds.Top + 1;
  Result.Right := Bounds.Right - 1;
  Result.Bottom := Bounds.Bottom - 1;
end;

procedure DrawCanvasLine(ACanvas: TCanvas;const AColor: TColor;
  const AFromPoint, AToPoint: TPoint);
begin
  ACanvas.Pen.Color := AColor;
  ACanvas.MoveTo(AFromPoint.x, AFromPoint.y);
  ACanvas.LineTo(AToPoint.x, AToPoint.y);
end;

procedure InflateRectEx(var R: TRect; const AlOffset, AtOffset, ArOffset, AbOffset: Integer);
begin
  with R do
  begin
    Left := Left + AlOffset;
    Top := Top + AtOffset;
    Right := Right + ArOffset;
    Bottom := Bottom + AbOffset;
  end;
end;

function RectWidth(const ARect: TRect): Integer;
begin
  Result := ARect.Right - ARect.Left;
end;

function RectHeight(const ARect: TRect): Integer;
begin
  Result := ARect.Bottom - ARect.Top;
end;

function PrepareTextFlag(const AStartFlag: Longint;
  const AHorzAlignments: TAlignment; const AVertAlignments: TcxAlignmentVert;
  const AShowEndEllipsis: Boolean; const AWordWrap: Boolean;
  const ATabWidth: Integer = 0): Longint;
const
  AlignmentsHorzArray: array[TAlignment] of Integer =
    (DT_LEFT, DT_RIGHT, DT_CENTER);
  AlignmentsVertArray: array[TcxAlignmentVert] of Integer =
    (DT_TOP, DT_BOTTOM, DT_VCENTER);
  ShowEndEllipsisArray: array[Boolean] of Integer = (0, DT_END_ELLIPSIS);
  WordWrapArray: array[Boolean] of Integer = (0, DT_WORDBREAK);
begin
  Result := AStartFlag or
    AlignmentsHorzArray[AHorzAlignments] or
    AlignmentsVertArray[AVertAlignments] or
    ShowEndEllipsisArray[AShowEndEllipsis] or
    WordWrapArray[AWordWrap];
  if ATabWidth > 0 then
    Result := Result or DT_EXPANDTABS or DT_TABSTOP;
end;

function NonCanvasTextHeight(const AFont: TFont): Integer;
var
  FBitmap: TBitmap;
begin
  FBitmap := TBitmap.Create;
  try
    FBitmap.Canvas.Font.Assign(AFont);
    Result := FBitmap.Canvas.TextHeight('Wg');
  finally
    FBitmap.Free;
  end;
end;

function NonCanvasTextWidth(const AFont: TFont; const AText: string): Integer;
var
  FBitmap: TBitmap;
begin
  FBitmap := TBitmap.Create;
  try
    FBitmap.Canvas.Font.Assign(AFont);
    Result := FBitmap.Canvas.TextWidth(AText);
  finally
    FBitmap.Free;
  end;
end;

function CalcMaxWidth(ACanvas: TCanvas; const AText: string): Integer;
var
  FStringList: TStringList;
  I, FWidth: Integer;
begin
  Result := ACanvas.TextWidth(AText);
  FStringList := TStringList.Create;
  try
    FStringList.Text := AText;
    for I := 0 to FStringList.Count - 1 do
    begin
      FWidth := ACanvas.TextWidth(FStringList[I]);
      if FWidth > Result then Result := FWidth;
    end;
  finally
    FStringList.Free;
  end;
  Inc(Result, 1);
end;

function IncColor(const AColor: TColor; const AR, AG, AB: Integer): TColor;
var
  FR, FG, FB: Integer;
begin
  FR := GetRValue(ColorToRGB(AColor));
  FG := GetGValue(ColorToRGB(AColor));
  FB := GetBValue(ColorToRGB(AColor));
  if (FR + AR) > High(Byte) then
    FR := High(Byte)
  else
    Inc(FR, AR);
  if (FG + AG) > High(Byte) then
    FG := High(Byte)
  else
    Inc(FG, AG);
  if (FB + AB) > High(Byte) then
    FB := High(Byte)
  else
    Inc(FB, AB);
  Result := RGB(FR, FG, FB);
end;

function CalcCenterPosHeight(const ARect: TRect; const ADrawHeight: Integer): Integer;
begin
  Result := (ARect.Bottom - ARect.Top - ADrawHeight) div 2;
end;

function CalcDrawWidth(const ARect: TRect; const ADrawHeight: Integer): Integer;
begin
  Result := (CalcCenterPosHeight(ARect, ADrawHeight) * 2 + 2) + ADrawHeight;
end;

procedure CalculateCustomProgressBarViewInfo(ACanvas: TcxCanvas; AViewData: TcxCustomProgressBarViewData;
  AViewInfo: TcxCustomProgressBarViewInfo);

  procedure CheckFocusRectBounds;
  begin
    with AViewInfo do
    begin
      if FocusRect.Left < TextRect.Left - 1 then
        FocusRect.Left := TextRect.Left - 1;
      if FocusRect.Top < TextRect.Top - 1 then
        FocusRect.Top := TextRect.Top - 1;
      if FocusRect.Right > TextRect.Right + 1 then
        FocusRect.Right := TextRect.Right + 1;
      if FocusRect.Bottom > TextRect.Bottom + 1 then
        FocusRect.Bottom := TextRect.Bottom + 1;
    end;
  end;

begin
  with AViewInfo do
  begin
    if not IsInplace and Focused then
      if Length(Text) = 0 then
        FillChar(FocusRect, SizeOf(FocusRect), 0)
      else
      begin
        FocusRect := TextRect;
        InflateRect(FocusRect, 1, 1);
        CheckFocusRectBounds;
      end;
  end;
end;

procedure CalculateCustomTrackBarViewInfo(ACanvas: TcxCanvas; AViewData: TcxCustomTrackBarViewData;
  AViewInfo: TcxCustomTrackBarViewInfo);

  procedure CheckFocusRectBounds;
  begin
    with AViewInfo do
    begin
      if FocusRect.Left < TextRect.Left - 1 then
        FocusRect.Left := TextRect.Left - 1;
      if FocusRect.Top < TextRect.Top - 1 then
        FocusRect.Top := TextRect.Top - 1;
      if FocusRect.Right > TextRect.Right + 1 then
        FocusRect.Right := TextRect.Right + 1;
      if FocusRect.Bottom > TextRect.Bottom + 1 then
        FocusRect.Bottom := TextRect.Bottom + 1;
    end;
  end;

begin
  with AViewInfo do
  begin
    if AViewData.Enabled then
      BackgroundColor := TcxCustomEditStyleAccess(AViewData.Style).Color
    else
      BackgroundColor := clBtnFace;

    if not IsInplace and Focused then
      if Length(Text) = 0 then
        FillChar(FocusRect, SizeOf(FocusRect), 0)
      else
      begin
        FocusRect := TextRect;
        InflateRect(FocusRect, 1, 1);
        CheckFocusRectBounds;
      end;
  end;
end;

procedure CalculateCustomLabelViewInfo(ACanvas: TcxCanvas; AViewData: TcxCustomLabelViewData;
  AViewInfo: TcxCustomLabelViewInfo);

  procedure CheckFocusRectBounds;
  begin
    with AViewInfo do
    begin
      if FocusRect.Left < TextRect.Left - 1 then
        FocusRect.Left := TextRect.Left - 1;
      if FocusRect.Top < TextRect.Top - 1 then
        FocusRect.Top := TextRect.Top - 1;
      if FocusRect.Right > TextRect.Right + 1 then
        FocusRect.Right := TextRect.Right + 1;
      if FocusRect.Bottom > TextRect.Bottom + 1 then
        FocusRect.Bottom := TextRect.Bottom + 1;
    end;
  end;

begin
  with AViewInfo do
  begin
    if not IsInplace and Focused then
      if Length(Text) = 0 then
        FillChar(FocusRect, SizeOf(FocusRect), 0)
      else
      begin
        FocusRect := TextRect;
        InflateRect(FocusRect, 1, 1);
        CheckFocusRectBounds;
      end;
  end;
end;

function IsVarEmpty(const AValue : Variant): Boolean;
begin
  Result := VarIsNull(AValue) or VarIsEmpty(AValue);
end;

function IsValidStringForInt(const AValue: string): Boolean;
var
  I: Integer;
  AString: string;
begin
  AString := Trim(AValue);
  Result := Length(AString) > 0;
  { Check for valid numeric symbols in string }
  if Result = True then
    for I := 1 to Length(AString) do
    begin
      if not (AString[I] in ['0'..'9']) and
        ((AString[I] <> '-') or ((AString[I] = '-') and (I > 1))) then
      begin
        Result := False;
        Break;
      end;
    end;
  { Check for valid Integer range }
  if Result = True then
    Result := (Abs(StrToFloat(AString)) <= MaxInt);
end;

function IsValidStringForDouble(const AValue: string): Boolean;
var
  I: Integer;
  AString: string;
  ADecimalSeparatorCounter: Integer;
begin
  AString := Trim(AValue);
  ADecimalSeparatorCounter := 0;
  Result := Length(AString) > 0;
  { Check for valid numeric symbols in string }
  if Result = True then
    for I := 1 to Length(AString) do
    begin
      if not (AString[I] in ['0'..'9', DecimalSeparator]) and
        ((AString[I] <> '-') or ((AString[I] = '-') and (I > 1))) then
        Result := False
      else
        if AString[I] = DecimalSeparator then
        begin
          if ADecimalSeparatorCounter = 0 then
            Inc(ADecimalSeparatorCounter)
          else
            Result := False
        end;
      if Result = False then Break;
    end;
  { Check for valid Double range }
  if Result = True then
    Result := (Abs(StrToFloat(AString)) <= MaxDouble);
end;

function VarIsInteger(const AValue : Variant): Boolean;
begin
  Result := FindVarData(AValue)^.VType in [varSmallInt, varInteger
  {$IFDEF DELPHI6}
    , varInt64,
    varLongWord, varShortInt, varByte, varWord
  {$ENDIF}
    ];
end;

function VarIsDouble(const AValue : Variant): Boolean;
begin
  Result := FindVarData(AValue)^.VType in [varCurrency, varDouble, varSingle];
end;

{$IFDEF DELPHI6}
function GetMaxVarInteger(const AValue : Variant): Int64;
{$ELSE}
function GetMaxVarInteger(const AValue : Variant): Integer;
{$ENDIF}
begin
  case FindVarData(AValue)^.VType of
    varSmallInt: Result := High(SmallInt);
    varInteger: Result := High(Integer);
{$IFDEF DELPHI6}
    varInt64: Result := High(Int64);
    varLongWord: Result := High(LongWord);
    varShortInt: Result := High(ShortInt);
    varByte: Result := High(Byte);
    varWord: Result := High(Word);
{$ENDIF}
    else Result := 0;
  end;
end;

function GetMaxVarDouble(const AValue : Variant): Extended;
begin
  case FindVarData(AValue)^.VType of
    varCurrency: Result := MaxExtended;
    varDouble: Result := MaxDouble;
    varSingle: Result := MaxSingle;
    else Result := 0;
  end;
end;

function cxStrToInt(const AValue: string; const AToFirstNonNum: Boolean = False): Integer;
var
  I: Integer;
  AIntValue: string;
begin
  AIntValue := '';
  for I := 1 to Length(AValue) do
  begin
    if AValue[I] in ['0'..'9','-'] then
      AIntValue := AIntValue + AValue[I]
    else
      if AToFirstNonNum = True then Break;
  end;
  if AIntValue = '' then AIntValue := '0';
  Result := StrToInt(AIntValue);
end;

function cxStrToFloat(const AValue: string; const AToFirstNonNum: Boolean = False): Extended;
var
  I: Integer;
  AExtValue: string;
begin
  AExtValue := '';
  for I := 1 to Length(AValue) do
  begin
    if AValue[I] in ['0'..'9','-',DecimalSeparator] then
      AExtValue := AExtValue + AValue[I]
    else
      if AToFirstNonNum = True then Break;
  end;
  if AExtValue = '' then
    AExtValue := '0';
  Result := StrToFloat(AExtValue);
end;

function cxStringToColor(const AString: string; out Valid: Boolean): TColor;
begin
  Valid := True;
  if not IdentToColor(AString, Longint(Result)) then
  begin
    Valid := IsValidStringForInt(AString);
    Result := TColor(cxStrToInt(AString));
  end;
end;

function cxRGBStringColorToColor(const AString: string): TColor;
var
  I, FPos: Integer;
  R, G, B: Integer;
  S, FSColor: string;
begin
  R := 0;
  G := 0;
  B := 0;
  FSColor := AString;
  for I := 1 to 3 do
  begin
    S := '';
    FPos := Pos('.', FSColor);
    if (FPos > 0) then
      S := Copy(FSColor, 1, FPos - 1)
    else
      S := FSColor;
    FSColor := Copy(FSColor, FPos + 1, Length(FSColor) - FPos);
    case I of
      1: R := cxStrToInt(S);
      2: G := cxStrToInt(S);
      3: B := cxStrToInt(S);
    end;
  end;
  Result := RGB(R, G, B);
end;

function cxHexRGBStringColorToColor(const AString: string): TColor;
var
  R, G, B: Integer;
  S: string;

  function RemoveNonHexChars(const AString: string): string;
  var
    I: Integer;
  begin
    Result := '';
    for I := 1 to Length(AString) do
      if AString[I] in ['0'..'9','A'..'F','a'..'f'] then
        Result := Result + AString[I];
  end;

  function HexStrToInt(const S: string): Longint;
  var
    HexStr: string;
  begin
    if Pos('$', S) = 0 then
      HexStr := '$' + S
    else
      HexStr := S;
    Result := StrToIntDef(HexStr, 0);
  end;

  function IntToByte(const Value: Integer): Byte;
  begin
    if Value > MaxByte then
      Result := MaxByte
    else
      Result := Value;
  end;

begin
  S := RemoveNonHexChars(AString);
  R := IntToByte(HexStrToInt(Copy(S, 1, 2)));
  G := IntToByte(HexStrToInt(Copy(S, 3, 2)));
  B := IntToByte(HexStrToInt(Copy(S, 5, 2)));
  Result := RGB(R, G, B);
end;

procedure DrawBottomRightThumb(ACanvas: TcxCanvas; const AThumbRect: TRect;
  const AOrientation: TcxTrackBarOrientation; const AThumbSize: Integer;
  const AKind: TcxLookAndFeelKind; const AThumbColor: TColor);
var
  FX, FY: Integer;
  FLightPolyLine: array[0..3] of TPoint;
  FShadowPolyLine: array[0..2] of TPoint;
  FDarkPolyLine: array[0..2] of TPoint;
  FPolygon: array[0..5] of TPoint;
begin
  if AOrientation = tboVertical then
  begin
    FX := AThumbRect.Right - (AThumbSize div 2);

    FLightPolyLine[0] := Point(AThumbRect.Left, AThumbRect.Bottom);
    FLightPolyLine[1] := Point(AThumbRect.Left, AThumbRect.Top);
    FLightPolyLine[2] := Point(FX, AThumbRect.Top);
    FLightPolyLine[3] := Point(AThumbRect.Right, AThumbRect.Top + (AThumbSize div 2));

    FShadowPolyLine[0] := Point(AThumbRect.Left + 1, AThumbRect.Bottom);
    FShadowPolyLine[1] := Point(AThumbRect.Right - (AThumbSize div 2), AThumbRect.Bottom);
    FShadowPolyLine[2] := Point(AThumbRect.Right - 1, AThumbRect.Bottom - (AThumbSize div 2) + 1);

    FDarkPolyLine[0] := Point(AThumbRect.Left, AThumbRect.Bottom + 1);
    FDarkPolyLine[1] := Point(AThumbRect.Right - (AThumbSize div 2), AThumbRect.Bottom + 1);
    FDarkPolyLine[2] := Point(AThumbRect.Right, AThumbRect.Bottom - (AThumbSize div 2) + 1);

    FPolygon[0] := Point(AThumbRect.Left + 1, AThumbRect.Bottom);
    FPolygon[1] := Point(AThumbRect.Left + 1, AThumbRect.Top + 1);
    FPolygon[2] := Point(FX, AThumbRect.Top + 1);
    FPolygon[3] := Point(AThumbRect.Right - 1, AThumbRect.Top + (AThumbSize div 2));
    FPolygon[4] := Point(AThumbRect.Right - 1, AThumbRect.Top + (AThumbSize div 2) + 1);
    FPolygon[5] := Point(AThumbRect.Right - (AThumbSize div 2), AThumbRect.Bottom);
  end else
  begin
    FY := AThumbRect.Bottom - (AThumbSize div 2);

    FLightPolyLine[0] := Point(AThumbRect.Right, AThumbRect.Top);
    FLightPolyLine[1] := Point(AThumbRect.Left, AThumbRect.Top);
    FLightPolyLine[2] := Point(AThumbRect.Left, FY);
    FLightPolyLine[3] := Point(AThumbRect.Left + (AThumbSize div 2), AThumbRect.Bottom);

    FShadowPolyLine[0] := Point(AThumbRect.Left + (AThumbSize div 2), AThumbRect.Bottom - 1);
    FShadowPolyLine[1] := Point(AThumbRect.Right - 1, FY);
    FShadowPolyLine[2] := Point(AThumbRect.Right - 1, AThumbRect.Top + 1);

    FDarkPolyLine[0] := Point(AThumbRect.Left + (AThumbSize div 2), AThumbRect.Bottom);
    FDarkPolyLine[1] := Point(AThumbRect.Right, FY);
    FDarkPolyLine[2] := Point(AThumbRect.Right, AThumbRect.Top);

    FPolygon[0] := Point(AThumbRect.Right - 1, AThumbRect.Top + 1);
    FPolygon[1] := Point(AThumbRect.Left + 1, AThumbRect.Top + 1);
    FPolygon[2] := Point(AThumbRect.Left + 1, FY);
    FPolygon[3] := Point(AThumbRect.Left + (AThumbSize div 2) - 1, AThumbRect.Bottom - 1);
    FPolygon[4] := Point(AThumbRect.Left + (AThumbSize div 2), AThumbRect.Bottom - 1);
    FPolygon[5] := Point(AThumbRect.Right  - 1, FY);
  end;
  InternalPolyLine(ACanvas, FLightPolyLine, clWindow);
  InternalPolyLine(ACanvas, FShadowPolyLine, clBtnShadow);
  InternalPolyLine(ACanvas, FDarkPolyLine, clWindowText);
  ACanvas.Pen.Color := AThumbColor;
  ACanvas.Brush.Color := AThumbColor;
  ACanvas.Polygon(FPolygon);
  case AKind of
    lfStandard:
    begin
      InternalPolyLine(ACanvas, FLightPolyLine, clWindow);
      InternalPolyLine(ACanvas, FShadowPolyLine, clBtnShadow);
      InternalPolyLine(ACanvas, FDarkPolyLine, clWindowText);
    end;
    lfFlat:
    begin
      InternalPolyLine(ACanvas, FLightPolyLine, clWindow);
      InternalPolyLine(ACanvas, FDarkPolyLine, clBtnShadow);
    end;
    lfUltraFlat:
    begin
      InternalPolyLine(ACanvas, FLightPolyLine, clWindowText);
      InternalPolyLine(ACanvas, FDarkPolyLine, clWindowText);
    end;
  end;
end;

procedure DrawTopLeftThumb(ACanvas: TcxCanvas; const AThumbRect: TRect;
  const AOrientation: TcxTrackBarOrientation; const AThumbSize: Integer;
  const AKind: TcxLookAndFeelKind; const AThumbColor: TColor);
var
  FX, FY: Integer;
  FLightPolyLine: array[0..2] of TPoint;
  FShadowPolyLine: array[0..3] of TPoint;
  FDarkPolyLine: array[0..3] of TPoint;
  FPolygon: array[0..5] of TPoint;
begin
  if AOrientation = tboVertical then
  begin
    FX := AThumbRect.Left + (AThumbSize div 2);

    FLightPolyLine[0] := Point(AThumbRect.Right, AThumbRect.Top);
    FLightPolyLine[1] := Point(FX, AThumbRect.Top);
    FLightPolyLine[2] := Point(AThumbRect.Left, AThumbRect.Top + (AThumbSize div 2));

    FShadowPolyLine[0] := Point(AThumbRect.Right - 1, AThumbRect.Top + 1);
    FShadowPolyLine[1] := Point(AThumbRect.Right - 1, AThumbRect.Bottom);
    FShadowPolyLine[2] := Point(AThumbRect.Left + (AThumbSize div 2), AThumbRect.Bottom);
    FShadowPolyLine[3] := Point(AThumbRect.Left + 1, AThumbRect.Bottom - (AThumbSize div 2) + 1);

    FDarkPolyLine[0] := Point(AThumbRect.Right, AThumbRect.Top);
    FDarkPolyLine[1] := Point(AThumbRect.Right, AThumbRect.Bottom + 1);
    FDarkPolyLine[2] := Point(AThumbRect.Left + (AThumbSize div 2), AThumbRect.Bottom + 1);
    FDarkPolyLine[3] := Point(AThumbRect.Left, AThumbRect.Bottom - (AThumbSize div 2) + 1);

    FPolygon[0] := Point(AThumbRect.Right - 2, AThumbRect.Bottom);
    FPolygon[1] := Point(AThumbRect.Right - 2, AThumbRect.Top + 1);
    FPolygon[2] := Point(FX, AThumbRect.Top + 1);
    FPolygon[3] := Point(AThumbRect.Left + 1, AThumbRect.Top + (AThumbSize div 2));
    FPolygon[4] := Point(AThumbRect.Left + 1, AThumbRect.Top + (AThumbSize div 2) + 1);
    FPolygon[5] := Point(AThumbRect.Left + (AThumbSize div 2), AThumbRect.Bottom);
  end else
  begin
    FY := AThumbRect.Top + (AThumbSize div 2);

    FLightPolyLine[0] := Point(AThumbRect.Left, AThumbRect.Bottom);
    FLightPolyLine[1] := Point(AThumbRect.Left, FY);
    FLightPolyLine[2] := Point(AThumbRect.Left + (AThumbSize div 2), AThumbRect.Top);

    FShadowPolyLine[0] := Point(AThumbRect.Left + (AThumbSize div 2), AThumbRect.Top + 1);
    FShadowPolyLine[1] := Point(AThumbRect.Right - 1, FY);
    FShadowPolyLine[2] := Point(AThumbRect.Right - 1, AThumbRect.Bottom - 1);
    FShadowPolyLine[3] := Point(AThumbRect.Left, AThumbRect.Bottom - 1);

    FDarkPolyLine[0] := Point(AThumbRect.Left + (AThumbSize div 2), AThumbRect.Top);
    FDarkPolyLine[1] := Point(AThumbRect.Right, FY);
    FDarkPolyLine[2] := Point(AThumbRect.Right, AThumbRect.Bottom);
    FDarkPolyLine[3] := Point(AThumbRect.Left, AThumbRect.Bottom);

    FPolygon[0] := Point(AThumbRect.Right - 1, AThumbRect.Bottom - 2);
    FPolygon[1] := Point(AThumbRect.Left + 1, AThumbRect.Bottom - 2);
    FPolygon[2] := Point(AThumbRect.Left + 1, FY);
    FPolygon[3] := Point(AThumbRect.Left + (AThumbSize div 2) - 1, AThumbRect.Top + 2);
    FPolygon[4] := Point(AThumbRect.Left + (AThumbSize div 2), AThumbRect.Top + 2);
    FPolygon[5] := Point(AThumbRect.Right  - 1, FY);
  end;
  ACanvas.Pen.Color := AThumbColor;
  ACanvas.Brush.Color := AThumbColor;
  ACanvas.Polygon(FPolygon);
  case AKind of
    lfStandard:
    begin
      InternalPolyLine(ACanvas, FLightPolyLine, clWindow);
      InternalPolyLine(ACanvas, FShadowPolyLine, clBtnShadow);
      InternalPolyLine(ACanvas, FDarkPolyLine, clWindowText);
    end;
    lfFlat:
    begin
      InternalPolyLine(ACanvas, FLightPolyLine, clWindow);
      InternalPolyLine(ACanvas, FDarkPolyLine, clBtnShadow);
    end;
    lfUltraFlat:
    begin
      InternalPolyLine(ACanvas, FLightPolyLine, clWindowText);
      InternalPolyLine(ACanvas, FDarkPolyLine, clWindowText);
    end;
  end;
end;

function CheckStateToString(const Value: TcxCheckBoxState): string;
begin
  case Value of
    cbsChecked: Result := '1';
    cbsGrayed: Result := '2';
    else Result := '0';
  end;
end;

function StringToCheckState(const Value: string; const AllowGrayed: Boolean): TcxCheckBoxState;
begin
  if AllowGrayed then
  begin
    if Value = '1' then Result := cbsChecked
     else if Value = '0' then Result := cbsUnchecked
      else Result := cbsGrayed;
  end
  else
  begin
    if Value = '1' then Result := cbsChecked
      else Result := cbsUnchecked;
  end;
end;

function CurrentShiftState: TShiftState;
{$IFDEF DELPHI5}
var
  KeyState: TKeyboardState;
{$ENDIF}
begin
  {$IFDEF DELPHI5}
  GetKeyboardState(KeyState);
  Result := KeyboardStateToShiftState(KeyState);
  {$ELSE}
  Result := [];
  if GetAsyncKeyState(VK_SHIFT) <> 0 then Include(Result, ssShift);
  if GetAsyncKeyState(VK_CONTROL) <> 0 then Include(Result, ssCtrl);
  if GetAsyncKeyState(VK_MENU) <> 0 then Include(Result, ssAlt);
  if GetAsyncKeyState(VK_LBUTTON) <> 0 then Include(Result, ssLeft);
  if GetAsyncKeyState(VK_RBUTTON) <> 0 then Include(Result, ssRight);
  if GetAsyncKeyState(VK_MBUTTON) <> 0 then Include(Result, ssMiddle);
  {$ENDIF}
end;

function GetWord(const APosition: Integer; const S: string;
  const Delimiter: Char): string;
var
  I, FPos: Integer;
  FStr: string;
begin
  Result := '';
  if APosition <= 0 then Exit;
  FStr := S;
  I := 1;
  FPos := Pos(Delimiter, FStr);
  if FPos = 0 then
  begin
    if APosition = 1 then Result := S;
  end
  else
  begin
    while FPos > 0 do
    begin
      if I = APosition then
      begin
        Result := Copy(FStr, 1, FPos - 1);
        Break;
      end
      else
        FStr := Copy(FStr, FPos + 1, Length(FStr));
      Inc(I);
      if FStr = '' then Break;
      FPos := Pos(Delimiter, FStr);
      if (FPos = 0) and (I = APosition) then
        Result := FStr;
    end;
  end;
end;

procedure PaintBackground(const AControl: TWinControl; DC: HDC; DoParent: Boolean);
var
  P: TPoint;
  FSaveIndex: Integer;
begin
  if Assigned(AControl) and (Assigned(AControl.Parent) and DoParent) then
  begin
    FSaveIndex := SaveDC(DC);
    try
      P := AControl.ClientOrigin;
      Windows.ScreenToClient(AControl.Parent.Handle, P);
      MoveWindowOrg(DC, -P.X, -P.Y);
      if Assigned(AControl.Parent) and DoParent then
      begin
        SendMessage(AControl.Parent.Handle, WM_ERASEBKGND, DC, 0);
        TWinControlAccess(AControl.Parent).PaintControls(DC, nil);
      end
      else
      begin
        SendMessage(AControl.Handle, WM_ERASEBKGND, DC, 0);
        TWinControlAccess(AControl).PaintControls(DC, nil);
      end;
    finally
      RestoreDC(DC, FSaveIndex);
    end;
  end;
end;

{$IFNDEF DELPHI5}
function SameText(const S1, S2: string): Boolean; assembler;
asm
        CMP     EAX,EDX
        JZ      @1
        OR      EAX,EAX
        JZ      @2
        OR      EDX,EDX
        JZ      @3
        MOV     ECX,[EAX-4]
        CMP     ECX,[EDX-4]
        JNE     @3
        CALL    CompareText
        TEST    EAX,EAX
        JNZ     @3
@1:     MOV     AL,1
@2:     RET
@3:     XOR     EAX,EAX
end;
{$ENDIF}

end.
