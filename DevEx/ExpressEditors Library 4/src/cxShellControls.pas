
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

unit cxShellControls;

interface

{$I cxShellVer.inc}

uses
  Windows, Classes, SysUtils, ShellApi, ShlObj, ActiveX, ComCtrls,
  cxShellCommon, Controls, CommCtrl, Messages, Menus, Dialogs, ComObj;

type
  TcxCustomInnerShellListView=class;
  TcxListViewStyle=(lvsIcon, lvsSmallIcon, lvsList, lvsReport);
  // Custom listview styles added because D4 and D5 does not allow detect
  // the ViewStyle change. Also, we can add more styles to this component:
  // Tile/Thumbnails/Custom...

  TcxNavigationEvent=procedure (Sender:TcxCustomInnerShellListView;fqPidl:PItemIDList;
                FolderPath:WideString) of object;

  TcxShellListViewProducer=class(TcxCustomItemProducer)
  protected
    function GetEnumFlags:Cardinal;override;
    function AllowBackgroundProcessing:Boolean;override;
    function GetShowToolTip:Boolean;override;
  public
    procedure ProcessDetails(ShellFolder:IShellFolder;CharWidth:Integer);override;
  end;

  TcxShellListRoot=class(TcxCustomShellRoot)
  protected
    procedure RootUpdated;override;
  end;

  TDropTargetType=(dttNone, dttOpenFolder, dttItem);

  IcxDropTarget = interface(IDropTarget)
  ['{F688E250-96A6-4222-AF9D-049EB6E7D05B}']
  end;

  TcxCustomInnerShellListView=class(TCustomListView, IcxDropTarget)
  private
    FComboBoxControl: TWinControl;
    FRoot: TcxShellListRoot;
    FDragDropSettings: TcxDragDropSettings;
    FItemProducer: TcxShellListViewProducer;
    FOptions: TcxShellOptions;
    FInternalSmallImages:THandle;
    FInternalLargeImages:THandle;
    FLastUpdateItem: Integer;
    FFirstUpdateItem: Integer;
    FBeforeNavigation: TcxNavigationEvent;
    FAfterNavigation: TcxNavigationEvent;
    FListViewStyle: TcxListViewStyle;
    FCurrentDropTarget: IcxDropTarget;
    FDropTargetItem: TListItem;
    FDraggedObject: IDataObject;
    FChangeNotifyHandle: Integer;
    FNotificationLock:Boolean;
    FTreeViewControl: TWinControl;
    FRootChanged: TcxRootChangedEvent;
    procedure SetListViewStyle(const Value: TcxListViewStyle);
    procedure SetDropTargetItem(const Value: TListItem);
  protected
    procedure CreateWnd; override;
    procedure DestroyWnd; override;
    function OwnerDataFetch(Item: TListItem; Request: TItemRequest): Boolean; override;
    procedure DblClick; override;
    procedure DoContextPopup(MousePos: TPoint; var Handled: Boolean); {$IFNDEF LESS_THAN_130}override;{$ENDIF}
    function CanEdit(Item: TListItem): Boolean; override;
    procedure Loaded;override;
    procedure Edit(const Item: TLVItem); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure DoProcessDefaultCommand(Item:TcxShellItemInfo);
    procedure DoProcessNavigation(Item:TcxShellItemInfo);
    procedure DoBeforeNavigation(fqPidl:PItemIDList);
    procedure DoAfterNavigation;
    procedure CreateColumns;
    procedure CreateDropTarget;
    procedure CreateChangeNotification;
    procedure RemoveColumns;
    procedure RemoveDropTarget;
    procedure RemoveChangeNotification;
    procedure CheckUpdateItems;
    procedure DoBeginDrag;
    procedure DoNavigateTreeView;
    procedure GetDropTarget(pt:TPoint;out New:Boolean);
    function TryReleaseDropTarget:HResult;
    {$IFDEF LESS_THAN_130}
    procedure WMContextMenu(var Message: TWMContextMenu); message WM_CONTEXTMENU;
    {$ENDIF}
    procedure CNNotify(var Message: TWMNotify); message CN_NOTIFY;
    procedure DsmSetCount(var Message:TMessage);message DSM_SETCOUNT;
    procedure DsmNotifyUpdateItem(var Message:TMessage);message DSM_NOTIFYUPDATE;
    procedure DsmNotifyUpdateContents(var Message:TMessage);message DSM_NOTIFYUPDATECONTENTS;
    procedure DsmShellChangeNotify(var Message:TMessage);message DSM_SHELLCHANGENOTIFY;
    property ComboBoxControl: TWinControl read FComboBoxControl write FComboBoxControl;
    property FirstUpdateItem:Integer read FFirstUpdateItem write FFirstUpdateItem;
    property LastUpdateItem:Integer read FLastUpdateItem write FLastUpdateItem;
    property ItemProducer:TcxShellListViewProducer read FItemProducer;
    property CurrentDropTarget:IcxDropTarget read FCurrentDropTarget write FCurrentDropTarget;
    property DropTargetItem:TListItem read FDropTargetItem write SetDropTargetItem;
    property DraggedObject:IDataObject read FDraggedObject write FDraggedObject;
    property ChangeNotifyHandle:Integer read FChangeNotifyHandle write FChangeNotifyHandle;
    property TreeViewControl:TWinControl read FTreeViewControl write FTreeViewControl;
    // IcxDropTarget methods
    function DragEnter(const dataObj: IDataObject; grfKeyState: Longint;
      pt: TPoint; var dwEffect: Longint): HResult; stdcall;
    function IcxDropTarget.DragOver=IDropTargetDragOver;
    function IDropTargetDragOver(grfKeyState: Longint; pt: TPoint;
      var dwEffect: Longint): HResult; stdcall;
    function DragLeave: HResult; stdcall;
    function Drop(const dataObj: IDataObject; grfKeyState: Longint; pt: TPoint;
      var dwEffect: Longint): HResult; stdcall;
  public
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
    procedure BrowseParent;
    procedure SetTreeView(ATreeView:TWinControl);
    procedure ProcessTreeViewNavigate(apidl:PItemIDList);
    property Root:TcxShellListRoot read FRoot write FRoot;
    property DragDropSettings:TcxDragDropSettings read FDragDropSettings write FDragDropSettings;
    property Options:TcxShellOptions read FOptions write FOptions;
    property ListViewStyle:TcxListViewStyle read FListViewStyle write SetListViewStyle;
    property BeforeNavigation:TcxNavigationEvent read FBeforeNavigation write FBeforeNavigation;
    property AfterNavigation:TcxNavigationEvent read FAfterNavigation write FAfterNavigation;
    property OnRootChanged:TcxRootChangedEvent read FRootChanged write FRootChanged;
  end;

  TcxShellTreeRoot=class(TcxCustomShellRoot)
  protected
    procedure RootUpdated;override;
  end;

  TcxShellTreeItemProducer=class(TcxCustomItemProducer)
  private
    FNode: TTreeNode;
  protected
    function GetEnumFlags:Cardinal;override;
    function AllowBackgroundProcessing:Boolean;override;
    function GetShowToolTip:Boolean;override;
    property Node:TTreeNode read FNode write FNode;
    procedure InitializeItem(Item:TcxShellItemInfo);override;
    procedure CheckForSubitems(Item:TcxShellItemInfo);override;
  public
    constructor Create(AOwner:TWinControl);override;
    destructor Destroy;override;
    procedure SetItemsCount(Count:Integer);override;
    procedure NotifyUpdateItem(Index:Integer);override;
    procedure NotifyRemoveItem(Index:Integer);override;
    procedure NotifyAddItem(Index:Integer);override;
    procedure ProcessItems(Folder:IShellFolder;apidl:PItemIDList;ANode:TTreeNode;cPreloadItems:Integer);reintroduce;overload;
    function CheckUpdates:Boolean;
  end;

  PcxShellTreeItemProducer=^TcxShellTreeItemProducer;

  TcxCustomInnerShellTreeView=class(TCustomTreeView, IcxDropTarget)
  private
    FComboBoxControl: TWinControl;
    FNavigation: Boolean;
    FDraggedObject: IDataObject;
    FShowInfoTips: Boolean;
    FChangeNotifyHandle: Integer;
    FCurrentDropTarget: IcxDropTarget;
    FPrevTargetNode: TTreeNode;
    FRoot: TcxShellTreeRoot;
    FDragDropSettings: TcxDragDropSettings;
    FOptions: TcxShellOptions;
    FItemProducersList: TThreadList;
    FInternalSmallImages:THandle;
    FNotificationLock:Boolean;
    FListView: TcxCustomInnerShellListView;
    FRootChanged: TcxRootChangedEvent;
    procedure SetPrevTargetNode(const Value: TTreeNode);
    function GetNodeFromItem(const Item: TTVItem): TTreeNode;
    procedure SetListView(const Value: TcxCustomInnerShellListView);
    property ItemProducersList:TThreadList read FItemProducersList;
    property CurrentDropTarget:IcxDropTarget read FCurrentDropTarget write FCurrentDropTarget;
    property PrevTargetNode:TTreeNode read FPrevTargetNode write SetPrevTargetNode;
    property DraggedObject:IDataObject read FDraggedObject write FDraggedObject;
    property Navigation:Boolean read FNavigation write FNavigation;
  protected
    procedure CreateWnd; override;
    procedure DestroyWnd; override;
    procedure Change(Node: TTreeNode); override;
    function CanEdit(Node: TTreeNode): Boolean; override;
    procedure Edit(const Item: TTVItem); override;
    function CanExpand(Node: TTreeNode): Boolean; override;
    procedure Delete(Node: TTreeNode); override;
    procedure Collapse(Node: TTreeNode); override;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure Loaded;override;
    procedure DoContextPopup(MousePos: TPoint; var Handled: Boolean); {$IFNDEF LESS_THAN_130}override;{$ENDIF}
    procedure CreateDropTarget;
    procedure RemoveDropTarget;
    procedure AddItemProducer(Producer:TcxShellTreeItemProducer);
    procedure RemoveItemProducer(Producer:TcxShellTreeItemProducer);
    procedure DoBeginDrag;
    procedure DoNavigateListView;
    function TryReleaseDropTarget:HResult;
    procedure GetDropTarget(out New:Boolean;pt:TPoint);
    procedure DsmSetCount(var Message:TMessage);message DSM_SETCOUNT;
    procedure DsmNotifyUpdateItem(var Message:TMessage);message DSM_NOTIFYUPDATE;
    procedure DsmNotifyRemoveItem(var Message:TMessage);message DSM_NOTIFYREMOVEITEM;
    procedure DsmNotifyAddItem(var Message:TMessage);message DSM_NOTIFYADDITEM;
    procedure DsmNotifyUpdateContents(var Message:TMessage);message DSM_NOTIFYUPDATECONTENTS;
    procedure DsmShellChangeNotify(var Message:TMessage);message DSM_SHELLCHANGENOTIFY;
    procedure DsmDoNavigate(var Message:TMessage);message DSM_DONAVIGATE;
    procedure CNNotify(var Message: TWMNotify); message CN_NOTIFY;
    {$IFDEF LESS_THAN_130}
    procedure WMContextMenu(var Message: TWMContextMenu); message WM_CONTEXTMENU;
    {$ENDIF}
    property ChangeNotifyHandle:Integer read FChangeNotifyHandle write FChangeNotifyHandle;
    // IcxDropTarget methods
    function DragEnter(const dataObj: IDataObject; grfKeyState: Longint;
      pt: TPoint; var dwEffect: Longint): HResult; stdcall;
    function IcxDropTarget.DragOver=IDropTargetDragOver;
    function IDropTargetDragOver(grfKeyState: Longint; pt: TPoint;
      var dwEffect: Longint): HResult; stdcall;
    function DragLeave: HResult; stdcall;
    function Drop(const dataObj: IDataObject; grfKeyState: Longint; pt: TPoint;
      var dwEffect: Longint): HResult; stdcall;
    property ComboBoxControl: TWinControl read FComboBoxControl write FComboBoxControl;
  public
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
    procedure UpdateNode(ANode:TTreeNode);
    property Root:TcxShellTreeRoot read FRoot write FRoot;
    property DragDropSettings:TcxDragDropSettings read FDragDropSettings write FDragDropSettings;
    property Options:TcxShellOptions read FOptions write FOptions;
    property ShowInfoTips:Boolean read FShowInfoTips write FShowInfoTips;
    property ListView:TcxCustomInnerShellListView read FListView write SetListView; 
    property OnRootChanged:TcxRootChangedEvent read FRootChanged write FRootChanged;
  end;

implementation

uses
  ImgList, Math;

var
  LockpFolder:THandle;
  pFolder:IShellFolder;

{ TcxCustomInnerShellListView }

procedure TcxCustomInnerShellListView.BrowseParent;
var
  tempPidl:PItemIDList;
begin
  tempPidl:=GetPidlParent(ItemProducer.FolderPidl);
  try
    DoBeforeNavigation(tempPidl);
    Root.Pidl:=tempPidl;
    DoNavigateTreeView;
    DoAfterNavigation;
  finally
    DisposePidl(tempPidl);
  end;
end;

function TcxCustomInnerShellListView.CanEdit(Item: TListItem): Boolean;
var
  tempItem:PcxShellItemInfo;
begin
  Result:=True;
  if Item=nil then
     Exit;
  if Item.Index>ItemProducer.Items.Count-1 then
  begin
    Result:=False;
    Exit;
  end;
  tempItem:=ItemProducer.Items[Item.Index];
  Result:=tempItem.CanRename;
end;

procedure TcxCustomInnerShellListView.CheckUpdateItems;
begin
  ItemProducer.ClearItems;
  if IsWindow(Handle) and Root.IsValid then
  begin
    ItemProducer.ProcessItems(Root.ShellFolder,Root.Pidl,PRELOAD_ITEMS_COUNT);
    CreateChangeNotification;
    Refresh;
  end;
end;

procedure TcxCustomInnerShellListView.CNNotify(var Message: TWMNotify);
begin
  if (Message.NMHdr^.code=LVN_BEGINDRAG) or
     (Message.NMHdr^.code=LVN_BEGINRDRAG) then
  begin
    if not DragDropSettings.AllowDragObjects then
    begin
      inherited;
      Exit;
    end;
    if SelCount<=0 then
       Exit;
    DoBeginDrag;
  end
  else
  if Message.NMHdr^.code=LVN_GETINFOTIP then
     ItemProducer.DoGetInfoTip(Handle,PNMLVGetInfoTip(Message.NMHdr)^.iItem,
                               PNMLVGetInfoTip(Message.NMHdr)^.pszText,
                               PNMLVGetInfoTip(Message.NMHdr)^.cchTextMax)
  else
    inherited;
end;

constructor TcxCustomInnerShellListView.Create(AOwner: TComponent);
var
  FileInfo:TShFileInfo;
begin
  inherited Create(AOwner);
  FRoot:=TcxShellListRoot.Create(Self, 0);
  FDragDropSettings:=TcxDragDropSettings.Create;
  FOptions:=TcxShellOptions.Create(Self);
  FItemProducer:=TcxShellListViewProducer.Create(Self);
  FInternalSmallImages:=SHGetFileInfo('C:\',
          0, FileInfo, SizeOf(FileInfo), SHGFI_SYSICONINDEX or SHGFI_SMALLICON);
  FInternalLargeImages:=SHGetFileInfo('C:\',
          0, FileInfo, SizeOf(FileInfo), SHGFI_SYSICONINDEX or SHGFI_LARGEICON);
  OwnerData:=True;
  FNotificationLock:=False;
  FirstUpdateItem:=-1;
  LastUpdateItem:=-1;
  FTreeViewControl:=nil;
  HideSelection:=False;
  DragMode:=dmManual;
  DoubleBuffered:=True;
end;

procedure TcxCustomInnerShellListView.CreateChangeNotification;
var
  Items:PSHChangeNotifyEntry;
begin
  RemoveChangeNotification;
  if not Options.TrackShellChanges then
     Exit;
  New(Items);
  try
    Items.pidlPath:=GetPidlCopy(ItemProducer.FolderPidl);
    Items.bWatchSubtree:=True;
    ChangeNotifyHandle:=SHChangeNotifyRegister(Handle,SHCNF_ACCEPT_NON_INTERRUPTS,
                                                SHCNE_RENAMEITEM or
                                                SHCNE_CREATE or
                                                SHCNE_DELETE or
                                                SHCNE_MKDIR or
                                                SHCNE_RMDIR or
                                                SHCNE_ATTRIBUTES or
                                                SHCNE_UPDATEDIR or
                                                SHCNE_UPDATEITEM or
                                                SHCNE_UPDATEIMAGE or
                                                SHCNE_RENAMEFOLDER,
                                                DSM_SHELLCHANGENOTIFY,1,Items);
  finally
    DisposePidl(Items.pidlPath);
    Dispose(Items);
  end;
end;

procedure TcxCustomInnerShellListView.CreateColumns;
var
  i:Integer;
  Column:TListColumn;
begin
  if ListViewStyle<>lvsReport then
     Exit;
  Columns.BeginUpdate;
  try
    Columns.Clear;
    for i:=0 to ItemProducer.Details.Count-1 do
    begin
      Column:=Columns.Add;
      Column.Caption:=ItemProducer.Details[i].Text;
      Column.Alignment:=ItemProducer.Details[i].Alignment;
      Column.Width:=ItemProducer.Details[i].Width;
    end;
  finally
    Columns.EndUpdate;
  end;
end;

procedure TcxCustomInnerShellListView.CreateDropTarget;
var
  AIDropTarget: IDropTarget;
begin
  GetInterface(IDropTarget, AIDropTarget);
  RegisterDragDrop(Handle,AIDropTarget);
end;

procedure TcxCustomInnerShellListView.CreateWnd;
begin
  inherited CreateWnd;
  if HandleAllocated then
  begin
    if FInternalSmallImages<>0 then
       SendMessage(Handle, LVM_SETIMAGELIST, LVSIL_SMALL, FInternalSmallImages);
    if FInternalLargeImages<>0 then
       SendMessage(Handle, LVM_SETIMAGELIST, LVSIL_NORMAL, FInternalLargeImages);
    CreateDropTarget;
    if Root.Pidl=nil then
       Root.CheckRoot;
    CheckUpdateItems;
  end;
end;

procedure TcxCustomInnerShellListView.DblClick;
var
  Item:PcxShellItemInfo;
begin
  if Selected=nil then
     Exit;
  ItemProducer.LockRead;
  try
    Item:=ItemProducer.Items[Selected.Index];
    if Item.IsFolder and Options.AutoBrowseFolder then
       DoProcessNavigation(Item^)
    else
       DoProcessDefaultCommand(Item^);
  finally
    ItemProducer.UnlockRead;
  end;
end;

destructor TcxCustomInnerShellListView.Destroy;
begin
  FreeAndNil(FItemProducer);
  FreeAndNil(FDragDropSettings);
  FreeAndNil(FOptions);
  FreeAndNil(FRoot);
  inherited;
end;

procedure TcxCustomInnerShellListView.DestroyWnd;
begin
  RemoveColumns;
  RemoveDropTarget;
  RemoveChangeNotification;
  inherited;
end;

procedure TcxCustomInnerShellListView.DoAfterNavigation;
begin
  if Assigned(AfterNavigation) then
     AfterNavigation(Self,Root.Pidl,Root.CurrentPath);  
end;

procedure TcxCustomInnerShellListView.DoBeforeNavigation(fqPidl: PItemIDList);
var
  Desktop:IShellFolder;
  tempPath:WideString;
  StrName:TStrRet;
begin
  if Failed(SHGetDesktopFolder(Desktop)) then
     Exit;
  if Succeeded(Desktop.GetDisplayNameOf(fqPidl,SHGDN_NORMAL or SHGDN_FORPARSING,StrName)) then
     tempPath:=GetTextFromStrRet(StrName,fqPidl)
  else
     tempPath:='';
  if Assigned(BeforeNavigation) then
     BeforeNavigation(Self,fqPidl,tempPath);
end;

procedure TcxCustomInnerShellListView.DoBeginDrag;
var
  i:Integer;
  tempList:TList;
  pidlList:PItemIDList;
  pDataObject:IDataObject;
  pDropSource:IcxDropSource;
  dwEffect:Integer;
  Item:TListItem;
begin
  tempList:=TList.Create;
  try
    Item:=Selected;
    while Item<>nil do
    begin
      tempList.Add(GetPidlCopy(PcxShellItemInfo(ItemProducer.Items[Item.Index]).pidl));
      Item:=GetNextItem(Item,sdAll,[isSelected]);
    end;
    pidlList:=CreatePidlListFromList(tempList);
    try
      if Failed(ItemProducer.ShellFolder.GetUIObjectOf(Handle,SelCount,PItemIDList(pidlList^),IDataObject,nil,Pointer(pDataObject))) then
         Exit;
      pDropSource:=TcxDropSource.Create(Self);
      dwEffect:=DragDropSettings.DropEffectAPI;
      DoDragDrop(pDataObject,pDropSource,dwEffect,dwEffect);
    finally
      DisposePidl(pidlList);
    end;
  finally
    try
      for i:=0 to tempList.Count-1 do
          DisposePidl(tempList[i]);
    finally
      FreeAndNil(tempList);
    end;
  end;
end;

procedure TcxCustomInnerShellListView.DoContextPopup(MousePos: TPoint;
  var Handled: Boolean);
var
  Item:PcxShellItemInfo;
begin
  if Options.ContextMenus then
  begin
    if Selected=nil then
       Exit;
    ItemProducer.LockRead;
    try
      Item:=ItemProducer.Items[Selected.Index];
      Item.DisplayContextMenu(Handle,ItemProducer.ShellFolder, ClientToScreen(MousePos));
    finally
      ItemProducer.UnlockRead;
    end;
  end
  else
    inherited;
end;

procedure TcxCustomInnerShellListView.DoProcessDefaultCommand(
  Item: TcxShellItemInfo);
var
  fqPidl:PItemIDList;
  lpExecInfo:PShellExecuteInfo;
begin
  if Item.IsFolder then
     Exit;
  fqPidl:=ConcatenatePidls(ItemProducer.FolderPidl,Item.pidl);
  try
    New(lpExecInfo);
    try
      ZeroMemory(lpExecInfo,SizeOf(TShellExecuteInfo));
      lpExecInfo.cbSize:=SizeOf(TShellExecuteInfo);
      lpExecInfo.fMask:=SEE_MASK_INVOKEIDLIST;
      lpExecInfo.Wnd:=Handle;
      lpExecInfo.lpIDList:=fqPidl;
      lpExecInfo.nShow:=SW_SHOW;
      ShellExecuteEx(lpExecInfo);
    finally
      Dispose(lpExecInfo);
    end;
  finally
    DisposePidl(fqPidl);
  end;
end;

procedure TcxCustomInnerShellListView.DoProcessNavigation(
  Item: TcxShellItemInfo);
var
  fqPidl:PItemIDList;
begin
  if not Item.IsFolder then
     Exit;
  fqPidl:=ConcatenatePidls(ItemProducer.FolderPidl,Item.pidl);
  try
    DoBeforeNavigation(fqPidl);
    Root.Pidl:=fqPidl;
    DoNavigateTreeView;
    DoAfterNavigation;
  finally
    DisposePidl(fqPidl);
  end;
end;

function TcxCustomInnerShellListView.DragEnter(const dataObj: IDataObject;
  grfKeyState: Integer; pt: TPoint; var dwEffect: Integer): HResult;
var
  new:Boolean;
begin
  DraggedObject:=dataObj;
  GetDropTarget(pt,new);
  dwEffect:=DragDropSettings.DefaultDropEffectAPI;
  if CurrentDropTarget=nil then
  begin
    dwEffect:=DROPEFFECT_NONE;
    Result:=S_OK;
  end
  else
    Result:=CurrentDropTarget.DragEnter(dataObj,grfKeyState,pt,dwEffect)
end;

function TcxCustomInnerShellListView.DragLeave: HResult;
begin
  DraggedObject:=nil;
  Result:=TryReleaseDropTarget;
end;

function TcxCustomInnerShellListView.IDropTargetDragOver(grfKeyState: Integer; pt: TPoint;
  var dwEffect: Integer): HResult;
var
  New:Boolean;
begin
  GetDropTarget(pt,new);
  if CurrentDropTarget=nil then
  begin
    dwEffect:=DROPEFFECT_NONE;
    Result:=S_OK;
  end
  else
  begin
    if New then
       Result:=CurrentDropTarget.DragEnter(DraggedObject,grfKeyState,pt,dwEffect)
    else
       Result:=S_OK;
    if Succeeded(Result) then
       Result:=CurrentDropTarget.DragOver(grfKeyState,pt,dwEffect);
  end;
end;

function TcxCustomInnerShellListView.Drop(const dataObj: IDataObject;
  grfKeyState: Integer; pt: TPoint; var dwEffect: Integer): HResult;
var
  New:Boolean;
begin
  GetDropTarget(pt,new);
  if CurrentDropTarget=nil then
  begin
    dwEffect:=DROPEFFECT_NONE;
    Result:=S_OK;
  end
  else
  begin
    if New then
       Result:=CurrentDropTarget.DragEnter(dataObj,grfKeyState,pt,dwEffect)
    else
       Result:=S_OK;
    if Succeeded(Result) then
       Result:=CurrentDropTarget.Drop(dataObj,grfKeyState,pt,dwEffect);
  end;
  DraggedObject:=nil;
  TryReleaseDropTarget;
end;

procedure TcxCustomInnerShellListView.DsmNotifyUpdateContents(
  var Message: TMessage);
begin
  if not (csLoading in ComponentState) then
     CheckUpdateItems;
end;

procedure TcxCustomInnerShellListView.DsmNotifyUpdateItem(
  var Message: TMessage);
begin
  UpdateItems(Message.WParam,Message.WParam);
end;

procedure TcxCustomInnerShellListView.DsmSetCount(var Message: TMessage);
begin
  Items.Count:=Message.WParam;
  ItemFocused:=nil;
  Selected:=nil;
end;

procedure TcxCustomInnerShellListView.DsmShellChangeNotify(
  var Message: TMessage);
begin
  if FNotificationLock then
     Exit;
  FNotificationLock:=True;
  try
    CheckUpdateItems;
  finally
    FNotificationLock:=False;
  end;
end;

procedure TcxCustomInnerShellListView.Edit(const Item: TLVItem);
var
  tempItem:PcxShellItemInfo;
  NewName:WideString;
  pidlOut:PItemIDList;
begin
  inherited;
  if (ItemProducer.Items.Count-1)<Item.iItem then
     Exit;
  tempItem:=ItemProducer.Items[Item.iItem];
  NewName:=StrPas(Item.pszText);
  ItemProducer.ShellFolder.SetNameOf(Handle,tempItem.pidl,PWideChar(NewName),
                SHGDN_INFOLDER or SHGDN_FORPARSING,pidlOut);
  try
    tempItem.SetNewPidl(ItemProducer.ShellFolder,ItemProducer.FolderPidl,pidlOut);
  finally
    DisposePidl(pidlOut);
  end;
end;

procedure TcxCustomInnerShellListView.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if not IsEditing then
     case Key of
       VK_RETURN: begin
                    DblClick;
                  end;
       VK_BACK:   begin
                    BrowseParent;
                  end;
       VK_F5:     begin
                    Refresh;
                  end;
     end;
end;

procedure TcxCustomInnerShellListView.Loaded;
begin
  inherited;
  if csDesigning in ComponentState then
     Root.RootUpdated;
end;

procedure TcxCustomInnerShellListView.GetDropTarget(pt: TPoint;
  out New: Boolean);
var
  Item:TListItem;
  cpt:TPoint;
  tempDropTarget:IcxDropTarget;
  tempShellItem:PcxShellItemInfo;
  tempPidl:PItemIDList;
begin
  cpt:=ScreenToClient(pt);
  Item:=GetItemAt(cpt.X,cpt.Y);
  if Item=nil then
  begin // There are no items selected, so drop target is current opened folder
    if (DropTargetItem=nil) and (CurrentDropTarget<>nil) then
    begin
      New:=False;
      Exit;
    end;
    TryReleaseDropTarget;
    New:=True;
    if Failed(ItemProducer.ShellFolder.CreateViewObject(Handle,IcxDropTarget,{$IFDEF LESS_THAN_130}Pointer({$ENDIF}tempDropTarget{$IFDEF LESS_THAN_130}){$ENDIF})) then
       Exit;
    CurrentDropTarget:=tempDropTarget;
  end
  else
  begin // Use one of Items as Drop Target
    if Item=DropTargetItem then
    begin
      New:=False;
      Exit;
    end;
    TryReleaseDropTarget;
    New:=True;
    tempShellItem:=ItemProducer.Items[Item.Index];
    tempPidl:=GetPidlCopy(tempShellItem.pidl);
    try
      if Failed(ItemProducer.ShellFolder.GetUIObjectOf(Handle,1,tempPidl,IcxDropTarget,nil,{$IFDEF LESS_THAN_130}Pointer({$ENDIF}tempDropTarget{$IFDEF LESS_THAN_130}){$ENDIF})) then
         Exit;
    finally
      DisposePidl(tempPidl);
    end;
    CurrentDropTarget:=tempDropTarget;
    DropTargetItem:=Item;
  end;
end;

function TcxCustomInnerShellListView.OwnerDataFetch(Item: TListItem;
  Request: TItemRequest): Boolean;
var
  ShellItem:PcxShellItemInfo;
  i:Integer;
begin
  Result:=True;
  ItemProducer.LockRead;
  try
    if Item.Index>=ItemProducer.Items.Count then
       Exit;
    ShellItem:=ItemProducer.Items[Item.Index];
    ShellItem.CheckUpdate(ItemProducer.ShellFolder,ItemProducer.FolderPidl,True);
    Item.Caption:=ShellItem.Name;
    Item.ImageIndex:=ShellItem.IconIndex;
    if ListViewStyle=lvsReport then
    begin
      if ShellItem.Details.Count=0 then
         ShellItem.FetchDetails(Handle,ItemProducer.ShellFolder,ItemProducer.Details);
      for i:=0 to ShellItem.Details.Count-1 do
          Item.SubItems.Add(ShellItem.Details[i]);
    end;
    Item.Cut:=ShellItem.IsGhosted;
    if ShellItem.IsLink then
       Item.OverlayIndex:=1
    else
    if ShellItem.IsShare then
       Item.OverlayIndex:=0
    else
       Item.OverlayIndex:=-1;
    if not ShellItem.Updated then
       ItemProducer.FetchRequest(Item.Index,True);
  finally
    ItemProducer.UnlockRead;
  end;
  Result:=inherited OwnerDataFetch(Item,Request);
end;

procedure TcxCustomInnerShellListView.RemoveChangeNotification;
begin
  if ChangeNotifyHandle<>0 then
     SHChangeNotifyUnregister(ChangeNotifyHandle);
end;

procedure TcxCustomInnerShellListView.RemoveColumns;
begin
  Columns.Clear;
end;

procedure TcxCustomInnerShellListView.RemoveDropTarget;
begin
  RevokeDragDrop(Handle);
end;

procedure TcxCustomInnerShellListView.SetDropTargetItem(const Value: TListItem);
begin
  if FDropTargetItem<>nil then
     FDropTargetItem.DropTarget:=False;
  FDropTargetItem := Value;
  if FDropTargetItem<>nil then
     FDropTargetItem.DropTarget:=True;
end;

procedure TcxCustomInnerShellListView.SetListViewStyle(
  const Value: TcxListViewStyle);
begin
  if FListViewStyle<>Value then
  begin
    FListViewStyle:=Value;
    case FListViewStyle of
      lvsIcon:          ViewStyle:=vsIcon;
      lvsSmallIcon:     ViewStyle:=vsSmallIcon;
      lvsList:          ViewStyle:=vsList;
      lvsReport:        ViewStyle:=vsReport;
    end;
    CheckUpdateItems;
  end;
end;

function TcxCustomInnerShellListView.TryReleaseDropTarget:HResult;
begin
  Result:=S_OK;
  if CurrentDropTarget<>nil then
     Result:=CurrentDropTarget.DragLeave;
  CurrentDropTarget:=nil;
  DropTargetItem:=nil;
end;

{$IFDEF LESS_THAN_130}
procedure TcxCustomInnerShellListView.WMContextMenu(
  var Message: TWMContextMenu);
var
  Pt, Temp: TPoint;
  Handled: Boolean;
  PopupMenu: TPopupMenu;

  function InvalidPoint(const At: TPoint): Boolean;
  begin
    Result := (At.X = -1) and (At.Y = -1);
  end;

begin
  if Message.Result <> 0 then Exit;
  if csDesigning in ComponentState then
  begin
    inherited;
    Exit;
  end;

  Pt := SmallPointToPoint(Message.Pos);
  if InvalidPoint(Pt) then
    Temp := Pt
  else
  begin
    Temp := ScreenToClient(Pt);
    if not PtInRect(ClientRect, Temp) then
    begin
      inherited;
      Exit;
    end;
  end;

  Handled := False;
  DoContextPopup(Temp, Handled);
  Message.Result := Ord(Handled);
  if Handled then Exit;

  PopupMenu := GetPopupMenu;
  if (PopupMenu <> nil) and PopupMenu.AutoPopup then
  begin
    SendCancelMode(nil);
    PopupMenu.PopupComponent := Self;
    if InvalidPoint(Pt) then
      Pt := ClientToScreen(Point(0, 0));
    PopupMenu.Popup(Pt.X, Pt.Y);
    Message.Result := 1;
  end;

  if Message.Result = 0 then
    inherited;
end;
{$ENDIF}

procedure TcxCustomInnerShellListView.SetTreeView(ATreeView: TWinControl);
begin
  TreeViewControl:=ATreeView;
end;

var
  NavigationLock:Boolean;

procedure TcxCustomInnerShellListView.DoNavigateTreeView;
var
  tempPidl:PItemIDList;
begin
  if NavigationLock or (not Assigned(TreeViewControl) and not Assigned(ComboBoxControl)) then
     Exit;

  tempPidl:=GetPidlCopy(Root.Pidl);
  try
    if Assigned(TreeViewControl) and (TreeViewControl.Parent <> nil) then
    begin
      TreeViewControl.HandleNeeded;
      SendMessage(TreeViewControl.Handle,DSM_DONAVIGATE,WPARAM(tempPidl),0);
    end;
    if Assigned(ComboBoxControl) and (ComboBoxControl.Parent <> nil) then
    begin
      ComboBoxControl.HandleNeeded;
      SendMessage(ComboBoxControl.Handle,DSM_DONAVIGATE,WPARAM(tempPidl),0);
    end;
  finally
    DisposePidl(tempPidl);
  end;
end;

procedure TcxCustomInnerShellListView.ProcessTreeViewNavigate(
  apidl: PItemIDList);
begin
  NavigationLock:=True;
  try
    Root.Pidl:=apidl;
  finally
    NavigationLock:=False;
  end;
end;

{ TcxShellListRoot }

procedure TcxShellListRoot.RootUpdated;
begin
  (Owner as TcxCustomInnerShellListView).CheckUpdateItems;
  if Assigned(TcxCustomInnerShellListView(Owner).OnRootChanged) then
     TcxCustomInnerShellListView(Owner).OnRootChanged(Owner,Self);
end;

{ TcxShellListViewProducer }

function TcxShellListViewProducer.AllowBackgroundProcessing: Boolean;
begin
  Result:=True;
end;

function TcxShellListViewProducer.GetEnumFlags: Cardinal;
begin
  Result:=TcxCustomInnerShellListView(Owner).Options.GetEnumFlags;
end;

function TcxShellListViewProducer.GetShowToolTip: Boolean;
begin
  Result:=TcxCustomInnerShellListView(Owner).Options.ShowToolTip;
end;

procedure TcxShellListViewProducer.ProcessDetails(
  ShellFolder: IShellFolder; CharWidth: Integer);
begin
  inherited ProcessDetails(ShellFolder,TcxCustomInnerShellListView(Owner).StringWidth('X'));
  TcxCustomInnerShellListView(Owner).CreateColumns;
end;

{ TcxShellTreeRoot }

procedure TcxShellTreeRoot.RootUpdated;
begin
  TcxCustomInnerShellTreeView(Owner).Items.Clear;
  TcxCustomInnerShellTreeView(Owner).UpdateNode(nil);
  if Assigned(TcxCustomInnerShellTreeView(Owner).OnRootChanged) then
     TcxCustomInnerShellTreeView(Owner).OnRootChanged(Owner,Self);
end;

{ TcxCustomInnerShellTreeView }

procedure TcxCustomInnerShellTreeView.AddItemProducer(
  Producer: TcxShellTreeItemProducer);
var
  tempList:TList;
begin
  tempList:=ItemProducersList.LockList;
  try
    tempList.Add(Producer);
  finally
    ItemProducersList.UnlockList;
  end;
end;

function TcxCustomInnerShellTreeView.CanEdit(Node: TTreeNode): Boolean;
var
  ItemProducer:TcxShellTreeItemProducer;
begin
  Result:=False;
  if Node.Parent=nil then
     Exit;
  ItemProducer:=TcxShellTreeItemProducer(Node.Parent.Data);
  ItemProducer.LockRead;
  try
    if (ItemProducer.Items.Count-1)<Node.Index then
       Exit;
    Result:=PcxShellItemInfo(ItemProducer.Items[Node.Index]).CanRename;
  finally
    ItemProducer.UnlockRead;
  end;
end;

function TcxCustomInnerShellTreeView.CanExpand(Node: TTreeNode): Boolean;
var
  ItemProducer:TcxShellTreeItemProducer;
  processingPidl:PItemIDList;
  processingFolder:IShellFolder;
begin
  Result:=True;
  if Node.Count=0 then
  begin
    if Node.Parent<>nil then
    begin
      ItemProducer:=TcxShellTreeItemProducer(Node.Parent.Data);
      Result:=PcxShellItemInfo(ItemProducer.Items[Node.Index]).IsFolder;
      Node.HasChildren:=Result;
      if not Result then
         Exit;
      if (ItemProducer.Items.Count-1)<Node.Index then
      begin
        Result:=False;
        Exit;
      end;
      if Failed(ItemProducer.ShellFolder.BindToObject(PcxShellItemInfo(ItemProducer.
            Items[Node.Index]).pidl,nil,IID_IShellFolder,{$IFDEF LESS_THAN_130}Pointer({$ENDIF}processingFolder{$IFDEF LESS_THAN_130}){$ENDIF})) then
      begin
        Result:=False;
        Exit;
      end;
      processingPidl:=ConcatenatePidls(ItemProducer.FolderPidl,
                           PcxShellItemInfo(ItemProducer.Items[Node.Index]).pidl);
    end
    else
    begin
      processingFolder:=Root.ShellFolder;
      processingPidl:=GetPidlCopy(Root.Pidl);
    end;
    try
      ItemProducer:=TcxShellTreeItemProducer(Node.Data);
      ItemProducer.ProcessItems(processingFolder,processingPidl,Node,0);
    finally
      DisposePidl(processingPidl);
    end;
  end;
end;

procedure TcxCustomInnerShellTreeView.CNNotify(var Message: TWMNotify);
var
  tempNode:TTreeNode;
  ItemProducer:TcxShellTreeItemProducer;
begin
  if (Message.NMHdr^.code=TVN_BEGINDRAG) or
     (Message.NMHdr^.code=TVN_BEGINRDRAG) then
  begin
    if not DragDropSettings.AllowDragObjects then
    begin
      inherited;
      Exit;
    end;
    with PNMTreeView(Message.NMHdr)^ do
      Selected:=GetNodeFromItem(ItemNew);
    DoBeginDrag;
  end
  else
  if Message.NMHdr^.code=TVN_GETINFOTIP then
  begin
     tempNode:=Items.GetNode(PNMTVGetInfoTip(Message.NMHdr)^.hItem);
     if (tempNode<>nil) and (tempNode.Parent<>nil) then
     begin
       ItemProducer:=TcxShellTreeItemProducer(tempNode.Parent.Data);
       ItemProducer.DoGetInfoTip(Handle,tempNode.Index,
              PNMTVGetInfoTip(Message.NMHdr)^.pszText,
              PNMTVGetInfoTip(Message.NMHdr)^.cchTextMax);
     end;
  end
  else
    inherited;
end;

procedure TcxCustomInnerShellTreeView.Collapse(Node: TTreeNode);
var
  ItemProducer:TcxShellTreeItemProducer;
begin
  inherited;
  ItemProducer:=TcxShellTreeItemProducer(Node.Data);
  ItemProducer.DestroyProcessingThread;
end;

constructor TcxCustomInnerShellTreeView.Create(AOwner: TComponent);
var
  FileInfo:TShFileInfo;
begin
  inherited;
  FRoot:=TcxShellTreeRoot.Create(Self, 0);
  FDragDropSettings:=TcxDragDropSettings.Create;
  FOptions:=TcxShellOptions.Create(Self);
  FItemProducersList:=TThreadList.Create;
  FInternalSmallImages:=SHGetFileInfo('C:\',0,FileInfo,SizeOf(FileInfo),
                                        SHGFI_SYSICONINDEX or SHGFI_SMALLICON);
  CurrentDropTarget:=nil;
  PrevTargetNode:=nil;
  DraggedObject:=nil;
  DoubleBuffered:=True;
  DragMode:=dmAutomatic;
  FShowInfoTips:=True;
  FNotificationLock:=False;
end;

procedure TcxCustomInnerShellTreeView.CreateDropTarget;
var
  AIDropTarget: IDropTarget;
begin
  GetInterface(IDropTarget, AIDropTarget);
  RegisterDragDrop(Handle,AIDropTarget);
end;

procedure TcxCustomInnerShellTreeView.CreateParams(var Params: TCreateParams);
begin
  inherited;
  if ShowInfoTips then
     Params.Style:=Params.Style or TVS_INFOTIP and (not TVS_NOTOOLTIPS);
end;

procedure TcxCustomInnerShellTreeView.CreateWnd;
begin
  inherited;
  if HandleAllocated then
  begin
    if FInternalSmallImages<>0 then
       SendMessage(Handle, TVM_SETIMAGELIST, TVSIL_NORMAL, FInternalSmallImages);
    if Root.Pidl=nil then
       Root.CheckRoot;
    UpdateNode(nil);
    CreateDropTarget;
  end;
end;

procedure TcxCustomInnerShellTreeView.Delete(Node: TTreeNode);
var
  ItemProducer:TcxShellTreeItemProducer;
begin
  ItemProducer:=TcxShellTreeItemProducer(Node.Data);
  if ItemProducer<>nil then
  begin
    ItemProducer.Free;
    Node.Data:=nil;
  end;
  inherited;
end;

destructor TcxCustomInnerShellTreeView.Destroy;
begin
  Items.Clear;
  FreeAndNil(FItemProducersList);
  FreeAndNil(FOptions);
  FreeAndNil(FDragDropSettings);
  FreeAndNil(FRoot);
  inherited;
end;

procedure TcxCustomInnerShellTreeView.DestroyWnd;
begin
  RemoveDropTarget;
{$IFNDEF LESS_THAN_D6}
  CreateWndRestores:=False;
{$ENDIF}
  inherited;
end;

procedure TcxCustomInnerShellTreeView.DoBeginDrag;
var
  ItemProducer:TcxShellTreeItemProducer;
  tempPidl:PItemIDList;
  pDataObject:IDataObject;
  pDropSource:IcxDropSource;
  dwEffect:Integer;
begin
  if Selected.Parent=nil then
     Exit;
  ItemProducer:=TcxShellTreeItemProducer(Selected.Parent.Data);
  ItemProducer.LockRead;
  try
    if (ItemProducer.Items.Count-1)<Selected.Index then
       Exit;
    tempPidl:=GetPidlCopy(PcxShellItemInfo(ItemProducer.Items[Selected.Index]).pidl);
    try
      if Failed(ItemProducer.ShellFolder.GetUIObjectOf(Handle,1,tempPidl,IDataObject,nil,{$IFDEF LESS_THAN_130}Pointer({$ENDIF}pDataObject{$IFDEF LESS_THAN_130}){$ENDIF})) then
         Exit;
      pDropSource:=TcxDropSource.Create(Self);
      dwEffect:=DragDropSettings.DropEffectAPI;
      DoDragDrop(pDataObject,pDropSource,dwEffect,dwEffect);
      if not TcxShellTreeItemProducer(Selected.Parent.Data).CheckUpdates then
         UpdateNode(Selected.Parent);
    finally
      DisposePidl(tempPidl);
    end;
  finally
    ItemProducer.UnlockRead;
  end;
end;

procedure TcxCustomInnerShellTreeView.DoContextPopup(MousePos: TPoint;
  var Handled: Boolean);
var
  Item:PcxShellItemInfo;
  ItemProducer:TcxShellTreeItemProducer;
begin
  if Options.ContextMenus then
  begin
    if (Selected=nil) or (Selected.Parent=nil) then
       Exit;
    ItemProducer:=TcxShellTreeItemProducer(Selected.Parent.Data);
    ItemProducer.LockRead;
    try
      Item:=ItemProducer.Items[Selected.Index];
      Item.DisplayContextMenu(Handle,ItemProducer.ShellFolder, ClientToScreen(MousePos));
    finally
      ItemProducer.UnlockRead;
    end;
  end
  else
    inherited;
end;

function TcxCustomInnerShellTreeView.DragEnter(const dataObj: IDataObject;
  grfKeyState: Integer; pt: TPoint; var dwEffect: Integer): HResult;
var
  New:Boolean;
begin
  DraggedObject:=dataObj;
  GetDropTarget(new,pt);
  dwEffect:=DragDropSettings.DefaultDropEffectAPI;
  if CurrentDropTarget=nil then
  begin
    dwEffect:=DROPEFFECT_NONE;
    Result:=S_OK;
  end
  else
    Result:=CurrentDropTarget.DragEnter(dataObj,grfKeyState,pt,dwEffect)
end;

function TcxCustomInnerShellTreeView.DragLeave: HResult;
begin
  DraggedObject:=nil;
  Result:=TryReleaseDropTarget;
end;

function TcxCustomInnerShellTreeView.IDropTargetDragOver(grfKeyState: Integer; pt: TPoint;
  var dwEffect: Integer): HResult;
var
  New:Boolean;
begin
  GetDropTarget(new,pt);
  if CurrentDropTarget=nil then
  begin
    dwEffect:=DROPEFFECT_NONE;
    Result:=S_OK;
  end
  else
  begin
    if New then
       Result:=CurrentDropTarget.DragEnter(DraggedObject,grfKeyState,pt,dwEffect)
    else
       Result:=S_OK;
    if Succeeded(Result) then
       Result:=CurrentDropTarget.DragOver(grfKeyState,pt,dwEffect);
  end;
end;

function TcxCustomInnerShellTreeView.Drop(const dataObj: IDataObject;
  grfKeyState: Integer; pt: TPoint; var dwEffect: Integer): HResult;
var
  New:Boolean;
begin
  GetDropTarget(new,pt);
  if CurrentDropTarget=nil then
  begin
    dwEffect:=DROPEFFECT_NONE;
    Result:=S_OK;
  end
  else
  begin
    if New then
       Result:=CurrentDropTarget.DragEnter(dataObj,grfKeyState,pt,dwEffect)
    else
       Result:=S_OK;
    if Succeeded(Result) then
       Result:=CurrentDropTarget.Drop(dataObj,grfKeyState,pt,dwEffect);
  end;
  PostMessage(Handle,DSM_SHELLCHANGENOTIFY,WPARAM(PrevTargetNode.Data),0);
  TryReleaseDropTarget;
end;

procedure TcxCustomInnerShellTreeView.DsmNotifyAddItem(var Message: TMessage);
var
  Node,NewNode:TTreeNode;
  ItemProducer:TcxShellTreeItemProducer;
  tempShellItem:PcxShellItemInfo;
begin
  Node:=TTreeNode(Message.LParam);
  ItemProducer:=TcxShellTreeItemProducer(Node.Data);
  ItemProducer.LockRead;
  try
    tempShellItem:=ItemProducer.Items[Message.WParam];
    NewNode:=Items.AddChild(Node,tempShellItem.Name);
    NewNode.Data:=TcxShellTreeItemProducer.Create(Self);
    NewNode.ImageIndex:=tempShellItem.IconIndex;
    NewNode.SelectedIndex:=tempShellItem.OpenIconIndex;
    NewNode.HasChildren:=tempShellItem.HasSubfolder;
  finally
    ItemProducer.UnlockRead;
  end;
end;

procedure TcxCustomInnerShellTreeView.DsmNotifyRemoveItem(
  var Message: TMessage);
var
  Node:TTreeNode;
begin
  Node:=TTreeNode(Message.LParam);
  if Message.WParam<Node.Count then
     Node.Item[Message.WParam].Delete;
end;

procedure TcxCustomInnerShellTreeView.DsmNotifyUpdateContents(
  var Message: TMessage);
begin
  if not (csLoading in ComponentState) then
     UpdateNode(nil);
end;

procedure TcxCustomInnerShellTreeView.DsmNotifyUpdateItem(
  var Message: TMessage);
var
  Node:TTreeNode;
  ItemProducer:TcxShellTreeItemProducer;
  tempShellItem:PcxShellItemInfo;
begin
  Node:=TTreeNode(Message.LParam);
  if (Node.Count<=Message.WParam) or (Node.Count=0) then
     Exit;
  ItemProducer:=TcxShellTreeItemProducer(Node.Data);
  ItemProducer.LockRead;
  try
    tempShellItem:=ItemProducer.Items[Message.WParam];
    Node[Message.WParam].ImageIndex:=tempShellItem.IconIndex;
    Node[Message.WParam].SelectedIndex:=tempShellItem.OpenIconIndex;
    Node[Message.WParam].Text:=tempShellItem.Name;
    Node[Message.WParam].HasChildren:=tempShellItem.HasSubfolder;
    Node[Message.WParam].Cut:=tempShellItem.IsGhosted;
    if tempShellItem.IsLink then
       Node[Message.WParam].OverlayIndex:=1
    else
    if tempShellItem.IsShare then
       Node[Message.WParam].OverlayIndex:=0
    else
       Node[Message.WParam].OverlayIndex:=-1;
  finally
    ItemProducer.UnlockRead;
  end;
end;

procedure TcxCustomInnerShellTreeView.DsmSetCount(var Message: TMessage);
var
  Node:TTreeNode;
  ItemProducer:TcxShellTreeItemProducer;
  i:Integer;
  NewNode:TTreeNode;
  tempShellItem:PcxShellItemInfo;
begin
  Node:=TTreeNode(Message.LParam);
  if Message.WParam=0 then
  begin
    Node.DeleteChildren;
    Node.HasChildren:=False;
    Exit;
  end;
  ItemProducer:=TcxShellTreeItemProducer(Node.Data);
  ItemProducer.LockRead;
  try
    Items.BeginUpdate;
    try
      for i:=0 to ItemProducer.Items.Count-1 do
      begin
        tempShellItem:=ItemProducer.Items[i];
        if not tempShellItem.Updated then
           ItemProducer.FetchRequest(i,False);
        NewNode:=Items.AddChild(Node,tempShellItem.Name);
        NewNode.Data:=TcxShellTreeItemProducer.Create(Self);
        NewNode.ImageIndex:=tempShellItem.IconIndex;
        NewNode.SelectedIndex:=tempShellItem.OpenIconIndex;
        NewNode.HasChildren:=tempShellItem.HasSubfolder;
        NewNode.Cut:=tempShellItem.IsGhosted;
        if tempShellItem.IsLink then
           NewNode.OverlayIndex:=1
        else
        if tempShellItem.IsShare then
           NewNode.OverlayIndex:=0
        else
           NewNode.OverlayIndex:=-1;
      end;
    finally
      Items.EndUpdate;
    end;
    if Node.Count=0 then
       Node.HasChildren:=False;
  finally
    ItemProducer.UnlockRead;
  end;
end;

procedure TcxCustomInnerShellTreeView.DsmShellChangeNotify(
  var Message: TMessage);
begin
  Sleep(100);
  if not TcxShellTreeItemProducer(Message.WParam).CheckUpdates then
     UpdateNode(PrevTargetNode);
end;

procedure TcxCustomInnerShellTreeView.Edit(const Item: TTVItem);
var
  Node:TTreeNode;
  itemProducer:TcxShellTreeItemProducer;
  tempItem:PcxShellItemInfo;
  NewName:WideString;
  pidlOut:PItemIDList;
begin
  inherited;
  Node:=GetNodeFromItem(Item);
  if (Node=nil) or (Node.Parent=nil) then
     Exit;
  itemProducer:=TcxShellTreeItemProducer(Node.Parent.Data);
  tempItem:=itemProducer.Items[Node.Index];
  NewName:=StrPas(Item.pszText);
  ItemProducer.ShellFolder.SetNameOf(Handle,tempItem.pidl,PWideChar(NewName),
                SHGDN_INFOLDER or SHGDN_FORPARSING,pidlOut);
  try
    tempItem.SetNewPidl(ItemProducer.ShellFolder,ItemProducer.FolderPidl,pidlOut);
  finally
    DisposePidl(pidlOut);
  end;
end;

procedure TcxCustomInnerShellTreeView.GetDropTarget(out New: Boolean;pt:TPoint);
var
  Node:TTreeNode;
  cpt:TPoint;
  ItemProducer:TcxShellTreeItemProducer;
  tempDropTarget:IcxDropTarget;
  tempShellItem:PcxShellItemInfo;
  tempPidl:PItemIDList;
  Res:HRESULT;
  tempShellFolder:IShellFolder;
begin
  cpt:=ScreenToClient(pt);
  Node:=GetNodeAt(cpt.X,cpt.Y);
  if Node=nil then
  begin
    TryReleaseDropTarget;
    Exit;
  end;
  if (Node=PrevTargetNode) and (CurrentDropTarget<>nil) then
  begin
    New:=False;
    Exit;
  end;
  TryReleaseDropTarget;
  New:=True;
  if Node.Parent=nil then
  begin // Root object selected
    ItemProducer:=TcxShellTreeItemProducer(Node.Data);
    if ItemProducer.ShellFolder=nil then
       Exit;
    Res:=ItemProducer.ShellFolder.CreateViewObject(Handle,IcxDropTarget,{$IFDEF LESS_THAN_130}Pointer({$ENDIF}tempDropTarget{$IFDEF LESS_THAN_130}){$ENDIF});
    if Failed(Res) then
       Exit;
  end
  else
  begin // Non-root object selected
    ItemProducer:=TcxShellTreeItemProducer(Node.Parent.Data);
    tempShellItem:=ItemProducer.Items[Node.Index];
    tempPidl:=GetPidlCopy(tempShellItem.pidl);
    try
      if tempShellItem.IsFolder then
      begin
        if Failed(ItemProducer.ShellFolder.BindToObject(tempPidl,nil,IID_IShellFolder,{$IFDEF LESS_THAN_130}Pointer({$ENDIF}tempShellFolder{$IFDEF LESS_THAN_130}){$ENDIF})) then
           Exit;
        if Failed(tempShellFolder.CreateViewObject(Handle,IcxDropTarget,{$IFDEF LESS_THAN_130}Pointer({$ENDIF}tempDropTarget{$IFDEF LESS_THAN_130}){$ENDIF})) then
           Exit;
      end
      else
      begin
        Res:=ItemProducer.ShellFolder.GetUIObjectOf(Handle,1,tempPidl,IcxDropTarget,nil,{$IFDEF LESS_THAN_130}Pointer({$ENDIF}tempDropTarget{$IFDEF LESS_THAN_130}){$ENDIF});
        if Failed(Res) then
           Exit;
      end;
    finally
      DisposePidl(tempPidl);
    end;
  end;
  PrevTargetNode:=Node;
  CurrentDropTarget:=tempDropTarget;
end;

function TcxCustomInnerShellTreeView.GetNodeFromItem(
  const Item: TTVItem): TTreeNode;
begin
  Result := nil;
  if Items <> nil then
    with Item do
      if (state and TVIF_PARAM) <> 0 then
        Result := Pointer(lParam)
      else
        Result := Items.GetNode(hItem);
end;

procedure TcxCustomInnerShellTreeView.Loaded;
begin
  inherited;
  UpdateNode(nil);
end;

procedure TcxCustomInnerShellTreeView.RemoveDropTarget;
begin
  RevokeDragDrop(Handle);
end;

procedure TcxCustomInnerShellTreeView.RemoveItemProducer(
  Producer: TcxShellTreeItemProducer);
var
  tempList:TList;
begin
  tempList:=ItemProducersList.LockList;
  try
    tempList.Remove(Producer);
  finally
    ItemProducersList.UnlockList;
  end;
end;

procedure TcxCustomInnerShellTreeView.SetPrevTargetNode(const Value: TTreeNode);
begin
  if FPrevTargetNode<>nil then
     FPrevTargetNode.DropTarget:=False;
  FPrevTargetNode := Value;
  if FPrevTargetNode<>nil then
     FPrevTargetNode.DropTarget:=True;
end;

function TcxCustomInnerShellTreeView.TryReleaseDropTarget: HResult;
begin
  Result:=S_OK;
  if CurrentDropTarget<>nil then
     Result:=CurrentDropTarget.DragLeave;
  CurrentDropTarget:=nil;
  PrevTargetNode:=nil;
end;

procedure TcxCustomInnerShellTreeView.UpdateNode(ANode: TTreeNode);
var
  uNode:TTreeNode;
begin
  if csLoading in ComponentState then
     Exit;
  uNode:=nil;
  if IsWindow(Handle) and Root.IsValid then
  begin
    if ANode=nil then
    begin
      if Items.Count=0 then
      begin
        uNode:=Items.AddFirst(nil,'');
        uNode.Data:=TcxShellTreeItemProducer.Create(Self);
      end
      else
      begin
        uNode:=Items[0];
        if uNode.Data=nil then
           uNode.Data:=TcxShellTreeItemProducer.Create(Self);
      end;
    end
    else
       uNode:=ANode;
    uNode.HasChildren:=True;
  end;
  if uNode<>nil then
     CanExpand(uNode);
end;

{$IFDEF LESS_THAN_130}
procedure TcxCustomInnerShellTreeView.WMContextMenu(
  var Message: TWMContextMenu);
var
  Pt, Temp: TPoint;
  Handled: Boolean;
  PopupMenu: TPopupMenu;

  function InvalidPoint(const At: TPoint): Boolean;
  begin
    Result := (At.X = -1) and (At.Y = -1);
  end;

begin
  if Message.Result <> 0 then Exit;
  if csDesigning in ComponentState then
  begin
    inherited;
    Exit;
  end;

  Pt := SmallPointToPoint(Message.Pos);
  if InvalidPoint(Pt) then
    Temp := Pt
  else
  begin
    Temp := ScreenToClient(Pt);
    if not PtInRect(ClientRect, Temp) then
    begin
      inherited;
      Exit;
    end;
  end;

  Handled := False;
  DoContextPopup(Temp, Handled);
  Message.Result := Ord(Handled);
  if Handled then Exit;

  PopupMenu := GetPopupMenu;
  if (PopupMenu <> nil) and PopupMenu.AutoPopup then
  begin
    SendCancelMode(nil);
    PopupMenu.PopupComponent := Self;
    if InvalidPoint(Pt) then
      Pt := ClientToScreen(Point(0, 0));
    PopupMenu.Popup(Pt.X, Pt.Y);
    Message.Result := 1;
  end;

  if Message.Result = 0 then
    inherited;
end;
{$ENDIF}

procedure TcxCustomInnerShellTreeView.SetListView(
  const Value: TcxCustomInnerShellListView);
begin
  if FListView<>Value then
  begin
    FListView := Value;
    FListView.SetTreeView(Self);
    DoNavigateListView;
  end;
end;

procedure TcxCustomInnerShellTreeView.DoNavigateListView;
var
  ATempPIDL: PItemIDList;
begin
  if (Items.Count = 0) or (not Assigned(ListView) and not Assigned(ComboBoxControl)) then
    Exit;

  if Selected <> nil then
    ATempPIDL := TcxShellTreeItemProducer(Selected.Data).FolderPidl
  else
    ATempPIDL := TcxShellTreeItemProducer(Items[0].Data).FolderPidl;
  if Assigned(ListView) then
    ListView.ProcessTreeViewNavigate(ATempPIDL);

  if Assigned(ComboBoxControl) and (ComboBoxControl.Parent <> nil) then
  begin
    ComboBoxControl.HandleNeeded;
    SendMessage(ComboBoxControl.Handle, DSM_DONAVIGATE, Integer(ATempPIDL), 0);
  end;
end;

procedure TcxCustomInnerShellTreeView.Change(Node: TTreeNode);
begin
  inherited;
  UpdateNode(Selected);
  if not Navigation then
     DoNavigateListView;
end;

procedure TcxCustomInnerShellTreeView.DsmDoNavigate(var Message: TMessage);
var
  srcPidl:PItemIDList;
  destPidl:PItemIDList;
  pFolder:IShellFolder;
  partDstPidl:PItemIDList;
  i:Integer;
  tempProducer:TcxShellTreeItemProducer;
  tempIndex:Integer;
begin
  Navigation:=True;
  Items.BeginUpdate;
  try
    if Failed(SHGetDesktopFolder(pFolder)) then
       Exit;
    srcPidl:=Root.Pidl;
    destPidl:=PItemIDList(Message.WParam);
    if GetPidlItemsCount(srcPidl)>GetPidlItemsCount(destPidl) then
    begin
      Root.Pidl:=destPidl;
      Items[0].Selected:=True;
      Exit;
    end;
    for i:=0 to GetPidlItemsCount(srcPidl)-1 do
        DestPidl:=GetNextItemID(DestPidl);
    Selected:=Items[0];
    for i:=0 to GetPidlItemsCount(destPidl)-1 do
    begin
      tempProducer:=Selected.Data;
      partDstPidl:=ExtractParticularPidl(destPidl);
      destPidl:=GetNextItemID(destPidl);
      if partDstPidl=nil then
         Break;
      try
        tempIndex:=tempProducer.GetItemIndexByPidl(partDstPidl);
        if tempIndex=-1 then
           Break;
        Selected:=Selected.Item[tempIndex];
      finally
        DisposePidl(partDstPidl);
      end;
    end;
  finally
    Items.EndUpdate;
    Navigation:=False;
  end;

  if Selected <> nil then
    SendMessage(Handle, TVM_ENSUREVISIBLE, 0, LPARAM(Selected.ItemId));
end;

{ TcxShellTreeItemProducer }

function TcxShellTreeItemProducer.AllowBackgroundProcessing: Boolean;
begin
  Result:=not TcxCustomInnerShellTreeView(Owner).Navigation;
end;

procedure TcxShellTreeItemProducer.CheckForSubitems(
  Item: TcxShellItemInfo);
begin
  inherited;
  if (Item<>nil) and (not Item.IsRemovable) then
     Item.CheckSubitems(ShellFolder,GetEnumFlags);
end;

function TcxShellTreeItemProducer.CheckUpdates:Boolean;
const
  R: array[Boolean] of Byte = (0, 1);
var
  pEnum:IEnumIDList;
  currentCelt:Cardinal;
  rPidl:PItemIDList;
  Item:PcxShellItemInfo;
  Res:HRESULT;
  SaveCursor:TCursor;
  tempList:TList;

  function ShellSortFunction(Item1, Item2: Pointer): Integer;
  begin
    Result:=0;
    if (Item1=nil) or (Item2=nil) then
       Exit;
    Result:=R[PcxShellItemInfo(Item2).IsFolder]-R[PcxShellItemInfo(Item1).IsFolder];
    if Result=0 then
       Result:=Smallint(pFolder.CompareIDs(0,PcxShellItemInfo(Item1).pidl,PcxShellItemInfo(Item2).pidl));
  end;

  procedure MergeItems(Existent,New:TList);
  var
    i,j:Integer;
    exstItem:PcxShellItemInfo;
    newItem:PcxShellItemInfo;
    found:Boolean;
  begin
    i:=0;
    while (i<Existent.Count) do
    begin
      exstItem:=Existent[i];
      found:=False;
      for j:=0 to New.Count-1 do
      begin
        newItem:=New[j];
        if Smallint(ShellFolder.CompareIDs(0,exstItem.pidl,newItem.pidl))=0 then
        begin
          exstItem.Free;
          Existent[i]:=newItem;
          New.Remove(newItem);
          found:=True;
          Break;
        end;
      end;
      if not found then
      begin
        NotifyRemoveItem(i);
        Existent.Remove(exstItem);
        exstItem.Free;
      end
      else
        Inc(i);
    end;
    for i:=0 to New.Count-1 do
    begin
      Existent.Add(New[i]);
      exstItem:=Existent[Existent.Count-1];
      exstItem.CheckUpdate(ShellFolder,FolderPidl,False);
      NotifyAddItem(Existent.Count-1);
    end;
  end;

begin
  Result:=False;
  if ShellFolder=nil then
     Exit;
  if Failed(ShellFolder.EnumObjects(Owner.ParentWindow,GetEnumFlags,pEnum)) then
     Exit;
  currentCelt:=1;
  tempList:=TList.Create;
  SaveCursor:=Owner.Cursor;
  try
    try
      Owner.Cursor:=crHourGlass;
      repeat
        Res:=pEnum.Next(currentCelt,rPidl,currentCelt);
        try
          if Res=E_INVALIDARG then
          begin
            currentCelt:=1;
            Res:=pEnum.Next(currentCelt,rPidl,currentCelt);
          end;
          if Failed(Res) or (Res=S_FALSE) then
             Break;
          if currentCelt=0 then
             Break;
          New(Item);
          Item^:=TcxShellItemInfo.Create(ShellFolder,rPidl,True);
          if Item.Name='' then
          begin
            Item.Free;
            Dispose(Item);
            Continue;
          end;
          tempList.Add(Item);
        finally
          DisposePidl(rPidl);
        end;
      until((Res=S_FALSE) or (WaitForSingleObject(StopThreadEvent,0)=WAIT_OBJECT_0));
    finally
      UnlockWrite;
    end;
    WaitForSingleObject(LockpFolder,INFINITE);
    try
      pFolder:=ShellFOlder;
      tempList.Sort(@ShellSortFunction)
    finally
      ReleaseMutex(LockpFolder);
    end;
    MergeItems(Items,tempList);
  finally
    Owner.Cursor:=SaveCursor;
    FreeAndNil(tempList);
  end;
  Result:=True;
end;

constructor TcxShellTreeItemProducer.Create(AOwner: TWinControl);
begin
  inherited;
  TcxCustomInnerShellTreeView(Owner).AddItemProducer(Self);
end;

destructor TcxShellTreeItemProducer.Destroy;
begin
  TcxCustomInnerShellTreeView(Owner).RemoveItemProducer(Self);
  inherited;
end;

function TcxShellTreeItemProducer.GetEnumFlags: Cardinal;
begin
  Result:=TcxCustomInnerShellTreeView(Owner).Options.GetEnumFlags;
end;

function TcxShellTreeItemProducer.GetShowToolTip: Boolean;
begin
  Result:=TcxCustomInnerShellTreeView(Owner).Options.ShowToolTip;
end;

procedure TcxShellTreeItemProducer.InitializeItem(Item: TcxShellItemInfo);
begin
  inherited;
  Item.CheckUpdate(ShellFolder,FolderPidl,True);
end;

procedure TcxShellTreeItemProducer.NotifyAddItem(Index: Integer);
begin
  if (Owner.HandleAllocated) and (Node<>nil) then
     SendMessage(Owner.Handle,DSM_NOTIFYADDITEM,Index,Integer(Node));
end;

procedure TcxShellTreeItemProducer.NotifyRemoveItem(Index: Integer);
begin
  if (Owner.HandleAllocated) and (Node<>nil) then
     SendMessage(Owner.Handle,DSM_NOTIFYREMOVEITEM,Index,Integer(Node));
end;

procedure TcxShellTreeItemProducer.NotifyUpdateItem(Index: Integer);
begin
  if (Owner.HandleAllocated) and (Node<>nil) then
     SendMessage(Owner.Handle,DSM_NOTIFYUPDATE,Index,Integer(Node));
end;

procedure TcxShellTreeItemProducer.ProcessItems(Folder: IShellFolder;
  apidl: PItemIDList;ANode:TTreeNode;cPreloadItems:Integer);
var
  FileInfo:TShFileInfo;
begin
  Node:=ANode;
  SHGetFileInfo(PChar(apidl),0,FileInfo,SizeOf(FileInfo),SHGFI_PIDL or
        SHGFI_DISPLAYNAME or SHGFI_SYSICONINDEX);
  Node.Text:=StrPas(FileInfo.szDisplayName);
  Node.ImageIndex:=FileInfo.iIcon;
  SHGetFileInfo(PChar(apidl),0,FileInfo,SizeOf(FileInfo),SHGFI_PIDL or
                                  SHGFI_SYSICONINDEX or SHGFI_OPENICON);
  Node.SelectedIndex:=FileInfo.iIcon;
  ProcessItems(Folder,apidl,cPreloadItems);
end;

procedure TcxShellTreeItemProducer.SetItemsCount(Count: Integer);
begin
  if (Owner.HandleAllocated) and (Node<>nil) then
     SendMessage(Owner.Handle,DSM_SETCOUNT,Count,Integer(Node));
end;

initialization
  NavigationLock:=False;
  LockpFolder:=CreateMutex(nil,True,nil);

finalization
  CloseHandle(LockpFolder);

end.
