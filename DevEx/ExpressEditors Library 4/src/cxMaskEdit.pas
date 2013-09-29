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
unit cxMaskEdit;

{$I cxEdVer.inc}

interface

uses
  {$IFDEF DELPHI6}
  Variants,
  {$ENDIF}
  {$IFDEF WIN32}
  Windows,
  {$ENDIF}
  {$IFDEF VCL}
  Messages,
  {$ELSE}
  Qt, QTypes,
  {$ENDIF}
  {$IFDEF LINUX}
  Libc,
  {$ENDIF}
  SysUtils, cxContainer, cxEdit, Classes, cxRegExpr, cxStandardMask, cxControls, Controls,
  StdCtrls, Forms, Clipbrd, cxEditConsts, cxClasses, cxTextEdit, cxDataUtils;

type
  TcxEditMask = type string;
  TcxEditMaskKind = (emkStandard, emkRegExpr, emkRegExprEx);

  TcxCustomMaskEdit = class;
  TcxCustomMaskEditProperties = class;

  { TcxCustomTextEditAccessor }
  TcxCustomTextEditAccessor = class(TcxCustomTextEdit);

  { EcxMaskEditError }
  EcxMaskEditError = class(Exception);

  { TcxMaskEditCustomMode }
  TcxMaskEditCustomMode = class
  private
    FEditMask: string;
    FCharCase: TEditCharCase;
    FEchoMode: TcxEditEchoMode;
    function GetProperties: TcxCustomMaskEditProperties;
  protected
    FClipboardTextLength: Integer;
    FEdit: TcxCustomMaskEdit;
    FNeedUpdateEditValue: Boolean;
    FProperties: TcxCustomMaskEditProperties;
    procedure ClearText;
    procedure DirectSetSelLength(AValue: Integer);
    procedure DirectSetSelStart(AValue: Integer);
    function GetMaskKind: TcxEditMaskKind; virtual;
    function HasEdit: Boolean;
    property CharCase: TEditCharCase read FCharCase write FCharCase;
    property EchoMode: TcxEditEchoMode read FEchoMode write FEchoMode;
    property EditMask: string read FEditMask;
    property Properties: TcxCustomMaskEditProperties read GetProperties write FProperties;
  public
    constructor Create(AEdit: TcxCustomMaskEdit; AProperties: TcxCustomMaskEditProperties); virtual;
    procedure AfterPasteFromClipboard; virtual; abstract;
    procedure BeepOnError;
    procedure Compile(AMask: string); virtual; abstract;
    function GetEmptyString: string; virtual; abstract;
    function GetFormattedText(AText: string): string; virtual; abstract;
    procedure GotoEnd; virtual; abstract;
    function IsCursorBegin: Boolean; virtual; abstract;
    function IsCursorEnd: Boolean; virtual; abstract;
    function IsFullValidText(AText: string): Boolean; virtual; abstract;
    procedure LMouseDown; virtual; abstract;
    procedure PrePasteFromClipboard; virtual; abstract;
    function PressBackSpace: Boolean; virtual; abstract;
    function PressDelete: Boolean; virtual; abstract;
    function PressEnd: Boolean; virtual; abstract;
    function PressHome: Boolean; virtual; abstract;
    function PressLeft: Boolean; virtual; abstract;
    function PressRight: Boolean; virtual; abstract;
    function PressSymbol(var ASymbol: Char): Boolean; virtual; abstract;
    procedure SetText(AText: string); virtual; abstract;
    procedure SynchronizeEditValue; virtual;
    procedure UpdateEditValue; virtual; abstract;
    function GetUpdatedText(const AText: string): string; virtual; abstract;
    property ClipboardTextLength: Integer read FClipboardTextLength write FClipboardTextLength;
  end;

  { TcxMaskEditStandardMode }
  TcxMaskEditStandardMode = class(TcxMaskEditCustomMode)
  protected
    FMask: TcxStandardMask;
    FSelStart: Integer;
  public
    constructor Create(AEdit: TcxCustomMaskEdit; AProperties: TcxCustomMaskEditProperties); override;
    destructor Destroy; override;
    procedure AfterPasteFromClipboard; override;
    procedure Compile(AMask: string); override;
    function GetBlank: Char;
    function GetEmptyString: string; override;
    function GetFormattedText(AText: string): string; override;
    procedure GotoEnd; override;
    function IsCursorBegin: Boolean; override;
    function IsCursorEnd: Boolean; override;
    function IsFullValidText(AText: string): Boolean; override;
    procedure LMouseDown; override;
    procedure PrePasteFromClipboard; override;
    function PressBackSpace: Boolean; override;
    function PressDelete: Boolean; override;
    function PressEnd: Boolean; override;
    function PressHome: Boolean; override;
    function PressLeft: Boolean; override;
    function PressRight: Boolean; override;
    function PressSymbol(var ASymbol: Char): Boolean; override;
    procedure SetText(AText: string); override;
    procedure SynchronizeEditValue; override;
    procedure UpdateEditValue; override;
    function GetUpdatedText(const AText: string): string; override;
  end;

  { TcxMaskEditRegExprMode }
  TcxMaskEditRegExprMode = class(TcxMaskEditCustomMode)
  protected
    FBeginCursor: Boolean;
    FHead: string;
    FRegExpr: TcxRegExpr;
    FSelect: string;
    FTail: string;
    FMouseAction: Boolean;
    procedure ClearTail;
    function CompileRegExpr(ARegExpr: TcxRegExpr): Boolean;
    procedure CursorCorrection;
    procedure DeleteSelection; virtual;
    function GetMaskKind: TcxEditMaskKind; override;
    function NextTail: Boolean;
    procedure RestoreSelection; virtual;
  public
    constructor Create(AEdit: TcxCustomMaskEdit; AProperties: TcxCustomMaskEditProperties); override;
    destructor Destroy; override;
    procedure AfterPasteFromClipboard; override;
    procedure Compile(AMask: string); override;
    function GetEmptyString: string; override;
    function GetFormattedText(AText: string): string; override;
    procedure GotoEnd; override;
    function IsCursorBegin: Boolean; override;
    function IsCursorEnd: Boolean; override;
    function IsFullValidText(AText: string): Boolean; override;
    procedure LMouseDown; override;
    procedure PrePasteFromClipboard; override;
    function PressBackSpace: Boolean; override;
    function PressDelete: Boolean; override;
    function PressEnd: Boolean; override;
    function PressHome: Boolean; override;
    function PressLeft: Boolean; override;
    function PressRight: Boolean; override;
    function PressSymbol(var ASymbol: Char): Boolean; override;
    procedure SetText(AText: string); override;
    procedure SetRegExprCaseInsensitive;
    procedure SynchronizeEditValue; override;
    procedure UpdateEditValue; override;
    function GetUpdatedText(const AText: string): string; override;
  end;

  { TcxMaskEditRegExprExMode }
  TcxMaskEditRegExprExMode = class(TcxMaskEditRegExprMode)
  private
    FInternalUpdate: string;
    procedure InternalSymbolUpdate(ASymbol: Char);
  protected
    FDeleteNumber: Integer;
    FNewCursorPos: Integer;
    FUpdate: string;
    procedure Clear;
    procedure CursorCorrection;
    procedure DeleteSelection; override;
    function GetMaskKind: TcxEditMaskKind; override;
    procedure RestoreSelection; override;
    procedure SymbolDelete;
    procedure SymbolUpdate(ASymbol: Char);
    procedure UpdateTail;
  public
    constructor Create(AEdit: TcxCustomMaskEdit; AProperties: TcxCustomMaskEditProperties); override;
    destructor Destroy; override;
    procedure AfterPasteFromClipboard; override;
    procedure Compile(AMask: string); override;
    function GetEmptyString: string; override;
    function GetFormattedText(AText: string): string; override;
    procedure GotoEnd; override;
    function IsFullValidText(AText: string): Boolean; override;
    procedure PrePasteFromClipboard; override;
    function PressBackSpace: Boolean; override;
    function PressDelete: Boolean; override;
    function PressEnd: Boolean; override;
    function PressHome: Boolean; override;
    function PressLeft: Boolean; override;
    function PressRight: Boolean; override;
    function PressSymbol(var ASymbol: Char): Boolean; override;
    procedure SetText(AText: string); override;
    procedure UpdateEditValue; override;
  end;

  { TcxCustomMaskEditProperties }

  TcxCustomMaskEditProperties = class(TcxCustomTextEditProperties)
  private
    FCaseInsensitive: Boolean;
    FEditMask: TcxEditMask;
    FEmptyString: string;
    FIgnoreMaskBlank: Boolean;
    FMaskKind: TcxEditMaskKind;
    FTempMode: TcxMaskEditCustomMode;
    FAlwaysShowBlanksAndLiterals: Boolean;
    function CreateMode: TcxMaskEditCustomMode;
    function CreateMode1: TcxMaskEditCustomMode;
    function GetEditMask: TcxEditMask;
    function GetIsMasked: Boolean;
    procedure SetAlwaysShowBlanksAndLiterals(AValue: Boolean);
    procedure SetCaseInsensitive(AValue: Boolean);
    procedure SetEditMask(Value: TcxEditMask);
    procedure SetMaskKind(Value: TcxEditMaskKind);
    function SpaceToken(AToken: Char): Boolean;
    function TestTempEditMask: Boolean;
    function TestTempMaskKind: Boolean;
  protected
    function EmptyMask(AMask: string): Boolean;
    function GetEmptyString: string;
    procedure SetCharCase(Value: TEditCharCase); override;
    procedure SetMaxLength(Value: Integer); override;
    function GetDisplayFormatOptions: TcxEditDisplayFormatOptions; override;
    function UseLookupData: Boolean; override;
    property CaseInsensitive: Boolean read FCaseInsensitive write SetCaseInsensitive
      default True;
    property EditMask: TcxEditMask read GetEditMask write SetEditMask;
    property IgnoreMaskBlank: Boolean read FIgnoreMaskBlank write FIgnoreMaskBlank
      default False;
    property MaskKind: TcxEditMaskKind read FMaskKind write SetMaskKind default emkStandard;
    property ValidateOnEnter default True;
  public
    constructor Create(AOwner: TPersistent); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    class function GetContainerClass: TcxContainerClass; override;
//    function GetEditValueSource(AEditFocused: Boolean): TcxDataEditValueSource; override;
    function IsEditValueValid(var EditValue: TcxEditValue; AEditFocused: Boolean): Boolean; override;
    procedure PrepareDisplayValue(const AEditValue: TcxEditValue; var DisplayValue: TcxEditValue;
      AEditFocused: Boolean); override;
    procedure ValidateDisplayValue(var ADisplayValue: TcxEditValue; var AErrorText: TCaption;
      var Error: Boolean; AEdit: TcxCustomEdit); override;
    property IsMasked: Boolean read GetIsMasked;
    property AlwaysShowBlanksAndLiterals: Boolean read FAlwaysShowBlanksAndLiterals write SetAlwaysShowBlanksAndLiterals;
  end;

  TcxMaskEditProperties = class;

  { TcxCustomMaskEdit }

  TcxCustomMaskEdit = class(TcxCustomTextEdit)
  private
    FMode: TcxMaskEditCustomMode;
    FMyMessage: Boolean;
    FShiftOn: Boolean;
    FText: TCaption;
    function GetEditText: TCaption;
    function GetProperties: TcxMaskEditProperties;
    function InternalGetEmptyString: string;
    procedure InternalSetValue(AValue: string);
    function IsCursorBegin: Boolean;
    function IsCursorEnd: Boolean;
    procedure SetEditText(AValue: TCaption);
    procedure SetProperties(const Value: TcxMaskEditProperties);
    procedure SendMyKeyDown(Key: Word; Shift: TShiftState);
    procedure SendMyKeyPress(AKey: Char);
  protected
    procedure ChangeHandler(Sender: TObject); override;
    procedure DblClick; override;
    procedure DoEnter; override;
    procedure DoEditKeyDown(var Key: Word; Shift: TShiftState); override;
    procedure DoEditKeyPress(var Key: Char); override;
    procedure DoEditKeyUp(var Key: Word; Shift: TShiftState); override;
    function InternalGetText: TCaption; override;
    procedure InternalSetDisplayValue(const Value: TcxEditValue); override;
    function InternalSetText(const Value: TCaption): Boolean; override;
    procedure Loaded; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure PropertiesChanged(Sender: TObject); override;
    procedure RepositoryItemAssigned; override;
    procedure SetSelLength(Value: Integer); override;
    procedure SetSelStart(Value: Integer); override;
    procedure SetSelText(const Value: TCaption); override;
    procedure SynchronizeDisplayValue; override;
    property Mode: TcxMaskEditCustomMode read FMode;
    property Properties: TcxMaskEditProperties read GetProperties write SetProperties;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure CutToClipboard; override;
    class function GetPropertiesClass: TcxCustomEditPropertiesClass; override;
    procedure PasteFromClipboard; override;
    procedure PrepareEditValue(const ADisplayValue: TcxEditValue;
      out EditValue: TcxEditValue; AEditFocused: Boolean); override;
    property EditText: TCaption read GetEditText write SetEditText;
  end;

  { TcxMaskEditProperties }

  TcxMaskEditProperties = class(TcxCustomMaskEditProperties)
  published
    property Alignment;
    property AutoSelect;
    property BeepOnError;
    property CaseInsensitive;
    property CharCase;
    property EchoMode;
    property HideSelection;
    property IgnoreMaskBlank;
    property LookupItems;
    property LookupItemsSorted;
    property MaskKind;
    property EditMask;
    property MaxLength;
    {$IFDEF VCL}
    property OEMConvert;
    {$ENDIF}
    property ReadOnly;
    property UseLeftAlignmentOnEditing;
    property ValidateOnEnter;
    property OnChange;
    property OnEditValueChanged;
    property OnNewLookupDisplayText;
    property OnValidate;
  end;

  { TcxMaskEdit }

  TcxMaskEdit = class(TcxCustomMaskEdit)
  published
    property Anchors;
    property AutoSize;
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
    property Text;
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

function IsAlphaChar(ch: Char): Boolean;
//function GetSaveLiteralChars(AMaskEdit: TcxCustomMaskEdit): Boolean;

implementation

function IsAlphaChar(ch: Char): Boolean;
begin
{$IFDEF LINUX}
  Result := IsAlpha(Integer(ch)) <> 0;
{$ENDIF}
{$IFDEF WIN32}
  Result := IsCharAlpha(ch);
{$ENDIF}
end;

{function GetSaveLiteralChars(AMaskEdit: TcxCustomMaskEdit): Boolean;
begin
  Result := False;
  if AMaskEdit.Mode is TcxMaskEditStandardMode then
    if TcxMaskEditStandardMode(AMaskEdit.Mode).FMask <> nil then
      Result := TcxMaskEditStandardMode(AMaskEdit.Mode).FMask.SaveLiteralCharacters;
end;}

function IsAlphaNumericChar(ch: Char): Boolean;
begin
  {$IFDEF LINUX}
  Result := IsAlNum(Integer(ch)) <> 0;
  {$ENDIF}
  {$IFDEF WIN32}
  Result := IsCharAlphaNumeric(ch);
  {$ENDIF}
end;

{ TcxMaskEditCustomMode }

constructor TcxMaskEditCustomMode.Create(AEdit: TcxCustomMaskEdit;
    AProperties: TcxCustomMaskEditProperties);
begin
  FEdit := AEdit;
  FProperties := AProperties;
  FClipboardTextLength := 0;
  FNeedUpdateEditValue := False;
  FCharCase := ecNormal;
  FEchoMode := eemNormal;
end;

procedure TcxMaskEditCustomMode.BeepOnError;
begin
  if Properties.BeepOnError then
    Beep;
end;

procedure TcxMaskEditCustomMode.SynchronizeEditValue;
var
  ADisplayValue: Variant;
begin
  if HasEdit then
  begin
    with FEdit do
    begin
      if ModifiedAfterEnter then
      begin
        ADisplayValue := TcxCustomTextEditAccessor(FEdit).DisplayValue;
        ADisplayValue := GetFormattedText(ADisplayValue);
      end
      else
        Properties.PrepareDisplayValue(EditValue, ADisplayValue, Focused);
    end;
    FEdit.SetInternalDisplayValue(ADisplayValue);
  end;
end;

procedure TcxMaskEditCustomMode.ClearText;
begin
  if HasEdit then
    FEdit.DataBinding.UpdateEdit;
end;

procedure TcxMaskEditCustomMode.DirectSetSelLength(AValue: Integer);
begin
  TcxCustomTextEditAccessor(FEdit).InnerTextEdit.SelLength := AValue;
end;

procedure TcxMaskEditCustomMode.DirectSetSelStart(AValue: Integer);
begin
  TcxCustomTextEditAccessor(FEdit).InnerTextEdit.SelStart := AValue;
end;

function TcxMaskEditCustomMode.GetMaskKind: TcxEditMaskKind;
begin
  Result := emkStandard;
end;

function TcxMaskEditCustomMode.HasEdit: Boolean;
begin
  Result := (FEdit <> nil) and not FEdit.PropertiesChangeLocked;
end;

function TcxMaskEditCustomMode.GetProperties: TcxCustomMaskEditProperties;
begin
  Result := FProperties
end;

{ TcxMaskEditStandardMode }

constructor TcxMaskEditStandardMode.Create(AEdit: TcxCustomMaskEdit;
  AProperties: TcxCustomMaskEditProperties);
begin
  inherited Create(AEdit, AProperties);

  FMask := TcxStandardMask.Create;
end;

destructor TcxMaskEditStandardMode.Destroy;
begin
  FMask.Free;
end;

procedure TcxMaskEditStandardMode.AfterPasteFromClipboard;
var
  AText: string;
begin
  AText := Clipboard.AsText;
  FEdit.SelStart := FSelStart + Length(AText);
  if FEdit.SelStart >= Length(FEdit.EditText) then
    FEdit.SelStart := Length(FEdit.EditText) - 1;
  if FEdit.SelStart < 0 then
    FEdit.SelStart := 0;
  if FMask.Items[FEdit.SelStart] is TcxStandardMaskLiteralItem then
  begin
    FEdit.FShiftOn := False;
    PressRight;
  end;
end;

procedure TcxMaskEditStandardMode.Compile(AMask: string);
begin
  FEditMask := AMask;
  if Properties.EmptyMask(AMask) then
    Exit;

  FMask.Compile(AMask);

  FNeedUpdateEditValue := not HasEdit;
end;

function TcxMaskEditStandardMode.GetBlank: Char;
begin
  Result := FMask.Blank;
end;

function TcxMaskEditStandardMode.GetEmptyString: string;
begin
  Result := FMask.EmptyString;
end;

function TcxMaskEditStandardMode.GetFormattedText(AText: string): string;
begin
  FMask.Format(AText);
  Result := AText;
end;

procedure TcxMaskEditStandardMode.GotoEnd;
begin
end;

function TcxMaskEditStandardMode.IsCursorBegin: Boolean;
var
  I: Integer;
  ACount: Integer;
begin
  ACount := 0;
  for I := 0 to FMask.Count - 1 do
  begin
    if FMask.Items[I] is TcxStandardMaskLiteralItem then
      Inc(ACount)
    else
      Break;
  end;
  Result := (FEdit.SelStart <= ACount) and (FEdit.SelLength <= 1) or
    (FEdit.SelStart <= ACount) and (FEdit.CursorPos = FEdit.SelStart);
end;

function TcxMaskEditStandardMode.IsCursorEnd: Boolean;
begin
  Result := FEdit.SelStart = Length(FEdit.EditText);  
end;

function TcxMaskEditStandardMode.IsFullValidText(AText: string): Boolean;
begin
  Result := FMask.IsFullValid(AText);
  if not Result and Properties.IgnoreMaskBlank then
    Result := AText = GetFormattedText('');
end;

procedure TcxMaskEditStandardMode.LMouseDown;
begin
  if FEdit.HandleAllocated and Properties.IsMasked then
  begin
    if FEdit.SelLength = 0 then
      DirectSetSelLength(1);
  end;
end;

procedure TcxMaskEditStandardMode.PrePasteFromClipboard;
var
  AText: string;
begin
  AText := Clipboard.AsText;
  FSelStart := FEdit.SelStart;
  DirectSetSelStart(FSelStart);
  DirectSetSelLength(Length(AText));
end;

function TcxMaskEditStandardMode.PressBackSpace: Boolean;
begin
  Result := False;

  if FEdit.SelLength <= 1 then
    PressLeft;
  PressDelete;
end;

function TcxMaskEditStandardMode.PressDelete: Boolean;
var
  AText: string;
  ASelStart: Integer;
  I: Integer;
begin
  Result := False;

  AText := FEdit.EditText;
  ASelStart := FEdit.SelStart;
  for I := FEdit.SelStart to FEdit.SelStart + FEdit.SelLength - 1 do
  begin
    if FMask.Items[I] is TcxStandardMaskManyItem then
    begin
      Delete(AText, I + 1, 1);
      Insert(FMask.Blank, AText, I + 1);
      FEdit.SetInternalDisplayValue(AText);
      FEdit.SelStart := ASelStart;
    end;
  end;
end;

function TcxMaskEditStandardMode.PressEnd: Boolean;
begin
  if FEdit.FShiftOn then
  begin
    Result := True;
    Exit;
  end
  else
    Result := False;

  FEdit.SelStart := Length(FEdit.EditText);
end;

function TcxMaskEditStandardMode.PressHome: Boolean;
begin
  if FEdit.FShiftOn then
  begin
    Result := True;
    Exit;
  end
  else
    Result := False;

  FEdit.SelStart := 0;
  if FMask.Count > 0 then
    if FMask.Items[FEdit.SelStart] is TcxStandardMaskLiteralItem then
      PressRight;
end;

function TcxMaskEditStandardMode.PressLeft: Boolean;
  function GetSelStart: Integer;
  var
    I: Integer;
    AReset: Boolean;
    AEnd: Integer;
  begin
    Result := 0;
    AReset := True;
    AEnd := FEdit.SelStart + FEdit.SelLength;
    if AEnd >= Length(FEdit.EditText) then
      Dec(AEnd);
    if AEnd < 0 then
      AEnd := 0;
    for I := FEdit.SelStart to AEnd do
    begin
      if FMask.Items[I] is TcxStandardMaskLiteralItem then
        Inc(Result)
      else
      begin
        AReset := False;
        Break;
      end;
    end;
    if AReset then
    begin
      if FEdit.SelStart + FEdit.SelLength >= Length(FEdit.EditText) then
      begin
        Result := AEnd - FEdit.SelStart;
        Inc(Result);
      end
      else
        Result := 0;
    end;
  end;
var
  ADec: Integer;
  ALeftLiteralCount: Integer;
  I: Integer;
begin
  if FEdit.FShiftOn then
  begin
    if FEdit.SelLength = 1 then
    begin
      FEdit.SelStart := FEdit.SelStart + 1;
      FEdit.SelLength := 0;
      {$IFDEF VCL}
      FEdit.SendMyKeyDown(VK_LEFT, []);
      FEdit.SendMyKeyDown(VK_LEFT, []);
      {$ELSE}
      if FEdit.FShiftOn then
      begin
        FEdit.SendMyKeyDown(VK_LEFT, [ssShift]);
        FEdit.SendMyKeyDown(VK_LEFT, [ssShift]);
      end
      else
      begin
        FEdit.SendMyKeyDown(VK_LEFT, []);
        FEdit.SendMyKeyDown(VK_LEFT, []);
      end;
      {$ENDIF}
    end;

    Result := True;
    Exit;
  end
  else
    Result := False;

  if FEdit.SelLength > 1 then
  begin
    I := FEdit.SelStart + GetSelStart;
    FEdit.SelStart := 0;
    FEdit.SelStart := I;
    Exit;
  end;

  ALeftLiteralCount := 0;
  for I := FEdit.SelStart - 1 downto 0 do
  begin
    if FMask.Items[I] is TcxStandardMaskLiteralItem then
      Inc(ALeftLiteralCount)
    else
      Break;
  end;

  ADec := ALeftLiteralCount + 1;
  if FEdit.SelStart - ADec < 0 then
    ADec := 0;

  if FEdit.SelStart > 0 then
    FEdit.SelStart := FEdit.SelStart - ADec;
end;

function TcxMaskEditStandardMode.PressRight: Boolean;
  function GetSelStart(AI: Integer): Integer;
  var
    I: Integer;
    AReset: Boolean;
  begin
    Result := 0;
    AReset := True;
    for I := AI downto FEdit.SelStart do
    begin
      if FMask.Items[I] is TcxStandardMaskLiteralItem then
        Inc(Result)
      else
      begin
        AReset := False;
        Break;
      end;
    end;
    if AReset then
      Result := 0;
  end;
var
  AInc: Integer;
  ARightLiteralCount: Integer;
  I: Integer;
begin
  if FEdit.FShiftOn then
  begin
    if (FEdit.SelLength = 1) and (FEdit.SelStart = FEdit.CursorPos) then
      FEdit.SelLength := 0;

    Result := True;
    Exit;
  end
  else
    Result := False;

  if FEdit.SelLength > 1 then
  begin
    I := FEdit.SelStart + FEdit.SelLength;
    if I < Length(FEdit.EditText) then
    begin
      Dec(I);
      Dec(I, GetSelStart(I));
    end;
    FEdit.SelStart := 0;
    FEdit.SelStart := I;
    Exit;
  end;

  ARightLiteralCount := 0;
  for I := FEdit.SelStart + 1 to FMask.Count - 1 do
  begin
    if FMask.Items[I] is TcxStandardMaskLiteralItem then
      Inc(ARightLiteralCount)
    else
      Break;
  end;

  AInc := ARightLiteralCount + 1;
  if FEdit.SelStart + AInc > Length(FEdit.EditText) then
    AInc := 0;

  FEdit.SelStart := FEdit.SelStart + AInc;
end;

function TcxMaskEditStandardMode.PressSymbol(var ASymbol: Char): Boolean;
var
  AText: string;
  ASelStart: Integer;
begin
  Result := False;
  if Length(FEdit.EditText) <= 0 then
    Exit;
  if FEdit.SelStart >= Length(FEdit.EditText) then
    Exit;
  if FMask.Items[FEdit.SelStart] is TcxStandardMaskLiteralItem then
  begin
    FEdit.FShiftOn := False;
    if FEdit.SelLength > 1 then
    begin
      ASelStart := FEdit.SelStart;
      FEdit.SelStart := ASelStart;
    end;
    ASelStart := FEdit.SelStart;
    PressRight;
    if  FEdit.SelStart > ASelStart then
      PressSymbol(ASymbol);
  end
  else
  begin
    if FMask.Items[FEdit.SelStart].Check(ASymbol) then
    begin
      AText := FEdit.EditText;
      ASelStart := FEdit.SelStart;
      Delete(AText, FEdit.SelStart + 1 , 1);
      Insert(ASymbol, AText, FEdit.SelStart + 1);
      FEdit.SetInternalDisplayValue(AText);
      FEdit.SelStart := ASelStart;
      FEdit.FShiftOn := False;
      PressRight;
    end
    else
      BeepOnError;
  end;
end;

procedure TcxMaskEditStandardMode.SetText(AText: string);
begin
  LMouseDown;
end;

procedure TcxMaskEditStandardMode.SynchronizeEditValue;
begin
  inherited SynchronizeEditValue;
  LMouseDown;
end;

procedure TcxMaskEditStandardMode.UpdateEditValue;
begin
  if FNeedUpdateEditValue then
  begin
    FEdit.EditValue := FMask.EmptyString;
    FNeedUpdateEditValue := False;
  end;
end;

function TcxMaskEditStandardMode.GetUpdatedText(const AText: string): string;
begin
  Result := AText;
  if FMask.Count > 0 then
  begin
    FMask.Format(Result, Properties.CharCase = ecNormal);
    FMask.Format2(Result);
  end;
end;

{ TcxMaskEditRegExprMode }

constructor TcxMaskEditRegExprMode.Create(AEdit: TcxCustomMaskEdit;
    AProperties: TcxCustomMaskEditProperties);
begin
  inherited Create(AEdit, AProperties);

  FRegExpr := TcxRegExpr.Create;
  FRegExpr.CaseInsensitive := Properties.CaseInsensitive;
  FMouseAction := False;
end;

destructor TcxMaskEditRegExprMode.Destroy;
begin
  FRegExpr.Free;
end;

procedure TcxMaskEditRegExprMode.AfterPasteFromClipboard;
begin
end;

procedure TcxMaskEditRegExprMode.Compile(AMask: string);
var
  I: Integer;
  AStream: TStringStream;
  AStr: string;
begin
  FEditMask := AMask;
  if Properties.EmptyMask(AMask) then
    Exit;

  AStream := TStringStream.Create(AMask);
  try
    try
      FRegExpr.Compile(AStream);
    except
      on E: EcxRegExprError do
      begin
        AStr := cxGetResourceString(@scxMaskEditRegExprError);
        for I := 0 to E.Errors.Count - 1 do
          AStr := AStr + #13#10 + E.Errors[I].FullMessage;
        raise EcxMaskEditError.Create(AStr);
      end;
    end;
  finally
    AStream.Free;
  end;
end;

function TcxMaskEditRegExprMode.PressDelete: Boolean;
begin
  CursorCorrection;
  if FEdit.SelLength <= 0 then
  begin
    if FTail <> '' then
    begin
      FSelect := FTail[1];
      Delete(FTail, 1, 1);

      if not NextTail then
      begin
        ClearTail;
        if FEdit.SelStart > 0 then
          DirectSetSelStart(FEdit.SelStart - 1);
      end;
    end;

    Result := True;
  end
  else
  begin
    DeleteSelection;
    if NextTail then
      Result := True
    else
    begin
      FEdit.SendMyKeyDown(VK_DELETE, []);
      ClearTail;

      Result := False;
    end;
  end;

  FSelect := '';

  if not Result then
    BeepOnError;
end;

function TcxMaskEditRegExprMode.PressEnd: Boolean;
var
  I: Integer;
begin
  CursorCorrection;
  Result := True;

  if FTail <> '' then
  begin
    for I := 1 to Length(FTail) do
      FRegExpr.Next(FTail[I]);

    FHead := FHead + FTail;
    FTail := '';
  end;
end;

function TcxMaskEditRegExprMode.PressHome: Boolean;
begin
  CursorCorrection;
  Result := True;

  if FHead <> '' then
  begin
    FTail := FHead + FTail;
    FHead := '';
    FRegExpr.Reset;
  end;
end;

function TcxMaskEditRegExprMode.GetEmptyString: string;
begin
  Result := ''; 
end;

function TcxMaskEditRegExprMode.GetFormattedText(AText: string): string;
var
  I: Integer;
begin
  if not FRegExpr.IsCompiled then
  begin
    Result := '';
    Exit;
  end;
  FRegExpr.Reset;
  Result := '';
  for I := 1 to Length(AText) do
  begin
    if FRegExpr.Next(AText[I]) then
      Result := Result + AText[I];
  end;
end;

procedure TcxMaskEditRegExprMode.GotoEnd;
var
  I: Integer;
begin
  CursorCorrection;
  if FTail = '' then
    Exit;

  for I := 1 to Length(FTail) do
    FRegExpr.Next(FTail[I]);

  FHead := FHead + FTail;
  FTail := '';
end;

function TcxMaskEditRegExprMode.IsCursorBegin: Boolean;
begin
  Result :=  FEdit.SelStart = 0;
end;

function TcxMaskEditRegExprMode.IsCursorEnd: Boolean;
begin
  Result := FEdit.SelStart = Length(FEdit.Text);
end;

function TcxMaskEditRegExprMode.IsFullValidText(AText: string): Boolean;
var
  ARegExpr: TcxRegExpr;
  I: Integer;
begin
  Result := AText = '';

  if not Result then
  begin
    ARegExpr := TcxRegExpr.Create;
    ARegExpr.CaseInsensitive := Properties.CaseInsensitive; 

    Result := CompileRegExpr(ARegExpr);
    if Result then
    begin
      for I := 1 to Length(AText) do
      begin
        if not ARegExpr.Next(AText[I]) then
        begin
          Result := False;
          Break;
        end;
      end;

      if Result then
        if not Properties.IgnoreMaskBlank then
          Result := ARegExpr.IsFinal;
    end;

    ARegExpr.Free;
  end;
end;

procedure TcxMaskEditRegExprMode.LMouseDown;
begin
  FMouseAction := True;
end;

procedure TcxMaskEditRegExprMode.PrePasteFromClipboard;
begin
end;

function TcxMaskEditRegExprMode.PressBackSpace: Boolean;
begin
  CursorCorrection;
  if FEdit.SelLength <= 0 then
  begin
    if FHead <> '' then
    begin
      FRegExpr.Prev;
      if NextTail then
        Delete(FHead, Length(FHead), 1)
      else
        ClearTail;
    end;

    Result := True;
  end
  else
  begin
    DeleteSelection;
    if NextTail then
      Result := True
    else
    begin
     {$IFDEF VCL}
      FEdit.SendMyKeyPress(#8);
     {$ELSE}
      FEdit.SendMyKeyDown(Key_Backspace, []);
     {$ENDIF}

      ClearTail;

      Result := False;
    end;
  end;

  FSelect := '';

  if not Result then
    BeepOnError;  
end;

function TcxMaskEditRegExprMode.PressLeft: Boolean;
var
  I: Integer;
begin
  CursorCorrection;
  Result := True;

  if FHead <> '' then
  begin
   if FEdit.SelLength > 0 then
   begin
     if (FEdit.CursorPos = FEdit.SelStart + FEdit.SelLength) and
         not FEdit.FShiftOn then
     begin
       for I := 0 to FEdit.SelLength - 1 do
       begin
         FRegExpr.Prev;
         FTail := FHead[Length(FHead)] + FTail;
         Delete(FHead, Length(FHead), 1);
       end;

       Exit;
     end
     else if (FEdit.CursorPos = FEdit.SelStart) and not FEdit.FShiftOn then
       Exit;
   end;

   FRegExpr.Prev;
   FTail := FHead[Length(FHead)] + FTail;
   Delete(FHead, Length(FHead), 1);
  end;
end;

function TcxMaskEditRegExprMode.PressRight: Boolean;
var
  I: Integer;
begin
  CursorCorrection;
  Result := True;

  if FTail <> '' then
  begin
    if FEdit.SelLength > 0 then
    begin
      if (FEdit.CursorPos = FEdit.SelStart) and
          not FEdit.FShiftOn then
      begin
        for I := 0 to FEdit.SelLength - 1 do
        begin
          FRegExpr.Next(FTail[1]);
          FHead := FHead + FTail[1];
          Delete(FTail, 1, 1);
        end;

        Exit;
      end
      else if (FEdit.CursorPos = FEdit.SelStart + FEdit.SelLength) and
          not FEdit.FShiftOn then
        Exit;
    end;

    FRegExpr.Next(FTail[1]);
    FHead := FHead + FTail[1];
    Delete(FTail, 1, 1);
  end;
end;

function TcxMaskEditRegExprMode.PressSymbol(var ASymbol: Char): Boolean;
begin
  CursorCorrection;
  if FEdit.SelLength > 0 then
    DeleteSelection;

  if FRegExpr.Next(ASymbol) then
  begin
    FHead := FHead + ASymbol;
    if not NextTail then
    begin
      if FSelect <> '' then
      begin
        FEdit.SendMyKeyDown(VK_DELETE, []);
        FEdit.SendMyKeyPress(ASymbol);
        Result := False;
      end
      else
        Result := True;

      ClearTail;
    end
    else
      Result := True;
  end
  else
  begin
    RestoreSelection;
    Result := False;
  end;

  FSelect := '';

  if not Result then
    BeepOnError;
end;

procedure TcxMaskEditRegExprMode.SetText(AText: string);
var
  I: Integer;
begin
  FRegExpr.Reset;

  if ClipboardTextLength > 0 then
  begin
    FRegExpr.Reset;
    for I := 1 to FEdit.SelStart + ClipboardTextLength do
      FRegExpr.Next(AText[I]);

    FHead := Copy(AText, 1, FEdit.SelStart + ClipboardTextLength);
    FTail := Copy(AText, FEdit.SelStart + ClipboardTextLength + 1, Length(AText));

    ClipboardTextLength := 0;
  end
  else
  begin
    FHead := '';
    FTail := AText;
  end;
end;

procedure TcxMaskEditRegExprMode.SetRegExprCaseInsensitive;
begin
  FRegExpr.CaseInsensitive := Properties.CaseInsensitive; 
end;

procedure TcxMaskEditRegExprMode.UpdateEditValue;
begin
end;

function TcxMaskEditRegExprMode.GetUpdatedText(const AText: string): string;
begin
  Result := AText; 
end;

procedure TcxMaskEditRegExprMode.ClearTail;
var
  AStr: string;
begin
  AStr := FEdit.DataBinding.DisplayValue;
  Delete(AStr, FEdit.SelStart + 1, Length(FTail));
  FEdit.DataBinding.DisplayValue := AStr;
  DirectSetSelStart(Length(AStr));
  FTail := '';
end;

function TcxMaskEditRegExprMode.CompileRegExpr(
  ARegExpr: TcxRegExpr): Boolean;
begin
  if FRegExpr.Stream = nil then
  begin
    Result := False;
    Exit;
  end;

  Result := True;
  try
    ARegExpr.Compile(FRegExpr.Stream);
  except
    on EcxMaskEditError do
      Result := False;
  end;
end;

procedure TcxMaskEditRegExprMode.CursorCorrection;
var
  I: Integer;
  ASymbol: Char;
begin
  if ((FHead = '') and (FTail = '') and (FEdit.Text <> '')) or FMouseAction then
  begin
    FMouseAction := False;
    FRegExpr.Reset;
    FTail := FEdit.Text;
    FHead := '';
    for I := 0 to FEdit.CursorPos - 1 do
    begin
      if Length(FEdit.Text) > I then
      begin
        ASymbol := Char(FEdit.Text[I + 1]);
        FRegExpr.Next(ASymbol);
        FHead := FHead + FTail[I + 1];
        Delete(FTail, 1, 1);
      end;
    end;
  end;
end;

procedure TcxMaskEditRegExprMode.DeleteSelection;
var
  I: Integer;
begin
  if FEdit.SelStart = Length(FHead) then  // Begin cursor
  begin
    FSelect := Copy(FTail, 1, FEdit.SelLength);
    Delete(FTail, 1, FEdit.SelLength);

    FBeginCursor := True;
  end
  else if (FEdit.SelStart + FEdit.SelLength) = Length(FHead) then // End cursor
  begin
    FSelect := Copy(FHead, FEdit.SelStart + 1, FEdit.SelLength);
    Delete(FHead, FEdit.SelStart + 1, FEdit.SelLength);
    for I := 1 to Length(FSelect) do
      FRegExpr.Prev;

    FBeginCursor := False;
  end;
end;

function TcxMaskEditRegExprMode.GetMaskKind: TcxEditMaskKind;
begin
  Result := emkRegExpr;
end;

function TcxMaskEditRegExprMode.NextTail: Boolean;
var
  I, J: Integer;
  NextNumber: Integer;
begin
  NextNumber := 0;

  for I := 1 to Length(FTail) do
    if FRegExpr.Next(FTail[I]) then
      Inc(NextNumber)
    else
    begin
      for J := 0 to NextNumber - 1 do
        FRegExpr.Prev;

      Result := False;
      Exit;
    end;

  for I := 1 to Length(FTail) do
    FRegExpr.Prev;

  Result := True;
end;

procedure TcxMaskEditRegExprMode.RestoreSelection;
var
  I: Integer;
begin
  if FBeginCursor then
    FTail := FSelect + FTail
  else
  begin
    FHead := FHead + FSelect;
    for I := 1 to Length(FSelect) do
      FRegExpr.Next(FSelect[I]);
  end;
end;

procedure TcxMaskEditRegExprMode.SynchronizeEditValue;
begin
  inherited SynchronizeEditValue;
  FEdit.SetSelStart(Length(FEdit.Text));
  FHead := FEdit.Text;
  FTail := '';
  FRegExpr.Reset;
  FRegExpr.NextEx(FHead);
end;

{ TcxMaskEditRegExprExMode }

constructor TcxMaskEditRegExprExMode.Create(AEdit: TcxCustomMaskEdit;
    AProperties: TcxCustomMaskEditProperties);
begin
  inherited Create(AEdit, AProperties);

  FRegExpr.OnSymbolUpdate := SymbolUpdate;
  FRegExpr.OnSymbolDelete := SymbolDelete;
  FRegExpr.UpdateOn := True;
  FNewCursorPos := -1;
  Clear;
end;

destructor TcxMaskEditRegExprExMode.Destroy;
begin
  inherited Destroy;
end;

procedure TcxMaskEditRegExprExMode.Clear;
begin
  FUpdate := '';
  FDeleteNumber := 0; 
end;

procedure TcxMaskEditRegExprExMode.RestoreSelection;
begin
  FRegExpr.UpdateOn := False;

  inherited RestoreSelection;

  FRegExpr.UpdateOn := True;

  if FUpdate <> '' then
  begin
    FRegExpr.Prev;
    Clear; 
  end;
end;

procedure TcxMaskEditRegExprExMode.SymbolDelete;
begin
  Inc(FDeleteNumber);
end;

procedure TcxMaskEditRegExprExMode.SymbolUpdate(ASymbol: Char);
begin
  FUpdate := FUpdate + ASymbol;
end;

procedure TcxMaskEditRegExprExMode.AfterPasteFromClipboard;
begin
  if FNewCursorPos < 0 then
    Exit;

  DirectSetSelStart(FNewCursorPos);
  FNewCursorPos := -1;
end;

procedure TcxMaskEditRegExprExMode.Compile(AMask: string);
var
  I: Integer;
  AStream: TStringStream;
  AStr: string;
begin
  Clear;
  FEditMask := AMask;
  if Properties.EmptyMask(AMask) then
    Exit;

  AStream := TStringStream.Create(AMask);
  try
    try
      FRegExpr.Compile(AStream);
    except
      on E: EcxRegExprError do
      begin
        AStr := cxGetResourceString(@scxMaskEditRegExprError);
        for I := 0 to E.Errors.Count - 1 do
          AStr := AStr + #13#10 + E.Errors[I].FullMessage;
        raise EcxMaskEditError.Create(AStr);
      end;
    end;
  finally
    AStream.Free;
  end;

  FNeedUpdateEditValue := not HasEdit;
end;

function TcxMaskEditRegExprExMode.GetEmptyString: string;
var
  ARegExpr: TcxRegExpr;
begin
  ARegExpr := TcxRegExpr.Create;
  ARegExpr.CaseInsensitive := Properties.CaseInsensitive;
  ARegExpr.UpdateOn := False;

  if CompileRegExpr(ARegExpr) then
  begin
    ARegExpr.OnSymbolUpdate := InternalSymbolUpdate;
    FInternalUpdate := '';
    ARegExpr.UpdateOn := True;
    Result := FInternalUpdate;
  end
  else
    Result := '';

  ARegExpr.Free;
end;

function TcxMaskEditRegExprExMode.GetFormattedText(AText: string): string;
begin
  if not FRegExpr.IsCompiled then
  begin
    Result := '';
    Exit;
  end;

  FRegExpr.UpdateOn := False;
  Clear;

  Result := inherited GetFormattedText(AText);

  FRegExpr.UpdateOn := True;
  Result := Result + FUpdate;
end;

procedure TcxMaskEditRegExprExMode.GotoEnd;
begin
  FRegExpr.UpdateOn := False;

  inherited GotoEnd;

  FRegExpr.UpdateOn := True;
end;

function TcxMaskEditRegExprExMode.IsFullValidText(AText: string): Boolean;
var
  ARegExpr: TcxRegExpr;

  function IsStart: Boolean;
  begin
    ARegExpr.UpdateOn := True;
    Result := AText = FInternalUpdate; 
  end;

var
  I: Integer;
begin
  ARegExpr := TcxRegExpr.Create;
  ARegExpr.CaseInsensitive := Properties.CaseInsensitive;
  ARegExpr.UpdateOn := False;
  Result := CompileRegExpr(ARegExpr);

  if Result then
  begin
    ARegExpr.OnSymbolUpdate := InternalSymbolUpdate;
    FInternalUpdate := '';
    if not IsStart then
    begin
      ARegExpr.UpdateOn := False;
      ARegExpr.Reset;
      for I := 1 to Length(AText) do
        if not ARegExpr.Next(AText[I]) then
        begin
          Result := False;
          Break;
        end;

      if Result then
        if not Properties.IgnoreMaskBlank then
          Result := ARegExpr.IsFinal;
    end;
  end;

  ARegExpr.Free;
end;

procedure TcxMaskEditRegExprExMode.PrePasteFromClipboard;
begin
  CursorCorrection;
end;

function TcxMaskEditRegExprExMode.PressBackSpace: Boolean;
var
  I: Integer;
  ASelLength: Integer;
begin
  CursorCorrection;
  Clear;

  if FEdit.SelLength <= 0 then
  begin
    if FHead = '' then
    begin
      Result := False;
      Exit;
    end;

    FRegExpr.Prev;

    if FRegExpr.IsStart then
      if FEdit.SelStart = FDeleteNumber then
      begin
        FRegExpr.Next(FHead[1]);
        Result := False;
        BeepOnError;
        Exit;
      end;

    Delete(FHead, Length(FHead) - FDeleteNumber, FDeleteNumber + 1);

    for I := 0 to FDeleteNumber do
    {$IFDEF VCL}
      FEdit.SendMyKeyPress(#8);
    {$ELSE}
      FEdit.SendMyKeyDown(Key_Backspace, []);
    {$ENDIF}

    FRegExpr.UpdateOn := False;

    if NextTail then
      UpdateTail
    else
      ClearTail;

    FRegExpr.UpdateOn := True;
  end
  else
  begin
    DeleteSelection;

    if FEdit.SelStart = 0 then
    begin
      FRegExpr.UpdateOn := False;
      FRegExpr.UpdateOn := True;
      if FUpdate <> '' then
      begin
        FHead := FUpdate;
        Clear;
        ASelLength := FEdit.SelLength;
        FEdit.SelStart := Length(FHead);
        FEdit.SelLength := ASelLength - FEdit.SelStart;
        FTail := Copy(FEdit.Text, FEdit.SelStart + 1, FEdit.SelLength) + FTail;
        Result := PressBackSpace;
        Exit;
      end
    end;

    {$IFDEF VCL}
     FEdit.SendMyKeyPress(#8);
    {$ELSE}
     FEdit.SendMyKeyDown(Key_Backspace, []);
    {$ENDIF}


    FRegExpr.UpdateOn := False;

    if NextTail then
      UpdateTail
    else
      ClearTail;

    FRegExpr.UpdateOn := True;
  end;

  Result := False;
end;

function TcxMaskEditRegExprExMode.PressDelete: Boolean;
var
  I: Integer;
begin
  CursorCorrection;
  Clear;

  if FEdit.SelLength <= 0 then
  begin
    if FTail = '' then
    begin
      Result := False;
      Exit;
    end;

    if FEdit.SelStart = 0 then
    begin
      FRegExpr.UpdateOn := False;
      FRegExpr.UpdateOn := True;
      if FUpdate <> '' then
      begin
        FRegExpr.Prev;
        Clear;
        Result := False;
        BeepOnError;
        Exit;
      end;
    end;

    FRegExpr.Next(FTail[1]);
    for I := 0 to Length(FUpdate) do
      FEdit.SendMyKeyDown(VK_DELETE, []);
    Delete(FTail, 1, Length(FUpdate) + 1);
    FRegExpr.Prev;

    FRegExpr.UpdateOn := False;

    if NextTail then
      UpdateTail
    else
      ClearTail;

    FRegExpr.UpdateOn := True;
  end
  else
    PressBackSpace;

  Result := False;
end;

function TcxMaskEditRegExprExMode.PressEnd: Boolean;
begin
  Result := True;

  CursorCorrection;
  Clear;

  FRegExpr.UpdateOn := False;

  inherited PressEnd;

  FRegExpr.UpdateOn := True;
end;

function TcxMaskEditRegExprExMode.PressHome: Boolean;
begin
  Result := True;

  CursorCorrection;
  Clear;

  inherited PressHome;
end;

function TcxMaskEditRegExprExMode.PressLeft: Boolean;
var
  I: Integer;
begin
  Result := True;

  CursorCorrection;
  Clear;

  if FEdit.SelLength > 0 then
  begin
    if (FEdit.CursorPos = FEdit.SelStart + FEdit.SelLength) and
        not FEdit.FShiftOn then
    begin
      FRegExpr.UpdateOn := False;
      inherited PressLeft;
      Clear;
      FRegExpr.UpdateOn := True;
      if FUpdate <> '' then
        FRegexpr.Prev;

      Exit;
    end
    else if (FEdit.CursorPos = FEdit.SelStart) and not FEdit.FShiftOn then
      Exit;
  end;

  inherited PressLeft;

  if FRegExpr.IsStart then
    if FEdit.SelStart = 0 then
    begin
      if FEdit.SelLength = FDeleteNumber then
        Dec(FDeleteNumber);
    end
    else
      if FEdit.SelStart = FDeleteNumber then
        Dec(FDeleteNumber);

  if FDeleteNumber > 0 then
  begin
    for I := 0 to FDeleteNumber - 1 do
    begin
      FTail := FHead[Length(FHead) - I] + FTail;
      {$IFDEF VCL}
      FEdit.SendMyKeyDown(VK_LEFT, []);
      {$ELSE}
      if FEdit.FShiftOn then
        FEdit.SendMyKeyDown(VK_LEFT, [ssShift])
      else
        FEdit.SendMyKeyDown(VK_LEFT, []);
      {$ENDIF}
    end;
    Delete(FHead, Length(FHead) - FDeleteNumber + 1, FDeleteNumber);
  end;
end;

function TcxMaskEditRegExprExMode.PressRight: Boolean;
var
  I: Integer;
begin
  Result := True;

  CursorCorrection;
  Clear;

  if FEdit.SelLength > 0 then
  begin
    if (FEdit.CursorPos = FEdit.SelStart) and
        not FEdit.FShiftOn then
    begin
      FRegExpr.UpdateOn := False;
      inherited PressRight;
      Clear;
      FRegExpr.UpdateOn := True;

      Exit;
    end
    else if (FEdit.CursorPos = FEdit.SelStart + Fedit.SelLength) and
        not FEdit.FShiftOn then
      Exit;
  end;

  inherited PressRight;

  if FUpdate <> '' then
  begin
    for I := 1 to Length(FUpdate) do
    begin
      FHead := FHead + FTail[I];
      {$IFDEF VCL}
      FEdit.SendMyKeyDown(VK_RIGHT, []);
      {$ELSE}
      if FEdit.FShiftOn then
        FEdit.SendMyKeyDown(VK_RIGHT, [ssShift])
      else
        FEdit.SendMyKeyDown(VK_RIGHT, []);
      {$ENDIF}
    end;
    Delete(FTail, 1, Length(FUpdate));
  end;
end;

function TcxMaskEditRegExprExMode.PressSymbol(var ASymbol: Char): Boolean;
var
  I: Integer;
  ASelLength: Integer;
begin
  CursorCorrection;
  Clear;

  if FEdit.SelLength > 0 then
  begin
    DeleteSelection;
    if FEdit.SelStart = 0 then
    begin
      FRegExpr.UpdateOn := False;
      FRegExpr.UpdateOn := True;
      if FUpdate <> '' then
      begin
        FHead := FUpdate;
        Clear;
        ASelLength := FEdit.SelLength;
        FEdit.SelStart := Length(FHead);
        FEdit.SelLength := ASelLength - FEdit.SelStart;
        FTail := Copy(FEdit.Text, FEdit.SelStart + 1, FEdit.SelLength) + FTail;
        Result := PressSymbol(ASymbol);
        Exit;
      end
    end;
  end;

  if FRegExpr.Next(ASymbol) then
  begin
    FHead := FHead + ASymbol + FUpdate;

    FEdit.SendMyKeyPress(ASymbol);
    for I := 1 to Length(FUpdate) do
      FEdit.SendMyKeyPress(FUpdate[I]);

    FRegExpr.UpdateOn := False;

    if NextTail then
      UpdateTail
    else
      ClearTail;

    FRegExpr.UpdateOn := True;
  end
  else
  begin
    if FEdit.SelLength > 0 then
      RestoreSelection;

    BeepOnError;
  end;

  FSelect := '';
  Result := False;
end;

procedure TcxMaskEditRegExprExMode.SetText(AText: string);
var
  I: Integer;
begin
  FRegExpr.UpdateOn := False;
  FRegExpr.Reset;

  for I := 1 to Length(AText) do
    FRegExpr.Next(AText[I]);
  Clear;
  FRegExpr.UpdateOn := True;
  FHead := AText + FUpdate;
  FTail := '';

  if HasEdit then
  begin
    FMouseAction := True;
    CursorCorrection;
  end;

  ClipboardTextLength := 0;
end;

procedure TcxMaskEditRegExprExMode.UpdateEditValue;
begin
  if FNeedUpdateEditValue then
  begin
    FEdit.EditValue := FUpdate;
    FNeedUpdateEditValue := False;
  end;
end;

procedure TcxMaskEditRegExprExMode.CursorCorrection;

  procedure Next;
  begin
    if FTail <> '' then
    begin
      Clear;
      FRegExpr.Next(FTail[1]);
      FHead := FHead + Copy(FTail, 1, Length(FUpdate) + 1);
      Delete(FTail, 1, Length(FUpdate) + 1);
    end;
  end;

  procedure Prev;
  begin
    if FHead <> '' then
    begin
      Clear;
      FRegExpr.Prev;

      FTail := Copy(FHead, Length(FHead) - FDeleteNumber, FDeleteNumber + 1) + FTail;

      if FRegExpr.IsStart then
        FHead := ''
      else
        Delete(FHead, Length(FHead) - FDeleteNumber, FDeleteNumber + 1);
    end;
  end;

var
  SelStart: Integer;
  SelEnd: Integer;

  procedure CorrectSelLength;
  begin
    while True do
    begin
      Next;
      if SelEnd <= Length(FHead) then
      begin
        DirectSetSelLength(Length(FHead) - FEdit.SelStart);
        {$IFNDEF VCL}
         QLineEdit_setCursorPosition(QLineEditH(FEdit.InnerTextEdit.Control.Handle),
             FEdit.SelStart + FEdit.SelLength);
        {$ENDIF}
        Break;
      end;
    end;
  end;

begin
  if not HasEdit then
    Exit;
  if not FEdit.HandleAllocated then
    Exit;

  if (FHead = '') and (FTail = '') and (FEdit.Text <> '') then
  begin
    FTail := FEdit.Text;
    FRegExpr.Reset;
    FMouseAction := True;
  end;

  if not FMouseAction then
    Exit
  else
    FMouseAction := False;

  SelStart := FEdit.SelStart;
  SelEnd := FEdit.SelStart + FEdit.SelLength;

  // Correct FEdit.SelStart
  if SelStart > Length(FHead) then
  begin
    while True do
    begin
      Next;
      if SelStart < Length(FHead) then
      begin
        Prev;
        DirectSetSelStart(Length(FHead));
        Break;
      end
      else if SelStart = Length(FHead) then
        Break;
    end;
  end
  else if SelStart < Length(FHead) then
  begin
    while True do
    begin
      Prev;
      if SelStart > Length(FHead) then
      begin
        DirectSetSelStart(Length(FHead));
        Break;
      end
      else if SelStart = Length(FHead) then
        Break;
    end;
  end;

  // Correct FEdit.SelLength
  if SelEnd > SelStart then
    CorrectSelLength;
end;

procedure TcxMaskEditRegExprExMode.DeleteSelection;
begin
  FRegExpr.UpdateOn := False;

  inherited DeleteSelection;

  FRegExpr.UpdateOn := True;

  if FUpdate <> '' then
  begin
    FRegExpr.Prev;
    Clear;
  end;
end;

function TcxMaskEditRegExprExMode.GetMaskKind: TcxEditMaskKind;
begin
  Result := emkRegExprEx;
end;

procedure TcxMaskEditRegExprExMode.UpdateTail;
var
  I: Integer;
begin
  Clear;

  if FTail = '' then
    Exit;

  for I := 1 to Length(FTail) do
  begin
    FRegExpr.Next(FTail[I]);
    DirectSetSelStart(FEdit.SelStart + 1);
  end;

  FRegExpr.UpdateOn := True;

  if FUpdate <> '' then
    for I := 1 to Length(FUpdate) do
    begin
      FTail := FTail + FUpdate[I];
      FEdit.SendMyKeyPress(FUpdate[I]);
    end;

  FRegExpr.UpdateOn := False;

  for I := 1 to Length(FTail) do
  begin
    FRegExpr.Prev;
    DirectSetSelStart(FEdit.SelStart - 1);
  end;
end;

procedure TcxMaskEditRegExprExMode.InternalSymbolUpdate(ASymbol: Char);
begin
  FInternalUpdate := FInternalUpdate + ASymbol;
end;

{ TcxCustomMaskEditProperties }

constructor TcxCustomMaskEditProperties.Create(AOwner: TPersistent);
begin
  inherited Create(AOwner);

  MaskKind := emkStandard;
  FAlwaysShowBlanksAndLiterals := False;
  ValidateOnEnter := True;
  CaseInsensitive := True;
  FTempMode := nil;
end;

destructor TcxCustomMaskEditProperties.Destroy;
begin
  FTempMode.Free;

  inherited Destroy;
end;

procedure TcxCustomMaskEditProperties.Assign(Source: TPersistent);
begin
  if Source is TcxCustomMaskEditProperties then
  begin
    BeginUpdate;
    try
      inherited Assign(Source);
      with Source as TcxCustomMaskEditProperties do
      begin
        Self.MaskKind := MaskKind;
        Self.EditMask := EditMask;
        Self.CaseInsensitive := CaseInsensitive;
        Self.IgnoreMaskBlank := IgnoreMaskBlank;
        Self.AlwaysShowBlanksAndLiterals := AlwaysShowBlanksAndLiterals;
      end
    finally
      EndUpdate;
    end
  end
  else
    inherited Assign(Source);
end;

class function TcxCustomMaskEditProperties.GetContainerClass: TcxContainerClass;
begin
  Result := TcxMaskEdit;
end;

function TcxCustomMaskEditProperties.UseLookupData: Boolean;
begin
  Result := not IsMasked and inherited UseLookupData;
end;

{function TcxCustomMaskEditProperties.GetEditValueSource(AEditFocused: Boolean): TcxDataEditValueSource;
begin
  if IsMasked then
    Result := evsValue
  else
    Result := inherited GetEditValueSource(AEditFocused);
end;}

function TcxCustomMaskEditProperties.IsEditValueValid(var EditValue: TcxEditValue;
  AEditFocused: Boolean): Boolean;
begin
  Result := IsMasked or inherited IsEditValueValid(EditValue, AEditFocused);
end;

procedure TcxCustomMaskEditProperties.PrepareDisplayValue(
  const AEditValue: TcxEditValue; var DisplayValue: TcxEditValue; AEditFocused: Boolean);
var
  AText: string;
begin
  if IsMasked then
  begin
    AText := VarToStr(AEditValue);
    if (FTempMode = nil) or not TestTempMaskKind or not TestTempEditMask then
    begin
      FreeAndNil(FTempMode);
      FTempMode := CreateMode;
    end;
    if FTempMode <> nil then
    begin
      if not AEditFocused and (FTempMode is TcxMaskEditStandardMode) then
      begin
        if not FAlwaysShowBlanksAndLiterals then
          DisplayValue := FTempMode.GetUpdatedText(AText)
        else
          DisplayValue := FTempMode.GetFormattedText(AText);
      end
      else
        DisplayValue := FTempMode.GetFormattedText(AText);
    end;
  end
  else
    inherited PrepareDisplayValue(AEditValue, DisplayValue, AEditFocused);
end;

procedure TcxCustomMaskEditProperties.ValidateDisplayValue(var ADisplayValue: TcxEditValue;
    var AErrorText: TCaption; var Error: Boolean; AEdit: TcxCustomEdit);
var
  AText: string;
begin
  if not Error then
  begin
    if not IsMasked{ or IgnoreMaskBlank }then
      Error := False
    else
    begin
      AText := VarToStr(ADisplayValue);

      Error := not TcxCustomMaskEdit(AEdit).Mode.IsFullValidText(AText);

      if Error then
        AErrorText := cxGetResourceString(@scxMaskEditInvalidEditValue);
    end;
  end;

  inherited ValidateDisplayValue(ADisplayValue, AErrorText, Error, AEdit);
end;

function TcxCustomMaskEditProperties.CreateMode: TcxMaskEditCustomMode;
begin
  Result := nil;
  if not EmptyMask(EditMask) then
  begin
    case FMaskKind of
      emkStandard:
        Result := TcxMaskEditStandardMode.Create(nil, Self);
      emkRegExpr:
        Result := TcxMaskEditRegExprMode.Create(nil, Self);
      emkRegExprEx:
        Result := TcxMaskEditRegExprExMode.Create(nil, Self);
    end;
    Result.Compile(EditMask);
  end;
end;

function TcxCustomMaskEditProperties.CreateMode1: TcxMaskEditCustomMode;
begin
  Result := nil;
  case MaskKind of
    emkStandard:
      Result := TcxMaskEditStandardMode.Create(nil, Self);
    emkRegExpr:
      Result := TcxMaskEditRegExprMode.Create(nil, Self);
    emkRegExprEx:
      Result := TcxMaskEditRegExprExMode.Create(nil, Self);
  end;
end;

function TcxCustomMaskEditProperties.EmptyMask(AMask: string): Boolean;
var
  I: Integer;
begin
  Result := AMask = '';

  if not Result then
  begin
    for I := 1 to Length(AMask) do
      if not SpaceToken(AMask[I]) then
      begin
        Result := False;
        Exit;
      end;

    Result := True;
  end;
end;

function TcxCustomMaskEditProperties.GetEditMask: TcxEditMask;
begin
  if FMaskKind <> emkStandard then
    Result := FEditMask
  else
  begin
    if EmptyMask(FEditMask) then
    begin
      if IDefaultValuesProvider <> nil then
        Result := IDefaultValuesProvider.DefaultEditMask
      else
        Result := '';
    end
    else
      Result := FEditMask
  end;
end;

function TcxCustomMaskEditProperties.GetIsMasked: Boolean;
begin
  Result := not EmptyMask(EditMask);
end;

procedure TcxCustomMaskEditProperties.SetAlwaysShowBlanksAndLiterals(AValue: Boolean);
begin
  if AValue <> FAlwaysShowBlanksAndLiterals then
  begin
    FAlwaysShowBlanksAndLiterals := AValue;
    Changed;
  end;
end;

procedure TcxCustomMaskEditProperties.SetCaseInsensitive(AValue: Boolean);
begin
  if CharCase = ecNormal then
    FCaseInsensitive := AValue
  else
    FCaseInsensitive := True;
  Changed;
end;

procedure TcxCustomMaskEditProperties.SetEditMask(Value: TcxEditMask);
var
  AMode: TcxMaskEditCustomMode;
begin
  if EditMask = Value then
    FEditMask := Value
  else
  begin
    AMode := CreateMode1;
    try
      AMode.Compile(Value);
      FEditMask := Value;
      Changed;
    finally
      AMode.Free;
    end;
  end;
end;

procedure TcxCustomMaskEditProperties.SetMaskKind(Value: TcxEditMaskKind);
begin
  if Value <> FMaskKind then
  begin
    FMaskKind := Value;
    Changed;
  end;
end;

procedure TcxCustomMaskEditProperties.SetMaxLength(Value: Integer);
begin
  if IsMasked then
    Value := 0;

  inherited SetMaxLength(Value);
end;

function TcxCustomMaskEditProperties.GetDisplayFormatOptions: TcxEditDisplayFormatOptions;
begin
 if not IsMasked then
    Result := [dfoSupports]
  else
    Result := [];
end;

function TcxCustomMaskEditProperties.SpaceToken(AToken: Char): Boolean;
begin
  Result :=  AToken in [' ', #0, #9, #10, #12, #13];
end;

function TcxCustomMaskEditProperties.GetEmptyString: string;
begin
  Result := FEmptyString;
end;

procedure TcxCustomMaskEditProperties.SetCharCase(Value: TEditCharCase);
begin
  if Value in [ecLowerCase, ecUpperCase] then
    FCaseInsensitive := True;

  inherited SetCharCase(Value);
end;

function TcxCustomMaskEditProperties.TestTempEditMask: Boolean;
begin
  Result := FTempMode.EditMask = EditMask;
end;

function TcxCustomMaskEditProperties.TestTempMaskKind: Boolean;
begin
  Result := False;
  case FMaskKind of
    emkStandard:
      Result := FTempMode is TcxMaskEditStandardMode;
    emkRegExpr:
      Result := FTempMode is TcxMaskEditRegExprMode;
    emkRegExprEx:
      Result := FTempMode is TcxMaskEditRegExprExMode;
  end;
end;

{ TcxCustomMaskEdit }

constructor TcxCustomMaskEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FMode := TcxMaskEditStandardMode.Create(Self, Properties);
  FMyMessage := False;
  FShiftOn := False;
  Properties.FEmptyString := InternalGetEmptyString;
end;

destructor TcxCustomMaskEdit.Destroy;
begin
  FreeAndNil(FMode);
  inherited Destroy;
end;

procedure TcxCustomMaskEdit.CutToClipboard;
begin
  if Properties.IsMasked then
  begin
    CopyToClipboard;
    Mode.PressDelete;
  end
  else
    inherited CutToClipBoard;
end;

class function TcxCustomMaskEdit.GetPropertiesClass: TcxCustomEditPropertiesClass;
begin
  Result := TcxMaskEditProperties;
end;

procedure TcxCustomMaskEdit.SendMyKeyDown(Key: Word; Shift: TShiftState);
begin
  FMyMessage := True;
  SendKeyDown(Self, Key, Shift);
  FMyMessage := False;
end;

procedure TcxCustomMaskEdit.SendMyKeyPress(AKey: Char);
begin
  FMyMessage := True;
  SendKeyPress(Self, AKey);
  FMyMessage := False;
end;

procedure TcxCustomMaskEdit.ChangeHandler(Sender: TObject);
begin
  FText := FMode.GetUpdatedText(InnerEdit.EditValue);
  
  inherited ChangeHandler(Sender);
end;

procedure TcxCustomMaskEdit.DblClick;
begin
  if Properties.IsMasked then
    Mode.GotoEnd;

  inherited DblClick;
end;

procedure TcxCustomMaskEdit.DoEnter;
begin
  if Properties.IsMasked then
    if Properties.AutoSelect then
      Mode.GotoEnd;

  inherited DoEnter;
end;

procedure TcxCustomMaskEdit.DoEditKeyDown(var Key: Word; Shift: TShiftState);
var
  AAfterKeyDownNeed: Boolean;
begin
  if not Properties.IsMasked then
  begin
    inherited DoEditKeyDown(Key, Shift);
    Exit;
  end;

  if not ValidateKeyDown(Key, Shift) then
  begin
    DoAfterKeyDown(Key, Shift);
    Key := 0;
    Exit;
  end;

  if FMyMessage then
    Exit;

  if Key = VK_TAB then
  begin
    inherited DoEditKeyDown(Key, Shift);
    Exit;
  end;

  FShiftOn := ssShift in Shift;

  if ((Key = VK_UP) or (Key = VK_DOWN)) and not HasPopupWindow then
  begin
    DoAfterKeyDown(Key, Shift);
    Key := 0;
  end
  else if Key = VK_LEFT then
  begin
    if ssCtrl in Shift then
    begin
      SendMyKeyDown(VK_HOME, Shift);
      if not Mode.PressHome then
        Key := 0;
    end
    else
    begin
      AAfterKeyDownNeed := IsCursorBegin;
      if not Mode.PressLeft then
      begin
        if AAfterKeyDownNeed then
          DoAfterKeyDown(Key, Shift);
        Key := 0;
      end;
    end;
  end
  else if Key = VK_RIGHT then
  begin
    if ssCtrl in Shift then
    begin
      SendMyKeyDown(VK_END, Shift);
      if not Mode.PressEnd then
        Key := 0;
    end
    else
    begin
      AAfterKeyDownNeed := IsCursorEnd;
      if not Mode.PressRight then
      begin
        if AAfterKeyDownNeed then
          DoAfterKeyDown(Key, Shift);
        Key := 0;
      end;
    end;
  end
  else if Key = VK_DELETE then
  begin
    if ssShift in Shift then
    begin
      if SelLength = 0 then
        if not Mode.PressBackSpace then
          Key := 0;
    end
    else
      if not Mode.PressDelete then
        Key := 0;
  end
  else if Key = VK_HOME then
  begin
    if not Mode.PressHome then
      Key := 0;
  end
  else if Key = VK_END then
  begin
    if not Mode.PressEnd then
      Key := 0;
  end;

  if Key <> 0 then
    inherited  DoEditKeyDown(Key, Shift);
end;

procedure TcxCustomMaskEdit.DoEditKeyPress(var Key: Char);
begin
  if not Properties.IsMasked then
  begin
    inherited DoEditKeyPress(Key);
    Exit;
  end;

  if (Key = #9) or (Key = #27) then
    Key := #0
  else if not ValidateKeyPress(Key) then
    Key := #0
  else
  begin
    if Key <> #13 then
    begin
      if not Properties.IsMasked then
        inherited DoEditKeyPress(Key)
      else
      begin
        if not FMyMessage then
        begin
          if (Key = #3) or (Key = #22) or (Key = #24) then // ^c ^v ^x
          begin
            inherited DoEditKeyPress(Key);
          end
          else
          begin
            if Key = #8 then  // Backspace
            begin
              if not Mode.PressBackSpace then
                Key := #0;
            end
            else
              if not Mode.PressSymbol(Key) then
                Key := #0;
          end;
        end;
      end;
    end;
  end;
end;

function TcxCustomMaskEdit.GetEditText: TCaption;
begin
  Result := InnerEdit.EditValue;
end;

function TcxCustomMaskEdit.GetProperties: TcxMaskEditProperties;
begin
  Result := TcxMaskEditProperties(InternalGetProperties);
end;

function TcxCustomMaskEdit.InternalGetEmptyString: string;
begin
  if Properties.IsMasked then
  begin
    if Mode <> nil then
      Result := Mode.GetEmptyString
    else
      Result := '';
  end
  else
    Result := '';
end;

procedure TcxCustomMaskEdit.InternalSetValue(AValue: string);
begin
  if Properties.IsMasked then
    Mode.SetText(AValue);
end;

function TcxCustomMaskEdit.IsCursorBegin: Boolean;
begin
  Result := FMode.IsCursorBegin;
end;

function TcxCustomMaskEdit.IsCursorEnd: Boolean;
begin
  Result := FMode.IsCursorEnd;
end;

procedure TcxCustomMaskEdit.SetEditText(AValue: TCaption);
var
  AEditText: string;
begin
  if not Focused and (Mode is TcxMaskEditStandardMode) then
  begin
    if not Properties.AlwaysShowBlanksAndLiterals then
      AEditText := Mode.GetUpdatedText(AValue)
    else
      AEditText := FMode.GetFormattedText(AValue);
  end
  else
    AEditText := FMode.GetFormattedText(AValue);
  InnerEdit.EditValue := AEditText;
  FEditValue := FText;
end;

procedure TcxCustomMaskEdit.SetProperties(const Value: TcxMaskEditProperties);
begin
  FProperties.Assign(Value);
end;

procedure TcxCustomMaskEdit.DoEditKeyUp(var Key: Word; Shift: TShiftState);
begin
  if not Properties.IsMasked then
  begin
    inherited DoEditKeyUp(Key, Shift);
    Exit;
  end;

  if FMyMessage then
    Exit;

  inherited DoEditKeyUp(Key, Shift);
end;

function TcxCustomMaskEdit.InternalGetText: TCaption; 
begin
  if Properties.IsMasked then
    Result := FText
  else
    Result := inherited InternalGetText;
end;

procedure TcxCustomMaskEdit.InternalSetDisplayValue(const Value: TcxEditValue);
var
  AText: string;
begin
  if Properties.IsMasked and not IsLoading then
  begin
    AText := VarToStr(Value);

    if not Focused and (Mode is TcxMaskEditStandardMode) then
    begin
      if not Properties.AlwaysShowBlanksAndLiterals then
        inherited InternalSetDisplayValue(Mode.GetUpdatedText(AText))
      else
        inherited InternalSetDisplayValue(Mode.GetFormattedText(AText));
    end
    else
      inherited InternalSetDisplayValue(Mode.GetFormattedText(AText));

    InternalSetValue(Text);
  end
  else
    inherited InternalSetDisplayValue(Value);
end;

function TcxCustomMaskEdit.InternalSetText(const Value: TCaption): Boolean;
begin
  if Properties.IsMasked then
  begin
    Result := True;
    EditValue := Value;
    FEditValue := FText;
  end
  else
    Result := inherited InternalSetText(Value);
end;

procedure TcxCustomMaskEdit.Loaded;
begin
  inherited Loaded;
  if Properties.IsMasked then
  begin
    LockChangeEvents(True, False);
    try
      InternalSetDisplayValue(Text);
    finally
      LockChangeEvents(False, False);
    end;
  end;
end;

procedure TcxCustomMaskEdit.MouseDown(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Properties.IsMasked then
    if Button = mbLeft then
      Mode.LMouseDown;

  inherited MouseDown(Button, Shift, X, Y);
end;

procedure TcxCustomMaskEdit.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  AShiftOn: Boolean;
begin
  if Properties.IsMasked then
    if ssLeft in Shift then
    begin
      AShiftOn := FShiftOn;
      FShiftOn := True;
      Mode.LMouseDown;
      FShiftOn := AShiftOn;
    end;

  inherited MouseMove(Shift, X, Y);
end;

procedure TcxCustomMaskEdit.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseUp(Button, Shift, X, Y);
end;

procedure TcxCustomMaskEdit.PropertiesChanged(Sender: TObject);
var
  AEditMask: string;
  ASelStart: Integer;
  ASelLength: Integer;
  AEditMaskCleared: Boolean;

  procedure DoMaskChanged;
  begin
    Properties.MaxLength := 0;

    FMode.Compile(AEditMask);
    if AEditMaskCleared then
      Properties.FEditMask := AEditMask;
    if not Properties.EmptyMask(AEditMask) then
      FMode.SynchronizeEditValue
    else
    begin
      if FMode is TcxMaskEditStandardMode then
      begin
        if SelLength = 1 then
        begin
          ASelStart := SelStart;
          SelLength := 0;
          SelStart := ASelStart;
        end;
      end;
    end;
    Properties.FEmptyString := InternalGetEmptyString;
  end;

  procedure DoMaskKindChanged;
  var
    APrevMaskKind: TcxEditMaskKind;
    APrevEditMask: string;
  begin
    APrevMaskKind := FMode.GetMaskKind;
    APrevEditMask := FMode.EditMask;
    FreeAndNil(FMode);

    if Properties.MaskKind = emkRegExpr then
    begin
      if APrevMaskKind = emkStandard then
      begin
        Properties.FEditMask := '';
        AEditMaskCleared := True;
      end;
      FMode := TcxMaskEditRegExprMode.Create(Self, Properties)
    end
    else if Properties.MaskKind = emkRegExprEx then
    begin
      if APrevMaskKind = emkStandard then
      begin
        Properties.FEditMask := '';
        AEditMaskCleared := True;
      end;
      FMode := TcxMaskEditRegExprExMode.Create(Self, Properties)
    end
    else if Properties.MaskKind = emkStandard then
    begin
      if (APrevMaskKind = emkRegExpr) or (APrevMaskKind = emkRegExprEx) then
      begin
        Properties.FEditMask := '';
        AEditMaskCleared := True;
      end;
      FMode := TcxMaskEditStandardMode.Create(Self, Properties);
    end;

    FMode.Compile(Properties.EditMask);
    if not Properties.EmptyMask(Properties.EditMask) then
      FMode.SynchronizeEditValue;

    Properties.FEmptyString := InternalGetEmptyString;
  end;

  procedure DoCharCaseChanged;
  begin
    if Properties.CharCase = ecNormal then
    begin
      if HasInnerEdit then
        InnerTextEdit.CharCase := ecNormal;
      FMode.SynchronizeEditValue;
    end;
    FMode.CharCase := Properties.CharCase;
  end;

  procedure SaveSels;
  begin
    ASelStart := SelStart;
    ASelLength := SelLength;
  end;

  procedure LoadSels;
  begin
    SelStart := ASelStart;
    SelLength := ASelLength;
  end;

var
  AEditMaskChanged: Boolean;
  AEditMaskKindChanged: Boolean;
  ACharCaseChanged: Boolean;
begin
  AEditMaskCleared := False;
  Properties.LockUpdate(True);

  AEditMask := Properties.EditMask;
  AEditMaskChanged := FMode.EditMask <> Properties.EditMask;
  AEditMaskKindChanged := FMode.GetMaskKind <> Properties.MaskKind;
  ACharCaseChanged := Properties.CharCase <> FMode.CharCase;
  if AEditMaskKindChanged then
    DoMaskKindChanged;
  if AEditMaskChanged then
    DoMaskChanged;
  if ACharCaseChanged then
    DoCharCaseChanged;
  if Properties.EchoMode <> FMode.EchoMode then
    SaveSels;

  if not(not PropertiesChangeLocked and VarIsNull(EditValue)) and Properties.IsMasked then
    FMode.UpdateEditValue;

  Properties.LockUpdate(False);

  if FMode is TcxMaskEditRegExprMode then
    TcxMaskEditRegExprMode(FMode).SetRegExprCaseInsensitive;

  inherited PropertiesChanged(Sender);

  if Properties.EchoMode <> FMode.EchoMode then
  begin
    LoadSels;
    FMode.EchoMode := Properties.EchoMode;
  end;

  if ACharCaseChanged or AEditMaskKindChanged or AEditMaskChanged then
    FText := FMode.GetUpdatedText(InnerEdit.EditValue);
end;

procedure TcxCustomMaskEdit.PrepareEditValue(const ADisplayValue: TcxEditValue;
  out EditValue: TcxEditValue; AEditFocused: Boolean);
begin
  if Properties.IsMasked then
    EditValue := Mode.GetUpdatedText(ADisplayValue)
  else
    inherited PrepareEditValue(ADisplayValue, EditValue, AEditFocused);
end;

procedure TcxCustomMaskEdit.RepositoryItemAssigned;
begin
  FMode.Properties := Properties;
end;

procedure TcxCustomMaskEdit.PasteFromClipboard;
begin
  {$IFDEF VCL}
  if not Clipboard.HasFormat(CF_TEXT) then
  {$ELSE}
  if not Clipboard.Provides('text/plain') then
  {$ENDIF}
    Exit;

  if not Properties.IsMasked then
  begin
    inherited PasteFromClipboard;
    Exit;
  end;

    Mode.ClipboardTextLength := Length(Clipboard.AsText);
    Mode.PrePasteFromClipboard;

    inherited PasteFromClipboard;

    Mode.AfterPasteFromClipboard;
end;

procedure TcxCustomMaskEdit.SetSelLength(Value: Integer);
begin
  inherited SetSelLength(Value);

  Mode.LMouseDown;
end;

procedure TcxCustomMaskEdit.SetSelStart(Value: Integer);
begin
  inherited SetSelStart(Value);

  Mode.LMouseDown;
end;

procedure TcxCustomMaskEdit.SetSelText(const Value: TCaption);
begin
  if not Properties.IsMasked then
    inherited SetSelText(Value)
  else
  begin
    Mode.ClipboardTextLength := Length(Value);
    Mode.PrePasteFromClipboard;

    inherited SetSelText(Value);

    Mode.AfterPasteFromClipboard;
  end;
end;

procedure TcxCustomMaskEdit.SynchronizeDisplayValue;
begin
  inherited SynchronizeDisplayValue;

  if Properties.IsMasked then
    InternalSetValue(Text);
end;

initialization
  GetRegisteredEditProperties.Register(TcxMaskEditProperties, scxSEditRepositoryMaskItem);

end.
