
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

unit cxDateUtils;

{$I cxEdVer.inc}

interface

type
  TDay = (dSunday, dMonday, dTuesday, dWednesday, dThursday, dFriday, dSaturday);
  TDays = set of TDay;
  TcxDateElement = (deYear, deMonth, deDay);

const
  NullDate = -700000;
  SmartTextToDateFunc: function (const AText: string; var ADate: TDateTime): Boolean = nil;

procedure DecMonth(var AYear, AMonth: Word);
procedure IncMonth(var AYear, AMonth: Word);
procedure ChangeMonth(var AYear, AMonth: Word; Delta: Integer);
function GetDateElement(ADate: TDateTime; AElement: TcxDateElement): Integer;
function IsLeapYear(AYear: Integer): Boolean;
function DaysPerMonth(AYear, AMonth: Integer): Integer;
function CheckDay(AYear, AMonth, ADay: Integer): Integer;
function DateOf(ADateTime: TDateTime): Integer;
function TimeOf(ADateTime: TDateTime): TDateTime;
function StrToDateDef(const ADateStr: string; ADefDate: TDateTime): TDateTime;
function SmartTextToDate(const AText: string; var ADate: TDateTime): Boolean;
function TextToDateEx(AText: string; var ADate: TDateTime): Boolean;
function DateTimeToText(ADate: TDateTime): string;
function DateTimeToTextEx(const ADate: TDateTime; AIsMasked: Boolean): string;
function GetDateRegularExpession(const ADateFormat: string; AUseSmartInput: Boolean): string;
function DateTextValid(const ADateText: string; AUseOleDateFormat: Boolean;
  out ADate: TDateTime): Boolean;

implementation

uses
{$IFDEF VCL}
  Windows,
{$ENDIF}
{$IFDEF DELPHI6}
  Variants,
{$ENDIF}
  SysUtils, Classes, cxEditConsts, cxClasses, cxFormats;

type
  TcxDateEditSmartInput = (deiToday, deiYesterday, deiTomorrow,
    deiSunday, deiMonday, deiTuesday, deiWednesday, deiThursday, deiFriday, deiSaturday,
    deiFirst, deiSecond, deiThird, deiFourth, deiFifth, deiSixth, deiSeventh,
    deiBOM, deiEOM, deiNow);

var
  scxDateEditSmartInput: array [TcxDateEditSmartInput] of string;

procedure InitSmartInputConsts;
begin
  scxDateEditSmartInput[deiToday] := cxGetResourceString(@cxSDateToday);
  scxDateEditSmartInput[deiYesterday] := cxGetResourceString(@cxSDateYesterday);
  scxDateEditSmartInput[deiTomorrow] := cxGetResourceString(@cxSDateTomorrow);
  scxDateEditSmartInput[deiSunday] := cxGetResourceString(@cxSDateSunday);
  scxDateEditSmartInput[deiMonday] := cxGetResourceString(@cxSDateMonday);
  scxDateEditSmartInput[deiTuesday] := cxGetResourceString(@cxSDateTuesday);
  scxDateEditSmartInput[deiWednesday] := cxGetResourceString(@cxSDateWednesday);
  scxDateEditSmartInput[deiThursday] := cxGetResourceString(@cxSDateThursday);
  scxDateEditSmartInput[deiFriday] := cxGetResourceString(@cxSDateFriday);
  scxDateEditSmartInput[deiSaturday] := cxGetResourceString(@cxSDateSaturday);
  scxDateEditSmartInput[deiFirst] := cxGetResourceString(@cxSDateFirst);
  scxDateEditSmartInput[deiSecond] := cxGetResourceString(@cxSDateSecond);
  scxDateEditSmartInput[deiThird] := cxGetResourceString(@cxSDateThird);
  scxDateEditSmartInput[deiFourth] := cxGetResourceString(@cxSDateFourth);
  scxDateEditSmartInput[deiFifth] := cxGetResourceString(@cxSDateFifth);
  scxDateEditSmartInput[deiSixth] := cxGetResourceString(@cxSDateSixth);
  scxDateEditSmartInput[deiSeventh] := cxGetResourceString(@cxSDateSeventh);
  scxDateEditSmartInput[deiBOM] := cxGetResourceString(@cxSDateBOM);
  scxDateEditSmartInput[deiEOM] := cxGetResourceString(@cxSDateEOM);
  scxDateEditSmartInput[deiNow] := cxGetResourceString(@cxSDateNow);
end;

procedure DecMonth(var AYear, AMonth: Word);
begin
  if AMonth = 1 then
  begin
    Dec(AYear);
    AMonth := 12;
  end
  else Dec(AMonth);
end;

procedure IncMonth(var AYear, AMonth: Word);
begin
  if AMonth = 12 then
  begin
    Inc(AYear);
    AMonth := 1;
  end
  else Inc(AMonth);
end;

procedure ChangeMonth(var AYear, AMonth: Word; Delta: Integer);
var
  Month: Integer;
begin
  Inc(AYear, Delta div 12);
  Month := AMonth;
  Inc(Month, Delta mod 12);
  if Month < 1 then
  begin
    Dec(AYear);
    Month := 12 + Month;
  end;
  if Month > 12 then
  begin
    Inc(AYear);
    Month := Month - 12;
  end;
  AMonth := Month;
end;

function GetDateElement(ADate: TDateTime; AElement: TcxDateElement): Integer;
var
  AYear, AMonth, ADay: Word;
begin
  DecodeDate(ADate, AYear, AMonth, ADay);
  case AElement of
    deYear: Result := AYear;
    deMonth: Result := AMonth;
  else
    {deDay:} Result := ADay; // make compiler happy
  end;
end;

function IsLeapYear(AYear: Integer): Boolean;
begin
  Result := (AYear mod 4 = 0) and ((AYear mod 100 <> 0) or (AYear mod 400 = 0));
end;

function DaysPerMonth(AYear, AMonth: Integer): Integer;
const
  DaysInMonth: array[1..12] of Integer = (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
begin
  Result := DaysInMonth[AMonth];
  if (AMonth = 2) and IsLeapYear(AYear) then Inc(Result);
end;

function CheckDay(AYear, AMonth, ADay: Integer): Integer;
begin
  if ADay < 1 then
    Result := 1
  else
    if ADay > DaysPerMonth(AYear, AMonth) then
      Result := DaysPerMonth(AYear, AMonth)
    else
      Result := ADay;
end;

function DateOf(ADateTime: TDateTime): Integer;
begin
  Result := Trunc(ADateTime + (2 * Byte(ADateTime >= 0) - 1) * 1E-11);
end;

function TimeOf(ADateTime: TDateTime): TDateTime;
var
  Hour, Min, Sec, MSec: Word;
begin
  DecodeTime(ADateTime, Hour, Min, Sec, MSec);
  Result := EncodeTime(Hour, Min, Sec, MSec);
end;

function StrToDateDef(const ADateStr: string; ADefDate: TDateTime): TDateTime;
begin
  try
    Result := StrToDate(ADateStr)
  except
    Result := ADefDate
  end;
end;

function SICompare(List: TStringList; Index1, Index2: Integer): Integer;
var
  S1, S2: string;
begin
  S1 := List[Index1];
  S2 := List[Index2];
  if Length(S1) > Length(S2) then Result := -1
  else if Length(S1) < Length(S2) then Result := 1
  else Result := - AnsiCompareText(S1, S2)
end;

{$IFNDEF DELPHI5}
type
  TStringListSortCompare = function(List: TStringList; Index1, Index2: Integer): Integer;

  TSIStringList = class(TStringList)
  protected
    procedure QuickSortEx(L, R: Integer; SCompare: TStringListSortCompare);
  public
    procedure CustomSort(Compare: TStringListSortCompare);
  end;

procedure TSIStringList.QuickSortEx(L, R: Integer; SCompare: TStringListSortCompare);
var
  I, J, P: Integer;
begin
  repeat
    I := L;
    J := R;
    P := (L + R) shr 1;
    repeat
      while SCompare(Self, I, P) < 0 do Inc(I);
      while SCompare(Self, J, P) > 0 do Dec(J);
      if I <= J then
      begin
        Exchange(I, J);
        if P = I then
          P := J
        else if P = J then
          P := I;
        Inc(I);
        Dec(J);
      end;
    until I > J;
    if L < J then QuickSortEx(L, J, SCompare);
    L := I;
  until I >= R;
end;

procedure TSIStringList.CustomSort(Compare: TStringListSortCompare);
begin
  if not Sorted and (Count > 1) then
  begin
    Changing;
    QuickSortEx(0, Count - 1, Compare);
    Changed;
  end;
end;
{$ENDIF}

function SmartTextToDate(const AText: string; var ADate: TDateTime): Boolean;

  function GetSmartInputKind(const AText: string;
    var Kind: TcxDateEditSmartInput): Boolean;
  var
    I: TcxDateEditSmartInput;
    J: Integer;
    S: string;
  begin
    Result := False;
  {$IFNDEF DELPHI5}
    with TSIStringList.Create do
  {$ELSE}
    with TStringList.Create do
  {$ENDIF}
    try
      for I := Low(TcxDateEditSmartInput) to High(TcxDateEditSmartInput) do
        AddObject(scxDateEditSmartInput[I], Pointer(I));
      CustomSort(SICompare);
      for J := 0 to Count - 1 do
      begin
        S := Strings[J];
        if AnsiCompareText(S, Copy(AText, 1, Length(S))) = 0 then
        begin
          Kind := TcxDateEditSmartInput(Pointer(Objects[J]));
          Result := True;
          break;
        end;
      end;
    finally
      Free;
    end;
  end;

var
  I: TcxDateEditSmartInput;
  L, Delta: Integer;
  S: string;
  Y, M, D: Word;
  
begin
  InitSmartInputConsts;
  Result := False;
  S := Trim(AText);
  if GetSmartInputKind(S, I) then
  begin
    case I of
      deiToday:
        ADate := Date;
      deiYesterday:
        ADate := Date - 1;
      deiTomorrow:
        ADate := Date + 1;
      deiSunday, deiMonday, deiTuesday, deiWednesday, deiThursday, deiFriday, deiSaturday:
        begin
          ADate := Date;
          Delta := Integer(I) - Integer(deiSunday) + 1 - DayOfWeek(ADate);
          if Delta >= 0 then
            ADate := ADate + Delta
          else
            ADate := ADate + 7 + Delta;
        end;
      deiFirst..deiSeventh:
        begin
          ADate := Date;
          Delta := DayOfWeek(ADate) - (Integer(I) - Integer(deiFirst) + 1);
          ADate := ADate - Delta;
        end;
      deiBOM:
        begin
          DecodeDate(Date, Y, M, D);
          ADate := EncodeDate(Y, M, 1);
        end;
      deiEOM:
        begin
          DecodeDate(Date, Y, M, D);
          ADate := EncodeDate(Y, M, MonthDays[IsLeapYear(Y), M]);
        end;
      deiNow:
        ADate := Now;
    end;
    L := Length(scxDateEditSmartInput[I]);
    S := Trim(Copy(AText, L + 1, Length(AText)));
    if (Length(S) >= 2) and (S[1] in ['+', '-']) then
    begin
      if S[1] = '+' then L := 1
      else L := -1;
      S := Trim(Copy(S, 2, Length(S)));
      try
        ADate := ADate + L * StrToInt(S);
      except
        on EConvertError do;
      end;
    end;
    Result := True;
  end;
  if not Result and Assigned(SmartTextToDateFunc) then
    Result := SmartTextToDateFunc(AText, ADate);
end;

function TextToDateEx(AText: string; var ADate: TDateTime): Boolean;
var
  I, C: Integer;
begin
  Result := True;
  try
    AText := Trim(AText);
    if AText = '' then
      Result := False
    else
    begin
      // Replace "." (bug VariantChangeType for LongMonth "MMM")
      if not cxFormatController.UseDelphiDateTimeFormats and (SysUtils.DateSeparator = '.') then
      begin
        C := 0;
        for I := 1 to Length(AText) do
        begin
          if AText[I] = '.' then
          begin
            AText[I] := ' ';
            Inc(C);
          end;
          if C = 2 then Break;
        end;
      end;
      // Smart Date
      if not SmartTextToDate(AText, ADate) then
        if cxFormatController.UseDelphiDateTimeFormats then
          ADate := StrToDateTime(AText)
        else
          ADate := VarToDateTime(AText);
    end;
  except
    on EVariantError do
    begin
      Result := False;
      ADate := NullDate;
    end;
  end;
end;

function DateTimeToText(ADate: TDateTime): string;
{$IFDEF VCL}
var
  SystemTime: TSystemTime;
  PS: PChar;
{$ENDIF}
begin
  if ADate = NullDate then
    Result := ''
  else
    if cxFormatController.UseDelphiDateTimeFormats then
      Result := DateTimeToStr(ADate)
    else
{$IFDEF VCL}
    begin
      DateTimeToSystemTime(ADate, SystemTime);
//      if Pos('yyyy', LowerCase(cxFormatController.DateEditFormat)) = 0 then
//        SystemTime.wYear := SystemTime.wYear mod 100;
      GetMem(PS, 100);
      try
        if GetDateFormat(GetThreadLocale, 0, @SystemTime, nil, PS, 100) <> 0 then
        begin
          Result := PS;
          if TimeOf(ADate) <> 0 then
          begin
            GetTimeFormat(GetThreadLocale, 0, @SystemTime, nil, PS, 100);
            Result := Result + ' ' + PS;
          end;
        end
        else
          try
            Result := VarFromDateTime(ADate);
          except
            on EVariantError do
              Result := '';
          end;
      finally
        FreeMem(PS, 100);
      end;
    end;
{$ELSE}
    try
      Result := VarFromDateTime(ADate);
    except
      on EVariantError do
        Result := '';
    end;
{$ENDIF}
end;

function DateTimeToTextEx(const ADate: TDateTime; AIsMasked: Boolean): string;
begin
  if ADate = NullDate then
    Result := ''
  else
  begin
    if AIsMasked then
      Result := FormatDateTime(cxFormatController.MaskedDateEditFormat, ADate)
    else
      Result := DateTimeToText(ADate);
  end;
end;

function GetDateRegularExpession(const ADateFormat: string; AUseSmartInput: Boolean): string;

  function GetPart(var S: string): Char;
  begin
    Result := #0;
    if S = '' then Exit;
    Result := S[1];
    while (Length(S) > 0) and ((Result = S[1]) or not (S[1] in ['d', 'e', 'm', 'y'])) do
      Delete(S, 1, 1);
  end;

const
  reDayInput = '([012]?[1-9]|[123]0|31)';
  reMonthInput = '(0?[1-9]|1[012])';
  reYearInput = '\d\d';
  reYearInputFour = '\d\d\d\d';
  reYearShortInput = '([1-9]?\d)';

var
  S: string;
  AMonths: string;
  C: Char;
  AFourDigitsOnYear: Boolean;
  AUseLongMonthNames: Boolean;
  ASeparator: string;
  I: TcxDateEditSmartInput;
  J: Integer;
begin
  Result := '';
  S := LowerCase(cxFormatController.DateEditFormat);
  if Pos('g', S) > 0 then
    Exit;
  InitSmartInputConsts;
  AFourDigitsOnYear := Pos('yyyy', S) <> 0;
  AUseLongMonthNames := Pos('mmmm', S) <> 0;
  ASeparator := '''' + DateSeparator + '''';
  repeat
    C := GetPart(S);
    if C = #0 then break;
    case C of
      'd':
        begin
          if Result <> '' then Result := Result + ASeparator;
          Result := Result + reDayInput;
        end;
      'm':
        begin
          if Result <> '' then Result := Result + ASeparator;
          AMonths := '(' + reMonthInput + '|(';
          if AUseLongMonthNames then
            AMonths := AMonths + LongMonthNames[1]
          else
            AMonths := AMonths + ShortMonthNames[1];
          for J := 2 to 12 do
            if AUseLongMonthNames then
              AMonths := AMonths + '|' + LongMonthNames[J]
            else
              AMonths := AMonths + '|' + ShortMonthNames[J];
          AMonths := AMonths + '))';
          Result := Result + AMonths;
        end;
      'y':
        begin
          if Result <> '' then Result := Result + ASeparator;
          if AFourDigitsOnYear then
            Result := Result + reYearInputFour
          else
            Result := Result + reYearInput
        end;
      'e':
        begin
          if Result <> '' then Result := Result + ASeparator;
          if AFourDigitsOnYear then
            Result := Result + reYearInputFour
          else
            if Pos('ee', ShortDateFormat) = 0 then
              Result := Result + reYearShortInput
            else
              Result := Result + reYearInput;
        end;
      else break;
    end;
  until False;
  if AUseSmartInput then
  begin
    Result := '(' + Result + ')|((';
    S := scxDateEditSmartInput[deiToday];
    for I := Succ(deiToday) to deiNow do
      S := S + '|' + scxDateEditSmartInput[I];
    Result := Result + S + ')((\+|-)\d(\d(\d(\d?)?)?)?))';
  end;
end;

function DateTextValid(const ADateText: string; AUseOleDateFormat: Boolean;
  out ADate: TDateTime): Boolean;
begin
  Result := False;
  ADate := NullDate;
  try
    if AUseOleDateFormat then
      ADate := VarToDateTime(ADateText)
    else
      ADate := StrToDate(ADateText);
    Result := True;
  except
    on EConvertError do ADate := NullDate;
  end;
end;

end.



