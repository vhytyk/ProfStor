
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

unit cxCheckComboBox;

interface

{$I cxExtEdVer.inc}

uses
  Windows, Messages, SysUtils, Classes, Controls, Graphics, cxControls, StdCtrls,
  Forms,
{$IFDEF DELPHI6}
  Variants,
{$ENDIF}
  cxContainer, cxGraphics, cxClasses, cxEdit, cxEditUtils, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxImageComboBox, cxVariants, cxExtEditUtils, Math,
  cxCheckBox, cxLookAndFeels, cxExtEditConsts, cxDataUtils;

type
  TcxCheckPaintHelper = class(TcxCustomCheckPaintHelper);
  { TcxCheckComboBoxItem }
  TcxCheckComboBoxItem = class(TCollectionItem)
  private
    FDescription: TCaption;
    FState: TcxCheckBoxState;
    FEnabled: Boolean;
    procedure SetDescription(const Value: TCaption);
    procedure SetEnabled(Value: Boolean);
  public
    constructor Create(Collection: TCollection); override;
    procedure Assign(Source: TPersistent); override;
  published
    property Description: TCaption read FDescription write SetDescription;
    property Enabled: Boolean read FEnabled write SetEnabled default True;
  end;

  { TcxCheckComboBoxItems }
  TcxCheckComboBoxItems = class(TOwnedCollection)
  private
    function GetItems(Index: Integer): TcxCheckComboBoxItem;
    procedure SetItems(Index: Integer; const Value: TcxCheckComboBoxItem);
  protected
    procedure Update(Item: TCollectionItem); override;
  public
  {$IFNDEF DELPHI6}
    function Owner: TPersistent;
  {$ENDIF}
    property Items[Index: Integer]: TcxCheckComboBoxItem read GetItems write SetItems; default;
    function GetStateByIndex(AIndex: Integer; ADefaultState: TcxCheckBoxState): TcxCheckBoxState;
    function Add : TcxCheckComboBoxItem;
    function AddCheckItem(const ADescription: string): TcxCheckComboBoxItem;
  end;

  { TcxCustomCheckComboBoxViewInfo }
  TcxCustomCheckComboBoxViewInfo = class(TcxCustomTextEditViewInfo)
  public
    procedure Paint(ACanvas: TcxCanvas); override;
  end;

  { TcxCustomCheckComboBoxViewData }
  TcxCustomCheckComboBoxViewData = class(TcxCustomDropDownEditViewData)
  public
    function IsComboBoxStyle: Boolean; override;
    procedure Calculate(ACanvas: TcxCanvas; const ABounds: TRect;
      const P: TPoint; Button: TcxMouseButton; Shift: TShiftState;
      AViewInfo: TcxCustomEditViewInfo; AIsMouseEvent: Boolean); override;
    procedure DisplayValueToDrawValue(const ADisplayValue: TcxEditValue;
      AViewInfo: TcxCustomEditViewInfo); override;
    procedure EditValueToDrawValue(ACanvas: TcxCanvas; const AEditValue: TcxEditValue;
      AViewInfo: TcxCustomEditViewInfo); override;
    function GetEditContentSize(ACanvas: TcxCanvas;
      const AEditValue: TcxEditValue;
      const AEditSizeProperties: TcxEditSizeProperties): TSize; override;
  end;

  { TcxCheckComboBoxListBox }
  TcxCustomCheckComboBox = class;
  TcxCustomCheckComboBoxProperties = class;
  TcxCustomCheckComboBoxListBox = class(TcxCustomEditListBox)
  private
    FInternalUpdate: Boolean;
    function GetEdit: TcxCustomCheckComboBox;
  protected
    FEdit: TcxCustomCheckComboBox;
    function DoDrawItem(AIndex: Integer; const ARect: TRect; AState: TOwnerDrawState): Boolean; override;
    function GetHeight(ARowCount: Integer; AMaxHeight: Integer): Integer; override;
    function GetItem(Index: Integer): TCaption; override;
    function GetItemHeight(AIndex: Integer = -1): Integer; override;
    procedure Resize; override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure UpdateItemState(const AIndex: Integer); virtual;
    procedure SetItemIndex(const Value: Integer); override;
{$IFDEF VCL}
    procedure DrawItem(Index: Integer; Rect: TRect; State: TOwnerDrawState); override;
    procedure MeasureItem(Index: Integer; var Height: Integer); override;
{$ELSE}
    procedure MeasureItem(Control: TWinControl;
      {$IFDEF LINUX}item: QClxListBoxItemH{$ELSE}Index: Integer{$ENDIF};
      var Height, Width: Integer); override;
{$ENDIF}
    property Edit: TcxCustomCheckComboBox read GetEdit;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

  { TcxCheckComboBoxLookupData }
  TcxCheckComboBoxLookupData = class(TcxComboBoxLookupData)
  protected
    function GetListBoxClass: TcxCustomEditListBoxClass; override;
    function GetItem(Index: Integer): TCaption; override;
    function GetItemCount: Integer; override;
  public
    function CanResizeVisualArea(var NewSize: TSize): Boolean; override;
    function GetVisualAreaPreferredSize(AMaxHeight: Integer; AWidth: Integer = 0): TSize; override;
    procedure Initialize(AVisualControlsParent: TWinControl); override;
  end;

  { TcxCheckComboPropertiesValues }
  TcxCheckComboPropertiesValues = class(TcxTextEditPropertiesValues)
  public
    ValueType: Boolean;
    procedure Assign(Source: TPersistent); override;
    procedure Reset; override;
  end;

  TcxCheckComboValueType = (vtInt, vtFloat);

  { TcxCustomCheckComboBoxProperties }
  TcxCustomCheckComboBoxProperties = class(TcxCustomComboBoxProperties)
  private
    FDelimiter: string;
    FEmptySelectionText: string;
    FShowEmptyText: Boolean;
    FItems : TcxCheckComboBoxItems;
    FCheckPaintHelper : TcxCheckPaintHelper;
    FValueType: TcxCheckComboValueType;
    FGlyph: TBitmap;
    FGlyphCount: Integer;

    function GetGlyph: TBitmap;
    procedure GlyphChanged(Sender: TObject);
    procedure SetGlyph(Value: TBitmap);
    procedure SetGlyphCount(Value: Integer);

    function GetAssignedValues: TcxCheckComboPropertiesValues;
    function GetValueType: TcxCheckComboValueType;
    function IsValueTypeStored: Boolean;
    procedure SetValueType(Value: TcxCheckComboValueType);
    procedure SetDelimiter(Value: string);
    procedure SetEmptySelectionText(Value: string);
    procedure SetShowEmptyText(Value: Boolean);
    procedure SetItems(const Value: TcxCheckComboBoxItems);
    procedure SetupViewInfoByItem(const AEditValue: TcxEditValue;
      AViewInfo: TcxCustomCheckComboBoxViewInfo);
  protected
    class function GetAssignedValuesClass: TcxCustomEditPropertiesValuesClass; override;
    class function GetPopupWindowClass: TcxCustomEditPopupWindowClass; override;
    class function GetViewDataClass: TcxCustomEditViewDataClass; override;
    function CalculateItemState(const AIndex: Integer;
      const AEditValue: TcxEditValue): TcxCheckBoxState; virtual;
    function UpdateCheckEditValue(const AIndex: Integer;
      const AEditValue: TcxEditValue): TcxEditValue; virtual;
    property AssignedValues: TcxCheckComboPropertiesValues read GetAssignedValues;
    property Glyph: TBitmap read GetGlyph write SetGlyph;
    property GlyphCount: Integer read FGlyphCount write SetGlyphCount default 6;
    property ValueType: TcxCheckComboValueType read GetValueType write SetValueType stored IsValueTypeStored;
    property Delimiter: string read FDelimiter write SetDelimiter;
    property EmptySelectionText : string read FEmptySelectionText write SetEmptySelectionText;
    property ShowEmptyText: Boolean read FShowEmptyText write SetShowEmptyText default True;
    property Items : TcxCheckComboBoxItems read FItems write SetItems;
    procedure ClearCheck; virtual;
{$IFDEF DELPHI6}
    function TranslateEditValue(const AEditValue: TcxEditValue): Int64;
{$ELSE}
    function TranslateEditValue(const AEditValue: TcxEditValue): Integer;
{$ENDIF}
    function CalculateDisplayValue(const AEditValue: TcxEditValue): string; virtual;
  public
    constructor Create(AOwner: TPersistent); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    class function GetContainerClass: TcxContainerClass; override;
    function GetEditValueSource(AEditFocused: Boolean): TcxDataEditValueSource; override;
    class function GetLookupDataClass: TcxInterfacedPersistentClass; override;
    class function GetViewInfoClass: TcxContainerViewInfoClass; override;
    procedure PrepareDisplayValue(const AEditValue: TcxEditValue;
      var DisplayValue: TcxEditValue; AEditFocused: Boolean); override;
    function IsEditValueValid(var EditValue: TcxEditValue; AEditFocused: Boolean): Boolean; override;
  end;

  { TcxCheckComboBoxProperties }
  TcxCheckComboBoxProperties = class(TcxCustomCheckComboBoxProperties)
  published
    property AssignedValues;
    property ValueType;
    property Delimiter;
    property EmptySelectionText;
    property ShowEmptyText;
    property Alignment;
    property BeepOnError;
    property ButtonGlyph;
    property CharCase;
    property DropDownAutoWidth;
    property DropDownRows;
    property DropDownSizeable;
    property DropDownWidth;
    property Glyph;
    property GlyphCount;
    property ImmediateDropDown;
    property ImmediatePost;
    property Items;
    property PopupAlignment;
    property ReadOnly;
    property ValidateOnEnter;
    property OnChange;
    property OnCloseUp;
    property OnEditValueChanged;
    property OnInitPopup;
    property OnPopup;
  end;

  { TcxCustomCheckComboBoxInnerEdit }
  TcxCustomCheckComboBoxInnerEdit = class(TcxCustomComboBoxInnerEdit);

  { TcxCheckComboBoxPopupWindow }
  TcxCheckComboBoxPopupWindow = class(TcxComboBoxPopupWindow)
  public
    property ViewInfo;
    property SysPanelStyle;
  end;

  TcxCheckComboClickCheckEvent = procedure(Sender: TObject; ItemIndex: Integer;
    var AllowToggle: Boolean) of object;

  { TcxCustomCheckComboBox }
  TcxCustomCheckComboBox = class(TcxCustomComboBox)
  private
    FInternalUpdate: Boolean;
    FOnClickCheck: TcxCheckComboClickCheckEvent;
    function GetItemIndex: Integer;
    function GetLookupData: TcxCheckComboBoxLookupData;
    function GetProperties: TcxCheckComboBoxProperties;
    procedure SetItemIndex(Value: Integer);
    procedure SetProperties(Value: TcxCheckComboBoxProperties);
    function IsValueStored: Boolean;
  protected
    function GetValue: Variant; virtual;
    procedure SetValue(const AValue: Variant); virtual;
    function ClickCheck(const AItemIndex: Integer): Boolean; virtual;
    procedure ContainerStyleChanged(Sender: TObject); override;
    function GetInnerEditClass: TControlClass; override;
    procedure InitializePopupWindow; override;
    procedure InternalValidateDisplayValue(const ADisplayValue: TcxEditValue); override;
    procedure KeyPress(var Key: Char); override;
{$IFNDEF VCL}
    function EventFilter(Sender: QObjectH; Event: QEventH): Boolean; override;
{$ENDIF}
    procedure DataChange; override;
    procedure UpdateData; override;
    property ItemIndex: Integer read GetItemIndex write SetItemIndex;
    property LookupData: TcxCheckComboBoxLookupData read GetLookupData;
    property Properties: TcxCheckComboBoxProperties read GetProperties write SetProperties;
    function LookupKeyToEditValue(const AKey: TcxEditValue): TcxEditValue; override;
    property Value: Variant read GetValue write SetValue stored IsValueStored;
    procedure CloseUp(AAccept: Boolean); override;
    property OnClickCheck: TcxCheckComboClickCheckEvent read FOnClickCheck write FOnClickCheck;
    procedure InternalSetEditValue(const Value: TcxEditValue; AValidateEditValue: Boolean); override;
    procedure SynchronizeDisplayValue; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    class function GetPropertiesClass: TcxCustomEditPropertiesClass; override;
    procedure PrepareEditValue(const ADisplayValue: TcxEditValue;
      out EditValue: TcxEditValue; AEditFocused: Boolean); override;
   function GetItemState(const AIndex: Integer): TcxCheckBoxState;
    procedure SetItemState(const AIndex: Integer; AState: TcxCheckBoxState);
  end;

  { TcxCheckComboBox }
  TcxCheckComboBox = class(TcxCustomCheckComboBox)
  public
    property ItemIndex;
    property Text;
  published
    property Anchors;
    property AutoSize;
    property BeepOnEnter;
    property Constraints;
    {$IFDEF VCL}
    property DragCursor;
    property DragKind;
    {$ENDIF}
    property DragMode;
    property Value;
    property Enabled;
    {$IFDEF VCL}
    property ImeMode;
    property ImeName;
    {$ENDIF}
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property Properties;
    property ShowHint;
    property Style;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnClick;
    property OnClickCheck;
{$IFDEF DELPHI5}
    property OnContextPopup;
{$ENDIF}
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEditing;
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
{$IFDEF VCL}
    property OnEndDock;
    property OnStartDock;
{$ENDIF}
  end;

implementation

type
  TControlAccess = class(TControl);
  TcxCustomEditListBoxAccess = class(TcxCustomEditListBox);
  TWinControlAccess = class(TWinControl);
  TcxEditDataBindingAccess = class(TcxEditDataBinding);

{ TcxCheckComboBoxItem }
constructor TcxCheckComboBoxItem.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  FDescription := '';
  FState := cbsUnchecked;
  FEnabled := True;
end;

procedure TcxCheckComboBoxItem.Assign(Source: TPersistent);
begin
  if Source is TcxCheckComboBoxItem then
    with TcxCheckComboBoxItem(Source) do begin
      Self.Description := Description;
      Self.Enabled := Enabled;
      Self.FState := FState;
    end
  else
    inherited Assign(Source);
end;

procedure TcxCheckComboBoxItem.SetDescription(const Value: TCaption);
begin
  if FDescription <> Value then
  begin
    FDescription := Value;
    TcxCheckComboBoxItems(Collection).Changed;
  end;
end;

procedure TcxCheckComboBoxItem.SetEnabled(Value: Boolean);
begin
  if FEnabled <> Value then
  begin
    FEnabled := Value;
    TcxCheckComboBoxItems(Collection).Changed;
  end;
end;
{ TcxCheckComboBoxItem }

{ TcxCheckComboBoxItems }
function TcxCheckComboBoxItems.GetItems(Index: Integer): TcxCheckComboBoxItem;
begin
  Result := TcxCheckComboBoxItem(inherited Items[Index]);
end;

procedure TcxCheckComboBoxItems.SetItems(Index: Integer;const Value: TcxCheckComboBoxItem);
begin
  inherited Items[Index] := Value;
end;

procedure TcxCheckComboBoxItems.Update(Item: TCollectionItem);
begin
  if (Owner <> nil) and (Owner is TcxCheckComboBoxProperties) then
    with TcxCheckComboBoxProperties(Owner) do Changed;
end;

{$IFNDEF DELPHI6}
function TcxCheckComboBoxItems.Owner: TPersistent;
begin
  Result := GetOwner;
end;
{$ENDIF}

function TcxCheckComboBoxItems.GetStateByIndex(AIndex: Integer;
  ADefaultState: TcxCheckBoxState): TcxCheckBoxState;
begin
  Result := ADefaultState;
  if (AIndex >= 0) and (AIndex <= (Count-1)) then
    Result := Items[AIndex].FState;
end;

function TcxCheckComboBoxItems.Add : TcxCheckComboBoxItem;
begin
  Result:=TcxCheckComboBoxItem(inherited Add);
end;

function TcxCheckComboBoxItems.AddCheckItem(const ADescription: string): TcxCheckComboBoxItem;
begin
  Result := Add;
  Result.Description := ADescription;
end;
{ TcxCheckComboBoxItems }

{ TcxCustomCheckComboBoxViewInfo }
procedure TcxCustomCheckComboBoxViewInfo.Paint(ACanvas: TcxCanvas);
begin
  inherited Paint(ACanvas);
end;
{ TcxCustomCheckComboBoxViewInfo }

{ TcxCustomCheckComboBoxViewData }
function TcxCustomCheckComboBoxViewData.IsComboBoxStyle: Boolean;
begin
  Result := True;
end;

procedure TcxCustomCheckComboBoxViewData.Calculate(ACanvas: TcxCanvas;
  const ABounds: TRect; const P: TPoint; Button: TcxMouseButton;
  Shift: TShiftState; AViewInfo: TcxCustomEditViewInfo; AIsMouseEvent: Boolean);
begin
  if IsRectEmpty(ABounds) then begin
    inherited;
    Exit;
  end;
  inherited Calculate(ACanvas, ABounds, P, Button, Shift, AViewInfo, AIsMouseEvent);
  if (ABounds.Right = MaxInt) or (ABounds.Bottom = MaxInt) then Exit;
end;

procedure TcxCustomCheckComboBoxViewData.EditValueToDrawValue(ACanvas: TcxCanvas;
  const AEditValue: TcxEditValue; AViewInfo: TcxCustomEditViewInfo);
begin
  with TcxCheckComboBoxProperties(Properties) do
    SetupViewInfoByItem(AEditValue, TcxCustomCheckComboBoxViewInfo(AViewInfo));
  PrepareSelection(AViewInfo);
end;

procedure TcxCustomCheckComboBoxViewData.DisplayValueToDrawValue(const ADisplayValue: TcxEditValue;
  AViewInfo: TcxCustomEditViewInfo);
begin
  if (Edit = nil) then Exit;
  with TcxCheckComboBoxProperties(Properties) do
    SetupViewInfoByItem(TcxCheckComboBox(Edit).EditValue, TcxCustomCheckComboBoxViewInfo(AViewInfo));
end;

function TcxCustomCheckComboBoxViewData.GetEditContentSize(ACanvas: TcxCanvas;
  const AEditValue: TcxEditValue;
  const AEditSizeProperties: TcxEditSizeProperties): TSize;
var
  S: string;
begin
  S := TcxCheckComboBoxProperties(Properties).CalculateDisplayValue(AEditValue);
  if S = '' then
    S := TcxCheckComboBoxProperties(Properties).EmptySelectionText;
  Result := inherited GetEditContentSize(ACanvas, S, AEditSizeProperties);
  Inc(Result.cx, 2);
end;
{ TcxCustomCheckComboBoxViewData }

{ TcxCustomCheckComboBoxListBox }
constructor TcxCustomCheckComboBoxListBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FInternalUpdate := False;
  BorderStyle := bsNone;
  Style := lbOwnerDrawVariable;
end;

destructor TcxCustomCheckComboBoxListBox.Destroy;
begin
  inherited Destroy;
end;

function TcxCustomCheckComboBoxListBox.DoDrawItem(AIndex: Integer; const ARect: TRect;
  AState: TOwnerDrawState): Boolean;
{$IFNDEF VCL}
var
  R: TRect;
{$ENDIF}
begin
  with Edit.Properties do
  begin
    Result := Assigned(OnDrawItem);
    if Result then
{$IFDEF VCL}
      OnDrawItem(Edit, Canvas, AIndex, ARect, AState);
{$ELSE}
    begin
      if odSelected in State then
      begin
        R := ARect;
        R.Right := Width;
        Canvas.Brush.Color := clHighlight;
        Canvas.FillRect(R);
  {$IFDEF LINUX}
        Canvas.DrawFocusRect(R);
  {$ENDIF}
      end;
      OnDrawItem(Edit, Canvas, AIndex, R, AState);
    end;
{$ENDIF}
  end;
end;

function TcxCustomCheckComboBoxListBox.GetHeight(ARowCount: Integer; AMaxHeight: Integer): Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to ARowCount - 1 do
    Inc(Result, GetItemHeight(I));
end;

function TcxCustomCheckComboBoxListBox.GetItem(Index: Integer): TCaption;
begin
  Result := Edit.LookupData.GetItem(Index);
end;

function TcxCustomCheckComboBoxListBox.GetItemHeight(AIndex: Integer = -1): Integer;
begin
  Result := inherited GetItemHeight;
  if Result < 16 then Result := 16;
  if (AIndex >= 0) and Assigned(OnMeasureItem) then
    Edit.Properties.OnMeasureItem(TcxCustomCheckComboBox(Edit),
      AIndex, Canvas, Result);
end;

procedure TcxCustomCheckComboBoxListBox.Resize;
begin
  inherited Resize;
end;

procedure TcxCustomCheckComboBoxListBox.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  if Edit.PopupMouseMoveLocked then
  begin
    Edit.PopupMouseMoveLocked := False;
    Exit;
  end;
  inherited MouseMove(Shift, X, Y);
end;

procedure TcxCustomCheckComboBoxListBox.KeyDown(var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = []) and Assigned(Edit) then
    Edit.LookupData.InternalSetCurrentKey(ItemIndex)
  else
    inherited KeyDown(Key, Shift);
end;

procedure TcxCustomCheckComboBoxListBox.KeyPress(var Key: Char);
begin
  if (ItemIndex <> -1) and Assigned(Edit) then
  begin
    if (Key = Char(VK_SPACE)) then
    begin
      if not (Edit.Properties.Items[ItemIndex].Enabled) then Exit;
      FInternalUpdate := True;
      UpdateItemState(ItemIndex);
      FInternalUpdate := False;
      Key := #0;
    end;
  end
  else
    inherited KeyPress(Key);
end;

procedure TcxCustomCheckComboBoxListBox.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  AItemIndex: Integer;
  FItemRect : TRect;
  FState : TcxCheckBoxState;
begin
  inherited MouseUp(Button, Shift, X, Y);
  if (Button <> mbLeft) then Exit;
  AItemIndex := ItemAtPos(Point(X, Y), True);
  if (AItemIndex <> -1) and not (Edit.Properties.Items[ItemIndex].Enabled) then Exit;
  if AItemIndex <> -1 then
  begin
    SetCaptureControl(nil);
    FItemRect := ItemRect(AItemIndex);
    FState := Edit.Properties.Items[AItemIndex].FState;
    Edit.LookupData.InternalSetCurrentKey(AItemIndex);
    if Edit.Properties.FCheckPaintHelper.IsClickInCheck(FItemRect, FState, X, Y) then
      UpdateItemState(AItemIndex)
    else
      Edit.CloseUp(True);
  end;
end;

procedure TcxCustomCheckComboBoxListBox.UpdateItemState(const AIndex: Integer);
var
  FCurrentState: TcxCheckBoxState;
begin
  if Edit.DoEditing and Edit.ClickCheck(AIndex) then
  begin
    with Edit.Properties do
    begin
      FCurrentState := CalculateItemState(AIndex, Edit.FEditValue);
      Items[AIndex].FState := FCheckPaintHelper.GetNextState(FCurrentState, False);
      Edit.EditValue := UpdateCheckEditValue(AIndex, Edit.FEditValue);
      Edit.SynchronizeDisplayValue;
      Edit.ModifiedAfterEnter := True;
    end;
    if Edit.Properties.ImmediatePost and Edit.AutoPostEditValue then
      Edit.PostEditValue;
    Invalidate;
  end;
end;

procedure TcxCustomCheckComboBoxListBox.SetItemIndex(const Value: Integer);
begin
  if not FInternalUpdate then
    inherited SetItemIndex(Value);
end;

{$IFDEF VCL}
procedure TcxCustomCheckComboBoxListBox.DrawItem(Index: Integer; Rect: TRect;
  State: TOwnerDrawState);
var
  FTextRect : TRect;
  AFlags: Longint;
  AText: string;
begin
  if DoDrawItem(Index, Rect, State) then Exit;
  with Edit.Properties do
  begin
    FCheckPaintHelper.Glyph := Glyph;
    FCheckPaintHelper.GlyphCount := GlyphCount;
    FTextRect := FCheckPaintHelper.CalcTextRect(Rect, Items[Index].FState);
    Canvas.FillRect(Rect);
    AText := GetItem(Index);
    AFlags := DrawTextBiDiModeFlags(DT_SINGLELINE or DT_LEFT or DT_NOPREFIX);
    Windows.DrawText(Canvas.Handle, PChar(AText),
      Length(AText), FTextRect, AFlags);
    if Rect.Top >= 0 then
    begin
      try
        if Index = 63 then
        begin
          AText := GetItem(Index);
        end;
      FCheckPaintHelper.DrawCheck(Canvas, Rect,
        CalculateItemState(Index, Edit.FEditValue),
        Edit.Properties.Items[Index].Enabled);
      except
        on E: Exception do
        begin
          if odSelected in State then
            Windows.DrawFocusRect(Handle, Rect);
        end;
      end;
    end;
  end;
  if odSelected in State then
    Windows.DrawFocusRect(Handle, Rect);
end;
{$ELSE}
function TcxCustomEditListBox.DrawItem(Index: Integer; Rect: TRect; State: TOwnerDrawState): Boolean;
begin
  Result := inherited DrawItem(Index, Rect, State);
end;
{$ENDIF}

{$IFDEF VCL}
procedure TcxCustomCheckComboBoxListBox.MeasureItem(Index: Integer; var Height: Integer);
{$ELSE}
procedure TcxCustomCheckComboBoxListBox.MeasureItem(Control: TWinControl;
  {$IFDEF LINUX}item: QClxListBoxItemH{$ELSE}Index: Integer{$ENDIF};
  var Height, Width: Integer);
{$ENDIF}
begin
  Height := GetItemHeight(Index);
end;

function TcxCustomCheckComboBoxListBox.GetEdit: TcxCustomCheckComboBox;
begin
  Result := TcxCustomCheckComboBox(TcxCustomEditPopupWindow(Owner).OwnerControl);
end;
{ TcxCustomCheckComboBoxListBox }

{ TcxCheckComboBoxLookupData }
function TcxCheckComboBoxLookupData.CanResizeVisualArea(var NewSize: TSize): Boolean;
begin
  Result := inherited CanResizeVisualArea(NewSize);
end;

function TcxCheckComboBoxLookupData.GetVisualAreaPreferredSize(AMaxHeight: Integer; AWidth: Integer = 0): TSize;
begin
  Result := inherited GetVisualAreaPreferredSize(AMaxHeight, AWidth);
end;

procedure TcxCheckComboBoxLookupData.Initialize(AVisualControlsParent: TWinControl);
begin
  inherited Initialize(AVisualControlsParent);
end;

function TcxCheckComboBoxLookupData.GetListBoxClass: TcxCustomEditListBoxClass;
begin
  Result := TcxCustomCheckComboBoxListBox;
end;

function TcxCheckComboBoxLookupData.GetItem(Index: Integer): TCaption;
begin
  with TcxCustomCheckComboBox(Edit).Properties do
    if (Index > -1) and (Index < Items.Count) then
      Result := Items[Index].Description
    else
      Result := ''
end;

function TcxCheckComboBoxLookupData.GetItemCount: Integer;
begin
  Result := TcxCustomCheckComboBox(Edit).Properties.Items.Count;
end;
{ TcxCheckComboBoxLookupData }

{ TcxCheckComboPropertiesValues }
procedure TcxCheckComboPropertiesValues.Assign(Source: TPersistent);
begin
  if Source is TcxCheckComboPropertiesValues then
    with Source as TcxCheckComboPropertiesValues do
      Self.ValueType := ValueType;
  inherited Assign(Source);
end;

procedure TcxCheckComboPropertiesValues.Reset;
begin
  inherited Reset;
  ValueType := False;
end;
{ TcxCheckComboPropertiesValues }

{ TcxCustomCheckComboBoxProperties }
constructor TcxCustomCheckComboBoxProperties.Create(AOwner: TPersistent);
begin
  inherited Create(AOwner);
  DropDownListStyle := lsFixedList;
  FDelimiter := ';';
  FShowEmptyText := True;
  FEmptySelectionText := 'None selected';
  FCheckPaintHelper := TcxCheckPaintHelper.Create(nil);
  FItems := TcxCheckComboBoxItems.Create(Self, TcxCheckComboBoxItem);
  FGlyphCount := 6;
end;

destructor TcxCustomCheckComboBoxProperties.Destroy;
begin
  FreeAndNil(FItems);
  FreeAndNil(FCheckPaintHelper);
  if Assigned(FGlyph) then FreeAndNil(FGlyph);
  inherited;
end;

function TcxCustomCheckComboBoxProperties.GetGlyph: TBitmap;
begin
  if FGlyph = nil then
  begin
    FGlyph := TBitmap.Create;
    FGlyph.OnChange := GlyphChanged;
  end;
  Result := FGlyph;
end;

procedure TcxCustomCheckComboBoxProperties.GlyphChanged(Sender: TObject);
begin
  Changed;
end;

procedure TcxCustomCheckComboBoxProperties.SetGlyph(Value: TBitmap);
begin
  if Value = nil then
    FreeAndNil(FGlyph)
  else
    Glyph.Assign(Value);
  Changed;
end;

procedure TcxCustomCheckComboBoxProperties.SetGlyphCount(Value: Integer);
begin
  if FGlyphCount <> Value then
  begin
    FGlyphCount := Value;
    if FGlyph <> nil then
      Changed;
  end;
end;

procedure TcxCustomCheckComboBoxProperties.Assign(Source: TPersistent);
begin
  if Source is TcxCustomCheckComboBoxProperties then
  begin
    BeginUpdate;
    try
      inherited Assign(Source);
      with TcxCustomCheckComboBoxProperties(Source) do
      begin
        Self.Delimiter := Delimiter;
        Self.ShowEmptyText := ShowEmptyText;
        Self.EmptySelectionText := EmptySelectionText;
        Self.Items.Assign(Items);
      end;
    finally
      EndUpdate;
    end
  end
  else
    inherited Assign(Source);
end;

class function TcxCustomCheckComboBoxProperties.GetContainerClass: TcxContainerClass;
begin
  Result := TcxCustomCheckComboBox;
end;

function TcxCustomCheckComboBoxProperties.GetEditValueSource(AEditFocused: Boolean): TcxDataEditValueSource;
begin
  Result := evsValue;
end;

class function TcxCustomCheckComboBoxProperties.GetLookupDataClass: TcxInterfacedPersistentClass;
begin
  Result := TcxCheckComboBoxLookupData;
end;

class function TcxCustomCheckComboBoxProperties.GetPopupWindowClass: TcxCustomEditPopupWindowClass;
begin
  Result := TcxCheckComboBoxPopupWindow;
end;

class function TcxCustomCheckComboBoxProperties.GetViewDataClass: TcxCustomEditViewDataClass;
begin
  Result := TcxCustomCheckComboBoxViewData;
end;

class function TcxCustomCheckComboBoxProperties.GetViewInfoClass: TcxContainerViewInfoClass;
begin
  Result := TcxCustomCheckComboBoxViewInfo;
end;

function TcxCustomCheckComboBoxProperties.GetAssignedValues: TcxCheckComboPropertiesValues;
begin
  Result := TcxCheckComboPropertiesValues(FAssignedValues);
end;

function TcxCustomCheckComboBoxProperties.GetValueType: TcxCheckComboValueType;
const
  ACheckComboValueTypeMap: array [Boolean] of TcxCheckComboValueType = (vtInt, vtFloat);
begin
  if AssignedValues.ValueType then
    Result := FValueType
  else
    if IDefaultValuesProvider <> nil then
      Result := ACheckComboValueTypeMap[IDefaultValuesProvider.DefaultIsFloatValue]
    else
      Result := vtFloat;
end;

function TcxCustomCheckComboBoxProperties.IsValueTypeStored: Boolean;
begin
  Result := AssignedValues.ValueType;
end;

procedure TcxCustomCheckComboBoxProperties.SetValueType(Value: TcxCheckComboValueType);
begin
  if AssignedValues.ValueType and (Value = FValueType) then
    Exit;
  AssignedValues.ValueType := True;
  FValueType := Value;
  Changed;
end;

class function TcxCustomCheckComboBoxProperties.GetAssignedValuesClass: TcxCustomEditPropertiesValuesClass;
begin
  Result := TcxCheckComboPropertiesValues;
end;

procedure TcxCustomCheckComboBoxProperties.SetDelimiter(Value: string);
begin
  if FDelimiter <> Value then
  begin
    FDelimiter := Value;
    Changed;
  end;
end;

procedure TcxCustomCheckComboBoxProperties.SetEmptySelectionText(Value: string);
begin
  if FEmptySelectionText <> Value then
  begin
    FEmptySelectionText := Value;
    Changed;
  end;
end;

procedure TcxCustomCheckComboBoxProperties.SetShowEmptyText(Value: Boolean);
begin
  if FShowEmptyText <> Value then
  begin
    FShowEmptyText := Value;
    Changed;
  end;
end;

procedure TcxCustomCheckComboBoxProperties.SetItems(const Value: TcxCheckComboBoxItems);
begin
  FItems.Assign(Value);
  Changed;
end;

procedure TcxCustomCheckComboBoxProperties.SetupViewInfoByItem(const AEditValue: TcxEditValue;
  AViewInfo: TcxCustomCheckComboBoxViewInfo);
var
  ADisplayText: string;
begin
  LockUpdate(True);
  try
    ADisplayText := CalculateDisplayValue(AEditValue);
    if (ADisplayText = '') and (ShowEmptyText) then
      ADisplayText := EmptySelectionText;
    AViewInfo.Text := ADisplayText;
  finally
    LockUpdate(False);
  end;
end;

function TcxCustomCheckComboBoxProperties.CalculateDisplayValue(const AEditValue: TcxEditValue): string;
var
  I: Integer;
{$IFDEF DELPHI6}
  AValue: Int64;
  APowerValue: Int64;
{$ELSE}
  AValue: Integer;
  APowerValue: Integer;
{$ENDIF}
begin
  Result := '';
  AValue := TranslateEditValue(AEditValue);
  if AValue > 0 then
  begin
    APowerValue := 0;
    for I := 0 to Items.Count - 1 do
    begin
{$IFDEF DELPHI6}
      if APowerValue + Trunc(Power(2, I)) > High(Int64) then Break;
{$ELSE}
      if APowerValue + Trunc(Power(2, I)) > MaxInt then Break;
{$ENDIF}
      APowerValue := Trunc(Power(2, I));
      if (APowerValue and AValue) <> 0 then
      begin
        if Result <> '' then
          Result := Result + FDelimiter;
        Result := Result + Items[I].Description;
        Dec(AValue, APowerValue);
      end;
      if AValue <= 0 then Break;
    end;
  end;
end;

function TcxCustomCheckComboBoxProperties.CalculateItemState(const AIndex: Integer;
  const AEditValue: TcxEditValue): TcxCheckBoxState;
var
{$IFDEF DELPHI6}
  APowerValue: Int64;
  AValue: Int64;
{$ELSE}
  APowerValue: Integer;
  AValue: Integer;
{$ENDIF}
  APowerMaxValue: Double;
begin
  APowerMaxValue := Power(2, AIndex);
{$IFDEF DELPHI6}
  if APowerMaxValue > High(Int64) then
  begin
    Result := cbsUnchecked;
    Exit;
  end
  else
    APowerValue := Trunc(APowerMaxValue);
{$ELSE}
  if APowerMaxValue > MaxInt then
  begin
    Result := cbsUnchecked;
    Exit;
  end
  else
    APowerValue := Trunc(APowerMaxValue);
{$ENDIF}
  AValue := TranslateEditValue(AEditValue);
  if (APowerValue and AValue) <> 0 then
    Result := cbsChecked
  else
    Result := cbsUnchecked;
end;

{$IFDEF DELPHI6}
function TcxCustomCheckComboBoxProperties.TranslateEditValue
  (const AEditValue: TcxEditValue): Int64;
{$ELSE}
function TcxCustomCheckComboBoxProperties.TranslateEditValue
  (const AEditValue: TcxEditValue): Integer;
{$ENDIF}
var
  AValidatedEditValue: TcxEditValue;
begin
  Result := 0;
  AValidatedEditValue := AEditValue;
  if IsEditValueValid(AValidatedEditValue, False) then
  begin
    if VarIsInteger(AEditValue) then
{$IFDEF DELPHI6}
      Result := VarAsType(AEditValue, varInt64)
{$ELSE}
      Result := VarAsType(AEditValue, varInteger)
{$ENDIF}
    else
      if VarIsDouble(AEditValue) then
        Result := VarAsType(AEditValue, varDouble)
      else
        if VarIsStr(AEditValue) then
          if IsValidStringForInt(VarToStr(AEditValue)) then
            Result := cxStrToInt(VarToStr(AEditValue), False)
          else
            if IsValidStringForDouble(VarToStr(AEditValue)) then
              Result := Trunc(cxStrToFloat(VarToStr(AEditValue), False));
  end;
end;

function TcxCustomCheckComboBoxProperties.IsEditValueValid(var EditValue: TcxEditValue;
  AEditFocused: Boolean): Boolean;
begin
  Result := False;
  if IsVarEmpty(EditValue) or VarIsInteger(EditValue) or
    VarIsDouble(EditValue) then
    Result := True
  else
    if VarIsStr(EditValue) then
      Result := IsValidStringForInt(VarToStr(EditValue)) or
        IsValidStringForDouble(VarToStr(EditValue));
end;

procedure TcxCustomCheckComboBoxProperties.ClearCheck;
var
  I: Integer;
begin
  Items.BeginUpdate;
  try
    for I := 0 to Items.Count - 1 do
      Items[I].FState := cbsUnchecked;
  finally
    Items.EndUpdate;
  end;
end;

function TcxCustomCheckComboBoxProperties.UpdateCheckEditValue(const AIndex: Integer;
  const AEditValue: TcxEditValue): TcxEditValue;
var
  APowerMaxValue: Double;
{$IFDEF DELPHI6}
  APowerValue: Int64;
  AValue: Int64;
{$ELSE}
  APowerValue: Integer;
  AValue: Integer;
{$ENDIF}
begin
  AValue := TranslateEditValue(AEditValue);
  APowerMaxValue := Power(2, AIndex);

{$IFDEF DELPHI6}
  if APowerMaxValue > High(Int64) then
{$ELSE}
  if APowerMaxValue > MaxInt then
{$ENDIF}
  begin
    Result := AValue;
    Exit;
  end;
  APowerValue := Trunc(APowerMaxValue);
  if Items[AIndex].FState = cbsChecked then
  begin
    if (APowerValue and AValue) = 0 then
      Result := AValue or APowerValue;
  end
  else
  begin
    if (APowerValue and AValue) <> 0 then
      Result := AValue and not APowerValue;
  end;
end;

procedure TcxCustomCheckComboBoxProperties.PrepareDisplayValue(
  const AEditValue: TcxEditValue; var DisplayValue: TcxEditValue; AEditFocused: Boolean);
begin
  DisplayValue := CalculateDisplayValue(AEditValue);
end;
{ TcxCustomCheckComboBoxProperties }

{ TcxCustomCheckComboBox }
constructor TcxCustomCheckComboBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FInternalUpdate := False;
  FEditValue := 0;
  ControlStyle := ControlStyle - [csClickEvents];
end;

destructor TcxCustomCheckComboBox.Destroy;
begin
  inherited Destroy;
end;

class function TcxCustomCheckComboBox.GetPropertiesClass: TcxCustomEditPropertiesClass;
begin
  Result := TcxCheckComboBoxProperties;
end;

function TcxCustomCheckComboBox.LookupKeyToEditValue(const AKey: TcxEditValue): TcxEditValue;
begin
  if not VarEqualsExact(AKey, -1) then
    Result := Properties.Items[AKey].FState
  else
    Result := Null;
end;

procedure TcxCustomCheckComboBox.PrepareEditValue(const ADisplayValue: TcxEditValue;
          out EditValue: TcxEditValue; AEditFocused: Boolean);
begin
  if VarEqualsExact(LookupData.CurrentKey, -1) then
    EditValue := Null
  else
    EditValue := Properties.Items[LookupData.CurrentKey].FState;
end;

function TcxCustomCheckComboBox.GetItemState(const AIndex: Integer): TcxCheckBoxState;
begin
  Result := Properties.CalculateItemState(AIndex, FEditValue);
end;

procedure TcxCustomCheckComboBox.SetItemState(const AIndex: Integer; AState: TcxCheckBoxState);
begin
  if AState = cbsGrayed then Exit;
  Properties.Items[AIndex].FState := AState;
  EditValue := Properties.UpdateCheckEditValue(AIndex, FEditValue);
  UpdateData;
end;

function TcxCustomCheckComboBox.ClickCheck(const AItemIndex: Integer): Boolean;
begin
  Result := TcxEditDataBindingAccess(DataBinding).SetEditMode;
  if Result = False then Exit;
  if Assigned(FOnClickCheck) then FOnClickCheck(Self, AItemIndex, Result);
end;

procedure TcxCustomCheckComboBox.ContainerStyleChanged(Sender: TObject);
begin
  Properties.FCheckPaintHelper.Style.Assign(FStyle);
  inherited ContainerStyleChanged(Sender);
end;

function TcxCustomCheckComboBox.GetInnerEditClass: TControlClass;
begin
  Result := TcxCustomCheckComboBoxInnerEdit;
end;

procedure TcxCustomCheckComboBox.InitializePopupWindow;
begin
  inherited InitializePopupWindow;
  (PopupWindow as TcxCheckComboBoxPopupWindow).SysPanelStyle := Properties.PopupSizeable;
end;

procedure TcxCustomCheckComboBox.InternalValidateDisplayValue(const ADisplayValue: TcxEditValue);
begin
end;

procedure TcxCustomCheckComboBox.KeyPress(var Key: Char);
begin
  if (Key = Char(VK_SPACE)) then
    (LookupData.List as TcxCustomCheckComboBoxListBox).KeyPress(Key)
  else
    inherited KeyPress(Key);
end;

procedure TcxCustomCheckComboBox.CloseUp(AAccept: Boolean);
begin
  if HasPopupWindow then
  begin
    PopupWindow.CloseUp(False);
    if not Properties.AlwaysPostEditValue and Properties.ImmediatePost and
        AutoPostEditValue and ValidateEdit(True) then
      PostEditValue;
  end;
end;

{$IFNDEF VCL}
function TcxCustomCheckComboBox.EventFilter(Sender: QObjectH; Event: QEventH): Boolean;
begin
  Result := inherited EventFilter(Sender, Event);
end;
{$ENDIF}

procedure TcxCustomCheckComboBox.DataChange;
begin
  EditValue := DataBinding.StoredValue;
end;

procedure TcxCustomCheckComboBox.UpdateData;
begin
  DataBinding.StoredValue := EditValue;
end;

function TcxCustomCheckComboBox.GetProperties: TcxCheckComboBoxProperties;
begin
  Result := TcxCheckComboBoxProperties(InternalGetProperties);
end;

function TcxCustomCheckComboBox.GetItemIndex: Integer;
begin
  Result := LookupData.CurrentKey;
end;

function TcxCustomCheckComboBox.GetLookupData: TcxCheckComboBoxLookupData;
begin
  Result := TcxCheckComboBoxLookupData(FLookupData);
end;

procedure TcxCustomCheckComboBox.SetItemIndex(Value: Integer);
var
  APrevItemIndex: Integer;
begin
  APrevItemIndex := ItemIndex;
  LookupData.InternalSetCurrentKey(Value);
  if ItemIndex <> APrevItemIndex then EditModified := False;
end;

procedure TcxCustomCheckComboBox.SetProperties(Value: TcxCheckComboBoxProperties);
begin
  FProperties.Assign(Value);
end;

function TcxCustomCheckComboBox.IsValueStored: Boolean;
begin
  Result := not VarEqualsExact(Value, 0);
end;

procedure TcxCustomCheckComboBox.InternalSetEditValue(const Value: TcxEditValue;
  AValidateEditValue: Boolean);
var
  AEditValue: TcxEditValue;
begin
  if IsDestroying or FInternalUpdate then Exit;
  AEditValue := Properties.TranslateEditValue(Value);
  if not Properties.IsEditValueValid(AEditValue, False) then Exit;
  inherited InternalSetEditValue(AEditValue, AValidateEditValue);
end;

function TcxCustomCheckComboBox.GetValue: Variant;
const
  AVarTypeMap: array [TcxCheckComboValueType] of TVarType = (varInteger, varDouble);
begin
  if VarIsNumericEx(EditValue) or VarIsStr(EditValue) then
    Result := VarAsType(EditValue, AVarTypeMap[Properties.ValueType])
  else
    Result := VarAsType(0, AVarTypeMap[Properties.ValueType]);
  TVarData(Result).VType := AVarTypeMap[Properties.ValueType];
end;

procedure TcxCustomCheckComboBox.SetValue(const AValue: Variant);
var
  AEditValue: TcxEditValue;
begin
  AEditValue := AValue;
  if Properties.IsEditValueValid(AEditValue, False) then
    EditValue := AEditValue;
end;

procedure TcxCustomCheckComboBox.SynchronizeDisplayValue;
begin
  inherited;
end;
{ TcxCustomCheckComboBox }

initialization
  GetRegisteredEditProperties.Register(TcxCheckComboBoxProperties, scxSEditRepositoryCheckComboBox);

finalization
  GetRegisteredEditProperties.Unregister(TcxCheckComboBoxProperties);

end.