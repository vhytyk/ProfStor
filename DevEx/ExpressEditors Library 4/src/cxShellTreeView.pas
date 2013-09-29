
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

unit cxShellTreeView;

{$I cxExtEdVer.inc}

interface

uses
  Windows, Messages, Classes, ComCtrls, CommCtrl, Controls, Forms, Graphics,
  ImgList, Menus, ShlObj, StdCtrls, cxContainer, cxDataUtils, cxShellListView,
  cxShellCommon, cxShellControls;

type
  TcxCustomShellTreeView = class;

  { TcxInnerShellTreeView }

  TcxInnerShellTreeView = class(TcxCustomInnerShellTreeView, IcxContainerInnerControl)
  private

    // IcxContainerInnerControl
    function GetControl: TWinControl;
    function GetControlContainer: TcxContainer;

    procedure WMGetDlgCode(var Message: TWMGetDlgCode); message WM_GETDLGCODE;
    procedure WMKillFocus(var Message: TWMKillFocus); message WM_KILLFOCUS;
    procedure WMNCCalcSize(var Message: TWMNCCalcSize); message WM_NCCALCSIZE;
    procedure WMNCPaint(var Message: TMessage); message WM_NCPAINT;
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SETFOCUS;
    procedure WMWindowPosChanged(var Message: TWMWindowPosChanged); message WM_WINDOWPOSCHANGED;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure DSMShellChangeNotify(var Message: TMessage); message DSM_SHELLCHANGENOTIFY;
    procedure TVMEnsureVisible(var Message: TMessage); message TVM_ENSUREVISIBLE;
  protected
    FContainer: TcxCustomShellTreeView;
    procedure Click; override;
    procedure DblClick; override;
    function DoMouseWheel(Shift: TShiftState; WheelDelta: Integer;
      MousePos: TPoint): Boolean; override;
    procedure DragOver(Source: TObject; X, Y: Integer; State: TDragState;
      var Accept: Boolean); override;
    function GetPopupMenu: TPopupMenu; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure KeyUp(var Key: Word; Shift: TShiftState); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure CreateWindowHandle(const Params: TCreateParams); override;
    procedure WndProc(var Message: TMessage); override;
    procedure MouseEnter(AControl: TControl); dynamic;
    procedure MouseLeave(AControl: TControl); dynamic;
    property Container: TcxCustomShellTreeView read FContainer;
  public
    constructor Create(AOwner: TComponent); override;
    procedure DragDrop(Source: TObject; X, Y: Integer); override;
    function ExecuteAction(Action: TBasicAction): Boolean; override;
    function UpdateAction(Action: TBasicAction): Boolean; override;
{$IFDEF DELPHI5}
    function CanFocus: Boolean; override;
{$ENDIF}
    property Align;
    property Anchors;
    property AutoExpand;
    property BorderStyle;
    property ChangeDelay;
    property Color;
    property Ctl3D;
    property Cursor;
    property DragDropSettings;
    property Enabled;
    property Font;
    property HideSelection;
    property HotTrack;
    property Indent;
    property Items;
    property ListView;
    property Options;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property RightClickSelect;
    property Root;
    property ShowButtons;
    property ShowHint;
    property ShowLines;
    property ShowRoot;
    property StateImages;
    property TabOrder;
    property TabStop default True;
    property Visible;
    property OnClick;
    property OnEnter;
    property OnExit;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnDblClick;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnChanging;
    property OnChange;
    property OnExpanding;
    property OnCollapsing;
    property OnCollapsed;
    property OnExpanded;
    property OnEditing;
    property OnEdited;
    property OnRootChanged;
  end;

  { TcxCustomShellTreeView }

  TcxCustomShellTreeView = class(TcxContainer)
  private
    FInnerTreeView: TcxInnerShellTreeView;
    FIsExitProcessing: Boolean;
    FScrollBarsCalculating: Boolean;
    FOnChange: TTVChangedEvent;
    FOnChanging: TTVChangingEvent;
    FOnCollapsed: TTVExpandedEvent;
    FOnCollapsing: TTVCollapsingEvent;
    FOnEdited: TTVEditedEvent;
    FOnEditing: TTVEditingEvent;
    FOnExpanded: TTVExpandedEvent;
    FOnExpanding: TTVExpandingEvent;

    procedure ChangeHandler(Sender: TObject; Node: TTreeNode);
    procedure ChangingHandler(Sender: TObject; Node: TTreeNode;
      var AllowChange: Boolean);
    procedure CollapsedHandler(Sender: TObject; Node: TTreeNode);
    procedure CollapsingHandler(Sender: TObject; Node: TTreeNode;
      var AllowCollapse: Boolean);
    procedure EditedHandler(Sender: TObject; Node: TTreeNode; var S: string);
    procedure EditingHandler(Sender: TObject; Node: TTreeNode;
      var AllowEdit: Boolean);
    procedure ExpandedHandler(Sender: TObject; Node: TTreeNode);
    procedure ExpandingHandler(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);

    function GetAbsolutePath: string;
    function GetAbsolutePIDL: PItemIDList;
    function GetAutoExpand: Boolean;
    function GetChangeDelay: Integer;
    function GetDragDropSettings: TcxDragDropSettings;
    function GetHideSelection: Boolean;
    function GetIndent: Integer;
    function GetShowInfoTips: Boolean;
    function GetOptions: TcxShellOptions;
    function GetRightClickSelect: Boolean;
    function GetRoot: TcxShellTreeRoot;
    function GetShellListView: TcxCustomShellListView;
    function GetShowButtons: Boolean;
    function GetShowLines: Boolean;
    function GetShowRoot: Boolean;
    function GetStateImages: TCustomImageList;
    function GetTreeHotTrack: Boolean;
    procedure SetAbsolutePath(Value: string);
    procedure SetAbsolutePIDL(Value: PItemIDList);
    procedure SetAutoExpand(Value: Boolean);
    procedure SetChangeDelay(Value: Integer);
    procedure SetDragDropSettings(Value: TcxDragDropSettings);
    procedure SetHideSelection(Value: Boolean);
    procedure SetIndent(Value: Integer);
    procedure SetShowInfoTips(Value: Boolean);
    procedure SetOptions(Value: TcxShellOptions);
    procedure SetRightClickSelect(Value: Boolean);
    procedure SetRoot(Value: TcxShellTreeRoot);
    procedure SetShellListView(Value: TcxCustomShellListView);
    procedure SetShowButtons(Value: Boolean);
    procedure SetShowLines(Value: Boolean);
    procedure SetShowRoot(Value: Boolean);
    procedure SetStateImages(Value: TCustomImageList);
    procedure SetTreeHotTrack(Value: Boolean);
  protected
    FDataBinding: TcxCustomDataBinding;
    procedure DoExit; override;
    procedure Loaded; override;
    function NeedsScrollBars: Boolean; override;
    procedure Scroll(AScrollBarKind: TScrollBarKind; AScrollCode: TScrollCode;
      var AScrollPos: Integer); override;
    procedure CurrentFolderChangedHandler(Sender: TObject; Root: TcxCustomShellRoot); virtual;
    function GetDataBindingClass: TcxCustomDataBindingClass; virtual;
    function GetViewOptions(AForNavigation: Boolean = False): TcxShellViewOptions;
    procedure SetScrollBarsParameters; override;
    property AutoExpand: Boolean read GetAutoExpand write SetAutoExpand default False;
    property ChangeDelay: Integer read GetChangeDelay write SetChangeDelay default 0;
    property DataBinding: TcxCustomDataBinding read FDataBinding;
    property DragDropSettings: TcxDragDropSettings read GetDragDropSettings write SetDragDropSettings;
    property HideSelection: Boolean read GetHideSelection write SetHideSelection default True;
    property Indent: Integer read GetIndent write SetIndent;
    property Options: TcxShellOptions read GetOptions write SetOptions;
    property RightClickSelect: Boolean read GetRightClickSelect
      write SetRightClickSelect default False;
    property Root: TcxShellTreeRoot read GetRoot write SetRoot;
    property ShellListView: TcxCustomShellListView read GetShellListView write SetShellListView;
    property ShowButtons: Boolean read GetShowButtons write SetShowButtons default True;
    property ShowInfoTips: Boolean read GetShowInfoTips write SetShowInfoTips default True; 
    property ShowLines: Boolean read GetShowLines write SetShowLines default True;
    property ShowRoot: Boolean read GetShowRoot write SetShowRoot default True;
    property StateImages: TCustomImageList read GetStateImages write SetStateImages;
    property TreeHotTrack: Boolean read GetTreeHotTrack write SetTreeHotTrack default False;
    property OnChange: TTVChangedEvent read FOnChange write FOnChange;
    property OnChanging: TTVChangingEvent read FOnChanging write FOnChanging;
    property OnCollapsed: TTVExpandedEvent read FOnCollapsed write FOnCollapsed;
    property OnCollapsing: TTVCollapsingEvent read FOnCollapsing write FOnCollapsing;
    property OnEdited: TTVEditedEvent read FOnEdited write FOnEdited;
    property OnEditing: TTVEditingEvent read FOnEditing write FOnEditing;
    property OnExpanded: TTVExpandedEvent read FOnExpanded write FOnExpanded;
    property OnExpanding: TTVExpandingEvent read FOnExpanding write FOnExpanding;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function ExecuteAction(Action: TBasicAction): Boolean; override;
    function GetNodeAbsolutePIDL(ANode: TTreeNode): PItemIDList;
    function UpdateAction(Action: TBasicAction): Boolean; override;
{$IFDEF VCL}
    procedure SetFocus; override;
{$ENDIF}
    property AbsolutePath: string read GetAbsolutePath write SetAbsolutePath;
    property AbsolutePIDL: PItemIDList read GetAbsolutePIDL write SetAbsolutePIDL;
    property InnerTreeView: TcxInnerShellTreeView read FInnerTreeView;
//    property RelativePIDL: PItemIDList write SetRelativePIDL; // TODO
  end;

  { TcxShellTreeView }

  TcxShellTreeView = class(TcxCustomShellTreeView)
  published
    property Align;
    property Anchors;
    property AutoExpand;
    property ChangeDelay;
    property Constraints;
    property DragDropSettings;
    property Enabled;
    property HideSelection;
    property Indent;
    property Options;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property RightClickSelect;
    property Root;
    property ShellListView;
    property ShowButtons;
    property ShowHint;
    property ShowInfoTips;
    property ShowLines;
    property ShowRoot;
    property StateImages;
    property Style;
    property TabOrder;
    property TabStop;
    property TreeHotTrack;
    property Visible;
    property OnChange;
    property OnChanging;
    property OnClick;
    property OnCollapsed;
    property OnCollapsing;
    property OnDblClick;
    property OnEdited;
    property OnEditing;
    property OnEnter;
    property OnExit;
    property OnExpanded;
    property OnExpanding;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
  end;

implementation

uses
  SysUtils, cxClasses, cxEdit, cxScrollBar;

type
  TcxCustomDataBindingAccess = class(TcxCustomDataBinding);
  TcxInnerShellListViewAccess = class(TcxInnerShellListView);
  TcxShellTreeItemProducerAccess = class(TcxShellTreeItemProducer);

{ TcxInnerShellTreeView }

constructor TcxInnerShellTreeView.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  BorderStyle := bsNone;
  ControlStyle := ControlStyle + [csDoubleClicks];
  ParentColor := False;
  ParentFont := True;
end;

procedure TcxInnerShellTreeView.DragDrop(Source: TObject; X, Y: Integer);
begin
  if Container <> nil then
    Container.DragDrop(Source, Left + X, Top + Y);
end;

function TcxInnerShellTreeView.ExecuteAction(Action: TBasicAction): Boolean;
begin
  Result := inherited ExecuteAction(Action) or
    TcxCustomDataBindingAccess(Container.FDataBinding).ExecuteAction(Action);
end;

function TcxInnerShellTreeView.UpdateAction(Action: TBasicAction): Boolean;
begin
  Result := inherited UpdateAction(Action) or
    TcxCustomDataBindingAccess(Container.FDataBinding).UpdateAction(Action);
end;

{$IFDEF DELPHI5}
function TcxInnerShellTreeView.CanFocus: Boolean;
begin
  Result := Container.CanFocusEx;
end;
{$ENDIF}

procedure TcxInnerShellTreeView.Click;
begin
  inherited Click;
  if Container <> nil then
    Container.Click;
end;

procedure TcxInnerShellTreeView.DblClick;
begin
  inherited DblClick;
  if Container <> nil then
    Container.DblClick;
end;

function TcxInnerShellTreeView.DoMouseWheel(Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint): Boolean;
begin
  Result := (Container <> nil) and Container.DoMouseWheel(Shift,
    WheelDelta, MousePos);
  if not Result then
    inherited DoMouseWheel(Shift, WheelDelta, MousePos);
end;

procedure TcxInnerShellTreeView.DragOver(Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  if Container <> nil then
    Container.DragOver(Source, Left + X, Top + Y, State, Accept);
end;

function TcxInnerShellTreeView.GetPopupMenu: TPopupMenu;
begin
  if Container = nil then
    Result := inherited GetPopupMenu
  else
    Result := Container.GetPopupMenu;
end;

procedure TcxInnerShellTreeView.KeyDown(var Key: Word; Shift: TShiftState);
begin
  if Container <> nil then
    Container.KeyDown(Key, Shift);
  if Key <> 0 then
    inherited KeyDown(Key, Shift);
end;

procedure TcxInnerShellTreeView.KeyPress(var Key: Char);
begin
  if Key = Char(VK_TAB) then
    Key := #0;
  if Container <> nil then
    Container.KeyPress(Key);
  if Word(Key) = VK_RETURN then
    Key := #0;
  if Key <> #0 then
    inherited KeyPress(Key);
end;

procedure TcxInnerShellTreeView.KeyUp(var Key: Word; Shift: TShiftState);
begin
  if Key = VK_TAB then
    Key := 0;
  if Container <> nil then
    Container.KeyUp(Key, Shift);
  if Key <> 0 then
    inherited KeyUp(Key, Shift);
end;

procedure TcxInnerShellTreeView.MouseDown(Button: TMouseButton;
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

procedure TcxInnerShellTreeView.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseMove(Shift, X, Y);
  if Container <> nil then
    Container.MouseMove(Shift, X + Left, Y + Top);
end;

procedure TcxInnerShellTreeView.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited MouseUp(Button, Shift, X, Y);
  if Container <> nil then
    Container.MouseUp(Button, Shift, X + Left, Y + Top);
end;

procedure TcxInnerShellTreeView.CreateWindowHandle(const Params: TCreateParams);
begin
  inherited CreateWindowHandle(Params);
  Container.SetScrollBarsParameters;
end;

procedure TcxInnerShellTreeView.WndProc(var Message: TMessage);
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
    CM_WININICHANGE:
      Container.SetScrollBarsParameters;
  end;
end;

procedure TcxInnerShellTreeView.MouseEnter(AControl: TControl);
begin
end;

procedure TcxInnerShellTreeView.MouseLeave(AControl: TControl);
begin
  if Container <> nil then
    Container.ShortRefreshContainer(True);
end;

function TcxInnerShellTreeView.GetControl: TWinControl;
begin
  Result := Self;
end;

function TcxInnerShellTreeView.GetControlContainer: TcxContainer;
begin
  Result := FContainer;
end;

procedure TcxInnerShellTreeView.WMGetDlgCode(var Message: TWMGetDlgCode);
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

procedure TcxInnerShellTreeView.WMKillFocus(var Message: TWMKillFocus);
begin
  inherited;
  if (Container <> nil) and not Container.IsDestroying then
    Container.FocusChanged;
end;

procedure TcxInnerShellTreeView.WMNCCalcSize(var Message: TWMNCCalcSize);
begin
  inherited;
  if UsecxScrollBars and not Container.FScrollBarsCalculating then
    Container.SetScrollBarsParameters;
end;

procedure TcxInnerShellTreeView.WMNCPaint(var Message: TMessage);
var
  DC: HDC;
  ABrush: HBRUSH;
begin
  if not UsecxScrollBars then
  begin
    inherited;
    Exit;
  end;

  Message.Result := 1;
  if UsecxScrollBars and Container.HScrollBar.Visible and Container.VScrollBar.Visible then
  begin
    DC := GetWindowDC(Handle);
    ABrush := 0;
    try
      ABrush := CreateSolidBrush(ColorToRGB(clBtnFace));
      FillRect(DC, GetSizeGripRect(Self), ABrush);
    finally
      if ABrush <> 0 then
        DeleteObject(ABrush);
      ReleaseDC(Handle, DC);
    end;
  end;
end;

procedure TcxInnerShellTreeView.WMSetFocus(var Message: TWMSetFocus);
begin
  inherited;
  if (Container <> nil) and not Container.IsDestroying and not(csDestroying in ComponentState)
      and (Message.FocusedWnd <> Container.Handle) then
    Container.FocusChanged;
end;

procedure TcxInnerShellTreeView.WMWindowPosChanged(var Message: TWMWindowPosChanged);
var
  ARgn: HRGN;
begin
  inherited;
  if csDestroying in ComponentState then
    Exit;
  if Container.HScrollBar.Visible and Container.VScrollBar.Visible then
  begin
    ARgn := CreateRectRgnIndirect(GetSizeGripRect(Self));
    SendMessage(Handle, WM_NCPAINT, ARgn, 0);
    DeleteObject(ARgn);
  end;
end;

procedure TcxInnerShellTreeView.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  if Message.lParam = 0 then
    MouseEnter(Self)
  else
    MouseEnter(TControl(Message.lParam));
end;

procedure TcxInnerShellTreeView.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  if Message.lParam = 0 then
    MouseLeave(Self)
  else
    MouseLeave(TControl(Message.lParam));
end;

procedure TcxInnerShellTreeView.DSMShellChangeNotify(var Message: TMessage);
begin
  inherited;
  Container.SetScrollBarsParameters;
end;

procedure TcxInnerShellTreeView.TVMEnsureVisible(var Message: TMessage);
begin
  inherited;
  Container.SetScrollBarsParameters;
end;

{ TcxCustomShellTreeView }

constructor TcxCustomShellTreeView.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FDataBinding := GetDataBindingClass.Create(Self, Self);
  with TcxCustomDataBindingAccess(FDataBinding) do
  begin
    OnDataChange := Self.DataChange;
    OnDataSetChange := Self.DataSetChange;
    OnUpdateData := Self.UpdateData;
  end;
  FInnerTreeView := TcxInnerShellTreeView.Create(Self);
  with FInnerTreeView do
  begin
    FContainer := Self;
    LookAndFeel.MasterLookAndFeel := Self.Style.LookAndFeel;
    Parent := Self;
    TabStop := False;

    OnChange := Self.ChangeHandler;
    OnChanging := Self.ChangingHandler;
    OnCollapsed := Self.CollapsedHandler;
    OnCollapsing := Self.CollapsingHandler;
    OnEdited := Self.EditedHandler;
    OnEditing := Self.EditingHandler;
    OnExpanded := Self.ExpandedHandler;
    OnExpanding := Self.ExpandingHandler;
    OnRootChanged := Self.CurrentFolderChangedHandler;
  end;
  InnerControl := FInnerTreeView;
  HScrollBar.SmallChange := 1;
  VScrollBar.SmallChange := 1;
  Width := 121;
  Height := 97;
end;

destructor TcxCustomShellTreeView.Destroy;
begin
  FreeAndNil(FInnerTreeView);
  FreeAndNil(FDataBinding);
  inherited Destroy;
end;

function TcxCustomShellTreeView.ExecuteAction(Action: TBasicAction): Boolean;
begin
  Result := inherited ExecuteAction(Action) or
    TcxCustomDataBindingAccess(FDataBinding).ExecuteAction(Action);
end;

function TcxCustomShellTreeView.GetNodeAbsolutePIDL(ANode: TTreeNode): PItemIDList;
var
  AIFolder: IShellFolder;
  AList: TStringList;
  ATempPIDL1, ATempPIDL2: PItemIDList;
  AViewOptions: TcxShellViewOptions;
  I: Integer;
begin
  with TcxShellTreeItemProducerAccess(ANode.Data) do
    if FolderPidl <> nil then
    begin
      Result := GetPidlCopy(FolderPidl);
      Exit;
    end;

  CheckShellRoot(Root);
  Result := GetPidlCopy(Root.Pidl);
  if ANode.Parent = nil then
    Exit;

  AList := TStringList.Create;
  try
    repeat
      AList.Insert(0, ANode.Text);
      ANode := ANode.Parent;
    until ANode.Parent = nil;
    AIFolder := Root.ShellFolder;
    AViewOptions := GetViewOptions;
    for I := 0 to AList.Count - 1 do
    begin
      ATempPIDL1 := InternalParseDisplayName(AIFolder, AList[I], AViewOptions);
      ATempPIDL2 := Result;
      Result := ConcatenatePidls(Result, ATempPIDL1);
      if I < AList.Count - 1 then
        AIFolder.BindToObject(ATempPIDL1, nil, IID_IShellFolder, Pointer(AIFolder));
      DisposePidl(ATempPIDL1);
      DisposePidl(ATempPIDL2);
    end;
  finally
    AList.Free;
  end;
end;

function TcxCustomShellTreeView.UpdateAction(Action: TBasicAction): Boolean;
begin
  Result := inherited UpdateAction(Action) or
    TcxCustomDataBindingAccess(FDataBinding).UpdateAction(Action);
end;

{$IFDEF VCL}
procedure TcxCustomShellTreeView.SetFocus;
begin
  if not IsDesigning then
    inherited SetFocus;
end;
{$ENDIF}

procedure TcxCustomShellTreeView.DoExit;
begin
  if IsDestroying or FIsExitProcessing then
    Exit;
  FIsExitProcessing := True;
  try
    try
      DataBinding.UpdateDataSource;
    except
      SetFocus;
      raise;
    end;
    inherited DoExit;
  finally
    FIsExitProcessing := False;
  end;
end;

procedure TcxCustomShellTreeView.Loaded;
begin
  inherited Loaded;
  SetScrollBarsParameters;
end;

function TcxCustomShellTreeView.NeedsScrollBars: Boolean;
begin
  Result := True;
end;

procedure TcxCustomShellTreeView.Scroll(AScrollBarKind: TScrollBarKind;
  AScrollCode: TScrollCode; var AScrollPos: Integer);
begin
  inherited Scroll(AScrollBarKind, AScrollCode, AScrollPos);
  if not Enabled then
    Exit;
  with FInnerTreeView do
    if AScrollBarKind = sbHorizontal then
    begin
      CallWindowProc(DefWndProc, Handle, WM_HSCROLL, Word(AScrollCode) +
        Word(AScrollPos) shl 16, HScrollBar.Handle);
      AScrollPos := GetScrollPos(Handle, SB_HORZ);
    end
    else
    begin
      CallWindowProc(DefWndProc, Handle, WM_VSCROLL, Word(AScrollCode) +
        Word(AScrollPos) shl 16, VScrollBar.Handle);
      AScrollPos := GetScrollPos(Handle, SB_VERT);
    end;
  SetScrollBarsParameters;
end;

procedure TcxCustomShellTreeView.CurrentFolderChangedHandler(Sender: TObject;
  Root: TcxCustomShellRoot);
begin
  SetScrollBarsParameters;
end;

function TcxCustomShellTreeView.GetDataBindingClass: TcxCustomDataBindingClass;
begin
  Result := TcxDataBinding;
end;

function TcxCustomShellTreeView.GetViewOptions(AForNavigation: Boolean = False): TcxShellViewOptions;
begin
  if AForNavigation then
    Result := [svoShowFolders, svoShowHidden]
  else
    with InnerTreeView do
      begin
        Result := [];
        if Options.ShowNonFolders then
          Include(Result, svoShowFiles);
        if Options.ShowFolders then
          Include(Result, svoShowFolders);
        if Options.ShowHidden then
          Include(Result, svoShowHidden);
      end;
end;

procedure TcxCustomShellTreeView.SetScrollBarsParameters;
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
      if IsDestroying or (Parent = nil) or not HandleAllocated or not FInnerTreeView.HandleAllocated then
        Break;
      AScrollBarInfo.cbSize := SizeOf(AScrollBarInfo);
      if not GetScrollBarInfoProc(FInnerTreeView.Handle, Integer(AScrollBarObjects[AScrollBar.Kind]),
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
    GetScrollInfo(FInnerTreeView.Handle, ABarFlags[AScrollBar.Kind], AScrollInfo);
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
  if (*IsDesigning or *)not NeedsScrollBars or IsDestroying or not UsecxScrollBars then
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

procedure TcxCustomShellTreeView.ChangeHandler(Sender: TObject; Node: TTreeNode);
begin
  try
    if Assigned(FOnChange) then
      FOnChange(Self, Node);
  finally
    SetScrollBarsParameters;
  end;
end;

procedure TcxCustomShellTreeView.ChangingHandler(Sender: TObject; Node: TTreeNode;
  var AllowChange: Boolean);
begin
  if Assigned(FOnChanging) then
    FOnChanging(Self, Node, AllowChange);
end;

procedure TcxCustomShellTreeView.CollapsedHandler(Sender: TObject;
  Node: TTreeNode);
begin
  try
    if Assigned(FOnCollapsed) then
      FOnCollapsed(Self, Node);
  finally
    SetScrollBarsParameters;
  end;
end;

procedure TcxCustomShellTreeView.CollapsingHandler(Sender: TObject;
  Node: TTreeNode; var AllowCollapse: Boolean);
begin
  if Assigned(FOnCollapsing) then
    FOnCollapsing(Self, Node, AllowCollapse);
end;

procedure TcxCustomShellTreeView.EditedHandler(Sender: TObject;
  Node: TTreeNode; var S: string);
begin
  try
    if Assigned(FOnEdited) then
      FOnEdited(Self, Node, S);
  finally
    SetScrollBarsParameters;
  end;
end;

procedure TcxCustomShellTreeView.EditingHandler(Sender: TObject; Node: TTreeNode;
  var AllowEdit: Boolean);
begin
  if Assigned(FOnEditing) then
    FOnEditing(Self, Node, AllowEdit);
end;

procedure TcxCustomShellTreeView.ExpandedHandler(Sender: TObject;
  Node: TTreeNode);
begin
  try
    if Assigned(FOnExpanded) then
      FOnExpanded(Self, Node);
  finally
    SetScrollBarsParameters;
  end;
end;

procedure TcxCustomShellTreeView.ExpandingHandler(Sender: TObject;
  Node: TTreeNode; var AllowExpansion: Boolean);
begin
  if Assigned(FOnExpanding) then
    FOnExpanding(Self, Node, AllowExpansion);
end;

function TcxCustomShellTreeView.GetAbsolutePath: string;
var
  ATempPIDL: PItemIDList;
begin
  Result := '';
  if FInnerTreeView <> nil then
    with FInnerTreeView do
      if Selected <> nil then
      begin
        ATempPIDL := GetNodeAbsolutePIDL(Selected);
        try
          Result := GetPidlName(ATempPIDL);
        finally
          DisposePidl(ATempPIDL);
        end;
      end;
end;

function TcxCustomShellTreeView.GetAbsolutePIDL: PItemIDList;
begin
  Result := nil;
  if FInnerTreeView <> nil then
    with FInnerTreeView do
      if Selected <> nil then
        Result := GetNodeAbsolutePIDL(Selected);
end;

function TcxCustomShellTreeView.GetAutoExpand: Boolean;
begin
  Result := FInnerTreeView.AutoExpand;
end;

function TcxCustomShellTreeView.GetChangeDelay: Integer;
begin
  Result := FInnerTreeView.ChangeDelay;
end;

function TcxCustomShellTreeView.GetDragDropSettings: TcxDragDropSettings;
begin
  Result := TcxDragDropSettings(FInnerTreeView.DragDropSettings);
end;

function TcxCustomShellTreeView.GetHideSelection: Boolean;
begin
  Result := FInnerTreeView.HideSelection;
end;

function TcxCustomShellTreeView.GetIndent: Integer;
begin
  Result := FInnerTreeView.Indent;
end;

function TcxCustomShellTreeView.GetShowInfoTips: Boolean;
begin
  Result := FInnerTreeView.ShowInfoTips;
end;

function TcxCustomShellTreeView.GetOptions: TcxShellOptions;
begin
  Result := TcxShellOptions(FInnerTreeView.Options);
end;

function TcxCustomShellTreeView.GetRightClickSelect: Boolean;
begin
  Result := FInnerTreeView.RightClickSelect;
end;

function TcxCustomShellTreeView.GetRoot: TcxShellTreeRoot;
begin
  Result := TcxShellTreeRoot(FInnerTreeView.Root)
end;

function TcxCustomShellTreeView.GetShellListView: TcxCustomShellListView;
begin
  if FInnerTreeView.ListView is TcxInnerShellListView then
    Result := TcxInnerShellListViewAccess(FInnerTreeView.ListView).Container
  else
    Result := nil;
end;

function TcxCustomShellTreeView.GetShowButtons: Boolean;
begin
  Result := FInnerTreeView.ShowButtons;
end;

function TcxCustomShellTreeView.GetShowLines: Boolean;
begin
  Result := FInnerTreeView.ShowLines;
end;

function TcxCustomShellTreeView.GetShowRoot: Boolean;
begin
  Result := FInnerTreeView.ShowRoot;
end;

function TcxCustomShellTreeView.GetStateImages: TCustomImageList;
begin
  Result := FInnerTreeView.StateImages;
end;

function TcxCustomShellTreeView.GetTreeHotTrack: Boolean;
begin
  Result := FInnerTreeView.HotTrack;
end;

procedure TcxCustomShellTreeView.SetAbsolutePath(Value: string);
var
  APIDL: PItemIDList;
begin
  if (FInnerTreeView <> nil) and FInnerTreeView.HandleAllocated then
  begin
    APIDL := PathToAbsolutePIDL(Value, Root, GetViewOptions(True));
    if APIDL <> nil then
      try
        SendMessage(FInnerTreeView.Handle, DSM_DONAVIGATE, WPARAM(APIDL), 0);
        FInnerTreeView.DoNavigateListView;
      finally
        DisposePidl(APIDL);
      end;
  end;
end;

procedure TcxCustomShellTreeView.SetAbsolutePIDL(Value: PItemIDList);
begin
  if (FInnerTreeView <> nil) and FInnerTreeView.HandleAllocated then
  begin
    if not CheckAbsolutePIDL(Value, Root, True) then
      Exit;
    SendMessage(FInnerTreeView.Handle, DSM_DONAVIGATE, WPARAM(Value), 0);
    FInnerTreeView.DoNavigateListView;
  end;
end;

procedure TcxCustomShellTreeView.SetAutoExpand(Value: Boolean);
begin
  FInnerTreeView.AutoExpand := Value;
end;

procedure TcxCustomShellTreeView.SetChangeDelay(Value: Integer);
begin
  FInnerTreeView.ChangeDelay := Value;
end;

procedure TcxCustomShellTreeView.SetDragDropSettings(Value: TcxDragDropSettings);
begin
  FInnerTreeView.DragDropSettings := Value;
end;

procedure TcxCustomShellTreeView.SetHideSelection(Value: Boolean);
begin
  FInnerTreeView.HideSelection := Value;
end;

procedure TcxCustomShellTreeView.SetIndent(Value: Integer);
var
  APrevIndent: Integer;
begin
  APrevIndent := FInnerTreeView.Indent;
  FInnerTreeView.Indent := Value;
  if APrevIndent <> FInnerTreeView.Indent then
    SetScrollBarsParameters;
end;

procedure TcxCustomShellTreeView.SetShowInfoTips(Value: Boolean);
begin
  FInnerTreeView.ShowInfoTips := Value;
end;

procedure TcxCustomShellTreeView.SetOptions(Value: TcxShellOptions);
begin
  FInnerTreeView.Options := Value;
end;

procedure TcxCustomShellTreeView.SetRightClickSelect(Value: Boolean);
begin
  FInnerTreeView.RightClickSelect := Value;
end;

procedure TcxCustomShellTreeView.SetRoot(Value: TcxShellTreeRoot);
begin
  FInnerTreeView.Root := Value;
end;

procedure TcxCustomShellTreeView.SetShellListView(Value: TcxCustomShellListView);
begin
  FInnerTreeView.ListView := Value.InnerListView;
end;

procedure TcxCustomShellTreeView.SetShowButtons(Value: Boolean);
begin
  FInnerTreeView.ShowButtons := Value;
end;

procedure TcxCustomShellTreeView.SetShowLines(Value: Boolean);
begin
  FInnerTreeView.ShowLines := Value;
end;

procedure TcxCustomShellTreeView.SetShowRoot(Value: Boolean);
begin
  FInnerTreeView.ShowRoot := Value;
end;

procedure TcxCustomShellTreeView.SetStateImages(Value: TCustomImageList);
begin
  FInnerTreeView.StateImages := Value;
end;

procedure TcxCustomShellTreeView.SetTreeHotTrack(Value: Boolean);
begin
  FInnerTreeView.HotTrack := Value;
end;

end.
