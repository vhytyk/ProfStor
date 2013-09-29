{*******************************************************************}
{                                                                   }
{       Developer Express Visual Component Library                  }
{       ExpressNavBar                                               }
{                                                                   }
{       Copyright (c) 2002-2003 Developer Express Inc.              }
{       ALL RIGHTS RESERVED                                         }
{                                                                   }
{   The entire contents of this file is protected by U.S. and       }
{   International Copyright Laws. Unauthorized reproduction,        }
{   reverse-engineering, and distribution of all or any portion of  }
{   the code contained in this file is strictly prohibited and may  }
{   result in severe civil and criminal penalties and will be       }
{   prosecuted to the maximum extent possible under the law.        }
{                                                                   }
{   RESTRICTIONS                                                    }
{                                                                   }
{   THIS SOURCE CODE AND ALL RESULTING INTERMEDIATE FILES           }
{   (DCU, OBJ, DLL, ETC.) ARE CONFIDENTIAL AND PROPRIETARY TRADE    }
{   SECRETS OF DEVELOPER EXPRESS INC. THE REGISTERED DEVELOPER IS   }
{   LICENSED TO DISTRIBUTE THE EXPRESSBARS AND ALL ACCOMPANYING VCL }
{   CONTROLS AS PART OF AN EXECUTABLE PROGRAM ONLY.                 }
{                                                                   }
{   THE SOURCE CODE CONTAINED WITHIN THIS FILE AND ALL RELATED      }
{   FILES OR ANY PORTION OF ITS CONTENTS SHALL AT NO TIME BE        }
{   COPIED, TRANSFERRED, SOLD, DISTRIBUTED, OR OTHERWISE MADE       }
{   AVAILABLE TO OTHER INDIVIDUALS WITHOUT EXPRESS WRITTEN CONSENT  }
{   AND PERMISSION FROM DEVELOPER EXPRESS INC.                      }
{                                                                   }
{   CONSULT THE END USER LICENSE AGREEMENT FOR INFORMATION ON       }
{   ADDITIONAL RESTRICTIONS.                                        }
{                                                                   }
{*******************************************************************}

unit dxNavBarGraphics;

{$I dxNavBarVer.inc}

interface

uses
  Windows, Classes, Controls, CommCtrl, Graphics, ImgList, jpeg,
  dxGDIPlusAPI, dxGDIPlusClasses, dxUxTheme, dxThemeManager, dxThemeConsts,
  dxNavBar, dxNavBarStyles;

type
  TdxNavBarBackgroundPainter = class(TdxBaseBackgroundPainter)
  protected
    class procedure DrawPicture(ACanvas: TCanvas; R: TRect; APicture: TPicture);
    class procedure InternalDrawBackground(ACanvas: TCanvas; R: TRect; APicture: TPicture;
      AEraseBackground: Boolean; AColor1, AColor2: TColor; AAlphaBlend1, AAlphaBlend2: Byte;
      AGradientMode: TdxBarStyleGradientMode); override;
  end;

  TdxNavBarImagePainter = class(TdxBaseImagePainter)
  protected
    class function GetRGBColor(Value: TColor): DWORD;
    class procedure InternalDrawImage(ACanvas: TCanvas; AImageList: TImageList; AImageIndex: Integer; R: TRect); override;
  end;

  TdxNavBarSelectionPainter = class(TdxBaseSelectionPainter)
  protected
    class procedure InternalDrawSelection(ACanvas: TCanvas; ARect: TRect;
        ABackColor: TColor; AState: TdxNavBarObjectStates); override;
  end;

  TdxNavBarUltraFlatSelectionPainter = class(TdxBaseSelectionPainter)
  protected
    class function FlatBarItemPressedBackColor: TColor;
    class function FlatBarItemHighLightBackColor: TColor;
    class procedure InternalDrawSelection(ACanvas: TCanvas; ARect: TRect;
        ABackColor: TColor; AState: TdxNavBarObjectStates); override;
  end;

  TdxNavBarVSToolBoxSelectionPainter = class(TdxBaseSelectionPainter)
  protected
    class procedure InternalDrawSelection(ACanvas: TCanvas; ARect: TRect;
        ABackColor: TColor; AState: TdxNavBarObjectStates); override;
  end;

  TdxNavBarExplorerBarSignPainter = class(TdxBaseSignPainter)
  protected
    class procedure DrawSignSelection(ACanvas: TCanvas; ARect: TRect; AForeColor,
        ABackColor: TColor; AState: TdxNavBarObjectStates); virtual;
    class procedure InternalDrawSign(ACanvas: TCanvas; ARect: TRect; AForeColor,
        ABackColor: TColor; AState: TdxNavBarObjectStates); override;
  end;

  TdxNavBarAdvExplorerBarSignPainter = class(TdxNavBarExplorerBarSignPainter)
  protected
    class procedure DrawSignSelection(ACanvas: TCanvas; ARect: TRect; AForeColor,
        ABackColor: TColor; AState: TdxNavBarObjectStates); override;
  end;

  TdxNavBarHintPainter = class(TdxBaseHintPainter)
  protected
    class procedure InternalDrawHint(ACanvas: TCanvas; ARect: TRect; AHint: string;
        APicture: TPicture; AColor1, AColor2: TColor; AAlphaBlend1, AAlphaBlend2: Byte;
        AGradientMode: TdxBarStyleGradientMode; AFont: TFont); override;
  end;

  TdxNavBarButtonPainter = class(TdxBaseButtonPainter)
  protected
    class procedure InternalDrawButton(ACanvas: TCanvas; ARect: TRect; APicture: TPicture;
        AColor1, AColor2: TColor; AAlphaBlend1, AAlphaBlend2: Byte;
        AGradientMode: TdxBarStyleGradientMode; AState: TdxNavBarObjectStates); override;
  end;

  TdxNavBarFlatButtonPainter = class(TdxBaseButtonPainter)
  protected
    class procedure InternalDrawButton(ACanvas: TCanvas; ARect: TRect; APicture: TPicture;
        AColor1, AColor2: TColor; AAlphaBlend1, AAlphaBlend2: Byte;
        AGradientMode: TdxBarStyleGradientMode; AState: TdxNavBarObjectStates); override;
  end;

  TdxNavBarVSToolBoxButtonPainter = class(TdxBaseButtonPainter)
  protected
    class procedure InternalDrawButton(ACanvas: TCanvas; ARect: TRect; APicture: TPicture;
        AColor1, AColor2: TColor; AAlphaBlend1, AAlphaBlend2: Byte;
        AGradientMode: TdxBarStyleGradientMode; AState: TdxNavBarObjectStates); override;
  end;

  TdxNavBarOfficeButtonPainter = class(TdxBaseButtonPainter)
  protected
    class procedure InternalDrawButton(ACanvas: TCanvas; ARect: TRect; APicture: TPicture;
        AColor1, AColor2: TColor; AAlphaBlend1, AAlphaBlend2: Byte;
        AGradientMode: TdxBarStyleGradientMode; AState: TdxNavBarObjectStates); override;
  end;

  TdxNavBarExplorerButtonPainter = class(TdxBaseButtonPainter)
  protected
    class procedure InternalDrawButton(ACanvas: TCanvas; ARect: TRect; APicture: TPicture;
        AColor1, AColor2: TColor; AAlphaBlend1, AAlphaBlend2: Byte;
        AGradientMode: TdxBarStyleGradientMode; AState: TdxNavBarObjectStates); override;
  end;

  TdxNavBarAdvExplorerButtonPainter = class(TdxBaseButtonPainter)
  protected
    class procedure InternalDrawButton(ACanvas: TCanvas; ARect: TRect; APicture: TPicture;
        AColor1, AColor2: TColor; AAlphaBlend1, AAlphaBlend2: Byte;
        AGradientMode: TdxBarStyleGradientMode; AState: TdxNavBarObjectStates); override;
  end;

  TdxNavBarScrollButtonsPainter = class(TdxBaseScrollButtonsPainter)
  protected
    class procedure InternalDrawBottomButton(ACanvas: TCanvas; ARect: TRect;
        AButtonPainterClass: TdxBaseButtonPainterClass; AColor1, AColor2: TColor;
        AAlphaBlend1, AAlphaBlend2: Byte; AGradientMode: TdxBarStyleGradientMode;
        AState: TdxNavBarObjectStates); override;
    class procedure InternalDrawTopButton(ACanvas: TCanvas; ARect: TRect;
        AButtonPainterClass: TdxBaseButtonPainterClass; AColor1, AColor2: TColor;
        AAlphaBlend1, AAlphaBlend2: Byte; AGradientMode: TdxBarStyleGradientMode;
        AState: TdxNavBarObjectStates); override;
  end;

  TdxNavBarDropTargetLinkPainter = class(TdxBaseDropTargetLinkPainter)
  protected
    class procedure InternalDrawTargetLink(ACanvas: TCanvas;
        pt1, pt2, pt3, pt4, pt5, pt6: TPoint; AColor: TColor); override;
  end;

  TdxNavBarDropTargetGroupPainter = class(TdxBaseDropTargetGroupPainter)
  protected
    class procedure InternalDrawTargetGroup(ACanvas: TCanvas; ARect: TRect;
        AColor1, AColor2: TColor; AAlphaBlend1, AAlphaBlend2: Byte;
        AGradientMode: TdxBarStyleGradientMode); override;
  end;

  TdxNavBarXPPainter = class
  public
    class function DrawObject(ACanvas: TCanvas; ARect: TRect; AObject: TdxThemedObjectType;
        iPartId, iStateId: Integer): Boolean;
    class function DrawText(ACanvas: TCanvas; ARect: TRect;
        ACaption: string; ADrawTextFlag: Integer;
        AObject: TdxThemedObjectType; iPartId, iStateId: Integer): Boolean;
  end;

  TdxNavBarXPSelectionPainter = class(TdxNavBarSelectionPainter)
  protected
    class procedure InternalDrawSelection(ACanvas: TCanvas; ARect: TRect;
        ABackColor: TColor; AState: TdxNavBarObjectStates); override;
  end;

  TdxNavBarXPExplorerBarSignPainter = class(TdxNavBarExplorerBarSignPainter)
  protected
    class procedure InternalDrawSign(ACanvas: TCanvas; ARect: TRect; AForeColor,
        ABackColor: TColor; AState: TdxNavBarObjectStates); override;
  end;

  TdxNavBarXPScrollButtonsPainter = class(TdxNavBarScrollButtonsPainter)
  protected
    class procedure InternalDrawBottomButton(ACanvas: TCanvas; ARect: TRect;
        AButtonPainterClass: TdxBaseButtonPainterClass; AColor1, AColor2: TColor;
        AAlphaBlend1, AAlphaBlend2: Byte; AGradientMode: TdxBarStyleGradientMode;
        AState: TdxNavBarObjectStates); override;
    class procedure InternalDrawTopButton(ACanvas: TCanvas; ARect: TRect;
        AButtonPainterClass: TdxBaseButtonPainterClass; AColor1, AColor2: TColor;
        AAlphaBlend1, AAlphaBlend2: Byte; AGradientMode: TdxBarStyleGradientMode;
        AState: TdxNavBarObjectStates); override;
  end;

  TdxNavBarXPButtonPainter = class(TdxNavBarOfficeButtonPainter)
  protected
    class procedure InternalDrawButton(ACanvas: TCanvas; ARect: TRect; APicture: TPicture;
        AColor1, AColor2: TColor; AAlphaBlend1, AAlphaBlend2: Byte;
        AGradientMode: TdxBarStyleGradientMode; AState: TdxNavBarObjectStates); override;
  end;

  TdxNavBarXPExplorerBarButtonPainter = class(TdxNavBarExplorerButtonPainter)
  protected
    class procedure InternalDrawButton(ACanvas: TCanvas; ARect: TRect; APicture: TPicture;
        AColor1, AColor2: TColor; AAlphaBlend1, AAlphaBlend2: Byte;
        AGradientMode: TdxBarStyleGradientMode; AState: TdxNavBarObjectStates); override;
  end;


function LightColor(AColor: TColor): TColor;
function LightLightColor(AColor: TColor): TColor;
function DarkColor(AColor: TColor): TColor;
function DarkDarkColor(AColor: TColor): TColor;
function LightBorderColor(AColor: TColor): TColor;
function LightLightBorderColor(AColor: TColor): TColor;
function DarkBorderColor(AColor: TColor): TColor;
function DarkDarkBorderColor(AColor: TColor): TColor;
function CalcColor(d: Integer): TColor;
function CalcTextColor(AColor: TColor; AState: TdxNavBarObjectStates): TColor;
function GetFontHeight(AFont: TFont): Integer;

implementation

uses
  Math;

function Dark(Col: TColor; Percentage: Byte): TColor;
var
  R, G, B: Byte;
begin
  Col := ColorToRGB(Col);
  R := GetRValue(Col); G := GetGValue(Col); B := GetBValue(Col);
  R := Round(R * Percentage / 100);
  G := Round(G * Percentage / 100);
  B := Round(B * Percentage / 100);
  Dark := RGB(R, G, B);
end;

function Light(Col: TColor; Percentage: Byte): TColor;
var
  R, G, B: Byte;
begin
  Col := ColorToRGB(Col);
  R := GetRValue(Col); G := GetGValue(Col); B := GetBValue(Col);
  R := Round(R * Percentage / 100) + Round(255 - Percentage / 100 * 255);
  G := Round(G * Percentage / 100) + Round(255 - Percentage / 100 * 255);
  B := Round(B * Percentage / 100) + Round(255 - Percentage / 100 * 255);
  Light := RGB(R, G, B);
end;

function LightColor(AColor: TColor): TColor;
begin
  Result := Light(AColor, 80);
end;

function LightLightColor(AColor: TColor): TColor;
begin
  Result := Light(AColor, 40);
end;

function DarkColor(AColor: TColor): TColor;
begin
  Result := Dark(AColor, 60);
end;

function DarkDarkColor(AColor: TColor): TColor;
begin
  Result := Dark(AColor, 40);
end;

function LightBorderColor(AColor: TColor): TColor;
begin
  Result := Light(AColor, 70);
end;

function LightLightBorderColor(AColor: TColor): TColor;
begin
  Result := Light(AColor, 20);
end;

function DarkBorderColor(AColor: TColor): TColor;
begin
  Result := Dark(AColor, 70);
end;

function DarkDarkBorderColor(AColor: TColor): TColor;
begin
  Result := Dark(AColor, 20);
end;

function GetRealColor(AColor: COLORREF): COLORREF;
var
  DC: HDC;
begin
  DC := GetDC(0);
  Result := GetNearestColor(DC, AColor);
  ReleaseDC(0, DC);
end;

function GetLightColor(ABtnFaceColorPart, AHighlightColorPart, AWindowColorPart: Integer): COLORREF;
var
  ABtnFaceColor, AHighlightColor, AWindowColor: COLORREF;

  function GetLightIndex(ABtnFaceValue, AHighlightValue, AWindowValue: Byte): Integer;
  begin
    Result :=
      MulDiv(ABtnFaceValue, ABtnFaceColorPart, 100) +
      MulDiv(AHighlightValue, AHighlightColorPart, 100) +
      MulDiv(AWindowValue, AWindowColorPart, 100);
    if Result < 0 then Result := 0;
    if Result > 255 then Result := 255;
  end;

begin
  ABtnFaceColor := GetSysColor(COLOR_BTNFACE);
  AHighlightColor := GetSysColor(COLOR_HIGHLIGHT);
  AWindowColor := GetSysColor(COLOR_WINDOW);
  if (ABtnFaceColor = 0) or (ABtnFaceColor = $FFFFFF) then
    Result := AHighlightColor
  else
    Result := RGB(
      GetLightIndex(GetRValue(ABtnFaceColor), GetRValue(AHighlightColor), GetRValue(AWindowColor)),
      GetLightIndex(GetGValue(ABtnFaceColor), GetGValue(AHighlightColor), GetGValue(AWindowColor)),
      GetLightIndex(GetBValue(ABtnFaceColor), GetBValue(AHighlightColor), GetBValue(AWindowColor)));
end;

function CalcColor(d: Integer): TColor;
var
  clrColor: TColor;
  r, g, b: Integer;
  AMax, ADelta, AMaxDelta: Integer;
begin
  clrColor := clHighlight;
  r := GetRed(clrColor);
  g := GetGreen(clrColor);
  b := GetBlue(clrColor);
  AMax := Max(Max(r, g), b);
  ADelta := $23 + d;
  AMaxDelta := (255 - (AMax + ADelta));
  if AMaxDelta > 0 then AMaxDelta := 0;
  Inc(r, (ADelta + AMaxDelta + 5));
  Inc(g, (ADelta + AMaxDelta));
  Inc(b, (ADelta + AMaxDelta));
  if r > 255 then r := 255;
  if g > 255 then g := 255;
  if b > 255 then b := 255;
  Result := RGB(Abs(r), Abs(g), Abs(b));
  Result := ColorRefToARGB(Result);
end;

function CalcTextColor(AColor: TColor; AState: TdxNavBarObjectStates): TColor;
var
  textColor: TColor;
begin
  if AColor = clNone then
    textColor := CalcColor(-50)
  else textColor := AColor;

  if (sDisabled in AState) then
    textColor := LightLightColor(textColor)
  else if (sSelected in AState) or (sHotTracked in AState) or (sPressed in AState) then
    textColor := LightColor(textColor);
  Result := textColor;
end;

function GetFontHeight(AFont: TFont): Integer;
var
  DC: HDC;
  SaveFont: HFont;
  Metrics: TTextMetric;
begin
  DC := GetDC(0);
  SaveFont := SelectObject(DC, AFont.Handle);
  GetTextMetrics(DC, Metrics);
  SelectObject(DC, SaveFont);
  ReleaseDC(0, DC);
  Result := Metrics.tmHeight;
end;

{ TdxNavBarBackgroundPainter }

class procedure TdxNavBarBackgroundPainter.InternalDrawBackground(ACanvas: TCanvas; R: TRect; APicture: TPicture;
  AEraseBackground: Boolean; AColor1, AColor2: TColor; AAlphaBlend1, AAlphaBlend2: Byte;
  AGradientMode: TdxBarStyleGradientMode);
var
  AGPCanvas: TdxGPGraphics;
  AGPBrush: TdxGPLinearGradientBrush;
  AGPColor1, AGPColor2: TdxGPColor;
  AGPRect: TdxGPRect;
  AGPGradientMode: TdxGPLinearGradientMode;
begin
  if CheckGdiPlus and ((AColor1 <> AColor2) or (AAlphaBlend1 <> 255) or (AAlphaBlend2 <> 255)) then
  begin
    if (APicture <> nil) and (APicture.Graphic <> nil) and not APicture.Graphic.Empty then
      DrawPicture(ACanvas, R, APicture)
    else if AEraseBackground then
    begin
      ACanvas.Brush.Style := bsSolid;
      ACanvas.Brush.Color := clWhite;
      ACanvas.FillRect(R);
    end;
    AGPColor1 := MakeColor(ColorToRGB(AColor1), AAlphaBlend1);
    AGPColor2 := MakeColor(ColorToRGB(AColor2), AAlphaBlend2);
    AGPRect := MakeRect(R);
    AGPGradientMode := TdxGPLinearGradientMode(AGradientMode);
    AGPCanvas := TdxGPGraphics.Create(ACanvas.Handle);
    AGPBrush := TdxGPLinearGradientBrush.Create(AGPRect, AGPColor1, AGPColor2, AGPGradientMode);
    AGPCanvas.FillRectangle(AGPBrush, AGPRect);
    AGPBrush.Free;
    AGPCanvas.Free;
  end
  else
  begin
    if AAlphaBlend1 > 0 then
    begin
      ACanvas.Brush.Style := bsSolid;
      ACanvas.Brush.Color := AColor1;
      ACanvas.FillRect(R);
    end
    else if (APicture <> nil) and (APicture.Graphic <> nil) and not APicture.Graphic.Empty then
      DrawPicture(ACanvas, R, APicture)
    else if AEraseBackground then
    begin
      ACanvas.Brush.Style := bsSolid;
      ACanvas.Brush.Color := clWhite;
      ACanvas.FillRect(R);
    end;
  end;
end;

class procedure TdxNavBarBackgroundPainter.DrawPicture(ACanvas: TCanvas; R: TRect; APicture: TPicture);
var
  dLeft, dTop, dWidth, dHeight, sLeft, sTop : Integer;
  ABmp: TBitmap;
  ACreatedFlag: Boolean;
begin
  ABmp := nil;
  ACreatedFlag := False;
  if (APicture.Graphic is TBitmap) then
    ABmp := APicture.Bitmap
  else if (APicture.Graphic is TJPegImage) or (APicture.Graphic is TIcon) or (APicture.Graphic is TMetaFile) then
  begin
    ABmp := TBitmap.Create;
    ABmp.Height := APicture.Graphic.Height;
    ABmp.Width := APicture.Graphic.Height;
    ABmp.Canvas.Draw(0, 0, APicture.Graphic);
    ACreatedFlag := True;
  end;

  if ABmp <> nil then
  begin
    dTop := R.Top;
    while (dTop < R.Bottom) do begin
       if (dTop mod ABmp.Height <> 0) then
         sTop := dTop - (dTop div ABmp.Height) * ABmp.Height
       else sTop := 0;
       dHeight := ABmp.Height - sTop;
       if (dTop + dHeight > R.Bottom) then
         dHeight := R.Bottom - dTop;
       dLeft := R.Left;
       while (dLeft < R.Right) do begin
         if (dLeft mod ABmp.Width <> 0) then
           sLeft := dLeft - (dLeft div ABmp.Width) * ABmp.Width
         else sLeft := 0;
         dWidth := ABmp.Width - sLeft;
         if (dLeft + dWidth > R.Right) then
           dWidth := R.Right - dLeft;
         BitBlt(ACanvas.Handle, dLeft, dTop, dWidth, dHeight, ABmp.Canvas.Handle, sLeft, sTop, SRCCOPY);
         Inc(dLeft, dWidth);
       end;
       Inc(dTop, dHeight);
    end;
    if ACreatedFlag then ABmp.Free;
  end;
end;

{ TdxNavBarBaseImagePainter }

class procedure TdxNavBarImagePainter.InternalDrawImage(ACanvas: TCanvas; AImageList: TImageList; AImageIndex: Integer; R: TRect);
const
  DrawingStyles: array[TDrawingStyle] of Longint = (ILD_FOCUS,
    ILD_SELECTED, ILD_NORMAL, ILD_TRANSPARENT);
  Images: array[TImageType] of Longint = (0, ILD_MASK);
begin
  if (AImageList = nil) or (AImageIndex < 0) or (AImageIndex >= AImageList.Count) then exit;
  with AImageList do
    if HandleAllocated then
    begin
      ImageList_DrawEx(Handle, AImageIndex, ACanvas.Handle, R.Left, R.Top, 0, 0,
        GetRGBColor(BkColor), GetRGBColor(BlendColor),
        DrawingStyles[DrawingStyle] or Images[ImageType]);
    end;
end;

class function TdxNavBarImagePainter.GetRGBColor(Value: TColor): DWORD;
begin
  Result := ColorToRGB(Value);
  case Result of
    clNone: Result := CLR_NONE;
    clDefault: Result := CLR_DEFAULT;
  end;
end;

{ TdxNavBarSelectionPainter }

class procedure TdxNavBarSelectionPainter.InternalDrawSelection(ACanvas: TCanvas; ARect: TRect;
    ABackColor: TColor; AState: TdxNavBarObjectStates);
begin
  ACanvas.Brush.Style := bsClear;      
  ACanvas.Pen.Width := 1;
  ACanvas.Pen.Style := psSolid;
  if (sSelected in AState) or (sPressed in AState) then
  begin
    ACanvas.Pen.Color := DarkDarkBorderColor(ABackColor);
    ACanvas.MoveTo(ARect.Left, ARect.Bottom - 1);
    ACanvas.LineTo(ARect.Left, ARect.Top);
    ACanvas.LineTo(ARect.Right - 1, ARect.Top);
    ACanvas.Pen.Color := LightLightBorderColor(ABackColor);
    ACanvas.LineTo(ARect.Right - 1, ARect.Bottom - 1);
    ACanvas.LineTo(ARect.Left - 1, ARect.Bottom - 1);
  end
  else if (sHotTracked in AState) then
  begin
    ACanvas.Pen.Color := LightLightBorderColor(ABackColor);
    ACanvas.MoveTo(ARect.Left, ARect.Bottom - 1);
    ACanvas.LineTo(ARect.Left, ARect.Top);
    ACanvas.LineTo(ARect.Right - 1, ARect.Top);
    ACanvas.Pen.Color := DarkDarkBorderColor(ABackColor);
    ACanvas.LineTo(ARect.Right - 1, ARect.Bottom - 1);
    ACanvas.LineTo(ARect.Left - 1, ARect.Bottom - 1);
  end;
end;

{ TdxNavBarUltraFlatSelectionPainter }

class procedure TdxNavBarUltraFlatSelectionPainter.InternalDrawSelection(ACanvas: TCanvas; ARect: TRect;
    ABackColor: TColor; AState: TdxNavBarObjectStates);
begin
  if not ((sSelected in AState) or (sPressed in AState) or (sHotTracked in AState)) then exit;
  ACanvas.Pen.Style := psSolid;
  ACanvas.Pen.Color := ColorToRGB(clHighlight);
  ACanvas.Brush.Style := bsSolid;
  if (sPressed in AState) and not (sSelected in AState) then
    ACanvas.Brush.Color := FlatBarItemPressedBackColor
  else ACanvas.Brush.Color := FlatBarItemHighLightBackColor;
  ACanvas.Rectangle(ARect.Left, ARect.Top, ARect.Right, ARect.Bottom);
end;

class function TdxNavBarUltraFlatSelectionPainter.FlatBarItemPressedBackColor: TColor;
begin
  Result := GetRealColor(GetLightColor(14, 44, 40));
end;

class function TdxNavBarUltraFlatSelectionPainter.FlatBarItemHighLightBackColor: TColor;
begin
  Result := GetRealColor(GetLightColor(-2, 30, 72));
end;

{ TdxNavBarVSToolBoxSelectionPainter }

class procedure TdxNavBarVSToolBoxSelectionPainter.InternalDrawSelection(ACanvas: TCanvas; ARect: TRect;
    ABackColor: TColor; AState: TdxNavBarObjectStates);
begin
  ACanvas.Brush.Style := bsClear;      
  ACanvas.Pen.Width := 1;
  ACanvas.Pen.Style := psSolid;
  if (sSelected in AState) or (sPressed in AState) then
  begin
    ACanvas.Pen.Color := DarkBorderColor(ABackColor);
    ACanvas.MoveTo(ARect.Left, ARect.Bottom - 1);
    ACanvas.LineTo(ARect.Left, ARect.Top);
    ACanvas.LineTo(ARect.Right - 1, ARect.Top);
    ACanvas.Pen.Color := LightBorderColor(ABackColor);
    ACanvas.LineTo(ARect.Right - 1, ARect.Bottom - 1);
    ACanvas.LineTo(ARect.Left - 1, ARect.Bottom - 1);
  end
  else if (sHotTracked in AState) then
  begin
    ACanvas.Pen.Color := LightLightBorderColor(ABackColor);
    ACanvas.MoveTo(ARect.Left, ARect.Bottom - 1);
    ACanvas.LineTo(ARect.Left, ARect.Top);
    ACanvas.LineTo(ARect.Right - 1, ARect.Top);
    ACanvas.Pen.Color := DarkDarkBorderColor(ABackColor);
    ACanvas.LineTo(ARect.Right - 1, ARect.Bottom - 1);
    ACanvas.LineTo(ARect.Left - 1, ARect.Bottom - 1);
    InflateRect(ARect, -1, -1);
    ACanvas.Pen.Color := LightBorderColor(ABackColor);
    ACanvas.MoveTo(ARect.Left, ARect.Bottom - 1);
    ACanvas.LineTo(ARect.Left, ARect.Top);
    ACanvas.LineTo(ARect.Right, ARect.Top);
  end;
end;

{ TdxNavBarExplorerBarSignPainter }

class procedure TdxNavBarExplorerBarSignPainter.InternalDrawSign(ACanvas: TCanvas;
  ARect: TRect; AForeColor, ABackColor: TColor; AState: TdxNavBarObjectStates);
var
  pt1, pt2, pt3: TPoint;
begin
  DrawSignSelection(ACanvas, ARect, AForeColor, ABackColor, AState);

  ACanvas.Pen.Color := AForeColor;
  ACanvas.Pen.Style := psSolid;
  ACanvas.Pen.Width := 1;

  pt1.X := ARect.Left + (ARect.Right - ARect.Left) div 2 - 1;
  pt1.Y := ARect.Top + (ARect.Bottom - ARect.Top) div 2 - (4 div 2) - 1 - 1;
  pt2.X := pt1.X - 7 div 2;
  pt2.Y := pt1.Y + 4 - 1;
  pt3.X := pt2.X + 7;
  pt3.Y := pt2.Y + 1;
  if not (sExpanded in AState) then
  begin
    pt1.Y := pt1.Y + 2 * ((ARect.Bottom - ARect.Top) div 2 - (pt1.Y - ARect.Top));
    pt2.Y := pt2.Y + 2 * ((ARect.Bottom - ARect.Top) div 2 - (pt2.Y - ARect.Top));
    pt3.Y := pt3.Y + 2 * ((ARect.Bottom - ARect.Top) div 2 - (pt3.Y - ARect.Top));
  end;
  ACanvas.Polyline([pt2, pt1, pt3]);
  if not (sExpanded in AState) then
    ACanvas.Polyline([Point(pt2.x + 1, pt2.y), Point(pt1.x, pt1.y - 1), Point(pt3.x - 1, pt3.y)])
  else ACanvas.Polyline([Point(pt2.x + 1, pt2.y), Point(pt1.x, pt1.y + 1), Point(pt3.x - 1, pt3.y)]);
  if not (sExpanded in AState) then
  begin
    pt1.Y := pt1.Y - 4;
    pt2.Y := pt2.Y - 4;
    pt3.Y := pt3.Y - 4;
  end
  else
  begin
    pt1.Y := pt1.Y + 4;
    pt2.Y := pt2.Y + 4;
    pt3.Y := pt3.Y + 4;
  end;
  ACanvas.Polyline([pt2, pt1, pt3]);
  if not (sExpanded in AState) then
    ACanvas.Polyline([Point(pt2.x + 1, pt2.y), Point(pt1.x, pt1.y - 1), Point(pt3.x - 1, pt3.y)])
  else ACanvas.Polyline([Point(pt2.x + 1, pt2.y), Point(pt1.x, pt1.y + 1), Point(pt3.x - 1, pt3.y)]);
end;

class procedure TdxNavBarExplorerBarSignPainter.DrawSignSelection(ACanvas: TCanvas;
  ARect: TRect; AForeColor, ABackColor: TColor; AState: TdxNavBarObjectStates);
begin
  if sHotTracked in AState then
    DrawEdge(ACanvas.Handle, ARect, BDR_RAISEDINNER, BF_RECT);
end;

{ TdxNavAdvBarExplorerBarSignPainter }

class procedure TdxNavBarAdvExplorerBarSignPainter.DrawSignSelection(ACanvas: TCanvas;
  ARect: TRect; AForeColor, ABackColor: TColor; AState: TdxNavBarObjectStates);
var
  R: TRect;
  AGPCanvas: TdxGPGraphics;
  AGPPen: TdxGPPen;
  AGPColor: TdxGPColor;
  AGPRect: TdxGPRect;
begin
  R := ARect;
  InflateRect(R, -2, -2);
  ACanvas.Brush.Color := ABackColor;
  ACanvas.Brush.Style := bsSolid;
  ACanvas.Pen.Color := clSilver;
  ACanvas.Pen.Style := psSolid;
  ACanvas.Pen.Width := 2;
  ACanvas.Ellipse(R.Left, R.Top, R.Right, R.Bottom);
  if CheckGdiPlus then
  begin
    AGPColor := MakeColor(ColorToRGB(clHighlight), 90);
    AGPRect := MakeRect(R);
    AGPCanvas := TdxGPGraphics.Create(ACanvas.Handle);
    AGPPen := TdxGPPen.Create(AGPColor, 2);
    AGPCanvas.DrawArc(AGPPen, AGPRect, 0, 100);
    AGPPen.Free;
    AGPCanvas.Free;
  end
  else
  begin
    InflateRect(R, 1, 1);
    ACanvas.Pen.Color := clHighlight;
    ACanvas.Arc(R.Left, R.Top, R.Right, R.Bottom, R.Left + (R.Right - R.Left) div 2, R.Bottom, R.Right, R.Top + (R.Bottom - R.Top) div 2);
  end;
end;

{ TdxNavBarHintPainter }

class procedure TdxNavBarHintPainter.InternalDrawHint(ACanvas: TCanvas; ARect: TRect; AHint: string;
    APicture: TPicture; AColor1, AColor2: TColor; AAlphaBlend1, AAlphaBlend2: Byte;
    AGradientMode: TdxBarStyleGradientMode; AFont: TFont);
begin
  if AHint <> '' then
  begin
    TdxNavBarBackgroundPainter.DrawBackground(ACanvas, ARect, APicture, True,
        AColor1, AColor2, AAlphaBlend1, AAlphaBlend2, AGradientMode);
    Windows.DrawEdge(ACanvas.Handle, ARect, BDR_RAISEDOUTER, BF_RECT);
    InflateRect(ARect, -1, -1);
    ACanvas.Font := AFont;
    ACanvas.Brush.Style := bsClear;
    DrawText(ACanvas.Handle, PChar(AHint), -1, ARect, DT_LEFT or DT_NOPREFIX or DT_WORDBREAK);
  end;
end;

{ TdxNavBarButtonPainter }

class procedure TdxNavBarButtonPainter.InternalDrawButton(ACanvas: TCanvas; ARect: TRect;
  APicture: TPicture; AColor1, AColor2: TColor; AAlphaBlend1, AAlphaBlend2: Byte;
  AGradientMode: TdxBarStyleGradientMode; AState: TdxNavBarObjectStates);
var
  R: TRect;
begin
  R := ARect;
  TdxNavBarBackgroundPainter.DrawBackground(ACanvas, R, APicture, False, AColor1, AColor2,
      AAlphaBlend1, AAlphaBlend2, AGradientMode);

  ACanvas.Brush.Style := bsClear;      
  ACanvas.Pen.Width := 1;
  ACanvas.Pen.Style := psSolid;
  if sPressed in AState then
  begin
    ACanvas.Pen.Color := DarkDarkBorderColor(AColor1);
    ACanvas.Rectangle(R.Left, R.Top, R.Right, R.Bottom);
    InflateRect(R, -1, -1);
    ACanvas.Pen.Color := DarkBorderColor(AColor1);
    ACanvas.Rectangle(R.Left, R.Top, R.Right, R.Bottom);
  end
  else
  begin
    ACanvas.Pen.Color := LightLightBorderColor(AColor1);
    ACanvas.MoveTo(R.Left, R.Bottom - 1);
    ACanvas.LineTo(R.Left, R.Top);
    ACanvas.LineTo(R.Right - 1, R.Top);
    ACanvas.Pen.Color := DarkDarkBorderColor(AColor1);
    ACanvas.LineTo(R.Right - 1, R.Bottom - 1);
    ACanvas.LineTo(R.Left - 1, R.Bottom - 1);
    InflateRect(R, -1, -1);
    ACanvas.Pen.Color := LightBorderColor(AColor1);
    ACanvas.MoveTo(R.Left, R.Bottom - 1);
    ACanvas.LineTo(R.Left, R.Top);
    ACanvas.LineTo(R.Right - 1, R.Top);
    ACanvas.Pen.Color := DarkBorderColor(AColor1);
    ACanvas.LineTo(R.Right - 1, R.Bottom - 1);
    ACanvas.LineTo(R.Left - 1, R.Bottom - 1);
  end;
  if sActive in AState then
  begin
    R := ARect;
    ACanvas.Pen.Color := clBlack;
    ACanvas.MoveTo(R.Left, R.Bottom - 1);
    ACanvas.LineTo(R.Right, R.Bottom - 1);
  end;
end;

{ TdxNavBarFlatButtonPainter }

class procedure TdxNavBarFlatButtonPainter.InternalDrawButton(ACanvas: TCanvas; ARect: TRect;
  APicture: TPicture; AColor1, AColor2: TColor; AAlphaBlend1, AAlphaBlend2: Byte;
  AGradientMode: TdxBarStyleGradientMode; AState: TdxNavBarObjectStates);
var
  R: TRect;
begin
  R := ARect;
  TdxNavBarBackgroundPainter.DrawBackground(ACanvas, R, APicture, False, AColor1, AColor2,
    AAlphaBlend1, AAlphaBlend2, AGradientMode);

  ACanvas.Brush.Style := bsClear;
  ACanvas.Pen.Width := 1;
  ACanvas.Pen.Style := psSolid;
  if sPressed in AState then
  begin
    ACanvas.Pen.Color := DarkDarkBorderColor(AColor1);
    ACanvas.MoveTo(R.Left, R.Bottom - 1);
    ACanvas.LineTo(R.Left, R.Top);
    ACanvas.LineTo(R.Right - 1, R.Top);
    ACanvas.Pen.Color := LightLightBorderColor(AColor1);
    ACanvas.LineTo(R.Right - 1, R.Bottom - 1);
    ACanvas.LineTo(R.Left - 1, R.Bottom - 1);
    InflateRect(R, -1, -1);
    ACanvas.Pen.Color := DarkBorderColor(AColor1);
    ACanvas.MoveTo(R.Left, R.Bottom - 1);
    ACanvas.LineTo(R.Left, R.Top);
    ACanvas.LineTo(R.Right, R.Top);
  end
  else if sHotTracked in AState then
  begin
    ACanvas.Pen.Color := LightLightBorderColor(AColor1);
    ACanvas.MoveTo(R.Left, R.Bottom - 1);
    ACanvas.LineTo(R.Left, R.Top);
    ACanvas.LineTo(R.Right - 1, R.Top);
    ACanvas.Pen.Color := DarkDarkBorderColor(AColor1);
    ACanvas.LineTo(R.Right - 1, R.Bottom - 1);
    ACanvas.LineTo(R.Left - 1, R.Bottom - 1);
    InflateRect(R, -1, -1);
    ACanvas.Pen.Color := DarkBorderColor(AColor1);
    ACanvas.MoveTo(R.Right - 1, R.Top);
    ACanvas.LineTo(R.Right - 1, R.Bottom - 1);
    ACanvas.LineTo(R.Left - 1, R.Bottom - 1);
  end
  else
  begin
    ACanvas.Pen.Color := LightLightBorderColor(AColor1);
    ACanvas.MoveTo(R.Left, R.Bottom - 1);
    ACanvas.LineTo(R.Left, R.Top);
    ACanvas.LineTo(R.Right - 1, R.Top);
    ACanvas.Pen.Color := DarkBorderColor(AColor1);
    ACanvas.LineTo(R.Right - 1, R.Bottom - 1);
    ACanvas.LineTo(R.Left - 1, R.Bottom - 1);
  end;
  if sActive in AState then
  begin
    R := ARect;
    ACanvas.Pen.Color := clBlack;
    ACanvas.MoveTo(R.Left, R.Bottom - 1);
    ACanvas.LineTo(R.Right, R.Bottom - 1);
  end;
end;

{ TdxNavBarVSToolBoxButtonPainter }

class procedure TdxNavBarVSToolBoxButtonPainter.InternalDrawButton(ACanvas: TCanvas; ARect: TRect;
  APicture: TPicture; AColor1, AColor2: TColor; AAlphaBlend1, AAlphaBlend2: Byte;
  AGradientMode: TdxBarStyleGradientMode; AState: TdxNavBarObjectStates);
var
  R: TRect;
begin
  R := ARect;
  TdxNavBarBackgroundPainter.DrawBackground(ACanvas, R, APicture, False, AColor1, AColor2,
    AAlphaBlend1, AAlphaBlend2, AGradientMode);

  ACanvas.Brush.Style := bsClear;
  ACanvas.Pen.Width := 1;
  ACanvas.Pen.Style := psSolid;
  if sPressed in AState then
  begin
    ACanvas.Pen.Color := DarkDarkBorderColor(AColor1);
    ACanvas.MoveTo(R.Left, R.Bottom - 1);
    ACanvas.LineTo(R.Left, R.Top);
    ACanvas.LineTo(R.Right - 1, R.Top);
    ACanvas.Pen.Color := LightLightBorderColor(AColor1);
    ACanvas.LineTo(R.Right - 1, R.Bottom - 1);
    ACanvas.LineTo(R.Left - 1, R.Bottom - 1);
    InflateRect(R, -1, -1);
    ACanvas.Pen.Color := DarkBorderColor(AColor1);
    ACanvas.MoveTo(R.Left, R.Bottom - 1);
    ACanvas.LineTo(R.Left, R.Top);
    ACanvas.LineTo(R.Right, R.Top);
  end
  else
  begin
    ACanvas.Pen.Color := LightLightBorderColor(AColor1);
    ACanvas.MoveTo(R.Left, R.Bottom - 1);
    ACanvas.LineTo(R.Left, R.Top);
    ACanvas.LineTo(R.Right - 1, R.Top);
    ACanvas.Pen.Color := DarkDarkBorderColor(AColor1);
    ACanvas.LineTo(R.Right - 1, R.Bottom - 1);
    ACanvas.LineTo(R.Left - 1, R.Bottom - 1);
    InflateRect(R, -1, -1);
    ACanvas.Pen.Color := LightBorderColor(AColor1);
    ACanvas.MoveTo(R.Left, R.Bottom - 1);
    ACanvas.LineTo(R.Left, R.Top);
    ACanvas.LineTo(R.Right, R.Top);
  end;
end;

{ TdxNavBarOfficeButtonPainter }

class procedure TdxNavBarOfficeButtonPainter.InternalDrawButton(ACanvas: TCanvas; ARect: TRect;
  APicture: TPicture; AColor1, AColor2: TColor; AAlphaBlend1, AAlphaBlend2: Byte;
  AGradientMode: TdxBarStyleGradientMode; AState: TdxNavBarObjectStates);
var
  R: TRect;
begin
  R := ARect;
  TdxNavBarBackgroundPainter.DrawBackground(ACanvas, R, APicture, False, AColor1, AColor2,
    AAlphaBlend1, AAlphaBlend2, AGradientMode);

  ACanvas.Brush.Style := bsClear;
  ACanvas.Pen.Width := 1;
  ACanvas.Pen.Style := psSolid;
  if sPressed in AState then
  begin
    ACanvas.Pen.Color := DarkDarkBorderColor(AColor1);
    ACanvas.MoveTo(R.Left, R.Bottom - 1);
    ACanvas.LineTo(R.Left, R.Top);
    ACanvas.LineTo(R.Right - 1, R.Top);
    ACanvas.Pen.Color := LightLightBorderColor(AColor1);
    ACanvas.LineTo(R.Right - 1, R.Bottom - 1);
    ACanvas.LineTo(R.Left - 1, R.Bottom - 1);
    InflateRect(R, -1, -1);
    ACanvas.Pen.Color := DarkBorderColor(AColor1);
    ACanvas.MoveTo(R.Left, R.Bottom - 1);
    ACanvas.LineTo(R.Left, R.Top);
    ACanvas.LineTo(R.Right, R.Top);
  end
  else if sHotTracked in AState then
  begin
    ACanvas.Pen.Color := LightLightBorderColor(AColor1);
    ACanvas.MoveTo(R.Left, R.Bottom - 1);
    ACanvas.LineTo(R.Left, R.Top);
    ACanvas.LineTo(R.Right - 1, R.Top);
    ACanvas.Pen.Color := DarkDarkBorderColor(AColor1);
    ACanvas.LineTo(R.Right - 1, R.Bottom - 1);
    ACanvas.LineTo(R.Left - 1, R.Bottom - 1);
    InflateRect(R, -1, -1);
    ACanvas.Pen.Color := LightBorderColor(AColor1);
    ACanvas.MoveTo(R.Left, R.Bottom - 1);
    ACanvas.LineTo(R.Left, R.Top);
    ACanvas.LineTo(R.Right - 1, R.Top);
    ACanvas.Pen.Color := DarkBorderColor(AColor1);
    ACanvas.LineTo(R.Right - 1, R.Bottom - 1);
    ACanvas.LineTo(R.Left - 1, R.Bottom - 1);
  end
  else
  begin
    ACanvas.Pen.Color := LightLightBorderColor(AColor1);
    ACanvas.MoveTo(R.Left, R.Bottom - 1);
    ACanvas.LineTo(R.Left, R.Top);
    ACanvas.LineTo(R.Right - 1, R.Top);
    ACanvas.Pen.Color := DarkDarkBorderColor(AColor1);
    ACanvas.LineTo(R.Right - 1, R.Bottom - 1);
    ACanvas.LineTo(R.Left - 1, R.Bottom - 1);
  end;
  if sActive in AState then
  begin
    R := ARect;
    ACanvas.Pen.Color := clBlack;
    ACanvas.MoveTo(R.Left, R.Bottom - 1);
    ACanvas.LineTo(R.Right, R.Bottom - 1);
  end;
end;

{ TdxNavBarExplorerButtonPainter }

class procedure TdxNavBarExplorerButtonPainter.InternalDrawButton(ACanvas: TCanvas; ARect: TRect;
  APicture: TPicture; AColor1, AColor2: TColor; AAlphaBlend1, AAlphaBlend2: Byte;
  AGradientMode: TdxBarStyleGradientMode; AState: TdxNavBarObjectStates);
begin
  TdxNavBarBackgroundPainter.DrawBackground(ACanvas, ARect, APicture, False, AColor1, AColor2,
    AAlphaBlend1, AAlphaBlend2, AGradientMode);
end;

{ TdxNavBarAdvExplorerButtonPainter }

class procedure TdxNavBarAdvExplorerButtonPainter.InternalDrawButton(ACanvas: TCanvas; ARect: TRect;
    APicture: TPicture; AColor1, AColor2: TColor; AAlphaBlend1, AAlphaBlend2: Byte;
    AGradientMode: TdxBarStyleGradientMode; AState: TdxNavBarObjectStates);
begin
  ExcludeClipRect(ACanvas.Handle, ARect.Left, ARect.Top, ARect.Left + 2, ARect.Top + 1);
  ExcludeClipRect(ACanvas.Handle, ARect.Left, ARect.Top, ARect.Left + 1, ARect.Top + 2);
  ExcludeClipRect(ACanvas.Handle, ARect.Right - 2, ARect.Top, ARect.Right, ARect.Top + 1);
  ExcludeClipRect(ACanvas.Handle, ARect.Right - 1, ARect.Top, ARect.Right, ARect.Top + 2);

  TdxNavBarBackgroundPainter.DrawBackground(ACanvas, ARect, APicture, False, AColor1, AColor2,
    AAlphaBlend1, AAlphaBlend2, AGradientMode);

  SelectClipRgn(ACanvas.Handle, 0);
end;

{ TdxNavBarScrollButtonsPainter }

class procedure TdxNavBarScrollButtonsPainter.InternalDrawBottomButton(ACanvas: TCanvas;
    ARect: TRect; AButtonPainterClass: TdxBaseButtonPainterClass;
    AColor1, AColor2: TColor; AAlphaBlend1, AAlphaBlend2: Byte;
    AGradientMode: TdxBarStyleGradientMode; AState: TdxNavBarObjectStates);
var
  pt1, pt2, pt3: TPoint;
  AArrowHeight, AArrowWidth: Integer;
begin
  AButtonPainterClass.DrawButton(ACanvas, ARect, nil, AColor1, AColor2,
    AAlphaBlend1, AAlphaBlend2, AGradientMode, AState);

  AArrowHeight := (ARect.Bottom - ARect.Top) div 4;
  AArrowWidth := 2 * AArrowHeight - 1;
  pt1.X := ARect.Left + (ARect.Right - ARect.Left) div 2 - 1;
  pt1.Y := ARect.Top + (ARect.Bottom - ARect.Top) div 2 + (AArrowHeight div 2) - 1;
  pt2.X := pt1.X - AArrowWidth div 2;
  pt2.Y := pt1.Y - AArrowHeight + 1;
  pt3.X := pt2.X + AArrowWidth - 1;
  pt3.Y := pt2.Y;
  if sDisabled in AState then
  begin
    ACanvas.Brush.Color := clGrayText;
    ACanvas.Pen.Color := clGrayText;
  end
  else
  begin
    ACanvas.Brush.Color := clBlack;
    ACanvas.Pen.Color := clBlack;
  end;
  ACanvas.Brush.Style := bsSolid;
  ACanvas.Pen.Style := psSolid;
  ACanvas.Polygon([pt1, pt2, pt3]);
  ExcludeClipRect(ACanvas.Handle, ARect.Left, ARect.Top, ARect.Right, ARect.Bottom);
end;

class procedure TdxNavBarScrollButtonsPainter.InternalDrawTopButton(ACanvas: TCanvas;
    ARect: TRect; AButtonPainterClass: TdxBaseButtonPainterClass;
    AColor1, AColor2: TColor; AAlphaBlend1, AAlphaBlend2: Byte;
    AGradientMode: TdxBarStyleGradientMode; AState: TdxNavBarObjectStates);
var
  pt1, pt2, pt3: TPoint;
  AArrowHeight, AArrowWidth: Integer;
begin
  AButtonPainterClass.DrawButton(ACanvas, ARect, nil, AColor1, AColor2,
    AAlphaBlend2, AAlphaBlend2, AGradientMode, AState);

  AArrowHeight := (ARect.Bottom - ARect.Top) div 4;
  AArrowWidth := 2 * AArrowHeight - 1;
  pt1.X := ARect.Left + (ARect.Right - ARect.Left) div 2 - 1;
  pt1.Y := ARect.Top + (ARect.Bottom - ARect.Top) div 2 - (AArrowHeight div 2) - 1;
  pt2.X := pt1.X - AArrowWidth div 2;
  pt2.Y := pt1.Y + AArrowHeight - 1;
  pt3.X := pt2.X + AArrowWidth - 1;
  pt3.Y := pt2.Y;
  if sDisabled in AState then
  begin
    ACanvas.Brush.Color := clGrayText;
    ACanvas.Pen.Color := clGrayText;
  end
  else
  begin
    ACanvas.Brush.Color := clBlack;
    ACanvas.Pen.Color := clBlack;
  end;
  ACanvas.Brush.Style := bsSolid;
  ACanvas.Pen.Style := psSolid;
  ACanvas.Polygon([pt1, pt2, pt3]);
  ExcludeClipRect(ACanvas.Handle, ARect.Left, ARect.Top, ARect.Right, ARect.Bottom);
end;

{ TdxNavBarDropTargetLinkPainter }

class procedure TdxNavBarDropTargetLinkPainter.InternalDrawTargetLink(
  ACanvas: TCanvas; pt1, pt2, pt3, pt4, pt5, pt6: TPoint; AColor: TColor);
begin
  ACanvas.Brush.Style := bsSolid;
  ACanvas.Brush.Color := AColor;
  ACanvas.Pen.Style := psSolid;
  ACanvas.Pen.Color := AColor;
  ACanvas.Polygon([pt1, pt2, pt3, pt1, pt4, pt5, pt6, pt4]);
end;

{ TdxNavBarDropTargetGroupPainter }

class procedure TdxNavBarDropTargetGroupPainter.InternalDrawTargetGroup(ACanvas: TCanvas;
  ARect: TRect; AColor1, AColor2: TColor; AAlphaBlend1, AAlphaBlend2: Byte;
  AGradientMode: TdxBarStyleGradientMode);
begin
  if CheckGdiPlus then
    TdxNavBarBackgroundPainter.DrawBackground(ACanvas, ARect, nil, False,
          AColor1, AColor2, AAlphaBlend1, AAlphaBlend2, AGradientMode)
  else
  begin
    ACanvas.Brush.Style := bsClear;
    ACanvas.Pen.Width := 2;
    ACanvas.Pen.Style := psSolid;
    ACanvas.Pen.Color := AColor1;
    ACanvas.Rectangle(ARect.Left, ARect.Top, ARect.Right, ARect.Bottom);
  end;
end;

{ TdxNavBarXPButtonPainter }

class function TdxNavBarXPPainter.DrawObject(ACanvas: TCanvas; ARect: TRect;
    AObject: TdxThemedObjectType; iPartId, iStateId: Integer): Boolean;
var
  ATheme: TTheme;
begin
  ATheme := OpenTheme(AObject);
  if ATheme <> 0 then
  begin
    DrawThemeBackground(ATheme, ACanvas.Handle, iPartId, iStateId, @ARect);
    Result := True;
  end
  else Result := False;
end;

class function TdxNavBarXPPainter.DrawText(ACanvas: TCanvas; ARect: TRect;
    ACaption: string; ADrawTextFlag: Integer;
    AObject: TdxThemedObjectType; iPartId, iStateId: Integer): Boolean;
var
  ATheme: TTheme;
begin
  ATheme := OpenTheme(AObject);
  if ATheme <> 0 then
  begin
    DrawThemeText(ATheme, ACanvas.Handle, iPartId, iStateId, Pointer(WideString(ACaption)),
        -1, ADrawTextFlag, 0, @ARect);
    Result := True;
  end
  else Result := False;
end;

{ TdxNavBarXPSelectionPainter }

class procedure TdxNavBarXPSelectionPainter.InternalDrawSelection(ACanvas: TCanvas;
  ARect: TRect; ABackColor: TColor; AState: TdxNavBarObjectStates);
var
  AStateID: Integer;
begin
  if (sPressed in AState) or (sSelected in AState) then
    AStateID := TS_PRESSED
  else if (sHotTracked in AState) then
    AStateID := TS_HOT
  else AStateID := TS_NORMAL;
  if not TdxNavBarXPPainter.DrawObject(ACanvas, ARect, totToolBar, TP_BUTTON, AStateID) then
    inherited;
end;

{ TdxNavBarXPButtonPainter }

class procedure TdxNavBarXPButtonPainter.InternalDrawButton(ACanvas: TCanvas;
  ARect: TRect; APicture: TPicture; AColor1, AColor2: TColor; AAlphaBlend1,
  AAlphaBlend2: Byte; AGradientMode: TdxBarStyleGradientMode;
  AState: TdxNavBarObjectStates);
var
  AStateID: Integer;
begin
  if sPressed in AState then
    AStateID := PBS_PRESSED
  else if sHotTracked in AState then
    AStateID := PBS_HOT
  else if sActive in AState then
    AStateID := PBS_DEFAULTED
  else AStateID := PBS_NORMAL;
  if not TdxNavBarXPPainter.DrawObject(ACanvas, ARect, totButton, BP_PUSHBUTTON, AStateID) then
    inherited;
end;

{ TdxNavBarXPExplorerBarSignPainter }

class procedure TdxNavBarXPExplorerBarSignPainter.InternalDrawSign(
  ACanvas: TCanvas; ARect: TRect; AForeColor, ABackColor: TColor;
  AState: TdxNavBarObjectStates);
var
  ATheme: TTheme;
  APartID, AStateID: Integer;
begin
  ATheme := OpenTheme(totExplorerBar);
  if ATheme <> 0 then
  begin
    if not (sExpanded in AState) then
    begin
      APartID := EBP_NORMALGROUPEXPAND;
      if sPressed in AState then
        AStateID := EBNGE_PRESSED
      else if sHotTracked in AState then
        AStateID := EBNGE_HOT
      else AStateID := EBNGE_NORMAL
    end
    else
    begin
      APartID := EBP_NORMALGROUPCOLLAPSE;
      if sPressed in AState then
        AStateID := EBNGC_PRESSED
      else if sHotTracked in AState then
        AStateID := EBNGC_HOT
      else AStateID := EBNGC_NORMAL;
    end;
    DrawThemeBackground(ATheme, ACanvas.Handle, APartID, AStateID, @ARect);
  end
  else inherited;
end;

{ TdxNavBarXPScrollButtonsPainter }

class procedure TdxNavBarXPScrollButtonsPainter.InternalDrawBottomButton(
  ACanvas: TCanvas; ARect: TRect;
  AButtonPainterClass: TdxBaseButtonPainterClass; AColor1, AColor2: TColor;
  AAlphaBlend1, AAlphaBlend2: Byte; AGradientMode: TdxBarStyleGradientMode;
  AState: TdxNavBarObjectStates);
var
  ATheme: TTheme;
  AStateID: Integer;
begin
  ATheme := OpenTheme(totScrollBar);
  if ATheme <> 0 then
  begin
    if sPressed in AState then
      AStateID := ABS_DOWNPRESSED
    else if sHotTracked in AState then
      AStateID := ABS_DOWNHOT
    else AStateID := ABS_DOWNNORMAL;
    TdxNavBarXPPainter.DrawObject(ACanvas, ARect, totScrollBar, SBP_ARROWBTN, AStateID);
    ExcludeClipRect(ACanvas.Handle, ARect.Left, ARect.Top, ARect.Right, ARect.Bottom);
  end
  else inherited;
end;

class procedure TdxNavBarXPScrollButtonsPainter.InternalDrawTopButton(
  ACanvas: TCanvas; ARect: TRect;
  AButtonPainterClass: TdxBaseButtonPainterClass; AColor1, AColor2: TColor;
  AAlphaBlend1, AAlphaBlend2: Byte; AGradientMode: TdxBarStyleGradientMode;
  AState: TdxNavBarObjectStates);
var
  ATheme: TTheme;
  AStateID: Integer;
begin
  ATheme := OpenTheme(totScrollBar);
  if ATheme <> 0 then
  begin
    if sPressed in AState then
      AStateID := ABS_UPPRESSED
    else if sHotTracked in AState then
      AStateID := ABS_UPHOT
    else AStateID := ABS_UPNORMAL;
    TdxNavBarXPPainter.DrawObject(ACanvas, ARect, totScrollBar, SBP_ARROWBTN, AStateID);
    ExcludeClipRect(ACanvas.Handle, ARect.Left, ARect.Top, ARect.Right, ARect.Bottom);
  end
  else inherited;
end;


{ TdxNavBarXPExplorerBarButtonPainter }

class procedure TdxNavBarXPExplorerBarButtonPainter.InternalDrawButton(
  ACanvas: TCanvas; ARect: TRect; APicture: TPicture; AColor1,
  AColor2: TColor; AAlphaBlend1, AAlphaBlend2: Byte;
  AGradientMode: TdxBarStyleGradientMode; AState: TdxNavBarObjectStates);
begin
  if not TdxNavBarXPPainter.DrawObject(ACanvas, ARect, totExplorerBar, EBP_NORMALGROUPHEAD, 0) then
    inherited;
end;

end.







