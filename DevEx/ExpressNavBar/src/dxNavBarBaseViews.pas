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

unit dxNavBarBaseViews;

{$I dxNavBarVer.inc}

interface

uses
  Windows, Graphics, dxNavBar, dxNavBarStyles;

type
  TdxNavBarBaseViewInfo = class(TdxNavBarViewInfo)
  protected
    procedure Recalculate; override;
  end;

  TdxNavBarBasePainter = class(TdxNavBarPainter)
  protected
    procedure DrawItemSelection(ALinkViewInfo: TdxNavBarLinkViewInfo); override;

    class function ViewInfoClass: TdxNavBarViewInfoClass; override;
    class function BackgroundPainterClass: TdxBaseBackgroundPainterClass; override;
    class function ButtonPainterClass: TdxBaseButtonPainterClass; override;
    class function ScrollButtonsPainterClass: TdxBaseScrollButtonsPainterClass; override;
    class function ImagePainterClass: TdxBaseImagePainterClass; override;
    class function SelectionPainterClass: TdxBaseSelectionPainterClass; override;
  end;

  TdxNavBarFlatPainter = class(TdxNavBarBasePainter)
  protected
    class function ButtonPainterClass: TdxBaseButtonPainterClass; override;
  end;

implementation

uses
  CommCtrl, ImgList,
  dxNavBarViewsFact, dxNavBarGraphics;

{ TdxNavBarBaseViewInfo }

procedure TdxNavBarBaseViewInfo.Recalculate;
begin
  inherited;
  if (GroupCount > 0) and (ActiveGroupViewInfo <> nil) then
    CorrectViewInfo;
  AdjustControlsBounds;
end;

{ TdxNavBarBasePainter }

class function TdxNavBarBasePainter.ViewInfoClass: TdxNavBarViewInfoClass;
begin
  Result := TdxNavBarBaseViewInfo;
end;

class function TdxNavBarBasePainter.BackgroundPainterClass: TdxBaseBackgroundPainterClass;
begin
  Result := TdxNavBarBackgroundPainter;
end;

class function TdxNavBarBasePainter.ButtonPainterClass: TdxBaseButtonPainterClass;
begin
  Result := TdxNavBarButtonPainter;
end;

class function TdxNavBarBasePainter.ScrollButtonsPainterClass: TdxBaseScrollButtonsPainterClass;
begin
  Result := TdxNavBarScrollButtonsPainter;
end;

class function TdxNavBarBasePainter.ImagePainterClass: TdxBaseImagePainterClass;
begin
  Result := TdxNavBarImagePainter;
end;

class function TdxNavBarBasePainter.SelectionPainterClass: TdxBaseSelectionPainterClass;
begin
  Result := TdxNavBarSelectionPainter;
end;

procedure TdxNavBarBasePainter.DrawItemSelection(ALinkViewInfo: TdxNavBarLinkViewInfo);
begin
  if ALinkViewInfo.Item.Enabled then
    with ALinkViewInfo do
      SelectionPainterClass.DrawSelection(Canvas, SelectionRect, GroupViewInfo.BgBackColor, State);
end;

{ TdxNavBarFlatPainter }

class function TdxNavBarFlatPainter.ButtonPainterClass: TdxBaseButtonPainterClass;
begin
  Result := TdxNavBarFlatButtonPainter;
end;

initialization
  dxNavBarViewsFactory.RegisterView(0, 'BaseView', TdxNavBarBasePainter);
  dxNavBarViewsFactory.RegisterView(1, 'FlatView', TdxNavBarFlatPainter);

end.
