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

unit dxNavBarExplorerViews;

{$I dxNavBarVer.inc}

interface

uses
  Windows, Graphics, dxNavBar, dxNavBarCollns, dxNavBarStyles;

type
  TdxNavBarExplorerBarViewInfo = class(TdxNavBarViewInfo)
  protected
    class function GetGroupBorderWidth: Integer; override;
    class function GetGroupCaptionHeightAddon: Integer; override;
    class function GetGroupSeparatorWidth: Integer; override;
    class function GetGroupHorizontalEdge: Integer; override;

    function CanHasImageInGroupCaption: Boolean; override;
    function CanHasSignInGroupCaption: Boolean; override;
    function CanHasGroupViewAsIconView: Boolean; override;
    function CanHasVisibleItemsInGroup(AGroup: TdxNavBarGroup): Boolean; override;

    procedure RecreateInfo; override;
    procedure Recalculate; override;
  end;

  TdxNavBarExplorerBarPainter = class(TdxNavBarPainter)
  protected
    procedure DrawGroupBorder(AGroupViewInfo: TdxNavBarGroupViewInfo); override;

    class function ViewInfoClass: TdxNavBarViewInfoClass; override;
    class function BackgroundPainterClass: TdxBaseBackgroundPainterClass; override;
    class function ButtonPainterClass: TdxBaseButtonPainterClass; override;
    class function ImagePainterClass: TdxBaseImagePainterClass; override;
    class function SignPainterClass: TdxBaseSignPainterClass; override;
  public
    procedure AssignDefaultBackgroundStyle; override;
    procedure AssignDefaultGroupBackgroundStyle; override;
    procedure AssignDefaultGroupHeaderStyle; override;
    procedure AssignDefaultItemStyle; override;
    procedure AssignDefaultItemDisabledStyle; override;
    procedure AssignDefaultItemHotTrackedStyle; override;

    procedure DoGroupActivate(AGroup: TdxNavBarGroup); override;
    procedure DoGroupDeactivate(AGroup: TdxNavBarGroup); override;
    function IsGroupActive(AGroup: TdxNavBarGroup): Boolean; override;
  end;

  TdxNavBarUltraFlatExplorerBarPainter = class(TdxNavBarExplorerBarPainter)
  protected
    procedure DrawItemSelection(ALinkViewInfo: TdxNavBarLinkViewInfo); override;
    class function SelectionPainterClass: TdxBaseSelectionPainterClass; override;
  end;

  TdxNavBarAdvExplorerBarLinkViewInfo = class(TdxNavBarLinkViewInfo)
  public
    function FontColor: TColor; override;
  end;

  TdxNavBarAdvExplorerBarGroupViewInfo = class(TdxNavBarGroupViewInfo)
  public
    function BgBackColor: TColor; override;
    function BgBackColor2: TColor; override;
    function BgAlphaBlend: Byte; override;
    function BgAlphaBlend2: Byte; override;
    function BgGradientMode: TdxBarStyleGradientMode; override;
    function CaptionBackColor: TColor; override;
    function CaptionBackColor2: TColor; override;
    function CaptionAlphaBlend: Byte; override;
    function CaptionAlphaBlend2: Byte; override;
    function CaptionGradientMode: TdxBarStyleGradientMode; override;
    function CaptionFontColor: TColor; override;
    function CaptionSignColor: TColor; override;
  end;

  TdxNavBarAdvExplorerBarViewInfo = class(TdxNavBarExplorerBarViewInfo)
  protected
    class function GetGroupCaptionHeightAddon: Integer; override;
    class function GetGroupCaptionSignSize: Integer; override;
  end;

  TdxNavBarAdvExplorerBarPainter = class(TdxNavBarExplorerBarPainter)
  protected
    class function ViewInfoClass: TdxNavBarViewInfoClass; override;
    class function GroupViewInfoClass: TdxNavBarGroupViewInfoClass; override;
    class function LinkViewInfoClass: TdxNavBarLinkViewInfoClass; override;
    class function ButtonPainterClass: TdxBaseButtonPainterClass; override;
    class function SignPainterClass: TdxBaseSignPainterClass; override;
  public
    procedure AssignDefaultBackgroundStyle; override;
    procedure AssignDefaultGroupBackgroundStyle; override;
    procedure AssignDefaultGroupHeaderStyle; override;
    procedure AssignDefaultItemStyle; override;
    procedure AssignDefaultItemDisabledStyle; override;
  end;

implementation

uses
  {Types, }CommCtrl, ImgList,
  dxNavBarViewsFact, dxNavBarGraphics;

{ TdxNavBarExplorerBarViewInfo }

class function TdxNavBarExplorerBarViewInfo.GetGroupBorderWidth: Integer;
begin
  Result := 1;
end;

class function TdxNavBarExplorerBarViewInfo.GetGroupCaptionHeightAddon: Integer;
begin
  Result := 8;
end;

class function TdxNavBarExplorerBarViewInfo.GetGroupSeparatorWidth: Integer;
begin
  Result := 4;
end;

class function TdxNavBarExplorerBarViewInfo.GetGroupHorizontalEdge: Integer;
begin
  Result := 10;
end;

function TdxNavBarExplorerBarViewInfo.CanHasImageInGroupCaption: Boolean;
begin
  Result := True;
end;

function TdxNavBarExplorerBarViewInfo.CanHasSignInGroupCaption: Boolean;
begin
  Result := True;
end;

function TdxNavBarExplorerBarViewInfo.CanHasGroupViewAsIconView: Boolean;
begin
  Result := False;
end;

function TdxNavBarExplorerBarViewInfo.CanHasVisibleItemsInGroup(AGroup: TdxNavBarGroup): Boolean;
begin
  Result := AGroup.Expanded;
end;

procedure TdxNavBarExplorerBarViewInfo.RecreateInfo;
var
  I: Integer;
begin
  ClearGroups;
  for I := 0 to NavBar.Groups.Count - 1 do
    if NavBar.Groups[I].Visible then
      AddGroup(Self, NavBar.Groups[I]);
end;

procedure TdxNavBarExplorerBarViewInfo.Recalculate;
begin
  inherited;
  CorrectScrollInfo;
  AdjustControlsBounds;
end;

{ TdxNavBarExplorerBarPainter }

procedure TdxNavBarExplorerBarPainter.AssignDefaultBackgroundStyle;
begin
  with NavBar.DefaultStyles do
  begin
    Background.Image.Graphic := nil;
    Background.BackColor := clWindow;
    Background.BackColor2 := clWindow;
    Background.AlphaBlending := 255;
    Background.AlphaBlending2 := 255;
  end;
end;

procedure TdxNavBarExplorerBarPainter.AssignDefaultGroupBackgroundStyle;
begin
  with NavBar.DefaultStyles do
  begin
    GroupBackground.Image.Graphic := nil;
    GroupBackground.BackColor := clWindow;
    GroupBackground.BackColor2 := clWindow;
    GroupBackground.AlphaBlending := 255;
    GroupBackground.AlphaBlending2 := 255;
  end;
end;

procedure TdxNavBarExplorerBarPainter.AssignDefaultGroupHeaderStyle;
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
    GroupHeader.Font.Style := [fsBold];
    GroupHeader.Font.Name := 'MS Sans Serif';
    GroupHeader.HAlignment := haLeft;
    GroupHeader.VAlignment := vaCenter;
  end;
end;

procedure TdxNavBarExplorerBarPainter.AssignDefaultItemStyle;
begin
  with NavBar.DefaultStyles do
  begin
    Item.Image.Graphic := nil;
    Item.Font.Color := clWindowText;
    Item.Font.Size := 8;
    Item.Font.Style := [];
    Item.Font.Name := 'MS Sans Serif';
    Item.HAlignment := haCenter;
    Item.VAlignment := vaCenter;
  end;
end;

procedure TdxNavBarExplorerBarPainter.AssignDefaultItemDisabledStyle;
begin
  with NavBar.DefaultStyles do
  begin
    ItemDisabled.Assign(NavBar.DefaultStyles.Item);
    ItemDisabled.Font.Color := clGrayText;
  end;
end;

procedure TdxNavBarExplorerBarPainter.AssignDefaultItemHotTrackedStyle;
begin
  with NavBar.DefaultStyles do
  begin
    ItemHotTracked.Assign(NavBar.DefaultStyles.Item);
    ItemHotTracked.Font.Style := NavBar.DefaultStyles.ItemHotTracked.Font.Style + [fsUnderline];
  end;
end;

procedure TdxNavBarExplorerBarPainter.DrawGroupBorder(AGroupViewInfo: TdxNavBarGroupViewInfo);
begin
  if AGroupViewInfo.Group.Expanded and (AGroupViewInfo.ItemsRect.Bottom -  AGroupViewInfo.ItemsRect.Top > 0) then
    with AGroupViewInfo do
    begin
      Canvas.Pen.Width := 1;
      Canvas.Pen.Style := psSolid;
      Canvas.Pen.Color := CaptionBackColor;
      Canvas.MoveTo(ItemsRect.Left, ItemsRect.Top);
      Canvas.LineTo(ItemsRect.Left, ItemsRect.Bottom - 1);
      Canvas.LineTo(ItemsRect.Right - 1, ItemsRect.Bottom - 1);
      Canvas.LineTo(ItemsRect.Right - 1, ItemsRect.Top - 1);
      if not AGroupViewInfo.IsCaptionVisible then
      begin
        Canvas.MoveTo(ItemsRect.Right - 1, ItemsRect.Top);
        Canvas.LineTo(ItemsRect.Left - 1, ItemsRect.Top);
      end;
    end;
end;

class function TdxNavBarExplorerBarPainter.ViewInfoClass: TdxNavBarViewInfoClass;
begin
  Result := TdxNavBarExplorerBarViewInfo;
end;

class function TdxNavBarExplorerBarPainter.BackgroundPainterClass: TdxBaseBackgroundPainterClass;
begin
  Result := TdxNavBarBackgroundPainter;
end;

class function TdxNavBarExplorerBarPainter.ButtonPainterClass: TdxBaseButtonPainterClass;
begin
  Result := TdxNavBarExplorerButtonPainter;
end;

class function TdxNavBarExplorerBarPainter.ImagePainterClass: TdxBaseImagePainterClass;
begin
  Result := TdxNavBarImagePainter;
end;

class function TdxNavBarExplorerBarPainter.SignPainterClass: TdxBaseSignPainterClass;
begin
  Result := TdxNavBarExplorerBarSignPainter;
end;

procedure TdxNavBarExplorerBarPainter.DoGroupActivate(AGroup: TdxNavBarGroup);
begin
  if not AGroup.Expanded then
    AGroup.Expanded := True;
end;

procedure TdxNavBarExplorerBarPainter.DoGroupDeactivate(AGroup: TdxNavBarGroup);
begin
  if AGroup.Expanded then
    AGroup.Expanded := False;
end;

function TdxNavBarExplorerBarPainter.IsGroupActive(AGroup: TdxNavBarGroup): Boolean;
begin
  Result := AGroup.Expanded;
end;

{ TdxNavBarUltraFlatExplorerBarPainter }

class function TdxNavBarUltraFlatExplorerBarPainter.SelectionPainterClass: TdxBaseSelectionPainterClass;
begin
  Result := TdxNavBarUltraFlatSelectionPainter;
end;

procedure TdxNavBarUltraFlatExplorerBarPainter.DrawItemSelection(ALinkViewInfo: TdxNavBarLinkViewInfo);
begin
  if ALinkViewInfo.Item.Enabled then
  begin
    with ALinkViewInfo do
      SelectionPainterClass.DrawSelection(Canvas, SelectionRect, clNone, State);
  end;
end;

{ TdxNavBarAdvExplorerBarLinkViewInfo }

function TdxNavBarAdvExplorerBarLinkViewInfo.FontColor: TColor;
begin
  Result := Font.Color;
  if Result = clNone then Result := CalcTextColor(clNone, State);
end;

{ TdxNavBarAdvExplorerBarGroupViewInfo }

function TdxNavBarAdvExplorerBarGroupViewInfo.BgAlphaBlend: Byte;
begin
  if inherited BgBackColor = clNone then
    Result := 255
  else Result := inherited BgAlphaBlend;
end;

function TdxNavBarAdvExplorerBarGroupViewInfo.BgAlphaBlend2: Byte;
begin
  if inherited BgBackColor = clNone then
    Result := 255
  else Result := inherited BgAlphaBlend2;
end;

function TdxNavBarAdvExplorerBarGroupViewInfo.BgBackColor: TColor;
begin
  if inherited BgBackColor = clNone then
    Result := LightLightColor(clInactiveCaption)
  else Result := inherited BgBackColor;
end;

function TdxNavBarAdvExplorerBarGroupViewInfo.BgBackColor2: TColor;
begin
  if inherited BgBackColor = clNone then
    Result := LightLightColor(clInactiveCaption)
  else Result := inherited BgBackColor2;
end;

function TdxNavBarAdvExplorerBarGroupViewInfo.BgGradientMode: TdxBarStyleGradientMode;
begin
  if inherited BgBackColor = clNone then
    Result := gmHorizontal
  else Result := inherited BgGradientMode;
end;

function TdxNavBarAdvExplorerBarGroupViewInfo.CaptionAlphaBlend: Byte;
begin
  if inherited CaptionBackColor = clNone then
    Result := 255
  else Result := inherited CaptionAlphaBlend;
end;

function TdxNavBarAdvExplorerBarGroupViewInfo.CaptionAlphaBlend2: Byte;
begin
  if inherited CaptionBackColor = clNone then
    Result := 255
  else Result := inherited CaptionAlphaBlend2;
end;

function TdxNavBarAdvExplorerBarGroupViewInfo.CaptionBackColor: TColor;
begin
  if inherited CaptionBackColor = clNone then
    Result := clWindow
  else Result := inherited CaptionBackColor;
end;

function TdxNavBarAdvExplorerBarGroupViewInfo.CaptionBackColor2: TColor;
begin
  if inherited CaptionBackColor = clNone then
    Result := LightLightColor(clHighlight)
  else Result := inherited CaptionBackColor2;
end;

function TdxNavBarAdvExplorerBarGroupViewInfo.CaptionFontColor: TColor;
begin
  Result := CaptionFont.Color;
  if Result = clNone then Result := CalcTextColor(clNone, State);
end;

function TdxNavBarAdvExplorerBarGroupViewInfo.CaptionSignColor: TColor;
begin
  Result := CaptionFont.Color;
  if Result = clNone then Result := CalcTextColor(clNone, State);
end;

function TdxNavBarAdvExplorerBarGroupViewInfo.CaptionGradientMode: TdxBarStyleGradientMode;
begin
  if inherited CaptionBackColor = clNone then
    Result := gmHorizontal
  else Result := inherited CaptionGradientMode;
end;

{ TdxNavAdvBarExplorerBarViewInfo }

class function TdxNavBarAdvExplorerBarViewInfo.GetGroupCaptionHeightAddon: Integer;
begin
  Result := 12;
end;

class function TdxNavBarAdvExplorerBarViewInfo.GetGroupCaptionSignSize: Integer;
begin
  Result := 22;
end;

{ TdxNavBarAdvExplorerBarPainter }

procedure TdxNavBarAdvExplorerBarPainter.AssignDefaultBackgroundStyle;
begin
  with NavBar.DefaultStyles do
  begin
    Background.Image.Graphic := nil;
    Background.BackColor := clHighlight;
    Background.BackColor2 := clHighlight;
    Background.AlphaBlending := 255;
    Background.AlphaBlending2 := 255;
  end;
end;

procedure TdxNavBarAdvExplorerBarPainter.AssignDefaultGroupBackgroundStyle;
begin
  with NavBar.DefaultStyles do
  begin
    GroupBackground.Image.Graphic := nil;
    GroupBackground.BackColor := clNone;
    GroupBackground.BackColor2 := clNone;
    GroupBackground.AlphaBlending := 255;
    GroupBackground.AlphaBlending2 := 255;
  end;
end;

procedure TdxNavBarAdvExplorerBarPainter.AssignDefaultGroupHeaderStyle;
begin
  with NavBar.DefaultStyles do
  begin
    GroupHeader.Image.Graphic := nil;
    GroupHeader.BackColor := clNone;
    GroupHeader.BackColor2 := clNone;
    GroupHeader.AlphaBlending := 255;
    GroupHeader.AlphaBlending2 := 255;
    GroupHeader.Font.Color := clNone;
    GroupHeader.Font.Size := 8;
    GroupHeader.Font.Style := [fsBold];
    GroupHeader.Font.Name := 'MS Sans Serif';
    GroupHeader.HAlignment := haLeft;
    GroupHeader.VAlignment := vaCenter;
  end;
end;

procedure TdxNavBarAdvExplorerBarPainter.AssignDefaultItemStyle;
begin
  with NavBar.DefaultStyles do
  begin
    Item.Image.Graphic := nil;
    Item.Font.Color := clNone;//clWindow;
    Item.Font.Size := 8;
    Item.Font.Style := [];
    Item.Font.Name := 'MS Sans Serif';
    Item.HAlignment := haCenter;
    Item.VAlignment := vaCenter;
  end;
end;

procedure TdxNavBarAdvExplorerBarPainter.AssignDefaultItemDisabledStyle;
begin
  with NavBar.DefaultStyles do
    ItemDisabled.Assign(NavBar.DefaultStyles.Item);
end;

class function TdxNavBarAdvExplorerBarPainter.ViewInfoClass: TdxNavBarViewInfoClass;
begin
  Result := TdxNavBarAdvExplorerBarViewInfo;
end;

class function TdxNavBarAdvExplorerBarPainter.ButtonPainterClass: TdxBaseButtonPainterClass;
begin
  Result := TdxNavBarAdvExplorerButtonPainter;
end;

class function TdxNavBarAdvExplorerBarPainter.GroupViewInfoClass: TdxNavBarGroupViewInfoClass;
begin
  Result := TdxNavBarAdvExplorerBarGroupViewInfo;
end;

class function TdxNavBarAdvExplorerBarPainter.LinkViewInfoClass: TdxNavBarLinkViewInfoClass;
begin
  Result := TdxNavBarAdvExplorerBarLinkViewInfo;
end;

class function TdxNavBarAdvExplorerBarPainter.SignPainterClass: TdxBaseSignPainterClass;
begin
  Result := TdxNavBarAdvExplorerBarSignPainter;
end;

initialization
  dxNavBarViewsFactory.RegisterView(8, 'ExplorerBarView', TdxNavBarExplorerBarPainter);
  dxNavBarViewsFactory.RegisterView(9, 'UltraFlatExplorerView', TdxNavBarUltraFlatExplorerBarPainter);
  dxNavBarViewsFactory.RegisterView(10, 'AdvExplorerBarView', TdxNavBarAdvExplorerBarPainter);

end.
