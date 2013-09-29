{*******************************************************************}
{                                                                   }
{       Developer Express Visual Component Library                  }
{       ExpressDocking                                              }
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

unit dxDockControl;

{$I dxDockVer.inc}

interface

uses
  Windows, Graphics, Classes, Controls, ExtCtrls, Messages,
  Forms, Menus, ImgList, IniFiles, cxLookAndFeels;

const
  WM_DESTROYCONTROLS = WM_APP + 101;
  WM_HIDEFORM = WM_APP + 102;
  WM_SHOWFORM = WM_APP + 103;

type
  TdxDockingController = class;
  TdxCustomDockControl = class;

  TdxDockingState = (dsDestroyed, dsUndocked, dsHidden, dsDocked, dsFloating);
  TdxDockingTypeEx = (dtNone, dtClient, dtLeft, dtTop, dtRight, dtBottom);
  TdxDockingType = dtClient..dtBottom;
  TdxDockingTypes = set of TdxDockingType;
  TdxZoneDirection = (zdUndefined, zdVertical, zdHorizontal);

  TdxZone = class
  private
    FOwner: TdxCustomDockControl;
    FWidth: Integer;
  protected
    function GetDirection: TdxZoneDirection; virtual; abstract;
    function GetDockIndex: Integer; virtual;
    function GetDockType: TdxDockingType; virtual; abstract;
    function GetRectangle: TRect; virtual; abstract;
    function GetWidth: Integer; virtual;

    function CanConstrainedResize(NewWidth, NewHeight: Integer): Boolean; virtual;
    procedure DoDock(AControl: TdxCustomDockControl); virtual;
    procedure DoResize(StartPoint, EndPoint: TPoint); virtual;
    procedure DrawDockingSelection(DC: HDC; AControl: TdxCustomDockControl; pt: TPoint); virtual;
    procedure DrawResizingSelection(DC: HDC; pt: TPoint); virtual;
  public
    constructor Create(AOwner: TdxCustomDockControl; AWidth: Integer);

    function CanDock(AControl: TdxCustomDockControl): Boolean; virtual;
    function CanResize(StartPoint, EndPoint: TPoint): Boolean; virtual;
    function GetDockingSelection(AControl: TdxCustomDockControl): TRect; virtual;
    function GetResizingSelection(pt: TPoint): TRect; virtual;
    function IsZonePoint(pt: TPoint): Boolean; virtual;
    class function ValidateDockZone(AOwner, AControl: TdxCustomDockControl): Boolean; virtual;
    class function ValidateResizeZone(AOwner, AControl: TdxCustomDockControl): Boolean; virtual;

    property Direction: TdxZoneDirection read GetDirection;
    property DockType: TdxDockingType read GetDockType;
    property DockIndex: Integer read GetDockIndex;
    property Owner: TdxCustomDockControl read FOwner;
    property Rectangle: TRect read GetRectangle;
    property Width: Integer read GetWidth;
  end;

  TdxDockControlPainter = class;
  TdxDockControlPainterClass = class of TdxDockControlPainter;
  TdxLayoutDockSite = class;
  TdxContainerDockSite = class;
  TdxTabContainerDockSite = class;
  TdxSideContainerDockSite = class;
  TdxFloatDockSite = class;
  TdxFloatForm = class;
  TdxDockSite = class;
  TdxDockSiteAutoHideContainer = class;

  TdxAutoHidePosition = (ahpLeft, ahpTop, ahpRight, ahpBottom);
  TdxCaptionButton = (cbMaximize, cbHide, cbClose);
  TdxCaptionButtons = set of TdxCaptionButton;
  TdxDockPosition = record
    DockIndex: Integer;
    DockType: TdxDockingType;
    OriginalHeight: Integer;
    OriginalWidth: Integer;
    Parent: TdxCustomDockControl;
    SiblingAfter: TdxCustomDockControl;
    SiblingBefore: TdxCustomDockControl;
  end;

  TdxActivateEvent = procedure (Sender: TdxCustomDockControl; Active: Boolean) of object;
  TdxCanResizeEvent = procedure(Sender: TdxCustomDockControl; NewWidth, NewHeight: Integer;
    var Resize: Boolean) of object;
  TdxCreateFloatSiteEvent = procedure (Sender: TdxCustomDockControl;
    AFloatSite: TdxFloatDockSite) of object;
  TdxCreateLayoutSiteEvent = procedure (Sender: TdxCustomDockControl;
    ALayoutSite: TdxLayoutDockSite) of object;
  TdxCreateSideContainerEvent = procedure (Sender: TdxCustomDockControl;
    ASideContainer: TdxSideContainerDockSite) of object;
  TdxCreateTabContainerEvent = procedure (Sender: TdxCustomDockControl;
    ATabContainer: TdxTabContainerDockSite) of object;
  TdxCustomDrawSelectionEvent = procedure (Sender: TdxCustomDockControl; DC: HDC;
    Zone: TdxZone; ARect: TRect; Erasing: Boolean; var Handled: Boolean) of object;
  TdxDockControlCloseQueryEvent = procedure (Sender: TdxCustomDockControl;
    var CanClose: Boolean) of object;
  TdxDockControlNotifyEvent = procedure (Sender: TdxCustomDockControl) of object;
  TdxDockEvent = procedure (Sender, Site: TdxCustomDockControl; ADockType: TdxDockingType;
    AIndex: Integer) of object;
  TdxDockingEvent = procedure (Sender: TdxCustomDockControl; Zone: TdxZone;
    X, Y: Integer; var Accept: Boolean) of object;
  TdxEndDockingEvent = procedure (Sender: TdxCustomDockControl; Zone: TdxZone;
    X, Y: Integer) of object;
  TdxGetAutoHidePositionEvent = procedure (Sender: TdxCustomDockControl;
    var APosition: TdxAutoHidePosition) of object;
  TdxDockPositionEvent = procedure (Sender: TdxCustomDockControl;
    var APosition: TdxDockPosition) of object;
  TdxUpdateZonesEvent = procedure (Sender: TdxCustomDockControl; AZones: TList) of object;

  TdxMakeFloatingEvent = procedure (Sender: TdxCustomDockControl; X, Y: Integer) of object;
  TdxResizingEvent = procedure (Sender: TdxCustomDockControl; Zone: TdxZone; X, Y: Integer) of object;
  TdxStartDockingEvent = procedure (Sender: TdxCustomDockControl; X, Y: Integer) of object;
  TdxUnDockEvent = procedure (Sender, Site: TdxCustomDockControl) of object;

  TdxCustomDockControl = class(TCustomControl)
  private
    FAllowDock: TdxDockingTypes;
    FAllowDockClients: TdxDockingTypes;
    FAllowFloating: Boolean;
    FAutoHide: Boolean;
    FCanvasBitmap: TBitmap;
    FCaptionButtons: TdxCaptionButtons;
    FCursorPoint: TPoint;
    FDestroyed: Boolean;
    FDockable: Boolean;
    FDockControls: TList;
    FDockingOrigin: TPoint;
    FDockingPoint: TPoint;
    FDockingTargetZone: TdxZone;
    FDockType: TdxDockingTypeEx;
    FDockZones: TList;
    FImageIndex: Integer;
    FManagerColor: Boolean;
    FManagerFont: Boolean;
    FOriginalHeight: Integer;
    FOriginalWidth: Integer;
    FPainter: TdxDockControlPainter;
    FParentDockControl: TdxCustomDockControl;
    FResizeZones: TList;
    FResizingOrigin: TPoint;
    FResizingPoint: TPoint;
    FResizingSourceZone: TdxZone;
    FSavedCaptureControl: TControl;
    FShowCaption: Boolean;
    FSourcePoint: TPoint;
    FUpdateLayoutLock: Integer;
    FUpdateVisibilityLock: Integer;

    FCaptionIsDown: Boolean;
    FCloseButtonIsDown: Boolean;
    FCloseButtonIsHot: Boolean;
    FHideButtonIsDown: Boolean;
    FHideButtonIsHot: Boolean;
    FMaximizeButtonIsDown: Boolean;
    FMaximizeButtonIsHot: Boolean;
    FCaptionRect: TRect;
    FCaptionTextRect: TRect;
    FCaptionCloseButtonRect: TRect;
    FCaptionHideButtonRect: TRect;
    FCaptionMaximizeButtonRect: TRect;
    FSavedClientRect: TRect;
    FStoredAutoHide: Boolean;
    FStoredPosition: TdxDockPosition;
    FUseDoubleBuffer: Boolean;
    FWindowRect: TRect;

    FOnActivate: TdxActivateEvent;
    FOnAutoHideChanging: TdxDockControlNotifyEvent;
    FOnAutoHideChanged: TdxDockControlNotifyEvent;
    FOnCanResize: TdxCanResizeEvent;
    FOnClose: TdxDockControlNotifyEvent;
    FOnCloseQuery: TdxDockControlCloseQueryEvent;
    FOnCreateFloatSite: TdxCreateFloatSiteEvent;
    FOnCreateLayoutSite: TdxCreateLayoutSiteEvent;
    FOnCreateSideContainer: TdxCreateSideContainerEvent;
    FOnCreateTabContainer: TdxCreateTabContainerEvent;
    FOnCustomDrawDockingSelection: TdxCustomDrawSelectionEvent;
    FOnCustomDrawResizingSelection: TdxCustomDrawSelectionEvent;
    FOnDock: TdxDockEvent;
    FOnDocking: TdxDockingEvent;
    FOnEndDocking: TdxEndDockingEvent;
    FOnEndResizing: TdxResizingEvent;
    FOnGetAutoHidePosition: TdxGetAutoHidePositionEvent;
    FOnLayoutChanged: TdxDockControlNotifyEvent;
    FOnMakeFloating: TdxMakeFloatingEvent;
    FOnParentChanged: TdxDockControlNotifyEvent;
    FOnParentChanging: TdxDockControlNotifyEvent;
    FOnResizing: TdxResizingEvent;
    FOnRestoreDockPosition: TdxDockPositionEvent;
    FOnStartDocking: TdxStartDockingEvent;
    FOnStartResizing: TdxResizingEvent;
    FOnStoreDockPosition: TdxDockPositionEvent;
    FOnUnDock: TdxUnDockEvent;
    FOnUpdateDockZones: TdxUpdateZonesEvent;
    FOnUpdateResizeZones: TdxUpdateZonesEvent;
    FOnVisibleChanged: TdxDockControlNotifyEvent;
    FOnVisibleChanging: TdxDockControlNotifyEvent;

    function IsColorStored: Boolean;
    function IsFontStored: Boolean;
    function GetController: TdxDockingController;
    function GetDockIndex: Integer;
    function GetDockLevel: Integer;
    function GetDockingRect: TRect;
    function GetDockState: TdxDockingState;
    function GetChild(Index: Integer): TdxCustomDockControl;
    function GetChildCount: Integer;
    function GetImages: TImageList;
    function GetPainter: TdxDockControlPainter;
    procedure SetAllowDock(const Value: TdxDockingTypes);
    procedure SetAllowDockClients(const Value: TdxDockingTypes);
    procedure SetAllowFloating(const Value: Boolean);
    procedure SetAutoHide(const Value: Boolean);
    procedure SetCaptionButtons(Value: TdxCaptionButtons);
    procedure SetDockable(const Value: Boolean);
    procedure SetDockType(Value: TdxDockingType);
    procedure SetImageIndex(const Value: Integer);
    procedure SetManagerColor(const Value: Boolean);
    procedure SetManagerFont(const Value: Boolean);
    procedure SetParentDockControl(Value: TdxCustomDockControl);
    procedure SetShowCaption(const Value: Boolean);
    procedure SetUseDoubleBuffer(const Value: Boolean);

    procedure ReadDockType(Reader: TReader);
    procedure ReadOriginalWidth(Reader: TReader);
    procedure ReadOriginalHeight(Reader: TReader);
    procedure WriteDockType(Writer: TWriter);
    procedure WriteOriginalWidth(Writer: TWriter);
    procedure WriteOriginalHeight(Writer: TWriter);

    procedure AddDockControl(AControl: TdxCustomDockControl; AIndex: Integer);
    procedure RemoveDockControl(AControl: TdxCustomDockControl);
    function IndexOfControl(AControl: TdxCustomDockControl): Integer;
    procedure ClearZones(AZones: TList);

    procedure CMDesignHitTest(var Message: TCMDesignHitTest); message CM_DESIGNHITTEST;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure CMColorChanged(var Message: TMessage); message CM_COLORCHANGED;
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;
    procedure CMVisibleChanged(var Message: TMessage); message CM_VISIBLECHANGED;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure CNKeyDown(var Message: TWMKeyDown); message CN_KEYDOWN;
    procedure CNKeyUp(var Message: TWMKeyUp); message CN_KEYUP;
    {$IFDEF DELPHI5}
    procedure WMContextMenu(var Message: TWMContextMenu); message WM_CONTEXTMENU;
    {$ENDIF}
    procedure WMEraseBkgnd(var Message: TWmEraseBkgnd); message WM_ERASEBKGND;
    procedure WMMouseActivate(var Message: TWMMouseActivate); message WM_MOUSEACTIVATE;
    procedure WMMove(var Message: TWMMove); message WM_MOVE;
    procedure WMMouseMove(var Message: TWMMouseMove); message WM_MOUSEMOVE;
    procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
    procedure WMLButtonUp(var Message: TWMLButtonUp); message WM_LBUTTONUP;
    procedure WMLButtonDblClk(var Message: TWMLButtonDblClk); message WM_LBUTTONDBLCLK;
    procedure WMNCCalcSize(var Message: TWMNCCalcSize); message WM_NCCALCSIZE;
    procedure WMNCHitTest(var Message: TWMNCHitTest); message WM_NCHITTEST;
    procedure WMNCPaint(var Message: TWMNCPaint); message WM_NCPAINT;
    procedure WMSetCursor(var Message: TWMSetCursor); message WM_SETCURSOR;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
  protected
    procedure AlignControls(AControl: TControl; var Rect: TRect); override;
    procedure CreateHandle; override;
    procedure DefineProperties(Filer: TFiler); override;
    procedure Loaded; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure ReadState(Reader: TReader); override;
    procedure SetParent(AParent: TWinControl); override;
    procedure VisibleChanging; override;

    function IsDesigning: Boolean;
    function IsDestroying: Boolean;
    function IsLoading: Boolean;
    procedure CaptureMouse;
    procedure ReleaseMouse;
    // Designer
    procedure Modified;
    procedure NoSelection;
    procedure SelectComponent(AComponent: TComponent);
    function UniqueName: string;
    // Resizing
    function CanResizing(NewWidth, NewHeight: Integer): Boolean; virtual;
    function CanResizeAtPos(pt: TPoint): Boolean; virtual;
    function DoCustomDrawResizingSelection(DC: HDC; AZone: TdxZone; pt: TPoint; Erasing: Boolean): Boolean;
    procedure DoStartResize(pt: TPoint);
    procedure DoEndResize(pt: TPoint);
    procedure DoResizing(pt: TPoint);

    procedure DrawResizingSelection(AZone: TdxZone; pt: TPoint; Erasing: Boolean);
    procedure StartResize(pt: TPoint); virtual;
    procedure Resizing(pt: TPoint); virtual;
    procedure EndResize(pt: TPoint; Cancel: Boolean); virtual;
    // Resizing zones
    procedure DoUpdateResizeZones;
    procedure UpdateControlResizeZones(AControl: TdxCustomDockControl); virtual;
    procedure UpdateResizeZones;
    // Docking
    function GetDockingTargetControlAtPos(pt: TPoint): TdxCustomDockControl;
    function GetFloatDockRect(pt: TPoint): TRect;
    function DoCustomDrawDockingSelection(DC: HDC; AZone: TdxZone; R: TRect; Erasing: Boolean): Boolean;
    procedure DoStartDocking(pt: TPoint);
    procedure DoEndDocking(pt: TPoint);
    procedure DoDocking(pt: TPoint; TargetZone: TdxZone; var Accept: Boolean);

    procedure DrawDockingSelection(AZone: TdxZone; pt: TPoint; Erasing: Boolean);
    procedure StartDocking(pt: TPoint); virtual;
    procedure Docking(pt: TPoint); virtual;
    procedure EndDocking(pt: TPoint; Cancel: Boolean); virtual;
    procedure CheckDockRules; virtual;
    procedure CheckDockClientsRules; virtual;
    // Docking zones
    procedure DoUpdateDockZones;
    procedure UpdateControlDockZones(AControl: TdxCustomDockControl; AZoneWidth: Integer); virtual;
    procedure UpdateDockZones;
    // Control layout
    procedure DoParentChanged;
    procedure DoParentChanging;

    procedure IncludeToDock(AControl: TdxCustomDockControl; AType: TdxDockingType;
      Index: Integer); virtual;
    procedure ExcludeFromDock; virtual;
    procedure CreateLayout(AControl: TdxCustomDockControl; AType: TdxDockingType;
      Index: Integer); virtual;
    procedure DestroyLayout(AControl: TdxCustomDockControl); virtual;
    procedure RemoveFromLayuot; virtual;
    procedure UpdateLayout; virtual;
    procedure DoLayoutChanged;
    procedure BeginUpdateLayout;
    procedure EndUpdateLayout;
    procedure LoadLayoutFromCustomIni(AIniFlie: TCustomIniFile;
      AParentControl: TdxCustomDockControl; ASection: string); virtual;
    procedure SaveLayoutToCustomIni(AIniFlie: TCustomIniFile; ASection: string); virtual;
    property UpdateLayoutLock: Integer read FUpdateLayoutLock;

    function InDockControl(AControl: TdxCustomDockControl): Boolean;
    function GetParentDockControl: TdxCustomDockControl; virtual;
    function GetParentForm: TCustomForm; virtual;
    function GetParentFormActive: Boolean; virtual;
    function GetTopMostDockControl: TdxCustomDockControl; virtual;
    // Layout site
    procedure DoCreateLayoutSite(ASite: TdxLayoutDockSite);
    function GetLayoutDockSite: TdxLayoutDockSite; virtual;
    // Container site
    procedure CreateContainerLayout(AContainer: TdxContainerDockSite;
      AControl: TdxCustomDockControl; AType: TdxDockingType; Index: Integer);
    function GetContainer: TdxContainerDockSite; virtual;
    // SideContainer site
    function CanAcceptSideContainerItems(AContainer: TdxSideContainerDockSite): Boolean; virtual;
    procedure DoCreateSideContainerSite(ASite: TdxSideContainerDockSite);
    procedure CreateSideContainerLayout(AControl: TdxCustomDockControl;
      AType: TdxDockingType; Index: Integer); virtual;
    procedure DoMaximize; virtual;
    function GetSideContainer: TdxSideContainerDockSite; virtual;
    function GetSideContainerItem: TdxCustomDockControl; virtual;
    function GetSideContainerIndex: Integer; virtual;
    function GetMinimizedHeight: Integer; virtual;
    function GetMinimizedWidth: Integer; virtual;
    // TabContainer site
    function CanAcceptTabContainerItems(AContainer: TdxTabContainerDockSite): Boolean; virtual;
    procedure DoCreateTabContainerSite(ASite: TdxTabContainerDockSite);
    procedure CreateTabContainerLayout(AControl: TdxCustomDockControl;
      AType: TdxDockingType; Index: Integer); virtual;
    function GetTabContainer: TdxTabContainerDockSite; virtual;
    // AutoHide
    procedure AutoHideChanged; virtual;
    procedure DoAutoHideChanged;
    procedure DoAutoHideChanging;
    function GetControlAutoHidePosition(AControl: TdxCustomDockControl): TdxAutoHidePosition; virtual;
    function GetAutoHideHostSite: TdxDockSite; virtual;
    function GetAutoHideContainer: TdxDockSiteAutoHideContainer; virtual;
    function GetAutoHideControl: TdxCustomDockControl; virtual;
    function GetAutoHidePosition: TdxAutoHidePosition;
    procedure ChangeAutoHide; virtual;
    // AutoSize
    function GetAutoSizeHostSite: TdxDockSite; virtual;
    // Floating site
    procedure DoCreateFloatSite(ASite: TdxFloatDockSite);
    function GetFloatDockSite: TdxFloatDockSite; virtual;
    function GetFloatForm: TdxFloatForm; virtual;
    function GetFloatFormActive: Boolean; virtual;
    function GetFloatFormVisible: Boolean; virtual;
    procedure StoreDockPosition(pt: TPoint); virtual;
    procedure RestoreDockPosition(pt: TPoint); virtual;
    // Caption
    procedure UpdateCaption; virtual;
    // Control bounds
    procedure AdjustControlBounds(AControl: TdxCustomDockControl); virtual;
    procedure UpdateControlOriginalSize(AControl: TdxCustomDockControl); virtual;
    procedure UpdateOriginalSize;
    // Activation
    procedure Activate; virtual;
    procedure DoActiveChanged(AActive: Boolean); virtual;
    function IsActive: Boolean; virtual;
    // Closing
    procedure DoClose; virtual;
    // Destroying
    function CanDestroy: Boolean; virtual;
    procedure DoDestroy; virtual;
    // Control visibility
    procedure ChildVisibilityChanged(Sender: TdxCustomDockControl); virtual;
    procedure DoVisibleChanged;
    procedure DoVisibleChanging;
    procedure BeginUpdateVisibility;
    procedure EndUpdateVisibility;
    procedure SetVisibility(Value: Boolean);
    procedure UpdateAutoHideControlsVisibility; virtual;
    procedure UpdateLayoutControlsVisibility; virtual;
    procedure UpdateParentControlsVisibility; virtual;
    procedure UpdateRelatedControlsVisibility; virtual;
    property UpdateVisibilityLock: Integer read FUpdateVisibilityLock;
    // Painting
    function ClientToWindow(pt: TPoint): TPoint;
    function ScreenToWindow(pt: TPoint): TPoint;
    function WindowToClient(pt: TPoint): TPoint;
    function WindowToScreen(pt: TPoint): TPoint;
    procedure CalculateNC(var ARect: TRect); virtual;
    procedure InvalidateNC(ANeedRecalculate: Boolean);
    procedure NCChanged;
    procedure BeginUpdateNC;
    procedure EndUpdateNC;
    function CanUpdateNC: Boolean;
    function CanCalculateNC: Boolean;
    function HasBorder: Boolean; virtual;
    function HasCaption: Boolean; virtual;
    function HasCaptionCloseButton: Boolean; virtual;
    function HasCaptionHideButton: Boolean; virtual;
    function HasCaptionMaximizeButton: Boolean; virtual;
    function IsCaptionActive: Boolean; virtual;
    function IsCaptionVertical: Boolean; virtual;
    function IsCaptionPoint(pt: TPoint): Boolean;
    function IsCaptionCloseButtonPoint(pt: TPoint): Boolean;
    function IsCaptionHideButtonPoint(pt: TPoint): Boolean;
    function IsCaptionMaximizeButtonPoint(pt: TPoint): Boolean;
    procedure NCPaint(ACanvas: TCanvas); virtual;
    procedure Paint; override;
    property Painter: TdxDockControlPainter read GetPainter;

    property CaptionRect: TRect read FCaptionRect;
    property CaptionTextRect: TRect read FCaptionTextRect;
    property CaptionCloseButtonRect: TRect read FCaptionCloseButtonRect;
    property CaptionHideButtonRect: TRect read FCaptionHideButtonRect;
    property CaptionMaximizeButtonRect: TRect read FCaptionMaximizeButtonRect;
    property WindowRect: TRect read FWindowRect;

    property CaptionIsDown: Boolean read FCaptionIsDown;
    property CloseButtonIsDown: Boolean read FCloseButtonIsDown;
    property CloseButtonIsHot: Boolean read FCloseButtonIsHot;
    property HideButtonIsDown: Boolean read FHideButtonIsDown;
    property HideButtonIsHot: Boolean read FHideButtonIsHot;
    property MaximizeButtonIsDown: Boolean read FMaximizeButtonIsDown;
    property MaximizeButtonIsHot: Boolean read FMaximizeButtonIsHot;

    property CursorPoint: TPoint read FCursorPoint write FCursorPoint;
    property DockingOrigin: TPoint read FDockingOrigin;
    property DockingPoint: TPoint read FDockingPoint;
    property DockingRect: TRect read GetDockingRect;
    property DockingTargetZone: TdxZone read FDockingTargetZone;
    property ResizingOrigin: TPoint read FResizingOrigin;
    property ResizingPoint: TPoint read FResizingPoint;
    property ResizingSourceZone: TdxZone read FResizingSourceZone;
    property SourcePoint: TPoint read FSourcePoint write FSourcePoint;

    property StoredAutoHide: Boolean read FStoredAutoHide;
    property StoredPosition: TdxDockPosition read FStoredPosition;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure BeforeDestruction; override;
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;

    function CanActive: Boolean; virtual;
    function CanAutoHide: Boolean; virtual;
    function CanDock: Boolean; virtual;
    function CanDockHost(AControl: TdxCustomDockControl; AType: TdxDockingType): Boolean; virtual;
    function CanMaximize: Boolean; virtual;
    function GetDockZoneAtPos(AControl: TdxCustomDockControl; pt: TPoint): TdxZone; virtual;
    function GetResizeZoneAtPos(pt: TPoint): TdxZone; virtual;

    procedure Close;
    procedure MakeFloating; overload;
    procedure MakeFloating(XPos, YPos: Integer); overload;
    procedure DockTo(AControl: TdxCustomDockControl; AType: TdxDockingType; AIndex: Integer);
    procedure UnDock;

    property AllowDock: TdxDockingTypes read FAllowDock write SetAllowDock default [dtClient, dtLeft, dtTop, dtRight, dtBottom];
    property AllowDockClients: TdxDockingTypes read FAllowDockClients write SetAllowDockClients default [dtClient, dtLeft, dtTop, dtRight, dtBottom];
    property AllowFloating: Boolean read FAllowFloating write SetAllowFloating;
    property AutoHide: Boolean read FAutoHide write SetAutoHide;
    property AutoHideHostSite: TdxDockSite read GetAutoHideHostSite;
    property AutoHideContainer: TdxDockSiteAutoHideContainer read GetAutoHideContainer;
    property AutoHideControl: TdxCustomDockControl read GetAutoHideControl;
    property AutoSizeHostSite: TdxDockSite read GetAutoSizeHostSite;
    property Caption;
    property CaptionButtons: TdxCaptionButtons read FCaptionButtons write SetCaptionButtons default [cbClose, cbHide, cbMaximize];
    property ChildCount: Integer read GetChildCount;
    property Children[Index: Integer]: TdxCustomDockControl read GetChild;
    property Container: TdxContainerDockSite read GetContainer;
    property Controller: TdxDockingController read GetController;
    property Dockable: Boolean read FDockable write SetDockable default True;
    property DockIndex: Integer read GetDockIndex;
    property DockLevel: Integer read GetDockLevel;
    property DockState: TdxDockingState read GetDockState;
    property DockType: TdxDockingTypeEx read FDockType;
    property DockZones: TList read FDockZones;
    property FloatForm: TdxFloatForm read GetFloatForm;
    property FloatFormActive: Boolean read GetFloatFormActive;
    property FloatFormVisible: Boolean read GetFloatFormVisible;
    property FloatDockSite: TdxFloatDockSite read GetFloatDockSite;
    property ImageIndex: Integer read FImageIndex write SetImageIndex default -1;
    property Images: TImageList read GetImages;
    property LayoutDockSite: TdxLayoutDockSite read GetLayoutDockSite;
    property OriginalHeight: Integer read FOriginalHeight;
    property OriginalWidth: Integer read FOriginalWidth;
    property ParentDockControl: TdxCustomDockControl read GetParentDockControl;
    property ParentForm: TCustomForm read GetParentForm;
    property ParentFormActive: Boolean read GetParentFormActive;
    property ResizeZones: TList read FResizeZones write FResizeZones;
    property ShowCaption: Boolean read FShowCaption write SetShowCaption default True;
    property SideContainer: TdxSideContainerDockSite read GetSideContainer;
    property SideContainerItem: TdxCustomDockControl read GetSideContainerItem;
    property SideContainerIndex: Integer read GetSideContainerIndex;
    property TabContainer: TdxTabContainerDockSite read GetTabContainer;
    property TopMostDockControl: TdxCustomDockControl read GetTopMostDockControl;
    property UseDoubleBuffer: Boolean read FUseDoubleBuffer write SetUseDoubleBuffer;

    property OnActivate: TdxActivateEvent read FOnActivate write FOnActivate;
    property OnAutoHideChanged: TdxDockControlNotifyEvent read FOnAutoHideChanged
      write FOnAutoHideChanged;
    property OnAutoHideChanging: TdxDockControlNotifyEvent read FOnAutoHideChanging
      write FOnAutoHideChanging;
    property OnCanResize: TdxCanResizeEvent read FOnCanResize write FOnCanResize;
    property OnClose: TdxDockControlNotifyEvent read FOnClose write FOnClose;
    property OnCloseQuery: TdxDockControlCloseQueryEvent read FOnCloseQuery write FOnCloseQuery;
    property OnCreateFloatSite: TdxCreateFloatSiteEvent read FOnCreateFloatSite
      write FOnCreateFloatSite;
    property OnCreateLayoutSite: TdxCreateLayoutSiteEvent read FOnCreateLayoutSite
      write FOnCreateLayoutSite;
    property OnCreateSideContainer: TdxCreateSideContainerEvent read FOnCreateSideContainer
      write FOnCreateSideContainer;
    property OnCreateTabContainer: TdxCreateTabContainerEvent read FOnCreateTabContainer
      write FOnCreateTabContainer;
    property OnCustomDrawDockingSelection: TdxCustomDrawSelectionEvent read FOnCustomDrawDockingSelection
      write FOnCustomDrawDockingSelection;
    property OnCustomDrawResizingSelection: TdxCustomDrawSelectionEvent read FOnCustomDrawResizingSelection
      write FOnCustomDrawResizingSelection;
    property OnDock: TdxDockEvent read FOnDock write FOnDock;
    property OnDocking: TdxDockingEvent read FOnDocking write FOnDocking;
    property OnEndDocking: TdxEndDockingEvent read FOnEndDocking write FOnEndDocking;
    property OnEndResizing: TdxResizingEvent read FOnEndResizing write FOnEndResizing;
    property OnGetAutoHidePosition: TdxGetAutoHidePositionEvent read FOnGetAutoHidePosition
      write FOnGetAutoHidePosition;
    property OnLayoutChanged: TdxDockControlNotifyEvent read FOnLayoutChanged
      write FOnLayoutChanged;
    property OnMakeFloating: TdxMakeFloatingEvent read FOnMakeFloating write FOnMakeFloating;
    property OnResize;
    property OnResizing: TdxResizingEvent read FOnResizing write FOnResizing;
    property OnRestoreDockPosition: TdxDockPositionEvent read FOnRestoreDockPosition
      write FOnRestoreDockPosition;
    property OnStartDocking: TdxStartDockingEvent read FOnStartDocking write FOnStartDocking;
    property OnStartResizing: TdxResizingEvent read FOnStartResizing write FOnStartResizing;
    property OnStoreDockPosition: TdxDockPositionEvent read FOnStoreDockPosition
      write FOnStoreDockPosition;
    property OnUnDock: TdxUnDockEvent read FOnUnDock write FOnUnDock;
    property OnUpdateDockZones: TdxUpdateZonesEvent read FOnUpdateDockZones
      write FOnUpdateDockZones;
    property OnUpdateResizeZones: TdxUpdateZonesEvent read FOnUpdateResizeZones
      write FOnUpdateResizeZones;
  published
    property Color stored IsColorStored;
    property Font stored IsFontStored;
    property ManagerColor: Boolean read FManagerColor write SetManagerColor default True;
    property ManagerFont: Boolean read FManagerFont write SetManagerFont default True;
    property ParentColor default False;
    property ParentFont default False;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;

    {$IFDEF DELPHI5}
    property OnContextPopup;
    {$ENDIF}
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnParentChanged: TdxDockControlNotifyEvent read FOnParentChanged write FOnParentChanged;
    property OnParentChanging: TdxDockControlNotifyEvent read FOnParentChanging write FOnParentChanging;
    property OnVisibleChanged: TdxDockControlNotifyEvent read FOnVisibleChanged write FOnVisibleChanged;
    property OnVisibleChanging: TdxDockControlNotifyEvent read FOnVisibleChanging write FOnVisibleChanging;
  end;
  TdxCustomDockControlClass = class of TdxCustomDockControl;

  TdxCustomDockSite = class(TdxCustomDockControl)
  protected
    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
    procedure ValidateInsert(AComponent: TComponent); override;
  published
    property AllowDockClients;
    property OnLayoutChanged;
    property OnUpdateDockZones;
    property OnUpdateResizeZones;
  end;

  TdxLayoutDockSite = class(TdxCustomDockSite)
  private
    procedure WMNCHitTest(var Message: TWMNCHitTest); message WM_NCHITTEST;
  protected
    procedure SetParent(AParent: TWinControl); override;
    // Docking zones
    procedure UpdateControlDockZones(AControl: TdxCustomDockControl; AZoneWidth: Integer); override;
    // Sibling control
    function GetSiblingDockControl: TdxCustomDockControl; virtual;
    // Destroying
    function CanDestroy: Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure BeforeDestruction; override;
    function CanDockHost(AControl: TdxCustomDockControl; AType: TdxDockingType): Boolean; override;

    property SiblingDockControl: TdxCustomDockControl read GetSiblingDockControl;
  published
    property OnCreateLayoutSite;
  end;

  TdxActiveChildChangeEvent = procedure (Sender: TdxContainerDockSite; Child: TdxCustomDockControl) of object;

  TdxContainerDockSite = class(TdxCustomDockSite)
  private
    FActiveChild: TdxCustomDockControl;
    FActiveChildIndex: Integer;
    FOnActiveChildChanged: TdxActiveChildChangeEvent;

    function GetActiveChildIndex: Integer;
    function GetValidChildCount: Integer;
    function GetValidChild(Index: Integer): TdxCustomDockControl;
    procedure SetActiveChild(const Value: TdxCustomDockControl);
    procedure SetActiveChildIndex(const Value: Integer);
  protected
    procedure Loaded; override;
    procedure SetParent(AParent: TWinControl); override;
    // Site layout
    procedure CreateLayout(AControl: TdxCustomDockControl; AType: TdxDockingType;
      Index: Integer); override;
    procedure DestroyLayout(AControl: TdxCustomDockControl); override;
    procedure UpdateLayout; override;
    procedure LoadLayoutFromCustomIni(AIniFlie: TCustomIniFile;
      AParentControl: TdxCustomDockControl; ASection: string); override;
    procedure SaveLayoutToCustomIni(AIniFlie: TCustomIniFile; ASection: string); override;
    // AutoHide
    function GetControlAutoHidePosition(AControl: TdxCustomDockControl): TdxAutoHidePosition; override;
    // Control visibility
    procedure ChildVisibilityChanged(Sender: TdxCustomDockControl); override;
    // Children layout
    procedure DoActiveChildChanged; virtual;
    class function GetHeadDockType: TdxDockingType; virtual;
    class function GetTailDockType: TdxDockingType; virtual;
    function GetFirstValidChild: TdxCustomDockControl;
    function GetFirstValidChildIndex: Integer;
    function GetLastValidChild: TdxCustomDockControl;
    function GetLastValidChildIndex: Integer;
    function GetNextValidChild(AIndex: Integer): TdxCustomDockControl;
    function GetNextValidChildIndex(AIndex: Integer): Integer;
    function GetPrevValidChild(AIndex: Integer): TdxCustomDockControl;
    function GetPrevValidChildIndex(AIndex: Integer): Integer;
    function IsValidActiveChild(AControl: TdxCustomDockControl): Boolean; virtual;
    function IsValidChild(AControl: TdxCustomDockControl): Boolean; virtual;
    procedure ValidateActiveChild(AIndex: Integer); virtual;
  public
    constructor Create(AOwner: TComponent); override;

    function CanContainerDockHost(AType: TdxDockingType): Boolean; virtual;
    function CanDock: Boolean; override;
    function CanDockHost(AControl: TdxCustomDockControl; AType: TdxDockingType): Boolean; override;

    property ActiveChild: TdxCustomDockControl read FActiveChild write SetActiveChild;
    property ValidChildCount: Integer read GetValidChildCount;
    property ValidChildren[Index: Integer]: TdxCustomDockControl read GetValidChild;
  published
    property ActiveChildIndex: Integer read GetActiveChildIndex write SetActiveChildIndex;
    property AllowDock;
    property AllowFloating;
    
    property OnActiveChildChanged: TdxActiveChildChangeEvent read FOnActiveChildChanged write FOnActiveChildChanged;
    property OnCanResize;
    property OnCreateFloatSite;
    property OnCustomDrawDockingSelection;
    property OnCustomDrawResizingSelection;
    property OnEndResizing;
    property OnResize;
    property OnResizing;
    property OnRestoreDockPosition;
    property OnStartResizing;
    property OnStoreDockPosition;
  end;
  TdxContainerDockSiteClass = class of TdxContainerDockSite;

  TdxTabContainerTabsPosition = (tctpTop, tctpBottom);
  TdxTabContainerDockSite = class(TdxContainerDockSite)
  private
    FFirstVisibleTabIndex: Integer;
    FPressedTabIndex: Integer;
    FTabsPosition: TdxTabContainerTabsPosition;
    FTabsRect: TRect;
    FTabsRects: array of TRect;
    FTabsNextTabButtonRect: TRect;
    FTabsPrevTabButtonRect: TRect;
    FTabsScroll: Boolean;

    FTabsNextTabButtonIsDown: Boolean;
    FTabsNextTabButtonIsEnabled: Boolean;
    FTabsNextTabButtonIsHot: Boolean;
    FTabsPrevTabButtonIsDown: Boolean;
    FTabsPrevTabButtonIsEnabled: Boolean;
    FTabsPrevTabButtonIsHot: Boolean;

    function GetLastVisibleTabIndex: Integer;
    function GetTabRectCount: Integer;
    function GetTabRect(Index: Integer): TRect;
    function GetTabsButtonsVisible: Boolean;
    procedure SetTabsPosition(const Value: TdxTabContainerTabsPosition);
    procedure SetTabsScroll(const Value: Boolean);

    procedure DecFirstVisibleTabIndex;
    procedure IncFirstVisibleTabIndex;
    procedure UpdateButtonsState;

    procedure CMDesignHitTest(var Message: TCMDesignHitTest); message CM_DESIGNHITTEST;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
    procedure WMLButtonUp(var Message: TWMLButtonUp); message WM_LBUTTONUP;
    procedure WMLButtonDblClk(var Message: TWMLButtonDblClk); message WM_LBUTTONDBLCLK;
    procedure WMMouseMove(var Message: TWMMouseMove); message WM_MOUSEMOVE;
  protected
    // Resizing
    function CanResizeAtPos(pt: TPoint): Boolean; override;
    // Docking zones
    procedure UpdateControlDockZones(AControl: TdxCustomDockControl; AZoneWidth: Integer); override;
    // Site layout
    procedure IncludeToDock(AControl: TdxCustomDockControl; AType: TdxDockingType;
      Index: Integer); override;
    procedure CreateLayout(AControl: TdxCustomDockControl; AType: TdxDockingType;
      Index: Integer); override;
    procedure DestroyLayout(AControl: TdxCustomDockControl); override;
    procedure UpdateLayout; override;
    procedure LoadLayoutFromCustomIni(AIniFlie: TCustomIniFile;
      AParentControl: TdxCustomDockControl; ASection: string); override;
    procedure SaveLayoutToCustomIni(AIniFlie: TCustomIniFile; ASection: string); override;
    // SideContainer site
    function CanAcceptSideContainerItems(AContainer: TdxSideContainerDockSite): Boolean; override;
    // TabContainer site
    function CanAcceptTabContainerItems(AContainer: TdxTabContainerDockSite): Boolean; override;
    // AutoHide
    procedure ChangeAutoHide; override;
    // Caption
    procedure UpdateCaption; override;
    // Closing
    procedure DoClose; override;
    // Control visibility
    procedure ChildVisibilityChanged(Sender: TdxCustomDockControl); override;
    // Children layout
    procedure DoActiveChildChanged; override;
    procedure ValidateActiveChild(AIndex: Integer); override;
    // Painting
    procedure CalculateNC(var ARect: TRect); override;
    procedure NCPaint(ACanvas: TCanvas); override;
    function GetTabIndexAtPos(pt: TPoint): Integer;
    function GetTabWidth(AControl: TdxCustomDockControl): Integer;
    function HasBorder: Boolean; override;
    function HasCaption: Boolean; override;
    function HasTabs: Boolean; virtual;
    function IsCaptionActive: Boolean; override;
    function IsTabsPoint(pt: TPoint): Boolean;
    function IsTabsNextTabButtonPoint(pt: TPoint): Boolean;
    function IsTabsPrevTabButtonPoint(pt: TPoint): Boolean;

    property FirstVisibleTabIndex: Integer read FFirstVisibleTabIndex;
    property LastVisibleTabIndex: Integer read GetLastVisibleTabIndex;
    property TabsNextTabButtonRect: TRect read FTabsNextTabButtonRect;
    property TabsPrevTabButtonRect: TRect read FTabsPrevTabButtonRect;
    property TabsRect: TRect read FTabsRect;
    property TabRectCount: Integer read GetTabRectCount;
    property TabsRects[Index: Integer]: TRect read GetTabRect;

    property TabsButtonsVisible: Boolean read GetTabsButtonsVisible;
    property TabsNextTabButtonIsDown: Boolean read FTabsNextTabButtonIsDown;
    property TabsNextTabButtonIsEnabled: Boolean read FTabsNextTabButtonIsEnabled;
    property TabsNextTabButtonIsHot: Boolean read FTabsNextTabButtonIsHot;
    property TabsPrevTabButtonIsDown: Boolean read FTabsPrevTabButtonIsDown;
    property TabsPrevTabButtonIsEnabled: Boolean read FTabsPrevTabButtonIsEnabled;
    property TabsPrevTabButtonIsHot: Boolean read FTabsPrevTabButtonIsHot;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Assign(Source: TPersistent); override;

    function CanActive: Boolean; override;
    function CanAutoHide: Boolean; override;
    function CanDockHost(AControl: TdxCustomDockControl; AType: TdxDockingType): Boolean; override;
    function CanMaximize: Boolean; override;
  published
    property AutoHide;
    property CaptionButtons;
    property Dockable;
    property ImageIndex;
    property ShowCaption;
    property TabsPosition: TdxTabContainerTabsPosition read FTabsPosition write SetTabsPosition default tctpBottom;
    property TabsScroll: Boolean read FTabsScroll write SetTabsScroll default True;

    property OnActivate;
    property OnAutoHideChanged;
    property OnAutoHideChanging;
    property OnClose;
    property OnCloseQuery;
    property OnCreateSideContainer;
    property OnDock;
    property OnDocking;
    property OnEndDocking;
    property OnGetAutoHidePosition;
    property OnMakeFloating;
    property OnStartDocking;
    property OnUnDock;
  end;

  TdxSideContainerDockSite = class(TdxContainerDockSite)
  private
    FAdjustBoundsLock: Integer;
  protected
    // Docking zones
    procedure UpdateControlDockZones(AControl: TdxCustomDockControl; AZoneWidth: Integer); override;
    // Site layout
    procedure IncludeToDock(AControl: TdxCustomDockControl; AType: TdxDockingType;
      Index: Integer); override;
    procedure CreateLayout(AControl: TdxCustomDockControl; AType: TdxDockingType;
      Index: Integer); override;
    procedure UpdateLayout; override;
    procedure LoadLayoutFromCustomIni(AIniFlie: TCustomIniFile;
      AParentControl: TdxCustomDockControl; ASection: string); override;
    // SideContainer site
    function CanAcceptSideContainerItems(AContainer: TdxSideContainerDockSite): Boolean; override;
    // TabContainer
    function CanAcceptTabContainerItems(AContainer: TdxTabContainerDockSite): Boolean; override;
    // Caption
    procedure UpdateCaption; override;
    // AutoHide
    procedure ChangeAutoHide; override;
    // Closing
    procedure DoClose; override;
    // Control visibility
    procedure ChildVisibilityChanged(Sender: TdxCustomDockControl); override;
    // Children layout
    procedure DoActiveChildChanged; override;
    function CanChildResize(AControl: TdxCustomDockControl; ADeltaSize: Integer): Boolean;
    procedure DoChildResize(AControl: TdxCustomDockControl; ADeltaSize: Integer);
    procedure BeginAdjustBounds;
    procedure EndAdjustBounds;
    property AdjustBoundsLock: Integer read FAdjustBoundsLock;
    procedure AdjustChildrenBounds(AControl: TdxCustomDockControl);
    procedure NormalizeChildrenBounds(ADeltaSize: Integer);
    procedure SetChildBounds(AControl: TdxCustomDockControl; AWidth, AHeight: Integer);
    function IsValidActiveChild(AControl: TdxCustomDockControl): Boolean; override;
    procedure ValidateActiveChild(AIndex: Integer); override;

    function GetDifferentSize: Integer;
    function GetContainerSize: Integer; virtual; abstract;
    function GetDimension(AWidth, AHeight: Integer): Integer; virtual; abstract;
    function GetMinSize(Index: Integer): Integer; virtual; abstract;
    function GetOriginalSize(Index: Integer): Integer; virtual; abstract;
    function GetSize(Index: Integer): Integer; virtual; abstract;
    function GetPosition(Index: Integer): Integer; virtual; abstract;
    procedure SetOriginalSize(Index: Integer; const Value: Integer); virtual; abstract;
    procedure SetSize(Index: Integer; const Value: Integer); virtual; abstract;
    procedure SetPosition(Index: Integer; const Value: Integer); virtual; abstract;

    property MinSizes[Index: Integer]: Integer read GetMinSize;
    property OriginalSizes[Index: Integer]: Integer read GetOriginalSize write SetOriginalSize;
    property Sizes[Index: Integer]: Integer read GetSize write SetSize;
    property Positions[Index: Integer]: Integer read GetPosition write SetPosition;
    // Painting
    function HasBorder: Boolean; override;
    function HasCaption: Boolean; override;
  public
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;

    function CanActive: Boolean; override;
    function CanAutoHide: Boolean; override;
    function CanDockHost(AControl: TdxCustomDockControl; AType: TdxDockingType): Boolean; override;
    function CanMaximize: Boolean; override;
  published
    property AutoHide;
    property CaptionButtons;
    property Dockable;
    property ImageIndex;
    property ShowCaption;

    property OnActivate;
    property OnAutoHideChanged;
    property OnAutoHideChanging;
    property OnClose;
    property OnCloseQuery;
    property OnDock;
    property OnDocking;
    property OnEndDocking;
    property OnGetAutoHidePosition;
    property OnMakeFloating;
    property OnStartDocking;
    property OnUnDock;
  end;
  TdxSideContainerDockSiteClass = class of TdxSideContainerDockSite;

  TdxHorizContainerDockSite = class(TdxSideContainerDockSite)
  protected
    // Resizing
    procedure UpdateControlResizeZones(AControl: TdxCustomDockControl); override;
    // SiteBounds
    procedure UpdateControlOriginalSize(AControl: TdxCustomDockControl); override;
    // Children layout
    class function GetHeadDockType: TdxDockingType; override;
    class function GetTailDockType: TdxDockingType; override;
    function GetContainerSize: Integer; override;
    function GetDimension(AWidth, AHeight: Integer): Integer; override;
    function GetMinSize(Index: Integer): Integer; override;
    function GetOriginalSize(Index: Integer): Integer; override;
    function GetSize(Index: Integer): Integer; override;
    function GetPosition(Index: Integer): Integer; override;
    procedure SetOriginalSize(Index: Integer; const Value: Integer); override;
    procedure SetSize(Index: Integer; const Value: Integer); override;
    procedure SetPosition(Index: Integer; const Value: Integer); override;
  end;

  TdxVertContainerDockSite = class(TdxSideContainerDockSite)
  protected
    // Resizing
    procedure UpdateControlResizeZones(AControl: TdxCustomDockControl); override;
    // SiteBounds
    procedure UpdateControlOriginalSize(AControl: TdxCustomDockControl); override;
    // Children layout
    class function GetHeadDockType: TdxDockingType; override;
    class function GetTailDockType: TdxDockingType; override;
    function GetContainerSize: Integer; override;
    function GetDimension(AWidth, AHeight: Integer): Integer; override;
    function GetMinSize(Index: Integer): Integer; override;
    function GetOriginalSize(Index: Integer): Integer; override;
    function GetSize(Index: Integer): Integer; override;
    function GetPosition(Index: Integer): Integer; override;
    procedure SetOriginalSize(Index: Integer; const Value: Integer); override;
    procedure SetSize(Index: Integer; const Value: Integer); override;
    procedure SetPosition(Index: Integer; const Value: Integer); override;
  end;

  TdxDockSiteAutoHideContainer = class(TWinControl)
  private
    procedure WMEraseBkgnd(var Message: TWmEraseBkgnd); message WM_ERASEBKGND;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TdxDockSiteHideBar = class
  private
    FDockControls: TList;
    FRect: TRect;
    FButtonsRects: array of TRect;

    FOwner: TdxDockSite;
    function GetButtonRectCount: Integer;
    function GetButtonRect(Index: Integer): TRect;
    function GetDockControl(Index: Integer): TdxCustomDockControl;
    function GetDockControlCount: Integer;
    function GetPainter: TdxDockControlPainter;
    function GetVisible: Boolean;
  protected
    procedure Calculate(R: TRect); virtual; abstract;
    procedure CalculateButtons(R: TRect); virtual; abstract;
    function GetContainersAnchors: TAnchors; virtual; abstract;
    function GetControlsAlign: TAlign; virtual; abstract;
    function GetPosition: TdxAutoHidePosition; virtual; abstract;
    function GetButtonWidth(AControl: TdxCustomDockControl): Integer; virtual; abstract;
    function CheckHidingFinish: Boolean; virtual; abstract;
    function CheckShowingFinish: Boolean; virtual; abstract;
    procedure SetFinalPosition(AControl: TdxCustomDockControl); virtual; abstract;
    procedure SetInitialPosition(AControl: TdxCustomDockControl); virtual; abstract;
    procedure UpdatePosition(ADelta: Integer); virtual; abstract;
    procedure UpdateOwnerAutoSizeBounds(AControl: TdxCustomDockControl); virtual; abstract;

    function GetControlAtPos(pt: TPoint; var SubControl: TdxCustomDockControl): TdxCustomDockControl; virtual;
    function GetTabContainerChildAtPos(pt: TPoint; TabContainer: TdxTabContainerDockSite): TdxCustomDockControl; virtual;
    function IndexOfDockControl(AControl: TdxCustomDockControl): Integer;
    procedure CreateAutoHideContainer(AControl: TdxCustomDockControl); virtual;
    procedure DestroyAutoHideContainer(AControl: TdxCustomDockControl); virtual;
    procedure RegisterDockControl(AControl: TdxCustomDockControl);
    procedure UnregisterDockControl(AControl: TdxCustomDockControl);

    property ButtonRectCount: Integer read GetButtonRectCount;
    property ButtonsRects[Index: Integer]: TRect read GetButtonRect;
    property Painter: TdxDockControlPainter read GetPainter;
    property Rect: TRect read FRect;
  public
    constructor Create(AOwner: TdxDockSite);
    destructor Destroy; override;

    property DockControlCount: Integer read GetDockControlCount;
    property DockControls[Index: Integer]: TdxCustomDockControl read GetDockControl;
    property Owner: TdxDockSite read FOwner;
    property Position: TdxAutoHidePosition read GetPosition;
    property Visible: Boolean read GetVisible;
  end;

  TdxDockSiteLeftHideBar = class(TdxDockSiteHideBar)
  protected
    procedure Calculate(R: TRect); override;
    procedure CalculateButtons(R: TRect); override;
    function GetButtonWidth(AControl: TdxCustomDockControl): Integer; override;
    function GetContainersAnchors: TAnchors; override;
    function GetControlsAlign: TAlign; override;
    function GetPosition: TdxAutoHidePosition; override;
    function CheckHidingFinish: Boolean; override;
    function CheckShowingFinish: Boolean; override;
    procedure SetFinalPosition(AControl: TdxCustomDockControl); override;
    procedure SetInitialPosition(AControl: TdxCustomDockControl); override;
    procedure UpdatePosition(ADelta: Integer); override;
    procedure UpdateOwnerAutoSizeBounds(AControl: TdxCustomDockControl); override;

    function GetTabContainerChildAtPos(pt: TPoint; TabContainer: TdxTabContainerDockSite): TdxCustomDockControl; override;
  end;

  TdxDockSiteTopHideBar = class(TdxDockSiteHideBar)
  protected
    procedure Calculate(R: TRect); override;
    procedure CalculateButtons(R: TRect); override;
    function GetButtonWidth(AControl: TdxCustomDockControl): Integer; override;
    function GetContainersAnchors: TAnchors; override;
    function GetControlsAlign: TAlign; override;
    function GetPosition: TdxAutoHidePosition; override;
    function CheckHidingFinish: Boolean; override;
    function CheckShowingFinish: Boolean; override;
    procedure SetFinalPosition(AControl: TdxCustomDockControl); override;
    procedure SetInitialPosition(AControl: TdxCustomDockControl); override;
    procedure UpdatePosition(ADelta: Integer); override;
    procedure UpdateOwnerAutoSizeBounds(AControl: TdxCustomDockControl); override;

    function GetTabContainerChildAtPos(pt: TPoint; TabContainer: TdxTabContainerDockSite): TdxCustomDockControl; override;
  end;

  TdxDockSiteRightHideBar = class(TdxDockSiteLeftHideBar)
  protected
    procedure Calculate(R: TRect); override;
    function GetContainersAnchors: TAnchors; override;
    function GetControlsAlign: TAlign; override;
    function GetPosition: TdxAutoHidePosition; override;
    procedure SetFinalPosition(AControl: TdxCustomDockControl); override;
    procedure SetInitialPosition(AControl: TdxCustomDockControl); override;
    procedure UpdatePosition(ADelta: Integer); override;
  end;

  TdxDockSiteBottomHideBar = class(TdxDockSiteTopHideBar)
  protected
    procedure Calculate(R: TRect); override;
    function GetContainersAnchors: TAnchors; override;
    function GetControlsAlign: TAlign; override;
    function GetPosition: TdxAutoHidePosition; override;
    procedure SetFinalPosition(AControl: TdxCustomDockControl); override;
    procedure SetInitialPosition(AControl: TdxCustomDockControl); override;
    procedure UpdatePosition(ADelta: Integer); override;
  end;

  TdxAutoHideControlEvent = procedure (Sender: TdxDockSite; AControl: TdxCustomDockControl) of object;

  TdxDockSite = class(TdxCustomDockSite)
  private
    FAutoSize: Boolean;
    FAutoSizeHeight: Integer;
    FAutoSizeWidth: Integer;
    FHideBars: TList;
    FHidingTimerID: Integer;
    FMovingControl: TdxCustomDockControl;
    FMovingControlHideBar: TdxDockSiteHideBar;
    FMovingTimerID: Integer;
    FShowingControl: TdxCustomDockControl;
    FShowingControlCandidate: TdxCustomDockControl;
    FShowingTimerID: Integer;

    FOnHideControl: TdxAutoHideControlEvent;
    FOnShowControl: TdxAutoHideControlEvent;

    function GetHideBarCount: Integer;
    function GetHideBar(Index: Integer): TdxDockSiteHideBar;
    function GetMovingContainer: TdxDockSiteAutoHideContainer;
    procedure SetShowingControl(Value: TdxCustomDockControl);

    procedure CMDesignHitTest(var Message: TCMDesignHitTest); message CM_DESIGNHITTEST;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
    procedure WMMouseMove(var Message: TWMMouseMove); message WM_MOUSEMOVE;
  protected
    procedure ReadState(Reader: TReader); override;
    procedure SetAutoSize(Value: Boolean); {$IFDEF DELPHI6}override;{$ENDIF}
    procedure SetParent(AParent: TWinControl); override;
    procedure ValidateInsert(AComponent: TComponent); override;
    // Resizing zones
    procedure UpdateControlResizeZones(AControl: TdxCustomDockControl); override;
    // Docking zones
    procedure UpdateControlDockZones(AControl: TdxCustomDockControl; AZoneWidth: Integer); override;
    // Control layout
    procedure CreateLayout(AControl: TdxCustomDockControl; AType: TdxDockingType;
      Index: Integer); override;
    procedure DestroyLayout(AControl: TdxCustomDockControl); override;
    procedure LoadLayoutFromCustomIni(AIniFlie: TCustomIniFile;
      AParentControl: TdxCustomDockControl; ASection: string); override;
    procedure SaveLayoutToCustomIni(AIniFlie: TCustomIniFile; ASection: string); override;
    // Control bounds
    procedure UpdateControlOriginalSize(AControl: TdxCustomDockControl); override;
    // Control visibility
    procedure ChildVisibilityChanged(Sender: TdxCustomDockControl); override;
    // Painting
    procedure CalculateNC(var ARect: TRect); override;
    procedure NCPaint(ACanvas: TCanvas); override;
    // AutoHide controls
    function GetControlAutoHidePosition(AControl: TdxCustomDockControl): TdxAutoHidePosition; override;
    procedure RegisterAutoHideDockControl(AControl: TdxCustomDockControl; APosition: TdxAutoHidePosition);
    procedure UnregisterAutoHideDockControl(AControl: TdxCustomDockControl);
    // AutoSize
    procedure AdjustAutoSizeBounds; virtual;
    function CanAutoSizeChange: Boolean; virtual;
    function GetAutoSizeClientControl: TdxCustomDockControl; virtual;
    procedure UpdateAutoSizeBounds(AWidth, AHeight: Integer); virtual;
    // Hiding/Showing AutoHide controls
    procedure DoHideControl(AControl: TdxCustomDockControl);
    procedure DoShowControl(AControl: TdxCustomDockControl);

    procedure DoShowMovement;
    procedure DoHideMovement;
    procedure ImmediatelyHide;
    procedure ImmediatelyShow(AControl: TdxCustomDockControl);
    procedure InitializeHiding;
    procedure InitializeShowing;
    procedure FinalizeHiding;
    procedure FinalizeShowing;
    procedure SetFinalPosition(AControl: TdxCustomDockControl);
    procedure SetInitialPosition(AControl: TdxCustomDockControl);
    function GetClientLeft: Integer;
    function GetClientTop: Integer;
    function GetClientWidth: Integer;
    function GetClientHeight: Integer;
    // HideBars
    function GetControlAtPos(pt: TPoint; var SubControl: TdxCustomDockControl): TdxCustomDockControl;
    function GetHideBarAtPos(pt: TPoint): TdxDockSiteHideBar;
    function GetHideBarByControl(AControl: TdxCustomDockControl): TdxDockSiteHideBar;
    function GetHideBarByPosition(APosition: TdxAutoHidePosition): TdxDockSiteHideBar;

    procedure CreateHideBars; virtual;
    procedure DestroyHideBars; virtual;

    property HideBarCount: Integer read GetHideBarCount;
    property HideBars[Index: Integer]: TdxDockSiteHideBar read GetHideBar;
    property BottomHideBar: TdxDockSiteHideBar index 1 read GetHideBar;
    property LeftHideBar: TdxDockSiteHideBar index 2 read GetHideBar;
    property RightHideBar: TdxDockSiteHideBar index 3 read GetHideBar;
    property TopHideBar: TdxDockSiteHideBar index 0 read GetHideBar;

    property MovingContainer: TdxDockSiteAutoHideContainer read GetMovingContainer;
    property MovingControl: TdxCustomDockControl read FMovingControl;
    property MovingControlHideBar: TdxDockSiteHideBar read FMovingControlHideBar;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function CanDockHost(AControl: TdxCustomDockControl; AType: TdxDockingType): Boolean; override;
    function GetDockZoneAtPos(AControl: TdxCustomDockControl; pt: TPoint): TdxZone; override;
    function GetPositionByControl(AControl: TdxCustomDockControl): TdxAutoHidePosition;

    property AutoSizeClientControl: TdxCustomDockControl read GetAutoSizeClientControl;
    property ShowingControl: TdxCustomDockControl read FShowingControl write SetShowingControl;
  published
    property Align;
    property Anchors;
    property AutoSize: Boolean read FAutoSize write SetAutoSize default False;
    property Visible;

    property OnCreateLayoutSite;
    property OnHideControl: TdxAutoHideControlEvent read FOnHideControl write FOnHideControl;
    property OnShowControl: TdxAutoHideControlEvent read FOnShowControl write FOnShowControl;
  end;

  TdxSetFloatFormCaptionEvent = procedure (Sender: TdxCustomDockControl; AFloatForm: TdxFloatForm) of object;
  TdxFloatDockSite = class(TdxCustomDockSite)
  private
    FFloatForm: TdxFloatForm;
    FFloatLeft: Integer;
    FFloatTop: Integer;
    FOnSetFloatFormCaption: TdxSetFloatFormCaptionEvent;

    function GetChild: TdxCustomDockControl;
    procedure SetFloatLeft(const Value: Integer);
    procedure SetFloatTop(const Value: Integer);
    procedure WMNCHitTest(var Message: TWMNCHitTest); message WM_NCHITTEST;
  protected
    procedure Loaded; override;
    procedure SetParent(AParent: TWinControl); override;
    // Docking
    procedure StartDocking(pt: TPoint); override;
    procedure CheckDockClientsRules; override;
    // Site layout
    procedure CreateLayout(AControl: TdxCustomDockControl; AType: TdxDockingType;
      Index: Integer); override;
    procedure DestroyLayout(AControl: TdxCustomDockControl); override;
    procedure LoadLayoutFromCustomIni(AIniFlie: TCustomIniFile;
      AParentControl: TdxCustomDockControl; ASection: string); override;
    procedure SaveLayoutToCustomIni(AIniFlie: TCustomIniFile; ASection: string); override;
    // Floating site
    procedure DoSetFloatFormCaption;
    function GetFloatForm: TdxFloatForm; override;
    procedure RestoreDockPosition(pt: TPoint); override;
    // Floating form
    procedure CreateFloatForm; virtual;
    procedure DestroyFloatForm; virtual;
    procedure HideFloatForm;
    procedure ShowFloatForm;
    procedure SetFloatFormPosition(ALeft, ATop: Integer);
    procedure SetFloatFormSize(AWidth, AHeight: Integer);
    // Caption
    procedure UpdateCaption; override;
    // Site bounds
    procedure AdjustControlBounds(AControl: TdxCustomDockControl); override;
    procedure UpdateControlOriginalSize(AControl: TdxCustomDockControl); override;
    procedure UpdateFloatPosition; virtual;
    // Control visibility
    procedure ChildVisibilityChanged(Sender: TdxCustomDockControl); override;
    // Activation
    procedure Activate; override;
    // Closing
    procedure DoClose; override;
    // Destroying
    function CanDestroy: Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure BeforeDestruction; override;
    function HasParent: Boolean; override;

    function CanDockHost(AControl: TdxCustomDockControl; AType: TdxDockingType): Boolean; override;
    property Child: TdxCustomDockControl read GetChild;
  published
    property FloatLeft: Integer read FFloatLeft write SetFloatLeft;
    property FloatTop: Integer read FFloatTop write SetFloatTop;
    property OnSetFloatFormCaption: TdxSetFloatFormCaptionEvent read FOnSetFloatFormCaption
      write FOnSetFloatFormCaption;
  end;

  TdxFloatForm = class(TCustomForm)
  private
    FCanDesigning: Boolean;
    FCaptionIsDown: Boolean;
    FCaptionPoint: TPoint;
    FDockSite: TdxFloatDockSite;
    FOnTopMost: Boolean;

    function GetParentForm: TCustomForm;

    procedure WMHideForm(var Message: TWMClose); message WM_HIDEFORM;
    procedure WMShowForm(var Message: TWMClose); message WM_SHOWFORM;
    procedure WMClose(var Message: TWMClose); message WM_CLOSE;
    procedure WMMove(var Message: TWMMove); message WM_MOVE;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure WMMouseActivate(var Message: TWMMouseActivate); message WM_MOUSEACTIVATE;
    procedure WMNCLButtonDown(var Message: TWMNCLButtonDown); message WM_NCLBUTTONDOWN;
    procedure WMNCLButtonUp(var Message: TWMNCLButtonUp); message WM_NCLBUTTONUP;
    procedure WMNCLButtonDblClk(var Message: TWMNCMButtonDblClk); message WM_NCLBUTTONDBLCLK;
    procedure WMNCMouseMove(var Message: TWMNCMouseMove); message WM_NCMOUSEMOVE;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    {$IFDEF DELPHI6}
    procedure WndProc(var Message: TMessage); override;
    {$ENDIF}
    function CanDesigning: Boolean;
    function IsDesigning: Boolean;
    function IsDestroying: Boolean;
    // Dock site
    procedure InsertDockSite(ADockSite: TdxFloatDockSite);
    procedure RemoveDockSite;
    // Form position
    procedure SendOnTop;
    procedure SendOnTopMost;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function IsShortCut(var Message: TWMKey): Boolean; override;

    property AutoScroll default False;
    property BorderStyle default bsSizeToolWin;
    property DockSite: TdxFloatDockSite read FDockSite;
    property FormStyle;
    property Icon;
    property ParentForm: TCustomForm read GetParentForm;
  end;

  TdxRotationAngle = (ra0, raPlus90, raMinus90, ra180);
  TdxEdgePosition = (epLeft, epTop, epRight, epBottom, epTopLeft, epBottomRight, epRect);
  TdxEdgePositions = set of TdxEdgePosition;
  TdxEdgesType = (etStandard, etFlat, etRaisedInner, etRaisedOuter, etSunkenInner, etSunkenOuter);
  TdxDockControlPainter = class
  private
    FDockControl: TdxCustomDockControl;

    function GetAutoHideHostSite: TdxDockSite;
    function GetTabContainer: TdxTabContainerDockSite;
  protected
    class procedure AssignDefaultColor; virtual;
    class procedure AssignDefaultFont; virtual;
    class procedure CreateColors; virtual;
    class procedure RefreshColors; virtual;
    class procedure ReleaseColors; virtual;

    class function LightColor(AColor: TColor): TColor;
    class function LightLightColor(AColor: TColor): TColor;
    class function DarkColor(AColor: TColor): TColor;
    class function DarkDarkColor(AColor: TColor): TColor;

    class procedure DrawColorEdge(ACanvas: TCanvas; ARect: TRect; AColor: TColor;
      AEdgesType: TdxEdgesType; AEdgePositios: TdxEdgePositions);
    class procedure DrawImage(ACanvas: TCanvas; AImageList: TImageList;
      AImageIndex: Integer; R: TRect);
    class function RectInRect(R1, R2: TRect): Boolean;
    class procedure RotateBitmap(ABitmap: TBitmap; Angle: TdxRotationAngle);

    function GetColor: TColor; virtual;
    function GetFont: TFont; virtual;
    function GetBorderColor: TColor; virtual;
    function GetCaptionColor(IsActive: Boolean): TColor; virtual;
    function GetCaptionFont(IsActive: Boolean): TFont; virtual;
    function GetCaptionFontColor(IsActive: Boolean): TColor; virtual;
    function GetCaptionSignColor(IsActive, IsDown, IsHot: Boolean): TColor; virtual;
    function GetTabsColor: TColor; virtual;
    function GetTabColor(IsActive: Boolean): TColor; virtual;
    function GetTabFont(IsActive: Boolean): TFont; virtual;
    function GetTabFontColor(IsActive: Boolean): TColor; virtual;
    function GetTabsScrollButtonsColor: TColor; virtual;
    function GetTabsScrollButtonsSignColor(IsEnable: Boolean): TColor; virtual;
    function GetHideBarColor: TColor; virtual;
    function GetHideBarButtonColor: TColor; virtual;
    function GetHideBarButtonFont: TFont; virtual;
    function GetHideBarButtonFontColor: TColor; virtual;
  public
    constructor Create(ADockControl: TdxCustomDockControl);
    // CustomDockControl
    function CanVerticalCaption: Boolean; virtual;
    function GetBorderWidth: Integer; virtual;
    function GetCaptionButtonSize: Integer; virtual;
    function GetCaptionHeight: Integer; virtual;
    function GetCaptionHorizInterval: Integer; virtual;
    function GetCaptionVertInterval: Integer; virtual;
    function GetDefaultImageHeight: Integer;
    function GetDefaultImageWidth: Integer;
    function GetImageHeight: Integer;
    function GetImageWidth: Integer;
    function IsValidImageIndex(AIndex: Integer): Boolean;

    procedure DrawBorder(ACanvas: TCanvas; ARect: TRect); virtual;
    procedure DrawCaption(ACanvas: TCanvas; ARect: TRect; IsActive: Boolean); virtual;
    procedure DrawCaptionText(ACanvas: TCanvas; ARect: TRect; IsActive: Boolean); virtual;
    procedure DrawCaptionButtonSelection(ACanvas: TCanvas; ARect: TRect;
      IsActive, IsDown, IsHot: Boolean); virtual;
    procedure DrawCaptionCloseButton(ACanvas: TCanvas; ARect: TRect;
      IsActive, IsDown, IsHot, IsSwitched: Boolean); virtual;
    procedure DrawCaptionHideButton(ACanvas: TCanvas; ARect: TRect;
      IsActive, IsDown, IsHot, IsSwitched: Boolean); virtual;
    procedure DrawCaptionMaximizeButton(ACanvas: TCanvas; ARect: TRect;
      IsActive, IsDown, IsHot, IsSwitched: Boolean); virtual;
    procedure DrawClient(ACanvas: TCanvas; ARect: TRect); virtual;
    // TabContainer
    function GetTabVertInterval: Integer; virtual;
    function GetTabHorizInterval: Integer; virtual;
    function GetTabsButtonSize: Integer; virtual;
    function GetTabsHeight: Integer; virtual;

    procedure DrawTabs(ACanvas: TCanvas; ARect, AActiveTabRect: TRect); virtual;
    procedure DrawTab(ACanvas: TCanvas; AControl: TdxCustomDockControl; ARect: TRect;
      IsActive: Boolean); virtual;
    procedure DrawTabContent(ACanvas: TCanvas; AControl: TdxCustomDockControl;
      ARect: TRect; IsActive: Boolean); virtual;
    procedure DrawTabsNextTabButton(ACanvas: TCanvas; ARect: TRect;
      IsDown, IsHot, IsEnable: Boolean); virtual;
    procedure DrawTabsPrevTabButton(ACanvas: TCanvas; ARect: TRect;
      IsDown, IsHot, IsEnable: Boolean); virtual;
    procedure DrawTabsButtonSelection(ACanvas: TCanvas; ARect: TRect;
      IsDown, IsHot, IsEnable: Boolean); virtual;
    // AutoHideHostSite
    function GetHideBarHeight: Integer; virtual;
    function GetHideBarWidth: Integer; virtual;
    function GetHideBarVertInterval: Integer; virtual;
    function GetHideBarHorizInterval: Integer; virtual;

    procedure DrawHideBar(ACanvas: TCanvas; ARect: TRect; APosition: TdxAutoHidePosition); virtual;
    procedure DrawHideBarButton(ACanvas: TCanvas; AControl: TdxCustomDockControl;
      ARect: TRect; APosition: TdxAutoHidePosition); virtual;
    procedure DrawHideBarButtonContent(ACanvas: TCanvas; AControl: TdxCustomDockControl;
      ARect: TRect; APosition: TdxAutoHidePosition); virtual;
    procedure DrawHideBarButtonImage(ACanvas: TCanvas; AControl: TdxCustomDockControl;
      ARect: TRect); virtual;
    procedure DrawHideBarButtonText(ACanvas: TCanvas; AControl: TdxCustomDockControl;
      ARect: TRect; APosition: TdxAutoHidePosition); virtual;

    property AutoHideHostSite: TdxDockSite read GetAutoHideHostSite;
    property DockControl: TdxCustomDockControl read FDockControl;
    property TabContainer: TdxTabContainerDockSite read GetTabContainer;
  end;

  TdxDockingManager = class;

  TdxCustomDockControlProperties = class(TPersistent)
  private
    FOwner: TdxDockingManager;
    FAllowDock: TdxDockingTypes;
    FAllowDockClients: TdxDockingTypes;
    FAllowFloating: Boolean;
    FCaption: string;
    FCaptionButtons: TdxCaptionButtons;
    FDockable: Boolean;
    FImageIndex: Integer;
    FShowCaption: Boolean;
    FColor: TColor;
    FCursor: TCursor;
    FFont: TFont;
    FHint: string;
    FManagerColor: Boolean;
    FManagerFont: Boolean;
    FPopupMenu: TPopupMenu;
    FShowHint: Boolean;
    FTag: Integer;

    function IsColorStored: Boolean;
    function IsFontStored: Boolean;
    procedure SetColor(const Value: TColor);
    procedure SetFont(const Value: TFont);
    procedure SetManagerColor(const Value: Boolean);
    procedure SetManagerFont(const Value: Boolean);
  protected
    procedure AssignTo(Dest: TPersistent); override;
    function  GetOwner: TPersistent; override;
  public
    constructor Create(AOwner: TdxDockingManager); virtual;
    destructor Destroy; override;

    property AllowDock: TdxDockingTypes read FAllowDock write FAllowDock default [dtClient, dtLeft, dtTop, dtRight, dtBottom];
    property AllowDockClients: TdxDockingTypes read FAllowDockClients write FAllowDockClients default [dtClient, dtLeft, dtTop, dtRight, dtBottom];
    property AllowFloating: Boolean read FAllowFloating write FAllowFloating default True;
    property Caption: string read FCaption write FCaption;
    property CaptionButtons: TdxCaptionButtons read FCaptionButtons write FCaptionButtons default [cbClose, cbHide, cbMaximize];
    property Dockable: Boolean read FDockable write FDockable;
    property ImageIndex: Integer read FImageIndex write FImageIndex;
    property ShowCaption: Boolean read FShowCaption write FShowCaption default True;
  published
    property Color: TColor read FColor write SetColor stored IsColorStored default clBtnFace;
    property Cursor: TCursor read FCursor write FCursor default crDefault;
    property Font: TFont read FFont write SetFont stored IsFontStored;
    property Hint: string read FHint write FHint;
    property ManagerColor: Boolean read FManagerColor write SetManagerColor default True;
    property ManagerFont: Boolean read FManagerFont write SetManagerFont default True;
    property PopupMenu: TPopupMenu read FPopupMenu write FPopupMenu;
    property ShowHint: Boolean read FShowHint write FShowHint default False;
    property Tag: Integer read FTag write FTag default 0;
  end;

  TdxLayoutDockSiteProperties = class(TdxCustomDockControlProperties)
  published
    property AllowDockClients;
  end;

  TdxFloatDockSiteProperties = class(TdxCustomDockControlProperties)
  published
    property AllowDockClients;
  end;

  TdxSideContainerDockSiteProperties = class(TdxCustomDockControlProperties)
  published
    property AllowDock;
    property AllowDockClients;
    property AllowFloating;
    property CaptionButtons;
    property Dockable;
    property ImageIndex;
    property ShowCaption;
  end;

  TdxTabContainerDockSiteProperties = class(TdxCustomDockControlProperties)
  private
    FTabsPosition: TdxTabContainerTabsPosition;
    FTabsScroll: Boolean;
  protected
    procedure AssignTo(Dest: TPersistent); override;
  public
    constructor Create(AOwner: TdxDockingManager); override;
  published
    property AllowDock;
    property AllowDockClients;
    property AllowFloating;
    property CaptionButtons;
    property Dockable;
    property ImageIndex;
    property ShowCaption;
    property TabsPosition: TdxTabContainerTabsPosition read FTabsPosition write FTabsPosition default tctpBottom;
    property TabsScroll: Boolean read FTabsScroll write FTabsScroll default True;
  end;

  TdxDockingOption =
    (doActivateAfterDocking, doDblClickDocking, doFloatingOnTop, doFreeOnClose, doUndockOnClose,
    doTabContainerHasCaption, doTabContainerCanClose, doTabContainerCanAutoHide,
    doSideContainerHasCaption, doSideContainerCanClose, doSideContainerCanAutoHide,
    doTabContainerCanInSideContainer, doSideContainerCanInTabContainer, doSideContainerCanInSideContainer,
    doImmediatelyHideOnAutoHide);
  TdxDockingOptions = set of TdxDockingOption;
  TdxDockingViewStyle = (vsStandard, vsNET, vsOffice11, vsXP, vsUseLookAndFeel);

  TdxDockingController = class
  private
    FActiveDockControl: TdxCustomDockControl;
    FCalculatingControl: TdxCustomDockControl;
    FColor: TColor;
    FDestroyedDockControls: TList;
    FDockControls: TList;
    FDockingDockControl: TdxCustomDockControl;
    FFont: TFont;
    FHandle: HWND;
    FInvalidNC: TList;
    FInvalidNCBounds: TList;
    FInvalidRedraw: TList;
    FManager: TdxDockingManager;
    FOptions: TdxDockingOptions;
    FPainterClass: TdxDockControlPainterClass;
    FResizingDockControl: TdxCustomDockControl;
    FSelectionBrush: TBrush;
    FUpdateNCLock: Integer;
    FViewStyle: TdxDockingViewStyle;

    function GetColor: TColor;
    function GetDockControl(Index: Integer): TdxCustomDockControl;
    function GetDockControlCount: Integer;
    function GetFont: TFont;
    function GetImages: TImageList;
    function GetIsDocking: Boolean;
    function GetIsResizing: Boolean;
    function GetOptions: TdxDockingOptions;
    function GetViewStyle: TdxDockingViewStyle;
    procedure SetActiveDockControl(Value: TdxCustomDockControl);
    procedure SetColor(const Value: TColor);
    procedure SetFont(const Value: TFont);
    procedure SetOptions(const Value: TdxDockingOptions);
    procedure SetSelectionBrush(Value: TBrush);
    procedure SetViewStyle(const Value: TdxDockingViewStyle);

    procedure CalculateControls;
    function CheckControlsHandles: Boolean;
    procedure DestroyControls;
    procedure InvalidateControls(ANeedRecalculate: Boolean);
    procedure UpdateInvalidControlsNC;
    procedure UpdateControlsLayout;
    procedure WndProc(var Message: TMessage);

    procedure DoOnFontChanged(Sender: TObject);
  protected
    // Floating forms
    procedure FloatFormsOnTop(AParentForm: TCustomForm);
    procedure FloatFormsOnTopMost(AParentForm: TCustomForm);
    procedure FloatFormsHide(AParentForm: TCustomForm);
    procedure FloatFormsShow(AParentForm: TCustomForm);
    // Docking controls
    function IndexOfDockControl(AControl: TdxCustomDockControl): Integer;
    procedure RegisterDestroyedDockControl(AControl: TdxCustomDockControl);
    procedure RegisterDockControl(AControl: TdxCustomDockControl);
    procedure UnregisterDockControl(AControl: TdxCustomDockControl);
    procedure LoadControlFromCustomIni(AIniFlie: TCustomIniFile; AParentControl: TdxCustomDockControl; ASection: string);
    procedure SaveControlToCustomIni(AIniFlie: TCustomIniFile; AControl: TdxCustomDockControl);
    // Docking manager
    procedure RegisterManager(AManager: TdxDockingManager);
    procedure UnregisterManager(AManager: TdxDockingManager);
    // Docking manager events
    procedure DoActiveDockControlChanged;
    procedure DoCreateFloatSite(ASender: TdxCustomDockControl; ASite: TdxFloatDockSite);
    procedure DoCreateLayoutSite(ASender: TdxCustomDockControl; ASite: TdxLayoutDockSite);
    procedure DoCreateSideContainerSite(ASender: TdxCustomDockControl; ASite: TdxSideContainerDockSite);
    procedure DoCreateTabContainerSite(ASender: TdxCustomDockControl; ASite: TdxTabContainerDockSite);
    function DoCustomDrawResizingSelection(ASender: TdxCustomDockControl; DC: HDC;
      AZone: TdxZone; pt: TPoint; Erasing: Boolean): Boolean;
    function DoCustomDrawDockingSelection(ASender: TdxCustomDockControl; DC: HDC;
      AZone: TdxZone; R: TRect; Erasing: Boolean): Boolean;
    procedure DoSetFloatFormCaption(ASender: TdxCustomDockControl; AFloatForm: TdxFloatForm);
    procedure DoLayoutChanged(ASender: TdxCustomDockControl);
    procedure DoUpdateDockZones(ASender: TdxCustomDockControl);
    procedure DoUpdateResizeZones(ASender: TdxCustomDockControl);
    // Docking manager notifications
    procedure DoColorChanged;
    procedure DoFontChanged;
    procedure DoImagesChanged;
    procedure DoLookAndFeelChanged;
    procedure DoManagerChanged;
    procedure DoOptionsChanged(AOldOptions, ANewOptions: TdxDockingOptions);
    procedure DoPainterChanged(AssignDefaultStyle: Boolean);
    procedure DoViewStyleChanged(AssignDefaultStyle: Boolean);
    // Docking manager saving/loding
    procedure ClearLayout;
    procedure LoadLayoutFromCustomIni(AIniFile: TCustomIniFile);
    procedure SaveLayoutToCustomIni(AIniFile: TCustomIniFile);
    // Painting
    procedure BeginUpdateNC;
    procedure EndUpdateNC;
    function CanUpdateNC(AControl: TdxCustomDockControl): Boolean;
    function CanCalculateNC(AControl: TdxCustomDockControl): Boolean;
    function PainterClass: TdxDockControlPainterClass;
    procedure CreatePainterColors;
    procedure RefreshPainterColors;
    procedure ReleasePainterColors;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    procedure BeginUpdate;
    procedure EndUpdate;

    function GetDockControlAtPos(pt: TPoint): TdxCustomDockControl;
    function GetFloatDockSiteAtPos(pt: TPoint): TdxCustomDockControl;
    function GetNearestDockSiteAtPos(pt: TPoint): TdxCustomDockControl;
    // Default sites properties
    function DefaultLayoutSiteProperties: TdxLayoutDockSiteProperties;
    function DefaultFloatSiteProperties: TdxFloatDockSiteProperties;
    function DefaultHorizContainerSiteProperties: TdxSideContainerDockSiteProperties;
    function DefaultVertContainerSiteProperties: TdxSideContainerDockSiteProperties;
    function DefaultTabContainerSiteProperties: TdxTabContainerDockSiteProperties;

    property ActiveDockControl: TdxCustomDockControl read FActiveDockControl write SetActiveDockControl;
    property Color: TColor read GetColor write SetColor;
    property DockControlCount: Integer read GetDockControlCount;
    property DockControls[Index: Integer]: TdxCustomDockControl read GetDockControl;
    property DockingDockControl: TdxCustomDockControl read FDockingDockControl;
    property Font: TFont read GetFont write SetFont;
    property Images: TImageList read GetImages;
    property IsDocking: Boolean read GetIsDocking;
    property IsResizing: Boolean read GetIsResizing;
    property Manager: TdxDockingManager read FManager;
    property Options: TdxDockingOptions read GetOptions write SetOptions;
    property ResizingDockControl: TdxCustomDockControl read FResizingDockControl;
    property SelectionBrush: TBrush read FSelectionBrush write SetSelectionBrush;
    property ViewStyle: TdxDockingViewStyle read GetViewStyle write SetViewStyle;
  end;

  TdxDockingManager = class(TComponent)
  private
    FChangeLink: TChangeLink;
    FColor: TColor;
    FDefaultSitesPropertiesList: TList;
    FFont: TFont;
    FImages: TImageList;
    FLookAndFeel: TcxLookAndFeel;
    FOptions: TdxDockingOptions;
    FUseDefaultSitesProperties: Boolean;
    FViewStyle: TdxDockingViewStyle;

    FOnActiveDockControlChanged: TNotifyEvent;
    FOnCreateFloatSite: TdxCreateFloatSiteEvent;
    FOnCreateLayoutSite: TdxCreateLayoutSiteEvent;
    FOnCreateSideContainer: TdxCreateSideContainerEvent;
    FOnCreateTabContainer: TdxCreateTabContainerEvent;
    FOnCustomDrawDockingSelection: TdxCustomDrawSelectionEvent;
    FOnCustomDrawResizingSelection: TdxCustomDrawSelectionEvent;
    FOnLayoutChanged: TdxDockControlNotifyEvent;
    FOnSetFloatFormCaption: TdxSetFloatFormCaptionEvent;
    FOnViewChanged: TNotifyEvent;
    FOnUpdateDockZones: TdxUpdateZonesEvent;
    FOnUpdateResizeZones: TdxUpdateZonesEvent;

    function IsDefaultSitePropertiesStored: Boolean;
    function GetDefaultSiteProperties(Index: Integer): TdxCustomDockControlProperties;
    function GetDefaultSitesPropertiesCount: Integer;
    function GetDefaultLayoutSiteProperties: TdxLayoutDockSiteProperties;
    function GetDefaultFloatSiteProperties: TdxFloatDockSiteProperties;
    function GetDefaultHorizContainerSiteProperties: TdxSideContainerDockSiteProperties;
    function GetDefaultVertContainerSiteProperties: TdxSideContainerDockSiteProperties;
    function GetDefaultTabContainerSiteProperties: TdxTabContainerDockSiteProperties;
    procedure SetColor(const Value: TColor);
    procedure SetDefaultLayoutSiteProperties(Value: TdxLayoutDockSiteProperties);
    procedure SetDefaultFloatSiteProperties(Value: TdxFloatDockSiteProperties);
    procedure SetDefaultHorizContainerSiteProperties(Value: TdxSideContainerDockSiteProperties);
    procedure SetDefaultVertContainerSiteProperties(Value: TdxSideContainerDockSiteProperties);
    procedure SetDefaultTabContainerSiteProperties(Value: TdxTabContainerDockSiteProperties);
    procedure SetFont(const Value: TFont);
    procedure SetImages(const Value: TImageList);
    procedure SetLookAndFeel(Value: TcxLookAndFeel);
    procedure SetOptions(const Value: TdxDockingOptions);
    procedure SetViewStyle(const Value: TdxDockingViewStyle);

    procedure DoOnImagesChanged(Sender: TObject);
    procedure DoOnFontChanged(Sender: TObject);
    procedure DoOnLFChanged(Sender: TcxLookAndFeel; AChangedValues: TcxLookAndFeelValues);
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure Loaded; override;

    function IsLoading: Boolean;
    procedure DoColorChanged;
    procedure DoFontChanged;

    procedure CreateDefaultSitesProperties; virtual;
    procedure DestroyDefaultSitesProperties; virtual;
    procedure UpdateDefaultSitesPropertiesColor;
    procedure UpdateDefaultSitesPropertiesFont;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure LoadLayoutFromIniFile(AFileName: string);
    procedure LoadLayoutFromRegistry(ARegistryPath: string);
    procedure LoadLayoutFromStream(AStream: TStream);
    procedure SaveLayoutToIniFile(AFileName: string);
    procedure SaveLayoutToRegistry(ARegistryPath: string);
    procedure SaveLayoutToStream(AStream: TStream);

    property DefaultSitesProperties[Index: Integer]: TdxCustomDockControlProperties read GetDefaultSiteProperties;
    property DefaultSitesPropertiesCount: Integer read GetDefaultSitesPropertiesCount;
  published
    property Color: TColor read FColor write SetColor;
    property DefaultLayoutSiteProperties: TdxLayoutDockSiteProperties read GetDefaultLayoutSiteProperties
      write SetDefaultLayoutSiteProperties stored IsDefaultSitePropertiesStored;
    property DefaultFloatSiteProperties: TdxFloatDockSiteProperties read GetDefaultFloatSiteProperties
      write SetDefaultFloatSiteProperties stored IsDefaultSitePropertiesStored;
    property DefaultHorizContainerSiteProperties: TdxSideContainerDockSiteProperties read GetDefaultHorizContainerSiteProperties
      write SetDefaultHorizContainerSiteProperties stored IsDefaultSitePropertiesStored;
    property DefaultVertContainerSiteProperties: TdxSideContainerDockSiteProperties read GetDefaultVertContainerSiteProperties
      write SetDefaultVertContainerSiteProperties stored IsDefaultSitePropertiesStored;
    property DefaultTabContainerSiteProperties: TdxTabContainerDockSiteProperties read GetDefaultTabContainerSiteProperties
      write SetDefaultTabContainerSiteProperties stored IsDefaultSitePropertiesStored;
    property Font: TFont read FFont write SetFont;
    property Images: TImageList read FImages write SetImages;
    property LookAndFeel: TcxLookAndFeel read FLookAndFeel write SetLookAndFeel;
    property Options: TdxDockingOptions read FOptions write SetOptions;
    property UseDefaultSitesProperties: Boolean read FUseDefaultSitesProperties write FUseDefaultSitesProperties default True;
    property ViewStyle: TdxDockingViewStyle read FViewStyle write SetViewStyle;

    property OnActiveDockControlChanged: TNotifyEvent read FOnActiveDockControlChanged
      write FOnActiveDockControlChanged;
    property OnCreateFloatSite: TdxCreateFloatSiteEvent read FOnCreateFloatSite
      write FOnCreateFloatSite;
    property OnCreateLayoutSite: TdxCreateLayoutSiteEvent read FOnCreateLayoutSite
      write FOnCreateLayoutSite;
    property OnCreateSideContainer: TdxCreateSideContainerEvent read FOnCreateSideContainer
      write FOnCreateSideContainer;
    property OnCreateTabContainer: TdxCreateTabContainerEvent read FOnCreateTabContainer
      write FOnCreateTabContainer;
    property OnCustomDrawDockingSelection: TdxCustomDrawSelectionEvent read FOnCustomDrawDockingSelection
      write FOnCustomDrawDockingSelection;
    property OnCustomDrawResizingSelection: TdxCustomDrawSelectionEvent read FOnCustomDrawResizingSelection
      write FOnCustomDrawResizingSelection;
    property OnLayoutChanged: TdxDockControlNotifyEvent read FOnLayoutChanged write FOnLayoutChanged;
    property OnSetFloatFormCaption: TdxSetFloatFormCaptionEvent read FOnSetFloatFormCaption
      write FOnSetFloatFormCaption;
    property OnViewChanged: TNotifyEvent read FOnViewChanged write FOnViewChanged;
    property OnUpdateDockZones: TdxUpdateZonesEvent read FOnUpdateDockZones
      write FOnUpdateDockZones;
    property OnUpdateResizeZones: TdxUpdateZonesEvent read FOnUpdateResizeZones
      write FOnUpdateResizeZones;
  end;

  TdxAbstractIDEDesigner = class
  protected
    procedure Modified(Root: TCustomForm); virtual; abstract;
    procedure NoSelection(Root: TCustomForm); virtual; abstract;
    procedure SelectComponent(Root: TCustomForm; Component: TPersistent); virtual; abstract;
    function UniqueName(Root: TCustomForm; const BaseName: string): string; virtual; abstract;
  end;

  function dxDockingController: TdxDockingController;

var
  IDEDesigner: TdxAbstractIDEDesigner = nil;

implementation

uses
  TypInfo, SysUtils, CommCtrl, Registry,
  dxThemeManager, dxDockPanel, dxDockConsts, dxDockZones,
  dxDockControlNETView, dxDockControlXPView, dxDockControlOfficeView;

const
  dxDockingTypeAlign: array[TdxDockingType] of TAlign =
    (alClient, alLeft, alTop, alRight, alBottom);

var
  FDockingController: TdxDockingController;
  FWndProcHookHandle: HHOOK;

function dxDockingController: TdxDockingController;
begin
  if FDockingController = nil then
    FDockingController := TdxDockingController.Create;
  Result := FDockingController;
end;

{ TdxZone }

constructor TdxZone.Create(AOwner: TdxCustomDockControl; AWidth: Integer);
begin
  Assert(AOwner <> nil, sdxInvaldZoneOwner);
  FOwner := AOwner;
  FWidth := AWidth;
end;

function TdxZone.IsZonePoint(pt: TPoint): Boolean;
begin
  Result := PtInRect(Rectangle, Owner.ScreenToWindow(pt));
end;


class function TdxZone.ValidateDockZone(AOwner, AControl: TdxCustomDockControl): Boolean;
begin
  Result := (AOwner = AControl);
end;

class function TdxZone.ValidateResizeZone(AOwner, AControl: TdxCustomDockControl): Boolean;
begin
  Result := False;
end;

function TdxZone.GetDockingSelection(AControl: TdxCustomDockControl): TRect;
var
  R: TRect;
begin
  Result := Rectangle;
  GetWindowRect(Owner.Handle, R);
  OffsetRect(Result, R.Left, R.Top);
end;

function TdxZone.GetResizingSelection(pt: TPoint): TRect;
begin
  Result := Rect(0, 0, 0, 0);
end;

function TdxZone.GetDockIndex: Integer;
begin
  Result := -1;
end;

function TdxZone.GetWidth: Integer;
begin
  if FWidth > 0 then
    Result := FWidth
  else Result := dxDockZonesWidth;
end;

function TdxZone.CanDock(AControl: TdxCustomDockControl): Boolean;
begin
  Result := Owner.CanDockHost(AControl, DockType);
end;

function TdxZone.CanResize(StartPoint, EndPoint: TPoint): Boolean;
begin
  Result := False;
end;

function TdxZone.CanConstrainedResize(NewWidth, NewHeight: Integer): Boolean;
begin
  Result := ((Owner.Constraints.MinHeight <= 0) or (NewHeight > Owner.Constraints.MinHeight)) and
    ((Owner.Constraints.MaxHeight <= 0) or (NewHeight < Owner.Constraints.MaxHeight)) and
    ((Owner.Constraints.MinWidth <= 0) or (NewWidth > Owner.Constraints.MinWidth)) and
    ((Owner.Constraints.MaxWidth <= 0) or (NewWidth < Owner.Constraints.MaxWidth));
end;

procedure TdxZone.DoDock(AControl: TdxCustomDockControl);
begin
  AControl.DockTo(Owner, DockType, DockIndex);
end;

procedure TdxZone.DoResize(StartPoint, EndPoint: TPoint);
begin
end;

procedure TdxZone.DrawDockingSelection(DC: HDC; AControl: TdxCustomDockControl; pt: TPoint);
var
  R: TRect;
  PenSize: Integer;
begin
  PenSize := dxSelectionFrameWidth;
  R := GetDockingSelection(AControl);
  with R do
  begin
    PatBlt(DC, Left + PenSize, Top, Right - Left - PenSize, PenSize, PATINVERT);
    PatBlt(DC, Right - PenSize, Top + PenSize, PenSize, Bottom - Top - PenSize, PATINVERT);
    PatBlt(DC, Left, Bottom - PenSize, Right - Left - PenSize, PenSize, PATINVERT);
    PatBlt(DC, Left, Top, PenSize, Bottom - Top - PenSize, PATINVERT);
  end;
end;

procedure TdxZone.DrawResizingSelection(DC: HDC; pt: TPoint);
var
  R: TRect;
begin
  R := GetResizingSelection(pt);
  with R do PatBlt(DC, Left, Top, Right - Left, Bottom - Top, PATINVERT);
end;

{ TdxCustomDockControl }

constructor TdxCustomDockControl.Create(AOwner: TComponent);
begin
  Assert(AOwner is TCustomForm, sdxInvalidOwner);
  inherited Create(AOwner);
  Controller.RegisterDockControl(Self);
  FAllowDock := [dtClient, dtLeft, dtTop, dtRight, dtBottom];
  FAllowDockClients := [dtClient, dtLeft, dtTop, dtRight, dtBottom];
  FAllowFloating := True;
  FCaptionButtons := [cbClose, cbHide, cbMaximize];
  FDockable := True;
  FDockControls := TList.Create;
  FDockType := dtNone;
  FDockZones := TList.Create;
  FImageIndex := -1;
  ManagerColor := True;
  ManagerFont := True;
  FResizeZones := TList.Create;
  ParentColor := False;
  ParentFont := False;
  FShowCaption := True;
  FUseDoubleBuffer := False;
  ControlStyle := [csAcceptsControls, csClickEvents, csDoubleClicks, csSetCaption];
//  DoubleBuffered := True;
  SetBounds(0, 0, 300, 200);
end;

destructor TdxCustomDockControl.Destroy;
begin
  RemoveFromLayuot;
  ClearZones(FResizeZones);
  FResizeZones.Free;
  ClearZones(FDockZones);
  FDockZones.Free;
  FDockControls.Free;
  FPainter.Free;
  FPainter := nil;
  FCanvasBitmap.Free;
  Controller.UnregisterDockControl(Self);
  inherited;
end;

procedure TdxCustomDockControl.Assign(Source: TPersistent);
var
  AControl: TdxCustomDockControl;
begin
  if Source is TdxCustomDockControl then
  begin
    AControl := Source as TdxCustomDockControl;
    AllowDock := AControl.AllowDock;
    AllowDockClients := AControl.AllowDockClients;
    AllowFloating := AControl.AllowFloating;
    Caption := AControl.Caption;
    CaptionButtons := AControl.CaptionButtons;
    Dockable := AControl.Dockable;
    ImageIndex := AControl.ImageIndex;
    ShowCaption := AControl.ShowCaption;
    Color := AControl.Color;
    Cursor := AControl.Cursor;
    Font := AControl.Font;
    Hint := AControl.Hint;
    ManagerColor := AControl.ManagerColor;
    ManagerFont := AControl.ManagerFont;
    PopupMenu := AControl.PopupMenu;
    ShowHint := AControl.ShowHint;
    Tag := AControl.Tag;
  end
  else inherited Assign(Source)
end;

procedure TdxCustomDockControl.BeforeDestruction;
begin
  if not CanDestroy then
    raise Exception.Create(sdxInvalidFloatingDeleting);
  inherited;
end;

procedure TdxCustomDockControl.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  if (SideContainer <> nil) and (SideContainerItem = Self) then
    SideContainer.SetChildBounds(Self, AWidth, AHeight);
  inherited SetBounds(ALeft, ATop, AWidth, AHeight);
  if UpdateLayoutLock = 0 then UpdateOriginalSize;
end;

function TdxCustomDockControl.GetDockZoneAtPos(AControl: TdxCustomDockControl; pt: TPoint): TdxZone;
var
  I: Integer;
  AZone: TdxZone;
begin
  Result := nil;
  if AControl.Dockable then
    for I := 0 to DockZones.Count - 1 do
    begin
      AZone := TdxZone(DockZones[I]);
      if AZone.IsZonePoint(pt) and AZone.CanDock(AControl) then
      begin
        Result := AZone;
        break;
      end;
    end;
end;

function TdxCustomDockControl.GetResizeZoneAtPos(pt: TPoint): TdxZone;
var
  I: Integer;
  AZone: TdxZone;
begin
  Result := nil;
  if CanResizeAtPos(ScreenToClient(pt)) then
  begin
    for I := 0 to ResizeZones.Count - 1 do
    begin
      AZone := TdxZone(ResizeZones[I]);
      if AZone.IsZonePoint(pt) then
      begin
        Result := AZone;
        break;
      end;
    end;
    if (Result = nil) and (ParentDockControl <> nil) then
      Result := ParentDockControl.GetResizeZoneAtPos(pt);
  end;
end;

procedure TdxCustomDockControl.DockTo(AControl: TdxCustomDockControl; AType: TdxDockingType; AIndex: Integer);
begin
  if not CanDock then exit;
  if not AControl.CanDockHost(Self, AType) then exit;
  BeginUpdateNC;
  try
    if AControl <> nil then
    begin
      if AControl = LayoutDockSite then
        AControl := ParentDockControl
      else if (AControl = Container) and (Container.ChildCount = 2) and
        not Container.CanContainerDockHost(AType) then
      begin
        if DockIndex = 0 then
          AControl := Container.Children[1]
        else AControl := Container.Children[0];
      end;
      SelectComponent(AControl.TopMostDockControl);
      AControl.BeginUpdateLayout;
      try
        if ParentDockControl <> nil then
          if (AControl = Container) and Container.CanContainerDockHost(AType) then
            ExcludeFromDock
          else UnDock;
        AControl.CreateLayout(Self, AType, AIndex);
        if not Visible then UpdateRelatedControlsVisibility;
      finally
        AControl.EndUpdateLayout;
      end;
      if Assigned(FOnDock) then
        FOnDock(Self, AControl, AType, AIndex);
      Controller.DoLayoutChanged(Self);
      SelectComponent(Self);
    end;
    if doActivateAfterDocking in Controller.Options then Activate;
  finally
    EndUpdateNC;
  end;
end;

procedure TdxCustomDockControl.Close;
begin
  DoClose;
end;

procedure TdxCustomDockControl.MakeFloating;
var
  pt: TPoint;
begin
  pt := Point(0, 0);
  if HandleAllocated then pt := WindowToScreen(pt);
  MakeFloating(pt.X, pt.Y);
end;

procedure TdxCustomDockControl.MakeFloating(XPos, YPos: Integer);
var
  ASite: TdxFloatDockSite;
  AWidth, AHeight: Integer;
begin
  if not CanDock then exit;
  if not AllowFloating then exit;
  BeginUpdateNC;
  try
    if FloatDockSite = nil then
    begin
      SelectComponent(TopMostDockControl);
      StoreDockPosition(Point(XPos, YPos));
      AWidth := OriginalWidth;
      AHeight := OriginalHeight;
      UnDock;
      ASite := TdxFloatDockSite.Create(Owner);
      ASite.Name := ASite.UniqueName;
      ASite.CreateLayout(Self, dtClient, 0);
      if not Visible then UpdateRelatedControlsVisibility;
      ASite.SetFloatFormPosition(XPos, YPos);
      ASite.SetFloatFormSize(AWidth, AHeight);
      ASite.ShowFloatForm;
      DoCreateFloatSite(ASite);
      if Assigned(FOnMakeFloating) then
        FOnMakeFloating(Self, XPos, YPos);
      Controller.DoLayoutChanged(Self);
      SelectComponent(Self);
      if doActivateAfterDocking in Controller.Options then Activate;
    end
    else FloatDockSite.SetFloatFormPosition(XPos, YPos);
  finally
    EndUpdateNC;
  end;
end;

procedure TdxCustomDockControl.UnDock;
var
  AParentDockControl: TdxCustomDockControl;
begin
  if not CanDock then exit;
  BeginUpdateNC;
  try
    if AutoHide then AutoHide := False;
    if ParentDockControl <> nil then
    begin
      AParentDockControl := ParentDockControl;
      AParentDockControl.BeginUpdateLayout;
      try
        NoSelection;
        if Assigned(FOnUnDock) then
          FOnUnDock(Self, ParentDockControl);
        if FloatDockSite <> nil then
          FloatDockSite.HideFloatForm;
        AParentDockControl.DestroyLayout(Self);
      finally
        AParentDockControl.EndUpdateLayout;
      end;
      Controller.DoLayoutChanged(Self);
    end;
  finally
    EndUpdateNC;
  end;
end;

procedure TdxCustomDockControl.AddDockControl(AControl: TdxCustomDockControl; AIndex: Integer);
var
  AOldIndex: Integer;
begin
  AOldIndex := FDockControls.IndexOf(AControl);
  if AOldIndex < 0 then
  begin
    if (0 <= AIndex) and (AIndex < FDockControls.Count) then
      FDockControls.Insert(AIndex, AControl)
    else FDockControls.Add(AControl)
  end
  else if AOldIndex <> AIndex then
  begin
    if (0 <= AIndex) and (AIndex < FDockControls.Count) then
      FDockControls.Move(AOldIndex, AIndex)
    else FDockControls.Move(AOldIndex, FDockControls.Count - 1);
  end;
end;

procedure TdxCustomDockControl.RemoveDockControl(AControl: TdxCustomDockControl);
begin
  if IndexOfControl(AControl) > -1 then
    FDockControls.Remove(AControl);
end;

function TdxCustomDockControl.IndexOfControl(AControl: TdxCustomDockControl): Integer;
begin
  Result := FDockControls.IndexOf(AControl);
end;

procedure TdxCustomDockControl.CheckDockRules;
begin
  if CanDock and (DockType <> dtNone) and not (DockType in AllowDock) then
  begin
    if AutoHide then AutoHide := False;
    FAllowFloating := True;
    MakeFloating;
  end;
end;

procedure TdxCustomDockControl.CheckDockClientsRules;
var
  I: Integer;
begin
  I := 0;
  while I < ChildCount do
  begin
    if not (Children[I].DockType in AllowDockClients) and Children[I].CanDock then
    begin
      if Children[I].AutoHide then Children[I].AutoHide := False;
      Children[I].FAllowFloating := True;
      Children[I].MakeFloating(ClientOrigin.X, ClientOrigin.Y);
      I := 0;
    end
    else Inc(I);
  end;
end;

procedure TdxCustomDockControl.ClearZones(AZones: TList);
var
  I: Integer;
begin
  if AZones = nil then exit;
  for I := 0 to AZones.Count - 1 do
    TdxZone(AZones[I]).Free;
  AZones.Clear;
end;

function TdxCustomDockControl.DoCustomDrawDockingSelection(DC: HDC; AZone: TdxZone; R: TRect; Erasing: Boolean): Boolean;
begin
  Result := False;
  if Assigned(FOnCustomDrawDockingSelection) then
    FOnCustomDrawDockingSelection(Self, DC, AZone, R, Erasing, Result);
  if not Result then
    Result := Controller.DoCustomDrawDockingSelection(Self, DC, AZone, R, Erasing);
end;

procedure TdxCustomDockControl.DrawDockingSelection(AZone: TdxZone; pt: TPoint; Erasing: Boolean);
var
  DesktopWindow: HWND;
  DC: HDC;
  OldBrush: HBrush;
  PenSize: Integer;
  R: TRect;
  AHandled: Boolean;
begin
  DesktopWindow := GetDesktopWindow;
  DC := GetDCEx(DesktopWindow, 0, DCX_CACHE or DCX_LOCKWINDOWUPDATE);
  try
    if AZone <> nil then
      R := AZone.GetDockingSelection(Self)
    else R := GetFloatDockRect(pt);
    AHandled := DoCustomDrawDockingSelection(DC, AZone, R, Erasing);
    if not AHandled then
    begin
      OldBrush := SelectObject(DC, Controller.SelectionBrush.Handle);
      if AZone <> nil then
        AZone.DrawDockingSelection(DC, Self, pt)
      else if AllowFloating then
      begin
        PenSize := dxSelectionFrameWidth;
        with R do
        begin
          PatBlt(DC, Left + PenSize, Top, Right - Left - PenSize, PenSize, PATINVERT);
          PatBlt(DC, Right - PenSize, Top + PenSize, PenSize, Bottom - Top - PenSize, PATINVERT);
          PatBlt(DC, Left, Bottom - PenSize, Right - Left - PenSize, PenSize, PATINVERT);
          PatBlt(DC, Left, Top, PenSize, Bottom - Top - PenSize, PATINVERT);
        end;
      end;
      SelectObject(DC, OldBrush);
    end;
  finally
    ReleaseDC(DesktopWindow, DC);
  end;
end;

function TdxCustomDockControl.CanResizing(NewWidth, NewHeight: Integer): Boolean;
begin
  Result := True;
  if Assigned(FOnCanResize) then FOnCanResize(Self, NewWidth, NewHeight, Result);
end;

function TdxCustomDockControl.CanResizeAtPos(pt: TPoint): Boolean;
begin
  Result := not IsDesigning and not IsCaptionPoint(pt) and not IsCaptionCloseButtonPoint(pt) and
    not IsCaptionHideButtonPoint(pt) and not IsCaptionMaximizeButtonPoint(pt);
end;

function TdxCustomDockControl.DoCustomDrawResizingSelection(DC: HDC; AZone: TdxZone; pt: TPoint; Erasing: Boolean): Boolean;
begin
  Result := False;
  if Assigned(FOnCustomDrawResizingSelection) then
    FOnCustomDrawResizingSelection(Self, DC, AZone, AZone.GetResizingSelection(pt), Erasing, Result);
  if not Result then
    Result := Controller.DoCustomDrawResizingSelection(Self, DC, AZone, pt, Erasing);
end;

procedure TdxCustomDockControl.DrawResizingSelection(AZone: TdxZone; pt: TPoint; Erasing: Boolean);
var
  DesktopWindow: HWND;
  DC: HDC;
  OldBrush: HBrush;
  AHandled: Boolean;
begin
  DesktopWindow := GetDesktopWindow;
  DC := GetDCEx(DesktopWindow, 0, DCX_CACHE or DCX_LOCKWINDOWUPDATE);
  try
    AHandled := DoCustomDrawResizingSelection(DC, AZone, pt, Erasing);
    if not AHandled then
    begin
      OldBrush := SelectObject(DC, Controller.SelectionBrush.Handle);
      AZone.DrawResizingSelection(DC, pt);
      SelectObject(DC, OldBrush);
    end;
  finally
    ReleaseDC(DesktopWindow, DC);
  end;
end;

function TdxCustomDockControl.GetFloatDockSite: TdxFloatDockSite;
begin
  if ParentDockControl is TdxFloatDockSite then
    Result := ParentDockControl as TdxFloatDockSite
  else Result := nil;
end;

function TdxCustomDockControl.GetFloatForm: TdxFloatForm;
begin
  if TopMostDockControl is TdxFloatDockSite then
    Result := (TopMostDockControl as TdxFloatDockSite).FloatForm
  else Result := nil;
end;

function TdxCustomDockControl.GetFloatFormActive: Boolean;
begin
  Result := (FloatForm <> nil) and FloatForm.Active;
end;

function TdxCustomDockControl.GetFloatFormVisible: Boolean;
begin
  Result := (FloatForm <> nil) and IsWindowVisible(FloatForm.Handle);
end;

procedure TdxCustomDockControl.StoreDockPosition;
begin
  FStoredPosition.DockIndex := DockIndex;
  FStoredPosition.Parent := ParentDockControl;
  if Container <> nil then
  begin
    if DockIndex < Container.ChildCount - 1 then
      FStoredPosition.SiblingAfter := Container.Children[DockIndex + 1]
    else FStoredPosition.SiblingAfter := nil;
    if DockIndex > 0 then
      FStoredPosition.SiblingBefore := Container.Children[DockIndex - 1]
    else FStoredPosition.SiblingBefore := nil;
    if DockType = Container.GetTailDockType then
      FStoredPosition.DockType := Container.GetTailDockType
    else FStoredPosition.DockType := Container.GetHeadDockType;
  end
  else FStoredPosition.DockType := DockType;
  FStoredPosition.OriginalHeight := OriginalHeight;
  FStoredPosition.OriginalWidth := OriginalWidth;
  if Assigned(FOnStoreDockPosition) then
    FOnStoreDockPosition(Self, FStoredPosition);
end;

procedure TdxCustomDockControl.RestoreDockPosition(pt: TPoint);
var
  AParentSite: TdxCustomDockControl;
begin
  if Assigned(FOnRestoreDockPosition) then
    FOnRestoreDockPosition(Self, FStoredPosition);
  if (FStoredPosition.Parent <> nil) and (FStoredPosition.Parent.DockState in [dsDocked, dsFloating]) and
    FStoredPosition.Parent.CanDockHost(Self, FStoredPosition.DockType) then
    AParentSite := FStoredPosition.Parent
  else if (FStoredPosition.SiblingBefore <> nil) and (FStoredPosition.SiblingBefore.DockState in [dsDocked, dsFloating]) and
    FStoredPosition.SiblingBefore.CanDockHost(Self, FStoredPosition.DockType) then
    AParentSite := FStoredPosition.SiblingBefore
  else if (FStoredPosition.SiblingAfter <> nil) and (FStoredPosition.SiblingAfter.DockState in [dsDocked, dsFloating]) and
    FStoredPosition.SiblingAfter.CanDockHost(Self, FStoredPosition.DockType) then
    AParentSite := FStoredPosition.SiblingAfter
  else AParentSite := nil;
  if AParentSite <> nil then
  begin
    FOriginalHeight := FStoredPosition.OriginalHeight;
    FOriginalWidth := FStoredPosition.OriginalWidth;
    DoStartDocking(pt);
    DockTo(AParentSite, FStoredPosition.DockType, FStoredPosition.DockIndex);
    DoEndDocking(pt);
    FStoredPosition.Parent := nil;
    FStoredPosition.SiblingAfter := nil;
    FStoredPosition.SiblingBefore := nil;
  end;
end;

procedure TdxCustomDockControl.DoCreateLayoutSite(ASite: TdxLayoutDockSite);
begin
  if Controller.DefaultLayoutSiteProperties <> nil then
    Controller.DefaultLayoutSiteProperties.AssignTo(ASite);
  if Assigned(FOnCreateLayoutSite) then
    FOnCreateLayoutSite(Self, ASite);
  Controller.DoCreateLayoutSite(Self, ASite);
end;

function TdxCustomDockControl.GetLayoutDockSite: TdxLayoutDockSite;
begin
  if (ParentDockControl <> nil) and (ParentDockControl.ChildCount = 2) then
  begin
    if ParentDockControl.Children[1 - DockIndex] is TdxLayoutDockSite then
        Result := ParentDockControl.Children[1 - DockIndex] as TdxLayoutDockSite
      else Result := nil
  end
  else Result := nil;
end;

function TdxCustomDockControl.InDockControl(AControl: TdxCustomDockControl): Boolean;
var
  AParent: TdxCustomDockControl;
begin
  Result := False;
  AParent := Self;
  while AParent <> nil do
  begin
    if AParent = AControl then
    begin
      Result := True;
      break;
    end;
    AParent := AParent.ParentDockControl;
  end;
end;

function TdxCustomDockControl.GetParentDockControl: TdxCustomDockControl;
begin
  Result := FParentDockControl;
end;

function TdxCustomDockControl.GetParentForm: TCustomForm;
begin
  if Owner is TCustomForm then
    Result := TCustomForm(Owner)
  else Result := nil;
end;

type
  TCustomFormAccess = class(TCustomForm);

function TdxCustomDockControl.GetParentFormActive: Boolean;
begin
  Result := (ParentForm <> nil) and
    (((TCustomFormAccess(ParentForm).FormStyle <> fsMDIForm) and ParentForm.Active) or
    ((TCustomFormAccess(ParentForm).FormStyle = fsMDIForm) and Application.Active));
end;

function TdxCustomDockControl.GetTopMostDockControl: TdxCustomDockControl;
begin
  if ParentDockControl <> nil then
    Result := ParentDockControl.TopMostDockControl
  else Result := Self;
end;

procedure TdxCustomDockControl.ReadDockType(Reader: TReader);
begin
  SetDockType(TdxDockingType(Reader.ReadInteger));
end;

procedure TdxCustomDockControl.ReadOriginalWidth(Reader: TReader);
begin
  FOriginalWidth := Reader.ReadInteger;
end;

procedure TdxCustomDockControl.ReadOriginalHeight(Reader: TReader);
begin
  FOriginalHeight := Reader.ReadInteger;
end;

procedure TdxCustomDockControl.WriteDockType(Writer: TWriter);
begin
  Writer.WriteInteger(Integer(DockType));
end;

procedure TdxCustomDockControl.WriteOriginalWidth(Writer: TWriter);
begin
  Writer.WriteInteger(OriginalWidth);
end;

procedure TdxCustomDockControl.WriteOriginalHeight(Writer: TWriter);
begin
  Writer.WriteInteger(OriginalHeight);
end;

procedure TdxCustomDockControl.AlignControls(AControl: TControl; var Rect: TRect);
begin
  BeginUpdateNC;
  try
    inherited AlignControls(AControl, Rect);
  finally
    EndUpdateNC;
  end;
end;

procedure TdxCustomDockControl.CreateHandle;
begin
  inherited;
  if ParentDockControl <> nil then
    ParentDockControl.UpdateDockZones;
end;

procedure TdxCustomDockControl.DefineProperties(Filer: TFiler);
begin
  inherited;
  Filer.DefineProperty('DockType', ReadDockType, WriteDockType, True);
  Filer.DefineProperty('OriginalWidth', ReadOriginalWidth, WriteOriginalWidth, True);
  Filer.DefineProperty('OriginalHeight', ReadOriginalHeight, WriteOriginalHeight, True);
end;

procedure TdxCustomDockControl.Loaded;
begin
  inherited;
  BeginUpdateNC;
  try
    if AutoHide and (AutoHideHostSite <> nil) then
      AutoHideHostSite.RegisterAutoHideDockControl(Self, GetAutoHidePosition);
  finally
    EndUpdateNC;
  end;
end;

procedure TdxCustomDockControl.Notification(AComponent: TComponent; Operation: TOperation);
begin
  if Operation = opRemove then
  begin
    if AComponent = FStoredPosition.Parent then FStoredPosition.Parent := nil;
    if AComponent = FStoredPosition.SiblingAfter then FStoredPosition.SiblingAfter := nil;
    if AComponent = FStoredPosition.SiblingBefore then FStoredPosition.SiblingBefore := nil;
  end;
end;

procedure TdxCustomDockControl.ReadState(Reader: TReader);
begin
  inherited ReadState(Reader);
  if (Reader.Parent is TdxCustomDockControl) and (DockType <> dtNone) then
    IncludeToDock(Reader.Parent as TdxCustomDockControl, DockType, -1);
end;

procedure TdxCustomDockControl.SetParent(AParent: TWinControl);
begin
  DoParentChanging;
  inherited SetParent(AParent);
  DoParentChanged;
end;

procedure TdxCustomDockControl.VisibleChanging;
begin
  DoVisibleChanging;
end;

procedure TdxCustomDockControl.Modified;
begin
  if (IDEDesigner <> nil) and Controller.CheckControlsHandles then
    IDEDesigner.Modified(ParentForm);
end;

procedure TdxCustomDockControl.NoSelection;
begin
  if IDEDesigner <> nil then
    IDEDesigner.NoSelection(ParentForm);
end;

procedure TdxCustomDockControl.SelectComponent(AComponent: TComponent);
begin
  if IDEDesigner <> nil then
  {$IFNDEF DELPHI6}
    if not (AComponent is TdxCustomDockSite) or (TdxCustomDockSite(AComponent).FloatForm = nil) then
  {$ENDIF}
      IDEDesigner.SelectComponent(ParentForm, AComponent);
end;

function TdxCustomDockControl.UniqueName: string;
begin
  if IDEDesigner <> nil then
    Result := IDEDesigner.UniqueName(ParentForm, ClassName)
  else Result := '';
end;

function TdxCustomDockControl.IsDesigning: Boolean;
begin
  Result := csDesigning in ComponentState;
end;

function TdxCustomDockControl.IsDestroying: Boolean;
begin
  Result := (csDestroying in ComponentState) or FDestroyed;
end;

function TdxCustomDockControl.IsLoading: Boolean;
begin
  Result := csLoading in ComponentState;
end;

procedure TdxCustomDockControl.CaptureMouse;
begin
  FSavedCaptureControl := GetCaptureControl;
  SetCaptureControl(Self);
end;

procedure TdxCustomDockControl.ReleaseMouse;
begin
  SetCaptureControl(FSavedCaptureControl);
  FSavedCaptureControl := nil;
end;

procedure TdxCustomDockControl.Activate;
begin
  Controller.ActiveDockControl := Self;
end;

procedure TdxCustomDockControl.DoActiveChanged(AActive: Boolean);
begin
  if (TabContainer <> nil) then
  begin
    if AActive then TabContainer.ActiveChild := Self;
    TabContainer.InvalidateNC(False);
  end;
  if AActive then
    if FloatForm <> nil then
      SetWindowPos(FloatForm.Handle, HWND_TOP, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE or SWP_NOZORDER{ or SWP_NOACTIVATE})
    else
      SetWindowPos(ParentForm.Handle, HWND_TOP, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE or SWP_NOZORDER{ or SWP_NOACTIVATE});
  InvalidateNC(False);
  if Assigned(FOnActivate) then FOnActivate(Self, AActive);
end;

function TdxCustomDockControl.IsActive: Boolean;
begin
  Result := Controller.ActiveDockControl = Self;
end;

procedure TdxCustomDockControl.DoClose;
var
  ACanClose: Boolean;
begin
  ACanClose := True;
  if Assigned(FOnCloseQuery) then
    FOnCloseQuery(Self, ACanClose);
  if ACanClose then
  begin
    if IsActive then Controller.ActiveDockControl := nil;
    if Assigned(FOnClose) then FOnClose(Self);       
    if (doFreeOnClose in Controller.Options) then
      DoDestroy
    else if (doUndockOnClose in Controller.Options) then
      UnDock
    else Visible := False;
  end;
end;

function TdxCustomDockControl.CanDestroy: Boolean;
begin
  Result := not IsDesigning or (FloatDockSite = nil) or FloatDockSite.IsDestroying;
end;

procedure TdxCustomDockControl.DoDestroy;
begin
  RemoveFromLayuot;
  FDestroyed := True;
  Controller.RegisterDestroyedDockControl(Self);
end;

procedure TdxCustomDockControl.ChildVisibilityChanged(Sender: TdxCustomDockControl);
begin
end;

procedure TdxCustomDockControl.DoVisibleChanged;
begin
  if Assigned(FOnVisibleChanged) then FOnVisibleChanged(Self);
end;

procedure TdxCustomDockControl.DoVisibleChanging;
begin
  if Assigned(FOnVisibleChanging) then FOnVisibleChanging(Self);
end;

procedure TdxCustomDockControl.SetVisibility(Value: Boolean);
begin
  BeginUpdateVisibility;
  try
    Visible := Value;
  finally
    EndUpdateVisibility;
  end;
end;

procedure TdxCustomDockControl.UpdateAutoHideControlsVisibility;
begin
  if UpdateVisibilityLock > 0 then exit;
  BeginUpdateVisibility;
  try
    if not AutoHide and (AutoHideHostSite <> nil) and Visible and StoredAutoHide then
    begin
      FStoredAutoHide := False;
      AutoHide := True;
      AutoHideHostSite.ImmediatelyShow(Self);
    end
    else if AutoHide and (AutoHideHostSite <> nil) then
    begin
      if not Visible then
      begin
        BeginUpdateNC;
        try
          AutoHideHostSite.NCChanged;
          AutoHide := False;
          FStoredAutoHide := True;
          SetVisibility(False);
        finally
          EndUpdateNC;
        end;
      end
      else AutoHideHostSite.ShowingControl := Self;
    end;
  finally
    EndUpdateVisibility;
  end;
end;

procedure TdxCustomDockControl.UpdateLayoutControlsVisibility;
begin
  if (LayoutDockSite <> nil) and (LayoutDockSite.ChildCount = 0) then
  begin
    LayoutDockSite.BeginUpdateVisibility;
    try
      if Visible and not AutoHide then
        LayoutDockSite.Visible := True
      else if not Visible then
        LayoutDockSite.Visible := False;
    finally
      LayoutDockSite.EndUpdateVisibility;
    end;
  end;
end;

procedure TdxCustomDockControl.UpdateParentControlsVisibility;
begin
  if ParentDockControl = nil then exit;
  BeginUpdateNC;
  try
    if not Visible and not AutoHide then
      ParentDockControl.NCChanged;
    NCChanged;
    ParentDockControl.BeginUpdateLayout;
    try
      ParentDockControl.ChildVisibilityChanged(Self);
    finally
      ParentDockControl.EndUpdateLayout;
    end;
  finally
    EndUpdateNC;
  end;
end;

procedure TdxCustomDockControl.UpdateRelatedControlsVisibility;
begin
  BeginUpdateVisibility;
  try
    UpdateParentControlsVisibility;
    UpdateLayoutControlsVisibility;
  finally
    EndUpdateVisibility;
  end;
end;

procedure TdxCustomDockControl.BeginUpdateVisibility;
begin
  Inc(FUpdateVisibilityLock);
end;

procedure TdxCustomDockControl.EndUpdateVisibility;
begin
  Dec(FUpdateVisibilityLock);
end;

function TdxCustomDockControl.GetDockingTargetControlAtPos(pt: TPoint): TdxCustomDockControl;
begin
  Result := Controller.GetDockControlAtPos(pt);
  if Result = nil then
    Result := Controller.GetFloatDockSiteAtPos(pt);
  if Result = nil then
    Result := Controller.GetNearestDockSiteAtPos(pt);
end;

function TdxCustomDockControl.GetFloatDockRect(pt: TPoint): TRect;
begin
  if FloatDockSite <> nil then
  begin
    Result := FloatDockSite.FloatForm.BoundsRect;
    OffsetRect(Result, - FloatDockSite.FloatForm.Left, - FloatDockSite.FloatForm.Top);
  end
  else Result := Rect(0, 0, OriginalWidth, OriginalHeight);
  OffsetRect(Result, pt.X - DockingOrigin.X, pt.Y - DockingOrigin.Y);
end;

procedure TdxCustomDockControl.DoStartDocking(pt: TPoint);
begin
  if Assigned(FOnStartDocking) then
    FOnStartDocking(Self, pt.X, pt.Y);
end;

procedure TdxCustomDockControl.StartDocking(pt: TPoint);
var
  R: TRect;
begin
  if not Dockable or (AutoHideControl <> nil) then exit;

  DoStartDocking(pt);
  Controller.FDockingDockControl := Self;
  FDockingTargetZone := nil;
  FDockingPoint := pt;
  if FloatDockSite <> nil then
  begin
    FDockingOrigin.X := pt.X - FloatDockSite.FloatForm.Left;
    FDockingOrigin.Y := pt.Y - FloatDockSite.FloatForm.Top;
  end
  else
  begin
    GetWindowRect(Handle, R);
    FDockingOrigin.X := pt.X - R.Left;
    if (DockingRect.Left > DockingOrigin.X) or (DockingOrigin.X > DockingRect.Right) then
      FDockingOrigin.X := (DockingRect.Right - DockingRect.Left) div 2;
    FDockingOrigin.Y := pt.Y - R.Top;
    if (DockingRect.Top > DockingOrigin.Y) or (DockingOrigin.Y > DockingRect.Bottom) then
      FDockingOrigin.Y := (DockingRect.Bottom - DockingRect.Top) div 2;
  end;
  DrawDockingSelection(DockingTargetZone, DockingPoint, False);
  CaptureMouse;
end;

procedure TdxCustomDockControl.DoDocking(pt: TPoint; TargetZone: TdxZone; var Accept: Boolean);
begin
  if Assigned(FOnDocking) then
    FOnDocking(Self, TargetZone, pt.X, pt.Y, Accept);
end;

procedure TdxCustomDockControl.Docking(pt: TPoint);
var
  AAccept: Boolean;
  ATargetControl: TdxCustomDockControl;
  ATargetZone: TdxZone;
begin
  ATargetControl := GetDockingTargetControlAtPos(pt);
  if (ATargetControl <> nil) and not (GetKeyState(VK_CONTROL) < 0) then
  begin
    ATargetZone := ATargetControl.GetDockZoneAtPos(Self, pt);
    AAccept := True;
    DoDocking(pt, ATargetZone, AAccept);
    if not AAccept then ATargetZone := nil;
  end
  else ATargetZone := nil;
  if (DockingTargetZone <> ATargetZone) or (ATargetZone = nil) then
  begin
    DrawDockingSelection(DockingTargetZone, DockingPoint, True);
    FDockingPoint := pt;
    FDockingTargetZone := ATargetZone;
    DrawDockingSelection(DockingTargetZone, DockingPoint, False);
  end;
  Perform(WM_SETCURSOR, Handle, HTCLIENT);
end;

procedure TdxCustomDockControl.DoEndDocking(pt: TPoint);
begin
  if Assigned(FOnEndDocking) then
    FOnEndDocking(Self, DockingTargetZone, pt.X, pt.Y);
end;

procedure TdxCustomDockControl.EndDocking(pt: TPoint; Cancel: Boolean);
begin
  ReleaseMouse;
  DrawDockingSelection(DockingTargetZone, DockingPoint, True);
  try
    if not Cancel then
    begin
      if DockingTargetZone <> nil then
        DockingTargetZone.DoDock(Self)
      else if AllowFloating then
        MakeFloating(pt.X - DockingOrigin.X, pt.Y - DockingOrigin.Y);
    end;
    DoEndDocking(pt);
  finally
    FDockingTargetZone := nil;
    Controller.FDockingDockControl := nil;
  end;
end;

procedure TdxCustomDockControl.DoStartResize(pt: TPoint);
begin
  if Assigned(FOnStartResizing) then
    FOnStartResizing(Self, ResizingSourceZone, pt.X, pt.Y);
end;

procedure TdxCustomDockControl.StartResize(pt: TPoint);
begin
  FResizingSourceZone := GetResizeZoneAtPos(pt);
  if FResizingSourceZone = nil then exit;

  DoStartResize(pt);
  Controller.FResizingDockControl := Self;
  FResizingOrigin := pt;
  FResizingPoint := pt;
  DrawResizingSelection(ResizingSourceZone, ResizingPoint, False);
  CaptureMouse;
end;

procedure TdxCustomDockControl.DoResizing(pt: TPoint);
begin
  if Assigned(FOnResizing) then
    FOnResizing(Self, ResizingSourceZone, pt.X, pt.Y);
end;

procedure TdxCustomDockControl.Resizing(pt: TPoint);
begin
  if ResizingSourceZone = nil then exit;
  if ResizingSourceZone.CanResize(ResizingOrigin, pt) then
  begin
    DoResizing(pt);;
    DrawResizingSelection(ResizingSourceZone, ResizingPoint, True);
    FResizingPoint := pt;
    DrawResizingSelection(ResizingSourceZone, ResizingPoint, False);
  end;
end;

procedure TdxCustomDockControl.DoEndResize(pt: TPoint);
begin
  if Assigned(FOnEndResizing) then
    FOnEndResizing(Self, ResizingSourceZone, pt.X, pt.Y);
end;

procedure TdxCustomDockControl.EndResize(pt: TPoint; Cancel: Boolean);
begin
  ReleaseMouse;
  if ResizingSourceZone = nil then exit;

  DrawResizingSelection(ResizingSourceZone, ResizingPoint, True);
  try
    if not Cancel and (ParentDockControl <> nil) then
    begin
      if ResizingSourceZone.Owner.AutoHide then
      begin
        ResizingSourceZone.DoResize(ResizingOrigin, ResizingPoint);
        if ResizingSourceZone.Owner.AutoHideHostSite <> nil then
          ResizingSourceZone.Owner.AutoHideHostSite.SetFinalPosition(ResizingSourceZone.Owner);
      end
      else
      begin
        BeginUpdateNC;
        try
          ParentDockControl.NCChanged;
          ResizingSourceZone.DoResize(ResizingOrigin, ResizingPoint);
        finally
          EndUpdateNC;
        end;
      end;
    end;
    DoEndResize(pt);
  finally
    Controller.FResizingDockControl := nil;
    Perform(WM_SETCURSOR, Handle, HTCLIENT);
  end;
end;

function TdxCustomDockControl.CanDock: Boolean;
begin
  Result := False;
end;

function TdxCustomDockControl.CanDockHost(AControl: TdxCustomDockControl; AType: TdxDockingType): Boolean;
begin
  Result := (AControl.ParentForm = ParentForm) and not InDockControl(AControl);
  Result := Result and AControl.CanDock;
  Result := Result and (AType in AControl.AllowDock);
  Result := Result and (AType in AllowDockClients);
  Result := Result and (AutoHideControl = nil);
end;

function TdxCustomDockControl.CanMaximize: Boolean;
begin
  Result := False;
end;

procedure TdxCustomDockControl.CreateContainerLayout(AContainer: TdxContainerDockSite;
  AControl: TdxCustomDockControl; AType: TdxDockingType; Index: Integer);
begin
  if AContainer <> nil then
  begin
    AContainer.BeginUpdateLayout;
    try
      if AType = AContainer.GetTailDockType then Inc(Index);
      AContainer.CreateLayout(AControl, AType, Index);
    finally
      AContainer.EndUpdateLayout;
    end;
  end;
end;

function TdxCustomDockControl.GetContainer: TdxContainerDockSite;
begin
  if ParentDockControl is TdxContainerDockSite then
    Result := ParentDockControl as TdxContainerDockSite
  else Result := nil;
end;

function TdxCustomDockControl.CanAcceptSideContainerItems(AContainer: TdxSideContainerDockSite): Boolean;
begin
  Result := False;
end;

procedure TdxCustomDockControl.DoCreateSideContainerSite(ASite: TdxSideContainerDockSite);
begin
  if (ASite is TdxVertContainerDockSite) and (Controller.DefaultVertContainerSiteProperties <> nil) then
    Controller.DefaultVertContainerSiteProperties.AssignTo(ASite)
  else if (ASite is TdxHorizContainerDockSite) and (Controller.DefaultHorizContainerSiteProperties <> nil) then
    Controller.DefaultHorizContainerSiteProperties.AssignTo(ASite);
  if Assigned(FOnCreateSideContainer) then
    FOnCreateSideContainer(Self, ASite);
  Controller.DoCreateSideContainerSite(Self, ASite);
end;

procedure TdxCustomDockControl.CreateSideContainerLayout(AControl: TdxCustomDockControl;
  AType: TdxDockingType; Index: Integer);
var
  AIndex: Integer;
  AContainerClass: TdxSideContainerDockSiteClass;
  AContainerSite: TdxSideContainerDockSite;
  AParentControl: TdxCustomDockControl;
begin
  case AType of
    dtleft, dtRight: AContainerClass := TdxHorizContainerDockSite;
    dtTop, dtBottom: AContainerClass := TdxVertContainerDockSite;
  else
    AContainerClass := nil;
    Assert(False, Format(sdxInternalErrorCreateLayout, [TdxSideContainerDockSite.ClassName]));
  end;
  AIndex := DockIndex;
  AParentControl := ParentDockControl;
  AParentControl.BeginUpdateLayout;
  try
    ExcludeFromDock;
    AContainerSite := AContainerClass.Create(Owner);
    AContainerSite.Name := AContainerSite.UniqueName;
    AContainerSite.AdjustControlBounds(Self);
    AContainerSite.BeginUpdateLayout;
    try
      AContainerSite.IncludeToDock(AParentControl, DockType, AIndex);
      IncludeToDock(AContainerSite, dtTop, 0);
      if Index = -1 then
      begin
        if AType = AContainerSite.GetHeadDockType then
          AControl.IncludeToDock(AContainerSite, AContainerSite.GetHeadDockType, 0)
        else AControl.IncludeToDock(AContainerSite, AContainerSite.GetTailDockType, 1);
      end
      else AControl.IncludeToDock(AContainerSite, AContainerSite.GetHeadDockType, Index);
      AContainerSite.AdjustChildrenBounds(AControl);
    finally
      AContainerSite.EndUpdateLayout;
    end;
  finally
    AParentControl.EndUpdateLayout;
  end;
  DoCreateSideContainerSite(AContainerSite);
end;

procedure TdxCustomDockControl.DoMaximize;
begin
  if SideContainer <> nil then
  begin
    if (SideContainer.ActiveChild <> nil) and
      (SideContainer.ActiveChildIndex = SideContainerIndex) then
      SideContainer.ActiveChild := nil
    else SideContainer.ActiveChild :=
      SideContainer.Children[SideContainerIndex];
  end;
end;

function TdxCustomDockControl.GetSideContainer: TdxSideContainerDockSite;
begin
  if Container is TdxSideContainerDockSite then
    Result := Container as TdxSideContainerDockSite
  else if TabContainer <> nil then
    Result := TabContainer.GetSideContainer
  else Result := nil;
end;

function TdxCustomDockControl.GetSideContainerItem: TdxCustomDockControl;
begin
  if Container is TdxSideContainerDockSite then
    Result := Self
  else if (TabContainer <> nil) and (TabContainer.SideContainer <> nil) then
    Result := TabContainer
  else Result := nil;
end;

function TdxCustomDockControl.GetSideContainerIndex: Integer;
begin
  if SideContainerItem <> nil then
    Result := SideContainerItem.DockIndex
  else Result := -1;
end;

function TdxCustomDockControl.CanAcceptTabContainerItems(AContainer: TdxTabContainerDockSite): Boolean;
begin
  Result := False;
end;

procedure TdxCustomDockControl.DoCreateTabContainerSite(ASite: TdxTabContainerDockSite);
begin
  if Controller.DefaultTabContainerSiteProperties <> nil then
    Controller.DefaultTabContainerSiteProperties.AssignTo(ASite);
  if Assigned(FOnCreateTabContainer) then
    FOnCreateTabContainer(Self, ASite);
  Controller.DoCreateTabContainerSite(Self, ASite);
end;

procedure TdxCustomDockControl.CreateTabContainerLayout(AControl: TdxCustomDockControl;
  AType: TdxDockingType; Index: Integer);
var
  AIndex: Integer;
  AContainerSite: TdxTabContainerDockSite;
  AParentControl: TdxCustomDockControl;
begin
  AIndex := DockIndex;
  AParentControl := ParentDockControl;
  AParentControl.BeginUpdateLayout;
  try
    ExcludeFromDock;
    AContainerSite := TdxTabContainerDockSite.Create(Owner);
    AContainerSite.Name := AContainerSite.UniqueName;
    AContainerSite.BeginUpdateLayout;
    try
      AContainerSite.AdjustControlBounds(Self);
      AContainerSite.IncludeToDock(AParentControl, DockType, AIndex);
      IncludeToDock(AContainerSite, dtClient, 0);
      AControl.IncludeToDock(AContainerSite, dtClient, Index);
    finally
      AContainerSite.EndUpdateLayout;
    end;
  finally
    AParentControl.EndUpdateLayout;
  end;
  DoCreateTabContainerSite(AContainerSite);
end;

function TdxCustomDockControl.GetTabContainer: TdxTabContainerDockSite;
begin
  if Container is TdxTabContainerDockSite then
    Result := Container as TdxTabContainerDockSite
  else Result := nil;
end;

function TdxCustomDockControl.CanActive: Boolean;
begin
  Result := False;
end;

function TdxCustomDockControl.CanAutoHide: Boolean;
begin
  Result := False;
end;

procedure TdxCustomDockControl.ChangeAutoHide;
begin
  AutoHide := not AutoHide;
end;

function TdxCustomDockControl.GetAutoSizeHostSite: TdxDockSite;
begin
  if (ParentDockControl is TdxDockSite) and (ParentDockControl as TdxDockSite).AutoSize then
    Result := ParentDockControl as TdxDockSite
  else Result := nil;
end;

procedure TdxCustomDockControl.DoAutoHideChanged;
begin
  BeginUpdateNC;
  try
    if AutoHide and not (doImmediatelyHideOnAutoHide in Controller.Options)then
      AutoHideHostSite.ImmediatelyShow(Self);
    if not Visible then UpdateRelatedControlsVisibility;
  finally
    EndUpdateNC;
  end;
  if Assigned(FOnAutoHideChanged) then
    FOnAutoHideChanged(Self);
end;

procedure TdxCustomDockControl.DoAutoHideChanging;
begin
  if Assigned(FOnAutoHideChanging) then
    FOnAutoHideChanging(Self);
  if not AutoHide then AutoHideHostSite.ImmediatelyHide;
end;

procedure TdxCustomDockControl.AutoHideChanged;
var
  I: Integer;
begin
  if IsLoading or (AutoHideHostSite = nil) then exit;

  DoAutoHideChanging;
  BeginUpdateNC;
  try
    AutoHideHostSite.NCChanged;
    NCChanged;
    for I := 0 to ChildCount - 1 do Children[I].InvalidateNC(True);
    ParentDockControl.BeginUpdateLayout;
    try
      if AutoHide then
      begin
        AutoHideHostSite.RegisterAutoHideDockControl(Self, GetAutoHidePosition);
        Controller.ActiveDockControl := nil;
      end
      else
      begin
        AutoHideHostSite.UnregisterAutoHideDockControl(Self);
        Activate;
      end;
      UpdateResizeZones;
    finally
      ParentDockControl.EndUpdateLayout;
    end;
  finally
    EndUpdateNC;
  end;
  DoAutoHideChanged;
end;

function TdxCustomDockControl.GetAutoHidePosition: TdxAutoHidePosition;
begin
  if AutoSizeHostSite <> nil then
    Result := AutoSizeHostSite.GetControlAutoHidePosition(Self)
  else if SideContainer <> nil then
    Result := SideContainer.GetControlAutoHidePosition(Self)
  else if TabContainer <> nil then
    Result := TabContainer.GetControlAutoHidePosition(Self)
  else Result := GetControlAutoHidePosition(Self);
  if Assigned(FOnGetAutoHidePosition) then
    FOnGetAutoHidePosition(Self, Result);
end;

function TdxCustomDockControl.GetControlAutoHidePosition(AControl: TdxCustomDockControl): TdxAutoHidePosition;
begin
  case AControl.DockType of
    dtLeft: Result := ahpLeft;
    dtTop: Result := ahpTop;
    dtRight: Result := ahpRight;
    dtBottom: Result := ahpBottom;
  else
    if AControl.HandleAllocated then
    begin
      if AControl.Width > AControl.Height then
        if AControl.Top - AControl.AutoHideHostSite.ClientOrigin.Y <=
          (AControl.Top + AControl.Height) - (AControl.AutoHideHostSite.ClientOrigin.Y +
          AControl.AutoHideHostSite.ClientHeight) then
          Result := ahpTop
        else Result := ahpBottom
      else
        if AControl.Left - AControl.AutoHideHostSite.ClientOrigin.X <=
          (AControl.Left + AControl.Width) - (AControl.AutoHideHostSite.ClientOrigin.X +
          AControl.AutoHideHostSite.ClientWidth) then
          Result := ahpLeft
        else Result := ahpRight;
    end
    else Result := ahpLeft;
  end;
end;

function TdxCustomDockControl.GetAutoHideHostSite: TdxDockSite;
begin
  if TopMostDockControl is TdxDockSite then
    Result := TopMostDockControl as TdxDockSite
  else Result := nil;
end;

function TdxCustomDockControl.GetAutoHideContainer: TdxDockSiteAutoHideContainer;
begin
  if Parent is TdxDockSiteAutoHideContainer then
    Result := Parent as TdxDockSiteAutoHideContainer
  else Result := nil;
end;

function TdxCustomDockControl.GetAutoHideControl: TdxCustomDockControl;
var
  AControl: TdxCustomDockControl;
begin
  Result := nil;
  AControl := Self;
  while AControl <> nil do
  begin
    if AControl.AutoHide then
    begin
      Result := AControl;
      break;
    end;
    AControl := AControl.ParentDockControl;
  end;
end;

procedure TdxCustomDockControl.DoParentChanged;
begin
  if not IsLoading and Assigned(FOnParentChanged) then
    FOnParentChanged(Self);
end;

procedure TdxCustomDockControl.DoParentChanging;
begin
  if not IsLoading and Assigned(FOnParentChanging) then
    FOnParentChanging(Self);
end;

procedure TdxCustomDockControl.IncludeToDock(AControl: TdxCustomDockControl; AType: TdxDockingType;
  Index: Integer);
begin
  BeginUpdateLayout;
  try
    AControl.NCChanged;
    SetDockType(AType);
    SetParentDockControl(AControl);
    ParentDockControl.AddDockControl(Self, Index);
    UpdateOriginalSize;
    UpdateCaption;
    AControl.DoLayoutChanged;
  finally
    EndUpdateLayout;
  end;
end;

procedure TdxCustomDockControl.ExcludeFromDock;
var
  AControl: TdxCustomDockControl;
begin
  BeginUpdateLayout;
  try
    AControl := ParentDockControl;
    AControl.NCChanged;
    SetParentDockControl(nil);
    AControl.RemoveDockControl(Self);
    AdjustControlBounds(Self);
    ClearZones(DockZones);
    ClearZones(ResizeZones);
    AControl.DoLayoutChanged;
  finally
    EndUpdateLayout;
  end;
end;

procedure TdxCustomDockControl.AdjustControlBounds(AControl: TdxCustomDockControl);
begin
  Width := AControl.OriginalWidth;
  Height := AControl.OriginalHeight;
  FOriginalWidth := AControl.OriginalWidth;
  FOriginalHeight := AControl.OriginalHeight;
end;

procedure TdxCustomDockControl.CreateLayout(AControl: TdxCustomDockControl;
  AType: TdxDockingType; Index: Integer);
var
  AParentSite, ASite1, ASite2: TdxCustomDockControl;
begin
  case ChildCount of
    0: begin
      ASite1 := TdxLayoutDockSite.Create(Owner);
      ASite1.Name := ASite1.UniqueName;
      ASite1.IncludeToDock(Self, dtClient, 0);
      AControl.IncludeToDock(Self, AType, 1);
      DoCreateLayoutSite(ASite1 as TdxLayoutDockSite);
    end;
    2: begin
      ASite1 := Children[0];
      ASite2 := Children[1];
      ASite1.ExcludeFromDock;
      ASite2.ExcludeFromDock;
      AParentSite := TdxLayoutDockSite.Create(Owner);
      AParentSite.Name := AParentSite.UniqueName;
      AParentSite.IncludeToDock(Self, dtClient, 0);
      ASite1.IncludeToDock(AParentSite, ASite1.DockType, 0);
      ASite2.IncludeToDock(AParentSite, ASite2.DockType, 1);
      AControl.IncludeToDock(Self, AType, 1);
      DoCreateLayoutSite(AParentSite as TdxLayoutDockSite);
    end;
  else
    Assert(False, Format(sdxInternalErrorCreateLayout, [TdxCustomDockControl.ClassName]));
  end;
end;

procedure TdxCustomDockControl.DestroyLayout(AControl: TdxCustomDockControl);
var
  ADummySite: TdxCustomDockControl;
  ASite1, ASite2: TdxCustomDockControl;
begin
  AControl.ExcludeFromDock;
  if ChildCount = 1 then
  begin
    ADummySite := Children[0];
    case ADummySite.ChildCount of
      0: ADummySite.ExcludeFromDock;
      2: begin
        ASite1 := ADummySite.Children[0];
        ASite2 := ADummySite.Children[1];
        ASite1.ExcludeFromDock;
        ASite2.ExcludeFromDock;
        ADummySite.ExcludeFromDock;
        ASite1.IncludeToDock(Self, ASite1.DockType, 0);
        ASite2.IncludeToDock(Self, ASite2.DockType, 1);
      end
    else
      Assert(False, Format(sdxInternalErrorDestroyLayout, [TdxCustomDockControl.ClassName]));
    end;
    ADummySite.DoDestroy;
  end;
end;

procedure TdxCustomDockControl.RemoveFromLayuot;
begin
  if AutoHide and (AutoHideHostSite <> nil) and not AutoHideHostSite.IsDestroying then
    AutoHide := False;
  if (ParentDockControl <> nil) and not ParentDockControl.IsDestroying then
    UnDock;
end;

procedure TdxCustomDockControl.UpdateLayout;
begin
  UpdateDockZones;
  UpdateResizeZones;
end;

function TdxCustomDockControl.GetMinimizedHeight: Integer;
begin
  if not HasCaption then
    Result := 28
  else if IsCaptionVertical then
    Result := 2 * Painter.GetBorderWidth + 6 * Painter.GetCaptionHorizInterval +
    3 * Painter.GetCaptionButtonSize
  else Result := Painter.GetCaptionHeight + 2 * Painter.GetBorderWidth;
end;

function TdxCustomDockControl.GetMinimizedWidth: Integer;
begin
  if not HasCaption then
    Result := 58
  else if IsCaptionVertical then
    Result := Painter.GetCaptionHeight + 2 * Painter.GetBorderWidth
  else Result := 2 * Painter.GetBorderWidth + 6 * Painter.GetCaptionHorizInterval +
    3 * Painter.GetCaptionButtonSize;
end;

procedure TdxCustomDockControl.UpdateControlOriginalSize(AControl: TdxCustomDockControl);
var
  AHideBar: TdxDockSiteHideBar;
begin
  if AControl.AutoHide and (AControl.AutoHideHostSite <> nil) {and
    (AControl.AutoHideHostSite.ShowingControl = AControl) }then
  begin
    AHideBar := AutoHideHostSite.GetHideBarByControl(AControl);
    if AHideBar <> nil then
      case AHideBar.Position of
        ahpLeft, ahpRight: AControl.FOriginalWidth := Width;
        ahpTop, ahpBottom: AControl.FOriginalHeight := Height;
      end;
  end
  else case DockType of
    dtLeft, dtRight:
      AControl.FOriginalWidth := Width;
    dtTop, dtBottom:
      AControl.FOriginalHeight := Height;
    dtClient: ;
  else
    AControl.FOriginalWidth := Width;
    AControl.FOriginalHeight := Height;
  end;
end;

procedure TdxCustomDockControl.UpdateOriginalSize;
begin
  if IsLoading then exit;
  if not Visible then exit;
  if FloatDockSite <> nil then
    FloatDockSite.UpdateControlOriginalSize(Self)
  else if AutoHideControl <> nil then
    AutoHideControl.UpdateControlOriginalSize(Self)
  else if AutoSizeHostSite <> nil then
    AutoSizeHostSite.UpdateControlOriginalSize(Self)
  else if SideContainer <> nil then
    SideContainer.UpdateControlOriginalSize(Self)
  else if TabContainer <> nil then
    TabContainer.UpdateControlOriginalSize(Self)
  else UpdateControlOriginalSize(Self);
end;

procedure TdxCustomDockControl.DoUpdateDockZones;
begin
  if Assigned(FOnUpdateDockZones) then
    FOnUpdateDockZones(Self, DockZones);
  Controller.DoUpdateDockZones(Self);
end;

procedure TdxCustomDockControl.UpdateControlDockZones(AControl: TdxCustomDockControl; AZoneWidth: Integer);
begin
  if TdxLeftZone.ValidateDockZone(Self, AControl) then
    AControl.DockZones.Insert(0, TdxLeftZone.Create(Self, AZoneWidth));
  if TdxRightZone.ValidateDockZone(Self, AControl) then
    AControl.DockZones.Insert(0, TdxRightZone.Create(Self, AZoneWidth));
  if TdxTopZone.ValidateDockZone(Self, AControl) then
    AControl.DockZones.Insert(0, TdxTopZone.Create(Self, AZoneWidth));
  if TdxBottomZone.ValidateDockZone(Self, AControl) then
    AControl.DockZones.Insert(0, TdxBottomZone.Create(Self, AZoneWidth));
end;

procedure TdxCustomDockControl.UpdateDockZones;
var
  I: Integer;
  AControl: TdxCustomDockControl;
  AZoneLevel, AZoneWidth: Integer;
begin
  if IsDestroying then exit;
  ClearZones(DockZones);
  AZoneLevel := DockLevel;
  AZoneWidth := dxDockZonesWidth;
  AControl := Self;
  while True do
  begin
    AControl.UpdateControlDockZones(Self, AZoneWidth);
    AControl := AControl.ParentDockControl;
    if AControl = nil then break;
    AZoneWidth := AZoneWidth - dxDockZonesWidth div AZoneLevel;
  end;
  DoUpdateDockZones;
  for I := 0 to ChildCount - 1 do
    Children[I].UpdateDockZones;
end;

procedure TdxCustomDockControl.DoUpdateResizeZones;
begin
  if Assigned(FOnUpdateResizeZones) then
    FOnUpdateResizeZones(Self, DockZones);
  Controller.DoUpdateResizeZones(Self);
end;

procedure TdxCustomDockControl.UpdateControlResizeZones(AControl: TdxCustomDockControl);
begin
  if AControl.AutoHide and (AControl.AutoHideHostSite <> nil) then
  begin
    if TdxAutoHideRightZone.ValidateResizeZone(Self, AControl) then
      AControl.ResizeZones.Insert(0, TdxAutoHideRightZone.Create(Self, dxResizeZoneWidth));
    if TdxAutoHideLeftZone.ValidateResizeZone(Self, AControl) then
      AControl.ResizeZones.Insert(0, TdxAutoHideLeftZone.Create(Self, dxResizeZoneWidth));
    if TdxAutoHideBottomZone.ValidateResizeZone(Self, AControl) then
      AControl.ResizeZones.Insert(0, TdxAutoHideBottomZone.Create(Self, dxResizeZoneWidth));
    if TdxAutoHideTopZone.ValidateResizeZone(Self, AControl) then
      AControl.ResizeZones.Insert(0, TdxAutoHideTopZone.Create(Self, dxResizeZoneWidth));
  end
  else
  begin
    if TdxRightZone.ValidateResizeZone(Self, AControl) then
      AControl.ResizeZones.Insert(0, TdxRightZone.Create(Self, dxResizeZoneWidth));
    if TdxLeftZone.ValidateResizeZone(Self, AControl) then
      AControl.ResizeZones.Insert(0, TdxLeftZone.Create(Self, dxResizeZoneWidth));
    if TdxBottomZone.ValidateResizeZone(Self, AControl) then
      AControl.ResizeZones.Insert(0, TdxBottomZone.Create(Self, dxResizeZoneWidth));
    if TdxTopZone.ValidateResizeZone(Self, AControl) then
      AControl.ResizeZones.Insert(0, TdxTopZone.Create(Self, dxResizeZoneWidth));
  end;
end;

procedure TdxCustomDockControl.UpdateResizeZones;
var
  I: Integer;
begin
  ClearZones(ResizeZones);
  if AutoHideControl <> nil then
    AutoHideControl.UpdateControlResizeZones(Self)
  else if AutoSizeHostSite <> nil then
    AutoSizeHostSite.UpdateControlResizeZones(Self)
  else if SideContainer <> nil then
    SideContainer.UpdateControlResizeZones(Self)
  else if TabContainer <> nil then
    TabContainer.UpdateControlResizeZones(Self)
  else UpdateControlResizeZones(Self);
  DoUpdateResizeZones;
  for I := 0 to ChildCount - 1 do
    Children[I].UpdateResizeZones;
end;

procedure TdxCustomDockControl.DoCreateFloatSite(ASite: TdxFloatDockSite);
begin
  if Controller.DefaultFloatSiteProperties <> nil then
    Controller.DefaultFloatSiteProperties.AssignTo(ASite);
  if Assigned(FOnCreateFloatSite) then
    FOnCreateFloatSite(Self, ASite);
  Controller.DoCreateFloatSite(Self, ASite);
end;

procedure TdxCustomDockControl.UpdateCaption;
begin
  if Container <> nil then
    Container.UpdateCaption
  else if FloatDockSite <> nil then
    FloatDockSite.UpdateCaption;
end;

function TdxCustomDockControl.ClientToWindow(pt: TPoint): TPoint;
var
  Rect: TRect;
begin
  pt := ClientToScreen(pt);
  GetWindowRect(Handle, Rect);
  Result.X := pt.X - Rect.Left;
  Result.Y := pt.Y - Rect.Top;
end;

function TdxCustomDockControl.ScreenToWindow(pt: TPoint): TPoint;
var
  Rect: TRect;
begin
  GetWindowRect(Handle, Rect);
  Result.X := pt.X - Rect.Left;
  Result.Y := pt.Y - Rect.Top;
end;

function TdxCustomDockControl.WindowToClient(pt: TPoint): TPoint;
var
  Rect: TRect;
begin
  GetWindowRect(Handle, Rect);
  Result.X := Rect.Left + pt.X;
  Result.Y := Rect.Top + pt.Y;
  Result := ScreenToClient(Result);
end;

function TdxCustomDockControl.WindowToScreen(pt: TPoint): TPoint;
var
  Rect: TRect;
begin
  GetWindowRect(Handle, Rect);
  Result.X := pt.X + Rect.Left;
  Result.Y := pt.Y + Rect.Top;
end;

procedure TdxCustomDockControl.CalculateNC(var ARect: TRect);
var
  APos: Integer;
begin
  inherited;
  if HasBorder then
    InflateRect(ARect, -Painter.GetBorderWidth, -Painter.GetBorderWidth);
  if HasCaption then
  begin
    if IsCaptionVertical then
    begin
      FCaptionRect.Left := ARect.Left;
      FCaptionRect.Top := ARect.Top;
      FCaptionRect.Right := FCaptionRect.Left + Painter.GetCaptionHeight;
      FCaptionRect.Bottom := ARect.Bottom;
      APos := FCaptionRect.Top + 2 * Painter.GetCaptionHorizInterval;
      if HasCaptionCloseButton then
      begin
        FCaptionCloseButtonRect.Left := FCaptionRect.Left + ((FCaptionRect.Right - FCaptionRect.Left) -
          Painter.GetCaptionButtonSize) div 2;
        FCaptionCloseButtonRect.Right := FCaptionCloseButtonRect.Left + Painter.GetCaptionButtonSize;
        FCaptionCloseButtonRect.Top := APos;
        FCaptionCloseButtonRect.Bottom := FCaptionCloseButtonRect.Top + Painter.GetCaptionButtonSize;
        APos := FCaptionCloseButtonRect.Bottom + Painter.GetCaptionHorizInterval;
      end;
      if HasCaptionHideButton then
      begin
        FCaptionHideButtonRect.Left := FCaptionRect.Left + ((FCaptionRect.Right - FCaptionRect.Left) -
          Painter.GetCaptionButtonSize) div 2;
        FCaptionHideButtonRect.Right := FCaptionHideButtonRect.Left + Painter.GetCaptionButtonSize;
        FCaptionHideButtonRect.Top := APos;
        FCaptionHideButtonRect.Bottom := FCaptionHideButtonRect.Top +  Painter.GetCaptionButtonSize;
        APos := FCaptionHideButtonRect.Bottom + Painter.GetCaptionHorizInterval;
      end;
      if HasCaptionMaximizeButton then
      begin
        FCaptionMaximizeButtonRect.Left := FCaptionRect.Left + ((FCaptionRect.Right - FCaptionRect.Left) -
          Painter.GetCaptionButtonSize) div 2;
        FCaptionMaximizeButtonRect.Right := FCaptionMaximizeButtonRect.Left + Painter.GetCaptionButtonSize;
        FCaptionMaximizeButtonRect.Top := APos;
        FCaptionMaximizeButtonRect.Bottom := FCaptionMaximizeButtonRect.Top + Painter.GetCaptionButtonSize;
        APos := FCaptionMaximizeButtonRect.Bottom + Painter.GetCaptionHorizInterval;
      end;
      FCaptionTextRect := FCaptionRect;
      FCaptionTextRect.Bottom := FCaptionTextRect.Bottom - 2 * Painter.GetCaptionHorizInterval;
      FCaptionTextRect.Top := APos;
      ARect.Left := FCaptionRect.Right + Painter.GetBorderWidth;
    end
    else
    begin
      FCaptionRect.Left := ARect.Left;
      FCaptionRect.Top := ARect.Top;
      FCaptionRect.Bottom := FCaptionRect.Top + Painter.GetCaptionHeight;
      FCaptionRect.Right := ARect.Right;
      APos := FCaptionRect.Right - 2 * Painter.GetCaptionHorizInterval;
      if HasCaptionCloseButton then
      begin
        FCaptionCloseButtonRect.Top := FCaptionRect.Top + ((FCaptionRect.Bottom - FCaptionRect.Top) -
          Painter.GetCaptionButtonSize) div 2;
        FCaptionCloseButtonRect.Bottom := FCaptionCloseButtonRect.Top + Painter.GetCaptionButtonSize;
        FCaptionCloseButtonRect.Right := APos;
        FCaptionCloseButtonRect.Left := FCaptionCloseButtonRect.Right - Painter.GetCaptionButtonSize;
        APos := FCaptionCloseButtonRect.Left - Painter.GetCaptionHorizInterval;
      end;
      if HasCaptionHideButton then
      begin
        FCaptionHideButtonRect.Top := FCaptionRect.Top + ((FCaptionRect.Bottom - FCaptionRect.Top) -
          Painter.GetCaptionButtonSize) div 2;
        FCaptionHideButtonRect.Bottom := FCaptionHideButtonRect.Top + Painter.GetCaptionButtonSize;
        FCaptionHideButtonRect.Right := APos;
        FCaptionHideButtonRect.Left := FCaptionHideButtonRect.Right -  Painter.GetCaptionButtonSize;
        APos := FCaptionHideButtonRect.Left - Painter.GetCaptionHorizInterval;
      end;
      if HasCaptionMaximizeButton then
      begin
        FCaptionMaximizeButtonRect.Top := FCaptionRect.Top + ((FCaptionRect.Bottom - FCaptionRect.Top) -
          Painter.GetCaptionButtonSize) div 2;
        FCaptionMaximizeButtonRect.Bottom := FCaptionMaximizeButtonRect.Top + Painter.GetCaptionButtonSize;
        FCaptionMaximizeButtonRect.Right := APos;
        FCaptionMaximizeButtonRect.Left := FCaptionMaximizeButtonRect.Right - Painter.GetCaptionButtonSize;
        APos := FCaptionMaximizeButtonRect.Left - Painter.GetCaptionHorizInterval;
      end;
      FCaptionTextRect := FCaptionRect;
      FCaptionTextRect.Left := FCaptionTextRect.Left + 2 * Painter.GetCaptionHorizInterval;
      FCaptionTextRect.Right := APos;
      ARect.Top := FCaptionRect.Bottom + Painter.GetBorderWidth;
    end;
  end;
end;

procedure TdxCustomDockControl.InvalidateNC(ANeedRecalculate: Boolean);
var
  R: TRect;
begin
  if HandleAllocated and ANeedRecalculate then
  begin
    R := WindowRect;
    CalculateNC(R);
  end;
  if HandleAllocated and CanUpdateNC then
    Perform(WM_NCPAINT, 0, 0);
end;

procedure TdxCustomDockControl.NCChanged;
begin
  if HandleAllocated and CanCalculateNC then
    SetWindowPos(Handle, 0, 0, 0, 0, 0, SWP_NOZORDER or SWP_NOMOVE or SWP_NOSIZE or
      SWP_NOACTIVATE or SWP_FRAMECHANGED);
end;

procedure TdxCustomDockControl.BeginUpdateNC;
begin
  Controller.BeginUpdateNC;
end;

procedure TdxCustomDockControl.EndUpdateNC;
begin
  Controller.EndUpdateNC;
end;

function TdxCustomDockControl.CanUpdateNC: Boolean;
begin
  Result := Controller.CanUpdateNC(Self);
end;

function TdxCustomDockControl.CanCalculateNC: Boolean;
begin
  Result := Controller.CanCalculateNC(Self) or (csAlignmentNeeded in ControlState);
end;

function TdxCustomDockControl.HasBorder: Boolean;
begin
  Result := False;
end;

function TdxCustomDockControl.HasCaption: Boolean;
begin
  Result := False;
end;

function TdxCustomDockControl.HasCaptionCloseButton: Boolean;
begin
  Result := HasCaption and (cbClose in CaptionButtons);
end;

function TdxCustomDockControl.HasCaptionHideButton: Boolean;
begin
  Result := HasCaption and (cbHide in CaptionButtons) and CanAutoHide;
end;

function TdxCustomDockControl.HasCaptionMaximizeButton: Boolean;
begin
  Result := HasCaption and (cbMaximize in CaptionButtons) and CanMaximize;
end;

function TdxCustomDockControl.IsCaptionActive: Boolean;
begin
  Result := Controller.ActiveDockControl = Self;
end;

function TdxCustomDockControl.IsCaptionVertical: Boolean;
var
  ADockType: TdxDockingType;
begin
  if SideContainer <> nil then
    ADockType := SideContainer.DockType
  else ADockType := DockType;
  Result := Painter.CanVerticalCaption and (ADockType in [dtTop, dtBottom]);
end;

function TdxCustomDockControl.IsCaptionPoint(pt: TPoint): Boolean;
begin
  Result := HasCaption and PtInRect(CaptionRect, ClientToWindow(pt));
end;

function TdxCustomDockControl.IsCaptionCloseButtonPoint(pt: TPoint): Boolean;
begin
  Result := HasCaptionCloseButton and PtInRect(CaptionCloseButtonRect, ClientToWindow(pt));
end;

function TdxCustomDockControl.IsCaptionHideButtonPoint(pt: TPoint): Boolean;
begin
  Result := HasCaptionHideButton and PtInRect(CaptionHideButtonRect, ClientToWindow(pt));
end;

function TdxCustomDockControl.IsCaptionMaximizeButtonPoint(pt: TPoint): Boolean;
begin
  Result := HasCaptionMaximizeButton and PtInRect(CaptionMaximizeButtonRect, ClientToWindow(pt));
end;

procedure TdxCustomDockControl.NCPaint(ACanvas: TCanvas);
begin
  if HasBorder then
  begin
    Painter.DrawBorder(ACanvas, WindowRect);
    with WindowRect do
    begin
      ExcludeClipRect(ACanvas.Handle, Left, Top, Left + Painter.GetBorderWidth, Bottom);
      ExcludeClipRect(ACanvas.Handle, Left, Bottom - Painter.GetBorderWidth, Right, Bottom);
      ExcludeClipRect(ACanvas.Handle, Right - Painter.GetBorderWidth, Top, Left + Right, Bottom);
      ExcludeClipRect(ACanvas.Handle, Left, Top, Right, Top + Painter.GetBorderWidth);
    end;
  end;
  if HasCaption then
  begin
    Painter.DrawCaption(ACanvas, CaptionRect, IsCaptionActive);
    Painter.DrawCaptionText(ACanvas, CaptionTextRect, IsCaptionActive);
    if HasCaptionCloseButton then
      Painter.DrawCaptionCloseButton(ACanvas, CaptionCloseButtonRect, IsCaptionActive, CloseButtonIsDown,
        CloseButtonIsHot, False);
    if HasCaptionHideButton then
      Painter.DrawCaptionHideButton(ACanvas, CaptionHideButtonRect, IsCaptionActive, HideButtonIsDown,
        HideButtonIsHot, AutoHide);
    if HasCaptionMaximizeButton then
      Painter.DrawCaptionMaximizeButton(ACanvas, CaptionMaximizeButtonRect, IsCaptionActive, MaximizeButtonIsDown,
        MaximizeButtonIsHot, (SideContainer <> nil) and (SideContainer.ActiveChild = Self));
    with CaptionRect do
      ExcludeClipRect(ACanvas.Handle, Left, Top, Right, Bottom);
  end;
end;

procedure TdxCustomDockControl.Paint;
begin
  if CanUpdateNC then
    Painter.DrawClient(Canvas, ClientRect);
end;

procedure TdxCustomDockControl.DoLayoutChanged;
begin
  if (UpdateLayoutLock = 0) and not IsDestroying then
  begin
    UpdateLayout;
    if Assigned(FOnLayoutChanged) then
      FOnLayoutChanged(Self);
  end;
end;

procedure TdxCustomDockControl.BeginUpdateLayout;
begin
  Inc(FUpdateLayoutLock);
end;

procedure TdxCustomDockControl.EndUpdateLayout;
begin
  Dec(FUpdateLayoutLock);
  DoLayoutChanged;
end;

procedure TdxCustomDockControl.LoadLayoutFromCustomIni(AIniFlie: TCustomIniFile;
  AParentControl: TdxCustomDockControl; ASection: string);
var
  I, AChildCount: Integer;
  AChildSection: string;
  ADockType: TdxDockingType;
  ADockTypes: TdxDockingTypes;
begin
  BeginUpdateLayout;
  try
    with AIniFlie do
    begin
      ADockType := TdxDockingTypeEx(ReadInteger(ASection, 'DockType', 0));
      ADockTypes := [];
      if ReadBool(ASection, 'AllowDockLeft', dtLeft in AllowDock) then
        ADockTypes := ADockTypes + [dtLeft];
      if ReadBool(ASection, 'AllowDockTop', dtTop in AllowDock) then
        ADockTypes := ADockTypes + [dtTop];
      if ReadBool(ASection, 'AllowDockRight', dtRight in AllowDock) then
        ADockTypes := ADockTypes + [dtRight];
      if ReadBool(ASection, 'AllowDockBottom', dtBottom in AllowDock) then
        ADockTypes := ADockTypes + [dtBottom];
      if ReadBool(ASection, 'AllowDockClient', dtClient in AllowDock) then
        ADockTypes := ADockTypes + [dtClient];
      AllowDock := ADockTypes;
      ADockTypes := [];
      if ReadBool(ASection, 'AllowDockClientsLeft', dtLeft in AllowDockClients) then
        ADockTypes := ADockTypes + [dtLeft];
      if ReadBool(ASection, 'AllowDockClientsTop', dtTop in AllowDockClients) then
        ADockTypes := ADockTypes + [dtTop];
      if ReadBool(ASection, 'AllowDockClientsRight', dtRight in AllowDockClients) then
        ADockTypes := ADockTypes + [dtRight];
      if ReadBool(ASection, 'AllowDockClientsBottom', dtBottom in AllowDockClients) then
        ADockTypes := ADockTypes + [dtBottom];
      if ReadBool(ASection, 'AllowDockClientsClient', dtClient in AllowDockClients) then
        ADockTypes := ADockTypes + [dtClient];
      AllowDockClients := ADockTypes;
      AllowFloating := ReadBool(ASection, 'AllowFloating', AllowFloating);
      Dockable := ReadBool(ASection, 'Dockable', Dockable);
      Width := ReadInteger(ASection, 'Width', Width);
      Height := ReadInteger(ASection, 'Height', Height);
      FOriginalWidth := ReadInteger(ASection, 'OriginalWidth', OriginalWidth);
      FOriginalHeight := ReadInteger(ASection, 'OriginalHeight', OriginalHeight);
      Visible := ReadBool(ASection, 'Visible', Visible);
      if (AParentControl <> nil) then
        IncludeToDock(AParentControl, ADockType, -1);
      AChildCount := ReadInteger(ASection, 'ChildCount', 0);
      for I := 0 to AChildCount - 1 do
      begin
        AChildSection := ReadString(ASection, 'Children' + IntToStr(I), '');
        Controller.LoadControlFromCustomIni(AIniFlie, Self, AChildSection);
      end;
      FAutoHide := ReadBool(ASection, 'AutoHide', False);
      if AutoHide and (AutoHideHostSite <> nil) then
        AutoHideHostSite.RegisterAutoHideDockControl(Self, GetAutoHidePosition);
    end;
  finally
    EndUpdateLayout;
  end;
end;

procedure TdxCustomDockControl.SaveLayoutToCustomIni(AIniFlie: TCustomIniFile; ASection: string);
var
  I: Integer;
begin
  with AIniFlie do
  begin
    WriteInteger(ASection, 'ChildCount', ChildCount);
    for I := 0 to ChildCount - 1 do
      WriteString(ASection, 'Children' + IntToStr(I), IntToStr(Controller.IndexOfDockControl(Children[I])));
    WriteInteger(ASection, 'DockType', Integer(DockType));
    WriteBool(ASection, 'AllowDockLeft', dtLeft in AllowDock);
    WriteBool(ASection, 'AllowDockTop', dtTop in AllowDock);
    WriteBool(ASection, 'AllowDockRight', dtRight in AllowDock);
    WriteBool(ASection, 'AllowDockBottom', dtBottom in AllowDock);
    WriteBool(ASection, 'AllowDockClient', dtClient in AllowDock);
    WriteBool(ASection, 'AllowDockClientsLeft', dtLeft in AllowDockClients);
    WriteBool(ASection, 'AllowDockClientsTop', dtTop in AllowDockClients);
    WriteBool(ASection, 'AllowDockClientsRight', dtRight in AllowDockClients);
    WriteBool(ASection, 'AllowDockClientsBottom', dtBottom in AllowDockClients);
    WriteBool(ASection, 'AllowDockClientsClient', dtClient in AllowDockClients);
    WriteBool(ASection, 'AllowFloating', AllowFloating);
    WriteBool(ASection, 'Dockable', Dockable);
    WriteInteger(ASection, 'Width', Width);
    WriteInteger(ASection, 'Height', Height);
    WriteInteger(ASection, 'OriginalWidth', OriginalWidth);
    WriteInteger(ASection, 'OriginalHeight', OriginalHeight);
    WriteBool(ASection, 'Visible', Visible);
    WriteBool(ASection, 'AutoHide', AutoHide);
  end;
  for I := 0 to ChildCount - 1 do
    Controller.SaveControlToCustomIni(AIniFlie, Children[I]);
end;

function TdxCustomDockControl.GetDockIndex: Integer;
begin
  if ParentDockControl <> nil then
    Result := ParentDockControl.IndexOfControl(Self)
  else Result := -1;
end;

function TdxCustomDockControl.GetDockLevel: Integer;
var
  AControl: TdxCustomDockControl;
begin
  AControl := Self;
  Result := 0;
  while True do
  begin
    Inc(Result);
    AControl := AControl.ParentDockControl;
    if AControl = nil then break;
  end;
end;

function TdxCustomDockControl.GetDockingRect: TRect;
begin
  if FloatDockSite <> nil then
  begin
    Result := FloatDockSite.FloatForm.BoundsRect;
    OffsetRect(Result, - FloatDockSite.FloatForm.Left, - FloatDockSite.FloatForm.Top);
  end
  else Result := Rect(0, 0, OriginalWidth, OriginalHeight);
end;

function TdxCustomDockControl.GetDockState: TdxDockingState;
begin
  if FDestroyed then
    Result := dsDestroyed
  else if (ParentDockControl = nil) and (Parent = nil) then
    Result := dsUndocked
  else if not Visible then
    Result := dsHidden
  else if FloatDockSite <> nil then
    Result := dsFloating
  else Result := dsDocked;
end;

function TdxCustomDockControl.GetChild(Index: Integer): TdxCustomDockControl;
begin
  Result := TdxCustomDockControl(FDockControls.Items[Index]);
end;

function TdxCustomDockControl.GetChildCount: Integer;
begin
  Result := FDockControls.Count;
end;

function TdxCustomDockControl.GetImages: TImageList;
begin
  Result := Controller.Images;
end;

function TdxCustomDockControl.IsColorStored: Boolean;
begin
  Result := not ManagerColor and not ParentColor;
end;

function TdxCustomDockControl.IsFontStored: Boolean;
begin
  Result := not ManagerFont and not ParentFont;
end;

function TdxCustomDockControl.GetController: TdxDockingController;
begin
  Result := dxDockingController;
end;

function TdxCustomDockControl.GetPainter: TdxDockControlPainter;
begin
  if FPainter = nil then
    FPainter := Controller.PainterClass.Create(Self);
  Result := FPainter;
end;

procedure TdxCustomDockControl.SetAllowDockClients(const Value: TdxDockingTypes);
begin
  if FAllowDockClients <> Value then
  begin
    FAllowDockClients := Value;
    if not IsLoading then
    begin
      CheckDockClientsRules;
      UpdateDockZones;
    end;
  end;
end;

procedure TdxCustomDockControl.SetAllowFloating(const Value: Boolean);
begin
  if (FAllowFloating <> Value) and (DockState <> dsFloating) then
  begin
    FAllowFloating := Value;
  end;
end;

procedure TdxCustomDockControl.SetAllowDock(const Value: TdxDockingTypes);
begin
  if FAllowDock <> Value then
  begin
    FAllowDock := Value;
    if not IsLoading then
    begin
      CheckDockRules;
      UpdateDockZones;
    end;
  end;
end;

procedure TdxCustomDockControl.SetAutoHide(const Value: Boolean);
begin
  if (FAutoHide <> Value) and (CanAutoHide or not Value)then
  begin
    FAutoHide := Value;
    AutoHideChanged;
    Modified;
  end;
end;

procedure TdxCustomDockControl.SetCaptionButtons(Value: TdxCaptionButtons);
begin
  if FCaptionButtons <> Value then
  begin
    FCaptionButtons := Value;
    InvalidateNC(True);
  end;
end;

procedure TdxCustomDockControl.SetDockable(const Value: Boolean);
begin
  if FDockable <> Value then
  begin
    FDockable := Value;
  end;
end;

procedure TdxCustomDockControl.SetDockType(Value: TdxDockingType);
begin
  FDockType := Value;
  if (FDockType <> dtNone) and (not AutoHide or IsLoading) then
    Align := dxDockingTypeAlign[Value];
end;

procedure TdxCustomDockControl.SetImageIndex(const Value: Integer);
begin
  if FImageIndex <> Value then
  begin
    FImageIndex := Value;
    if HasCaption then
      NCChanged;
    if (AutoHideControl <> nil) and (AutoHideHostSite <> nil) then
      AutoHideHostSite.InvalidateNC(True);
    if TabContainer <> nil then
      TabContainer.InvalidateNC(True);
  end;
end;

procedure TdxCustomDockControl.SetManagerColor(const Value: Boolean);
begin
  if FManagerColor <> Value then
  begin
    if Value and not IsLoading then
      Color := Controller.Color;
    FManagerColor := Value;
    InvalidateNC(False);
  end;
end;

procedure TdxCustomDockControl.SetManagerFont(const Value: Boolean);
begin
  if FManagerFont  <> Value then
  begin
    if Value and not IsLoading then
      Font := Controller.Font;
    FManagerFont := Value;
    NCChanged;
  end;
end;

procedure TdxCustomDockControl.SetParentDockControl(Value: TdxCustomDockControl);
begin
  FParentDockControl := Value;
  if not AutoHide then
    Parent := Value;
end;

procedure TdxCustomDockControl.SetShowCaption(const Value: Boolean);
begin
  if FShowCaption <> Value then
  begin
    FShowCaption := Value;
    NCChanged;
  end;
end;

procedure TdxCustomDockControl.SetUseDoubleBuffer(const Value: Boolean);
begin
  if FUseDoubleBuffer <> Value then
  begin
    FUseDoubleBuffer := Value;
    if FUseDoubleBuffer then
    begin
      if FCanvasBitmap = nil then
        FCanvasBitmap := TBitmap.Create;
    end
    else
    begin
      FCanvasBitmap.Free;
      FCanvasBitmap := nil;
    end;
  end;
end;

procedure TdxCustomDockControl.CMFontChanged(var Message: TMessage);
begin
  inherited;
  if not IsLoading then FManagerFont := False;
  NCChanged;
end;

procedure TdxCustomDockControl.CMColorChanged(var Message: TMessage);
begin
  inherited;
  if not IsLoading then FManagerColor := False;
  InvalidateNC(False);
end;

procedure TdxCustomDockControl.CMTextChanged(var Message: TMessage);
begin
  inherited;
  UpdateCaption;
  if HasCaption then
    InvalidateNC(False);
  if (AutoHideControl <> nil) and (AutoHideHostSite <> nil) then
    AutoHideHostSite.InvalidateNC(True);
  if TabContainer <> nil then
    TabContainer.InvalidateNC(True);
  if SideContainer <> nil then
    SideContainer.InvalidateNC(False);
end;

procedure TdxCustomDockControl.CMVisibleChanged(var Message: TMessage);
begin
  BeginUpdateNC;
  try
    if not IsLoading and (ParentDockControl <> nil) and not AutoHide then
      ParentDockControl.NCChanged;
    NCChanged;
    inherited;
    if not IsLoading and (ParentDockControl <> nil) then
    begin
      UpdateRelatedControlsVisibility;
      UpdateCaption;
    end;
  finally
    EndUpdateNC;
  end;
  UpdateAutoHideControlsVisibility;
  DoVisibleChanged;
end;

procedure TdxCustomDockControl.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  if AutoHide and (AutoHideHostSite <> nil) and (AutoHideHostSite.ShowingControl = Self) then
    AutoHideHostSite.InitializeHiding;
  if FCloseButtonIsHot or FHideButtonIsHot or FMaximizeButtonIsHot then
  begin
    FCloseButtonIsHot := False;
    FHideButtonIsHot := False;
    FMaximizeButtonIsHot := False;
    InvalidateNC(False);
  end;
end;

procedure TdxCustomDockControl.CMDesignHitTest(var Message: TCMDesignHitTest);
var
  pt: TPoint;
begin
  inherited;
  pt := Point(Message.XPos, Message.YPos);
  if (IsCaptionPoint(pt) and (Message.Keys = MK_LBUTTON)) or
    Controller.IsDocking or Controller.IsResizing or
    FCaptionIsDown or FCloseButtonIsDown or FHideButtonIsDown or FMaximizeButtonIsDown then
    Message.Result := 1;
end;

procedure TdxCustomDockControl.CNKeyDown(var Message: TWMKeyDown);
begin
  case Message.CharCode of
    VK_CONTROL:
      if Controller.DockingDockControl = Self then
        Docking(ClientToScreen(CursorPoint));
    VK_ESCAPE:
      if Controller.DockingDockControl = Self then
        EndDocking(ClientToScreen(CursorPoint), True)
      else if Controller.ResizingDockControl = Self then
        EndResize(ClientToScreen(CursorPoint), True)
  else
    inherited;
  end;
end;

procedure TdxCustomDockControl.CNKeyUp(var Message: TWMKeyUp);
begin
  if (Message.CharCode = VK_CONTROL) and (Controller.DockingDockControl = Self) then
    Docking(ClientToScreen(CursorPoint))
  else inherited;
end;

procedure TdxCustomDockControl.WMNCCalcSize(var Message: TWMNCCalcSize);
var
  R: TRect;
  OffsetX, OffsetY: Integer;
begin
  if CanCalculateNC then
  begin
    inherited;
    R := Message.CalcSize_Params.rgrc[0];
    OffsetX := R.Left;
    OffsetY := R.Top;
    OffsetRect(R, -OffsetX, -OffsetY);
    FWindowRect := R;
    if FUseDoubleBuffer and (FCanvasBitmap <> nil) then
    begin
      if FCanvasBitmap.Width < FWindowRect.Right - FWindowRect.Left then
        FCanvasBitmap.Width := FWindowRect.Right - FWindowRect.Left + 100;
      if FCanvasBitmap.Height < FWindowRect.Bottom - FWindowRect.Top then
        FCanvasBitmap.Height := FWindowRect.Bottom - FWindowRect.Top + 100;
    end;
    Canvas.Font := Font;
    CalculateNC(R);
    OffsetRect(R, OffsetX, OffsetY);
    if R.Left > R.Right then R.Left := R.Right;
    if R.Top > R.Bottom then R.Top := R.Bottom;
    Message.CalcSize_Params.rgrc[0] := R;
    FSavedClientRect := R;
  end
  else Message.CalcSize_Params.rgrc[0] := FSavedClientRect;
end;

procedure TdxCustomDockControl.WMNCHitTest(var Message: TWMNCHitTest);
begin
  if not Visible then
    Message.Result := HTTRANSPARENT
  else Message.Result := HTCLIENT;
end;

procedure TdxCustomDockControl.WMNCPaint(var Message: TWMNCPaint);
var
  DC: HDC;
  ACanvas: TCanvas;
  pt1, pt2: TPoint;
  ClipRgn: HRGN;
begin
  if not CanUpdateNC then exit;
  DC := GetWindowDC(Handle);
  try
    ClipRgn := CreateRectRgn(0, 0, 0, 0);
    try
      GetClipRgn(DC, ClipRgn);
      pt1 := ClientToWindow(ClientRect.TopLeft);
      pt2 := ClientToWindow(ClientRect.BottomRight);
      ExcludeClipRect (DC, pt1.X, pt1.Y, pt2.X, pt2.Y);
      if FUseDoubleBuffer and (FCanvasBitmap <> nil) then
      begin
        NCPaint(FCanvasBitmap.Canvas);
        SelectClipRgn(FCanvasBitmap.Canvas.Handle, 0);
        BitBlt(DC, 0, 0, WindowRect.Right, WindowRect.Bottom,
          FCanvasBitmap.Canvas.Handle, 0, 0, SRCCOPY);
      end
      else
      begin
        ACanvas := TCanvas.Create;
        try
          ACanvas.Handle := DC;
          NCPaint(ACanvas);
        finally
          ACanvas.Free;
        end;
      end;
    finally
      SelectClipRgn(DC, ClipRgn);
      DeleteObject(ClipRgn);
    end;
  finally
    ReleaseDC(Handle, DC);
  end;
end;

{$IFDEF DELPHI5}
procedure TdxCustomDockControl.WMContextMenu(var Message: TWMContextMenu);
var
  Pt, Temp: TPoint;
  AHandled: Boolean;
  APopupMenu: TPopupMenu;
begin
  Pt := SmallPointToPoint(Message.Pos);
  if (Pt.X < 0) or (Pt.Y < 0) then Temp := Pt
  else Temp := ScreenToClient(Pt);

  DoContextPopup(Temp, AHandled);
  Message.Result := Ord(AHandled);
  if AHandled then Exit;

  APopupMenu := GetPopupMenu;
  if (PopupMenu <> nil) and PopupMenu.AutoPopup then
  begin
    SendCancelMode(nil);
    APopupMenu.PopupComponent := Self;
    if (Pt.X < 0) or (Pt.Y < 0) then
      Pt := ClientToScreen(Point(0, 0));
    APopupMenu.Popup(Pt.X, Pt.Y);
    Message.Result := 1;
  end;
  if Message.Result = 0 then
    inherited;
end;
{$ENDIF}

procedure TdxCustomDockControl.WMEraseBkgnd(var Message: TWmEraseBkgnd);
begin
  Message.Result := 1;
end;

procedure TdxCustomDockControl.WMMouseActivate(var Message: TWMMouseActivate);
begin
  Activate;
end;

procedure TdxCustomDockControl.WMMove(var Message: TWMMove);
begin
  BeginUpdateNC;
  try
    inherited;
  finally
    EndUpdateNC;
  end;
end;

procedure TdxCustomDockControl.WMMouseMove(var Message: TWMMouseMove);
var
  AIsButtonPoint: Boolean;
begin
  inherited;
  Message.Result := 0;
  FCursorPoint := Point(Message.XPos, Message.YPos);
  if Controller.DockingDockControl = Self then
  begin
    Docking(ClientToScreen(CursorPoint));
    Message.Result := 1;
  end
  else if Controller.ResizingDockControl = Self then
  begin
    Resizing(ClientToScreen(CursorPoint));
    Message.Result := 1;
  end
  else if FloatFormActive or ParentFormActive or IsDesigning then
  begin
    AIsButtonPoint := IsCaptionCloseButtonPoint(CursorPoint);
    if AIsButtonPoint and not FCloseButtonIsHot then
    begin
      FCloseButtonIsHot := True;
      InvalidateNC(False);
      Message.Result := 1;
    end
    else if not AIsButtonPoint and FCloseButtonIsHot then
    begin
      FCloseButtonIsHot := False;
      InvalidateNC(False);
      Message.Result := 1;
    end;
    AIsButtonPoint := IsCaptionHideButtonPoint(CursorPoint);
    if AIsButtonPoint and not FHideButtonIsHot then
    begin
      FHideButtonIsHot := True;
      InvalidateNC(False);
      Message.Result := 1;
    end
    else if not AIsButtonPoint and FHideButtonIsHot then
    begin
      FHideButtonIsHot := False;
      InvalidateNC(False);
      Message.Result := 1;
    end;
    AIsButtonPoint := IsCaptionMaximizeButtonPoint(CursorPoint);
    if AIsButtonPoint and not FMaximizeButtonIsHot then
    begin
      FMaximizeButtonIsHot := True;
      InvalidateNC(False);
      Message.Result := 1;
    end
    else if not AIsButtonPoint and FMaximizeButtonIsHot then
    begin
      FMaximizeButtonIsHot := False;
      InvalidateNC(False);
      Message.Result := 1;
    end;
    if FCaptionIsDown and ((IsDesigning and
      ((Abs(CursorPoint.X - SourcePoint.X) > 3) or
      (Abs(CursorPoint.Y - SourcePoint.Y) > 3))) or
      not IsCaptionPoint(CursorPoint)) then
    begin
      ReleaseMouse;
      FCaptionIsDown := False;
      StartDocking(ClientToScreen(SourcePoint));
      Message.Result := 1;
    end;
  end;
end;

procedure TdxCustomDockControl.WMLButtonDown(var Message: TWMLButtonDown);
begin
  inherited;
  Message.Result := 0;
  SourcePoint := Point(Message.XPos, Message.YPos);
  if GetResizeZoneAtPos(ClientToScreen(SourcePoint)) <> nil then
  begin
    StartResize(ClientToScreen(SourcePoint));
    Message.Result := 1;
  end
  else if IsCaptionCloseButtonPoint(SourcePoint) then
  begin
    FCloseButtonIsDown := True;
    InvalidateNC(False);
    CaptureMouse;
    Message.Result := 1;
  end
  else if IsCaptionHideButtonPoint(SourcePoint) then
  begin
    FHideButtonIsDown := True;
    InvalidateNC(False);
    CaptureMouse;
    Message.Result := 1;
  end
  else if IsCaptionMaximizeButtonPoint(SourcePoint) then
  begin
    FMaximizeButtonIsDown := True;
    InvalidateNC(False);
    CaptureMouse;
    Message.Result := 1;
  end
  else if IsCaptionPoint(SourcePoint) then
  begin
    FCaptionIsDown := True;
    CaptureMouse;
    Message.Result := 1;
  end;
end;

procedure TdxCustomDockControl.WMLButtonUp(var Message: TWMLButtonUp);
begin
  inherited;
  Message.Result := 0;
  FCursorPoint := Point(Message.XPos, Message.YPos);
  if Controller.DockingDockControl = Self then
  begin
    EndDocking(ClientToScreen(CursorPoint), False);
    Message.Result := 1;
  end
  else if Controller.ResizingDockControl = Self then
  begin
    EndResize(ClientToScreen(CursorPoint), False);
    Message.Result := 1;
  end
  else if FCloseButtonIsDown then
  begin
    ReleaseMouse;
    FCloseButtonIsDown := False;
    if IsCaptionCloseButtonPoint(CursorPoint) and not IsDesigning then
      DoClose;
    InvalidateNC(False);
    Message.Result := 1;
  end
  else if FHideButtonIsDown then
  begin
    ReleaseMouse;
    FHideButtonIsDown := False;
    if IsCaptionHideButtonPoint(CursorPoint) then
      ChangeAutoHide;
    InvalidateNC(False);
    Message.Result := 1;
  end
  else if FMaximizeButtonIsDown then
  begin
    ReleaseMouse;
    FMaximizeButtonIsDown := False;
    if IsCaptionMaximizeButtonPoint(CursorPoint) then
      DoMaximize;
    InvalidateNC(False);
    Message.Result := 1;
  end
  else if FCaptionIsDown then
  begin
    ReleaseMouse;
    FCaptionIsDown := False;
    Message.Result := 1;
  end;
end;

procedure TdxCustomDockControl.WMLButtonDblClk(var Message: TWMLButtonDblClk);
var
  pt: TPoint;
begin
  inherited;
  Message.Result := 0;
  if not IsDesigning and (doDblClickDocking in Controller.Options) and not AutoHide and
    Dockable and IsCaptionPoint(CursorPoint) and
    not IsCaptionCloseButtonPoint(CursorPoint) and
    not IsCaptionHideButtonPoint(CursorPoint) and
    not (IsCaptionMaximizeButtonPoint(CursorPoint)) then
  begin
    pt := ClientToScreen(CursorPoint);
    DoStartDocking(pt);
    MakeFloating;
    DoEndDocking(pt);
    Message.Result := 1;
  end;
end;

procedure TdxCustomDockControl.WMSetCursor(var Message: TWMSetCursor);
var
  pt: TPoint;
  AZone: TdxZone;
begin
  if Controller.IsDocking then
  begin
    if (Controller.DockingDockControl.DockingTargetZone = nil) and not AllowFloating then
      SetCursor(Screen.Cursors[crNo])
    else inherited;
  end
  else
  begin
    GetCursorPos(pt);
    AZone := GetResizeZoneAtPos(pt);
    if AZone <> nil then
    begin
      if AZone.Direction = zdHorizontal then
        SetCursor(Screen.Cursors[crVSplit])
      else if AZone.Direction = zdVertical then
        SetCursor(Screen.Cursors[crHSplit])
      else inherited;
    end
    else inherited;
  end;
end;

procedure TdxCustomDockControl.WMSize(var Message: TWMSize);
begin
  BeginUpdateNC;
  try
    inherited;
  finally
    EndUpdateNC;
  end;
end;

{ TdxCustomDockSite }

procedure TdxCustomDockSite.GetChildren(Proc: TGetChildProc; Root: TComponent);
var
  I: Integer;
begin
  for I := 0 to ChildCount - 1 do
    if Children[I].Owner = Root then Proc(Children[I]);
end;

procedure TdxCustomDockSite.ValidateInsert(AComponent: TComponent);
begin
  if not (AComponent is TdxCustomDockControl) then
  begin
    if AComponent is TControl then
      (AComponent as TControl).Parent := ParentForm;
    raise Exception.CreateFmt(sdxInvalidSiteChild, [AComponent.ClassName]);
  end;
end;

{ TdxLayoutDockSite }

constructor TdxLayoutDockSite.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csDesignInteractive];
end;

procedure TdxLayoutDockSite.BeforeDestruction;
begin
  if not CanDestroy then
    raise Exception.Create(sdxInvalidLayoutSiteDeleting);
  inherited;
end;

function TdxLayoutDockSite.CanDockHost(AControl: TdxCustomDockControl; AType: TdxDockingType): Boolean;
begin
  Result := inherited CanDockHost(AControl, AType);
  Result := Result and ((AType in [dtLeft, dtRight, dtTop, dtBottom]) or
    ((Atype in [dtClient]) and (ChildCount = 0)));
  Result := Result and ((SiblingDockControl = nil) or (SiblingDockControl.DockType <> dtClient));
end;

procedure TdxLayoutDockSite.SetParent(AParent: TWinControl);
begin
  if (UpdateLayoutLock = 0) and not IsDestroying and not IsLoading then
    raise Exception.Create(sdxInvalidParentAssigning)
  else if (AParent <> nil) and not (AParent is TdxCustomDockControl) then
    raise Exception.CreateFmt(sdxInvalidParent, [ClassName])
  else inherited SetParent(AParent);
end;

procedure TdxLayoutDockSite.UpdateControlDockZones(AControl: TdxCustomDockControl; AZoneWidth: Integer);
begin
  if (SiblingDockControl <> nil) and (SiblingDockControl.DockType = dtClient) then exit;
  if TdxClientZone.ValidateDockZone(Self, AControl) then
    AControl.DockZones.Insert(0, TdxClientZone.Create(Self, AZoneWidth));
  inherited;
end;

function TdxLayoutDockSite.GetSiblingDockControl: TdxCustomDockControl;
begin
  if (ParentDockControl <> nil) and (ParentDockControl.ChildCount = 2) then
    Result := ParentDockControl.Children[1 - DockIndex]
  else Result := nil;
end;

function TdxLayoutDockSite.CanDestroy: Boolean;
begin
  Result := ((ParentDockControl = nil) or ParentDockControl.IsDestroying) or
    ((ChildCount = 0) and (ParentDockControl.ChildCount = 1));
end;

procedure TdxLayoutDockSite.WMNCHitTest(var Message: TWMNCHitTest);
begin
  if not Visible or (IsDesigning and not Controller.IsDocking) then
    Message.Result := HTTRANSPARENT
  else inherited;
end;

{ TdxContainerDockSite }

constructor TdxContainerDockSite.Create(AOwner: TComponent);
begin
  inherited;
  UseDoubleBuffer := True;
end;

function TdxContainerDockSite.CanDock: Boolean;
begin
  Result := True;
end;

function TdxContainerDockSite.CanDockHost(AControl: TdxCustomDockControl; AType: TdxDockingType): Boolean;
begin
  Result := inherited CanDockHost(AControl, AType);
end;

function TdxContainerDockSite.CanContainerDockHost(AType: TdxDockingType): Boolean;
begin
  Result := (AType = GetHeadDockType) or (AType = GetTailDockType);
end;

function TdxContainerDockSite.GetControlAutoHidePosition(AControl: TdxCustomDockControl): TdxAutoHidePosition;
begin
  Result := inherited GetControlAutoHidePosition(Self);
end;

procedure TdxContainerDockSite.ChildVisibilityChanged(Sender: TdxCustomDockControl);
begin
  Visible := ValidChildCount > 0;
end;

procedure TdxContainerDockSite.Loaded;
begin
  inherited;
  if (0 <= FActiveChildIndex) and (FActiveChildIndex < ChildCount) then
    ActiveChild := Children[FActiveChildIndex]
  else ActiveChild := nil;
end;

procedure TdxContainerDockSite.SetParent(AParent: TWinControl);
begin
  if (UpdateLayoutLock = 0) and not IsDestroying and not IsLoading then
    raise Exception.Create(sdxInvalidParentAssigning)
  else if (AParent <> nil) and not ((AParent is TdxCustomDockControl) or
    (AutoHide and (AParent is TdxDockSiteAutoHideContainer))) then
    raise Exception.CreateFmt(sdxInvalidParent, [ClassName])
  else inherited SetParent(AParent);
end;

procedure TdxContainerDockSite.CreateLayout(AControl: TdxCustomDockControl;
  AType: TdxDockingType; Index: Integer);
begin
  if CanContainerDockHost(AType) then
    AControl.IncludeToDock(Self, AType, Index)
  else Assert(False, Format(sdxInternalErrorCreateLayout, [TdxContainerDockSite.ClassName]));
end;

procedure TdxContainerDockSite.DestroyLayout(AControl: TdxCustomDockControl);
var
  AAutoHide, AActive: Boolean;
  AIndex: Integer;
  ASite, AParentControl: TdxCustomDockControl;
begin
  AIndex := DockIndex;
  AParentControl := ParentDockControl;
  AParentControl.BeginUpdateLayout;
  try
    AControl.ExcludeFromDock;
    if ChildCount = 1 then
    begin
      if AutoHide then
      begin
        AAutoHide := True;
        AutoHide := False;
      end
      else AAutoHide := False;
      if (Container <> nil) and (Container.ActiveChild = Self) then
        AActive := True
      else AActive := False;
      ASite := Children[0];
      ASite.ExcludeFromDock;
      ExcludeFromDock;
      ASite.SetDockType(dtClient);
      ASite.AdjustControlBounds(Self);
      ASite.IncludeToDock(AParentControl, DockType, AIndex);
      if (ASite.Container <> nil) and AActive then
        ASite.Container.ActiveChild := ASite;
      if AAutoHide then ASite.AutoHide := True;
      DoDestroy;
    end
    else Assert(ChildCount > 0, Format(sdxInternalErrorDestroyLayout, [ClassName]));
  finally
    AParentControl.EndUpdateLayout;
  end;
end;

procedure TdxContainerDockSite.UpdateLayout;
begin
  inherited;
  ValidateActiveChild(-1);
end;

procedure TdxContainerDockSite.LoadLayoutFromCustomIni(AIniFlie: TCustomIniFile;
  AParentControl: TdxCustomDockControl; ASection: string);
begin
  inherited;
  with AIniFlie do
    ActiveChildIndex := ReadInteger(ASection, 'ActiveChildIndex', -1);
end;

procedure TdxContainerDockSite.SaveLayoutToCustomIni(AIniFlie: TCustomIniFile;
  ASection: string);
begin
  inherited;
  with AIniFlie do
    WriteInteger(ASection, 'ActiveChildIndex', ActiveChildIndex);
end;

procedure TdxContainerDockSite.DoActiveChildChanged;
begin
  UpdateCaption;
end;

class function TdxContainerDockSite.GetHeadDockType: TdxDockingType;
begin
  Result := dtClient;
end;

class function TdxContainerDockSite.GetTailDockType: TdxDockingType;
begin
  Result := dtClient;
end;

function TdxContainerDockSite.GetFirstValidChild: TdxCustomDockControl;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to ChildCount - 1 do
    if IsValidChild(Children[I]) then
    begin
      Result := Children[I];
      break;
    end;
end;

function TdxContainerDockSite.GetFirstValidChildIndex: Integer;
var
  AControl: TdxCustomDockControl;
begin
  AControl := GetFirstValidChild;
  if AControl <> nil then
    Result := AControl.DockIndex
  else Result := -1;
end;

function TdxContainerDockSite.GetLastValidChild: TdxCustomDockControl;
var
  I: Integer;
begin
  Result := nil;
  for I := ChildCount - 1 downto 0 do
    if IsValidChild(Children[I]) then
    begin
      Result := Children[I];
      break;
    end;
end;

function TdxContainerDockSite.GetLastValidChildIndex: Integer;
var
  AControl: TdxCustomDockControl;
begin
  AControl := GetLastValidChild;
  if AControl <> nil then
    Result := AControl.DockIndex
  else Result := -1;
end;

function TdxContainerDockSite.GetNextValidChild(AIndex: Integer): TdxCustomDockControl;
var
  I: Integer;
begin
  Result := nil;
  for I := AIndex + 1 to ChildCount - 1 do
    if IsValidChild(Children[I]) then
    begin
      Result := Children[I];
      break;
    end;
end;

function TdxContainerDockSite.GetNextValidChildIndex(AIndex: Integer): Integer;
var
  AControl: TdxCustomDockControl;
begin
  AControl := GetNextValidChild(AIndex);
  if AControl <> nil then
    Result := AControl.DockIndex
  else Result := -1;
end;

function TdxContainerDockSite.GetPrevValidChild(AIndex: Integer): TdxCustomDockControl;
var
  I: Integer;
begin
  Result := nil;
  for I := AIndex - 1 downto 0  do
    if IsValidChild(Children[I]) then
    begin
      Result := Children[I];
      break;
    end;
end;

function TdxContainerDockSite.GetPrevValidChildIndex(AIndex: Integer): Integer;
var
  AControl: TdxCustomDockControl;
begin
  AControl := GetPrevValidChild(AIndex);
  if AControl <> nil then
    Result := AControl.DockIndex
  else Result := -1;
end;

function TdxContainerDockSite.GetValidChildCount: Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to ChildCount - 1 do
    if IsValidChild(Children[I]) then
      Inc(Result);
end;

function TdxContainerDockSite.GetValidChild(Index: Integer): TdxCustomDockControl;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to ChildCount - 1 do
    if IsValidChild(Children[I]) then
    begin
      if Index = 0 then
      begin
        Result := Children[I];
        break;
      end
      else Dec(Index);
    end;
end;

function TdxContainerDockSite.IsValidActiveChild(AControl: TdxCustomDockControl): Boolean;
begin
  Result := IsValidChild(AControl);
end;

function TdxContainerDockSite.IsValidChild(AControl: TdxCustomDockControl): Boolean;
begin
  Result := (AControl <> nil) and (AControl.ParentDockControl = Self) and
    (0 <= AControl.DockIndex) and (AControl.DockIndex < ChildCount) and 
    AControl.Visible and not AControl.AutoHide;
end;

procedure TdxContainerDockSite.ValidateActiveChild(AIndex: Integer);
begin
end;

function TdxContainerDockSite.GetActiveChildIndex: Integer;
begin
  if not IsLoading then
  begin
    if ActiveChild <> nil then
      Result := ActiveChild.DockIndex
    else Result := -1;
  end
  else Result := FActiveChildIndex;
end;

procedure TdxContainerDockSite.SetActiveChild(const Value: TdxCustomDockControl);
begin
  if (FActiveChild <> Value) and IsValidActiveChild(Value) then
  begin
    BeginUpdateNC;
    try
      FActiveChild := Value;
      DoActiveChildChanged;
      if Assigned(FOnActiveChildChanged) then
        FOnActiveChildChanged(Self, FActiveChild);
    finally
      EndUpdateNC;
    end;
    Modified;
  end;
end;

procedure TdxContainerDockSite.SetActiveChildIndex(const Value: Integer);
begin
  if not IsLoading then
  begin
    if (0 <= Value) and (Value < ChildCount) then
      ActiveChild := Children[Value]
    else ActiveChild := nil;
  end
  else FActiveChildIndex := Value;
end;

{ TdxTabContainerDockSite }

constructor TdxTabContainerDockSite.Create(AOwner: TComponent);
begin
  inherited;
  FFirstVisibleTabIndex := 0;
  FPressedTabIndex := -1;
  FTabsPosition := tctpBottom;
  FTabsScroll := True;
end;

procedure TdxTabContainerDockSite.Assign(Source: TPersistent);
var
  AContainer: TdxTabContainerDockSite;
begin
  if Source is TdxTabContainerDockSite then
  begin
    AContainer := Source as TdxTabContainerDockSite;
    TabsPosition := AContainer.TabsPosition;
    TabsScroll := AContainer.TabsScroll;
  end;
  inherited Assign(Source);
end;

procedure TdxTabContainerDockSite.DoActiveChildChanged;
begin
  inherited;
  if ActiveChild <> nil then
    ActiveChild.BringToFront;
  if (AutoHideControl = Self) and (AutoHideHostSite <> nil) then
    AutoHideHostSite.InvalidateNC(False);
  InvalidateNC(False);
end;

procedure TdxTabContainerDockSite.ValidateActiveChild(AIndex: Integer);
begin
  if IsValidChild(ActiveChild) then exit;
  if (ActiveChild <> nil) and IsValidChild(ActiveChild.Container) then
    ActiveChild := ActiveChild.Container
  else if AIndex = -1 then
    ActiveChild := GetFirstValidChild
  else
  begin
    ActiveChild := GetNextValidChild(AIndex);
    if ActiveChild = nil then
      ActiveChild := GetPrevValidChild(AIndex);
  end;
end;

procedure TdxTabContainerDockSite.CalculateNC(var ARect: TRect);
var
  I, XPos: Integer;
  AWidth, ATabWidth: Integer;
begin
  inherited;
  FTabsRect.Left := ARect.Left;
  FTabsRect.Right := ARect.Right;
  if TabsPosition = tctpTop then
  begin
    FTabsRect.Top := ARect.Top;
    FTabsRect.Bottom := FTabsRect.Top + Painter.GetTabsHeight;
    if HasTabs then
      ARect.Top := FTabsRect.Bottom;
  end
  else
  begin
    FTabsRect.Bottom := ARect.Bottom;
    FTabsRect.Top := FTabsRect.Bottom - Painter.GetTabsHeight;
    if FTabsRect.Top < ARect.Top then
    begin
      FTabsRect.Top := ARect.Top;
      FTabsRect.Bottom := FTabsRect.Top + Painter.GetTabsHeight;
    end;
    if HasTabs then
      ARect.Bottom := FTabsRect.Top;
  end;

  FTabsPrevTabButtonIsEnabled := False;
  FTabsNextTabButtonIsEnabled := False;
  if TabsScroll then
  begin
    FTabsNextTabButtonRect.Right := FTabsRect.Right - Painter.GetTabHorizInterval;
    FTabsNextTabButtonRect.Left := FTabsNextTabButtonRect.Right - Painter.GetTabsButtonSize;
    FTabsNextTabButtonRect.Top := FTabsRect.Top + Painter.GetTabVertInterval +
      (FTabsRect.Bottom - FTabsRect.Top - Painter.GetTabVertInterval -
      Painter.GetTabsButtonSize) div 2;
    FTabsNextTabButtonRect.Bottom := FTabsNextTabButtonRect.Top + Painter.GetTabsButtonSize;
    FTabsPrevTabButtonRect.Right := FTabsNextTabButtonRect.Left - 1;
    FTabsPrevTabButtonRect.Left := FTabsPrevTabButtonRect.Right - Painter.GetTabsButtonSize;
    FTabsPrevTabButtonRect.Top := FTabsRect.Top + Painter.GetTabVertInterval +
      (FTabsRect.Bottom - FTabsRect.Top - Painter.GetTabVertInterval -
      Painter.GetTabsButtonSize) div 2;
    FTabsPrevTabButtonRect.Bottom := FTabsPrevTabButtonRect.Top + Painter.GetTabsButtonSize;
  end;

  AWidth := 0;
  if not TabsScroll then
    for I := 0 to ChildCount - 1 do
      if IsValidChild(Children[I]) then Inc(AWidth, GetTabWidth(Children[I]));

  SetLength(FTabsRects, ChildCount);
  XPos := FTabsRect.Left + Painter.GetTabHorizInterval;
  for I := 0 to FFirstVisibleTabIndex - 1 do
  begin
    if not IsValidChild(Children[I]) then continue;
    if TabsScroll or (AWidth < (FTabsRect.Right - FTabsRect.Left) - 2 * Painter.GetTabHorizInterval) then
      ATabWidth := GetTabWidth(Children[I])
    else ATabWidth := ((FTabsRect.Right - FTabsRect.Left)  -
      2 * Painter.GetTabHorizInterval ) div ValidChildCount;
    FTabsRects[I].Right := XPos;
    FTabsRects[I].Top := FTabsRect.Top + Painter.GetTabVertInterval;
    if TabsPosition = tctpBottom then
      Inc(FTabsRects[I].Top, Painter.GetTabVertInterval);
    FTabsRects[I].Left := XPos - ATabWidth;
    FTabsRects[I].Bottom := FTabsRect.Bottom - Painter.GetTabVertInterval;
    if TabsPosition = tctpTop then
      Dec(FTabsRects[I].Bottom, Painter.GetTabVertInterval);
    XPos := XPos - ATabWidth;
  end;
  XPos := FTabsRect.Left + Painter.GetTabHorizInterval;
  for I := FFirstVisibleTabIndex to ChildCount - 1 do
  begin
    if not IsValidChild(Children[I]) then continue;
    if TabsScroll or (AWidth < (FTabsRect.Right - FTabsRect.Left) - 2 * Painter.GetTabHorizInterval) then
      ATabWidth := GetTabWidth(Children[I])
    else ATabWidth := ((FTabsRect.Right - FTabsRect.Left)  -
      2 * Painter.GetTabHorizInterval ) div ValidChildCount;
    FTabsRects[I].Left := XPos;
    FTabsRects[I].Top := FTabsRect.Top + Painter.GetTabVertInterval;
    if TabsPosition = tctpBottom then
      Inc(FTabsRects[I].Top, Painter.GetTabVertInterval);
    FTabsRects[I].Right := XPos + ATabWidth;
    FTabsRects[I].Bottom := FTabsRect.Bottom - Painter.GetTabVertInterval;
    if TabsPosition = tctpTop then
      Dec(FTabsRects[I].Bottom, Painter.GetTabVertInterval);
    XPos := XPos + ATabWidth;
  end;
  UpdateButtonsState;
end;

procedure TdxTabContainerDockSite.NCPaint(ACanvas: TCanvas);
var
  I: Integer;
begin
  inherited;
  if HasTabs then
  begin
    if TabRectCount > 0 then
      Painter.DrawTabs(ACanvas, TabsRect, TabsRects[ActiveChildIndex]);
    if TabsButtonsVisible then
    begin
      Painter.DrawTabsNextTabButton(ACanvas, TabsNextTabButtonRect, TabsNextTabButtonIsDown,
        TabsNextTabButtonIsHot, TabsNextTabButtonIsEnabled);
      Painter.DrawTabsPrevTabButton(ACanvas, TabsPrevTabButtonRect, TabsPrevTabButtonIsDown,
        TabsPrevTabButtonIsHot, TabsPrevTabButtonIsEnabled);
      ExcludeClipRect(ACanvas.Handle, TabsPrevTabButtonRect.Left - Painter.GetTabHorizInterval,
        TabsRect.Top, TabsRect.Right, TabsRect.Bottom);
    end;
    for I := 0 to TabRectCount - 1 do
    begin
      if not IsValidChild(Children[I]) then continue;
      if PtInRect(TabsRect, TabsRects[I].TopLeft) then
        Painter.DrawTab(ACanvas, Children[I], TabsRects[I], ActiveChild = Children[I]);
    end;
  end;
end;

function TdxTabContainerDockSite.GetTabIndexAtPos(pt: TPoint): Integer;
var
  I: Integer;
begin
  Result := -1;
  if HasTabs then
  begin
    pt := ClientToWindow(pt);
    for I := 0 to TabRectCount - 1 do
      if IsValidChild(Children[I]) and PtInRect(FTabsRects[I], pt) then
      begin
        Result := I;
        break;
      end;
  end;
end;

function TdxTabContainerDockSite.GetTabWidth(AControl: TdxCustomDockControl): Integer;
var
  ASize: TSize;
  ACaption: string;
begin
  ACaption := AControl.Caption;
  GetTextExtentPoint32(Canvas.Handle, PChar(ACaption), Length(ACaption), ASize);
  Result := Painter.GetTabHorizInterval + ASize.cx + Painter.GetTabHorizInterval;
  if Painter.GetImageWidth > 0 then
    Result := Result + Painter.GetImageWidth + 2 * Painter.GetTabHorizInterval;
end;

function TdxTabContainerDockSite.HasBorder: Boolean;
begin
  Result := (FloatDockSite = nil);
end;

function TdxTabContainerDockSite.HasCaption: Boolean;
begin
  Result := (doTabContainerHasCaption in Controller.Options) and
    ShowCaption and (FloatDockSite = nil);
end;

function TdxTabContainerDockSite.HasTabs: Boolean;
begin
  Result := not AutoHide and (ValidChildCount > 1);
end;

function TdxTabContainerDockSite.IsCaptionActive: Boolean;
begin
  Result := inherited IsCaptionActive;
  Result := Result or ((Controller.ActiveDockControl <> nil) and
    (Controller.ActiveDockControl.Container = Self));
end;

function TdxTabContainerDockSite.IsTabsPoint(pt: TPoint): Boolean;
begin
  Result := HasTabs and PtInRect(TabsRect, ClientToWindow(pt));
end;

function TdxTabContainerDockSite.IsTabsNextTabButtonPoint(pt: TPoint): Boolean;
begin
  Result := TabsButtonsVisible and PtInRect(TabsNextTabButtonRect, ClientToWindow(pt));
end;

function TdxTabContainerDockSite.IsTabsPrevTabButtonPoint(pt: TPoint): Boolean;
begin
  Result := TabsButtonsVisible and PtInRect(TabsPrevTabButtonRect, ClientToWindow(pt));
end;

function TdxTabContainerDockSite.CanActive: Boolean;
begin
  Result := True;
end;

function TdxTabContainerDockSite.CanAutoHide: Boolean;
begin
  Result := IsLoading or ((AutoHideHostSite <> nil) and
    ((AutoHideControl = nil) or (AutoHideControl = Self)));
end;

function TdxTabContainerDockSite.CanDockHost(AControl: TdxCustomDockControl; AType: TdxDockingType): Boolean;
var
  ACanDockHost: Boolean;
begin
  ACanDockHost := CanContainerDockHost(AType);
  if Container is TdxSideContainerDockSite then
  begin
    ACanDockHost := ACanDockHost or Container.CanContainerDockHost(AType);
    if doSideContainerCanInSideContainer in Controller.Options then
      ACanDockHost := ACanDockHost or (AType in [dtLeft, dtRight, dtTop, dtBottom]);
  end
  else if doTabContainerCanInSideContainer in Controller.Options then
    ACanDockHost := ACanDockHost or (AType in [dtLeft, dtRight, dtTop, dtBottom]);
  Result := inherited CanDockHost(AControl, AType) and ACanDockHost;;
end;

function TdxTabContainerDockSite.CanMaximize: Boolean;
begin
  Result := not AutoHide and (SideContainer <> nil) and (SideContainer.ValidChildCount > 1);
end;

function TdxTabContainerDockSite.CanResizeAtPos(pt: TPoint): Boolean;
begin
  Result := inherited CanResizeAtPos(pt);
  Result := Result and (GetTabIndexAtPos(pt) = -1);
end;

procedure TdxTabContainerDockSite.UpdateControlDockZones(AControl: TdxCustomDockControl; AZoneWidth: Integer);
var
  I: Integer;
begin
  if (AControl = Self) and (ActiveChild <> nil) then
    DockZones.Insert(0, TdxTabContainerZone.Create(Self));
  inherited;
  if (AControl = Self) and HasTabs then
    for I := 0 to ChildCount - 1 do
    begin
      if not IsValidChild(Children[I]) then continue;
      DockZones.Insert(0, TdxTabContainerTabZone.Create(Self, I));
    end;
end;

procedure TdxTabContainerDockSite.CreateLayout(AControl: TdxCustomDockControl;
  AType: TdxDockingType; Index: Integer);
begin
  if CanContainerDockHost(AType) then
    inherited CreateLayout(AControl, AType, Index)
  else if (Container <> nil) and Container.CanContainerDockHost(AType) then
    CreateContainerLayout(Container, AControl, AType, DockIndex)
  else
    case AType of
      dtLeft, dtRight,
      dtTop, dtBottom:
        CreateSideContainerLayout(AControl, AType, Index);
    else
      Assert(False, Format(sdxInternalErrorCreateLayout, [TdxTabContainerDockSite.ClassName]));
    end;
end;

procedure TdxTabContainerDockSite.DestroyLayout(AControl: TdxCustomDockControl);
begin
  if AControl = ActiveChild then
    ActiveChild := GetNextValidChild(AControl.DockIndex);
  if ActiveChild = nil then
    ActiveChild := GetPrevValidChild(AControl.DockIndex);
  inherited;
end;

procedure TdxTabContainerDockSite.IncludeToDock(AControl: TdxCustomDockControl;
  AType: TdxDockingType; Index: Integer);
var
  AChild: TdxCustomDockControl;
begin
  if AControl.CanAcceptTabContainerItems(Self) and (ChildCount > 0) then
  begin
    while ChildCount > 0 do
    begin
      AChild := Children[ChildCount - 1];
      AChild.ExcludeFromDock;
      AChild.IncludeToDock(AControl, AType, Index);
    end;
    DoDestroy;
  end
  else inherited;
end;

procedure TdxTabContainerDockSite.UpdateLayout;
begin
  inherited;
  if ActiveChild <> nil then
    ActiveChild.BringToFront;
  if (FFirstVisibleTabIndex >= ChildCount) and (ChildCount > 0) then
    FFirstVisibleTabIndex := GetLastValidChildIndex;
  if FFirstVisibleTabIndex < 0 then FFirstVisibleTabIndex := 0;
  NCChanged;
end;

procedure TdxTabContainerDockSite.LoadLayoutFromCustomIni(AIniFlie: TCustomIniFile;
  AParentControl: TdxCustomDockControl; ASection: string);
begin
  inherited;
  with AIniFlie do
  begin
    ShowCaption := ReadBool(ASection, 'ShowCaption', ShowCaption);
    TabsPosition := TdxTabContainerTabsPosition(ReadInteger(ASection, 'TabsPosition', 0));
    TabsScroll := ReadBool(ASection, 'TabsScroll', True);
  end;
end;

procedure TdxTabContainerDockSite.SaveLayoutToCustomIni(AIniFlie: TCustomIniFile;
  ASection: string);
begin
  inherited;
  with AIniFlie do
  begin
    WriteBool(ASection, 'ShowCaption', ShowCaption);
    WriteInteger(ASection, 'TabsPosition', Integer(TabsPosition));
    WriteBool(ASection, 'TabsScroll', TabsScroll);
  end;
end;

function TdxTabContainerDockSite.CanAcceptSideContainerItems(AContainer: TdxSideContainerDockSite): Boolean;
begin
  if doSideContainerCanInTabContainer in Controller.Options then
    Result := False
  else Result := True;
end;

function TdxTabContainerDockSite.CanAcceptTabContainerItems(AContainer: TdxTabContainerDockSite): Boolean;
begin
  Result := True;
end;

procedure TdxTabContainerDockSite.ChangeAutoHide;
begin
  if AutoHide then
    AutoHide := False
  else if doTabContainerCanAutoHide in Controller.Options then
    inherited ChangeAutoHide
  else if ActiveChild <> nil then
    ActiveChild.ChangeAutoHide;
end;

procedure TdxTabContainerDockSite.UpdateCaption;
var
  ACaption: string;
begin
  if ActiveChild <> nil then
    ACaption := ActiveChild.Caption
  else ACaption := '';
  if Caption <> ACaption then
    Caption := ACaption;
  inherited UpdateCaption;
end;

procedure TdxTabContainerDockSite.DoClose;
begin
  if (doTabContainerCanClose in Controller.Options) then
    inherited DoClose
  else if ActiveChild <> nil then
  begin
    ActiveChild.DoClose;
    if (AutoHideControl = Self) and (AutoHideHostSite <> nil) then
      AutoHideHostSite.InvalidateNC(True);
  end;
end;

procedure TdxTabContainerDockSite.ChildVisibilityChanged(Sender: TdxCustomDockControl);
begin
  inherited ChildVisibilityChanged(Sender);
  if not IsValidChild(Sender) then
  begin
    if Sender = ActiveChild then
      ValidateActiveChild(Sender.DockIndex);
    if (FirstVisibleTabIndex <= Sender.DockIndex) and
      (Sender.DockIndex <= LastVisibleTabIndex) then
      DecFirstVisibleTabIndex;
  end;
end;

function TdxTabContainerDockSite.GetLastVisibleTabIndex: Integer;
begin
  if ValidChildCount <= 1 then
    Result := FirstVisibleTabIndex
  else
  begin
    for Result := FFirstVisibleTabIndex to TabRectCount - 1 do
    begin
      if not IsValidChild(Children[Result]) then continue;
      if (TabsButtonsVisible and
        (TabsRects[Result].Right > TabsPrevTabButtonRect.Left - Painter.GetTabHorizInterval)) or
        (TabsRects[Result].Right > TabsRect.Right) then break;
    end;
    if Result > FFirstVisibleTabIndex then
      Dec(Result);
  end;
end;

function TdxTabContainerDockSite.GetTabRectCount: Integer;
begin
  Result := Length(FTabsRects);
end;

function TdxTabContainerDockSite.GetTabRect(Index: Integer): TRect;
begin
  Result := FTabsRects[Index];
end;

procedure TdxTabContainerDockSite.SetTabsPosition(const Value: TdxTabContainerTabsPosition);
begin
  if FTabsPosition <> Value then
  begin
    FTabsPosition := Value;
    NCChanged;
  end;
end;

procedure TdxTabContainerDockSite.SetTabsScroll(const Value: Boolean);
begin
  if FTabsScroll <> Value then
  begin
    FTabsScroll := Value;
    if not FTabsScroll then
      FFirstVisibleTabIndex := 0;
    InvalidateNC(True);
  end;
end;

procedure TdxTabContainerDockSite.DecFirstVisibleTabIndex;
var
  AIndex: Integer;
begin
  AIndex := GetPrevValidChildIndex(FFirstVisibleTabIndex);
  if AIndex > -1 then
  begin
    FFirstVisibleTabIndex := AIndex;
    InvalidateNC(True);
  end;
end;

procedure TdxTabContainerDockSite.IncFirstVisibleTabIndex;
var
  AIndex: Integer;
begin
  AIndex := GetNextValidChildIndex(FFirstVisibleTabIndex);
  if AIndex > -1 then
  begin
    FFirstVisibleTabIndex := AIndex;
    InvalidateNC(True);
  end;
end;

procedure TdxTabContainerDockSite.UpdateButtonsState;
begin
  FTabsPrevTabButtonIsEnabled := GetPrevValidChild(FirstVisibleTabIndex) <> nil;
  FTabsNextTabButtonIsEnabled := GetNextValidChild(LastVisibleTabIndex) <> nil;
end;

procedure TdxTabContainerDockSite.CMDesignHitTest(var Message: TCMDesignHitTest);
var
  pt: TPoint;
begin
  inherited;
  pt := Point(Message.XPos, Message.YPos);
  if (IsTabsPoint(pt) and (Message.Keys = MK_LBUTTON)) or (FPressedTabIndex > -1) or
    FTabsNextTabButtonIsDown or FTabsPrevTabButtonIsDown then
    Message.Result := 1;
end;

procedure TdxTabContainerDockSite.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  if FTabsNextTabButtonIsHot or FTabsPrevTabButtonIsHot then
  begin
    FTabsNextTabButtonIsHot := False;
    FTabsPrevTabButtonIsHot := False;
    InvalidateNC(False);
  end;
end;

procedure TdxTabContainerDockSite.WMLButtonDown(var Message: TWMLButtonDown);
begin
  inherited;
  if Message.Result = 0 then
  begin
    if IsTabsNextTabButtonPoint(SourcePoint) then
    begin
      if TabsNextTabButtonIsEnabled then
      begin
        FTabsNextTabButtonIsDown := True;
        InvalidateNC(False);
        CaptureMouse;
      end;
      Message.Result := 1;
    end
    else if IsTabsPrevTabButtonPoint(SourcePoint) then
    begin
      if TabsPrevTabButtonIsEnabled then
      begin
        FTabsPrevTabButtonIsDown := True;
        InvalidateNC(False);
        CaptureMouse;
      end;
      Message.Result := 1;
    end
    else
    begin
      FPressedTabIndex := GetTabIndexAtPos(SourcePoint);
      if FPressedTabIndex > -1 then
      begin
        ActiveChild := Children[FPressedTabIndex];
        Controller.ActiveDockControl := Children[FPressedTabIndex];
        Modified;
        CaptureMouse;
      end;
      Message.Result := 1;
    end;
  end;
end;

procedure TdxTabContainerDockSite.WMLButtonUp(var Message: TWMLButtonUp);
begin
  inherited;
  if Message.Result = 0 then
  begin
    if FTabsNextTabButtonIsDown then
    begin
      ReleaseMouse;
      FTabsNextTabButtonIsDown := False;
      if IsTabsNextTabButtonPoint(CursorPoint) then
        IncFirstVisibleTabIndex;
      InvalidateNC(False);
      Message.Result := 1;
    end
    else if FTabsPrevTabButtonIsDown then
    begin
      ReleaseMouse;
      FTabsPrevTabButtonIsDown := False;
      if IsTabsPrevTabButtonPoint(CursorPoint) then
        DecFirstVisibleTabIndex;
      InvalidateNC(False);
      Message.Result := 1;
    end
    else if FPressedTabIndex > -1 then
    begin
      ReleaseMouse;
      FPressedTabIndex := -1;
      Message.Result := 1;
    end;
  end;
end;

procedure TdxTabContainerDockSite.WMLButtonDblClk(var Message: TWMLButtonDblClk);
var
  pt: TPoint;
  ATabIndex: Integer;
  AControl: TdxCustomDockControl;
begin
  inherited;
  if Message.Result = 0 then
  begin
    ATabIndex := GetTabIndexAtPos(CursorPoint);
    if not IsDesigning and (doDblClickDocking in Controller.Options) and
      not AutoHide and (ATabIndex > -1) and
      not IsTabsNextTabButtonPoint(CursorPoint) and
      not IsTabsPrevTabButtonPoint(CursorPoint) then
    begin
      AControl := Children[ATabIndex];
      if (AControl <> nil) and AControl.Dockable then
      begin
        pt := ClientToScreen(CursorPoint);
        DoStartDocking(pt);
        AControl.MakeFloating;
        DoEndDocking(pt);
        Message.Result := 1;
      end;
    end;
  end;
end;

procedure TdxTabContainerDockSite.WMMouseMove(var Message: TWMMouseMove);
var
  AIsButtonPoint: Boolean;
begin
  inherited;
  if (Message.Result = 0) and (FloatFormActive or ParentFormActive or IsDesigning) then
  begin
    AIsButtonPoint := IsTabsNextTabButtonPoint(CursorPoint);
    if AIsButtonPoint and not FTabsNextTabButtonIsHot then
    begin
      FTabsPrevTabButtonIsHot := False;
      FTabsNextTabButtonIsHot := True;
      InvalidateNC(False);
      Message.Result := 1;
    end;
    if not AIsButtonPoint and FTabsNextTabButtonIsHot then
    begin
      FTabsNextTabButtonIsHot := False;
      InvalidateNC(False);
      Message.Result := 1;
    end;
    AIsButtonPoint := IsTabsPrevTabButtonPoint(CursorPoint);
    if AIsButtonPoint and not FTabsPrevTabButtonIsHot then
    begin
      FTabsNextTabButtonIsHot := False;
      FTabsPrevTabButtonIsHot := True;
      InvalidateNC(False);
      Message.Result := 1;
    end;
    if not AIsButtonPoint and FTabsPrevTabButtonIsHot then
    begin
      FTabsPrevTabButtonIsHot := False;
      InvalidateNC(False);
      Message.Result := 1;
    end;
    if (FPressedTabIndex > -1) and ((IsDesigning and
      ((Abs(CursorPoint.X - SourcePoint.X) > 3) or
      (Abs(CursorPoint.Y - SourcePoint.Y) > 3))) or
      (GetTabIndexAtPos(CursorPoint) <> FPressedTabIndex)) then
    begin
      ReleaseMouse;
      FPressedTabIndex := -1;
      if ActiveChild <> nil then
        ActiveChild.StartDocking(ClientToScreen(SourcePoint));
      Message.Result := 1;
    end;
  end;
end;

function TdxTabContainerDockSite.GetTabsButtonsVisible: Boolean;
begin
  Result := TabsScroll and (TabsPrevTabButtonIsEnabled or TabsNextTabButtonIsEnabled);
end;

{ TdxSideContainerDockSite }

procedure TdxSideContainerDockSite.DoActiveChildChanged;
begin
  inherited;
  NCChanged;
  AdjustChildrenBounds(nil);
end;

function TdxSideContainerDockSite.CanChildResize(AControl: TdxCustomDockControl; ADeltaSize: Integer): Boolean;
var
  AIndex, ANextIndex: Integer;
begin
  AIndex := AControl.DockIndex;
  ANextIndex := GetNextValidChildIndex(AIndex);
  Result := (ANextIndex > -1) and (MinSizes[AIndex] < OriginalSizes[AIndex] + ADeltaSize) and
    (MinSizes[ANextIndex] < OriginalSizes[ANextIndex] - ADeltaSize);
end;

procedure TdxSideContainerDockSite.DoChildResize(AControl: TdxCustomDockControl; ADeltaSize: Integer);
var
  I, AIndex, ANextIndex: Integer;
begin
  AIndex := AControl.DockIndex;
  ANextIndex := GetNextValidChildIndex(AIndex);
  if AIndex > -1 then
  begin
    BeginAdjustBounds;
    try
      if ActiveChild <> nil then
      begin
        for I := 0 to ChildCount - 1 do
          OriginalSizes[I] := Sizes[I];
        ActiveChild := nil;
      end;
      OriginalSizes[AIndex] := OriginalSizes[AIndex] + ADeltaSize;
      OriginalSizes[ANextIndex] := OriginalSizes[ANextIndex] - ADeltaSize;
      if OriginalSizes[AIndex] < MinSizes[AIndex] then
      begin
        ADeltaSize := MinSizes[AIndex] - OriginalSizes[AIndex];
        OriginalSizes[AIndex] := OriginalSizes[AIndex] + ADeltaSize;
        OriginalSizes[ANextIndex] := OriginalSizes[ANextIndex] - ADeltaSize;
      end;
      if OriginalSizes[ANextIndex] < MinSizes[ANextIndex] then
      begin
        ADeltaSize := MinSizes[ANextIndex] - OriginalSizes[ANextIndex];
        OriginalSizes[ANextIndex] := OriginalSizes[ANextIndex] + ADeltaSize;
        OriginalSizes[AIndex] := OriginalSizes[AIndex] - ADeltaSize;
      end;
      Sizes[AIndex] := OriginalSizes[AIndex];
      Sizes[ANextIndex] := OriginalSizes[ANextIndex];
    finally
      EndAdjustBounds;
    end;
  end;
end;

procedure TdxSideContainerDockSite.BeginAdjustBounds;
begin
  Inc(FAdjustBoundsLock);
  DisableAlign;
end;

procedure TdxSideContainerDockSite.EndAdjustBounds;
begin
  EnableAlign;
  Dec(FAdjustBoundsLock);
end;

procedure TdxSideContainerDockSite.AdjustChildrenBounds(AControl: TdxCustomDockControl);
var
  I, ADeltaSize: Integer;
  APrevIndex: Integer;
begin
  if AdjustBoundsLock > 0  then exit;
  if (UpdateLayoutLock > 0) and (AControl = nil) then exit;
  BeginAdjustBounds;
  try
    if ActiveChild <> nil then
    begin
      for I := 0 to ActiveChildIndex - 1 do
      begin
        if not IsValidChild(Children[I]) then continue;
        Children[I].SetDockType(GetHeadDockType);
        Sizes[I] := MinSizes[I];
      end;
      for I := ChildCount - 1 downto ActiveChildIndex + 1 do
      begin
        if not IsValidChild(Children[I]) then continue;
        Children[I].SetDockType(GetTailDockType);
        Sizes[I] := MinSizes[I];
      end;
      if IsValidChild(ActiveChild) then ActiveChild.SetDockType(dtClient);
    end
    else if ValidChildCount > 1 then
    begin
      if AControl <> nil then
        ADeltaSize := GetDifferentSize div (ValidChildCount - 1)
      else ADeltaSize := GetDifferentSize div ValidChildCount;
      for I := 0 to ChildCount - 1 do
      begin
        if Children[I] = AControl then continue;
        if not IsValidChild(Children[I]) then continue;
        OriginalSizes[I] := OriginalSizes[I] + ADeltaSize;
        if OriginalSizes[I] < MinSizes[I] then
          OriginalSizes[I] := MinSizes[I];
      end;
      NormalizeChildrenBounds(GetDifferentSize);
      for I := 0 to ChildCount - 1 do
      begin
        if not IsValidChild(Children[I]) then continue;
        Children[I].SetDockType(GetHeadDockType);
        APrevIndex := GetPrevValidChildIndex(I);
        if APrevIndex > -1 then
          Positions[I] := Positions[APrevIndex] + Sizes[APrevIndex];
        Sizes[I] := OriginalSizes[I];
      end;
    end
    else if ValidChildCount > 0 then
    begin
      for I := 0 to ChildCount - 1 do
      begin
        if not IsValidChild(Children[I]) then continue;
        Children[I].SetDockType(dtClient);
      end;
    end;
  finally
    EndAdjustBounds;
  end;
end;

procedure TdxSideContainerDockSite.NormalizeChildrenBounds(ADeltaSize: Integer);
var
  I: Integer;
begin
  for I := 0 to ChildCount - 1 do
  begin
    if not IsValidChild(Children[I]) then continue;
    if ADeltaSize = 0 then break;
    if OriginalSizes[I] > MinSizes[I] then
      if OriginalSizes[I] + ADeltaSize < MinSizes[I] then
      begin
        ADeltaSize := ADeltaSize + (OriginalSizes[I] - MinSizes[I]);
        OriginalSizes[I] := MinSizes[I];
      end
      else
      begin
        OriginalSizes[I] := OriginalSizes[I] + ADeltaSize;
        ADeltaSize := 0;
      end;
  end;
end;

procedure TdxSideContainerDockSite.SetChildBounds(AControl: TdxCustomDockControl;
  AWidth, AHeight: Integer);
begin
  if not IsValidChild(AControl) then exit;
  if (ActiveChild = nil) and (AdjustBoundsLock = 0) then
  begin
    OriginalSizes[AControl.DockIndex] := GetDimension(AWidth, AHeight);
    AdjustChildrenBounds(nil);
  end;
end;

function TdxSideContainerDockSite.IsValidActiveChild(AControl: TdxCustomDockControl): Boolean;
begin
  Result := IsValidChild(AControl) or (AControl = nil);
end;

procedure TdxSideContainerDockSite.ValidateActiveChild(AIndex: Integer);
begin
  if IsValidChild(ActiveChild) then exit;
  if (ActiveChild <> nil) and IsValidChild(ActiveChild.Container) then
    ActiveChild := ActiveChild.Container
  else ActiveChild := nil;
end;

function TdxSideContainerDockSite.HasBorder: Boolean;
begin
  Result := (doSideContainerHasCaption in Controller.Options) and
    ShowCaption and (FloatDockSite = nil) and (ValidChildCount > 1);
end;

function TdxSideContainerDockSite.HasCaption: Boolean;
begin
  Result := (doSideContainerHasCaption in Controller.Options) and
    ShowCaption and (FloatDockSite = nil) and (ValidChildCount > 1);
end;

function TdxSideContainerDockSite.CanActive: Boolean;
begin
  Result := True;
end;

function TdxSideContainerDockSite.CanAutoHide: Boolean;
begin
  Result := IsLoading or ((AutoHideHostSite <> nil) and
    ((AutoHideControl = nil) or (AutoHideControl = Self)));
end;

function TdxSideContainerDockSite.CanDockHost(AControl: TdxCustomDockControl; AType: TdxDockingType): Boolean;
var
  ACanDockHost: Boolean;
begin
  ACanDockHost := CanContainerDockHost(AType);
  if doSideContainerCanInSideContainer in Controller.Options then
    ACanDockHost := ACanDockHost or (AType in [dtLeft, dtRight, dtTop, dtBottom]);
  if doSideContainerCanInTabContainer in Controller.Options then
    ACanDockHost := ACanDockHost or (AType in [dtClient]);
  Result := inherited CanDockHost(AControl, AType) and ACanDockHost;;
end;

function TdxSideContainerDockSite.CanMaximize: Boolean;
begin
  Result := not AutoHide and (SideContainer <> nil) and (SideContainer.ValidChildCount > 1);
end;

procedure TdxSideContainerDockSite.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  inherited;
  AdjustChildrenBounds(nil);
end;

procedure TdxSideContainerDockSite.UpdateControlDockZones(AControl: TdxCustomDockControl;
  AZoneWidth: Integer);
begin
  if doSideContainerCanInSideContainer in Controller.Options then
    inherited;
end;

procedure TdxSideContainerDockSite.IncludeToDock(AControl: TdxCustomDockControl;
  AType: TdxDockingType; Index: Integer);
var
  AChild: TdxCustomDockControl;
begin
  if AControl.CanAcceptSideContainerItems(Self) and (ChildCount > 0) then
  begin
    while ChildCount > 0 do
    begin
      AChild := Children[ChildCount - 1];
      AChild.ExcludeFromDock;
      AChild.IncludeToDock(AControl, AType, Index);
      if AControl is TdxSideContainerDockSite then
        (AControl as TdxSideContainerDockSite).AdjustChildrenBounds(AChild);
    end;
    DoDestroy;
  end
  else inherited;
end;

procedure TdxSideContainerDockSite.CreateLayout(AControl: TdxCustomDockControl;
  AType: TdxDockingType; Index: Integer);
begin
  if CanContainerDockHost(AType) then
  begin
    AControl.IncludeToDock(Self, AType, Index);
    AdjustChildrenBounds(AControl);
  end
  else if (Container <> nil) and Container.CanContainerDockHost(AType) then
    CreateContainerLayout(Container, AControl, AType, DockIndex)
  else
    case AType of
      dtLeft, dtRight,
      dtTop, dtBottom:
        CreateSideContainerLayout(AControl, AType, Index);
      dtClient:
        CreateTabContainerLayout(AControl, AType, Index);
    else
      Assert(False, Format(sdxInternalErrorCreateLayout, [TdxTabContainerDockSite.ClassName]));
    end;
end;

procedure TdxSideContainerDockSite.UpdateLayout;
begin
  inherited;
  AdjustChildrenBounds(nil);
end;

procedure TdxSideContainerDockSite.LoadLayoutFromCustomIni(AIniFlie: TCustomIniFile;
  AParentControl: TdxCustomDockControl; ASection: string);
begin
  BeginAdjustBounds;
  try
    inherited;
  finally
    EndAdjustBounds;
  end;
end;

function TdxSideContainerDockSite.CanAcceptSideContainerItems(AContainer: TdxSideContainerDockSite): Boolean;
begin
  if doSideContainerCanInSideContainer in Controller.Options then
    Result := AContainer.ClassType = ClassType
  else Result := True;
end;

function TdxSideContainerDockSite.CanAcceptTabContainerItems(AContainer: TdxTabContainerDockSite): Boolean;
begin
  if doTabContainerCanInSideContainer in Controller.Options then
    Result := False
  else Result := True;
end;

procedure TdxSideContainerDockSite.UpdateCaption;
var
  I: Integer;
  ACaption: string;
begin
  ACaption := '';
  for I := 0 to ChildCount - 1 do
  begin
    if not IsValidChild(Children[I]) then continue;
    ACaption := ACaption + Children[I].Caption;
    if GetNextValidChild(I) <> nil then
      ACaption := ACaption + ', ';
  end;
  if Caption <> ACaption then
    Caption := ACaption;
  inherited UpdateCaption;
end;

procedure TdxSideContainerDockSite.ChangeAutoHide;
begin
  if AutoHide then
    AutoHide := False
  else if doSideContainerCanAutoHide in Controller.Options then
    inherited ChangeAutoHide
  else if ActiveChild <> nil then
    ActiveChild.ChangeAutoHide
  else if GetFirstValidChild <> nil then
    GetFirstValidChild.ChangeAutoHide
end;

procedure TdxSideContainerDockSite.DoClose;
begin
  if (doSideContainerCanClose in Controller.Options) then
    inherited DoClose
  else if ActiveChild <> nil then
    ActiveChild.DoClose
  else if GetFirstValidChild <> nil then
    GetFirstValidChild.DoClose;
end;

procedure TdxSideContainerDockSite.ChildVisibilityChanged(Sender: TdxCustomDockControl);
begin
  inherited;
  if IsValidChild(Sender) then
    AdjustChildrenBounds(Sender)
  else if Sender = ActiveChild then
    ValidateActiveChild(Sender.DockIndex);
  NCChanged;
end;

function TdxSideContainerDockSite.GetDifferentSize: Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to ChildCount - 1 do
  begin
    if not IsValidChild(Children[I]) then continue;
    Inc(Result, OriginalSizes[I]);
  end;
  Result := GetContainerSize - Result;
end;

{ TdxHorizContainerDockSite }

procedure TdxHorizContainerDockSite.UpdateControlResizeZones(AControl: TdxCustomDockControl);
begin
  inherited;
  if (AControl.SideContainerItem <> nil) and (AControl.SideContainer = Self) then
    if GetNextValidChild(AControl.SideContainerIndex) <> nil then
      AControl.ResizeZones.Insert(0, TdxHorizContainerZone.Create(
        AControl.SideContainerItem, dxResizeZoneWidth));
end;

procedure TdxHorizContainerDockSite.UpdateControlOriginalSize(AControl: TdxCustomDockControl);
begin
  if (AControl = Self) or (DockType in [dtTop, dtBottom]) then
    inherited
  else if (DockType = dtClient) and (FloatDockSite <> nil) then
    AControl.FOriginalHeight := FloatDockSite.Height;
end;

class function TdxHorizContainerDockSite.GetHeadDockType: TdxDockingType;
begin
  Result := dtLeft;
end;

class function TdxHorizContainerDockSite.GetTailDockType: TdxDockingType;
begin
  Result := dtRight;
end;

function TdxHorizContainerDockSite.GetContainerSize: Integer;
begin
  if HandleAllocated and (ClientWidth > 0) then
    Result := ClientWidth
  else Result := Width;
end;

function TdxHorizContainerDockSite.GetDimension(AWidth, AHeight: Integer): Integer;
begin
  Result := AWidth;
end;

function TdxHorizContainerDockSite.GetMinSize(Index: Integer): Integer;
begin
  Result := Children[Index].GetMinimizedWidth;
end;

function TdxHorizContainerDockSite.GetOriginalSize(Index: Integer): Integer;
begin
  Result := Children[Index].OriginalWidth;
end;

function TdxHorizContainerDockSite.GetSize(Index: Integer): Integer;
begin
  Result := Children[Index].Width;
end;

function TdxHorizContainerDockSite.GetPosition(Index: Integer): Integer;
begin
  Result := Children[Index].Left;
end;

procedure TdxHorizContainerDockSite.SetOriginalSize(Index: Integer;
  const Value: Integer);
var
  I: Integer;
begin
  Children[Index].FOriginalWidth := Value;
  if Children[Index] is TdxTabContainerDockSite then
    for I := 0 to Children[Index].ChildCount - 1 do
      Children[Index].Children[I].FOriginalWidth := Value;
end;

procedure TdxHorizContainerDockSite.SetSize(Index: Integer; const Value: Integer);
begin
  Children[Index].Width := Value;
end;

procedure TdxHorizContainerDockSite.SetPosition(Index: Integer; const Value: Integer);
begin
  Children[Index].Left := Value;
end;

{ TdxVertContainerDockSite }

procedure TdxVertContainerDockSite.UpdateControlResizeZones(AControl: TdxCustomDockControl);
begin
  inherited;
  if (AControl.SideContainerItem <> nil) and (AControl.SideContainer = Self) then
    if GetNextValidChild(AControl.SideContainerIndex) <> nil then
      AControl.ResizeZones.Insert(0, TdxVertContainerZone.Create(
        AControl.SideContainerItem, dxResizeZoneWidth));
end;

procedure TdxVertContainerDockSite.UpdateControlOriginalSize(AControl: TdxCustomDockControl);
begin
  if (AControl = Self) or (DockType in [dtLeft, dtRight]) then
    inherited
  else if (DockType = dtClient) and (FloatDockSite <> nil) then
    AControl.FOriginalWidth := FloatDockSite.Width;
end;

class function TdxVertContainerDockSite.GetHeadDockType: TdxDockingType;
begin
  Result := dtTop;
end;

class function TdxVertContainerDockSite.GetTailDockType: TdxDockingType;
begin
  Result := dtBottom;
end;

function TdxVertContainerDockSite.GetContainerSize: Integer;
begin
  if HandleAllocated and (ClientHeight > 0) then
    Result := ClientHeight
  else Result := Height;
end;

function TdxVertContainerDockSite.GetDimension(AWidth, AHeight: Integer): Integer;
begin
  Result := AHeight;
end;

function TdxVertContainerDockSite.GetMinSize(Index: Integer): Integer;
begin
  Result := Children[Index].GetMinimizedHeight;
end;

function TdxVertContainerDockSite.GetOriginalSize(Index: Integer): Integer;
begin
  Result := Children[Index].OriginalHeight;
end;

function TdxVertContainerDockSite.GetSize(Index: Integer): Integer;
begin
  Result := Children[Index].Height;
end;

function TdxVertContainerDockSite.GetPosition(Index: Integer): Integer;
begin
  Result := Children[Index].Top;
end;

procedure TdxVertContainerDockSite.SetOriginalSize(Index: Integer;
  const Value: Integer);
var
  I: Integer;
begin
  Children[Index].FOriginalHeight := Value;
  if Children[Index] is TdxTabContainerDockSite then
    for I := 0 to Children[Index].ChildCount - 1 do
      Children[Index].Children[I].FOriginalHeight := Value;
end;

procedure TdxVertContainerDockSite.SetSize(Index: Integer; const Value: Integer);
begin
  Children[Index].Height := Value;
end;

procedure TdxVertContainerDockSite.SetPosition(Index: Integer; const Value: Integer);
begin
  Children[Index].Top := Value;
end;

{ TdxDockSiteAutoHideContainer }

constructor TdxDockSiteAutoHideContainer.Create(AOwner: TComponent);
begin
  inherited;
  Visible := False;
  ControlStyle := [csNoDesignVisible];
end;

procedure TdxDockSiteAutoHideContainer.WMEraseBkgnd(var Message: TWmEraseBkgnd);
begin
  Message.Result := 1;
end;

{ TdxDockSiteHideBar }

constructor TdxDockSiteHideBar.Create(AOwner: TdxDockSite);
begin
  FOwner := AOwner;
  FDockControls := TList.Create;
end;

destructor TdxDockSiteHideBar.Destroy;
begin
  FDockControls.Free;
  inherited;
end;

function TdxDockSiteHideBar.IndexOfDockControl(AControl: TdxCustomDockControl): Integer;
begin
  Result := FDockControls.IndexOf(AControl);
end;

procedure TdxDockSiteHideBar.CreateAutoHideContainer(AControl: TdxCustomDockControl);
var
  AContainer: TdxDockSiteAutoHideContainer;
begin
  AContainer := TdxDockSiteAutoHideContainer.Create(Owner);
  AContainer.Anchors := GetContainersAnchors;
  AContainer.Parent := Owner.Parent;
  AControl.BeginUpdateLayout;
  try
    AControl.Align := GetControlsAlign;
    AControl.Parent := AContainer;
    AControl.SetVisibility(False);
    AControl.AdjustControlBounds(AControl);
  finally
    AControl.EndUpdateLayout;
  end;
end;

procedure TdxDockSiteHideBar.DestroyAutoHideContainer(AControl: TdxCustomDockControl);
var
  AContainer: TdxDockSiteAutoHideContainer;
begin
  AContainer := AControl.AutoHideContainer;
  if AContainer <> nil then
  begin
    AControl.BeginUpdateLayout;
    try
      AControl.SetVisibility(True);
      AControl.SetParentDockControl(AControl.ParentDockControl);
      AControl.SetDockType(AControl.DockType);
      AControl.AdjustControlBounds(AControl);
    finally
      AControl.EndUpdateLayout;
    end;
    AContainer.Free;
  end;
end;

procedure TdxDockSiteHideBar.RegisterDockControl(AControl: TdxCustomDockControl);
begin
  FDockControls.Add(AControl);
  CreateAutoHideContainer(AControl);
end;

procedure TdxDockSiteHideBar.UnregisterDockControl(AControl: TdxCustomDockControl);
begin
  DestroyAutoHideContainer(AControl);
  FDockControls.Remove(AControl);
end;

function TdxDockSiteHideBar.GetControlAtPos(pt: TPoint; var SubControl: TdxCustomDockControl): TdxCustomDockControl;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to DockControlCount - 1 do
    if PtInRect(ButtonsRects[I], pt) then
    begin
      Result := DockControls[I];
      if Result is TdxTabContainerDockSite then
        SubControl := GetTabContainerChildAtPos(pt, DockControls[I] as TdxTabContainerDockSite)
      else SubControl := nil;
      break;
    end;
end;

function TdxDockSiteHideBar.GetTabContainerChildAtPos(pt: TPoint;
  TabContainer: TdxTabContainerDockSite): TdxCustomDockControl;
begin
  Result := nil;
end;

function TdxDockSiteHideBar.GetButtonRectCount: Integer;
begin
  Result := Length(FButtonsRects);
end;

function TdxDockSiteHideBar.GetButtonRect(Index: Integer): TRect;
begin
  Result := FButtonsRects[Index];
end;

function TdxDockSiteHideBar.GetDockControl(Index: Integer): TdxCustomDockControl;
begin
  Result := TdxCustomDockControl(FDockControls.Items[Index]);
end;

function TdxDockSiteHideBar.GetDockControlCount: Integer;
begin
  Result := FDockControls.Count;
end;

function TdxDockSiteHideBar.GetPainter: TdxDockControlPainter;
begin
  Result := Owner.Painter;
end;

function TdxDockSiteHideBar.GetVisible: Boolean;
begin
  Result := DockControlCount > 0;
end;

{ TdxDockSiteLeftHideBar }

procedure TdxDockSiteLeftHideBar.Calculate(R: TRect);
begin
  FRect.Left := R.Left;
  FRect.Top := R.Top;
  FRect.Bottom := R.Bottom;
  SetLength(FButtonsRects, DockControlCount);
  if Visible then
  begin
    FRect.Right := FRect.Left + Painter.GetHideBarWidth;
    CalculateButtons(FRect);
  end
  else FRect.Right := FRect.Left;
end;

procedure TdxDockSiteLeftHideBar.CalculateButtons(R: TRect);
var
  I, APos: Integer;
begin
  APos := R.Top + Painter.GetHideBarHorizInterval;
  if Owner.TopHideBar.Visible then
    Inc(APos, Painter.GetHideBarHeight);
  for I := 0 to DockControlCount - 1 do
  begin
    FButtonsRects[I].Top := APos;
    FButtonsRects[I].Bottom := FButtonsRects[I].Top + GetButtonWidth(DockControls[I]);
    FButtonsRects[I].Left := R.Left + Painter.GetHideBarVertInterval;
    FButtonsRects[I].Right := R.Right - Painter.GetHideBarVertInterval;
    APos := FButtonsRects[I].Bottom + Painter.GetHideBarHorizInterval
  end;
end;

function TdxDockSiteLeftHideBar.GetButtonWidth(AControl: TdxCustomDockControl): Integer;
var
  I: Integer;
  ASize: TSize;
  ACaption: string;
  ATabContainer: TdxTabContainerDockSite;
begin
  if AControl is TdxTabContainerDockSite then
  begin
    ATabContainer := AControl as TdxTabContainerDockSite;
    Result := 0;
    for I := 0 to ATabContainer.ChildCount - 1 do
      if ATabContainer.IsValidChild(ATabContainer.Children[I]) then
      begin
        ACaption := ATabContainer.Children[I].Caption;
        GetTextExtentPoint32(Owner.Canvas.Handle, PChar(ACaption), Length(ACaption), ASize);
        if Result < ASize.cx then Result := ASize.cx;
      end;
    Result := 2 * Painter.GetHideBarHorizInterval + Result +
      (Painter.GetDefaultImageHeight + 2 * Painter.GetHideBarHorizInterval) *
      (AControl as TdxTabContainerDockSite).ValidChildCount
  end
  else
  begin
    ACaption := AControl.Caption;
    GetTextExtentPoint32(Owner.Canvas.Handle, PChar(ACaption), Length(ACaption), ASize);
    Result := Painter.GetHideBarHorizInterval + ASize.cx + Painter.GetHideBarHorizInterval;
    if Painter.GetImageHeight > 0 then
      Result := Result + Painter.GetImageHeight + 2 * Painter.GetHideBarHorizInterval
    else Result := Result + Painter.GetHideBarHorizInterval;
  end;
end;

function TdxDockSiteLeftHideBar.GetContainersAnchors: TAnchors;
begin
  Result := [akLeft, akTop, akBottom];
end;

function TdxDockSiteLeftHideBar.GetControlsAlign: TAlign;
begin
  Result := alRight;
end;

function TdxDockSiteLeftHideBar.GetPosition: TdxAutoHidePosition;
begin
  Result := ahpLeft;
end;

function TdxDockSiteLeftHideBar.CheckHidingFinish: Boolean;
begin
  Result := Owner.MovingContainer.Width <= 0;
end;

function TdxDockSiteLeftHideBar.CheckShowingFinish: Boolean;
begin
  Result := Owner.MovingContainer.Width >= Owner.MovingControl.OriginalWidth;
end;

procedure TdxDockSiteLeftHideBar.SetFinalPosition(AControl: TdxCustomDockControl);
begin
  AControl.AutoHideContainer.SetBounds(Owner.GetClientLeft, Owner.GetClientTop,
    AControl.OriginalWidth, Owner.GetClientHeight);
end;

procedure TdxDockSiteLeftHideBar.SetInitialPosition(AControl: TdxCustomDockControl);
begin
  AControl.AutoHideContainer.SetBounds(Owner.GetClientLeft, Owner.GetClientTop,
    0, Owner.GetClientHeight);
end;

procedure TdxDockSiteLeftHideBar.UpdatePosition(ADelta: Integer);
begin
  if (ADelta > 0) and (Owner.MovingContainer.Width + ADelta > Owner.MovingControl.OriginalWidth) then
    SetFinalPosition(Owner.MovingControl)
  else if (ADelta < 0) and (Owner.MovingContainer.Width + ADelta < 0) then
    SetInitialPosition(Owner.MovingControl)
  else Owner.MovingContainer.Width := Owner.MovingContainer.Width + ADelta;
end;

procedure TdxDockSiteLeftHideBar.UpdateOwnerAutoSizeBounds(AControl: TdxCustomDockControl);
begin
  Owner.UpdateAutoSizeBounds(Painter.GetHideBarWidth, AControl.OriginalHeight);
end;

function TdxDockSiteLeftHideBar.GetTabContainerChildAtPos(pt: TPoint;
  TabContainer: TdxTabContainerDockSite): TdxCustomDockControl;
var
  I, Index: Integer;
  ARect, R: TRect;
begin
  Result := nil;
  Index := IndexOfDockControl(TabContainer);
  ARect := ButtonsRects[Index];
  for I := 0 to TabContainer.ActiveChildIndex - 1 do
  begin
    if not TabContainer.IsValidChild(TabContainer.Children[I]) then continue;
    R := ARect;
    R.Bottom := R.Top + (Painter.GetDefaultImageHeight + 2 * Painter.GetHideBarHorizInterval);
    if PtInRect(R, pt) then
    begin
      Result := TabContainer.Children[I];
      break;
    end;
    ARect.Top := R.Bottom;
  end;
  if Result = nil then
    for I := TabContainer.ChildCount - 1 downto TabContainer.ActiveChildIndex + 1 do
    begin
      if not TabContainer.IsValidChild(TabContainer.Children[I]) then continue;
      R := ARect;
      R.Top := R.Bottom - (Painter.GetDefaultImageHeight + 2 * Painter.GetHideBarHorizInterval);
      if PtInRect(R, pt) then
      begin
        Result := TabContainer.Children[I];
        break;
      end;
      ARect.Bottom := R.Top;
    end;
  if Result = nil then
    Result := TabContainer.ActiveChild;
end;

{ TdxDockSiteTopHideBar }

procedure TdxDockSiteTopHideBar.Calculate(R: TRect);
begin
  FRect.Left := R.Left;
  FRect.Top := R.Top;
  FRect.Right := R.Right;
  SetLength(FButtonsRects, DockControlCount);
  if Visible then
  begin
    FRect.Bottom := FRect.Top + Painter.GetHideBarHeight;
    CalculateButtons(FRect);
  end
  else FRect.Bottom := FRect.Top;
end;

procedure TdxDockSiteTopHideBar.CalculateButtons(R: TRect);
var
  I, APos: Integer;
begin
  APos := R.Left + Painter.GetHideBarHorizInterval;
  if Owner.LeftHideBar.Visible then
    Inc(APos, Painter.GetHideBarWidth);
  for I := 0 to DockControlCount - 1 do
  begin
    FButtonsRects[I].Left := APos;
    FButtonsRects[I].Right := FButtonsRects[I].Left + GetButtonWidth(DockControls[I]);
    FButtonsRects[I].Top := R.Top + Painter.GetHideBarVertInterval;
    FButtonsRects[I].Bottom := R.Bottom - Painter.GetHideBarVertInterval;
    APos := FButtonsRects[I].Right + Painter.GetHideBarHorizInterval
  end;
end;

function TdxDockSiteTopHideBar.GetButtonWidth(AControl: TdxCustomDockControl): Integer;
var
  I: Integer;
  ASize: TSize;
  ACaption: string;
  ATabContainer: TdxTabContainerDockSite;
begin
  if AControl is TdxTabContainerDockSite then
  begin
    ATabContainer := AControl as TdxTabContainerDockSite;
    Result := 0;
    for I := 0 to ATabContainer.ChildCount - 1 do
      if ATabContainer.IsValidChild(ATabContainer.Children[I]) then
      begin
        ACaption := ATabContainer.Children[I].Caption;
        GetTextExtentPoint32(Owner.Canvas.Handle, PChar(ACaption), Length(ACaption), ASize);
        if Result < ASize.cx then Result := ASize.cx;
      end;
    Result := 2 * Painter.GetHideBarHorizInterval + Result +
      (Painter.GetDefaultImageWidth + 2 * Painter.GetHideBarHorizInterval) *
      (AControl as TdxTabContainerDockSite).ValidChildCount
  end
  else
  begin
    ACaption := AControl.Caption;
    GetTextExtentPoint32(Owner.Canvas.Handle, PChar(ACaption), Length(ACaption), ASize);
    Result := Painter.GetHideBarHorizInterval + ASize.cx + Painter.GetHideBarHorizInterval;
    if Painter.GetImageWidth > 0 then
      Result := Result + Painter.GetImageWidth + 2 * Painter.GetHideBarHorizInterval
    else Result := Result + Painter.GetHideBarHorizInterval;
  end;
end;

function TdxDockSiteTopHideBar.GetContainersAnchors: TAnchors;
begin
  Result := [akTop, akLeft, akRight];
end;

function TdxDockSiteTopHideBar.GetControlsAlign: TAlign;
begin
  Result := alBottom;
end;

function TdxDockSiteTopHideBar.GetPosition: TdxAutoHidePosition;
begin
  Result := ahpTop;
end;

function TdxDockSiteTopHideBar.CheckHidingFinish: Boolean;
begin
  Result := Owner.MovingContainer.Height <= 0;
end;

function TdxDockSiteTopHideBar.CheckShowingFinish: Boolean;
begin
  Result := (Owner.MovingContainer.Height >= Owner.MovingControl.OriginalHeight);
end;

procedure TdxDockSiteTopHideBar.SetFinalPosition(AControl: TdxCustomDockControl);
begin
  AControl.AutoHideContainer.SetBounds(Owner.GetClientLeft, Owner.GetClientTop,
    Owner.GetClientWidth, AControl.OriginalHeight);
end;

procedure TdxDockSiteTopHideBar.SetInitialPosition(AControl: TdxCustomDockControl);
begin
  AControl.AutoHideContainer.SetBounds(Owner.GetClientLeft, Owner.GetClientTop,
    Owner.GetClientWidth, 0);
end;

procedure TdxDockSiteTopHideBar.UpdatePosition(ADelta: Integer);
begin
  if (ADelta > 0) and (Owner.MovingContainer.Height + ADelta > Owner.MovingControl.OriginalHeight) then
    SetFinalPosition(Owner.MovingControl)
  else if (ADelta < 0) and (Owner.MovingContainer.Height + ADelta < 0) then
    SetInitialPosition(Owner.MovingControl)
  else Owner.MovingContainer.Height := Owner.MovingContainer.Height + ADelta;
end;

procedure TdxDockSiteTopHideBar.UpdateOwnerAutoSizeBounds(AControl: TdxCustomDockControl);
begin
  Owner.UpdateAutoSizeBounds(AControl.OriginalWidth, Painter.GetHideBarWidth);
end;

function TdxDockSiteTopHideBar.GetTabContainerChildAtPos(pt: TPoint;
  TabContainer: TdxTabContainerDockSite): TdxCustomDockControl;
var
  I, Index: Integer;
  ARect, R: TRect;
begin
  Result := nil;
  Index := IndexOfDockControl(TabContainer);
  ARect := ButtonsRects[Index];
  for I := 0 to TabContainer.ActiveChildIndex - 1 do
  begin
    if not TabContainer.IsValidChild(TabContainer.Children[I]) then continue;
    R := ARect;
    R.Right := R.Left + (Painter.GetDefaultImageWidth + 2 * Painter.GetHideBarHorizInterval);
    if PtInRect(R, pt) then
    begin
      Result := TabContainer.Children[I];
      break;
    end;
    ARect.Left := R.Right;
  end;
  if Result = nil then
    for I := TabContainer.ChildCount - 1 downto TabContainer.ActiveChildIndex + 1 do
    begin
      if not TabContainer.IsValidChild(TabContainer.Children[I]) then continue;
      R := ARect;
      R.Left := R.Right - (Painter.GetDefaultImageWidth + 2 * Painter.GetHideBarHorizInterval);
      if PtInRect(R, pt) then
      begin
        Result := TabContainer.Children[I];
        break;
      end;
      ARect.Right := R.Left;
    end;
  if Result = nil then
    Result := TabContainer.ActiveChild;
end;

{ TdxDockSiteRightHideBar }

procedure TdxDockSiteRightHideBar.Calculate(R: TRect);
begin
  FRect.Right := R.Right;
  FRect.Top := R.Top;
  FRect.Bottom := R.Bottom;
  SetLength(FButtonsRects, DockControlCount);
  if Visible then
  begin
    FRect.Left := FRect.Right - Painter.GetHideBarWidth;
    CalculateButtons(FRect);
  end
  else FRect.Left := FRect.Right;
end;

function TdxDockSiteRightHideBar.GetContainersAnchors: TAnchors;
begin
  Result := [akRight, akTop, akBottom];
end;

function TdxDockSiteRightHideBar.GetControlsAlign: TAlign;
begin
  Result := alLeft;
end;

function TdxDockSiteRightHideBar.GetPosition: TdxAutoHidePosition;
begin
  Result := ahpRight;
end;

procedure TdxDockSiteRightHideBar.SetFinalPosition(AControl: TdxCustomDockControl);
begin
  AControl.AutoHideContainer.SetBounds(Owner.GetClientLeft + Owner.GetClientWidth - AControl.OriginalWidth,
    Owner.GetClientTop, AControl.OriginalWidth, Owner.GetClientHeight);
end;

procedure TdxDockSiteRightHideBar.SetInitialPosition(AControl: TdxCustomDockControl);
begin
  AControl.AutoHideContainer.SetBounds(Owner.GetClientLeft + Owner.GetClientWidth,
    Owner.GetClientTop, 0, Owner.GetClientHeight);
end;

procedure TdxDockSiteRightHideBar.UpdatePosition(ADelta: Integer);
begin
  if (ADelta > 0) and (Owner.MovingContainer.Width + ADelta > Owner.MovingControl.OriginalWidth) then
    SetFinalPosition(Owner.MovingControl)
  else if (ADelta < 0) and (Owner.MovingContainer.Width + ADelta < 0) then
    SetInitialPosition(Owner.MovingControl)
  else Owner.MovingContainer.SetBounds(Owner.MovingContainer.Left - ADelta, Owner.MovingContainer.Top,
    Owner.MovingContainer.Width + ADelta, Owner.MovingContainer.Height);
end;

{ TdxDockSiteBottomHideBar }

procedure TdxDockSiteBottomHideBar.Calculate(R: TRect);
begin
  FRect.Left := R.Left;
  FRect.Bottom := R.Bottom;
  FRect.Right := R.Right;
  SetLength(FButtonsRects, DockControlCount);
  if Visible then
  begin
    FRect.Top := FRect.Bottom - Painter.GetHideBarHeight;
    CalculateButtons(FRect);
  end
  else FRect.Top := FRect.Bottom;
end;

function TdxDockSiteBottomHideBar.GetContainersAnchors: TAnchors;
begin
  Result := [akBottom, akLeft, akRight];
end;

function TdxDockSiteBottomHideBar.GetControlsAlign: TAlign;
begin
  Result := alTop;
end;

function TdxDockSiteBottomHideBar.GetPosition: TdxAutoHidePosition;
begin
  Result := ahpBottom;
end;

procedure TdxDockSiteBottomHideBar.SetFinalPosition(AControl: TdxCustomDockControl);
begin
  AControl.AutoHideContainer.SetBounds(Owner.GetClientLeft,
    Owner.GetClientTop + Owner.GetClientHeight - AControl.OriginalHeight,
    Owner.GetClientWidth, AControl.OriginalHeight);
end;

procedure TdxDockSiteBottomHideBar.SetInitialPosition(AControl: TdxCustomDockControl);
begin
  AControl.AutoHideContainer.SetBounds(Owner.GetClientLeft, Owner.GetClientTop + Owner.GetClientHeight,
    Owner.GetClientWidth, 0);
end;

procedure TdxDockSiteBottomHideBar.UpdatePosition(ADelta: Integer);
begin
  if (ADelta > 0) and (Owner.MovingContainer.Height + ADelta > Owner.MovingControl.OriginalHeight) then
    SetFinalPosition(Owner.MovingControl)
  else if (ADelta < 0) and (Owner.MovingContainer.Height + ADelta < 0) then
    SetInitialPosition(Owner.MovingControl)
  else Owner.MovingContainer.SetBounds(Owner.MovingContainer.Left, Owner.MovingContainer.Top - ADelta,
    Owner.MovingContainer.Width, Owner.MovingContainer.Height + ADelta);
end;

{ TdxDockSite }

constructor TdxDockSite.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FHideBars := TList.Create;
  CreateHideBars;
  FHidingTimerID := -1;
  FMovingTimerID := -1;
  FShowingTimerID := -1;
  UseDoubleBuffer := True;
  UpdateDockZones;
end;

destructor TdxDockSite.Destroy;
begin
  DestroyHideBars;
  FHideBars.Free;
  inherited;
end;

function TdxDockSite.GetHideBarByControl(AControl: TdxCustomDockControl): TdxDockSiteHideBar;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to HideBarCount - 1 do
    if (HideBars[I].IndexOfDockControl(AControl) > -1) then
    begin
      Result := HideBars[I];
      break;
    end;
end;

function TdxDockSite.GetHideBarByPosition(APosition: TdxAutoHidePosition): TdxDockSiteHideBar;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to HideBarCount - 1 do
    if (HideBars[I].Position = APosition) then
    begin
      Result := HideBars[I];
      break;
    end;
end;

procedure TdxDockSite.CreateHideBars;
begin
  FHideBars.Add(TdxDockSiteTopHideBar.Create(Self));
  FHideBars.Add(TdxDockSiteBottomHideBar.Create(Self));
  FHideBars.Add(TdxDockSiteLeftHideBar.Create(Self));
  FHideBars.Add(TdxDockSiteRightHideBar.Create(Self));
end;

procedure TdxDockSite.DestroyHideBars;
var
  I: Integer;
begin
  for I := 0 to FHideBars.Count - 1 do
    TdxDockSiteHideBar(FHideBars[I]).Free;
  FHideBars.Clear;
end;

function TdxDockSite.CanDockHost(AControl: TdxCustomDockControl; AType: TdxDockingType): Boolean;
begin
  Result := inherited CanDockHost(AControl, AType);
  Result := Result and ((AType in [dtLeft, dtRight, dtTop, dtBottom]) or
    ((Atype in [dtClient]) and (ChildCount = 0)));
  Result := Result and (not AutoSize or ((AutoSizeClientControl = nil) and (AType = dtClient)));
end;

function TdxDockSite.GetDockZoneAtPos(AControl: TdxCustomDockControl; pt: TPoint): TdxZone;
begin
  Result := nil;
  if AutoSize and (ChildCount = 0) and (DockZones.Count > 0) and AControl.Dockable then
    Result := TdxZone(DockZones[0]);
  if (Result = nil) or not Result.CanDock(AControl) then
    Result := inherited GetDockZoneAtPos(AControl, pt);
end;

function TdxDockSite.GetPositionByControl(AControl: TdxCustomDockControl): TdxAutoHidePosition;
var
  AHideBar: TdxDockSiteHideBar;
begin
  AHideBar := GetHideBarByControl(AControl);
  if AHideBar <> nil then
    Result := AHideBar.Position
  else Result := ahpLeft;
end;

function TdxDockSite.GetControlAtPos(pt: TPoint; var SubControl: TdxCustomDockControl): TdxCustomDockControl;
var
  I: Integer;
begin
  Result := nil;
  pt := ClientToWindow(pt);
  for I := 0 to HideBarCount - 1 do
  begin
    Result := HideBars[I].GetControlAtPos(pt, SubControl);
    if Result <> nil then break;
  end;
end;

function TdxDockSite.GetHideBarAtPos(pt: TPoint): TdxDockSiteHideBar;
var
  I: Integer;
begin
  Result := nil;
  pt := ClientToWindow(pt);
  for I := 0 to HideBarCount - 1 do
    if HideBars[I].Visible and ptInRect(HideBars[I].Rect, pt) then
    begin
      Result := HideBars[I];
      break;
    end;
end;

function TdxDockSite.GetControlAutoHidePosition(AControl: TdxCustomDockControl): TdxAutoHidePosition;
begin
  if AutoSize then
  begin
    case Align of
      alTop: Result := ahpTop;
      alBottom: Result := ahpBottom;
      alLeft: Result := ahpLeft;
      alRight: Result := ahpRight;
    else
      if AControl.Width > AControl.Height then
        Result := ahpTop
      else Result := ahpLeft;
    end;
  end
  else Result := inherited GetControlAutoHidePosition(AControl);
end;

procedure TdxDockSite.RegisterAutoHideDockControl(AControl: TdxCustomDockControl;
  APosition: TdxAutoHidePosition);
var
  AHideBar: TdxDockSiteHideBar;
begin
  NCChanged;
  ImmediatelyHide;
  AHideBar := GetHideBarByPosition(APosition);
  if AHideBar <> nil then
  begin
    FMovingControlHideBar := AHideBar;
    FMovingControl := AControl;
    try
      AHideBar.RegisterDockControl(AControl);
      if Controller.ActiveDockControl = AControl then
        Controller.ActiveDockControl := nil;
    finally
      FMovingControl := nil;
      FMovingControlHideBar := nil;
    end;
  end;
end;

procedure TdxDockSite.UnregisterAutoHideDockControl(AControl: TdxCustomDockControl);
var
  AHideBar: TdxDockSiteHideBar;
begin
  NCChanged;
  ImmediatelyHide;
  AHideBar := GetHideBarByControl(AControl);
  if AHideBar <> nil then
  begin
    FMovingControlHideBar := AHideBar;
    FMovingControl := AControl;
    Assert(MovingContainer <> nil, sdxInternalErrorAutoHide);
    try
      AHideBar.UnregisterDockControl(AControl);
    finally
      FMovingControl := nil;
      FMovingControlHideBar := nil;
    end;
  end;
end;

procedure TdxDockSite.AdjustAutoSizeBounds;
begin
  if not AutoSize and (Align <> alClient) then exit;
  if ChildCount > 0 then
    SetBounds(Left, Top, FAutoSizeWidth, FAutoSizeHeight)
  else SetBounds(Left, Top, FOriginalWidth, FOriginalHeight);
  BringToFront;
end;

function TdxDockSite.CanAutoSizeChange: Boolean;
begin
  Result := FAutoSize or (ChildCount = 0) or IsLoading;
end;

function TdxDockSite.GetAutoSizeClientControl: TdxCustomDockControl;
begin
  if AutoSize and (ChildCount > 1) and Children[0].CanDock then
    Result := Children[0]
  else if AutoSize and (ChildCount > 1) and Children[1].CanDock then
    Result := Children[1]
  else if AutoSize and (ChildCount > 0) and Children[0].CanDock then
    Result := Children[0]
  else Result := nil
end;

procedure TdxDockSite.UpdateAutoSizeBounds(AWidth, AHeight: Integer);
begin
  if not AutoSize then exit;
  FAutoSizeHeight := AHeight;
  FAutoSizeWidth := AWidth;
end;

procedure ShowMovementTimerProc(Wnd: HWnd; Msg, TimerID, SysTime: Longint); stdcall;
var
  AControl: TdxDockSite;
begin
  AControl := TdxDockSite(FindControl(Wnd));
  if AControl <> nil then
    AControl.DoShowMovement;
end;

procedure TdxDockSite.DoHideControl(AControl: TdxCustomDockControl);
begin
  if Assigned(FOnHideControl) then
    FOnHideControl(Self, AControl);
end;

procedure TdxDockSite.DoShowControl(AControl: TdxCustomDockControl);
begin
  if Assigned(FOnShowControl) then
    FOnShowControl(Self, AControl);
end;

procedure TdxDockSite.DoShowMovement;
begin
  MovingControlHideBar.UpdatePosition(dxAutoHideMovingSize);
  if MovingControlHideBar.CheckShowingFinish then
  begin
    if FMovingTimerID > -1 then
    begin
      KillTimer(Handle, FMovingTimerID);
      FMovingTimerID := -1;
    end;
    FMovingControlHideBar := nil;
    FShowingControl := FMovingControl;
    FMovingControl := nil;
    InitializeHiding;
  end
  else if FMovingTimerID < 0 then
    FMovingTimerID := SetTimer(Handle, 1, dxAutoHideMovingInterval, @ShowMovementTimerProc)
end;

procedure HideMovementTimerProc(Wnd: HWnd; Msg, TimerID, SysTime: Longint); stdcall;
var
  AControl: TdxDockSite;
begin
  AControl := TdxDockSite(FindControl(Wnd));
  if AControl <> nil then
    AControl.DoHideMovement;
end;

procedure TdxDockSite.DoHideMovement;
begin
  MovingControlHideBar.UpdatePosition(- dxAutoHideMovingSize);
  if MovingControlHideBar.CheckHidingFinish then
  begin
    DoHideControl(FMovingControl);
    if FMovingTimerID > -1 then
    begin
      KillTimer(Handle, FMovingTimerID);
      FMovingTimerID := -1;
    end;
    Assert(MovingContainer <> nil, sdxInternalErrorAutoHide);
    MovingContainer.Visible := False;
    MovingControl.SetVisibility(False);
    FMovingControlHideBar := nil;
    FMovingControl := nil;
    FShowingControl := nil;
    FinalizeHiding;
  end
  else if FMovingTimerID < 0 then
    FMovingTimerID := SetTimer(Handle, 1, dxAutoHideMovingInterval, @HideMovementTimerProc)
end;

procedure TdxDockSite.ImmediatelyHide;
begin
  if ShowingControl <> nil then
  begin
    DoHideControl(ShowingControl);
    ShowingControl.AutoHideContainer.Visible := False;
    ShowingControl.SetVisibility(False);
    if Controller.ActiveDockControl = ShowingControl then
      Controller.ActiveDockControl := nil;
    FShowingControl := nil;
    FinalizeHiding;
  end;
  FMovingControl := nil;
  FMovingControlHideBar := nil;
  if FMovingTimerID > -1 then
  begin
    KillTimer(Handle, FMovingTimerID);
    FMovingTimerID := -1;
  end;
end;

procedure TdxDockSite.ImmediatelyShow(AControl: TdxCustomDockControl);
var
  AHideBar: TdxDockSiteHideBar;
begin
  if MovingControl <> nil then exit;
  if ShowingControl <> AControl then
  begin
    ImmediatelyHide;
    AHideBar := GetHideBarByControl(AControl);
    if AHideBar <> nil then
    begin
      FShowingControl := AControl;
      AHideBar.SetFinalPosition(AControl);
      AControl.AutoHideContainer.Visible := True;
      AControl.SetVisibility(True);
      AControl.AutoHideContainer.BringToFront;
      DoShowControl(AControl);
      InitializeHiding;
    end;
  end;
end;

procedure AutoHideTimerProc(Wnd: HWnd; Msg, TimerID, SysTime: Longint); stdcall;
var
  AControl: TdxDockSite;
begin
  AControl := TdxDockSite(FindControl(Wnd));
  if (AControl <> nil) and (AControl.ShowingControl <> nil) then
    AControl.FinalizeHiding
  else KillTimer(Wnd, TimerID);
end;

procedure TdxDockSite.InitializeHiding;
begin
  if FHidingTimerID > -1 then
  begin
    KillTimer(Handle, FHidingTimerID);
    FHidingTimerID := -1;
  end;
  if not IsDestroying and (FHidingTimerID = -1) and (ShowingControl <> nil) then
    FHidingTimerID := SetTimer(Handle, 2, dxAutoHideInterval, @AutoHideTimerProc)
end;

procedure AutoShowTimerProc(Wnd: HWnd; Msg, TimerID, SysTime: Longint); stdcall;
var
  AControl: TdxDockSite;
begin
  AControl := TdxDockSite(FindControl(Wnd));
  if AControl <> nil then
    AControl.FinalizeShowing
  else KillTimer(Wnd, TimerID);
end;

procedure TdxDockSite.InitializeShowing;
begin
  if not IsDestroying and (FShowingTimerID = -1) then
    FShowingTimerID := SetTimer(Handle, 3, dxAutoShowInterval, @AutoShowTimerProc)
end;

procedure TdxDockSite.FinalizeHiding;
var
  pt: TPoint;
  AControl: TdxCustomDockControl;
begin
  if Controller.IsDocking or Controller.IsResizing then exit;
  if MovingControl <> nil then exit;
  if ShowingControl <> nil then
  begin
    GetCursorPos(pt);
    AControl := Controller.GetDockControlAtPos(pt);
    if not (((AControl = Self) and (GetHideBarAtPos(ScreenToClient(pt)) <> nil)) or
      ((AControl <> nil) and (AControl.AutoHideControl = ShowingControl)) or
      ((Controller.ActiveDockControl <> nil) and
      (Controller.ActiveDockControl.AutoHideControl = ShowingControl))) then
      ShowingControl := nil;
  end
  else if FHidingTimerID > -1 then
  begin
    KillTimer(Handle, FHidingTimerID);
    FHidingTimerID := -1;
  end;
end;

procedure TdxDockSite.FinalizeShowing;
var
  pt: TPoint;
  AControl, ASubControl: TdxCustomDockControl;
begin
  if FShowingTimerID > -1 then
  begin
    KillTimer(Handle, FShowingTimerID);
    FShowingTimerID := -1;
  end;
  GetCursorPos(pt);
  ASubControl := nil;
  AControl := GetControlAtPos(ScreenToClient(pt), ASubControl);
  if (FShowingControlCandidate <> nil) and (FShowingControlCandidate = AControl) then
  begin
    if (ASubControl <> nil) and (AControl is TdxTabContainerDockSite) then
    begin
      if ASubControl <> (AControl as TdxTabContainerDockSite).ActiveChild then
      begin
        ImmediatelyHide;
        (AControl as TdxTabContainerDockSite).ActiveChild := ASubControl;
      end;
      ShowingControl := AControl;
    end
    else if (AControl <> nil) then
      ShowingControl := AControl;
  end;
end;

procedure TdxDockSite.SetFinalPosition(AControl: TdxCustomDockControl);
var
  AHideBar: TdxDockSiteHideBar;
begin
  AHideBar := GetHideBarByControl(AControl);
  if AHideBar <> nil then
    AHideBar.SetFinalPosition(AControl);
end;

procedure TdxDockSite.SetInitialPosition(AControl: TdxCustomDockControl);
var
  AHideBar: TdxDockSiteHideBar;
begin
  AHideBar := GetHideBarByControl(AControl);
  if AHideBar <> nil then
    AHideBar.SetInitialPosition(AControl);
end;

function TdxDockSite.GetClientLeft: Integer;
begin
  Result := ClientOrigin.X - Parent.ClientOrigin.X;
end;

function TdxDockSite.GetClientTop: Integer;
begin
  Result := ClientOrigin.Y - Parent.ClientOrigin.Y;
end;

function TdxDockSite.GetClientWidth: Integer;
begin
  Result := ClientWidth;
end;

function TdxDockSite.GetClientHeight: Integer;
begin
  Result := ClientHeight;
end;

procedure TdxDockSite.ReadState(Reader: TReader);
begin
  inherited;
  UpdateLayout;
end;

procedure TdxDockSite.SetAutoSize(Value: Boolean);
begin
  if (FAutoSize <> Value) and CanAutoSizeChange then
  begin
    FAutoSize := Value;
    if not IsLoading then
    begin
      AdjustAutoSizeBounds;
      UpdateLayout;
    end;
  end;
end;

procedure TdxDockSite.SetParent(AParent: TWinControl);
begin
  if (AParent is TdxCustomDockControl) then
    raise Exception.Create(sdxInvalidDockSiteParent)
  else inherited SetParent(AParent);
end;

procedure TdxDockSite.ValidateInsert(AComponent: TComponent);
begin
  if not ((AComponent is TdxCustomDockControl) or (AComponent is TdxDockSiteAutoHideContainer)) then
  begin
    if AComponent is TControl then
      (AComponent as TControl).Parent := ParentForm;
    raise Exception.CreateFmt(sdxInvalidSiteChild, [AComponent.ClassName]);
  end;
end;

procedure TdxDockSite.UpdateControlResizeZones(AControl: TdxCustomDockControl);
begin
  if AutoSize and (AControl <> Self) then
  begin
    if TdxAutoSizeRightZone.ValidateResizeZone(Self, AControl) then
      AControl.ResizeZones.Insert(0, TdxAutoSizeRightZone.Create(Self, dxResizeZoneWidth));
    if TdxAutoSizeLeftZone.ValidateResizeZone(Self, AControl) then
      AControl.ResizeZones.Insert(0, TdxAutoSizeLeftZone.Create(Self, dxResizeZoneWidth));
    if TdxAutoSizeBottomZone.ValidateResizeZone(Self, AControl) then
      AControl.ResizeZones.Insert(0, TdxAutoSizeBottomZone.Create(Self, dxResizeZoneWidth));
    if TdxAutoSizeTopZone.ValidateResizeZone(Self, AControl) then
      AControl.ResizeZones.Insert(0, TdxAutoSizeTopZone.Create(Self, dxResizeZoneWidth));
  end
  else inherited UpdateControlResizeZones(AControl);
end;

procedure TdxDockSite.UpdateControlDockZones(AControl: TdxCustomDockControl; AZoneWidth: Integer);
begin
  if AutoSize then
  begin
    if TdxAutoSizeClientZone.ValidateDockZone(Self, AControl) then
      AControl.DockZones.Insert(0, TdxAutoSizeClientZone.Create(Self, AZoneWidth));
  end
  else
  begin
    if TdxClientZone.ValidateDockZone(Self, AControl) then
      AControl.DockZones.Insert(0, TdxClientZone.Create(Self, AZoneWidth));
    inherited;
  end;
end;

procedure TdxDockSite.CreateLayout(AControl: TdxCustomDockControl; AType: TdxDockingType;
  Index: Integer);
begin
  UpdateAutoSizeBounds(AControl.Width, AControl.Height);
  inherited;
  AdjustAutoSizeBounds;
end;

procedure TdxDockSite.DestroyLayout(AControl: TdxCustomDockControl);
begin
  inherited;
  AdjustAutoSizeBounds;
end;

procedure TdxDockSite.LoadLayoutFromCustomIni(AIniFlie: TCustomIniFile;
  AParentControl: TdxCustomDockControl; ASection: string);
var
  I, AChildCount: Integer;
  AChildSection: string;
begin
  BeginUpdateLayout;
  try
    with AIniFlie do
    begin
      AChildCount := ReadInteger(ASection, 'ChildCount', 0);
      for I := 0 to AChildCount - 1 do
      begin
        AChildSection := ReadString(ASection, 'Children' + IntToStr(I), '');
        Controller.LoadControlFromCustomIni(AIniFlie, Self, AChildSection);
      end;
    end;
  finally
    EndUpdateLayout;
  end;
end;

procedure TdxDockSite.SaveLayoutToCustomIni(AIniFlie: TCustomIniFile; ASection: string);
var
  I: Integer;
begin
  with AIniFlie do
  begin
    WriteInteger(ASection, 'ChildCount', ChildCount);
    for I := 0 to ChildCount - 1 do
      WriteString(ASection, 'Children' + IntToStr(I), IntToStr(Controller.IndexOfDockControl(Children[I])));
  end;
  for I := 0 to ChildCount - 1 do
    Controller.SaveControlToCustomIni(AIniFlie, Children[I]);
end;

procedure TdxDockSite.ChildVisibilityChanged(Sender: TdxCustomDockControl);
var
  AHideBar: TdxDockSiteHideBar;
begin
  if (AutoSizeClientControl = Sender) then
  begin
    if Sender.Visible and not Sender.AutoHide then
      UpdateAutoSizeBounds(Sender.OriginalWidth, Sender.OriginalHeight)
    else if not Sender.Visible and not Sender.AutoHide then
      UpdateAutoSizeBounds(FOriginalWidth, FOriginalHeight)
    else if Sender.AutoHide then
    begin
      AHideBar := GetHideBarByControl(Sender);
      if AHideBar <> nil then
        AHideBar.UpdateOwnerAutoSizeBounds(Sender);
    end;
    AdjustAutoSizeBounds;
  end;
end;

procedure TdxDockSite.UpdateControlOriginalSize(AControl: TdxCustomDockControl);
begin
  if not AutoSize and (AControl <> Self) then
    inherited
  else if (AControl <> Self) and (AControl.UpdateVisibilityLock = 0) then
  begin
    case Align of
      alLeft, alRight: AControl.FOriginalWidth := Width;
      alTop, alBottom: AControl.FOriginalHeight := Height;
    end;
  end
  else if not AutoSize or (ChildCount = 0) then
  begin
    AControl.FOriginalWidth := Width;
    AControl.FOriginalHeight := Height;
  end;
end;

procedure TdxDockSite.CalculateNC(var ARect: TRect);
var
  I: Integer;
begin
  inherited;
  for I := 0 to HideBarCount - 1 do
    HideBars[I].Calculate(ARect);

  ARect.Left := ARect.Left + (LeftHideBar.Rect.Right - LeftHideBar.Rect.Left);
  ARect.Right := ARect.Right - (RightHideBar.Rect.Right - RightHideBar.Rect.Left);
  ARect.Top := ARect.Top + (TopHideBar.Rect.Bottom - TopHideBar.Rect.Top);
  ARect.Bottom := ARect.Bottom - (BottomHideBar.Rect.Bottom - BottomHideBar.Rect.Top);
end;

procedure TdxDockSite.NCPaint(ACanvas: TCanvas);
var
  I, J: Integer;
begin
  for I := 0 to HideBarCount - 1 do
    if HideBars[I].Visible then
    begin
      Painter.DrawHideBar(ACanvas, HideBars[I].Rect, HideBars[I].Position);
      for J := 0 to HideBars[I].ButtonRectCount - 1 do
        Painter.DrawHideBarButton(ACanvas, HideBars[I].DockControls[J],
          HideBars[I].ButtonsRects[J], HideBars[I].Position);
    end;
end;

function TdxDockSite.GetHideBarCount: Integer;
begin
  Result := FHideBars.Count;
end;

function TdxDockSite.GetHideBar(Index: Integer): TdxDockSiteHideBar;
begin
  if (0 <= Index) and (Index < FHideBars.Count) then
    Result := TdxDockSiteHideBar(FHideBars[Index])
  else Result := nil;
end;

function TdxDockSite.GetMovingContainer: TdxDockSiteAutoHideContainer;
begin
  if FMovingControl <> nil then
    Result := FMovingControl.AutoHideContainer
  else Result := nil;
end;

procedure TdxDockSite.SetShowingControl(Value: TdxCustomDockControl);
var
  AHideBar: TdxDockSiteHideBar;
begin
  if (FShowingControl <> Value) and (MovingControl = nil) then
  begin
    if Value <> nil then
    begin
      ImmediatelyHide;
      AHideBar := GetHideBarByControl(Value);
      if AHideBar <> nil then
      begin
        FMovingControlHideBar := AHideBar;
        FMovingControl := Value;
        Assert(MovingContainer <> nil, sdxInternalErrorAutoHide);
        MovingControlHideBar.SetInitialPosition(Value);
        MovingContainer.Visible := True;
        MovingControl.SetVisibility(True);
        MovingContainer.BringToFront;
        DoShowControl(Value);
        DoShowMovement;
      end;
    end
    else
    begin
      AHideBar := GetHideBarByControl(FShowingControl);
      if AHideBar <> nil then
      begin
        FMovingControlHideBar := AHideBar;
        FMovingControl := FShowingControl;
        Assert(MovingContainer <> nil, sdxInternalErrorAutoHide);
        DoHideMovement;
      end;
    end;
  end;
end;

procedure TdxDockSite.CMDesignHitTest(var Message: TCMDesignHitTest);
var
  pt: TPoint;
begin
  inherited;
  pt := Point(Message.XPos, Message.YPos);
  if GetHideBarAtPos(pt) <> nil then
    Message.Result := 1;
end;

procedure TdxDockSite.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  if ShowingControl <> nil then InitializeHiding;
end;

procedure TdxDockSite.WMLButtonDown(var Message: TWMLButtonDown);
var
  AControl, ASubControl: TdxCustomDockControl;
begin
  inherited;
  if Message.Result = 0 then
  begin
    AControl := GetControlAtPos(SourcePoint, ASubControl);
    if AControl <> nil then
    begin
      Controller.ActiveDockControl := AControl;
      Message.Result := 1;
    end;
  end
end;

procedure TdxDockSite.WMMouseMove(var Message: TWMMouseMove);
var
  ASubControl: TdxCustomDockControl;
begin
  inherited;
  if (Message.Result = 0) and (ParentFormActive or IsDesigning) then
  begin
    FShowingControlCandidate := GetControlAtPos(CursorPoint, ASubControl);
    if FShowingControlCandidate <> nil then
      InitializeShowing;
    Message.Result := 1;
  end;
end;

{ TdxFloatDockSite }

constructor TdxFloatDockSite.Create(AOwner: TComponent);
begin
  inherited;
  CreateFloatForm;
end;

destructor TdxFloatDockSite.Destroy;
begin
  DestroyFloatForm;
  inherited;
end;

procedure TdxFloatDockSite.BeforeDestruction;
begin
  if not CanDestroy then
    raise Exception.Create(sdxInvalidFloatSiteDeleting);
  inherited;
end;

procedure TdxFloatDockSite.HideFloatForm;
begin
  if FloatForm <> nil then
  begin
    FloatForm.Hide;
    FloatForm.SetDesigning(False);
  end;
end;

procedure TdxFloatDockSite.ShowFloatForm;
begin                                        
  if (FloatForm <> nil) and Visible and (ParentForm.Visible or
    (fsVisible in ParentForm.FormState) or IsDesigning) then
  begin
    FloatForm.Show;
    FloatForm.SetDesigning(IsDesigning);
    FFloatLeft := FloatForm.Left;
    FFloatTop := FloatForm.Top;
  end;
end;

procedure TdxFloatDockSite.SetFloatFormPosition(ALeft, ATop: Integer);
begin
  if FloatForm <> nil then
    FloatForm.SetBounds(ALeft, ATop, FloatForm.Width, FloatForm.Height);
end;

procedure TdxFloatDockSite.SetFloatFormSize(AWidth, AHeight: Integer);
begin
  if FloatForm = nil then exit;
  if FloatForm.HandleAllocated then
  begin
    FloatForm.ClientWidth := AWidth;
    FloatForm.ClientHeight := AHeight;
  end
  else FloatForm.SetBounds(FloatForm.Left, FloatForm.Top, AWidth, AHeight);
end;

function TdxFloatDockSite.HasParent: Boolean;
begin
  Result := False;
end;

procedure TdxFloatDockSite.Loaded;
begin
  inherited;
  CreateFloatForm;
  UpdateCaption;
  ShowFloatForm;
  SetFloatFormSize(OriginalWidth, OriginalHeight);
end;

procedure TdxFloatDockSite.SetParent(AParent: TWinControl);
begin
  if (UpdateLayoutLock = 0) and not IsDestroying and not IsLoading then
    raise Exception.Create(sdxInvalidParentAssigning)
  else if (AParent <> nil) and not (AParent is TCustomForm) then
    raise Exception.Create(sdxInvalidFloatSiteParent)
  else inherited SetParent(AParent);
end;

procedure TdxFloatDockSite.StartDocking(pt: TPoint);
begin
  Child.StartDocking(pt);
end;

procedure TdxFloatDockSite.CheckDockClientsRules;
begin
end;

procedure TdxFloatDockSite.AdjustControlBounds(AControl: TdxCustomDockControl);
begin
  if FloatForm <> nil then
    SetFloatFormSize(AControl.OriginalWidth, AControl.OriginalHeight)
  else inherited;
end;

procedure TdxFloatDockSite.UpdateControlOriginalSize(AControl: TdxCustomDockControl);
begin
  if not FloatFormVisible then exit;
  AControl.FOriginalHeight := Height;
  AControl.FOriginalWidth := Width;
end;

procedure TdxFloatDockSite.UpdateFloatPosition;
begin
  if FloatFormVisible then
  begin
    FFloatLeft := FloatForm.Left;
    FFloatTop := FloatForm.Top;
    Modified;
  end;
end;

procedure TdxFloatDockSite.ChildVisibilityChanged(Sender: TdxCustomDockControl);
begin
  if Sender = Child then
  begin
    Visible := Sender.Visible;
    FloatForm.Visible := Sender.Visible;
  end;
end;

procedure TdxFloatDockSite.Activate;
begin
  if Child <> nil then
    Child.Activate;
end;

procedure TdxFloatDockSite.DoClose;
begin
  if Child <> nil then
    Child.DoClose;
end;

function TdxFloatDockSite.CanDestroy: Boolean;
begin
  Result := (Child = nil) or Child.IsDestroying;
end;

function TdxFloatDockSite.CanDockHost(AControl: TdxCustomDockControl; AType: TdxDockingType): Boolean;
begin
  Result := False;
end;

procedure TdxFloatDockSite.CreateLayout(AControl: TdxCustomDockControl;
  AType: TdxDockingType; Index: Integer);
begin
  Assert(ChildCount = 0, Format(sdxInternalErrorCreateLayout, [ClassName]));
  AControl.IncludeToDock(Self, AType, 0);
end;

procedure TdxFloatDockSite.DestroyLayout(AControl: TdxCustomDockControl);
begin
  Assert(ChildCount = 1, Format(sdxInternalErrorDestroyLayout, [ClassName]));
  AControl.ExcludeFromDock;
  if not IsDestroying then DoDestroy;
end;

procedure TdxFloatDockSite.LoadLayoutFromCustomIni(AIniFlie: TCustomIniFile;
  AParentControl: TdxCustomDockControl; ASection: string);
begin
  inherited;
  with AIniFlie do
  begin
    FloatLeft := ReadInteger(ASection, 'FloatLeft', FloatLeft);
    FloatTop := ReadInteger(ASection, 'FloatTop', FloatTop);
    FOriginalWidth := ReadInteger(ASection, 'Width', Width);
    FOriginalHeight := ReadInteger(ASection, 'Height', Height);
  end;
  CreateFloatForm;
  UpdateCaption;
  ShowFloatForm;
  SetFloatFormSize(OriginalWidth, OriginalHeight);
end;

procedure TdxFloatDockSite.SaveLayoutToCustomIni(AIniFlie: TCustomIniFile;
  ASection: string);
begin
  inherited;
  with AIniFlie do
  begin
    WriteInteger(ASection, 'FloatLeft', FloatLeft);
    WriteInteger(ASection, 'FloatTop', FloatTop);
  end;
end;

procedure TdxFloatDockSite.DoSetFloatFormCaption;
begin
  if Assigned(FOnSetFloatFormCaption) then
    FOnSetFloatFormCaption(Self, FloatForm);
  Controller.DoSetFloatFormCaption(Self, FloatForm);
end;

procedure TdxFloatDockSite.UpdateCaption;
begin
  if (Child <> nil) and (FloatForm <> nil) then
    FloatForm.Caption := Child.Caption;
  DoSetFloatFormCaption;
end;

function TdxFloatDockSite.GetFloatForm: TdxFloatForm;
begin
  Result := FFloatForm;
end;

procedure TdxFloatDockSite.RestoreDockPosition(pt: TPoint);
begin
  if (Child <> nil) and Child.Dockable then
    Child.RestoreDockPosition(pt);
end;

procedure TdxFloatDockSite.CreateFloatForm;
var
  AWidth, AHeight: Integer;
begin
  BeginUpdateLayout;
  try
    AWidth := OriginalWidth;
    AHeight := OriginalHeight;
    if FFloatForm = nil then
      FFloatForm := TdxFloatForm.Create(Application);
    FFloatForm.InsertDockSite(Self);
    SetFloatFormPosition(FloatLeft, FloatTop);
    SetFloatFormSize(AWidth, AHeight);
    if (doFloatingOnTop in Controller.Options) or IsDesigning then
      FFloatForm.SendOnTopMost;
  finally
    EndUpdateLayout;
  end;
end;

procedure TdxFloatDockSite.DestroyFloatForm;
begin
  if FFloatForm = nil then exit;
  BeginUpdateLayout;
  try
    if not FFloatForm.IsDestroying then
      FFloatForm.Free;
  finally
    EndUpdateLayout;
  end;
end;

function TdxFloatDockSite.GetChild: TdxCustomDockControl;
begin
  if ChildCount = 1 then
    Result := Children[0]
  else Result := nil;
end;

procedure TdxFloatDockSite.SetFloatLeft(const Value: Integer);
begin
  if FFloatLeft <> Value then
  begin
    FFloatLeft := Value;
    if FloatForm <> nil then
      FloatForm.Left := Value;
  end;
end;

procedure TdxFloatDockSite.SetFloatTop(const Value: Integer);
begin
  if FFloatTop <> Value then
  begin
    FFloatTop := Value;
    if FloatForm <> nil then
      FloatForm.Top := Value;
  end;
end;

procedure TdxFloatDockSite.WMNCHitTest(var Message: TWMNCHitTest);
begin
  Message.Result := HTTRANSPARENT;
end;

{ TdxFloatForm }

constructor TdxFloatForm.Create(AOwner: TComponent);
begin
  CreateNew(AOwner);
  AutoScroll := False;
  BorderStyle := bsSizeToolWin;
  DefaultMonitor := dmDesktop;
  Visible := False;
end;

destructor TdxFloatForm.Destroy;
begin
  RemoveDockSite;
  inherited;
end;

procedure TdxFloatForm.InsertDockSite(ADockSite: TdxFloatDockSite);
begin
  FDockSite := ADockSite;
  FDockSite.SetDockType(dtClient);
  FDockSite.Parent := Self;
  FCanDesigning := True;
end;

procedure TdxFloatForm.RemoveDockSite;
begin
  FCanDesigning := False;
  if FDockSite <> nil then
  begin
    FDockSite.Parent := nil;
    FDockSite.FFloatForm := nil;
    FDockSite := nil;
  end;
end;

procedure TdxFloatForm.SendOnTop;
begin
  FOnTopMost := False;
  RecreateWnd;
end;

procedure TdxFloatForm.SendOnTopMost;
begin
  FOnTopMost := True;
  RecreateWnd;
end;

function TdxFloatForm.CanDesigning: Boolean;
begin
  Result := FCanDesigning and IsDesigning and not IsDestroying and
    (ParentForm <> nil) and (ParentForm.Designer <> nil) and
    not dxDockingController.IsDocking;
end;

function TdxFloatForm.IsDesigning: Boolean;
begin
  Result := csDesigning in ComponentState;
end;

function TdxFloatForm.IsDestroying: Boolean;
begin
  Result := csDestroying in ComponentState;
end;

procedure TdxFloatForm.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  if FOnTopMost then
    with Params do
    begin
      Style := Style or WS_POPUPWINDOW;
      WndParent := ParentForm.Handle;
    end;
end;

function TdxFloatForm.IsShortCut(var Message: TWMKey): Boolean;
begin
  Result := inherited IsShortCut(Message);
  if not Result and (ParentForm <> nil) then
    Result := ParentForm.IsShortCut(Message);
end;

{$IFDEF DELPHI6}
procedure TdxFloatForm.WndProc(var Message: TMessage);
var
  ADesigner: IDesignerHook;
begin
  if IsDesigning then
  begin
    if Designer <> nil then
      ADesigner := Designer
    else if CanDesigning then
      ADesigner := ParentForm.Designer
    else ADesigner := nil;
    if Designer <> nil then
      Designer := nil;
    inherited WndProc(Message);
    if (ADesigner <> nil) and CanDesigning then
      Designer := ADesigner;
  end
  else inherited WndProc(Message);
end;
{$ENDIF}

function TdxFloatForm.GetParentForm: TCustomForm;
begin
  if (FDockSite <> nil) and not FDockSite.IsDestroying then
    Result := FDockSite.ParentForm
  else Result := nil;
end;

procedure TdxFloatForm.WMHideForm(var Message: TWMClose);
begin
  Hide;
end;

procedure TdxFloatForm.WMShowForm(var Message: TWMClose);
begin
  Show;
end;

procedure TdxFloatForm.WMClose(var Message: TWMClose);
begin
  if (DockSite <> nil) and not DockSite.IsDesigning then
    DockSite.DoClose;
end;

procedure TdxFloatForm.WMMove(var Message: TWMMove);
begin
  inherited;
  if DockSite <> nil then
    DockSite.UpdateFloatPosition;
end;

procedure TdxFloatForm.WMSize(var Message: TWMSize);
begin
  inherited;
  if DockSite <> nil then
    DockSite.Modified;
end;

procedure TdxFloatForm.WMMouseActivate(var Message: TWMMouseActivate);
begin
  inherited;
  if DockSite <> nil then
    DockSite.Activate;
end;

procedure TdxFloatForm.WMNCLButtonDown(var Message: TWMNCLButtonDown);
begin
  if (Message.HitTest = HTCAPTION) and not IsIconic(Handle) and (DockSite <> nil) then
  begin
    SendMessage(DockSite.Handle, WM_MOUSEACTIVATE, 0, 0);
    SetWindowPos(Handle, 0, 0, 0, 0, 0, SWP_NOZORDER or SWP_NOMOVE or SWP_NOSIZE);
    SendMessage(Handle, WM_NCLBUTTONUP, TMessage(Message).WParam, TMessage(Message).LParam);
    FCaptionIsDown := True;
    FCaptionPoint := Point(Message.XCursor, Message.YCursor);
  end
  else inherited;
end;

procedure TdxFloatForm.WMNCLButtonUp(var Message: TWMNCLButtonUp);
begin
  FCaptionIsDown := False;
  inherited;
end;

procedure TdxFloatForm.WMNCLButtonDblClk(var Message: TWMNCMButtonDblClk);
begin
  if not IsDesigning and (Message.HitTest = HTCAPTION) and not IsIconic(Handle) and
    (DockSite <> nil) then DockSite.RestoreDockPosition(Point(Message.XCursor, Message.YCursor))
  else inherited;
end;

procedure TdxFloatForm.WMNCMouseMove(var Message: TWMNCMouseMove);
begin
  if FCaptionIsDown and ((FCaptionPoint.X <> Message.XCursor) or
    (FCaptionPoint.Y <> Message.YCursor)) then
  begin
    FCaptionIsDown := False;
    DockSite.StartDocking(Point(Message.XCursor, Message.YCursor));
  end
  else inherited;
end;

{ TdxDockControlPainter }

constructor TdxDockControlPainter.Create(ADockControl: TdxCustomDockControl);
begin
  FDockControl := ADockControl;
end;

function TdxDockControlPainter.CanVerticalCaption: Boolean;
begin
  Result := True;
end;

function TdxDockControlPainter.GetBorderWidth: Integer;
begin
  Result := 2;
end;

function TdxDockControlPainter.GetCaptionButtonSize: Integer;
begin
  Result := 12;
end;

function TdxDockControlPainter.GetCaptionHeight: Integer;
begin
  Result := 16;
end;

function TdxDockControlPainter.GetCaptionHorizInterval: Integer;
begin
  Result := 2;
end;

function TdxDockControlPainter.GetCaptionVertInterval: Integer;
begin
  Result := 2;
end;

function TdxDockControlPainter.GetDefaultImageHeight: Integer;
begin
  if DockControl.Images <> nil then
    Result := DockControl.Images.Height
  else Result := dxDefaultImageHeight;
end;

function TdxDockControlPainter.GetDefaultImageWidth: Integer;
begin
  if DockControl.Images <> nil then
    Result := DockControl.Images.Width
  else Result := dxDefaultImageWidth;
end;

function TdxDockControlPainter.GetImageHeight: Integer;
begin
  if DockControl.Images <> nil then
    Result := DockControl.Images.Height
  else Result := 0;
end;

function TdxDockControlPainter.GetImageWidth: Integer;
begin
  if DockControl.Images <> nil then
    Result := DockControl.Images.Width
  else Result := 0;
end;

function TdxDockControlPainter.IsValidImageIndex(AIndex: Integer): Boolean;
begin
  Result := (DockControl.Images <> nil) and (0 <= AIndex) and (AIndex < DockControl.Images.Count);
end;

function TdxDockControlPainter.GetHideBarHeight: Integer;
begin
  Result := 10 + GetFont.Size + 10;
  if Result < GetHideBarVertInterval + 2 + GetImageHeight + 2 + GetHideBarVertInterval then
    Result := GetHideBarVertInterval + 2 + GetImageHeight + 2 + GetHideBarVertInterval;
end;

function TdxDockControlPainter.GetHideBarWidth: Integer;
begin
  Result := 10 + GetFont.Size + 10;
  if Result < GetHideBarVertInterval + 2 + GetImageWidth + 2 + GetHideBarVertInterval then
    Result := GetHideBarVertInterval + 2 + GetImageWidth + 2 + GetHideBarVertInterval;
end;

function TdxDockControlPainter.GetHideBarVertInterval: Integer;
begin
  Result := 2;
end;

function TdxDockControlPainter.GetHideBarHorizInterval: Integer;
begin
  Result := 4;
end;

function TdxDockControlPainter.GetTabVertInterval: Integer;
begin
  Result := 2;
end;

function TdxDockControlPainter.GetTabHorizInterval: Integer;
begin
  Result := 4;
end;

function TdxDockControlPainter.GetTabsButtonSize: Integer;
begin
  Result := 16;
end;

function TdxDockControlPainter.GetTabsHeight: Integer;
begin
  Result := 10 + GetFont.Size + 12;
  if Result < GetTabVertInterval + 4 + GetImageHeight + 4 + GetTabVertInterval then
    Result := GetTabVertInterval + 4 + GetImageHeight + 4 + GetTabVertInterval;
end;

procedure TdxDockControlPainter.DrawBorder(ACanvas: TCanvas; ARect: TRect);
begin
  ACanvas.Brush.Color := ColorToRGB(GetBorderColor);
  ACanvas.Brush.Style := bsSolid;
  with ARect do
  begin
    ACanvas.FillRect(Rect(Left, Top, Left + GetBorderWidth, Bottom));
    ACanvas.FillRect(Rect(Left, Bottom - GetBorderWidth, Right, Bottom));
    ACanvas.FillRect(Rect(Right - GetBorderWidth, Top, Left + Right, Bottom));
    ACanvas.FillRect(Rect(Left, Top, Right, Top + GetBorderWidth));
  end;
  DrawColorEdge(ACanvas, ARect, GetColor, etRaisedOuter, [epTopLeft]);
  DrawColorEdge(ACanvas, ARect, GetColor, etRaisedInner, [epBottomRight]);
end;

procedure TdxDockControlPainter.DrawHideBar(ACanvas: TCanvas; ARect: TRect;
  APosition: TdxAutoHidePosition);
begin
  Assert(AutoHideHostSite <> nil, sdxInternalErrorPainter);
  ACanvas.Brush.Color := ColorToRGB(GetHideBarColor);
  ACanvas.Brush.Style := bsSolid;
  ACanvas.FillRect(ARect);
end;

procedure TdxDockControlPainter.DrawCaption(ACanvas: TCanvas; ARect: TRect; IsActive: Boolean);
begin
  ACanvas.Brush.Color := ColorToRGB(GetCaptionColor(IsActive));
  ACanvas.Brush.Style := bsSolid;
  ACanvas.FillRect(ARect);
  ACanvas.Brush.Color := ColorToRGB(GetBorderColor);
  if DockControl.IsCaptionVertical then
  begin
    ARect.Left := ARect.Right;
    Inc(ARect.Right, GetBorderWidth)
  end
  else
  begin
    ARect.Top := ARect.Bottom;
    Inc(ARect.Bottom, GetBorderWidth);
  end;
  ACanvas.FillRect(ARect);
end;

procedure TdxDockControlPainter.DrawCaptionText(ACanvas: TCanvas; ARect: TRect; IsActive: Boolean);
var
  R: TRect;
begin
  R := ARect;
  if DockControl.IsCaptionVertical then
  begin
    if ARect.Top < ARect.Bottom then
    begin
      R.Right := ARect.Left + (ARect.Right - ARect.Left) div 2 - 1;
      R.Left := R.Right - 3;
      DrawColorEdge(ACanvas, R, GetCaptionColor(IsActive), etRaisedOuter, [epTopLeft]);
      DrawColorEdge(ACanvas, R, GetCaptionColor(IsActive), etRaisedInner, [epBottomRight]);
      R.Left := ARect.Left + (ARect.Right - ARect.Left) div 2;
      R.Right := R.Left + 3;
      DrawColorEdge(ACanvas, R, GetCaptionColor(IsActive), etRaisedOuter, [epTopLeft]);
      DrawColorEdge(ACanvas, R, GetCaptionColor(IsActive), etRaisedInner, [epBottomRight]);
    end;
  end
  else
  begin
    if ARect.Left < ARect.Right then
    begin
      R.Bottom := ARect.Top + (ARect.Bottom - ARect.Top) div 2 - 1;
      R.Top := R.Bottom - 3;
      DrawColorEdge(ACanvas, R, GetCaptionColor(IsActive), etRaisedOuter, [epTopLeft]);
      DrawColorEdge(ACanvas, R, GetCaptionColor(IsActive), etRaisedInner, [epBottomRight]);
      R.Top := ARect.Top + (ARect.Bottom - ARect.Top) div 2;
      R.Bottom := R.Top + 3;
      DrawColorEdge(ACanvas, R, GetCaptionColor(IsActive), etRaisedOuter, [epTopLeft]);
      DrawColorEdge(ACanvas, R, GetCaptionColor(IsActive), etRaisedInner, [epBottomRight]);
    end;
  end;
end;

procedure TdxDockControlPainter.DrawCaptionButtonSelection(ACanvas: TCanvas; ARect: TRect;
  IsActive, IsDown, IsHot: Boolean);
begin
  if IsDown and IsHot then
  begin
    DrawColorEdge(ACanvas, ARect, GetCaptionColor(IsActive), etSunkenOuter, [epRect]);
    InflateRect(ARect, -1, -1);
    DrawColorEdge(ACanvas, ARect, GetCaptionColor(IsActive), etSunkenInner, [epTopLeft]);
  end
  else
  begin
    DrawColorEdge(ACanvas, ARect, GetCaptionColor(IsActive), etRaisedOuter, [epRect]);
    InflateRect(ARect, -1, -1);
    DrawColorEdge(ACanvas, ARect, GetCaptionColor(IsActive), etRaisedInner, [epBottomRight]);
  end;
end;

procedure TdxDockControlPainter.DrawCaptionCloseButton(ACanvas: TCanvas; ARect: TRect;
  IsActive, IsDown, IsHot, IsSwitched: Boolean);
begin
  DrawCaptionButtonSelection(ACanvas, ARect, IsActive, IsDown, IsHot);

  if IsDown and IsHot then OffsetRect(ARect, 1, 1);
  ACanvas.Pen.Style := psSolid;
  ACanvas.Pen.Width := 1;
  ACanvas.Pen.Color := ColorToRGB(GetCaptionSignColor(IsActive, IsDown, IsHot));
  ACanvas.MoveTo(ARect.Left + 2, ARect.Top + 2);
  ACanvas.LineTo(ARect.Right - 3, ARect.Bottom - 3);
  ACanvas.MoveTo(ARect.Right - 4, ARect.Top + 2);
  ACanvas.LineTo(ARect.Left + 1, ARect.Bottom - 3);
end;

procedure TdxDockControlPainter.DrawCaptionHideButton(ACanvas: TCanvas; ARect: TRect;
  IsActive, IsDown, IsHot, IsSwitched: Boolean);
begin
  DrawCaptionButtonSelection(ACanvas, ARect, IsActive, IsDown, IsHot);

  if IsDown and IsHot then OffsetRect(ARect, 1, 1);
  ACanvas.Pen.Style := psSolid;
  ACanvas.Pen.Width := 1;
  ACanvas.Pen.Color := ColorToRGB(GetCaptionSignColor(IsActive, IsDown, IsHot));
  if IsSwitched then
  begin
    ACanvas.Rectangle(ARect.Left + 4, ARect.Top + 3, ARect.Right - 3, ARect.Bottom - 4);
    ACanvas.MoveTo(ARect.Left + 4, ARect.Top + 2);
    ACanvas.LineTo(ARect.Left + 4, ARect.Bottom - 3);
    ACanvas.MoveTo(ARect.Left + 4, ARect.Bottom - 6);
    ACanvas.LineTo(ARect.Right - 3, ARect.Bottom - 6);
    ACanvas.MoveTo(ARect.Left + 2, ARect.Top + 5);
    ACanvas.LineTo(ARect.Left + 4, ARect.Top + 5);
  end
  else
  begin
    ACanvas.Rectangle(ARect.Left + 3, ARect.Top + 2, ARect.Right - 4, ARect.Bottom - 5);
    ACanvas.MoveTo(ARect.Left + 2, ARect.Bottom - 6);
    ACanvas.LineTo(ARect.Right - 3, ARect.Bottom - 6);
    ACanvas.MoveTo(ARect.Right - 6, ARect.Top + 2);
    ACanvas.LineTo(ARect.Right - 6, ARect.Bottom - 5);
    ACanvas.MoveTo(ARect.Left + 5, ARect.Bottom - 5);
    ACanvas.LineTo(ARect.Left + 5, ARect.Bottom - 3);
  end;
end;

procedure TdxDockControlPainter.DrawCaptionMaximizeButton(ACanvas: TCanvas; ARect: TRect;
  IsActive, IsDown, IsHot, IsSwitched: Boolean);
var
  pts: array[0..2] of TPoint;
begin
  DrawCaptionButtonSelection(ACanvas, ARect, IsActive, IsDown, IsHot);

  if IsDown and IsHot then OffsetRect(ARect, 1, 1);
  ACanvas.Pen.Style := psSolid;
  ACanvas.Pen.Width := 1;
  ACanvas.Pen.Color := ColorToRGB(GetCaptionSignColor(IsActive, IsDown, IsHot));
  ACanvas.Brush.Style := bsSolid;
  ACanvas.Brush.Color := ColorToRGB(GetCaptionSignColor(IsActive, IsDown, IsHot));
  if DockControl.SideContainer is TdxVertContainerDockSite then
    if IsSwitched then
    begin
      pts[0] := Point(ARect.Right - 4, ARect.Top + 2);
      pts[1] := Point(ARect.Left + 2, ARect.Top + 2);
    end
    else
    begin
      pts[0] := Point(ARect.Right - 4, ARect.Bottom - 4);
      pts[1] := Point(ARect.Left + 2, ARect.Bottom - 4);
    end
  else
    if IsSwitched then
    begin
      pts[0] := Point(ARect.Left + 2, ARect.Top + 2);
      pts[1] := Point(ARect.Left + 2, ARect.Bottom - 4);
    end
    else
    begin
      pts[0] := Point(ARect.Right - 4, ARect.Top + 2);
      pts[1] := Point(ARect.Right - 4, ARect.Bottom - 4);
    end;
  pts[2] := Point(ARect.Left + 5, ARect.Top + 5);
  ACanvas.Polygon(pts);
end;

procedure TdxDockControlPainter.DrawClient(ACanvas: TCanvas; ARect: TRect);
begin
  ACanvas.Brush.Color := ColorToRGB(GetColor);
  ACanvas.Brush.Style := bsSolid;
  ACanvas.FillRect(ARect);
end;

procedure TdxDockControlPainter.DrawHideBarButtonContent(ACanvas: TCanvas;
  AControl: TdxCustomDockControl; ARect: TRect; APosition: TdxAutoHidePosition);
var
  I: Integer;
  R: TRect;
  AItemControl: TdxCustomDockControl;
const
  SeparatorEdges: array[TdxAutoHidePosition] of TdxEdgePositions = ([epBottom],
    [epRight], [epBottom], [epRight]);
begin
  Assert(AutoHideHostSite <> nil, sdxInternalErrorPainter);
  if AControl is TdxTabContainerDockSite then
  begin
    for I := 0 to (AControl as TdxTabContainerDockSite).ActiveChildIndex - 1 do
    begin
      AItemControl := AControl.Children[I];
      if not (AControl as TdxTabContainerDockSite).IsValidChild(AItemControl) then continue;
      R := ARect;
      if not (APosition in [ahpLeft, ahpRight]) then
        R.Right := R.Left + (GetDefaultImageWidth + 2 * GetHideBarHorizInterval)
      else R.Bottom := R.Top + (GetDefaultImageHeight + 2 * GetHideBarHorizInterval);
      if IsValidImageIndex(AItemControl.ImageIndex) then
        DrawHideBarButtonImage(ACanvas, AItemControl, R)
      else DrawHideBarButtonText(ACanvas, AItemControl, R, APosition);
      if not (APosition in [ahpLeft, ahpRight]) then
        ARect.Left := R.Right
      else ARect.Top := R.Bottom;
      if (AControl as TdxTabContainerDockSite).GetNextValidChild(AItemControl.DockIndex) <> nil then
        DrawColorEdge(ACanvas, R, GetHideBarButtonColor, etRaisedInner, SeparatorEdges[APosition]);
    end;
    for I := AControl.ChildCount - 1 downto (AControl as TdxTabContainerDockSite).ActiveChildIndex + 1 do
    begin
      AItemControl := AControl.Children[I];
      if not (AControl as TdxTabContainerDockSite).IsValidChild(AItemControl) then continue;
      R := ARect;
      if not (APosition in [ahpLeft, ahpRight]) then
        R.Left := R.Right - (GetDefaultImageWidth + 2 * GetHideBarHorizInterval)
      else R.Top := R.Bottom - (GetDefaultImageHeight + 2 * GetHideBarHorizInterval);
      if IsValidImageIndex(AItemControl.ImageIndex) then
        DrawHideBarButtonImage(ACanvas, AItemControl, R)
      else DrawHideBarButtonText(ACanvas, AItemControl, R, APosition);
      if not (APosition in [ahpLeft, ahpRight]) then
        ARect.Right := R.Left
      else ARect.Bottom := R.Top;
      if (AControl as TdxTabContainerDockSite).GetNextValidChild(AItemControl.DockIndex) <> nil then
        DrawColorEdge(ACanvas, R, GetHideBarButtonColor, etRaisedInner, SeparatorEdges[APosition]);
    end;
    AItemControl := (AControl as TdxTabContainerDockSite).ActiveChild;
  end
  else AItemControl := AControl;
  if IsValidImageIndex(AItemControl.ImageIndex) then
  begin
    R := ARect;
    if not (APosition in [ahpLeft, ahpRight]) then
      R.Right := R.Left + (GetDefaultImageWidth + 2 * GetHideBarHorizInterval)
    else R.Bottom := R.Top + (GetDefaultImageHeight + 2 * GetHideBarHorizInterval);
    DrawHideBarButtonImage(ACanvas, AItemControl, R);
    if not (APosition in [ahpLeft, ahpRight]) then
      ARect.Left := R.Right
    else ARect.Top := R.Bottom;
  end;
  DrawHideBarButtonText(ACanvas, AItemControl, ARect, APosition);
  if (AControl is TdxTabContainerDockSite) then
    if (AControl as TdxTabContainerDockSite).GetNextValidChild(AItemControl.DockIndex) <> nil then
      DrawColorEdge(ACanvas, ARect, GetHideBarButtonColor, etRaisedInner, SeparatorEdges[APosition]);
end;

procedure TdxDockControlPainter.DrawHideBarButton(ACanvas: TCanvas;
  AControl: TdxCustomDockControl; ARect: TRect; APosition: TdxAutoHidePosition);
const
  TopEdges: array[TdxAutoHidePosition] of TdxEdgePositions = ([epTop], [epLeft],
    [epTopLeft], [epTopLeft]);
  BottomEdges: array[TdxAutoHidePosition] of TdxEdgePositions = ([epBottomRight],
    [epBottomRight], [epBottom], [epRight]);
begin
  Assert(AutoHideHostSite <> nil, sdxInternalErrorPainter);
  DrawColorEdge(ACanvas, ARect, GetHideBarButtonColor, etRaisedOuter, TopEdges[APosition]);
  DrawColorEdge(ACanvas, ARect, GetHideBarButtonColor, etRaisedInner, BottomEdges[APosition]);
  DrawHideBarButtonContent(ACanvas, AControl, ARect, APosition);
end;

procedure TdxDockControlPainter.DrawHideBarButtonImage(ACanvas: TCanvas;
  AControl: TdxCustomDockControl; ARect: TRect);
var
  R: TRect;
begin
  Assert(AutoHideHostSite <> nil, sdxInternalErrorPainter);
  if IsValidImageIndex(AControl.ImageIndex) then
  begin
    R.Left := ARect.Left + (ARect.Right - ARect.Left - GetImageWidth) div 2;
    R.Top := ARect.Top + (ARect.Bottom - ARect.Top - GetImageHeight) div 2;
    R.Right := R.Left + GetImageWidth;
    R.Bottom := R.Top + GetImageHeight;
    DrawImage(ACanvas, AControl.Images, AControl.ImageIndex, R);
  end;
end;

procedure TdxDockControlPainter.DrawHideBarButtonText(ACanvas: TCanvas;
  AControl: TdxCustomDockControl; ARect: TRect; APosition: TdxAutoHidePosition);
var
  R: TRect;
  ABitmap: TBitmap;
begin
  Assert(AutoHideHostSite <> nil, sdxInternalErrorPainter);
  ACanvas.Brush.Style := bsClear;
  ACanvas.Font := GetHideBarButtonFont;
  ACanvas.Font.Color := ColorToRGB(GetHideBarButtonFontColor);
  InflateRect(ARect, -2, -2);
  case APosition of
    ahpTop, ahpBottom:
      DrawText(ACanvas.Handle, PChar(AControl.Caption), Length(AControl.Caption),
        ARect, DT_SINGLELINE or DT_LEFT or DT_VCENTER or DT_END_ELLIPSIS);
    ahpLeft, ahpRight:
      begin
        R := ARect;
        OffsetRect(R, - R.Left, -R.Top);
        R.Right := (ARect.Bottom - ARect.Top);
        R.Bottom := (ARect.Right - ARect.Left);
        ABitmap := TBitmap.Create;
        try
          ABitmap.PixelFormat := pf32bit;
          ABitmap.Transparent := True;
          ABitmap.Width := R.Right - R.Left;
          ABitmap.Height := R.Bottom - R.top;
          ABitmap.Canvas.Brush.Style := bsClear;
          ABitmap.Canvas.Brush.Color := GetHideBarButtonColor;
          ABitmap.Canvas.FillRect(R);

          ABitmap.Canvas.Font := GetHideBarButtonFont;
          ABitmap.Canvas.Font.Color := ColorToRGB(GetHideBarButtonFontColor);
          DrawText(ABitmap.Canvas.Handle, PChar(AControl.Caption), Length(AControl.Caption),
            R, DT_SINGLELINE or DT_LEFT or DT_VCENTER or DT_END_ELLIPSIS);
          RotateBitmap(ABitmap, raMinus90);
          ACanvas.Draw(ARect.Left, ARect.Top, ABitmap);
        finally
          ABitmap.Free;
        end;
      end;
  end;
end;

procedure TdxDockControlPainter.DrawTabs(ACanvas: TCanvas; ARect, AActiveTabRect: TRect);
var
  R: TRect;
begin
  Assert(TabContainer <> nil, sdxInternalErrorPainter);
  ACanvas.Brush.Style := bsSolid;
  ACanvas.Brush.Color := ColorToRGB(GetTabsColor);
  ACanvas.FillRect(ARect);
  R := ARect;
  if TabContainer.TabsPosition = tctpTop then
  begin
    Dec(R.Bottom, 1);
    DrawColorEdge(ACanvas, R, GetTabColor(True), etRaisedOuter, [epBottom]);
    Dec(R.Bottom, 1);
    DrawColorEdge(ACanvas, R, GetTabColor(True), etRaisedInner, [epBottom]);
    R := ARect;
    R.Bottom := AActiveTabRect.Bottom;
    DrawColorEdge(ACanvas, R, GetTabColor(True), etSunkenOuter, [epBottom]);
  end
  else
  begin
    Inc(R.Top, 1);
    DrawColorEdge(ACanvas, R, GetTabColor(True), etRaisedOuter, [epTop]);
    R := ARect;
    R.Top := AActiveTabRect.Top;
    DrawColorEdge(ACanvas, R, GetTabColor(True), etSunkenOuter, [epTop]);
    Inc(R.Top, 1);
    DrawColorEdge(ACanvas, R, GetTabColor(True), etSunkenInner, [epTop]);
  end;
end;

procedure TdxDockControlPainter.DrawTab(ACanvas: TCanvas; AControl: TdxCustomDockControl;
  ARect: TRect; IsActive: Boolean);
var
  pts: array[0..4] of TPoint;
begin
  Assert(TabContainer <> nil, sdxInternalErrorPainter);

  if IsActive then
  begin
    ACanvas.Brush.Color := ColorToRGB(GetTabColor(IsActive));
    ACanvas.Brush.Style := bsSolid;
    ACanvas.FillRect(ARect);
  end;

  ACanvas.Pen.Style := psSolid;
  ACanvas.Pen.Width := 1;
  if TabContainer.TabsPosition = tctpTop then
  begin
    ACanvas.Pen.Color := LightLightColor(GetTabColor(True));
    pts[0] := Point(ARect.Left, ARect.Bottom - 1);
    pts[1] := Point(ARect.Left, ARect.Top + 2);
    pts[2] := Point(ARect.Left + 2, ARect.Top);
    pts[3] := Point(ARect.Right - 3, ARect.Top);
    pts[4] := Point(ARect.Right - 1, ARect.Top + 2);
    ACanvas.Polyline(pts);
    ACanvas.Pen.Color := DarkDarkColor(GetTabColor(True));
    ACanvas.MoveTo(ARect.Right - 1, ARect.Top + 2);
    if IsActive then
      ACanvas.LineTo(ARect.Right - 1, ARect.Bottom)
    else ACanvas.LineTo(ARect.Right - 1, ARect.Bottom - 1);
    ACanvas.Pen.Color := DarkColor(GetTabColor(True));
    ACanvas.MoveTo(ARect.Right - 2, ARect.Top + 1);
    if IsActive then
      ACanvas.LineTo(ARect.Right - 2, ARect.Bottom)
    else ACanvas.LineTo(ARect.Right - 2, ARect.Bottom - 1);
  end
  else
  begin
    ACanvas.Pen.Color := LightLightColor(GetTabColor(True));
    if IsActive then
      ACanvas.MoveTo(ARect.Left, ARect.Top)
    else ACanvas.MoveTo(ARect.Left, ARect.Top + 2);
    ACanvas.LineTo(ARect.Left, ARect.Bottom - 2);
    ACanvas.Pen.Color := DarkDarkColor(GetTabColor(True));
    pts[0] := Point(ARect.Left, ARect.Bottom - 2);
    pts[1] := Point(ARect.Left + 2, ARect.Bottom);
    pts[2] := Point(ARect.Right - 3, ARect.Bottom);
    pts[3] := Point(ARect.Right - 1, ARect.Bottom - 2);
    if IsActive then
      pts[4] := Point(ARect.Right - 1, ARect.Top - 1)
    else pts[4] := Point(ARect.Right - 1, ARect.Top + 1);
    ACanvas.Polyline(pts);
    ACanvas.Pen.Color := DarkColor(GetTabColor(True));
    pts[0] := Point(ARect.Left + 1, ARect.Bottom - 2);
    pts[1] := Point(ARect.Left + 2, ARect.Bottom - 1);
    pts[2] := Point(ARect.Right - 3, ARect.Bottom - 1);
    pts[3] := Point(ARect.Right - 2, ARect.Bottom - 2);
    if IsActive then
      pts[4] := Point(ARect.Right - 2, ARect.Top - 1)
    else pts[4] := Point(ARect.Right - 2, ARect.Top + 1);
    ACanvas.Polyline(pts);
  end;

  DrawTabContent(ACanvas, AControl, ARect, IsActive);
end;

procedure TdxDockControlPainter.DrawTabContent(ACanvas: TCanvas;
  AControl: TdxCustomDockControl; ARect: TRect; IsActive: Boolean);
var
  R: TRect;
begin
  Assert(TabContainer <> nil, sdxInternalErrorPainter);

  ARect.Left := ARect.Left + GetTabHorizInterval;
  if IsValidImageIndex(AControl.ImageIndex) then
  begin
    R.Left := ARect.Left;
    R.Top := ARect.Top + (ARect.Bottom - ARect.Top - GetImageHeight) div 2;
    R.Right := R.Left + GetImageWidth;
    R.Bottom := R.Top + GetImageHeight;
    if RectInRect(R, ARect) then
    begin
      DrawImage(ACanvas, AControl.Images, AControl.ImageIndex, R);
      ARect.Left := R.Right + GetTabHorizInterval;
    end;
  end;

  ACanvas.Brush.Style := bsClear;
  ACanvas.Font :=  GetTabFont(IsActive);
  ACanvas.Font.Color :=  ColorToRGB(GetTabFontColor(IsActive));
  DrawText(ACanvas.Handle, PChar(AControl.Caption), Length(AControl.Caption), ARect,
    DT_SINGLELINE or DT_LEFT or DT_VCENTER or DT_END_ELLIPSIS);
end;

procedure TdxDockControlPainter.DrawTabsNextTabButton(ACanvas: TCanvas; ARect: TRect;
  IsDown, IsHot, IsEnable: Boolean);
var
  pts: array[0..2] of TPoint;
begin
  Assert(TabContainer <> nil, sdxInternalErrorPainter);
  DrawTabsButtonSelection(ACanvas, ARect, IsDown, IsHot, IsEnable);

  ACanvas.Brush.Color := GetTabsScrollButtonsSignColor(IsEnable);
  ACanvas.Brush.Style := bsSolid;
  ACanvas.Pen.Color := GetTabsScrollButtonsSignColor(IsEnable);
  ACanvas.Pen.Style := psSolid;
  ACanvas.Pen.Width := 1;

  InflateRect(ARect, -1, -1);
  if IsDown and IsHot then OffsetRect(ARect, 1, 1);
  pts[0] := Point(ARect.Left + 4, ARect.Top + 2);
  pts[1] := Point(ARect.Left + 4, ARect.Bottom - 4);
  pts[2] := Point(ARect.Right - 6, ARect.Top + 6);
  ACanvas.Polygon(pts);
end;

procedure TdxDockControlPainter.DrawTabsPrevTabButton(ACanvas: TCanvas; ARect: TRect;
  IsDown, IsHot, IsEnable: Boolean);
var
  pts: array[0..2] of TPoint;
begin
  Assert(TabContainer <> nil, sdxInternalErrorPainter);
  DrawTabsButtonSelection(ACanvas, ARect, IsDown, IsHot, IsEnable);

  ACanvas.Brush.Color := GetTabsScrollButtonsSignColor(IsEnable);
  ACanvas.Brush.Style := bsSolid;
  ACanvas.Pen.Color := GetTabsScrollButtonsSignColor(IsEnable);
  ACanvas.Pen.Style := psSolid;
  ACanvas.Pen.Width := 1;

  InflateRect(ARect, -1, -1);
  if IsDown and IsHot then OffsetRect(ARect, 1, 1);
  pts[0] := Point(ARect.Right - 6, ARect.Top + 2);
  pts[1] := Point(ARect.Right - 6, ARect.Bottom - 4);
  pts[2] := Point(ARect.Left + 4, ARect.Top + 6);
  ACanvas.Polygon(pts);
end;

procedure TdxDockControlPainter.DrawTabsButtonSelection(ACanvas: TCanvas; ARect: TRect;
  IsDown, IsHot, IsEnable: Boolean);
begin
  if IsDown and IsHot and IsEnable then
  begin
    DrawColorEdge(ACanvas, ARect, GetTabsScrollButtonsColor, etSunkenOuter, [epRect]);
    InflateRect(ARect, -1, -1);
    DrawColorEdge(ACanvas, ARect, GetTabsScrollButtonsColor, etSunkenInner, [epTopLeft]);
  end
  else
  begin
    DrawColorEdge(ACanvas, ARect, GetTabsScrollButtonsColor, etRaisedOuter, [epRect]);
    InflateRect(ARect, -1, -1);
    DrawColorEdge(ACanvas, ARect, GetTabsScrollButtonsColor, etRaisedInner, [epBottomRight]);
  end;
end;

class procedure TdxDockControlPainter.AssignDefaultColor;
begin
  dxDockingController.Color := clBtnFace;
end;

class procedure TdxDockControlPainter.AssignDefaultFont;
begin
  with dxDockingController.Font do
  begin
    Charset := DEFAULT_CHARSET;
    Color := clBlack;
    Height := -11;
    Name := 'MS Sans Serif';
    Pitch := fpDefault;
    Size := 8;
    Style := [];
  end;
end;

class procedure TdxDockControlPainter.CreateColors;
begin
end;

class procedure TdxDockControlPainter.RefreshColors;
begin
end;

class procedure TdxDockControlPainter.ReleaseColors;
begin
end;

function Dark(Col: TColor; Percentage: Byte): TColor;
var
  R, G, B: Integer;
begin
  Col := ColorToRGB(Col);
  R := GetRValue(Col); G := GetGValue(Col); B := GetBValue(Col);
  R := Round(R * Percentage / 100);
  G := Round(G * Percentage / 100);
  B := Round(B * Percentage / 100);
  Result := RGB(R, G, B);
end;

function Light(Col: TColor; Percentage: Byte): TColor;
var
  R, G, B: Integer;
begin
  Col := ColorToRGB(Col);
  R := GetRValue(Col); G := GetGValue(Col); B := GetBValue(Col);
  R := Round(R * Percentage / 100) + Round(255 - Percentage / 100 * 255);
  G := Round(G * Percentage / 100) + Round(255 - Percentage / 100 * 255);
  B := Round(B * Percentage / 100) + Round(255 - Percentage / 100 * 255);
  Result := RGB(R, G, B);
end;

class function TdxDockControlPainter.LightColor(AColor: TColor): TColor;
begin
  Result := Light(AColor, 60);
end;

class function TdxDockControlPainter.LightLightColor(AColor: TColor): TColor;
begin
  Result := Light(AColor, 20);
end;

class function TdxDockControlPainter.DarkColor(AColor: TColor): TColor;
begin
  Result := Dark(AColor, 60);
end;

class function TdxDockControlPainter.DarkDarkColor(AColor: TColor): TColor;
begin
  Result := Dark(AColor, 20);
end;

class procedure TdxDockControlPainter.DrawColorEdge(ACanvas: TCanvas; ARect: TRect;
  AColor: TColor; AEdgesType: TdxEdgesType; AEdgePositios: TdxEdgePositions);
var
  LTCol, RBCol: TColor;
begin
  case AEdgesType of
    etFlat: begin
      LTCol := DarkColor(AColor);
      RBCol := DarkColor(AColor);
    end;
    etRaisedOuter: begin
      LTCol := LightLightColor(AColor);
      RBCol := DarkDarkColor(AColor);
    end;
    etRaisedInner: begin
      LTCol := LightColor(AColor);
      RBCol := DarkColor(AColor);
    end;
    etSunkenOuter: begin
      LTCol := DarkDarkColor(AColor);
      RBCol := LightLightColor(AColor);
    end;
    etSunkenInner: begin
      LTCol := DarkColor(AColor);
      RBCol := LightColor(AColor);
    end;
  else
    LTCol := ColorToRGB(AColor);
    RBCol := ColorToRGB(AColor);
  end;
  ACanvas.Pen.Style := psSolid;
  ACanvas.Pen.Width := 1;
  ACanvas.MoveTo(ARect.Left, ARect.Bottom - 1);
  ACanvas.Pen.Color := LTCol;
  if (epLeft in AEdgePositios) or (epTopLeft in AEdgePositios) or (epRect in AEdgePositios) then
    ACanvas.LineTo(ARect.Left, ARect.Top - 1);
  ACanvas.MoveTo(ARect.Left, ARect.Top);
  if (epTop in AEdgePositios) or (epTopLeft in AEdgePositios) or (epRect in AEdgePositios) then
    ACanvas.LineTo(ARect.Right, ARect.Top);
  ACanvas.MoveTo(ARect.Right - 1, ARect.Top);
  ACanvas.Pen.Color := RBCol;
  if (epRight in AEdgePositios) or (epBottomRight in AEdgePositios) or (epRect in AEdgePositios) then
    ACanvas.LineTo(ARect.Right - 1, ARect.Bottom);
  ACanvas.MoveTo(ARect.Right - 1, ARect.Bottom - 1);
  if (epBottom in AEdgePositios) or (epBottomRight in AEdgePositios) or (epRect in AEdgePositios) then
    ACanvas.LineTo(ARect.Left - 1, ARect.Bottom - 1)
end;

class procedure TdxDockControlPainter.DrawImage(ACanvas: TCanvas; AImageList: TImageList;
  AImageIndex: Integer; R: TRect);
const
  DrawingStyles: array[TDrawingStyle] of Longint = (ILD_FOCUS,
    ILD_SELECTED, ILD_NORMAL, ILD_TRANSPARENT);
  Images: array[TImageType] of Longint = (0, ILD_MASK);

  function GetRGBColor(Value: TColor): DWORD;
  begin
    Result := ColorToRGB(Value);
    case Result of
      clNone: Result := CLR_NONE;
      clDefault: Result := CLR_DEFAULT;
    end;
  end;
begin
  with AImageList do
  begin
    ImageList_DrawEx(Handle, AImageIndex, ACanvas.Handle, R.Left, R.Top, 0, 0,
      GetRGBColor(BkColor), GetRGBColor(BlendColor),
      DrawingStyles[DrawingStyle] or Images[ImageType]);
  end;
end;

class function TdxDockControlPainter.RectInRect(R1, R2: TRect): Boolean;
begin
  Result := PtInRect(R2, R1.TopLeft) and PtInRect(R2, R1.BottomRight);
end;

class procedure TdxDockControlPainter.RotateBitmap(ABitmap: TBitmap; Angle: TdxRotationAngle);
var
  PDest, PDestStart: ^DWord;
  PSource: ^DWord;
  PBuffer: Pointer;
  XSource, YSource: Integer;
  LineCopyingDirection: Integer;
  TempVar: Integer;
begin
  case Angle of
    ra180:
      with ABitmap do
      begin
        GetMem(PBuffer, Width * 4);
        PDestStart := ScanLine[Height - 1];
        PDest := PDestStart;
        Integer(PSource) := Integer(PDest) + Height * Width * 4;
        for YSource := 0 to Height div 2 - 1 do
        begin
          Move(PDest^, PBuffer^, Width * 4);
          for XSource := 0 to Width - 1 do
          begin
            Dec(PSource);
            PDest^ := PSource^;
            Inc(PDest);
          end;

          PDest := Pointer(PSource);
          Integer(PSource) := Integer(PBuffer) + Width * 4;
          for XSource := 0 to Width - 1 do
          begin
            Dec(PSource);
            PDest^ := PSource^;
            Inc(PDest);
          end;

          Integer(PSource) := Integer(PDest) - Width * 4;
          Inc(PDestStart, Width);
          PDest := PDestStart;
        end;
        if Height mod 2 <> 0 then
          for XSource := 0 to Width div 2 - 1 do
          begin
            Dec(PSource);
            PDest^ := PSource^;
            Inc(PDest);
          end;

        Width := Width + 1;
        Width := Width - 1;
        FreeMem(PBuffer);
      end;
    raPlus90, raMinus90:
      with ABitmap do
      begin
        GetMem(PBuffer, Width * Height * 4);

        LineCopyingDirection := 0;
        PDestStart := PBuffer;
        case Angle of
          raPlus90:
            begin
              Inc(PDestStart, Height * (Width - 1));
              LineCopyingDirection := 1;
            end;
          raMinus90:
            begin
              Inc(PDestStart, Height - 1);
              LineCopyingDirection := -1;
            end;
        end;

        PSource := ScanLine[0];
        for YSource := 0 to Height - 1 do
        begin
          PDest := PDestStart;
          for XSource := 0 to Width - 1 do
          begin
            PDest^ := PSource^;
            Dec(PDest, Height * LineCopyingDirection);
            Inc(PSource);
          end;
          Inc(PDestStart, LineCopyingDirection);
          Dec(PSource, Width * 2);
        end;

        TempVar := Width;
        Width := Height;
        Height := TempVar;
        if Width = Height then
        begin
          Width := Width + 1;
          Width := Width - 1;
        end;

        PSource := PBuffer;
        PDest := ScanLine[0];
        for YSource := 0 to Height - 1 do
        begin
          Move(PSource^, PDest^, Width * 4);
          Inc(PSource, Width);
          Dec(PDest, Width);
        end;

        FreeMem(PBuffer);
      end;
  end;
end;

function TdxDockControlPainter.GetAutoHideHostSite: TdxDockSite;
begin
  if DockControl is TdxDockSite then
    Result := DockControl as TdxDockSite
  else Result := nil;
end;

function TdxDockControlPainter.GetColor: TColor;
begin
  Result := DockControl.Color;
end;

function TdxDockControlPainter.GetFont: TFont;
begin
  Result := DockControl.Font;
end;

function TdxDockControlPainter.GetBorderColor: TColor;
begin
  Result := GetColor;
end;

function TdxDockControlPainter.GetCaptionColor(IsActive: Boolean): TColor;
begin
  Result := GetColor;
end;

function TdxDockControlPainter.GetCaptionFont(IsActive: Boolean): TFont;
begin
  Result := GetFont;
end;

function TdxDockControlPainter.GetCaptionFontColor(IsActive: Boolean): TColor;
begin
  Result := GetCaptionFont(IsActive).Color;
end;

function TdxDockControlPainter.GetCaptionSignColor(IsActive, IsDown, IsHot: Boolean): TColor;
begin
  Result := GetCaptionFontColor(IsActive);
end;

function TdxDockControlPainter.GetTabsColor: TColor;
begin
  Result := GetColor;
end;

function TdxDockControlPainter.GetTabColor(IsActive: Boolean): TColor;
begin
  Result := GetColor;
end;

function TdxDockControlPainter.GetTabFont(IsActive: Boolean): TFont;
begin
  Result := GetFont;
end;

function TdxDockControlPainter.GetTabFontColor(IsActive: Boolean): TColor;
begin
  Result := GetTabFont(IsActive).Color;
end;

function TdxDockControlPainter.GetTabsScrollButtonsColor: TColor;
begin
  Result := GetColor;
end;

function TdxDockControlPainter.GetTabsScrollButtonsSignColor(IsEnable: Boolean): TColor;
begin
  if IsEnable then
    Result := DarkDarkColor(GetColor)
  else Result := DarkColor(GetTabColor(True));
end;

function TdxDockControlPainter.GetHideBarColor: TColor;
begin
  Result := GetColor;
end;

function TdxDockControlPainter.GetHideBarButtonColor: TColor;
begin
  Result := GetColor;
end;

function TdxDockControlPainter.GetHideBarButtonFont: TFont;
begin
  Result := GetFont;
end;

function TdxDockControlPainter.GetHideBarButtonFontColor: TColor;
begin
  Result := GetHideBarButtonFont.Color;
end;

function TdxDockControlPainter.GetTabContainer: TdxTabContainerDockSite;
begin
  if DockControl is TdxTabContainerDockSite then
    Result := DockControl as TdxTabContainerDockSite
  else Result := nil;
end;

{ TdxDockingController }
                          
function dxDockingWndProcHook(Code: Integer; wParam: WParam; lParam: LParam): LRESULT; stdcall;
var
  AControl: TWinControl;
begin
  Result := CallNextHookEx(FWndProcHookHandle, Code, wParam, lParam);
  with PCWPStruct(lParam)^ do
    if Application.MainForm <> nil then
    begin
      AControl := FindControl(hwnd);
        case message of
          WM_ACTIVATEAPP:
          begin
            if (AControl is TCustomForm) and not (AControl is TdxFloatForm) and
              (csDesigning in AControl.ComponentState) then
            begin
              if wParam = 0 then
                dxDockingController.FloatFormsHide(nil)
              else dxDockingController.FloatFormsShow(nil);
            end;
          end;
          WM_WINDOWPOSCHANGING:
          begin
            if (AControl is TCustomForm) and not (AControl is TdxFloatForm) then
            begin
              if PWindowPos(lParam)^.flags and SWP_HIDEWINDOW <> 0 then
                dxDockingController.FloatFormsHide(AControl as TCustomForm);
              if PWindowPos(lParam)^.flags and SWP_SHOWWINDOW <> 0 then
                dxDockingController.FloatFormsShow(AControl as TCustomForm);
            end;
          end;
        end;
    end;
end;

constructor TdxDockingController.Create;
begin
  {$IFDEF DELPHI6}
  FHandle := Classes.AllocateHWnd(WndProc);
  {$ELSE}
  FHandle := Forms.AllocateHWnd(WndProc);
  {$ENDIF}
  FColor := clBtnFace;
  FDestroyedDockControls := TList.Create;
  FDockControls := TList.Create;
  FFont := TFont.Create;
  FFont.OnChange := DoOnFontChanged;
  FInvalidNC := TList.Create;
  FInvalidNCBounds := TList.Create;
  FInvalidRedraw := TList.Create;
  FOptions := [doActivateAfterDocking, doDblClickDocking, doFloatingOnTop, doTabContainerCanAutoHide,
    doTabContainerHasCaption, doSideContainerCanClose, doSideContainerCanAutoHide,
    doTabContainerCanInSideContainer];
  FSelectionBrush := TBrush.Create;
  FSelectionBrush.Bitmap := AllocPatternBitmap(clBlack, clWhite);
  FWndProcHookHandle := SetWindowsHookEx(WH_CALLWNDPROC, dxDockingWndProcHook, 0, GetCurrentThreadId);
  FViewStyle := vsStandard;
  CreatePainterColors;
end;

destructor TdxDockingController.Destroy;
begin
  ReleasePainterColors;
  UnhookWindowsHookEx(FWndProcHookHandle);
  FWndProcHookHandle := 0;
  FSelectionBrush.Free;
  FInvalidRedraw.Free;
  FInvalidNCBounds.Free;
  FInvalidNC.Free;
  FFont.Free;
  FDockControls.Free;
  FDestroyedDockControls.Free;
  {$IFDEF DELPHI6}
  Classes.DeallocateHWnd(FHandle);
  {$ELSE}
  Forms.DeallocateHWnd(FHandle);			
  {$ENDIF}
  inherited;
end;

procedure TdxDockingController.BeginUpdate;
begin
  BeginUpdateNC;
end;

procedure TdxDockingController.EndUpdate;
begin
  EndUpdateNC;
end;

function TdxDockingController.GetDockControlAtPos(pt: TPoint): TdxCustomDockControl;
var
  AControl: TWinControl;
begin
  Result := nil;
  AControl := FindVCLWindow(pt);
  while True do
  begin
    if AControl = nil then break;
    if AControl is TdxCustomDockControl then
    begin
      Result := AControl as TdxCustomDockControl;
      break;
    end;
    AControl := AControl.Parent;
  end;
end;

function TdxDockingController.GetFloatDockSiteAtPos(pt: TPoint): TdxCustomDockControl;
var
  AControl: TWinControl;
  Message: TMessage;
begin
  Result := nil;
  AControl := FindVCLWindow(pt);
  if AControl is TdxFloatForm then
  begin
    Message.Msg := WM_NCHITTEST;
    Message.LParamLo := pt.X;
    Message.LParamHi := pt.Y;
    Message.Result := 0;
    AControl.WindowProc(Message);
    if (Message.Result = HTCAPTION) then
      Result := (AControl as TdxFloatForm).DockSite;
  end;
end;

function TdxDockingController.GetNearestDockSiteAtPos(pt: TPoint): TdxCustomDockControl;
var
  I: Integer;
  ADockSite: TdxDockSite;
  R: TRect;
begin
  Result := nil;
  for I := 0 to DockControlCount - 1 do
    if DockControls[I] is TdxDockSite then
    begin
      ADockSite := DockControls[I] as TdxDockSite;
      if not ADockSite.AutoSize then continue;
      if not (ADockSite.Align in [alLeft, alTop, alRight, alBottom]) then continue;
      if (ADockSite.Align in [alLeft, alRight]) and (ADockSite.Width > dxDockZonesWidth) then continue;
      if (ADockSite.Align in [alTop, alBottom]) and (ADockSite.Height > dxDockZonesWidth) then continue;
      GetWindowRect(ADockSite.Handle, R);
      case ADockSite.Align of
        alLeft: R.Right := R.Left + dxDockZonesWidth;
        alTop: R.Bottom := R.Top + dxDockZonesWidth;
        alRight: R.Left := R.Right - dxDockZonesWidth;
        alBottom: R.Top := R.Bottom - dxDockZonesWidth;
      end;
      if PtInRect(R, pt) then
      begin
        Result := ADockSite;
        break;
      end;
    end;
end;

procedure TdxDockingController.RegisterManager(AManager: TdxDockingManager);
begin
  if (FManager = nil) or (FManager = AManager) then
  begin
    FManager := AManager;
    DoManagerChanged;
  end
  else
    raise Exception.Create(sdxManagerError);
end;

procedure TdxDockingController.UnregisterManager(AManager: TdxDockingManager);
begin
  if FManager = AManager then
  begin
    FManager := nil;
    DoManagerChanged;
  end;
end;

procedure TdxDockingController.DoActiveDockControlChanged;
begin
  if (Manager <> nil) and Assigned(Manager.OnActiveDockControlChanged) then
    Manager.OnActiveDockControlChanged(Manager);
end;

procedure TdxDockingController.DoCreateFloatSite(ASender: TdxCustomDockControl; ASite: TdxFloatDockSite);
begin
  if (Manager <> nil) and Assigned(Manager.OnCreateFloatSite) then
    Manager.OnCreateFloatSite(ASender, ASite);
end;

procedure TdxDockingController.DoCreateLayoutSite(ASender: TdxCustomDockControl; ASite: TdxLayoutDockSite);
begin
  if (Manager <> nil) and Assigned(Manager.OnCreateLayoutSite) then
    Manager.OnCreateLayoutSite(ASender, ASite);
end;

procedure TdxDockingController.DoCreateSideContainerSite(ASender: TdxCustomDockControl;
  ASite: TdxSideContainerDockSite);
begin
  if (Manager <> nil) and Assigned(Manager.OnCreateSideContainer) then
    Manager.OnCreateSideContainer(ASender, ASite);
end;

procedure TdxDockingController.DoCreateTabContainerSite(ASender: TdxCustomDockControl;
  ASite: TdxTabContainerDockSite);
begin
  if (Manager <> nil) and Assigned(Manager.OnCreateTabContainer) then
    Manager.OnCreateTabContainer(ASender, ASite);
end;

function TdxDockingController.DoCustomDrawResizingSelection(ASender: TdxCustomDockControl;
  DC: HDC; AZone: TdxZone; pt: TPoint; Erasing: Boolean): Boolean;
begin
  Result := False;
  if (Manager <> nil) and Assigned(Manager.OnCustomDrawResizingSelection) then
    Manager.OnCustomDrawResizingSelection(ASender, DC, AZone, AZone.GetResizingSelection(pt), Erasing, Result);
end;

function TdxDockingController.DoCustomDrawDockingSelection(ASender: TdxCustomDockControl;
  DC: HDC; AZone: TdxZone; R: TRect; Erasing: Boolean): Boolean;
begin
  Result := False;
  if (Manager <> nil) and Assigned(Manager.OnCustomDrawDockingSelection) then
    Manager.OnCustomDrawDockingSelection(ASender, DC, AZone, R, Erasing, Result);
end;

procedure TdxDockingController.DoSetFloatFormCaption(ASender: TdxCustomDockControl;
  AFloatForm: TdxFloatForm);
begin
  if (Manager <> nil) and Assigned(Manager.OnSetFloatFormCaption) then
    Manager.OnSetFloatFormCaption(ASender, AFloatForm);
end;

function TdxDockingController.DefaultLayoutSiteProperties: TdxLayoutDockSiteProperties;
begin
  if (Manager <> nil) and Manager.UseDefaultSitesProperties then
    Result := Manager.DefaultLayoutSiteProperties
  else Result := nil;
end;

function TdxDockingController.DefaultFloatSiteProperties: TdxFloatDockSiteProperties;
begin
  if (Manager <> nil) and Manager.UseDefaultSitesProperties then
    Result := Manager.DefaultFloatSiteProperties
  else Result := nil;
end;

function TdxDockingController.DefaultHorizContainerSiteProperties: TdxSideContainerDockSiteProperties;
begin
  if (Manager <> nil) and Manager.UseDefaultSitesProperties then
    Result := Manager.DefaultHorizContainerSiteProperties
  else Result := nil;
end;

function TdxDockingController.DefaultVertContainerSiteProperties: TdxSideContainerDockSiteProperties;
begin
  if (Manager <> nil) and Manager.UseDefaultSitesProperties then
    Result := Manager.DefaultVertContainerSiteProperties
  else Result := nil;
end;

function TdxDockingController.DefaultTabContainerSiteProperties: TdxTabContainerDockSiteProperties;
begin
  if (Manager <> nil) and Manager.UseDefaultSitesProperties then
    Result := Manager.DefaultTabContainerSiteProperties
  else Result := nil;
end;

procedure TdxDockingController.DoColorChanged;
var
  I: Integer;
begin
  BeginUpdateNC;
  try
    for I := 0 to DockControlCount - 1 do
      if DockControls[I].ManagerColor then
      begin
        DockControls[I].Color := Color;
        DockControls[I].InvalidateNC(False);
        DockControls[I].FManagerColor := True;
      end;
  finally
    EndUpdateNC;
  end;
end;

procedure TdxDockingController.DoImagesChanged;
begin
  CalculateControls;
end;

procedure TdxDockingController.DoLookAndFeelChanged;
begin
  DoPainterChanged(True);
end;

procedure TdxDockingController.DoFontChanged;
var
  I: Integer;
begin
  BeginUpdateNC;
  try
    for I := 0 to DockControlCount - 1 do
      if DockControls[I].ManagerFont then
      begin
        DockControls[I].Font := Font;
        DockControls[I].NCChanged;
        DockControls[I].FManagerFont := True;        
      end;
  finally
    EndUpdateNC;
  end;
end;

procedure TdxDockingController.DoLayoutChanged(ASender: TdxCustomDockControl);
begin
  if (Manager <> nil) and Assigned(Manager.OnLayoutChanged) then
    Manager.OnLayoutChanged(ASender);
end;

procedure TdxDockingController.DoManagerChanged;
begin
  BeginUpdateNC;
  try
    DoColorChanged;
    DoImagesChanged;
    DoFontChanged;
    DoLayoutChanged(nil);
    DoOptionsChanged(FOptions, Options);
    DoViewStyleChanged(False);
  finally
    EndUpdateNC;
  end;
end;

procedure TdxDockingController.DoOptionsChanged(AOldOptions, ANewOptions: TdxDockingOptions);
begin
  if (doFloatingOnTop in AOldOptions) <> (doFloatingOnTop in ANewOptions) then
    if doFloatingOnTop in Options then
      FloatFormsOnTopMost(nil)
    else FloatFormsOnTop(nil);
  UpdateControlsLayout;
  CalculateControls;
end;

procedure TdxDockingController.DoPainterChanged(AssignDefaultStyle: Boolean);
var
  I: Integer;
begin
  BeginUpdateNC;
  try
    PainterClass.ReleaseColors;
    FPainterClass := nil;
    for I := 0 to DockControlCount - 1 do
    begin
      DockControls[I].FPainter.Free;
      DockControls[I].FPainter := nil;
      DockControls[I].NCChanged;
    end;
    PainterClass.CreateColors;
    if AssignDefaultStyle then
    begin
      PainterClass.AssignDefaultColor;
      PainterClass.AssignDefaultFont;
    end;
  finally
    EndUpdateNC;
  end;
end;

procedure TdxDockingController.DoViewStyleChanged(AssignDefaultStyle: Boolean);
begin
  DoPainterChanged(AssignDefaultStyle);
  if (Manager <> nil) and Assigned(Manager.OnViewChanged) then
    Manager.OnViewChanged(Manager);
end;

procedure TdxDockingController.DoUpdateDockZones(ASender: TdxCustomDockControl);
begin
  if (Manager <> nil) and Assigned(Manager.OnUpdateDockZones) then
    Manager.OnUpdateDockZones(ASender, ASender.DockZones);
end;

procedure TdxDockingController.DoUpdateResizeZones(ASender: TdxCustomDockControl);
begin
  if (Manager <> nil) and Assigned(Manager.OnUpdateResizeZones) then
    Manager.OnUpdateResizeZones(ASender, ASender.ResizeZones);
end;

procedure TdxDockingController.LoadLayoutFromCustomIni(AIniFile: TCustomIniFile);
var
  I: Integer;
  ASections: TStringList;
  AControlClass: TdxCustomDockControlClass;
begin
  BeginUpdateNC;
  try
    ClearLayout;
    ASections := TStringList.Create;
    with AIniFile do
      try
        ReadSections(ASections);
        for I := 0 to ASections.Count - 1 do
        begin
          AControlClass := TdxCustomDockControlClass(FindClass(ReadString(ASections[I], 'ClassName', '')));
          if (AControlClass = TdxDockSite) or (AControlClass = TdxFloatDockSite) then
            LoadControlFromCustomIni(AIniFile, nil, ASections[I]);
        end;
      finally
        ASections.Free;
      end;
  finally
    EndUpdateNC;
    
    DoLayoutChanged(nil);
  end;
end;

procedure TdxDockingController.SaveLayoutToCustomIni(AIniFile: TCustomIniFile);
var
  I: Integer;
begin
  for I := 0 to DockControlCount - 1 do
  begin
    if DockControls[I].DockState = dsDestroyed then continue;
    if (DockControls[I] is TdxDockSite) or (DockControls[I] is TdxFloatDockSite) then
      SaveControlToCustomIni(AIniFile, DockControls[I]);
  end;
end;

procedure TdxDockingController.BeginUpdateNC;
begin
  if FCalculatingControl <> nil then exit;
  Inc(FUpdateNCLock);
end;

procedure TdxDockingController.EndUpdateNC;
begin
  if FCalculatingControl <> nil then exit;
  Dec(FUpdateNCLock);
  if FUpdateNCLock = 0 then
    UpdateInvalidControlsNC;
end;

procedure TdxDockingController.CalculateControls;
var
  I: Integer;
begin
  BeginUpdateNC;
  try
    for I := 0 to DockControlCount - 1 do
      DockControls[I].NCChanged;
  finally
    EndUpdateNC;
  end;
end;

function TdxDockingController.CheckControlsHandles: Boolean;
var
  I: Integer;
begin
  Result := True;
  for I := 0 to DockControlCount - 1 do
    if not DockControls[I].HandleAllocated then
    begin
      Result := False;
      break;
    end;
end;

procedure TdxDockingController.DestroyControls;
var
  AControl: TdxCustomDockControl;
begin
  while FDestroyedDockControls.Count > 0 do
  begin
    AControl := TdxCustomDockControl(FDestroyedDockControls.Items[FDestroyedDockControls.Count - 1]);
    FDestroyedDockControls.Remove(AControl);
    if not (csDestroying in AControl.ComponentState) then AControl.Free;
  end;
end;

procedure TdxDockingController.InvalidateControls(ANeedRecalculate: Boolean);
var
  I: Integer;
begin
  BeginUpdateNC;
  try
    for I := 0 to DockControlCount - 1 do
      DockControls[I].InvalidateNC(ANeedRecalculate);
  finally
    EndUpdateNC;
  end;
end;

function CompareDocks(Item1, Item2: Pointer): Integer;
var
  AControl1, AControl2: TdxCustomDockControl;
begin
  AControl1 := TdxCustomDockControl(Item1);
  AControl2 := TdxCustomDockControl(Item2);
  Result := AControl1.DockLevel - AControl2.DockLevel;
  if Result = 0 then
    Result := AControl1.DockIndex - AControl2.DockIndex;
  if AControl2.AutoHide and not AControl1.AutoHide then
    Result := -1
  else if AControl2.AutoHide and not AControl1.AutoHide then
    Result := 1;
end;

procedure TdxDockingController.UpdateInvalidControlsNC;
var
  I: Integer;
  AControl: TdxCustomDockControl;
begin
  if FCalculatingControl <> nil then exit;
  while FInvalidNCBounds.Count > 0 do
  begin
    FInvalidNCBounds.Sort(CompareDocks);
    FCalculatingControl := TdxCustomDockControl(FInvalidNCBounds[0]);
    try
      FCalculatingControl.NCChanged;
      FInvalidNCBounds.Remove(FCalculatingControl);
    finally
      FCalculatingControl := nil;
    end;
  end;
  FInvalidNC.Sort(CompareDocks);
  for I := 0 to FInvalidNC.Count - 1 do
  begin
    AControl := TdxCustomDockControl(FInvalidNC.Items[I]);
    if not AControl.Visible then continue;
    if FInvalidRedraw.IndexOf(AControl) > -1 then
    begin
      AControl.Perform(WM_SETREDRAW, Integer(True), 0);
      if AControl.HandleAllocated then
      begin
        RedrawWindow(AControl.Handle, nil, 0, RDW_FRAME or RDW_INVALIDATE or
          RDW_ERASE or RDW_ALLCHILDREN);
        if (AControl is TdxDockSite) and (AControl.Parent <> nil) then
          RedrawWindow(AControl.Parent.Handle, nil, 0, RDW_INVALIDATE or RDW_ERASE or RDW_ALLCHILDREN);
      end;
    end
    else AControl.InvalidateNC(False);
  end;
  FInvalidNC.Clear;
  FInvalidRedraw.Clear;
end;

procedure TdxDockingController.UpdateControlsLayout;
var
  I: Integer;
begin
  for I := 0 to DockControlCount - 1 do
    DockControls[I].UpdateLayout;
end;

procedure TdxDockingController.WndProc(var Message: TMessage);
begin
  case Message.Msg of
    WM_DESTROYCONTROLS: DestroyControls;
    WM_SYSCOLORCHANGE: begin
      if ViewStyle = vsUseLookAndFeel then
        DoLookAndFeelChanged;
      RefreshPainterColors;
      InvalidateControls(False);
    end;
  end;
end;

function TdxDockingController.CanUpdateNC(AControl: TdxCustomDockControl): Boolean;
begin
  Result := (FUpdateNCLock = 0) and (FCalculatingControl = nil);
  if not Result then
  begin
    if FInvalidNC.IndexOf(AControl) = -1 then
      FInvalidNC.Add(AControl);
  end;
end;

function TdxDockingController.CanCalculateNC(AControl: TdxCustomDockControl): Boolean;
begin
  Result := (FUpdateNCLock = 0);
  if not Result then
  begin
    if FInvalidRedraw.IndexOf(AControl) = -1 then
    begin
      AControl.Perform(WM_SETREDRAW, Integer(False), 0);
      FInvalidRedraw.Add(AControl);
    end;
    if FInvalidNCBounds.IndexOf(AControl) = -1 then
      FInvalidNCBounds.Add(AControl);
    if FInvalidNC.IndexOf(AControl) = -1 then
      FInvalidNC.Add(AControl);
  end;
end;

function TdxDockingController.PainterClass: TdxDockControlPainterClass;
const
  AStyles: array[TcxLookAndFeelKind] of TdxDockingViewStyle = (
    vsNET, vsStandard, vsNET);
  APainterClasses: array[TdxDockingViewStyle] of TdxDockControlPainterClass = (
    TdxDockControlPainter, TdxDockControlNETPainter, TdxDockControlOfficePainter,
    TdxDockControlXPPainter, TdxDockControlPainter);
var
  AViewStyle: TdxDockingViewStyle;
begin
  if FPainterClass = nil then
  begin
    if (Manager <> nil) and (Manager.ViewStyle = vsUseLookAndFeel) then
    begin
      if Manager.LookAndFeel.NativeStyle and AreVisualStylesAvailable([]) then
        AViewStyle := vsXP
      else AViewStyle := AStyles[Manager.LookAndFeel.Kind]
    end
    else AViewStyle := ViewStyle;
    FPainterClass := APainterClasses[AViewStyle];
  end;
  Result := FPainterClass;
end;

procedure TdxDockingController.CreatePainterColors;
begin
  PainterClass.CreateColors;
end;

procedure TdxDockingController.RefreshPainterColors;
begin
  if FPainterClass <> nil then
    FPainterClass.RefreshColors;
end;

procedure TdxDockingController.ReleasePainterColors;
begin
  if FPainterClass <> nil then
    FPainterClass.ReleaseColors;
end;

function TdxDockingController.GetIsDocking: Boolean;
begin
  Result := DockingDockControl <> nil;
end;

function TdxDockingController.GetDockControl(Index: Integer): TdxCustomDockControl;
begin
  Result := TdxCustomDockControl(FDockControls.Items[Index]);
end;

function TdxDockingController.GetDockControlCount: Integer;
begin
  Result := FDockControls.Count;
end;

function TdxDockingController.GetIsResizing: Boolean;
begin
  Result := ResizingDockControl <> nil;
end;

procedure TdxDockingController.SetActiveDockControl(Value: TdxCustomDockControl);
var
  AOldActiveSite: TdxCustomDockControl;
begin
  if (Value = nil) or Value.CanActive then
  begin
    AOldActiveSite := FActiveDockControl;
    FActiveDockControl := Value;
    if (AOldActiveSite <> nil) and (AOldActiveSite <> FActiveDockControl) then
      AOldActiveSite.DoActiveChanged(False);
    if FActiveDockControl <> nil then
      FActiveDockControl.DoActiveChanged(True);
    if AOldActiveSite <> FActiveDockControl then
      DoActiveDockControlChanged;
  end;
end;

procedure TdxDockingController.DoOnFontChanged(Sender: TObject);
begin
  DoFontChanged;
end;

procedure TdxDockingController.FloatFormsOnTop(AParentForm: TCustomForm);
var
  I: Integer;
  AControl: TdxFloatDockSite;
begin
  for I := 0 to DockControlCount - 1 do
  begin
    if DockControls[I].IsDesigning then exit;
    if DockControls[I] is TdxFloatDockSite then
    begin
      AControl := DockControls[I] as TdxFloatDockSite;
      if (AParentForm = nil) or (AParentForm = AControl.ParentForm) then
        AControl.FloatForm.SendOnTop;
    end;
  end;
end;

procedure TdxDockingController.FloatFormsOnTopMost(AParentForm: TCustomForm);
var
  I: Integer;
  AControl: TdxFloatDockSite;
begin
  for I := 0 to DockControlCount - 1 do
  begin
    if DockControls[I].IsDesigning then exit;
    if DockControls[I] is TdxFloatDockSite then
    begin
      AControl := DockControls[I] as TdxFloatDockSite;
      if (AParentForm = nil) or (AParentForm = AControl.ParentForm) then
        AControl.FloatForm.SendOnTopMost;
    end;
  end;
end;

procedure TdxDockingController.FloatFormsHide(AParentForm: TCustomForm);
var
  I: Integer;
  AControl: TdxFloatDockSite;
begin
  for I := 0 to DockControlCount - 1 do
  begin
    if DockControls[I] is TdxFloatDockSite then
    begin
      AControl := DockControls[I] as TdxFloatDockSite;
      if (AParentForm = nil) or (AParentForm = AControl.ParentForm) then
        if AControl.IsDesigning then
          ShowWindow(AControl.FloatForm.Handle, SW_HIDE)
        else PostMessage(AControl.FloatForm.Handle, WM_HIDEFORM, 0, 0);
    end;
  end;
end;

procedure TdxDockingController.FloatFormsShow(AParentForm: TCustomForm);
var
  I: Integer;
  AControl: TdxFloatDockSite;
begin
  for I := 0 to DockControlCount - 1 do
  begin
    if DockControls[I] is TdxFloatDockSite then
    begin
      AControl := DockControls[I] as TdxFloatDockSite;
      if not AControl.Visible then continue;
      if (AParentForm = nil) or (AParentForm = AControl.ParentForm) then
        if AControl.IsDesigning then
          ShowWindow(AControl.FloatForm.Handle, SW_SHOW)
        else AControl.FloatForm.Perform(WM_SHOWFORM, 0, 0);
    end;
  end;
end;

function TdxDockingController.IndexOfDockControl(AControl: TdxCustomDockControl): Integer;
begin
  Result := FDockControls.IndexOf(AControl);
end;

procedure TdxDockingController.RegisterDestroyedDockControl(AControl: TdxCustomDockControl);
begin
  FDestroyedDockControls.Add(AControl);
  PostMessage(FHandle, WM_DESTROYCONTROLS, 0, 0);
end;

procedure TdxDockingController.RegisterDockControl(AControl: TdxCustomDockControl);
begin
  FDockControls.Add(AControl);
end;

procedure TdxDockingController.UnregisterDockControl(AControl: TdxCustomDockControl);
begin
  if AControl = FDockingDockControl then
    FDockingDockControl := nil;
  if AControl = FResizingDockControl then
    FResizingDockControl := nil;
  FDockControls.Remove(AControl);
  FDestroyedDockControls.Remove(AControl);
  FInvalidRedraw.Remove(AControl);
  FInvalidNC.Remove(AControl);
  FInvalidNCBounds.Remove(AControl);
  if FActiveDockControl = AControl then
    FActiveDockControl := nil;
end;

procedure TdxDockingController.ClearLayout;
var
  I: Integer;
begin
  I := 0;
  while I < DockControlCount do
  begin
    if (DockControls[I] is TdxDockPanel) and (DockControls[I].ParentDockControl <> nil) then
    begin
      DockControls[I].UnDock;
      I := 0;
    end
    else Inc(I);
  end;
  SendMessage(FHandle, WM_DESTROYCONTROLS, 0, 0);
end;

procedure TdxDockingController.LoadControlFromCustomIni(AIniFlie: TCustomIniFile;
  AParentControl: TdxCustomDockControl; ASection: string);
var
  AControl: TdxCustomDockControl;
  AControlClass: TdxCustomDockControlClass;
  AParentForm: TCustomForm;
begin
  with AIniFlie do
  begin
    AParentForm := FindGlobalComponent(ReadString(ASection, 'ParentForm', '')) as TCustomForm;
    if AParentForm <> nil then
    begin
      AControl := AParentForm.FindComponent(ReadString(ASection, 'Name', '')) as TdxCustomDockControl;
      if AControl = nil then
      begin
        AControlClass := TdxCustomDockControlClass(FindClass(ReadString(ASection, 'ClassName', '')));
        if (AControlClass <> nil) then
        begin
          AControl := AControlClass.Create(AParentForm);
          AControl.Name := ReadString(ASection, 'Name', '');
        end;
      end;
      if AControl <> nil then
        AControl.LoadLayoutFromCustomIni(AIniFlie, AParentControl, ASection);
    end;
  end;
end;

procedure TdxDockingController.SaveControlToCustomIni(AIniFlie: TCustomIniFile;
  AControl: TdxCustomDockControl);
var
  ASection: string;
begin
  with AIniFlie do
  begin
    ASection := IntToStr(IndexOfDockControl(AControl));
    WriteString(ASection, 'ClassName', AControl.ClassName);
    WriteString(ASection, 'Name', AControl.Name);
    WriteString(ASection, 'ParentForm', AControl.ParentForm.Name);
    AControl.SaveLayoutToCustomIni(AIniFlie, ASection);
  end;
end;

function TdxDockingController.GetImages: TImageList;
begin
  if Manager <> nil then
    Result := Manager.Images
  else Result := nil;
end;

function TdxDockingController.GetOptions: TdxDockingOptions;
begin
  if Manager <> nil then
    Result := Manager.Options
  else Result := FOptions;
end;

function TdxDockingController.GetViewStyle: TdxDockingViewStyle;
begin
  if Manager <> nil then
    Result := Manager.ViewStyle
  else Result := FViewStyle;
end;

function TdxDockingController.GetColor: TColor;
begin
  if Manager <> nil then
    Result := Manager.Color
  else Result := FColor;
end;

function TdxDockingController.GetFont: TFont;
begin
  if Manager <> nil then
    Result := Manager.Font
  else Result := FFont;
end;

procedure TdxDockingController.SetColor(const Value: TColor);
begin
  if Manager <> nil then
    Manager.Color := Value
  else if FColor <> Value then
  begin
    FColor := Value;
    DoColorChanged;
  end;
end;

procedure TdxDockingController.SetFont(const Value: TFont);
begin
  if Manager <> nil then
    Manager.Font := Value
  else FFont.Assign(Value);
end;

procedure TdxDockingController.SetOptions(const Value: TdxDockingOptions);
var
  AOldOptions: TdxDockingOptions;
begin
  if Manager <> nil then
    Manager.Options := Value
  else if FOptions <> Value then
  begin
    AOldOptions := FOptions;
    FOptions := Value;
    DoOptionsChanged(AOldOptions, FOptions);
  end;
end;

procedure TdxDockingController.SetSelectionBrush(Value: TBrush);
begin
  FSelectionBrush.Assign(Value);
end;

procedure TdxDockingController.SetViewStyle(const Value: TdxDockingViewStyle);
begin
  if Manager <> nil then
    Manager.ViewStyle := Value
  else if FViewStyle <> Value then
  begin
    FViewStyle := Value;
    DoViewStyleChanged(True);
  end;
end;

{ TdxCustomDockControlProperties }

constructor TdxCustomDockControlProperties.Create(AOwner: TdxDockingManager);
begin
  FOwner := AOwner;
  FAllowDock := [dtClient, dtLeft, dtTop, dtRight, dtBottom];
  FAllowDockClients := [dtClient, dtLeft, dtTop, dtRight, dtBottom];
  FAllowFloating := True;
  FCaptionButtons := [cbClose, cbHide, cbMaximize];
  FColor := clBtnFace;
  FDockable := True;
  FFont := TFont.Create;
  FImageIndex := -1;
  FManagerColor := True;
  FManagerFont := True;
  FShowCaption := True;
  FShowHint := False;
  FTag := 0;
end;

destructor TdxCustomDockControlProperties.Destroy;
begin
  FFont.Free;
  inherited;
end;

procedure TdxCustomDockControlProperties.AssignTo(Dest: TPersistent);
var
  AControl: TdxCustomDockControl;
  AControlProperties: TdxCustomDockControlProperties;
begin
  if Dest is TdxCustomDockControl then
  begin
    AControl := Dest as TdxCustomDockControl;
    AControl.AllowDock := FAllowDock;
    AControl.AllowDockClients := FAllowDockClients;
    AControl.AllowFloating := FAllowFloating;
    AControl.Caption := FCaption;
    AControl.CaptionButtons := FCaptionButtons;
    AControl.Dockable := FDockable;
    AControl.ImageIndex := FImageIndex;
    AControl.ShowCaption := FShowCaption;
    AControl.Color := FColor;
    AControl.Cursor := FCursor;
    AControl.Font := FFont;
    AControl.Hint := FHint;
    AControl.ManagerColor := FManagerColor;
    AControl.ManagerFont := FManagerFont;
    AControl.PopupMenu := FPopupMenu;
    AControl.ShowHint := FShowHint;
    AControl.Tag := FTag;
  end
  else if Dest is TdxCustomDockControlProperties then
  begin
    AControlProperties := Dest as TdxCustomDockControlProperties;
    AControlProperties.AllowDock := FAllowDock;
    AControlProperties.AllowDockClients := FAllowDockClients;
    AControlProperties.AllowFloating := FAllowFloating;
    AControlProperties.Caption := FCaption;
    AControlProperties.CaptionButtons := FCaptionButtons;
    AControlProperties.Dockable := FDockable;
    AControlProperties.ImageIndex := FImageIndex;
    AControlProperties.ShowCaption := FShowCaption;
    AControlProperties.Color := FColor;
    AControlProperties.Cursor := FCursor;
    AControlProperties.Font := FFont;
    AControlProperties.Hint := FHint;
    AControlProperties.ManagerColor := FManagerColor;
    AControlProperties.ManagerFont := FManagerFont;
    AControlProperties.PopupMenu := FPopupMenu;
    AControlProperties.ShowHint := FShowHint;
    AControlProperties.Tag := FTag;
  end
  else inherited;
end;

function  TdxCustomDockControlProperties.GetOwner: TPersistent;
begin
  Result := FOwner;
end;

function TdxCustomDockControlProperties.IsColorStored: Boolean;
begin
  Result := not ManagerColor;
end;

function TdxCustomDockControlProperties.IsFontStored: Boolean;
begin
  Result := not ManagerFont;
end;

procedure TdxCustomDockControlProperties.SetColor(const Value: TColor);
begin
  if FColor <> Value then
  begin
    FColor := Value;
    if not (csLoading in FOwner.ComponentState)then
      FManagerColor := False;
  end;
end;

procedure TdxCustomDockControlProperties.SetFont(const Value: TFont);
begin
  FFont.Assign(Value);
  if not (csLoading in FOwner.ComponentState)then
    FManagerFont := False;
end;

procedure TdxCustomDockControlProperties.SetManagerColor(const Value: Boolean);
begin
  if FManagerColor <> Value then
  begin
    if Value and not (csLoading in FOwner.ComponentState) then
      FColor := FOwner.Color;
    FManagerColor := Value;
  end;
end;

procedure TdxCustomDockControlProperties.SetManagerFont(const Value: Boolean);
begin
  if FManagerFont <> Value then
  begin
    if Value and not (csLoading in FOwner.ComponentState) then
      FFont.Assign(FOwner.Font);
    FManagerFont := Value;
  end;
end;

{ TdxTabContainerDockSiteProperties }

constructor TdxTabContainerDockSiteProperties.Create(AOwner: TdxDockingManager);
begin
  inherited Create(AOwner);
  FTabsPosition := tctpBottom;
  FTabsScroll := True;
end;

procedure TdxTabContainerDockSiteProperties.AssignTo(Dest: TPersistent);
var
  AContainer: TdxTabContainerDockSite;
  AContainerProperties: TdxTabContainerDockSiteProperties;
begin
  if Dest is TdxTabContainerDockSite then
  begin
    AContainer := Dest as TdxTabContainerDockSite;
    AContainer.TabsPosition := FTabsPosition;
    AContainer.TabsScroll := FTabsScroll;
  end
  else if Dest is TdxTabContainerDockSiteProperties then
  begin
    AContainerProperties := Dest as TdxTabContainerDockSiteProperties;
    AContainerProperties.TabsPosition := FTabsPosition;
    AContainerProperties.TabsScroll := FTabsScroll;
  end;
  inherited;
end;

{ TdxDockingManager }

constructor TdxDockingManager.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FChangeLink := TChangeLink.Create;
  FChangeLink.OnChange := DoOnImagesChanged;
  FColor := clBtnFace;
  FDefaultSitesPropertiesList := TList.Create;
  CreateDefaultSitesProperties;
  FFont := TFont.Create;
  FFont.OnChange := DoOnFontChanged;
  FLookAndFeel := TcxLookAndFeel.Create(Self);
  FLookAndFeel.OnChanged := DoOnLFChanged;
  FOptions := [doActivateAfterDocking, doDblClickDocking, doFloatingOnTop, doTabContainerCanAutoHide,
    doTabContainerHasCaption, doSideContainerCanClose, doSideContainerCanAutoHide,
    doTabContainerCanInSideContainer];
  FUseDefaultSitesProperties := True;
  FViewStyle := vsStandard;
  dxDockingController.RegisterManager(Self);
end;

destructor TdxDockingManager.Destroy;
begin
  dxDockingController.UnregisterManager(Self);
  FLookAndFeel.Free;
  FFont.Free;
  DestroyDefaultSitesProperties;
  FDefaultSitesPropertiesList.Free;
  FChangeLink.Free;
  inherited;
end;

procedure TdxDockingManager.LoadLayoutFromIniFile(AFileName: string);
var
  AStream: TFileStream;
begin
{$IFDEF DELPHI6}
  AStream := TFileStream.Create(AFileName, fmOpenRead, fmShareDenyWrite);
{$ELSE}
  AStream := TFileStream.Create(AFileName, fmOpenRead or fmShareDenyWrite);
{$ENDIF}
  try
    LoadLayoutFromStream(AStream);
  finally
    AStream.Free;
  end;
end;

procedure TdxDockingManager.LoadLayoutFromRegistry(ARegistryPath: string);
var
  Storage: TRegistryIniFile;
begin
  Storage := TRegistryIniFile.Create(ARegistryPath);
  try
    dxDockingController.LoadLayoutFromCustomIni(Storage);
  finally
    Storage.Free;
  end;
end;

procedure TdxDockingManager.LoadLayoutFromStream(AStream: TStream);
var
  Storage: TMemIniFile;
  AStrings: TStringList;
begin
  Storage := TMemIniFile.Create('');
  AStrings := TStringList.Create;
  try
    AStrings.LoadFromStream(AStream);
    Storage.SetStrings(AStrings);
    dxDockingController.LoadLayoutFromCustomIni(Storage);
  finally
    AStrings.Free;
    Storage.Free;
  end;
end;

procedure TdxDockingManager.SaveLayoutToIniFile(AFileName: string);
var
  AStream: TFileStream;
begin
  if AFileName = '' then exit;
  if ExtractFileExt(AFileName) = '' then
    AFileName := ChangeFileExt(AFileName, '.ini');
{$IFDEF DELPHI6}
  AStream := TFileStream.Create(AFileName, fmCreate, fmShareExclusive);
{$ELSE}
  AStream := TFileStream.Create(AFileName, fmCreate or fmShareExclusive);
{$ENDIF}
  try
    SaveLayoutToStream(AStream);
  finally
    AStream.Free;
  end;
end;

procedure TdxDockingManager.SaveLayoutToRegistry(ARegistryPath: string);
var
  Storage: TRegistryIniFile;
begin
  if ARegistryPath = '' then exit;
  Storage := TRegistryIniFile.Create(ARegistryPath);
  try
    dxDockingController.SaveLayoutToCustomIni(Storage);
  finally
    Storage.Free;
  end;
end;

procedure TdxDockingManager.SaveLayoutToStream(AStream: TStream);
var
  Storage: TMemIniFile;
  AStrings: TStringList;
begin
  Storage := TMemIniFile.Create('');
  AStrings := TStringList.Create;
  try
    dxDockingController.SaveLayoutToCustomIni(Storage);
    Storage.GetStrings(AStrings);
    AStrings.SaveToStream(AStream);
  finally
    AStrings.Free;
    Storage.Free;
  end;
end;

procedure TdxDockingManager.Notification(AComponent: TComponent; Operation: TOperation);
var
  I: Integer;
begin
  inherited;
  if Operation = opRemove then
  begin
    if AComponent = Images then
      Images := nil;
    for I := 0 to DefaultSitesPropertiesCount - 1 do
      if AComponent = DefaultSitesProperties[I].PopupMenu then
        DefaultSitesProperties[I].PopupMenu := nil;
  end;
end;

procedure TdxDockingManager.Loaded;
begin
  inherited;
  UpdateDefaultSitesPropertiesColor;
  UpdateDefaultSitesPropertiesFont;
  dxDockingController.DoManagerChanged;
end;

function TdxDockingManager.IsLoading: Boolean;
begin
  Result := csLoading in ComponentState;
end;

procedure TdxDockingManager.DoColorChanged;
begin
  UpdateDefaultSitesPropertiesColor;
  dxDockingController.DoColorChanged;
end;

procedure TdxDockingManager.DoFontChanged;
begin
  UpdateDefaultSitesPropertiesFont;
  dxDockingController.DoFontChanged;
end;

procedure TdxDockingManager.CreateDefaultSitesProperties;
begin
  FDefaultSitesPropertiesList.Add(TdxLayoutDockSiteProperties.Create(Self));
  FDefaultSitesPropertiesList.Add(TdxFloatDockSiteProperties.Create(Self));
  FDefaultSitesPropertiesList.Add(TdxSideContainerDockSiteProperties.Create(Self));
  FDefaultSitesPropertiesList.Add(TdxSideContainerDockSiteProperties.Create(Self));
  FDefaultSitesPropertiesList.Add(TdxTabContainerDockSiteProperties.Create(Self));
end;

procedure TdxDockingManager.DestroyDefaultSitesProperties;
var
  I: Integer;
begin
  for I := 0 to FDefaultSitesPropertiesList.Count - 1 do
    TdxCustomDockControlProperties(FDefaultSitesPropertiesList[I]).Free;
  FDefaultSitesPropertiesList.Clear;
end;

procedure TdxDockingManager.UpdateDefaultSitesPropertiesColor;
var
  I: Integer;
begin
  for I := 0 to DefaultSitesPropertiesCount - 1 do
    if DefaultSitesProperties[I].ManagerColor then
    begin
      DefaultSitesProperties[I].Color := Color;
      DefaultSitesProperties[I].FManagerColor := True;
    end;
end;

procedure TdxDockingManager.UpdateDefaultSitesPropertiesFont;
var
  I: Integer;
begin
  for I := 0 to DefaultSitesPropertiesCount - 1 do
    if DefaultSitesProperties[I].ManagerFont then
    begin
      DefaultSitesProperties[I].Font := Font;
      DefaultSitesProperties[I].FManagerFont := True;
    end;
end;

procedure TdxDockingManager.DoOnImagesChanged(Sender: TObject);
begin
  if not IsLoading then
    dxDockingController.DoImagesChanged;
end;

procedure TdxDockingManager.DoOnFontChanged(Sender: TObject);
begin
  if not IsLoading then
    DoFontChanged;
end;

procedure TdxDockingManager.DoOnLFChanged(Sender: TcxLookAndFeel; AChangedValues: TcxLookAndFeelValues);
begin
  if not IsLoading and (ViewStyle = vsUseLookAndFeel) then
    dxDockingController.DoLookAndFeelChanged;
end;

function TdxDockingManager.IsDefaultSitePropertiesStored: Boolean;
begin
  Result := FUseDefaultSitesProperties;
end;

function TdxDockingManager.GetDefaultSiteProperties(Index: Integer): TdxCustomDockControlProperties;
begin
  if (0 <= Index) and (Index < FDefaultSitesPropertiesList.Count) then
    Result := TdxCustomDockControlProperties(FDefaultSitesPropertiesList[Index])
  else Result := nil;
end;

function TdxDockingManager.GetDefaultSitesPropertiesCount: Integer;
begin
  Result := FDefaultSitesPropertiesList.Count;
end;

function TdxDockingManager.GetDefaultLayoutSiteProperties: TdxLayoutDockSiteProperties;
begin
  Result := DefaultSitesProperties[0] as TdxLayoutDockSiteProperties;
end;

function TdxDockingManager.GetDefaultFloatSiteProperties: TdxFloatDockSiteProperties;
begin
  Result := DefaultSitesProperties[1] as TdxFloatDockSiteProperties;
end;

function TdxDockingManager.GetDefaultHorizContainerSiteProperties: TdxSideContainerDockSiteProperties;
begin
  Result := DefaultSitesProperties[2] as TdxSideContainerDockSiteProperties;
end;

function TdxDockingManager.GetDefaultVertContainerSiteProperties: TdxSideContainerDockSiteProperties;
begin
  Result := DefaultSitesProperties[3] as TdxSideContainerDockSiteProperties;
end;

function TdxDockingManager.GetDefaultTabContainerSiteProperties: TdxTabContainerDockSiteProperties;
begin
  Result := DefaultSitesProperties[4] as TdxTabContainerDockSiteProperties;
end;

procedure TdxDockingManager.SetColor(const Value: TColor);
begin
  if FColor <> Value then
  begin
    FColor := Value;
    if not IsLoading then
      DoColorChanged;
  end;
end;

procedure TdxDockingManager.SetDefaultLayoutSiteProperties(Value: TdxLayoutDockSiteProperties);
begin
  (DefaultSitesProperties[0] as TdxLayoutDockSiteProperties).Assign(Value);
end;

procedure TdxDockingManager.SetDefaultFloatSiteProperties(Value: TdxFloatDockSiteProperties);
begin
  (DefaultSitesProperties[1] as TdxFloatDockSiteProperties).Assign(Value);
end;

procedure TdxDockingManager.SetDefaultHorizContainerSiteProperties(Value: TdxSideContainerDockSiteProperties);
begin
  (DefaultSitesProperties[2] as TdxSideContainerDockSiteProperties).Assign(Value);
end;

procedure TdxDockingManager.SetDefaultVertContainerSiteProperties(Value: TdxSideContainerDockSiteProperties);
begin
  (DefaultSitesProperties[3] as TdxSideContainerDockSiteProperties).Assign(Value);
end;

procedure TdxDockingManager.SetDefaultTabContainerSiteProperties(Value: TdxTabContainerDockSiteProperties);
begin
  (DefaultSitesProperties[3] as TdxTabContainerDockSiteProperties).Assign(Value);
end;

procedure TdxDockingManager.SetFont(const Value: TFont);
begin
  FFont.Assign(Value);
end;

procedure TdxDockingManager.SetImages(const Value: TImageList);
begin
  if FImages <> Value then
  begin
    if (FImages <> nil) and not (csDestroying in  FImages.ComponentState) then
      FImages.UnRegisterChanges(FChangeLink);
    FImages := Value;
    if FImages <> nil then
      FImages.RegisterChanges(FChangeLink);
  end;
end;

procedure TdxDockingManager.SetLookAndFeel(Value: TcxLookAndFeel);
begin
  FLookAndFeel.Assign(Value);
end;

procedure TdxDockingManager.SetOptions(const Value: TdxDockingOptions);
var
  AOldOptions: TdxDockingOptions;
begin
  if FOptions <> Value then
  begin
    AOldOptions := FOptions;
    FOptions := Value;
    if not IsLoading then
      dxDockingController.DoOptionsChanged(AOldOptions, FOptions);
  end;
end;

procedure TdxDockingManager.SetViewStyle(const Value: TdxDockingViewStyle);
begin
  if FViewStyle <> Value then
  begin
    FViewStyle := Value;
    if not IsLoading then
      dxDockingController.DoViewStyleChanged(True);
  end;
end;

initialization
  RegisterClasses([TdxLayoutDockSite, TdxContainerDockSite, TdxTabContainerDockSite,
    TdxSideContainerDockSite, TdxVertContainerDockSite, TdxHorizContainerDockSite,
    TdxFloatDockSite, TdxDockSite, TdxDockingManager]);

finalization
  FDockingController.Free;
  FDockingController := nil;

end.
