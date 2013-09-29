
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

unit cxGroupBox;

{$I cxExtEdVer.inc}

interface

uses
{$IFDEF VCL}
  Windows, Messages,
{$ENDIF}
  SysUtils, Classes, Controls, Graphics, Forms, cxControls, cxGraphics,
  cxExtEditConsts, cxLookAndFeels, cxContainer, cxEditPaintUtils;

type
  TcxAlignment = (alTopLeft, alTopCenter, alTopRight,
    alBottomLeft, alBottomCenter, alBottomRight,
    alLeftTop, alLeftCenter, alLeftBottom,
    alRightTop, alRightCenter, alRightBottom,
    alCenterCenter);

  { TcxCustomGroupBox }

  TcxCustomGroupBox = class(TcxControl)
  private
    FAlignment: TcxAlignment;
    FCaptionBkColor: TColor;
    procedure SetAlignment(Value: TcxAlignment);
    procedure SetCaptionBkColor(Value: TColor);
    procedure WMEraseBkgnd(var Message: TWMEraseBkgnd); message WM_ERASEBKGND;
    procedure WMPrintClient(var Message: TMessage); message WM_PRINTCLIENT;
    procedure CMDialogChar(var Message: TCMDialogChar); message CM_DIALOGCHAR;
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;
    procedure CMParentColorChanged(var Message: TMessage); message CM_PARENTCOLORCHANGED;
  protected
    procedure AdjustClientRect(var Rect: TRect); override;
    procedure LookAndFeelChanged(Sender: TcxLookAndFeel;
      AChangedValues: TcxLookAndFeelValues); override;
    function NeedsScrollBars: Boolean; override;
    procedure Paint; override;
    property Alignment: TcxAlignment read FAlignment write SetAlignment;
    property CaptionBkColor: TColor read FCaptionBkColor write SetCaptionBkColor;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  { TcxGroupBox }
  TcxGroupBox = class(TcxCustomGroupBox)
  published
    property Align;
    property Alignment;
    property Anchors;
    property Caption;
    property CaptionBkColor default clBtnFace;
    property Color;
    property Constraints;
    property DragMode;
    property Enabled;
    property Font;
    property LookAndFeel;
    property ParentBiDiMode;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop default True;
    property Visible;
{$IFDEF VCL}
    property BiDiMode;
    property Ctl3D;
    property DragCursor;
    property DragKind;
{$ENDIF}
    property OnClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnStartDrag;
{$IFDEF DELPHI5}
    property OnContextPopup;
{$ENDIF}
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
  cxEditUtils;

{ TcxCustomGroupBox }
constructor TcxCustomGroupBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csAcceptsControls, csCaptureMouse, csClickEvents];
  SetBounds(Left, Top, 185, 105);
  if ParentColor then
    CaptionBkColor := Color;
  TabStop := True;
end;

procedure TcxCustomGroupBox.SetAlignment(Value: TcxAlignment);
begin
  if FAlignment <> Value then
  begin
    FAlignment := Value;
    Invalidate;
    Realign;
  end;
end;

procedure TcxCustomGroupBox.SetCaptionBkColor(Value: TColor);
begin
  if FCaptionBkColor <> Value then
  begin
    FCaptionBkColor := Value;
    Invalidate;
  end;
end;

procedure TcxCustomGroupBox.WMEraseBkgnd(var Message: TWMEraseBkgnd);
var
  ANativeState: Integer;
  ATheme: TTheme;
  R: TRect;
begin
  if not AreVisualStylesMustBeUsed(LookAndFeel.NativeStyle, totButton) then
    Exit;
  Message.Result := 1;
  ATheme := OpenTheme(totButton);
  if Enabled then
    ANativeState := GBS_NORMAL
  else
    ANativeState := GBS_DISABLED;
  R := GetControlRect(Self);
  if IsThemeBackgroundPartiallyTransparent(ATheme, BP_GROUPBOX, ANativeState) then
    DrawThemeParentBackground(Handle, Message.DC, @R);
end;

procedure TcxCustomGroupBox.WMPrintClient(var Message: TMessage);
begin
  if not AreVisualStylesMustBeUsed(LookAndFeel.NativeStyle, totButton) and
      ((Message.LParam and PRF_CHECKVISIBLE = 0) or Visible) then
    cxEditFillRect(Message.WParam, ClientRect, GetSolidBrush(Color))
  else
    inherited;
end;

procedure TcxCustomGroupBox.CMParentColorChanged(var Message: TMessage);
begin
  inherited;
  if ParentColor then
    CaptionBkColor := Color;
end;

procedure TcxCustomGroupBox.CMDialogChar(var Message: TCMDialogChar);
begin
  with Message do
    if IsAccel(CharCode, Caption) and CanFocus then
    begin
      SelectFirst;
      Result := 1;
    end else
      inherited;
end;

procedure TcxCustomGroupBox.CMTextChanged(var Message: TMessage);
begin
  inherited;
  Invalidate;
end;

procedure TcxCustomGroupBox.LookAndFeelChanged(Sender: TcxLookAndFeel;
  AChangedValues: TcxLookAndFeelValues);
begin
  inherited LookAndFeelChanged(Sender, AChangedValues);
  Invalidate;
end;

procedure TcxCustomGroupBox.AdjustClientRect(var Rect: TRect);
begin
  inherited AdjustClientRect(Rect);

  Canvas.Font := Font;
  case FAlignment of
    alTopLeft, alTopCenter, alTopRight: Inc(Rect.Top, Canvas.TextHeight('0'));
    alLeftTop, alLeftCenter, alLeftBottom: Inc(Rect.Left, Canvas.TextHeight('0'));
    alRightTop, alRightCenter, alRightBottom: Dec(Rect.Right, Canvas.TextHeight('0'));
    alBottomLeft, alBottomCenter, alBottomRight: Dec(Rect.Bottom, Canvas.TextHeight('0'));
  end;

  InflateRect(Rect, -1, -1);

  if Ctl3d then
    InflateRect(Rect, -1, -1);
end;

function TcxCustomGroupBox.NeedsScrollBars: Boolean;
begin
  Result := False; 
end;

procedure TcxCustomGroupBox.Paint;
var
  H, W, D, tX, tY: Integer;
  ATextRect, ABodyRect, AControlRect: TRect;
  Ft : hFont;
  TTM : TTextMetric;
  TLF   : TLogFont;
  ACaptionSize: TSize;
{$IFDEF VCL}
  ANativeState: Integer;
  ATheme: TTheme;
  ARgn: TcxRegion;
  AColor: Cardinal;
{$ENDIF}
begin
  inherited Paint;

  with Canvas do
  begin
    // Initial settings
    Brush.Color := Self.Color;
    Font := Self.Font;
    tX := 0;
    tY := 0;

    // Adjustments
    H := TextHeight('0');
    W := TextWidth(Text);
    if FAlignment in [alLeftTop, alLeftCenter, alLeftBottom, alRightTop,
       alRightCenter, alRightBottom] then begin
      GetTextMetrics(Handle, TTM);
      if (TTM.tmPitchAndFamily and TMPF_TRUETYPE) = 0 then begin
        Font.Name := 'Arial';
        H := TextHeight('Wg');
        W := TextWidth(Text);
      end;
    end;
    D := H div 2 - 1;

    // ABodeRect calculations
    ABodyRect := ClientRect;
    case FAlignment of
      alTopLeft, alTopCenter, alTopRight: ABodyRect.Top := ABodyRect.Top + D;
      alLeftTop, alLeftCenter, alLeftBottom: ABodyRect.Left := ABodyRect.Left + D;
      alRightTop, alRightCenter, alRightBottom: ABodyRect.Right := ABodyRect.Right - D;
      alBottomLeft, alBottomCenter, alBottomRight: ABodyRect. Bottom := ABodyRect.Bottom - D;
    end;

    // ATextRect calculations
    if Text <> '' then
    begin
      case FAlignment of
        alTopLeft:
        begin
          ATextRect := Rect(8, 1, 8 + W, H);
          tX := 8;
          tY := 0;
        end;
        alTopCenter:
        begin
          ATextRect := Rect((Width - W) div 2, 1, (Width - W) div 2 + W, H);
          tX := (Width - W) div 2;
          tY := 0;
        end;
        alTopRight:
        begin
          ATextRect := Rect(Width - W - 8, 1, Width - 8, H);
          tX := Width - W - 8;
          tY := 0;
        end;
        alBottomLeft:
        begin
          ATextRect := Rect(8, Height - H, 8 + W, Height);
          tX := 8;
          tY := Height - H;
        end;
        alBottomCenter:
        begin
          ATextRect := Rect((Width - W) div 2, Height - H, (Width - W) div 2 + W, Height);
          tX := (Width - W) div 2;
          tY := Height - H;
        end;
        alBottomRight:
        begin
          ATextRect := Rect(Width - W - 8, Height - H, Width - 8, Height);
          tX := Width - W - 8;
          tY := Height - H;
        end;
        alLeftTop:
        begin
          ATextRect := Rect(0, 8, H, 8 + W);
          tX := 0;
          tY := 8 + W;
        end;
        alLeftCenter:
        begin
          ATextRect := Rect(0, (Height - W) div 2, H, (Height - W) div 2 + W);
          tX := 0;
          tY := (Height - W) div 2 + W;
        end;
        alLeftBottom:
        begin
          ATextRect := Rect(0, Height - W - 8, H, Height - 8);
          tX := 0;
          tY := Height - 8;
        end;
        alRightTop:
        begin
          ATextRect := Rect(Width - H, 8, Width, 8 + W);
          tX := Width;
          tY := 8;
        end;
        alRightCenter:
        begin
          ATextRect := Rect(Width - H, (Height - W) div 2, Width, (Height - W) div 2 + W);
          tX := Width;
          tY := (Height - W) div 2;
        end;
        alRightBottom:
        begin
          ATextRect := Rect(Width - H, Height - W - 8, Width, Height - 8);
          tX := Width;
          tY := Height - 8 -W;
        end;
        alCenterCenter:
        begin
          ATextRect := Rect((Width - W) div 2, (Height - H) div 2, (Width - W) div 2 + W, (Height - H) div 2 + H);
          tX := (Width - W) div 2;
          tY := (Height - H) div 2;
        end;
        else
        begin
          ATextRect := Rect (8, 0, 8 + W, H);
          tX := 0;
          tY := 0;
        end;
      end;

      if FAlignment in [alLeftTop, alLeftCenter, alLeftBottom] then begin
        GetTextMetrics(Handle, TTM);
        if (TTM.tmPitchAndFamily and TMPF_TRUETYPE) = 0 then
          Font.Name := 'Arial';
        GetObject(Font.Handle, SizeOf(TLF), @TLF);
        TLF.lfEscapement := 900;
        Ft := CreateFontIndirect(TLF);
        Font.Handle := Ft;
      end;
      if FAlignment in [alRightTop, alRightCenter, alRightBottom] then begin
        GetTextMetrics(Handle, TTM);
        if (TTM.tmPitchAndFamily and TMPF_TRUETYPE) = 0 then
          Font.Name := 'Arial';
        GetObject(Font.Handle, SizeOf(TLF), @TLF);
        TLF.lfEscapement := 2700;
        Ft := CreateFontIndirect(TLF);
        Font.Handle := Ft;
      end;
    end;

{$IFDEF VCL}
    if AreVisualStylesMustBeUsed(LookAndFeel.NativeStyle, totButton) then
    begin
      if Caption = '' then
        FillChar(ATextRect, SizeOf(ATextRect), 0)
      else
      begin
        GetTextExtentPoint32(Handle, PChar(Caption),
          Length(Caption), ACaptionSize);

        ARgn := GetClipRegion;
        AControlRect := GetControlRect(Self);
        ExcludeClipRect(ATextRect);

        ATheme := OpenTheme(totButton);
        if Enabled then
          ANativeState := GBS_NORMAL
        else
          ANativeState := GBS_DISABLED;

        if IsThemeBackgroundPartiallyTransparent(ATheme, BP_GROUPBOX, ANativeState) then
          DrawThemeParentBackground(Handle, Canvas.Handle, @AControlRect)
        else
          cxEditFillRect(Canvas.Handle, AControlRect, GetSolidBrush(Canvas, Self.Color));

        DrawThemeBackground(ATheme, Canvas.Handle, BP_GROUPBOX, ANativeState, @ABodyRect);

        SetClipRegion(ARgn, roSet);
        Brush.Style := bsSolid;
        GetThemeColor(ATheme, BP_GROUPBOX, ANativeState, TMT_TEXTCOLOR, AColor);
        Font.Color := AColor;
      end;
    end else
{$ENDIF}
    begin
      // Not native drawing
      FillRect(ClientRect);
      case LookAndFeel.Kind of
        lfUltraFlat:
          begin
            Brush.Color := clBtnFace;
            FrameRect(ABodyRect);
            InflateRect(ABodyRect, -1, -1);
            Brush.Color := clBtnShadow;
            FrameRect(ABodyRect);
          end;
        lfFlat:
          begin
            Brush.Color := clBtnHighLight;
            FrameRect(ABodyRect);
            InflateRect(ABodyRect, -1, -1);
            Brush.Color := clBtnShadow;
            FrameRect(ABodyRect);
          end;
        lfStandard:
          begin
            Brush.Color := clBtnHighlight;
            FrameRect(ABodyRect);
            OffsetRect(ABodyRect, -1, -1);
            Brush.Color := clBtnShadow;
            FrameRect(ABodyRect);
          end;
      end;
      Brush.Color := Self.Color;
      FillRect(ATextRect);
      Brush.Color := FCaptionBkColor;
    end;

    SetBkMode(Handle, TRANSPARENT);
    if FAlignment in [alLeftTop, alLeftCenter, alLeftBottom, alRightTop,
      alRightCenter, alRightBottom] then
      ExtTextOut(Handle, tX, tY, ETO_CLIPPED, @ATextRect, PChar(Text), Length(Text), nil)
    else
      DrawText(Text, ATextRect, cxShowPrefix or cxSingleLine);
  end;
end;
{ TcxCustomGroupBox }

end.
