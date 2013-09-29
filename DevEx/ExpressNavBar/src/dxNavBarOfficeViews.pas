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

unit dxNavBarOfficeViews;

{$I dxNavBarVer.inc}

interface

uses
  Windows, Graphics, dxNavBar, dxNavBarStyles, dxNavBarBaseViews;

type
  TdxNavBarOffice1ViewInfo = class(TdxNavBarBaseViewInfo)
  protected
    class function GetGroupCaptionHeightAddon: Integer; override;
    class function GetGroupSeparatorWidth: Integer; override;
  end;

  TdxNavBarOffice1Painter = class(TdxNavBarBasePainter)
  protected
    class function ViewInfoClass: TdxNavBarViewInfoClass; override;
    class function ButtonPainterClass: TdxBaseButtonPainterClass; override;
  public
    procedure AssignDefaultBackgroundStyle; override;
    procedure AssignDefaultGroupBackgroundStyle; override;
    procedure AssignDefaultGroupHeaderStyle; override;
    procedure AssignDefaultItemStyle; override;
    procedure AssignDefaultItemDisabledStyle; override;
  end;

  TdxNavBarOffice2Painter = class(TdxNavBarOffice1Painter)
  protected
    class function SelectionPainterClass: TdxBaseSelectionPainterClass; override;
  end;

  TdxNavBarOffice3LinkViewInfo = class(TdxNavBarLinkViewInfo)
  public
    function SelectionRect: TRect; override;
  end;

  TdxNavBarOffice3ViewInfo = class(TdxNavBarOffice1ViewInfo)
  protected
    class function GetLinksLargeSeparatorWidth: Integer; override;
  public
    function GetLinkViewInfoAtSelectedPos(pt: TPoint): TdxNavBarLinkViewInfo; override;
  end;

  TdxNavBarOffice3Painter = class(TdxNavBarOffice2Painter)
  protected
    class function ViewInfoClass: TdxNavBarViewInfoClass; override;
    class function LinkViewInfoClass: TdxNavBarLinkViewInfoClass; override;
  end;

implementation

uses
  CommCtrl, ImgList, Buttons,
  dxNavBarViewsFact, dxNavBarGraphics;

{ TdxNavBarOffice1ViewInfo }

class function TdxNavBarOffice1ViewInfo.GetGroupCaptionHeightAddon: Integer;
begin
  Result := 8;
end;

class function TdxNavBarOffice1ViewInfo.GetGroupSeparatorWidth: Integer;
begin
  Result := 1;
end;

{ TdxNavBarOffice1Painter }

procedure TdxNavBarOffice1Painter.AssignDefaultBackgroundStyle;
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

procedure TdxNavBarOffice1Painter.AssignDefaultGroupBackgroundStyle;
begin
  with NavBar.DefaultStyles do
  begin
    GroupBackground.Image.Graphic := nil;
    GroupBackground.BackColor := clBtnFace;
    GroupBackground.BackColor2 := clBtnFace;
    GroupBackground.AlphaBlending := 255;
    GroupBackground.AlphaBlending2 := 255;
  end;
end;

procedure TdxNavBarOffice1Painter.AssignDefaultGroupHeaderStyle;
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
    GroupHeader.HAlignment := haCenter;
    GroupHeader.VAlignment := vaCenter;
  end;
end;

procedure TdxNavBarOffice1Painter.AssignDefaultItemStyle;
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

procedure TdxNavBarOffice1Painter.AssignDefaultItemDisabledStyle;
begin
  with NavBar.DefaultStyles do
  begin
    ItemDisabled.Assign(NavBar.DefaultStyles.Item);
    ItemDisabled.Font.Color := clBtnShadow;
  end;
end;

class function TdxNavBarOffice1Painter.ViewInfoClass: TdxNavBarViewInfoClass;
begin
  Result := TdxNavBarOffice1ViewInfo;
end;

class function TdxNavBarOffice1Painter.ButtonPainterClass: TdxBaseButtonPainterClass;
begin
  Result := TdxNavBarOfficeButtonPainter;
end;

{ TdxNavBarOffice2Painter }

class function TdxNavBarOffice2Painter.SelectionPainterClass: TdxBaseSelectionPainterClass;
begin
  Result := TdxNavBarUltraFlatSelectionPainter;
end;

{ TdxNavBarOffice3LinkViewInfo }

function TdxNavBarOffice3LinkViewInfo.SelectionRect: TRect;
begin
  Result := Rect;
  InflateRect(Result, -1, -1);
end;

{ TdxNavBarOffice3ViewInfo }

class function TdxNavBarOffice3ViewInfo.GetLinksLargeSeparatorWidth: Integer;
begin
  Result := 16;
end;

function TdxNavBarOffice3ViewInfo.GetLinkViewInfoAtSelectedPos(pt: TPoint): TdxNavBarLinkViewInfo;
var
  I: Integer;
  AGroupViewInfo: TdxNavBarGroupViewInfo;
begin
  Result := nil;
  if not (IsPtBottomScrollButton(pt) or IsPtTopScrollButton(pt)) then
  begin
    AGroupViewInfo := GetGroupViewInfoAtItemsPos(pt);
    if AGroupViewInfo <> nil then
      for I := 0 to AGroupViewInfo.ItemCount - 1 do
        if ptInRect(AGroupViewInfo.Items[I].Rect, pt) then
        begin
          Result := AGroupViewInfo.Items[I];
          break;
        end;
  end;
end;

{ TdxNavBarOffice3Painter }

class function TdxNavBarOffice3Painter.ViewInfoClass: TdxNavBarViewInfoClass;
begin
  Result := TdxNavBarOffice3ViewInfo;
end;

class function TdxNavBarOffice3Painter.LinkViewInfoClass: TdxNavBarLinkViewInfoClass;
begin
  Result := TdxNavBarOffice3LinkViewInfo;
end;

initialization
  dxNavBarViewsFactory.RegisterView(2, 'Office1View', TdxNavBarOffice1Painter);
  dxNavBarViewsFactory.RegisterView(3, 'Office2View', TdxNavBarOffice2Painter);
  dxNavBarViewsFactory.RegisterView(4, 'Office3View', TdxNavBarOffice3Painter);

end.
