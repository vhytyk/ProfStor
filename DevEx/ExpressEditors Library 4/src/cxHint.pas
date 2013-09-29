
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

unit cxHint;

{$I cxExtEdVer.inc}

interface

uses
{$IFDEF VCL}
  Messages, Windows,
{$ENDIF}
{$IFDEF DELPHI6}
  Variants,
{$ENDIF}
  Classes, Controls, Forms, Graphics, ImgList, StdCtrls, SysUtils, cxClasses,
  cxControls, cxContainer, cxEdit, cxGraphics, cxLookAndFeels, cxTextEdit;

type
  TcxCustomHintStyleController = class;
  TcxCustomHintStyle = class;
  TcxCustomHintWindow = class;
  TcxHintAnimationDelay = 0..1000;
  TcxHintStyleChangedEvent = procedure (Sender: TObject; AStyle: TcxCustomHintStyle) of object;
  TcxShowHintEvent = procedure(Sender: TObject; var HintStr: string;
    var CanShow: Boolean; var HintInfo: THintInfo) of object;
  TcxCallOutPosition = (cxbpNone, cxbpAuto, cxbpLeftBottom, cxbpLeftTop, cxbpTopLeft,
    cxbpTopRight, cxbpRightBottom, cxbpRightTop, cxbpBottomRight, cxbpBottomLeft);
  TcxHintIconType = (cxhiNone, cxhiApplication, cxhiInformation, cxhiWarning,
    cxhiError, cxhiQuestion, cxhiWinLogo, cxhiCurrentApplication, cxhiCustom);
  TcxHintAnimate = (cxhaSlideFromLeft, cxhaSlideFromRight, cxhaSlideDownward, cxhaSlideUpward,
    cxhaSlideFromCenter, cxhaHide, cxhaActivate, cxhaFadeIn, cxhaAuto, cxhaNone);
  TcxHintIconSize = (cxisDefault, cxisLarge, cxisSmall);

  IcxHint = interface
  ['{0680CE5D-391B-45A1-B55D-AFCAE92F2DA6}']
    function GetAnimate: TcxHintAnimate;
    function GetAnimationDelay: TcxHintAnimationDelay;
    function GetBorderColor: TColor;
    function GetCallOutPosition: TcxCallOutPosition;
    function GetColor: TColor;
    function GetIconSize: TcxHintIconSize;
    function GetIconType: TcxHintIconType;
    function GetHintCaption: string;
    function GetRounded: Boolean;
    function GetRoundRadius: Integer;
    function GetStandard: Boolean;
    function GetHintFont: TFont;
    function GetHintCaptionFont: TFont;
    function GetHintIcon: TIcon;
    procedure SetHintCaption(Value: string);
    property HintCaption: string read GetHintCaption write SetHintCaption;
  end;

  { TcxCustomHintStyle }
  TcxCustomHintStyle = class(TPersistent)
  private
    FAnimate: TcxHintAnimate;
    FAnimationDelay: TcxHintAnimationDelay;
    FCallOutPosition: TcxCallOutPosition;
    FBorderColor: TColor;
    FColor: TColor;
    FFont: TFont;
    FCaptionFont: TFont;
    FIcon: TIcon;
    FIconSize: TcxHintIconSize;
    FIconType: TcxHintIconType;
    FRounded: Boolean;
    FRoundRadius: Integer;
    FStandard: Boolean;
    FDirectAccessMode: Boolean;
    FIsDestroying: Boolean;
    FModified: Boolean;
    FOwner: TPersistent;
    FUpdateCount: Integer;
    FOnChanged: TNotifyEvent;
    function GetControl: TcxControl;
    function GetFont: TFont;
    procedure SetAnimate(Value: TcxHintAnimate);
    procedure SetAnimationDelay(Value: TcxHintAnimationDelay);
    procedure SetCallOutPosition(Value: TcxCallOutPosition);
    procedure SetBorderColor(Value: TColor);
    procedure SetCaptionFont(Value: TFont);
    procedure SetColor(Value: TColor);
    procedure SetFont(Value: TFont);
    procedure SetIcon(Value: TIcon);
    procedure SetIconSize(Value: TcxHintIconSize);
    procedure SetIconType(Value: TcxHintIconType);
    procedure SetRounded(Value: Boolean);
    procedure SetRoundRadius(Value: Integer);
    procedure SetStandard(Value: Boolean);
    procedure IconChangeHandler(Sender: TObject);
    procedure InternalRestoreDefault;
  protected
    FHintStyleController: TcxCustomHintStyleController;
    function GetOwner: TPersistent; override;
    function BaseGetHintStyleController: TcxCustomHintStyleController;
    procedure BaseSetHintStyleController(Value: TcxCustomHintStyleController);
    procedure Changed; virtual;
    procedure ControllerChangedNotification(AStyleController: TcxCustomHintStyleController); virtual;
    procedure ControllerFreeNotification(AHintStyleController: TcxCustomHintStyleController); virtual;
    function IsDestroying: Boolean;
    procedure HintStyleControllerChanged; virtual;
    property HintStyleController: TcxCustomHintStyleController read BaseGetHintStyleController
      write BaseSetHintStyleController;
    property OnChanged: TNotifyEvent read FOnChanged write FOnChanged;
  public
    constructor Create(AOwner: TPersistent; ADirectAccessMode: Boolean); virtual;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure BeforeDestruction; override;
    procedure BeginUpdate;
    procedure EndUpdate;
    class function GetDefaultHintStyleController: TcxCustomHintStyleController; virtual;
    procedure RestoreDefaults; virtual;
    property Control: TcxControl read GetControl;
    property DirectAccessMode: Boolean read FDirectAccessMode;
  published
    property Animate: TcxHintAnimate read FAnimate write SetAnimate default cxhaAuto;
    property AnimationDelay: TcxHintAnimationDelay read FAnimationDelay write SetAnimationDelay default 100;
    property BorderColor: TColor read FBorderColor write SetBorderColor default clWindowFrame;
    property CallOutPosition: TcxCallOutPosition read FCallOutPosition write SetCallOutPosition default cxbpNone;
    property CaptionFont: TFont read FCaptionFont write SetCaptionFont;
    property Color: TColor read FColor write SetColor default clInfoBk;
    property Font: TFont read GetFont write SetFont;
    property Icon: TIcon read FIcon write SetIcon;
    property IconSize: TcxHintIconSize read FIconSize write SetIconSize default cxisDefault;
    property IconType: TcxHintIconType read FIconType write SetIconType default cxhiNone;
    property Rounded: Boolean read FRounded write SetRounded default False;
    property RoundRadius: Integer read FRoundRadius write SetRoundRadius default 11;
    property Standard: Boolean read FStandard write SetStandard default False;
  end;

  TcxHintStyleClass = class of TcxCustomHintStyle;
  TcxCustomHintWindowClass = class of TcxCustomHintWindow;

  { TcxCustomHintStyleController }
  TcxCustomHintStyleController = class(TComponent)
  private
    FActive: Boolean;
    FIsDestruction: Boolean;
    FListeners: TList;
    FOnHintStyleChanged: TcxHintStyleChangedEvent;
    FOnShowHint: TcxShowHintEvent;
    FHintShortPause: Integer;
    FHintPause: Integer;
    FHintHidePause: Integer;
    FSavedShowHintEvent: TShowHintEvent;
    FHintWindow: TcxCustomHintWindow;
    FUpdateCount: Integer;
    procedure SetHintStyle(Value: TcxCustomHintStyle);
    procedure HintStyleChanged(Sender: TObject);
    procedure SetHintShortPause(Value: Integer);
    procedure SetHintPause(Value: Integer);
    procedure SetHintHidePause(Value: Integer);
    procedure SetApplicationHintProperties;
    procedure ShowHintHandler(var HintStr: string; var CanShow: Boolean;
      var HintInfo: THintInfo);
  protected
    FHintStyle: TcxCustomHintStyle;
    function GetHintStyleClass: TcxHintStyleClass; virtual;
    function GetHintWindowClass: TcxCustomHintWindowClass; virtual;
    procedure Loaded; override;
    procedure BeginUpdate; virtual;
    procedure EndUpdate; virtual;
    procedure AddListener(AListener: TcxCustomHintStyle); virtual;
    procedure Changed;
    procedure DoHintStyleChanged(AStyle: TcxCustomHintStyle); virtual;
    function IsDestruction: Boolean;
    procedure RemoveListener(AListener: TcxCustomHintStyle); virtual;
    property Listeners: TList read FListeners;
    property Active: Boolean read FActive;
    property HintStyle: TcxCustomHintStyle read FHintStyle write SetHintStyle;
    property HintShortPause: Integer read FHintShortPause write SetHintShortPause default 50;
    property HintPause: Integer read FHintPause write SetHintPause default 500;
    property HintHidePause: Integer read FHintHidePause write SetHintHidePause default 2500;
    property OnHintStyleChanged: TcxHintStyleChangedEvent read FOnHintStyleChanged
      write FOnHintStyleChanged;
    property OnShowHint: TcxShowHintEvent read FOnShowHint write FOnShowHint;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure BeforeDestruction; override;
    procedure SaveShowHintEvent; virtual;
    procedure RestoreShowHintEvent; virtual;

    procedure ShowHint(X, Y: Integer; ACaption, AHint: string);
    procedure HideHint;
    function GetHintWidth(AHint: string): Integer;
    function GetHintHeight(AHint: string): Integer;
  end;

  { TcxHintStyleController }
  TcxHintStyleController = class(TcxCustomHintStyleController)
  published
    property HintStyle;
    property HintShortPause;
    property HintPause;
    property HintHidePause;
    property OnHintStyleChanged;
    property OnShowHint;
  end;

  { TcxCustomHintWindow }
  TcxCustomHintWindow = class(THintWindow)
  private
    FAnimate: TcxHintAnimate;
    FAnimationDelay: TcxHintAnimationDelay;
    FCallOutPosition: TcxCallOutPosition;
    FBorderColor: TColor;
    FHintColor: TColor;
    FCaption, FText: string;
    FCaptionFont: TFont;
    FIcon: TIcon;
    FIconSize: TcxHintIconSize;
    FIconType: TcxHintIconType;
    FRounded: Boolean;
    FRoundRadius: Integer;
    FStandardHint: Boolean;
    FWordWrap: Boolean;
    Rgn: HRGN;
    FLeftRightMargint, FIconLeftMargin: Integer;
    FTopBottomMargin, FIconTopMargin: Integer;
    FIconHeight: Integer;
    FIconWidth: Integer;
    FCaptionRect: TRect;
    FTextRect: TRect;
    FHintWndRect: TRect;
    FCallOutSize: Byte;
    FCalculatedCallOutPos: TcxCallOutPosition;
    FIndentDelta: Integer;
    procedure FreeAndNilRgn(ARgn: HRGN);
    function FindHintControllerInForm(const AControl: TWinControl): Boolean;
    function CalcMaxWidth(const AText: string): Integer;
    procedure SetIcon(Value: TIcon);
    procedure WMEraseBkgnd(var Message: TWMEraseBkgnd); message WM_ERASEBKGND;
  protected    
    property Animate: TcxHintAnimate read FAnimate write FAnimate;
    property AnimationDelay: TcxHintAnimationDelay read FAnimationDelay write FAnimationDelay;
    property CallOutPosition: TcxCallOutPosition read FCallOutPosition write FCallOutPosition;
    property BorderColor: TColor read FBorderColor write FBorderColor;
    property Caption: string read FCaption write FCaption;
    property CaptionFont: TFont read FCaptionFont write FCaptionFont;
    property Icon: TIcon read FIcon write SetIcon;
    property IconSize: TcxHintIconSize read FIconSize write FIconSize;
    property IconType: TcxHintIconType read FIconType write FIconType;
    property Rounded: Boolean read FRounded write FRounded;
    property RoundRadius: Integer read FRoundRadius write FRoundRadius;
    property StandardHint: Boolean read FStandardHint write FStandardHint;
    property WordWrap: Boolean read FWordWrap write FWordWrap;
    procedure CreateBalloonForm; virtual;
    procedure DisableRegion; virtual;
    procedure Paint; override;
    procedure CalculateValues; virtual;
    procedure CalculateControler; virtual;
    procedure CalculateIcon; virtual;
    function CalculateAutoCallOutPosition(const ARect: TRect): TcxCallOutPosition; virtual;
    procedure CalculateRects(const ACaption, AText: string); virtual;
    procedure LoadPropertiesFromController(const AHintController: TcxCustomHintStyleController);
    procedure LoadPropertiesFromHintInterface(const AHintIntf: IcxHint);
    procedure LoadPropertiesFromHintStyle(const AHintStyle: TcxCustomHintStyle);
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;
    function IsHintMsg(var Msg: TMsg): Boolean; override;
    procedure ActivateHint(Rect: TRect; const AHint: string); override;
    function CalcHintRect(MaxWidth: Integer; const AHint: string;
      AData: Pointer): TRect; override;
  end;

  { TcxHintWindow }
  TcxHintWindow = class(TcxCustomHintWindow)
  public
    property Animate;
    property AnimationDelay;
    property CallOutPosition;
    property BorderColor;
    property Caption;
    property CaptionFont;
    property Icon;
    property IconSize;
    property IconType;
    property Rounded;
    property RoundRadius;
    property WordWrap;
  end;

implementation

uses
{$IFDEF VCL}
  dxThemeConsts, dxThemeManager, dxUxTheme,
{$ENDIF}
  cxEditTextUtils, cxEditUtils, cxEditConsts, cxExtEditUtils;

{$IFNDEF DELPHI6}
type
  TAnimateWindowProc = function(hWnd: HWND; dwTime: DWORD; dwFlags: DWORD): BOOL; stdcall;

const
  SPI_GETTOOLTIPANIMATION = $1016;
  SPI_GETTOOLTIPFADE = $1018;

var
  AnimateWindowProc: TAnimateWindowProc = nil;
{$ENDIF}  

function GetParentEntity(Control: TControl): TWinControl;
begin
  while Control.Parent <> nil do
    Control := Control.Parent;
  if (Control is TCustomForm) {$IFDEF DELPHI6} or (Control is TCustomFrame) {$ENDIF} then
    Result := TWinControl(Control)
  else
    Result := nil;
end;

var
  HintedControl: TControl;

{ TcxCustomHintStyle }
constructor TcxCustomHintStyle.Create(AOwner: TPersistent; ADirectAccessMode: Boolean);
begin
  inherited Create;
  FOwner := AOwner;
  FDirectAccessMode := ADirectAccessMode;
  FFont := TFont.Create;
  FCaptionFont := TFont.Create;
  FIcon := TIcon.Create;
  FIcon.OnChange := IconChangeHandler;
  FModified := False;
  InternalRestoreDefault;
  HintStyleController := GetDefaultHintStyleController;
end;

destructor TcxCustomHintStyle.Destroy;
begin
  if FHintStyleController <> nil then
    FHintStyleController.RemoveListener(Self);
  FreeAndNil(FIcon);
  FreeAndNil(FCaptionFont);
  FreeAndNil(FFont);
  inherited Destroy;
end;

procedure TcxCustomHintStyle.Assign(Source: TPersistent);
begin
  if (Source is TcxCustomHintStyle) then
  begin
    BeginUpdate;
    try
      with (Source as TcxCustomHintStyle) do
      begin
        Self.Animate := Animate;
        Self.AnimationDelay := AnimationDelay;
        Self.BorderColor := BorderColor;
        Self.CallOutPosition := CallOutPosition;
        Self.CaptionFont.Assign(CaptionFont);
        Self.Color := Color;
        Self.HintStyleController := HintStyleController;
        Self.IconSize := IconSize;
        Self.IconType := IconType;
        Self.Rounded := Rounded;
        Self.RoundRadius := RoundRadius;
        Self.Standard := Standard;
        Self.Font.Assign(Font);
        Self.CaptionFont.Assign(CaptionFont);
        Self.Icon.Assign(Icon);
      end;
    finally
      EndUpdate;
    end
  end
  else
    inherited Assign(Source);
end;

procedure TcxCustomHintStyle.InternalRestoreDefault;
var
  FRestoreFont: TFont;
begin
  FAnimate := cxhaAuto;
  FAnimationDelay := 100;
  FBorderColor := clWindowFrame;
  FCallOutPosition := cxbpNone;
  FColor := clInfoBk;
  FIconSize := cxisDefault;
  FIconType := cxhiNone;
  FRounded := False;
  FRoundRadius := 11;
  FStandard := False;
  FRestoreFont := TFont.Create;
  try
    FFont.Assign(FRestoreFont);
    FCaptionFont.Assign(FRestoreFont);
  finally
    FreeAndNil(FRestoreFont);
  end;
end;

procedure TcxCustomHintStyle.BeforeDestruction;
begin
  FIsDestroying := True;
  inherited BeforeDestruction;
end;

procedure TcxCustomHintStyle.BeginUpdate;
begin
  Inc(FUpdateCount);
end;

procedure TcxCustomHintStyle.EndUpdate;
begin
  if FUpdateCount <> 0 then
  begin
    Dec(FUpdateCount);
    if FModified then Changed;
  end;
end;

class function TcxCustomHintStyle.GetDefaultHintStyleController: TcxCustomHintStyleController;
begin
  Result := nil;
end;

procedure TcxCustomHintStyle.RestoreDefaults;
begin
  BeginUpdate;
  try
    InternalRestoreDefault;
  finally
    EndUpdate;
  end;
end;

function TcxCustomHintStyle.GetOwner: TPersistent;
begin
  Result := FOwner;
end;

function TcxCustomHintStyle.BaseGetHintStyleController: TcxCustomHintStyleController;
begin
  if FHintStyleController = GetDefaultHintStyleController then
    Result := nil
  else
    Result := FHintStyleController;
end;

type
  TPersistentAccess = class(TPersistent);

procedure TcxCustomHintStyle.BaseSetHintStyleController(Value: TcxCustomHintStyleController);

  function CheckHintStyleController(AHintStyleController: TcxCustomHintStyleController): Boolean;
  var
    AOwner: TPersistent;
  begin
    Result := False;
    AOwner := GetOwner;
    while AOwner <> nil do
    begin
      if (AOwner is TcxCustomHintStyleController) and (AOwner = AHintStyleController) then
        Exit;
      AOwner := TPersistentAccess(AOwner).GetOwner;
    end;
    Result := True;
  end;

begin
  if Value = nil then
    Value := GetDefaultHintStyleController;

  if (Value <> nil) and (not CheckHintStyleController(Value)) then Exit;

  if Value <> FHintStyleController then
  begin
    if FHintStyleController <> nil then
      FHintStyleController.RemoveListener(Self);
    FHintStyleController := Value;
    if FHintStyleController <> nil then
      FHintStyleController.AddListener(Self);
    HintStyleControllerChanged;
  end;
end;

procedure TcxCustomHintStyle.Changed;
begin
  if FUpdateCount = 0 then
  begin
    if not DirectAccessMode and Assigned(FOnChanged) and not IsDestroying then
      FOnChanged(Self);
    FModified := False;
  end
  else
    FModified := True;
end;

procedure TcxCustomHintStyle.ControllerChangedNotification(AStyleController: TcxCustomHintStyleController);
begin
  Changed;
end;

procedure TcxCustomHintStyle.ControllerFreeNotification(AHintStyleController: TcxCustomHintStyleController);
begin
  if (AHintStyleController <> nil) and (AHintStyleController = FHintStyleController) then
    HintStyleController := nil;
end;

function TcxCustomHintStyle.IsDestroying: Boolean;
begin
  Result := FIsDestroying;
end;

procedure TcxCustomHintStyle.HintStyleControllerChanged;
begin
  Changed;
end;

function TcxCustomHintStyle.GetControl: TcxControl;
begin
  Result := TcxControl(FOwner);
end;

function TcxCustomHintStyle.GetFont: TFont;
begin
  Result := FFont;
end;

procedure TcxCustomHintStyle.SetAnimate(Value: TcxHintAnimate);
begin
  if Value <> FAnimate then
  begin
    FAnimate := Value;
    Changed;
  end;
end;

procedure TcxCustomHintStyle.SetAnimationDelay(Value: TcxHintAnimationDelay);
begin
  if Value <> FAnimationDelay then
  begin
    FAnimationDelay := Value;
    Changed;
  end;
end;

procedure TcxCustomHintStyle.SetCallOutPosition(Value: TcxCallOutPosition);
begin
  if Value <> FCallOutPosition then
  begin
    FCallOutPosition := Value;
    Changed;
  end;
end;

procedure TcxCustomHintStyle.SetBorderColor(Value: TColor);
begin
  if Value <> FBorderColor then
  begin
    FBorderColor := Value;
    Changed;
  end;
end;

procedure TcxCustomHintStyle.SetColor(Value: TColor);
begin
  if FColor <> Value then
  begin
    FColor := Value;
    Changed;
  end;
end;

procedure TcxCustomHintStyle.SetCaptionFont(Value: TFont);
begin
  FCaptionFont.Assign(Value);
  Changed;
end;

procedure TcxCustomHintStyle.SetFont(Value: TFont);
begin
  FFont.Assign(Value);
  Changed;
end;

procedure TcxCustomHintStyle.SetIconSize(Value: TcxHintIconSize);
begin
  if FIconSize <> Value then
  begin
    FIconSize := Value;
    Changed;
  end;
end;

procedure TcxCustomHintStyle.SetIconType(Value: TcxHintIconType);
begin
  if FIconType <> Value then
  begin
    FIconType := Value;
    Changed;
  end;
end;

procedure TcxCustomHintStyle.SetIcon(Value: TIcon);
begin
  if FIcon <> Value then
  begin
    FIcon.Assign(Value);
    Changed;
  end;
end;

procedure TcxCustomHintStyle.SetRounded(Value: Boolean);
begin
  if FRounded <> Value then
  begin
    FRounded := Value;
    Changed;
  end;
end;

procedure TcxCustomHintStyle.SetRoundRadius(Value: Integer);
begin
  if FRoundRadius <> Value then
  begin
    FRoundRadius := Value;
    Changed;
  end;
end;

procedure TcxCustomHintStyle.SetStandard(Value: Boolean);
begin
  if FStandard <> Value then
  begin
    FStandard := Value;
    Changed;
  end;
end;

procedure TcxCustomHintStyle.IconChangeHandler(Sender: TObject);
begin
  Changed;
end;
{ TcxCustomHintStyle }

{ TcxCustomHintStyleController }
constructor TcxCustomHintStyleController.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FUpdateCount := 0;
  FActive := True;
  FHintShortPause := 50;
  FHintPause := 500;
  FHintHidePause :=2500;
  FListeners := TList.Create;
  FHintStyle := GetHintStyleClass.Create(Self, False);
  FHintStyle.OnChanged := HintStyleChanged;
  FHintWindow := GetHintWindowClass.Create(Self);
end;

destructor TcxCustomHintStyleController.Destroy;
var
  I: Integer;
begin
  for I := 0 to FListeners.Count - 1 do
    TcxCustomHintStyle(FListeners[I]).ControllerFreeNotification(Self);
  FreeAndNil(FHintStyle);
  FreeAndNil(FListeners);
  FreeAndNil(FHintWindow);
  RestoreShowHintEvent;
  inherited Destroy;
end;

procedure TcxCustomHintStyleController.Assign(Source: TPersistent);
begin
  if (Source is TcxCustomHintStyleController) then
  begin
    BeginUpdate;
    try
      with (Source as TcxCustomHintStyleController) do
      begin
        Self.OnHintStyleChanged := OnHintStyleChanged;
        Self.OnShowHint := OnShowHint;
        Self.HintShortPause := HintShortPause;
        Self.HintPause := HintPause;
        Self.HintHidePause := HintHidePause;
        Self.HintStyle := HintStyle;
      end;
    finally
      EndUpdate;
    end
  end
  else
    inherited Assign(Source);
end;

procedure TcxCustomHintStyleController.ShowHint(X, Y: Integer; ACaption, AHint: string);
var
  R: TRect;
begin
  HintedControl := nil;

  FHintWindow.FCaption := ACaption;
  R := FHintWindow.CalcHintRect(Screen.Width, AHint, nil);
  OffsetRect(R, X, Y);
  FHintWindow.ActivateHint(R, AHint);
end;

function TcxCustomHintStyleController.GetHintWidth(AHint: string): Integer;
var
  R: TRect;
begin
  R := FHintWindow.CalcHintRect(Screen.Width, AHint, nil);
  Result := R.Right - R.Left;
end;

function TcxCustomHintStyleController.GetHintHeight(AHint: string): Integer;
var
  R: TRect;
begin
  R := FHintWindow.CalcHintRect(Screen.Width, AHint, nil);
  Result := R.Bottom - R.Top;
end;

procedure TcxCustomHintStyleController.HideHint;
begin
  HintedControl := nil;

  if (FHintWindow <> nil) and FHintWindow.HandleAllocated and
    IsWindowVisible(FHintWindow.Handle) then
    ShowWindow(FHintWindow.Handle, SW_HIDE);
end;

procedure TcxCustomHintStyleController.BeforeDestruction;
begin
  FIsDestruction := True;
  inherited BeforeDestruction;
end;

procedure TcxCustomHintStyleController.Loaded;
begin
  inherited Loaded;
  SetApplicationHintProperties;
  Changed;
  SaveShowHintEvent;
end;

procedure TcxCustomHintStyleController.BeginUpdate;
begin
  Inc(FUpdateCount);
end;

procedure TcxCustomHintStyleController.EndUpdate;
begin
  Dec(FUpdateCount);
  if FUpdateCount = 0 then
    SetApplicationHintProperties;
end;

procedure TcxCustomHintStyleController.AddListener(AListener: TcxCustomHintStyle);
begin
  if (AListener = nil) or (FListeners.IndexOf(AListener) >= 0) then
    Exit;
  FListeners.Add(AListener);
end;

procedure TcxCustomHintStyleController.Changed;
var
  I: Integer;
begin
  if (HintStyle <> nil) and Assigned(FOnHintStyleChanged) then
    FOnHintStyleChanged(Self, HintStyle);
  if not IsDestruction then
    for I := 0 to Listeners.Count - 1 do
      DoHintStyleChanged(TcxCustomHintStyle(Listeners[I]));
end;

procedure TcxCustomHintStyleController.DoHintStyleChanged(AStyle: TcxCustomHintStyle);
begin
  AStyle.ControllerChangedNotification(Self);
  if Assigned(FOnHintStyleChanged) then
    FOnHintStyleChanged(Self, AStyle);
end;

function TcxCustomHintStyleController.GetHintStyleClass: TcxHintStyleClass;
begin
  Result := TcxCustomHintStyle;
end;

function TcxCustomHintStyleController.GetHintWindowClass: TcxCustomHintWindowClass;
begin
  Result := TcxCustomHintWindow;
end;

function TcxCustomHintStyleController.IsDestruction: Boolean;
begin
  Result := FIsDestruction;
end;

procedure TcxCustomHintStyleController.RemoveListener(AListener: TcxCustomHintStyle);
begin
  if (AListener = nil) or (FListeners.IndexOf(AListener) < 0) then
    Exit;
  if not IsDestruction then
    FListeners.Remove(AListener);
end;

procedure TcxCustomHintStyleController.SetHintStyle(Value: TcxCustomHintStyle);
begin
  FHintStyle.Assign(Value);
end;

procedure TcxCustomHintStyleController.HintStyleChanged(Sender: TObject);
begin
  Changed;
end;

procedure TcxCustomHintStyleController.SetApplicationHintProperties;
begin
  if not (csDesigning in ComponentState) then
  begin
    Application.HintShortPause := FHintShortPause;
    Application.HintPause := FHintPause;
    Application.HintHidePause := FHintHidePause;
    Application.ShowHint := not Application.ShowHint;
    Application.ShowHint := not Application.ShowHint;
    HintWindowClass := GetHintWindowClass;
  end;
end;

procedure TcxCustomHintStyleController.SetHintShortPause(Value: Integer);
begin
  if FHintShortPause <> Value then
  begin
    FHintShortPause := Value;
    if FUpdateCount = 0 then
      SetApplicationHintProperties;
  end;
end;

procedure TcxCustomHintStyleController.SetHintPause(Value: Integer);
begin
  if FHintPause <> Value then
  begin
    FHintPause := Value;
    if FUpdateCount = 0 then
      SetApplicationHintProperties;
  end;
end;

procedure TcxCustomHintStyleController.SetHintHidePause(Value: Integer);
begin
  if FHintHidePause <> Value then
  begin
    FHintHidePause := Value;
    if FUpdateCount = 0 then
      SetApplicationHintProperties;
  end;
end;

procedure TcxCustomHintStyleController.SaveShowHintEvent;
begin
  if not (csDesigning in ComponentState) then
  begin
    FSavedShowHintEvent := Application.OnShowHint;
    Application.OnShowHint := ShowHintHandler;
  end;
end;

procedure TcxCustomHintStyleController.RestoreShowHintEvent;
begin
  if not (csDesigning in ComponentState) then
  begin
    if Assigned(FSavedShowHintEvent) then
      Application.OnShowHint := FSavedShowHintEvent
    else
      Application.OnShowHint := nil;
  end;
end;

procedure TcxCustomHintStyleController.ShowHintHandler(var HintStr: string;
  var CanShow: Boolean; var HintInfo: THintInfo);
begin
  if Assigned(FOnShowHint) then FOnShowHint(Self, HintStr, CanShow, HintInfo);
  if CanShow then
    if Assigned(FSavedShowHintEvent) then
      FSavedShowHintEvent(HintStr, CanShow, HintInfo);
  if not CanShow then Exit;
  HintedControl := HintInfo.HintControl;
  FActive := True;
end;
{ TcxCustomHintStyleController }

{ TcxCustomHintWindow }
constructor TcxCustomHintWindow.Create(AOwner: TComponent);
begin
  inherited;
  FAnimate := cxhaAuto;
  FAnimationDelay := 100;
  FCallOutSize := 15;
  FCallOutPosition := cxbpNone;
  FCalculatedCallOutPos := cxbpNone;
  FCaption := '';
  Color := clInfoBk;
  FHintColor := clInfoBk;
  FBorderColor := clWindowFrame;
  FRounded := False;
  FRoundRadius := 11;
  FIconType := cxhiQuestion;
  FStandardHint := True;
  FWordWrap := True;
  FCaptionFont := TFont.Create;
  FCaptionFont.Assign(Font);
  FCaptionFont.Style := FCaptionFont.Style + [fsBold];
  FIcon := TIcon.Create;
end;

destructor TcxCustomHintWindow.Destroy;
begin
  if Assigned(FIcon) then FreeAndNil(FIcon);
  FCaptionFont.Free;
  inherited;
end;

procedure TcxCustomHintWindow.SetIcon(Value: TIcon);
begin
  FIcon.Assign(Value);
end;

function TcxCustomHintWindow.CalcHintRect(MaxWidth: Integer; const AHint: string;
  AData: Pointer): TRect;
begin
  CalculateControler;
  if FStandardHint = False then
  begin
    FText := AHint;
    CalculateIcon;
    CalculateRects(FCaption, FText);
    Result := Rect(0, 0, FHintWndRect.Right, FHintWndRect.Bottom);
  end else
  begin
{$IFDEF DELPHI5}
    Canvas.Font.Assign(Screen.HintFont);
{$ENDIF}
    Result := inherited CalcHintRect(MaxWidth, AHint, AData);
  end;
end;

function TcxCustomHintWindow.IsHintMsg(var Msg: TMsg): Boolean;
begin
  Result := inherited IsHintMsg(Msg);
end;

procedure TcxCustomHintWindow.ActivateHint(Rect: TRect; const AHint: string);
const
  AnimationStyle: array[TcxHintAnimate] of Integer = (AW_HOR_POSITIVE, AW_HOR_NEGATIVE,
    AW_VER_POSITIVE, AW_VER_NEGATIVE, AW_CENTER, AW_HIDE, AW_ACTIVATE,
    AW_BLEND, AW_ACTIVATE, AW_ACTIVATE);
var
  FAllowAnimate: BOOL;
  FAnimStyle: TcxHintAnimate;
begin
  if not FStandardHint then
  begin
    Inc(Rect.Bottom, 4);
    UpdateBoundsRect(Rect);
    case FCalculatedCallOutPos of
      cxbpLeftBottom: InflateRectEx(Rect, -1, - RectHeight(Rect) - 3, 0, 0);
      cxbpLeftTop: InflateRectEx(Rect, 0, -(FCallOutSize * 2) - 6, 0, 0);
      cxbpTopLeft: InflateRectEx(Rect, -FCallOutSize, 0, 0, 0);
      cxbpTopRight: InflateRectEx(Rect, FCallOutSize - RectWidth(Rect), 0, 0, 0);
      cxbpRightBottom: InflateRectEx(Rect, - RectWidth(Rect) + 3,
        - RectHeight(Rect) - 2, 0, 0);
      cxbpRightTop: InflateRectEx(Rect, - RectWidth(Rect) + 1,
        -(FCallOutSize * 2) - 5, 0, 0);
      cxbpBottomRight: InflateRectEx(Rect, - RectWidth(Rect) + FCallOutSize + 1,
        - RectHeight(Rect) - FCallOutSize - 1, 0, 0);
      cxbpBottomLeft: InflateRectEx(Rect, - FCallOutSize - 1,
        - RectHeight(Rect) - FCallOutSize - 3, 0, 0);
    end;
    if Rect.Top + Height > Screen.DesktopHeight then
      Rect.Top := Screen.DesktopHeight - Height;
    if Rect.Left + Width > Screen.DesktopWidth then
      Rect.Left := Screen.DesktopWidth - Width;
    if Rect.Left < Screen.DesktopLeft then
      Rect.Left := Screen.DesktopLeft;
    if Rect.Bottom < Screen.DesktopTop then
      Rect.Bottom := Screen.DesktopTop;
    SetWindowPos(Handle, HWND_TOPMOST, Rect.Left, Rect.Top, Width, Height,
      SWP_NOACTIVATE);

    if (Length(AHint) < 100) and Assigned(AnimateWindowProc) then
    begin
      FAnimStyle := FAnimate;
      SystemParametersInfo(SPI_GETTOOLTIPANIMATION, 0, @FAllowAnimate, 0);
      if FAllowAnimate and (FAnimStyle <> cxhaNone) then
      begin
        if FAnimate = cxhaAuto then
        begin
          SystemParametersInfo(SPI_GETTOOLTIPFADE, 0, @FAllowAnimate, 0);
          if FAllowAnimate then
            FAnimStyle := cxhaFadeIn
          else
            FAnimStyle := cxhaSlideDownward;
        end;

        {MSDN.AnimateWindow: Function fails, if the window uses the window region.
         Windows XP: This does not cause the function to fail. }
        DisableRegion;
        AnimateWindowProc(Handle, AnimationDelay, AnimationStyle[FAnimStyle] or AW_SLIDE);
      end;
    end;

    ParentWindow := Application.Handle;
    ShowWindow(Handle, SW_SHOWNOACTIVATE);
    Invalidate;
  end
  else
    inherited ActivateHint(Rect, AHint);
end;

procedure TcxCustomHintWindow.WMEraseBkgnd(var Message: TWMEraseBkgnd);
begin
{$IFDEF DELPHI6}
  Message.Result := 1;
{$ELSE}
  inherited;
{$ENDIF}
end;

procedure TcxCustomHintWindow.Paint;
var
  ActualRgn: HRGN;
  FIconDrawSize: Integer;
  FIconDrawFlag: Integer;
begin
  if FStandardHint = False then
  begin
    Canvas.Brush.Color := FHintColor;
    Canvas.FillRect(ClientRect);
    Canvas.Pen.Color := FBorderColor;
    Canvas.Pen.Style := psSolid;
    Canvas.Brush.Color := FBorderColor;
    Canvas.Brush.Style := bsSolid;

    CreateBalloonForm;
    ActualRgn := CreateRectRgnIndirect(Rect(0, 0, 0, 0));
    try
      GetWindowRgn(Handle, ActualRgn);
      OffsetRgn(ActualRgn, -1, -1);
      FrameRgn(Canvas.Handle, ActualRgn, Canvas.Brush.Handle, 1, 1);

      Canvas.Brush.Color := FHintColor;

      if not FIcon.Empty then
      begin
        FIconDrawFlag := DI_NORMAL;
        case IconSize of
          cxisLarge: FIconDrawSize := 32;
          cxisSmall: FIconDrawSize := 16;
          else
            FIconDrawSize := FIcon.Width;
        end;
        DrawIconEx(Canvas.Handle, FIconLeftMargin, FIconTopMargin, FIcon.Handle,
          FIconDrawSize, FIconDrawSize, 0, 0, FIconDrawFlag);
      end;
      if FCaption <> '' then
      begin
        Canvas.Font.Assign(FCaptionFont);
        DrawText(Canvas.Handle, @FCaption[1], Length(FCaption), FCaptionRect,
          DT_WORDBREAK or DT_NOPREFIX or DT_VCENTER);
      end;
      Canvas.Font.Assign(Font);
      DrawText(Canvas.Handle, @FText[1], Length(FText), FTextRect,
        DT_WORDBREAK or DT_NOPREFIX);
    finally
      DeleteObject(ActualRgn);
    end;
  end
  else
  begin
    DisableRegion;
    Canvas.Brush.Color := FHintColor;
    Canvas.FillRect(ClientRect);
{$IFDEF DELPHI5}
    Canvas.Font.Assign(Screen.HintFont);
{$ENDIF}
    inherited Paint;
  end;
end;

procedure TcxCustomHintWindow.CalculateControler;
var
  I: Integer;
  FHintIntf: IcxHint;
begin
  if Assigned(HintedControl) then
  begin
    if HintedControl.GetInterface(IcxHint, FHintIntf) then
      LoadPropertiesFromHintInterface(FHintIntf)
    else
      {Try to find TcxCustomHintStyleController in HintedControl parent form}
      FindHintControllerInForm(GetParentEntity(HintedControl));
  end
  else
    if not FindHintControllerInForm(Screen.ActiveForm) then
    begin
      {Try to find TcxCustomHintStyleController in all Screen Forms}
      for I := 0 to Screen.FormCount - 1 do
      begin
        if FindHintControllerInForm(Screen.Forms[I]) then
          Break;
      end;
    end;
end;

function TcxCustomHintWindow.FindHintControllerInForm(const AControl: TWinControl): Boolean;
var
  I: Integer;
begin
  Result := False;

  if AControl = nil then
    Exit;

  for I := 0 to AControl.ComponentCount - 1 do
  begin
    if (AControl.Components[I] is TcxCustomHintStyleController) and
      (AControl.Components[I] as TcxCustomHintStyleController).Active then
    begin
      LoadPropertiesFromController(AControl.Components[I] as TcxCustomHintStyleController);
      Result := True;
      Break;
    end;

{$IFDEF DELPHI6}
    { We gotta check the frames also. }
    if (AControl.Components[I] is TCustomFrame) then
    begin
      Result := FindHintControllerInForm(AControl.Components[I] as TCustomFrame);
      if Result then
        Break;
    end;
{$ENDIF}
  end;
end;

procedure TcxCustomHintWindow.LoadPropertiesFromController(
  const AHintController: TcxCustomHintStyleController);
begin
  LoadPropertiesFromHintStyle(AHintController.HintStyle);
end;

procedure TcxCustomHintWindow.LoadPropertiesFromHintInterface(const AHintIntf: IcxHint);
var
  FDefaultFont: TFont;
begin
  FCaption := AHintIntf.GetHintCaption;
  FAnimate := AHintIntf.GetAnimate;
  FAnimationDelay := AHintIntf.GetAnimationDelay;
  FCallOutPosition := AHintIntf.GetCallOutPosition;
  FBorderColor := AHintIntf.GetBorderColor;
  FHintColor := AHintIntf.GetColor;
  FIconSize := AHintIntf.GetIconSize;
  FIconType := AHintIntf.GetIconType;
  FRounded := AHintIntf.GetRounded;
  FStandardHint := AHintIntf.GetStandard;
  if FRounded = False then
    FRoundRadius := 0
  else
    FRoundRadius := AHintIntf.GetRoundRadius;
  if Assigned(AHintIntf.GetHintIcon) then
    FIcon.Assign(AHintIntf.GetHintIcon)
  else
    FreeAndNil(FIcon);
  FDefaultFont := TFont.Create;
  try
  if Assigned(AHintIntf.GetHintFont) then
    Font.Assign(AHintIntf.GetHintFont)
  else
    Font.Assign(FDefaultFont);
  if Assigned(AHintIntf.GetHintCaptionFont) then
    FCaptionFont.Assign(AHintIntf.GetHintCaptionFont)
  else
    FCaptionFont.Assign(FDefaultFont);
  finally
    FreeAndNil(FDefaultFont);
  end;
end;

procedure TcxCustomHintWindow.LoadPropertiesFromHintStyle(
  const AHintStyle: TcxCustomHintStyle);
begin
  FAnimate := AHintStyle.Animate;
  FAnimationDelay := AHintStyle.AnimationDelay;
  FCallOutPosition := AHintStyle.CallOutPosition;
  FBorderColor := AHintStyle.BorderColor;
  FHintColor := AHintStyle.Color;
  FIcon.Assign(AHintStyle.Icon);
  FIconSize := AHintStyle.IconSize;
  FIconType := AHintStyle.IconType;
  FRounded := AHintStyle.Rounded;
  FStandardHint := AHintStyle.Standard;
  if FRounded = False then
    FRoundRadius := 0
  else
    FRoundRadius := AHintStyle.RoundRadius;
  Font.Assign(AHintStyle.Font);
  FCaptionFont.Assign(AHintStyle.CaptionFont);
end;

procedure TcxCustomHintWindow.CalculateValues;

  function GetIconWidth: Integer;
  var
    FBitmap: TBitmap;
  begin
    FBitmap := TBitmap.Create;
    try
      FBitmap.Width := FIcon.Width;
      FBitmap.Height := FIcon.Height;
      DrawIconEx(FBitmap.Canvas.Handle, 0, 0, FIcon.Handle,
        FIcon.Width, FIcon.Height, 0, 0, DI_NORMAL);
      Result := FIcon.Width;
    finally
      FBitmap.Free;
    end;
  end;

begin
  FIndentDelta := 6;
  if FRounded = False then
  begin
    FLeftRightMargint := FIndentDelta;
    FTopBottomMargin := FIndentDelta;
  end
  else
  begin
    FLeftRightMargint := (FRoundRadius div 2) + 2;
    FTopBottomMargin := (FRoundRadius div 2) + 2;
  end;
  if not FIcon.Empty then
  begin
    if FIconType <> cxhiCustom then
      FIconWidth := FIcon.Width
    else
      FIconWidth := GetIconWidth;
    FIconHeight := FIcon.Height;
    case FIconSize of
      cxisLarge:
      begin
        FIconHeight := 32;
        FIconWidth := 32;
      end;
      cxisSmall:
      begin
        FIconHeight := 16;
        FIconWidth := 16;
      end;
    end;
  end
  else
  begin
    FIconHeight := 0;
    FIconWidth := 0;
  end;
  FIconLeftMargin := FLeftRightMargint;
  FIconTopMargin := FLeftRightMargint;
end;

procedure TcxCustomHintWindow.CalculateRects(const ACaption, AText: string);
var
  FTopDelta, FLeftDelta, FCaptionRectHeight: Integer;
  FLeftCallOutDelta, FTopCallOutDelta, FRightCallOutDelta, FBottomCallOutDelta: Integer;
begin
  CalculateValues;
  FLeftCallOutDelta := 0;
  FTopCallOutDelta := 0;
  FRightCallOutDelta := 0;
  FBottomCallOutDelta := 0;
  Canvas.Font.Assign(Font);
  FTextRect := Rect(0, 0, CalcMaxWidth(AText), 1);
  DrawText(Canvas.Handle, @AText[1], Length(AText), FTextRect,
    DT_CALCRECT or DT_WORDBREAK or DT_NOPREFIX);
  if FCaption <> '' then
  begin
    Canvas.Font.Assign(FCaptionFont);
    if not FIcon.Empty then
      FCaptionRectHeight := FIconHeight
    else
      FCaptionRectHeight := 1;
    FCaptionRect := Rect(0, 0, CalcMaxWidth(ACaption), FCaptionRectHeight);
    DrawText(Canvas.Handle, @ACaption[1], Length(ACaption), FCaptionRect,
      DT_CALCRECT or DT_WORDBREAK or DT_NOPREFIX {or DT_VCENTER});
    Inc(FCaptionRect.Right, FIconWidth);
  end
  else
    FCaptionRect := Rect(0, 0, 0, 0);
  if not FIcon.Empty then
  begin
    if RectHeight(FCaptionRect) < FIconHeight then
    begin
      FCaptionRect.Top := FCaptionRect.Top + (FIconHeight - RectHeight(FCaptionRect)) div 2;
      FCaptionRect.Bottom := FIconHeight;
    end;
  end;
  if FCaption <> '' then
  begin
    if (RectWidth(FCaptionRect) > RectWidth(FTextRect)) then
      FTextRect.Right := FCaptionRect.Right;
    Dec(FCaptionRect.Right, FIconWidth);
    if RectHeight(FCaptionRect) > FIconHeight then
      FTopDelta := RectHeight(FCaptionRect) + FIndentDelta
    else
      FTopDelta := FIconHeight + FIndentDelta;
    Inc(FTextRect.Top, FTopDelta);
    Inc(FTextRect.Bottom, FTopDelta);
    if FIconWidth > 0 then
      FLeftDelta := FIndentDelta
    else
      FLeftDelta := 0;
    InflateRectEx(FTextRect, FLeftRightMargint + FLeftDelta, FTopBottomMargin, FLeftRightMargint * 2 + FLeftDelta + FIndentDelta, FTopBottomMargin * 2);
    InflateRectEx(FCaptionRect, FLeftRightMargint + FIconWidth + FLeftDelta, FTopBottomMargin, FLeftRightMargint * 2 + FIconWidth + FIndentDelta, FTopBottomMargin * 2);
  end
  else
  begin
    if FIconWidth > 0 then
      FLeftDelta := FIconWidth + FIndentDelta + 2
    else
      FLeftDelta := 0;
    if FIconHeight > RectHeight(FTextRect) then
      FTextRect.Bottom := FIconHeight;
    InflateRectEx(FTextRect, FLeftRightMargint + FLeftDelta, FTopBottomMargin, FLeftRightMargint * 2 + FLeftDelta + FIndentDelta, FTopBottomMargin * 2);
  end;
  FHintWndRect := Rect(0, 0, FTextRect.Right, FTextRect.Bottom);

  FCalculatedCallOutPos := CalculateAutoCallOutPosition(FHintWndRect);
  case FCalculatedCallOutPos of
    cxbpRightBottom, cxbpRightTop: FRightCallOutDelta := FCallOutSize;
    cxbpBottomLeft, cxbpBottomRight: FBottomCallOutDelta := FCallOutSize;
    cxbpLeftTop, cxbpLeftBottom:
      begin
        FLeftCallOutDelta := FCallOutSize;
        FRightCallOutDelta := FCallOutSize;
        FIconLeftMargin := FIconLeftMargin + FCallOutSize;
      end;
    cxbpTopLeft, cxbpTopRight:
      begin
        FTopCallOutDelta := FCallOutSize;
        FBottomCallOutDelta := FCallOutSize;
        FIconTopMargin := FIconTopMargin + FCallOutSize;
      end;
  end;
  if FCaption <> '' then
    InflateRectEx(FCaptionRect, FLeftCallOutDelta, FTopCallOutDelta,
      FRightCallOutDelta, FBottomCallOutDelta);
  InflateRectEx(FTextRect, FLeftCallOutDelta, FTopCallOutDelta,
    FRightCallOutDelta, FBottomCallOutDelta);
  InflateRectEx(FHintWndRect, FLeftCallOutDelta, FTopCallOutDelta,
    FRightCallOutDelta, FBottomCallOutDelta);
end;

function TcxCustomHintWindow.CalculateAutoCallOutPosition(const ARect: TRect): TcxCallOutPosition;
var
  FCursorPos: TPoint;
begin
  if FCallOutPosition = cxbpAuto then
  begin
    Windows.GetCursorPos(FCursorPos);
    if FCursorPos.Y < (Screen.Height div 2) then
    begin
      if FCursorPos.X - RectWidth(ARect) < 0 then
        Result := cxbpTopLeft
      else
        Result := cxbpTopRight;
    end
    else
    begin
      if FCursorPos.X - RectWidth(ARect) < 0 then
        Result := cxbpBottomLeft
      else
        Result := cxbpBottomRight;
    end;
  end
  else
    Result := FCallOutPosition;
end;

function TcxCustomHintWindow.CalcMaxWidth(const AText: string): Integer;
var
  FStringList: TStringList;
  I, FWidth: Integer;
begin
  Result := Canvas.TextWidth(AText);
  FStringList := TStringList.Create;
  try
    FStringList.Text := AText;
    for I := 0 to FStringList.Count - 1 do
    begin
      FWidth := Canvas.TextWidth(FStringList[I]);
      if FWidth > Result then
        Result := FWidth;
    end;
  finally
    FStringList.Free;
  end;
  Inc(Result, 1);
end;

procedure TcxCustomHintWindow.CalculateIcon;
type
  TcxRealHintIconType = (IDIAPPLICATION, IDIINFORMATION, IDIWARNING,
    IDIERROR, IDIQUESTION, IDIWINLOGO);
const
  FRealIconTypes: array[TcxRealHintIconType] of PChar = (
    IDI_APPLICATION, IDI_INFORMATION, IDI_WARNING, IDI_ERROR,
    IDI_QUESTION, IDI_WINLOGO);
begin
  if (FIconType = cxhiNone) then
  begin
    if Assigned(FIcon) and (not FIcon.Empty) then
    begin
      FreeAndNil(FIcon);
      FIcon := TIcon.Create;
    end;
    Exit;
  end;
  if (FIconType = cxhiCustom) then
    Exit;
  try
    if (FIconType = cxhiCurrentApplication) then
      FIcon.Assign(Application.Icon)
    else
      FIcon.Handle := LoadIcon(0, FRealIconTypes[TcxRealHintIconType(Ord(FIconType)-1)]);
  finally
  end;
end;

procedure TcxCustomHintWindow.FreeAndNilRgn(ARgn: HRGN);
begin
  if ARgn <> 0 then DeleteObject(ARgn);
end;

procedure TcxCustomHintWindow.CreateBalloonForm;
var
  R: TRect;
  CallOutRgn: HRGN;
  CallOutTops: array[0..2] of TPoint;
begin
  if (FCalculatedCallOutPos = cxbpNone) and (Rounded = False) then
  begin
    DisableRegion;
    Exit;
  end;
  FreeAndNilRgn(Rgn);
  R := ClientRect;

  case FCalculatedCallOutPos of
    cxbpLeftBottom:
      begin
        InflateRectEx(R, FCallOutSize, 0, 0, 0);
        CallOutTops[0] := Point(R.Left, R.Bottom - FCallOutSize);
        CallOutTops[1] := Point(R.Left, R.Bottom - FCallOutSize * 2);
        CallOutTops[2] := Point(R.Left - FCallOutSize, R.Bottom - FCallOutSize);
      end;
    cxbpLeftTop:
      begin
        InflateRectEx(R, FCallOutSize, 0, 0, 0);
        CallOutTops[0] := Point(R.Left, R.Top + FCallOutSize);
        CallOutTops[1] := Point(R.Left, R.Top + FCallOutSize * 2);
        CallOutTops[2] := Point(R.Left - FCallOutSize, R.Top + FCallOutSize);
      end;
    cxbpTopRight:
      begin
        InflateRectEx(R, 0, FCallOutSize, 0, 0);
        CallOutTops[0] := Point(R.Right - FCallOutSize, R.Top);
        CallOutTops[1] := Point(R.Right - FCallOutSize * 2, R.Top);
        CallOutTops[2] := Point(R.Right - FCallOutSize, R.Top - FCallOutSize);
      end;
    cxbpTopLeft:
      begin
        InflateRectEx(R, 0, FCallOutSize, 0, 0);
        CallOutTops[0] := Point(R.Left + FCallOutSize, R.Top);
        CallOutTops[1] := Point(R.Left + FCallOutSize * 2, R.Top);
        CallOutTops[2] := Point(R.Left + FCallOutSize, R.Top - FCallOutSize);
      end;
    cxbpRightBottom:
      begin
        InflateRectEx(R, 0, 0, -FCallOutSize, 0);
        CallOutTops[0] := Point(R.Right - 1, R.Bottom - FCallOutSize);
        CallOutTops[1] := Point(R.Right - 1, R.Bottom - FCallOutSize * 2);
        CallOutTops[2] := Point(R.Right + FCallOutSize, R.Bottom - FCallOutSize);
      end;
    cxbpRightTop:
      begin
        InflateRectEx(R, 0, 0, -FCallOutSize, 0);
        CallOutTops[0] := Point(R.Right - 1, R.Top + FCallOutSize);
        CallOutTops[1] := Point(R.Right - 1, R.Top + FCallOutSize * 2);
        CallOutTops[2] := Point(R.Right + FCallOutSize, R.Top + FCallOutSize);
      end;
    cxbpBottomRight:
      begin
        InflateRectEx(R, 0, 0, 0, -FCallOutSize);
        CallOutTops[0] := Point(R.Right - FCallOutSize, R.Bottom - 1);
        CallOutTops[1] := Point(R.Right - FCallOutSize * 2, R.Bottom - 1);
        CallOutTops[2] := Point(R.Right - FCallOutSize, R.Bottom + FCallOutSize);
      end;
    cxbpBottomLeft:
      begin
        InflateRectEx(R, 0, 0, 0, -FCallOutSize);
        CallOutTops[0] := Point(R.Left + FCallOutSize, R.Bottom - 1);
        CallOutTops[1] := Point(R.Left + FCallOutSize * 2, R.Bottom - 1);
        CallOutTops[2] := Point(R.Left + FCallOutSize, R.Bottom + FCallOutSize);
      end;
  end;

  Rgn := CreateRoundRectRgn(R.Left, R.Top, R.Right, R.Bottom, FRoundRadius, FRoundRadius);
  CallOutRgn := CreatePolygonRgn(CallOutTops, 3, WINDING);

  CombineRgn(Rgn, Rgn, CallOutRgn, RGN_OR );
  OffsetRgn(Rgn, 1, 1);
  SetWindowRgn(Handle, Rgn, True);
  DeleteObject(CallOutRgn);
end;

procedure TcxCustomHintWindow.DisableRegion;
begin
  SetWindowRgn(Handle, 0, True);
  FreeAndNilRgn(Rgn);
end;
{ TcxCustomHintWindow }

{$IFNDEF DELPHI6}
var
  UserHandle: THandle;

initialization
  UserHandle := GetModuleHandle('USER32');
  if UserHandle <> 0 then
    @AnimateWindowProc := GetProcAddress(UserHandle, 'AnimateWindow');
{$ENDIF}
end.
