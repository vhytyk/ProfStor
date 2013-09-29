
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

{$DEFINE USETCXSCROLLBAR}

unit cxMemo;

{$I cxEdVer.inc}

interface

uses
{$IFDEF VCL}
  Windows, Messages,
{$ELSE}
  Qt, QTypes,
{$ENDIF}
{$IFDEF DELPHI6}
  Types,
{$ENDIF}
  Classes, Controls, Forms, Graphics, Menus, StdCtrls, SysUtils, cxClasses,
  cxContainer, cxControls, cxDataUtils, cxEdit, cxGraphics, cxLookAndFeels,
  cxTextEdit;

{$IFDEF VCL}
const
  CM_UPDATESCROLLBARS = WM_APP + 104;
{$ENDIF}

type
  { TcxCustomTextEditViewInfo }

  TcxCustomMemoViewInfo = class(TcxCustomTextEditViewInfo)
  public
    procedure DrawText(ACanvas: TcxCanvas); override;
  end;

  { TcxCustomMemoViewData }

  TcxCustomMemoProperties = class;

  TcxCustomMemoViewData = class(TcxCustomTextEditViewData)
  private
    function GetProperties: TcxCustomMemoProperties;
    procedure SetProperties(Value: TcxCustomMemoProperties);
  public
    function GetDrawTextFlags: DWORD; override;
    function GetDrawTextOffset: TRect; override;
    property Properties: TcxCustomMemoProperties read GetProperties write SetProperties;
  end;

  { TcxCustomMemoProperties }

  TcxCustomInnerMemo = class;

  TcxCustomMemoProperties = class(TcxCustomTextEditProperties)
  private
    FScrollBars: TScrollStyle;
    FWantReturns: Boolean;
    FWantTabs: Boolean;
    FWordWrap: Boolean;
    function GetAlignment: TAlignment;
    function IsAlignmentStored: Boolean;
    procedure SetAlignment(Value: TAlignment);
    procedure SetScrollBars(Value: TScrollStyle);
    procedure SetWantReturns(Value: Boolean);
    procedure SetWantTabs(Value: Boolean);
    procedure SetWordWrap(Value: Boolean);
  protected
    class function GetViewDataClass: TcxCustomEditViewDataClass; override;
    function IsMultiLine: Boolean; override;
    function TabsNeed: Boolean; override;
    property Alignment: TAlignment read GetAlignment write SetAlignment stored IsAlignmentStored;
    property AutoSelect default False;
    property ScrollBars: TScrollStyle read FScrollBars write SetScrollBars default ssNone;
    property WantReturns: Boolean read FWantReturns write SetWantReturns default True;
    property WantTabs: Boolean read FWantTabs write SetWantTabs default False;
    property WordWrap: Boolean read FWordWrap write SetWordWrap default True;
  public
    constructor Create(AOwner: TPersistent); override;
    procedure Assign(Source: TPersistent); override;
    class function GetContainerClass: TcxContainerClass; override;
    function GetDisplayText(const AEditValue: TcxEditValue;
      AFullText: Boolean = False): WideString; override;
    function GetEditValueSource(AEditFocused: Boolean): TcxDataEditValueSource; override;
    class function GetViewInfoClass: TcxContainerViewInfoClass; override;
  end;

  { TcxMemoProperties }

  TcxMemoProperties = class(TcxCustomMemoProperties)
  published
    property Alignment;
    property AutoSelect;
    property CharCase;
    property HideSelection;
    property MaxLength;
{$IFDEF VCL}
    property OEMConvert;
{$ENDIF}
    property ReadOnly;
    property ScrollBars;
    property WantReturns;
    property WantTabs;
    property WordWrap;
    property OnChange;
    property OnEditValueChanged;
    property OnValidate;
  end;

  { TcxCustomMemo }

  TcxCustomMemo = class(TcxCustomTextEdit)
  private
    FInternalAction: Boolean;
{$IFDEF VCL}
  {$IFDEF USETCXSCROLLBAR}
    FScrollBarsCalculating: Boolean;
  {$ENDIF}
{$ENDIF}
    function GetLines: TStrings;
    function GetInnerMemo: TcxCustomInnerMemo;
    function GetProperties: TcxMemoProperties;
    procedure SetLines(Value: TStrings);
    procedure SetProperties(Value: TcxMemoProperties);
    procedure UpdateScrollBarsParameters;
{$IFDEF VCL}
    procedure WMCommand(var Message: TWMCommand); message WM_COMMAND;
    procedure CMUpdateScrollBars(var Message: TMessage); message CM_UPDATESCROLLBARS;
{$ELSE}
    function GetHMargin: Integer;
    procedure SetHMargin(Value: Integer);
{$ENDIF}
  protected
    procedure AdjustInnerEditPosition(AInnerEditHeight: Integer); override;
    function CanKeyDownModifyEdit(Key: Word; Shift: TShiftState): Boolean; override;
    procedure ChangeHandler(Sender: TObject); override;
    procedure DoEditKeyDown(var Key: Word; Shift: TShiftState); override;
    procedure FontChanged; override;
    function GetInnerEditClass: TControlClass; override;
    procedure InitializeViewData(AViewData: TcxCustomEditViewData); override;
    function IsEditClass: Boolean; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    function NeedsScrollBars: Boolean; override;
    procedure PropertiesChanged(Sender: TObject); override;
    procedure ReadState(Reader: TReader); override;
    procedure Scroll(AScrollBarKind: TScrollBarKind; AScrollCode: TScrollCode;
      var AScrollPos: Integer); override;
    function SendActivationKey(Key: Char): Boolean; override;
    procedure SetSelText(const Value: TCaption); override;
    procedure SetSize; override;
{$IFDEF VCL}
    procedure CreateParams(var Params: TCreateParams); override;
    procedure WndProc(var Message: TMessage); override;
{$ELSE}
    function WidgetFlags: Integer; override;
{$ENDIF}
    procedure InternalSynchronizeEditValue;
    procedure SetScrollBarsParameters; override;
    property InnerMemo: TcxCustomInnerMemo read GetInnerMemo;
    property Properties: TcxMemoProperties read GetProperties write SetProperties;
{$IFNDEF VCL}
    property HMargin: Integer read GetHMargin write SetHMargin default 3;
{$ENDIF}
  public
    constructor Create(AOwner: TComponent); override;
    procedure ClearSelection; override;
    procedure CutToClipboard; override;
    class function GetPropertiesClass: TcxCustomEditPropertiesClass; override;
    property Lines: TStrings read GetLines write SetLines;
  end;

  { TcxMemo }

  TcxMemo = class(TcxCustomMemo)
  published
    property Align;
    property Anchors;
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
{$ELSE}
    property HMargin;
{$ENDIF}
    property Lines;
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

  { TcxCustomInnerMemoHelper }

  TcxCustomInnerMemoHelper = class
  private
    FEdit: TcxCustomInnerMemo;
  protected
    property Edit: TcxCustomInnerMemo read FEdit;
  public
    constructor Create(AEdit: TcxCustomInnerMemo); virtual;

    { IcxContainerInnerControl }
    function GetControlContainer: TcxContainer;
    function GetControl: TWinControl;

    { IcxCustomInnerEdit }
    function GetEditValue: TcxEditValue;
    function GetOnChange: TNotifyEvent;
    procedure LockBounds(ALock: Boolean);
    procedure SafelySetFocus;
    procedure SetEditValue(const Value: TcxEditValue);
    procedure SetParent(Value: TWinControl);
    procedure SetOnChange(Value: TNotifyEvent);

    { IcxInnerTextEdit }
    procedure CopyToClipboard;
    function GetAlignment: TAlignment;
    function GetAutoSelect: Boolean;
    function GetCharCase: TEditCharCase;
    function GetEchoMode: TcxEditEchoMode;
    function GetHideSelection: Boolean;
    function GetImeLastChar: Char;
    function GetInternalUpdating: Boolean;
    function GetMaxLength: Integer;
    function GetMultiLine: Boolean;
{$IFDEF VCL}
    function GetOEMConvert: Boolean;
{$ENDIF}
    function GetReadOnly: Boolean;
    function GetSelLength: Integer;
    function GetSelStart: Integer;
    function GetSelText: TCaption;
    procedure SelectAll;
    procedure SetAlignment(Value: TAlignment);
    procedure SetAutoSelect(Value: Boolean);
    procedure SetCharCase(Value: TEditCharCase);
    procedure SetEchoMode(Value: TcxEditEchoMode);
    procedure SetHideSelection(Value: Boolean);
    procedure SetInternalUpdating(Value: Boolean);
    procedure SetMaxLength(Value: Integer);
{$IFDEF VCL}
    procedure SetOEMConvert(Value: Boolean);
{$ENDIF}
    procedure SetReadOnly(Value: Boolean);
    procedure SetSelLength(Value: Integer);
    procedure SetSelStart(Value: Integer);
    procedure SetSelText(Value: TCaption);
  end;

  { TcxCustomInnerMemo }

  TcxMultiLineEditCharPosition = packed record
    Line, Col: Integer;
  end;

  TcxInnerMemoSelectionState = packed record
    CursorPosition: TcxMultiLineEditCharPosition;
    SelectionStart: TcxMultiLineEditCharPosition;
    SelectionEnd: TcxMultiLineEditCharPosition;
  end;

  TcxCustomInnerMemo = class(TMemo, IcxCustomInnerEdit, IcxInnerTextEdit)
  private
    FAutoSelect: Boolean;
    FEchoMode: TcxEditEchoMode;
    FHelper: TcxCustomInnerMemoHelper;
    FInternalUpdating: Boolean;
    FIsCreating: Boolean;
    FLockBoundsCount: Integer;
{$IFDEF VCL}
    FInternalTextSetting: Boolean;
    FResizing: Boolean;
{$ELSE}
    FCharCase: TEditCharCase;
    FHideSelection: Boolean;
    FSelectionStateSaved: Boolean;
    FSelectionState: TcxInnerMemoSelectionState;
{$ENDIF}
    function GetContainer: TcxCustomMemo;
{$IFDEF VCL}
    procedure WMClear(var Message); message WM_CLEAR;
    procedure WMCut(var Message); message WM_CUT;
    procedure WMEraseBkgnd(var Message: TWMEraseBkgnd); message WM_ERASEBKGND;
    procedure WMGetDlgCode(var Message: TWMGetDlgCode); message WM_GETDLGCODE;
    procedure WMKeyDown(var Message: TWMKeyDown); message WM_KEYDOWN;
    procedure WMKillFocus(var Message: TWMKillFocus); message WM_KILLFOCUS;
    procedure WMNCPaint(var Message: TMessage); message WM_NCPAINT;
    procedure WMPaste(var Message); message WM_PASTE;
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SETFOCUS;
    procedure WMSetFont(var Message: TWMSetFont); message WM_SETFONT;
    procedure WMSetText(var Message: TWMSetText); message WM_SETTEXT;
    procedure WMWindowPosChanged(var Message: TWMWindowPosChanged); message WM_WINDOWPOSCHANGED;
    procedure WMWindowPosChanging(var Message: TWMWindowPosChanged); message WM_WINDOWPOSCHANGING;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure EMReplaceSel(var Message: TMessage); message EM_REPLACESEL;
{$ELSE}
    function GetWantTabs: Boolean;
    procedure RestoreSelectionState;
    procedure SaveSelectionState;
    procedure SetCharCase(Value: TEditCharCase);
    procedure SetWantTabs(Value: Boolean);
{$ENDIF}
  protected
    procedure Click; override;
    procedure DblClick; override;
    procedure DoEnter; override;
    procedure DragOver(Source: TObject; X, Y: Integer; State: TDragState;
      var Accept: Boolean); override;
    function GetPopupMenu: TPopupMenu; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure KeyUp(var Key: Word; Shift: TShiftState); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseLeave(AControl: TControl); {$IFDEF VCL}dynamic{$ELSE}override{$ENDIF};
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
{$IFDEF VCL}
    procedure CreateHandle; override;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWindowHandle(const Params: TCreateParams); override;
    procedure WndProc(var Message: TMessage); override;
{$ELSE}
    procedure Change; override;
    procedure ChangeBounds(ALeft, ATop, AWidth, AHeight: Integer); override;
    procedure CreateWidget; override;
    function EventFilter(Sender: QObjectH; Event: QEventH): Boolean; override;
    procedure InitWidget; override;
    function NeedKey(Key: Integer; Shift: TShiftState; const KeyText: WideString):
      Boolean; override;
    procedure SetText(const Value: TCaption); override;
    function WidgetFlags: Integer; override;
{$ENDIF}
    property AutoSelect: Boolean read FAutoSelect write FAutoSelect default False;
    property Container: TcxCustomMemo read GetContainer;
    property Helper: TcxCustomInnerMemoHelper read FHelper implements IcxCustomInnerEdit,
      IcxInnerTextEdit;
{$IFNDEF VCL}
    property CharCase: TEditCharCase read FCharCase write SetCharCase default ecNormal;
    property HideSelection: Boolean read FHideSelection write FHideSelection default True;
    property WantTabs: Boolean read GetWantTabs write SetWantTabs default False;
{$ENDIF}
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure DragDrop(Source: TObject; X, Y: Integer); override;
    function ExecuteAction(Action: TBasicAction): Boolean; override;
    function UpdateAction(Action: TBasicAction): Boolean; override;
{$IFDEF DELPHI5}
    function CanFocus: Boolean; override;
{$ENDIF}
{$IFDEF VCL}
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;
{$ENDIF}
  end;

implementation

uses
{$IFDEF DELPHI6}
  Variants,
{$ENDIF}
  Clipbrd, cxEditConsts, cxEditTextUtils, cxEditUtils, cxScrollBar;

const
  cxMemoMaxDisplayTextLength = 250;
{$IFNDEF VCL}
  {$IFDEF WIN32}
  FHMarginA: array[Boolean, TAlignment] of Integer = ((3, 0, 0), (2, 0, 0));
  {$ENDIF}
{$ENDIF}

type
  TcxEditDataBindingAccess = class(TcxEditDataBinding);

{ TcxCustomMemoViewInfo }

procedure TcxCustomMemoViewInfo.DrawText(ACanvas: TcxCanvas);
begin
  DrawMemo(ACanvas, Self);
end;

{ TcxCustomMemoViewData }

function TcxCustomMemoViewData.GetDrawTextFlags: DWORD;
const
  AAlignmentFlagMap: array [TAlignment] of DWORD = (CXTO_LEFT,
    CXTO_RIGHT, CXTO_CENTER_HORIZONTALLY);
begin
  Result := Integer(CXTO_EDITCONTROL);
  with Properties do
{$IFDEF VCL}
    if not (ScrollBars in [ssHorizontal, ssBoth]) and WordWrap then
      Result := Result or CXTO_WORDBREAK or CXTO_CHARBREAK;
{$ELSE}
    if WordWrap then
      Result := Result or CXTO_WORDBREAK;
{$ENDIF}
  Result := Result or AAlignmentFlagMap[Properties.Alignment];
  Result := Result or CXTO_PREVENT_LEFT_EXCEED;
end;

function TcxCustomMemoViewData.GetDrawTextOffset: TRect;
begin
  Result := GetMemoDrawTextOffset(Self);
end;

function TcxCustomMemoViewData.GetProperties: TcxCustomMemoProperties;
begin
  Result := TcxCustomMemoProperties(FProperties);
end;

procedure TcxCustomMemoViewData.SetProperties(Value: TcxCustomMemoProperties);
begin
  FProperties := Value;
end;

{ TcxCustomMemoProperties }

constructor TcxCustomMemoProperties.Create(AOwner: TPersistent);
begin
  inherited Create(AOwner);
  inherited Alignment.Vert := taTopJustify;
  AutoSelect := False;
  FScrollBars := ssNone;
  FWantReturns := True;
  FWordWrap := True;
end;

procedure TcxCustomMemoProperties.Assign(Source: TPersistent);
begin
  if Source is TcxCustomMemoProperties then
  begin
    BeginUpdate;
    try
      inherited Assign(Source);
      with Source as TcxCustomMemoProperties do
      begin
        Self.ScrollBars := ScrollBars;
        Self.WantReturns := WantReturns;
        Self.WantTabs := WantTabs;
        Self.WordWrap := WordWrap;
      end;
    finally
      EndUpdate;
    end
  end
  else
    inherited Assign(Source);
end;

class function TcxCustomMemoProperties.GetContainerClass: TcxContainerClass;
begin
  Result := TcxMemo;
end;

function TcxCustomMemoProperties.GetDisplayText(const AEditValue: TcxEditValue;
  AFullText: Boolean = False): WideString;
var
  P: PWideChar;
  ACount, I: Integer;
begin
  Result := inherited GetDisplayText(AEditValue);
  if AFullText then
    Exit;

  ACount := Length(Result);
  if ACount > cxMemoMaxDisplayTextLength then
    ACount := cxMemoMaxDisplayTextLength;

  P := @Result[1];
  for I := 1 to ACount do
  begin
    if (P^ = #10) or (P^ = #13) then
    begin
      SetLength(Result, I - 1);
      Break;
    end;
    Inc(P);
  end;
  if Length(Result) > cxMemoMaxDisplayTextLength then
    SetLength(Result, cxMemoMaxDisplayTextLength);
end;

class function TcxCustomMemoProperties.GetViewInfoClass: TcxContainerViewInfoClass;
begin
  Result := TcxCustomMemoViewInfo;
end;

function TcxCustomMemoProperties.GetEditValueSource(AEditFocused: Boolean): TcxDataEditValueSource;
begin
  if (IDefaultValuesProvider <> nil) and IDefaultValuesProvider.IsBlob then
    Result := evsValue
  else
    Result := evsText;
end;

class function TcxCustomMemoProperties.GetViewDataClass: TcxCustomEditViewDataClass;
begin
  Result := TcxCustomMemoViewData;
end;

function TcxCustomMemoProperties.IsMultiLine: Boolean;
begin
  Result := True;
end;

function TcxCustomMemoProperties.TabsNeed: Boolean;
begin
  Result := WantTabs;
end;

function TcxCustomMemoProperties.GetAlignment: TAlignment;
begin
  Result := inherited Alignment.Horz;
end;

function TcxCustomMemoProperties.IsAlignmentStored: Boolean;
begin
  Result := inherited Alignment.IsHorzStored;
end;

procedure TcxCustomMemoProperties.SetAlignment(Value: TAlignment);
begin
  inherited Alignment.Horz := Value;
end;

procedure TcxCustomMemoProperties.SetScrollBars(Value: TScrollStyle);
begin
  if Value <> FScrollBars then
  begin
    FScrollBars := Value;
    Changed;
  end;
end;

procedure TcxCustomMemoProperties.SetWantReturns(Value: Boolean);
begin
  if Value <> FWantReturns then
  begin
    FWantReturns := Value;
    Changed;
  end;
end;

procedure TcxCustomMemoProperties.SetWantTabs(Value: Boolean);
begin
  if Value <> FWantTabs then
  begin
    FWantTabs := Value;
    Changed;
  end;
end;

procedure TcxCustomMemoProperties.SetWordWrap(Value: Boolean);
begin
  if Value <> FWordWrap then
  begin
    FWordWrap := Value;
    Changed;
  end;
end;

{ TcxCustomMemo }

constructor TcxCustomMemo.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  AutoSize := False;
  Width := 185;
  Height := 89;
end;

procedure TcxCustomMemo.ClearSelection;
begin
  if SelLength = 0 then
    Exit;
  if KeyboardAction and not DoEditing then
    Exit;
  FInternalAction := True;
  try
    InnerMemo.ClearSelection;
  finally
    FInternalAction := False;
  end;
  InternalSynchronizeEditValue;
end;

procedure TcxCustomMemo.CutToClipboard;
begin
  if SelLength = 0 then
    Exit;
  InnerTextEdit.CopyToClipboard;
  ClearSelection;
end;

class function TcxCustomMemo.GetPropertiesClass: TcxCustomEditPropertiesClass;
begin
  Result := TcxMemoProperties;
end;

procedure TcxCustomMemo.AdjustInnerEditPosition(AInnerEditHeight: Integer);
var
  AInnerEditBounds: TRect;
  R: TRect;
{$IFDEF LINUX}
  AInnerEditTop: Integer;
{$ENDIF}
begin
  if (InnerTextEdit = nil) or FInnerEditPositionAdjusting then
    Exit;
  FInnerEditPositionAdjusting := True;
  try
    R := ViewInfo.ClientRect;
    with R do
    begin
{$IFDEF WIN32}
  {$IFDEF VCL}
      AInnerEditBounds := Rect(Left + 1, Top + 1, Right - Left - 2, Bottom - Top - 2);
  {$ELSE}
      if IsInplace then
      begin
        case Properties.Alignment of
          taLeftJustify:
            AInnerEditBounds := Rect(Left, Top + Integer(IsInplace), Right - Left - Integer(not Testing) + 4 * Integer(IsInplace), Bottom - Top - 2 * Integer(IsInplace));
          taRightJustify:
            AInnerEditBounds := Rect(Left + 3 * Integer(not IsInplace), Top + Integer(IsInplace), Right - Left - 4 - Integer(IsInplace) + 3 * Integer(IsInplace), Bottom - Top - 2 * Integer(IsInplace));
          taCenter:
            AInnerEditBounds := Rect(Left + 3 - Integer(IsInplace) * 2, Top + Integer(IsInplace), Right - Left - 4 + Integer(IsInplace) * 3, Bottom - Top - 2 * Integer(IsInplace));
        end;
      end
      else
        AInnerEditBounds := Rect(Left, Top, Right - Left, Bottom - Top);
  {$ENDIF}
{$ENDIF}
{$IFDEF LINUX}
      if IsInplace then
      begin
        AInnerEditTop := Top - 1;
        AInnerEditHeight := Bottom;
        case Properties.Alignment of
          taLeftJustify:
            AInnerEditBounds := Rect(Left, AInnerEditTop, Right - Left{ - 1},
              AInnerEditHeight);
          taRightJustify:
            AInnerEditBounds := Rect(Left + 3, AInnerEditTop, Right - Left - 5,
              AInnerEditHeight);
          taCenter:
            AInnerEditBounds := Rect(Left + 3, AInnerEditTop, Right - Left - 5,
              AInnerEditHeight);
        end;
      end
      else
        AInnerEditBounds := Rect(Left, Top, Right - Left, Bottom - Top);
{$ENDIF}
    end;
    with AInnerEditBounds do
      if not EqualRect(InnerEdit.Control.BoundsRect, Rect(Left, Top, Left + Right, Top + Bottom)) then
        InnerEdit.Control.SetBounds(Left, Top, Right, Bottom);
{$IFDEF LINUX}
    if IsInplace then
      InflateRect(R, -1, -1);
{$ENDIF}
    AlignControls(InnerEdit.Control, R);
  finally
    FInnerEditPositionAdjusting := False;
  end;
end;

function TcxCustomMemo.CanKeyDownModifyEdit(Key: Word; Shift: TShiftState): Boolean;
var
  ATranslatedKey: Word;
begin
  Result := inherited CanKeyDownModifyEdit(Key, Shift);
  ATranslatedKey := TranslateKey(Key);
  Result := Result or (ATranslatedKey = VK_RETURN) and (Properties.WantReturns or
    (ssCtrl in Shift));
  Result := Result or ((ATranslatedKey = VK_TAB){$IFNDEF VCL} or (Key = Key_Backtab){$ENDIF}) and
    Properties.WantTabs;
end;

procedure TcxCustomMemo.ChangeHandler(Sender: TObject);
begin
  inherited ChangeHandler(Sender);
//  if not Focused then
//    FEditValue := Lines.Text;
  UpdateScrollBarsParameters;
end;

procedure TcxCustomMemo.DoEditKeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited DoEditKeyDown(Key, Shift);
  if Key = 0 then
    Exit;

  if (Char(Key) in ['a', 'A']) and (ssCtrl in Shift) and not(ssAlt in Shift) and
    (Lines.Count > 0) then
  begin
    SelectAll;
    DoAfterKeyDown(Key, Shift);
    Key := 0;
  end;
end;

procedure TcxCustomMemo.FontChanged;
begin
  inherited FontChanged;
  SetScrollBarsParameters;
end;

function TcxCustomMemo.GetInnerEditClass: TControlClass;
begin
  Result := TcxCustomInnerMemo;
end;

procedure TcxCustomMemo.InitializeViewData(AViewData: TcxCustomEditViewData);
begin
  inherited InitializeViewData(AViewData);
  AViewData.HScrollBar := nil;
  AViewData.VScrollBar := nil;
end;

function TcxCustomMemo.IsEditClass: Boolean;
begin
  Result := True;
end;

procedure TcxCustomMemo.KeyDown(var Key: Word; Shift: TShiftState);
var
  AKey: Word;
begin
  AKey := TranslateKey(Key);
  if IsInplace and (AKey = VK_RETURN) and ((ssCtrl in Shift) and not Properties.WantReturns or
      not (ssCtrl in Shift) and Properties.WantReturns) then
    DoEditKeyDown(Key, Shift)
  else
    inherited KeyDown(Key, Shift);
end;

function TcxCustomMemo.NeedsScrollBars: Boolean;
begin
  Result := True;
end;

procedure TcxCustomMemo.PropertiesChanged(Sender: TObject);
begin
  if PropertiesChangeLocked then
    Exit;
  with InnerMemo do
  begin
    if ScrollBars <> Properties.ScrollBars then
    begin
      ScrollBars := Properties.ScrollBars;
{$IFDEF VCL}
    if Self.HandleAllocated then
      Self.RecreateWnd;
    if HandleAllocated then
      RecreateWnd;
{$ELSE}
(*    if Self.HandleAllocated then // TODO
      Self.RecreateWidget;
    if HandleAllocated then
      RecreateWidget;*)
{$ENDIF}
    end;
    WantReturns := Properties.WantReturns;
    WantTabs := Properties.WantTabs;
    WordWrap := Properties.WordWrap;
  end;
  inherited PropertiesChanged(Sender);
end;

procedure TcxCustomMemo.ReadState(Reader: TReader);
begin
  inherited ReadState(Reader);
  if Lines.Count > 0 then
    FEditValue := Text;
end;

procedure TcxCustomMemo.Scroll(AScrollBarKind: TScrollBarKind; AScrollCode: TScrollCode;
  var AScrollPos: Integer);
begin
  inherited Scroll(AScrollBarKind, AScrollCode, AScrollPos);
{$IFDEF USETCXSCROLLBAR}
  {$IFDEF VCL}
  with InnerMemo do
    if AScrollBarKind = sbHorizontal then
    begin
      CallWindowProc(DefWndProc, Handle, WM_HSCROLL, Word(AScrollCode) +
        Word(AScrollPos) shl 16, HScrollBar.Handle);
      AScrollPos := GetScrollPos(Handle, SB_HORZ);
    end else
    begin
      case AScrollCode of
        scLineDown:
          SendMessage(Handle, EM_LINESCROLL, 0, 1);
        scLineUp:
          SendMessage(Handle, EM_LINESCROLL, 0, -1);
        else
          CallWindowProc(DefWndProc, Handle, WM_VSCROLL, Word(AScrollCode) +
            Word(AScrollPos) shl 16, VScrollBar.Handle);
      end;
      AScrollPos := GetScrollPos(Handle, SB_VERT);
    end;
  SetScrollBarsParameters;
  {$ELSE}
  // TODO
  {$ENDIF}
{$ENDIF}
end;

function TcxCustomMemo.SendActivationKey(Key: Char): Boolean;
begin
  Result := not(TranslateKey(Word(Key)) = VK_RETURN);
end;

procedure TcxCustomMemo.SetSelText(const Value: TCaption);
var
  ANewValue: TCaption;
  ANewValueLength: Integer;
begin
  ANewValue := Value;
  if KeyboardAction and (Properties.MaxLength > 0) then
    if Length(WideString(Copy(Text, 1, SelStart) + Value)) > Properties.MaxLength then
    begin
      ANewValueLength := Properties.MaxLength - Length(WideString(Copy(Text, 1, SelStart)));
      if ANewValueLength <= 0 then
        Exit;
      ANewValue := Copy(WideString(Value), 1, ANewValueLength);
    end;
  if ANewValue = '' then
    Exit;
  if KeyboardAction and not DoEditing then
    Exit;
  InnerTextEdit.SelText := ANewValue;
  InternalSynchronizeEditValue;
end;

procedure TcxCustomMemo.SetSize;
begin
  AdjustInnerEditPosition(0);
end;

{$IFDEF VCL}
procedure TcxCustomMemo.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params.WindowClass do
  begin
    style := style and not CS_VREDRAW;
    if (Properties.ScrollBars in [ssHorizontal, ssBoth]) or not Properties.WordWrap then
      style := style and not CS_HREDRAW;
  end;
end;

procedure TcxCustomMemo.WndProc(var Message: TMessage);
begin
  inherited WndProc(Message);
  case Message.Msg of
    WM_NCCALCSIZE,
    WM_WINDOWPOSCHANGED,
    CM_WININICHANGE:
      UpdateScrollBarsParameters;
  end;
end;
{$ELSE}
function TcxCustomMemo.WidgetFlags: Integer;
begin
  Result := inherited WidgetFlags;
  // TODO
  if (Properties.ScrollBars in [ssHorizontal, ssBoth]) or not Properties.WordWrap then
    Result := Result or Integer(WidgetFlags_WResizeNoErase);
end;
{$ENDIF}

procedure TcxCustomMemo.InternalSynchronizeEditValue;
begin
  if not KeyboardAction then
  begin
    ResetOnNewDisplayValue;
    SynchronizeEditValue;
    EditModified := False;
  end;
end;

procedure TcxCustomMemo.SetScrollBarsParameters;
{$IFDEF USETCXSCROLLBAR}
  {$IFDEF VCL}

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
      if IsDestroying or (Parent = nil) or not HandleAllocated or not InnerMemo.HandleAllocated then
        Break;
      AScrollBarInfo.cbSize := SizeOf(AScrollBarInfo);
      if not GetScrollBarInfoProc(InnerMemo.Handle, Integer(AScrollBarObjects[AScrollBar.Kind]),
          AScrollBarInfo) then
        Break;
      AScrollBarState := AScrollBarInfo.rgstate[0];
      if AScrollBarState and (STATE_SYSTEM_INVISIBLE or STATE_SYSTEM_OFFSCREEN) <> 0 then
        Break;
      AScrollBarVisible := True;
      AScrollBar.Enabled := AScrollBarState and STATE_SYSTEM_UNAVAILABLE = 0;
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
    GetScrollInfo(InnerMemo.Handle, ABarFlags[AScrollBar.Kind], AScrollInfo);
    with AScrollInfo do
    begin
      if Integer(nPage) > nMax then
        Integer(nPage) := nMax;
      AScrollBar.SetScrollParams(nMin, nMax, nPos, nPage, True);
    end;
    AScrollBar.BringToFront;
  end;
  {$ENDIF}
{$ENDIF}
begin
{$IFDEF USETCXSCROLLBAR}
  {$IFDEF VCL}
  if not UsecxScrollBars then
    Exit;
  FScrollBarsCalculating := True;
  try
    SetScrollBarParameters(HScrollBar);
    SetScrollBarParameters(VScrollBar);
  finally
    FScrollBarsCalculating := False;
  end;
  {$ENDIF}
{$ENDIF}
end;

function TcxCustomMemo.GetLines: TStrings;
begin
  Result := InnerMemo.Lines;
end;

function TcxCustomMemo.GetInnerMemo: TcxCustomInnerMemo;
begin
  Result := TcxCustomInnerMemo(InnerTextEdit.Control);
end;

function TcxCustomMemo.GetProperties: TcxMemoProperties;
begin
  Result := TcxMemoProperties(InternalGetProperties);
end;

procedure TcxCustomMemo.SetLines(Value: TStrings);
begin
  InnerMemo.Lines := Value;
end;

procedure TcxCustomMemo.SetProperties(Value: TcxMemoProperties);
begin
  FProperties.Assign(Value);
end;

procedure TcxCustomMemo.UpdateScrollBarsParameters;
begin
{$IFDEF VCL}
  if not IsDestroying and (InnerMemo <> nil) and HandleAllocated then
    PostMessage(Handle, CM_UPDATESCROLLBARS, 0, 0);
{$ELSE}
  // TODO
{$ENDIF}
end;

{$IFDEF VCL}
procedure TcxCustomMemo.WMCommand(var Message: TWMCommand);
begin
  inherited;
  if Message.NotifyCode = EN_VSCROLL then
    SetScrollBarsParameters;
end;

procedure TcxCustomMemo.CMUpdateScrollBars(var Message: TMessage);
begin
  SetScrollBarsParameters;
end;
{$ELSE}
function TcxCustomMemo.GetHMargin: Integer;
begin
  Result := InnerMemo.HMargin;
end;

procedure TcxCustomMemo.SetHMargin(Value: Integer);
begin
  InnerMemo.HMargin := Value;
end;
{$ENDIF}

{ TcxCustomInnerMemoHelper }

constructor TcxCustomInnerMemoHelper.Create(AEdit: TcxCustomInnerMemo);
begin
  inherited Create;
  FEdit := AEdit;
end;

{ IcxContainerInnerControl }
function TcxCustomInnerMemoHelper.GetControlContainer: TcxContainer;
begin
  Result := Edit.Container;
end;

function TcxCustomInnerMemoHelper.GetControl: TWinControl;
begin
  Result := Edit;
end;

{ IcxCustomInnerEdit }
function TcxCustomInnerMemoHelper.GetEditValue: TcxEditValue;
begin
  Result := Edit.Lines.Text;
end;

function TcxCustomInnerMemoHelper.GetOnChange: TNotifyEvent;
begin
  Result := Edit.OnChange;
end;

procedure TcxCustomInnerMemoHelper.LockBounds(ALock: Boolean);
begin
  with Edit do
    if ALock then
      Inc(FLockBoundsCount)
    else
      if FLockBoundsCount > 0 then
        Dec(FLockBoundsCount);
end;

procedure TcxCustomInnerMemoHelper.SafelySetFocus;
var
  APrevAutoSelect: Boolean;
begin
  with Edit do
  begin
    APrevAutoSelect := AutoSelect;
    AutoSelect := False;
    SetFocus;
    AutoSelect := APrevAutoSelect;
  end;
end;

procedure TcxCustomInnerMemoHelper.SetEditValue(const Value: TcxEditValue);
begin
  with Edit do
  begin
    if HandleAllocated then
      Lines.Text := VarToStr(Value)
    else
      Text := VarToStr(Value);
  end;
end;

procedure TcxCustomInnerMemoHelper.SetParent(Value: TWinControl);
begin
  Edit.Parent := Value;
end;

procedure TcxCustomInnerMemoHelper.SetOnChange(Value: TNotifyEvent);
begin
  Edit.OnChange := Value;
end;

{ IcxInnerTextEdit }
procedure TcxCustomInnerMemoHelper.CopyToClipboard;
begin
  Edit.CopyToClipboard;
end;

function TcxCustomInnerMemoHelper.GetAlignment: TAlignment;
begin
  Result := Edit.Alignment;
end;

function TcxCustomInnerMemoHelper.GetAutoSelect: Boolean;
begin
  Result := Edit.AutoSelect;
end;

function TcxCustomInnerMemoHelper.GetCharCase: TEditCharCase;
begin
  Result := Edit.CharCase;
end;

function TcxCustomInnerMemoHelper.GetEchoMode: TcxEditEchoMode;
begin
  Result := eemNormal;
end;

function TcxCustomInnerMemoHelper.GetHideSelection: Boolean;
begin
  Result := Edit.HideSelection;
end;

function TcxCustomInnerMemoHelper.GetImeLastChar: Char;
begin
  Result := #0;
end;

function TcxCustomInnerMemoHelper.GetInternalUpdating: Boolean;
begin
  Result := Edit.FInternalUpdating;
end;

function TcxCustomInnerMemoHelper.GetMaxLength: Integer;
begin
  Result := Edit.MaxLength;
end;

function TcxCustomInnerMemoHelper.GetMultiLine: Boolean;
begin
  Result := True;
end;

{$IFDEF VCL}
function TcxCustomInnerMemoHelper.GetOEMConvert: Boolean;
begin
  Result := Edit.OEMConvert;
end;
{$ENDIF}

function TcxCustomInnerMemoHelper.GetReadOnly: Boolean;
begin
  Result := Edit.ReadOnly;
end;

function TcxCustomInnerMemoHelper.GetSelLength: Integer;
begin
  Result := Edit.SelLength;
end;

function TcxCustomInnerMemoHelper.GetSelStart: Integer;
begin
  Result := Edit.SelStart;
end;

function TcxCustomInnerMemoHelper.GetSelText: TCaption;
begin
  Result := Edit.SelText;
end;

procedure TcxCustomInnerMemoHelper.SelectAll;
begin
  Edit.SelectAll;
end;

procedure TcxCustomInnerMemoHelper.SetAlignment(Value: TAlignment);
begin
  with Edit do
  begin
    Alignment := Value;
{$IFNDEF VCL}
    if Container.IsInplace then
  {$IFDEF WIN32}
      HMargin := FHMarginA[Container.IsInplace, Value];
  {$ENDIF}
  {$IFDEF LINUX}
      if Value = taLeftJustify then
        HMargin := 3
      else
        HMargin := 0;
  {$ENDIF}
{$ENDIF}
  end;
end;

procedure TcxCustomInnerMemoHelper.SetAutoSelect(Value: Boolean);
begin
  Edit.AutoSelect := Value;
end;

procedure TcxCustomInnerMemoHelper.SetCharCase(Value: TEditCharCase);
begin
  Edit.CharCase := Value;
end;

procedure TcxCustomInnerMemoHelper.SetEchoMode(Value: TcxEditEchoMode);
begin
end;

procedure TcxCustomInnerMemoHelper.SetHideSelection(Value: Boolean);
begin
  Edit.HideSelection := Value;
end;

procedure TcxCustomInnerMemoHelper.SetInternalUpdating(Value: Boolean);
begin
  Edit.FInternalUpdating := Value;
end;

procedure TcxCustomInnerMemoHelper.SetMaxLength(Value: Integer);
begin
  Edit.MaxLength := Value;
end;

{$IFDEF VCL}
procedure TcxCustomInnerMemoHelper.SetOEMConvert(Value: Boolean);
begin
  Edit.OEMConvert := Value;
end;
{$ENDIF}

procedure TcxCustomInnerMemoHelper.SetReadOnly(Value: Boolean);
begin
  Edit.ReadOnly := Value;
end;

procedure TcxCustomInnerMemoHelper.SetSelLength(Value: Integer);
begin
  Edit.SelLength := Value;
end;

procedure TcxCustomInnerMemoHelper.SetSelStart(Value: Integer);
begin
  with Edit do
  begin
{$IFDEF VCL}
    SelStart := Value;
{$ELSE}
    // TODO test
    if (SelStart = Value) and (Value = 0) and (Length(Text) > 0) then
      SelStart := 1
    else
      SelStart := 0;
    SelStart := Value;
    SelLength := 0;
{$ENDIF}
  end;
end;

procedure TcxCustomInnerMemoHelper.SetSelText(Value: TCaption);
begin
  Edit.SelText := Value;
end;

{ TcxCustomInnerMemo }

constructor TcxCustomInnerMemo.Create(AOwner: TComponent);
begin
  FIsCreating := True;
  inherited Create(AOwner);
  TabStop := False;
  BorderStyle := bsNone;
  if not (csDesigning in ComponentState) then
    Cursor := crIBeam;
  ParentColor := True;
  ParentFont := True;
  FEchoMode := eemNormal;
  FHelper := TcxCustomInnerMemoHelper.Create(Self);
  FInternalUpdating := False;
{$IFNDEF VCL}
  InputKeys := InputKeys - [ikTabs];
  FCharCase := ecNormal;
  FHideSelection := True;
{$ENDIF}
  FIsCreating := False;
end;

destructor TcxCustomInnerMemo.Destroy;
begin
  Tag := Tag * 10;
  FreeAndNil(FHelper);
  inherited Destroy;
end;

procedure TcxCustomInnerMemo.DragDrop(Source: TObject; X, Y: Integer);
begin
  Container.DragDrop(Source, Left + X, Top + Y);
end;

function TcxCustomInnerMemo.ExecuteAction(Action: TBasicAction): Boolean;
begin
  Result := inherited ExecuteAction(Action) or
    TcxEditDataBindingAccess(Container.DataBinding).ExecuteAction(Action);
end;

function TcxCustomInnerMemo.UpdateAction(Action: TBasicAction): Boolean;
begin
  Result := inherited UpdateAction(Action) or
    TcxEditDataBindingAccess(Container.DataBinding).UpdateAction(Action);
end;

{$IFDEF DELPHI5}
function TcxCustomInnerMemo.CanFocus: Boolean;
begin
  Result := Container.CanFocusEx;
end;
{$ENDIF}

{$IFDEF VCL}
procedure TcxCustomInnerMemo.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  if not FIsCreating and (FLockBoundsCount = 0) then
  begin
    Container.LockAlignControls(True);
    try
      inherited SetBounds(ALeft, ATop, AWidth, AHeight);
    finally
      Container.LockAlignControls(False);
    end;
  end;
end;
{$ENDIF}

procedure TcxCustomInnerMemo.Click;
begin
  inherited Click;
  Container.Click;
end;

procedure TcxCustomInnerMemo.DblClick;
begin
  inherited DblClick;
  Container.DblClick;
end;

procedure TcxCustomInnerMemo.DoEnter;
begin
  inherited DoEnter;
  if FAutoSelect then
    SelectAll
{$IFNDEF VCL}
  else
    if FSelectionStateSaved then
      RestoreSelectionState;
{$ENDIF}
end;

procedure TcxCustomInnerMemo.DragOver(Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Container.DragOver(Source, Left + X, Top + Y, State, Accept);
end;

function TcxCustomInnerMemo.GetPopupMenu: TPopupMenu;
begin
  Result := Container.GetPopupMenu;
end;

procedure TcxCustomInnerMemo.KeyDown(var Key: Word; Shift: TShiftState);
begin
  FInternalUpdating := False;
  Container.KeyDown(Key, Shift);
  if Key = 0 then
    FInternalUpdating := True
  else
    inherited KeyDown(Key, Shift);
end;

procedure TcxCustomInnerMemo.KeyPress(var Key: Char);
begin
  FInternalUpdating := False;
  if not WantTabs and ((Key = Char(VK_TAB)){$IFNDEF VCL} or (Key = Char(Key_Backtab)){$ENDIF}) then
    Key := #0;
  Container.KeyPress(Key);
  if Key = #0 then
    FInternalUpdating := True
  else
    inherited KeyPress(Key);
end;

procedure TcxCustomInnerMemo.KeyUp(var Key: Word; Shift: TShiftState);
begin
  FInternalUpdating := False;
  if not WantTabs and ((Key = VK_TAB){$IFNDEF VCL} or (Key = Key_Backtab){$ENDIF}) then
    Key := 0;
  Container.KeyUp(Key, Shift);
  if Key = 0 then
    FInternalUpdating := True
  else
    inherited KeyUp(Key, Shift);
end;

procedure TcxCustomInnerMemo.MouseDown(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseDown(Button, Shift, X, Y);
  with Container do
  begin
    InnerControlMouseDown := True;
    try
      MouseDown(Button, Shift, X + Self.Left, Y + Self.Top);
    finally
      InnerControlMouseDown := False;
    end;
  end;
end;

procedure TcxCustomInnerMemo.MouseLeave(AControl: TControl);
begin
  {$IFNDEF VCL}inherited;{$ENDIF}
  Container.ShortRefreshContainer(True);
end;

procedure TcxCustomInnerMemo.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseMove(Shift, X, Y);
  Container.MouseMove(Shift, X + Left, Y + Top);
end;

procedure TcxCustomInnerMemo.MouseUp(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseUp(Button, Shift, X, Y);
  Container.MouseUp(Button, Shift, X + Left, Y + Top);
end;

{$IFDEF VCL}
procedure TcxCustomInnerMemo.CreateHandle;
begin
  Container.ClearSavedChildControlRegions;
  inherited CreateHandle;
end;

procedure TcxCustomInnerMemo.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params.WindowClass do
  begin
    style := style and not CS_VREDRAW;
    if (ScrollBars in [ssHorizontal, ssBoth]) or not WordWrap then
      style := style and not CS_HREDRAW;
  end;
end;

procedure TcxCustomInnerMemo.CreateWindowHandle(const Params: TCreateParams);
begin
  inherited CreateWindowHandle(Params);
  Lines.Text := Text;
  Container.SetScrollBarsParameters;
end;

procedure TcxCustomInnerMemo.WndProc(var Message: TMessage);
begin
  with Message do
    if ((Msg = WM_LBUTTONDOWN) or (Msg = WM_LBUTTONDBLCLK)) and
      (Container.DragMode = dmAutomatic) and not(csDesigning in Container.ComponentState) then
    begin
      Container.BeginAutoDrag;
      Exit;
    end;
  inherited WndProc(Message);
end;
{$ELSE}
procedure TcxCustomInnerMemo.Change;
begin
  inherited Change;
  FSelectionStateSaved := False;
end;

procedure TcxCustomInnerMemo.ChangeBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  if not FIsCreating and (FLockBoundsCount = 0) then
  begin
    if Container <> nil then
      Container.LockAlignControls(True);
    try
      inherited ChangeBounds(ALeft, ATop, AWidth, AHeight);
    finally
      if Container <> nil then
        Container.LockAlignControls(False);
    end;
  end;
end;

procedure TcxCustomInnerMemo.CreateWidget;
begin
  if Container <> nil then
    Container.ClearSavedChildControlRegions;
  inherited CreateWidget;
end;

function TcxCustomInnerMemo.EventFilter(Sender: QObjectH; Event: QEventH): Boolean;
var
  AKeyEvent, ANewKeyEvent: QKeyEventH;
  AEventType: QEventType;
  AKeyEventChar: Char;
  AKeyEventText: WideString;
begin
  AEventType := QEvent_type(Event);

  if (FCharCase <> ecNormal) and (AEventType in [QEventType_KeyPress, QEventType_KeyRelease]) then
  begin
    AKeyEvent := QKeyEventH(Event);
    QKeyEvent_text(AKeyEvent, @AKeyEventText);
    if FCharCase = ecUpperCase then
    begin
      AKeyEventChar := UpCase(Char(QKeyEvent_ascii(AKeyEvent)));
      AKeyEventText := WideUpperCase(AKeyEventText);
    end else
    begin
      AKeyEventChar := LowerCase(Char(QKeyEvent_ascii(AKeyEvent)))[1];
      AKeyEventText := WideLowerCase(AKeyEventText);
    end;
    ANewKeyEvent := QKeyEvent_create(AEventType, QKeyEvent_key(AKeyEvent),
      Integer(AKeyEventChar), Integer(QKeyEvent_state(AKeyEvent)), @AKeyEventText,
      QKeyEvent_isAutoRepeat(AKeyEvent), QKeyEvent_count(AKeyEvent));
    try
      inherited EventFilter(Sender, ANewKeyEvent);
      Result := True;
      if AEventType = QEventType_KeyPress then
        QOpenWidget_keyPressEvent(QOpenWidgetH(Handle), ANewKeyEvent)
      else
        QOpenWidget_keyReleaseEvent(QOpenWidgetH(Handle), ANewKeyEvent);
    finally
      QKeyEvent_destroy(ANewKeyEvent);
    end;
  end else
  begin
    if AEventType = QEventType_FocusOut then
    begin
      if FHideSelection and (SelLength > 0) then
      begin
        SaveSelectionState;
        FSelectionStateSaved := True;
      end;
      Container.FocusChanged;
    end;
    Result := inherited EventFilter(Sender, Event);
  end;
end;

procedure TcxCustomInnerMemo.InitWidget;
begin
  inherited InitWidget;
  BorderStyle := bsNone;
{$IFDEF WIN32}
  if (Container <> nil) and Container.IsInplace then
    QMultiLineEdit_setHMargin(Handle, FHMarginA[Container.IsInplace, Alignment]);
{$ENDIF}
end;

function TcxCustomInnerMemo.NeedKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  if WantTabs or not((Key = Key_Tab) or (Key = Key_BackTab)) then
    Result := inherited NeedKey(Key, Shift, KeyText)
  else
    Result := True;
end;

procedure TcxCustomInnerMemo.SetText(const Value: TCaption);
begin
  if CharCase <> ecNormal then
    if CharCase = ecUpperCase then
      inherited SetText(WideUpperCase(Value))
    else
      inherited SetText(WideLowerCase(Value))
  else
    inherited SetText(Value);
end;

function TcxCustomInnerMemo.WidgetFlags: Integer;
begin
  Result := inherited WidgetFlags;
  // TODO
  if (ScrollBars in [ssHorizontal, ssBoth]) or not WordWrap then
    Result := Result or Integer(WidgetFlags_WResizeNoErase);
end;
{$ENDIF}

function TcxCustomInnerMemo.GetContainer: TcxCustomMemo;
begin
  Result := TcxCustomMemo(Parent);
end;

{$IFDEF VCL}
procedure TcxCustomInnerMemo.WMClear(var Message);
begin
  if Container.FInternalAction then
    inherited
  else
    if not ReadOnly then
      with Container do
      begin
        KeyboardAction := True;
        ClearSelection;
        KeyboardAction := False;
      end;
end;

procedure TcxCustomInnerMemo.WMCut(var Message);
begin
  with Container do
  begin
    KeyboardAction := True;
    if not Self.ReadOnly then
      CutToClipboard
    else
      CopyToClipboard;
    KeyboardAction := False;
  end;
end;

procedure TcxCustomInnerMemo.WMEraseBkgnd(var Message: TWMEraseBkgnd);
var
  ABrush: HBRUSH;
  ASize: TSize;
  ATextHeight: Integer;
  AVisibleRowCount: Integer;
  R: TRect;
begin
  Message.Result := 1;
  if not DoubleBuffered or (TMessage(Message).WParam = TMessage(Message).LParam) then
  begin
    ASize.cy := Container.Canvas.TextHeight('Zg');
    AVisibleRowCount := ClientHeight div ASize.cy;
    if AVisibleRowCount > Lines.Count then
      AVisibleRowCount := Lines.Count;
    ATextHeight := AVisibleRowCount * ASize.cy;
    R := Rect(0, ATextHeight, ClientWidth, ClientHeight);
    ABrush := CreateSolidBrush(ColorToRGB(Color));
    try
      FillRect(Message.DC, R, ABrush);
    finally
      DeleteObject(ABrush);
    end;
  end;
end;

procedure TcxCustomInnerMemo.WMGetDlgCode(var Message: TWMGetDlgCode);
begin
  inherited;
  if GetKeyState(VK_CONTROL) >= 0 then
    Message.Result := Message.Result or DLGC_WANTTAB;
end;

procedure TcxCustomInnerMemo.WMKeyDown(var Message: TWMKeyDown);
var
  APrevState: TcxCustomInnerTextEditPrevState;
  AShiftState: TShiftState;
begin
  AShiftState := KeyDataToShiftState(Message.KeyData);
  SaveTextEditState(Self, APrevState);
  FInternalUpdating := False;
  inherited;
  Container.UpdateScrollBarsParameters;
  if FInternalUpdating then
    Exit;
  if not CheckTextEditState(Self, APrevState) and (Message.CharCode <> 0) and
      (Message.CharCode <> VK_UP) and (Message.CharCode <> VK_DOWN) then
    with Message do
    begin
      AShiftState := KeyDataToShiftState(KeyData);
      Container.DoAfterKeyDown(CharCode, AShiftState);
    end;
end;

procedure TcxCustomInnerMemo.WMKillFocus(var Message: TWMKillFocus);
begin
  inherited;
  if not(csDestroying in ComponentState) then
    Container.FocusChanged;
end;

procedure TcxCustomInnerMemo.WMNCPaint(var Message: TMessage);

  function GetScrollBarRect(AScrollBarKind: TScrollBarKind): TRect;
  const
    AScrollBarObjects: array [TScrollBarKind] of Longword = (OBJID_HSCROLL, OBJID_VSCROLL);
  var
    AScrollBarInfo: TScrollBarInfo;
    AScrollBarState: DWORD;
  begin
    FillChar(Result, SizeOf(Result), 0);
    if (csDestroying in ComponentState) or not HandleAllocated then
      Exit;
    AScrollBarInfo.cbSize := SizeOf(AScrollBarInfo);
    if not GetScrollBarInfoProc(Handle, Integer(AScrollBarObjects[AScrollBarKind]),
        AScrollBarInfo) then
      Exit;
    AScrollBarState := AScrollBarInfo.rgstate[0];
    if AScrollBarState and (STATE_SYSTEM_INVISIBLE or STATE_SYSTEM_OFFSCREEN) <> 0 then
      Exit;
    with AScrollBarInfo.rcScrollBar do
    begin
      Result.TopLeft := ScreenToClient(TopLeft);
      Result.Right := Result.Left + Right - Left;
      Result.Bottom := Result.Top + Bottom - Top;
    end;
  end;

  procedure ExcludeScrollBarRect(AScrollBarKind: TScrollBarKind);
  var
    ARgn: HRGN;
    R: TRect;
  begin
    R := GetScrollBarRect(AScrollBarKind);
    if not IsRectEmpty(R) then
    begin
      ARgn := CreateRectRgnIndirect(R);
      CombineRgn(Message.WParam, Message.WParam, ARgn, RGN_DIFF);
      DeleteObject(ARgn);
    end;
  end;

  function GetSizeGripRect: TRect;
  var
    RH, RV: TRect;
  begin
    FillChar(Result, SizeOf(Result), 0);
    RH := GetScrollBarRect(sbHorizontal);
    if IsRectEmpty(RH) then
      Exit;
    RV := GetScrollBarRect(sbVertical);
    if IsRectEmpty(RV) then
      Exit;
    Result := Rect(RV.Left, RH.Top, RV.Right, RH.Bottom);
  end;

  procedure FillSizeGrip;
  var
    R: TRect;
    ABrush: HBRUSH;
    ADC: HDC;
  begin
    if ScrollBars <> ssBoth then
      Exit;
    R := GetSizeGripRect;
    if not IsRectEmpty(R) then
    begin
      ABrush := 0;
      ADC := GetWindowDC(Handle);
      try
        ABrush := CreateSolidBrush(ColorToRGB(clBtnFace));
        FillRect(ADC, R, ABrush);
      finally
        if ABrush <> 0 then
          DeleteObject(ABrush);
        ReleaseDC(Handle, ADC);
      end;
    end;
  end;

var
  A: Integer;
begin
  if not UsecxScrollBars then
  begin
    inherited;
    Exit;
  end;
  A := GetWindowLong(Handle, GWL_STYLE);
  A := A and not(WS_HSCROLL or WS_VSCROLL);
  SetWindowLong(Handle, GWL_STYLE, A);
  inherited;
  A := GetWindowLong(Handle, GWL_STYLE);
  if ScrollBars in [ssHorizontal, ssBoth] then
    A := A or WS_HSCROLL;
  if ScrollBars in [ssVertical, ssBoth] then
    A := A or WS_VSCROLL;
  SetWindowLong(Handle, GWL_STYLE, A);
  FillSizeGrip;
end;

procedure TcxCustomInnerMemo.WMPaste(var Message);
begin
  if not ReadOnly then
    with Container do
    begin
      KeyboardAction := True;
      PasteFromClipboard;
      KeyboardAction := False;
    end;
end;

procedure TcxCustomInnerMemo.WMSetFocus(var Message: TWMSetFocus);
begin
  inherited;
  if not(csDestroying in ComponentState) and (Message.FocusedWnd <> Container.Handle) then
    Container.FocusChanged;
end;

procedure TcxCustomInnerMemo.WMSetFont(var Message: TWMSetFont);
begin
  inherited;
  if Container.IsInplace and NewStyleControls then
    SendMessage(Handle, EM_SETMARGINS, EC_LEFTMARGIN or EC_RIGHTMARGIN, 0);
end;

procedure TcxCustomInnerMemo.WMSetText(var Message: TWMSetText);
begin
  inherited;
  if FInternalTextSetting then
    Exit;
  FInternalTextSetting := True;
  try
    Container.EditValue := string(Message.Text);
  finally
    FInternalTextSetting := False;
  end;
end;

procedure TcxCustomInnerMemo.WMWindowPosChanged(var Message: TWMWindowPosChanged);
begin
  FResizing := False;
  Container.SetScrollBarsParameters;
  inherited;
end;

procedure TcxCustomInnerMemo.WMWindowPosChanging(var Message: TWMWindowPosChanged);
begin
  inherited;
  Container.SetScrollBarsParameters;
end;

procedure TcxCustomInnerMemo.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  if Message.lParam = 0 then
    MouseLeave(Self)
  else
    MouseLeave(TControl(Message.lParam));
end;

procedure TcxCustomInnerMemo.EMReplaceSel(var Message: TMessage);
var
  APrevLParam: Integer;
  S: string;
  I, L: Integer;
begin
  S := PChar(Message.LParam);
  L := Length(S);
  I := 1;
  while I < L do
    if (S[I] = #10) and (S[I + 1] = #13) then
    begin
      S[I] := #13;
      Inc(I);
      S[I] := #10;
      Inc(I);
      Insert(#13#10, S, I);
      Inc(I, 2);
    end
    else
    begin
      if (S[I] = #13) and (S[I + 1] = #10) then
        Inc(I);
      Inc(I);
    end;

  APrevLParam := Message.LParam;
  Message.LParam := Integer(PChar(S));
  try
    inherited;
    Container.FEditValue := Lines.Text;
  finally
    Message.LParam := APrevLParam;
  end;
end;
{$ELSE}
function TcxCustomInnerMemo.GetWantTabs: Boolean;
begin
  Result := inherited WantTabs;
end;

procedure TcxCustomInnerMemo.RestoreSelectionState;
begin
  with FSelectionState do
  begin
    QMultiLineEdit_setCursorPosition(Handle, SelectionStart.Line, SelectionStart.Col, False);
    QMultiLineEdit_setCursorPosition(Handle, SelectionEnd.Line, SelectionEnd.Col, True);
    QMultiLineEdit_setCursorPosition(Handle, CursorPosition.Line, CursorPosition.Col, True);
  end;
end;

procedure TcxCustomInnerMemo.SaveSelectionState;
begin
  with FSelectionState do
  begin
    QMultiLineEdit_getCursorPosition(Handle, @CursorPosition.Line, @CursorPosition.Col);
    QOpenMultiLineEdit_getMarkedRegion(Handle, @SelectionStart.Line,
      @SelectionStart.Col, @SelectionEnd.Line, @SelectionEnd.Col);
  end;
end;

procedure TcxCustomInnerMemo.SetCharCase(Value: TEditCharCase);
begin
  if Value <> FCharCase then
  begin
    FCharCase := Value;
    if Value <> ecNormal then
      Text := Text;
  end;
end;

procedure TcxCustomInnerMemo.SetWantTabs(Value: Boolean);
begin
  inherited WantTabs := Value;
end;
{$ENDIF}

initialization
  GetRegisteredEditProperties.Register(TcxMemoProperties, scxSEditRepositoryMemoItem);
  
end.

