
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

unit cxTimeEdit;

{$I cxEdVer.inc}

interface

uses
{$IFDEF DELPHI6}
  Variants,
{$ENDIF}
{$IFDEF VCL}
  Windows, 
{$ELSE}
  QTypes,
{$ENDIF}
  Classes, Controls, SysUtils, cxClasses, cxContainer, cxDataUtils, cxDateUtils,
  cxEdit, cxFormats, cxSpinEdit, cxVariants;

type
{$IFNDEF VCL}
  TDate = type TDateTime;
  TTime = type TDateTime;
{$ENDIF}

  { TcxCustomTimeEditProperties }

  TcxCustomTimeEdit = class;
  TcxTimeEditTimeFormat = (tfHourMinSec, tfHourMin, tfHour);

  TcxCustomTimeEditProperties = class(TcxCustomSpinEditProperties, IcxFormatContollerListener)
  private
    FShowDate: Boolean;
    FTimeFormat: TcxTimeEditTimeFormat;
    FUse24HourFormat: Boolean;

    // IcxFormatContollerListener
    procedure FormatChanged;

    procedure SetUse24HourFormat(Value: Boolean);
    procedure SetShowDate(Value: Boolean);
    procedure SetTimeFormat(Value: TcxTimeEditTimeFormat);
  protected
    function DefaultFocusedDisplayValue: TcxEditValue; override;
    function GetDisplayFormatOptions: TcxEditDisplayFormatOptions; override;
    function IsDisplayValueNumeric: Boolean; override;
    function IsEditValueNumeric: Boolean; override;
    function PreserveSelection: Boolean; override;
    procedure UpdateEditMask;
    property ShowDate: Boolean read FShowDate write SetShowDate default False;
    property TimeFormat: TcxTimeEditTimeFormat read FTimeFormat write SetTimeFormat default tfHourMinSec;
    property Use24HourFormat: Boolean read FUse24HourFormat write SetUse24HourFormat default True;
  public
    constructor Create(AOwner: TPersistent); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    class function GetContainerClass: TcxContainerClass; override;
    function GetEditValueSource(AEditFocused: Boolean): TcxDataEditValueSource; override;
    function IsDisplayValueValid(var DisplayValue: TcxEditValue; AEditFocused: Boolean): Boolean; override;
    function IsEditValueValid(var EditValue: TcxEditValue; AEditFocused: Boolean): Boolean; override;
    procedure PrepareDisplayValue(const AEditValue: TcxEditValue; var DisplayValue: TcxEditValue;
      AEditFocused: Boolean); override;
  end;

  { TcxTimeEditProperties }

  TcxTimeEditProperties = class(TcxCustomTimeEditProperties)
  published
    property Alignment;
    property AutoSelect;
    property BeepOnError;
    property HideSelection;
    property ImmediatePost;
    property ReadOnly;
    property ShowDate;
    property TimeFormat;
    property UseCtrlIncrement;
    property UseLeftAlignmentOnEditing;
    property Use24HourFormat;
    property OnChange;
    property OnEditValueChanged;
    property OnValidate;
  end;

  { TcxCustomTimeEdit }

  TcxCustomTimeEdit = class(TcxCustomSpinEdit)
  private
    FBackSpaceProcessing: Boolean;
    FSavedDate: TDate;
    function GetProperties: TcxTimeEditProperties;
    function GetTime: TTime;
    procedure SetProperties(Value: TcxTimeEditProperties);
    procedure SetTime(Value: TTime);
  protected
    procedure DoEditKeyDown(var Key: Word; Shift: TShiftState); override;
    procedure DoEditKeyPress(var Key: Char); override;
    function ExtendValueUpToBound: Boolean; override;
    function GetIncrement(AButton: TcxSpinEditButton): Double; override;
    function GetValue: Variant; override;
    function InternalGetText: TCaption; override;
    procedure InternalSetDisplayValue(const Value: TcxEditValue); override;
    procedure InternalSetEditValue(const Value: TcxEditValue;
      AValidateEditValue: Boolean); override;
    function InternalSetText(const Value: TCaption): Boolean; override;
    function IsValidChar(AChar: Char): Boolean; override;
    procedure PropertiesChanged(Sender: TObject); override;
    procedure SetValue(const Value: Variant); override;
    function EditingPlace: Char;
    property Properties: TcxTimeEditProperties read GetProperties write SetProperties;
    property Time: TTime read GetTime write SetTime stored False;
  public
    class function GetPropertiesClass: TcxCustomEditPropertiesClass; override;
    function Increment(AButton: TcxSpinEditButton): Boolean; override;
    procedure PrepareEditValue(const ADisplayValue: TcxEditValue;
      out EditValue: TcxEditValue; AEditFocused: Boolean); override;
  end;

  { TcxTimeEdit }

  TcxTimeEdit = class(TcxCustomTimeEdit)
  published
    property Anchors;
    property AutoSize;
    property BeepOnEnter;
    property Constraints;
    property DragMode;
    property EditValue;
    property Enabled;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property Properties;
    property ShowHint;
    property Style;
    property TabOrder;
    property TabStop;
    property Time;
    property Visible;
{$IFDEF VCL}
    property DragCursor;
    property DragKind;
    property ImeMode;
    property ImeName;
{$ENDIF}
    property OnClick;
{$IFDEF DELPHI5}
    property OnContextPopup;
{$ENDIF}
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEditing;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
{$IFDEF VCL}
    property OnEndDock;
    property OnStartDock;
{$ENDIF}
  end;

implementation

uses
  cxControls, cxEditConsts, cxMaskEdit, cxTextEdit;

type
  TcxEditDataBindingAccess = class(TcxEditDataBinding);

  { TcxTimeEditFormatListener }

  TcxTimeEditFormatListener = class(TcxInterfacedPersistent, IcxFormatContollerListener)
  private
    procedure FormatChanged;
  public
    constructor Create(AOwner: TPersistent); override;
    destructor Destroy; override;
  end;

var
  cxTimeEditHalfDayIncrement,
  cxTimeEditOneHourIncrement,
  cxTimeEditOneMinIncrement,
  cxTimeEditOneSecIncrement: Double;
  FTimeEditFormatListener: TcxTimeEditFormatListener;

  cxTimeEditFormats: array [TcxTimeEditTimeFormat, Boolean, 0 .. 1] of string = (
    (('hh:nn:ss ampm', '00:00:00 LL;1;0'), ('hh:nn:ss', '00:00:00;1;0')),
    (('hh:nn ampm', '00:00 LL;1;0'), ('hh:nn', '00:00;1;0')),
    (('hh ampm', '00 LL;1;0'), ('hh', '00;1;0'))
  );

function IsSpace(AChar: {$IFDEF VCL}Char{$ELSE}WideChar{$ENDIF}): Boolean;
begin
  Result :=  AChar = ' ';
end;

procedure PrepareTimeEditMasks;
var
  AMask: TCaption;
  ATimeFormat: TcxTimeEditTimeFormat;
  I: Integer;
  S: TCaption;
begin
  S := FormatDateTime('hh:mm:ss AMPM', 1.5);
  AMask := '';
  for I := 9 to Length(S) do
    if IsSpace(S[I]) then
      AMask := AMask + ' '
    else
      AMask := AMask + 'c';
  AMask := TrimRight(AMask);
  for ATimeFormat := tfHourMinSec to tfHour do
  begin
    S := cxTimeEditFormats[ATimeFormat, False, 1];
    S := Copy(S, 1, (3 - Integer(ATimeFormat)) * 3 - 1);
    S := S + AMask + ';1;0';
    cxTimeEditFormats[ATimeFormat, False, 1] := S;
  end;
end;

function Sign(Value: Double): Integer;
begin
  if Value >= 0 then
    Result := 1
  else
    Result := -1;
end;

{ TcxTimeEditFormatListener }

constructor TcxTimeEditFormatListener.Create(AOwner: TPersistent);
begin
  inherited Create(AOwner);
  cxFormatController.AddListener(Self);
  PrepareTimeEditMasks;
end;

destructor TcxTimeEditFormatListener.Destroy;
begin
  cxFormatController.RemoveListener(Self);
  inherited Destroy;
end;

procedure TcxTimeEditFormatListener.FormatChanged;
begin
  PrepareTimeEditMasks;
end;

{ TcxCustomTimeEditProperties }

constructor TcxCustomTimeEditProperties.Create(AOwner: TPersistent);
begin
  inherited Create(AOwner);
  FTimeFormat := tfHourMinSec;
  ValueType := vtFloat;
  FUse24HourFormat := True;
  UpdateEditMask;
  IgnoreMaskBlank := True;
  MinValue := EncodeTime(0, 0, 0, 0);
  MaxValue := EncodeTime(23, 59, 59, 0);
  AlwaysShowBlanksAndLiterals := True;
  cxFormatController.AddListener(Self);
end;

destructor TcxCustomTimeEditProperties.Destroy;
begin
  cxFormatController.RemoveListener(Self);
  inherited Destroy;
end;

procedure TcxCustomTimeEditProperties.Assign(Source: TPersistent);
begin
  if Source is TcxCustomTimeEditProperties then
  begin
    BeginUpdate;
    try
      inherited Assign(Source);
      with Source as TcxCustomTimeEditProperties do
      begin
        Self.ShowDate := ShowDate;
        Self.TimeFormat := TimeFormat;
        Self.Use24HourFormat := Use24HourFormat;
      end
    finally
      EndUpdate;
    end
  end
  else
    inherited Assign(Source);
end;

class function TcxCustomTimeEditProperties.GetContainerClass: TcxContainerClass;
begin
  Result := TcxTimeEdit;
end;

function TcxCustomTimeEditProperties.IsDisplayValueValid(var DisplayValue: TcxEditValue;
  AEditFocused: Boolean): Boolean;
var
  AText: string;
  ADateTime: TDateTime;
begin
  AText := VarToStr(DisplayValue);
  Result := True;
  try
    ADateTime := StrToDateTime(AText);
    DisplayValue := FormatDateTime(cxTimeEditFormats[TimeFormat, FUse24HourFormat, 0], ADateTime);
    DisplayValue := TrimRight(DisplayValue);
  except
    Result := False;
  end;
end;

function TcxCustomTimeEditProperties.IsEditValueValid(var EditValue: TcxEditValue;
  AEditFocused: Boolean): Boolean;
begin
  if VarIsStr(EditValue) then
    Result := IsDisplayValueValid(EditValue, AEditFocused)
  else
    Result := VarIsDate(EditValue) or VarIsNumericEx(EditValue);
end;

procedure TcxCustomTimeEditProperties.PrepareDisplayValue(const AEditValue: TcxEditValue;
  var DisplayValue: TcxEditValue; AEditFocused: Boolean);

  function InternalFormatDateTime(AValue: TcxEditValue): string;
  begin
    if not AEditFocused then
      if (IDefaultValuesProvider = nil) or not IDefaultValuesProvider.HasDisplayValueFormatting then
        if (AValue = 0) or not ShowDate or (DateOf(AValue) = 0) then
          Result := FormatDateTime(cxTimeEditFormats[TimeFormat, Use24HourFormat, 0], AValue)
        else
          Result := DateTimeToStr(AValue)
      else
        if ShowDate then
          Result := DateTimeToStr(AValue)
        else
          Result := TimeToStr(AValue)
    else
      Result := FormatDateTime(cxTimeEditFormats[TimeFormat, FUse24HourFormat, 0], AValue);
    Result := TrimRight(Result);
  end;

begin
  if VarIsNull(AEditValue) then
    if not AEditFocused then
      DisplayValue := ''
    else
    begin
      DisplayValue := FormatDateTime(cxTimeEditFormats[TimeFormat, FUse24HourFormat, 0], 0);
      DisplayValue := TrimRight(DisplayValue);
    end
  else
    if not VarIsDate(AEditValue) and not VarIsNumericEx(AEditValue) and
        not VarIsStr(AEditValue) then
      raise EConvertError.CreateFmt(cxGetResourceString(@cxSEditTimeConvertError), [])
    else
      try
        if VarIsStr(AEditValue) then
          DisplayValue := InternalFormatDateTime(StrToDateTime(AEditValue))
        else
          DisplayValue := InternalFormatDateTime(AEditValue);
      except
        DisplayValue := InternalFormatDateTime(SysUtils.Now);
      end;
end;

function TcxCustomTimeEditProperties.GetEditValueSource(AEditFocused: Boolean): TcxDataEditValueSource;
begin
  Result := GetValueEditorEditValueSource(AEditFocused);
end;

function TcxCustomTimeEditProperties.DefaultFocusedDisplayValue: TcxEditValue;
begin
  Result := FormatDateTime(cxTimeEditFormats[TimeFormat, FUse24HourFormat, 0], 0);
  Result := TrimRight(Result);
end;

function TcxCustomTimeEditProperties.GetDisplayFormatOptions: TcxEditDisplayFormatOptions;
begin
  Result := [dfoSupports, dfoNoCurrencyValue];
end;

function TcxCustomTimeEditProperties.IsDisplayValueNumeric: Boolean;
begin
  Result := False;
end;

function TcxCustomTimeEditProperties.IsEditValueNumeric: Boolean;
begin
  Result := False;
end;

function TcxCustomTimeEditProperties.PreserveSelection: Boolean;
begin
  Result := True;
end;

procedure TcxCustomTimeEditProperties.UpdateEditMask;
begin
  EditMask := cxTimeEditFormats[FTimeFormat, FUse24HourFormat, 1];
end;

procedure TcxCustomTimeEditProperties.FormatChanged;
begin
  BeginUpdate;
  try
    UpdateEditMask;
  finally
    EndUpdate;
  end;
end;

procedure TcxCustomTimeEditProperties.SetUse24HourFormat(Value: Boolean);
begin
  if Value <> FUse24HourFormat then
  begin
    FUse24HourFormat := Value;
    UpdateEditMask;
    Changed;
  end;
end;

procedure TcxCustomTimeEditProperties.SetShowDate(Value: Boolean);
begin
  if Value <> FShowDate then
  begin
    FShowDate := Value;
    Changed;
  end;
end;

procedure TcxCustomTimeEditProperties.SetTimeFormat(Value: TcxTimeEditTimeFormat);
begin
  if FTimeFormat <> Value then
  begin
    FTimeFormat := Value;
    UpdateEditMask;
    Changed;
  end;
end;

{ TcxCustomTimeEdit }

class function TcxCustomTimeEdit.GetPropertiesClass: TcxCustomEditPropertiesClass;
begin
  Result := TcxTimeEditProperties;
end;

function TcxCustomTimeEdit.Increment(AButton: TcxSpinEditButton): Boolean;
var
  ACursorPosition: Integer;
  ASelStart, ASelLength: Integer;
begin
  if HandleAllocated then
  begin
    ASelStart := SelStart;
    if SelLength > 0 then
      Inc(ASelStart, SelLength);
    if EditingPlace = 'A' then
    begin
      ACursorPosition := (3 - Integer(Properties.TimeFormat)) * 3;
      while IsSpace(DisplayValue[ACursorPosition]) do
        Inc(ACursorPosition);
      ASelLength := Length(DisplayValue) - ACursorPosition + 1;
      Dec(ACursorPosition);
    end else
    begin
      ASelLength := 1;
      case ASelStart of
        0..2:
          ACursorPosition := 1;
        3..5:
          ACursorPosition := 4;
        else
          ACursorPosition := 7;
      end;
    end;
    SetSelection(ACursorPosition, ASelLength);
  end;
  Result := inherited Increment(AButton);
end;

procedure TcxCustomTimeEdit.PrepareEditValue(const ADisplayValue: TcxEditValue;
  out EditValue: TcxEditValue; AEditFocused: Boolean);
var
  ATimeStringLength: Integer;
  AText: TCaption;
  AValue: Double;
begin
  AText := ADisplayValue;
  ATimeStringLength := (3 - Integer(Properties.TimeFormat)) * 3 - 1;
  if not Properties.Use24HourFormat then
    AText := Copy(AText, 1, ATimeStringLength);
  if Length(AText) = 2 then
    AText := AText + ':00'; // delphi bag
  if not Properties.Use24HourFormat then
    AText := AText + Copy(ADisplayValue, ATimeStringLength + 1,
      Length(ADisplayValue) - ATimeStringLength);
  AValue := 0;
  try
    try
      if AText <> '' then
        AValue := StrToTime(AText);
    except
      AValue := 0;
    end
  finally
    AValue := FSavedDate + AValue * Sign(FSavedDate);
    EditValue := AValue;
  end;
  if EditValue <> 0 then
    EditValue := VarAsType(EditValue, varDate);
end;

procedure TcxCustomTimeEdit.DoEditKeyDown(var Key: Word; Shift: TShiftState);
var
  I: Integer;
begin
  if ((Key = 8) or (Key = VK_DELETE)) and (EditingPlace = 'A') then
    if Key = 8 then
    begin
      I := (3 - Integer(Properties.TimeFormat)) * 3;
      while IsSpace(DisplayValue[I]) do
        Inc(I);
      if SelStart <> I - 1 then
      begin
        Key := VK_LEFT;
        FBackSpaceProcessing := True;
      end;
    end
    else
    begin
      DoAfterKeyDown(Key, Shift);
      Key := 0;
    end;
  if Key <> 0 then
    inherited DoEditKeyDown(Key, Shift);
end;

procedure TcxCustomTimeEdit.DoEditKeyPress(var Key: Char);
begin
  if FBackSpaceProcessing and (Key = #8) then
  begin
    Key := #0;
    FBackSpaceProcessing := False;
  end
  else
    inherited DoEditKeyPress(Key);
end;

function TcxCustomTimeEdit.ExtendValueUpToBound: Boolean;
begin
  Result := False;
end;

function TcxCustomTimeEdit.GetIncrement(AButton: TcxSpinEditButton): Double;
var
  AEditingPlace: Char;
  AIsForwardDirection: Boolean;
begin
  Result := 0;
  AIsForwardDirection := AButton in [sebForward, sebFastForward];
  AEditingPlace := EditingPlace;
  case AEditingPlace of
    'A':
      begin
        Result := cxTimeEditHalfDayIncrement;
        if AIsForwardDirection and (Time >= 0.5) or not AIsForwardDirection and (Time < 0.5) then
          Result := -Result;
      end;
    'H': Result := cxTimeEditOneHourIncrement;
    'N': Result := cxTimeEditOneMinIncrement;
    'S': Result := cxTimeEditOneSecIncrement;
  end;
  if (AEditingPlace in ['N', 'S']) and (AButton in [sebFastBackward, sebFastForward]) then
    Result := Result * 10;
  if not AIsForwardDirection then
    Result := -Result;
  with Properties do
    if MinValue <> MaxValue then
    begin
      if not AIsForwardDirection and (DisplayValue = FormatDateTime(cxTimeEditFormats[TimeFormat, Properties.Use24HourFormat, 0],
          MinValue - Result)) then
        Result := MinValue - Value
      else
        if AIsForwardDirection and (DisplayValue = FormatDateTime(cxTimeEditFormats[TimeFormat, Properties.Use24HourFormat, 0],
          MaxValue - Result)) then
        Result := MaxValue - Value
    end;
end;

function TcxCustomTimeEdit.GetValue: Variant;
begin
  Result := Time;
end;

function TcxCustomTimeEdit.InternalGetText: TCaption;
begin
  Result := DisplayValue;
end;

procedure TcxCustomTimeEdit.InternalSetDisplayValue(const Value: TcxEditValue);
begin
  if Properties.Use24HourFormat or (VarToStr(Value) <> '') then
    inherited InternalSetDisplayValue(Value)
  else
    InnerTextEdit.EditValue := Value;
end;

procedure TcxCustomTimeEdit.InternalSetEditValue(const Value: TcxEditValue;
  AValidateEditValue: Boolean);
var
  AValue: TcxEditValue;
  AIsEditValueValid: Boolean;
begin
  AValue := Value;
  AIsEditValueValid := not AValidateEditValue or Properties.IsEditValueValid(AValue, InternalFocused);
  if VarIsNull(Value) or not AIsEditValueValid then
    FSavedDate := 0
  else
    if VarIsStr(AValue) then
      FSavedDate := DateOf(StrToDateTime(Value))
    else
      FSavedDate := DateOf(Value);
  inherited InternalSetEditValue(Value, AValidateEditValue);
end;

function TcxCustomTimeEdit.InternalSetText(const Value: TCaption): Boolean;
begin
  Result := SetDisplayText(Value);
end;

function TcxCustomTimeEdit.IsValidChar(AChar: Char): Boolean;
var
  S: string;
  AHour: Integer;
begin
  Result := True;
  case EditingPlace of
    'A':
      Result := not(AChar in [#32 .. #255]);
    'H':
      begin
        Result := AChar in ['0' .. '9'];
        if Result then
        begin
          S := Copy(DisplayValue, 1, 2);
          S[SelStart + 1] := AChar;
          AHour := StrToInt(S);
          with Properties do
            Result := not Use24HourFormat and (AHour > 0) and (AHour < 13) or
              Use24HourFormat and (AHour < 24);
        end;
      end;
    'N': if (SelStart = 3) and not (AChar in ['0'..'5']) then
      Result := False;
    'S': if (SelStart = 6) and not (AChar in ['0'..'5']) then
      Result := False;
  end;
  if (AChar = Char(#8)) or (AChar = Char(VK_DELETE)) then
    Result := True;
end;

procedure TcxCustomTimeEdit.PropertiesChanged(Sender: TObject);
begin
  if not Focused then
    TcxEditDataBindingAccess(DataBinding).UpdateDisplayValue;
  SelStart := Length(DisplayValue);
  inherited PropertiesChanged(Sender);
end;

procedure TcxCustomTimeEdit.SetValue(const Value: Variant);
begin
  Time := Value;
end;

function TcxCustomTimeEdit.EditingPlace: Char;
var
  ATimeStringLength: Integer;
  S: string;
  Pos: Integer;
begin
  ATimeStringLength := (3 - Integer(Properties.TimeFormat)) * 3 - 1;
  Pos := SelStart + SelLength;
  with Properties do
    if (MaxLength > 0) and (Pos > MaxLength) then
      Pos := MaxLength;
  if Pos > ATimeStringLength then
  begin
    Result := 'A';
    Exit;
  end;
  S := UpperCase(cxTimeEditFormats[Properties.TimeFormat, Properties.Use24HourFormat, 0]);
  Result := S[Pos];
  if not (Result in ['H', 'N', 'S']) then
  begin
    Dec(Pos);
    if Pos < 1 then Pos := 1;
    Result := S[Pos];
  end;
end;

function TcxCustomTimeEdit.GetProperties: TcxTimeEditProperties;
begin
  Result := TcxTimeEditProperties(InternalGetProperties);
end;

function TcxCustomTimeEdit.GetTime: TTime;
var
  AValue: TcxEditValue;
begin
  Result := SysUtils.Now;
  try
    if Focused then
    begin
      PrepareEditValue(DisplayValue, AValue, True);
      Result := AValue;
    end
    else
      if VarIsStr(EditValue) then
        Result := StrToDateTime(EditValue)
      else
        Result := EditValue;
  finally
    Result := Abs(Frac(Result));
  end;
end;

procedure TcxCustomTimeEdit.SetProperties(Value: TcxTimeEditProperties);
begin
  FProperties.Assign(Value);
end;

procedure TcxCustomTimeEdit.SetTime(Value: TTime);
begin
  EditValue := VarToDateTime(Abs(Frac(Value)) * Sign(FSavedDate) + FSavedDate);
end;

initialization
  cxTimeEditHalfDayIncrement := EncodeTime(12, 0, 0, 0);
  cxTimeEditOneHourIncrement := EncodeTime(1, 0, 0, 0);
  cxTimeEditOneMinIncrement := EncodeTime(0, 1, 0, 0);
  cxTimeEditOneSecIncrement := EncodeTime(0, 0, 1, 0);
  FTimeEditFormatListener := TcxTimeEditFormatListener.Create(nil);

  GetRegisteredEditProperties.Register(TcxTimeEditProperties, scxSEditRepositoryTimeItem);

finalization
  FreeAndNil(FTimeEditFormatListener);

end.
