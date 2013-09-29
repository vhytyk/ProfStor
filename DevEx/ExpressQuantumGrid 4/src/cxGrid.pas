{********************************************************************}
{                                                                    }
{       Developer Express Visual Component Library                   }
{       ExpressQuantumGrid                                           }
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
{   LICENSED TO DISTRIBUTE THE EXPRESSQUANTUMGRID AND ALL            }
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

unit cxGrid;

{$I cxGridVer.inc}

interface

uses
{$IFDEF VCL}
  Windows, Messages,
{$ELSE}
  Qt,
{$ENDIF}
{$IFDEF DELPHI6}
  Types,
{$ENDIF}
  Classes, Controls, Graphics, Forms, StdCtrls, ExtCtrls,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, cxControls, cxNavigator,
  cxCustomData,
  cxGridCommon, cxGridLevel, cxGridDetailsSite, cxGridCustomView;

const
(*{$IFDEF VCL}
  CM_DEFERUPDATES = WM_USER + 333;
{$ELSE}
  QEventType_CMDeferUpdates = QEventType_ClxUser + 333;
{$ENDIF}*)

  cxGridDefaultDragOpeningWaitTime = 500;

type
  TcxGridViewInfo = class;
  TcxCustomGrid = class;

  { changes }

  TcxGridLayoutChange = class(TcxCustomGridViewChange)
  public
    procedure Execute; override;
    function IsCompatibleWith(AChange: TcxCustomGridChange): Boolean; override;
  end;

  TcxGridSizeChange = class(TcxCustomGridViewChange)
  private
    FKeepMaster: Boolean;
    FUpdateGridViewOnly: Boolean;
  public
    constructor Create(AGridView: TcxCustomGridView;
      AUpdateGridViewOnly: Boolean = False; AKeepMaster: Boolean = False); reintroduce; virtual;
    procedure Execute; override;
    function IsCompatibleWith(AChange: TcxCustomGridChange): Boolean; override;
    function IsEqual(AChange: TcxCustomGridChange): Boolean; override;
    property KeepMaster: Boolean read FKeepMaster;
    property UpdateGridViewOnly: Boolean read FUpdateGridViewOnly
      write FUpdateGridViewOnly;
  end;

  TcxGridViewChange = class(TcxCustomGridViewChange)
  private
    FUpdateBounds: TRect;
  public
    constructor Create(AGridView: TcxCustomGridView;
      const AUpdateBounds: TRect); reintroduce; overload; virtual;
    constructor Create(AGridView: TcxCustomGridView); reintroduce; overload;
    procedure Execute; override;
    function IsCumulative: Boolean; override;
    property UpdateBounds: TRect read FUpdateBounds;
  end;

  { notification }

  TcxGridNotificationKind = (gnkFocusedViewChanged, gnkFocusedRecordChanged,
    gnkRecordCountChanged, gnkContextMenu, gnkCustomization, gnkKeyDown);
  TcxGridNotificationKinds = set of TcxGridNotificationKind;

  TcxCustomGridNotification = class
  protected
    function NotificationKinds: TcxGridNotificationKinds; virtual; abstract;
    procedure Notify(AKind: TcxGridNotificationKind; AData: Pointer = nil); virtual; abstract;
  end;

  { structure navigator }

  TcxCustomGridStructureNavigatorClass = class of TcxCustomGridStructureNavigator;

  TcxCustomGridStructureNavigator = class(TcxControl)
  private
    FGrid: TcxCustomGrid;
  protected
    procedure Changed; virtual;
    procedure FontChanged; override;
    function MayFocus: Boolean; override;

    function CalculateBoundsRect: TRect; virtual; abstract;
  public
    constructor Create(AGrid: TcxCustomGrid); reintroduce; virtual;
    procedure BeforeGridLoading; virtual;
    property Grid: TcxCustomGrid read FGrid;
  end;

  { handlers }

  TcxCustomGridHandler = class
  private
    FControl: TcxCustomGrid;
    function GetActiveController: TcxCustomGridController;
    function GetActiveGridView: TcxCustomGridView;
    function GetLookAndFeelPainter: TcxCustomLookAndFeelPainterClass;
    function GetViewInfo: TcxGridViewInfo;
  protected
    property ActiveController: TcxCustomGridController read GetActiveController;
    property ActiveGridView: TcxCustomGridView read GetActiveGridView;
    property LookAndFeelPainter: TcxCustomLookAndFeelPainterClass read GetLookAndFeelPainter;
    property ViewInfo: TcxGridViewInfo read GetViewInfo;
  public
    constructor Create(AControl: TcxCustomGrid); virtual;
    property Control: TcxCustomGrid read FControl;
  end;

  TcxGridDragOpenInfoTab = class(TcxCustomGridDragOpenInfo)
  public
    Level: TcxGridLevel;
    constructor Create(ALevel: TcxGridLevel); virtual;
    function Equals(AInfo: TcxCustomGridDragOpenInfo): Boolean; override;
    procedure Run; override;
  end;

  TcxGridControllerClass = class of TcxGridController;

  TcxGridController = class(TcxCustomGridHandler)
  private
    FDragOpenInfo: TcxCustomGridDragOpenInfo;
    FDragOpenTimer: TTimer;
    procedure DragOpenTimerHandler(Sender: TObject);
  public
    procedure DoCancelMode; virtual;
    procedure FocusChanged; virtual;

    procedure KeyDown(var Key: Word; Shift: TShiftState); dynamic;
    procedure KeyUp(var Key: Word; Shift: TShiftState); dynamic;

    function GetCursor(X, Y: Integer): TCursor; virtual;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); dynamic;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); dynamic;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); dynamic;

    procedure DragOver(Source: TObject; X, Y: Integer; State: TDragState;
      var Accept: Boolean); virtual;
    procedure EndDrag(Target: TObject; X, Y: Integer); virtual;
    procedure StartDrag(var DragObject: TDragObject); virtual;

    function GetDragOpenInfo(AHitTest: TcxCustomGridHitTest): TcxCustomGridDragOpenInfo; virtual;
    function IsDragOpenHitTest(AHitTest: TcxCustomGridHitTest;
      out ADragOpenInfo: TcxCustomGridDragOpenInfo): Boolean;
    procedure StartDragOpen(ADragOpenInfo: TcxCustomGridDragOpenInfo);
    procedure StopDragOpen;
    property DragOpenInfo: TcxCustomGridDragOpenInfo read FDragOpenInfo;

    procedure DragAndDrop(const P: TPoint; var Accepted: Boolean); dynamic;
    procedure EndDragAndDrop(Accepted: Boolean); dynamic;
    function GetDragAndDropObjectClass: TcxDragAndDropObjectClass; virtual;
    function StartDragAndDrop(const P: TPoint): Boolean; dynamic;
  end;

  TcxGridPainterClass = class of TcxGridPainter;

  TcxGridPainter = class(TcxCustomGridHandler)
  private
    function GetCanvas: TcxCanvas;
  protected
    procedure DrawDetailsSite; virtual;
    procedure DrawEmptyArea; virtual;
  public
    procedure Invalidate(AInvalidateDetails: Boolean); overload; virtual;
    procedure Invalidate(const R: TRect); overload; virtual;
    procedure Paint; virtual;
    property Canvas: TcxCanvas read GetCanvas;
  end;

  TcxGridTopDetailsSiteViewInfoClass = class of TcxGridTopDetailsSiteViewInfo;

  TcxGridTopDetailsSiteViewInfo = class(TcxCustomGridDetailsSiteViewInfo)
  private
    function GetControl: TcxCustomGrid;
  protected
    function CalculateHeight: Integer; override;
    function CalculateWidth: Integer; override;
    function GetActiveGridView: TcxCustomGridView; override;
    function GetActiveLevel: TcxGridLevel; override;
    function GetCanvas: TcxCanvas; override;
    function GetLookAndFeelPainter: TcxCustomLookAndFeelPainterClass; override;
    function GetMaxHeight: Integer; override;
    function GetMaxWidth: Integer; override;
    procedure InitTabHitTest(AHitTest: TcxGridDetailsSiteTabHitTest); override;
    property Control: TcxCustomGrid read GetControl;
  public
    procedure ChangeActiveTab(ALevel: TcxGridLevel); override;
    procedure VisibilityChanged(AVisible: Boolean); override;
  end;

  TcxGridViewInfoClass = class of TcxGridViewInfo;

  TcxGridViewInfo = class(TcxCustomGridHandler)
  private
    FDetailsSiteViewInfo: TObject;
    function GetBounds: TRect;
    function GetClientBounds: TRect;
    function GetEmptyAreaColor: TColor;
  protected
    procedure CreateViewInfos; virtual;
    procedure DestroyViewInfos; virtual;
    function GetDetailsSiteViewInfoClass: TClass; virtual;
    procedure RecreateViewInfos;
  public
    constructor Create(AControl: TcxCustomGrid); override;
    destructor Destroy; override;
    procedure Calculate; virtual;
    function GetHitTest(X, Y: Integer): TcxCustomGridHitTest; virtual;
    property Bounds: TRect read GetBounds;
    property ClientBounds: TRect read GetClientBounds;
    property DetailsSiteViewInfo: TObject read FDetailsSiteViewInfo;
    property EmptyAreaColor: TColor read GetEmptyAreaColor;
  end;

  { controls }

  TcxGridActiveTabChangedEvent = procedure(Sender: TcxCustomGrid; ALevel: TcxGridLevel) of object;
  TcxGridFocusedViewChangedEvent = procedure(Sender: TcxCustomGrid;
    APrevFocusedView, AFocusedView: TcxCustomGridView) of object;
  TcxGridLayoutChangedEvent = procedure(Sender: TcxCustomGrid; AGridView: TcxCustomGridView) of object;

  TcxCustomGrid = class(TcxControl, IcxNavigator)
  private
    FActiveLevel: TcxGridLevel;
    FChanges: TList;
    FChangesStack: TList;
    FController: TcxGridController;
    FDragOpening: Boolean;
    FDragOpeningWaitTime: Integer;
    FFocusedView: TcxCustomGridView;
    FIsPopupControl: Boolean;
    FLastFocused: Boolean;
    FLevels: TcxGridLevel;
    FNavigatorNotifier: TcxNavigatorControlNotifier;
    FNotifications: TList;
    FPainter: TcxGridPainter;
    FProcessingChangesStack: Boolean;
    FStructureNavigator: TcxCustomGridStructureNavigator;
    FTabStop: Boolean;
    FUpdateLockCount: Integer;
    FViewInfo: TcxGridViewInfo;
    FViews: TList;
    FOnActiveTabChanged: TcxGridActiveTabChangedEvent;
    FOnFocusedViewChanged: TcxGridFocusedViewChangedEvent;
    FOnLayoutChanged: TcxGridLayoutChangedEvent;
    FSubClassEvents: TNotifyEvent;

    function GetActiveView: TcxCustomGridView;
    function GetFocusedViewNavigator: IcxNavigator;
    function GetView(Index: Integer): TcxCustomGridView;
    function GetViewCount: Integer;
    function GetRootLevelOptions: TcxGridLevelOptions;
    function GetRootLevelStyles: TcxGridLevelStyles;
    function GetUpdateLocked: Boolean;
    procedure SetActiveLevel(Value: TcxGridLevel);
    procedure SetDragOpeningWaitTime(Value: Integer);
    procedure SetFocusedView(Value: TcxCustomGridView);
    procedure SetLevels(Value: TcxGridLevel);
    procedure SetRootLevelOptions(Value: TcxGridLevelOptions);
    procedure SetRootLevelStyles(Value: TcxGridLevelStyles);
    procedure SetTabStop(Value: Boolean);

    procedure AddView(AView: TcxCustomGridView);
    procedure RemoveView(AView: TcxCustomGridView);
    procedure DestroyViews;

    procedure DestroyChanges(AChanges: TList);
    procedure DestroyViewChanges(AView: TcxCustomGridView);

    procedure CreateLevels;

  {$IFDEF VCL}
    //procedure CMDeferUpdates(var Message: TMessage); message CM_DEFERUPDATES;
  {$ENDIF}
  protected
    // IcxNavigator
    function IcxNavigator.IsBof = NavigatorIsBof;
    function IcxNavigator.IsEof = NavigatorIsEof;
    function IcxNavigator.CanEdit = NavigatorCanEdit;
    function IcxNavigator.CanDelete = NavigatorCanDelete;
    function IcxNavigator.CanInsert = NavigatorCanInsert;
    procedure IcxNavigator.ClearBookmark = NavigatorClearBookmark;
    function IcxNavigator.IsEditing = NavigatorIsEditing;
    function IcxNavigator.IsBookmarkAvailable = NavigatorIsBookmarkAvailable;
    procedure IcxNavigator.DoAction = NavigatorDoAction;
    function IcxNavigator.GetNotifier = NavigatorGetNotifier;
    function IcxNavigator.IsActionSupported = NavigatorIsActionSupported;
    function NavigatorIsBof: Boolean;
    function NavigatorIsEof: Boolean;
    function NavigatorCanEdit: Boolean;
    function NavigatorCanDelete: Boolean;
    function NavigatorCanInsert: Boolean;
    function NavigatorIsEditing: Boolean;
    procedure NavigatorClearBookmark;
    function NavigatorIsBookmarkAvailable: Boolean;
    procedure NavigatorDoAction(AButtonIndex: Integer);
    function NavigatorGetNotifier: TcxNavigatorControlNotifier;
    function NavigatorIsActionSupported(AButtonIndex: Integer): Boolean;

    procedure AddChildComponent(AComponent: TcxControlChildComponent); override;
    procedure RemoveChildComponent(AComponent: TcxControlChildComponent); override;

    procedure BoundsChanged; override;
    procedure DoCancelMode; override;
  (*{$IFNDEF VCL}
    function EventFilter(Sender: QObjectH; Event: QEventH): Boolean; override;
  {$ENDIF}*)
    procedure FocusChanged; override;
    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
    function GetCursor(X, Y: Integer): TCursor; override;
    function GetDesignHitTest(X, Y: Integer; Shift: TShiftState): Boolean; override;
    function GetIsFocused: Boolean; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyUp(var Key: Word; Shift: TShiftState); override;
    procedure Loaded; override;
    function MayFocus: Boolean; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure LookAndFeelChanged(Sender: TcxLookAndFeel; AChangedValues: TcxLookAndFeelValues); override;
    procedure Paint; override;
    procedure ReadState(Reader: TReader); override;
    procedure SetName(const NewName: TComponentName); override;

    procedure DragAndDrop(const P: TPoint; var Accepted: Boolean); override;
    procedure EndDragAndDrop(Accepted: Boolean); override;
    function GetDragAndDropObjectClass: TcxDragAndDropObjectClass; override;
    function StartDragAndDrop(const P: TPoint): Boolean; override;

    procedure DoEndDrag(Target: TObject; X, Y: Integer); override;
    procedure DoStartDrag(var DragObject: TDragObject); override;
    procedure DragOver(Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean); override;

    procedure CreateHandlers; virtual;
    procedure DestroyHandlers; virtual;

    procedure DoActiveTabChanged(ALevel: TcxGridLevel); virtual;
    procedure DoChange(AGridChange: TcxCustomGridChange);
    procedure DoLayoutChanged(AGridView: TcxCustomGridView); virtual;
    procedure DoProcessChangesStack;
    procedure DoUpdate(AChanges: TList);
    procedure FocusedViewChanged(APrevFocusedView, AFocusedView: TcxCustomGridView); virtual;
    function GetControllerClass: TcxGridControllerClass; virtual;
    function GetLevelsClass: TcxGridLevelClass; virtual;
    function GetPainterClass: TcxGridPainterClass; virtual;
    function GetViewInfoClass: TcxGridViewInfoClass; virtual;
    procedure LevelChanged(ALevel: TcxGridLevel; AChangeKind: TcxGridLevelChangeKind);
    procedure RefreshNavigators;
    procedure StructureNavigatorChanged;
    procedure ViewChanged(AView: TcxCustomGridView; AChangeKind: TcxGridViewChangeKind);

    procedure UpdateFocusing(AChildFocused: Boolean);
    property LastFocused: Boolean read FLastFocused;

    property FocusedViewNavigator: IcxNavigator read GetFocusedViewNavigator;
    property IsPopupControl: Boolean read FIsPopupControl write FIsPopupControl;
    property NavigatorNotifier: TcxNavigatorControlNotifier read FNavigatorNotifier;
    property StructureNavigator: TcxCustomGridStructureNavigator read FStructureNavigator;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Invalidate(AHardUpdate: Boolean = False); reintroduce;

    procedure BeginUpdate;
    procedure CancelUpdate;
    procedure Changed(AGridChange: TcxCustomGridChange);
    procedure CheckFocusedView;
    procedure EndUpdate;
    procedure LayoutChanged; virtual;
    procedure SizeChanged; virtual;
    property UpdateLocked: Boolean read GetUpdateLocked;

    function CreateView(AViewClass: TcxCustomGridViewClass): TcxCustomGridView;
    function ViewExists(AView: TcxCustomGridView): Boolean;

    procedure RegisterNotification(ANotification: TcxCustomGridNotification);
    procedure UnregisterNotification(ANotification: TcxCustomGridNotification);
    procedure SendNotifications(AKind: TcxGridNotificationKind; AData: Pointer = nil);

    property ActiveView: TcxCustomGridView read GetActiveView;
    property ActiveLevel: TcxGridLevel read FActiveLevel write SetActiveLevel;
    property BorderStyle default cxcbsDefault;
    property Controller: TcxGridController read FController;
    property DragOpening: Boolean read FDragOpening write FDragOpening default True;
    property DragOpeningWaitTime: Integer read FDragOpeningWaitTime write SetDragOpeningWaitTime
      default cxGridDefaultDragOpeningWaitTime;
    property FocusedView: TcxCustomGridView read FFocusedView write SetFocusedView;
    property Font;
    property Levels: TcxGridLevel read FLevels write SetLevels;
    property LookAndFeel;
    property LookAndFeelPainter;
    property Painter: TcxGridPainter read FPainter;
    property RootLevelOptions: TcxGridLevelOptions read GetRootLevelOptions write SetRootLevelOptions;
    property RootLevelStyles: TcxGridLevelStyles read GetRootLevelStyles write SetRootLevelStyles;
    property TabStop: Boolean read FTabStop write SetTabStop default True;
    property ViewCount: Integer read GetViewCount;
    property ViewInfo: TcxGridViewInfo read FViewInfo;
    property Views[Index: Integer]: TcxCustomGridView read GetView;
    property OnActiveTabChanged: TcxGridActiveTabChangedEvent read FOnActiveTabChanged write FOnActiveTabChanged;
    property OnFocusedViewChanged: TcxGridFocusedViewChangedEvent read FOnFocusedViewChanged write FOnFocusedViewChanged;
    property OnLayoutChanged: TcxGridLayoutChangedEvent read FOnLayoutChanged write FOnLayoutChanged;
  published    
    property RootLevelStylesEvents: TNotifyEvent read FSubClassEvents write FSubClassEvents;
  end;

  TcxGrid = class(TcxCustomGrid)
  published
    property Align;
    property Anchors;
  {$IFDEF DELPHI6}
  {$IFDEF VCL}
    property BevelEdges;
    property BevelInner;
    property BevelOuter;
    property BevelKind;
    property BevelWidth;
    property BorderWidth;
  {$ENDIF}
  {$ENDIF}
    property BorderStyle;
    //property Color;
    property Constraints;
  {$IFDEF VCL}
    property DragCursor;
    property DragKind;
  {$ENDIF}  
    property DragMode;
    property DragOpening;
    property DragOpeningWaitTime;
    property Enabled;
    property Font;
    //property ParentColor;
    property ParentFont;
    property PopupMenu;
    property TabOrder;
    property TabStop;
    property Visible;

    property OnClick;
  {$IFDEF DELPHI5}
    property OnContextPopup;
  {$ENDIF}
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
  {$IFDEF VCL}
    property OnEndDock;
  {$ENDIF}  
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseWheelDown;
    property OnMouseWheelUp;
    property OnResize;
  {$IFDEF VCL}
    property OnStartDock;
  {$ENDIF}  
    property OnStartDrag;

    property LookAndFeel;
    property RootLevelOptions;
    property RootLevelStyles;

    property OnActiveTabChanged;
    property OnFocusedViewChanged;
    property OnLayoutChanged;
    property OnMouseEnter;
    property OnMouseLeave;
  end;

  { TcxGridViewRepository }

  TcxGridViewRepository = class(TComponent)  {5}
  private
    FItems: TList;
    function GetCount: Integer;
    function GetItem(Index: Integer): TcxCustomGridView;
    procedure DestroyItems;
  protected
    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;

    procedure AddItem(AItem: TcxCustomGridView);
    procedure RemoveItem(AItem: TcxCustomGridView);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function CreateItem(AItemClass: TcxCustomGridViewClass): TcxCustomGridView;
    property Count: Integer read GetCount;
    property Items[Index: Integer]: TcxCustomGridView read GetItem; default;
  end;

var
  cxGridStructureNavigatorClass: TcxCustomGridStructureNavigatorClass;

function GetParentGrid(AControl: TControl): TcxCustomGrid;

implementation

uses
{$IFNDEF DELPHI5}
  cxClasses,
{$ENDIF}
  SysUtils, cxGridCustomTableView;

type
  TcxCustomGridViewAccess = class(TcxCustomGridView);

{ TcxGridLayoutChange }

procedure TcxGridLayoutChange.Execute;
begin
  if GridView <> nil then
    with TcxCustomGridViewAccess(GridView) do
      if Changeable and not IsRectEmpty(Site.BoundsRect) then
      begin
        ViewInfo.MainCalculate(Site.BoundsRect);
        Painter.Invalidate;
      end
      else
  else
    with TcxCustomGrid(Control) do
      if ViewInfo <> nil then
      begin
        ViewInfo.Calculate;
        Painter.Invalidate(True);
      end;
  if Control <> nil then  {7}
    TcxCustomGrid(Control).DoLayoutChanged(GridView);
end;

function TcxGridLayoutChange.IsCompatibleWith(AChange: TcxCustomGridChange): Boolean;
begin                                         {1}
  Result := inherited IsCompatibleWith(AChange) or
    (AChange is TcxGridLayoutChange) and
      ((TcxGridLayoutChange(AChange).GridView = nil) or
       (GridView <> nil) and GridView.HasAsMaster(TcxGridLayoutChange(AChange).GridView)) or
    (AChange is TcxGridSizeChange) and
      ((TcxGridSizeChange(AChange).GridView = nil) or
       (GridView <> nil) and GridView.HasAsMaster(TcxGridSizeChange(AChange).GridView));
end;

{ TcxGridSizeChange }

constructor TcxGridSizeChange.Create(AGridView: TcxCustomGridView;
  AUpdateGridViewOnly: Boolean = False; AKeepMaster: Boolean = False);
begin
  inherited Create(AGridView);
  FUpdateGridViewOnly := AUpdateGridViewOnly;
  FKeepMaster := AKeepMaster;
end;

procedure TcxGridSizeChange.Execute;
begin
  if GridView = nil then
    with TcxCustomGrid(Control) do
      if ActiveView <> nil then
        ActiveView.SizeChanged(False, FKeepMaster)
      else
        LayoutChanged
  else
    with TcxCustomGridViewAccess(GridView) do
      if Changeable then
      begin
        ViewInfoCache.UnassignValues(FKeepMaster);
        if FUpdateGridViewOnly and FKeepMaster then
          LayoutChanged
        else
          if MasterGridView = nil then
            if Control = nil then
              LayoutChanged
            else
              TcxCustomGrid(Control).LayoutChanged
          else
            if not MasterGridView.SizeChanged(False, FKeepMaster) then
              LayoutChanged;
      end;
end;

function TcxGridSizeChange.IsCompatibleWith(AChange: TcxCustomGridChange): Boolean;
begin {1}
  Result := inherited IsCompatibleWith(AChange) or
    (AChange is TcxGridDataChange) and (TcxGridDataChange(AChange).GridView = GridView);
end;

function TcxGridSizeChange.IsEqual(AChange: TcxCustomGridChange): Boolean;
begin
  Result := inherited IsEqual(AChange) and
    (FUpdateGridViewOnly = TcxGridSizeChange(AChange).UpdateGridViewOnly);
end;

{ TcxGridViewChange }

constructor TcxGridViewChange.Create(AGridView: TcxCustomGridView;
  const AUpdateBounds: TRect);
begin
  inherited Create(AGridView);
  FUpdateBounds := AUpdateBounds;
end;

constructor TcxGridViewChange.Create(AGridView: TcxCustomGridView);
begin
  Create(AGridView, Rect(0, 0, 0, 0));
end;

procedure TcxGridViewChange.Execute;
begin
  if IsRectEmpty(FUpdateBounds) then
    GridView.Painter.Invalidate
  else
    GridView.Painter.Invalidate(FUpdateBounds);
end;

function TcxGridViewChange.IsCumulative: Boolean;
begin
  Result := False;
end;

{ TcxCustomGridStructureNavigator }

constructor TcxCustomGridStructureNavigator.Create(AGrid: TcxCustomGrid);
begin
  inherited Create(nil);
  FGrid := AGrid;
  Parent := FGrid;
end;

procedure TcxCustomGridStructureNavigator.Changed;
begin
  BoundsRect := CalculateBoundsRect;
  BringToFront;
  Invalidate;
end;

procedure TcxCustomGridStructureNavigator.FontChanged;
begin
  inherited;
  Changed;
end;

function TcxCustomGridStructureNavigator.MayFocus: Boolean;
begin
  Result := False;
end;

procedure TcxCustomGridStructureNavigator.BeforeGridLoading;
begin
end;

{ TcxCustomGridHandler }

constructor TcxCustomGridHandler.Create(AControl: TcxCustomGrid);
begin
  inherited Create;
  FControl := AControl;
end;

function TcxCustomGridHandler.GetActiveController: TcxCustomGridController;
begin
  if ActiveGridView <> nil then
    Result := ActiveGridView.Controller
  else
    Result := nil;
end;

function TcxCustomGridHandler.GetActiveGridView: TcxCustomGridView;
begin
  Result := FControl.ActiveView;
end;

function TcxCustomGridHandler.GetLookAndFeelPainter: TcxCustomLookAndFeelPainterClass;
begin
  Result := FControl.LookAndFeelPainter;
end;

function TcxCustomGridHandler.GetViewInfo: TcxGridViewInfo;
begin
  Result := FControl.ViewInfo;
end;

{ TcxGridDragOpenInfoTab }

constructor TcxGridDragOpenInfoTab.Create(ALevel: TcxGridLevel);
begin
  inherited Create;
  Level := ALevel;
end;

function TcxGridDragOpenInfoTab.Equals(AInfo: TcxCustomGridDragOpenInfo): Boolean;
begin
  Result := inherited Equals(AInfo) and
    (Level = TcxGridDragOpenInfoTab(AInfo).Level);
end;

procedure TcxGridDragOpenInfoTab.Run;
begin
  Level.Active := True;
end;

{ TcxGridController }

procedure TcxGridController.DragOpenTimerHandler(Sender: TObject);
begin
  try
    FDragOpenInfo.Run;
  finally
    StopDragOpen;
  end;
end;

procedure TcxGridController.DoCancelMode;
begin
  if ActiveController <> nil then
    ActiveController.DoCancelMode;
end;

procedure TcxGridController.FocusChanged;
begin
  if ActiveController <> nil then
    ActiveController.DoControlFocusChanged;
end;

procedure TcxGridController.KeyDown(var Key: Word; Shift: TShiftState);
begin
{  if FocusedGridView <> nil then
    FocusedGridView.Controller.KeyDown(Key, Shift);}
end;

procedure TcxGridController.KeyUp(var Key: Word; Shift: TShiftState);
begin
{  if FocusedGridView <> nil then
    FocusedGridView.Controller.KeyUp(Key, Shift);}
end;

function TcxGridController.GetCursor(X, Y: Integer): TCursor;
begin
{  if ActiveController <> nil then
    Result := ActiveController.GetCursor(X, Y)
  else}
    Result := crDefault;
end;

procedure TcxGridController.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  AHitTest: TcxCustomGridHitTest;
begin
  AHitTest := ViewInfo.GetHitTest(X, Y);
  if AHitTest.ViewInfo <> nil then
    AHitTest.ViewInfo.MouseDown(AHitTest, Button, Shift);
end;

procedure TcxGridController.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
{  if ActiveController <> nil then
    ActiveController.MouseMove(Shift, X, Y);}
end;

procedure TcxGridController.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
{  if ActiveController <> nil then
    ActiveController.MouseUp(Button, Shift, X, Y);}
  if Button = mbRight then
    Control.SendNotifications(gnkContextMenu);
end;

procedure TcxGridController.DragOver(Source: TObject; X, Y: Integer; State: TDragState;
  var Accept: Boolean);

  procedure ProcessOpening;
  var
    AHitTest: TcxCustomGridHitTest;
    ADragOpenInfo: TcxCustomGridDragOpenInfo;
  begin
    AHitTest := ViewInfo.GetHitTest(X, Y);
    if (State <> dsDragLeave) and IsDragOpenHitTest(AHitTest, ADragOpenInfo) then
      StartDragOpen(ADragOpenInfo)
    else
      StopDragOpen;
  end;

begin
  if Control.DragOpening then
    ProcessOpening;
end;

procedure TcxGridController.EndDrag(Target: TObject; X, Y: Integer);
begin
  StopDragOpen;
end;

procedure TcxGridController.StartDrag(var DragObject: TDragObject);
begin
end;

function TcxGridController.GetDragOpenInfo(AHitTest: TcxCustomGridHitTest): TcxCustomGridDragOpenInfo;
begin
  if AHitTest.HitTestCode = htTab then
    with TcxGridDetailsSiteTabHitTest(AHitTest) do
      Result := TcxGridDragOpenInfoTab.Create(Level)
  else
    Result := nil;
end;

function TcxGridController.IsDragOpenHitTest(AHitTest: TcxCustomGridHitTest;
  out ADragOpenInfo: TcxCustomGridDragOpenInfo): Boolean;
begin
  ADragOpenInfo := GetDragOpenInfo(AHitTest);
  Result := ADragOpenInfo <> nil;
end;

procedure TcxGridController.StartDragOpen(ADragOpenInfo: TcxCustomGridDragOpenInfo);
begin
  if (FDragOpenInfo <> nil) and FDragOpenInfo.Equals(ADragOpenInfo) then
  begin
    ADragOpenInfo.Free;
    Exit;
  end;
  FDragOpenInfo.Free;
  FDragOpenInfo := ADragOpenInfo;
  if FDragOpenTimer = nil then
  begin
    FDragOpenTimer := TTimer.Create(nil);
    with FDragOpenTimer do
    begin
      Interval := Control.DragOpeningWaitTime;
      OnTimer := DragOpenTimerHandler;
    end;
  end
  else
    with FDragOpenTimer do
    begin
      Enabled := False;
      Enabled := True;
    end;
end;

procedure TcxGridController.StopDragOpen;
begin
  FreeAndNil(FDragOpenTimer);
  FreeAndNil(FDragOpenInfo);
end;

procedure TcxGridController.DragAndDrop(const P: TPoint; var Accepted: Boolean);
begin
{  if ActiveController <> nil then
    ActiveController.DragAndDrop(P, Accepted);}
end;

procedure TcxGridController.EndDragAndDrop(Accepted: Boolean);
begin
{  if ActiveController <> nil then
    ActiveController.EndDragAndDrop(Accepted);}
end;

function TcxGridController.GetDragAndDropObjectClass: TcxDragAndDropObjectClass;
begin
  {if ActiveController <> nil then
    Result := ActiveController.GetDragAndDropObjectClass
  else}
    Result := nil;
end;

function TcxGridController.StartDragAndDrop(const P: TPoint): Boolean;
begin
  {if ActiveController <> nil then
    Result := ActiveController.StartDragAndDrop(P)
  else}
    Result := False;
end;

{ TcxGridPainter }

function TcxGridPainter.GetCanvas: TcxCanvas;
begin
  Result := Control.ActiveCanvas;
end;

procedure TcxGridPainter.DrawDetailsSite;
begin
  with TcxGridTopDetailsSiteViewInfo(ViewInfo.DetailsSiteViewInfo) do
    if Visible then Paint(Self.Canvas);
end;

procedure TcxGridPainter.DrawEmptyArea;
begin
  Canvas.Brush.Color := ViewInfo.EmptyAreaColor;
  Canvas.FillRect(ViewInfo.ClientBounds);
end;

procedure TcxGridPainter.Invalidate(AInvalidateDetails: Boolean);
var
  I: Integer;
  AControl: TControl;
begin
  Control.Invalidate;
  if AInvalidateDetails then
    for I := 0 to Control.ControlCount - 1 do
    begin
      AControl := Control.Controls[I];
      if AControl is TcxGridSite then
        AControl.Invalidate;
    end;
end;

procedure TcxGridPainter.Invalidate(const R: TRect);
begin
  Control.InvalidateRect(R, False);
end;

procedure TcxGridPainter.Paint;
begin
  DrawDetailsSite;
  DrawEmptyArea;
end;

{ TcxGridTopDetailsSiteViewInfo }

function TcxGridTopDetailsSiteViewInfo.GetControl: TcxCustomGrid;
begin
  Result := TcxCustomGrid(Level.Control);
end;

function TcxGridTopDetailsSiteViewInfo.CalculateHeight: Integer;
begin
  Result := MaxHeight;
end;

function TcxGridTopDetailsSiteViewInfo.CalculateWidth: Integer;
begin
  Result := MaxWidth;
end;

function TcxGridTopDetailsSiteViewInfo.GetActiveGridView: TcxCustomGridView;
begin
  Result := Control.ActiveView;
end;

function TcxGridTopDetailsSiteViewInfo.GetActiveLevel: TcxGridLevel;
begin
  Result := Control.ActiveLevel;
end;

function TcxGridTopDetailsSiteViewInfo.GetCanvas: TcxCanvas;
begin
  Result := Control.Painter.Canvas;
end;

function TcxGridTopDetailsSiteViewInfo.GetLookAndFeelPainter: TcxCustomLookAndFeelPainterClass;
begin
  Result := Control.LookAndFeelPainter;
end;

function TcxGridTopDetailsSiteViewInfo.GetMaxHeight: Integer;
begin
  with Control.ViewInfo.ClientBounds do
    Result := Bottom - Top;
end;

function TcxGridTopDetailsSiteViewInfo.GetMaxWidth: Integer;
begin
  with Control.ViewInfo.ClientBounds do
    Result := Right - Left;
end;

procedure TcxGridTopDetailsSiteViewInfo.InitTabHitTest(AHitTest: TcxGridDetailsSiteTabHitTest);
begin
  AHitTest.Owner := Control;
end;

procedure TcxGridTopDetailsSiteViewInfo.ChangeActiveTab(ALevel: TcxGridLevel);
begin
  Control.ActiveLevel := ALevel;
end;

procedure TcxGridTopDetailsSiteViewInfo.VisibilityChanged(AVisible: Boolean);
begin
  if not Control.IsDestroying then inherited;
end;

{ TcxGridViewInfo }

constructor TcxGridViewInfo.Create(AControl: TcxCustomGrid);
begin
  inherited;
  CreateViewInfos;
end;

destructor TcxGridViewInfo.Destroy;
begin
  DestroyViewInfos;
  inherited;
end;

function TcxGridViewInfo.GetBounds: TRect;
begin
  Result := Control.Bounds;
end;

function TcxGridViewInfo.GetClientBounds: TRect;
begin
  Result := Control.ClientBounds;
end;

function TcxGridViewInfo.GetEmptyAreaColor: TColor;
begin
  Result := Control.Color;
end;

procedure TcxGridViewInfo.CreateViewInfos;
begin
  FDetailsSiteViewInfo :=
    TcxGridTopDetailsSiteViewInfoClass(GetDetailsSiteViewInfoClass).Create(Control.Levels);
end;

procedure TcxGridViewInfo.DestroyViewInfos;
begin
  FDetailsSiteViewInfo.Free;
end;

function TcxGridViewInfo.GetDetailsSiteViewInfoClass: TClass;
begin
  Result := TcxGridTopDetailsSiteViewInfo;
end;

procedure TcxGridViewInfo.RecreateViewInfos;
begin
  DestroyViewInfos;
  CreateViewInfos;
end;

procedure TcxGridViewInfo.Calculate;
begin
  RecreateViewInfos;
  with ClientBounds, TcxGridTopDetailsSiteViewInfo(FDetailsSiteViewInfo) do
    if Visible then Calculate(Left, Top);
end;

function TcxGridViewInfo.GetHitTest(X, Y: Integer): TcxCustomGridHitTest;
begin
  Result := TcxGridTopDetailsSiteViewInfo(FDetailsSiteViewInfo).GetHitTest(Point(X, Y));
  if Result = nil then
    Result := TcxGridNoneHitTest.Instance(Point(X, Y));
end;

{ TcxCustomGrid }

constructor TcxCustomGrid.Create(AOwner: TComponent);
begin
  inherited;
  BorderStyle := cxcbsDefault;
  FDragOpening := True;
  FDragOpeningWaitTime := cxGridDefaultDragOpeningWaitTime;
  FNotifications := TList.Create;
  FViews := TList.Create;
  FChanges := TList.Create;
  FChangesStack := TList.Create;
  FTabStop := True;
  CreateLevels;
  CreateHandlers;
  Width := 250;
  Height := 200;
end;

destructor TcxCustomGrid.Destroy;
begin
  //Levels := nil;
  DestroyHandlers;
  Levels := nil;
  DestroyViews;
  FViews.Free;
  FreeAndNil(FNotifications);
  DestroyChanges(FChangesStack);
  FreeAndNil(FChangesStack);
  FreeAndNil(FChanges);
  inherited;
end;

function TcxCustomGrid.GetActiveView: TcxCustomGridView;
begin
  if FActiveLevel = nil then
    Result := nil
  else
    Result := FActiveLevel.GridView;
end;

function TcxCustomGrid.GetFocusedViewNavigator: IcxNavigator;
begin
  if FocusedView = nil then
    Result := nil
  else
    FocusedView.GetInterface(IcxNavigator, Result);
end;

function TcxCustomGrid.GetView(Index: Integer): TcxCustomGridView;
begin
  Result := FViews[Index];
end;

function TcxCustomGrid.GetViewCount: Integer;
begin
  Result := FViews.Count;
end;

function TcxCustomGrid.GetRootLevelOptions: TcxGridLevelOptions;
begin
  Result := FLevels.Options;
end;

function TcxCustomGrid.GetRootLevelStyles: TcxGridLevelStyles;
begin
  Result := FLevels.Styles;
end;

function TcxCustomGrid.GetUpdateLocked: Boolean;
{
  function DataControllerLocked: Boolean;                    //!!!!!!!!!!!!!!!!!!!!
  var
    I, J: Integer;

    function CheckDataController(AView: TcxCustomGridView; out ALocked: Boolean): Boolean;
    begin
      ALocked := AView.DataController.LockCount <> 0;
      Result := ALocked;
    end;

  begin
    for I := 0 to ViewCount - 1 do
    begin
      if CheckDataController(Views[I], Result) then Exit;
      for J := 0 to Views[I].CloneCount - 1 do
        if CheckDataController(Views[I].Clones[J], Result) then Exit;
    end;
    Result := False;
  end;
}
begin
  Result := (FUpdateLockCount <> 0) {or DataControllerLocked};
end;

procedure TcxCustomGrid.SetActiveLevel(Value: TcxGridLevel);
begin
  if FActiveLevel <> Value then
  begin
    if Value = nil then
      Value := FLevels.GetAvailableItem;
    FActiveLevel := Value;
    SizeChanged;
    if not IsLoading and (FActiveLevel <> nil) then
      DoActiveTabChanged(FActiveLevel);
    if FActiveLevel <> nil then
      FocusedView := FActiveLevel.GridView
    else
      FocusedView := nil;
  end;
end;

procedure TcxCustomGrid.SetDragOpeningWaitTime(Value: Integer);
begin
  if Value < 0 then Value := 0;
  FDragOpeningWaitTime := Value;
end;

procedure TcxCustomGrid.SetFocusedView(Value: TcxCustomGridView);
var
  APrevFocusedView: TcxCustomGridView;
  APrevFocused: Boolean;

  function GetAvailableView: TcxCustomGridView;
  var
    I: Integer;

    function CheckMasterView(AView: TcxCustomGridView): TcxCustomGridView;
    begin
      Result := AView;
      repeat
        Result := Result.MasterGridView;
      until (Result = nil) or not Result.IsDestroying;
    end;

  begin
    Result := CheckMasterView(FFocusedView);
    if Result = nil then
    begin
      for I := 0 to Levels.Count - 1 do
      begin
        Result := Levels[I].GridView;
        if (Result <> nil) and not Result.IsDestroying then Exit;
      end;
      Result := nil;
    end;
  end;

begin
  if (Value <> nil) and not TcxCustomGridViewAccess(Value).CanFocus then Exit;
  if FFocusedView <> Value then
  begin
    APrevFocusedView := FFocusedView;
    if not IsDestroying  and
      ((Value = nil) and (ActiveLevel <> nil) and (ActiveLevel.GridView <> nil) or
       (Value <> nil) and Value.IsDestroying) then
      Value := GetAvailableView;
    FFocusedView := Value;
    if APrevFocusedView <> nil then
    begin
      APrevFocused := IsFocused;
      try
        TcxCustomGridViewAccess(APrevFocusedView).FocusChanged(False);
      except
        FocusedView := APrevFocusedView;
        {with APrevFocusedView.Site do
          if CanFocus then SetFocus;}
        raise;
      end;
      if APrevFocused and not IsFocused then
        SetFocus;
    end;
    if FFocusedView <> nil then
    begin
      TcxCustomGridViewAccess(FFocusedView).FocusChanged(True);
      TcxGridLevel(FFocusedView.Level).Active := True;
    end
    else
      if IsFocused and CanFocusEx then
        SetFocus;
    FocusedViewChanged(APrevFocusedView, FFocusedView);
  end;
end;

procedure TcxCustomGrid.SetLevels(Value: TcxGridLevel);
begin
  FLevels.Free;
  FLevels := Value;
  if FLevels <> nil then
    FLevels.Control := Self;
end;

procedure TcxCustomGrid.SetRootLevelOptions(Value: TcxGridLevelOptions);
begin
end;

procedure TcxCustomGrid.SetRootLevelStyles(Value: TcxGridLevelStyles);
begin
end;

procedure TcxCustomGrid.SetTabStop(Value: Boolean);
begin
  if FTabStop <> Value then
  begin
    FTabStop := Value;
    if FocusedView <> nil then
      FocusedView.TabStop := FTabStop;
  end;
end;

procedure TcxCustomGrid.AddView(AView: TcxCustomGridView);
begin
  FViews.Add(AView);
  AView.DataController.SetMasterMode(nil, True);
end;

procedure TcxCustomGrid.RemoveView(AView: TcxCustomGridView);
begin
  FViews.Remove(AView);
  DestroyViewChanges(AView);
  //ViewChanged(AView, vsRemoved);
end;

procedure TcxCustomGrid.DestroyViews;
var
  I: Integer;
begin
  for I := ViewCount - 1 downto 0 do
    Views[I].Free;
end;

procedure TcxCustomGrid.DestroyChanges(AChanges: TList);
var
  I: Integer;
begin
  for I := 0 to AChanges.Count - 1 do
    TObject(AChanges[I]).Free;
  AChanges.Clear;
end;

procedure TcxCustomGrid.DestroyViewChanges(AView: TcxCustomGridView);

  procedure ClearViewChanges(AChanges: TList);
  var
    I: Integer;
  begin
    for I := AChanges.Count - 1 downto 0 do
      if (TcxCustomGridChange(AChanges[I]) is TcxCustomGridViewChange) and
        (TcxCustomGridViewChange(AChanges[I]).GridView = AView) then
      begin
        TObject(AChanges[I]).Free;
        AChanges.Delete(I);
      end;
  end;

begin
  ClearViewChanges(FChanges);
  ClearViewChanges(FChangesStack);
end;

procedure TcxCustomGrid.CreateLevels;
begin
  Levels := GetLevelsClass.Create(nil);
  with FLevels.Options do
  begin
    DetailFrameWidth := cxGridLevelDefaultRootDetailFrameWidth;
    DetailTabsPosition := cxGridLevelDefaultRootDetailTabsPosition;
  end;
end;

{$IFDEF VCL}

{procedure TcxCustomGrid.CMDeferUpdates(var Message: TMessage);
begin
  DoProcessChangesStack;
end;}

{$ENDIF}

function TcxCustomGrid.NavigatorIsBof: Boolean;
begin
  if FocusedViewNavigator = nil then
    Result := False
  else
    Result := FocusedViewNavigator.IsBof;
end;

function TcxCustomGrid.NavigatorIsEof: Boolean;
begin
  if FocusedViewNavigator = nil then
    Result := False
  else
    Result := FocusedViewNavigator.IsEof;
end;

function TcxCustomGrid.NavigatorCanEdit: Boolean;
begin
  if FocusedViewNavigator = nil then
    Result := False
  else
    Result := FocusedViewNavigator.CanEdit;
end;

function TcxCustomGrid.NavigatorCanDelete: Boolean;
begin
  if FocusedViewNavigator = nil then
    Result := False
  else
    Result := FocusedViewNavigator.CanDelete;
end;

function TcxCustomGrid.NavigatorCanInsert: Boolean;
begin
  if FocusedViewNavigator = nil then
    Result := False
  else
    Result := FocusedViewNavigator.CanInsert;
end;

function TcxCustomGrid.NavigatorIsEditing: Boolean;
begin
  if FocusedViewNavigator = nil then
    Result := False
  else
    Result := FocusedViewNavigator.IsEditing;
end;

procedure TcxCustomGrid.NavigatorClearBookmark;
begin
  if FocusedViewNavigator <> nil then
    FocusedViewNavigator.ClearBookmark;
end;

function TcxCustomGrid.NavigatorIsBookmarkAvailable: Boolean;
begin
  if FocusedViewNavigator = nil then
    Result := False
  else
    Result := FocusedViewNavigator.IsBookmarkAvailable;
end;

procedure TcxCustomGrid.NavigatorDoAction(AButtonIndex: Integer);
begin
  if FocusedViewNavigator <> nil then
    FocusedViewNavigator.DoAction(AButtonIndex);
end;

function TcxCustomGrid.NavigatorGetNotifier: TcxNavigatorControlNotifier;
begin
  Result := FNavigatorNotifier;
end;

function TcxCustomGrid.NavigatorIsActionSupported(AButtonIndex: Integer): Boolean;
begin
  Result := True;
end;

procedure TcxCustomGrid.AddChildComponent(AComponent: TcxControlChildComponent);
begin
  inherited;
  if AComponent is TcxCustomGridView then
    AddView(TcxCustomGridView(AComponent));
end;

procedure TcxCustomGrid.RemoveChildComponent(AComponent: TcxControlChildComponent);
begin
  inherited;
  if AComponent is TcxCustomGridView then
    RemoveView(TcxCustomGridView(AComponent));
end;

procedure TcxCustomGrid.BoundsChanged;
begin
  SizeChanged;
  inherited;
  StructureNavigatorChanged;
end;

procedure TcxCustomGrid.DoCancelMode;
begin
  inherited;
  FController.DoCancelMode;
end;

(*{$IFNDEF VCL}

function TcxCustomGrid.EventFilter(Sender: QObjectH; Event: QEventH): Boolean;
begin
  if QEvent_type(Event) = QEventType_CMDeferUpdates then
  begin
    DoProcessChangesStack;
    Result := True;
  end
  else
    Result := inherited EventFilter(Sender, Event);
end;

{$ENDIF}*)

procedure TcxCustomGrid.FocusChanged;
begin
  inherited;
  if not IsDestroying and Focused and (FocusedView <> nil) then
    TcxCustomGridViewAccess(FocusedView).FocusChanged(True);
end;

procedure TcxCustomGrid.GetChildren(Proc: TGetChildProc; Root: TComponent);
var
  I: Integer;
begin
  inherited;
  for I := 0 to ViewCount - 1 do
    if Views[I].Owner = Root then
      Proc(Views[I]);
  for I := 0 to FLevels.Count - 1 do
    if FLevels[I].Owner = Root then
      Proc(FLevels[I]);
end;

function TcxCustomGrid.GetCursor(X, Y: Integer): TCursor;
begin
  Result := FController.GetCursor(X, Y);
  if Result = crDefault then
    Result := inherited GetCursor(X, Y);
end;

function TcxCustomGrid.GetDesignHitTest(X, Y: Integer; Shift: TShiftState): Boolean;
var
  AHitTest: TcxCustomGridHitTest;
begin
  Result := inherited GetDesignHitTest(X, Y, Shift);
  if not Result and (ssLeft in Shift) then
  begin
    AHitTest := ViewInfo.GetHitTest(X, Y);
    Result := AHitTest.HitTestCode = htTab;
  end;
end;

function TcxCustomGrid.GetIsFocused: Boolean;
var
  AForm: TCustomForm;
begin
  Result := FIsPopupControl{8} or inherited GetIsFocused;
  if not Result then
  begin
    AForm := GetParentForm(Self);
    Result := (AForm <> nil) and (AForm.ActiveControl <> Self) and
      ContainsControl(AForm.ActiveControl) and AForm.ActiveControl.Focused and
      (not (AForm.ActiveControl is TcxControl) or TcxControl(AForm.ActiveControl).IsFocused);
  end;
end;

procedure TcxCustomGrid.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  FController.KeyDown(Key, Shift);
end;

procedure TcxCustomGrid.KeyUp(var Key: Word; Shift: TShiftState);
begin
  inherited;
  FController.KeyUp(Key, Shift);
end;

procedure TcxCustomGrid.Loaded;
{var
  I: Integer;
  AGridView: TcxCustomGridView;}
begin
  inherited;
  BeginUpdate;
  try
    {for I := 0 to Levels.VisibleCount - 1 do
    begin
      AGridView := Levels.VisibleItems[I].GridView;
      if AGridView <> nil then
        TcxCustomGridViewAccess(AGridView).LoadingComplete;
    end;}
    LayoutChanged;
  finally
    EndUpdate;
  end;
  StructureNavigatorChanged;
end;

function TcxCustomGrid.MayFocus: Boolean;
begin
  Result := False;
end;

procedure TcxCustomGrid.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  FController.MouseDown(Button, Shift, X, Y);
end;

procedure TcxCustomGrid.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  FController.MouseMove(Shift, X, Y);
end;

procedure TcxCustomGrid.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  FController.MouseUp(Button, Shift, X, Y);
end;

procedure TcxCustomGrid.LookAndFeelChanged(Sender: TcxLookAndFeel; AChangedValues: TcxLookAndFeelValues);
var
  I: Integer;
begin
  inherited;
  //SizeChanged;
  for I := 0 to ViewCount - 1 do
    TcxCustomGridViewAccess(Views[I]).LookAndFeelChanged;
  SizeChanged;
end;

procedure TcxCustomGrid.Paint;
begin
  inherited;
  FPainter.Paint;
end;

procedure TcxCustomGrid.ReadState(Reader: TReader);
begin
  if FStructureNavigator <> nil then FStructureNavigator.BeforeGridLoading;
  inherited;
end;

procedure TcxCustomGrid.SetName(const NewName: TComponentName);
var
  AOldName: TComponentName;
  ALevels: TList;
  ATag: Integer;

  function GetView(ACaller: TComponent; Index: Integer): TComponent;
  begin
    Result := TcxCustomGrid(ACaller).Views[Index];
  end;

  procedure RetriveLevels;

    procedure AddLevel(ALevel: TcxGridLevel);
    var
      I: Integer;
    begin
      if ALevel.Name <> '' then ALevels.Add(ALevel);
      for I := 0 to ALevel.Count - 1 do
        AddLevel(ALevel[I]);
    end;

  begin
    AddLevel(Levels);
  end;

  function GetLevel(ACaller: TComponent; Index: Integer): TComponent;
  begin
    Result := TList(TcxCustomGrid(ACaller).Tag)[Index];
  end;

begin
  AOldName := Name;
  inherited;
  if Name <> AOldName then
  begin
    RenameComponents(Self, Owner, Name, AOldName, ViewCount, @GetView);
    ATag := Tag;
    ALevels := TList.Create;
    try
      RetriveLevels;
      Tag := Integer(ALevels);
      RenameComponents(Self, Owner, Name, AOldName, ALevels.Count, @GetLevel);
    finally
      Tag := ATag;
      ALevels.Free;
    end;
    StructureNavigatorChanged;
  end;
end;

procedure TcxCustomGrid.DragAndDrop(const P: TPoint; var Accepted: Boolean);
begin
  inherited;
  FController.DragAndDrop(P, Accepted);
end;

procedure TcxCustomGrid.EndDragAndDrop(Accepted: Boolean);
begin
  FController.EndDragAndDrop(Accepted);
  inherited;
end;

function TcxCustomGrid.GetDragAndDropObjectClass: TcxDragAndDropObjectClass;
begin
  Result := FController.GetDragAndDropObjectClass;
end;

function TcxCustomGrid.StartDragAndDrop(const P: TPoint): Boolean;
begin
  Result := FController.StartDragAndDrop(P);
end;

procedure TcxCustomGrid.DoEndDrag(Target: TObject; X, Y: Integer);
begin
  FController.EndDrag(Target, X, Y);
  inherited;
end;

procedure TcxCustomGrid.DoStartDrag(var DragObject: TDragObject);
begin
  inherited;
  FController.StartDrag(DragObject);
end;

procedure TcxCustomGrid.DragOver(Source: TObject; X, Y: Integer; State: TDragState;
  var Accept: Boolean);
begin
  inherited;
  FController.DragOver(Source, X, Y, State, Accept);
end;

procedure TcxCustomGrid.CreateHandlers;
begin
  FController := GetControllerClass.Create(Self);
  FPainter := GetPainterClass.Create(Self);
  FViewInfo := GetViewInfoClass.Create(Self);
  FNavigatorNotifier := TcxNavigatorControlNotifier.Create;
  if IsDesigning and (cxGridStructureNavigatorClass <> nil) then
    FStructureNavigator := cxGridStructureNavigatorClass.Create(Self);
end;

procedure TcxCustomGrid.DestroyHandlers;
begin
  FreeAndNil(FStructureNavigator);
  FreeAndNil(FNavigatorNotifier);
  FreeAndNil(FViewInfo);
  FreeAndNil(FPainter);
  FreeAndNil(FController);
end;

procedure TcxCustomGrid.DoActiveTabChanged(ALevel: TcxGridLevel);
begin
  if FStructureNavigator <> nil then FStructureNavigator.BringToFront;
  if Assigned(FOnActiveTabChanged) then FOnActiveTabChanged(Self, ALevel);
end;

procedure TcxCustomGrid.DoChange(AGridChange: TcxCustomGridChange);
begin
  try
    if {IsLoading or - because of details} IsDestroying then Exit;
    with AGridChange do
    begin
      Control := Self;
      Execute;
    end;
  finally
    AGridChange.Free;
  end;
end;

procedure TcxCustomGrid.DoLayoutChanged(AGridView: TcxCustomGridView);
begin
  if Assigned(FOnLayoutChanged) then FOnLayoutChanged(Self, AGridView);
end;

procedure TcxCustomGrid.DoProcessChangesStack;
begin
  FProcessingChangesStack := True;
  try
    DoUpdate(FChangesStack);
  finally
    FProcessingChangesStack := False;
  end;
end;

procedure TcxCustomGrid.DoUpdate(AChanges: TList);
var
  AFinalChanges: TList;

  procedure BuildFinalChangesList;
  var
    I, J: Integer;
    AChange: TcxCustomGridChange;

    function FinalChangesContainClass(AChange: TcxCustomGridChange): Boolean;
    var
      I: Integer;
    begin
      for I := 0 to AFinalChanges.Count - 1 do
      begin
        Result := TcxCustomGridChange(AFinalChanges[I]).IsEqual(AChange);
        if Result then Exit;
      end;
      Result := False;
    end;

  begin
    for I := 0 to AChanges.Count - 1 do
    begin
      AChange := TcxCustomGridChange(AChanges[I]);
      if not AChange.IsCumulative or not FinalChangesContainClass(AChange) then
        AFinalChanges.Add(AChange)
      else
        AChange.Free;
    end;
    AChanges.Clear;
{1}
    I := 0;
    while I < AFinalChanges.Count do
    begin
      AChange := TcxCustomGridChange(AFinalChanges[I]);
      for J := I + 1 to AFinalChanges.Count - 1 do
        if AChange.IsCompatibleWith(AFinalChanges[J]) then
        begin
          AChange.Free;
          AFinalChanges.Delete(I);
          Dec(I);
          Break;
        end;
      Inc(I);
    end;

  end;

  procedure DoFinalChanges;
  var
    I: Integer;
  begin
    for I := 0 to AFinalChanges.Count - 1 do
      DoChange(TcxCustomGridChange(AFinalChanges[I]));
  end;

begin
  AFinalChanges := TList.Create;
  try
    BuildFinalChangesList;
    DoFinalChanges;
  finally
    AFinalChanges.Free;
  end;
end;

procedure TcxCustomGrid.FocusedViewChanged(APrevFocusedView, AFocusedView: TcxCustomGridView);
begin
  if IsDestroying then Exit;
  RefreshNavigators;
  SendNotifications(gnkFocusedViewChanged);
  if Assigned(FOnFocusedViewChanged) then
    FOnFocusedViewChanged(Self, APrevFocusedView, AFocusedView);
end;

function TcxCustomGrid.GetControllerClass: TcxGridControllerClass;
begin
  Result := TcxGridController;
end;

function TcxCustomGrid.GetLevelsClass: TcxGridLevelClass;
begin
  Result := TcxGridLevel;
end;

function TcxCustomGrid.GetPainterClass: TcxGridPainterClass;
begin
  Result := TcxGridPainter;
end;

function TcxCustomGrid.GetViewInfoClass: TcxGridViewInfoClass;
begin
  Result := TcxGridViewInfo;
end;

procedure TcxCustomGrid.LevelChanged(ALevel: TcxGridLevel; AChangeKind: TcxGridLevelChangeKind);
begin
  StructureNavigatorChanged;
end;

procedure TcxCustomGrid.RefreshNavigators;
begin
  if FNavigatorNotifier <> nil then
    FNavigatorNotifier.RefreshNavigatorButtons;
end;

procedure TcxCustomGrid.StructureNavigatorChanged;
begin
  if FStructureNavigator <> nil then FStructureNavigator.Changed;
end;

procedure TcxCustomGrid.ViewChanged(AView: TcxCustomGridView; AChangeKind: TcxGridViewChangeKind);
begin
  StructureNavigatorChanged;
end;

procedure TcxCustomGrid.UpdateFocusing(AChildFocused: Boolean);

  function NeedFocusingUpdate: Boolean;
  begin
    Result :=
      AChildFocused and not FLastFocused or
      not AChildFocused and not IsFocused;
  end;

begin
  if IsDestroying then Exit;
  if NeedFocusingUpdate then
  begin
    FLastFocused := AChildFocused;
    FController.FocusChanged;
  end;
end;

procedure TcxCustomGrid.Invalidate(AHardUpdate: Boolean = False);

  procedure InvalidateView(AView: TcxCustomGridView);
  var
    I: Integer;
  begin
    if AView = nil then Exit;
    AView.Invalidate(AHardUpdate);
    for I := 0 to TcxGridLevel(AView.Level).VisibleCount - 1 do
      InvalidateView(TcxGridLevel(AView.Level).VisibleItems[I].GridView);
  end;

begin
  if AHardUpdate then
    LayoutChanged
  else
    inherited Invalidate;
  InvalidateView(ActiveView);
end;

procedure TcxCustomGrid.BeginUpdate;
begin
  Inc(FUpdateLockCount);
end;

procedure TcxCustomGrid.CancelUpdate;
begin
  if FUpdateLockCount > 0 then
  begin
    Dec(FUpdateLockCount);
    if FUpdateLockCount = 0 then
      DestroyChanges(FChanges);
  end;
end;

procedure TcxCustomGrid.Changed(AGridChange: TcxCustomGridChange);
begin
  if AGridChange.IsLockable then
    if UpdateLocked then
      FChanges.Add(AGridChange)
    else
(*      if HandleAllocated and not FProcessingChangesStack then
      begin
        if FChangesStack.Count = 0 then
        {$IFDEF VCL}
          PostMessage(Handle, CM_DEFERUPDATES, 0, 0);
        {$ELSE}
          QApplication_postEvent(Handle, QCustomEvent_create(QEventType_CMDeferUpdates, Self));
        {$ENDIF}
        FChangesStack.Add(AGridChange);
      end
      else  *)
        DoChange(AGridChange)
  else
    DoChange(AGridChange);
end;

procedure TcxCustomGrid.CheckFocusedView;
begin
  if (FFocusedView <> nil) and not TcxCustomGridViewAccess(FFocusedView).CanFocus then
    if (ActiveView <> nil) and TcxCustomGridViewAccess(ActiveView).CanFocus then
      ActiveView.Focused := True
    else
      FocusedView := nil;
end;

procedure TcxCustomGrid.EndUpdate;
begin
  if FUpdateLockCount > 0 then
  begin
    Dec(FUpdateLockCount);
    if FUpdateLockCount = 0 then DoUpdate(FChanges);
  end;
end;

procedure TcxCustomGrid.LayoutChanged;
begin
  if not IsLoading then
    Changed(TcxGridLayoutChange.Create(nil));
end;

procedure TcxCustomGrid.SizeChanged;
begin
  if not IsLoading then
    Changed(TcxGridSizeChange.Create(nil));
end;

function TcxCustomGrid.CreateView(AViewClass: TcxCustomGridViewClass): TcxCustomGridView;
begin
  Result := AViewClass.CreateEx(Self);
  AddView(Result);
end;

function TcxCustomGrid.ViewExists(AView: TcxCustomGridView): Boolean;
var
  I: Integer;
begin
  for I := 0 to ViewCount - 1 do
  begin
    Result := (Views[I] = AView) or Views[I].HasAsClone(AView);
    if Result then Exit;
  end;
  Result := False;
end;

procedure TcxCustomGrid.RegisterNotification(ANotification: TcxCustomGridNotification);
begin
  if FNotifications.IndexOf(ANotification) = -1 then
    FNotifications.Add(ANotification);
end;

procedure TcxCustomGrid.UnregisterNotification(ANotification: TcxCustomGridNotification);
begin
  FNotifications.Remove(ANotification);
end;

procedure TcxCustomGrid.SendNotifications(AKind: TcxGridNotificationKind;
  AData: Pointer = nil);
var
  I: Integer;
  ANotification: TcxCustomGridNotification;
begin
  for I := 0 to FNotifications.Count - 1 do
  begin
    ANotification := TcxCustomGridNotification(FNotifications[I]);
    if AKind in ANotification.NotificationKinds then
      ANotification.Notify(AKind, AData);
  end;
end;

{ TcxGridViewRepository }

constructor TcxGridViewRepository.Create(AOwner: TComponent);
begin
  inherited;
  FItems := TList.Create;
end;

destructor TcxGridViewRepository.Destroy;
begin
  DestroyItems;
  FItems.Free;
  inherited;
end;

function TcxGridViewRepository.GetCount: Integer;
begin
  Result := FItems.Count;
end;

function TcxGridViewRepository.GetItem(Index: Integer): TcxCustomGridView;
begin
  Result := TcxCustomGridView(FItems[Index]);
end;

procedure TcxGridViewRepository.DestroyItems;
var
  I: Integer;
begin
  for I := Count - 1 downto 0 do
    Items[I].Free;
end;

procedure TcxGridViewRepository.GetChildren(Proc: TGetChildProc; Root: TComponent);
var
  I: Integer;
begin
  inherited;
  for I := 0 to Count - 1 do
    if Items[I].Owner = Root then
      Proc(Items[I]);
end;

procedure TcxGridViewRepository.AddItem(AItem: TcxCustomGridView);
begin
  FItems.Add(AItem);
  AItem.Repository := Self;
  AItem.DataController.SetMasterMode(nil, True);
end;

procedure TcxGridViewRepository.RemoveItem(AItem: TcxCustomGridView);
begin
  FItems.Remove(AItem);
  AItem.Repository := nil;
  if AItem.Control <> nil then
    TcxCustomGrid(AItem.Control).DestroyViewChanges(AItem);
end;

function TcxGridViewRepository.CreateItem(AItemClass: TcxCustomGridViewClass): TcxCustomGridView;
begin
  Result := AItemClass.Create(Owner);
  AddItem(Result);
end;

{ functions }

function GetParentGrid(AControl: TControl): TcxCustomGrid;
var
  AGridView: TcxCustomGridView;
begin
  AGridView := GetParentGridView(AControl);
  if AGridView = nil then
    Result := nil
  else
    Result := TcxCustomGrid(AGridView.Control);
end;

initialization
  RegisterClass(TcxGridLevel);

end.
