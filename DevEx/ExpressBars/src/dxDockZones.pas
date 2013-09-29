{*******************************************************************}
{                                                                   }
{       Developer Express Visual Component Library                  }
{       ExpressDocking                                              }
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

unit dxDockZones;

{$I dxDockVer.inc}

interface

uses
  Windows, Classes, dxDockControl;

type
  TdxLeftZone = class(TdxZone)
  protected
    function GetDirection: TdxZoneDirection; override;
    function GetDockType: TdxDockingType; override;
    function GetRectangle: TRect; override;

    function CanConstrainedResize(NewWidth, NewHeight: Integer): Boolean; override;
    procedure DoResize(StartPoint, EndPoint: TPoint); override;
  public
    function CanResize(StartPoint, EndPoint: TPoint): Boolean; override;
    function GetDockingSelection(AControl: TdxCustomDockControl): TRect; override;
    function GetResizingSelection(pt: TPoint): TRect; override;
    class function ValidateDockZone(AOwner, AControl: TdxCustomDockControl): Boolean; override;
    class function ValidateResizeZone(AOwner, AControl: TdxCustomDockControl): Boolean; override;
  end;

  TdxRightZone = class(TdxZone)
  protected
    function GetDirection: TdxZoneDirection; override;
    function GetDockType: TdxDockingType; override;
    function GetRectangle: TRect; override;

    function CanConstrainedResize(NewWidth, NewHeight: Integer): Boolean; override;
    procedure DoResize(StartPoint, EndPoint: TPoint); override;
  public
    function CanResize(StartPoint, EndPoint: TPoint): Boolean; override;
    function GetDockingSelection(AControl: TdxCustomDockControl): TRect; override;
    function GetResizingSelection(pt: TPoint): TRect; override;
    class function ValidateDockZone(AOwner, AControl: TdxCustomDockControl): Boolean; override;
    class function ValidateResizeZone(AOwner, AControl: TdxCustomDockControl): Boolean; override;
  end;

  TdxTopZone = class(TdxZone)
  protected
    function GetDirection: TdxZoneDirection; override;
    function GetDockType: TdxDockingType; override;
    function GetRectangle: TRect; override;

    function CanConstrainedResize(NewWidth, NewHeight: Integer): Boolean; override;
    procedure DoResize(StartPoint, EndPoint: TPoint); override;
  public
    function CanResize(StartPoint, EndPoint: TPoint): Boolean; override;
    function GetDockingSelection(AControl: TdxCustomDockControl): TRect; override;
    function GetResizingSelection(pt: TPoint): TRect; override;
    class function ValidateDockZone(AOwner, AControl: TdxCustomDockControl): Boolean; override;
    class function ValidateResizeZone(AOwner, AControl: TdxCustomDockControl): Boolean; override;
  end;

  TdxBottomZone = class(TdxZone)
  protected
    function GetDirection: TdxZoneDirection; override;
    function GetDockType: TdxDockingType; override;
    function GetRectangle: TRect; override;

    function CanConstrainedResize(NewWidth, NewHeight: Integer): Boolean; override;
    procedure DoResize(StartPoint, EndPoint: TPoint); override;
  public
    function CanResize(StartPoint, EndPoint: TPoint): Boolean; override;
    function GetDockingSelection(AControl: TdxCustomDockControl): TRect; override;
    function GetResizingSelection(pt: TPoint): TRect; override;
    class function ValidateDockZone(AOwner, AControl: TdxCustomDockControl): Boolean; override;
    class function ValidateResizeZone(AOwner, AControl: TdxCustomDockControl): Boolean; override;
  end;

  TdxClientZone = class(TdxZone)
  protected
    function GetDirection: TdxZoneDirection; override;
    function GetDockType: TdxDockingType; override;
    function GetRectangle: TRect; override;
  public
    class function ValidateDockZone(AOwner, AControl: TdxCustomDockControl): Boolean; override;
  end;

  TdxAutoHideLeftZone = class(TdxLeftZone)
  public
    function CanResize(StartPoint, EndPoint: TPoint): Boolean; override;
    class function ValidateResizeZone(AOwner, AControl: TdxCustomDockControl): Boolean; override;
  end;

  TdxAutoHideRightZone = class(TdxRightZone)
  public
    function CanResize(StartPoint, EndPoint: TPoint): Boolean; override;
    class function ValidateResizeZone(AOwner, AControl: TdxCustomDockControl): Boolean; override;
  end;

  TdxAutoHideTopZone = class(TdxTopZone)
  public
    function CanResize(StartPoint, EndPoint: TPoint): Boolean; override;
    class function ValidateResizeZone(AOwner, AControl: TdxCustomDockControl): Boolean; override;
  end;

  TdxAutoHideBottomZone = class(TdxBottomZone)
  public
    function CanResize(StartPoint, EndPoint: TPoint): Boolean; override;
    class function ValidateResizeZone(AOwner, AControl: TdxCustomDockControl): Boolean; override;
  end;

  TdxAutoSizeLeftZone = class(TdxLeftZone)
  public
    class function ValidateResizeZone(AOwner, AControl: TdxCustomDockControl): Boolean; override;
  end;

  TdxAutoSizeRightZone = class(TdxRightZone)
  public
    class function ValidateResizeZone(AOwner, AControl: TdxCustomDockControl): Boolean; override;
  end;

  TdxAutoSizeTopZone = class(TdxTopZone)
  public
    class function ValidateResizeZone(AOwner, AControl: TdxCustomDockControl): Boolean; override;
  end;

  TdxAutoSizeBottomZone = class(TdxBottomZone)
  public
    class function ValidateResizeZone(AOwner, AControl: TdxCustomDockControl): Boolean; override;
  end;

  TdxAutoSizeClientZone = class(TdxClientZone)
  public
    function GetDockingSelection(AControl: TdxCustomDockControl): TRect; override;
  end;

  TdxTabContainerZone = class(TdxClientZone)
  private
    function GetTabContainer: TdxTabContainerDockSite;
  protected
    function GetDockIndex: Integer; override;
    function GetTabRect(AControl: TdxCustomDockControl): TRect; virtual;
    function GetTabsRect: TRect; virtual;
    procedure DrawDockingSelection(DC: HDC; AControl: TdxCustomDockControl; pt: TPoint); override;
  public
    constructor Create(AControl: TdxTabContainerDockSite);
    property TabContainer: TdxTabContainerDockSite read GetTabContainer;
  end;

  TdxTabContainerTabZone = class(TdxTabContainerZone)
  private
    FDockIndex: Integer;
  protected
    function GetDockIndex: Integer; override;
  public
    constructor Create(AControl: TdxTabContainerDockSite; ADockIndex: Integer);
    function IsZonePoint(pt: TPoint): Boolean; override;
  end;

  TdxHorizContainerZone = class(TdxRightZone)
  protected
    procedure DoResize(StartPoint, EndPoint: TPoint); override;
  public
    function CanResize(StartPoint, EndPoint: TPoint): Boolean; override;
  end;

  TdxVertContainerZone = class(TdxBottomZone)
  protected
    procedure DoResize(StartPoint, EndPoint: TPoint); override;
  public
    function CanResize(StartPoint, EndPoint: TPoint): Boolean; override;
  end;

  TdxDockPanelClientZone = class(TdxClientZone)
  protected
    procedure DrawDockingSelection(DC: HDC; AControl: TdxCustomDockControl; pt: TPoint); override;
  end;

implementation

uses
  dxDockConsts, Forms, Controls;

type
  TdxCustomDockControlAccess = class(TdxCustomDockControl);
  TdxTabContainerDockSiteAccess = class(TdxTabContainerDockSite);
  TdxSideContainerDockSiteAccess = class(TdxSideContainerDockSite);

{ TdxLeftZone }

function TdxLeftZone.GetDirection: TdxZoneDirection;
begin
  Result := zdVertical;
end;

function TdxLeftZone.GetDockType: TdxDockingType;
begin
  Result := dtLeft;
end;

function TdxLeftZone.CanResize(StartPoint, EndPoint: TPoint): Boolean;
var
  NewWidth, NewHeight: Integer;
begin
  NewWidth := Owner.Width + (StartPoint.X - EndPoint.X);
  NewHeight := Owner.Height;
  Result := (NewWidth > 0) and (NewWidth < Owner.Parent.ClientWidth) and
    CanConstrainedResize(NewWidth, NewHeight);
  Result := Result and TdxCustomDockControlAccess(Owner).CanResizing(NewWidth, NewHeight);
end;

function TdxLeftZone.GetDockingSelection(AControl: TdxCustomDockControl): TRect;
var
  R: TRect;
begin
  if AControl.OriginalWidth < Owner.Width - 2 * dxSelectionFrameWidth then
    Result := Rect(0, 0, AControl.OriginalWidth, Owner.Height)
  else Result := Rect(0, 0, Owner.Width - 2 * dxSelectionFrameWidth, Owner.Height);
  GetWindowRect(Owner.Handle, R);
  OffsetRect(Result, R.Left, R.Top);
end;

function TdxLeftZone.GetResizingSelection(pt: TPoint): TRect;
var
  R: TRect;
begin
  GetWindowRect(Owner.Handle, R);
  Result.Left := pt.X;
  Result.Right := Result.Left + dxSelectionFrameWidth;
  Result.Top := R.Top;
  Result.Bottom := R.Bottom;
end;

function TdxLeftZone.GetRectangle: TRect;
begin
  Result := Rect(0, 0, Width, Owner.Height)
end;

function TdxLeftZone.CanConstrainedResize(NewWidth, NewHeight: Integer): Boolean;
begin
  Result := ((Owner.Constraints.MinWidth <= 0) or (NewWidth > Owner.Constraints.MinWidth)) and
    ((Owner.Constraints.MaxWidth <= 0) or (NewWidth < Owner.Constraints.MaxWidth));
end;

procedure TdxLeftZone.DoResize(StartPoint, EndPoint: TPoint);
begin
  Owner.Width := Owner.Width + (StartPoint.X - EndPoint.X);
end;

class function TdxLeftZone.ValidateDockZone(AOwner, AControl: TdxCustomDockControl): Boolean;
var
  I: Integer;
  AZone: TdxZone;
begin
  Result := dtLeft in AOwner.AllowDockClients;
  if Result then
    for I := 0 to AControl.DockZones.Count - 1 do
    begin
      AZone := TdxZone(AControl.DockZones.Items[I]);
      if (AZone.DockType = dtLeft) and (AZone.Owner.Height = AOwner.Height) then
      begin
        Result := False;
        break;
      end;
    end;
end;

class function TdxLeftZone.ValidateResizeZone(AOwner, AControl: TdxCustomDockControl): Boolean;
begin
  Result := (AOwner.ParentDockControl <> nil) and (AOwner.DockType = dtRight);
end;

{ TdxRightZone }

function TdxRightZone.GetDirection: TdxZoneDirection;
begin
  Result := zdVertical;
end;

function TdxRightZone.GetDockType: TdxDockingType;
begin
  Result := dtRight;
end;

function TdxRightZone.CanResize(StartPoint, EndPoint: TPoint): Boolean;
var
  NewWidth, NewHeight: Integer;
begin
  NewWidth := Owner.Width - (StartPoint.X - EndPoint.X);
  NewHeight := Owner.Height;
  Result := (NewWidth > 0) and (Owner.Left + NewWidth < Owner.Parent.ClientWidth) and
    CanConstrainedResize(NewWidth, NewHeight);
  Result := Result and TdxCustomDockControlAccess(Owner).CanResizing(NewWidth, NewHeight);
end;

function TdxRightZone.GetDockingSelection(AControl: TdxCustomDockControl): TRect;
var
  R: TRect;
begin
  if Owner.Width - AControl.OriginalWidth - 2 * dxSelectionFrameWidth > 0 then
    Result := Rect(Owner.Width - AControl.OriginalWidth, 0, Owner.Width, Owner.Height)
  else Result := Rect(2 * dxSelectionFrameWidth, 0, Owner.Width, Owner.Height);
  GetWindowRect(Owner.Handle, R);
  OffsetRect(Result, R.Left, R.Top);
end;

function TdxRightZone.GetResizingSelection(pt: TPoint): TRect;
var
  R: TRect;
begin
  GetWindowRect(Owner.Handle, R);
  Result.Right := pt.X;
  Result.Left := Result.Right - dxSelectionFrameWidth;
  Result.Top := R.Top;
  Result.Bottom := R.Bottom;
end;

class function TdxRightZone.ValidateDockZone(AOwner, AControl: TdxCustomDockControl): Boolean;
var
  I: Integer;
  AZone: TdxZone;
begin
  Result := dtRight in AOwner.AllowDockClients;
  if Result then
    for I := 0 to AControl.DockZones.Count - 1 do
    begin
      AZone := TdxZone(AControl.DockZones.Items[I]);
      if (AZone.DockType = dtRight) and (AZone.Owner.Height = AOwner.Height) then
      begin
        Result := False;
        break;
      end;
    end;
end;

class function TdxRightZone.ValidateResizeZone(AOwner, AControl: TdxCustomDockControl): Boolean;
begin
  Result := (AOwner.ParentDockControl <> nil) and (AOwner.DockType = dtLeft);
end;

function TdxRightZone.GetRectangle: TRect;
begin
  Result := Rect(Owner.Width - Width, 0, Owner.Width, Owner.Height)
end;

function TdxRightZone.CanConstrainedResize(NewWidth, NewHeight: Integer): Boolean;
begin
  Result := ((Owner.Constraints.MinWidth <= 0) or (NewWidth > Owner.Constraints.MinWidth)) and
    ((Owner.Constraints.MaxWidth <= 0) or (NewWidth < Owner.Constraints.MaxWidth));
end;

procedure TdxRightZone.DoResize(StartPoint, EndPoint: TPoint);
begin
  Owner.Width := Owner.Width - (StartPoint.X - EndPoint.X);
end;

{ TdxTopZone }

function TdxTopZone.GetDirection: TdxZoneDirection;
begin
  Result := zdHorizontal;
end;

function TdxTopZone.GetDockType: TdxDockingType;
begin
  Result := dtTop;
end;

function TdxTopZone.CanResize(StartPoint, EndPoint: TPoint): Boolean;
var
  NewWidth, NewHeight: Integer;
begin
  NewHeight := Owner.Height + (StartPoint.Y - EndPoint.Y);
  NewWidth := Owner.Width;
  Result := (NewHeight > 0) and (NewHeight < Owner.Parent.ClientHeight) and
    CanConstrainedResize(NewWidth, NewHeight);
  Result := Result and TdxCustomDockControlAccess(Owner).CanResizing(NewWidth, NewHeight);
end;

function TdxTopZone.GetDockingSelection(AControl: TdxCustomDockControl): TRect;
var
  R: TRect;
begin
  if AControl.OriginalHeight < Owner.Height - 2 * dxSelectionFrameWidth then
    Result := Rect(0, 0, Owner.Width, AControl.OriginalHeight)
  else Result := Rect(0, 0, Owner.Width, Owner.Height - 2 * dxSelectionFrameWidth);
  GetWindowRect(Owner.Handle, R);
  OffsetRect(Result, R.Left, R.Top);
end;

function TdxTopZone.GetResizingSelection(pt: TPoint): TRect;
var
  R: TRect;
begin
  GetWindowRect(Owner.Handle, R);
  Result.Top := pt.Y;
  Result.Bottom := Result.Top + dxSelectionFrameWidth;
  Result.Left := R.Left;
  Result.Right := R.Right;
end;

function TdxTopZone.GetRectangle: TRect;
begin
  Result := Rect(0, 0, Owner.Width, Width);
end;

function TdxTopZone.CanConstrainedResize(NewWidth, NewHeight: Integer): Boolean;
begin
  Result := ((Owner.Constraints.MinHeight <= 0) or (NewHeight > Owner.Constraints.MinHeight)) and
    ((Owner.Constraints.MaxHeight <= 0) or (NewHeight < Owner.Constraints.MaxHeight));
end;

procedure TdxTopZone.DoResize(StartPoint, EndPoint: TPoint);
begin
  Owner.Height := Owner.Height + (StartPoint.Y - EndPoint.Y);
end;

class function TdxTopZone.ValidateDockZone(AOwner, AControl: TdxCustomDockControl): Boolean;
var
  I: Integer;
  AZone: TdxZone;
begin
  Result := dtTop in AOwner.AllowDockClients;
  if Result then
    for I := 0 to AControl.DockZones.Count - 1 do
    begin
      AZone := TdxZone(AControl.DockZones.Items[I]);
      if (AZone.DockType = dtTop) and (AZone.Owner.Width = AOwner.Width) then
      begin
        Result := False;
        break;
      end;
    end;
end;

class function TdxTopZone.ValidateResizeZone(AOwner, AControl: TdxCustomDockControl): Boolean;
begin
  Result := (AOwner.ParentDockControl <> nil) and (AOwner.DockType = dtBottom);
end;

{ TdxBottomZone }

function TdxBottomZone.GetDirection: TdxZoneDirection;
begin
  Result := zdHorizontal;
end;

function TdxBottomZone.GetDockType: TdxDockingType;
begin
  Result := dtBottom;
end;

function TdxBottomZone.CanResize(StartPoint, EndPoint: TPoint): Boolean;
var
  NewWidth, NewHeight: Integer;
begin
  NewHeight := Owner.Height - (StartPoint.Y - EndPoint.Y);
  NewWidth := Owner.Width;
  Result := (NewHeight > 0) and (Owner.Top + NewHeight < Owner.Parent.ClientHeight) and
    CanConstrainedResize(NewWidth, NewHeight);
  Result := Result and TdxCustomDockControlAccess(Owner).CanResizing(NewWidth, NewHeight);
end;

function TdxBottomZone.GetDockingSelection(AControl: TdxCustomDockControl): TRect;
var
  R: TRect;
begin
  if Owner.Height - AControl.OriginalHeight - 2 * dxSelectionFrameWidth > 0 then
    Result := Rect(0, Owner.Height - AControl.OriginalHeight, Owner.Width, Owner.Height)
  else Result := Rect(0, 2 * dxSelectionFrameWidth, Owner.Width, Owner.Height);
  GetWindowRect(Owner.Handle, R);
  OffsetRect(Result, R.Left, R.Top);
end;

function TdxBottomZone.GetResizingSelection(pt: TPoint): TRect;
var
  R: TRect;
begin
  GetWindowRect(Owner.Handle, R);
  Result.Bottom := pt.Y;
  Result.Top := Result.Bottom - dxSelectionFrameWidth;
  Result.Left := R.Left;
  Result.Right := R.Right;
end;

function TdxBottomZone.GetRectangle: TRect;
begin
  Result := Rect(0, Owner.Height - Width, Owner.Width, Owner.Height)
end;

function TdxBottomZone.CanConstrainedResize(NewWidth, NewHeight: Integer): Boolean;
begin
  Result := ((Owner.Constraints.MinHeight <= 0) or (NewHeight > Owner.Constraints.MinHeight)) and
    ((Owner.Constraints.MaxHeight <= 0) or (NewHeight < Owner.Constraints.MaxHeight));
end;

procedure TdxBottomZone.DoResize(StartPoint, EndPoint: TPoint);
begin
  Owner.Height := Owner.Height - (StartPoint.Y - EndPoint.Y);
end;

class function TdxBottomZone.ValidateDockZone(AOwner, AControl: TdxCustomDockControl): Boolean;
var
  I: Integer;
  AZone: TdxZone;
begin
  Result := dtBottom in AOwner.AllowDockClients;
  if Result then
    for I := 0 to AControl.DockZones.Count - 1 do
    begin
      AZone := TdxZone(AControl.DockZones.Items[I]);
      if (AZone.DockType = dtBottom) and (AZone.Owner.Width = AOwner.Width) then
      begin
        Result := False;
        break;
      end;
    end;
end;

class function TdxBottomZone.ValidateResizeZone(AOwner, AControl: TdxCustomDockControl): Boolean;
begin
  Result := (AOwner.ParentDockControl <> nil) and (AOwner.DockType = dtTop);
end;

{ TdxClientZone }

function TdxClientZone.GetDirection: TdxZoneDirection;
begin
  Result := zdUndefined;
end;

function TdxClientZone.GetDockType: TdxDockingType;
begin
  Result := dtClient;
end;

function TdxClientZone.GetRectangle: TRect;
begin
  Result := Rect(0, 0, Owner.Width, Owner.Height);
end;

class function TdxClientZone.ValidateDockZone(AOwner, AControl: TdxCustomDockControl): Boolean;
begin
  Result := dtClient in AOwner.AllowDockClients;
  Result := Result and (AOwner = AControl) and (AOwner.ChildCount = 0);
end;

{ TdxAutoHideLeftZone }

function TdxAutoHideLeftZone.CanResize(StartPoint, EndPoint: TPoint): Boolean;
var
  NewWidth, NewHeight: Integer;
begin
  NewWidth := Owner.Width + (StartPoint.X - EndPoint.X);
  NewHeight := Owner.Height;
  Result := (NewWidth > 0) and ((Owner.AutoHideHostSite.AutoSize and
    (NewWidth < Owner.AutoHideContainer.Parent.ClientWidth - Owner.AutoHideHostSite.Width)) or
    (not Owner.AutoHideHostSite.AutoSize and (NewWidth < Owner.AutoHideHostSite.ClientWidth))) and
    CanConstrainedResize(NewWidth, NewHeight);
  Result := Result and TdxCustomDockControlAccess(Owner).CanResizing(NewWidth, NewHeight);
end;

class function TdxAutoHideLeftZone.ValidateResizeZone(AOwner,
  AControl: TdxCustomDockControl): Boolean;
begin
  Result := AOwner.AutoHide and (AOwner.AutoHideHostSite <> nil) and
    (AOwner.AutoHideHostSite.GetPositionByControl(AOwner) = ahpRight);
end;

{ TdxAutoHideRightZone }

function TdxAutoHideRightZone.CanResize(StartPoint, EndPoint: TPoint): Boolean;
var
  NewWidth, NewHeight: Integer;
begin
  NewWidth := Owner.Width - (StartPoint.X - EndPoint.X);
  NewHeight := Owner.Height;
  Result := (NewWidth > 0) and ((Owner.AutoHideHostSite.AutoSize and
    (NewWidth < Owner.AutoHideContainer.Parent.ClientWidth - Owner.AutoHideHostSite.Width)) or
    (not Owner.AutoHideHostSite.AutoSize and (NewWidth < Owner.AutoHideHostSite.ClientWidth))) and
    CanConstrainedResize(NewWidth, NewHeight);
  Result := Result and TdxCustomDockControlAccess(Owner).CanResizing(NewWidth, NewHeight);
end;

class function TdxAutoHideRightZone.ValidateResizeZone(AOwner,
  AControl: TdxCustomDockControl): Boolean;
begin
  Result := AOwner.AutoHide and (AOwner.AutoHideHostSite <> nil) and
    (AOwner.AutoHideHostSite.GetPositionByControl(AOwner) = ahpLeft);
end;

{ TdxAutoHideTopZone }

function TdxAutoHideTopZone.CanResize(StartPoint, EndPoint: TPoint): Boolean;
var
  NewWidth, NewHeight: Integer;
begin
  NewHeight := Owner.Height + (StartPoint.Y - EndPoint.Y);
  NewWidth := Owner.Width;
  Result := (NewHeight > 0) and ((Owner.AutoHideHostSite.AutoSize and
    (NewHeight < Owner.AutoHideContainer.Parent.ClientHeight - Owner.AutoHideHostSite.Height)) or
    (not Owner.AutoHideHostSite.AutoSize and (NewHeight < Owner.AutoHideHostSite.ClientHeight))) and
    CanConstrainedResize(NewWidth, NewHeight);
  Result := Result and TdxCustomDockControlAccess(Owner).CanResizing(NewWidth, NewHeight);
end;

class function TdxAutoHideTopZone.ValidateResizeZone(AOwner,
  AControl: TdxCustomDockControl): Boolean;
begin
  Result := AOwner.AutoHide and (AOwner.AutoHideHostSite <> nil) and
    (AOwner.AutoHideHostSite.GetPositionByControl(AOwner) = ahpBottom);
end;

{ TdxAutoHideBottomZone }

function TdxAutoHideBottomZone.CanResize(StartPoint, EndPoint: TPoint): Boolean;
var
  NewWidth, NewHeight: Integer;
begin
  NewHeight := Owner.Height - (StartPoint.Y - EndPoint.Y);
  NewWidth := Owner.Width;
  Result := (NewHeight > 0) and ((Owner.AutoHideHostSite.AutoSize and
    (NewHeight < Owner.AutoHideContainer.Parent.ClientHeight - Owner.AutoHideHostSite.Height)) or
    (not Owner.AutoHideHostSite.AutoSize and (NewHeight < Owner.AutoHideHostSite.ClientHeight))) and
    CanConstrainedResize(NewWidth, NewHeight);
  Result := Result and TdxCustomDockControlAccess(Owner).CanResizing(NewWidth, NewHeight);
end;

class function TdxAutoHideBottomZone.ValidateResizeZone(AOwner,
  AControl: TdxCustomDockControl): Boolean;
begin
  Result := AOwner.AutoHide and (AOwner.AutoHideHostSite <> nil) and
    (AOwner.AutoHideHostSite.GetPositionByControl(AOwner) = ahpTop);
end;

{ TdxAutoSizeLeftZone }

class function TdxAutoSizeLeftZone.ValidateResizeZone(AOwner,
  AControl: TdxCustomDockControl): Boolean;
begin
  Result := (AOwner.Parent <> nil) and (AOwner.Align in [alRight]);
end;

{ TdxAutoSizeRightZone }

class function TdxAutoSizeRightZone.ValidateResizeZone(AOwner,
  AControl: TdxCustomDockControl): Boolean;
begin
  Result := (AOwner.Parent <> nil) and (AOwner.Align in [alLeft, alNone]);
end;

{ TdxAutoSizeTopZone }

class function TdxAutoSizeTopZone.ValidateResizeZone(AOwner,
  AControl: TdxCustomDockControl): Boolean;
begin
  Result := (AOwner.Parent <> nil) and (AOwner.Align in [alBottom]);
end;

{ TdxAutoSizeBottomZone }

class function TdxAutoSizeBottomZone.ValidateResizeZone(AOwner,
  AControl: TdxCustomDockControl): Boolean;
begin
  Result := (AOwner.Parent <> nil) and (AOwner.Align in [alTop, alNone]);
end;

{ TdxAutoSizeClientZone }

function TdxAutoSizeClientZone.GetDockingSelection(AControl: TdxCustomDockControl): TRect;
var
  R: TRect;
  AWidth, AHeight: Integer;
begin
  GetWindowRect(Owner.Handle, R);
  if Owner.Width < AControl.OriginalWidth then
    AWidth := AControl.OriginalWidth
  else AWidth := Owner.Width;
  if Owner.Height < AControl.OriginalHeight then
    AHeight := AControl.OriginalHeight
  else AHeight := Owner.Height;
  case Owner.Align of
    alLeft: begin
      Result := Rect(0, 0, AWidth, Owner.Height);
      OffsetRect(Result, R.Left, R.Top);
    end;
    alRight: begin
      Result := Rect(0, 0, AWidth, Owner.Height);
      OffsetRect(Result, R.Right - AWidth, R.Top);
    end;
    alTop: begin
      Result := Rect(0, 0, Owner.Width, AHeight);
      OffsetRect(Result, R.Left, R.Top);
    end;
    alBottom: begin
      Result := Rect(0, 0, Owner.Width, AHeight);
      OffsetRect(Result, R.Left, R.Bottom - AHeight);
    end;
    alClient: begin
      Result := Rect(0, 0, Owner.Width, Owner.Height);
      OffsetRect(Result, R.Left, R.Top);
    end;
  else
    Result := Rect(0, 0, AWidth, AHeight);
    OffsetRect(Result, R.Left, R.Top);
  end;
end;

{ TdxTabContainerZone }

constructor TdxTabContainerZone.Create(AControl: TdxTabContainerDockSite);
begin
  inherited Create(AControl, 0);
end;

function TdxTabContainerZone.GetDockIndex: Integer;
begin
  Result := -1;
end;

function TdxTabContainerZone.GetTabRect(AControl: TdxCustomDockControl): TRect;
var
  AIndex: Integer;
  ASize: TSize;
begin
  if (0 <= DockIndex) and (DockIndex < TdxTabContainerDockSiteAccess(TabContainer).TabRectCount) then
    Result := TdxTabContainerDockSiteAccess(TabContainer).TabsRects[DockIndex]
  else
  begin
    AIndex := TdxTabContainerDockSiteAccess(TabContainer).GetLastValidChildIndex;
    if AIndex > -1 then
    begin
      Result := TdxTabContainerDockSiteAccess(TabContainer).TabsRects[AIndex];
      GetTextExtentPoint32(TdxTabContainerDockSiteAccess(TabContainer).Canvas.Handle,
        PChar(AControl.Caption), Length(AControl.Caption), ASize);
      if TdxTabContainerDockSiteAccess(TabContainer).Painter.GetImageWidth > 0 then
        Inc(ASize.cx, TdxTabContainerDockSiteAccess(TabContainer).Painter.GetImageWidth);
      Result.Left := Result.Right;
      Result.Right := Result.Left + ASize.cx;
    end
    else Result := Rectangle;
  end;
end;

function TdxTabContainerZone.GetTabsRect: TRect;
begin
  Result := TdxTabContainerDockSiteAccess(TabContainer).TabsRect
end;

procedure TdxTabContainerZone.DrawDockingSelection(DC: HDC; AControl: TdxCustomDockControl; pt: TPoint);
var
  PenSize: Integer;
  R, TabRect, TabsRect: TRect;
begin
  PenSize := dxSelectionFrameWidth;
  R := GetDockingSelection(AControl);
  TabRect := GetTabRect(AControl);
  TabsRect := GetTabsRect;
  if TabRect.Left < TabsRect.Left then
  begin
    TabRect.Left := TabsRect.Left;
    if TabRect.Right < TabsRect.Left + 3 * PenSize then
      TabRect.Right := TabRect.Left + 3 * PenSize;
  end;
  if TabRect.Right > TabsRect.Right then
  begin
    TabRect.Right := TabsRect.Right;
    if TabRect.Left > TabsRect.Right  - 3 * PenSize then
      TabRect.Left := TabRect.Right - 3 * PenSize;
  end;
  with R do
    if TabContainer.TabsPosition = tctpTop then
    begin
      PatBlt(DC, Left + PenSize, Bottom - PenSize, Right - Left - PenSize, PenSize, PATINVERT);
      PatBlt(DC, Left, Top + TabRect.Bottom, PenSize, Bottom - Top - TabRect.Bottom, PATINVERT);
      PatBlt(DC, Left, Top + TabRect.Bottom - PenSize, TabRect.Left, PenSize, PATINVERT);
      PatBlt(DC, Left + TabRect.Left, Top + TabRect.Top, PenSize, TabRect.Bottom - TabRect.Top, PATINVERT);
      PatBlt(DC, Left + TabRect.Left, Top + TabRect.Top - PenSize, TabRect.Right - TabRect.Left - PenSize, PenSize, PATINVERT);
      PatBlt(DC, Left + TabRect.Right - PenSize, Top + TabRect.Top - PenSize, PenSize, TabRect.Bottom - TabRect.Top + PenSize, PATINVERT);
      PatBlt(DC, Left + TabRect.Right, Top + TabRect.Bottom - PenSize, Right - Left - TabRect.Right - PenSize, PenSize, PATINVERT);
      PatBlt(DC, Right - PenSize, Top + TabRect.Bottom - PenSize, PenSize, Bottom - Top - TabRect.Bottom, PATINVERT);
    end
    else
    begin
      PatBlt(DC, Left + PenSize, Top, Right - Left - PenSize, PenSize, PATINVERT);
      PatBlt(DC, Left, Top, PenSize, TabRect.Top - PenSize, PATINVERT);
      PatBlt(DC, Left, Top + TabRect.Top - PenSize, TabRect.Left, PenSize, PATINVERT);
      PatBlt(DC, Left + TabRect.Left, Top + TabRect.Top - PenSize, PenSize, TabRect.Bottom - TabRect.Top, PATINVERT);
      PatBlt(DC, Left + TabRect.Left, Top + TabRect.Bottom - PenSize, TabRect.Right - TabRect.Left, PenSize, PATINVERT);
      PatBlt(DC, Left + TabRect.Right - PenSize, Top + TabRect.Top - PenSize, PenSize, TabRect.Bottom - TabRect.Top, PATINVERT);
      PatBlt(DC, Left + TabRect.Right, Top + TabRect.Top - PenSize, Right - Left - TabRect.Right - PenSize, PenSize, PATINVERT);
      PatBlt(DC, Right - PenSize, Top + PenSize, PenSize, TabRect.Top - PenSize, PATINVERT);
    end;
end;

function TdxTabContainerZone.GetTabContainer: TdxTabContainerDockSite;
begin
  Result := inherited Owner as TdxTabContainerDockSite;
end;

{ TdxTabContainerTabZone }

constructor TdxTabContainerTabZone.Create(AControl: TdxTabContainerDockSite;
  ADockIndex: Integer);
begin
  inherited Create(AControl);
  FDockIndex := ADockIndex;
end;

function TdxTabContainerTabZone.GetDockIndex: Integer;
begin
  Result := FDockIndex;
end;

function TdxTabContainerTabZone.IsZonePoint(pt: TPoint): Boolean;
begin
  pt := TabContainer.ScreenToClient(pt);
  Result := TdxTabContainerDockSiteAccess(TabContainer).GetTabIndexAtPos(pt) = DockIndex;
end;

{ TdxHorizContainerZone }

function TdxHorizContainerZone.CanResize(StartPoint, EndPoint: TPoint): Boolean;
begin
  Result := inherited CanResize(StartPoint, EndPoint);
  if Owner.SideContainer <> nil then
    Result := Result and TdxSideContainerDockSiteAccess(Owner.SideContainer).CanChildResize(Owner.SideContainerItem,
      - (StartPoint.X - EndPoint.X));
end;

procedure TdxHorizContainerZone.DoResize(StartPoint, EndPoint: TPoint);
begin
  if Owner.SideContainer <> nil then
    TdxSideContainerDockSiteAccess(Owner.SideContainer).DoChildResize(Owner.SideContainerItem,
      - (StartPoint.X - EndPoint.X));
end;

{ TdxVertContainerZone }

function TdxVertContainerZone.CanResize(StartPoint, EndPoint: TPoint): Boolean;
begin
  Result := inherited CanResize(StartPoint, EndPoint);
  if Owner.SideContainer <> nil then
    Result := Result and TdxSideContainerDockSiteAccess(Owner.SideContainer).CanChildResize(Owner.SideContainerItem,
      - (StartPoint.Y - EndPoint.Y));
end;

procedure TdxVertContainerZone.DoResize(StartPoint, EndPoint: TPoint);
begin
  if Owner.SideContainer <> nil then
    TdxSideContainerDockSiteAccess(Owner.SideContainer).DoChildResize(Owner.SideContainerItem,
      - (StartPoint.Y - EndPoint.Y));
end;

{ TdxDockPanelClientZone }

procedure TdxDockPanelClientZone.DrawDockingSelection(DC: HDC; AControl: TdxCustomDockControl; pt: TPoint);
var
  ASize: TSize;
  PenSize: Integer;
  R: TRect;
  TabHeight, TabWidth, TabInterval: Integer;
begin
  PenSize := dxSelectionFrameWidth;
  R := GetDockingSelection(AControl);
  TabHeight := TdxCustomDockControlAccess(Owner).Painter.GetTabsHeight -
    TdxCustomDockControlAccess(Owner).Painter.GetTabHorizInterval;
  TabInterval := 2 * TdxCustomDockControlAccess(Owner).Painter.GetTabHorizInterval;
  GetTextExtentPoint32(TdxCustomDockControlAccess(Owner).Canvas.Handle,
    PChar(AControl.Caption), Length(AControl.Caption), ASize);
  if TdxTabContainerDockSiteAccess(Owner).Painter.GetImageWidth > 0 then
    Inc(ASize.cx, TdxTabContainerDockSiteAccess(Owner).Painter.GetImageWidth);
  if ASize.cx < Owner.Width - 2 * TabInterval then
    TabWidth := ASize.cx
  else TabWidth := Owner.Width - 2 * TabInterval;
  with R do
    if (Owner.Controller.DefaultTabContainerSiteProperties <> nil) and
      (Owner.Controller.DefaultTabContainerSiteProperties.TabsPosition = tctpTop) then
    begin
      if TdxCustomDockControlAccess(Owner).HasCaption and not TdxCustomDockControlAccess(Owner).IsCaptionVertical then
          R.Top := R.Top + TdxCustomDockControlAccess(Owner).Painter.GetCaptionHeight + TdxCustomDockControlAccess(Owner).Painter.GetBorderWidth;
      PatBlt(DC, Left, Top + TabHeight, PenSize, Bottom - Top - TabHeight, PATINVERT);
      PatBlt(DC, Left + PenSize, Bottom - PenSize, Right - Left - PenSize, PenSize, PATINVERT);
      PatBlt(DC, Right - PenSize, Top + TabHeight, PenSize, Bottom - Top - TabHeight - PenSize, PATINVERT);
      PatBlt(DC, Left + TabInterval + TabWidth, Top + TabHeight, Right - Left - TabInterval - TabWidth - PenSize, PenSize, PATINVERT);
      PatBlt(DC, Left + TabInterval + TabWidth, Top, PenSize, TabHeight, PATINVERT);
      PatBlt(DC, Left + TabInterval + PenSize, Top, TabWidth - PenSize, PenSize, PATINVERT);
      PatBlt(DC, Left + TabInterval, Top, PenSize, TabHeight, PATINVERT);
      PatBlt(DC, Left + PenSize, Top + TabHeight, TabInterval, PenSize, PATINVERT);
    end
    else
    begin
      PatBlt(DC, Left + PenSize, Top, Right - Left - PenSize, PenSize, PATINVERT);
      PatBlt(DC, Left, Top, PenSize, Bottom - Top - TabHeight - PenSize, PATINVERT);
      PatBlt(DC, Left, Top + Bottom - Top - TabHeight - PenSize, TabInterval, PenSize, PATINVERT);
      PatBlt(DC, Left + TabInterval, Bottom - TabHeight - PenSize, PenSize, TabHeight, PATINVERT);
      PatBlt(DC, Left + TabInterval, Bottom - PenSize, TabWidth, PenSize, PATINVERT);
      PatBlt(DC, Left + TabInterval + TabWidth - PenSize, Bottom - TabHeight, PenSize, TabHeight - PenSize, PATINVERT);
      PatBlt(DC, Left + TabInterval + TabWidth - PenSize, Bottom - TabHeight - PenSize, Right - Left - TabInterval - TabWidth, PenSize, PATINVERT);
      PatBlt(DC, Right - PenSize, Top + PenSize, PenSize, Bottom - Top - TabHeight - PenSize, PATINVERT);
    end;
end;

end.
