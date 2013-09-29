
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

unit cxImageComboBox;

{$I cxEdVer.inc}

interface

uses
{$IFDEF VCL}
  Windows, Messages, ComCtrls,
{$ELSE}
  Qt, QTypes,
{$ENDIF}
{$IFDEF DELPHI6}
  Types, Variants,
{$ENDIF}
  cxVariants, SysUtils, Classes, Graphics, Controls, Forms, StdCtrls, ExtCtrls, Clipbrd,
  ImgList, cxClasses, cxGraphics, cxControls, cxContainer, cxEdit, cxDropDownEdit,
  cxTextEdit, cxDataUtils;

type
  { TcxImageComboBoxItem }

  TcxImageComboBoxItem = class(TCollectionItem)
  private
    FDescription: TCaption;
    FImageIndex: TImageIndex;
    FValue: Variant;
    function IsStoredValue: Boolean;
    procedure SetDescription(const Value: TCaption);
    procedure SetImageIndex(const Value: TImageIndex);
    procedure SetValue(const AValue: Variant);
  public
    constructor Create(Collection: TCollection); override;
    procedure Assign(Source: TPersistent); override;
  published
    property Description: TCaption read FDescription write SetDescription;
    property ImageIndex: TImageIndex read FImageIndex write SetImageIndex default -1;
    property Value: Variant read FValue write SetValue stored IsStoredValue;
  end;

  { TcxImageComboBoxItems }

  TcxImageComboBoxItems = class(TOwnedCollection)
  private
    function GetItems(Index: Integer): TcxImageComboBoxItem;
    procedure SetItems(Index: Integer; const Value: TcxImageComboBoxItem);
  protected
    procedure Update(Item: TCollectionItem); override;
  public
  {$IFNDEF DELPHI6}
    function Owner: TPersistent;
  {$ENDIF}
    property Items[Index: Integer]: TcxImageComboBoxItem
      read GetItems write SetItems; default;
  end;

  { TcxImageComboBoxListBox }

  TcxCustomImageComboBoxProperties = class;

  TcxImageComboBoxListBox = class(TcxComboBoxListBox)
  private
    FProperties: TcxCustomImageComboBoxProperties;
    FHasScrollbar: Boolean;
    FClientWidth: Integer;
  protected
    function GetHeight(ARowCount: Integer; AMaxHeight: Integer): Integer; override;
    procedure RecreateWindow; override;
    function GetImageRect(const R: TRect): TRect;
    function GetImages: TImageList;
    function GetMaxItemWidth: Integer; virtual;
{$IFDEF VCL}
    procedure DrawItem(Index: Integer; Rect: TRect;
      State: TOwnerDrawState); override;
    procedure MeasureItem(Index: Integer; var Height: Integer); override;
{$ELSE}
    function DrawItem(Index: Integer; Rect: TRect;
      State: TOwnerDrawState): Boolean; override;
    procedure MeasureItem(Control: TWinControl;
      {$IFDEF LINUX}item: QClxListBoxItemH{$ENDIF}
      {$IFDEF WIN32}{$IFNDEF DELPHI7}Index: Integer{$ELSE}item: QClxListBoxItemH{$ENDIF}{$ENDIF};
      var Height{$IFNDEF VCL}, Width{$ENDIF}: Integer); override;
{$ENDIF}
    property Properties: TcxCustomImageComboBoxProperties read FProperties;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  { TcxImageComboBoxLookupData }

  TcxImageComboBoxLookupData = class(TcxComboBoxLookupData)
  protected
    function GetListBoxClass: TcxCustomEditListBoxClass; override;
    function GetItem(Index: Integer): TCaption; override;
    function GetItemCount: Integer; override;
  public
    procedure TextChanged; override;
  end;

  { TcxImageComboBoxViewData }

  TcxImageComboBoxViewData = class(TcxCustomDropDownEditViewData)
  public
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

  { TcxImageComboBoxViewInfo }

  TcxImageAlign = (iaLeft, iaRight);

  TcxImageComboBoxViewInfo = class(TcxCustomTextEditViewInfo)
  protected
    procedure InternalPaint(ACanvas: TcxCanvas); override;
  public
    ImageRect: TRect;
    ShowDescriptions: Boolean;
    ImageAlign: TcxImageAlign;
    ImageIndex: TImageIndex;
    Images: TImageList;
    procedure Offset(DX, DY: Integer); override;
  end;

  { TcxCustomImageComboBoxProperties }

  TcxCustomImageComboBoxProperties = class(TcxCustomComboBoxProperties)
  private
    FDefaultDescription: string;
    FDefaultImageIndex: TImageIndex;
    FImageAlign: TcxImageAlign;
    FImages: TImageList;
    FImagesChangeLink: TChangeLink;
    FItems: TcxImageComboBoxItems;
    FLargeImages: TImageList;
    FLargeImagesChangeLink: TChangeLink;
    FMultiLineText: Boolean;
    FShowDescriptions: Boolean;
    procedure ImagesChange(Sender: TObject);
    procedure LargeImagesChange(Sender: TObject);
    procedure SetDefaultDescription(const Value: string);
    procedure SetDefaultImageIndex(const Value: TImageIndex);
    procedure SetImageAlign(const Value: TcxImageAlign);
    procedure SetImages(const Value: TImageList);
    procedure SetItems(const Value: TcxImageComboBoxItems);
    procedure SetLargeImages(const Value: TImageList);
    procedure SetMultiLineText(const Value: Boolean);
    procedure SetShowDescriptions(const Value: Boolean);
    procedure SetupViewInfoByItem(AItem: TcxImageComboBoxItem;
      AViewInfo: TcxImageComboBoxViewInfo);
  protected
    function GetDisplayFormatOptions: TcxEditDisplayFormatOptions; override;
    function FindItemByValue(const AValue: Variant): TcxImageComboBoxItem;
    function FindItemByText(const AText: string): TcxImageComboBoxItem;
    function FindLookupText(const AText: string): Boolean; override;
    procedure FreeNotification(Sender: TComponent); override;
    property DefaultDescription: string
      read FDefaultDescription write SetDefaultDescription;
    property DefaultImageIndex: TImageIndex
      read FDefaultImageIndex write SetDefaultImageIndex default -1;
    property ImageAlign: TcxImageAlign
      read FImageAlign write SetImageAlign default iaLeft;
    property Images: TImageList read FImages write SetImages;
    property Items: TcxImageComboBoxItems read FItems write SetItems;
    property LargeImages: TImageList read FLargeImages write SetLargeImages;
    property MultiLineText: Boolean
      read FMultiLineText write SetMultiLineText default False;
    property ShowDescriptions: Boolean
      read FShowDescriptions write SetShowDescriptions default True;
  public
    constructor Create(AOwner: TPersistent); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    class function GetContainerClass: TcxContainerClass; override;
    function GetDisplayText(const AEditValue: TcxEditValue;
      AFullText: Boolean = False): WideString; override;
    function GetEditValueSource(AEditFocused: Boolean): TcxDataEditValueSource; override;
    class function GetLookupDataClass: TcxInterfacedPersistentClass; override;
    function GetSupportedOperations: TcxEditSupportedOperations; override;
    class function GetViewDataClass: TcxCustomEditViewDataClass; override;
    class function GetViewInfoClass: TcxContainerViewInfoClass; override;
    function IsEditValueValid(var AEditValue: TcxEditValue; AEditFocused: Boolean): Boolean; override;
    procedure PrepareDisplayValue(const AEditValue: TcxEditValue;
      var DisplayValue: TcxEditValue; AEditFocused: Boolean); override;
  end;

  { TcxImageComboBoxProperties }

  TcxImageComboBoxProperties = class(TcxCustomImageComboBoxProperties)
  published
    property Alignment;
    property ButtonGlyph;
    property DefaultDescription;
    property DefaultImageIndex;
    property DropDownRows;
    property ImageAlign;
    property Images;
    property ImmediateDropDown;
    property ImmediatePost;
    property ImmediateUpdateText;
    property Items;
    property LargeImages;
    property MultiLineText;
    property ReadOnly;
    property Revertable;
    property ShowDescriptions;
    property OnButtonClick;
    property OnChange;
    property OnCloseQuery;
    property OnCloseUp;
    property OnEditValueChanged;
    property OnInitPopup;
    property OnPopup;
    property OnValidate;
  end;

  { TcxCustomImageComboBox }

  TcxCustomImageComboBox = class(TcxCustomComboBox)
  private
    function GetProperties: TcxImageComboBoxProperties;
    procedure SetProperties(const Value: TcxImageComboBoxProperties);
  protected
    function GetPopupWindowClientPreferredSize: TSize; override;
    procedure InitializeLookupData; override;
    function IsValidChar(AChar: Char): Boolean; override;
    function LookupKeyToEditValue(const AKey: TcxEditValue): TcxEditValue; override;
    procedure SynchronizeDisplayValue; override;
    procedure UpdateDrawValue; override;
  public
    class function GetPropertiesClass: TcxCustomEditPropertiesClass; override;
    procedure PrepareEditValue(const ADisplayValue: TcxEditValue;
      out EditValue: TcxEditValue; AEditFocused: Boolean); override;
    property Properties: TcxImageComboBoxProperties
      read GetProperties write SetProperties;
  end;

  { TcxImageComboBox }

  TcxImageComboBox = class(TcxCustomImageComboBox)
  public
    property ItemIndex;
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
    property EditValue;
    property Enabled;
    {$IFDEF VCL}
    property ImeMode;
    property ImeName;
    {$ENDIF}
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property Properties;
    property ShowHint;
    property Style;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnClick;
    property OnEditing;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
  end;

implementation

uses
  Dialogs, Math, cxButtons, cxEditConsts, cxEditUtils;

const
  EmptyRect: TRect = (Left: 0; Top: 0; Right: 0; Bottom: 0);

type
  TCanvasAccess = class({$IFDEF VCL}TControlCanvas{$ELSE}TCanvas{$ENDIF});
  TcxCustomEditPopupWindowAccess = class(TcxCustomEditPopupWindow);
  TcxCustomTextEditAccess = class(TcxCustomTextEdit);

function Max(A, B: Integer): Integer;
begin
  Result := A;
  if B > A then Result := B;
end;

{ TcxImageComboBoxItem }

constructor TcxImageComboBoxItem.Create(Collection: TCollection);
var
  AImages: TCustomImageList;
begin
  FValue := Null; // for D5 variants
  inherited Create(Collection);
  AImages :=
    TcxImageComboBoxProperties(TcxImageComboBoxItems(Collection).Owner).Images;
  if (AImages <> nil) and (AImages.Count >= Collection.Count) then
    FImageIndex := Collection.Count - 1
  else
    FImageIndex := -1;
end;

function TcxImageComboBoxItem.IsStoredValue: Boolean;
begin
  Result := not VarIsNull(FValue);
end;

procedure TcxImageComboBoxItem.SetDescription(const Value: TCaption);
begin
  if FDescription <> Value then
  begin
    FDescription := Value;
    TcxImageComboBoxItems(Collection).Changed;
  end;
end;

procedure TcxImageComboBoxItem.SetImageIndex(const Value: TImageIndex);
begin
  if FImageIndex <> Value then
  begin
    FImageIndex := Value;
    TcxImageComboBoxItems(Collection).Changed;
  end;
end;

procedure TcxImageComboBoxItem.SetValue(const AValue: Variant);
begin
  if not InternalVarEqualsExact(FValue, AValue) then
  begin
    FValue := AValue;
    TcxImageComboBoxItems(Collection).Changed;
  end;
end;

procedure TcxImageComboBoxItem.Assign(Source: TPersistent);
begin
  if Source is TcxImageComboBoxItem then
    with TcxImageComboBoxItem(Source) do
    begin
      Self.Description := Description;
      Self.ImageIndex := ImageIndex;
      Self.Value := Value;
    end
  else
    inherited Assign(Source);
end;

{ TcxImageComboBoxItems }

function TcxImageComboBoxItems.GetItems(Index: Integer): TcxImageComboBoxItem;
begin
  Result := TcxImageComboBoxItem(inherited Items[Index]);
end;

procedure TcxImageComboBoxItems.SetItems(Index: Integer;
  const Value: TcxImageComboBoxItem);
begin
  inherited Items[Index] := Value;
end;

procedure TcxImageComboBoxItems.Update(Item: TCollectionItem);
begin
  with TcxImageComboBoxProperties(Owner) do
    Changed;
end;

{$IFNDEF DELPHI6}
function TcxImageComboBoxItems.Owner: TPersistent;
begin
  Result := GetOwner;
end;
{$ENDIF}

{ TcxImageComboBoxListBox }

constructor TcxImageComboBoxListBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FProperties := TcxImageComboBox(Edit).Properties;
  BorderStyle := bsNone;
  Style := lbOwnerDrawVariable;
end;

function TcxImageComboBoxListBox.GetHeight(ARowCount: Integer; AMaxHeight: Integer): Integer;
var
  I, H: Integer;
  R: TRect;
{$IFNDEF VCL}
  W: Integer;
  Size: TSize;
{$ENDIF}
begin
  if Properties.MultiLineText then
    with TcxCustomImageComboBox(Edit) do
    begin
      R := GetPopupWindowOwnerControlBounds;
      FClientWidth := R.Right - R.Left;
      R := TcxCustomEditPopupWindowAccess(PopupWindow).ViewInfo.GetClientExtent;
      Dec(FClientWidth, R.Left + R.Right);
    end
    else
      FClientWidth := 0;
  Result := 0;
  for I := 0 to ARowCount - 1 do
  begin
    H := 0;
{$IFDEF VCL}
    MeasureItem(I, H);
{$ELSE}
  {$IFDEF LINUX}
      MeasureItem(Self, QClxListBoxItemH(QListBox_item(handle, I)), H, W);
  {$ELSE}
    {$IFNDEF DELPHI7}
      MeasureItem(Self, I, H, W);
    {$ELSE}
      MeasureItem(Self, QClxListBoxItemH(QListBox_item(handle, I)), H, W);
    {$ENDIF}
  {$ENDIF}
{$ENDIF}
    Inc(Result, H);
  end;
  if Properties.MultiLineText then
  begin
    FHasScrollbar := (Result > AMaxHeight) or (ARowCount < Items.Count);
    if FHasScrollbar then
    begin
{$IFDEF VCL}
      Dec(FClientWidth, VScrollBar.Width);
{$ELSE}
      // TODO check calc
      QStyle_scrollBarExtent(Application.Style.Handle, @Size);
      Dec(FClientWidth, Size.cx);
{$ENDIF}
      Result := 0;
      for I := 0 to ARowCount - 1 do
      begin
        H := 0;
{$IFDEF VCL}
        MeasureItem(I, H);
{$ELSE}
  {$IFDEF LINUX}
        MeasureItem(Self, QClxListBoxItemH(QListBox_item(handle, I)), H, W);
  {$ELSE}
    {$IFNDEF DELPHI7}
        MeasureItem(Self, I, H, W);
    {$ELSE}
        MeasureItem(Self, QClxListBoxItemH(QListBox_item(handle, I)), H, W);
    {$ENDIF}
  {$ENDIF}
{$ENDIF}
        Inc(Result, H);
      end;
    end;
  end;
end;

procedure TcxImageComboBoxListBox.RecreateWindow;
begin
  InternalRecreateWindow;
end;

function TcxImageComboBoxListBox.GetImageRect(const R: TRect): TRect;
var
  AImages: TImageList;
begin
  AImages := GetImages;
  if AImages <> nil then
    with Properties do
    begin
      Result := R;
      with Result do
        if ImageAlign = iaLeft then
          Right := Left + AImages.Width + 4
        else
          Left := Right - AImages.Width - 4;
    end
    else
      Result := EmptyRect;
end;

function TcxImageComboBoxListBox.GetImages: TImageList;
begin
  Result := Properties.LargeImages;
  if Result = nil then Result := Properties.Images;
end;

function TcxImageComboBoxListBox.GetMaxItemWidth: Integer;
var
  AImages: TImageList;
  I, W, J: Integer;
begin
  AImages := GetImages;
  if AImages <> nil then Result := AImages.Width + 8 else Result := 4;
  with FProperties do
  begin
    J := Result;
    for I := 0 to Items.Count - 1 do
    begin
      W := Canvas.TextWidth(Items[I].Description) + J;
      if W > Result then Result := W;
    end;
  end;
  if Properties.DropDownRows < Items.Count then
    Inc(Result, VScrollBar.Width);
end;

{$IFDEF VCL}

procedure TcxImageComboBoxListBox.DrawItem(Index: Integer; Rect: TRect;
  State: TOwnerDrawState);
var
  Flags: Longint;
  Data: string;
  AImages: TImageList;
  R: TRect;
  AImageIndex: Integer;
begin
  if Assigned(OnDrawItem) then OnDrawItem(Self, Index, Rect, State) else
  begin
    Canvas.FillRect(Rect);
    if (Index < Items.Count) and (Index > -1) then
    begin
      if Properties.MultiLineText then
        Flags := DrawTextBiDiModeFlags(DT_LEFT or DT_EXPANDTABS or
          DT_NOPREFIX or DT_WORDBREAK)
      else
        Flags := DrawTextBiDiModeFlags(DT_SINGLELINE or DT_VCENTER or
          DT_NOPREFIX);
      if not UseRightToLeftAlignment then
        Inc(Rect.Left, 2)
      else
        Dec(Rect.Right, 2);
      Data := Properties.Items[Index].Description;
      AImages := GetImages;
      if AImages <> nil then
      begin
        R := GetImageRect(Rect);
        AImageIndex := Properties.Items[Index].ImageIndex;
        if (AImageIndex > -1) and (AImageIndex < AImages.Count) then
          with R do
            AImages.Draw(Canvas.Canvas, Left + 1, (Bottom + Top - AImages.Height) div 2,
              AImageIndex, Enabled);
        if R.Left > Rect.Left then Rect.Right := R.Left;
        if R.Right < Rect.Right then Rect.Left := R.Right;
      end;
      if not IsRectEmpty(Rect) then
      begin
        SetBkMode(Handle, TRANSPARENT);
        DrawText(Canvas.Handle, PChar(Data), Length(Data), Rect, Flags);
      end;
    end;
  end;
end;

{$ELSE}

function TcxImageComboBoxListBox.DrawItem(Index: Integer; Rect: TRect; State: TOwnerDrawState): Boolean;
var
  Flags: Longint;
  Data: WideString;
  AImages: TImageList;
  R: TRect;
  AImageIndex: Integer;
begin
  Result := Assigned(OnDrawItem);
  if Result then
  begin
    if odSelected in State then
    begin
      Canvas.Brush.Color := clHighlight;
      Canvas.FillRect(Rect);
    end;
    OnDrawItem(Self, Index, Rect, State, Result);
  end
  else
  begin
    Result := True;
    Canvas.FillRect(Rect);
    if (Index < Items.Count) and (Index > -1) then
    begin
      if Properties.MultiLineText then
        Flags := 1 or 256 or 1024  //AlignLeft + ExpandTabs + WordBreak
      else
        Flags := 1 or 32 or 256;   //AlignLeft + AlignVCenter + ExpandTabs
      Data := Properties.Items[Index].Description;
      AImages := GetImages;
      if AImages <> nil then
      begin
        R := GetImageRect(Rect);
        AImageIndex := Properties.Items[Index].ImageIndex;
        if (AImageIndex > -1) and (AImageIndex < AImages.Count) then
          with R do
            AImages.Draw(Canvas.Canvas, Left + 1, (Bottom + Top - AImages.Height) div 2,
              AImageIndex);
        if R.Left > Rect.Left then Rect.Right := R.Left;
        if R.Right < Rect.Right then Rect.Left := R.Right;
      end;
      TCanvasAccess(Canvas.Canvas).RequiredState([csHandleValid, csFontValid]);
      QPainter_drawText(Canvas.Handle, @Rect, Flags, @Data, -1, nil, nil);
    end;
  end;
end;

{$ENDIF}

{$IFDEF VCL}
procedure TcxImageComboBoxListBox.MeasureItem(Index: Integer; var Height: Integer);
{$ELSE}
procedure TcxImageComboBoxListBox.MeasureItem(Control: TWinControl;
  {$IFDEF LINUX}item: QClxListBoxItemH{$ENDIF}
  {$IFDEF WIN32}{$IFNDEF DELPHI7}Index: Integer{$ELSE}item: QClxListBoxItemH{$ENDIF}{$ENDIF};
  var Height{$IFNDEF VCL}, Width{$ENDIF}: Integer);
{$ENDIF}
var
  AData: TCaption;
  AImages: TImageList;
  W, H, AFlags: Integer;
  R: TRect;
{$IFNDEF VCL}
  {$IFDEF WIN32}
    {$IFDEF DELPHI7}
  Index: Integer;
    {$ENDIF}
  {$ENDIF}
  {$IFDEF LINUX}
  Index: Integer;
  {$ENDIF}
{$ENDIF}
begin
  // TODO check Qt
  W := FClientWidth - 2;
{$IFNDEF VCL}
  {$IFDEF WIN32}
    {$IFDEF DELPHI7}
  Index := QListBox_index(Handle, Item);
    {$ENDIF}
  {$ENDIF}
  {$IFDEF LINUX}
  Index := QListBox_index(Handle, Item);
  {$ENDIF}
{$ENDIF}
  AImages := GetImages;
  if AImages <> nil then
  begin
    Dec(W, AImages.Width + 4);
    H := AImages.Height + 2;
  end
  else
    H := 0;
  if Properties.MultiLineText and (W > 0) then
  begin
    R := Rect(0, 0, W, H);
    AData := Properties.Items[Index].Description;
{$IFDEF VCL}
    AFlags := DT_LEFT or DT_EXPANDTABS or DT_NOPREFIX or DT_WORDBREAK or DT_CALCRECT;
    DrawText(Canvas.Handle, PChar(AData), Length(AData), R, AFlags);
{$ELSE}
    AFlags := 1 or 256 or 1024; //AlignLeft + ExpandTabs + WordBreak
    Canvas.Canvas.Start;
    try
      TCanvasAccess(Canvas).RequiredState([csHandleValid, csFontValid]);
      QPainter_boundingRect(Canvas.Handle, @R, 0, 0, W, 0, AFlags, @AData, -1, nil);
    finally
      Canvas.Canvas.Stop;
    end;
{$ENDIF}
    H := Max(H, R.Bottom - R.Top + 2);
  end
  else
    H := Max(Canvas.TextHeight('Wg') + 2, H);
  Height := H;
end;

{ TcxImageComboBoxLookupData }

function TcxImageComboBoxLookupData.GetListBoxClass: TcxCustomEditListBoxClass;
begin
  Result := TcxImageComboBoxListBox;
end;

function TcxImageComboBoxLookupData.GetItem(Index: Integer): TCaption;
begin
  with TcxCustomImageComboBox(Edit).Properties do
    if (Index > -1) and (Index < Items.Count) then
      Result := Items[Index].Description
    else
      Result := ''
end;

function TcxImageComboBoxLookupData.GetItemCount: Integer;
begin
  Result := TcxCustomImageComboBox(Edit).Properties.Items.Count;
end;

procedure TcxImageComboBoxLookupData.TextChanged;
var
  AItem: TcxImageComboBoxItem;
begin
  with TcxImageComboBoxProperties(Properties) do
    AItem := FindItemByValue(Edit.EditValue);
  if AItem <> nil then
    InternalSetCurrentKey(AItem.Index)
  else
    InternalSetCurrentKey(-1);
end;

{ TcxImageComboBoxViewData }

procedure TcxImageComboBoxViewData.Calculate(ACanvas: TcxCanvas;
  const ABounds: TRect; const P: TPoint; Button: TcxMouseButton;
  Shift: TShiftState; AViewInfo: TcxCustomEditViewInfo; AIsMouseEvent: Boolean);
var
  R: TRect;
begin
  inherited Calculate(ACanvas, ABounds, P, Button, Shift, AViewInfo,
    AIsMouseEvent);

  with TcxImageComboBoxViewInfo(AViewInfo) do
  begin
    ImageAlign := TcxImageComboBoxProperties(Properties).ImageAlign;
    Images := TcxImageComboBoxProperties(Properties).Images;
    ShowDescriptions := TcxImageComboBoxProperties(Properties).ShowDescriptions;
    R := ClientRect;
    if Assigned(Images) then
    begin
      ImageRect := R;
      with ImageRect do
      begin
        if ShowDescriptions then
          if ImageAlign = iaLeft then
          begin
            Inc(Left, 2);
            Right := Left + Images.Width;
            R.Left := Right + 2;
          end
          else
          begin
            Right := Right - 2;
            Left := Right - Images.Width;
            R.Right := Left - 2;
          end
        else
        begin
          Left := Left + (Right - Left - Images.Width) div 2;
          Right := Left + Images.Width;
        end;
        Top := Top + (Bottom - Top - Images.Height) div 2;
        Bottom := Top + Images.Height;
      end;
    end;

    if not IsInplace then
      ClientRect := R;
    InflateRect(R, -2, -1);
    TextRect := R;
    if not ShowDescriptions then
      Text := '';
    if not IsInplace then
      DrawSelectionBar := False;
  end;
end;

procedure TcxImageComboBoxViewData.DisplayValueToDrawValue(
  const ADisplayValue: TcxEditValue; AViewInfo: TcxCustomEditViewInfo);
begin
  if (Edit = nil) then Exit;
  with TcxImageComboBoxProperties(Properties), TcxCustomTextEditAccess(Edit).ILookupData do
    if CurrentKey = -1 then
      SetupViewInfoByItem(FindItemByValue(Edit.EditValue), TcxImageComboBoxViewInfo(AViewInfo))
    else
      SetupViewInfoByItem(Items[CurrentKey], TcxImageComboBoxViewInfo(AViewInfo));
//  inherited;
end;

function TcxImageComboBoxViewData.GetEditContentSize(ACanvas: TcxCanvas;
  const AEditValue: TcxEditValue;
  const AEditSizeProperties: TcxEditSizeProperties): TSize;
var
  AItem: TcxImageComboBoxItem;
  S: string;
begin
  with TcxImageComboBoxProperties(Properties) do
  begin
    if ShowDescriptions then
    begin
      AItem := FindItemByValue(AEditValue);
      if AItem = nil then S := DefaultDescription else S := AItem.Description;
    end
    else
      S := '';
    Result := GetTextEditContentSize(ACanvas, Self, S,
      GetDrawTextFlags, @AEditSizeProperties);
    if Images <> nil then
      Inc(Result.cx, Images.Width + 5)
    else
      Inc(Result.cx);
  end;
end;

procedure TcxImageComboBoxViewData.EditValueToDrawValue(ACanvas: TcxCanvas;
  const AEditValue: TcxEditValue; AViewInfo: TcxCustomEditViewInfo);
begin
  PrepareSelection(AViewInfo);
  with TcxImageComboBoxProperties(Properties) do
    SetupViewInfoByItem(FindItemByValue(AEditValue), TcxImageComboBoxViewInfo(AViewInfo));
end;

{ TcxImageComboBoxViewInfo }

procedure TcxImageComboBoxViewInfo.Offset(DX, DY: Integer);
begin
  inherited Offset(DX, DY);
  OffsetRect(ImageRect, DX, DY);
end;

procedure TcxImageComboBoxViewInfo.InternalPaint(ACanvas: TcxCanvas);
var
  AClipRgn, APrevClipRgn: TcxRegion;
  R: TRect;
begin
  if not RectVisible(ACanvas.Handle, Bounds) then
    Exit;
  if Assigned(Images) and (ImageIndex > -1) and (ImageIndex < Images.Count) then
  begin
    APrevClipRgn := ACanvas.GetClipRegion;
    try
      IntersectRect(R, ImageRect, BorderRect);
      AClipRgn := TcxRegion.Create(R);
      ACanvas.SetClipRegion(AClipRgn, roIntersect);

      if Transparent then
        Images.Draw(ACanvas.Canvas, ImageRect.Left, ImageRect.Top,
          ImageIndex, {$IFNDEF VCL}itImage, {$ENDIF}Enabled)
      else
        {$IFDEF VCL}cxEditUtils{$ELSE}QcxEditUtils{$ENDIF}.DrawGlyph(ACanvas,
          Images, ImageIndex, ImageRect, BackgroundColor, Enabled);
    finally
      ACanvas.SetClipRegion(APrevClipRgn, roSet);
    end;
    if not Transparent then
      ACanvas.ExcludeClipRect(R);
  end;
  inherited InternalPaint(ACanvas);
end;

{ TcxCustomImageComboBoxProperties }

constructor TcxCustomImageComboBoxProperties.Create(AOwner: TPersistent);
begin
  inherited Create(AOwner);
  FShowDescriptions := True;
  FDefaultImageIndex := -1;
  FImageAlign := iaLeft;
  FItems := TcxImageComboBoxItems.Create(Self, TcxImageComboBoxItem);
  DropDownListStyle := lsFixedList;
  FixedListSelection := True;
  FImagesChangeLink := TChangeLink.Create;
  FImagesChangeLink.OnChange := ImagesChange;
  FLargeImagesChangeLink := TChangeLink.Create;
  FLargeImagesChangeLink.OnChange := LargeImagesChange;
end;

destructor TcxCustomImageComboBoxProperties.Destroy;
begin
  FImagesChangeLink.Free;
  FLargeImagesChangeLink.Free;
  FItems.Free;
  inherited Destroy;
end;

procedure TcxCustomImageComboBoxProperties.ImagesChange(Sender: TObject);
begin
  Changed;
end;

procedure TcxCustomImageComboBoxProperties.LargeImagesChange(Sender: TObject);
begin
  Changed;
end;

procedure TcxCustomImageComboBoxProperties.SetDefaultDescription(
  const Value: string);
begin
  if FDefaultDescription <> Value then
  begin
    FDefaultDescription := Value;
    Changed;
  end;
end;

procedure TcxCustomImageComboBoxProperties.SetDefaultImageIndex(
  const Value: TImageIndex);
begin
  if FDefaultImageIndex <> Value then
  begin
    FDefaultImageIndex := Value;
    Changed;
  end;
end;

procedure TcxCustomImageComboBoxProperties.SetImageAlign(
  const Value: TcxImageAlign);
begin
  if FImageAlign <> Value then
  begin
    FImageAlign := Value;
    Changed;
  end;
end;

procedure TcxCustomImageComboBoxProperties.SetImages(const Value: TImageList);
begin
  if FImages <> Value then
  begin
    if FImages <> nil then
    begin
      FImages.UnRegisterChanges(FImagesChangeLink);
      FreeNotificator.RemoveSender(FImages);
    end;
    FImages := Value;
    if FImages <> nil then
    begin
      FImages.RegisterChanges(FImagesChangeLink);
      FreeNotificator.AddSender(FImages);
    end;
    Changed;
  end;
end;

procedure TcxCustomImageComboBoxProperties.SetLargeImages(
  const Value: TImageList);
begin
  if FLargeImages <> Value then
  begin
    if FLargeImages <> nil then
    begin
      FLargeImages.UnRegisterChanges(FLargeImagesChangeLink);
      FreeNotificator.RemoveSender(FLargeImages);
    end;
    FLargeImages := Value;
    if FLargeImages <> nil then
    begin
      FLargeImages.RegisterChanges(FLargeImagesChangeLink);
      FreeNotificator.AddSender(FLargeImages);
    end;
    Changed;
  end;
end;

procedure TcxCustomImageComboBoxProperties.SetItems(
  const Value: TcxImageComboBoxItems);
begin
  FItems.Assign(Value);
  Changed;
end;

procedure TcxCustomImageComboBoxProperties.SetMultiLineText(
  const Value: Boolean);
begin
  if FMultiLineText <> Value then
  begin
    FMultiLineText := Value;
    Changed;
  end;
end;

procedure TcxCustomImageComboBoxProperties.SetShowDescriptions(
  const Value: Boolean);
begin
  if FShowDescriptions <> Value then
  begin
    FShowDescriptions := Value;
    Changed;
  end;
end;

procedure TcxCustomImageComboBoxProperties.SetupViewInfoByItem(
  AItem: TcxImageComboBoxItem; AViewInfo: TcxImageComboBoxViewInfo);
begin
  with AViewInfo do
    if AItem = nil then
    begin
      ImageIndex := DefaultImageIndex;
      if Self.ShowDescriptions then
        Text := DefaultDescription
      else
        Text := ''
    end
    else
    begin
      ImageIndex := AItem.ImageIndex;
      if Self.ShowDescriptions then
        Text := AItem.Description
      else
        Text := ''
    end;
end;

function TcxCustomImageComboBoxProperties.GetDisplayFormatOptions: TcxEditDisplayFormatOptions;
begin
  Result := [];
end;

function TcxCustomImageComboBoxProperties.FindItemByValue(
  const AValue: Variant): TcxImageComboBoxItem;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to Items.Count - 1 do
    with Items[I] do
      if VarEqualsExact(AValue, Value) then
      begin
        Result := Items[I];
        Break;
      end;
end;

function TcxCustomImageComboBoxProperties.FindItemByText(const AText: string):
  TcxImageComboBoxItem;
var
  I: Integer;
begin
  Result := nil;
  if ShowDescriptions then
    for I := 0 to Items.Count - 1 do
      if InternalCompareString(Items[I].Description, AText, False) then
      begin
        Result := Items[I];
        Break;
      end;
end;

function TcxCustomImageComboBoxProperties.FindLookupText(const AText: string): Boolean;
begin
  Result := FindItemByText(AText) <> nil;
end;

procedure TcxCustomImageComboBoxProperties.FreeNotification(Sender: TComponent);
begin
  inherited FreeNotification(Sender);
  if Sender = FImages then
    FImages := nil;
  if Sender = FLargeImages then
    FLargeImages := nil;
end;

procedure TcxCustomImageComboBoxProperties.Assign(Source: TPersistent);
begin
  if Source is TcxCustomImageComboBoxProperties then
  begin
    BeginUpdate;
    try
      inherited Assign(Source);
      with TcxCustomImageComboBoxProperties(Source) do
      begin
        Self.DefaultDescription := DefaultDescription;
        Self.DefaultImageIndex := DefaultImageIndex;
        Self.ImageAlign := ImageAlign;
        Self.Images := Images;
        Self.Items.Assign(Items);
        Self.LargeImages := LargeImages;
        Self.MultiLineText := MultiLineText;
        Self.ShowDescriptions := ShowDescriptions;
      end;
    finally
      EndUpdate
    end
  end
  else
    inherited Assign(Source);
end;

class function TcxCustomImageComboBoxProperties.GetContainerClass: TcxContainerClass;
begin
  Result := TcxCustomImageComboBox;
end;

function TcxCustomImageComboBoxProperties.GetDisplayText(
 const AEditValue: TcxEditValue; AFullText: Boolean = False): WideString;
var
  ADisplayValue: TcxEditValue;
begin
  PrepareDisplayValue(AEditValue, ADisplayValue, False);
  Result := ADisplayValue;
end;

function TcxCustomImageComboBoxProperties.GetEditValueSource(AEditFocused: Boolean): TcxDataEditValueSource;
begin
  if (IDefaultValuesProvider <> nil) and IDefaultValuesProvider.IsDisplayFormatDefined(False) then
    Result := evsText
  else
    Result := evsValue;
end;

class function TcxCustomImageComboBoxProperties.GetLookupDataClass: TcxInterfacedPersistentClass;
begin
  Result := TcxImageComboBoxLookupData;
end;

function TcxCustomImageComboBoxProperties.GetSupportedOperations: TcxEditSupportedOperations;
begin
  Result := [esoFiltering, esoHorzAlignment, esoSorting, esoSortingByDisplayText];
  if Buttons.Count > 0 then
    Include(Result, esoHotTrack);
  if ShowDescriptions then
    Include(Result, esoIncSearch);
end;

class function TcxCustomImageComboBoxProperties.GetViewDataClass: TcxCustomEditViewDataClass;
begin
  Result := TcxImageComboBoxViewData;
end;

class function TcxCustomImageComboBoxProperties.GetViewInfoClass: TcxContainerViewInfoClass;
begin
  Result := TcxImageComboBoxViewInfo;
end;

function TcxCustomImageComboBoxProperties.IsEditValueValid(
  var AEditValue: TcxEditValue; AEditFocused: Boolean): Boolean;
begin
  Result := True;
end;

procedure TcxCustomImageComboBoxProperties.PrepareDisplayValue(
  const AEditValue: TcxEditValue; var DisplayValue: TcxEditValue;
  AEditFocused: Boolean);
var
  AItem: TcxImageComboBoxItem;
begin
  AItem := FindItemByValue(AEditValue);
  if AItem = nil then
    DisplayValue := DefaultDescription
  else
    DisplayValue := AItem.Description;
end;

{ TcxCustomImageComboBox }

function TcxCustomImageComboBox.GetProperties: TcxImageComboBoxProperties;
begin
  Result := TcxImageComboBoxProperties(InternalGetProperties)
end;

procedure TcxCustomImageComboBox.SetProperties(const Value: TcxImageComboBoxProperties);
begin
  FProperties.Assign(Value);
end;

procedure TcxCustomImageComboBox.InitializeLookupData;
begin
  inherited InitializeLookupData;
  if (LookupData <> nil) and (LookupData.ActiveControl <> nil) then
    with TcxImageComboBoxListBox(LookupData.ActiveControl) do
      FProperties := Properties;
end;

function TcxCustomImageComboBox.IsValidChar(AChar: Char): Boolean;
begin
  Result := AChar in [#32..#255];
end;

function TcxCustomImageComboBox.GetPopupWindowClientPreferredSize: TSize;
begin
  Result := inherited GetPopupWindowClientPreferredSize;
  if not Properties.MultiLineText then
  begin
    if (LookupData.ActiveControl <> nil) and (LookupData.ActiveControl is TcxImageComboBoxListBox) then
      with TcxImageComboBoxListBox(LookupData.ActiveControl) do
        Result.cx := Max(GetMaxItemWidth, Result.cx);
  end
  else
    Result.cx := 0;
end;

function TcxCustomImageComboBox.LookupKeyToEditValue(const AKey: TcxEditValue): TcxEditValue;
begin
  if not VarEqualsExact(AKey, -1) then
    Result := Properties.Items[AKey].Value
  else
    Result := Null;
end;

procedure TcxCustomImageComboBox.SynchronizeDisplayValue;
var
  APrevLookupKey: TcxEditValue;
begin
  SaveModified;
  try
    APrevLookupKey := ILookupData.CurrentKey;
    LockClick(True);
    try
      ILookupData.TextChanged;
    finally
      LockClick(False);
      if (*ModifiedAfterEnter and *)not VarEqualsExact(APrevLookupKey, ILookupData.CurrentKey) then
        DoClick;
    end;
  finally
    RestoreModified;
    ResetOnNewDisplayValue;
    UpdateDrawValue;
  end;
end;

procedure TcxCustomImageComboBox.UpdateDrawValue;
begin
  inherited UpdateDrawValue;
  SetInternalDisplayValue(ViewInfo.Text);
end;

class function TcxCustomImageComboBox.GetPropertiesClass: TcxCustomEditPropertiesClass;
begin
  Result := TcxImageComboBoxProperties;
end;

procedure TcxCustomImageComboBox.PrepareEditValue(
  const ADisplayValue: TcxEditValue; out EditValue: TcxEditValue;
  AEditFocused: Boolean);
begin
  if VarEqualsExact(LookupData.CurrentKey, -1) then
    EditValue := Null
  else
    EditValue := Properties.Items[LookupData.CurrentKey].Value;
end;

initialization
  GetRegisteredEditProperties.Register(TcxImageComboBoxProperties, scxSEditRepositoryImageComboBoxItem);

end.


