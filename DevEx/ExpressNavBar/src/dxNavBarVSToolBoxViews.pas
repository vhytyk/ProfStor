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

unit dxNavBarVSToolBoxViews;

{$I dxNavBarVer.inc}

interface

uses
  Windows, Graphics,
  dxNavBar, dxNavBarCollns, dxNavBarStyles, dxNavBarBaseViews;

type
  TdxNavBarVSToolBoxLinkViewInfo = class(TdxNavBarLinkViewInfo)
  public
    function SelectionRect: TRect; override;
  end;

  TdxNavBarVSToolBoxViewInfo = class(TdxNavBarBaseViewInfo)
  protected
    class function GetGroupCaptionHeightAddon: Integer; override;
    class function GetGroupSeparatorWidth: Integer; override;
    class function GetGroupCaptionSeparatorWidth: Integer; override;

    function CanHasScrollButtonInGroupCaption: Boolean; override;
    function CanLinksUseLargeImages: Boolean; override;

    function GetTopScrollButtonRect: TRect; override;
    function GetBottomScrollButtonRect: TRect; override;

    function GetLinkHintRect(ALink: TdxNavBarItemLink): TRect; override;
    function GetLinkHintText(ALink: TdxNavBarItemLink): string; override;
  public
    function GetLinkViewInfoAtSelectedPos(pt: TPoint): TdxNavBarLinkViewInfo; override;
    function HintDelay: Integer; override;
  end;

  TdxNavBarVSToolBoxPainter = class(TdxNavBarFlatPainter)
  protected
    procedure DrawLinkHintWindow; override;

    class function ViewInfoClass: TdxNavBarViewInfoClass; override;
    class function LinkViewInfoClass: TdxNavBarLinkViewInfoClass; override;
    class function ButtonPainterClass: TdxBaseButtonPainterClass; override;
    class function SelectionPainterClass: TdxBaseSelectionPainterClass; override;
  public
    procedure AssignDefaultBackgroundStyle; override;
    procedure AssignDefaultGroupBackgroundStyle; override;
    procedure AssignDefaultGroupHeaderStyle; override;
    procedure AssignDefaultItemStyle; override;
    procedure AssignDefaultItemDisabledStyle; override;
  end;

implementation

uses
  dxNavBarViewsFact, dxNavBarGraphics, Controls;

{ TdxNavBarVSToolBoxLinkViewInfo }

function TdxNavBarVSToolBoxLinkViewInfo.SelectionRect: TRect;
begin
  Result := Rect;
  InflateRect(Result, -1, -1);
end;

{ TdxNavBarVSToolBoxViewInfo }

function TdxNavBarVSToolBoxViewInfo.GetLinkViewInfoAtSelectedPos(pt: TPoint): TdxNavBarLinkViewInfo;
var
  I: Integer;
  AGroupViewInfo: TdxNavBarGroupViewInfo;
begin
  Result := nil;
  AGroupViewInfo := GetGroupViewInfoAtItemsPos(pt);
  if AGroupViewInfo <> nil then
    for I := 0 to AGroupViewInfo.ItemCount - 1 do
      if ptInRect(AGroupViewInfo.Items[I].Rect, pt) then
      begin
        Result := AGroupViewInfo.Items[I];
        break;
      end;
end;

function TdxNavBarVSToolBoxViewInfo.HintDelay: Integer; 
begin
  Result := 0;
end;

function TdxNavBarVSToolBoxViewInfo.CanHasScrollButtonInGroupCaption: Boolean;
begin
  Result := True;
end;

function TdxNavBarVSToolBoxViewInfo.CanLinksUseLargeImages: Boolean;
begin
  Result := False;
end;

class function TdxNavBarVSToolBoxViewInfo.GetGroupCaptionHeightAddon: Integer;
begin
  Result := 4;
end;

class function TdxNavBarVSToolBoxViewInfo.GetGroupSeparatorWidth: Integer;
begin
  Result := 1;
end;

class function TdxNavBarVSToolBoxViewInfo.GetGroupCaptionSeparatorWidth: Integer;
begin
  Result := 2;
end;

function TdxNavBarVSToolBoxViewInfo.GetTopScrollButtonRect: TRect;
begin
  SetRectEmpty(Result);
  if GroupCount > 0 then
  begin
    Result := ActiveGroupViewInfo.CaptionRect;
    Result.Left := Result.Right - (ActiveGroupViewInfo.CaptionRect.Bottom - ActiveGroupViewInfo.CaptionRect.Top);
    OffsetRect(Result, (Result.Right - Result.Left) + 2, 0);
  end;
end;

function TdxNavBarVSToolBoxViewInfo.GetBottomScrollButtonRect: TRect;
var
  AGroupViewInfo: TdxNavBarGroupViewInfo;
begin
  SetRectEmpty(Result);
  if GroupCount > 0 then
  begin
    if IndexOfGroupViewInfo(ActiveGroupViewInfo) < GroupCount - 1 then
    begin
      AGroupViewInfo := Groups[IndexOfGroupViewInfo(ActiveGroupViewInfo) + 1];
      Result := AGroupViewInfo.CaptionRect;
      Result.Left := Result.Right - (AGroupViewInfo.CaptionRect.Bottom - AGroupViewInfo.CaptionRect.Top);
      OffsetRect(Result, (Result.Right - Result.Left) + 2, 0);
    end
    else
    begin
      Result := ActiveGroupViewInfo.CaptionRect;
      Result.Left := Result.Right - (ActiveGroupViewInfo.CaptionRect.Bottom - ActiveGroupViewInfo.CaptionRect.Top);
      OffsetRect(Result, (Result.Right - Result.Left) + 2,
        ActiveGroupViewInfo.ItemsRect.Bottom - ActiveGroupViewInfo.ItemsRect.Top);
    end;
  end;
end;

function TdxNavBarVSToolBoxViewInfo.GetLinkHintRect(ALink: TdxNavBarItemLink): TRect;
var
  pt: TPoint;
  R: TRect;
  ALinkViewInfo: TdxNavBarLinkViewInfo;
begin
  ALinkViewInfo := GetLinkViewInfoByLink(ALink);
  if ALinkViewInfo <> nil then
  begin
    Painter.HintWindowCanvas.Font := HintFont;
    Result := ALinkViewInfo.SelectionRect;
    R := ALinkViewInfo.SelectionRect;
    DrawText(Painter.HintWindowDC, PChar(HintText), -1, R, DT_CALCRECT or
      ALinkViewInfo.GetDrawEdgeFlag);
    if R.Right - R.Left > ALinkViewInfo.CaptionRect.Right - ALinkViewInfo.CaptionRect.Left then
      Result.Right := ALinkViewInfo.CaptionRect.Left + (R.Right - R.Left) + 4;
    pt := NavBar.ClientToScreen(NavBar.ClientRect.TopLeft);
    OffsetRect(Result, pt.X, pt.Y);
  end
  else Result := inherited GetLinkHintRect(ALink);
end;

function TdxNavBarVSToolBoxViewInfo.GetLinkHintText(ALink: TdxNavBarItemLink): string;
begin
  Result := inherited GetLinkHintText(ALink);
  if Result = '' then Result := ALink.Item.Caption;
end;

{ TdxNavBarVSToolBoxPainter }

procedure TdxNavBarVSToolBoxPainter.AssignDefaultBackgroundStyle;
begin
  with NavBar.DefaultStyles do
  begin
    Background.Image.Graphic := nil;
    Background.BackColor := clBtnFace;
    Background.BackColor2 := clBtnFace;
    Background.AlphaBlending := 255;
    Background.AlphaBlending2 := 255;
  end;
end;

procedure TdxNavBarVSToolBoxPainter.AssignDefaultGroupBackgroundStyle;
begin
  with NavBar.DefaultStyles do
  begin
    GroupBackground.Image.Graphic := nil;
    GroupBackground.BackColor := clBtnFace;
    GroupBackground.BackColor2 := clBtnFace        ;
    GroupBackground.AlphaBlending := 255;
    GroupBackground.AlphaBlending2 := 255;
  end;
end;

procedure TdxNavBarVSToolBoxPainter.AssignDefaultGroupHeaderStyle;
begin
  with NavBar.DefaultStyles do
  begin
    GroupHeader.Image.Graphic := nil;
    GroupHeader.BackColor := clBtnFace;
    GroupHeader.BackColor2 := clBtnFace;
    GroupHeader.AlphaBlending := 255;
    GroupHeader.AlphaBlending2 := 255;
    GroupHeader.Font.Color := clBtnText;
    GroupHeader.Font.Size := 8;
    GroupHeader.Font.Style := [];
    GroupHeader.Font.Name := 'MS Sans Serif';
    GroupHeader.HAlignment := haLeft;
    GroupHeader.VAlignment := vaCenter;
  end;
end;

procedure TdxNavBarVSToolBoxPainter.AssignDefaultItemStyle;
begin
  with NavBar.DefaultStyles do
  begin
    Item.Image.Graphic := nil;
    Item.Font.Color := clBtnText;
    Item.Font.Size := 8;
    Item.Font.Style := [];
    Item.Font.Name := 'MS Sans Serif';
    Item.HAlignment := haCenter;
    Item.VAlignment := vaCenter;
  end;
end;

procedure TdxNavBarVSToolBoxPainter.AssignDefaultItemDisabledStyle;
begin
  with NavBar.DefaultStyles do
  begin
    ItemDisabled.Assign(NavBar.DefaultStyles.Item);
    ItemDisabled.Font.Color := clBtnShadow;
  end;
end;

procedure TdxNavBarVSToolBoxPainter.DrawLinkHintWindow;
var
  R: TRect;
  AWidth: Integer;
  ALinkViewInfo: TdxNavBarLinkViewInfo;
begin
  ALinkViewInfo := ViewInfo.GetLinkViewInfoByLink(NavBar.HotTrackedLink);
  if ALinkViewInfo <> nil then
    with ALinkViewInfo do
    begin
      AWidth := (ViewInfo.HintRect.Right - ViewInfo.HintRect.Left) - (SelectionRect.Right - SelectionRect.Left);
      R := SelectionRect;
      OffsetRect(R, - SelectionRect.Left, - SelectionRect.Top);
      if AWidth > 0 then R.Right := R.Right + AWidth;
      with ALinkViewInfo.GroupViewInfo do
        BackgroundPainterClass.DrawBackground(HintWindowCanvas, R, BgImage, True,
            BgBackColor, BgBackColor2, BgAlphaBlend, BgAlphaBlend2, BgGradientMode);
      SelectionPainterClass.DrawSelection(HintWindowCanvas, R, GroupViewInfo.BgBackColor, [sHotTracked]);
      R := ImageRect;
      OffsetRect(R, - SelectionRect.Left, - SelectionRect.Top);
      ImagePainterClass.DrawImage(HintWindowCanvas, ImageList, ImageIndex, R);
      R := CaptionRect;
      OffsetRect(R, - SelectionRect.Left, - SelectionRect.Top);
      AWidth := (ViewInfo.HintRect.Right - ViewInfo.HintRect.Left);
      R.Right := R.Left + AWidth;
      HintWindowCanvas.Font := ALinkViewInfo.Font;
      HintWindowCanvas.Brush.Style := bsClear;
      DrawText(HintWindowDC, PChar(ViewInfo.HintText), Length(ViewInfo.HintText), R, GetDrawEdgeFlag);
    end;
end;

class function TdxNavBarVSToolBoxPainter.ViewInfoClass: TdxNavBarViewInfoClass;
begin
  Result := TdxNavBarVSToolBoxViewInfo;
end;

class function TdxNavBarVSToolBoxPainter.LinkViewInfoClass: TdxNavBarLinkViewInfoClass;
begin
  Result := TdxNavBarVSToolBoxLinkViewInfo;
end;

class function TdxNavBarVSToolBoxPainter.ButtonPainterClass: TdxBaseButtonPainterClass;
begin
  Result := TdxNavBarVSToolBoxButtonPainter;
end;

class function TdxNavBarVSToolBoxPainter.SelectionPainterClass: TdxBaseSelectionPainterClass;
begin
  Result := TdxNavBarVSToolBoxSelectionPainter;
end;

initialization
  dxNavBarViewsFactory.RegisterView(5, 'VSToolBoxView', TdxNavBarVSToolBoxPainter);


end.
