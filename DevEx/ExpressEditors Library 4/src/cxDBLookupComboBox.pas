
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

unit cxDBLookupComboBox;

{$I cxEdVer.inc}

interface

uses
{$IFDEF WIN32}
  Windows,
{$ENDIF}
{$IFNDEF VCL}
  Qt, Types, QTypes,
{$ENDIF}
{$IFDEF DELPHI6}
  Variants,
{$ENDIF}
{$IFDEF VCL}
  Messages,
{$ENDIF}
  SysUtils, Classes, Controls, Graphics, DB,
  cxClasses, cxContainer, cxLookAndFeels, cxEdit, cxDBEdit, cxEditConsts,
  cxDB, cxCustomData, cxDBData,
  cxLookupEdit, cxDBLookupEdit, cxLookupGrid, cxLookupDBGrid;

type
  { TcxLookupComboBoxProperties }

  TcxLookupComboBoxProperties = class(TcxCustomDBLookupEditProperties)
  private
    FGrid: TcxLookupDBGrid;
    function GetGrid: TcxLookupDBGrid;
    function GetGridMode: Boolean;
    function GetListColumns: TcxLookupDBGridColumns;
    function GetListOptions: TcxLookupGridOptions;
    function GetListSource: TDataSource;
    function GetOnSortingChanged: TNotifyEvent;
    procedure SetGridMode(Value: Boolean);
    procedure SetListColumns(Value: TcxLookupDBGridColumns);
    procedure SetListOptions(Value: TcxLookupGridOptions);
    procedure SetListSource(Value: TDataSource);
    procedure SetOnSortingChanged(Value: TNotifyEvent);
  protected
    procedure ListOptionsChanged(Sender: TObject); virtual;
    // LookupGrid methods
    function GetLookupGridColumnCount: Integer; override;
    function GetLookupGridControl: TWinControl; override;
    function GetLookupGridDataController: TcxCustomDataController; override;
    function GetLookupGridVisualAreaPreferredWidth: Integer; override;
    function GetLookupGridNearestPopupHeight(AHeight: Integer): Integer; override;
    function GetLookupGridPopupHeight(ADropDownRowCount: Integer): Integer; override;
    function IsLookupGridMouseOverList(const P: TPoint): Boolean; override;
    procedure LookupGridInitEvents(AOnClick, AOnFocusedRowChanged: TNotifyEvent;
      AOnCloseUp: {$IFDEF VCL}cxLookupEdit{$ELSE}QcxLookupEdit{$ENDIF}.TcxLookupGridCloseUpEvent); override;
    procedure LookupGridInitLookAndFeel(ALookAndFeel: TcxLookAndFeel; AColor: TColor; AFont: TFont); override;
    procedure LookupGridLockMouseMove; override;
    procedure LookupGridMakeFocusedRowVisible; override;
    procedure LookupGridUnlockMouseMove; override;
    // DBLookupGrid methods
    procedure DBLookupGridBeginUpdate; override;
    procedure DBLookupGridCheckColumnByFieldName(const AFieldName: string); override;
    procedure DBLookupGridCreateColumnsByFieldNames(const AFieldNames: string); override;
    procedure DBLookupGridEndUpdate; override;
    function GetDBLookupGridColumnField(AIndex: Integer): TField; override;
    function GetDBLookupGridColumnFieldName(AIndex: Integer): string; override;
    function GetDBLookupGridColumnIndexByFieldName(const AFieldName: string): Integer; override;
    function GetDBLookupGridDataController: TcxDBDataController; override;
  public
    constructor Create(AOwner: TPersistent); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    class function GetContainerClass: TcxContainerClass; override;
    property Grid: TcxLookupDBGrid read GetGrid;
  published
    property Alignment;
    property AutoSelect;
    property ButtonGlyph;
    property CharCase;
    property ClearKey;
    property DropDownAutoSize;
    property DropDownHeight;
    property DropDownListStyle;
    property DropDownRows;
    property DropDownSizeable;
    property DropDownWidth;
    property GridMode: Boolean read GetGridMode write SetGridMode default False;  
    property HideSelection;
    property ImmediateDropDown;
    property ImmediatePost;
    property IncrementalFiltering;
    property KeyFieldNames;
    property ListColumns: TcxLookupDBGridColumns read GetListColumns write SetListColumns;
    property ListFieldNames;
    property ListFieldIndex;
    property ListOptions: TcxLookupGridOptions read GetListOptions write SetListOptions;
    property ListSource: TDataSource read GetListSource write SetListSource;
    property MaxLength;
    {$IFDEF VCL}
    property OEMConvert;
    {$ENDIF}
    property PopupAlignment;
    property ReadOnly;
    property Revertable;
    property UseLeftAlignmentOnEditing;
    property OnChange;
    property OnCloseUp;
    property OnEditValueChanged;
    property OnInitPopup;
    property OnNewLookupDisplayText;
    property OnPopup;
    property OnSortingChanged: TNotifyEvent read GetOnSortingChanged write SetOnSortingChanged;
    property OnValidate;
  end;

  { TcxCustomLookupComboBox }

  TcxCustomLookupComboBox = class(TcxCustomDBLookupEdit)
  private
    function GetProperties: TcxLookupComboBoxProperties;
    procedure SetProperties(Value: TcxLookupComboBoxProperties);
  public
    class function GetPropertiesClass: TcxCustomEditPropertiesClass; override;
    property Properties: TcxLookupComboBoxProperties read GetProperties write SetProperties;
    property EditValue;
    property Text;
  end;

  { TcxLookupComboBox }

  TcxLookupComboBox = class(TcxCustomLookupComboBox)
  published
    property Anchors;
    property AutoSize;
    property BeepOnEnter;
    property Constraints;
    {$IFDEF VCL}
    property DragCursor;
    property DragKind;
    {$ENDIF}
    property DragMode;
    property Enabled;
    {$IFDEF VCL}
    property ImeMode;
    property ImeName;
    {$ENDIF}
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property Properties;
    property EditValue;
    property ShowHint;
    property Style;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnClick;
    property OnDblClick;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
  end;

  { TcxDBLookupComboBox }

  TcxDBLookupComboBox = class(TcxCustomLookupComboBox)
  private
    function GetDataBinding: TcxDBEditDataBinding;
    procedure SetDataBinding(Value: TcxDBEditDataBinding);
    {$IFDEF VCL}
    procedure CMGetDataLink(var Message: TMessage); message CM_GETDATALINK;
    {$ENDIF}
  protected
    class function GetDataBindingClass: TcxEditDataBindingClass; override;
  published
    property Anchors;
    property AutoSize;
    property BeepOnEnter;
    property Constraints;
    {$IFDEF VCL}
    property DragCursor;
    property DragKind;
    {$ENDIF}
    property DataBinding: TcxDBEditDataBinding read GetDataBinding write SetDataBinding;
    property DragMode;
    property Enabled;
    {$IFDEF VCL}
    property ImeMode;
    property ImeName;
    {$ENDIF}
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property Properties;
    property ShowHint;
    property Style;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnClick;
    property OnDblClick;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
  end;

implementation

uses
  DBConsts
{$IFDEF DELPHI6}
  {$IFDEF WIN32}
  , VDBConsts
  {$ENDIF}
{$ENDIF}
  ;

type
  TcxCustomLookupGridAccess = class(TcxCustomLookupGrid);

{ TcxLookupComboBoxProperties }

constructor TcxLookupComboBoxProperties.Create(AOwner: TPersistent);
begin
  inherited Create(AOwner);
  FGrid := TcxLookupDBGrid.Create(nil);
  FGrid.IsPopupControl := True;
  FGrid.Options.OnChanged := ListOptionsChanged; 
  InitializeDataController;
end;

destructor TcxLookupComboBoxProperties.Destroy;
begin
  DeinitializeDataController;
  FGrid.Free;
  FGrid := nil;
  inherited Destroy;
end;

procedure TcxLookupComboBoxProperties.Assign(Source: TPersistent);
begin
  if Source is TcxLookupComboBoxProperties then
  begin
    BeginUpdate;
    try
      GridMode := TcxLookupComboBoxProperties(Source).GridMode;
      ListOptions := TcxLookupComboBoxProperties(Source).ListOptions;
      if not IsDefinedByLookup then
      begin
        ListSource := TcxLookupComboBoxProperties(Source).ListSource;
        ListColumns := TcxLookupComboBoxProperties(Source).ListColumns;
      end;
      OnSortingChanged := TcxLookupComboBoxProperties(Source).OnSortingChanged;
      inherited Assign(Source);
    finally
      EndUpdate;
    end
  end
  else
    inherited Assign(Source);
end;

class function TcxLookupComboBoxProperties.GetContainerClass: TcxContainerClass;
begin
  Result := TcxLookupComboBox;
end;

procedure TcxLookupComboBoxProperties.ListOptionsChanged(Sender: TObject);
begin
  Changed;
end;

// LookupGrid

function TcxLookupComboBoxProperties.GetLookupGridColumnCount: Integer;
begin
  Result := ListColumns.Count;
end;

function TcxLookupComboBoxProperties.GetLookupGridControl: TWinControl;
begin
  Result := Grid;
end;

function TcxLookupComboBoxProperties.GetLookupGridDataController: TcxCustomDataController;
begin
  Result := Grid.DataController;
end;

function TcxLookupComboBoxProperties.GetLookupGridVisualAreaPreferredWidth: Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to ListColumns.Count - 1 do
    Inc(Result, ListColumns[I].Width);
end;

function TcxLookupComboBoxProperties.GetLookupGridNearestPopupHeight(AHeight: Integer): Integer;
begin
  Result := Grid.GetNearestPopupHeight(AHeight);
end;

function TcxLookupComboBoxProperties.GetLookupGridPopupHeight(ADropDownRowCount: Integer): Integer;
begin
  Result := Grid.GetPopupHeight(ADropDownRowCount);
end;

function TcxLookupComboBoxProperties.IsLookupGridMouseOverList(const P: TPoint): Boolean;
begin
  Result := Grid.IsMouseOverList(P);
end;

procedure TcxLookupComboBoxProperties.LookupGridInitEvents(AOnClick, AOnFocusedRowChanged: TNotifyEvent;
  AOnCloseUp: {$IFDEF VCL}cxLookupEdit{$ELSE}QcxLookupEdit{$ENDIF}.TcxLookupGridCloseUpEvent);
begin
  Grid.OnClick := AOnClick;
  Grid.OnFocusedRowChanged := AOnFocusedRowChanged;
  Grid.OnCloseUp := AOnCloseUp;
end;

procedure TcxLookupComboBoxProperties.LookupGridInitLookAndFeel(ALookAndFeel: TcxLookAndFeel;
  AColor: TColor; AFont: TFont);
begin
  Grid.LookAndFeel.MasterLookAndFeel := ALookAndFeel;
  Grid.Color := AColor;
  Grid.Font := AFont;
end;

procedure TcxLookupComboBoxProperties.LookupGridLockMouseMove;
begin
  Grid.PopupMouseMoveLocked := True;
end;

procedure TcxLookupComboBoxProperties.LookupGridMakeFocusedRowVisible;
begin
  Grid.MakeFocusedRowVisible;
end;

procedure TcxLookupComboBoxProperties.LookupGridUnlockMouseMove;
begin
  TcxCustomLookupGridAccess(Grid).MouseCapture := False;
  Grid.PopupMouseMoveLocked := False;
end;

// DBLookupGrid

procedure TcxLookupComboBoxProperties.DBLookupGridBeginUpdate;
begin
  Grid.BeginUpdate;
end;

procedure TcxLookupComboBoxProperties.DBLookupGridCheckColumnByFieldName(const AFieldName: string);
begin
  if (AFieldName <> '') and (ListColumns.ColumnByFieldName(AFieldName) = nil) then
    with ListColumns.Add do
    begin
      FieldName := AFieldName;
      Index := 0;
    end;
end;

procedure TcxLookupComboBoxProperties.DBLookupGridCreateColumnsByFieldNames(const AFieldNames: string);
begin
  Grid.CreateColumnsByFieldNames(AFieldNames);
end;

procedure TcxLookupComboBoxProperties.DBLookupGridEndUpdate;
begin
  Grid.EndUpdate;
end;

function TcxLookupComboBoxProperties.GetDBLookupGridColumnField(AIndex: Integer): TField;
begin
  Result := ListColumns[AIndex].Field;
end;

function TcxLookupComboBoxProperties.GetDBLookupGridColumnFieldName(AIndex: Integer): string;
begin
  Result := ListColumns[AIndex].FieldName;
end;

function TcxLookupComboBoxProperties.GetDBLookupGridColumnIndexByFieldName(const AFieldName: string): Integer;
var
  AColumn: TcxLookupDBGridColumn;
begin
  AColumn := ListColumns.ColumnByFieldName(AFieldName);
  if AColumn <> nil then
    Result := AColumn.Index
  else
    Result := -1;
end;

function TcxLookupComboBoxProperties.GetDBLookupGridDataController: TcxDBDataController;
begin
  if Grid <> nil then
    Result := Grid.DataController
  else
    Result := nil;
end;

function TcxLookupComboBoxProperties.GetGrid: TcxLookupDBGrid;
begin
  Result := FGrid;
end;

function TcxLookupComboBoxProperties.GetGridMode: Boolean;
begin
  Result := inherited IsUseLookupList;
end;

function TcxLookupComboBoxProperties.GetListColumns: TcxLookupDBGridColumns;
begin
  Result := Grid.Columns;
end;

function TcxLookupComboBoxProperties.GetListOptions: TcxLookupGridOptions;
begin
  Result := Grid.Options;
end;

function TcxLookupComboBoxProperties.GetListSource: TDataSource;
begin
  if IsDefinedByLookup then
    Result := nil
  else
    Result := Grid.DataSource;
end;

function TcxLookupComboBoxProperties.GetOnSortingChanged: TNotifyEvent;
begin
  Result := Grid.DataController.OnSortingChanged;
end;

procedure TcxLookupComboBoxProperties.SetGridMode(Value: Boolean);
begin
  inherited IsUseLookupList := Value;
end;

procedure TcxLookupComboBoxProperties.SetListColumns(Value: TcxLookupDBGridColumns);
begin
  Grid.Columns := Value; // TODO: recreate?
  CheckLookupColumn;
  CheckDisplayColumnIndex;
end;

procedure TcxLookupComboBoxProperties.SetListOptions(Value: TcxLookupGridOptions);
begin
  Grid.Options := Value;
end;

procedure TcxLookupComboBoxProperties.SetListSource(Value: TDataSource);

  procedure CheckListSource(ADataSource: TDataSource);
  var
    AField: TField;
  begin
    AField := GetDataField;
    if Assigned(AField) and Assigned(ADataSource) and
//      AField.DataSet.IsLinkedTo(ADataSource) then
      IsLinkedToDataSet(ADataSource, AField.DataSet) then
      DatabaseError(SCircularDataLink);
  end;

begin
  if IsDefinedByLookup and not InSyncLookup then
    DefineByLookupError;
  if Value <> nil then
    CheckListSource(Value);
  Grid.DataSource := Value;
  Changed;
end;

procedure TcxLookupComboBoxProperties.SetOnSortingChanged(Value: TNotifyEvent);
begin
  Grid.DataController.OnSortingChanged := Value;
end;

{ TcxCustomLookupComboBox }

class function TcxCustomLookupComboBox.GetPropertiesClass: TcxCustomEditPropertiesClass;
begin
  Result := TcxLookupComboBoxProperties;
end;

function TcxCustomLookupComboBox.GetProperties: TcxLookupComboBoxProperties;
begin
  Result := TcxLookupComboBoxProperties(InternalGetProperties);
end;

procedure TcxCustomLookupComboBox.SetProperties(Value: TcxLookupComboBoxProperties);
begin
  InternalGetProperties.Assign(Value);
end;

{ TcxDBLookupComboBox }

class function TcxDBLookupComboBox.GetDataBindingClass: TcxEditDataBindingClass;
begin
  Result := TcxDBEditDataBinding;
end;

function TcxDBLookupComboBox.GetDataBinding: TcxDBEditDataBinding;
begin
  Result := FDataBinding as TcxDBEditDataBinding;
end;

procedure TcxDBLookupComboBox.SetDataBinding(Value: TcxDBEditDataBinding);
begin
  FDataBinding.Assign(Value);
end;

{$IFDEF VCL}
procedure TcxDBLookupComboBox.CMGetDataLink(var Message: TMessage);
begin
  if not IsInplace then
    Message.Result := Integer(TcxDBEditDataBinding(DataBinding).DataLink);
end;
{$ENDIF}

initialization
  GetRegisteredEditProperties.Register(TcxLookupComboBoxProperties, scxSEditRepositoryLookupComboBoxItem);

end.
