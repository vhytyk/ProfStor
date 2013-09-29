
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

unit cxShellCommon;

interface

{$I cxShellVer.inc}

uses
  Windows, Classes,
  {$IFDEF LESS_THAN_D6}
  Mask,
  {$ELSE}
  MaskUtils,
  {$ENDIF}
  {$IFDEF BCB}
    {$IFNDEF LESS_THAN_D6}
  Ole2,
    {$ENDIF}
  {$ENDIF}
  ActiveX, SysUtils, Controls, ShlObj, ShellApi, ComObj,
  Messages, Dialogs, Forms, Math, SyncObjs;

resourcestring
  SShellDefaultNameStr = 'Name';
  SShellDefaultSizeStr = 'Size';
  SShellDefaultTypeStr = 'Type';
  SShellDefaultModifiedStr = 'Modified';

  {$IFDEF LESS_THAN_D6}
const
  SID_IShellFolder2  = '{93F2F68C-1D1B-11D3-A30E-00C04F79ABD1}';
  SID_IEnumExtraSearch   = '{0E700BE1-9DB6-11D1-A1CE-00C04FD75D13}';
  SID_IShellDetails      = '{000214EC-0000-0000-C000-000000000046}';

  {IShellFolder2.GetDefaultColumnState Values}
  SHCOLSTATE_TYPE_STR     = $00000001;
  SHCOLSTATE_TYPE_INT     = $00000002;
  SHCOLSTATE_TYPE_DATE    = $00000003;
  SHCOLSTATE_TYPEMASK     = $0000000F;
  SHCOLSTATE_ONBYDEFAULT  = $00000010;   // should on by default in details view
  SHCOLSTATE_SLOW         = $00000020;   // will be slow to compute; do on a background thread
  SHCOLSTATE_EXTENDED     = $00000040;   // provided by a handler; not the folder
  SHCOLSTATE_SECONDARYUI  = $00000080;   // not displayed in context menu; but listed in the "More..." dialog
  SHCOLSTATE_HIDDEN       = $00000100;   // not displayed in the UI

  {$EXTERNALSYM IID_IShellDetails}
  IID_IShellDetails: TGUID = (
    D1:$000214EC; D2:$0000; D3:$0000; D4:($C0,$00,$00,$00,$00,$00,$00,$46));
  {$ENDIF}

// Interface declarations, that missed in D4 and D5 versions
{$IFDEF LESS_THAN_D6}
type
  {$EXTERNALSYM PExtraSearch}
  PExtraSearch = ^TExtraSearch;
  {$EXTERNALSYM tagExtraSearch}
  tagExtraSearch = record
    guidSearch: TGUID;
    wszFriendlyName,
    wszMenuText: array[0..79] of WideChar;
    wszHelpText: array[0..MAX_PATH] of WideChar;
    wszUrl: array[0..2047] of WideChar;
    wszIcon,
    wszGreyIcon,
    wszClrIcon: array[0..MAX_PATH+10] of WideChar;
  end;
  {$EXTERNALSYM TExtraSearch}
  TExtraSearch = tagExtraSearch;

  {$EXTERNALSYM IEnumExtraSearch}
  IEnumExtraSearch = interface
    [SID_IEnumExtraSearch]
    function Next(celt: ULONG; out rgelt: PExtraSearch;
      out pceltFetched: ULONG): HResult; stdcall;
    function Skip(celt: ULONG): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Clone(out ppEnum: IEnumExtraSearch): HResult; stdcall;
  end;

  {$EXTERNALSYM PShColumnID}
  PShColumnID = ^TShColumnID;
  {$EXTERNALSYM SHCOLUMNID}
  SHCOLUMNID = record
    fmtid: TGUID;
    pid: DWORD;
  end;
  {$EXTERNALSYM TShColumnID}
  TShColumnID = SHCOLUMNID;

 { IShellDetails is supported on Win9x and NT4; for >= NT5 use IShellFolder2 }
  _SHELLDETAILS = record
    fmt,
    cxChar: Integer;
    str: STRRET;
  end;
  {$EXTERNALSYM SHELLDETAILS}
  SHELLDETAILS = _SHELLDETAILS;
  TShellDetails = _SHELLDETAILS;
  PShellDetails = ^TShellDetails;

  IShellDetails = interface
    [SID_IShellDetails]
    function GetDetailsOf(pidl: PItemIDList; iColumn: UINT;
      var pDetails: TShellDetails): HResult; stdcall;
    function ColumnClick(iColumn: UINT): HResult; stdcall;
  end;

  {$EXTERNALSYM IShellFolder2}
  IShellFolder2 = interface(IShellFolder)
    [SID_IShellFolder2]
    function GetDefaultSearchGUID(out pguid: TGUID): HResult; stdcall;
    function EnumSearches(out ppEnum: IEnumExtraSearch): HResult; stdcall;
    function GetDefaultColumn(dwRes: DWORD; var pSort: ULONG;
      var pDisplay: ULONG): HResult; stdcall;
    function GetDefaultColumnState(iColumn: UINT; var pcsFlags: DWORD): HResult; stdcall;
    function GetDetailsEx(pidl: PItemIDList; const pscid: SHCOLUMNID;
      pv: POleVariant): HResult; stdcall;
    function GetDetailsOf(pidl: PItemIDList; iColumn: UINT;
      var psd: TShellDetails): HResult; stdcall;
    function MapNameToSCID(pwszName: LPCWSTR; var pscid: TShColumnID): HResult; stdcall;
  end;
{$ENDIF}
                                             
// cxShell common classes
type
  ITEMIDLISTARRAY=array [0..MaxInt div SizeOf(PItemIDList) - 1] of PItemIDList;
  PITEMIDLISTARRAY=^ITEMIDLISTARRAY;

  TcxBrowseFolder=(bfCustomPath, bfAltStartup, bfBitBucket,
           bfCommonDesktopDirectory, bfCommonDocuments,
           bfCommonFavorites, bfCommonPrograms,
           bfCommonStartMenu, bfCommonStartup, bfCommonTemplates, bfControls,
           bfDesktop, bfDesktopDirectory, bfDrives, bfPrinters,
           bfFavorites, bfFonts, bfHistory, bfMyMusic,
           bfMyPictures, bfNetHood, bfProfile, bfProgramFiles, bfPrograms,
           bfRecent, bfStartMenu, bfStartUp, bfTemplates);

  TcxDropEffect=(deCopy, deMove, deLink);
  TcxDropEffectSet=set of TcxDropEffect;

  TcxCustomItemProducer=class;

  IcxDropSource = interface(IDropSource)
  ['{FCCB8EC5-ABB4-4256-B34C-25E3805EA046}']
  end;

  TcxDropSource=class(TInterfacedObject, IcxDropSource)
  private
    FOwner: TWinControl;
  protected
    function QueryContinueDrag(fEscapePressed: BOOL;
      grfKeyState: Longint): HResult; stdcall;
    function GiveFeedback(dwEffect: Longint): HResult; stdcall;
  public
    constructor Create(AOwner:TWinControl);virtual;
    property Owner:TWinControl read FOwner;
  end;

  TcxShellOptions=class(TPersistent)
  private
    FContextMenus: Boolean;
    FShowFolders: Boolean;
    FShowToolTip: Boolean;
    FShowNonFolders: Boolean;
    FShowHidden: Boolean;
    FTrackShellChanges: Boolean;
    FAutoBrowseFolder: Boolean;
    FOwner: TWinControl;
    procedure SetShowFolders(const Value: Boolean);
    procedure SetShowHidden(const Value: Boolean);
    procedure SetShowNonFolders(const Value: Boolean);
    procedure NotifyUpdateContents;
  public
    constructor Create(AOwner:TWinControl);virtual;
    function GetEnumFlags:Cardinal;
    property Owner:TWinControl read FOwner;
  published
    property ShowFolders:Boolean read FShowFolders write SetShowFolders default True;
    property ShowNonFolders:Boolean read FShowNonFolders write SetShowNonFolders default True;
    property ShowHidden:Boolean read FShowHidden write SetShowHidden default False;
    property ContextMenus:Boolean read FContextMenus write FContextMenus default True;
    property TrackShellChanges:Boolean read FTrackShellChanges write FTrackShellChanges default True;
    property ShowToolTip:Boolean read FShowToolTip write FShowToolTip default False;
    property AutoBrowseFolder:Boolean read FAutoBrowseFolder write FAutoBrowseFolder default True;
  end;

  TcxDetailItem=record
    Text:String;
    Width:Integer;
    Alignment:TAlignment;
    ID:Integer;
  end;

  TcxRequestItem=record
    ItemIndex:Integer;
    ItemProducer:TcxCustomItemProducer;
    Locked:Boolean;
  end;

  PcxRequestItem=^TcxRequestItem;

  PcxDetailItem=^TcxDetailItem;

  TcxShellDetails=class
  private
    FItems: TList;
    function GetItems(Index: Integer): PcxDetailItem;
    function GetCount: Integer;
  protected
    property Items:TList read FItems;
  public
    constructor Create;
    destructor Destroy;override;
    procedure ProcessDetails(CharWidth:Integer;ShellFolder:IShellFolder;FileSystem:Boolean);
    procedure Clear;
    function Add:PcxDetailItem;
    procedure Remove(Item:PcxDetailItem);
    property Item[Index:Integer]:PcxDetailItem read GetItems;default;
    property Count:Integer read GetCount;
  end;

  TcxCustomShellRoot=class(TPersistent)
  private
    FBrowseFolder: TcxBrowseFolder;
    FCustomPath: WideString;
    FOwner: TPersistent;
    FParentWindow: HWND;
    FValid: Boolean;
    FShellFolder: IShellFolder;
    FPidl: PItemIDList;
    FAttributes: Cardinal;
    procedure SetBrowseFolder(const Value: TcxBrowseFolder);
    procedure SetCustomPath(const Value: WideString);
    procedure SetPidl(const Value: PItemIDList);
    function GetCurrentPath: WideString;
  protected
    procedure CheckRoot;virtual;
    procedure RootUpdated;virtual;abstract;
    property Owner: TPersistent read FOwner;
    property ParentWindow: HWND read FParentWindow;
  public
    constructor Create(AOwner: TPersistent; AParentWindow: HWND); virtual;
    destructor Destroy;override;
    procedure Assign(Source: TPersistent); override;
    property IsValid:Boolean read FValid;
    property ShellFolder:IShellFolder read FShellFolder;
    property Pidl:PItemIDList read FPidl write SetPidl;
    property CurrentPath:WideString read GetCurrentPath;
    property Attributes:Cardinal read FAttributes;
  published
    property BrowseFolder:TcxBrowseFolder read FBrowseFolder write SetBrowseFolder;
    property CustomPath:WideString read FCustomPath write SetCustomPath;
  end;

  TcxRootChangedEvent=procedure (Sender:TObject; Root:TcxCustomShellRoot) of object;

  TcxShellItemInfo=class
  private
    FUpdated: Boolean;
    Fpidl: PItemIDList;
    FInfoTip: WideString;
    FName: WideString;
    FIconIndex: Integer;
    FIsFolder: Boolean;
    FIsFilesystem: Boolean;
    FHasSubfolder: Boolean;
    FIsDropTarget: Boolean;
    FCanRename: Boolean;
    FOpenIconIndex: Integer;
    FDetails: TStrings;
    FIsGhosted: Boolean;
    FIsShare: Boolean;
    FIsLink: Boolean;
    FInitialized: Boolean;
    FUpdating: Boolean;
    FIsRemovable: Boolean;
  protected
    property Updating:Boolean read FUpdating write FUpdating;
  public
    constructor Create(OwnerFolder:IShellFolder;apidl:PItemIDList;Fast:Boolean);virtual;
    destructor Destroy;override;
    procedure CheckUpdate(ShellFolder:IShellFolder;FolderPidl:PItemIDList;Fast:Boolean);
    procedure CheckInitialize(ShellFolder:IShellFolder;apidl:PItemIDList);
    procedure FetchDetails(wnd:HWND;ShellFolder:IShellFolder;DetailsMap:TcxShellDetails);
    procedure DisplayContextMenu(wnd:HWND;ShellFolder:IShellFolder;Pos:TPoint);
    procedure CheckSubitems(ShellFolder:IShellFolder;EnumSettings:Cardinal);
    procedure SetNewPidl(pFolder:IShellFolder;FolderPidl,apidl:PItemIDList);
    property Name:WideString read FName;
    property pidl:PItemIDList read Fpidl;
    property IconIndex:Integer read FIconIndex;
    property OpenIconIndex:Integer read FOpenIconIndex;
    property InfoTip:WideString read FInfoTip;
    property IsFolder:Boolean read FIsFolder;
    property IsFilesystem:Boolean read FIsFilesystem;
    property IsGhosted:Boolean read FIsGhosted;
    property IsLink:Boolean read FIsLink;
    property IsRemovable:Boolean read FIsRemovable;
    property IsShare:Boolean read FIsShare;
    property HasSubfolder:Boolean read FHasSubfolder;
    property IsDropTarget:Boolean read FIsDropTarget;
    property CanRename:Boolean read FCanRename;
    property Details:TStrings read FDetails;
    property Updated:Boolean read FUpdated write FUpdated;
    property Initialized:Boolean read FInitialized;
  end;

  PcxShellItemInfo=^TcxShellItemInfo;

  TFetchThreadContext=class
  private
    FThreadID: Integer;
    FEvents: array [0..1] of THandle;
    FIsWorking:Boolean;
    FcsThreadContext:TCriticalSection;
    FFetchThreadTerminated: THandle;
    FItem: PcxRequestItem;
    FhThread: THandle;
    procedure SetIsWorking(const Value: Boolean);
    function GetIsWorking: Boolean;
    function GetItem: PcxRequestItem;
    procedure SetItem(const Value: PcxRequestItem);
  public
    constructor Create(AThreadID:Integer);virtual;
    destructor Destroy;override;
    function AskForProcessing(RequestItem:PcxRequestItem):Boolean;
    property ThreadID:Integer read FThreadID write FThreadID;
    property hThread:THandle read FhThread write FhThread;
    property NotifyThreadEvent:THandle read FEvents[0] write FEvents[0];
    property StopThreadEvent:THandle read FEvents[1] write FEvents[1];
    property FetchThreadTerminated:THandle read FFetchThreadTerminated write FFetchThreadTerminated;
    property IsWorking:Boolean read GetIsWorking write SetIsWorking;
    property Item:PcxRequestItem read GetItem write SetItem;
  end;

  PFetchThreadContext=^TFetchThreadContext;

  TcxCustomItemProducer=class
  private
    FItems: TList;
    FItemsLock: TMultiReadExclusiveWriteSynchronizer;
    FShellFolder: IShellFolder;
    FOwner: TWinControl;
    FFolderPidl: PItemIDList;
    FThreadHandle: THandle;
    FStopThreadEvent:THandle;
    FThreadStopped:THandle;
    FDetails: TcxShellDetails;
    FIsClearQueue: Boolean;
  protected
    procedure ThreadMethod;
    procedure FetchItems(cPreloadItems:Integer);
    function GetEnumFlags:Cardinal;virtual;abstract;
    function AllowBackgroundProcessing:Boolean;virtual;abstract;
    function GetShowToolTip:Boolean;virtual;abstract;
    procedure InitializeItem(Item:TcxShellItemInfo);virtual;
    procedure CheckForSubitems(Item:TcxShellItemInfo);virtual;
    procedure ClearFetchQueue;
    property ThreadHandle:THandle read FThreadHandle write FThreadHandle;
    property StopThreadEvent:THandle read FStopThreadEvent write FStopThreadEvent;
    property ThreadStopped:THandle read FThreadStopped write FThreadStopped;
    property ItemsLock:TMultiReadExclusiveWriteSynchronizer read FItemsLock;
    property ShellFolder:IShellFolder read FShellFolder;
    property FolderPidl:PItemIDList read FFolderPidl;
    property Owner:TWinControl read FOwner;
    property IsClearQueue:Boolean read FIsClearQueue write FIsClearQueue;
  public
    constructor Create(AOwner:TWinControl);virtual;
    destructor Destroy;override;
    procedure ProcessItems(Folder:IShellFolder;apidl:PItemIDList;cPreloadItems:Integer);virtual;
    procedure ProcessDetails(ShellFolder:IShellFolder;CharWidth:Integer);virtual;
    procedure FetchRequest(Index:Integer;Priority:Boolean=False);
    procedure ClearItems;
    procedure LockRead;
    procedure LockWrite;
    procedure UnlockRead;
    procedure UnlockWrite;
    procedure CreateProcessingThread;
    procedure DestroyProcessingThread;
    procedure SetItemsCount(Count:Integer);virtual;
    procedure NotifyUpdateItem(Index:Integer);virtual;
    procedure NotifyRemoveItem(Index:Integer);virtual;
    procedure NotifyAddItem(Index:Integer);virtual;
    procedure DoGetInfoTip(Handle:HWND;ItemIndex: Integer; InfoTip: PChar; cch:Integer);
    function GetItemByPidl(apidl:PItemIDList):PcxShellItemInfo;
    function GetItemIndexByPidl(apidl:PItemIDList):Integer;
    property Items:TList read FItems;
    property Details:TcxShellDetails read FDetails;
  end;

  TcxDragDropSettings=class(TPersistent)
  private
    FAllowDragObjects: Boolean;
    FDefaultDropEffect: TcxDropEffect;
    FDropEffect: TcxDropEffectSet;
    FScroll: Boolean;
    function GetDropEffectApi: DWORD;
    function GetDefaultDropEffectAPI: Integer;
  public
    property DropEffectAPI:DWORD read GetDropEffectApi;
    property DefaultDropEffectAPI:Integer read GetDefaultDropEffectAPI;
    constructor Create;
  published
    property AllowDragObjects:Boolean read FAllowDragObjects write FAllowDragObjects;
    property DropEffect:TcxDropEffectSet read FDropEffect write FDropEffect;
    property Scroll:Boolean read FScroll write FScroll;
    property DefaultDropEffect:TcxDropEffect read FDefaultDropEffect write FDefaultDropEffect;
  end;

  {$IFDEF LESS_THAN_130}
  TWMContextMenu = packed record
    Msg: Cardinal;
    hWnd: HWND;
    case Integer of
      0: (
        XPos: Smallint;
        YPos: Smallint);
      1: (
        Pos: TSmallPoint;
        Result: Longint);
  end;
  {$ENDIF}

  TShChangeNotifyEntry = packed record
    pidlPath: PItemIDList;
    bWatchSubtree: BOOL;
  end;

  DWORDITEMID=record
    cb: SHORT;
    dwItem1: DWORD;
    dwItem2: DWORD;
  end;

  PDWORDITEMID=^DWORDITEMID;

  PShChangeNotifyEntry = ^TShChangeNotifyEntry;

function GetTextFromStrRet(var Str:TStrRet;PIDL:PitemIDList):WideString;
function GetShellDetails(pFolder:IShellFolder;pidl:PItemIDList;out sd:IShellDetails):Hresult;
function cxFileTimeToDateTime(fTime:FILETIME):TDateTime;
function TryAddFetchThread:PFetchThreadContext;
function GetQueueItem(Producer:TcxCustomItemProducer;List:TList;var Index:Integer):PcxRequestItem;

{ Pidl Tools}

function GetPidlItemsCount(pidl:PItemIDList):Integer;
function GetPidlSize(pidl:PItemIDList):Integer;
function GetNextItemID(pidl:PItemIDList):PItemIDList;
function GetPidlCopy(pidl:PItemIDList):PItemIDList;
function GetLastPidlItem(pidl:PItemIDList):PItemIDList;
function GetPidlName(pidl:PItemIDList):WideString;
function ConcatenatePidls(pidl1,pidl2:PItemIDList):PItemIDList;
procedure DisposePidl(pidl:PItemIDList);
function GetPidlParent(pidl:PItemIDList):PItemIDList;
function CreateEmptyPidl:PItemIDList;
function CreatePidlListFromList(List:TList):PItemIDList;
function ExtractParticularPidl(pidl:PItemIDList):PItemIDList;

{ Unicode Tools }

procedure StrPLCopyW(Dest:PWideChar;Source:WideString;MaxLen:Cardinal);
function StrPasW(Source:PWideChar):WideString;
function StrLenW(Source:PWideChar):Cardinal;
function UpperCaseW(Source:WideString):WideString;
function LowerCaseW(Source:WideString):WideString;

{$IFDEF LESS_THAN_130}
procedure FreeAndNil(var T);
function GetRegStringValue(const Key, ValueName: string; RootKey: DWord = HKEY_CLASSES_ROOT): string;
{$ENDIF}

const
  DSM_SETCOUNT=CM_BASE+315;
  DSM_NOTIFYUPDATE=CM_BASE+316;
  DSM_NOTIFYREMOVEITEM=CM_BASE+318;
  DSM_NOTIFYADDITEM=CM_BASE+319;
  DSM_NOTIFYUPDATECONTENTS=CM_BASE+320;
  DSM_SHELLCHANGENOTIFY=CM_BASE+321;
  DSM_DONAVIGATE=CM_BASE+322;

  PRELOAD_ITEMS_COUNT=10;

  SHCNF_ACCEPT_INTERRUPTS =     $1;
  SHCNF_ACCEPT_NON_INTERRUPTS = $2;
  SHCNF_NO_PROXY =              $8000;

var
  cxMalloc:IMalloc;
  hShell32:Cardinal=0;
  SHChangeNotifyRegister:function (hwnd:HWND;dwFlags:DWORD;wEventMask:DWORD;
           uMsg:UINT;cItems:DWORD;lpItems:PShChangeNotifyEntry):Cardinal;stdcall;
  SHChangeNotifyUnregister:function (hNotify:Cardinal):Boolean;stdcall;
  FetchManagerHandle:THandle;      // thread manager thread handle
  FetchThreads:TThreadList;        // the list of working threads
  FetchQueue:TThreadList;          // the list of items, sheduled for fetching
  FetchEvents: array [0..1] of THandle; // control events for thread manager

const
  MaxFetchThreadsCount:Integer=20;    // the maximum number of threads in application

implementation

var
  sysFolderIconIndex,sysFolderOpenIconIndex,sysFileIconIndex:Integer;
  cxSHGetFolderLocation:function (wnd:HWND;nFolder:Integer;hToken:THandle;
             dwReserwed:DWORD;var ppidl:PItemIDList):HResult;stdcall;

function FetchManagerNotifyEvent:THandle; //  notification event for thread manager
begin
  Result:=FetchEvents[0];
end;

function FetchManagerStopEvent:THandle;   // finalization event for thread manager
begin
  Result:=FetchEvents[1];
end;

function cxShellThreadFunction(ItemProducer:TcxCustomItemProducer):Integer;stdcall;
begin
  CoInitializeEx(nil,COINIT_APARTMENTTHREADED);
  try
    ItemProducer.ThreadMethod;
  finally
    CoUninitialize;
    Result:=0;
    ExitThread(0);
  end;
end;

{$IFDEF LESS_THAN_130}
procedure FreeAndNil(var T);
begin
  TObject(T).Free;
  TObject(T):=nil;
end;

function GetRegStringValue(const Key, ValueName: string; RootKey: DWord = HKEY_CLASSES_ROOT): string;
var
  Size: DWord;
  RegKey: HKEY;
begin
  Result := '';
  if RegOpenKey(RootKey, PChar(Key), RegKey) = ERROR_SUCCESS then
  try
    Size := 256;
    SetLength(Result, Size);
    if RegQueryValueEx(RegKey, PChar(ValueName), nil, nil, PByte(PChar(Result)), @Size) = ERROR_SUCCESS then
      SetLength(Result, Size - 1) else
      Result := '';
  finally
    RegCloseKey(RegKey);
  end;
end;
{$ENDIF}

function GetTextFromStrRet(var Str:TStrRet;PIDL:PitemIDList):WideString;
var
  p:PChar;
begin
  case Str.uType of
    STRRET_CSTR:
      SetString(Result, Str.cStr, lStrLen(Str.cStr));
    STRRET_OFFSET:
      begin
        P:=@PIDL.mkid.abID[Str.uOffset - SizeOf(PIDL.mkid.cb)];
        SetString(Result, P, PIDL.mkid.cb - Str.uOffset);
      end;
    STRRET_WSTR:
      begin
        Result:=StrPasW(Str.pOleStr);
        cxMalloc.Free(Str.pOleStr);
      end;
  end;
end;

function GetShellDetails(pFolder:IShellFolder;pidl:PItemIDList;out sd:IShellDetails):Hresult;
begin
  Result:=pFolder.QueryInterface(IID_IShellDetails,sd);
  if Succeeded(Result) then
     Exit;
  Result:=pFolder.GetUIObjectOf(0,0,pidl,IID_IShellDetails,nil,{$IFDEF LESS_THAN_130}Pointer({$ENDIF}sd{$IFDEF LESS_THAN_130}){$ENDIF});
  if Succeeded(Result) then
     Exit;
  Result:=pFolder.CreateViewObject(0,IID_IShellDetails,{$IFDEF LESS_THAN_130}Pointer({$ENDIF}sd{$IFDEF LESS_THAN_130}){$ENDIF});
  if Succeeded(Result) then
     Exit;
  Result:=pFolder.GetUIObjectOf(0,1,pidl,IID_IShellDetails,nil,{$IFDEF LESS_THAN_130}Pointer({$ENDIF}sd{$IFDEF LESS_THAN_130}){$ENDIF});
end;

function cxFileTimeToDateTime(fTime:FILETIME):TDateTime;
var
  LocalTime:TFileTime;
  Age:Integer;
begin
  FileTimeToLocalFileTime(FTime,LocalTime);
  if FileTimeToDosDateTime(LocalTime,LongRec(Age).Hi,LongRec(Age).Lo) then
     Result:=FileDateToDateTime(Age)
  else
     Result:=-1;
end;

{ Unicode Tools }

function UpperCaseW(Source:WideString):WideString;
begin
  Result:=AnsiUpperCase(Source);
end;

function LowerCaseW(Source:WideString):WideString;
begin
  Result:=AnsiLowerCase(Source);
end;

function StrLenW(Source: PWideChar): Cardinal;
asm
  MOV     EDX, EDI
  MOV     EDI, EAX
  MOV     ECX, 0FFFFFFFFH
  XOR     AX, AX
  REPNE   SCASW
  MOV     EAX, 0FFFFFFFEH
  SUB     EAX, ECX
  MOV     EDI, EDX
end;

function StrPasW(Source:PWideChar):WideString;
var
  StringLength:Cardinal;
begin
  StringLength:=StrLenW(Source);
  SetLength(Result,StringLength);
  CopyMemory(Pointer(Result),Source,StringLength*2);
end;

procedure StrPLCopyW(Dest:PWideChar;Source:WideString;MaxLen:Cardinal);
begin 
  lstrcpynw(Dest,PWideChar(Source),MaxLen);
end;

{ PidlTools}

function GetPidlParent(pidl:PItemIDList):PItemIDList;
var
  SourceSize:Integer;
  PrevPidl:PItemIDList;
  InitialPidl:PItemIDList;
  TempPidl:PItemIDList;
begin
  Result:=nil;
  SourceSize:=0;
  InitialPidl:=pidl;
  PrevPidl:=nil;
  if pidl<>nil then
  begin
    while pidl.mkid.cb<>0 do
    begin
      Inc(SourceSize,pidl.mkid.cb);
      PrevPidl:=pidl;
      pidl:=GetNextItemID(pidl);
    end;
    if SourceSize>0 then
       Dec(SourceSize,PrevPidl.mkid.cb);
    Result:=cxMalloc.Alloc(SourceSize+SizeOf(SHITEMID));
    CopyMemory(Result,InitialPidl,SourceSize);
    TempPidl:=Pointer(Integer(Result)+SourceSize);
    TempPidl.mkid.cb:=0;
    TempPidl.mkid.abID[0]:=0;
  end;
end;

function CreateEmptyPidl:PItemIDList;
begin
  Result:=cxMalloc.Alloc(SizeOf(ITEMIDLIST));
  Result.mkid.cb:=0;
  Result.mkid.abID[0]:=0;
end;

function CreatePidlListFromList(List:TList):PItemIDList;
var
  i:Integer;
  tempResult:PITEMIDLISTARRAY;
begin
  Result:=nil;
  if List=nil then
     Exit;
  tempResult:=cxMalloc.Alloc(List.Count*SizeOf(ITEMIDLIST));
  for i:=0 to List.Count-1 do
      tempResult[i]:=List[i];
  Result:=Pointer(tempResult);
end;

function ExtractParticularPidl(pidl:PItemIDList):PItemIDList;
var
  temp:PItemIDList;
begin
  Result:=nil;
  if (pidl<>nil) and (pidl.mkid.cb<>0) then
  begin
    Result:=cxMalloc.Alloc(pidl.mkid.cb+SizeOf(SHITEMID));
    CopyMemory(Result,pidl,pidl.mkid.cb+SizeOf(SHITEMID));
  end;
  temp:=GetNextItemID(Result);
  temp.mkid.cb:=0;
  temp.mkid.abID[0]:=0;
end;

function ConcatenatePidls(pidl1,pidl2:PItemIDList):PItemIDList;
var
  cb1,cb2:Integer;
begin
  if (pidl1=nil) and (pidl2=nil) then
      Result:=nil
  else
  if pidl1=nil then
     Result:=GetPidlCopy(pidl2)
  else
  if pidl2=nil then
     Result:=GetPidlCopy(pidl1)
  else
  begin
    cb1:=GetPidlSize(pidl1);
    cb2:=GetPidlSize(pidl2)+SizeOf(SHITEMID);
    Result:=cxMalloc.Alloc(cb1+cb2);
    if Result<>nil then
    begin
      CopyMemory(Result,pidl1,cb1);
      CopyMemory(Pointer(Integer(Result)+cb1),pidl2,cb2);
    end;
  end;
end;

function GetPidlName(pidl:PItemIDList):WideString;
var
  pStr:PChar;
  pStrW:PWideChar;
begin
  Result:='';
  if pidl<>nil then
  begin
    if (Win32MajorVersion=4) and (Win32MinorVersion=0) then
    begin
      GetMem(pStr,MAX_PATH);
      try
        SHGetPathFromIDList(pidl,pStr);
        Result:=StrPas(pStr);
      finally
        FreeMem(pStr);
      end;
    end
    else
    begin
      GetMem(pStrW,MAX_PATH*2);
      try
        SHGetPathFromIDListW(pidl,pStrW);
        Result:=StrPasW(pStrW);
      finally
        FreeMem(pStrW);
      end;
    end;
  end;
end;

function GetLastPidlItem(pidl:PItemIDList):PItemIDList;
var
  TempPidl:PItemIDList;
begin
  Result:=nil;
  if pidl<>nil then
  begin
    TempPidl:=pidl;
    while TempPidl.mkid.cb<>0 do
    begin
      Result:=TempPidl;
      TempPidl:=GetNextItemID(TempPidl);
    end;
  end;
end;

procedure DisposePidl(pidl:PItemIDList);
begin
  if pidl<>nil then
     cxMalloc.Free(pidl);
end;

function GetPidlCopy(pidl:PItemIDList):PItemIDList;
var
  Size:Integer;
begin
  Result:=nil;
  if pidl<>nil then
  begin
    Size:=GetPidlSize(pidl)+SizeOf(SHITEMID);
    Result:=cxMalloc.Alloc(Size);
    CopyMemory(Result,pidl,Size);
  end;
end;

function GetPidlItemsCount(pidl:PItemIDList):Integer;
begin
  Result:=0;
  if pidl<>nil then
  begin
    while pidl.mkid.cb<>0 do
    begin
      Inc(Result);
      pidl:=GetNextItemID(pidl);
      if Result>MAX_PATH then
      begin
        Result:=-1;
        Break;
      end;
    end;
  end;
end;

function GetPidlSize(pidl:PItemIDList):Integer;
begin
  Result:=0;
  while (pidl<>nil) and (pidl.mkid.cb<>0) do
  begin
    Inc(Result,pidl.mkid.cb);
    pidl:=GetNextItemID(pidl);
  end;
end;

function GetNextItemID(pidl:PItemIDList):PItemIDList;
begin
  Result:=nil;
  if (pidl<>nil) and (pidl.mkid.cb<>0) then
     Result:=PItemIDLIst(Integer(pidl)+pidl.mkid.cb);
end;

{ TcxCustomShellRoot }

procedure TcxCustomShellRoot.CheckRoot;
var
  csidl:Cardinal;
  tempPidl:PItemIDList;
  DesktopFolder:IShellFolder;
  pchEaten,dwAttr:Cardinal;
  tempCustomPath:PWideChar;
begin
  SHGetDesktopFolder(DesktopFolder);
  tempPidl:=nil;
  FValid:=False;
  FShellFolder:=nil;
  if FPidl<>nil then
  begin
    DisposePidl(FPidl);
    FPidl:=nil;
  end;
  try
    if BrowseFolder=bfCustomPath then
    begin
      if CustomPath<>'' then
      begin
        tempCustomPath:=StringToOleStr(CustomPath);
        OleCheck(DesktopFolder.ParseDisplayName(ParentWindow,nil,
                                tempCustomPath,pchEaten,tempPidl,dwAttr));
      end;
    end
    else
    begin
      case BrowseFolder of
        bfAltStartup:                csidl:=$07;
        bfBitBucket:                 csidl:=$0A;
        bfCommonDesktopDirectory:    csidl:=$19;
        bfCommonDocuments:           csidl:=$2E;
        bfCommonFavorites:           csidl:=$1F;
        bfCommonPrograms:            csidl:=$17;
        bfCommonStartMenu:           csidl:=$16;
        bfCommonStartup:             csidl:=$18;
        bfCommonTemplates:           csidl:=$2D;
        bfDesktop:                   csidl:=$00;
        bfControls:                  csidl:=$03;
        bfPrinters:                  csidl:=$04;  
        bfDesktopDirectory:          csidl:=$10;
        bfDrives:                    csidl:=$11;
        bfFavorites:                 csidl:=$06;
        bfFonts:                     csidl:=$14;
        bfHistory:                   csidl:=$22;
        bfMyMusic:                   csidl:=$0D;
        bfMyPictures:                csidl:=$27;
        bfNetHood:                   csidl:=$12;
        bfProfile:                   csidl:=$28;
        bfProgramFiles:              csidl:=$26;
        bfPrograms:                  csidl:=$02;
        bfRecent:                    csidl:=$08;
        bfStartMenu:                 csidl:=$0B;
        bfStartUp:                   csidl:=$07;
        bfTemplates:                 csidl:=$15;
      else
                                     csidl:=$00;
      end;
      if Win32MajorVersion<5 then
         OleCheck(SHGetSpecialFolderLocation(ParentWindow,csidl,tempPidl))
      else
         OleCheck(cxSHGetFolderLocation(ParentWindow,csidl,0,0,tempPidl));
    end;
    if BrowseFolder=bfDesktop then
    begin
      FShellFolder:=DesktopFolder;
      FPidl:=GetPidlCopy(tempPidl);
      FValid:=True;
      FAttributes:=SFGAO_FILESYSTEM;
      RootUpdated;
    end
    else
      Pidl:=tempPidl;
  finally
    if tempPidl<>nil then
       DisposePidl(tempPidl);
  end;
end;

procedure TcxCustomShellRoot.SetPidl(const Value: PItemIDList);
var
  DesktopFolder:IShellFolder;
  pFolder:IShellFolder;
begin
  if Value=nil then
     Exit;
  if FPidl<>nil then
  begin
    DisposePidl(FPidl);
    FPidl:=nil;
    FValid:=False;
    FAttributes:=0;
  end;
  if Failed(SHGetDesktopFolder(DesktopFolder)) then
     Exit;
  if Succeeded(DesktopFolder.BindToObject(Value,nil,IID_IShellFolder,
                     {$IFDEF LESS_THAN_130}Pointer({$ENDIF}pFolder{$IFDEF LESS_THAN_130}){$ENDIF})) then
  begin
    FShellFolder:=pFolder;
    FPidl:=GetPidlCopy(Value);
    FValid:=True;
    FAttributes:=0;
    if Failed(DesktopFolder.GetAttributesOf(1,FPidl,FAttributes)) then
       FAttributes:=0;
  end
  else
  begin
    FShellFolder:=DesktopFolder;
    FPidl:=GetPidlCopy(Value);
    FValid:=True;
    FAttributes:=SFGAO_FILESYSTEM;
  end;
  RootUpdated;
end;

constructor TcxCustomShellRoot.Create(AOwner: TPersistent; AParentWindow: HWND);
begin
  FOwner := AOwner;
  FParentWindow := AParentWindow;
  FBrowseFolder:=bfDesktop;
  FCustomPath:='';
  FShellFolder:=nil;
  FPidl:=nil;
end;

destructor TcxCustomShellRoot.Destroy;
begin
  FShellFolder:=nil;
  DisposePidl(FPidl);
  inherited;
end;

procedure TcxCustomShellRoot.Assign(Source: TPersistent);
begin
  if Source is TcxCustomShellRoot then
    with TcxCustomShellRoot(Source) do
    begin
      Self.FBrowseFolder := FBrowseFolder;
      Self.FCustomPath := FCustomPath;
      Self.CheckRoot;
    end
  else
    inherited Assign(Source);
end;

procedure TcxCustomShellRoot.SetBrowseFolder(const Value: TcxBrowseFolder);
begin
  if FBrowseFolder <> Value then
  begin
    FBrowseFolder := Value;
    CheckRoot;
  end
  else
  if Pidl=nil then
     CheckRoot;
end;

procedure TcxCustomShellRoot.SetCustomPath(const Value: WideString);
begin
  FCustomPath := Value;
  CheckRoot;
end;

function TcxCustomShellRoot.GetCurrentPath: WideString;
var
  Desktop:IShellFolder;
  StrName:TStrRet;
begin
  Result:='';
  if Pidl<>nil then
  begin
    if Failed(SHGetDesktopFolder(Desktop)) then
       Exit;
    if Succeeded(Desktop.GetDisplayNameOf(Pidl,SHGDN_NORMAL or SHGDN_FORPARSING,StrName)) then
       Result:=GetTextFromStrRet(StrName,Pidl)
  end;
end;

{ TcxCustomItemProducer }

procedure TcxCustomItemProducer.ClearItems;
var
  i:Integer;
  tempItem:PcxShellItemInfo;
begin
  DestroyProcessingThread;
  ClearFetchQueue;
  LockWrite;
  try
    for i:=0 to Items.Count-1 do
    begin
      tempItem:=Items[i];
      tempItem.Free;
      Dispose(Items[i]);
    end;
    Items.Clear;
    FShellFolder:=nil;
    if FFolderPidl<>nil then
    begin
      DisposePidl(FFolderPidl);
      FFolderPidl:=nil;
    end;
  finally
    UnlockWrite;
  end;
end;

constructor TcxCustomItemProducer.Create(AOwner: TWinControl);
begin
  FItemsLock:=TMultiReadExclusiveWriteSynchronizer.Create;
  FOwner:=AOwner;
  FItems:=TList.Create;
  FShellFolder:=nil;
  FFolderPidl:=nil;
  FThreadHandle:=0;
  FDetails:=TcxShellDetails.Create;
  StopThreadEvent:=0;
  ThreadStopped:=0;
  IsClearQueue:=False;
end;

procedure TcxCustomItemProducer.CreateProcessingThread;
var
  ThreadID:Cardinal;
begin
  // Creating general processing thread
  if StopThreadEvent<>0 then
     ResetEvent(StopThreadEvent)
  else
     StopThreadEvent:=CreateEvent(nil,True,False,nil);
  if ThreadStopped<>0 then
     ResetEvent(ThreadStopped)
  else
     ThreadStopped:=CreateEvent(nil,True,False,nil);
  ThreadHandle:=CreateThread(nil,0,@cxShellThreadFunction,Self,0,
        ThreadID);
  SetThreadPriority(ThreadHandle,THREAD_PRIORITY_LOWEST);
end;

destructor TcxCustomItemProducer.Destroy;
begin
  DestroyProcessingThread;
  ClearItems;
  FreeAndNil(FDetails);
  FreeAndNil(FItems);
  FreeAndNil(FItemsLock);
  FShellFolder:=nil;
  if FFolderPidl<>nil then
  begin
    DisposePidl(FFolderPidl);
    FFolderPidl:=nil;
  end;
  inherited;
end;

procedure TcxCustomItemProducer.DestroyProcessingThread;
begin
  if WaitForSingleObject(ThreadStopped,0)=WAIT_TIMEOUT then
  begin
    SetEvent(StopThreadEvent);
    while WaitForSingleObject(ThreadStopped,1)=WAIT_TIMEOUT do
          Application.ProcessMessages;
  end;
  if ThreadHandle<>0 then
  begin
    CloseHandle(ThreadHandle);
    ThreadHandle:=0;
  end;
  if StopThreadEvent<>0 then
  begin
    CloseHandle(StopThreadEvent);
    StopThreadEvent:=0;
  end;
  if ThreadStopped<>0 then
  begin
    CloseHandle(ThreadStopped);
    ThreadStopped:=0;
  end;
end;

procedure TcxCustomItemProducer.LockRead;
begin
  ItemsLock.BeginRead;
end;

procedure TcxCustomItemProducer.LockWrite;
begin
  ItemsLock.BeginWrite;
end;

procedure TcxCustomItemProducer.ProcessItems(Folder:IShellFolder;apidl:PItemIDList;cPreloadItems:Integer);
begin
  while WaitForSingleObject(ThreadStopped,0)=WAIT_TIMEOUT do
        Application.ProcessMessages;
  if FShellFolder<>nil then
     FShellFolder:=nil;
  if FFolderPidl<>nil then
  begin
    DisposePidl(FFolderPidl);
    FFolderPidl:=nil;
  end;
  FShellFolder:=Folder;
  FFolderPidl:=GetPidlCopy(apidl);
  ProcessDetails(ShellFolder,cPreloadItems);
  FetchItems(cPreloadItems);
  if AllowBackgroundProcessing then
     CreateProcessingThread;
end;

procedure TcxCustomItemProducer.NotifyUpdateItem(Index: Integer);
begin
  if Owner.HandleAllocated then
    SendMessage(Owner.Handle,DSM_NOTIFYUPDATE,Index,0);
end;

procedure TcxCustomItemProducer.SetItemsCount(Count: Integer);
begin
  if Owner.HandleAllocated then
     SendMessage(Owner.Handle,DSM_SETCOUNT,Count,0);
end;

procedure TcxCustomItemProducer.ThreadMethod;
var
  i:Integer;
  item:PcxShellItemInfo;
begin
  LockRead;
  try
    for i:=0 to Items.Count-1 do
    begin
      if WaitForSingleObject(StopThreadEvent,0)=WAIT_OBJECT_0 then
         Break;
      item:=Items[i];
      if not item.Updated then
         FetchRequest(i,False);
    end;
  finally
    UnlockRead;
    SetEvent(ThreadStopped);
  end;
end;

procedure TcxCustomItemProducer.UnlockRead;
begin
  ItemsLock.EndRead;
end;

procedure TcxCustomItemProducer.UnlockWrite;
begin
  ItemsLock.EndWrite;
end;

procedure TcxCustomItemProducer.NotifyRemoveItem(Index: Integer);
begin
  if Owner.HandleAllocated then
     SendMessage(Owner.Handle,DSM_NOTIFYREMOVEITEM,Index,0);
end;

procedure TcxCustomItemProducer.NotifyAddItem(Index: Integer);
begin
  if Owner.HandleAllocated then
     SendMessage(Owner.Handle,DSM_NOTIFYADDITEM,Index,0);
end;

procedure TcxCustomItemProducer.InitializeItem(Item:TcxShellItemInfo);
begin
  // Do nothing by default
end;

var
  LockpFolder:THandle;
  pFolder:IShellFolder;

procedure TcxCustomItemProducer.FetchItems(cPreloadItems:Integer);
const
  R: array[Boolean] of Byte = (0, 1);
var
  pEnum:IEnumIDList;
  currentCelt:Cardinal;
  rPidl:PItemIDList;
  Item:PcxShellItemInfo;
  Res:HRESULT;
  SaveCursor:TCursor;
  PreloadInfo:Integer;

  function ShellSortFunction(Item1, Item2: Pointer): Integer;
  begin
    Result:=0;
    if (Item1=nil) or (Item2=nil) then
       Exit;
    Result:=R[PcxShellItemInfo(Item2).IsFolder]-R[PcxShellItemInfo(Item1).IsFolder];
    if Result=0 then
       Result:=Smallint(pFolder.CompareIDs(0,PcxShellItemInfo(Item1).pidl,PcxShellItemInfo(Item2).pidl));
  end;

begin
  if Failed(ShellFolder.EnumObjects(Owner.ParentWindow,GetEnumFlags,pEnum)) then
     Exit;
  currentCelt:=1;
  PreloadInfo:=cPreloadItems;
  LockWrite;
  SaveCursor:=Screen.Cursor;
  try
    try
      Screen.Cursor:=crHourGlass;
      repeat
        Res:=pEnum.Next(currentCelt,rPidl,currentCelt);
        if Res=E_INVALIDARG then
        begin
          currentCelt:=1;
          Res:=pEnum.Next(currentCelt,rPidl,currentCelt);
        end;
        if Failed(Res) or (Res=S_FALSE) then
           Break;
        if (currentCelt=0) or (rPidl=nil) then
           Break;
        try
          New(Item);
          Item^:=TcxShellItemInfo.Create(ShellFolder,rPidl,False);
          if Item.Name='' then
          begin
            Item.Free;
            Dispose(Item);
            Continue;
          end;
          if PreloadInfo>0 then
          begin
            Item.CheckUpdate(ShellFolder,FolderPidl,True);
            Dec(PreloadInfo);
          end
          else
            InitializeItem(Item^);
          Items.Add(Item);
        finally
          DisposePidl(rPidl);
        end;
      until(Res=S_FALSE);
    finally
      UnlockWrite;
    end;
    WaitForSingleObject(LockpFolder,INFINITE);
    try
      pFolder:=ShellFOlder;
      Items.Sort(@ShellSortFunction);
    finally
      ReleaseMutex(LockpFolder);
    end;
  finally
    Screen.Cursor:=SaveCursor;
  end;
  SetItemsCount(Items.Count);
end;

procedure TcxCustomItemProducer.ProcessDetails(ShellFolder: IShellFolder;
  CharWidth: Integer);
var
  DesktopFolder:IShellFolder;
  Attr:Cardinal;
  tempPidl:PitemIDList;
begin
  if Failed(SHGetDesktopFolder(DesktopFolder)) then
     Exit;
  Attr:=0;
  tempPidl:=GetPidlCopy(FolderPidl);
  try
    if Failed(DesktopFolder.GetAttributesOf(1,tempPidl,Attr)) then
       Attr:=0;
    Details.ProcessDetails(CharWidth,ShellFolder,(Attr and SFGAO_FILESYSTEM)=SFGAO_FILESYSTEM);
  finally
    DisposePidl(tempPidl);
  end;
end;

procedure TcxCustomItemProducer.DoGetInfoTip(Handle:HWND;ItemIndex: Integer;
  InfoTip: PChar; cch: Integer);
var
  tempShellItem:PcxShellItemInfo;
  tempPidl:PItemIDList;
  queryInfo:IQueryInfo;
  infoStr:PWideChar;
begin
  if GetShowToolTip then
  begin
    if ItemIndex>Items.Count-1 then
       Exit;
    tempShellItem:=Items[ItemIndex];
    tempPidl:=GetPidlCopy(tempShellItem.pidl);
    try
      if Failed(ShellFolder.GetUIObjectOf(Handle,1,tempPidl,
                                                 IQueryInfo,nil,{$IFDEF LESS_THAN_130}Pointer({$ENDIF}queryInfo{$IFDEF LESS_THAN_130}){$ENDIF})) then
         Exit;
      if Succeeded(queryInfo.GetInfoTip($FFFFFFFF,infoStr)) then
      begin
        StrPLCopy(InfoTip,StrPasW(infoStr),cch);
        cxMalloc.Free(infoStr);
      end;
    finally
      DisposePidl(tempPidl);
    end;
  end
  else
    StrPLCopy(InfoTip,'',cch);
end;

function TcxCustomItemProducer.GetItemByPidl(
  apidl: PItemIDList): PcxShellItemInfo;
var
  i:Integer;
  tempItem:PcxShellItemInfo;
begin
  Result:=nil;
  LockRead;
  try
    for i:=0 to Items.Count-1 do
    begin
      tempItem:=Items[i];
      if SmallInt(ShellFolder.CompareIDs(0,tempItem.pidl,apidl))=0 then
      begin
        Result:=tempItem;
        Break;
      end;
    end;
  finally
    UnlockRead;
  end;
end;

function TcxCustomItemProducer.GetItemIndexByPidl(
  apidl: PItemIDList): Integer;
var
  i:Integer;
  tempItem:PcxShellItemInfo;
begin
  Result:=-1;
  LockRead;
  try
    for i:=0 to Items.Count-1 do
    begin
      tempItem:=Items[i];
      if SmallInt(ShellFolder.CompareIDs(0,tempItem.pidl,apidl))=0 then
      begin
        Result:=i;
        Break;
      end;
    end;
  finally
    UnlockRead;
  end;
end;

procedure TcxCustomItemProducer.FetchRequest(Index: Integer;Priority:Boolean=False);
var
  tempList:TList;
  tempIndex:Integer;
  added:Boolean;
  tempRequestItem:PcxRequestItem;

  function NewRequestItem:PcxRequestItem;
  begin
    New(Result);
    Result.ItemIndex:=Index;
    Result.ItemProducer:=Self;
    Result.Locked:=False;
  end;

begin
  tempList:=FetchQueue.LockList;
  added:=False;
  try
    tempRequestItem:=GetQueueItem(Self,tempList,tempIndex);
    if tempIndex=-1 then
    begin
      if Priority then
         tempList.Insert(0,NewRequestItem)
      else
         tempList.Add(NewRequestItem);
      added:=True;
    end
    else
    if Priority then
    begin
      if not tempRequestItem.Locked then
      begin
        added:=True;
        tempList.Move(tempIndex,0);
      end;
    end;
  finally
    FetchQueue.UnlockList;
  end;
  if added then
  begin
    TryAddFetchThread;
    SetEvent(FetchManagerNotifyEvent);
  end;
end;

procedure TcxCustomItemProducer.ClearFetchQueue;
var
  tempList:TList;
  i:Integer;
  tempRequestItem:PcxRequestItem;
  missed:Boolean;
begin
  if IsClearQueue then
     Exit
  else
     IsClearQueue:=True;
  try
    repeat
      missed:=False;
      tempList:=FetchQueue.LockList;
      try
        i:=0;
        while (i<tempList.Count) do
        begin
          tempRequestItem:=tempList[i];
          if (tempRequestItem.ItemProducer=Self) then
          begin
            if not tempRequestItem.Locked then
            begin
              tempList.Remove(temprequestItem);
              Dispose(tempRequestItem);
              Continue;
            end
            else
              missed:=True;
          end;
          i:=i+1;
        end;
      finally
        FetchQueue.UnlockList;
      end;
      Application.ProcessMessages;
    until(not missed);
  finally
    IsClearQueue:=False;
  end;
end;

procedure TcxCustomItemProducer.CheckForSubitems(Item: TcxShellItemInfo);
begin
  // do nothing by default
end;

{ TcxShellItemInfo }

procedure TcxShellItemInfo.CheckInitialize(ShellFolder: IShellFolder;
  apidl: PItemIDList);
var
  attr:Cardinal;
  StrName:TStrRet;
begin
  if not Initialized then
  begin
    attr:=SFGAO_FOLDER;
    if Succeeded(ShellFolder.GetAttributesOf(1,aPidl,attr)) then
       FIsFolder:=(attr and SFGAO_FOLDER)=SFGAO_FOLDER
    else
    begin
      FIsFolder:=False;
      FIsFilesystem:=False;
      FIsDropTarget:=True;
      FCanRename:=True;
    end;
    if IsFolder then
       FHasSubfolder:=True
    else
       FHasSubfolder:=False;
    attr:=SFGAO_CONTENTSMASK;
    if Succeeded(ShellFolder.GetDisplayNameOf(aPidl,SHGDN_NORMAL,StrName)) then
      FName:=GetTextFromStrRet(StrName,aPidl)
    else
      FName:='';
    if IsFolder then
    begin
      FIconIndex:=sysFolderIconIndex;
      FOpenIconIndex:=sysFolderOpenIconIndex;
    end
    else
    begin
      FIconIndex:=sysFileIconIndex;
      FOpenIconIndex:=sysFileIconIndex;
    end;
    FInitialized:=True;
  end;
end;

{ TcxShellItemInfo }

procedure TcxShellItemInfo.CheckSubitems(ShellFolder:IShellFolder;EnumSettings:Cardinal);
var
  tempFolder:IShellFolder;
  tempEnum:IEnumIDList;
  rpidl:PItemIDList;
  fetched:Cardinal;
begin
  if Succeeded(ShellFolder.BindToObject(pidl,nil,IID_IShellFolder,{$IFDEF LESS_THAN_130}Pointer({$ENDIF}tempFolder{$IFDEF LESS_THAN_130}){$ENDIF})) then
     if tempFolder<>nil then
     begin
       if Succeeded(tempFolder.EnumObjects(0,EnumSettings,tempEnum)) then
          if tempEnum.Next(1,rpidl,fetched)=S_OK then
          try
            FHasSubfolder:=fetched=1;
          finally
            DisposePidl(rpidl);
          end;
     end;
end;

procedure TcxShellItemInfo.CheckUpdate(ShellFolder: IShellFolder;
                  FolderPidl:PItemIDList;Fast:Boolean);
var
  attr:Cardinal;
  FileInfo:TShFileInfo;
  fqPidl:PItemIDList;
  Flags:Cardinal;
  pszName:PChar;
  tempPidl:PItemIDList;
begin
  if Updated or Updating then
     Exit;
  try
    Updating:=True;
    Assert(pidl<>nil,'Item object not initialized');
    if pidl=nil then
       Exit;
    fqPidl:=ConcatenatePidls(FolderPidl,pidl);
    try
      attr:=0;
      tempPidl:=pidl;
      CheckInitialize(ShellFolder,tempPidl);
      if Fast then
      begin
        if not IsFolder then
        begin
          GetMem(pszName,MAX_PATH);
          try
            StrPLCopy(pszName,Name,MAX_PATH);
            SHGetFileInfo(pszName,FILE_ATTRIBUTE_NORMAL,FileInfo,SizeOf(TShFileInfo),
                                      SHGFI_SYSICONINDEX or SHGFI_USEFILEATTRIBUTES);
            FIconIndex:=FileInfo.iIcon;
            SHGetFileInfo(pszName,FILE_ATTRIBUTE_NORMAL,FileInfo,SizeOf(TShFileInfo),
                                      SHGFI_SYSICONINDEX or SHGFI_USEFILEATTRIBUTES or
                                      SHGFI_OPENICON);
            FOpenIconIndex:=FileInfo.iIcon;
          finally
            FreeMem(pszName);
          end;
        end
        else
        begin
          Flags:=SHGFI_PIDL or SHGFI_SYSICONINDEX;
          SHGetFileInfo(PChar(fqPidl),0,FileInfo,SizeOf(FileInfo),Flags);
          FIconIndex:=FileInfo.iIcon;
        end;
      end
      else
      begin
         // Processing attributes
         if Succeeded(ShellFolder.GetAttributesOf(1,TempPidl,attr)) then
            FIsFilesystem:=(attr and SFGAO_FILESYSTEM)=SFGAO_FILESYSTEM;
         attr:=SFGAO_GHOSTED or SFGAO_SHARE or SFGAO_LINK or SFGAO_REMOVABLE;
         if Succeeded(ShellFolder.GetAttributesOf(1,TempPidl,attr)) then
         begin
           FIsGhosted:=(attr and SFGAO_GHOSTED)=SFGAO_GHOSTED;
           FIsShare:=(attr and SFGAO_SHARE)=SFGAO_SHARE;
           FIsLink:=(attr and SFGAO_LINK)=SFGAO_LINK;
           FIsRemovable:=(attr and SFGAO_REMOVABLE)=SFGAO_REMOVABLE;
         end;
         attr:=SFGAO_CAPABILITYMASK;
         if Succeeded(ShellFolder.GetAttributesOf(1,TempPidl,attr)) then
         begin
           FIsDropTarget:=(attr and SFGAO_DROPTARGET)=SFGAO_DROPTARGET;
           FCanRename:=(attr and SFGAO_CANRENAME)=SFGAO_CANRENAME;
         end;
         // Processing icons
         Flags:=SHGFI_PIDL or SHGFI_DISPLAYNAME or
                         SHGFI_SYSICONINDEX or SHGFI_TYPENAME;
         SHGetFileInfo(PChar(fqPidl),0,FileInfo,SizeOf(FileInfo),Flags);
         FIconIndex:=FileInfo.iIcon;
         if FIsFolder then
            SHGetFileInfo(PChar(fqPidl),0,FileInfo,SizeOf(FileInfo),Flags or SHGFI_OPENICON);
         FOpenIconIndex:=FileInfo.iIcon;
         Updated:=True;
      end;
    finally
      DisposePidl(fqPidl);
    end;
  finally
    Updating:=False;
  end;
end;

constructor TcxShellItemInfo.Create(OwnerFolder:IShellFolder;apidl: PItemIDList;
                                                Fast:Boolean);
var
  withoutAV:Boolean;
begin
  // the following code required to get rid of bug, that occasionally appeared
  // on Windows XP. The pidl received from thr shell, anothed memory block
  // allocated internally, but occasionally appeared exception thad CopyMemory
  // can't be performed 
  repeat
    FDetails:=TStringList.Create;
    try
      Fpidl:=GetPidlCopy(apidl);
      withoutAV:=True;
    except
      withoutAV:=False;
    end;
  until(withoutAV);
  if not Fast then
     CheckInitialize(OwnerFolder,apidl)
  else
  begin
    FName:=' ';
    FIconIndex:=sysFileIconIndex;
    FOpenIconIndex:=sysFileIconIndex;
  end;
  FInfoTip:='';
  FUpdated:=False;
  FUpdating:=False;
end;

destructor TcxShellItemInfo.Destroy;
begin
  DisposePidl(Fpidl);
  FreeAndNil(FDetails);
  inherited;
end;

procedure GetSysFolderFileIcons;
var
  FileInfo:TShFileInfo;
begin
  SHGetFileInfo('C:\CXDUMMYFOLDER',FILE_ATTRIBUTE_DIRECTORY,FileInfo,SizeOf(FileInfo),
                    SHGFI_SYSICONINDEX or SHGFI_USEFILEATTRIBUTES);
  sysFolderIconIndex:=FileInfo.iIcon;
  SHGetFileInfo('C:\CXDUMMYFOLDER',FILE_ATTRIBUTE_DIRECTORY,FileInfo,SizeOf(FileInfo),
                    SHGFI_SYSICONINDEX or SHGFI_USEFILEATTRIBUTES or SHGFI_OPENICON);
  sysFolderOpenIconIndex:=FileInfo.iIcon;
  SHGetFileInfo('c:\cxdummyiconfile.cxdmyico',FILE_ATTRIBUTE_NORMAL,FileInfo,SizeOf(FileInfo),
                    SHGFI_SYSICONINDEX or SHGFI_USEFILEATTRIBUTES);
  sysFileIconIndex:=FileInfo.iIcon;
end;

function ContextMenuCallbackWnd(Wnd:HWND;Msg:Cardinal;wParam:WPARAM;
         lParam:LPARAM):Integer;stdcall;
var
  ContextMenu:IContextMenu2;
begin
  case Msg of
    WM_CREATE:        begin
                        ContextMenu:=IContextMenu2(PCREATESTRUCT(lParam).lpCreateParams);
                        SetWindowLong(Wnd,GWL_USERDATA,Integer(ContextMenu));
                        Result:=DefWindowProc(Wnd,Msg,wParam,lParam);
                      end;
    WM_INITMENUPOPUP: begin
                        ContextMenu:=IcontextMenu2(GetWindowLong(Wnd,GWL_USERDATA));
                        ContextMenu.HandleMenuMsg(Msg,wParam,lParam);
                        Result:=0;
                      end;
    WM_DRAWITEM,
    WM_MEASUREITEM:   begin
                        ContextMenu:=IcontextMenu2(GetWindowLong(Wnd,GWL_USERDATA));
                        ContextMenu.HandleMenuMsg(Msg,wParam,lParam);
                        Result:=1;
                      end;
    else              Result:=DefWindowProc(Wnd,Msg,wParam,lParam);
  end;
end;

function CreateCallbackWnd(ContextMenu:IContextMenu2):HWND;
const
  WndClassName='CXCMCALLBACKWND';
var
  WC:TWndClass;
begin
  ZeroMemory(@WC,SizeOf(WC));
  WC.lpszClassName:=WndClassName;
  WC.hInstance:=hInstance;
  WC.lpfnWndProc:=@ContextMenuCallbackWnd;
  Windows.RegisterClass(WC);
  Result:=CreateWindow(WndClassName,WndClassName,WS_POPUPWINDOW,0,0,0,0,0,0,
      hInstance,Pointer(ContextMenu));
end;

procedure TcxShellItemInfo.DisplayContextMenu(wnd:HWND;ShellFolder:IShellFolder;Pos: TPoint);
var
  tempPidl:PItemIDList;
  ContextMenu:IContextMenu;
  ContextMenu2:IContextMenu2;
  CallbackWnd:HWND;
  Menu:HMENU;
  Cmd:Longbool;
  ICI: TCMInvokeCommandInfo;
begin
  if (ShellFolder=nil) or (pidl=nil) then
     Exit;
  tempPidl:=GetPidlCopy(pidl);
  try
    if Failed(ShellFolder.GetUIObjectOf(wnd,1,tempPidl,IID_IContextMenu,nil,
                 {$IFDEF LESS_THAN_130}Pointer({$ENDIF}ContextMenu{$IFDEF LESS_THAN_130}){$ENDIF})) then
       Exit;
    Menu:=CreatePopupMenu;
    CallbackWnd:=0;
    if Menu<>0 then
    try
      if Failed(ContextMenu.QueryContextMenu(Menu,0,1,$7FFF,CMF_NORMAL)) then
         Exit;
      if Succeeded(ContextMenu.QueryInterface(IID_IContextMenu2,ContextMenu2)) then
         CallbackWnd:=CreateCallbackWnd(ContextMenu2);
      if CallbackWnd<>0 then
         Cmd:=TrackPopupMenu(Menu,TPM_LEFTALIGN or TPM_LEFTBUTTON or
              TPM_RIGHTBUTTON or TPM_RETURNCMD,Pos.X,Pos.Y,0,CallbackWnd,nil)
      else
         Cmd:=TrackPopupMenu(Menu,TPM_LEFTALIGN or TPM_LEFTBUTTON or
              TPM_RIGHTBUTTON or TPM_RETURNCMD,Pos.X,Pos.Y,0,wnd,nil);
      if Cmd then
      begin
        ZeroMemory(@ICI,SizeOf(ICI));
        ICI.cbSize:=SizeOf(ICI);
        ICI.hwnd:=wnd;
        ICI.lpVerb:=MakeIntResource(Longint(Cmd)-1);;
        ICI.nShow:=SW_SHOWNORMAL;
        ContextMenu.InvokeCommand(ICI);
      end;
    finally
      DestroyMenu(Menu);
      if CallbackWnd<>0 then
         DestroyWindow(CallbackWnd);
    end;
  finally
    DisposePidl(tempPidl);
  end;
end;

procedure TcxShellItemInfo.FetchDetails(wnd:HWND;ShellFolder: IShellFolder;DetailsMap:TcxShellDetails);
var
  sf2:IShellFolder2;
  sd:IShellDetails;
  columnDetails:TShellDetails;
  pDetailItem:PcxDetailItem;
  c:Integer;
  StrPath:TStrRet;
  tempName:PChar;
  FileInfo:TWIN32FindData;
  ffh:THandle;
  w:record
    case integer of
      0:(l,h:cardinal);
      1:(c:int64);
    end;

  function FormatSizeStr(Str:String):String;
  begin
    Result:=FormatMaskText('!### ### ### KB;0;*',Str);
  end;

  function GetFileTypeInfo(Filename:String):String;
  begin
    Result:=GetRegStringValue(GetRegStringValue(ExtractFileExt(FileName),''),'');
  end;

begin
  // Processing details
  Details.Clear;
  if Succeeded(ShellFolder.QueryInterface(IShellFolder2,sf2)) then
  begin
    for c:=0 to DetailsMap.Count-1 do
    begin
      pDetailItem:=DetailsMap[c];
      if pDetailItem.ID=0 then
         Continue; // Name column already exists
      sf2.GetDetailsOf(pidl,pDetailItem.ID,columnDetails);
      Details.Add(GetTextFromStrRet(columnDetails.str,pidl));
    end;
  end
  else
  if Succeeded(GetShellDetails(ShellFolder,pidl,sd)) then
  begin
    for c:=0 to DetailsMap.Count-1 do
    begin
      pDetailItem:=DetailsMap[c];
      if pDetailItem.ID=0 then
         Continue; // Name column already exists
      sd.GetDetailsOf(pidl,pDetailItem.ID,columnDetails);
      Details.Add(GetTextFromStrRet(columnDetails.str,pidl));
    end;
  end
  else
  if IsFilesystem then
  begin
    if Failed(ShellFolder.GetDisplayNameOf(pidl,SHGDN_NORMAL or SHGDN_FORPARSING,StrPath)) then
       Exit;
    GetMem(tempName,MAX_PATH);
    try
      StrPLCopy(tempName,GetTextFromStrRet(StrPath,pidl),MAX_PATH);
      ffh:=FindFirstFile(tempName,FileInfo);
      if ffh<>INVALID_HANDLE_VALUE then
      try
        w.h:=FileInfo.nFileSizeHigh;
        w.l:=FileInfo.nFileSizeLow;
        Details.Add(FormatSizeStr(IntToStr(Ceil(w.c/1024))));
        Details.Add(GetFileTypeInfo(Fileinfo.cFileName));
        Details.Add(DateTimeToStr(cxFileTimeToDateTime(FileInfo.ftLastWriteTime)));
      finally
        Windows.FindClose(ffh);
      end;
    finally
      FreeMem(tempName);
    end;
  end;
end;

procedure TcxShellItemInfo.SetNewPidl(pFolder:IShellFolder;FolderPidl,apidl: PItemIDList);
begin
  if apidl=nil then
     Exit;
  if Fpidl<>nil then
     DisposePidl(FPidl);
  FPidl:=GetPidlCopy(apidl);
  Updated:=False;
  CheckUpdate(pFolder,FolderPidl,False);
end;

{ TcxShellOptions }

constructor TcxShellOptions.Create(AOwner:TWinControl);
begin
  FOwner:=AOwner;
  FContextMenus:=True;
  FShowFolders:=True;
  FShowNonFolders:=True;
  FShowHidden:=False;
  FTrackShellChanges:=True;
  FAutoBrowseFolder:=True;
end;

function TcxShellOptions.GetEnumFlags: Cardinal;
begin
  if ShowFolders then
     Result:=SHCONTF_FOLDERS
  else
     Result:=0;
  if ShowNonFolders then
     Result:=Result or SHCONTF_NONFOLDERS;
  if ShowHidden then
     Result:=Result or SHCONTF_INCLUDEHIDDEN;
end;

procedure TcxShellOptions.NotifyUpdateContents;
begin
  if Owner.HandleAllocated then
     SendMessage(Owner.Handle,DSM_NOTIFYUPDATECONTENTS,0,0);
end;

procedure TcxShellOptions.SetShowFolders(const Value: Boolean);
begin
  FShowFolders := Value;
  NotifyUpdateContents;
end;

procedure TcxShellOptions.SetShowHidden(const Value: Boolean);
begin
  FShowHidden := Value;
  NotifyUpdateContents;
end;

procedure TcxShellOptions.SetShowNonFolders(const Value: Boolean);
begin
  FShowNonFolders := Value;
  NotifyUpdateContents;
end;

{ TcxShellDetails }

function TcxShellDetails.Add: PcxDetailItem;
begin
  New(Result);
  Items.Add(Result);
end;

procedure TcxShellDetails.Clear;
var
  di:PcxDetailItem;
begin
  while Items.Count<>0 do
  begin
    di:=Items.Last;
    Items.Remove(di);
    Dispose(di);
  end;
end;

constructor TcxShellDetails.Create;
begin
  FItems:=TList.Create;
end;

destructor TcxShellDetails.Destroy;
begin
  Clear;
  FreeAndNil(FItems);
end;

function TcxShellDetails.GetCount: Integer;
begin
  Result:=Items.Count;
end;

function TcxShellDetails.GetItems(Index: Integer): PcxDetailItem;
begin
  Result:=Items[Index];
end;

procedure TcxShellDetails.ProcessDetails(CharWidth:Integer;ShellFolder: IShellFolder;FileSystem:Boolean);
const
  AAlignment: array[0..2] of TAlignment =(taLeftJustify, taRightJustify, taCenter);
var
  sf2:IShellFolder2;
  sd:IShellDetails;
  columnDetails:TShellDetails;
  columnFlags:Cardinal;
  c:Integer;

  procedure SetItemInfo(Item:PcxDetailItem;Text:String;Width:Integer;
                      Alignment:TAlignment;ID:Integer);
  begin
    Item.Text:=Text;
    Item.Width:=Width*CharWidth;
    Item.Alignment:=Alignment;
    Item.ID:=ID;
  end;

  procedure AddItem(Details:TShellDetails;Index:Integer);
  var
    NewColumn:PcxDetailItem;
  begin
    NewColumn:=Add;
    SetItemInfo(NewColumn,GetTextFromStrRet(Details.str,nil),
                Details.cxChar,AAlignment[Details.fmt],Index);
  end;

begin
  ZeroMemory(@columnDetails,SizeOf(columnDetails));
  c:=0;
  Clear;
  if Succeeded(ShellFolder.QueryInterface(IShellFolder2,sf2)) then
  begin
    while sf2.GetDetailsOf(nil,c,columnDetails)=S_OK do
    begin
      Inc(c);
      if Succeeded(sf2.GetDefaultColumnState(c-1,columnFlags)) then
         if ((columnFlags and SHCOLSTATE_ONBYDEFAULT)<>SHCOLSTATE_ONBYDEFAULT) or
            ((columnFlags and SHCOLSTATE_HIDDEN)=SHCOLSTATE_HIDDEN) then
            Continue;
      AddItem(columnDetails,c-1);
    end;
  end
  else
  if Succeeded(GetShellDetails(ShellFolder,nil,sd)) then
  begin
    while sd.GetDetailsOf(nil,c,columnDetails)=S_OK do
    begin
      AddItem(columnDetails,c);
      Inc(c);
    end;
  end
  else
  begin // Processing creating columns manually (for Win95/98)
    SetItemInfo(Add,SShellDefaultNameStr,25,taLeftJustify,0);
    if FileSystem then
    begin
      SetItemInfo(Add,SShellDefaultSizeStr,10,taRightJustify,1);
      SetItemInfo(Add,SShellDefaultTypeStr,10,taLeftJustify,2);
      SetItemInfo(Add,SShellDefaultModifiedStr,14,taLeftJustify,3);
    end;
  end;
  inherited;
end;

procedure TcxShellDetails.Remove(Item: PcxDetailItem);
begin
  Items.Remove(Item);
  Dispose(Item);
end;

{ TcxDropTarget }

constructor TcxDropSource.Create(AOwner: TWinControl);
begin
  FOwner:=AOwner;
end;

function TcxDropSource.GiveFeedback(dwEffect: Integer): HResult;
begin
  Result:=DRAGDROP_S_USEDEFAULTCURSORS;
end;

function TcxDropSource.QueryContinueDrag(fEscapePressed: BOOL;
  grfKeyState: Integer): HResult;
begin
  if fEscapePressed then
     Result:=DRAGDROP_S_CANCEL
  else
  if ((grfKeyState and MK_LBUTTON)<>MK_LBUTTON) and
     ((grfKeyState and MK_RBUTTON)<>MK_RBUTTON) then
     Result:=DRAGDROP_S_DROP
  else
     Result:=S_OK;
end;

{ TcxDragDropSettings }

constructor TcxDragDropSettings.Create;
begin
  FAllowDragObjects:=True;
  FDefaultDropEffect:=deMove;
  FDropEffect:=[deMove,deCopy,deLink];
  FScroll:=True;
end;

function TcxDragDropSettings.GetDefaultDropEffectAPI: Integer;
begin
  case DefaultDropEffect of
    deCopy: Result:=DROPEFFECT_COPY;
    deMove: Result:=DROPEFFECT_MOVE;
    deLink: Result:=DROPEFFECT_LINK;
  else
            Result:=DROPEFFECT_NONE;
  end;
end;

function TcxDragDropSettings.GetDropEffectApi: DWORD;
begin
  Result:=0;
  if deCopy in DropEffect then
     Result:=Result or DROPEFFECT_COPY;
  if deMove in DropEffect then
     Result:=Result or DROPEFFECT_MOVE;
  if deLink in DropEffect then
     Result:=Result or DROPEFFECT_LINK;
  if Scroll and (Result<>0) then
     Result:=Result or DROPEFFECT_SCROLL;
end;

{ TFetchThreadContext }

function TFetchThreadContext.AskForProcessing(RequestItem:PcxRequestItem): Boolean;
begin
  Result:=not IsWorking;
  if Result then
  begin
    Item:=RequestItem;
    SetEvent(NotifyThreadEvent);
  end;
end;

constructor TFetchThreadContext.Create(AThreadID:Integer);
begin
  FIsWorking:=False;
  FThreadID:=AThreadID;
  StopThreadEvent:=CreateEvent(nil,True,False,nil);
  NotifyThreadEvent:=CreateEvent(nil,True,False,nil);
  FetchThreadTerminated:=0;
  FcsThreadContext:=TCriticalSection.Create;
  FItem:=nil;
end;

destructor TFetchThreadContext.Destroy;
begin
  CloseHandle(StopThreadEvent);
  CloseHandle(NotifyThreadEvent);
  if FetchThreadTerminated<>0 then
     CloseHandle(FetchThreadTerminated);
  FreeAndNil(FcsThreadContext);
  inherited;
end;

function TFetchThreadContext.GetIsWorking: Boolean;
begin
  FcsThreadContext.Acquire;
  try
    Result:=FIsWorking or (FItem<>nil);
  finally
    FcsThreadContext.Release;
  end;
end;

function TFetchThreadContext.GetItem: PcxRequestItem;
begin
  FcsThreadContext.Acquire;
  try
    Result:=FItem;
  finally
    FcsThreadContext.Release;
  end;
end;

procedure TFetchThreadContext.SetItem(const Value: PcxRequestItem);
begin
  FcsThreadContext.Acquire;
  try
    FItem:=Value;
  finally
    FcsThreadContext.Release;
  end;
end;

procedure TFetchThreadContext.SetIsWorking(const Value: Boolean);
begin
  FcsThreadContext.Acquire;
  try
    FIsWorking:=Value;
  finally
    FcsThreadContext.Release;
  end;
end;

function GetQueueItem(Producer:TcxCustomItemProducer;List:TList;var Index:Integer):PcxRequestItem;
var
  i:Integer;
  tempRI:PcxRequestItem;
begin
  Result:=nil;
  Index:=-1;
  for i:=0 to List.Count-1 do
  begin
    tempRI:=List[i];
    if (tempRI.ItemIndex=Index) and (tempRI.ItemProducer=Producer) then
    begin
      Result:=tempRI;
      Index:=i;
      Break;
    end;
  end;
end;

function PickItemBegin: PcxRequestItem;
var
  tempList:TList;
  i:Integer;
  tempRequestItem:PcxRequestItem;
begin
  Result:=nil;
  tempList:=FetchQueue.LockList;
  try
    i:=0;
    while ((tempList.Count<>0) and (tempList.Count>i)) do
    begin
      tempRequestItem:=tempList[i];
      if not temprequestItem.Locked then
      begin
        Result:=tempRequestItem;
        tempRequestItem.Locked:=True;
        Break;
      end;
      i:=i+1;
    end;
  finally
    FetchQueue.UnlockList;
    ResetEvent(FetchManagerNotifyEvent)
  end;
end;

procedure PickItemEnd(ItemOwner:PFetchThreadContext);
var
  tempList:TList;
begin
  tempList:=FetchQueue.LockList;
  try
    tempList.Remove(itemOwner.Item);
    Dispose(itemOwner.Item);
    itemOwner.Item:=nil;
    ItemOwner.IsWorking:=False;
  finally
    FetchQueue.UnlockList;
  end;
end;

function cxShellFetchThreadFunction(ItemProducer:TcxCustomItemProducer):Integer;stdcall;
var
  threadContext:PFetchThreadContext;
  waitInfo:DWORD;

  function LocateCurrentThreadContext:PFetchThreadContext;
  var
    tempList:TList;
    i:Integer;
    currentThreadID:Integer;
    tempThreadContext:PFetchThreadContext;
  begin
    Result:=nil;
    tempList:=FetchThreads.LockList;
    try
      currentThreadID:=GetCurrentThreadId;
      for i:=0 to tempList.Count-1 do
      begin
        tempThreadContext:=tempList[i];
        if tempThreadContext.ThreadID=currentThreadID then
        begin
          Result:=tempThreadContext;
          Break;
        end;
      end;
    finally
      FetchThreads.UnlockList;
    end;
  end;

  procedure ProcessItem;
  var
    tempItem:PcxShellItemInfo;
  begin
    threadContext.IsWorking:=True;
    try
      with threadContext.Item.ItemProducer do
      begin
         LockRead;
         try
          if (Items.Count=0) or (Items.Count<=threadContext.Item.ItemIndex) then
             Exit;
          tempItem:=Items[threadContext.Item.ItemIndex];
          tempItem.CheckUpdate(ShellFolder,FolderPidl,False);
          CheckForSubItems(tempItem^);
        finally
          UnlockRead;
        end;
        NotifyUpdateItem(threadContext.Item.ItemIndex);
      end;
    finally
      PickItemEnd(threadContext);
      ResetEvent(threadContext.NotifyThreadEvent);
    end;
  end;

begin
  CoInitializeEx(nil,COINIT_APARTMENTTHREADED);
  try
    threadContext:=LocateCurrentThreadContext;
    threadContext.FetchThreadTerminated:=CreateEvent(nil,True,False,nil);
    try
      if threadContext=nil then
         ExitThread(1);
      repeat
        waitInfo:=WaitForMultipleObjects(2,@threadContext.FEvents,False,1);
        case waitInfo of
          0: if threadContext.Item<>nil then
                ProcessItem;
          1: Break;
        end;
      until(WaitForSingleObject(threadContext.StopThreadEvent,0)<>WAIT_TIMEOUT);
    finally
      SetEvent(threadContext.FetchThreadTerminated);
    end;
  finally
    CoUninitialize;
    Result:=0;
    ExitThread(0);
  end;
end;

function TryAddFetchThread:PFetchThreadContext;
var
  tempList:TList;
  tempThreadID:Cardinal;
  tempThreadHandle:THandle;
begin
  Result:=nil;
  tempList:=FetchThreads.LockList;
  try
    if tempList.Count>=MaxFetchThreadsCount then
       Exit;
    tempThreadHandle:=CreateThread(nil,0,@cxShellFetchThreadFunction,nil,
                CREATE_SUSPENDED,tempThreadID);
    New(Result);
    Result^:=TFetchThreadContext.Create(tempThreadID);
    Result.hThread:=tempThreadHandle;
    tempList.Add(Result);
  finally
    FetchThreads.UnlockList;
  end;
  ResumeThread(tempThreadHandle);
end;

function cxShellManagerThreadFunction(ItemProducer:TcxCustomItemProducer):Integer;stdcall;
var
  waitInfo:DWORD;

  procedure ProcessQueue;
  var
    tempList:TList;
    tempRequestItem:PcxRequestItem;
    i:Integer;
    tempThreadContext:PFetchThreadContext;
    specified:Boolean;
  begin
    repeat
      tempRequestItem:=PickItemBegin;
      if tempRequestItem=nil then
         Break;
      specified:=False;
      while not specified do
      begin
        tempList:=FetchThreads.LockList;
        try
          for i:=0 to tempList.Count-1 do
          begin
            tempThreadContext:=tempList[i];
            if tempThreadContext.AskForProcessing(tempRequestItem) then
            begin
              specified:=True;
              tempRequestItem:=nil;
              Break;
            end;
          end;
        finally
          FetchThreads.UnlockList;
        end;
        Sleep(0);
        if WaitForSingleObject(FetchManagerStopEvent,0)<>WAIT_TIMEOUT then
           Break;
      end;
    until(WaitForSingleObject(FetchManagerStopEvent,0)<>WAIT_TIMEOUT);
  end;

  procedure TerminateFetchThreads;
  var
    tempList:TList;
    tempThreadContext:PFetchThreadContext;
    i:Integer;
  begin
    tempList:=FetchThreads.LockList;
    try
      for i:=0 to tempList.Count-1 do
      begin
        tempThreadContext:=tempList[i];
        SetEvent(tempThreadContext.StopThreadEvent);
      end;
    finally
      FetchThreads.UnlockList;
    end;
  end;

begin
  CoInitializeEx(nil,COINIT_APARTMENTTHREADED);
  try
    repeat
      waitInfo:=WaitForMultipleObjects(2,@FetchEvents,False,1);
      case waitInfo of
        0: ProcessQueue;
        1: Break;
      end;
    until(WaitForSingleObject(FetchManagerStopEvent,0)<>WAIT_TIMEOUT);
    TerminateFetchThreads;
  finally
    CoUninitialize;
    Result:=0;
    ExitThread(0);
  end;
end;

procedure InitializeThreadManager;
var
  ThreadID:Cardinal;
begin
  // Creating fetching manager thread
  FetchEvents[0]:=CreateEvent(nil,True,False,nil);
  FetchEvents[1]:=CreateEvent(nil,True,False,nil);
  FetchThreads:=TThreadList.Create;
  FetchQueue:=TThreadList.Create;
  if FetchManagerHandle=0 then
     FetchManagerHandle:=CreateThread(nil,0,@cxShellManagerThreadFunction,nil,0,
        ThreadID);
end;

procedure FinalizeThreadManager;
var
  i:Integer;
  tempList:TList;
  tempThreadContext:PFetchThreadContext;
  allIsTerminated:Boolean;
begin
  SetEvent(FetchManagerStopEvent);
  WaitForSingleObject(FetchManagerHandle,INFINITE);
  CloseHandle(FetchManagerHandle);
  FetchManagerHandle:=0;
  tempList:=FetchThreads.LockList;
  try
    repeat
      allIsTerminated:=True;
      for i:=0 to tempList.Count-1 do
      begin
        Application.ProcessMessages;
        if tempList[i]<>nil then
        begin
          tempThreadContext:=tempList[i];
          if WaitForSingleObject(tempThreadContext.FetchThreadTerminated,1)=WAIT_TIMEOUT then
          begin
            allIsTerminated:=False;
            Continue;
          end;
          CloseHandle(tempThreadContext.hThread);
          tempThreadContext.Free;
          Dispose(tempThreadContext);
          tempList[i]:=nil;
        end;
      end;
    until(allIsTerminated);
    tempList.Clear;
  finally
    FetchThreads.UnlockList;
  end;
  FreeAndNil(FetchThreads);
  FreeAndNil(FetchQueue);
  CloseHandle(FetchManagerNotifyEvent);
  CloseHandle(FetchManagerStopEvent);
end;

initialization
  OleInitialize(nil);
  SHGetMalloc(cxMalloc);
  hShell32:=LoadLibrary('shell32.dll');
  cxSHGetFolderLocation:=GetProcAddress(hShell32,'SHGetFolderLocation');
  SHChangeNotifyRegister:=GetProcAddress(hShell32,PChar(2));
  SHChangeNotifyUnregister:=GetProcAddress(hShell32,PChar(4));
  GetSysFolderFileIcons;
  LockpFolder:=CreateMutex(nil,True,nil);
  InitializeThreadManager;

finalization
  FinalizeThreadManager;
  cxMalloc:=nil;
  if hShell32<>0 then
     FreeLibrary(hShell32);
  CloseHandle(LockpFolder);
  OleUninitialize;

end.
