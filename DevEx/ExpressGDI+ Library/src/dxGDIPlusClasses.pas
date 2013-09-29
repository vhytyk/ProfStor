{*******************************************************************}
{                                                                   }
{       Developer Express Visual Component Library                  }
{       GDI+ Library                                                }
{                                                                   }
{       Copyright (c) 2002-2003 Developer Express Inc.              }
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
{   LICENSED TO DISTRIBUTE THE EXPRESSBARS AND ALL ACCOMPANYING VCL }
{   CONTROLS AS PART OF AN EXECUTABLE PROGRAM ONLY.                 }
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

unit dxGDIPlusClasses;

interface

uses
  Windows, Graphics, dxGDIPlusAPI;

type
  TdxGPBrush = class(TdxGPBase)
  private
    FNativeBrush: GpBrush;
    FLastResult: TdxGPStatus;
  protected
    constructor CreateNative (nativeBrush: GpBrush; AStatus: Status);
    procedure SetNativeBrush(ANativeBrush: GpBrush);
    function SetStatus(AStatus: TdxGPStatus): TdxGPStatus;
  public
    constructor Create;
    destructor Destroy; override;
    function Clone: TdxGPBrush; virtual;
    function GetType: BrushType;
    function GetLastStatus: Status;
  end;

  TdxGPSolidBrush = class(TdxGPBrush)
  private
    function GetColor: TdxGPColor;
    procedure SetColor(const Value: TdxGPColor);
  public
    constructor Create; overload;
    constructor Create(color: TColor); overload;
    property Color: TdxGPColor read GetColor write SetColor;
  end;

  TdxGPTextureBrush = class(TdxGPBrush)
  end;

  TdxGPLinearGradientBrush = class(TdxGPBrush)
  private
    procedure SetWrapMode(const Value: TdxGPWrapMode);
    function GetWrapMode: TdxGPWrapMode;
  public
    constructor Create; overload;
    constructor Create(rect: TdxGPRect; color1, color2: TdxGPColor; mode: TdxGPLinearGradientMode); overload;
    function SetLinearColors(color1, color2: TdxGPColor): TdxGPStatus;
    function GetLinearColors(out color1, color2: TdxGPColor): TdxGPStatus;
    function GetRectangle: TdxGPRect; overload;
    property WrapMode: TdxGPWrapMode read GetWrapMode write SetWrapMode;
  end;

  TdxGPHatchBrush = class(TdxGPBrush)
  public
    constructor Create; overload;
    constructor Create(hatchStyle: TdxGPHatchStyle; foreColor: TdxGPColor; backColor: TdxGPColor); overload;
    function GetHatchStyle: TdxGPHatchStyle;
    function GetForegroundColor: TdxGPColor;
    function GetBackgroundColor: TdxGPColor;
  end;

  TdxGPPen = class(TdxGPBase)
  private
    FNativePen: GpPen;
    FLastResult: TdxGPStatus;

    function GetAlignment: TdxGPPenAlignment;
    function GetColor: TdxGPColor;
    function GetBrush: TdxGPBrush;
    function GetWidth: Single;
    procedure SetAlignment(const Value: TdxGPPenAlignment);
    procedure SetColor(const Value: TdxGPColor);
    procedure SetBrush(const Value: TdxGPBrush);
    procedure SetWidth(const Value: Single);
  protected
    procedure SetNativePen(ANativePen: GpPen);
    function SetStatus(status: TdxGPStatus): TdxGPStatus;
  public
    constructor Create(color: TdxGPColor; width: Single = 1.0); overload;
    constructor Create(brush: TdxGPBrush; width: Single = 1.0); overload;
    destructor Destroy; override;
    function GetLastStatus: TdxGPStatus;
    function GetPenType: TdxGPPenType;
    property ALignment: TdxGPPenAlignment read GetAlignment write SetAlignment;
    property Brush: TdxGPBrush read GetBrush write SetBrush;
    property Color: TdxGPColor read GetColor write SetColor;
    property Width: Single read GetWidth write SetWidth;
  end;

  TdxGPGraphics = class(TdxGPBase)
  private
    FNativeGraphics: GpGraphics;
    FLastResult: TdxGPStatus;
  protected
    procedure SetNativeGraphics(AGraphics: GpGraphics);
    function SetStatus(status: TdxGPStatus): TdxGPStatus;
    function GetNativeGraphics: GpGraphics;
    function GetNativePen(pen: TdxGPPen): GpPen;
  public
    constructor Create(hdc: HDC); overload;
    destructor Destroy; override;
    function GetHDC: HDC;
    procedure ReleaseHDC(hdc: HDC);
    function GetLastStatus: TdxGPStatus;

    function DrawLine(pen: TdxGPPen; x1, y1, x2, y2: Integer): TdxGPStatus; overload;
    function DrawLine(pen: TdxGPPen; const pt1, pt2: TdxGPPoint): TdxGPStatus; overload;
    function DrawArc(pen: TdxGPPen; const rect: TdxGPRect; startAngle, sweepAngle: Single): TdxGPStatus; overload;
    function DrawBezier(pen: TdxGPPen; x1, y1, x2, y2, x3, y3, x4, y4: Integer): TdxGPStatus; overload;
    function DrawBezier(pen: TdxGPPen; const pt1, pt2, pt3, pt4: TdxGPPoint): TdxGPStatus; overload;
    function DrawRectangle(pen: TdxGPPen; const rect: TdxGPRect): TdxGPStatus; overload;
    function DrawEllipse(pen: TdxGPPen; const rect: TdxGPRect): TdxGPStatus; overload;
    function DrawPie(pen: TdxGPPen; const rect: TdxGPRect; startAngle, sweepAngle: Single): TdxGPStatus; overload;
    function DrawPolygon(pen: TdxGPPen; points: PdxGPPoint; count: Integer): TdxGPStatus; overload;
    function DrawCurve(pen: TdxGPPen; points: PdxGPPoint; count: Integer; tension: Single): TdxGPStatus; overload;
    function DrawClosedCurve(pen: TdxGPPen; points: PdxGPPoint; count: Integer; tension: Single): TdxGPStatus; overload;
    function Clear(color: TColor): TdxGPStatus;
    procedure FillRectangle(brush: TdxGPBrush; const rect: TdxGPRect);
    function FillPolygon(brush: TdxGPBrush; points: PdxGPPoint; count: Integer): TdxGPStatus; overload;
    function FillEllipse(brush: TdxGPBrush; const rect: TdxGPRect): TdxGPStatus; overload;
    function FillPie(brush: TdxGPBrush; const rect: TdxGPRect; startAngle, sweepAngle: Single): TdxGPStatus; overload;
    function FillClosedCurve(brush: TdxGPBrush; points: PdxGPPoint; count: Integer): TdxGPStatus; overload;
  end;

implementation

{ TdxGPBrush }

constructor TdxGPBrush.Create;
begin
  SetStatus(NotImplemented);
  FNativeBrush := nil;
end;

destructor TdxGPBrush.Destroy;
begin
  GdipDeleteBrush(FNativeBrush);
  inherited;
end;

constructor TdxGPBrush.CreateNative(nativeBrush: GpBrush; AStatus: Status);
begin
  inherited Create;
  FLastResult := AStatus;
  SetNativeBrush(FNativeBrush);
end;

function TdxGPBrush.Clone: TdxGPBrush;
var
  gpB: GpBrush;
begin
  gpB := nil;
  Result := nil;
  SetStatus (GdipCloneBrush(FNativeBrush, gpB));
  try
    Result := TdxGPBrush.CreateNative(gpB, FLastResult);
  except
    GdipDeleteBrush(gpB);
  end;
end;

function TdxGPBrush.GetLastStatus: Status;
begin
  Result := FLastResult;
  FLastResult := Ok;
end;

function TdxGPBrush.GetType: BrushType;
begin
  SetStatus(GdipGetBrushType (FNativeBrush, Result));
end;

procedure TdxGPBrush.SetNativeBrush(ANativeBrush: GpBrush);
begin
  FNativeBrush := ANativeBrush;
end;

function TdxGPBrush.SetStatus(AStatus: TdxGPStatus): TdxGPStatus;
begin
  Result := AStatus;
  if (AStatus <> Ok) and (FLastResult <> AStatus) then
  Result := GenericError;
end;

{ TdxGPSolidBrush }

constructor TdxGPSolidBrush.Create(color: TColor);
var
  ABrush: GpSolidFill;
begin
  ABrush := nil;
  FLastResult := GdipCreateSolidFill(color, ABrush);
  SetNativeBrush(ABrush);
end;

constructor TdxGPSolidBrush.Create;
begin
// hide parent method
end;

function TdxGPSolidBrush.GetColor: TdxGPColor;
begin
  SetStatus(GdipGetSolidFillColor(GPSOLIDFILL(FNativeBrush), Result));
end;

procedure TdxGPSolidBrush.SetColor(const Value: TdxGPColor);
begin
  SetStatus(GdipSetSolidFillColor(GpSolidFill(FNativeBrush), Value));
end;

{ TdxGPLinearGradientBrush }

constructor TdxGPLinearGradientBrush.Create(rect: TdxGPRect; color1, color2: TdxGPColor; mode: TdxGPLinearGradientMode);
var
  ABrush: GpLineGradient;
begin
  ABrush := nil;
  FLastResult := GdipCreateLineBrushFromRectI(@rect, color1, color2, mode, WrapModeTile, ABrush);
  SetNativeBrush(ABrush);
end;

constructor TdxGPLinearGradientBrush.Create;
begin
// hide parent method
end;

function TdxGPLinearGradientBrush.GetLinearColors(out color1, color2: TdxGPColor): TdxGPStatus;
var
  AColor: PARGB;
  AColors: array[0..1] of TdxGPColor;
begin
  AColor := @AColors;
  SetStatus(GdipGetLineColors(GpLineGradient(FNativeBrush), AColor));
  if (FLastResult = Ok) then
  begin
    color1 := AColors[0];
    color2 := AColors[1];
  end;
  Result := FLastResult;
end;

function TdxGPLinearGradientBrush.GetRectangle: TdxGPRect;
var
  ARect: PdxGPRect;
begin
  ARect := @Result;
  SetStatus(GdipGetLineRectI(GpLineGradient(FNativeBrush), ARect));
end;

function TdxGPLinearGradientBrush.GetWrapMode: TdxGPWrapMode;
begin
   Result := WrapModeTile;
   SetStatus(GdipGetLineWrapMode(GpLineGradient(FNativeBrush), Result));
end;

function TdxGPLinearGradientBrush.SetLinearColors(color1, color2: TdxGPColor): TdxGPStatus;
begin
  Result := SetStatus(GdipSetLineColors(GpLineGradient(FNativeBrush), color1, color2));
end;

procedure TdxGPLinearGradientBrush.SetWrapMode(const Value: TdxGPWrapMode);
begin
  SetStatus(GdipSetLineWrapMode(GpLineGradient(FNativeBrush), Value));
end;

{ TdxGPHatchBrush }

constructor TdxGPHatchBrush.Create;
begin
// hide parent method
end;

constructor TdxGPHatchBrush.Create(hatchStyle: TdxGPHatchStyle; foreColor,
  backColor: TdxGPColor);
var
  ABrush: GpHatch;
begin
  ABrush := nil;
  FLastResult := GdipCreateHatchBrush(hatchStyle, foreColor, backColor, ABrush);
  SetNativeBrush(ABrush);
end;

function TdxGPHatchBrush.GetBackgroundColor: TdxGPColor;
begin
  SetStatus(GdipGetHatchBackgroundColor(GpHatch(FNativeBrush), Result));
end;

function TdxGPHatchBrush.GetForegroundColor: TdxGPColor;
begin
  SetStatus(GdipGetHatchForegroundColor(GpHatch(FNativeBrush), Result));
end;

function TdxGPHatchBrush.GetHatchStyle: TdxGPHatchStyle;
begin
  SetStatus(GdipGetHatchStyle(GpHatch(FNativeBrush), Result));
end;

{ TdxGPPen }

constructor TdxGPPen.Create(brush: TdxGPBrush; width: Single);
var
  unit_: TdxGPUnit;
begin
  unit_ := UnitWorld;
  FNativePen := nil;
  FLastResult := GdipCreatePen2(brush.FNativeBrush, width, unit_, FNativePen);
end;

constructor TdxGPPen.Create(color: TdxGPColor; width: Single);
var
  unit_: TdxGPUnit;
begin
  unit_ := UnitWorld;
  FNativePen := nil;
  FLastResult := GdipCreatePen1(color, width, unit_, FNativePen);
end;

destructor TdxGPPen.Destroy;
begin
  GdipDeletePen(FNativePen);
  inherited;
end;

function TdxGPPen.GetAlignment: TdxGPPenAlignment;
begin
  SetStatus(GdipGetPenMode(FNativePen, Result));
end;

function TdxGPPen.GetBrush: TdxGPBrush;
var
  type_: TdxGPPenType;
  ABrush: TdxGPBrush;
  ANativeBrush: GpBrush;
begin
  type_ := GetPenType;
  ABrush := nil;
  case type_ of
     PenTypeSolidColor     : ABrush := TdxGPSolidBrush.Create;
     PenTypeHatchFill      : ABrush := TdxGPHatchBrush.Create;
     PenTypeTextureFill    : ABrush := TdxGPTextureBrush.Create;
     PenTypePathGradient   : ABrush := TdxGPBrush.Create;
     PenTypeLinearGradient : ABrush := TdxGPLinearGradientBrush.Create;
   end;
   if ABrush <> nil then
   begin
     SetStatus(GdipGetPenBrushFill(FNativePen, ANativeBrush));
     brush.SetNativeBrush(ANativeBrush);
   end;
   Result := ABrush;
end;

function TdxGPPen.GetColor: TdxGPColor;
var
  type_: TdxGPPenType;
  argb: DWORD;
begin
  type_ := GetPenType;
  Result := 0;
  if (type_ = PenTypeSolidColor) then
  begin
    SetStatus(GdipGetPenColor(FNativePen, argb));
    if FLastResult = Ok then Result := argb;
  end;
end;

function TdxGPPen.GetLastStatus: TdxGPStatus;
begin
  Result := FLastResult;
  FLastResult := Ok;
end;

function TdxGPPen.GetPenType: TdxGPPenType;
begin
  SetStatus(GdipGetPenFillType(FNativePen, Result));
end;

function TdxGPPen.GetWidth: Single;
begin
  SetStatus(GdipGetPenWidth(FNativePen, Result));
end;

procedure TdxGPPen.SetAlignment(const Value: TdxGPPenAlignment);
begin
  SetStatus(GdipSetPenMode(FNativePen, Value));
end;

procedure TdxGPPen.SetBrush(const Value: TdxGPBrush);
begin
  SetStatus(GdipSetPenBrushFill(FNativePen, Value.FNativeBrush));
end;

procedure TdxGPPen.SetColor(const Value: TdxGPColor);
begin
  SetStatus(GdipSetPenColor(FNativePen, Value));
end;

procedure TdxGPPen.SetNativePen(ANativePen: GpPen);
begin
  FNativePen := ANativePen;
end;

function TdxGPPen.SetStatus(status: TdxGPStatus): TdxGPStatus;
begin
  if (status <> Ok) then FLastResult := status;
  Result := status;
end;

procedure TdxGPPen.SetWidth(const Value: Single);
begin
  SetStatus(GdipSetPenWidth(FNativePen, Value));
end;


{ TdxGPGraphics }

constructor TdxGPGraphics.Create(hdc: HDC);
var
  AGraphics :GpGraphics;
begin
  inherited Create;
  AGraphics := nil;
  FLastResult := GdipCreateFromHDC(hdc, AGraphics);
  SetNativeGraphics(AGraphics);
end;

destructor TdxGPGraphics.Destroy;
begin
  GdipDeleteGraphics(FNativeGraphics);
  inherited;
end;

procedure TdxGPGraphics.FillRectangle(brush: TdxGPBrush; const rect: TdxGPRect);
begin
  SetStatus(GdipFillRectangleI(FNativeGraphics, brush.FNativeBrush, rect.X, rect.Y, rect.Width, rect.Height));
end;

procedure TdxGPGraphics.SetNativeGraphics(AGraphics: GpGraphics);
begin
  FNativeGraphics := AGraphics
end;

function TdxGPGraphics.Clear(color: TColor): TdxGPStatus;
begin
  Result := SetStatus(GdipGraphicsClear(FNativeGraphics, color));
end;


function TdxGPGraphics.DrawArc(pen: TdxGPPen; const rect: TdxGPRect;
  startAngle, sweepAngle: Single): TdxGPStatus;
begin
  Result := SetStatus(GdipDrawArcI(FNativeGraphics, pen.FNativePen,
     rect.X, rect.Y, rect.Width, rect.Height, startAngle, sweepAngle));
end;

function TdxGPGraphics.DrawBezier(pen: TdxGPPen; const pt1, pt2, pt3,
  pt4: TdxGPPoint): TdxGPStatus;
begin
  Result := SetStatus(GdipDrawBezierI(FNativeGraphics, pen.FNativePen,
      pt1.X, pt1.Y, pt2.X, pt2.Y, pt3.X, pt3.Y, pt4.X, pt1.Y));
end;

function TdxGPGraphics.DrawBezier(pen: TdxGPPen; x1, y1, x2, y2, x3, y3,
  x4, y4: Integer): TdxGPStatus;
begin
  Result := SetStatus(GdipDrawBezierI(FNativeGraphics, pen.FNativePen,
      x1, y1, x2, y2, x3, y3, x4, y4));
end;

function TdxGPGraphics.DrawClosedCurve(pen: TdxGPPen; points: PdxGPPoint;
  count: Integer; tension: Single): TdxGPStatus;
begin
  Result := SetStatus(GdipDrawClosedCurve2I(FNativeGraphics, pen.FNativePen,
      points, count, tension));
end;

function TdxGPGraphics.DrawCurve(pen: TdxGPPen; points: PdxGPPoint;
  count: Integer; tension: Single): TdxGPStatus;
begin
  Result := SetStatus(GdipDrawCurve2I(FNativeGraphics, pen.FNativePen,
      points, count, tension));
end;

function TdxGPGraphics.DrawEllipse(pen: TdxGPPen;
  const rect: TdxGPRect): TdxGPStatus;
begin
  Result := SetStatus(GdipDrawEllipseI(FNativeGraphics, pen.FNativePen,
      rect.X, rect.Y, rect.Width, rect.Height));
end;

function TdxGPGraphics.DrawLine(pen: TdxGPPen; x1, y1, x2, y2: Integer): TdxGPStatus;
begin
  Result := SetStatus(GdipDrawLineI(FNativeGraphics, pen.FNativePen, x1, y1, x2, y2));
end;

function TdxGPGraphics.DrawLine(pen: TdxGPPen; const pt1, pt2: TdxGPPoint): TdxGPStatus;
begin
  Result := SetStatus(GdipDrawLineI(FNativeGraphics, pen.FNativePen, pt1.X, pt1.Y, pt2.X, pt2.Y));
end;

function TdxGPGraphics.DrawPie(pen: TdxGPPen; const rect: TdxGPRect;
  startAngle, sweepAngle: Single): TdxGPStatus;
begin
  Result := SetStatus(GdipDrawPieI(FNativeGraphics, pen.FNativePen,
      rect.X, rect.Y, rect.Width, rect.Height, startAngle, sweepAngle));
end;

function TdxGPGraphics.DrawPolygon(pen: TdxGPPen; points: PdxGPPoint;
  count: Integer): TdxGPStatus;
begin
  Result := SetStatus(GdipDrawPolygonI(FNativeGraphics, pen.FNativePen, points, count));
end;

function TdxGPGraphics.DrawRectangle(pen: TdxGPPen;
  const rect: TdxGPRect): TdxGPStatus;
begin
  Result := SetStatus(GdipDrawRectangleI(FNativeGraphics, pen.FNativePen,
      rect.X, rect.Y, rect.Width, rect.Height));
end;

function TdxGPGraphics.FillClosedCurve(brush: TdxGPBrush; points: PdxGPPoint;
  count: Integer): TdxGPStatus;
begin
  Result := SetStatus(GdipFillClosedCurveI(FNativeGraphics, brush.FNativeBrush,
    points, count));
end;

function TdxGPGraphics.FillEllipse(brush: TdxGPBrush;
  const rect: TdxGPRect): TdxGPStatus;
begin
  Result := SetStatus(GdipFillEllipseI(FNativeGraphics, brush.FNativeBrush,
      rect.X, rect.Y, rect.Width, rect.Height));
end;

function TdxGPGraphics.FillPie(brush: TdxGPBrush; const rect: TdxGPRect;
  startAngle, sweepAngle: Single): TdxGPStatus;
begin
  Result := SetStatus(GdipFillPieI(FNativeGraphics, brush.FNativeBrush,
      rect.X, rect.Y, rect.Width, rect.Height, startAngle, sweepAngle));
end;

function TdxGPGraphics.FillPolygon(brush: TdxGPBrush; points: PdxGPPoint;
  count: Integer): TdxGPStatus;
begin
  Result := SetStatus(GdipFillPolygonI(FNativeGraphics, brush.FNativeBrush,
      points, count, FillModeAlternate));
end;

function TdxGPGraphics.GetHDC: HDC;
begin
  SetStatus(GdipGetDC(FNativeGraphics, Result));
end;

function TdxGPGraphics.GetLastStatus: TdxGPStatus;
begin
  Result := FLastResult;
  FLastResult := Ok;
end;

function TdxGPGraphics.GetNativeGraphics: GpGraphics;
begin
  Result := FNativeGraphics;
end;

function TdxGPGraphics.GetNativePen(pen: TdxGPPen): GpPen;
begin
  Result := pen.FNativePen;
end;

procedure TdxGPGraphics.ReleaseHDC(hdc: HDC);
begin
  SetStatus(GdipReleaseDC(FNativeGraphics, hdc));
end;

function TdxGPGraphics.SetStatus(status: TdxGPStatus): TdxGPStatus;
begin
  if (status <> Ok) then FLastResult := status;
  Result := status;
end;

end.
