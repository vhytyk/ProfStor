{*******************************************************************}
{                                                                   }
{       Developer Express Cross Platform Component Library          }
{       ExpressExport                                               }
{                                                                   }
{       Copyright (c) 2001-2003 Developer Express Inc.              }
{       ALL RIGHTS RESERVED                                         }
{                                                                   }
{   The entire contents of this file is protected by U.S. and       }
{   International Copyright Laws. Unauthorized reproduction,        }
{   reverse-engineering, and distribution of all or any portion of  }
{   the code contained in this file is strictly prohibited and may  }
{   result in severe civil and criminal penalties and will be       }
{   prosecuted to the maximum extent possible under the law.        }
{                                                                   }
{   RESTRICTIONS                                                    }
{                                                                   }
{   THIS SOURCE CODE AND ALL RESULTING INTERMEDIATE FILES           }
{   (DCU, OBJ, DLL, ETC.) ARE CONFIDENTIAL AND PROPRIETARY TRADE    }
{   SECRETS OF DEVELOPER EXPRESS INC. THE REGISTERED DEVELOPER IS   }
{   LICENSED TO DISTRIBUTE THE EXPRESSEXPORT AND ALL                }
{   ACCOMPANYING VCL AND CLX CONTROLS AS PART OF AN EXECUTABLE      }
{   PROGRAM ONLY.                                                   }
{                                                                   }
{   THE SOURCE CODE CONTAINED WITHIN THIS FILE AND ALL RELATED      }
{   FILES OR ANY PORTION OF ITS CONTENTS SHALL AT NO TIME BE        }
{   COPIED, TRANSFERRED, SOLD, DISTRIBUTED, OR OTHERWISE MADE       }
{   AVAILABLE TO OTHER INDIVIDUALS WITHOUT EXPRESS WRITTEN CONSENT  }
{   AND PERMISSION FROM DEVELOPER EXPRESS INC.                      }
{                                                                   }
{   CONSULT THE END USER LICENSE AGREEMENT FOR INFORMATION ON       }
{   ADDITIONAL RESTRICTIONS.                                        }
{                                                                   }
{*******************************************************************}

unit cxExport;

{$I cxExportVer.inc}

interface

uses
  Classes, SysUtils,
  {$IFDEF WIN32}
  Windows, 
  {$ENDIF}
  {$IFDEF LINUX}
  Graphics, 
  {$ENDIF}
  cxExportStrs;

type
  EcxExportData = class(Exception);
  TcxExportProviderClass = class of TcxCustomExportProvider;
  TcxCustomExportProvider = class;
  IcxCellInternalCache = interface;

  PWord =^Word;
  PInteger =^Integer;
  PIntArray = ^TIntArray;
  TIntArray = array[0..MaxInt div SizeOf(Integer) - 1] of Integer;

  { Define  CX  style items }
  TcxAlignText = (catLeft, catCenter, catRight);
  TcxBrushStyle = (cbsClear, cbsSolid);
  TcxFontStyle = (cfsBold, cfsItalic, cfsUnderline, cfsStrikeOut);
  TcxFontStyles = set of TcxFontStyle;

  { TcxCellBorders }
  TcxCellBorders = packed record
    IsDefault: Boolean;
    Width: Integer;
    Color: Integer;
  end;

  { TcxCacheCellStyle }
  PcxCacheCellStyle = ^TcxCacheCellStyle;
  TcxCacheCellStyle = packed record
    AlignText: TcxAlignText;
    FontName: array[0..32] of Char;
    FontStyle: TcxFontStyles;
    FontColor: Integer;
    FontSize: Integer;
    FontCharset: Integer;
    Borders: array[0..3] of TcxCellBorders;
    BrushStyle: TcxBrushStyle;
    BrushBkColor: Integer;
    BrushFgColor: Integer;
    HashCode: Integer;
  end;

  { TcxCellInternalCache }
  TcxCellInternalCache = record
    Cache: IcxCellInternalCache;
    Index: Integer;
  end;

  { TcxCacheItem }
  TcxCacheItem = record
    InternalCache: TcxCellInternalCache;
    Data: Pointer;
    DataSize: Integer;
    DataType: Integer;
    StyleIndex: Integer;
    IsHidden: Boolean;
    case IsUnion: Boolean of
      False:();
      True: (Width, Height: Integer);
  end;

  TcxEnumExportTypes = procedure(const AExportType: Integer; const AExportName: string);
  TcxEnumTypes = procedure(const AExportType: Integer);

  { IcxCellInternalCache }
  IcxCellInternalCache = interface
  ['{DEF62C25-0B11-4BD0-AE25-BABF7EDD7883}']
    procedure CommitCache(AStream: TStream; AParam: Pointer);
    procedure CommitStyle(AStream: TStream; AParam: Pointer);
    procedure DeleteCacheFromCell(const ACol, ARow: Integer);
    procedure SetCacheIntoCell(const ACol, ARow: Integer; ACache: IcxCellInternalCache);
  end;

  { TcxExportProvider }
  IcxExportProvider = interface
  ['{442A08A8-CDDA-4FD6-8E15-9D8BD34554F6}']
    procedure Commit;
    function GetCellStyle(const ACol, ARow: Integer): PcxCacheCellStyle;
    function GetStyle(AStyleIndex: Integer): PcxCacheCellStyle;
    function RegisterStyle(const AStyle: TcxCacheCellStyle): Integer;
    procedure SetCellDataDouble(const ACol, ARow: Integer; const AValue: Double);
    procedure SetCellDataInteger(const ACol, ARow: Integer; const AValue: Integer);
    procedure SetCellDataString(const ACol, ARow: Integer; const AText: string);
    procedure SetCellDataWideString(const ACol, ARow: Integer; const AText: Widestring);
    procedure SetCellStyle(const ACol, ARow, AStyleIndex: Integer); overload;
    procedure SetCellStyle(const ACol, ARow, AExampleCol, AExampleRow: Integer); overload;
    procedure SetCellStyle(const ACol, ARow: Integer; const AStyle: TcxCacheCellStyle); overload;
    procedure SetCellStyleEx(const ACol, ARow, H, W: Integer; const AStyleIndex: Integer);
    procedure SetCellUnion(const ACol, ARow: Integer; H, W: Integer);
    procedure SetCellValue(const ACol, ARow: Integer; const AValue: Variant);
    procedure SetColumnWidth(const ACol, AWidth: Integer);
    procedure SetDefaultStyle(const AStyle: TcxCacheCellStyle);
    procedure SetRange(const AColCount, ARowCount: Integer; IsVisible: Boolean = True);
    procedure SetRowHeight(const ARow, AHeight: Integer);
  end;

  { IcxExportWithSeparators }
  IcxExportWithSeparators = interface
  ['{0E2919A6-8B49-49D7-B55B-B44B6DECF2E5}']
    procedure AddSeparator(const ASeparator: string);
  end;

  { TcxCustomExportProvider }
  TcxCustomExportProvider = class(TInterfacedObject)
  private
    FFileName: string;
  protected
    procedure Clear; dynamic;
    property FileName: string read FFileName;
  public
    constructor Create(const AFileName: string); virtual;
    procedure BeforeDestruction; override;
    class function ExportType: Integer; virtual;
    class function ExportName: string; virtual;
  end;

  { TcxExport }
  TcxExport = class
  protected
    class function GetExportClassByType(
      AExportType: Integer): TcxExportProviderClass; virtual;
  public
    class function Provider(AExportType: Integer;
      const AFileName: string): TcxCustomExportProvider;
    class procedure SupportExportTypes(EnumSupportTypes: TcxEnumExportTypes);
    class procedure SupportTypes(EnumFunc: TcxEnumTypes);
    class function RegisterProviderClass(AProviderClass: TcxExportProviderClass): Boolean;
  end;

  { TcxExportStyleManager }
  TcxExportStyleManager = class
  private
    FRefCount: Integer;
    FStyles: TList;
    FFileName: string;
    constructor CreateInstance(const AFileName: string);
    function GetCount: Integer;
    function GetItem(AIndex: Integer): TcxCacheCellStyle;
    function StyleCompare(const AStyle1, AStyle2: PcxCacheCellStyle): Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear;
    class function GetInstance(const AFileName: string): TcxExportStyleManager;
    function GetStyle(const AIndex: Integer): PcxCacheCellStyle;
    function RegisterStyle(const AStyle: TcxCacheCellStyle): Integer;
    property Items[AIndex: Integer]: TcxCacheCellStyle read GetItem; default;
    property Count: Integer read GetCount;
  end;

  TcxColorToRgbProc = function(AColor: Integer): Integer;
  TcxGetResourceStringProc = function(const ResString: Pointer): string;

{$IFNDEF DELPHI5}
procedure FreeAndNil(var Obj);
function Supports(Instance: TObject; const Intf: TGUID; out Inst): Boolean;
{$ENDIF}

function cxColorToRGB(const AColor: Integer): Integer;
function cxStrToUnicode(const AText: string; ACharset: Integer = 0): Widestring;
function cxStrUnicodeNeeded(const AText: string; ACheckNormal: Boolean = False): Boolean;
function GetHashCode(const Buffer; Count: Integer): Integer;

procedure cxExportInit(AGetResString: TcxGetResourceStringProc;
  AColorProc: Pointer; AIsNativeColor: Boolean);

var
  DefaultCellStyle: TcxCacheCellStyle;
  cxBlackColor: Integer;
  cxWindowColor: Integer;
  cxBtnTextColor: Integer;
  cxBtnShadowColor: Integer;
  cxBtnFaceColor: Integer;
  cxGetResString: TcxGetResourceStringProc;

const
  cxExportToBinary = Integer($FFFFFFFF);
  cxExportToHtml   = Integer($00000002);
  cxExportToXml    = Integer($00000003);
  cxExportToText   = Integer($00000004);
  cxExportToExcel  = Integer($00000001);

  cxDataTypeString     = Integer($00000001);
  cxDataTypeWideString = Integer($00000002);
  cxDataTypeDouble     = Integer($00000003);
  cxDataTypeInteger    = Integer($00000004);

implementation
var
  StylesCache: TStringList;
  RegisteredClasses: array of TcxExportProviderClass;
  cxGetRgbColor: TcxColorToRgbProc;
  IsNativeColor: Boolean;

function CreateDefaultCellStyle: TcxCacheCellStyle;
var
  I: Integer;
begin
  with Result do
  begin
    AlignText := catCenter;
    FillChar(FontName, SizeOf(FontName), 0);
    FontName := 'Tahoma';
    FontStyle := [];
    FontColor := cxBtnTextColor;
    FontSize := 8;
    FontCharSet := 0;
    for I := 0 to 3 do
    begin
      Borders[I].IsDefault := False;
      Borders[I].Width := 1;
      Borders[I].Color := cxBtnShadowColor;
    end;
    BrushStyle := cbsSolid;
    BrushBkColor := cxWindowColor;
    BrushFgColor := cxBlackColor;
  end;
end;

function cxColorToRGB(const AColor: Integer): Integer;
type
  TRGB = packed record
    R, G, B, A: Byte;
  end;

begin
  Result := cxGetRgbColor(AColor);
  if IsNativeColor then Exit;
  with TRGB(cxGetRgbColor(AColor)) do
  begin
  {$IFDEF LINUX}
    Result := B shl 16 + G shl 8 + R
  {$ELSE}
    if AColor < 0 then 
      Result := R shl 16 + G shl 8 + B;
  {$ENDIF}
  end;
end;

{$IFDEF WIN32}
function cxStrToUnicode(const AText: string; ACharset: Integer = 0): Widestring;
var
  APage, ALen: Integer;
begin
  case ACharset of
    THAI_CHARSET:
      APage := 874;
    SHIFTJIS_CHARSET:
      APage := 932;
    HANGEUL_CHARSET, JOHAB_CHARSET:
      APage := 949;
    GB2312_CHARSET, CHINESEBIG5_CHARSET:
      APage := 950;
    EASTEUROPE_CHARSET:
      APage := 1250;
    RUSSIAN_CHARSET:
      APage := 1251;
    GREEK_CHARSET:
      APage := 1253;
    TURKISH_CHARSET:
      APage := 1254;
    HEBREW_CHARSET:
      APage := 1255;
    ARABIC_CHARSET:
      APage := 1256;
    BALTIC_CHARSET:
      APage := 1257;
  else
    APage := 0
  end;
  ALen := MultiByteToWideChar(APage, 0, PChar(AText), Length(AText), nil, 0);
  SetLength(Result, ALen);
  MultiByteToWideChar(APage, 0, PChar(AText), Length(AText), PWideChar(Result), ALen);
end;
{$ELSE}
function cxStrToUnicode(const AText: string; ACharset: Integer = 0): Widestring;
begin
  Result := AText;
end;
{$ENDIF}

function cxStrUnicodeNeeded(const AText: string; ACheckNormal: Boolean = False): Boolean;
var
  I: Integer;
const
  ANormal = ['0'..'9', ':', ';', '*', '+', ',', '-', '.', '/', '!', ' ',
    'A'..'Z', 'a'..'z', '_', '(', ')'];
begin
  Result := False;
  for I := 1 to Length(AText) do
    if (Byte(AText[I]) > $7F) or (ACheckNormal and not (AText[I] in ANormal)) then
    begin
      Result := True;
      Break;
    end
end;

function GetHashCode(const Buffer; Count: Integer): Integer; assembler;
asm
        MOV     ECX, EDX
        MOV     EDX, EAX
        XOR     EAX, EAX
@@1:    ROL     EAX, 5
        XOR     AL, [EDX]
        INC     EDX
        DEC     ECX
        JNE     @@1
end;

{$IFNDEF DELPHI5}
procedure FreeAndNil(var Obj);
var
  Temp: TObject;
begin
  Temp := TObject(Obj);
  Pointer(Obj) := nil;
  Temp.Free;
end;

function Supports(Instance: TObject; const Intf: TGUID; out Inst): Boolean;
begin
  Result := (Instance <> nil) and Instance.GetInterface(Intf, Inst);
end;
{$ENDIF}

{ TcxExport }
class function TcxExport.Provider(AExportType: Integer;
  const AFileName: string): TcxCustomExportProvider;
begin
  Result := GetExportClassByType(AExportType).Create(AFileName);
end;

class procedure TcxExport.SupportExportTypes(
  EnumSupportTypes: TcxEnumExportTypes);
var
  I: Integer;
begin
  for I := 0 to Length(RegisteredClasses) - 1  do
  begin
    with RegisteredClasses[I] do
      EnumSupportTypes(ExportType, ExportName);
  end;
end;

class procedure TcxExport.SupportTypes(EnumFunc: TcxEnumTypes);
var
  I: Integer;
begin
  for I := 0 to Length(RegisteredClasses) - 1 do
    EnumFunc(RegisteredClasses[I].ExportType);
end;

class function TcxExport.RegisterProviderClass(AProviderClass: TcxExportProviderClass): Boolean;
var
  I: Integer;
begin
  Result := False;
  if AProviderClass = nil then
    Exit;
  for I := 0 to Length(RegisteredClasses) - 1 do
  begin
    if (AProviderClass.ExportType = RegisteredClasses[I].ExportType) or
      (AProviderClass = RegisteredClasses[I]) then Exit;
  end;
  I := Length(RegisteredClasses);
  SetLength(RegisteredClasses, I + 1);
  RegisteredClasses[I] := AProviderClass;
  Result := True;
end;

class function TcxExport.GetExportClassByType(
  AExportType: Integer): TcxExportProviderClass;
var
  I: Integer;
begin
  for I := 0 to Length(RegisteredClasses) - 1 do
  begin
    if RegisteredClasses[I].ExportType = AExportType then
    begin
      Result := RegisteredClasses[I];
      Exit;
    end;
  end;
  raise EcxExportData.CreateFmt(cxGetResString(@scxUnsupportedExport), [AExportType]);
end;

{ TcxCustomExportProvider }
constructor TcxCustomExportProvider.Create(const AFileName: string);
begin
  FFileName := AFileName;
end;

procedure TcxCustomExportProvider.BeforeDestruction;
begin
  Clear;
end;

class function TcxCustomExportProvider.ExportType: Integer;
begin
  Result := -1;
end;

class function TcxCustomExportProvider.ExportName: string;
begin
  Result := '';
end;

procedure TcxCustomExportProvider.Clear;
begin
end;

{ TcxExportStyleManager }
constructor TcxExportStyleManager.Create;
begin
  raise EcxExportData.Create(cxGetResString(@scxStyleManagerCreate));
end;

destructor TcxExportStyleManager.Destroy;
begin
  if FRefCount <> 0 then
    raise EcxExportData.Create(cxGetResString(@scxStyleManagerKill));
  inherited Destroy;
end;

procedure TcxExportStyleManager.Clear;
var
  I: Integer;
begin
  Dec(FRefCount);
  if FRefCount = 0 then
  begin
    try
      for I := 0 to FStyles.Count - 1 do
        FreeMem(PcxCacheCellStyle(FStyles[I]));
      if StylesCache.Find(FFileName, I) then
        StylesCache.Delete(I);
    finally
      FStyles.Free;
      Destroy;
    end;
  end;
end;

class function TcxExportStyleManager.GetInstance(
  const AFileName: string): TcxExportStyleManager;
var
  AIndex: Integer;
begin
  if StylesCache.Find(AFileName, AIndex) then
  begin
    Result := TcxExportStyleManager(StylesCache.Objects[AIndex]);
    Result.RegisterStyle(DefaultCellStyle);
    Inc(Result.FRefCount);
  end
  else
    Result := CreateInstance(AFileName);
end;

function TcxExportStyleManager.GetStyle(const AIndex: Integer): PcxCacheCellStyle;
begin
  Result := FStyles[AIndex];
end;

function TcxExportStyleManager.RegisterStyle(
  const AStyle: TcxCacheCellStyle): Integer;
var
  I: Integer;
  NewStyleItem, AStylePtr: PcxCacheCellStyle;
begin
  AStylePtr := @AStyle;
  AStylePtr^.HashCode :=
    GetHashCode(AStyle, SizeOf(TcxCacheCellStyle) - SizeOf(Integer));
  for I := 0 to FStyles.Count - 1 do
    if StyleCompare(FStyles[I], @AStyle) then
    begin
      Result := I;
      Exit;
    end;
  New(NewStyleItem);
  NewStyleItem^ := AStylePtr^;
  Result := FStyles.Add(NewStyleItem);
end;

function TcxExportStyleManager.GetCount: Integer;
begin
  Result := FStyles.Count;
end;

function TcxExportStyleManager.GetItem(AIndex: Integer): TcxCacheCellStyle;
begin
  Result := GetStyle(AIndex)^;
end;

constructor TcxExportStyleManager.CreateInstance(const AFileName: string);
begin
  FStyles := TList.Create;
  StylesCache.AddObject(AFileName, Self);
  FFileName := AFileName;
  FRefCount := 1;
end;

function TcxExportStyleManager.StyleCompare(
  const AStyle1, AStyle2: PcxCacheCellStyle): Boolean;
begin
  Result := (AStyle1.HashCode = AStyle2.HashCode) and
    CompareMem(AStyle1, AStyle2, SizeOf(TcxCacheCellStyle) - SizeOf(Integer));
end;

procedure cxExportInit(AGetResString: TcxGetResourceStringProc;
  AColorProc: Pointer; AIsNativeColor: Boolean);
begin
  cxGetResString := AGetResString;
  cxGetRgbColor := AColorProc;
  IsNativeColor := AIsNativeColor;
{$IFDEF WIN32}
  cxWindowColor := Windows.GetSysColor(COLOR_WINDOW);
  cxBtnTextColor := Windows.GetSysColor(COLOR_BTNTEXT);
  cxBtnFaceColor := Windows.GetSysColor(COLOR_BTNFACE);
  cxBtnShadowColor := Windows.GetSysColor(COLOR_BTNSHADOW);
{$ELSE}
  cxWindowColor := cxColorToRGB(clWindow);
  cxBtnTextColor := cxColorToRGB(clBtnText);
  cxBtnFaceColor := cxColorToRGB(clBtnFace);
  cxBtnShadowColor := ColorToRGB(clBtnShadow);
{$ENDIF}
  FreeAndNil(StylesCache);
  StylesCache := TStringList.Create;
  DefaultCellStyle := CreateDefaultCellStyle;
end;


initialization
  StylesCache := nil;

finalization
  FreeAndNil(StylesCache);

end.
