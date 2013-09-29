{*******************************************************************}
{                                                                   }
{       Developer Express Visual Component Library                  }
{       ExpressNavBar                                               }
{                                                                   }
{       Copyright (c) 2002-2003 Developer Express Inc.              }
{       ALL RIGHTS RESERVED                                         }
{                                                                   }
{   The entire contents of this file is protected by U.S. and       }
{   International Copyright Laws. Unauthorized reproduction,        }
{   reverse-engineering, and distribution of all or any portion of  }
{   the code contained in this file is strictly prohibited and may  }
{   result in severe civil and criminal penalties and will be       }
{   prosecuted to the maximum extent possible under the law.        }
{                                                                   }
{   RESTRICTIONS                                                    }
{                                                                   }
{   THIS SOURCE CODE AND ALL RESULTING INTERMEDIATE FILES           }
{   (DCU, OBJ, DLL, ETC.) ARE CONFIDENTIAL AND PROPRIETARY TRADE    }
{   SECRETS OF DEVELOPER EXPRESS INC. THE REGISTERED DEVELOPER IS   }
{   LICENSED TO DISTRIBUTE THE EXPRESSBARS AND ALL ACCOMPANYING VCL }
{   CONTROLS AS PART OF AN EXECUTABLE PROGRAM ONLY.                 }
{                                                                   }
{   THE SOURCE CODE CONTAINED WITHIN THIS FILE AND ALL RELATED      }
{   FILES OR ANY PORTION OF ITS CONTENTS SHALL AT NO TIME BE        }
{   COPIED, TRANSFERRED, SOLD, DISTRIBUTED, OR OTHERWISE MADE       }
{   AVAILABLE TO OTHER INDIVIDUALS WITHOUT EXPRESS WRITTEN CONSENT  }
{   AND PERMISSION FROM DEVELOPER EXPRESS INC.                      }
{                                                                   }
{   CONSULT THE END USER LICENSE AGREEMENT FOR INFORMATION ON       }
{   ADDITIONAL RESTRICTIONS.                                        }
{                                                                   }
{*******************************************************************}

unit dxNavBarStyles;

{$I dxNavBarVer.inc}

interface

uses
  Classes, Graphics, jpeg, dxNavBarBase;

type
  TdxBarStyleHAlignment = (haLeft, haCenter, haRight);
  TdxBarStyleVAlignment = (vaTop, vaCenter, vaBottom);
  TdxBarStyleAssignedValue = (savAlphaBlending, savAlphaBlending2, savBackColor, savBackColor2, savFont, savGradientMode,
      savHAlignment, savVAlignment, savImage);
  TdxBarStyleAssignedValues = set of TdxBarStyleAssignedValue;
  TdxBarStyleGradientMode = (gmHorizontal, gmVertical, gmForwardDiagonal, gmBackwardDiagonal);

  TdxBaseNavBarStyleChangeEvent = procedure (Sender: TObject; AType: TdxNavBarChangeType) of object;
  TdxBaseNavBarStyle = class(TPersistent)
  private
    FOwner: TPersistent;
    FAlphaBlending: Byte;
    FAlphaBlending2: Byte;
    FAssignedValues: TdxBarStyleAssignedValues;
    FBackColor: TColor;
    FBackColor2: TColor;
    FGradientMode: TdxBarStyleGradientMode;
    FFont: TFont;
    FImage: TPicture;
    FHAlignment: TdxBarStyleHAlignment;
    FVAlignment: TdxBarStyleVAlignment;
    FOnChange: TdxBaseNavBarStyleChangeEvent;

    procedure SetAlphaBlending(const Value: Byte);
    procedure SetAlphaBlending2(const Value: Byte);
    procedure SetAssignedValues(const Value: TdxBarStyleAssignedValues);
    procedure SetBackColor(const Value: TColor);
    procedure SetBackColor2(const Value: TColor);
    procedure SetFont(const Value: TFont);
    procedure SetGradientMode(const Value: TdxBarStyleGradientMode);
    procedure SetHAlignment(const Value: TdxBarStyleHAlignment);
    procedure SetImage(const Value: TPicture);
    procedure SetVAlignment(const Value: TdxBarStyleVAlignment);
  protected
    function GetOwner: TPersistent; override;
    function CanAssignValue: Boolean; virtual;
    procedure Changed(AType: TdxNavBarChangeType); virtual;
    procedure FontChanged(Sender: TObject);
    procedure ImageChanged(Sender: TObject);
  public
    constructor Create(AOwner: TPersistent);
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    property AssignedValues: TdxBarStyleAssignedValues read FAssignedValues write SetAssignedValues default [];
  published
    property AlphaBlending: Byte read FAlphaBlending write SetAlphaBlending default 255;
    property AlphaBlending2: Byte read FAlphaBlending2 write SetAlphaBlending2 default 255;
    property BackColor: TColor read FBackColor write SetBackColor;
    property BackColor2: TColor read FBackColor2 write SetBackColor2;
    property GradientMode: TdxBarStyleGradientMode  read FGradientMode write SetGradientMode default gmHorizontal;
    property Font: TFont read FFont write SetFont;
    property Image: TPicture read FImage write SetImage;
    property HAlignment: TdxBarStyleHAlignment read FHAlignment write SetHAlignment default haCenter;
    property VAlignment: TdxBarStyleVAlignment read FVAlignment write SetVAlignment default vaCenter;
    property OnChange: TdxBaseNavBarStyleChangeEvent read FOnChange write FOnChange;
  end;

  TdxNavBarDefaultStyleAssignProc = procedure of object;
  TdxNavBarDefaultStyles = class;
  TdxNavBarDefaultStyle = class(TdxBaseNavBarStyle)
  private
    FDefaultValues: Boolean;
    FDefaultValuesProc: TdxNavBarDefaultStyleAssignProc;
    function GetCollection: TdxNavBarDefaultStyles;
  protected
    procedure Changed(AType: TdxNavBarChangeType); override;
    procedure AssignDefaultValues(CheckDefault: Boolean);
    property DefaultValuesProc: TdxNavBarDefaultStyleAssignProc read FDefaultValuesProc write FDefaultValuesProc;
  public
    constructor Create(AOwner: TPersistent);
    property Collection: TdxNavBarDefaultStyles read GetCollection;
    property DefaultValues: Boolean read FDefaultValues write FDefaultValues;
  end;

  TdxNavBarDefaultStyles = class(TPersistent)
  private
    FDefaultStyles: TList;
    FOwner: TPersistent;
    FUpdateCount: Integer;
    FOnChange: TdxNavBarChangeEvent;

    function IsDefaultStyleStored(Index: Integer): Boolean;
    function GetDefaultStyle(Index: Integer): TdxNavBarDefaultStyle;
    procedure SetDefaultStyle(Index: Integer; const Value: TdxNavBarDefaultStyle);
  protected
    procedure AssignDefaultBackgroundStyle;
    procedure AssignDefaultButtonStyle;
    procedure AssignDefaultButtonPressedStyle;
    procedure AssignDefaultButtonHotTrackedStyle;
    procedure AssignDefaultGroupBackgroundStyle;
    procedure AssignDefaultGroupHeaderStyle;
    procedure AssignDefaultGroupHeaderActiveStyle;
    procedure AssignDefaultGroupHeaderHotTrackedStyle;
    procedure AssignDefaultGroupHeaderPressedStyle;
    procedure AssignDefaultHintStyle;
    procedure AssignDefaultItemStyle;
    procedure AssignDefaultItemDisabledStyle;
    procedure AssignDefaultItemHotTrackedStyle;
    procedure AssignDefaultItemPressedStyle;
    procedure AssignDefaultDropTargetGroupStyle;
    procedure AssignDefaultDropTargetLinkStyle;

    procedure CreateDefaultStyleList; virtual;
    procedure DestroyDefaultStyleList; virtual;
    function GetOwner: TPersistent; override;
    procedure OnStyleChange(Sender: TObject; AType: TdxNavBarChangeType);
  public
    constructor Create(AOwner: TPersistent); virtual;
    destructor Destroy; override;

    procedure Assign(Source: TPersistent); override;
    procedure AssignDefaultValues(CheckDefault: Boolean);
    procedure BeginUpdate;
    procedure EndUpdate;
  published
    property Background: TdxNavBarDefaultStyle index 0 read GetDefaultStyle write SetDefaultStyle stored IsDefaultStyleStored;
    property Button: TdxNavBarDefaultStyle index 1 read GetDefaultStyle write SetDefaultStyle stored IsDefaultStyleStored;
    property ButtonPressed: TdxNavBarDefaultStyle index 2 read GetDefaultStyle write SetDefaultStyle stored IsDefaultStyleStored;
    property ButtonHotTracked: TdxNavBarDefaultStyle index 3 read GetDefaultStyle write SetDefaultStyle stored IsDefaultStyleStored;
    property GroupBackground: TdxNavBarDefaultStyle index 4 read GetDefaultStyle write SetDefaultStyle stored IsDefaultStyleStored;
    property GroupHeader: TdxNavBarDefaultStyle index 5 read GetDefaultStyle write SetDefaultStyle stored IsDefaultStyleStored;
    property GroupHeaderActive: TdxNavBarDefaultStyle index 6 read GetDefaultStyle write SetDefaultStyle stored IsDefaultStyleStored;
    property GroupHeaderHotTracked: TdxNavBarDefaultStyle index 7 read GetDefaultStyle write SetDefaultStyle stored IsDefaultStyleStored;
    property GroupHeaderPressed: TdxNavBarDefaultStyle index 8 read GetDefaultStyle write SetDefaultStyle stored IsDefaultStyleStored;
    property Hint: TdxNavBarDefaultStyle index 9 read GetDefaultStyle write SetDefaultStyle stored IsDefaultStyleStored;
    property Item: TdxNavBarDefaultStyle index 10 read GetDefaultStyle write SetDefaultStyle stored IsDefaultStyleStored;
    property ItemDisabled: TdxNavBarDefaultStyle index 11 read GetDefaultStyle write SetDefaultStyle stored IsDefaultStyleStored;
    property ItemHotTracked: TdxNavBarDefaultStyle index 12 read GetDefaultStyle write SetDefaultStyle stored IsDefaultStyleStored;
    property ItemPressed: TdxNavBarDefaultStyle index 13 read GetDefaultStyle write SetDefaultStyle stored IsDefaultStyleStored;
    property DropTargetGroup: TdxNavBarDefaultStyle index 14 read GetDefaultStyle write SetDefaultStyle stored IsDefaultStyleStored;
    property DropTargetLink: TdxNavBarDefaultStyle index 15 read GetDefaultStyle write SetDefaultStyle stored IsDefaultStyleStored;
    property OnChange: TdxNavBarChangeEvent read FOnChange write FOnChange;
  end;

  TdxNavBarStyle = class(TdxBaseNavBarStyle)
  published
    property AssignedValues;
  end;

  TdxNavBarStyleItem = class(TdxNavBarComponentCollectionItem)
  private
    FStyle: TdxNavBarStyle;
    procedure SetStyle(const Value: TdxNavBarStyle);
  protected
    procedure ReadState(Reader: TReader); override;
    procedure SetName(const NewName: TComponentName); override;
    procedure SetParentComponent(AParent: TComponent); override;

    procedure OnStyleChange(Sender: TObject; AType: TdxNavBarChangeType);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Style: TdxNavBarStyle read FStyle write SetStyle;
  end;

  TdxNavBarStyles = class(TdxNavBarComponentCollection)
  protected
    function GetItem(Index: Integer): TdxNavBarStyleItem;
    procedure SetItem(Index: Integer; Value: TdxNavBarStyleItem);
  public
    function Add: TdxNavBarStyleItem;
    property Items[Index: Integer]: TdxNavBarStyleItem read GetItem write SetItem; default;
  end;


implementation

uses
  dxNavBar;

type
  TdxCustomNavBarAccess = class(TdxCustomNavBar);

{ TdxNavBarStyle }

constructor TdxBaseNavBarStyle.Create(AOwner: TPersistent);
begin
  FOwner := AOwner;
  FBackColor := clWhite;
  FBackColor2 := clWhite;
  FAlphaBlending := 255;
  FAlphaBlending2 := 255;
  FHAlignment := haLeft;
  FVAlignment := vaCenter;
  FFont := TFont.Create;
  FFont.OnChange := FontChanged;
  FImage := TPicture.Create;
  FImage.OnChange := ImageChanged;
end;

destructor TdxBaseNavBarStyle.Destroy;
begin
  FImage.Free;
  FFont.Free;
  inherited Destroy;
end;

procedure TdxBaseNavBarStyle.Assign(Source: TPersistent);
begin
  if Source is TdxBaseNavBarStyle then
  begin
    FAlphaBlending := TdxBaseNavBarStyle(Source).AlphaBlending;
    FAlphaBlending2 := TdxBaseNavBarStyle(Source).AlphaBlending2;
    FBackColor := TdxBaseNavBarStyle(Source).BackColor;
    FBackColor2 := TdxBaseNavBarStyle(Source).BackColor2;
    FGradientMode := TdxBaseNavBarStyle(Source).GradientMode;
    FFont.Assign(TdxBaseNavBarStyle(Source).Font);
    FImage.Assign(TdxBaseNavBarStyle(Source).Image);
    FHAlignment := TdxBaseNavBarStyle(Source).HAlignment;
    FVAlignment := TdxBaseNavBarStyle(Source).VAlignment;
    FAssignedValues := TdxBaseNavBarStyle(Source).AssignedValues;
  end
  else inherited Assign(Source);
end;

function TdxBaseNavBarStyle.GetOwner: TPersistent;
begin
  Result := FOwner;
end;

function TdxBaseNavBarStyle.CanAssignValue: Boolean;
begin
  Result := True;
end;

procedure TdxBaseNavBarStyle.Changed(AType: TdxNavBarChangeType);
begin
  if Assigned(FOnChange) then FOnChange(Self, AType);
end;

procedure TdxBaseNavBarStyle.FontChanged(Sender: TObject);
begin
  if CanAssignValue then
    Include(FAssignedValues, savFont);
  Changed(doRecalc);
end;

procedure TdxBaseNavBarStyle.ImageChanged(Sender: TObject);
begin
  if CanAssignValue then
    Include(FAssignedValues, savImage);
  Changed(doRecalc);
end;

procedure TdxBaseNavBarStyle.SetAlphaBlending(const Value: Byte);
begin
  if FAlphaBlending <> Value then
  begin
    FAlphaBlending := Value;
    if CanAssignValue then
      Include(FAssignedValues, savAlphaBlending);
    Changed(doRedraw);
  end;
end;

procedure TdxBaseNavBarStyle.SetAlphaBlending2(const Value: Byte);
begin
  if FAlphaBlending2 <> Value then
  begin
    FAlphaBlending2 := Value;
    if CanAssignValue then
      Include(FAssignedValues, savAlphaBlending2);
    Changed(doRedraw);
  end;
end;

procedure TdxBaseNavBarStyle.SetAssignedValues(const Value: TdxBarStyleAssignedValues);
begin
  if FAssignedValues <> Value then
  begin
    FAssignedValues := Value;
    Changed(doRecalc);
  end;
end;

procedure TdxBaseNavBarStyle.SetBackColor(const Value: TColor);
begin
  if FBackColor <> Value then
  begin
    FBackColor := Value;
    if CanAssignValue then
      Include(FAssignedValues, savBackColor);
    Changed(doRedraw);
  end;
end;

procedure TdxBaseNavBarStyle.SetBackColor2(const Value: TColor);
begin
  if FBackColor2 <> Value then
  begin
    FBackColor2 := Value;
    if CanAssignValue then
      Include(FAssignedValues, savBackColor2);
    Changed(doRedraw);
  end;
end;

procedure TdxBaseNavBarStyle.SetFont(const Value: TFont);
begin
  FFont.Assign(Value);
  if CanAssignValue then
    Include(FAssignedValues, savFont);
  Changed(doRecalc);
end;

procedure TdxBaseNavBarStyle.SetGradientMode(const Value: TdxBarStyleGradientMode);
begin
  if FGradientMode <> Value then
  begin
    FGradientMode := Value;
    if CanAssignValue then
      Include(FAssignedValues, savGradientMode);
    Changed(doRedraw);
  end;
end;

procedure TdxBaseNavBarStyle.SetHAlignment(const Value: TdxBarStyleHAlignment);
begin
  if FHAlignment <> Value then
  begin
    FHAlignment := Value;
    if CanAssignValue then
      Include(FAssignedValues, savHAlignment);
    Changed(doRedraw);
  end;
end;

procedure TdxBaseNavBarStyle.SetImage(const Value: TPicture);
begin
  FImage.Assign(Value);
  Changed(doRecalc);
end;

procedure TdxBaseNavBarStyle.SetVAlignment(const Value: TdxBarStyleVAlignment);
begin
  if FVAlignment <> Value then
  begin
    FVAlignment := Value;
    if CanAssignValue then
      Include(FAssignedValues, savVAlignment);
    Changed(doRedraw);
  end;
end;

{ TdxNavBarDefaultStyle }

constructor TdxNavBarDefaultStyle.Create(AOwner: TPersistent);
begin
  inherited;
  FDefaultValues := True;
end;

procedure TdxNavBarDefaultStyle.Changed(AType: TdxNavBarChangeType);
begin
  inherited;
  DefaultValues := False;
end;

procedure TdxNavBarDefaultStyle.AssignDefaultValues(CheckDefault: Boolean);
begin
  if Assigned(FDefaultValuesProc) and (DefaultValues or not CheckDefault) then
  begin
    FDefaultValuesProc;
    FDefaultValues := True;
  end;
end;

function TdxNavBarDefaultStyle.GetCollection: TdxNavBarDefaultStyles;
begin
  if FOwner is TdxNavBarDefaultStyles then
    Result := FOwner as TdxNavBarDefaultStyles
  else Result := nil;
end;

{ TdxNavBarDefaultStyles }

constructor TdxNavBarDefaultStyles.Create(AOwner: TPersistent);
begin
  FOwner := AOwner;
  FUpdateCount := 0;
  FDefaultStyles := TList.Create;
  CreateDefaultStyleList;
end;

destructor TdxNavBarDefaultStyles.Destroy;
begin
  DestroyDefaultStyleList;
  FDefaultStyles.Free;
  inherited Destroy;
end;

procedure TdxNavBarDefaultStyles.Assign(Source: TPersistent);
begin
  if Source is TdxNavBarDefaultStyles then
  begin
    Background.Assign((Source as TdxNavBarDefaultStyles).Background);
    Button.Assign((Source as TdxNavBarDefaultStyles).Button);
    ButtonPressed.Assign((Source as TdxNavBarDefaultStyles).ButtonPressed);
    ButtonHotTracked.Assign((Source as TdxNavBarDefaultStyles).ButtonHotTracked);
    GroupBackground.Assign((Source as TdxNavBarDefaultStyles).GroupBackground);
    GroupHeader.Assign((Source as TdxNavBarDefaultStyles).GroupHeader);
    GroupHeaderActive.Assign((Source as TdxNavBarDefaultStyles).GroupHeaderActive);
    GroupHeaderHotTracked.Assign((Source as TdxNavBarDefaultStyles).GroupHeaderHotTracked);
    GroupHeaderPressed.Assign((Source as TdxNavBarDefaultStyles).GroupHeaderPressed);
    Hint.Assign((Source as TdxNavBarDefaultStyles).Hint);
    Item.Assign((Source as TdxNavBarDefaultStyles).Item);
    ItemDisabled.Assign((Source as TdxNavBarDefaultStyles).ItemDisabled);
    ItemHotTracked.Assign((Source as TdxNavBarDefaultStyles).ItemHotTracked);
    ItemPressed.Assign((Source as TdxNavBarDefaultStyles).ItemPressed);
    DropTargetGroup.Assign((Source as TdxNavBarDefaultStyles).DropTargetGroup);
    DropTargetLink.Assign((Source as TdxNavBarDefaultStyles).DropTargetLink);
  end
  else inherited;
end;

procedure TdxNavBarDefaultStyles.AssignDefaultValues(CheckDefault: Boolean);
var
  I: Integer;
begin
  BeginUpdate;
  try
    for I := 0 to FDefaultStyles.Count - 1 do
      TdxNavBarDefaultStyle(FDefaultStyles[I]).AssignDefaultValues(CheckDefault);
  finally
    EndUpdate;
  end;
end;

procedure TdxNavBarDefaultStyles.BeginUpdate;
begin
  Inc(FUpdateCount);
end;

procedure TdxNavBarDefaultStyles.EndUpdate;
begin
  Dec(FUpdateCount);
end;

procedure TdxNavBarDefaultStyles.AssignDefaultBackgroundStyle;
begin
  TdxCustomNavBarAccess(FOwner).Painter.AssignDefaultBackgroundStyle;
end;

procedure TdxNavBarDefaultStyles.AssignDefaultButtonStyle;
begin
  TdxCustomNavBarAccess(FOwner).Painter.AssignDefaultButtonStyle;
end;

procedure TdxNavBarDefaultStyles.AssignDefaultButtonPressedStyle;
begin
  TdxCustomNavBarAccess(FOwner).Painter.AssignDefaultButtonPressedStyle;
end;

procedure TdxNavBarDefaultStyles.AssignDefaultButtonHotTrackedStyle;
begin
  TdxCustomNavBarAccess(FOwner).Painter.AssignDefaultButtonHotTrackedStyle;
end;

procedure TdxNavBarDefaultStyles.AssignDefaultGroupBackgroundStyle;
begin
  TdxCustomNavBarAccess(FOwner).Painter.AssignDefaultGroupBackgroundStyle;
end;

procedure TdxNavBarDefaultStyles.AssignDefaultGroupHeaderStyle;
begin
  TdxCustomNavBarAccess(FOwner).Painter.AssignDefaultGroupHeaderStyle;
end;

procedure TdxNavBarDefaultStyles.AssignDefaultGroupHeaderActiveStyle;
begin
  TdxCustomNavBarAccess(FOwner).Painter.AssignDefaultGroupHeaderActiveStyle;
end;

procedure TdxNavBarDefaultStyles.AssignDefaultGroupHeaderHotTrackedStyle;
begin
  TdxCustomNavBarAccess(FOwner).Painter.AssignDefaultGroupHeaderHotTrackedStyle;
end;

procedure TdxNavBarDefaultStyles.AssignDefaultGroupHeaderPressedStyle;
begin
  TdxCustomNavBarAccess(FOwner).Painter.AssignDefaultGroupHeaderPressedStyle;
end;

procedure TdxNavBarDefaultStyles.AssignDefaultHintStyle;
begin
  TdxCustomNavBarAccess(FOwner).Painter.AssignDefaultHintStyle;
end;

procedure TdxNavBarDefaultStyles.AssignDefaultItemStyle;
begin
  TdxCustomNavBarAccess(FOwner).Painter.AssignDefaultItemStyle;
end;

procedure TdxNavBarDefaultStyles.AssignDefaultItemDisabledStyle;
begin
  TdxCustomNavBarAccess(FOwner).Painter.AssignDefaultItemDisabledStyle;
end;

procedure TdxNavBarDefaultStyles.AssignDefaultItemHotTrackedStyle;
begin
  TdxCustomNavBarAccess(FOwner).Painter.AssignDefaultItemHotTrackedStyle;
end;

procedure TdxNavBarDefaultStyles.AssignDefaultItemPressedStyle;
begin
  TdxCustomNavBarAccess(FOwner).Painter.AssignDefaultItemPressedStyle;
end;

procedure TdxNavBarDefaultStyles.AssignDefaultDropTargetGroupStyle;
begin
  TdxCustomNavBarAccess(FOwner).Painter.AssignDefaultDropTargetGroupStyle;
end;

procedure TdxNavBarDefaultStyles.AssignDefaultDropTargetLinkStyle;
begin
  TdxCustomNavBarAccess(FOwner).Painter.AssignDefaultDropTargetLinkStyle;
end;

procedure TdxNavBarDefaultStyles.CreateDefaultStyleList;
begin
  FDefaultStyles.Add(TdxNavBarDefaultStyle.Create(Self));
  Background.OnChange := OnStyleChange;
  Background.DefaultValuesProc := AssignDefaultBackgroundStyle;
  FDefaultStyles.Add(TdxNavBarDefaultStyle.Create(Self));
  Button.OnChange := OnStyleChange;
  Button.DefaultValuesProc := AssignDefaultButtonStyle;
  FDefaultStyles.Add(TdxNavBarDefaultStyle.Create(Self));
  ButtonPressed.OnChange := OnStyleChange;
  ButtonPressed.DefaultValuesProc := AssignDefaultButtonPressedStyle;
  FDefaultStyles.Add(TdxNavBarDefaultStyle.Create(Self));
  ButtonHotTracked.OnChange := OnStyleChange;
  ButtonHotTracked.DefaultValuesProc := AssignDefaultButtonHotTrackedStyle;
  FDefaultStyles.Add(TdxNavBarDefaultStyle.Create(Self));
  GroupBackground.OnChange := OnStyleChange;
  GroupBackground.DefaultValuesProc := AssignDefaultGroupBackgroundStyle;
  FDefaultStyles.Add(TdxNavBarDefaultStyle.Create(Self));
  GroupHeader.OnChange := OnStyleChange;
  GroupHeader.DefaultValuesProc := AssignDefaultGroupHeaderStyle;
  FDefaultStyles.Add(TdxNavBarDefaultStyle.Create(Self));
  GroupHeaderActive.OnChange := OnStyleChange;
  GroupHeaderActive.DefaultValuesProc := AssignDefaultGroupHeaderActiveStyle;
  FDefaultStyles.Add(TdxNavBarDefaultStyle.Create(Self));
  GroupHeaderHotTracked.OnChange := OnStyleChange;
  GroupHeaderHotTracked.DefaultValuesProc := AssignDefaultGroupHeaderHotTrackedStyle;
  FDefaultStyles.Add(TdxNavBarDefaultStyle.Create(Self));
  GroupHeaderPressed.OnChange := OnStyleChange;
  GroupHeaderPressed.DefaultValuesProc := AssignDefaultGroupHeaderPressedStyle;
  FDefaultStyles.Add(TdxNavBarDefaultStyle.Create(Self));
  Hint.OnChange := OnStyleChange;
  Hint.DefaultValuesProc := AssignDefaultHintStyle;
  FDefaultStyles.Add(TdxNavBarDefaultStyle.Create(Self));
  Item.OnChange := OnStyleChange;
  Item.DefaultValuesProc := AssignDefaultItemStyle;
  FDefaultStyles.Add(TdxNavBarDefaultStyle.Create(Self));
  ItemDisabled.OnChange := OnStyleChange;
  ItemDisabled.DefaultValuesProc := AssignDefaultItemDisabledStyle;
  FDefaultStyles.Add(TdxNavBarDefaultStyle.Create(Self));
  ItemHotTracked.OnChange := OnStyleChange;
  ItemHotTracked.DefaultValuesProc := AssignDefaultItemHotTrackedStyle;
  FDefaultStyles.Add(TdxNavBarDefaultStyle.Create(Self));
  ItemPressed.OnChange := OnStyleChange;
  ItemPressed.DefaultValuesProc := AssignDefaultItemPressedStyle;
  FDefaultStyles.Add(TdxNavBarDefaultStyle.Create(Self));
  DropTargetGroup.OnChange := OnStyleChange;
  DropTargetGroup.DefaultValuesProc := AssignDefaultDropTargetGroupStyle;
  FDefaultStyles.Add(TdxNavBarDefaultStyle.Create(Self));
  DropTargetLink.OnChange := OnStyleChange;
  DropTargetLink.DefaultValuesProc := AssignDefaultDropTargetLinkStyle;
end;

procedure TdxNavBarDefaultStyles.DestroyDefaultStyleList;
var
  I: Integer;
begin
  for I := 0 to FDefaultStyles.Count - 1 do
    TdxNavBarDefaultStyle(FDefaultStyles[I]).Free;
  FDefaultStyles.Clear;
end;

function TdxNavBarDefaultStyles.GetOwner: TPersistent;
begin
  Result := FOwner;
end;

procedure TdxNavBarDefaultStyles.OnStyleChange(Sender: TObject; AType: TdxNavBarChangeType);
begin
  if FUpdateCount = 0 then
    if Assigned(FOnChange) then FOnChange(Self, AType);
end;

function TdxNavBarDefaultStyles.IsDefaultStyleStored(Index: Integer): Boolean;
begin
  Result := not TdxNavBarDefaultStyle(FDefaultStyles[Index]).DefaultValues;
end;

function TdxNavBarDefaultStyles.GetDefaultStyle(Index: Integer): TdxNavBarDefaultStyle;
begin
  Result := TdxNavBarDefaultStyle(FDefaultStyles[Index]);
end;

procedure TdxNavBarDefaultStyles.SetDefaultStyle(Index: Integer; const Value: TdxNavBarDefaultStyle);
begin
  TdxNavBarDefaultStyle(FDefaultStyles[Index]).Assign(Value);
end;

{ TdxBarStyleItem }

constructor TdxNavBarStyleItem.Create(AOwner: TComponent);
begin
  inherited;
  FStyle := TdxNavBarStyle.Create(Self);
  FStyle.OnChange := OnStyleChange;
end;

destructor TdxNavBarStyleItem.Destroy;
begin
  FStyle.Free;
  inherited;
end;

procedure TdxNavBarStyleItem.ReadState(Reader: TReader);
begin
  inherited ReadState(Reader);
  if Reader.Parent is TdxCustomNavBar then
    AddToCollection(TdxCustomNavBar(Reader.Parent).Styles);
end;

procedure TdxNavBarStyleItem.SetName(const NewName: TComponentName);
begin
  inherited;
  if (Collection <> nil) then
    TdxCustomNavBarAccess(Collection.Owner).DesignerUpdate(Self);
end;

procedure TdxNavBarStyleItem.SetParentComponent(AParent: TComponent);
begin
  if not (csLoading in ComponentState) then
    if AParent is TdxCustomNavBar then
    begin
      if Collection <> nil then
        RemoveFromCollection(Collection);
      AddToCollection(TdxCustomNavBar(AParent).Styles);
    end;
end;

procedure TdxNavBarStyleItem.OnStyleChange(Sender: TObject; AType: TdxNavBarChangeType);
begin
  Changed(AType);
end;

procedure TdxNavBarStyleItem.SetStyle(const Value: TdxNavBarStyle);
begin
  FStyle.Assign(Value);
  Changed(doRecalc);
end;

{ TdxBarStyles }

function TdxNavBarStyles.Add: TdxNavBarStyleItem;
begin
  Result := inherited Add as TdxNavBarStyleItem;
end;

function TdxNavBarStyles.GetItem(Index: Integer): TdxNavBarStyleItem;
begin
  Result := inherited GetItem(Index) as TdxNavBarStyleItem;
end;

procedure TdxNavBarStyles.SetItem(Index: Integer; Value: TdxNavBarStyleItem);
begin
  inherited SetItem(Index, Value);
end;

initialization
  RegisterClasses([TBitmap, TJPegImage, TIcon, TMetaFile, TdxNavBarStyleItem]);

end.