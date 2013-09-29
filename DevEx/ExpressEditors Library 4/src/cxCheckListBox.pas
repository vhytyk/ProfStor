
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

unit cxCheckListBox;

interface

{$I cxExtEdVer.inc}

uses
  dialogs,
{$IFDEF VCL}
  Windows, Messages,
{$ENDIF}
{$IFDEF DELPHI6}
  Types,
  Variants,
{$ENDIF}
  SysUtils, Classes, Controls, Graphics, StdCtrls, Forms, Math, cxClasses,
  cxControls, cxContainer, cxListBox, cxCheckBox, cxEdit, cxGraphics,
  cxExtEditConsts, cxExtEditUtils, cxVariants, cxDB, cxDataUtils, cxScrollBar,
  cxLookAndFeels;

type
  TcxCheckPaintHelper = class(TcxCustomCheckPaintHelper);
  TcxCustomCheckListBox = class;
  TcxCustomInnerCheckListBox = class;
  TcxClickCheckEvent = procedure(Sender: TObject; const AIndex: Integer;
    const OldState, NewState: TcxCheckBoxState) of object;
  TcxCustomMapStateToEditValueEvent = procedure(Sender: TObject; var EditValue: TcxEditValue) of object;
  TcxCustomMapEditValueToStateEvent = procedure(Sender: TObject;
    const Index: Integer; const EditValue: TcxEditValue;
    var CheckState: TcxCheckBoxState) of object;

  { TcxCheckListBoxItem }
  TcxCheckListBoxItem = class(TCollectionItem)
  private
    FText: TCaption;
    FState: TcxCheckBoxState;
    FEnabled: Boolean;
    function GetChecked: Boolean;
    procedure SetText(const Value: TCaption);
    procedure SetEnabled(Value: Boolean);
    procedure SetState(Value: TcxCheckBoxState);
    procedure SetChecked(Value: Boolean);
    procedure NormalizeAddedItemsCount(Index: Integer);
    procedure NormalizeDeletedItemsCount;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    function GetDisplayName: string; override;
    procedure Assign(Source: TPersistent); override;
    property Checked: Boolean read GetChecked write SetChecked;
  published
    property Text: TCaption read FText write SetText;
    property Enabled: Boolean read FEnabled write SetEnabled default True;
    property State: TcxCheckBoxState read FState write SetState default cbsUnchecked;
  end;

  { TcxCheckListBoxItems }
  TcxCheckListBoxItems = class(TCollection)
  private
    FCheckListBox: TcxCustomInnerCheckListBox;
    function GetItems(Index: Integer): TcxCheckListBoxItem;
    procedure SetItems(Index: Integer; const Value: TcxCheckListBoxItem);
  protected
    procedure Update(Item: TCollectionItem); override;
  public
    constructor Create(AOwner: TcxCustomInnerCheckListBox; ItemClass: TCollectionItemClass);
    destructor Destroy; override;
    property CheckListBox: TcxCustomInnerCheckListBox read FCheckListBox;
    property Items[Index: Integer]: TcxCheckListBoxItem read GetItems write SetItems; default;
    function Add: TcxCheckListBoxItem;
    procedure Delete(Index: Integer);
    procedure LoadStrings(AStrings: TStrings);
  end;

  { TcxCustomInnerCheckListBox }
  TcxCustomInnerCheckListBox = class(TcxCustomInnerListBox)
  private
    { Private declarations }
    FAllowGrayed: Boolean;
    FAllowDblClickToggle: Boolean;
    FStandardItemHeight: Integer;
    FOnClickCheck: TcxClickCheckEvent;
    FOnEditValueChanged: TNotifyEvent;
    FCheckPaintHelper: TcxCheckPaintHelper;
    FGlyph: TBitmap;
    FGlyphCount: Integer;
    FCheckItems: TcxCheckListBoxItems;
    FOnCustomMapStateToEditValue: TcxCustomMapStateToEditValueEvent;
    FOnCustomMapEditValueToState: TcxCustomMapEditValueToStateEvent;
    function GetContainer: TcxCustomCheckListBox;
    procedure ResetItemHeight;
    procedure DrawCheck(ACanvas: TcxCanvas; R: TRect; AState: TcxCheckBoxState;
      AEnabled: Boolean);
    procedure SetAllowGrayed(Value: Boolean);
{$IFDEF DELPHI6}
    function GetIntegerMappedValue(const AMaxValue: Int64): Int64;
    procedure SetIntegerMappedValue(const AValue: Int64);
{$ELSE}
    function GetIntegerMappedValue(const AMaxValue: Integer): Integer;
    procedure SetIntegerMappedValue(const AValue: Integer);
{$ENDIF}
    function GetGlyph: TBitmap;
    procedure GlyphChanged(Sender: TObject);
    procedure SetGlyph(Value: TBitmap);
    procedure SetGlyphCount(Value: Integer);
    procedure ToggleClickCheck(Index: Integer);
    procedure InvalidateCheck(Index: Integer);
    procedure CNDrawItem(var Message: TWMDrawItem); message CN_DRAWITEM;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
  protected
    { Protected declarations }
    property Container: TcxCustomCheckListBox read GetContainer;
    procedure LookAndFeelChanged; virtual;
    procedure FullRepaint; virtual;
    procedure InvalidateItem(Index: Integer); virtual;
    procedure UpdateEditValueFromMapped; virtual;
{$IFDEF DELPHI5}
    function InternalGetItemData(Index: Integer): Longint; override;
    procedure InternalSetItemData(Index: Integer; AData: Longint); override;
{$ENDIF}
    procedure KeyPress(var Key: Char); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure DoClickCheckEvent(const AIndex: Integer;
      const OldState, NewState: TcxCheckBoxState); virtual;
    procedure ClickCheck; virtual;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure DestroyWnd; override;
    function GetCheckWidth: Integer;
    procedure ClearCheck; virtual;
    procedure DblClick; override;
    property OnClickCheck: TcxClickCheckEvent read FOnClickCheck write FOnClickCheck;
    property AllowGrayed: Boolean read FAllowGrayed write SetAllowGrayed default False;
    property AllowDblClickToggle: Boolean read FAllowDblClickToggle
      write FAllowDblClickToggle default True;
    property Glyph: TBitmap read GetGlyph write SetGlyph;
    property GlyphCount: Integer read FGlyphCount write SetGlyphCount default 6;
    property CheckItems: TcxCheckListBoxItems read FCheckItems write FCheckItems;
    property OnCustomMapStateToEditValue: TcxCustomMapStateToEditValueEvent
      read FOnCustomMapStateToEditValue write FOnCustomMapStateToEditValue;
    property OnCustomMapEditValueToState: TcxCustomMapEditValueToStateEvent
      read FOnCustomMapEditValueToState write FOnCustomMapEditValueToState;
    property OnEditValueChanged: TNotifyEvent read FOnEditValueChanged
      write FOnEditValueChanged;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function ExecuteAction(Action: TBasicAction): Boolean; override;
    function UpdateAction(Action: TBasicAction): Boolean; override;
  published
    { Published declarations }
  end;

  { TcxCustomCheckListBox }
  TcxCustomCheckListBox = class(TcxContainer)
  private
    { Private declarations }
    FDataBinding: TcxCustomDataBinding;
    FInnerCheckListBox: TcxCustomInnerCheckListBox;
    FIntegralHeight: Boolean;
    FEditValue: TcxEditValue;
    FInternalUpdate: Boolean;
    FOnDrawItem: TDrawItemEvent;
    FOnMeasureItem: TMeasureItemEvent;
    function GetOnClickCheck: TcxClickCheckEvent;
    function GetAllowGrayed: Boolean;
    function GetAllowDblClickToggle: Boolean;
    function GetGlyph: TBitmap;
    function GetGlyphCount: Integer;
    function GetItems: TcxCheckListBoxItems;
    function GetColumns: Integer;
    function GetCount: Integer;
    function GetItemIndex: Integer;
    function GetScrollWidth: Integer;
    function GetSelected(Index: Integer): Boolean;
    function GetSorted: Boolean;
    function GetTabWidth: Integer;
    function GetTopIndex: Integer;
    function GetOnCustomMapStateToEditValue: TcxCustomMapStateToEditValueEvent;
    function GetOnCustomMapEditValueToState: TcxCustomMapEditValueToStateEvent;
    function GetOnEditValueChanged: TNotifyEvent;
    procedure SetOnClickCheck(Value: TcxClickCheckEvent);
    procedure SetAllowGrayed(Value: Boolean);
    procedure SetAllowDblClickToggle(Value: Boolean);
    procedure SetGlyph(Value: TBitmap);
    procedure SetGlyphCount(Value: Integer);
    procedure SetItems(Value: TcxCheckListBoxItems);
    procedure SetColumns(Value: Integer);
    procedure SetIntegralHeight(Value: Boolean);
    procedure SetItemIndex(Value: Integer);
    procedure SetScrollWidth(Value: Integer);
    procedure SetSelected(Index: Integer; Value: Boolean);
    procedure SetSorted(Value: Boolean);
    procedure SetTabWidth(Value: Integer);
    procedure SetTopIndex(Value: Integer);
    procedure SetOnCustomMapStateToEditValue(Value: TcxCustomMapStateToEditValueEvent);
    procedure SetOnCustomMapEditValueToState(Value: TcxCustomMapEditValueToStateEvent);
    procedure SetOnEditValueChanged(Value: TNotifyEvent);
{$IFDEF DELPHI6}
    function GetAutoComplete: Boolean;
    procedure SetAutoComplete(Value: Boolean);
    procedure SetCount(Value: Integer);
{$ENDIF}
    function GetReadOnly: Boolean;
    procedure SetReadOnly(Value: Boolean);
  protected
    { Protected declarations }
    procedure ContainerStyleChanged(Sender: TObject); override;
    procedure AdjustInnerControl; override;
    class function GetStyleClass: TcxContainerStyleClass; override;
    function CanResize(var NewWidth, NewHeight: Integer): Boolean; {$IFDEF VCL}override;{$ELSE}virtual;{$ENDIF}
    procedure FontChanged; override;
    procedure GetOptimalHeight(var ANewHeight: Integer);
    function IsInternalControl(AControl: TControl): Boolean; override;
    function RefreshContainer(const P: TPoint; Button: TcxMouseButton; Shift: TShiftState;
      AIsMouseEvent: Boolean): Boolean; override;
    procedure SetSize; override;
    procedure FullRepaint; virtual;

    class function GetDataBindingClass: TcxCustomDataBindingClass; virtual;
    function GetDataBinding: TcxCustomDataBinding; virtual;
    procedure SetDataBinding(Value: TcxCustomDataBinding); virtual;
    property DataBinding: TcxCustomDataBinding read GetDataBinding write SetDataBinding;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly;
    procedure DataChange; override;
    procedure UpdateData; override;
{$IFDEF VCL}
    procedure WndProc(var Message: TMessage); override;
{$ELSE}
    procedure ChangeBounds(ALeft, ATop, AWidth, AHeight: Integer); override;
{$ENDIF}
    property OnClickCheck: TcxClickCheckEvent read GetOnClickCheck write SetOnClickCheck;
    property AllowGrayed: Boolean read GetAllowGrayed write SetAllowGrayed default False;
    property AllowDblClickToggle: Boolean read GetAllowDblClickToggle
      write SetAllowDblClickToggle default True;
    property Glyph: TBitmap read GetGlyph write SetGlyph;
    property GlyphCount: Integer read GetGlyphCount write SetGlyphCount default 6;
    property Columns: Integer read GetColumns write SetColumns;
    property IntegralHeight: Boolean read FIntegralHeight write SetIntegralHeight;
    property Items: TcxCheckListBoxItems read GetItems write SetItems;
    property ScrollWidth: Integer read GetScrollWidth write SetScrollWidth;
    property Sorted: Boolean read GetSorted write SetSorted;
    property TabWidth: Integer read GetTabWidth write SetTabWidth;
{$IFDEF VCL}
    procedure CMParentColorChanged(var Message: TMessage); message CM_PARENTCOLORCHANGED;
    procedure DrawItem(Control: TWinControl;Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure MeasureItem(Control: TWinControl; Index: Integer; var Height: Integer);
{$ELSE}
    function DrawItem(Index: Integer; Rect: TRect; State: TOwnerDrawState): Boolean;
    procedure MeasureItem(Control: TWinControl;
    {$IFDEF LINUX}item: QClxListBoxItemH{$ELSE}Index: Integer{$ENDIF};
      var Height, Width: Integer);
{$ENDIF}
{$IFDEF DELPHI6}
    property AutoComplete: Boolean read GetAutoComplete write SetAutoComplete;
{$ENDIF}
    property OnDrawItem: TDrawItemEvent read FOnDrawItem write FOnDrawItem;
    property OnMeasureItem: TMeasureItemEvent read FOnMeasureItem write FOnMeasureItem;
    function IsValueStored: Boolean;
    function GetMaxMappedLength: Integer; virtual;
    function GetEditValue: TcxEditValue; virtual;
    procedure SetEditValue(const Value: TcxEditValue); virtual;
    property EditValue: TcxEditValue read GetEditValue write SetEditValue stored IsValueStored;
    procedure Loaded; override;
    function IsEditValueValid(const AEditValue: TcxEditValue;
      AllowEmpty: Boolean): Boolean; virtual;
    function NormalizeEditValue(const AEditValue: TcxEditValue): TcxEditValue; virtual;
    function TranslateEditValue(const AEditValue: TcxEditValue): TcxEditValue; virtual;
{$IFDEF DELPHI6}
    function GetIntegerMappedValue(const AMaxValue: Int64): Int64; virtual;
{$ELSE}
    function GetIntegerMappedValue(const AMaxValue: Integer): Integer; virtual;
{$ENDIF}
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    class function GetNotPublishedStyleValues: TcxEditStyleValues; override;
    procedure Clear;
    function ItemAtPos(const APos: TPoint; AExisting: Boolean): Integer;
    function ItemRect(Index: Integer): TRect;
{$IFDEF DELPHI6}
    procedure AddItem(AItem: String);
    procedure CopySelection(ADestination: TcxCustomCheckListBox);
    procedure DeleteSelected;
    procedure MoveSelection(ADestination: TcxCustomCheckListBox);
{$ENDIF}
    function ExecuteAction(Action: TBasicAction): Boolean; override;
    function UpdateAction(Action: TBasicAction): Boolean; override;
    property InnerCheckListBox: TcxCustomInnerCheckListBox read FInnerCheckListBox write FInnerCheckListBox;
    {cxListBox properties}
    property Count: Integer read GetCount{$IFDEF DELPHI6} write SetCount{$ENDIF};
    property ItemIndex: Integer read GetItemIndex write SetItemIndex;
    property Selected[Index: Integer]: Boolean read GetSelected write SetSelected;
    property TopIndex: Integer read GetTopIndex write SetTopIndex;
    property OnCustomMapStateToEditValue: TcxCustomMapStateToEditValueEvent
      read GetOnCustomMapStateToEditValue write SetOnCustomMapStateToEditValue;
    property OnCustomMapEditValueToState: TcxCustomMapEditValueToStateEvent
      read GetOnCustomMapEditValueToState write SetOnCustomMapEditValueToState;
    property OnEditValueChanged: TNotifyEvent read GetOnEditValueChanged
      write SetOnEditValueChanged;
  end;

  { TcxCheckListBox }
  TcxCheckListBox = class(TcxCustomCheckListBox)
  published
    { Published declarations }
    property AllowGrayed;
    property AllowDblClickToggle;
    property EditValue;
    property Glyph;
    property GlyphCount;
    property OnClickCheck;
    property OnCustomMapStateToEditValue;
    property OnCustomMapEditValueToState;
    property OnEditValueChanged;
    {cxListBox properties}
    property Align;
    property Anchors;
    property BiDiMode;
    property Columns;
    property Constraints;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property ImeMode;
    property ImeName;
    property IntegralHeight default False;
    property Items;
    property ParentBiDiMode;
    property ParentColor default False;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ScrollWidth;
    property ShowHint;
    property Sorted default False;
    property Style;
    property TabOrder;
    property TabStop;
    property TabWidth;
    property Visible;
{$IFDEF DELPHI6}
    property AutoComplete default True;
{$ENDIF}
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnDrawItem;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMeasureItem;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDock;
    property OnStartDrag;
{$IFDEF DELPHI5}
    property OnContextPopup;
{$ENDIF}
  end;

implementation

uses Consts {$IFDEF DELPHI6}, RTLConsts {$ENDIF} ;

type
  TcxCheckBoxControl = class(TcxCheckBox);
  TcxCustomDataBindingAccess = class(TcxCustomDataBinding);
  TcxContainerAccess = class(TcxContainer);

{ TcxCheckListBoxItem }
constructor TcxCheckListBoxItem.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  FText := '';
  FState := cbsUnchecked;
  FEnabled := True;
  NormalizeAddedItemsCount(Index);
end;

destructor TcxCheckListBoxItem.Destroy;
begin
  NormalizeDeletedItemsCount;
  inherited;
end;

procedure TcxCheckListBoxItem.Assign(Source: TPersistent);
begin
  if Source is TcxCheckListBoxItem then
    with TcxCheckListBoxItem(Source) do
    begin
      Self.Text := Text;
      Self.Enabled := Enabled;
      Self.State := FState;
    end
  else
  inherited Assign(Source);
end;

function TcxCheckListBoxItem.GetChecked: Boolean;
begin
  Result := (State = cbsChecked);
end;

procedure TcxCheckListBoxItem.SetText(const Value: TCaption);
begin
  FText := Value;
  if (TcxCheckListBoxItems(Collection).CheckListBox <> nil) then
    TcxCheckListBoxItems(Collection).CheckListBox.Items[Index] := Value;
  TcxCheckListBoxItems(Collection).Update(Self);
end;

procedure TcxCheckListBoxItem.NormalizeAddedItemsCount(Index: Integer);
begin
  if Assigned(TcxCheckListBoxItems(Collection).CheckListBox) then
  begin
    with TcxCheckListBoxItems(Collection) do
      while CheckListBox.Items.Count <= Index do
        CheckListBox.Items.Add('');
    TcxCheckListBoxItems(Collection).CheckListBox.Repaint;
  end;
end;

procedure TcxCheckListBoxItem.NormalizeDeletedItemsCount;
var
  I: Integer;
begin
  if Assigned(TcxCheckListBoxItems(Collection).CheckListBox) then
  begin
    with TcxCheckListBoxItems(Collection) do
    begin
      I := CheckListBox.Items.IndexOf(Text);
      if I <> -1 then
        CheckListBox.Items.Delete(I);
    end;
    with TcxCheckListBoxItems(Collection).CheckListBox do
    begin
      Canvas.FillRect(ClientRect);
      Invalidate;
    end;
  end;
end;

procedure TcxCheckListBoxItem.SetEnabled(Value: Boolean);
begin
  if FEnabled <> Value then
  begin
    FEnabled := Value;
    TcxCheckListBoxItems(Collection).Update(Self);
  end;
end;

procedure TcxCheckListBoxItem.SetState(Value: TcxCheckBoxState);
begin
  if FState <> Value then
  begin
    FState := Value;
    TcxCheckListBoxItems(Collection).Update(Self);

    if (TcxCheckListBoxItems(Collection).CheckListBox <> nil) and
      (not TcxCheckListBoxItems(Collection).CheckListBox.AllowGrayed) then
      TcxCheckListBoxItems(Collection).CheckListBox.UpdateEditValueFromMapped;
  end;
end;

procedure TcxCheckListBoxItem.SetChecked(Value: Boolean);
begin
  if Value and (State <> cbsChecked) then
    State := cbsChecked
  else
    if State <> cbsUnchecked then
      State := cbsUnchecked;
end;

function TcxCheckListBoxItem.GetDisplayName: string;
begin
  Result := Text;
  if Result = '' then
    Result := inherited GetDisplayName;
end;
{ TcxCheckListBoxItem }

{ TcxCheckListBoxItems }
constructor TcxCheckListBoxItems.Create(AOwner: TcxCustomInnerCheckListBox;
  ItemClass: TCollectionItemClass);
begin
  inherited Create(ItemClass);
  FCheckListBox := AOwner;
end;

destructor TcxCheckListBoxItems.Destroy;
begin
  FCheckListBox := nil;
  inherited;
end;

function TcxCheckListBoxItems.GetItems(Index: Integer): TcxCheckListBoxItem;
begin
  Result := TcxCheckListBoxItem(inherited Items[Index]);
end;

procedure TcxCheckListBoxItems.SetItems(Index: Integer;const Value: TcxCheckListBoxItem);
begin
  inherited Items[Index] := Value;
  if Assigned(CheckListBox) then
    CheckListBox.Items[Index] := Value.Text;
end;

procedure TcxCheckListBoxItems.Update(Item: TCollectionItem);
begin
  if Assigned(CheckListBox) then
  begin
    if Assigned(Item) then CheckListBox.InvalidateItem(Item.Index);
    CheckListBox.Changed;
  end;
end;

function TcxCheckListBoxItems.Add: TcxCheckListBoxItem;
begin
  Result := TcxCheckListBoxItem(inherited Add);
end;

procedure TcxCheckListBoxItems.Delete(Index: Integer);
begin
{$IFDEF DELPHI5}
  inherited Delete(Index);
{$ELSE}
  TcxCheckListBoxItem(Items[Index]).Free;
{$ENDIF}
end;

procedure TcxCheckListBoxItems.LoadStrings(AStrings: TStrings);
var
  I: Integer;
begin
  AStrings.Clear;
  for I := 0 to Count - 1 do
    AStrings.Add(Items[I].Text);
end;
{ TcxCheckListBoxItems }

{ TcxCustomInnerCheckListBox }
constructor TcxCustomInnerCheckListBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FGlyphCount := 6;
  FAllowGrayed := False;
  FAllowDblClickToggle := True;
  Style := lbOwnerDrawFixed;
  FCheckPaintHelper := TcxCheckPaintHelper.Create(Self);
  FCheckItems := TcxCheckListBoxItems.Create(Self, TcxCheckListBoxItem);
end;

destructor TcxCustomInnerCheckListBox.Destroy;
begin
  if Assigned(FGlyph) then FreeAndNil(FGlyph);
  FreeAndNil(FCheckItems);
  FreeAndNil(FCheckPaintHelper);
  inherited Destroy;
end;

procedure TcxCustomInnerCheckListBox.CreateWnd;
begin
  inherited CreateWnd;
  ResetItemHeight;
  CheckItems.LoadStrings(Items);
end;

procedure TcxCustomInnerCheckListBox.DestroyWnd;
begin
  Items.Clear;
  inherited DestroyWnd;
  CheckItems.LoadStrings(Items);
end;

procedure TcxCustomInnerCheckListBox.CreateParams(var Params: TCreateParams);
begin
  inherited;
  with Params do
    if Style and (LBS_OWNERDRAWFIXED or LBS_OWNERDRAWVARIABLE) = 0 then
      Style := Style or LBS_OWNERDRAWFIXED;
end;

procedure TcxCustomInnerCheckListBox.LookAndFeelChanged;
begin
  FCheckPaintHelper.Style.LookAndFeel.Assign(LookAndFeel);
  FCheckPaintHelper.Glyph := Glyph;
  FCheckPaintHelper.GlyphCount := GlyphCount;
  Invalidate;
end;

function TcxCustomInnerCheckListBox.GetCheckWidth: Integer;
begin
  if Assigned(FCheckPaintHelper) then
    Result := FCheckPaintHelper.GetCheckWidth + 2
  else
    Result := 15;
end;

procedure TcxCustomInnerCheckListBox.ClearCheck;
var
  I: Integer;
begin
  CheckItems.BeginUpdate;
  try
    for I := 0 to CheckItems.Count - 1 do
      CheckItems[I].FState := cbsUnchecked;
  finally
    CheckItems.EndUpdate;
  end;
end;

procedure TcxCustomInnerCheckListBox.DblClick;
var
  FMousePoint: TPoint;
  FClickInCheck: Boolean;
begin
  inherited;
  if not AllowDblClickToggle then Exit;
  GetCursorPos(FMousePoint);
  FMousePoint := ScreenToClient(FMousePoint);
  FClickInCheck := FCheckPaintHelper.IsClickInCheck(ItemRect(ItemIndex),
    CheckItems[ItemIndex].State, FMousePoint.X, FMousePoint.Y, UseRightToLeftAlignment);
  if (not FClickInCheck) and (ItemIndex <> -1) and
    CheckItems[ItemIndex].Enabled then
    ToggleClickCheck(ItemIndex);
end;

function TcxCustomInnerCheckListBox.ExecuteAction(Action: TBasicAction): Boolean;
begin
  Result := inherited ExecuteAction(Action) or
    TcxCustomDataBindingAccess(Container.FDataBinding).ExecuteAction(Action);
end;

function TcxCustomInnerCheckListBox.UpdateAction(Action: TBasicAction): Boolean;
begin
  Result := inherited UpdateAction(Action) or
    TcxCustomDataBindingAccess(Container.FDataBinding).UpdateAction(Action);
end;

procedure TcxCustomInnerCheckListBox.CMFontChanged(var Message: TMessage);
begin
  inherited;
  ResetItemHeight;
  Invalidate;
end;

function TcxCustomInnerCheckListBox.GetContainer: TcxCustomCheckListBox;
begin
  Result := TcxCustomCheckListBox(FContainer);
end;

procedure TcxCustomInnerCheckListBox.ResetItemHeight;
begin
  if HandleAllocated then
  begin
    Canvas.Font := Container.Style.Font;
    FStandardItemHeight := Canvas.TextHeight('Wg');
    Perform(LB_SETITEMHEIGHT, 0, FStandardItemHeight);
  end;
end;

procedure TcxCustomInnerCheckListBox.FullRepaint;
begin
  if not (csLoading in ComponentState) then
  begin
    LockWindowUpdate(Handle);
    LockWindowUpdate(0);
  end;
end;

procedure TcxCustomInnerCheckListBox.CNDrawItem(var Message: TWMDrawItem);
begin
  if Items.Count = 0 then
    Exit;
  with Message.DrawItemStruct^ do
    if not UseRightToLeftAlignment then
      rcItem.Left := rcItem.Left + RectHeight(rcItem) + 2
    else
      rcItem.Right := rcItem.Right - (GetCheckWidth * 2) - 8;
  inherited;
end;

procedure TcxCustomInnerCheckListBox.DrawCheck(ACanvas: TcxCanvas; R: TRect;
  AState: TcxCheckBoxState; AEnabled: Boolean);
begin
  if (R.Top < 0) then Exit;
  FCheckPaintHelper.Style.Assign(Container.Style);
  FCheckPaintHelper.Style.LookandFeel.Assign(Container.Style.LookAndFeel);
  FCheckPaintHelper.Style.Font.Assign(Container.Style.Font);
  FCheckPaintHelper.Glyph := Glyph;
  FCheckPaintHelper.GlyphCount := GlyphCount;
  FCheckPaintHelper.DrawCheck(ACanvas, R, AState, AEnabled, 1);
end;

procedure TcxCustomInnerCheckListBox.InvalidateItem(Index: Integer);
var
  R: TRect;
begin
  R := ItemRect(Index);
  InvalidateRect(Handle, @R, not (csOpaque in ControlStyle));
end;

procedure TcxCustomInnerCheckListBox.InvalidateCheck(Index: Integer);
var
  R: TRect;
begin
  R := ItemRect(Index);
  if not UseRightToLeftAlignment then
    R.Right := R.Left + GetCheckWidth
  else
    R.Left := R.Right - GetCheckWidth;
  InvalidateRect(Handle, @R, not (csOpaque in ControlStyle));
end;

procedure TcxCustomInnerCheckListBox.SetAllowGrayed(Value: Boolean);
begin
  if FAllowGrayed <> Value then
  begin
    FAllowGrayed := Value;
    if not FAllowGrayed then
      UpdateEditValueFromMapped;
  end;
end;

{$IFDEF DELPHI6}
function TcxCustomInnerCheckListBox.GetIntegerMappedValue(const AMaxValue: Int64): Int64;
{$ELSE}
function TcxCustomInnerCheckListBox.GetIntegerMappedValue(const AMaxValue: Integer): Integer;
{$ENDIF}
var
  I: Integer;
{$IFDEF DELPHI6}
  FNewPowerValue: Int64;
{$ELSE}
  FNewPowerValue: Integer;
{$ENDIF}
begin
  Result := 0;
  for I := 0 to CheckItems.Count - 1 do
  begin
    if I > 63 then Break;
    if CheckItems[I].Checked then
    begin
      FNewPowerValue := Result + Trunc(Power(2, I));
      if AMaxValue >= FNewPowerValue then
        Result := FNewPowerValue
      else
        Break;
    end;
  end;
end;

{$IFDEF DELPHI6}
procedure TcxCustomInnerCheckListBox.SetIntegerMappedValue(const AValue: Int64);
{$ELSE}
procedure TcxCustomInnerCheckListBox.SetIntegerMappedValue(const AValue: Integer);
{$ENDIF}
var
  I: Integer;
{$IFDEF DELPHI6}
  FPowerValue: Int64;
{$ELSE}
  FPowerValue: Integer;
{$ENDIF}
  AState: TcxCheckBoxState;
begin
  CheckItems.BeginUpdate;
  try
    ClearCheck;
    for I := 0 to CheckItems.Count - 1 do
    begin
      FPowerValue := Trunc(Power(2, I));
      if FPowerValue > AValue then
        Break
      else
      begin
        if (AValue and FPowerValue) <> 0 then
          AState := cbsChecked
        else
          AState := cbsUnchecked;
        if Assigned(OnCustomMapEditValueToState) then
          OnCustomMapEditValueToState(Container, I, AValue, AState);
        CheckItems[I].FState := AState;
      end;
    end;
  finally
    Invalidate;
    CheckItems.EndUpdate;
  end;
end;

function TcxCustomInnerCheckListBox.GetGlyph: TBitmap;
begin
  if FGlyph = nil then
  begin
    FGlyph := TBitmap.Create;
    FGlyph.OnChange := GlyphChanged;
  end;
  Result := FGlyph;
end;

procedure TcxCustomInnerCheckListBox.GlyphChanged(Sender: TObject);
begin
  LookAndFeelChanged;
end;

procedure TcxCustomInnerCheckListBox.SetGlyph(Value: TBitmap);
begin
  if Value = nil then
    FreeAndNil(FGlyph)
  else
    Glyph.Assign(Value);

  LookAndFeelChanged;
end;

procedure TcxCustomInnerCheckListBox.SetGlyphCount(Value: Integer);
begin
  if FGlyphCount <> Value then
  begin
    FGlyphCount := Value;

    if FGlyph <> nil then
      LookAndFeelChanged;
  end;
end;

procedure TcxCustomInnerCheckListBox.KeyPress(var Key: Char);
begin
  if (Key = ' ') then
    ToggleClickCheck(ItemIndex);
  inherited KeyPress(Key);
end;

procedure TcxCustomInnerCheckListBox.MouseDown(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Index: Integer;
  FClickInCheck: Boolean;
begin
  inherited;
  if Button = mbLeft then
  begin
    Index := ItemAtPos(Point(X,Y),True);
    if (Index <> -1) and CheckItems[Index].Enabled then
    begin
      FClickInCheck := FCheckPaintHelper.IsClickInCheck(ItemRect(Index),
        CheckItems[Index].State, X, Y, UseRightToLeftAlignment);
      if FClickInCheck then
        ToggleClickCheck(Index);
    end;
  end;
end;

procedure TcxCustomInnerCheckListBox.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited;
end;

procedure TcxCustomInnerCheckListBox.ToggleClickCheck;
var
  AOldState, ANewState: TcxCheckBoxState;
begin
  if (Index >= 0) and (Index < CheckItems.Count) and
    CheckItems[Index].Enabled then
  begin
    if not Container.DataBinding.SetEditMode then Exit;
    AOldState := CheckItems[Index].State;
    case AOldState of
      cbsUnchecked:
        if AllowGrayed then
          ANewState := cbsGrayed
        else
          ANewState := cbsChecked;
      cbsGrayed: ANewState := cbsChecked;
      else
        ANewState := cbsUnchecked;
    end;
    CheckItems[Index].State := ANewState;
    ClickCheck;
    DoClickCheckEvent(Index, AOldState, ANewState);
    InvalidateCheck(Index);
  end;
end;

procedure TcxCustomInnerCheckListBox.ClickCheck;
begin
  { Dummy }
end;

procedure TcxCustomInnerCheckListBox.UpdateEditValueFromMapped;
var
  AEditValue: TcxEditValue;
begin
  if Assigned(Container) then
  begin
    AEditValue := GetIntegerMappedValue(MaxInt);
    Container.EditValue := AEditValue;
  end;
end;

procedure TcxCustomInnerCheckListBox.DoClickCheckEvent(const AIndex: Integer;
  const OldState, NewState: TcxCheckBoxState);
begin
  if Assigned(FOnClickCheck) then FOnClickCheck(Self, AIndex, OldState, NewState);
end;

{$IFDEF DELPHI5}
function TcxCustomInnerCheckListBox.InternalGetItemData(Index: Integer): LongInt;
begin
  Result := inherited GetItemData(Index);
end;

procedure TcxCustomInnerCheckListBox.InternalSetItemData(Index: Integer; AData: LongInt);
begin
  inherited SetItemData(Index, AData);
end;
{$ENDIF}
{ TcxCustomInnerCheckListBox }

{ TcxCustomCheckListBox }
constructor TcxCustomCheckListBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FEditValue := 0;
  FInternalUpdate := False;
  FDataBinding := GetDataBindingClass.Create(Self, Self);
  with TcxCustomDataBindingAccess(FDataBinding) do
  begin
    OnDataChange := Self.DataChange;
    OnDataSetChange := Self.DataSetChange;
    OnUpdateData := Self.UpdateData;
  end;
  FInnerCheckListBox := TcxCustomInnerCheckListBox.Create(Self);
  FInnerCheckListBox.AutoSize := False;
  FInnerCheckListBox.BorderStyle := bsNone;
  FInnerCheckListBox.Parent := Self;
  FInnerCheckListBox.FContainer := Self;
  FInnerCheckListBox.TabStop := False;
  FInnerCheckListBox.LookAndFeel.MasterLookAndFeel := Style.LookAndFeel;
  FInnerCheckListBox.OnDrawItem := DrawItem;
  FInnerCheckListBox.OnMeasureItem := MeasureItem;

  InnerControl := FInnerCheckListBox;
  DataBinding.VisualControl := FInnerCheckListBox;
  Width := 121;
  Height := 97;

  FIntegralHeight := False;
end;

destructor TcxCustomCheckListBox.Destroy;
begin
  FreeAndNil(FInnerCheckListBox);
  FreeAndNil(FDataBinding);
  inherited Destroy;
end;

class function TcxCustomCheckListBox.GetNotPublishedStyleValues: TcxEditStyleValues;
begin
  Result := [];
end;

procedure TcxCustomCheckListBox.Loaded;
begin
  inherited;
  if not (csDesigning in ComponentState) then
  begin
    FInternalUpdate := True;
    try
      SetEditValue(FEditValue);
    finally
      FInternalUpdate := False;
    end;
  end;
end;

procedure TcxCustomCheckListBox.Clear;
begin
  FInnerCheckListBox.Clear;
end;

function TcxCustomCheckListBox.ItemAtPos(const APos: TPoint; AExisting: Boolean): Integer;
begin
  Result := FInnerCheckListBox.ItemAtPos(APos, AExisting);
end;

function TcxCustomCheckListBox.ItemRect(Index: Integer): TRect;
begin
  Result := FInnerCheckListBox.ItemRect(Index);
end;

{$IFDEF DELPHI6}
procedure TcxCustomCheckListBox.AddItem(AItem: String);
var
  Item: TcxCheckListBoxItem;
begin
  Item := Items.Add;
  Item.Text := AItem;
end;

procedure TcxCustomCheckListBox.CopySelection(ADestination: TcxCustomCheckListBox);
begin
  if ItemIndex <> -1 then
    ADestination.AddItem(Items[ItemIndex].Text);
end;

procedure TcxCustomCheckListBox.DeleteSelected;
begin
  if ItemIndex <> -1 then
    Items.Delete(ItemIndex);
end;

procedure TcxCustomCheckListBox.MoveSelection(ADestination: TcxCustomCheckListBox);
begin
  CopySelection(ADestination);
  DeleteSelected;
end;

{$ENDIF}

function TcxCustomCheckListBox.ExecuteAction(Action: TBasicAction): Boolean;
begin
  Result := inherited ExecuteAction(Action) or
    TcxCustomDataBindingAccess(FDataBinding).ExecuteAction(Action);
end;

function TcxCustomCheckListBox.UpdateAction(Action: TBasicAction): Boolean;
begin
  Result := inherited UpdateAction(Action) or
    TcxCustomDataBindingAccess(FDataBinding).UpdateAction(Action);
end;

procedure TcxCustomCheckListBox.ContainerStyleChanged(Sender: TObject);
begin
  inherited;
  FInnerCheckListBox.Canvas.Font.Assign(Style.Font);
  FullRepaint;
end;

function TcxCustomCheckListBox.GetReadOnly: Boolean;
begin
  Result := TcxCustomDataBindingAccess(DataBinding).ReadOnly;
end;

procedure TcxCustomCheckListBox.SetReadOnly(Value: Boolean);
begin
  TcxCustomDataBindingAccess(DataBinding).ReadOnly := Value;
end;

procedure TcxCustomCheckListBox.AdjustInnerControl;
begin
  if FInnerCheckListBox <> nil then
  begin
    FInnerCheckListBox.Color := Style.Color;
    FInnerCheckListBox.Font.Assign(Font);

    if Enabled then
      FInnerCheckListBox.Font.Color := Font.Color
    else
      FInnerCheckListBox.Font.Color := {$IFDEF VCL}clBtnShadow{$ELSE}clDisabledButtonText{$ENDIF};
  end;
end;

class function TcxCustomCheckListBox.GetStyleClass: TcxContainerStyleClass;
begin
  Result := TcxExtContainerStyle;
end;

function TcxCustomCheckListBox.CanResize(var NewWidth, NewHeight: Integer): Boolean;
begin
  Result := inherited CanResize(NewWidth, NewHeight);
  if not Result or not IntegralHeight or IsLoading then
    Exit;
  if Align in [alLeft, alRight, alClient] then
    Exit;
  GetOptimalHeight(NewHeight);
  if NewHeight<20 then Exit;
end;

procedure TcxCustomCheckListBox.FontChanged;
begin
  inherited FontChanged;
  FInnerCheckListBox.FullRepaint;
  SetSize;
end;

{$IFDEF VCL}
procedure TcxCustomCheckListBox.DrawItem(Control: TWinControl;Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var
  FCheckRect, FTextRect, FDrawEventRect: TRect;
  Enable: Boolean;
  FText: string;
  FDTParams: DrawTextParams;
  FBaseTestFlag: LongWord;

  procedure PrepareColors;
  begin
    if (odSelected in State) then
    begin
      FInnerCheckListBox.Canvas.Font.Color := clHighlightText;
      FInnerCheckListBox.Canvas.Brush.Color := clHighlight;
    end
    else
    begin
      FInnerCheckListBox.Canvas.Brush.Color := Style.Color;
      FInnerCheckListBox.Canvas.Font.Color := Style.Font.Color;
    end;
    if not Enable then
      FInnerCheckListBox.Canvas.Font.Color := clGrayText;
  end;

begin
  with FDTParams do
  begin
    cbSize := SizeOf(DrawTextParams);
    iTabLength := FInnerCheckListBox.TabWidth;
    iLeftMargin := 0;
    iRightMargin := 0;
  end;
  if Index < Items.Count then
  begin
    FCheckRect := Rect;
    FTextRect := Rect;
    Enable := Self.Enabled and Items[Index].Enabled;
    FInnerCheckListBox.Canvas.Font.Assign(Style.Font);
    PrepareColors;
    if not UseRightToLeftAlignment then
    begin
      FCheckRect.Left := Rect.Left - RectHeight(Rect) - 2;
      Inc(FTextRect.Left, 2);
    end
    else
    begin
      FCheckRect.Left := Rect.Right + 4;
      if FTextRect.Left = 0 then
        FTextRect.Left := 2;
    end;
    FInnerCheckListBox.Canvas.FillRect(Rect);
    if (FCheckRect.Left >= 0) and (FCheckRect.Top >= 0) then
      FInnerCheckListBox.DrawCheck(FInnerCheckListBox.Canvas, FCheckRect,
        Items[Index].State, Enable);
    FText := Items[Index].Text;
    SetBkMode(FInnerCheckListBox.Canvas.Handle, TRANSPARENT);
    PrepareColors;
    FBaseTestFlag := DT_NOPREFIX or DT_VCENTER or DT_LEFT;
    if FInnerCheckListBox.TabWidth > 0 then
      FBaseTestFlag := FBaseTestFlag or DT_EXPANDTABS or DT_TABSTOP;
    Windows.DrawTextEx(FInnerCheckListBox.Canvas.Handle, PChar(FText),
      Length(FText), FTextRect, FBaseTestFlag, @FDTParams);
  end;
  FDrawEventRect := Rect;
  if not UseRightToLeftAlignment then
    FDrawEventRect.Left := FDrawEventRect.Left - RectHeight(FDrawEventRect) - 2
  else
    FDrawEventRect.Right := FDrawEventRect.Right + (FInnerCheckListBox.GetCheckWidth * 2) + 8;
  if Assigned(FOnDrawItem) then
    FOnDrawItem(Self, Index, FDrawEventRect, State);
end;

procedure TcxCustomCheckListBox.MeasureItem(Control: TWinControl; Index: Integer;
  var Height: Integer);
begin
  Height := FInnerCheckListBox.Canvas.TextHeight('Wg') + 2;
  if Height < 15 then Height := 15;
  if Assigned(FOnMeasureItem) then
    FOnMeasureItem(Control, Index, Height);
end;
{$ELSE}
function TcxCustomCheckListBox.DrawItem(Index: Integer; Rect: TRect; State: TOwnerDrawState): Boolean;
begin
  Result := inherited DrawItem(Index, Rect, State);
end;

procedure TcxCustomCheckListBox.MeasureItem(Control: TWinControl;
  {$IFDEF LINUX}item: QClxListBoxItemH{$ELSE}Index: Integer{$ENDIF};
   var Height, Width: Integer);
begin
  inherited;
end;
{$ENDIF}

procedure TcxCustomCheckListBox.GetOptimalHeight(var ANewHeight: Integer);

  function GetItemHeight(AIndex: Integer): Integer;
  begin
    Result := FInnerCheckListBox.FStandardItemHeight;
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

function TcxCustomCheckListBox.IsInternalControl(AControl: TControl): Boolean;
begin
  Result := (AControl = FInnerCheckListBox.HScrollBar) or (AControl = FInnerCheckListBox.VScrollBar) or
    inherited IsInternalControl(AControl);
end;

function TcxCustomCheckListBox.RefreshContainer(const P: TPoint; Button: TcxMouseButton;
  Shift: TShiftState; AIsMouseEvent: Boolean): Boolean;
begin
  Result := inherited RefreshContainer(P, Button, Shift, AIsMouseEvent);
end;

class function TcxCustomCheckListBox.GetDataBindingClass: TcxCustomDataBindingClass;
begin
  Result := TcxCustomDataBinding;
end;

procedure TcxCustomCheckListBox.DataChange;
begin
  if DataBinding.IsDataSourceLive then
    EditValue := TranslateEditValue(DataBinding.GetStoredValue(evsValue, Focused))
  else
    FInnerCheckListBox.ClearCheck;
end;

procedure TcxCustomCheckListBox.UpdateData;
begin
  DataBinding.SetStoredValue(evsValue, EditValue);
end;

function TcxCustomCheckListBox.GetDataBinding: TcxCustomDataBinding;
begin
  Result := FDataBinding;
end;

procedure TcxCustomCheckListBox.SetDataBinding(Value: TcxCustomDataBinding);
begin
  FDataBinding := Value;
end;

procedure TcxCustomCheckListBox.FullRepaint;
begin
  FInnerCheckListBox.FullRepaint;
end;

procedure TcxCustomCheckListBox.SetSize;
{$IFDEF WIN32}
  procedure KillMouseMoveMessages;
  var
    AMsg: TMsg;
  begin
    while PeekMessage(AMsg, FInnerCheckListBox.Handle,
          WM_MOUSEMOVE, WM_MOUSEMOVE, PM_REMOVE) do ;
  end;
{$ELSE}
TODO
{$ENDIF}

var
  ANewHeight: Integer;
begin
  if IsLoading then
    Exit;
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
    if FInnerCheckListBox.HandleAllocated then
      KillMouseMoveMessages;
  end;
end;

{$IFDEF VCL}
procedure TcxCustomCheckListBox.CMParentColorChanged(var Message: TMessage);
begin
  inherited;
  FInnerCheckListBox.ParentColor := ParentColor;
  Fullrepaint;
end;

procedure TcxCustomCheckListBox.WndProc(var Message: TMessage);
begin
  if FInnerCheckListBox <> nil then
    case Message.Msg of
      LB_ADDSTRING .. LB_MSGMAX:
        begin
          with TMessage(Message) do
            Result := SendMessage(FInnerCheckListBox.Handle, Msg, WParam, LParam);
          Exit;
        end;
    end;
  inherited WndProc(Message);
end;
{$ELSE}
procedure TcxCustomCheckListBox.ChangeBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  if CanResize(AWidth, AHeight) then
    inherited ChangeBounds(ALeft, ATop, AWidth, AHeight);
end;
{$ENDIF}

function TcxCustomCheckListBox.GetOnClickCheck : TcxClickCheckEvent;
begin
  Result := FInnerCheckListBox.FOnClickCheck;
end;

function TcxCustomCheckListBox.GetAllowGrayed : Boolean;
begin
  Result := FInnerCheckListBox.FAllowGrayed;
end;

function TcxCustomCheckListBox.GetAllowDblClickToggle: Boolean;
begin
  Result := FInnerCheckListBox.AllowDblClickToggle;
end;

function TcxCustomCheckListBox.GetGlyph: TBitmap;
begin
  Result := FInnerCheckListBox.Glyph;
end;

function TcxCustomCheckListBox.GetGlyphCount: Integer;
begin
  Result := FInnerCheckListBox.GlyphCount;
end;

function TcxCustomCheckListBox.GetItems: TcxCheckListBoxItems;
begin
  Result := FInnerCheckListBox.CheckItems;
end;

function TcxCustomCheckListBox.GetColumns: Integer;
begin
  Result := FInnerCheckListBox.Columns;
end;

function TcxCustomCheckListBox.GetCount: Integer;
begin
  Result := FInnerCheckListBox.Items.Count;
end;

function TcxCustomCheckListBox.GetItemIndex: Integer;
begin
  Result := FInnerCheckListBox.ItemIndex;
end;

function TcxCustomCheckListBox.GetScrollWidth: Integer;
begin
  Result := FInnerCheckListBox.ScrollWidth;
end;

function TcxCustomCheckListBox.GetSelected(Index: Integer): Boolean;
begin
  Result := FInnerCheckListBox.Selected[Index];
end;

function TcxCustomCheckListBox.GetSorted: Boolean;
begin
  Result := FInnerCheckListBox.Sorted;
end;

function TcxCustomCheckListBox.GetTabWidth: Integer;
begin
  Result := FInnerCheckListBox.TabWidth;
end;

function TcxCustomCheckListBox.GetTopIndex: Integer;
begin
  Result := FInnerCheckListBox.TopIndex;
end;

function TcxCustomCheckListBox.GetOnCustomMapStateToEditValue: TcxCustomMapStateToEditValueEvent;
begin
  Result := FInnerCheckListBox.OnCustomMapStateToEditValue;
end;

function TcxCustomCheckListBox.GetOnCustomMapEditValueToState: TcxCustomMapEditValueToStateEvent;
begin
  Result := FInnerCheckListBox.OnCustomMapEditValueToState;
end;

function TcxCustomCheckListBox.GetOnEditValueChanged: TNotifyEvent;
begin
  Result := FInnerCheckListBox.OnEditValueChanged;
end;

procedure TcxCustomCheckListBox.SetOnClickCheck(Value: TcxClickCheckEvent);
begin
  FInnerCheckListBox.FOnClickCheck := Value;
end;

procedure TcxCustomCheckListBox.SetAllowGrayed(Value: Boolean);
begin
  FInnerCheckListBox.FAllowGrayed := Value;
end;

procedure TcxCustomCheckListBox.SetAllowDblClickToggle(Value: Boolean);
begin
  FInnerCheckListBox.AllowDblClickToggle := Value;
end;

procedure TcxCustomCheckListBox.SetGlyph(Value: TBitmap);
begin
  FInnerCheckListBox.SetGlyph(Value);
end;

procedure TcxCustomCheckListBox.SetGlyphCount(Value: Integer);
begin
  FInnerCheckListBox.SetGlyphCount(Value);
end;

procedure TcxCustomCheckListBox.SetItems(Value: TcxCheckListBoxItems);
begin
  FInnerCheckListBox.CheckItems.Assign(Value);
  DataChange;
end;

procedure TcxCustomCheckListBox.SetColumns(Value: Integer);
begin
  FInnerCheckListBox.Columns := Value;
{$IFDEF DELPHI5}
  //FInnerCheckListBox.SetExternalScrollBarsParameters; {<- Release 4.2.1}
{$ENDIF}  
end;

procedure TcxCustomCheckListBox.SetIntegralHeight(Value: Boolean);
begin
  if Value <> FIntegralHeight then
  begin
    FIntegralHeight := Value;
    SetSize;
  end;
end;

procedure TcxCustomCheckListBox.SetItemIndex(Value: Integer);
begin
  FInnerCheckListBox.ItemIndex := Value;
end;

procedure TcxCustomCheckListBox.SetScrollWidth(Value: Integer);
begin
  FInnerCheckListBox.ScrollWidth := Value;
end;

procedure TcxCustomCheckListBox.SetSelected(Index: Integer; Value: Boolean);
begin
  FInnerCheckListBox.Selected[Index] := Value;
end;

procedure TcxCustomCheckListBox.SetSorted(Value: Boolean);
var
  I, K: Integer;
  TempStrings: TStringList;
begin
  FInnerCheckListBox.Sorted := Value;

  Items.BeginUpdate;
  try
    TempStrings := TStringList.Create;
    try
      TempStrings.AddStrings(FInnerCheckListBox.Items);

      for I := 0 to Pred(TempStrings.Count) do
        for K := 0 to Pred(Items.Count) do
          if SameText(Items[K].Text, TempStrings[I]) then
            Items[K].Index := I;

    finally
      TempStrings.Free;
    end;
  finally
    Items.EndUpdate;
  end;
end;

procedure TcxCustomCheckListBox.SetTabWidth(Value: Integer);
begin
  FInnerCheckListBox.TabWidth := Value;
end;

procedure TcxCustomCheckListBox.SetTopIndex(Value: Integer);
begin
  FInnerCheckListBox.TopIndex := Value;
end;

procedure TcxCustomCheckListBox.SetOnCustomMapStateToEditValue(Value: TcxCustomMapStateToEditValueEvent);
begin
  FInnerCheckListBox.OnCustomMapStateToEditValue := Value;
end;

procedure TcxCustomCheckListBox.SetOnCustomMapEditValueToState(Value: TcxCustomMapEditValueToStateEvent);
begin
  FInnerCheckListBox.OnCustomMapEditValueToState := Value;
end;

procedure TcxCustomCheckListBox.SetOnEditValueChanged(Value: TNotifyEvent);
begin
  FInnerCheckListBox.OnEditValueChanged := Value;
end;

{$IFDEF DELPHI6}
function TcxCustomCheckListBox.GetAutoComplete: Boolean;
begin
  Result := FInnerCheckListBox.AutoComplete;
end;

procedure TcxCustomCheckListBox.SetAutoComplete(Value: Boolean);
begin
  FInnerCheckListBox.AutoComplete := Value;
end;

procedure TcxCustomCheckListBox.SetCount(Value: Integer);
begin
  FInnerCheckListBox.Count := Value;
end;
{$ENDIF}

function TcxCustomCheckListBox.IsValueStored: Boolean;
begin
  Result := True;
end;

{$IFDEF DELPHI6}
function TcxCustomCheckListBox.GetIntegerMappedValue(const AMaxValue: Int64): Int64;
{$ELSE}
function TcxCustomCheckListBox.GetIntegerMappedValue(const AMaxValue: Integer): Integer;
{$ENDIF}
begin
  Result := FInnerCheckListBox.GetIntegerMappedValue(AMaxValue);
end;

function TcxCustomCheckListBox.GetMaxMappedLength: Integer;
begin
  Result := FInnerCheckListBox.Items.Count;
end;

function TcxCustomCheckListBox.GetEditValue: TcxEditValue;
begin
  if Assigned(OnCustomMapStateToEditValue) then
    FInnerCheckListBox.OnCustomMapStateToEditValue(Self, FEditValue);

  Result := FEditValue;
end;

function TcxCustomCheckListBox.IsEditValueValid(const AEditValue: TcxEditValue;
  AllowEmpty: Boolean): Boolean;
begin
  Result := False;
  if (IsVarEmpty(AEditValue) and AllowEmpty) or VarIsInteger(AEditValue) or
    VarIsDouble(AEditValue) then
    Result := True
  else
    if VarIsStr(AEditValue) then
      Result := IsValidStringForInt(VarToStr(AEditValue)) or
        IsValidStringForDouble(VarToStr(AEditValue));
end;

procedure TcxCustomCheckListBox.SetEditValue(const Value: TcxEditValue);
begin
  FEditValue := NormalizeEditValue(Value);

  if not FInnerCheckListBox.AllowGrayed then
  begin
    FInnerCheckListBox.SetIntegerMappedValue(TranslateEditValue(FEditValue));

    if Assigned(FInnerCheckListBox.OnEditValueChanged) then
      FInnerCheckListBox.OnEditValueChanged(Self);
  end;

  Invalidate;
end;

function TcxCustomCheckListBox.NormalizeEditValue
  (const AEditValue: TcxEditValue): TcxEditValue;
begin
  if IsEditValueValid(FEditValue, True) then
    Result := AEditValue
  else
    Result := VarAsType(0, varInteger);
end;

function TcxCustomCheckListBox.TranslateEditValue
  (const AEditValue: TcxEditValue): TcxEditValue;
var
  AValidatedEditValue: TcxEditValue;
begin
  Result := 0;
  if not IsVarEmpty(AEditValue) then
  begin
    AValidatedEditValue := AEditValue;
    if IsEditValueValid(AValidatedEditValue, True) then
    begin
      if VarIsInteger(AEditValue) then
        Result := VarAsType(AEditValue, varInteger)
      else
        if VarIsDouble(AEditValue) then
          Result := VarAsType(AEditValue, varDouble)
        else
          if VarIsStr(AEditValue) then
            if IsValidStringForInt(VarToStr(AEditValue)) or
              IsValidStringForDouble(VarToStr(AEditValue)) then
              Result := VarAsType(AEditValue, varString);
    end;
  end;
end;
{ TcxCustomCheckListBox }

end.
