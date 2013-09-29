
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

unit cxCurrencyEdit;

{$I cxEdVer.inc}

interface

uses
{$IFDEF VCL}
  Windows, Messages,
{$ELSE}
  Qt, QTypes,
{$ENDIF}
{$IFDEF DELPHI6}
  Types,
{$ENDIF}
  SysUtils, Classes, Controls, Clipbrd, cxContainer, cxDataUtils, cxEdit,
  cxTextEdit, cxFormats;

type
  { TcxCurrencyEditPropertiesValues }

  TcxCurrencyEditPropertiesValues = class(TcxCustomEditPropertiesValues)
  public
    DisplayFormat: Boolean;
    procedure Assign(Source: TPersistent); override;
    procedure Reset; override;
  end;

  { TcxCustomCurrencyEditProperties }

  TcxCustomCurrencyEditProperties = class(TcxCustomTextEditProperties, IcxFormatContollerListener)
  private
    FDecimalPlaces: Integer;
    FDisplayFormat: string;
    FFormatChanging: Boolean;
    FNullable: Boolean;
    FNullString: string;
    FUseThousandSeparator: Boolean;
    function FormatDisplayValue(AEditFocused: Boolean): Boolean;
    function GetAssignedValues: TcxCurrencyEditPropertiesValues;
    function GetDisplayFormat: string;
    function IsDisplayFormatStored: Boolean;
    procedure SetDisplayFormat(const Value: string);
    procedure SetNullable(const Value: Boolean);
    procedure SetNullString(const Value: string);
    procedure SetUseThousandSeparator(const Value: Boolean);
  protected
    // IcxFormatContollerListener
    procedure FormatChanged;

    function GetDisplayFormatOptions: TcxEditDisplayFormatOptions; override;
    function StrToFloatEx(S: string; var Value: Double): Boolean;
    property AssignedValues: TcxCurrencyEditPropertiesValues
      read GetAssignedValues;
    property DecimalPlaces: Integer read FDecimalPlaces write FDecimalPlaces
      default 2;
    property DisplayFormat: string read GetDisplayFormat write SetDisplayFormat
       stored IsDisplayFormatStored;
    property Nullable: Boolean read FNullable write SetNullable default True;
    property NullString: string read FNullString write SetNullString;
    property UseThousandSeparator: Boolean read FUseThousandSeparator
      write SetUseThousandSeparator default False;
  public
    constructor Create(AOwner: TPersistent); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    class function GetAssignedValuesClass: TcxCustomEditPropertiesValuesClass; override;
    class function GetContainerClass: TcxContainerClass; override;
    function GetEditValueSource(AEditFocused: Boolean): TcxDataEditValueSource; override;
    function IsDisplayValueValid(var DisplayValue: TcxEditValue; AEditFocused: Boolean): Boolean; override;
    function IsEditValueNumeric: Boolean; override;
    procedure PrepareDisplayValue(const AEditValue: TcxEditValue;
      var DisplayValue: TcxEditValue; AEditFocused: Boolean); override;
    procedure ValidateDisplayValue(var ADisplayValue: TcxEditValue;
      var AErrorText: TCaption; var Error: Boolean; AEdit: TcxCustomEdit); override;
  end;

  { TcxCurrencyEditProperties }

  TcxCurrencyEditProperties = class(TcxCustomCurrencyEditProperties)
  published
    property Alignment;
    property AutoSelect;
    property DecimalPlaces;
    property DisplayFormat;
    property HideSelection;
    property MaxValue;
    property MinValue;
    property Nullable;
    property NullString;
    property ReadOnly;
    property UseLeftAlignmentOnEditing;
    property UseThousandSeparator;
    property OnChange;
    property OnEditValueChanged;
    property OnValidate;
  end;

  { TcxCustomCurrencyEdit }

  TcxCustomCurrencyEdit = class(TcxCustomTextEdit, IcxFormatContollerListener)
  private
    function GetProperties: TcxCurrencyEditProperties;
    function GetValue: Double;
    procedure SetProperties(Value: TcxCurrencyEditProperties);
    procedure SetValue(Value: Double);
  protected
    // IcxFormatContollerListener
    procedure FormatChanged;

    function IsValidChar(Key: Char): Boolean; override;
    procedure KeyPress(var Key: Char); override;
    procedure PropertiesChanged(Sender: TObject); override;
    property Properties: TcxCurrencyEditProperties
       read GetProperties write SetProperties;
    property Value: Double read GetValue write SetValue stored False;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    class function GetPropertiesClass: TcxCustomEditPropertiesClass; override;
    procedure PasteFromClipboard; override;
    procedure PrepareEditValue(const ADisplayValue: TcxEditValue;
      out EditValue: TcxEditValue; AEditFocused: Boolean); override;
  end;

  { TcxCurrencyEdit }

  TcxCurrencyEdit = class(TcxCustomCurrencyEdit)
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
    property EditValue;
    property Enabled;
    {$IFDEF VCL}
    property ImeMode;
    property ImeName;
    {$ENDIF}
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property Properties;
    property ShowHint;
    property Style;
    property TabOrder;
    property TabStop;
    property Value;
    property Visible;
    property OnClick;
    property OnDblClick;
    property OnEditing;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
  {$IFDEF VCL}
    property BiDiMode;
    property ParentBiDiMode;
    property OnEndDock;
    property OnStartDock;
  {$ENDIF}
  end;

implementation

uses
{$IFDEF DELPHI6}
  Variants,
{$ELSE}
  cxVariants,
{$ENDIF}
  cxEditConsts;

type
  TcxEditDataBindingAccess = class(TcxEditDataBinding);

{$IFNDEF DELPHI6}
function StrToCurrDef(const S: string; const Default: Currency): Currency;
begin
  if not TextToFloat(PChar(S), Result, fvCurrency) then
    Result := Default;
end;
{$ENDIF}

{ TcxCurrencyEditPropertiesValues }

procedure TcxCurrencyEditPropertiesValues.Assign(Source: TPersistent);
begin
  if Source is TcxCurrencyEditPropertiesValues then
    with Source as TcxCurrencyEditPropertiesValues do
      Self.DisplayFormat := DisplayFormat;
  inherited Assign(Source);
end;

procedure TcxCurrencyEditPropertiesValues.Reset;
begin
  inherited Reset;
  DisplayFormat := False;
end;

{ TcxCustomCurrencyEditProperties }

constructor TcxCustomCurrencyEditProperties.Create(AOwner: TPersistent);
begin
  inherited Create(AOwner);
  FDecimalPlaces := 2;
  FNullable := True;
  FUseThousandSeparator := False;
  ValidateOnEnter := True;
  cxFormatController.AddListener(Self);
end;

destructor TcxCustomCurrencyEditProperties.Destroy;
begin
  cxFormatController.RemoveListener(Self);
  inherited Destroy;
end;

function TcxCustomCurrencyEditProperties.FormatDisplayValue(AEditFocused: Boolean): Boolean;
begin
  Result := not AEditFocused;
end;

function TcxCustomCurrencyEditProperties.GetAssignedValues: TcxCurrencyEditPropertiesValues;
begin
  Result := TcxCurrencyEditPropertiesValues(FAssignedValues);
end;

function TcxCustomCurrencyEditProperties.GetDisplayFormat: string;
begin
  if AssignedValues.DisplayFormat then
    Result := FDisplayFormat
  else
    if (IDefaultValuesProvider = nil) or
     (IDefaultValuesProvider.DefaultDisplayFormat = '') then
        Result := cxFormatController.CurrencyFormat
    else
      Result := IDefaultValuesProvider.DefaultDisplayFormat;
end;

function TcxCustomCurrencyEditProperties.IsDisplayFormatStored: Boolean;
begin
  Result := AssignedValues.DisplayFormat;
end;

procedure TcxCustomCurrencyEditProperties.SetDisplayFormat(
  const Value: string);
begin
  if AssignedValues.DisplayFormat and (Value = FDisplayFormat) then
    Exit;

  AssignedValues.DisplayFormat := True;
  FDisplayFormat := Value;
  Changed;
end;

procedure TcxCustomCurrencyEditProperties.SetNullable(
  const Value: Boolean);
begin
  if FNullable <> Value then
  begin
    FNullable := Value;
    Changed;
  end;
end;

procedure TcxCustomCurrencyEditProperties.SetNullString(
  const Value: string);
begin
  if FNullString <> Value then
  begin
    FNullString := Value;
    Changed;
  end;
end;

procedure TcxCustomCurrencyEditProperties.SetUseThousandSeparator(
  const Value: Boolean);
begin
  if FUseThousandSeparator <> Value then
  begin
    FUseThousandSeparator := Value;
    Changed;
  end;
end;

procedure TcxCustomCurrencyEditProperties.FormatChanged;
begin
  FFormatChanging := True;
  try
    BeginUpdate;
    try
      DisplayFormat := cxFormatController.CurrencyFormat;
    finally
      EndUpdate;
    end;
  finally
    FFormatChanging := False;
  end;
end;

function TcxCustomCurrencyEditProperties.GetDisplayFormatOptions: TcxEditDisplayFormatOptions;
begin
  Result := [dfoSupports];
end;

function TcxCustomCurrencyEditProperties.StrToFloatEx(S: string; var Value: Double): Boolean;
const
  MinDouble = 5.0e-324;
  MaxDouble = 1.7e+308;
var
  I: Integer;
  E: Extended;
begin
  // Ignore Thousand Separators
  for I := Length(S) downto 1 do
    if S[I] = ThousandSeparator then
      Delete(S, I, 1);
  if not TextToFloat(PChar(S), E, fvExtended) or
    ((E <> 0) and ((Abs(E) < MinDouble) or (Abs(E) > MaxDouble))) then
  begin
    Value := 0;
    Result := False;
  end
  else
  begin
    Value := E;
    Result := True;
  end;
end;

procedure TcxCustomCurrencyEditProperties.Assign(Source: TPersistent);
begin
  if Source is TcxCustomCurrencyEditProperties then
  begin
    BeginUpdate;
    try
      inherited Assign(Source);
      with TcxCustomCurrencyEditProperties(Source) do
      begin
        Self.DecimalPlaces := DecimalPlaces;
        Self.DisplayFormat := DisplayFormat;
        Self.Nullable := Nullable;
        Self.NullString := NullString;
        Self.UseThousandSeparator := UseThousandSeparator;
      end;
    finally
      EndUpdate
    end
  end
  else
    inherited Assign(Source);
end;

class function TcxCustomCurrencyEditProperties.GetContainerClass: TcxContainerClass;
begin
  Result := TcxCustomCurrencyEdit;
end;

function TcxCustomCurrencyEditProperties.GetEditValueSource(AEditFocused: Boolean): TcxDataEditValueSource;
begin
  Result := GetValueEditorEditValueSource(AEditFocused);
end;

function TcxCustomCurrencyEditProperties.IsDisplayValueValid(
  var DisplayValue: TcxEditValue; AEditFocused: Boolean): Boolean;
begin
  Result := True;
end;

function TcxCustomCurrencyEditProperties.IsEditValueNumeric: Boolean;
begin
  Result := True;
end;

procedure TcxCustomCurrencyEditProperties.PrepareDisplayValue(
  const AEditValue: TcxEditValue; var DisplayValue: TcxEditValue;
  AEditFocused: Boolean);
var
  D: Double;
begin
  if FormatDisplayValue(AEditFocused) then
  begin
    if VarIsNull(AEditValue) or (VarIsStr(AEditValue) and (AEditValue = '')) then
    begin
      if Nullable then
        DisplayValue := NullString
      else
        DisplayValue := '0';
      Exit
    end;
    try
      D := AEditValue;
      if DisplayFormat <> '' then
        DisplayValue := FormatFloat(DisplayFormat, D)
      else
        DisplayValue := FloatToStr(D);
    except
      on EConvertError do
        if AEditFocused then DisplayValue := '' else DisplayValue := AEditValue;
      on EVariantError do
        if AEditFocused then DisplayValue := '' else DisplayValue := AEditValue;
    end
  end
  else
  begin
    if VarIsNull(AEditValue) or (VarIsStr(AEditValue) and (AEditValue = '')) then
      DisplayValue := ''
    else
      try
        DisplayValue := FloatToStr(AEditValue);
      except
        on EConvertError do
          if AEditFocused then DisplayValue := '' else DisplayValue := AEditValue;
        on EVariantError do
          if AEditFocused then DisplayValue := '' else DisplayValue := AEditValue;
      end;
  end;
end;

procedure TcxCustomCurrencyEditProperties.ValidateDisplayValue(
  var ADisplayValue: TcxEditValue; var AErrorText: TCaption;
  var Error: Boolean; AEdit: TcxCustomEdit);
begin
  Error := False;
  inherited;
end;

class function TcxCustomCurrencyEditProperties.GetAssignedValuesClass: TcxCustomEditPropertiesValuesClass;
begin
  Result := TcxCurrencyEditPropertiesValues;
end;

{ TcxCustomCurrencyEdit }

constructor TcxCustomCurrencyEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle - [csSetCaption];
  cxFormatController.AddListener(Self);
end;

destructor TcxCustomCurrencyEdit.Destroy;
begin
  cxFormatController.RemoveListener(Self);
  inherited Destroy;
end;

function TcxCustomCurrencyEdit.GetProperties: TcxCurrencyEditProperties;
begin
  Result := TcxCurrencyEditProperties(InternalGetProperties);
end;

function TcxCustomCurrencyEdit.GetValue: Double;
begin
  if VarIsNull(EditValue) or (VarIsStr(EditValue) and (StrToCurrDef(EditValue, 0) = 0)) then
    Result := 0.00
  else
    Result := EditValue;
end;

procedure TcxCustomCurrencyEdit.SetProperties(
  Value: TcxCurrencyEditProperties);
begin
  FProperties.Assign(Value);
end;

procedure TcxCustomCurrencyEdit.SetValue(Value: Double);
begin
  with Properties do
    if MaxValue <> MinValue then
    begin
      if Value < MinValue then
        Value := MinValue
      else
        if Value > MaxValue then Value := MaxValue;
    end;
  EditValue := Value;
  DoExit;
end;

procedure TcxCustomCurrencyEdit.FormatChanged;
begin
  Properties.DisplayFormat := cxFormatController.CurrencyFormat;
  SynchronizeDisplayValue;
end;

function TcxCustomCurrencyEdit.IsValidChar(Key: Char): Boolean;
var
  S: string;
  V: Double;
  StartPos, StopPos, DecPos: Integer;
  ValidChars: set of Char;
begin
  Result := False;
  ValidChars := [DecimalSeparator, '-', '+', '0'..'9', 'e', 'E'];
  if Properties.UseThousandSeparator then
    ValidChars := ValidChars + [ThousandSeparator];
  if not (Key in ValidChars) then
    Exit;
  S := Text;
  StartPos := SelStart;
  StopPos := SelStart + SelLength;
  System.Delete(S, SelStart + 1, StopPos - StartPos);
  if (Key = '-') and (S = '') then
  begin
    Result := True;
    Exit;
  end;
  System.Insert(Key, S, StartPos + 1);
  DecPos := Pos(DecimalSeparator, S);
  if (DecPos > 0) then
  begin
    StartPos := Pos('E', UpperCase(S));
    if (StartPos > DecPos) then
      DecPos := StartPos - DecPos - 1
    else
      DecPos := Length(S) - DecPos;
    if DecPos > Properties.DecimalPlaces then Exit;
  end;
  if Properties.StrToFloatEx(S, V) then
    Result := True;
end;

procedure TcxCustomCurrencyEdit.KeyPress(var Key: Char);
begin
  if not (Properties.UseThousandSeparator and (Key = ThousandSeparator)) and
    (Key in ['.', ',']) then
    Key := DecimalSeparator;
  if (Key in [#32 .. #255]) and not IsValidChar(Key) then
  begin
    Key := #0;
    Beep;
  end;
  if Key <> #0 then inherited KeyPress(Key);
end;

procedure TcxCustomCurrencyEdit.PropertiesChanged(Sender: TObject);
begin
  if (Sender <> nil) and TcxCustomCurrencyEditProperties(Properties).FFormatChanging then
    Exit;
  if not Focused then
    TcxEditDataBindingAccess(DataBinding).UpdateDisplayValue;
  inherited PropertiesChanged(Sender);
end;

class function TcxCustomCurrencyEdit.GetPropertiesClass: TcxCustomEditPropertiesClass; 
begin
  Result := TcxCurrencyEditProperties;
end;

procedure TcxCustomCurrencyEdit.PasteFromClipboard;
var
  S: string;
begin
  if not CanModify then Exit;
  S := Text;
  inherited;
  try
    StrToFloat(Text);
  except
    Text := S;
    SelectAll;
  end;
end;

procedure TcxCustomCurrencyEdit.PrepareEditValue(
  const ADisplayValue: TcxEditValue; out EditValue: TcxEditValue;
  AEditFocused: Boolean);
var
  V: Double;
begin
  if (ADisplayValue = '') or (CompareStr(ADisplayValue, Properties.NullString) = 0) or
    not Properties.StrToFloatEx(ADisplayValue, V) then
      if Properties.Nullable then EditValue := Null else EditValue := 0.00
  else
    EditValue := V
end;

initialization
  GetRegisteredEditProperties.Register(TcxCurrencyEditProperties, scxSEditRepositoryCurrencyItem);

end.
