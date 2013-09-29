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

unit dxGDIPlusAPI;

{$ALIGN ON}
{$MINENUMSIZE 4}

interface

(**************************************************************************\
*
*   GDI+ public header file
*
\**************************************************************************)

uses
  Windows, Graphics, ActiveX;

type
  INT16   = type Smallint;
  UINT16  = type Word;
  PUINT16 = ^UINT16;
  UINT32  = type Cardinal;
  TSingleDynArray = array of Single;


// GDI+ base memory allocation class
type
  TdxGPBase = class
  public
    class function NewInstance: TObject; override;
    procedure FreeInstance; override;
  end;

// Unit constants
 // {$EXTERNALSYM Unit}
  Unit_ = (
    UnitWorld,      // 0 -- World coordinate (non-physical unit)
    UnitDisplay,    // 1 -- Variable -- for PageTransform only
    UnitPixel,      // 2 -- Each unit is one device pixel.
    UnitPoint,      // 3 -- Each unit is a printer's point, or 1/72 inch.
    UnitInch,       // 4 -- Each unit is 1 inch.
    UnitDocument,   // 5 -- Each unit is 1/300 inch.
    UnitMillimeter  // 6 -- Each unit is 1 millimeter.
  );
  TdxGPUnit = Unit_;

// Fill mode constants
  {$EXTERNALSYM FillMode}
  FillMode = (
    FillModeAlternate,        // 0
    FillModeWinding           // 1
  );
  TdxGPFillMode = FillMode;


// Various wrap modes for brushes
  {$EXTERNALSYM WrapMode}
  WrapMode = (
    WrapModeTile,        // 0
    WrapModeTileFlipX,   // 1
    WrapModeTileFlipY,   // 2
    WrapModeTileFlipXY,  // 3
    WrapModeClamp        // 4
  );
  TdxGPWrapMode = WrapMode;

// Various hatch styles
  {$EXTERNALSYM HatchStyle}
  HatchStyle = (
    HatchStyleHorizontal,                  // = 0,
    HatchStyleVertical,                    // = 1,
    HatchStyleForwardDiagonal,             // = 2,
    HatchStyleBackwardDiagonal,            // = 3,
    HatchStyleCross,                       // = 4,
    HatchStyleDiagonalCross,               // = 5,
    HatchStyle05Percent,                   // = 6,
    HatchStyle10Percent,                   // = 7,
    HatchStyle20Percent,                   // = 8,
    HatchStyle25Percent,                   // = 9,
    HatchStyle30Percent,                   // = 10,
    HatchStyle40Percent,                   // = 11,
    HatchStyle50Percent,                   // = 12,
    HatchStyle60Percent,                   // = 13,
    HatchStyle70Percent,                   // = 14,
    HatchStyle75Percent,                   // = 15,
    HatchStyle80Percent,                   // = 16,
    HatchStyle90Percent,                   // = 17,
    HatchStyleLightDownwardDiagonal,       // = 18,
    HatchStyleLightUpwardDiagonal,         // = 19,
    HatchStyleDarkDownwardDiagonal,        // = 20,
    HatchStyleDarkUpwardDiagonal,          // = 21,
    HatchStyleWideDownwardDiagonal,        // = 22,
    HatchStyleWideUpwardDiagonal,          // = 23,
    HatchStyleLightVertical,               // = 24,
    HatchStyleLightHorizontal,             // = 25,
    HatchStyleNarrowVertical,              // = 26,
    HatchStyleNarrowHorizontal,            // = 27,
    HatchStyleDarkVertical,                // = 28,
    HatchStyleDarkHorizontal,              // = 29,
    HatchStyleDashedDownwardDiagonal,      // = 30,
    HatchStyleDashedUpwardDiagonal,        // = 31,
    HatchStyleDashedHorizontal,            // = 32,
    HatchStyleDashedVertical,              // = 33,
    HatchStyleSmallConfetti,               // = 34,
    HatchStyleLargeConfetti,               // = 35,
    HatchStyleZigZag,                      // = 36,
    HatchStyleWave,                        // = 37,
    HatchStyleDiagonalBrick,               // = 38,
    HatchStyleHorizontalBrick,             // = 39,
    HatchStyleWeave,                       // = 40,
    HatchStylePlaid,                       // = 41,
    HatchStyleDivot,                       // = 42,
    HatchStyleDottedGrid,                  // = 43,
    HatchStyleDottedDiamond,               // = 44,
    HatchStyleShingle,                     // = 45,
    HatchStyleTrellis,                     // = 46,
    HatchStyleSphere,                      // = 47,
    HatchStyleSmallGrid,                   // = 48,
    HatchStyleSmallCheckerBoard,           // = 49,
    HatchStyleLargeCheckerBoard,           // = 50,
    HatchStyleOutlinedDiamond,             // = 51,
    HatchStyleSolidDiamond,                // = 52,

    HatchStyleTotal                        // = 53,
  );

  const
    HatchStyleLargeGrid = HatchStyleCross; // 4
    HatchStyleMin       = HatchStyleHorizontal;
    HatchStyleMax       = HatchStyleSolidDiamond;

type
  TdxGPHatchStyle = HatchStyle;

// Dash style constants
  {$EXTERNALSYM DashStyle}
  DashStyle = (
    DashStyleSolid,          // 0
    DashStyleDash,           // 1
    DashStyleDot,            // 2
    DashStyleDashDot,        // 3
    DashStyleDashDotDot,     // 4
    DashStyleCustom          // 5
  );
  TdxGPDashStyle = DashStyle;

// WarpMode constants
  {$EXTERNALSYM WarpMode}
  WarpMode = (
    WarpModePerspective,    // 0
    WarpModeBilinear        // 1
  );
  TdxGPWarpMode = WarpMode;

// LineGradient Mode
  {$EXTERNALSYM LinearGradientMode}
  LinearGradientMode = (
    LinearGradientModeHorizontal,         // 0
    LinearGradientModeVertical,           // 1
    LinearGradientModeForwardDiagonal,    // 2
    LinearGradientModeBackwardDiagonal    // 3
  );
  TdxGPLinearGradientMode = LinearGradientMode;

// Pen types
  {$EXTERNALSYM PenAlignment}
  PenAlignment = (
    PenAlignmentCenter,      // = 0,
    PenAlignmentInset        // = 1
  );
  TdxGPPenAlignment = PenAlignment;

// Brush types
  {$EXTERNALSYM BrushType}
  BrushType = (
   BrushTypeSolidColor,      // = 0,
   BrushTypeHatchFill,       // = 1,
   BrushTypeTextureFill,     // = 2,
   BrushTypePathGradient,    // = 3,
   BrushTypeLinearGradient   // = 4
  );
  TdxGPBrushType = BrushType;


// Pen's Fill types
  {$EXTERNALSYM PenType}
  PenType = Integer;
const
  PenTypeSolidColor       =  0;
  PenTypeHatchFill        =  1;
  PenTypeTextureFill      =  2;
  PenTypePathGradient     =  3;
  PenTypeLinearGradient   =  4;
  PenTypeUnknown          = -1;
type
  TdxGPPenType = PenType;

// Status return values from GDI+ methods
type
  {$EXTERNALSYM Status}
  Status = (
    Ok,
    GenericError,
    InvalidParameter,
    OutOfMemory,
    ObjectBusy,
    InsufficientBuffer,
    NotImplemented,
    Win32Error,
    WrongState,
    Aborted,
    FileNotFound,
    ValueOverflow,
    AccessDenied,
    UnknownImageFormat,
    FontFamilyNotFound,
    FontStyleNotFound,
    NotTrueTypeFont,
    UnsupportedGdiplusVersion,
    GdiplusNotInitialized,
    PropertyNotFound,
    PropertyNotSupported
  );
  TdxGPStatus = Status;

// Represents a dimension in a 2D coordinate system (floating-point coordinates)
type
  PdxGPSizeF = ^TdxGPSizeF;
  TdxGPSizeF = packed record
    Width  : Single;
    Height : Single;
  end;

  function MakeSize(Width, Height: Single): TdxGPSizeF; overload;

// Represents a dimension in a 2D coordinate system (integer coordinates)
type
  PdxGPSize = ^TdxGPSize;
  TdxGPSize = packed record
    Width  : Integer;
    Height : Integer;
  end;

  function MakeSize(Width, Height: Integer): TdxGPSize; overload;

// Represents a location in a 2D coordinate system (floating-point coordinates)
type
  PdxGPPointF = ^TdxGPPointF;
  TdxGPPointF = packed record
    X : Single;
    Y : Single;
  end;
  TdxGPPointFDynArray = array of TdxGPPointF;

  function MakePoint(X, Y: Single): TdxGPPointF; overload;

// Represents a location in a 2D coordinate system (integer coordinates)
type
  PdxGPPoint = ^TdxGPPoint;
  TdxGPPoint = packed record
    X : Integer;
    Y : Integer;
  end;
  TdxGPPointDynArray = array of TdxGPPoint;

  function MakePoint(X, Y: Integer): TdxGPPoint; overload;

// Represents a rectangle in a 2D coordinate system (floating-point coordinates)
type
  PdxGPRectF = ^TdxGPRectF;
  TdxGPRectF = packed record
    X     : Single;
    Y     : Single;
    Width : Single;
    Height: Single;
  end;
  TdxGPRectFDynArray = array of TdxGPRectF;

  function MakeRect(x, y, width, height: Single): TdxGPRectF; overload;
  function MakeRect(location: TdxGPPointF; size: TdxGPSizeF): TdxGPRectF; overload;

type
  PdxGPRect = ^TdxGPRect;
  TdxGPRect = packed record
    X     : Integer;
    Y     : Integer;
    Width : Integer;
    Height: Integer;
  end;
  TdxGPRectDynArray = array of TdxGPRect;

  function MakeRect(x, y, width, height: Integer): TdxGPRect; overload;
  function MakeRect(location: TdxGPPoint; size: TdxGPSize): TdxGPRect; overload;
  function MakeRect(Rect: TRect): TdxGPRect; overload;

type
  {$EXTERNALSYM DebugEventLevel}
  DebugEventLevel = (
    DebugEventLevelFatal,
    DebugEventLevelWarning
  );
  TDebugEventLevel = DebugEventLevel;

  {$EXTERNALSYM DebugEventProc}
  DebugEventProc = procedure(level: DebugEventLevel; message: PChar); stdcall;

  {$EXTERNALSYM NotificationHookProc}
  NotificationHookProc = function(out token: ULONG): Status; stdcall;
  {$EXTERNALSYM NotificationUnhookProc}
  NotificationUnhookProc = procedure(token: ULONG); stdcall;

  // Input structure for GdiplusStartup
  {$EXTERNALSYM GdiplusStartupInput}
  GdiplusStartupInput = packed record
    GdiplusVersion          : Cardinal;       // Must be 1
    DebugEventCallback      : DebugEventProc; // Ignored on free builds
    SuppressBackgroundThread: BOOL;           // FALSE unless you're prepared to call
                                              // the hook/unhook functions properly
    SuppressExternalCodecs  : BOOL;           // FALSE unless you want GDI+ only to use
  end;                                        // its internal image codecs.
  TGdiplusStartupInput = GdiplusStartupInput;
  PGdiplusStartupInput = ^TGdiplusStartupInput;

  // Output structure for GdiplusStartup()
  {$EXTERNALSYM GdiplusStartupOutput}
  GdiplusStartupOutput = packed record
    NotificationHook  : NotificationHookProc;
    NotificationUnhook: NotificationUnhookProc;
  end;
  TGdiplusStartupOutput = GdiplusStartupOutput;
  PGdiplusStartupOutput = ^TGdiplusStartupOutput;


type
  PARGB  = ^ARGB;
  ARGB   = DWORD;
  {$EXTERNALSYM ARGB}
  ARGB64 = Int64;
  {$EXTERNALSYM ARGB64}

// Color
const
  AlphaShift  = 24;
  {$EXTERNALSYM AlphaShift}
  RedShift    = 16;
  {$EXTERNALSYM RedShift}
  GreenShift  = 8;
  {$EXTERNALSYM GreenShift}
  BlueShift   = 0;
  {$EXTERNALSYM BlueShift}

  AlphaMask   = $ff000000;
  {$EXTERNALSYM AlphaMask}
  RedMask     = $00ff0000;
  {$EXTERNALSYM RedMask}
  GreenMask   = $0000ff00;
  {$EXTERNALSYM GreenMask}
  BlueMask    = $000000ff;
  {$EXTERNALSYM BlueMask}

type
  PdxGPColor = ^TdxGPColor;
  TdxGPColor = ARGB;
  TdxGPColorDynArray = array of TdxGPColor;

  function MakeColor(r, g, b: Byte): TdxGPColor; overload;
  function MakeColor(a, r, g, b: Byte): TdxGPColor; overload;
  function MakeColor(color: TColor; alpha: Byte): TdxGPColor; overload;
  function GetAlpha(color: ARGB): BYTE;
  function GetRed(color: ARGB): BYTE;
  function GetGreen(color: ARGB): BYTE;
  function GetBlue(color: ARGB): BYTE;
  function ColorRefToARGB(rgb: COLORREF): ARGB;
  function ARGBToColorRef(Color: ARGB): COLORREF;


// Private GDI+ classes for internal type checking
type
  GpGraphics = Pointer;

  GpBrush = Pointer;
  GpTexture = Pointer;
  GpSolidFill = Pointer;
  GpLineGradient = Pointer;
  GpPathGradient = Pointer;
  GpHatch =  Pointer;
  GpPen = Pointer;

  GpStatus          = TdxGPStatus;
  GpFillMode        = TdxGPFillMode;
  GpWrapMode        = TdxGPWrapMode;
  GpUnit            = TdxGPUnit;
  GpPointF          = PdxGPPointF;
  GpPoint           = PdxGPPoint;
  GpRectF           = PdxGPRectF;
  GpRect            = PdxGPRect;
  GpSizeF           = PdxGPSizeF;
  GpHatchStyle      = TdxGPHatchStyle;
  GpDashStyle       = TdxGPDashStyle;
  GpPenAlignment    = TdxGPPenAlignment;
  GpPenType         = TdxGPPenType;
  GpBrushType       = TdxGPBrushType;

var
  // GDI+ Memory managment methods
  GdipAlloc: function(size: ULONG): pointer; stdcall;
  GdipFree: procedure(ptr: pointer); stdcall;
  // GDI+ initialization/finalization methods
  GdiplusStartup: function(out token: DWORD; const input: GdiplusStartupInput; output: PGdiplusStartupOutput): Status; stdcall;
  GdiplusShutdown: procedure(token: DWORD); stdcall;
  // GDI+ Brush methods
  GdipCloneBrush: function(brush :GpBrush; var clonebrush :GpBrush) :GpStatus; stdcall;
  GdipDeleteBrush: function(brush :GpBrush) :GpStatus; stdcall;
  GdipGetBrushType: function(brush :GpBrush; var bt :GpBrushType) :GpStatus; stdcall;
  // GDI+ Solid Brush methods
  GdipCreateSolidFill: function(color :ARGB; var brush :GpSolidFill) :GpStatus; stdcall;
  GdipSetSolidFillColor: function(brush :GpSolidFill; color :ARGB) :GpStatus; stdcall;
  GdipGetSolidFillColor: function(brush :GpSolidFill; var color :ARGB) :GpStatus; stdcall;
  // GDI+ Gradient Brush methods
  GdipCreateLineBrushFromRectI: function(const rect :GpRectF; color1,color2 :ARGB; mode :LinearGradientMode;
      wrapmode :GpWrapMode; var lineGradient :GpLineGradient) :GpStatus; stdcall;
  GdipGetLineRectI: function(brush :GpLineGradient; var rect :GpRect) :GpStatus; stdcall;
  GdipSetLineColors: function(brush :GpLineGradient; color1,color2 :ARGB) :GpStatus; stdcall;
  GdipGetLineColors: function(brush :GpLineGradient; colors :PARGB) :GpStatus; stdcall;
  GdipSetLineWrapMode: function(brush :GpLineGradient; wrapmode :GpWrapMode) :GpStatus; stdcall;
  GdipGetLineWrapMode: function(brush :GpLineGradient; wrapmode :GpWrapMode) :GpStatus; stdcall;
  // GDI+ Hatch Brush methods
  GdipCreateHatchBrush: function(hatchstyle :GpHatchStyle; forecol,backcol :ARGB; var brush :GpHatch) :GpStatus; stdcall;
  GdipGetHatchStyle: function(brush :GpHatch; var hatchstyle :GpHatchStyle) :GpStatus; stdcall;
  GdipGetHatchForegroundColor: function(brush :GpHatch; var forecol :ARGB) :GpStatus; stdcall;
  GdipGetHatchBackgroundColor: function(brush :GpHatch; var backcol :ARGB) :GpStatus; stdcall;
  // GDI+ Pen methods
  GdipCreatePen1: function(color :ARGB; width :single; u :GpUnit; var pen :GpPen) :GpStatus; stdcall;
  GdipCreatePen2: function(brush :GpBrush; width :single; u :GpUnit; var pen :GpPen) :GpStatus; stdcall;
  GdipClonePen: function(pen :GpPen; var clonepen :GpPen) :GpStatus; stdcall;
  GdipDeletePen: function(pen :GpPen) :GpStatus; stdcall;
  GdipGetPenFillType: function(pen :GpPen; var penType :GpPenType) :GpStatus; stdcall;
  GdipSetPenBrushFill: function(pen :GpPen; brush :GpBrush) :GpStatus; stdcall;
  GdipGetPenBrushFill: function(pen :GpPen; var brush :GpBrush) :GpStatus; stdcall;
  GdipSetPenColor: function(pen :GpPen; color :ARGB) :GpStatus; stdcall;
  GdipGetPenColor: function(pen :GpPen; var color :ARGB) :GpStatus; stdcall;
  GdipSetPenMode: function(pen :GpPen; penMode :GpPenAlignment) :GpStatus; stdcall;
  GdipGetPenMode: function(pen :GpPen; var penMode :GpPenAlignment) :GpStatus; stdcall;
  GdipSetPenWidth: function(pen :GpPen; width :single) :GpStatus; stdcall;
  GdipGetPenWidth: function(pen :GpPen; var width :single) :GpStatus; stdcall;
  // GDI+ Graphis methods
  GdipCreateFromHDC: function(hdc :HDC; var graphics :GpGraphics) :GpStatus; stdcall;
  GdipDeleteGraphics: function(graphics :GpGraphics) :GpStatus; stdcall;
  GdipGetDC: function(graphics :GpGraphics; var hdc :HDC) :GpStatus; stdcall;
  GdipReleaseDC: function(graphics :GpGraphics; hdc :HDC) :GpStatus; stdcall;
  GdipGraphicsClear: function(graphics :GpGraphics; color :ARGB) :GpStatus; stdcall;
  GdipDrawLineI: function(graphics :GpGraphics; pen :GpPen; x1,y1,x2,y2 :integer) :GpStatus; stdcall;
  GdipFillRectangleI: function(graphics :GpGraphics; brush :GpBrush; x,y,width,height :integer) :GpStatus; stdcall;
  GdipDrawArcI: function(graphics :GpGraphics; pen :GpPen; x,y,width,height :integer;
      startAngle,sweepAngle :single) :GpStatus; stdcall;
  GdipDrawBezierI: function(graphics :GpGraphics; pen :GpPen; x1,y1,x2,y2,x3,y3,x4,y4 :integer) :GpStatus; stdcall;
  GdipDrawRectangleI: function(graphics :GpGraphics; pen :GpPen; x,y,width,height :integer) :GpStatus; stdcall;
  GdipDrawEllipseI: function(graphics :GpGraphics; pen :GpPen; x,y,width,height :integer) :GpStatus; stdcall;
  GdipDrawPieI: function(graphics :GpGraphics; pen :GpPen; x,y,width,height :integer;
      startAngle,sweepAngle :single) :GpStatus; stdcall;
  GdipDrawPolygonI: function(graphics :GpGraphics; pen :GpPen; const points :GpPoint;
      count :integer) :GpStatus; stdcall;
  GdipDrawCurve2I: function(graphics :GpGraphics; pen :GpPen; const points :GpPoint;
      count :integer; tension :single) :GpStatus; stdcall;
  GdipDrawClosedCurve2I: function(graphics :GpGraphics; pen :GpPen; const points :GpPoint;
      count :integer; tension :single) :GpStatus; stdcall;
  GdipFillPolygonI: function(graphics :GpGraphics; brush :GpBrush; const points :GpPoint;
      count :integer; fillmode :GpFillMode) :GpStatus; stdcall;
  GdipFillEllipseI: function(graphics :GpGraphics; brush :GpBrush; x,y,width,height :integer) :GpStatus; stdcall;
  GdipFillPieI: function(graphics :GpGraphics; brush :GpBrush; x,y,width,height :integer;
      startAngle,sweepAngle :single) :GpStatus; stdcall;
  GdipFillClosedCurveI: function(graphics :GpGraphics; brush :GpBrush; const points :GpPoint;
      count :integer) :GpStatus; stdcall;


function CheckGdiPlus: Boolean;

implementation

const
  GDIPlusDll = 'gdiplus.dll';
var
  GDIPlusLib: Integer;
  GDIPresent: Boolean;

function CheckGdiPlus: Boolean;
begin
  Result := GDIPresent;
end;

{ TGdiplusBase }

class function TdxGPBase.NewInstance: TObject;
begin
  Result := InitInstance(GdipAlloc(ULONG(instanceSize)));
end;

procedure TdxGPBase.FreeInstance;
begin
  CleanupInstance;
  GdipFree(Self);
end;


{ TdxGPPoint }

function MakePoint(X, Y: Integer): TdxGPPoint;
begin
  result.X := X;
  result.Y := Y;
end;

function MakePoint(X, Y: Single): TdxGPPointF;
begin
  Result.X := X;
  result.Y := Y;
end;

{ TdxGPSizeF }

function MakeSize(Width, Height: Single): TdxGPSizeF;
begin
  result.Width := Width;
  result.Height := Height;
end;

function MakeSize(Width, Height: Integer): TdxGPSize;
begin
  result.Width := Width;
  result.Height := Height;
end;

{ TdxGPRectF }

function MakeRect(x, y, width, height: Single): TdxGPRectF; overload;
begin
  Result.X      := x;
  Result.Y      := y;
  Result.Width  := width;
  Result.Height := height;
end;

function MakeRect(location: TdxGPPointF; size: TdxGPSizeF): TdxGPRectF; overload;
begin
  Result.X      := location.X;
  Result.Y      := location.Y;
  Result.Width  := size.Width;
  Result.Height := size.Height;
end;

{ TdxGPRect }

function MakeRect(x, y, width, height: Integer): TdxGPRect; overload;
begin
  Result.X      := x;
  Result.Y      := y;
  Result.Width  := width;
  Result.Height := height;
end;

function MakeRect(location: TdxGPPoint; size: TdxGPSize): TdxGPRect; overload;
begin
  Result.X      := location.X;
  Result.Y      := location.Y;
  Result.Width  := size.Width;
  Result.Height := size.Height;
end;

function MakeRect(Rect: TRect): TdxGPRect; overload;
begin
  Result.X      := Rect.Left;
  Result.Y      := Rect.Top;
  Result.Width  := Rect.Right - Rect.Left;
  Result.Height := Rect.Bottom - Rect.Top;
end;

{ TdxGPColor }

function MakeColor(r, g, b: Byte): ARGB; overload;
begin
  result := MakeColor(255, r, g, b);
end;

function MakeColor(a, r, g, b: Byte): ARGB; overload;
begin
  result := ((DWORD(b) shl  BlueShift) or
             (DWORD(g) shl GreenShift) or
             (DWORD(r) shl   RedShift) or
             (DWORD(a) shl AlphaShift));
end;

function MakeColor(color: TColor; alpha: Byte): ARGB; overload;
begin
  result := MakeColor(alpha, GetRValue(color), GetGValue(color), GetBValue(color));
end;

function GetAlpha(color: ARGB): BYTE;
begin
  result := BYTE(color shr AlphaShift);
end;

function GetRed(color: ARGB): BYTE;
begin
  result := BYTE(color shr RedShift);
end;

function GetGreen(color: ARGB): BYTE;
begin
  result := BYTE(color shr GreenShift);
end;

function GetBlue(color: ARGB): BYTE;
begin
  result := BYTE(color shr BlueShift);
end;

function ColorRefToARGB(rgb: COLORREF): ARGB;
begin
  result := MakeColor(255, GetRValue(rgb), GetGValue(rgb), GetBValue(rgb));
end;

function ARGBToColorRef(Color: ARGB): COLORREF;
begin
  result := RGB(GetRed(Color), GetGreen(Color), GetBlue(Color));
end;

{ GDI+ loading }

procedure GdiPlusLoad;
  function LoadGdiPlusMethod(const ProcName: string): Pointer;
  begin
    Result := nil;
    if GDIPresent then
      Result := GetProcAddress(GDIPlusLib, PChar(ProcName));
    GDIPresent := Result <> nil;
  end;
begin
  GDIPlusLib := LoadLibrary(GDIPlusDll);
  GDIPresent := GDIPlusLib <> 0;
  if GDIPresent then
  begin
    // GDI+ Memory managment methods loading
    GdipAlloc := LoadGdiPlusMethod('GdipAlloc');
    GdipFree := LoadGdiPlusMethod('GdipFree');
    // GDI+ initialization/finalization methods loading
    GdiplusStartup := LoadGdiPlusMethod('GdiplusStartup');
    GdiplusShutdown := LoadGdiPlusMethod('GdiplusShutdown');
    // GDI+ Brush methods loading
    GdipCloneBrush := LoadGdiPlusMethod('GdipCloneBrush');
    GdipDeleteBrush := LoadGdiPlusMethod('GdipDeleteBrush');
    GdipGetBrushType := LoadGdiPlusMethod('GdipGetBrushType');
    // GDI+ Solid Brush methods loading
    GdipCreateSolidFill := LoadGdiPlusMethod('GdipCreateSolidFill');
    GdipSetSolidFillColor := LoadGdiPlusMethod('GdipSetSolidFillColor');
    GdipGetSolidFillColor := LoadGdiPlusMethod('GdipGetSolidFillColor');
    // GDI+ Gradient Brush methods loading
    GdipCreateLineBrushFromRectI := LoadGdiPlusMethod('GdipCreateLineBrushFromRectI');
    GdipGetLineRectI := LoadGdiPlusMethod('GdipGetLineRectI');
    GdipSetLineColors := LoadGdiPlusMethod('GdipSetLineColors');
    GdipGetLineColors := LoadGdiPlusMethod('GdipGetLineColors');
    GdipSetLineWrapMode := LoadGdiPlusMethod('GdipSetLineWrapMode');
    GdipGetLineWrapMode := LoadGdiPlusMethod('GdipGetLineWrapMode');
    // GDI+ Hatch Brush methods loading
    GdipCreateHatchBrush := LoadGdiPlusMethod('GdipCreateHatchBrush');
    GdipGetHatchStyle := LoadGdiPlusMethod('GdipGetHatchStyle');
    GdipGetHatchForegroundColor := LoadGdiPlusMethod('GdipGetHatchForegroundColor');
    GdipGetHatchBackgroundColor := LoadGdiPlusMethod('GdipGetHatchBackgroundColor');
    // GDI+ Pen methods loading
    GdipCreatePen1 := LoadGdiPlusMethod('GdipCreatePen1');
    GdipCreatePen2 := LoadGdiPlusMethod('GdipCreatePen2');
    GdipClonePen := LoadGdiPlusMethod('GdipClonePen');
    GdipDeletePen := LoadGdiPlusMethod('GdipDeletePen');
    GdipGetPenFillType := LoadGdiPlusMethod('GdipGetPenFillType');
    GdipSetPenBrushFill := LoadGdiPlusMethod('GdipSetPenBrushFill');
    GdipGetPenBrushFill := LoadGdiPlusMethod('GdipGetPenBrushFill');
    GdipSetPenColor := LoadGdiPlusMethod('GdipSetPenColor');
    GdipGetPenColor := LoadGdiPlusMethod('GdipGetPenColor');
    GdipSetPenMode := LoadGdiPlusMethod('GdipSetPenMode');
    GdipGetPenMode := LoadGdiPlusMethod('GdipGetPenMode');
    GdipSetPenWidth := LoadGdiPlusMethod('GdipSetPenWidth');
    GdipGetPenWidth := LoadGdiPlusMethod('GdipGetPenWidth');
    // GDI+ Graphis methods loading
    GdipCreateFromHDC := LoadGdiPlusMethod('GdipCreateFromHDC');
    GdipDeleteGraphics := LoadGdiPlusMethod('GdipDeleteGraphics');
    GdipGetDC := LoadGdiPlusMethod('GdipGetDC');
    GdipReleaseDC := LoadGdiPlusMethod('GdipReleaseDC');
    GdipGraphicsClear := LoadGdiPlusMethod('GdipGraphicsClear');
    GdipDrawLineI := LoadGdiPlusMethod('GdipDrawLineI');
    GdipFillRectangleI := LoadGdiPlusMethod('GdipFillRectangleI');
    GdipDrawArcI := LoadGdiPlusMethod('GdipDrawArcI');
    GdipDrawBezierI := LoadGdiPlusMethod('GdipDrawBezierI');
    GdipDrawRectangleI := LoadGdiPlusMethod('GdipDrawRectangleI');
    GdipDrawEllipseI := LoadGdiPlusMethod('GdipDrawEllipseI');
    GdipDrawPieI := LoadGdiPlusMethod('GdipDrawPieI');
    GdipDrawPolygonI := LoadGdiPlusMethod('GdipDrawPolygonI');
    GdipDrawCurve2I := LoadGdiPlusMethod('GdipDrawCurve2I');
    GdipDrawClosedCurve2I := LoadGdiPlusMethod('GdipDrawClosedCurve2I');
    GdipFillPolygonI := LoadGdiPlusMethod('GdipFillPolygonI');
    GdipFillEllipseI := LoadGdiPlusMethod('GdipFillEllipseI');
    GdipFillPieI := LoadGdiPlusMethod('GdipFillPieI');
    GdipFillClosedCurveI := LoadGdiPlusMethod('GdipFillClosedCurveI');
  end;
end;

procedure GdiPlusUnload;
begin
  if GDIPlusLib <> 0 then FreeLibrary(GDIPlusLib);
end;

var
  token: DWORD;

procedure GdiPlusInitialize;
const
  DefaultStartup: GdiplusStartupInput =
    (GdiplusVersion: 1;
     DebugEventCallback: nil; SuppressBackgroundThread: False;
     SuppressExternalCodecs: False);
var
  Ret: Status;
begin
  if not GDIPresent then exit;
  Ret := GdiPlusStartup (token, DefaultStartup, nil);
  if Ret <> OK then GDIPresent := False;
end;

procedure GdiPlusFinalize;
begin
  if not GDIPresent then exit;
  GdiPlusShutdown (token);
end;

initialization
  GdiPlusLoad;
  GdiPlusInitialize;

finalization
  GdiPlusFinalize;
  GdiPlusUnload;

end.




