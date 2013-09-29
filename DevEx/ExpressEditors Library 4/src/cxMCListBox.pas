
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

unit cxMCListBox;

{$I cxExtEdVer.inc}

interface

uses
{$IFDEF WIN32}
  Windows, Messages,
{$ENDIF}
{$IFNDEF VCL}
  Qt, Types,
{$ENDIF}
  Classes, Controls, Forms, Graphics, ImgList, StdCtrls, SysUtils, ExtCtrls, cxClasses,
  cxControls, cxContainer, cxGraphics, cxExtEditConsts, cxEdit, cxDataUtils,
  cxLookAndFeels, cxScrollBar, cxHeader, cxLookAndFeelPainters, cxExtEditUtils;

type
  TcxMCListBox = class;

  { TcxMCInnerHeader }
  TcxMCInnerHeader = class(TcxHeader, IcxContainerInnerControl)
  private
    FContainer: TcxContainer;
    function GetControlContainer: TcxContainer;
    function GetControl: TWinControl;
    function GetContainer: TcxMCListBox;
  protected
    procedure Click; override;
    property Container: TcxMCListBox read GetContainer;
  public
    function ExecuteAction(Action: TBasicAction): Boolean; override;
    function UpdateAction(Action: TBasicAction): Boolean; override;
{$IFDEF DELPHI5}
    function CanFocus: Boolean; override;
{$ENDIF}
  end;

  { TcxMCInnerListBox }
  TcxMCInnerListBox = class(TcxCustomInnerListBox)
  private
    function GetContainer: TcxMCListBox;
    procedure WMPaint(var Message: TWMPaint); message WM_PAINT;
  protected
    property Container: TcxMCListBox read GetContainer;
    procedure Click; override;
    procedure RecalcItemRects; virtual;
    procedure DrawLines; virtual;
    procedure FullRepaint; virtual;
  public
    function ExecuteAction(Action: TBasicAction): Boolean; override;
    function UpdateAction(Action: TBasicAction): Boolean; override;
{$IFDEF DELPHI5}
    function CanFocus: Boolean; override;
{$ENDIF}
  end;

  {TcxMCInnerPanel}
  TcxMCInnerPanel = class(TCustomPanel)
  public
    constructor Create(AOwner: TComponent); override;
  end;

  { TcxMCListBox }
  TcxMCListBox = class(TcxContainer)
  private
    FAlignment: TAlignment;
    FInnerPanel: TcxMCInnerPanel;
    FInnerListBox:  TcxMCInnerListBox;
    FInnerHeader: TcxMCInnerHeader;
    FIsExitProcessing: Boolean;
    FMultiLines: Boolean;
    FShowEndEllipsis: Boolean;
    FDelimiter: Char;
    FShowColumnLines: Boolean;
    FColumnLineColor: TColor;
    FOverflowEmptyColumn: Boolean;
    FInternalPaint: Boolean;
    FSavedIndex: Integer;
    FOverLoadList: TStringList;
    FSavedHScroll: TScrollEvent;
    FInternalFlagCreatedHeader: Boolean;
{$IFDEF VCL}
    FIntegralHeight: Boolean;
{$ENDIF}
    function GetImages: TCustomImageList;
    procedure SetImages(Value: TCustomImageList);
    function GetHeaderSections: TcxHeaderSections;
    procedure SetHeaderSections(Value: TcxHeaderSections);
    procedure SectionEndResizeHandler(HeaderControl: TcxCustomHeader;
      Section: TcxHeaderSection);
    procedure SectionTrackHandler(HeaderControl: TcxCustomHeader;
      Section: TcxHeaderSection; Width: Integer; State: TcxSectionTrackState);
    procedure SetMultiLines(Value: Boolean);
    procedure SetAlignment(Value: TAlignment);
    procedure SetShowEndEllipsis(Value: Boolean);
    procedure SetDelimiter(Value: Char);
    function GetHeaderDragReorder: Boolean;
    procedure SetHeaderDragReorder(Value: Boolean);
    procedure SetShowColumnLines(Value: Boolean);
    procedure SetColumnLineColor(Value: TColor);
    procedure SetOverflowEmptyColumn(Value: Boolean);
    function GetTextPart(const ItemIndex, PartIndex: Integer): string;
    procedure SectionChangeHandler(Sender: TObject);
    procedure SectionSortChangedHandler(Sender: TObject;
      const Section: TcxHeaderSection; const ASortOrder: TcxHeaderSortOrder);
    procedure HScrollHandler(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    procedure SectionEndDragHandler(Sender: TObject);
{$IFDEF VCL}
    procedure DrawItem(Control: TWinControl;Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure MeasureItem(Control: TWinControl; Index: Integer; var Height: Integer);
{$ELSE}
    function DrawItem(Index: Integer; Rect: TRect; State: TOwnerDrawState): Boolean;
    procedure MeasureItem(Control: TWinControl;
    {$IFDEF LINUX}item: QClxListBoxItemH{$ELSE}Index: Integer{$ENDIF};
      var Height, Width: Integer);
{$ENDIF}
    function GetCount: Integer;
    function GetExtendedSelect: Boolean;
    function GetItemHeight: Integer;
    function GetItemIndex: Integer;
    function GetItems: TStrings;
    function GetMultiSelect: Boolean;
    function GetReadOnly: Boolean;
    function GetSelCount: Integer;
    function GetSelected(Index: Integer): Boolean;
    function GetSorted: Boolean;
    function GetTopIndex: Integer;
    procedure SetExtendedSelect(Value: Boolean);
    procedure SetItemHeight(Value: Integer);
    procedure SetItemIndex(Value: Integer);
    procedure SetItems(Value: TStrings);
    procedure SetMultiSelect(Value: Boolean);
    procedure SetReadOnly(Value: Boolean);
    procedure SetSelected(Index: Integer; Value: Boolean);
    procedure SetSorted(Value: Boolean);
    procedure SetTopIndex(Value: Integer);
{$IFDEF VCL}
  {$IFDEF DELPHI6}
    function GetAutoComplete: Boolean;
    procedure SetAutoComplete(Value: Boolean);
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
    function CalcItemHeight(const AIndex: Integer): Integer; virtual;
    function GetTextFlag(const AStartFlag: Longint; const ASectionIndex: Integer;
      const AIgnoreEndEllips: Boolean; const ATabWidth: Integer): Longint;
    procedure ContainerStyleChanged(Sender: TObject); override;
    procedure CursorChanged; override;
    procedure FontChanged; override;
    procedure AdjustInnerControl; override;
    class function GetStyleClass: TcxContainerStyleClass; override;
    procedure DataChange; override;
    procedure DoExit; override;
    function IsInternalControl(AControl: TControl): Boolean; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    function RefreshContainer(const P: TPoint; Button: TcxMouseButton; Shift: TShiftState;
      AIsMouseEvent: Boolean): Boolean; override;
    procedure SetScrollBarsParameters; override;
    procedure UpdateData; override;
{$IFDEF VCL}
    function CanResize(var NewWidth, NewHeight: Integer): Boolean; override;
    procedure SetSize; override;
    procedure FullRepaint;
    procedure WndProc(var Message: TMessage); override;
{$ENDIF}
    function GetDataBindingClass: TcxCustomDataBindingClass; virtual;
{$IFDEF VCL}
    procedure GetOptimalHeight(var ANewHeight: Integer);
{$ENDIF}
    property DataBinding: TcxCustomDataBinding read FDataBinding;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly;
    property ScrollWidth: Integer read GetScrollWidth write SetScrollWidth default 0;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Loaded; override;
    procedure CreateWnd; override;
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
    property Count: Integer read GetCount;
    property InnerListBox:  TcxMCInnerListBox read FInnerListBox write FInnerListBox;
    property ItemIndex: Integer read GetItemIndex write SetItemIndex;
    property SelCount: Integer read GetSelCount;
    property Selected[Index: Integer]: Boolean read GetSelected write SetSelected;
    property TopIndex: Integer read GetTopIndex write SetTopIndex;
  published
{$IFNDEF VCL}
    property ColumnLayout: TListBoxLayout read GetColumnLayout write SetColumnLayout
      default llFixedNumber;
    property RowLayout: TListBoxLayout read GetRowLayout write SetRowLayout
      default llVariable;
{$ENDIF}
    property Align;
    property Alignment: TAlignment read FAlignment write SetAlignment default taLeftJustify;
    property MultiLines: Boolean read FMultiLines write SetMultiLines default False;
    property ShowEndEllipsis: Boolean read FShowEndEllipsis
      write SetShowEndEllipsis default True;
    property Delimiter: Char read FDelimiter write SetDelimiter default #59;
    property HeaderDragReorder: Boolean read GetHeaderDragReorder
      write SetHeaderDragReorder default False;
    property ShowColumnLines: Boolean read FShowColumnLines
      write SetShowColumnLines default True;
    property Images: TCustomImageList read GetImages
      write SetImages;
    property ColumnLineColor: TColor read FColumnLineColor
      write SetColumnLineColor default clBtnShadow;
    property OverflowEmptyColumn: Boolean read FOverflowEmptyColumn
      write SetOverflowEmptyColumn default True;
    property Anchors;
    property Constraints;
    property DragMode;
    property Enabled;
    property ExtendedSelect: Boolean read GetExtendedSelect write SetExtendedSelect default True;
    property ItemHeight: Integer read GetItemHeight write SetItemHeight default 16;
    property Items: TStrings read GetItems write SetItems;
    property HeaderSections: TcxHeaderSections read GetHeaderSections write SetHeaderSections;
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
    property TabWidth: Integer read GetTabWidth write SetTabWidth default 0;
{$ENDIF}
    property OnClick;
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
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
{$IFDEF DELPHI5}
    property OnContextPopup;
{$ENDIF}
{$IFDEF VCL}
    property OnEndDock;
    property OnStartDock;
{$ENDIF}
  end;

implementation

uses
{$IFDEF VCL}
  dxThemeConsts, dxThemeManager, dxUxTheme
{$ENDIF}
{$IFDEF DELPHI6}
  ,Variants
{$ENDIF}
  ;

type
  TcxCustomDataBindingAccess = class(TcxCustomDataBinding);
  TcxCustomLookAndFeelPainterAccess = class(TcxCustomLookAndFeelPainter);
  TcxContainerAccess = class(TcxContainer);

  TMCStringList = class(TStringList)
  private
    SortOrder: TcxHeaderSortOrder;
    SortColumn: Integer;
    Delimiter: Char;
  public
    procedure Sort; override;
{$IFDEF DELPHI5}
    procedure CustomSort(Compare: TStringListSortCompare); override;
{$ENDIF}    
  end;

procedure TMCStringList.Sort;
begin
  inherited Sort;
end;

{$IFDEF DELPHI5}
function ListCompare(List: TStringList; Index1, Index2: Integer): Integer;
var
  s1, s2: string;
  FDelimiter: Char;
begin
  FDelimiter := TMCStringList(List).Delimiter;

  s1 := GetWord(TMCStringList(List).SortColumn, List[Index1], FDelimiter);
  s2 := GetWord(TMCStringList(List).SortColumn, List[Index2], FDelimiter);

  if TMCStringList(List).SortOrder = soAscending then
    Result := AnsiCompareText(s1, s2)
  else
    Result := AnsiCompareText(s2, s1)
end;

procedure TMCStringList.CustomSort(Compare: TStringListSortCompare);
begin
  inherited CustomSort(ListCompare);
end;
{$ENDIF}

{ TcxMCInnerListBox }
function TcxMCInnerListBox.ExecuteAction(Action: TBasicAction): Boolean;
begin
  Result := inherited ExecuteAction(Action) or
    TcxCustomDataBindingAccess(Container.FDataBinding).ExecuteAction(Action);
end;

function TcxMCInnerListBox.UpdateAction(Action: TBasicAction): Boolean;
begin
  Result := inherited UpdateAction(Action) or
    TcxCustomDataBindingAccess(Container.FDataBinding).UpdateAction(Action);
end;

{$IFDEF DELPHI5}
function TcxMCInnerListBox.CanFocus: Boolean;
begin
  Result := Container.CanFocus;
end;
{$ENDIF}

procedure TcxMCInnerListBox.Click;
begin
  if Container.DataBinding.SetEditMode then
    inherited Click;
end;

procedure TcxMCInnerListBox.FullRepaint;
begin
  Perform(WM_PAINT, Canvas.Canvas.Handle, 0);
end;

procedure TcxMCInnerListBox.WMPaint(var Message: TWMPaint);
begin
  if Message.DC <> 0 then
  begin
    Canvas.Brush.Color := Container.Style.Color;
    Canvas.FillRect(Rect(0, 0, Width, Height));
  end;
  inherited;
  if (Items.Count = 0) and Container.ShowColumnLines then
    DrawLines;
end;

procedure TcxMCInnerListBox.RecalcItemRects;
var
  I: Integer;
  R: TRect;
begin
  for I := 0 to Items.Count - 1 do
  begin
    Perform(LB_GETITEMRECT, 0, Longint(@R));
    if R.Bottom > Height then Break;
    Perform(LB_SETITEMHEIGHT, I, Container.CalcItemHeight(I));
  end;
end;

function TcxMCInnerListBox.GetContainer: TcxMCListBox;
begin
  Result := TcxMCListBox(FContainer);
end;

procedure TcxMCInnerListBox.DrawLines;
var
  I: Integer;
begin
  Canvas.Pen.Color := Container.ColumnLineColor;
  Canvas.Pen.Width := 1;
  for I := 0 to Container.HeaderSections.Count - 1 do
  begin
    Canvas.MoveTo(Container.HeaderSections[I].Right - 1, 0);
    Canvas.LineTo(Container.HeaderSections[I].Right - 1, Height);
  end;
end;
{ TcxMCInnerListBox }

{ TcxMCInnerHeader }
function TcxMCInnerHeader.ExecuteAction(Action: TBasicAction): Boolean;
begin
  Result := inherited ExecuteAction(Action) or
    TcxCustomDataBindingAccess(Container.FDataBinding).ExecuteAction(Action);
end;

function TcxMCInnerHeader.UpdateAction(Action: TBasicAction): Boolean;
begin
  Result := inherited UpdateAction(Action) or
    TcxCustomDataBindingAccess(Container.FDataBinding).UpdateAction(Action);
end;

{$IFDEF DELPHI5}
function TcxMCInnerHeader.CanFocus: Boolean;
begin
  Result := Container.CanFocus;
end;
{$ENDIF}

procedure TcxMCInnerHeader.Click;
begin
  if Container.DataBinding.SetEditMode then
    inherited Click;
end;

function TcxMCInnerHeader.GetControlContainer: TcxContainer;
begin
  Result := FContainer;
end;

function TcxMCInnerHeader.GetControl: TWinControl;
begin
  Result := Self;
end;

function TcxMCInnerHeader.GetContainer: TcxMCListBox;
begin
  Result := TcxMCListBox(FContainer);
end;
{ TcxMCInnerHeader }

{TcxMCInnerPanel}
constructor TcxMCInnerPanel.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle - [csAcceptsControls];
end;
{TcxMCInnerPanel}

{ TcxMCListBox }
constructor TcxMCListBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FAlignment := taLeftJustify;
  FMultiLines := False;
  FShowEndEllipsis := True;
  FDelimiter := ';';
  FOverflowEmptyColumn := True;
  FShowColumnLines := True;
  FColumnLineColor := clBtnShadow;
  FInternalPaint := False;
  FInternalFlagCreatedHeader := False;
  FSavedIndex := -1;
  Width := 121;
  Height := 97;
  FOverLoadList := TStringList.Create;

  FDataBinding := GetDataBindingClass.Create(Self, Self);
  with TcxCustomDataBindingAccess(FDataBinding) do
  begin
    OnDataChange := Self.DataChange;
    OnDataSetChange := Self.DataSetChange;
    OnUpdateData := Self.UpdateData;
  end;

  FInnerPanel := TcxMCInnerPanel.Create(Self);
  FInnerPanel.Parent := Self;
  InnerControl := FInnerPanel;
  FInnerPanel.BorderStyle := bsNone;
  FInnerPanel.BevelInner := bvNone;
  FInnerPanel.BevelOuter := bvNone;
  FInnerPanel.Align := alClient;

  FInnerHeader := TcxMCInnerHeader.Create(FInnerPanel);
  FInnerHeader.Parent := FInnerPanel;
  FInnerHeader.Align := alTop;
  FInnerHeader.FContainer := Self;
  FInnerHeader.LookAndFeel.MasterLookAndFeel := Style.LookAndFeel;
  FInnerHeader.OnSectionEndResize := SectionEndResizeHandler;
  FInnerHeader.OnSectionTrack := SectionTrackHandler;
  FInnerHeader.OnSectionChange := SectionChangeHandler;
  FInnerHeader.OnSectionChangedSortOrder := SectionSortChangedHandler;
  FInnerHeader.OnSectionEndDrag := SectionEndDragHandler;
  FInnerHeader.AllowSort := True;
  FInnerHeader.ResizeUpdate := False;

  FInnerListBox := TcxMCInnerListBox.Create(FInnerPanel);
  FInnerListBox.Parent := FInnerPanel;
  FInnerListBox.Cursor := Cursor;
  FInnerListBox.BorderStyle := bsNone;
  FInnerListBox.Align := alClient;
  FInnerListBox.TabStop := False;
  FInnerListBox.FContainer := Self;
  FInnerListBox.LookAndFeel.MasterLookAndFeel := Style.LookAndFeel;
  FInnerListBox.Style := lbOwnerDrawVariable;
  FInnerListBox.OnMeasureItem := MeasureItem;
  FInnerListBox.OnDrawItem := DrawItem;
  FSavedHScroll := FInnerListBox.HScrollBar.OnScroll;
  FInnerListBox.HScrollBar.OnScroll := HScrollHandler;

  DataBinding.VisualControl := FInnerListBox;
end;

destructor TcxMCListBox.Destroy;
begin
  FreeAndNil(FInnerListBox);
  FreeAndNil(FInnerHeader);
  FreeAndNil(FInnerPanel);
  FreeAndNil(FDataBinding);
  FreeAndNil(FOverLoadList);
  inherited Destroy;
end;

procedure TcxMCListBox.Loaded;
begin
  inherited;
  FontChanged;
end;

procedure TcxMCListBox.CreateWnd;
var
  FSection: TcxHeaderSection;
begin
  inherited;
  if not FInternalFlagCreatedHeader then
  begin
    FInternalFlagCreatedHeader := True;
    if (FInnerHeader.Sections.Count = 0) then
    begin
      FSection := FInnerHeader.Sections.Add;
      FSection.Text := 'Section #1';
      FSection.Width := FInnerHeader.Canvas.TextWidth(FSection.Text) + 4;
    end;
  end;
end;

procedure TcxMCListBox.AddItem(AItem: string; AObject: TObject);
begin
  Items.AddObject(AItem, AObject);
end;

procedure TcxMCListBox.Clear;
begin
  Items.Clear;
end;

procedure TcxMCListBox.ClearSelection;
begin
  FInnerListBox.ClearSelection;
end;

procedure TcxMCListBox.DeleteSelected;
begin
  FInnerListBox.DeleteSelected;
end;

function TcxMCListBox.ItemAtPos(const APos: TPoint; AExisting: Boolean): Integer;
begin
  Result := FInnerListBox.ItemAtPos(APos, AExisting);
end;

function TcxMCListBox.ItemRect(Index: Integer): TRect;
begin
  Result := FInnerListBox.ItemRect(Index);
end;

function TcxMCListBox.ItemVisible(Index: Integer): Boolean;
begin
  Result := FInnerListBox.ItemVisible(Index);
end;

procedure TcxMCListBox.SelectAll;
begin
  FInnerListBox.SelectAll;
end;

{$IFDEF DELPHI6}
  {$IFDEF VCL}
procedure TcxMCListBox.CopySelection(ADestination: TCustomListControl);
begin
  FInnerListBox.CopySelection(ADestination);
end;

procedure TcxMCListBox.MoveSelection(ADestination: TCustomListControl);
begin
  FInnerListBox.MoveSelection(ADestination);
end;
  {$ENDIF}
{$ENDIF}

{$IFNDEF VCL}
procedure TcxMCListBox.MakeCurrentVisible;
begin
  FInnerListBox.MakeCurrentVisible;
end;

procedure TcxMCListBox.Sort;
begin
  FInnerListBox.Sort;
end;

function TcxMCListBox.VisibleItemCount: Integer;
begin
  Result := FInnerListBox.VisibleItemCount;
end;
{$ENDIF}

procedure TcxMCListBox.ContainerStyleChanged(Sender: TObject);
begin
  inherited;
  FInnerHeader.LookAndFeel.Assign(Self.LookAndFeel);
  FInnerListBox.LookAndFeel.Assign(Self.LookAndFeel);
  FInnerListBox.Color := Style.Color;
  FInnerListBox.FullRepaint;
end;

procedure TcxMCListBox.CursorChanged;
begin
  inherited CursorChanged;
  if FInnerListBox <> nil then
    FInnerListBox.Cursor := Cursor;
end;

procedure TcxMCListBox.FontChanged;
begin
  FInnerListBox.Font.Assign(Style.Font);
  FInnerListBox.Canvas.Font.Assign(Style.Font);
  inherited;
  FullRepaint;
  SetSize;
{$IFDEF DELPHI5}
  SetScrollBarsParameters;
{$ENDIF}  
end;

procedure TcxMCListBox.AdjustInnerControl;
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

class function TcxMCListBox.GetStyleClass: TcxContainerStyleClass;
begin
  Result := TcxExtContainerStyle;
end;

procedure TcxMCListBox.DataChange;
begin
  if DataBinding.IsDataSourceLive then
    ItemIndex := Items.IndexOf(VarToStr(DataBinding.GetStoredValue(evsText, Focused)))
  else
    ItemIndex := -1;
end;

procedure TcxMCListBox.DoExit;
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

function TcxMCListBox.ExecuteAction(Action: TBasicAction): Boolean;
begin
  Result := inherited ExecuteAction(Action) or
    TcxCustomDataBindingAccess(FDataBinding).ExecuteAction(Action);
end;

function TcxMCListBox.UpdateAction(Action: TBasicAction): Boolean;
begin
  Result := inherited UpdateAction(Action) or
    TcxCustomDataBindingAccess(FDataBinding).UpdateAction(Action);
end;

function TcxMCListBox.IsInternalControl(AControl: TControl): Boolean;
begin
  if FInnerListBox = nil then
    Result := True
  else
    Result := (AControl = FInnerListBox.HScrollBar) or (AControl = FInnerListBox.VScrollBar);
  Result := Result or inherited IsInternalControl(AControl);
end;

procedure TcxMCListBox.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited KeyDown(Key, Shift);
  case Key of
    VK_PRIOR, VK_NEXT, VK_END, VK_HOME, VK_LEFT, VK_UP, VK_RIGHT, VK_DOWN:
      if not DataBinding.SetEditMode then
        Key := 0;
  end;
end;

procedure TcxMCListBox.KeyPress(var Key: Char);
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

function TcxMCListBox.RefreshContainer(const P: TPoint; Button: TcxMouseButton;
  Shift: TShiftState; AIsMouseEvent: Boolean): Boolean;
begin
  Result := inherited RefreshContainer(P, Button, Shift, AIsMouseEvent);
end;

procedure TcxMCListBox.SetScrollBarsParameters;
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
      if IsDestroying or (Parent = nil) or not HandleAllocated or not FInnerListBox.HandleAllocated then
        Break;
      AScrollBarInfo.cbSize := SizeOf(AScrollBarInfo);
      if not GetScrollBarInfoProc(FInnerListBox.Handle, Integer(AScrollBarObjects[AScrollBar.Kind]),
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
    GetScrollInfo(FInnerListBox.Handle, ABarFlags[AScrollBar.Kind], AScrollInfo);
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
  AScrollBarSize := GetScrollBarSize;
  SetScrollBarParameters(HScrollBar);
  SetScrollBarParameters(VScrollBar);
{$ENDIF}
end;

procedure TcxMCListBox.UpdateData;
begin
  if ItemIndex >= 0 then
    DataBinding.SetStoredValue(evsText, Items[ItemIndex])
  else
    DataBinding.SetStoredValue(evsText, '');
end;

{$IFDEF VCL}
function TcxMCListBox.CanResize(var NewWidth, NewHeight: Integer): Boolean;
begin
  Result := inherited CanResize(NewWidth, NewHeight);
  if not Result or not IntegralHeight or IsLoading then
    Exit;
  if Align in [alLeft, alRight, alClient] then
    Exit;
  GetOptimalHeight(NewHeight);
end;

procedure TcxMCListBox.SetSize;

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
    if Height >= (FInnerHeader.Height + 2) then
      Height := ANewHeight
    else
      Height := FInnerHeader.Height + 2;
    inherited SetSize;
  finally
    if FInnerListBox.HandleAllocated then
      KillMouseMoveMessages;
  end;
end;

procedure TcxMCListBox.WndProc(var Message: TMessage);
begin
  if FInnerListBox <> nil then
    case Message.Msg of
      LB_ADDSTRING .. LB_MSGMAX:
        begin
          with TMessage(Message) do
            Result := SendMessage(FInnerListBox.Handle, Msg, WParam, LParam);
          Exit;
        end;
    end;
  inherited WndProc(Message);
end;
{$ENDIF}

function TcxMCListBox.GetDataBindingClass: TcxCustomDataBindingClass;
begin
  Result := TcxCustomDataBinding;
end;

{$IFDEF VCL}
procedure TcxMCListBox.GetOptimalHeight(var ANewHeight: Integer);

  function GetItemHeight(AIndex: Integer): Integer;
  begin
    case FInnerListBox.Style of
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
  I := FInnerHeader.Height;
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

function TcxMCListBox.GetImages: TCustomImageList;
begin
  Result := FInnerHeader.Images;
end;

procedure TcxMCListBox.SetImages(Value: TCustomImageList);
begin
  FInnerHeader.Images := Value;
end;

function TcxMCListBox.GetHeaderSections: TcxHeaderSections;
begin
  Result := FInnerHeader.Sections;
end;

procedure TcxMCListBox.SetHeaderSections(Value: TcxHeaderSections);
begin
  FInnerHeader.Sections := Value;
end;

procedure TcxMCListBox.SetAlignment(Value: TAlignment);
var
  I: Integer;
begin
  if FAlignment <> Value then
  begin
    FAlignment := Value;
    for I := 0 to Pred(HeaderSections.Count) do
      HeaderSections[I].Alignment := FAlignment;
    FullRepaint;
  end;
end;

procedure TcxMCListBox.SetMultiLines(Value: Boolean);
begin
  if FMultiLines <> Value then
  begin
    FMultiLines := Value;
    FullRepaint;
  end;
end;

procedure TcxMCListBox.SetShowEndEllipsis(Value: Boolean);
begin
  if FShowEndEllipsis <> Value then
  begin
    FShowEndEllipsis := Value;
    FullRepaint;
  end;
end;

procedure TcxMCListBox.SetDelimiter(Value: Char);
begin
  if FDelimiter <> Value then
  begin
    FDelimiter := Value;
    FullRepaint;
  end;
end;

function TcxMCListBox.GetHeaderDragReorder: Boolean;
begin
  Result := FInnerHeader.DragReorder;
end;

procedure TcxMCListBox.SetHeaderDragReorder(Value: Boolean);
begin
  FInnerHeader.DragReorder := Value;
end;

procedure TcxMCListBox.SetShowColumnLines(Value: Boolean);
begin
  if FShowColumnLines <> Value then
  begin
    FShowColumnLines := Value;
    FullRepaint;
  end;
end;

procedure TcxMCListBox.SetColumnLineColor(Value: TColor);
begin
  if FColumnLineColor <> Value then
  begin
    FColumnLineColor := Value;
    FullRepaint;
  end;
end;

procedure TcxMCListBox.SetOverflowEmptyColumn(Value: Boolean);
begin
  if FOverflowEmptyColumn <> Value then
  begin
    FOverflowEmptyColumn := Value;
    FullRepaint;
  end;
end;

procedure TcxMCListBox.SectionEndResizeHandler(HeaderControl: TcxCustomHeader;
  Section: TcxHeaderSection);
begin
  FullRepaint;
end;

procedure TcxMCListBox.SectionChangeHandler(Sender: TObject);
begin
  FullRepaint;
end;

procedure TcxMCListBox.SectionSortChangedHandler(Sender: TObject;
  const Section: TcxHeaderSection; const ASortOrder: TcxHeaderSortOrder);
var
  TmpList: TMCStringList;
begin
  TmpList := TMCStringList.Create;
  try
    Items.BeginUpdate;
    try
      TmpList.Assign(Items);
      try
        TmpList.Delimiter := FDelimiter;
        TmpList.SortOrder := ASortOrder;

        if ASortOrder = soNone then
          TmpList.SortColumn := -1
        else
          TmpList.SortColumn := Succ(Section.Index);

        TmpList.Sort;
      finally
        Items.Assign(TmpList);
      end;
    finally
      Items.EndUpdate;
    end;
  finally
    TmpList.Free;
  end;
end;

procedure TcxMCListBox.HScrollHandler(Sender: TObject; ScrollCode: TScrollCode;
  var ScrollPos: Integer);
begin
  if Assigned(FSavedHScroll) then FSavedHScroll(Sender, ScrollCode, ScrollPos);
end;

procedure TcxMCListBox.SectionEndDragHandler(Sender: TObject);
begin
  FInnerListBox.Invalidate;
end;

procedure TcxMCListBox.SectionTrackHandler(HeaderControl: TcxCustomHeader;
  Section: TcxHeaderSection; Width: Integer; State: TcxSectionTrackState);
begin
  if (State = tsTrackEnd) then
    FullRepaint;
end;

procedure TcxMCListBox.FullRepaint;
begin
  Canvas.Canvas.Lock;
  try
    if Count = 0 then
      FInnerListBox.FullRepaint
    else
    begin
      FSavedIndex := ItemIndex;
      FInternalPaint := True;
      FInnerListBox.FullRepaint;
      FInnerListBox.RecalcItemRects;
      FInnerListBox.ItemIndex := FSavedIndex;
    end;
  finally
    FInternalPaint := False;
    Canvas.Canvas.Unlock;
  end;
end;

function TcxMCListBox.GetTextPart(const ItemIndex, PartIndex: Integer): string;
begin
  if ItemIndex < Items.Count then
    Result := GetWord(PartIndex, Items[ItemIndex], FDelimiter)
  else
    Result := '';
end;

{$IFDEF VCL}
procedure TcxMCListBox.DrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var
  I, J, FTopLineY, FBottomLineY, ATextHeight: Integer;
  FHeaderSectionRect: TRect;
  FDrawSectionRect, FDrawSectionTextRect: TRect;
  FTextColor, FBkColor: TColor;
  FText, FMoreText: string;
  FBreakLine: Boolean;
  FDTParams: DrawTextParams;
begin
  FOverLoadList.Clear;
  with FDTParams do
  begin
    cbSize := SizeOf(DrawTextParams);
    iTabLength := FInnerListBox.TabWidth;
    iLeftMargin := 0;
    iRightMargin := 0;
  end;
  if (not FInternalPaint and (odSelected in State)) or
     (FInternalPaint and (FSavedIndex = Index)) then
  begin
    FBkColor := clHighlight;
    FTextColor := clHighlightText;
  end else
  begin
    FBkColor := Style.Color;
    FTextColor := Style.Font.Color;
  end;
  FInnerListBox.Canvas.Brush.Color := FBkColor;
  FInnerListBox.Canvas.Font.Color := FTextColor;
  FInnerListBox.Canvas.FillRect(Rect);
  if HeaderSections.Count > 0 then
  begin
    for I := 0 to HeaderSections.Count - 1 do
    begin
      FBreakLine := False;
      FHeaderSectionRect := FInnerHeader.GetSectionRect(I);
      FDrawSectionRect := Classes.Rect(FHeaderSectionRect.Left + 2, Rect.Top,
        FHeaderSectionRect.Right - 2, Rect.Bottom);
      FDrawSectionTextRect := FDrawSectionRect;
      FText := GetTextPart(Index, HeaderSections[I].NativeIndex + 1);
      if (FText <> '') and OverflowEmptyColumn then
      begin
        J := I + 1;
        while J <= (HeaderSections.Count - 1) do
        begin
          FMoreText := GetTextPart(Index, HeaderSections[J].NativeIndex + 1);
          if FMoreText = '' then
          begin
            ATextHeight := Windows.DrawTextEx(FInnerListBox.Canvas.Handle,
              @FText[1], Length(FText), FDrawSectionRect,
              GetTextFlag(DT_CALCRECT or DT_NOPREFIX or DT_VCENTER,
              HeaderSections[I].NativeIndex, True, FInnerListBox.TabWidth),
              @FDTParams);
            if (ATextHeight > CalcItemHeight(J)) or
              (FDrawSectionRect.Right > FDrawSectionTextRect.Right) then
            begin
              FDrawSectionRect.Right := FDrawSectionTextRect.Right + RectWidth(FInnerHeader.GetSectionRect(J));
              FDrawSectionRect.Bottom := FDrawSectionTextRect.Bottom;
              FDrawSectionTextRect.Right := FDrawSectionRect.Right;
              FBreakLine := True;
              FOverLoadList.Add(IntToStr(HeaderSections[J].NativeIndex - 1));
            end
            else
              Break;
          end
          else
            Break;
          Inc(J);
        end;
      end;
      if FText <> '' then
      begin
        FInnerListBox.Canvas.FillRect(FDrawSectionRect);
        InflateRect(FDrawSectionTextRect, -1, 0);
        if FDrawSectionRect.Bottom < Rect.Bottom then
          FDrawSectionRect.Bottom := Rect.Bottom;
        Windows.DrawTextEx(FInnerListBox.Canvas.Handle, @FText[1], Length(FText),
          FDrawSectionRect, GetTextFlag(DT_NOPREFIX or DT_VCENTER,
          HeaderSections[I].NativeIndex, False, FInnerListBox.TabWidth),
          @FDTParams);
      end
      else
        FBreakLine := (FOverLoadList.IndexOf(IntToStr(I)) <> -1);
      if ShowColumnLines then
      begin
        if FBreakLine then
          FTopLineY := FDrawSectionTextRect.Bottom
        else
          FTopLineY := FDrawSectionTextRect.Top;
        if Index < (Count - 1) then
          FBottomLineY := FDrawSectionTextRect.Bottom
        else
          FBottomLineY := FInnerListBox.Height;
        FInnerListBox.Canvas.Pen.Color := ColumnLineColor;
        FInnerListBox.Canvas.Pen.Width := 1;
        FInnerListBox.Canvas.MoveTo(FHeaderSectionRect.Right - 1, FTopLineY);
        FInnerListBox.Canvas.LineTo(FHeaderSectionRect.Right - 1, FBottomLineY);
      end;
    end;
  end;
end;
{$ELSE}
function TcxMCListBox.DrawItem(Index: Integer; Rect: TRect; State: TOwnerDrawState): Boolean;
begin
  Result := inherited DrawItem(Index, Rect, State);
end;
{$ENDIF}

{$IFDEF VCL}
procedure TcxMCListBox.MeasureItem(Control: TWinControl; Index: Integer; var Height: Integer);
{$ELSE}
procedure TcxMCListBox.MeasureItem(Control: TWinControl;
  {$IFDEF LINUX}item: QClxListBoxItemH{$ELSE}Index: Integer{$ENDIF};
  var Height, Width: Integer);
{$ENDIF}
begin
  Height := CalcItemHeight(Index);
end;

function TcxMCListBox.CalcItemHeight(const AIndex: Integer): Integer;
var
  I, J, ATextHeight, ARealTextHeight: Integer;
  FHeaderSectionRect, FCalcRect: TRect;
  FText, FMoreText: string;
  FDTParams: DrawTextParams;
begin
  Result := GetItemHeight;
  ARealTextHeight := FInnerListBox.Canvas.TextHeight('Wq');
  if ARealTextHeight > Result then
    Result := ARealTextHeight;
  with FDTParams do
  begin
    cbSize := SizeOf(DrawTextParams);
    iTabLength := FInnerListBox.TabWidth;
    iLeftMargin := 0;
    iRightMargin := 0;
  end;
  for I := 0 to HeaderSections.Count - 1 do
  begin
    FText := GetTextPart(AIndex, I + 1);
    FHeaderSectionRect := FInnerHeader.GetSectionRect(I);
    FCalcRect := Classes.Rect(FHeaderSectionRect.Left + 2, 0,
      FHeaderSectionRect.Right - 2, Result);
    if (FText <> '') and OverflowEmptyColumn then
    begin
      J := I + 1;
      while J < HeaderSections.Count do
      begin
        FMoreText := GetTextPart(AIndex, J + 1);
        if FMoreText = '' then
          FCalcRect.Right := FCalcRect.Right + RectWidth(FInnerHeader.GetSectionRect(J))
        else
          Break;
        Inc(J);
      end;
    end;
    ATextHeight := Windows.DrawTextEx(FInnerListBox.Canvas.Handle, @FText[1],
      Length(FText), FCalcRect,
      GetTextFlag(DT_CALCRECT or DT_NOPREFIX or DT_VCENTER, I, False,
        FInnerListBox.TabWidth), @FDTParams);
    if ATextHeight > Result then
      Result := ATextHeight;
  end;
end;

function TcxMCListBox.GetTextFlag(const AStartFlag: Longint;
  const ASectionIndex: Integer; const AIgnoreEndEllips: Boolean;
  const ATabWidth: Integer): Longint;
const
  AlignmentsHorzArray: array[TAlignment] of Integer =
    (DT_LEFT, DT_RIGHT, DT_CENTER);
  AlignmentsVertArray: array[TcxAlignmentVert] of Integer =
    (DT_TOP, DT_BOTTOM, DT_VCENTER);
  ShowEndEllipsisArray: array[Boolean] of Integer = (0, DT_END_ELLIPSIS);
  WordWrapArray: array[Boolean] of Integer = (0, DT_WORDBREAK);
begin
  Result := AStartFlag or
    AlignmentsHorzArray[HeaderSections[ASectionIndex].Alignment] or
    WordWrapArray[MultiLines];
  if not AIgnoreEndEllips then
    Result := Result or ShowEndEllipsisArray[ShowEndEllipsis];
  if not MultiLines then
    Result := Result or DT_SINGLELINE;
  if ATabWidth > 0 then
    Result := Result or DT_EXPANDTABS or DT_TABSTOP;
end;

function TcxMCListBox.GetCount: Integer;
begin
  Result := FInnerListBox.Items.Count;
end;

function TcxMCListBox.GetExtendedSelect: Boolean;
begin
  Result := FInnerListBox.ExtendedSelect;
end;

function TcxMCListBox.GetItemHeight: Integer;
begin
  Result := FInnerListBox.ItemHeight;
end;

function TcxMCListBox.GetItemIndex: Integer;
begin
  Result := FInnerListBox.ItemIndex;
end;

function TcxMCListBox.GetItems: TStrings;
begin
  Result := FInnerListBox.Items;
end;

function TcxMCListBox.GetMultiSelect: Boolean;
begin
  Result := FInnerListBox.MultiSelect;
end;

function TcxMCListBox.GetReadOnly: Boolean;
begin
  Result := TcxCustomDataBindingAccess(DataBinding).ReadOnly;
end;

function TcxMCListBox.GetSelCount: Integer;
begin
  Result := FInnerListBox.SelCount;
end;

function TcxMCListBox.GetSelected(Index: Integer): Boolean;
begin
  Result := FInnerListBox.Selected[Index];
end;

function TcxMCListBox.GetSorted: Boolean;
begin
  Result := FInnerListBox.Sorted;
end;

function TcxMCListBox.GetTopIndex: Integer;
begin
  Result := FInnerListBox.TopIndex;
end;

procedure TcxMCListBox.SetExtendedSelect(Value: Boolean);
begin
  FInnerListBox.ExtendedSelect := Value;
end;

procedure TcxMCListBox.SetItemHeight(Value: Integer);
begin
  FInnerListBox.ItemHeight := Value;
  FullRepaint;
end;

procedure TcxMCListBox.SetItemIndex(Value: Integer);
begin
  FInnerListBox.ItemIndex := Value;
end;

procedure TcxMCListBox.SetItems(Value: TStrings);
begin
  FInnerListBox.Items.Assign(Value);
  TcxCustomDataBindingAccess(DataBinding).DataChange;
end;

procedure TcxMCListBox.SetMultiSelect(Value: Boolean);
begin
  FInnerListBox.MultiSelect := Value;
end;

procedure TcxMCListBox.SetReadOnly(Value: Boolean);
begin
  TcxCustomDataBindingAccess(DataBinding).ReadOnly := Value;
end;

procedure TcxMCListBox.SetSelected(Index: Integer; Value: Boolean);
begin
  FInnerListBox.Selected[Index] := Value;
end;

procedure TcxMCListBox.SetSorted(Value: Boolean);
begin
  FInnerListBox.Sorted := Value;
end;

procedure TcxMCListBox.SetTopIndex(Value: Integer);
begin
  FInnerListBox.TopIndex := Value;
end;

{$IFDEF VCL}
  {$IFDEF DELPHI6}
function TcxMCListBox.GetAutoComplete: Boolean;
begin
  Result := FInnerListBox.AutoComplete;
end;

procedure TcxMCListBox.SetAutoComplete(Value: Boolean);
begin
  FInnerListBox.AutoComplete := Value;
end;
  {$ENDIF}
{$ENDIF}

{$IFDEF VCL}
function TcxMCListBox.GetScrollWidth: Integer;
begin
  Result := FInnerListBox.ScrollWidth;
end;

function TcxMCListBox.GetTabWidth: Integer;
begin
  Result := FInnerListBox.TabWidth;
end;

procedure TcxMCListBox.SetIntegralHeight(Value: Boolean);
begin
  if Value <> FIntegralHeight then
  begin
    FIntegralHeight := Value;
    SetSize;
  end;
end;

procedure TcxMCListBox.SetScrollWidth(Value: Integer);
begin
  FInnerListBox.ScrollWidth := Value;
end;

procedure TcxMCListBox.SetTabWidth(Value: Integer);
begin
  FInnerListBox.Items.BeginUpdate;
  try
    FInnerListBox.TabWidth := Value;
  finally
    FInnerListBox.Items.EndUpdate;
  end;
end;
{$ELSE}
function TcxMCListBox.GetColumnLayout: TListBoxLayout;
begin
  Result := FInnerListBox.ColumnLayout;
end;

function TcxMCListBox.GetRowLayout: TListBoxLayout;
begin
  Result := FInnerListBox.RowLayout;
end;

procedure TcxMCListBox.SetColumnLayout(Value: TListBoxLayout);
begin
  FInnerListBox.ColumnLayout := Value;
end;

procedure TcxMCListBox.SetRowLayout(Value: TListBoxLayout);
begin
  FInnerListBox.RowLayout := Value;
end;
{$ENDIF}
{ TcxMCListBox }

end.
