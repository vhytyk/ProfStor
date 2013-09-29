
{********************************************************************}
{                                                                    }
{       Developer Express Visual Component Library                   }
{       ExpressEditors                                               }
{                                                                    }
{       Copyright (c) 1998-2003 Developer Express Inc.               }
{       ALL RIGHTS RESERVED                                          }
{                                                                    }
{   The entire contents of this file is protected by U.S. and        }
{   International Copyright Laws. Unauthorized reproduction,         }
{   reverse-engineering, and distribution of all or any portion of   }
{   the code contained in this file is strictly prohibited and may   }
{   result in severe civil and criminal penalties and will be        }
{   prosecuted to the maximum extent possible under the law.         }
{                                                                    }
{   RESTRICTIONS                                                     }
{                                                                    }
{   THIS SOURCE CODE AND ALL RESULTING INTERMEDIATE FILES            }
{   (DCU, OBJ, DLL, ETC.) ARE CONFIDENTIAL AND PROPRIETARY TRADE     }
{   SECRETS OF DEVELOPER EXPRESS INC. THE REGISTERED DEVELOPER IS    }
{   LICENSED TO DISTRIBUTE THE EXPRESSEDITORS AND ALL                }
{   ACCOMPANYING VCL CONTROLS AS PART OF AN EXECUTABLE PROGRAM ONLY. }
{                                                                    }
{   THE SOURCE CODE CONTAINED WITHIN THIS FILE AND ALL RELATED       }
{   FILES OR ANY PORTION OF ITS CONTENTS SHALL AT NO TIME BE         }
{   COPIED, TRANSFERRED, SOLD, DISTRIBUTED, OR OTHERWISE MADE        }
{   AVAILABLE TO OTHER INDIVIDUALS WITHOUT EXPRESS WRITTEN CONSENT   }
{   AND PERMISSION FROM DEVELOPER EXPRESS INC.                       }
{                                                                    }
{   CONSULT THE END USER LICENSE AGREEMENT FOR INFORMATION ON        }
{   ADDITIONAL RESTRICTIONS.                                         }
{                                                                    }
{********************************************************************}

unit cxEditDBRegisteredRepositoryItems;

{$I cxEdVer.inc}

interface

uses
  SysUtils, Classes, DB, cxClasses, cxGraphics, cxDropDownEdit, cxEdit,
  cxDBEditRepository, cxEditRegisteredRepositoryItems, cxEditRepositoryItems;

type
  { TcxEditDBRegisteredRepositoryItems }

  TcxEditDBRegisteredRepositoryItems = class(TcxEditRegisteredRepositoryItems)
  private
    FLookupItems: TList;
    function GetLookupCount: Integer;
    function GetLookupRepositoryItem(Index: Integer): PcxEditRegisteredRepositoryItemsData;
  protected
    { IcxEditRepositoryItemListener }
    procedure ItemRemoved(Sender: TcxEditRepositoryItem); override;

    function Add(AList: TList; AFieldType: TFieldType; AVersion: Integer; ARepositoryItem: TcxEditRepositoryItem): Integer; reintroduce;
    procedure Clear;
    property LookupCount: Integer read GetLookupCount;
    property LookupItems[Index: Integer]: PcxEditRegisteredRepositoryItemsData read GetLookupRepositoryItem;
  public
    constructor Create(AOwner: TPersistent); override;
    destructor Destroy; override;
    function GetItem(AFieldType: TFieldType): TcxEditRepositoryItem; reintroduce;
    function GetItemByField(AField: TField): TcxEditRepositoryItem; // primary method
    function GetLookupItem: TcxEditRepositoryItem;
    procedure RegisterItem(AFieldType: TFieldType; AVersion: Integer; ARepositoryItem: TcxEditRepositoryItem); reintroduce;
    procedure RegisterLookupItem(AVersion: Integer; ARepositoryItem: TcxEditRepositoryItem);
    procedure UnregisterItem(AFieldType: TFieldType; AVersion: Integer); reintroduce;
    procedure UnregisterLookupItem(AVersion: Integer);
  end;

function GetDefaultEditDBRepositoryItems: TcxEditDBRegisteredRepositoryItems;

implementation

var
  DefaultDBEditRepositoryItems: TcxEditDBRegisteredRepositoryItems;
  DBRepositoryItemClasses: array[TFieldType] of TcxEditRepositoryItemClass = (
    nil,                                // ftUnknown
    nil,                                // ftString
    nil,                                // ftSmallint
    nil,                                // ftInteger
    nil,                                // ftWord
    TcxEditRepositoryCheckBoxItem,      // ftBoolean
    nil,                                // ftFloat
    TcxEditRepositoryCurrencyItem,      // ftCurrency
    TcxEditRepositoryCurrencyItem,      // ftBCD
    TcxEditRepositoryDateItem,          // ftDate
    TcxEditRepositoryTimeItem,          // ftTime
    TcxEditRepositoryDateItem,          // ftDateTime
    TcxEditRepositoryBlobItem,          // ftBytes
    TcxEditRepositoryBlobItem,          // ftVarBytes
    nil,                                // ftAutoInc
    TcxEditRepositoryBlobItem,          // ftBlob
    TcxEditRepositoryMemoItem,          // ftMemo
    TcxEditRepositoryImageItem,         // ftGraphic
    TcxEditRepositoryBlobItem,          // ftFmtMemo
    TcxEditRepositoryBlobItem,          // ftParadoxOle
    TcxEditRepositoryBlobItem,          // ftDBaseOle
    TcxEditRepositoryBlobItem,          // ftTypedBinary
    nil,                                // ftCursor
    nil,                                // ftFixedChar
    nil,                                // ftWideString
    nil,                                // ftLargeint
    nil,                                // ftADT
    nil,                                // ftArray
    nil,                                // ftReference
    nil                                 // ftDataSet
  {$IFDEF DELPHI5}
    , nil,                              // ftOraBlob
    nil,                                // ftOraClob
    nil,                                // ftVariant
    nil,                                // ftInterface
    nil,                                // ftIDispatch
    nil                                 // ftGuid
    {$IFDEF DELPHI6}
    , TcxEditRepositoryDateItem,        // ftTimeStamp
    TcxEditRepositoryCurrencyItem       // ftFMTBcd
    {$ENDIF}
  {$ENDIF}
    );                                          

procedure CreateDefaultRepositoryItems;
var
  I: TFieldType;
  ALookupComboBoxItem: TcxEditRepositoryLookupComboBoxItem;
begin
  // Simple
  GetDefaultEditDBRepositoryItems.RegisterDefaultItem(cxEditRegisteredItemsStandardVersion,
    GetDefaultEditRepository.CreateItem(TcxEditRepositoryMaskItem));
  // Lookup
  ALookupComboBoxItem := GetDefaultEditRepository.CreateItem(TcxEditRepositoryLookupComboBoxItem) as TcxEditRepositoryLookupComboBoxItem;
  ALookupComboBoxItem.Properties.ListOptions.GridLines := glNone;
  ALookupComboBoxItem.Properties.DropDownListStyle := lsEditFixedList;
  ALookupComboBoxItem.Properties.ListOptions.ShowHeader := False;
  GetDefaultEditDBRepositoryItems.RegisterLookupItem(cxEditRegisteredItemsStandardVersion,
    ALookupComboBoxItem);
  // Misc
  for I := Low(TFieldType) to High(TFieldType) do
    if DBRepositoryItemClasses[I] <> nil then
      GetDefaultEditDBRepositoryItems.RegisterItem(I, cxEditRegisteredItemsStandardVersion,
        GetDefaultEditRepository.CreateItem(DBRepositoryItemClasses[I]));
end;

procedure DeleteDefaultRepositoryItems;
var
  I: TFieldType;
begin
  GetDefaultEditDBRepositoryItems.UnregisterDefaultItem(cxEditRegisteredItemsStandardVersion);
//  GetDefaultEditDBRepositoryItems.UnregisterLookupItem(cxEditRegisteredItemsStandardVersion);
  for I := Low(TFieldType) to High(TFieldType) do
    if DBRepositoryItemClasses[I] <> nil then
      GetDefaultEditDBRepositoryItems.UnregisterItem(I, cxEditRegisteredItemsStandardVersion);
end;

function GetDefaultEditDBRepositoryItems: TcxEditDBRegisteredRepositoryItems;
begin
  if DefaultDBEditRepositoryItems = nil then
    DefaultDBEditRepositoryItems := TcxEditDBRegisteredRepositoryItems.Create(nil);
  Result := DefaultDBEditRepositoryItems;
end;

{ TcxEditDBRegisteredRepositoryItems }

constructor TcxEditDBRegisteredRepositoryItems.Create(AOwner: TPersistent);
begin
  inherited Create(AOwner);
  FLookupItems := TList.Create;
end;

destructor TcxEditDBRegisteredRepositoryItems.Destroy;
begin
  Clear;
  FLookupItems.Free;
  inherited Destroy;
end;

function TcxEditDBRegisteredRepositoryItems.GetItem(AFieldType: TFieldType): TcxEditRepositoryItem;
begin
  Result := inherited GetItem(Integer(AFieldType));
end;

function TcxEditDBRegisteredRepositoryItems.GetItemByField(AField: TField): TcxEditRepositoryItem;
begin
  if Assigned(AField) then
  begin
    if AField.Lookup then
      Result := GetLookupItem
    else
    begin
      {$IFDEF DELPHI6}
      if (AField is TFMTBCDField) and not TFMTBCDField(AField).currency then // WORKAROUND
        Result := GetItem(ftFloat)
      else
      {$ENDIF}
        Result := GetItem(AField.DataType);
    end;
  end
  else
    Result := GetDefaultItem;
end;

function TcxEditDBRegisteredRepositoryItems.GetLookupItem: TcxEditRepositoryItem;
begin
  if FLookupItems.Count > 0 then
    Result := LookupItems[0]^.RepositoryItem
  else
    Result := GetDefaultItem;
end;

procedure TcxEditDBRegisteredRepositoryItems.RegisterItem(AFieldType: TFieldType;
  AVersion: Integer; ARepositoryItem: TcxEditRepositoryItem);
begin
  inherited RegisterItem(Integer(AFieldType), AVersion, ARepositoryItem);
end;

procedure TcxEditDBRegisteredRepositoryItems.RegisterLookupItem(AVersion: Integer;
  ARepositoryItem: TcxEditRepositoryItem);
begin
  Add(FLookupItems, ftUnknown, AVersion, ARepositoryItem);
end;

procedure TcxEditDBRegisteredRepositoryItems.UnregisterItem(AFieldType: TFieldType;
  AVersion: Integer);
begin
  inherited UnregisterItem(Integer(AFieldType), AVersion);
end;

procedure TcxEditDBRegisteredRepositoryItems.UnregisterLookupItem(AVersion: Integer);
var
  AIndex: Integer;
begin
  if Find(FLookupItems, Integer(ftUnknown), AVersion, AIndex) then
    Delete(FLookupItems, AIndex);
end;

procedure TcxEditDBRegisteredRepositoryItems.ItemRemoved(Sender: TcxEditRepositoryItem);
var
  I: Integer;
begin
  inherited ItemRemoved(Sender);
  for I := LookupCount - 1 downto 0 do
    if LookupItems[I]^.RepositoryItem = Sender then
      Delete(FLookupItems, I);
end;

function TcxEditDBRegisteredRepositoryItems.Add(AList: TList; AFieldType: TFieldType;
  AVersion: Integer; ARepositoryItem: TcxEditRepositoryItem): Integer;
begin
  Result := inherited Add(AList, Integer(AFieldType), AVersion, ARepositoryItem);
end;

procedure TcxEditDBRegisteredRepositoryItems.Clear;
begin
  inherited Clear;
  while FLookupItems.Count > 0 do
    Delete(FLookupItems, FLookupItems.Count - 1);
end;

function TcxEditDBRegisteredRepositoryItems.GetLookupCount: Integer;
begin
  Result := FLookupItems.Count;
end;
function TcxEditDBRegisteredRepositoryItems.GetLookupRepositoryItem(Index: Integer): PcxEditRegisteredRepositoryItemsData;
begin
  Result := FLookupItems[Index];
end;

initialization
  CreateDefaultRepositoryItems;
  
finalization
  DeleteDefaultRepositoryItems;
  FreeAndNil(DefaultDBEditRepositoryItems);

end.
