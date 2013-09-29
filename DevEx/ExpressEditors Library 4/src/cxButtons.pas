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

unit cxButtons;

{$I cxEdVer.inc}

interface

uses
{$IFDEF VCL}
  Windows, Messages, dxThemeManager,
{$ELSE}
  Qt, QTypes,
{$ENDIF}
{$IFDEF DELPHI6}
  Types,
{$ENDIF}
  Classes, Controls, Graphics, StdCtrls, Forms, Menus,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Buttons, cxControls;

const
{$IFDEF VCL}
  CM_DROPDOWNPOPUPMENU = WM_APP + 300;
  CM_CLOSEUPPOPUPMENU = WM_APP + 301;
{$ELSE}
  QEventType_CMDropDownPopupMenu = QEventType(Integer(QEventType_ClxUser) + 301);
  QEventType_CMCloseUpPopupMenu = QEventType(Integer(QEventType_ClxUser) + 302);
{$ENDIF}

type
  TcxCustomButton = class;
  TcxButtonKind = (cxbkStandard, cxbkDropDown, cxbkDropDownButton);
  TcxButtonAssignedColors = set of TcxButtonState;
  TcxButtonGetDrawParamsEvent = procedure(Sender: TcxCustomButton;
    AState: TcxButtonState; var AColor: TColor; AFont: TFont) of object;

  { TcxButtonColors }

  TcxButtonColors = class(TPersistent)
  private
    FButton: TcxCustomButton;
    FAssignedColors: TcxButtonAssignedColors;
    FColors: array[TcxButtonState] of TColor;
    function GetColor(const Index: Integer): TColor;
    function IsStored(const Index: Integer): Boolean;
    procedure SetAssignedColors(Value: TcxButtonAssignedColors);
    procedure SetColor(const Index: Integer; const Value: TColor);
  public
    constructor Create(AOwner: TcxCustomButton);
    procedure Assign(Source: TPersistent); override;
  published
    property AssignedColors: TcxButtonAssignedColors read FAssignedColors write SetAssignedColors stored False;
    property Default: TColor index Ord(cxbsDefault) read GetColor write SetColor stored IsStored;
    property Normal: TColor index Ord(cxbsNormal) read GetColor write SetColor stored IsStored;
    property Hot: TColor index Ord(cxbsHot) read GetColor write SetColor stored IsStored;
    property Pressed: TColor index Ord(cxbsPressed) read GetColor write SetColor stored IsStored;
    property Disabled: TColor index Ord(cxbsDisabled) read GetColor write SetColor stored IsStored;
  end;

  { TcxCustomButton }

  TcxCustomButton = class(TButton, IcxMouseTrackingCaller)
  private
    FIsDown, FIsDefault: Boolean;
    FCanvas: TcxCanvas;
    FColors: TcxButtonColors;
    FControlCanvas: TControlCanvas;
    FLockDown: Boolean;
  {$IFDEF VCL}
    FThemeChangedNotificator: TdxThemeChangedNotificator;
  {$ELSE}
    FClosing: Boolean;
  {$ENDIF}
  {$IFDEF LINUX}
    FDblClick: Boolean;
  {$ENDIF}
    FDoPopup: Boolean;
    FDropDownMenu: TPopupMenu;
    FIsFocused: Boolean;
    FIsMouseClick: Boolean;
    FKind: TcxButtonKind;
    FLookAndFeel: TcxLookAndFeel;
    FUseSystemPaint: Boolean;

    // glyph support
    FGlyph: Pointer;
    FLayout: TButtonLayout;
    FModifiedGlyph: Boolean;
    FMargin: Integer;
    FMenuVisible: Boolean;
    FMouseInControl: Boolean;
    FSpacing: Integer;
    // events
    FOnGetDrawParams: TcxButtonGetDrawParamsEvent;
    //IcxMouseTrackingCaller
    procedure IcxMouseTrackingCaller.MouseLeave = ButtonMouseLeave;
    procedure ButtonMouseLeave;
    // glyph support
    procedure SetGlyph(Value: TBitmap);
    function GetGlyph: TBitmap;
    function GetNumGlyphs: TNumGlyphs;
    procedure SetNumGlyphs(Value: TNumGlyphs);
    procedure GlyphChanged(Sender: TObject);
    procedure SetLayout(Value: TButtonLayout);
    procedure SetSpacing(Value: Integer);
    procedure SetMargin(Value: Integer);
  {$IFDEF VCL}
    procedure DrawItem(const DrawItemStruct: TDrawItemStruct);
    procedure ThemeChanged;
    procedure WMCaptureChanged(var Message: TMessage); message WM_CAPTURECHANGED;
    procedure WMLButtonDblClk(var Message: TWMLButtonDblClk); message WM_LBUTTONDBLCLK;
    procedure WMLButtonDown(var Message: TMessage); message WM_LBUTTONDOWN;
    procedure WMLButtonUp(var Message: TMessage); message WM_LBUTTONUP;
    procedure CNDrawItem(var Message: TWMDrawItem); message CN_DRAWITEM;
    procedure CNMeasureItem(var Message: TWMMeasureItem); message CN_MEASUREITEM;
    procedure CMCloseupPopupMenu(var Message: TMessage); message CM_CLOSEUPPOPUPMENU;
    procedure CMDropDownPopupMenu(var Message: TMessage); message CM_DROPDOWNPOPUPMENU;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
  {$ENDIF}
    procedure DoDropDownMenu;
    procedure InternalPaint;
    procedure InternalRecreateWindow;
    function IsColorsStored: Boolean;
    function IsHotTrack: Boolean;
    procedure LookAndFeelChanged(Sender: TcxLookAndFeel;
      AChangedValues: TcxLookAndFeelValues);
    procedure SetColors(const Value: TcxButtonColors);
    procedure SetKind(const Value: TcxButtonKind);
    procedure SetLookAndFeel(Value: TcxLookAndFeel);
    procedure SetUseSystemPaint(const Value: Boolean);
  protected
    procedure ActionChange(Sender: TObject; CheckDefaults: Boolean); override;
  {$IFDEF VCL}
    procedure CreateHandle; override;
    procedure CreateParams(var Params: TCreateParams); override;
    function GetPalette: HPALETTE; override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure SetButtonStyle(ADefault: Boolean); override;
  {$ELSE}
    procedure EnabledChanged; override;
    function EventFilter(Sender: QObjectH; Event: QEventH): Boolean; override;
    procedure FontChanged; override;
    procedure InitWidget; override;
    procedure MouseEnter(AControl: TControl); override;
    procedure MouseLeave(AControl: TControl); override;
    function NeedKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; override;
    procedure Painting(Sender: QObjectH; EventRegion: QRegionH); override;
    function WidgetFlags: Integer; override;
  {$ENDIF}
    function GetPainterClass: TcxCustomLookAndFeelPainterClass; virtual;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    function StandardButton: Boolean; virtual;
    property Colors: TcxButtonColors read FColors write SetColors stored IsColorsStored;
    property DropDownMenu: TPopupMenu read FDropDownMenu write FDropDownMenu;
    property Glyph: TBitmap read GetGlyph write SetGlyph;
    property Kind: TcxButtonKind read FKind write SetKind default cxbkStandard;
    property Layout: TButtonLayout read FLayout write SetLayout default blGlyphLeft;
    property LookAndFeel: TcxLookAndFeel read FLookAndFeel write SetLookAndFeel;
    property Margin: Integer read FMargin write SetMargin default -1;
    property NumGlyphs: TNumGlyphs read GetNumGlyphs write SetNumGlyphs default 1;
    property Spacing: Integer read FSpacing write SetSpacing default 4;
    property UseSystemPaint: Boolean
      read FUseSystemPaint write SetUseSystemPaint default True;
    property OnGetDrawParams: TcxButtonGetDrawParamsEvent
      read FOnGetDrawParams write FOnGetDrawParams;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Click; override;
  end;

  { TcxButton }

  TcxButton = class(TcxCustomButton)
  published
    property Action;
    property Anchors;
  {$IFDEF VCL}
    property BiDiMode;
  {$ENDIF}
    property Cancel;
    property Caption;
    property Colors;
    property Constraints;
    property Default;
    property DropDownMenu;
    property Enabled;
    property Glyph;
    property Kind;
    property Layout;
    property LookAndFeel;
    property Margin;
    property ModalResult;
    property NumGlyphs;
    property ParentShowHint;
  {$IFDEF VCL}
    property ParentBiDiMode;
  {$ENDIF}
    property ShowHint;
    property Spacing;
    property TabOrder;
    property TabStop;
    property UseSystemPaint;
    property Visible;
    property OnEnter;
    property OnExit;
    property OnGetDrawParams;
  end;

implementation

uses
{$IFDEF VCL}
  dxuxTheme, CommCtrl,
{$ENDIF}
{$IFNDEF DELPHI5}
  cxClasses,
{$ENDIF}
  SysUtils, Consts, Dialogs, ActnList, ImgList;

const
  cxDropDownButtonWidth = 15;
  EmptyPoint: TPoint = (X: 0; Y: 0);
  EmptyRect: TRect = (Left: 0; Top: 0; Right: 0; Bottom: 0);

{ TcxButtonColors }

constructor TcxButtonColors.Create(AOwner: TcxCustomButton);
var
  AState: TcxButtonState;
begin
  FButton := AOwner;
  for AState := cxbsDefault to cxbsDisabled do
    FColors[AState] := clDefault;
end;

function TcxButtonColors.GetColor(const Index: Integer): TColor;
begin
  Result := FColors[TcxButtonState(Index)];
end;

function TcxButtonColors.IsStored(const Index: Integer): Boolean;
begin
  Result := TcxButtonState(Index) in FAssignedColors;
end;

procedure TcxButtonColors.SetAssignedColors(
  Value: TcxButtonAssignedColors);
var
  AState: TcxButtonState;
begin
  if (FAssignedColors <> Value) and (csDesigning in FButton.ComponentState) then
  begin
    for AState := cxbsDefault to cxbsDisabled do
      if not (AState in Value) then
        FColors[AState] := clDefault
      else
        if FColors[AState] = clDefault then Exclude(Value, AState);
    FAssignedColors := Value;
    FButton.Invalidate;
  end;
end;

procedure TcxButtonColors.SetColor(const Index: Integer;
  const Value: TColor);
begin
  if (Value = clNone) or (Value = clDefault) then
  begin
    FColors[TcxButtonState(Index)] := clDefault;
    Exclude(FAssignedColors, TcxButtonState(Index));
    FButton.Invalidate;
  end
  else if GetColor(Index) <> Value then
  begin
    FColors[TcxButtonState(Index)] := Value;
    Include(FAssignedColors, TcxButtonState(Index));
    FButton.Invalidate;
  end;
end;

procedure TcxButtonColors.Assign(Source: TPersistent);
begin
  if Source is TcxButtonColors then
    with TcxButtonColors(Source) do
    begin
      Self.FColors := FColors;
      Self.FAssignedColors := FAssignedColors;
      Self.FButton.Invalidate;
    end
    else
      inherited Assign(Source);
end;

type
  TMenuItemAccess = class(TMenuItem);
  TcxLookAndFeelPainterAccess = class(TcxCustomLookAndFeelPainter);

{$IFNDEF VCL}

  { TcxObjectEventFilter }

  TcxObjectEventFilter = class
  private
    FObjectHook: QObject_hookH;
    function ObjectHookProc(Sender: QObjectH; Event: QEventH): Boolean; cdecl;
  public
    constructor Create(AObject: QObjectH);
    destructor Destroy; override;
  end;

var
  FObjectEventFilter: TcxObjectEventFilter;
  FCurrentMenuButton: TcxCustomButton = nil;
  FCurrentMenuHandle: QWidgetH = nil;

constructor TcxObjectEventFilter.Create(AObject: QObjectH);
var
  Method: TMethod;
begin
  inherited Create;
  FObjectHook := QObject_hook_create(AObject);
  TEventFilterMethod(Method) := ObjectHookProc;
  Qt_hook_hook_events(FObjectHook, Method);
end;

destructor TcxObjectEventFilter.Destroy;
begin
  QObject_hook_destroy(FObjectHook);
  inherited Destroy;
end;

function TcxObjectEventFilter.ObjectHookProc(Sender: QObjectH; Event: QEventH): Boolean; cdecl;
var
  AMouseEvent: QMouseEventH;
  PP: PPoint;
{$IFDEF LINUX}
  AControl: TWidgetControl;
{$ENDIF}
begin
  Result := False;
  case QEvent_type(Event) of
  {$IFDEF LINUX}
    QEventType_MouseButtonDblClick:
      begin
        if FCurrentMenuButton <> nil then
        begin
          FCurrentMenuButton.FDblClick := True;
          Result := True;
        end
        else
        begin
          AControl := FindControl(QWidgetH(Sender));
          Result := AControl is TcxCustomButton;
          if Result then
            with TcxCustomButton(AControl) do
              Result := (Kind <> cxbkStandard) and not (csDesigning in ComponentState);
        end;
      end;
  {$ENDIF}
    QEventType_MouseButtonPress:
      begin
        if not ((FCurrentMenuButton <> nil) and (QWidgetH(Sender) = FCurrentMenuHandle)) then
          Exit;
      {$IFDEF LINUX}
        FCurrentMenuButton.FDblClick := False;
      {$ENDIF}
        AMouseEvent := QMouseEventH(Event);
        PP := QMouseEvent_globalPos(AMouseEvent);
        FCurrentMenuButton.FClosing :=
          QApplication_widgetAt(PP, True) = FCurrentMenuButton.Handle;
      end;
    end;
end;

{$ENDIF}

type
  TcxGlyphList = class(TImageList)
  private
    FUsed: TBits;
    FCount: Integer;
    function AllocateIndex(ABitmap: TBitmap): Integer;
  public
    constructor CreateSize(AWidth, AHeight: Integer);
    destructor Destroy; override;
    function AddMasked(AImage: TBitmap; AMaskColor: TColor): Integer; reintroduce;
    procedure Delete(AIndex: Integer);
    property Count: Integer read FCount;
  end;

{$IFDEF VCL}
  TcxGlyphCache = class
  private
    FGlyphLists: TList;
  public
    constructor Create;
    destructor Destroy; override;
    function GetList(AWidth, AHeight: Integer): TcxGlyphList;
    procedure ReturnList(AList: TcxGlyphList);
    function Empty: Boolean;
  end;
{$ENDIF}

  TcxButtonGlyph = class
  private
    FOriginal: TBitmap;
    FGlyphList: TcxGlyphList;
    FIndexs: array[TButtonState] of Integer;
    FTransparentColor: TColor;
    FNumGlyphs: TNumGlyphs;
    FOnChange: TNotifyEvent;
    procedure GlyphChanged(Sender: TObject);
    procedure SetGlyph(Value: TBitmap);
    procedure SetNumGlyphs(Value: TNumGlyphs);
    procedure Invalidate;
    function CreateButtonGlyph(AState: TcxButtonState): Integer;
    procedure DrawButtonGlyph(ACanvas: TCanvas; const AGlyphPos: TPoint;
      AState: TcxButtonState);
    procedure DrawButtonText(ACanvas: TCanvas; const ACaption: TCaption;
      ATextBounds: TRect; AState: TcxButtonState{$IFDEF VCL}; ABiDiFlags: LongInt{$ENDIF});
    procedure CalcButtonLayout(ACanvas: TCanvas; const AClient: TRect;
      const AOffset: TPoint; const ACaption: TCaption; ALayout: TButtonLayout;
      AMargin, ASpacing: Integer; var GlyphPos: TPoint; var TextBounds: TRect
      {$IFDEF VCL}; ABiDiFlags: LongInt{$ENDIF});
  public
    constructor Create;
    destructor Destroy; override;
    procedure Draw(ACanvas: TCanvas; const AClient: TRect; const AOffset: TPoint;
      const ACaption: TCaption; ALayout: TButtonLayout; AMargin, ASpacing: Integer;
      AState: TcxButtonState {$IFDEF VCL}; ABiDiFlags: LongInt{$ENDIF});
    property Glyph: TBitmap read FOriginal write SetGlyph;
    property NumGlyphs: TNumGlyphs read FNumGlyphs write SetNumGlyphs;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;

{ TcxGlyphList }

constructor TcxGlyphList.CreateSize(AWidth, AHeight: Integer);
begin
  inherited CreateSize(AWidth, AHeight);
  FUsed := TBits.Create;
end;

destructor TcxGlyphList.Destroy;
begin
  FUsed.Free;
  inherited Destroy;
end;

function TcxGlyphList.AllocateIndex(ABitmap: TBitmap): Integer;
begin
  Result := FUsed.OpenBit;
  if Result >= FUsed.Size then
  begin
    Result := inherited Add(ABitmap, nil);
    FUsed.Size := Result + 1;
  end;
  FUsed[Result] := True;
end;

function TcxGlyphList.AddMasked(AImage: TBitmap; AMaskColor: TColor): Integer;
begin
  Result := AllocateIndex(AImage);
  ReplaceMasked(Result, AImage, AMaskColor);
  Inc(FCount);
end;

procedure TcxGlyphList.Delete(AIndex: Integer);
begin
  if FUsed[AIndex] then
  begin
    Dec(FCount);
    FUsed[AIndex] := False;
  end;
end;

{$IFDEF VCL}

{ TcxGlyphCache }

constructor TcxGlyphCache.Create;
begin
  inherited Create;
  FGlyphLists := TList.Create;
end;

destructor TcxGlyphCache.Destroy;
begin
  FGlyphLists.Free;
  inherited Destroy;
end;

function TcxGlyphCache.GetList(AWidth, AHeight: Integer): TcxGlyphList;
var
  I: Integer;
begin
  for I := FGlyphLists.Count - 1 downto 0 do
  begin
    Result := FGlyphLists[I];
    with Result do
      if (AWidth = Width) and (AHeight = Height) then Exit;
  end;
  Result := TcxGlyphList.CreateSize(AWidth, AHeight);
  FGlyphLists.Add(Result);
end;

procedure TcxGlyphCache.ReturnList(AList: TcxGlyphList);
begin
  if AList = nil then Exit;
  if AList.Count = 0 then
  begin
    FGlyphLists.Remove(AList);
    AList.Free;
  end;
end;

function TcxGlyphCache.Empty: Boolean;
begin
  Result := FGlyphLists.Count = 0;
end;

var
  GlyphCache: TcxGlyphCache = nil;
{$ENDIF}

{ TcxButtonGlyph }

constructor TcxButtonGlyph.Create;
var
  I: TButtonState;
begin
  inherited Create;
  FOriginal := TBitmap.Create;
  FOriginal.OnChange := GlyphChanged;
  FTransparentColor := clOlive;
  FNumGlyphs := 1;
  for I := Low(I) to High(I) do
    FIndexs[I] := -1;
{$IFDEF VCL}
  if GlyphCache = nil then GlyphCache := TcxGlyphCache.Create;
{$ENDIF}
end;

destructor TcxButtonGlyph.Destroy;
begin
  FOriginal.Free;
  Invalidate;
{$IFDEF VCL}
  if Assigned(GlyphCache) and GlyphCache.Empty then
  begin
    GlyphCache.Free;
    GlyphCache := nil;
  end;
{$ENDIF}
  inherited Destroy;
end;

procedure TcxButtonGlyph.Invalidate;
var
  I: TButtonState;
begin
  for I := Low(I) to High(I) do
  begin
    if FIndexs[I] <> -1 then FGlyphList.Delete(FIndexs[I]);
    FIndexs[I] := -1;
  end;
{$IFDEF VCL}
  GlyphCache.ReturnList(FGlyphList);
  FGlyphList := nil;
{$ELSE}
  FreeAndNil(FGlyphList);
{$ENDIF}
end;

procedure TcxButtonGlyph.GlyphChanged(Sender: TObject);
begin
  if Sender = FOriginal then
  begin
    Invalidate;
    if Assigned(FOnChange) then FOnChange(Self);
  end;
end;

procedure TcxButtonGlyph.SetGlyph(Value: TBitmap);
var
  Glyphs: Integer;
begin
  Invalidate;
  FOriginal.Assign(Value);
  if Value = nil then
  begin
    FOriginal.Width := 0;
    FOriginal.Height := 0;
  end else
  if (Value <> nil) and (Value.Height > 0) then
  begin
    if Value.Width mod Value.Height = 0 then
    begin
      Glyphs := Value.Width div Value.Height;
      if Glyphs > 4 then Glyphs := 1;
      SetNumGlyphs(Glyphs);
    end;
  end;
end;

procedure TcxButtonGlyph.SetNumGlyphs(Value: TNumGlyphs);
begin
  if (Value <> FNumGlyphs) and (Value > 0) then
  begin
    Invalidate;
    FNumGlyphs := Value;
    GlyphChanged(Glyph);
  end;
end;

function TcxButtonGlyph.CreateButtonGlyph(AState: TcxButtonState): Integer;
{$IFDEF VCL}
const
  ROP_DSPDxax = $00E20746;
{$ENDIF}

  function cxStateToButtonState(AState: TcxButtonState): TButtonState;
  const
    States: array[TcxButtonState] of TButtonState =
    //cxbsDefault, cxbsNormal, cxbsHot, cxbsPressed, cxbsDisabled;
      (bsUp, bsUp, bsUp, bsDown, bsDisabled);
  begin
    Result := States[AState];
  end;

var
  TmpImage: TBitmap;
  IWidth, IHeight: Integer;
  IRect, ORect: TRect;
  I, State: TButtonState;
{$IFDEF VCL}
  DDB, MonoBmp: TBitmap;
  DestDC: HDC;
{$ENDIF}
begin
  State := cxStateToButtonState(AState);
  if (State = bsDown) and (NumGlyphs < 3) then State := bsUp;
  Result := FIndexs[State];
  if Result <> -1 then Exit;
  if (FOriginal.Width or FOriginal.Height) = 0 then Exit;
  IWidth := FOriginal.Width div FNumGlyphs;
  IHeight := FOriginal.Height;
  if FGlyphList = nil then
{$IFDEF VCL}
  begin
    if GlyphCache = nil then GlyphCache := TcxGlyphCache.Create;
    FGlyphList := GlyphCache.GetList(IWidth, IHeight);
  end;
{$ELSE}
    FGlyphList := TcxGlyphList.CreateSize(IWidth, IHeight);
{$ENDIF}
  TmpImage := TBitmap.Create;
  try
    TmpImage.Width := IWidth;
    TmpImage.Height := IHeight;
    IRect := Rect(0, 0, IWidth, IHeight);
    TmpImage.Canvas.Brush.Color := clBtnFace;
  {$IFDEF VCL}
    TmpImage.Palette := CopyPalette(FOriginal.Palette);
  {$ENDIF}
    I := State;
    if Ord(I) >= NumGlyphs then I := bsUp;
    ORect := Rect(Ord(I) * IWidth, 0, (Ord(I) + 1) * IWidth, IHeight);
    if State <> bsDisabled then
    begin
      TmpImage.Canvas.CopyRect(IRect, FOriginal.Canvas, ORect);
      if FOriginal.TransparentMode = tmFixed then
        FIndexs[State] := FGlyphList.AddMasked(TmpImage, FTransparentColor)
      else
        FIndexs[State] := FGlyphList.AddMasked(TmpImage, clDefault);
    end
    else
    begin
    {$IFDEF VCL}
      MonoBmp := nil;
      DDB := nil;
      try
        MonoBmp := TBitmap.Create;
        DDB := TBitmap.Create;
        DDB.Assign(FOriginal);
        DDB.HandleType := bmDDB;
        if NumGlyphs > 1 then
        with TmpImage.Canvas do
        begin    { Change white & gray to clBtnHighlight and clBtnShadow }
          CopyRect(IRect, DDB.Canvas, ORect);
          MonoBmp.Monochrome := True;
          MonoBmp.Width := IWidth;
          MonoBmp.Height := IHeight;
    
          { Convert white to clBtnHighlight }
          DDB.Canvas.Brush.Color := clWhite;
          MonoBmp.Canvas.CopyRect(IRect, DDB.Canvas, ORect);
          Brush.Color := clBtnHighlight;
          DestDC := Handle;
          SetTextColor(DestDC, clBlack);
          SetBkColor(DestDC, clWhite);
          BitBlt(DestDC, 0, 0, IWidth, IHeight,
                 MonoBmp.Canvas.Handle, 0, 0, ROP_DSPDxax);
    
          { Convert gray to clBtnShadow }
          DDB.Canvas.Brush.Color := clGray;
          MonoBmp.Canvas.CopyRect(IRect, DDB.Canvas, ORect);
          Brush.Color := clBtnShadow;
          DestDC := Handle;
          SetTextColor(DestDC, clBlack);
          SetBkColor(DestDC, clWhite);
          BitBlt(DestDC, 0, 0, IWidth, IHeight,
                 MonoBmp.Canvas.Handle, 0, 0, ROP_DSPDxax);
    
          { Convert transparent color to clBtnFace }
          DDB.Canvas.Brush.Color := ColorToRGB(FTransparentColor);
          MonoBmp.Canvas.CopyRect(IRect, DDB.Canvas, ORect);
          Brush.Color := clBtnFace;
          DestDC := Handle;
          SetTextColor(DestDC, clBlack);
          SetBkColor(DestDC, clWhite);
          BitBlt(DestDC, 0, 0, IWidth, IHeight,
                 MonoBmp.Canvas.Handle, 0, 0, ROP_DSPDxax);
        end
        else
        begin
          { Create a disabled version }
          with MonoBmp do
          begin
            Assign(FOriginal);
            HandleType := bmDDB;
            Canvas.Brush.Color := clBlack;
            Width := IWidth;
            if Monochrome then
            begin
              Canvas.Font.Color := clWhite;
              Monochrome := False;
              Canvas.Brush.Color := clWhite;
            end;
            Monochrome := True;
          end;
          with TmpImage.Canvas do
          begin
            Brush.Color := clBtnFace;
            FillRect(IRect);
            Brush.Color := clBtnHighlight;
            SetTextColor(Handle, clBlack);
            SetBkColor(Handle, clWhite);
            BitBlt(Handle, 1, 1, IWidth, IHeight,
              MonoBmp.Canvas.Handle, 0, 0, ROP_DSPDxax);
            Brush.Color := clBtnShadow;
            SetTextColor(Handle, clBlack);
            SetBkColor(Handle, clWhite);
            BitBlt(Handle, 0, 0, IWidth, IHeight,
              MonoBmp.Canvas.Handle, 0, 0, ROP_DSPDxax);
          end;
        end;
      finally
        DDB.Free;
        MonoBmp.Free;
      end;
      FIndexs[State] := FGlyphList.AddMasked(TmpImage, clDefault);
    {$ELSE}
      if NumGlyphs > 1 then
        TmpImage.Canvas.CopyRect(IRect, FOriginal.Canvas, ORect)
      else
        FGlyphList.Draw(TmpImage.Canvas, 0, 0, FIndexs[bsUp], {$IFNDEF VCL}itImage,{$ENDIF} False);
      if FOriginal.TransparentMode = tmFixed then
        FIndexs[State] := FGlyphList.AddMasked(TmpImage, FTransparentColor)
      else
        FIndexs[State] := FGlyphList.AddMasked(TmpImage, clDefault);
    {$ENDIF}
    end;
  finally
    TmpImage.Free;
  end;
  Result := FIndexs[State];
  FOriginal.Dormant;
end;

procedure TcxButtonGlyph.DrawButtonGlyph(ACanvas: TCanvas; const AGlyphPos: TPoint;
  AState: TcxButtonState);
var
  AIndex: Integer;
begin
  if (FOriginal = nil) or (FOriginal.Width = 0) or (FOriginal.Height = 0) then
    Exit;
  AIndex := CreateButtonGlyph(AState);
{$IFDEF VCL}
  ImageList_DrawEx(FGlyphList.Handle, AIndex, ACanvas.Handle,
    AGlyphPos.X, AGlyphPos.Y, 0, 0, clNone, clNone, ILD_Transparent);
{$ELSE}
  FGlyphList.Draw(ACanvas, AGlyphPos.X, AGlyphPos.Y, AIndex, itImage, True);
{$ENDIF}
end;

procedure TcxButtonGlyph.DrawButtonText(ACanvas: TCanvas; const ACaption: TCaption;
  ATextBounds: TRect; AState: TcxButtonState {$IFDEF VCL}; ABiDiFlags: LongInt{$ENDIF});
var
{$IFNDEF VCL}
  AAlignFlags: Integer;
{$ENDIF}
  AFontColor: TColor;
  ABrushStyle: TBrushStyle;
begin
  if Length(ACaption) = 0 then Exit;
{$IFNDEF VCL}
  AAlignFlags := Integer(AlignmentFlags_ShowPrefix);
{$ENDIF}
  with ACanvas do
  begin
    ABrushStyle := Brush.Style;
    try
      Brush.Style := bsClear;
      if AState = cxbsDisabled then
      begin
        OffsetRect(ATextBounds, 1, 1);
        AFontColor := Font.Color;
        Font.Color := clBtnHighlight;
      {$IFDEF VCL}
        DrawText(Handle, PChar(ACaption), Length(ACaption), ATextBounds,
          DT_CENTER or DT_VCENTER or ABiDiFlags);
      {$ELSE}
        TextRect(ATextBounds, ATextBounds.Left, ATextBounds.Top, ACaption, AAlignFlags);
      {$ENDIF}
        OffsetRect(ATextBounds, -1, -1);
        Font.Color := AFontColor;
      end;
    {$IFDEF VCL}
      DrawText(Handle, PChar(ACaption), Length(ACaption), ATextBounds,
        DT_CENTER or DT_VCENTER or ABiDiFlags);
    {$ELSE}
      TextRect(ATextBounds, ATextBounds.Left, ATextBounds.Top, ACaption, AAlignFlags);
    {$ENDIF}
    finally
      Brush.Style := ABrushStyle;
    end;
  end;
end;

procedure TcxButtonGlyph.CalcButtonLayout(ACanvas: TCanvas; const AClient: TRect;
  const AOffset: TPoint; const ACaption: TCaption; ALayout: TButtonLayout;
  AMargin, ASpacing: Integer; var GlyphPos: TPoint; var TextBounds: TRect
  {$IFDEF VCL}; ABiDiFlags: LongInt{$ENDIF});
var
  ATextPos: TPoint;
  AClientSize, AGlyphSize, ATextSize: TPoint;
  ATotalSize: TPoint;
{$IFNDEF VCL}
  AAlignFlags: Integer;
{$ENDIF}
begin
{$IFDEF VCL}
  if (ABiDiFlags and DT_RIGHT) = DT_RIGHT then
    if ALayout = blGlyphLeft then ALayout := blGlyphRight
    else
      if ALayout = blGlyphRight then ALayout := blGlyphLeft;
{$ELSE}
  AAlignFlags := Integer(AlignmentFlags_ShowPrefix);
{$ENDIF}
  // calculate the item sizes
  with AClient do AClientSize := Point(Right - Left, Bottom - Top);
  if Length(ACaption) > 0 then
  begin
  {$IFDEF VCL}
    TextBounds := Rect(0, 0, AClient.Right - AClient.Left, 0);
    DrawText(ACanvas.Handle, PChar(ACaption), Length(ACaption), TextBounds,
      DT_CALCRECT or ABiDiFlags);
  {$ELSE}
    TextBounds := AClient;
    ACanvas.TextExtent(ACaption{$IFNDEF VCL}, TextBounds, AAlignFlags{$ENDIF});
  {$ENDIF}
    with TextBounds do ATextSize := Point(Right - Left, Bottom - Top);
  end
  else
  begin
    TextBounds := EmptyRect;
    ATextSize := EmptyPoint;
  end;

  if FOriginal <> nil then
  begin
    AGlyphSize := Point(FOriginal.Width div FNumGlyphs, FOriginal.Height);
    if ALayout in [blGlyphLeft, blGlyphRight] then
    begin
      GlyphPos.Y := (AClientSize.Y - AGlyphSize.Y + 1) div 2;
      ATextPos.Y := (AClientSize.Y - ATextSize.Y + 1) div 2;
    end
    else
    begin
      GlyphPos.X := (AClientSize.X - AGlyphSize.X + 1) div 2;
      ATextPos.X := (AClientSize.X - ATextSize.X + 1) div 2;
    end;
  end
  else
    AGlyphSize := EmptyPoint;

  if (ATextSize.X = 0) or (AGlyphSize.X = 0) then ASpacing := 0;

  // adjust Margin and Spacing
  if AMargin = -1 then
  begin
    if ASpacing = -1 then
    begin
      ATotalSize := Point(AGlyphSize.X + ATextSize.X, AGlyphSize.Y + ATextSize.Y);
      if ALayout in [blGlyphLeft, blGlyphRight] then
        AMargin := (AClientSize.X - ATotalSize.X) div 3
      else
        AMargin := (AClientSize.Y - ATotalSize.Y) div 3;
      ASpacing := AMargin;
    end
    else
    begin
      ATotalSize := Point(AGlyphSize.X + ASpacing + ATextSize.X, AGlyphSize.Y +
        ASpacing + ATextSize.Y);
      if ALayout in [blGlyphLeft, blGlyphRight] then
        AMargin := (AClientSize.X - ATotalSize.X + 1) div 2
      else
        AMargin := (AClientSize.Y - ATotalSize.Y + 1) div 2;
    end;
  end
  else
  begin
    if ASpacing = -1 then
    begin
      ATotalSize := Point(AClientSize.X - (AMargin + AGlyphSize.X),
        AClientSize.Y - (AMargin + AGlyphSize.Y));
      if ALayout in [blGlyphLeft, blGlyphRight] then
        ASpacing := (ATotalSize.X - ATextSize.X) div 2
      else
        ASpacing := (ATotalSize.Y - ATextSize.Y) div 2;
    end;
  end;
  case ALayout of
    blGlyphLeft:
      begin
        GlyphPos.X := AMargin;
        ATextPos.X := GlyphPos.X + AGlyphSize.X + ASpacing;
      end;
    blGlyphRight:
      begin
        GlyphPos.X := AClientSize.X - AMargin - AGlyphSize.X;
        ATextPos.X := GlyphPos.X - ASpacing - ATextSize.X;
      end;
    blGlyphTop:
      begin
        GlyphPos.Y := AMargin;
        ATextPos.Y := GlyphPos.Y + AGlyphSize.Y + ASpacing;
      end;
    blGlyphBottom:
      begin
        GlyphPos.Y := AClientSize.Y - AMargin - AGlyphSize.Y;
        ATextPos.Y := GlyphPos.Y - ASpacing - ATextSize.Y;
      end;
  end;
  // fixup the result variables
  with GlyphPos do
  begin
    Inc(X, AClient.Left + AOffset.X);
    Inc(Y, AClient.Top + AOffset.Y);
  end;
  OffsetRect(TextBounds, ATextPos.X + AOffset.X, ATextPos.Y + AOffset.X);
end;

procedure TcxButtonGlyph.Draw(ACanvas: TCanvas; const AClient: TRect;
  const AOffset: TPoint; const ACaption: TCaption; ALayout: TButtonLayout;
  AMargin, ASpacing: Integer; AState: TcxButtonState
  {$IFDEF VCL}; ABiDiFlags: LongInt{$ENDIF});
var
  AGlyphPos: TPoint;
  ATextRect: TRect;
begin
  CalcButtonLayout(ACanvas, AClient, AOffset, ACaption, ALayout, AMargin,
    ASpacing, AGlyphPos, ATextRect{$IFDEF VCL}, ABiDiFlags{$ENDIF});
  DrawButtonGlyph(ACanvas, AGlyphPos, AState);
  DrawButtonText(ACanvas, ACaption, ATextRect, AState{$IFDEF VCL}, ABiDiFlags{$ENDIF});
end;

{ TcxCustomButton }

constructor TcxCustomButton.Create(AOwner: TComponent);
begin
  FGlyph := TcxButtonGlyph.Create;
  TcxButtonGlyph(FGlyph).OnChange := GlyphChanged;
  inherited Create(AOwner);
  FColors := TcxButtonColors.Create(Self);
  FControlCanvas := TControlCanvas.Create;
  FControlCanvas.Control := Self;
  FCanvas := TcxCanvas.Create(TCanvas(FControlCanvas));
  FUseSystemPaint := True;
  FLookAndFeel := TcxLookAndFeel.Create(Self);
  FLookAndFeel.OnChanged := LookAndFeelChanged;
  FDoPopup := True;
  FKind := cxbkStandard;
  FLayout := blGlyphLeft;
  FSpacing := 4;
  FMargin := -1;
{$IFDEF VCL}
  FThemeChangedNotificator := TdxThemeChangedNotificator.Create;
  FThemeChangedNotificator.OnThemeChanged := ThemeChanged;
  DoubleBuffered := True;
  ControlStyle := ControlStyle + [csReflector, csOpaque];
{$ELSE}
  ControlStyle := ControlStyle + [csOpaque];
{$ENDIF}
end;

destructor TcxCustomButton.Destroy;
begin
{$IFDEF VCL}
  EndMouseTracking(Self);
  FreeAndNil(FThemeChangedNotificator);
{$ENDIF}
  FreeAndNil(FLookAndFeel);
  FreeAndNil(FColors);
  inherited Destroy;
  TcxButtonGlyph(FGlyph).Free;
  FreeAndNil(FCanvas);
  FreeAndNil(FControlCanvas);
end;

procedure TcxCustomButton.SetGlyph(Value: TBitmap);
begin
  TcxButtonGlyph(FGlyph).Glyph := Value as TBitmap;
  FModifiedGlyph := True;
  if Value <> nil then FUseSystemPaint := False;
  Invalidate;
end;

function TcxCustomButton.GetGlyph: TBitmap;
begin
  Result := TcxButtonGlyph(FGlyph).Glyph;
end;

procedure TcxCustomButton.GlyphChanged(Sender: TObject);
begin
  Invalidate;
end;

procedure TcxCustomButton.SetLayout(Value: TButtonLayout);
begin
  if FLayout <> Value then
  begin
    FLayout := Value;
    Invalidate;
  end;
end;

function TcxCustomButton.GetNumGlyphs: TNumGlyphs;
begin
  Result := TcxButtonGlyph(FGlyph).NumGlyphs;
end;

procedure TcxCustomButton.SetNumGlyphs(Value: TNumGlyphs);
begin
  if Value < 0 then Value := 1
  else if Value > 4 then Value := 4;
  if Value <> TcxButtonGlyph(FGlyph).NumGlyphs then
  begin
    TcxButtonGlyph(FGlyph).NumGlyphs := Value;
    Invalidate;
  end;
end;

procedure TcxCustomButton.SetSpacing(Value: Integer);
begin
  if FSpacing <> Value then
  begin
    FSpacing := Value;
    Invalidate;
  end;
end;

procedure TcxCustomButton.SetMargin(Value: Integer);
begin
  if (Value <> FMargin) and (Value >= - 1) then
  begin
    FMargin := Value;
    Invalidate;
  end;
end;

procedure TcxCustomButton.KeyDown(var Key: Word; Shift: TShiftState);
begin
  if FKind = cxbkDropDownButton then
  {$IFDEF VCL}
    if (Key in [VK_UP, VK_DOWN]) and
  {$ELSE}
    if ((Key = Key_Up) or (Key = Key_Down)) and
  {$ENDIF}
      ((ssAlt in Shift) or (ssShift in Shift)) then
    begin
      if not FMenuVisible then DoDropDownMenu;
      Key := 0;
      Exit
    end;
  inherited;
end;

procedure TcxCustomButton.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  R: TRect;
begin
  if (Button = mbLeft) and (Kind <> cxbkStandard) {$IFDEF LINUX}and not FDblClick{$ENDIF}then
  begin
    if not FMenuVisible {$IFNDEF VCL}and not FClosing{$ENDIF} then
      if FKind = cxbkDropDownButton then
      begin
        R := ClientRect;
        R.Left := R.Right - cxDropDownButtonWidth;
        if PtInRect(R, Point(X, Y)) then DoDropDownMenu;
      end
      else
        DoDropDownMenu
    else
    begin
      FIsMouseClick := True;
      FMenuVisible := False;
      FIsDown := False;
      Repaint;
    end;
  {$IFNDEF VCL}
    FClosing := False;
  {$ENDIF}
  end;
  inherited;
end;

procedure TcxCustomButton.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FDropDownMenu) then
    FDropDownMenu := nil;
end;

function TcxCustomButton.GetPainterClass: TcxCustomLookAndFeelPainterClass;
begin
  Result := LookAndFeel.Painter;
{$IFDEF VCL}
  if AreVisualStylesAvailable and (LookAndFeel.NativeStyle or
    (FUseSystemPaint and not LookAndFeel.NativeStyle and (LookAndFeel.Kind = lfStandard))) then
      Result := TcxWinXPLookAndFeelPainter
  else
{$ELSE}
  if not LookAndFeel.NativeStyle then
{$ENDIF}
    case LookAndFeel.Kind of
      lfFlat: Result := TcxFlatLookAndFeelPainter;
      lfUltraFlat: Result := TcxUltraFlatLookAndFeelPainter;
    end;
end;

function TcxCustomButton.StandardButton: Boolean;
begin
{$IFDEF VCL}
//system button
  Result := (FKind = cxbkStandard) and FUseSystemPaint and (Glyph = nil) and
    ((LookAndFeel.NativeStyle and AreVisualStylesAvailable) or (LookAndFeel.Kind = lfStandard));
{$ELSE}
// TODO check behavior in CLX
  Result := (FKind = cxbkStandard) and FUseSystemPaint and (Glyph = nil) and
    (LookAndFeel.NativeStyle or (LookAndFeel.Kind = lfStandard));
{$ENDIF}
end;

procedure TcxCustomButton.Click;
begin
  if FKind = cxbkStandard then
    inherited Click
  else
  begin
  {$IFDEF LINUX}
    if FDblClick then
    begin
      FDblClick := False;
      Exit;
    end;
  {$ENDIF}
    if (FKind = cxbkDropDown) and not FMenuVisible then
    begin
      if not FIsMouseClick then DoDropDownMenu;
      FIsMouseClick := False;
    end
    else
      if FIsMouseClick then FIsMouseClick := False else inherited Click;
  end;
end;

procedure TcxCustomButton.LookAndFeelChanged(Sender: TcxLookAndFeel;
  AChangedValues: TcxLookAndFeelValues);
begin
  InternalRecreateWindow;
end;

procedure TcxCustomButton.SetColors(const Value: TcxButtonColors);
begin
  FColors.Assign(Value);
end;

procedure TcxCustomButton.SetKind(const Value: TcxButtonKind);
begin
  if FKind <> Value then
  begin
    FKind := Value;
    InternalRecreateWindow;
  end
end;

procedure TcxCustomButton.SetLookAndFeel(Value: TcxLookAndFeel);
begin
  FLookAndFeel.Assign(Value);
end;

procedure TcxCustomButton.SetUseSystemPaint(const Value: Boolean);
begin
  if FUseSystemPaint <> Value then
  begin
    FUseSystemPaint := Value;
    InternalRecreateWindow;
  end;
end;

procedure TcxCustomButton.DoDropDownMenu;
begin
  FLockDown := True;
{$IFDEF VCL}
  PostMessage(Handle, CM_DROPDOWNPOPUPMENU, 0, 0);
{$ELSE}
  QApplication_postEvent(Handle,
    QCustomEvent_create(QEventType_CMDropDownPopupMenu, Self));
{$ENDIF}
end;

procedure TcxCustomButton.InternalPaint;
var
  R, Temp: TRect;
  AState: TcxButtonState;
  AColor: TColor;
  AOffset: TPoint;
  AShift: Integer;
begin
  if StandardButton then Exit;
  R := ClientRect;
{$IFNDEF VCL}
  if not FLockDown then FIsDown := Down;
{$ENDIF}
  case FKind of
    cxbkDropDown:
      FIsDown := FMenuVisible;
    cxbkDropDownButton:
      begin
        Temp := Rect(R.Right - cxDropDownButtonWidth, R.Top, R.Right, R.Bottom);
        R.Right := Temp.Left + 2;
        if {$IFNDEF VCL} FClosing or {$ENDIF} FLockDown then
          FIsDown := False;
      end;
  end;

  if not Enabled then AState := cxbsDisabled
  else if FIsDown then AState := cxbsPressed
  else if FMouseInControl then AState := cxbsHot
  else if FIsDefault or FIsFocused then AState := cxbsDefault
  else AState := cxbsNormal;

  FCanvas.Font.Assign(Font);
  AColor := FColors.FColors[AState];
  FCanvas.Font.Color := GetPainterClass.ButtonSymbolColor(AState);
  if Assigned(FOnGetDrawParams) then
    FOnGetDrawParams(Self, AState, AColor, FCanvas.Font);

  GetPainterClass.DrawButton(FCanvas, R, '', AState, True, AColor, FCanvas.Font.Color);

  AShift := GetPainterClass.ButtonTextShift;
  if (AState = cxbsPressed) and (AShift <> 0) then
    AOffset := Point(AShift, AShift)
  else
    AOffset := EmptyPoint;

  TcxButtonGlyph(FGlyph).Draw(TCanvas(FControlCanvas), R, AOffset, Caption, FLayout,
    FMargin, FSpacing, AState {$IFDEF VCL}, DrawTextBiDiModeFlags(0){$ENDIF});

  if FKind = cxbkDropDownButton then
  begin
    if FMenuVisible then
      GetPainterClass.DrawButton(FCanvas, Temp, '', cxbsPressed, True, AColor, FCanvas.Font.Color)
    else
      GetPainterClass.DrawButton(FCanvas, Temp, '', AState, True, AColor, FCanvas.Font.Color);
    GetPainterClass.DrawScrollBarArrow(FCanvas, Temp, AState, adDown);
  end;
{$IFDEF VCL}
  if Focused and not FMenuVisible then
    FCanvas.DrawFocusRect(GetPainterClass.ButtonFocusRect(FCanvas, R));
{$ELSE}
  if QWidget_hasFocus(handle) and not (FMenuVisible or (csDesigning in ComponentState)) then
  begin
    InflateRect(R, -4, -4);
    QStyle_drawFocusRect(Application.Style.Handle,
      FControlCanvas.Handle, @R, nil, QColor(Self.Color, Handle), False);
  end;
{$ENDIF}
end;

procedure TcxCustomButton.InternalRecreateWindow;
{$IFNDEF VCL}
var
  ASavedCaption: TCaption;
{$ENDIF}
begin
{$IFDEF VCL}
  RecreateWnd
{$ELSE}
  ASavedCaption := Caption;
  RecreateWidget;
  Caption := ASavedCaption;
{$ENDIF}
end;

function TcxCustomButton.IsColorsStored: Boolean;
begin
  Result := FColors.AssignedColors <> [];
end;

function TcxCustomButton.IsHotTrack: Boolean;
begin
  Result := not StandardButton and GetPainterClass.IsButtonHotTrack and Enabled;
end;

procedure TcxCustomButton.ActionChange(Sender: TObject; CheckDefaults: Boolean);

  procedure CopyImage(ImageList: TCustomImageList; Index: Integer);
  begin
    with Glyph do
    begin
      Width := ImageList.Width;
      Height := ImageList.Height;
      Canvas.Brush.Color := clFuchsia; {! for lack of a better color }
      Canvas.FillRect(Rect(0,0, Width, Height));
      ImageList.Draw(Canvas, 0, 0, Index);
    end;
  end;

begin
  inherited ActionChange(Sender, CheckDefaults);
  if Sender is TCustomAction then
    with TCustomAction(Sender) do
    begin
      if (Glyph.Empty) and (ActionList <> nil) and (ActionList.Images <> nil) and
        (ImageIndex >= 0) and (ImageIndex < ActionList.Images.Count) then
        CopyImage(ActionList.Images, ImageIndex);
    end;
end;

procedure TcxCustomButton.ButtonMouseLeave;
begin
{$IFDEF VCL}
  Perform(CM_MOUSELEAVE, 0, 0);
{$ELSE}
  MouseLeave(Self);
{$ENDIF}
end;

{$IFDEF VCL}

procedure TcxCustomButton.DrawItem(const DrawItemStruct: TDrawItemStruct);
begin
  FCanvas.Canvas.Handle := DrawItemStruct.hDC;
  with DrawItemStruct do
  begin
    if not FLockDown then
      FIsDown := itemState and ODS_SELECTED <> 0
    else
      FIsDown := False;
    FIsDefault := (itemState and ODS_FOCUS <> 0) or
     (Default and (csDesigning in ComponentState));
  end;
  InternalPaint;
  FCanvas.Canvas.Handle := 0;
end;

procedure TcxCustomButton.ThemeChanged;
begin
  RecreateWnd;
end;

procedure TcxCustomButton.WMCaptureChanged(var Message: TMessage);
var
  P: TPoint;
begin
  inherited;
  if csDesigning in ComponentState then Exit;
  GetCursorPos(P);
  FMouseInControl := IsHotTrack and (WindowFromPoint(P) = Handle);
end;

procedure TcxCustomButton.WMLButtonDblClk(var Message: TWMLButtonDblClk);
begin
  Perform(WM_LBUTTONDOWN, Message.Keys, Longint(Message.Pos));
end;

procedure TcxCustomButton.WMLButtonDown(var Message: TMessage);
var
  R: TRect;
begin
  if FKind = cxbkDropDownButton then
  begin
    R := ClientRect;
    R.Left := R.Right - cxDropDownButtonWidth;
    if PtInRect(R, Point(Message.LParamLo, Message.LParamHi)) then
      FLockDown := True;
  end;
  inherited;
end;

procedure TcxCustomButton.WMLButtonUp(var Message: TMessage);
begin
  FLockDown := False;
  inherited;
end;

procedure TcxCustomButton.CNDrawItem(var Message: TWMDrawItem);
begin
  DrawItem(Message.DrawItemStruct^);
end;

procedure TcxCustomButton.CNMeasureItem(var Message: TWMMeasureItem);
begin
  with Message.MeasureItemStruct^ do
  begin
    itemWidth := Width;
    itemHeight := Height;
  end;
end;

procedure TcxCustomButton.CMCloseupPopupMenu(var Message: TMessage);
var
  P: TPoint;
begin
  GetCursorPos(P);
  FMouseInControl := IsHotTrack and (WindowFromPoint(P) = Handle);
  FMenuVisible := False;
  Repaint;
  FLockDown := False;
end;

procedure TcxCustomButton.CMDropDownPopupMenu(var Message: TMessage);

  function GetPopupMenuHeight: Integer;
  var
    ANonClientMetrics: TNonClientMetrics;
    I, AHeight, AWidth: Integer;
    MI: TMenuItemAccess;
    ACanvas: TcxScreenCanvas;
    B: Boolean;
  begin
    ANonClientMetrics.cbSize := SizeOf(TNonClientMetrics);
    B := SystemParametersInfo(SPI_GETNONCLIENTMETRICS, 0, @ANonClientMetrics, 0);
    if B then
      Result := ANonClientMetrics.iBorderWidth * 2
    else
      Result := 2;
    ACanvas := TcxScreenCanvas.Create;
    with ACanvas do
    try
    {$IFNDEF DELPHI5}
      if B then
        Font.Handle := CreateFontIndirect(ANonClientMetrics.lfMenuFont)
      else
        Font.Handle := GetStockObject(SYSTEM_FONT);
    {$ELSE}
      Font.Assign(Screen.MenuFont);
    {$ENDIF}
      for I := 0 to FDropDownMenu.Items.Count - 1 do
      begin
        MI := TMenuItemAccess(FDropDownMenu.Items[i]);
        AHeight := ANonClientMetrics.iMenuHeight;
        if FDropDownMenu.OwnerDraw and MI.Visible then
          MI.MeasureItem(Canvas, AWidth, AHeight);
        Inc(Result, AHeight);
      end;
    finally
      ACanvas.Free;
    end;
  end;

var
  P: TPoint;
  H: Integer;
begin
  if (Kind <> cxbkStandard) and (FDropDownMenu <> nil) then
  begin
    FMenuVisible := True;
    Repaint;
    P := ClientToScreen(Point(0, Height));
    H := GetPopupMenuHeight;
    if P.Y + H > Screen.Height then Dec(P.Y, Height + H + 2);
    if P.X < 0 then P.X := 0;
    FDropDownMenu.Popup(P.X, P.Y);
    PostMessage(Handle, CM_CLOSEUPPOPUPMENU, 0, 0);
  end;
end;

procedure TcxCustomButton.CMFontChanged(var Message: TMessage);
begin
  inherited;
  Invalidate;
end;

procedure TcxCustomButton.CMEnabledChanged(var Message: TMessage);
begin
  inherited;
  if not Enabled then FMouseInControl := False;
  Invalidate;
end;

procedure TcxCustomButton.CMMouseEnter(var Message: TMessage);
var
  ABounds: TRect;
begin
  inherited;
{$IFDEF DELPHI7}
  if csDesigning in ComponentState then Exit;
{$ENDIF}
  if not FMouseInControl and IsHotTrack and (GetCapture = 0) then
  begin
    ABounds := Rect(0, 0, Width, Height);
    MapWindowRect(Handle, 0, ABounds);
    BeginMouseTracking(nil, ABounds, Self);
    FMouseInControl := True;
    Repaint;
  end;
end;

procedure TcxCustomButton.CMMouseLeave(var Message: TMessage);
begin
  inherited;
{$IFDEF DELPHI7}
  if csDesigning in ComponentState then Exit;
{$ENDIF}
  EndMouseTracking(Self);
  if FMouseInControl and IsHotTrack then
  begin
    FMouseInControl := False;
    Invalidate;
  end;
end;

procedure TcxCustomButton.CreateHandle;
var
  State: TcxButtonState;
begin
  if Enabled then
    State := cxbsNormal
  else
    State := cxbsDisabled;
  inherited CreateHandle;
  TcxButtonGlyph(FGlyph).CreateButtonGlyph(State);
end;

procedure TcxCustomButton.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  if not StandardButton then
    with Params do Style := Style or BS_OWNERDRAW;
end;

function TcxCustomButton.GetPalette: HPALETTE;
begin
  Result := Glyph.Palette;
end;

procedure TcxCustomButton.SetButtonStyle(ADefault: Boolean);
begin
  if StandardButton then
    inherited SetButtonStyle(ADefault)
  else
    if ADefault <> FIsFocused then
    begin
      FIsFocused := ADefault;
      Refresh;
    end;
end;

procedure TcxCustomButton.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseMove(Shift, X, Y);
  if not FMouseInControl and IsHotTrack and PtInRect(ClientRect, Point(X, Y)) and
    (GetCapture = 0) then
      Perform(CM_MOUSEENTER, 0, 0);
end;

{$ELSE}

procedure TcxCustomButton.EnabledChanged;
begin
  inherited EnabledChanged;
  if not Enabled then FMouseInControl := False;
  Invalidate;
end;

function TcxCustomButton.EventFilter(Sender: QObjectH; Event: QEventH): Boolean;

  function GetPopupMenuHeight: Integer;
  var
    i, Height: Integer;
    fm: QFontMetricsH;
    mi: TMenuItemAccess;
    font: QFontH;
  begin
    Result := QStyle_defaultFrameWidth(Application.Style.Handle);
    font := QFont_create;
    QWidget_font(FDropDownMenu.ParentWidget, font);
    fm := QFontMetrics_create(font);
    QWidget_fontMetrics(FDropDownMenu.ParentWidget, fm);
    try
      for I := 0 to FDropDownMenu.Items.Count - 1 do
      begin
        mi := TMenuItemAccess(FDropDownMenu.Items[i]);
        Height := QStyle_popupMenuItemHeight(Application.Style.Handle,
          False, mi.MenuItemHandle, fm);
        Inc(Result, Height);
      end;
    finally
      QFontMetrics_destroy(fm);
      QFont_destroy(font);
    end;
  end;

var
  P: TPoint;
  H: Integer;
begin
  case QEvent_type(Event) of
    QEventType_MouseButtonPress:
      if (QMouseEvent_button(QMouseEventH(Event)) = ButtonState_LeftButton) and
        FClosing or FMenuVisible then
      begin
        FClosing := False;
        FIsMouseClick := True;
        Result := True;
        Exit;
      end;
    QEventType_MouseButtonRelease:
      if (QMouseEvent_button(QMouseEventH(Event)) = ButtonState_LeftButton) then
        FLockDown := False;
    QEventType_CMDropDownPopupMenu:
      begin
        Result := True;
        if Kind <> cxbkStandard then
          if FDropDownMenu <> nil then
          begin
            FMenuVisible := True;
            if FKind = cxbkDropDown then Repaint;
            P := ClientToScreen(Point(0, Height));
            H := GetPopupMenuHeight;
            if P.Y + H > Screen.Height then Dec(P.Y, Height + H + 2);
            if P.X < 0 then P.X := 0;
            FCurrentMenuButton := Self;
            FCurrentMenuHandle := FDropDownMenu.Handle;
            FDropDownMenu.Popup(P.X, P.Y);
            FCurrentMenuButton := nil;
            FCurrentMenuHandle := nil;
            QApplication_postEvent(Handle, QCustomEvent_create(
              QEventType_CMCloseUpPopupMenu, Self));
          end;
        Exit;
      end;
    QEventType_CMCloseUpPopupMenu:
      begin
        Result := True;
        FMenuVisible := False;
        Down := False;
        FLockDown := False;
        Invalidate;
        Exit;
      end;
  end;
  Result := inherited EventFilter(Sender, Event);
end;

procedure TcxCustomButton.FontChanged;
begin
  inherited FontChanged;
  invalidate;
end;

procedure TcxCustomButton.InitWidget;
var
  State: TcxButtonState;
begin
  if Enabled then
    State := cxbsNormal
  else
    State := cxbsDisabled;
  inherited InitWidget;
  TcxButtonGlyph(FGlyph).CreateButtonGlyph(State);
end;

procedure TcxCustomButton.MouseEnter(AControl: TControl);
begin
  inherited MouseEnter(AControl);
{$IFDEF DELPHI7}
  if csDesigning in ComponentState then Exit;
{$ENDIF}
  if IsHotTrack and not FMouseInControl and (GetCaptureControl = nil) then
  begin
    FMouseInControl := True;
    Repaint;
  end;
end;

procedure TcxCustomButton.MouseLeave(AControl: TControl);
begin
  inherited MouseLeave(AControl);
{$IFDEF DELPHI7}
  if csDesigning in ComponentState then Exit;
{$ENDIF}
  if IsHotTrack and FMouseInControl then
  begin
    FMouseInControl := False;
    Invalidate;
    QWidget_update(Handle);
  end;
end;

function TcxCustomButton.NeedKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  if (FKind = cxbkDropDownButton) and ((Key = Key_Up) or (Key = Key_Down)) and
    ((ssCtrl in Shift) or (ssShift in Shift)) and not FMenuVisible then
  begin
    DoDropDownMenu;
    Result := True;
  end
  else
    Result := inherited NeedKey(Key, Shift, KeyText);
end;

procedure TcxCustomButton.Painting(Sender: QObjectH; EventRegion: QRegionH);
begin
  TControlCanvas(FControlCanvas).StartPaint;
  try
    QPainter_setClipRegion(FControlCanvas.Handle, EventRegion);
    InternalPaint;
  finally
    TControlCanvas(FControlCanvas).StopPaint;
  end;
end;

function TcxCustomButton.WidgetFlags: Integer;
begin
  Result := Integer(WidgetFlags_WRepaintNoErase);
end;
{$ENDIF}

{$IFNDEF VCL}
initialization
  FObjectEventFilter := TcxObjectEventFilter.Create(Application.Handle);

finalization
  FreeAndNil(FObjectEventFilter);
{$ENDIF}

end.



