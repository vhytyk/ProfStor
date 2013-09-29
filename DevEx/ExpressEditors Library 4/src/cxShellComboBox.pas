
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

unit cxShellComboBox;

{$I cxExtEdVer.inc}

interface

uses
  Windows, Messages, Classes, ComCtrls, Controls, ImgList, ShlObj, cxClasses,
  cxContainer, cxDataUtils, cxDropDownEdit, cxEdit, cxGraphics, cxTextEdit,
  cxShellListView, cxShellTreeView, cxShellCommon;

type
  TcxShellComboBoxViewOption = (scvoShowFiles, scvoShowHidden);
  TcxShellComboBoxViewOptions = set of TcxShellComboBoxViewOption;

  TcxPopupShellTreeViewOption = (tvoContextMenus, tvoHotTrack, tvoShowButtons,
    tvoShowLines, tvoShowRoot, tvoRightClickSelect);
  TcxPopupShellTreeViewOptions = set of TcxPopupShellTreeViewOption;

  { TcxShellComboBoxViewInfo }

  TcxShellComboBoxViewInfo = class(TcxCustomTextEditViewInfo)
  public
    ShellIconIndex: Integer;
    ShellIconPosition: TPoint;
    procedure Offset(DX, DY: Integer); override;
    procedure Paint(ACanvas: TcxCanvas); override;
  end;

  { TcxShellComboBoxViewData }

  TcxCustomShellComboBoxProperties = class;

  TcxShellComboBoxViewData = class(TcxCustomDropDownEditViewData)
  private
    function GetProperties: TcxCustomShellComboBoxProperties;
  protected
    function InternalGetEditConstantPartSize(ACanvas: TcxCanvas; AIsInplace: Boolean;
      const AEditSizeProperties: TcxEditSizeProperties; var MinContentSize: TSize;
      AViewInfo: TcxCustomEditViewInfo): TSize; override;
  public
    procedure Calculate(ACanvas: TcxCanvas; const ABounds: TRect;
      const P: TPoint; Button: TcxMouseButton; Shift: TShiftState;
      AViewInfo: TcxCustomEditViewInfo; AIsMouseEvent: Boolean); override;
    procedure EditValueToDrawValue(ACanvas: TcxCanvas;
      const AEditValue: TcxEditValue; AViewInfo: TcxCustomEditViewInfo); override;
    function GetClientExtent(AViewInfo: TcxCustomEditViewInfo): TRect; override;
    function GetEditContentSize(ACanvas: TcxCanvas; const AEditValue: TcxEditValue;
      const AEditSizeProperties: TcxEditSizeProperties): TSize; override;
    property Properties: TcxCustomShellComboBoxProperties read GetProperties;
  end;

  { TcxShellComboBoxRoot }

  TcxShellComboBoxRoot = class(TcxCustomShellRoot)
  private
    FOnChange: TNotifyEvent;
  protected
    procedure RootUpdated; override;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;

  { TcxShellComboBoxLookupData }

  TcxCustomShellComboBox = class;

  TcxShellComboBoxLookupData = class(TcxCustomTextEditLookupData)
  private
    function GetEdit: TcxCustomShellComboBox;
  protected
    function GetItem(Index: Integer): TCaption; override;
    function GetItemCount: Integer; override;
    procedure ListChanged; override;
    property Edit: TcxCustomShellComboBox read GetEdit;
  end;

  { TcxCustomShellComboBoxProperties }

  TcxCustomShellComboBoxProperties = class(TcxCustomPopupEditProperties)
  private
    FFastSearch: Boolean;
    FIncrementalSearch: Boolean;
    FRoot: TcxShellComboBoxRoot;
    FShowFullPath: Boolean;
    FStoreRelativePath: Boolean;
    FTreeViewOptions: TcxPopupShellTreeViewOptions;
    FViewOptions: TcxShellComboBoxViewOptions;
    function GetDropDownSizeable: Boolean;
    function GetDropDownWidth: Integer;
    procedure RootChangeHandler(Sender: TObject);
    procedure SetDropDownSizeable(Value: Boolean);
    procedure SetDropDownWidth(Value: Integer);
    procedure SetFastSearch(Value: Boolean);
    procedure SetIncrementalSearch(Value: Boolean);
    procedure SetShowFullPath(Value: Boolean);
    procedure SetStoreRelativePath(Value: Boolean);
    procedure SetTreeViewOptions(Value: TcxPopupShellTreeViewOptions);
    procedure SetViewOptions(Value: TcxShellComboBoxViewOptions);
  protected
    class function GetViewDataClass: TcxCustomEditViewDataClass; override;
    procedure CheckRoot;
    function EditValueToPIDL(const AEditValue: TcxEditValue): PItemIDList; virtual;
    function GetShellViewOptions: TcxShellViewOptions;
    procedure RootChanged; virtual;
    property DropDownSizeable: Boolean read GetDropDownSizeable write SetDropDownSizeable default True;
    property DropDownWidth: Integer read GetDropDownWidth write SetDropDownWidth
      default 0;
    property FastSearch: Boolean read FFastSearch write SetFastSearch default False; 
    property IncrementalSearch: Boolean read FIncrementalSearch
      write SetIncrementalSearch default False;
    property Root: TcxShellComboBoxRoot read FRoot write FRoot;
    property ShowFullPath: Boolean read FShowFullPath write SetShowFullPath default False;
    property StoreRelativePath: Boolean read FStoreRelativePath write SetStoreRelativePath default True;
    property TreeViewOptions: TcxPopupShellTreeViewOptions read FTreeViewOptions
      write SetTreeViewOptions default [tvoContextMenus, tvoHotTrack,
      tvoShowButtons, tvoShowLines, tvoShowRoot];
    property ViewOptions: TcxShellComboBoxViewOptions read FViewOptions
      write SetViewOptions default [];
  public
    constructor Create(AOwner: TPersistent); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    class function GetContainerClass: TcxContainerClass; override;
    function GetDisplayText(const AEditValue: TcxEditValue;
      AFullText: Boolean = False): WideString; override;
    function GetEditValueSource(AEditFocused: Boolean): TcxDataEditValueSource; override;
    class function GetLookupDataClass: TcxInterfacedPersistentClass; override;
    procedure GetShellDisplayValue(const AEditValue: TcxEditValue;
      out AText: string; out AShellSysIconIndex: Integer);
    class function GetViewInfoClass: TcxContainerViewInfoClass; override;
    function IsEditValueValid(var EditValue: TcxEditValue;
      AEditFocused: Boolean): Boolean; override;
  end;

  { TcxShellComboBoxProperties }

  TcxShellComboBoxProperties = class(TcxCustomShellComboBoxProperties)
  published
    property Alignment;
    property AutoSelect;
    property ButtonGlyph;
    property DropDownSizeable;
    property DropDownWidth;
    property FastSearch;
    property HideSelection;
    property IncrementalSearch;
    property PopupAlignment;
    property ReadOnly;
    property Root;
    property ShowFullPath;
    property StoreRelativePath;
    property TreeViewOptions;
    property UseLeftAlignmentOnEditing;
    property ViewOptions;
    property OnChange;
    property OnCloseUp;
    property OnEditValueChanged;
    property OnPopup;
  end;

  { TcxPopupShellTreeView }

  TcxPopupShellTreeView = class(TcxShellTreeView)
  private
    function GetEdit: TcxCustomShellComboBox;
  protected
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure DoSelectNode(AAcceptSelection: Boolean = True); virtual;
    property Edit: TcxCustomShellComboBox read GetEdit;
  end;

  TcxPopupShellTreeViewClass = class of TcxPopupShellTreeView;

  { TcxCustomShellComboBox }

  TcxCustomShellComboBox = class(TcxCustomPopupEdit)
  private
    FAbsolutePIDL: PItemIDList;
    FIsDependentShellControlsNotification, FNotificationFromDependentShellControls: Boolean;
    FIsSelectedNodeChangeEventLocked: Boolean;
    FPopupShellTreeView: TcxPopupShellTreeView;
    FShellListView: TcxCustomShellListView;
    FShellTreeView: TcxCustomShellTreeView;
    function GetAbsolutePIDL: PItemIDList;
    function GetAbsolutePath: string;
    function GetProperties: TcxShellComboBoxProperties;
//    function GetRelativePath: string;
    function GetViewInfo: TcxShellComboBoxViewInfo;
    procedure RootChangeHandler(Sender: TObject);
    procedure SetAbsolutePIDL(Value: PItemIDList);
    procedure SetAbsolutePath(const Value: string);
    procedure SetProperties(Value: TcxShellComboBoxProperties);
    procedure SetRelativePIDL(Value: PItemIDList);
//    procedure SetRelativePath(const Value: string);
    procedure SetShellListView(Value: TcxCustomShellListView);
    procedure SetShellTreeView(Value: TcxCustomShellTreeView);
    procedure DSMDoNavigate(var Message: TMessage); message DSM_DONAVIGATE;
  protected
    function CanDropDown: Boolean; override;
    procedure CloseUp(AAccept: Boolean); override;
    procedure DoInitPopup; override;
    procedure DropDown; override;
    procedure HandleSelectItem(Sender: TObject); override;
    procedure InitializePopupWindow; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure PopupWindowShowed(Sender: TObject); override;
    procedure PropertiesChanged(Sender: TObject); override;
    procedure SynchronizeDisplayValue; override;
    procedure SynchronizeEditValue; override;
    function CheckAbsolutePIDL(var APIDL: PItemIDList;
      ACheckObjectExistence: Boolean): Boolean;
    procedure CheckPopupShellTreeView;
    function FindNodeAmongExpandedNodes(ANodeText: string): TTreeNode;
    function GetPopupShellTreeViewClass: TcxPopupShellTreeViewClass; virtual;
    procedure InternalSetAbsolutePIDL(Value: PItemIDList);
    procedure InternalSynchronizeEditValue(APIDL: PItemIDList;
      const ADisplayText: string = ''); virtual;
    procedure InvalidateShellIconRect;
    procedure SelectedNodeChangeHandler(Sender: TObject; ANode: TTreeNode); virtual;
    procedure SynchronizeDependentShellControls;
    procedure SynchronizePopupShellTreeView;
    function TraverseAllVisibleNodes(var ANodeIndex: Integer;
      ATreeNode: TTreeNode = nil): TTreeNode;
    property PopupShellTreeView: TcxPopupShellTreeView read FPopupShellTreeView;
    property Properties: TcxShellComboBoxProperties read GetProperties write SetProperties;
    property ShellListView: TcxCustomShellListView read FShellListView write SetShellListView;
    property ShellTreeView: TcxCustomShellTreeView read FShellTreeView write SetShellTreeView;
    property ViewInfo: TcxShellComboBoxViewInfo read GetViewInfo;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    class function GetPropertiesClass: TcxCustomEditPropertiesClass; override;
    property AbsolutePIDL: PItemIDList read GetAbsolutePIDL write SetAbsolutePIDL;
    property AbsolutePath: string read GetAbsolutePath write SetAbsolutePath;
    property RelativePIDL: PItemIDList write SetRelativePIDL; // TODO
//    property RelativePath: string read GetRelativePath write SetRelativePath;
  end;

  { TcxShellComboBox }

  TcxShellComboBox = class(TcxCustomShellComboBox)
  published
    property Align;
    property Anchors;
    property AutoSize;
    property BeepOnEnter;
    property Constraints;
    property DragMode;
    property Enabled;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property Properties;
    property ShellListView;
    property ShellTreeView;
    property ShowHint;
    property Style;
    property TabOrder;
    property TabStop;
    property Text;
    property Visible;
    property DragCursor;
    property DragKind;
    property ImeMode;
    property ImeName;
    property OnClick;
{$IFDEF DELPHI5}
    property OnContextPopup;
{$ENDIF}
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
    property OnEndDock;
    property OnStartDock;
  end;

var
  cxShellComboBoxImageList: TCustomImageList;

implementation

uses
{$IFDEF DELPHI6}
  Variants,
{$ENDIF}
  ActiveX, CommCtrl, Graphics, ShellAPI, SysUtils, cxDBEdit, cxEditUtils,
  cxExtEditConsts, cxFilterControlUtils, cxShellControls, cxVariants;

type
  TcxDBTextEditDataBindingAccess = class(TcxDBTextEditDataBinding);
  TcxCustomEditAccess = class(TcxCustomEdit);
  TcxInnerShellListViewAccess = class(TcxInnerShellListView);
  TcxInnerShellTreeViewAccess = class(TcxInnerShellTreeView);
  TcxPopupEditPopupWindowAccess = class(TcxPopupEditPopupWindow);
  TcxShellTreeItemProducerAccess = class(TcxShellTreeItemProducer);

const
  ShellRootIDL: Word = 0;

type
  { TcxFilterShellComboBoxHelper }

  TcxFilterShellComboBoxHelper = class(TcxFilterMaskEditHelper)
  public
    class function GetFilterEditClass: TcxCustomEditClass; override;
    class procedure InitializeProperties(AProperties,
      AEditProperties: TcxCustomEditProperties; AHasButtons: Boolean); override;
  end;

class function TcxFilterShellComboBoxHelper.GetFilterEditClass: TcxCustomEditClass;
begin
  Result := TcxShellComboBox;
end;

class procedure TcxFilterShellComboBoxHelper.InitializeProperties(AProperties,
  AEditProperties: TcxCustomEditProperties; AHasButtons: Boolean);
begin
  inherited InitializeProperties(AProperties, AEditProperties, AHasButtons);
end;

function EqualPIDLs(APIDL1, APIDL2: PItemIDList): Boolean;
var
  L1, L2: Integer;
begin
  Result := APIDL1 = APIDL2;
  if not Result then
    if (APIDL1 = nil) or (APIDL2 = nil) then
      Exit
    else
    begin
      L1 := GetPidlSize(APIDL1);
      L2 := GetPidlSize(APIDL2);
      Result := (L1 = L2) and CompareMem(APIDL1, APIDL2, L1);
    end;
end;

procedure FreeAndNilPIDL(var APIDL: PItemIDList);
begin
  if APIDL <> nil then
  begin
    cxMalloc.Free(APIDL);
    APIDL := nil;
  end;
end;

function GetShellIconIndex(APIDL: PItemIDList): Integer;
var
  AFlags: Integer;
  ASHFileInfo: TSHFileInfo;
begin
  AFlags := SHGFI_PIDL or SHGFI_SYSICONINDEX or SHGFI_SMALLICON;
  SHGetFileInfo(Pointer(APIDL), 0, ASHFileInfo, SizeOf(ASHFileInfo), AFlags);
  Result := ASHFileInfo.iIcon;
end;

procedure PrepareShellComboBoxImageList;
var
  ASHFileInfo : TSHFileInfo;
begin
  cxShellComboBoxImageList := TCustomImageList.Create(nil);
  with cxShellComboBoxImageList do
  begin
    ShareImages := True;
    Handle := SHGetFileInfo(@ShellRootIDL, 0, ASHFileInfo, SizeOf(ASHFileInfo),
      SHGFI_PIDL or SHGFI_SYSICONINDEX or SHGFI_SMALLICON);
  end;
end;

{ TcxShellComboBoxViewInfo }

procedure TcxShellComboBoxViewInfo.Offset(DX, DY: Integer);
begin
  inherited Offset(DX, DY);
  Inc(ShellIconPosition.X, DX);
  Inc(ShellIconPosition.Y, DY);
end;

procedure TcxShellComboBoxViewInfo.Paint(ACanvas: TcxCanvas);
var
  R: TRect;
begin
  if ShellIconIndex <> -1 then
    if Transparent then
      with ShellIconPosition do
        ImageList_Draw(cxShellComboBoxImageList.Handle, ShellIconIndex,
          ACanvas.Handle, X, Y, ILD_TRANSPARENT)
    else
    begin
      R.TopLeft := ShellIconPosition;
      R.Right := R.Left + cxShellComboBoxImageList.Width;
      R.Bottom := R.Top + cxShellComboBoxImageList.Height;
      DrawGlyph(ACanvas, cxShellComboBoxImageList, ShellIconIndex, R,
        BackgroundColor, Enabled);
      ACanvas.ExcludeClipRect(R);
    end;
  inherited Paint(ACanvas);
end;

{ TcxShellComboBoxViewData }

procedure TcxShellComboBoxViewData.Calculate(ACanvas: TcxCanvas;
  const ABounds: TRect; const P: TPoint; Button: TcxMouseButton;
  Shift: TShiftState; AViewInfo: TcxCustomEditViewInfo;
  AIsMouseEvent: Boolean);
begin
  inherited Calculate(ACanvas, ABounds, P, Button, Shift, AViewInfo, AIsMouseEvent);
  with TcxShellComboBoxViewInfo(AViewInfo) do
  begin
    ShellIconPosition.X :=  BorderRect.Left + 1;
    ShellIconPosition.Y := BorderRect.Top + (BorderRect.Bottom - BorderRect.Top -
      cxShellComboBoxImageList.Height) div 2
  end;
end;

procedure TcxShellComboBoxViewData.EditValueToDrawValue(ACanvas: TcxCanvas;
  const AEditValue: TcxEditValue; AViewInfo: TcxCustomEditViewInfo);
begin
  with TcxShellComboBoxViewInfo(AViewInfo) do
    Properties.GetShellDisplayValue(AEditValue, string(Text), ShellIconIndex);
  PrepareSelection(AViewInfo);
end;

function TcxShellComboBoxViewData.GetClientExtent(AViewInfo: TcxCustomEditViewInfo): TRect;
begin
  Result := inherited GetClientExtent(AViewInfo);
  if not(Properties.FastSearch and (Edit = nil)) then
    Inc(Result.Left, cxShellComboBoxImageList.Width + 4);
end;

function TcxShellComboBoxViewData.GetEditContentSize(ACanvas: TcxCanvas;
  const AEditValue: TcxEditValue; const AEditSizeProperties: TcxEditSizeProperties): TSize;
var
  AIconIndex: Integer;
  S: string;
begin
  Properties.GetShellDisplayValue(AEditValue, S, AIconIndex);
  Result := GetTextEditContentSize(ACanvas, Self, S,
    GetDrawTextFlags, @AEditSizeProperties);
end;

function TcxShellComboBoxViewData.InternalGetEditConstantPartSize(ACanvas: TcxCanvas;
  AIsInplace: Boolean; const AEditSizeProperties: TcxEditSizeProperties;
  var MinContentSize: TSize; AViewInfo: TcxCustomEditViewInfo): TSize;
begin
  Result := inherited InternalGetEditConstantPartSize(ACanvas, AIsInplace,
    AEditSizeProperties, MinContentSize, AViewInfo);
  if IsInplace or (Edit <> nil) and TcxCustomEditAccess(Edit).AutoSize then
  begin
    if MinContentSize.cy < cxShellComboBoxImageList.Height then
      MinContentSize.cy := cxShellComboBoxImageList.Height;
  end;
end;

function TcxShellComboBoxViewData.GetProperties: TcxCustomShellComboBoxProperties;
begin
  Result := TcxCustomShellComboBoxProperties(FProperties);
end;

{ TcxShellComboBoxRoot }

procedure TcxShellComboBoxRoot.RootUpdated;
begin
  TcxCustomShellComboBoxProperties(Owner).RootChangeHandler(Self);
  if Assigned(FOnChange) then
    FOnChange(Self);
end;

{ TcxShellComboBoxLookupData }

function TcxShellComboBoxLookupData.GetItem(Index: Integer): TCaption;
var
  ATreeViewItemCount: Integer;
begin
  Result := Edit.TraverseAllVisibleNodes(Index).Text;
  Exit;

  with Edit.FPopupShellTreeView.InnerTreeView do
  begin
    ATreeViewItemCount := Items.Count;
    if Index >= ATreeViewItemCount then
      Result := cxShellSpecialFolderInfoTable[Index - ATreeViewItemCount].PIDLDisplayName
    else
      Result := Items[Index].Text;
  end;
end;

function TcxShellComboBoxLookupData.GetItemCount: Integer;
begin
  if Edit.Properties.IncrementalSearch then
  begin
    Result := -1;
    Edit.TraverseAllVisibleNodes(Result);
  end
  else
    Result := 0;
end;

procedure TcxShellComboBoxLookupData.ListChanged;
begin
end;

function TcxShellComboBoxLookupData.GetEdit: TcxCustomShellComboBox;
begin
  Result := TcxCustomShellComboBox(GetOwner);
end;

{ TcxCustomShellComboBoxProperties }

constructor TcxCustomShellComboBoxProperties.Create(AOwner: TPersistent);
begin
  inherited Create(AOwner);
  FRoot := TcxShellComboBoxRoot.Create(Self, 0);
  DropDownSizeable := True;
  ImmediateDropDown := False;
  PopupAutoSize := False;
  TreeViewOptions := [tvoContextMenus, tvoHotTrack, tvoShowButtons,
    tvoShowLines, tvoShowRoot];
  ValidateOnEnter := True;

  FStoreRelativePath := True;
end;

destructor TcxCustomShellComboBoxProperties.Destroy;
begin
  FreeAndNil(FRoot);
  inherited Destroy;
end;

procedure TcxCustomShellComboBoxProperties.Assign(Source: TPersistent);
begin
  if Source is TcxCustomShellComboBoxProperties then
  begin
    BeginUpdate;
    try
      inherited Assign(Source);
      with Source as TcxCustomShellComboBoxProperties do
      begin
        Self.FastSearch := FastSearch;
        Self.IncrementalSearch := IncrementalSearch;
        Self.Root.Assign(Root);
        Self.ShowFullPath := ShowFullPath;
        Self.StoreRelativePath := StoreRelativePath;
        Self.TreeViewOptions := TreeViewOptions;
        Self.ViewOptions := ViewOptions;
      end;
    finally
      EndUpdate;
    end
  end
  else
    inherited Assign(Source);
end;

class function TcxCustomShellComboBoxProperties.GetContainerClass: TcxContainerClass;
begin
  Result := TcxShellComboBox;
end;

function TcxCustomShellComboBoxProperties.GetDisplayText(const AEditValue: TcxEditValue;
  AFullText: Boolean = False): WideString;
var
  AShellSysIconIndex: Integer;
  AText: string;
begin
  GetShellDisplayValue(AEditValue, AText, AShellSysIconIndex);
  Result := AText;
end;

function TcxCustomShellComboBoxProperties.GetEditValueSource(AEditFocused: Boolean): TcxDataEditValueSource;
begin
  Result := evsValue;
end;

class function TcxCustomShellComboBoxProperties.GetLookupDataClass: TcxInterfacedPersistentClass;
begin
  Result := TcxShellComboBoxLookupData;
end;

procedure TcxCustomShellComboBoxProperties.GetShellDisplayValue(const AEditValue: TcxEditValue;
  out AText: string; out AShellSysIconIndex: Integer);
var
  APath: string;

  procedure GetShellObjectName;
  var
    APathLength: Integer;
    I: Integer;
  begin
    APathLength := Length(APath);
    for I := APathLength downto 1 do
      if APath[I] = '\' then
      begin
        APath := Copy(APath, I + 1, APathLength - I);
        Break;
      end;
  end;

var
  AAttributes, AParsedCharCount: ULONG;
  APIDL: PItemIDList;
begin
  if FastSearch then
  begin
    AShellSysIconIndex := -1;
    if VarIsNull(AEditValue) or VarIsEmpty(AEditValue) then
      AText := ''
    else
    begin
      APath := VarToStr(AEditValue);
      CheckRoot;
      if APath = '' then
        AText := GetPIDLDisplayName(Root.Pidl)
      else
        case CheckShellObjectPath(APath, GetPidlName(Root.Pidl), False) of
          sptVirtual:
            begin
              AAttributes := SFGAO_GHOSTED or SFGAO_FOLDER;
              GetDesktopIShellFolder.ParseDisplayName(0, nil, StringToOleStr(APath),
                AParsedCharCount, APIDL, AAttributes);
              if (APIDL <> nil) and not CheckViewOptions(GetShellViewOptions, AAttributes) then
                  APIDL := nil;
              if APIDL = nil then
                AText := APath
              else
              begin
                AText := GetPIDLDisplayName(APIDL);
                DisposePidl(APIDL);
              end;
            end;
          else
            begin
              GetShellObjectName;
              AText := APath;
            end;
        end;
    end;
    Exit;
  end;


  if VarIsNull(AEditValue) or VarIsEmpty(AEditValue) then
    APIDL := nil
  else
    APIDL := EditValueToPIDL(AEditValue);
  if APIDL = nil then
  begin
    AText := VarToStr(AEditValue);
    AShellSysIconIndex := -1;
  end
  else
  begin
    AText := GetPIDLDisplayName(APIDL, ShowFullPath);
    AShellSysIconIndex := GetShellIconIndex(APIDL);
    DisposePidl(APIDL);
  end;
  DisplayValueToDisplayText(AText, TCaption(AText));
end;

class function TcxCustomShellComboBoxProperties.GetViewInfoClass: TcxContainerViewInfoClass;
begin
  Result := TcxShellComboBoxViewInfo;
end;

function TcxCustomShellComboBoxProperties.IsEditValueValid(var EditValue: TcxEditValue;
  AEditFocused: Boolean): Boolean;
begin
  Result := True;
end;

class function TcxCustomShellComboBoxProperties.GetViewDataClass: TcxCustomEditViewDataClass;
begin
  Result := TcxShellComboBoxViewData;
end;

procedure TcxCustomShellComboBoxProperties.CheckRoot;
begin
  if Root.ShellFolder = nil then
  begin
    BeginUpdate;
    try
      Root.CheckRoot;
    finally
      EndUpdate(False);
    end;
  end;
end;

function TcxCustomShellComboBoxProperties.EditValueToPIDL(const AEditValue: TcxEditValue): PItemIDList;
begin
  CheckRoot;
  if VarIsNull(AEditValue) or VarIsEmpty(AEditValue) then
    Result := nil
  else
    Result := PathToAbsolutePIDL(VarToStr(AEditValue), Root, GetShellViewOptions);
end;

function TcxCustomShellComboBoxProperties.GetShellViewOptions: TcxShellViewOptions;
begin
  Result := [svoShowFolders];
  if scvoShowFiles in FViewOptions then
    Include(Result, svoShowFiles);
  if scvoShowHidden in FViewOptions then
    Include(Result, svoShowHidden);
end;

procedure TcxCustomShellComboBoxProperties.RootChanged;
begin
  Changed;
end;

function TcxCustomShellComboBoxProperties.GetDropDownSizeable: Boolean;
begin
  Result := PopupSizeable;
end;

function TcxCustomShellComboBoxProperties.GetDropDownWidth: Integer;
begin
  Result := PopupWidth;
end;

procedure TcxCustomShellComboBoxProperties.RootChangeHandler(Sender: TObject);
begin
  RootChanged;
end;

procedure TcxCustomShellComboBoxProperties.SetDropDownSizeable(Value: Boolean);
begin
  PopupSizeable := Value;
end;

procedure TcxCustomShellComboBoxProperties.SetDropDownWidth(Value: Integer);
begin
  PopupWidth := Value;
end;

procedure TcxCustomShellComboBoxProperties.SetFastSearch(Value: Boolean);
begin
  if Value <> FFastSearch then
  begin
    FFastSearch := Value;
    Changed;
  end;
end;

procedure TcxCustomShellComboBoxProperties.SetIncrementalSearch(Value: Boolean);
begin
  if Value <> FIncrementalSearch then
  begin
    FIncrementalSearch := Value;
    Changed;
  end;
end;

procedure TcxCustomShellComboBoxProperties.SetShowFullPath(Value: Boolean);
begin
  if Value <> FShowFullPath then
  begin
    FShowFullPath := Value;
    Changed;
  end;
end;

procedure TcxCustomShellComboBoxProperties.SetStoreRelativePath(Value: Boolean);
begin
  if Value <> FStoreRelativePath then
  begin
    FStoreRelativePath := Value;
    Changed;
  end;
end;

procedure TcxCustomShellComboBoxProperties.SetTreeViewOptions(Value: TcxPopupShellTreeViewOptions);
begin
  if Value <> FTreeViewOptions then
  begin
    FTreeViewOptions := Value;
    Changed;
  end;
end;

procedure TcxCustomShellComboBoxProperties.SetViewOptions(Value: TcxShellComboBoxViewOptions);
begin
  if Value <> FViewOptions then
  begin
    FViewOptions := Value;
    Changed;
  end;
end;

{ TcxPopupShellTreeView }

procedure TcxPopupShellTreeView.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited KeyDown(Key, Shift);
  if (Key = VK_ESCAPE) or (Key = VK_F4) and not(ssAlt in Shift) or ((Key = VK_UP) or (Key = VK_DOWN)) and (ssAlt in Shift) then
  begin
    DoSelectNode(False);
//    Edit.SelStart := Length(Edit.Text);
    Key := 0;
  end
  else
    if (Key = VK_RETURN) and (Shift = []) and (InnerTreeView.Selected <> nil) then
      DoSelectNode;
end;

procedure TcxPopupShellTreeView.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  AHitTests : THitTests;
begin
  inherited MouseUp(Button, Shift, X, Y);
  AHitTests := InnerTreeView.GetHitTestInfoAt(X, Y);
  if ((Button = mbLeft) and not RightClickSelect) or ((Button = mbRight) and RightClickSelect) then
    if ([htOnIcon, htOnItem, htOnLabel] * AHitTests <> []) and (AHitTests <> [htOnIcon, htOnItem]) then
      DoSelectNode;
end;

procedure TcxPopupShellTreeView.DoSelectNode(AAcceptSelection: Boolean = True);
begin
  Edit.CloseUp(AAcceptSelection);
end;

function TcxPopupShellTreeView.GetEdit: TcxCustomShellComboBox;
begin
  Result := TcxCustomShellComboBox(TcxPopupEditPopupWindowAccess(Parent).Edit);
end;

{ TcxCustomShellComboBox }

constructor TcxCustomShellComboBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Properties.Root.OnChange := RootChangeHandler;
  if IsDesigning then
    Exit;

  FPopupShellTreeView := GetPopupShellTreeViewClass.Create(PopupWindow);
  Properties.PopupControl := FPopupShellTreeView;
  with FPopupShellTreeView do
  begin
    Options.ShowNonFolders := False;
    Style.BorderStyle := cbsNone;
    Style.HotTrack := False;
    Style.TransparentBorder := False;
    TreeHotTrack := True;
    InnerTreeView.ShowInfoTips := False;
    Parent := PopupWindow;
    OnChange := Self.SelectedNodeChangeHandler;
  end;
end;

destructor TcxCustomShellComboBox.Destroy;
begin
  if FAbsolutePIDL <> nil then
  begin
    DisposePidl(FAbsolutePIDL);
    FAbsolutePIDL := nil;
  end;

  if FShellListView <> nil then
    with FShellListView do
      if (InnerListView <> nil) and not(csDestroying in InnerListView.ComponentState) then
        TcxInnerShellListViewAccess(InnerListView).ComboBoxControl := Self;

  if FShellTreeView <> nil then
    with FShellTreeView do
      if (InnerTreeView <> nil) and not(csDestroying in InnerTreeView.ComponentState) then
        TcxInnerShellTreeViewAccess(InnerTreeView).ComboBoxControl := Self;

  inherited Destroy;
end;

class function TcxCustomShellComboBox.GetPropertiesClass: TcxCustomEditPropertiesClass;
begin
  Result := TcxShellComboBoxProperties;
end;

function TcxCustomShellComboBox.CanDropDown: Boolean;
begin
  Result := True;
end;

procedure TcxCustomShellComboBox.CloseUp(AAccept: Boolean);
begin
  if not HasPopupWindow then
    Exit;
  if AAccept then
  begin
    ValidateEdit(True);
    SelectAll;
  end;
  PopupWindow.CloseUp(False);
end;

procedure TcxCustomShellComboBox.DoInitPopup;
begin
  Properties.PopupControl := FPopupShellTreeView;
  inherited DoInitPopup;
end;

procedure TcxCustomShellComboBox.DropDown;
begin
  FIsSelectedNodeChangeEventLocked := True;
  inherited DropDown;
end;

procedure TcxCustomShellComboBox.HandleSelectItem(Sender: TObject);
var
  ANodeIndex: Integer;
  APIDL: PItemIDList;
begin
  ANodeIndex := ILookupData.CurrentKey;
  APIDL := FPopupShellTreeView.GetNodeAbsolutePIDL(TraverseAllVisibleNodes(ANodeIndex));
  InternalSynchronizeEditValue(APIDL, '');
  DisposePidl(APIDL);
  SelectAll;
end;

procedure TcxCustomShellComboBox.InitializePopupWindow;
begin
  inherited InitializePopupWindow;
  TcxPopupEditPopupWindowAccess(PopupWindow).SysPanelStyle := Properties.PopupSizeable;
end;

procedure TcxCustomShellComboBox.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);

  if Operation = opRemove then
    if AComponent = ShellListView then
      ShellListView := nil
    else
      if AComponent = ShellTreeView then
        ShellTreeView := nil;
end;

procedure TcxCustomShellComboBox.PopupWindowShowed(Sender: TObject);
var
  ARootNode: TTreeNode;
begin
  try
    inherited PopupWindowShowed(Sender);
    SynchronizePopupShellTreeView;
    ARootNode := FPopupShellTreeView.InnerTreeView.Items.GetFirstNode;
    if (ARootNode <> nil) and not ARootNode.Expanded then
      ARootNode.Expanded := True;
  finally
    FIsSelectedNodeChangeEventLocked := False;
  end;
end;

procedure TcxCustomShellComboBox.PropertiesChanged(Sender: TObject);
begin
  inherited PropertiesChanged(Sender);
  Properties.PopupControl := FPopupShellTreeView;
  if FPopupShellTreeView <> nil then
    with FPopupShellTreeView do
    begin
      Options.ShowNonFolders := scvoShowFiles in Properties.ViewOptions;
      Options.ShowHidden := scvoShowHidden in Properties.ViewOptions;
      Options.ContextMenus := tvoContextMenus in Properties.TreeViewOptions;
      RightClickSelect := tvoRightClickSelect in Properties.TreeViewOptions;
      ShowButtons := tvoShowButtons in Properties.TreeViewOptions;
      ShowLines := tvoShowLines in Properties.TreeViewOptions;
      ShowRoot := tvoShowRoot in Properties.TreeViewOptions;
      TreeHotTrack := tvoHotTrack in Properties.TreeViewOptions
    end;
end;

procedure TcxCustomShellComboBox.SynchronizeDisplayValue;
var
  APIDL: PItemIDList;
  S: String;
begin
  if DataBinding is TcxDBTextEditDataBinding then // TODO Remove cxDBEdit, IsDataSourceLive
    with TcxDBTextEditDataBindingAccess(DataBinding) do
      if not IsDBConnectionLive then
      begin
        ViewInfo.ShellIconIndex := -1;
        Exit;
      end;

  if VarIsNull(FEditValue) or VarIsEmpty(FEditValue) then
  begin
    Properties.CheckRoot;
    APIDL := GetPidlCopy(Properties.Root.Pidl);
  end
  else
    APIDL := Properties.EditValueToPIDL(FEditValue);

  InternalSetAbsolutePIDL(APIDL);

  if APIDL = nil then
  begin
    S := VarToStr(FEditValue);
    ViewInfo.ShellIconIndex := -1;
  end
  else
  begin
    S := GetPIDLDisplayName(APIDL, Properties.ShowFullPath and not IsFocused);
    ViewInfo.ShellIconIndex := GetShellIconIndex(APIDL);
    DisposePidl(APIDL);
  end;

  DataBinding.DisplayValue := S;
//  SelStart := Length(S);
  InvalidateShellIconRect;
end;

procedure TcxCustomShellComboBox.SynchronizeEditValue;
var
  APIDL: PItemIDList;

  procedure InternalEditValueToPIDL;
  var
    ACSIDL: Integer;
    ANode: TTreeNode;
    AParentIFolder: IShellFolder;
    AParentFolderPIDL: PItemIDList;
    APath: string;
    APathType: TcxShellObjectPathType;
    AShellViewOptions: TcxShellViewOptions;
    ATempPIDL: PItemIDList;
  begin
    APath := AnsiUpperCase(DisplayValue);
    Properties.CheckRoot;

    if APath = '' then
    begin
      APIDL := Properties.Root.Pidl;
      Exit;
    end;

    if IsDesigning or (FPopupShellTreeView.InnerTreeView.Selected = nil) then
      ATempPIDL := GetPidlCopy(Properties.Root.Pidl)
    else
      with FPopupShellTreeView do
        ATempPIDL := GetNodeAbsolutePIDL(InnerTreeView.Selected);
    APathType := CheckShellObjectPath(APath,
      AnsiUpperCase(GetPidlName(ATempPIDL)), True);
    DisposePidl(ATempPIDL);

    APIDL := nil;
    AShellViewOptions := Properties.GetShellViewOptions;
    repeat
      case APathType of
        sptAbsolutePhysical, sptUNC, sptVirtual:
          APIDL := InternalParseDisplayName(GetDesktopIShellFolder, APath,
            AShellViewOptions);
        sptInternalAbsoluteVirtual, sptInternalRelativeVirtual:
          APIDL := ShellObjectInternalVirtualPathToPIDL(APath, Properties.Root,
            AShellViewOptions);
        sptRelativePhysical:
          begin
            if IsDesigning or (FPopupShellTreeView.InnerTreeView.Selected = nil) then
            begin
              AParentFolderPIDL := GetPidlCopy(Properties.Root.Pidl);
              AParentIFolder := Properties.Root.ShellFolder;
            end
            else
            begin
              with FPopupShellTreeView do
                AParentFolderPIDL := GetNodeAbsolutePIDL(InnerTreeView.Selected);
              GetDesktopIShellFolder.BindToObject(AParentFolderPIDL, nil,
                IID_IShellFolder, Pointer(AParentIFolder));
            end;
            if AParentIFolder <> nil then
            begin
              APIDL := InternalParseDisplayName(AParentIFolder, APath,
                AShellViewOptions);
              if APIDL <> nil then
              begin
                ATempPIDL := APIDL;
                APIDL := ConcatenatePidls(AParentFolderPIDL, APIDL);
                DisposePidl(ATempPIDL);
              end;
              DisposePidl(AParentFolderPIDL);
              if APIDL <> nil then
                Break;
            end;

            if not IsDesigning then
            begin
              ANode := FindNodeAmongExpandedNodes(APath);
              if ANode <> nil then
              begin
                APIDL := FPopupShellTreeView.GetNodeAbsolutePIDL(ANode);
                Break;
              end;
            end;

            for ACSIDL := CSIDL_DESKTOP to CSIDL_HISTORY do
              if cxShellSpecialFolderInfoTable[ACSIDL].PIDLUpperCaseDisplayName = APath then
              begin
                if not CheckViewOptions(AShellViewOptions, cxShellSpecialFolderInfoTable[ACSIDL].Attributes) then
                  Continue;
                APIDL := GetPidlCopy(cxShellSpecialFolderInfoTable[ACSIDL].PIDL);
                Break;
              end;
          end;
      end;
    until True;

    if (APIDL <> nil) and not IsSubPath(Properties.Root.Pidl, APIDL) then
    begin
      DisposePidl(APIDL);
      APIDL := nil;
    end;
  end;

begin
  if DataBinding is TcxDBTextEditDataBinding then // TODO Remove cxDBEdit, IsDataSourceLive
    with TcxDBTextEditDataBindingAccess(DataBinding) do
      if not IsDBConnectionLive then
      begin
        ViewInfo.ShellIconIndex := -1;
        Exit;
      end;
  InternalEditValueToPIDL;
  InternalSynchronizeEditValue(APIDL, DisplayValue);
  DisposePidl(APIDL);
end;

function TcxCustomShellComboBox.CheckAbsolutePIDL(var APIDL: PItemIDList;
  ACheckObjectExistence: Boolean): Boolean;
begin
  Properties.CheckRoot;
  if APIDL = nil then
  begin
    Result := True;
    APIDL := Properties.Root.Pidl;
  end
  else
  begin
    Result := IsSubPath(Properties.Root.Pidl, APIDL);
    if Result and ACheckObjectExistence then
      Result := CheckShellObjectExistence(APIDL);
  end;
end;

procedure TcxCustomShellComboBox.CheckPopupShellTreeView;
var
  ARootNode: TTreeNode;
begin
  if (FPopupShellTreeView = nil) or (FPopupShellTreeView.InnerTreeView = nil) or
      (FPopupShellTreeView.InnerTreeView.Items.Count = 0) then
    Exit;

  ARootNode := FPopupShellTreeView.InnerTreeView.Items[0];
  if not ARootNode.Expanded then
    ARootNode.Expanded := True;
end;

function TcxCustomShellComboBox.FindNodeAmongExpandedNodes(ANodeText: string): TTreeNode;

  function InternalFindPIDLAmongExpandedNodes(ANode: TTreeNode): TTreeNode;
  var
    AChildNode: TTreeNode;
  begin
    Result := nil;
    if ANode = nil then
      Exit;
    if ANodeText = AnsiUpperCase(ANode.Text) then
    begin
      Result := ANode;
      Exit;
    end;
    if not ANode.Expanded then
      Exit;
    AChildNode := ANode.GetFirstChild;
    while AChildNode <> nil do
    begin
      Result := InternalFindPIDLAmongExpandedNodes(AChildNode);
      if Result <> nil then
        Break;
      AChildNode := ANode.GetNextChild(AChildNode);
    end;
  end;

begin
  ANodeText := AnsiUpperCase(ANodeText);
  with FPopupShellTreeView.InnerTreeView do
    if (Selected <> nil) and (ANodeText = AnsiUpperCase(Selected.Text)) then
      Result := Selected
    else
      Result := InternalFindPIDLAmongExpandedNodes(Items.GetFirstNode);
end;

function TcxCustomShellComboBox.GetPopupShellTreeViewClass: TcxPopupShellTreeViewClass;
begin
  Result := TcxPopupShellTreeView;
end;

procedure TcxCustomShellComboBox.InternalSetAbsolutePIDL(Value: PItemIDList);
begin
  if not EqualPIDLs(FAbsolutePIDL, Value) then
  begin
    if FAbsolutePIDL <> nil then
      FreeAndNilPIDL(FAbsolutePIDL);
    if Value <> nil then
    begin
      FAbsolutePIDL := GetPidlCopy(Value);
      SynchronizeDependentShellControls;
    end;
  end;
end;

procedure TcxCustomShellComboBox.InternalSynchronizeEditValue(APIDL: PItemIDList;
  const ADisplayText: string = '');
var
  APIDLName: string;

  function UseInternalVirtualPathFormat: Boolean;
  var
    ATempPIDL: PItemIDList;
  begin
    APIDLName := GetPidlName(APIDL);
    Result := APIDLName = '';
    if not Result then
    begin
      ATempPIDL := InternalParseDisplayName(GetDesktopIShellFolder, APIDLName,
        Properties.GetShellViewOptions);
      Result := GetShellIconIndex(ATempPIDL) <>
        GetShellIconIndex(APIDL);
      DisposePidl(ATempPIDL);
    end;
  end;

var
  AIsEditValueChanged: Boolean;
  ANewEditValue: string;
  AParentIFolder: IShellFolder;
  AStrRet: TStrRet;
  ATempPIDL, ATempPIDL1: PItemIDList;
  I: Integer;
  S1, S2: string;
begin
  InternalSetAbsolutePIDL(APIDL);

  if APIDL = nil then
  begin
    ViewInfo.ShellIconIndex := -1;
    S1 := ADisplayText;
    ANewEditValue := DisplayValue;
  end
  else
  begin
    if Properties.StoreRelativePath and EqualPIDLs(Properties.Root.Pidl, APIDL) then
    begin
      ANewEditValue := '';
      S1 := GetPIDLDisplayName(APIDL, Properties.ShowFullPath and not IsFocused);
    end
    else
      if UseInternalVirtualPathFormat then
      begin
        ATempPIDL := APIDL;
        try
          if Properties.StoreRelativePath then
          begin
            Integer(APIDL) := Integer(APIDL) + GetPidlSize(Properties.Root.Pidl);
            S2 := cxShellObjectInternalRelativeVirtualPathPrefix;
            AParentIFolder := Properties.Root.ShellFolder;
          end
          else
          begin
            S2 := cxShellObjectInternalAbsoluteVirtualPathPrefix;
            AParentIFolder := GetDesktopIShellFolder;
          end;
          for I := 1 to GetPidlItemsCount(APIDL) do
          begin
            ATempPIDL1 := cxMalloc.Alloc(APIDL^.mkid.cb + SizeOf(SHITEMID));
            FillChar(ATempPIDL1^, APIDL^.mkid.cb + SizeOf(SHITEMID), 0);
            CopyMemory(ATempPIDL1, APIDL, APIDL^.mkid.cb);
            Integer(APIDL) := Integer(APIDL) + APIDL^.mkid.cb;
            AParentIFolder.GetDisplayNameOf(ATempPIDL1, SHGDN_INFOLDER, AStrRet);
            S1 := GetTextFromStrRet(AStrRet, ATempPIDL1);
            S2 := S2 + '\' + S1;
            AParentIFolder.BindToObject(ATempPIDL1, nil, IID_IShellFolder,
              Pointer(AParentIFolder));
            DisposePidl(ATempPIDL1);
          end;
          ANewEditValue := S2;
        finally
          APIDL := ATempPIDL;
        end;
      end
      else
      begin
        if Properties.StoreRelativePath then
        begin
          S1 := GetPidlName(Properties.Root.Pidl);
          S2 := GetPidlName(APIDL);
          if Pos(S1, S2) = 1 then
          begin
            if S1[Length(S1)] = '\' then
              S1 := Copy(S2, Length(S1) + 1, Length(S2) - Length(S1))
            else
              S1 := Copy(S2, Length(S1) + 2, Length(S2) - Length(S1) - 1);
            if (Length(S1) >= 1) and (S1[1] = '\') then
              S1 := Copy(S1, 2, Length(S1) - 1);
            ANewEditValue := S1;
          end
          else
            ANewEditValue := GetPidlName(APIDL);
        end
        else
          ANewEditValue := APidlName;
        S1 := GetPIDLDisplayName(APIDL, Properties.ShowFullPath and not IsFocused);
      end;
    ViewInfo.ShellIconIndex := GetShellIconIndex(APIDL);
  end;

  AIsEditValueChanged := (VarType(FEditValue) <> VarType(ANewEditValue)) or
      not VarEqualsExact(FEditValue, ANewEditValue);
  FEditValue := ANewEditValue;

  DataBinding.DisplayValue := S1;
//  SelStart := Length(S1);
  InvalidateShellIconRect;

  if AIsEditValueChanged then
    DoEditValueChanged;
end;

procedure TcxCustomShellComboBox.InvalidateShellIconRect;
begin
  with ViewInfo.ShellIconPosition do
    InvalidateRect(Rect(X, Y, X + cxShellComboBoxImageList.Width, Y +
      cxShellComboBoxImageList.Height), False);
end;

procedure TcxCustomShellComboBox.SelectedNodeChangeHandler(Sender: TObject;
  ANode: TTreeNode);
var
  ANodeIndex: Integer;
begin
  if (not HasPopupWindow) and not FNotificationFromDependentShellControls then
    Exit;

  ANodeIndex := -1;
  TraverseAllVisibleNodes(ANodeIndex, ANode);
  TcxShellComboBoxLookupData(FLookupData).InternalSetCurrentKey(ANodeIndex);

  if FIsSelectedNodeChangeEventLocked or (not DataBinding.Modified and not DoEditing) then
    Exit;

  if IsFocused then
    ModifiedAfterEnter := True;

  DataBinding.DisplayValue := ANode.Text;
  SelStart := Length(DataBinding.DisplayValue);
  ViewInfo.ShellIconIndex := ANode.ImageIndex;
  InvalidateShellIconRect;

  if Properties.ImmediatePost and AutoPostEditValue and ValidateEdit(True) then
    PostEditValue;
end;

procedure TcxCustomShellComboBox.SynchronizeDependentShellControls;
var
  ATempPIDL: PItemIDList;
begin
  if FIsDependentShellControlsNotification or FNotificationFromDependentShellControls then
    Exit;
  FIsDependentShellControlsNotification := True;
  try
    if FAbsolutePIDL = nil then
      Exit;
    ATempPIDL := GetPidlCopy(FAbsolutePIDL);
    try
      if (FShellTreeView <> nil) and FShellTreeView.HandleAllocated then
        SendMessage(FShellTreeView.InnerTreeView.Handle, DSM_DONAVIGATE, Integer(ATempPIDL), 0);

      if FShellListView <> nil then
        FShellListView.ProcessTreeViewNavigate(ATempPIDL);

      SynchronizePopupShellTreeView;
    finally
      DisposePidl(ATempPIDL);
    end;
  finally
    FIsDependentShellControlsNotification := False;
  end;
end;

procedure TcxCustomShellComboBox.SynchronizePopupShellTreeView;
begin
  if FAbsolutePIDL = nil then
    Exit;

  if not IsDesigning and (FPopupShellTreeView <> nil) and (HasPopupWindow(* or not IsInplace*)) then
    with FPopupShellTreeView do
      if (Parent <> nil) and Parent.HandleAllocated and (InnerTreeView <> nil) then
      begin
        InnerTreeView.HandleNeeded;
        SendMessage(InnerTreeView.Handle, DSM_DONAVIGATE, WPARAM(FAbsolutePIDL), 0);
      end;
end;

function TcxCustomShellComboBox.TraverseAllVisibleNodes(var ANodeIndex: Integer;
  ATreeNode: TTreeNode = nil): TTreeNode;
var
  ANodeCount: Integer;

  function InternalTraverseAllVisibleNodes(ANode: TTreeNode): TTreeNode;
  var
    AChildNode: TTreeNode;
  begin
    Result := nil;
    if ANode = nil then
      Exit;
    if (ANodeCount = ANodeIndex) or (ANode = ATreeNode) then
    begin
      Result := ANode;
      Exit;
    end;
    Inc(ANodeCount);
    if not ANode.Expanded then
      Exit;
    AChildNode := ANode.GetFirstChild;
    while AChildNode <> nil do
    begin
      Result := InternalTraverseAllVisibleNodes(AChildNode);
      if Result <> nil then
        Break;
      AChildNode := ANode.GetNextChild(AChildNode);
    end;
  end;

begin
  CheckPopupShellTreeView;
  ANodeCount := 0;
  if FPopupShellTreeView = nil then
    Result := nil
  else
    with FPopupShellTreeView.InnerTreeView do
      Result := InternalTraverseAllVisibleNodes(Items.GetFirstNode);
  ANodeIndex := ANodeCount;
end;

function TcxCustomShellComboBox.GetAbsolutePIDL: PItemIDList;
begin
  Result := GetPidlCopy(FAbsolutePIDL);
end;

function TcxCustomShellComboBox.GetAbsolutePath: string;
begin
  if FAbsolutePIDL = nil then
    Result := ''
  else
    Result := GetPidlName(FAbsolutePIDL);
end;

function TcxCustomShellComboBox.GetProperties: TcxShellComboBoxProperties;
begin
  Result := TcxShellComboBoxProperties(InternalGetProperties);
end;

(*function TcxCustomShellComboBox.GetRelativePath: string;
begin
end;*)

function TcxCustomShellComboBox.GetViewInfo: TcxShellComboBoxViewInfo;
begin
  Result := TcxShellComboBoxViewInfo(FViewInfo);
end;

procedure TcxCustomShellComboBox.RootChangeHandler(Sender: TObject);
begin
  if not IsDesigning then
  begin
    FPopupShellTreeView.Root.Assign(Properties.Root);
  end;

  if not Properties.ChangedLocked and not ModifiedAfterEnter then
    SynchronizeDisplayValue;
end;

procedure TcxCustomShellComboBox.SetAbsolutePIDL(Value: PItemIDList);
begin
  if not CheckAbsolutePIDL(Value, True) then
    Exit;
  InternalSynchronizeEditValue(Value);
end;

procedure TcxCustomShellComboBox.SetAbsolutePath(const Value: string);
begin
  EditValue := Value;
end;

procedure TcxCustomShellComboBox.SetProperties(Value: TcxShellComboBoxProperties);
begin
  FProperties.Assign(Value);
end;

procedure TcxCustomShellComboBox.SetRelativePIDL(Value: PItemIDList);
var
  ATempPIDL: PItemIDList;
begin
  Properties.CheckRoot;
  if Value = nil then
    InternalSynchronizeEditValue(Properties.Root.Pidl)
  else
  begin
    ATempPIDL := ConcatenatePidls(Properties.Root.Pidl, Value);
    try
      if CheckShellObjectExistence(ATempPIDL) then
        InternalSynchronizeEditValue(ATempPIDL);
    finally
      DisposePidl(ATempPIDL);
    end;
  end;
end;

(*procedure TcxCustomShellComboBox.SetRelativePath(const Value: string);
begin
end;*)

procedure TcxCustomShellComboBox.SetShellListView(Value: TcxCustomShellListView);
begin
  if Value = FShellListView then
    Exit;
  if FShellListView <> nil then
  begin
    if (FShellListView.InnerListView <> nil) and not(csDestroying in FShellListView.InnerListView.ComponentState) then
      TcxInnerShellListViewAccess(FShellListView.InnerListView).ComboBoxControl := nil;
{$IFDEF DELPHI5}
    FShellListView.RemoveFreeNotification(Self);
{$ENDIF}
  end;
  FShellListView := Value;
  if FShellListView <> nil then
  begin
    FShellListView.FreeNotification(Self);
    TcxInnerShellListViewAccess(FShellListView.InnerListView).ComboBoxControl := Self;
  end;
end;

procedure TcxCustomShellComboBox.SetShellTreeView(Value: TcxCustomShellTreeView);
begin
  if Value = FShellTreeView then
    Exit;
  if FShellTreeView <> nil then
  begin
    if (FShellTreeView.InnerTreeView <> nil) and not(csDestroying in FShellTreeView.InnerTreeView.ComponentState) then
      TcxInnerShellTreeViewAccess(FShellTreeView.InnerTreeView).ComboBoxControl := nil;
{$IFDEF DELPHI5}
    FShellTreeView.RemoveFreeNotification(Self);
{$ENDIF}
  end;
  FShellTreeView := Value;
  if FShellTreeView <> nil then
  begin
    FShellTreeView.FreeNotification(Self);
    TcxInnerShellTreeViewAccess(FShellTreeView.InnerTreeView).ComboBoxControl := Self;
  end;
end;

procedure TcxCustomShellComboBox.DSMDoNavigate(var Message: TMessage);
var
  APIDL: PItemIDList;
begin
  if FIsDependentShellControlsNotification or FNotificationFromDependentShellControls then
    Exit;
  FNotificationFromDependentShellControls := True;
  try
    APIDL := PItemIDList(Message.WParam);
    if not CheckAbsolutePIDL(APIDL, False) then
      Exit;

    if not IsDesigning and (FPopupShellTreeView <> nil) then
      with FPopupShellTreeView do
        if (Parent <> nil) and Parent.HandleAllocated and (InnerTreeView <> nil) then
        begin
          InnerTreeView.HandleNeeded;
          SendMessage(InnerTreeView.Handle, DSM_DONAVIGATE, WPARAM(APIDL), 0);
          SynchronizeEditValue;
          Exit;
        end;

    InternalSynchronizeEditValue(APIDL);
  finally
    FNotificationFromDependentShellControls := False;
  end;
end;

initialization
  GetRegisteredEditProperties.Register(TcxShellComboBoxProperties, scxSEditRepositoryShellComboBoxItem);
  FilterEditsController.Register(TcxShellComboBoxProperties, TcxFilterShellComboBoxHelper);
  PrepareShellComboBoxImageList;

finalization
  FreeAndNil(cxShellComboBoxImageList);
  FilterEditsController.Unregister(TcxShellComboBoxProperties, TcxFilterShellComboBoxHelper);
  GetRegisteredEditProperties.Unregister(TcxShellComboBoxProperties);

end.
