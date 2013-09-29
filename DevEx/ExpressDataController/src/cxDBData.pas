
{********************************************************************}
{                                                                    }
{       Developer Express Visual Component Library                   }
{       ExpressDataController                                        }
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
{   LICENSED TO DISTRIBUTE THE EXPRESSDATACONTROLLER AND ALL         }
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

unit cxDBData;

{$I cxDataVer.inc}

interface

uses
  SysUtils, Classes, {$IFDEF DELPHI6}Variants, {$ENDIF} DB, cxDataUtils,
  cxCustomData, cxDataStorage, cxVariants, cxFilter, cxDBFilter, cxDB;

type
  TcxDBDataController = class;
  TcxDBDataProvider = class;
  TcxDBDataModeController = class;
  TcxDBDataFilterCriteria = class;
  TGetListProc = procedure(AList: TList) of object;

  { TcxDBProviderDetailFilterAdapter }

  TcxDBProviderDetailFilterAdapter = class(TcxDBAdapterItem)
  public
    function IsCurrentQuery(ADataSet: TDataSet; const AParamNames: string; const AParamValues: Variant): Boolean; virtual;
    procedure ReopenSQL(ADataSet: TDataSet; const AParamNames: string; const AParamValues: Variant; var AReopened: Boolean); virtual;
    procedure SetFilter(ADataSet: TDataSet; const AMasterDetailKeyFieldNames: string;
      const AMasterDetailKeyValues: Variant; AIsSQLMode: Boolean; var AReopened: Boolean); virtual;
  end;

  { TcxDBDataLink }
               
  TcxDBDataLink = class(TDataLink)
  private
    {$IFDEF DELPHI7}
    FLayoutChangedFlag: Boolean;
    {$ENDIF}
    FProvider: TcxDBDataProvider;
  protected
    procedure ActiveChanged; override;
    {$IFDEF DELPHI7}
    procedure DataEvent(Event: TDataEvent; Info: Integer); override;
    {$ENDIF}
    procedure DataSetChanged; override;
    procedure DataSetScrolled(Distance: Integer); override;
    procedure EditingChanged; override;
    procedure FocusControl(Field: TFieldRef); override;
    procedure LayoutChanged; override;
    procedure RecordChanged(Field: TField); override;
    procedure UpdateData; override;
    property Provider: TcxDBDataProvider read FProvider;
  public
    constructor Create(AProvider: TcxDBDataProvider);
  end;

  { TcxDBDataProvider }

  TcxDBDataProviderSavePosInfo = record
    Bookmark: TBookmarkStr;
    Bof: Boolean; // conflicts with C++ macro
    Eof: Boolean; // conflicts with C++ macro
    ActiveRecord: Integer;
  end;

  TcxDBDataProvider = class(TcxCustomDataProvider)
  private
    FActiveChanging: Boolean;
    FDataLink: TcxDBDataLink;
    FInCanInitEditing: Boolean;
    FIncrementalSearching: Boolean;
    FInFirst: Boolean;
    FInInsert: Boolean;
    FInUpdateGridMode: Boolean;
    FIsDataSetCurrent: Boolean;
    FInNotify: Boolean;
    FListeners: TList;
    FPostLocateFlag: Boolean;
    FRecordIndex: Integer;
    FSavePosInfo: TcxDBDataProviderSavePosInfo;
    FUpdatingPrevFocusedRecordIndex: Integer;
    FUpdatingRecordIndex: Integer;
    FUpdatingRecordIsInserting: Boolean;
    FUpdatingNewRecordIndex: Integer;
    procedure AddNewRecord(AOperation: TDataOperation);
    function GetDataController: TcxDBDataController;
    function GetDataSet: TDataSet;
    function GetDataSource: TDataSource;
    function GetIsDataSetCurrent: Boolean;
    function GetIsSmartRefresh: Boolean;
    procedure RemoveFromListeners;
    procedure SetDataSource(Value: TDataSource);
    procedure SetIsDataSetCurrent(Value: Boolean);
  protected
    function IsCustomDataSourceSupported: Boolean; override;
    function IsGridMode: Boolean; override;
    function IsDataSource: Boolean; override;
    function IsKeyNavigation: Boolean;
    function IsOtherInsert: Boolean; override;
    function IsSyncInsert: Boolean;
    function IsSyncMode: Boolean; override;
    // State
    function IsActive: Boolean; override;
    function IsActiveDataSet: Boolean; override;
    function IsBOF: Boolean; override;
    function IsChanging: Boolean; override;
    function IsEditing: Boolean; override;
    function IsEOF: Boolean; override;
    function IsInserting: Boolean; override;
    function IsModified: Boolean; override;
    // Navigation
    procedure CorrectRecordIndex(ARecordIndex: Integer); override;
    procedure First; override;
    procedure Prev; override;
    procedure Next; override;
    procedure Last; override;
    procedure MoveBy(ADistance: Integer); override;
    procedure Scroll(ADistance: Integer); override;
    procedure SavePos; override;
    procedure RestorePos; override;
    // Editing
    function CanDelete: Boolean; override;
    function CanInitEditing(ARecordIndex: Integer): Boolean; override;
    function CanModify: Boolean; override;

    procedure Append; override;
    procedure Cancel; override;
    procedure Delete; override;
    procedure DeleteRecords(AList: TList); override;
    procedure DeleteSelection; override;
    procedure Edit; override;
    function GetEditValue(ARecordIndex: Integer; AField: TcxCustomDataField; AEditValueSource: TcxDataEditValueSource): Variant; override;
    procedure Insert; override;
    procedure Post; override;
    procedure PostEditingData; override;
    function SetEditValue(ARecordIndex: Integer; AField: TcxCustomDataField; const AValue: Variant; AEditValueSource: TcxDataEditValueSource): Boolean; override;

    procedure AssignItemValue(ARecordIndex: Integer; AField: TcxCustomDataField; const AValue: Variant); override;
    procedure DoInitInsertingRecord(AInsertingRecordIndex: Integer; const AGroupValues: TcxDataSummaryValues); override;
    // Notification
    procedure ActiveChanged(AActive: Boolean); override;
    procedure AddListener(AProvider: TcxDBDataProvider);
    procedure BeginLocate; override;
    procedure DataScrolled(ADistance: Integer); override;
    procedure Freeze; override;
    procedure LayoutChanged(ADataLayoutChanges: TcxDataLayoutChanges); override;
    procedure RecordChanged(Field: TField); virtual;
    procedure ResetPostLocateFlag;
    procedure ResetSmartRefresh;
    procedure SetPostLocateFlag;
    procedure Unfreeze; override;
    // Smart Refesh
    procedure SmartDataChanged;
    // GridMode
    function DoLocate(const ASubText: string; AForward, ANext: Boolean): Boolean;
    function GetDataBufferCount: Integer;
    function GetDataRecordCount: Integer;
    function GetExternalDataDisplayText(ARecordIndex: Integer; AField: TcxCustomDataField): string; override;
    function GetExternalDataValue(ARecordIndex: Integer; AField: TcxCustomDataField): Variant; override;
    procedure LoadDataBuffer; override;
    procedure UpdateGridMode;
    // Master Detail
    function GetDetailHasChildren(ARecordIndex: Integer; ARelationIndex: Integer): Boolean; override;
    // Structure
    function GetRecordIndex: Integer; override;
    function GetValueDefReaderClass: TcxValueDefReaderClass; override;
    property DataController: TcxDBDataController read GetDataController;
    property DataLink: TcxDBDataLink read FDataLink;
    property UpdatingRecordIndex: Integer read FUpdatingRecordIndex;
  public
    constructor Create(ADataController: TcxCustomDataController); override;
    destructor Destroy; override;
    function IsCanInitEditingBusy: Boolean;
    function IsDataSetBusy: Boolean;
    function IsDetailDataSetBusy: Boolean;
    function IsOtherDataControllerUpdating: Boolean; // TODO: !!!
    function IsOtherDetailDataSetInInsert: Boolean;
    function IsOtherDetailChanged: Boolean;
    function IsUniDirectional: Boolean;
    property DataSet: TDataSet read GetDataSet;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property IsDataSetCurrent: Boolean read GetIsDataSetCurrent write SetIsDataSetCurrent;
    property IsSmartRefresh: Boolean read GetIsSmartRefresh;
  end;

  TcxValueDefDBReader = class(TcxValueDefReader)
  public
    function GetDisplayText(AValueDef: TcxValueDef): string; override;
    function GetValue(AValueDef: TcxValueDef): Variant; override;
    function IsInternal(AValueDef: TcxValueDef): Boolean; override;
  end;

  { TcxDBDataField }

  TcxDBDataField = class(TcxCustomDataField)
  private
    FField: TField;
    FFieldName: string;
    FFields: TList;
    FParentField: TcxDBDataField;
    function GetDataController: TcxDBDataController;
    function GetField: TField;
    function GetFieldItem(Index: Integer): TcxDBDataField;
    function GetFieldCount: Integer;
    function GetIsLookup: Boolean;
    function GetProvider: TcxDBDataProvider;
    procedure SetField(Value: TField);
  protected
    procedure AddField(ADataField: TcxDBDataField);
    procedure ClearFields;
    procedure Reassign(ASource: TcxCustomDataField); override;
    procedure RemoveField(ADataField: TcxDBDataField);
    procedure RemoveNotification(AComponent: TComponent); override;
    procedure SetPropertiesByField(AField: TField);
    property DataController: TcxDBDataController read GetDataController;
    property Field: TField read GetField write SetField;
    property FieldCount: Integer read GetFieldCount;
    property FieldName: string read FFieldName write FFieldName;
    property Fields[Index: Integer]: TcxDBDataField read GetFieldItem; default;
    property IsLookup: Boolean read GetIsLookup;
    property ParentField: TcxDBDataField read FParentField;
    property Provider: TcxDBDataProvider read GetProvider;
  public
    destructor Destroy; override;
    function CanModify(AEditValueSource: TcxDataEditValueSource): Boolean; override;
    function IsValueDefInternal: Boolean; override;
  end;

  { TcxDBDataRelation }

  TcxDBDataRelation = class(TcxCustomDataRelation)
  private
    FMasterKeyField: TcxDBDataField;
    function GetDataController: TcxDBDataController;
    function GetDetailKeyFieldNames: string;
    function GetMasterKeyFieldNames: string;
  protected
    procedure GetMasterKeyFields(AList: TList);
    function IsLinked: Boolean; virtual;
    procedure RemoveDataField(ADataField: TcxCustomDataField); override;
    procedure RemoveMasterKeyField;
    procedure UpdateMasterDetailKeyFieldNames;
  public
    destructor Destroy; override;
    function GetMasterRecordID(ARecordIndex: Integer): Variant;
    property DataController: TcxDBDataController read GetDataController;
    property DetailKeyFieldNames: string read GetDetailKeyFieldNames;
    property MasterKeyFieldNames: string read GetMasterKeyFieldNames;
  end;

  { DB Filter }

  TcxDBDataFilterCriteriaItem = class(TcxDataFilterCriteriaItem)
  private
    function GetDataController: TcxDBDataController;
    function GetDBField: TcxDBDataField;
  protected
    function GetFilterOperatorClass: TcxFilterOperatorClass; override;
  public
    property DataController: TcxDBDataController read GetDataController;
    property DBField: TcxDBDataField read GetDBField;
  end;

  TcxDBDataFilterBeforeChangeEvent = procedure(Sender: TcxDBDataFilterCriteria;
    ADataSet: TDataSet; const AFilterText: string) of object;

  TcxDBDataFilterCriteria = class(TcxDataFilterCriteria)
  private
    FAutoDataSetFilter: Boolean;
    FIgnoreOrigin: Boolean; 
    FOnBeforeChange: TcxDBDataFilterBeforeChangeEvent;
    function GetDataController: TcxDBDataController;
    procedure SetAutoDataSetFilter(Value: Boolean);
    procedure SetIgnoreOrigin(Value: Boolean);
  protected
    function GetItemClass: TcxFilterCriteriaItemClass; override;
    procedure Update; override;
  public
    constructor Create(ADataController: TcxCustomDataController); override;
    procedure Assign(Source: TPersistent); override;
    procedure AssignEvents(Source: TPersistent); override;
    function IsAutoDataSetFilter: Boolean;
    function IsFiltering: Boolean; override;
    procedure RestoreDefaults; override;
    property DataController: TcxDBDataController read GetDataController;
  published
    // TODO: add property CustomFiltering -> IsFiltering = False!
    property AutoDataSetFilter: Boolean read FAutoDataSetFilter write SetAutoDataSetFilter default False;
    property DateTimeFormat;
    property IgnoreOrigin: Boolean read FIgnoreOrigin write SetIgnoreOrigin default True; 
    property OnBeforeChange: TcxDBDataFilterBeforeChangeEvent read FOnBeforeChange write FOnBeforeChange;
  end;

  { DB Summary }

  TcxDBDataSummaryItem = class(TcxDataSummaryItem)
  private
    FDataField: TcxDBDataField;
    FFieldName: string;
    function GetDBDataController: TcxDBDataController;
    procedure SetFieldName(const Value: string);
  public
    procedure Assign(Source: TPersistent); override;
    property DataController: TcxDBDataController read GetDBDataController;
    function DataField: TcxCustomDataField; override;
  published
    property FieldName: string read FFieldName write SetFieldName;
  end;

  { TcxDBDataModeController }

  TcxDBDataModeControllerDetailIsCurrentQueryEvent = function(Sender: TcxDBDataModeController;
    ADataSet: TDataSet; const AMasterDetailKeyFieldNames: string;
    const AMasterDetailKeyValues: Variant): Boolean of object;

  TcxDBDataModeControllerDetailFirstEvent = procedure(Sender: TcxDBDataModeController;
    ADataSet: TDataSet; const AMasterDetailKeyFieldNames: string;
    const AMasterDetailKeyValues: Variant; var AReopened: Boolean) of object;

  TcxDBDataModeController = class(TPersistent)
  private
    FDataController: TcxDBDataController;
    FDetailInSQLMode: Boolean;
    FDetailInSyncMode: Boolean;
    FGridMode: Boolean;
    FGridModeBufferCount: Integer;
    FSmartRefresh: Boolean;
    FSyncInsert: Boolean;
    FSyncMode: Boolean;
    FOnDetailFirst: TcxDBDataModeControllerDetailFirstEvent;
    FOnDetailIsCurrentQuery: TcxDBDataModeControllerDetailIsCurrentQueryEvent;
    procedure SetGridMode(Value: Boolean);
    procedure SetGridModeBufferCount(Value: Integer);
    procedure SetSmartRefresh(Value: Boolean);
    procedure SetSyncMode(Value: Boolean);
  protected
    function DetailIsCurrentQuery(const AMasterDetailKeyFieldNames: string; const AMasterDetailKeyValues: Variant): Boolean; virtual;
    procedure DoDetailFirst(const AMasterDetailKeyFieldNames: string; const AMasterDetailKeyValues: Variant; var AReopened: Boolean); virtual;
    property DetailInSyncMode: Boolean read FDetailInSyncMode write FDetailInSyncMode default True;
  public
    constructor Create(ADataController: TcxDBDataController);
    procedure Assign(Source: TPersistent); override;
    property DataController: TcxDBDataController read FDataController;
    property SyncInsert: Boolean read FSyncInsert write FSyncInsert default True;
  published
    property DetailInSQLMode: Boolean read FDetailInSQLMode write FDetailInSQLMode default False;
    property GridMode: Boolean read FGridMode write SetGridMode default False;
    property GridModeBufferCount: Integer read FGridModeBufferCount write SetGridModeBufferCount default 0;
    property SmartRefresh: Boolean read FSmartRefresh write SetSmartRefresh default False;
    property SyncMode: Boolean read FSyncMode write SetSyncMode default True;
    property OnDetailFirst: TcxDBDataModeControllerDetailFirstEvent read FOnDetailFirst write FOnDetailFirst;
    property OnDetailIsCurrentQuery: TcxDBDataModeControllerDetailIsCurrentQueryEvent read FOnDetailIsCurrentQuery write FOnDetailIsCurrentQuery;
  end;

  { TcxDBDataSelection }

  TcxDBDataSelection = class(TcxDataSelection)
  private
    FAnchorBookmark: TBookmarkStr;
    FBookmarks: TStrings;
    FInSelectAll: Boolean;
    function GetDataController: TcxDBDataController;
  protected
    procedure ClearAnchor; override;
    function CompareBookmarks(const AItem1, AItem2: TBookmarkStr): Integer;
    procedure InternalAdd(AIndex, ARowIndex, ARecordIndex, ALevel: Integer); override;
    procedure InternalClear; override;
    procedure InternalDelete(AIndex: Integer); override;
    function FindBookmark(const ABookmark: TBookmarkStr; var AIndex: Integer): Boolean;
    function GetRowBookmark(ARowIndex: Integer): TBookmarkStr;
    function RefreshBookmarks: Boolean;
    procedure SyncCount;
  public
    constructor Create(ADataController: TcxCustomDataController); override;
    destructor Destroy; override;
    function FindByRowIndex(ARowIndex: Integer; var AIndex: Integer): Boolean; override;
    procedure SelectAll;
    procedure SelectFromAnchor(AToBookmark: TBookmarkStr; AKeepSelection: Boolean);
    property DataController: TcxDBDataController read GetDataController;
  end;

  { TcxDBDataController }

  TcxDBDataDetailHasChildrenEvent = procedure(Sender: TcxDBDataController;
    ARecordIndex, ARelationIndex: Integer; const AMasterDetailKeyFieldNames: string;
    const AMasterDetailKeyValues: Variant; var HasChildren: Boolean) of object;

  TcxDBDataController = class(TcxCustomDataController)
  private
    FBookmark: TBookmarkStr;
    FDataModeController: TcxDBDataModeController;
    FDetailKeyFieldNames: string;
    FInCheckBrowseMode: Boolean;
    FInCheckCurrentQuery: Boolean;
    FInResetDataSetCurrent: Boolean;
    FKeyField: TcxDBDataField;
    FKeyFieldNames: string;
    FMasterDetailKeyFields: TList;
    FMasterDetailKeyValues: Variant;
    FMasterKeyFieldNames: string;
    FResetDBFields: Boolean;
    FUpdateDataSetPos: Boolean;
    FOnDetailHasChildren: TcxDBDataDetailHasChildrenEvent;
    function AddInternalDBField: TcxDBDataField;
    function GetDataSet: TDataSet;
    function GetDataSetRecordCount: Integer;
    function GetDataSource: TDataSource;
    function GetDBField(Index: Integer): TcxDBDataField;
    function GetDBSelection: TcxDBDataSelection;
    function GetFilter: TcxDBDataFilterCriteria;
    function GetMasterDetailKeyFieldNames: string;
    function GetMasterDetailKeyFields: TList;
    function GetProvider: TcxDBDataProvider;
    function GetRecNo: Integer;
    procedure MasterDetailKeyFieldsRemoveNotification(AComponent: TComponent);
    procedure RemoveKeyField;
    procedure SetDataModeController(Value: TcxDBDataModeController);
    procedure SetDataSource(Value: TDataSource);
    procedure SetDetailKeyFieldNames(const Value: string);
    procedure SetFilter(Value: TcxDBDataFilterCriteria);
    procedure SetKeyFieldNames(const Value: string);
    procedure SetMasterKeyFieldNames(const Value: string);
    procedure SetRecNo(Value: Integer);
    procedure SyncDataSetPos;
    function SyncMasterDetail: TcxCustomDataController;
    procedure SyncMasterDetailDataSetPos;
    procedure UpdateRelationFields;
  protected
    function CanChangeDetailExpanding(ARecordIndex: Integer; AExpanded: Boolean): Boolean; override;
    function CanFocusRecord(ARecordIndex: Integer): Boolean; override;
    procedure CheckBrowseMode; override;
    function CheckMasterBrowseMode: Boolean; override;
    procedure ClearMasterDetailKeyFields;
    procedure CorrectAfterDelete(ARecordIndex: Integer); override;
    procedure DoDataSourceChanged; virtual;
    procedure DoInitInsertingRecord(AInsertingRecordIndex: Integer); virtual;
    function DoSearchInGridMode(const ASubText: string; AForward, ANext: Boolean): Boolean; override;
    function GetActiveRecordIndex: Integer; override;
    function GetDataProviderClass: TcxCustomDataProviderClass; override;
    function GetDataSelectionClass: TcxDataSelectionClass; override;
    function GetDefaultGridModeBufferCount: Integer; virtual;
    function GetFieldClass: TcxCustomDataFieldClass; override;
    function GetFilterCriteriaClass: TcxDataFilterCriteriaClass; override;
    function GetInternalRecordId(ARecordIndex: Integer; AList: TList): Variant;
    procedure GetKeyFields(AList: TList);
    function GetRelationClass: TcxCustomDataRelationClass; override;
    function GetSummaryItemClass: TcxDataSummaryItemClass; override;
    function InternalCheckBookmark(ADeletedRecordIndex: Integer): Boolean; override;
    procedure InternalClearBookmark; override;
    procedure InternalGotoBookmark; override;
    function InternalSaveBookmark: Boolean; override;
    procedure InvalidateDataBuffer; virtual;
    function IsDataField(AField: TcxCustomDataField): Boolean; override;
    function IsKeyNavigation: Boolean;
    function IsOtherDetailChanged: Boolean;
    function IsOtherDetailCreating: Boolean;
    function IsProviderDataSource: Boolean; override;
    procedure LoadStorage; override;
    function LocateRecordIndex(AGetFieldsProc: TGetListProc): Integer; virtual;
    procedure NotifyDataControllers; override;
    procedure PrepareField(AField: TcxCustomDataField); override;
    procedure RemoveNotification(AComponent: TComponent); override;
    procedure ResetDataSetCurrent(ADataController: TcxCustomDataController);
    procedure ResetDBFields;
    procedure RestructData; override;
    procedure ResyncDBFields;
    procedure RetrieveField(ADataField: TcxDBDataField; AIsLookupKeyOnly: Boolean);
    procedure UpdateEditingRecord;
    procedure UpdateField(ADataField: TcxDBDataField; const AFieldNames: string; AIsLookup: Boolean);
    procedure UpdateFields; override;
    procedure UpdateFocused; override;
    procedure UpdateInternalKeyFields(const AFieldNames: string; var AField: TcxDBDataField);
    procedure UpdateLookupFields;
    procedure UpdateRelations(ARelation: TcxCustomDataRelation); override;
    procedure UpdateScrollBars; virtual;
    property DBFields[Index: Integer]: TcxDBDataField read GetDBField;
    property DBSelection: TcxDBDataSelection read GetDBSelection;
    property KeyField: TcxDBDataField read FKeyField;
    property MasterDetailKeyFieldNames: string read GetMasterDetailKeyFieldNames;
    property MasterDetailKeyFields: TList read GetMasterDetailKeyFields;
    property MasterDetailKeyValues: Variant read FMasterDetailKeyValues;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    // Actions
    function ExecuteAction(Action: TBasicAction): Boolean; override;
    function UpdateAction(Action: TBasicAction): Boolean; override;
    // Structure
    procedure ChangeFieldName(AItemIndex: Integer; const AFieldName: string);
    procedure ChangeValueTypeClass(AItemIndex: Integer; AValueTypeClass: TcxValueTypeClass); override;
    function GetItemByFieldName(const AFieldName: string): TObject;
    function GetItemField(AItemIndex: Integer): TField;
    function GetItemFieldName(AItemIndex: Integer): string;
    procedure Loaded; override;
    // Data
    procedure BeginLocate;
    procedure EndLocate;
    procedure DoUpdateRecord(ARecordIndex: Integer);
    function GetGroupValue(ARecordIndex: Integer; AField: TcxCustomDataField): Variant; override;
    function GetRecordId(ARecordIndex: Integer): Variant;
    procedure UpdateGridModeBufferCount;
    // Data Editing
    procedure RefreshExternalData; override;
    // Bookmark
    function IsBookmarkAvailable: Boolean; override;
    function IsBookmarkRow(ARowIndex: Integer): Boolean; override;
    // Filter
    function GetFilterDataValue(ARecordIndex: Integer; AField: TcxCustomDataField): Variant; override;
    function GetFilterItemFieldName(AItem: TObject): string; override;
    // Search
    function FindRecordIndexByKey(const AKeyFieldValues: Variant): Integer;
    function LocateByKey(const AKeyFieldValues: Variant): Boolean;
    // Master-Detail
    procedure CheckCurrentQuery;
    function GetDetailFilterAdapter: TcxDBProviderDetailFilterAdapter; virtual;
    procedure SetMasterRelation(AMasterRelation: TcxCustomDataRelation; AMasterRecordIndex: Integer); override;
    // MultiSelect in GridMode
    function GetSelectedBookmark(Index: Integer): TBookmarkStr;
    function GetSelectedRowIndex(Index: Integer): Integer; override;
    function GetSelectionAnchorBookmark: TBookmarkStr;
    function GetSelectionAnchorRowIndex: Integer; override;
    function IsSelectionAnchorExist: Boolean; override;
    procedure SelectAll; override;
    procedure SelectFromAnchor(ARowIndex: Integer; AKeepSelection: Boolean); override;
    procedure SetSelectionAnchor(ARowIndex: Integer); override;
    // View Data
    procedure ForEachRow(ASelectedRows: Boolean; AProc: TcxDataControllerEachRowProc); override;
    function IsSequenced: Boolean;

    property DataModeController: TcxDBDataModeController read FDataModeController write SetDataModeController;
    property DataSet: TDataSet read GetDataSet;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property DetailKeyFieldNames: string read FDetailKeyFieldNames write SetDetailKeyFieldNames;
    property Filter: TcxDBDataFilterCriteria read GetFilter write SetFilter;
    property KeyFieldNames: string read FKeyFieldNames write SetKeyFieldNames;
    property MasterKeyFieldNames: string read FMasterKeyFieldNames write SetMasterKeyFieldNames;
    property Provider: TcxDBDataProvider read GetProvider;
    property RecNo: Integer read GetRecNo write SetRecNo; // Sequenced
    property DataSetRecordCount: Integer read GetDataSetRecordCount; // Sequenced
    property OnDetailHasChildren: TcxDBDataDetailHasChildrenEvent read FOnDetailHasChildren write FOnDetailHasChildren;
  end;

var
  cxDetailFilterControllers: TcxDBAdapterList;

function GetValueTypeClassByField(AField: TField): TcxValueTypeClass;

implementation

uses
  TypInfo, cxDataConsts;

type
  TDataSetAccess = class(TDataSet);
  TcxCustomDataControllerAccess = class(TcxCustomDataController);
  TcxCustomDataControllerInfoAccess = class(TcxCustomDataControllerInfo);
  TcxDataControllerSearchAccess = class(TcxDataControllerSearch);
  TcxCustomDataFieldListAccess = class(TcxCustomDataFieldList);

  { TcxKeys }

  TcxSaveObject = class;

  PcxKeyInfo = ^TcxKeyInfo;
  TcxKeyInfo = record
    Key: Variant;
  end;

  PcxSelectedKeyInfo = ^TcxSelectedKeyInfo;
  TcxSelectedKeyInfo = record
    Key: Variant;
    SelectedIndex: Integer;
  end;

  PcxDetailKeyInfo = ^TcxDetailKeyInfo;
  TcxDetailKeyInfo = record
    Key: Variant;
    ActiveRelationIndex: Integer;
    SubDetail: TcxSaveObject;
  end;

  TcxKeys = class
  private
    FDataController: TcxDBDataController;
    FKeyFields: TList;
    FKeys: TList;
    procedure SetDataController(Value: TcxDBDataController);
  protected
    procedure DoRestore; virtual;
    procedure DoSave; virtual;
    function Find(ARecordIndex: Integer; var AIndex: Integer): Boolean;
    procedure FreeKeyInfo(P: Pointer); virtual;
    property DataController: TcxDBDataController read FDataController write SetDataController;
    property Keys: TList read FKeys;
  public
    constructor Create; 
    destructor Destroy; override;
    procedure Clear; virtual;
    procedure Delete(AIndex: Integer);
    procedure Restore(ADataController: TcxDBDataController);
    procedure Save(ADataController: TcxDBDataController);
  end;

  TcxDetailKeys = class(TcxKeys)
  protected
    procedure DoRestore; override;
    procedure DoSave; override;
    procedure FreeKeyInfo(P: Pointer); override;
  end;

  TcxSelectedKeys = class(TcxKeys)
  protected
    procedure DoRestore; override;
    procedure DoSave; override;
    procedure FreeKeyInfo(P: Pointer); override;
  end;

  TcxSaveObject = class
  private
    FDetailKeys: TcxDetailKeys;
    FSelectedKeys: TcxSelectedKeys;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Restore(ADataController: TcxDBDataController);
    procedure Save(ADataController: TcxDBDataController);
  end;

var
  DBDataProviders: TList;

function CompareByKey(AItem1, AItem2: Pointer): Integer;
begin
  Result := VarCompare(PcxKeyInfo(AItem1)^.Key, PcxKeyInfo(AItem2)^.Key);
end;

procedure GetInternalKeyFields(ADataField: TcxDBDataField; AList: TList);
var
  I: Integer;
begin
  if Assigned(ADataField) then
  begin
    if ADataField.FieldCount = 0 then
      AList.Add(ADataField)
    else
      for I := 0 to ADataField.FieldCount - 1 do
        AList.Add(ADataField.Fields[I]);
  end;
end;

function GetValueTypeClassByField(AField: TField): TcxValueTypeClass;
begin
  if AField = nil then
    Result := TcxStringValueType
  else
  begin
    case AField.DataType of
      ftString:
        Result := TcxStringValueType;
      ftWideString:
        Result := TcxWideStringValueType;
      ftSmallint:
        Result := TcxSmallintValueType;
      ftInteger, ftAutoInc:
        Result := TcxIntegerValueType;
      ftWord:
        Result := TcxWordValueType;
      ftBoolean:
        Result := TcxBooleanValueType;
      ftFloat:
        Result := TcxFloatValueType;
      ftCurrency, ftBCD:
        Result := TcxCurrencyValueType;
      ftDate, ftTime, ftDateTime:
        Result := TcxDateTimeValueType;
    {$IFDEF DELPHI6}
      ftFMTBcd:
        Result := TcxFMTBcdValueType;
      ftLargeint:
        Result := TcxLargeIntValueType;
    {$ENDIF}
    else
      Result := TcxVariantValueType;
    end;
  end;
end;

{$IFNDEF DELPHI5}

function IsPublishedProp(Instance: TObject; const PropName: string): Boolean;
begin
  Result := GetPropInfo(Instance.ClassInfo, PropName) <> nil;
end;

function GetObjectProp(Instance: TObject; const PropName: string): TObject;
var
  PropInfo: PPropInfo;
begin
  Result := nil;
  PropInfo := TypInfo.GetPropInfo(Instance.ClassInfo, PropName);
  if (PropInfo <> nil) and (PropInfo^.PropType^.Kind = tkClass) then
    Result := TObject(GetOrdProp(Instance, PropInfo));
end;

{$ENDIF}

{ TcxKeys }

constructor TcxKeys.Create;
begin
  inherited Create;
  FKeyFields := TList.Create;
  FKeys := TList.Create;
end;

destructor TcxKeys.Destroy;
begin
  Clear;
  FKeyFields.Free;
  FKeys.Free;
  inherited Destroy;
end;

procedure TcxKeys.Clear;
var
  I: Integer;
begin
  for I := 0 to Keys.Count - 1 do
    FreeKeyInfo(Keys[I]);
  Keys.Clear;
end;

procedure TcxKeys.Delete(AIndex: Integer);
begin
  FreeKeyInfo(Keys[AIndex]);
  Keys.Delete(AIndex);
end;

procedure TcxKeys.Restore(ADataController: TcxDBDataController);
begin
  DataController := ADataController;
  if Keys.Count > 0 then
  begin
    DoRestore;
    Clear;
  end;
end;

procedure TcxKeys.Save(ADataController: TcxDBDataController);
begin
  Clear;
  DataController := ADataController;
  DoSave;
  Keys.Sort(CompareByKey);
end;

procedure TcxKeys.DoRestore;
begin
end;

procedure TcxKeys.DoSave;
begin
end;

function TcxKeys.Find(ARecordIndex: Integer; var AIndex: Integer): Boolean;
var
  I: Integer;
  P: PcxKeyInfo;
begin
  Result := False; // TODO: b-find
  for I := 0 to Keys.Count - 1 do
  begin
    P := PcxKeyInfo(Keys[I]);
    if VarEquals(DataController.GetInternalRecordId(ARecordIndex, FKeyFields), P^.Key) then // TODO: remove local var
    begin
      AIndex := I;
      Result := True;
      Break;
    end;
  end;
end;

procedure TcxKeys.FreeKeyInfo(P: Pointer);
begin
end;

procedure TcxKeys.SetDataController(Value: TcxDBDataController);
begin
  FDataController := Value;
  FKeyFields.Clear;
  DataController.GetKeyFields(FKeyFields);
end;

{ TcxDetailKeys }

procedure TcxDetailKeys.DoRestore;
var
  I, J: Integer;
  PDetailKeyInfo: PcxDetailKeyInfo;
  ADetailLinkObject: TObject;
  ADataController: TcxCustomDataController;
begin
  for I := 0 to DataController.RecordCount - 1 do
  begin
    if Find(I, J) then
    begin
      PDetailKeyInfo := PcxDetailKeyInfo(Keys[J]);
      DataController.ChangeDetailExpanding(I, True);
      DataController.ChangeDetailActiveRelationIndex(I, PDetailKeyInfo^.ActiveRelationIndex);
      if PDetailKeyInfo^.SubDetail <> nil then
      begin
        if DataController.GetDetailExpanding(I) and
          (DataController.GetDetailActiveRelationIndex(I) = PDetailKeyInfo^.ActiveRelationIndex) then
        begin
          // WARNING: GetDetailDataController->nil !
          ADetailLinkObject := DataController.GetDetailLinkObject(I, PDetailKeyInfo^.ActiveRelationIndex);
          if ADetailLinkObject <> nil then
          begin
            ADataController := DataController.GetDetailDataControllerByLinkObject(ADetailLinkObject);
            if ADataController is TcxDBDataController then
              PDetailKeyInfo^.SubDetail.Restore(ADataController as TcxDBDataController);
          end;
        end;
      end;
    end;
  end;
end;

procedure TcxDetailKeys.DoSave;
var
  I: Integer;
  PDetailKeyInfo: PcxDetailKeyInfo;
  ADetailLinkObject: TObject;
  ADataController: TcxCustomDataController;
begin
  for I := 0 to DataController.RecordCount - 1 do
  begin
    if DataController.GetDetailExpanding(I) then
    begin
      New(PDetailKeyInfo);
      Keys.Add(PDetailKeyInfo);
      PDetailKeyInfo^.Key := DataController.GetInternalRecordId(I, FKeyFields);
      PDetailKeyInfo^.ActiveRelationIndex := DataController.GetDetailActiveRelationIndex(I);
      PDetailKeyInfo^.SubDetail := TcxSaveObject.Create;
      // WARNING: GetDetailDataController->nil !
      ADetailLinkObject := DataController.GetDetailLinkObject(I, PDetailKeyInfo^.ActiveRelationIndex);
      if ADetailLinkObject <> nil then
      begin
        ADataController := DataController.GetDetailDataControllerByLinkObject(ADetailLinkObject);
        if ADataController is TcxDBDataController then
          PDetailKeyInfo^.SubDetail.Save(ADataController as TcxDBDataController);
      end;
    end;
  end;
end;

procedure TcxDetailKeys.FreeKeyInfo(P: Pointer);
begin
  if PcxDetailKeyInfo(P).SubDetail <> nil then
    PcxDetailKeyInfo(P).SubDetail.Free;
  Dispose(PcxDetailKeyInfo(P));
end;

{ TcxSelectedKeys }

procedure TcxSelectedKeys.DoRestore;
var
  I, J: Integer;
  ASelection: TcxDataSelection;
  P: PcxSelectedKeyInfo;
begin
  ASelection := TcxCustomDataControllerInfoAccess(DataController.DataControllerInfo).Selection;
  if ASelection.Count = 0 then Exit;
  // TODO: Level check <> -1
  for I := 0 to DataController.RecordCount - 1 do
  begin
    if Find(I, J) then
    begin
      P := PcxSelectedKeyInfo(Keys[J]);
      if P^.SelectedIndex < ASelection.Count then
        ASelection[P^.SelectedIndex].RecordIndex := I;
      Delete(J);
    end;
  end;

  for I := 0 to Keys.Count - 1 do
  begin
    P := PcxSelectedKeyInfo(Keys[I]);
    if (0 <= P^.SelectedIndex) and (P^.SelectedIndex < ASelection.Count) then
      ASelection[P^.SelectedIndex].RecordIndex := -1;
  end;

  for I := ASelection.Count - 1 downto 0 do
    if ASelection[I]^.RecordIndex = -1 then
      ASelection.Delete(I);
end;

procedure TcxSelectedKeys.DoSave;
var
  ASelection: TcxDataSelection;
  I: Integer;
  PSelectionInfo: PcxDataSelectionInfo;
  P: PcxSelectedKeyInfo;
begin
  ASelection := TcxCustomDataControllerInfoAccess(DataController.DataControllerInfo).Selection;
  for I := 0 to ASelection.Count - 1 do
  begin
    PSelectionInfo := ASelection[I];
    if (PSelectionInfo^.Level <> -1) and
      (PSelectionInfo^.RecordIndex < DataController.RecordCount) then
    begin
      New(P);
      Keys.Add(P);
      P^.SelectedIndex := I;
      P^.Key := DataController.GetInternalRecordId(PSelectionInfo^.RecordIndex, FKeyFields);
    end;
  end;
  TcxCustomDataControllerInfoAccess(DataController.DataControllerInfo).SaveExpanding([eisExpanded, eisSelected]);
end;

procedure TcxSelectedKeys.FreeKeyInfo(P: Pointer);
begin
  Dispose(PcxSelectedKeyInfo(P));
end;

{ TcxSaveObject }

constructor TcxSaveObject.Create;
begin
  inherited Create;
  FDetailKeys := TcxDetailKeys.Create;
  FSelectedKeys := TcxSelectedKeys.Create;
end;

destructor TcxSaveObject.Destroy;
begin
  FSelectedKeys.Free;
  FDetailKeys.Free;
  inherited Destroy;
end;

procedure TcxSaveObject.Restore(ADataController: TcxDBDataController);
begin
  if ADataController.IsCreatingLinkObject then Exit;
  if ADataController.IsKeyNavigation then
  begin
    FDetailKeys.Restore(ADataController);
    FSelectedKeys.Restore(ADataController);
  end
  else
    ADataController.CheckSelectedCount(-1);
end;

procedure TcxSaveObject.Save(ADataController: TcxDBDataController);
begin
  if ADataController.IsCreatingLinkObject or
    ADataController.IsDestroying then Exit;
  if ADataController.IsKeyNavigation then
  begin
    FDetailKeys.Save(ADataController);
    FSelectedKeys.Save(ADataController);
  end;
end;

{ TcxDBProviderDetailFilterAdapter }

function TcxDBProviderDetailFilterAdapter.IsCurrentQuery(ADataSet: TDataSet;
  const AParamNames: string; const AParamValues: Variant): Boolean;
var
  AParams: TParams;
begin
  Result := False;
  if IsPublishedProp(ADataSet, 'Params') then
  begin
    AParams := GetObjectProp(ADataSet, 'Params') as TParams;
    if AParams <> nil then
    begin
      if VarEquals(AParams.ParamValues[AParamNames], AParamValues) then
        Result := True;
    end;
  end;
end;

procedure TcxDBProviderDetailFilterAdapter.ReopenSQL(ADataSet: TDataSet;
  const AParamNames: string; const AParamValues: Variant; var AReopened: Boolean);
var
  AParams: TParams;
begin
  if IsPublishedProp(ADataSet, 'Params') then
  begin
    AParams := GetObjectProp(ADataSet, 'Params') as TParams;
    if AParams <> nil then
    begin
      if VarEquals(AParams.ParamValues[AParamNames], AParamValues) then
        ADataSet.First // TODO: Update method - for Query with Post
      else
      begin
        ADataSet.DisableControls;
        try
          ADataSet.Active := False;
          AParams.ParamValues[AParamNames] := AParamValues;
          ADataSet.Active := True;
        finally
          ADataSet.EnableControls;
        end;
        AReopened := True; // set Flag if Query reopened
      end;
    end;
  end;
end;

procedure TcxDBProviderDetailFilterAdapter.SetFilter(ADataSet: TDataSet;
  const AMasterDetailKeyFieldNames: string; const AMasterDetailKeyValues: Variant;
  AIsSQLMode: Boolean; var AReopened: Boolean);
begin
  if AIsSQLMode then
    ReopenSQL(ADataSet, AMasterDetailKeyFieldNames, AMasterDetailKeyValues, AReopened)
  else
    ADataSet.Locate(AMasterDetailKeyFieldNames, AMasterDetailKeyValues, []); // must be sort by Detail Keys
end;

{ TcxDBDataModeController }

constructor TcxDBDataModeController.Create(ADataController: TcxDBDataController);
begin
  inherited Create;
  FDetailInSyncMode := True;
  FDataController := ADataController;
  FGridModeBufferCount := 0;
  FSyncInsert := True;
  FSyncMode := True;
end;

procedure TcxDBDataModeController.Assign(Source: TPersistent);
begin
  if Source is TcxDBDataModeController then
  begin
    DetailInSQLMode := TcxDBDataModeController(Source).DetailInSQLMode;
    DetailInSyncMode := TcxDBDataModeController(Source).DetailInSyncMode;
    GridMode := TcxDBDataModeController(Source).GridMode;
    GridModeBufferCount := TcxDBDataModeController(Source).GridModeBufferCount;
    SmartRefresh := TcxDBDataModeController(Source).SmartRefresh;
    SyncInsert := TcxDBDataModeController(Source).SyncInsert;
    SyncMode := TcxDBDataModeController(Source).SyncMode;
    OnDetailFirst := TcxDBDataModeController(Source).OnDetailFirst;
    OnDetailIsCurrentQuery := TcxDBDataModeController(Source).OnDetailIsCurrentQuery;
  end
  else
    inherited Assign(Source);
end;

function TcxDBDataModeController.DetailIsCurrentQuery(const AMasterDetailKeyFieldNames: string;
  const AMasterDetailKeyValues: Variant): Boolean;
var
  ADetailFilterAdapter: TcxDBProviderDetailFilterAdapter;
begin
  if Assigned(FOnDetailIsCurrentQuery) then
    Result := FOnDetailIsCurrentQuery(Self, DataController.DataSet,
      AMasterDetailKeyFieldNames, AMasterDetailKeyValues)
  else
  begin
    ADetailFilterAdapter := DataController.GetDetailFilterAdapter;
    Result := ADetailFilterAdapter.IsCurrentQuery(DataController.DataSet,
      AMasterDetailKeyFieldNames, AMasterDetailKeyValues);
  end;
end;

procedure TcxDBDataModeController.DoDetailFirst(const AMasterDetailKeyFieldNames: string;
  const AMasterDetailKeyValues: Variant; var AReopened: Boolean);
var
  ADetailFilterAdapter: TcxDBProviderDetailFilterAdapter;
begin
  AReopened := False;
  if Assigned(FOnDetailFirst) then
    FOnDetailFirst(Self, DataController.DataSet, AMasterDetailKeyFieldNames,
      AMasterDetailKeyValues, AReopened)
  else
  begin
    ADetailFilterAdapter := DataController.GetDetailFilterAdapter;
    ADetailFilterAdapter.SetFilter(DataController.DataSet, AMasterDetailKeyFieldNames,
      AMasterDetailKeyValues, DetailInSQLMode, AReopened);
  end;
end;

procedure TcxDBDataModeController.SetGridMode(Value: Boolean);
var
  APrevGridMode: Boolean;
begin
  APrevGridMode := DataController.IsGridMode;
  if FGridMode <> Value then
  begin
    FGridMode := Value;
    if DataController.IsGridMode <> APrevGridMode then
      DataController.RestructData;
  end;
end;

procedure TcxDBDataModeController.SetGridModeBufferCount(Value: Integer);
begin
  if Value < 0 then Value := 0;
  if FGridModeBufferCount <> Value then
  begin
    FGridModeBufferCount := Value;
    DataController.UpdateGridModeBufferCount;
  end;
end;

procedure TcxDBDataModeController.SetSmartRefresh(Value: Boolean);
begin
  if FSmartRefresh <> Value then
  begin
    FSmartRefresh := Value;
    if not DataController.Provider.IsGridMode then
      DataController.Provider.DataScrolled(0);
  end;
end;

procedure TcxDBDataModeController.SetSyncMode(Value: Boolean);
begin
  if FSyncMode <> Value then
  begin
    FSyncMode := Value;
    if DataController.Provider.IsActive then
      DataController.Provider.DataScrolled(0);
  end;
end;

{ TcxDBDataSelection }

constructor TcxDBDataSelection.Create(ADataController: TcxCustomDataController);
begin
  inherited Create(ADataController);
  FBookmarks := TStringList.Create;
end;

destructor TcxDBDataSelection.Destroy;
begin
  FBookmarks.Free;
  FBookmarks := nil;
  inherited Destroy;
end;

function TcxDBDataSelection.FindByRowIndex(ARowIndex: Integer; var AIndex: Integer): Boolean;
begin
  if DataController.IsGridMode then
    Result := FindBookmark(GetRowBookmark(ARowIndex), AIndex)
  else
    Result := inherited FindByRowIndex(ARowIndex, AIndex);
end;

procedure TcxDBDataSelection.SelectAll;
begin
  if DataController.IsGridMode and Assigned(DataController.DataSet) then
  begin
    with DataController.Provider do
    begin
      Freeze;
      try
        SavePos;
        First;
        InternalClear;
        try
          while not IsEOF do
          begin
            FBookmarks.Add(DataSet.Bookmark);
            Next;
          end;
          SyncCount;
        except
          FBookmarks.Clear;
          SyncCount;
          raise;
        end;
        RestorePos;
      finally
        Unfreeze;
        Changed;
        TcxCustomDataControllerInfoAccess(DataController.DataControllerInfo).CheckChanges;
      end;
    end;
  end;
end;

procedure TcxDBDataSelection.SelectFromAnchor(AToBookmark: TBookmarkStr; AKeepSelection: Boolean);

  function CheckBookmarks(const ABkm1, ABkm2: TBookmarkStr; ADirectionDown: Boolean): Boolean;
  begin
    Result := False;
    if AKeepSelection or (FBookmarks.Count = 0) then Exit;
    with DataController.Provider do
    begin
      if CompareBookmarks(ABkm1, ABkm2) = 0 then
      begin
        FBookmarks.Clear;
        FBookmarks.Add(ABkm1);
        Result := True;
      end
      else
        if ADirectionDown then
        begin
          if (FBookmarks.Count > 1) and
            (CompareBookmarks(FBookmarks[FBookmarks.Count - 2], ABkm2) = 0) then // dec last
          begin
            if CompareBookmarks(FBookmarks[0], ABkm1) = 0 then
            begin
              FBookmarks.Delete(FBookmarks.Count - 1);
              Result := True;
            end;
          end
          else
          begin
            DataSet.Bookmark := ABkm2;
            DataSet.Prior;
            if CompareBookmarks(FBookmarks[FBookmarks.Count - 1], DataSet.Bookmark) = 0 then // inc
            begin
              if CompareBookmarks(FBookmarks[0], ABkm1) = 0 then
              begin
                FBookmarks.Add(ABkm2);
                Result := True;
              end;
            end;
          end;
        end
        else
        begin
          if (FBookmarks.Count > 1) and
            (CompareBookmarks(FBookmarks[1], ABkm1) = 0) then // dec top
          begin
            if CompareBookmarks(FBookmarks[FBookmarks.Count - 1], ABkm2) = 0 then
            begin
              FBookmarks.Delete(0);
              Result := True;
            end;
          end
          else
          begin
            DataSet.Bookmark := ABkm1;
            DataSet.Next;
            if CompareBookmarks(FBookmarks[0], DataSet.Bookmark) = 0 then // inc
            begin
              if CompareBookmarks(FBookmarks[FBookmarks.Count - 1], ABkm2) = 0 then
              begin
                FBookmarks.Insert(0, ABkm1);
                Result := True;
              end;  
            end;
          end;
        end;
    end;
  end;

  procedure LoadBookmarks(const ABkm1, ABkm2: TBookmarkStr);
  var
    ABkm: TBookmarkStr;
    ACheckNeeded, AFound: Boolean;
    I, C, AIndex1, AIndex2: Integer;
  begin
    with DataController.Provider do
    begin
      if not AKeepSelection then
        FBookmarks.Clear;
      try
        ACheckNeeded := FBookmarks.Count > 0;
        if ACheckNeeded then
        begin
          FindBookmark(ABkm1, AIndex1);
          FindBookmark(ABkm2, AIndex2);
          if AIndex1 = FBookmarks.Count then
            ACheckNeeded := False;
        end;
        DataSet.Bookmark := ABkm1;
        while not IsEOF do
        begin
          ABkm := DataSet.Bookmark;
          if ACheckNeeded then
          begin
            AFound := False;
            for I := AIndex1 to AIndex2 do
            begin
              if I >= FBookmarks.Count then
                Break;
              C := CompareBookmarks(ABkm, FBookmarks[I]);
              if C < 0 then
              begin
                FBookmarks.Insert(I, ABkm);
                Inc(AIndex1);
                Inc(AIndex2);
                AFound := True;
                Break;
              end
              else
                if C = 0 then
                begin
                  Inc(AIndex1);
                  AFound := True;
                  Break;
                end;
            end;
            if not AFound then
              FBookmarks.Add(ABkm);
          end
          else
            FBookmarks.Add(ABkm);
          if CompareBookmarks(ABkm, ABkm2) = 0 then
            Break;
          Next;
        end;
      except
        FBookmarks.Clear;
        SyncCount;
        raise;
      end;
    end;
  end;

var
  ABkm1, ABkm2: TBookmarkStr;
  ADirectionDown: Boolean;
begin
  // TODO: optimize - Do Selection (up/down)
  if DataController.IsGridMode and Assigned(DataController.DataSet) then
  begin
    with DataController.Provider do
    begin
      if (DataSet.State = dsInsert) and DataSet.Eof then
        Exit; 
      Freeze;
      try
        SavePos;
        ABkm1 := FAnchorBookmark;
        ABkm2 := AToBookmark;
        ADirectionDown := CompareBookmarks(ABkm1, ABkm2) < 0;
        if not ADirectionDown then
        begin
          ABkm2 := FAnchorBookmark;
          ABkm1 := AToBookmark;
        end;
        // check - select shift + up/down
        if not CheckBookmarks(ABkm1, ABkm2, ADirectionDown) then
          LoadBookmarks(ABkm1, ABkm2);
        SyncCount;
        RestorePos;
      finally
        Unfreeze;
        Changed;
        TcxCustomDataControllerInfoAccess(DataController.DataControllerInfo).CheckChanges;
      end;
    end;
  end;
end;

procedure TcxDBDataSelection.ClearAnchor;
begin
  inherited ClearAnchor;
  FAnchorBookmark := '';
end;

function TcxDBDataSelection.CompareBookmarks(const AItem1, AItem2: TBookmarkStr): Integer;
begin
  if not DataController.Provider.DataLink.Active then
    Result := -1
  else
    Result := DataController.Dataset.CompareBookmarks(TBookmark(AItem1), TBookmark(AItem2));
end;

procedure TcxDBDataSelection.InternalAdd(AIndex, ARowIndex, ARecordIndex, ALevel: Integer);
begin
  inherited InternalAdd(AIndex, ARowIndex, ARecordIndex, ALevel);
  if not DataController.IsGridMode or FInSelectAll then Exit;
  FBookmarks.Insert(AIndex, GetRowBookmark(ARowIndex));
end;

procedure TcxDBDataSelection.InternalClear;
begin
  inherited InternalClear;
  if FBookmarks <> nil then
    FBookmarks.Clear;
end;

procedure TcxDBDataSelection.InternalDelete(AIndex: Integer);
begin
  inherited InternalDelete(AIndex);
  if not DataController.IsGridMode or FInSelectAll then Exit;
  if CompareBookmarks(FBookmarks[AIndex], FAnchorBookmark) = 0 then
    ClearAnchor;
  FBookmarks.Delete(AIndex);
end;

function TcxDBDataSelection.FindBookmark(const ABookmark: TBookmarkStr; var AIndex: Integer): Boolean;
var
  L, H, I, C: Integer;
begin
  AIndex := 0;
  Result := False;
  L := 0;
  H := FBookmarks.Count - 1;
  if L <= H then
    repeat
      I := (L + H) div 2;
      C := CompareBookmarks(FBookmarks[I], ABookmark);
      if C = 0 then
      begin
        AIndex := I;
        Result := True;
        Break;
      end
      else
        if C < 0 then
          L := I + 1
        else
          H := I - 1;
      if L > H then
      begin
        AIndex := L;
        Break;
      end;
    until False;
end;

function TcxDBDataSelection.GetRowBookmark(ARowIndex: Integer): TBookmarkStr;
var
  APrevActiveRecord: Integer;
begin
  Result := '';
  if not DataController.IsGridMode then Exit;
  APrevActiveRecord := DataController.Provider.DataLink.ActiveRecord;
  try
    DataController.Provider.DataLink.ActiveRecord := ARowIndex;
    Result := DataController.DataSet.Bookmark;
  finally
    DataController.Provider.DataLink.ActiveRecord := APrevActiveRecord;
  end;
end;

function TcxDBDataSelection.RefreshBookmarks: Boolean;
var
  I: Integer;
  ADataSet: TDataSet;
begin
  Result := False;
  if not DataController.IsGridMode then Exit;
  ADataSet := DataController.DataSet;
  if Assigned(ADataSet) then
    for I := Count - 1 downto 0 do
      if (FBookmarks[I] = '') or
        not ADataSet.BookmarkValid(TBookmark(FBookmarks[I])) then
        begin
          Result := True;
          Delete(I);
        end;
end;

procedure TcxDBDataSelection.SyncCount;
begin
  FInSelectAll := True;
  try
    SetInternalCount(FBookmarks.Count);
  finally
    FInSelectAll := False;
  end;  
end;

function TcxDBDataSelection.GetDataController: TcxDBDataController;
begin
  Result := inherited DataController as TcxDBDataController;
end;

{ TcxDBDataLink }

constructor TcxDBDataLink.Create(AProvider: TcxDBDataProvider);
begin
  inherited Create;
  FProvider := AProvider;
  VisualControl := True;
end;

procedure TcxDBDataLink.ActiveChanged;
begin
  Provider.FActiveChanging := True;
  try
    Provider.ActiveChanged(Active);
  finally
    Provider.FActiveChanging := False;
  end;
end;

{$IFDEF DELPHI7}
procedure TcxDBDataLink.DataEvent(Event: TDataEvent; Info: Integer);
begin
  inherited DataEvent(Event, Info);
  if (Event = deDisabledStateChange) and not Boolean(Info) then
    FLayoutChangedFlag := True;
end;
{$ENDIF}

procedure TcxDBDataLink.DataSetChanged;

  procedure DoInsertingRecord;
  begin
    Provider.FInInserting := True;
    try
      Provider.InsertingRecord(Provider.IsEOF);
    finally
      Provider.FInInserting := False;
    end;
  end;

begin
  {$IFDEF DELPHI7}
  if FLayoutChangedFlag then
  begin
    LayoutChanged;
    Exit;
  end;
  {$ENDIF}
  if Provider.IsOtherDataControllerUpdating then Exit; // TODO: check Owner!
  if Provider.IsOtherDetailChanged then Exit;
  if Provider.IsDataSetBusy then
    DataSetScrolled(0)
  else
  begin
    if Provider.IsGridMode then
    begin
      Provider.FInUpdateGridMode := True;
      try
        Provider.DataController.BeginUpdate;
        try
          Provider.UpdateGridMode;
          if Provider.DataController.MultiSelect then
            Provider.DataController.DBSelection.RefreshBookmarks;
          Provider.DataController.CheckBookmarkValid(-1);  
          if DataSet.State = dsInsert then
            DoInsertingRecord;
        finally
          Provider.DataController.EndUpdate;
        end;
      finally
        Provider.FInUpdateGridMode := False;
      end;
//      if DataSet.State = dsInsert then
//        Provider.InsertingRecord(Provider.IsEOF);
    end
    else
    begin
      if not (DataSet.State in dsEditModes) then
      begin
        if Provider.IsSmartRefresh then
        begin
          Provider.SmartDataChanged;
          DataSetScrolled(0);
        end
        else
          Provider.DataChanged(dcTotal, -1, -1);
        Provider.ResetSmartRefresh;
      end
      else
        if DataSet.State = dsInsert then
        begin
          if (not Provider.DataController.IsDetailMode or Provider.IsDataSetCurrent) and
            Provider.IsSyncInsert and not Provider.FInInserting then
            DoInsertingRecord;
        end;
    end;
  end;
end;

procedure TcxDBDataLink.DataSetScrolled(Distance: Integer);
begin
  Provider.DataScrolled(Distance);
end;

procedure TcxDBDataLink.EditingChanged;
begin
  if not Active or not (DataSet.State in dsEditModes) then
  begin
    if (Provider.EditingRecordIndex <> cxNullEditingRecordIndex) and
      (Provider.EditingRecordIndex = Provider.DataController.NewItemRecordIndex) then
    begin
      if Provider.FUpdatingRecordIsInserting then
      begin
        Provider.FUpdatingNewRecordIndex := Provider.DataController.AppendRecord;
        Provider.DataController.CopyRecord(Provider.DataController.NewItemRecordIndex,
          Provider.FUpdatingNewRecordIndex);
      end;
    end;
    Provider.ResetEditing;
  end
  else
    if DataSet.State = dsEdit then
      Provider.EditingRecord;
end;

procedure TcxDBDataLink.FocusControl(Field: TFieldRef);

  function FindItemIndex(AField: TField): Integer;
  var
    I: Integer;
    ADataField: TcxDBDataField;
  begin
    Result := -1;
    for I := 0 to Provider.DataController.Fields.Count - 1 do
    begin
      ADataField := Provider.DataController.DBFields[I];
      if not ADataField.IsInternal and (ADataField.Field = AField) then
      begin
        Result := I;
        Break;
      end;
    end;
  end;

var
  ADone: Boolean;
  AItemIndex: Integer;
begin
  if Assigned(Field) and Assigned(Field^) then
  begin
    ADone := False;
    AItemIndex := FindItemIndex(Field^);
    if (AItemIndex <> -1) and (AItemIndex < Provider.DataController.GetItemCount) then
    begin
      Provider.DataController.FocusControl(AItemIndex, ADone);
      if ADone then
        Field^ := nil;
    end;    
  end;
end;

procedure TcxDBDataLink.LayoutChanged;
begin
  Provider.LayoutChanged([lcStructure, lcData]);
  {$IFDEF DELPHI7}
  FLayoutChangedFlag := False;
  {$ENDIF}
end;

procedure TcxDBDataLink.RecordChanged(Field: TField);
begin
  Provider.RecordChanged(Field);
end;

procedure TcxDBDataLink.UpdateData;
begin
  if Provider.IsChanging then
    Provider.DataController.UpdateData;
  if Provider.IsSmartRefresh then
    RecordChanged(nil);
  Provider.ResetChanging;
end;

{ TcxDBDataProvider }

constructor TcxDBDataProvider.Create(ADataController: TcxCustomDataController);
begin
  inherited Create(ADataController);
  if DBDataProviders = nil then
    DBDataProviders := TList.Create;
  DBDataProviders.Add(Self);
  FDataLink := TcxDBDataLink.Create(Self);
  FUpdatingRecordIndex := cxNullEditingRecordIndex;
  FUpdatingNewRecordIndex := -1;
  FListeners := TList.Create;
end;

destructor TcxDBDataProvider.Destroy;
begin
  RemoveFromListeners;
  FListeners.Free;
  FListeners := nil;
  FDataLink.Free;
  FDataLink := nil;
  DBDataProviders.Remove(Self);
  if DBDataProviders.Count = 0 then
  begin
    DBDataProviders.Free;
    DBDataProviders := nil;
  end;
  inherited Destroy;
end;

function TcxDBDataProvider.IsCanInitEditingBusy: Boolean;
var
  I: Integer;
  ADBDataProvider: TcxDBDataProvider;
begin
  Result := False;
  for I := 0 to DBDataProviders.Count - 1 do
  begin
    ADBDataProvider := DBDataProviders[I];
    if (ADBDataProvider.DataSet = Self.DataSet) and
      ADBDataProvider.FInCanInitEditing then
    begin
      Result := True;
      Break;
    end;
  end;
end;

function TcxDBDataProvider.IsDataSetBusy: Boolean;
var
  I: Integer;
  ADBDataProvider: TcxDBDataProvider;
begin
  Result := False;
  for I := 0 to DBDataProviders.Count - 1 do
  begin
    ADBDataProvider := DBDataProviders[I];
    if {(ADBDataProvider <> Self) and}
      (ADBDataProvider.DataSet = Self.DataSet) and
       ((ADBDataProvider.LockCount <> 0) or ADBDataProvider.FInNotify or
        ((Self.IsKeyNavigation or Self.DataController.IsGridMode) and (ADBDataProvider.LocateCount <> 0))) then
    begin
      if ADBDataProvider.FInNotify then
      begin
        if not FPostLocateFlag then
          Result := True;
      end
      else
        if not FPostLocateFlag then
        begin
          Result := True;
          if Self.DataController.IsGridMode and (Self.DataController.LockGridModeNotifyCount <> 0) then
            Result := False;
        end;
      Break;
    end;
  end;
end;

function TcxDBDataProvider.IsDetailDataSetBusy: Boolean;
var
  I: Integer;
  ADBDataProvider: TcxDBDataProvider;
begin
  Result := False;
  for I := 0 to DBDataProviders.Count - 1 do
  begin
    ADBDataProvider := DBDataProviders[I];
    if (ADBDataProvider.DataSet = Self.DataSet) and
      ((ADBDataProvider.LockCount <> 0){ or ADBDataProvider.FInFirst}) and
      ADBDataProvider.DataController.IsDetailMode {ADBDataProvider.FInFirst} then
    begin
      Result := True;
      Break;
    end;
  end;
end;

function TcxDBDataProvider.IsOtherDataControllerUpdating: Boolean;
var
  I: Integer;
  ADBDataProvider: TcxDBDataProvider;
begin
  Result := False;
  for I := 0 to DBDataProviders.Count - 1 do
  begin
    ADBDataProvider := DBDataProviders[I];
    if (ADBDataProvider <> Self) and
      (ADBDataProvider.DataSet = Self.DataSet) and
      ((ADBDataProvider.LockCount <> 0) or
       (Self.IsKeyNavigation and (ADBDataProvider.LocateCount <> 0))) then
    begin
      if ADBDataProvider.DataController.LockGridModeNotifyCount = 0 then
        ADBDataProvider.AddListener(Self);
      Result := True;
      Break;
    end;
  end;
end;

function TcxDBDataProvider.IsOtherDetailDataSetInInsert: Boolean;
var
  I: Integer;
  ADBDataProvider: TcxDBDataProvider;
begin
  Result := False;
  for I := 0 to DBDataProviders.Count - 1 do
  begin
    ADBDataProvider := DBDataProviders[I];
    if (ADBDataProvider <> Self) and (ADBDataProvider.DataSet = Self.DataSet) and
      ADBDataProvider.FInInsert then
    begin
      Result := True;
      Break;
    end;
  end;
end;

function TcxDBDataProvider.IsOtherDetailChanged: Boolean;
begin
  Result := DataController.IsOtherDetailChanged;
end;

function TcxDBDataProvider.IsUniDirectional: Boolean;
begin
  {$IFDEF DELPHI6}
  if Assigned(DataSet) and DataSet.IsUniDirectional then
    Result := True
  else
  {$ENDIF}
    Result := False;
end;

function TcxDBDataProvider.IsCustomDataSourceSupported: Boolean;
begin
  Result := False;
end;

function TcxDBDataProvider.IsGridMode: Boolean;
begin
  Result := DataController.DataModeController.GridMode and
    not IsUniDirectional and not FLoadAllNeeded and
    {not DataController.IsDetailMode}
    (DataController.DetailMode <> dcdmPattern);
end;

function TcxDBDataProvider.IsDataSource: Boolean;
begin
  Result := (DataSet <> nil) and (DataSet.State <> dsInactive);
end;

function TcxDBDataProvider.IsKeyNavigation: Boolean;
begin
  Result := DataController.IsKeyNavigation;
end;

function TcxDBDataProvider.IsOtherInsert: Boolean;
var
  I: Integer;
  ADBDataProvider: TcxDBDataProvider;
begin
  Result := False;
  for I := 0 to DBDataProviders.Count - 1 do
  begin
    ADBDataProvider := DBDataProviders[I];
    if (ADBDataProvider <> Self) and
      (ADBDataProvider.DataSet = Self.DataSet) and ADBDataProvider.FInInsert then
    begin
      Result := True;
      Break;
    end;
  end;
end;

function TcxDBDataProvider.IsSyncInsert: Boolean;
begin
  Result := DataController.DataModeController.SyncInsert
end;

function TcxDBDataProvider.IsSyncMode: Boolean;
begin
  Result := Assigned(DataSet) and DataSet.Active and
    (IsGridMode or DataController.DataModeController.SyncMode) and
    not IsUniDirectional;
  if DataController.IsDetailMode then
  begin
    if not DataController.DataModeController.DetailInSyncMode then
      Result := False
    else
      if DataController.DataModeController.DetailInSQLMode then
      begin
        if not IsDataSetCurrent then
          Result := False;
      end
      else
        if not (IsKeyNavigation or IsGridMode) then
          Result := False;
  end;
end;

function TcxDBDataProvider.IsActive: Boolean;
begin
  Result := Assigned(DataSet) and DataSet.Active; // WARNING: DataLink.Active <> DataSet.Active!
  Result := Result and not DataSet.ControlsDisabled;
end;

function TcxDBDataProvider.IsActiveDataSet: Boolean;
begin
  Result := Assigned(DataSet) and (DataSet.FieldCount > 0) and
    (DataSet.Active or not DataSet.DefaultFields);
end;

function TcxDBDataProvider.IsBOF: Boolean;
begin
  if Assigned(DataSet) then
    Result := DataSet.BOF
  else
    Result := inherited IsBOF;
end;

function TcxDBDataProvider.IsChanging: Boolean;
begin
  Result := inherited IsChanging;
end;

function TcxDBDataProvider.IsEditing: Boolean;
begin
  Result := Assigned(DataSet) and (DataSet.State in dsEditModes);
end;

function TcxDBDataProvider.IsEOF: Boolean;
begin
  if Assigned(DataSet) then
  begin
    with DataController do
    begin
      if IsDetailMode and not IsGridMode then
      begin
        if not VarIsEmpty(MasterDetailKeyValues) then
          Result := DataSet.EOF or
            (not (DataSet.State in dsEditModes) and
             not VarEquals(GetDataSetValues(DataSet, MasterDetailKeyFields), MasterDetailKeyValues))
        else
          Result := True;
      end                              
      else
        Result := DataSet.EOF;
    end;
  end
  else
    Result := inherited IsEOF;
end;

function TcxDBDataProvider.IsInserting: Boolean;
begin
  Result := Assigned(DataSet) and (DataSet.State = dsInsert);
end;

function TcxDBDataProvider.IsModified: Boolean;
begin
  Result := Assigned(DataSet) and DataSet.Modified;
end;

procedure TcxDBDataProvider.CorrectRecordIndex(ARecordIndex: Integer);
begin
  if Assigned(DataSet) then
    with TDataSetAccess(DataSet) do
    begin
      if not IsKeyNavigation and (FSavePosInfo.Bookmark <> '') and
        (CompareBookmarks(TBookmark(FSavePosInfo.Bookmark), TBookmark(Bookmark)) = 0) then
      FRecordIndex := ARecordIndex;
    end;
end;

procedure TcxDBDataProvider.First;
var
  AReopened: Boolean;
begin
  FInFirst := True;
  try
    inherited First;
    if Assigned(DataSet) then
      with DataController do
      begin
        if IsDetailMode and not IsGridMode then
        begin
          if not VarIsEmpty(MasterDetailKeyValues) then
          begin
            DataModeController.DoDetailFirst(MasterDetailKeyFieldNames,
              MasterDetailKeyValues, AReopened);
            if AReopened then
              SavePos;
            IsDataSetCurrent := True; 
          end;
        end
        else
          DataSet.First;
      end;
  finally
    FInFirst := False;
  end;
end;

procedure TcxDBDataProvider.Prev;
begin
  if Assigned(DataSet) then
    DataSet.Prior;
end;

procedure TcxDBDataProvider.Next;
begin
  if Assigned(DataSet) then
    DataSet.Next;
end;

procedure TcxDBDataProvider.Last;
begin
  if Assigned(DataSet) then
    DataSet.Last;
end;

procedure TcxDBDataProvider.MoveBy(ADistance: Integer);
begin
  if Assigned(DataSet) then
    DataSet.MoveBy(ADistance);
end;

procedure TcxDBDataProvider.Scroll(ADistance: Integer);
var
  ARecordIndex: Integer;
begin
  if not IsGridMode or (ADistance = 0) or not IsActive then Exit;
  if ADistance < 0 then
  begin
    ARecordIndex := (ADistance - DataLink.ActiveRecord);
    DataSet.MoveBy(ARecordIndex);
  end
  else
  begin
    ARecordIndex := DataLink.RecordCount - DataLink.ActiveRecord - 1 + ADistance;
    DataSet.MoveBy(ARecordIndex);
  end;
  DataController.CorrectPrevSelectionChangedInfo;
  DataController.SyncSelected(True);
end;

procedure TcxDBDataProvider.SavePos;
begin
  if Assigned(DataSet) then
    with TDataSetAccess(DataSet) do
    begin
      if BookmarkAvailable then
        FSavePosInfo.Bookmark := Bookmark
      else
        FSavePosInfo.Bookmark := '';
      FSavePosInfo.ActiveRecord := ActiveRecord; // save offset in DataSet buffer
      FSavePosInfo.BOF := BOF;
      FSavePosInfo.EOF := EOF;
    end;
end;

procedure TcxDBDataProvider.RestorePos;
begin
  if Assigned(DataSet) then
    with TDataSetAccess(DataSet) do
    begin
      if (FSavePosInfo.Bookmark <> '') and
        BookmarkValid(TBookmark(FSavePosInfo.Bookmark)) then
      begin
        try
          Bookmark := FSavePosInfo.Bookmark;
          // restore offset in DataSet buffer
          if ActiveRecord > FSavePosInfo.ActiveRecord then
          begin
            MoveBy(BufferCount - ActiveRecord - 1 + ActiveRecord - FSavePosInfo.ActiveRecord);
            MoveBy(FSavePosInfo.ActiveRecord - BufferCount + 1);
          end
          else
            if ActiveRecord < FSavePosInfo.ActiveRecord then
            begin
              MoveBy(-ActiveRecord + ActiveRecord - FSavePosInfo.ActiveRecord);
              MoveBy(FSavePosInfo.ActiveRecord);
            end;
          // BOF and EOF
          if FSavePosInfo.BOF and not BOF then Prior;
          if FSavePosInfo.EOF and not EOF then Next;
        except
          on EDatabaseError do;
        end;
      end;
    end;
end;

function TcxDBDataProvider.CanDelete: Boolean;
begin
  Result := CanModify and not DataSet.IsEmpty;
end;

function TcxDBDataProvider.CanInitEditing(ARecordIndex: Integer): Boolean;
begin
  FInCanInitEditing := True;
  try
    Result := DataLink.Edit;
    if Result then
      SetChanging;
  finally
    FInCanInitEditing := False;
  end;
end;

function TcxDBDataProvider.CanModify: Boolean;
begin
  Result := Assigned(DataSet) and DataSet.Active and DataSet.CanModify and IsSyncMode;
end;

procedure TcxDBDataProvider.Append;
begin
  if Assigned(DataSet) then
    AddNewRecord(DataSet.Append);
end;

procedure TcxDBDataProvider.Cancel;
begin
  if Assigned(DataSet) then
    DataSet.Cancel;
end;

procedure TcxDBDataProvider.Delete;
begin
  if Assigned(DataSet) then
  begin
    if IsSmartRefresh then
    begin
      FUpdatingPrevFocusedRecordIndex := DataController.GetFocusedRecordIndex;
      if FUpdatingPrevFocusedRecordIndex <> -1 then
      begin
        DataSet.Delete;
        if IsSmartRefresh then
        begin
          if FUpdatingPrevFocusedRecordIndex < DataController.RecordCount then
            DataController.DeleteRecord(FUpdatingPrevFocusedRecordIndex);
          DataController.UpdateFocused;
        end;
      end;
    end
    else
      DataSet.Delete;
  end;
end;

procedure TcxDBDataProvider.DeleteRecords(AList: TList);

  procedure InternalDelete(AUpdateFocused: Boolean);
  var
    ARecordIndex: Integer;
  begin
    if IsSmartRefresh then
    begin
      ARecordIndex := DataController.LocateRecordIndex(DataController.GetKeyFields);
      if ARecordIndex <> -1 then
      begin
        DataSet.Delete;
        DataController.DeleteRecord(ARecordIndex);
      end;
    end
    else
      DataSet.Delete;
  end;

  procedure DeleteWithLocate;
  var
    AKeyList: TList;
    AFieldList: TList;
    I: Integer;
    P: PVariant;
  begin
    AKeyList := TList.Create;
    AFieldList := TList.Create;
    try
      DataController.GetKeyFields(AFieldList);
      for I := 0 to AList.Count - 1 do
      begin
        New(P);
        P^ := DataController.GetInternalRecordId(Integer(AList[I]), AFieldList);
        AKeyList.Add(P);
      end;
//      for I := 0 to AKeyList.Count - 1 do
      for I := AKeyList.Count - 1 downto 0 do
      begin
        P := AKeyList[I];
        if DataSet.Locate(DataController.KeyFieldNames, P^, []) then
          InternalDelete(False);
      end;
      if IsSmartRefresh then
        DataController.UpdateFocused;
    finally
      for I := 0 to AKeyList.Count - 1 do
      begin
        P := AKeyList[I];
        Dispose(P);
      end;
      AKeyList.Free;
      AFieldList.Free;
    end;
  end;

  procedure DeleteWithMoveBy;
  var
    I, AAnchorRecordIndex: Integer;
  begin
    AAnchorRecordIndex := Integer(AList[AList.Count - 1]);
    if DataController.CanFocusRecord(AAnchorRecordIndex) then
    for I := AList.Count - 1 downto 0 do
    begin
      DataSet.MoveBy(Integer(AList[I]) - AAnchorRecordIndex);
      DataSet.Delete;
      AAnchorRecordIndex := Integer(AList[I]);
    end;
  end;

begin
  if Assigned(DataSet) then
  begin
    DataSet.DisableControls;
    try
      if IsKeyNavigation then
        DeleteWithLocate
      else
        DeleteWithMoveBy;
    finally
      DataSet.EnableControls;
    end;
  end;
end;

procedure TcxDBDataProvider.DeleteSelection;
var
  I: Integer;
  ASelection: TcxDBDataSelection;
begin
  if IsGridMode then
  begin
    if Assigned(DataSet) then
    begin
      ASelection := DataController.DBSelection;
      DataSet.DisableControls;
      try
        for I := ASelection.Count - 1 downto 0 do
        begin
          DataSet.Bookmark := ASelection.FBookmarks[I];
          DataSet.Delete;
          ASelection.Delete(I);
        end;
      finally
        DataSet.EnableControls;
      end;
    end;
  end
  else
    inherited DeleteSelection;
end;

procedure TcxDBDataProvider.Edit;
begin
  if Assigned(DataSet) then
    DataSet.Edit;
end;

function TcxDBDataProvider.GetEditValue(ARecordIndex: Integer; AField: TcxCustomDataField;
  AEditValueSource: TcxDataEditValueSource): Variant;
var
  ADataSetField: TField;
begin
  Result := Null;
  ADataSetField := TcxDBDataField(AField).Field;
  if Assigned(ADataSetField) then
  begin
    if AEditValueSource = evsText then
      Result := ADataSetField.Text
    else
      if (AEditValueSource = evsKey) and (ADataSetField.KeyFields <> '') then
        Result := ADataSetField.DataSet.FieldValues[ADataSetField.KeyFields]
      else
        if not ADataSetField.IsNull then
          Result := ADataSetField.Value; // evsValue
  end;
end;

procedure TcxDBDataProvider.Insert;
begin
  if Assigned(DataSet) then
    AddNewRecord(DataSet.Insert);
end;

procedure TcxDBDataProvider.Post;
begin
  if Assigned(DataSet) then
    DataSet.Post;
end;

procedure TcxDBDataProvider.PostEditingData;
begin
  DataLink.UpdateData;
end;

procedure TcxDBDataProvider.AssignItemValue(ARecordIndex: Integer; AField: TcxCustomDataField;
  const AValue: Variant); 
var
  ADBField: TcxDBDataField;
  ADataSetField: TField;
begin
  ADBField := AField as TcxDBDataField;
  ADataSetField := ADBField.Field;
  if Assigned(ADataSetField) then
  begin
    if ADBField.IsLookup and (ADataSetField.KeyFields <> '') then
      ADataSetField.DataSet.FieldValues[ADataSetField.KeyFields] := AValue
    else
      ADataSetField.Value := AValue;
  end;
end;

procedure TcxDBDataProvider.DoInitInsertingRecord(AInsertingRecordIndex: Integer;
  const AGroupValues: TcxDataSummaryValues);
begin
  if not (FInInsert or FInCanInitEditing or IsOtherInsert) then
  begin
    DataController.UpdateEditingRecord;
    Exit;
  end;
  inherited DoInitInsertingRecord(AInsertingRecordIndex, AGroupValues);
  if (dcoAssignMasterDetailKeys in DataController.Options) and DataController.IsDetailMode then
    SetDataSetValues(DataSet, DataController.MasterDetailKeyFields, DataController.MasterDetailKeyValues);
  DataController.DoInitInsertingRecord(AInsertingRecordIndex);
  DataController.UpdateEditingRecord;
end;

function TcxDBDataProvider.SetEditValue(ARecordIndex: Integer; AField: TcxCustomDataField;
  const AValue: Variant; AEditValueSource: TcxDataEditValueSource): Boolean;
var
  ADataSetField: TField;
begin
  Result := False;
  ADataSetField := TcxDBDataField(AField).Field;
  if Assigned(ADataSetField) then
  begin
    if (AEditValueSource = evsText) or Assigned(ADataSetField.OnSetText) then
      ADataSetField.Text := VarToStr(AValue)
    else
      if (AEditValueSource = evsKey) and (ADataSetField.KeyFields <> '') then
        ADataSetField.DataSet.FieldValues[ADataSetField.KeyFields] := AValue
      else
        ADataSetField.Value := AValue;
    Result := True;
  end;
end;

procedure TcxDBDataProvider.ActiveChanged(AActive: Boolean);
begin
  inherited ActiveChanged(AActive);
  if Assigned(DataSet) and not DataSet.Active and DataSet.DefaultFields then
    DataController.ResetDBFields;
end;

procedure TcxDBDataProvider.AddListener(AProvider: TcxDBDataProvider);
begin
  if FListeners.IndexOf(AProvider) = -1 then
    FListeners.Add(AProvider);
end;

procedure TcxDBDataProvider.BeginLocate;
begin
  inherited BeginLocate;
  if Assigned(DataSet) and (DataSet.State in dsEditModes) then
    SetPostLocateFlag;
end;

procedure TcxDBDataProvider.DataScrolled(ADistance: Integer);
begin
  if IsGridMode then
  begin
    FRecordIndex := DataLink.ActiveRecord;
    if ADistance <> 0 then
      DataController.InvalidateDataBuffer;
//TODO
    if not DataController.Relations.IsEmpty then
      DataController.CollapseDetails;
  end
  else
    Inc(FRecordIndex, ADistance);
  inherited DataScrolled(ADistance);
  if IsGridMode and DataController.IsSequenced then
    DataController.UpdateScrollBars;
end;

procedure TcxDBDataProvider.Freeze;
begin
  inherited Freeze;
  if Assigned(DataSet) then
  begin
    DataSet.DisableControls;
    if DataSet.Active and (DataSet.State in dsEditModes) then
    begin
      SetPostLocateFlag;
      DataSet.Cancel;
    end;
  end;
end;

procedure TcxDBDataProvider.LayoutChanged(ADataLayoutChanges: TcxDataLayoutChanges);
begin
  if IsDetailDataSetBusy then
  begin
    if IsActive then
      DataController.ResyncDBFields;
    Exit;
  end;
  inherited LayoutChanged(ADataLayoutChanges);
end;

procedure TcxDBDataProvider.RecordChanged(Field: TField);
var
  AIsDataSetCurrent: Boolean;
begin
  if DataController.IsDetailMode and DataController.DataModeController.DetailInSyncMode and
    not IsDataSetCurrent then
    AIsDataSetCurrent := False
  else
    AIsDataSetCurrent := True;
  if IsEditing and AIsDataSetCurrent then
    DataController.UpdateEditingRecord;
  ResetChanging;
end;

procedure TcxDBDataProvider.ResetPostLocateFlag;
begin
  FPostLocateFlag := False;
end;

procedure TcxDBDataProvider.ResetSmartRefresh;
begin
  FUpdatingRecordIndex := cxNullEditingRecordIndex;
  FUpdatingNewRecordIndex := -1;
  FUpdatingRecordIsInserting := False;
end;  

procedure TcxDBDataProvider.SetPostLocateFlag;
var
  I: Integer;
  ADBDataProvider: TcxDBDataProvider;
begin
  for I := 0 to DBDataProviders.Count - 1 do
  begin
    ADBDataProvider := DBDataProviders[I];
    if (ADBDataProvider.DataSet = Self.DataSet) and
      (ADBDataProvider.DataController.DetailMode <> dcdmPattern) then
      ADBDataProvider.FPostLocateFlag := True;
  end;
end;

procedure TcxDBDataProvider.Unfreeze;
begin
  if Assigned(DataSet) then
    DataSet.EnableControls;
  inherited Unfreeze;
end;

procedure TcxDBDataProvider.SmartDataChanged;

  procedure GetKeyDBFields(AList: TList);
  var
    I: Integer;
  begin
    DataController.GetKeyFields(AList);
    for I := 0 to AList.Count - 1 do
      AList[I] := TcxDBDataField(AList[I]).Field;
  end;

  function GetKeyFieldsValues: Variant;
  var
    AKeyFields: TList;
  begin
    AKeyFields := TList.Create;
    try
      GetKeyDBFields(AKeyFields);
      Result := GetDataSetValues(DataSet, AKeyFields);
    finally
      AKeyFields.Free;
    end;
  end;

  function IsKeyFieldAutoInc: Boolean;
  var
    AKeyFields: TList;
  begin
    Result := False;
    AKeyFields := TList.Create;
    try
      GetKeyDBFields(AKeyFields);
      if (AKeyFields.Count = 1) and (TField(AKeyFields[0]).DataType = ftAutoInc) then
        Result := True;
    finally
      AKeyFields.Free;
    end;
  end;

  function IsNewRecordInserted(const AFocusedRecordValues, AKeyFieldsValues: Variant): Boolean;
  begin
    Result := False;
    if not FUpdatingRecordIsInserting then Exit;
    // check auto inc
    if VarEquals(AFocusedRecordValues, Null) and IsKeyFieldAutoInc then
    begin
      if DataController.FindRecordIndexByKey(AKeyFieldsValues) = -1 then
        Result := True;
    end;
    // new item ?
  end;

var
  AFocusedRecordIndex, ARecordIndex: Integer;
  AFocusedRecordValues, AKeyFieldsValues: Variant;
begin
  if FUpdatingRecordIndex <> cxNullEditingRecordIndex then
  begin
    AFocusedRecordIndex := DataController.GetFocusedRecordIndex;
    if AFocusedRecordIndex = FUpdatingRecordIndex then
    begin
      if (AFocusedRecordIndex < 0) and (FUpdatingNewRecordIndex <> -1) then
        AFocusedRecordIndex := FUpdatingNewRecordIndex;
      AFocusedRecordValues := DataController.GetRecordId(AFocusedRecordIndex);
      AKeyFieldsValues := GetKeyFieldsValues;
      if not VarEquals(AFocusedRecordValues, AKeyFieldsValues) then
      begin
        if IsNewRecordInserted(AFocusedRecordValues, AKeyFieldsValues) then
        begin
          if DataController.NewItemRowFocused then
          begin
            if FUpdatingNewRecordIndex <> -1 then
              AFocusedRecordIndex := FUpdatingNewRecordIndex
            else
            begin
              AFocusedRecordIndex := DataController.AppendRecord;
              DataController.CopyRecord(DataController.NewItemRecordIndex, AFocusedRecordIndex);
            end;
          end;
          DataController.DoUpdateRecord(AFocusedRecordIndex);
        end
        else
        begin
          ARecordIndex := DataController.FindRecordIndexByKey(AFocusedRecordValues);
          if (ARecordIndex = -1) or (ARecordIndex = AFocusedRecordIndex) then
          begin
            if AFocusedRecordIndex <> -1 then
              DataController.DeleteRecord(AFocusedRecordIndex);
            DataController.UpdateFocused;
          end;
        end;
      end
      else
        DataController.DoUpdateRecord(AFocusedRecordIndex);
    end;
    // record changed notify
    if AFocusedRecordIndex <> -1 then
    begin
      DataController.FDataChangeInfo.Kind := dcRecord;
      DataController.FDataChangeInfo.RecordIndex := AFocusedRecordIndex;
    end;
  end;
  DataController.FilterChanged;
  DataController.SummaryChanged(False);
  ResetPostLocateFlag; // ?
end;

function TcxDBDataProvider.DoLocate(const ASubText: string; AForward, ANext: Boolean): Boolean;
var
  ASearchItemIndex: Integer;
  AStartPos: TBookmarkStr;
  AExit: Boolean;

  function IsCurrentEqual: Boolean;
  var
    S: string;
  begin
    FIncrementalSearching := True;
    try
      S := DataController.GetIncrementalSearchText(-1{set FIncrementalSearching flag!}, ASearchItemIndex);
      Result := DataCompareText(S, ASubText, True);
    finally
      FIncrementalSearching := False;
    end;
  end;

  procedure CalcNextRecord;
  begin
    with DataSet do
      if not AForward then
      begin
        Prior;
        if BOF then
        begin
          if not ANext then
            Last
          else
            AExit := True;
          AStartPos := FSavePosInfo.Bookmark;
        end;
      end
      else
      begin
        Next;
        if EOF then
        begin
          if not ANext then
            First
          else
            AExit := True;
          AStartPos := FSavePosInfo.Bookmark;
        end;
      end;
  end;

begin
  Result := False;
  if not Assigned(DataSet) or IsEditing then Exit;
  with DataSet do
  begin
    if Active and not (BOF and EOF) then
    begin
      ASearchItemIndex := DataController.Search.ItemIndex;
      Result := not ANext and IsCurrentEqual;
      if Result then
        DataController.UpdateFocused
      else
      begin
        Freeze;
        try
          SavePos;
          AStartPos := '';
          AExit := False;
          if ANext then
            CalcNextRecord;
          while (not EOF or ANext) and
            ((AStartPos = '') or (CompareBookmarks(TBookmark(Bookmark),  TBookmark(AStartPos)) <> 0)) do
          begin
            if IsCurrentEqual then
            begin
              Result := True;
              Break;
            end;
            CalcNextRecord;
            if AExit then Break;
          end;
          if not Result then
            RestorePos;
        finally
          Unfreeze; // Invalidate disabled
        end;
        if Result then
        begin
          DataController.CorrectPrevSelectionChangedInfo;
          DataController.Change([dccLayout]); // Invalidate
        end;
      end;
    end;
  end;
end;

function TcxDBDataProvider.GetDataBufferCount: Integer;
begin
  if DataController.DataModeController.GridModeBufferCount = 0 then
    Result := DataController.GetDefaultGridModeBufferCount
  else
    Result := DataController.DataModeController.GridModeBufferCount;
end;

function TcxDBDataProvider.GetDataRecordCount: Integer;
begin
  Result := DataLink.RecordCount;
end;

function TcxDBDataProvider.GetExternalDataDisplayText(ARecordIndex: Integer;
  AField: TcxCustomDataField): string;
var
  ADataSetField: TField;
  APrevActiveRecord: Integer;
begin
  ADataSetField := TcxDBDataField(AField).Field;
  if Assigned(ADataSetField) then
  begin
    if (0 <= ARecordIndex) and (ARecordIndex < DataLink.RecordCount) then
    begin
      APrevActiveRecord := DataLink.ActiveRecord;
      try
        DataLink.ActiveRecord := ARecordIndex;
        Result := ADataSetField.DisplayText;
      finally
        DataLink.ActiveRecord := APrevActiveRecord;
      end;
    end
    else
      if IsInserting or FIncrementalSearching then
        Result := ADataSetField.DisplayText
      else
        Result := '';
  end
  else
    Result := inherited GetExternalDataDisplayText(ARecordIndex, AField);
end;

function TcxDBDataProvider.GetExternalDataValue(ARecordIndex: Integer;
  AField: TcxCustomDataField): Variant;

  function GetFieldValue(AField: TField): Variant;
  begin
    if AField.IsNull then
      Result := Null
    else
      Result := AField.Value;
  end;

var
  ADataSetField: TField;
  APrevActiveRecord: Integer;
begin
  ADataSetField := TcxDBDataField(AField).Field;
  if Assigned(ADataSetField) then
  begin
    if (0 <= ARecordIndex) and (ARecordIndex < DataLink.RecordCount) then
    begin
      APrevActiveRecord := DataLink.ActiveRecord;
      try
        DataLink.ActiveRecord := ARecordIndex;
        Result := GetFieldValue(ADataSetField);
      finally
        DataLink.ActiveRecord := APrevActiveRecord;
      end;
    end
    else
      if IsInserting or FIncrementalSearching then
        Result := GetFieldValue(ADataSetField)
      else
        Result := Null;
  end
  else
    Result := inherited GetExternalDataValue(ARecordIndex, AField);
end;

procedure TcxDBDataProvider.LoadDataBuffer;
begin
  if DataLink.Active and IsGridMode then
  begin
    DataLink.BufferCount := GetDataBufferCount;
    DataController.DataStorage.Clear(False);
    DataController.DataStorage.RecordCount := GetDataRecordCount;
    FRecordIndex := DataLink.ActiveRecord;
  end;
  inherited LoadDataBuffer;
end;

procedure TcxDBDataProvider.UpdateGridMode;
var
  APrevRecordCount: Integer;
begin
  if DataLink.Active and IsGridMode then
  begin
    APrevRecordCount := DataController.RecordCount;
    DataLink.BufferCount := GetDataBufferCount;
    FRecordIndex := DataLink.ActiveRecord;
    if APrevRecordCount <> GetDataRecordCount then
    begin
      DataChanged(dcTotal, -1, -1);
    end
    else
    begin
      DataChanged(dcRecord, -1, -1);
      DataController.UpdateFocused;
    end;
  end;
end;

function TcxDBDataProvider.GetDetailHasChildren(ARecordIndex: Integer; ARelationIndex: Integer): Boolean;
var
  ARelation: TcxDBDataRelation;
  APatternDataController, ADetailDataController: TcxCustomDataController;
  ADataController: TcxDBDataController;
  AMasterDetailKeyValues: Variant;
begin
  APatternDataController := DataController.GetPatternDataController;
  if APatternDataController <> nil then
    ADetailDataController := APatternDataController.Relations[ARelationIndex].DetailDataController
  else
    ADetailDataController := nil; //!!!
  if ADetailDataController is TcxDBDataController then
  begin
    Result := True;
    ADataController := TcxDBDataController(ADetailDataController);
    ARelation := TcxDBDataRelation(DataController.Relations[ARelationIndex]);
    // event
    AMasterDetailKeyValues := ARelation.GetMasterRecordID(ARecordIndex);
    if Assigned(DataController.FOnDetailHasChildren) then
      DataController.FOnDetailHasChildren(DataController, ARecordIndex, ARelationIndex,
        ADataController.MasterDetailKeyFieldNames, AMasterDetailKeyValues, Result)
    else
      if not (ADataController.IsGridMode or ADataController.DataModeController.DetailInSQLMode) then
      begin
        if Assigned(ADataController.DataSet) and ADataController.DataSet.Active then
        begin
          ADataController.Provider.Freeze;
          try
            ADataController.Provider.SavePos;
            try
              Result := ADataController.DataSet.Locate(ADataController.MasterDetailKeyFieldNames,
                AMasterDetailKeyValues, []); // must be sort by Detail Keys
            finally
              ADataController.Provider.RestorePos;
            end;
          finally
            ADataController.Provider.Unfreeze;
          end;
        end
        else
          Result := False;
      end;
  end
  else
    Result := inherited GetDetailHasChildren(ARecordIndex, ARelationIndex);
end;

function TcxDBDataProvider.GetRecordIndex: Integer;
begin
  if not FInUpdateGridMode and IsInserting then
    Result := EditingRecordIndex
  else
    if FInUpdateGridMode and IsInserting and DataController.NewItemRowFocused then
      Result := DataController.NewItemRecordIndex
    else
      Result := FRecordIndex;
end;

function TcxDBDataProvider.GetValueDefReaderClass: TcxValueDefReaderClass;
begin
  Result := TcxValueDefDBReader;
end;

procedure TcxDBDataProvider.AddNewRecord(AOperation: TDataOperation);

  procedure CheckDataSetBrowseMode;
  begin
    DataLink.UpdateData;
    if DataSet.Modified then
      DataSet.Post
    else
      DataSet.Cancel;
    SmartDataChanged;
    ResetSmartRefresh;
  end;

begin
  if Assigned(DataSet) then
  begin
    FInInsert := True;
    try
      if DataSet.State in dsEditModes then
      begin
        if not IsSmartRefresh and (DataSet.State = dsInsert) then
          DataSet.CheckBrowseMode;
        DataSet.DisableControls;
        try
          if IsSmartRefresh then
            CheckDataSetBrowseMode;
          AOperation;
        finally
          DataSet.EnableControls;
        end;
      end
      else
        AOperation;
    finally
      FInInsert := False;
    end;
  end;
end;

function TcxDBDataProvider.GetDataController: TcxDBDataController;
begin
  Result := inherited DataController as TcxDBDataController;
end;

function TcxDBDataProvider.GetDataSet: TDataSet;
begin
  if Assigned(DataLink) then
    Result := DataLink.DataSet
  else
    Result := nil;
end;

function TcxDBDataProvider.GetDataSource: TDataSource;
begin
  if Assigned(DataLink) then
    Result := DataLink.DataSource
  else
    Result := nil;
end;

function TcxDBDataProvider.GetIsDataSetCurrent: Boolean;
begin
  if DataController.IsDetailMode and not DataController.DataModeController.DetailInSQLMode and IsSyncMode then
    Result := FInCanInitEditing or
      ((FInInsert or
        (((DataController.GetFocusedRowIndex <> -1) or FIsDataSetCurrent) and not IsOtherDetailDataSetInInsert) or
        (DataController.UseNewItemRowForEditing and DataController.NewItemRowFocused and IsInserting)) and
       not IsCanInitEditingBusy
      )
  else
    Result := FIsDataSetCurrent;
end;

function TcxDBDataProvider.GetIsSmartRefresh: Boolean;
begin
  Result := IsKeyNavigation and not IsGridMode and
    DataController.DataModeController.SmartRefresh;
end;

procedure TcxDBDataProvider.RemoveFromListeners;
var
  I: Integer;
  ADBDataProvider: TcxDBDataProvider;
begin
  if DataSet = nil then Exit;
  for I := 0 to DBDataProviders.Count - 1 do
  begin
    ADBDataProvider := DBDataProviders[I];
    if (ADBDataProvider <> Self) and
      (ADBDataProvider.DataSet = Self.DataSet) then
      ADBDataProvider.FListeners.Remove(Self);
  end;
end;

procedure TcxDBDataProvider.SetDataSource(Value: TDataSource);
begin
  if Assigned(DataLink) and (DataLink.DataSource <> Value) then
    DataLink.DataSource := Value;
end;

procedure TcxDBDataProvider.SetIsDataSetCurrent(Value: Boolean);
begin
  if FIsDataSetCurrent <> Value then
  begin
    if Value then
      DataController.ForEachDetail(DataController.GetMasterRelation,
        DataController.ResetDataSetCurrent);
    FIsDataSetCurrent := Value;
    // Reopen?
  end;
end;

{ TcxValueDefDBReader }

function TcxValueDefDBReader.GetDisplayText(AValueDef: TcxValueDef): string;
var
  AField: TField;
begin
  AField := TcxDBDataField(AValueDef.LinkObject).Field;
  if Assigned(AField) then
    Result := AField.DisplayText
  else
    Result := inherited GetDisplayText(AValueDef);
end;

function TcxValueDefDBReader.GetValue(AValueDef: TcxValueDef): Variant;
var
  AField: TField;
begin
  AField := TcxDBDataField(AValueDef.LinkObject).Field;
  if Assigned(AField) then
  begin
    // get external
    if AField.IsNull then
      Result := Null
    else
      Result := AField.Value;
  end
  else
    Result := inherited GetValue(AValueDef);
end;

function TcxValueDefDBReader.IsInternal(AValueDef: TcxValueDef): Boolean;
begin
  Result := TcxDBDataField(AValueDef.LinkObject).IsValueDefInternal;
end;

{ TcxDBDataField }

destructor TcxDBDataField.Destroy;
begin
  if Assigned(ParentField) then
    ParentField.RemoveField(Self);
  ClearFields;
  inherited Destroy;
end;

function TcxDBDataField.CanModify(AEditValueSource: TcxDataEditValueSource): Boolean;

  function IsLookupCanModify: Boolean;
  var
    I: Integer;
  begin
    Result := True;
    for I := 0 to FieldCount - 1 do
      if not Fields[I].CanModify(evsValue) then
      begin
        Result := False;
        Break;
      end;
  end;

begin
  Result := inherited CanModify(AEditValueSource) and Assigned(Field);
  if Result then
  begin
    if IsLookup then
      Result := (AEditValueSource = evsKey) and IsLookupCanModify
    else
      Result := IsFieldCanModify(Field, AEditValueSource = evsValue);
  end;
end;

function TcxDBDataField.IsValueDefInternal: Boolean;
begin
  Result := (Field = nil) or DataController.IsGridMode;
end;

procedure TcxDBDataField.AddField(ADataField: TcxDBDataField);
begin
  if FFields = nil then
    FFields := TList.Create;
  if FFields.IndexOf(ADataField) = -1 then // TODO: check Reference
  begin
    if ADataField.FParentField <> nil then
      InvalidOperation('ADataField.FParentField <> nil');
    FFields.Add(ADataField);
    ADataField.FParentField := Self; 
  end;
end;

procedure TcxDBDataField.ClearFields;
var
  I: Integer;
begin
  if FFields <> nil then
  begin
    for I := FFields.Count - 1 downto 0 do
      TcxDBDataField(FFields[I]).Free;
    FFields.Free;
    FFields := nil;
  end;
end;

procedure TcxDBDataField.Reassign(ASource: TcxCustomDataField);
begin
  inherited Reassign(ASource);
  if ASource is TcxDBDataField then
  begin
    FField := TcxDBDataField(ASource).FField;
    FFields := TcxDBDataField(ASource).FFields;
    TcxDBDataField(ASource).FField := nil;
    TcxDBDataField(ASource).FFields := nil;
  end;
end;

procedure TcxDBDataField.RemoveField(ADataField: TcxDBDataField);
begin
  if FFields <> nil then
    FFields.Remove(ADataField);
  ADataField.FParentField := nil;  
end;

procedure TcxDBDataField.RemoveNotification(AComponent: TComponent);
begin
  if Assigned(ReferenceField) then Exit;
  inherited RemoveNotification(AComponent);
  if Field = AComponent then
  begin
    if Provider.FInFirst and Provider.DataLink.Active and
      not Provider.DataSet.Active then
      Provider.RecreatedFieldsAfterFirst := True;
    Field := nil;
    Changed;
  end;
end;

procedure TcxDBDataField.SetPropertiesByField(AField: TField);

  procedure NotifyReferenceFields;
  var
    I: Integer;
  begin
    for I := 0 to FieldList.Count - 1 do
      if (FieldList[I].ReferenceField = Self) and not FieldList[I].IsInternal then
        DataController.DoValueTypeClassChanged(I);
  end;

var
  ATextStored, AValueTypeClassChanged: Boolean;
  AValueTypeClass: TcxValueTypeClass;
begin
  if Assigned(ReferenceField) then Exit;
  if not IsInternal then
    ATextStored := IsFieldFormatted(AField, DataController.GetItemValueSource(Index) = evsText)
  else
    ATextStored := IsFieldFormatted(AField, False); //  TODO: Internal?
  AValueTypeClass := GetValueTypeClassByField(AField);
  AValueTypeClassChanged := ValueTypeClass <> AValueTypeClass;
  if AValueTypeClassChanged or (TextStored <> ATextStored) then
  begin
    BeginRecreateData;
    try
      TextStored := ATextStored;
      ValueTypeClass := AValueTypeClass;
    finally
      EndRecreateData;
    end;
    if AValueTypeClassChanged then
    begin
      if not IsInternal then
        DataController.DoValueTypeClassChanged(Index);
      NotifyReferenceFields;
    end;
  end;
end;

function TcxDBDataField.GetDataController: TcxDBDataController;
begin
  Result := inherited DataController as TcxDBDataController;
end;

function TcxDBDataField.GetField: TField;
begin
  if Assigned(ReferenceField) then
    Result := (ReferenceField as TcxDBDataField).Field
  else
    Result := FField;
end;

function TcxDBDataField.GetFieldItem(Index: Integer): TcxDBDataField;
begin
  if Assigned(ReferenceField) then
    Result := (ReferenceField as TcxDBDataField).Fields[Index]
  else
    Result := FFields[Index];
end;

function TcxDBDataField.GetFieldCount: Integer;
begin
  if Assigned(ReferenceField) then
    Result := (ReferenceField as TcxDBDataField).FieldCount
  else
    if FFields <> nil then
      Result := FFields.Count
    else
      Result := 0;
end;

function TcxDBDataField.GetIsLookup: Boolean;
begin
  Result := Assigned(Field) and Field.Lookup;
end;

function TcxDBDataField.GetProvider: TcxDBDataProvider;
begin
  Result := DataController.Provider;
end;

procedure TcxDBDataField.SetField(Value: TField);
begin
  if Assigned(ReferenceField) then Exit;
  if (Value <> nil) and (csDestroying in Value.ComponentState) then
    Value := nil;
  if FField <> Value then
  begin
    FField := Value;
    if Assigned(Value) then
      Value.FreeNotification(Notifier);
    ClearFields;
  end;
end;

{ TcxDBDataRelation }

destructor TcxDBDataRelation.Destroy;
begin
  RemoveMasterKeyField;
  inherited Destroy;
end;

function TcxDBDataRelation.GetMasterRecordID(ARecordIndex: Integer): Variant;
var
  AList: TList;
begin
  DataController.CheckRecordRange(ARecordIndex);
  Result := Unassigned;
  if IsLinked then
  begin
    AList := TList.Create;
    try
      GetMasterKeyFields(AList);
      Result := DataController.GetInternalRecordId(ARecordIndex, AList);
    finally
      AList.Free;
    end;
  end;
end;

procedure TcxDBDataRelation.GetMasterKeyFields(AList: TList);
begin
  GetInternalKeyFields(FMasterKeyField, AList);
end;

function TcxDBDataRelation.IsLinked: Boolean;
begin
  Result := Assigned(FMasterKeyField) and (DetailKeyFieldNames <> '');
end;

procedure TcxDBDataRelation.RemoveDataField(ADataField: TcxCustomDataField);
begin
  inherited RemoveDataField(ADataField);
  if FMasterKeyField = ADataField then
    FMasterKeyField := nil;
end;

procedure TcxDBDataRelation.RemoveMasterKeyField;
begin
  FMasterKeyField.Free;
  FMasterKeyField := nil;
end;

procedure TcxDBDataRelation.UpdateMasterDetailKeyFieldNames;
begin
  if DataController.DetailMode = dcdmClone then Exit;
  Changed;
end;

function TcxDBDataRelation.GetDataController: TcxDBDataController;
begin
  Result := inherited DataController as TcxDBDataController;
end;

function TcxDBDataRelation.GetDetailKeyFieldNames: string;
var
  ADataController: TcxCustomDataController;
begin
  ADataController := DataController.GetPatternDataController;
  if ADataController <> nil then
    ADataController := ADataController.Relations[Self.Index].DetailDataController;
  if (ADataController <> nil) and (ADataController is TcxDBDataController) then
    Result := (ADataController as TcxDBDataController).DetailKeyFieldNames
  else
    Result := '';
end;

function TcxDBDataRelation.GetMasterKeyFieldNames: string;
var
  ADataController: TcxCustomDataController;
begin
  ADataController := DataController.GetPatternDataController;
  if ADataController <> nil then
    ADataController := ADataController.Relations[Self.Index].DetailDataController;
  if (ADataController <> nil) and (ADataController is TcxDBDataController) then
    Result := (ADataController as TcxDBDataController).MasterKeyFieldNames
  else
    Result := '';
end;

{ TcxDBDataFilterCriteriaItem }

function TcxDBDataFilterCriteriaItem.GetFilterOperatorClass: TcxFilterOperatorClass;
var
  ADataSet: TDataSet;
  AOperatorAdapter: TcxDBFilterOperatorAdapter;
begin
  Result := inherited GetFilterOperatorClass;
  ADataSet := DataController.Provider.DataSet;
  AOperatorAdapter := cxGetFilterOperatorAdapter(ADataSet);
  if Assigned(AOperatorAdapter) then
    AOperatorAdapter.PrepareOperatorClass(Self, ADataSet, Result);
end;

function TcxDBDataFilterCriteriaItem.GetDataController: TcxDBDataController;
begin
  Result := inherited DataController as TcxDBDataController;
end;

function TcxDBDataFilterCriteriaItem.GetDBField: TcxDBDataField;
begin
  Result := Field as TcxDBDataField;
end;

{ TcxDBDataFilterCriteria }

constructor TcxDBDataFilterCriteria.Create(ADataController: TcxCustomDataController);
begin
  inherited Create(ADataController);
  FIgnoreOrigin := True;
end;

procedure TcxDBDataFilterCriteria.Assign(Source: TPersistent);
begin
  if Source is TcxDBDataFilterCriteria then
  begin
    BeginUpdate;
    try
      inherited Assign(Source);
      AutoDataSetFilter := TcxDBDataFilterCriteria(Source).AutoDataSetFilter;
      IgnoreOrigin := TcxDBDataFilterCriteria(Source).IgnoreOrigin;
    finally
      EndUpdate;
    end;
  end
  else
    inherited Assign(Source);
end;

procedure TcxDBDataFilterCriteria.AssignEvents(Source: TPersistent);
begin
  inherited AssignEvents(Source);
  if Source is TcxDBDataFilterCriteria then
    OnBeforeChange := TcxDBDataFilterCriteria(Source).OnBeforeChange;
end;

function TcxDBDataFilterCriteria.IsAutoDataSetFilter: Boolean;
begin
  Result := AutoDataSetFilter and not DataController.Provider.IsSmartRefresh;
end;

function TcxDBDataFilterCriteria.IsFiltering: Boolean;
begin
  Result := inherited IsFiltering and
    not (Assigned(FOnBeforeChange) or IsAutoDataSetFilter);
end;

procedure TcxDBDataFilterCriteria.RestoreDefaults;
begin
  BeginUpdate;
  try
    inherited RestoreDefaults;
    AutoDataSetFilter := False;
    IgnoreOrigin := True;
  finally
    EndUpdate;
  end;
end;

function TcxDBDataFilterCriteria.GetItemClass: TcxFilterCriteriaItemClass;
begin
  Result := TcxDBDataFilterCriteriaItem;
end;

procedure TcxDBDataFilterCriteria.Update;

  function IsDestroying: Boolean;
  begin
    Result := Destroying;
    if DataController.GetOwner is TComponent then
      Result := csDestroying in (DataController.GetOwner as TComponent).ComponentState;
  end;

  function IsLoading: Boolean;
  begin
    Result := False;
    if DataController.GetOwner is TComponent then
      Result := csLoading in (DataController.GetOwner as TComponent).ComponentState;
  end;

var
  ADataSet: TDataSet;
begin
  if not IsDestroying then
  begin
    ADataSet := DataController.Provider.DataSet;
    if {Active and }Assigned(FOnBeforeChange) and not IsLoading then
      FOnBeforeChange(Self, ADataSet, FilterText);
    if IsAutoDataSetFilter and Assigned(ADataSet) then
    begin
      ADataSet.DisableControls;
      try
        ADataSet.Filter := FilterText;
        if fcoCaseInsensitive in Options then
          ADataSet.FilterOptions := ADataSet.FilterOptions + [foCaseInsensitive]
        else
          ADataSet.FilterOptions := ADataSet.FilterOptions - [foCaseInsensitive];
        if Active then
          ADataSet.Filtered := ADataSet.Filter <> ''
        else
          ADataSet.Filtered := False;
      finally
        ADataSet.EnableControls;
      end;
    end;
  end;
  inherited Update;
  if not IsDestroying and DataController.Provider.IsSyncMode and
    (DataController.GetFocusedRecordIndex = -1) then // NewItemRowFocused?
    DataController.UpdateFocused;
end;

function TcxDBDataFilterCriteria.GetDataController: TcxDBDataController;
begin
  Result := inherited DataController as TcxDBDataController;
end;

procedure TcxDBDataFilterCriteria.SetAutoDataSetFilter(Value: Boolean);
begin
  if FAutoDataSetFilter <> Value then
  begin
    FAutoDataSetFilter := Value;
    Changed;
  end;
end;

procedure TcxDBDataFilterCriteria.SetIgnoreOrigin(Value: Boolean);
begin
  if FIgnoreOrigin <> Value then
  begin
    FIgnoreOrigin := Value;
    Changed;
  end;
end;

{ TcxDBDataSummaryItem }

procedure TcxDBDataSummaryItem.Assign(Source: TPersistent);
begin
  if Source is TcxDBDataSummaryItem then
  begin
    BeginUpdate;
    try
      inherited Assign(Source);
      FieldName := TcxDBDataSummaryItem(Source).FieldName;
    finally
      EndUpdate;
    end;
  end
  else
    inherited Assign(Source);
end;

function TcxDBDataSummaryItem.DataField: TcxCustomDataField;
begin
  if Assigned(FDataField) then
    Result := FDataField
  else
    Result := inherited DataField;
end;

function TcxDBDataSummaryItem.GetDBDataController: TcxDBDataController;
begin
  Result := inherited DataController as TcxDBDataController;
end;

procedure TcxDBDataSummaryItem.SetFieldName(const Value: string);
begin
  if FFieldName <> Value then
  begin
    FFieldName := Value;
    DataController.UpdateInternalKeyFields(FFieldName, FDataField);
  end;
end;

{ TcxDBDataController }

constructor TcxDBDataController.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FDataModeController := TcxDBDataModeController.Create(Self);
end;

destructor TcxDBDataController.Destroy;
begin
  FDataModeController.Free;
  FDataModeController := nil;
  ClearMasterDetailKeyFields;
  RemoveKeyField;
  inherited Destroy;
end;

procedure TcxDBDataController.Assign(Source: TPersistent);
begin
  inherited Assign(Source);
  if Source is TcxDBDataController then
  begin
    DataModeController := TcxDBDataController(Source).DataModeController;
    DataSource := TcxDBDataController(Source).DataSource;
    KeyFieldNames := TcxDBDataController(Source).KeyFieldNames;
    DetailKeyFieldNames := TcxDBDataController(Source).DetailKeyFieldNames;
    MasterKeyFieldNames := TcxDBDataController(Source).MasterKeyFieldNames;
    OnDetailHasChildren := TcxDBDataController(Source).OnDetailHasChildren;
  end;
end;

function TcxDBDataController.ExecuteAction(Action: TBasicAction): Boolean;
begin
  Result := inherited ExecuteAction(Action) or Provider.DataLink.ExecuteAction(Action);
end;

function TcxDBDataController.UpdateAction(Action: TBasicAction): Boolean;
begin
  Result := inherited UpdateAction(Action) or Provider.DataLink.UpdateAction(Action);
end;

function TcxDBDataController.CanChangeDetailExpanding(ARecordIndex: Integer;
  AExpanded: Boolean): Boolean;
begin
  if IsGridMode then
  begin
    if AExpanded then
      ChangeFocusedRecordIndex(ARecordIndex);
    Result := True;
  end
  else
    Result := inherited CanChangeDetailExpanding(ARecordIndex, AExpanded);
end;

function TcxDBDataController.CanFocusRecord(ARecordIndex: Integer): Boolean;
var
  AInResetDataSetCurrent: Boolean;
begin
  if (Provider.IsInserting and (ARecordIndex = Provider.EditingRecordIndex)) or
    (UseNewItemRowForEditing and (ARecordIndex < 0)) then
  begin
    if not Provider.IsInserting and (ARecordIndex < 0) then
      Post;
    Result := True;
    Exit;
  end;
  Provider.BeginLocate;
  try
    AInResetDataSetCurrent := False;
    if IsDetailMode and DataModeController.DetailInSyncMode then
    begin
      if FInResetDataSetCurrent then
        AInResetDataSetCurrent := True
      else
        CheckCurrentQuery;
    end;
    if not AInResetDataSetCurrent and Provider.IsSyncMode then
    begin
      if ARecordIndex < 0 then
        Result := False
      else
        if IsKeyNavigation then
        begin
          // TODO: check Equals before Locate
          Result := Provider.DataSet.Locate(KeyFieldNames, GetRecordId(ARecordIndex), []);
        end
        else
        begin
          Provider.MoveBy(ARecordIndex - Provider.FRecordIndex); // TODO: MD
          Result := True;
        end;
    end
    else
      Result := inherited CanFocusRecord(ARecordIndex);
  finally
    Provider.EndLocate;
  end;
  SyncMasterPos;
end;

procedure TcxDBDataController.CheckBrowseMode;
begin
  FInCheckBrowseMode := True;
  try
    if Assigned(DataSet) then
      DataSet.CheckBrowseMode;
  finally
    FInCheckBrowseMode := False;
  end;
end;

function TcxDBDataController.CheckMasterBrowseMode: Boolean;
var
  AMasterRelation: TcxDBDataRelation;
  AMasterDataController: TcxDBDataController;
  ADataController: TcxDBDataController;
begin
  AMasterRelation := GetMasterRelation as TcxDBDataRelation;
  if AMasterRelation <> nil then
  begin
    Result := False;
    AMasterDataController := AMasterRelation.DataController;
    if AMasterDataController.CheckMasterBrowseMode then
    begin
      ADataController := Self;
      ADataController.AddListenerLink(@ADataController);
      AMasterDataController.AddListenerLink(@AMasterDataController);
      try
        AMasterDataController.CheckBrowseMode;
        if ADataController <> nil then
        begin
          ADataController.CheckBrowseMode;
          if (ADataController <> nil) and (AMasterDataController <> nil) then
            Result := True;
        end;
      finally
        if AMasterDataController <> nil then
          AMasterDataController.RemoveListenerLink(@AMasterDataController);
        if ADataController <> nil then
          ADataController.RemoveListenerLink(@ADataController);
      end;
    end;
  end
  else
    Result := True;
end;

procedure TcxDBDataController.ClearMasterDetailKeyFields;
begin
  FMasterDetailKeyFields.Free;
  FMasterDetailKeyFields := nil;
end;

procedure TcxDBDataController.CorrectAfterDelete(ARecordIndex: Integer);
begin
  inherited CorrectAfterDelete(ARecordIndex);
  if Provider.FUpdatingRecordIndex = ARecordIndex then
    Provider.ResetSmartRefresh;
  if Provider.FUpdatingPrevFocusedRecordIndex = ARecordIndex then
    Provider.FUpdatingPrevFocusedRecordIndex := -1;
end;

procedure TcxDBDataController.DoDataSourceChanged;
begin
end;

procedure TcxDBDataController.DoInitInsertingRecord(AInsertingRecordIndex: Integer);
begin
end;

function TcxDBDataController.DoSearchInGridMode(const ASubText: string;
  AForward, ANext: Boolean): Boolean;
begin
  TcxDataControllerSearchAccess(Search).Lock;
  try
    Result := Provider.DoLocate(ASubText, AForward, ANext);
  finally
    TcxDataControllerSearchAccess(Search).Unlock;
  end;
end;

procedure TcxDBDataController.DoUpdateRecord(ARecordIndex: Integer);
var
  AValueDefReader: TcxValueDefReader;
begin
  AValueDefReader := Provider.GetValueDefReaderClass.Create;
  try
    DataStorage.ReadRecord(ARecordIndex, AValueDefReader, True);
    DoReadRecord(ARecordIndex);
  finally
    AValueDefReader.Free;
  end;
  if not Provider.FInCanInitEditing then
    Change([dccUpdateRecord]);
end;

function TcxDBDataController.GetActiveRecordIndex: Integer;
begin
  if IsGridMode then
    Result := Provider.DataLink.ActiveRecord
  else
    Result := inherited GetActiveRecordIndex;
end;

function TcxDBDataController.GetDataProviderClass: TcxCustomDataProviderClass;
begin
  Result := TcxDBDataProvider;
end;

function TcxDBDataController.GetDataSelectionClass: TcxDataSelectionClass;
begin
  Result := TcxDBDataSelection;
end;

function TcxDBDataController.GetDefaultGridModeBufferCount: Integer;
begin
  Result := 100;
end;

function TcxDBDataController.GetFieldClass: TcxCustomDataFieldClass;
begin
  Result := TcxDBDataField;
end;

function TcxDBDataController.GetFilterCriteriaClass: TcxDataFilterCriteriaClass;
begin
  Result := TcxDBDataFilterCriteria;
end;

procedure TcxDBDataController.UpdateEditingRecord;
begin
  if Provider.EditingRecordIndex = cxNullEditingRecordIndex then Exit;
  Provider.FUpdatingRecordIndex := Provider.EditingRecordIndex;
  Provider.FUpdatingRecordIsInserting := Provider.IsInserting;
  DoUpdateRecord(Provider.EditingRecordIndex);
end;

procedure TcxDBDataController.UpdateField(ADataField: TcxDBDataField; const AFieldNames: string; AIsLookup: Boolean);

  function CheckExistField(const AFieldName: string): Boolean;
  var
    I: Integer;
    ACurrentField: TcxDBDataField;
    APrevValueTypeClass: TcxValueTypeClass;
  begin
    APrevValueTypeClass := ADataField.ValueTypeClass;
    ADataField.ReferenceField := nil;
    Result := False;
    // TODO: reassign refrence fields!!!
    for I := 0 to Fields.Count - 1 do
    begin
      ACurrentField := DBFields[I];
      if ACurrentField <> ADataField then
      begin
        if IsEqualFieldNames(ACurrentField.FieldName, ADataField.FieldName) then
        begin
          ADataField.ReferenceField := ACurrentField;
          Result := True;
          Break;
        end;
      end;
    end;
    if (ADataField.ValueTypeClass <> APrevValueTypeClass) and not ADataField.IsInternal then
      DoValueTypeClassChanged(ADataField.Index);
  end;

var
  APos: Integer;
  ASubDataField: TcxDBDataField;
begin
  ADataField.ClearFields;
  if not AIsLookup then
  begin
    if ADataField.FieldName <> AFieldNames then
      TcxCustomDataFieldListAccess(Fields).ReassignFields(ADataField);
    ADataField.FieldName := AFieldNames;
  end;  
  if AIsLookup or IsMultipleFieldNames(AFieldNames) then
  begin
    BeginUpdate;
    try
      APos := 1;
      while APos <= Length(AFieldNames) do
      begin
        ASubDataField := AddInternalDBField;
        ADataField.AddField(ASubDataField);
        UpdateField(ASubDataField, ExtractFieldName(AFieldNames, APos), False);
      end;
    finally
      EndUpdate;
    end;
  end
  else
  begin
    if CheckExistField(AFieldNames) then
      Change([dccData])
    else
      LayoutChanged([lcStructure]);
  end;
end;

procedure TcxDBDataController.ChangeFieldName(AItemIndex: Integer; const AFieldName: string);
begin
  CheckItemRange(AItemIndex);
  if GetItemFieldName(AItemIndex) <> AFieldName then
    UpdateField(DBFields[AItemIndex], AFieldName, False);
end;

function TcxDBDataController.GetItemByFieldName(const AFieldName: string): TObject;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to ItemCount - 1 do
    if AnsiCompareText(GetItemFieldName(I), AFieldName) = 0 then
    begin
      Result := GetItem(I);
      Break;
    end;
end;

function TcxDBDataController.GetItemField(AItemIndex: Integer): TField;
begin
  CheckItemRange(AItemIndex);
  Result := DBFields[AItemIndex].Field;
end;

function TcxDBDataController.GetItemFieldName(AItemIndex: Integer): string;
begin
  CheckItemRange(AItemIndex);
  Result := DBFields[AItemIndex].FieldName;
end;

procedure TcxDBDataController.Loaded;
begin
  if Provider.IsActiveDataSet then
    LayoutChanged([lcStructure]);
  inherited;
end;

procedure TcxDBDataController.BeginLocate;
begin
  Provider.BeginLocate;
end;

procedure TcxDBDataController.EndLocate;
begin
  Provider.EndLocate;
end;

function TcxDBDataController.GetGroupValue(ARecordIndex: Integer; AField: TcxCustomDataField): Variant;
var
  ADBField: TcxDBDataField;
  I: Integer;
  V: array of Variant;
begin
  ADBField := AField as TcxDBDataField;
  if ADBField.IsLookup then
  begin
    if ADBField.FieldCount = 1 then
      Result := inherited GetGroupValue(ARecordIndex, ADBField[0])
    else
    begin
      SetLength(V, ADBField.FieldCount);
      for I := 0 to ADBField.FieldCount - 1 do
        V[I] := inherited GetGroupValue(ARecordIndex, ADBField[I]);
      Result := V;  
    end;
  end
  else
    Result := inherited GetGroupValue(ARecordIndex, AField);
end;

function TcxDBDataController.GetRecordId(ARecordIndex: Integer): Variant;
var
  AList: TList;
begin
  CheckRecordRange(ARecordIndex);
  AList := TList.Create;
  try
    GetKeyFields(AList);
    Result := GetInternalRecordId(ARecordIndex, AList);
  finally
    AList.Free;
  end;
end;

procedure TcxDBDataController.UpdateGridModeBufferCount;
begin
  if IsGridMode then
    Provider.UpdateGridMode;
end;

procedure TcxDBDataController.RefreshExternalData;
begin
  if Assigned(DataSet) then
    DataSet.Refresh;
end;

function TcxDBDataController.IsBookmarkAvailable: Boolean;
begin
  if IsGridMode then
    Result := FBookmark <> ''
  else
    Result := inherited IsBookmarkAvailable;
end;

function TcxDBDataController.IsBookmarkRow(ARowIndex: Integer): Boolean;
var
  ABookmark: TBookmarkStr;
begin
  if IsGridMode then
  begin
    Result := False;
    if IsBookmarkAvailable and Assigned(DataSet) then
    begin
      ABookmark := DBSelection.GetRowBookmark(ARowIndex);
      if DataSet.CompareBookmarks(TBookmark(FBookmark), TBookmark(ABookmark)) = 0 then
        Result := True;
    end;
  end
  else
    Result := inherited IsBookmarkRow(ARowIndex);
end;

function TcxDBDataController.GetFilterDataValue(ARecordIndex: Integer; AField: TcxCustomDataField): Variant;
var
  ADBField: TcxDBDataField;
begin
  ADBField := AField as TcxDBDataField;
  if Assigned(ADBField) and ADBField.IsLookup then
  begin
    if ADBField.FieldCount > 0 then
      Result := GetFilterDataValue(ARecordIndex, ADBField[0]) // Multiply Lookup Keys not supported
    else
      Result := Null;
  end
  else
    Result := inherited GetFilterDataValue(ARecordIndex, AField);
end;

function TcxDBDataController.GetFilterItemFieldName(AItem: TObject): string;
var
  ADBField: TcxDBDataField;
begin
  Result := '';
  ADBField := Fields.FieldByItem(AItem) as TcxDBDataField;
  if Assigned(ADBField) and Assigned(ADBField.Field) then
  begin
    if ADBField.IsLookup then
    begin
      if ADBField.FieldCount > 0 then
        Result := GetFilterFieldName(ADBField[0].Field, Filter.IgnoreOrigin) // Multiply Lookup Keys not supported
      else
       Result := '';
    end
    else
      Result := GetFilterFieldName(ADBField.Field, Filter.IgnoreOrigin);
  end;
end;

function TcxDBDataController.FindRecordIndexByKey(const AKeyFieldValues: Variant): Integer;
var
  ALocateObject: TcxDataControllerKeyLocateObject;
  AValueDefReader: TcxValueDefUnboundReader;
  I: Integer;
begin
  ALocateObject := TcxDataControllerKeyLocateObject.Create(Self);
  try
    AValueDefReader := TcxValueDefUnboundReader.Create;
    try
      GetKeyFields(ALocateObject.FieldList);
      if ALocateObject.FieldList.Count = 1 then
        AValueDefReader.SetValue(TcxDBDataField(ALocateObject.FieldList[0]).ValueDef, AKeyFieldValues)
      else
        if not VarIsArray(AKeyFieldValues) then
        begin
          Result := -1;
          Exit;
        end
        else
        begin
          for I := 0 to ALocateObject.FieldList.Count - 1 do
            AValueDefReader.SetValue(TcxDBDataField(ALocateObject.FieldList[I]).ValueDef, AKeyFieldValues[I]);
        end;
      ALocateObject.ReadData(AValueDefReader);
    finally
      AValueDefReader.Free;
    end;
    Result := ALocateObject.FindRecordIndex;
  finally
    ALocateObject.Free;
  end;
end;

function TcxDBDataController.LocateByKey(const AKeyFieldValues: Variant): Boolean;

  function TryLocateInGridMode: Boolean;
  begin
    Result := False;
    BeginLocate;
    try
      if DataSet <> nil then
        Result := DataSet.Locate(KeyFieldNames, AKeyFieldValues, [])
    finally
      EndLocate;
    end;
  end;

var
  ARecordIndex, ARowIndex: Integer;
begin
  ARecordIndex := FindRecordIndexByKey(AKeyFieldValues);
  if (ARecordIndex = -1) and IsGridMode then
  begin
    Result := TryLocateInGridMode;
    if Result then
      SyncSelected(True);
    Exit;
  end;
  ARowIndex := -1;
  if ARecordIndex <> -1 then
    ARowIndex := GetRowIndexByRecordIndex(ARecordIndex, True);
  ChangeFocusedRowIndex(ARowIndex);
  Result := ARowIndex <> -1;
end;

procedure TcxDBDataController.CheckCurrentQuery;
begin
  if DataModeController.DetailInSQLMode and
    not DataModeController.DetailIsCurrentQuery(MasterDetailKeyFieldNames,
      MasterDetailKeyValues) then
    with Provider do
    begin
      Freeze;
      FInCheckCurrentQuery := True;
      try
        First;
        SavePos;
        RestorePos;
        FRecordIndex := 0;
      finally
        Unfreeze;
        FInCheckCurrentQuery := False;
      end;
    end;
end;

function TcxDBDataController.GetDetailFilterAdapter: TcxDBProviderDetailFilterAdapter;
var
  AIndex: Integer;
begin
  if cxDetailFilterControllers.FindAdapter(TDataSetClass(DataSet.ClassType), AIndex) then
    Result := cxDetailFilterControllers[AIndex] as TcxDBProviderDetailFilterAdapter
  else
  begin
    Result := nil;
    InvalidOperation(cxSDBDetailFilterControllerNotFound);
  end;
end;

procedure TcxDBDataController.SetMasterRelation(AMasterRelation: TcxCustomDataRelation;
  AMasterRecordIndex: Integer);
var
  ARelation: TcxDBDataRelation;
begin
  BeginUpdate;
  try
    inherited SetMasterRelation(AMasterRelation, AMasterRecordIndex);
    // TODO: set link/remove link
    if (AMasterRelation <> nil) and (AMasterRecordIndex <> -1) and
      (AMasterRelation is TcxDBDataRelation) then
    begin
      ARelation := AMasterRelation as TcxDBDataRelation;
      FMasterDetailKeyValues := ARelation.GetMasterRecordID(AMasterRecordIndex);
      LayoutChanged([lcData]);
    end;
  finally
    EndUpdate;
  end;
end;

function TcxDBDataController.GetSelectedBookmark(Index: Integer): TBookmarkStr;
begin
  if not IsGridMode then InvalidOperation(cxSDBNotInGridMode);
  if IsFocusedSelectedMode then
    Result := DBSelection.GetRowBookmark(FocusedRowIndex) 
  else
    Result := DBSelection.FBookmarks[Index];
end;

function TcxDBDataController.GetSelectedRowIndex(Index: Integer): Integer;
var
  ASelection: TcxDBDataSelection;
  I, ARowCount: Integer;
  ABookmark: TBookmarkStr;
begin
  if not IsGridMode or IsFocusedSelectedMode then
    Result := inherited GetSelectedRowIndex(Index)
  else
  begin
    Result := -1;
    ASelection := DBSelection;
    ARowCount := GetRowCount;
    ABookmark := ASelection.FBookmarks[Index];
// bug in BDEDataSet.CachedUpdates mode
    if (ASelection.CompareBookmarks(ASelection.GetRowBookmark(0), ABookmark) <= 0) and
      (ASelection.CompareBookmarks(ABookmark, ASelection.GetRowBookmark(ARowCount - 1)) <= 0) then
    begin
      for I := 0 to ARowCount - 1 do
        if ASelection.CompareBookmarks(ASelection.GetRowBookmark(I), ABookmark) = 0 then
        begin
          Result := I;
          Break;
        end;
    end;
  end;
end;

function TcxDBDataController.GetSelectionAnchorBookmark: TBookmarkStr;
begin
  if not IsGridMode then InvalidOperation(cxSDBNotInGridMode);
  Result := DBSelection.FAnchorBookmark;
end;

function TcxDBDataController.GetSelectionAnchorRowIndex: Integer;
begin
  if not IsGridMode then
    Result := inherited GetSelectionAnchorRowIndex
  else
    Result := -1;
end;

function TcxDBDataController.IsSelectionAnchorExist: Boolean;
begin
  if not IsGridMode then
    Result := inherited IsSelectionAnchorExist
  else
    Result := GetSelectionAnchorBookmark <> '';
end;

procedure TcxDBDataController.SelectAll;
begin
  if not IsGridMode then
    inherited SelectAll
  else
    DBSelection.SelectAll;
end;

procedure TcxDBDataController.SelectFromAnchor(ARowIndex: Integer; AKeepSelection: Boolean);
var
  ASelectionAnchorBookmark: TBookmarkStr;
  ASelection: TcxDBDataSelection;
begin
  if not IsGridMode then
    inherited SelectFromAnchor(ARowIndex, AKeepSelection)
  else
  begin
    TcxCustomDataControllerInfoAccess(DataControllerInfo).CheckRowIndex(ARowIndex);
    ASelectionAnchorBookmark := GetSelectionAnchorBookmark;
    if ASelectionAnchorBookmark <> '' then
    begin
      ASelection := DBSelection;
      ASelection.SelectFromAnchor(ASelection.GetRowBookmark(ARowIndex), AKeepSelection);
    end;
  end;
end;

procedure TcxDBDataController.SetSelectionAnchor(ARowIndex: Integer);
var
  ASelection: TcxDBDataSelection;
begin
  if not IsGridMode then
    inherited SetSelectionAnchor(ARowIndex)
  else
  begin
    TcxCustomDataControllerInfoAccess(DataControllerInfo).CheckRowIndex(ARowIndex);
    ASelection := DBSelection;
    ASelection.FAnchorBookmark := ASelection.GetRowBookmark(ARowIndex);
  end;
end;

procedure TcxDBDataController.ForEachRow(ASelectedRows: Boolean; AProc: TcxDataControllerEachRowProc);

  procedure DoProc;
  var
    ARowIndex: Integer;
  begin
    ARowIndex := GetFocusedRowIndex;
    AProc(ARowIndex, GetRowInfo(ARowIndex));
  end;

var
  I: Integer;
begin
  if not IsGridMode then
    inherited ForEachRow(ASelectedRows, AProc)
  else
    if DataSet <> nil then
    begin
      if ASelectedRows then
      begin
        if IsFocusedSelectedMode then
          DoProc
        else
          for I := 0 to GetSelectedCount - 1 do
          begin
            DataSet.Bookmark := GetSelectedBookmark(I);
            DoProc;
          end;
      end
      else
      begin
        DataSet.First;
        while not DataSet.EOF do
        begin
          DoProc;
          DataSet.Next;
        end;
      end;
    end;
end;

function TcxDBDataController.IsSequenced: Boolean;
begin
  Result := Assigned(DataSet) and DataSet.IsSequenced;
end;

procedure TcxDBDataController.ChangeValueTypeClass(AItemIndex: Integer;
  AValueTypeClass: TcxValueTypeClass);
begin
  CheckItemRange(AItemIndex);
  if not Assigned(DBFields[AItemIndex].Field) then
    inherited ChangeValueTypeClass(AItemIndex, AValueTypeClass);
end;

function TcxDBDataController.GetInternalRecordId(ARecordIndex: Integer; AList: TList): Variant;
var
  I: Integer;
begin
  if AList.Count > 0 then
  begin
    if AList.Count > 1 then
    begin
      Result := VarArrayCreate([0, AList.Count - 1], varVariant);
      for I := 0 to AList.Count - 1 do
        Result[I] := GetInternalValue(ARecordIndex, AList[I]);
    end
    else
      Result := GetInternalValue(ARecordIndex, AList[0]);
  end
  else
    Result := Null;
end;

procedure TcxDBDataController.GetKeyFields(AList: TList);
begin
  GetInternalKeyFields(FKeyField, AList);
end;

function TcxDBDataController.GetRelationClass: TcxCustomDataRelationClass;
begin
  Result := TcxDBDataRelation;
end;

function TcxDBDataController.GetSummaryItemClass: TcxDataSummaryItemClass;
begin
  Result := TcxDBDataSummaryItem;
end;

procedure TcxDBDataController.InvalidateDataBuffer;
begin
  Change([dccLayout]);
end;

function TcxDBDataController.InternalCheckBookmark(ADeletedRecordIndex: Integer): Boolean;
begin
  if IsGridMode then
    Result := not (Assigned(DataSet) and DataSet.BookmarkValid(TBookmark(FBookmark)))
  else
    Result := inherited InternalCheckBookmark(ADeletedRecordIndex);
end;

procedure TcxDBDataController.InternalClearBookmark;
begin
  FBookmark := '';
  inherited InternalClearBookmark;
end;

procedure TcxDBDataController.InternalGotoBookmark;
begin
  if IsGridMode then
  begin
    if Assigned(DataSet) then
    begin
      DataSet.Bookmark := FBookmark;
      CorrectPrevSelectionChangedInfo;
    end;
  end
  else
    inherited InternalGotoBookmark;
end;

function TcxDBDataController.InternalSaveBookmark: Boolean;
var
  ABookmark: TBookmarkStr;
begin
  if IsGridMode then
  begin
    Result := False;
    if Assigned(DataSet) then
    begin
      ABookmark := DataSet.Bookmark;
      if (FBookmark = '') or
        (DataSet.CompareBookmarks(TBookmark(FBookmark), TBookmark(ABookmark)) <> 0) then
        FBookmark := ABookmark;
    end;
  end
  else
    Result := inherited InternalSaveBookmark;
end;

function TcxDBDataController.IsDataField(AField: TcxCustomDataField): Boolean;
begin
  Result := inherited IsDataField(AField) or
    (TcxDBDataField(AField).Field <> nil);
end;

function TcxDBDataController.IsKeyNavigation: Boolean;
begin
  Result := (FKeyField <> nil) and not IsGridMode;
end;

function TcxDBDataController.LocateRecordIndex(AGetFieldsProc: TGetListProc): Integer;
var
  ALocateObject: TcxDataControllerKeyLocateObject;
  AValueDefReader: TcxValueDefReader;
begin
  ALocateObject := TcxDataControllerKeyLocateObject.Create(Self);
  try
    AGetFieldsProc(ALocateObject.FieldList);
    AValueDefReader := Provider.GetValueDefReaderClass.Create;
    try
      ALocateObject.ReadData(AValueDefReader);
    finally
      AValueDefReader.Free;
    end;
    Result := ALocateObject.FindRecordIndex;
  finally
    ALocateObject.Free;
  end;
end;
                               
procedure TcxDBDataController.NotifyDataControllers;
var
  I: Integer;
begin
  if Provider.FInNotify then Exit;
  Provider.FInNotify := True;
  try
    for I := Provider.FListeners.Count - 1 downto 0 do
    begin
      TcxDBDataProvider(Provider.FListeners[I]).DataLink.DataSetChanged;
      Provider.FListeners.Delete(I);
    end;
  finally
    Provider.FInNotify := False;
  end;
end;

procedure TcxDBDataController.PrepareField(AField: TcxCustomDataField);
begin
  inherited PrepareField(AField);
  RetrieveField(AField as TcxDBDataField, False);
end;

procedure TcxDBDataController.RemoveNotification(AComponent: TComponent);
begin
  inherited RemoveNotification(AComponent);
  MasterDetailKeyFieldsRemoveNotification(AComponent);
end;

procedure TcxDBDataController.ResetDataSetCurrent(ADataController: TcxCustomDataController);
var
  ADBDataController: TcxDBDataController;
begin
  ADBDataController := ADataController as TcxDBDataController;
  ADBDataController.FInResetDataSetCurrent := True;
  try
    ADBDataController.Provider.IsDataSetCurrent := False;
    ADBDataController.ChangeFocusedRecordIndex(-1);
  finally
    ADBDataController.FInResetDataSetCurrent := False;
  end;
end;

procedure TcxDBDataController.ResetDBFields;
begin
  FResetDBFields := True;
  try
    UpdateFields;
  finally
    FResetDBFields := False;
  end;
end;

procedure TcxDBDataController.RestructData;
begin
  if not IsGridMode then
    Provider.DataLink.BufferCount := 1;
  inherited RestructData;
end;

procedure TcxDBDataController.ResyncDBFields;
begin
  UpdateFields;
end;

function TcxDBDataController.IsOtherDetailChanged: Boolean;
begin
  Result := IsDetailMode and DataModeController.DetailInSQLMode and
    (not DataModeController.DetailInSyncMode or
     (not Provider.IsDataSetCurrent and not VarIsEmpty(MasterDetailKeyValues) and
      not VarEquals(GetDataSetValues(DataSet, MasterDetailKeyFields), MasterDetailKeyValues))
     );
end;

function TcxDBDataController.IsOtherDetailCreating: Boolean;
var
  I: Integer;
  ADBDataProvider: TcxDBDataProvider;
begin
  Result := False;
  for I := 0 to DBDataProviders.Count - 1 do
  begin
    ADBDataProvider := DBDataProviders[I];
    if {(ADBDataProvider <> Provider) and}
      (ADBDataProvider.DataSet = Provider.DataSet) then
    begin
      if ADBDataProvider.DataController.FInCheckCurrentQuery or
        ((ADBDataProvider.DataController.GetMasterDataController <> nil) and
         TcxCustomDataControllerAccess(ADBDataProvider.DataController.GetMasterDataController).IsCreatingLinkObject) then
      begin
        Result := True;
        Break;
      end;
    end;
  end;
end;

function TcxDBDataController.IsProviderDataSource: Boolean;
begin
  Result := True;
end;

procedure TcxDBDataController.LoadStorage;
var
  ASaveObject: TcxSaveObject;
begin
  ASaveObject := TcxSaveObject.Create;
  try
    ASaveObject.Save(Self);
    inherited LoadStorage;
    ASaveObject.Restore(Self);
    Provider.ResetPostLocateFlag;
  finally
    ASaveObject.Free;
  end;
end;

procedure TcxDBDataController.RetrieveField(ADataField: TcxDBDataField; AIsLookupKeyOnly: Boolean);

  function IsLookupKeyField(ADataField: TcxDBDataField): Boolean;
  begin
    Result := Assigned(ADataField.ParentField) and Assigned(ADataField.ParentField.Field) and
      ADataField.ParentField.Field.Lookup;
  end;

var
  APrevField: TField;
begin
  if Assigned(ADataField.ReferenceField) then Exit;
  if AIsLookupKeyOnly and not IsLookupKeyField(ADataField) then Exit;
  if Assigned(Provider.DataSet) then
  begin
    APrevField := ADataField.Field;
    if not FResetDBFields then
      ADataField.Field := Provider.DataSet.Fields.FindField(ADataField.FieldName)
    else
      ADataField.Field := nil;
    if Assigned(ADataField.Field) then
    begin
      if (ADataField.Field = APrevField) and IsOtherDetailCreating then
        Exit;
      ADataField.SetPropertiesByField(ADataField.Field);
      if ADataField.Field.Lookup then
        UpdateField(ADataField, ADataField.Field.KeyFields, True);
    end;
  end;
end;

function TcxDBDataController.AddInternalDBField: TcxDBDataField;
begin
  Result := AddInternalField as TcxDBDataField;
end;

procedure TcxDBDataController.UpdateFields;
begin
  inherited UpdateFields;
  UpdateLookupFields;
end;

procedure TcxDBDataController.UpdateFocused;
begin
  BeginUpdate;
  try
    inherited UpdateFocused;
    if Provider.IsSyncMode then
      SyncDataSetPos;
  finally
    EndUpdate;
  end;
end;

procedure TcxDBDataController.UpdateInternalKeyFields(const AFieldNames: string;
  var AField: TcxDBDataField);
begin
  if AFieldNames = '' then
  begin
    AField.Free;
    AField := nil;
    Change([dccData]);
  end
  else
  begin
    if AField = nil then
      AField := AddInternalDBField;
    UpdateField(AField, AFieldNames, False);
  end;
end;

procedure TcxDBDataController.UpdateLookupFields;
var
  I: Integer;
begin
  for I := 0 to Fields.Count  - 1 do
    RetrieveField(DBFields[I], True);
end;

procedure TcxDBDataController.UpdateRelations(ARelation: TcxCustomDataRelation);
begin
  inherited UpdateRelations(ARelation);
  UpdateRelationFields;
end;

procedure TcxDBDataController.UpdateScrollBars;
begin
end;

function TcxDBDataController.GetDataSet: TDataSet;
begin
  Result := Provider.DataSet;
end;

function TcxDBDataController.GetDataSetRecordCount: Integer;
begin
  if DataSet.Active then
    Result := DataSet.RecordCount
  else
    Result := 0;  
end;

function TcxDBDataController.GetDataSource: TDataSource;
begin
  Result := Provider.DataSource;
end;

function TcxDBDataController.GetDBField(Index: Integer): TcxDBDataField;
begin
  Result := Fields[Index] as TcxDBDataField;
end;

function TcxDBDataController.GetDBSelection: TcxDBDataSelection;
begin
  Result := TcxCustomDataControllerInfoAccess(DataControllerInfo).Selection as TcxDBDataSelection;
end;

function TcxDBDataController.GetFilter: TcxDBDataFilterCriteria;
begin
  Result := inherited Filter as TcxDBDataFilterCriteria;
end;

function TcxDBDataController.GetMasterDetailKeyFieldNames: string;
begin
  if MasterKeyFieldNames <> '' then
    Result := DetailKeyFieldNames
  else
    Result := '';
end;

function TcxDBDataController.GetMasterDetailKeyFields: TList;
begin
  if FMasterDetailKeyFields = nil then
  begin
    FMasterDetailKeyFields := TList.Create;
    if Assigned(Provider.DataSet) then
      Provider.DataSet.GetFieldList(FMasterDetailKeyFields, MasterDetailKeyFieldNames);
  end;
  Result := FMasterDetailKeyFields;
end;

function TcxDBDataController.GetProvider: TcxDBDataProvider;
begin
  Result := inherited Provider as TcxDBDataProvider;
end;

function TcxDBDataController.GetRecNo: Integer;
begin
  if DataSet.Active then
    Result := DataSet.RecNo
  else
    Result := -1;
end;

procedure TcxDBDataController.MasterDetailKeyFieldsRemoveNotification(AComponent: TComponent);
begin
  if Assigned(FMasterDetailKeyFields) and
    (FMasterDetailKeyFields.IndexOf(AComponent) <> -1) then
    ClearMasterDetailKeyFields;
end;

procedure TcxDBDataController.RemoveKeyField;
begin
  FKeyField.Free;
  FKeyField := nil;
end;

procedure TcxDBDataController.SetDataModeController(Value: TcxDBDataModeController);
begin
  FDataModeController.Assign(Value);
end;

procedure TcxDBDataController.SetDataSource(Value: TDataSource);
var
  APrevDataSource: TDataSource;
begin
  APrevDataSource := DataSource;
  Provider.DataSource := Value;
  if DataSource <> APrevDataSource then
    DoDataSourceChanged;
end;

procedure TcxDBDataController.SetDetailKeyFieldNames(const Value: string);
begin
  if FDetailKeyFieldNames <> Value then
  begin
    FDetailKeyFieldNames := Value;
    if GetMasterRelation <> nil then
      (GetMasterRelation as TcxDBDataRelation).UpdateMasterDetailKeyFieldNames;
  end;
end;

procedure TcxDBDataController.SetFilter(Value: TcxDBDataFilterCriteria);
begin
  inherited Filter := Value;
end;

procedure TcxDBDataController.SetKeyFieldNames(const Value: string);
begin
  if FKeyFieldNames <> Value then
  begin
    FKeyFieldNames := Value;
    UpdateInternalKeyFields(FKeyFieldNames, FKeyField);
  end;
end;

procedure TcxDBDataController.SetMasterKeyFieldNames(const Value: string);
begin
  if FMasterKeyFieldNames <> Value then
  begin
    FMasterKeyFieldNames := Value;
    if GetMasterRelation <> nil then
      (GetMasterRelation as TcxDBDataRelation).UpdateMasterDetailKeyFieldNames;
  end;
end;

procedure TcxDBDataController.SetRecNo(Value: Integer);
begin
  DataSet.RecNo := Value;
end;

procedure TcxDBDataController.SyncDataSetPos;
var
  APrevRecordIndex: Integer;
begin
  if DetailMode = dcdmPattern then
  begin
    if not Provider.FActiveChanging and not Provider.IsDataSetBusy then
      SyncMasterDetailDataSetPos;
  end
  else
    if IsKeyNavigation then
    begin
      APrevRecordIndex := Provider.FRecordIndex;
      Provider.FRecordIndex := LocateRecordIndex(GetKeyFields);
      if APrevRecordIndex <> Provider.FRecordIndex then
        UpdateFocused;
    end;
end;

function TcxDBDataController.SyncMasterDetail: TcxCustomDataController;

  function ExpandDetails(ADataController: TcxCustomDataController;
    ARelationIndex: Integer): TcxCustomDataController;
  var
    ARowIndex, ARecordIndex: Integer;
  begin
    Result := nil;
    ARowIndex := ADataController.GetFocusedRowIndex; // TODO: FocusedRecordIndex
    if ARowIndex <> -1 then
    begin
      ARecordIndex := ADataController.GetRowInfo(ARowIndex).RecordIndex;
      ADataController.ChangeDetailExpanding(ARecordIndex, True);
      if ADataController.GetDetailExpanding(ARecordIndex) then
      begin
        ADataController.ChangeDetailActiveRelationIndex(ARecordIndex, ARelationIndex);
        Result := ADataController.GetDetailDataController(ARecordIndex, ARelationIndex)
      end;
    end;
  end;

  function IsMastersInSyncMode(AMasterDataController: TcxDBDataController): Boolean;
  var
    AMasterRelation: TcxDBDataRelation;
  begin
    Result := AMasterDataController.Provider.IsSyncMode and
      AMasterDataController.IsKeyNavigation and
      not AMasterDataController.Provider.IsEditing;
    if Result then
    begin
      AMasterRelation := AMasterDataController.GetMasterRelation as TcxDBDataRelation;
      if AMasterRelation <> nil then
        Result := IsMastersInSyncMode(AMasterRelation.DataController);
    end;
  end;

var
  AMasterRelation: TcxDBDataRelation;
  AMasterDetailKeyValues, AMasterKeyValues: Variant;
  AMasterDataController: TcxDBDataController;
  ADataController: TcxCustomDataController;
  AEqualFlag: Boolean;
begin
  if (GetMasterRelation <> nil) and (MasterDetailKeyFieldNames <> '') then
  begin
    Result := nil;
    AMasterRelation := GetMasterRelation as TcxDBDataRelation;
    AMasterDataController := AMasterRelation.DataController;

    if Provider.IsSyncMode and IsMastersInSyncMode(AMasterDataController) and
      not AMasterDataController.IsCreatingLinkObject then
    begin
      AMasterDataController.FUpdateDataSetPos := True;
      try
        AMasterDetailKeyValues := Provider.DataSet.FieldValues[AMasterRelation.DetailKeyFieldNames];
        AMasterKeyValues := AMasterDataController.Provider.DataSet.FieldValues[AMasterRelation.MasterKeyFieldNames];
        AEqualFlag := VarEquals(AMasterKeyValues, AMasterDetailKeyValues);
        if not AEqualFlag then
        begin
          AMasterDataController.Provider.BeginLocate;
          try
            AEqualFlag := AMasterDataController.Provider.DataSet.Locate(AMasterRelation.MasterKeyFieldNames,
              AMasterDetailKeyValues, []);
          finally
            AMasterDataController.Provider.EndLocate;
          end;
        end;
        if AEqualFlag then
        begin
          ADataController := AMasterDataController.SyncMasterDetail;
          if ADataController <> nil then
            Result := ExpandDetails(ADataController, AMasterRelation.Index);
        end;
      finally
        AMasterDataController.FUpdateDataSetPos := False;
      end;
    end;
  end
  else
    Result := Self;
end;

procedure TcxDBDataController.SyncMasterDetailDataSetPos;
begin
  if FUpdateDataSetPos or FInCheckBrowseMode then Exit;
  SyncMasterDetail;                                                     
end;

procedure TcxDBDataController.UpdateRelationFields;
var
  I: Integer;
  AMasterKeyFieldNames: string;
begin
  for I := 0 to Relations.Count - 1 do
    if Relations[I] is TcxDBDataRelation then
    begin
      AMasterKeyFieldNames := (Relations[I] as TcxDBDataRelation).MasterKeyFieldNames;
      UpdateInternalKeyFields(AMasterKeyFieldNames, (Relations[I] as TcxDBDataRelation).FMasterKeyField);
    end;
end;

initialization
  cxDetailFilterControllers := TcxDBAdapterList.Create;
  cxDetailFilterControllers.RegisterAdapter(TDataSet, TcxDBProviderDetailFilterAdapter);

finalization
  cxDetailFilterControllers.Free;
  cxDetailFilterControllers := nil;

end.
