
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

unit cxFormats;

{$I cxEdVer.inc}

interface

uses
{$IFDEF VCL}
  Windows, Messages,
{$ENDIF}
  Classes;

type
  IcxFormatContollerListener = interface
    ['{A7F2F6D3-1A7D-4295-A6E6-9297BD83D0DE}']
    procedure FormatChanged;
  end;

  TDayOfWeek = 0..6;

  TcxFormatController = class
  private
    FCurrencyFormat: string;
    FDateEditFormat: string;
    FDateEditMask: string;
    FList: TList;
    FLockCount: Integer;
    FMaskedDateEditFormat: string;
    FRegExprDateEditMask: string;
    FStandardDateEditMask: string;
    FStartOfWeek: TDayOfWeek;
    FUseDelphiDateTimeFormats: Boolean;
    function GetCurrencyFormat: string;
    function GetDateEditFormat(AIsMasked: Boolean): string;
    function GetDateEditMask: string;
    function GetStartOfWeek: TDayOfWeek;
    procedure SetCurrencyFormat(const Value: string);
    procedure SetRegExprDateEditMask(const Value: string);
    procedure SetStandardDateEditMask(const Value: string);
    procedure SetStartOfWeek(const Value: TDayOfWeek);
    procedure SetUseDelphiDateTimeFormats(const Value: Boolean);
  protected
{$IFDEF VCL}
    FWindow: HWND;
    procedure MainWndProc(var Message: TMessage);
    procedure WndProc(var Message: TMessage); virtual;
{$ENDIF}
    procedure FormatChanged;
  public
    constructor Create;
    destructor Destroy; override;
    procedure AddListener(AListener: IcxFormatContollerListener); virtual;
    procedure BeginUpdate;
    procedure EndUpdate;
    procedure GetFormats;
    procedure NotifyListeners;
    procedure RemoveListener(AListener: IcxFormatContollerListener); virtual;
    property CurrencyFormat: string read FCurrencyFormat write SetCurrencyFormat;
    property DateEditFormat: string read FDateEditFormat;
    property DateEditMask: string read FDateEditMask;
    property MaskedDateEditFormat: string read FMaskedDateEditFormat;
    property RegExprDateEditMask: string read FRegExprDateEditMask write SetRegExprDateEditMask;
    property StandardDateEditMask: string read FStandardDateEditMask write SetStandardDateEditMask;
    property StartOfWeek: TDayOfWeek read FStartOfWeek write SetStartOfWeek;
    property UseDelphiDateTimeFormats: Boolean read FUseDelphiDateTimeFormats write SetUseDelphiDateTimeFormats;
  end;

function cxFormatController: TcxFormatController;

implementation

uses
  SysUtils, cxDateUtils, Forms;

var
  FcxFormatController: TcxFormatController;

{ TcxFormatController }

constructor TcxFormatController.Create;
begin
  FList := TList.Create;
  FUseDelphiDateTimeFormats := False;
  GetFormats;
end;

destructor TcxFormatController.Destroy;
begin
  FList.Free;
  inherited Destroy;
end;

function TcxFormatController.GetCurrencyFormat: string;
var
  CurrStr: string;
  I: Integer;
  C: Char;
begin
  if CurrencyDecimals > 0 then
  begin
    SetLength(Result, CurrencyDecimals);
    FillChar(Result[1], Length(Result), '0');
  end
  else
    Result := '';
  Result := ',0.' + Result;
  CurrStr := '';
  for I := 1 to Length(CurrencyString) do
  begin
    C := CurrencyString[I];
    if C in [',', '.'] then
      CurrStr := CurrStr + '''' + C + ''''
    else
      CurrStr := CurrStr + C;
  end;
  if Length(CurrStr) > 0 then
    case Sysutils.CurrencyFormat of
      0: Result := CurrStr + Result; { '$1' }
      1: Result := Result + CurrStr; { '1$' }
      2: Result := CurrStr + ' ' + Result; { '$ 1' }
      3: Result := Result + ' ' + CurrStr; { '1 $' }
    end;
  Result := Format('%s;-%s', [Result, Result]);
end;

function TcxFormatController.GetDateEditFormat(AIsMasked: Boolean): string;

  procedure CorrectForMaskEdit(var S: string);
  var
    APos, AStartPos: Integer;
  begin
    APos := Pos('M', S);
    if APos <> 0 then
    begin
      AStartPos := APos;
      while APos <= Length(S) do
        if S[APos] = 'M' then
          Inc(APos)
        else
          Break;
      if APos - AStartPos > 3 then
        Delete(S, AStartPos + 3, APos - AStartPos - 3);
    end;
  end;

var
  Format: string;
  I: Integer;
  ExistFirst: Boolean;
begin
  Format := ShortDateFormat;
  Result := '';
  for I := 1 to Length(Format) do
  begin
    if (Format[I] = 'd') then
    begin
      ExistFirst := True;
      if (1 < I) and (Format[I - 1] = 'd') then ExistFirst := False;
      if (I < Length(Format)) and (Format[I + 1] = 'd') then ExistFirst := False;
      if ExistFirst then Result := Result + 'd';
    end;
    if (Format[I] = 'M') then
    begin
      ExistFirst := True;
      if (1 < I) and (Format[I - 1] = 'M') then ExistFirst := False;
      if (I < Length(Format)) and (Format[I + 1] = 'M') then ExistFirst := False;
      if ExistFirst then Result := Result + 'M';
    end;
    Result := Result + Format[I];
  end;
  if AIsMasked then CorrectForMaskEdit(Result);
end;

function TcxFormatController.GetStartOfWeek: TDayOfWeek;
var
  I: Integer;
begin
  {$IFDEF DELPHI6}
    {$IFDEF MSWINDOWS}
      {$WARN SYMBOL_PLATFORM OFF}
    {$ENDIF}
  {$ENDIF}
  {$IFDEF VCL}
  I := StrToInt(GetLocaleStr(GetThreadLocale, LOCALE_IFIRSTDAYOFWEEK, '0')) + 1;
  {$ELSE}
  I := 0;
  {$ENDIF}

  {$IFDEF DELPHI6}
    {$IFDEF MSWINDOWS}
      {$WARN SYMBOL_PLATFORM ON}
    {$ENDIF}
  {$ENDIF}
  if I > 6 then I := 0;
  Result := I
end;

function TcxFormatController.GetDateEditMask: string;
var
  Format, S: string;
  I, J: Integer;
begin
  Format := ShortDateFormat;
  if Pos('g', Format) > 0 then
  begin
    Result := '';
    Exit;
  end;
  Result := '!';
  I := 1;
  while I <= Length(Format) do
  begin
    if Format[I] in ['d', 'e', 'M', 'y'] then
    begin
      for J := I to Length(Format) do
        if Format[J] <> Format[I] then Break;
      if J - I < 3 then S := '99'
      else
        case Format[I] of
          'y': S := '9999';
          'e': S := '99';
          else S := 'lll';
        end;
      I := J - 1;
    end
    else S := Format[I];
    Result := Result + S;
    Inc(I);
  end;
  Result := Result + ';1; ';
end;

procedure TcxFormatController.AddListener(
  AListener: IcxFormatContollerListener);
begin
  with FList do
    if IndexOf(Pointer(AListener)) = -1 then
    begin
    {$IFDEF VCL}
      if Count = 0 then
      {$IFDEF DELPHI6}
        FWindow := Classes.AllocateHWnd(MainWndProc);
      {$ELSE}
        FWindow := Forms.AllocateHWnd(MainWndProc);
      {$ENDIF}
    {$ENDIF}
      Add(Pointer(AListener));
    end;
end;

procedure TcxFormatController.RemoveListener(
  AListener: IcxFormatContollerListener);
begin
  FList.Remove(Pointer(AListener));
{$IFDEF VCL}
  if FList.Count = 0 then
  {$IFDEF DELPHI6}
    Classes.DeallocateHWnd(FWindow);
  {$ELSE}
    Forms.DeallocateHWnd(FWindow);
  {$ENDIF}
{$ENDIF}
end;

procedure TcxFormatController.GetFormats;
begin
  if FcxFormatController = nil then // for avoid stack overflow
    FcxFormatController := Self;
  FCurrencyFormat := GetCurrencyFormat;
  FStartOfWeek := GetStartOfWeek;
  FStandardDateEditMask := GetDateEditMask;
  FDateEditMask := GetDateEditMask;
  FDateEditFormat := GetDateEditFormat(False);
  FMaskedDateEditFormat := GetDateEditFormat(True);
  FRegExprDateEditMask := GetDateRegularExpession(DateEditFormat, True);
end;

procedure TcxFormatController.NotifyListeners;
var
  I: Integer;
begin
  for I := 0 to FList.Count - 1 do
    IcxFormatContollerListener(FList[I]).FormatChanged;
end;

{$IFDEF VCL}

procedure TcxFormatController.MainWndProc(var Message: TMessage);
begin
  try
    WndProc(Message);
  except
    Application.HandleException(Self);
  end;
end;

procedure TcxFormatController.WndProc(var Message: TMessage);
begin
  if (Message.Msg = WM_SETTINGCHANGE) and
    ((Message.WParam = 0) and (PChar(Message.LParam) = 'intl')) and
    Application.UpdateFormatSettings then
  begin
    SysUtils.GetFormatSettings;
    GetFormats;
    NotifyListeners;
    Message.Result := 0;
    Exit;
  end;
  with Message do Result := DefWindowProc(FWindow, Msg, wParam, lParam);
end;

{$ENDIF}

procedure TcxFormatController.SetCurrencyFormat(const Value: string);
begin
  if FCurrencyFormat <> Value then
  begin
    FCurrencyFormat := Value;
    FormatChanged;
  end;
end;

procedure TcxFormatController.SetRegExprDateEditMask(const Value: string);
begin
  if FRegExprDateEditMask <> Value then
  begin
    FRegExprDateEditMask := Value;
    FormatChanged;
  end;
end;

procedure TcxFormatController.SetStandardDateEditMask(const Value: string);
begin
  if FStandardDateEditMask <> Value then
  begin
    FStandardDateEditMask := Value;
    FormatChanged;
  end;
end;

procedure TcxFormatController.SetStartOfWeek(const Value: TDayOfWeek);
begin
  if FStartOfWeek <> Value then
  begin
    FStartOfWeek := Value;
    FormatChanged;
  end;
end;

procedure TcxFormatController.SetUseDelphiDateTimeFormats(
  const Value: Boolean);
begin
  if FUseDelphiDateTimeFormats <> Value then
  begin
    FUseDelphiDateTimeFormats := Value;
    FormatChanged;
  end;
end;

procedure TcxFormatController.BeginUpdate;
begin
  Inc(FLockCount);
end;

procedure TcxFormatController.EndUpdate;
begin
  Dec(FLockCount);
  if FLockCount = 0 then
    NotifyListeners;
end;

procedure TcxFormatController.FormatChanged;
begin
  if FLockCount = 0 then
  begin
    GetFormats;
    NotifyListeners;
  end;
end;

function cxFormatController: TcxFormatController;
begin
  if FcxFormatController = nil then
    FcxFormatController := TcxFormatController.Create;
  Result := FcxFormatController;
end;

initialization

finalization
  FcxFormatController.Free;
  FcxFormatController := nil;
end.
