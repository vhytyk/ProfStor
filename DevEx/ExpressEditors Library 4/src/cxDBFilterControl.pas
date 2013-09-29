{********************************************************************}
{                                                                    }
{       Developer Express Visual Component Library                   }
{       ExpressFilterControl                                         }
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
unit cxDBFilterControl;

{$I cxFilterControlVer.inc}

interface

uses
  Classes, Graphics, cxEdit, cxFilter, cxDataStorage, cxLookAndFeels,
  cxFilterControl, cxFilterControlUtils, DB;

type
  TcxDBFilterControl = class;

  { TcxFilterItem }

  TcxFilterItem = class(TCollectionItem, IUnknown, IcxEditRepositoryItemListener)
  private
    FOwnerInterface: IUnknown;
    FFilterControl: TcxDBFilterControl;
    FCaption: string;
    FFieldName: string;
    FProperties: TcxCustomEditProperties;
    FRepositoryItem: TcxEditRepositoryItem;
    FPropertiesClass: TcxCustomEditPropertiesClass;
    procedure DoPropertiesChanged(Sender: TObject);
    function GetPropertiesClassName: string;
    function IsCaptionStored: Boolean;
    procedure RecreateProperties;
    procedure SetCaption(const Value: string);
    procedure SetFieldName(const Value: string);
    procedure SetProperties(const Value: TcxCustomEditProperties);
    procedure SetPropertiesClass(const Value: TcxCustomEditPropertiesClass);
    procedure SetPropertiesClassName(const Value: string);
    procedure SetRepositoryItem(const Value: TcxEditRepositoryItem);
  protected
    // IUnknown
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
    function QueryInterface(const IID: TGUID; out Obj): HResult; virtual; stdcall;
    // IcxEditRepositoryItemListener
    procedure ItemRemoved(Sender: TcxEditRepositoryItem);
    procedure PropertiesChanged(Sender: TcxEditRepositoryItem);
    // overrided methods
    function GetDisplayName: string; override;
    procedure CreateProperties; virtual;
    procedure DestroyProperties; virtual;
    property FilterControl: TcxDBFilterControl read FFilterControl;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    procedure AfterConstruction; override;
    function GetProperties: TcxCustomEditProperties;
    property PropertiesClass: TcxCustomEditPropertiesClass read FPropertiesClass write SetPropertiesClass;
  published
    property Caption: string read FCaption write SetCaption stored IsCaptionStored;
    property FieldName: string read FFieldName write SetFieldName;
    property PropertiesClassName: string read GetPropertiesClassName write SetPropertiesClassName;
    property Properties: TcxCustomEditProperties read FProperties write SetProperties;
    property RepositoryItem: TcxEditRepositoryItem read FRepositoryItem write SetRepositoryItem;
  end;

  { TcxFilterPropertiesList }

  TcxFilterPropertiesList = class(TList)
  public
    procedure Clear; override;
    function GetProperties(AClass: TcxCustomEditPropertiesClass): TcxCustomEditProperties;
  end;

  { TcxFilterItemCollection }

  TcxFilterItemCollection = class(TOwnedCollection)
  private
    function GetControl: TcxDBFilterControl;
    function GetItems(Index: Integer): TcxFilterItem;
    procedure SetItems(Index: Integer; const Value: TcxFilterItem);
  protected
    procedure Update(Item: TCollectionItem); override;
  public
    property Control: TcxDBFilterControl read GetControl;
    property Items[Index: Integer]: TcxFilterItem read GetItems write SetItems; default;
  end;

  { TcxDBFilterOptions }

  TcxDBFilterOptions = class(TPersistent)
  private
    FFilterControl: TcxDBFilterControl;
    FSupportedBetween: Boolean;
    FSupportedIn: Boolean;
    FSupportedLike: Boolean;
    function GetDateTimeFormat: string;
    function GetPercentWildcard: Char;
    function GetSoftNull: Boolean;
    function GetUnderscoreWildcard: Char;
    procedure SetDateTimeFormat(const Value: string);
    procedure SetPercentWildcard(Value: Char);
    procedure SetSoftNull(Value: Boolean);
    procedure SetUnderscoreWildcard(Value: Char);
  public
    constructor Create(AFilterControl: TcxDBFilterControl);
    procedure ProcessFilterOperators(var SupportedOperations: TcxFilterControlOperators);
  published
    property DateTimeFormat: string read GetDateTimeFormat write SetDateTimeFormat;
    property PercentWildcard: Char read GetPercentWildcard write SetPercentWildcard default '%';
    property SoftNull: Boolean read GetSoftNull write SetSoftNull default False;
    property SupportedBetween: Boolean read FSupportedBetween write FSupportedBetween default True;
    property SupportedIn: Boolean read FSupportedIn write FSupportedIn default True;
    property SupportedLike: Boolean read FSupportedLike write FSupportedLike default True;
    property UnderscoreWildcard: Char read GetUnderscoreWildcard write SetUnderscoreWildcard default '_';
  end;

  { TcxDBFilterControl }

  TcxDBFilterControl = class(TcxCustomFilterControl, IcxFilterControl,
    IcxFilterControlDialog)
  private
    FApplyingFilter: Boolean;
    FDataSource: TDataSource;
    FDataSet: TDataSet;
    FFieldsProperties: TcxFilterPropertiesList;
    FFilterOptions: TcxDBFilterOptions;
    FItems: TcxFilterItemCollection;
  {$IFDEF CBUILDER6}
    function GetDataSet: TDataSet;
  {$ENDIF}
    procedure DataSetStateChange(Sender: TObject);
    procedure SetDataSet(const Value: TDataSet);
  protected
    // IcxFilterControl
    function GetCaption(Index: Integer): string;
    function GetCount: Integer;
    function GetCriteria: TcxFilterCriteria;
    function GetItemLink(Index: Integer): TObject;
    function GetFieldName(Index: Integer): string;
    function GetProperties(Index: Integer): TcxCustomEditProperties;
    function GetValueType(Index: Integer): TcxValueTypeClass;
    //IcxFilterControlDialog
    procedure SetDialogLinkComponent(ALink: TComponent);
    // overrided VCL
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    // overrided TcxCustomFilterControl
    procedure CorrectOperatorClass(var AOperatorClass: TcxFilterOperatorClass); override;
    procedure DoApplyFilter; override;
    procedure FillConditionList(AStrings: TStrings); override;
    function GetFilterLink: IcxFilterControl; override;
    function GetPropertiesClassFromFieldType(AFieldType: TFieldType): TcxCustomEditPropertiesClass; virtual;
    property DataSource: TDataSource read FDataSource;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Clear; override;
  published
    property Align;
    property Anchors;
    property Color;
  {$IFDEF CBUILDER6}
    property DataSet: TDataSet read GetDataSet write SetDataSet;
  {$ELSE}
    property DataSet: TDataSet read FDataSet write SetDataSet;
  {$ENDIF}
  {$IFDEF VCL}
    property DragCursor;
    property DragKind;
  {$ENDIF}
    property DragMode;
    property Enabled;
    property FilterOptions: TcxDBFilterOptions read FFilterOptions write FFilterOptions;
    property Font;
    property FontBoolOperator;
    property FontCondition;
    property FontItem;
    property FontValue;
    property HelpContext;
  {$IFDEF DELPHI6}
    property HelpKeyword;
    property HelpType;
  {$ENDIF}
    property Hint;
    property HotTrackOnUnfocused;
    property Items: TcxFilterItemCollection read FItems write FItems;
    property LookAndFeel;
    property NullString;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property ShowLevelLines;
    property TabOrder;
    property TabStop;
    property Visible;
    property WantTabs;
    property OnApplyFilter;
    property OnClick;
  {$IFDEF DELPHI5}
    property OnContextPopup;
  {$ENDIF}
    property OnDragDrop;
    property OnDragOver;
  {$IFDEF VCL}
    property OnEndDock;
  {$ENDIF}
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
  {$IFDEF VCL}
    property OnStartDock;
  {$ENDIF}
    property OnStartDrag;
  end;

function ExecuteDBFilterControlDialog(ADataSet: TDataSet;
  ALookAndFeel: TcxLookAndFeel; AOnApplyProc: TNotifyEvent = nil;
  AOnShowDialog: TNotifyEvent = nil; AColor: TColor = clDefault;
  const AInitialDir: string = ''): Boolean;
  
implementation

uses
  SysUtils, cxDBFilter, cxDBData, cxCalc, cxCalendar, cxTextEdit,
{$IFNDEF DELPHI5}
  cxClasses,
{$ENDIF}
  cxSpinEdit, cxCheckBox, cxCurrencyEdit, cxTimeEdit, cxFilterControlDialog;

type
  TcxCustomEditPropertiesAccess = class(TcxCustomEditProperties);

function ExecuteDBFilterControlDialog(ADataSet: TDataSet;
  ALookAndFeel: TcxLookAndFeel; AOnApplyProc: TNotifyEvent = nil;
  AOnShowDialog: TNotifyEvent = nil; AColor: TColor = clDefault;
  const AInitialDir: string = ''): Boolean;
begin
  Result := cxInternalExecuteFilterControlDialog(TcxDBFilterControl, ADataSet,
    ALookAndFeel, AOnApplyProc, AOnShowDialog, AColor, AInitialDir);
end;

{ TcxFilterItem }

constructor TcxFilterItem.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  FFilterControl := TcxFilterItemCollection(Collection).Control;
end;

destructor TcxFilterItem.Destroy;
begin
  RepositoryItem := nil;
  DestroyProperties;
  inherited Destroy;
end;

procedure TcxFilterItem.AfterConstruction;
begin
  inherited;
  if GetOwner <> nil then
    GetOwner.GetInterface(IUnknown, FOwnerInterface);
end;

function TcxFilterItem.GetProperties: TcxCustomEditProperties;
begin
  if FRepositoryItem = nil then
    Result := FProperties
  else
    Result := FRepositoryItem.Properties;
end;

function TcxFilterItem._AddRef: Integer;
begin
  if FOwnerInterface <> nil then
    Result := FOwnerInterface._AddRef
  else
    Result := -1;
end;

function TcxFilterItem._Release: Integer;
begin
  if FOwnerInterface <> nil then
    Result := FOwnerInterface._Release
  else
    Result := -1;
end;

function TcxFilterItem.QueryInterface(const IID: TGUID; out Obj): HResult;
const
  E_NOINTERFACE = HResult($80004002);
begin
  if GetInterface(IID, Obj) then
    Result := 0
  else
    Result := E_NOINTERFACE;
end;

procedure TcxFilterItem.ItemRemoved(Sender: TcxEditRepositoryItem);
begin
  RepositoryItem := nil;
  PropertiesChanged(Sender);
end;

procedure TcxFilterItem.PropertiesChanged(Sender: TcxEditRepositoryItem);
begin
  with FilterControl do
    if (ComponentState * [csLoading, csDestroying, csDesigning]) = [] then
      RefreshProperties;
end;

function TcxFilterItem.GetDisplayName: string;
begin
  if FCaption <> '' then
    Result := FCaption
  else
    if FieldName <> '' then
      Result := FieldName
    else
      if GetProperties <> nil then
        Result := GetProperties.ClassName
      else
        Result := ClassName
end;

procedure TcxFilterItem.CreateProperties;
begin
  if FPropertiesClass <> nil then
  begin
    FProperties := FPropertiesClass.Create(Self);
    TcxCustomEditPropertiesAccess(FProperties).OnPropertiesChanged := DoPropertiesChanged;
  end;
end;

procedure TcxFilterItem.DestroyProperties;
begin
  FreeAndNil(FProperties);
end;

procedure TcxFilterItem.DoPropertiesChanged(Sender: TObject);
begin
  PropertiesChanged(nil);
end;

function TcxFilterItem.GetPropertiesClassName: string;
begin
  if FProperties = nil then
    Result := ''
  else
    Result := FProperties.ClassName;
end;

function TcxFilterItem.IsCaptionStored: Boolean;
begin
  Result := (FCaption <> '') and (FCaption <> FFieldName);
end;

procedure TcxFilterItem.RecreateProperties;
begin
  DestroyProperties;
  CreateProperties;
end;

procedure TcxFilterItem.SetCaption(const Value: string);
begin
  if FCaption <> Value then
  begin
    FCaption := Value;
    Changed(False);
  end;
end;

procedure TcxFilterItem.SetFieldName(const Value: string);
begin
  if FFieldName <> Value then
  begin
    if FFieldName = FCaption then
      FCaption := Value;
    FFieldName := Value;
    Changed(False);
  end;
end;

procedure TcxFilterItem.SetProperties(const Value: TcxCustomEditProperties);
begin
  if (Value <> nil) and (esoFiltering in Value.GetSupportedOperations) then
    FProperties.Assign(Value);
end;

procedure TcxFilterItem.SetPropertiesClass(
  const Value: TcxCustomEditPropertiesClass);
begin
  if (FPropertiesClass <> Value) and ((Value = nil) or IsSupportFiltering(Value)) then
  begin
    FPropertiesClass := Value;
    RecreateProperties;
    PropertiesChanged(nil);
  end;
end;

procedure TcxFilterItem.SetPropertiesClassName(const Value: string);
var
  APropertiesClass: TcxCustomEditPropertiesClass;
begin
  APropertiesClass :=
    TcxCustomEditPropertiesClass(GetRegisteredEditProperties.FindByClassName(Value));
  if (APropertiesClass = nil) or IsSupportFiltering(APropertiesClass) then
    PropertiesClass := APropertiesClass;
end;

procedure TcxFilterItem.SetRepositoryItem(
  const Value: TcxEditRepositoryItem);
begin
  if FRepositoryItem <> Value then
  begin
    if (Value <> nil) and
      not (esoFiltering in Value.Properties.GetSupportedOperations) then Exit;
    if FRepositoryItem <> nil then
      FRepositoryItem.RemoveListener(Self);
    FRepositoryItem := Value;
    if FRepositoryItem <> nil then
      FRepositoryItem.AddListener(Self);
    PropertiesChanged(nil);
  end;
end;

{ TcxFilterItemCollection }

procedure TcxFilterItemCollection.Update(Item: TCollectionItem);
begin
  if (UpdateCount = 0) and (Control.ComponentState * [csDestroying, csLoading] = []) then
    Control.LayoutChanged;
end;

function TcxFilterItemCollection.GetControl: TcxDBFilterControl;
begin
  if GetOwner is TcxDBFilterControl then
    Result := TcxDBFilterControl(GetOwner)
  else
    Result := nil;
end;

function TcxFilterItemCollection.GetItems(Index: Integer): TcxFilterItem;
begin
  Result := TcxFilterItem(inherited Items[Index])
end;

procedure TcxFilterItemCollection.SetItems(Index: Integer;
  const Value: TcxFilterItem);
begin
  inherited Items[Index] := Value;
end;

{ TcxFilterPropertiesList }

procedure TcxFilterPropertiesList.Clear;
var
  I: Integer;
begin
  for I := 0 to Count - 1 do
    TcxCustomEditProperties(Items[I]).Free;
  inherited Clear;
end;

function TcxFilterPropertiesList.GetProperties(
  AClass: TcxCustomEditPropertiesClass): TcxCustomEditProperties;
var
  I: Integer;
begin
  Result := nil;
  if AClass = nil then Exit;
  for I := 0 to Count - 1 do
    if TcxCustomEditProperties(Items[I]).ClassType = AClass then
    begin
      Result := TcxCustomEditProperties(Items[I]);
      break
    end;
  if Result = nil then
  begin
    Result := AClass.Create(nil);
    Add(Result);
  end;
end;

{ TcxDBFilterOptions }

constructor TcxDBFilterOptions.Create(AFilterControl: TcxDBFilterControl);
begin
  FFilterControl := AFilterControl;
  FSupportedBetween := True;
  FSupportedIn := True;
  FSupportedLike := True;
end;

procedure TcxDBFilterOptions.ProcessFilterOperators(
  var SupportedOperations: TcxFilterControlOperators);
begin
  if not SupportedBetween then
    SupportedOperations := SupportedOperations - [fcoBetween, fcoNotBetween];
  if not SupportedIn then
    SupportedOperations := SupportedOperations - [fcoInList, fcoNotInList];
  if not SupportedLike then
    SupportedOperations := SupportedOperations - [fcoLike, fcoNotLike];
end;

function TcxDBFilterOptions.GetDateTimeFormat: string;
begin
  Result := FFilterControl.Criteria.DateTimeFormat;
end;

function TcxDBFilterOptions.GetPercentWildcard: Char;
begin
  Result := FFilterControl.Criteria.PercentWildcard;
end;

function TcxDBFilterOptions.GetSoftNull: Boolean;
begin
  Result := fcoSoftNull in FFilterControl.Criteria.Options;
end;

function TcxDBFilterOptions.GetUnderscoreWildcard: Char;
begin
  Result := FFilterControl.Criteria.UnderscoreWildcard;
end;

procedure TcxDBFilterOptions.SetDateTimeFormat(const Value: string);
begin
  FFilterControl.Criteria.DateTimeFormat := Value;
end;

procedure TcxDBFilterOptions.SetPercentWildcard(Value: Char);
begin
  FFilterControl.Criteria.PercentWildcard := Value;
end;

procedure TcxDBFilterOptions.SetSoftNull(Value: Boolean);
begin
  with FFilterControl.Criteria do
    if Value then
      Options := Options + [fcoSoftNull]
    else
      Options := Options - [fcoSoftNull];
end;

procedure TcxDBFilterOptions.SetUnderscoreWildcard(Value: Char);
begin
  FFilterControl.Criteria.UnderscoreWildcard := Value;
end;

{ TcxDBFilterControl }

constructor TcxDBFilterControl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FFilterOptions := TcxDBFilterOptions.Create(Self);
  FItems := TcxFilterItemCollection.Create(Self, TcxFilterItem);
  FDataSource := TDataSource.Create(Self);
  FDataSource.OnStateChange := DataSetStateChange;
  FFieldsProperties := TcxFilterPropertiesList.Create;
end;

destructor TcxDBFilterControl.Destroy;
begin
  FreeAndNil(FDataSource);
  FreeAndNil(FItems);
  FreeAndNil(FFieldsProperties);
  FreeAndNil(FFilterOptions);
  inherited Destroy;
end;

procedure TcxDBFilterControl.Clear;
begin
  inherited Clear;
  FFieldsProperties.Clear;
end;

function TcxDBFilterControl.GetCaption(Index: Integer): string;
begin
  if (Index > -1) and (Index < GetCount) then
    if FItems.Count > 0 then
      Result := FItems[Index].Caption
    else
      Result := FDataSet.Fields[Index].DisplayName
  else
    Result := '';
end;

function TcxDBFilterControl.GetCount: Integer;
begin
  if (FItems <> nil) and (FItems.Count > 0) then
    Result := FItems.Count
  else
    if (FDataSet <> nil) and not (FDataSet.DefaultFields and (FDataSource.State = dsInactive)) then
      Result := FDataSet.FieldCount
    else
      Result := 0;
end;

function TcxDBFilterControl.GetCriteria: TcxFilterCriteria;
begin
  Result := inherited Criteria;
end;

function TcxDBFilterControl.GetItemLink(Index: Integer): TObject;
begin
  Result := TObject(Index);
end;

function TcxDBFilterControl.GetFieldName(Index: Integer): string;
begin
  if (Index > -1) and (Index < GetCount) then
    if FItems.Count > 0 then
      Result := FItems[Index].FieldName
    else
      Result := FDataSet.Fields[Index].FieldName
  else
    Result := '';
end;

function TcxDBFilterControl.GetProperties(Index: Integer): TcxCustomEditProperties;
begin
  if (Index > -1) and (Index < GetCount) then
    if FItems.Count > 0 then
      Result := FItems[Index].GetProperties
    else
      Result := FFieldsProperties.GetProperties(
        GetPropertiesClassFromFieldType(FDataSet.Fields[Index].DataType))
  else
    Result := nil;
  if Result = nil then Result := GetDefaultProperties;
end;

function TcxDBFilterControl.GetValueType(Index: Integer): TcxValueTypeClass;

  function TrimFieldName(const AFieldName: string): string;
  begin
    Result := AFieldName;
    while (Length(Result) > 0) and (Result[1] in [#0..' ', '"', '''', '[']) do
      Delete(Result, 1, 1);
    while (Length(Result) > 0) and (Result[Length(Result)] in [#0..' ', '"', '''', ']']) do
      Delete(Result, Length(Result), 1);
  end;

var
  AField: TField;
begin
  if (Index > -1) and (Index < GetCount) then
    if FItems.Count > 0 then
    begin
      if (FDataSet <> nil) then
        AField := FDataSet.FindField(TrimFieldName(GetFieldName(Index)))
      else
        AField := nil;
      Result := GetValueTypeClassByField(AField);
    end
    else
      Result := GetValueTypeClassByField(FDataSet.Fields[Index])
  else
  Result := nil;
end;

procedure TcxDBFilterControl.SetDialogLinkComponent(ALink: TComponent);
begin
  if ALink = nil then
    DataSet := nil
  else
    if ALink is TDataSet then DataSet := TDataSet(ALink);
end;

procedure TcxDBFilterControl.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FDataSet) then
    DataSet := nil;
end;

procedure TcxDBFilterControl.CorrectOperatorClass(
  var AOperatorClass: TcxFilterOperatorClass);
var
  AOperatorAdapter: TcxDBFilterOperatorAdapter;
begin
  AOperatorAdapter := cxGetFilterOperatorAdapter(FDataSet);
  if Assigned(AOperatorAdapter) then
    AOperatorAdapter.PrepareOperatorClass(nil, FDataSet, AOperatorClass);
end;

procedure TcxDBFilterControl.DoApplyFilter;
begin
  FApplyingFilter := True;
  try
    inherited DoApplyFilter;
  finally
    FApplyingFilter := False;
  end;
end;

procedure TcxDBFilterControl.FillConditionList(AStrings: TStrings);
var
  AOperator: TcxFilterControlOperator;
  ASupportedOperators: TcxFilterControlOperators;
begin
  if (AStrings = nil) or not HasItems then Exit;
  AStrings.Clear;
  ASupportedOperators := FocusedRow.Condition.SupportedOperators;
  FilterOptions.ProcessFilterOperators(ASupportedOperators);
  for AOperator := fcoEqual to fcoNextYear do
    if AOperator in ASupportedOperators then
      AStrings.AddObject(cxGetConditionText(AOperator), TObject(AOperator));
end;

function TcxDBFilterControl.GetFilterLink: IcxFilterControl;
begin
  QueryInterface(IcxFilterControl, Result);
end;

function TcxDBFilterControl.GetPropertiesClassFromFieldType(
  AFieldType: TFieldType): TcxCustomEditPropertiesClass;
begin
  case AFieldType of
    ftString, ftWideString:
      Result := TcxTextEditProperties;
    ftSmallint, ftInteger, ftWord, ftAutoInc {$IFDEF DELPHI6}, ftLargeint {$ENDIF}:
      Result := TcxSpinEditProperties;
    ftBoolean:
      Result := TcxCheckBoxProperties;
    ftFloat:
      Result := TcxCalcEditProperties;
    ftCurrency, ftBCD:
      Result := TcxCurrencyEditProperties;
    ftDate, ftDateTime:
      Result := TcxDateEditProperties;
    ftTime:
      Result := TcxTimeEditProperties;
  else
    Result := nil;
  end;
end;

{$IFDEF CBUILDER6}
function TcxDBFilterControl.GetDataSet: TDataSet;
begin
  Result := FDataSet;
end;
{$ENDIF}

procedure TcxDBFilterControl.DataSetStateChange(Sender: TObject);
begin
  if not FApplyingFilter and (FDataSource.State in [dsInactive, dsBrowse]) then
    LayoutChanged;
end;

procedure TcxDBFilterControl.SetDataSet(const Value: TDataSet);
begin
  if FDataSet <> Value then
  begin
    FDataSet := Value;
    FDataSource.DataSet := Value;
    Clear;
    if Value <> nil then Value.FreeNotification(Self);
  end;
end;

end.
