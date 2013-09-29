
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

unit cxRadioGroup;

{$I cxEdVer.inc}

interface

uses
{$IFDEF WIN32}
   Windows,
{$ENDIF}
{$IFDEF VCL}
  Messages,
{$ELSE}
  Qt, Types, QTypes,
{$ENDIF}
{$IFDEF DELPHI6}
  Variants,
{$ENDIF}
  Classes, Controls, Forms, Graphics, ImgList, StdCtrls, SysUtils, cxClasses,
  cxContainer, cxControls, cxEdit, cxGraphics, cxLookAndFeels, Menus, cxTextEdit;

const
{$IFDEF VCL}
  CM_FOCUSRADIOBUTTON = WM_APP + 106;
{$ELSE}
  QEventType_CMFocusRadioButton = Integer(QEventType_ClxUser) + 6;
{$ENDIF}

type
  TcxRadioButtonState = (rbsDisabled, rbsHot, rbsNormal, rbsPressed);
  TcxRadioGroupState = (rgsActive, rgsDisabled, rgsHot, rgsNormal);

  TcxCustomRadioGroup = class;
  TcxCustomRadioGroupProperties = class;

  { TcxRadioButton }

  TcxRadioButton = class(TRadioButton, IcxMouseTrackingCaller)
  private
    FButtonRect: TRect;
    FCanvas: TcxCanvas;
    FColumn: Integer;
    FControlCanvas: TControlCanvas;
    FLookAndFeel: TcxLookAndFeel;
    FRow: Integer;
    FState: TcxRadioButtonState;
{$IFDEF VCL}
  {$IFNDEF DELPHI7}
    FParentBackground: Boolean;
    FWordWrap: Boolean;
  {$ENDIF}
{$ELSE}
    FWordWrap: Boolean;
{$ENDIF}
{$IFNDEF VCL}
    FAlignment: TLeftRight;
{$ENDIF}

    // IcxMouseTrackingCaller
    procedure IcxMouseTrackingCaller.MouseLeave = MouseTrackingCallerMouseLeave;
    procedure MouseTrackingCallerMouseLeave;

    procedure SetLookAndFeel(Value: TcxLookAndFeel);
    procedure SetState(Value: TcxRadioButtonState);
{$IFDEF VCL}
    procedure DrawItem(const DrawItemStruct: TDrawItemStruct);
  {$IFNDEF DELPHI7}
    procedure SetParentBackground(Value: Boolean);
    procedure SetWordWrap(Value: Boolean);
  {$ENDIF}
    procedure WMEraseBkgnd(var Message: TWMEraseBkgnd); message WM_ERASEBKGND;
    procedure BMSetCheck(var Message: TMessage); message BM_SETCHECK;
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure CMSysColorChange(var Message: TMessage); message CM_SYSCOLORCHANGE;
    procedure CNDrawItem(var Message: TWMDrawItem); message CN_DRAWITEM;
    procedure CNMeasureItem(var Message: TWMMeasureItem); message CN_MEASUREITEM;
{$ELSE}
    procedure SetAlignment(Value: TLeftRight);
    procedure SetWordWrap(Value: Boolean);
{$ENDIF}
  protected
    procedure DoEnter; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
{$IFDEF VCL}
    procedure CreateParams(var Params: TCreateParams); override;
{$ELSE}
    procedure InitWidget; override;
    procedure Painting(Sender: QObjectH; EventRegion: QRegionH); override;
{$ENDIF}
    procedure CorrectTextRect(var R: TRect; ANativeStyle: Boolean); virtual;
    procedure EnabledChanged; {$IFDEF VCL}dynamic;{$ELSE}override;{$ENDIF}
    procedure InternalPolyLine(const APoints: array of TPoint);
    function IsInplace: Boolean; virtual;
    procedure LookAndFeelChanged(Sender: TcxLookAndFeel;
      AChangedValues: TcxLookAndFeelValues); virtual;
    procedure MouseEnter(AControl: TControl); {$IFDEF VCL}dynamic{$ELSE}override{$ENDIF};
    procedure MouseLeave(AControl: TControl); {$IFDEF VCL}dynamic{$ELSE}override{$ENDIF};
    procedure Paint; virtual;
    procedure ShortUpdateState;
    procedure UpdateState(Button: TcxMouseButton; Shift: TShiftState;
      const P: TPoint); virtual;
{$IFNDEF VCL}
    function GetFocusRectCorrection: TRect; virtual;
{$ENDIF}
    property Canvas: TcxCanvas read FCanvas;
    property Column: Integer read FColumn;
    property Row: Integer read FRow;
    property State: TcxRadioButtonState read FState write SetState;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Focused: Boolean; override;
    procedure Invalidate; override;
  published
{$IFNDEF VCL}
    property Alignment: TLeftRight read FAlignment write SetAlignment default taRightJustify;
{$ENDIF}
    property LookAndFeel: TcxLookAndFeel read FLookAndFeel write SetLookAndFeel;
{$IFDEF VCL}
    property ParentBackground{$IFNDEF DELPHI7}: Boolean read FParentBackground write SetParentBackground{$ENDIF} default True;
  {$IFNDEF DELPHI7}
    property WordWrap: Boolean read FWordWrap write SetWordWrap default False;
  {$ENDIF}
{$ELSE}
    property WordWrap: Boolean read FWordWrap write SetWordWrap default False;
{$ENDIF}
  end;

  TcxRadioGroupButtonViewInfo = class(TcxEditButtonViewInfo)
  public
    Caption: TCaption;
    Column, Row: Integer;
  end;

  { TcxCustomRadioGroupViewInfo }

  TcxCustomRadioGroupViewInfo = class(TcxCustomTextEditViewInfo)
  protected
    function GetButtonViewInfoClass: TcxEditButtonViewInfoClass; override;
  public
    Alignment: TLeftRight;
    IsDesigning: Boolean;
    ItemIndex: Integer;
    procedure DrawButton(ACanvas: TcxCanvas; AButtonVisibleIndex: Integer); override;
  end;

  { TcxCustomRadioGroupViewData }

  TcxCustomRadioGroupViewData = class(TcxCustomEditViewData)
  private
    function GetProperties: TcxCustomRadioGroupProperties;
    procedure SetProperties(Value: TcxCustomRadioGroupProperties);
  protected
    function GetBorderStyle(AEditHotState: TcxContainerHotState): TcxEditBorderStyle; override;
    function GetDrawTextFlags: Integer; virtual;
  public
    procedure Calculate(ACanvas: TcxCanvas; const ABounds: TRect; const P: TPoint;
      Button: TcxMouseButton; Shift: TShiftState; AViewInfo: TcxCustomEditViewInfo;
      AIsMouseEvent: Boolean); override;
    procedure CalculateButtonsViewInfo(ACanvas: TcxCanvas; const ABounds: TRect;
      const P: TPoint; Button: TcxMouseButton; Shift: TShiftState;
      AViewInfo: TcxCustomEditViewInfo; AIsMouseEvent: Boolean); override;
    procedure EditValueToDrawValue(ACanvas: TcxCanvas; const AEditValue: TcxEditValue;
      AViewInfo: TcxCustomEditViewInfo); override;
    function GetBorderExtent: TRect; override;
    function GetClientExtent(AViewInfo: TcxCustomEditViewInfo): TRect; override;
    function GetEditConstantPartSize(ACanvas: TcxCanvas;
      const AEditSizeProperties: TcxEditSizeProperties;
      var MinContentSize: TSize; AViewInfo: TcxCustomEditViewInfo = nil): TSize; override;
    property Properties: TcxCustomRadioGroupProperties read GetProperties write SetProperties;
  end;

  { TcxRadioGroupItem }

  TcxRadioGroupItem = class(TCollectionItem)
  private
    FCaption: TCaption;
    FValue: TcxEditValue;
    function IsValueStored: Boolean;
    procedure SetCaption(const Value: TCaption);
    procedure SetValue(const Value: TcxEditValue);
  public
    constructor Create(Collection: TCollection); override;
    procedure Assign(Source: TPersistent); override;
  published
    property Caption: TCaption read FCaption write SetCaption;
    property Value: TcxEditValue read FValue write SetValue stored IsValueStored;
  end;

  { TcxRadioGroupItems }

  TcxRadioGroupItems = class(TOwnedCollection)
  private
    function GetItem(Index: Integer): TcxRadioGroupItem;
    procedure SetItem(Index: Integer; Value: TcxRadioGroupItem);
  protected
    procedure Update(Item: TCollectionItem); override;
  public
    property Items[Index: Integer]: TcxRadioGroupItem
      read GetItem write SetItem; default;
  end;

  { TcxRadioGroupStyle }

  TcxRadioGroupStyle = class(TcxCustomEditStyle)
  protected
    function DefaultColor: TColor; override;
  public
    procedure RestoreDefaults; override;
  end;

  { TcxCustomRadioGroupProperties }

  TcxCustomRadioGroupProperties = class(TcxCustomEditProperties)
  private
    FColumns: Integer;
    FDefaultCaption: WideString;
    FDefaultValue: TcxEditValue;
    FItems: TcxRadioGroupItems;
    FWordWrap: Boolean;
    function GetAlignment: TLeftRight;
    function IsDefaultCaptionStored: Boolean;
    function IsDefaultValueStored: Boolean;
    procedure SetAlignment(Value: TLeftRight);
    procedure SetColumns(Value: Integer);
    procedure SetDefaultValue(const Value: TcxEditValue);
    procedure SetItems(Value: TcxRadioGroupItems);
    procedure SetWordWrap(Value: Boolean);
  protected
    function CompareEditValue: Boolean; override;
    class function GetViewDataClass: TcxCustomEditViewDataClass; override;
    function HasDisplayValue: Boolean; override;
    property Alignment: TLeftRight read GetAlignment write SetAlignment default taRightJustify;
    property Columns: Integer read FColumns write SetColumns default 1;
    property DefaultCaption: WideString read FDefaultCaption
      write FDefaultCaption stored IsDefaultCaptionStored;
    property DefaultValue: TcxEditValue read FDefaultValue write SetDefaultValue
      stored IsDefaultValueStored;
    property Items: TcxRadioGroupItems read FItems write SetItems;
    property WordWrap: Boolean read FWordWrap write SetWordWrap default False;
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
    function IsResetEditClass: Boolean; override;
    procedure PrepareDisplayValue(const AEditValue: TcxEditValue;
      var DisplayValue: TcxEditValue; AEditFocused: Boolean); override;
  end;

  { TcxRadioGroupProperties }

  TcxRadioGroupProperties = class(TcxCustomRadioGroupProperties)
  published
    property Columns;
    property DefaultCaption;
    property DefaultValue;
    property ImmediatePost;
    property Items;
    property ReadOnly;
    property WordWrap;
    property OnChange;
    property OnEditValueChanged;
  end;

  { TcxCustomRadioGroupButton }

  TcxCustomRadioGroupButton = class(TcxRadioButton, IcxContainerInnerControl)
  private
{$IFDEF VCL}
    FIsClickLocked: Boolean;
{$ENDIF}
    function GetControlContainer: TcxContainer;
    function GetControl: TWinControl;
    function GetRadioGroup: TcxCustomRadioGroup;
{$IFDEF VCL}
    procedure WMGetDlgCode(var Message: TWMGetDlgCode); message WM_GETDLGCODE;
    procedure CNCommand(var Message: TWMCommand); message CN_COMMAND;
{$ENDIF}
  protected
    procedure CorrectTextRect(var R: TRect; ANativeStyle: Boolean); override;
    procedure DoEnter; override;
    procedure DoExit; override;
    function DoMouseWheel(Shift: TShiftState; WheelDelta: Integer;
      {$IFNDEF VCL}const{$ENDIF} MousePos: TPoint): Boolean; override;
    procedure DragOver(Source: TObject; X, Y: Integer; State: TDragState;
      var Accept: Boolean); override;
    function GetPopupMenu: TPopupMenu; override;
    function IsInplace: Boolean; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure KeyUp(var Key: Word; Shift: TShiftState); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
{$IFDEF VCL}
    procedure Click; override;
    procedure WndProc(var Message: TMessage); override;
{$ELSE}
    function EventFilter(Sender: QObjectH; Event: QEventH): Boolean; override;
    function GetFocusRectCorrection: TRect; override;
{$ENDIF}
    property RadioGroup: TcxCustomRadioGroup read GetRadioGroup;
  public
    constructor Create(ARadioGroup: TcxCustomRadioGroup); reintroduce; virtual;
    destructor Destroy; override;
    procedure DragDrop(Source: TObject; X, Y: Integer); override;
    function ExecuteAction(Action: TBasicAction): Boolean; override;
    function UpdateAction(Action: TBasicAction): Boolean; override;
{$IFDEF DELPHI5}
    function CanFocus: Boolean; override;
{$ENDIF}
{$IFNDEF VCL}
    procedure Click; override;
{$ENDIF}
  end;

  TcxCustomRadioGroupButtonClass = class of TcxCustomRadioGroupButton;

  { TcxCustomRadioGroup }

  TcxCustomRadioGroupData = class(TcxCustomEditData)
    FocusedButton: Integer;
  end;

  TcxCustomRadioGroup = class(TcxCustomEdit)
  private
    FButtons: TList;
    FCaption: TCaption;
    FInternalUpdating: Boolean;
    FIsCaptionAssigned: Boolean;
    FItemIndex: Integer;
{$IFDEF VCL}
    FDrawingParentBackground: Boolean;
  {$IFNDEF DELPHI7}
    FParentBackground: Boolean;
  {$ENDIF}
{$ENDIF}
    function GetButton(Index: Integer): TcxRadioButton;
    function GetProperties: TcxRadioGroupProperties;
    function GetViewInfo: TcxCustomRadioGroupViewInfo;
    procedure ReadCaption(Reader: TReader);
    procedure SetButtonCount(Value: Integer);
    procedure SetCaption(Value: TCaption);
    procedure SetItemIndex(Value: Integer);
    procedure SetProperties(Value: TcxRadioGroupProperties);
    procedure WriteCaption(Writer: TWriter);
{$IFDEF VCL}
  {$IFNDEF DELPHI7}
    procedure SetParentBackground(Value: Boolean);        
  {$ENDIF}
    procedure WMEraseBkgnd(var Message: TWMEraseBkgnd); message WM_ERASEBKGND;
    procedure CMDialogChar(var Message: TCMDialogChar); message CM_DIALOGCHAR;
    procedure CMCtl3DChanged(var Message: TMessage); message CM_CTL3DCHANGED;
    procedure CMFocusRadioButton(var Message: TMessage); message CM_FOCUSRADIOBUTTON;
{$ENDIF}
  protected
    procedure ContainerStyleChanged(Sender: TObject); override;
    procedure CursorChanged; override;
    procedure DefineProperties(Filer: TFiler); override;
    procedure DoEditKeyDown(var Key: Word; Shift: TShiftState); override;
    procedure EnabledChanged; override;
    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
    function GetEditDataClass: TcxCustomEditDataClass; override;
    procedure InitializeEditData; override;
    procedure InternalSetEditValue(const Value: TcxEditValue;
      AValidateEditValue: Boolean); override;
    function IsInternalControl(AControl: TControl): Boolean; override;
    procedure Loaded; override;
    procedure Paint; override;
    procedure PropertiesChanged(Sender: TObject); override;
    procedure ReadState(Reader: TReader); override;
    function RefreshContainer(const P: TPoint; Button: TcxMouseButton; Shift: TShiftState;
      AIsMouseEvent: Boolean): Boolean; override;
    procedure SetDragMode(Value: TDragMode); override;
    procedure SetName(const Value: TComponentName); override;
    procedure SetSize; override;
    function TabsNeeded: Boolean; override;
{$IFDEF VCL}
    procedure CreateHandle; override;
    procedure Resize; override;
    procedure SetDragKind(Value: TDragKind); override;
{$ELSE}
    function CanFocusOnClick: Boolean; override;
    function EventFilter(Sender: QObjectH; Event: QEventH): Boolean; override;
    function HasBackground: Boolean; override;
    procedure InitWidget; override;
{$ENDIF}
    procedure ArrangeButtons; virtual;
    procedure ButtonClick(Sender: TObject); virtual;
    function GetButtonIndexAt(const P: TPoint): Integer;
    function GetButtonClass: TcxCustomRadioGroupButtonClass; virtual;
    procedure UpdateButtons; virtual;
    property Caption: TCaption read FCaption write SetCaption stored False;
    property Properties: TcxRadioGroupProperties read GetProperties write SetProperties;
    property TabStop default False;
    property ViewInfo: TcxCustomRadioGroupViewInfo read GetViewInfo;
{$IFDEF VCL}
    property ParentBackground{$IFNDEF DELPHI7}: Boolean read FParentBackground write SetParentBackground{$ENDIF} default True;
{$ENDIF}
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Activate(var AEditData: TcxCustomEditData); override;
    procedure ActivateByMouse(Shift: TShiftState; X, Y: Integer;
      var AEditData: TcxCustomEditData); override;
    procedure Clear; override;
    function Focused: Boolean; override;
    procedure FlipChildren(AllLevels: Boolean); override;
    class function GetPropertiesClass: TcxCustomEditPropertiesClass; override;
    procedure GetTabOrderList(List: TList); override;
    procedure PrepareEditValue(const ADisplayValue: TcxEditValue;
      out EditValue: TcxEditValue; AEditFocused: Boolean); override;
    property Buttons[Index: Integer]: TcxRadioButton read GetButton;
    property ItemIndex: Integer read FItemIndex write SetItemIndex default -1;
  end;

  { TcxRadioGroup }

  TcxRadioGroup = class(TcxCustomRadioGroup)
  published
    property Align;
    property Anchors;
    property Caption;
    property Constraints;
    property DragMode;
    property Enabled;
    property ItemIndex;
{$IFDEF VCL}
    property ParentBackground;
    property ParentBiDiMode;
{$ENDIF}
    property ParentColor;
{$IFDEF VCL}
    property ParentCtl3D;
{$ENDIF}
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property Properties;
    property ShowHint;
    property Style;
    property TabOrder;
    property TabStop;
    property Visible;
{$IFDEF VCL}
    property BiDiMode;
    property Ctl3D;
    property DragCursor;
    property DragKind;
{$ENDIF}
    property OnClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnStartDrag;
{$IFDEF DELPHI5}
    property OnContextPopup;
{$ENDIF}
{$IFDEF VCL}
    property OnEndDock;
    property OnStartDock;
{$ENDIF}
  end;

const
  FilledRadioButtonListSize = 48;

type
  { TcxRadioButtonImageList }

  TcxRadioButtonImageList = class
  private
    FButtonMask: TBitmap;
    FList: TImageList;
    FFilledButtonList: array [0 .. FilledRadioButtonListSize - 1] of Boolean;
  protected
    procedure PrepareButtonImage(AImageIndex: Integer;
      ALookAndFeelKind: TcxLookAndFeelKind; AButtonState: TcxEditButtonState;
      AChecked: Boolean; AFocused: Boolean; AIsDesigning: Boolean);
  public
    constructor Create;
    destructor Destroy; override;
    procedure DrawRadioButton(ACanvas: TcxCanvas; X, Y: Integer;
      ALookAndFeelKind: TcxLookAndFeelKind; AButtonState: TcxEditButtonState;
      AChecked: Boolean; AFocused: Boolean; AIsDesigning: Boolean; ABrushColor: TColor;
      ATransparent: Boolean);
    procedure Reset;
  end;

function GetRadioButtonImageList: TcxRadioButtonImageList;

implementation

uses
{$IFDEF VCL}
  dxThemeConsts, dxThemeManager, dxUxTheme,
{$ENDIF}
  cxEditConsts, cxEditPaintUtils, cxEditUtils, cxVariants;

const
  cxPixelColorMask = $FFFFFF;

type
  TCanvasAccess = class(TCanvas);
  TcxCustomEditAccess = class(TcxCustomEdit);
  TcxCustomEditStyleAccess = class(TcxCustomEditStyle);
  TcxEditDataBindingAccess = class(TcxEditDataBinding);
  TWinControlAccess = class(TWinControl);

  { TcxRadioButtonColorChangeEventReceiver }

  TcxRadioButtonColorChangeEventReceiver = class
  private
    FWindowHandle: TcxHandle;
{$IFNDEF VCL}
    FWindowHook: QWidget_hookH;
{$ENDIF}
{$IFDEF VCL}
    procedure WndProc(var Msg: TMessage);
{$ELSE}
    function EventFilter(Sender: QObjectH; Event: QEventH): Boolean; cdecl;
{$ENDIF}
  public
    constructor Create;
    destructor Destroy; override;
  end;

var
  FColorChangeEventReceiver: TcxRadioButtonColorChangeEventReceiver;
  FRadioButtonCheckRect: TRect;
  FRadioButtonCheckSize: TSize;
  FRadioButtonImageList: TcxRadioButtonImageList;
  FRadioButtonMaskSize: TSize;
  FRadioButtonPattern: array of array of Integer;
  FRadioButtonRect: TRect;
  FRadioButtonSize: TSize;
  FShiftState: TShiftState;

function GetButtonsPerColumn(AProperties: TcxCustomRadioGroupProperties): Integer;
var
  AButtonsCount, AColumnsCount: Integer;
begin
  AButtonsCount := AProperties.Items.Count;
  AColumnsCount := AProperties.Columns;
  if AColumnsCount > AButtonsCount then
    AColumnsCount := AButtonsCount;
  if AColumnsCount = 0 then
    AColumnsCount := 1;
  Result := (AButtonsCount + AColumnsCount - 1) div AColumnsCount;
end;

function GetRadioButtonImageList: TcxRadioButtonImageList;
begin
  Result := FRadioButtonImageList;
end;

{$IFDEF VCL}
procedure CalculateRadioButtonSize;
var
  B: Windows.TBitmap;
  HB: HBITMAP;
  ABitmap: TBitmap;
  I, J: Integer;
begin
  HB := LoadBitmap(0, PChar(OBM_CHECKBOXES));
  try
    GetObject(HB, SizeOf(Windows.TBitmap), @B);
  finally
    DeleteObject(HB);
  end;
  FRadioButtonMaskSize.cx := B.bmWidth div 4;
  FRadioButtonMaskSize.cy := B.bmHeight div 3;
  ABitmap := TBitmap.Create;
  try
    ABitmap.Width := FRadioButtonMaskSize.cx;
    ABitmap.Height := FRadioButtonMaskSize.cy;
    ABitmap.Canvas.Brush.Color := 0;
    ABitmap.Canvas.FillRect(Rect(0, 0, FRadioButtonMaskSize.cx, FRadioButtonMaskSize.cy));
    DrawFrameControl(ABitmap.Canvas.Handle, Rect(0, 0, FRadioButtonMaskSize.cx,
      FRadioButtonMaskSize.cy), DFC_BUTTON, DFCS_BUTTONRADIOMASK + DFCS_FLAT + DFCS_CHECKED);
    FillChar(FRadioButtonSize, SizeOf(FRadioButtonSize), 0);
    FRadioButtonRect.Left := -1;
    FRadioButtonRect.Top := -1;
    for J := 0 to FRadioButtonMaskSize.cx - 1 do
      for I := 0 to FRadioButtonMaskSize.cy - 1 do
        if ABitmap.Canvas.Pixels[J, I] = 0 then
        begin
          if FRadioButtonRect.Left = -1 then
            FRadioButtonRect.Left := J;
          Inc(FRadioButtonSize.cx);
          Break;
        end;
    for I := 0 to FRadioButtonMaskSize.cy - 1 do
      for J := 0 to FRadioButtonMaskSize.cx - 1 do
        if ABitmap.Canvas.Pixels[J, I] = 0 then
        begin
          if FRadioButtonRect.Top = -1 then
            FRadioButtonRect.Top := I;
          Inc(FRadioButtonSize.cy);
          Break;
        end;
    FRadioButtonRect.Right := FRadioButtonRect.Left + FRadioButtonSize.cx;
    FRadioButtonRect.Bottom := FRadioButtonRect.Top + FRadioButtonSize.cy;
    ABitmap.Canvas.Brush.Color := 0;
    ABitmap.Canvas.FillRect(Rect(0, 0, FRadioButtonMaskSize.cx, FRadioButtonMaskSize.cy));
    DrawFrameControl(ABitmap.Canvas.Handle, Rect(0, 0, FRadioButtonMaskSize.cx,
      FRadioButtonMaskSize.cy), DFC_BUTTON, DFCS_BUTTONRADIOIMAGE + DFCS_FLAT + DFCS_CHECKED);
    I := FRadioButtonRect.Top + (FRadioButtonSize.cy div 2) - 2;
    J := FRadioButtonRect.Left + (FRadioButtonSize.cx div 2) - 1;
    while ABitmap.Canvas.Pixels[J, I] = 0 do
      Dec(I);
    Inc(I);
    FRadioButtonCheckRect.Top := I;
    repeat
      Inc(I);
    until ABitmap.Canvas.Pixels[J, I] <> 0;
    FRadioButtonCheckRect.Bottom := I;
    FRadioButtonCheckSize.cy := FRadioButtonCheckRect.Bottom - FRadioButtonCheckRect.Top;

    I := FRadioButtonRect.Top + (FRadioButtonSize.cy div 2) - 1;
    J := FRadioButtonRect.Left + (FRadioButtonSize.cx div 2) - 2;
    while ABitmap.Canvas.Pixels[J, I] = 0 do
      Dec(J);
    Inc(J);
    FRadioButtonCheckRect.Left := J;
    repeat
      Inc(J);
    until ABitmap.Canvas.Pixels[J, I] <> 0;
    FRadioButtonCheckRect.Right := J;
    FRadioButtonCheckSize.cx := FRadioButtonCheckRect.Right - FRadioButtonCheckRect.Left;
  finally
    ABitmap.Free;
  end;
end;
{$ELSE}
procedure CalculateRadioButtonSize;
begin
  FRadioButtonMaskSize := Size(13, 13);
  FRadioButtonSize := Size(12, 12);
  FRadioButtonRect := Rect(0, 0, 12, 12);
  FRadioButtonCheckSize := Size(4, 4);
  FRadioButtonCheckRect := Rect(4, 4, 8, 8);
  (*QStyle_exclusiveIndicatorSize(QApplication_style, @FRadioButtonMaskSize);
  FRadioButtonSize := FRadioButtonMaskSize;
  FRadioButtonCheckSize.cx := FRadioButtonSize.cx - 4;
  FRadioButtonCheckSize.cy := FRadioButtonSize.cy - 4;
  FRadioButtonCheckRect := Rect(4, 4, 4 + FRadioButtonCheckSize.cx, 4 +
    FRadioButtonCheckSize.cy);*)
end;
{$ENDIF}

function InternalGetShiftState: TShiftState;
{$IFDEF VCL}
var
  AKeyState: TKeyBoardState;
{$ENDIF}
begin
{$IFDEF VCL}
  GetKeyboardState(AKeyState);
  Result := KeyboardStateToShiftState(AKeyState);
{$ELSE}
  Result := FShiftState;
{$ENDIF}
end;

procedure InternalRoundRect(ACanvas: TCanvas; const R: TRect);
begin
  with ACanvas, R do
{$IFDEF VCL}
    RoundRect(Left, Top, Right, Bottom, Right - Left - 1, Bottom - Top - 1);
{$ELSE}
  {$IFDEF WIN32}
    RoundRect(Left, Top, Right, Bottom, 99, 99);
  {$ENDIF}
  {$IFDEF LINUX}
    Ellipse(R);
  {$ENDIF}
{$ENDIF}
end;

procedure PrepareRadioButtonPattern;
  procedure PrepareOuterCircle;
  var
    ABitmap: TBitmap;
    I, J: Integer;
    P: ^DWORD;
  begin
    ABitmap := TBitmap.Create;
    try
      ABitmap.Width := FRadioButtonSize.cx;
      ABitmap.Height := FRadioButtonSize.cy;
      ABitmap.PixelFormat := pf32bit;
      with ABitmap.Canvas do
      begin
        Brush.Color := clWhite;
        FillRect(Rect(0, 0, FRadioButtonSize.cx, FRadioButtonSize.cy));
        Pen.Color := clBlack;
        with FRadioButtonSize do
          InternalRoundRect(ABitmap.Canvas, Rect(0, 0, cx, cy));
      end;
      SetLength(FRadioButtonPattern, FRadioButtonSize.cy, FRadioButtonSize.cx);
      for I := 0 to FRadioButtonSize.cy - 1 do
      begin
        P := ABitmap.ScanLine[I];
        for J := 0 to FRadioButtonSize.cx - 1 do
        begin
          if P^ and cxPixelColorMask <> 0 then
            FRadioButtonPattern[I, J] := 0
          else
            if (FRadioButtonSize.cy - 1) * (FRadioButtonSize.cx - 1 - J) < I * (FRadioButtonSize.cx - 1) then
              FRadioButtonPattern[I, J] := 2
            else
              FRadioButtonPattern[I, J] := 1;
          Inc(P);
        end;
      end;
    finally
      ABitmap.Free;
    end;
  end;

  procedure PrepareInnerCircle;
  var
    I, I1, J, J1: Integer;
    AFirstColumn, ALastColumn, AFirstRow, ALastRow: Integer;

    procedure FillPoint;
    var
      ASign: Integer;
    begin
      ASign := (FRadioButtonSize.cy - 1) * (FRadioButtonSize.cx - 1 - J) - I * (FRadioButtonSize.cx - 1);
      if ASign = 0 then
        if J <= FRadioButtonSize.cx div 2 - 1 then
          FRadioButtonPattern[I, J] := 4
        else
          FRadioButtonPattern[I, J] := 3
      else
        if ASign < 0 then
          FRadioButtonPattern[I, J] := 4
        else
          FRadioButtonPattern[I, J] := 3;
    end;

  begin
    AFirstRow := 1;
    ALastRow := FRadioButtonSize.cy - 2;
    J1 := FRadioButtonSize.cx div 2 - 1;

    for I := AFirstRow to ALastRow do
    begin
      J := J1;
      while FRadioButtonPattern[I, J] = 0 do
      begin
        FRadioButtonPattern[I, J] := 5;
        Dec(J);
      end;
      J := J1 + 1;
      while FRadioButtonPattern[I, J] = 0 do
      begin
        FRadioButtonPattern[I, J] := 5;
        Inc(J);
      end;
    end;

    for I := AFirstRow to ALastRow do
    begin
      J := J1;
      while not(FRadioButtonPattern[I, J] in [1, 2]) do
      begin
        if (I = AFirstRow) or (I = ALastRow) then
          FillPoint;
        Dec(J);
      end;
      Inc(J);
      FillPoint;
      J := J1 + 1;
      while not(FRadioButtonPattern[I, J] in [1, 2]) do
      begin
        if (I = AFirstRow) or (I = ALastRow) then
          FillPoint;
        Inc(J);
      end;
      Dec(J);
      FillPoint;
    end;

    AFirstColumn := 1;
    ALastColumn := FRadioButtonSize.cx - 2;
    I1 := FRadioButtonSize.cy div 2 - 1;
    for J := AFirstColumn to ALastColumn do
    begin
      I := I1;
      while not(FRadioButtonPattern[I, J] in [1, 2]) do
      begin
        if (J = AFirstColumn) or (J = ALastColumn) then
          FillPoint;
        Dec(I);
      end;
      Inc(I);
      FillPoint;
      I := I1 + 1;
      while not(FRadioButtonPattern[I, J] in [1, 2]) do
      begin
        if (J = AFirstColumn) or (J = ALastColumn) then
          FillPoint;
        Inc(I);
      end;
      Dec(I);
      FillPoint;
    end;
  end;

  procedure PrepareCheck;
  var
    ABitmap: TBitmap;
    I, J: Integer;
    P: ^DWORD;
    R: TRect;
  begin
    ABitmap := TBitmap.Create;
    try
      ABitmap.Width := FRadioButtonSize.cx;
      ABitmap.Height := FRadioButtonSize.cy;
      ABitmap.PixelFormat := pf32Bit;
      with ABitmap.Canvas do
      begin
        Brush.Color := clWhite;
        FillRect(Rect(0, 0, FRadioButtonSize.cx, FRadioButtonSize.cy));
        Pen.Color := clBlack;
        Brush.Color := clBlack;
        R := FRadioButtonCheckRect;
        OffsetRect(R, -FRadioButtonRect.Left, -FRadioButtonRect.Top);
        InternalRoundRect(ABitmap.Canvas, R);
        for I := 0 to FRadioButtonSize.cy - 1 do
        begin
          P := ABitmap.ScanLine[I];
          for J := 0 to FRadioButtonSize.cx - 1 do
          begin
            if P^ and cxPixelColorMask = 0 then
              FRadioButtonPattern[I, J] := 6;
            Inc(P);
          end;
        end;
      end;
    finally
      ABitmap.Free;
    end;
  end;

begin
  PrepareOuterCircle;
  PrepareInnerCircle;
  PrepareCheck;
end;


{ TcxRadioButtonColorChangeEventReceiver }

constructor TcxRadioButtonColorChangeEventReceiver.Create;
{$IFNDEF VCL}
var
  AMethod: TMethod;
{$ENDIF}
begin
  inherited Create;
{$IFDEF VCL}
  {$IFDEF DELPHI6}
  FWindowHandle := Classes.AllocateHWnd(WndProc);
  {$ELSE}
  FWindowHandle := Forms.AllocateHWnd(WndProc);
  {$ENDIF}
{$ELSE}
  FWindowHandle :=QWidget_create(nil, nil, 0);
  QWidget_setFocusPolicy(FWindowHandle, QWidgetFocusPolicy_NoFocus);
  FWindowHook := QWidget_hook_create(FWindowHandle);
  TEventFilterMethod(AMethod) := EventFilter;
  Qt_hook_hook_events(FWindowHook, AMethod);
{$ENDIF}
end;

destructor TcxRadioButtonColorChangeEventReceiver.Destroy;
begin
{$IFDEF VCL}
  {$IFDEF DELPHI6}
  Classes.DeallocateHWnd(FWindowHandle);
  {$ELSE}
  Forms.DeallocateHWnd(FWindowHandle);
  {$ENDIF}
{$ELSE}
  QWidget_hook_destroy(FWindowHook);
  QWidget_destroy(FWindowHandle);
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF VCL}
procedure TcxRadioButtonColorChangeEventReceiver.WndProc(var Msg: TMessage);
begin
  with Msg do
    if Msg = CM_SYSCOLORCHANGE then
      try
        DefWindowProc(FWindowHandle, Msg, wParam, lParam);
        Result := 0;
        FRadioButtonImageList.Reset;
      except
        Application.HandleException(Self);
      end
    else
      Result := DefWindowProc(FWindowHandle, Msg, wParam, lParam);
end;
{$ELSE}
function TcxRadioButtonColorChangeEventReceiver.EventFilter(Sender: QObjectH;
  Event: QEventH): Boolean;
begin
  Result := False;
  if QEvent_type(Event) = QEventType_ApplicationPaletteChange then
    FRadioButtonImageList.Reset;
end;
{$ENDIF}

{ TcxRadioButtonImageList }

constructor TcxRadioButtonImageList.Create;

  procedure PrepareButtonMask;
  var
    R: TRect;
  begin
    FButtonMask := TBitmap.Create;
    FButtonMask.Width := FRadioButtonSize.cx;
    FButtonMask.Height := FRadioButtonSize.cy;
    with FButtonMask.Canvas do
    begin
      Brush.Color := clWhite;
      R := Rect(0, 0, FRadioButtonSize.cx, FRadioButtonSize.cy);
      FillRect(R);
      Brush.Color := clBlack;
      Pen.Color := clBlack;
      InternalRoundRect(FButtonMask.Canvas, R);
    end;
  end;

var
  ABitmap: TBitmap;
  I: Integer;
begin
  inherited Create;
  FList := TImageList.Create(nil);
  with FList do
  begin
    Width := FRadioButtonSize.cx;
    Height := FRadioButtonSize.cy;
    Masked := True;
{$IFDEF VCL}
    ImageType := itImage;
{$ENDIF}
  end;
  ABitmap := TBitmap.Create;
  try
    with ABitmap do
    begin
      Width := FRadioButtonSize.cx;
      Height := FRadioButtonSize.cy;
    end;
    PrepareButtonMask;
    for I := 0 to FilledRadioButtonListSize - 1 do
    begin
      FList.Add(ABitmap, FButtonMask);
      FFilledButtonList[I] := False;
    end;
  finally
    ABitmap.Free;
  end;
end;

destructor TcxRadioButtonImageList.Destroy;
begin
  FreeAndNil(FList);
  FreeAndNil(FButtonMask);
  inherited Destroy;
end;

procedure TcxRadioButtonImageList.DrawRadioButton(ACanvas: TcxCanvas; X, Y: Integer;
  ALookAndFeelKind: TcxLookAndFeelKind; AButtonState: TcxEditButtonState;
  AChecked: Boolean; AFocused: Boolean; AIsDesigning: Boolean; ABrushColor: TColor; ATransparent: Boolean);
var
  AImageIndex: Integer;
begin
  AImageIndex := Integer(AFocused) * 24 + Integer(ALookAndFeelKind) * 8 + Integer(AChecked) * 4 +
    Integer(AButtonState);
  if not FFilledButtonList[AImageIndex] then
    PrepareButtonImage(AImageIndex, ALookAndFeelKind, AButtonState, AChecked,
      AFocused, AIsDesigning);
  if ATransparent then
    FList.Draw(ACanvas.Canvas, X, Y, AImageIndex)
  else
    DrawGlyph(ACanvas, FList, AImageIndex, Rect(X, Y, X + FList.Width, Y + FList.Height), ABrushColor, True);
end;

procedure TcxRadioButtonImageList.Reset;
var
  I: Integer;
begin
  for I := 0 to FilledRadioButtonListSize - 1 do
  begin
    FFilledButtonList[I] := False;
  end;
end;

procedure TcxRadioButtonImageList.PrepareButtonImage(AImageIndex: Integer;
  ALookAndFeelKind: TcxLookAndFeelKind; AButtonState: TcxEditButtonState;
  AChecked: Boolean; AFocused: Boolean; AIsDesigning: Boolean);
var
  AColorMap: array[0 .. 6] of TColor;

  function GetRadioButtonBodyColor: TColor;
  begin
    if AButtonState <> ebsDisabled then
      if ALookAndFeelKind = lfUltraFlat then
      begin
        Result := clBtnFace;
        case AButtonState of
          ebsSelected:
            Result := GetLightSelColor;
          ebsNormal:
            Result := clWindow{clBtnFace};
          ebsPressed:
            Result := GetLightDownedSelColor;
        end;
      end
      else
        if AButtonState = ebsPressed then
          Result := clBtnFace
        else
          Result := clWindow
    else
      Result := clBtnFace;
  end;

  procedure PrepareColorMap;
  begin
    AColorMap[0] := clBlack;
    AColorMap[5] := GetRadioButtonBodyColor;
    case ALookAndFeelKind of
      lfStandard:
        begin
          AColorMap[1] := clBtnShadow;
          AColorMap[2] := clBtnHighlight;
          AColorMap[3] := {$IFDEF VCL}cl3DDkShadow{$ELSE}clShadow{$ENDIF};
          AColorMap[4] := cl3DLight;
        end;
      lfFlat:
        begin
          AColorMap[1] := clBtnShadow;
          AColorMap[2] := clBtnHighlight;
          AColorMap[3] := cl3DLight;
          AColorMap[4] := cl3DLight;
        end;
      lfUltraFlat:
        begin
          if AFocused or (AButtonState = ebsSelected) or (AIsDesigning and
              (AButtonState <> ebsDisabled)) then
            AColorMap[1] := clHighlight
          else
            AColorMap[1] := clBtnShadow;
          AColorMap[2] := AColorMap[1];
          AColorMap[3] := AColorMap[5];
          AColorMap[4] := AColorMap[5];
        end;
    end;

    if not AChecked then
      AColorMap[6] := AColorMap[5]
    else
      if AButtonState <> ebsDisabled then
        AColorMap[6] := clBtnText
      else
        AColorMap[6] := clBtnShadow;
  end;

var
  ABitmap: TBitmap;
  I, J: Integer;
begin
  ABitmap := TBitmap.Create;
  try
    ABitmap.Width := FRadioButtonSize.cx;
    ABitmap.Height := FRadioButtonSize.cy;
    PrepareColorMap;
    with ABitmap.Canvas do
      for I := 0 to FRadioButtonSize.cy - 1 do
        for J := 0 to FRadioButtonSize.cx - 1 do
        begin
          Brush.Color := AColorMap[FRadioButtonPattern[I, J]];
          FillRect(Rect(J, I, J + 1, I + 1));
          // TODO
//          Pixels[I, J] := AColorMap[FRadioButtonPattern[I, J]];
        end;
    FList.Delete(AImageIndex);
{$IFDEF VCL}
    FList.Insert(AImageIndex, ABitmap, FButtonMask);
{$ELSE}
    // Bug in CLX
    FList.Add(ABitmap, FButtonMask);
    FList.Move(FList.Count - 1, AImageIndex);
{$ENDIF}
  finally
    ABitmap.Free;
  end;
  FFilledButtonList[AImageIndex] := True;
end;

{ TcxRadioButton }

constructor TcxRadioButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csDoubleClicks];
  FControlCanvas := TControlCanvas.Create;
  FControlCanvas.Control := Self;
  FCanvas := TcxCanvas.Create(TCanvas(FControlCanvas));
  FLookAndFeel := TcxLookAndFeel.Create(Self);
  FLookAndFeel.OnChanged := LookAndFeelChanged;
  FState := rbsNormal;
{$IFDEF VCL}
  ParentBackground := True;
{$ELSE}
  FAlignment := taRightJustify;
{$ENDIF}
end;

destructor TcxRadioButton.Destroy;
begin
  EndMouseTracking(Self);
  FreeAndNil(FLookAndFeel);
  FreeAndNil(FCanvas);
  FreeAndNil(FControlCanvas);
  inherited Destroy;
end;

function TcxRadioButton.Focused: Boolean;
begin
  Result := not(csDesigning in ComponentState) and {$IFDEF VCL}inherited Focused{$ELSE}HandleAllocated and QWidget_hasFocus(Handle){$ENDIF};
end;

procedure TcxRadioButton.Invalidate;
begin
  InternalInvalidateRect(Self, Rect(0, 0, Width, Height), False);
end;

procedure TcxRadioButton.DoEnter;
begin
  inherited DoEnter;
  if not Checked then
  begin
    ClicksDisabled := True;
    try
      Checked := True;
    finally
      ClicksDisabled := False;
      if not(csLoading in ComponentState) then
        Click;
    end;
  end;
end;

procedure TcxRadioButton.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited MouseDown(Button, Shift, X, Y);
  FShiftState := Shift;
{$IFNDEF VCL}
  FShiftState := FShiftState + MouseButtonToShift(Button);
{$ENDIF}
  UpdateState(ButtonTocxButton(Button), FShiftState, Point(X, Y));
end;

procedure TcxRadioButton.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseMove(Shift, X, Y);
{$IFNDEF VCL}
  FShiftState := Shift;
{$ENDIF}
  UpdateState(cxmbNone, Shift, Point(X, Y));
  BeginMouseTracking(Self, GetControlRect(Self), Self);
end;

procedure TcxRadioButton.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited MouseUp(Button, Shift, X, Y);
  FShiftState := Shift;
{$IFNDEF VCL}
  FShiftState := FShiftState - MouseButtonToShift(Button);
{$ENDIF}
  UpdateState(ButtonTocxButton(Button), FShiftState, Point(X, Y));
end;

{$IFDEF VCL}
procedure TcxRadioButton.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
    Style := Style and not BS_RADIOBUTTON or BS_OWNERDRAW;
end;
{$ELSE}
procedure TcxRadioButton.InitWidget;
begin
  inherited;
  QWidget_setBackgroundMode(Handle, QWidgetBackgroundMode_NoBackground);
end;

procedure TcxRadioButton.Painting(Sender: QObjectH; EventRegion: QRegionH);
begin
  FControlCanvas.StartPaint;
  try
    QPainter_setClipRegion(FControlCanvas.Handle, EventRegion);
    Paint;
  finally
    FControlCanvas.StopPaint;
  end;
end;
{$ENDIF}

procedure TcxRadioButton.CorrectTextRect(var R: TRect; ANativeStyle: Boolean);
const
{$IFDEF VCL}
  AInplaceTextRectCorrectionA: array [Boolean] of TRect = (
    (Left: 5; Top: 0; Right: 1; Bottom: 0),
    (Left: 3; Top: 0; Right: 0; Bottom: 0)
{$ELSE}
  {$IFDEF WIN32}
  AInplaceTextRectCorrectionA: array [Boolean] of TRect = (
    (Left: 5; Top: 0; Right: 1; Bottom: 0),
    (Left: 3; Top: 0; Right: 0; Bottom: 0)
  {$ENDIF}
  {$IFDEF LINUX}
  AInplaceTextRectCorrectionA: array [Boolean] of TRect = (
    (Left: 5; Top: -2; Right: 1; Bottom: 1),
    (Left: 5; Top: -2; Right: 0; Bottom: 1)
  {$ENDIF}
{$ENDIF}
  );
  ATextRectCorrectionA: array [Boolean, TLeftRight] of TRect = (
{$IFDEF VCL}
   ((Left: 2; Top: -1; Right: 1; Bottom: 0),
    (Left: 5; Top: -1; Right: 0; Bottom: 0)),
   ((Left: 2; Top: -1; Right: 6; Bottom: 0),
    (Left: 5; Top: -1; Right: 2; Bottom: 0))
{$ELSE}
  {$IFDEF WIN32}
   ((Left: 2; Top: 0; Right: 1; Bottom: 0),
    (Left: 7; Top: 0; Right: 1; Bottom: 0)),
   ((Left: 2; Top: 0; Right: 6; Bottom: 0),
    (Left: 7; Top: 0; Right: 1; Bottom: 0))
  {$ENDIF}
  {$IFDEF LINUX}
   ((Left: 1; Top: 0; Right: 1; Bottom: 0),
    (Left: 6; Top: 0; Right: 1; Bottom: 0)),
   ((Left: 1; Top: 0; Right: 5; Bottom: 0),
    (Left: 6; Top: 0; Right: 0; Bottom: 0))
  {$ENDIF}
{$ENDIF}
    );
  ANativeStyleTextRectCorrectionA: array [Boolean, TLeftRight] of TRect = (
   ((Left: 0; Top: -1; Right: 1; Bottom: 0),
    (Left: 3; Top: -1; Right: 0; Bottom: 0)),
   ((Left: 0; Top: -1; Right: 3; Bottom: 0),
    (Left: 3; Top: -1; Right: 0; Bottom: 0))
  );
begin
  if IsInplace then
    ExtendRect(R, AInplaceTextRectCorrectionA[{$IFDEF LINUX}WordWrap{$ELSE}ANativeStyle{$ENDIF}])
  else
{$IFDEF VCL}
    if ANativeStyle then
      ExtendRect(R, ANativeStyleTextRectCorrectionA[WordWrap, Alignment])
    else
{$ENDIF}
      ExtendRect(R, ATextRectCorrectionA[WordWrap, Alignment]);
end;

procedure TcxRadioButton.EnabledChanged;
begin
{$IFNDEF VCL}
  inherited EnabledChanged;
{$ENDIF}
  ShortUpdateState;
  Invalidate;
end;

procedure TcxRadioButton.InternalPolyLine(const APoints: array of TPoint);
begin
  Canvas.Polyline(APoints);
{$IFDEF VCL}
  with APoints[High(APoints)] do
    Canvas.Pixels[X, Y] := Canvas.Pen.Color;
{$ENDIF}
end;

function TcxRadioButton.IsInplace: Boolean;
begin
  Result := False;
end;

procedure TcxRadioButton.LookAndFeelChanged(Sender: TcxLookAndFeel;
  AChangedValues: TcxLookAndFeelValues);
begin
  Invalidate;
end;

procedure TcxRadioButton.MouseEnter(AControl: TControl);
begin
{$IFNDEF VCL}
  inherited MouseEnter(AControl);
{$ENDIF}
  ShortUpdateState;
  BeginMouseTracking(Self, GetControlRect(Self), Self);
end;

procedure TcxRadioButton.MouseLeave(AControl: TControl);
begin
{$IFNDEF VCL}
  inherited MouseLeave(AControl);
{$ENDIF}
  FShiftState := [];
  UpdateState(cxmbNone, [], Point(-1, -1));
  EndMouseTracking(Self);
end;

procedure TcxRadioButton.Paint;
var
  ANativeStyle: Boolean;
{$IFDEF VCL}
  ANativeState: Integer;
  ATheme: TTheme;
{$ENDIF}

  procedure DrawBackground;
  begin
    Canvas.Brush.Color := Color;
    Canvas.FillRect(GetControlRect(Self));
  end;

  function GetRadioButtonRect(const ARadioButtonSize: TSize): TRect;
  begin
    Result.Top := (Height - ARadioButtonSize.cy) div 2;
    Result.Bottom := Result.Top + ARadioButtonSize.cy;
    if Alignment = taRightJustify then
    begin
{$IFDEF VCL}
      if ANativeStyle then
        Result.Left := 0
      else
{$ENDIF}
        if IsInplace then
          Result.Left := 0
        else
{$IFDEF VCL}
          Result.Left := 1;
{$ELSE}
          Result.Left := 0;
{$ENDIF}
      Result.Right := Result.Left + ARadioButtonSize.cx;
    end else
    begin
      Result.Right := Width;
      Result.Left := Result.Right - ARadioButtonSize.cx;
    end;
  end;

{$IFDEF VCL}
  function GetNativeState: Integer;
  const
    ANativeStateMap: array [Boolean, TcxRadioButtonState] of Integer = (
      (RBS_UNCHECKEDDISABLED, RBS_UNCHECKEDHOT, RBS_UNCHECKEDNORMAL,
      RBS_UNCHECKEDPRESSED),
      (RBS_CHECKEDDISABLED, RBS_CHECKEDHOT, RBS_CHECKEDNORMAL,
      RBS_CHECKEDPRESSED)
    );
  begin
    Result := ANativeStateMap[Checked, FState];
  end;
{$ENDIF}

  procedure DrawCaption;

    function GetDrawTextFlags({$IFDEF VCL}ANativeStyle: Boolean{$ENDIF}): Integer;
    begin
{$IFDEF VCL}
      if ANativeStyle then
      begin
        Result := DT_LEFT or DT_VCENTER;
        if WordWrap then
          Result := Result or DT_NOCLIP or DT_WORDBREAK
        else
          Result := Result or DT_SINGLELINE;
      end else
{$ENDIF}
      begin
        Result := cxAlignLeft or cxAlignVCenter or cxShowPrefix;
        if WordWrap then
          Result := Result or cxDontClip or cxWordBreak
        else
          Result := Result or cxSingleLine;
      end;
    end;

{$IFNDEF VCL}
    procedure CorrectFocusRect(var R: TRect);
    var
      AMinLeftBound, AMaxRightBound: Integer;
    begin
      ExtendRect(R, GetFocusRectCorrection);
      if Alignment = taLeftJustify then
        AMinLeftBound := 0
      else
        AMinLeftBound := FButtonRect.Right + 4;
      if R.Left < AMinLeftBound then
        R.Left := AMinLeftBound;
      if R.Top < 0 then
        R.Top := 0;
      if Alignment = taLeftJustify then
        AMaxRightBound := FButtonRect.Left
      else
        AMaxRightBound := Width;
      if R.Right > AMaxRightBound then
        R.Right := AMaxRightBound;
      if R.Bottom > Height then
        R.Bottom := Height;
    end;
{$ENDIF}

  procedure CheckFocusRect(var R: TRect);
  begin
    if IsInplace then
    begin
      if R.Top < 1 then
        R.Top := 1;
      if R.Bottom > Height - 1 then
        R.Bottom := Height - 1;
      if R.Right > Width then
        R.Right := Width;
    end
    else
    begin
      if R.Left < 0 then
        R.Left := 0;
      if R.Top < 0 then
        R.Top := 0;
      if R.Right > Width then
        R.Right := Width;
      if R.Bottom > Height then
        R.Bottom := Height;
      if (Alignment = taLeftJustify) and (R.Right > FButtonRect.Left) then
        R.Right := FButtonRect.Left;
    end;
  end;

  var
    R: TRect;
    AFlags: Integer;
  begin
    Canvas.Font.Assign(Font);
    TCanvasAccess(Canvas.Canvas).RequiredState([csFontValid]);
    if not Enabled then
      Canvas.Font.Color := {$IFDEF VCL}clBtnShadow{$ELSE}clDisabledButtonText{$ENDIF};
    R := GetControlRect(Self);
    if Alignment = taRightJustify then
      R.Left := FButtonRect.Right
    else
      R.Right := FButtonRect.Left;
    Canvas.Brush.Style := bsClear;
    CorrectTextRect(R, ANativeStyle);
    AFlags := GetDrawTextFlags({$IFDEF VCL}False(*ANativeStyle*){$ENDIF});
    if ANativeStyle and not IsInplace then
    begin
      if fsBold in Canvas.Font.Style then
        Canvas.Font.Style := Canvas.Font.Style - [fsBold]
      else
        Canvas.Font.Style := Canvas.Font.Style + [fsBold];
      if fsBold in Canvas.Font.Style then
        Canvas.Font.Style := Canvas.Font.Style - [fsBold]
      else
        Canvas.Font.Style := Canvas.Font.Style + [fsBold];
    end;
    Canvas.DrawText(Caption, R, AFlags);
    Canvas.Brush.Style := bsSolid;
    if Focused and (Caption <> '') then
    begin
      AFlags := GetDrawTextFlags({$IFDEF VCL}False{$ENDIF});
      Canvas.TextExtent(Caption, R, AFlags);
      {$IFDEF WIN32}InflateRect(R, 1, 1);{$ENDIF}
      Inc(R.Bottom);
      CheckFocusRect(R);
{$IFDEF VCL}
      Canvas.Brush.Color := Color;
      TCanvasAccess(Canvas.Canvas).RequiredState([csFontValid]);
      Canvas.Canvas.DrawFocusRect(R);
{$ELSE}
      if not IsInplace then
        CorrectFocusRect(R);
  {$IFDEF WIN32}
      Canvas.Brush.Color := clRed;
      Canvas.Font.Color := Font.Color;
      TCanvasAccess(Canvas.Canvas).RequiredState([csFontValid, csBrushValid]);
      Windows.DrawFocusRect(QPainter_handle(Canvas.Handle), R);
  {$ENDIF}
  {$IFDEF LINUX}
      Canvas.Canvas.DrawFocusRect(R);
  {$ENDIF}
{$ENDIF}
    end;
  end;

const
  AButtonStateMap: array [TcxRadioButtonState] of TcxEditButtonState =
    (ebsDisabled, ebsSelected, ebsNormal, ebsPressed);
var
  ARadioButtonSize: TSize;
  R: TRect;
begin
{$IFDEF VCL}
  ANativeStyle := AreVisualStylesMustBeUsed(LookAndFeel.NativeStyle, totButton);
  if ANativeStyle then
  begin
    ANativeState := GetNativeState;
    ATheme := OpenTheme(totButton);
    GetThemePartSize(ATheme, Canvas.Handle, BP_RADIOBUTTON, ANativeState,
      nil, TS_TRUE, @ARadioButtonSize);
    FButtonRect := GetRadioButtonRect(ARadioButtonSize);
    R := GetControlRect(Self);
    if not IsInplace and ParentBackground then
      DrawThemeParentBackground(Handle, Canvas.Handle, @R)
    else
      DrawBackground;
    DrawThemeBackground(ATheme, Canvas.Handle, BP_RADIOBUTTON, ANativeState,
      @FButtonRect);
    DrawCaption;
  end else
{$ENDIF}
  begin
{$IFNDEF VCL}
    Canvas.Canvas.Start;
    try
{$ENDIF}
      ANativeStyle := False;
      ARadioButtonSize := FRadioButtonSize;
      FButtonRect := GetRadioButtonRect(ARadioButtonSize);
      R := FButtonRect;
      FRadioButtonImageList.DrawRadioButton(Canvas, R.Left, R.Top, LookAndFeel.Kind,
        AButtonStateMap[State], Checked, Focused, csDesigning in ComponentState, Color, False);
      Canvas.ExcludeClipRect(R);
      DrawBackground;
      DrawCaption;
{$IFNDEF VCL}
    finally
      Canvas.Canvas.Stop;
    end;
{$ENDIF}
  end;
end;

procedure TcxRadioButton.ShortUpdateState;
begin
  if not HandleAllocated then
    Exit;
  UpdateState(cxmbNone, InternalGetShiftState, ScreenToClient(InternalGetCursorPos));
end;

procedure TcxRadioButton.UpdateState(Button: TcxMouseButton; Shift: TShiftState;
  const P: TPoint);
begin
  if not Enabled then
    State := rbsDisabled
  else
    if (csDesigning in ComponentState) then
      State := rbsNormal
    else
      if GetCaptureControl = Self then // VCL only
        if PtInRect(GetControlRect(Self), P) then
          State := rbsPressed
        else
          State := rbsHot
      else
        if PtInRect(GetControlRect(Self), P) then
        begin
{$IFNDEF VCL}
          if (Button = cxmbLeft) and (ssLeft in Shift) and not(ssDouble in Shift) then
            State := rbsPressed
          else
{$ENDIF}
            if Shift = [] then
              State := rbsHot
            else
              State := rbsNormal
        end
        else
          State := rbsNormal;
end;

{$IFNDEF VCL}
function TcxRadioButton.GetFocusRectCorrection: TRect;
const
  AFocusRectCorrectionA: array [TLeftRight] of TRect = (
    (Left: -1; Top: -1; Right: -1; Bottom: 0),
    (Left: -2; Top: -1; Right: -1; Bottom: 0)
  );
begin
  Result := AFocusRectCorrectionA[Alignment];
end;
{$ENDIF}

// IcxMouseTrackingCaller
procedure TcxRadioButton.MouseTrackingCallerMouseLeave;
begin
  MouseLeave(nil);
end;

procedure TcxRadioButton.SetLookAndFeel(Value: TcxLookAndFeel);
begin
  FLookAndFeel.Assign(Value);
end;

procedure TcxRadioButton.SetState(Value: TcxRadioButtonState);
var
  R: TRect;
begin
  if Value <> FState then
  begin
    FState := Value;
    R := FButtonRect;
    InflateRect(R, 1, 1);
    InternalInvalidateRect(Self, R, False);
  end;
end;

{$IFDEF VCL}
procedure TcxRadioButton.DrawItem(const DrawItemStruct: TDrawItemStruct);
begin
  FCanvas.Canvas.Handle := DrawItemStruct.hDC;
  Paint;
  FCanvas.Canvas.Handle := 0;
end;

  {$IFNDEF DELPHI7}
procedure TcxRadioButton.SetParentBackground(Value: Boolean);
begin
  if Value <> FParentBackground then
  begin
    FParentBackground := Value;
    Invalidate;
  end;
end;

procedure TcxRadioButton.SetWordWrap(Value: Boolean);
begin
  if Value <> FWordWrap then
  begin
    FWordWrap := Value;
    Invalidate;
  end;
end;
  {$ENDIF}

procedure TcxRadioButton.WMEraseBkgnd(var Message: TWMEraseBkgnd);
begin
  Message.Result := 1;
end;

procedure TcxRadioButton.BMSetCheck(var Message: TMessage);
begin
  inherited;
  InternalInvalidateRect(Self, FButtonRect, False);
end;

procedure TcxRadioButton.CMEnabledChanged(var Message: TMessage);
begin
  inherited;
  EnabledChanged;
end;

procedure TcxRadioButton.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  if Message.lParam = 0 then
    MouseEnter(Self)
  else
    MouseEnter(TControl(Message.lParam));
end;

procedure TcxRadioButton.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  if Message.lParam = 0 then
    MouseLeave(Self)
  else
    MouseLeave(TControl(Message.lParam));
end;

procedure TcxRadioButton.CMSysColorChange(var Message: TMessage);
begin
  inherited;
  FRadioButtonImageList.Reset;
  Invalidate;
end;

procedure TcxRadioButton.CNDrawItem(var Message: TWMDrawItem);
begin
  DrawItem(Message.DrawItemStruct^);
end;

procedure TcxRadioButton.CNMeasureItem(var Message: TWMMeasureItem);
begin
  with Message.MeasureItemStruct^ do
  begin
    itemWidth := Width;
    itemHeight := Height;
  end;
end;
{$ELSE}
procedure TcxRadioButton.SetAlignment(Value: TLeftRight);
begin
  if Value <> FAlignment then
  begin
    FAlignment := Value;
// TODO
    Invalidate;
  end;
end;

procedure TcxRadioButton.SetWordWrap(Value: Boolean);
begin
  if Value <> FWordWrap then
  begin
    FWordWrap := Value;
    Invalidate;
  end;
end;
{$ENDIF}

{ TcxCustomRadioGroupViewInfo }

procedure TcxCustomRadioGroupViewInfo.DrawButton(ACanvas: TcxCanvas;
  AButtonVisibleIndex: Integer);
var
  AButtonViewInfo: TcxRadioGroupButtonViewInfo;
  AButtonRect: TRect;
{$IFDEF VCL}
  ATheme: TTheme;
{$ENDIF}

  procedure DrawBackground;
  begin
    if Transparent then
      Exit;
    ACanvas.Brush.Color := BackgroundColor;
    ACanvas.FillRect(ButtonsInfo[AButtonVisibleIndex].Bounds);
  end;

  function GetRadioButtonRect(const ARadioButtonSize: TSize; out AIsClippingNeeded: Boolean): TRect;
  begin
    with ButtonsInfo[AButtonVisibleIndex] do
    begin
      Result.Top := Bounds.Top + (Bounds.Bottom - Bounds.Top - ARadioButtonSize.cy) div 2;
      Result.Bottom := Result.Top + ARadioButtonSize.cy;
      AIsClippingNeeded := (Result.Top < Bounds.Top) or (Result.Bottom > Bounds.Bottom);
      if Alignment = taRightJustify then
      begin
        Result.Left := Bounds.Left;
        Result.Right := Result.Left + ARadioButtonSize.cx;
      end else
      begin
        Result.Right := Bounds.Right;
        Result.Left := Result.Right - ARadioButtonSize.cx;
      end;
    end;
  end;

  procedure DrawCaption;

    procedure CorrectTextRect(var R: TRect);
    const
      ANativeStyleTextRectCorrection: TRect = (Left: 3; Top: -1; Right: 0; Bottom: -1);
{$IFDEF VCL}
      ATextRectCorrection: TRect = (Left: 5; Top: 0; Right: 1; Bottom: 0);
{$ELSE}
  {$IFDEF WIN32}
      ATextRectCorrection: TRect = (Left: 5; Top: 0; Right: 1; Bottom: 0);
  {$ENDIF}
  {$IFDEF LINUX}
      ATextRectCorrection: array[Boolean] of TRect = (
        (Left: 5; Top: -2; Right: 1; Bottom: 1),
        (Left: 5; Top: -2; Right: 0; Bottom: 1)
      );
  {$ENDIF}
{$ENDIF}
    begin
      if NativeStyle then
        ExtendRect(R, ANativeStyleTextRectCorrection)
      else
        ExtendRect(R, ATextRectCorrection{$IFDEF LINUX}[DrawTextFlags and cxSingleLine = 0]{$ENDIF});
//      if R.Top < BorderRect.Top + 1 then
//        R.Top := BorderRect.Top + 1;
//      if R.Bottom > BorderRect.Bottom - 1 then
//        R.Bottom := BorderRect.Bottom - 1;
    end;

  var
    R: TRect;
  begin
    ACanvas.Font := Font;
    ACanvas.Font.Color := TextColor;
    PrepareCanvasFont(ACanvas.Font);
    R := AButtonViewInfo.Bounds;
    if Alignment = taRightJustify then
      R.Left := AButtonRect.Right
    else
      R.Right := AButtonRect.Left;
    ACanvas.Brush.Style := bsClear;
    CorrectTextRect(R);
    ACanvas.DrawText(AButtonViewInfo.Caption, R, DrawTextFlags);
    ACanvas.Brush.Style := bsSolid;
    if not IsInplace and Focused then
    begin
      ACanvas.TextExtent(AButtonViewInfo.Caption, R, DrawTextFlags);
      InflateRect(R, 1, 1);
      Inc(R.Bottom);
{$IFDEF VCL}
//      Canvas.Font.Color := clBtnText;
      ACanvas.Brush.Color := BackgroundColor;
      TCanvasAccess(ACanvas.Canvas).RequiredState([csFontValid]);
      ACanvas.Canvas.DrawFocusRect(R);
{$ELSE}
      ACanvas.DrawFocusRect(R);
{$ENDIF}
    end;
  end;

const
  ALookAndFeelKindMap: array [TcxEditButtonStyle] of TcxLookAndFeelKind =
    (lfStandard, lfStandard, lfFlat, lfStandard, lfStandard, lfUltraFlat);
var
  ABrushColor: TColor;
  AIsClippingNeeded: Boolean;
  APrevClipRegion: TcxRegion;
  ARadioButtonSize: TSize;
  R: TRect;
begin
  AButtonViewInfo := TcxRadioGroupButtonViewInfo(ButtonsInfo[AButtonVisibleIndex]);
  with AButtonViewInfo do
  begin
{$IFDEF VCL}
    if NativeStyle then
    begin
      ATheme := OpenTheme(totButton);
      GetThemePartSize(ATheme, ACanvas.Handle, BP_RADIOBUTTON, Data.NativeState,
        nil, TS_TRUE, @ARadioButtonSize);
      AButtonRect := GetRadioButtonRect(ARadioButtonSize, AIsClippingNeeded);
      APrevClipRegion := nil;
      try
        if AIsClippingNeeded then
        begin
          APrevClipRegion := ACanvas.GetClipRegion;
          ACanvas.IntersectClipRect(ButtonsInfo[AButtonVisibleIndex].Bounds);
        end;
        if IsThemeBackgroundPartiallyTransparent(ATheme, BP_RADIOBUTTON, Data.NativeState) then
        begin
          DrawBackground;
          DrawThemeBackground(ATheme, ACanvas.Handle, BP_RADIOBUTTON, Data.NativeState,
            @AButtonRect);
        end else
        begin
          DrawThemeBackground(ATheme, ACanvas.Handle, BP_RADIOBUTTON, Data.NativeState,
            @AButtonRect);
          ACanvas.ExcludeClipRect(AButtonRect);
          DrawBackground;
        end;
      finally
        if APrevClipRegion <> nil then
          ACanvas.SetClipRegion(APrevClipRegion, roSet);
      end;
    end else
{$ENDIF}
    begin
      ARadioButtonSize := FRadioButtonSize(*FRadioButtonMaskSize*);
      AButtonRect := GetRadioButtonRect(ARadioButtonSize, AIsClippingNeeded);
      APrevClipRegion := nil;
      try
        if AIsClippingNeeded then
        begin
          APrevClipRegion := ACanvas.GetClipRegion;
          ACanvas.IntersectClipRect(ButtonsInfo[AButtonVisibleIndex].Bounds);
        end;
        R := AButtonRect;
        ABrushColor := BackgroundColor;
        FRadioButtonImageList.DrawRadioButton(ACanvas, R.Left, R.Top,
          ALookAndFeelKindMap[Data.Style], Data.State, ItemIndex = AButtonVisibleIndex,
          False, IsDesigning, ABrushColor, Transparent);
        ACanvas.ExcludeClipRect(R);
        DrawBackground;
      finally
        if APrevClipRegion <> nil then
          ACanvas.SetClipRegion(APrevClipRegion, roSet);
      end;
    end;
    DrawCaption;
  end;
end;

function TcxCustomRadioGroupViewInfo.GetButtonViewInfoClass: TcxEditButtonViewInfoClass;
begin
  Result := TcxRadioGroupButtonViewInfo;
end;

{ TcxCustomRadioGroupViewData }

procedure TcxCustomRadioGroupViewData.Calculate(ACanvas: TcxCanvas;
  const ABounds: TRect; const P: TPoint; Button: TcxMouseButton; Shift: TShiftState;
  AViewInfo: TcxCustomEditViewInfo; AIsMouseEvent: Boolean);
begin
  with TcxCustomRadioGroupViewInfo(AViewInfo) do
  begin
    IsDesigning := Self.IsDesigning;
    if Edit <> nil then
      Text := TcxCustomRadioGroup(Edit).Caption;
    Alignment := taRightJustify;
    DrawTextFlags := GetDrawTextFlags;
    Font := Style.Font;
  end;
  inherited Calculate(ACanvas, ABounds, P, Button, Shift, AViewInfo, AIsMouseEvent);
end;

procedure TcxCustomRadioGroupViewData.CalculateButtonsViewInfo(ACanvas: TcxCanvas;
  const ABounds: TRect; const P: TPoint; Button: TcxMouseButton; Shift: TShiftState;
  AViewInfo: TcxCustomEditViewInfo; AIsMouseEvent: Boolean);
var
  AButtonViewInfo: TcxRadioGroupButtonViewInfo;
  APrevPressedButton: Integer;

{$IFDEF VCL}
  procedure CalculateButtonState(AButtonViewInfo: TcxEditButtonViewInfo);
  const
    AButtonStateMap: array [Boolean, TcxEditButtonState] of Integer = (
      (RBS_UNCHECKEDDISABLED, RBS_UNCHECKEDNORMAL, RBS_UNCHECKEDPRESSED, RBS_UNCHECKEDHOT),
      (RBS_CHECKEDDISABLED, RBS_CHECKEDNORMAL, RBS_CHECKEDPRESSED, RBS_CHECKEDHOT)
    );
  var
    ATheme: TTheme;
  begin
    with AButtonViewInfo do
    begin
      if not Data.NativeStyle then
        Exit;
      Data.NativePart := BP_RADIOBUTTON;
      Data.NativeState := AButtonStateMap[Index = TcxCustomRadioGroupViewInfo(AViewInfo).ItemIndex, Data.State];
      ATheme := OpenTheme(totButton);
      Data.BackgroundPartiallyTransparent := IsThemeBackgroundPartiallyTransparent(ATheme,
        Data.NativePart, Data.NativeState);
    end;
  end;
{$ENDIF}

const
  AButtonInplaceStyleMap: array[TcxLookAndFeelKind] of TcxEditButtonStyle =
    (btsFlat, bts3D, btsUltraFlat);
  AButtonStyleMap: array [TcxEditBorderStyle] of TcxEditButtonStyle =
    (bts3D, btsFlat, btsFlat, btsFlat, bts3D, btsUltraFlat);
  AMargin = 8;
var
  AButtonsCount, AColumnsCount: Integer;
  AButtonStyle: TcxEditButtonStyle;
  ACapturePressing: Boolean;
  AClientExtent: TRect;
  AClientHeight: Integer;
  AHoldPressing, AMouseButtonPressing: Boolean;
  AIsButtonPressed: Boolean;
  AButtonsPerColumn, AButtonWidth, AButtonHeight: Integer;
  ATopOffset: Integer;
  I: Integer;
begin
  AButtonsCount := Properties.Items.Count;
  TcxCustomRadioGroupViewInfo(AViewInfo).SetButtonCount(AButtonsCount);
  if AButtonsCount = 0 then
    Exit;

  AColumnsCount := Properties.Columns;
  if AColumnsCount > AButtonsCount then
    AColumnsCount := AButtonsCount;
  if AColumnsCount = 0 then
    AColumnsCount := 1;
  AButtonsPerColumn := (AButtonsCount + AColumnsCount - 1) div AColumnsCount;
  AClientExtent := GetClientExtent(AViewInfo);
{$IFNDEF VCL}
  if not IsInplace then
    AButtonWidth := (ABounds.Right - ABounds.Left - AClientExtent.Left -
      AClientExtent.Right - AMargin * 2) div AColumnsCount + AMargin
  else
{$ENDIF}
    AButtonWidth := (ABounds.Right - ABounds.Left - AClientExtent.Left -
      AClientExtent.Right - 6 + 4 * Integer(IsInplace)) div AColumnsCount;
  AClientHeight := ABounds.Bottom - ABounds.Top - AClientExtent.Top - AClientExtent.Bottom;

  if IsInplace then
    ATopOffset := ABounds.Top + AClientExtent.Top
  else
{$IFDEF VCL}
    ATopOffset := ABounds.Top + AClientExtent.Top - cxEditMaxBorderWidth +
      (AClientHeight mod AButtonsPerColumn) div 2;
{$ELSE}
    ATopOffset := ABounds.Top + AClientExtent.Top + 8 - (Style.Font.Height) div 2;
{$ENDIF}

{$IFNDEF VCL}
  if not IsInplace then
    AButtonHeight := (ABounds.Bottom - AClientExtent.Bottom - ATopOffset) div AButtonsPerColumn
  else
{$ENDIF}
    AButtonHeight := AClientHeight div AButtonsPerColumn;

  if IsInplace then
    AButtonStyle := AButtonInplaceStyleMap[Style.LookAndFeel.Kind]
  else
    AButtonStyle := AButtonStyleMap[AViewInfo.BorderStyle];
  if Style.BorderStyle = ebsUltraFlat then
    AButtonStyle := btsUltraFlat;

  for I := 0 to AButtonsCount - 1 do
  begin
    AButtonViewInfo := TcxRadioGroupButtonViewInfo(AViewInfo.ButtonsInfo[I]);
    with AButtonViewInfo do
    begin
      HasBackground := AViewInfo.HasBackground;
      Data.Style := AButtonStyle;
      Caption := Properties.Items[I].Caption;
      Column := I div AButtonsPerColumn;
      Bounds.Left := ABounds.Left + Column * AButtonWidth +
        AClientExtent.Left + 6 - 5 * Integer(IsInplace);
      Row := I mod AButtonsPerColumn;
      Bounds.Top := ATopOffset + Row * AButtonHeight;
{$IFDEF VCL}
      Bounds.Right := Bounds.Left + AButtonWidth;
{$ELSE}
      if Bounds.Left >= ABounds.Right - AClientExtent.Right then
        Bounds.Right := Bounds.Left
      else
      begin
        Bounds.Right := Bounds.Left + AButtonWidth;
        if Bounds.Right > ABounds.Right - AClientExtent.Right then
          Bounds.Right := ABounds.Right - AClientExtent.Right;
      end;
      if Column = AColumnsCount - 1 then
        Bounds.Right := ABounds.Right - AClientExtent.Right - 1;
{$ENDIF}
      Bounds.Bottom := Bounds.Top + AButtonHeight;
      VisibleBounds := Bounds;
    end;
  end;

  AViewInfo.IsButtonReallyPressed := False;
  if AIsMouseEvent then
    APrevPressedButton := AViewInfo.PressedButton
  else
    APrevPressedButton := -1;
  AViewInfo.PressedButton := -1;
  AViewInfo.SelectedButton := -1;

  for I := 0 to AButtonsCount - 1 do
  begin
    AButtonViewInfo := TcxRadioGroupButtonViewInfo(AViewInfo.ButtonsInfo[I]);
    AButtonViewInfo.Index := I;
{$IFDEF VCL}
    AButtonViewInfo.Data.NativeStyle := Style.LookAndFeel.NativeStyle and AreVisualStylesAvailable([totButton]);
{$ELSE}
    AButtonViewInfo.Data.NativeStyle := False;
{$ENDIF}
    with TcxCustomEditStyleAccess(Self.Style) do
      AButtonViewInfo.Data.Transparent := (ButtonTransparency = ebtAlways) or
        (ButtonTransparency = ebtInactive) and not Selected;
    AButtonViewInfo.Data.BackgroundColor := AViewInfo.BackgroundColor;
    AIsButtonPressed := IsButtonPressed(AViewInfo, I);
    with AButtonViewInfo do
    begin
      if not Enabled then
        Data.State := ebsDisabled
      else
        if AIsButtonPressed or (not IsDesigning and PtInRect(AButtonViewInfo.Bounds, P)) then
        begin
          ACapturePressing := (Button = cxmbNone) and (ButtonToShift(mbLeft) *
            Shift <> []) and (Data.State = ebsNormal) and (GetCaptureButtonVisibleIndex =
            I);
          AMouseButtonPressing := (Button = ButtonTocxButton(mbLeft)) and
            ((Shift = ButtonToShift(mbLeft)) or
            (Shift = ButtonToShift(mbLeft) + [ssDouble]));
          AHoldPressing := (Data.State = ebsPressed) and (Shift * ButtonToShift(mbLeft) <> []);
          if AIsButtonPressed or AMouseButtonPressing or AHoldPressing or
              ACapturePressing then
            AViewInfo.IsButtonReallyPressed := True;
          if not AIsButtonPressed and (Shift = []) and not ACapturePressing then
          begin
            Data.State := ebsSelected;
            AViewInfo.SelectedButton := I;
          end
          else
            if (AIsButtonPressed or ACapturePressing and CanPressButton(AViewInfo, I) or ((Shift = [ssLeft]) or (Shift = [ssLeft, ssDouble])) and
              ((Button = cxmbLeft) and CanPressButton(AViewInfo, I) or
              (APrevPressedButton = I))) or AHoldPressing then
            begin
              Data.State := ebsPressed;
              AViewInfo.PressedButton := I;
            end
            else
              Data.State := ebsNormal;
        end
        else
          Data.State := ebsNormal;

{$IFDEF VCL}
      CalculateButtonState(AButtonViewInfo);
{$ENDIF}
    end;
  end;
end;

procedure TcxCustomRadioGroupViewData.EditValueToDrawValue(ACanvas: TcxCanvas;
  const AEditValue: TcxEditValue; AViewInfo: TcxCustomEditViewInfo);
var
  ADisplayValue: TcxEditValue;
begin
  Properties.PrepareDisplayValue(AEditValue, ADisplayValue, (Edit <> nil) and Edit.InternalFocused);
  TcxCustomRadioGroupViewInfo(AViewInfo).ItemIndex := ADisplayValue;
  if epoAutoHeight in PaintOptions then
    Include(AViewInfo.PaintOptions, epoAutoHeight);
end;

function TcxCustomRadioGroupViewData.GetBorderExtent: TRect;
begin
  Result := inherited GetBorderExtent;
  if not IsInplace then
    Result.Top := ScreenCanvas.FontHeight(Style.Font) div 2 - 1 + cxEditMaxBorderWidth;
end;

function TcxCustomRadioGroupViewData.GetClientExtent(AViewInfo: TcxCustomEditViewInfo): TRect;
begin
  Result := inherited GetBorderExtent;
  if not IsInplace then
{$IFDEF VCL}
    Result.Top := ScreenCanvas.FontHeight(Style.Font) + cxEditMaxBorderWidth + 1;
{$ELSE}
    if TcxCustomRadioGroup(Edit).Caption <> '' then
      Inc(Result.Top, Style.Font.Height);
{$ENDIF}
end;

function TcxCustomRadioGroupViewData.GetEditConstantPartSize(ACanvas: TcxCanvas;
  const AEditSizeProperties: TcxEditSizeProperties; var MinContentSize: TSize;
  AViewInfo: TcxCustomEditViewInfo = nil): TSize;
const
  AColumnWidthCorrectionA: array [Boolean] of Integer = (7, 5);
  AAutoHeightColumnWidthCorrectionA: array [Boolean] of Integer = (3, 1);
var
  AButtonsCount, AButtonsPerColumn, AColumnsCount: Integer;
  ACaption: TCaption;
  AColumnIndex: Integer;
  AColumnWidth, AColumnHeight: Integer;
  ADefaultCaptionHeight: Integer;
  AFlags: Integer;
  AMaxColumnWidth: Integer;
  ANativeStyle: Boolean;
  ARadioButtonSize: TSize;
  ASizeCorrection: TSize;
  ATextWidth: Integer;
  I: Integer;
  R: TRect;
{$IFDEF VCL}
  ATheme: TTheme;
{$ENDIF}
begin
  FillChar(MinContentSize, SizeOf(MinContentSize), 0);
  ACanvas.Font := Style.Font;
  ASizeCorrection := GetTextEditContentSizeCorrection(Self);
  AButtonsCount := Properties.Items.Count;
  AColumnsCount := Properties.Columns;
  if AColumnsCount > AButtonsCount then
    AColumnsCount := AButtonsCount;
  if AColumnsCount = 0 then
    AColumnsCount := 1;
  AButtonsPerColumn := (AButtonsCount + AColumnsCount - 1) div AColumnsCount;
  ARadioButtonSize := FRadioButtonSize;
{$IFDEF VCL}
  ANativeStyle := Style.LookAndFeel.NativeStyle and AreVisualStylesAvailable([totButton]);
  if ANativeStyle then
  begin
    ATheme := OpenTheme(totButton);
    GetThemePartSize(ATheme, ACanvas.Handle, BP_RADIOBUTTON, RBS_UNCHECKEDNORMAL,
      nil, TS_TRUE, @ARadioButtonSize);
  end;
{$ELSE}
  ANativeStyle := False;
{$ENDIF}
  if AEditSizeProperties.Width >= 0 then
  begin
    Result.cx := AEditSizeProperties.Width;
    ADefaultCaptionHeight := ACanvas.TextHeight('Zg') + ASizeCorrection.cy;
    if AButtonsCount = 0 then
      Result.cy := ADefaultCaptionHeight
    else
    begin
      Result.cy := 0;
      AColumnIndex := -1;
      AColumnWidth := (AEditSizeProperties.Width - ContentOffset.Left - ContentOffset.Right - 6 + Integer(IsInplace){$IFDEF LINUX} + Integer(IsInplace){$ENDIF}) div
        AColumnsCount - ARadioButtonSize.cx - AAutoHeightColumnWidthCorrectionA[ANativeStyle];
      if AColumnWidth <= 0 then
        AColumnWidth := 1;
      AColumnHeight := 0;
      Include(PaintOptions, epoAutoHeight);
      AFlags := GetDrawTextFlags and not cxAlignVCenter or cxAlignTop;
      for I := 0 to AButtonsCount - 1 do
      begin
        if I div AButtonsPerColumn > AColumnIndex then
        begin
          if AColumnHeight > Result.cy then
            Result.cy := AColumnHeight;
          AColumnHeight := 0;
          Inc(AColumnIndex);
        end;
        R := Rect(0, 0, AColumnWidth, MaxInt);
        ACaption := Properties.Items[I].Caption;
        if not Properties.WordWrap or (ACaption = '') then
          Inc(AColumnHeight, ADefaultCaptionHeight)
        else
        begin
          ACanvas.TextExtent(ACaption, R, AFlags);
          Inc(AColumnHeight, R.Bottom - R.Top + ASizeCorrection.cy);
        end;
      end;
      if AColumnHeight > Result.cy then
        Result.cy := AColumnHeight;
    end;
  end else
  begin
    if AButtonsCount = 0 then
    begin
      Result.cx := 0;
      Result.cy := ACanvas.TextHeight('Zg') + ASizeCorrection.cy;
    end else
    begin
      AMaxColumnWidth := 0;
      for I := 0 to AButtonsCount - 1 do
      begin
        ATextWidth := ACanvas.TextWidth(Properties.Items[I].Caption);
        if ATextWidth > AMaxColumnWidth then
          AMaxColumnWidth := ATextWidth;
      end;
      Result.cx := (AMaxColumnWidth + AColumnWidthCorrectionA[ANativeStyle] + ARadioButtonSize.cx) *
        AColumnsCount + 6 - 5 * Integer(IsInplace){$IFDEF LINUX} - Integer(IsInplace){$ENDIF};
      Result.cy := (ACanvas.TextHeight('Zg') + ASizeCorrection.cy) * AButtonsPerColumn;
    end;
  end;
end;

function TcxCustomRadioGroupViewData.GetBorderStyle(AEditHotState: TcxContainerHotState): TcxEditBorderStyle;
const
  ABorderStyleCorrectionA: array [TcxContainerHotState, TcxEditBorderStyle] of TcxEditBorderStyle = (
    (ebsNone, ebsSingle, ebsThick, ebsFlat, ebs3D, ebsSingle),
    (ebsNone, ebsSingle, ebsThick, ebsFlat, ebs3D, ebsSingle),
    (ebsFlat, ebsThick, ebsThick, ebsFlat, ebs3D, ebsSingle)
  );
begin
  if IsInplace then
    Result := ebsNone
  else
    Result := ABorderStyleCorrectionA[AEditHotState, BorderStyle];
end;

function TcxCustomRadioGroupViewData.GetDrawTextFlags: Integer;
begin
  Result := cxAlignLeft or cxAlignVCenter or cxShowPrefix;
  if (epoAutoHeight in PaintOptions) and Properties.WordWrap then
  begin
    Result := Result or cxDontClip;
    Result := Result or cxWordBreak;
  end
  else
    Result := Result or cxSingleLine;
end;

function TcxCustomRadioGroupViewData.GetProperties: TcxCustomRadioGroupProperties;
begin
  Result := TcxCustomRadioGroupProperties(FProperties);
end;

procedure TcxCustomRadioGroupViewData.SetProperties(Value: TcxCustomRadioGroupProperties);
begin
  FProperties := Value;
end;

{ TcxRadioGroupItem }

constructor TcxRadioGroupItem.Create(Collection: TCollection);
begin
  FValue := Null;
  inherited Create(Collection);
end;

procedure TcxRadioGroupItem.Assign(Source: TPersistent);
begin
  if Source is TcxRadioGroupItem then
    with TcxRadioGroupItem(Source) do
    begin
      Self.Caption := Caption;
      Self.Value := Value;
    end
  else
    inherited Assign(Source);
end;

function TcxRadioGroupItem.IsValueStored: Boolean;
begin
  Result := not VarIsNull(FValue);
end;

procedure TcxRadioGroupItem.SetCaption(const Value: TCaption);
begin
  if not InternalCompareString(Value, FCaption, True) then
  begin
    FCaption := Value;
    TcxRadioGroupItems(Collection).Changed;
  end;
end;

procedure TcxRadioGroupItem.SetValue(const Value: TcxEditValue);
begin
  if not InternalVarEqualsExact(Value, FValue) then
  begin
    FValue := Value;
    TcxRadioGroupItems(Collection).Changed;
  end;
end;

{ TcxRadioGroupItems }

procedure TcxRadioGroupItems.Update(Item: TCollectionItem);
begin
  with TcxCustomRadioGroupProperties(GetOwner) do
    Changed;
end;

function TcxRadioGroupItems.GetItem(Index: Integer): TcxRadioGroupItem;
begin
  Result := TcxRadioGroupItem(inherited Items[Index]);
end;

procedure TcxRadioGroupItems.SetItem(Index: Integer; Value: TcxRadioGroupItem);
begin
  inherited Items[Index] := Value;
end;

{ TcxRadioGroupStyle }

procedure TcxRadioGroupStyle.RestoreDefaults;
begin
  inherited RestoreDefaults;
  if Edit <> nil then
    TcxCustomEditAccess(Edit).ParentColor := True;
end;

function TcxRadioGroupStyle.DefaultColor: TColor;
begin
  if (Edit = nil) or not TcxCustomEditAccess(Edit).ParentColor or
      TcxCustomEditAccess(Edit).IsInplace then
    Result := inherited DefaultColor
  else
    Result := TcxCustomEditAccess(Edit).Color;
end;

{ TcxCustomRadioGroupProperties }

constructor TcxCustomRadioGroupProperties.Create(AOwner: TPersistent);
begin
  inherited Create(AOwner);
  FColumns := 1;
  FDefaultCaption := cxGetResourceString(@cxSRadioGroupDefaultCaption);
  FDefaultValue := Null;
  FItems := TcxRadioGroupItems.Create(Self, TcxRadioGroupItem);
end;

destructor TcxCustomRadioGroupProperties.Destroy;
begin
  FreeAndNil(FItems);
  inherited Destroy;
end;

procedure TcxCustomRadioGroupProperties.Assign(Source: TPersistent);
begin
  if Source is TcxCustomRadioGroupProperties then
  begin
    BeginUpdate;
    try
      inherited Assign(Source);
      with Source as TcxCustomRadioGroupProperties do
      begin
        Self.Alignment := Alignment;
        Self.Columns := Columns;
        Self.DefaultValue := DefaultValue;
        Self.Items := Items;
        Self.WordWrap := WordWrap;
      end;
    finally
      EndUpdate;
    end
  end
  else
    inherited Assign(Source);
end;

class function TcxCustomRadioGroupProperties.GetContainerClass: TcxContainerClass;
begin
  Result := TcxRadioGroup;
end;

function TcxCustomRadioGroupProperties.GetDisplayText(const AEditValue: TcxEditValue;
  AFullText: Boolean = False): WideString;
var
  ADisplayValue: TcxEditValue;
begin
  PrepareDisplayValue(AEditValue, ADisplayValue, False);
  if ADisplayValue = -1 then
    Result := FDefaultCaption
  else
    Result := FItems[ADisplayValue].FCaption;
end;

class function TcxCustomRadioGroupProperties.GetStyleClass: TcxContainerStyleClass;
begin
  Result := TcxRadioGroupStyle;
end;

function TcxCustomRadioGroupProperties.GetSupportedOperations: TcxEditSupportedOperations;
begin
  Result := [esoAlwaysHotTrack, esoAutoHeight, esoFiltering, esoHorzAlignment,
    esoSorting, esoSortingByDisplayText];
  if Items.Count > 0 then
    Include(Result, esoHotTrack);
end;

class function TcxCustomRadioGroupProperties.GetViewInfoClass: TcxContainerViewInfoClass;
begin
  Result := TcxCustomRadioGroupViewInfo;
end;

function TcxCustomRadioGroupProperties.IsResetEditClass: Boolean;
begin
  Result := True;
end;

procedure TcxCustomRadioGroupProperties.PrepareDisplayValue(const AEditValue:
  TcxEditValue; var DisplayValue: TcxEditValue; AEditFocused: Boolean);
var
  I: Integer;
  AIsNull: Boolean;
begin
  DisplayValue := -1;
  for I := 0 to Items.Count - 1 do
    with Items[I] do
    begin
      AIsNull := VarIsNull(Value);
      if AIsNull and InternalCompareString(Caption, VarToStr(AEditValue), True) or
        not AIsNull and VarEqualsExact(AEditValue, Value) then
      begin
        DisplayValue := I;
        Break;
      end;
    end;
end;

function TcxCustomRadioGroupProperties.CompareEditValue: Boolean;
begin
  Result := True;
end;

class function TcxCustomRadioGroupProperties.GetViewDataClass: TcxCustomEditViewDataClass;
begin
  Result := TcxCustomRadioGroupViewData;
end;

function TcxCustomRadioGroupProperties.HasDisplayValue: Boolean;
begin
  Result := True;
end;

function TcxCustomRadioGroupProperties.GetAlignment: TLeftRight;
begin
  if inherited Alignment.Horz = taRightJustify then
    Result := taRightJustify
  else
    Result := taLeftJustify;
end;

function TcxCustomRadioGroupProperties.IsDefaultCaptionStored: Boolean;
begin
  Result := not InternalCompareString(FDefaultCaption,
    cxGetResourceString(@cxSRadioGroupDefaultCaption), True);
end;

function TcxCustomRadioGroupProperties.IsDefaultValueStored: Boolean;
begin
  Result := not VarIsNull(FDefaultValue);
end;

procedure TcxCustomRadioGroupProperties.SetAlignment(Value: TLeftRight);
begin
  inherited Alignment.Horz := Value;
end;

procedure TcxCustomRadioGroupProperties.SetColumns(Value: Integer);
begin
  if Value < 1 then
    Value := 1;
  if Value <> FColumns then
  begin
    FColumns := Value;
    Changed;
  end;
end;

procedure TcxCustomRadioGroupProperties.SetDefaultValue(const Value: TcxEditValue);
begin
  if not InternalVarEqualsExact(Value, FDefaultValue) then
  begin
    FDefaultValue := Value;
    Changed;
  end;
end;

procedure TcxCustomRadioGroupProperties.SetItems(Value: TcxRadioGroupItems);
begin
  FItems.Assign(Value);
end;

procedure TcxCustomRadioGroupProperties.SetWordWrap(Value: Boolean);
begin
  if Value <> FWordWrap then
  begin
    FWordWrap := Value;
    Changed;
  end;
end;

{ TcxCustomRadioGroupButton }

constructor TcxCustomRadioGroupButton.Create(ARadioGroup: TcxCustomRadioGroup);
begin
  inherited Create(ARadioGroup);
  ARadioGroup.FButtons.Add(Self);
  Enabled := ARadioGroup.Enabled;
  ParentShowHint := False;
  Visible := ARadioGroup.Visible;
  OnClick := ARadioGroup.ButtonClick;
  Parent := ARadioGroup;
  LookAndFeel.MasterLookAndFeel := ARadioGroup.LookAndFeel;
  ParentColor := True;
end;

destructor TcxCustomRadioGroupButton.Destroy;
begin
  RadioGroup.FButtons.Remove(Self);
  inherited Destroy;
end;

procedure TcxCustomRadioGroupButton.DragDrop(Source: TObject; X, Y: Integer);
begin
  RadioGroup.DragDrop(Source, Left + X, Top + Y);
end;

function TcxCustomRadioGroupButton.ExecuteAction(Action: TBasicAction): Boolean;
begin
  Result := inherited ExecuteAction(Action) or
    TcxEditDataBindingAccess(RadioGroup.DataBinding).ExecuteAction(Action);
end;

function TcxCustomRadioGroupButton.UpdateAction(Action: TBasicAction): Boolean;
begin
  Result := inherited UpdateAction(Action) or
    TcxEditDataBindingAccess(RadioGroup.DataBinding).UpdateAction(Action);
end;

{$IFDEF DELPHI5}
function TcxCustomRadioGroupButton.CanFocus: Boolean;
begin
  Result := RadioGroup.CanFocusEx;
end;
{$ENDIF}

procedure TcxCustomRadioGroupButton.Click;
begin
{$IFNDEF VCL}
  with RadioGroup do
    if not DataBinding.Modified and not DoEditing then
      Exit;
{$ENDIF}
  inherited Click;
  with RadioGroup do
    if not IsLoading then
      RadioGroup.Click;
end;

function TcxCustomRadioGroupButton.DoMouseWheel(Shift: TShiftState; WheelDelta: Integer;
  {$IFNDEF VCL}const{$ENDIF} MousePos: TPoint): Boolean;
begin
  Result := False;
end;

procedure TcxCustomRadioGroupButton.CorrectTextRect(var R: TRect; ANativeStyle: Boolean);
const
  ATextRectCorrectionA: array [Boolean] of TRect = (
    (Left: 7; Top: 0; Right: 1; Bottom: 0),
    (Left: 7; Top: 0; Right: 0; Bottom: 0)
  );
begin
{$IFDEF LINUX}
  if not IsInplace then
    ExtendRect(R, ATextRectCorrectionA[WordWrap])
  else
{$ENDIF}
    inherited CorrectTextRect(R, ANativeStyle);
end;

procedure TcxCustomRadioGroupButton.DoEnter;
var
  AFocused: Boolean;
begin
  RadioGroup.LockChangeEvents(True);
  try
    RadioGroup.ShortRefreshContainer(False);
    AFocused := Focused;
    with RadioGroup do
      if not FInternalUpdating and (not AFocused or DoEditing) then
      begin
        KeyboardAction := AFocused;
        try
          ItemIndex := FButtons.IndexOf(Self);
        finally
          KeyboardAction := False;
        end;
        if AFocused and Properties.ImmediatePost and AutoPostEditValue and ValidateEdit(True) then
          PostEditValue;
    end;
  finally
    RadioGroup.LockChangeEvents(False);
  end;
end;

procedure TcxCustomRadioGroupButton.DoExit;
begin
  inherited DoExit;
  with RadioGroup do
  begin
    ShortRefreshContainer(False);
    if IsInplace then
      TcxCustomRadioGroupData(EditData).FocusedButton := FButtons.IndexOf(Self);
  end;
end;

procedure TcxCustomRadioGroupButton.DragOver(Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  RadioGroup.DragOver(Source, Left + X, Top + Y, State, Accept);
end;

function TcxCustomRadioGroupButton.GetPopupMenu: TPopupMenu;
begin
  Result := RadioGroup.GetPopupMenu;
end;

function TcxCustomRadioGroupButton.IsInplace: Boolean;
begin
  Result := RadioGroup.IsInplace;
end;

procedure TcxCustomRadioGroupButton.KeyDown(var Key: Word; Shift: TShiftState);
begin
  RadioGroup.KeyDown(Key, Shift);
  if Key <> 0 then
    inherited KeyDown(Key, Shift);
end;

procedure TcxCustomRadioGroupButton.KeyPress(var Key: Char);
begin
  RadioGroup.KeyPress(Key);
  if (Key in [#8, ' ']) and not RadioGroup.CanModify then
    Key := #0;
  if Key <> #0 then
    inherited KeyPress(Key);
end;

procedure TcxCustomRadioGroupButton.KeyUp(var Key: Word; Shift: TShiftState);
begin
  RadioGroup.KeyUp(Key, Shift);
  if Key <> 0 then
    inherited KeyUp(Key, Shift);
end;

procedure TcxCustomRadioGroupButton.MouseDown(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseDown(Button, Shift, X, Y);
  with RadioGroup do
  begin
    InnerControlMouseDown := True;
    try
      MouseDown(Button, Shift, X + Self.Left, Y + Self.Top);
    finally
      InnerControlMouseDown := False;
    end;
  end;
end;

procedure TcxCustomRadioGroupButton.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseMove(Shift, X, Y);
  RadioGroup.MouseMove(Shift, X + Left, Y + Top);
end;

procedure TcxCustomRadioGroupButton.MouseUp(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseUp(Button, Shift, X, Y);
  RadioGroup.MouseUp(Button, Shift, X + Left, Y + Top);
end;

{$IFDEF VCL}
procedure TcxCustomRadioGroupButton.WndProc(var Message: TMessage);
begin
  with Message do
    if ((Msg = WM_LBUTTONDOWN) or (Msg = WM_LBUTTONDBLCLK)) and
      (RadioGroup.DragMode = dmAutomatic) and not(csDesigning in RadioGroup.ComponentState) then
    begin
      RadioGroup.BeginAutoDrag;
      Exit;
    end;
  inherited WndProc(Message);
end;
{$ELSE}
function TcxCustomRadioGroupButton.EventFilter(Sender: QObjectH; Event: QEventH): Boolean;
begin
  if (QEvent_type(Event) = QEventType_MouseButtonRelease) and
      (ButtonStateToMouseButton(QMouseEvent_button(QMouseEventH(Event))) = mbLeft) and
      not RadioGroup.DoEditing then
    Result := True
  else
    Result := inherited EventFilter(Sender, Event);
end;

function TcxCustomRadioGroupButton.GetFocusRectCorrection: TRect;
const
  {$IFDEF WIN32}
  AFocusRectCorrection: TRect = (Left: -2; Top: -1; Right: -1; Bottom: 0);
  {$ENDIF}
  {$IFDEF LINUX}
  AFocusRectCorrection: TRect = (Left: -2; Top: -1; Right: -1; Bottom: 0);
  {$ENDIF}
begin
  Result := AFocusRectCorrection;
end;
{$ENDIF}

function TcxCustomRadioGroupButton.GetControlContainer: TcxContainer;
begin
  Result := RadioGroup;
end;

function TcxCustomRadioGroupButton.GetControl: TWinControl;
begin
  Result := Self;
end;

function TcxCustomRadioGroupButton.GetRadioGroup: TcxCustomRadioGroup;
begin
  Result := TcxCustomRadioGroup(Owner);
end;

{$IFDEF VCL}
procedure TcxCustomRadioGroupButton.WMGetDlgCode(var Message: TWMGetDlgCode);
begin
  inherited;
  if RadioGroup.IsInplace then
    with Message do
      Result := Result or DLGC_WANTARROWS;
end;

procedure TcxCustomRadioGroupButton.CNCommand(var Message: TWMCommand);
begin
  if FIsClickLocked then
    Exit;
  FIsClickLocked := True;
  try
    try
      if ((Message.NotifyCode = BN_CLICKED) or (Message.NotifyCode = BN_DOUBLECLICKED)) and
          RadioGroup.CanModify and RadioGroup.DoEditing then
        inherited;
    except
      Application.HandleException(Self);
    end;
  finally
    FIsClickLocked := False;
  end;
end;
{$ENDIF}

{ TcxCustomRadioGroup }

constructor TcxCustomRadioGroup.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FIsCreating := True;

  ControlStyle := [csCaptureMouse, csClickEvents,
    csSetCaption, csDoubleClicks, csReplicatable];
{$IFDEF VCL}
  TabStop := False;
{$ELSE}
  ControlStyle := ControlStyle + [csNoFocus];
{$ENDIF}
  FButtons := TList.Create;
  FItemIndex := -1;
  AutoSize := False;
  Width := 185;
  Height := 105;
  ParentColor := not IsInplace;
{$IFDEF VCL}
  FDrawingParentBackground := True;
  ParentBackground := True;
{$ENDIF}

  FIsCreating := False;
end;

destructor TcxCustomRadioGroup.Destroy;
begin
  SetButtonCount(0);
  FreeAndNil(FButtons);
  inherited Destroy;
end;

procedure TcxCustomRadioGroup.Activate(var AEditData: TcxCustomEditData);
begin
  inherited Activate(AEditData);
  with TcxCustomRadioGroupData(EditData) do
    if (FocusedButton >= 0) and (FocusedButton < Properties.Items.Count) and Buttons[FocusedButton].CanFocus then
      Buttons[FocusedButton].SetFocus;
end;

procedure TcxCustomRadioGroup.ActivateByMouse(Shift: TShiftState; X, Y: Integer;
  var AEditData: TcxCustomEditData);
var
  P: TPoint;
  AButtonIndex: Integer;
{$IFNDEF VCL}
  AMouseEvent: QMouseEventH;
{$ENDIF}
begin
  Activate(AEditData);
  P := Parent.ClientToScreen(Point(X, Y));
  P := ScreenToClient(P);
  AButtonIndex := GetButtonIndexAt(P);
  if AButtonIndex <> -1 then
  begin
    with ViewInfo.ButtonsInfo[AButtonIndex].Bounds do
    begin
      P.X := (Right - Left) div 2;
      P.Y := (Bottom - Top) div 2;
    end;
{$IFDEF VCL}
    if ssLeft in Shift then
      SendMessage(Buttons[AButtonIndex].Handle, WM_LBUTTONDOWN,
        ShiftStateToKeys(Shift), P.Y shl 16 + P.X)
    else
      SendMessage(Buttons[AButtonIndex].Handle, WM_LBUTTONUP,
        ShiftStateToKeys(Shift), P.Y shl 16 + P.X);
{$ELSE}
    AMouseEvent := QMouseEvent_create(QEventType_MouseButtonPress, @P, Integer(ButtonState_LeftButton),
      ShiftStateToButtonState(Shift));
    QApplication_sendEvent(Buttons[AButtonIndex].Handle, AMouseEvent);
{$ENDIF}
  end;
end;

procedure TcxCustomRadioGroup.Clear;
begin
  ItemIndex := -1;
end;

function TcxCustomRadioGroup.Focused: Boolean;
var
  I: Integer;
begin
  Result := inherited Focused;
  if not Result then
    for I := 0 to FButtons.Count - 1 do
      if TcxCustomRadioGroupButton(FButtons[I]).Focused then
      begin
        Result := True;
        Break;
      end;
end;

procedure TcxCustomRadioGroup.FlipChildren(AllLevels: Boolean);
begin
end;

class function TcxCustomRadioGroup.GetPropertiesClass: TcxCustomEditPropertiesClass;
begin
  Result := TcxRadioGroupProperties;
end;

procedure TcxCustomRadioGroup.GetTabOrderList(List: TList);
var
  I: Integer;
begin
  for I := 0 to FButtons.Count - 1 do
    List.Add(FButtons[I]);
end;

procedure TcxCustomRadioGroup.PrepareEditValue(const ADisplayValue: TcxEditValue;
  out EditValue: TcxEditValue; AEditFocused: Boolean);
begin
  if ADisplayValue = -1 then
    EditValue := Properties.DefaultValue
  else
  begin
    EditValue := Properties.Items[ADisplayValue].Value;
    if VarIsNull(EditValue) then
      EditValue := Properties.Items[ADisplayValue].Caption;
  end;
end;

procedure TcxCustomRadioGroup.ContainerStyleChanged(Sender: TObject);
begin
  inherited ContainerStyleChanged(Sender);
  if not FIsCreating then
    UpdateButtons;
end;

procedure TcxCustomRadioGroup.CursorChanged;
var
  I: Integer;
begin
  inherited CursorChanged;
  for I := 0 to FButtons.Count - 1 do
    Buttons[I].Cursor := Cursor;
end;

procedure TcxCustomRadioGroup.DefineProperties(Filer: TFiler);
begin
  inherited DefineProperties(Filer);
  Filer.DefineProperty('Caption', ReadCaption, WriteCaption, FIsCaptionAssigned);
end;

procedure TcxCustomRadioGroup.DoEditKeyDown(var Key: Word; Shift: TShiftState);

  function GetFocusedButtonIndex: Integer;
  var
    I: Integer;
  begin
    Result := -1;
    for I := 0 to Properties.Items.Count - 1 do
      if Buttons[I].Focused then
      begin
        Result := I;
        Break;
      end;
  end;

  procedure FocusButton(AButtonIndex: Integer);
  begin
{$IFDEF VCL}
    PostMessage(Handle, CM_FOCUSRADIOBUTTON, AButtonIndex, 0);
{$ELSE}
    QApplication_postEvent(Handle,
      QCustomEvent_create(QEventType(QEventType_CMFocusRadioButton),
        Pointer(AButtonIndex)));
{$ENDIF}
  end;

var
  AButtonsInColumn, AButtonsPerColumn: Integer;
  AButtonIndex: Integer;
  AFocusedButtonIndex: Integer;
  AColumn, ARow: Integer;
begin
  AFocusedButtonIndex := GetFocusedButtonIndex;
  if AFocusedButtonIndex = -1 then
    Exit;
  AButtonsPerColumn := GetButtonsPerColumn(Properties);
  AButtonsInColumn := AButtonsPerColumn;
  AColumn := Buttons[AFocusedButtonIndex].Column;
  ARow := Buttons[AFocusedButtonIndex].Row;
  if AFocusedButtonIndex - ARow + AButtonsInColumn - 1 >= Properties.Items.Count then
    AButtonsInColumn := Properties.Items.Count - (AFocusedButtonIndex - ARow);
  case Key of
    VK_DOWN:
      if ARow < AButtonsInColumn - 1 then
      begin
        Buttons[AFocusedButtonIndex + 1].SetFocus;
        Key := 0;
      end else
      begin
        AButtonIndex := AFocusedButtonIndex - ARow;
        TcxCustomRadioGroupData(EditData).FocusedButton := AButtonIndex;
        FocusButton(AButtonIndex);
      end;
    VK_LEFT:
      if AColumn > 0 then
      begin
        Buttons[AFocusedButtonIndex - AButtonsPerColumn].SetFocus;
        Key := 0;
      end;
    VK_RIGHT:
      if AColumn < Properties.Columns - 1 then
      begin
        Buttons[AFocusedButtonIndex + AButtonsPerColumn].SetFocus;
        Key := 0;
      end;
    VK_UP:
      if ARow > 0 then
      begin
        Buttons[AFocusedButtonIndex - 1].SetFocus;
        Key := 0;
      end else
      begin
        AButtonIndex := AFocusedButtonIndex - ARow + AButtonsInColumn - 1;
        TcxCustomRadioGroupData(EditData).FocusedButton := AButtonIndex;
        FocusButton(AButtonIndex);
      end;
  end;
  inherited DoEditKeyDown(Key, Shift);
end;

procedure TcxCustomRadioGroup.EnabledChanged;
var
  I: Integer;
begin
  inherited EnabledChanged;
  for I := 0 to FButtons.Count - 1 do
    TcxCustomRadioGroupButton(FButtons[I]).Enabled := Enabled;
end;

procedure TcxCustomRadioGroup.GetChildren(Proc: TGetChildProc; Root: TComponent);
begin
end;

function TcxCustomRadioGroup.GetEditDataClass: TcxCustomEditDataClass;
begin
  Result := TcxCustomRadioGroupData;
end;

procedure TcxCustomRadioGroup.InitializeEditData;
begin
  TcxCustomRadioGroupData(EditData).FocusedButton := 0;
end;

procedure TcxCustomRadioGroup.InternalSetEditValue(const Value: TcxEditValue;
  AValidateEditValue: Boolean);
var
  ADisplayValue: TcxEditValue;
  APrevItemIndex: Integer;
begin
  APrevItemIndex := FItemIndex;
  inherited InternalSetEditValue(Value, AValidateEditValue);
  Properties.PrepareDisplayValue(Value, ADisplayValue, InternalFocused);
  FItemIndex := ADisplayValue;
  if APrevItemIndex <> FItemIndex then
  begin
    if APrevItemIndex >= 0 then
      TcxCustomRadioGroupButton(FButtons[APrevItemIndex]).Checked := False;
    if FItemIndex >= 0 then
      with TcxCustomRadioGroupButton(FButtons[FItemIndex]) do
      begin
        ClicksDisabled := True;
        try
          Checked := True;
        finally
          ClicksDisabled := False;
        end
      end;
    ViewInfo.ItemIndex := ItemIndex;
    if FItemIndex >= 0 then
      Click;
    DoChange;
  end;
  ShortRefreshContainer(False);
end;

function TcxCustomRadioGroup.IsInternalControl(AControl: TControl): Boolean;
var
  I: Integer;
begin
  Result := AControl <> nil;
  if Result then
  begin
    Result := inherited IsInternalControl(AControl);
    if not Result then
      for I := 0 to FButtons.Count - 1 do
        if AControl = FButtons[I] then
        begin
          Result := True;
          Exit;
        end;
  end;
end;

procedure TcxCustomRadioGroup.Loaded;
begin
  inherited Loaded;
  ItemIndex := FItemIndex;
end;

procedure TcxCustomRadioGroup.Paint;

{$IFDEF VCL}
  procedure SynchronizeButtonsParentBackground;
  var
    I: Integer;
  begin
    if ParentBackground = FDrawingParentBackground then
      Exit;
    FDrawingParentBackground := ParentBackground;
    for I := 0 to FButtons.Count - 1 do
      Buttons[I].ParentBackground := FDrawingParentBackground;
  end;

  procedure InternalNativePaint;
  var
    ABodyRect, AControlRect, R, R1: TRect;
    ACaptionSize: TSize;
    ANativeState: Integer;
    ARgn: TcxRegion;
    ATheme: TTheme;
  begin
    with Canvas do
    begin
      Font := Style.Font;
      if Caption = '' then
        FillChar(R, SizeOf(R), 0)
      else
      begin
        GetTextExtentPoint32(Handle, PChar(Caption),
          Length(Caption), ACaptionSize);
        R := Rect(0, 0, ACaptionSize.cx, ACaptionSize.cy);
        if UseRightToLeftAlignment then
          OffsetRect(R, Width - 8 - R.Right, 0)
        else
          OffsetRect(R, 8, 0);
      end;

      ABodyRect := ClientRect;
      ABodyRect.Top := TextHeight('Qq'){(R.Bottom - R.Top)} div 2;
      ARgn := GetClipRegion;
      AControlRect := GetControlRect(Self);
      ATheme := OpenTheme(totButton);
      if Enabled then
        ANativeState := GBS_NORMAL
      else
        ANativeState := GBS_DISABLED;

      R1 := GetControlRect(Self);
      if ParentBackground and IsThemeBackgroundPartiallyTransparent(ATheme, BP_GROUPBOX, ANativeState) then
        DrawThemeParentBackground(Handle, Canvas.Handle, @R1)
      else
        cxEditFillRect(Canvas.Handle, R1, GetSolidBrush(Canvas, Style.Color));
      ExcludeClipRect(R);
      DrawThemeBackground(ATheme, Canvas.Handle, BP_GROUPBOX, ANativeState, @ABodyRect);
      SetClipRegion(ARgn, roSet);

      if fsBold in Canvas.Font.Style then
        Canvas.Font.Style := Canvas.Font.Style - [fsBold]
      else
        Canvas.Font.Style := Canvas.Font.Style + [fsBold];
      if fsBold in Canvas.Font.Style then
        Canvas.Font.Style := Canvas.Font.Style - [fsBold]
      else
        Canvas.Font.Style := Canvas.Font.Style + [fsBold];

      if Caption <> '' then
        DrawThemeText(ATheme, Canvas.Handle, BP_GROUPBOX, ANativeState,
          PWideChar(WideString(Caption)), Length(Caption), DT_LEFT, 0, @R);
      Brush.Style := bsSolid;
    end;
  end;
{$ENDIF}

  procedure DrawFrame(var R: TRect);
  var
    ABrush: TBrushHandle;
  begin
    ABrush := GetSolidBrush(Canvas, ViewInfo.BackgroundColor);
    with Canvas do
    begin
      case ViewInfo.BorderStyle of
        ebsSingle:
          begin
            FrameRect(R, ViewInfo.BorderColor, 1, Style.Edges);
            if not(bTop in Style.Edges) then
              cxEditFillRect(Handle, Rect(R.Left, R.Top, R.Right, R.Top + 1), ABrush);
            InflateRect(R, -1, -1);
          end;
        ebsThick:
          begin
            FrameRect(R, ViewInfo.BorderColor, 2, Style.Edges);
            if not(bTop in Style.Edges) then
              cxEditFillRect(Handle, Rect(R.Left, R.Top, R.Right, R.Top + 2), ABrush);
            InflateRect(R, -2, -2);
          end;
        ebsFlat:
          begin
            FrameRect(R, clBtnShadow, 1, Style.Edges);
            InflateRect(R, -1, -1);
            FrameRect(R, clBtnHighlight, 1, Style.Edges);
            InflateRect(R, -1, -1);
            if not(bTop in Style.Edges) then
              cxEditFillRect(Handle, Rect(R.Left - 2, R.Top - 2, R.Right + 2, R.Top), ABrush);
          end;
        ebs3D:
          begin
{$IFDEF VCL}
            if Ctl3D then
            begin
              Inc(R.Left);
              Inc(R.Top);
              FrameRect(R, clBtnHighlight, 1, Style.Edges);
              OffsetRect(R, -1, -1);
              FrameRect(R, clBtnShadow, 1, Style.Edges);
              Brush.Color := ViewInfo.BackgroundColor;
              FillRect(Rect(R.Left, R.Bottom, R.Left + 1, R.Bottom + 1));
              FillRect(Rect(R.Right, R.Top, R.Right + 1, R.Top + 1));
              Inc(R.Left);
              Inc(R.Top);
              if not(bTop in Style.Edges) then
                cxEditFillRect(Handle, Rect(R.Left - 1, R.Top - 1, R.Right + 1, R.Top + 1), ABrush);
            end
            else
            begin
              FrameRect(R, clWindowFrame, 1, Style.Edges);
              if not(bTop in Style.Edges) then
                cxEditFillRect(Handle, Rect(R.Left, R.Top, R.Right, R.Top + 2), ABrush);
            end;
            InflateRect(R, -1, -1);
{$ELSE}
            Dec(R.Right);
            Dec(R.Bottom);
            FrameRect(R, clBtnShadow, 1, Style.Edges);
            OffsetRect(R, 1, 1);
            FrameRect(R, clBtnHighlight, 1, Style.Edges);
            Brush.Color := clBtnShadow;
            FillRect(Rect(R.Left - 1, R.Bottom - 1, R.Left, R.Bottom));
            FillRect(Rect(R.Right - 1, R.Top - 1, R.Right, R.Top));
            Dec(R.Right);
            Dec(R.Bottom);
            InflateRect(R, -1, -1);
            if not(bTop in Style.Edges) then
              cxEditFillRect(Handle, Rect(R.Left - 2, R.Top - 2, R.Right + 2, R.Top), ABrush);
{$ENDIF}
          end;
      end;
    end;
  end;

  procedure InternalPaint;
  const
    ACaptionRectLeftBound = {$IFDEF VCL}8{$ELSE}{$IFDEF WIN32}11{$ENDIF}{$IFDEF LINUX}12{$ENDIF}{$ENDIF};
  var
    R, ABorderRect: TRect;
    ABorderWidth: Integer;
    AFlags: Longint;
    ATextHeight: Integer;
  begin
    with Canvas do
    begin
      Font := Style.Font;
      ATextHeight := TextHeight('Qq');
      R := ViewInfo.BorderRect;
      ABorderWidth := GetEditBorderWidth(ViewInfo.BorderStyle);
      InflateRect(R, ABorderWidth, ABorderWidth);
      if ViewInfo.Shadow then
      begin
        Brush.Color := TWinControlAccess(Parent).Color;
        FillRect(Rect(R.Right, 0, R.Right + cxEditShadowWidth,
          R.Top + cxEditShadowWidth));
        DrawContainerShadow(Self.Canvas, R);
      end;
      ABorderRect := R;
{$IFNDEF VCL}
      if Caption = '' then
        R.Top := cxEditMaxBorderWidth - ABorderWidth
      else
{$ENDIF}
        R.Top := ATextHeight div 2{$IFDEF VCL} - 1{$ENDIF} + cxEditMaxBorderWidth - ABorderWidth;
      Brush.Color := ViewInfo.BackgroundColor;
      with ABorderRect do
        FillRect(Rect(Left, 0, Right, R.Top));
      DrawFrame(R);
      Brush.Color := ViewInfo.BackgroundColor;
      FillRect(R);
      if Caption <> '' then
      begin
{$IFDEF VCL}
        if UseRightToLeftAlignment then
          R := Rect(R.Right - TextWidth(Caption) - 8, 0, 0, ATextHeight)
        else
{$ENDIF}
          R := Rect(ACaptionRectLeftBound, 0, 0, ATextHeight);
        Font.Color := ViewInfo.TextColor;
{$IFDEF VCL}
        AFlags := DrawTextBiDiModeFlags(DT_SINGLELINE);
        Windows.DrawText(Handle, PChar(Caption), Length(Caption),
          R, AFlags or DT_CALCRECT);
        Brush.Color := ViewInfo.BackgroundColor;
        Windows.DrawText(Handle, PChar(Caption), Length(Caption),
          R, AFlags);
{$ELSE}
        R.Right := MaxInt;
        AFlags := cxAlignLeft or cxAlignTop or cxSingleLine or cxShowPrefix;
        TextExtent(Caption, R, AFlags);
  {$IFDEF WIN32}
        Inc(R.Right, 3);
  {$ENDIF}
  {$IFDEF LINUX}
        Inc(R.Right, 4);
  {$ENDIF}
        Brush.Color := ViewInfo.BackgroundColor;
        FillRect(R);
        DrawText(Caption, R, AFlags);
        R.Right := 12;
        R.Left := 8;
        FillRect(R);
{$ENDIF}
      end;
    end;
  end;

begin
{$IFNDEF VCL}
  Canvas.Canvas.Start;
  try
{$ENDIF}

    if IsInplace then
    begin
      cxEditFillRect(Canvas.Handle, ViewInfo.Bounds, GetSolidBrush(Canvas,
        ViewInfo.BackgroundColor));
      Exit;
    end;

{$IFDEF VCL}
    SynchronizeButtonsParentBackground;
    if AreVisualStylesMustBeUsed(LookAndFeel.NativeStyle, totButton) then
      InternalNativePaint
    else
{$ENDIF}
      InternalPaint;

{$IFNDEF VCL}
  finally
    Canvas.Canvas.Stop;
  end;
{$ENDIF}
end;

procedure TcxCustomRadioGroup.PropertiesChanged(Sender: TObject);
begin
  if not(csReading in ComponentState) then
    UpdateButtons;
  inherited PropertiesChanged(Sender);
end;

procedure TcxCustomRadioGroup.ReadState(Reader: TReader);
begin
  inherited ReadState(Reader);
  UpdateButtons;
end;

function TcxCustomRadioGroup.RefreshContainer(const P: TPoint;
  Button: TcxMouseButton; Shift: TShiftState; AIsMouseEvent: Boolean): Boolean;
begin
  Result := inherited RefreshContainer(P, Button, Shift, AIsMouseEvent);
  ArrangeButtons;
end;

procedure TcxCustomRadioGroup.SetDragMode(Value: TDragMode);
var
  I: Integer;
begin
  inherited SetDragMode(Value);
  for I := 0 to Properties.Items.Count - 1 do
    Buttons[I].DragMode := Value;
end;

procedure TcxCustomRadioGroup.SetName(const Value: TComponentName);
begin
  inherited SetName(Value);
  if not FIsCaptionAssigned then
  begin
    Caption := Value;
    FIsCaptionAssigned := False;
  end;
end;

procedure TcxCustomRadioGroup.SetSize;
begin
end;

function TcxCustomRadioGroup.TabsNeeded: Boolean;
begin
  Result := False;
end;

{$IFDEF VCL}
procedure TcxCustomRadioGroup.CreateHandle;
begin
  inherited CreateHandle;
  UpdateButtons;
end;

procedure TcxCustomRadioGroup.Resize;
begin
  inherited Resize;
  if IsDesigning and not IsInplace and ParentBackground and
      AreVisualStylesMustBeUsed(Style.LookAndFeel.NativeStyle, totButton) then
    InvalidateRect(GetControlRect(Self), True);
end;

procedure TcxCustomRadioGroup.SetDragKind(Value: TDragKind);
var
  I: Integer;
begin
  inherited SetDragKind(Value);
  for I := 0 to Properties.Items.Count - 1 do
    Buttons[I].DragKind := Value;
end;
{$ELSE}
function TcxCustomRadioGroup.CanFocusOnClick: Boolean;
begin
  Result := False;
end;

function TcxCustomRadioGroup.EventFilter(Sender: QObjectH; Event: QEventH): Boolean;
var
  AButtonIndex: Integer;
begin
  if QEvent_type(Event) = QEventType(QEventType_CMFocusRadioButton) then
  begin
    Result := True;
    AButtonIndex := Integer(QCustomEvent_data(QCustomEventH(Event)));
    if (AButtonIndex >= 0) and (AButtonIndex < Properties.Items.Count) then
      Buttons[AButtonIndex].SetFocus;
    Exit;
  end
  else
    Result := inherited EventFilter(Sender, Event);
end;

function TcxCustomRadioGroup.HasBackground: Boolean;
begin
  Result := False;
end;

procedure TcxCustomRadioGroup.InitWidget;
begin
  inherited InitWidget;
  UpdateButtons;
end;
{$ENDIF}

procedure TcxCustomRadioGroup.ArrangeButtons;
var
  AButtonViewInfo: TcxRadioGroupButtonViewInfo;
  I: Integer;
  R: TRect;
begin
  for I := 0 to FButtons.Count - 1 do
    with TcxCustomRadioGroupButton(FButtons[I]) do
    begin
{$IFDEF VCL}
      BiDiMode := Self.BiDiMode;
      ParentBackground := Self.ParentBackground;
{$ENDIF}
      AButtonViewInfo := TcxRadioGroupButtonViewInfo(ViewInfo.ButtonsInfo[I]);
      R := AButtonViewInfo.Bounds;
      FColumn := AButtonViewInfo.Column;
      FRow := AButtonViewInfo.Row;
      SetBounds(R.Left, R.Top, R.Right - R.Left, R.Bottom - R.Top);
      Color := ViewInfo.BackgroundColor;
      Cursor := Self.Cursor;
      Visible := True;
    end;
end;

procedure TcxCustomRadioGroup.ButtonClick(Sender: TObject);
begin
end;

function TcxCustomRadioGroup.GetButtonIndexAt(const P: TPoint): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to Properties.Items.Count - 1 do
    if PtInRect(ViewInfo.ButtonsInfo[I].Bounds, P) then
    begin
      Result := I;
      Break;
    end;
end;

function TcxCustomRadioGroup.GetButtonClass: TcxCustomRadioGroupButtonClass;
begin
  Result := TcxCustomRadioGroupButton;
end;

procedure TcxCustomRadioGroup.UpdateButtons;
const
  ALookAndFeelKindMap: array [TcxEditButtonStyle] of TcxLookAndFeelKind =
    (lfStandard, lfStandard, lfFlat, lfStandard, lfStandard, lfUltraFlat);
var
  I: Integer;
begin
  SetButtonCount(Properties.FItems.Count);
  ShortRefreshContainer(False);
  for I := 0 to FButtons.Count - 1 do
    with TcxCustomRadioGroupButton(FButtons[I]) do
    begin
      Caption := Properties.FItems[I].Caption;
      if Length(ViewInfo.ButtonsInfo) > 0 then
        LookAndFeel.Kind := ALookAndFeelKindMap[ViewInfo.ButtonsInfo[0].Data.Style];
      WordWrap := Properties.WordWrap;
    end;
  if ItemIndex >= 0 then
  begin
    FInternalUpdating := True;
    TcxCustomRadioGroupButton(FButtons[ItemIndex]).Checked := True;
    FInternalUpdating := False;
  end;
end;

function TcxCustomRadioGroup.GetButton(Index: Integer): TcxRadioButton;
begin
  Result := TcxRadioButton(FButtons[Index]);
end;

function TcxCustomRadioGroup.GetProperties: TcxRadioGroupProperties;
begin
  Result := TcxRadioGroupProperties(InternalGetProperties);
end;

function TcxCustomRadioGroup.GetViewInfo: TcxCustomRadioGroupViewInfo;
begin
  Result := TcxCustomRadioGroupViewInfo(FViewInfo);
end;

procedure TcxCustomRadioGroup.ReadCaption(Reader: TReader);
begin
{$IFDEF VCL}
  Caption := Reader.ReadString;
{$ELSE}
  Caption := Reader.ReadWideString;
{$ENDIF}
end;

procedure TcxCustomRadioGroup.SetButtonCount(Value: Integer);
begin
  if Value <> FButtons.Count then
    if Value < FButtons.Count then
      while FButtons.Count > Value do
        TcxCustomRadioGroupButton(FButtons.Last).Free
    else
      while FButtons.Count < Value do
        GetButtonClass.Create(Self);
end;

procedure TcxCustomRadioGroup.SetCaption(Value: TCaption);
begin
  FIsCaptionAssigned := True;
  if not InternalCompareString(Value, FCaption, True) then
  begin
    FCaption := Value;
    PropertiesChanged(Properties);
  end;
end;

procedure TcxCustomRadioGroup.SetItemIndex(Value: Integer);
var
  AEditValue: TcxEditValue;
begin
  if csReading in ComponentState then
    FItemIndex := Value
  else
  begin
    if Value < -1 then
      Value := -1
    else if Value >= FButtons.Count then
      Value := FButtons.Count - 1;
    if FItemIndex <> Value then
    begin
      if (FItemIndex <> Value) and (FItemIndex >= 0) then
        TcxCustomRadioGroupButton(FButtons[FItemIndex]).Checked := False;
      PrepareEditValue(Value, AEditValue, InternalFocused);
      EditValue := AEditValue;
      FItemIndex := Value;
      if Value >= 0 then
        TcxCustomRadioGroupButton(FButtons[FItemIndex]).Checked := True;
    end
    else
      if not KeyboardAction then
        EditModified := False;
  end;
end;

procedure TcxCustomRadioGroup.SetProperties(Value: TcxRadioGroupProperties);
begin
  FProperties.Assign(Value);
end;

procedure TcxCustomRadioGroup.WriteCaption(Writer: TWriter);
begin
{$IFDEF VCL}
  Writer.WriteString(Caption);
{$ELSE}
  Writer.WriteWideString(Caption);
{$ENDIF}
end;

{$IFDEF VCL}
  {$IFNDEF DELPHI7}
procedure TcxCustomRadioGroup.SetParentBackground(Value: Boolean);
begin
  if Value <> FParentBackground then
  begin
    FParentBackground := Value;
    Invalidate;
  end;
end;
  {$ENDIF}

procedure TcxCustomRadioGroup.WMEraseBkgnd(var Message: TWMEraseBkgnd);
var
  ANativeState: Integer;
  ATheme: TTheme;
  I: Integer;
  R: TRect;
begin
  Message.Result := 1;
  if not(not IsInplace and ParentBackground and
      AreVisualStylesMustBeUsed(Style.LookAndFeel.NativeStyle, totButton)) then
    Exit;

  ATheme := OpenTheme(totButton);
  if Enabled then
    ANativeState := GBS_NORMAL
  else
    ANativeState := GBS_DISABLED;
  R := GetControlRect(Self);
  if IsThemeBackgroundPartiallyTransparent(ATheme, BP_GROUPBOX, ANativeState) then
    DrawThemeParentBackground(Handle, Message.DC, @R);

  for I := 0 to FButtons.Count - 1 do
    if Message.DC = Buttons[I].Canvas.Handle then
    begin
      DrawThemeBackground(ATheme, Message.DC, BP_GROUPBOX, ANativeState, @R);
      Break;
    end;
end;

procedure TcxCustomRadioGroup.CMDialogChar(var Message: TCMDialogChar);
begin
  with Message do
    if IsAccel(CharCode, Caption) and CanFocus then
    begin
      SelectFirst;
      Result := 1;
    end else
      inherited;
end;

procedure TcxCustomRadioGroup.CMCtl3DChanged(var Message: TMessage);
begin
  inherited;
  ShortRefreshContainer(False);
end;

procedure TcxCustomRadioGroup.CMFocusRadioButton(var Message: TMessage);
var
  AButtonIndex: Integer;
begin
  AButtonIndex := Message.WParam;
  with Properties.Items do
    if (AButtonIndex >= 0) and (AButtonIndex < Count) and Buttons[AButtonIndex].CanFocus then
      Buttons[AButtonIndex].SetFocus;
end;
{$ENDIF}

initialization
  CalculateRadioButtonSize;
  PrepareRadioButtonPattern;
  FRadioButtonImageList := TcxRadioButtonImageList.Create;
  FColorChangeEventReceiver := TcxRadioButtonColorChangeEventReceiver.Create;
  GetRegisteredEditProperties.Register(TcxRadioGroupProperties, scxSEditRepositoryRadioGroupItem);

finalization
  FreeAndNil(FColorChangeEventReceiver);
  FreeAndNil(FRadioButtonImageList);

end.
