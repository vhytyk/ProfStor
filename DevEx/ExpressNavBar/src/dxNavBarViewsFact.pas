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

unit dxNavBarViewsFact;

{$I dxNavBarVer.inc}

interface

uses
  Classes, dxNavBar;

type
  TdxNavBarViewsFactory = class
  private
    FViews: TList;

    function GetCount: Integer;
    function GetNames(ID: Integer): string;
    function GetPainterClass(ID: Integer): TdxNavBarPainterClass;

    procedure Clear;
    function IndexOfID(const ID: Integer): Integer;
  public
    constructor Create;
    destructor Destroy; override;
    procedure RegisterView(AID: Integer; AName: string; APainterClass: TdxNavBarPainterClass);
    function IndexOfName(const Name: string): Integer;

    property Count: Integer read GetCount;
    property Names[ID: Integer]: string read GetNames;
    property PainterClasses[ID: Integer]: TdxNavBarPainterClass read GetPainterClass;
  end;

function dxNavBarViewsFactory: TdxNavBarViewsFactory;

implementation

uses
  SysUtils;

type
  PcxNavBarPainterFactItem = ^TdxNavBarPainterFactItem;
  TdxNavBarPainterFactItem = record
    ID: Integer;
    Name: string;
    PainterClass: TdxNavBarPainterClass;
  end;

var
  FNavBarViewsFactory: TdxNavBarViewsFactory;

function dxNavBarViewsFactory: TdxNavBarViewsFactory;
begin
  if FNavBarViewsFactory = nil then
    FNavBarViewsFactory := TdxNavBarViewsFactory.Create;
  Result := FNavBarViewsFactory;
end;

{ TdxNavBarViewsFactory }

constructor TdxNavBarViewsFactory.Create;
begin
  FViews := TList.Create;
end;

destructor TdxNavBarViewsFactory.Destroy;
begin
  Clear;
  FViews.Free;
  inherited Destroy;
end;

function TdxNavBarViewsFactory.GetCount: Integer;
begin
  Result := FViews.Count;
end;

function TdxNavBarViewsFactory.GetNames(ID: Integer): string;
begin
  if IndexOfID(ID) < 0 then
    raise Exception.CreateFmt('Cannot find view with ID = %d.', [ID]);
  Result := PcxNavBarPainterFactItem(FViews.Items[IndexOfID(ID)])^.Name
end;

function TdxNavBarViewsFactory.GetPainterClass(ID: Integer): TdxNavBarPainterClass;
begin
  if IndexOfID(ID) < 0 then
    raise Exception.CreateFmt('Cannot find view with ID = %d.', [ID]);
  Result := PcxNavBarPainterFactItem(FViews.Items[IndexOfID(ID)])^.PainterClass
end;

procedure TdxNavBarViewsFactory.Clear;
var
  I: Integer;
begin
  for I := 0 to FViews.Count - 1 do
    Dispose(PcxNavBarPainterFactItem(FViews.Items[I]));
  FViews.Clear;
end;

function TdxNavBarViewsFactory.IndexOfID(const ID: Integer): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to FViews.Count - 1 do
    if PcxNavBarPainterFactItem(FViews.Items[I])^.ID = ID then
    begin
      Result := I;
      break;
    end;
end;

procedure TdxNavBarViewsFactory.RegisterView(AID: Integer; AName: string; APainterClass: TdxNavBarPainterClass);
var
  Item: PcxNavBarPainterFactItem;
begin
  if IndexOfID(AID) > 0 then
    raise Exception.CreateFmt('ID of view = %d is already exists.', [AID]);
  New(Item);
  with Item^ do
  begin
    ID := AID;
    Name := AName;
    PainterClass := APainterClass
  end;
  FViews.Add(Item);
end;

function TdxNavBarViewsFactory.IndexOfName(const Name: string): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to Count - 1 do
    if Names[I] = Name then
    begin
      Result := I;
      break;
    end;
end;

initialization

finalization
  FNavBarViewsFactory.Free;

end.
