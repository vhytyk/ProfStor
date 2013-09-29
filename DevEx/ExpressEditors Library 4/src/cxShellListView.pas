
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

unit cxShellListView;

{$I cxExtEdVer.inc}

interface

uses
  Windows, Messages, Classes, Comctrls, Controls, Forms, Menus, ShlObj, StdCtrls,
  cxContainer, cxDataUtils, cxScrollBar, cxShellCommon, cxShellControls;

const
  cxShellObjectInternalAbsoluteVirtualPathPrefix = '::{9C211B58-E6F1-456A-9F22-7B3B418A7BB1}';
  cxShellObjectInternalRelativeVirtualPathPrefix = '::{63BE9ADB-E4B5-4623-96AA-57440B4EF5A8}';
  cxShellObjectInternalVirtualPathPrefixLength = 40;

type
  TcxShellObjectPathType = (sptAbsolutePhysical, sptRelativePhysical, sptUNC, sptVirtual,
    sptInternalAbsoluteVirtual, sptInternalRelativeVirtual, sptIncorrect);

  TcxShellViewOption = (svoShowFiles, svoShowFolders, svoShowHidden);
  TcxShellViewOptions = set of TcxShellViewOption;

  TcxCustomShellListView = class;

  TcxBeforeNavigationEvent = procedure(Sender: TcxCustomShellListView; ANewAbsolutePIDL: PItemIDList) of object;
  TcxCurrentFolderChangedEvent = procedure(Sender: TcxCustomShellListView) of object;

  { TcxInnerShellListView }

  TcxInnerShellListView = class(TcxCustomInnerShellListView, IcxContainerInnerControl)
  private
    FOnChange: TLVChangeEvent;

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
  protected
    FContainer: TcxCustomShellListView;
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
    procedure ChangeHandler(Sender: TObject; AItem: TListItem;
      AChange: TItemChange); virtual;
    procedure MouseEnter(AControl: TControl); dynamic;
    procedure MouseLeave(AControl: TControl); dynamic;
    property Container: TcxCustomShellListView read FContainer;
    property OnChange: TLVChangeEvent read FOnChange write FOnChange;
  public
    constructor Create(AOwner: TComponent); override;
    procedure DragDrop(Source: TObject; X, Y: Integer); override;
    function ExecuteAction(Action: TBasicAction): Boolean; override;
    function UpdateAction(Action: TBasicAction): Boolean; override;
{$IFDEF DELPHI5}
    function CanFocus: Boolean; override;
{$ENDIF}
  public
    property Align;
    property Anchors;
    property BorderStyle;
    property Color;
    property DragDropSettings;
    property HotTrack;
    property IconOptions;
    property Items;
    property ListViewStyle;
    property MultiSelect;
    property Options;
    property Root;
    property Visible;
    property AfterNavigation;
    property BeforeNavigation;
    property OnSelectItem;
    property OnRootChanged;
  end;

  { TcxCustomShellListView }

  TcxCustomShellListView = class(TcxContainer)
  private
    FInnerListView: TcxInnerShellListView;
    FIsExitProcessing: Boolean;
    FScrollBarsCalculating: Boolean;

    FOnBeforeNavigation: TcxBeforeNavigationEvent;
    FOnChange: TLVChangeEvent;
    FOnCurrentFolderChanged: TcxCurrentFolderChangedEvent;
    FOnSelectItem: TLVSelectItemEvent;

    procedure BeforeNavigationHandler(Sender: TcxCustomInnerShellListView;
      APItemIDList: PItemIDList; AFolderPath: WideString);
    procedure ChangeHandler(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure SelectItemHandler(Sender: TObject; Item: TListItem;
      Selected: Boolean);

    function GetAbsolutePath: string;
    function GetAbsolutePIDL: PItemIDList;
    function GetDragDropSettings: TcxDragDropSettings;
    function GetIconOptions: TIconOptions;
    function GetListHotTrack: Boolean;
    function GetMultiSelect: Boolean;
    function GetOptions: TcxShellOptions;
    function GetRoot: TcxShellListRoot;
    function GetViewStyle: TViewStyle;
    procedure SetAbsolutePath(Value: string);
    procedure SetAbsolutePIDL(Value: PItemIDList);
    procedure SetDragDropSettings(Value: TcxDragDropSettings);
    procedure SetIconOptions(Value: TIconOptions);
    procedure SetListHotTrack(Value: Boolean);
    procedure SetMultiSelect(Value: Boolean);
    procedure SetOptions(Value: TcxShellOptions);
    procedure SetRoot(Value: TcxShellListRoot);
    procedure SetViewStyle(Value: TViewStyle);
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
    property DataBinding: TcxCustomDataBinding read FDataBinding;
    property DragDropSettings: TcxDragDropSettings read GetDragDropSettings write SetDragDropSettings;
    property IconOptions: TIconOptions read GetIconOptions write SetIconOptions;
    property ListHotTrack: Boolean read GetListHotTrack write SetListHotTrack default False;
    property MultiSelect: Boolean read GetMultiSelect write SetMultiSelect default False;
    property Options: TcxShellOptions read GetOptions write SetOptions;
    property Root: TcxShellListRoot read GetRoot write SetRoot;
    property ViewStyle: TViewStyle read GetViewStyle write SetViewStyle default vsIcon;
    property OnBeforeNavigation: TcxBeforeNavigationEvent read FOnBeforeNavigation write FOnBeforeNavigation;
    property OnChange: TLVChangeEvent read FOnChange write FOnChange;
    property OnCurrentFolderChanged: TcxCurrentFolderChangedEvent
      read FOnCurrentFolderChanged write FOnCurrentFolderChanged;
    property OnSelectItem: TLVSelectItemEvent read FOnSelectItem write FOnSelectItem;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function ExecuteAction(Action: TBasicAction): Boolean; override;
    function UpdateAction(Action: TBasicAction): Boolean; override;
    procedure BrowseParent;
    function GetItemAbsolutePIDL(AIndex: Integer): PItemIDList;
    procedure ProcessTreeViewNavigate(apidl:PItemIDList);
    procedure SetTreeView(ATreeView:TWinControl);
{$IFDEF VCL}
    procedure SetFocus; override;
{$ENDIF}
    property InnerListView: TcxInnerShellListView read FInnerListView;
    property AbsolutePath: string read GetAbsolutePath write SetAbsolutePath;
    property AbsolutePIDL: PItemIDList read GetAbsolutePIDL write SetAbsolutePIDL;
  end;

  { TcxShellListView }

  TcxShellListView = class(TcxCustomShellListView)
  published
    property Align;
    property Anchors;
    property Constraints;
    property DragDropSettings;
    property Enabled;
    property IconOptions;
    property ListHotTrack;
    property MultiSelect;
    property Options;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property Root;
    property ShowHint;
    property Style;
    property TabOrder;
    property TabStop;
    property ViewStyle;
    property Visible;
    property OnBeforeNavigation;
    property OnChange;
    property OnClick;
    property OnCurrentFolderChanged;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnSelectItem;
    property OnStartDock;
    property OnStartDrag;
{$IFDEF DELPHI5}
    property OnContextPopup;
{$ENDIF}
  end;

  TcxShellSpecialFolderInfoTableItem = record
    Attributes: ULONG;
    PIDL: PItemIDList;
    PIDLDisplayName, PIDLName, PIDLUpperCaseDisplayName: string;
  end;

function CheckAbsolutePIDL(var APIDL: PItemIDList; ARoot: TcxCustomShellRoot;
  ACheckObjectExistence: Boolean; ACheckIsSubPath: Boolean = True): Boolean;
function CheckShellObjectExistence(APIDL: PItemIDList): Boolean;
function CheckShellObjectPath(var APath: string; ACurrentPath: string;
  AIsDisplayText: Boolean): TcxShellObjectPathType;
procedure CheckShellRoot(ARoot: TcxCustomShellRoot);
function CheckViewOptions(AViewOptions: TcxShellViewOptions;
  AShellObjectAttributes: ULONG): Boolean;
function GetDesktopIShellFolder: IShellFolder;
function GetPIDLDisplayName(APIDL: PItemIDList; AShowFullPath: Boolean = False): string;
function GetSizeGripRect(AControl: IcxContainerInnerControl): TRect;
function InternalParseDisplayName(AParentIFolder: IShellFolder;
  ADisplayName: string; AViewOptions: TcxShellViewOptions): PItemIDList;
function IsSubPath(APIDL1, APIDL2: PItemIDList): Boolean;
function PathToAbsolutePIDL(APath: string; ARoot: TcxCustomShellRoot;
  AViewOptions: TcxShellViewOptions; ACheckIsSubPath: Boolean = True): PItemIDList;
function ShellObjectInternalVirtualPathToPIDL(APath: string;
  ARoot: TcxCustomShellRoot; AViewOptions: TcxShellViewOptions): PItemIDList;

const
  cxShellSpecialFolderInfoTableLength = CSIDL_HISTORY - CSIDL_DESKTOP + 1;

var
  cxShellSpecialFolderInfoTable: array[CSIDL_DESKTOP..CSIDL_HISTORY] of TcxShellSpecialFolderInfoTableItem;

implementation

uses
{$IFDEF DELPHI6}
  Variants,
{$ENDIF}
  SysUtils, CommCtrl, ComObj, Graphics, ShellAPI, cxClasses, cxEdit, cxControls;

type
  TcxCustomDataBindingAccess = class(TcxCustomDataBinding);
  TcxContainerAccess = class(TcxContainer);
  TcxCustomShellRootAccess = class(TcxCustomShellRoot);

function CheckAbsolutePIDL(var APIDL: PItemIDList; ARoot: TcxCustomShellRoot;
  ACheckObjectExistence: Boolean; ACheckIsSubPath: Boolean = True): Boolean;
begin
  CheckShellRoot(ARoot);
  if APIDL = nil then
  begin
    Result := True;
    APIDL := ARoot.Pidl;
  end
  else
  begin
    Result := not ACheckIsSubPath or IsSubPath(ARoot.Pidl, APIDL);
    if Result and ACheckObjectExistence then
      Result := CheckShellObjectExistence(APIDL);
  end;
end;

function CheckShellObjectExistence(APIDL: PItemIDList): Boolean;
var
  ASHFileInfo: TSHFileInfo;
begin
  Result := SHGetFileInfo(PChar(APIDL), 0, ASHFileInfo, SizeOf(ASHFileInfo),
    SHGFI_PIDL or SHGFI_SYSICONINDEX or SHGFI_SMALLICON) <> 0;
end;

function CheckShellObjectPath(var APath: string; ACurrentPath: string;
  AIsDisplayText: Boolean): TcxShellObjectPathType;
var
  APathLength: Integer;
  S: string;
begin
  APathLength := Length(APath);
  Result := sptIncorrect;
  if APathLength = 0 then
    Exit;

  if (APathLength > 1) and (APath[APathLength] = '\') and (APath[APathLength - 1] <> ':') then
  begin
    Dec(APathLength);
    SetLength(APath, APathLength);
  end;

  if (APathLength > 2) and (APath[1] = '\') and (APath[2] = '\') then
  begin
    Result := sptUNC;
    Exit;
  end;
  if APathLength >= cxShellObjectInternalVirtualPathPrefixLength then
  begin
    S := AnsiUpperCase(Copy(APath, 1, cxShellObjectInternalVirtualPathPrefixLength));
    if S = cxShellObjectInternalAbsoluteVirtualPathPrefix then
    begin
      Result := sptInternalAbsoluteVirtual;
      Exit;
    end;
    if S = cxShellObjectInternalRelativeVirtualPathPrefix then
    begin
      Result := sptInternalRelativeVirtual;
      Exit;
    end;
    if Copy(S, 1, 3) = '::{' then
    begin
      Result := sptVirtual;
      Exit;
    end;
  end;
  if (Length(APath) >= 3) and (APath[2] = ':') and (APath[3] = '\') and
    (APath[1] in ['A'..'Z', 'a'..'z']) then
  begin
    Result := sptAbsolutePhysical;
    Exit;
  end;
  if (APath[1] = '\') or (Length(APath) >= 2) and (APath[2] = ':') and
    (APath[1] in ['A'..'Z', 'a'..'z']) then
  begin
    if (Length(ACurrentPath) < 3) or (ACurrentPath[2] <> ':') or
        (ACurrentPath[3] <> '\') or not(ACurrentPath[1] in ['A'..'Z', 'a'..'z']) then
      Exit;
    if (APath[1] <> '\') and (UpperCase(APath[1]) <> UpperCase(ACurrentPath[1])) then
      Exit;
    if (APath[1] <> '\') and (APathLength = 2) then
    begin
      if AIsDisplayText then
      begin
        APath := ACurrentPath;
        Result := sptAbsolutePhysical;
        Exit;
      end
      else
        Exit;
    end
    else
      if APath[1] = '\' then
      begin
        if APathLength = 1 then
          APath := Copy(ACurrentPath, 1, 3)
        else
          APath := Copy(ACurrentPath, 1, 2) + APath;
        Result := sptAbsolutePhysical;
        Exit;
      end
      else
        if not AIsDisplayText then
          Exit
        else
        begin
          APath := Copy(APath, 3, APathLength - 2);
          Result := sptRelativePhysical;
          Exit;
        end;
  end;
  Result := sptRelativePhysical;
end;

procedure CheckShellRoot(ARoot: TcxCustomShellRoot);
begin
  if ARoot.ShellFolder = nil then
    TcxCustomShellRootAccess(ARoot).CheckRoot;
end;

function CheckViewOptions(AViewOptions: TcxShellViewOptions;
  AShellObjectAttributes: ULONG): Boolean;
begin
  Result := not((AShellObjectAttributes and SFGAO_GHOSTED <> 0) and
    not(svoShowHidden in AViewOptions));
  Result := Result and not((AShellObjectAttributes and SFGAO_FOLDER = 0) and
    not(svoShowFiles in AViewOptions));
  Result := Result and not((AShellObjectAttributes and SFGAO_FOLDER <> 0) and
    not(svoShowFolders in AViewOptions));
end;

procedure DestroyShellSpecialFolderInfoTable;
var
  ACSIDL: Integer;
begin
  for ACSIDL := CSIDL_DESKTOP to CSIDL_HISTORY do
  begin
    DisposePidl(cxShellSpecialFolderInfoTable[ACSIDL].PIDL);
    cxShellSpecialFolderInfoTable[ACSIDL].PIDL := nil;
  end;
end;

function GetDesktopIShellFolder: IShellFolder;
begin
  OleCheck(SHGetDesktopFolder(Result));
end;

function GetShellEnumObjectsFlags(AViewOptions: TcxShellViewOptions): DWORD;
begin
  Result := 0;
  if svoShowFiles in AViewOptions then
    Result := Result or SHCONTF_NONFOLDERS;
  if svoShowFolders in AViewOptions then
    Result := Result or SHCONTF_FOLDERS;
  if svoShowHidden in AViewOptions then
    Result := Result or SHCONTF_INCLUDEHIDDEN;
end;

function GetPIDLDisplayName(APIDL: PItemIDList; AShowFullPath: Boolean = False): string;
var
  AParentIFolder: IShellFolder;
  AStrRet: TStrRet;
  ATempPIDL: PItemIDList;
  I: Integer;
begin
  if AShowFullPath then
  begin
    Result := GetPidlName(APIDL);
    if Result <> '' then
      Exit;
  end;
  AParentIFolder := GetDesktopIShellFolder;
  for I := 1 to GetPidlItemsCount(APIDL) + Integer(AShowFullPath) - 1 do
  begin
    ATempPIDL := cxMalloc.Alloc(APIDL^.mkid.cb + SizeOf(SHITEMID));
    FillChar(ATempPIDL^, APIDL^.mkid.cb + SizeOf(SHITEMID), 0);
    CopyMemory(ATempPIDL, APIDL, APIDL^.mkid.cb);
    Integer(APIDL) := Integer(APIDL) + APIDL^.mkid.cb;

    if AShowFullPath then
    begin
      AParentIFolder.GetDisplayNameOf(ATempPIDL, SHGDN_INFOLDER, AStrRet);
      if Result <> '' then
        Result := Result + '\';
      Result := Result + GetTextFromStrRet(AStrRet, APIDL);
    end;

    AParentIFolder.BindToObject(ATempPIDL, nil, IID_IShellFolder, Pointer(AParentIFolder));
    DisposePidl(ATempPIDL);
  end;

  if not AShowFullPath then
  begin
    AParentIFolder.GetDisplayNameOf(APIDL, SHGDN_NORMAL, AStrRet);
    Result := GetTextFromStrRet(AStrRet, APIDL);
  end;
end;

function GetSizeGripRect(AControl: IcxContainerInnerControl): TRect;
var
  R: TRect;
begin
  with TcxContainerAccess(AControl.ControlContainer) do
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

function InternalParseDisplayName(AParentIFolder: IShellFolder;
  ADisplayName: string; AViewOptions: TcxShellViewOptions): PItemIDList;
var
  AAttributes, AFetchedItemCount, AParsedCharCount: ULONG;
  AFlags: DWORD;
  AIEnumIDList: IEnumIDList;
  AStrRet: TStrRet;
  ATempPIDL: PItemIDList;
begin
  Result := nil;
  AAttributes := SFGAO_GHOSTED or SFGAO_FOLDER;
  AParentIFolder.ParseDisplayName(0, nil, StringToOleStr(ADisplayName),
    AParsedCharCount, Result, AAttributes);
  if Result <> nil then
  begin
    if not CheckViewOptions(AViewOptions, AAttributes) then
      Result := nil;
    Exit;
  end;

  AFlags := GetShellEnumObjectsFlags(AViewOptions);
  if AParentIFolder.EnumObjects(0, AFlags, AIEnumIDList) = S_OK then
  begin
    ADisplayName := AnsiUpperCase(ADisplayName);
    while AIEnumIDList.Next(1, ATempPIDL, AFetchedItemCount) = NOERROR do
    begin
      FillChar(AStrRet, SizeOf(AStrRet), 0);
      AParentIFolder.GetDisplayNameOf(ATempPIDL, SHGDN_INFOLDER, AStrRet);
      if AnsiUpperCase(GetTextFromStrRet(AStrRet, ATempPIDL)) = ADisplayName then
      begin
        Result := ATempPIDL;
        Break;
      end
      else
        DisposePidl(ATempPIDL);
    end;
  end;
end;

function IsSubPath(APIDL1, APIDL2: PItemIDList): Boolean; // TODO
var
  L1, L2: Integer;
begin
  L1 := GetPidlSize(APIDL1);
  L2 := GetPidlSize(APIDL2);
  Result := (L1 = 0) or (L2 >= L1) and CompareMem(APIDL1, APIDL2, L1);
end;

function PathToAbsolutePIDL(APath: string; ARoot: TcxCustomShellRoot;
  AViewOptions: TcxShellViewOptions; ACheckIsSubPath: Boolean = True): PItemIDList;

  function InternalPathToAbsolutePIDL: PItemIDList;
  var
    ACSIDL: Integer;
    APathType: TcxShellObjectPathType;
    ATempPIDL: PItemIDList;
  begin
    Result := nil;
    APathType := CheckShellObjectPath(APath, AnsiUpperCase(GetPidlName(ARoot.Pidl)), False);
    case APathType of
      sptIncorrect:
        Exit;
      sptAbsolutePhysical, sptUNC, sptVirtual:
        Result := InternalParseDisplayName(GetDesktopIShellFolder, APath, AViewOptions);
      sptInternalAbsoluteVirtual, sptInternalRelativeVirtual:
        Result := ShellObjectInternalVirtualPathToPIDL(APath, ARoot, AViewOptions);
      sptRelativePhysical:
        begin
          ATempPIDL := InternalParseDisplayName(ARoot.ShellFolder, APath, AViewOptions);
          if ATempPIDL <> nil then
          begin
            Result := ConcatenatePidls(ARoot.Pidl, ATempPIDL);
            DisposePidl(ATempPIDL);
            Exit;
          end;

          for ACSIDL := CSIDL_DESKTOP to CSIDL_HISTORY do
            if cxShellSpecialFolderInfoTable[ACSIDL].PIDLUpperCaseDisplayName = APath then
            begin
              if not CheckViewOptions(AViewOptions, cxShellSpecialFolderInfoTable[ACSIDL].Attributes) then
                Continue;
              Result := GetPidlCopy(cxShellSpecialFolderInfoTable[ACSIDL].PIDL);
              Exit;
            end;
        end;
    end;
  end;

begin
  CheckShellRoot(ARoot);

  if APath = '' then
    Result := GetPidlCopy(ARoot.Pidl)
  else
  begin
    APath := AnsiUpperCase(APath);
    Result := InternalPathToAbsolutePIDL;
  end;

  if (Result <> nil) and ACheckIsSubPath and not IsSubPath(ARoot.Pidl, Result) then
  begin
    DisposePidl(Result);
    Result := nil;
  end;
end;

function ShellObjectInternalVirtualPathToPIDL(APath: string;
  ARoot: TcxCustomShellRoot; AViewOptions: TcxShellViewOptions): PItemIDList;
var
  AAttributes: UINT;
  AFetchedItemCount: ULONG;
  AFlags: DWORD;
  AIEnumIDList: IEnumIDList;
  AParentIFolder: IShellFolder;
  AStrRet: TStrRet;
  ATempPIDL, ATempPIDL1, ATempPIDL2: PItemIDList;
  I: Integer;
  S: string;
begin
  Result := nil;

  if Copy(APath, 1, cxShellObjectInternalVirtualPathPrefixLength) = cxShellObjectInternalAbsoluteVirtualPathPrefix then
  begin
    AParentIFolder := GetDesktopIShellFolder;
    ATempPIDL := nil;
  end
  else
  begin
    AParentIFolder := ARoot.ShellFolder;
    ATempPIDL := GetPidlCopy(ARoot.Pidl);
  end;
  APath := Copy(APath, cxShellObjectInternalVirtualPathPrefixLength + 2,
    Length(APath) - cxShellObjectInternalVirtualPathPrefixLength - 1);

  repeat
    I := Pos('\', APath);
    if I = 0 then
    begin
      S := APath;
      APath := '';
    end
    else
    begin
      S := Copy(APath, 1, I - 1);
      APath := Copy(APath, I + 1, Length(APath) - I);
    end;

    AFlags := GetShellEnumObjectsFlags(AViewOptions);
    if AParentIFolder.EnumObjects(0, AFlags,
      AIEnumIDList) <> S_OK then
    begin
      DisposePidl(ATempPIDL);
      Exit;
    end;
    while AIEnumIDList.Next(1, ATempPIDL1, AFetchedItemCount) = NOERROR do
    begin
      FillChar(AStrRet, SizeOf(AStrRet), 0);
      AParentIFolder.GetDisplayNameOf(ATempPIDL1, SHGDN_INFOLDER, AStrRet);
      if AnsiUpperCase(GetTextFromStrRet(AStrRet, ATempPIDL1)) = S then
      begin
        if APath = '' then
        begin
          Result := ConcatenatePidls(ATempPIDL, ATempPIDL1);
          DisposePidl(ATempPIDL);
          DisposePidl(ATempPIDL1);
          Exit;
        end;
        AAttributes := SFGAO_FOLDER;
        AParentIFolder.GetAttributesOf(1, ATempPIDL1, AAttributes);
        if AAttributes and SFGAO_FOLDER = 0 then
        begin
          DisposePidl(ATempPIDL);
          DisposePidl(ATempPIDL1);
          Exit;
        end;
        AParentIFolder.BindToObject(ATempPIDL1, nil, IID_IShellFolder, Pointer(AParentIFolder));
        ATempPIDL2 := ATempPIDL;
        ATempPIDL := ConcatenatePidls(ATempPIDL, ATempPIDL1);
        DisposePidl(ATempPIDL1);
        DisposePidl(ATempPIDL2);
        Break;
      end;
    end;
  until I = 0;
end;

procedure PrepareShellSpecialFolderInfoTable;
var
  ACSIDL: Integer;
  ADesktopIFolder: IShellFolder;
  ATempPIDL: PItemIDList;
begin
  ADesktopIFolder := GetDesktopIShellFolder;
  for ACSIDL := CSIDL_DESKTOP to CSIDL_HISTORY do
    with cxShellSpecialFolderInfoTable[ACSIDL] do
    begin
      SHGetSpecialFolderLocation(0, ACSIDL, PIDL);
      PIDLDisplayName := GetPIDLDisplayName(PIDL);
      PIDLUpperCaseDisplayName := AnsiUpperCase(PIDLDisplayName);
      PIDLName := AnsiUpperCase(GetPidlName(PIDL));

      if PIDL <> nil then
      begin
        Attributes := SFGAO_GHOSTED or SFGAO_FOLDER;
        ATempPIDL := GetLastPidlItem(PIDL);
        if ADesktopIFolder.GetAttributesOf(1, ATempPIDL, Attributes) <> NOERROR then
          raise Exception.Create('');
        Attributes := Attributes and (SFGAO_GHOSTED or SFGAO_FOLDER);
      end;
    end;
end;

{ TcxInnerShellListView }

constructor TcxInnerShellListView.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  BorderStyle := bsNone;
  ControlStyle := ControlStyle + [csDoubleClicks];
  ParentColor := False;
  ParentFont := True;
  inherited OnChange := ChangeHandler;
end;

procedure TcxInnerShellListView.DragDrop(Source: TObject; X, Y: Integer);
begin
  if Container <> nil then
    Container.DragDrop(Source, Left + X, Top + Y);
end;

function TcxInnerShellListView.ExecuteAction(Action: TBasicAction): Boolean;
begin
  Result := inherited ExecuteAction(Action) or
    TcxCustomDataBindingAccess(Container.FDataBinding).ExecuteAction(Action);
end;

function TcxInnerShellListView.UpdateAction(Action: TBasicAction): Boolean;
begin
  Result := inherited UpdateAction(Action) or
    TcxCustomDataBindingAccess(Container.FDataBinding).UpdateAction(Action);
end;

{$IFDEF DELPHI5}
function TcxInnerShellListView.CanFocus: Boolean;
begin
  Result := Container.CanFocusEx;
end;
{$ENDIF}

procedure TcxInnerShellListView.Click;
begin
  inherited Click;
  if Container <> nil then
    Container.Click;
end;

procedure TcxInnerShellListView.DblClick;
begin
  inherited DblClick;
  if Container <> nil then
    Container.DblClick;
end;

function TcxInnerShellListView.DoMouseWheel(Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint): Boolean;
begin
  Result := (Container <> nil) and Container.DoMouseWheel(Shift,
    WheelDelta, MousePos);
  if not Result then
    inherited DoMouseWheel(Shift, WheelDelta, MousePos);
end;

procedure TcxInnerShellListView.DragOver(Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  if Container <> nil then
    Container.DragOver(Source, Left + X, Top + Y, State, Accept);
end;

function TcxInnerShellListView.GetPopupMenu: TPopupMenu;
begin
  if Container = nil then
    Result := inherited GetPopupMenu
  else
    Result := Container.GetPopupMenu;
end;

procedure TcxInnerShellListView.KeyDown(var Key: Word; Shift: TShiftState);
begin
  if Container <> nil then
    Container.KeyDown(Key, Shift);
  if Key <> 0 then
    inherited KeyDown(Key, Shift);
end;

procedure TcxInnerShellListView.KeyPress(var Key: Char);
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

procedure TcxInnerShellListView.KeyUp(var Key: Word; Shift: TShiftState);
begin
  if Key = VK_TAB then
    Key := 0;
  if Container <> nil then
    Container.KeyUp(Key, Shift);
  if Key <> 0 then
    inherited KeyUp(Key, Shift);
end;

procedure TcxInnerShellListView.MouseDown(Button: TMouseButton;
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

procedure TcxInnerShellListView.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseMove(Shift, X, Y);
  if Container <> nil then
    Container.MouseMove(Shift, X + Left, Y + Top);
end;

procedure TcxInnerShellListView.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited MouseUp(Button, Shift, X, Y);
  if Container <> nil then
    Container.MouseUp(Button, Shift, X + Left, Y + Top);
end;

procedure TcxInnerShellListView.CreateWindowHandle(const Params: TCreateParams);
begin
  inherited CreateWindowHandle(Params);
  Container.SetScrollBarsParameters;
end;

procedure TcxInnerShellListView.WndProc(var Message: TMessage);
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
    DSM_NOTIFYUPDATECONTENTS,
    WM_HSCROLL,
    WM_MOUSEWHEEL,
    WM_VSCROLL,
    WM_WINDOWPOSCHANGED,
    CM_WININICHANGE:
      Container.SetScrollBarsParameters;
  end;
end;

procedure TcxInnerShellListView.ChangeHandler(Sender: TObject; AItem: TListItem;
  AChange: TItemChange);
begin
  if AItem <> nil then
    try
      if Assigned(FOnChange) then
        FOnChange(Sender, AItem, AChange);
    finally
      Container.SetScrollBarsParameters;
    end;
end;

procedure TcxInnerShellListView.MouseEnter(AControl: TControl);
begin
end;

procedure TcxInnerShellListView.MouseLeave(AControl: TControl);
begin
  if Container <> nil then
    Container.ShortRefreshContainer(True);
end;

function TcxInnerShellListView.GetControl: TWinControl;
begin
  Result := Self;
end;

function TcxInnerShellListView.GetControlContainer: TcxContainer;
begin
  Result := FContainer;
end;

procedure TcxInnerShellListView.WMGetDlgCode(var Message: TWMGetDlgCode);
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

procedure TcxInnerShellListView.WMKillFocus(var Message: TWMKillFocus);
begin
  inherited;
  if (Container <> nil) and not Container.IsDestroying then
    Container.FocusChanged;
end;

procedure TcxInnerShellListView.WMNCCalcSize(var Message: TWMNCCalcSize);
begin
  inherited;
  if UsecxScrollBars and not Container.FScrollBarsCalculating then
    Container.SetScrollBarsParameters;
end;

procedure TcxInnerShellListView.WMNCPaint(var Message: TMessage);
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

procedure TcxInnerShellListView.WMSetFocus(var Message: TWMSetFocus);
begin
  inherited;
  if (Container <> nil) and not Container.IsDestroying and not(csDestroying in ComponentState)
      and (Message.FocusedWnd <> Container.Handle) then
    Container.FocusChanged;
end;

procedure TcxInnerShellListView.WMWindowPosChanged(var Message: TWMWindowPosChanged);
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

procedure TcxInnerShellListView.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  if Message.lParam = 0 then
    MouseEnter(Self)
  else
    MouseEnter(TControl(Message.lParam));
end;

procedure TcxInnerShellListView.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  if Message.lParam = 0 then
    MouseLeave(Self)
  else
    MouseLeave(TControl(Message.lParam));
end;

procedure TcxInnerShellListView.DSMShellChangeNotify(var Message: TMessage);
begin
  inherited;
  Container.SetScrollBarsParameters;
end;

{ TcxCustomShellListView }

constructor TcxCustomShellListView.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FDataBinding := GetDataBindingClass.Create(Self, Self);
  with TcxCustomDataBindingAccess(FDataBinding) do
  begin
    OnDataChange := Self.DataChange;
    OnDataSetChange := Self.DataSetChange;
    OnUpdateData := Self.UpdateData;
  end;
  FInnerListView := TcxInnerShellListView.Create(Self);
  with FInnerListView do
  begin
    FContainer := Self;
    LookAndFeel.MasterLookAndFeel := Self.Style.LookAndFeel;
    Parent := Self;
    TabStop := False;
    BeforeNavigation := Self.BeforeNavigationHandler;
    OnChange := Self.ChangeHandler;
    OnRootChanged := Self.CurrentFolderChangedHandler;
    OnSelectItem := Self.SelectItemHandler;
  end;
  InnerControl := FInnerListView;
  HScrollBar.SmallChange := 1;
  VScrollBar.SmallChange := 1;
  Width := 250;
  Height := 150;
end;

destructor TcxCustomShellListView.Destroy;
begin
  FreeAndNil(FInnerListView);
  FreeAndNil(FDataBinding);
  inherited Destroy;
end;

function TcxCustomShellListView.ExecuteAction(Action: TBasicAction): Boolean;
begin
  Result := inherited ExecuteAction(Action) or
    TcxCustomDataBindingAccess(FDataBinding).ExecuteAction(Action);
end;

function TcxCustomShellListView.UpdateAction(Action: TBasicAction): Boolean;
begin
  Result := inherited UpdateAction(Action) or
    TcxCustomDataBindingAccess(FDataBinding).UpdateAction(Action);
end;

procedure TcxCustomShellListView.BrowseParent;
begin
  FInnerListView.BrowseParent;
end;

function TcxCustomShellListView.GetItemAbsolutePIDL(AIndex: Integer): PItemIDList;
begin
  CheckShellRoot(Root);
  Result := PcxShellItemInfo(InnerListView.ItemProducer.Items[0])^.pidl;
  Result := ConcatenatePidls(Root.Pidl, Result);
end;

procedure TcxCustomShellListView.ProcessTreeViewNavigate(apidl: PItemIDList);
begin
  FInnerListView.ProcessTreeViewNavigate(apidl);
end;

procedure TcxCustomShellListView.SetTreeView(ATreeView: TWinControl);
begin
  FInnerListView.SetTreeView(ATreeView);
end;

{$IFDEF VCL}
procedure TcxCustomShellListView.SetFocus;
begin
  if not IsDesigning then
    inherited SetFocus;
end;
{$ENDIF}

procedure TcxCustomShellListView.DoExit;
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

procedure TcxCustomShellListView.Loaded;
begin
  inherited Loaded;
  SetScrollBarsParameters;
end;

function TcxCustomShellListView.NeedsScrollBars: Boolean;
begin
  Result := True;
end;

procedure TcxCustomShellListView.Scroll(AScrollBarKind: TScrollBarKind;
  AScrollCode: TScrollCode; var AScrollPos: Integer);

  procedure HorizontalScroll;
  var
    ACurrentScrollPos, I: Integer;
  begin
    with FInnerListView do
      if AScrollCode = scTrack then
        if ViewStyle = vsList then
        begin
          ACurrentScrollPos := GetScrollPos(Handle, SB_HORZ);
          if AScrollPos <> ACurrentScrollPos then
          begin
            if AScrollPos > ACurrentScrollPos then
              for I := ACurrentScrollPos + 1 to AScrollPos do
                CallWindowProc(DefWndProc, Handle, WM_HSCROLL, Word(scLineDown) +
                  Word(I) shl 16, HScrollBar.Handle)
            else
              for I := ACurrentScrollPos - 1 downto AScrollPos do
                CallWindowProc(DefWndProc, Handle, WM_HSCROLL, Word(scLineUp) +
                  Word(I) shl 16, HScrollBar.Handle);
          end
        end
        else
          CallWindowProc(DefWndProc, Handle, LVM_SCROLL, AScrollPos -
            GetScrollPos(Handle, SB_HORZ), 0)
      else
      begin
        CallWindowProc(DefWndProc, Handle, WM_HSCROLL, Word(AScrollCode) +
          Word(AScrollPos) shl 16, HScrollBar.Handle);
        AScrollPos := GetScrollPos(Handle, SB_HORZ);
      end;
  end;

  procedure VerticalScroll;
  begin
    with FInnerListView do
      if AScrollCode = scTrack then
        case ViewStyle of
          vsReport:
            SendMessage(Handle, LVM_SCROLL, 0, (AScrollPos - ListView_GetTopIndex(Handle)) *
              (Self.Canvas.FontHeight(Font) + 1));
          vsIcon, vsSmallIcon:
            CallWindowProc(DefWndProc, Handle, LVM_SCROLL, 0, AScrollPos -
              GetScrollPos(Handle, SB_VERT))
        end
      else
      begin
        CallWindowProc(DefWndProc, Handle, WM_VSCROLL, Word(AScrollCode) +
          Word(AScrollPos) shl 16, VScrollBar.Handle);
        AScrollPos := GetScrollPos(Handle, SB_VERT);
      end;
  end;

begin
  inherited Scroll(AScrollBarKind, AScrollCode, AScrollPos);
  if not Enabled then
    Exit;
  if AScrollBarKind = sbHorizontal then
    HorizontalScroll
  else
    VerticalScroll;
  SetScrollBarsParameters;
end;

procedure TcxCustomShellListView.CurrentFolderChangedHandler(Sender: TObject; Root: TcxCustomShellRoot);
begin
  try
    if Assigned(FOnCurrentFolderChanged) then
      FOnCurrentFolderChanged(Self);
  finally
    SetScrollBarsParameters;
  end;
end;

function TcxCustomShellListView.GetDataBindingClass: TcxCustomDataBindingClass;
begin
  Result := TcxDataBinding;
end;

function TcxCustomShellListView.GetViewOptions(AForNavigation: Boolean = False): TcxShellViewOptions;
begin
  if AForNavigation then
    Result := [svoShowFolders, svoShowHidden]
  else
    with InnerListView do
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

procedure TcxCustomShellListView.SetScrollBarsParameters;
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
      if IsDestroying or (Parent = nil) or not HandleAllocated or not FInnerListView.HandleAllocated then
        Break;
      AScrollBarInfo.cbSize := SizeOf(AScrollBarInfo);
      if not GetScrollBarInfoProc(FInnerListView.Handle, Integer(AScrollBarObjects[AScrollBar.Kind]),
          AScrollBarInfo) then
        Break;
      AScrollBarState := AScrollBarInfo.rgstate[0];
      if AScrollBarState and (STATE_SYSTEM_INVISIBLE or STATE_SYSTEM_OFFSCREEN) <> 0 then
        Break;
      AScrollBarVisible := True;
      AScrollBar.Enabled := (AScrollBar.Parent <> nil) and AScrollBar.Parent.Enabled and (AScrollBarState and STATE_SYSTEM_UNAVAILABLE = 0);
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
    GetScrollInfo(FInnerListView.Handle, ABarFlags[AScrollBar.Kind], AScrollInfo);
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
  if not NeedsScrollBars or IsDestroying or not UsecxScrollBars then
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

procedure TcxCustomShellListView.BeforeNavigationHandler(Sender: TcxCustomInnerShellListView;
  APItemIDList: PItemIDList; AFolderPath: WideString);
begin
  if Assigned(FOnBeforeNavigation) then
    FOnBeforeNavigation(Self, APItemIDList);
end;

procedure TcxCustomShellListView.ChangeHandler(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  if Assigned(FOnChange) then
    FOnChange(Self, Item, Change);
end;

procedure TcxCustomShellListView.SelectItemHandler(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  if Assigned(FOnSelectItem) then
    FOnSelectItem(Self, Item, Selected);
end;

function TcxCustomShellListView.GetAbsolutePath: string;
begin
  if FInnerListView <> nil then
  begin
    CheckShellRoot(Root);
    Result := GetPidlName(FInnerListView.Root.Pidl);
  end
  else
    Result := '';
end;

function TcxCustomShellListView.GetAbsolutePIDL: PItemIDList;
begin
  if FInnerListView <> nil then
  begin
    CheckShellRoot(Root);
    Result := GetPidlCopy(FInnerListView.Root.Pidl);
  end
  else
    Result := nil;
end;

function TcxCustomShellListView.GetDragDropSettings: TcxDragDropSettings;
begin
  Result := TcxDragDropSettings(FInnerListView.DragDropSettings);
end;

function TcxCustomShellListView.GetIconOptions: TIconOptions;
begin
  Result := FInnerListView.IconOptions;
end;

function TcxCustomShellListView.GetListHotTrack: Boolean;
begin
  Result := FInnerListView.HotTrack;
end;

function TcxCustomShellListView.GetMultiSelect: Boolean;
begin
  Result := FInnerListView.MultiSelect;
end;

function TcxCustomShellListView.GetOptions: TcxShellOptions;
begin
  Result := TcxShellOptions(FInnerListView.Options);
end;

function TcxCustomShellListView.GetRoot: TcxShellListRoot;
begin
  Result := TcxShellListRoot(FInnerListView.Root)
end;

function TcxCustomShellListView.GetViewStyle: TViewStyle;
begin
  Result := FInnerListView.ViewStyle;
end;

procedure TcxCustomShellListView.SetAbsolutePath(Value: string);
var
  APIDL: PItemIDList;
begin
  if (FInnerListView <> nil) and FInnerListView.HandleAllocated then
  begin
    APIDL := PathToAbsolutePIDL(Value, Root, GetViewOptions(True), False); // TODO
    if APIDL <> nil then
      try
        FInnerListView.ProcessTreeViewNavigate(APIDL);
        FInnerListView.DoNavigateTreeView;
      finally
        DisposePidl(APIDL);
      end;
  end;
end;

procedure TcxCustomShellListView.SetAbsolutePIDL(Value: PItemIDList);
begin
  if FInnerListView <> nil then
  begin
    if not CheckAbsolutePIDL(Value, Root, True, False) then
      Exit;
    FInnerListView.ProcessTreeViewNavigate(Value);
  end;
end;

procedure TcxCustomShellListView.SetDragDropSettings(Value: TcxDragDropSettings);
begin
  FInnerListView.DragDropSettings := Value;
end;

procedure TcxCustomShellListView.SetIconOptions(Value: TIconOptions);
begin
  FInnerListView.IconOptions := Value;
end;

procedure TcxCustomShellListView.SetListHotTrack(Value: Boolean);
begin
  FInnerListView.HotTrack := Value;
end;

procedure TcxCustomShellListView.SetMultiSelect(Value: Boolean);
begin
  FInnerListView.MultiSelect := Value;
end;

procedure TcxCustomShellListView.SetOptions(Value: TcxShellOptions);
begin
  FInnerListView.Options := Value;
end;

procedure TcxCustomShellListView.SetRoot(Value: TcxShellListRoot);
begin
  FInnerListView.Root := Value;
end;

procedure TcxCustomShellListView.SetViewStyle(Value: TViewStyle);
begin
  FInnerListView.ListViewStyle := TcxListViewStyle(Value);
  SetScrollBarsParameters;
end;

initialization
  PrepareShellSpecialFolderInfoTable;

finalization
  DestroyShellSpecialFolderInfoTable;

end.
