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

unit dxNavBarXPViews;

{$I dxNavBarVer.inc}

interface

uses
  Windows, Graphics, dxUxTheme, dxThemeManager, dxThemeConsts,
  dxNavBar, dxNavBarStyles, dxNavBarBaseViews, dxNavBarOfficeViews, dxNavBarExplorerViews;

type
  TdxNavBarXP1GroupViewInfo = class(TdxNavBarGroupViewInfo)
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
  end;

  TdxNavBarXP1Painter = class(TdxNavBarFlatPainter)
  protected
    procedure DrawGroupCaptionButton(AGroupViewInfo: TdxNavBarGroupViewInfo); override;

    class function GroupViewInfoClass: TdxNavBarGroupViewInfoClass; override;
    class function ScrollButtonsPainterClass: TdxBaseScrollButtonsPainterClass; override;
    class function SelectionPainterClass: TdxBaseSelectionPainterClass; override;
  public
    procedure AssignDefaultBackgroundStyle; override;
    procedure AssignDefaultGroupBackgroundStyle; override;
    procedure AssignDefaultGroupHeaderStyle; override;
    procedure AssignDefaultItemStyle; override;
    procedure AssignDefaultItemDisabledStyle; override;
  end;

  TdxNavBarXP2Painter = class(TdxNavBarOffice1Painter)
  protected
    procedure DrawGroupBackground(AGroupViewInfo: TdxNavBarGroupViewInfo); override;

    class function ButtonPainterClass: TdxBaseButtonPainterClass; override;
    class function ScrollButtonsPainterClass: TdxBaseScrollButtonsPainterClass; override;
    class function SelectionPainterClass: TdxBaseSelectionPainterClass; override;
  end;

  TdxNavBarXPExplorerBarLinkViewInfo = class(TdxNavBarLinkViewInfo)
  public
    function FontColor: TColor; override;
  end;

  TdxNavBarXPExplorerBarGroupViewInfo = class(TdxNavBarGroupViewInfo)
  public
    function CaptionFontColor: TColor; override;
    function CaptionSignColor: TColor; override;
  end;

  TdxNavBarXPExplorerBarViewInfo = class(TdxNavBarExplorerBarViewInfo)
  public
    class function GetGroupCaptionHeightAddon: Integer; override;
    class function GetGroupCaptionSignSize: Integer; override;
  end;

  TdxNavBarXPExplorerBarPainter = class(TdxNavBarExplorerBarPainter)
  protected
    procedure DrawBackground; override;
    procedure DrawGroupBackground(AGroupViewInfo: TdxNavBarGroupViewInfo); override;
    procedure DrawGroupBorder(AGroupViewInfo: TdxNavBarGroupViewInfo); override;

    class function ViewInfoClass: TdxNavBarViewInfoClass; override;
    class function GroupViewInfoClass: TdxNavBarGroupViewInfoClass; override;
    class function LinkViewInfoClass: TdxNavBarLinkViewInfoClass; override;
    class function ButtonPainterClass: TdxBaseButtonPainterClass; override;
    class function SignPainterClass: TdxBaseSignPainterClass; override;
  end;


implementation

uses
  CommCtrl, ImgList, Buttons,
  dxNavBarViewsFact, dxNavBarGraphics;

{ TdxNavBarXP1GroupViewInfo }

function TdxNavBarXP1GroupViewInfo.BgAlphaBlend: Byte;
begin
  if (Group.StyleBackground <> nil) and (savAlphaBlending in Group.StyleBackground.Style.AssignedValues) then
    Result := Group.StyleBackground.Style.AlphaBlending
  else Result := 255;
end;

function TdxNavBarXP1GroupViewInfo.BgAlphaBlend2: Byte;
begin
  if (Group.StyleBackground <> nil) and (savAlphaBlending2 in Group.StyleBackground.Style.AssignedValues) then
    Result := Group.StyleBackground.Style.AlphaBlending2
  else Result := 255;
end;

function TdxNavBarXP1GroupViewInfo.BgBackColor: TColor;
begin
  if (Group.StyleBackground <> nil) and (savBackColor in Group.StyleBackground.Style.AssignedValues) then
    Result := Group.StyleBackground.Style.BackColor
  else Result := LightLightColor(NavBar.DefaultStyles.GroupBackground.BackColor);
end;

function TdxNavBarXP1GroupViewInfo.BgBackColor2: TColor;
begin
  if (Group.StyleBackground <> nil) and (savBackColor2 in Group.StyleBackground.Style.AssignedValues) then
    Result := Group.StyleBackground.Style.BackColor2
  else Result := NavBar.DefaultStyles.GroupBackground.BackColor;
end;

function TdxNavBarXP1GroupViewInfo.BgGradientMode: TdxBarStyleGradientMode;
begin
  if (Group.StyleBackground <> nil) and (savGradientMode in Group.StyleBackground.Style.AssignedValues) then
    Result := Group.StyleBackground.Style.GradientMode
  else Result := gmHorizontal;
end;

function TdxNavBarXP1GroupViewInfo.CaptionAlphaBlend: Byte;
begin
  if (CaptionStyleItem <> nil) and (savAlphaBlending in CaptionStyleItem.Style.AssignedValues) then
    Result := CaptionStyleItem.Style.AlphaBlending
  else Result := 255;
end;

function TdxNavBarXP1GroupViewInfo.CaptionAlphaBlend2: Byte;
begin
  if (CaptionStyleItem <> nil) and (savAlphaBlending2 in CaptionStyleItem.Style.AssignedValues) then
    Result := CaptionStyleItem.Style.AlphaBlending2
  else Result := 255;
end;

function TdxNavBarXP1GroupViewInfo.CaptionBackColor: TColor;
begin
  if (CaptionStyleItem <> nil) and (savBackColor in CaptionStyleItem.Style.AssignedValues) then
    Result := CaptionStyleItem.Style.BackColor
  else Result := CaptionStyle.BackColor;
end;

function TdxNavBarXP1GroupViewInfo.CaptionBackColor2: TColor;
begin
  if (CaptionStyleItem <> nil) and (savBackColor2 in CaptionStyleItem.Style.AssignedValues) then
    Result := CaptionStyleItem.Style.BackColor2
  else if Group = NavBar.HotTrackedGroup then
    Result := CaptionStyle.BackColor
  else Result := DarkColor(CaptionStyle.BackColor);
end;

function TdxNavBarXP1GroupViewInfo.CaptionGradientMode: TdxBarStyleGradientMode;
begin
  if (CaptionStyleItem <> nil) and (savGradientMode in CaptionStyleItem.Style.AssignedValues) then
    Result := CaptionStyleItem.Style.GradientMode
  else Result := gmHorizontal;
end;

{ TdxNavBarXP1Painter }

procedure TdxNavBarXP1Painter.AssignDefaultBackgroundStyle;
begin
  with NavBar.DefaultStyles do
  begin
    Background.Image.Graphic := nil;
    Background.BackColor := clAppWorkSpace;
    Background.BackColor2 := clAppWorkSpace;
    Background.AlphaBlending := 255;
    Background.AlphaBlending2 := 255;
  end;
end;

procedure TdxNavBarXP1Painter.AssignDefaultGroupBackgroundStyle;
begin
  with NavBar.DefaultStyles do
  begin
    GroupBackground.Image.Graphic := nil;
    GroupBackground.BackColor := clInactiveCaption;
    GroupBackground.BackColor2 := clInactiveCaption;
    GroupBackground.AlphaBlending := 255;
    GroupBackground.AlphaBlending2 := 255;
  end;
end;

procedure TdxNavBarXP1Painter.AssignDefaultGroupHeaderStyle;
begin
  with NavBar.DefaultStyles do
  begin
    GroupHeader.Image.Graphic := nil;
    GroupHeader.BackColor := clActiveCaption;
    GroupHeader.BackColor2 := clActiveCaption;
    GroupHeader.AlphaBlending := 255;
    GroupHeader.AlphaBlending2 := 255;
    GroupHeader.Font.Color := clCaptionText;
    GroupHeader.Font.Size := 8;
    GroupHeader.Font.Style := [];
    GroupHeader.Font.Name := 'MS Sans Serif';
    GroupHeader.HAlignment := haCenter;
    GroupHeader.VAlignment := vaCenter;
  end;
end;

procedure TdxNavBarXP1Painter.AssignDefaultItemStyle;
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

procedure TdxNavBarXP1Painter.AssignDefaultItemDisabledStyle;
begin
  with NavBar.DefaultStyles do
  begin
    ItemDisabled.Assign(NavBar.DefaultStyles.Item);
    ItemDisabled.Font.Color := clBtnShadow; //TODO
  end;
end;

procedure TdxNavBarXP1Painter.DrawGroupCaptionButton(AGroupViewInfo: TdxNavBarGroupViewInfo);
var
  Color1, Color2: TColor;
begin
  with AGroupViewInfo do
  begin
    Color1 := LightLightColor(CaptionBackColor);
    if NavBar.HotTrackedGroup = Group then
      Color2 := LightColor(CaptionBackColor)
    else Color2 := CaptionBackColor;
    ButtonPainterClass.DrawButton(Canvas, CaptionRect, CaptionImage,
      Color1, Color2, CaptionAlphaBlend, CaptionAlphaBlend2,
      CaptionGradientMode, State);
  end;
end;

class function TdxNavBarXP1Painter.GroupViewInfoClass: TdxNavBarGroupViewInfoClass;
begin
  Result := TdxNavBarXP1GroupViewInfo;
end;

class function TdxNavBarXP1Painter.ScrollButtonsPainterClass: TdxBaseScrollButtonsPainterClass;
begin
  Result := TdxNavBarXPScrollButtonsPainter;
end;

class function TdxNavBarXP1Painter.SelectionPainterClass: TdxBaseSelectionPainterClass;
begin
  Result := TdxNavBarXPSelectionPainter;
end;

{ TdxNavBarXP2Painter }

procedure TdxNavBarXP2Painter.DrawGroupBackground(AGroupViewInfo: TdxNavBarGroupViewInfo);
begin
  if not TdxNavBarXPPainter.DrawObject(Canvas, AGroupViewInfo.ItemsRect, totTab,
    8, 1) then inherited;
end;

class function TdxNavBarXP2Painter.ButtonPainterClass: TdxBaseButtonPainterClass;
begin
  Result := TdxNavBarXPButtonPainter;
end;

class function TdxNavBarXP2Painter.ScrollButtonsPainterClass: TdxBaseScrollButtonsPainterClass;
begin
  Result := TdxNavBarXPScrollButtonsPainter;
end;

class function TdxNavBarXP2Painter.SelectionPainterClass: TdxBaseSelectionPainterClass;
begin
  Result := TdxNavBarXPSelectionPainter;
end;

{ TdxNavBarXPExplorerBarLinkViewInfo }

function TdxNavBarXPExplorerBarLinkViewInfo.FontColor: TColor;
begin
  if OpenTheme(totExplorerBar) = 0 then
    Result := inherited FontColor
  else Result := CalcTextColor(clNone, State);
end;

{ TdxNavBarXPExplorerBarGroupViewInfo }

function TdxNavBarXPExplorerBarGroupViewInfo.CaptionFontColor: TColor;
begin
  if OpenTheme(totExplorerBar) = 0 then
    Result := inherited CaptionFontColor
  else Result := CalcTextColor(clNone, State);
end;

function TdxNavBarXPExplorerBarGroupViewInfo.CaptionSignColor: TColor;
begin
  if OpenTheme(totExplorerBar) = 0 then
    Result := inherited CaptionSignColor
  else Result := CalcTextColor(clNone, State);
end;

{ TdxNavBarXPExplorerBarViewInfo }

class function TdxNavBarXPExplorerBarViewInfo.GetGroupCaptionHeightAddon: Integer;
begin
  if OpenTheme(totExplorerBar) = 0 then
    Result := inherited GetGroupCaptionHeightAddon
  else Result := 12;
end;

class function TdxNavBarXPExplorerBarViewInfo.GetGroupCaptionSignSize: Integer;
begin
  if OpenTheme(totExplorerBar) = 0 then
    Result := inherited GetGroupCaptionSignSize
  else Result := 22;
end;

{ TdxNavBarXPExplorerBarPainter }

procedure TdxNavBarXPExplorerBarPainter.DrawBackground;
begin
  if not TdxNavBarXPPainter.DrawObject(Canvas, NavBar.ClientRect, totExplorerBar,
    EBP_HEADERBACKGROUND, EBHC_NORMAL) then inherited;
end;

procedure TdxNavBarXPExplorerBarPainter.DrawGroupBackground(AGroupViewInfo: TdxNavBarGroupViewInfo);
begin
  if not TdxNavBarXPPainter.DrawObject(Canvas, AGroupViewInfo.ItemsRect, totExplorerBar,
    EBP_NORMALGROUPBACKGROUND, EBHC_NORMAL) then inherited;
end;

procedure TdxNavBarXPExplorerBarPainter.DrawGroupBorder(AGroupViewInfo: TdxNavBarGroupViewInfo);
begin
  if OpenTheme(totExplorerBar) = 0 then inherited;
end;

class function TdxNavBarXPExplorerBarPainter.ViewInfoClass: TdxNavBarViewInfoClass;
begin
  Result := TdxNavBarXPExplorerBarViewInfo;
end;

class function TdxNavBarXPExplorerBarPainter.GroupViewInfoClass: TdxNavBarGroupViewInfoClass;
begin
  Result := TdxNavBarXPExplorerBarGroupViewInfo;
end;

class function TdxNavBarXPExplorerBarPainter.LinkViewInfoClass: TdxNavBarLinkViewInfoClass;
begin
  Result := TdxNavBarXPExplorerBarLinkViewInfo;
end;

class function TdxNavBarXPExplorerBarPainter.ButtonPainterClass: TdxBaseButtonPainterClass;
begin
  Result := TdxNavBarXPExplorerBarButtonPainter;
end;

class function TdxNavBarXPExplorerBarPainter.SignPainterClass: TdxBaseSignPainterClass;
begin
  Result := TdxNavBarXPExplorerBarSignPainter;
end;

initialization
  dxNavBarViewsFactory.RegisterView(6, 'XP1View', TdxNavBarXP1Painter);
  dxNavBarViewsFactory.RegisterView(7, 'XP2View', TdxNavBarXP2Painter);
  dxNavBarViewsFactory.RegisterView(11, 'XPExplorerBarView', TdxNavBarXPExplorerBarPainter);

end.
