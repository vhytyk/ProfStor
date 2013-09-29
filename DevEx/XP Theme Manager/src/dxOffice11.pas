
{*******************************************************************}
{                                                                   }
{       Developer Express Visual Component Library                  }
{       Office 11 routines                                          }
{                                                                   }
{       Copyright (c) 1998-2003 Developer Express Inc.              }
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
{   LICENSED TO DISTRIBUTE THE EXPRESSTHEME AND ALL ACCOMPANYING    }
{   VCL CONTROLS AS PART OF AN EXECUTABLE PROGRAM ONLY.             }
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

unit dxOffice11;

{$I dxThemeVer.inc}

interface

uses
  SysUtils, TypInfo, Windows, Messages, Graphics, Controls, Forms, Classes;

type
  TOffice11Scheme = (schUnknown, schNormalColor, schHomestead, schMetallic);
  TOffice11SchemeColor = schNormalColor .. schMetallic;

var
  { Colors }
  
  // dock
  dxOffice11DockColor1: COLORREF;
  dxOffice11DockColor2: COLORREF;
  // bar: background
  dxOffice11ToolbarsColor1: COLORREF;
  dxOffice11ToolbarsColor2: COLORREF;
  // bar: marks
  dxOffice11BarMarkColors1: array[1..3] of COLORREF; // Normal, Selected, Pressed
  dxOffice11BarMarkColors2: array[1..3] of COLORREF; // Normal, Selected, Pressed
  dxOffice11BarBorderColors: array[1..2] of COLORREF; // fixed colors
  dxOffice11BarBorderMarkColors: array[1..2, 1..3] of COLORREF;
  // bar: fingers, separators, mark arrows
  dxOffice11BarFingerColor1: COLORREF;
  dxOffice11BarFingerColor2: COLORREF;
  dxOffice11BarSeparatorColor1: COLORREF;
  dxOffice11BarSeparatorColor2: COLORREF;
  dxOffice11BarMarkArrowColor1: COLORREF;
  dxOffice11BarMarkArrowColor2: COLORREF;
  // bar: floating toolbar
  dxOffice11BarFloatingBorderColor1: COLORREF;
  dxOffice11BarFloatingBorderColor2: COLORREF;
  dxOffice11BarFloatingBorderColor3: COLORREF;
  dxOffice11BarFloatingCaptionColor: COLORREF;
  dxOffice11BarFloatingCaptionTextColor1: COLORREF;
  dxOffice11BarFloatingCaptionTextColor2: COLORREF;
  dxOffice11BarFloatingCaptionTextColor3: COLORREF;
  // drop downs
  dxOffice11MenuColor: COLORREF;
  dxOffice11MenuDownedColor1: COLORREF;
  dxOffice11MenuDownedColor2: COLORREF;
  dxOffice11MenuIndentColor1: COLORREF;
  dxOffice11MenuIndentColor2: COLORREF;
  dxOffice11MenuNonRecentIndentColor1: COLORREF;
  dxOffice11MenuNonRecentIndentColor2: COLORREF;
  dxOffice11DropDownBorderColor1: COLORREF;
  dxOffice11DropDownBorderColor2: COLORREF;
  // selected, pressed, downed
  dxOffice11ToolbarSelectedColor: COLORREF;
  dxOffice11SelectedBorderColor: COLORREF;
  dxOffice11SelectedColor1: COLORREF;
  dxOffice11SelectedColor2: COLORREF;
  dxOffice11SelectedDownColor1: COLORREF;
  dxOffice11SelectedDownColor2: COLORREF;
  dxOffice11OwnerControlDownedColor: COLORREF;
  dxOffice11DownedColor: COLORREF;
  dxOffice11DownedSelectedColor: COLORREF;
  // detachable
  dxOffice11DetachableColor: COLORREF;
  dxOffice11DetachableSelectedColor: COLORREF;
  // text
  dxOffice11TextEnabledColor: COLORREF;
  dxOffice11TextDisabledColor: COLORREF;
  // static
  dxOffice11StaticBorderColor: COLORREF;
  // date
  dxOffice11DateHeaderColor: COLORREF;
  // inplace sub item
  dxOffice11InPlaceSubItemColor: COLORREF;
  dxOffice11InPlaceSubItemTextColor: COLORREF;

  { Brushes }

  dxOffice11BarFingerBrush1: HBRUSH;
  dxOffice11BarFingerBrush2: HBRUSH;
  dxOffice11BarSeparatorBrush1: HBRUSH;
  dxOffice11BarSeparatorBrush2: HBRUSH;
  dxOffice11MenuBrush: HBRUSH;
  dxOffice11SelectedBorderBrush: HBRUSH;
  dxOffice11ToolbarSelectedBrush: HBRUSH;
  dxOffice11OwnerControlDownedBrush: HBRUSH;
  dxOffice11DownedBrush: HBRUSH;
  dxOffice11DownedSelectedBrush: HBRUSH;

  dxOffice11DropDownBorderBrush1: HBRUSH;
  dxOffice11DropDownBorderBrush2: HBRUSH;
  dxOffice11DetachableBrush: HBRUSH;
  dxOffice11DetachableSelectedBrush: HBRUSH;

  dxOffice11StaticBorderBrush: HBRUSH;
  dxOffice11InPlaceSubItemBrush: HBRUSH;

  dxOffice11SubMenuExpandBitmap: TBitmap;

function GetLightColor(ABtnFaceColorPart, AHighlightColorPart, AWindowColorPart: Integer): COLORREF;
function GetMiddleRGB(AColor1, AColor2: TColor; APercent: Integer): COLORREF;

procedure CreateOffice11Colors;
procedure RefreshOffice11Colors;
procedure ReleaseOffice11Colors;

procedure FillGradientRect(DC: HDC; const ARect: TRect; AColor1, AColor2: TColor;
  AHorizontal: Boolean);
procedure FillTubeGradientRect(DC: HDC; const ARect: TRect; AColor1, AColor2: TColor;
  AHorizontal: Boolean);
procedure FillRectByColor(DC: HDC; R: TRect; AColor: TColor);
procedure FrameRectByColor(DC: HDC; R: TRect; AColor: TColor);
function GetGradientColorRect(const ARect: TRect; X: Integer; AColor1, AColor2: TColor;
  AHorizontal: Boolean): TColorRef;
procedure Office11FrameSelectedRect(DC: HDC; const R: TRect);
procedure Office11DrawFingerElements(DC: HDC; ARect: TRect; AHorizontal: Boolean);
procedure Office11DrawItemArrow(DC: HDC; R: TRect; ADownArrow: Boolean;
  Enabled, Selected, Flat: Boolean);
procedure Office11DrawLargeItemArrow(DC: HDC; R: TRect; ADownArrow: Boolean;
  Size: Integer; Selected, Enabled, Flat: Boolean);
procedure Office11DrawSizeGrip(DC: HDC; ARect: TRect);

implementation

uses
  dxThemeManager, dxUxTheme, dxThemeConsts;

var
  FCounter: Integer;
  GradientPercent: Integer;
  
procedure PrepareSubMenuExpandBitmap(ABitmap: TBitmap);
var
  I, J: Integer;
  ATransparentColor, AColor1, AColor2, APixelColor: COLORREF;
  AMinValue, AMaxValue, AValue: Byte;
begin
  ATransparentColor := GetPixel(ABitmap.Canvas.Handle, 0, 0);
//  AColor := ColorToRGB(clWindow);
  AColor1 := dxOffice11ToolbarsColor1;
  AColor2 := dxOffice11ToolbarsColor2;
  AMaxValue := 1;
  AMinValue := 255;
  for I := 0 to ABitmap.Width - 1 do
    for J := 0 to ABitmap.Height - 1 do
    begin
      APixelColor := GetPixel(ABitmap.Canvas.Handle, I, J);
      if (APixelColor <> ATransparentColor) and (APixelColor <> 0{mark}) then
      begin
        AValue := GetRValue(APixelColor);
        if AValue > AMaxValue then
          AMaxValue := AValue;
        if AValue < AMinValue then
          AMinValue := AValue;
      end;
    end;
  for I := 0 to ABitmap.Width - 1 do
    for J := 0 to ABitmap.Height - 1 do
    begin
      APixelColor := GetPixel(ABitmap.Canvas.Handle, I, J);
      if (APixelColor <> ATransparentColor) and (APixelColor <> 0{mark}) then
      begin
//        APixelColor := GetMiddleRGB(APixelColor, AColor, 50);
        AValue := GetRValue(APixelColor);
        APixelColor := GetMiddleRGB(AColor1, AColor2, MulDiv(AValue - AMinValue, 100, AMaxValue - AMinValue));
        SetPixel(ABitmap.Canvas.Handle, I, J, APixelColor);
      end;  
    end;
end;

procedure CreateOffice11Brushes;
begin
  dxOffice11BarFingerBrush1 := CreateSolidBrush(dxOffice11BarFingerColor1);
  dxOffice11BarFingerBrush2 := CreateSolidBrush(dxOffice11BarFingerColor2);
  dxOffice11BarSeparatorBrush1 := CreateSolidBrush(dxOffice11BarSeparatorColor1);
  dxOffice11BarSeparatorBrush2 := CreateSolidBrush(dxOffice11BarSeparatorColor2);
  dxOffice11DropDownBorderBrush1 := CreateSolidBrush(dxOffice11DropDownBorderColor1);
  dxOffice11MenuBrush := CreateSolidBrush(dxOffice11MenuColor);
  dxOffice11DropDownBorderBrush2 := dxOffice11MenuBrush;
  dxOffice11SelectedBorderBrush := CreateSolidBrush(dxOffice11SelectedBorderColor);
  dxOffice11OwnerControlDownedBrush := CreateSolidBrush(dxOffice11OwnerControlDownedColor);
  dxOffice11DownedBrush := CreateSolidBrush(dxOffice11DownedColor);
  dxOffice11DownedSelectedBrush := CreateSolidBrush(dxOffice11DownedSelectedColor);
  dxOffice11DetachableBrush := CreateSolidBrush(dxOffice11DetachableColor);
  dxOffice11ToolbarSelectedBrush := CreateSolidBrush(dxOffice11ToolbarSelectedColor);
  dxOffice11DetachableSelectedBrush := dxOffice11ToolbarSelectedBrush;
  dxOffice11StaticBorderBrush := dxOffice11DropDownBorderBrush1;
  dxOffice11InPlaceSubItemBrush := CreateSolidBrush(dxOffice11InPlaceSubItemColor);
  // TODO
  dxOffice11SubMenuExpandBitmap := TBitmap.Create;
  dxOffice11SubMenuExpandBitmap.Handle := LoadBitmap(HInstance, 'DXBARSUBMENUEXPAND');
  PrepareSubMenuExpandBitmap(dxOffice11SubMenuExpandBitmap);
end;

procedure DestroyOffice11Brushes;
begin
  dxOffice11SubMenuExpandBitmap.Free;
  dxOffice11SubMenuExpandBitmap := nil;
  if dxOffice11BarFingerBrush1 <> 0 then DeleteObject(dxOffice11BarFingerBrush1);
  if dxOffice11BarFingerBrush2 <> 0 then DeleteObject(dxOffice11BarFingerBrush2);
  if dxOffice11BarSeparatorBrush1 <> 0 then DeleteObject(dxOffice11BarSeparatorBrush1);
  if dxOffice11BarSeparatorBrush2 <> 0 then DeleteObject(dxOffice11BarSeparatorBrush2);
  if dxOffice11DropDownBorderBrush1 <> 0 then DeleteObject(dxOffice11DropDownBorderBrush1);
  if dxOffice11MenuBrush <> 0 then DeleteObject(dxOffice11MenuBrush);
  if dxOffice11SelectedBorderBrush <> 0 then DeleteObject(dxOffice11SelectedBorderBrush);
  if dxOffice11OwnerControlDownedBrush <> 0 then DeleteObject(dxOffice11OwnerControlDownedBrush);
  if dxOffice11DownedBrush <> 0 then DeleteObject(dxOffice11DownedBrush);
  if dxOffice11DownedSelectedBrush <> 0 then DeleteObject(dxOffice11DownedSelectedBrush);
  if dxOffice11DetachableBrush <> 0 then DeleteObject(dxOffice11DetachableBrush);
  if dxOffice11ToolbarSelectedBrush <> 0 then DeleteObject(dxOffice11ToolbarSelectedBrush);
  if dxOffice11InPlaceSubItemBrush <> 0 then DeleteObject(dxOffice11InPlaceSubItemBrush);
end;

function GetOffice11Scheme: TOffice11Scheme;
const
  SZ_THDOCPROP_DISPLAYNAME = WideString('DisplayName'); // TODO: move to dxThemes.pas
  SZ_THDOCPROP_CANONICALNAME = WideString('ThemeName'); // TODO: move to dxThemes.pas
  SZ_MAX_CHARS = 1024;
  SStandardThemeFileName = 'LUNA.MSSTYLES';
  SNormalColor = 'NORMALCOLOR';
  SHomestead = 'HOMESTEAD';
  SMetallic = 'METALLIC';
var
  PThemeFileName, PThemeColor, PThemeSize: PWideChar;
  S: string;
begin
  Result := schUnknown;
  if AreVisualStylesAvailable([]) then
  begin
    PThemeFileName := AllocMem(2 * SZ_MAX_CHARS);
    PThemeColor := AllocMem(2 * SZ_MAX_CHARS);
    PThemeSize := AllocMem(2 * SZ_MAX_CHARS);
    try
      if FAILED(GetCurrentThemeName(PThemeFileName, SZ_MAX_CHARS, PThemeColor,
        SZ_MAX_CHARS, PThemeSize, SZ_MAX_CHARS)) then
        Exit;
      S := UpperCase(ExtractFileName(PThemeFileName));
      if S = SStandardThemeFileName then
      begin
        S := UpperCase(PThemeColor);
        if S = SNormalColor then
          Result := schNormalColor
        else
          if S = SHomestead then
            Result := schHomestead
          else
            if S = SMetallic then
              Result := schMetallic;
      end;
    finally
      FreeMem(PThemeSize);
      FreeMem(PThemeColor);
      FreeMem(PThemeFileName);
    end;
  end;
end;

function GetRealColor(AColor: COLORREF): COLORREF;
var
  DC: HDC;
begin
  DC := GetDC(0);
  Result := GetNearestColor(DC, AColor);
  ReleaseDC(0, DC);
end;

procedure InitOffice11Colors;
const
  Office11Colors: array[TOffice11SchemeColor, 0..31] of COLORREF = (
    ($FEECDD, $E2A981, $F5BE9E, $F9DAC3, $913500, $F1A675, $76C1FF, $D3F8FF, $98DDFF, $5295FE,
     $9C613B, $E0A47B, $764127, $FFFFFF, $CB8C6A, $FFF9F1, $C9662A, $F9DBC4, $962D00, $F6F6F6,
     $C2EEFF, $800000, $CCF4FF, $91D0FF, $8ED3FF, $4E91FE, $FCE1CB, $6FC0FF, $3E80FE, $F0C7A9,
     $000000, $8D8D8D),
    ($DEF7F4, $91C6B7, $A7D9D9, $E4F0F2, $6B7760, $8CC2B0, $76C1FF, $D3F8FF, $98DDFF, $5295FE,
     $588060, $8FC4B5, $335E51, $FFFFFF, $588060, $DEF7F4, $5E8674, $ADDEE1, $5E8D75, $EEF4F4,
     $C2EEFF, $385D3F, $CCF4FF, $91D0FF, $8ED3FF, $4E91FE, $B6E3D8, $6FC0FF, $3E80FE, $9FD4C5,
     $000000, $8D8D8D),
    ($FAF4F3, $B59799, $E5D7D7, $F7F3F3, $927476, $C8B2B3, $76C1FF, $D3F8FF, $98DDFF, $5295FE,
     $947C7C, $B09193, $755454, $FFFFFF, $8F6D6E, $FFFFFF, $99797A, $E4DADB, $947C7C, $FFFAFD,
     $C2EEFF, $6F4B4B, $CCF4FF, $91D0FF, $8ED3FF, $4E91FE, $E7D3D6, $6FC0FF, $3E80FE, $D3C0C0,
     $000000, $8D8D8D)
  );
  Office11GradientPercents: array[TOffice11SchemeColor] of Integer = (41, 125, 40);
var
  AOffice11Scheme: TOffice11Scheme;
  I: Integer;
begin
  AOffice11Scheme := GetOffice11Scheme;
  if AreVisualStylesAvailable([]) and (AOffice11Scheme <> schUnknown){luna} then
  begin
    dxOffice11ToolbarsColor1 := Office11Colors[AOffice11Scheme, 0];
    dxOffice11ToolbarsColor2 := Office11Colors[AOffice11Scheme, 1];
    dxOffice11DockColor1 := Office11Colors[AOffice11Scheme, 2];
    dxOffice11DockColor2 := Office11Colors[AOffice11Scheme, 3];
    // bar: mark
    dxOffice11BarMarkColors2[1] := Office11Colors[AOffice11Scheme, 4];
    dxOffice11BarMarkColors1[1] := Office11Colors[AOffice11Scheme, 5];
    dxOffice11BarMarkColors2[2] := Office11Colors[AOffice11Scheme, 6];
    dxOffice11BarMarkColors1[2] := Office11Colors[AOffice11Scheme, 7];
    dxOffice11BarMarkColors2[3] := Office11Colors[AOffice11Scheme, 8];
    dxOffice11BarMarkColors1[3] := Office11Colors[AOffice11Scheme, 9];
    // bar: border
    dxOffice11BarBorderColors[1] := Office11Colors[AOffice11Scheme, 10];
    dxOffice11BarBorderColors[2] := Office11Colors[AOffice11Scheme, 11];
    // bar: border and mark (Normal, Selected, Downed)
    for I := 1 to 3 do
      dxOffice11BarBorderMarkColors[1, I] := GetMiddleRGB(dxOffice11BarMarkColors1[I], dxOffice11ToolbarsColor1, 90); // #6 ???
    for I := 1 to 3 do
      dxOffice11BarBorderMarkColors[2, I] := GetMiddleRGB(dxOffice11BarMarkColors2[I], dxOffice11BarBorderColors[2], 50); // #9
    // bar: finger
    dxOffice11BarFingerColor1 := Office11Colors[AOffice11Scheme, 12];
    dxOffice11BarFingerColor2 := Office11Colors[AOffice11Scheme, 13];
    // bar: separator
    dxOffice11BarSeparatorColor1 := Office11Colors[AOffice11Scheme, 14];
    dxOffice11BarSeparatorColor2 := Office11Colors[AOffice11Scheme, 15];
    // bar: mark arrow
    dxOffice11BarMarkArrowColor1 := ColorToRGB(clBlack);
    dxOffice11BarMarkArrowColor2 := ColorToRGB(clWhite);
    // bar: floating
    dxOffice11BarFloatingBorderColor1 := Office11Colors[AOffice11Scheme, 16];
    dxOffice11BarFloatingBorderColor2 := Office11Colors[AOffice11Scheme, 17];
    dxOffice11BarFloatingCaptionTextColor1 := ColorToRGB(clWhite);
    dxOffice11BarFloatingCaptionTextColor2 := ColorToRGB(clBlack);
    dxOffice11BarFloatingCaptionTextColor3 := ColorToRGB(clBlack);
    // drop downs, menus
    dxOffice11DropDownBorderColor1 := Office11Colors[AOffice11Scheme, 18];
    dxOffice11MenuColor := Office11Colors[AOffice11Scheme, 19];
    // selected
    dxOffice11ToolbarSelectedColor := Office11Colors[AOffice11Scheme, 20];
    dxOffice11SelectedBorderColor := Office11Colors[AOffice11Scheme, 21];
    dxOffice11SelectedColor1 := Office11Colors[AOffice11Scheme, 22];
    dxOffice11SelectedColor2 := Office11Colors[AOffice11Scheme, 23];
    dxOffice11SelectedDownColor1 := Office11Colors[AOffice11Scheme, 24];
    dxOffice11SelectedDownColor2 := Office11Colors[AOffice11Scheme, 25];
    dxOffice11OwnerControlDownedColor := Office11Colors[AOffice11Scheme, 26];
    dxOffice11DownedColor := Office11Colors[AOffice11Scheme, 27];
    dxOffice11DownedSelectedColor := Office11Colors[AOffice11Scheme, 28];
    // detachable
    dxOffice11DetachableColor := Office11Colors[AOffice11Scheme, 29];
    // text
    dxOffice11TextEnabledColor := Office11Colors[AOffice11Scheme, 30];
    dxOffice11TextDisabledColor := Office11Colors[AOffice11Scheme, 31];
    // Gradient Tube Percent
    GradientPercent := Office11GradientPercents[AOffice11Scheme];
  end
  else
  begin
    dxOffice11DockColor1 := ColorToRGB(clBtnFace);
    dxOffice11DockColor2 := GetMiddleRGB(clBtnFace, clWindow, 20);
    dxOffice11ToolbarsColor1 := GetMiddleRGB(clBtnFace, clWindow, 22);
    dxOffice11ToolbarsColor2 := GetMiddleRGB(clBtnFace, clWindow, 96);
    // bar: mark
    dxOffice11BarMarkColors2[1] := ColorToRGB(clBtnShadow);
    dxOffice11BarMarkColors1[1] := GetMiddleRGB(dxOffice11BarMarkColors2[1], clWindow, 74);
    // TODO
    dxOffice11BarMarkColors1[2] := GetRealColor(GetLightColor(-15, 29, 100--15-29)); // Selected
  //  dxOffice11BarMarkColors1[2] := FlatToolbarsSelColor;
    dxOffice11BarMarkColors2[2] := dxOffice11BarMarkColors1[2];
    dxOffice11BarMarkColors1[3] := GetRealColor(GetLightColor(42, 11, 100-42-11)); // Downed
    dxOffice11BarMarkColors2[3] := dxOffice11BarMarkColors1[3];
    // bar: border
    dxOffice11BarBorderColors[1] := GetMiddleRGB(clBtnFace, clWindow, 85);
    dxOffice11BarBorderColors[2] := ColorToRGB(clBtnFace);
    // bar: border and mark (Normal, Selected, Downed)
    for I := 1 to 3 do
      dxOffice11BarBorderMarkColors[1, I] := GetMiddleRGB(dxOffice11BarMarkColors2[I], clWindow, 50); // #6
    for I := 1 to 3 do
      dxOffice11BarBorderMarkColors[2, I] := GetMiddleRGB(dxOffice11BarMarkColors2[I], dxOffice11BarBorderColors[2], 50); // #9
    // bar: finger
    dxOffice11BarFingerColor1 := GetMiddleRGB(clBtnShadow, clWindow, 76); 
    dxOffice11BarFingerColor2 := ColorToRGB(clWindow);
    // bar: separator
    dxOffice11BarSeparatorColor1 := GetMiddleRGB(clBtnShadow, clWindow, 70);
    dxOffice11BarSeparatorColor2 := ColorToRGB(clWhite);
    // bar: mark arrow
    dxOffice11BarMarkArrowColor1 := ColorToRGB(clBtnText);
    dxOffice11BarMarkArrowColor2 := ColorToRGB(clWindow);
    // bar: floating
    dxOffice11BarFloatingBorderColor1 := ColorToRGB(clBtnShadow);
    dxOffice11BarFloatingBorderColor2 := dxOffice11ToolbarsColor2;
    dxOffice11BarFloatingCaptionTextColor1 := ColorToRGB(clBtnHighlight);
    dxOffice11BarFloatingCaptionTextColor2 := ColorToRGB(clBtnText);
    dxOffice11BarFloatingCaptionTextColor3 := ColorToRGB(clBtnText);
    // drop down
    dxOffice11DropDownBorderColor1 := ColorToRGB(clBtnShadow); // ?
    dxOffice11MenuColor := ColorToRGB(clWindow); // ?
    // selected
    dxOffice11ToolbarSelectedColor := GetRealColor(GetLightColor(-2, 30, 72)); // ?
    dxOffice11SelectedBorderColor := ColorToRGB(clHighlight);
    dxOffice11SelectedColor1 := dxOffice11ToolbarSelectedColor;
    dxOffice11SelectedColor2 := dxOffice11ToolbarSelectedColor;
    dxOffice11OwnerControlDownedColor := dxOffice11ToolbarsColor2;
    dxOffice11DownedColor := GetRealColor(GetLightColor(11, 9, 73)); // ?
    dxOffice11DownedSelectedColor := GetRealColor(GetLightColor(14, 44, 40)); // ?
    dxOffice11SelectedDownColor1 := dxOffice11DownedSelectedColor;
    dxOffice11SelectedDownColor2 := dxOffice11DownedSelectedColor;
    // detachable
    dxOffice11DetachableColor := dxOffice11OwnerControlDownedColor;
    // text
    dxOffice11TextEnabledColor := ColorToRGB(clBtnText);
    dxOffice11TextDisabledColor := ColorToRGB(clGrayText);
    // Gradient Tube Percent
    GradientPercent := 75;
  end;
  // bar: floating
  dxOffice11BarFloatingBorderColor3 := dxOffice11ToolbarsColor1;
  dxOffice11BarFloatingCaptionColor := dxOffice11BarFloatingBorderColor1;
  // drop downs, menus
  dxOffice11DropDownBorderColor2 := dxOffice11MenuColor;
  dxOffice11MenuDownedColor1 := dxOffice11ToolbarsColor1;
  dxOffice11MenuDownedColor2 := dxOffice11ToolbarsColor2;
  dxOffice11MenuIndentColor1 := dxOffice11ToolbarsColor1;
  dxOffice11MenuIndentColor2 := dxOffice11ToolbarsColor2;
  dxOffice11MenuNonRecentIndentColor1 := GetMiddleRGB(dxOffice11MenuIndentColor1, clBlack, 92);
  dxOffice11MenuNonRecentIndentColor2 := GetMiddleRGB(dxOffice11MenuIndentColor2, clBlack, 92);
  // selected
  dxOffice11DetachableSelectedColor := dxOffice11ToolbarSelectedColor;
  // static
  dxOffice11StaticBorderColor := dxOffice11DropDownBorderColor1;
  // date
  dxOffice11DateHeaderColor := dxOffice11DockColor1;
  // inplace sub item
  dxOffice11InPlaceSubItemColor := dxOffice11BarBorderMarkColors[2, 1];
  dxOffice11InPlaceSubItemTextColor := dxOffice11BarFloatingCaptionTextColor1;
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

function GetMiddleRGB(AColor1, AColor2: TColor; APercent: Integer): COLORREF;

  function CalcValue(Value1, Value2: Byte): Byte;
  var
    I: Integer;
  begin
    I := MulDiv(Value1, APercent, 100) + MulDiv(Value2, 100 - APercent, 100);
    if I > 255 then I := 255;
    Result := I;
  end;

begin
  AColor1 := ColorToRGB(AColor1);
  AColor2 := ColorToRGB(AColor2);
  Result := RGB(
    CalcValue(GetRValue(AColor1), GetRValue(AColor2)),
    CalcValue(GetGValue(AColor1), GetGValue(AColor2)),
    CalcValue(GetBValue(AColor1), GetBValue(AColor2)));
  Result := GetRealColor(Result);
end;

procedure CreateOffice11Colors;
begin
  if FCounter = 0 then
  begin
    InitOffice11Colors;
    CreateOffice11Brushes;
  end;  
  Inc(FCounter);
end;

procedure RefreshOffice11Colors;
begin
  InitOffice11Colors;
  if FCounter <> 0 then
  begin
    DestroyOffice11Brushes;
    CreateOffice11Brushes;
  end;
end;

procedure ReleaseOffice11Colors;
begin
  Dec(FCounter);
  if FCounter = 0 then
    DestroyOffice11Brushes;
end;

procedure FillGradientRect(DC: HDC; const ARect: TRect; AColor1, AColor2: TColor;
  AHorizontal: Boolean);
var
  FromR, ToR, FromG, ToG, FromB, ToB: Byte;
  SR: TRect;
  W, I, N: Integer;
  R, G, B: Byte;
  ABrush: HBRUSH;
  ALeft, ARight, ARectLeft, ARectRight: ^Integer;
begin
  AColor1 := ColorToRGB(AColor1);
  AColor2 := ColorToRGB(AColor2);
  if AColor1 = AColor2 then
  begin
    ABrush := CreateSolidBrush(AColor1);
    FillRect(DC, ARect, ABrush);
    DeleteObject(ABrush);
    Exit;
  end;
  FromR := GetRValue(AColor1);
  FromG := GetGValue(AColor1);
  FromB := GetBValue(AColor1);
  ToR := GetRValue(AColor2);
  ToG := GetGValue(AColor2);
  ToB := GetBValue(AColor2);
  SR := ARect;
  if AHorizontal then
  begin
    ALeft := @SR.Left;
    ARight := @SR.Right;
    ARectLeft := @ARect.Left;
    ARectRight := @ARect.Right;
  end
  else
  begin
    ALeft := @SR.Top;
    ARight := @SR.Bottom;
    ARectLeft := @ARect.Top;
    ARectRight := @ARect.Bottom;
  end;
  W := ARight^ - ALeft^;
  N := 256;
  if W < N then
    N := W;
  for I := 0 to N - 1 do
  begin
    ARight^ := ARectLeft^ + MulDiv(I + 1, W, N);
    R := FromR + MulDiv(I, ToR - FromR, N - 1);
    G := FromG + MulDiv(I, ToG - FromG, N - 1);
    B := FromB + MulDiv(I, ToB - FromB, N - 1);
    if not IsRectEmpty(SR) then
    begin
      ABrush := CreateSolidBrush(RGB(R, G, B));
      FillRect(DC, SR, ABrush);
      DeleteObject(ABrush);
    end;
    ALeft^ := ARight^;
    if ALeft^ >= ARectRight^ then
      Break;
  end;
end;

procedure FillTubeGradientRect(DC: HDC; const ARect: TRect; AColor1, AColor2: TColor;
  AHorizontal: Boolean);
var
  FromR, FromG, FromB, ToR, ToG, ToB: Integer;
  ToR1, ToG1, ToB1, ToR2, ToG2, ToB2: Integer;
  SR: TRect;
  W, I, N, M: Integer;
  R, G, B: Byte;
  ABrush: HBRUSH;
  ALeft, ARight, ARectLeft, ARectRight: ^Integer;

begin
  AColor1 := ColorToRGB(AColor1);
  AColor2 := ColorToRGB(AColor2);
  if AColor1 = AColor2 then
  begin
    ABrush := CreateSolidBrush(AColor1);
    FillRect(DC, ARect, ABrush);
    DeleteObject(ABrush);
    Exit;
  end;

  FromR := GetRValue(AColor1);
  FromG := GetGValue(AColor1);
  FromB := GetBValue(AColor1);
  ToR := GetRValue(AColor2);
  ToG := GetGValue(AColor2);
  ToB := GetBValue(AColor2);
  SR := ARect;
  if AHorizontal then
  begin
    ALeft := @SR.Left;
    ARight := @SR.Right;
    ARectLeft := @ARect.Left;
    ARectRight := @ARect.Right;
  end
  else
  begin
    ALeft := @SR.Top;
    ARight := @SR.Bottom;
    ARectLeft := @ARect.Top;
    ARectRight := @ARect.Bottom;
  end;
  W := ARight^ - ALeft^;

  M := W div 2;
  ToR1 := FromR - MulDiv(FromR - ToR, GradientPercent, 200);
  ToG1 := FromG - MulDiv(FromG - ToG, GradientPercent, 200);
  ToB1 := FromB - MulDiv(FromB - ToB, GradientPercent, 200);

  ToR2 := FromR - MulDiv(FromR - ToR1, W, M);
  ToG2 := FromG - MulDiv(FromG - ToG1, W, M);
  ToB2 := FromB - MulDiv(FromB - ToB1, W, M);

  N := 256;
  if W < N then
    N := W;
  for I := 0 to N - 1 do
  begin
    ARight^ := ARectLeft^ + MulDiv(I + 1, W, N);

    if I < M then
    begin
      R := FromR + MulDiv(I, ToR2 - FromR, N - 1);
      G := FromG + MulDiv(I, ToG2 - FromG, N - 1);
      B := FromB + MulDiv(I, ToB2 - FromB, N - 1);
    end
    else
      if I = M then
      begin
        R := ToR1;
        G := ToG1;
        B := ToB1;
        FromR := ToR + MulDiv(ToR1 - ToR, W, M);
        FromG := ToG + MulDiv(ToG1 - ToG, W, M);
        FromB := ToB + MulDiv(ToB1 - ToB, W, M);
      end
      else
      begin
        R := FromR + MulDiv(I, ToR - FromR, N - 1);
        G := FromG + MulDiv(I, ToG - FromG, N - 1);
        B := FromB + MulDiv(I, ToB - FromB, N - 1);
      end;

    if not IsRectEmpty(SR) then
    begin
      ABrush := CreateSolidBrush(RGB(R, G, B));
      FillRect(DC, SR, ABrush);
      DeleteObject(ABrush);
    end;
    ALeft^ := ARight^;
    if ALeft^ >= ARectRight^ then
      Break;
  end;
end;

procedure FillRectByColor(DC: HDC; R: TRect; AColor: TColor);
var
  ABrush: HBRUSH;
begin
  ABrush := CreateSolidBrush(ColorToRGB(AColor));
  FillRect(DC, R, ABrush);
  DeleteObject(ABrush);
end;

procedure FrameRectByColor(DC: HDC; R: TRect; AColor: TColor);
var
  ABrush: HBRUSH;
begin
  ABrush := CreateSolidBrush(ColorToRGB(AColor));
  FrameRect(DC, R, ABrush);
  DeleteObject(ABrush);
end;

function GetGradientColorRect(const ARect: TRect; X: Integer; AColor1, AColor2: TColor;
  AHorizontal: Boolean): TColorRef;
var
  FromR, ToR, FromG, ToG, FromB, ToB: Byte;
  ARectLeft, W, I, N: Integer;
  R, G, B: Byte;
begin
  AColor1 := ColorToRGB(AColor1);
  AColor2 := ColorToRGB(AColor2);
  FromR := GetRValue(AColor1);
  FromG := GetGValue(AColor1);
  FromB := GetBValue(AColor1);
  ToR := GetRValue(AColor2);
  ToG := GetGValue(AColor2);
  ToB := GetBValue(AColor2);
  if AHorizontal then
  begin
    ARectLeft := ARect.Left;
    W := ARect.Right - ARect.Left;
  end
  else
  begin
    ARectLeft := ARect.Top;
    W := ARect.Bottom - ARect.Top;
  end;
  N := 256;
  if W < N then
    N := W;
  I := MulDiv(X - ARectLeft + 1, N, W) - 1;
  if I < 0 then I := 0;
  R := FromR + MulDiv(I, ToR - FromR, N - 1);
  G := FromG + MulDiv(I, ToG - FromG, N - 1);
  B := FromB + MulDiv(I, ToB - FromB, N - 1);
  Result := RGB(R, G, B);
end;

procedure Office11FrameSelectedRect(DC: HDC; const R: TRect);
begin
  FrameRect(DC, R, dxOffice11SelectedBorderBrush);
end;

procedure Office11DrawFingerElements(DC: HDC; ARect: TRect; AHorizontal: Boolean);
var
  R1, R2: TRect;
  W: Integer;
begin
  with ARect do
    R1 := Rect(Left, Top, Left + 4, Top + 4);
  if AHorizontal then
  begin
    W := ARect.Bottom - ARect.Top;
    W := W - (W div 4) * 4;
    if W > 1 then W := W div 2;
    OffsetRect(R1, 0, W);
  end
  else
  begin
    W := ARect.Right - ARect.Left;
    W := W - (W div 4) * 4;
    if W > 1 then W := W div 2;
    OffsetRect(R1, W, 0);
  end;
  repeat
    R2 := R1;
    InflateRect(R2, -1, -1);
    FillRect(DC, R2, dxOffice11BarFingerBrush2);
    OffsetRect(R2, -1, -1);
    FillRect(DC, R2, dxOffice11BarFingerBrush1);
    if AHorizontal then
    begin
      OffsetRect(R1, 0, 4);
      if R1.Bottom > ARect.Bottom then Break;
    end
    else
    begin
      OffsetRect(R1, 4, 0);
      if R1.Right > ARect.Right then Break;
    end;
  until False;
end;

procedure Office11DrawItemArrow(DC: HDC; R: TRect; ADownArrow: Boolean;
  Enabled, Selected, Flat: Boolean);
var
  Size: Integer;
begin
  if not ADownArrow then
    Size := R.Bottom - R.Top - 6
  else  // atDown
    Size := R.Right - R.Left - 8;
  Size := (Size - 1) div 2 + Byte(Size mod 2 <> 0);
  if Size < 3 then Size := 3;
  Office11DrawLargeItemArrow(DC, R, ADownArrow, Size, Selected, Enabled, Flat);
end;

procedure Office11DrawLargeItemArrow(DC: HDC; R: TRect; ADownArrow: Boolean;
  Size: Integer; Selected, Enabled, Flat: Boolean);
var
  Color: COLORREF;
  X, Y: Integer;
  P: array[1..3] of TPoint;
  Pen: HPEN;
  Brush: HBRUSH;

  procedure DrawEnabled;
  begin
    with R do
      if not ADownArrow then
      begin
        X := (Left + Right - Size) div 2;
        Y := (Top + Bottom - (2 * Size - 1)) div 2;
        P[1] := Point(X, Y);
        P[2] := Point(X, Y + 2 * Size - 2);
      end
      else  // atDown
      begin
        X := (Left + Right - (2 * Size - 1)) div 2;
        Y := (Top + Bottom - Size) div 2;
        P[1] := Point(X, Y);
        P[2] := Point(X + 2 * Size - 2, Y);
      end;
    P[3] := Point(X + Size - 1, Y + Size - 1);

    Pen := SelectObject(DC, CreatePen(PS_SOLID, 1, Color));
    Brush := SelectObject(DC, CreateSolidBrush(Color));
    Polygon(DC, P, 3);
    DeleteObject(SelectObject(DC, Brush));
    DeleteObject(SelectObject(DC, Pen));
  end;

begin
  if Enabled then
    Color := dxOffice11TextEnabledColor
  else
    Color := dxOffice11TextDisabledColor;
  DrawEnabled;
end;

procedure Office11DrawSizeGrip(DC: HDC; ARect: TRect);
begin
  ARect := Rect(ARect.Right - 12, ARect.Bottom - 3, ARect.Right, ARect.Bottom);
  Office11DrawFingerElements(DC, ARect, False); // 3
  Inc(ARect.Left, 4);
  OffsetRect(ARect, 0, -4);
  Office11DrawFingerElements(DC, ARect, False); // 2
  Inc(ARect.Left, 4);
  OffsetRect(ARect, 0, -4);
  Office11DrawFingerElements(DC, ARect, False); // 1
end;

end.

