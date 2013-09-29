
{********************************************************************}
{                                                                    }
{       Developer Express Visual Component Library                   }
{       ExpressCommonLibrary                                         }
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
{   LICENSED TO DISTRIBUTE THE EXPRESSCOMMONLIBRARY AND ALL          }
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

unit cxContainer;

{$I cxVer.inc}

interface

uses
{$IFDEF MSWINDOWS}
  Windows, Messages,
{$ENDIF}
{$IFDEF VCL}                                            
  dxThemeConsts, dxThemeManager, dxUxTheme,
{$ELSE}
  Qt, Types, QTypes,
{$ENDIF}
  Classes, Controls, Forms, Graphics, Menus, StdCtrls, SysUtils, cxClasses,
  cxControls, cxGraphics, cxLookAndFeels, cxScrollBar;

const
{$IFDEF VCL}
  CM_CLOSEPOPUPWINDOW = WM_APP + 101;
  CM_SHOWPOPUPWINDOW = WM_APP + 102;
{$ELSE}
  QEventType_CMClosePopupWindow = QEventType(Integer(QEventType_ClxUser) + 1);
  QEventType_CMShowPopupWindow = QEventType(Integer(QEventType_ClxUser) + 2);
  QEventType_CMSetContainerCursor = QEventType(Integer(QEventType_ClxUser) + 4);
{$ENDIF}

  cxContainerMaxBorderWidth = 2;
  cxContainerShadowWidth = 3;

  cxEmptyBrush: TBrushHandle = {$IFDEF VCL}0{$ELSE}nil{$ENDIF};

type
  TcxContainerBorderStyle = (cbsNone, cbsSingle, cbsThick, cbsFlat, cbs3D,
    cbsUltraFlat);
  TcxContainerHotState = (chsNoHotTrack, chsNormal, chsSelected);
  TcxContainerStateItem = (csActive, csDisabled, csHotTrack, csNormal);
  TcxContainerState = set of TcxContainerStateItem;
  TcxMouseButton = (cxmbNone, cxmbLeft, cxmbRight, cxmbMiddle);
  TcxNativeHandle = {$IFDEF MSWINDOWS}HWND{$ENDIF}{$IFDEF LINUX}QWidgetH{$ENDIF};

  TcxContainerStyleValue = 0..SizeOf(Integer) * 8 - 1;
  TcxContainerStyleValues = set of TcxContainerStyleValue;

const
  csvBorderColor       = 0;
  csvBorderStyle       = 1;
  csvColor             = 2;
  csvEdges             = 3;
  csvFont              = 4;
  csvHotTrack          = 5;
  csvShadow            = 6;
  csvTransparentBorder = 7;

  cxContainerStyleValueCount = 8;

  cxContainerStyleValueNameA: array[0..cxContainerStyleValueCount - 1] of string = (
    'BorderColor',
    'BorderStyle',
    'Color',
    'Edges',
    'Font',
    'HotTrack',
    'Shadow',
    'TransparentBorder'
  );

type
  TcxContainerStyle = class;
  TcxStyleChangedEvent = procedure (Sender: TObject; AStyle: TcxContainerStyle) of object;

  TcxContainer = class;
  TcxContainerClass = class of TcxContainer;
  TPersistentAccess = class(TPersistent);
  TWinControlAccess = class(TWinControl);

  { TcxFreeNotificator }

  TcxFreeNotificationEvent = procedure(Sender: TComponent) of object;

  TcxFreeNotificator = class(TComponent)
  private
    FOnFreeNotification: TcxFreeNotificationEvent;
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    procedure AddSender(ASender: TComponent);
    procedure RemoveSender(ASender: TComponent);
    property OnFreeNotification: TcxFreeNotificationEvent read FOnFreeNotification write FOnFreeNotification;
  end;

  { TcxContainerViewInfo }

  TcxContainerViewInfo = class
  private
    FBackgroundColor: TColor;
    procedure SetBackgroundColor(Value: TColor);
  protected
    procedure InternalPaint(ACanvas: TcxCanvas); virtual;
  public
    BackgroundBrush: TBrushHandle;
    BorderColor: TColor;
    BorderRect: TRect;
    BorderStyle: TcxContainerBorderStyle;
    BorderWidth: Integer;
    Bounds: TRect;
    ClientRect: TRect;
    ContainerState: TcxContainerState;
    Edges: TcxBorders;
{$IFDEF VCL}
    NativeStyle: Boolean;
    NativePart: Integer;
    NativeState: Integer;
    ThemedObjectType: TdxThemedObjectType;
{$ENDIF}
    Shadow: Boolean;
    property BackgroundColor: TColor read FBackgroundColor write SetBackgroundColor;
    constructor Create; virtual;
    procedure Assign(Source: TObject); virtual;
    function GetUpdateRegion(AViewInfo: TcxContainerViewInfo): TcxRegion; virtual;
    procedure Offset(DX, DY: Integer); virtual;
    procedure Paint(ACanvas: TcxCanvas); virtual;
  end;

  TcxContainerViewInfoClass = class of TcxContainerViewInfo;

  { TcxContainerStyle }

  TcxStyleController = class;

  TcxContainerStyleData = record
    Color: TColor;
    Font: TFont;
    FontColor: TColor;
  end;

  TcxContainerStyle = class(TPersistent)
  private
    FBorderColor: TColor;
    FBorderStyle: TcxContainerBorderStyle;
    FEdges: TcxBorders;
    FHotTrack: Boolean;
    FShadow: Boolean;
    FTransparentBorder: Boolean;

    FDirectAccessMode: Boolean;
    FIsDestroying: Boolean;
    FLookAndFeel: TcxLookAndFeel;
    FModified: Boolean;
    FOwner: TPersistent;
    FUpdateCount: Integer;
    FOnChanged: TNotifyEvent;

    function GetAssignedValues: TcxContainerStyleValues;
    function GetBorderColor: TColor;
    function GetBorderStyle: TcxContainerBorderStyle;
    function GetEdges: TcxBorders;
    function GetFont: TFont;
    function GetHotTrack: Boolean;
    function GetShadow: Boolean;
    function GetTransparentBorder: Boolean;

    function InternalGetBorderColor(var BorderColor: TColor): Boolean;
    function InternalGetBorderStyle(var BorderStyle: TcxContainerBorderStyle): Boolean;
    function InternalGetEdges(var Edges: TcxBorders): Boolean;
    function InternalGetFont(var Font: TFont): Boolean;
    function InternalGetHotTrack(var HotTrack: Boolean): Boolean;
    function InternalGetShadow(var Shadow: Boolean): Boolean;
    function InternalGetTransparentBorder(var TransparentBorder: Boolean): Boolean;

    function IsBorderColorStored: Boolean;
    function IsBorderStyleStored: Boolean;
    function IsColorStored: Boolean;
    function IsEdgesStored: Boolean;
    function IsFontStored: Boolean;
    function IsHotTrackStored: Boolean;
    function IsShadowStored: Boolean;
    function IsTransparentBorderStored: Boolean;

    procedure SetAssignedValues(Value: TcxContainerStyleValues);
    procedure SetBorderColor(Value: TColor);
    procedure SetBorderStyle(Value: TcxContainerBorderStyle);
    procedure SetColor(Value: TColor);
    procedure SetEdges(Value: TcxBorders);
    procedure SetFont(Value: TFont);
    procedure SetHotTrack(Value: Boolean);
    procedure SetShadow(Value: Boolean);
    procedure SetTransparentBorder(Value: Boolean);

    function GetContainer: TcxContainer;
    procedure LFChanged(Sender: TcxLookAndFeel; AChangedValues: TcxLookAndFeelValues);
    procedure SetLookAndFeel(Value: TcxLookAndFeel);
  protected
    FAssignedValues: TcxContainerStyleValues;
    FInternalSetting: Boolean;
    FStyleController: TcxStyleController;
    function GetOwner: TPersistent; override;
    function BaseGetStyleController: TcxStyleController;
    procedure BaseSetStyleController(Value: TcxStyleController);
    procedure Changed; virtual;
    procedure ControllerChangedNotification(AStyleController: TcxStyleController); virtual;
    procedure ControllerFreeNotification(AStyleController: TcxStyleController); virtual;
    procedure CreateFont;

    function DefaultBorderColor: TColor; virtual;
    function DefaultBorderStyle: TcxContainerBorderStyle; virtual;
    function DefaultColor: TColor; virtual;
    function DefaultEdges: TcxBorders; virtual;
    function DefaultHotTrack: Boolean; virtual;
    function DefaultShadow: Boolean; virtual;
    function DefaultTransparentBorder: Boolean; virtual;

    procedure FontChanged(Sender: TObject); virtual;
    function GetColor: TColor; virtual;
    function GetInternalColor: TColor; virtual;
    function InternalGetColor(var Color: TColor): Boolean;
    function IsDestroying: Boolean;
    function IsValueDefined(AValue: TcxContainerStyleValue): Boolean; virtual;
    procedure StyleControllerChanged; virtual;
    procedure UpdateFont;
    property OnChanged: TNotifyEvent read FOnChanged write FOnChanged;
  public
    StyleData: TcxContainerStyleData;
    constructor Create(AOwner: TPersistent; ADirectAccessMode: Boolean); virtual;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure BeforeDestruction; override;
    procedure BeginUpdate;
    procedure EndUpdate;
    class function GetDefaultStyleController: TcxStyleController; virtual;
    class function GetStyleValue(const APropertyName: string;
      out StyleValue: TcxContainerStyleValue): Boolean;
    class function GetStyleValueCount: Integer; virtual;
    class function GetStyleValueName(AStyleValue: TcxContainerStyleValue;
      out StyleValueName: string): Boolean; virtual;
    procedure RestoreDefaults; virtual;
    property Container: TcxContainer read GetContainer;
    property DirectAccessMode: Boolean read FDirectAccessMode;
  published
    property AssignedValues: TcxContainerStyleValues read GetAssignedValues
      write SetAssignedValues stored False;
    property BorderColor: TColor read GetBorderColor write SetBorderColor
      stored IsBorderColorStored;
    property BorderStyle: TcxContainerBorderStyle read GetBorderStyle
      write SetBorderStyle stored IsBorderStyleStored;
    property Color: TColor read GetColor write SetColor stored IsColorStored;
    property Edges: TcxBorders read GetEdges write SetEdges stored IsEdgesStored;
    property Font: TFont read GetFont write SetFont stored IsFontStored;
    property HotTrack: Boolean read GetHotTrack write SetHotTrack stored IsHotTrackStored;
    property LookAndFeel: TcxLookAndFeel read FLookAndFeel write SetLookAndFeel;
    property Shadow: Boolean read GetShadow write SetShadow stored IsShadowStored;
    property StyleController: TcxStyleController read BaseGetStyleController
      write BaseSetStyleController;
    property TransparentBorder: Boolean read GetTransparentBorder
      write SetTransparentBorder stored IsTransparentBorderStored;
  end;

  TcxContainerStyleClass = class of TcxContainerStyle;

  { TcxStyleController }

  TcxStyleController = class(TComponent)
  private
    FIsDestruction: Boolean;
    FListeners: TList;
    FOnStyleChanged: TcxStyleChangedEvent;
    procedure SetStyle(Value: TcxContainerStyle);
    procedure StyleChanged(Sender: TObject);
  protected
    FStyle: TcxContainerStyle;
    procedure Loaded; override;
    procedure AddListener(AListener: TcxContainerStyle); virtual;
    procedure Changed;
    procedure DoStyleChanged(AStyle: TcxContainerStyle); virtual;
    function GetStyleClass: TcxContainerStyleClass; virtual;
    function IsDestruction: Boolean;
    procedure RemoveListener(AListener: TcxContainerStyle); virtual;
    property Listeners: TList read FListeners;
    property Style: TcxContainerStyle read FStyle write SetStyle;
    property OnStyleChanged: TcxStyleChangedEvent read FOnStyleChanged write FOnStyleChanged;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure BeforeDestruction; override;
  end;

  { TcxContainerMouseTrackingHelper }

  TcxContainerMouseTrackingHelper = class
  private
    FOwner: TcxContainer;
  public
    constructor Create(AOwner: TcxContainer);
    procedure MouseLeave;
  end;

  { IcxContainerInnerControl }

  IcxContainerInnerControl = interface
  ['{1B111318-D9C9-4C35-9EFF-5D95793C0106}']
    function GetControl: TWinControl;
    function GetControlContainer: TcxContainer;
    property Control: TWinControl read GetControl;
    property ControlContainer: TcxContainer read GetControlContainer;
  end;

  { TcxContainer }

  TcxContainer = class(TcxControl, IcxCompoundControl, IcxMouseTrackingCaller)
  private
    FInnerControl: TWinControl;
    FInnerControlMouseDown: Boolean;
    FInnerControlRect: TRect;
    FPInnerControlRect: PRect;
    FIsDestroying: Boolean;
    FIsRefreshLocked: Boolean;
    FLockAlignControlsCount: Integer;
    FMouseTrackingHelper: TcxContainerMouseTrackingHelper;
{$IFDEF VCL}
    FScrollBarsCalculating: Boolean;
    FThemeChangedNotificator: TdxThemeChangedNotificator;
{$ENDIF}
    function GetActiveControl: TWinControl;
    function GetIsDestroying: Boolean;
    procedure SetStyle(const Value: TcxContainerStyle);
{$IFDEF VCL}
    function GetDragKind: TDragKind;
    procedure WMKillFocus(var Message: TWMKillFocus); message WM_KILLFOCUS;
    procedure WMNCPaint(var Message: TMessage); message WM_NCPAINT;
    procedure WMSetCursor(var Message: TWMSetCursor); message WM_SETCURSOR;
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SETFOCUS;
    procedure WMThemeChanged(var Message: TMessage); message WM_THEMECHANGED;
    procedure WMWindowPosChanging(var Message: TWMWindowPosChanging);
      message WM_WINDOWPOSCHANGING;
    procedure CMCtl3DChanged(var Message: TMessage); message CM_CTL3DCHANGED;
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure CMNCSizeChanged(var Message: TMessage); message CM_NCSIZECHANGED;
    procedure CMParentColorChanged(var Message: TMessage); message CM_PARENTCOLORCHANGED;
    procedure CMParentFontChanged(var Message: TMessage); message CM_PARENTFONTCHANGED;
    procedure CMSysColorChange(var Message: TMessage); message CM_SYSCOLORCHANGE;
{$ELSE}
    function GetDragMode: TDragMode;
{$ENDIF}
  protected
    FInternalSetting: Boolean;
    FIsCreating: Boolean;
    FStyle: TcxContainerStyle;
    FViewInfo: TcxContainerViewInfo;
    procedure AdjustClientRect(var Rect: TRect); override;
    procedure AlignControls(AControl: TControl; var Rect: TRect); override;
    function CanFocusOnClick: Boolean; override;
    procedure ColorChanged; override;
    procedure CursorChanged; override;
    procedure FontChanged; override;
    procedure FocusChanged; override;
    function GetClientBounds: TRect; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure Loaded; override;
    function MayFocus: Boolean; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseEnter(AControl: TControl); override;
    procedure MouseLeave(AControl: TControl); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    function NeedsScrollBars: Boolean; override;
    procedure Paint; override;
    procedure Resize; override;
    procedure SetDragMode(Value: TDragMode); {$IFDEF VCL}override{$ELSE}virtual{$ENDIF};
{$IFDEF VCL}
    procedure CreateHandle; override;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure WndProc(var Message: TMessage); override;
{$ELSE}
    procedure CreateWidget; override;
    function EventFilter(Sender: QObjectH; Event: QEventH): Boolean; override;
    procedure InitWidget; override;
//  {$IFDEF LINUX}
    procedure ParentColorChanged; override;
//  {$ENDIF}
{$ENDIF}
    procedure AdjustInnerControl; virtual;
    procedure CalculateViewInfo(const P: TPoint; AMouseTracking: Boolean); virtual;
    procedure ClearSavedChildControlRegions; virtual;
    procedure ContainerStyleChanged(Sender: TObject); virtual;
    procedure DataChange; virtual;
    procedure DataSetChange; virtual;
    procedure EnabledChanged; {$IFDEF VCL}dynamic;{$ELSE}override;{$ENDIF}
    procedure EndMouseTracking; virtual;
    function GetBorderExtent: TRect; virtual;
    function GetBorderWidth(ABorderStyle: TcxContainerBorderStyle): Integer;
    procedure GetChildControlBounds(AChildControlBounds: TRect; AChildControl: TControl;
      var PR: PRect); virtual;
    class function GetStyleClass: TcxContainerStyleClass; virtual;
    class function GetViewInfoClass: TcxContainerViewInfoClass; virtual;
    function GetVisibleBounds: TRect; virtual;
    function IsAlignControlsLocked: Boolean;
    function IsChildControlRegionChanged(AControl: TWinControl; PR: PRect): Boolean; virtual;
    function IsStyleInDirectAccessMode: Boolean; virtual;
    procedure LockAlignControls(ALock: Boolean);
    function RefreshContainer(const P: TPoint; Button: TcxMouseButton; Shift: TShiftState;
      AIsMouseEvent: Boolean): Boolean; virtual;
    procedure SaveChildControlRegion(AControl: TWinControl; PR: PRect); virtual;
    procedure SetScrollBarsParameters; virtual;
    procedure SetShadowRegion;
    procedure SetSize; virtual;
    function ShortRefreshContainer(AIsMouseEvent: Boolean): Boolean;
    function TabsNeeded: Boolean; virtual;
    procedure UpdateData; virtual;
{$IFDEF VCL}
    function GetBackgroundThemedObjectType: TdxThemedObjectType; virtual;
    function GetBackgroundNativePart: Integer; virtual;
    function GetBackgroundNativeState: Integer; virtual;
    procedure SetDragKind(Value: TDragKind); virtual;
    procedure ThemeChanged; virtual;
{$ENDIF}
    property InnerControl: TWinControl read FInnerControl write FInnerControl;
    property InnerControlMouseDown: Boolean read FInnerControlMouseDown write FInnerControlMouseDown;
    property MouseTrackingHelper: TcxContainerMouseTrackingHelper read FMouseTrackingHelper
      implements IcxMouseTrackingCaller;
    property Style: TcxContainerStyle read FStyle write SetStyle;
    property ViewInfo: TcxContainerViewInfo read FViewInfo;
{$IFDEF VCL}
    property DragKind: TDragKind read GetDragKind write SetDragKind default dkDrag;
    property ScrollBarsCalculating: Boolean read FScrollBarsCalculating;
{$ELSE}
    property DragMode: TDragMode read GetDragMode write SetDragMode default dmManual;
{$ENDIF}
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure BeforeDestruction; override;
    function Focused: Boolean; override;
{$IFDEF VCL}
    procedure SetFocus; override;
{$ENDIF}
    class function GetNotPublishedStyleValues: TcxContainerStyleValues; virtual;
    property IsDestroying: Boolean read GetIsDestroying;
    property VisibleBounds: TRect read GetVisibleBounds;
  published
    property TabStop default True;
  end;

  { TcxCustomPopupWindow }

  TcxCustomPopupWindow = class(TcxPopupWindow)
  private
    FCaptureFocus: Boolean;
    FDeactivation: Boolean;
    FFocusedControl: TWinControl;
    FIsDeactivateLocked: Boolean;
    FIsTopMost: Boolean;
    FJustClosed: Boolean;
    FModalMode: Boolean;
    FTerminateOnDestroy: Boolean;
    FOwnerControl: TWinControl;
    FOnClosed: TNotifyEvent;
    FOnClosing: TNotifyEvent;
    FOnShowed: TNotifyEvent;
    FOnShowing: TNotifyEvent;
{$IFDEF MSWINDOWS}
  {$IFNDEF VCL}
    FIsCloseUpLocked: Boolean;
  {$ENDIF}
{$ENDIF}
{$IFDEF LINUX}
    FOwnerControlEventHook: QWidget_hookH;
{$ENDIF}
    procedure SetCaptureFocus(Value: Boolean);
    procedure SetIsTopMost(Value: Boolean);
{$IFDEF VCL}
    procedure WMActivateApp(var Message: TWMActivateApp); message WM_ACTIVATEAPP;
    procedure WMEraseBkgnd(var Message: TWMEraseBkgnd); message WM_ERASEBKGND;
    procedure CMClosePopupWindow(var Message: TMessage); message CM_CLOSEPOPUPWINDOW;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure CMShowPopupWindow(var Message: TMessage); message CM_SHOWPOPUPWINDOW;
{$ENDIF}
  protected
    FStyle: TcxContainerStyle;
    FViewInfo: TcxContainerViewInfo;
    procedure AdjustClientRect(var Rect: TRect); override;
    procedure Deactivate; override;
    procedure InitPopup; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure Paint; override;
    procedure VisibleChanged; override;
{$IFDEF MSWINDOWS}
  {$IFDEF VCL}
    procedure CreateHandle; override;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
  {$ELSE}
    procedure Initialize;
  {$ENDIF}
{$ENDIF}
{$IFDEF LINUX}
    function OwnerControlEventFilter(Sender: QObjectH; Event: QEventH): Boolean; virtual; cdecl;
{$ENDIF}
{$IFNDEF VCL}
    procedure Activate; override;
    function EventFilter(Sender: QObjectH; Event: QEventH): Boolean; override;
    procedure InitWidget; override;
    function WidgetFlags: Integer; override;
{$ENDIF}
    procedure DoClosed; virtual;
    procedure DoClosing; virtual;
    procedure DoShowed; virtual;
    procedure DoShowing;
    function GetFirstFocusControl(AControl: TWinControl): TWinControl;
    function HasBackground: Boolean; virtual;
    function IsDeactivateLocked: Boolean;
    procedure LockDeactivate(ALock: Boolean);
    procedure MouseEnter(AControl: TControl); {$IFDEF VCL}dynamic{$ELSE}override{$ENDIF};
    procedure MouseLeave(AControl: TControl); {$IFDEF VCL}dynamic{$ELSE}override{$ENDIF};
    procedure PopupWindowStyleChanged(Sender: TObject); virtual;
    procedure RecreateWindow;
{$IFDEF MSWINDOWS}
    function IsSysKeyAccepted(Key: Word): Boolean; virtual;
  {$IFNDEF VCL}
    function IsCloseUpLocked: Boolean;
    procedure LockCloseUp(ALock: Boolean);
  {$ENDIF}
{$ENDIF}
{$IFNDEF VCL}
    procedure ActivateMainForm;
{$ENDIF}
    property Style: TcxContainerStyle read FStyle;
    property ViewInfo: TcxContainerViewInfo read FViewInfo;
  public
    constructor Create(AOwnerControl: TWinControl); reintroduce; virtual;
    destructor Destroy; override;
{$IFDEF MSWINDOWS}
  {$IFDEF DELPHI5}
    function CanFocus: Boolean; override; // TODO Delphi4
  {$ENDIF}
{$ENDIF}
    procedure ClosePopup;
    procedure CloseUp(AModalResult: Boolean = False); reintroduce; overload; virtual;
    function Focused: Boolean; override;
    class function GetStyleClass: TcxContainerStyleClass; virtual;
    class function GetViewInfoClass: TcxContainerViewInfoClass; virtual;
    function HasCapture: Boolean;
    function IsVisible: Boolean;
    procedure Popup(AFocusedControl: TWinControl); reintroduce; virtual;
    property CaptureFocus: Boolean read FCaptureFocus write SetCaptureFocus default True;
    property IsTopMost: Boolean read FIsTopMost write SetIsTopMost;
    property JustClosed: Boolean read FJustClosed write FJustClosed;
    property ModalMode: Boolean read FModalMode write FModalMode default True; 
    property OwnerControl: TWinControl read FOwnerControl;
    property TerminateOnDestroy: Boolean read FTerminateOnDestroy write FTerminateOnDestroy;
    property OnClosed: TNotifyEvent read FOnClosed write FOnClosed;
    property OnClosing: TNotifyEvent read FOnClosing write FOnClosing;
    property OnCloseQuery;
    property OnShowed: TNotifyEvent read FOnShowed write FOnShowed;
    property OnShowing: TNotifyEvent read FOnShowing write FOnShowing;
  end;

  { TcxCustomInnerListBox }

  TcxCustomInnerListBox = class(TListBox, IcxContainerInnerControl)
  private
    FCanvas: TcxCanvas;
    FHScrollBar: TcxScrollBar;
    FLookAndFeel: TcxLookAndFeel;
    FVScrollBar: TcxScrollBar;
{$IFDEF VCL}
    FScrollBarsCalculating: Boolean;
    FScrollBarsLockCount: Integer;
{$ENDIF}
    procedure CreateScrollBars;
    function GetControlContainer: TcxContainer;
    function GetControl: TWinControl;
    procedure HScrollHandler(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    procedure SetLookAndFeel(Value: TcxLookAndFeel);
    procedure VScrollHandler(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
{$IFNDEF DELPHI6}
    function GetScrollWidth: Integer;
    procedure SetScrollWidth(const Value: Integer);
{$ENDIF}
{$IFDEF VCL}
    procedure WMGetDlgCode(var Message: TWMGetDlgCode); message WM_GETDLGCODE;
    procedure WMKillFocus(var Message: TWMKillFocus); message WM_KILLFOCUS;
    procedure WMNCCalcSize(var Message: TWMNCCalcSize); message WM_NCCALCSIZE;
    procedure WMNCPaint(var Message: TMessage); message WM_NCPAINT;
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SETFOCUS;
    procedure WMWindowPosChanged(var Message: TWMWindowPosChanged); message WM_WINDOWPOSCHANGED;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
{$ENDIF}
{$IFDEF MSWINDOWS}
  {$IFNDEF VCL}
    function GetStyle: TListBoxStyle;
    procedure SetStyle(Value: TListBoxStyle);
  {$ENDIF}
{$ENDIF}
  protected
    FContainer: TcxContainer;
    procedure Click; override;
    procedure DblClick; override;
    function DoMouseWheel(Shift: TShiftState; WheelDelta: Integer;
      {$IFNDEF VCL}const{$ENDIF} MousePos: TPoint): Boolean; override;
    procedure DragOver(Source: TObject; X, Y: Integer; State: TDragState;
      var Accept: Boolean); override;
    function GetPopupMenu: TPopupMenu; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure KeyUp(var Key: Word; Shift: TShiftState); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseEnter(AControl: TControl); {$IFDEF VCL}dynamic{$ELSE}override{$ENDIF};
    procedure MouseLeave(AControl: TControl); {$IFDEF VCL}dynamic{$ELSE}override{$ENDIF};
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
{$IFDEF VCL}
    procedure WndProc(var Message: TMessage); override;
    function GetSizeGripRect: TRect;
    procedure LockScrollBarsUpdate(ALock: Boolean);
    procedure SetExternalScrollBarsParameters;
{$ELSE}
    function EventFilter(Sender: QObjectH; Event: QEventH): Boolean; override;
    procedure InitWidget; override;
{$ENDIF}
    property Container: TcxContainer read FContainer;
    property LookAndFeel: TcxLookAndFeel read FLookAndFeel write SetLookAndFeel;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure DragDrop(Source: TObject; X, Y: Integer); override;
{$IFNDEF DELPHI6}
    procedure AddItem(AItem: string; AObject: TObject);
    procedure ClearSelection;
    procedure DeleteSelected;
    procedure SelectAll;
{$ENDIF}
{$IFDEF VCL}
    function ItemVisible(Index: Integer): Boolean;
{$ELSE}
    procedure AddItem(AItem: string; AObject: TObject);
    procedure DeleteSelected;
    procedure SelectAll;
{$ENDIF}
    property Canvas: TcxCanvas read FCanvas;
    property HScrollBar: TcxScrollBar read FHScrollBar;
    property VScrollBar: TcxScrollBar read FVScrollBar;
{$IFNDEF DELPHI6}
    property ScrollWidth: Integer read GetScrollWidth write SetScrollWidth default 0;
{$ENDIF}
  published
{$IFDEF MSWINDOWS}
  {$IFNDEF VCL}
    property Style: TListBoxStyle read GetStyle write SetStyle default lbStandard;
  {$ENDIF}
{$ENDIF}
  end;

  TcxCustomListBox = TcxCustomInnerListBox; // TODO Remove

{$IFDEF VCL}
  TGetScrollBarInfo = function(hwnd: HWND; idObject: Longint;
    var psbi: TScrollBarInfo): BOOL; cdecl{$IFDEF MSWINDOWS} stdcall{$ENDIF};
{$ENDIF}

function ButtonTocxButton(Button: TMouseButton): TcxMouseButton;
function CheckParentsNativeHandle(AControl: TWinControl; ANativeHandle: TcxNativeHandle): Boolean;
function cxContainerStyleValuesToStr(const AStyleValues: TcxContainerStyleValues;
  AStyle: TcxContainerStyle): string;
procedure DrawContainerShadow(ACanvas: TcxCanvas; const ARect: TRect);
procedure ExtendRect(var Rect: TRect; const AExtension: TRect);
function GetControlRect(AControl: TControl): TRect;
function GetInnerControlContainer(AObject: TObject): TObject;
function HasHandle(AControl: TWinControl; AHandle: TcxHandle): Boolean;
function HasNativeHandle(AControl: TWinControl; ANativeHandle: TcxNativeHandle): Boolean;
function InternalCompareString(const S1, S2: TCaption; ACaseSensitive: Boolean): Boolean;
function InternalGetCursorPos: TPoint;
function InternalGetShiftState: TShiftState;
procedure InternalInvalidate(AHandle: TcxHandle; const AOuterRect, AInternalRect: TRect;
  AEraseBackground: Boolean = False);
procedure InternalInvalidateRect(AControl: TWinControl; const R: TRect;
  AEraseBackground: Boolean);
function InternalIsWindowVisible(AControl: TWinControl): Boolean;
function IsChildWindow(AParent: TWinControl; AChildHandle: TcxNativeHandle): Boolean;
function MouseButtonToShift(Button: TMouseButton): TShiftState;
function NativeHandle(Handle: TcxHandle): TcxNativeHandle;
function ScreenCanvas: TcxScreenCanvas;
procedure SetWindowRegion(AControl: TWinControl; PR: PRect);
procedure SetWindowShadowRegion(AWindowHandle: TcxHandle; const AOuterRect, AInnerRect: TRect;
  R: TRect; {$IFDEF VCL}ANativeStyle: Boolean; {$ENDIF} AShadow: Boolean; APExcludeRect: PRect = nil);
function UsecxScrollBars: Boolean;
{$IFDEF VCL}
function AreVisualStylesMustBeUsed(ANativeStyle: Boolean; AThemedObjectType:
  TdxThemedObjectType): Boolean;
function GetSizeGripRect(AControl: IcxContainerInnerControl): TRect;
{$ELSE}
function RectVisible(APainter: QPainterH; const R: TRect): Boolean;
{$ENDIF}

var
  cxContainerShadowColor: TColor = clBtnShadow;
{$IFDEF VCL}
  GetScrollBarInfoProc: TGetScrollBarInfo = nil;
{$ENDIF}

implementation

{$IFDEF DELPHI6}
uses
  Variants;
{$ENDIF}

{$IFNDEF VCL}
type
  { TcxObjectEventFilter }

  TcxObjectEventFilter = class
  private
    FObjectHook: QObject_hookH;
    function ObjectHookProc(Sender: QObjectH; Event: QEventH): Boolean; cdecl;
  public
    constructor Create(AObject: QObjectH);
    destructor Destroy; override;
  end;
{$ENDIF}

var
  FBeingShownPopupWindow: TcxPopupWindow;
  FPopupWindowShowing: Boolean = False;
  FScreenCanvas: TcxScreenCanvas;
  FShiftState: TShiftState;
  FVisiblePopupWindowList: TList;
{$IFDEF MSWINDOWS}
  FApplicationCallWndProcHook: HHOOK = 0;
  FApplicationGetMessageMsgHook: HHOOK = 0;
  FApplicationMouseMsgHook: HHOOK = 0;
  FCaptionInactivationLocked: Boolean;
  FOldWndProc: Pointer;
  {$IFNDEF VCL}
  FIsApplicationDeactivationLocked: Boolean;
  {$ENDIF}
{$ENDIF}
{$IFDEF LINUX}
  FDblClickLocked: Boolean = False;
{$ENDIF}
{$IFNDEF VCL}
  FObjectEventFilter: TcxObjectEventFilter;
{$ENDIF}

type
  TCustomFormAccess = class(TCustomForm);
  TcxControlAccess = class(TcxControl);
  TcxRegionAccess = class(TcxRegion);

function ButtonTocxButton(Button: TMouseButton): TcxMouseButton;
const
  AButtonMap: array[TMouseButton] of TcxMouseButton = (cxmbLeft, cxmbRight, cxmbMiddle);
begin
  Result := AButtonMap[Button];
end;

function CheckParentsNativeHandle(AControl: TWinControl;
  ANativeHandle: TcxNativeHandle): Boolean;
var
  AParentForm: TCustomForm;
{$IFDEF VCL}
  AParentHandle, AParentHandle1: HWND;
{$ENDIF}
begin
  Result := False;
  if AControl = nil then
    Exit;
  AParentForm := GetParentForm(AControl);
  if AParentForm = nil then
    Exit;
  Result := HasNativeHandle(AParentForm, ANativeHandle) or IsChildWindow(AParentForm, ANativeHandle);
{$IFDEF VCL}
  if not Result and (AParentForm.Parent = nil) then
  begin
    AParentHandle := AParentForm.Handle;
    repeat
      AParentHandle1 := GetParent(AParentHandle);
      if (AParentHandle1 = 0) or not IsChild(AParentHandle1, AParentHandle) then
        Break;
      AParentHandle := AParentHandle1;
    until False;
    if AParentHandle <> AParentForm.Handle then
      Result := (AParentHandle = ANativeHandle) or IsChild(AParentHandle, ANativeHandle);
  end;
{$ENDIF}
end;

function cxContainerStyleValuesToStr(const AStyleValues: TcxContainerStyleValues;
  AStyle: TcxContainerStyle): string;
var
  AStyleValue: TcxContainerStyleValue;
  AStyleValueName: string;
  AStyleValueNameList: TStringList;
  I: Integer;
begin
  AStyleValueNameList := TStringList.Create;
  try
    for AStyleValue := 0 to AStyle.GetStyleValueCount - 1 do
      if AStyleValue in AStyleValues then
      begin
        AStyle.GetStyleValueName(AStyleValue, AStyleValueName);
        AStyleValueNameList.Add(AStyleValueName);
      end;
    AStyleValueNameList.Sort;
    Result := '';
    for I := 0 to AStyleValueNameList.Count - 1 do
    begin
      if Result <> '' then
        Result := Result + ',';
      Result := Result + AStyleValueNameList[I];
    end;
    Result := '[' + Result + ']';
  finally
    AStyleValueNameList.Free;
  end;
end;

procedure DrawContainerShadow(ACanvas: TcxCanvas; const ARect: TRect);
var
  R: TRect;
begin
  with ACanvas do
  begin
    Brush.Color := cxContainerShadowColor;
    with R do
    begin
      Left := ARect.Left + cxContainerShadowWidth;
      Top := ARect.Bottom;
      Right := ARect.Right;
      Bottom := Top + cxContainerShadowWidth;
      FillRect(R);
      Left := ARect.Left;
      ExcludeClipRect(R);

      Left := ARect.Right;
      Top := ARect.Top + cxContainerShadowWidth;
      Right := Left + cxContainerShadowWidth;
      Bottom := ARect.Bottom + cxContainerShadowWidth;
      FillRect(R);
      Top := ARect.Top;
      ExcludeClipRect(R);
    end;
  end;
end;

procedure ExtendRect(var Rect: TRect; const AExtension: TRect);
begin
  with AExtension do
  begin
    Inc(Rect.Left, Left);
    Inc(Rect.Top, Top);
    Dec(Rect.Right, Right);
    Dec(Rect.Bottom, Bottom);
  end;
end;

function GetControlRect(AControl: TControl): TRect;
begin
  with AControl do
    Result := Rect(0, 0, Width, Height);
end;

function GetInnerControlContainer(AObject: TObject): TObject;
var
  AContainerInnerControl: IcxContainerInnerControl;
begin
  Result := AObject;
  if Result.GetInterface(IcxContainerInnerControl, AContainerInnerControl) then
    Result := AContainerInnerControl.ControlContainer;
end;

function HasHandle(AControl: TWinControl; AHandle: TcxHandle): Boolean;
begin
  Result := HasNativeHandle(AControl, NativeHandle(AHandle));
end;

function HasNativeHandle(AControl: TWinControl; ANativeHandle: TcxNativeHandle): Boolean;
begin
  if AControl <> nil then
  begin
{$IFDEF VCL}
    Result := AControl.Handle = ANativeHandle;
{$ELSE}
    Result := NativeHandle(AControl.Handle) = ANativeHandle;
    Result := Result or (NativeHandle(AControl.ChildHandle) = ANativeHandle);
{$ENDIF}
  end
  else
    Result := False;
end;

function InternalCompareString(const S1, S2: TCaption; ACaseSensitive: Boolean): Boolean;
begin
{$IFDEF VCL}
  if ACaseSensitive then
    Result := AnsiCompareStr(S1, S2) = 0
  else
    Result := AnsiUpperCase(S1) = AnsiUpperCase(S2);
{$ELSE}
  if ACaseSensitive then
    Result := WideSameStr(S1, S2)
  else
    Result := WideSameText(S1, S2);
{$ENDIF}
end;

procedure InternalFillRect(ACanvas: TcxCanvas; const AOuterRect, AInternalRect: TRect;
  AColor: TColor);
begin
  if IsRectEmpty(AOuterRect) or EqualRect(AOuterRect, AInternalRect) then
    Exit;
  with ACanvas do
  begin
    Brush.Color := AColor;
    if IsRectEmpty(AInternalRect) then
      FillRect(AOuterRect)
    else
    begin
      FillRect(Rect(AOuterRect.Left, AOuterRect.Top,
        AInternalRect.Left, AOuterRect.Bottom));
      FillRect(Rect(AInternalRect.Left, AOuterRect.Top,
        AInternalRect.Right, AInternalRect.Top));
      FillRect(Rect(AInternalRect.Right, AOuterRect.Top,
        AOuterRect.Right, AOuterRect.Bottom));
      FillRect(Rect(AInternalRect.Left, AInternalRect.Bottom,
        AInternalRect.Right, AOuterRect.Bottom));
    end;
  end;
end;

function InternalGetCursorPos: TPoint;
begin
{$IFDEF VCL}
  GetCursorPos(Result);
{$ELSE}
  QCursor_pos(@Result);
{$ENDIF}
end;

function InternalGetShiftState: TShiftState;
{$IFDEF VCL}
var
  AKeyState: TKeyBoardState;
{$ENDIF}
begin
{$IFDEF VCL}
  GetKeyboardState(AKeyState);
  Result := KeyboardStateToShiftState(AKeyState);
{$ELSE}
  Result := FShiftState;
{$ENDIF}
end;

procedure InternalInvalidate(AHandle: TcxHandle; const AOuterRect, AInternalRect: TRect;
  AEraseBackground: Boolean = False);

  procedure InternalInvalidateRect(const R: TRect);
  begin
{$IFDEF VCL}
    InvalidateRect(AHandle, @R, AEraseBackground);
{$ELSE}
    QWidget_update(AHandle, @R); // TODO
{$ENDIF}
  end;

begin
  if IsRectEmpty(AInternalRect) then
    InternalInvalidateRect(AOuterRect)
  else
  begin
    InternalInvalidateRect(Rect(AOuterRect.Left, AOuterRect.Top, AInternalRect.Left,
      AOuterRect.Bottom));
    InternalInvalidateRect(Rect(AInternalRect.Left, AOuterRect.Top, AInternalRect.Right,
      AInternalRect.Top));
    InternalInvalidateRect(Rect(AInternalRect.Right, AOuterRect.Top, AOuterRect.Right,
      AOuterRect.Bottom));
    InternalInvalidateRect(Rect(AInternalRect.Left, AInternalRect.Bottom, AInternalRect.Right,
        AOuterRect.Bottom));
  end;
end;

procedure InternalInvalidateRect(AControl: TWinControl; const R: TRect;
  AEraseBackground: Boolean);
begin
  with AControl do
{$IFDEF VCL}
    if HandleAllocated then
      Windows.InvalidateRect(Handle, @R, AEraseBackground);
{$ELSE}
    InvalidateRect(R, AEraseBackground);
{$ENDIF}
end;

function InternalIsWindowVisible(AControl: TWinControl): Boolean;
begin
  with AControl do
  begin
    Result := HandleAllocated;
{$IFDEF VCL}
    Result := Result and IsWindowVisible(Handle);
{$ELSE}
    Result := Result and QWidget_isVisible(Handle);
{$ENDIF}
  end;
end;

function IsChildWindow(AParent: TWinControl; AChildHandle: TcxNativeHandle): Boolean;

{$IFDEF MSWINDOWS}
  function InternalNativeIsChildWindow(AParent: TWinControl): Boolean;
  begin
    Result := IsChild(NativeHandle(AParent.Handle), AChildHandle);
  {$IFNDEF VCL}
    Result := Result or IsChild(NativeHandle(AParent.ChildHandle), AChildHandle);
  {$ENDIF}
  end;
{$ENDIF}
{$IFDEF LINUX}
  function InternalNativeIsChildWindow(AParent: TWinControl): Boolean;
  var
    AParentHandle: QWidgetH;
  begin
    AParentHandle := AChildHandle;
    repeat
      AParentHandle := QWidget_parentWidget(AParentHandle);
    until (AParentHandle = nil) or HasNativeHandle(AParent, AParentHandle);
    Result := HasNativeHandle(AParent, AParentHandle);
  end;
{$ENDIF}

  function InternalIsChildWindow(AParent: TWinControl): Boolean;
  var
    I: Integer;
    APopupWindow: TcxCustomPopupWindow;
  begin
    with AParent do
      for I := 0 to ControlCount - 1 do
        if Controls[I] is TWinControl then
        begin
          if HasNativeHandle(TWinControl(Controls[I]), AChildHandle) then
          begin
            Result := True;
            Exit;
          end else
          begin
            Result := InternalIsChildWindow(TWinControl(Controls[I]));
            if Result then
              Exit;
          end;
          Result := InternalNativeIsChildWindow(TWinControl(Controls[I]));
          if Result then
            Exit;
        end;
    if AParent is TcxCustomPopupWindow then
      for I := 0 to FVisiblePopupWindowList.Count - 1 do
      begin
        APopupWindow := FVisiblePopupWindowList[I];
        if (APopupWindow = AParent) or (GetParentForm(APopupWindow.OwnerControl) <> AParent) then
          Continue;
        if HasNativeHandle(APopupWindow, AChildHandle) then
        begin
          Result := True;
          Exit;
        end else
        begin
          Result := InternalIsChildWindow(APopupWindow);
          if Result then Exit;
        end;
      end;
    Result := False;
  end;

begin
  Result := False;
  if (AParent = nil){$IFDEF MSWINDOWS} or (AChildHandle = 0){$ENDIF}{$IFDEF LINUX} or
      (AChildHandle = nil){$ENDIF} or
    HasNativeHandle(AParent, AChildHandle) then
      Exit;
  Result := InternalNativeIsChildWindow(AParent);
  if not Result then
    Result := InternalIsChildWindow(AParent);
end;

function MouseButtonToShift(Button: TMouseButton): TShiftState;
begin
  case Button of
    mbLeft:
      Result := [ssLeft];
    mbMiddle:
      Result := [ssMiddle];
    mbRight:
      Result := [ssRight];
  end;
end;

function NativeHandle(Handle: TcxHandle): TcxNativeHandle;
begin
{$IFDEF MSWINDOWS}
  {$IFDEF VCL}
  Result := Handle;
  {$ELSE}
  Result := QWidget_winId(Handle);
  {$ENDIF}
{$ENDIF}
{$IFDEF LINUX}
  Result := Handle;
{$ENDIF}
end;

function ScreenCanvas: TcxScreenCanvas;
begin
  Result := FScreenCanvas;
end;

{$IFDEF VCL}
procedure SetGetScrollBarInfoProc;
var
  ALibrary: HMODULE;
begin
  ALibrary := LoadLibrary('User32.dll');
  @GetScrollBarInfoProc := GetProcAddress(ALibrary, 'GetScrollBarInfo');
  FreeLibrary(ALibrary);
end;
{$ENDIF}

procedure SetWindowRegion(AControl: TWinControl; PR: PRect);
{$IFNDEF VCL}
var
  ARgn: QRegionH;
{$ENDIF}
begin
{$IFDEF VCL}
  if PR = nil then
    Windows.SetWindowRgn(AControl.Handle, 0, False)
  else
    Windows.SetWindowRgn(AControl.Handle, CreateRectRgnIndirect(PR^), False);
{$ELSE}
  if PR = nil then
    QWidget_clearMask(AControl.Handle)
  else
  begin
    if IsRectEmpty(PR^) then
    begin
      ARgn := QRegion_create(-1, -1, 0, 0, QRegionRegionType_Rectangle);
      QWidget_setMask(AControl.Handle, ARgn);
    end else
    begin
      ARgn := QRegion_create(PR, QRegionRegionType_Rectangle);
      QWidget_setMask(AControl.Handle, ARgn);
    end;
    QRegion_destroy(ARgn);
  end;
{$ENDIF}
end;

procedure SetWindowShadowRegion(AWindowHandle: TcxHandle; const AOuterRect, AInnerRect: TRect;
  R: TRect; {$IFDEF VCL}ANativeStyle: Boolean; {$ENDIF}AShadow: Boolean; APExcludeRect: PRect = nil);
var
  AWindowRegion, ATempRegion: {$IFDEF VCL}HRGN{$ELSE}QRegionH{$ENDIF};
{$IFDEF VCL}
  ARgnChanged: Boolean;
  ARgnType: Integer;
{$ENDIF}
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
      OffsetRect(R, cxContainerShadowWidth, cxContainerShadowWidth);
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
  ATempRegion := CreateRectRgn(0, 0, 0, 0);
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
end;

function UsecxScrollBars: Boolean;
begin
{$IFDEF VCL}
  Result := Assigned(GetScrollBarInfoProc);
{$ELSE}
  Result := False;
{$ENDIF}
end;

{$IFDEF VCL}
function AreVisualStylesMustBeUsed(ANativeStyle: Boolean; AThemedObjectType: TdxThemedObjectType): Boolean;
begin
  Result := ANativeStyle and (OpenTheme(AThemedObjectType) <> 0);
end;

function GetSizeGripRect(AControl: IcxContainerInnerControl): TRect;
var
  R: TRect;
begin
  with AControl.ControlContainer do
    if HScrollBar.Visible and VScrollBar.Visible then
    begin
      Result.TopLeft := ClientToScreen(Point(VScrollBar.Left, HScrollBar.Top));
      GetWindowRect(AControl.Control.Handle, R);
      Dec(Result.Left, R.Left);
      Dec(Result.Top, R.Top);
      Result.Right := Result.Left + VScrollBar.Width;
      Result.Bottom := Result.Top + HScrollBar.Height;
    end
    else
      FillChar(Result, SizeOf(Result), 0);
end;
{$ELSE}
function RectVisible(APainter: QPainterH; const R: TRect): Boolean;
begin
  Result := not QPainter_hasClipping(APainter);
  if not Result then
    Result := QRegion_contains(QPainter_clipRegion(APainter), PRect(@R));
end;
{$ENDIF}

{ TcxFreeNotificator }

procedure TcxFreeNotificator.AddSender(ASender: TComponent);
begin
  if ASender <> nil then
    ASender.FreeNotification(Self);
end;

procedure TcxFreeNotificator.RemoveSender(ASender: TComponent);
begin
{$IFDEF DELPHI5}
  if ASender <> nil then
    ASender.RemoveFreeNotification(Self);
{$ENDIF}
end;

procedure TcxFreeNotificator.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and Assigned(FOnFreeNotification) then
    FOnFreeNotification(AComponent);
end;

{ TcxContainerViewInfo }

constructor TcxContainerViewInfo.Create;
begin
end;

procedure TcxContainerViewInfo.Assign(Source: TObject);
begin
  if Source is TcxContainerViewInfo then
    with Source as TcxContainerViewInfo do
      Self.ClientRect := ClientRect;
end;

function TcxContainerViewInfo.GetUpdateRegion(AViewInfo: TcxContainerViewInfo): TcxRegion;
begin
  Result := TcxRegion.Create;
end;

procedure TcxContainerViewInfo.Offset(DX, DY: Integer);
begin
  OffsetRect(BorderRect, DX, DY);
  OffsetRect(Bounds, DX, DY);
  OffsetRect(ClientRect, DX, DY);
end;

procedure TcxContainerViewInfo.Paint(ACanvas: TcxCanvas);
begin
{$IFNDEF VCL}
  ACanvas.Canvas.Start;
  try
{$ENDIF}
    InternalPaint(ACanvas);
{$IFNDEF VCL}
  finally
    ACanvas.Canvas.Stop;
  end;
{$ENDIF}
end;

procedure TcxContainerViewInfo.InternalPaint(ACanvas: TcxCanvas);

  procedure DrawBackground;
  var
    R, R1: TRect;
  begin
    R := BorderRect;
    Dec(R.Left, BorderWidth);
    Dec(R.Top, BorderWidth);
    if bRight in Edges then Inc(R.Right, BorderWidth);
    if bBottom in Edges then Inc(R.Bottom, BorderWidth);
    if Shadow then
      DrawContainerShadow(ACanvas, R);
    if not(bRight in Edges) then Inc(R.Right, BorderWidth);
    if not(bBottom in Edges) then Inc(R.Bottom, BorderWidth);
    if BorderStyle <> cbsNone then
    begin
      R1 := R;
      case BorderStyle of
        cbsSingle, cbsThick:
          ACanvas.FrameRect(R1, BorderColor, BorderWidth);
        cbsFlat:
          begin
            ACanvas.DrawEdge(R1, True, True, Edges);
            InflateRect(R1, -1, -1);
            ACanvas.FrameRect(R1, clBtnFace);
          end;
        cbs3D:
          begin
            ACanvas.DrawEdge(R1, True, True, Edges);
            InflateRect(R1, -1, -1);
            ACanvas.DrawComplexFrame(R1, {$IFDEF VCL}cl3DDkShadow{$ELSE}clShadow{$ENDIF}, cl3DLight, Edges);
          end;
      end;
    end;
    with ACanvas do
    begin
      Brush.Color := BackgroundColor;
      FillRect(BorderRect);
    end;
  end;

{$IFDEF VCL}
  procedure DrawNativeStyleBackground;
  var
    ATheme: TTheme;
    R: TRect;
    AColor: COLORREF;
  begin
    ATheme := OpenTheme(ThemedObjectType);
    GetThemeBackgroundContentRect(ATheme, ACanvas.Handle, NativePart, NativeState, @Bounds, R);
    ACanvas.Brush.Color := BackgroundColor;
    ACanvas.FillRect(R);
//    GetThemeColor(ATheme, NativePart, NativeState, TMT_BORDERCOLOR, AColor);
    ATheme := OpenTheme(totComboBox);
    GetThemeColor(ATheme, CP_DROPDOWNBUTTON, CBXS_NORMAL, TMT_BORDERCOLOR, AColor);
    InternalFillRect(ACanvas, Bounds, R, AColor);
  end;
{$ENDIF}

begin
{$IFDEF VCL}
  if NativeStyle then
    DrawNativeStyleBackground
  else
{$ENDIF}
  DrawBackground;
end;

procedure TcxContainerViewInfo.SetBackgroundColor(Value: TColor);
begin
  FBackgroundColor := Value;
  BackgroundBrush := cxEmptyBrush;
end;

{ TcxStyleController }

constructor TcxStyleController.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FListeners := TList.Create;
  FStyle := GetStyleClass.Create(Self, False);
  FStyle.OnChanged := StyleChanged;
end;

destructor TcxStyleController.Destroy;
var
  I: Integer;
begin
  for I := 0 to FListeners.Count - 1 do
    TcxContainerStyle(FListeners[I]).ControllerFreeNotification(Self);
  FreeAndNil(FStyle);
  FreeAndNil(FListeners);

  inherited Destroy;
end;

procedure TcxStyleController.BeforeDestruction;
begin
  FIsDestruction := True;
  inherited BeforeDestruction;
end;

procedure TcxStyleController.Loaded;
begin
  inherited Loaded;
  Changed;
end;

procedure TcxStyleController.AddListener(AListener: TcxContainerStyle);
begin
  if (AListener = nil) or (FListeners.IndexOf(AListener) >= 0) then
    Exit;
  FListeners.Add(AListener);
  AListener.LookAndFeel.MasterLookAndFeel := Style.LookAndFeel;
end;

procedure TcxStyleController.Changed;
var
  I: Integer;
begin
  if (Style <> nil) and Assigned(FOnStyleChanged) then
    FOnStyleChanged(Self, Style);
  if not IsDestruction then
    for I := 0 to Listeners.Count - 1 do
      DoStyleChanged(TcxContainerStyle(Listeners[I]));
end;

procedure TcxStyleController.DoStyleChanged(AStyle: TcxContainerStyle);
begin
  AStyle.ControllerChangedNotification(Self);
  if Assigned(FOnStyleChanged) then
    FOnStyleChanged(Self, AStyle);
end;

function TcxStyleController.GetStyleClass: TcxContainerStyleClass;
begin
  Result := TcxContainerStyle;
end;

function TcxStyleController.IsDestruction: Boolean;
begin
  Result := FIsDestruction;
end;

procedure TcxStyleController.RemoveListener(AListener: TcxContainerStyle);
begin
  if (AListener = nil) or (FListeners.IndexOf(AListener) < 0) then
    Exit;
  if not IsDestruction then
    FListeners.Remove(AListener);
  AListener.LookAndFeel.MasterLookAndFeel := nil;
end;

procedure TcxStyleController.SetStyle(Value: TcxContainerStyle);
begin
  FStyle.Assign(Value);
end;

procedure TcxStyleController.StyleChanged(Sender: TObject);
begin
  Changed;
end;

{ TcxContainerStyle }

constructor TcxContainerStyle.Create(AOwner: TPersistent; ADirectAccessMode: Boolean);
begin
  inherited Create;
  FDirectAccessMode := ADirectAccessMode;
  if not FDirectAccessMode then
    CreateFont;
  FOwner := AOwner;
  FLookAndFeel := TcxLookAndFeel.Create(Self);
  FLookAndFeel.OnChanged := LFChanged;
  StyleController := GetDefaultStyleController;
  if FDirectAccessMode then
    FAssignedValues := [csvColor, csvFont];
end;

destructor TcxContainerStyle.Destroy;
begin
  if not FDirectAccessMode then
    FreeAndNil(StyleData.Font);
  if FStyleController <> nil then
    FStyleController.RemoveListener(Self);
  FreeAndNil(FLookAndFeel);
  inherited Destroy;
end;

procedure TcxContainerStyle.Assign(Source: TPersistent);
begin
  if Source is TcxContainerStyle then
  begin
    BeginUpdate;
    try
      with Source as TcxContainerStyle do
      begin
        Self.StyleController := StyleController;
        Self.LookAndFeel := LookAndFeel;

        Self.FBorderColor := FBorderColor;
        Self.FBorderStyle := FBorderStyle;
        Self.FEdges := FEdges;
        Self.FHotTrack := FHotTrack;
        Self.FShadow := FShadow;
        Self.FTransparentBorder := FTransparentBorder;

        Self.StyleData.Color := StyleData.Color;
        Self.StyleData.FontColor := StyleData.FontColor;
        if Self.FDirectAccessMode then
          Self.StyleData.Font := StyleData.Font
        else
          Self.StyleData.Font.Assign(StyleData.Font);
        Self.FAssignedValues := FAssignedValues;
      end;
    finally
      EndUpdate;
    end
  end
  else
    inherited Assign(Source);
end;

procedure TcxContainerStyle.BeforeDestruction;
begin
  FIsDestroying := True;
  inherited BeforeDestruction;
end;

procedure TcxContainerStyle.BeginUpdate;
begin
  Inc(FUpdateCount);
end;

procedure TcxContainerStyle.EndUpdate;
begin
  if FUpdateCount > 0 then
  begin
    Dec(FUpdateCount);
    if FModified then Changed;
  end;
end;

class function TcxContainerStyle.GetDefaultStyleController: TcxStyleController;
begin
  Result := nil;
end;

class function TcxContainerStyle.GetStyleValue(const APropertyName: string;
  out StyleValue: TcxContainerStyleValue): Boolean;
var
  I: TcxContainerStyleValue;
  S: string;
begin
  Result := False;
  for I := 0 to GetStyleValueCount - 1 do
  begin
    GetStyleValueName(I, S);
    if InternalCompareString(S, APropertyName, False) then
    begin
      StyleValue := I;
      Result := True;
      Break;
    end;
  end;
end;

class function TcxContainerStyle.GetStyleValueCount: Integer;
begin
  Result := cxContainerStyleValueCount;
end;

class function TcxContainerStyle.GetStyleValueName(AStyleValue: TcxContainerStyleValue;
  out StyleValueName: string): Boolean;
begin
  Result := AStyleValue < cxContainerStyleValueCount;
  if Result then
    StyleValueName := cxContainerStyleValueNameA[AStyleValue];
end;

procedure TcxContainerStyle.RestoreDefaults;
begin
  BeginUpdate;
  try
    if Container <> nil then
    begin
      Container.ParentColor := False;
      Container.ParentFont := True;
    end;
    LookAndFeel.Reset;
    AssignedValues := [];
  finally
    EndUpdate;
  end;
end;

function TcxContainerStyle.GetOwner: TPersistent;
begin
  Result := FOwner;
end;

function TcxContainerStyle.BaseGetStyleController: TcxStyleController;
begin
  if FStyleController = GetDefaultStyleController then
    Result := nil
  else
    Result := FStyleController;
end;

procedure TcxContainerStyle.BaseSetStyleController(Value: TcxStyleController);

  function CheckStyleController(AStyleController: TcxStyleController): Boolean;
  var
    AOwner: TPersistent;
  begin
    Result := False;
    AOwner := GetOwner;
    while AOwner <> nil do
    begin
      if (AOwner is TcxStyleController) and (AOwner = AStyleController) then
        Exit;
      AOwner := TPersistentAccess(AOwner).GetOwner;
    end;
    Result := True;
  end;

begin
  if Value = nil then
    Value := GetDefaultStyleController;

  if (Value <> nil) and (not CheckStyleController(Value)) then Exit;

  if Value <> FStyleController then
  begin
    if FStyleController <> nil then
      FStyleController.RemoveListener(Self);
    FStyleController := Value;
    if FStyleController <> nil then
      FStyleController.AddListener(Self);
    StyleControllerChanged;
  end;
end;

procedure TcxContainerStyle.Changed;
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

procedure TcxContainerStyle.ControllerChangedNotification(AStyleController: TcxStyleController);
begin
  UpdateFont;
  Changed;
end;

procedure TcxContainerStyle.ControllerFreeNotification(AStyleController: TcxStyleController);
begin
  if (AStyleController <> nil) and (AStyleController = FStyleController) then
    StyleController := nil;
end;

procedure TcxContainerStyle.CreateFont;
begin
  with StyleData do
  begin
    Font := TFont.Create;
    Font.OnChange := FontChanged;
  end;
end;

function TcxContainerStyle.DefaultBorderColor: TColor;
begin
  Result := clWindowFrame;
end;

function TcxContainerStyle.DefaultBorderStyle: TcxContainerBorderStyle;
const
  ABorderStyleA: array [TcxLookAndFeelKind] of TcxContainerBorderStyle =
    (cbsFlat, cbs3D, cbsUltraFlat);
begin
  Result := ABorderStyleA[LookAndFeel.Kind];
end;

function TcxContainerStyle.DefaultColor: TColor;
var
  AContainer: TcxContainer;
begin
  AContainer := Container;
  if (AContainer = nil) or not AContainer.ParentColor or
      (AContainer.Parent = nil) then
    Result := clWindow
  else
    Result := TWinControlAccess(AContainer.Parent).Color;
end;

function TcxContainerStyle.DefaultEdges: TcxBorders;
begin
  Result := [bLeft, bTop, bRight, bBottom];
end;

function TcxContainerStyle.DefaultHotTrack: Boolean;
begin
  Result := True;
end;

function TcxContainerStyle.DefaultShadow: Boolean;
begin
  Result := False;
end;

function TcxContainerStyle.DefaultTransparentBorder: Boolean;
begin
  Result := True;
end;

procedure TcxContainerStyle.FontChanged(Sender: TObject);
begin
  if not FInternalSetting then
    Include(FAssignedValues, csvFont);
  Changed;
end;

function TcxContainerStyle.GetColor: TColor;
var
  AContainer: TcxContainer;
begin
  if FDirectAccessMode then
    Result := StyleData.Color
  else
  begin
    AContainer := Container;
    if (AContainer <> nil) and AContainer.ParentColor and (AContainer.Parent <> nil) then
      Result := TWinControlAccess(AContainer.Parent).Color
    else
      if not InternalGetColor(Result) then
        Result := DefaultColor;
  end;
end;

function TcxContainerStyle.GetInternalColor: TColor;
begin
  if FDirectAccessMode then
    Result := StyleData.Color
  else
    if not InternalGetColor(Result) then
      Result := DefaultColor;
end;

function TcxContainerStyle.InternalGetColor(var Color: TColor): Boolean;
begin
  Result := csvColor in FAssignedValues;
  if Result then
    Color := StyleData.Color
  else
    if FStyleController <> nil then
      Result := FStyleController.Style.InternalGetColor(Color);
end;

function TcxContainerStyle.IsDestroying: Boolean;
begin
  Result := FIsDestroying;
end;

function TcxContainerStyle.IsValueDefined(AValue: TcxContainerStyleValue): Boolean;
var
  ABorderStyle: TcxContainerBorderStyle;
  AColor: TColor;
  AEdges: TcxBorders;
  AFont: TFont;
  ATempBool: Boolean;
begin
  Result := False;
  case AValue of
    csvBorderColor:
      Result := InternalGetBorderColor(AColor);
    csvBorderStyle:
      Result := InternalGetBorderStyle(ABorderStyle);
    csvColor:
      Result := InternalGetColor(AColor);
    csvEdges:
      Result := InternalGetEdges(AEdges);
    csvFont:
      Result := InternalGetFont(AFont);
    csvHotTrack:
      Result := InternalGetHotTrack(ATempBool);
    csvShadow:
      Result := InternalGetShadow(ATempBool);
  end;
end;

procedure TcxContainerStyle.StyleControllerChanged;
begin
  UpdateFont;
  Changed;
end;

procedure TcxContainerStyle.UpdateFont;
var
  AFont: TFont;
begin
  if FDirectAccessMode then
    Exit;
  if not(csvFont in FAssignedValues) and InternalGetFont(AFont) then
  begin
    FInternalSetting := True;
    StyleData.Font.Assign(AFont);
    FInternalSetting := False;
  end;
end;

function TcxContainerStyle.GetAssignedValues: TcxContainerStyleValues;
begin
  if FDirectAccessMode then
    Result := [csvBorderColor..GetStyleValueCount - 1{csvShadow}]
  else
    Result := FAssignedValues;
end;

function TcxContainerStyle.GetBorderColor: TColor;
begin
  if FDirectAccessMode then
    Result := clDefault
  else
    if not InternalGetBorderColor(Result) then
      Result := DefaultBorderColor;
end;

function TcxContainerStyle.GetBorderStyle: TcxContainerBorderStyle;
begin
  if FDirectAccessMode then
    if csvBorderStyle in FAssignedValues then
      Result := FBorderStyle
    else
      Result := DefaultBorderStyle
  else
    if not InternalGetBorderStyle(Result) then
      Result := DefaultBorderStyle;
end;

function TcxContainerStyle.GetEdges: TcxBorders;
begin
  if FDirectAccessMode then
    Result := []
  else
    if not InternalGetEdges(Result) then
      Result := DefaultEdges;
end;

function TcxContainerStyle.GetFont: TFont;
begin
  Result := StyleData.Font;
end;

function TcxContainerStyle.GetHotTrack: Boolean;
begin
  if FDirectAccessMode then
    if csvHotTrack in FAssignedValues then
      Result := FHotTrack
    else
      Result := DefaultHotTrack
  else
    if not InternalGetHotTrack(Result) then
      Result := DefaultHotTrack;
end;

function TcxContainerStyle.GetShadow: Boolean;
begin
  if FDirectAccessMode then
    Result := False
  else
    if not InternalGetShadow(Result) then
      Result := DefaultShadow;
end;

function TcxContainerStyle.GetTransparentBorder: Boolean;
begin
  if FDirectAccessMode then
    Result := True
  else
    if not InternalGetTransparentBorder(Result) then
      Result := DefaultTransparentBorder;
end;

function TcxContainerStyle.InternalGetBorderColor(var BorderColor: TColor): Boolean;
begin
  Result := csvBorderColor in FAssignedValues;
  if Result then
    BorderColor := FBorderColor
  else
    if FStyleController <> nil then
      Result := FStyleController.Style.InternalGetBorderColor(BorderColor);
end;

function TcxContainerStyle.InternalGetBorderStyle(var BorderStyle: TcxContainerBorderStyle): Boolean;
begin
  Result := csvBorderStyle in FAssignedValues;
  if Result then
    BorderStyle := FBorderStyle
  else
    if FStyleController <> nil then
      Result := FStyleController.Style.InternalGetBorderStyle(BorderStyle);
end;

function TcxContainerStyle.InternalGetEdges(var Edges: TcxBorders): Boolean;
begin
  Result := csvEdges in FAssignedValues;
  if Result then
    Edges := FEdges
  else
    if FStyleController <> nil then
      Result := FStyleController.Style.InternalGetEdges(Edges);
end;

function TcxContainerStyle.InternalGetFont(var Font: TFont): Boolean;
begin
  Result := csvFont in FAssignedValues;
  if Result then
    Font := StyleData.Font
  else
    if FStyleController <> nil then
      Result := FStyleController.Style.InternalGetFont(Font);
end;

function TcxContainerStyle.InternalGetHotTrack(var HotTrack: Boolean): Boolean;
begin
  Result := csvHotTrack in FAssignedValues;
  if Result then
    HotTrack := FHotTrack
  else
    if FStyleController <> nil then
      Result := FStyleController.Style.InternalGetHotTrack(HotTrack);
end;

function TcxContainerStyle.InternalGetShadow(var Shadow: Boolean): Boolean;
begin
  Result := csvShadow in FAssignedValues;
  if Result then
    Shadow := FShadow
  else
    if FStyleController <> nil then
      Result := FStyleController.Style.InternalGetShadow(Shadow);
end;

function TcxContainerStyle.InternalGetTransparentBorder(var TransparentBorder: Boolean): Boolean;
begin
  Result := csvTransparentBorder in FAssignedValues;
  if Result then
    TransparentBorder := FTransparentBorder
  else
    if FStyleController <> nil then
      Result := FStyleController.Style.InternalGetTransparentBorder(TransparentBorder);
end;

function TcxContainerStyle.IsBorderColorStored: Boolean;
begin
  Result := (csvBorderColor in FAssignedValues) and ((Container = nil) or
    not(csvBorderColor in Container.GetNotPublishedStyleValues));
end;

function TcxContainerStyle.IsBorderStyleStored: Boolean;
begin
  Result := (csvBorderStyle in FAssignedValues) and ((Container = nil) or
    not(csvBorderStyle in Container.GetNotPublishedStyleValues));
end;

function TcxContainerStyle.IsColorStored: Boolean;
begin
  Result := (csvColor in FAssignedValues) and ((Container = nil) or
    not(csvColor in Container.GetNotPublishedStyleValues));
end;

function TcxContainerStyle.IsEdgesStored: Boolean;
begin
  Result := (csvEdges in FAssignedValues) and ((Container = nil) or
    not(csvEdges in Container.GetNotPublishedStyleValues));
end;

function TcxContainerStyle.IsFontStored: Boolean;
begin
  Result := (csvFont in FAssignedValues) and ((Container = nil) or
    not(csvFont in Container.GetNotPublishedStyleValues));
end;

function TcxContainerStyle.IsHotTrackStored: Boolean;
begin
  Result := (csvHotTrack in FAssignedValues) and ((Container = nil) or
    not(csvHotTrack in Container.GetNotPublishedStyleValues));
end;

function TcxContainerStyle.IsShadowStored: Boolean;
begin
  Result := (csvShadow in FAssignedValues) and ((Container = nil) or
    not(csvShadow in Container.GetNotPublishedStyleValues));
end;

function TcxContainerStyle.IsTransparentBorderStored: Boolean;
begin
  Result := (csvTransparentBorder in FAssignedValues) and ((Container = nil) or
    not(csvTransparentBorder in Container.GetNotPublishedStyleValues));
end;

procedure TcxContainerStyle.SetAssignedValues(Value: TcxContainerStyleValues);
begin
  if FAssignedValues <> Value then
  begin
    FAssignedValues := Value;
    UpdateFont;
    Changed;
  end;
end;

procedure TcxContainerStyle.SetBorderColor(Value: TColor);
begin
  if (csvBorderColor in FAssignedValues) and (Value = FBorderColor) then
    Exit;
  FBorderColor := Value;
  Include(FAssignedValues, csvBorderColor);
  Changed;
end;

procedure TcxContainerStyle.SetBorderStyle(Value: TcxContainerBorderStyle);
begin
  if (csvBorderStyle in FAssignedValues) and (Value = FBorderStyle) then
    Exit;
  FBorderStyle := Value;
  Include(FAssignedValues, csvBorderStyle);
  Changed;
end;

procedure TcxContainerStyle.SetColor(Value: TColor);
begin
  if (csvColor in FAssignedValues) and (Value = StyleData.Color) then
    Exit;
  StyleData.Color := Value;
  Include(FAssignedValues, csvColor);
  Changed;
end;

procedure TcxContainerStyle.SetEdges(Value: TcxBorders);
begin
  if (csvEdges in FAssignedValues) and (Value = FEdges) then
    Exit;
  FEdges := Value;
  Include(FAssignedValues, csvEdges);
  Changed;
end;

procedure TcxContainerStyle.SetFont(Value: TFont);
begin
  if FDirectAccessMode then
    StyleData.Font := Value
  else
  begin
    StyleData.Font.Assign(Value);
    Include(FAssignedValues, csvFont);
    Changed;
  end;
end;

procedure TcxContainerStyle.SetHotTrack(Value: Boolean);
begin
  if (csvHotTrack in FAssignedValues) and (Value = FHotTrack) then
    Exit;
  FHotTrack := Value;
  Include(FAssignedValues, csvHotTrack);
  Changed;
end;

procedure TcxContainerStyle.SetShadow(Value: Boolean);
begin
  if (csvShadow in FAssignedValues) and (Value = FShadow) then
    Exit;
  FShadow := Value;
  Include(FAssignedValues, csvShadow);
  Changed;
end;

procedure TcxContainerStyle.SetTransparentBorder(Value: Boolean);
begin
  if (csvTransparentBorder in FAssignedValues) and (Value = FTransparentBorder) then
    Exit;
  FTransparentBorder := Value;
  Include(FAssignedValues, csvTransparentBorder);
  Changed;
end;

function TcxContainerStyle.GetContainer: TcxContainer;
begin
  if FOwner is TcxContainer then
    Result := TcxContainer(FOwner)
  else
    Result := nil;
end;

procedure TcxContainerStyle.LFChanged(Sender: TcxLookAndFeel; AChangedValues: TcxLookAndFeelValues);
begin
  Changed;
end;

procedure TcxContainerStyle.SetLookAndFeel(Value: TcxLookAndFeel);
begin
  FLookAndFeel.Assign(Value);
end;

{ TcxContainerMouseTrackingHelper }

constructor TcxContainerMouseTrackingHelper.Create(AOwner: TcxContainer);
begin
  inherited Create;
  FOwner := AOwner;
end;

procedure TcxContainerMouseTrackingHelper.MouseLeave;
begin
{$IFDEF VCL}
  cxControls.EndMouseTracking(FOwner);
{$ELSE}
  QcxControls.EndMouseTracking(FOwner);
{$ENDIF}
  FOwner.EndMouseTracking;
end;

{ TcxContainer }

constructor TcxContainer.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FIsCreating := True;
  FMouseTrackingHelper := TcxContainerMouseTrackingHelper.Create(Self);
  FStyle := GetStyleClass.Create(Self, IsStyleInDirectAccessMode);
  FStyle.OnChanged := ContainerStyleChanged;
  FViewInfo := GetViewInfoClass.Create;
  LookAndFeel.MasterLookAndFeel := FStyle.LookAndFeel;

  ControlStyle := ControlStyle + [csSetCaption, csCaptureMouse];
  TabStop := True;
  ParentColor := False;
{$IFDEF VCL}
  Color := clWindow;
{$ENDIF}

{$IFDEF VCL}
  FThemeChangedNotificator := TdxThemeChangedNotificator.Create;
  FThemeChangedNotificator.OnThemeChanged := ThemeChanged;
{$ENDIF}

  FIsCreating := False;
end;

destructor TcxContainer.Destroy;
begin
{$IFDEF VCL}
  FreeAndNil(FThemeChangedNotificator);
{$ENDIF}
  FreeAndNil(FViewInfo);
  FStyle.OnChanged := nil;
  FreeAndNil(FStyle);
  FreeAndNil(FMouseTrackingHelper);
  inherited Destroy;
end;

procedure TcxContainer.BeforeDestruction;
begin
{$IFDEF VCL}
  cxControls.EndMouseTracking(Self);
{$ELSE}
  QcxControls.EndMouseTracking(Self);
{$ENDIF}
  FIsDestroying := True;
  inherited BeforeDestruction;
end;

function TcxContainer.Focused: Boolean;
(*{$IFNDEF VCL}
var
  AParentForm: TCustomForm;
{$ENDIF}*)
begin
  if IsDesigning then
    Result := False
  else
  begin
(*{$IFDEF LINUX} // TODO Check
    AParentForm := GetParentForm(Self);
    Result := (AParentForm = nil) or AParentForm.Active;
    if not Result then
      Exit;
{$ENDIF}*)
    Result := {$IFDEF VCL}inherited Focused{$ELSE}HandleAllocated and QWidget_hasFocus(Handle){$ENDIF};
    Result := Result or (InnerControl <> nil) and
      {$IFDEF VCL}InnerControl.Focused{$ELSE}InnerControl.HandleAllocated and QWidget_hasFocus(InnerControl.Handle){$ENDIF};
  end;
end;

{$IFDEF VCL}
procedure TcxContainer.SetFocus;
begin
  if not IsDesigning then
    inherited SetFocus;
end;
{$ENDIF}

class function TcxContainer.GetNotPublishedStyleValues: TcxContainerStyleValues;
begin
  Result := [];
end;

procedure TcxContainer.AdjustClientRect(var Rect: TRect);
begin
  if not IsDestroying then
    Rect := ViewInfo.ClientRect;
end;

procedure TcxContainer.AlignControls(AControl: TControl; var Rect: TRect);
var
  R: TRect;
  PR: PRect;
begin
  if IsAlignControlsLocked or IsInternalControl(AControl) then // ??? !!!
    Exit;
  if AControl = nil then
    inherited AlignControls(AControl, Rect);
  if FIsCreating or (AControl = nil) then
    Exit;
  if (AControl is TWinControl) and TWinControl(AControl).HandleAllocated then
  begin
    PR := @R;
    GetChildControlBounds(Rect, AControl, PR);
    if IsChildControlRegionChanged(TWinControl(AControl), PR) then
    begin
      SetWindowRegion(TWinControl(AControl), PR);
      SaveChildControlRegion(TWinControl(AControl), PR);
    end;
  end;
end;

function TcxContainer.CanFocusOnClick: Boolean;
begin
  Result := not((FInnerControl <> nil) and FInnerControl.HandleAllocated and
    FInnerControl.Focused or InnerControlMouseDown);
end;

procedure TcxContainer.ColorChanged;
begin
  if not FInternalSetting then
    Style.Color := Color
  else
  begin
    inherited ColorChanged;
    ShortRefreshContainer(False);
  end;
end;

procedure TcxContainer.CursorChanged;
begin
  inherited CursorChanged;
  if FInnerControl <> nil then
  begin
    FInnerControl.Cursor := Cursor;
{$IFNDEF VCL}
    if HandleAllocated then
      QWidget_setCursor(Handle, Screen.Cursors[crArrow]);
{$ENDIF}
  end;
end;

procedure TcxContainer.FontChanged;
begin
  if not FInternalSetting then
  begin
    Canvas.Font := Font;
    Style.Font := Font;
    Exclude(Style.FAssignedValues, csvFont);
  end else
  begin
    Canvas.Font.Assign(Font);
    inherited FontChanged;
    SetSize;
    SetScrollBarsParameters;
    if not HandleAllocated then
      Exit;
    ShortRefreshContainer(False);
    if FInnerControl <> nil then
      TWinControlAccess(FInnerControl).Font := Font;
  end;
end;

procedure TcxContainer.FocusChanged;
begin
  inherited FocusChanged;
  ShortRefreshContainer(False);
end;

function TcxContainer.GetClientBounds: TRect;
begin
  Result := ViewInfo.ClientRect;
end;

procedure TcxContainer.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited KeyDown(Key, Shift);
  case Key of
    VK_TAB{$IFNDEF VCL}, Key_Backtab{$ENDIF}:
      if Focused and (Shift * [ssAlt, ssCtrl] = []) and not TabsNeeded then
      begin
        Key := 0;
        TWinControlAccess(GetParentForm(Self)).SelectNext(Self, not(ssShift in Shift), True);
        if HandleAllocated and (InnerControl <> nil) then
{$IFDEF VCL}
          if GetFocus = Handle then
{$ELSE}
          if QApplication_focusWidget(Application.Handle) = ChildHandle then
{$ENDIF}
            InnerControl.SetFocus;
      end;
  end;
end;

procedure TcxContainer.Loaded;
begin
  inherited Loaded;
  ContainerStyleChanged(Style);
end;

function TcxContainer.MayFocus: Boolean;
begin
  Result := not((InnerControl <> nil) and InnerControl.Focused);
end;

procedure TcxContainer.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited MouseDown(Button, Shift, X, Y);
  FShiftState := Shift;
{$IFNDEF VCL}
  FShiftState := FShiftState + MouseButtonToShift(Button);
{$ENDIF}
  RefreshContainer(Point(X, Y), ButtonTocxButton(Button), InternalGetShiftState, True);
end;

procedure TcxContainer.MouseEnter(AControl: TControl);
begin
  inherited MouseEnter(AControl);
  ShortRefreshContainer(True);
  BeginMouseTracking(Self, VisibleBounds, Self);
end;

procedure TcxContainer.MouseLeave(AControl: TControl);
begin
  inherited MouseLeave(AControl);
  FShiftState := [];
  ShortRefreshContainer(True);
{$IFDEF VCL}
  cxControls.EndMouseTracking(Self);
{$ELSE}
  QcxControls.EndMouseTracking(Self);
{$ENDIF}
end;

procedure TcxContainer.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseMove(Shift, X, Y);
{$IFNDEF VCL}
  FShiftState := Shift;
{$ENDIF}
  RefreshContainer(Point(X, Y), cxmbNone, Shift, True);
  BeginMouseTracking(Self, VisibleBounds, Self);
end;

procedure TcxContainer.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited MouseUp(Button, Shift, X, Y);
  FShiftState := Shift;
{$IFNDEF VCL}
  FShiftState := FShiftState - MouseButtonToShift(Button);
{$ENDIF}
  RefreshContainer(Point(X, Y), ButtonTocxButton(Button), InternalGetShiftState, True);
end;

function TcxContainer.NeedsScrollBars: Boolean;
begin
  Result := False;
end;

procedure TcxContainer.Paint;
begin
{$IFNDEF VCL}
  Canvas.Canvas.Start;
  try
{$ENDIF}
    if RectVisible(Canvas.Handle, ViewInfo.Bounds) then
      ViewInfo.Paint(Canvas);
{$IFNDEF VCL}
  finally
    Canvas.Canvas.Stop;
  end;
{$ENDIF}
end;

procedure TcxContainer.Resize;
begin
  inherited Resize;
  if not FIsCreating then
    ShortRefreshContainer(False);
end;

procedure TcxContainer.SetDragMode(Value: TDragMode);
begin
{$IFDEF VCL}
  inherited SetDragMode(Value);
{$ELSE}
  inherited DragMode := Value;
{$ENDIF}
  if InnerControl <> nil then
    TWinControlAccess(InnerControl).DragMode := Value;
end;

{$IFDEF VCL}
procedure TcxContainer.CreateHandle;
begin
  inherited CreateHandle;
  Canvas.Font.Assign(Font);
  ShortRefreshContainer(False);
end;

procedure TcxContainer.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params.WindowClass do
    style := style and not(CS_HREDRAW or CS_VREDRAW);
end;

procedure TcxContainer.WndProc(var Message: TMessage);
begin
  case Message.Msg of
    WM_CHAR, WM_KEYDOWN, WM_KEYUP, CN_CHAR, CN_KEYDOWN, CN_KEYUP:
      if InnerControl <> nil then
      begin
        with TMessage(Message) do
          Result := SendMessage(InnerControl.Handle, Msg, WParam, LParam);
        Exit;
      end;
    WM_SETFOCUS:
      if not Visible then
        Exit;
  end;
  inherited WndProc(Message);
end;
{$ELSE}
procedure TcxContainer.CreateWidget;
begin
  inherited CreateWidget;
  Canvas.Font.Assign(Font);
  ShortRefreshContainer(False);
  if FInnerControl <> nil then
    QApplication_postEvent(Handle, QCustomEvent_create(Integer(QEventType_CMSetContainerCursor)));
end;

function TcxContainer.EventFilter(Sender: QObjectH; Event: QEventH): Boolean;
begin
  case QEvent_type(Event) of
    QEventType_FocusIn, QEventType_FocusOut:
      if InnerControl <> nil then
      begin
        Result := True;
        if QEvent_type(Event) = QEventType_FocusIn then
          InnerControl.SetFocus;
        Exit;
      end;
    QEventType_KeyPress, QEventType_KeyRelease:
      if InnerControl <> nil then
      begin
        QOpenWidget_event(QOPenWidgetH(InnerControl.Handle), Event);
        Result := True;
        Exit;
      end;
    QEventType_MouseButtonRelease:
      begin
        if not PtInRect(ViewInfo.ClientRect, QMouseEvent_pos(QMouseEventH(Event))^) then
          ControlState := ControlState - [csClicked];
      end;
    QEventType_CMSetContainerCursor:
      begin
        QWidget_setCursor(Handle, Screen.Cursors[crArrow]);
        Result := True;
        Exit;
      end;
  end;
  Result := inherited EventFilter(Sender, Event);
end;

procedure TcxContainer.InitWidget;
begin
  inherited InitWidget;
  if InnerControl <> nil then
    QWidget_setFocusProxy(Handle, InnerControl.Handle);
end;

  {$IFDEF WIN32}
procedure TcxContainer.ParentColorChanged;
var
  APrevIsStyleColorAssigned: Boolean;
begin
  APrevIsStyleColorAssigned := csvColor in Style.FAssignedValues;
  inherited ParentColorChanged;
  if not APrevIsStyleColorAssigned or ParentColor then
    Exclude(Style.FAssignedValues, csvColor);
  if Color <> Style.Color then
    ContainerStyleChanged(Style);
end;
  {$ENDIF}
  {$IFDEF LINUX}
procedure TcxContainer.ParentColorChanged;
begin
  inherited ParentColorChanged;
  if ParentColor then
    Exclude(Style.FAssignedValues, csvColor);
end;
  {$ENDIF}
{$ENDIF}

procedure TcxContainer.AdjustInnerControl;
begin
  if FInnerControl <> nil then
    with TWinControlAccess(FInnerControl) do
    begin
      Color := ViewInfo.BackgroundColor;
      Font := Self.Font;
      if Self.Enabled then
        Font.Color := Self.Font.Color
      else
        Font.Color := clBtnShadow;
    end;
end;

procedure TcxContainer.CalculateViewInfo(const P: TPoint; AMouseTracking: Boolean);

  procedure CalculateColorSettings;
{$IFDEF VCL}
  var
    ATheme: TTheme;
    AColor: COLORREF;
{$ENDIF}
  begin
{$IFDEF VCL}
    if ViewInfo.NativeStyle then
    begin
      if Enabled then
        ViewInfo.BackgroundColor := Color
      else
      begin
        ATheme := OpenTheme(ViewInfo.ThemedObjectType);
        GetThemeColor(ATheme, ViewInfo.NativePart, ViewInfo.NativePart,
          TMT_FILLCOLOR, AColor);
        ViewInfo.BackgroundColor := AColor;
      end;
    end else
{$ENDIF}
      if Enabled then
        ViewInfo.BackgroundColor := Style.Color
      else
        ViewInfo.BackgroundColor := clBtnFace;
  end;

const
  ABorderStyleMap: array [TcxContainerHotState, TcxContainerBorderStyle] of TcxContainerBorderStyle = (
    (cbsNone, cbsSingle, cbsThick, cbsFlat, cbs3D, cbsSingle),
    (cbsNone, cbsSingle, cbsThick, cbsFlat, cbs3D, cbsSingle),
    (cbsFlat, cbsThick, cbsThick, cbs3D, cbs3D, cbsSingle)
  );
var
  AHotState: TcxContainerHotState;
  ASelected: Boolean;
  R: TRect;
begin
  ViewInfo.Bounds := GetControlRect(Self);
{$IFDEF VCL}
  ViewInfo.NativeStyle := AreVisualStylesMustBeUsed(Style.LookAndFeel.NativeStyle,
    GetBackgroundThemedObjectType);
  if ViewInfo.NativeStyle then
  begin
    ViewInfo.ThemedObjectType := GetBackgroundThemedObjectType;
    ViewInfo.NativePart := GetBackgroundNativePart;
  end;
{$ENDIF}
  ViewInfo.Shadow := Style.Shadow{$IFDEF VCL} and not ViewInfo.NativeStyle{$ENDIF};
  if Enabled then
    if IsDesigning then
      ViewInfo.ContainerState := [csNormal]
    else
    begin
      if Focused then
        ViewInfo.ContainerState := [csActive]
      else
        ViewInfo.ContainerState := [csNormal];
      if PtInRect(GetVisibleBounds, P) and AMouseTracking then
        Include(ViewInfo.ContainerState, csHotTrack);
    end
  else
    ViewInfo.ContainerState := [csDisabled];
  ASelected := ViewInfo.ContainerState * [csActive, csHotTrack] <> [];
  if not Style.HotTrack then
    AHotState := chsNoHotTrack
  else
    if ASelected then
      AHotState := chsSelected
    else
      AHotState := chsNormal;
  with ViewInfo do
  begin
    BorderStyle := Style.BorderStyle;
    BorderStyle := ABorderStyleMap[AHotState, BorderStyle];
  end;
  R := ViewInfo.Bounds;
  ExtendRect(R, GetBorderExtent);
  ViewInfo.BorderRect := R;
  ViewInfo.BorderWidth := GetBorderWidth(ViewInfo.BorderStyle);
  ViewInfo.Edges := Style.Edges;
  if Style.BorderStyle = cbsUltraFlat then
    if (csActive in ViewInfo.ContainerState) or (csHotTrack in ViewInfo.ContainerState) and
        Style.HotTrack or IsDesigning and Enabled then
      ViewInfo.BorderColor := clHighlight
    else
      ViewInfo.BorderColor := clBtnShadow
  else
    ViewInfo.BorderColor := Style.BorderColor;
  ViewInfo.ClientRect := ViewInfo.BorderRect;
{$IFDEF VCL}
  if ViewInfo.NativeStyle then
    ViewInfo.NativeState := GetBackgroundNativeState;
{$ENDIF}
  CalculateColorSettings;
end;

procedure TcxContainer.ClearSavedChildControlRegions;
begin
  FPInnerControlRect := nil;
end;

procedure TcxContainer.ContainerStyleChanged(Sender: TObject);
var
  APrevParentColor: Boolean;
begin
  if FIsCreating or IsLoading then
    Exit;
  ShortRefreshContainer(False);

  if Color <> Style.GetInternalColor then
  begin
    APrevParentColor := ParentColor;
    try
      if ParentColor then
        ParentColor := False;
      FInternalSetting := True;
      try
        Color := Style.Color;
      finally
        FInternalSetting := False;
      end;
    finally
      if IsLoading and (ParentColor <> APrevParentColor) then
        ParentColor := APrevParentColor;
    end;
  end;

  FInternalSetting := True;
  Font := Style.Font;
  FInternalSetting := False;
end;

procedure TcxContainer.DataChange;
begin
end;

procedure TcxContainer.DataSetChange;
begin
end;

procedure TcxContainer.EnabledChanged;
begin
  {$IFNDEF VCL}inherited EnabledChanged;{$ENDIF}
  if FInnerControl <> nil then
    FInnerControl.Enabled := Enabled;
  if NeedsScrollBars then
  begin
    HScrollBar.Enabled := Enabled;
    VScrollBar.Enabled := Enabled;
  end;
  ShortRefreshContainer(False);
end;

procedure TcxContainer.EndMouseTracking;
begin
  MouseLeave(nil);
{$IFDEF VCL}
  cxControls.EndMouseTracking(Self);
{$ELSE}
  QcxControls.EndMouseTracking(Self);
{$ENDIF}
end;

function TcxContainer.GetBorderExtent: TRect;
const
  ADefaultBorderExtent: TRect = (
    Left: cxContainerMaxBorderWidth;
    Top: cxContainerMaxBorderWidth;
    Right: cxContainerMaxBorderWidth;
    Bottom: cxContainerMaxBorderWidth
  );
var
  ABorderWidth: Integer;
begin
  if Style.TransparentBorder or Style.HotTrack then
    Result := ADefaultBorderExtent
  else
  begin
    ABorderWidth := GetBorderWidth(ViewInfo.BorderStyle);
    Result := Rect(ABorderWidth, ABorderWidth, ABorderWidth, ABorderWidth);
  end;
  {$IFDEF VCL}if not AreVisualStylesMustBeUsed(Style.LookAndFeel.NativeStyle,
    GetBackgroundThemedObjectType) then {$ENDIF}
  if Style.Shadow then
  begin
    Inc(Result.Right, cxContainerShadowWidth);
    Inc(Result.Bottom, cxContainerShadowWidth);
  end;
end;

function TcxContainer.GetBorderWidth(ABorderStyle: TcxContainerBorderStyle): Integer;
const
  ABorderWidthA: array [TcxContainerBorderStyle] of Integer = (0, 1, 2, 2, 2, 1);
begin
  Result := ABorderWidthA[ViewInfo.BorderStyle];
end;

procedure TcxContainer.GetChildControlBounds(AChildControlBounds: TRect;
  AChildControl: TControl; var PR: PRect);
var
  R1: TRect;
begin
  if AChildControl = nil then
  begin
    PR := nil;
    Exit;
  end;

  PR^ := GetControlRect(AChildControl);
  R1 := PR^;
  with AChildControl.BoundsRect do
  begin
    if Left < AChildControlBounds.Left then
      PR^.Left := AChildControlBounds.Left - Left;
    if Top < AChildControlBounds.Top then
      PR^.Top := AChildControlBounds.Top - Top;
    if Right > AChildControlBounds.Right then
      Dec(PR^.Right, Right - AChildControlBounds.Right);
    if Bottom > AChildControlBounds.Bottom then
      Dec(PR^.Bottom, Bottom - AChildControlBounds.Bottom);
  end;
  if EqualRect(PR^, R1) then
    PR := nil;
end;

class function TcxContainer.GetStyleClass: TcxContainerStyleClass;
begin
  Result := TcxContainerStyle;
end;

class function TcxContainer.GetViewInfoClass: TcxContainerViewInfoClass;
begin
  Result := TcxContainerViewInfo;
end;

function TcxContainer.GetVisibleBounds: TRect;
var
  ABorderWidth: Integer;
begin
  Result := GetControlRect(Self);
{$IFDEF VCL}
  if AreVisualStylesMustBeUsed(Style.LookAndFeel.NativeStyle, GetBackgroundThemedObjectType) then
    Exit;
{$ENDIF}
  ExtendRect(Result, GetBorderExtent);
  ABorderWidth := GetBorderWidth(ViewInfo.BorderStyle);
  if ABorderWidth <> 0 then
  begin
    if bLeft in Style.Edges then Dec(Result.Left, ABorderWidth);
    if bTop in Style.Edges then Dec(Result.Top, ABorderWidth);
    if bRight in Style.Edges then Inc(Result.Right, ABorderWidth);
    if bBottom in Style.Edges then Inc(Result.Bottom, ABorderWidth);
  end;
end;

function TcxContainer.IsAlignControlsLocked: Boolean;
begin
  Result := FLockAlignControlsCount > 0;
end;

function TcxContainer.IsChildControlRegionChanged(AControl: TWinControl; PR: PRect): Boolean;
begin
  Result := (AControl = nil) or (AControl <> FInnerControl);
  if not Result then
  begin
    Result := not((FPInnerControlRect = nil) and (PR = nil));
    if not Result then
      Result := (FPInnerControlRect = nil) or (PR = nil);
    if not Result then
      Result := not EqualRect(FPInnerControlRect^, PR^);
  end;
end;

function TcxContainer.IsStyleInDirectAccessMode: Boolean;
begin
  Result := False;
end;

procedure TcxContainer.LockAlignControls(ALock: Boolean);
begin
  if ALock then
    Inc(FLockAlignControlsCount)
  else
    if FLockAlignControlsCount > 0 then
      Dec(FLockAlignControlsCount);
end;

function TcxContainer.RefreshContainer(const P: TPoint; Button: TcxMouseButton;
  Shift: TShiftState; AIsMouseEvent: Boolean): Boolean;
begin
  Result := True;
  if FIsRefreshLocked or IsDestroying then
    Exit;
  CalculateViewInfo(P, (Shift = []) and Style.HotTrack);
  SetSize;
  AdjustInnerControl;
  SetShadowRegion;
  if FInnerControl = nil then
    InvalidateRect(GetControlRect(Self), False)
  else
    InternalInvalidate(Handle, GetControlRect(Self), ViewInfo.BorderRect, False);
end;

procedure TcxContainer.SaveChildControlRegion(AControl: TWinControl; PR: PRect);
begin
  if (AControl <> nil) and (AControl = FInnerControl) then
    if PR = nil then
      FPInnerControlRect := nil
    else
    begin
      FPInnerControlRect := @FInnerControlRect;
      FInnerControlRect := PR^;
    end;
end;

procedure TcxContainer.SetScrollBarsParameters;
{$IFDEF VCL}
var
  AScrollBarSize: TSize;

  procedure AdjustScrollBarPosition(AScrollBar: TcxScrollBar);
  const
    AScrollBarObjects: array [TScrollBarKind] of Longword = (OBJID_HSCROLL, OBJID_VSCROLL);
  var
    AScrollBarInfo: TScrollBarInfo;
    AScrollBarState: DWORD;
    AScrollBarVisible: Boolean;
    R: TRect;
  begin
    AScrollBarVisible := False;
    repeat
      if IsDestroying or (Parent = nil) or not HandleAllocated or not FInnerControl.HandleAllocated then
        Break;
      AScrollBarInfo.cbSize := SizeOf(AScrollBarInfo);
      if not GetScrollBarInfoProc(FInnerControl.Handle, Integer(AScrollBarObjects[AScrollBar.Kind]),
          AScrollBarInfo) then
        Break;
      AScrollBarState := AScrollBarInfo.rgstate[0];
      if AScrollBarState and (STATE_SYSTEM_INVISIBLE or STATE_SYSTEM_OFFSCREEN) <> 0 then
        Break;
      AScrollBarVisible := True;
      AScrollBar.Enabled := AScrollBar.Parent.Enabled and (AScrollBarState and STATE_SYSTEM_UNAVAILABLE = 0);
      with AScrollBarInfo.rcScrollBar do
      begin
        R.TopLeft := ScreenToClient(TopLeft);
        R.Right := Right - Left;
        R.Bottom := Bottom - Top;
      end;
      with R do
      begin
        if (Left < 0) or (Right > Width) or (Top < 0) or (Bottom > Height) then
        begin
          AScrollBarVisible := False;
          AScrollBar.SetBounds(0, 0, 0, 0);
        end
        else
          AScrollBar.SetBounds(Left, Top, Right, Bottom);
      end;
    until True;
    AScrollBar.Visible := AScrollBarVisible;
    if AScrollBarVisible then
    begin
      AScrollBar.Ctl3D := False;
      AScrollBar.BringToFront;
    end;
  end;

  procedure SetScrollBarParameters(AScrollBar: TcxScrollBar);
  const
    ABarFlags: array [TScrollBarKind] of Integer = (SB_HORZ, SB_VERT);
  var
    AScrollInfo: TScrollInfo;
  begin
    AdjustScrollBarPosition(AScrollBar);
    if not AScrollBar.Visible then
      Exit;

    AScrollInfo.cbSize := SizeOf(AScrollInfo);
    AScrollInfo.fMask := SIF_ALL;
    GetScrollInfo(FInnerControl.Handle, ABarFlags[AScrollBar.Kind], AScrollInfo);
    with AScrollInfo do
    begin
      if Integer(nPage) > nMax then
        Integer(nPage) := nMax;
      AScrollBar.SetScrollParams(nMin, nMax, nPos, nPage, True);
    end;
  end;

{$ENDIF}
begin
{$IFDEF VCL}
  if (FInnerControl = nil) or not NeedsScrollBars or IsDestroying or not UsecxScrollBars then
    Exit;
  FScrollBarsCalculating := True;
  try
    AScrollBarSize := GetScrollBarSize;
    SetScrollBarParameters(HScrollBar);
    SetScrollBarParameters(VScrollBar);
  finally
    FScrollBarsCalculating := False;
  end;
{$ENDIF}
end;

procedure TcxContainer.SetShadowRegion;
var
  R: TRect;
  ABorderWidth: Integer;
begin
  if HandleAllocated then
    with ViewInfo do
    begin
      R := Bounds;
      ExtendRect(R, GetBorderExtent);
      ABorderWidth := GetBorderWidth(BorderStyle);
      if bLeft in Style.Edges then Dec(R.Left, ABorderWidth);
      if bTop in Style.Edges then Dec(R.Top, ABorderWidth);
      if bRight in Style.Edges then Inc(R.Right, ABorderWidth);
      if bBottom in Style.Edges then Inc(R.Bottom, ABorderWidth);
      SetWindowShadowRegion(Handle, Bounds, R, R{$IFDEF VCL}, NativeStyle{$ENDIF}, Shadow);
    end;
end;

procedure TcxContainer.SetSize;
begin
  if InnerControl = nil then
    Exit;
  if not EqualRect(InnerControl.BoundsRect, ViewInfo.ClientRect) then
  begin
    FIsRefreshLocked := True;
    try
      with ViewInfo.ClientRect do
        InnerControl.SetBounds(Left, Top, Right - Left, Bottom - Top);
    finally
      FIsRefreshLocked := False;
    end;
  end;
end;

function TcxContainer.ShortRefreshContainer(AIsMouseEvent: Boolean): Boolean;
begin
  Result := False;
  if not HandleAllocated or IsDestroying then Exit;
  Result := RefreshContainer(ScreenToClient(InternalGetCursorPos), cxmbNone,
    InternalGetShiftState, AIsMouseEvent);
end;

function TcxContainer.TabsNeeded: Boolean;
begin
  Result := False;
end;

procedure TcxContainer.UpdateData;
begin
end;

{$IFDEF VCL}
function TcxContainer.GetBackgroundThemedObjectType: TdxThemedObjectType;
begin
  Result := totEdit;
end;

function TcxContainer.GetBackgroundNativePart: Integer;
begin
  Result := EP_EDITTEXT;
end;

function TcxContainer.GetBackgroundNativeState: Integer;
begin
  with ViewInfo do
  begin
    if not Enabled then
      Result := ETS_DISABLED
    else if Focused then
      Result := ETS_FOCUSED
    else if csHotTrack in ContainerState then
      Result := ETS_HOT
    else
      Result := ETS_NORMAL;
  end;
end;

procedure TcxContainer.SetDragKind(Value: TDragKind);
begin
  inherited DragKind := Value;
  if InnerControl <> nil then
    TWinControlAccess(InnerControl).DragKind := Value;
end;

procedure TcxContainer.ThemeChanged;
begin
  ShortRefreshContainer(False);
end;
{$ENDIF}

function TcxContainer.GetActiveControl: TWinControl;
begin
  if FInnerControl = nil then
    Result := Self
  else
    Result := FInnerControl;
end;

function TcxContainer.GetIsDestroying: Boolean;
begin
  Result := (csDestroying in ComponentState) or FIsDestroying;
end;

procedure TcxContainer.SetStyle(const Value: TcxContainerStyle);
begin
  FStyle.Assign(Value);
end;

{$IFDEF VCL}
function TcxContainer.GetDragKind: TDragKind;
begin
  Result := inherited DragKind;
end;

procedure TcxContainer.WMKillFocus(var Message: TWMKillFocus);
begin
  if InnerControl <> nil then
  begin
    if not InnerControl.HandleAllocated or (Message.FocusedWnd <> InnerControl.Handle) then
    begin
      inherited;
      Exit;
    end;
    Message.Msg := 0;
    Message.Result := 0;
  end
  else
    inherited;
end;

procedure TcxContainer.WMNCPaint(var Message: TMessage);
begin
  Message.Result := 0;
  Exit;
end;

procedure TcxContainer.WMSetCursor(var Message: TWMSetCursor);
begin
  with Message do
    if (FInnerControl <> nil) and (CursorWnd = Handle) and
      (Smallint(HitTest) = HTCLIENT) and not PtInRect(ViewInfo.ClientRect, ScreenToClient(InternalGetCursorPos)) then
    begin
      Windows.SetCursor(Screen.Cursors[crArrow]);
      Result := 1;
      Exit;
    end;
  inherited;
end;

procedure TcxContainer.WMSetFocus(var Message: TWMSetFocus);
begin
  if not IsDestroying and HandleAllocated and (InnerControl <> nil) and
    InnerControl.HandleAllocated then
  begin
    if Message.FocusedWnd <> InnerControl.Handle then
    begin
      inherited;
      if InnerControl.CanFocus then
        InnerControl.SetFocus;
      Exit;
    end;
    Message.Msg := 0;
    Message.Result := 0;
  end
  else
    inherited;
end;

procedure TcxContainer.WMThemeChanged(var Message: TMessage);
begin
  inherited;
  CloseAllThemes;
  ShortRefreshContainer(False);
end;

procedure TcxContainer.WMWindowPosChanging(var Message: TWMWindowPosChanging);
var
  AParentForm: TCustomForm;
begin
  if IsDestroying then
  begin
    Message.Result := 0;
    Exit;
  end
  else
    inherited;
  if (GetFocus = Handle) and (InnerControl <> nil) and InnerControl.HandleAllocated and
    InnerControl.CanFocus then
  begin
    AParentForm := GetParentForm(Self);
    AParentForm.FocusControl(InnerControl);
  end;
end;

procedure TcxContainer.CMCtl3DChanged(var Message: TMessage);
begin
  inherited;
  ShortRefreshContainer(False);
end;

procedure TcxContainer.CMEnabledChanged(var Message: TMessage);
begin
  inherited;
  EnabledChanged;
end;

procedure TcxContainer.CMNCSizeChanged(var Message: TMessage);
begin
  inherited;
  if FIsCreating or IsLoading then
    Exit;
  ShortRefreshContainer(False);
end;

procedure TcxContainer.CMParentColorChanged(var Message: TMessage);
var
  APrevIsStyleColorAssigned: Boolean;
begin
  APrevIsStyleColorAssigned := csvColor in Style.FAssignedValues;
  inherited; // TODO CLX ???
  if not APrevIsStyleColorAssigned or ParentColor then
    Exclude(Style.FAssignedValues, csvColor);
  if Color <> Style.Color then
    ContainerStyleChanged(Style);
end;

procedure TcxContainer.CMParentFontChanged(var Message: TMessage);
var
  APrevIsStyleFontAssigned: Boolean;
begin
  APrevIsStyleFontAssigned := csvFont in Style.FAssignedValues;
  inherited; // TODO CLX ???
{$IFDEF VCL}
  if not ParentFont then
    Style.UpdateFont;
{$ENDIF}
  if not APrevIsStyleFontAssigned then
    Exclude(Style.FAssignedValues, csvFont);
end;

procedure TcxContainer.CMSysColorChange(var Message: TMessage);
begin
  inherited;
  ShortRefreshContainer(False);
end;
{$ELSE}
function TcxContainer.GetDragMode: TDragMode;
begin
  Result := inherited DragMode;
end;
{$ENDIF}

{ TcxCustomPopupWindow }

{$IFDEF VCL}
constructor TcxCustomPopupWindow.Create(AOwnerControl: TWinControl);
begin
  inherited Create;
  FormStyle := fsNormal;
  Visible := False;

  FStyle := GetStyleClass.Create(Self, False);
  FStyle.OnChanged := PopupWindowStyleChanged;
  FViewInfo := GetViewInfoClass.Create;

  FCaptureFocus := True;
  FOwnerControl := AOwnerControl;

  KeyPreview := True;
  FModalMode := True;
end;
{$ELSE}
constructor TcxCustomPopupWindow.Create(AOwnerControl: TWinControl);
begin
  inherited Create;
  {$IFDEF MSWINDOWS}
  TabStop := False;
  {$ENDIF}
  FormStyle := fsNormal;

  FStyle := GetStyleClass.Create(Self, False);
  FStyle.OnChanged := PopupWindowStyleChanged;
  FViewInfo := GetViewInfoClass.Create;

  {$IFDEF MSWINDOWS}
  ParentWidget := QApplication_desktop;
  {$ENDIF}
  {$IFDEF LINUX}
  FOwnerControlEventHook := nil;
  {$ENDIF}
  AutoScroll := False;
  Visible := False;
  FCaptureFocus := True;
  FOwnerControl := AOwnerControl;
  {$IFDEF LINUX}
  FJustClosed := False;
  {$ENDIF}

  KeyPreview := True;
  FModalMode := True;
end;
{$ENDIF}

destructor TcxCustomPopupWindow.Destroy;
begin
  if IsVisible then
    FVisiblePopupWindowList.Remove(Self);
  FreeAndNil(FViewInfo);
  FStyle.OnChanged := nil;
  FreeAndNil(FStyle);
  inherited Destroy;
end;

{$IFDEF MSWINDOWS}
  {$IFDEF DELPHI5}
function TcxCustomPopupWindow.CanFocus: Boolean;
begin
    {$IFDEF VCL}
  Result := Visible;
    {$ELSE}
  Result := True;
    {$ENDIF}
end;
  {$ENDIF}
{$ENDIF}

class function TcxCustomPopupWindow.GetStyleClass: TcxContainerStyleClass;
begin
  Result := TcxContainerStyle;
end;

class function TcxCustomPopupWindow.GetViewInfoClass: TcxContainerViewInfoClass;
begin
  Result := TcxContainerViewInfo;
end;

function TcxCustomPopupWindow.HasCapture: Boolean;
begin
{$IFDEF MSWINDOWS}
  Result := HasNativeHandle(Self, GetCapture);
{$ENDIF}
{$IFDEF LINUX}
  Result := HasNativeHandle(Self, QWidget_mouseGrabber);
{$ENDIF}
end;

function TcxCustomPopupWindow.IsVisible: Boolean;
begin
  Result := (FVisiblePopupWindowList <> nil) and
    (FVisiblePopupWindowList.IndexOf(Self) <> -1);
end;

procedure TcxCustomPopupWindow.AdjustClientRect(var Rect: TRect);
begin
  Rect := ViewInfo.ClientRect;
end;

procedure TcxCustomPopupWindow.Deactivate;
var
  AActiveWnd: TcxHandle;
  APopupWindow: TcxCustomPopupWindow;
  I: Integer;
begin
  FDeactivation := False;
  if IsDeactivateLocked then
    Exit;
{$IFDEF LINUX}
  if FPopupWindowShowing and IsChildWindow(Self, NativeHandle(FBeingShownPopupWindow.Handle)) then
    Exit;
{$ENDIF}

{$IFDEF VCL}
  if FVisiblePopupWindowList.Count > 0 then
  begin
    AActiveWnd := GetActiveWindow;
    for I := FVisiblePopupWindowList.Count - 1 downto 0 do
    begin
      APopupWindow := TcxCustomPopupWindow(FVisiblePopupWindowList[I]);
      if HasHandle(APopupWindow, AActiveWnd) then
        Exit;
      if IsWindowEnabled(APopupWindow.Handle) then
        APopupWindow.CloseUp(False);
    end;
  end;
{$ELSE}
  {$IFDEF MSWINDOWS}
    {$IFDEF DELPHI7}
  if FPopupWindowShowing then
    Exit;
    {$ENDIF}
  {$ENDIF}
  if FVisiblePopupWindowList.Count > 0 then
  begin
    AActiveWnd := QApplication_activeWindow(Application.Handle);
  {$IFDEF MSWINDOWS}
    {$IFDEF DELPHI7}
    if AActiveWnd = nil then
      Exit;
    {$ENDIF}
  {$ENDIF}
    for I := FVisiblePopupWindowList.Count - 1 downto 0 do
    begin
      APopupWindow := TcxCustomPopupWindow(FVisiblePopupWindowList[I]);
      if HasHandle(APopupWindow, AActiveWnd) then
        Exit;
      if HasHandle(APopupWindow.OwnerControl, AActiveWnd) or
          IsChildWindow(APopupWindow.OwnerControl, NativeHandle(AActiveWnd)) then
        Exit;
      if QWidget_isEnabled(APopupWindow.Handle) then // TODO test
        APopupWindow.CloseUp(False);
    end;
  end;
{$ENDIF}
  if FVisiblePopupWindowList.Count > 0 then CloseUp(False);
end;

procedure TcxCustomPopupWindow.InitPopup;
begin
end;

procedure TcxCustomPopupWindow.KeyDown(var Key: Word; Shift: TShiftState);
begin
  if IsVisible and HasCapture and (Key = VK_ESCAPE) then
  begin
    SetCaptureControl(nil);
    Key := 0;
  end
  else
    inherited KeyDown(Key, Shift);
end;

procedure TcxCustomPopupWindow.Paint;
begin
{$IFNDEF VCL}
  Canvas.Canvas.Start;
  try
{$ENDIF}
    ViewInfo.Paint(Canvas);
{$IFNDEF VCL}
  finally
    Canvas.Canvas.Stop;
  end;
{$ENDIF}
end;

{$IFDEF MSWINDOWS}
procedure TcxCustomPopupWindow.VisibleChanged;
var
  {$IFDEF VCL}
  AParentForm: TCustomForm;
  AWnd: HWND;
  {$ELSE}
  AWidget: QWidgetH;
  {$ENDIF}
begin
  inherited VisibleChanged;
  if not HandleAllocated then
    Exit;
  if HandleAllocated and
  {$IFDEF VCL}
    IsWindowVisible(NativeHandle(Handle)) then
  {$ELSE}
    Visible then
  {$ENDIF}
  begin
  {$IFNDEF VCL}
    ReleaseCapture;
  {$ENDIF}
  end else
  begin
  {$IFDEF VCL}
    AWnd := GetFocus;
    if FOwnerControl = nil then
      AParentForm := nil
    else
      AParentForm := GetParentForm(FOwnerControl);
    if (AParentForm <> nil) and HasNativeHandle(AParentForm, AWnd) and OwnerControl.CanFocus then
      OwnerControl.SetFocus;
  {$ELSE}
    AWidget := QWidget_keyboardGrabber;
    if (AWidget <> nil) and (HasNativeHandle(Self, NativeHandle(AWidget)) or IsChildWindow(Self, NativeHandle(AWidget))) then
      QWidget_releaseKeyboard(AWidget);
  {$ENDIF}
  end;
end;
{$ENDIF}
{$IFDEF LINUX}
procedure TcxCustomPopupWindow.VisibleChanged;
var
  AMethod: TMethod;
begin
  inherited VisibleChanged;
  if not HandleAllocated then
    Exit;
  if Visible then
  begin
    if FVisiblePopupWindowList.IndexOf(Self) = -1 then
      FVisiblePopupWindowList.Add(Self);
    if not CaptureFocus then
    begin
      FOwnerControlEventHook := QWidget_hook_create(TWinControl(FFocusedControl).Handle);
      TEventFilterMethod(AMethod) := OwnerControlEventFilter;
      Qt_hook_hook_events(FOwnerControlEventHook, AMethod);
    end;
    if QWidget_mouseGrabber <> nil then
      SetMouseGrabControl(nil);
  end else
  begin
    if not CaptureFocus then
    begin
      QWidget_hook_destroy(FOwnerControlEventHook);
      FOwnerControlEventHook := nil;
    end;
  end;
end;
{$ENDIF}

{$IFDEF MSWINDOWS}
  {$IFDEF VCL}
procedure TcxCustomPopupWindow.CreateHandle;
var
  FIsInVisiblePopupWindowList: Boolean;
begin
  FIsInVisiblePopupWindowList := False;
  if FVisiblePopupWindowList.IndexOf(Self) = -1 then
    FVisiblePopupWindowList.Add(Self)
  else
    FIsInVisiblePopupWindowList := True;
  inherited CreateHandle;
  if not FIsInVisiblePopupWindowList then
    FVisiblePopupWindowList.Remove(Self);
end;

procedure TcxCustomPopupWindow.CreateParams(var Params: TCreateParams);
var
  AParentForm: TCustomForm;
begin
  inherited CreateParams(Params);
  with Params do
  begin
    if CaptureFocus then
    begin
      AParentForm := GetParentForm(OwnerControl);
      if AParentForm <> nil then
        WndParent := AParentForm.Handle;
      Style := Style and not WS_CHILD;
      Style := Style or WS_POPUP;
//      ExStyle := ExStyle or WS_EX_TOOLWINDOW;
      if FIsTopMost and ((AParentForm = nil) or (GetWindowLong(AParentForm.Handle,
          GWL_EXSTYLE) and WS_EX_TOPMOST <> 0)) then
        ExStyle := ExStyle or WS_EX_TOPMOST;
    end else
    begin
      Style := WS_CHILD;
      ExStyle := ExStyle or WS_EX_TOOLWINDOW;
      if (Params.WndParent = 0) and (OwnerControl <> nil) then
        Params.WndParent := OwnerControl.Handle;
    end;
    Style := Style or WS_CLIPCHILDREN;
  end;
end;

procedure TcxCustomPopupWindow.CreateWnd;
begin
  inherited CreateWnd;
  if not CaptureFocus then
    Windows.SetParent(Handle, 0);
end;
  {$ELSE}
procedure TcxCustomPopupWindow.Initialize;
var
  A: Longint;
begin
  if CaptureFocus then
  begin
    A := GetWindowLong(NativeHandle(Handle), GWL_STYLE);
    A := A and not WS_CHILD;
    A := A or Longint(WS_POPUP);
    SetWindowLong(NativeHandle(Handle), GWL_STYLE, A);

    A := GetWindowLong(NativeHandle(Handle), GWL_EXSTYLE);
    A := A or WS_EX_TOOLWINDOW or WS_EX_TOPMOST;
    SetWindowLong(NativeHandle(Handle), GWL_EXSTYLE, A);
  end else
  begin
    A := WS_EX_TOOLWINDOW or WS_EX_CONTROLPARENT;
    SetWindowLong(NativeHandle(Handle), GWL_EXSTYLE, A);

    A := WS_CHILD or WS_CLIPSIBLINGS;
    SetWindowLong(NativeHandle(Handle), GWL_STYLE, A);
    Windows.SetParent(NativeHandle(Handle), 0);
  end;
end;
  {$ENDIF}
{$ENDIF}
{$IFDEF LINUX}
function TcxCustomPopupWindow.OwnerControlEventFilter(Sender: QObjectH; Event: QEventH): Boolean;
var
  AFocusedControl: QWidgetH;
begin
  if HandleAllocated and QWidget_isVisible(Handle) and (QEvent_type(Event) = QEventType_FocusOut) then
  begin
    AFocusedControl := QApplication_focusWidget(Application.Handle);
    if (AFocusedControl <> nil) and ((AFocusedControl = Self.Handle) or
      IsChildWindow(Self, AFocusedControl)) then
    begin
      Result := True;
      QWidget_setFocus(FFocusedControl.Handle);
      Exit;
    end;
  end;
  Result := False;
end;
{$ENDIF}

{$IFNDEF VCL}
procedure TcxCustomPopupWindow.Activate;
begin
  inherited Activate;
end;

function TcxCustomPopupWindow.EventFilter(Sender: QObjectH; Event: QEventH): Boolean;
begin
  case QEvent_type(Event) of
    QEventType_CMClosePopupWindow, QEventType_CMShowPopupWindow:
      begin
        Result := True;
        if QEvent_type(Event) = QEventType_CMClosePopupWindow then
          CloseUp
        else
          Popup(TWinControl(QCustomEvent_data(QCustomEventH(Event))));
        Exit;
      end;
  end;

  if QEvent_type(Event) = QEventType_Hide then
  begin
    begin
      Result := True;
      CloseUp;
//      Result := {$IFDEF WIN32}False(*FVisiblePopupWindowList.IndexOf(Self) = -1*){$ENDIF}{$IFDEF LINUX}True{$ENDIF};
    end
  end
  else
    Result := inherited EventFilter(Sender, Event);
end;

procedure TcxCustomPopupWindow.InitWidget;
begin
  inherited InitWidget;
  if not HasBackground then
    QWidget_setBackgroundMode(Handle, QWidgetBackgroundMode_NoBackground);
end;

function TcxCustomPopupWindow.WidgetFlags: Integer;
begin
  Result := inherited WidgetFlags;
  {$IFDEF MSWINDOWS}
  if CaptureFocus then
  begin
    Result := Result or Integer(WidgetFlags_WType_Popup);
    Result := Result or Integer(WidgetFlags_WStyle_Customize);
    Result := Result or Integer(WidgetFlags_WStyle_Tool);
  end
  else
  begin
    Result := Result or Integer(WidgetFlags_WType_Popup);
    Result := Result or Integer(WidgetFlags_WStyle_Customize);
    Result := Result or Integer(WidgetFlags_WStyle_Tool);
  end;
  {$ENDIF}
  {$IFDEF LINUX}
  if CaptureFocus then
  begin
    Result := Result or Integer(WidgetFlags_WType_Popup);
    Result := Result or Integer(WidgetFlags_WStyle_Customize);
    Result := Result or Integer(WidgetFlags_WStyle_Tool);
  end else
  begin
    Result := Result or Integer(WidgetFlags_WType_Popup);
    Result := Result or Integer(WidgetFlags_WStyle_Customize);
    Result := Result or Integer(WidgetFlags_WStyle_Tool);
  end;
  {$ENDIF}
end;
{$ENDIF}

procedure TcxCustomPopupWindow.PopupWindowStyleChanged(Sender: TObject);
begin
end;

procedure TcxCustomPopupWindow.RecreateWindow;
begin
  if HandleAllocated then
{$IFDEF VCL}
    RecreateWnd;
{$ELSE}
    RecreateWidget;
{$ENDIF}
end;

{$IFDEF MSWINDOWS}
function TcxCustomPopupWindow.IsSysKeyAccepted(Key: Word): Boolean;
begin
  case Key of
    Windows.VK_F4, Windows.VK_LEFT, Windows.VK_RIGHT, Windows.VK_UP,
    Windows.VK_DOWN, Windows.VK_PRIOR, Windows.VK_NEXT, Windows.VK_HOME,
    Windows.VK_END:
      Result := True;
    else
      Result := False;
  end;
end;

  {$IFNDEF VCL}
function TcxCustomPopupWindow.IsCloseUpLocked: Boolean;
begin
  Result := FIsCloseUpLocked;
end;

procedure TcxCustomPopupWindow.LockCloseUp(ALock: Boolean);
begin
  FIsCloseUpLocked := ALock;
end;
  {$ENDIF}
{$ENDIF}

{$IFNDEF VCL}
procedure TcxCustomPopupWindow.ActivateMainForm;
var
  AParentForm: TCustomForm;
begin
  if FVisiblePopupWindowList.Count = 0 then
    Exit;
  AParentForm := GetParentForm(TcxCustomPopupWindow(FVisiblePopupWindowList[0]).OwnerControl);
  if AParentForm <> nil then
    QWidget_setActiveWindow(Application.MainForm.Handle);
end;
{$ENDIF}

procedure TcxCustomPopupWindow.ClosePopup;
begin
{$IFDEF VCL}
  PostMessage(NativeHandle(Handle), CM_CLOSEPOPUPWINDOW, 0, 0);
{$ELSE}
  QApplication_postEvent(Handle, QCustomEvent_create(QEventType_CMClosePopupWindow, Self));
{$ENDIF}
end;

procedure TcxCustomPopupWindow.CloseUp(AModalResult: Boolean = False);
begin
  if FVisiblePopupWindowList.IndexOf(Self) = -1 then
    Exit;

{$IFDEF MSWINDOWS}
  {$IFNDEF VCL}
  if IsCloseUpLocked then
  begin
    LockCloseUp(False);
    Exit;
  end;
  {$ENDIF}
{$ENDIF}

  if AModalResult and not CloseQuery then
  begin
    ModalResult := mrNone;
    Exit;
  end;
  FVisiblePopupWindowList.Remove(Self);
  DoClosing;
{$IFNDEF VCL}
  {$IFDEF MSWINDOWS}
  FIsApplicationDeactivationLocked := True;
  try
  {$ENDIF}
    if not FDeactivation then
      inherited CloseUp;
  {$IFDEF MSWINDOWS}
  finally
    FIsApplicationDeactivationLocked := False;
  end;
  {$ENDIF}
{$ENDIF}

  FPopupWindowShowing := True;
  FBeingShownPopupWindow := Self;
  try
{$IFDEF MSWINDOWS}
  {$IFDEF VCL}
    ShowWindow(NativeHandle(Handle), SW_HIDE);
  {$ELSE}
  {$ENDIF}
  {$IFNDEF VCL}
    FIsApplicationDeactivationLocked := True;
    try
  {$ENDIF}
      Hide;
  {$IFNDEF VCL}
    finally
      FIsApplicationDeactivationLocked := False;
    end;
  {$ENDIF}
    DoClosed;
    if HasNativeHandle(Self, GetCapture) then
      SetCaptureControl(nil);
{$ENDIF}
{$IFDEF LINUX}
    QWidget_hide(Handle);
    Hide;
    DoClosed;
    if HasNativeHandle(Self, QWidget_mouseGrabber) then
      SetCaptureControl(nil);
{$ENDIF}
  finally
    FPopupWindowShowing := False;
  end;
end;

function TcxCustomPopupWindow.Focused: Boolean;
var
  AFocusedControl: TcxNativeHandle;
  AIndex: Integer;
begin
  Result := False;
  AIndex := FVisiblePopupWindowList.IndexOf(Self);
  if AIndex = -1 then
    Exit;
  if CaptureFocus then
  begin
    AFocusedControl := {$IFDEF MSWINDOWS}GetFocus{$ENDIF}{$IFDEF LINUX}QApplication_focusWidget(Application.Handle){$ENDIF};
    Result := HasNativeHandle(Self, AFocusedControl) or IsChildWindow(Self, AFocusedControl);
  end;
end;

{$IFDEF MSWINDOWS}
procedure TcxCustomPopupWindow.Popup(AFocusedControl: TWinControl);
var
  Msg: TMsg;
  {$IFDEF VCL}
  AParentForm: TCustomForm;
  AFlags: UINT;
  {$ENDIF}
begin
  if FVisiblePopupWindowList.IndexOf(Self) <> -1 then
    Exit;
  InitPopup;
  CalculateSize;
  with CalculatePosition do
    SetBounds(X, Y, Width, Height);
  FPopupWindowShowing := True;
  FBeingShownPopupWindow := Self;
  try
    FVisiblePopupWindowList.Add(Self);
  {$IFNDEF VCL}
    Initialize;
//    if CaptureFocus then
//      Windows.SetParent(NativeHandle(Handle), 0);
  {$ENDIF}
    if CaptureFocus then
      FFocusedControl := GetFirstFocusControl(AFocusedControl)(*AFocusedControl*)
    else
      FFocusedControl := AFocusedControl;
    DoShowing;
    if CaptureFocus then
    begin
      Show;
  {$IFNDEF VCL}
      Windows.SetParent(NativeHandle(Handle), 0);
      SetWindowPos(NativeHandle(Handle), HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE or SWP_SHOWWINDOW);
  {$ENDIF}
      if FFocusedControl = nil then
        SetFocus
      else
  {$IFDEF VCL}
//        SendMessage(FFocusedControl.Handle, WM_SETFOCUS, 0, 0);
        FFocusedControl.SetFocus;
  {$ELSE}
        FFocusedControl.SetFocus;
  {$ENDIF}
    end else
    begin
  {$IFDEF VCL}
//      if Assigned(AnimateWindowProc) then
//        AnimateWindowProc(Handle, 100, AW_VER_POSITIVE or AW_SLIDE);

      Show;
      FFocusedControl.SetFocus;
      AParentForm := GetParentForm(OwnerControl);
      if (AParentForm = nil) or (GetWindowLong(AParentForm.Handle,
          GWL_EXSTYLE) and WS_EX_TOPMOST <> 0) then
        AFlags := HWND_TOPMOST
      else
        AFlags := 0;
      SetWindowPos(NativeHandle(Handle), AFlags, 0, 0, 0, 0,
        SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE or SWP_SHOWWINDOW);
  {$ELSE}
      Show;
    {$IFNDEF DELPHI7}
      LockDeactivate(True);
      try
    {$ENDIF}
        QWidget_setFocus(FFocusedControl.Handle);
    {$IFNDEF DELPHI7}
      finally
        LockDeactivate(False);
      end;
    {$ENDIF}
  {$ENDIF}
    end;
  {$IFNDEF VCL}
  if not CaptureFocus then
    Windows.SetParent(NativeHandle(Handle), 0);
  {$ENDIF}
  finally
    FPopupWindowShowing := False;
  end;
  ModalResult := mrNone;
  DoShowed;
  if FCaptureFocus and ModalMode then
    while Visible and not Application.Terminated do
    begin
      if PeekMessage(Msg, 0, WM_SYSKEYDOWN, WM_SYSKEYDOWN, PM_NOREMOVE) then
        case Msg.wParam of
          Windows.VK_MENU, Windows.VK_RETURN, Windows.VK_SPACE:
            PeekMessage(Msg, 0, Msg.message, Msg.message, PM_REMOVE);
        end;

      if ModalResult <> mrNone then
        CloseUp(True);
      Application.HandleMessage;
    end;
end;
{$ENDIF}
{$IFDEF LINUX}
procedure TcxCustomPopupWindow.Popup(AFocusedControl: TWinControl);
begin
  if FVisiblePopupWindowList.IndexOf(Self) <> -1 then
    Exit;
  InitPopup;
  CalculateSize;
  with CalculatePosition do
    SetBounds(X, Y, Width, Height);
  FPopupWindowShowing := True;
  FBeingShownPopupWindow := Self;
  try
    FVisiblePopupWindowList.Add(Self);
    if CaptureFocus then
      FFocusedControl := GetFirstFocusControl(AFocusedControl)(*AFocusedControl*)
    else
      FFocusedControl := AFocusedControl;
    DoShowing;
    Visible := True;
    BringToFront;
//{$IFDEF KYLIX3}
    LockDeactivate(True);
    try
//{$ENDIF}
      if CaptureFocus then
      begin
        if FFocusedControl = nil then
          SetFocus
        else
        begin
          QWidget_clearFocus(QApplication_focusWidget(Application.Handle));
          QWidget_setFocus(FFocusedControl.Handle);
        end;
      end
      else
        QWidget_setFocus(FFocusedControl.Handle);
//{$IFDEF KYLIX3}
    finally
      ActivateMainForm;
      LockDeactivate(False);
    end;
//{$ENDIF}
//    QWidget_setActiveWindow(OwnerControl.Handle);
  finally
    FPopupWindowShowing := False;
  end;
  ModalResult := mrNone;
  DoShowed;
  if FCaptureFocus and ModalMode then
    while Visible and not Application.Terminated do
    begin
      if ModalResult <> mrNone then
        CloseUp(True);
      Application.HandleMessage;
    end;
end;
{$ENDIF}

procedure TcxCustomPopupWindow.DoClosed;
begin
  if Assigned(FOnClosed) then
    FOnClosed(Self);
end;

procedure TcxCustomPopupWindow.DoClosing;
begin
  if Assigned(FOnClosing) then
    FOnClosing(Self);
end;

procedure TcxCustomPopupWindow.DoShowed;
begin
  if Assigned(FOnShowed) then
    FOnShowed(Self);
end;

procedure TcxCustomPopupWindow.DoShowing;
begin
  if Assigned(FOnShowing) then
    FOnShowing(Self);
end;

function TcxCustomPopupWindow.GetFirstFocusControl(AControl: TWinControl): TWinControl;
begin
  if AControl = nil then
    Result := Self
  else
    if AControl.CanFocus and AControl.TabStop then
      Result := AControl
    else
    begin
      Result := FindNextControl(nil, True, True, False);
      if Result = nil then
        Result := Self;
    end;
end;

function TcxCustomPopupWindow.HasBackground;
begin
  Result := False;
end;

function TcxCustomPopupWindow.IsDeactivateLocked: Boolean;
begin
  Result := FIsDeactivateLocked;
end;

procedure TcxCustomPopupWindow.LockDeactivate(ALock: Boolean);
begin
  FIsDeactivateLocked := ALock;
end;

procedure TcxCustomPopupWindow.MouseEnter(AControl: TControl);
begin
  {$IFNDEF VCL}inherited MouseEnter(AControl);{$ENDIF}
end;

procedure TcxCustomPopupWindow.MouseLeave(AControl: TControl);
begin
  {$IFNDEF VCL}inherited MouseLeave(AControl);{$ENDIF}
end;

procedure TcxCustomPopupWindow.SetCaptureFocus(Value: Boolean);
begin
  if Value <> FCaptureFocus then
  begin
    FCaptureFocus := Value;
    RecreateWindow;
    if IsVisible then
    begin
      CloseUp;
      Popup(FFocusedControl);
    end;
  end;
end;

procedure TcxCustomPopupWindow.SetIsTopMost(Value: Boolean);
begin
  if Value <> FIsTopMost then
  begin
    FIsTopMost := Value;
    RecreateWindow;
    if IsVisible then
    begin
      CloseUp;
      Popup(FFocusedControl);
    end;
  end;
end;

{$IFDEF VCL}
procedure TcxCustomPopupWindow.WMActivateApp(var Message: TWMActivateApp);
begin
end;

procedure TcxCustomPopupWindow.WMEraseBkgnd(var Message: TWMEraseBkgnd);
begin
  if HasBackground then
    inherited
  else
    Message.Result := 1;
end;

procedure TcxCustomPopupWindow.CMClosePopupWindow(var Message: TMessage);
begin
  LockDeactivate(True);
  try
    CloseUp(False);
  finally
    LockDeactivate(False);
  end;
  SendMessage(OwnerControl.Handle, WM_SETFOCUS, 0, 0);
end;

procedure TcxCustomPopupWindow.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  if Message.lParam = 0 then
    MouseEnter(Self)
  else
    MouseEnter(TControl(Message.lParam));
end;

procedure TcxCustomPopupWindow.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  if Message.lParam = 0 then
    MouseLeave(Self)
  else
    MouseLeave(TControl(Message.lParam));
end;

procedure TcxCustomPopupWindow.CMShowPopupWindow(var Message: TMessage);
begin
  Popup(TWinControl(Message.WParam));
end;
{$ENDIF}

{ TcxCustomInnerListBox }

constructor TcxCustomInnerListBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCanvas := TcxCanvas.Create(inherited Canvas);
  CreateScrollBars;
  FLookAndFeel := TcxLookAndFeel.Create(Self);
  FHScrollBar.LookAndFeel.MasterLookAndFeel := FLookAndFeel;
  FVScrollBar.LookAndFeel.MasterLookAndFeel := FLookAndFeel;
  BorderStyle := bsNone;
  ControlStyle := ControlStyle + [csDoubleClicks{$IFNDEF VCL}, csCaptureMouse{$ENDIF}];
{$IFNDEF VCL}
  InputKeys := [ikArrows, ikChars, ikTabs];
{$ENDIF}
  ParentColor := False;
  ParentFont := True;
end;

destructor TcxCustomInnerListBox.Destroy;
begin
  if (FHScrollBar <> nil) and (FHScrollBar.Parent = nil) then
    FreeAndNil(FHScrollBar);
  if (FVScrollBar <> nil) and (FVScrollBar.Parent = nil) then
    FreeAndNil(FVScrollBar);
  FreeAndNil(FLookAndFeel);
  FreeAndNil(FCanvas);
  inherited Destroy;
end;

procedure TcxCustomInnerListBox.DragDrop(Source: TObject; X, Y: Integer);
begin
  if Container <> nil then
    Container.DragDrop(Source, Left + X, Top + Y);
end;

{$IFNDEF DELPHI6}
procedure TcxCustomInnerListBox.AddItem(AItem: string; AObject: TObject);
var
  S: string;
begin
  SetString(S, PChar(AItem), StrLen(PChar(AItem)));
  Items.AddObject(S, AObject);
end;

procedure TcxCustomInnerListBox.ClearSelection;
var
  I: Integer;
begin
  if MultiSelect then
    for I := 0 to Items.Count - 1 do
      Selected[I] := False
  else
    ItemIndex := -1;
end;

procedure TcxCustomInnerListBox.DeleteSelected;
var
  I: Integer;
begin
  if MultiSelect then
    for I := Items.Count - 1 downto 0 do
    begin
      if Selected[I] then
        Items.Delete(I);
    end
  else
    if ItemIndex <> -1 then
      Items.Delete(ItemIndex);
end;

procedure TcxCustomInnerListBox.SelectAll;
var
  I: Integer;
begin
  if MultiSelect then
    for I := 0 to Items.Count - 1 do
      Selected[I] := True;
end;
{$ENDIF}

{$IFDEF VCL}
function TcxCustomInnerListBox.ItemVisible(Index: Integer): Boolean;
var
  R: TRect;
begin
  R := GetControlRect(Self);
  with ItemRect(Index) do
  begin
    Result := PtInRect(R, TopLeft);
    Result := Result or PtInRect(R, Point(Right - 1, Top));
    Result := Result or PtInRect(R, Point(Left, Bottom - 1));
    Result := Result or PtInRect(R, Point(Right - 1, Bottom - 1));
  end;
end;
{$ELSE}
procedure TcxCustomInnerListBox.AddItem(AItem: string; AObject: TObject);
var
  S: string;
begin
  SetString(S, PChar(AItem), StrLen(PChar(AItem)));
  Items.AddObject(S, AObject);
end;

procedure TcxCustomInnerListBox.DeleteSelected;
var
  I: Integer;
begin
  if MultiSelect then
    for I := Items.Count - 1 downto 0 do
    begin
      if Selected[I] then
        Items.Delete(I);
    end
  else
    if ItemIndex <> -1 then
      Items.Delete(ItemIndex);
end;

procedure TcxCustomInnerListBox.SelectAll;
var
  I: Integer;
begin
  if MultiSelect then
    for I := 0 to Items.Count - 1 do
      Selected[I] := True;
end;
{$ENDIF}

procedure TcxCustomInnerListBox.Click;
begin
  inherited Click;
  {$IFDEF VCL}FVScrollBar.Position := TopIndex;{$ENDIF}
  if Container <> nil then
    Container.Click;
end;

procedure TcxCustomInnerListBox.DblClick;
begin
  inherited DblClick;
  if Container <> nil then
    Container.DblClick;
end;

function TcxCustomInnerListBox.DoMouseWheel(Shift: TShiftState; WheelDelta: Integer;
  {$IFNDEF VCL}const{$ENDIF} MousePos: TPoint): Boolean;
begin
  Result := (Container <> nil) and Container.DoMouseWheel(Shift,
    WheelDelta, MousePos);
  if not Result then
    inherited DoMouseWheel(Shift, WheelDelta, MousePos);
end;

procedure TcxCustomInnerListBox.DragOver(Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  if Container <> nil then
    Container.DragOver(Source, Left + X, Top + Y, State, Accept);
end;

function TcxCustomInnerListBox.GetPopupMenu: TPopupMenu;
begin
  if Container = nil then
    Result := inherited GetPopupMenu
  else
    Result := Container.GetPopupMenu;
end;

procedure TcxCustomInnerListBox.KeyDown(var Key: Word; Shift: TShiftState);
begin
  if Container <> nil then
    Container.KeyDown(Key, Shift);
  if Key <> 0 then
    inherited KeyDown(Key, Shift);
end;

procedure TcxCustomInnerListBox.KeyPress(var Key: Char);
begin
  if (Key = Char(VK_TAB)){$IFNDEF VCL} or (Key = Char(Key_Backtab)){$ENDIF} then
    Key := #0;
  if Container <> nil then
    Container.KeyPress(Key);
  if Word(Key) = VK_RETURN then
    Key := #0;
  if Key <> #0 then
    inherited KeyPress(Key);
end;

procedure TcxCustomInnerListBox.KeyUp(var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_TAB){$IFNDEF VCL} or (Key = Key_Backtab){$ENDIF} then
    Key := 0;
  if Container <> nil then
    Container.KeyUp(Key, Shift);
  if Key <> 0 then
    inherited KeyUp(Key, Shift);
end;

procedure TcxCustomInnerListBox.MouseDown(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseDown(Button, Shift, X, Y);
  if Container <> nil then
    with Container do
    begin
      InnerControlMouseDown := True;
      try
        MouseDown(Button, Shift, X + Self.Left, Y + Self.Top);
      finally
        InnerControlMouseDown := False;
      end;
    end;
end;

procedure TcxCustomInnerListBox.MouseEnter(AControl: TControl);
begin
  {$IFNDEF VCL}inherited;{$ENDIF}
end;

procedure TcxCustomInnerListBox.MouseLeave(AControl: TControl);
begin
  {$IFNDEF VCL}inherited;{$ENDIF}
  if Container <> nil then
    Container.ShortRefreshContainer(True);
end;

procedure TcxCustomInnerListBox.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseMove(Shift, X, Y);
  if Container <> nil then
    Container.MouseMove(Shift, X + Left, Y + Top);
end;

procedure TcxCustomInnerListBox.MouseUp(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseUp(Button, Shift, X, Y);
  if Container <> nil then
    Container.MouseUp(Button, Shift, X + Left, Y + Top);
end;

procedure TcxCustomInnerListBox.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if Operation = opRemove then
    if AComponent = FHScrollBar then
      FHScrollBar := nil
    else if AComponent = FVScrollBar then
      FVScrollBar := nil;
end;

{$IFDEF VCL}
procedure TcxCustomInnerListBox.WndProc(var Message: TMessage);
begin
  if Container <> nil then
    with Message do
      if ((Msg = WM_LBUTTONDOWN) or (Msg = WM_LBUTTONDBLCLK)) and
        (Container.DragMode = dmAutomatic) and not(csDesigning in Container.ComponentState) then
      begin
        Container.BeginAutoDrag;
        Exit;
      end;
  inherited WndProc(Message);
  case Message.Msg of
    WM_HSCROLL,
    WM_MOUSEWHEEL,
    WM_VSCROLL,
    WM_WINDOWPOSCHANGED,
    CM_WININICHANGE,
    LB_SETTOPINDEX,
    LB_ADDSTRING,
    LB_INSERTSTRING,
    LB_DELETESTRING,
    LB_RESETCONTENT,
    LB_SETCARETINDEX,
    LB_SETCURSEL,
    LB_SETHORIZONTALEXTENT:
      SetExternalScrollBarsParameters;
  end;
end;

function TcxCustomInnerListBox.GetSizeGripRect: TRect;
var
  R: TRect;
begin
  if FHScrollBar.Visible and FVScrollBar.Visible then
  begin
    Result.TopLeft := Parent.ClientToScreen(Point(FVScrollBar.Left, FHScrollBar.Top));
    GetWindowRect(Handle, R);
    Dec(Result.Left, R.Left);
    Dec(Result.Top, R.Top);
    Result.Right := Result.Left + FVScrollBar.Width;
    Result.Bottom := Result.Top + FHScrollBar.Height;
  end
  else
    FillChar(Result, SizeOf(Result), 0);
end;

procedure TcxCustomInnerListBox.LockScrollBarsUpdate(ALock: Boolean);
begin
  SetExternalScrollBarsParameters;
  Exit;
  if ALock then
    Inc(FScrollBarsLockCount)
  else
    if FScrollBarsLockCount > 0 then
    begin
      Dec(FScrollBarsLockCount);
      if FScrollBarsLockCount = 0 then
        SetExternalScrollBarsParameters;
    end;
end;

procedure TcxCustomInnerListBox.SetExternalScrollBarsParameters;
var
  AScrollBarSize: TSize;

  procedure AdjustScrollBarPosition(AScrollBar: TcxScrollBar);
  const
    AScrollBarObjects: array [TScrollBarKind] of Longword = (OBJID_HSCROLL, OBJID_VSCROLL);
  var
    AScrollBarInfo: TScrollBarInfo;
    AScrollBarState: DWORD;
    AScrollBarVisible: Boolean;
    R: TRect;
  begin
    AScrollBarVisible := False;
    repeat
      if Parent = nil then
        Break;
      AScrollBarInfo.cbSize := SizeOf(AScrollBarInfo);
      if not GetScrollBarInfoProc(Handle, Integer(AScrollBarObjects[AScrollBar.Kind]),
          AScrollBarInfo) then
        Break;
      AScrollBarState := AScrollBarInfo.rgstate[0];
      if AScrollBarState and (STATE_SYSTEM_INVISIBLE or STATE_SYSTEM_OFFSCREEN) <> 0 then
        Break;
      AScrollBarVisible := True;
      AScrollBar.Enabled := AScrollBarState and STATE_SYSTEM_UNAVAILABLE = 0;
      with AScrollBarInfo.rcScrollBar do
      begin
        R.TopLeft := Parent.ScreenToClient(TopLeft);
        R.Right := Right - Left;
        R.Bottom := Bottom - Top;
      end;
      with R do
      begin
        if (Left < 0) or (Right > Width) or (Top < 0) or (Bottom > Height) then
        begin
          AScrollBarVisible := False;
          if AScrollBar.Kind = sbHorizontal then
            AScrollBar.SetBounds(0, 0, 0, AScrollBarSize.cy)
          else
            AScrollBar.SetBounds(0, 0, AScrollBarSize.cx, 0);
        end
        else
          AScrollBar.SetBounds(Left, Top, Right, Bottom);
      end;
    until True;
    if AScrollBarVisible then
    begin
      Inc(FScrollBarsLockCount);
      try
        AScrollBar.Parent := Parent;
      finally
        Dec(FScrollBarsLockCount);
      end;
      AScrollBar.Ctl3D := False;
      AScrollBar.BringToFront;
    end
    else
      AScrollBar.SetBounds(0, 0, 0, 0);
    AScrollBar.Visible := AScrollBarVisible;
  end;

  procedure SetScrollBarParameters(AScrollBar: TcxScrollBar);
  const
    ABarFlags: array [TScrollBarKind] of Integer = (SB_HORZ, SB_VERT);
  var
    AScrollInfo: TScrollInfo;
  begin
    AdjustScrollBarPosition(AScrollBar);
    if not AScrollBar.Visible then
      Exit;

    AScrollInfo.cbSize := SizeOf(AScrollInfo);
    AScrollInfo.fMask := SIF_ALL;
    GetScrollInfo(Handle, ABarFlags[AScrollBar.Kind], AScrollInfo);
    with AScrollInfo do
    begin
      if Integer(nPage) > nMax then
        Integer(nPage) := nMax;
      AScrollBar.SetScrollParams(nMin, nMax, nPos, nPage, True);
    end;
  end;

begin
  if (csDestroying in ComponentState) or (FScrollBarsLockCount > 0) or not UsecxScrollBars then
    Exit;
  FScrollBarsCalculating := True;
  try
    AScrollBarSize := GetScrollBarSize;
    SetScrollBarParameters(FHScrollBar);
    SetScrollBarParameters(FVScrollBar);
  finally
    FScrollBarsCalculating := False;
  end;
end;
{$ELSE}
function TcxCustomInnerListBox.EventFilter(Sender: QObjectH; Event: QEventH): Boolean;
begin
  Result := inherited EventFilter(Sender, Event);
  if (Container <> nil) and (QEvent_type(Event) in [QEventType_FocusIn, QEventType_FocusOut]) then
    Container.FocusChanged;
end;

procedure TcxCustomInnerListBox.InitWidget;
begin
  inherited InitWidget;
  BorderStyle := bsNone;
end;
{$ENDIF}

procedure TcxCustomInnerListBox.CreateScrollBars;

  procedure InitializeScrollBar(AScrollBar: TcxScrollBar);
  begin
    AScrollBar.SmallChange := 1;
    AScrollBar.Visible := False;
  end;

begin
  FHScrollBar := TcxScrollBar.Create(Self);
  FHScrollBar.FreeNotification(Self);
  FHScrollBar.Kind := sbHorizontal;
  FHScrollBar.OnScroll := HScrollHandler;
  InitializeScrollBar(FHScrollBar);

  FVScrollBar := TcxScrollBar.Create(Self);
  FVScrollBar.FreeNotification(Self);
  FVScrollBar.Kind := sbVertical;
  FVScrollBar.OnScroll := VScrollHandler;
  InitializeScrollBar(FVScrollBar);
end;

function TcxCustomInnerListBox.GetControlContainer: TcxContainer;
begin
  Result := FContainer;
end;

function TcxCustomInnerListBox.GetControl: TWinControl;
begin
  Result := Self;
end;

procedure TcxCustomInnerListBox.HScrollHandler(Sender: TObject; ScrollCode: TScrollCode;
  var ScrollPos: Integer);
begin
{$IFDEF VCL}
  if FHScrollBar.HandleAllocated then
  begin
    CallWindowProc(DefWndProc, Handle, WM_HSCROLL, Word(ScrollCode) +
      Word(ScrollPos) shl 16, FHScrollBar.Handle);
    ScrollPos := GetScrollPos(Handle, SB_HORZ);
  end;
{$ENDIF}
end;

procedure TcxCustomInnerListBox.SetLookAndFeel(Value: TcxLookAndFeel);
begin
  FLookAndFeel.Assign(Value);
end;

procedure TcxCustomInnerListBox.VScrollHandler(Sender: TObject; ScrollCode: TScrollCode;
  var ScrollPos: Integer);
begin
{$IFDEF VCL}
  if FVScrollBar.HandleAllocated then
  begin
    CallWindowProc(DefWndProc, Handle, WM_VSCROLL, Word(ScrollCode) +
      Word(ScrollPos) shl 16, FVScrollBar.Handle);
    ScrollPos := GetScrollPos(Handle, SB_VERT);
  end;
{$ENDIF}
end;

{$IFNDEF DELPHI6}
function TcxCustomInnerListBox.GetScrollWidth: Integer;
begin
  Result := SendMessage(Handle, LB_GETHORIZONTALEXTENT, 0, 0);
end;

procedure TcxCustomInnerListBox.SetScrollWidth(const Value: Integer);
begin
  if Value <> ScrollWidth then
    SendMessage(Handle, LB_SETHORIZONTALEXTENT, Value, 0);
end;
{$ENDIF}

{$IFDEF VCL}
procedure TcxCustomInnerListBox.WMGetDlgCode(var Message: TWMGetDlgCode);
begin
  inherited;
  if Container <> nil then
    with Message do
    begin
      Result := Result or DLGC_WANTCHARS;
      if GetKeyState(VK_CONTROL) >= 0 then
        Result := Result or DLGC_WANTTAB;
    end;
end;

procedure TcxCustomInnerListBox.WMKillFocus(var Message: TWMKillFocus);
begin
  inherited;
  if (Container <> nil) and not Container.IsDestroying then
    Container.FocusChanged;
end;

procedure TcxCustomInnerListBox.WMNCCalcSize(var Message: TWMNCCalcSize);
begin
  inherited;
  if not FScrollBarsCalculating then
    SetExternalScrollBarsParameters;
end;

procedure TcxCustomInnerListBox.WMNCPaint(var Message: TMessage);
var
  DC: HDC;
  ABrush: HBRUSH;
begin
  inherited;
  if UsecxScrollBars and FHScrollBar.Visible and FVScrollBar.Visible then
  begin
    DC := GetWindowDC(Handle);
    ABrush := 0;
    try
      ABrush := CreateSolidBrush(ColorToRGB(clBtnFace));
      FillRect(DC, GetSizeGripRect, ABrush);
    finally
      if ABrush <> 0 then
        DeleteObject(ABrush);
      ReleaseDC(Handle, DC);
    end;
  end;
end;

procedure TcxCustomInnerListBox.WMSetFocus(var Message: TWMSetFocus);
begin
  inherited;
  if (Container <> nil) and not Container.IsDestroying and not(csDestroying in ComponentState)
      and (Message.FocusedWnd <> Container.Handle) then
    Container.FocusChanged;
end;

procedure TcxCustomInnerListBox.WMWindowPosChanged(var Message: TWMWindowPosChanged);
var
  ARgn: HRGN;
begin
  inherited;
  if csDestroying in ComponentState then
    Exit;
  if FHScrollBar.Visible and FVScrollBar.Visible then
  begin
    ARgn := CreateRectRgnIndirect(GetSizeGripRect);
    SendMessage(Handle, WM_NCPAINT, ARgn, 0);
    DeleteObject(ARgn);
  end;
end;

procedure TcxCustomInnerListBox.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  if Message.lParam = 0 then
    MouseEnter(Self)
  else
    MouseEnter(TControl(Message.lParam));
end;

procedure TcxCustomInnerListBox.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  if Message.lParam = 0 then
    MouseLeave(Self)
  else
    MouseLeave(TControl(Message.lParam));
end;
{$ENDIF}

{$IFDEF MSWINDOWS}
  {$IFNDEF VCL}
function TcxCustomInnerListBox.GetStyle: TListBoxStyle;
begin
  Result := inherited Style;
end;

procedure TcxCustomInnerListBox.SetStyle(Value: TListBoxStyle);
var
  APrevBorderStyle: TBorderStyle;
begin
  if Value <> Style then
  begin
    APrevBorderStyle := BorderStyle;
    try
      inherited Style := Value;
    finally
      BorderStyle := APrevBorderStyle;
    end;
  end;
end;
  {$ENDIF}
{$ENDIF}

{$IFDEF MSWINDOWS}
function WndProc(hWnd: HWND; Msg: Windows.UINT; WParam, LParam: Longint): Longint stdcall;
begin
  SetWindowLong(hwnd, GWL_WNDPROC, Longint(FOldWndProc));
  Result := 1;
end;
{$ENDIF}

{$IFDEF MSWINDOWS}
function ApplicationCallWndProcHookProc(Code: Integer;
  WParam, LParam: Longint): Longint stdcall;

  procedure LockMessage(AWnd: HWND);
  begin
    FOldWndProc := Pointer(GetWindowLong(AWnd, GWL_WNDPROC));
    SetWindowLong(AWnd, GWL_WNDPROC, Longint(@WndProc));
  end;

var
  AParentForm: TCustomForm;
  APopupWindow: TcxCustomPopupWindow;
  I, J: Integer;
begin
  if (FVisiblePopupWindowList.Count = 0) or (Code <> HC_ACTION) then
  begin
    Result := CallNextHookEx(FApplicationCallWndProcHook, Code, WParam, LParam);
    Exit;
  end;

  with Windows.PCWPStruct(LParam)^ do
    case message of
      WM_NCACTIVATE:
        if wParam = 0 then
          if FCaptionInactivationLocked then
            LockMessage(hwnd)
          else
            for I := 0 to FVisiblePopupWindowList.Count - 1 do
            begin
              APopupWindow := FVisiblePopupWindowList[I];
              if csDestroying in APopupWindow.ComponentState then
                Continue;
              AParentForm := GetParentForm(APopupWindow.OwnerControl);
              if (AParentForm <> nil) and (NativeHandle(AParentForm.Handle) = hwnd) then
                LockMessage(hwnd);
            end;

      WM_ACTIVATEAPP:
          if wParam = 0 then
  {$IFNDEF VCL}
          if FIsApplicationDeactivationLocked then
            LockMessage(hwnd)
          else
  {$ENDIF}
          begin
            I := 0;
            while I < FVisiblePopupWindowList.Count do
            begin
              APopupWindow := FVisiblePopupWindowList[I];
              AParentForm := GetParentForm(APopupWindow.OwnerControl);
              if AParentForm <> nil then
                PostMessage(NativeHandle(AParentForm.Handle), WM_NCACTIVATE, 0, 0);
  {$IFDEF VCL}
              if APopupWindow.CaptureFocus and APopupWindow.Active then
              begin
                Inc(I);
                Continue;
              end;
  {$ENDIF}
              APopupWindow.CloseUp(False);
              if APopupWindow.OwnerControl is TcxControl then
                TcxControlAccess(APopupWindow.OwnerControl).FocusChanged;
              I := 0;
            end;
          end;

      WM_DESTROY:
        for I := 0 to FVisiblePopupWindowList.Count - 1 do
        begin
          APopupWindow := FVisiblePopupWindowList[I];
          if csDestroying in APopupWindow.ComponentState then
            Continue;
          if HasNativeHandle(APopupWindow, hwnd) then
          begin
            APopupWindow.Close;
            if FVisiblePopupWindowList.IndexOf(APopupWindow) = -1 then
              with APopupWindow do
                if not (csDestroying in ComponentState) and FTerminateOnDestroy then
                  Application.Terminate;
            Break;
          end;
        end;

      WM_CLOSE:
        for I := 0 to FVisiblePopupWindowList.Count - 1 do
        begin
          APopupWindow := FVisiblePopupWindowList[I];
          if csDestroying in APopupWindow.ComponentState then
            Continue;
          if HasNativeHandle(APopupWindow, hwnd) then
          begin
            APopupWindow.Close;
            if (FVisiblePopupWindowList.IndexOf(APopupWindow) = -1) and
              APopupWindow.CaptureFocus and not(csDestroying in APopupWindow.OwnerControl.ComponentState) then
            begin
              AParentForm := GetParentForm(APopupWindow.OwnerControl);
              if (AParentForm <> nil) and AParentForm.HandleAllocated then
                SendMessage(NativeHandle(AParentForm.Handle), WM_CLOSE, 0, 0);
            end;
            Break;
          end;
          if not APopupWindow.CaptureFocus and not(csDestroying in APopupWindow.OwnerControl.ComponentState) then
          begin
            AParentForm := GetParentForm(APopupWindow.OwnerControl);
            if not AParentForm.HandleAllocated or HasNativeHandle(AParentForm, hwnd) then
              APopupWindow.CloseUp;
            Break;
          end;
        end;

      WM_SHOWWINDOW:
        if wParam = 0 then
          for I := FVisiblePopupWindowList.Count - 1 downto 0 do
          begin
            APopupWindow := FVisiblePopupWindowList[I];
            if csDestroying in APopupWindow.ComponentState then
              Continue;
            with APopupWindow.OwnerControl do
              if (csDestroying in ComponentState) or not HandleAllocated then
                Continue;
            if HasNativeHandle(APopupWindow.OwnerControl, hwnd) then
            begin
              for J := FVisiblePopupWindowList.Count - 1 downto I do
                TcxCustomPopupWindow(FVisiblePopupWindowList[J]).CloseUp;
              Break;
            end;
          end;

      WM_WINDOWPOSCHANGED:
        begin
          I := 0;
          while I < FVisiblePopupWindowList.Count do
          begin
            APopupWindow := FVisiblePopupWindowList[I];
            if (csDestroying in APopupWindow.ComponentState) or not APopupWindow.HandleAllocated then
            begin
              Inc(I);
              Continue;
            end;
            with APopupWindow.OwnerControl do
              if (csDestroying in ComponentState) or not HandleAllocated then
              begin
                Inc(I);
                Continue;
              end;
            if not HasNativeHandle(APopupWindow.OwnerControl, hwnd) then
            begin
              Inc(I);
              Continue;
            end;
            if InternalIsWindowVisible(APopupWindow.OwnerControl) then
              Inc(I)
            else
            begin
              APopupWindow.CloseUp;
              I := 0;
              Continue;
            end;
          end;
        end;
    end;
  Result := CallNextHookEx(FApplicationCallWndProcHook, Code, WParam, LParam);
end;

function ApplicationGetMessageMsgHookProc(Code: Integer;
  WParam, LParam: Longint):Longint stdcall;
var
  APMsg: Windows.PMSG;
  APopupWindow: TcxCustomPopupWindow;
begin
  if (FVisiblePopupWindowList.Count > 0) and (Code = HC_ACTION) and (WParam = PM_REMOVE) then
  begin
    APMsg := Windows.PMSG(LParam);
    if (APMsg^.message = WM_SYSKEYDOWN) and (FVisiblePopupWindowList.Count > 0) then
      with FVisiblePopupWindowList do
      begin
        APopupWindow := TcxCustomPopupWindow(Items[Count - 1]);
        if (not APopupWindow.CaptureFocus or not APopupWindow.ModalMode) and
            not APopupWindow.IsSysKeyAccepted(APMsg^.wParam) then
          APMsg^.message := 0;
      end;
  end;
  Result := CallNextHookEx(FApplicationGetMessageMsgHook, Code, WParam, LParam);
end;

function ApplicationMouseMsgHookProc(Code: Integer;
  WParam, LParam: Longint): Longint stdcall;

  function MDIParentOrAnotherMDIChild(APopupWindow: TcxCustomPopupWindow; AWnd: HWND): Boolean;
  var
    AMDIChildForm, AMDIParentForm: TCustomFormAccess;
    AMDIClientNativeHandle, AParentNativeHandle: HWND;
    AParentForm: TCustomForm;
    I, J: Integer;
  begin
    AParentForm := GetParentForm(APopupWindow.OwnerControl);
    AParentNativeHandle := GetParent(NativeHandle(AParentForm.Handle));
    Result := AParentNativeHandle = AWnd;
    if Result then
      Exit;
    for I := 0 to Screen.FormCount - 1 do
    begin
      AMDIParentForm := TCustomFormAccess(Screen.Forms[I]);
      if (AMDIParentForm.FormStyle = fsMDIForm) and (AMDIParentForm.ClientHandle <> {$IFDEF VCL}0{$ELSE}nil{$ENDIF}) then
      begin
        AMDIClientNativeHandle := NativeHandle(AMDIParentForm.ClientHandle);
        if AParentNativeHandle = AMDIClientNativeHandle then // TODO Check CLX
        begin
          Result := HasNativeHandle(AMDIParentForm, AWnd) or IsChildWindow(AMDIParentForm, AWnd);
          if Result then
            Break;

          for J := 0 to AMDIParentForm.MDIChildCount - 1 do
          begin
            AMDIChildForm := TCustomFormAccess(AMDIParentForm.MDIChildren[J]);
            if AMDIChildForm = AParentForm then
              Continue;
            Result := HasNativeHandle(AMDIChildForm, AWnd) or IsChildWindow(AMDIChildForm, AWnd);
            if Result then
              Break;
          end;

          Break;
        end;
      end;
    end;
  end;

  function CheckWindow(AWnd: HWND): Boolean;
  var
    I: Integer;
    ACallNextHook: Boolean;
    APopupWindow: TcxCustomPopupWindow;
    AParentForm: TCustomForm;
    R: TRect;
  begin
    Result := True;
    ACallNextHook := True;
  {$IFNDEF VCL}
    if not IsWindowEnabled(AWnd) then
      Exit;
  {$ENDIF}
    I := 0;
    while I < FVisiblePopupWindowList.Count do
    begin
      APopupWindow := TcxCustomPopupWindow(FVisiblePopupWindowList[I]);
      if APopupWindow.CaptureFocus and not APopupWindow.Active then
      begin
        Inc(I);
        Continue;
      end;
      with APopupWindow do
      begin
        if HasNativeHandle(APopupWindow, AWnd) or IsChildWindow(APopupWindow, AWnd) then
        begin
          Inc(I);
          Continue;
        end;
//        AParentForm := GetParentForm(OwnerControl);
//        if HasNativeHandle(AParentForm, AWnd) or IsChildWindow(AParentForm, AWnd) then
        if CheckParentsNativeHandle(OwnerControl, AWnd) then
        begin
          if HasNativeHandle(OwnerControl, AWnd) or IsChildWindow(OwnerControl, AWnd) then
            if (WParam = WM_LBUTTONDOWN) or (WParam = WM_LBUTTONDBLCLK) then
            begin
              R.TopLeft := OwnerParent.ClientToScreen(OwnerBounds.TopLeft);
              R.BottomRight := OwnerParent.ClientToScreen(OwnerBounds.BottomRight);
              if PtInRect(R, PMouseHookStruct(LParam)^.pt) then
              begin
                ACallNextHook := False;
                FJustClosed := True;
              end;
            end;

          FCaptionInactivationLocked := True;
          LockDeactivate(True);
          try
            APopupWindow.CloseUp(False);
            if not ACallNextHook and ((csDestroying in OwnerControl.ComponentState)
                or not OwnerControl.Visible) then
              Result := False;
          finally
            LockDeactivate(False);
            FCaptionInactivationLocked := False;
          end;
          I := 0;
        end
        else
        begin
          AParentForm := GetParentForm(OwnerControl);
          if (TCustomFormAccess(AParentForm).FormStyle = fsMDIChild) and
            MDIParentOrAnotherMDIChild(APopupWindow, AWnd) then
          begin
            APopupWindow.CloseUp(False);
            I := 0;
          end
          else
          begin
            Inc(I);
            Continue;
          end;
        end;
      end;
    end;
  end;

begin
  if (FVisiblePopupWindowList.Count > 0) and (Code = HC_ACTION) then
    case WParam of
      WM_NCLBUTTONDOWN,
      WM_NCLBUTTONDBLCLK,
      WM_LBUTTONDOWN,
      WM_LBUTTONDBLCLK:
        if not CheckWindow(PMouseHookStruct(LParam)^.hwnd) then
        begin
          Result := 1;
          Exit;
        end;
  {$IFNDEF VCL}
      WM_MOUSEWHEEL:
        with FVisiblePopupWindowList do
          if Count > 0 then
            TcxCustomPopupWindow(FVisiblePopupWindowList[Count - 1]).LockCloseUp(True);
  {$ENDIF}
    end;
  Result := CallNextHookEx(FApplicationMouseMsgHook, Code, WParam, LParam);
end;
{$ENDIF}
{$IFNDEF VCL}
{ TcxObjectEventFilter }

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
  AMouseEvent, ANewMouseEvent: QMouseEventH;
  AWidget: QWidgetH;
  PP: PPoint;
  P: TPoint;
  AControl: TWidgetControl;
  {$IFDEF LINUX}
  AParentForm: TCustomForm;
  APopupWindow: TcxCustomPopupWindow;
  I, J: Integer;
  R: TRect;
  {$ENDIF}
begin
  Result := False;

  {$IFDEF LINUX}
  if (QEvent_type(Event) = QEventType_FocusIn) and QObject_isWidgetType(Sender) and
      (FVisiblePopupWindowList.Count > 0) then
    begin
      AWidget := QWidgetH(Sender);
      for I := 0 to FVisiblePopupWindowList.Count - 1 do
      begin
        APopupWindow := TcxCustomPopupWindow(FVisiblePopupWindowList[I]);
        if not APopupWindow.CaptureFocus then
          Continue;
        if HasNativeHandle(APopupWindow.OwnerControl, AWidget) or
            IsChildWindow(APopupWindow.OwnerControl, AWidget) then
          APopupWindow.JustClosed := True;  
      end;
    end;
  {$ENDIF}

  if (QEvent_type(Event) in [QEventType_MouseMove, QEventType_MouseButtonRelease,
    QEventType_MouseButtonPress, QEventType_MouseButtonDblClick]) then
  begin
    AMouseEvent := QMouseEventH(Event);
    if (QWidget_mouseGrabber = nil) and (GetMouseGrabControl <> nil) then
      SetMouseGrabControl(nil);
    if (QWidget_mouseGrabber <> nil) and (GetMouseGrabControl = nil) then
    begin
      AControl := FindControl(QWidget_mouseGrabber);
      if AControl <> nil then
        SetMouseGrabControl(AControl);
    end;

    if {$IFDEF MSWINDOWS}GetCapture = 0{$ENDIF}{$IFDEF LINUX}QWidget_mouseGrabber = nil{$ENDIF} then
    begin
      PP := QMouseEvent_globalPos(AMouseEvent);
      AWidget := QApplication_widgetAt(PP, True);
  {$IFDEF LINUX}
      if QEvent_type(Event) = QEventType_MouseButtonPress then
      begin
        I := 0;
        while I < FVisiblePopupWindowList.Count do
        begin
          APopupWindow := FVisiblePopupWindowList[I];
          if HasNativeHandle(APopupWindow, AWidget) or IsChildWindow(APopupWindow, AWidget) then
          begin
            Inc(I);
            Continue;
          end;

          AParentForm := GetParentForm(APopupWindow.OwnerControl);
          if HasNativeHandle(AParentForm, AWidget) or IsChildWindow(AParentForm, AWidget) then
          begin
            if HasNativeHandle(APopupWindow.OwnerControl, AWidget) or IsChildWindow(APopupWindow.OwnerControl, AWidget) then
              APopupWindow.JustClosed := True;
            APopupWindow.CloseUp;
            Result := True;
            Exit;
          end
          else
          begin
            Inc(I);
            Continue;
          end;
        end;
      end;
  {$ENDIF}
      if (AWidget <> nil) and (AWidget <> Sender) and not(QEvent_type(Event) in [QEventType_MouseButtonPress{$IFDEF LINUX}{, QEventType_MouseButtonDblClick}{$ENDIF}]) then
      begin
        QWidget_mapFromGlobal(AWidget, @P, PP);
        ANewMouseEvent := QMouseEvent_create(QEvent_type(Event), @P, Integer(QMouseEvent_button(AMouseEvent)), Integer(QMouseEvent_state(AMouseEvent)));
          QApplication_sendEvent(AWidget, ANewMouseEvent);
      end;
    end
    else
      if (QWidget_mouseGrabber <> nil) and (QWidget_mouseGrabber <> Sender) then
      begin
        QCursor_pos(@P);
        QWidget_mapFromGlobal(QWidget_mouseGrabber, @P, @P);
        ANewMouseEvent := QMouseEvent_create(QEvent_type(Event), @P, Integer(QMouseEvent_button(AMouseEvent)), Integer(QMouseEvent_state(AMouseEvent)));
        QApplication_postEvent(QWidget_mouseGrabber, ANewMouseEvent);
        Result := True;
      end;
  end;
  {$IFDEF LINUX}
  if not QObject_isWidgetType(Sender) then
    Exit;
  case QEvent_type(Event) of
    QEventType_Hide:
      for I := FVisiblePopupWindowList.Count - 1 downto 0 do
      begin
        APopupWindow := FVisiblePopupWindowList[I];
        if (csDestroying in APopupWindow.ComponentState) then
          Continue;
        if HasNativeHandle(APopupWindow.OwnerControl, QWidgetH(Sender)) then
        begin
          for J := FVisiblePopupWindowList.Count - 1 downto I do
          begin
            APopupWindow := FVisiblePopupWindowList[J];
            APopupWindow.CloseUp;
          end;
          Break;
        end else
        if HasNativeHandle(APopupWindow, QWidgetH(Sender)) then
        begin
          if (QWidget_mouseGrabber <> nil) and HasNativeHandle(APopupWindow, QWidget_mouseGrabber) then
            SetMouseGrabControl(nil);
        end;
      end;

    QEventType_Close:
      for I := 0 to FVisiblePopupWindowList.Count - 1 do
      begin
        APopupWindow := FVisiblePopupWindowList[I];
        if HasNativeHandle(APopupWindow, QWidgetH(Sender)) then
        begin
          APopupWindow.Close;
          if FVisiblePopupWindowList.IndexOf(APopupWindow) = -1 then
            with APopupWindow do
              if not (csDestroying in ComponentState) and FTerminateOnDestroy then
                Application.Terminate;
          Break;
        end;
      end;
    QEventType_MouseButtonDblClick:
      begin
        if QApplication_activePopupWidget <> nil then
        begin
          AMouseEvent := QMouseEventH(Event);
          PP := QMouseEvent_globalPos(AMouseEvent);
          QWidget_mapFromGlobal(QApplication_activePopupWidget, @P, PP);

          QWidget_frameGeometry(QApplication_activePopupWidget, @R);
          OffsetRect(R, -R.Left, -R.Top);
          if not PtInRect(R, P) then
            Result := True;
        end;

        if FDblClickLocked then
          Result := True;
        FDblClickLocked := False;
      end;
    (*QEventType_FocusIn:
      for I := 0 to FVisiblePopupWindowList.Count - 1 do
      begin
        APopupWindow := FVisiblePopupWindowList[I];
        if APopupWindow.CaptureFocus and (HasNativeHandle(APopupWindow.OwnerControl, QWidgetH(Sender)) or
          IsChildWindow(APopupWindow.OwnerControl, QWidgetH(Sender))) then
        begin
          Inc(A);
          Application.MainForm.Caption := IntToStr(A);
          Result := True;
//          Break;
        end;
      end;*)
    end;
  {$ENDIF}
end;
{$ENDIF}

initialization
{$IFDEF VCL}
  SetGetScrollBarInfoProc;
{$ENDIF}
{$IFDEF DELPHI6}
  StartClassGroup(TControl);
  GroupDescendentsWith(TcxStyleController, TControl);
{$ENDIF}
  FVisiblePopupWindowList := TList.Create;
{$IFDEF MSWINDOWS}
  FApplicationCallWndProcHook := SetWindowsHookEx(WH_CALLWNDPROC,
    @ApplicationCallWndProcHookProc, 0, GetCurrentThreadID);
  FApplicationGetMessageMsgHook := SetWindowsHookEx(WH_GETMESSAGE,
    @ApplicationGetMessageMsgHookProc, 0, GetCurrentThreadID);
  FApplicationMouseMsgHook := SetWindowsHookEx(WH_MOUSE,
    @ApplicationMouseMsgHookProc, 0, GetCurrentThreadID);
{$ENDIF}
{$IFNDEF VCL}
  FObjectEventFilter := TcxObjectEventFilter.Create(Application.Handle);
{$ENDIF}
  FScreenCanvas := TcxScreenCanvas.Create;

finalization
  FreeAndNil(FScreenCanvas);
{$IFDEF MSWINDOWS}
  if FApplicationMouseMsgHook <> 0 then
    UnhookWindowsHookEx(FApplicationMouseMsgHook);
  FApplicationMouseMsgHook := 0;
  if FApplicationGetMessageMsgHook <> 0 then
    UnhookWindowsHookEx(FApplicationGetMessageMsgHook);
  FApplicationGetMessageMsgHook := 0;
  if FApplicationCallWndProcHook <> 0 then
    UnhookWindowsHookEx(FApplicationCallWndProcHook);
  FApplicationCallWndProcHook := 0;
{$ENDIF}
{$IFNDEF VCL}
  FreeAndNil(FObjectEventFilter);
{$ENDIF}
  FreeAndNil(FVisiblePopupWindowList);

end.
