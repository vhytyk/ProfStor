
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

unit cxTextEdit;

{$I cxEdVer.inc}

interface

uses
{$IFDEF WIN32}
  Windows, Messages,
{$ENDIF}
{$IFDEF DELPHI6}
  Variants,
{$ENDIF}
{$IFNDEF VCL}
  Types, Qt, QTypes,
{$ENDIF}
  Classes, Clipbrd, Controls, Forms, Graphics, Menus, StdCtrls, SysUtils, cxClasses,
  cxContainer, cxControls, cxDataUtils, cxEdit, cxEditTextUtils, cxGraphics,
  cxVariants;

const
  cxEditDefaultDropDownPageRowCount = 8;
  ekValueOutOfBounds = 1;

type
  TcxEditScrollCause = (escKeyboard, escMouseWheel);

  TcxCustomTextEdit = class;

  IcxInnerTextEdit = interface(IcxCustomInnerEdit)
  ['{263EBB8D-1EA9-4CAC-8367-ADD74D2A9651}']
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
    procedure SetSelLength(Value: Integer);
    procedure SetSelStart(Value: Integer);
    procedure SetSelText(Value: TCaption);
    property Alignment: TAlignment read GetAlignment write SetAlignment;
    property AutoSelect: Boolean read GetAutoSelect write SetAutoSelect;
    property CharCase: TEditCharCase read GetCharCase write SetCharCase;
    property EchoMode: TcxEditEchoMode read GetEchoMode write SetEchoMode;
    property HideSelection: Boolean read GetHideSelection write SetHideSelection;
    property ImeLastChar: Char read GetImeLastChar;
    property InternalUpdating: Boolean read GetInternalUpdating write SetInternalUpdating;
    property MaxLength: Integer read GetMaxLength write SetMaxLength;
    property MultiLine: Boolean read GetMultiLine;
{$IFDEF VCL}
    property OEMConvert: Boolean read GetOEMConvert write SetOEMConvert;
{$ENDIF}
    property SelLength: Integer read GetSelLength write SetSelLength;
    property SelStart: Integer read GetSelStart write SetSelStart;
    property SelText: TCaption read GetSelText write SetSelText;
  end;

  { TcxCustomInnerTextEditHelper }

  TcxCustomInnerTextEdit = class;

  TcxCustomInnerTextEditHelper = class
  private
    FEdit: TcxCustomInnerTextEdit;
  {$IFDEF VCL}
    FSelLength: Integer;
    FSelStart: Integer;
  {$ENDIF}
  protected
    property Edit: TcxCustomInnerTextEdit read FEdit;
  public
    constructor Create(AEdit: TcxCustomInnerTextEdit); virtual;

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

  { TcxCustomInnerTextEdit }

  TcxCustomInnerTextEditPrevState = record
    PrevText: TCaption;
    PrevSelLength, PrevSelStart: Integer;
  end;

  TcxCustomInnerTextEdit = class(TCustomEdit, IcxContainerInnerControl, IcxCustomInnerEdit,
    IcxInnerTextEdit)
  private
    FEchoMode: TcxEditEchoMode;
    FHelper: TcxCustomInnerTextEditHelper;
    FInternalUpdating: Boolean;
    FIsCreating: Boolean;
    FLockBoundsCount: Integer;
{$IFDEF VCL}
    FAlignment: TAlignment;
    FImeCharCount: Integer;
    FImeLastChar: Char;
{$ENDIF}
    function GetContainer: TcxCustomTextEdit;
    function GetCursorPos: Integer;
    procedure UpdateEchoMode;
{$IFDEF VCL}
    procedure WMChar(var Message: TWMChar); message WM_CHAR;
    procedure WMClear(var Message); message WM_CLEAR;
  {$IFDEF DELPHI5}
    procedure WMContextMenu(var Message: TWMContextMenu); message WM_CONTEXTMENU;
  {$ELSE}
    procedure WMRButtonUp(var Message: TWMRButtonUp); message WM_RBUTTONUP;
  {$ENDIF}
    procedure WMCut(var Message); message WM_CUT;
    procedure WMEraseBkgnd(var Message: TWMEraseBkgnd); message WM_ERASEBKGND;
    procedure WMGetDlgCode(var Message: TWMGetDlgCode); message WM_GETDLGCODE;
    procedure WMIMEChar(var Message: TMessage); message WM_IME_CHAR;
    procedure WMKeyDown(var Message: TWMKeyDown); message WM_KEYDOWN;
    procedure WMKillFocus(var Message: TWMKillFocus); message WM_KILLFOCUS;
    procedure WMNCPaint(var Message: TMessage); message WM_NCPAINT;
    procedure WMPaste(var Message: TMessage); message WM_PASTE;
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SETFOCUS;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
{$ENDIF}
  protected
    procedure Click; override;
    procedure DblClick; override;
    function DoMouseWheel(Shift: TShiftState; WheelDelta: Integer;
      {$IFNDEF VCL}const{$ENDIF} MousePos: TPoint): Boolean; override;
    procedure DragOver(Source: TObject; X, Y: Integer; State: TDragState;
      var Accept: Boolean); override;
    function GetPopupMenu: TPopupMenu; override;
    function GetText: TCaption; {$IFDEF VCL}virtual;{$ELSE}override;{$ENDIF}
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure KeyUp(var Key: Word; Shift: TShiftState); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseEnter(AControl: TControl); {$IFDEF VCL}dynamic{$ELSE}override{$ENDIF};
    procedure MouseLeave(AControl: TControl); {$IFDEF VCL}dynamic{$ELSE}override{$ENDIF};
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure SetText(const Value: TCaption); {$IFDEF VCL}virtual;{$ELSE}override;{$ENDIF}
{$IFDEF VCL}
    procedure CreateHandle; override;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure WndProc(var Message: TMessage); override;
    procedure AdjustMargins; virtual;
{$ELSE}
    procedure ChangeBounds(ALeft, ATop, AWidth, AHeight: Integer); override;
    procedure CreateWidget; override;
    function EventFilter(Sender: QObjectH; Event: QEventH): Boolean; override;
    procedure InitWidget; override;
{$ENDIF}
    property Container: TcxCustomTextEdit read GetContainer;
    property CursorPos: Integer read GetCursorPos;
    property Helper: TcxCustomInnerTextEditHelper read FHelper implements IcxContainerInnerControl,
      IcxCustomInnerEdit, IcxInnerTextEdit;
    property Text: TCaption read GetText write SetText;
{$IFDEF VCL}
    property Alignment: TAlignment read FAlignment;
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
{$ELSE}
    procedure CutToClipboard; override;
    procedure PasteFromClipboard; override;
{$ENDIF}
  end;

  { TcxTextEditPropertiesValues }

  TcxTextEditPropertiesValues = class(TcxCustomEditPropertiesValues)
  public
    MaxLength: Boolean;
    MaxValue: Boolean;
    MinValue: Boolean;
    procedure Assign(Source: TPersistent); override;
    procedure Reset; override;
  end;

  { TcxCustomEditListBox }

  TcxCustomEditListBox = class(TcxCustomInnerListBox)
  private
    FHotTrack: Boolean;
{$IFNDEF VCL}
    FScrollWidth: Integer;
{$ENDIF}
    FOnSelectItem: TNotifyEvent;
{$IFDEF VCL}
    procedure CMShowingChanged(var Message: TMessage); message CM_SHOWINGCHANGED;
{$ELSE}
    function GetItemIndex: Integer;
{$ENDIF}
{$IFNDEF DELPHI6}
    function GetItemIndex: Integer;
{$ENDIF}
  protected
    procedure Click; override;
    function DoMouseWheel(Shift: TShiftState; WheelDelta: Integer;
      {$IFNDEF VCL}const{$ENDIF} MousePos: TPoint): Boolean; override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    function DoDrawItem(AIndex: Integer; const ARect: TRect;
      AState: TOwnerDrawState): Boolean; virtual;
    procedure DoSelectItem;
    function GetDefaultItemHeight: Integer;
    function GetHeight(ARowCount: Integer; AMaxHeight: Integer): Integer; virtual;
    function GetItem(Index: Integer): TCaption; virtual;
    function GetItemHeight(AIndex: Integer = -1): Integer; virtual;
    procedure InternalRecreateWindow;
    procedure RecreateWindow; virtual;
    procedure SetItemCount(Value: Integer);
{$IFDEF VCL}
    procedure DrawItem(Index: Integer; Rect: TRect; State: TOwnerDrawState); override;
    procedure MeasureItem(Index: Integer; var Height: Integer); override;
    procedure SetItemIndex(const Value: Integer); {$IFDEF DELPHI6}override;{$ELSE}virtual;{$ENDIF}
{$ELSE}
    function DrawItem(Index: Integer; Rect: TRect; State: TOwnerDrawState): Boolean; override;
    procedure InitWidget; override;
    procedure MeasureItem(Control: TWinControl;
      {$IFDEF LINUX}item: QClxListBoxItemH{$ENDIF}
      {$IFDEF WIN32}{$IFNDEF DELPHI7}Index: Integer{$ELSE}item: QClxListBoxItemH{$ENDIF}{$ENDIF};
      var Height{$IFNDEF VCL}, Width{$ENDIF}: Integer); override;
    procedure SetItemIndex(const Value: Integer); virtual;
{$ENDIF}
    property HotTrack: Boolean read FHotTrack write FHotTrack;
{$IFNDEF DELPHI6}
    property ItemIndex: Integer read GetItemIndex write SetItemIndex;
{$ENDIF}
{$IFNDEF VCL}
    property ItemIndex: Integer read GetItemIndex write SetItemIndex;
{$ENDIF}
    property OnSelectItem: TNotifyEvent read FOnSelectItem write FOnSelectItem;
  public
    constructor Create(AOwner: TComponent); override;
    function IsVisible: Boolean;
{$IFNDEF VCL}
    property ScrollWidth: Integer read FScrollWidth write FScrollWidth; 
{$ENDIF}
  end;

  TcxCustomEditListBoxClass = class of TcxCustomEditListBox;

  { IcxTextEditLookupData }

  TcxEditLookupDataGoDirection = (egdBegin, egdEnd, egdNext, egdPrev, egdPageUp, egdPageDown);

  IcxTextEditLookupData = interface
  ['{F49C5F08-7758-4362-A360-1DF02354E708}']
    function CanResizeVisualArea(var NewSize: TSize): Boolean;
    procedure CloseUp;
    procedure Deinitialize;
    procedure DropDown;
    procedure DroppedDown(const AFindStr: TCaption);
    function Find(const AText: string): Boolean;
    function GetActiveControl: TControl;
    function GetCurrentKey: TcxEditValue;
    function GetDisplayText(const AKey: TcxEditValue): string; overload;
    function GetOnCurrentKeyChanged: TNotifyEvent;
    function GetOnSelectItem: TNotifyEvent;
    function GetVisualAreaPreferredSize(AMaxHeight: Integer; AWidth: Integer = 0): TSize;
    procedure Go(ADirection: TcxEditLookupDataGoDirection; ACircular: Boolean);
    procedure Initialize(AVisualControlsParent: TWinControl);
    function IsEmpty: Boolean;
    function IsMouseOverList(const P: TPoint): Boolean;
    function Locate(var AText, ATail: string; ANext: Boolean): Boolean;
    procedure PositionVisualArea(const AClientRect: TRect);
    procedure PropertiesChanged;
    procedure SelectItem;
    procedure SetCurrentKey(const AKey: TcxEditValue);
    procedure SetOnCurrentKeyChanged(Value: TNotifyEvent);
    procedure SetOnSelectItem(Value: TNotifyEvent);
    procedure TextChanged;
    property ActiveControl: TControl read GetActiveControl;
    property CurrentKey: TcxEditValue read GetCurrentKey write SetCurrentKey;
    property OnCurrentKeyChanged: TNotifyEvent read GetOnCurrentKeyChanged write SetOnCurrentKeyChanged;
    property OnSelectItem: TNotifyEvent read GetOnSelectItem write SetOnSelectItem;
  end;

  { TcxCustomTextEditLookupData }

  TcxCustomTextEditProperties = class;

  TcxCustomTextEditLookupData = class(TcxInterfacedPersistent, IcxTextEditLookupData)
  private
    FCurrentKey: Integer;
    FItemIndex: Integer;
    FList: TcxCustomEditListBox;
    FOwner: TPersistent;
    FOnCurrentKeyChanged: TNotifyEvent;
    FOnSelectItem: TNotifyEvent;
    function GetEdit: TcxCustomTextEdit;
    function GetItems: TStrings;
    function GetProperties: TcxCustomTextEditProperties;
    procedure SetItemIndex(Value: Integer);
    procedure SetItems(Value: TStrings);
  protected
    function GetOwner: TPersistent; override;
    procedure DoCurrentKeyChanged;
    procedure DoSelectItem;
    function GetItem(Index: Integer): TCaption; virtual;
    function GetItemCount: Integer; virtual;
    function GetListBoxClass: TcxCustomEditListBoxClass; virtual;
    procedure HandleSelectItem(Sender: TObject); virtual; // TODO test for CLX
    function InternalLocate(var AText, ATail: string; ANext, ASynchronizeWithText: Boolean):
      Boolean; virtual;
    procedure InternalSetCurrentKey(Value: Integer);
    procedure InternalSetItemIndex(Value: Integer);
    procedure ListChanged; virtual;
    procedure SetListItemIndex(Value: Integer);
    property Edit: TcxCustomTextEdit read GetEdit;
    property ItemIndex: Integer read FItemIndex write SetItemIndex stored False;
    property Items: TStrings read GetItems write SetItems;
    property List: TcxCustomEditListBox read FList;
    property Properties: TcxCustomTextEditProperties read GetProperties;
  public
    constructor Create(AOwner: TPersistent); override;
    function CanResizeVisualArea(var NewSize: TSize): Boolean; virtual;
    procedure CloseUp;
    procedure Deinitialize;
    procedure DropDown; virtual;
    procedure DroppedDown(const AFindStr: TCaption); virtual;
    function Find(const AText: string): Boolean; virtual;
    function GetActiveControl: TControl;
    function GetCurrentKey: TcxEditValue;
    function GetDisplayText(const AKey: TcxEditValue): string; overload;
    function GetOnCurrentKeyChanged: TNotifyEvent;
    function GetOnSelectItem: TNotifyEvent;
    function GetVisualAreaPreferredSize(AMaxHeight: Integer; AWidth: Integer = 0): TSize; virtual;
    procedure Go(ADirection: TcxEditLookupDataGoDirection; ACircular: Boolean);
    procedure Initialize(AVisualControlsParent: TWinControl); virtual;
    function IsEmpty: Boolean;
    function IsMouseOverList(const P: TPoint): Boolean;
    function Locate(var AText, ATail: string; ANext: Boolean): Boolean;
    procedure PositionVisualArea(const AClientRect: TRect); virtual;
    procedure PropertiesChanged; virtual;
    procedure SelectItem;
    procedure SetCurrentKey(const AKey: TcxEditValue);
    procedure SetOnCurrentKeyChanged(Value: TNotifyEvent);
    procedure SetOnSelectItem(Value: TNotifyEvent);
    procedure TextChanged; virtual;
    property ActiveControl: TControl read GetActiveControl;
    property CurrentKey: TcxEditValue read GetCurrentKey write SetCurrentKey;
    property OnCurrentKeyChanged: TNotifyEvent read GetOnCurrentKeyChanged write SetOnCurrentKeyChanged;
    property OnSelectItem: TNotifyEvent read GetOnSelectItem write SetOnSelectItem;
  end;

  { TcxCustomTextEditViewData }
  TcxCustomTextEditViewData = class(TcxCustomEditViewData)
  private
    FIsValueEditorWithValueFormatting: Boolean;

    function GetProperties: TcxCustomTextEditProperties;
    procedure SetProperties(Value: TcxCustomTextEditProperties);
  protected
    function GetIsEditClass: Boolean; virtual;
    procedure InitCacheData; override;
    function IsComboBoxStyle: Boolean; virtual;
    procedure PrepareDrawTextFlags(ACanvas: TcxCanvas;
      AViewInfo: TcxCustomEditViewInfo); virtual;
  public
    procedure Calculate(ACanvas: TcxCanvas; const ABounds: TRect; const P: TPoint;
      Button: TcxMouseButton; Shift: TShiftState; AViewInfo: TcxCustomEditViewInfo;
      AIsMouseEvent: Boolean); override;
    procedure DisplayValueToDrawValue(const ADisplayValue: TcxEditValue;
      AViewInfo: TcxCustomEditViewInfo); virtual;
    procedure EditValueToDrawValue(ACanvas: TcxCanvas; const AEditValue: TcxEditValue;
      AViewInfo: TcxCustomEditViewInfo); override;
    function GetClientExtent(AViewInfo: TcxCustomEditViewInfo): TRect; override;
    function GetDrawTextFlags: DWORD; virtual;
    function GetDrawTextOffset: TRect; virtual;
    function GetEditContentSize(ACanvas: TcxCanvas; const AEditValue: TcxEditValue;
      const AEditSizeProperties: TcxEditSizeProperties): TSize; override;
    procedure PrepareSelection(AViewInfo: TcxCustomEditViewInfo);
    property Properties: TcxCustomTextEditProperties read GetProperties write SetProperties;
  end;

  { TcxCustomTextEditViewInfo }

  TcxTextOutData = record
    ForceEndEllipsis: Boolean;
    Initialized: Boolean;
    RowCount: Integer;
    SelStart, SelLength: Integer;
    SelBackgroundColor, SelTextColor: TColor;
    TextParams: TcxTextParams;
    TextRect: TRect;
    TextRows: TcxTextRows;
  end;

  TcxCustomTextEditViewInfo = class(TcxCustomEditViewInfo)
  protected
    procedure InternalPaint(ACanvas: TcxCanvas); override;
  public
    ComboBoxStyle: Boolean;
    DrawSelectionBar: Boolean;
    DrawTextFlags: DWORD;
    EditingStyle: TcxEditEditingStyle;
    HasPopupWindow: Boolean;
    IsEditClass: Boolean;
    MaxLineCount: Integer;
    SelStart, SelLength: Integer;
    SelTextColor, SelBackgroundColor: TColor;
    Text: TCaption;
    TextOutData: TcxTextOutData;
    TextRect: TRect;
    destructor Destroy; override;
    procedure DrawText(ACanvas: TcxCanvas); virtual;
    function NeedShowHint(ACanvas: TcxCanvas; const P: TPoint;
      AVisibleBounds: TRect; out AText: TCaption;
      out AIsMultiLine: Boolean; out ATextRect: TRect): Boolean; override;
    procedure Offset(DX, DY: Integer); override;
    procedure PrepareCanvasFont(AFont: TFont); virtual;
  end;

  { TcxCustomTextEditProperties }

  TcxNewLookupDisplayTextEvent = procedure(Sender: TObject; const AText: TCaption) of object;
  TcxTextEditChars = set of Char;

  TcxCustomTextEditProperties = class(TcxCustomEditProperties)
  private
    FCharCase: TEditCharCase;
    FEchoMode: TcxEditEchoMode;
    FFixedListSelection: Boolean;
    FHideCursor: Boolean;
    FHideSelection: Boolean;
    FImmediateUpdateText: Boolean;
    FLookupItems: TStringList;
    FMaxLength: Integer;
    FMaxValue: Double;
    FMinValue: Double;
    FValidChars: TcxTextEditChars;
{$IFDEF VCL}
    FOEMConvert: Boolean;
{$ENDIF}
    FOnNewLookupDisplayText: TcxNewLookupDisplayTextEvent;
    function GetAssignedValues: TcxTextEditPropertiesValues;
    function GetInnerEditMaxLength: Integer;
    function GetLookupItems: TStrings;
    function GetLookupItemsSorted: Boolean;
    function GetMaxLength: Integer;
    function GetMaxValue: Double;
    function GetMinValue: Double;
    function IsMaxLengthStored: Boolean;
    function IsMaxValueStored: Boolean;
    function IsMinValueStored: Boolean;
    procedure LookupItemsChanged(Sender: TObject);
    procedure SetEchoMode(Value: TcxEditEchoMode);
    procedure SetFixedListSelection(Value: Boolean);
    procedure SetHideCursor(Value: Boolean);
    procedure SetHideSelection(Value: Boolean);
    procedure SetLookupItems(Value: TStrings);
    procedure SetLookupItemsSorted(Value: Boolean);
    procedure SetMaxValue(Value: Double);
    procedure SetMinValue(Value: Double);
{$IFDEF VCL}
    procedure SetOEMConvert(Value: Boolean);
{$ENDIF}
  protected
    procedure AlignmentChangedHandler(Sender: TObject); override;
    procedure BaseSetAlignment(Value: TcxEditAlignment); override;
    function CanValidate: Boolean; override;
    function CompareEditValue: Boolean; override;
    class function GetAssignedValuesClass: TcxCustomEditPropertiesValuesClass; override;
    function GetDisplayFormatOptions: TcxEditDisplayFormatOptions; override;
    function GetValidateErrorText(AErrorKind: TcxEditErrorKind): TCaption; override;
    class function GetViewDataClass: TcxCustomEditViewDataClass; override;
    function HasDisplayValue: Boolean; override;
    function WantNavigationKeys: Boolean; override;
    procedure CheckEditorValueBounds(var DisplayValue: TcxEditValue;
      var ErrorText: TCaption; var Error: Boolean; AEdit: TcxCustomEdit); virtual;
    procedure CheckValueBounds(var Value: Double);
    function DefaultFocusedDisplayValue: TcxEditValue; virtual;
    procedure DisplayValueToDisplayText(const ADisplayValue: TcxEditValue;
      var DisplayText: TCaption); virtual;
    procedure DoNewLookupDisplayText(AEdit: TcxCustomTextEdit; const AText: TCaption); virtual;
    function FindLookupText(const AText: string): Boolean; virtual;
    function GetDefaultDisplayValue(const AEditValue: TcxEditValue; AEditFocused: Boolean): TcxEditValue;
    function GetDefaultMaxLength: Integer; virtual;
    function GetDropDownPageRowCount: Integer; virtual;
    function GetEditingStyle: TcxEditEditingStyle; virtual;
    class function GetLookupDataClass: TcxInterfacedPersistentClass; virtual;
    function IsEditValueNumeric: Boolean; virtual;
    function IsLookupDataVisual: Boolean; virtual;
    function IsMultiLine: Boolean; virtual;
    function IsPopupKey(Key: Word; Shift: TShiftState): Boolean; virtual;
    procedure LookupDataChanged(Sender: TObject); virtual;
    procedure SetCharCase(Value: TEditCharCase); virtual;
    procedure SetMaxLength(Value: Integer); virtual;
    function UseLookupData: Boolean; virtual;
    property AssignedValues: TcxTextEditPropertiesValues read GetAssignedValues;
    property CharCase: TEditCharCase read FCharCase write SetCharCase default ecNormal;
    property EchoMode: TcxEditEchoMode read FEchoMode write SetEchoMode default eemNormal;
    property EditingStyle: TcxEditEditingStyle read GetEditingStyle;
    property FixedListSelection: Boolean read FFixedListSelection write SetFixedListSelection default True;
    property HideCursor: Boolean read FHideCursor write SetHideCursor default False;
    property HideSelection: Boolean read FHideSelection write SetHideSelection default True;
    property ImmediateUpdateText: Boolean read FImmediateUpdateText write FImmediateUpdateText default False;
    property LookupItems: TStrings read GetLookupItems write SetLookupItems;
    property LookupItemsSorted: Boolean read GetLookupItemsSorted write
      SetLookupItemsSorted default False;
    property MaxLength: Integer read GetMaxLength write SetMaxLength stored IsMaxLengthStored;
    property MaxValue: Double read GetMaxValue write SetMaxValue stored IsMaxValueStored;
    property MinValue: Double read GetMinValue write SetMinValue stored IsMinValueStored;
{$IFDEF VCL}
    property OEMConvert: Boolean read FOEMConvert write SetOEMConvert default False;
{$ENDIF}
    property OnNewLookupDisplayText: TcxNewLookupDisplayTextEvent read
      FOnNewLookupDisplayText write FOnNewLookupDisplayText;
  public
    constructor Create(AOwner: TPersistent); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    class function GetContainerClass: TcxContainerClass; override;
    function GetDisplayText(const AEditValue: TcxEditValue;
      AFullText: Boolean = False): WideString; override;
    function GetEditValueSource(AEditFocused: Boolean): TcxDataEditValueSource; override;
    function GetSupportedOperations: TcxEditSupportedOperations; override;
    class function GetViewInfoClass: TcxContainerViewInfoClass; override;
    function IsDisplayValueValid(var DisplayValue: TcxEditValue; AEditFocused: Boolean): Boolean; virtual;
    function IsEditValueValid(var EditValue: TcxEditValue; AEditFocused: Boolean): Boolean; override;
    function IsResetEditClass: Boolean; override;
    procedure PrepareDisplayValue(const AEditValue: TcxEditValue;
      var DisplayValue: TcxEditValue; AEditFocused: Boolean); override;
    procedure SetMinMaxValues(AMinValue, AMaxValue: Double);
    procedure ValidateDisplayValue(var DisplayValue: TcxEditValue; var ErrorText: TCaption;
      var Error: Boolean; AEdit: TcxCustomEdit); override;
    property ValidChars: TcxTextEditChars read FValidChars write FValidChars;
  end;

  { TcxTextEditProperties }

  TcxTextEditProperties = class(TcxCustomTextEditProperties)
  published
    property Alignment;
    property AutoSelect;
    property BeepOnError;
    property CharCase;
    property EchoMode;
    property HideSelection;
    property LookupItems;
    property LookupItemsSorted;
    property MaxLength;
{$IFDEF VCL}
    property OEMConvert;
{$ENDIF}
    property ReadOnly;
    property UseLeftAlignmentOnEditing;
    property OnChange;
    property OnEditValueChanged;
    property OnNewLookupDisplayText;
    property OnValidate;
  end;

  { TcxCustomTextEdit }

  TcxCustomTextEdit = class(TcxCustomEdit)
  private
    FBeepOnEnter: Boolean;
    FDisableRefresh: Boolean;
    FClickLockCount: Integer;
    FFindSelection: Boolean;
    FHideInnerEdit: Boolean;
    FLookupItemsScrolling: Boolean;
    FShowInnerEdit: Boolean;
    FTesting: Boolean;
{$IFDEF VCL}
    FInternalTextSetting: Boolean;
{$ENDIF}
    function GetCursorPos: Integer;
    function GetEditingText: TCaption;
    function GetInnerTextEdit: IcxInnerTextEdit;
    function GetILookupData: IcxTextEditLookupData;
    function GetLookupData: TcxCustomTextEditLookupData;
    function GetProperties: TcxTextEditProperties;
    function GetSelLength: Integer;
    function GetSelStart: Integer;
    function GetSelText: TCaption;
    function GetViewInfo: TcxCustomTextEditViewInfo;
    procedure SetEditingText(const Value: TCaption);
    procedure SetFindSelection(Value: Boolean);
    procedure SetHideInnerEdit(Value: Boolean);
    procedure SetProperties(Value: TcxTextEditProperties);
    procedure SetShowInnerEdit(Value: Boolean);
    procedure SetTesting(Value: Boolean);
{$IFDEF VCL}
    procedure WMClear(var Message: TMessage); message WM_CLEAR;
    procedure WMGetText(var Message: TWMGetText); message WM_GETTEXT;
    procedure WMGetTextLength(var Message: TWMGetTextLength); message WM_GETTEXTLENGTH;
    procedure WMSetText(var Message: TWMSetText); message WM_SETTEXT;
{$ENDIF}
  protected
    FInnerEditPositionAdjusting: Boolean;
    FIsPopupWindowJustClosed: Boolean;
    FLookupData: TcxInterfacedPersistent;
    FLookupDataTextChangedLocked: Boolean;
    procedure AdjustInnerEditPosition(AInnerEditHeight: Integer); override;
    function CanKeyDownModifyEdit(Key: Word; Shift: TShiftState): Boolean; override;
    function CanKeyPressModifyEdit(Key: Char): Boolean; override;
    procedure ChangeHandler(Sender: TObject); override;
    procedure DoEditKeyDown(var Key: Word; Shift: TShiftState); override;
    procedure DoEditKeyPress(var Key: Char); override;
    procedure DoExit; override;
    function DoMouseWheel(Shift: TShiftState; WheelDelta: Integer;
      {$IFNDEF VCL}const{$ENDIF} MousePos: TPoint): Boolean; override;
    procedure FillSizeProperties(var AEditSizeProperties: TcxEditSizeProperties); override;
    procedure GetChildControlBounds(AChildControlBounds: TRect;
      AChildControl: TControl; var PR: PRect); override;
    function GetDisplayValue: TCaption; override;
    function GetInnerEditClass: TControlClass; override;
    function InternalDoEditing: Boolean; override;
    function InternalGetPopupMenu: TPopupMenu; override;
    procedure InternalSetDisplayValue(const Value: TcxEditValue); override;
    procedure InternalValidateDisplayValue(const ADisplayValue: TcxEditValue); override;
    function IsEditClass: Boolean; override;
    function IsValidChar(AChar: Char): Boolean; override;
    procedure Loaded; override;
{$IFDEF VCL}
    procedure LockedInnerEditWindowProc(var Message: TMessage); override;
{$ENDIF}
    procedure PropertiesChanged(Sender: TObject); override;
    function RefreshContainer(const P: TPoint; Button: TcxMouseButton; Shift: TShiftState;
      AIsMouseEvent: Boolean): Boolean; override;
    function SetDisplayText(const Value: TCaption): Boolean; override;
{$IFDEF VCL}
    procedure UnlockInnerEditRepainting; override;
{$ENDIF}
    procedure AdjustInnerEdit; virtual;
    procedure SetInternalDisplayValue(Value: TcxEditValue); override;
    procedure CheckEditValue; virtual;
    procedure CheckEditorValueBounds; virtual;
    procedure DoClick;
    function GetScrollLookupDataList(AScrollCause: TcxEditScrollCause): Boolean; virtual;
    procedure HandleSelectItem(Sender: TObject); virtual;
    function InternalGetText: TCaption; virtual;
    function InternalSetText(const Value: TCaption): Boolean; virtual;
    procedure LockClick(ALock: Boolean);
    procedure LockLookupDataTextChanged;
    function LookupKeyToEditValue(const AKey: TcxEditValue): TcxEditValue; virtual;
    procedure ResetOnNewDisplayValue; virtual;
    procedure SetSelLength(Value: Integer); virtual;
    procedure SetSelStart(Value: Integer); virtual;
    procedure SetSelText(const Value: TCaption); virtual;
    procedure SynchronizeDisplayValue; override;
    procedure SynchronizeEditValue; override;
    procedure UnlockLookupDataTextChanged;
    procedure UpdateDrawValue; override;
    procedure UpdateEditValue;
{$IFNDEF VCL}
    function GetText: TCaption; override;
    procedure SetText(const Value: TCaption); override;
{$ENDIF}
    property BeepOnEnter: Boolean read FBeepOnEnter write FBeepOnEnter default True;
    property CursorPos: Integer read GetCursorPos;
    property FindSelection: Boolean read FFindSelection write SetFindSelection; 
    property HideInnerEdit: Boolean read FHideInnerEdit write SetHideInnerEdit; // for test
    property ILookupData: IcxTextEditLookupData read GetILookupData;
    property InnerTextEdit: IcxInnerTextEdit read GetInnerTextEdit;
    property LookupData: TcxCustomTextEditLookupData read GetLookupData;
    property LookupItemsScrolling: Boolean read FLookupItemsScrolling write FLookupItemsScrolling;
    property ParentColor default False;
    property Properties: TcxTextEditProperties read GetProperties write SetProperties;
    property ShowInnerEdit: Boolean read FShowInnerEdit write SetShowInnerEdit; // for test
    property Testing: Boolean read FTesting write SetTesting; // for test
    property ViewInfo: TcxCustomTextEditViewInfo read GetViewInfo;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Activate(var AEditData: TcxCustomEditData); override;
    class function GetPropertiesClass: TcxCustomEditPropertiesClass; override;
    procedure Clear; override;
    procedure ClearSelection; virtual;
    procedure CopyToClipboard; override;
    procedure CutToClipboard; override;
    procedure PasteFromClipboard; override;
    procedure PrepareEditValue(const ADisplayValue: TcxEditValue;
      out EditValue: TcxEditValue; AEditFocused: Boolean); override;
    procedure SelectAll; override;
    procedure SetSelection(ASelStart: Integer; ASelLength: Integer);
    procedure Undo;
    property EditingText: TCaption read GetEditingText write SetEditingText; 
    property SelLength: Integer read GetSelLength write SetSelLength;
    property SelStart: Integer read GetSelStart write SetSelStart;
    property SelText: TCaption read GetSelText write SetSelText;
    property Text;
  end;

  { TcxTextEdit }

  TcxTextEdit = class(TcxCustomTextEdit)
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

function CheckTextEditState(ATextEdit: IcxInnerTextEdit; const APrevState:
  TcxCustomInnerTextEditPrevState): Boolean;
procedure SaveTextEditState(ATextEdit: IcxInnerTextEdit; var APrevState:
  TcxCustomInnerTextEditPrevState);

implementation

uses
{$IFDEF VCL}
  dxThemeConsts, dxThemeManager,
{$ENDIF}
  cxEditConsts, cxEditUtils;

type
  TCanvasAccess = class(TCanvas);
  TControlAccess = class(TControl);
  TcxContainerAccess = class(TcxContainer);
  TcxCustomEditAccess = class(TcxCustomEdit);
  TcxCustomEditPropertiesAccess = class(TcxCustomEditProperties);
  TcxCustomEditStyleAccess = class(TcxCustomEditStyle);
  TcxCustomEditListBoxAccess = class(TcxCustomEditListBox);
  TcxEditDataBindingAccess = class(TcxEditDataBinding);
  TWinControlAccess = class(TWinControl);

procedure CheckCharsRegister(var Text: TCaption; ACharCase: TEditCharCase);

  function InternalLowerCase(const S: TCaption): TCaption;
  begin
{$IFDEF VCL}
    Result := LowerCase(S);
{$ELSE}
    Result := WideLowerCase(S);
{$ENDIF}
  end;

  function InternalUpperCase(const S: TCaption): TCaption;
  begin
{$IFDEF VCL}
    Result := UpperCase(S);
{$ELSE}
    Result := WideUpperCase(S);
{$ENDIF}
  end;

begin
  if ACharCase = ecUpperCase then
    Text := InternalUpperCase(Text)
  else if ACharCase = ecLowerCase then
    Text := InternalLowerCase(Text);
end;

function CheckTextEditState(ATextEdit: IcxInnerTextEdit; const APrevState:
  TcxCustomInnerTextEditPrevState): Boolean;
begin
  if not ATextEdit.Control.HandleAllocated then
    Result := True
  else
    with APrevState do
      Result := (PrevSelStart <> ATextEdit.SelStart) or (PrevSelLength <> ATextEdit.SelLength) or
        not InternalCompareString(PrevText, ATextEdit.EditValue, False);
end;

procedure SaveTextEditState(ATextEdit: IcxInnerTextEdit; var APrevState:
  TcxCustomInnerTextEditPrevState);
begin
  with APrevState do
  begin
    PrevText := ATextEdit.EditValue;
    PrevSelStart := ATextEdit.SelStart;
    PrevSelLength := ATextEdit.SelLength;
  end;
end;

{ TcxCustomInnerTextEditHelper }

constructor TcxCustomInnerTextEditHelper.Create(AEdit: TcxCustomInnerTextEdit);
begin
  inherited Create;
  FEdit := AEdit;
end;

{ IcxContainerInnerControl }
function TcxCustomInnerTextEditHelper.GetControlContainer: TcxContainer;
begin
  Result := Edit.Container;
end;

function TcxCustomInnerTextEditHelper.GetControl: TWinControl;
begin
  Result := Edit;
end;

{ IcxCustomInnerEdit }
function TcxCustomInnerTextEditHelper.GetEditValue: TcxEditValue;
begin
  Result := Edit.Text;
end;

function TcxCustomInnerTextEditHelper.GetOnChange: TNotifyEvent;
begin
  Result := Edit.OnChange;
end;

procedure TcxCustomInnerTextEditHelper.LockBounds(ALock: Boolean);
begin
  with Edit do
    if ALock then
      Inc(FLockBoundsCount)
    else
      if FLockBoundsCount > 0 then
        Dec(FLockBoundsCount);
end;

procedure TcxCustomInnerTextEditHelper.SafelySetFocus;
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

procedure TcxCustomInnerTextEditHelper.SetEditValue(const Value: TcxEditValue);
var
  ATextChanged: Boolean;
  AIsDesigning: Boolean;
begin
  with Edit do
  begin
    AIsDesigning := csDesigning in ComponentState;
    if AIsDesigning then
      ATextChanged := not InternalCompareString(Text, VarToStr(Value), True)
    else
      ATextChanged := False;
    Text := VarToStr(Value);
    if ATextChanged then
      Change;
  end;
end;

procedure TcxCustomInnerTextEditHelper.SetParent(Value: TWinControl);
begin
  Edit.Parent := Value;
end;

procedure TcxCustomInnerTextEditHelper.SetOnChange(Value: TNotifyEvent);
begin
  Edit.OnChange := Value;
end;

{ IcxInnerTextEdit }
procedure TcxCustomInnerTextEditHelper.CopyToClipboard;
begin
  Edit.CopyToClipboard;
end;

function TcxCustomInnerTextEditHelper.GetAlignment: TAlignment;
begin
{$IFDEF VCL}
  Result := Edit.FAlignment;
{$ELSE}
  Result := Edit.Alignment;
{$ENDIF}
end;

function TcxCustomInnerTextEditHelper.GetAutoSelect: Boolean;
begin
  Result := Edit.AutoSelect;
end;

function TcxCustomInnerTextEditHelper.GetCharCase: TEditCharCase;
begin
  Result := Edit.CharCase;
end;

function TcxCustomInnerTextEditHelper.GetEchoMode: TcxEditEchoMode;
begin
  Result := Edit.FEchoMode;
end;

function TcxCustomInnerTextEditHelper.GetHideSelection: Boolean;
begin
  Result := Edit.HideSelection;
end;

function TcxCustomInnerTextEditHelper.GetImeLastChar: Char;
begin
{$IFDEF VCL}
  if Edit.FImeCharCount = 2 then
    Result := Edit.FImeLastChar
  else
    Result := #0;
{$ELSE}
  Result := #0;
{$ENDIF}
end;

function TcxCustomInnerTextEditHelper.GetInternalUpdating: Boolean;
begin
  Result := Edit.FInternalUpdating;
end;

function TcxCustomInnerTextEditHelper.GetMaxLength: Integer;
begin
  Result := Edit.MaxLength;
end;

function TcxCustomInnerTextEditHelper.GetMultiLine: Boolean;
begin
  Result := False;
end;

{$IFDEF VCL}
function TcxCustomInnerTextEditHelper.GetOEMConvert: Boolean;
begin
  Result := Edit.OEMConvert;
end;
{$ENDIF}

function TcxCustomInnerTextEditHelper.GetReadOnly: Boolean;
begin
  Result := Edit.ReadOnly;
end;

function TcxCustomInnerTextEditHelper.GetSelLength: Integer;
begin
  with Edit do
{$IFDEF VCL}
    if FImeCharCount > 0 then
      Result := Self.FSelLength
    else
{$ENDIF}
      Result := SelLength;
end;

function TcxCustomInnerTextEditHelper.GetSelStart: Integer;
begin
  with Edit do
{$IFDEF VCL}
    if FImeCharCount > 0 then
      Result := Self.FSelStart
    else
{$ENDIF}
      Result := SelStart;
end;

function TcxCustomInnerTextEditHelper.GetSelText: TCaption;
begin
  Result := Edit.SelText;
end;

procedure TcxCustomInnerTextEditHelper.SelectAll;
begin
  with Edit do
    if HandleAllocated then
      SelectAll;
end;

procedure TcxCustomInnerTextEditHelper.SetAlignment(Value: TAlignment);
begin
  if Edit.Container.Properties.UseLeftAlignmentOnEditing then
    Value := taLeftJustify;
{$IFDEF VCL}
  with Edit do
    if Value <> FAlignment then
    begin
      FAlignment := Value;
      RecreateWnd;
    end;
{$ELSE}
  Edit.Alignment := Value;
{$ENDIF}
end;

procedure TcxCustomInnerTextEditHelper.SetAutoSelect(Value: Boolean);
begin
  Edit.AutoSelect := Value;
end;

procedure TcxCustomInnerTextEditHelper.SetCharCase(Value: TEditCharCase);
begin
  with Edit do
  begin
    CharCase := Value;
{$IFNDEF VCL}
    if Value <> ecNormal then
      Text := Text;
{$ENDIF}
  end;
end;

procedure TcxCustomInnerTextEditHelper.SetEchoMode(Value: TcxEditEchoMode);
begin
  with Edit do
    if Value <> FEchoMode then
    begin
      FEchoMode := Value;
      UpdateEchoMode;
    end;
end;

procedure TcxCustomInnerTextEditHelper.SetHideSelection(Value: Boolean);
begin
  Edit.HideSelection := Value;
end;

procedure TcxCustomInnerTextEditHelper.SetInternalUpdating(Value: Boolean);
begin
  Edit.FInternalUpdating := Value;
end;

procedure TcxCustomInnerTextEditHelper.SetMaxLength(Value: Integer);
begin
  Edit.MaxLength := Value;
end;

{$IFDEF VCL}
procedure TcxCustomInnerTextEditHelper.SetOEMConvert(Value: Boolean);
begin
  Edit.OEMConvert := Value;
end;
{$ENDIF}

procedure TcxCustomInnerTextEditHelper.SetReadOnly(Value: Boolean);
begin
  Edit.ReadOnly := Value;
end;

procedure TcxCustomInnerTextEditHelper.SetSelLength(Value: Integer);
begin
  with Edit do
    if HandleAllocated then
{$IFDEF VCL}
      if FImeCharCount > 0 then
        Self.FSelLength := Value
      else
{$ENDIF}
        SelLength := Value;
end;

procedure TcxCustomInnerTextEditHelper.SetSelStart(Value: Integer);
begin
  with Edit do
  begin
    if not HandleAllocated then
      Exit;
{$IFDEF VCL}
    if FImeCharCount > 0 then
    begin
      Self.FSelStart := Value;
      Exit;
    end;
    SelStart := Value;
{$ELSE}
    if (SelStart = Value) and (Value = 0) and (Length(Text) > 0) then
      SelStart := 1
    else
      SelStart := 0;
    SelStart := Value;
    SelLength := 0;
{$ENDIF}
  end;
end;

procedure TcxCustomInnerTextEditHelper.SetSelText(Value: TCaption);
begin
  Edit.SelText := Value;
end;

{ TcxCustomInnerTextEdit }

constructor TcxCustomInnerTextEdit.Create(AOwner: TComponent);
begin
  FIsCreating := True;
  inherited Create(AOwner);
  FHelper := TcxCustomInnerTextEditHelper.Create(Self);
  TabStop := False;
{$IFNDEF VCL}
  ControlStyle := ControlStyle + [csCaptureMouse];
  if not (csDesigning in ComponentState) then
    Cursor := crIBeam;
{$ENDIF}
  ControlStyle := ControlStyle + [csDoubleClicks];
  ParentColor := True;
  ParentFont := False;
{$IFDEF VCL}
  FAlignment := cxEditDefaultHorzAlignment;
{$ELSE}
  BorderStyle := bsNone;
  {$IFDEF WIN32}
  InputKeys := [ikChars, ikTabs];
  if Container.IsInplace or Container.HasPopupWindow then
    InputKeys := InputKeys + [ikAll]
  else
    InputKeys := InputKeys + [ikArrows];
  {$ELSE}
  InputKeys := InputKeys + [ikEsc, ikTabs];
  {$ENDIF}
{$ENDIF}
  FInternalUpdating := False;
  FEchoMode := eemNormal;
  UpdateEchoMode;
  FIsCreating := False;
end;

destructor TcxCustomInnerTextEdit.Destroy;
begin
  FreeAndNil(FHelper);
  inherited Destroy;
end;

procedure TcxCustomInnerTextEdit.DragDrop(Source: TObject; X, Y: Integer);
begin
  Container.DragDrop(Source, Left + X, Top + Y);
end;

function TcxCustomInnerTextEdit.ExecuteAction(Action: TBasicAction): Boolean;
begin
  Result := inherited ExecuteAction(Action) or
    TcxEditDataBindingAccess(Container.DataBinding).ExecuteAction(Action);
end;

function TcxCustomInnerTextEdit.UpdateAction(Action: TBasicAction): Boolean;
begin
  Result := inherited UpdateAction(Action) or
    TcxEditDataBindingAccess(Container.DataBinding).UpdateAction(Action);
end;

{$IFDEF DELPHI5}
function TcxCustomInnerTextEdit.CanFocus: Boolean;
begin
  Result := Container.CanFocusEx;
end;
{$ENDIF}

{$IFDEF VCL}
procedure TcxCustomInnerTextEdit.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
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

{$ELSE}
procedure TcxCustomInnerTextEdit.CutToClipboard;
begin
  if not ReadOnly then
    with Container do
    begin
      KeyboardAction := True;
      Container.CutToClipboard;
      KeyboardAction := False;
    end;
end;

procedure TcxCustomInnerTextEdit.PasteFromClipboard;
begin
  if not ReadOnly then
    with Container do
    begin
      KeyboardAction := True;
      Container.PasteFromClipboard;
      KeyboardAction := False;
    end;
end;
{$ENDIF}

{$IFNDEF VCL}
procedure TcxCustomInnerTextEdit.ChangeBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  if not FIsCreating and (FLockBoundsCount = 0) then
  begin
    Container.LockAlignControls(True);
    try
      inherited ChangeBounds(ALeft, ATop, AWidth, AHeight);
    finally
      Container.LockAlignControls(False);
    end;
  end;
end;

procedure TcxCustomInnerTextEdit.CreateWidget;
begin
  Container.ClearSavedChildControlRegions;
  inherited CreateWidget;
end;

function TcxCustomInnerTextEdit.EventFilter(Sender: QObjectH; Event: QEventH): Boolean;
var
  AIsKeyEvent: Boolean;
  AKeyCode: Word;
  AKeyEvent: QKeyEventH;
  APrevState: TcxCustomInnerTextEditPrevState;
  AShiftState: TShiftState;
begin
  Result := True;
  AIsKeyEvent := QEvent_type(Event) = QEventType_KeyPress;

  if not AIsKeyEvent then
    Result := inherited EventFilter(Sender, Event);
  if QEvent_type(Event) in [QEventType_FocusIn, QEventType_FocusOut] then
    Container.FocusChanged;
  if not AIsKeyEvent then
    Exit;

  SaveTextEditState(Self, APrevState);
  FInternalUpdating := False;

  AKeyEvent := QKeyEventH(Event);
  AShiftState := ButtonStateToShiftState(QKeyEvent_state(AKeyEvent));
  AKeyCode := QKeyEvent_key(AKeyEvent);
  if (AKeyCode = Key_Shift) then Include(AShiftState, ssShift);
  if (AKeyCode = Key_Control) then Include(AShiftState, ssCtrl);
  if (AKeyCode = Key_Alt) then Include(AShiftState, ssAlt);

  if Container.HasPopupWindow and Container.Properties.IsPopupKey(AKeyCode, AShiftState) then
    with Container.ILookupData do
      if (ActiveControl is TWinControl) and QApplication_sendEvent(TWinControl(ActiveControl).Handle, Event) then
      begin
        Result := True;
        Exit;
      end;

  Result := inherited EventFilter(Sender, Event);
  Container.UnlockLookupDataTextChanged;
  if FInternalUpdating then
    Exit;
  if CheckTextEditState(Self, APrevState) then
    Container.FindSelection := False
  else
    Container.DoAfterKeyDown(AKeyCode, AShiftState);
end;

procedure TcxCustomInnerTextEdit.InitWidget;
begin
  inherited InitWidget;
  if (csDesigning in ComponentState) then
    QWidget_setBackgroundMode(Handle, QWidgetBackgroundMode_FixedColor)
  else
    QWidget_setBackgroundMode(Handle, QWidgetBackgroundMode_NoBackground);
end;
{$ENDIF}

procedure TcxCustomInnerTextEdit.Click;
begin
  inherited Click;
  Container.Click;
end;

procedure TcxCustomInnerTextEdit.DblClick;
begin
  inherited DblClick;
  Container.DblClick;
end;

function TcxCustomInnerTextEdit.DoMouseWheel(Shift: TShiftState; WheelDelta: Integer;
  {$IFNDEF VCL}const{$ENDIF} MousePos: TPoint): Boolean;
begin
  Result := False;
end;

procedure TcxCustomInnerTextEdit.DragOver(Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Container.DragOver(Source, Left + X, Top + Y, State, Accept);
end;

function TcxCustomInnerTextEdit.GetPopupMenu: TPopupMenu;
begin
  Result := Container.GetPopupMenu;
end;

function TcxCustomInnerTextEdit.GetText: TCaption;
begin
{$IFDEF VCL}
  Result := inherited Text;
{$ELSE}
  Result := inherited GetText;
{$ENDIF}
end;

procedure TcxCustomInnerTextEdit.KeyDown(var Key: Word; Shift: TShiftState);
begin
  FInternalUpdating := False;
  Container.KeyDown(Key, Shift);
  if Key = 0 then
    FInternalUpdating := True
  else
    inherited KeyDown(Key, Shift);
end;

procedure TcxCustomInnerTextEdit.KeyPress(var Key: Char);
begin
  FInternalUpdating := False;
  if (Key = Char(VK_TAB)){$IFNDEF VCL} or (Key = Char(Key_Backtab)){$ENDIF} then
    Key := #0;
  Container.KeyPress(Key);
  if (Container.IsInplace or not Container.BeepOnEnter or Container.FIsPopupWindowJustClosed) and
      (Word(Key) = VK_RETURN) then
  begin
    Key := #0;
    Container.FIsPopupWindowJustClosed := False;
  end;
  if Key = #0 then
    FInternalUpdating := True
  else
    inherited KeyPress(Key);
end;

procedure TcxCustomInnerTextEdit.KeyUp(var Key: Word; Shift: TShiftState);
begin
  FInternalUpdating := False;
  if (Key = VK_TAB){$IFNDEF VCL} or (Key = Key_Backtab){$ENDIF} then
    Key := 0;
  Container.KeyUp(Key, Shift);
  if Key = 0 then
    FInternalUpdating := True
  else
    inherited KeyUp(Key, Shift);
end;

procedure TcxCustomInnerTextEdit.MouseDown(Button: TMouseButton;
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

procedure TcxCustomInnerTextEdit.MouseEnter(AControl: TControl);
begin
  {$IFNDEF VCL}inherited;{$ENDIF}
end;

procedure TcxCustomInnerTextEdit.MouseLeave(AControl: TControl);
begin
  {$IFNDEF VCL}inherited;{$ENDIF}
  Container.ShortRefreshContainer(True);
end;

procedure TcxCustomInnerTextEdit.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseMove(Shift, X, Y);
  Container.MouseMove(Shift, X + Left, Y + Top);
end;

procedure TcxCustomInnerTextEdit.MouseUp(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseUp(Button, Shift, X, Y);
  Container.MouseUp(Button, Shift, X + Left, Y + Top);
end;

procedure TcxCustomInnerTextEdit.SetText(const Value: TCaption);
{$IFNDEF VCL}
var
  ANewText: TCaption;
{$ENDIF}
begin
{$IFDEF VCL}
  inherited Text := Value;
{$ELSE}
  if CharCase <> ecNormal then
    if CharCase = ecUpperCase then ANewText := WideUpperCase(Value)
    else ANewText := WideLowerCase(Value)
  else
    ANewText := Value;
  inherited SetText(ANewText);
{$ENDIF}
end;

{$IFDEF VCL}
procedure TcxCustomInnerTextEdit.CreateHandle;
begin
  Container.ClearSavedChildControlRegions;
  inherited CreateHandle;
end;

procedure TcxCustomInnerTextEdit.CreateParams(var Params: TCreateParams);
const
  AAlignmentMap: array[TAlignment] of DWORD = (ES_LEFT, ES_RIGHT, ES_CENTER);
begin
  inherited CreateParams(Params);
  with Params do
  begin
    Style := Style or AAlignmentMap[Alignment];
    Style := Style and (not WS_BORDER);
    Style := Style and (not WS_DLGFRAME);
    Style := Style and (not WS_SIZEBOX);
    Style := Style and (not WS_THICKFRAME);
    Style := Style or ES_AUTOHSCROLL;
    ExStyle := ExStyle and (not WS_EX_CLIENTEDGE);
  end;
end;

procedure TcxCustomInnerTextEdit.CreateWnd;
begin
  inherited CreateWnd;
  AdjustMargins;
end;

procedure TcxCustomInnerTextEdit.WndProc(var Message: TMessage);
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

procedure TcxCustomInnerTextEdit.AdjustMargins;
begin
  SendMessage(Handle, EM_SETMARGINS, EC_LEFTMARGIN + EC_RIGHTMARGIN, 1 shl 16);
end;
{$ENDIF}

function TcxCustomInnerTextEdit.GetContainer: TcxCustomTextEdit;
begin
  Result := TcxCustomTextEdit(Owner);
end;

{$IFDEF VCL}
function TcxCustomInnerTextEdit.GetCursorPos: Integer;
var
  X: Integer;
  P: TPoint;
  I, I0, I1: Smallint;
  ATextLength: Integer;
begin
  ATextLength := Length(Text);
  GetCaretPos(P);
  I0 := 0;
  I1 := ATextLength - 1;
  repeat
    I := (I0 + I1) div 2;
    X := Smallint(SendMessage(Handle, EM_POSFROMCHAR, I, 0) and $FFFF);
    if X < P.X then
      I0 := I
    else
      I1 := I;
  until I1 - I0 < 2;
  if SendMessage(Handle, EM_POSFROMCHAR, I0, 0) and $FFFF = P.X then
    Result := I0
  else if SendMessage(Handle, EM_POSFROMCHAR, I1, 0) and $FFFF = P.X then
    Result := I1
  else
    Result := I1 + 1;
end;
{$ELSE}
function TcxCustomInnerTextEdit.GetCursorPos: Integer;
begin
  Result := QLineEdit_cursorPosition(Handle);
end;
{$ENDIF}

procedure TcxCustomInnerTextEdit.UpdateEchoMode;
{$IFNDEF VCL}
const
  AEchoModeMap: array [TcxEditEchoMode] of TEchoMode = (emNormal, emPassword, emNone);
{$ENDIF}
begin
{$IFDEF VCL}
  if FEchoMode = eemNormal then
    PasswordChar := #0
  else
    PasswordChar := '*'
{$ELSE}
  inherited EchoMode := AEchoModeMap[FEchoMode];
{$ENDIF}
end;

{$IFDEF VCL}
procedure TcxCustomInnerTextEdit.WMChar(var Message: TWMChar);
var
  APrevState: TcxCustomInnerTextEditPrevState;
begin
  SaveTextEditState(Self, APrevState);
  FInternalUpdating := False;
  inherited;
  if FImeCharCount > 0 then
  begin
    Dec(FImeCharCount);
    if (FImeCharCount = 0) and Container.FindSelection then
    begin
      SelStart := Helper.FSelStart;
      SelLength := Helper.FSelLength;
    end;
  end;
  Container.UnlockLookupDataTextChanged;
  if FInternalUpdating then
    Exit;
  if CheckTextEditState(Self, APrevState) then
    Container.FindSelection := False;
end;

procedure TcxCustomInnerTextEdit.WMClear(var Message);
begin
  if not ReadOnly then
    with Container do
    begin
      KeyboardAction := True;
      ClearSelection;
      KeyboardAction := False;
    end;
end;

  {$IFDEF DELPHI5}
procedure TcxCustomInnerTextEdit.WMContextMenu(var Message: TWMContextMenu);
begin
  if Container.IsEditClass then
    inherited;
end;
  {$ELSE}
procedure TcxCustomInnerTextEdit.WMRButtonUp(var Message: TWMRButtonUp);
begin
  if not Container.IsEditClass then
    Message.Result := 1;
  inherited;
end;
  {$ENDIF}

procedure TcxCustomInnerTextEdit.WMCut(var Message);
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

procedure TcxCustomInnerTextEdit.WMEraseBkgnd(var Message: TWMEraseBkgnd);
begin
  Message.Result := 1;
end;

procedure TcxCustomInnerTextEdit.WMGetDlgCode(var Message: TWMGetDlgCode);
begin
  inherited;
  with Message do
  begin
    Result := Result or DLGC_WANTCHARS;
    if GetKeyState(VK_CONTROL) >= 0 then
      Result := Result or DLGC_WANTTAB;
    if Container.IsInplace or Container.HasPopupWindow then
      Result := Result or DLGC_WANTALLKEYS;
  end;
end;

procedure TcxCustomInnerTextEdit.WMIMEChar(var Message: TMessage);
var
  S: string[2];
begin
  S := '  ';
  PByte(@S[1])^ := (Message.WParam and $FF00) shr 8;
  PByte(@S[2])^ := Message.WParam and $FF;
  FImeLastChar := Copy(S, 2, 1)[1];
  if ByteType(S, 2) = mbTrailByte then
    FImeCharCount := 2
  else
    FImeCharCount := 1;
  Helper.FSelStart := SelStart;
  Helper.FSelLength := SelLength;
  inherited;
end;

procedure TcxCustomInnerTextEdit.WMKeyDown(var Message: TWMKeyDown);
var
  APrevState: TcxCustomInnerTextEditPrevState;
  AShiftState: TShiftState;
begin
  with Message do
  begin
    AShiftState := KeyDataToShiftState(KeyData);
    if Container.HasPopupWindow and Container.Properties.IsPopupKey(Message.CharCode, AShiftState) then
      with Container.ILookupData do
        if ActiveControl is TWinControl then
        begin
          SendMessage(TWinControl(ActiveControl).Handle, WM_KEYDOWN, TMessage(Message).WParam, TMessage(Message).LParam);
          if Message.Result = 0 then
            Exit;
        end;
  end;

  SaveTextEditState(Self, APrevState);
  FInternalUpdating := False;
  inherited;
  if FInternalUpdating then
    Exit;
  if not CheckTextEditState(Self, APrevState) and (Message.CharCode <> 0) then
    with Message do
    begin
      AShiftState := KeyDataToShiftState(KeyData);
      Container.DoAfterKeyDown(CharCode, AShiftState);
    end;
end;

procedure TcxCustomInnerTextEdit.WMKillFocus(var Message: TWMKillFocus);
begin
  inherited;
  if not(csDestroying in ComponentState) then
    Container.FocusChanged;
end;

procedure TcxCustomInnerTextEdit.WMNCPaint(var Message: TMessage);
begin
  Message.Result := 0;
  Exit;
end;

procedure TcxCustomInnerTextEdit.WMPaste(var Message: TMessage);
begin
  if not ReadOnly then
    with Container do
    begin
      KeyboardAction := True;
      PasteFromClipboard;
      KeyboardAction := False;
    end;
end;

procedure TcxCustomInnerTextEdit.WMSetFocus(var Message: TWMSetFocus);
begin
  inherited;
  if not(csDestroying in ComponentState) and (Message.FocusedWnd <> Container.Handle) then
    Container.FocusChanged;
end;

procedure TcxCustomInnerTextEdit.WMSize(var Message: TWMSize);
begin
  inherited;
  AdjustMargins;
end;

procedure TcxCustomInnerTextEdit.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  if Message.lParam = 0 then
    MouseEnter(Self)
  else
    MouseEnter(TControl(Message.lParam));
end;

procedure TcxCustomInnerTextEdit.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  if Message.lParam = 0 then
    MouseLeave(Self)
  else
    MouseLeave(TControl(Message.lParam));
end;
{$ENDIF}

{ TcxTextEditPropertiesValues }

procedure TcxTextEditPropertiesValues.Assign(Source: TPersistent);
begin
  if Source is TcxTextEditPropertiesValues then
    with Source as TcxTextEditPropertiesValues do
    begin
      Self.MaxLength := MaxLength;
      Self.MaxValue := MaxValue;
      Self.MinValue := MinValue;
    end;
  inherited Assign(Source);
end;

procedure TcxTextEditPropertiesValues.Reset;
begin
  inherited Reset;
  MaxLength := False;
  MaxValue := False;
  MinValue := False;
end;

{ TcxCustomEditListBox }

constructor TcxCustomEditListBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF VCL}
  Style := lbOwnerDrawVariable;
{$ELSE}
  Style := lbOwnerDrawVariable;
{$ENDIF}
  FHotTrack := True;
  BorderStyle := bsNone;
end;

function TcxCustomEditListBox.IsVisible: Boolean;
begin
  Result := HandleAllocated;
{$IFDEF VCL}
  Result := Result and IsWindowVisible(Handle);
{$ELSE}
  Result := Result and QWidget_isVisible(Handle);
{$ENDIF}
end;

procedure TcxCustomEditListBox.Click;
begin
  inherited Click;
  DoSelectItem;
end;

function TcxCustomEditListBox.DoMouseWheel(Shift: TShiftState; WheelDelta: Integer;
  {$IFNDEF VCL}const{$ENDIF} MousePos: TPoint): Boolean;
{$IFDEF VCL}
const
  AScrollDirectionMap: array [Boolean] of Integer = (SB_LINEDOWN, SB_LINEUP);
{$ENDIF}
var
  I: Integer;
begin
  Result := inherited DoMouseWheel(Shift, WheelDelta, MousePos);
  if Result then
    Exit;
  for I := 0 to {$IFDEF VCL}Mouse.WheelScrollLines{$ELSE}QApplication_wheelScrollLines{$ENDIF} - 1 do
{$IFDEF VCL}
    Result := (SendMessage(Handle, WM_VScroll, AScrollDirectionMap[WheelDelta > 0], 0) = 0);
{$ELSE}
    Result := True;
{$ENDIF}
end;

{$IFNDEF VCL}
procedure TcxCustomEditListBox.InitWidget;
begin
  inherited InitWidget;
  QWidget_setBackgroundMode(Handle, QWidgetBackgroundMode_NoBackground);
  BorderStyle := bsNone;
  Style := lbOwnerDrawVariable;
end;
{$ENDIF}

function TcxCustomEditListBox.DoDrawItem(AIndex: Integer; const ARect: TRect;
  AState: TOwnerDrawState): Boolean;
begin
  Result := False;
end;

procedure TcxCustomEditListBox.DoSelectItem;
begin
{$IFDEF VCL}
  SetExternalScrollBarsParameters;
{$ELSE}
// TODO
{$ENDIF}
  if Assigned(FOnSelectItem) then
    FOnSelectItem(Self);
end;

{$IFDEF VCL}
function TcxCustomEditListBox.GetDefaultItemHeight: Integer;
begin
  Canvas.Font := Font;
  Result := Canvas.TextHeight('Wg');
end;
{$ELSE}
function TcxCustomEditListBox.GetDefaultItemHeight: Integer;
var
  FM: QFontMetricsH;
begin
  if HandleAllocated then
  begin
    FM := QFontMetrics_create(Font.Handle);
    try
      QWidget_FontMetrics(Handle, FM);
  {$IFDEF WIN32}
      Result := QFontMetrics_height(FM) + 2;
  {$ELSE}
      Result := QFontMetrics_height(FM) + 2;
  {$ENDIF}
    finally
      QFontMetrics_destroy(FM);
    end;
  end
  else
    Result := 0;
end;
{$ENDIF}

procedure TcxCustomEditListBox.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  AItemIndex: Integer;
begin
  inherited MouseMove(Shift, X, Y);
  if (GetCaptureControl <> Self) and HotTrack then
  begin
    AItemIndex := ItemAtPos(Point(X, Y), False);
    if (AItemIndex <> -1) and (ItemIndex <> AItemIndex) then
    begin
      ItemIndex := AItemIndex;
{$IFNDEF VCL}
      QListBox_ensureCurrentVisible(Handle);
{$ENDIF}
    end;
  end;
end;

function TcxCustomEditListBox.GetHeight(ARowCount: Integer; AMaxHeight: Integer): Integer;
begin
{$IFDEF WIN32}
  Result := ARowCount * GetItemHeight;
{$ELSE}
  Result := ARowCount * GetItemHeight;
{$ENDIF}
end;

function TcxCustomEditListBox.GetItem(Index: Integer): TCaption;
begin
  Result := Items[Index];
end;

function TcxCustomEditListBox.GetItemHeight(AIndex: Integer = -1): Integer;
begin
  Result := GetDefaultItemHeight;
end;

procedure TcxCustomEditListBox.InternalRecreateWindow;
begin
{$IFDEF VCL}
  RecreateWnd;
{$ELSE}
// TODO ???
{$ENDIF}
end;

procedure TcxCustomEditListBox.RecreateWindow;
begin
end;

procedure TcxCustomEditListBox.SetItemCount(Value: Integer);
var
  I: Integer;
begin
  if Value <> Items.Count then
    with Items do
    begin
      BeginUpdate;
      try
        Clear;
        for I := 1 to Value do
          Add('');
      finally
        EndUpdate;
      end;
    end;
end;

{$IFDEF VCL}
procedure TcxCustomEditListBox.DrawItem(Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  AFlags: Longint;
  AText: string;
begin
  if DoDrawItem(Index, Rect, State) then
    Exit;
  Canvas.FillRect(Rect);
  if (Index >= 0) and (Index < Items.Count) then
  begin
    AFlags := DrawTextBiDiModeFlags(DT_SINGLELINE or DT_VCENTER or DT_NOPREFIX);
    if not UseRightToLeftAlignment then
      Inc(Rect.Left, 2)
    else
      Dec(Rect.Right, 2);
    AText := GetItem(Index);
    DrawText(Canvas.Handle, PChar(AText), Length(AText), Rect, AFlags);
  end;
end;
{$ELSE}
function TcxCustomEditListBox.DrawItem(Index: Integer; Rect: TRect; State: TOwnerDrawState): Boolean;
var
  AFlags: Longint;
  AVertScrollBar: QScrollBarH;
  AText: WideString;
begin
  Result := DoDrawItem(Index, Rect, State);
  if Result then
    Exit;
  Result := True;

  Rect.Right := Width;
  AVertScrollBar := QScrollView_verticalScrollBar(Handle);
  if (AVertScrollBar <> nil) and QWidget_isVisible(AVertScrollBar) then
    Dec(Rect.Right, QWidget_width(AVertScrollBar));
  Canvas.FillRect(Rect);

  if (Index >= 0) and (Index < Items.Count) then
  begin
    Result := True;
    Inc(Rect.Bottom);
    Canvas.FillRect(Rect);
    AFlags := Integer(AlignmentFlags_AlignLeft) or
      {$IFDEF MSWINDOWS}Integer(AlignmentFlags_AlignTop){$ENDIF}{$IFDEF LINUX}Integer(AlignmentFlags_AlignVCenter){$ENDIF} or
      Integer(AlignmentFlags_SingleLine);
    AText := GetItem(Index);
    TCanvasAccess(Canvas.Canvas).RequiredState([csHandleValid, csFontValid]);
    Inc(Rect.Left, 3);
    QPainter_drawText(Canvas.Handle, @Rect, AFlags, @AText, -1, nil, nil);
    if (odSelected in State) or (Index = 0) and (ItemIndex = -1) then
    begin
      Dec(Rect.Left, 3);
  {$IFDEF MSWINDOWS}
      if odSelected in State then
        Canvas.Pen.Color := clHighlightText
      else
        Canvas.Pen.Color := Font.Color;
      Canvas.Canvas.DrawFocusRect(Rect);
  {$ENDIF}
  {$IFDEF LINUX}
      Canvas.DrawFocusRect(Rect);
  {$ENDIF}
    end;
  end
end;
{$ENDIF}

{$IFDEF VCL}
procedure TcxCustomEditListBox.MeasureItem(Index: Integer; var Height: Integer);
{$ELSE}
procedure TcxCustomEditListBox.MeasureItem(Control: TWinControl;
  {$IFDEF LINUX}item: QClxListBoxItemH{$ENDIF}
  {$IFDEF WIN32}{$IFNDEF DELPHI7}Index: Integer{$ELSE}item: QClxListBoxItemH{$ENDIF}{$ENDIF};
  var Height{$IFNDEF VCL}, Width{$ENDIF}: Integer);
{$ENDIF}
begin
  Height := GetItemHeight;
end;

procedure TcxCustomEditListBox.SetItemIndex(const Value: Integer);
begin
{$IFDEF VCL}
  {$IFDEF DELPHI6}
  inherited SetItemIndex(Value);
  {$ELSE}
  inherited ItemIndex := Value;
  {$ENDIF}
{$ELSE}
  inherited ItemIndex := Value;
{$ENDIF}
  DoSelectItem; // TODO ?? for CLX
end;

{$IFDEF VCL}
procedure TcxCustomEditListBox.CMShowingChanged(var Message: TMessage);
begin
  inherited;
  CallWindowProc(DefWndProc, Handle, WM_SETFOCUS, 0, 0);
end;
{$ELSE}
function TcxCustomEditListBox.GetItemIndex: Integer;
begin
  Result := inherited ItemIndex;
end;
{$ENDIF}
{$IFNDEF DELPHI6}
function TcxCustomEditListBox.GetItemIndex: Integer;
begin
  Result := inherited ItemIndex;
end;
{$ENDIF}

{ TcxCustomTextEditLookupData }

constructor TcxCustomTextEditLookupData.Create(AOwner: TPersistent);
begin
  inherited Create(nil);
  FOwner:= AOwner;
  FCurrentKey := -1;
  FItemIndex := -1;
end;

function TcxCustomTextEditLookupData.CanResizeVisualArea(var NewSize: TSize): Boolean;
begin
  Result := True;
end;

procedure TcxCustomTextEditLookupData.CloseUp;
begin
  InternalSetItemIndex(FCurrentKey);
end;

procedure TcxCustomTextEditLookupData.Deinitialize;
begin
end;

procedure TcxCustomTextEditLookupData.DropDown;
begin
end;

procedure TcxCustomTextEditLookupData.DroppedDown(const AFindStr: TCaption);
begin
end;

function TcxCustomTextEditLookupData.Find(const AText: string): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 0 to GetItemCount - 1 do
    if InternalCompareString(AText, GetItem(I), False) then
    begin
      Result := True;
      Break;
    end;
end;

function TcxCustomTextEditLookupData.GetOwner: TPersistent;
begin
  Result := FOwner;
end;

procedure TcxCustomTextEditLookupData.DoCurrentKeyChanged;
begin
  if Assigned(FOnCurrentKeyChanged) then
    FOnCurrentKeyChanged(Self);
end;

procedure TcxCustomTextEditLookupData.DoSelectItem;
begin
  if Assigned(FOnSelectItem) then
    FOnSelectItem(Self);
end;

function TcxCustomTextEditLookupData.GetItem(Index: Integer): TCaption;
begin
  Result := Edit.Properties.FLookupItems[Index];
end;

function TcxCustomTextEditLookupData.GetItemCount: Integer;
begin
  Result := Edit.Properties.FLookupItems.Count;
end;

function TcxCustomTextEditLookupData.GetDisplayText(const AKey: TcxEditValue): string;
begin
  if (AKey < 0) or (AKey >= GetItemCount) then
    Result := ''
  else
    Result := GetItem(AKey);
end;

function TcxCustomTextEditLookupData.GetListBoxClass: TcxCustomEditListBoxClass;
begin
  Result := nil;
end;

procedure TcxCustomTextEditLookupData.HandleSelectItem(Sender: TObject);
begin
  FItemIndex := FList.ItemIndex;
end;

function TcxCustomTextEditLookupData.InternalLocate(var AText, ATail: string;
  ANext, ASynchronizeWithText: Boolean): Boolean;
var
  I, IStart, J: Integer;
  L, MaxFindLen: Integer;
  S: string;
  AEditingStyle: TcxEditEditingStyle;
  AItem: TCaption;
begin
  Result := False;
  if GetItemCount = 0 then
    Exit;
  if ANext then
    IStart := ItemIndex
  else
    IStart := -1;
  I := IStart;
  L := Length(AText);
  MaxFindLen := 0;
  repeat
    Inc(I);
    if (I = GetItemCount) or (I = IStart) then
      Break;

    AItem := GetItem(I);
    S := Copy(AItem, 1, L);
    for J := 1 to Length(S) do
      if InternalCompareString(AText, S, False) then
      begin
        if J > MaxFindLen then
        begin
          MaxFindLen := J;
          if MaxFindLen = L then
          begin
            L := Length(AText);
            AText := Copy(AItem, 1, L);
            ATail := Copy(AItem, L + 1, Length(AItem) - L);
            InternalSetCurrentKey(I);
            Result := True;
            Break;
          end;
        end;
      end;
  until Result;

  AEditingStyle := Edit.Properties.EditingStyle;
  if not Result and (AEditingStyle <> esFixedList) then
    if ASynchronizeWithText or (AText = '') and not Find('') then
      InternalSetCurrentKey(-1)
    else
      if AEditingStyle = esEdit then
        InternalSetCurrentKey(-1);
end;

procedure TcxCustomTextEditLookupData.InternalSetCurrentKey(Value: Integer);
begin
  if (Value >= -1) and (Value < GetItemCount) then
  begin
    FCurrentKey := Value;
    InternalSetItemIndex(Value);
  end;
end;

function TcxCustomTextEditLookupData.GetVisualAreaPreferredSize(AMaxHeight: Integer;
  AWidth: Integer = 0): TSize;
begin
  FillChar(Result, SizeOf(Result), 0);
end;

procedure TcxCustomTextEditLookupData.Go(ADirection: TcxEditLookupDataGoDirection;
  ACircular: Boolean);
var
  ANewCurrentKey: Integer;
  AItemIndex: Integer;
begin
  if GetItemCount = 0 then
    Exit;
  ANewCurrentKey := 0;
  if ItemIndex = -1 then
    AItemIndex := CurrentKey
  else
    AItemIndex := ItemIndex;
  case ADirection of
    egdBegin:
      ANewCurrentKey := 0;
    egdEnd:
      ANewCurrentKey := GetItemCount - 1;
    egdPrev:
      begin
        ANewCurrentKey := AItemIndex - 1;
        if (ANewCurrentKey < 0) then
          if ACircular then
            ANewCurrentKey := GetItemCount - 1
          else
            ANewCurrentKey := AItemIndex;
      end;
    egdNext:
      begin
        ANewCurrentKey := AItemIndex + 1;
        if (ANewCurrentKey = GetItemCount) then
          if ACircular then
            ANewCurrentKey := 0
          else
            ANewCurrentKey := AItemIndex;
      end;
    egdPageUp:
      if AItemIndex = -1 then
        if ACircular then
          ANewCurrentKey := GetItemCount - 1
        else
          ANewCurrentKey := AItemIndex
      else
      begin
        ANewCurrentKey := AItemIndex - Edit.Properties.GetDropDownPageRowCount + 1;
        if (ANewCurrentKey < 0) then
          if ACircular then
            if AItemIndex = 0 then
              ANewCurrentKey := GetItemCount - 1
            else
              ANewCurrentKey := 0
          else
            ANewCurrentKey := 0;
      end;
    egdPageDown:
      begin
        if AItemIndex = -1 then
          ANewCurrentKey := AItemIndex + Edit.Properties.GetDropDownPageRowCount
        else
          ANewCurrentKey := AItemIndex + Edit.Properties.GetDropDownPageRowCount - 1;
        if (ANewCurrentKey >= GetItemCount) then
          if ACircular then
            if AItemIndex = GetItemCount - 1 then
              ANewCurrentKey := 0
            else
              ANewCurrentKey := GetItemCount - 1
          else
            ANewCurrentKey := GetItemCount - 1;
      end;
  end;
  if (FList = nil) or not FList.IsVisible or Edit.Properties.ImmediateUpdateText then
    CurrentKey := ANewCurrentKey
  else
    InternalSetItemIndex(ANewCurrentKey);
end;

procedure TcxCustomTextEditLookupData.Initialize(AVisualControlsParent: TWinControl);
begin
  if (FList = nil) and (GetListBoxClass <> nil) then
    FList := GetListBoxClass.Create(AVisualControlsParent);
  with TcxCustomEditListBoxAccess(FList) do
  begin
    Color := Edit.Style.Color;
    Font := Edit.Style.Font;
    Canvas.Font := Font;
    Parent := AVisualControlsParent;
    OnSelectItem := HandleSelectItem;
    SetItemCount(GetItemCount);
    ItemIndex := FItemIndex;
    RecreateWindow;
  end;
  TextChanged;
end;

function TcxCustomTextEditLookupData.IsEmpty: Boolean;
begin
  Result := GetItemCount = 0;
end;

function TcxCustomTextEditLookupData.IsMouseOverList(const P: TPoint): Boolean;
begin
  Result := PtInRect(FList.BoundsRect, FList.ScreenToClient(P));
end;

procedure TcxCustomTextEditLookupData.ListChanged;
begin
  if FList <> nil then
    TcxCustomEditListBoxAccess(FList).SetItemCount(GetItemCount);
end;

procedure TcxCustomTextEditLookupData.SetListItemIndex(Value: Integer);
begin
  FList.ItemIndex := Value;
{$IFNDEF VCL}
  QListBox_ensureCurrentVisible(FList.Handle);
{$ENDIF}
end;

function TcxCustomTextEditLookupData.Locate(var AText, ATail: string; ANext: Boolean): Boolean;
begin
  Result := InternalLocate(AText, ATail, ANext, False);
end;

procedure TcxCustomTextEditLookupData.PositionVisualArea(const AClientRect: TRect);
begin
  with AClientRect do
    FList.SetBounds(Left, Top, Right - Left, Bottom - Top);
end;

procedure TcxCustomTextEditLookupData.PropertiesChanged;
begin
  ListChanged;
end;

procedure TcxCustomTextEditLookupData.SelectItem;
var
  APrevCurrentKey: TcxEditValue;
begin
  if FItemIndex = -1 then
    Exit;
  APrevCurrentKey := CurrentKey;
  CurrentKey := FItemIndex;
  if VarEqualsExact(APrevCurrentKey, CurrentKey) then
    DoSelectItem;
end;

function TcxCustomTextEditLookupData.GetActiveControl: TControl;
begin
  Result := FList;
end;

function TcxCustomTextEditLookupData.GetCurrentKey: TcxEditValue;
begin
  Result := FCurrentKey;
end;

function TcxCustomTextEditLookupData.GetOnCurrentKeyChanged: TNotifyEvent;
begin
  Result := FOnCurrentKeyChanged;
end;

function TcxCustomTextEditLookupData.GetOnSelectItem: TNotifyEvent;
begin
  Result := FOnSelectItem;
end;

function TcxCustomTextEditLookupData.GetEdit: TcxCustomTextEdit;
begin
  Result := TcxCustomTextEdit(FOwner);
end;

function TcxCustomTextEditLookupData.GetItems: TStrings;
begin
  Result := Edit.Properties.FLookupItems;
end;

function TcxCustomTextEditLookupData.GetProperties: TcxCustomTextEditProperties;
begin
  Result := Edit.Properties;
end;

procedure TcxCustomTextEditLookupData.InternalSetItemIndex(Value: Integer);
begin
  if (Value < -1) or (Value >= GetItemCount) or (Value = FItemIndex) then
    Exit;
  if (FList <> nil) and (GetItemCount > 0) then
  begin
    if Value = -1 then
      SetListItemIndex(0);
    SetListItemIndex(Value);
  end;
  FItemIndex := Value;
end;

procedure TcxCustomTextEditLookupData.SetCurrentKey(const AKey: TcxEditValue);
var
  APrevCurrentKey: TcxEditValue;
begin
  APrevCurrentKey := FCurrentKey;
  InternalSetCurrentKey(AKey);
  if Edit <> nil then
    Edit.LockLookupDataTextChanged;
  try
    if not VarEqualsExact(APrevCurrentKey, FCurrentKey) or ((AKey >= 0) and (AKey < GetItemCount) and not InternalCompareString(Edit.Text, GetItem(AKey), True)) then
      DoSelectItem;
  finally
    if Edit <> nil then
      Edit.UnlockLookupDataTextChanged;
  end;
end;

procedure TcxCustomTextEditLookupData.SetItemIndex(Value: Integer);
begin
  if (FList = nil) or not FList.IsVisible or Edit.Properties.ImmediateUpdateText then
    CurrentKey := Value
  else
    InternalSetItemIndex(Value);
end;

procedure TcxCustomTextEditLookupData.SetItems(Value: TStrings);
begin
  Edit.Properties.FLookupItems.Assign(Value);
end;

procedure TcxCustomTextEditLookupData.SetOnCurrentKeyChanged(Value: TNotifyEvent);
begin
  FOnCurrentKeyChanged := Value;
end;

procedure TcxCustomTextEditLookupData.SetOnSelectItem(Value: TNotifyEvent);
begin
  FOnSelectItem := Value;
end;

procedure TcxCustomTextEditLookupData.TextChanged;
var
  AText, ATail: string;
begin
  AText := Edit.Text;
  if not InternalCompareString(GetDisplayText(ItemIndex), AText, False) then
    InternalLocate(AText, ATail, False, True);
end;

{ TcxCustomTextEditViewData }

procedure TcxCustomTextEditViewData.Calculate(ACanvas: TcxCanvas; const ABounds: TRect;
  const P: TPoint; Button: TcxMouseButton; Shift: TShiftState; AViewInfo: TcxCustomEditViewInfo;
  AIsMouseEvent: Boolean);
begin
  inherited Calculate(ACanvas, ABounds, P, Button, Shift, AViewInfo, AIsMouseEvent);
  with AViewInfo as TcxCustomTextEditViewInfo do
  begin
    DrawSelectionBar := False;
    EditingStyle := Properties.EditingStyle;
    Font := Style.Font;
    IsEditClass := GetIsEditClass;
    if Edit <> nil then
      TcxCustomTextEditViewInfo(AViewInfo).HasPopupWindow := Edit.HasPopupWindow
    else
      TcxCustomTextEditViewInfo(AViewInfo).HasPopupWindow := False;
    CalculateTextEditViewInfo(ACanvas, Self, TcxCustomTextEditViewInfo(AViewInfo), AIsMouseEvent);
    MaxLineCount := Self.MaxLineCount;
    TextOutData.Initialized := False;
  end;
  PrepareDrawTextFlags(ACanvas, AViewInfo);
end;

procedure TcxCustomTextEditViewData.DisplayValueToDrawValue(const ADisplayValue: TcxEditValue;
  AViewInfo: TcxCustomEditViewInfo);
begin
  Properties.DisplayValueToDisplayText(ADisplayValue, TcxCustomTextEditViewInfo(AViewInfo).Text);
end;

procedure TcxCustomTextEditViewData.EditValueToDrawValue(ACanvas: TcxCanvas;
  const AEditValue: TcxEditValue; AViewInfo: TcxCustomEditViewInfo);
begin
  if FIsValueEditorWithValueFormatting then
    DisplayValueToDrawValue(VarToStr(AEditValue), AViewInfo)
  else
    DisplayValueToDrawValue(Properties.GetDefaultDisplayValue(AEditValue, InternalFocused), AViewInfo);
  PrepareSelection(AViewInfo);
end;

function TcxCustomTextEditViewData.GetClientExtent(AViewInfo: TcxCustomEditViewInfo): TRect;
begin
  Result := inherited GetClientExtent(AViewInfo);
{$IFDEF VCL}
  if not IsInplace and IsComboBoxStyle and
      AreVisualStylesMustBeUsed(Style.LookAndFeel.NativeStyle, totEdit) then
    Inc(Result.Right);
{$ENDIF}
end;

function TcxCustomTextEditViewData.GetDrawTextFlags: DWORD;
const
  AHorzAlignmentFlags: array [TcxEditHorzAlignment] of DWORD = (
    CXTO_LEFT, CXTO_RIGHT, CXTO_CENTER_HORIZONTALLY
  );
  AVertAlignmentFlags: array [TcxEditVertAlignment] of DWORD = (
    CXTO_TOP, CXTO_BOTTOM, CXTO_CENTER_VERTICALLY
  );
begin
  Result := AHorzAlignmentFlags[HorzAlignment];
  Result := Result or AVertAlignmentFlags[VertAlignment];
  Result := Result or CXTO_SINGLELINE;
  Result := Result or CXTO_PREVENT_LEFT_EXCEED or CXTO_PREVENT_TOP_EXCEED;
end;

function TcxCustomTextEditViewData.GetDrawTextOffset: TRect;
begin
  Result := GetTextEditDrawTextOffset(Self);
end;

function TcxCustomTextEditViewData.GetEditContentSize(ACanvas: TcxCanvas;
  const AEditValue: TcxEditValue; const AEditSizeProperties: TcxEditSizeProperties): TSize;
var
  AContentSize: TSize;
  ADisplayValue: TcxEditValue;
  AText: TCaption;
begin
  AContentSize := inherited GetEditContentSize(ACanvas, AEditValue,
    AEditSizeProperties);
  if FIsValueEditorWithValueFormatting then
    ADisplayValue := VarToStr(AEditValue)
  else
    ADisplayValue := Properties.GetDefaultDisplayValue(AEditValue, InternalFocused);
  Properties.DisplayValueToDisplayText(ADisplayValue, AText);
  Result := GetTextEditContentSize(ACanvas, Self, AText,
    GetDrawTextFlags, @AEditSizeProperties);
  CheckSize(Result, AContentSize);
end;

procedure TcxCustomTextEditViewData.PrepareSelection(AViewInfo: TcxCustomEditViewInfo);
begin
  with TcxCustomTextEditViewInfo(AViewInfo) do
  begin
    SelStart := Self.SelStart;
    SelLength := Self.SelLength;
    if SelLength = 0 then
      Exit;
    if Self.SelTextColor = clDefault then
      SelTextColor := clHighlightText
    else
      SelTextColor := Self.SelTextColor;
    if Self.SelBackgroundColor = clDefault then
      SelBackgroundColor := clHighlight
    else
      SelBackgroundColor := Self.SelBackgroundColor;
  end;
end;

function TcxCustomTextEditViewData.GetIsEditClass: Boolean;
begin
  Result := (Edit <> nil) and TcxCustomEditAccess(Edit).IsEditClass;
end;

procedure TcxCustomTextEditViewData.InitCacheData;
begin
  inherited InitCacheData;
  FIsValueEditorWithValueFormatting := Properties.IsValueEditorWithValueFormatting;
end;

function TcxCustomTextEditViewData.IsComboBoxStyle: Boolean;
begin
  Result := False;
end;

procedure TcxCustomTextEditViewData.PrepareDrawTextFlags(ACanvas: TcxCanvas;
  AViewInfo: TcxCustomEditViewInfo);
begin
  with TcxCustomTextEditViewInfo(AViewInfo) do
  begin
    if not Properties.IsMultiLine and (esoAutoHeight in Properties.GetSupportedOperations) and
        (epoAutoHeight in Self.PaintOptions) then
      PrepareTextEditDrawTextFlags(ACanvas, Self, TcxCustomTextEditViewInfo(AViewInfo))
    else
      DrawTextFlags := GetDrawTextFlags;
    if epoShowEndEllipsis in PaintOptions then
      DrawTextFlags := DrawTextFlags or CXTO_END_ELLIPSIS;
    ComboBoxStyle := IsComboBoxStyle;
  end;
end;

function TcxCustomTextEditViewData.GetProperties: TcxCustomTextEditProperties;
begin
  Result := TcxCustomTextEditProperties(FProperties);
end;

procedure TcxCustomTextEditViewData.SetProperties(Value: TcxCustomTextEditProperties);
begin
  FProperties := Value;
end;

{ TcxCustomTextEditViewInfo }

destructor TcxCustomTextEditViewInfo.Destroy;
begin
  TextOutData.TextRows := nil;
  inherited Destroy;
end;

procedure TcxCustomTextEditViewInfo.DrawText(ACanvas: TcxCanvas);
begin
  DrawEditText(ACanvas, Self);
end;

function TcxCustomTextEditViewInfo.NeedShowHint(ACanvas: TcxCanvas;
  const P: TPoint; AVisibleBounds: TRect; out AText: TCaption;
  out AIsMultiLine: Boolean; out ATextRect: TRect): Boolean;
var
  AFlags: Integer;
  APoint: TPoint;
  ARowCount: Integer;
  ARowText: TCaption;
  ASize: TSize;
  ATextParams: TcxTextParams;
  ATextRows: TcxTextRows;
  ATextWidth, ATextBottom: Integer;
  I, L: Integer;
  R: TRect;
begin
  AFlags := 0;
  APoint := Point(P.X - Left, P.Y - Top);
  if EqualRect(AVisibleBounds, cxEmptyRect) then
    AVisibleBounds := TextRect
  else
  begin
    OffsetRect(AVisibleBounds, -Left, -Top);
    IntersectRect(AVisibleBounds, TextRect, AVisibleBounds);
  end;
  Result := PtInRect(AVisibleBounds, APoint);
  if Result then
  begin
    ACanvas.Font := Font;
    AFlags := DrawTextFlags or CXTO_CALCROWCOUNT;
    AFlags := AFlags and not(CXTO_CENTER_VERTICALLY or CXTO_BOTTOM) or CXTO_TOP;
    R := TextRect;
    if DrawTextFlags and CXTO_SINGLELINE <> 0 then
      R.Right := MaxInt;
    R.Bottom := MaxInt;
    ATextParams := cxCalcTextParams(ACanvas.Canvas, AFlags);
    ATextRows := nil;
    Result := not cxMakeTextRows(ACanvas.Canvas, PcxCaptionChar(Text), R,
      ATextParams, ATextRows, ARowCount, MaxLineCount);
    if not Result then
    begin
      L := R.Left;
      ATextWidth := R.Right - R.Left;
      ATextBottom := TextRect.Top;
      for I := 0 to ARowCount - 1 do
      begin
        ARowText := TrimRight(Copy(ATextRows[I].Text, 1, ATextRows[I].TextLength));
{$IFDEF VCL}
        GetTextExtentPoint32(ACanvas.Handle, PAnsiChar(ARowText), Length(ARowText), ASize);
{$ELSE}
        QPainter_boundingRect(ACanvas.Handle, @R, @R, 0, @ARowText, Length(ARowText), nil);
        ASize.cx := R.Right - R.Left;
        ASize.cy := R.Bottom - R.Top;
{$ENDIF}
        Inc(ATextBottom, ASize.cy);
        if (ASize.cx > ATextWidth) or (L + ASize.cx > AVisibleBounds.Right) or (ATextBottom > AVisibleBounds.Bottom) then
        begin
          Result := True;
          Break;
        end;
      end;
    end;
  end;
  if Result then
  begin
    AIsMultiLine := AFlags and CXTO_SINGLELINE = 0;
    AText := Text;
    ATextRect := TextRect;
    OffsetRect(ATextRect, Left, Top);
  end;
end;

procedure TcxCustomTextEditViewInfo.Offset(DX, DY: Integer);
var
  I: Integer;
begin
  inherited Offset(DX, DY);
  OffsetRect(TextRect, DX, DY);
  with TextOutData do
    if Initialized then
    begin
      OffsetRect(TextRect, DX, DY);
      for I := 0 to Length(TextRows) - 1 do
        with TextRows[I] do
        begin
          TextOriginX := TextOriginX + DX;
          TextOriginY := TextOriginY + DY;
        end;
    end;
end;

procedure TcxCustomTextEditViewInfo.PrepareCanvasFont(AFont: TFont);
begin
end;

procedure TcxCustomTextEditViewInfo.InternalPaint(ACanvas: TcxCanvas);
begin
  DrawTextEdit(ACanvas, Self);
end;

{ TcxCustomTextEditProperties }

constructor TcxCustomTextEditProperties.Create(AOwner: TPersistent);
begin
  inherited Create(AOwner);
  FCharCase := ecNormal;
  FEchoMode := eemNormal;
  FFixedListSelection := True;
  FHideSelection := True;
  FLookupItems := TStringList.Create;
  FLookupItems.OnChange := LookupItemsChanged;
end;

destructor TcxCustomTextEditProperties.Destroy;
begin
  FreeAndNil(FLookupItems);
  inherited Destroy;
end;

procedure TcxCustomTextEditProperties.Assign(Source: TPersistent);
begin
  if Source is TcxCustomTextEditProperties then
  begin
    BeginUpdate;
    try
      inherited Assign(Source);
      with Source as TcxCustomTextEditProperties do
      begin
        Self.CharCase := CharCase;
        Self.EchoMode := EchoMode;
        Self.FixedListSelection := FixedListSelection;
        Self.HideCursor := HideCursor;
        Self.HideSelection := HideSelection;
        Self.MaxLength := MaxLength;
        Self.ValidChars := ValidChars;

        Self.AssignedValues.MaxValue := False;
        if AssignedValues.MaxValue then
          Self.MaxValue := MaxValue;

        Self.AssignedValues.MinValue := False;
        if AssignedValues.MinValue then
          Self.MinValue := MinValue;

{$IFDEF VCL}
        Self.OEMConvert := OEMConvert;
{$ENDIF}

        Self.ImmediateUpdateText := ImmediateUpdateText;
        Self.LookupItemsSorted := False;
        Self.LookupItems.Assign(LookupItems);
        Self.LookupItemsSorted := LookupItemsSorted;

        Self.OnNewLookupDisplayText := OnNewLookupDisplayText;
      end;
    finally
      EndUpdate;
    end
  end
  else
    inherited Assign(Source);
end;

class function TcxCustomTextEditProperties.GetContainerClass: TcxContainerClass;
begin
  Result := TcxTextEdit;
end;

function TcxCustomTextEditProperties.GetDisplayText(const AEditValue: TcxEditValue;
  AFullText: Boolean = False): WideString;
var
  ADisplayValue: TcxEditValue;
  AText: TCaption;
begin
  ADisplayValue := '';
  try
    ADisplayValue := GetDefaultDisplayValue(AEditValue, False);
  finally
    DisplayValueToDisplayText(ADisplayValue, AText);
    Result := AText;
  end;
end;

function TcxCustomTextEditProperties.GetSupportedOperations: TcxEditSupportedOperations;
begin
  Result := [esoAutoHeight, esoFiltering, esoHorzAlignment, esoIncSearch, esoSorting];
  if Buttons.Count > 0 then
    Include(Result, esoHotTrack);
end;

class function TcxCustomTextEditProperties.GetViewInfoClass: TcxContainerViewInfoClass;
begin
  Result := TcxCustomTextEditViewInfo;
end;

function TcxCustomTextEditProperties.IsDisplayValueValid(var DisplayValue: TcxEditValue; AEditFocused: Boolean): Boolean;
var
  AText: TCaption;
begin
  AText := VarToStr(DisplayValue);
  Result := not((AText <> '') and (EditingStyle in [esEditList, esFixedList]) and
    UseLookupData and not FindLookupText(AText));
  if Result then
  begin
    CheckCharsRegister(AText, CharCase);
    DisplayValue := AText;
  end;
end;

function TcxCustomTextEditProperties.IsEditValueValid(var EditValue: TcxEditValue; AEditFocused: Boolean): Boolean;
begin
  Result := VarIsNull(EditValue) or not VarIsStr(EditValue) or
    IsDisplayValueValid(EditValue, AEditFocused);
end;

procedure TcxCustomTextEditProperties.PrepareDisplayValue(const AEditValue: TcxEditValue;
  var DisplayValue: TcxEditValue; AEditFocused: Boolean);
begin
  DisplayValue := VarToStr(AEditValue);
end;

procedure TcxCustomTextEditProperties.SetMinMaxValues(AMinValue, AMaxValue: Double);
begin
  if AMinValue > AMaxValue then
    AMinValue := AMaxValue;

  if AssignedValues.MaxValue and (AMaxValue = FMaxValue) and
      AssignedValues.MinValue and (AMinValue = FMinValue) then
    Exit;

  AssignedValues.MaxValue := True;
  FMaxValue := AMaxValue;
  AssignedValues.MinValue := True;
  FMinValue := AMinValue;

  Changed;
end;

procedure TcxCustomTextEditProperties.ValidateDisplayValue(var DisplayValue: TcxEditValue;
  var ErrorText: TCaption; var Error: Boolean; AEdit: TcxCustomEdit);
begin
  if IsEditValueNumeric and (MinValue <> MaxValue) then
    CheckEditorValueBounds(DisplayValue, ErrorText, Error, AEdit);
  inherited ValidateDisplayValue(DisplayValue, ErrorText, Error, AEdit);
end;

procedure TcxCustomTextEditProperties.AlignmentChangedHandler(Sender: TObject);
begin
  BeginUpdate;

  inherited AlignmentChangedHandler(Sender);

  EndUpdate;
end;

procedure TcxCustomTextEditProperties.BaseSetAlignment(Value: TcxEditAlignment);
begin
  BeginUpdate;

  inherited BaseSetAlignment(Value);

  EndUpdate;
end;

function TcxCustomTextEditProperties.CanValidate: Boolean;
begin
  Result := True;
end;

function TcxCustomTextEditProperties.CompareEditValue: Boolean;
begin
  Result := True;
end;

class function TcxCustomTextEditProperties.GetAssignedValuesClass: TcxCustomEditPropertiesValuesClass;
begin
  Result := TcxTextEditPropertiesValues;
end;

function TcxCustomTextEditProperties.GetDisplayFormatOptions: TcxEditDisplayFormatOptions;
begin
  Result := [dfoSupports];
end;

function TcxCustomTextEditProperties.GetValidateErrorText(AErrorKind: TcxEditErrorKind): TCaption;
begin
  if AErrorKind = ekValueOutOfBounds then
    Result := cxGetResourceString(@cxSEditValueOutOfBounds)
  else
    Result := inherited GetValidateErrorText(AErrorKind);
end;

class function TcxCustomTextEditProperties.GetViewDataClass: TcxCustomEditViewDataClass;
begin
  Result := TcxCustomTextEditViewData;
end;

function TcxCustomTextEditProperties.GetEditingStyle: TcxEditEditingStyle;
begin
  if FHideCursor then
    Result := esNoEdit
  else
    Result := esEdit;
end;

class function TcxCustomTextEditProperties.GetLookupDataClass: TcxInterfacedPersistentClass;
begin
  Result := TcxCustomTextEditLookupData;
end;

function TcxCustomTextEditProperties.GetEditValueSource(AEditFocused: Boolean): TcxDataEditValueSource;
begin
  Result := evsText;
end;

function TcxCustomTextEditProperties.HasDisplayValue: Boolean;
begin
  Result := True;
end;

function TcxCustomTextEditProperties.IsResetEditClass: Boolean;
begin
  Result := EditingStyle <> esNoEdit;
end;

function TcxCustomTextEditProperties.WantNavigationKeys: Boolean;
begin
  Result := True;
end;

procedure TcxCustomTextEditProperties.CheckEditorValueBounds(var DisplayValue: TcxEditValue;
  var ErrorText: TCaption; var Error: Boolean; AEdit: TcxCustomEdit);
var
  AEditValue: TcxEditValue;
begin
  AEdit.PrepareEditValue(DisplayValue, AEditValue, AEdit.InternalFocused);
  if (VarIsNumericEx(AEditValue) or VarIsDate(AEditValue)) and
    ((AEditValue < MinValue) or (AEditValue > MaxValue)) then
  begin
    Error := True;
    ErrorText := GetValidateErrorText(ekValueOutOfBounds);
  end;
end;

procedure TcxCustomTextEditProperties.CheckValueBounds(var Value: Double);
begin
  if MinValue <> MaxValue then
    if Value < MinValue then
      Value := MinValue
    else if Value > MaxValue then
      Value := MaxValue;
end;

function TcxCustomTextEditProperties.DefaultFocusedDisplayValue: TcxEditValue;
begin
  Result := '';
end;

procedure TcxCustomTextEditProperties.DisplayValueToDisplayText(const ADisplayValue: TcxEditValue;
  var DisplayText: TCaption);
begin
  DisplayText := ADisplayValue;
  if EchoMode <> eemNormal then
{$IFNDEF VCL}
    if EchoMode = eemNone then
      DisplayText := ''
    else
{$ENDIF}
      DisplayText := StringOfChar('*', Length(DisplayText));
  if CharCase <> ecNormal then
    CheckCharsRegister(DisplayText, CharCase);
end;

procedure TcxCustomTextEditProperties.DoNewLookupDisplayText(AEdit: TcxCustomTextEdit;
  const AText: TCaption);
begin
  if Assigned(FOnNewLookupDisplayText) then
    FOnNewLookupDisplayText(AEdit, AText);
end;

function TcxCustomTextEditProperties.FindLookupText(const AText: string): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 0 to FLookupItems.Count - 1 do
    if InternalCompareString(AText, FLookupItems[I], False) then
    begin
      Result := True;
      Break;
    end;
end;

function TcxCustomTextEditProperties.GetDefaultDisplayValue(const AEditValue: TcxEditValue; AEditFocused: Boolean): TcxEditValue;
var
  AValue: TcxEditValue;
begin
  AValue := AEditValue;
  if IsEditValueValid(AValue, AEditFocused) then
    PrepareDisplayValue(AValue, Result, AEditFocused)
  else
    if VarIsDate(AEditValue) then
      Result := DateTimeToStr(AEditValue)
    else
      Result := VarToStr(AEditValue)
end;

function TcxCustomTextEditProperties.GetDefaultMaxLength: Integer;
begin
  if IDefaultValuesProvider = nil then
    Result := 0
  else
    Result := IDefaultValuesProvider.DefaultMaxLength;
end;

function TcxCustomTextEditProperties.GetDropDownPageRowCount: Integer;
begin
  Result := cxEditDefaultDropDownPageRowCount;
end;

function TcxCustomTextEditProperties.IsEditValueNumeric: Boolean;
begin
  Result := False;
end;

function TcxCustomTextEditProperties.IsLookupDataVisual: Boolean;
begin
  Result := False;
end;

function TcxCustomTextEditProperties.IsMultiLine: Boolean;
begin
  Result := False;
end;

function TcxCustomTextEditProperties.IsPopupKey(Key: Word; Shift: TShiftState): Boolean;
begin
  Result := False;
end;

procedure TcxCustomTextEditProperties.LookupDataChanged(Sender: TObject);
begin
  Changed;
end;

procedure TcxCustomTextEditProperties.SetCharCase(Value: TEditCharCase);
begin
  if Value <> FCharCase then
  begin
    FCharCase := Value;
    Changed;
  end;
end;

procedure TcxCustomTextEditProperties.SetMaxLength(Value: Integer);
begin
  if Value < 0 then Value := 0;

  if AssignedValues.MaxLength and (Value = FMaxLength) then
    Exit;

  AssignedValues.MaxLength := True;
  FMaxLength := Value;

  Changed;
end;

function TcxCustomTextEditProperties.UseLookupData: Boolean;
begin
  Result := GetLookupDataClass <> nil;
end;

function TcxCustomTextEditProperties.GetAssignedValues: TcxTextEditPropertiesValues;
begin
  Result := TcxTextEditPropertiesValues(FAssignedValues);
end;

function TcxCustomTextEditProperties.GetInnerEditMaxLength: Integer;
begin
  Result := GetMaxLength;
{$IFNDEF VCL}
  if Result = 0 then
    Result := -1;
{$ENDIF}
end;

function TcxCustomTextEditProperties.GetLookupItems: TStrings;
begin
  Result := FLookupItems;
end;

function TcxCustomTextEditProperties.GetLookupItemsSorted: Boolean;
begin
  Result := FLookupItems.Sorted;
end;

function TcxCustomTextEditProperties.GetMaxLength: Integer;
begin
  if AssignedValues.MaxLength then
    Result := FMaxLength
  else
    Result := GetDefaultMaxLength;
end;

function TcxCustomTextEditProperties.GetMaxValue: Double;
begin
  if AssignedValues.MaxValue then
    Result := FMaxValue
  else
    if IDefaultValuesProvider = nil then
      Result := 0
    else
      Result := IDefaultValuesProvider.DefaultMaxValue;
end;

function TcxCustomTextEditProperties.GetMinValue: Double;
begin
  if AssignedValues.MinValue then
    Result := FMinValue
  else
    if IDefaultValuesProvider = nil then
      Result := 0
    else
      Result := IDefaultValuesProvider.DefaultMinValue;
end;

function TcxCustomTextEditProperties.IsMaxLengthStored: Boolean;
begin
  Result := AssignedValues.MaxLength;
end;

function TcxCustomTextEditProperties.IsMaxValueStored: Boolean;
begin
  Result := AssignedValues.MaxValue;
end;

function TcxCustomTextEditProperties.IsMinValueStored: Boolean;
begin
  Result := AssignedValues.MinValue;
end;

procedure TcxCustomTextEditProperties.LookupItemsChanged(Sender: TObject);
begin
  Changed;
end;

procedure TcxCustomTextEditProperties.SetEchoMode(Value: TcxEditEchoMode);
begin
  if Value <> FEchoMode then
  begin
    FEchoMode := Value;
    Changed;
  end;
end;

procedure TcxCustomTextEditProperties.SetFixedListSelection(Value: Boolean);
begin
  if Value <> FFixedListSelection then
  begin
    FFixedListSelection := Value;
    if EditingStyle = esFixedList then
      Changed;
  end;
end;

procedure TcxCustomTextEditProperties.SetHideCursor(Value: Boolean);
begin
  if Value <> FHideCursor then
  begin
    FHideCursor := Value;
    Changed;
  end;
end;

procedure TcxCustomTextEditProperties.SetHideSelection(Value: Boolean);
begin
  if Value <> FHideSelection then
  begin
    FHideSelection := Value;
    Changed;
  end;
end;

procedure TcxCustomTextEditProperties.SetLookupItems(Value: TStrings);
begin
  FLookupItems.Assign(Value);
end;

procedure TcxCustomTextEditProperties.SetLookupItemsSorted(Value: Boolean);
begin
  FLookupItems.Sorted := Value;
end;

procedure TcxCustomTextEditProperties.SetMaxValue(Value: Double);
begin
  if AssignedValues.MinValue and (Value < FMinValue) then
    Value := FMinValue;
  if AssignedValues.MaxValue and (Value = FMaxValue) then
    Exit;

  AssignedValues.MaxValue := True;
  FMaxValue := Value;

  Changed;
end;

procedure TcxCustomTextEditProperties.SetMinValue(Value: Double);
begin
  if AssignedValues.MaxValue and (Value > FMaxValue) then
    Value := FMaxValue;
  if AssignedValues.MinValue and (Value = FMinValue) then
    Exit;

  AssignedValues.MinValue := True;
  FMinValue := Value;

  Changed;
end;

{$IFDEF VCL}
procedure TcxCustomTextEditProperties.SetOEMConvert(Value: Boolean);
begin
  if Value <> FOEMConvert then
  begin
    FOEMConvert := Value;
    Changed;
  end;
end;
{$ENDIF}

{ TcxTextEditProperties }

{ TcxCustomTextEdit }

constructor TcxCustomTextEdit.Create(AOwner: TComponent);
var
  ALookupDataClass: TcxInterfacedPersistentClass;
begin
  inherited Create(AOwner);
  FIsCreating := True;

  FBeepOnEnter := True;
  FFindSelection := False;

  if InnerTextEdit <> nil then
    TControlAccess(InnerTextEdit.Control).Color := clWindow;
  ParentColor := False;
  Width := 121;
  Height := 21;

  ALookupDataClass := Properties.GetLookupDataClass;
  if ALookupDataClass <> nil then
  begin
    FLookupData := ALookupDataClass.Create(Self);
    ILookupData.OnSelectItem := HandleSelectItem;
  end;

  FIsCreating := False;
end;

destructor TcxCustomTextEdit.Destroy;
begin
  if FLookupData <> nil then
    FreeAndNil(FLookupData);
  inherited Destroy;
end;

procedure TcxCustomTextEdit.Activate(var AEditData: TcxCustomEditData);
begin
  inherited Activate(AEditData);
  if HandleAllocated then
  begin
    SelStart := 0;
    if Properties.AutoSelect then
      SelectAll;
  end;
end;

class function TcxCustomTextEdit.GetPropertiesClass: TcxCustomEditPropertiesClass;
begin
  Result := TcxTextEditProperties;
end;

procedure TcxCustomTextEdit.Clear;
begin
  SetDisplayText('');
end;

procedure TcxCustomTextEdit.ClearSelection;
var
  APrevSelStart: Integer;
  AText: TCaption;
begin
  if SelLength = 0 then
    Exit;
  AText := DisplayValue;
  Delete(AText, SelStart + 1, SelLength);
  APrevSelStart := SelStart;
  if SetDisplayText(AText) then
    SelStart := APrevSelStart;
end;

procedure TcxCustomTextEdit.CopyToClipboard;
begin
  if Properties.EditingStyle in [esFixedList, esNoEdit] then
    SelectAll;
  if SelLength > 0 then
    InnerTextEdit.CopyToClipboard;
end;

procedure TcxCustomTextEdit.CutToClipboard;
var
  AEditingStyle: TcxEditEditingStyle;
  APrevSelStart: Integer;
  AText: TCaption;
begin
  AEditingStyle := Properties.EditingStyle;
  if KeyboardAction and (AEditingStyle = esNoEdit) then
    Exit;
  if AEditingStyle in [esFixedList, esNoEdit] then
    SelectAll;
  if SelLength = 0 then
    Exit;
  InnerTextEdit.CopyToClipboard;
  AText := DisplayValue;
  Delete(AText, SelStart + 1, SelLength);
  APrevSelStart := SelStart;
  if SetDisplayText(AText) then
    SelStart := APrevSelStart;
end;

procedure TcxCustomTextEdit.PasteFromClipboard;
begin
{$IFDEF VCL}
  if Clipboard.HasFormat(CF_TEXT) then
{$ELSE}
  if Clipboard.Provides('text/plain') then
{$ENDIF}
    SelText := Clipboard.AsText;
end;

procedure TcxCustomTextEdit.PrepareEditValue(const ADisplayValue: TcxEditValue;
  out EditValue: TcxEditValue; AEditFocused: Boolean);
begin
  EditValue := ADisplayValue;
end;

procedure TcxCustomTextEdit.SelectAll;
begin
  InnerTextEdit.SelectAll;
end;

procedure TcxCustomTextEdit.SetSelection(ASelStart: Integer; ASelLength: Integer);
begin
  SelStart := ASelStart;
  SelLength := ASelLength;
end;

procedure TcxCustomTextEdit.Undo;
begin
  ResetEditValue;
end;

procedure TcxCustomTextEdit.AdjustInnerEditPosition(AInnerEditHeight: Integer);
var
  AInnerEditBounds: TRect;
  AInnerEditTop: Integer;
  R: TRect;
{$IFNDEF VCL}
  AHorzAlignment: TcxEditHorzAlignment;
{$ENDIF}
begin
  if (InnerTextEdit = nil) or FInnerEditPositionAdjusting then
    Exit;
  FInnerEditPositionAdjusting := True;
  try
    AInnerEditTop := 0;
{$IFNDEF VCL}
    if Focused and Properties.UseLeftAlignmentOnEditing then
      AHorzAlignment := taLeftJustify
    else
      AHorzAlignment := TcxCustomTextEditProperties(Properties).Alignment.Horz;
{$ENDIF}
    with ViewInfo.ClientRect do
    begin
      case TcxCustomTextEditProperties(Properties).Alignment.Vert of
        taTopJustify:
{$IFDEF WIN32}
  {$IFDEF VCL}
          AInnerEditTop := Top + 1;
  {$ELSE}
          AInnerEditTop := Top + Integer(IsInplace);
  {$ENDIF}
{$ELSE}
          AInnerEditTop := Top;
{$ENDIF}
        taBottomJustify:
          begin
{$IFDEF WIN32}
  {$IFDEF VCL}
            AInnerEditTop := Bottom - AInnerEditHeight + 1;
            if IsInplace then
            begin
              if ViewInfo.EditNativeState <> TC_NONE then
                Inc(AInnerEditTop, 1);
              if AInnerEditTop < Top + 1 then
                AInnerEditTop := Top + 1;
            end;
  {$ELSE}
            AInnerEditTop := Bottom - AInnerEditHeight + Integer(IsInplace);
            if IsInplace and (AInnerEditTop < Top + 1) then
              AInnerEditTop := Top + 1;
  {$ENDIF}
{$ENDIF}
{$IFDEF LINUX}
            AInnerEditTop := Bottom - AInnerEditHeight + 1;
            if IsInplace and (AInnerEditTop < Top + Integer(IsInplace)) then
              AInnerEditTop := Top + Integer(IsInplace);
{$ENDIF}
{$IFDEF LINUX}
            Dec(AInnerEditTop);
{$ENDIF}
          end;
        taVCenter:
          begin
{$IFDEF WIN32}
  {$IFDEF VCL}
            AInnerEditTop := Bottom - Top - AInnerEditHeight;
            if IsInplace and (ViewInfo.EditNativeState <> TC_NONE) then
              Inc(AInnerEditTop);
            AInnerEditTop := Top + (AInnerEditTop) div 2 + 1;
            if IsInplace and (AInnerEditTop < Top + 1) then
              AInnerEditTop := Top + 1;
  {$ELSE}
            AInnerEditTop := Top + (Bottom - Top - AInnerEditHeight) div 2 + Integer(IsInplace);
            if IsInplace and (AInnerEditTop < Top + Integer(IsInplace)) then
              AInnerEditTop := Top + Integer(IsInplace);
  {$ENDIF}
{$ENDIF}
{$IFDEF LINUX}
            AInnerEditTop := Top + (Bottom - Top - AInnerEditHeight) div 2 + 1;
{$ENDIF}
{$IFDEF LINUX}
            Dec(AInnerEditTop);
{$ENDIF}
          end;
      end;

{$IFDEF VCL}
      AInnerEditBounds := Rect(Left + 1, AInnerEditTop, Right - Left - 1, AInnerEditHeight);
{$ELSE}
  {$IFDEF WIN32}
//      if IsInplace then
//        Dec(AInnerEditHeight);
      case AHorzAlignment of
        taLeftJustify:
          AInnerEditBounds := Rect(Left - Integer(IsInplace), AInnerEditTop, Right - Left, AInnerEditHeight);
        taCenter:
          AInnerEditBounds := Rect(Left - Integer(IsInplace), AInnerEditTop, Right - Left + Integer(IsInplace) * 2, AInnerEditHeight);
        taRightJustify:
          AInnerEditBounds := Rect(Left - Integer(IsInplace), AInnerEditTop, Right - Left + Integer(IsInplace), AInnerEditHeight);
      end;
  {$ENDIF}
  {$IFDEF LINUX}
      if IsInplace then
        Dec(AInnerEditHeight);
      case AHorzAlignment of
        taLeftJustify:
          AInnerEditBounds := Rect(Left{ + Integer(IsInplace)}, AInnerEditTop, Right - Left{ - Integer(IsInplace)}, AInnerEditHeight);
        taCenter:
          AInnerEditBounds := Rect(Left{ + Integer(IsInplace)}, AInnerEditTop, Right - Left{ - Integer(IsInplace)}, AInnerEditHeight);
        taRightJustify:
          AInnerEditBounds := Rect(Left{ + Integer(IsInplace)}, AInnerEditTop, Right - Left{ - Integer(IsInplace)}, AInnerEditHeight);
      end;
  {$ENDIF}
{$ENDIF}
    end;
    with AInnerEditBounds do
      if not EqualRect(InnerEdit.Control.BoundsRect, Rect(Left, Top, Left + Right, Top + Bottom)) then
        InnerEdit.Control.SetBounds(Left, Top, Right, Bottom);
    R := ViewInfo.ClientRect;
{$IFDEF WIN32}
  if IsInplace then
  begin
    Inc(R.Top);
    Dec(R.Bottom);
  end;
{$ENDIF}
{$IFDEF LINUX}
    InflateRect(R, -1, -1);
    Dec(R.Left);
{$ENDIF}
    AlignControls(InnerEdit.Control, R);
  finally
    FInnerEditPositionAdjusting := False;
  end;
end;

function TcxCustomTextEdit.CanKeyDownModifyEdit(Key: Word; Shift: TShiftState): Boolean;
begin
  Result := inherited CanKeyDownModifyEdit(Key, Shift);
  Result := Result or (Key = 8) or (Key = VK_DELETE);
  if Properties.UseLookupData and not ILookupData.IsEmpty and
      GetScrollLookupDataList(escKeyboard) then
    case Key of
      VK_DOWN, VK_UP:
        Result := not(ssAlt in Shift) and not HasPopupWindow;
      VK_PRIOR, VK_NEXT:
        Result := not HasPopupWindow;
    end;
end;

function TcxCustomTextEdit.CanKeyPressModifyEdit(Key: Char): Boolean;
begin
  Result := (Key in [#22, #24, #32..#255]);
  Result := Result or (Key = #8);
end;

procedure TcxCustomTextEdit.ChangeHandler(Sender: TObject);
begin
  inherited ChangeHandler(Sender);
  if not ViewInfo.IsEditClass then
    UpdateDrawValue;
end;

procedure TcxCustomTextEdit.DoEditKeyDown(var Key: Word; Shift: TShiftState);

  function IsSpace(AChar: Char): Boolean;
  begin
    Result :=  AChar in [' ', #0, #9, #10, #12, #13];
  end;

var
  AEditingStyle: TcxEditEditingStyle;
  AFindSelection: Boolean;
  APrevCurrentKey: TcxEditValue;
  APrevKey: Word;
begin
  AEditingStyle := Properties.EditingStyle;
  if AEditingStyle = esFixedList then
    case Key of
      VK_LEFT, VK_RIGHT, VK_DELETE:
        begin
          FindSelection := False;
          DoAfterKeyDown(Key, Shift);
          Key := 0;
        end;
    end;

  InnerTextEdit.InternalUpdating := True;
  APrevKey := Key;
  AFindSelection := FFindSelection;
  inherited DoEditKeyDown(Key, Shift);
  if (TranslateKey(APrevKey) = VK_RETURN) and AFindSelection then
    SelectAll;
  if Key = 0 then
    Exit;

  case Key of
    VK_LEFT, VK_RIGHT:
      begin
        if not(ssShift in Shift) and (SelLength > 0) then
        begin
          if Key = VK_RIGHT then
            SelStart := SelStart + SelLength
          else
            SelStart := SelStart;
          SelLength := 0;
          Key := 0;
        end;
        FindSelection := False;
      end;

    VK_DOWN, VK_UP, VK_PRIOR, VK_NEXT, VK_HOME, VK_END:
      begin
        if ((Key <> VK_HOME) and (Key <> VK_END) or (AEditingStyle = esFixedList)) and
          Properties.UseLookupData and GetScrollLookupDataList(escKeyboard) and
          not ILookupData.IsEmpty then
        with ILookupData do
          begin
            APrevCurrentKey := CurrentKey;
            LockClick(True);
            try
              case Key of
                VK_PRIOR:
                  if ssCtrl in Shift then
                    Go(egdBegin, False)
                  else
                    Go(egdPageUp, False);
                VK_NEXT:
                  if ssCtrl in Shift then
                    Go(egdEnd, False)
                  else
                    Go(egdPageDown, False);
                VK_UP:
                  Go(egdPrev, False);
                VK_DOWN:
                  Go(egdNext, False);
                VK_HOME:
                  Go(egdBegin, False);
                VK_END:
                  Go(egdEnd, False);
              end;
            finally
              LockClick(False);
              if not VarEqualsExact(APrevCurrentKey, CurrentKey) then
              begin
                DoClick;
                LockChangeEvents(True);
                try
                  if AutoPostEditValue and Properties.ImmediatePost and
                    ValidateEdit(True) then
                  begin
                    LookupItemsScrolling := True;
                    try
                      PostEditValue;
                    finally
                      LookupItemsScrolling := False;
                    end;
                  end;
                finally
                  LockChangeEvents(False);
                end;
              end;
            end;
            Key := 0;
          end;
        if (Key <> VK_HOME) and (Key <> VK_END) and not InnerTextEdit.MultiLine then
        begin
          if Key <> 0 then
            DoAfterKeyDown(Key, Shift);
          Key := 0;
        end;
      end;

    VK_DELETE:
      begin
        if AEditingStyle = esEditList then
        begin
          DoAfterKeyDown(Key, Shift);
          Key := 0;
        end
        else
          FindSelection := False;
      end;
  end;
  if (Key = VK_END) and (SelLength = 0) and (AEditingStyle <> esFixedList) then
    FindSelection := False;

  if Key <> 0 then
    InnerTextEdit.InternalUpdating := False;
end;

procedure TcxCustomTextEdit.DoEditKeyPress(var Key: Char);

  function FillFromList(var AFindText: string): Boolean;
  var
    ATail: string;
    L: Integer;
    S: string;
  begin
    S := AFindText;
    if InnerTextEdit.ImeLastChar <> #0 then
      S := S + InnerTextEdit.ImeLastChar;
    Result := ILookupData.Locate(S, ATail, False);
    if Result then
    begin
      AFindText := S;
      if InnerTextEdit.ImeLastChar <> #0 then
      begin
        L := Length(AFindText);
        Insert(Copy(AFindText, L, 1), ATail, 1);
        Delete(AFindText, L, 1);
      end;
    end;
    FFindSelection := Result;
    if AFindText = '' then
    begin
      if Properties.EditingStyle <> esFixedList then
        InternalSetDisplayValue('');
      FFindSelection := False;
    end;
    if Result then
    begin
      DataBinding.DisplayValue := AFindText + ATail;
      SelStart := Length(AFindText);
      SelLength := Length(ATail);
    end;
    UpdateDrawValue;
  end;

  function CanContinueIncrementalSearch: Boolean;
  begin
    Result := Properties.EditingStyle in [esEditList, esFixedList];
    if not Result then
      Result := (SelLength = 0) and (SelStart = Length(DisplayValue)) or
        FFindSelection or (SelLength > 0);
  end;

var
  AEditingStyle: TcxEditEditingStyle;
  AFindText: string;
  AFound: Boolean;
  APrevCurrentKey: TcxEditValue;
  APrevFindSelection: Boolean;
begin
  InnerTextEdit.InternalUpdating := True;
  inherited DoEditKeyPress(Key);
  if Key = #0 then
    Exit;

  UnlockLookupDataTextChanged;
  KeyboardAction := True;
  AEditingStyle := Properties.EditingStyle;
  if AEditingStyle = esFixedList then
    case Key of
      #8:
        if not Properties.FixedListSelection then
        begin
          Key := #0;
          FindSelection := False;
        end;
    end;

  APrevCurrentKey := ILookupData.CurrentKey;
  APrevFindSelection := FindSelection;
  AFound := False;
  LockClick(True);
  try
    case Key of
      #8:
        if Properties.UseLookupData then
        begin
          with ILookupData do
            if (AEditingStyle = esEditList) and (Length(DisplayValue) > 0) and not FFindSelection{ and
                InternalCompareString(DisplayValue, GetDisplayText(CurrentKey), False)} then
              begin
                SelLength := Length(DisplayValue) - SelStart;
                FindSelection := True;
              end;
          if FFindSelection then
          begin
            AFindText := Copy(DisplayValue, 1, Length(DisplayValue) - SelLength);
            SetLength(AFindText, Length(AFindText) - Length(AnsiLastChar(AFindText)));
            LockLookupDataTextChanged;
            AFound := FillFromList(AFindText);
          end;
          if AEditingStyle = esFixedList then
            Key := #0;
        end;
      #32..#255:
        if Properties.UseLookupData then
        begin
          if CanContinueIncrementalSearch then
          begin
            AFindText := DisplayValue;
            if SelLength > 0 then
              AFindText := System.Copy(AFindText, 1, SelStart) + Key
            else
              if AEditingStyle = esFixedList then
                AFindText := Key
              else
                System.Insert(Key, AFindText, SelStart + 1);
            LockLookupDataTextChanged;
            AFound := FillFromList(AFindText);
            if (AEditingStyle = esFixedList) and not Properties.FixedListSelection and not AFound then
            begin
              AFindText := Key;
              AFound := FillFromList(AFindText);
            end;
          end;
          if (AEditingStyle in [esEditList, esFixedList]) and not AFound then
          begin
            Key := #0;
            if (AEditingStyle = esEditList) and (DisplayValue <> '') or
                (AEditingStyle = esFixedList) and Properties.FixedListSelection and APrevFindSelection then
              FindSelection := True;
          end;
        end;
    end;
  finally
    LockClick(False);
    KeyboardAction := False;
    if Properties.UseLookupData and not VarEqualsExact(APrevCurrentKey,
      ILookupData.CurrentKey) then
    begin
      DoClick;
      LockChangeEvents(True);
      try
        if AFound and AutoPostEditValue and Properties.ImmediatePost and
            ValidateEdit(True) then
        begin
          APrevFindSelection := FindSelection;
          LookupItemsScrolling := True;
          try
            PostEditValue;
          finally
            LookupItemsScrolling := False;
            FindSelection := APrevFindSelection;
          end;
        end;
      finally
        LockChangeEvents(False);
      end;
    end;
  end;
  if AFound then
    Key := #0;
  if Key <> #0 then
    InnerTextEdit.InternalUpdating := False;
end;

procedure TcxCustomTextEdit.DoExit;
begin
  inherited DoExit;
  FindSelection := False;
end;

function TcxCustomTextEdit.DoMouseWheel(Shift: TShiftState; WheelDelta: Integer;
  {$IFNDEF VCL}const{$ENDIF} MousePos: TPoint): Boolean;
const
  AGoDirectionMap: array [Boolean] of TcxEditLookupDataGoDirection = (egdNext, egdPrev);
var
  APrevCurrentKey: TcxEditValue;
begin
  Result := inherited DoMouseWheel(Shift, WheelDelta, MousePos);
  if not Result then
  begin
    Result := GetScrollLookupDataList(escMouseWheel) and not HasPopupWindow and
      Properties.UseLookupData and not ILookupData.IsEmpty and HandleMouseWheel(Shift);
    if Result and DoEditing then
    begin
      APrevCurrentKey := ILookupData.CurrentKey;
      LockChangeEvents(True);
      try
        LockClick(True);
        try
          ILookupData.Go(AGoDirectionMap[WheelDelta > 0], False);
        finally
          LockClick(False);
          if not VarEqualsExact(APrevCurrentKey, ILookupData.CurrentKey) then
          begin
            DoClick;
            if AutoPostEditValue and Properties.ImmediatePost and ValidateEdit(True) then
            begin
              LookupItemsScrolling := True;
              try
                PostEditValue;
              finally
                LookupItemsScrolling := False;
              end;
            end;
          end;
        end;
      finally
        LockChangeEvents(False);
      end;
    end;
  end;
end;

procedure TcxCustomTextEdit.FillSizeProperties(var AEditSizeProperties: TcxEditSizeProperties);
begin
  if ViewInfo = nil then
     Exit;
  with AEditSizeProperties do
  begin
    MaxLineCount := 1;
    Width := 0;
  end;
end;

procedure TcxCustomTextEdit.GetChildControlBounds(AChildControlBounds: TRect;
  AChildControl: TControl; var PR: PRect);
begin
  if IsEditClass then
  begin
    inherited GetChildControlBounds(AChildControlBounds, AChildControl, PR);
{$IFDEF VCL}
    if (PR <> nil) and not IsInplace and (ViewInfo.EditNativeState <> TC_NONE) and
      ViewInfo.ComboBoxStyle and (Properties.EditingStyle in [esEdit, esEditList]) then
      begin
        Dec(PR^.Right);
        Dec(PR^.Bottom);
      end;
{$ENDIF}
  end
  else
    FillChar(PR^, SizeOf(PR^), 0);
end;

function TcxCustomTextEdit.GetDisplayValue: TCaption;
begin
  if InnerEdit = nil then
    Result := ''
  else
    Result := InnerEdit.EditValue;
end;

function TcxCustomTextEdit.GetInnerEditClass: TControlClass;
begin
  Result := TcxCustomInnerTextEdit;
end;

function TcxCustomTextEdit.InternalDoEditing: Boolean;
begin
  Result := Properties.EditingStyle <> esNoEdit;
end;

function TcxCustomTextEdit.InternalGetPopupMenu: TPopupMenu;
begin
  Result := nil;
end;

procedure TcxCustomTextEdit.InternalSetDisplayValue(const Value: TcxEditValue);
begin
  DataBinding.DisplayValue := Value;
  if not KeyboardAction then
  begin
    ResetOnNewDisplayValue;
    SynchronizeEditValue;
    EditModified := False;
  end;
end;

procedure TcxCustomTextEdit.InternalValidateDisplayValue(const ADisplayValue: TcxEditValue);
var
  APrevFindSelection: Boolean;
begin
  APrevFindSelection := FindSelection;
  try
    if (Properties.EditingStyle = esEdit) and Properties.UseLookupData then
      with ILookupData do
        if not Find(ADisplayValue) then
            Properties.DoNewLookupDisplayText(Self, ADisplayValue);
    inherited InternalValidateDisplayValue(ADisplayValue);
  finally
    FindSelection := APrevFindSelection;
  end;
end;

function TcxCustomTextEdit.IsEditClass: Boolean;
begin
  if FHideInnerEdit or FShowInnerEdit then
  begin
    Result := not FHideInnerEdit and FShowInnerEdit;
    Exit;
  end;

  Result := (Properties.EditingStyle in [esEdit, esEditList])
    and not PropertiesChangeLocked and not IsDesigning and (IsActiveControl or
    (Properties.Alignment.Horz = taLeftJustify) or
    Properties.UseLeftAlignmentOnEditing and IsActiveControl);
end;

function TcxCustomTextEdit.IsValidChar(AChar: Char): Boolean;
begin
  Result := inherited IsValidChar(AChar);
  Result := Result or (AChar in Properties.ValidChars);
end;

procedure TcxCustomTextEdit.Loaded;
begin
  inherited Loaded;
  ShortRefreshContainer(False);
end;

{$IFDEF VCL}
procedure TcxCustomTextEdit.LockedInnerEditWindowProc(var Message: TMessage);
begin
  if Message.Msg = WM_SETFOCUS then
  begin
    if InnerTextEdit.AutoSelect then
      SelectAll;
  end
  else
    inherited LockedInnerEditWindowProc(Message);
end;
{$ENDIF}

procedure TcxCustomTextEdit.PropertiesChanged(Sender: TObject);
begin
  if InnerTextEdit <> nil then
    InnerTextEdit.Alignment := Properties.FAlignment.Horz;
  if Properties.UseLookupData then
    ILookupData.PropertiesChanged;
  if Properties.UseLookupData and not FLookupDataTextChangedLocked and
      (HasPopupWindow or (Properties.EditingStyle in [esEditList, esFixedList])) then
    ILookupData.TextChanged;
  if not PropertiesChangeLocked and not IsEditClass then
    UpdateDrawValue;

  if InnerTextEdit <> nil then
    InnerTextEdit.Alignment := Properties.Alignment.Horz;

  if InnerTextEdit = nil then
    Exit;
  with InnerTextEdit do
  begin
    Alignment := Properties.Alignment.Horz;
    AutoSelect := Properties.AutoSelect and not IsInplace;
    CharCase := Properties.FCharCase;
    EchoMode := Properties.FEchoMode;
    HideSelection := Properties.FHideSelection;
    MaxLength := Properties.GetInnerEditMaxLength;
{$IFDEF VCL}
    OEMConvert := Properties.OEMConvert;
{$ENDIF}
    ReadOnly := Properties.ReadOnly;
  end;

  CheckEditValue;
  if not IsPosting then
    UpdateEditValue;
  UpdateDrawValue;
  inherited PropertiesChanged(Sender);
  if InnerTextEdit <> nil then
    InnerTextEdit.Control.Invalidate;
end;

function TcxCustomTextEdit.RefreshContainer(const P: TPoint; Button: TcxMouseButton;
  Shift: TShiftState; AIsMouseEvent: Boolean): Boolean;
begin
  Result := False;
  if (not HandleAllocated) or (csDestroying in ComponentState) then Exit;
  Result := inherited RefreshContainer(P, Button, Shift, AIsMouseEvent);
  if Result then
    AdjustInnerEdit;
{$IFDEF VCL}
  DoubleBuffered := not IsEditClass;
{$ENDIF}
end;

function TcxCustomTextEdit.SetDisplayText(const Value: TCaption): Boolean;
var
  ADisplayValue: TcxEditValue;
begin
{$IFDEF VCL}
  ADisplayValue := String(PChar(VarToStr(Value)));
{$ELSE}
  ADisplayValue := WideString(PWideChar(VarToWideStr(Value)));
{$ENDIF}
  Result := Properties.IsDisplayValueValid(ADisplayValue, InternalFocused);
  if Result then
    Result := not(KeyboardAction and not DoEditing);
  if Result then
    InternalSetDisplayValue(ADisplayValue);
end;

{$IFDEF VCL}
procedure TcxCustomTextEdit.UnlockInnerEditRepainting;
var
  APrevAutoSelect: Boolean;
begin
  inherited UnlockInnerEditRepainting;
  APrevAutoSelect := InnerTextEdit.AutoSelect;
  InnerTextEdit.AutoSelect := False;
  SendMessage(InnerEdit.Control.Handle, WM_SETFOCUS, 0, 0);
  InnerTextEdit.AutoSelect := APrevAutoSelect;
end;
{$ENDIF}

procedure TcxCustomTextEdit.AdjustInnerEdit;
begin
  if (InnerTextEdit = nil) or FIsCreating then
    Exit;
  InnerEdit.LockBounds(True);
  try
    with TControlAccess(InnerTextEdit.Control) do
    begin
      Color := ViewInfo.BackgroundColor;
      Font := Style.Font;
      Font.Color := ViewInfo.TextColor;
    end;
  finally
    InnerEdit.LockBounds(False);
  end;
end;

procedure TcxCustomTextEdit.SetInternalDisplayValue(Value: TcxEditValue);
begin
  if InnerEdit <> nil then
    InnerEdit.EditValue := Value;
end;

procedure TcxCustomTextEdit.CheckEditValue;
begin
  if TcxEditDataBindingAccess(DataBinding).CanCheckEditorValue and
      Properties.IsEditValueNumeric and not PropertiesChangeLocked then
    with Properties do
      if MinValue <> MaxValue then
        Self.CheckEditorValueBounds;
end;

procedure TcxCustomTextEdit.CheckEditorValueBounds;
begin
end;

procedure TcxCustomTextEdit.DoClick;
begin
  ModifiedAfterEnter := True;
  if FClickLockCount = 0 then
    Click;
end;

function TcxCustomTextEdit.GetScrollLookupDataList(AScrollCause: TcxEditScrollCause): Boolean;
begin
  Result := False;
end;

procedure TcxCustomTextEdit.HandleSelectItem(Sender: TObject);
var
  ANewEditValue: TcxEditValue;
  AEditValueChanged: Boolean;
begin
  ANewEditValue := LookupKeyToEditValue(ILookupData.CurrentKey);
  AEditValueChanged := not VarEqualsExact(EditValue, ANewEditValue);
  if AEditValueChanged and not DoEditing then
    Exit;
  SaveModified;
  try
    EditValue := ANewEditValue;
  finally
    RestoreModified;
  end;
  if AEditValueChanged then
    ModifiedAfterEnter := True;
  SelectAll;
  ShortRefreshContainer(False);
end;

function TcxCustomTextEdit.InternalGetText: TCaption;
begin
  Result := DisplayValue;
end;

function TcxCustomTextEdit.InternalSetText(const Value: TCaption): Boolean;
begin
  Result := SetDisplayText(Value);
end;

procedure TcxCustomTextEdit.LockClick(ALock: Boolean);
begin
  if ALock then
    Inc(FClickLockCount)
  else
    if FClickLockCount > 0 then
      Dec(FClickLockCount);
end;

procedure TcxCustomTextEdit.LockLookupDataTextChanged;
begin
  FLookupDataTextChangedLocked := True;
end;

function TcxCustomTextEdit.LookupKeyToEditValue(const AKey: TcxEditValue): TcxEditValue;
var
  AText: string;
begin
  AText := ILookupData.GetDisplayText(AKey);
  PrepareEditValue(AText, Result, False);
end;

procedure TcxCustomTextEdit.ResetOnNewDisplayValue;
begin
  if Properties.UseLookupData then
    FindSelection := False;
end;

procedure TcxCustomTextEdit.SynchronizeDisplayValue;
var
  ADisplayValue, AEditValue: TcxEditValue;
  AIsEditValueValid: Boolean;
begin
  if Properties.CanValidate then
  begin
    AEditValue := EditValue;
    AIsEditValueValid := Properties.IsEditValueValid(AEditValue, InternalFocused);
    if not Focused and not AIsEditValueValid then
      try
        if VarIsDate(EditValue) then
          ADisplayValue := DateTimeToStr(EditValue)
        else
          ADisplayValue := VarToStr(EditValue)
      except
        on EVariantError do
          ADisplayValue := '';
      end
    else
      if AIsEditValueValid then
        PrepareDisplayValue(EditValue, ADisplayValue, InternalFocused)
      else
        ADisplayValue := Properties.DefaultFocusedDisplayValue;
  end
  else
    PrepareDisplayValue(EditValue, ADisplayValue, InternalFocused);
  SaveModified;
  try
    DataBinding.DisplayValue := ADisplayValue;
  finally
    RestoreModified;
    ResetOnNewDisplayValue;
    UpdateDrawValue;
  end;
end;

procedure TcxCustomTextEdit.SynchronizeEditValue;
var
  APrevEditValue: TcxEditValue;
  ACompareEditValue, AEditValueChanged: Boolean;
begin
  ACompareEditValue := {not IsInplace and }Properties.CompareEditValue;
  if ACompareEditValue then
    APrevEditValue := EditValue;
  PrepareEditValue(DisplayValue, FEditValue, InternalFocused);

  if ACompareEditValue then
    AEditValueChanged := not InternalVarEqualsExact(APrevEditValue, FEditValue)
//    AEditValueChanged := (VarType(FEditValue) <> VarType(APrevEditValue{DisplayValue})) or
//      not VarEqualsExact(FEditValue, APrevEditValue{DisplayValue})
  else
    AEditValueChanged := False;
  if KeyboardAction then
    ModifiedAfterEnter := True
  else
    EditModified := False;
  if AEditValueChanged then
  begin
    DoEditValueChanged;
    if not Properties.HasDisplayValue then
      DoChange;
  end;
end;

procedure TcxCustomTextEdit.UnlockLookupDataTextChanged;
begin
  FLookupDataTextChangedLocked := False;
end;

procedure TcxCustomTextEdit.UpdateDrawValue;

  procedure SetTextSelection;
  var
    AEditingStyle: TcxEditEditingStyle;
  begin
    AEditingStyle := Properties.EditingStyle;
    if AEditingStyle in [esFixedList, esNoEdit] then
      with ViewInfo do
        if (AEditingStyle = esNoEdit) or not FindSelection or not Properties.FixedListSelection then
          SelLength := 0
        else
        begin
          if DrawSelectionBar then
          begin
            SelStart := 0;
            SelLength := Length(Text) - Self.SelLength;
            SelBackgroundColor := clHighlightText;
            SelTextColor := clHighlight;
          end else
          begin
            SelStart := Self.SelStart;
            SelLength := Self.SelLength;
            SelBackgroundColor := clHighlight;
            SelTextColor := clHighlightText;
          end;
        end;
  end;

var
  AViewData: TcxCustomTextEditViewData;
begin
  AViewData := TcxCustomTextEditViewData(CreateViewData);
  try
    AViewData.DisplayValueToDrawValue(DisplayValue, ViewInfo);
  finally
    AViewData.Free;
  end;
  if HandleAllocated then
  begin
    CalculateViewInfo(False);
    SetTextSelection;
    InvalidateRect(Rect(0, 0, Width, Height), False);
  end;
end;

procedure TcxCustomTextEdit.UpdateEditValue;
var
  ADisplayValue: TcxEditValue;
begin
  if not PropertiesChangeLocked then
  begin
    if Properties.EditingStyle in [esEditList, esFixedList] then
      if ModifiedAfterEnter then
      begin
        ADisplayValue := DisplayValue;
        if not Properties.IsDisplayValueValid(ADisplayValue, True) then
        begin
          SaveModified;
          DataBinding.DisplayValue := Properties.DefaultFocusedDisplayValue;
          RestoreModified;
        end;
      end
      else
        SynchronizeDisplayValue
    else
      if not ModifiedAfterEnter then
        TcxEditDataBindingAccess(DataBinding).UpdateDisplayValue;
    if not IsEditClass then
      UpdateDrawValue;
  end;
end;

{$IFNDEF VCL}
function TcxCustomTextEdit.GetText: TCaption;
begin
  Result := InternalGetText;
end;

procedure TcxCustomTextEdit.SetText(const Value: TCaption);
begin
  if InternalSetText(Value) then
    inherited SetText(DisplayValue);
end;
{$ENDIF}

function TcxCustomTextEdit.GetCursorPos: Integer;
begin
  if InnerTextEdit.Control is TcxCustomInnerTextEdit then
    Result := TcxCustomInnerTextEdit(InnerTextEdit.Control).CursorPos
  else
    Result := 0;
end;

function TcxCustomTextEdit.GetEditingText: TCaption;
begin
  Result := Text;
end;

function TcxCustomTextEdit.GetInnerTextEdit: IcxInnerTextEdit;
begin
  Result := InnerEdit as IcxInnerTextEdit;
end;

function TcxCustomTextEdit.GetILookupData: IcxTextEditLookupData;
begin
  Result := FLookupData as IcxTextEditLookupData;
end;

function TcxCustomTextEdit.GetLookupData: TcxCustomTextEditLookupData;
begin
  Result := TcxCustomTextEditLookupData(FLookupData);
end;

function TcxCustomTextEdit.GetProperties: TcxTextEditProperties;
begin
  Result := TcxTextEditProperties(InternalGetProperties);
end;

function TcxCustomTextEdit.GetSelLength: Integer;
var
  AEditingStyle: TcxEditEditingStyle;
begin
  AEditingStyle := Properties.EditingStyle;
  if (AEditingStyle = esFixedList) and not FFindSelection or (AEditingStyle = esNoEdit) then
    Result := 0
  else
    Result := InnerTextEdit.SelLength;
end;

function TcxCustomTextEdit.GetSelStart: Integer;
var
  AEditingStyle: TcxEditEditingStyle;
begin
  AEditingStyle := Properties.EditingStyle;
  if (AEditingStyle = esFixedList) and not FFindSelection or (AEditingStyle = esNoEdit) then
    Result := 0
  else
    Result := InnerTextEdit.SelStart;
end;

function TcxCustomTextEdit.GetSelText: TCaption;
var
  AEditingStyle: TcxEditEditingStyle;
begin
  AEditingStyle := Properties.EditingStyle;
  if (AEditingStyle = esFixedList) and not FFindSelection or (AEditingStyle = esNoEdit) then
    Result := ''
  else
    Result := InnerTextEdit.SelText;
end;

function TcxCustomTextEdit.GetViewInfo: TcxCustomTextEditViewInfo;
begin
  Result := TcxCustomTextEditViewInfo(FViewInfo);
end;

procedure TcxCustomTextEdit.SetEditingText(const Value: TCaption);
begin
  if DoEditing then
  begin
    Text := Value;
    ModifiedAfterEnter := True;
  end;
end;

procedure TcxCustomTextEdit.SetFindSelection(Value: Boolean);
begin
  if not HandleAllocated or (Value = FFindSelection) or FDisableRefresh then
    Exit;
  FFindSelection := Value;
  CalculateViewInfo(False);
  UpdateDrawValue;
end;

procedure TcxCustomTextEdit.SetHideInnerEdit(Value: Boolean);
begin
  if Value <> FHideInnerEdit then
  begin
    FHideInnerEdit := Value;
    PropertiesChanged(Properties);
  end;
end;

procedure TcxCustomTextEdit.SetProperties(Value: TcxTextEditProperties);
begin
  if RepositoryItem = nil then
    FProperties.Assign(Value);
end;

procedure TcxCustomTextEdit.SetShowInnerEdit(Value: Boolean);
begin
  if Value <> FShowInnerEdit then
  begin
    FShowInnerEdit := Value;
    PropertiesChanged(Properties);
  end;
end;

procedure TcxCustomTextEdit.SetTesting(Value: Boolean);
begin
  if Value <> FTesting then
  begin
    FTesting := Value;
    ShortRefreshContainer(False);
  end;
end;

procedure TcxCustomTextEdit.SetSelLength(Value: Integer);
begin
  if Properties.EditingStyle <> esNoEdit then
    InnerTextEdit.SelLength := Value;
end;

procedure TcxCustomTextEdit.SetSelStart(Value: Integer);
begin
  if Properties.EditingStyle <> esNoEdit then
    InnerTextEdit.SelStart := Value;
end;

procedure TcxCustomTextEdit.SetSelText(const Value: TCaption);
var
  AEditingStyle: TcxEditEditingStyle;
  ANewSelStart: Integer;
  AText: TCaption;
begin
  AEditingStyle := Properties.EditingStyle;
  if KeyboardAction and (AEditingStyle = esNoEdit) then
    Exit;
  if AEditingStyle in [esFixedList, esNoEdit] then
    SelectAll;
  if KeyboardAction and (AEditingStyle in [esEdit, esNoEdit]) and (Properties.MaxLength > 0) then
  begin
    AText := Copy(Text, 1, SelStart) + Value;
    ANewSelStart := Length(WideString(AText));
    if ANewSelStart > Properties.MaxLength then
      ANewSelStart := Properties.MaxLength;
    ANewSelStart := Length(TCaption(Copy(WideString(AText), 1, ANewSelStart)));
    if ANewSelStart <= SelStart then
      Exit;

    AText := AText + Copy(Text, SelStart + SelLength + 1, Length(Text) - SelStart - SelLength);
    if Length(WideString(AText)) > Properties.MaxLength then
      AText := Copy(WideString(AText), 1, Properties.MaxLength);
  end else
  begin
    AText := Text;
    AText := Copy(AText, 1, SelStart) + Value +
      Copy(AText, SelStart + SelLength + 1, Length(AText) - SelLength - SelStart);
    ANewSelStart := SelStart + Length(Value);
  end;
  if SetDisplayText(AText) then
    SelStart := ANewSelStart;
end;

{$IFDEF VCL}
procedure TcxCustomTextEdit.WMClear(var Message: TMessage);
begin
  KeyboardAction := True;
  if not Properties.ReadOnly then
    ClearSelection;
  KeyboardAction := False;
end;

procedure TcxCustomTextEdit.WMGetText(var Message: TWMGetText);
begin
  with Message do
    if TextMax > 0 then
    begin
      StrLCopy(Text, PChar(InternalGetText), TextMax - 1);
      Result := StrLen(Text) + 1;
    end
    else
      Result := 0;
end;

procedure TcxCustomTextEdit.WMGetTextLength(var Message: TWMGetTextLength);
begin
  Message.Result := Length(InternalGetText);
end;

procedure TcxCustomTextEdit.WMSetText(var Message: TWMSetText);
begin
  if FInternalTextSetting then
    inherited
  else
  begin
    Message.Result := 0;
    if not InternalSetText(string(Message.Text)) then
      Exit;
    FInternalTextSetting := True;
    FInternalTextSetting := False;
    Message.Result := 1;
  end;
end;
{$ENDIF}

initialization
  GetRegisteredEditProperties.Register(TcxTextEditProperties, scxSEditRepositoryTextItem);

end.
