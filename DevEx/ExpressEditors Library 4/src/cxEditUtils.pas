
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

unit cxEditUtils;

{$I cxEdVer.inc}

interface

{.$DEFINE NOFLICKER}

uses
{$IFDEF WIN32}
  Windows,
{$ENDIF}
{$IFDEF VCL}
  dxThemeManager,
{$ELSE}
  Types, Qt, QTypes,
{$ENDIF}
{$IFDEF DELPHI6}
  Variants,
{$ENDIF}
  Classes, Controls, Forms, Graphics, ImgList, StdCtrls, SysUtils,
  cxCheckBox, cxContainer, cxControls, cxDropDownEdit, cxEdit, cxEditPaintUtils,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, cxMemo, cxScrollBar,
  cxSpinEdit, cxTextEdit;

const
  cxEditButtonMaxBorderWidth = 2;
  cxEditMaxBorderWidth = 2;
  cxEditMaxCheckBoxBorderWidth = 2;
  cxEditShadowWidth = 3;
  cxEmptyRect: TRect = (Left: 0; Top: 0; Right: 0; Bottom: 0);

type
  TcxEditBackgroundPaintingStyle = (bpsSolid, bpsComboEdit, bpsComboListEdit);
  TcxEditCanvasHandle = {$IFDEF VCL}HDC{$ELSE}QPainterH{$ENDIF};

{$IFDEF VCL}
function AreVisualStylesMustBeUsed(NativeEditStyle: Boolean; AThemedObjectType:
  TdxThemedObjectType): Boolean;
{$ENDIF}
procedure CalculateCheckBoxViewInfo(AViewData: TcxCustomCheckBoxViewData; AViewInfo:
  TcxCustomCheckBoxViewInfo; AIsMouseEvent: Boolean);
procedure CalculateCustomCheckBoxViewInfo(ACanvas: TcxCanvas; AViewData: TcxCustomCheckBoxViewData;
  AViewInfo: TcxCustomCheckBoxViewInfo);
procedure CalculateCustomEditViewInfo(AViewData: TcxCustomEditViewData;
  AViewInfo: TcxCustomEditViewInfo; AIsMouseEvent: Boolean);
{$IFDEF VCL}
procedure CalculateEditButtonState(AViewInfo: TcxEditButtonViewInfo);
{$ENDIF}
function CalculateEditDefaultButtonWidth(ACanvas: TcxCanvas; AViewInfo: TcxEditButtonViewInfo): Integer;
procedure CalculateEditPopupWindowViewInfo(AViewInfo: TcxCustomEditPopupWindowViewInfo);
{$IFDEF VCL}
procedure CalculateSpinEditViewInfo(AViewData: TcxSpinEditViewData;
  AViewInfo: TcxSpinEditViewInfo);
{$ENDIF}
procedure CalculateTextEditViewInfo(ACanvas: TcxCanvas; AViewData: TcxCustomTextEditViewData;
  AViewInfo: TcxCustomTextEditViewInfo; AIsMouseEvent: Boolean);
procedure cxEditFillRect(ACanvasHandle: TcxEditCanvasHandle;
  {$IFDEF VCL}const {$ENDIF}R: TRect; ABrush: TBrushHandle);
function cxTextOutFlagsToDrawTextFlags(AFlags: DWORD): Integer;
procedure DrawArrow(ACanvas: TcxCanvas; AArrowSize: Integer; AContentRect: TRect;
  AArrowDirection: TcxArrowDirection; AIsDoubleArrow: Boolean;
  AIsPressed: Boolean; AColor: TColor);
procedure DrawCheckBoxText(ACanvas: TcxCanvas; AViewInfo: TcxCustomCheckBoxViewInfo);
procedure DrawCustomCheckBox(ACanvas: TcxCanvas; AViewInfo: TcxCustomCheckBoxViewInfo);
procedure DrawCustomEdit(ACanvas: TcxCanvas; AViewInfo: TcxCustomEditViewInfo;
  ADrawBackground: Boolean; ABackgroundStyle: TcxEditBackgroundPaintingStyle);
function DrawTextFlagsTocxTextOutFlags(AFlags: DWORD): Integer;
procedure DrawEditButton(ACanvas: TcxCanvas; AViewInfo: TcxCustomEditViewInfo;
  AButtonVisibleIndex: Integer);
procedure DrawEditButtonBorder(ACanvas: TcxCanvas; AViewInfo: TcxCustomEditViewInfo;
  AButtonVisibleIndex: Integer; AButtonStyle: TcxEditButtonStyle; ARect: TRect);
procedure DrawEditButtonContent(ACanvas: TcxCanvas; AViewInfo: TcxCustomEditViewInfo;
  AButtonVisibleIndex: Integer; const AContentRect: TRect; APenColor: TColor;
  ABrushColor: TColor);
procedure DrawEditPopupCloseButton(ACanvas: TcxCanvas; AViewInfo: TcxCustomEditPopupWindowViewInfo);
procedure DrawEditPopupWindowBorder(ACanvas: TcxCanvas; AViewInfo: TcxCustomEditPopupWindowViewInfo;
  var R: TRect);
procedure DrawEditPopupWindowFrame(ACanvas: TcxCanvas; AViewInfo: TcxCustomEditPopupWindowViewInfo);
procedure DrawEditText(ACanvas: TcxCanvas; AViewInfo: TcxCustomTextEditViewInfo);
procedure DrawGlyph(ACanvas: TcxCanvas; X, Y: Integer; AGlyph: TBitmap;
  AEnabled: Boolean; ABrushColor: TColor = clNone; ABackgroundBitmap: TBitmap = nil); overload;
procedure DrawGlyph(ACanvas: TcxCanvas; AImageList: TCustomImageList;
  AImageIndex: {$IFDEF DELPHI5}TImageIndex{$ELSE}Integer{$ENDIF};
  const AGlyphRect: TRect; ABrushColor: TColor; AEnabled: Boolean;
  ABackgroundBitmap: TBitmap = nil); overload;
procedure DrawMemo(ACanvas: TcxCanvas; AViewInfo: TcxCustomMemoViewInfo);
procedure DrawPopupEditPopupWindowBorder(ACanvas: TcxCanvas; AViewInfo: TcxCustomEditPopupWindowViewInfo;
  var R: TRect);
procedure DrawSizeGrip(ACanvas: TcxCanvas; const ARect: TRect;
  ACorner: TcxEditCorner; ANativeStyle: Boolean; AIsTransparent: Boolean = False);
procedure DrawSpinEdit(ACanvas: TcxCanvas; AViewInfo: TcxSpinEditViewInfo);
procedure DrawSpinEditButtonBorder(ACanvas: TcxCanvas; AViewInfo: TcxSpinEditViewInfo;
  AButtonVisibleIndex: Integer; AButtonStyle: TcxEditButtonStyle; ARect: TRect);
procedure DrawSpinEditButtonContent(ACanvas: TcxCanvas; AViewInfo: TcxSpinEditViewInfo;
  AButtonVisibleIndex: Integer; AContentRect: TRect; APenColor: TColor;
  ABrushColor: TColor);
procedure DrawTextEdit(ACanvas: TcxCanvas; AViewInfo: TcxCustomTextEditViewInfo);
function GetArrowSize(const AContentSize: TSize; AArrowDirection: TcxArrowDirection): TSize;
function GetCheckBoxContentSize(ACanvas: TcxCanvas; AViewData: TcxCustomEditViewData;
  const AText: TCaption; ADrawTextFlags: Integer; AIsInplace: Boolean;
  const APEditSizeProperties: PcxEditSizeProperties; ACorrectWidth: Boolean = True): TSize;
function GetCustomEditSize(ACanvas: TcxCanvas; AViewData: TcxCustomEditViewData;
  AIsInplace: Boolean; APEditSizeProperties: PcxEditSizeProperties): TSize;
function GetEditButtonsContentVerticalOffset(ACanvas: TcxCanvas;
  AViewInfo: TcxCustomEditViewInfo): Integer;
function GetEditCheckSize(ACanvas: TcxCanvas; AViewData: TcxCustomCheckBoxViewData;
  AViewInfo: TcxCustomCheckBoxViewInfo): TSize;
function GetTextEditContentSize(ACanvas: TcxCanvas; AViewData: TcxCustomEditViewData;
  const AText: TCaption;  ADrawTextFlags: DWORD; const APEditSizeProperties:
  PcxEditSizeProperties; ACorrectWidth: Boolean = True): TSize;
function GetTextEditContentSizeCorrection(AViewData: TcxCustomEditViewData): TSize;
function GetEditBorderExtent(AViewData: TcxCustomEditViewData): TRect;
function GetEditBorderWidth(ABorderStyle: TcxEditBorderStyle): Integer;
function GetEditButtonsExtent(ACanvas: TcxCanvas; AViewData: TcxCustomEditViewData): TRect;
{$IFDEF VCL}
function GetEditButtonRegion(ACanvas: TcxCanvas; AViewInfo: TcxEditButtonViewInfo): TcxRegion;
{$ENDIF}
procedure GetEditColorSettings(AViewData: TcxCustomEditViewData; AViewInfo: TcxCustomEditViewInfo; var FillColor, TextColor: TColor);
function GetEditPopupWindowClientEdgeWidth(AViewInfo: TcxCustomEditPopupWindowViewInfo): Integer;
function GetEditPopupWindowFrameExtent(AViewInfo: TcxCustomEditPopupWindowViewInfo): TRect;
function GetEditPopupWindowBorderWidth(AViewInfo: TcxCustomEditPopupWindowViewInfo; AIncludeClientEdge: Boolean): Integer;
function GetEditPopupWindowOwnerControlBounds(AViewInfo: TcxCustomEditViewInfo): TRect;
function GetEditPopupWindowSysPanelDefaultHeight(AViewInfo: TcxCustomEditPopupWindowViewInfo): Integer;
function GetEditVisibleBounds(AViewInfo: TcxCustomEditViewInfo; const ABounds: TRect): TRect;
function GetMemoDrawTextOffset(AViewData: TcxCustomMemoViewData): TRect;
function GetTextEditDrawTextOffset(AViewData: TcxCustomEditViewData): TRect; overload;
function GetTextEditDrawTextOffset(AAlignment: TAlignment; AIsInplace: Boolean): TRect; overload;
procedure InternalFillRect(ACanvas: TcxCanvas; const AOuterRect, AInternalRect: TRect;
  ABrush: TBrushHandle);
procedure InternalPolyLine(ACanvas: TcxCanvas; const Points: array of TPoint;
  AColor: TColor; AOrtoDrawing: Boolean = False);
function IsShadowDrawingNeeded(AViewData: TcxCustomEditViewData): Boolean;
procedure PrepareTextEditDrawTextFlags(ACanvas: TcxCanvas; AViewData: TcxCustomTextEditViewData;
  AViewInfo: TcxCustomTextEditViewInfo);
function RemoveAccelChars(const S: TCaption): TCaption;
procedure SetEditPopupWindowShadowRegion(APopupWindow: TcxCustomEditPopupWindow);
procedure SetEditWindowShadowRegion(AViewInfo: TcxCustomEditViewInfo; AEditWindowHandle: TcxHandle);
function VerifyBitmap(ABitmap: TBitmap): Boolean;

implementation

uses
{$IFDEF VCL}
  dxUxTheme, dxThemeConsts,
{$ENDIF}
  cxEditTextUtils;

const
  cxEditBorderWidthA: array [TcxEditBorderStyle] of Integer = (0, 1, 2, 2, 2, 1);
  cxEditButtonContentVerticalOffset: array [TcxEditButtonStyle] of Integer = (
    0, 4, 2, 2, 2, 2
  );
  cxEditButtonTotalBorderExtentA: array [TcxEditButtonStyle] of Integer = (2, 4, 3, 3, 2, 2);
  cxEditPopupClientEdgeWidthA: array[TcxEditPopupBorderStyle] of Integer = (0, 2, 2, 1);
  cxEditPopupWindowFrameWidthA: array[TcxEditPopupBorderStyle] of Integer = (0, 1, 4, 2);

  cxEditDefaultBorderExtent: TRect = (
    Left: cxEditMaxBorderWidth;
    Top: cxEditMaxBorderWidth;
    Right: cxEditMaxBorderWidth;
    Bottom: cxEditMaxBorderWidth
  );

{$IFDEF VCL}
  CloseButtonNativeStateMap: array [TcxButtonState] of Integer =
    (TC_NONE, CBS_NORMAL, CBS_HOT, CBS_PUSHED, CBS_DISABLED);
{$ENDIF}

type
  TcxSpinEditUltraFlatButtonPosition = (sufbpLeftMost, sufbpMiddle, sufbpRightMost,
    sufbpMiddleTop, sufbpMiddleBottom, sufbpRightTop, sufbpRightBottom);
  TcxSpinEditFlatButtonPosition = (sfbpLeftSide, sfbpLeftSideRightMost,
    sfbpRightSide, sfbpRightSideLeftMost, sfbpMiddleTop, sfbpMiddleBottom,
    sfbpRightTop, sfbpRightBottom);

  TCanvasAccess = class(TCanvas);
  TcxCustomCheckBoxPropertiesAccess = class(TcxCustomCheckBoxProperties);
  TcxCustomEditPopupWindowAccess = class(TcxCustomEditPopupWindow);
  TcxCustomEditPropertiesAccess = class(TcxCustomEditProperties);
  TcxCustomEditStyleAccess = class(TcxCustomEditStyle);
  TcxCustomEditViewDataAccess = class(TcxCustomEditViewData);
  TcxCustomMemoPropertiesAccess = class(TcxCustomMemoProperties);
  TcxCustomTextEditPropertiesAccess = class(TcxCustomTextEditProperties);
  TcxCustomTextEditViewDataAccess = class(TcxCustomTextEditViewData);

var
  FCheckBoxClientSize: TSize;

{$IFDEF VCL}
function AreVisualStylesMustBeUsed(NativeEditStyle: Boolean; AThemedObjectType: TdxThemedObjectType): Boolean;
begin
  Result := NativeEditStyle and (OpenTheme(AThemedObjectType) <> 0);
end;
{$ENDIF}

procedure DrawArrow(ACanvas: TcxCanvas; AArrowSize: Integer; AContentRect: TRect;
  AArrowDirection: TcxArrowDirection; AIsDoubleArrow: Boolean;
  AIsPressed: Boolean; AColor: TColor);
var
  AArrowBrush: TBrushHandle;
  AArrowRect: TRect;

  procedure InternalDrawArrow;
  var
    I: Integer;
    R: TRect;
  begin
    case AArrowDirection of
      adLeft:
        begin
          with AArrowRect do
            R := Rect(Left, Top + AArrowSize - 1, Left + 1, Top + AArrowSize);
          with R do
            for I := 1 to AArrowSize do
            begin
              cxEditFillRect(ACanvas.Handle, R, AArrowBrush);
              Inc(Left);
              Dec(Top);
              Inc(Right);
              Inc(Bottom);
            end;
          Inc(AArrowRect.Left, AArrowSize);
        end;
      adRight:
        begin
          with AArrowRect do
            R := Rect(Left, Top, Left + 1, Bottom);
          with R do
            for I := 1 to AArrowSize do
            begin
              cxEditFillRect(ACanvas.Handle, R, AArrowBrush);
              Inc(Left);
              Inc(Top);
              Inc(Right);
              Dec(Bottom);
            end;
          Inc(AArrowRect.Left, AArrowSize);
        end;
      adUp:
        begin
          with AArrowRect do
            R := Rect(Left + AArrowSize - 1, Top, Left + AArrowSize, Top + 1);
          with R do
            for I := 1 to AArrowSize do
            begin
              cxEditFillRect(ACanvas.Handle, R, AArrowBrush);
              Dec(Left);
              Inc(Top);
              Inc(Right);
              Inc(Bottom);
            end;
          Inc(AArrowRect.Top, AArrowSize);
        end;
      adDown:
        begin
          with AArrowRect do
            R := Rect(Left, Top, Right, Top + 1);
          with R do
            for I := 1 to AArrowSize do
            begin
              cxEditFillRect(ACanvas.Handle, R, AArrowBrush);
              Inc(Left);
              Inc(Top);
              Dec(Right);
              Inc(Bottom);
            end;
          Inc(AArrowRect.Top, AArrowSize);
        end;
    end;
  end;

var
  AArrowRectSize: TSize;
  I: Integer;
begin
  if AArrowDirection in [adLeft, adRight] then
  begin
    AArrowRectSize.cx := AArrowSize * (1 + Integer(AIsDoubleArrow));
    AArrowRectSize.cy := AArrowSize * 2 - 1;
  end
  else
  begin
    AArrowRectSize.cx := AArrowSize * 2 - 1;
    AArrowRectSize.cy := AArrowSize * (1 + Integer(AIsDoubleArrow));
  end;

  with AContentRect do
  begin
    AArrowRect.Left := Left + (Right - Left - AArrowRectSize.cx) div 2;
    if AIsPressed(* and Odd(Right - Left - AArrowRectSize.cx)*) then
      Inc(AArrowRect.Left);
    AArrowRect.Right := AArrowRect.Left + AArrowRectSize.cx;

    AArrowRect.Top := Top + (Bottom - Top - AArrowRectSize.cy) div 2;
    if AIsPressed(* and Odd(Bottom - Top - AArrowRectSize.cy)*) then
      Inc(AArrowRect.Top);
    AArrowRect.Bottom := AArrowRect.Top + AArrowRectSize.cy;
  end;

  AArrowBrush := GetSolidBrush(ACanvas, AColor);
  for I := 0 to Integer(AIsDoubleArrow) do
    InternalDrawArrow;
end;

procedure CalculateCheckBoxViewInfo(AViewData: TcxCustomCheckBoxViewData; AViewInfo:
  TcxCustomCheckBoxViewInfo; AIsMouseEvent: Boolean);
begin
  with AViewInfo do
  begin
    CalculateCustomEditViewInfo(AViewData, AViewInfo, AIsMouseEvent);
    TextRect := ClientRect;
    ExtendRect(TextRect, GetTextEditDrawTextOffset(AViewData));
  end;
end;

{$IFDEF VCL}
procedure CalculateCheckBoxClientSize;
var
  B: Windows.TBitmap;
  HB: HBITMAP;
begin
  HB := LoadBitmap(0, PChar(OBM_CHECKBOXES));
  GetObject(HB, SizeOf(Windows.TBitmap), @B);
  DeleteObject(HB);
  FCheckBoxClientSize.cx := B.bmWidth div 4;
  FCheckBoxClientSize.cy := B.bmHeight div 3;
end;
{$ELSE}
procedure CalculateCheckBoxClientSize;
begin
  FCheckBoxClientSize.cx := 13;
  FCheckBoxClientSize.cy := 13;
end;
{$ENDIF}

(*procedure DrawArrow(ACanvas: TcxCanvas; AArrowDirection: TcxArrowDirection;
  X, Y, AArrowSize: Integer; AColor: TColor);
var
  A, DY, I, L: Integer;
  ABrush: TBrushHandle;
begin
  A := AArrowSize div 2;
  with ACanvas do
  begin
    ABrush := GetSolidBrush(ACanvas, AColor);
    if AArrowDirection = adUp then
    begin
      Y := Y + A;
      DY := -1;
    end
    else
      DY := 1;
    L := AArrowSize;
    Inc(A);
    for I := 1 to A do
    begin
      cxEditFillRect(ACanvas.Handle, Rect(X, Y, X + L, Y + 1), ABrush);
      Y := Y + DY;
      L := L - 2;
      Inc(X);
    end;
  end;
end;*)

procedure DrawGlyph(ACanvas: TcxCanvas; X, Y: Integer; AGlyph: TBitmap;
  AEnabled: Boolean; ABrushColor: TColor = clNone; ABackgroundBitmap: TBitmap = nil);

{$IFDEF VCL}
  procedure InternalDrawGlyph1;
  var
    APrevBrushStyle: TBrushStyle;
    R: TRect;
  begin
    with ACanvas do
    begin
      APrevBrushStyle := Brush.Style;
      if (ABackgroundBitmap <> nil) or (ABrushColor = clNone) then
        Brush.Style := bsClear
      else
        Brush.Color := ABrushColor;
      if ABackgroundBitmap = nil then
        ACanvas.Canvas.BrushCopy(Bounds(X, Y, AGlyph.Width, AGlyph.Height), AGlyph,
          Rect(0, 0, AGlyph.Width, AGlyph.Height), AGlyph.TransparentColor)
      else
      begin
        R := Rect(0, 0, AGlyph.Width, AGlyph.Height);
        ABackgroundBitmap.Canvas.BrushCopy(R, AGlyph, R, AGlyph.TransparentColor);
        ACanvas.Draw(X, Y, ABackgroundBitmap);
      end;
      Brush.Style := APrevBrushStyle;
    end;
  end;
{$ENDIF}

  procedure InternalDrawGlyph2;
  var
    ABitmap: TBitmap;
    AImageList: TImageList;
  begin
    ABitmap := nil;
    AImageList := nil;
    try
      AImageList := TImageList.Create(nil);
      AImageList.Width := AGlyph.Width;
      AImageList.Height := AGlyph.Height;
      if (ABackgroundBitmap = nil) and (ABrushColor <> clNone) then
      begin
        ABitmap := TBitmap.Create;
        ABitmap.Width := AImageList.Width;
        ABitmap.Height := AImageList.Height;
        with ABitmap.Canvas do
{$IFDEF VCL}
          cxEditFillRect(Handle, Rect(0, 0, ABitmap.Width, ABitmap.Height),
            GetSolidBrush(ABitmap.Canvas, ABrushColor));
{$ELSE}
        begin
          Brush.Color := ABrushColor;
          FillRect(Rect(0, 0, ABitmap.Width, ABitmap.Height));
        end;
{$ENDIF}
      end;
      AImageList.AddMasked(AGlyph, AGlyph.TransparentColor);
        AImageList.Draw(ABitmap.Canvas, 0, 0, 0{$IFNDEF VCL}, itImage{$ENDIF}, AEnabled);
      if ABitmap <> nil then
      begin
        AImageList.Draw(ABitmap.Canvas, 0, 0, 0{$IFNDEF VCL}, itImage{$ENDIF}, AEnabled);
        ACanvas.Draw(X, Y, ABitmap);
      end
      else
        if ABackgroundBitmap = nil then
          AImageList.Draw(ACanvas.Canvas, X, Y, 0{$IFNDEF VCL}, itImage{$ENDIF}, AEnabled)
        else
        begin
          AImageList.Draw(ABackgroundBitmap.Canvas, 0, 0, 0{$IFNDEF VCL}, itImage{$ENDIF}, AEnabled);
          ACanvas.Draw(X, Y, ABackgroundBitmap);
        end;
    finally
      if ABitmap <> nil then
        ABitmap.Free;
      if AImageList <> nil then
        AImageList.Free;
    end;
  end;

begin
{$IFDEF VCL}
  if AEnabled then
    InternalDrawGlyph1
  else
{$ENDIF}
    InternalDrawGlyph2;
end;

procedure DrawGlyph(ACanvas: TcxCanvas; AImageList: TCustomImageList;
  AImageIndex: {$IFDEF DELPHI5}TImageIndex{$ELSE}Integer{$ENDIF};
  const AGlyphRect: TRect; ABrushColor: TColor; AEnabled: Boolean;
  ABackgroundBitmap: TBitmap = nil);
var
  ABitmap: TBitmap;
begin
  ABitmap := nil;
  try
    if ABackgroundBitmap = nil then
    begin
      ABitmap := TBitmap.Create;
      ABitmap.Width := AImageList.Width;
      ABitmap.Height := AImageList.Height;
      with ABitmap.Canvas do
{$IFDEF VCL}
        cxEditFillRect(Handle, Rect(0, 0, ABitmap.Width, ABitmap.Height),
          GetSolidBrush(ABitmap.Canvas, ABrushColor));
{$ELSE}
      begin
        Brush.Color := ABrushColor;
        FillRect(Rect(0, 0, ABitmap.Width, ABitmap.Height));
      end;
{$ENDIF}
    end;
    if ABackgroundBitmap <> nil then
    begin
      AImageList.Draw(ABackgroundBitmap.Canvas, 0, 0, AImageIndex{$IFNDEF VCL}, itImage{$ENDIF}, AEnabled); // ??? itMask TODO
      ACanvas.Draw(AGlyphRect.Left, AGlyphRect.Top, ABackgroundBitmap);
    end else
    begin
      AImageList.Draw(ABitmap.Canvas, 0, 0, AImageIndex{$IFNDEF VCL}, itImage{$ENDIF}, AEnabled); // ??? itMask TODO
      ACanvas.Draw(AGlyphRect.Left, AGlyphRect.Top, ABitmap);
    end;
  finally
    if ABitmap <> nil then
      ABitmap.Free;
  end;
end;

procedure GetContentPosition(const AContentRect: TRect; const AContentSize: TSize;
  out X, Y: Integer; APressed: Boolean);
var
  AHorzSpace, AVertSpace: Integer;
begin
  with AContentRect do
  begin
    AHorzSpace := Right - Left - AContentSize.cx;
    AVertSpace := Bottom - Top - AContentSize.cy;
    X := Left + AHorzSpace div 2;
    Y := Top + AVertSpace div 2;
    if APressed then
    begin
      if Odd(AHorzSpace) then
        Inc(X);
      if Odd(AVertSpace) then
        Inc(Y);
    end;
  end;
end;

{$IFDEF VCL}
function GetEditState(EditViewData: TcxCustomEditViewData): Integer;
begin
  with EditViewData do
  begin
    if not Enabled then
      Result := ETS_DISABLED
    else if TcxCustomEditPropertiesAccess(Properties).ReadOnly then
      Result := ETS_READONLY
    else if Focused then
      Result := ETS_FOCUSED
    else if esHotTrack in EditState then
      Result := ETS_HOT
    else
      Result := ETS_NORMAL;
  end;
end;
{$ENDIF}

function GetPainterClass(ANativeStyle: Boolean; ALookAndFeel: TcxLookAndFeelKind):
  TcxCustomLookAndFeelPainterClass;
const
  APainterMap: array[TcxLookAndFeelKind] of TcxCustomLookAndFeelPainterClass = (
    TcxFlatLookAndFeelPainter, TcxStandardLookAndFeelPainter, TcxUltraFlatLookAndFeelPainter
  );
begin
{$IFDEF VCL}
  if ANativeStyle and AreVisualStylesAvailable then
    Result := TcxWinXPLookAndFeelPainter
  else
{$ENDIF}
    Result := APainterMap[ALookAndFeel];
end;

procedure InternalPolyLine(ACanvas: TcxCanvas; const Points: array of TPoint; AColor: TColor;
  AOrtoDrawing: Boolean = False);
var
  I: Integer;
  P1, P2: TPoint;
  ABrush: TBrushHandle;
begin
  with ACanvas do
    if AOrtoDrawing then
    begin
      ABrush := GetSolidBrush(ACanvas, AColor);
      for I := 0 to Length(Points) - 2 do
      begin
        P1 := Points[I];
        P2 := Points[I + 1];
        if P1.X = P2.X then
        begin
          Inc(P2.X);
{$IFDEF VCL}
          if P1.Y > P2.Y then
          begin
            Inc(P1.Y);
            Dec(P2.Y);
          end;
{$ENDIF}
        end
        else
        begin
          Inc(P2.Y);
{$IFDEF VCL}
          if P1.X > P2.X then
          begin
            Inc(P1.X);
            Dec(P2.X);
          end;
{$ENDIF}
        end;
        cxEditFillRect(ACanvas.Handle, Rect(P1.X, P1.Y, P2.X, P2.Y), ABrush);
      end;
      with Points[High(Points)] do
        cxEditFillRect(ACanvas.Handle, Rect(X, Y, X + 1, Y + 1), ABrush);
    end
    else
    begin
{$IFDEF KYLIX3}
      Brush.Color := AColor;
      Pen.Color := AColor;
      with Points[0] do
      begin
        MoveTo(X, Y);
        FillRect(Rect(X, Y, X + 1, Y + 1));
      end;
      for I := 1 to High(Points) do
        with Points[I] do
        begin
          LineTo(X, Y);
          FillRect(Rect(X, Y, X + 1, Y + 1));
        end;
{$ELSE}
      Pen.Color := AColor;
      Polyline(Points);
  {$IFDEF VCL}
      with Points[High(Points)] do
        Pixels[X, Y] := AColor;
  {$ELSE}
    {$IFDEF WIN32}
      {$IFDEF DELPHI7}
      with Points[High(Points)] do
        Pixels[X, Y] := AColor;
      {$ENDIF}
    {$ENDIF}
  {$ENDIF}
{$ENDIF}
    end;
end;

procedure PrepareTextRows(ACanvas: TCanvas; var TextOutData: TcxTextOutData;
  AText: PcxCaptionChar; var R: TRect; AFormat: TcxTextOutFormat; ASelStart,
  ASelLength: Integer; ASelBackgroundColor, ASelTextColor: TColor;
  AMaxLineCount: Integer = 0; ALeftIndent: Integer = 0; ARightIndent: Integer = 0);

  procedure InternalPrepareTextRows;
  var
    ATextLength: Integer;
  begin
    TextOutData.RowCount := 0;
    TextOutData.TextRows := nil;
    ATextLength := {$IFDEF VCL}StrLen(AText){$ELSE}Length(WideString(AText)){$ENDIF};
    if ATextLength = 0 then
      Exit;
    TextOutData.TextParams := cxCalcTextParams(ACanvas.Handle, AFormat);
    TextOutData.TextRect := cxPrepareRect(R, TextOutData.TextParams, ALeftIndent,
      ARightIndent);

    if not IsRectEmpty(TextOutData.TextRect) then
    begin
      TextOutData.ForceEndEllipsis := not cxMakeTextRows(ACanvas.Handle, AText, TextOutData.TextRect, TextOutData.TextParams, TextOutData.TextRows, TextOutData.RowCount, AMaxLineCount);
      if TextOutData.RowCount <> 0 then
      begin
        if (AMaxLineCount > 0) and (TextOutData.RowCount >= AMaxLineCount) then
        begin
          TextOutData.RowCount := AMaxLineCount;
          with TextOutData.TextParams do
            TextOutData.ForceEndEllipsis := TextOutData.ForceEndEllipsis and EndEllipsis and EditControl and not SingleLine;
        end
        else
          TextOutData.ForceEndEllipsis := False;

        cxPlaceTextRows(ACanvas.Handle, TextOutData.TextRect, TextOutData.TextParams, TextOutData.TextRows, TextOutData.RowCount);
        if (ASelStart < 0) or (ASelStart >= ATextLength) then
          ASelLength := 0
        else
          if (ASelLength + ASelStart) > ATextLength then
            ASelLength := ATextLength - ASelStart;

        TextOutData.SelStart := ASelStart;
        TextOutData.SelLength := ASelLength;
        TextOutData.SelBackgroundColor := ASelBackgroundColor;
        TextOutData.SelTextColor := ASelTextColor;
//        cxTextRowsOutHighlight(ACanvas.Handle, ATextRect, ATextParams, ATextRows,
//          ARowCount, ASelStart, ASelLength, AColor, ATextColor, AForceEndEllipsis);
      end;
    end;
  end;

begin
  TextOutData.Initialized := True;
{$IFDEF VCL}
  InternalPrepareTextRows;
{$ELSE}
  with TCanvasAccess(ACanvas) do
  try
    Start;
    RequiredState([csHandleValid, csFontValid]);
    InternalPrepareTextRows;
  finally
    Stop;
  end;
{$ENDIF}
end;

procedure InternalTextOut(ACanvas: TCanvas; AViewInfo: TcxCustomTextEditViewInfo;
  AText: PcxCaptionChar; var R: TRect; AFormat: TcxTextOutFormat; ASelStart,
  ASelLength: Integer; ASelBackgroundColor, ASelTextColor: TColor;
  AMaxLineCount: Integer = 0; ALeftIndent: Integer = 0; ARightIndent: Integer = 0);
begin
  if not AViewInfo.TextOutData.Initialized then
    PrepareTextRows(ACanvas, AViewInfo.TextOutData, AText, R, AFormat, ASelStart,
    ASelLength, ASelBackgroundColor, ASelTextColor, AMaxLineCount, ALeftIndent,
    ARightIndent);
  TCanvasAccess(ACanvas).RequiredState([csFontValid]);
  with AViewInfo.TextOutData do
    cxTextRowsOutHighlight(ACanvas.Handle, TextRect, TextParams, TextRows,
    RowCount, SelStart, SelLength, SelBackgroundColor, SelTextColor, ForceEndEllipsis);
end;

function VerifyBitmap(ABitmap: TBitmap): Boolean;
begin
  with ABitmap do
    Result := (ABitmap <> nil) and (not Empty) and (Width > 0) and (Height > 0);
end;

procedure CalculateCustomCheckBoxViewInfo(ACanvas: TcxCanvas; AViewData: TcxCustomCheckBoxViewData;
  AViewInfo: TcxCustomCheckBoxViewInfo);

  procedure CheckFocusRectBounds;
  begin
    with AViewInfo do
    begin
      if FocusRect.Left < TextRect.Left - 1 then
        FocusRect.Left := TextRect.Left - 1;
      if FocusRect.Top < TextRect.Top - 1 then
        FocusRect.Top := TextRect.Top - 1;
      if FocusRect.Right > TextRect.Right + 1 then
        FocusRect.Right := TextRect.Right + 1;
      if FocusRect.Bottom > TextRect.Bottom + 1 then
        FocusRect.Bottom := TextRect.Bottom + 1;

      if FocusRect.Right >= BorderRect.Right then
        FocusRect.Right := BorderRect.Right - 1;
    end;
  end;

{$IFDEF VCL}
const
  ANativeCheckBoxStateMap: array[TcxCheckBoxState, TcxEditCheckState] of Integer = (
    (CBS_UNCHECKEDNORMAL, CBS_UNCHECKEDHOT, CBS_UNCHECKEDPRESSED, CBS_UNCHECKEDDISABLED),
    (CBS_CHECKEDNORMAL, CBS_CHECKEDHOT, CBS_CHECKEDPRESSED, CBS_CHECKEDDISABLED),
    (CBS_MIXEDNORMAL, CBS_MIXEDHOT, CBS_MIXEDPRESSED, CBS_MIXEDDISABLED)
  );
  ANullValueNativeCheckBoxStateMap: array[TcxCheckBoxNullValueShowingStyle, TcxEditCheckState] of Integer = (
    (CBS_UNCHECKEDNORMAL, CBS_UNCHECKEDHOT, CBS_UNCHECKEDPRESSED, CBS_UNCHECKEDDISABLED),
    (CBS_UNCHECKEDDISABLED, CBS_UNCHECKEDDISABLED, CBS_UNCHECKEDDISABLED, CBS_UNCHECKEDDISABLED),
    (CBS_MIXEDNORMAL, CBS_MIXEDHOT, CBS_MIXEDPRESSED, CBS_MIXEDDISABLED)
  );
{$ENDIF}
begin
  with AViewInfo do
  begin
{$IFDEF VCL}
    if AreVisualStylesMustBeUsed(NativeStyle, totButton) then
      if State = cbsGrayed then
        NativeCheckBoxState := ANullValueNativeCheckBoxStateMap[NullValueShowingStyle, CheckBoxState]
      else
        NativeCheckBoxState := ANativeCheckBoxStateMap[State, CheckBoxState]
    else
      NativeCheckBoxState := TC_NONE;
{$ENDIF}

    if AViewData.Enabled then
      BackgroundColor := TcxCustomEditStyleAccess(AViewData.Style).Color
    else
      BackgroundColor := clBtnFace;

    if (Alignment <> taCenter) and not IsInplace and Focused then
      if Length(Text) = 0 then
        FillChar(FocusRect, SizeOf(FocusRect), 0)
      else
      begin
        FocusRect := TextRect;
        if not FullFocusRect then
          ACanvas.TextExtent(Text, FocusRect, DrawTextFlags);
{$IFDEF WIN32}
        InflateRect(FocusRect, 1, 1);
{$ENDIF}
{$IFDEF LINUX}
        if FullFocusRect then
        begin
          InflateRect(FocusRect, 1, 1);
          Inc(FocusRect.Left);
          if (Alignment = taLeftJustify) and TcxCustomCheckBoxPropertiesAccess(AViewData.Properties).MultiLine then
            Dec(FocusRect.Right);
        end;
{$ENDIF}
        CheckFocusRectBounds;
      end;
  end;
end;

procedure CalculateCustomEditViewInfo(AViewData: TcxCustomEditViewData;
  AViewInfo: TcxCustomEditViewInfo; AIsMouseEvent: Boolean);
var
  R: TRect;
  ABackgroundColor: TColor;
begin
  with AViewData do
  begin
    AViewInfo.NativeStyle := NativeStyle;
{$IFDEF VCL}
    if AViewInfo.NativeStyle then
      AViewInfo.EditNativeState := GetEditState(AViewData)
    else
      AViewInfo.EditNativeState := TC_NONE;
{$ENDIF}

    R := AViewInfo.Bounds;
    AViewInfo.BorderExtent := AViewData.GetBorderExtent;
    ExtendRect(R, AViewInfo.BorderExtent);
    AViewInfo.BorderRect := R;
    R := AViewInfo.Bounds;
    ExtendRect(R, GetEditBorderExtent(AViewData));
    AViewInfo.ShadowRect := R;

    if not IsInplace then
    begin
      if BorderStyle = ebsUltraFlat then
        if (esActive in EditState) or (esHotTrack in EditState) and Style.HotTrack or (IsDesigning and Enabled) then
          AViewInfo.BorderColor := clHighlight
        else
          AViewInfo.BorderColor := clBtnShadow
      else
        AViewInfo.BorderColor := Style.BorderColor;
    end;    
    GetEditColorSettings(AViewData, AViewInfo, ABackgroundColor, AViewInfo.TextColor);
    AViewInfo.BackgroundColor := ABackgroundColor;
    AViewInfo.PreviewMode := (Int64(ContentOffset.TopLeft) <> 0)  or (Int64(ContentOffset.BottomRight) <> 0)
  end;
end;

{$IFDEF VCL}
procedure CalculateEditButtonState(AViewInfo: TcxEditButtonViewInfo);
const
  ButtonStateA: array [Boolean, TcxEditButtonState] of Integer = (
    (PBS_DISABLED, PBS_NORMAL, PBS_PRESSED, PBS_HOT),
    (CBXS_DISABLED, CBXS_NORMAL, CBXS_PRESSED, CBXS_HOT)
  );
  ANativePartMap: array [Boolean] of Integer = (BP_PUSHBUTTON, CP_DROPDOWNBUTTON);
var
  ATheme: TTheme;
begin
  ATheme := 0;
  with AViewInfo do
  begin
    if Data.NativeStyle then
    begin
      if Data.ComboBoxStyle then
        ATheme := OpenTheme(totComboBox)
      else
        ATheme := OpenTheme(totButton);
      if ATheme <> 0 then
        Data.NativePart := ANativePartMap[Data.ComboBoxStyle]
      else
        Data.NativePart := TC_NONE;
    end
    else
      Data.NativePart := TC_NONE;

    if Data.NativePart = TC_NONE then
    begin
      Data.BackgroundPartiallyTransparent := False;
      Data.NativeState := TC_NONE;
    end else
    begin
      Data.BackgroundPartiallyTransparent := IsThemeBackgroundPartiallyTransparent(ATheme,
        Data.NativePart, Data.NativeState);
      Data.NativeState := ButtonStateA[Data.ComboBoxStyle, Data.State];
    end;
  end;
end;
{$ENDIF}

function CalculateEditDefaultButtonWidth(ACanvas: TcxCanvas; AViewInfo: TcxEditButtonViewInfo): Integer;

  function GetEditButtonTotalBorderExtent: Integer;
{$IFDEF VCL}
  var
    ATheme: TTheme;
    R, CR: TRect;
{$ENDIF}
  begin
    with AViewInfo do
{$IFDEF VCL}
      if Data.NativeStyle then
      begin
        R := Rect(0, 0, 100, 100);
        if Data.ComboBoxStyle then
        begin
          ATheme := OpenTheme(totComboBox);
          GetThemeBackgroundContentRect(ATheme, ACanvas.Handle, CP_DROPDOWNBUTTON, CBXS_NORMAL, @R, CR);
        end else
        begin
          ATheme := OpenTheme(totButton);
          GetThemeBackgroundContentRect(ATheme, ACanvas.Handle, BP_PUSHBUTTON, PBS_NORMAL, @R, CR);
        end;
        Result := CR.Left + (R.Right - R.Left - CR.Right);
      end
      else
{$ENDIF}
        Result := cxEditButtonTotalBorderExtentA[Data.Style];
  end;

var
{$IFNDEF VCL}
  AScrollBarSize: TSize;
{$ENDIF}
  AButtonTotalBorderExtent: Integer;
begin
  with AViewInfo do
  begin
{$IFDEF VCL}
    if Data.NativeStyle then
      if Data.ComboBoxStyle then
        Data.NativeStyle := AreVisualStylesMustBeUsed(Data.NativeStyle, totComboBox)
      else
        Data.NativeStyle := AreVisualStylesMustBeUsed(Data.NativeStyle, totButton);
{$ENDIF}

    AButtonTotalBorderExtent := GetEditButtonTotalBorderExtent;

    if Width > 0 then
      if Width < AButtonTotalBorderExtent then
        Result := AButtonTotalBorderExtent
      else
        Result := Width
    else
      if (Data.Kind = bkGlyph) and VerifyBitmap(Glyph) then
        Result := Glyph.Width + GetEditButtonTotalBorderExtent
      else
      begin
{$IFDEF VCL}
        Result := GetSystemMetrics(SM_CYHSCROLL);
{$ELSE}
        QStyle_scrollBarExtent(QApplication_style, @AScrollBarSize);
        Result := AScrollBarSize.cx;
{$ENDIF}
      end;
  end;
end;

procedure CalculateEditPopupWindowViewInfo(AViewInfo: TcxCustomEditPopupWindowViewInfo);

  procedure CalculateSizeGripRect;
  var
    R: TRect;
    ASizeGripSizingRegionSize: TSize;
{$IFDEF VCL}
    ASizeGripSize: TSize;
    ATheme: TTheme;
{$ENDIF}
  begin
    with AViewInfo do
    begin
      R := SizingRegionBounds;
      ASizeGripSizingRegionSize.cx := GetEditPopupWindowSysPanelDefaultHeight(AViewInfo) - 2;
      ASizeGripSizingRegionSize.cy := ASizeGripSizingRegionSize.cx;

{$IFDEF VCL}
      if AreVisualStylesMustBeUsed(NativeStyle, totScrollBar) then
      begin
        ATheme := OpenTheme(totScrollBar);
        GetThemePartSize(ATheme, 0, SBP_SIZEBOX, SZB_RIGHTALIGN, nil, TS_TRUE,
          @ASizeGripSize);
        Inc(ASizeGripSize.cx, 2);
        Inc(ASizeGripSize.cy, 2);
        if ASizeGripSizingRegionSize.cx < ASizeGripSize.cx then
          ASizeGripSizingRegionSize.cx := ASizeGripSize.cx;
        if ASizeGripSizingRegionSize.cy < ASizeGripSize.cy then
          ASizeGripSizingRegionSize.cy := ASizeGripSize.cy;
      end;
{$ENDIF}

      if SizeGripCorner in [ecoTopLeft, ecoBottomLeft] then
        R.Right := R.Left + ASizeGripSizingRegionSize.cx
      else
        R.Left := R.Right - ASizeGripSizingRegionSize.cx;
      if SizeGripCorner in [ecoTopLeft, ecoTopRight] then
        R.Bottom := R.Top + ASizeGripSizingRegionSize.cy
      else
        R.Top := R.Bottom - ASizeGripSizingRegionSize.cy;
      SizeGripSizingRect := R;

      if SizeGripCorner in [ecoTopLeft, ecoBottomLeft] then
        Inc(R.Left, 2)
      else
        Dec(R.Right, 2);
      if SizeGripCorner in [ecoTopLeft, ecoTopRight] then
        Inc(R.Top, 2)
      else
        Dec(R.Bottom, 2);
      SizeGripRect := R;
    end;
  end;

  procedure CalculateCloseButtonRect;
  var
    R: TRect;
    ACloseButtonSize: TSize;
{$IFDEF VCL}
    ATheme: TTheme;
{$ENDIF}
  begin
    with AViewInfo do
      if CloseButton then
      begin
        R := SizingRegionBounds;

{$IFDEF VCL}
        if CloseButtonNativeState <> TC_NONE then
        begin
          ATheme := OpenTheme(totWindow);
          GetThemePartSize(ATheme, 0, WP_CLOSEBUTTON, CBS_NORMAL, nil, TS_TRUE,
            @ACloseButtonSize);
        end else
{$ENDIF}
        begin
          ACloseButtonSize.cy := GetEditPopupWindowSysPanelDefaultHeight(AViewInfo) - 4;
          ACloseButtonSize.cx := ACloseButtonSize.cy;
        end;


{$IFDEF VCL}
        if CloseButtonNativeState = TC_NONE then
{$ENDIF}
          if SizeGripCorner in [ecoTopLeft, ecoBottomLeft] then
            Dec(R.Right, 2)
          else
            Inc(R.Left, 2);

          if SizeGripCorner in [ecoTopLeft, ecoBottomLeft] then
          begin
            R.Left := R.Right - ACloseButtonSize.cx;
            OffsetRect(R, -1, 0);
          end else
          begin
            R.Right := R.Left + ACloseButtonSize.cx;
            OffsetRect(R, 1, 0);
          end;

{$IFDEF VCL}
        if CloseButtonNativeState <> TC_NONE then
          if SizeGripCorner in [ecoTopLeft, ecoTopRight] then
          begin
            Inc(R.Top, (SysPanelHeight - ACloseButtonSize.cy) div 2);
            R.Bottom := R.Top + ACloseButtonSize.cy;
          end else
          begin
            Dec(R.Bottom, (SysPanelHeight - ACloseButtonSize.cy) div 2);
            R.Top := R.Bottom - ACloseButtonSize.cy;
          end
        else
{$ENDIF}
          if SizeGripCorner in [ecoTopLeft, ecoTopRight] then
          begin
            Inc(R.Top, 2);
            R.Bottom := R.Top + ACloseButtonSize.cy;
          end else
          begin
            Dec(R.Bottom, 2);
            R.Top := R.Bottom - ACloseButtonSize.cy;
          end;
        CloseButtonRect := R;
      end
      else
        FillChar(CloseButtonRect, SizeOf(CloseButtonRect), 0);
  end;


var
  AClientExtent: TRect;
  ASizingFrameWidth: Integer;
begin
  with AViewInfo do
  begin
    AClientExtent := GetEditPopupWindowFrameExtent(AViewInfo);
    ClientRect := Bounds;
    OffsetRect(ClientRect, -Bounds.Left, -Bounds.Top);
    SizingRegionBounds := ClientRect;
    ExtendRect(ClientRect, AClientExtent);

    ASizingFrameWidth := GetEditPopupWindowBorderWidth(AViewInfo, not SysPanelStyle);
    InflateRect(SizingRegionBounds, -ASizingFrameWidth, -ASizingFrameWidth);
    if Shadow then
    begin
      Dec(SizingRegionBounds.Bottom, cxEditShadowWidth);
      Dec(SizingRegionBounds.Right, cxEditShadowWidth);
    end;

{$IFDEF VCL}
    if SysPanelStyle and AreVisualStylesMustBeUsed(NativeStyle, totWindow) then
      CloseButtonNativeState := CloseButtonNativeStateMap[CloseButtonState]
    else
      CloseButtonNativeState := TC_NONE;
{$ENDIF}

    if SysPanelStyle then
    begin
      if Sizeable then
        CalculateSizeGripRect;
      CalculateCloseButtonRect;
    end;
  end;
end;

{$IFDEF VCL}
procedure CalculateSpinEditViewInfo(AViewData: TcxSpinEditViewData;
  AViewInfo: TcxSpinEditViewInfo);
const
  AButtonNativeStateMap: array [TcxEditButtonState] of Integer =
    (UPS_DISABLED, UPS_NORMAL, UPS_PRESSED, UPS_HOT);
var
  ATheme: TTheme;
  I: Integer;
begin
  if Length(AViewInfo.ButtonsInfo) = 0 then
    Exit;
  with AViewInfo do
    if NativeStyle and AreVisualStylesMustBeUsed(NativeStyle, totSpin) then
    begin
      ATheme := OpenTheme(totSpin);
      for I := 0 to Length(AViewInfo.ButtonsInfo) - 1 do
      begin
        ButtonsInfo[I].Data.NativeState := AButtonNativeStateMap[ButtonsInfo[I].Data.State];
        ButtonsInfo[I].Data.BackgroundPartiallyTransparent := IsThemeBackgroundPartiallyTransparent(
          ATheme, ButtonsInfo[I].Data.NativePart, ButtonsInfo[I].Data.NativeState);
      end
    end
    else
      for I := 0 to Length(AViewInfo.ButtonsInfo) - 1 do
        ButtonsInfo[I].Data.NativeState := TC_NONE;
end;
{$ENDIF}

procedure CalculateTextEditViewInfo(ACanvas: TcxCanvas; AViewData: TcxCustomTextEditViewData;
  AViewInfo: TcxCustomTextEditViewInfo; AIsMouseEvent: Boolean);
begin
  with AViewInfo do
  begin
    TextRect := ClientRect;
    ExtendRect(TextRect, AViewData.GetDrawTextOffset);
  end;
end;

procedure cxEditFillRect(ACanvasHandle: TcxEditCanvasHandle;
  {$IFDEF VCL}const {$ENDIF}R: TRect; ABrush: TBrushHandle);
begin
{$IFDEF VCL}
  Windows.FillRect(ACanvasHandle, R, ABrush);
{$ELSE}
  QPainter_fillRect(ACanvasHandle, @R, ABrush);
{$ENDIF}
end;

function cxTextOutFlagsToDrawTextFlags(AFlags: DWORD): Integer;
begin
  Result := 0;
  if AFlags and CXTO_LEFT <> 0 then
    Result := Result or cxAlignLeft;
  if AFlags and CXTO_CENTER_HORIZONTALLY <> 0 then
    Result := Result or cxAlignHCenter;
  if AFlags and CXTO_RIGHT <> 0 then
    Result := Result or cxAlignRight;
  if AFlags and CXTO_TOP <> 0 then
    Result := Result or cxAlignTop;
  if AFlags and CXTO_CENTER_VERTICALLY <> 0 then
    Result := Result or cxAlignVCenter;
  if AFlags and CXTO_BOTTOM <> 0 then
    Result := Result or cxAlignBottom;
  if AFlags and CXTO_SINGLELINE <> 0 then
    Result := Result or cxSingleLine;
end;

procedure DrawCheckBoxText(ACanvas: TcxCanvas; AViewInfo: TcxCustomCheckBoxViewInfo);
{$IFDEF LINUX}
var
  APrevClipRegion: TcxRegion;
{$ENDIF}
begin
  with AViewInfo do
  begin
    ACanvas.Font := Font;
    ACanvas.Font.Color := TextColor;
    ACanvas.Brush.Style := bsClear;
{$IFDEF LINUX}
    APrevClipRegion := ACanvas.GetClipRegion;
    ACanvas.SetClipRegion(TcxRegion.Create(TextRect), roSet);
{$ENDIF}
    ACanvas.DrawText(Text, TextRect, DrawTextFlags, Enabled);
{$IFDEF LINUX}
    ACanvas.SetClipRegion(APrevClipRegion, roSet);
{$ENDIF}
    ACanvas.Brush.Style := bsSolid;
  end;
end;

procedure DrawCustomCheckBox(ACanvas: TcxCanvas; AViewInfo: TcxCustomCheckBoxViewInfo);
{$IFDEF VCL}
var
  ASavedDC: Integer;

  procedure ExcludeCheckBoxRegion;
  var
    ATheme: TTheme;
  begin
    ASavedDC := SaveDC(ACanvas.Handle);
    if AViewInfo.NativeCheckBoxState <> TC_NONE then
    begin
      ATheme := OpenTheme(totButton);
      if IsThemeBackgroundPartiallyTransparent(ATheme, BP_CHECKBOX,
          AViewInfo.NativeCheckBoxState) then
        Exit
    end;
    ACanvas.ExcludeClipRect(AViewInfo.CheckBoxRect);
  end;
{$ENDIF}

  procedure DrawCheckBoxGlyph;
  const
    AGlyphIndexMap: array [TcxCheckBoxState] of Integer = (0, 1, 2);
  var
    ABitmap: TBitmap;
    AGlyphIndex: Integer;
    R: TRect;
  begin
    with AViewInfo do
    begin
      AGlyphIndex := AGlyphIndexMap[State];
      if CheckBoxState = ecsPressed then
        Inc(AGlyphIndex, 3);
      while (AGlyphIndex >= CheckBoxGlyphCount) and (AGlyphIndex > 2) do
        AGlyphIndex := AGlyphIndex mod 3;

      ABitmap := TBitmap.Create;
      ABitmap.Assign(CheckBoxGlyph);
      ABitmap.Height := CheckBoxRect.Bottom - CheckBoxRect.Top;
      ABitmap.Width := CheckBoxRect.Right - CheckBoxRect.Left;

      R.Left := (CheckBoxGlyph.Width div CheckBoxGlyphCount) * AGlyphIndex;
      R.Right := R.Left + ABitmap.Width;
      R.Top := (CheckBoxGlyph.Height - ABitmap.Height) div 2;
      R.Bottom := R.Top + ABitmap.Height;
      ABitmap.Canvas.CopyRect(Rect(0, 0, ABitmap.Width, ABitmap.Height),
        CheckBoxGlyph.Canvas, R);

      ACanvas.Brush.Color := BackgroundColor;
      ACanvas.FillRect(CheckBoxRect);
      ABitmap.Transparent := True;
      ACanvas.Draw(CheckBoxRect.Left, CheckBoxRect.Top, ABitmap);
      ABitmap.Free;
    end;
  end;

  procedure DrawCheckBoxBorder;
  const
    ACheckBoxStateToButtonStateMap: array [TcxEditCheckState] of TcxButtonState =
      (cxbsNormal, cxbsHot, cxbsPressed, cxbsDisabled);
  var
    ACheckBorderOffset: Integer;
    R: TRect;
{$IFDEF VCL}
    ATheme: TTheme;
{$ENDIF}
  begin
    R := AViewInfo.CheckBoxRect;

{$IFDEF VCL}
    if AViewInfo.NativeCheckBoxState <> 0 then
    begin
      ATheme := OpenTheme(totButton);
      DrawThemeBackground(ATheme, ACanvas.Handle, BP_CHECKBOX, AViewInfo.NativeCheckBoxState, @R);
      Exit;
    end;
{$ENDIF}

    ACheckBorderOffset := cxEditMaxCheckBoxBorderWidth - cxEditBorderWidthA[AViewInfo.CheckBoxBorderStyle];
    if (ACheckBorderOffset > 0)(* and not AViewInfo.Transparent*) then
      ACanvas.FrameRect(R, AViewInfo.BackgroundColor, ACheckBorderOffset);
    InflateRect(R, -ACheckBorderOffset, -ACheckBorderOffset);
    with ACanvas do
    begin
      case AViewInfo.CheckBoxBorderStyle of
        ebsSingle:
          FrameRect(R, AViewInfo.BorderColor);
        ebsThick:
          FrameRect(R, AViewInfo.BorderColor, 2);
        ebsFlat:
          begin
            DrawEdge(R, True, True, cxBordersAll);
            InflateRect(R, -1, -1);
            FrameRect(R, clBtnFace);
          end;
        ebs3D:
          begin
            DrawEdge(R, True, True, cxBordersAll);
            InflateRect(R, -1, -1);
            DrawComplexFrame(R, {$IFDEF VCL}cl3DDkShadow{$ELSE}clShadow{$ENDIF}, clBtnFace, cxBordersAll);
          end;
        ebsUltraFlat:
          TcxUltraFlatLookAndFeelPainter.DrawButton(ACanvas, R, '', ACheckBoxStateToButtonStateMap[AViewInfo.CheckBoxState]);
      end;
    end;
  end;

  procedure DrawCheckBoxContent;
{$IFDEF VCL}
  const
    ABorder3DStyleMap: array [Boolean] of Integer = (DFCS_FLAT, 0);
    ANullValueShowingStyleMap: array [TcxCheckBoxNullValueShowingStyle] of Integer =
      (0, DFCS_INACTIVE, DFCS_CHECKED);
{$ELSE}
  const
    AButtonStateMap: array [TcxEditCheckState] of TcxButtonState =
      (cxbsNormal, cxbsHot, cxbsPressed, cxbsDisabled);
{$ENDIF}
  var
    ACheckBoxBorderWidth: Integer;
    R: TRect;
{$IFDEF VCL}
    AFlags: Integer;
    AClipRgnExists: Boolean;
    APrevClipRgn: HRGN;
{$ELSE}
    ACheckColor: TColor;
{$ENDIF}
  begin
{$IFDEF VCL}
    if AViewInfo.NativeCheckBoxState <> 0 then
      Exit;
{$ENDIF}
    with AViewInfo do
    begin
      ACheckBoxBorderWidth := cxEditMaxCheckBoxBorderWidth;
      R := CheckBoxRect;
      InflateRect(R, - ACheckBoxBorderWidth, - ACheckBoxBorderWidth);
{$IFDEF VCL}
      if not AViewInfo.Enabled then
      begin
        AFlags := DFCS_BUTTON3STATE or DFCS_PUSHED;
        if State = cbsUnchecked then
          AFlags := AFlags or DFCS_INACTIVE
        else
          AFlags := AFlags or DFCS_CHECKED;
      end else
      begin
        AFlags := 0;
        case State of
          cbsGrayed:
            AFlags := DFCS_BUTTON3STATE or ANullValueShowingStyleMap[NullValueShowingStyle];
          cbsChecked:
            AFlags := DFCS_CHECKED;
        end;
        if CheckBoxState = ecsPressed then
          AFlags := AFlags or DFCS_PUSHED;
      end;

      APrevClipRgn := CreateRectRgn(0, 0, 0, 0);
      AClipRgnExists := GetClipRgn(ACanvas.Handle, APrevClipRgn) = 1;
      IntersectClipRect(ACanvas.Handle, R.Left, R.Top, R.Right, R.Bottom);
      InflateRect(R, cxEditMaxCheckBoxBorderWidth, cxEditMaxCheckBoxBorderWidth);

      DrawFrameControl(ACanvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or AFlags or ABorder3DStyleMap[CheckBoxBorderStyle = ebs3D]);

      if AClipRgnExists then
        SelectClipRgn(ACanvas.Handle, APrevClipRgn)
      else
        SelectClipRgn(ACanvas.Handle, 0);
      DeleteObject(APrevClipRgn);
{$ELSE}
      if (CheckBoxState = ecsDisabled) or (State = cbsGrayed) then
        ACheckColor := {$IFDEF WIN32}clBtnShadow{$ENDIF}{$IFDEF LINUX}clMid{$ENDIF}
      else
        ACheckColor := clBtnText;
      TcxCustomLookAndFeelPainter.DrawCheck(ACanvas, R, AButtonStateMap[CheckBoxState],
        State <> cbsUnchecked, ACheckColor);
{$ENDIF}
    end;
  end;

begin
  with AViewInfo do
  begin
{$IFDEF VCL}
    ExcludeCheckBoxRegion;
    if not NativeStyle then
      DrawCustomEdit(ACanvas, AViewInfo, True, bpsSolid)
    else
      if ParentBackground then
        DrawThemeParentBackground(WindowHandle, ACanvas.Handle, @Bounds)
      else
        if not Transparent then
        begin
          ACanvas.Brush.Color := BackgroundColor;
          ACanvas.FillRect(Bounds);
        end;
    RestoreDC(ACanvas.Handle, ASavedDC);
    if HasGlyph then
    begin
      DrawCheckBoxGlyph;
    end else
    begin
      DrawCheckBoxBorder;
      DrawCheckBoxContent;
    end;
{$ELSE}
    if HasGlyph then
      DrawCheckBoxGlyph
    else
    begin
      DrawCheckBoxBorder;
      DrawCheckBoxContent;
    end;
    ACanvas.ExcludeClipRect(AViewInfo.CheckBoxRect);
    DrawCustomEdit(ACanvas, AViewInfo, True, bpsSolid);
{$ENDIF}

    if Alignment <> taCenter then
    begin
      DrawCheckBoxText(ACanvas, AViewInfo);
      if not IsInplace and Focused then
        ACanvas.DrawFocusRect(FocusRect);
    end;
  end;
end;

function DrawTextFlagsTocxTextOutFlags(AFlags: DWORD): Integer;
begin
  Result := 0;
  if AFlags and cxAlignLeft <> 0 then
    Result := Result or CXTO_LEFT;
  if AFlags and cxAlignHCenter <> 0 then
    Result := Result or CXTO_CENTER_HORIZONTALLY;
  if AFlags and cxAlignRight <> 0 then
    Result := Result or CXTO_RIGHT;
  if AFlags and cxAlignTop <> 0 then
    Result := Result or CXTO_TOP;
  if AFlags and cxAlignVCenter <> 0 then
    Result := Result or CXTO_CENTER_VERTICALLY;
  if AFlags and cxAlignBottom <> 0 then
    Result := Result or CXTO_BOTTOM;
  if AFlags and cxSingleLine <> 0 then
    Result := Result or CXTO_SINGLELINE;
end;

procedure InternalFillRect(ACanvas: TcxCanvas; const AOuterRect, AInternalRect: TRect;
  ABrush: TBrushHandle);
begin
  if IsRectEmpty(AOuterRect) or EqualRect(AOuterRect, AInternalRect) then
    Exit;
  if IsRectEmpty(AInternalRect) then
    cxEditFillRect(ACanvas.Handle, AOuterRect, ABrush)
  else
  begin
    cxEditFillRect(ACanvas.Handle, Rect(AOuterRect.Left, AOuterRect.Top,
      AInternalRect.Left, AOuterRect.Bottom), ABrush);
    cxEditFillRect(ACanvas.Handle, Rect(AInternalRect.Left, AOuterRect.Top,
      AInternalRect.Right, AInternalRect.Top), ABrush);
    cxEditFillRect(ACanvas.Handle, Rect(AInternalRect.Right, AOuterRect.Top,
      AOuterRect.Right, AOuterRect.Bottom), ABrush);
    cxEditFillRect(ACanvas.Handle, Rect(AInternalRect.Left, AInternalRect.Bottom,
      AInternalRect.Right, AOuterRect.Bottom), ABrush);
  end;
end;

procedure DrawCustomEdit(ACanvas: TcxCanvas; AViewInfo: TcxCustomEditViewInfo;
  ADrawBackground: Boolean; ABackgroundStyle: TcxEditBackgroundPaintingStyle);
var
  ABackgroundBrush: TBrushHandle;
  ACanvasHandle: {$IFDEF VCL}HDC{$ELSE}QPainterH{$ENDIF};

  procedure FillEditBorderRect;
  begin
    if not AViewInfo.Transparent then
      cxEditFillRect(ACanvasHandle, AViewInfo.BorderRect, ABackgroundBrush);
  end;

  procedure FillContentOffsetRegion;
  begin
    with AViewInfo do
    begin
      if Transparent or not AViewInfo.PreviewMode then
        Exit;
      cxEditFillRect(ACanvasHandle, Rect(Bounds.Left, Bounds.Top, BorderRect.Left,
        Bounds.Bottom), ABackgroundBrush);
      cxEditFillRect(ACanvasHandle, Rect(BorderRect.Left, Bounds.Top,
        BorderRect.Right, BorderRect.Top), ABackgroundBrush);
      cxEditFillRect(ACanvasHandle, Rect(BorderRect.Left, BorderRect.Bottom,
        BorderRect.Right, Bounds.Bottom), ABackgroundBrush);
      cxEditFillRect(ACanvasHandle, Rect(BorderRect.Right, Bounds.Top,
        Bounds.Right, Bounds.Bottom), ABackgroundBrush);
    end;
  end;

{$IFDEF VCL}
  procedure DrawNativeStyleEditBackground;
  var
    AContentRect: TRect;
    ATheme: TTheme;
    R: TRect;
    ASavedDC: Integer;
  begin
    with AViewInfo do
      if IsInplace then
      begin
        if not Transparent then
          cxEditFillRect(ACanvasHandle, Bounds, ABackgroundBrush);
      end else
      begin
        R := Bounds;
        ATheme := OpenTheme(totEdit);
        ASavedDC := SaveDC(ACanvasHandle);
        case ABackgroundStyle of
          bpsSolid:
            GetThemeBackgroundContentRect(ATheme, ACanvasHandle, EP_EDITTEXT,
              EditNativeState, @R, AContentRect);
          bpsComboEdit:
            begin
              AContentRect := R;
              InflateRect(AContentRect, -(cxEditMaxBorderWidth + 1),
                -(cxEditMaxBorderWidth + 1));
              AContentRect.Right := ClientRect.Right - 1;
            end;
          bpsComboListEdit:
            AContentRect := ClientRect;
        end;
        ACanvas.ExcludeClipRect(AContentRect);
        DrawThemeBackground(ATheme, ACanvasHandle, EP_EDITTEXT, EditNativeState, @R);
        RestoreDC(ACanvasHandle, ASavedDC);
        if not Transparent and not ADrawBackground and (ABackgroundStyle <> bpsComboListEdit) then
        begin
          InternalFillRect(ACanvas, AContentRect, BorderRect, ABackgroundBrush);
          AContentRect := BorderRect;
        end;
        if not AViewInfo.Transparent then
          cxEditFillRect(ACanvasHandle, AContentRect, ABackgroundBrush);
      end;
  end;
{$ENDIF}

  procedure DrawUsualEditBackground;
  var
    R, R1: TRect;
    ABorderWidth: Integer;
  begin
    with AViewInfo do
    begin
      R := BorderRect;
      ABorderWidth := GetEditBorderWidth(BorderStyle);
      Dec(R.Left, ABorderWidth);
      Dec(R.Top, ABorderWidth);
      if bRight in Edges then Inc(R.Right, ABorderWidth);
      if bBottom in Edges then Inc(R.Bottom, ABorderWidth);
      if Shadow then
        DrawContainerShadow(ACanvas, R);
      if not(bRight in Edges) then Inc(R.Right, ABorderWidth);
      if not(bBottom in Edges) then Inc(R.Bottom, ABorderWidth);
      if BorderStyle <> ebsNone then
      begin
        R1 := R;
        case BorderStyle of
          ebsSingle, ebsThick:
            ACanvas.FrameRect(R1, BorderColor, ABorderWidth);
          ebsFlat:
            begin
              ACanvas.DrawEdge(R1, True, True, Edges);
              InflateRect(R1, -1, -1);
              ACanvas.FrameRect(R1, {$IFDEF LINUX}cl3DLight{$ELSE}clBtnFace{$ENDIF});
            end;
          ebs3D:
            begin
              ACanvas.DrawEdge(R1, True, True, Edges);
              InflateRect(R1, -1, -1);
              ACanvas.DrawComplexFrame(R1, {$IFDEF VCL}cl3DDkShadow{$ELSE}clShadow{$ENDIF}, cl3DLight, Edges);
            end;
        end;
      end;
      if IsInplace then
      begin
        if not Transparent then
          if ADrawBackground then
            cxEditFillRect(ACanvasHandle, Bounds, ABackgroundBrush)
          else
            FillContentOffsetRegion;
      end
      else
        if ADrawBackground then
          FillEditBorderRect;
    end;
  end;

  procedure DrawEditBackground;
  begin
    with AViewInfo do
{$IFDEF VCL}
      if NativeStyle then
        DrawNativeStyleEditBackground
      else
{$ENDIF}
        DrawUsualEditBackground;
  end;

var
  ACount: Integer;
  I: Integer;
{$IFNDEF USETEMPBITMAP}
  AButtonInfo: TcxEditButtonViewInfo;
  AClipRegion: TcxRegion;
  {$IFDEF VCL}
  ASavedDC: Integer;
  {$ENDIF}
{$ENDIF}
begin
  ABackgroundBrush := GetSolidBrush(ACanvas, AViewInfo.BackgroundColor);
//  if AViewInfo.BackgroundBrush = cxEmptyBrush then
//    AViewInfo.BackgroundBrush := GetSolidBrush(ACanvas, AViewInfo.BackgroundColor);
//  ABackgroundBrush := AViewInfo.BackgroundBrush;
  ACanvasHandle := ACanvas.Handle;
  ACount := Length(AViewInfo.ButtonsInfo);
{$IFDEF VCL}
  {$IFNDEF USETEMPBITMAP}
  ASavedDC := 0;
  if (ACount > 0) and not AViewInfo.ButtonsInfo[0].Data.BackgroundPartiallyTransparent then
  begin
    ASavedDC := SaveDC(ACanvasHandle);
    with AViewInfo do
      for I := 0 to ACount - 1 do
        ACanvas.ExcludeClipRect(ButtonsInfo[I].VisibleBounds);
  end;
  DrawEditBackground;
  if ACount > 0 then
  begin
    if ASavedDC <> 0 then
      RestoreDC(ACanvasHandle, ASavedDC);
    with AViewInfo do
      for I := 0 to ACount - 1 do
      begin
        AButtonInfo := ButtonsInfo[I];
        AButtonInfo.Data.BackgroundColor := BackgroundColor;
        AClipRegion := nil;
        if IsRectEmpty(AButtonInfo.VisibleBounds) then
          Continue;
        try
          if (AButtonInfo.Bounds.Left < BorderRect.Left) or
            (AButtonInfo.Bounds.Right > BorderRect.Right) or
            (AButtonInfo.Bounds.Top < BorderRect.Top) or
            (AButtonInfo.Bounds.Bottom > BorderRect.Bottom) then
          begin
            AClipRegion := ACanvas.GetClipRegion;
            ACanvas.IntersectClipRect(AButtonInfo.VisibleBounds);
          end;
          DrawButton(ACanvas, I);
        finally
          if AClipRegion <> nil then
            ACanvas.SetClipRegion(AClipRegion, roSet);
        end;
      end;
  end;
  {$ELSE}
  DrawEditBackground;
  with AViewInfo do
    for I := 0 to ACount - 1 do
      DrawButton(ACanvas, I);
  {$ENDIF}
{$ELSE}
  AClipRegion := nil;
  if ACount > 0 then
  begin
    AClipRegion := ACanvas.GetClipRegion;
    with AViewInfo do
      for I := 0 to ACount - 1 do
        ACanvas.ExcludeClipRect(ButtonsInfo[I].VisibleBounds);
  end;

  DrawEditBackground;

  if ACount > 0 then
  begin
    if AClipRegion <> nil then
      ACanvas.SetClipRegion(AClipRegion, roSet);
    with AViewInfo do
      for I := 0 to ACount - 1 do
      begin
        AButtonInfo := ButtonsInfo[I];
        if IsRectEmpty(AButtonInfo.VisibleBounds) then
          Continue;
        AButtonInfo.Data.BackgroundColor := BackgroundColor;
        AClipRegion := nil;
        try
          if (AButtonInfo.Bounds.Left < BorderRect.Left) or
            (AButtonInfo.Bounds.Right > BorderRect.Right) then
          begin
            AClipRegion := ACanvas.GetClipRegion;
            ACanvas.IntersectClipRect(AButtonInfo.VisibleBounds);
          end;
          DrawButton(ACanvas, I);
        finally
          if AClipRegion <> nil then
            ACanvas.SetClipRegion(AClipRegion, roSet);
        end;
      end;
  end;
{$ENDIF}
end;

procedure DrawEditButton(ACanvas: TcxCanvas; AViewInfo: TcxCustomEditViewInfo;
  AButtonVisibleIndex: Integer);
var
  AButtonStyle: TcxEditButtonStyle;
begin
  with AViewInfo.ButtonsInfo[AButtonVisibleIndex] do
  begin
    AButtonStyle := Data.Style;
{$IFDEF VCL}
    if Data.NativePart = TC_NONE then
{$ENDIF}
      if (Data.State in [ebsPressed, ebsSelected]) and (AButtonStyle = btsSimple) then
        AButtonStyle := btsFlat;
    AViewInfo.DrawButtonBorder(ACanvas, AButtonVisibleIndex, AButtonStyle, Bounds);
  end;
end;

procedure DrawEditButtonBorder(ACanvas: TcxCanvas; AViewInfo: TcxCustomEditViewInfo;
  AButtonVisibleIndex: Integer; AButtonStyle: TcxEditButtonStyle; ARect: TRect);
var
  AButtonViewInfo: TcxEditButtonViewInfo;

  procedure Draw3DButton;
  var
    ABrushColor: TColor;
  begin
    with AButtonViewInfo, ACanvas do
    begin
      if (AButtonViewInfo.Data.State = ebsDisabled) or not AButtonViewInfo.Data.Transparent then
        ABrushColor := clBtnFace
      else
        ABrushColor := Data.BackgroundColor;

      if Data.State = ebsPressed then
      begin
        FrameRect(ARect, clBtnShadow);
        InflateRect(ARect, -1, -1);
        FrameRect(ARect, ABrushColor);
      end else
      begin
        DrawComplexFrame(ARect, {$IFDEF LINUX}clBtnHighlight{$ELSE}cl3DLight{$ENDIF}, {$IFDEF VCL}cl3DDkShadow{$ELSE}clShadow{$ENDIF});
        InflateRect(ARect, -1, -1);
        DrawComplexFrame(ARect, {$IFDEF LINUX}clBtnFace{$ELSE}clBtnHighlight{$ENDIF}, clBtnShadow);
      end;
      InflateRect(ARect, -1, -1);

      AViewInfo.DrawButtonContent(ACanvas, AButtonVisibleIndex, ARect, clBtnText, ABrushColor);
    end;
  end;

  procedure DrawFlatButton;
  var
    ABrushColor: TColor;
  begin
    with AButtonViewInfo, ACanvas do
    begin
      if (Data.State = ebsDisabled) or not Data.Transparent then
        ABrushColor := clBtnFace
      else
        ABrushColor := Data.BackgroundColor;

      InternalPolyline(ACanvas, [Point(ARect.Left, ARect.Top), Point(ARect.Left, ARect.Bottom - 1)], ABrushColor, True);
      Inc(ARect.Left);

      if Data.State = ebsPressed then
        DrawComplexFrame(ARect, clBtnShadow, clBtnHighlight)
      else
        DrawComplexFrame(ARect, clBtnHighlight, clBtnShadow);
      InflateRect(ARect, -1, -1);

      AViewInfo.DrawButtonContent(ACanvas, AButtonVisibleIndex, ARect, clBtnText, ABrushColor);
    end;
  end;

  procedure DrawSimpleButton;
  var
    ABrushColor, ALeftLineColor: TColor;
  begin
    with AButtonViewInfo, ACanvas do
    begin
      if Data.State = ebsDisabled then
        ABrushColor := clBtnFace
      else
        ABrushColor := Data.BackgroundColor;

      if not AViewInfo.Transparent then
        FrameRect(ARect, ABrushColor);
      InflateRect(ARect, -1, -1);

      if AViewInfo.Transparent and not Data.Transparent then
        ALeftLineColor := clBtnFace
      else
        ALeftLineColor := ABrushColor;
      InternalPolyLine(ACanvas, [Point(ARect.Left, ARect.Top), Point(ARect.Left,
        ARect.Bottom - 1)], ALeftLineColor, True);
      Inc(ARect.Left);

      if not Data.Transparent then
        ABrushColor := clBtnFace;
      AViewInfo.DrawButtonContent(ACanvas, AButtonVisibleIndex, ARect, clBtnText, ABrushColor);
    end;
  end;

  procedure DrawHotFlatButton;
  const
    ABrushColorA: array [TcxEditButtonState] of TColor = (
      clBtnFace, clBtnFace, clBtnText, clBtnShadow
    );
  var
    ABrushColor, APenColor: TColor;
  begin
    with AButtonViewInfo, ACanvas do
    begin
      APenColor := clBtnShadow;
      if (Data.LeftAlignment and Data.Rightmost) or (not Data.LeftAlignment and Data.Leftmost) then
        FrameRect(ARect, APenColor)
      else
        if Data.LeftAlignment then
        begin
          InternalPolyline(ACanvas, [Point(ARect.Right - 1, ARect.Top), Point(ARect.Left,
            ARect.Top), Point(ARect.Left, ARect.Bottom - 1), Point(ARect.Right - 1,
            ARect.Bottom - 1)], APenColor, True);
          Inc(ARect.Right);
        end else
        begin
          InternalPolyline(ACanvas, [Point(ARect.Left, ARect.Top), Point(ARect.Right - 1,
            ARect.Top), Point(ARect.Right - 1, ARect.Bottom - 1), Point(ARect.Left,
            ARect.Bottom - 1)], APenColor, True);
          Dec(ARect.Left);
        end;
      InflateRect(ARect, -1, -1);

      ABrushColor := ABrushColorA[Data.State];
      if (Data.State <> ebsDisabled) and (Data.Transparent) then
        ABrushColor := Data.BackgroundColor;

      if Data.State in [ebsPressed, ebsSelected] then
        if Data.Transparent and (Data.State = ebsSelected) then
          APenColor := clBtnShadow
        else
          APenColor := clWindow
      else
        APenColor := clBtnText;
      AViewInfo.DrawButtonContent(ACanvas, AButtonVisibleIndex, ARect, APenColor, ABrushColor);
    end;
  end;

  procedure DrawUltraFlatButton;
  var
    ABrushColor: TColor;
  begin
    with ACanvas, AButtonViewInfo do
    begin
      if AButtonViewInfo.Data.State = ebsDisabled then
        ABrushColor := clBtnFace
      else
        if AButtonViewInfo.Data.Transparent then
          ABrushColor := Data.BackgroundColor
        else
          if AButtonViewInfo.Data.State = ebsNormal then
            ABrushColor := clBtnFace
          else
            if AButtonViewInfo.Data.State = ebsPressed then
              ABrushColor := GetLightDownedSelColor
            else
              ABrushColor := GetLightSelColor;

      if (AButtonViewInfo.Data.State in [ebsDisabled, ebsNormal]) or Data.IsInplace then
      begin
          if not(AButtonViewInfo.Data.State in [ebsDisabled, ebsNormal]) then
            FrameRect(ARect, clHighlight)
          else
            if not AViewInfo.Transparent then
              FrameRect(ARect, Data.BackgroundColor);
        InflateRect(ARect, -1, -1);
      end else
      begin
        if Data.LeftAlignment then
        begin
          if Data.Leftmost then
            InternalPolyline(ACanvas, [Point(ARect.Left, ARect.Top), Point(ARect.Left,
              ARect.Bottom - 1)], ABrushColor, True)
          else
            InternalPolyline(ACanvas, [Point(ARect.Left, ARect.Top), Point(ARect.Left,
              ARect.Bottom - 1)], clHighlight, True);
          Inc(ARect.Left);
          InternalPolyLine(ACanvas, [Point(ARect.Right - 1, ARect.Top), Point(ARect.Right - 1,
            ARect.Bottom - 1)], clHighlight, True);
          Dec(ARect.Right);
        end else
        begin
          if Data.Rightmost then
            InternalPolyLine(ACanvas, [Point(ARect.Right - 1, ARect.Top),
              Point(ARect.Right - 1, ARect.Bottom - 1)], ABrushColor, True)
          else
            InternalPolyLine(ACanvas, [Point(ARect.Right - 1, ARect.Top),
              Point(ARect.Right - 1, ARect.Bottom - 1)], clHighlight, True);
          Dec(ARect.Right);
          InternalPolyLine(ACanvas, [Point(ARect.Left, ARect.Top), Point(ARect.Left,
            ARect.Bottom - 1)], clHighlight, True);
          Inc(ARect.Left);
        end;
        InternalPolyLine(ACanvas, [Point(ARect.Left, ARect.Top), Point(ARect.Right - 1,
          ARect.Top)], ABrushColor, True);
        Inc(ARect.Top);
        InternalPolyLine(ACanvas, [Point(ARect.Left, ARect.Bottom - 1), Point(ARect.Right - 1,
          ARect.Bottom - 1)], ABrushColor, True);
        Dec(ARect.Bottom);
      end;

      AViewInfo.DrawButtonContent(ACanvas, AButtonVisibleIndex, ARect, clBtnText, ABrushColor);
    end;
  end;

{$IFDEF VCL}
var
  ATheme: TTheme;
  AButtonContentRect: TRect;
{$ENDIF}
begin
  AButtonViewInfo := AViewInfo.ButtonsInfo[AButtonVisibleIndex];
  with AButtonViewInfo do

{$IFDEF VCL}
    if Data.NativeState <> TC_NONE then
    begin
      if Data.ComboBoxStyle then
      begin
        ATheme := OpenTheme(totComboBox);
        DrawThemeBackground(ATheme, ACanvas.Handle, CP_DROPDOWNBUTTON, Data.NativeState, @Bounds);
      end else
      begin
        ATheme := OpenTheme(totButton);
        DrawThemeBackground(ATheme, ACanvas.Handle, BP_PUSHBUTTON, Data.NativeState, @Bounds);
        GetThemeBackgroundContentRect(ATheme, ACanvas.Handle, BP_PUSHBUTTON, Data.NativeState, @Bounds, AButtonContentRect);
        AViewInfo.DrawButtonContent(ACanvas, AButtonVisibleIndex, AButtonContentRect, clBtnText, 0);
      end;
    end else
{$ENDIF}

    begin
      case AButtonStyle of
        bts3D:
          Draw3DButton;
        btsFlat:
          DrawFlatButton;
        btsSimple:
          DrawSimpleButton;
        btsHotFlat:
          DrawHotFlatButton;
        btsUltraFlat:
          DrawUltraFlatButton;
      end;
    end;
end;

procedure DrawEditButtonContent(ACanvas: TcxCanvas; AViewInfo: TcxCustomEditViewInfo;
  AButtonVisibleIndex: Integer; const AContentRect: TRect; APenColor: TColor;
  ABrushColor: TColor);
var
  AButtonViewInfo: TcxEditButtonViewInfo;

  procedure DrawEllipsis(X, Y, ASize: Integer; AColor: TColor);
  var
    ABrush: TBrushHandle;
  begin
    ABrush := GetSolidBrush(ACanvas, AColor);
    cxEditFillRect(ACanvas.Handle, Rect(X, Y, X + ASize, Y + ASize), ABrush);
    cxEditFillRect(ACanvas.Handle, Rect(X + ASize + 2, Y, X + ASize * 2 + 2, Y + ASize), ABrush);
    cxEditFillRect(ACanvas.Handle, Rect(X + ASize * 2 + 4, Y, X + ASize * 3 + 4, Y + ASize), ABrush);
  end;

var
  ABrush: TBrushHandle;
  AButtonWidth: Integer;
  AButtonHeight: Integer;
  AContentSize: TSize;
  X, Y: Integer;
  R: TRect;
{$IFDEF VCL}
  ABackgroundBitmap: TBitmap;
  ATheme: TTheme;
  R1, R2: TRect;
{$ENDIF}
begin
  if IsRectEmpty(AContentRect) then
    Exit;
  AButtonViewInfo := AViewInfo.ButtonsInfo[AButtonVisibleIndex];
  with AContentRect do
  begin
    ABrush := GetSolidBrush(ACanvas, ABrushColor);
    if (not AButtonViewInfo.Data.NativeStyle) and ((AButtonViewInfo.Data.Kind <> bkGlyph) or
        not VerifyBitmap(AButtonViewInfo.Glyph)) then
      with ACanvas do
        cxEditFillRect(ACanvas.Handle, AContentRect, ABrush);

    case AButtonViewInfo.Data.Kind of
      bkDown:
        begin
          AButtonWidth := AButtonViewInfo.Bounds.Right - AButtonViewInfo.Bounds.Left;
          if AButtonViewInfo.Data.Rightmost and (AButtonViewInfo.Data.Style = btsHotFlat){$IFDEF VCL} and
              (AButtonViewInfo.Data.NativePart = TC_NONE){$ENDIF} then
            Dec(AButtonWidth);
          if AButtonViewInfo.Data.Leftmost and (AButtonViewInfo.Data.Style = btsHotFlat){$IFDEF VCL} and
              (AButtonViewInfo.Data.NativePart = TC_NONE){$ENDIF} then
            Dec(AButtonWidth);
          Dec(AButtonWidth, Right - Left);
          R := AContentRect;
          if not Odd(AButtonWidth) then
          begin
            Dec(R.Left, AButtonWidth div 2);
            Inc(R.Right, AButtonWidth div 2);
            if AButtonViewInfo.Data.State = ebsPressed then
              OffsetRect(R, 1, 0);
          end
          else
            if AButtonViewInfo.Data.State <> ebsPressed then
            begin
              Inc(R.Right, AButtonWidth div 2);
              Dec(R.Left, AButtonWidth - AButtonWidth div 2);
            end else
            begin
              Dec(R.Left, AButtonWidth div 2);
              Inc(R.Right, AButtonWidth - AButtonWidth div 2);
            end;
          if AButtonViewInfo.Data.State = ebsPressed then
            OffsetRect(R, 0, 1);

          if AViewInfo.IsInplace then
          begin
            AButtonHeight := AButtonViewInfo.Bounds.Bottom - AButtonViewInfo.Bounds.Top;
            Dec(AButtonHeight, Bottom - Top);
            if not Odd(AButtonHeight) then
            begin
              Dec(R.Top, AButtonHeight div 2);
              Inc(R.Bottom, AButtonHeight div 2);
            end
            else
              if AButtonViewInfo.Data.State <> ebsPressed then
              begin
                Inc(R.Bottom, AButtonHeight div 2);
                Dec(R.Top, AButtonHeight - AButtonHeight div 2);
              end else
              begin
                Dec(R.Top, AButtonHeight div 2);
                Inc(R.Bottom, AButtonHeight - AButtonHeight div 2);
              end;
          end;

          if AButtonViewInfo.Data.State <> ebsDisabled then
            TcxCustomLookAndFeelPainter.DrawArrow(ACanvas, R, adDown, APenColor)
          else
          begin
            OffsetRect(R, 1, 1);
            TcxCustomLookAndFeelPainter.DrawArrow(ACanvas, R, adDown, clBtnHighlight);
            OffsetRect(R, -1, -1);
            TcxCustomLookAndFeelPainter.DrawArrow(ACanvas, R, adDown, clBtnShadow);
          end;
        end;
      bkEllipsis:
        begin
          if Right - Left < 12 then
            AContentSize.cy := 1
          else
            AContentSize.cy := 2;
          AContentSize.cx := AContentSize.cy * 3 + 4;
          GetContentPosition(AContentRect, AContentSize, X, Y, AButtonViewInfo.Data.State = ebsPressed);
          if AButtonViewInfo.Data.State <> ebsDisabled then
            DrawEllipsis(X, Y, AContentSize.cy, APenColor)
          else
          begin
            DrawEllipsis(X + 1, Y + 1, AContentSize.cy, clBtnHighlight);
            DrawEllipsis(X, Y, AContentSize.cy, clBtnShadow);
          end;
        end;
      bkGlyph:
        if VerifyBitmap(AButtonViewInfo.Glyph) then
          with AButtonViewInfo.Glyph do
          begin
            if AContentRect.Right - AContentRect.Left < Width then
              AContentSize.cx := AContentRect.Right - AContentRect.Left
            else
              AContentSize.cx := Width;
            if AContentRect.Bottom - AContentRect.Top < Height then
              AContentSize.cy := AContentRect.Bottom - AContentRect.Top
            else
              AContentSize.cy := Height;
            GetContentPosition(AContentRect, AContentSize, R.Left, R.Top, AButtonViewInfo.Data.State = ebsPressed);
            R.Right := R.Left + Width;
            if R.Right > AContentRect.Right then
              R.Right := AContentRect.Right;
            R.Bottom := R.Top + Height;
            if R.Bottom > AContentRect.Bottom then
              R.Bottom := AContentRect.Bottom;
{$IFDEF VCL}
            if AButtonViewInfo.Data.NativeState <> TC_NONE then
            begin
              ABackgroundBitmap := TBitmap.Create;
              try
                ABackgroundBitmap.Width := R.Right - R.Left;
                ABackgroundBitmap.Height := R.Bottom - R.Top;
                ATheme := OpenTheme(totButton);
                R1 := Rect(0, 0, AButtonViewInfo.Bounds.Right - AButtonViewInfo.Bounds.Left,
                  AButtonViewInfo.Bounds.Bottom - AButtonViewInfo.Bounds.Top);
                OffsetRect(R1, AButtonViewInfo.Bounds.Left - R.Left, AButtonViewInfo.Bounds.Top - R.Top);
                R2 := Rect(0, 0, R.Right - R.Left, R.Bottom - R.Top);
                DrawThemeBackground(ATheme, ABackgroundBitmap.Canvas.Handle, BP_PUSHBUTTON,
                  AButtonViewInfo.Data.NativeState, @R1, @R2);
                DrawGlyph(ACanvas, R.Left, R.Top, AButtonViewInfo.Glyph,
                  AButtonViewInfo.Data.State <> ebsDisabled, clNone, ABackgroundBitmap);
              finally
                ABackgroundBitmap.Free;
              end;
            end else
{$ENDIF}
            begin
              InternalFillRect(ACanvas, AContentRect, R, ABrush);
              DrawGlyph(ACanvas, R.Left, R.Top, AButtonViewInfo.Glyph, AButtonViewInfo.Data.State <> ebsDisabled, ABrushColor);
            end;
          end;
    end;
  end;
end;

procedure DrawEditPopupCloseButton(ACanvas: TcxCanvas; AViewInfo: TcxCustomEditPopupWindowViewInfo);
const
  ACloseButtonSize = 11;
{$IFDEF VCL}
  AStates: array[Boolean] of Longint = (0, DFCS_PUSHED);
{$ENDIF}
var
  R: TRect;
  APainterClass: TcxCustomLookAndFeelPainterClass;
{$IFDEF VCL}
  ATheme: TTheme;
{$ENDIF}
begin
  with AViewInfo do
  begin
    R := AViewInfo.CloseButtonRect;
    APainterClass := GetPainterClass(NativeStyle, CloseButtonStyle);
{$IFDEF VCL}
    if CloseButtonNativeState <> TC_NONE then
    begin
      ATheme := OpenTheme(totWindow);
      CloseButtonNativeState := CloseButtonNativeStateMap[CloseButtonState];
      if IsThemeBackgroundPartiallyTransparent(ATheme, WP_CLOSEBUTTON, CloseButtonNativeState) then
      begin
        ACanvas.Brush.Color := clBtnFace;
        ACanvas.FillRect(R);
      end;
      DrawThemeBackground(ATheme, ACanvas.Handle, WP_CLOSEBUTTON, CloseButtonNativeState, @R);
      ACanvas.ExcludeClipRect(R);
    end
    else
{$ENDIF}
      APainterClass.DrawFilterCloseButton(ACanvas, R, CloseButtonState);
  end;
end;

procedure DrawEditPopupWindowBorder(ACanvas: TcxCanvas; AViewInfo: TcxCustomEditPopupWindowViewInfo;
  var R: TRect);
begin
  with AViewInfo do
    if NativeStyle then
      ACanvas.FrameRect(R, clBtnText)
    else
    begin
      case BorderStyle of
        epbsSingle:
          ACanvas.FrameRect(R, clBtnText);
        epbsFrame3D, epbsFlat:
          begin
            ACanvas.DrawEdge(R, False, True);
            InflateRect(R, -1, -1);
            ACanvas.DrawEdge(R, False, False);
            if BorderStyle = epbsFrame3D then
            begin
              InflateRect(R, -1, -1);
              if ClientEdge then
                ACanvas.FrameRect(R, clInactiveBorder)
              else
                ACanvas.FrameRect(R, clBtnFace);
              InflateRect(R, -1, -1);
              if ClientEdge then
                ACanvas.FrameRect(R, clBtnFace)
              else
                ACanvas.DrawEdge(R, True, True);
            end;
          end;
      end;
    end;
    InflateRect(R, -1, -1);
end;

procedure DrawEditPopupWindowFrame(ACanvas: TcxCanvas; AViewInfo: TcxCustomEditPopupWindowViewInfo);
var
  R, R1: TRect;
  AClientEdgeWidth: Integer;
  A: Integer;
begin
  with AViewInfo do
  begin
    R := Rect(0, 0, Bounds.Right - Bounds.Left, Bounds.Bottom - Bounds.Top);

    if Shadow then
    begin
      Dec(R.Right, cxEditShadowWidth);
      Dec(R.Bottom, cxEditShadowWidth);
      DrawContainerShadow(ACanvas, R);
    end;

    DrawBorder(ACanvas, R);

    if SysPanelStyle and ((BorderStyle = epbsSingle){$IFDEF VCL} or (CloseButtonNativeState <> TC_NONE){$ENDIF}) then
    begin
      R1 := ClientRect;
      AClientEdgeWidth := GetEditPopupWindowClientEdgeWidth(AViewInfo);
      if ClientEdge then
        InflateRect(R1, AClientEdgeWidth, AClientEdgeWidth);
      if SizeGripCorner in [ecoTopLeft, ecoTopRight] then
        InternalPolyLine(ACanvas, [Point(R1.Left, R1.Top - 1), Point(R1.Right, R1.Top - 1)], clBtnText, True)
      else
        InternalPolyLine(ACanvas, [Point(R1.Left, R1.Bottom), Point(R1.Right, R1.Bottom)], clBtnText, True);
    end;

    if ClientEdge then
    begin
      A := SysPanelHeight;
      if SysPanelStyle and (NativeStyle or (BorderStyle = epbsSingle)) then
        Inc(A);
      R1 := R;
      if SysPanelStyle then
        if SizeGripCorner in [ecoTopLeft, ecoTopRight] then
          Inc(R1.Top, A)
        else
          Dec(R1.Bottom, A);

      ACanvas.DrawEdge(R1, True, True);
      if NativeStyle or (BorderStyle <> epbsFlat) then
      begin
        InflateRect(R1, -1, -1);
        ACanvas.DrawEdge(R1, True, False);
      end;
    end;

    if SysPanelStyle then
    begin
      if Sizeable then
      begin
        DrawSizeGrip(ACanvas, SizeGripRect, SizeGripCorner, NativeStyle);
        ACanvas.ExcludeClipRect(SizeGripRect);
      end;

      if not IsRectEmpty(CloseButtonRect) then
      begin
        DrawEditPopupCloseButton(ACanvas, AViewInfo);
        ACanvas.ExcludeClipRect(CloseButtonRect);
      end;
    end;

    ACanvas.Brush.Color := clBtnFace;
    ACanvas.FillRect(ClientRect);

    A := SysPanelHeight;
    if SizeGripCorner in [ecoTopLeft, ecoTopRight] then
      R.Bottom := R.Top + A
    else
      R.Top := R.Bottom - A;
    ACanvas.FillRect(R);
  end;
end;

procedure DrawEditText(ACanvas: TcxCanvas; AViewInfo: TcxCustomTextEditViewInfo);

  function CompareFonts(AFont: TFont; ATextColor: TColor): Boolean;
  begin
    with ACanvas.Font do
    begin
      Result := Color = ATextColor;
      Result := Result and (Style = AFont.Style) and (Size = AFont.Size) and
        (Name = AFont.Name);
    end;
  end;

var
  R: TRect;
  AText: PcxCaptionChar;
  ATextColor: TColor;
begin
  with AViewInfo do
  begin
    AText := PcxCaptionChar(Text);
{$IFNDEF NOFLICKER}
    if {$IFDEF VCL}StrLen(AText){$ELSE}Length(WideString(AText)){$ENDIF} = 0 then
      Exit;
{$ENDIF}

    R := TextRect;
    if DrawSelectionBar then
      ATextColor := clHighlightText
    else
      ATextColor := TextColor;
//    if not CompareFonts(Font, ATextColor) then
    begin
      ACanvas.Font := Font;
      ACanvas.Font.Color := ATextColor;
    end;
    begin
      PrepareCanvasFont(ACanvas.Font);
      InternalTextOut(ACanvas.Canvas, AViewInfo, AText, R, DrawTextFlags,
        SelStart, SelLength, SelBackgroundColor, SelTextColor, MaxLineCount);
    end;
  end;
end;

procedure DrawMemo(ACanvas: TcxCanvas; AViewInfo: TcxCustomMemoViewInfo);
var
  AText: PcxCaptionChar;
begin
  with AViewInfo do
  begin
    AText := PcxCaptionChar(Text);
    if Length(AText) = 0 then
      Exit;
    ACanvas.Font := Font;
    ACanvas.Font.Color := TextColor;
//    cxTextOut(ACanvas.Canvas, AText, TextRect, DrawTextFlags, SelStart, SelLength,
//      SelBackgroundColor, SelTextColor, MaxLineCount);
    InternalTextOut(ACanvas.Canvas, AViewInfo, AText, TextRect, DrawTextFlags,
      SelStart, SelLength, SelBackgroundColor, SelTextColor, MaxLineCount);
  end;
end;

procedure DrawPopupEditPopupWindowBorder(ACanvas: TcxCanvas; AViewInfo: TcxCustomEditPopupWindowViewInfo;
  var R: TRect);
begin
  with AViewInfo do
    if not NativeStyle and (BorderStyle = epbsFrame3D) then
    begin
      ACanvas.DrawEdge(R, False, True);
      InflateRect(R, -1, -1);
      ACanvas.DrawEdge(R, False, False);
      InflateRect(R, -1, -1);
      ACanvas.FrameRect(R, clInactiveBorder);
      InflateRect(R, -1, -1);
      ACanvas.FrameRect(R, clBtnFace);
      InflateRect(R, -1, -1);
    end
    else
      DrawEditPopupWindowBorder(ACanvas, AViewInfo, R); 
end;

procedure DrawSizeGrip(ACanvas: TcxCanvas; const ARect: TRect;
  ACorner: TcxEditCorner; ANativeStyle: Boolean; AIsTransparent: Boolean = False);
var
  DX, DY: Integer;
  X, X0, Y, Y0: Integer;
  R: TRect;

  procedure DrawTouch(AColor: TColor);
  begin
    InternalPolyLine(ACanvas, [Point(X, Y0), Point(X0, Y)], AColor, False);
    Inc(X, DX);
    Inc(Y, DY);
  end;

const
  Offset = 2;
var
  AMirrorX, AMirrorY: Boolean;
  ATempRect: TRect;
  AScrollBarSize: TSize;
  I, J, L: Integer;
{$IFDEF VCL}
  APrevBitmap: HBITMAP;
  ATheme: TTheme;
  MDC: HDC;
  R1: TRect;
{$ENDIF}
begin
  if not AIsTransparent then
  begin
    ACanvas.Brush.Color := clBtnFace;
    ACanvas.FillRect(ARect);
  end;
{$IFDEF VCL}
  if ANativeStyle then
  begin
    ATheme := OpenTheme(totScrollBar);
    GetThemePartSize(ATheme, ACanvas.Handle, SBP_SIZEBOX, SZB_RIGHTALIGN, nil,
      TS_TRUE, @AScrollBarSize);
    Inc(AScrollBarSize.cx, Offset);
    Inc(AScrollBarSize.cy, Offset);
  end else
  begin
    AScrollBarSize.cx := GetSystemMetrics(SM_CXVSCROLL);
    AScrollBarSize.cy := GetSystemMetrics(SM_CYHSCROLL);
  end;
{$ELSE}
  QStyle_scrollBarExtent(QApplication_style, @AScrollBarSize);
{$ENDIF}
  ATempRect := ARect;
  with ATempRect do
  begin
    if ACorner in [ecoTopRight, ecoBottomRight] then
      Left := Right - AScrollBarSize.cx
    else
      Right := Left + AScrollBarSize.cx;
    if ACorner in [ecoBottomLeft, ecoBottomRight] then
      Top := Bottom - AScrollBarSize.cy
    else
      Bottom := Top + AScrollBarSize.cy;
    AMirrorX := ACorner in [ecoTopLeft, ecoBottomLeft];
    AMirrorY := ACorner in [ecoTopLeft, ecoTopRight];
  end;
  R := ATempRect;
  with R do
  begin
    if AMirrorX then
    begin
      Dec(Right, Offset);
    end
    else
    begin
      Inc(Left, Offset);
    end;
    if AMirrorY then
    begin
      Dec(Bottom, Offset);
    end
    else
    begin
      Inc(Top, Offset);
    end;
  end;

{$IFDEF VCL}
  if ANativeStyle or not AIsTransparent then
  begin
    X := R.Left;
    Y := R.Top;
    OffsetRect(R, -R.Left, -R.Top);
    MDC := CreateCompatibleDC(ACanvas.Handle);
    APrevBitmap := SelectObject(MDC, CreateCompatibleBitmap(ACanvas.Handle, R.Right, R.Bottom));
    if AIsTransparent then
    begin
      with R do
        StretchBlt(MDC, 0, 0, Right, Bottom,
          ACanvas.Handle, X + Byte(AMirrorX) * (Right - 1), Y + Byte(AMirrorY) * (Bottom - 1),
          (2 * Byte(not AMirrorX) - 1) * Right,
          (2 * Byte(not AMirrorY) - 1) * Bottom, SRCCOPY);
    end
    else
      FillRect(MDC, R, COLOR_BTNFACE + 1);
    ATheme := 0;
    if ANativeStyle then
      ATheme := OpenTheme(totScrollBar);
    if ATheme <> 0 then
    begin
      R1 := R;
      DrawThemeBackground(ATheme, MDC, SBP_SIZEBOX, SZB_RIGHTALIGN, @R1);
    end
    else
      DrawFrameControl(MDC, R, DFC_SCROLL, DFCS_SCROLLSIZEGRIP);
    with R do
    begin
      StretchBlt(ACanvas.Handle, X, Y, Right, Bottom,
        MDC, Byte(AMirrorX) * (Right - 1), Byte(AMirrorY) * (Bottom - 1),
        (2 * Byte(not AMirrorX) - 1) * Right,
        (2 * Byte(not AMirrorY) - 1) * Bottom, SRCCOPY);
    end;
    DeleteObject(SelectObject(MDC, APrevBitmap));
    DeleteDC(MDC);
  end
  else
{$ENDIF}
  begin
    L := (AScrollBarSize.cy - 2) div 12;
    if AMirrorX then
    begin
      DX := 1;
      X := R.Left;
    end else
    begin
      DX := -1;
      X := R.Right - 1;
    end;
    if AMirrorY then
    begin
      DY := 1;
      Y := R.Top;
    end else
    begin
      DY := -1;
      Y := R.Bottom - 1;
    end;
    X0 := X;
    Y0 := Y;
    for I := 0 to 2 do
    begin
      if AIsTransparent then
      begin
        Inc(X, DX * L);
        Inc(Y, DY * L);
      end
      else
        for J := 1 to L do
          DrawTouch(clBtnFace);
      for J := 1 to L * 2 do
        DrawTouch(clBtnShadow);
      for J := 1 to L do
        DrawTouch(clBtnHighlight);
    end;
  end;
end;

procedure DrawSpinEdit(ACanvas: TcxCanvas; AViewInfo: TcxSpinEditViewInfo);
begin
  DrawTextEdit(ACanvas, AViewInfo);
{$IFDEF VCL}
  with AViewInfo do
    if (Length(ButtonsInfo) > 0) and (ButtonsInfo[0].Data.NativePart <> TC_NONE) and
        (ButtonsPosition <> sbpHorzLeftRight) then
      InternalPolyLine(ACanvas, [DelimiterLine[0],
        DelimiterLine[1]], BackgroundColor, True);
{$ENDIF}
end;

procedure DrawSpinEditUltraFlatButtonBorder(ACanvas: TcxCanvas;
  AButtonPosition: TcxSpinEditUltraFlatButtonPosition; var R: TRect;
  ABrushColor: TColor; AButtonViewInfo: TcxEditButtonViewInfo;
  const ABounds: TRect; AIsEditBackgroundTransparent: Boolean);
begin
  with ACanvas, AButtonViewInfo do
  begin
    if (AButtonViewInfo.Data.State in [ebsDisabled, ebsNormal]) or Data.IsInplace then
    begin
      if not(AButtonViewInfo.Data.State in [ebsDisabled, ebsNormal]) then
        FrameRect(R, clHighlight)
      else
        if not AIsEditBackgroundTransparent then
          FrameRect(R, Data.BackgroundColor);
      InflateRect(R, -1, -1);
    end
    else
      case AButtonPosition of
        sufbpLeftMost:
          begin
            InternalPolyline(ACanvas, [Point(R.Left, R.Top), Point(R.Left,
              R.Bottom - 1)], ABrushColor, True);
            Inc(R.Left);
            InternalPolyLine(ACanvas, [Point(R.Right - 1, R.Top), Point(R.Right - 1,
              R.Bottom - 1)], clHighlight, True);
            Dec(R.Right);
            InternalPolyLine(ACanvas, [Point(R.Left, R.Top), Point(R.Right - 1,
              R.Top)], ABrushColor, True);
            Inc(R.Top);
            InternalPolyLine(ACanvas, [Point(R.Left, R.Bottom - 1), Point(R.Right - 1,
              R.Bottom - 1)], ABrushColor, True);
            Dec(R.Bottom);
          end;
        sufbpMiddle:
          begin
            if R.Left = ABounds.Left then
            begin
              DrawSpinEditUltraFlatButtonBorder(ACanvas, sufbpLeftMost, R, ABrushColor,
                AButtonViewInfo, ABounds, AIsEditBackgroundTransparent);
              Exit;
            end;

            InternalPolyline(ACanvas, [Point(R.Left, R.Top), Point(R.Left,
              R.Bottom - 1)], clHighlight, True);
            Inc(R.Left);
            InternalPolyLine(ACanvas, [Point(R.Right - 1, R.Top), Point(R.Right - 1,
              R.Bottom - 1)], clHighlight, True);
            Dec(R.Right);
            InternalPolyLine(ACanvas, [Point(R.Left, R.Top), Point(R.Right - 1,
              R.Top)], ABrushColor, True);
            Inc(R.Top);
            InternalPolyLine(ACanvas, [Point(R.Left, R.Bottom - 1), Point(R.Right - 1,
              R.Bottom - 1)], ABrushColor, True);
            Dec(R.Bottom);
          end;
        sufbpRightMost:
          begin
            InternalPolyline(ACanvas, [Point(R.Left, R.Top), Point(R.Left,
              R.Bottom - 1)], clHighlight, True);
            Inc(R.Left);
            InternalPolyLine(ACanvas, [Point(R.Right - 1, R.Top), Point(R.Right - 1,
              R.Bottom - 1)], ABrushColor, True);
            Dec(R.Right);
            InternalPolyLine(ACanvas, [Point(R.Left, R.Top), Point(R.Right - 1,
              R.Top)], ABrushColor, True);
            Inc(R.Top);
            InternalPolyLine(ACanvas, [Point(R.Left, R.Bottom - 1), Point(R.Right - 1,
              R.Bottom - 1)], ABrushColor, True);
            Dec(R.Bottom);
          end;
        sufbpRightTop:
          begin
              if R.Left = ABounds.Left then
              begin
                InternalPolyLine(ACanvas, [Point(R.Left, R.Top),
                  Point(R.Left, R.Bottom - 2)], ABrushColor, True);
                InternalPolyLine(ACanvas, [Point(R.Left, R.Bottom - 1),
                  Point(R.Right - 1, R.Bottom - 1)], clHighlight, True);
              end
              else
                InternalPolyLine(ACanvas, [Point(R.Left, R.Top),
                  Point(R.Left, R.Bottom - 1), Point(R.Right - 1, R.Bottom - 1)],
                  clHighlight, True);
              InternalPolyLine(ACanvas, [Point(R.Left + 1, R.Top),
                Point(R.Right - 1, R.Top), Point(R.Right - 1, R.Bottom - 2)],
                ABrushColor, True);
            InflateRect(R, -1, -1);
          end;
        sufbpRightBottom:
          begin
            if R.Left = ABounds.Left then
            begin
              InternalPolyLine(ACanvas, [Point(R.Left, R.Bottom - 1),
                Point(R.Left, R.Top + 1)], ABrushColor, True);
              InternalPolyLine(ACanvas, [Point(R.Left, R.Top),
                Point(R.Right - 1, R.Top)], clHighlight, True);
            end
            else
              InternalPolyLine(ACanvas, [Point(R.Left, R.Bottom - 1),
                Point(R.Left, R.Top), Point(R.Right - 1, R.Top)],
                clHighlight, True);
            InternalPolyLine(ACanvas, [Point(R.Left + 1, R.Bottom - 1),
              Point(R.Right - 1, R.Bottom - 1), Point(R.Right - 1, R.Top + 1)],
              ABrushColor, True);
            InflateRect(R, -1, -1);
          end;
        sufbpMiddleTop:
          begin
            InternalPolyLine(ACanvas, [Point(R.Left, R.Top),
              Point(R.Left, R.Bottom - 1), Point(R.Right - 1, R.Bottom - 1),
              Point(R.Right - 1, R.Top)], clHighlight, True);
            InternalPolyLine(ACanvas, [Point(R.Left + 1, R.Top),
              Point(R.Right - 2, R.Top)], ABrushColor, True);
            InflateRect(R, -1, -1);
          end;
        sufbpMiddleBottom:
          begin
            InternalPolyLine(ACanvas, [Point(R.Left, R.Bottom - 1),
              Point(R.Left, R.Top), Point(R.Right - 1, R.Top),
              Point(R.Right - 1, R.Bottom - 1)], clHighlight, True);
            InternalPolyLine(ACanvas, [Point(R.Left + 1, R.Bottom - 1),
              Point(R.Right - 2, R.Bottom - 1)], ABrushColor, True);
            InflateRect(R, -1, -1);
          end;
      end;
  end;
end;

procedure DrawSpinEditFlatButtonBorder(ACanvas: TcxCanvas;
  AButtonPosition: TcxSpinEditFlatButtonPosition; var R: TRect);
begin
  with R do
    case AButtonPosition of
      sfbpLeftSide:
        begin
          InternalPolyLine(ACanvas, [Point(Right - 1, Bottom - 1),
            Point(Left, Bottom - 1), Point(Left, Top), Point(Right - 1, Top)],
            clBtnShadow, True);
          Inc(Right);
        end;
      sfbpLeftSideRightMost, sfbpRightSideLeftMost, sfbpRightTop:
        ACanvas.FrameRect(R, clBtnShadow);
      sfbpRightSide, sfbpMiddleTop:
        begin
          InternalPolyline(ACanvas, [Point(Left, Top), Point(Right - 1, Top),
            Point(Right - 1, Bottom - 1), Point(Left, Bottom - 1)], clBtnShadow,
            True);
          Dec(Left);
        end;
      sfbpMiddleBottom:
        begin
          InternalPolyline(ACanvas, [Point(Left, Bottom - 1),
            Point(Right - 1, Bottom - 1), Point(Right - 1, Top)], clBtnShadow,
            True);
          Dec(Left);
          Dec(Top);
        end;
      sfbpRightBottom:
        begin
          InternalPolyline(ACanvas, [Point(Left, Top), Point(Left, Bottom - 1),
            Point(Right - 1, Bottom - 1), Point(Right - 1, Top)], clBtnShadow,
            True);
          Dec(Top);
        end;
  end;
  InflateRect(R, -1, -1);
end;

procedure DrawSpinEditButtonBorder(ACanvas: TcxCanvas; AViewInfo: TcxSpinEditViewInfo;
  AButtonVisibleIndex: Integer; AButtonStyle: TcxEditButtonStyle; ARect: TRect);
var
  AButtonViewInfo: TcxEditButtonViewInfo;

  procedure DrawHotFlatButton;

    function GetButtonPosition: TcxSpinEditFlatButtonPosition;
    const
      AButtonPositionA: array[Boolean, TcxSpinEditButtonsPosition, sebBackward..sebForward] of TcxSpinEditFlatButtonPosition = (
        (
          (sfbpLeftSideRightMost, sfbpRightSideLeftMost),
          (sfbpRightSideLeftMost, sfbpRightSide),
          (sfbpRightBottom, sfbpRightTop)
        ),
        (
          (sfbpLeftSideRightMost, sfbpRightSideLeftMost),
          (sfbpRightSide, sfbpRightSide),
          (sfbpMiddleBottom, sfbpMiddleTop)
        )
      );
      AFastButtonPositionA: array[TcxSpinEditButtonsPosition, sebFastBackward..sebFastForward] of TcxSpinEditFlatButtonPosition = (
        (sfbpLeftSide, sfbpRightSide),
        (sfbpRightSideLeftMost, sfbpRightSide),
        (sfbpRightSideLeftMost, sfbpRightSide)
      );
    begin
      with AViewInfo do
        if AButtonVisibleIndex > 1 then
          Result := AFastButtonPositionA[ButtonsPosition, TcxSpinEditButton(AButtonVisibleIndex)]
        else
          Result := AButtonPositionA[Length(ButtonsInfo) > 2, ButtonsPosition,
            TcxSpinEditButton(AButtonVisibleIndex)];
    end;

  const
    ABrushColorA: array [TcxEditButtonState] of TColor = (
      clBtnFace, clBtnFace, clBtnText, clBtnShadow
    );
  var
    ABrushColor, APenColor: TColor;
  begin
    with AButtonViewInfo do
    begin
      DrawSpinEditFlatButtonBorder(ACanvas, GetButtonPosition, ARect);

      ABrushColor := ABrushColorA[Data.State];
      if (Data.State <> ebsDisabled) and (Data.Transparent) then
        ABrushColor := Data.BackgroundColor;

      if Data.State in [ebsPressed, ebsSelected] then
        if Data.Transparent and (Data.State = ebsSelected) then
          APenColor := clBtnShadow
        else
          APenColor := clBtnHighlight
      else
        APenColor := clBtnText;
      AViewInfo.DrawButtonContent(ACanvas, AButtonVisibleIndex, ARect, APenColor, ABrushColor);
    end;
  end;

  procedure DrawUltraFlatButton;
  var
    ABrushColor: TColor;
    AButtonPosition: TcxSpinEditUltraFlatButtonPosition;
  begin
    with ACanvas, AButtonViewInfo do
    begin
      if AButtonViewInfo.Data.State = ebsDisabled then
        ABrushColor := clBtnFace
      else
        if AButtonViewInfo.Data.Transparent then
          ABrushColor := Data.BackgroundColor
        else
          if AButtonViewInfo.Data.State = ebsNormal then
            ABrushColor := clBtnFace
          else
            if AButtonViewInfo.Data.State = ebsPressed then
              ABrushColor := GetLightDownedSelColor
            else
              ABrushColor := GetLightSelColor;

      case AButtonVisibleIndex of
        cxSpinFastBackwardButtonIndex:
          if AViewInfo.ButtonsPosition = sbpHorzLeftRight then
            AButtonPosition := sufbpLeftMost
          else
            AButtonPosition := sufbpMiddle;
        cxSpinFastForwardButtonIndex:
          AButtonPosition := sufbpRightMost;
        cxSpinBackwardButtonIndex:
          if AViewInfo.ButtonsPosition = sbpVert then
            if Length(AViewInfo.ButtonsInfo) > 2 then
              AButtonPosition := sufbpMiddleBottom
            else
              AButtonPosition := sufbpRightBottom
          else
            if (Length(AViewInfo.ButtonsInfo) = 2) and (AViewInfo.ButtonsPosition = sbpHorzLeftRight) then
              AButtonPosition := sufbpLeftMost
            else
              AButtonPosition := sufbpMiddle;
        else
          if AViewInfo.ButtonsPosition = sbpVert then
            if Length(AViewInfo.ButtonsInfo) > 2 then
              AButtonPosition := sufbpMiddleTop
            else
              AButtonPosition := sufbpRightTop
          else
            if Length(AViewInfo.ButtonsInfo) > 2 then
              AButtonPosition := sufbpMiddle
            else
              AButtonPosition := sufbpRightMost;
      end;
      DrawSpinEditUltraFlatButtonBorder(ACanvas, AButtonPosition, ARect, ABrushColor,
        AButtonViewInfo, AViewInfo.BorderRect, AViewInfo.Transparent);
      AViewInfo.DrawButtonContent(ACanvas, AButtonVisibleIndex, ARect, clBtnText, ABrushColor);
    end;
  end;

{$IFDEF VCL}
var
  ATheme: TTheme;
{$ENDIF}
begin
  AButtonViewInfo := AViewInfo.ButtonsInfo[AButtonVisibleIndex];
  with AButtonViewInfo do
{$IFDEF VCL}
    if Data.NativeState <> TC_NONE then
    begin
      ATheme := OpenTheme(totSpin);
      DrawThemeBackground(ATheme, ACanvas.Handle, Data.NativePart, Data.NativeState, @Bounds);
    end else
{$ENDIF}
    begin
      case AButtonStyle of
        bts3D, btsFlat, btsSimple:
          DrawEditButtonBorder(ACanvas, AViewInfo, AButtonVisibleIndex, AButtonStyle, ARect);
        btsHotFlat:
          DrawHotFlatButton;
        btsUltraFlat:
          DrawUltraFlatButton;
      end;
    end;
end;

procedure DrawSpinEditButtonContent(ACanvas: TcxCanvas; AViewInfo: TcxSpinEditViewInfo;
  AButtonVisibleIndex: Integer; AContentRect: TRect; APenColor: TColor;
  ABrushColor: TColor);
const
  AArrowDirectionMap: array[Boolean, 0..3] of TcxArrowDirection = (
    (adLeft, adRight, adLeft, adRight),
    (adDown, adUp, adLeft, adRight)
  );
var
  AButtonViewInfo: TcxEditButtonViewInfo;
begin
  cxEditFillRect(ACanvas.Handle, AContentRect, GetSolidBrush(ACanvas, ABrushColor));
  AButtonViewInfo := AViewInfo.ButtonsInfo[AButtonVisibleIndex];
  if AButtonViewInfo.Data.State <> ebsDisabled then
    DrawArrow(ACanvas, AViewInfo.ArrowSize, AContentRect,
      AArrowDirectionMap[AViewInfo.ButtonsPosition = sbpVert, AButtonVisibleIndex],
      AButtonVisibleIndex > 1, AButtonViewInfo.Data.State = ebsPressed,
      APenColor)
  else
  begin
    OffsetRect(AContentRect, 1, 1);
    DrawArrow(ACanvas, AViewInfo.ArrowSize, AContentRect,
      AArrowDirectionMap[AViewInfo.ButtonsPosition = sbpVert, AButtonVisibleIndex],
      AButtonVisibleIndex > 1, AButtonViewInfo.Data.State = ebsPressed,
      clBtnHighlight);
    OffsetRect(AContentRect, -1, -1);
    DrawArrow(ACanvas, AViewInfo.ArrowSize, AContentRect,
      AArrowDirectionMap[AViewInfo.ButtonsPosition = sbpVert, AButtonVisibleIndex],
      AButtonVisibleIndex > 1, AButtonViewInfo.Data.State = ebsPressed,
      clBtnShadow);
  end;
end;

procedure DrawTextEdit(ACanvas: TcxCanvas; AViewInfo: TcxCustomTextEditViewInfo);
var
  ABackgroundPaintingStyle: TcxEditBackgroundPaintingStyle;
  ARealTransparent: Boolean;
  R: TRect;
begin
  with AViewInfo, ACanvas do
  begin
    ARealTransparent := Transparent or DrawSelectionBar;

    if ComboBoxStyle then
      if EditingStyle in [esFixedList, esNoEdit] then
        ABackgroundPaintingStyle := bpsComboListEdit
      else
        ABackgroundPaintingStyle := bpsComboEdit
    else
      ABackgroundPaintingStyle := bpsSolid;
    DrawCustomEdit(ACanvas, AViewInfo, not ARealTransparent, ABackgroundPaintingStyle);

    R := ClientRect;
    if not IsInplace then
    begin
      if {$IFDEF VCL}(EditNativeState = TC_NONE) and {$ENDIF}not Transparent and
          (AViewInfo.EditingStyle <> esNoEdit) then
        FrameRect(R, BackgroundColor);
      InflateRect(R, -1, -1);
    end;
    if DrawSelectionBar then
    begin
      Brush.Color := clHighlight;
      FillRect(R);
    end;
    if not HasInnerEdit or not IsEditClass then
      AViewInfo.DrawText(ACanvas);
    if not IsEditClass and Focused and not IsInplace and not HasPopupWindow then
    begin
{$IFDEF VCL}
      if DrawSelectionBar then
      begin
        Canvas.Font.Color := clHighlightText;
        Canvas.Brush.Color := clHighlight;
      end else
      begin
        Canvas.Font.Color := clBtnText;
        Canvas.Brush.Color := AViewInfo.BackgroundColor;
      end;
      TCanvasAccess(Canvas).RequiredState([csFontValid]);
      Canvas.DrawFocusRect(R);
{$ELSE}
      DrawFocusRect(R);
{$ENDIF}
    end;
  end;
end;

function GetArrowSize(const AContentSize: TSize; AArrowDirection: TcxArrowDirection): TSize;
var
  AMinContentSize: Integer;
  ATempVar: Longint;
begin
  AMinContentSize := AContentSize.cx;
  if AMinContentSize > AContentSize.cy then
    AMinContentSize := AContentSize.cy;

  Result.cx := (AMinContentSize - 1) div 2;
  if not Odd(Result.cx) then
    Inc(Result.cx);
  Result.cy := Result.cx div 2 + 1;
  if AArrowDirection in [adLeft, adRight] then
  begin
    ATempVar := Result.cx;
    Result.cx := Result.cy;
    Result.cy := ATempVar;
  end;
end;

function GetCheckBoxContentSize(ACanvas: TcxCanvas; AViewData: TcxCustomEditViewData;
  const AText: TCaption; ADrawTextFlags: Integer; AIsInplace: Boolean;
  const APEditSizeProperties: PcxEditSizeProperties; ACorrectWidth: Boolean = True): TSize;
var
  AFlags: Integer;
  R: TRect;
  DX, DY: Integer;
begin
  AFlags := ADrawTextFlags;
  ACanvas.Font := AViewData.Style.Font;

  if (AText = '') or (AFlags and cxSingleLine <> 0) then
  begin
    FillChar(R, SizeOf(R), 0);
    ACanvas.TextExtent(AText, R, AFlags);
    Result.cy := ACanvas.TextHeight('W');
  end else
  begin
    if APEditSizeProperties = nil then
      R := Rect(0, 0, 100, 0)
    else
      R := Rect(0, 0, APEditSizeProperties^.Width, 0);
    ACanvas.TextExtent(AText, R, AFlags);
    Result.cy := R.Bottom - R.Top;
  end;
  Result.cx := R.Right - R.Left;

  if AIsInplace then
{$IFDEF VCL}
    if AreVisualStylesMustBeUsed(AViewData.Style.LookAndFeel.NativeStyle, totEdit) then
    begin
      DX := 3;
      DY := 4;
    end else
{$ENDIF}
    begin
      DX := 3;
      DY := 2;
    end
  else
  begin
    DX := 4;
    DY := 4;
  end;
  Inc(Result.cy, DY);
  if ACorrectWidth then
    Inc(Result.cx, DX);
end;

function GetCustomEditSize(ACanvas: TcxCanvas; AViewData: TcxCustomEditViewData;
  AIsInplace: Boolean; APEditSizeProperties: PcxEditSizeProperties): TSize;
var
  AClientExtent: TRect;
begin
  AClientExtent := GetEditBorderExtent(AViewData);
  with AClientExtent do
  begin
    Result.cx := Left + Right;
    Result.cy := Top + Bottom;
  end;
end;

function GetEditButtonsContentVerticalOffset(ACanvas: TcxCanvas;
  AViewInfo: TcxCustomEditViewInfo): Integer;
{$IFDEF VCL}
var
  R, CR: TRect;
  ATheme: TTheme;
{$ENDIF}
begin
  with AViewInfo do
  begin
{$IFDEF VCL}
    if NativeStyle then
    begin
      R := Rect(0, 0, 100, 100);
      ATheme := OpenTheme(totButton);
      GetThemeBackgroundContentRect(ATheme, ACanvas.Handle, BP_PUSHBUTTON, PBS_NORMAL, @R, CR);
      Result := CR.Top + R.Bottom - CR.Bottom;
    end else
{$ENDIF}
      Result := cxEditButtonContentVerticalOffset[ButtonsInfo[0].Data.Style];
  end;
end;

function GetEditCheckSize(ACanvas: TcxCanvas; AViewData: TcxCustomCheckBoxViewData;
  AViewInfo: TcxCustomCheckBoxViewInfo): TSize;
{$IFDEF VCL}
var
  ATheme: TTheme;
{$ENDIF}
begin
  with TcxCustomCheckBoxPropertiesAccess(AViewData.Properties) do
  begin
    AViewInfo.HasGlyph := (GlyphCount > 0) and VerifyBitmap(Glyph);
    if AViewInfo.HasGlyph then
    begin
      Result.cx := Glyph.Width div GlyphCount;
      Result.cy := Glyph.Height;
    end else
    begin
{$IFDEF VCL}
      if AreVisualStylesMustBeUsed(AViewInfo.NativeStyle, totButton) then
      begin
        ATheme := OpenTheme(totButton);
        GetThemePartSize(ATheme, ACanvas.Handle, BP_CHECKBOX, CBS_CHECKEDNORMAL,
          nil, TS_TRUE, @Result);

      end else
{$ENDIF}
      begin
        Result.cx := FCheckBoxClientSize.cx;
        Result.cy := FCheckBoxClientSize.cy;
      end;
    end;
  end;
end;

function GetTextEditContentSize(ACanvas: TcxCanvas; AViewData: TcxCustomEditViewData;
  const AText: TCaption; ADrawTextFlags: DWORD; const APEditSizeProperties:
  PcxEditSizeProperties; ACorrectWidth: Boolean = True): TSize;
var
  AAlignment: TcxEditAlignment;
  AFlags: DWORD;
  ARowCount: Integer;
  ATextParams: TcxTextParams;
  ATextRows: TcxTextRows;
  ATextFlags: Integer;
  ASizeCorrection: TSize;
  AWidth: Integer;
  R: TRect;
begin
  AAlignment := nil;
  if not AViewData.IsInplace and (AViewData is TcxCustomTextEditViewData) then
    with TcxCustomTextEditPropertiesAccess(AViewData.Properties) do
      if (EditingStyle in [esFixedList, esNoEdit]){$IFDEF VCL} and
          not(not AViewData.IsInplace and TcxCustomTextEditViewDataAccess(AViewData).IsComboBoxStyle and
          AreVisualStylesMustBeUsed(AViewData.Style.LookAndFeel.NativeStyle, totEdit)){$ENDIF} then
        AAlignment := Alignment;
  ACanvas.Font := AViewData.Style.Font;
  AFlags := ADrawTextFlags;
  ASizeCorrection := GetTextEditContentSizeCorrection(AViewData);
  AWidth := APEditSizeProperties^.Width;

  with APEditSizeProperties^ do
  begin
    if Width >= 0{AutoHeight} then
    begin
      if AViewData.IsInplace then
        Dec(AWidth, 2);

      if AAlignment <> nil then
        Dec(AWidth);
      if AWidth <= 0 then
      begin
        Result.cx := 0;
        if (epoAllowZeroHeight in AViewData.PaintOptions) and (Length(AText) = 0) then
          Result.cy := 0
        else
          Result.cy := ACanvas.TextHeight('Zg');
      end else
      begin
        Result.cx := Width;
        if Length(AText) = 0 then
          if epoAllowZeroHeight in AViewData.PaintOptions then
            Result.cy := 0
          else
            Result.cy := ACanvas.TextHeight('Zg')
        else
        begin
          AFlags := AFlags or CXTO_CALCROWCOUNT;
          if AFlags and CXTO_SINGLELINE <> 0 then
            AFlags := AFlags and not CXTO_SINGLELINE or CXTO_WORDBREAK or
              CXTO_EDITCONTROL;
          AFlags := AFlags and not(CXTO_CENTER_VERTICALLY or CXTO_BOTTOM) or CXTO_TOP;
          R := Rect(0, 0, AWidth, MaxInt);
          ATextParams := cxCalcTextParams(ACanvas.Canvas, AFlags);
          ATextRows := nil;
          cxMakeTextRows(ACanvas.Canvas, PcxCaptionChar(AText), R, ATextParams, ATextRows, ARowCount, MaxLineCount);
          if (MaxLineCount > 0) and (ARowCount > MaxLineCount) then
            ARowCount := MaxLineCount;
          Result.cy := ARowCount * ACanvas.TextHeight('Zg');
          ATextRows := nil;
        end;
      end;
    end else
    begin
      if AFlags and CXTO_SINGLELINE <> 0 then
      begin
        ATextFlags := cxTextOutFlagsToDrawTextFlags(AFlags);
        Result.cy := ACanvas.TextHeight('Zg');
        R := Rect(0, 0, MaxInt, 0);
        if Length(AText) = 0 then
          Result.cx := 0
        else
        begin
          ACanvas.TextExtent(AText, R, ATextFlags);
          Result.cx := R.Right - R.Left;
        end;
      end else
      begin
        AFlags := AFlags or CXTO_CALCRECT;
        R := Rect(0, 0, MaxInt, MaxInt);

        ATextParams := cxCalcTextParams(ACanvas.Canvas, AFlags);
        ATextRows := nil;
        cxMakeTextRows(ACanvas.Canvas, PcxCaptionChar(AText), R, ATextParams, ATextRows, ARowCount);
        if (MaxLineCount > 0) and (ARowCount > MaxLineCount) then
          ARowCount := MaxLineCount;
        if ARowCount = 0 then
          Result.cx := 0
        else
          Result.cx := cxGetLongestTextRowWidth(ATextRows, ARowCount);
        ATextRows := nil;
        Result.cy := ACanvas.TextHeight('Zg')
      end;
      if AAlignment <> nil then
        Inc(Result.cx);
      if ACorrectWidth then
        Inc(Result.cx, ASizeCorrection.cx);
    end;
  end;
  if Result.cy > 0 then
    Inc(Result.cy, ASizeCorrection.cy);
end;

function GetTextEditContentSizeCorrection(AViewData: TcxCustomEditViewData): TSize;
begin
  with Result do
  begin
    cx := 3;
    if AViewData.IsInplace then
{$IFDEF VCL}
      if AreVisualStylesMustBeUsed(AViewData.Style.LookAndFeel.NativeStyle, totEdit) then
        cy := 3
      else
{$ENDIF}
{$IFDEF WIN32}
        cy := 2
{$ELSE}
        cy := 0
{$ENDIF}
    else
      cy := 4;
  end;
end;

function GetEditBorderExtent(AViewData: TcxCustomEditViewData): TRect;
var
  ABorderWidth: Integer;
{$IFDEF VCL}
  ANativeStyle: Boolean;
{$ENDIF}
begin
  with AViewData do
  begin
    if IsInplace then
      Result := AViewData.ContentOffset
    else
    begin
{$IFDEF VCL}
      ANativeStyle := AreVisualStylesMustBeUsed(Style.LookAndFeel.NativeStyle, totEdit);
{$ENDIF}
      if Style.TransparentBorder or Style.HotTrack{$IFDEF VCL} or ANativeStyle{$ENDIF} then
        Result := cxEditDefaultBorderExtent
      else
      begin
        ABorderWidth := GetEditBorderWidth(TcxCustomEditViewDataAccess(AViewData).GetBorderStyle(chsNoHotTrack));
        Result := Rect(ABorderWidth, ABorderWidth, ABorderWidth, ABorderWidth);
      end;
      {$IFDEF VCL}if not ANativeStyle then {$ENDIF}
      if Style.Shadow then
      begin
        Inc(Result.Right, cxEditShadowWidth);
        Inc(Result.Bottom, cxEditShadowWidth);
      end;
    end;
  end;
end;

function GetEditBorderWidth(ABorderStyle: TcxEditBorderStyle): Integer;
begin
  Result := cxEditBorderWidthA[ABorderStyle];
end;

function GetEditButtonsExtent(ACanvas: TcxCanvas; AViewData: TcxCustomEditViewData): TRect;
{$IFDEF VCL}
var
  ATheme: TTheme;
  R, CR: TRect;
{$ENDIF}
begin
  with AViewData do
    if IsInplace then
      Result := ContentOffset
    else
{$IFDEF VCL}
      if NativeStyle then
      begin
        R := Rect(0, 0, 100, 100);
        ATheme := OpenTheme(totEdit);
        GetThemeBackgroundContentRect(ATheme, ACanvas.Handle, EP_EDITTEXT, ETS_NORMAL, @R, CR);

        Result := CR;
        Result.Right := R.Right - CR.Right;
        Result.Bottom := R.Bottom - CR.Bottom;
      end
      else
{$ENDIF}
        Result := GetEditBorderExtent(AViewData);
end;

{$IFDEF VCL}
function GetEditButtonRegion(ACanvas: TcxCanvas; AViewInfo: TcxEditButtonViewInfo): TcxRegion;
var
  ATheme: TTheme;
  ARgn1, ARgn2: HRGN;
begin
  with AViewInfo do
    if Data.NativeState <> TC_NONE then
    begin
      if Data.ComboBoxStyle then
      begin
        ATheme := OpenTheme(totComboBox);
        GetThemeBackgroundRegion(ATheme, ACanvas.Handle, CP_DROPDOWNBUTTON, Data.NativeState, @Bounds, ARgn1);
      end else
      begin
        ATheme := OpenTheme(totButton);
        GetThemeBackgroundRegion(ATheme, ACanvas.Handle, Data.NativePart, Data.NativeState, @Bounds, ARgn1);
      end;
      ARgn2 := CreateRectRgnIndirect(Bounds);
      CombineRgn(ARgn1, ARgn1, ARgn2, RGN_AND);
      DeleteObject(ARgn2);
      Result := TcxRegion.Create(ARgn1);
    end
    else
      Result := TcxRegion.Create(Bounds);
end;
{$ENDIF}

procedure GetEditColorSettings(AViewData: TcxCustomEditViewData; AViewInfo: TcxCustomEditViewInfo; var FillColor, TextColor: TColor);
{$IFDEF VCL}
var
  ATheme: TTheme;
  AColor: COLORREF;
{$ENDIF}
begin
  with TcxCustomEditStyleAccess(AViewData.Style) do
  begin
    if AViewData.Enabled then
      if DirectAccessMode or AViewData.IsInplace then
        TextColor := StyleData.FontColor
      else
        TextColor := Font.Color
    else
      TextColor := {$IFDEF VCL}clBtnShadow{$ELSE}clDisabledButtonText{$ENDIF};
{$IFDEF VCL}
    if AViewInfo.NativeStyle then
    begin
      if AViewData.Enabled then
        FillColor := Color
      else
      begin
        ATheme := OpenTheme(totEdit);
        GetThemeColor(ATheme, EP_EDITTEXT, AViewInfo.EditNativeState, TMT_FILLCOLOR, AColor);
        FillColor := AColor;
      end;
    end else
{$ENDIF}
      if AViewData.Enabled then
        FillColor := Color
      else
        FillColor := clBtnFace;
  end;
end;

function GetEditPopupWindowClientEdgeWidth(AViewInfo: TcxCustomEditPopupWindowViewInfo): Integer;
begin
  with AViewInfo do
    if ClientEdge then
      if NativeStyle then
        Result := 2
      else
        Result := cxEditPopupClientEdgeWidthA[BorderStyle]
    else
      Result := 0;
end;

function GetEditPopupWindowFrameExtent(AViewInfo: TcxCustomEditPopupWindowViewInfo): TRect;

  procedure FillRect(var R: TRect; Value: Integer);
  begin
    with R do
    begin
      Left := Value;
      Top := Value;
      Right := Value;
      Bottom := Value;
    end;
  end;

var
{$IFNDEF VCL}
  AScrollBarSize: TSize;
{$ENDIF}
  A: Integer;
begin
  with AViewInfo do
  begin
    FillRect(Result, GetEditPopupWindowBorderWidth(AViewInfo, True));
    if Shadow then
    begin
      Inc(Result.Right, cxEditShadowWidth);
      Inc(Result.Bottom, cxEditShadowWidth);
    end;

    if SysPanelStyle then
    begin
      SysPanelHeight := GetSysPanelHeight;
      A := SysPanelHeight;
      if NativeStyle or (BorderStyle = epbsSingle) then
        Inc(A);
      if SizeGripCorner in [ecoBottomLeft, ecoBottomRight] then
        Inc(Result.Bottom, A)
      else
        Inc(Result.Top, A);
    end
    else
      SysPanelHeight := 0;

{$IFDEF VCL}
    SizingOffset := GetSystemMetrics(SM_CYHSCROLL);
    if SizingOffset < GetSystemMetrics(SM_CYSIZE) then
      SizingOffset := GetSystemMetrics(SM_CYSIZE);
{$ELSE}
    QStyle_scrollBarExtent(QApplication_style, @AScrollBarSize);
    SizingOffset := AScrollBarSize.cx;
{$ENDIF}
  end;
end;

function GetEditPopupWindowBorderWidth(AViewInfo: TcxCustomEditPopupWindowViewInfo; AIncludeClientEdge: Boolean): Integer;
begin
  with AViewInfo do
  begin
    if NativeStyle then
      Result := 1
    else
      Result := cxEditPopupWindowFrameWidthA[BorderStyle];
    if ClientEdge and AIncludeClientEdge then
      Inc(Result, GetEditPopupWindowClientEdgeWidth(AViewInfo));
  end;
end;

function GetEditPopupWindowOwnerControlBounds(AViewInfo: TcxCustomEditViewInfo): TRect;
var
  ABorderWidth, ABorderMaskedPartWidth: Integer;
begin
  with AViewInfo do
  begin
    Result := Bounds;

{$IFDEF VCL}
    if NativeStyle then
      Exit;
{$ENDIF}
    
    if Shadow then
      Dec(Result.Bottom, cxEditShadowWidth);
    if IsInplace then
      Exit;

    ABorderWidth := GetEditBorderWidth(BorderStyle);
    ABorderMaskedPartWidth := cxEditMaxBorderWidth - ABorderWidth;
    InflateRect(Result, -ABorderMaskedPartWidth, -ABorderMaskedPartWidth);
    if not (bLeft in Edges) then
      Inc(Result.Left, ABorderWidth);
    if not (bTop in Edges) then
      Inc(Result.Top, ABorderWidth);
    if not (bRight in Edges) then
      Dec(Result.Right, ABorderWidth);
    if not (bBottom in Edges) then
      Dec(Result.Bottom, ABorderWidth);
  end;
end;

function GetEditPopupWindowSysPanelDefaultHeight(AViewInfo: TcxCustomEditPopupWindowViewInfo): Integer;
var
{$IFDEF VCL}
  ATheme: TTheme;
  ACloseButtonSize: TSize;
  ASizeGripSize: TSize;
{$ELSE}
  AScrollBarSize: TSize;
{$ENDIF}
begin
{$IFDEF VCL}
  ACloseButtonSize.cy := 0;
  ASizeGripSize.cy := 0;
  with AViewInfo do
    if SysPanelStyle and AreVisualStylesMustBeUsed(NativeStyle, totWindow) then
    begin
      ATheme := OpenTheme(totWindow);
      GetThemePartSize(ATheme, 0, WP_CLOSEBUTTON, CBS_NORMAL, nil, TS_TRUE,
        @ACloseButtonSize);
      ATheme := OpenTheme(totScrollBar);
      GetThemePartSize(ATheme, 0, SBP_SIZEBOX, SZB_RIGHTALIGN, nil, TS_TRUE,
        @ASizeGripSize);
    end;

  Result := GetSystemMetrics(SM_CYHSCROLL);
  if Result < GetSystemMetrics(SM_CYSIZE) then
    Result := GetSystemMetrics(SM_CYSIZE);
  if Result < ACloseButtonSize.cy then
    Result := ACloseButtonSize.cy;
  if Result < ASizeGripSize.cy then
    Result := ASizeGripSize.cy;
{$ELSE}
  QStyle_scrollBarExtent(QApplication_style, @AScrollBarSize);
  Result := AScrollBarSize.cx;
{$ENDIF}
end;

function GetEditVisibleBounds(AViewInfo: TcxCustomEditViewInfo; const ABounds: TRect): TRect;
var
  ABorderWidth: Integer;
begin
  with AViewInfo do
  begin
    Result := ABounds;
    {$IFDEF VCL}if not(not IsInplace and (EditNativeState <> TC_NONE)) then{$ENDIF}
      ExtendRect(Result, BorderExtent);
{$IFDEF VCL}
    if EditNativeState <> TC_NONE then
      ABorderWidth := 0
    else
{$ENDIF}
      ABorderWidth := GetEditBorderWidth(BorderStyle);
    if ABorderWidth <> 0 then
    begin
      if bLeft in Edges then Dec(Result.Left, ABorderWidth);
      if bTop in Edges then Dec(Result.Top, ABorderWidth);
      if bRight in Edges then Inc(Result.Right, ABorderWidth);
      if bBottom in Edges then Inc(Result.Bottom, ABorderWidth);
    end;
  end;
end;

function GetMemoDrawTextOffset(AViewData: TcxCustomMemoViewData): TRect;
const
{$IFDEF VCL}
  ATextOffset: array[TAlignment] of TRect = (
    (Left: 1; Top: 1; Right: 1; Bottom: 1),
    (Left: 0; Top: 1; Right: 2; Bottom: 1),
    (Left: 1; Top: 1; Right: 1; Bottom: 1)
  );
{$ELSE}
  {$IFDEF WIN32}
  ATextOffset: array[TAlignment] of TRect = (
    (Left: 1; Top: 1; Right: 1; Bottom: 1),
    (Left: 1; Top: 1; Right: 2; Bottom: 1),
    (Left: 1; Top: 1; Right: 1; Bottom: 1)
  );
  {$ENDIF}
  {$IFDEF LINUX}
  ATextOffset: array [Boolean, TAlignment] of TRect = (
    ((Left: 2; Top: 2; Right: 2; Bottom: 0),
     (Left: 2; Top: 2; Right: 2; Bottom: 0),
     (Left: 2; Top: 2; Right: 2; Bottom: 0)),
     ((Left: 2; Top: -1; Right: 1; Bottom: 1),
     (Left: 2; Top: -1; Right: 2; Bottom: 1),
     (Left: 2; Top: -1; Right: 2; Bottom: 1))
  );
  {$ENDIF}
{$ENDIF}
var
  AAlignment: TAlignment;
begin
  AAlignment := TcxCustomMemoPropertiesAccess(AViewData.Properties).Alignment;
{$IFDEF VCL}
  Result := ATextOffset[AAlignment];
{$ELSE}
  {$IFDEF WIN32}
  Result := ATextOffset[AAlignment];
  if not AViewData.IsInplace and (AAlignment = taCenter) then
    Dec(Result.Right);
  {$ENDIF}
  {$IFDEF LINUX}
  Result := ATextOffset[AViewData.IsInplace, AAlignment];
  with TcxCustomMemoPropertiesAccess(AViewData.Properties) do
    if AViewData.IsInplace and (AAlignment = taLeftJustify) and WordWrap then
      Dec(Result.Right);
  {$ENDIF}
{$ENDIF}
end;

function GetTextEditDrawTextOffset(AViewData: TcxCustomEditViewData): TRect;
begin
  Result := GetTextEditDrawTextOffset(AViewData.HorzAlignment, AViewData.IsInplace);
  if not AViewData.IsInplace and (AViewData is TcxCustomTextEditViewData) then
    with AViewData as TcxCustomTextEditViewData do
      if TcxCustomTextEditPropertiesAccess(Properties).EditingStyle in [esFixedList, esNoEdit] then
      begin
        if AViewData.VertAlignment = taTopJustify then
        begin
          Inc(Result.Top);
          Dec(Result.Bottom);
        end;
        Inc(Result.Left);
      end;
end;

function GetTextEditDrawTextOffset(AAlignment: TAlignment; AIsInplace: Boolean): TRect;
const
{$IFDEF VCL}
  ATextOffset: array [Boolean, TAlignment] of TRect = (
    ((Left: 1; Top: 1; Right: 1; Bottom: 3),
     (Left: 1; Top: 1; Right: 2; Bottom: 3),
     (Left: 1; Top: 1; Right: 1; Bottom: 3)),
    ((Left: 1; Top: 1; Right: 1; Bottom: 1),
     (Left: 1; Top: 1; Right: 2; Bottom: 1),
     (Left: 1; Top: 1; Right: 1; Bottom: 1))
  );
{$ELSE}
  {$IFDEF WIN32}
  ATextOffset: array [Boolean, TAlignment] of TRect = (
    ((Left: 2; Top: 1; Right: 2; Bottom: 3),
     (Left: 1; Top: 1; Right: 2; Bottom: 3),
     (Left: 2; Top: 1; Right: 2; Bottom: 3)),
    ((Left: 1; Top: 1; Right: 1; Bottom: 1),
     (Left: 1; Top: 1; Right: 2; Bottom: 1),
     (Left: 1; Top: 1; Right: 1; Bottom: 1))
  );
  {$ENDIF}
  {$IFDEF LINUX}
  ATextOffset: array [Boolean, TAlignment] of TRect = (
    ((Left: 2; Top: 2; Right: 2; Bottom: 2),
     (Left: 2; Top: 2; Right: 2; Bottom: 2),
     (Left: 2; Top: 2; Right: 2; Bottom: 2)),
    ((Left: 2; Top: -1; Right: 1; Bottom: 1),
     (Left: 2; Top: -1; Right: 2; Bottom: 1),
     (Left: 2; Top: -1; Right: 2; Bottom: 1))
  );
  {$ENDIF}
{$ENDIF}
begin
  Result := ATextOffset[AIsInplace, AAlignment];
end;

function IsShadowDrawingNeeded(AViewData: TcxCustomEditViewData): Boolean;
begin
  if AViewData.IsInplace then
    Result := False
  else
    with AViewData.Style do
    begin
      Result := Shadow;
{$IFDEF VCL}
      if Result then
        Result := not AreVisualStylesMustBeUsed(LookAndFeel.NativeStyle, totEdit);
{$ENDIF}
    end;
end;

procedure PrepareTextEditDrawTextFlags(ACanvas: TcxCanvas; AViewData: TcxCustomTextEditViewData;
  AViewInfo: TcxCustomTextEditViewInfo);
var
  ADrawTextOffset: TRect;
  AFlags: DWORD;
  R: TRect;
  ATextHeight: Integer;
  ATextParams: TcxTextParams;
  ATextRows: TcxTextRows;
  ARowCount: Integer;
begin
  if AViewData.Style.Font = nil then
    Exit;
  if AViewData.Style.DirectAccessMode then
    ACanvas.Font := AViewData.Style.StyleData.Font
  else
    ACanvas.Font := AViewData.Style.Font;
  with AViewInfo do
  begin
    DrawTextFlags := AViewData.GetDrawTextFlags;
    if epoAutoHeight in PaintOptions then
    begin
      AFlags := DrawTextFlags and not CXTO_SINGLELINE or
        CXTO_WORDBREAK or CXTO_EDITCONTROL or CXTO_CALCROWCOUNT;
      R := Rect(0, 0, TextRect.Right - TextRect.Left, MaxInt);
      ADrawTextOffset := AViewData.GetDrawTextOffset;
      Inc(R.Right, ADrawTextOffset.Left + ADrawTextOffset.Right);
      Dec(R.Right, GetTextEditContentSizeCorrection(AViewData).cx);
      Dec(R.Right, AViewData.ContentOffset.Left + AViewData.ContentOffset.Right);
{$IFDEF WIN32}
      if TcxCustomTextEditPropertiesAccess(AViewData.Properties).Alignment.Horz = taRightJustify then
        Inc(R.Right);
{$ENDIF}
      ATextParams := cxCalcTextParams(ACanvas.Canvas, AFlags);
// TODO optimize
      cxMakeTextRows(ACanvas.Canvas, PcxCaptionChar(Text), R, ATextParams, ATextRows, ARowCount);
      ATextHeight := ARowCount * ATextParams.RowHeight;
      if ARowCount > 1 then
      begin
        DrawTextFlags := DrawTextFlags and not CXTO_SINGLELINE;
        DrawTextFlags := DrawTextFlags or CXTO_WORDBREAK or CXTO_EDITCONTROL;
        if ATextHeight > TextRect.Bottom - TextRect.Top then
          DrawTextFlags := DrawTextFlags and not CXTO_BOTTOM
            and not CXTO_CENTER_VERTICALLY or CXTO_TOP;
      end;
      ATextRows := nil;
    end;
  end;
end;

function RemoveAccelChars(const S: TCaption): TCaption;
const
  AAccelChar: {$IFDEF VCL}Char{$ELSE}WideChar{$ENDIF} = '&';
var
  I, ALastIndex: Integer;
begin
  Result := '';
  I := 1;
  ALastIndex := Length(S);
  while I <= ALastIndex do
  begin
    if S[I] = AAccelChar then
      if I < ALastIndex then Inc(I)
{$IFDEF VCL}
      else
      begin
        Result := Result + '_';
        Break;
      end;
{$ENDIF}
      ;
    Result := Result + S[I];
    Inc(I);
  end;
end;

(*procedure SetEditShadowRegion(AWindowHandle: TcxHandle; const AOuterRect, AInnerRect: TRect;
  R: TRect; ANativeStyle: Boolean; AShadow: Boolean; APExcludeRect: PRect = nil);
var
  AWindowRegion, ATempRegion: {$IFDEF VCL}HRGN{$ELSE}QRegionH{$ENDIF};
  ARgnChanged: Boolean;
  ARgnType: Integer;
begin
{$IFDEF VCL}
  if ANativeStyle then
    AWindowRegion := 0
  else
{$ENDIF}
  begin
    AWindowRegion := {$IFDEF VCL}CreateRectRgnIndirect(R){$ELSE}QRegion_create(@R, QRegionRegionType_Rectangle){$ENDIF};
    if AShadow then
    begin
      OffsetRect(R, cxEditShadowWidth, cxEditShadowWidth);
{$IFDEF VCL}
      ATempRegion := CreateRectRgnIndirect(R);
      CombineRgn(AWindowRegion, AWindowRegion, ATempRegion, RGN_OR);
      DeleteObject(ATempRegion);
{$ELSE}
      ATempRegion := QRegion_create(@R, QRegionRegionType_Rectangle);
      QRegion_unite(AWindowRegion, AWindowRegion, ATempRegion);
      QRegion_destroy(ATempRegion);
{$ENDIF}
    end;
    if APExcludeRect <> nil then
    begin
{$IFDEF VCL}
      ATempRegion := CreateRectRgnIndirect(APExcludeRect^);
      CombineRgn(AWindowRegion, AWindowRegion, ATempRegion, RGN_DIFF);
      DeleteObject(ATempRegion);
{$ELSE}
      ATempRegion := QRegion_create(APExcludeRect, QRegionRegionType_Rectangle);
      QRegion_subtract(AWindowRegion, AWindowRegion, ATempRegion);
      QRegion_destroy(ATempRegion);
{$ENDIF}
    end;
  end;
{$IFDEF VCL}
  ATempRegion := CreateRectRgnIndirect(cxEmptyRect);
  ARgnType := Integer(GetWindowRgn(AWindowHandle, ATempRegion));
  ARgnChanged := not((AWindowRegion = 0) and ((ARgnType = NULLREGION) or (ARgnType = ERROR))) and not EqualRgn(AWindowRegion, ATempRegion);
  DeleteObject(ATempRegion);
  if ARgnChanged then
    SetWindowRgn(AWindowHandle, AWindowRegion, True)
  else
    if AWindowRegion <> 0 then
      DeleteObject(AWindowRegion);
{$ELSE}
  QWidget_setMask(AWindowHandle, AWindowRegion);
  QRegion_destroy(AWindowRegion);
{$ENDIF}
end;*)

procedure SetEditPopupWindowShadowRegion(APopupWindow: TcxCustomEditPopupWindow);
var
  R: TRect;
  AExcludeRect: TRect;
  APExcludeRect: PRect;
begin
  APExcludeRect := nil;
  R := GetControlRect(APopupWindow);
  with TcxCustomEditPopupWindowAccess(APopupWindow).ViewInfo do
  begin
{$IFDEF VCL}
    if not NativeStyle then
{$ENDIF}
      if Shadow then
      begin
        Dec(R.Right, cxEditShadowWidth);
        Dec(R.Bottom, cxEditShadowWidth);
        if SizeGripCorner in [ecoTopLeft, ecoTopRight] then
        begin
          APExcludeRect := @AExcludeRect;
          AExcludeRect := APopupWindow.OwnerBounds;
          AExcludeRect.TopLeft := APopupWindow.OwnerParent.ClientToScreen(AExcludeRect.TopLeft);
          AExcludeRect.BottomRight := APopupWindow.OwnerParent.ClientToScreen(AExcludeRect.BottomRight);
          AExcludeRect.TopLeft := APopupWindow.ScreenToClient(AExcludeRect.TopLeft);
          AExcludeRect.BottomRight := APopupWindow.ScreenToClient(AExcludeRect.BottomRight);
          Dec(AExcludeRect.Right, cxEditShadowWidth);
          AExcludeRect.Bottom := APopupWindow.Height;
          AExcludeRect.Top := AExcludeRect.Bottom - cxEditShadowWidth;
        end;
      end;
    SetWindowShadowRegion(APopupWindow.Handle, GetControlRect(APopupWindow), R, R,
      {$IFDEF VCL}NativeStyle, {$ENDIF}Shadow, APExcludeRect);
  end;
end;

procedure SetEditWindowShadowRegion(AViewInfo: TcxCustomEditViewInfo; AEditWindowHandle: TcxHandle);
var
  R: TRect;
  ABorderWidth: Integer;
begin
  with AViewInfo do
  begin
    R := ShadowRect;
    ABorderWidth := GetEditBorderWidth(BorderStyle);
    if bLeft in Edges then Dec(R.Left, ABorderWidth);
    if bTop in Edges then Dec(R.Top, ABorderWidth);
    if bRight in Edges then Inc(R.Right, ABorderWidth);
    if bBottom in Edges then Inc(R.Bottom, ABorderWidth);
    SetWindowShadowRegion(AEditWindowHandle, Bounds, R, R, {$IFDEF VCL}NativeStyle, {$ENDIF}Shadow);
  end;
end;

initialization
  CalculateCheckBoxClientSize;

end.
