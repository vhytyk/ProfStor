
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

unit cxFilterControlUtils;

{$I cxFilterControlVer.inc}

interface

uses
{$IFNDEF VCL}
  QTypes,
{$ENDIF}
  Classes, Controls, SysUtils, cxBlobEdit, cxButtonEdit, cxCalc, cxCalendar,
  cxCheckBox, cxClasses, cxCurrencyEdit, cxDBLookupComboBox, cxDropDownEdit,
  cxEdit, cxFilter, cxHyperLinkEdit, cxImageComboBox, cxMaskEdit, cxMemo,
  cxMRUEdit, cxSpinEdit, cxTextEdit, cxTimeEdit, cxRadioGroup, cxDataStorage;

type
  TcxFilterControlOperator = (fcoNone, fcoEqual, fcoNotEqual, fcoLess,
    fcoLessEqual, fcoGreater, fcoGreaterEqual, fcoLike, fcoNotLike,
    fcoBlanks, fcoNonBlanks, fcoBetween, fcoNotBetween, fcoInList,
    fcoNotInList, fcoYesterday, fcoToday, fcoTomorrow, fcoLastWeek,
    fcoLastMonth, fcoLastYear, fcoThisWeek, fcoThisMonth, fcoThisYear,
    fcoNextWeek, fcoNextMonth, fcoNextYear);

  TcxFilterControlOperators = set of TcxFilterControlOperator;

  { TcxCustomFilterEditHelper }

  TcxCustomFilterEditHelper = class
  protected
    class procedure ClearPropertiesEvents(AProperties: TcxCustomEditProperties); virtual;
    class procedure InitializeEdit(AEdit: TcxCustomEdit;
      AEditProperties: TcxCustomEditProperties); virtual;
  public
    class function EditPropertiesHasButtons(AEditProperties: TcxCustomEditProperties): Boolean; virtual;
    class function GetFilterEdit(AEditProperties: TcxCustomEditProperties;
      AInplaceEditList: TcxInplaceEditList = nil): TcxCustomEdit;
    class function GetFilterEditClass: TcxCustomEditClass; virtual;
    class procedure GetFilterValue(AEdit: TcxCustomEdit;
      AEditProperties: TcxCustomEditProperties; var V: Variant; var S: TCaption);
      virtual;
    class function GetSupportedFilterOperators(
      AEditProperties: TcxCustomEditProperties;
      AExtendedSet: Boolean = False): TcxFilterControlOperators; virtual;
    class procedure InitializeProperties(AProperties,
      AEditProperties: TcxCustomEditProperties; AHasButtons: Boolean); virtual;
    class procedure SetFilterValue(AEdit: TcxCustomEdit;
      AEditProperties: TcxCustomEditProperties; AValue: Variant); virtual;
    class function UseDisplayValue: Boolean; virtual;
  end;

  TcxCustomFilterEditHelperClass = class of TcxCustomFilterEditHelper;

  { TcxFilterTextEditHelper }

  TcxFilterTextEditHelper = class(TcxCustomFilterEditHelper)
  public
    class function GetFilterEditClass: TcxCustomEditClass; override;
    class procedure GetFilterValue(AEdit: TcxCustomEdit;
      AEditProperties: TcxCustomEditProperties; var V: Variant; var S: TCaption); override;
    class procedure InitializeProperties(AProperties,
      AEditProperties: TcxCustomEditProperties; AHasButtons: Boolean); override;
    class procedure SetFilterValue(AEdit: TcxCustomEdit; AEditProperties: TcxCustomEditProperties;
      AValue: Variant); override;
  end;

  { TcxFilterMemoHelper }

  TcxFilterMemoHelper = class(TcxFilterTextEditHelper)
  public
    class function GetSupportedFilterOperators(
      AEditProperties: TcxCustomEditProperties;
      AExtendedSet: Boolean = False): TcxFilterControlOperators; override;
  end;

  { TcxFilterMaskEditHelper }

  TcxFilterMaskEditHelper = class(TcxFilterTextEditHelper)
  public
    class function GetFilterEditClass: TcxCustomEditClass; override;
    class function GetSupportedFilterOperators(
      AEditProperties: TcxCustomEditProperties;
      AExtendedSet: Boolean = False): TcxFilterControlOperators; override;
    class procedure InitializeProperties(AProperties,
      AEditProperties: TcxCustomEditProperties; AHasButtons: Boolean); override;
  end;

  { TcxFilterComboBoxHelper }

  TcxFilterComboBoxHelper = class(TcxFilterMaskEditHelper)
  public
    class function GetFilterEditClass: TcxCustomEditClass; override;
    class procedure InitializeProperties(AProperties,
      AEditProperties: TcxCustomEditProperties; AHasButtons: Boolean); override;
  end;

  { TcxFilterCheckBoxHelper }

  TcxFilterCheckBoxHelper = class(TcxCustomFilterEditHelper)
  public
    class function GetFilterEditClass: TcxCustomEditClass; override;
    class procedure GetFilterValue(AEdit: TcxCustomEdit;
      AEditProperties: TcxCustomEditProperties; var V: Variant; var S: TCaption); override;
    class function GetSupportedFilterOperators(
      AEditProperties: TcxCustomEditProperties;
      AExtendedSet: Boolean = False): TcxFilterControlOperators; override;
    class procedure InitializeProperties(AProperties,
      AEditProperties: TcxCustomEditProperties; AHasButtons: Boolean); override;
    class procedure SetFilterValue(AEdit: TcxCustomEdit; AEditProperties: TcxCustomEditProperties;
      AValue: Variant); override;
    class function UseDisplayValue: Boolean; override;
  end;

  { TcxFilterCalcEditHelper }

  TcxFilterCalcEditHelper = class(TcxFilterMaskEditHelper)
  public
    class function GetFilterEditClass: TcxCustomEditClass; override;
    class function GetSupportedFilterOperators(
      AEditProperties: TcxCustomEditProperties;
      AExtendedSet: Boolean = False): TcxFilterControlOperators; override;
    class procedure InitializeProperties(AProperties,
      AEditProperties: TcxCustomEditProperties; AHasButtons: Boolean); override;
  end;

  { TcxFilterDateEditHelper }

  TcxFilterDateEditHelper = class(TcxFilterMaskEditHelper)
  public
    class function GetFilterEditClass: TcxCustomEditClass; override;
    class function GetSupportedFilterOperators(
      AEditProperties: TcxCustomEditProperties;
      AExtendedSet: Boolean = False): TcxFilterControlOperators; override;
    class procedure InitializeProperties(AProperties,
      AEditProperties: TcxCustomEditProperties; AHasButtons: Boolean); override;
  end;

  { TcxFilterCurrencyEditHelper }

  TcxFilterCurrencyEditHelper = class(TcxFilterTextEditHelper)
  public
    class function GetFilterEditClass: TcxCustomEditClass; override;
    class function GetSupportedFilterOperators(
      AEditProperties: TcxCustomEditProperties;
      AExtendedSet: Boolean = False): TcxFilterControlOperators; override;
    class procedure InitializeProperties(AProperties,
      AEditProperties: TcxCustomEditProperties; AHasButtons: Boolean); override;
  end;

  { TcxFilterSpinEditHelper }

  TcxFilterSpinEditHelper = class(TcxFilterMaskEditHelper)
  public
    class function GetFilterEditClass: TcxCustomEditClass; override;
    class function GetSupportedFilterOperators(
      AEditProperties: TcxCustomEditProperties;
      AExtendedSet: Boolean = False): TcxFilterControlOperators; override;
    class procedure InitializeProperties(AProperties,
      AEditProperties: TcxCustomEditProperties; AHasButtons: Boolean); override;
  end;

  { TcxFilterImageComboBoxHelper }

  TcxFilterImageComboBoxHelper = class(TcxFilterComboBoxHelper)
  public
    class function GetFilterEditClass: TcxCustomEditClass; override;
    class procedure GetFilterValue(AEdit: TcxCustomEdit;
      AEditProperties: TcxCustomEditProperties; var V: Variant; var S: TCaption); override;
    class function GetSupportedFilterOperators(
      AEditProperties: TcxCustomEditProperties;
      AExtendedSet: Boolean = False): TcxFilterControlOperators; override;
    class procedure InitializeProperties(AProperties,
      AEditProperties: TcxCustomEditProperties; AHasButtons: Boolean); override;
  end;

  { TcxFilterTimeEditHelper }

  TcxFilterTimeEditHelper = class(TcxFilterSpinEditHelper)
  protected
    class procedure InitializeEdit(AEdit: TcxCustomEdit;
      AEditProperties: TcxCustomEditProperties); override;
  public
    class function GetFilterEditClass: TcxCustomEditClass; override;
  end;

  { TcxFilterMRUEditHelper }

  TcxFilterMRUEditHelper = class(TcxFilterTextEditHelper)
  public
    class function EditPropertiesHasButtons(AEditProperties: TcxCustomEditProperties): Boolean; override;
  end;

  { TcxFilterHyperLinkEditHelper }

  TcxFilterHyperLinkEditHelper = class(TcxFilterTextEditHelper)
  public
    class function GetFilterEditClass: TcxCustomEditClass; override;
  end;

  { TcxFilterLookupComboBoxHelper }

  TcxFilterLookupComboBoxHelper = class(TcxFilterComboBoxHelper)
  public
    class function GetFilterEditClass: TcxCustomEditClass; override;
    class function GetSupportedFilterOperators(
      AEditProperties: TcxCustomEditProperties;
      AExtendedSet: Boolean = False): TcxFilterControlOperators; override;
    class procedure InitializeProperties(AProperties,
      AEditProperties: TcxCustomEditProperties; AHasButtons: Boolean); override;
  end;

  { TcxFilterRadioGroupHelper }

  TcxFilterRadioGroupHelper = class(TcxCustomFilterEditHelper)
  public
    class function GetFilterEditClass: TcxCustomEditClass; override;
    class procedure GetFilterValue(AEdit: TcxCustomEdit;
      AEditProperties: TcxCustomEditProperties; var V: Variant; var S: TCaption); override;
    class function GetSupportedFilterOperators(
      AEditProperties: TcxCustomEditProperties;
      AExtendedSet: Boolean = False): TcxFilterControlOperators; override;
    class procedure InitializeProperties(AProperties,
      AEditProperties: TcxCustomEditProperties; AHasButtons: Boolean); override;
    class procedure SetFilterValue(AEdit: TcxCustomEdit; AEditProperties: TcxCustomEditProperties;
      AValue: Variant); override;
    class function UseDisplayValue: Boolean; override;
  end;

  { TcxFilterEditsController }

  TcxFilterEditsController = class(TcxRegisteredClassList)
  private
    function GetItemClass(AItemClass: TClass): TClass;
  public
    function FindHelper(APropertiesClass: TClass): TcxCustomFilterEditHelperClass;
    procedure Register(AItemClass, ARegisteredClass: TClass); override;
    procedure Unregister(AItemClass, ARegisteredClass: TClass); override;
  end;


procedure FilterControlValidateValue(AEdit: TcxCustomEdit; var AValue: Variant;
  AOperator: TcxFilterControlOperator; AValueTypeClass: TcxValueTypeClass);
function FilterEditsController: TcxFilterEditsController;
function GetFilterControlOperatorText(AOperator: TcxFilterControlOperator): string;

implementation

uses
{$IFDEF DELPHI6}
  Variants,
{$ELSE}
  cxVariants,
{$ENDIF}
  cxFilterConsts, cxFilterControlStrs, cxLookupEdit;

type
  TcxCustomCalcEditPropertiesAccess = class(TcxCustomCalcEditProperties);
  TcxCustomCheckBoxPropertiesAccess = class(TcxCustomCheckBoxProperties);
  TcxCustomComboBoxPropertiesAccess = class(TcxCustomComboBoxProperties);
  TcxCustomCurrencyEditPropertiesAccess = class(TcxCustomCurrencyEditProperties);
  TcxCustomDateEditPropertiesAccess = class(TcxCustomDateEditProperties);
  TcxCustomEditAccess = class(TcxCustomEdit);
  TcxCustomEditPropertiesAccess = class(TcxCustomEditProperties);
  TcxCustomImageComboBoxPropertiesAccess = class(TcxCustomImageComboBoxProperties);
  TcxCustomMaskEditPropertiesAccess = class(TcxCustomMaskEditProperties);
  TcxCustomSpinEditPropertiesAccess = class(TcxCustomSpinEditProperties);
  TcxCustomTextEditPropertiesAccess = class(TcxCustomTextEditProperties);
  TcxCustomRadioGroupPropertiesAccess = class(TcxCustomRadioGroupProperties);
  TcxCustomLookupEditPropertiesAccess = class(TcxCustomLookupEditProperties);

procedure FilterControlValidateValue(AEdit: TcxCustomEdit; var AValue: Variant;
  AOperator: TcxFilterControlOperator; AValueTypeClass: TcxValueTypeClass);
var
  AError: Boolean;
begin
  if AValueTypeClass = nil then
    Exit;
  if VarIsStr(AValue) and (AValue = '') and not AValueTypeClass.IsString then
    AValue := Null;
  if VarIsNull(AValue) or (AOperator in [fcoLike, fcoNotLike]) then
    Exit;
  AError := True;
  try
    AError := not AValueTypeClass.IsValueValid(AValue);
  finally
    if AError then
    begin
      if AEdit <> nil then AEdit.SetFocus;
      raise Exception.Create(cxGetResourceString(@cxSFilterDialogInvalidValue));
    end;
  end;
end;

var
  FController: TcxFilterEditsController;

function FilterEditsController: TcxFilterEditsController;
begin
  Result := FController;
end;

function GetFilterControlOperatorText(AOperator: TcxFilterControlOperator): string;
begin
  case AOperator of
    fcoEqual:
      Result := cxGetResourceString(@cxSFilterOperatorEqual);
    fcoNotEqual:
      Result := cxGetResourceString(@cxSFilterOperatorNotEqual);
    fcoLess:
      Result := cxGetResourceString(@cxSFilterOperatorLess);
    fcoLessEqual:
      Result := cxGetResourceString(@cxSFilterOperatorLessEqual);
    fcoGreater:
      Result := cxGetResourceString(@cxSFilterOperatorGreater);
    fcoGreaterEqual:
      Result := cxGetResourceString(@cxSFilterOperatorGreaterEqual);
    fcoLike:
      Result := cxGetResourceString(@cxSFilterOperatorLike);
    fcoNotLike:
      Result := cxGetResourceString(@cxSFilterOperatorNotLike);
    fcoBlanks:
      Result := cxGetResourceString(@cxSFilterOperatorIsNull);
    fcoNonBlanks:
      Result := cxGetResourceString(@cxSFilterOperatorIsNotNull);
    fcoBetween:
      Result := cxGetResourceString(@cxSFilterOperatorBetween);
    fcoNotBetween:
      Result := cxGetResourceString(@cxSFilterOperatorNotBetween);
    fcoInList:
      Result := cxGetResourceString(@cxSFilterOperatorInList);
    fcoNotInList:
      Result := cxGetResourceString(@cxSFilterOperatorNotInList);
    //date
    fcoYesterday:
      Result := cxGetResourceString(@cxSFilterOperatorYesterday);
    fcoToday:
      Result := cxGetResourceString(@cxSFilterOperatorToday);
    fcoTomorrow:
      Result := cxGetResourceString(@cxSFilterOperatorTomorrow);
    fcoLastWeek:
      Result := cxGetResourceString(@cxSFilterOperatorLastWeek);
    fcoLastMonth:
      Result := cxGetResourceString(@cxSFilterOperatorLastMonth);
    fcoLastYear:
      Result := cxGetResourceString(@cxSFilterOperatorLastYear);
    fcoThisWeek:
      Result := cxGetResourceString(@cxSFilterOperatorThisWeek);
    fcoThisMonth:
      Result := cxGetResourceString(@cxSFilterOperatorThisMonth);
    fcoThisYear:
      Result := cxGetResourceString(@cxSFilterOperatorThisYear);
    fcoNextWeek:
      Result := cxGetResourceString(@cxSFilterOperatorNextWeek);
    fcoNextMonth:
      Result := cxGetResourceString(@cxSFilterOperatorNextMonth);
    fcoNextYear:
      Result := cxGetResourceString(@cxSFilterOperatorNextYear);
    else
      Result := '';
  end;
end;

{ TcxCustomFilterEditHelper }

class procedure TcxCustomFilterEditHelper.ClearPropertiesEvents(
  AProperties: TcxCustomEditProperties);
begin
  if AProperties = nil then Exit;
  with TcxCustomEditPropertiesAccess(AProperties) do
  begin
    OnValidate := nil;
    OnEditValueChanged := nil;
    OnChange := nil;
    OnButtonClick := nil;
  end;
end;

class procedure TcxCustomFilterEditHelper.InitializeEdit(AEdit: TcxCustomEdit;
  AEditProperties: TcxCustomEditProperties);
begin
  InitializeProperties(TcxCustomEditAccess(AEdit).Properties, AEditProperties,
    EditPropertiesHasButtons(TcxCustomEditAccess(AEdit).Properties));
end;

class function TcxCustomFilterEditHelper.EditPropertiesHasButtons(
  AEditProperties: TcxCustomEditProperties): Boolean;
begin
  Result := (AEditProperties is TcxCustomDropDownEditProperties) or
    (AEditProperties is TcxCustomSpinEditProperties);
end;

class function TcxCustomFilterEditHelper.GetFilterEdit(AEditProperties: TcxCustomEditProperties;
  AInplaceEditList: TcxInplaceEditList = nil): TcxCustomEdit;
begin
  if AInplaceEditList = nil then
    Result := GetFilterEditClass.Create(nil)
  else
    Result := AInplaceEditList.GetEdit(TcxCustomEditPropertiesClass(GetFilterEditClass.GetPropertiesClass));
  InitializeEdit(Result, AEditProperties);
end;

class procedure TcxCustomFilterEditHelper.GetFilterValue(AEdit: TcxCustomEdit;
  AEditProperties: TcxCustomEditProperties; var V: Variant; var S: TCaption);
begin
end;

class function TcxCustomFilterEditHelper.GetSupportedFilterOperators(
  AEditProperties: TcxCustomEditProperties;
  AExtendedSet: Boolean = False): TcxFilterControlOperators;
begin
  if AExtendedSet then
    Result := [fcoEqual..fcoNotInList]
  else
    Result := [fcoEqual..fcoNonBlanks];
end;

class function TcxCustomFilterEditHelper.GetFilterEditClass: TcxCustomEditClass;
begin
  Result := nil;
end;

class procedure TcxCustomFilterEditHelper.InitializeProperties(
  AProperties, AEditProperties: TcxCustomEditProperties; AHasButtons: Boolean);
begin
  with TcxCustomEditPropertiesAccess(AProperties) do
  begin
    Assign(AEditProperties);
    Alignment.Horz := taLeftJustify;
    Alignment.Vert := taTopJustify;
    BeepOnError := False;
    if not AHasButtons then
      Buttons.Clear;
    ReadOnly := False;
    ValidateOnEnter := True;
  end;
  ClearPropertiesEvents(AProperties);
end;

class procedure TcxCustomFilterEditHelper.SetFilterValue(AEdit: TcxCustomEdit;
  AEditProperties: TcxCustomEditProperties; AValue: Variant);
begin
end;

class function TcxCustomFilterEditHelper.UseDisplayValue: Boolean;
begin
  Result := False;
end;

{ TcxFilterTextEditHelper }

class function TcxFilterTextEditHelper.GetFilterEditClass: TcxCustomEditClass;
begin
  Result := TcxTextEdit;
end;

class procedure TcxFilterTextEditHelper.GetFilterValue(AEdit: TcxCustomEdit;
  AEditProperties: TcxCustomEditProperties; var V: Variant; var S: TCaption);
begin
  V := AEdit.EditValue;
  S := TcxCustomEditAccess(AEdit).Text;
end;

class procedure TcxFilterTextEditHelper.InitializeProperties(AProperties,
  AEditProperties: TcxCustomEditProperties; AHasButtons: Boolean);
begin
  inherited InitializeProperties(AProperties, AEditProperties, AHasButtons);
  with TcxCustomTextEditPropertiesAccess(AProperties) do
  begin
    AutoSelect := True;
    HideCursor := False;
    HideSelection := True;
  end;
end;

class procedure TcxFilterTextEditHelper.SetFilterValue(AEdit: TcxCustomEdit;
  AEditProperties: TcxCustomEditProperties; AValue: Variant);
begin
  AEdit.EditValue := AValue;
end;

{ TcxFilterMemoHelper }

class function TcxFilterMemoHelper.GetSupportedFilterOperators(AEditProperties:
  TcxCustomEditProperties;
  AExtendedSet: Boolean = False): TcxFilterControlOperators;
begin
  Result := [fcoLike, fcoNotLike, fcoBlanks, fcoNonBlanks];
end;

{ TcxFilterMaskEditHelper }

class function TcxFilterMaskEditHelper.GetFilterEditClass: TcxCustomEditClass;
begin
  Result := TcxMaskEdit;
end;

class function TcxFilterMaskEditHelper.GetSupportedFilterOperators(
  AEditProperties: TcxCustomEditProperties;
  AExtendedSet: Boolean = False): TcxFilterControlOperators;
begin
  Result := [fcoEqual, fcoNotEqual, fcoLess, fcoLessEqual,
    fcoGreater, fcoGreaterEqual, fcoBlanks, fcoNonBlanks];
  if not TcxCustomMaskEditPropertiesAccess(AEditProperties).IsMasked then
    Result := Result + [fcoLike, fcoNotLike];
  if AExtendedSet then
    Result := Result + [fcoBetween..fcoNotInList];
end;

class procedure TcxFilterMaskEditHelper.InitializeProperties(AProperties,
  AEditProperties: TcxCustomEditProperties; AHasButtons: Boolean);
begin
  inherited InitializeProperties(AProperties, AEditProperties, AHasButtons);
  with TcxCustomMaskEditPropertiesAccess(AProperties) do
  begin
    if TcxCustomMaskEditPropertiesAccess(AEditProperties).MaskKind =
        emkRegExpr then
      MaskKind := emkRegExprEx;
    AutoSelect := not IsMasked;
  end;
end;

{ TcxFilterComboBoxHelper }

class function TcxFilterComboBoxHelper.GetFilterEditClass: TcxCustomEditClass;
begin
  Result := TcxComboBox;
end;

class procedure TcxFilterComboBoxHelper.InitializeProperties(AProperties,
  AEditProperties: TcxCustomEditProperties; AHasButtons: Boolean);
begin
  inherited InitializeProperties(AProperties, AEditProperties, AHasButtons);
  with TcxCustomComboBoxPropertiesAccess(AProperties) do
  begin
    ButtonGlyph := nil;
    DropDownRows := 7;
    DropDownListStyle := lsEditList;
    ImmediateDropDown := False;
    PopupAlignment := taLeftJustify;
    Revertable := False;
  end;
end;

{ TcxFilterCheckBoxHelper }

class function TcxFilterCheckBoxHelper.GetFilterEditClass: TcxCustomEditClass;
begin
  Result := TcxComboBox;
end;

class procedure TcxFilterCheckBoxHelper.GetFilterValue(AEdit: TcxCustomEdit;
  AEditProperties: TcxCustomEditProperties; var V: Variant; var S: TCaption);
begin
  with TcxComboBox(AEdit) do
  begin
    case ItemIndex of
      -1:
        V := Null;
      0:
        V := TcxCustomCheckBoxPropertiesAccess(AEditProperties).ValueChecked;
      1:
        V := TcxCustomCheckBoxPropertiesAccess(AEditProperties).ValueUnchecked;
    end;
    if ItemIndex = -1 then
      S := ''
    else
      S := TcxCustomCheckBoxProperties(AEditProperties).GetDisplayText(V);
  end;
end;

class function TcxFilterCheckBoxHelper.GetSupportedFilterOperators(
  AEditProperties: TcxCustomEditProperties;
  AExtendedSet: Boolean = False): TcxFilterControlOperators;
begin
  Result := [fcoEqual, fcoNotEqual, fcoBlanks, fcoNonBlanks];
end;

class procedure TcxFilterCheckBoxHelper.InitializeProperties(AProperties,
  AEditProperties: TcxCustomEditProperties; AHasButtons: Boolean);
var
  ACheckBoxProperties: TcxCustomCheckBoxPropertiesAccess;
begin
  ACheckBoxProperties := TcxCustomCheckBoxPropertiesAccess(AEditProperties);
  with TcxComboBoxProperties(AProperties).Items do
  begin
    Clear;
    Add(ACheckBoxProperties.GetDisplayText(ACheckBoxProperties.ValueChecked));
    Add(ACheckBoxProperties.GetDisplayText(ACheckBoxProperties.ValueUnchecked));
  end;
  TcxComboBoxProperties(AProperties).DropDownListStyle := lsFixedList;
  ClearPropertiesEvents(AProperties);
end;

class procedure TcxFilterCheckBoxHelper.SetFilterValue(AEdit: TcxCustomEdit;
  AEditProperties: TcxCustomEditProperties; AValue: Variant);
const
  AItemIndexMap: array [TcxCheckBoxState] of Integer = (1, 0, -1);
var
  V: TcxEditValue;
begin
  AEditProperties.PrepareDisplayValue(AValue, V, AEdit.Focused);
  TcxComboBox(AEdit).ItemIndex := AItemIndexMap[TcxCheckBoxState(V)];
end;

class function TcxFilterCheckBoxHelper.UseDisplayValue: Boolean;
begin
  Result := True;
end;

{ TcxFilterCalcEditHelper }

class function TcxFilterCalcEditHelper.GetFilterEditClass: TcxCustomEditClass;
begin
  Result := TcxCalcEdit;
end;

class function TcxFilterCalcEditHelper.GetSupportedFilterOperators(
  AEditProperties: TcxCustomEditProperties;
  AExtendedSet: Boolean = False): TcxFilterControlOperators;
begin
  Result := [fcoEqual, fcoNotEqual, fcoLess, fcoLessEqual, fcoGreater,
    fcoGreaterEqual, fcoBlanks, fcoNonBlanks];
  if AExtendedSet then
    Result := Result + [fcoBetween, fcoNotBetween, fcoInList, fcoNotInList];
end;

class procedure TcxFilterCalcEditHelper.InitializeProperties(AProperties,
  AEditProperties: TcxCustomEditProperties; AHasButtons: Boolean);
begin
  inherited InitializeProperties(AProperties, AEditProperties, AHasButtons);
  with TcxCustomCalcEditPropertiesAccess(AProperties) do
    QuickClose := True;
end;

{ TcxFilterDateEditHelper }

class function TcxFilterDateEditHelper.GetFilterEditClass: TcxCustomEditClass;
begin
  Result := TcxDateEdit;
end;

class function TcxFilterDateEditHelper.GetSupportedFilterOperators(
  AEditProperties: TcxCustomEditProperties;
  AExtendedSet: Boolean = False): TcxFilterControlOperators;
begin
  Result := [fcoEqual, fcoNotEqual, fcoLess, fcoLessEqual, fcoGreater,
    fcoGreaterEqual, fcoBlanks, fcoNonBlanks];
  if AExtendedSet then
    Result := Result + [fcoBetween, fcoNotBetween, fcoInList, fcoNotInList,
      fcoYesterday, fcoToday, fcoTomorrow, fcoLastWeek, fcoLastMonth,
      fcoLastYear, fcoThisWeek, fcoThisMonth, fcoThisYear, fcoNextWeek,
      fcoNextMonth, fcoNextYear];
end;

class procedure TcxFilterDateEditHelper.InitializeProperties(AProperties,
  AEditProperties: TcxCustomEditProperties; AHasButtons: Boolean);
begin
  inherited InitializeProperties(AProperties, AEditProperties, AHasButtons);
  with TcxCustomDateEditPropertiesAccess(AProperties) do
  begin
    DateButtons := [btnToday, btnClear];
    DateOnError := deNull;
    InputKind := ikRegExpr;
    SaveTime := True;
  end;
end;

{ TcxFilterCurrencyEditHelper }

class function TcxFilterCurrencyEditHelper.GetFilterEditClass: TcxCustomEditClass;
begin
  Result := TcxCurrencyEdit;
end;

class function TcxFilterCurrencyEditHelper.GetSupportedFilterOperators(
  AEditProperties: TcxCustomEditProperties;
  AExtendedSet: Boolean = False): TcxFilterControlOperators;
begin
  Result := [fcoEqual, fcoNotEqual, fcoLess, fcoLessEqual, fcoGreater,
    fcoGreaterEqual, fcoBlanks, fcoNonBlanks];
  if AExtendedSet then
    Result := Result + [fcoBetween, fcoNotBetween, fcoInList, fcoNotInList];
end;

class procedure TcxFilterCurrencyEditHelper.InitializeProperties(AProperties,
  AEditProperties: TcxCustomEditProperties; AHasButtons: Boolean);
begin
  inherited InitializeProperties(AProperties, AEditProperties, AHasButtons);
  with TcxCustomCurrencyEditPropertiesAccess(AProperties) do
  begin
    MinValue := 0;
    MaxValue := 0;
    Nullable := True;
    NullString := '';
  end;
end;

{ TcxFilterSpinEditHelper }

class function TcxFilterSpinEditHelper.GetFilterEditClass: TcxCustomEditClass;
begin
  Result := TcxSpinEdit;
end;

class function TcxFilterSpinEditHelper.GetSupportedFilterOperators(
  AEditProperties: TcxCustomEditProperties;
  AExtendedSet: Boolean = False): TcxFilterControlOperators;
begin
  Result := [fcoEqual..fcoGreaterEqual, fcoBlanks, fcoNonBlanks];
  if AExtendedSet then
    Result := Result + [fcoBetween..fcoNotInList]
end;

class procedure TcxFilterSpinEditHelper.InitializeProperties(AProperties,
  AEditProperties: TcxCustomEditProperties; AHasButtons: Boolean);
begin
  inherited InitializeProperties(AProperties, AEditProperties, AHasButtons);
  with TcxCustomSpinEditPropertiesAccess(AProperties) do
    CanEdit := True;
end;

{ TcxFilterImageComboBoxHelper }

class function TcxFilterImageComboBoxHelper.GetFilterEditClass: TcxCustomEditClass;
begin
  Result := TcxImageComboBox;
end;

class procedure TcxFilterImageComboBoxHelper.GetFilterValue(AEdit: TcxCustomEdit;
  AEditProperties: TcxCustomEditProperties; var V: Variant; var S: TCaption);
begin
  V := AEdit.EditValue;
  S := TcxCustomEditAccess(AEdit).Properties.GetDisplayText(V, True);
end;

class function TcxFilterImageComboBoxHelper.GetSupportedFilterOperators(
  AEditProperties: TcxCustomEditProperties;
  AExtendedSet: Boolean = False): TcxFilterControlOperators;
begin
  Result := [fcoEqual, fcoNotEqual, fcoBlanks, fcoNonBlanks];
  if AExtendedSet then
    Result := Result + [fcoInList, fcoNotInList];
end;

class procedure TcxFilterImageComboBoxHelper.InitializeProperties(AProperties,
  AEditProperties: TcxCustomEditProperties; AHasButtons: Boolean);
begin
  inherited InitializeProperties(AProperties, AEditProperties, AHasButtons);
  TcxCustomImageComboBoxPropertiesAccess(AProperties).DropDownListStyle := lsFixedList;
  TcxImageComboBoxProperties(AProperties).ImmediateDropDown := True;
  TcxImageComboBoxProperties(AProperties).ShowDescriptions := True;
end;

{ TcxFilterTimeEditHelper }

class procedure TcxFilterTimeEditHelper.InitializeEdit(AEdit: TcxCustomEdit;
  AEditProperties: TcxCustomEditProperties);
begin
  inherited InitializeEdit(AEdit, AEditProperties);
  TcxTimeEdit(AEdit).Time := 0;
end;

class function TcxFilterTimeEditHelper.GetFilterEditClass: TcxCustomEditClass;
begin
  Result := TcxTimeEdit;
end;

{ TcxFilterMRUEditHelper }

class function TcxFilterMRUEditHelper.EditPropertiesHasButtons(
  AEditProperties: TcxCustomEditProperties): Boolean;
begin
  Result := False;
end;

{ TcxFilterHyperLinkEditHelper }

class function TcxFilterHyperLinkEditHelper.GetFilterEditClass: TcxCustomEditClass;
begin
  Result := TcxHyperLinkEdit;
end;

{ TcxFilterLookupComboBoxHelper }

class function TcxFilterLookupComboBoxHelper.GetFilterEditClass: TcxCustomEditClass;
begin
  Result := TcxLookupComboBox;
end;

class function TcxFilterLookupComboBoxHelper.GetSupportedFilterOperators(
  AEditProperties: TcxCustomEditProperties;
  AExtendedSet: Boolean = False): TcxFilterControlOperators;
begin
  Result := [fcoEqual, fcoNotEqual, fcoBlanks, fcoNonBlanks];
end;

class procedure TcxFilterLookupComboBoxHelper.InitializeProperties(AProperties,
  AEditProperties: TcxCustomEditProperties; AHasButtons: Boolean);
begin
  inherited InitializeProperties(AProperties, AEditProperties, AHasButtons);
  with TcxCustomLookupEditPropertiesAccess(AProperties) do
  begin
    DropDownAutoSize := False;
    DropDownListStyle := lsFixedList;
    DropDownSizeable := True;
    IncrementalFiltering := True;
  end;
end;

{ TcxFilterRadioGroupHelper }

class function TcxFilterRadioGroupHelper.GetFilterEditClass: TcxCustomEditClass;
begin
  Result := TcxComboBox;
end;

class procedure TcxFilterRadioGroupHelper.GetFilterValue(
  AEdit: TcxCustomEdit; AEditProperties: TcxCustomEditProperties;
  var V: Variant; var S: TCaption);
var
  AItemIndex: Integer;
begin
  AItemIndex := TcxComboBox(AEdit).ItemIndex;
  with TcxCustomRadioGroupPropertiesAccess(AEditProperties) do
  begin
    if AItemIndex = -1 then
    begin
      V := DefaultValue;
      S := DefaultCaption;
    end
    else
    begin
      V := Items[AItemIndex].Value;
      S := Items[AItemIndex].Caption;
    end;
  end;
end;

class function TcxFilterRadioGroupHelper.GetSupportedFilterOperators(
  AEditProperties: TcxCustomEditProperties;
  AExtendedSet: Boolean): TcxFilterControlOperators;
begin
  Result := [fcoEqual, fcoNotEqual, fcoBlanks, fcoNonBlanks];
  if AExtendedSet then Result := Result + [fcoInList, fcoNotInList];
end;

class procedure TcxFilterRadioGroupHelper.InitializeProperties(AProperties,
  AEditProperties: TcxCustomEditProperties; AHasButtons: Boolean);
var
  ARadioGroupProperties: TcxCustomRadioGroupPropertiesAccess;
  I: Integer;
begin
  ARadioGroupProperties := TcxCustomRadioGroupPropertiesAccess(AEditProperties);
  with TcxComboBoxProperties(AProperties).Items do
  begin
    Clear;
    for I := 0 to ARadioGroupProperties.Items.Count - 1 do
      Add(ARadioGroupProperties.Items[I].Caption);
  end;
  TcxComboBoxProperties(AProperties).DropDownListStyle := lsFixedList;
  ClearPropertiesEvents(AProperties);
end;

class procedure TcxFilterRadioGroupHelper.SetFilterValue(
  AEdit: TcxCustomEdit; AEditProperties: TcxCustomEditProperties;
  AValue: Variant);
var
  V: TcxEditValue;
begin
  AEditProperties.PrepareDisplayValue(AValue, V, AEdit.Focused);
  TcxComboBox(AEdit).ItemIndex := V;
end;

class function TcxFilterRadioGroupHelper.UseDisplayValue: Boolean;
begin
  Result := True;
end;

{ TcxFilterEditsController }

function TcxFilterEditsController.GetItemClass(
  AItemClass: TClass): TClass;
begin
  Result := AItemClass.ClassParent;
end;

function TcxFilterEditsController.FindHelper(
  APropertiesClass: TClass): TcxCustomFilterEditHelperClass;
begin
  Result := TcxCustomFilterEditHelperClass(FindClass(GetItemClass(APropertiesClass)));
end;

procedure TcxFilterEditsController.Register(AItemClass,
  ARegisteredClass: TClass);
begin
  inherited Register(GetItemClass(AItemClass), ARegisteredClass);
end;

procedure TcxFilterEditsController.Unregister(AItemClass,
  ARegisteredClass: TClass);
begin
  inherited Unregister(GetItemClass(AItemClass), ARegisteredClass);
end;

initialization
  FController := TcxFilterEditsController.Create;
  FController.Register(TcxCalcEditProperties, TcxFilterCalcEditHelper);
  FController.Register(TcxCheckBoxProperties, TcxFilterCheckBoxHelper);
  FController.Register(TcxComboBoxProperties, TcxFilterComboBoxHelper);
  FController.Register(TcxCurrencyEditProperties, TcxFilterCurrencyEditHelper);
  FController.Register(TcxDateEditProperties, TcxFilterDateEditHelper);
  FController.Register(TcxHyperLinkEditProperties, TcxFilterHyperLinkEditHelper);
  FController.Register(TcxImageComboBoxProperties, TcxFilterImageComboBoxHelper);
  FController.Register(TcxLookupComboBoxProperties, TcxFilterLookupComboBoxHelper);
  FController.Register(TcxMaskEditProperties, TcxFilterMaskEditHelper);
  FController.Register(TcxMemoProperties, TcxFilterMemoHelper);
  FController.Register(TcxMRUEditProperties, TcxFilterMRUEditHelper);
  FController.Register(TcxRadioGroupProperties, TcxFilterRadioGroupHelper);
  FController.Register(TcxSpinEditProperties, TcxFilterSpinEditHelper);
  FController.Register(TcxTextEditProperties, TcxFilterTextEditHelper);
  FController.Register(TcxTimeEditProperties, TcxFilterTimeEditHelper);

finalization
  FreeAndNil(FController);

end.
