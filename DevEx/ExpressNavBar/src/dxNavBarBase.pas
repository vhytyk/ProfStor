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

unit dxNavBarBase;

{$I dxNavBarVer.inc}

interface

uses
  Classes;

type
  TdxNavBarChangeType = (doRecreate, doRecalc, doRedraw);
  TdxNavBarChangeEvent = procedure(Sender: TObject; AType: TdxNavBarChangeType) of object;

  TdxNavBarComponentCollection = class;
  TdxNavBarComponentCollectionItem = class(TComponent)
  private
    FCollection: TdxNavBarComponentCollection;
    function GetIndex: Integer;
    procedure SetIndex(Value: Integer);
  protected
    procedure Changed(AType: TdxNavBarChangeType);
  public
    function GetParentComponent: TComponent; override;
    function HasParent: Boolean; override;
    procedure AddToCollection(ACollection: TdxNavBarComponentCollection);
    procedure RemoveFromCollection(ACollection: TdxNavBarComponentCollection);
    property Collection: TdxNavBarComponentCollection read FCollection;
    property Index: Integer read GetIndex write SetIndex;
  end;
  TdxNavBarComponentCollectionItemClass = class of TdxNavBarComponentCollectionItem;

  TdxNavBarComponentCollection = class(TPersistent)
  private
    FItemClass: TdxNavBarComponentCollectionItemClass;
    FItems: TList;
    FOwner: TComponent;
    FUpdateCount: Integer;
    FOnChange: TdxNavBarChangeEvent;

    function GetCount: Integer;
    procedure InsertItem(Item: TdxNavBarComponentCollectionItem);
    procedure RemoveItem(Item: TdxNavBarComponentCollectionItem);
  protected
    function GetItem(Index: Integer): TdxNavBarComponentCollectionItem;
    procedure SetItem(Index: Integer; Value: TdxNavBarComponentCollectionItem);

    procedure DoChanged(AType: TdxNavBarChangeType); dynamic;
    procedure BeginUpdate;
    procedure EndUpdate;
    property UpdateCount: Integer read FUpdateCount;

    property ItemClass: TdxNavBarComponentCollectionItemClass read FItemClass;
  public
    constructor Create(AOwner: TComponent; AItemClass: TdxNavBarComponentCollectionItemClass);
    destructor Destroy; override;

    function Add: TdxNavBarComponentCollectionItem;
    procedure Assign(Source: TPersistent); override;
    procedure Clear;
    procedure Delete(Index: Integer);
    function IndexOf(Item: TdxNavBarComponentCollectionItem): Integer;
    function ItemByName(const AName: string): TdxNavBarComponentCollectionItem;
    procedure Remove(Item: TdxNavBarComponentCollectionItem);

    property Count: Integer read GetCount;
    property Items[Index: Integer]: TdxNavBarComponentCollectionItem read GetItem write SetItem; default; 
    property Owner: TComponent read FOwner;
    property OnChange: TdxNavBarChangeEvent read FOnChange write FOnChange;
  end;

implementation

{ TdxComponentCollectionItem }

function TdxNavBarComponentCollectionItem.GetIndex: Integer;
begin
  if FCollection <> nil then
    Result := FCollection.FItems.IndexOf(Self)
  else Result := -1;
end;

procedure TdxNavBarComponentCollectionItem.Changed(AType: TdxNavBarChangeType);
begin
  if Collection <> nil then
    Collection.DoChanged(AType);
end;

procedure TdxNavBarComponentCollectionItem.AddToCollection(ACollection: TdxNavBarComponentCollection);
begin
  ACollection.InsertItem(Self);
  FCollection := ACollection;
  Changed(doRecreate);
end;

procedure TdxNavBarComponentCollectionItem.RemoveFromCollection(ACollection: TdxNavBarComponentCollection);
begin
  FCollection := nil;
  if ACollection <> nil then
  begin
    ACollection.RemoveItem(Self);
    ACollection.DoChanged(doRecreate);
  end;
end;

procedure TdxNavBarComponentCollectionItem.SetIndex(Value: Integer);
var
  CurIndex: Integer;
begin
  if Collection = nil then Exit;
  if Value < 0 then Value := 0;
  if Value > Collection.Count - 1
    then Value := Collection.Count - 1;
  CurIndex := GetIndex;
  if CurIndex <> Value then
    FCollection.FItems.Move(CurIndex, Value);
  Changed(doRecreate);
end;

function TdxNavBarComponentCollectionItem.GetParentComponent: TComponent;
begin
  if (Collection <> nil) and (Collection.Owner <> nil) and
    not (csInheritable in Collection.Owner.ComponentStyle) then
    Result := Collection.Owner
  else Result := nil;
end;

function TdxNavBarComponentCollectionItem.HasParent: Boolean;
begin
  if Collection <> nil then
    Result := Collection.Owner <> nil
  else Result := False;
end;

{ TdxComponentCollection }

constructor TdxNavBarComponentCollection.Create(AOwner: TComponent; AItemClass: TdxNavBarComponentCollectionItemClass);
begin
  FOwner := AOwner;
  FItemClass := AItemClass;
  FItems := TList.Create;
end;

destructor TdxNavBarComponentCollection.Destroy;
begin
  FUpdateCount := 1;
  if FItems <> nil then Clear;
  FItems.Free;
  inherited Destroy;
end;

function TdxNavBarComponentCollection.Add: TdxNavBarComponentCollectionItem;
begin
  Result := ItemClass.Create(Owner.Owner);
  Result.AddToCollection(Self);
end;

procedure TdxNavBarComponentCollection.Assign(Source: TPersistent);
var
  I: Integer;
begin
  if Source is TdxNavBarComponentCollection then
  begin
    BeginUpdate;
    try
      Clear;
      for I := 0 to TdxNavBarComponentCollection(Source).Count - 1 do
        Add.Assign(TdxNavBarComponentCollection(Source).Items[I]);
    finally
      EndUpdate;
    end;
    DoChanged(doRecreate);
  end
  else inherited Assign(Source);
end;

procedure TdxNavBarComponentCollection.Clear;
begin
  if FItems.Count > 0 then
  begin
    BeginUpdate;
    try
      while Count > 0 do Delete(Count - 1);
    finally
      EndUpdate;
    end;
    DoChanged(doRecreate);
  end;
end;

procedure TdxNavBarComponentCollection.Delete(Index: Integer);
var
  Item: TdxNavBarComponentCollectionItem;
begin
  Item := TdxNavBarComponentCollectionItem(FItems[Index]);
  Item.RemoveFromCollection(Self);
  Item.Free;
end;

function TdxNavBarComponentCollection.IndexOf(Item: TdxNavBarComponentCollectionItem): Integer;
begin
  Result := FItems.IndexOf(Item);
end;

function TdxNavBarComponentCollection.ItemByName(const AName: string): TdxNavBarComponentCollectionItem;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to Count - 1 do
    if Items[I].Name = AName then
    begin
      Result := Items[I];
      break;
    end;
end;

procedure TdxNavBarComponentCollection.Remove(Item: TdxNavBarComponentCollectionItem);
var
  Index: Integer;
begin
  Index := IndexOf(Item);
  if Index > -1 then Delete(Index);
end;

procedure TdxNavBarComponentCollection.BeginUpdate;
begin
  Inc(FUpdateCount);
end;

procedure TdxNavBarComponentCollection.DoChanged(AType: TdxNavBarChangeType);
begin
  if FUpdateCount = 0 then
    if Assigned(FOnChange) then FOnChange(Self, AType);
end;

procedure TdxNavBarComponentCollection.EndUpdate;
begin
  Dec(FUpdateCount);
end;

function TdxNavBarComponentCollection.GetCount: Integer;
begin
  Result := FItems.Count;
end;

function TdxNavBarComponentCollection.GetItem(Index: Integer): TdxNavBarComponentCollectionItem;
begin
  Result := FItems[Index];
end;

procedure TdxNavBarComponentCollection.InsertItem(Item: TdxNavBarComponentCollectionItem);
begin
  FItems.Add(Item);
end;

procedure TdxNavBarComponentCollection.RemoveItem(Item: TdxNavBarComponentCollectionItem);
begin
  FItems.Remove(Item);
end;

procedure TdxNavBarComponentCollection.SetItem(Index: Integer; Value: TdxNavBarComponentCollectionItem);
begin
  TdxNavBarComponentCollectionItem(FItems[Index]).Assign(Value);
end;

end.
