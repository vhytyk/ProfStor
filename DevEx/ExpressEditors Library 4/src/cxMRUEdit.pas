
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

unit cxMRUEdit;

{$I cxEdVer.inc}

interface

uses
{$IFDEF VCL}
  Messages,
{$ELSE}
  Qt, QTypes,
{$ENDIF}
{$IFDEF DELPHI6}
  Types,
{$ENDIF}
  SysUtils, Classes, Controls, Graphics, cxContainer, cxEdit,
  cxDropDownEdit;

type
  { TcxCustomMRUEditProperties }

  TcxCustomMRUEditProperties = class(TcxCustomComboBoxProperties)
  private
    FMaxItemCount: Integer;
    FShowEllipsis: Boolean;
    FOnButtonClick: TNotifyEvent;
    procedure CheckItemCount;
    procedure SetMaxItemCount(Value: Integer);
    procedure SetShowEllipsis(Value: Boolean);
  protected
    property MaxItemCount: Integer read FMaxItemCount write SetMaxItemCount
      default 0;
    property ShowEllipsis: Boolean read FShowEllipsis write SetShowEllipsis
      default True;
    property OnButtonClick: TNotifyEvent
      read FOnButtonClick write FOnButtonClick;
  public
    constructor Create(AOwner: TPersistent); override;
    procedure Assign(Source: TPersistent); override;
    class function GetContainerClass: TcxContainerClass; override;
    procedure Update(AProperties: TcxCustomEditProperties); override;
  end;

  { TcxMRUEditProperties }

  TcxMRUEditProperties = class(TcxCustomMRUEditProperties)
  published
    property Alignment;
    property AutoSelect;
    property BeepOnError;
    property ButtonGlyph;
    property CaseInsensitive;
    property CharCase;
    property ClickKey;
    property DropDownAutoWidth;
    property DropDownListStyle;
    property DropDownRows;
    property DropDownSizeable;
    property DropDownWidth;
    property EchoMode;
    property HideSelection;
    property IgnoreMaskBlank;
    property ImmediateDropDown;
    property ImmediatePost;
    property ImmediateUpdateText;
    property ItemHeight;
    property LookupItems;
    property MaskKind;
    property EditMask;
    property MaxItemCount;
    property MaxLength;
{$IFDEF VCL}
    property OEMConvert;
{$ENDIF}
    property PopupAlignment;
    property ReadOnly;
    property Revertable;
    property ShowEllipsis;
    property UseLeftAlignmentOnEditing;
    property OnButtonClick;
    property OnChange;
    property OnCloseUp;
    property OnDrawItem;
    property OnEditValueChanged;
    property OnInitPopup;
    property OnMeasureItem;
    property OnPopup;
    property OnValidate;
  end;

  { TcxMRUEditProperties }

  TcxCustomMRUEdit = class(TcxCustomComboBox)
  private
    FSaveText: string;
    function GetProperties: TcxMRUEditProperties;
    procedure SetProperties(const Value: TcxMRUEditProperties);
  protected
    procedure BeforePosting; override;
    procedure DoButtonClick(AButtonVisibleIndex: Integer); override;
    procedure DoEnter; override;
    procedure PropertiesChanged(Sender: TObject); override;
    property Properties: TcxMRUEditProperties
      read GetProperties write SetProperties;
  public
    procedure AddItem(const Value: string); virtual;
    function Deactivate: Boolean; override;
    class function GetPropertiesClass: TcxCustomEditPropertiesClass; override;
  end;

  { TcxMRUEdit }

  TcxMRUEdit = class(TcxCustomMRUEdit)
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
    property Text;
    property Visible;
    property OnClick;
{$IFDEF DELPHI5}
    property OnContextPopup;
{$ENDIF}
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEditing;
{$IFDEF VCL}
    property OnEndDock;
{$ENDIF}
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
{$IFDEF VCL}
    property OnStartDock;
{$ENDIF}
    property OnStartDrag;
  end;

implementation

uses
  cxControls, cxEditConsts;

type
  TcxComboBoxLookupDataAccess = class(TcxComboBoxLookupData);

{ TcxCustomMRUEditProperties }

constructor TcxCustomMRUEditProperties.Create(AOwner: TPersistent);
begin
  inherited Create(AOwner);
  FMaxItemCount := 0;
  FShowEllipsis := True;
  Buttons.Add;
  GlyphButtonIndex := 1;
  Buttons[1].Kind := bkEllipsis;
  Buttons[1].Default := True;
  DropDownListStyle := lsEditList;
end;

procedure TcxCustomMRUEditProperties.CheckItemCount;
begin
  if FMaxItemCount > 0 then
    while Items.Count > FMaxItemCount do
      Items.Delete(Items.Count - 1);
end;

procedure TcxCustomMRUEditProperties.SetMaxItemCount(Value: Integer);
begin
  if Value < 0 then Value := 0;
  if FMaxItemCount <> Value then
  begin
    FMaxItemCount := Value;
    CheckItemCount;
    Changed;
  end;
end;

procedure TcxCustomMRUEditProperties.SetShowEllipsis(Value: Boolean);
begin
  if FShowEllipsis <> Value then
  try
    BeginUpdate;
    FShowEllipsis := Value;
    Buttons[1].Visible := Value;
    if Value then
      GlyphButtonIndex := 1
    else
      GlyphButtonIndex := 0;
  finally
    EndUpdate;
  end;
end;

procedure TcxCustomMRUEditProperties.Assign(Source: TPersistent);
begin
  if Source is TcxCustomMRUEditProperties then
  begin
    BeginUpdate;
    try
      inherited Assign(Source);
      with TcxCustomMRUEditProperties(Source) do
      begin
        Self.MaxItemCount := MaxItemCount;
        Self.ShowEllipsis := ShowEllipsis;
        Self.OnButtonClick := OnButtonClick;
      end;
    finally
      EndUpdate
    end
  end
  else
    inherited Assign(Source);
end;

class function TcxCustomMRUEditProperties.GetContainerClass: TcxContainerClass;
begin
  Result := TcxCustomMRUEdit;
end;

procedure TcxCustomMRUEditProperties.Update(AProperties: TcxCustomEditProperties);
begin
  if AProperties is TcxCustomMRUEditProperties then
    TcxCustomMRUEditProperties(AProperties).LookupItems.Assign(LookupItems);
end;

{ TcxCustomMRUEdit }

function TcxCustomMRUEdit.GetProperties: TcxMRUEditProperties;
begin
  Result := TcxMRUEditProperties(InternalGetProperties)
end;

procedure TcxCustomMRUEdit.SetProperties(
  const Value: TcxMRUEditProperties);
begin
  FProperties.Assign(Value);
end;

procedure TcxCustomMRUEdit.BeforePosting;
begin
  inherited BeforePosting;
  if not LookupItemsScrolling and CanModify then
    AddItem(Text);
end;

procedure TcxCustomMRUEdit.DoButtonClick(AButtonVisibleIndex: Integer);
begin
  if (AButtonVisibleIndex = 1) and Assigned(Properties.FOnButtonClick) then
    Properties.FOnButtonClick(Self);
end;

procedure TcxCustomMRUEdit.DoEnter;
begin
  inherited DoEnter;
  FSaveText := Text;
end;

procedure TcxCustomMRUEdit.PropertiesChanged(Sender: TObject);
begin
  with Properties do
    if ShowEllipsis then
      if ButtonGlyph.Empty then
        Buttons[1].Kind := bkEllipsis
      else
        Buttons[1].Kind := bkGlyph
    else
      if ButtonGlyph.Empty then
        Buttons[0].Kind := bkDown
      else
        Buttons[0].Kind := bkGlyph;
  inherited PropertiesChanged(Sender);
end;

procedure TcxCustomMRUEdit.AddItem(const Value: string);
var
  I: Integer;
begin
  if Value = '' then Exit;
  with TcxComboBoxLookupDataAccess(LookupData) do
  begin
    I := Items.IndexOf(Value);
    if I = -1 then
    begin
      Items.Insert(0, Value);
      Self.Properties.CheckItemCount;
    end
    else
      Items.Move(I, 0);
  end;
end;

function TcxCustomMRUEdit.Deactivate: Boolean;
begin
  Result := inherited Deactivate;
  if (CompareStr(FSaveText, Text) <> 0) and CanModify then
    AddItem(Text);
end;

class function TcxCustomMRUEdit.GetPropertiesClass: TcxCustomEditPropertiesClass; 
begin
  Result := TcxMRUEditProperties;
end;

initialization
  GetRegisteredEditProperties.Register(TcxMRUEditProperties, scxSEditRepositoryMRUItem);

end.

