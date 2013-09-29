
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

unit cxEditTextUtils;

{$I cxEdVer.inc}

interface

uses
{$IFDEF VCL}
  Windows, Controls,
{$ELSE}
  Qt, QTypes,
{$ENDIF}
{$IFDEF LINUX}
  Libc,
{$ENDIF}
{$IFDEF DELPHI6}
  Types,
{$ELSE}
  Classes,
{$ENDIF}
  SysUtils,
  Graphics;

const
  CXTO_LEFT                    = $00000000;
  CXTO_CENTER_HORIZONTALLY     = $00000001;
  CXTO_RIGHT                   = $00000002;
  CXTO_JUSTIFY_HORIZONTALLY    = $00000003;
  CXTO_DISTRIBUTE_HORIZONTALLY = $00000004;

  CXTO_TOP                     = $00000000;
  CXTO_CENTER_VERTICALLY       = $00000010;
  CXTO_BOTTOM                  = $00000020;
  CXTO_DISTRIBUTE_VERTICALLY   = $00000030;

  CXTO_PREVENT_LEFT_EXCEED     = $00000040;
  CXTO_PREVENT_TOP_EXCEED      = $00000080;

  CXTO_WORDBREAK               = $00000100;
  CXTO_SINGLELINE              = $00000200;
  CXTO_EXPANDTABS              = $00000400;
  CXTO_END_ELLIPSIS            = $00000800;

  CXTO_PATTERNEDTEXT           = $00001000;
  CXTO_EXTERNALLEADING         = $00002000;
  CXTO_EDITCONTROL             = $00004000;
  CXTO_NOCLIP                  = $00008000;

  CXTO_AUTOINDENTS             = $00010000;
  CXTO_CHARBREAK               = $00020000;

  CXTO_CALCRECT                = $00100000;
  CXTO_CALCROWCOUNT            = $00200000;

  CXTO_DEFAULT_FORMAT          = CXTO_LEFT or CXTO_TOP or CXTO_SINGLELINE;

  cxTextSpace = 2;

type
  TcxCaptionChar = {$IFDEF VCL}Char{$ELSE}WideChar{$ENDIF};
  PcxCaptionChar = {$IFDEF VCL}PChar{$ELSE}PWideChar{$ENDIF};
  TcxTextOutFormat = DWORD;
  TcxTextAlignX = (taLeft, taCenterX, taRight, taJustifyX, taDistributeX);
  TcxTextAlignY = (taTop, taCenterY, taBottom, taDistributeY);

  PcxTextParams = ^TcxTextParams;
  TcxTextParams = packed record
    RowHeight: Integer;
    tmExternalLeading: Integer;
    FullRowHeight: Integer;
    EndEllipsisWidth: Integer;
    BreakChar: TcxCaptionChar;
    TextAlignX: TcxTextAlignX;
    TextAlignY: TcxTextAlignY;
    WordBreak: Boolean;
    SingleLine: Boolean;
    ExpandTabs: Boolean;
    EndEllipsis: Boolean;
    ExternalLeading: Boolean;
    EditControl: Boolean;
    NoClip: Boolean;
    AutoIndents: Boolean;
    PreventLeftExceed: Boolean;
    PreventTopExceed: Boolean;
    CharBreak: Boolean;
    CalcRowCount: Boolean;
    CalcRect: Boolean;
    {$IFDEF VCL}
    MaxCharWidth: Integer;
    {$ENDIF}
  end;

  TcxTextRow = record
    Text: PcxCaptionChar;
    TextLength: Integer;
    TextExtents: TSize;
    BreakCount: Integer;
    TextOriginX: Integer;
    TextOriginY: Integer;
    StartOffset: Integer;
  end;
  TcxTextRows = array of TcxTextRow;

  TCanvasHandle = {$IFDEF VCL}HDC{$ELSE}QPainterH{$ENDIF};

function cxCalcTextParams(AHandle: TCanvasHandle; AFormat: DWORD): TcxTextParams; overload;
function cxCalcTextParams(ACanvas: TCanvas; AFormat: DWORD): TcxTextParams; overload;

function cxCalcTextExtents(AHandle: TCanvasHandle; AText: PcxCaptionChar;
  ATextLength: Integer; AExpandTabs: Boolean): TSize;
function cxGetLongestTextRowWidth(const ATextRows: TcxTextRows; ARowCount: Integer): Integer;

procedure cxCalcTextRowExtents(AHandle: TCanvasHandle; var ATextRow: TcxTextRow;
  const ATextParams: TcxTextParams);

function cxMakeTextRows(AHandle: TCanvasHandle; AText: PcxCaptionChar; const R: TRect;
  const ATextParams: TcxTextParams; out ATextRows: TcxTextRows; out ACount: Integer;
  AMaxLineCount: Integer = 0): Boolean; overload;
function cxMakeTextRows(ACanvas: TCanvas; AText: PcxCaptionChar; const R: TRect;
  const ATextParams: TcxTextParams; out ATextRows: TcxTextRows; out ACount: Integer;
  AMaxLineCount: Integer = 0): Boolean; overload;

procedure cxPlaceTextRows(AHandle: TCanvasHandle; const R: TRect;
  var ATextParams: TcxTextParams; const ATextRows: TcxTextRows; ARowCount: Integer);

function cxMakeFormat(ATextAlignX: TcxTextAlignX; ATextAlignY: TcxTextAlignY): DWORD;

function cxPrepareRect(const R: TRect; const ATextParams: TcxTextParams;
  ALeftIndent, ARightIndent: Integer): TRect;

function cxTextOut(AHandle: TCanvasHandle; AText: PcxCaptionChar; var R: TRect;
  AFormat: TcxTextOutFormat = CXTO_DEFAULT_FORMAT; AMaxLineCount: Integer = 0;
  ALeftIndent: Integer = 0; ARightIndent: Integer = 0): Integer; overload;

function cxTextOut(AHandle: TCanvasHandle; AText: PcxCaptionChar; var R: TRect;
  AFormat: TcxTextOutFormat; ASelStart, ASelLength: Integer;
  AColor, ATextColor: TColor; AMaxLineCount: Integer = 0;
  ALeftIndent: Integer = 0; ARightIndent: Integer = 0): Integer; overload;

// for TCanvas
function cxTextOut(ACanvas: TCanvas; AText: PcxCaptionChar; var R: TRect;
  AFormat: TcxTextOutFormat = CXTO_DEFAULT_FORMAT; AMaxLineCount: Integer = 0;
  ALeftIndent: Integer = 0; ARightIndent: Integer = 0): Integer; overload;

function cxTextOut(ACanvas: TCanvas; AText: PcxCaptionChar; var R: TRect;
  AFormat: TcxTextOutFormat; ASelStart, ASelLength: Integer;
  AColor, ATextColor: TColor; AMaxLineCount: Integer = 0;
  ALeftIndent: Integer = 0; ARightIndent: Integer = 0): Integer; overload;

procedure cxTextRowsOutHighlight(AHandle: TCanvasHandle; const R: TRect;
  const ATextParams: TcxTextParams; const ATextRows: TcxTextRows; ARowCount,
  ASelStart, ASelLength: Integer; AColor, ATextColor: TColor; AForceEndEllipsis: Boolean);

implementation

const
  CXTO_VERT_ALIGN_OFFSET = 4;
  CXTO_HORZ_ALIGN_MASK   = CXTO_CENTER_HORIZONTALLY or CXTO_RIGHT or CXTO_JUSTIFY_HORIZONTALLY or CXTO_DISTRIBUTE_HORIZONTALLY;
  CXTO_VERT_ALIGN_MASK   = CXTO_CENTER_VERTICALLY or CXTO_BOTTOM or CXTO_DISTRIBUTE_VERTICALLY;

  Tab: TcxCaptionChar = #9;
  LF: TcxCaptionChar = #10;
  CR: TcxCaptionChar = #13;

  cxEndEllipsisChars: PcxCaptionChar = '...';

var
  cxEndEllipsisCharsLength: Integer;

{$IFNDEF DELPHI6}
function StrCharLength(const Str: PChar): Integer;
begin
  if SysLocale.FarEast then
    Result := Integer(CharNext(Str)) - Integer(Str)
  else
    Result := 1;
end;
{$ENDIF}

function MaxInt(A, B: Integer): Integer;
begin
  Result := A;
  if B > A then Result := B;
end;

function MinInt(A, B: Integer): Integer;
begin
  Result := A;
  if B < A then Result := B;
end;

function cxMakeFormat(ATextAlignX: TcxTextAlignX; ATextAlignY: TcxTextAlignY): DWORD;
begin
  Result := Byte(ATextAlignX) or (Byte(ATextAlignY) shl CXTO_VERT_ALIGN_OFFSET);
end;

{$IFDEF VCL}
function cxCalcTextExtents(AHandle: TCanvasHandle; AText: PcxCaptionChar;
  ATextLength: Integer; AExpandTabs: Boolean): TSize;
begin
  if AExpandTabs then
  begin
    with LongRec(GetTabbedTextExtent(AHandle, AText, ATextLength, 0, Result)) do
    begin
      Result.cX := Lo;
      Result.cY := Hi;
    end
  end
  else
    GetTextExtentPoint32(AHandle, AText, ATextLength, Result);
end;

function IntersectClipRect(AHandle: TCanvasHandle; const R: TRect): HRGN;
begin
  Result := CreateRectRgn(0, 0, 0, 0);
  if GetClipRgn(AHandle, Result) <> 1 then
  begin
    DeleteObject(Result);
    Result := 0;
  end;
  with R do
    Windows.IntersectClipRect(AHandle, Left, Top, Right, Bottom);
end;

procedure RestoreClipRgn(AHandle: TCanvasHandle; var ARgn: HRGN);
begin
  SelectClipRgn(AHandle, ARgn);
  if ARgn <> 0 then
  begin
    DeleteObject(ARgn);
    ARgn := 0
  end;
end;
{$ELSE}
function RectVisible(APainter: QPainterH; const R: TRect): Boolean;
var
  VP: TRect;
begin
  Result := False;
  QPainter_viewport(APainter, @VP);
  if not IntersectRect(VP, VP, R) then Exit;
  Result := not QPainter_hasClipping(APainter);
  if not Result then
    Result := QRegion_contains(QPainter_clipRegion(APainter), PRect(@R));
end;

procedure DrawText(AHandle: TCanvasHandle; X, Y: Integer; R: TRect; const S: TCaption;
  ALength: Integer; AFlags: Integer = 0);
begin
  R.Top := Y;
  R.Left := X;
  QPainter_drawText(AHandle, @R, AFlags, PWideString(@S), ALength, nil, nil);
end;

function cxCalcTextExtents(AHandle: TCanvasHandle; AText: PcxCaptionChar;
  ATextLength: Integer; AExpandTabs: Boolean): TSize;
var
  R: TRect;
  S: WideString;
begin
  R := Rect(0, 0, System.MaxInt, System.MaxInt);
  S := WideString(AText);
  if AExpandTabs then
    QPainter_boundingRect(AHandle, @R, @R, 256, @S, ATextLength, nil)
  else
    QPainter_boundingRect(AHandle, @R, @R, 0, @S, ATextLength, nil);
  with R do
  begin
    Result.cx := Right - Left;
    Result.cy := Bottom - Top;
  end;
end;

function GetSymbolsInWidth(AHandle: TCanvasHandle; const S: TCaption;
  ALength, AWidth: Integer): Integer;
var
  R: TRect;
begin
  Result := ALength;
  QPainter_boundingRect(AHandle, @R, @R, 0, PWideString(@S), Result, nil);
  // TODO Make optimization (binary search)
  while (R.Right - R.Left > AWidth) do
  begin
    Dec(Result);
    if Result = 0 then break;
    QPainter_boundingRect(AHandle, @R, @R, 0, PWideString(@S), Result, nil);
  end;
end;

function IntersectClipRect(AHandle: TCanvasHandle; const R: TRect;
  var ASaveClipping: Boolean; var AClipRgn: QRegionH): QRegionH;
begin
  ASaveClipping := QPainter_hasClipping(AHandle);
  Result := QRegion_create(QPainter_clipRegion(AHandle));
  AClipRgn := QRegion_create(@R, QRegionRegionType_Rectangle);
  if ASaveClipping then
    QRegion_intersect(AClipRgn, AClipRgn, Result);
  QPainter_setClipRegion(AHandle, AClipRgn);
end;

procedure RestoreClipRgn(AHandle: TCanvasHandle; ASaveClipping: Boolean;
  ASaveClipRgn: QRegionH);
begin
  QPainter_setClipRegion(AHandle, ASaveClipRgn);
  QPainter_setClipping(AHandle, ASaveClipping);
  QRegion_destroy(ASaveClipRgn);
end;
{$ENDIF}

procedure cxCalcTextRowExtents(AHandle: TCanvasHandle; var ATextRow: TcxTextRow; const ATextParams: TcxTextParams);
begin
  with ATextRow do
    TextExtents := cxCalcTextExtents(AHandle, Text, TextLength, ATextParams.ExpandTabs);
end;

procedure cxGetTextRow(AHandle: TCanvasHandle; var S: PcxCaptionChar; var ALength: Integer;
  AWidth: Integer; AIsLastRow: Boolean; const ATextParams: TcxTextParams;
  var ATextRow: TcxTextRow);

var
  ATotalTextWidth, I, ABreakPos: Integer;
  ASize: TSize;
  ABreakByWords, ABreakByChars, AIsSpecialProcessedRow, ACRExists: Boolean;
{$IFDEF VCL}
  AChar: PChar;
  ACharLen: Integer;
{$ENDIF}
begin
  FillChar(ATextRow, SizeOf(ATextRow), 0);
  if S = nil then Exit;

  ATotalTextWidth := 0;
  ABreakPos := -1;

  with ATextParams do
  begin
    ABreakByWords :=
      not SingleLine and (WordBreak or (TextAlignX in [taJustifyX, taDistributeX]));
    ABreakByChars := ABreakByWords and CharBreak;
    AIsSpecialProcessedRow := not EditControl and
      not NoClip and not (TextAlignX in [taJustifyX, taDistributeX]) and AIsLastRow and EndEllipsis;
  end;

{$IFDEF VCL}
  AChar := S;
{$ENDIF}
  with ATextRow do
  begin
    for I := 0 to ALength - 1 do
    begin
    {$IFDEF VCL}
      if SysLocale.FarEast then
      begin
        ACharLen := StrCharLength(AChar);
        if StrByteType(S, I) = mbTrailByte then Continue;
        Inc(AChar, ACharLen);
      end
      else
        ACharLen := 1;
      TextLength := I + ACharLen;
    {$ELSE}
      TextLength := I + 1;
    {$ENDIF}

    {$IFDEF WIN32}
      if (S[I] = {$IFNDEF VCL}WideChar{$ENDIF}(ATextParams.BreakChar)) or (S[I] = Tab) then
    {$ELSE}
      if isspace(Integer(S[I])) = 8192 then
    {$ENDIF}
      begin
        Inc(BreakCount);
        ABreakPos := I;
      end;

      if ((S[I] = CR) or (S[I] = LF)) and not AIsSpecialProcessedRow and
        not ATextParams.SingleLine then
      begin
        Dec(TextLength);
        if ATextParams.TextAlignX = taJustifyX then BreakCount := 0;
        Break;
      end;

      if ABreakByWords or AIsSpecialProcessedRow or ATextParams.SingleLine then
      begin
        if ATextParams.ExpandTabs then
          ATotalTextWidth := cxCalcTextExtents(AHandle, S, TextLength, True).cx
        else
        begin
          ASize := cxCalcTextExtents(AHandle, @S[I], {$IFDEF VCL}ACharLen{$ELSE}1{$ENDIF}, False);
          Inc(ATotalTextWidth, ASize.cX);
        end;

        if ATotalTextWidth > AWidth then
        begin
          if AIsSpecialProcessedRow or ((ATotalTextWidth = AWidth) and ((I = ALength - 1) or
          {$IFDEF WIN32}
            ((S[I + 1] = {$IFNDEF VCL}WideChar{$ENDIF}(ATextParams.BreakChar)) or (S[I + 1] = Tab)))) then
          {$ELSE}
            (isspace(Integer(S[I + 1])) = 8192))) then
          {$ENDIF}
            Break
          else
          begin
            if ATextParams.SingleLine then
              Break
            else
              if ABreakPos <> -1 then
              begin
                TextLength := ABreakPos + 1;
                Break;
               end
              else
                if ABreakByChars then
                begin
                {$IFDEF VCL}
                  if TextLength > StrCharLength(S) then Dec(TextLength, ACharLen);
                {$ELSE}
                  if TextLength > 1 then Dec(TextLength);
                {$ENDIF}
                  Break;
                end;
          end;
        end;
      end;
    end;
    Text := S;

    // truncate trailing spaces
    if ATextParams.TextAlignX in [taJustifyX, taDistributeX] then
      while (TextLength > 0) and
      {$IFDEF WIN32}
        ((S[TextLength - 1] = {$IFNDEF VCL}WideChar{$ENDIF}(ATextParams.BreakChar)) or (S[TextLength - 1] = Tab)) do
      {$ELSE}
        (isspace(Integer(S[TextLength - 1])) = 8192) do
      {$ENDIF}
      begin
        if BreakCount > 0 then Dec(BreakCount);
        Dec(TextLength);
      end;
  end;

  cxCalcTextRowExtents(AHandle, ATextRow, ATextParams);

  ACRExists := False;
  // correct source string
  Inc(S, ATextRow.TextLength);
  Dec(ALength, ATextRow.TextLength);

  I := 0;
  while (I < ALength) and (S[I] = ATextParams.BreakChar) do
    Inc(I);
  if I < ALength then
  begin
    if S[I] = Tab then Inc(I);
    ACRExists := S[I] = CR;
    if S[I] = CR then Inc(I);
    if S[I] = LF then Inc(I);
  end;
  Inc(S, I);
  Dec(ALength, I);

  // doesn't justify last row  (like Excel ?)
  if ((ALength = 0) or ACRExists) and (ATextParams.TextAlignX = taJustifyX) then
    ATextRow.BreakCount := 0;
end;

function cxCalcTextParams(AHandle: TCanvasHandle; AFormat: TcxTextOutFormat): TcxTextParams;
{$IFDEF VCL}
var
  ATextMetric: TTextMetric;
{$ENDIF}
begin
  FillChar(Result, SizeOf(Result), 0);
  with Result do
  begin
  {$IFDEF VCL}
    GetTextMetrics(AHandle, ATextMetric);
    BreakChar := ATextMetric.tmBreakChar;
    MaxCharWidth := ATextMetric.tmMaxCharWidth;
    RowHeight := ATextMetric.tmHeight;
  {$ELSE}
    BreakChar := ' ';
    RowHeight := cxCalcTextExtents(AHandle, 'Wg', 2, False).cY;
  {$ENDIF}

    TextAlignX := TcxTextAlignX(AFormat and CXTO_HORZ_ALIGN_MASK);
    TextAlignY := TcxTextAlignY(AFormat and CXTO_VERT_ALIGN_MASK shr CXTO_VERT_ALIGN_OFFSET);

    AutoIndents := AFormat and CXTO_AUTOINDENTS <> 0;
    CalcRect := AFormat and CXTO_CALCRECT <> 0;
    CalcRowCount := AFormat and CXTO_CALCROWCOUNT <> 0;
    CharBreak := (AFormat and CXTO_CHARBREAK <> 0) or SysLocale.FarEast;
    EditControl := AFormat and CXTO_EDITCONTROL <> 0;
    EndEllipsis := AFormat and CXTO_END_ELLIPSIS <> 0;
    ExternalLeading := AFormat and CXTO_EXTERNALLEADING <> 0;
    ExpandTabs := AFormat and CXTO_EXPANDTABS <> 0;
    NoClip := AFormat and CXTO_NOCLIP <> 0;
    PreventLeftExceed := AFormat and CXTO_PREVENT_LEFT_EXCEED <> 0;
    PreventTopExceed := AFormat and CXTO_PREVENT_TOP_EXCEED <> 0;
    SingleLine := AFormat and CXTO_SINGLELINE <> 0;
    WordBreak := AFormat and CXTO_WORDBREAK <> 0;

  {$IFDEF VCL}
    if ExternalLeading then tmExternalLeading := ATextMetric.tmExternalLeading;
  {$ENDIF}
    FullRowHeight := RowHeight + tmExternalLeading;
    if AFormat and CXTO_END_ELLIPSIS = CXTO_END_ELLIPSIS then
      EndEllipsisWidth := cxCalcTextExtents(AHandle, cxEndEllipsisChars, cxEndEllipsisCharsLength, False).cX
    else EndEllipsisWidth := 0;
  end;
end;

type
  TCanvasAccess = class({$IFDEF VCL}TControlCanvas{$ELSE}TCanvas{$ENDIF});

function cxCalcTextParams(ACanvas: TCanvas; AFormat: DWORD): TcxTextParams;
begin
{$IFDEF VCL}
  with TCanvasAccess(ACanvas) do
  begin
    RequiredState([csHandleValid, csFontValid]);
    Result := cxCalcTextParams(ACanvas.Handle, AFormat);
  end;
{$ELSE}
  with TCanvasAccess(ACanvas) do
  try
    Start;
    RequiredState([csHandleValid, csFontValid]);
    Result := cxCalcTextParams(ACanvas.Handle, AFormat);
  finally
    Stop;
  end;
{$ENDIF}
end;

function cxMakeTextRows(AHandle: TCanvasHandle; AText: PcxCaptionChar;
  const R: TRect; const ATextParams: TcxTextParams; out ATextRows: TcxTextRows;
  out ACount: Integer; AMaxLineCount: Integer = 0): Boolean;

  function CheckIsLastRow(ATotalHeight, H: Integer): Boolean;
  begin
    with ATextParams do
      if SingleLine then
        Result := True
      else
        if (TextAlignY = taTop) and not CalcRect then
        begin
          if (EditControl{ or EndEllipsis}) and not NoClip then
            Result := ATotalHeight + FullRowHeight > H
          else
            Result := ATotalHeight > H
        end
        else
          Result := (AMaxLineCount > 0) and (ACount = AMaxLineCount);
  end;

  procedure ExpandTextRows(var ACapacity: Integer);
  const
    Delta: Integer = 4;
  begin
    if ACount > ACapacity then
    begin
      Inc(ACapacity, Delta);
      SetLength(ATextRows, ACapacity);
    end;
  end;

var
  P: PcxCaptionChar;
  AIsLastRow, ARectIsSmall: Boolean;
  ATotalHeight, ACapacity, H, W, L, AOffset: Integer;

begin
  P := AText;
  ARectIsSmall := False;
  ATextRows := nil;
  ACount := 0;
  if P <> nil then
  begin
    AOffset := 0;
    if ATextParams.CalcRect and ATextParams.SingleLine then
    begin
      ACount := 1;
      SetLength(ATextRows, ACount);
      ATextRows[0].Text := P;
      ATextRows[0].TextLength := Length(P);
      cxCalcTextRowExtents(AHandle, ATextRows[0], ATextParams);
    end
    else
    begin
      AIsLastRow := False;
      ATotalHeight := 0;
      ACapacity := 0;
      L := Length(P);
      W := R.Right - R.Left;
      H := R.Bottom - R.Top;
      while (P^ <> #0) and not AIsLastRow do
      begin
        Inc(ACount);
        ExpandTextRows(ACapacity);
        Inc(ATotalHeight, ATextParams.FullRowHeight);
        AIsLastRow := CheckIsLastRow(ATotalHeight, H);
        cxGetTextRow(AHandle, P, L, W, AIsLastRow, ATextParams, ATextRows[ACount - 1]);
        ATextRows[ACount - 1].StartOffset := AOffset;
      {$IFDEF VCL}
        AOffset := Integer(Pointer(P)) - Integer(Pointer(AText));
      {$ELSE}
        AOffset := (Integer(Pointer(P)) - Integer(Pointer(AText))) SHR 1;
      {$ENDIF}
        if not AIsLastRow then
          AIsLastRow := L = 0;
      end;
      with ATextParams do
        ARectIsSmall := not SingleLine and not CalcRect and
          (AMaxLineCount > 0) and (ACount = AMaxLineCount) and (L > 0);
      if ACapacity > ACount then
        SetLength(ATextRows, ACount);
    end;
  end;
  Result := not ARectIsSmall;
end;

function cxMakeTextRows(ACanvas: TCanvas; AText: PcxCaptionChar; const R: TRect;
  const ATextParams: TcxTextParams; out ATextRows: TcxTextRows;
  out ACount: Integer; AMaxLineCount: Integer = 0): Boolean;
begin
{$IFDEF VCL}
  Result := cxMakeTextRows(ACanvas.Handle, AText, R, ATextParams, ATextRows, ACount, AMaxLineCount);
{$ELSE}
  with TCanvasAccess(ACanvas) do
  try
    Start;
    RequiredState([csHandleValid, csFontValid]);
    Result := cxMakeTextRows(ACanvas.Handle, AText, R, ATextParams, ATextRows, ACount, AMaxLineCount);
  finally
    Stop;
  end;
{$ENDIF}
end;

procedure cxPlaceTextRows(AHandle: TCanvasHandle; const R: TRect; var ATextParams: TcxTextParams;
  const ATextRows: TcxTextRows; ARowCount: Integer);

  procedure CalcExtraAndTopRowOffset(out AExtra, ATopRowOffset: Integer);
  var
    H: Integer;
  begin
    AExtra := 0;
    with ATextParams do
    begin
      if (ARowCount > 1) and (TextAlignY = taDistributeY) then
      begin
        H := R.Bottom - R.Top;
        Dec(H, RowHeight);
        if H / (ARowCount - 1) > RowHeight then
        begin
          FullRowHeight := H div (ARowCount - 1);
          AExtra := H mod (ARowCount - 1);
        end;
      end;

      case TextAlignY of
        taCenterY:
          ATopRowOffset := R.Top + (R.Bottom - R.Top - ARowCount * FullRowHeight) div 2;
        taBottom:
          ATopRowOffset := R.Bottom - ARowCount * FullRowHeight + tmExternalLeading;
      else
        ATopRowOffset := R.Top;
      end;

      if PreventTopExceed and (ATopRowOffset < R.Top) then
        ATopRowOffset := R.Top;
    end;
  end;

  procedure PlaceRows(AExtra, ATopRowOffset: Integer);
  var
    I: Integer;
  begin
    for I := 0 to ARowCount - 1 do
      with ATextRows[I] do
      begin
        // Horizontally
        case ATextParams.TextAlignX of
          taCenterX:
            TextOriginX := R.Left + (R.Right - R.Left - TextExtents.cX) div 2;
          taRight:
            TextOriginX := R.Right - TextExtents.cX;
        else
          TextOriginX := R.Left;
        end;
        if ATextParams.PreventLeftExceed and (TextOriginX < R.Left) then
          TextOriginX := R.Left;

        // Vertically
        TextOriginY := ATopRowOffset;
        Inc(ATopRowOffset, ATextParams.FullRowHeight);
        if AExtra > 0 then
        begin
          Inc(ATopRowOffset);
          Dec(AExtra);
        end;
      end;
  end;

var
  Extra, TopRowOffset: Integer;
begin
  CalcExtraAndTopRowOffset(Extra, TopRowOffset);
  PlaceRows(Extra, TopRowOffset);
end;

function cxPrepareRect(const R: TRect; const ATextParams: TcxTextParams;
  ALeftIndent, ARightIndent: Integer): TRect;
begin
  Result := R;
  with Result do
  begin
    Inc(Left, ALeftIndent);
    Dec(Right, ARightIndent);
  end;
end;

function cxUnprepareRect(const R: TRect; const ATextParams: TcxTextParams;
  ALeftIndent: Integer = 0; ARightIndent: Integer = 0): TRect;
begin
  Result := R;
  with Result do
  begin
    Dec(Left, ALeftIndent);
    Inc(Right, ARightIndent);
  end;
end;

{$WARNINGS OFF}
procedure cxTextRowsOutHighlight(AHandle: TCanvasHandle; const R: TRect;
  const ATextParams: TcxTextParams; const ATextRows: TcxTextRows; ARowCount,
  ASelStart, ASelLength: Integer; AColor, ATextColor: TColor; AForceEndEllipsis: Boolean);

  procedure OutTextRow(const ATextRow: TcxTextRow);
{$IFDEF VCL}
  var
    Stub: Integer;
{$ENDIF}
  begin
  {$IFDEF VCL}
    with ATextRow do
      if ATextParams.ExpandTabs then
        TabbedTextOut(AHandle, TextOriginX, TextOriginY, Text, TextLength, 0, Stub, 0)
      else
        ExtTextOut(AHandle, TextOriginX, TextOriginY, ETO_CLIPPED, nil, Text, TextLength, nil);
  {$ELSE}
    with ATextRow do
      if ATextParams.ExpandTabs then
        DrawText(AHandle, TextOriginX, TextOriginY, R, Text, TextLength, 256)
      else
        DrawText(AHandle, TextOriginX, TextOriginY, R, Text, TextLength);
  {$ENDIF}
  end;

  procedure PrepareEndEllipsis(var ATextRow: TcxTextRow; var AWidth: Integer);
  var
    ACharNumber: Integer;
  {$IFDEF VCL}
    ASize: TSize;
  {$ENDIF}
  begin
    Dec(AWidth, ATextParams.EndEllipsisWidth);
    if AWidth < 0 then AWidth := 0;
    with ATextRow do
    begin
    {$IFDEF VCL}
      GetTextExtentExPoint(AHandle, Text, TextLength, AWidth, @ACharNumber, nil, ASize);
    {$ELSE}
      ACharNumber := GetSymbolsInWidth(AHandle, Text, TextLength, AWidth);
    {$ENDIF}
      if ACharNumber = 0 then Inc(ACharNumber);
      TextLength := ACharNumber;
    end;
    cxCalcTextRowExtents(AHandle, ATextRow, ATextParams);
  end;

  procedure OutEndEllipsis(const ATextRow: TcxTextRow; var ARowRect: TRect);
  const
  {$IFDEF VCL}
    ClipTexts: array[Boolean] of UINT = (0, ETO_CLIPPED);
  {$ELSE}
    ClipTexts: array[Boolean] of UINT = (128, 0);
  {$ENDIF}
  var
    fuOptions: UINT;
  begin
    Inc(ARowRect.Left, ATextRow.TextExtents.cX);
    if ARowRect.Left < ARowRect.Right then
    begin
      fuOptions := ClipTexts[not ATextParams.NoClip and (ARowRect.Left + ATextParams.EndEllipsisWidth > ARowRect.Right)];
    {$IFDEF VCL}
      ExtTextOut(AHandle, ARowRect.Left, ATextRow.TextOriginY, fuOptions,
        @ARowRect, PChar(cxEndEllipsisChars), Length(cxEndEllipsisChars), nil);
    {$ELSE}
      QPainter_drawText(AHandle, ARowRect.Left, ATextRow.TextOriginY,
       ARowRect.Right - ARowRect.Left,
       ARowRect.Bottom - ARowRect.Top,
       fuOptions, PWideString(@cxEndEllipsisChars),
       Length(cxEndEllipsisChars), nil, nil);
    {$ENDIF}
    end;
  end;

var
  ARowRect, AHighlightRect: TRect;
  W, I, F, L: Integer;
{$IFDEF VCL}
  ABreakExtra: Integer;
{$ELSE}
  AHasClipping, ASaveClipping: Boolean;
  ABrushColor: QColorH;
  APenColor: QColorH;
  AClipRgn, AHighlightClipRgn: QRegionH;
{$ENDIF}
  APrevBkMode: {$IFDEF VCL}Integer{$ELSE}BGMode{$ENDIF};
  ASaveTextColor: {$IFDEF VCL}TColor{$ELSE}QColorH{$ENDIF};
  ANeedClip, ANeedEndEllipsis: Boolean;
  ATextRow: TcxTextRow;
  ASelectedText: PcxCaptionChar;
  AHighlightSize: TSize;
  ARgn, ASaveClipRgn: {$IFDEF VCL}HRGN{$ELSE}QRegionH{$ENDIF};
  ABrush: {$IFDEF VCL}HBRUSH{$ELSE}QBrushH{$ENDIF};
begin
  AColor := ColorToRGB(AColor);
  ATextColor := ColorToRGB(ATextColor);
  W := R.Right - R.Left;
  ARowRect := R;
{$IFDEF VCL}
  APrevBkMode := SetBkMode(AHandle, Windows.TRANSPARENT);
{$ELSE}
  APrevBkMode := QPainter_BackgroundMode(AHandle);
  QPainter_setBackgroundMode(AHandle, BGMode_TransparentMode);
{$ENDIF}

  if ASelLength > 0 then
  begin
  {$IFDEF VCL}
    ABrush := CreateSolidBrush(AColor);
  {$ELSE}
    ABrushColor := QColor(AColor);
    ABrush := QBrush_create(ABrushColor, BrushStyle_SolidPattern);
    ASaveTextColor := QColor_create(QPen_color(QPainter_pen(AHandle)));
    APenColor := QColor(ATextColor);
  {$ENDIF}
  end;

  for I := 0 to ARowCount - 1 do
  begin
    ATextRow := ATextRows[I];
    with ATextRow, ATextParams do
    begin
      if TextLength <> 0 then
      begin
        ARowRect.Top := TextOriginY;
        ARowRect.Bottom := ARowRect.Top + FullRowHeight;
        ANeedEndEllipsis := EndEllipsis and (I = ARowCount - 1) and
          ((TextExtents.cX > W) or AForceEndEllipsis);
      {$IFDEF VCL}
        ABreakExtra := 0;
        if (TextAlignX in [taJustifyX, taDistributeX]) and not ANeedEndEllipsis then
        begin
          ABreakExtra := W - TextExtents.cX;
          if (BreakCount <> 0) and (ABreakExtra > 0) then
            SetTextJustification(AHandle, ABreakExtra, BreakCount);
        end;
      {$ENDIF}

        ANeedClip := not NoClip and ((TextExtents.cX > W) or
          (ARowRect.Top < R.Top) or (ARowRect.Bottom > R.Bottom));
        if ANeedClip then
        begin
          if ARowRect.Top < R.Top then ARowRect.Top := R.Top;
          if ARowRect.Bottom > R.Bottom then ARowRect.Bottom := R.Bottom;
        {$IFDEF VCL}
          ARgn := IntersectClipRect(AHandle, ARowRect);
        {$ELSE}
          ARgn := IntersectClipRect(AHandle, ARowRect, AHasClipping, AClipRgn);
        {$ENDIF}
        end;

        if ANeedEndEllipsis then PrepareEndEllipsis(ATextRow, W);
        OutTextRow(ATextRow);

        if ASelLength > 0 then with ATextRow do
        begin
          if not ((ASelStart >= StartOffset + TextLength) or
            (ASelStart + ASelLength <= StartOffset)) then
          begin
            F := MaxInt(ASelStart, StartOffset);
            L := MinInt(ASelStart + ASelLength, StartOffset + TextLength);
            Dec(F, StartOffset);
            Dec(L, StartOffset);
            if L > F then
            begin
              AHighlightRect.Left := TextOriginX;
              if F > 0 then
              begin
                AHighlightSize := cxCalcTextExtents(AHandle, Text, F, ExpandTabs);
                Inc(AHighlightRect.Left, AHighlightSize.cx);
              end;
              ASelectedText := Text;
              Inc(ASelectedText, F);
              AHighlightSize := cxCalcTextExtents(AHandle, ASelectedText, L - F, ExpandTabs);
              with AHighlightRect do
                Right := Left + AHighlightSize.cx;
              AHighlightRect.Top := ARowRect.Top;
              AHighlightRect.Bottom := ARowRect.Bottom;
              if not IsRectEmpty(AHighlightRect) then
              begin
              {$IFDEF VCL}
                ASaveClipRgn := IntersectClipRect(AHandle, AHighlightRect);
                FillRect(AHandle, AHighlightRect, ABrush);
                ASaveTextColor := SetTextColor(AHandle, ATextColor);
                OutTextRow(ATextRow);
                SetTextColor(AHandle, ASaveTextColor);
                RestoreClipRgn(AHandle, ASaveClipRgn);
              {$ELSE}
                ASaveClipRgn := IntersectClipRect(AHandle, AHighlightRect,
                  ASaveClipping, AHighlightClipRgn);
                QPainter_fillRect(AHandle, @AHighlightRect, ABrush);
                QPainter_setPen(AHandle, APenColor);
                OutTextRow(ATextRow);
                QPainter_setPen(AHandle, ASaveTextColor);
                RestoreClipRgn(AHandle, ASaveClipping, ASaveClipRgn);
                QRegion_destroy(AHighlightClipRgn);
              {$ENDIF}
              end;
            end;
          end;
        end;

        if ANeedEndEllipsis then OutEndEllipsis(ATextRow, ARowRect);

        if ANeedClip then
      {$IFDEF VCL}
          RestoreClipRgn(AHandle, ARgn);
      {$ELSE}
        begin
          RestoreClipRgn(AHandle, AHasClipping, ARgn);
          QRegion_destroy(AClipRgn);
        end;
      {$ENDIF}
      {$IFDEF VCL}
        if ABreakExtra > 0 then SetTextJustification(AHandle, 0, 0);
      {$ENDIF}
      end
      else
        if AForceEndEllipsis and EndEllipsis and (I = ARowCount - 1) then
        begin
          ARowRect.Top := TextOriginY;
          ARowRect.Bottom := ARowRect.Top + FullRowHeight;
          PrepareEndEllipsis(ATextRow, W);
          OutEndEllipsis(ATextRow, ARowRect);
        end;
    end;
  end;

  if ASelLength > 0 then
  begin
  {$IFDEF VCL}
    DeleteObject(ABrush);
  {$ELSE}
    QBrush_destroy(ABrush);
    QColor_destroy(ASaveTextColor);
    QColor_destroy(ABrushColor);
    QColor_destroy(APenColor);
  {$ENDIF}
  end;
{$IFDEF VCL}
  SetBkMode(AHandle, APrevBkMode);
{$ELSE}
  QPainter_setBackgroundMode(AHandle, APrevBkMode);
{$ENDIF}
end;
{$WARNINGS ON}

function cxGetLongestTextRowWidth(const ATextRows: TcxTextRows; ARowCount: Integer): Integer;
var
  I, V: Integer;
begin
  if ARowCount > Length(ATextRows) then ARowCount := Length(ATextRows);
  if ARowCount = 0 then
    Result := 0
  else
  begin
    Result := ATextRows[0].TextExtents.cX;
    for I := 1 to ARowCount - 1 do
    begin
      V := ATextRows[I].TextExtents.cX;
      if V > Result then Result := V;
    end;
  end;
end;

function cxTextOut(AHandle: TCanvasHandle; AText: PcxCaptionChar; var R: TRect;
  AFormat: TcxTextOutFormat; ASelStart, ASelLength: Integer;
  AColor, ATextColor: TColor; AMaxLineCount: Integer = 0;
  ALeftIndent: Integer = 0; ARightIndent: Integer = 0): Integer;

  function ProcessText(const ATextParams: TcxTextParams; const ATextRect: TRect): Boolean;
  begin
    if ATextParams.CalcRect then
      Result := (ATextRect.Right - ATextRect.Left) > 0
    else
      Result := not IsRectEmpty(ATextRect);
  end;

var
  ATextHeight, ARowCount, ATextLength: Integer;
  ATextParams: TcxTextParams;
  ATextRect: TRect;
  ATextRows: TcxTextRows;
  AForceEndEllipsis: Boolean;
begin
  Result := 0;
  ATextLength := {$IFDEF VCL}StrLen(AText){$ELSE}Length(AText){$ENDIF};
  if ATextLength = 0 then Exit;
  ATextParams := cxCalcTextParams(AHandle, AFormat);
  ATextRect := cxPrepareRect(R, ATextParams, ALeftIndent, ARightIndent);

  ATextHeight := 0;
  if ProcessText(ATextParams, ATextRect) then
  begin
    ATextRows := nil;
    AForceEndEllipsis := not cxMakeTextRows(AHandle, AText, ATextRect, ATextParams, ATextRows, ARowCount, AMaxLineCount);
    if ARowCount <> 0 then
    try
      if ATextParams.CalcRect then
      begin
        if (AMaxLineCount > 0) and (AMaxLineCount < ARowCount) then
          ARowCount := AMaxLineCount;
        ATextRect.Right := ATextRect.Left + cxGetLongestTextRowWidth(ATextRows, ARowCount);
        if not ATextParams.SingleLine then
        begin
          ATextRows := nil;
          cxMakeTextRows(AHandle, AText, ATextRect, ATextParams, ATextRows, ARowCount, AMaxLineCount);
        end;
        cxPlaceTextRows(AHandle, ATextRect, ATextParams, ATextRows, ARowCount);
        ATextRect.Bottom := ATextRect.Top + ATextRows[ARowCount - 1].TextOriginY + ATextParams.RowHeight;
        R := cxUnprepareRect(ATextRect, ATextParams, ALeftIndent, ARightIndent);
      end
      else
      begin
        if (AMaxLineCount > 0) and (ARowCount >= AMaxLineCount) then
        begin
          ARowCount := AMaxLineCount;
          with ATextParams do
            AForceEndEllipsis := AForceEndEllipsis and EndEllipsis and EditControl and not SingleLine;
        end
        else
          AForceEndEllipsis := False;

        cxPlaceTextRows(AHandle, ATextRect, ATextParams, ATextRows, ARowCount);
        if (ASelStart < 0) or (ASelStart >= ATextLength) then
          ASelLength := 0
        else
          if (ASelLength + ASelStart) > ATextLength then
            ASelLength := ATextLength - ASelStart;
        cxTextRowsOutHighlight(AHandle, ATextRect, ATextParams, ATextRows,
          ARowCount, ASelStart, ASelLength, AColor, ATextColor, AForceEndEllipsis);
      end;
      ATextHeight := ATextRows[ARowCount - 1].TextOriginY + ATextParams.RowHeight - ATextRect.Top;
    finally
      ATextRows := nil;
    end;
  end;
  if ATextParams.CalcRowCount or (ATextHeight = 0) then
    Result := ARowCount
  else
    Result := ATextHeight;
end;

function cxTextOut(ACanvas: TCanvas; AText: PcxCaptionChar; var R: TRect;
  AFormat: TcxTextOutFormat; ASelStart, ASelLength: Integer;
  AColor, ATextColor: TColor; AMaxLineCount: Integer = 0;
  ALeftIndent: Integer = 0; ARightIndent: Integer = 0): Integer;
begin
{$IFDEF VCL}
  Result := cxTextOut(ACanvas.Handle, AText, R, AFormat, ASelStart, ASelLength,
    AColor, ATextColor, AMaxLineCount, ALeftIndent, ARightIndent);
{$ELSE}
  with TCanvasAccess(ACanvas) do
  try
    Start;
    RequiredState([csHandleValid, csFontValid]);
    Result := cxTextOut(ACanvas.Handle, AText, R, AFormat, ASelStart, ASelLength,
    AColor, ATextColor, AMaxLineCount, ALeftIndent, ARightIndent);
  finally
    Stop;
  end;
{$ENDIF}
end;

function cxTextOut(ACanvas: TCanvas; AText: PcxCaptionChar; var R: TRect;
  AFormat: TcxTextOutFormat = CXTO_DEFAULT_FORMAT; AMaxLineCount: Integer = 0;
  ALeftIndent: Integer = 0; ARightIndent: Integer = 0): Integer;
begin
  Result := cxTextOut(ACanvas, AText, R, AFormat, 0, 0, ACanvas.Font.Color, clBlack,
    AMaxLineCount, ALeftIndent, ARightIndent);
end;

function cxTextOut(AHandle: TCanvasHandle; AText: PcxCaptionChar; var R: TRect;
  AFormat: TcxTextOutFormat = CXTO_DEFAULT_FORMAT; AMaxLineCount: Integer = 0;
  ALeftIndent: Integer = 0; ARightIndent: Integer = 0): Integer;
begin
{$IFDEF VCL}
  Result := cxTextOut(AHandle, AText, R, AFormat, 0, 0, GetTextColor(AHandle), clBlack,
    AMaxLineCount, ALeftIndent, ARightIndent);
{$ELSE}
  // TODO GetTextColor
  Result := cxTextOut(AHandle, AText, R, AFormat, 0, 0, clBlack, clBlack,
    AMaxLineCount, ALeftIndent, ARightIndent);
{$ENDIF}
end;

initialization
  cxEndEllipsisCharsLength := Length(cxEndEllipsisChars);

end.
