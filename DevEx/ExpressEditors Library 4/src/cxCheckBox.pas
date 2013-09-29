
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

unit cxCheckBox;

{$I cxEdVer.inc}

interface

uses
{$IFDEF VCL}
  Messages, Windows,
{$ELSE}
  Qt, QTypes,
{$ENDIF}
{$IFDEF DELPHI6}
  Types, Variants,
{$ENDIF}
  Classes, Controls, Forms, Graphics, SysUtils, cxClasses, cxContainer, cxControls,
  cxCustomData, cxEdit, cxGraphics, cxTextEdit, cxVariants;

const
  cxEditCheckBoxSingleBorderDefaultColor = clBtnShadow;

type
  TcxCheckBoxNullValueShowingStyle = (nssUnchecked, nssInactive, nssGrayedChecked);
  TcxCheckBoxState = (cbsUnchecked, cbsChecked, cbsGrayed);
  TcxEditCheckBoxBorderStyle = TcxEditBorderStyle;
  TcxEditCheckState = (ecsNormal, ecsHot, ecsPressed, ecsDisabled);

  { TcxCustomCheckBoxViewInfo }

  TcxCustomCheckBoxViewInfo = class(TcxCustomTextEditViewInfo)
  protected
    procedure InternalPaint(ACanvas: TcxCanvas); override;
  public
    Alignment: TAlignment;
    CheckBoxBorderStyle: TcxEditCheckBoxBorderStyle;
    CheckBoxGlyph: TBitmap;
    CheckBoxGlyphCount: Integer;
    CheckBoxRect: TRect;
    CheckBoxState: TcxEditCheckState;
    DrawCaptionFlags: Integer;
    FocusRect: TRect;
    FullFocusRect: Boolean;
    HasGlyph: Boolean;
    NullValueShowingStyle: TcxCheckBoxNullValueShowingStyle;
    State: TcxCheckBoxState;
{$IFDEF VCL}
    NativeCheckBoxState: Integer;
    ParentBackground: Boolean;
{$ENDIF}
    procedure Assign(Source: TObject); override;
    procedure DrawText(ACanvas: TcxCanvas); override;
    function GetUpdateRegion(AViewInfo: TcxContainerViewInfo): TcxRegion; override;
    function IsHotTrack: Boolean; override;
    function NeedShowHint(ACanvas: TcxCanvas; const P: TPoint; out AText: TCaption;
      out AIsMultiLine: Boolean; out ATextRect: TRect): Boolean; override;
    procedure Offset(DX, DY: Integer); override;
    function Repaint(AControl: TWinControl; AViewInfo: TcxContainerViewInfo;
      APInnerEditRect: PRect = nil): Boolean; override;
  end;

  { TcxCustomCheckBoxViewData }

  TcxCustomCheckBoxProperties = class;

  TcxCustomCheckBoxViewData = class(TcxCustomEditViewData)
  private
    function GetProperties: TcxCustomCheckBoxProperties;
    procedure SetProperties(Value: TcxCustomCheckBoxProperties);
  protected
    function GetBorderStyle(AEditHotStyle: TcxContainerHotState): TcxEditBorderStyle; override;
    function InternalGetEditConstantPartSize(ACanvas: TcxCanvas; AIsInplace: Boolean;
      const AEditSizeProperties: TcxEditSizeProperties;
      var MinContentSize: TSize; AViewInfo: TcxCustomEditViewInfo): TSize; override;
    function GetDrawTextFlags: Integer; virtual;
    function GetIsEditClass: Boolean;
    function IsCheckPressed: Boolean;
  public
    procedure Calculate(ACanvas: TcxCanvas; const ABounds: TRect; const P: TPoint;
      Button: TcxMouseButton; Shift: TShiftState; AViewInfo: TcxCustomEditViewInfo;
      AIsMouseEvent: Boolean); override;
    procedure EditValueToDrawValue(ACanvas: TcxCanvas; const AEditValue: TcxEditValue;
      AViewInfo: TcxCustomEditViewInfo); override;
    property Properties: TcxCustomCheckBoxProperties read GetProperties write SetProperties;
  end;

  { TcxCheckBoxStyle }

  TcxCheckBoxStyle = class(TcxCustomEditStyle)
  protected
    function DefaultColor: TColor; override;
//    function GetColor: TColor; override;
//    function GetInternalColor: TColor; override;
  public
    procedure RestoreDefaults; override;
  end;

  { TcxCustomCheckBoxProperties }

  TcxCustomCheckBox = class;

  TcxCustomCheckBoxProperties = class(TcxCustomEditProperties)
  private
    FAllowGrayed: Boolean;
    FCaption: TCaption;
    FDisplayChecked: WideString;
    FDisplayGrayed: WideString;
    FDisplayUnchecked: WideString;
    FFullFocusRect: Boolean;
    FGlyph: TBitmap;
    FGlyphCount: Integer;
    FIsCaptionAssigned: Boolean;
    FMultiLine: Boolean;
    FNullStyle: TcxCheckBoxNullValueShowingStyle;
    FValueChecked: TcxEditValue;
    FValueGrayed: TcxEditValue;
    FValueUnchecked: TcxEditValue;
    function GetAlignment: TAlignment;
    function GetGlyph: TBitmap;
    function GetInternalAlignment: TcxEditAlignment;
    procedure GlyphChanged(Sender: TObject);
    function IsAlignmentStored: Boolean;
    function IsDisplayCheckedStored: Boolean;
    function IsDisplayGrayedStored: Boolean;
    function IsDisplayUncheckedStored: Boolean;
    function IsValueCheckedStored: Boolean;
    function IsValueGrayedStored: Boolean;
    function IsValueUncheckedStored: Boolean;
    procedure ReadCaption(Reader: TReader);
    procedure SetAlignment(Value: TAlignment);
    procedure SetCaption(Value: TCaption);
    procedure SetFullFocusRect(Value: Boolean);
    procedure SetGlyph(Value: TBitmap);
    procedure SetGlyphCount(Value: Integer);
    procedure SetMultiLine(Value: Boolean);
    procedure SetNullStyle(Value: TcxCheckBoxNullValueShowingStyle);
    procedure SetValueChecked(const Value: TcxEditValue);
    procedure SetValueGrayed(const Value: TcxEditValue);
    procedure SetValueUnchecked(const Value: TcxEditValue);
    procedure WriteCaption(Writer: TWriter);
  protected
    function CheckValue(const AValue: TcxEditValue): Boolean;
    function CompareEditValue: Boolean; override;
    procedure DefineProperties(Filer: TFiler); override;
    class function GetViewDataClass: TcxCustomEditViewDataClass; override;
    function HasDisplayValue: Boolean; override;
    property Alignment: TAlignment read GetAlignment write SetAlignment stored IsAlignmentStored;
    property AllowGrayed: Boolean read FAllowGrayed write FAllowGrayed default False;
    property Caption: TCaption read FCaption write SetCaption stored False;
    property DisplayChecked: WideString read FDisplayChecked write FDisplayChecked
      stored IsDisplayCheckedStored;
    property DisplayGrayed: WideString read FDisplayGrayed write FDisplayGrayed
      stored IsDisplayGrayedStored;
    property DisplayUnchecked: WideString read FDisplayUnchecked write FDisplayUnchecked
      stored IsDisplayUncheckedStored;
    property FullFocusRect: Boolean read FFullFocusRect write SetFullFocusRect default False;
    property Glyph: TBitmap read GetGlyph write SetGlyph;
    property GlyphCount: Integer read FGlyphCount write SetGlyphCount default 6;
    property InternalAlignment: TcxEditAlignment read GetInternalAlignment;
    property MultiLine: Boolean read FMultiLine write SetMultiLine default False;
    property NullStyle: TcxCheckBoxNullValueShowingStyle read FNullStyle write
      SetNullStyle default nssGrayedChecked;
    property ValueChecked: TcxEditValue read FValueChecked write SetValueChecked
      stored IsValueCheckedStored;
    property ValueGrayed: TcxEditValue read FValueGrayed write SetValueGrayed
      stored IsValueGrayedStored;
    property ValueUnchecked: TcxEditValue read FValueUnchecked write SetValueUnchecked
      stored IsValueUncheckedStored;
  public
    constructor Create(AOwner: TPersistent); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    class function GetContainerClass: TcxContainerClass; override;
    function GetDisplayText(const AEditValue: TcxEditValue;
      AFullText: Boolean = False): WideString; override;
    class function GetStyleClass: TcxContainerStyleClass; override;
    function GetSupportedOperations: TcxEditSupportedOperations; override;
    class function GetViewInfoClass: TcxContainerViewInfoClass; override;
    function IsEditValueValid(var EditValue: TcxEditValue; AEditFocused: Boolean): Boolean; override;
    procedure PrepareDisplayValue(const AEditValue: TcxEditValue;
      var DisplayValue: TcxEditValue; AEditFocused: Boolean); override;
  end;

  { TcxCheckBoxProperties }

  TcxCheckBoxProperties = class(TcxCustomCheckBoxProperties)
  published
    property Alignment;
    property AllowGrayed;
    property Caption;
    property DisplayChecked;
    property DisplayUnchecked;
    property DisplayGrayed;
    property FullFocusRect;
    property Glyph;
    property GlyphCount;
    property ImmediatePost;
    property MultiLine;
    property NullStyle;
    property ReadOnly;
    property ValueChecked;
    property ValueGrayed;
    property ValueUnchecked;
    property OnChange;
    property OnEditValueChanged;
  end;

  { TcxCustomCheckBox }

  TcxCustomCheckBox = class(TcxCustomEdit)
  private
    FIsCheckPressed: Boolean;
{$IFDEF VCL}
  {$IFNDEF DELPHI7}
    FParentBackground: Boolean;        
  {$ENDIF}
{$ELSE}
    FSpaceBarAutoRepeat: Boolean;
{$ENDIF}
    function GetChecked: Boolean;
    function GetProperties: TcxCheckBoxProperties;
    function GetState: TcxCheckBoxState;
    function GetViewInfo: TcxCustomCheckBoxViewInfo;
    procedure SetChecked(Value: Boolean);
    procedure SetProperties(Value: TcxCheckBoxProperties);
    procedure SetState(Value: TcxCheckBoxState);
{$IFDEF VCL}
  {$IFNDEF DELPHI7}
    procedure SetParentBackground(Value: Boolean);        
  {$ENDIF}
    procedure WMLButtonUp(var Message: TWMLButtonUp); message WM_LBUTTONUP;
    procedure CMDialogChar(var Message: TCMDialogChar); message CM_DIALOGCHAR;
{$ENDIF}
  protected
    function CanResize(var NewWidth, NewHeight: Integer): Boolean; override;
    procedure DoEditKeyDown(var Key: Word; Shift: TShiftState); override;
    procedure DoEditKeyPress(var Key: Char); override;
    procedure DoEditKeyUp(var Key: Word; Shift: TShiftState); override;
    procedure FillSizeProperties(var AEditSizeProperties: TcxEditSizeProperties); override;
    procedure InternalSetEditValue(const Value: TcxEditValue;
      AValidateEditValue: Boolean); override;
    function IsClickEnabledDuringLoading: Boolean; override;
    procedure Paint; override;
    procedure ProcessViewInfoChanges(APrevViewInfo: TcxCustomEditViewInfo;
      AIsMouseDownUpEvent: Boolean); override;
    procedure PropertiesChanged(Sender: TObject); override;
    procedure SetName(const Value: TComponentName); override;
{$IFNDEF VCL}
    function EventFilter(Sender: QObjectH; Event: QEventH): Boolean; override;
    function WantKey(Key: Integer; Shift: TShiftState; const KeyText: WideString): Boolean; override;
{$ENDIF}
    procedure InvalidateCheckRect;
    procedure Toggle; virtual;
    property Checked: Boolean read GetChecked write SetChecked stored False;
    property Properties: TcxCheckBoxProperties read GetProperties write SetProperties;
    property State: TcxCheckBoxState read GetState write SetState default cbsUnchecked;
    property ViewInfo: TcxCustomCheckBoxViewInfo read GetViewInfo;
{$IFDEF VCL}
    property ParentBackground{$IFNDEF DELPHI7}: Boolean read FParentBackground write SetParentBackground{$ENDIF} default True;
{$ENDIF}
  public
    constructor Create(AOwner: TComponent); override;
    procedure Clear; override;
    class function GetPropertiesClass: TcxCustomEditPropertiesClass; override;
    class function GetNotPublishedStyleValues: TcxEditStyleValues; override;
    procedure PrepareEditValue(const ADisplayValue: TcxEditValue;
      out EditValue: TcxEditValue; AEditFocused: Boolean); override;
  end;

  { TcxCustomCheckBox }

  TcxCheckBox = class(TcxCustomCheckBox)
  published
    property Anchors;
    property AutoSize;
    property Checked;
    property Constraints;
    property DragMode;
    property Enabled;
{$IFDEF VCL}
    property ParentBackground;
{$ENDIF}
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property Properties;
    property ShowHint;
    property State;
    property Style;
    property TabOrder;
    property TabStop;
    property Visible;
{$IFDEF VCL}
    property DragCursor;
    property DragKind;
    property ImeMode;
    property ImeName;
{$ENDIF}
    property OnClick;
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
  dxThemeManager,
{$ENDIF}
  cxEditTextUtils, cxEditUtils, cxEditConsts;

type
  TcxCustomEditAccess = class(TcxCustomEdit);
  TcxCustomEditStyleAccess = class(TcxCustomEditStyle);
  TcxEditDataBindingAccess = class(TcxEditDataBinding);

{ TcxCustomCheckBoxViewInfo }

procedure TcxCustomCheckBoxViewInfo.Assign(Source: TObject);
begin
  if Source is TcxCustomCheckBoxViewInfo then
    with Source as TcxCustomCheckBoxViewInfo do
    begin
      Self.CheckBoxState := CheckBoxState;
{$IFDEF VCL}
      Self.NativeCheckBoxState := NativeCheckBoxState;
{$ENDIF}
    end;
  inherited Assign(Source);
end;

procedure TcxCustomCheckBoxViewInfo.DrawText(ACanvas: TcxCanvas);
begin
  DrawCheckBoxText(ACanvas, Self);
end;

function TcxCustomCheckBoxViewInfo.GetUpdateRegion(AViewInfo: TcxContainerViewInfo): TcxRegion;
var
  AEquals: Boolean;
  ATempRgn: TcxRegion;
begin
  Result := inherited GetUpdateRegion(AViewInfo);
  if not(AViewInfo is TcxCustomCheckBoxViewInfo) then
    Exit;
  with TcxCustomCheckBoxViewInfo(AViewInfo) do
  begin
    AEquals := Self.CheckBoxState = CheckBoxState;
{$IFDEF VCL}
    AEquals := AEquals and (Self.NativeCheckBoxState = NativeCheckBoxState);
{$ENDIF}
  end;
  if not AEquals then
  begin
    ATempRgn := TcxRegion.Create(CheckBoxRect);
    UniteRegions(Result, ATempRgn);
    ATempRgn.Free;
  end;
end;

function TcxCustomCheckBoxViewInfo.IsHotTrack: Boolean;
begin
  Result := True;
end;

function TcxCustomCheckBoxViewInfo.NeedShowHint(ACanvas: TcxCanvas;
  const P: TPoint; out AText: TCaption; out AIsMultiLine: Boolean;
  out ATextRect: TRect): Boolean;
begin
  Result := False;
end;

procedure TcxCustomCheckBoxViewInfo.Offset(DX, DY: Integer);
begin
  inherited Offset(DX, DY);
  OffsetRect(CheckBoxRect, DX, DY);
  OffsetRect(FocusRect, DX, DY);
end;

function TcxCustomCheckBoxViewInfo.Repaint(AControl: TWinControl; AViewInfo:
  TcxContainerViewInfo; APInnerEditRect: PRect = nil): Boolean;
var
  R: TRect;
begin
  Result := inherited Repaint(AControl, AViewInfo, APInnerEditRect);
  with TcxCustomCheckBoxViewInfo(AViewInfo) do
  begin
    Result := Result or (AViewInfo <> nil) and ((Self.CheckBoxState <> CheckBoxState)
      {$IFDEF VCL}or (Self.NativeCheckBoxState <> NativeCheckBoxState){$ENDIF});
    if (AViewInfo = nil) or (Self.CheckBoxState <> CheckBoxState)
      {$IFDEF VCL}or (Self.NativeCheckBoxState <> NativeCheckBoxState){$ENDIF} then
    begin
      R := Self.CheckBoxRect;
      OffsetRect(R, Self.Left, Self.Top);
      InternalInvalidate(AControl.Handle, R, cxEmptyRect, False);
    end;
  end;
end;

procedure TcxCustomCheckBoxViewInfo.InternalPaint(ACanvas: TcxCanvas);
begin
  DrawCustomCheckBox(ACanvas, Self);
end;

{ TcxCustomCheckBoxViewData }

procedure TcxCustomCheckBoxViewData.Calculate(ACanvas: TcxCanvas; const ABounds: TRect;
  const P: TPoint; Button: TcxMouseButton; Shift: TShiftState; AViewInfo: TcxCustomEditViewInfo;
  AIsMouseEvent: Boolean);

var
  AAlignment: TAlignment;

  procedure CalcCheckRect(const ACheckSize: TSize);
  var
    ACaptionRect, ACheckBoxRect: TRect;
  begin
    ACheckBoxRect := AViewInfo.ClientRect;
    ACaptionRect := ACheckBoxRect;
    if not IsInplace then
      InflateRect(ACaptionRect, -2, -2);
    if not(IsInplace{$IFDEF VCL} or AreVisualStylesMustBeUsed(AViewInfo.NativeStyle,
        totButton){$ENDIF}) then
      InflateRect(ACheckBoxRect, -2, -2);
    with ACheckBoxRect do
    begin
      if Bottom - Top > ACheckSize.cy then
      begin
        Top := Top + (Bottom - Top - ACheckSize.cy) div 2;
        Bottom := Top + ACheckSize.cy;
      end;
      if Right - Left > ACheckSize.cx then
        if AAlignment = taCenter then
        begin
          Left := Left + (Right - Left - ACheckSize.cx) div 2;
          Right := Left + ACheckSize.cx;
        end else
          if AAlignment = taLeftJustify then
          begin
            Right := Left + ACheckSize.cx;
{$IFDEF WIN32}
            ACaptionRect.Left := Right + 3;
{$ELSE}
            ACaptionRect.Left := Right + 2;
            if Properties.MultiLine then
              Inc(ACaptionRect.Right);
{$ENDIF}
          end else
          begin
            Left := Right - ACheckSize.cx;
{$IFDEF WIN32}
            ACaptionRect.Right := Left - 3;
{$ELSE}
            ACaptionRect.Right := Left - 3 + Integer(Properties.MultiLine);
            Dec(ACaptionRect.Left);
{$ENDIF}
          end
      else
        ACaptionRect.Right := ACaptionRect.Left;
    end;
    with TcxCustomCheckBoxViewInfo(AViewInfo) do
    begin
      TextRect := ACaptionRect;
{$IFNDEF VCL}
  {$IFDEF WIN32}
      if TextRect.Bottom < TextRect.Top then
        TextRect.Bottom := TextRect.Top;
  {$ENDIF}
{$ENDIF}
      CheckBoxRect := ACheckBoxRect;
    end;
  end;

begin
  if IsInplace then
    AAlignment := taCenter
  else
    AAlignment := Properties.Alignment;

  inherited Calculate(ACanvas, ABounds, P, Button, Shift, AViewInfo, AIsMouseEvent);

  with AViewInfo as TcxCustomTextEditViewInfo do
  begin
    Font := Style.Font;
    IsEditClass := GetIsEditClass;
    DrawSelectionBar := False;
    HasPopupWindow := False;
    DrawTextFlags := GetDrawTextFlags;
    CalculateCheckBoxViewInfo(Self, TcxCustomCheckBoxViewInfo(AViewInfo), AIsMouseEvent);
  end;

  with TcxCustomCheckBoxViewInfo(AViewInfo) do
  begin
    Alignment := AAlignment;
    CheckBoxBorderStyle := GetDefaultBorderStyle(AViewInfo.HotState);
    CheckBoxGlyph := Properties.Glyph;
    CheckBoxGlyphCount := Properties.GlyphCount;
    FullFocusRect := Properties.FullFocusRect;
    NullValueShowingStyle := Properties.NullStyle;

    CalcCheckRect(GetEditCheckSize(ACanvas, Self, TcxCustomCheckBoxViewInfo(AViewInfo)));
    if not Enabled then
      CheckBoxState := ecsDisabled
    else
      if IsCheckPressed then
        CheckBoxState := ecsPressed
      else
        if not IsDesigning and PtInRect(BorderRect, P) then
          if Shift = [] then
            CheckBoxState := ecsHot
          else if (Shift = [ssLeft]) and ((Button = cxmbLeft) or (CheckBoxState = ecsPressed)) then
            CheckBoxState := ecsPressed
          else
            CheckBoxState := ecsNormal
        else
          CheckBoxState := ecsNormal;

    if (Style.BorderStyle = ebsSingle) and
        not TcxCustomEditStyleAccess(Style).IsValueDefined(svBorderColor) then
      AViewInfo.BorderColor := cxEditCheckBoxSingleBorderDefaultColor;

    CalculateCustomCheckBoxViewInfo(ACanvas, Self, TcxCustomCheckBoxViewInfo(AViewInfo));
  end;
end;

procedure TcxCustomCheckBoxViewData.EditValueToDrawValue(ACanvas: TcxCanvas;
  const AEditValue: TcxEditValue; AViewInfo: TcxCustomEditViewInfo);
var
  ADisplayValue: TcxEditValue;
begin
  Properties.PrepareDisplayValue(AEditValue, ADisplayValue, (Edit <> nil) and Edit.InternalFocused);
  TcxCustomCheckBoxViewInfo(AViewInfo).State := ADisplayValue;
  CalculateCustomCheckBoxViewInfo(ACanvas, Self, TcxCustomCheckBoxViewInfo(AViewInfo));
end;

function TcxCustomCheckBoxViewData.GetBorderStyle(AEditHotStyle: TcxContainerHotState):
  TcxEditBorderStyle;
begin
  Result := ebsNone;
end;

function TcxCustomCheckBoxViewData.InternalGetEditConstantPartSize(ACanvas: TcxCanvas;
  AIsInplace: Boolean; const AEditSizeProperties: TcxEditSizeProperties;
  var MinContentSize: TSize; AViewInfo: TcxCustomEditViewInfo): TSize;
var
  ASize1, ASize2: TSize;
  AText: TCaption;
begin
  Result := inherited InternalGetEditConstantPartSize(ACanvas, AIsInplace,
    AEditSizeProperties, MinContentSize, AViewInfo);

  with TcxCustomCheckBoxViewInfo(AViewInfo) do
  begin
    ASize1.cx := CheckBoxRect.Right - CheckBoxRect.Left;
    ASize1.cy := CheckBoxRect.Bottom - CheckBoxRect.Top;

    if not(IsInplace{$IFDEF VCL} or AreVisualStylesMustBeUsed(AViewInfo.NativeStyle,
      totButton){$ENDIF}) then
    begin
      Inc(ASize1.cx, 4);
      Inc(ASize1.cy, 4);
    end;

    if (Properties.Alignment = taCenter) or IsInplace then
      AText := 'Gg'
    else
      AText := RemoveAccelChars(Properties.Caption);
    ASize2 := GetTextEditContentSize(ACanvas, Self, AText,
      DrawTextFlagsTocxTextOutFlags(GetDrawTextFlags) or CXTO_SINGLELINE,
      @AEditSizeProperties, False);
    Inc(ASize2.cx, 3);
    Inc(ASize1.cx, ASize2.cx);
    if ASize1.cy < ASize2.cy then
      ASize1.cy := ASize2.cy;
  end;
  Inc(Result.cx, ASize1.cx);
  Inc(Result.cy, ASize1.cy);
end;

function TcxCustomCheckBoxViewData.GetDrawTextFlags: Integer;
const
  AHorzAlignmentFlags: array [TcxEditHorzAlignment] of Integer = (
    cxAlignLeft, cxAlignLeft, cxAlignHCenter
  );
begin
  with Properties.InternalAlignment do
  begin
    Result := AHorzAlignmentFlags[Horz];
    Result := Result or cxSingleLine;
  end;
  Result := Result or cxShowPrefix;
  if Properties.MultiLine then
  begin
    Result := Result and (not cxSingleLine);
    Result := Result or cxDontClip;
    Result := Result or cxWordBreak;
    Result := Result or cxAlignTop;
  end
  else
    Result := Result or cxAlignVCenter;
end;

function TcxCustomCheckBoxViewData.GetIsEditClass: Boolean;
begin
  Result := True;
end;

function TcxCustomCheckBoxViewData.IsCheckPressed: Boolean;
begin
  Result := (Edit <> nil) and TcxCustomCheckBox(Edit).FIsCheckPressed;
end;

function TcxCustomCheckBoxViewData.GetProperties: TcxCustomCheckBoxProperties;
begin
  Result := TcxCustomCheckBoxProperties(FProperties);
end;

procedure TcxCustomCheckBoxViewData.SetProperties(Value: TcxCustomCheckBoxProperties);
begin
  FProperties := Value;
end;

{ TcxCheckBoxStyle }

procedure TcxCheckBoxStyle.RestoreDefaults;
begin
  inherited RestoreDefaults;
  if (Edit <> nil) and ((StyleController = nil) or not TcxCustomEditStyleAccess(StyleController.Style).IsValueDefined(svColor)) then
    TcxCustomEditAccess(Edit).ParentColor := True;
end;

function TcxCheckBoxStyle.DefaultColor: TColor;
begin
  if (Edit <> nil) and (Edit.Parent <> nil) then
    Result := TcxCustomEditAccess(Edit.Parent).Color
  else
    Result := clWindow;
end;

{ TcxCustomCheckBoxProperties }

constructor TcxCustomCheckBoxProperties.Create(AOwner: TPersistent);
begin
  inherited Create(AOwner);
  FDisplayChecked := cxGetResourceString(@cxSEditCheckBoxChecked);
  FDisplayUnchecked := cxGetResourceString(@cxSEditCheckBoxUnchecked);
  FDisplayGrayed := cxGetResourceString(@cxSEditCheckBoxGrayed);

  FGlyphCount := 6;
  FNullStyle := nssGrayedChecked;
  FValueChecked := True;
  FValueGrayed := Null;
  FValueUnchecked := False;
end;

destructor TcxCustomCheckBoxProperties.Destroy;
begin
  if FGlyph <> nil then
    FreeAndNil(FGlyph);
  inherited Destroy;
end;

procedure TcxCustomCheckBoxProperties.Assign(Source: TPersistent);
begin
  if Source is TcxCustomCheckBoxProperties then
  begin
    BeginUpdate;
    try
      inherited Assign(Source);
      with Source as TcxCustomCheckBoxProperties do
      begin
        Self.AllowGrayed := AllowGrayed;
        Self.FullFocusRect := FullFocusRect;
        Self.Glyph := Glyph;
        Self.GlyphCount := GlyphCount;
        Self.MultiLine := MultiLine;
        Self.NullStyle := NullStyle;
        Self.ValueChecked := ValueChecked;
        Self.ValueGrayed := ValueGrayed;
        Self.ValueUnchecked := ValueUnchecked;
      end;
    finally
      EndUpdate;
    end
  end
  else
    inherited Assign(Source);
end;

class function TcxCustomCheckBoxProperties.GetContainerClass: TcxContainerClass;
begin
  Result := TcxCheckBox;
end;

function TcxCustomCheckBoxProperties.GetDisplayText(const AEditValue: TcxEditValue;
  AFullText: Boolean = False): WideString;
var
  ADisplayValue: TcxEditValue;
begin
  PrepareDisplayValue(AEditValue, ADisplayValue, False);
  case TcxCheckBoxState(ADisplayValue) of
    cbsChecked:
      Result := FDisplayChecked;
    cbsUnchecked:
      Result := FDisplayUnchecked;
    cbsGrayed:
      Result := FDisplayGrayed;
  end;
end;

class function TcxCustomCheckBoxProperties.GetStyleClass: TcxContainerStyleClass;
begin
  Result := TcxCheckBoxStyle;
end;

function TcxCustomCheckBoxProperties.GetSupportedOperations: TcxEditSupportedOperations;
begin
  Result := [esoAlwaysHotTrack, esoFiltering, esoHotTrack, esoSorting];
end;

class function TcxCustomCheckBoxProperties.GetViewInfoClass: TcxContainerViewInfoClass;
begin
  Result := TcxCustomCheckBoxViewInfo;
end;

function TcxCustomCheckBoxProperties.IsEditValueValid(var EditValue: TcxEditValue; AEditFocused: Boolean): Boolean;
begin
  Result := inherited IsEditValueValid(EditValue, AEditFocused);
  if Result then
    Result := not CheckValue(EditValue);
end;

procedure TcxCustomCheckBoxProperties.PrepareDisplayValue(const AEditValue:
  TcxEditValue; var DisplayValue: TcxEditValue; AEditFocused: Boolean);
begin
  if VarEqualsExact(AEditValue, FValueChecked) then
    DisplayValue := cbsChecked
  else
    if VarEqualsExact(AEditValue, FValueUnchecked) then
      DisplayValue := cbsUnchecked
    else
      DisplayValue := cbsGrayed;
end;

function TcxCustomCheckBoxProperties.CheckValue(const AValue: TcxEditValue): Boolean;
begin
  Result := not(InternalVarEqualsExact(AValue, FValueChecked) or InternalVarEqualsExact(AValue,
    FValueGrayed) or InternalVarEqualsExact(AValue, FValueUnchecked));
end;

function TcxCustomCheckBoxProperties.CompareEditValue: Boolean;
begin
  Result := True;
end;

procedure TcxCustomCheckBoxProperties.DefineProperties(Filer: TFiler);
begin
  inherited DefineProperties(Filer);
  Filer.DefineProperty('Caption', ReadCaption, WriteCaption, FIsCaptionAssigned);
end;

class function TcxCustomCheckBoxProperties.GetViewDataClass: TcxCustomEditViewDataClass;
begin
  Result := TcxCustomCheckBoxViewData;
end;

function TcxCustomCheckBoxProperties.HasDisplayValue: Boolean;
begin
  Result := True;
end;

function TcxCustomCheckBoxProperties.GetAlignment: TAlignment;
begin
  Result := inherited Alignment.Horz;
end;

function TcxCustomCheckBoxProperties.GetGlyph: TBitmap;
begin
  if FGlyph = nil then
  begin
    FGlyph := TBitmap.Create;
    FGlyph.OnChange := GlyphChanged;
  end;
  Result := FGlyph;
end;

function TcxCustomCheckBoxProperties.GetInternalAlignment: TcxEditAlignment;
begin
  Result := inherited Alignment;
end;

procedure TcxCustomCheckBoxProperties.GlyphChanged(Sender: TObject);
begin
  Changed;
end;

function TcxCustomCheckBoxProperties.IsAlignmentStored: Boolean;
begin
  Result := inherited Alignment.IsHorzStored;
end;

function TcxCustomCheckBoxProperties.IsDisplayCheckedStored: Boolean;
begin
  Result := not InternalCompareString(FDisplayChecked,
    cxGetResourceString(@cxSEditCheckBoxChecked), True);
end;

function TcxCustomCheckBoxProperties.IsDisplayGrayedStored: Boolean;
begin
  Result := not InternalCompareString(FDisplayChecked,
    cxGetResourceString(@cxSEditCheckBoxGrayed), True);
end;

function TcxCustomCheckBoxProperties.IsDisplayUncheckedStored: Boolean;
begin
  Result := not InternalCompareString(FDisplayChecked,
    cxGetResourceString(@cxSEditCheckBoxUnchecked), True);
end;

function TcxCustomCheckBoxProperties.IsValueCheckedStored: Boolean;
begin
  Result := not InternalVarEqualsExact(FValueChecked, True);
end;

function TcxCustomCheckBoxProperties.IsValueGrayedStored: Boolean;
begin
  Result := not VarIsNull(FValueGrayed);
end;

function TcxCustomCheckBoxProperties.IsValueUncheckedStored: Boolean;
begin
  Result := not InternalVarEqualsExact(FValueUnchecked, False);
end;

procedure TcxCustomCheckBoxProperties.ReadCaption(Reader: TReader);
begin
{$IFDEF VCL}
  Caption := Reader.ReadString;
{$ELSE}
  Caption := Reader.ReadWideString;
{$ENDIF}
end;

procedure TcxCustomCheckBoxProperties.SetAlignment(Value: TAlignment);
begin
  inherited Alignment.Horz := Value;
end;

procedure TcxCustomCheckBoxProperties.SetCaption(Value: TCaption);
begin
  FIsCaptionAssigned := True;
  if not InternalCompareString(Value, FCaption, True) then
  begin
    FCaption := Value;
    Changed;
  end;
end;

procedure TcxCustomCheckBoxProperties.SetFullFocusRect(Value: Boolean);
begin
  if Value <> FFullFocusRect then
  begin
    FFullFocusRect := Value;
    Changed;
  end;
end;

procedure TcxCustomCheckBoxProperties.SetGlyph(Value: TBitmap);
begin
  if Value = nil then
    FreeAndNil(FGlyph)
  else
    Glyph.Assign(Value);
  Changed;
end;

procedure TcxCustomCheckBoxProperties.SetGlyphCount(Value: Integer);
begin
  if FGlyphCount <> Value then
  begin
    FGlyphCount := Value;
    if FGlyph <> nil then
      Changed;
  end;
end;

procedure TcxCustomCheckBoxProperties.SetMultiLine(Value: Boolean);
begin
  if Value <> FMultiLine then
  begin
    FMultiLine := Value;
    Changed;
  end;
end;

procedure TcxCustomCheckBoxProperties.SetNullStyle(Value: TcxCheckBoxNullValueShowingStyle);
begin
  if Value <> FNullStyle then
  begin
    FNullStyle := Value;
    Changed;
  end;
end;

procedure TcxCustomCheckBoxProperties.SetValueChecked(const Value: TcxEditValue);
begin
  if CheckValue(Value) and not VarIsNull(Value) then
  begin
    FValueChecked := Value;
    Changed;
  end;
end;

procedure TcxCustomCheckBoxProperties.SetValueGrayed(const Value: TcxEditValue);
begin
  if CheckValue(Value) then
  begin
    FValueGrayed := Value;
    Changed;
  end;
end;

procedure TcxCustomCheckBoxProperties.SetValueUnchecked(const Value: TcxEditValue);
begin
  if CheckValue(Value) and not VarIsNull(Value) then
  begin
    FValueUnchecked := Value;
    Changed;
  end;
end;

procedure TcxCustomCheckBoxProperties.WriteCaption(Writer: TWriter);
begin
{$IFDEF VCL}
  Writer.WriteString(Caption);
{$ELSE}
  Writer.WriteWideString(Caption);
{$ENDIF}
end;

{ TcxCustomCheckBox }

constructor TcxCustomCheckBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FIsCreating := True;

  ControlStyle := ControlStyle - [csDoubleClicks];
  ParentColor := not IsInplace;
  Width := 121;
  PrepareEditValue(cbsUnchecked, FEditValue, False);

{$IFDEF VCL}
  ParentBackground := True;
{$ENDIF}

  FIsCreating := False;
end;

procedure TcxCustomCheckBox.Clear;
begin
  Checked := False;
end;

class function TcxCustomCheckBox.GetPropertiesClass: TcxCustomEditPropertiesClass; 
begin
  Result := TcxCheckBoxProperties;
end;

class function TcxCustomCheckBox.GetNotPublishedStyleValues: TcxEditStyleValues;
begin
  Result := [svButtonStyle, svButtonTransparency, svEdges, svPopupBorderStyle];
end;

procedure TcxCustomCheckBox.PrepareEditValue(const ADisplayValue: TcxEditValue;
  out EditValue: TcxEditValue; AEditFocused: Boolean);
begin
  case TcxCheckBoxState(ADisplayValue) of
    cbsUnchecked:
      EditValue := Properties.FValueUnchecked;
    cbsChecked:
      EditValue := Properties.FValueChecked;
    cbsGrayed:
      EditValue := Properties.FValueGrayed;
  end;
end;

function TcxCustomCheckBox.CanResize(var NewWidth, NewHeight: Integer): Boolean;
var
  AEditSizeProperties: TcxEditSizeProperties;
begin
  Result := inherited CanResize(NewWidth, NewHeight);
  if Result and AutoSize and not IsLoading then
  begin
    FillSizeProperties(AEditSizeProperties);
    NewHeight := Properties.GetEditSize(Canvas, Style, IsInplace, Null, AEditSizeProperties).cy;
  end;
end;

procedure TcxCustomCheckBox.DoEditKeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited DoEditKeyDown(Key, Shift);
  if Key = 0 then
    Exit;

  case Key of
    VK_SPACE:
      begin
{$IFNDEF VCL}
        if FSpaceBarAutoRepeat then
          Exit;
{$ENDIF}
        with ViewInfo do
          if CheckBoxState in [ecsNormal, ecsHot] then
          begin
            FIsCheckPressed := True;
            CheckBoxState := ecsPressed;
            ShortRefreshContainer(False);
            Key := 0;
          end;
      end;
  end;
end;

procedure TcxCustomCheckBox.DoEditKeyPress(var Key: Char);
begin
  inherited DoEditKeyPress(Key);
  if Key = #0 then
    Exit;

  if IsInplace and (Key = #32) and (ViewInfo.CheckBoxState = ecsNormal) then
  begin
    Toggle;
    Key := #0;
  end;
end;

procedure TcxCustomCheckBox.DoEditKeyUp(var Key: Word; Shift: TShiftState);
begin
  inherited DoEditKeyUp(Key, Shift);
  if Key = 0 then
    Exit;

  case Key of
    VK_SPACE:
      begin
{$IFNDEF VCL}
        if FSpaceBarAutoRepeat then
          Exit;
{$ENDIF}
        if ViewInfo.CheckBoxState = ecsPressed then
        begin
          FIsCheckPressed := False;
          ViewInfo.CheckBoxState := ecsNormal;
          InvalidateCheckRect;
          Toggle;
        end;
      end;
  end;
end;

procedure TcxCustomCheckBox.FillSizeProperties(var AEditSizeProperties: TcxEditSizeProperties);
begin
  with AEditSizeProperties do
  begin
    if Properties.MultiLine then
      MaxLineCount := 0
    else
      MaxLineCount := 1;
    Width := ViewInfo.TextRect.Right - ViewInfo.TextRect.Left;
  end;
end;

procedure TcxCustomCheckBox.InternalSetEditValue(const Value: TcxEditValue;
  AValidateEditValue: Boolean);
var
  APrevState: TcxCheckBoxState;
begin
  APrevState := State;
  inherited InternalSetEditValue(Value, AValidateEditValue);
  if APrevState <> State then
  begin
    ViewInfo.State := State;
    Click;
    DoChange;
  end;
  ShortRefreshContainer(False);
end;

function TcxCustomCheckBox.IsClickEnabledDuringLoading: Boolean;
begin
  Result := DataBinding <> nil;
  if Result then
    with TcxEditDataBindingAccess(DataBinding) do
      Result := (IDefaultValuesProvider <> nil) and IDefaultValuesProvider.HasDisplayValueFormatting;
end;

procedure TcxCustomCheckBox.Paint;
begin
{$IFDEF VCL}
  ViewInfo.ParentBackground := not IsInplace and ParentBackground;
{$ENDIF}
  inherited Paint;
end;

procedure TcxCustomCheckBox.ProcessViewInfoChanges(APrevViewInfo: TcxCustomEditViewInfo;
  AIsMouseDownUpEvent: Boolean);
begin
  if (TcxCustomCheckBoxViewInfo(APrevViewInfo).CheckBoxState = ecsPressed) and
      (ViewInfo.CheckBoxState = ecsHot) then
    Toggle;
end;

procedure TcxCustomCheckBox.PropertiesChanged(Sender: TObject);
begin
  ViewInfo.Text := Properties.Caption;
  State := ViewInfo.State;
  inherited PropertiesChanged(Sender);
end;

procedure TcxCustomCheckBox.SetName(const Value: TComponentName);
begin
  inherited SetName(Value);
  if not Properties.FIsCaptionAssigned then
  begin
    Properties.Caption := Value;
    Properties.FIsCaptionAssigned := False;
  end;
end;

{$IFNDEF VCL}
function TcxCustomCheckBox.EventFilter(Sender: QObjectH; Event: QEventH): Boolean;
var
  AKeyEvent: QKeyEventH;
begin
  case QEvent_type(Event) of
    QEventType_KeyPress, QEventType_KeyRelease:
      begin
        AKeyEvent := QKeyEventH(Event);
        FSpaceBarAutoRepeat := QKeyEvent_count(AKeyEvent) > 1;
        FSpaceBarAutoRepeat := FSpaceBarAutoRepeat or QKeyEvent_isAutoRepeat(AKeyEvent);
      end;
    QEventType_MouseButtonRelease:
      if ButtonStateToMouseButton(QMouseEvent_button(QMouseEventH(Event))) = mbLeft then
        ControlState := ControlState - [csClicked];
  end;
  Result := inherited EventFilter(Sender, Event);
end;

function TcxCustomCheckBox.WantKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  if IsAccel(Key, Properties.Caption) and (ssAlt in Shift) and CanFocus then
    begin
      SetFocus;
      if Focused then
        Toggle;
      Result := True;
    end
    else
      Result := inherited WantKey(Key, Shift, KeyText);
end;
{$ENDIF}

procedure TcxCustomCheckBox.InvalidateCheckRect;
begin
  InvalidateRect(ViewInfo.CheckBoxRect, False);
end;

procedure TcxCustomCheckBox.Toggle;
begin
  LockChangeEvents(True);
  try
    KeyboardAction := True;
    try
      begin
        case State of
          cbsUnchecked:
            if Properties.AllowGrayed then
              State := cbsGrayed
            else
              State := cbsChecked;
          cbsChecked:
            State := cbsUnchecked;
          cbsGrayed:
            State := cbsChecked;
        end;
      end;
    finally
      KeyboardAction := False;
    end;
    if Properties.ImmediatePost and AutoPostEditValue and ValidateEdit(True) then
      PostEditValue;
  finally
    LockChangeEvents(False);
  end;
end;

function TcxCustomCheckBox.GetChecked: Boolean;
begin
  Result := State = cbsChecked;
end;

function TcxCustomCheckBox.GetProperties: TcxCheckBoxProperties;
begin
  Result := TcxCheckBoxProperties(InternalGetProperties);
end;

function TcxCustomCheckBox.GetState: TcxCheckBoxState;
var
  ADisplayValue: TcxEditValue;
begin
  Properties.PrepareDisplayValue(EditValue, ADisplayValue, InternalFocused);
  Result := ADisplayValue;
end;

function TcxCustomCheckBox.GetViewInfo: TcxCustomCheckBoxViewInfo;
begin
  Result := TcxCustomCheckBoxViewInfo(FViewInfo);
end;

procedure TcxCustomCheckBox.SetChecked(Value: Boolean);
begin
  if Value then
    State := cbsChecked
  else
    State := cbsUnchecked;
end;

procedure TcxCustomCheckBox.SetProperties(Value: TcxCheckBoxProperties);
begin
  FProperties.Assign(Value);
end;

procedure TcxCustomCheckBox.SetState(Value: TcxCheckBoxState);
var
  AEditValue: TcxEditValue;
begin
  PrepareEditValue(Value, AEditValue, InternalFocused);
  EditValue := AEditValue;
end;

{$IFDEF VCL}
  {$IFNDEF DELPHI7}
procedure TcxCustomCheckBox.SetParentBackground(Value: Boolean);
begin
  if Value <> FParentBackground then
  begin
    FParentBackground := Value;
    Invalidate;
  end;
end;
  {$ENDIF}

procedure TcxCustomCheckBox.WMLButtonUp(var Message: TWMLButtonUp);
begin
  ControlState := ControlState - [csClicked];
  inherited;
end;

procedure TcxCustomCheckBox.CMDialogChar(var Message: TCMDialogChar);
begin
  with Message do
    if IsAccel(CharCode, Properties.Caption) {D3 - bug "&&"} and CanFocus then
    begin
      SetFocus;
      if Focused then
        Toggle;
      Result := 1;
    end
    else
      inherited;
end;
{$ENDIF}

initialization
  GetRegisteredEditProperties.Register(TcxCheckBoxProperties, scxSEditRepositoryCheckBoxItem);
  
end.

