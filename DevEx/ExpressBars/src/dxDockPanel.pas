
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

unit dxDockPanel;

{$I dxDockVer.inc}

interface

uses
  Menus, Windows, Graphics, Classes, Controls, ExtCtrls, Messages, Forms,
  dxDockConsts, dxDockControl;

type
  TdxDockPanel = class(TdxCustomDockControl)
  protected
    procedure SetParent(AParent: TWinControl); override;
    procedure ValidateInsert(AComponent: TComponent); override;
    // Docking
    procedure UpdateControlDockZones(AControl: TdxCustomDockControl; AZoneWidth: Integer); override;
    // Site layout
    procedure CreateLayout(AControl: TdxCustomDockControl; AType: TdxDockingType;
      Index: Integer); override;
    // SideContainer site
    function CanAcceptSideContainerItems(AContainer: TdxSideContainerDockSite): Boolean; override;
    // TabContainer site
    function CanAcceptTabContainerItems(AContainer: TdxTabContainerDockSite): Boolean; override;
    // Painting
    function HasBorder: Boolean; override;
    function HasCaption: Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function CanActive: Boolean; override;
    function CanAutoHide: Boolean; override;
    function CanDock: Boolean; override;
    function CanDockHost(AControl: TdxCustomDockControl; AType: TdxDockingType): Boolean; override;
    function CanMaximize: Boolean; override;
  published
    property AllowDockClients;
    property AllowFloating;
    property AllowDock;
    property AutoHide;
    property Caption;
    property CaptionButtons;
    property Dockable;
    property ImageIndex;
    property ShowCaption;

    property OnActivate;
    property OnAutoHideChanged;
    property OnAutoHideChanging;
    property OnCanResize;
    property OnClose;
    property OnCloseQuery;
    property OnCreateFloatSite;
    property OnCreateSideContainer;
    property OnCreateTabContainer;
    property OnCustomDrawDockingSelection;
    property OnCustomDrawResizingSelection;
    property OnDock;
    property OnDocking;
    property OnEndDocking;
    property OnEndResizing;
    property OnGetAutoHidePosition;
    property OnLayoutChanged;
    property OnMakeFloating;
    property OnResize;
    property OnResizing;
    property OnRestoreDockPosition;
    property OnStartDocking;
    property OnStartResizing;
    property OnStoreDockPosition;
    property OnUnDock;
    property OnUpdateDockZones;
    property OnUpdateResizeZones;
  end;

implementation

uses
  SysUtils, dxDockZones;

{ TdxDockPanel }

constructor TdxDockPanel.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  UseDoubleBuffer := True;
  SetBounds(0, 0, 185, 140);
end;

destructor TdxDockPanel.Destroy;
begin
  inherited;
end;

function TdxDockPanel.CanActive: Boolean;
begin
  Result := True;
end;

function TdxDockPanel.CanAutoHide: Boolean;
begin
  Result := IsLoading or ((AutoHideHostSite <> nil) and
    ((AutoHideControl = nil) or (AutoHideControl = Self)));
end;

function TdxDockPanel.CanDock: Boolean;
begin
  Result := True;
end;

function TdxDockPanel.CanDockHost(AControl: TdxCustomDockControl; AType: TdxDockingType): Boolean;
var
  ACanDockHost: Boolean;
begin
  if Container <> nil then
  begin
    ACanDockHost := Container.CanContainerDockHost(AType);
    if Container is TdxTabContainerDockSite then
    begin
      if doSideContainerCanInTabContainer in Controller.Options then
        ACanDockHost := ACanDockHost or (AType in [dtLeft, dtRight, dtTop, dtBottom]);
    end;
    if Container is TdxSideContainerDockSite then
    begin
      if doTabContainerCanInSideContainer in Controller.Options then
        ACanDockHost := ACanDockHost or (AType in [dtClient]);
      if doSideContainerCanInSideContainer in Controller.Options then
        ACanDockHost := ACanDockHost or (AType in [dtLeft, dtRight, dtTop, dtBottom]);
    end;
  end
  else ACanDockHost := (AType in [dtClient, dtLeft, dtRight, dtTop, dtBottom]);
  Result := inherited CanDockHost(AControl, AType) and ACanDockHost;;
end;

function TdxDockPanel.CanMaximize: Boolean;
begin
  Result := not AutoHide and (SideContainer <> nil) and (SideContainer.ValidChildCount > 1);
end;

procedure TdxDockPanel.SetParent(AParent: TWinControl);
var
  ALeft, ATop: Integer;
begin
  if (UpdateLayoutLock > 0) or (AParent = nil) or IsLoading or IsDestroying then
  begin
    if (AParent <> nil) and not ((AParent is TdxCustomDockControl) or
      (AutoHide and (AParent is TdxDockSiteAutoHideContainer))) then
      raise Exception.CreateFmt(sdxInvalidParent, [ClassName])
    else inherited SetParent(AParent);
  end
  else
  begin
    if (AParent is TdxCustomDockControl) and (AParent as TdxCustomDockControl).CanDockHost(Self, dtLeft) then
      DockTo(AParent as TdxCustomDockControl, dtLeft, -1)
    else if (AParent is TdxCustomDockControl) and (AParent as TdxCustomDockControl).CanDockHost(Self, dtTop) then
      DockTo(AParent as TdxCustomDockControl, dtTop, -1)
    else if (AParent is TdxCustomDockControl) and (AParent as TdxCustomDockControl).CanDockHost(Self, dtClient) then
      DockTo(AParent as TdxCustomDockControl, dtClient, -1)
    else
    begin
      ALeft := AParent.ClientOrigin.X + Left;
      ATop := AParent.ClientOrigin.Y + Top;
      MakeFloating(ALeft, ATop);
    end;
  end;
end;

procedure TdxDockPanel.ValidateInsert(AComponent: TComponent);
begin
  if (AComponent is TdxCustomDockControl) then
    raise Exception.CreateFmt(sdxInvalidPanelChild, [AComponent.ClassName]);
end;

procedure TdxDockPanel.UpdateControlDockZones(AControl: TdxCustomDockControl; AZoneWidth: Integer);
begin
  if TabContainer <> nil then
    DockZones.Insert(0, TdxTabContainerZone.Create(TabContainer))
  else DockZones.Insert(0, TdxDockPanelClientZone.Create(Self, 0));
  inherited;
end;

procedure TdxDockPanel.CreateLayout(AControl: TdxCustomDockControl;
  AType: TdxDockingType; Index: Integer);
begin
  if (Container <> nil) and Container.CanContainerDockHost(AType) then
    CreateContainerLayout(Container, AControl, AType, DockIndex)
  else
    case AType of
      dtClient:
        CreateTabContainerLayout(AControl, AType, Index);
      dtLeft, dtRight, dtTop, dtBottom:
        CreateSideContainerLayout(AControl, AType, Index);
    else
      Assert(False, Format(sdxInternalErrorCreateLayout, [TdxContainerDockSite.ClassName]));
    end;
end;

function TdxDockPanel.CanAcceptSideContainerItems(AContainer: TdxSideContainerDockSite): Boolean;
begin
  Result := True;
end;

function TdxDockPanel.CanAcceptTabContainerItems(AContainer: TdxTabContainerDockSite): Boolean;
begin
  Result := True;
end;

function TdxDockPanel.HasBorder: Boolean;
begin
  Result := (FloatDockSite = nil) and ((TabContainer = nil) or AutoHide);
end;

function TdxDockPanel.HasCaption: Boolean;
begin
  Result := ShowCaption and (FloatDockSite = nil) and ((TabContainer = nil) or AutoHide);
end;

initialization
  RegisterClasses([TdxDockPanel]);

end.
