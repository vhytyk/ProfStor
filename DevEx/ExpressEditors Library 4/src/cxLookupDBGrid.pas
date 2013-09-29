
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

unit cxLookupDBGrid;

{$I cxEdVer.inc}

interface

uses
  {$IFDEF VCL}
  Windows,
  {$ELSE}
  Types,
  {$ENDIF}
  SysUtils, Classes, Controls, Graphics, Forms, StdCtrls, DB,
  cxClasses, cxControls, cxGraphics, cxLookAndFeelPainters,
  cxEdit, cxDBEdit, cxCustomData, cxDB, cxDBData, cxEditRepositoryItems,
  cxLookupGrid;

type
  TcxCustomLookupDBGrid = class;

  { TcxLookupGridDBDataController }

  TcxLookupGridDBDataController = class(TcxDBDataController)
  private
    function GetGrid: TcxCustomLookupDBGrid;
  protected
    procedure UpdateScrollBars; override;
  public
    constructor Create(AOwner: TComponent); override;
    function GetItem(Index: Integer): TObject; override;
    property Grid: TcxCustomLookupDBGrid read GetGrid;
  published
    property OnCompare;
  end;

  { TcxLookupDBGridColumn }

  TcxLookupDBGridDefaultValuesProvider = class(TcxCustomDBEditDefaultValuesProvider)
    function IsDisplayFormatDefined(AIsCurrencyValueAccepted: Boolean): Boolean; override;
  end;

  TcxLookupDBGridColumn = class(TcxLookupGridColumn)
  private
    function GetDataController: TcxLookupGridDBDataController;
    function GetField: TField;
    function GetFieldName: string;
    procedure SetFieldName(const Value: string);
  protected
    function GetDefaultValuesProviderClass: TcxCustomEditDefaultValuesProviderClass; override;
    procedure InitDefaultValuesProvider;
    property DataController: TcxLookupGridDBDataController read GetDataController;
  public
    procedure Assign(Source: TPersistent); override;
    function DefaultCaption: string; override;
    function DefaultRepositoryItem: TcxEditRepositoryItem; override;
    function DefaultWidth: Integer; override;
    property Field: TField read GetField;
  published
    property FieldName: string read GetFieldName write SetFieldName;
  end;

  { TcxLookupDBGridColumns }

  TcxLookupDBGridColumns = class(TcxLookupGridColumns)
  private
    function GetColumn(Index: Integer): TcxLookupDBGridColumn;
    procedure SetColumn(Index: Integer; Value: TcxLookupDBGridColumn);
  public
    function Add: TcxLookupDBGridColumn;
    function ColumnByFieldName(const AFieldName: string): TcxLookupDBGridColumn;
    property Items[Index: Integer]: TcxLookupDBGridColumn read GetColumn write SetColumn; default;
  end;

  { TcxCustomLookupDBGrid }

  TcxCustomLookupDBGrid = class(TcxCustomLookupGrid)
  private
    function GetColumns: TcxLookupDBGridColumns;
    function GetDataController: TcxLookupGridDBDataController;
    function GetDataSource: TDataSource;
    function GetKeyFieldNames: string;
    procedure SetColumns(Value: TcxLookupDBGridColumns);
    procedure SetDataController(Value: TcxLookupGridDBDataController);
    procedure SetDataSource(Value: TDataSource);
    procedure SetKeyFieldNames(const Value: string);
  protected
    procedure CreateColumnsByFields(AFieldNames: TStrings); virtual;
    procedure DataChanged; override;
    function GetColumnClass: TcxLookupGridColumnClass; override;
    function GetColumnsClass: TcxLookupGridColumnsClass; override;
    function GetDataControllerClass: TcxCustomDataControllerClass; override;
    procedure InitScrollBarsParameters; override;
    procedure Scroll(AScrollBarKind: TScrollBarKind; AScrollCode: TScrollCode; var AScrollPos: Integer); override;
  public
    procedure CreateAllColumns;
    procedure CreateColumnsByFieldNames(const AFieldNames: string);
    property Columns: TcxLookupDBGridColumns read GetColumns write SetColumns;
    property DataController: TcxLookupGridDBDataController read GetDataController write SetDataController;
  published  
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property KeyFieldNames: string read GetKeyFieldNames write SetKeyFieldNames;
  end;

  { TcxLookupDBGrid }

  TcxLookupDBGrid = class(TcxCustomLookupDBGrid)
  published
    property Align;
    property Anchors;
    property Color;
    property Font;
    property ParentFont;
    property Visible;

    property Columns;
    property Options;
    property LookAndFeel;
  end;

implementation

uses
  cxEditDBRegisteredRepositoryItems;

function TcxLookupDBGridDefaultValuesProvider.IsDisplayFormatDefined(AIsCurrencyValueAccepted: Boolean): Boolean;
begin
  with TcxLookupDBGridColumn(Owner) do
    Result := DataController.GetItemTextStored(Index);
end;

{ TcxLookupDBGridColumn }

procedure TcxLookupDBGridColumn.Assign(Source: TPersistent);
begin
  if Source is TcxLookupDBGridColumn then
    FieldName := TcxLookupDBGridColumn(Source).FieldName;
  inherited Assign(Source);
end;

function TcxLookupDBGridColumn.DefaultCaption: string;
var
  AField: TField;
begin
  AField := Field;
  if AField = nil then
    Result := FieldName
  else
    Result := AField.DisplayName;
end;

function TcxLookupDBGridColumn.DefaultRepositoryItem: TcxEditRepositoryItem;
begin
  Result := GetDefaultEditDBRepositoryItems.GetItemByField(Field);
end;

function TcxLookupDBGridColumn.DefaultWidth: Integer;
var
  AField: TField;
  ACanvas: TcxCanvas;
  W: Integer;
begin
  AField := Field;
  if AField = nil then
    Result := inherited DefaultWidth
  else
  begin
    ACanvas := Grid.ViewInfo.Canvas;
    ACanvas.Font := GetContentFont; 
    Result := AField.DisplayWidth * ACanvas.TextWidth('0') + 4;
    if Grid.Options.ShowHeader then
    begin
      W := Grid.Painter.LFPainterClass.HeaderWidth(ACanvas, cxBordersAll, Caption,
        Grid.ViewInfo.GetHeaderFont);
      if W > Result then Result := W;
    end;
  end;
  CheckWidthValue(Result);
end;

function TcxLookupDBGridColumn.GetDefaultValuesProviderClass: TcxCustomEditDefaultValuesProviderClass;
begin
  Result := TcxLookupDBGridDefaultValuesProvider;
end;

procedure TcxLookupDBGridColumn.InitDefaultValuesProvider;
begin
  TcxCustomDBEditDefaultValuesProvider(DefaultValuesProvider.GetInstance).Field := Field;
end;

function TcxLookupDBGridColumn.GetDataController: TcxLookupGridDBDataController;
begin
  Result := TcxLookupGridDBDataController(inherited DataController);
end;

function TcxLookupDBGridColumn.GetField: TField;
begin
  Result := DataController.GetItemField(Index);
end;

function TcxLookupDBGridColumn.GetFieldName: string;
begin
  Result := DataController.GetItemFieldName(Index);
end;

procedure TcxLookupDBGridColumn.SetFieldName(const Value: string);
begin
  DataController.ChangeFieldName(Index, Value);
end;

{ TcxLookupDBGridColumns }

function TcxLookupDBGridColumns.Add: TcxLookupDBGridColumn;
begin
  Result := inherited Add as TcxLookupDBGridColumn;
end;

function TcxLookupDBGridColumns.ColumnByFieldName(const AFieldName: string): TcxLookupDBGridColumn;
var
  I: Integer;
begin
  for I := 0 to Count - 1 do
  begin
    Result := Items[I];
    if AnsiCompareText(Result.FieldName, AFieldName) = 0 then Exit;
  end;
  Result := nil;
end;

function TcxLookupDBGridColumns.GetColumn(Index: Integer): TcxLookupDBGridColumn;
begin
  Result := inherited Items[Index] as TcxLookupDBGridColumn;
end;

procedure TcxLookupDBGridColumns.SetColumn(Index: Integer; Value: TcxLookupDBGridColumn);
begin
  inherited Items[Index] := Value;
end;

{ TcxLookupGridDBDataController }

constructor TcxLookupGridDBDataController.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  DataModeController.SyncMode := False;
  DataModeController.SyncInsert := False;
end;

function TcxLookupGridDBDataController.GetItem(Index: Integer): TObject;
begin
  Result := Grid.Columns[Index];
end;

procedure TcxLookupGridDBDataController.UpdateScrollBars;
begin
  Grid.UpdateScrollBars;
end;

function TcxLookupGridDBDataController.GetGrid: TcxCustomLookupDBGrid;
begin
  Result := GetOwner as TcxCustomLookupDBGrid;
end;

{ TcxCustomLookupDBGrid }

procedure TcxCustomLookupDBGrid.CreateAllColumns;
var
  ADataSet: TDataSet;
  AFieldNames: TStrings;
begin
  Columns.Clear;
  ADataSet := DataController.DataSet;
  if ADataSet <> nil then
  begin
    AFieldNames := TStringList.Create;
    try
      ADataSet.GetFieldNames(AFieldNames);
      CreateColumnsByFields(AFieldNames);
    finally
      AFieldNames.Free;
    end;
  end;
end;

procedure TcxCustomLookupDBGrid.CreateColumnsByFieldNames(const AFieldNames: string);
var
  AFieldNamesList: TStrings;
begin
  Columns.Clear;
  AFieldNamesList := TStringList.Create;
  try
    GetFieldNames(AFieldNames, AFieldNamesList);
    CreateColumnsByFields(AFieldNamesList);
  finally
    AFieldNamesList.Free;
  end;
end;

procedure TcxCustomLookupDBGrid.CreateColumnsByFields(AFieldNames: TStrings);
var
  I: Integer;
begin
  BeginUpdate;
  try
    for I := 0 to AFieldNames.Count - 1 do
      Columns.Add.FieldName := AFieldNames[I];
  finally
    EndUpdate;
  end;
end;

procedure TcxCustomLookupDBGrid.DataChanged;
var
  I: Integer;
begin
  for I := 0 to Columns.Count - 1 do
    Columns[I].InitDefaultValuesProvider;
  inherited DataChanged;
end;

function TcxCustomLookupDBGrid.GetColumnClass: TcxLookupGridColumnClass;
begin
  Result := TcxLookupDBGridColumn;
end;

function TcxCustomLookupDBGrid.GetColumnsClass: TcxLookupGridColumnsClass;
begin
  Result := TcxLookupDBGridColumns;
end;

function TcxCustomLookupDBGrid.GetDataControllerClass: TcxCustomDataControllerClass;
begin
  Result := TcxLookupGridDBDataController;
end;

procedure TcxCustomLookupDBGrid.InitScrollBarsParameters;
begin
  if DataController.IsGridMode and DataController.IsSequenced then
  begin
    SetScrollBarInfo(sbVertical, 0,
      (DataController.DataSetRecordCount - 1) + (ViewInfo.VisibleRowCount - 1),
      1, ViewInfo.VisibleRowCount, DataController.RecNo - 1, True, True);
  end
  else
    inherited InitScrollBarsParameters;
end;

procedure TcxCustomLookupDBGrid.Scroll(AScrollBarKind: TScrollBarKind;
  AScrollCode: TScrollCode; var AScrollPos: Integer);
begin
  if DataController.IsGridMode and DataController.IsSequenced then
  begin
    if AScrollBarKind = sbVertical then
    begin
      case AScrollCode of
        scLineUp:
          FocusNextRow(False);
        scLineDown:
          FocusNextRow(True);
        scPageUp:
          FocusPriorPage;
        scPageDown:
          FocusNextPage;
        scTrack: ;
        scPosition:
          DataController.RecNo := AScrollPos + 1;
      end;
    end
    else
      inherited Scroll(AScrollBarKind, AScrollCode, AScrollPos);
    AScrollPos := DataController.RecNo - 1;
  end
  else
    inherited Scroll(AScrollBarKind, AScrollCode, AScrollPos);
end;

function TcxCustomLookupDBGrid.GetColumns: TcxLookupDBGridColumns;
begin
  Result := inherited Columns as TcxLookupDBGridColumns;
end;

function TcxCustomLookupDBGrid.GetDataController: TcxLookupGridDBDataController;
begin
  Result := TcxLookupGridDBDataController(FDataController);
end;

function TcxCustomLookupDBGrid.GetDataSource: TDataSource;
begin
  Result := DataController.DataSource;
end;

function TcxCustomLookupDBGrid.GetKeyFieldNames: string;
begin
  Result := DataController.KeyFieldNames;
end;

procedure TcxCustomLookupDBGrid.SetColumns(Value: TcxLookupDBGridColumns);
begin
  inherited Columns := Value;
end;

procedure TcxCustomLookupDBGrid.SetDataController(Value: TcxLookupGridDBDataController);
begin
  FDataController.Assign(Value);
end;

procedure TcxCustomLookupDBGrid.SetDataSource(Value: TDataSource);
begin
  DataController.DataSource := Value;
end;

procedure TcxCustomLookupDBGrid.SetKeyFieldNames(const Value: string);
begin
  DataController.KeyFieldNames := Value; 
end;

end.
