
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

unit cxEditPaintUtils;

{$I cxEdVer.inc}

interface

uses
{$IFDEF WIN32}
  Windows, Messages,
{$ENDIF}
{$IFNDEF VCL}
  Qt,
{$ENDIF}
  Classes, Controls, Graphics, SysUtils, cxClasses, cxControls, cxGraphics;

const
  cxSolidBrushCacheDefaultMaxDepth = 128;

type
  { TcxSystemPaletteChangedNotifier }

  TcxSystemPaletteChangedEvent = procedure of object;

  TcxSystemPaletteChangedNotifier = class
  private
    FOnSystemPaletteChanged: TcxSystemPaletteChangedEvent;
  public
    constructor Create;
    destructor Destroy; override;
    property OnSystemPaletteChanged: TcxSystemPaletteChangedEvent
      read FOnSystemPaletteChanged write FOnSystemPaletteChanged;
  end;

  { TcxSolidBrushCache }

  TcxSolidBrushCache = class
  private
    FBrushColors: array of TColor;
    FBrushes: array of TBrushHandle;
    FCounts: array of Cardinal;
    FDepth: Integer;
    FMaxDepth: Integer;
    FSystemPaletteChangedNotifier: TcxSystemPaletteChangedNotifier;
  protected
    procedure SystemPaletteChanged; virtual;
  public
    constructor Create; overload;
    constructor Create(AMaxDepth: Integer); overload;
    destructor Destroy; override;
    procedure Clear;
    function GetBrush(ABrushColor: TColor): TBrushHandle;
  end;

function GetSolidBrush(ABrushColor: TColor): TBrushHandle; overload;
function GetSolidBrush(ACanvas: TCanvas; ABrushColor: TColor): TBrushHandle; overload;
function GetSolidBrush(ACanvas: TcxCanvas; ABrushColor: TColor): TBrushHandle; overload;
procedure ResetSolidBrushCache;

implementation

uses
  Forms;

{$IFDEF VCL}
const
  cxSysColorPrefix: Cardinal = {$IFDEF DELPHI7}clSystemColor{$ELSE}$80000000{$ENDIF};
{$ENDIF}

var
  FSolidBrushCache: TcxSolidBrushCache = nil;
  FSystemBrushes: array of TBrushHandle;

function GetSolidBrush(ABrushColor: TColor): TBrushHandle;
begin
  Result := FSolidBrushCache.GetBrush(ABrushColor);
end;

function GetSolidBrush(ACanvas: TCanvas; ABrushColor: TColor): TBrushHandle;
begin
  Result := FSolidBrushCache.GetBrush(ABrushColor);
end;

function GetSolidBrush(ACanvas: TcxCanvas; ABrushColor: TColor): TBrushHandle;
begin
  Result := FSolidBrushCache.GetBrush(ABrushColor);
end;

procedure ResetSolidBrushCache;
begin
  FSolidBrushCache.Clear;
end;

{$IFDEF VCL}
procedure CreateSystemBrushes;
var
  I: Word;
begin
  SetLength(FSystemBrushes, COLOR_ENDCOLORS - COLOR_SCROLLBAR + 1);
  for I := COLOR_SCROLLBAR to COLOR_ENDCOLORS do
    FSystemBrushes[I] := GetSysColorBrush(I);
end;

procedure DestroySystemBrushes;
begin
  FSystemBrushes := nil;
end;
{$ELSE}
procedure CreateSystemBrushes;
var
  AColor: QColorH;
  I: Word;
begin
  Exit;
  SetLength(FSystemBrushes, -clFirstSpecialColor);
  for I := 0 to -clFirstSpecialColor - 1 do
  begin
    AColor := QColor(-I - 1);
    FSystemBrushes[I] := QBrush_create(AColor, BrushStyle_SolidPattern);
    QColor_destroy(AColor);
  end;
end;

procedure DestroySystemBrushes;
var
  I: Integer;
begin
  Exit;
  try
    for I := 0 to -clFirstSpecialColor - 1 do
      QBrush_destroy(FSystemBrushes[I]);
  finally
    FSystemBrushes := nil;
  end;
end;
{$ENDIF}

type
  { TcxSystemPaletteChangedListener }

  TcxSystemPaletteChangedListener = class
  private
    FNotifierList: TList;
    FWindowHandle: TcxHandle;
{$IFDEF LINUX}
    FWidgetHook: QWidget_hookH;
{$ENDIF}
    procedure DoChange;
{$IFDEF VCL}
    procedure WndProc(var Msg: TMessage);
{$ELSE}
  {$IFDEF LINUX}
    function WidgetEventFilter(Sender: QObjectH; Event: QEventH): Boolean; cdecl;
  {$ENDIF}
{$ENDIF}
  public
    constructor Create;
    destructor Destroy; override;
    procedure AddNotifier(ANotifier: TcxSystemPaletteChangedNotifier);
    procedure RemoveNotifier(ANotifier: TcxSystemPaletteChangedNotifier);
  end;

var
  FSystemPaletteChangedListener: TcxSystemPaletteChangedListener;
{$IFNDEF VCL}
  {$IFDEF WIN32}
  FApplicationCallWndProcHook: HHOOK = 0;
  {$ENDIF}
{$ENDIF}

{ TcxSystemPaletteChangedListener }

{$IFNDEF VCL}
  {$IFDEF WIN32}
function ApplicationCallWndProcHookProc(Code: Integer; WParam,
  LParam: Longint): Longint stdcall;
begin
  try
    with PCWPStruct(LParam)^ do
      if (message = WM_SYSCOLORCHANGE) and (hwnd = QWidget_winId(FSystemPaletteChangedListener.FWindowHandle)) then
        FSystemPaletteChangedListener.DoChange;
  finally
    Result := CallNextHookEx(FApplicationCallWndProcHook, Code, WParam, LParam);
  end;
end;
  {$ENDIF}
{$ENDIF}

{$IFDEF VCL}
constructor TcxSystemPaletteChangedListener.Create;
begin
  inherited Create;
  {$IFDEF DELPHI6}
  FWindowHandle := Classes.AllocateHWnd(WndProc);
  {$ELSE}
  FWindowHandle := Forms.AllocateHWnd(WndProc);
  {$ENDIF}
  FNotifierList := TList.Create;
end;
{$ELSE}
  {$IFDEF WIN32}
constructor TcxSystemPaletteChangedListener.Create;
begin
  inherited Create;
  FWindowHandle := QWidget_create(nil, '', 0);
  FApplicationCallWndProcHook := SetWindowsHookEx(WH_CALLWNDPROC,
    @ApplicationCallWndProcHookProc, 0, GetCurrentThreadID);
  FNotifierList := TList.Create;
end;
  {$ENDIF}
  {$IFDEF LINUX}
constructor TcxSystemPaletteChangedListener.Create;
var
  AMethod: TMethod;
begin
  inherited Create;
  FWindowHandle := QWidget_create(nil, '', 0);
  FWidgetHook := QWidget_hook_create(FWindowHandle);
  TEventFilterMethod(AMethod) := WidgetEventFilter;
  Qt_hook_hook_events(FWidgetHook, AMethod);
  FNotifierList := TList.Create;
end;
  {$ENDIF}
{$ENDIF}

destructor TcxSystemPaletteChangedListener.Destroy;
begin
  FreeAndNil(FNotifierList);
{$IFDEF VCL}
  {$IFDEF DELPHI6}
  Classes.DeallocateHWnd(FWindowHandle);
  {$ELSE}
  Forms.DeallocateHWnd(FWindowHandle);
  {$ENDIF}
{$ELSE}
  {$IFDEF WIN32}
  if FApplicationCallWndProcHook <> 0 then
    UnhookWindowsHookEx(FApplicationCallWndProcHook);
  FApplicationCallWndProcHook := 0;
  QWidget_destroy(FWindowHandle);
  {$ENDIF}
  {$IFDEF LINUX}
  QWidget_hook_destroy(FWidgetHook);
  QWidget_destroy(FWindowHandle);
  {$ENDIF}
{$ENDIF}
  inherited Destroy;
end;

procedure TcxSystemPaletteChangedListener.AddNotifier(ANotifier: TcxSystemPaletteChangedNotifier);
begin
  if FNotifierList <> nil then
    FNotifierList.Add(ANotifier);
end;

procedure TcxSystemPaletteChangedListener.RemoveNotifier(ANotifier: TcxSystemPaletteChangedNotifier);
begin
  if FNotifierList <> nil then
    FNotifierList.Remove(ANotifier);
end;

procedure TcxSystemPaletteChangedListener.DoChange;
var
  I: Integer;
begin
  try
{$IFNDEF VCL}
    DestroySystemBrushes;
    CreateSystemBrushes;
{$ENDIF}
  finally
    for I := 0 to FNotifierList.Count - 1 do
      with TcxSystemPaletteChangedNotifier(FNotifierList[I]) do
        if Assigned(FOnSystemPaletteChanged) then
          FOnSystemPaletteChanged;
  end;
end;

{$IFDEF VCL}
procedure TcxSystemPaletteChangedListener.WndProc(var Msg: TMessage);
begin
  with Msg do
    try
      if Msg = WM_SYSCOLORCHANGE then
        DoChange;
    finally
      Result := DefWindowProc(FWindowHandle, Msg, wParam, lParam);
    end;
end;
{$ELSE}
  {$IFDEF LINUX}
function TcxSystemPaletteChangedListener.WidgetEventFilter(Sender: QObjectH;
  Event: QEventH): Boolean; cdecl;
begin
  Result := False;
  if QEvent_type(Event) = QEventType_ApplicationPaletteChange then
    DoChange;
end;
  {$ENDIF}
{$ENDIF}

{ TcxSystemPaletteChangedNotifier }

constructor TcxSystemPaletteChangedNotifier.Create;
begin
  if FSystemPaletteChangedListener <> nil then
    FSystemPaletteChangedListener.AddNotifier(Self);
end;

destructor TcxSystemPaletteChangedNotifier.Destroy;
begin
  if FSystemPaletteChangedListener <> nil then
    FSystemPaletteChangedListener.RemoveNotifier(Self);
end;

{ TcxSolidBrushCache }

constructor TcxSolidBrushCache.Create;
begin
  Create(cxSolidBrushCacheDefaultMaxDepth);
end;

constructor TcxSolidBrushCache.Create(AMaxDepth: Integer);
begin
  inherited Create;
  FMaxDepth := AMaxDepth;
  SetLength(FBrushColors, FMaxDepth);
  SetLength(FBrushes, FMaxDepth);
  SetLength(FCounts, FMaxDepth);
  FSystemPaletteChangedNotifier := TcxSystemPaletteChangedNotifier.Create;
  FSystemPaletteChangedNotifier.OnSystemPaletteChanged := SystemPaletteChanged;
end;

destructor TcxSolidBrushCache.Destroy;
begin
  FreeAndNil(FSystemPaletteChangedNotifier);
  Clear;
  FBrushColors := nil;
  FBrushes := nil;
  FCounts := nil;
  inherited Destroy;
end;

procedure TcxSolidBrushCache.Clear;
var
  I: Integer;
begin
  for I := 0 to FDepth - 1 do
{$IFDEF VCL}
    DeleteObject(FBrushes[I]);
{$ELSE}
    QBrush_destroy(FBrushes[I]);
{$ENDIF}
  FDepth := 0;
end;

function TcxSolidBrushCache.GetBrush(ABrushColor: TColor): TBrushHandle;

  function GetColorIndex(AColor: TColor; var AIndex: Integer): Boolean; assembler;
  var
    ADepth: Integer;
    APBrushColors, APIndex: ^Integer;
  begin
    ADepth := FDepth;
    APBrushColors := @FBrushColors[0];
    APIndex := @AIndex;
    asm
          push  ebx
          push  edi
          push  esi

          mov   edi, ADepth
          or    edi, edi
          jne   @@0
          mov   eax, edi
          jmp   @@5
    @@0:
          mov   ebx, APBrushColors
          mov   edx, AColor
          mov   esi, ebx
          dec   edi
          shl   edi, 2
          add   esi, edi
          jmp   @@3
    @@1:
          mov   edi, ebx
          add   edi, esi
          shr   edi, 1
          and   di, $FFFC
          cmp   edx, [edi]
          je    @@4
          ja    @@2
          mov   esi, edi
          sub   edi, ebx
          jmp   @@3
    @@2:
          mov   ebx, edi
          sub   edi, esi
          neg   edi
    @@3:
          cmp   edi, 4
          ja    @@1
          mov   edi, ebx
          cmp   edx, [edi]
          jbe   @@4
          mov   edi, esi
          cmp   edx, [edi]
          jbe   @@4
          add   edi, 4
    @@4:
          mov   eax, edi
          sub   eax, APBrushColors
          shr   eax, 2
    @@5:
          mov   ebx, APIndex
          mov   [ebx], eax
          cmp   eax, ADepth
          jae   @@6
          shl   eax, 2
          add   eax, APBrushColors
          cmp   [eax], edx
          jne   @@6
          xor   al, al
          inc   al
          jmp   @@7
    @@6:
          xor   al, al
    @@7:
          pop   esi
          pop   edi
          pop   ebx
          mov   Result, al
    end;
  end;

  function GetRarestColorIndex: Integer;
  var
    ADepth: Integer;
    APCounts: ^Integer;
  begin
    ADepth := FDepth;
    APCounts := @FCounts[0];
    asm
          push  ebx
          push  esi

          mov   ebx, APCounts
          mov   eax, [ebx]
          mov   ecx, ADepth
          mov   edx, ebx
    @@0:
          dec   ecx
          jz    @@1
          add   ebx, 4
          mov   esi, [ebx]
          cmp   eax, esi
          jbe   @@0
          mov   eax, esi
          mov   edx, ebx
          jmp   @@0
    @@1:
          sub   edx, APCounts
          shr   edx, 2
          mov   Result, edx

          pop   esi
          pop   ebx
    end;
  end;

  function PrepareNewItem(AIndex: Integer): TBrushHandle;
  var
    ACount, ARarestColorIndex: Integer;
{$IFNDEF VCL}
    AColor: QColorH;
{$ENDIF}
  begin
    if FDepth = FMaxDepth then
    begin
      ARarestColorIndex := GetRarestColorIndex;
{$IFDEF VCL}
      DeleteObject(FBrushes[ARarestColorIndex]);
{$ELSE}
      QBrush_destroy(QBrushH(FBrushes[ARarestColorIndex]));
{$ENDIF}
      Dec(FDepth);
      if ARarestColorIndex < FDepth then
      begin
        ACount := (FDepth - ARarestColorIndex) shl 2;
        Move(FBrushColors[ARarestColorIndex + 1], FBrushColors[ARarestColorIndex], ACount);
        Move(FBrushes[ARarestColorIndex + 1], FBrushes[ARarestColorIndex], ACount);
        Move(FCounts[ARarestColorIndex + 1], FCounts[ARarestColorIndex], ACount);
      end;
      if AIndex > ARarestColorIndex then
        Dec(AIndex);
    end;
    if AIndex < FDepth then
    begin
      ACount := (FDepth - AIndex) shl 2;
      Move(FBrushColors[AIndex], FBrushColors[AIndex + 1], ACount);
      Move(FBrushes[AIndex], FBrushes[AIndex + 1], ACount);
      Move(FCounts[AIndex], FCounts[AIndex + 1], ACount);
    end;
    Inc(FDepth);
{$IFDEF VCL}
    Result := CreateSolidBrush(ColorToRGB(ABrushColor));
{$ELSE}
    AColor := QColor(ABrushColor);
    Result := QBrush_create(AColor, BrushStyle_SolidPattern);
    QColor_destroy(AColor);
{$ENDIF}
    FBrushColors[AIndex] := ABrushColor;
    FBrushes[AIndex] := Result;
    FCounts[AIndex] := 0;
  end;

var
  AColorIndex: Integer;
begin
{$IFDEF VCL}
  if FSystemBrushes <> nil then
    if (Cardinal(ABrushColor) >= cxSysColorPrefix) and (Cardinal(ABrushColor) <= cxSysColorPrefix or COLOR_ENDCOLORS) then
    begin
      Result := FSystemBrushes[ABrushColor and not cxSysColorPrefix];
      Exit;
    end;
{$ELSE}
  (*if FSystemBrushes <> nil then
    if (ABrushColor < 0) and (ABrushColor >= clFirstSpecialColor) then
    begin
      Result := FSystemBrushes[-ABrushColor + 1];
      Exit;
    end;*)
{$ENDIF}
  if GetColorIndex(ABrushColor, AColorIndex) then
  begin
    Inc(FCounts[AColorIndex]);
    Result := FBrushes[AColorIndex];
  end
  else
    Result := PrepareNewItem(AColorIndex);
end;

procedure TcxSolidBrushCache.SystemPaletteChanged;
begin
  Clear;
end;

initialization
  FSystemPaletteChangedListener := TcxSystemPaletteChangedListener.Create;
  CreateSystemBrushes;
  FSolidBrushCache := TcxSolidBrushCache.Create;

finalization
  FreeAndNil(FSolidBrushCache);
  DestroySystemBrushes;
  FreeAndNil(FSystemPaletteChangedListener);

end.
