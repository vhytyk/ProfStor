
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

unit cxHyperLinkEdit;

{$I cxEdVer.inc}

interface

uses
{$IFDEF VCL}
  Messages,
{$ELSE}
  Qt, QTypes,
{$ENDIF}
{$IFDEF LINUX}
  Libc,
{$ELSE}
  Windows,
{$ENDIF}
{$IFDEF DELPHI6}
  Types,
{$ENDIF}
  SysUtils, Graphics, Classes, Controls, Menus, cxGraphics, cxContainer,
  cxControls, cxEdit, cxTextEdit;

type
  { TcxHyperLinkEditViewInfo }

  TcxHyperLinkEditViewInfo = class(TcxCustomTextEditViewInfo)
  public
    LinkColor: TColor;
    SingleClick: Boolean;
    function IsHotTrack: Boolean; override;
    procedure PrepareCanvasFont(AFont: TFont); override;
  end;

  { TcxHyperLinkEditViewData }

  TcxHyperLinkEditViewData = class(TcxCustomTextEditViewData)
  public
    procedure Calculate(ACanvas: TcxCanvas; const ABounds: TRect;
      const P: TPoint; Button: TcxMouseButton; Shift: TShiftState;
      AViewInfo: TcxCustomEditViewInfo; AIsMouseEvent: Boolean); override;
  end;

  { TcxCustomHyperLinkEditProperties }

  TcxCustomHyperLinkEditProperties = class(TcxCustomTextEditProperties)
  private
    FSingleClick: Boolean;
    FLinkColor: TColor;
    FOnStartClick: TNotifyEvent;
    FStartKey: TShortCut;
    procedure SetLinkColor(const Value: TColor);
    procedure SetSingleClick(Value: Boolean);
  protected
    property AutoSelect default False;
    property LinkColor: TColor read FLinkColor write SetLinkColor
      default clBlue;
    property SingleClick: Boolean read FSingleClick write SetSingleClick
      default False;
    property StartKey: TShortCut read FStartKey write FStartKey
      default VK_RETURN + scCtrl;
    property OnStartClick: TNotifyEvent read FOnStartClick write FOnStartClick;
  public
    constructor Create(AOwner: TPersistent); override;
    procedure Assign(Source: TPersistent); override;
    class function GetContainerClass: TcxContainerClass; override;
    function GetSupportedOperations: TcxEditSupportedOperations; override;
    class function GetViewDataClass: TcxCustomEditViewDataClass; override;
    class function GetViewInfoClass: TcxContainerViewInfoClass; override;
  end;

  { TcxHyperLinkEditProperties }

  TcxHyperLinkEditProperties = class(TcxCustomHyperLinkEditProperties)
  published
    property Alignment;
    property AutoSelect;
    property LinkColor;
    property LookupItems;
    property LookupItemsSorted;
    property ReadOnly;
    property StartKey;
    property SingleClick;
    property UseLeftAlignmentOnEditing;
    property OnChange;
    property OnEditValueChanged;
    property OnStartClick;
    property OnValidate;
  end;

  { TcxCustomHyperLinkEdit }

  TcxCustomHyperLinkEdit = class(TcxCustomTextEdit)
  private
    FSaveCursor: TCursor;
    function GetProperties: TcxHyperLinkEditProperties;
    procedure SetProperties(const Value: TcxHyperLinkEditProperties);
  protected
    procedure AdjustInnerEdit; override;
    procedure DoStart; virtual;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseEnter(AControl: TControl); override;
    procedure MouseLeave(AControl: TControl); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
  public
    procedure ActivateByMouse(Shift: TShiftState; X, Y: Integer;
      var AEditData: TcxCustomEditData); override;
    class function GetPropertiesClass: TcxCustomEditPropertiesClass; override;
    procedure SelectAll; override;
    property Properties: TcxHyperLinkEditProperties
      read GetProperties write SetProperties;
  end;

  { TcxHyperLinkEdit }

  TcxHyperLinkEdit = class(TcxCustomHyperLinkEdit)
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
    property Properties;
    property ShowHint;
    property Style;
    property TabOrder;
    property TabStop;
    property Text;
    property Visible;
    property OnClick;
    property OnDblClick;
    property OnEditing;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
  {$IFDEF VCL}
    property BiDiMode;
    property ParentBiDiMode;
    property OnEndDock;
    property OnStartDock;
  {$ENDIF}
  end;

{$IFDEF LINUX}
const
  PreferredBrowser: string = 'mozilla';
{$ENDIF}

implementation

uses
{$IFDEF WIN32}
  ShellAPI,
{$ENDIF}
  Forms,
  cxEditConsts;

{ TcxHyperLinkEditViewInfo }

function TcxHyperLinkEditViewInfo.IsHotTrack: Boolean;
begin
  Result := inherited IsHotTrack or SingleClick;
end;

procedure TcxHyperLinkEditViewInfo.PrepareCanvasFont(AFont: TFont);
begin
  inherited PrepareCanvasFont(AFont);
  AFont.Style := AFont.Style + [fsUnderline];
  if Focused then
    AFont.Color := LinkColor
  else
    if IsInplace and IsSelected then
      AFont.Color := TextColor
    else
      AFont.Color := LinkColor
end;

{ TcxHyperLinkEditViewData }

procedure TcxHyperLinkEditViewData.Calculate(ACanvas: TcxCanvas;
  const ABounds: TRect; const P: TPoint; Button: TcxMouseButton;
  Shift: TShiftState; AViewInfo: TcxCustomEditViewInfo; AIsMouseEvent: Boolean);
begin
  with TcxHyperLinkEditViewInfo(AViewInfo) do
  begin
    LinkColor := TcxHyperLinkEditProperties(Properties).LinkColor;
    SingleClick := TcxHyperLinkEditProperties(Properties).SingleClick;
  end;
  inherited Calculate(ACanvas, ABounds, P, Button, Shift, AViewInfo, AIsMouseEvent);
end;

{ TcxCustomHyperLinkEditProperties }

constructor TcxCustomHyperLinkEditProperties.Create(AOwner: TPersistent);
begin
  inherited Create(AOwner);
  AutoSelect := False;
  FLinkColor := clBlue;
  FSingleClick := False;
  FStartKey := VK_RETURN + scCtrl;
end;

procedure TcxCustomHyperLinkEditProperties.SetLinkColor(
  const Value: TColor);
begin
  if FLinkColor <> Value then
  begin
    FLinkColor := Value;
    Changed;
  end;
end;

procedure TcxCustomHyperLinkEditProperties.SetSingleClick(Value: Boolean);
begin
  if Value <> FSingleClick then
  begin
    FSingleClick := Value;
    Changed;
  end;
end;

procedure TcxCustomHyperLinkEditProperties.Assign(Source: TPersistent);
begin
  if Source is TcxCustomHyperLinkEditProperties then
  begin
    BeginUpdate;
    try
      inherited Assign(Source);
      with TcxCustomHyperLinkEditProperties(Source) do
      begin
        Self.LinkColor := LinkColor;
        Self.SingleClick := SingleClick;
        Self.StartKey := StartKey;
        Self.OnStartClick := OnStartClick;
      end;
    finally
      EndUpdate
    end
  end
  else
    inherited Assign(Source);
end;

class function TcxCustomHyperLinkEditProperties.GetContainerClass: TcxContainerClass;
begin
  Result := TcxCustomHyperLinkEdit;
end;

function TcxCustomHyperLinkEditProperties.GetSupportedOperations: TcxEditSupportedOperations;
begin
  Result := inherited GetSupportedOperations;
  if SingleClick then
   Include(Result, esoAlwaysHotTrack);
end;

class function TcxCustomHyperLinkEditProperties.GetViewDataClass: TcxCustomEditViewDataClass;
begin
  Result := TcxHyperLinkEditViewData;
end;

class function TcxCustomHyperLinkEditProperties.GetViewInfoClass: TcxContainerViewInfoClass;
begin
  Result := TcxHyperLinkEditViewInfo;
end;

{ TcxCustomHyperLinkEdit }

type
  TWinControlAccess = class(TWinControl);

procedure TcxCustomHyperLinkEdit.AdjustInnerEdit;
begin
  inherited AdjustInnerEdit;
  InnerEdit.LockBounds(True);
  try
    with TWinControlAccess(InnerTextEdit.Control) do
    begin
      Font.Style := Font.Style + [fsUnderline];
      Font.Color := Properties.LinkColor;
    end;
  finally
    InnerEdit.LockBounds(False);
  end;
end;

procedure TcxCustomHyperLinkEdit.DoStart;
begin
  if Assigned(Properties.FOnStartClick) then
    Properties.FOnStartClick(Self)
  else
    if Trim(DisplayValue) <> '' then
  {$IFDEF VCL}
    ShellExecute(0, 'OPEN', PChar(DisplayValue), nil, nil, SW_SHOWMAXIMIZED);
  {$ELSE}
    {$IFDEF LINUX}
      Libc.system(PChar(string(PreferredBrowser + ' ' + DisplayValue + '&'))); { TODO : make call to default browser }
    {$ELSE}
      ShellExecute(0, 'OPEN', PChar(string(DisplayValue)), nil, nil, SW_SHOWMAXIMIZED);
    {$ENDIF}
  {$ENDIF}
end;

function TcxCustomHyperLinkEdit.GetProperties: TcxHyperLinkEditProperties;
begin
  Result := TcxHyperLinkEditProperties(InternalGetProperties);
end;

procedure TcxCustomHyperLinkEdit.SetProperties(
  const Value: TcxHyperLinkEditProperties);
begin
  FProperties.Assign(Value);
end;

procedure TcxCustomHyperLinkEdit.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  if (ShortCut(Key, Shift) <> 0) and (Properties.StartKey = ShortCut(Key, Shift)) then
  begin
    DoStart;
    Key := 0;
  end
  else
    inherited KeyDown(Key, Shift);
end;

procedure TcxCustomHyperLinkEdit.MouseDown(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseDown(Button, Shift, X, Y);
  if (Button = mbLeft) and PtInRect(ViewInfo.ClientRect, Point(X, Y)) and
    (not Properties.SingleClick and (ssDouble in Shift)) then
      DoStart;
end;

procedure TcxCustomHyperLinkEdit.MouseEnter(AControl: TControl);
begin
  inherited MouseEnter(AControl);
  if Properties.SingleClick and (Cursor <> crHandPoint) then
  begin
    FSaveCursor := Cursor;
    InnerTextEdit.Control.Cursor := crHandPoint;
    Cursor := crHandPoint;
  end;
end;

procedure TcxCustomHyperLinkEdit.MouseLeave(AControl: TControl);
begin
  inherited MouseLeave(AControl);
  if Properties.SingleClick then
  begin
    InnerTextEdit.Control.Cursor := FSaveCursor;
    Cursor := FSaveCursor;
  end;
end;

procedure TcxCustomHyperLinkEdit.MouseUp(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseUp(Button, Shift, X, Y);
  if (Button = mbLeft) and PtInRect(ViewInfo.ClientRect, Point(X, Y)) and
    Properties.SingleClick and (SelLength = 0) then
      DoStart;
end;

class function TcxCustomHyperLinkEdit.GetPropertiesClass: TcxCustomEditPropertiesClass; 
begin
  Result := TcxHyperLinkEditProperties;
end;

procedure TcxCustomHyperLinkEdit.ActivateByMouse(Shift: TShiftState; X, Y: Integer;
  var AEditData: TcxCustomEditData);
begin
  if IsInplace and Properties.SingleClick and (Cursor <> crHandPoint) then
  begin
    FSaveCursor := Cursor;
    InnerTextEdit.Control.Cursor := crHandPoint;
    Cursor := crHandPoint;
  {$IFDEF VCL}
    SetCursor(Screen.Cursors[crHandPoint]);
  {$ENDIF}
  end;
  inherited;
end;

procedure TcxCustomHyperLinkEdit.SelectAll;
begin
  if not (IsInplace and Properties.SingleClick) then
    inherited SelectAll;
end;

initialization
  GetRegisteredEditProperties.Register(TcxHyperLinkEditProperties, scxSEditRepositoryHyperLinkItem);

end.
