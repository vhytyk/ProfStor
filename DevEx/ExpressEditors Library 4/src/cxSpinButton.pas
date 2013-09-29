
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

unit cxSpinButton;

{$I cxExtEdVer.inc}

interface

uses
{$IFDEF WIN32}
  Windows, Messages,
{$ENDIF}
{$IFNDEF VCL}
  Types, Qt, QTypes,
{$ENDIF}
{$IFDEF DELPHI6}
  Variants,
{$ENDIF}
  Classes, Controls, Forms, Graphics, SysUtils, cxClasses, cxContainer, StdCtrls,
  cxControls, cxCustomData, cxEdit, cxGraphics, cxMaskEdit, cxTextEdit, cxSpinEdit,
  cxVariants, cxExtEditConsts, cxExtEditUtils;

type
  { TcxSpinButtonViewInfo }
  TcxSpinButtonViewInfo = class(TcxSpinEditViewInfo)
  public
    procedure DrawButtonBorder(ACanvas: TcxCanvas; AButtonVisibleIndex: Integer;
      AButtonStyle: TcxEditButtonStyle; const ARect: TRect); override;
    procedure DrawButtonContent(ACanvas: TcxCanvas; AButtonVisibleIndex: Integer;
      const AContentRect: TRect; APenColor: TColor; ABrushColor: TColor); override;
    procedure Paint(ACanvas: TcxCanvas); override;
  end;

  { TcxSpinButtonViewData }
  TcxCustomSpinButtonProperties = class;
  TcxSpinButtonViewData = class(TcxSpinEditViewData)
  private
    function GetProperties: TcxCustomSpinButtonProperties;
    procedure SetProperties(Value: TcxCustomSpinButtonProperties);
  protected
    function CanPressButton(AViewInfo: TcxCustomEditViewInfo; AButtonVisibleIndex: Integer):
      Boolean; override;
    function IsButtonPressed(AViewInfo: TcxCustomEditViewInfo; AButtonVisibleIndex:
      Integer): Boolean; override;
  public
    PressedState: TcxSpinEditPressedState;
    procedure Calculate(ACanvas: TcxCanvas; const ABounds: TRect; const P: TPoint;
      Button: TcxMouseButton; Shift: TShiftState; AViewInfo: TcxCustomEditViewInfo;
      AIsMouseEvent: Boolean); override;
    property Properties: TcxCustomSpinButtonProperties read GetProperties write SetProperties;
  end;

  { TcxCustomSpinButtonProperties }
  TcxCustomSpinButton = class;
  TcxCustomSpinButtonProperties = class(TcxCustomSpinEditProperties)
  protected
    class function GetAssignedValuesClass: TcxCustomEditPropertiesValuesClass; override;
    class function GetViewDataClass: TcxCustomEditViewDataClass; override;
    function IsDisplayValueNumeric: Boolean; override;
    function IsEditValueNumeric: Boolean; override;
    function PreserveSelection: Boolean; override;
  public
    constructor Create(AOwner: TPersistent); override;
    class function GetContainerClass: TcxContainerClass; override;
    class function GetViewInfoClass: TcxContainerViewInfoClass; override;
  end;

  { TcxSpinButtonProperties }
  TcxSpinButtonProperties = class(TcxCustomSpinButtonProperties)
  published
    property Alignment;
    property AutoSelect;
    property BeepOnError;
    property HideSelection;
    property ImmediatePost;
    property Increment;
    property LargeIncrement;
    property MaxValue;
    property MinValue;
    property ReadOnly;
    property SpinButtons;
    property UseCtrlIncrement;
    property UseLeftAlignmentOnEditing;
    property ValueType default vtInt;
    property OnChange;
    property OnEditValueChanged;
    property OnValidate;
  end;

  { TcxSpinButtonControlHook }
  TcxSpinButtonControlHook = class(TcxControlHook)
  private
    FParent: TWinControl;
  protected
    procedure HookWndProc(var AMsg: TMessage); override;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  { TcxCustomSpinButton }
  TcxCustomSpinButton = class(TcxCustomSpinEdit)
  private
    FAssociate: TWinControl;
    FSpinButtonControlHook: TcxSpinButtonControlHook;
    function GetProperties: TcxSpinButtonProperties;
    procedure SetProperties(Value: TcxSpinButtonProperties);
    procedure SetAssociate(AValue: TWinControl);
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    function CanFocusOnClick: Boolean; override;
    function CanResize(var NewWidth, NewHeight: Integer): Boolean; override;
    procedure SetSize; override;
    function InternalDoEditing: Boolean; override;
    property Properties: TcxSpinButtonProperties read GetProperties write SetProperties;
    property Associate: TWinControl{TcxCustomEdit} read FAssociate write SetAssociate;
    procedure JoinToAssociate; virtual;
    procedure SetAssociateText(const AValue: Variant); virtual;
    function GetValue: Variant; override;
    procedure SynchronizeEditValueFromAssociate; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    class function GetPropertiesClass: TcxCustomEditPropertiesClass; override;
    procedure InternalSetEditValue(const Value: TcxEditValue; AValidateEditValue: Boolean); override;
    procedure InternalSetDisplayValue(const Value: TcxEditValue); override;
{$IFDEF DELPHI5}
    function CanFocus: Boolean; override;
{$ENDIF}
    function Increment(AButton: TcxSpinEditButton): Boolean; override;
  end;

  { TcxSpinButton }
  TcxSpinButton = class(TcxCustomSpinButton)
  published
    property AutoSize;
    property Anchors;
    property Associate;
    property BeepOnEnter;
    property Constraints;
    property DragMode;
    property Enabled;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property Properties;
    property ShowHint;
    property Style;
    property TabOrder;
    property TabStop;
    property Value;
    property Visible;
{$IFDEF VCL}
    property DragCursor;
    property DragKind;
    property ImeMode;
    property ImeName;
{$ENDIF}
    property OnClick;
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

uses
{$IFDEF VCL}
  dxThemeConsts, dxThemeManager,
{$ENDIF}
  cxEditConsts, cxEditUtils;

type
  TcxCustomEditAccess = class(TcxCustomEdit);

{ TcxSpinButtonControlHook }
constructor TcxSpinButtonControlHook.Create;
begin
  inherited Create;
  FParent := nil;
end;

destructor TcxSpinButtonControlHook.Destroy;
begin
  FParent := nil;
  inherited Destroy;
end;

procedure TcxSpinButtonControlHook.HookWndProc(var AMsg: TMessage);
begin
  if Assigned(WinControl) and (not IsDestroying) then
  begin
    try
      case AMsg.Msg of
        WM_KEYDOWN, WM_KEYUP:
        begin
          if (FParent <> nil) then
            PostMessage(FParent.Handle, AMsg.Msg, AMsg.WParam, AMsg.LParam);
        end;
      end;
    finally
    end;
  end;
  inherited HookWndProc(AMsg);
end;
{ TcxSpinButtonControlHook }

{ TcxSpinButtonViewInfo }
procedure TcxSpinButtonViewInfo.DrawButtonBorder(ACanvas: TcxCanvas; AButtonVisibleIndex: Integer;
  AButtonStyle: TcxEditButtonStyle; const ARect: TRect);
begin
  inherited;
end;

procedure TcxSpinButtonViewInfo.DrawButtonContent(ACanvas: TcxCanvas; AButtonVisibleIndex: Integer;
  const AContentRect: TRect; APenColor: TColor; ABrushColor: TColor);
begin
  inherited;
end;

procedure TcxSpinButtonViewInfo.Paint(ACanvas: TcxCanvas);
begin
  inherited;
end;

{ TcxSpinButtonViewData }
procedure TcxSpinButtonViewData.Calculate(ACanvas: TcxCanvas; const ABounds: TRect;
  const P: TPoint; Button: TcxMouseButton; Shift: TShiftState; AViewInfo: TcxCustomEditViewInfo;
  AIsMouseEvent: Boolean);
begin
  inherited Calculate(ACanvas, ABounds, P, Button, Shift, AViewInfo, AIsMouseEvent);
  TcxSpinButtonViewInfo(AViewInfo).Text := '';
end;

function TcxSpinButtonViewData.CanPressButton(AViewInfo: TcxCustomEditViewInfo;
  AButtonVisibleIndex: Integer): Boolean;
begin
  Result := inherited CanPressButton(AViewInfo, AButtonVisibleIndex);
end;

function TcxSpinButtonViewData.IsButtonPressed(AViewInfo: TcxCustomEditViewInfo;
  AButtonVisibleIndex: Integer): Boolean;
begin
  Result := inherited IsButtonPressed(AViewInfo, AButtonVisibleIndex);
end;

function TcxSpinButtonViewData.GetProperties: TcxCustomSpinButtonProperties;
begin
  Result := TcxCustomSpinButtonProperties(FProperties);
end;

procedure TcxSpinButtonViewData.SetProperties(Value: TcxCustomSpinButtonProperties);
begin
  FProperties.Assign(Value);
end;

{ TcxCustomSpinButtonProperties }
constructor TcxCustomSpinButtonProperties.Create(AOwner: TPersistent);
begin
  inherited Create(AOwner);
  HideCursor := True;
end;

class function TcxCustomSpinButtonProperties.GetContainerClass: TcxContainerClass;
begin
  Result := TcxSpinButton;
end;

class function TcxCustomSpinButtonProperties.GetViewInfoClass: TcxContainerViewInfoClass;
begin
  Result := TcxSpinButtonViewInfo;
end;

class function TcxCustomSpinButtonProperties.GetAssignedValuesClass: TcxCustomEditPropertiesValuesClass;
begin
  Result := TcxSpinEditPropertiesValues;
end;

class function TcxCustomSpinButtonProperties.GetViewDataClass: TcxCustomEditViewDataClass;
begin
  Result := TcxSpinButtonViewData;
end;

function TcxCustomSpinButtonProperties.IsDisplayValueNumeric: Boolean;
begin
  Result := True;
end;

function TcxCustomSpinButtonProperties.IsEditValueNumeric: Boolean;
begin
  Result := True;
end;

function TcxCustomSpinButtonProperties.PreserveSelection: Boolean;
begin
  Result := False;
end;
{ TcxCustomSpinButtonProperties }

{ TcxCustomSpinButton }
constructor TcxCustomSpinButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle - [csAcceptsControls];
  AutoSize := True;
  FSpinButtonControlHook := TcxSpinButtonControlHook.Create;
  FSpinButtonControlHook.FParent := Self;
end;

destructor TcxCustomSpinButton.Destroy;
begin
  FSpinButtonControlHook.Free;
  inherited;
end;

class function TcxCustomSpinButton.GetPropertiesClass: TcxCustomEditPropertiesClass;
begin
  Result := TcxSpinButtonProperties;
end;

procedure TcxCustomSpinButton.InternalSetEditValue(const Value: TcxEditValue; AValidateEditValue: Boolean);
begin
  if IsDestroying then Exit;
  inherited InternalSetEditValue(Value, AValidateEditValue);
  SetAssociateText(Value);
end;

function TcxCustomSpinButton.GetValue: Variant;
const
  AVarTypeMap: array [TcxSpinEditValueType] of TVarType = (varInteger, varDouble);
begin
  PrepareEditValue(Text, Result, InternalFocused);
  if not VarIsNumeric(Result) then
    Result := VarAsType(Properties.MinValue, AVarTypeMap[Properties.ValueType]);
end;

procedure TcxCustomSpinButton.InternalSetDisplayValue(const Value: TcxEditValue);
begin
  if IsDestroying then Exit;
  inherited InternalSetDisplayValue(Value);
  SetAssociateText(Value);
end;

procedure TcxCustomSpinButton.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FAssociate) then
  begin
    FSpinButtonControlHook.WinControl := nil;
    FAssociate := nil;
  end;
end;

function TcxCustomSpinButton.CanFocusOnClick: Boolean;
begin
  Result := False;
end;

{$IFDEF DELPHI5}
function TcxCustomSpinButton.CanFocus: Boolean;
begin
  Result := False;
end;
{$ENDIF}

function TcxCustomSpinButton.Increment(AButton: TcxSpinEditButton): Boolean;
begin
  if Assigned(Associate) then SynchronizeEditValueFromAssociate;
  Result := inherited Increment(AButton);
  KeyboardAction := True;
  try
    SynchronizeEditValue;
  finally
    KeyboardAction := False;
  end;
end;

procedure TcxCustomSpinButton.SynchronizeEditValueFromAssociate;
var
  FAssociateValue: TcxEditValue;
begin
  if (not (FAssociate is TcxCustomTextEdit)) and
     (not (FAssociate is TCustomEdit)) then Exit;
  if Properties.ValueType = vtInt then
  begin
    if (FAssociate is TcxCustomTextEdit) then
      FAssociateValue := cxStrToInt(TcxCustomTextEdit(FAssociate).Text, True)
     else

    if (FAssociate is TCustomEdit) then
       FAssociateValue := cxStrToInt(TCustomEdit(FAssociate).Text, True);
  end else
  begin
    if (FAssociate is TcxCustomTextEdit) then
      FAssociateValue := cxStrToFloat(TcxCustomTextEdit(FAssociate).Text, True)
     else
     if (FAssociate is TCustomEdit) then
      FAssociateValue := cxStrToFloat(TCustomEdit(FAssociate).Text, True);
  end;
  if FAssociateValue <> Value then Value := FAssociateValue;
end;

function TcxCustomSpinButton.CanResize(var NewWidth, NewHeight: Integer): Boolean;
begin
  Result := inherited CanResize(NewWidth, NewHeight);
end;

procedure TcxCustomSpinButton.SetSize;
var
  AWidth: Integer;
begin
  inherited SetSize;
  AWidth := (ViewInfo.BorderRect.Right - ViewInfo.BorderRect.Left) - (ViewInfo.TextRect.Right - ViewInfo.TextRect.Left);

  if Length(ViewInfo.ButtonsInfo) > 0 then
    if not ViewInfo.ButtonsInfo[0].Data.NativeStyle then
    begin
      AWidth := Succ(AWidth);

      if ViewInfo.Shadow then
        AWidth := AWidth + 3;
    end;

  Width := AWidth;
end;

function TcxCustomSpinButton.InternalDoEditing: Boolean;
begin
  Result := True;
end;

function TcxCustomSpinButton.GetProperties: TcxSpinButtonProperties;
begin
  Result := TcxSpinButtonProperties(InternalGetProperties);
end;

procedure TcxCustomSpinButton.SetProperties(Value: TcxSpinButtonProperties);
begin
  FProperties.Assign(Value);
end;

procedure TcxCustomSpinButton.SetAssociate(AValue: TWinControl);
var
  I: Integer;
  FCompoundControl: IcxCompoundControl;

  function IsClass(ClassType: TClass; const Name: string): Boolean;
  begin
    Result := True;
    while ClassType <> nil do
    begin
      if ClassType.ClassNameIs(Name) then Exit;
      ClassType := ClassType.ClassParent;
    end;
    Result := False;
  end;

begin
  if AValue <> nil then
    for I := 0 to Parent.ControlCount - 1 do {Is control already associated ?}
      if (Parent.Controls[I] is TcxCustomSpinButton) and (Parent.Controls[I] <> Self) then
        if TcxCustomSpinButton(Parent.Controls[I]).Associate = AValue then
{$IFDEF DELPHI5}
          raise Exception.CreateResFmt(@scxUDAssociated,
            [AValue.Name, Parent.Controls[I].Name]);
{$ELSE}
          raise Exception.Create(AValue.Name + ' is already associated with ' + Parent.Controls[I].Name);
{$ENDIF}

  if FAssociate <> nil then
  begin
    FSpinButtonControlHook.WinControl := nil;
    FAssociate := nil;
  end;

  if (AValue <> nil) and (AValue.Parent = Self.Parent) and
    not (AValue is TcxCustomSpinButton) and
    not IsClass(AValue.ClassType, 'TcxDBTextEdit') and
    not IsClass(AValue.ClassType, 'TcxDBMemo') and
    not IsClass(AValue.ClassType, 'TDBTextEdit') and
    not IsClass(AValue.ClassType, 'TDBMemo') then
  begin
    FAssociate := AValue;
    if FAssociate.GetInterface(IcxCompoundControl, FCompoundControl) then
      FSpinButtonControlHook.WinControl := FCompoundControl.ActiveControl
    else
      FSpinButtonControlHook.WinControl := FAssociate;
    JoinToAssociate;
    SetAssociateText(Value);
  end;
end;

procedure TcxCustomSpinButton.JoinToAssociate;
begin
  Font := TcxCustomEditAccess(FAssociate).Font;
  Top := TcxCustomEditAccess(FAssociate).Top;
  Left := TcxCustomEditAccess(FAssociate).Left + TcxCustomEditAccess(FAssociate).Width;
  Height := TcxCustomEditAccess(FAssociate).Height;
end;

procedure TcxCustomSpinButton.SetAssociateText(const AValue: Variant);
begin
  if (FAssociate = nil) or ((not (FAssociate is TcxCustomTextEdit)) and
    (not (FAssociate is TCustomEdit))) then Exit;
  if (FAssociate is TcxCustomTextEdit) then
    TcxCustomTextEdit(FAssociate).Text := VarToStr(AValue)
   else
    if (FAssociate is TCustomEdit) then
     TCustomEdit(FAssociate).Text := VarToStr(AValue);
end;
{ TcxCustomSpinButton }

end.