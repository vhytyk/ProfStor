
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

unit cxListBox;

{$I cxEdVer.inc}

interface

uses
{$IFDEF WIN32}
  Windows, Messages,
{$ENDIF}
{$IFNDEF VCL}
  Qt, Types,
{$ENDIF}
  Classes, Controls, Forms, Menus, StdCtrls, SysUtils, cxClasses, cxControls,
  cxContainer, cxDataUtils, cxGraphics, cxLookAndFeels, cxScrollBar;

type
  TcxListBox = class;

  { TcxInnerListBox }

  TcxInnerListBox = class(TcxCustomInnerListBox)
  private
    function GetContainer: TcxListBox;
{$IFDEF VCL}
    procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
{$ENDIF}
  protected
    procedure Click; override;
{$IFDEF VCL}
    procedure CreateWindowHandle(const Params: TCreateParams); override;
{$ENDIF}
    property Container: TcxListBox read GetContainer;
  public
    function ExecuteAction(Action: TBasicAction): Boolean; override;
    function UpdateAction(Action: TBasicAction): Boolean; override;
{$IFDEF DELPHI5}
    function CanFocus: Boolean; override;
{$ENDIF}
  end;

  { TcxListBox }

  TcxListBoxDrawItemEvent = procedure(AControl: TcxListBox; ACanvas: TcxCanvas;
    AIndex: Integer; ARect: TRect; AState: TOwnerDrawState) of object;
  TcxListBoxMeasureItemEvent = procedure(AControl: TcxListBox; AIndex: Integer;
    var Height: Integer) of object;

  TcxListBox = class(TcxContainer)
  private
    FOnDrawItem: TcxListBoxDrawItemEvent;
    FOnMeasureItem: TcxListBoxMeasureItemEvent;
    FInnerListBox: TcxInnerListBox;
    FIsExitProcessing: Boolean;
{$IFDEF VCL}
    FIntegralHeight: Boolean;
{$ENDIF}
    procedure DoDrawItem({$IFDEF VCL}Control: TWinControl{$ELSE}Sender: TObject{$ENDIF}; Index: Integer; Rect: TRect;
      State: TOwnerDrawState{$IFNDEF VCL}; var Handled: Boolean{$ENDIF}); // TODO Handled in VCL ???
    procedure DoMeasureItem(Control: TWinControl; Index: Integer;
      var Height: Integer);
    function GetColumns: Integer;
    function GetCount: Integer;
    function GetExtendedSelect: Boolean;
    function GetInnerListBox: TListBox;
    function GetItemHeight: Integer;
    function GetItemIndex: Integer;
    function GetItems: TStrings;
    function GetListStyle: TListBoxStyle;
    function GetMultiSelect: Boolean;
    function GetReadOnly: Boolean;
    function GetSelCount: Integer;
    function GetSelected(Index: Integer): Boolean;
    function GetSorted: Boolean;
    function GetTopIndex: Integer;
    procedure SetColumns(Value: Integer);
    procedure SetExtendedSelect(Value: Boolean);
    procedure SetItemHeight(Value: Integer);
    procedure SetItemIndex(Value: Integer);
    procedure SetItems(Value: TStrings);
    procedure SetListStyle(Value: TListBoxStyle);
    procedure SetMultiSelect(Value: Boolean);
    procedure SetOnDrawItem(Value: TcxListBoxDrawItemEvent);
    procedure SetOnMeasureItem(Value: TcxListBoxMeasureItemEvent);
    procedure SetReadOnly(Value: Boolean);
    procedure SetSelected(Index: Integer; Value: Boolean);
    procedure SetSorted(Value: Boolean);
    procedure SetTopIndex(Value: Integer);
{$IFDEF VCL}
  {$IFDEF DELPHI6}
    function GetAutoComplete: Boolean;
    function GetOnData: TLBGetDataEvent;
    function GetOnDataFind: TLBFindDataEvent;
    function GetOnDataObject: TLBGetDataObjectEvent;
    procedure SetAutoComplete(Value: Boolean);
    procedure SetCount(Value: Integer);
    procedure SetOnData(Value: TLBGetDataEvent);
    procedure SetOnDataFind(Value: TLBFindDataEvent);
    procedure SetOnDataObject(Value: TLBGetDataObjectEvent);
  {$ENDIF}
{$ENDIF}
{$IFDEF VCL}
    function GetScrollWidth: Integer;
    function GetTabWidth: Integer;
    procedure SetIntegralHeight(Value: Boolean);
    procedure SetScrollWidth(Value: Integer);
    procedure SetTabWidth(Value: Integer);
{$ELSE}
    function GetColumnLayout: TListBoxLayout;
    function GetRowLayout: TListBoxLayout;
    procedure SetColumnLayout(Value: TListBoxLayout);
    procedure SetRowLayout(Value: TListBoxLayout);
{$ENDIF}
  protected
    FDataBinding: TcxCustomDataBinding;
    procedure AdjustInnerControl; override;
    procedure DataChange; override;
    procedure DoExit; override;
    procedure FontChanged; override;
    function IsInternalControl(AControl: TControl): Boolean; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure UpdateData; override;
{$IFDEF VCL}
    function CanResize(var NewWidth, NewHeight: Integer): Boolean; override;
    procedure SetSize; override;
    procedure WndProc(var Message: TMessage); override;
{$ENDIF}
    function GetDataBindingClass: TcxCustomDataBindingClass; virtual;
{$IFDEF VCL}
    procedure GetOptimalHeight(var ANewHeight: Integer);
{$ENDIF}
    property DataBinding: TcxCustomDataBinding read FDataBinding;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function ExecuteAction(Action: TBasicAction): Boolean; override;
    function UpdateAction(Action: TBasicAction): Boolean; override;
    procedure AddItem(AItem: string; AObject: TObject);
    procedure Clear;
    procedure ClearSelection;
    procedure DeleteSelected;
    function ItemAtPos(const APos: TPoint; AExisting: Boolean): Integer;
    function ItemRect(Index: Integer): TRect;
    function ItemVisible(Index: Integer): Boolean;
    procedure SelectAll;
{$IFDEF DELPHI6}
  {$IFDEF VCL}
    procedure CopySelection(ADestination: TCustomListControl);
    procedure MoveSelection(ADestination: TCustomListControl);
  {$ENDIF}
{$ENDIF}
{$IFNDEF VCL}
    procedure MakeCurrentVisible;
    procedure Sort;
    function VisibleItemCount: Integer;
{$ENDIF}
    property Count: Integer read GetCount{$IFDEF VCL}{$IFDEF DELPHI6} write SetCount{$ENDIF}{$ENDIF};
    property InnerListBox: TListBox read GetInnerListBox;
    property ItemIndex: Integer read GetItemIndex write SetItemIndex;
    property SelCount: Integer read GetSelCount;
    property Selected[Index: Integer]: Boolean read GetSelected write SetSelected;
    property TopIndex: Integer read GetTopIndex write SetTopIndex;
  published
{$IFNDEF VCL}
    property ColumnLayout: TListBoxLayout read GetColumnLayout write SetColumnLayout
      default llFixedNumber; // Must be published before Columns
    property ListStyle: TListBoxStyle read GetListStyle write SetListStyle
      default lbStandard; // ListStyle must be published before Items
    property RowLayout: TListBoxLayout read GetRowLayout write SetRowLayout
      default llVariable; // Must be published before Rows
{$ENDIF}
    property Align;
    property Anchors;
    property Columns: Integer read GetColumns write SetColumns default 0; // TODO CLX
    property Constraints;
    property DragMode;
    property Enabled;
    property ExtendedSelect: Boolean read GetExtendedSelect write SetExtendedSelect default True;
    property ItemHeight: Integer read GetItemHeight write SetItemHeight;
    property Items: TStrings read GetItems write SetItems;
{$IFDEF VCL}
    property ListStyle: TListBoxStyle read GetListStyle write SetListStyle
      default lbStandard;
{$ENDIF}
    property MultiSelect: Boolean read GetMultiSelect write SetMultiSelect default False;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property Sorted: Boolean read GetSorted write SetSorted default False;
    property Style;
    property TabOrder;
    property TabStop;
    property Visible;
{$IFDEF VCL}
  {$IFDEF DELPHI6}
    property AutoComplete: Boolean read GetAutoComplete write SetAutoComplete default True;
  {$ENDIF}
    property BiDiMode;
    property DragCursor;
    property DragKind;
    property ImeMode;
    property ImeName;
    property IntegralHeight: Boolean read FIntegralHeight write SetIntegralHeight default False;
    property ParentBiDiMode;
    property ScrollWidth: Integer read GetScrollWidth write SetScrollWidth default 0;
    property TabWidth: Integer read GetTabWidth write SetTabWidth default 0;
{$ENDIF}
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnDrawItem: TcxListBoxDrawItemEvent read FOnDrawItem write SetOnDrawItem;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMeasureItem: TcxListBoxMeasureItemEvent read FOnMeasureItem write SetOnMeasureItem;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
{$IFDEF DELPHI5}
    property OnContextPopup;
{$ENDIF}
{$IFDEF DELPHI6}
  {$IFDEF VCL}
    property OnData: TLBGetDataEvent read GetOnData write SetOnData;
    property OnDataFind: TLBFindDataEvent read GetOnDataFind write SetOnDataFind;
    property OnDataObject: TLBGetDataObjectEvent read GetOnDataObject write SetOnDataObject;
  {$ENDIF}
{$ENDIF}
{$IFDEF VCL}
    property OnEndDock;
    property OnStartDock;
{$ENDIF}
  end;

implementation

uses
{$IFDEF DELPHI6}
  Variants,
{$ENDIF}
  Graphics, cxEdit;

type
  TcxCustomDataBindingAccess = class(TcxCustomDataBinding);

{ TcxInnerListBox }

function TcxInnerListBox.ExecuteAction(Action: TBasicAction): Boolean;
begin
  Result := inherited ExecuteAction(Action) or
    TcxCustomDataBindingAccess(Container.FDataBinding).ExecuteAction(Action);
end;

function TcxInnerListBox.UpdateAction(Action: TBasicAction): Boolean;
begin
  Result := inherited UpdateAction(Action) or
    TcxCustomDataBindingAccess(Container.FDataBinding).UpdateAction(Action);
end;

{$IFDEF DELPHI5}
function TcxInnerListBox.CanFocus: Boolean;
begin
  Result := Container.CanFocusEx;
end;
{$ENDIF}

procedure TcxInnerListBox.Click;
begin
  if Container.DataBinding.SetEditMode then
    inherited Click;
end;

{$IFDEF VCL}
procedure TcxInnerListBox.CreateWindowHandle(const Params: TCreateParams);
begin
  inherited CreateWindowHandle(Params);
  SetExternalScrollBarsParameters;
end;
{$ENDIF}

function TcxInnerListBox.GetContainer: TcxListBox;
begin
  Result := TcxListBox(FContainer);
end;

{$IFDEF VCL}
procedure TcxInnerListBox.WMLButtonDown(var Message: TWMLButtonDown);
begin
  if Container.DataBinding.SetEditMode then
    inherited
  else
  begin
    SetFocus;
    with Message do
      MouseDown(mbLeft, KeysToShiftState(Keys), XPos, YPos);
  end;
end;
{$ENDIF}

{ TcxListBox }

constructor TcxListBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FDataBinding := GetDataBindingClass.Create(Self, Self);
  with TcxCustomDataBindingAccess(FDataBinding) do
  begin
    OnDataChange := Self.DataChange;
    OnDataSetChange := Self.DataSetChange;
    OnUpdateData := Self.UpdateData;
  end;
  FInnerListBox := TcxInnerListBox.Create(Self);
  FInnerListBox.BorderStyle := bsNone;
  FInnerListBox.Parent := Self;
  FInnerListBox.FContainer := Self;
  FInnerListBox.TabStop := False;
  InnerControl := FInnerListBox;
  FInnerListBox.LookAndFeel.MasterLookAndFeel := Style.LookAndFeel;
  Width := 121;
  Height := 97;
end;

destructor TcxListBox.Destroy;
begin
  FreeAndNil(FInnerListBox);
  FreeAndNil(FDataBinding);
  inherited Destroy;
end;

function TcxListBox.ExecuteAction(Action: TBasicAction): Boolean;
begin
  Result := inherited ExecuteAction(Action) or
    TcxCustomDataBindingAccess(FDataBinding).ExecuteAction(Action);
end;

function TcxListBox.UpdateAction(Action: TBasicAction): Boolean;
begin
  Result := inherited UpdateAction(Action) or
    TcxCustomDataBindingAccess(FDataBinding).UpdateAction(Action);
end;

procedure TcxListBox.AddItem(AItem: string; AObject: TObject);
begin
  FInnerListBox.AddItem(AItem, AObject);
end;

procedure TcxListBox.Clear;
begin
  FInnerListBox.Clear;
end;

procedure TcxListBox.ClearSelection;
begin
  FInnerListBox.ClearSelection;
end;

procedure TcxListBox.DeleteSelected;
begin
  FInnerListBox.DeleteSelected;
end;

function TcxListBox.ItemAtPos(const APos: TPoint; AExisting: Boolean): Integer;
begin
  Result := FInnerListBox.ItemAtPos(APos, AExisting);
end;

function TcxListBox.ItemRect(Index: Integer): TRect;
begin
  Result := FInnerListBox.ItemRect(Index);
end;

function TcxListBox.ItemVisible(Index: Integer): Boolean;
begin
  Result := FInnerListBox.ItemVisible(Index);
end;

procedure TcxListBox.SelectAll;
begin
  FInnerListBox.SelectAll;
end;

{$IFDEF DELPHI6}
  {$IFDEF VCL}
procedure TcxListBox.CopySelection(ADestination: TCustomListControl);
begin
  FInnerListBox.CopySelection(ADestination);
end;

procedure TcxListBox.MoveSelection(ADestination: TCustomListControl);
begin
  FInnerListBox.MoveSelection(ADestination);
end;
  {$ENDIF}
{$ENDIF}

{$IFNDEF VCL}
procedure TcxListBox.MakeCurrentVisible;
begin
  FInnerListBox.MakeCurrentVisible;
end;

procedure TcxListBox.Sort;
begin
  FInnerListBox.Sort;
end;

function TcxListBox.VisibleItemCount: Integer;
begin
  Result := FInnerListBox.VisibleItemCount;
end;
{$ENDIF}

procedure TcxListBox.AdjustInnerControl;
begin
  if FInnerListBox <> nil then
  begin
    FInnerListBox.Color := ViewInfo.BackgroundColor;
    FInnerListBox.Font := Font;
    if Enabled then
      FInnerListBox.Font.Color := Font.Color
    else
      FInnerListBox.Font.Color := {$IFDEF VCL}clBtnShadow{$ELSE}clDisabledButtonText{$ENDIF};
  end;
end;

procedure TcxListBox.DataChange;
begin
  if DataBinding.IsDataSourceLive then
    ItemIndex := Items.IndexOf(VarToStr(DataBinding.GetStoredValue(evsText, Focused)))
  else
    ItemIndex := -1;
end;

procedure TcxListBox.DoExit;
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

procedure TcxListBox.FontChanged;
begin
  inherited FontChanged;
  SetSize;
end;

function TcxListBox.IsInternalControl(AControl: TControl): Boolean;
begin
  if FInnerListBox = nil then
    Result := True
  else
    Result := (AControl = FInnerListBox.HScrollBar) or (AControl = FInnerListBox.VScrollBar);
  Result := Result or inherited IsInternalControl(AControl);
end;

procedure TcxListBox.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited KeyDown(Key, Shift);
  case Key of
    VK_PRIOR, VK_NEXT, VK_END, VK_HOME, VK_LEFT, VK_UP, VK_RIGHT, VK_DOWN:
      if not DataBinding.SetEditMode then
        Key := 0;
  end;
end;

procedure TcxListBox.KeyPress(var Key: Char);
begin
  inherited KeyPress(Key);
  case Key of
    #32..#255:
      if not DataBinding.SetEditMode then
        Key := #0;
    #27:
      DataBinding.Reset;
  end;
end;

procedure TcxListBox.UpdateData;
begin
  if ItemIndex >= 0 then
    DataBinding.SetStoredValue(evsText, Items[ItemIndex])
  else
    DataBinding.SetStoredValue(evsText, '');
end;

{$IFDEF VCL}
function TcxListBox.CanResize(var NewWidth, NewHeight: Integer): Boolean;
begin
  Result := inherited CanResize(NewWidth, NewHeight);
  if not Result or not IntegralHeight or IsLoading then
    Exit;
  if Align in [alLeft, alRight, alClient] then
    Exit;
  GetOptimalHeight(NewHeight);
end;

procedure TcxListBox.SetSize;

  procedure KillMouseMoveMessages;
  var
    AMsg: TMsg;
  begin
    while PeekMessage(AMsg, NativeHandle(FInnerListBox.Handle), WM_MOUSEMOVE,
      WM_MOUSEMOVE, PM_REMOVE) do
      ;
  end;

var
  ANewHeight: Integer;
  APrevBoundsRect: TRect;
begin
  if IsLoading then
    Exit;
  APrevBoundsRect := FInnerListBox.BoundsRect;
  try
    if not IntegralHeight or (Align in [alLeft, alRight, alClient]) then
    begin
      inherited SetSize;
      Exit;
    end;
    ANewHeight := Height;
    GetOptimalHeight(ANewHeight);
    Height := ANewHeight;
    inherited SetSize;
  finally
    if not EqualRect(APrevBoundsRect, FInnerListBox.BoundsRect) and FInnerListBox.HandleAllocated then
      KillMouseMoveMessages;
  end;
end;

procedure TcxListBox.WndProc(var Message: TMessage);
begin
  if FInnerListBox <> nil then
    case Message.Msg of
      LB_ADDSTRING..LB_MSGMAX:
        begin
          with TMessage(Message) do
            Result := SendMessage(FInnerListBox.Handle, Msg, WParam, LParam);
          Exit;
        end;
    end;
  inherited WndProc(Message);
  if (FInnerListBox <> nil) and (Message.Msg = WM_COMMAND) and (Message.WParamHi = LBN_SELCHANGE) then
    FInnerListBox.SetExternalScrollBarsParameters;
end;
{$ENDIF}

function TcxListBox.GetDataBindingClass: TcxCustomDataBindingClass;
begin
  Result := TcxDataBinding;
end;

{$IFDEF VCL}
procedure TcxListBox.GetOptimalHeight(var ANewHeight: Integer);

  function GetItemHeight(AIndex: Integer): Integer;
  begin
    case ListStyle of
      lbStandard{$IFDEF DELPHI6}, lbVirtual{$ENDIF}:
        Result := Canvas.FontHeight(Font);
      lbOwnerDrawFixed{$IFDEF DELPHI6}, lbVirtualOwnerDraw{$ENDIF}:
        Result := ItemHeight;
      lbOwnerDrawVariable:
        begin
          Result := ItemHeight;
          if (AIndex < Count) and Assigned(FInnerListBox.OnMeasureItem) then
            FInnerListBox.OnMeasureItem(Self, AIndex, Result);
        end;
    end;
  end;

var
  I: Integer;
  ABorderExtent: TRect;
  AItemHeight: Integer;
  AListClientSize, AListSize, AScrollBarSize: TSize;
  AScrollWidth: Integer;
  AVScrollBar: Boolean;
begin
  ABorderExtent := GetBorderExtent;
  AListClientSize.cy := ABorderExtent.Top + ABorderExtent.Bottom;
  AScrollBarSize := GetScrollBarSize;
  AScrollWidth := ScrollWidth;
  if AScrollWidth > 0 then
  Inc(AScrollWidth, 4);
  I := 0;
  repeat
    AItemHeight := GetItemHeight(I);
    Inc(AListClientSize.cy, AItemHeight);
    AListSize.cy := AListClientSize.cy;
    AListClientSize.cx := Width - (ABorderExtent.Left + ABorderExtent.Right);
    AVScrollBar := I + 1 < Count;
    if AVScrollBar then
      Dec(AListClientSize.cx, AScrollBarSize.cx);
    if AListClientSize.cx < AScrollWidth then
      Inc(AListSize.cy, AScrollBarSize.cy);
    if AListSize.cy = ANewHeight then
      Break;
    if AListSize.cy > ANewHeight then
    begin
      if I > 0 then
      begin
        Dec(AListClientSize.cy, AItemHeight);
        AListSize.cy := AListClientSize.cy;
        AListClientSize.cx := Width - (ABorderExtent.Left + ABorderExtent.Right);
        AVScrollBar := I < Count;
        if AVScrollBar then
          Dec(AListClientSize.cx, AScrollBarSize.cx);
        if AListClientSize.cx < AScrollWidth then
          Inc(AListSize.cy, AScrollBarSize.cy);
      end;
      Break;
    end;
    Inc(I);
  until False;
  ANewHeight := AListSize.cy;
end;
{$ENDIF}

procedure TcxListBox.DoDrawItem({$IFDEF VCL}Control: TWinControl{$ELSE}Sender: TObject{$ENDIF};
  Index: Integer; Rect: TRect; State: TOwnerDrawState{$IFNDEF VCL}; var Handled: Boolean{$ENDIF}); // TODO Handled in VCL ???
begin
  FOnDrawItem(Self, FInnerListBox.Canvas, Index, Rect, State);
{$IFNDEF VCL}
  Handled := True;
{$ENDIF}
end;

procedure TcxListBox.DoMeasureItem(Control: TWinControl; Index: Integer;
  var Height: Integer);
begin
  FOnMeasureItem(Self, Index, Height);
end;

function TcxListBox.GetColumns: Integer;
begin
  Result := FInnerListBox.Columns;
end;

function TcxListBox.GetCount: Integer;
begin
  Result := FInnerListBox.Items.Count;
end;

function TcxListBox.GetExtendedSelect: Boolean;
begin
  Result := FInnerListBox.ExtendedSelect;
end;

function TcxListBox.GetInnerListBox: TListBox;
begin
  Result := FInnerListBox;
end;

function TcxListBox.GetItemHeight: Integer;
begin
  Result := FInnerListBox.ItemHeight;
end;

function TcxListBox.GetItemIndex: Integer;
begin
  Result := FInnerListBox.ItemIndex;
end;

function TcxListBox.GetItems: TStrings;
begin
  Result := FInnerListBox.Items;
end;

function TcxListBox.GetListStyle: TListBoxStyle;
begin
  Result := FInnerListBox.Style;
end;

function TcxListBox.GetMultiSelect: Boolean;
begin
  Result := FInnerListBox.MultiSelect;
end;

function TcxListBox.GetReadOnly: Boolean;
begin
  Result := TcxCustomDataBindingAccess(DataBinding).ReadOnly;
end;

function TcxListBox.GetSelCount: Integer;
begin
  Result := FInnerListBox.SelCount;
end;

function TcxListBox.GetSelected(Index: Integer): Boolean;
begin
  Result := FInnerListBox.Selected[Index];
end;

function TcxListBox.GetSorted: Boolean;
begin
  Result := FInnerListBox.Sorted;
end;

function TcxListBox.GetTopIndex: Integer;
begin
  Result := FInnerListBox.TopIndex;
end;

procedure TcxListBox.SetColumns(Value: Integer);
begin
  FInnerListBox.Columns := Value;
{$IFDEF VCL}
  FInnerListBox.SetExternalScrollBarsParameters;
{$ENDIF}
end;

procedure TcxListBox.SetExtendedSelect(Value: Boolean);
begin
  FInnerListBox.ExtendedSelect := Value;
end;

procedure TcxListBox.SetItemHeight(Value: Integer);
begin
  FInnerListBox.ItemHeight := Value;
end;

procedure TcxListBox.SetItemIndex(Value: Integer);
begin
  FInnerListBox.ItemIndex := Value;
end;

procedure TcxListBox.SetItems(Value: TStrings);
begin
  FInnerListBox.Items := Value;
  TcxCustomDataBindingAccess(DataBinding).DataChange;
end;

procedure TcxListBox.SetListStyle(Value: TListBoxStyle);
begin
  FInnerListBox.Style := Value;
end;

procedure TcxListBox.SetMultiSelect(Value: Boolean);
begin
  FInnerListBox.MultiSelect := Value;
end;

procedure TcxListBox.SetOnDrawItem(Value: TcxListBoxDrawItemEvent);
begin
  FOnDrawItem := Value;
  if Assigned(FOnDrawItem) then
    FInnerListBox.OnDrawItem := DoDrawItem
  else
    FInnerListBox.OnDrawItem := nil;
end;

procedure TcxListBox.SetOnMeasureItem(Value: TcxListBoxMeasureItemEvent);
begin
  FOnMeasureItem := Value;
  if Assigned(FOnMeasureItem) then
    FInnerListBox.OnMeasureItem := DoMeasureItem
  else
    FInnerListBox.OnMeasureItem := nil;
end;

procedure TcxListBox.SetReadOnly(Value: Boolean);
begin
  TcxCustomDataBindingAccess(DataBinding).ReadOnly := Value;
end;

procedure TcxListBox.SetSelected(Index: Integer; Value: Boolean);
begin
  FInnerListBox.Selected[Index] := Value;
end;

procedure TcxListBox.SetSorted(Value: Boolean);
begin
  FInnerListBox.Sorted := Value;
end;

procedure TcxListBox.SetTopIndex(Value: Integer);
begin
  FInnerListBox.TopIndex := Value;
end;

{$IFDEF VCL}
  {$IFDEF DELPHI6}
function TcxListBox.GetAutoComplete: Boolean;
begin
  Result := FInnerListBox.AutoComplete;
end;

function TcxListBox.GetOnData: TLBGetDataEvent;
begin
  Result := FInnerListBox.OnData;
end;

function TcxListBox.GetOnDataFind: TLBFindDataEvent;
begin
  Result := FInnerListBox.OnDataFind;
end;

function TcxListBox.GetOnDataObject: TLBGetDataObjectEvent;
begin
  Result := FInnerListBox.OnDataObject;
end;

procedure TcxListBox.SetAutoComplete(Value: Boolean);
begin
  FInnerListBox.AutoComplete := Value;
end;

procedure TcxListBox.SetCount(Value: Integer);
begin
  FInnerListBox.Count := Value;
end;

procedure TcxListBox.SetOnData(Value: TLBGetDataEvent);
begin
  FInnerListBox.OnData := Value;
end;

procedure TcxListBox.SetOnDataFind(Value: TLBFindDataEvent);
begin
  FInnerListBox.OnDataFind := Value;
end;

procedure TcxListBox.SetOnDataObject(Value: TLBGetDataObjectEvent);
begin
  FInnerListBox.OnDataObject := Value;
end;
  {$ENDIF}
{$ENDIF}

{$IFDEF VCL}
function TcxListBox.GetScrollWidth: Integer;
begin
  Result := FInnerListBox.ScrollWidth;
end;

function TcxListBox.GetTabWidth: Integer;
begin
  Result := FInnerListBox.TabWidth;
end;

procedure TcxListBox.SetIntegralHeight(Value: Boolean);
begin
  if Value <> FIntegralHeight then
  begin
    FIntegralHeight := Value;
    SetSize;
  end;
end;

procedure TcxListBox.SetScrollWidth(Value: Integer);
begin
  FInnerListBox.ScrollWidth := Value;
end;

procedure TcxListBox.SetTabWidth(Value: Integer);
begin
  FInnerListBox.TabWidth := Value;
end;
{$ELSE}
function TcxListBox.GetColumnLayout: TListBoxLayout;
begin
  Result := FInnerListBox.ColumnLayout;
end;

function TcxListBox.GetRowLayout: TListBoxLayout;
begin
  Result := FInnerListBox.RowLayout;
end;

procedure TcxListBox.SetColumnLayout(Value: TListBoxLayout);
begin
  FInnerListBox.ColumnLayout := Value;
end;

procedure TcxListBox.SetRowLayout(Value: TListBoxLayout);
begin
  FInnerListBox.RowLayout := Value;
end;
{$ENDIF}

end.
