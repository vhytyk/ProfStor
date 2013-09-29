
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

unit cxFilter;

{$I cxDataVer.inc}

interface

uses
  Classes{$IFDEF DELPHI6}, Variants{$ENDIF};

type
  TcxFilterOperatorKind = (foEqual, foNotEqual, foLess, foLessEqual,
    foGreater, foGreaterEqual, foLike, foNotLike, foBetween, foNotBetween,
    foInList, foNotInList,
    foYesterday, foToday, foTomorrow,
    foLastWeek, foLastMonth, foLastYear, 
    foThisWeek, foThisMonth, foThisYear,
    foNextWeek, foNextMonth, foNextYear);
  TcxFilterOperatorKinds = set of TcxFilterOperatorKind;
  TcxFilterBoolOperatorKind = (fboAnd, fboOr, fboNotAnd, fboNotOr);

  TcxFilterCriteriaItemList = class;
  TcxFilterCriteriaItem = class;
  TcxFilterCriteria = class;

  { TcxFilterOperator
    CompareValues(): Value1 is Data Value, Value2 is CompareItem's Value }

  TcxFilterOperator = class
  private
    FCriteriaItem: TcxFilterCriteriaItem;
  protected
    function GetExpressionFilterText(const AValue: Variant): string; virtual;
    function GetExpressionValue(const AValue: Variant): string; virtual;
    procedure PrepareDisplayValue(var DisplayValue: string); virtual;
    procedure Prepare; virtual;
    function PrepareExpressionValue(const AValue: Variant; var DisplayValue: string): Boolean; virtual;
  public
    constructor Create(ACriteriaItem: TcxFilterCriteriaItem); virtual;
    function CompareValues(const AValue1, AValue2: Variant): Boolean; virtual; abstract;
    function DisplayText: string; virtual;
    function FilterText: string; virtual; abstract;
    function IsDescription: Boolean; virtual;
    function IsExpression: Boolean; virtual;
    property CriteriaItem: TcxFilterCriteriaItem read FCriteriaItem;
  end;

  TcxFilterOperatorClass = class of TcxFilterOperator;

  { TcxFilterEqualOperator }

  TcxFilterEqualOperator = class(TcxFilterOperator)
  public
    function CompareValues(const AValue1, AValue2: Variant): Boolean; override;
    function DisplayText: string; override;
    function FilterText: string; override;
  end;

  { TcxFilterNotEqualOperator }

  TcxFilterNotEqualOperator = class(TcxFilterEqualOperator)
  public
    function CompareValues(const AValue1, AValue2: Variant): Boolean; override;
    function DisplayText: string; override;
    function FilterText: string; override;
  end;

  { TcxFilterLessOperator }

  TcxFilterLessOperator = class(TcxFilterOperator)
  public
    function CompareValues(const AValue1, AValue2: Variant): Boolean; override;
    function DisplayText: string; override;
    function FilterText: string; override;
  end;

  { TcxFilterLessEqualOperator }

  TcxFilterLessEqualOperator = class(TcxFilterOperator)
  public
    function CompareValues(const AValue1, AValue2: Variant): Boolean; override;
    function DisplayText: string; override;
    function FilterText: string; override;
  end;

  { TcxFilterGreaterOperator }

  TcxFilterGreaterOperator = class(TcxFilterOperator)
  public
    function CompareValues(const AValue1, AValue2: Variant): Boolean; override;
    function DisplayText: string; override;
    function FilterText: string; override;
  end;

  { TcxFilterGreaterEqualOperator }

  TcxFilterGreaterEqualOperator = class(TcxFilterOperator)
  public
    function CompareValues(const AValue1, AValue2: Variant): Boolean; override;
    function DisplayText: string; override;
    function FilterText: string; override;
  end;

  { TcxFilterLikeOperator }

  TcxFilterLikeOperator = class(TcxFilterOperator)
  protected
    procedure PrepareDisplayValue(var DisplayValue: string); override;
  public
    function CompareValues(const AValue1, AValue2: Variant): Boolean; override;
    function DisplayText: string; override;
    function FilterText: string; override;
  end;

  { TcxFilterNotLikeOperator }

  TcxFilterNotLikeOperator = class(TcxFilterLikeOperator)
  public
    function CompareValues(const AValue1, AValue2: Variant): Boolean; override;
    function DisplayText: string; override;
    function FilterText: string; override;
  end;

  { TcxFilterBetweenOperator }

  TcxFilterBetweenOperator = class(TcxFilterOperator)
  protected
    procedure PrepareDisplayValue(var DisplayValue: string); override;
    function PrepareExpressionValue(const AValue: Variant; var DisplayValue: string): Boolean; override;
  public
    function CompareValues(const AValue1, AValue2: Variant): Boolean; override;
    function DisplayText: string; override;
    function FilterText: string; override;
    function IsDescription: Boolean; override;
  end;

  { TcxFilterNotBetweenOperator }

  TcxFilterNotBetweenOperator = class(TcxFilterBetweenOperator)
  public
    function CompareValues(const AValue1, AValue2: Variant): Boolean; override;
    function DisplayText: string; override;
    function FilterText: string; override;
  end;

  { TcxFilterInListOperator }

  TcxFilterInListOperator = class(TcxFilterOperator)
  protected
    procedure PrepareDisplayValue(var DisplayValue: string); override;
    function PrepareExpressionValue(const AValue: Variant; var DisplayValue: string): Boolean; override;
  public
    function CompareValues(const AValue1, AValue2: Variant): Boolean; override;
    function DisplayText: string; override;
    function FilterText: string; override;
    function IsDescription: Boolean; override;
  end;

  { TcxFilterNotInListOperator }

  TcxFilterNotInListOperator = class(TcxFilterInListOperator)
  public
    function CompareValues(const AValue1, AValue2: Variant): Boolean; override;
    function DisplayText: string; override;
    function FilterText: string; override;
  end;

  { TcxFilterNullOperator }

  TcxFilterNullOperator = class(TcxFilterEqualOperator)
  protected
    procedure PrepareDisplayValue(var DisplayValue: string); override;
  public
    function CompareValues(const AValue1, AValue2: Variant): Boolean; override;
    function DisplayText: string; override;
  end;

  { TcxFilterNotNullOperator }

  TcxFilterNotNullOperator = class(TcxFilterNullOperator)
  public
    function CompareValues(const AValue1, AValue2: Variant): Boolean; override;
    function DisplayText: string; override;
    function FilterText: string; override;
  end;

  { TcxFilterDateOperator }

  TcxFilterDateOperator = class(TcxFilterOperator)
  private
    FDate1: TDateTime;
    FDate2: TDateTime;
  protected
    procedure PrepareDisplayValue(var DisplayValue: string); override;
    function GetExpressionFilterText(const AValue: Variant): string; override;
  public
    function CompareValues(const AValue1, AValue2: Variant): Boolean; override;
    function FilterText: string; override;
    function IsExpression: Boolean; override;
    property Date1: TDateTime read FDate1 write FDate1;
    property Date2: TDateTime read FDate2 write FDate2;
  end;

  { Yesterday }

  TcxFilterYesterdayOperator = class(TcxFilterDateOperator)
  protected
    procedure Prepare; override;
  public
    function DisplayText: string; override;
  end;

  { Today }

  TcxFilterTodayOperator = class(TcxFilterDateOperator)
  protected
    procedure Prepare; override;
  public
    function DisplayText: string; override;
  end;

  { Tomorrow }

  TcxFilterTomorrowOperator = class(TcxFilterDateOperator)
  protected
    procedure Prepare; override;
  public
    function DisplayText: string; override;
  end;

  { LastWeek }

  TcxFilterLastWeekOperator = class(TcxFilterDateOperator)
  protected
    procedure Prepare; override;
  public
    function DisplayText: string; override;
  end;

  { LastMonth }

  TcxFilterLastMonthOperator = class(TcxFilterDateOperator)
  protected
    procedure Prepare; override;
  public
    function DisplayText: string; override;
  end;

  { LastYear }

  TcxFilterLastYearOperator = class(TcxFilterDateOperator)
  protected
    procedure Prepare; override;
  public
    function DisplayText: string; override;
  end;
  
  { ThisWeek }

  TcxFilterThisWeekOperator = class(TcxFilterDateOperator)
  protected
    procedure Prepare; override;
  public
    function DisplayText: string; override;
  end;
  
  { ThisMonth }

  TcxFilterThisMonthOperator = class(TcxFilterDateOperator)
  protected
    procedure Prepare; override;
  public
    function DisplayText: string; override;
  end;
  
  { ThisYear }

  TcxFilterThisYearOperator = class(TcxFilterDateOperator)
  protected
    procedure Prepare; override;
  public
    function DisplayText: string; override;
  end;

  { NextWeek }

  TcxFilterNextWeekOperator = class(TcxFilterDateOperator)
  protected
    procedure Prepare; override;
  public
    function DisplayText: string; override;
  end;

  { NextMonth }

  TcxFilterNextMonthOperator = class(TcxFilterDateOperator)
  protected
    procedure Prepare; override;
  public
    function DisplayText: string; override;
  end;

  { NextYear }

  TcxFilterNextYearOperator = class(TcxFilterDateOperator)
  protected
    procedure Prepare; override;
  public
    function DisplayText: string; override;
  end;

  { TcxCustomFilterCriteriaItem }

  TcxCustomFilterCriteriaItem = class
  private
    FParent: TcxFilterCriteriaItemList;
  protected
    procedure Changed; virtual;
    function GetCriteria: TcxFilterCriteria; virtual;
    function GetIsItemList: Boolean; virtual; abstract;
    procedure ReadData(AStream: TStream); virtual;
    procedure WriteData(AStream: TStream); virtual;
  public
    constructor Create(AOwner: TcxFilterCriteriaItemList);
    destructor Destroy; override;
    property IsItemList: Boolean read GetIsItemList;
    property Criteria: TcxFilterCriteria read GetCriteria;
    property Parent: TcxFilterCriteriaItemList read FParent;
  end;

  { TcxFilterCriteriaItemList }

  TcxFilterCriteriaItemList = class(TcxCustomFilterCriteriaItem)
  private
    FBoolOperatorKind: TcxFilterBoolOperatorKind;
    FCriteria: TcxFilterCriteria;
    FItems: TList;
    function GetCount: Integer;
    function GetItem(Index: Integer): TcxCustomFilterCriteriaItem;
  protected
    function GetCriteria: TcxFilterCriteria; override;
    function GetIsItemList: Boolean; override;
    procedure RemoveItem(AItem: TcxCustomFilterCriteriaItem); virtual;
    procedure WriteData(AStream: TStream); override;
  public
    constructor Create(AOwner: TcxFilterCriteriaItemList; ABoolOperatorKind: TcxFilterBoolOperatorKind);
    destructor Destroy; override;
    function AddItem(AItemLink: TObject; AOperatorKind: TcxFilterOperatorKind;
      const AValue: Variant; const ADisplayValue: string): TcxFilterCriteriaItem;
    function AddItemList(ABoolOperatorKind: TcxFilterBoolOperatorKind): TcxFilterCriteriaItemList;
    procedure Clear;
    property BoolOperatorKind: TcxFilterBoolOperatorKind read FBoolOperatorKind write FBoolOperatorKind default fboAnd;
    property Count: Integer read GetCount;
    property Criteria: TcxFilterCriteria read GetCriteria;
    property Items[Index: Integer]: TcxCustomFilterCriteriaItem read GetItem; default;
  end;

  { TcxFilterCriteriaItem }

  TcxFilterCriteriaItem = class(TcxCustomFilterCriteriaItem)
  private
    FDisplayValue: string;
    FItemLink: TObject;
    FOperator: TcxFilterOperator;
    FOperatorKind: TcxFilterOperatorKind;
    FValue: Variant;
    procedure SetDisplayValue(const Value: string);
    procedure SetOperatorKind(Value: TcxFilterOperatorKind);
    procedure SetValue(const Value: Variant);
  protected
    function GetDataValue(AData: Pointer): Variant; virtual; abstract; // TODO: ?
    function GetDisplayValue: string; virtual;
    function GetExpressionValue(AIsCaption: Boolean): string; virtual;
    function GetFieldCaption: string; virtual; abstract;
    function GetFieldName: string; virtual; abstract;
    function GetFilterOperatorClass: TcxFilterOperatorClass; virtual;
    function GetItemLink: TObject; virtual;
    function GetIsItemList: Boolean; override;
    procedure RecreateOperator; virtual;
    procedure WriteData(AStream: TStream); override;
  public
    constructor Create(AOwner: TcxFilterCriteriaItemList; AItemLink: TObject;
      AOperatorKind: TcxFilterOperatorKind; const AValue: Variant;
      const ADisplayValue: string); virtual;
    destructor Destroy; override;
    function ValueIsNull(const AValue: Variant): Boolean; virtual;
    property DisplayValue: string read FDisplayValue write SetDisplayValue;
    property ItemLink: TObject read GetItemLink;
    property Operator: TcxFilterOperator read FOperator;
    property OperatorKind: TcxFilterOperatorKind read FOperatorKind write SetOperatorKind;
    property Value: Variant read FValue write SetValue;
  end;

  TcxFilterCriteriaItemClass = class of TcxFilterCriteriaItem;

  { TcxFilterValueList }

  TcxFilterValueItemKind = (fviAll, fviCustom, fviBlanks, fviNonBlanks, fviUser, fviValue);

  PcxFilterValueItem = ^TcxFilterValueItem;
  TcxFilterValueItem = record
    Kind: TcxFilterValueItemKind;
    Value: Variant;
    DisplayText: string;
  end;

  TcxFilterValueList = class
  private
    FCriteria: TcxFilterCriteria;
    FItems: TList;
    FSortByDisplayText: Boolean;
    function GetCount: Integer;
    function GetItem(Index: Integer): PcxFilterValueItem;
    function GetMaxCount: Integer;
  protected
    function CompareItem(AIndex: Integer; const AValue: Variant; const ADisplayText: string): Integer; virtual;
    function GetStartValueIndex: Integer;
  public
    constructor Create(ACriteria: TcxFilterCriteria); virtual;
    destructor Destroy; override;
    procedure Add(AKind: TcxFilterValueItemKind; const AValue: Variant; const ADisplayText: string; ANoSorting: Boolean); virtual;
    procedure Clear; virtual;
    procedure Delete(AIndex: Integer);
    function Find(const AValue: Variant; const ADisplayText: string; var AIndex: Integer): Boolean; virtual;
    function FindItemByKind(AKind: TcxFilterValueItemKind): Integer;
    function FindItemByValue(const AValue: Variant): Integer;
    function GetIndexByCriteriaItem(ACriteriaItem: TcxFilterCriteriaItem): Integer; virtual;
    property Count: Integer read GetCount;
    property Criteria: TcxFilterCriteria read FCriteria;
    property Items[Index: Integer]: PcxFilterValueItem read GetItem; default;
    property MaxCount: Integer read GetMaxCount;
    property SortByDisplayText: Boolean read FSortByDisplayText write FSortByDisplayText;
  end;

  TcxFilterValueListClass = class of TcxFilterValueList;

  { TcxFilterCriteria }

  TcxFilterCriteriaOption = (fcoCaseInsensitive, fcoShowOperatorDescription,
    fcoSoftNull, fcoSoftCompare);
  TcxFilterCriteriaOptions = set of TcxFilterCriteriaOption;

  TcxFilterCriteria = class(TPersistent)
  private
    FDateTimeFormat: string;
    FLockCount: Integer;
    FMaxValueListCount: Integer;
    FOptions: TcxFilterCriteriaOptions;
    FPercentWildcard: Char;
    FRoot: TcxFilterCriteriaItemList;
    FUnderscoreWildcard: Char;
    FOnChanged: TNotifyEvent;
    function GetOptions: TcxFilterCriteriaOptions;
    procedure ReadItem(AStream: TStream; AItemList: TcxFilterCriteriaItemList);
    procedure SetDateTimeFormat(const Value: string);
    procedure SetOptions(Value: TcxFilterCriteriaOptions);
    procedure SetPercentWildcard(Value: Char);
    procedure SetUnderscoreWildcard(Value: Char);
  protected
    procedure Changed; virtual;
    function ConvertDateToStr(const AValue: Variant): string; virtual;
    function DoFilterData(AData: Pointer): Boolean;
    function GetFilterCaption: string; virtual;
    function GetFilterExpression(AIsCaption: Boolean): string; virtual;
    function GetFilterText: string; virtual;
    function GetIDByItemLink(AItemLink: TObject): Integer; virtual; abstract;
    function GetItemClass: TcxFilterCriteriaItemClass; virtual;
    function GetItemExpression(AItem: TcxFilterCriteriaItem; AIsCaption: Boolean): string; virtual;
    function GetItemExpressionFieldName(AItem: TcxFilterCriteriaItem; AIsCaption: Boolean): string; virtual;
    function GetItemExpressionOperator(AItem: TcxFilterCriteriaItem; AIsCaption: Boolean): string; virtual;
    function GetItemExpressionValue(AItem: TcxFilterCriteriaItem; AIsCaption: Boolean): string; virtual;
    function GetItemLinkByID(AID: Integer): TObject; virtual; abstract;
    function GetValueListClass: TcxFilterValueListClass; virtual;
    procedure Prepare; virtual;
    function PrepareValue(const AValue: Variant): Variant; virtual;
    procedure ReadData(AStream: TStream); virtual;
    procedure SetFilterText(const Value: string); virtual;
    procedure Update; virtual;
    procedure WriteData(AStream: TStream); virtual;
    property LockCount: Integer read FLockCount;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure AssignEvents(Source: TPersistent); virtual;
    procedure AssignItems(ASource: TcxFilterCriteria); virtual;
    function AddItem(AParent: TcxFilterCriteriaItemList; AItemLink: TObject;
      AOperatorKind: TcxFilterOperatorKind; const AValue: Variant;
      const ADisplayValue: string): TcxFilterCriteriaItem; virtual;
    procedure BeginUpdate;
    procedure CancelUpdate;
    procedure Clear;
    procedure EndUpdate;
    function FindItemByItemLink(AItemLink: TObject): TcxFilterCriteriaItem; virtual;
    function IsEmpty: Boolean; virtual;
    procedure Refresh;
    procedure RemoveItemByItemLink(AItemLink: TObject);
    procedure RestoreDefaults; virtual;
    function ValueIsNull(const AValue: Variant): Boolean; virtual;

    property DateTimeFormat: string read FDateTimeFormat write SetDateTimeFormat;
    property FilterCaption: string read GetFilterCaption;
    property FilterText: string read GetFilterText write SetFilterText;
    property Root: TcxFilterCriteriaItemList read FRoot;
  published
    property MaxValueListCount: Integer read FMaxValueListCount write FMaxValueListCount default 0;
    property Options: TcxFilterCriteriaOptions read GetOptions write SetOptions default [];
    property PercentWildcard: Char read FPercentWildcard write SetPercentWildcard default '%';
    property UnderscoreWildcard: Char read FUnderscoreWildcard write SetUnderscoreWildcard default '_';
    property OnChanged: TNotifyEvent read FOnChanged write FOnChanged;
  end;

function ExtractFilterDisplayValue(const AValues: string; var Pos: Integer): string;

//function StrToVarBetweenArray(const AValue: string): Variant;
//function StrToVarListArray(const AValue: string): Variant;

function VarBetweenArrayToStr(const AValue: Variant): string;
function VarListArrayToStr(const AValue: Variant): string;

implementation

uses
  SysUtils{$IFDEF DELPHI6}, RTLConsts{$ENDIF}, cxVariants, cxLike,
  cxFilterConsts, cxDataUtils;

function FilterVarToStr(const AValue: Variant): string;
begin
  if VarIsNull(AValue) then
    Result := cxSFilterString(@cxSFilterBlankCaption)
  else
    Result := VarToStr(AValue);
end;

function ExtractFilterDisplayValue(const AValues: string; var Pos: Integer): string;
var
  I: Integer;
begin
  I := Pos;
  while (I <= Length(AValues)) and (AValues[I] <> ';') do Inc(I);
  Result := Trim(Copy(AValues, Pos, I - Pos));
  if (I <= Length(AValues)) and (AValues[I] = ';') then Inc(I);
  Pos := I;
end;

function StrToVarBetweenArray(const AValue: string): Variant;
var
  APos: Integer;
  S1, S2: string;
begin
  S1 := '';
  S2 := '';
  APos := 1;
  S1 := ExtractFilterDisplayValue(AValue, APos);
  if APos <= Length(AValue) then
    S2 := ExtractFilterDisplayValue(AValue, APos);
  Result := VarBetweenArrayCreate(S1, S2);  
end;

function StrToVarListArray(const AValue: string): Variant;
var
  AEmpty: Boolean;
  APos: Integer;
  S: string;
begin
  AEmpty := True;
  Result := '';
  APos := 1;
  while APos <= Length(AValue) do
  begin
    S := ExtractFilterDisplayValue(AValue, APos);
    if AEmpty then
    begin
      Result := VarListArrayCreate(S);
      AEmpty := False;
    end
    else
      VarListArrayAddValue(Result, S);
  end;
end;

function VarBetweenArrayToStr(const AValue: Variant): string;
begin
  Result := FilterVarToStr(AValue[0]) + ' ' + cxSFilterString(@cxSFilterAndCaption) + ' ' +
    FilterVarToStr(AValue[1]);
end;

function VarListArrayToStr(const AValue: Variant): string;
var
  I: Integer;
begin
  Result := '(' + FilterVarToStr(AValue[0]);
  for I := VarArrayLowBound(AValue, 1) + 1 to VarArrayHighBound(AValue, 1) do
    Result := Result + ', ' + FilterVarToStr(AValue[I]);
  Result := Result + ')';
end;

{ TcxFilterOperator }

constructor TcxFilterOperator.Create(ACriteriaItem: TcxFilterCriteriaItem);
begin
  inherited Create;
  FCriteriaItem := ACriteriaItem;
end;

function TcxFilterOperator.DisplayText: string;
begin
  Result := FilterText;
end;

function TcxFilterOperator.IsDescription: Boolean;
begin
  Result := False;
end;

function TcxFilterOperator.IsExpression: Boolean;
begin
  Result := False;
end;

function TcxFilterOperator.GetExpressionFilterText(const AValue: Variant): string;
begin
  Result := GetExpressionValue(AValue);
end;

function TcxFilterOperator.GetExpressionValue(const AValue: Variant): string;
var
  AVarType: Integer;
begin
  if not PrepareExpressionValue(AValue, Result) then
  begin
    AVarType := VarType(AValue);
    if (AVarType = varString) or (AVarType = varOleStr) then
      Result := '''' + VarToStr(AValue) + ''''
    else
      if AVarType = varDate then
        Result := '''' + CriteriaItem.Criteria.ConvertDateToStr(AValue) + ''''
      else
        if AVarType = varNull then
          Result := 'NULL'
        else
          Result := VarToStr(AValue);
  end;
end;

procedure TcxFilterOperator.PrepareDisplayValue(var DisplayValue: string);
begin
end;

procedure TcxFilterOperator.Prepare;
begin
end;

function TcxFilterOperator.PrepareExpressionValue(const AValue: Variant; var DisplayValue: string): Boolean;
begin
  Result := False;
end;

{ TcxFilterEqualOperator }

function TcxFilterEqualOperator.CompareValues(const AValue1, AValue2: Variant): Boolean;
begin
  Result := (AValue1 = AValue2);
end;

function TcxFilterEqualOperator.DisplayText: string;
begin
  Result := cxSFilterString(@cxSFilterOperatorEqual);
end;

function TcxFilterEqualOperator.FilterText: string;
begin
  Result := '=';
end;

{ TcxFilterNotEqualOperator }

function TcxFilterNotEqualOperator.CompareValues(const AValue1, AValue2: Variant): Boolean;
begin
  Result := not inherited CompareValues(AValue1, AValue2);
end;

function TcxFilterNotEqualOperator.DisplayText: string;
begin
  Result := cxSFilterString(@cxSFilterOperatorNotEqual);
end;

function TcxFilterNotEqualOperator.FilterText: string;
begin
  Result := '<>';
end;

{ TcxFilterLessOperator }

function TcxFilterLessOperator.CompareValues(const AValue1, AValue2: Variant): Boolean;
begin
  {$IFNDEF DELPHI6}
  Result := (AValue1 < AValue2);
  {$ELSE}
  Result := VarCompare(AValue1, AValue2) < 0;
  {$ENDIF}
end;

function TcxFilterLessOperator.DisplayText: string;
begin
  Result := cxSFilterString(@cxSFilterOperatorLess);
end;

function TcxFilterLessOperator.FilterText: string;
begin
  Result := '<';
end;

{ TcxFilterLessEqualOperator }

function TcxFilterLessEqualOperator.CompareValues(const AValue1, AValue2: Variant): Boolean;
begin
  {$IFNDEF DELPHI6}
  Result := (AValue1 <= AValue2);
  {$ELSE}
  Result := VarCompare(AValue1, AValue2) <= 0;
  {$ENDIF}
end;

function TcxFilterLessEqualOperator.DisplayText: string;
begin
  Result := cxSFilterString(@cxSFilterOperatorLessEqual);
end;

function TcxFilterLessEqualOperator.FilterText: string;
begin
  Result := '<=';
end;

{ TcxFilterGreaterOperator }

function TcxFilterGreaterOperator.CompareValues(const AValue1, AValue2: Variant): Boolean;
begin
  {$IFNDEF DELPHI6}
  Result := (AValue1 > AValue2);
  {$ELSE}
  Result := VarCompare(AValue1, AValue2) > 0;
  {$ENDIF}
end;

function TcxFilterGreaterOperator.DisplayText: string;
begin
  Result := cxSFilterString(@cxSFilterOperatorGreater);
end;

function TcxFilterGreaterOperator.FilterText: string;
begin
  Result := '>';
end;

{ TcxFilterGreaterEqualOperator }

function TcxFilterGreaterEqualOperator.CompareValues(const AValue1, AValue2: Variant): Boolean;
begin
  {$IFNDEF DELPHI6}
  Result := (AValue1 >= AValue2);
  {$ELSE}
  Result := VarCompare(AValue1, AValue2) >= 0;
  {$ENDIF}
end;

function TcxFilterGreaterEqualOperator.DisplayText: string;
begin
  Result := cxSFilterString(@cxSFilterOperatorGreaterEqual);
end;

function TcxFilterGreaterEqualOperator.FilterText: string;
begin
  Result := '>=';
end;

{ TcxFilterLikeOperator }

function TcxFilterLikeOperator.CompareValues(const AValue1, AValue2: Variant): Boolean;
begin
  Result := LikeStr(VarToStr(AValue1), AValue2,
    CriteriaItem.Criteria.PercentWildcard, CriteriaItem.Criteria.UnderscoreWildcard);
end;

function TcxFilterLikeOperator.DisplayText: string;
var
  S: string;
begin
  S := CriteriaItem.Value;
  case LikeOperatorByPattern(S, CriteriaItem.Criteria.PercentWildcard) of
    floBeginsWith:
      Result := cxSFilterString(@cxSFilterOperatorBeginsWith);
    floEndsWith:
      Result := cxSFilterString(@cxSFilterOperatorEndsWith);
    floContains:
      Result := cxSFilterString(@cxSFilterOperatorContains);
  else
    Result := cxSFilterString(@cxSFilterOperatorLike);
  end;
end;

function TcxFilterLikeOperator.FilterText: string;
begin
  Result := 'LIKE';
end;

procedure TcxFilterLikeOperator.PrepareDisplayValue(var DisplayValue: string);
begin
  if fcoShowOperatorDescription in CriteriaItem.Criteria.Options then
    LikeOperatorByPattern(DisplayValue, CriteriaItem.Criteria.PercentWildcard);
end;

{ TcxFilterNotLikeOperator }

function TcxFilterNotLikeOperator.CompareValues(const AValue1, AValue2: Variant): Boolean;
begin
  Result := not inherited CompareValues(AValue1, AValue2);
end;

function TcxFilterNotLikeOperator.DisplayText: string;
var
  S: string;
begin
  S := CriteriaItem.Value;
  case LikeOperatorByPattern(S, CriteriaItem.Criteria.PercentWildcard) of
    floBeginsWith:
      Result := cxSFilterString(@cxSFilterOperatorDoesNotBeginWith);
    floEndsWith:
      Result := cxSFilterString(@cxSFilterOperatorDoesNotEndWith);
    floContains:
      Result := cxSFilterString(@cxSFilterOperatorDoesNotContain);
  else
    Result := cxSFilterString(@cxSFilterOperatorNotLike);
  end;
end;

function TcxFilterNotLikeOperator.FilterText: string;
begin
  Result := 'NOT LIKE';
end;

{ TcxFilterBetweenOperator }

function TcxFilterBetweenOperator.CompareValues(const AValue1, AValue2: Variant): Boolean;
begin
  {$IFNDEF DELPHI6}
  Result := (AValue2[0] <= AValue1) and (AValue1 <= AValue2[1]);
  {$ELSE}
  Result := (VarCompare(AValue2[0], AValue1) <= 0) and (VarCompare(AValue1, AValue2[1]) <= 0);
  {$ENDIF}
end;

function TcxFilterBetweenOperator.DisplayText: string;
begin
  Result := cxSFilterString(@cxSFilterOperatorBetween);
end;

function TcxFilterBetweenOperator.FilterText: string;
begin
  Result := 'BETWEEN';
end;

function TcxFilterBetweenOperator.IsDescription: Boolean;
begin
  Result := True;
end;

procedure TcxFilterBetweenOperator.PrepareDisplayValue(var DisplayValue: string);
var
  S: string;
begin
  S := DisplayValue;
  DisplayValue := VarBetweenArrayToStr(StrToVarBetweenArray(S));
end;

function TcxFilterBetweenOperator.PrepareExpressionValue(const AValue: Variant;
  var DisplayValue: string): Boolean;
begin
  Result := VarIsArray(AValue);
  if Result then
    DisplayValue := GetExpressionValue(AValue[0]) + ' AND ' + GetExpressionValue(AValue[1]);
end;

{ TcxFilterNotBetweenOperator }

function TcxFilterNotBetweenOperator.CompareValues(const AValue1, AValue2: Variant): Boolean;
begin
  Result := not inherited CompareValues(AValue1, AValue2);
end;

function TcxFilterNotBetweenOperator.DisplayText: string;
begin
  Result := cxSFilterString(@cxSFilterOperatorNotBetween);
end;

function TcxFilterNotBetweenOperator.FilterText: string;
begin
  Result := 'NOT BETWEEN';
end;

{ TcxFilterInListOperator }

function TcxFilterInListOperator.CompareValues(const AValue1, AValue2: Variant): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := VarArrayLowBound(AValue2, 1) to VarArrayHighBound(AValue2, 1) do
    if AValue1 = AValue2[I] then
    begin
      Result := True;
      Break; 
    end;
end;

function TcxFilterInListOperator.DisplayText: string;
begin
  Result := cxSFilterString(@cxSFilterOperatorInList);
end;

function TcxFilterInListOperator.FilterText: string;
begin
  Result := 'IN';
end;

function TcxFilterInListOperator.IsDescription: Boolean;
begin
  Result := True;
end;

procedure TcxFilterInListOperator.PrepareDisplayValue(var DisplayValue: string);
var
  S: string;
begin
  S := DisplayValue;
  DisplayValue := VarListArrayToStr(StrToVarListArray(S));
end;

function TcxFilterInListOperator.PrepareExpressionValue(const AValue: Variant;
  var DisplayValue: string): Boolean;
var
  I: Integer;
begin
  Result := VarIsArray(AValue);
  if Result then
  begin
    DisplayValue := '(' + GetExpressionValue(AValue[0]);
    for I := VarArrayLowBound(AValue, 1) + 1 to VarArrayHighBound(AValue, 1) do
      DisplayValue := DisplayValue + ', ' + GetExpressionValue(AValue[I]);
    DisplayValue := DisplayValue + ')';    
  end;
end;

{ TcxFilterNotInListOperator }

function TcxFilterNotInListOperator.CompareValues(const AValue1, AValue2: Variant): Boolean;
begin
  Result := not inherited CompareValues(AValue1, AValue2);
end;

function TcxFilterNotInListOperator.DisplayText: string;
begin
  Result := cxSFilterString(@cxSFilterOperatorNotInList);
end;

function TcxFilterNotInListOperator.FilterText: string;
begin
  Result := 'NOT IN';
end;

{ TcxFilterNullOperator }

function TcxFilterNullOperator.CompareValues(const AValue1, AValue2: Variant): Boolean;
begin
  Result := CriteriaItem.ValueIsNull(AValue1);
end;

function TcxFilterNullOperator.DisplayText: string;
begin
  Result := cxSFilterString(@cxSFilterOperatorIsNull);
end;

procedure TcxFilterNullOperator.PrepareDisplayValue(var DisplayValue: string);
begin
  if fcoShowOperatorDescription in CriteriaItem.Criteria.Options then
    DisplayValue := '';
end;

{ TcxFilterNotNullOperator }

function TcxFilterNotNullOperator.CompareValues(const AValue1, AValue2: Variant): Boolean;
begin
  Result := not inherited CompareValues(AValue1, AValue2);
end;

function TcxFilterNotNullOperator.DisplayText: string;
begin
  Result := cxSFilterString(@cxSFilterOperatorIsNotNull);
end;

function TcxFilterNotNullOperator.FilterText: string;
begin
  Result := '<>';
end;

{ TcxFilterDateOperator }

function TcxFilterDateOperator.CompareValues(const AValue1, AValue2: Variant): Boolean;
begin
  if CriteriaItem.ValueIsNull(AValue1) then
    Result := False
  else
    Result := (Date1 <= AValue1) and (AValue1 < Date2);
end;

function TcxFilterDateOperator.FilterText: string;
begin
  Result := DisplayText;
end;

function TcxFilterDateOperator.IsExpression: Boolean;
begin
  Result := True;
end;

function TcxFilterDateOperator.GetExpressionFilterText(const AValue: Variant): string;
var
  AFieldName: string;
begin
  AFieldName := CriteriaItem.GetFieldName;
  Result := '(' + GetExpressionValue(Date1) + ' <= ' + AFieldName + ') AND (' +
    AFieldName + ' < ' + GetExpressionValue(Date2) + ')';
end;

procedure TcxFilterDateOperator.PrepareDisplayValue(var DisplayValue: string);
begin
  DisplayValue := '';
end;

{ Yesterday }

procedure TcxFilterYesterdayOperator.Prepare;
var
  ANowDate: TDateTime;
begin
  ANowDate := Date;
  Date1 := ANowDate - 1;
  Date2 := ANowDate;
end;

function TcxFilterYesterdayOperator.DisplayText: string;
begin
  Result := cxSFilterString(@cxSFilterOperatorYesterday);
end;

{ Today }

procedure TcxFilterTodayOperator.Prepare;
var
  ANowDate: TDateTime;
begin
  ANowDate := Date;
  Date1 := ANowDate;
  Date2 := ANowDate + 1;
end;

function TcxFilterTodayOperator.DisplayText: string;
begin
  Result := cxSFilterString(@cxSFilterOperatorToday);
end;

{ Tomorrow }

procedure TcxFilterTomorrowOperator.Prepare;
var
  ANowDate: TDateTime;
begin
  ANowDate := Date;
  Date1 := ANowDate + 1;
  Date2 := ANowDate + 2;
end;

function TcxFilterTomorrowOperator.DisplayText: string;
begin
  Result := cxSFilterString(@cxSFilterOperatorTomorrow);
end;

{ LastWeek }

procedure TcxFilterLastWeekOperator.Prepare;
var
  ANowDate: TDateTime;
begin
  ANowDate := Date;
  Date1 := GetStartDateOfWeek(ANowDate) - 7;
  Date2 := Date1 + 7;
end;

function TcxFilterLastWeekOperator.DisplayText: string;
begin
  Result := cxSFilterString(@cxSFilterOperatorLastWeek);
end;

{ LastMonth }

procedure TcxFilterLastMonthOperator.Prepare;
var
  ANowDate: TDateTime;
  D, M, Y: Word;
begin
  ANowDate := Date;
  DecodeDate(ANowDate, Y, M, D);
  if M > 1 then
  begin
    Date1 := EncodeDate(Y, M - 1, 1);
    Date2 := EncodeDate(Y, M, 1);
  end
  else
  begin
    Date1 := EncodeDate(Y - 1, 12, 1);
    Date2 := EncodeDate(Y, 1, 1);
  end;
end;

function TcxFilterLastMonthOperator.DisplayText: string;
begin
  Result := cxSFilterString(@cxSFilterOperatorLastMonth);
end;

{ LastYear }

procedure TcxFilterLastYearOperator.Prepare;
var
  ANowDate: TDateTime;
  D, M, Y: Word;
begin
  ANowDate := Date;
  DecodeDate(ANowDate, Y, M, D);
  Date1 := EncodeDate(Y - 1, 1, 1);
  Date2 := EncodeDate(Y, 1, 1);
end;

function TcxFilterLastYearOperator.DisplayText: string;
begin
  Result := cxSFilterString(@cxSFilterOperatorLastYear);
end;

{ ThisWeek }

procedure TcxFilterThisWeekOperator.Prepare;
var
  ANowDate: TDateTime;
begin
  ANowDate := Date;
  Date1 := GetStartDateOfWeek(ANowDate);
  Date2 := Date1 + 7;
end;

function TcxFilterThisWeekOperator.DisplayText: string;
begin
  Result := cxSFilterString(@cxSFilterOperatorThisWeek);
end;

{ ThisMonth }

procedure TcxFilterThisMonthOperator.Prepare;
var
  ANowDate: TDateTime;
  D, M, Y: Word;
begin
  ANowDate := Date;
  DecodeDate(ANowDate, Y, M, D);
  if M < 12 then
  begin
    Date1 := EncodeDate(Y, M, 1);
    Date2 := EncodeDate(Y, M + 1, 1);
  end
  else
  begin
    Date1 := EncodeDate(Y, M, 1);
    Date2 := EncodeDate(Y + 1, 1, 1);
  end;
end;

function TcxFilterThisMonthOperator.DisplayText: string;
begin
  Result := cxSFilterString(@cxSFilterOperatorThisMonth);
end;

{ ThisYear }

procedure TcxFilterThisYearOperator.Prepare;
var
  ANowDate: TDateTime;
  D, M, Y: Word;
begin
  ANowDate := Date;
  DecodeDate(ANowDate, Y, M, D);
  Date1 := EncodeDate(Y, 1, 1);
  Date2 := EncodeDate(Y + 1, 1, 1);
end;

function TcxFilterThisYearOperator.DisplayText: string;
begin
  Result := cxSFilterString(@cxSFilterOperatorThisYear);
end;

{ NextWeek }

procedure TcxFilterNextWeekOperator.Prepare;
var
  ANowDate: TDateTime;
begin
  ANowDate := Date;
  Date1 := GetStartDateOfWeek(ANowDate) + 7;
  Date2 := Date1 + 7;
end;

function TcxFilterNextWeekOperator.DisplayText: string;
begin
  Result := cxSFilterString(@cxSFilterOperatorNextWeek);
end;

{ NextMonth }

procedure TcxFilterNextMonthOperator.Prepare;
var
  ANowDate: TDateTime;
  D, M, Y: Word;
begin
  ANowDate := Date;
  DecodeDate(ANowDate, Y, M, D);
  if M < 11 then
  begin
    Date1 := EncodeDate(Y, M + 1, 1);
    Date2 := EncodeDate(Y, M + 2, 1);
  end
  else
    if M = 11 then
    begin
      Date1 := EncodeDate(Y, 12, 1);
      Date2 := EncodeDate(Y + 1, 1, 1);
    end
    else
      if M = 12 then
      begin
        Date1 := EncodeDate(Y + 1, 1, 1);
        Date2 := EncodeDate(Y + 1, 2, 1);
      end;
end;

function TcxFilterNextMonthOperator.DisplayText: string;
begin
  Result := cxSFilterString(@cxSFilterOperatorNextMonth);
end;

{ NextYear }

procedure TcxFilterNextYearOperator.Prepare;
var
  ANowDate: TDateTime;
  D, M, Y: Word;
begin
  ANowDate := Date;
  DecodeDate(ANowDate, Y, M, D);
  Date1 := EncodeDate(Y + 1, 1, 1);
  Date2 := EncodeDate(Y + 2, 1, 1);
end;

function TcxFilterNextYearOperator.DisplayText: string;
begin
  Result := cxSFilterString(@cxSFilterOperatorNextYear);
end;

{ TcxCustomFilterCriteriaItem }

constructor TcxCustomFilterCriteriaItem.Create(AOwner: TcxFilterCriteriaItemList);
begin
  inherited Create;
  FParent := AOwner;
end;

destructor TcxCustomFilterCriteriaItem.Destroy;
begin
  if FParent <> nil then
    FParent.RemoveItem(Self);
  inherited Destroy;
end;

procedure TcxCustomFilterCriteriaItem.Changed;
begin
  Criteria.Changed;
end;

function TcxCustomFilterCriteriaItem.GetCriteria: TcxFilterCriteria;
begin
  Result := Parent.Criteria;
end;

procedure TcxCustomFilterCriteriaItem.ReadData(AStream: TStream);
begin
end;

procedure TcxCustomFilterCriteriaItem.WriteData(AStream: TStream);
begin
  WriteBooleanProc(AStream, IsItemList);
end;

{ TcxFilterCriteriaItemList }

constructor TcxFilterCriteriaItemList.Create(AOwner: TcxFilterCriteriaItemList;
  ABoolOperatorKind: TcxFilterBoolOperatorKind);
begin
  inherited Create(AOwner);
  FBoolOperatorKind := ABoolOperatorKind;
  FItems := TList.Create;
end;

destructor TcxFilterCriteriaItemList.Destroy;
begin
  Clear;
  FItems.Free;
  inherited Destroy;
end;

function TcxFilterCriteriaItemList.AddItem(AItemLink: TObject; AOperatorKind: TcxFilterOperatorKind;
  const AValue: Variant; const ADisplayValue: string): TcxFilterCriteriaItem;
begin
  Result := Criteria.AddItem(Self, AItemLink, AOperatorKind, AValue, ADisplayValue);
end;

function TcxFilterCriteriaItemList.AddItemList(ABoolOperatorKind: TcxFilterBoolOperatorKind): TcxFilterCriteriaItemList;
begin
  Result := TcxFilterCriteriaItemList.Create(Self, ABoolOperatorKind);
  FItems.Add(Result);
  Changed;
end;

procedure TcxFilterCriteriaItemList.Clear;
var
  I: Integer;
begin
  Criteria.BeginUpdate;
  try
    for I := Count - 1 downto 0 do
      Items[I].Free;
  finally
    Criteria.EndUpdate;
  end;
end;

function TcxFilterCriteriaItemList.GetCriteria: TcxFilterCriteria;
begin
  if FCriteria <> nil then
    Result := FCriteria
  else
    Result := inherited GetCriteria;
end;

function TcxFilterCriteriaItemList.GetIsItemList: Boolean;
begin
  Result := True;
end;

procedure TcxFilterCriteriaItemList.RemoveItem(AItem: TcxCustomFilterCriteriaItem);
begin
  if FItems.Remove(AItem) <> -1 then
    Changed;
end;

procedure TcxFilterCriteriaItemList.WriteData(AStream: TStream);
var
  I: Integer;
begin
  inherited WriteData(AStream);
  WriteByteProc(AStream, Byte(BoolOperatorKind));
  WriteIntegerProc(AStream, Count);
  for I := 0 to Count - 1 do
    Items[I].WriteData(AStream);
end;

function TcxFilterCriteriaItemList.GetCount: Integer;
begin
  Result := FItems.Count;
end;

function TcxFilterCriteriaItemList.GetItem(Index: Integer): TcxCustomFilterCriteriaItem;
begin
  if (0 <= Index) and (Index < Count) then
    Result := TcxCustomFilterCriteriaItem(FItems[Index])
  else
    Result := nil;
end;

{ TcxFilterCriteriaItem }

constructor TcxFilterCriteriaItem.Create(AOwner: TcxFilterCriteriaItemList;
  AItemLink: TObject; AOperatorKind: TcxFilterOperatorKind; const AValue: Variant;
  const ADisplayValue: string);

  procedure CheckDisplayText;
  begin
    if ((FOperator is TcxFilterNullOperator) or (FOperator is TcxFilterNotNullOperator)) and
      (FDisplayValue = '') then
      FDisplayValue := cxSFilterString(@cxSFilterBlankCaption);  
  end;

begin
  inherited Create(AOwner);
  FItemLink := AItemLink;
  FDisplayValue := ADisplayValue;
  FOperatorKind := AOperatorKind;
  FValue := AValue;
  RecreateOperator;
  CheckDisplayText;
end;

destructor TcxFilterCriteriaItem.Destroy;
begin
  FOperator.Free;
  FOperator := nil;
  inherited Destroy;
end;

function TcxFilterCriteriaItem.ValueIsNull(const AValue: Variant): Boolean;
begin
  Result := Criteria.ValueIsNull(AValue);
end;

function TcxFilterCriteriaItem.GetDisplayValue: string;
begin
  Result := DisplayValue;
  Operator.PrepareDisplayValue(Result);
end;

function TcxFilterCriteriaItem.GetExpressionValue(AIsCaption: Boolean): string;
begin
  if AIsCaption then
    Result := GetDisplayValue
  else
    Result := Operator.GetExpressionValue(Value);
end;

function TcxFilterCriteriaItem.GetFilterOperatorClass: TcxFilterOperatorClass;
const
  AOperatorClasses: array[TcxFilterOperatorKind] of TcxFilterOperatorClass = (
    TcxFilterEqualOperator, TcxFilterNotEqualOperator,
    TcxFilterLessOperator, TcxFilterLessEqualOperator,
    TcxFilterGreaterOperator, TcxFilterGreaterEqualOperator,
    TcxFilterLikeOperator, TcxFilterNotLikeOperator,
    TcxFilterBetweenOperator, TcxFilterNotBetweenOperator,
    TcxFilterInListOperator, TcxFilterNotInListOperator,
    TcxFilterYesterdayOperator, TcxFilterTodayOperator, TcxFilterTomorrowOperator,
    TcxFilterLastWeekOperator, TcxFilterLastMonthOperator, TcxFilterLastYearOperator,
    TcxFilterThisWeekOperator, TcxFilterThisMonthOperator, TcxFilterThisYearOperator,
    TcxFilterNextWeekOperator, TcxFilterNextMonthOperator, TcxFilterNextYearOperator);
  ANullOperatorClasses: array[Boolean] of TcxFilterOperatorClass = (
    TcxFilterNullOperator, TcxFilterNotNullOperator);
begin
  if (OperatorKind in [foEqual, foNotEqual, foLike, foNotLike]) and (ValueIsNull(Value)) then
    Result := ANullOperatorClasses[OperatorKind in [foNotEqual, foNotLike]]
  else
    Result := AOperatorClasses[OperatorKind];
end;

function TcxFilterCriteriaItem.GetItemLink: TObject;
begin
  Result := FItemLink;
end;

function TcxFilterCriteriaItem.GetIsItemList: Boolean;
begin
  Result := False;
end;

procedure TcxFilterCriteriaItem.RecreateOperator;
begin
  if FOperator <> nil then
    FOperator.Free;
  FOperator := GetFilterOperatorClass.Create(Self);
  Changed;
end;

procedure TcxFilterCriteriaItem.WriteData(AStream: TStream);
begin
  inherited WriteData(AStream);
  WriteByteProc(AStream, Byte(OperatorKind));
  WriteStringProc(AStream, DisplayValue);
  WriteIntegerProc(AStream, Criteria.GetIDByItemLink(ItemLink));
  WriteVariantProc(AStream, Value);
end;

procedure TcxFilterCriteriaItem.SetOperatorKind(Value: TcxFilterOperatorKind);
begin
  if FOperatorKind <> Value then
  begin
    FOperatorKind := Value;
    RecreateOperator;
  end;
end;

procedure TcxFilterCriteriaItem.SetDisplayValue(const Value: string);
begin
  if FDisplayValue <> Value then
  begin
    FDisplayValue := Value;
    Changed;
  end;
end;

procedure TcxFilterCriteriaItem.SetValue(const Value: Variant);
begin
  if FValue <> Value then
  begin
    FValue := Value;
    RecreateOperator;
  end;
end;


{ TcxFilterValueList }

constructor TcxFilterValueList.Create(ACriteria: TcxFilterCriteria);
begin
  inherited Create;
  FCriteria := ACriteria;
  FItems := TList.Create;
end;

destructor TcxFilterValueList.Destroy;
begin
  Clear;
  FItems.Free;
  inherited Destroy;
end;

procedure TcxFilterValueList.Add(AKind: TcxFilterValueItemKind; const AValue: Variant;
  const ADisplayText: string; ANoSorting: Boolean);
var
  AIndex: Integer;
  PItem: PcxFilterValueItem;
begin
  AIndex := -1;
  if AKind <> fviValue then
    AIndex := GetStartValueIndex
  else
    if ANoSorting then
      AIndex := Count
    else
      if ((MaxCount = 0) or (Count < MaxCount)) then
        if Find(AValue, ADisplayText, AIndex) then
          AIndex := -1;
  if AIndex <> -1 then
  begin
    New(PItem);
    PItem^.Kind := AKind;
    PItem^.Value := AValue;
    PItem^.DisplayText := ADisplayText;
    FItems.Insert(AIndex, PItem);
  end;
end;

procedure TcxFilterValueList.Clear;
var
  I: Integer;
begin
  for I := 0 to FItems.Count - 1 do
    Dispose(PcxFilterValueItem(FItems[I]));
  FItems.Clear;
end;

procedure TcxFilterValueList.Delete(AIndex: Integer);
begin
  Dispose(PcxFilterValueItem(FItems[AIndex]));
  FItems.Delete(AIndex);
end;

function TcxFilterValueList.Find(const AValue: Variant; const ADisplayText: string;
  var AIndex: Integer): Boolean;
var
  L, H, I, C: Integer;
begin
  Result := False;
  L := GetStartValueIndex;
  H := Count - 1;
  while L <= H do
  begin
    I := (L + H) shr 1;
    C := CompareItem(I, AValue, ADisplayText);
    if C < 0 then
      L := I + 1
    else
    begin
      if C = 0 then
      begin
        Result := True;
        L := I;
      end;
      H := I - 1;
    end;
  end;
  AIndex := L;
end;

function TcxFilterValueList.FindItemByKind(AKind: TcxFilterValueItemKind): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to Count - 1 do
  begin
    if Items[I]^.Kind = AKind then
    begin
      Result := I;
      Break;
    end;
  end;
end;

function TcxFilterValueList.FindItemByValue(const AValue: Variant): Integer;
begin
  if not Find(AValue, AValue, Result) then
    Result := -1;
end;

function TcxFilterValueList.GetIndexByCriteriaItem(ACriteriaItem: TcxFilterCriteriaItem): Integer;
begin
  Result := -1;
  if ACriteriaItem = nil then Exit;
  if ACriteriaItem.ValueIsNull(ACriteriaItem.Value) and
    (ACriteriaItem.OperatorKind in [foEqual, foNotEqual]) then
  begin
    if ACriteriaItem.OperatorKind = foEqual then
      Result := FindItemByKind(fviBlanks)
    else
      Result := FindItemByKind(fviNonBlanks);
  end
  else
  begin
    if not ((ACriteriaItem.Parent = Criteria.Root) and
      (ACriteriaItem.OperatorKind = foEqual)) then
      Result := FindItemByKind(fviCustom)
    else
      if not Find(ACriteriaItem.Value, ACriteriaItem.DisplayValue, Result) then
        Result := FindItemByKind(fviAll);
  end;
end;

function TcxFilterValueList.CompareItem(AIndex: Integer; const AValue: Variant;
  const ADisplayText: string): Integer;
var
  V1, V2: Variant;
  S1, S2: string;
begin
  if SortByDisplayText then
  begin
    S1 := Items[AIndex]^.DisplayText;
    S2 := ADisplayText;
    if fcoCaseInsensitive in Criteria.Options then
    begin
      S1 := AnsiUpperCase(S1);
      S2 := AnsiUpperCase(S2);
    end;
    Result := AnsiCompareStr(S1, S2); // TODO: !!
  end
  else
  begin
    V1 := Criteria.PrepareValue(Items[AIndex]^.Value);
    V2 := Criteria.PrepareValue(AValue);
    Result := VarCompare(V1, V2);
  end;
end;

function TcxFilterValueList.GetStartValueIndex: Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to FItems.Count - 1 do
    if Items[I]^.Kind <> fviValue then
      Inc(Result)
    else
      Break;
end;

function TcxFilterValueList.GetCount: Integer;
begin
  Result := FItems.Count;
end;

function TcxFilterValueList.GetItem(Index: Integer): PcxFilterValueItem;
begin
  Result := FItems[Index];
end;

function TcxFilterValueList.GetMaxCount: Integer;
begin
  Result := Criteria.MaxValueListCount;
end;

{ TcxFilterCriteria }

constructor TcxFilterCriteria.Create;
begin
  inherited Create;
  FRoot := TcxFilterCriteriaItemList.Create(nil, fboAnd);
  FRoot.FCriteria := Self;
  FPercentWildcard := '%';
  FUnderscoreWildcard := '_';
end;

destructor TcxFilterCriteria.Destroy;
begin
  FRoot.Free;
  FRoot := nil;
  inherited Destroy;
end;

procedure TcxFilterCriteria.Assign(Source: TPersistent);
begin
  if Source is TcxFilterCriteria then
  begin
    BeginUpdate;
    try
      DateTimeFormat := TcxFilterCriteria(Source).DateTimeFormat;
      MaxValueListCount := TcxFilterCriteria(Source).MaxValueListCount;
      Options := TcxFilterCriteria(Source).Options;
      PercentWildcard := TcxFilterCriteria(Source).PercentWildcard;
      UnderscoreWildcard := TcxFilterCriteria(Source).UnderscoreWildcard;
      AssignItems(TcxFilterCriteria(Source));
      AssignEvents(Source); // TODO: option?
    finally
      EndUpdate;
    end;
  end
  else
    inherited Assign(Source);
end;

procedure TcxFilterCriteria.AssignEvents(Source: TPersistent);
begin
  if Source is TcxFilterCriteria then
    OnChanged := TcxFilterCriteria(Source).OnChanged;
end;

procedure TcxFilterCriteria.AssignItems(ASource: TcxFilterCriteria);
var
  AStream: TMemoryStream;
begin
  BeginUpdate;
  try
    Clear;
    AStream := TMemoryStream.Create;
    try
      ASource.WriteData(AStream);
      AStream.Position := 0;
      ReadData(AStream);
    finally
      AStream.Free;
    end;
  finally
    EndUpdate;
  end;
end;

function TcxFilterCriteria.AddItem(AParent: TcxFilterCriteriaItemList; AItemLink: TObject;
  AOperatorKind: TcxFilterOperatorKind; const AValue: Variant;
  const ADisplayValue: string): TcxFilterCriteriaItem;
begin
  BeginUpdate;
  try
    if AParent = nil then
      AParent := Root;
    Result := GetItemClass.Create(AParent, AItemLink, AOperatorKind, AValue, ADisplayValue);
    AParent.FItems.Add(Result);
  finally
    EndUpdate;
  end;
end;

procedure TcxFilterCriteria.BeginUpdate;
begin
  Inc(FLockCount);
end;

procedure TcxFilterCriteria.CancelUpdate;
begin
  Dec(FLockCount);
end;

procedure TcxFilterCriteria.Clear;
begin
  BeginUpdate;
  try
    Root.Clear;
    Root.BoolOperatorKind := fboAnd;
  finally
    EndUpdate;
  end;
end;

procedure TcxFilterCriteria.EndUpdate;
begin
  Dec(FLockCount);
  Changed;
end;

function TcxFilterCriteria.FindItemByItemLink(AItemLink: TObject): TcxFilterCriteriaItem;

  procedure FindInBranch(ABranch: TcxFilterCriteriaItemList);
  var
    I: Integer;
  begin
    for I := 0 to ABranch.Count - 1 do
    begin
      if Result <> nil then
        Break;
      if TcxCustomFilterCriteriaItem(ABranch.Items[I]).IsItemList then
        FindInBranch(TcxFilterCriteriaItemList(ABranch.Items[I]))
      else
        if TcxFilterCriteriaItem(ABranch.Items[I]).FItemLink = AItemLink then // TODO: !!!ItemLink
        begin
          Result := TcxFilterCriteriaItem(ABranch.Items[I]);
          Break;
        end;
    end;
  end;

begin
  Result := nil;
  FindInBranch(Root);
end;

function TcxFilterCriteria.IsEmpty: Boolean;
begin
  Result := Root.Count = 0;
end;

procedure TcxFilterCriteria.Refresh;

  procedure RecreateOperators(ABranch: TcxFilterCriteriaItemList);
  var
    I: Integer;
  begin
    for I := 0 to ABranch.Count - 1 do
      if ABranch[I].IsItemList then
        RecreateOperators(TcxFilterCriteriaItemList(ABranch[I]))
      else
        TcxFilterCriteriaItem(ABranch[I]).RecreateOperator;
  end;

begin
  BeginUpdate;
  try
    RecreateOperators(Root);
  finally
    EndUpdate;
  end;
end;

procedure TcxFilterCriteria.RemoveItemByItemLink(AItemLink: TObject);

  procedure CheckEmptyList(AParent: TcxFilterCriteriaItemList);
  var
    ANewParent: TcxFilterCriteriaItemList;
    AItem: TcxCustomFilterCriteriaItem;
  begin
    if AParent = FRoot then Exit;
    if AParent.Count = 0 then
      AParent.Free
    else
      if AParent.Count = 1 then
      begin
        ANewParent := AParent.Parent;
        AItem := AParent.Items[0];
        ANewParent.FItems.Remove(AParent);
        ANewParent.FItems.Add(AItem);
        AItem.FParent := ANewParent;
        AParent.FItems.Clear;
        AParent.Free;
      end;
  end;

var
  AItem: TcxFilterCriteriaItem;
  AParent: TcxFilterCriteriaItemList;
  AChanged: Boolean;
begin
  BeginUpdate;
  AChanged := False;
  try
    AItem := FindItemByItemLink(AItemLink);
    while AItem <> nil do
    begin
      AChanged := True;
      AParent := AItem.Parent;
      AItem.Free;
      CheckEmptyList(AParent);
      AItem := FindItemByItemLink(AItemLink);
    end;
  finally
    if AChanged then
      EndUpdate
    else
      CancelUpdate;
  end;
end;

procedure TcxFilterCriteria.RestoreDefaults;
begin
  BeginUpdate;
  try
    FOptions := [];
    FPercentWildcard := '%';
    FUnderscoreWildcard := '_';
  finally
    EndUpdate;
  end;
end;

function TcxFilterCriteria.ValueIsNull(const AValue: Variant): Boolean;
begin
  if fcoSoftNull in Options then
    Result := VarIsSoftNull(AValue)
  else
    Result := VarIsNull(AValue);
end;

procedure TcxFilterCriteria.Changed;
begin
  if LockCount = 0 then
    Update;
end;

function TcxFilterCriteria.ConvertDateToStr(const AValue: Variant): string;
begin
  if DateTimeFormat <> '' then
    Result := FormatDateTime(DateTimeFormat, AValue)
  else
    Result := VarToStr(AValue)
end;

function TcxFilterCriteria.DoFilterData(AData: Pointer): Boolean;

  function Compare(AItem: TcxFilterCriteriaItem): Boolean;
  var
    V1, V2: Variant;
  begin
    try
      V1 := PrepareValue(AItem.GetDataValue(AData));
      V2 := PrepareValue(AItem.Value);
      Result := AItem.Operator.CompareValues(V1, V2);
    except
      on EVariantError do
        if fcoSoftCompare in Options then
          Result := False
        else
          raise;
    end;
  end;

  procedure CorrectResult(AItemResult: Boolean; ABoolOperatorKind: TcxFilterBoolOperatorKind;
    var ACompared, AResult: Boolean);
  begin
    if not ACompared then
    begin
      AResult := AItemResult;
      case ABoolOperatorKind of
        fboAnd, fboOr:
          AResult := AItemResult;
        fboNotAnd, fboNotOr:
          AResult := not AResult;
      end;
      ACompared := True;
    end
    else
    begin
      case ABoolOperatorKind of
        fboAnd:
          AResult := AResult and AItemResult;
        fboOr:
          AResult := AResult or AItemResult;
        fboNotAnd:
          AResult := AResult or not AItemResult;
        fboNotOr:
          AResult := AResult and not AItemResult;
      end;
    end;
  end;

  function DoFilterBranch(ABranch: TcxFilterCriteriaItemList): Boolean;
  var
    I: Integer;
    AItem: TcxFilterCriteriaItem;
    AResult, ACompared: Boolean;
  begin
    Result := True;
    ACompared := False;
    for I := 0 to ABranch.Count - 1 do
      if ABranch[I].IsItemList then
      begin
        AResult := DoFilterBranch(TcxFilterCriteriaItemList(ABranch[I]));
        CorrectResult(AResult, ABranch.BoolOperatorKind, ACompared, Result);
      end
      else
      begin
        AItem := TcxFilterCriteriaItem(ABranch[I]);
        AResult := Compare(AItem);
        CorrectResult(AResult, ABranch.BoolOperatorKind, ACompared, Result);
      end;
  end;

begin
  Result := DoFilterBranch(Root);
end;

function TcxFilterCriteria.GetFilterCaption: string;
begin
  Result := GetFilterExpression(True);
end;

function TcxFilterCriteria.GetFilterExpression(AIsCaption: Boolean): string;

  function GetOperatorText(AIsCaption: Boolean;
    ABoolOperatorKind: TcxFilterBoolOperatorKind): string;
  begin
    case ABoolOperatorKind of
      fboAnd, fboNotAnd:
        begin
          if AIsCaption then
            Result := cxSFilterString(@cxSFilterAndCaption)
          else
            Result := 'AND';
        end;
      fboOr, fboNotOr:
        begin
          if AIsCaption then
            Result := cxSFilterString(@cxSFilterOrCaption)
          else
            Result := 'OR';
        end;
    end;
  end;

  function GetNotText(AIsCaption: Boolean): string;
  begin
    if AIsCaption then
      Result := cxSFilterString(@cxSFilterNotCaption)
    else
      Result := 'NOT';
  end;

  function FilterSubString(ABranch: TcxFilterCriteriaItemList): string;
  var
    I: Integer;
  begin
    Result := '';
    for I := 0 to ABranch.Count - 1 do
    begin
      if ABranch[I].IsItemList then
        Result := Result + '(' + FilterSubString(TcxFilterCriteriaItemList(ABranch[I])) + ')'
      else
        Result := Result + '(' + GetItemExpression(TcxFilterCriteriaItem(ABranch[I]), AIsCaption) + ')';
      if I < ABranch.Count - 1 then
        Result := Result + ' ' + GetOperatorText(AIsCaption, ABranch.BoolOperatorKind) + ' ';
    end;
    if ABranch.BoolOperatorKind in [fboNotAnd, fboNotOr] then
      Result := GetNotText(AIsCaption) + ' (' + Result + ')';
  end;

begin
  Result := FilterSubString(Root);
end;

function TcxFilterCriteria.GetFilterText: string;
begin
  Result := GetFilterExpression(False);
end;

function TcxFilterCriteria.GetItemClass: TcxFilterCriteriaItemClass;
begin
  Result := TcxFilterCriteriaItem;
end;

function TcxFilterCriteria.GetItemExpression(AItem: TcxFilterCriteriaItem;
  AIsCaption: Boolean): string;
var
  S: string;  
begin
  if not AIsCaption and AItem.Operator.IsExpression then
    Result := AItem.Operator.GetExpressionFilterText(AItem.Value)
  else
  begin
    S := GetItemExpressionValue(AItem, AIsCaption);
    Result := GetItemExpressionFieldName(AItem, AIsCaption) + ' ' +
      GetItemExpressionOperator(AItem, AIsCaption);
    if S <> '' then
      Result := Result + ' ' + S;
  end;
end;

function TcxFilterCriteria.GetItemExpressionFieldName(AItem: TcxFilterCriteriaItem;
  AIsCaption: Boolean): string;
begin
  if AIsCaption then
    Result := AItem.GetFieldCaption
  else
    Result := AItem.GetFieldName;
end;

function TcxFilterCriteria.GetItemExpressionOperator(AItem: TcxFilterCriteriaItem;
  AIsCaption: Boolean): string;
begin
  if AIsCaption and (AItem.Operator.IsDescription or (fcoShowOperatorDescription in Options)) then
    Result := AItem.Operator.DisplayText
  else
    Result := AItem.Operator.FilterText;
end;

function TcxFilterCriteria.GetItemExpressionValue(AItem: TcxFilterCriteriaItem;
  AIsCaption: Boolean): string;
begin
  Result := AItem.GetExpressionValue(AIsCaption);
end;

procedure TcxFilterCriteria.Prepare;

  procedure PrepareOperators(ABranch: TcxFilterCriteriaItemList);
  var
    I: Integer;
  begin
    for I := 0 to ABranch.Count - 1 do
      if ABranch[I].IsItemList then
        PrepareOperators(TcxFilterCriteriaItemList(ABranch[I]))
      else
        TcxFilterCriteriaItem(ABranch[I]).Operator.Prepare;
  end;

begin
  PrepareOperators(Root);
end;

function TcxFilterCriteria.PrepareValue(const AValue: Variant): Variant;
begin
  if VarType(AValue) = varCurrency then
    Result := VarAsType(AValue, varDouble) // bug in Delphi
  else
    if ((VarType(AValue) = varString) or (VarType(AValue) = varOleStr)) and (fcoCaseInsensitive in Options) then
      Result := AnsiUpperCase(AValue)
    else
      Result := AValue;
end;

function TcxFilterCriteria.GetValueListClass: TcxFilterValueListClass;
begin
  Result := TcxFilterValueList;
end;

procedure TcxFilterCriteria.ReadData(AStream: TStream);
var
  I, AItemCount: Integer;
begin
  BeginUpdate;
  try
    Clear;
    AItemCount := ReadIntegerFunc(AStream);
    if AItemCount = -1 then // new format
    begin
      Root.BoolOperatorKind := TcxFilterBoolOperatorKind(ReadByteFunc(AStream));
      AItemCount := ReadIntegerFunc(AStream);
    end;
    for I := 0 to AItemCount - 1 do
      ReadItem(AStream, Root);
  finally
    EndUpdate;
  end;
end;

procedure TcxFilterCriteria.SetFilterText(const Value: string);
begin
end;

procedure TcxFilterCriteria.Update;
begin
  Prepare;
  if Assigned(FOnChanged) then
    FOnChanged(Self);
end;

procedure TcxFilterCriteria.WriteData(AStream: TStream);
var
  I: Integer;
begin
  WriteIntegerProc(AStream, -1); // new format
  WriteByteProc(AStream, Byte(Root.BoolOperatorKind));
  WriteIntegerProc(AStream, Root.Count);
  for I := 0 to Root.Count - 1 do
    Root.Items[I].WriteData(AStream);
end;

function TcxFilterCriteria.GetOptions: TcxFilterCriteriaOptions;
begin
  Result := FOptions;
end;

procedure TcxFilterCriteria.ReadItem(AStream: TStream; AItemList: TcxFilterCriteriaItemList);
var
  I, AItemCount, AID: Integer;
  AItemLink: TObject;
  AItem: TcxCustomFilterCriteriaItem;
  AIsItemList: Boolean;
  ABoolOperatorKind: TcxFilterBoolOperatorKind;
  ACompareOperator: TcxFilterOperatorKind;
  ADisplayValue: string;
  AValue: Variant;
begin
  AIsItemList := ReadBooleanFunc(AStream);
  if AIsItemList then
  begin
    ABoolOperatorKind := TcxFilterBoolOperatorKind(ReadByteFunc(AStream));
    AItem := AItemList.AddItemList(ABoolOperatorKind);
    AItemCount := ReadIntegerFunc(AStream);
    for I := 0 to AItemCount - 1 do
      ReadItem(AStream, TcxFilterCriteriaItemList(AItem));
  end
  else
  begin
    ACompareOperator := TcxFilterOperatorKind(ReadByteFunc(AStream));
    ADisplayValue := ReadStringFunc(AStream);
    AID := ReadIntegerFunc(AStream);
    AItemLink := GetItemLinkByID(AID);
    AValue := ReadVariantFunc(AStream);
    AItem := AItemList.AddItem(AItemLink, ACompareOperator, AValue, ADisplayValue);
  end;
  AItem.ReadData(AStream);
end;

procedure TcxFilterCriteria.SetDateTimeFormat(const Value: string);
begin
  if FDateTimeFormat <> Value then
  begin
    FDateTimeFormat := Value;
    Changed;
  end;
end;

procedure TcxFilterCriteria.SetOptions(Value: TcxFilterCriteriaOptions);
begin
  if FOptions <> Value then
  begin
    FOptions := Value;
    Changed;
  end;
end;

procedure TcxFilterCriteria.SetPercentWildcard(Value: Char);
begin
  if FPercentWildcard <> Value then
  begin
    FPercentWildcard := Value;
    Changed;
  end;
end;

procedure TcxFilterCriteria.SetUnderscoreWildcard(Value: Char);
begin
  if FUnderscoreWildcard <> Value then
  begin
    FUnderscoreWildcard := Value;
    Changed;
  end;
end;

end.
