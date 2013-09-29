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

unit cxEdit;

{$I cxEdVer.inc}

interface

uses
{$IFDEF WIN32}
  Windows, Messages,
{$ENDIF}
{$IFDEF VCL}
  ComCtrls, dxThemeConsts, dxThemeManager,
{$ELSE}
  Qt, Types, QTypes,
{$ENDIF}
  Classes, Controls, ExtCtrls, Forms, Graphics, Menus, StdCtrls, SysUtils,
  cxClasses, cxContainer, cxControls, cxDataUtils, cxEditPaintUtils, cxGraphics,
  cxListBox, cxLookAndFeels, cxVariants;

type
  TcxBlobKind = (bkNone, bkBlob, bkGraphic, bkMemo, bkOle);
  TcxEditBorderStyle = (ebsNone, ebsSingle, ebsThick, ebsFlat, ebs3D, ebsUltraFlat);
  TcxEditButtonKind = (bkEllipsis, bkDown, bkGlyph);
  TcxEditButtonState = (ebsDisabled, ebsNormal, ebsPressed, ebsSelected);
  TcxEditButtonStyle = (btsDefault, bts3D, btsFlat, btsSimple, btsHotFlat, btsUltraFlat);
  TcxEditButtonTransparency = (ebtNone, ebtInactive, ebtAlways, ebtHideInactive,
    ebtHideUnselected);
  TcxEditPopupBorderStyle = (epbsDefault, epbsSingle, epbsFrame3D, epbsFlat);

  TcxEditStyleValue = TcxContainerStyleValue;
  TcxEditStyleValues = TcxContainerStyleValues;

  TcxEditHorzAlignment = TAlignment;
  TcxEditVertAlignment = (taTopJustify, taBottomJustify, taVCenter);

const
  cxEditDefaultUseLeftAlignmentOnEditing = True;
  cxEditDefaultHorzAlignment: TcxEditHorzAlignment = taLeftJustify;
  cxEditDefaultVertAlignment: TcxEditVertAlignment = taTopJustify;

  ekDefault = 0;

  svBorderColor        = csvBorderColor;
  svBorderStyle        = csvBorderStyle;
  svColor              = csvColor;
  svEdges              = csvEdges;
  svFont               = csvFont;
  svHotTrack           = csvHotTrack;
  svShadow             = csvShadow;
  svTransparentBorder  = csvTransparentBorder;
  svButtonStyle        = cxContainerStyleValueCount;
  svButtonTransparency = cxContainerStyleValueCount + 1;
  svPopupBorderStyle   = cxContainerStyleValueCount + 2;

  cxEditStyleValueCount = cxContainerStyleValueCount + 3;

  cxEditStyleValueNameA: array[0..cxEditStyleValueCount - cxContainerStyleValueCount - 1] of string = (
    'ButtonStyle',
    'ButtonTransparency',
    'PopupBorderStyle'
  );

{$IFDEF VCL}
  CM_EDITVALIDATIONERROR = WM_APP + 105;
{$ELSE}
  QEventType_CMEditValidationError = Integer(QEventType_ClxUser) + 5;
{$ENDIF}

type
  TcxEditDisplayFormatOption = (dfoSupports, dfoNoCurrencyValue);
  TcxEditDisplayFormatOptions = set of TcxEditDisplayFormatOption;
  TcxEditEchoMode = (eemNormal, eemPassword{$IFNDEF VCL}, eemNone{$ENDIF});
  TcxEditEditingStyle = (esEdit, esEditList, esFixedList, esNoEdit);
  TcxEditPaintOption = (epoAllowZeroHeight, epoAutoHeight, epoShowEndEllipsis);
  TcxEditPaintOptions = set of TcxEditPaintOption;
  TcxEditStateItem = (esActive, esDisabled, esHotTrack, esNormal);
  TcxEditState = set of TcxEditStateItem;
  TcxEditSupportedOperation = (esoAlwaysHotTrack, esoAutoHeight, esoFiltering,
    esoHorzAlignment, esoHotTrack, esoIncSearch, esoSorting, esoSortingByDisplayText);
  TcxEditSupportedOperations = set of TcxEditSupportedOperation;
  TcxEditValue = Variant;
  PcxEditValue = ^TcxEditValue;
  TcxEditValidateEvent = procedure(Sender: TObject; var DisplayValue: TcxEditValue;
    var ErrorText: TCaption; var Error: Boolean) of object;
  TcxEditErrorKind = Integer;
  TcxCustomEdit = class;
  TcxCustomEditStyle = class;

  { IcxCustomInnerEdit }

  IcxCustomInnerEdit = interface(IcxContainerInnerControl)
  ['{468D21B5-48AA-4077-8ED5-4C6112D460B1}']
    function GetEditValue: TcxEditValue;
    function GetOnChange: TNotifyEvent;
    function GetReadOnly: Boolean;
    procedure LockBounds(ALock: Boolean);
    procedure SafelySetFocus;
    procedure SetEditValue(const Value: TcxEditValue);
    procedure SetParent(Value: TWinControl);
    procedure SetOnChange(Value: TNotifyEvent);
    procedure SetReadOnly(Value: Boolean);

    property EditValue: TcxEditValue read GetEditValue write SetEditValue;
    property Parent: TWinControl write SetParent;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly;
    property OnChange: TNotifyEvent read GetOnChange write SetOnChange;
  end;

  TcxCustomEditProperties = class;
  TcxCustomEditPropertiesClass = class of TcxCustomEditProperties;
  TcxEditRepository = class;
  TcxEditRepositoryItem = class;

  { IcxEditRepositoryItemListener }

  IcxEditRepositoryItemListener = interface
    ['{4E27D642-022B-4CD2-AB96-64C7CF9B3299}']
    procedure ItemRemoved(Sender: TcxEditRepositoryItem);
    procedure PropertiesChanged(Sender: TcxEditRepositoryItem);
  end;

  { TcxEditRepositoryItem }

  TcxEditRepositoryItem = class(TComponent)
  private
    FListenerList: IInterfaceList;
    FProperties: TcxCustomEditProperties;
    FPropertiesEvents: TNotifyEvent;
    FRepository: TcxEditRepository;
    procedure SetProperties(Value: TcxCustomEditProperties);
    procedure SetRepository(Value: TcxEditRepository);
  protected
    procedure PropertiesChanged(Sender: TObject); virtual;
    procedure ReadState(Reader: TReader); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AddListener(AListener: IcxEditRepositoryItemListener); virtual;
    class function GetEditPropertiesClass: TcxCustomEditPropertiesClass; virtual;
    function GetParentComponent: TComponent; override;
    function HasParent: Boolean; override;
    procedure RemoveListener(AListener: IcxEditRepositoryItemListener); virtual;
    procedure SetParentComponent(AParent: TComponent); override;
    property Repository: TcxEditRepository read FRepository write SetRepository;
  published
    property Properties: TcxCustomEditProperties read FProperties write SetProperties;
    property PropertiesEvents: TNotifyEvent read FPropertiesEvents write FPropertiesEvents;
  end;

  TcxEditRepositoryItemClass = class of TcxEditRepositoryItem;

  IcxEditDefaultValuesProvider = interface
    ['{AE727882-6FDF-4E3A-AB35-E58AB28EFE7B}']
    procedure ChangedNotification;
    procedure ClearUsers;
    function DefaultAlignment: TAlignment;
    function DefaultBlobKind: TcxBlobKind;
    function DefaultCanModify: Boolean;
    function DefaultDisplayFormat: string;
    function DefaultEditMask: string;
    function DefaultIsFloatValue: Boolean;
    function DefaultMaxLength: Integer;
    function DefaultMaxValue: Double;
    function DefaultMinValue: Double;
    function DefaultReadOnly: Boolean;
    function DefaultRequired: Boolean;
    function GetInstance: TObject;
    function GetOnChanged: TNotifyEvent;
    function HasDisplayValueFormatting: Boolean;
    function IsBlob: Boolean;
    function IsDisplayFormatDefined(AIsCurrencyValueAccepted: Boolean): Boolean;
    function IsValidChar(AChar: Char): Boolean;
    procedure SetOnChanged(Value: TNotifyEvent);
    property OnChanged: TNotifyEvent read GetOnChanged write SetOnChanged;
  end;

  { TcxEditRepository }

  TcxEditRepository = class(TComponent)
  private
    FItems: TList;
    function GetCount: Integer;
    function GetItem(Index: Integer): TcxEditRepositoryItem;
  protected
    procedure AddItem(AItem: TcxEditRepositoryItem);
    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
    procedure RemoveItem(AItem: TcxEditRepositoryItem);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Clear;
    function CreateItem(ARepositoryItemClass: TcxEditRepositoryItemClass): TcxEditRepositoryItem; virtual;
    function CreateItemEx(ARepositoryItemClass: TcxEditRepositoryItemClass; AOwner: TComponent): TcxEditRepositoryItem; virtual;
    function ItemByName(ARepositoryItemName: string): TcxEditRepositoryItem;
    property Count: Integer read GetCount;
    property Items[Index: Integer]: TcxEditRepositoryItem read GetItem; default;
  end;

  { TcxEditButtonViewInfo }

  TcxEditButtonViewInfoData = record
    BackgroundColor: TColor;
    Default: Boolean;
    IsInplace: Boolean;
    Kind: TcxEditButtonKind;
    LeftAlignment: Boolean;
    Leftmost: Boolean;
    NativeStyle: Boolean;
    Rightmost: Boolean;
    State: TcxEditButtonState;
    Style: TcxEditButtonStyle;
    Transparent: Boolean;
{$IFDEF VCL}
    BackgroundPartiallyTransparent: Boolean;
    ComboBoxStyle: Boolean;
    NativePart: Integer;
    NativeState: Integer;
{$ENDIF}
  end;
  PcxEditButtonViewInfoData = ^TcxEditButtonViewInfoData;

  TcxEditButtonViewInfo = class(TPersistent)
  public
    Bounds: TRect;
    Data: TcxEditButtonViewInfoData;
    Glyph: TBitmap;
    HasBackground: Boolean;
    Index: Integer;
    VisibleBounds: TRect;
    Width: Integer;
    procedure Assign(Source: TPersistent); override;
    function GetUpdateRegion(AViewInfo: TcxEditButtonViewInfo): TcxRegion; virtual;
    function Repaint(AControl: TWinControl; AViewInfo: TcxEditButtonViewInfo;
      const AEditPosition: TPoint): Boolean; virtual;
  end;

  TcxEditButtonViewInfoClass = class of TcxEditButtonViewInfo;

  { TcxEditButton }

  TcxEditButton = class(TCollectionItem)
  private
    FDefault: Boolean;
    FGlyph: TBitmap;
    FKind: TcxEditButtonKind;
    FLeftAlignment: Boolean;
    FVisible: Boolean;
    FWidth: Integer;
    function GetGlyph: TBitmap;
    procedure GlyphChanged(Sender: TObject);
    procedure SetDefault(Value: Boolean);
    procedure SetGlyph(Value: TBitmap);
    procedure SetKind(Value: TcxEditButtonKind);
    procedure SetLeftAlignment(Value: Boolean);
    procedure SetVisible(Value: Boolean);
    procedure SetWidth(Value: Integer);
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
  published
    property Default: Boolean read FDefault write SetDefault default False;
    property Glyph: TBitmap read GetGlyph write SetGlyph;
    property Kind: TcxEditButtonKind read FKind write SetKind default bkDown;
    property LeftAlignment: Boolean read FLeftAlignment write SetLeftAlignment default False;
    property Visible: Boolean read FVisible write SetVisible default True;
    property Width: Integer read FWidth write SetWidth default 0;
  end;

  TcxEditButtonClass = class of TcxEditButton;

  { TcxEditButtons }

  TcxEditButtons = class(TCollection)
  private
    FOwner: TPersistent;
    FOnChange: TNotifyEvent;
    function GetItem(Index: Integer): TcxEditButton;
    function GetVisibleCount: Integer;
    procedure SetItem(Index: Integer; Value: TcxEditButton);
  protected
    function GetOwner: TPersistent; override;
    procedure Update(Item: TCollectionItem); override;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  public
    constructor Create(AOwner: TPersistent); virtual;
    property Items[Index: Integer]: TcxEditButton read GetItem write SetItem; default;
    property VisibleCount: Integer read GetVisibleCount;
  end;

  { TcxCustomEditViewInfo }

  TcxEditAlignment = class;

  TcxCustomEditViewInfo = class(TcxContainerViewInfo)
  protected
    procedure InternalPaint(ACanvas: TcxCanvas); override;
    function GetButtonViewInfoClass: TcxEditButtonViewInfoClass; virtual;
    procedure SetButtonCount(ACount: Integer);
  public
    BorderExtent: TRect;
    BorderStyle: TcxEditBorderStyle;
    ButtonsInfo: array of TcxEditButtonViewInfo;
    Edges: TcxBorders;
{$IFDEF VCL}
    EditNativeState: Integer;
{$ENDIF}
    EditState: TcxEditState;
    Enabled: Boolean;
    Focused: Boolean;
    Font: TFont;
    HasBackground: Boolean;
    HasInnerEdit: Boolean;
    HitTestInfo: Integer;
    HotState: TcxContainerHotState;
    InnerEditRect: TRect;
    IsButtonReallyPressed: Boolean;
    IsInplace: Boolean;
    IsSelected: Boolean;
    Left: Integer;
    NativeStyle: Boolean;
    PaintOptions: TcxEditPaintOptions;
    PopupBorderStyle: TcxEditPopupBorderStyle;
    PressedButton: Integer;
    PreviewMode: Boolean;
    SelectedButton: Integer;
    ShadowRect: TRect;
    TextColor: TColor;
    Top: Integer;
    Transparent: Boolean;
{$IFDEF VCL}
    WindowHandle: HWND;
{$ENDIF}
    constructor Create; override;
    destructor Destroy; override;
    procedure Assign(Source: TObject); override;
    procedure DrawButton(ACanvas: TcxCanvas; AButtonVisibleIndex: Integer); virtual;
    procedure DrawButtonBorder(ACanvas: TcxCanvas; AButtonVisibleIndex: Integer;
      AButtonStyle: TcxEditButtonStyle; const ARect: TRect); virtual;
    procedure DrawButtonContent(ACanvas: TcxCanvas; AButtonVisibleIndex: Integer;
      const AContentRect: TRect; APenColor: TColor; ABrushColor: TColor); virtual;
    function GetUpdateRegion(AViewInfo: TcxContainerViewInfo): TcxRegion; override;
    function IsHotTrack: Boolean; virtual;
    function NeedShowHint(ACanvas: TcxCanvas; const P: TPoint; out AText: TCaption;
      out AIsMultiLine: Boolean; out ATextRect: TRect): Boolean; overload; virtual;
    function NeedShowHint(ACanvas: TcxCanvas; const P: TPoint; AVisibleBounds: TRect;
      out AText: TCaption; out AIsMultiLine: Boolean; out ATextRect: TRect): Boolean; overload; virtual;
    procedure Offset(DX, DY: Integer); override;
    procedure PaintEx(ACanvas: TcxCanvas);
    function Repaint(AControl: TWinControl; AViewInfo: TcxContainerViewInfo = nil;
      APInnerEditRect: PRect = nil): Boolean; virtual;
  end;

  { TcxCustomEditViewData }

  TcxEditSizeProperties = record
    MaxLineCount: Integer;
    Width: Integer;
  end;
  PcxEditSizeProperties = ^TcxEditSizeProperties;

  TcxCustomEditViewData = class(TPersistent)
  private
    FIsInplace: Boolean;
    FLeftSideLeftmostButtonIndex, FLeftSideRightmostButtonIndex: Integer;
    FRightSideLeftmostButtonIndex, FRightSideRightmostButtonIndex: Integer;
    function GetProperties: TcxCustomEditProperties;
    function GetStyle: TcxCustomEditStyle;
    procedure SetProperties(Value: TcxCustomEditProperties);
    procedure SetStyle(Value: TcxCustomEditStyle);
  protected
    FProperties: TcxCustomEditProperties;
    FStyle: TcxContainerStyle;
    function CanPressButton(AViewInfo: TcxCustomEditViewInfo; AButtonVisibleIndex: Integer):
      Boolean; virtual;
    function GetBorderStyle(AEditHotState: TcxContainerHotState): TcxEditBorderStyle; virtual;
    function GetCaptureButtonVisibleIndex: Integer;
    function GetDefaultBorderStyle(AEditHotState: TcxContainerHotState): TcxEditBorderStyle;
    procedure Initialize; virtual;
    procedure InitCacheData; virtual;
    function InternalFocused: Boolean;
    function InternalGetEditConstantPartSize(ACanvas: TcxCanvas; AIsInplace: Boolean;
      const AEditSizeProperties: TcxEditSizeProperties; var MinContentSize: TSize;
      AViewInfo: TcxCustomEditViewInfo): TSize; virtual;
    function IsButtonPressed(AViewInfo: TcxCustomEditViewInfo; AButtonVisibleIndex: Integer): Boolean; virtual;
{$IFDEF VCL}
    procedure CalculateButtonNativeInfo(AButtonViewInfo: TcxEditButtonViewInfo); virtual;
{$ENDIF}
  public
    AutoHeight: Boolean;
    BorderStyle: TcxEditBorderStyle;
    Bounds: TRect;
    ButtonVisibleCount: Integer;
    ContentOffset: TRect;
    Edit: TcxCustomEdit;
    EditState: TcxEditState;
    Enabled: Boolean;
    Focused: Boolean;
    HorzAlignment: TcxEditHorzAlignment;
    HScrollBar: TcxControlScrollBar;
    InnerEdit: IcxCustomInnerEdit;
    IsDesigning: Boolean;
    IsSelected: Boolean; // Row selected
    IsValueSource: Boolean;
    MaxLineCount: Integer;
    NativeStyle: Boolean;
    PaintOptions: TcxEditPaintOptions;
    Selected: Boolean;
    SelStart, SelLength: Integer;
    SelTextColor, SelBackgroundColor: TColor;
    VertAlignment: TcxEditVertAlignment;
    VScrollBar: TcxControlScrollBar;
{$IFDEF VCL}
    WindowHandle: HWND;
{$ENDIF}

    constructor Create(AProperties: TcxCustomEditProperties; AStyle: TcxContainerStyle;
      AIsInplace: Boolean); reintroduce; virtual;
    procedure Calculate(ACanvas: TcxCanvas; const ABounds: TRect; const P: TPoint;
      Button: TcxMouseButton; Shift: TShiftState; AViewInfo: TcxCustomEditViewInfo;
      AIsMouseEvent: Boolean); virtual;
    procedure CalculateButtonBounds(ACanvas: TcxCanvas; AViewInfo: TcxCustomEditViewInfo;
      AButtonVisibleIndex: Integer; var ButtonsRect: TRect); virtual;
    procedure CalculateButtonsViewInfo(ACanvas: TcxCanvas; const ABounds: TRect; const P: TPoint;
      Button: TcxMouseButton; Shift: TShiftState; AViewInfo: TcxCustomEditViewInfo;
      AIsMouseEvent: Boolean); virtual;
    procedure CalculateButtonViewInfo(ACanvas: TcxCanvas; AViewInfo: TcxCustomEditViewInfo;
      AButtonVisibleIndex: Integer; var ButtonsRect: TRect); virtual;
    procedure CalculateEx(ACanvas: TcxCanvas; const ABounds: TRect; const P: TPoint;
      Button: TcxMouseButton; Shift: TShiftState; AViewInfo: TcxCustomEditViewInfo;
      AIsMouseEvent: Boolean);
    procedure EditValueToDrawValue(ACanvas: TcxCanvas; const AEditValue: TcxEditValue;
      AViewInfo: TcxCustomEditViewInfo); virtual;
    function GetBorderExtent: TRect; virtual;
    function GetClientExtent(AViewInfo: TcxCustomEditViewInfo): TRect; virtual;
    function GetEditConstantPartSize(ACanvas: TcxCanvas;
      const AEditSizeProperties: TcxEditSizeProperties; var MinContentSize: TSize;
      AViewInfo: TcxCustomEditViewInfo = nil): TSize; virtual;
    function GetEditContentSize(ACanvas: TcxCanvas; const AEditValue: TcxEditValue;
      const AEditSizeProperties: TcxEditSizeProperties): TSize; virtual;
    function GetEditSize(ACanvas: TcxCanvas; const AEditValue: TcxEditValue;
      AEditSizeProperties: TcxEditSizeProperties): TSize;
    property IsInplace: Boolean read FIsInplace;
    property Properties: TcxCustomEditProperties read GetProperties write SetProperties;
    property Style: TcxCustomEditStyle read GetStyle write SetStyle;
  end;

  TcxCustomEditViewDataClass = class of TcxCustomEditViewData;

  { TcxEditStyleController }

  TcxEditStyle = class;

  TcxEditStyleController = class(TcxStyleController)
  private
    function GetStyle: TcxEditStyle;
    procedure SetStyle(Value: TcxEditStyle);
  protected
    function GetStyleClass: TcxContainerStyleClass; override;
  published
    property Style: TcxEditStyle read GetStyle write SetStyle;
    property OnStyleChanged;
  end;

  { TcxCustomEditStyle }

  TcxCustomEditStyle = class(TcxContainerStyle)
  private
    FButtonStyle: TcxEditButtonStyle;
    FButtonTransparency: TcxEditButtonTransparency;
    FPopupBorderStyle: TcxEditPopupBorderStyle;
    FPopupCloseButton: Boolean;

    function GetAssignedValues: TcxEditStyleValues;
    function GetBorderStyle: TcxEditBorderStyle;
    function GetButtonStyle: TcxEditButtonStyle;
    function GetButtonTransparency: TcxEditButtonTransparency;
    function GetEdit: TcxCustomEdit;
    function GetPopupBorderStyle: TcxEditPopupBorderStyle;
    function GetStyleController: TcxEditStyleController;

    function InternalGetButtonStyle(var ButtonStyle: TcxEditButtonStyle): Boolean;
    function InternalGetButtonTransparency(var ButtonTransparency: TcxEditButtonTransparency): Boolean;
    function InternalGetPopupBorderStyle(var PopupBorderStyle: TcxEditPopupBorderStyle): Boolean;

    function IsBorderStyleStored: Boolean;
    function IsButtonStyleStored: Boolean;
    function IsButtonTransparencyStored: Boolean;
    function IsPopupBorderStyleStored: Boolean;

    procedure SetAssignedValues(Value: TcxEditStyleValues);
    procedure SetBorderStyle(Value: TcxEditBorderStyle);
    procedure SetButtonStyle(Value: TcxEditButtonStyle);
    procedure SetButtonTransparency(Value: TcxEditButtonTransparency);
    procedure SetPopupBorderStyle(Value: TcxEditPopupBorderStyle);
    procedure SetPopupCloseButton(Value: Boolean);
    procedure SetStyleController(Value: TcxEditStyleController);
  protected
    function DefaultColor: TColor; override;
    function IsValueDefined(AValue: TcxEditStyleValue): Boolean; override;
    function DefaultButtonStyle: TcxEditButtonStyle; virtual;
    function DefaultButtonTransparency: TcxEditButtonTransparency; virtual;
    function DefaultPopupBorderStyle: TcxEditPopupBorderStyle; virtual;
    property PopupCloseButton: Boolean read FPopupCloseButton
      write SetPopupCloseButton default True;
  public
    constructor Create(AOwner: TPersistent; ADirectAccessMode: Boolean); override;
    procedure Assign(Source: TPersistent); override;
    class function GetStyleValueCount: Integer; override;
    class function GetStyleValueName(AStyleValue: TcxEditStyleValue;
      out StyleValueName: string): Boolean; override;
    property Edit: TcxCustomEdit read GetEdit;
  published
    property AssignedValues: TcxEditStyleValues read GetAssignedValues
      write SetAssignedValues stored False;
    property BorderStyle: TcxEditBorderStyle read GetBorderStyle
      write SetBorderStyle stored IsBorderStyleStored;
    property ButtonStyle: TcxEditButtonStyle read GetButtonStyle
      write SetButtonStyle stored IsButtonStyleStored;
    property ButtonTransparency: TcxEditButtonTransparency read GetButtonTransparency
      write SetButtonTransparency stored IsButtonTransparencyStored;
    property PopupBorderStyle: TcxEditPopupBorderStyle read GetPopupBorderStyle
      write SetPopupBorderStyle stored IsPopupBorderStyleStored;
    property StyleController: TcxEditStyleController read GetStyleController
      write SetStyleController;
  end;

  { TcxEditStyle }

  TcxEditStyle = class(TcxCustomEditStyle);

  { TcxCustomEditPropertiesValues }

  TcxCustomEditPropertiesValues = class(TPersistent)
  public
    ReadOnly: Boolean;
    procedure Assign(Source: TPersistent); override;
    procedure Reset; virtual;
  end;

  TcxCustomEditPropertiesValuesClass = class of TcxCustomEditPropertiesValues;

  { TcxCustomEditDefaultValuesProvider }

  TcxCustomEditDefaultValuesProvider = class(TcxInterfacedPersistent, IcxEditDefaultValuesProvider)
  private
    FOnChanged: TNotifyEvent;
    function GetOnChanged: TNotifyEvent;
    procedure SetOnChanged(Value: TNotifyEvent);
  protected
    procedure DoChanged;
  public
    destructor Destroy; override;
    procedure ChangedNotification;
    procedure ClearUsers;
    function DefaultAlignment: TAlignment; virtual;
    function DefaultBlobKind: TcxBlobKind; virtual;
    function DefaultCanModify: Boolean; virtual;
    function DefaultDisplayFormat: string; virtual;
    function DefaultEditMask: string; virtual;
    function DefaultIsFloatValue: Boolean; virtual;
    function DefaultMaxLength: Integer; virtual;
    function DefaultMaxValue: Double; virtual;
    function DefaultMinValue: Double; virtual;
    function DefaultReadOnly: Boolean; virtual;
    function DefaultRequired: Boolean; virtual;
    function GetInstance: TObject;
    function HasDisplayValueFormatting: Boolean; virtual;
    function IsBlob: Boolean; virtual;
    function IsDisplayFormatDefined(AIsCurrencyValueAccepted: Boolean): Boolean; virtual;
    function IsValidChar(AChar: Char): Boolean; virtual;
    property OnChanged: TNotifyEvent read GetOnChanged write SetOnChanged;
  end;

  TcxCustomEditDefaultValuesProviderClass = class of TcxCustomEditDefaultValuesProvider;

  { TcxCustomEditProperties }

  TcxEditButtonClickEvent = procedure (Sender: TObject; AButtonIndex: Integer) of object;
  TcxEditEditingEvent = procedure(Sender: TObject; var CanEdit: Boolean) of object;

  TcxCustomEditProperties = class(TcxInterfacedPersistent)
  private
    FAutoSelect: Boolean;
    FBeepOnError: Boolean;
    FButtons: TcxEditButtons;
    FClearKey: TShortCut;
    FClickKey: TShortCut;
    FEdit: TcxCustomEdit;
    FFreeNotificator: TcxFreeNotificator;
    FImmediatePost: Boolean;
    FInnerAlignment: TcxEditAlignment;
    FOwnerComponentState: TComponentState;
    FReadOnly: Boolean;
    FUpdateCount: Integer;
    FUseLeftAlignmentOnEditing: Boolean;
    FUseMouseWheel: Boolean;
    FValidateOnEnter: Boolean;
    FOnButtonClick: TcxEditButtonClickEvent;
    FOnChange: TNotifyEvent;
    FOnEditValueChanged: TNotifyEvent;
    FOnValidate: TcxEditValidateEvent;
    FOnPropertiesChanged: TNotifyEvent;
    function BaseGetAlignment: TcxEditAlignment;
    procedure DefaultValuesChanged(Sender: TObject);
    function GetReadOnly: Boolean;
    function IsAlignmentStored: Boolean;
    function IsUseLeftAlignmentOnEditingStored: Boolean;
    function IsReadOnlyStored: Boolean;
    procedure SetAutoSelect(Value: Boolean);
    procedure SetButtons(Value: TcxEditButtons);
    procedure SetUseLeftAlignmentOnEditing(Value: Boolean);
    procedure SetIDefaultValuesProvider(Value: IcxEditDefaultValuesProvider);
    procedure SetReadOnly(const Value: Boolean);
  protected
    FAlignment: TcxEditAlignment;
    FAssignedValues: TcxCustomEditPropertiesValues;
    FChangedLocked: Boolean;
    FIDefaultValuesProvider: IcxEditDefaultValuesProvider;
    FOwner: TPersistent;
    procedure AlignmentChangedHandler(Sender: TObject); virtual;
    procedure BaseSetAlignment(Value: TcxEditAlignment); virtual;
    procedure ButtonsChanged(Sender: TObject); virtual;
    function CanModify: Boolean;
    function CanValidate: Boolean; virtual;
    procedure Changed; virtual;
    function ChangedLocked: Boolean;
    function CompareEditValue: Boolean; virtual;
    function DefaultUseLeftAlignmentOnEditing: Boolean; virtual;
    procedure FreeNotification(Sender: TComponent); virtual;
    class function GetAssignedValuesClass: TcxCustomEditPropertiesValuesClass; virtual;
    function GetDefaultHorzAlignment: TAlignment; virtual;
    function GetDisplayFormatOptions: TcxEditDisplayFormatOptions; virtual;
    function GetValidateErrorText(AErrorKind: TcxEditErrorKind): TCaption; virtual;
    function GetValueEditorEditValueSource(AEditFocused: Boolean): TcxDataEditValueSource; virtual;
    class function GetViewDataClass: TcxCustomEditViewDataClass; virtual;
    function HasDisplayValue: Boolean; virtual;
    function IsValueEditorWithValueFormatting: Boolean;
    function TabsNeed: Boolean; virtual;
    function WantNavigationKeys: Boolean; virtual;
    property Alignment: TcxEditAlignment read BaseGetAlignment write BaseSetAlignment stored IsAlignmentStored;
    property AssignedValues: TcxCustomEditPropertiesValues read FAssignedValues;
    property AutoSelect: Boolean read FAutoSelect write SetAutoSelect default True;
    property BeepOnError: Boolean read FBeepOnError write FBeepOnError default False;
    property Buttons: TcxEditButtons read FButtons write SetButtons;
    property ClearKey: TShortCut read FClearKey write FClearKey default 0;
    property ClickKey: TShortCut read FClickKey write FClickKey default VK_RETURN + scCtrl;
    property DisplayFormatOptions: TcxEditDisplayFormatOptions read GetDisplayFormatOptions;
    property FreeNotificator: TcxFreeNotificator read FFreeNotificator;
    property IDefaultValuesProvider: IcxEditDefaultValuesProvider
      read FIDefaultValuesProvider write SetIDefaultValuesProvider;
    property ImmediatePost: Boolean read FImmediatePost write FImmediatePost default False;
    property ValidateOnEnter: Boolean read FValidateOnEnter write FValidateOnEnter default False;
    property OnButtonClick: TcxEditButtonClickEvent read FOnButtonClick write FOnButtonClick;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnEditValueChanged: TNotifyEvent read FOnEditValueChanged write FOnEditValueChanged;
    property OnPropertiesChanged: TNotifyEvent read FOnPropertiesChanged write FOnPropertiesChanged;
    property OnValidate: TcxEditValidateEvent read FOnValidate write FOnValidate;
  public
    constructor Create(AOwner: TPersistent); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    class function GetContainerClass: TcxContainerClass; virtual;
    class function GetStyleClass: TcxContainerStyleClass; virtual;
    class function GetViewInfoClass: TcxContainerViewInfoClass; virtual;
    procedure BeginUpdate;
    function CreateViewData(AStyle: TcxContainerStyle; AIsInplace: Boolean): TcxCustomEditViewData; virtual;
    procedure EndUpdate(AInvokeChanged: Boolean = True);
    function GetDisplayText(const AEditValue: TcxEditValue; AFullText: Boolean = False): WideString; virtual;
    function GetEditConstantPartSize(ACanvas: TcxCanvas; AEditStyle: TcxCustomEditStyle;
      AIsInplace: Boolean; const AEditSizeProperties: TcxEditSizeProperties;
      var MinContentSize: TSize): TSize;
    function GetEditContentSize(ACanvas: TcxCanvas; AEditStyle: TcxCustomEditStyle;
      AIsInplace: Boolean;  const AEditValue: TcxEditValue; const AEditSizeProperties:
      TcxEditSizeProperties): TSize;
    function GetEditSize(ACanvas: TcxCanvas; AEditStyle: TcxCustomEditStyle;
      AIsInplace: Boolean; const AEditValue: TcxEditValue; AEditSizeProperties:
      TcxEditSizeProperties): TSize;
    function GetSupportedOperations: TcxEditSupportedOperations; virtual;
    function IsEditValueValid(var EditValue: TcxEditValue; AEditFocused: Boolean): Boolean; virtual;
    function IsResetEditClass: Boolean; virtual;
    procedure Loaded; virtual;
    procedure LockUpdate(ALock: Boolean);
    procedure PrepareDisplayValue(const AEditValue: TcxEditValue; var DisplayValue: TcxEditValue; AEditFocused: Boolean); virtual;
    procedure RestoreDefaults;
    procedure Update(AProperties: TcxCustomEditProperties); virtual;
    procedure ValidateDisplayValue(var DisplayValue: TcxEditValue; var ErrorText: TCaption;
      var Error: Boolean; AEdit: TcxCustomEdit); virtual;
    function GetEditValueSource(AEditFocused: Boolean): TcxDataEditValueSource; virtual;
    property OwnerComponentState: TComponentState read FOwnerComponentState write FOwnerComponentState;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly stored IsReadOnlyStored;
    property UseLeftAlignmentOnEditing: Boolean read FUseLeftAlignmentOnEditing
      write SetUseLeftAlignmentOnEditing stored IsUseLeftAlignmentOnEditingStored;
    property UseMouseWheel: Boolean read FUseMouseWheel write FUseMouseWheel default True;
  end;

  { TcxDataBinding }

  TcxDataBinding = class(TcxCustomDataBinding)
  end;

  { TcxEditDataBinding }

  TInterfacedObjectClass = class of TInterfacedObject;

  TcxEditDataBinding = class(TPersistent)
  private
    FIDefaultValuesProvider: TcxCustomEditDefaultValuesProvider;
    function GetIDefaultValuesProvider: IcxEditDefaultValuesProvider;
  protected
    FEdit: TcxCustomEdit;
    function CanCheckEditorValue: Boolean; virtual;
    function CanSetEditMode: Boolean; virtual;
    procedure DefaultValuesChanged; virtual;
    function ExecuteAction(Action: TBasicAction): Boolean; virtual;
    function GetDisplayValue: TcxEditValue; virtual;
    function GetEditDataBindingInstance: TcxEditDataBinding;
    function GetModified: Boolean; virtual;
    function GetOwner: TPersistent; override;
    function GetStoredValue: TcxEditValue; virtual;
    procedure Reset; virtual;
    procedure SetInternalDisplayValue(const Value: TcxEditValue);
    procedure SetDisplayValue(const Value: TcxEditValue); virtual;
    function SetEditMode: Boolean; virtual;
    procedure SetStoredValue(const Value: TcxEditValue); virtual;
    function UpdateAction(Action: TBasicAction): Boolean; virtual;
    procedure UpdateDisplayValue; virtual;
    property Edit: TcxCustomEdit read FEdit;
    property IDefaultValuesProvider: IcxEditDefaultValuesProvider read GetIDefaultValuesProvider;
  public
    constructor Create(AEdit: TcxCustomEdit); virtual;
    destructor Destroy; override;
    class function GetDefaultValuesProviderClass: TcxCustomEditDefaultValuesProviderClass; virtual;
    procedure UpdateEdit; virtual;
    property DisplayValue: TcxEditValue read GetDisplayValue write SetDisplayValue;
    property Modified: Boolean read GetModified;
    property StoredValue: TcxEditValue read GetStoredValue write SetStoredValue;
  end;

  TcxEditDataBindingClass = class of TcxEditDataBinding;

  { TcxEditRepositoryItemListenerEditHelper }

  TcxEditRepositoryItemListenerEditHelper = class
  private
    FEdit: TcxCustomEdit;
  public
    constructor Create(AEdit: TcxCustomEdit);
    procedure ItemRemoved(Sender: TcxEditRepositoryItem);
    procedure PropertiesChanged(Sender: TcxEditRepositoryItem);
  end;

  { TcxCustomEdit }

{$IFNDEF VCL}
  TControlClass = class of TControl;
{$ENDIF}

  TcxEditModifiedState = record
    Modified: Boolean;
    ModifiedAfterEnter: Boolean;
  end;

  { TcxCustomEditData }

  TcxCustomEditData = class(TObject)
  private
    FCleared: Boolean;
    FEdit: TcxCustomEdit;
    FFreeNotificator: TcxFreeNotificator;
    procedure FreeNotification(AComponent: TComponent);
  protected
    property Cleared: Boolean read FCleared write FCleared;
  public
    constructor Create(AEdit: TcxCustomEdit);
    destructor Destroy; override;
    procedure Clear;
  end;

  TcxCustomEditDataClass = class of TcxCustomEditData;

  TcxEditChangeEventsCatcher = record
    OnChangeEvent: Boolean;
    OnEditValueChangedEvent: Boolean;
  end;

  TcxCustomEdit = class(TcxContainer, IcxEditRepositoryItemListener)
  private
    FAutoSize: Boolean;
    FCaptureButtonVisibleIndex: Integer;
    FChangeEventsCatcher: TcxEditChangeEventsCatcher;
    FChangeEventsLockCount: Integer;
    FDblClickTimer: TTimer;
    FEditData: TcxCustomEditData;
    FEditRepositoryItemListenerHelper: TcxEditRepositoryItemListenerEditHelper;
    FEditValueChangingLocked: Boolean;
    FFocused: Boolean;
    FInnerEdit: IcxCustomInnerEdit;
    FIsEditValidated: Boolean;
    FIsInplace: Boolean;
    FIsPosting: Boolean;
    FKeyboardAction: Boolean;
    FLockValidate: Integer;
    FModified: Boolean;
    FModifiedAfterEnter: Boolean;
    FPopupMenu: TPopupMenu;
    FPrevEditValue: TcxEditValue;
    FPrevModifiedList: TList;
    FRepositoryItem: TcxEditRepositoryItem;
    FUpdate: Boolean;
    FValidateErrorProcessing: Boolean;
    FOnAfterKeyDown: TKeyEvent;
    FOnEditing: TcxEditEditingEvent;
    FOnPostEditValue: TNotifyEvent;
{$IFDEF VCL}
    FObjectInstance: Pointer;
    FInnerEditDefWindowProc: Pointer;
{$ENDIF}
    procedure DblClickTimerHandler(Sender: TObject);
    procedure DoClearEditData(AEditData: TcxCustomEditData);
    function GetProperties: TcxCustomEditProperties;
    function GetStyle: TcxCustomEditStyle;
    function GetViewInfo: TcxCustomEditViewInfo;
    function IsPropertiesStored: Boolean;
    procedure SetDataBinding(Value: TcxEditDataBinding);
    procedure SetEditAutoSize(Value: Boolean);
    procedure SetModified(Value: Boolean);
    procedure SetModifiedAfterEnter(Value: Boolean);
    procedure SetProperties(Value: TcxCustomEditProperties);
    procedure SetRepositoryItem(Value: TcxEditRepositoryItem);
    procedure SetStyle(Value: TcxCustomEditStyle);
{$IFDEF VCL}
    procedure WMCopy(var Message: TMessage); message WM_COPY;
    procedure WMCut(var Message); message WM_CUT;
    procedure WMPaste(var Message: TMessage); message WM_PASTE;
    procedure CMEditValidationError(var Message: TMessage); message CM_EDITVALIDATIONERROR;
    procedure CMShowingChanged(var Message: TMessage); message CM_SHOWINGCHANGED;
    procedure CMSysColorChange(var Message: TMessage); message CM_SYSCOLORCHANGE;
{$ENDIF}
  protected
    FDataBinding: TcxEditDataBinding;
    FEditValue: TcxEditValue;
    FProperties: TcxCustomEditProperties;
    FSettingEditWindowRegion: Boolean;
    FPropertiesEvents: TNotifyEvent;
    function CanResize(var NewWidth, NewHeight: Integer): Boolean; {$IFDEF VCL}override;{$ELSE}virtual;{$ENDIF}
    procedure Click; override;
    procedure DblClick; override;
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure FocusChanged; override;
    function GetPopupMenu: TPopupMenu; override;
    class function GetStyleClass: TcxContainerStyleClass; override;
    class function GetViewInfoClass: TcxContainerViewInfoClass; override;
    function GetVisibleBounds: TRect; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure KeyUp(var Key: Word; Shift: TShiftState); override;
    procedure Loaded; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseLeave(AControl: TControl); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure Paint; override;
    procedure ReadState(Reader: TReader); override;
    function RefreshContainer(const P: TPoint; Button: TcxMouseButton; Shift: TShiftState;
      AIsMouseEvent: Boolean): Boolean; override;
    procedure SetName(const Value: TComponentName); override;
    procedure SetSize; override;
    function TabsNeeded: Boolean; override;
{$IFDEF VCL}
    procedure CreateHandle; override;
    procedure WndProc(var Message: TMessage); override;
{$ELSE}
    procedure ChangeBounds(ALeft, ATop, AWidth, AHeight: Integer); override;
    procedure CreateWidget; override;
    function EventFilter(Sender: QObjectH; Event: QEventH): Boolean; override;
    procedure InitWidget; override;
{$ENDIF}
    procedure AdjustInnerEditPosition(AInnerEditHeight: Integer); virtual;
    procedure AfterPosting; virtual;
    function AreChangeEventsLocked: Boolean;
    procedure BeforePosting; virtual;
    function ButtonVisibleIndexAt(const P: TPoint): Integer;
    procedure CalculateViewInfo(AIsMouseEvent: Boolean); reintroduce; overload;
    procedure CalculateViewInfo(P: TPoint; Button: TcxMouseButton;
      Shift: TShiftState; AIsMouseEvent: Boolean); reintroduce; overload;
    function CanAutoSize: Boolean; reintroduce; virtual;
    function CanAutoWidth: Boolean; virtual;
    function CanKeyDownModifyEdit(Key: Word; Shift: TShiftState): Boolean; virtual;
    function CanKeyPressModifyEdit(Key: Char): Boolean; virtual;
    function CanModify: Boolean; virtual;
    procedure ChangeHandler(Sender: TObject); virtual;
    function CreateInnerEdit: IcxCustomInnerEdit; virtual;
    function CreateViewData: TcxCustomEditViewData; virtual;
    procedure DefaultButtonClick; virtual;
    procedure DisableValidate;
    procedure DoAfterKeyDown(var Key: Word; Shift: TShiftState);
    procedure DoButtonClick(AButtonVisibleIndex: Integer); virtual;
    procedure DoButtonDown(AButtonVisibleIndex: Integer); virtual;
    procedure DoButtonUp(AButtonVisibleIndex: Integer); virtual;
    procedure DoChange;
    function DoEditing: Boolean;
    procedure DoEditValueChanged;
    procedure DoEditKeyDown(var Key: Word; Shift: TShiftState); virtual;
    procedure DoEditKeyPress(var Key: Char); virtual;
    procedure DoEditKeyUp(var Key: Word; Shift: TShiftState); virtual;
    procedure DoHideEdit(AExit: Boolean);
    procedure DoPostEditValue;
    procedure EnableValidate;
    procedure FillSizeProperties(var AEditSizeProperties: TcxEditSizeProperties); virtual;
    function GetAutoPostEditValue: Boolean;
    class function GetDataBindingClass: TcxEditDataBindingClass; reintroduce; virtual;
    function GetDisplayValue: TCaption; virtual;
    function GetEditDataClass: TcxCustomEditDataClass; virtual;
    function GetEditValue: TcxEditValue; virtual;
    function GetInnerEditClass: TControlClass; virtual;
    function HandleMouseWheel(Shift: TShiftState): Boolean;
    procedure HandleValidationError(const ErrorText: TCaption); virtual;
    function HasInnerEdit: Boolean;
    procedure InitializeEditData; virtual;
    procedure InitializeInnerEdit; virtual;
    procedure InitializeViewData(AViewData: TcxCustomEditViewData); virtual;
    function InternalDoEditing: Boolean; virtual;
    function InternalGetPopupMenu: TPopupMenu; virtual;
    function InternalGetProperties: TcxCustomEditProperties;
    procedure InternalSetDisplayValue(const Value: TcxEditValue); virtual;
    procedure InternalSetEditValue(const Value: TcxEditValue;
      AValidateEditValue: Boolean); virtual;
    procedure InternalValidateDisplayValue(const ADisplayValue: TcxEditValue); virtual;
    function IsActiveControl: Boolean; virtual;
    function IsClickEnabledDuringLoading: Boolean; virtual;
    function IsEditClass: Boolean; virtual;
    function IsEditorKey(Key: Word; Shift: TShiftState): Boolean; virtual;
    function IsEditValueStored: Boolean; virtual;
    function IsRepositoryItemAcceptable(ARepositoryItem: TcxEditRepositoryItem): Boolean; virtual;
    function IsValidChar(AChar: Char): Boolean; virtual;
    procedure PrepareDisplayValue(const AEditValue: TcxEditValue;
      var DisplayValue: TcxEditValue; AEditFocused: Boolean); virtual;
    procedure PostEditValue;
    procedure ProcessViewInfoChanges(APrevViewInfo: TcxCustomEditViewInfo; AIsMouseDownUpEvent: Boolean); virtual;
    procedure PropertiesChanged(Sender: TObject); virtual;
    function PropertiesChangeLocked: Boolean;
    procedure RepositoryItemAssigned; virtual;
    procedure RepositoryItemAssigning; virtual;
    procedure ResetEditValue; virtual;
    procedure RestoreModified;
    procedure SaveModified;
    function SendActivationKey(Key: Char): Boolean; virtual;
    function SetDisplayText(const Value: TCaption): Boolean; virtual;
    procedure SetEditValue(const Value: TcxEditValue); virtual;
    procedure SetInternalDisplayValue(Value: TcxEditValue); virtual;
    function ShortRefreshContainer(AIsMouseEvent: Boolean): Boolean;
    procedure SynchronizeDisplayValue; virtual;
    procedure SynchronizeEditValue; virtual;
    procedure UpdateDrawValue; virtual;
    function ValidateKeyDown(var Key: Word; Shift: TShiftState): Boolean; virtual;
    function ValidateKeyPress(var Key: Char): Boolean; virtual;
{$IFDEF VCL}
    procedure LockedInnerEditWindowProc(var Message: TMessage); virtual;
    procedure LockInnerEditRepainting; virtual;
    procedure ThemeChanged; override;
    procedure UnlockInnerEditRepainting; virtual;
{$ENDIF}
    property AutoPostEditValue: Boolean read GetAutoPostEditValue;
    property AutoSize: Boolean read FAutoSize write SetEditAutoSize default True;
    property CaptureButtonVisibleIndex: Integer read FCaptureButtonVisibleIndex write
      FCaptureButtonVisibleIndex;
    property DataBinding: TcxEditDataBinding read FDataBinding write SetDataBinding;
    property DisplayValue: TCaption read GetDisplayValue;
    property EditData: TcxCustomEditData read FEditData;
    property EditRepositoryItemListenerHelper: TcxEditRepositoryItemListenerEditHelper
      read FEditRepositoryItemListenerHelper implements IcxEditRepositoryItemListener;
    property EditValueChangingLocked: Boolean read FEditValueChangingLocked;
    property InnerEdit: IcxCustomInnerEdit read FInnerEdit;
    property IsEditValidated: Boolean read FIsEditValidated write FIsEditValidated;
    property IsInplace: Boolean read FIsInplace;
    property KeyboardAction: Boolean read FKeyboardAction write FKeyboardAction;
    property PrevEditValue: TcxEditValue read FPrevEditValue write FPrevEditValue;
    property Properties: TcxCustomEditProperties read GetProperties write SetProperties
      stored IsPropertiesStored;
    property Style: TcxCustomEditStyle read GetStyle write SetStyle;
    property ViewInfo: TcxCustomEditViewInfo read GetViewInfo;
  public
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; AIsInplace: Boolean); reintroduce; overload;
    destructor Destroy; override;
    procedure AfterConstruction; override;
    function ExecuteAction(Action: TBasicAction): Boolean; override;
    class function GetNotPublishedStyleValues: TcxEditStyleValues; override;
    procedure GetTabOrderList(List: TList); override;
    function UpdateAction(Action: TBasicAction): Boolean; override;
{$IFDEF VCL}
    procedure SetFocus; override;
{$ENDIF}
    procedure Activate(var AEditData: TcxCustomEditData); virtual;
    procedure ActivateByKey(Key: Char; var AEditData: TcxCustomEditData); virtual;
    procedure ActivateByMouse(Shift: TShiftState; X, Y: Integer;
      var AEditData: TcxCustomEditData); virtual;
    function Deactivate: Boolean; virtual;
    procedure Clear; virtual;
    procedure CopyToClipboard; virtual;
    procedure CutToClipboard; virtual;
    class function GetPropertiesClass: TcxCustomEditPropertiesClass; virtual;
    function HasPopupWindow: Boolean; virtual;
    function InternalFocused: Boolean; virtual;
    procedure LockChangeEvents(ALock: Boolean; AInvokeChangedOnUnlock: Boolean = True);
    procedure PasteFromClipboard; virtual;
    procedure PrepareEditValue(const ADisplayValue: TcxEditValue;
      out EditValue: TcxEditValue; AEditFocused: Boolean); virtual;
    procedure Reset;
    procedure SelectAll; virtual;
    function ValidateEdit(ARaiseExceptionOnError: Boolean): Boolean;
    property EditModified: Boolean read FModified write SetModified;
    property EditValue: TcxEditValue read GetEditValue write SetEditValue stored
      IsEditValueStored;
    property IsPosting: Boolean read FIsPosting;
    property ModifiedAfterEnter: Boolean read FModifiedAfterEnter write SetModifiedAfterEnter;
    property TabStop default True;
    property OnAfterKeyDown: TKeyEvent read FOnAfterKeyDown write FOnAfterKeyDown;
    property OnEditing: TcxEditEditingEvent read FOnEditing write FOnEditing;
    property OnPostEditValue: TNotifyEvent read FOnPostEditValue write FOnPostEditValue;
  published
    property PropertiesEvents: TNotifyEvent read FPropertiesEvents write FPropertiesEvents;
    property RepositoryItem: TcxEditRepositoryItem read FRepositoryItem write SetRepositoryItem;
    property OnFocusChanged;
  end;

  TcxCustomEditClass = class of TcxCustomEdit;

  { TcxEditAlignment }

  TcxEditAlignment = class(TPersistent)
  private
    FHorz: TcxEditHorzAlignment;
    FIsHorzAssigned: Boolean;
    FOwner: TPersistent;
    FVert: TcxEditVertAlignment;
    FOnChanged: TNotifyEvent;
    function GetProperties: TcxCustomEditProperties;
    procedure SetHorz(const Value: TcxEditHorzAlignment);
    procedure SetVert(const Value: TcxEditVertAlignment);
  protected
    function DefaultVertAlignment: TcxEditVertAlignment;
    procedure DoChanged;
    function GetOwner: TPersistent; override;
    property Properties: TcxCustomEditProperties read GetProperties;
    property OnChanged: TNotifyEvent read FOnChanged write FOnChanged;
  public
    constructor Create(AOwner: TPersistent); virtual;
    procedure Assign(Source: TPersistent); override;
    function IsHorzStored: Boolean;
    function IsVertStored: Boolean;
    procedure Reset;
  published
    property Horz: TcxEditHorzAlignment read FHorz write SetHorz stored IsHorzStored;
    property Vert: TcxEditVertAlignment read FVert write SetVert stored IsVertStored;
  end;

  PcxEditListItem = ^TcxEditListItem;
  TcxEditListItem = record
    Edit: TcxCustomEdit;
    Properties: TcxCustomEditProperties;
  end;

  { TcxInplaceEditList }

  TcxInplaceEditList = class
  private
    FItems: TList;
    function GetCount: Integer;
    function GetItem(Index: Integer): PcxEditListItem;
    procedure DestroyItems;
  protected
    function CreateEdit(AProperties: TcxCustomEditProperties): TcxCustomEdit; virtual;
    function FindEdit(AProperties: TcxCustomEditProperties): TcxCustomEdit;
    function FindItem(AProperties: TcxCustomEditProperties): PcxEditListItem;
    property Count: Integer read GetCount;
    property Items[Index: Integer]: PcxEditListItem read GetItem;
  public
    constructor Create;
    destructor Destroy; override;
    function GetEdit(AProperties: TcxCustomEditProperties): TcxCustomEdit; overload;
    function GetEdit(APropertiesClass: TcxCustomEditPropertiesClass): TcxCustomEdit; overload;
    procedure RemoveItem(AItem: PcxEditListItem); overload;
    procedure RemoveItem(AProperties: TcxCustomEditProperties); overload;
  end;

{$IFDEF BCB}
  {$IFNDEF CBUILDER5}
  // CBuilder4's IDE problem
  A = class(TInterfacedObject)
  end;
  {$ENDIF}
{$ENDIF}

function ButtonToShift(Button: TMouseButton): TShiftState;
procedure CheckSize(var Size: TSize; const ANewSize: TSize);
function cxButtonToShift(Button: TcxMouseButton): TShiftState;
function GetDefaultEditRepository: TcxEditRepository;
function GetOwnerComponent(APersistent: TPersistent): TComponent;
function GetRegisteredEditProperties: TcxRegisteredClasses;
function InternalVarEqualsExact(const V1, V2: Variant): Boolean;
procedure SendKeyDown(AReceiver: TWinControl; Key: Word; Shift: TShiftState);
procedure SendKeyPress(AReceiver: TWinControl; Key: Char);
procedure SendKeyUp(AReceiver: TWinControl; Key: Word; Shift: TShiftState);
procedure UniteRegions(ADestRgn, ASrcRgn: TcxRegion);
{$IFDEF VCL}
function ShiftStateToKeys(Shift: TShiftState): Word;
{$ELSE}
function ButtonStateToMouseButton(AButtonState: ButtonState): TMouseButton;
procedure SendKey(AControlHandle: QOpenWidgetH; AKey: Char);
function ShiftStateToButtonState(Shift: TShiftState): Integer;
{$ENDIF}

implementation

uses
{$IFDEF DELPHI6}
  Variants,
{$ENDIF}
  cxDateUtils, cxEditConsts, cxEditUtils, cxFilterConsts;

{$IFNDEF VCL}
const
  VK_BACK = Key_Backspace;
  VK_DELETE = Key_Delete;
  VK_TAB = Key_Tab;
{$ENDIF}

type
  TCanvasAccess = class(TCanvas);
  TControlAccess = class(TControl);
  TcxRegionAccess = class(TcxRegion);
  TPersistentAccess = class(TPersistent);
  TWinControlAccess = class(TWinControl);

var
  FDefaultEditRepository: TcxEditRepository;
  FCreatedEditPropertiesList: TList;
  FRegisteredEditProperties: TcxRegisteredClasses;

function ButtonToShift(Button: TMouseButton): TShiftState;
const
  AButtonMap: array[TMouseButton] of TShiftState = ([ssLeft], [ssRight], [ssMiddle]);
begin
  Result := AButtonMap[Button];
end;

procedure CheckSize(var Size: TSize; const ANewSize: TSize);
begin
  with ANewSize do
  begin
    if Size.cx < cx then
      Size.cx := cx;
    if Size.cy < cy then
      Size.cy := cy;
  end;
end;

function cxButtonToShift(Button: TcxMouseButton): TShiftState;
const
  AButtonMap: array[TcxMouseButton] of TShiftState = ([], [ssLeft], [ssRight], [ssMiddle]);
begin
  Result := AButtonMap[Button];
end;

function GetDefaultEditRepository: TcxEditRepository;
begin
  if FDefaultEditRepository = nil then
    FDefaultEditRepository := TcxEditRepository.Create(nil);
  Result := FDefaultEditRepository;
end;

function GetOwnerComponent(APersistent: TPersistent): TComponent;
begin
  while (APersistent <> nil) and not(APersistent is TComponent) do
    APersistent := TPersistentAccess(APersistent).GetOwner;
  Result := TComponent(APersistent);
end;

function GetRegisteredEditProperties: TcxRegisteredClasses;
begin
  if FRegisteredEditProperties = nil then
    FRegisteredEditProperties := TcxRegisteredClasses.Create;
  Result := FRegisteredEditProperties;
end;

function InternalVarEqualsExact(const V1, V2: Variant): Boolean;
begin
  Result := (VarType(V1) = VarType(V2)) and VarEqualsExact(V1, V2);
end;

function IsRegionEmpty(ARgn: TcxRegion): Boolean;
{$IFDEF VCL}
var
  R: TRect;
begin
  Result := GetRgnBox(TcxRegionAccess(ARgn).Handle, R) = NULLREGION;
end;
{$ELSE}
begin
  Result := QRegion_isEmpty(TcxRegionAccess(ARgn).Handle);
end;
{$ENDIF}

{$IFDEF VCL}
procedure SendKeyDown(AReceiver: TWinControl; Key: Word; Shift: TShiftState);
begin
  SendMessage(AReceiver.Handle, WM_KEYDOWN, Key, 0);
end;
{$ELSE}
procedure SendKeyDown(AReceiver: TWinControl; Key: Word; Shift: TShiftState);
var
  AKeyEvent: QKeyEventH;
  S: WideString;
begin
  S := WideChar(Key);
  AKeyEvent := QKeyEvent_create(QEventType_KeyPress, Integer(Key), Integer(Key), ShiftStateToButtonState(Shift), @S, True, 1);
  QOpenWidget_event(QOPenWidgetH(AReceiver.Handle), AKeyEvent);
  QKeyEvent_destroy(AKeyEvent);
end;
{$ENDIF}

{$IFDEF VCL}
procedure SendKeyPress(AReceiver: TWinControl; Key: Char);
begin
  SendMessage(AReceiver.Handle, WM_CHAR, Integer(Key), 0);
end;
{$ELSE}
procedure SendKeyPress(AReceiver: TWinControl; Key: Char);
var
  AKeyEvent: QKeyEventH;
  S: WideString;
begin
  S := Key;
  AKeyEvent := QKeyEvent_create(QEventType_KeyPress, Integer(Key), Integer(Key), 0, @S, True, 1);
  QOpenWidget_event(QOPenWidgetH(AReceiver.Handle), AKeyEvent);
  QKeyEvent_destroy(AKeyEvent);
end;
{$ENDIF}

{$IFDEF VCL}
procedure SendKeyUp(AReceiver: TWinControl; Key: Word; Shift: TShiftState);
begin
  SendMessage(AReceiver.Handle, WM_KEYUP, Key, 0);
end;
{$ELSE}
procedure SendKeyUp(AReceiver: TWinControl; Key: Word; Shift: TShiftState);
var
  AKeyEvent: QKeyEventH;
  S: WideString;
begin
  S := WideChar(Key);
  AKeyEvent := QKeyEvent_create(QEventType_KeyRelease, Integer(Key), Integer(Key), ShiftStateToButtonState(Shift), @S, True, 1);
  QOpenWidget_event(QOPenWidgetH(AReceiver.Handle), AKeyEvent);
  QKeyEvent_destroy(AKeyEvent);
end;
{$ENDIF}

procedure UniteRegions(ADestRgn, ASrcRgn: TcxRegion);
begin
{$IFDEF VCL}
  with TcxRegionAccess(ADestRgn) do
    CombineRgn(Handle, Handle, TcxRegionAccess(ASrcRgn).Handle, RGN_OR);
{$ELSE}
  with TcxRegionAccess(ADestRgn) do
    QRegion_unite(Handle, Handle, TcxRegionAccess(ASrcRgn).Handle);
{$ENDIF}
end;

{$IFDEF VCL}
function ShiftStateToKeys(Shift: TShiftState): Word;
begin
  Result := 0;
  if ssShift in Shift then
    Result := Result or MK_SHIFT;
  if ssCtrl in Shift then
    Result := Result or MK_CONTROL;
  if ssLeft in Shift then
    Result := Result or MK_LBUTTON;
  if ssMiddle in Shift then
    Result := Result or MK_MBUTTON;
  if ssRight in Shift then
    Result := Result or MK_RBUTTON;
end;
{$ELSE}
function ButtonStateToMouseButton(AButtonState: ButtonState): TMouseButton;
begin
  if Integer(ButtonState_MidButton) and Integer(AButtonState) <> 0 then
    Result := mbMiddle
  else
    if Integer(ButtonState_RightButton) and Integer(AButtonState) <> 0 then
      Result := mbRight
    else
      Result := mbLeft;
end;

procedure SendKey(AControlHandle: QOpenWidgetH; AKey: Char);
var
  AKeyEvent: QKeyEventH;
  S: WideString;
begin
  S := AKey;
  AKeyEvent := QKeyEvent_create(QEventType_KeyPress, Integer(AKey), Integer(AKey), 0, @S, True, 1);
  QOpenWidget_event(AControlHandle, AKeyEvent);
  QKeyEvent_destroy(AKeyEvent);
end;

function ShiftStateToButtonState(Shift: TShiftState): Integer;
const
  AStateMap: array[0..5] of TShiftState = ([ssLeft], [ssRight], [ssMiddle],
    [ssShift], [ssCtrl], [ssAlt]);
var
  I: Integer;
  AMask: Integer;
begin
  Result := 0;
  AMask := 1;
  for I := Low(AStateMap) to High(AStateMap) do
  begin
    if Shift * AStateMap[I] <> [] then
      Inc(Result, AMask);
    AMask := AMask shl 1;
  end;
end;
{$ENDIF}

{ TcxEditRepositoryItem }

constructor TcxEditRepositoryItem.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FListenerList := TInterfaceList.Create;
  FProperties := GetEditPropertiesClass.Create(Self);
  FProperties.OnPropertiesChanged := PropertiesChanged;
end;

destructor TcxEditRepositoryItem.Destroy;

  procedure RemoveNotification;
  var
    I: Integer;
  begin
    for I := FListenerList.Count - 1 downto 0 do
      IcxEditRepositoryItemListener(FListenerList[I]).ItemRemoved(Self);
  end;

begin
  RemoveNotification;
  Repository := nil;
  FProperties.Free;
  inherited Destroy;
end;

procedure TcxEditRepositoryItem.AddListener(AListener: IcxEditRepositoryItemListener);
begin
  if FListenerList.IndexOf(AListener) = -1 then
    FListenerList.Add(AListener);
end;

class function TcxEditRepositoryItem.GetEditPropertiesClass: TcxCustomEditPropertiesClass;
begin
  Result := TcxCustomEditProperties;
end;

function TcxEditRepositoryItem.GetParentComponent: TComponent;
begin
  Result := Repository;
end;

function TcxEditRepositoryItem.HasParent: Boolean;
begin
  Result := Repository <> nil;
end;

procedure TcxEditRepositoryItem.RemoveListener(AListener: IcxEditRepositoryItemListener);
begin
  FListenerList.Remove(AListener);
end;

procedure TcxEditRepositoryItem.SetParentComponent(AParent: TComponent);
begin
  if not (csLoading in ComponentState) then
    Repository := AParent as TcxEditRepository;
end;

procedure TcxEditRepositoryItem.PropertiesChanged(Sender: TObject);
var
  I: Integer;
begin
  for I := FListenerList.Count - 1 downto 0 do
    IcxEditRepositoryItemListener(FListenerList[I]).PropertiesChanged(Self);
end;

procedure TcxEditRepositoryItem.ReadState(Reader: TReader);
begin
  inherited ReadState(Reader);
  Repository := TcxEditRepository(Reader.Parent);
end;

procedure TcxEditRepositoryItem.SetProperties(Value: TcxCustomEditProperties);
begin
  FProperties.Assign(Value);
end;

procedure TcxEditRepositoryItem.SetRepository(Value: TcxEditRepository);
begin
  if FRepository <> Value then
  begin
    if FRepository <> nil then
      FRepository.RemoveItem(Self);
    FRepository := Value;
    if Value <> nil then
      Value.AddItem(Self);
  end;
end;

{ TcxEditRepository }

constructor TcxEditRepository.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FItems := TList.Create;
end;

destructor TcxEditRepository.Destroy;
begin
  Clear;
  FItems.Free;
  FItems := nil;
  inherited Destroy;
end;

procedure TcxEditRepository.Clear;
begin
  while Count > 0 do
    Items[Count - 1].Free;
end;

function TcxEditRepository.CreateItem(ARepositoryItemClass: TcxEditRepositoryItemClass): TcxEditRepositoryItem;
begin
  Result := CreateItemEx(ARepositoryItemClass, Self);
end;

function TcxEditRepository.CreateItemEx(ARepositoryItemClass: TcxEditRepositoryItemClass;
  AOwner: TComponent): TcxEditRepositoryItem;
begin
  Result := ARepositoryItemClass.Create(AOwner);
  Result.Repository := Self;
end;

function TcxEditRepository.ItemByName(ARepositoryItemName: string): TcxEditRepositoryItem;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to Count - 1 do
    if AnsiCompareText(Items[I].Name, ARepositoryItemName) = 0 then
    begin
      Result := Items[I];
      Break;
    end;
end;

procedure TcxEditRepository.AddItem(AItem: TcxEditRepositoryItem);
var
  AIndex: Integer;
begin
  AIndex := FItems.IndexOf(AItem);
  if AIndex = -1 then
    FItems.Add(AItem);
end;

procedure TcxEditRepository.GetChildren(Proc: TGetChildProc; Root: TComponent);
var
  AItem: TcxEditRepositoryItem;
  I: Integer;
begin
  for I := 0 to Count - 1 do
  begin
    AItem := Items[I];
    if AItem.Owner = Root then
      Proc(AItem);
  end;
end;

procedure TcxEditRepository.RemoveItem(AItem: TcxEditRepositoryItem);
begin
  FItems.Remove(AItem);
end;

function TcxEditRepository.GetCount: Integer;
begin
  Result := FItems.Count;
end;

function TcxEditRepository.GetItem(Index: Integer): TcxEditRepositoryItem;
begin
  Result := FItems[Index];
end;

{ TcxEditButtonViewInfo }

procedure TcxEditButtonViewInfo.Assign(Source: TPersistent);
begin
  if Source is TcxEditButtonViewInfo then
    with Source as TcxEditButtonViewInfo do
    begin
{$IFDEF VCL}
      Self.Data.ComboBoxStyle := Data.ComboBoxStyle;
      Self.Data.NativeState := Data.NativeState;
{$ENDIF}
      Self.Data.BackgroundColor := Data.BackgroundColor;
      Self.Bounds := Bounds;
      Self.Data.Style := Data.Style;
      Self.Glyph := Glyph;
      Self.Index := Index;
      Self.Data.Kind := Data.Kind;
      Self.Data.NativeStyle := Data.NativeStyle;
      Self.Data.State := Data.State;
      Self.Data.Transparent := Data.Transparent;
    end
  else
    inherited Assign(Source);
end;

function TcxEditButtonViewInfo.GetUpdateRegion(AViewInfo: TcxEditButtonViewInfo): TcxRegion;
var
  AEquals: Boolean;
begin
  with AViewInfo do
  begin
    AEquals := Self.Data.Style = Data.Style;
    AEquals := AEquals and (Self.Data.State = Data.State);
    AEquals := AEquals and (Self.Data.BackgroundColor = Data.BackgroundColor);
{$IFDEF VCL}
    AEquals := AEquals and (Self.Data.NativeState = Data.NativeState);
{$ENDIF}
  end;
  if AEquals then
    Result := TcxRegion.Create
  else
    Result := TcxRegion.Create(Bounds);
end;

function TcxEditButtonViewInfo.Repaint(AControl: TWinControl;
  AViewInfo: TcxEditButtonViewInfo; const AEditPosition: TPoint): Boolean;
var
  R: TRect;
begin
  with AViewInfo do
  begin
    Result := Self.Data.Style <> Data.Style;
    Result := Result or (Self.Data.State <> Data.State);
    Result := Result or (Self.Data.BackgroundColor <> Data.BackgroundColor);
{$IFDEF VCL}
    Result := Result or (Self.Data.NativeState <> Data.NativeState);
{$ENDIF}
  end;
  if Result then
  begin
    R := Bounds;
    OffsetRect(R, AEditPosition.X, AEditPosition.Y);
    InternalInvalidate(AControl.Handle, R, cxEmptyRect, HasBackground);
  end;
end;

{ TcxEditButton }

constructor TcxEditButton.Create(Collection: TCollection);
var
  AOwnerComponent: TComponent;
begin
  inherited Create(Collection);
  FKind := bkDown;
  FVisible := True;

  if Collection.Count = 1 then
  begin
    AOwnerComponent := GetOwnerComponent(Self);
    if (AOwnerComponent <> nil) then
      with AOwnerComponent do
        if (csDesigning in ComponentState) and not(csLoading in ComponentState) then
          FDefault := True;
  end;
end;

destructor TcxEditButton.Destroy;
begin
  if FGlyph <> nil then
    FreeAndNil(FGlyph);
  inherited Destroy;
end;

procedure TcxEditButton.Assign(Source: TPersistent);
begin
  if Source is TcxEditButton then
  begin
    if Assigned(Collection) then Collection.BeginUpdate;
    try
      with Source as TcxEditButton do
      begin
        Self.Default := Default;
        Self.Glyph := Glyph;
        Self.Kind := Kind;
        Self.LeftAlignment := LeftAlignment;
        Self.Visible := Visible;
        Self.Width := Width;
      end
    finally
      if Assigned(Collection) then Collection.EndUpdate;
    end
  end
  else
    inherited Assign(Source);
end;

function TcxEditButton.GetGlyph: TBitmap;
begin
  if FGlyph = nil then
    FGlyph := TBitmap.Create;
  FGlyph.OnChange := GlyphChanged;
  Result := FGlyph;
end;

procedure TcxEditButton.GlyphChanged(Sender: TObject);
begin
  Changed(False);
end;

procedure TcxEditButton.SetDefault(Value: Boolean);
var
  I: Integer;
begin
  if FDefault <> Value then
  begin
    if Value and Assigned(Collection) and (Collection is TcxEditButtons) then
      with Collection as TcxEditButtons do
        for I := 0 to Count - 1 do
          Items[I].FDefault := False;
    FDefault := Value;
    Changed(True);
  end;
end;

procedure TcxEditButton.SetGlyph(Value: TBitmap);
begin
  if Value <> nil then
    Glyph.Assign(Value)
  else
    if FGlyph <> nil then
      FreeAndNil(FGlyph);
  Changed(False);
end;

procedure TcxEditButton.SetKind(Value: TcxEditButtonKind);
begin
  if FKind <> Value then
  begin
    FKind := Value;
    Changed(False);
  end;
end;

procedure TcxEditButton.SetLeftAlignment(Value: Boolean);
begin
  if FLeftAlignment <> Value then
  begin
    FLeftAlignment := Value;
    Changed(False);
  end;
end;

procedure TcxEditButton.SetVisible(Value: Boolean);
begin
  if FVisible <> Value then
  begin
    FVisible := Value;
    Changed(False);
  end;
end;

procedure TcxEditButton.SetWidth(Value: Integer);
begin
  if FWidth <> Value then
  begin
    FWidth := Value;
    Changed(False);
  end;
end;

{ TcxEditButtons }

constructor TcxEditButtons.Create(AOwner: TPersistent);
begin
  FOwner := AOwner;
  inherited Create(TcxEditButton);
end;

function TcxEditButtons.GetOwner: TPersistent;
begin
  Result := FOwner;
end;

procedure TcxEditButtons.Update(Item: TCollectionItem);
begin
  if Assigned(FOnChange) then
    FOnChange(Self);
end;

function TcxEditButtons.GetItem(Index: Integer): TcxEditButton;
begin
  Result := TcxEditButton(inherited GetItem(Index));
end;

function TcxEditButtons.GetVisibleCount: Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to Count - 1 do
    if TcxEditButton(Items[I]).Visible then
      Inc(Result);
end;

procedure TcxEditButtons.SetItem(Index: Integer; Value: TcxEditButton);
begin
  inherited SetItem(Index, Value);
end;

{ TcxCustomEditViewInfo }

constructor TcxCustomEditViewInfo.Create;
begin
  PressedButton := -1;
  SelectedButton := -1;
end;

destructor TcxCustomEditViewInfo.Destroy;
begin
  SetButtonCount(0);
  inherited Destroy;
end;

procedure TcxCustomEditViewInfo.Assign(Source: TObject);
var
  I: Integer;
begin
  if Source is TcxCustomEditViewInfo then
    with Source as TcxCustomEditViewInfo do
    begin
      Self.BorderColor := BorderColor;
      Self.BorderStyle := BorderStyle;
{$IFDEF VCL}
      Self.EditNativeState := EditNativeState;
{$ENDIF}
      Self.SetButtonCount(Length(ButtonsInfo));
      for I := 0 to Length(ButtonsInfo) - 1 do
        Self.ButtonsInfo[I].Assign(ButtonsInfo[I]);
      Self.PressedButton := PressedButton;
      Self.SelectedButton := SelectedButton;
    end;
  inherited Assign(Source);
end;

procedure TcxCustomEditViewInfo.DrawButton(ACanvas: TcxCanvas; AButtonVisibleIndex: Integer);
begin
  DrawEditButton(ACanvas, Self, AButtonVisibleIndex);
end;

procedure TcxCustomEditViewInfo.DrawButtonBorder(ACanvas: TcxCanvas; AButtonVisibleIndex: Integer;
  AButtonStyle: TcxEditButtonStyle; const ARect: TRect);
begin
  DrawEditButtonBorder(ACanvas, Self, AButtonVisibleIndex, AButtonStyle, ARect);
end;

procedure TcxCustomEditViewInfo.DrawButtonContent(ACanvas: TcxCanvas;
  AButtonVisibleIndex: Integer; const AContentRect: TRect; APenColor: TColor;
  ABrushColor: TColor);
begin
  DrawEditButtonContent(ACanvas, Self, AButtonVisibleIndex, AContentRect, APenColor,
    ABrushColor);
end;

function TcxCustomEditViewInfo.GetUpdateRegion(AViewInfo: TcxContainerViewInfo): TcxRegion;
var
  I: Integer;
  AEquals: Boolean;
  ATempRgn: TcxRegion;
begin
  Result := inherited GetUpdateRegion(AViewInfo);
  if not(AViewInfo is TcxCustomEditViewInfo) then
    Exit;
  with TcxCustomEditViewInfo(AViewInfo) do
  begin
    AEquals := (Self.BorderColor = BorderColor) or (Self.BorderStyle = ebsNone);
    AEquals := AEquals and (Self.BorderStyle = BorderStyle);
    AEquals := AEquals and (Length(Self.ButtonsInfo) = Length(ButtonsInfo));
{$IFDEF VCL}
    AEquals := AEquals and (Self.EditNativeState = EditNativeState);
{$ENDIF}
    if not AEquals then
    begin
      if not IsRectEmpty(Self.Bounds) then
      begin
        ATempRgn := TcxRegion.Create(Self.Bounds);
        UniteRegions(Result, ATempRgn);
        ATempRgn.Free;
      end;
      Exit;
    end;
    for I := 0 to Length(Self.ButtonsInfo) - 1 do
    begin
      ATempRgn := Self.ButtonsInfo[I].GetUpdateRegion(ButtonsInfo[I]);
      if not IsRegionEmpty(ATempRgn) then
        UniteRegions(Result, ATempRgn);
      ATempRgn.Free;
    end;
  end;
end;

function TcxCustomEditViewInfo.IsHotTrack: Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 0 to Length(ButtonsInfo) - 1 do
    if ButtonsInfo[I].Data.State = ebsSelected then
    begin
      Result := True;
      Break;
    end;
end;

function TcxCustomEditViewInfo.NeedShowHint(ACanvas: TcxCanvas;
  const P: TPoint; out AText: TCaption; out AIsMultiLine: Boolean;
  out ATextRect: TRect): Boolean;
begin
  Result := NeedShowHint(ACanvas, P, cxEmptyRect, AText, AIsMultiLine, ATextRect);
end;

function TcxCustomEditViewInfo.NeedShowHint(ACanvas: TcxCanvas;
  const P: TPoint; AVisibleBounds: TRect; out AText: TCaption;
  out AIsMultiLine: Boolean; out ATextRect: TRect): Boolean;
begin
  Result := False;
end;

procedure TcxCustomEditViewInfo.Offset(DX, DY: Integer);
var
  I: Integer;
begin
  inherited Offset(DX, DY);
  OffsetRect(InnerEditRect, DX, DY);
  OffsetRect(ShadowRect, DX, DY);
  for I := 0 to Length(ButtonsInfo) - 1 do
    with ButtonsInfo[I] do
    begin
      OffsetRect(Bounds, DX, DY);
      OffsetRect(VisibleBounds, DX, DY);
    end;
end;

procedure TcxCustomEditViewInfo.PaintEx(ACanvas: TcxCanvas);
{$IFDEF VCL}
var
  P: TPoint;
  ACanvasHandle: HDC;
begin
  ACanvasHandle := ACanvas.Handle;
  GetWindowOrgEx(ACanvasHandle, P);
  Dec(P.X, Left);
  Dec(P.Y, Top);
  SetWindowOrgEx(ACanvasHandle, P.X, P.Y, @P);
  try
    Paint(ACanvas);
  finally
    SetWindowOrgEx(ACanvasHandle, P.X, P.Y, nil);
  end;
end;
{$ELSE}
var
  R: TRect;
  ACanvasHandle: QPainterH;
begin
  ACanvas.Canvas.Start;
  try
    ACanvasHandle := ACanvas.Handle;
    QPainter_window(ACanvasHandle, @R);
    OffsetRect(R, -Left, -Top);
    QPainter_setWindow(ACanvasHandle, @R);
    try
      Paint(ACanvas);
    finally
      OffsetRect(R, Left, Top);
      QPainter_setWindow(ACanvasHandle, @R);
    end;
  finally
    ACanvas.Canvas.Stop;
  end;
end;
{$ENDIF}

function TcxCustomEditViewInfo.Repaint(AControl: TWinControl; AViewInfo:
  TcxContainerViewInfo = nil; APInnerEditRect: PRect = nil): Boolean;

  procedure CheckRect(var R: TRect);
  begin
    with ClientRect do
    begin
      if R.Left < Left then R.Left := Left;
      if R.Top < Top then R.Top := Top;
      if R.Right > Right then R.Right := Right;
      if R.Bottom > Bottom then R.Bottom := Bottom;
    end;
  end;

  function GetInnerEditRect: TRect;
  begin
    if APInnerEditRect = nil then
      FillChar(Result, SizeOf(Result), 0)
    else
    begin
      Result := APInnerEditRect^;
      CheckRect(Result);
    end;
  end;

  function RepaintButtons: Boolean;
  var
    I: Integer;
    AEditPosition: TPoint;
  begin
    Result := False;
    AEditPosition := Point(Left, Top);
    with TcxCustomEditViewInfo(AViewInfo) do
      for I := 0 to Length(Self.ButtonsInfo) - 1 do
        if Self.ButtonsInfo[I].Repaint(AControl, ButtonsInfo[I], AEditPosition) then
          Result := True;
  end;

var
  R, R1: TRect;
begin
  R := Bounds;
  OffsetRect(R, Left, Top);
  if AViewInfo = nil then
  begin
    InternalInvalidate(AControl.Handle, R, GetInnerEditRect, HasBackground);
    Result := False;
    Exit;
  end;
  with TcxCustomEditViewInfo(AViewInfo) do
  begin
    Result := True;
    while True do
    begin
{$IFDEF VCL}
      if Self.EditNativeState <> EditNativeState then
      begin
        R1 := GetInnerEditRect;
        Break;
      end;
{$ENDIF}
      if Length(Self.ButtonsInfo) <> Length(ButtonsInfo) then
      begin
        R1 := GetInnerEditRect;
        Break;
      end;
      if (Self.BorderColor <> BorderColor) and (Self.BorderStyle <> ebsNone) or
          (Self.BorderStyle <> BorderStyle) then
      begin
        R1 := Self.BorderRect;
        OffsetRect(R1, Self.Left, Self.Top);
{$IFNDEF VCL}
        Inc(R1.Top);
{$ENDIF}
        Break;
      end;
      Result := False;
      Break;
    end;
    if Result then
      if not IsRectEmpty(Self.Bounds) and not EqualRect(R, R1) then
        InternalInvalidate(AControl.Handle, R, R1, HasBackground);
    if (Length(Self.ButtonsInfo) = Length(ButtonsInfo)) and RepaintButtons then
      Result := True;
  end;
end;

procedure TcxCustomEditViewInfo.InternalPaint(ACanvas: TcxCanvas);
begin
  DrawCustomEdit(ACanvas, Self, True, bpsSolid);
end;

function TcxCustomEditViewInfo.GetButtonViewInfoClass: TcxEditButtonViewInfoClass;
begin
  Result := TcxEditButtonViewInfo;
end;

procedure TcxCustomEditViewInfo.SetButtonCount(ACount: Integer);
var
  I: Integer;
  APrevLength: Integer;
begin
  APrevLength := Length(ButtonsInfo);
  if APrevLength <> ACount then
  begin
    if ACount < APrevLength then
    begin
      for I := Length(ButtonsInfo) - 1 downto ACount do
        ButtonsInfo[I].Free;
      SetLength(ButtonsInfo, ACount);
    end else
    begin
      SetLength(ButtonsInfo, ACount);
      for I := APrevLength to ACount - 1 do
        ButtonsInfo[I] := GetButtonViewInfoClass.Create;
    end;
  end;  
end;

{ TcxCustomEditViewData }

constructor TcxCustomEditViewData.Create(AProperties: TcxCustomEditProperties;
  AStyle: TcxContainerStyle; AIsInplace: Boolean);
begin
  FIsInplace := AIsInplace;
  FProperties := AProperties;
  FStyle := AStyle;
  Initialize;
  SelTextColor := clDefault;
  SelBackgroundColor := clDefault;
  InitCacheData;
end;

procedure TcxCustomEditViewData.Calculate(ACanvas: TcxCanvas; const ABounds: TRect;
  const P: TPoint; Button: TcxMouseButton; Shift: TShiftState;
  AViewInfo: TcxCustomEditViewInfo; AIsMouseEvent: Boolean);
const
  ADefaultPopupBorderStyleMap: array [TcxEditBorderStyle] of TcxEditPopupBorderStyle = (
    epbsFlat, epbsSingle, epbsSingle, epbsFlat, epbsSingle, epbsSingle
  );
  AInplaceDefaultPopupBorderStyleMap: array [TcxLookAndFeelKind] of TcxEditPopupBorderStyle = (
    epbsFlat, epbsFrame3D, epbsSingle
  );
var
  AClientExtent: TRect;
begin
  Bounds := ABounds;
  AViewInfo.Bounds := ABounds;
  begin
    AViewInfo.Edges := Style.Edges;
    AViewInfo.Enabled := Enabled;
    AViewInfo.Focused := Focused;
    AViewInfo.HasBackground := (Edit <> nil) and Edit.HasBackground;
    AViewInfo.HasInnerEdit := (InnerEdit <> nil) and (InnerEdit.Control.Visible);
    AViewInfo.IsInplace := IsInplace;
    AViewInfo.IsSelected := IsSelected;
    AViewInfo.PaintOptions := PaintOptions;
    AViewInfo.Shadow := not IsInplace and IsShadowDrawingNeeded(Self);
  end;
{$IFDEF VCL}
  AViewInfo.WindowHandle := WindowHandle;
{$ENDIF}

  if Enabled then
    if IsDesigning then
      EditState := [esNormal]
    else
    begin
      if Focused then
        EditState := [esActive]
      else
        EditState := [esNormal];
      if PtInRect(GetEditVisibleBounds(AViewInfo, ABounds), P) and
          ((Shift = []) or (Edit <> nil) and (GetCaptureControl = Edit)) then
        Include(EditState, esHotTrack);
    end
  else
    EditState := [esDisabled];

  AViewInfo.EditState := EditState;
  Selected := EditState * [esActive, esHotTrack] <> [];
  if IsDesigning or not Style.HotTrack or IsInplace then
    AViewInfo.HotState := chsNoHotTrack
  else
    if Selected then
      AViewInfo.HotState := chsSelected
    else
      AViewInfo.HotState := chsNormal;
  AViewInfo.BorderStyle := GetBorderStyle(AViewInfo.HotState);

  CalculateCustomEditViewInfo(Self, AViewInfo, AIsMouseEvent);

  CalculateButtonsViewInfo(ACanvas, ABounds, P, Button, Shift, AViewInfo, AIsMouseEvent);

  AViewInfo.ClientRect := ABounds;
  AClientExtent := GetClientExtent(AViewInfo);
  ExtendRect(AViewInfo.ClientRect, AClientExtent);
  if InnerEdit <> nil then
    AViewInfo.InnerEditRect := InnerEdit.Control.BoundsRect
  else
    AViewInfo.InnerEditRect := AViewInfo.ClientRect;

  AViewInfo.PopupBorderStyle := Style.PopupBorderStyle;
  if AViewInfo.PopupBorderStyle = epbsDefault then
    if IsInplace then
      AViewInfo.PopupBorderStyle := AInplaceDefaultPopupBorderStyleMap[Style.LookAndFeel.Kind]
    else
      AViewInfo.PopupBorderStyle := ADefaultPopupBorderStyleMap[AViewInfo.BorderStyle];
end;

procedure TcxCustomEditViewData.CalculateButtonBounds(ACanvas: TcxCanvas;
  AViewInfo: TcxCustomEditViewInfo; AButtonVisibleIndex: Integer;
  var ButtonsRect: TRect);
var
  AButtonVisibleWidth, AButtonWidth: Integer;
begin
  with AViewInfo.ButtonsInfo[AButtonVisibleIndex] do
  begin
    if IsRectEmpty(ButtonsRect) then
    begin
      FillChar(Bounds, SizeOf(Bounds), 0);
      VisibleBounds := Bounds;
    end else
    begin
      Bounds.Top := ButtonsRect.Top;
      Bounds.Bottom := ButtonsRect.Bottom;
      AButtonWidth := CalculateEditDefaultButtonWidth(ACanvas, AViewInfo.ButtonsInfo[AButtonVisibleIndex]);
      if AButtonWidth > ButtonsRect.Right - ButtonsRect.Left then
        AButtonVisibleWidth := ButtonsRect.Right - ButtonsRect.Left
      else
        AButtonVisibleWidth := AButtonWidth;
      if Data.LeftAlignment then
      begin
        Bounds.Left := ButtonsRect.Left;
        Bounds.Right := Bounds.Left + AButtonWidth;
        VisibleBounds := Bounds;
        VisibleBounds.Right := VisibleBounds.Left + AButtonVisibleWidth;
        Inc(ButtonsRect.Left, AButtonVisibleWidth);
        if FLeftSideLeftmostButtonIndex = -1 then
          FLeftSideLeftmostButtonIndex := AButtonVisibleIndex;
        FLeftSideRightmostButtonIndex := AButtonVisibleIndex;
      end else
      begin
        Bounds.Right := ButtonsRect.Right;
        Bounds.Left := Bounds.Right - AButtonWidth;
        VisibleBounds := Bounds;
        VisibleBounds.Left := VisibleBounds.Right - AButtonVisibleWidth;
        Dec(ButtonsRect.Right, AButtonVisibleWidth);
        if FRightSideRightmostButtonIndex = -1 then
          FRightSideRightmostButtonIndex := AButtonVisibleIndex;
        FRightSideLeftmostButtonIndex := AButtonVisibleIndex;
      end;
    end;
  end;
end;

procedure TcxCustomEditViewData.CalculateButtonsViewInfo(ACanvas: TcxCanvas;
  const ABounds: TRect; const P: TPoint; Button: TcxMouseButton; Shift: TShiftState;
  AViewInfo: TcxCustomEditViewInfo; AIsMouseEvent: Boolean);
var
  AButton: TcxEditButton;
  AButtonExtent: TRect;
  AButtonIndex, AButtonVisibleIndex: Integer;
  AButtonsRect: TRect;
  AButtonStyle: TcxEditButtonStyle;
  AButtonViewInfo: TcxEditButtonViewInfo;
  ACapturePressing: Boolean;
  AEditBorderStyle: TcxEditBorderStyle;
  AHoldPressing: Boolean;
  AIsButtonPressed: Boolean;
  AMouseButtonPressing: Boolean;
  APrevPressedButton: Integer;
begin
  if ButtonVisibleCount = 0 then
  begin
    AViewInfo.SetButtonCount(ButtonVisibleCount);
    Exit;
  end;
  if not(esActive in EditState) then
    if (Style.ButtonTransparency = ebtHideInactive) or
      (not(esHotTrack in EditState) and (Style.ButtonTransparency = ebtHideUnselected)) then
    begin
      AViewInfo.SetButtonCount(0);
      Exit;
    end;
  AViewInfo.SetButtonCount(ButtonVisibleCount);
  AViewInfo.IsButtonReallyPressed := False;
  if AIsMouseEvent then
    APrevPressedButton := AViewInfo.PressedButton
  else
    APrevPressedButton := -1;
  AViewInfo.PressedButton := -1;
  AViewInfo.SelectedButton := -1;

  AButtonStyle := Style.ButtonStyle;
  AEditBorderStyle := GetDefaultBorderStyle(AViewInfo.HotState);
  if AButtonStyle = btsDefault then
    case AEditBorderStyle of
      ebsNone:
        if BorderStyle = ebsUltraFlat then
          AButtonStyle := btsUltraFlat
        else
          AButtonStyle := btsSimple;
      ebsSingle:
        if BorderStyle = ebsUltraFlat then
          AButtonStyle := btsUltraFlat
        else
          AButtonStyle := btsHotFlat;
      ebsThick, ebs3D: AButtonStyle := bts3D;
      ebsFlat: AButtonStyle := btsFlat;
    end;

  AButtonExtent := GetEditButtonsExtent(ACanvas, Self);
  AButtonsRect := ABounds;
  ExtendRect(AButtonsRect, AButtonExtent);
  AButtonVisibleIndex := Properties.Buttons.VisibleCount - 1;

  FLeftSideLeftmostButtonIndex := -1;
  FLeftSideRightmostButtonIndex := -1;
  FRightSideLeftmostButtonIndex := -1;
  FRightSideRightmostButtonIndex := -1;
  for AButtonIndex := Properties.Buttons.Count - 1 downto 0 do
  begin
    AButton := Properties.Buttons[AButtonIndex];
    if AButton.Visible then
    begin
      AButtonViewInfo := AViewInfo.ButtonsInfo[AButtonVisibleIndex];
      AButtonViewInfo.Index := AButtonIndex;
      AButtonViewInfo.Data.Style := AButtonStyle;
      CalculateButtonViewInfo(ACanvas, AViewInfo, AButtonVisibleIndex, AButtonsRect);

      AIsButtonPressed := IsButtonPressed(AViewInfo, AButtonVisibleIndex);
      with AButtonViewInfo do
      begin
        if not Enabled then
          Data.State := ebsDisabled
        else
          if AIsButtonPressed or (not IsDesigning and PtInRect(VisibleBounds, P)) then
          begin
            ACapturePressing := (Button = cxmbNone) and (ButtonToShift(mbLeft) *
              Shift <> []) and (Data.State = ebsNormal) and (GetCaptureButtonVisibleIndex =
              AButtonVisibleIndex);
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
              AViewInfo.SelectedButton := AButtonVisibleIndex;
            end
            else
              if (AIsButtonPressed or ACapturePressing and CanPressButton(AViewInfo, AButtonVisibleIndex) or ((Shift = [ssLeft]) or (Shift = [ssLeft, ssDouble])) and
                ((Button = cxmbLeft) and CanPressButton(AViewInfo, AButtonVisibleIndex) or
                (APrevPressedButton = AButtonVisibleIndex))) or AHoldPressing then
              begin
                Data.State := ebsPressed;
                AViewInfo.PressedButton := AButtonVisibleIndex;
              end
              else
                Data.State := ebsNormal;
          end
          else
            Data.State := ebsNormal;

{$IFDEF VCL}
        CalculateButtonNativeInfo(AViewInfo.ButtonsInfo[AButtonVisibleIndex]);
{$ENDIF}
      end;

      Dec(AButtonVisibleIndex);
    end;
  end;
  AButtonsRect := ABounds;
  ExtendRect(AButtonsRect, AButtonExtent);
  if FLeftSideLeftmostButtonIndex <> -1 then
    AViewInfo.ButtonsInfo[FLeftSideLeftmostButtonIndex].Data.Leftmost := True;
  if FLeftSideRightmostButtonIndex <> -1 then
    with AViewInfo.ButtonsInfo[FLeftSideRightmostButtonIndex] do
    begin
      Data.Rightmost := True;
      if not IsRectEmpty(Bounds) and (Data.Style = btsHotFlat){$IFDEF VCL} and
          (Data.NativePart = TC_NONE){$ENDIF} then
      begin
        Inc(Bounds.Right);
        if (FRightSideLeftmostButtonIndex = -1) and (VisibleBounds.Right < AButtonsRect.Right) then
          Inc(VisibleBounds.Right);
      end;
    end;
  if FRightSideLeftmostButtonIndex <> -1 then
    with AViewInfo.ButtonsInfo[FRightSideLeftmostButtonIndex] do
    begin
      Data.Leftmost := True;
      if not IsRectEmpty(Bounds) and (Data.Style = btsHotFlat){$IFDEF VCL} and
          (Data.NativePart = TC_NONE){$ENDIF} then
      begin
        Dec(Bounds.Left);
        if (FLeftSideRightmostButtonIndex = -1) and (VisibleBounds.Left > AButtonsRect.Left) then
          Dec(VisibleBounds.Left);
      end;
    end;
  if FRightSideRightmostButtonIndex <> -1 then
    AViewInfo.ButtonsInfo[FRightSideRightmostButtonIndex].Data.Rightmost := True;
end;

procedure TcxCustomEditViewData.CalculateButtonViewInfo(ACanvas: TcxCanvas;
  AViewInfo: TcxCustomEditViewInfo; AButtonVisibleIndex: Integer; var ButtonsRect: TRect);
var
  AButton: TcxEditButton;
begin
  with AViewInfo.ButtonsInfo[AButtonVisibleIndex] do
  begin
    AButton := Properties.Buttons[Index];
{$IFDEF VCL}
    Data.ComboBoxStyle := (Length(AViewInfo.ButtonsInfo) = 1) and
      (AButton.Kind = bkDown);
{$ENDIF}
    Data.Default := AButton.Default;
    Glyph := AButton.Glyph;
    HasBackground := AViewInfo.HasBackground;
    Data.IsInplace := Self.IsInplace;
    Data.Kind := AButton.Kind;
    Data.LeftAlignment := AButton.LeftAlignment;
    Data.Leftmost := False;
    Data.Rightmost := False;
    Data.NativeStyle := AViewInfo.NativeStyle;
    Width := AButton.Width;
    Data.Transparent := (Self.Style.ButtonTransparency = ebtAlways) or
      ((Self.Style.ButtonTransparency = ebtInactive) and not Selected);
    Data.BackgroundColor := AViewInfo.BackgroundColor;

    CalculateButtonBounds(ACanvas, AViewInfo, AButtonVisibleIndex, ButtonsRect);
  end;
end;

procedure TcxCustomEditViewData.CalculateEx(ACanvas: TcxCanvas; const ABounds: TRect;
  const P: TPoint; Button: TcxMouseButton; Shift: TShiftState;
  AViewInfo: TcxCustomEditViewInfo; AIsMouseEvent: Boolean);
var
  ANewBounds: TRect;
  ANewP: TPoint;
begin
  AViewInfo.Left := ABounds.Left;
  AViewInfo.Top := ABounds.Top;
  ANewBounds := ABounds;
  OffsetRect(ANewBounds, -ABounds.Left, -ABounds.Top);
  ANewP := Point(P.X - ABounds.Left, P.Y - ABounds.Top);
  Calculate(ACanvas, ANewBounds, ANewP, Button, Shift, AViewInfo, AIsMouseEvent);
end;

procedure TcxCustomEditViewData.EditValueToDrawValue(ACanvas: TcxCanvas;
  const AEditValue: TcxEditValue; AViewInfo: TcxCustomEditViewInfo);
begin
end;

function TcxCustomEditViewData.GetBorderExtent: TRect;
begin
  Result := GetEditBorderExtent(Self);
end;

function TcxCustomEditViewData.GetClientExtent(AViewInfo: TcxCustomEditViewInfo): TRect;
var
  I: Integer;
begin
  Result := GetBorderExtent;
  if HScrollBar <> nil then
    Inc(Result.Bottom, HScrollBar.Height);
  if VScrollBar <> nil then
    Inc(Result.Right, VScrollBar.Width);
  for I := 0 to Length(AViewInfo.ButtonsInfo) - 1 do
    with AViewInfo.ButtonsInfo[I] do
      if Data.LeftAlignment then
      begin
        if Bounds.Right - AViewInfo.Bounds.Left > Result.Left then
          Result.Left := Bounds.Right - AViewInfo.Bounds.Left
      end else
      begin
        if AViewInfo.Bounds.Right - Bounds.Left > Result.Right then
          Result.Right := AViewInfo.Bounds.Right - Bounds.Left;
      end;
end;

function TcxCustomEditViewData.GetEditConstantPartSize(ACanvas: TcxCanvas;
  const AEditSizeProperties: TcxEditSizeProperties; var MinContentSize: TSize;
  AViewInfo: TcxCustomEditViewInfo = nil): TSize;
var
  ATempViewInfo: TcxCustomEditViewInfo;
  R: TRect;
begin
  if AViewInfo = nil then
    ATempViewInfo := TcxCustomEditViewInfo(Properties.GetViewInfoClass.Create)
  else
    ATempViewInfo := AViewInfo;
  try
    if AViewInfo = nil then
    begin
//      if AEditSizeProperties.Width < 0 then
        R := Rect(0, 0, MaxInt, MaxInt);
//      else
 //        R := Rect(0, 0, AEditSizeProperties.Width, MaxInt);
      Calculate(ACanvas, R, Point(-1, -1), cxmbNone,
        [], ATempViewInfo, False);
    end;
    Result := InternalGetEditConstantPartSize(ACanvas, IsInplace, AEditSizeProperties,
      MinContentSize, ATempViewInfo);
  finally
    if AViewInfo = nil then
      FreeAndNil(ATempViewInfo);
  end;
end;

function TcxCustomEditViewData.GetEditContentSize(ACanvas: TcxCanvas; const AEditValue:
  TcxEditValue; const AEditSizeProperties: TcxEditSizeProperties): TSize;
begin
  FillChar(Result, SizeOf(Result), 0);
end;

function TcxCustomEditViewData.GetEditSize(ACanvas: TcxCanvas; const AEditValue: TcxEditValue;
  AEditSizeProperties: TcxEditSizeProperties): TSize;
var
  AContentSize, AMinContentSize: TSize;
  ATooNarrowEdit: Boolean;
  APrevWidth: Integer;
begin
  Result := GetEditConstantPartSize(ACanvas, AEditSizeProperties,
    AMinContentSize);
  ATooNarrowEdit := False;
  with AEditSizeProperties do
  begin
    APrevWidth := Width;
    if Width >= 0 then
    begin
      Width := Width - Result.cx;
      ATooNarrowEdit := Width < 0;
      if ATooNarrowEdit then
        Width := 0;
    end;
  end;
  AContentSize := GetEditContentSize(ACanvas, AEditValue, AEditSizeProperties);
  CheckSize(AContentSize, AMinContentSize);
  if ATooNarrowEdit then
    Result.cx := APrevWidth
  else
    Inc(Result.cx, AContentSize.cx);
  Inc(Result.cy, AContentSize.cy);
end;

function TcxCustomEditViewData.CanPressButton(AViewInfo: TcxCustomEditViewInfo;
  AButtonVisibleIndex: Integer): Boolean;
begin
  Result := True;
end;

function TcxCustomEditViewData.GetBorderStyle(AEditHotState: TcxContainerHotState): TcxEditBorderStyle;
begin
  if IsInplace then
    Result := ebsNone
  else
    Result := GetDefaultBorderStyle(AEditHotState);
end;

function TcxCustomEditViewData.GetCaptureButtonVisibleIndex: Integer;
begin
  Result := -1;
  with Properties do
    if Edit <> nil then
      Result := Edit.FCaptureButtonVisibleIndex;
end;

function TcxCustomEditViewData.GetDefaultBorderStyle(AEditHotState: TcxContainerHotState): TcxEditBorderStyle;
const
  cxEditBorderStyleCorrectionA: array [TcxContainerHotState, TcxEditBorderStyle] of TcxEditBorderStyle = (
    (ebsNone, ebsSingle, ebsThick, ebsFlat, ebs3D, ebsSingle),
    (ebsNone, ebsSingle, ebsThick, ebsFlat, ebs3D, ebsSingle),
    (ebsFlat, ebsThick, ebsThick, ebs3D, ebs3D, ebsSingle)
  );
begin
  Result := cxEditBorderStyleCorrectionA[AEditHotState, BorderStyle];
end;

procedure TcxCustomEditViewData.Initialize;
begin
  FillChar(ContentOffset, SizeOf(ContentOffset), 0);
  Enabled := True;
end;

procedure TcxCustomEditViewData.InitCacheData;
begin
  BorderStyle := Style.BorderStyle;
  ButtonVisibleCount := Properties.Buttons.VisibleCount;
  IsValueSource := Properties.GetEditValueSource(False) = evsValue;
  with Properties.Alignment do
  begin
    HorzAlignment := Horz;
    VertAlignment := Vert;
  end;
{$IFDEF VCL}
  NativeStyle := AreVisualStylesMustBeUsed(Style.LookAndFeel.NativeStyle, totEdit);
{$ELSE}
  NativeStyle := False;
{$ENDIF}
end;

function TcxCustomEditViewData.InternalFocused: Boolean;
begin
  if Edit <> nil then
    Result := Edit.InternalFocused
  else
    Result := Focused;
end;

function TcxCustomEditViewData.InternalGetEditConstantPartSize(ACanvas: TcxCanvas;
  AIsInplace: Boolean; const AEditSizeProperties: TcxEditSizeProperties;
  var MinContentSize: TSize; AViewInfo: TcxCustomEditViewInfo): TSize;
var
  AMaxButtonGlyphHeight: Integer;
  I: Integer;
begin
  FillChar(MinContentSize, SizeOf(MinContentSize), 0);
  with AViewInfo.ClientRect do
  begin
    Result.cx := Left - Bounds.Left + (Bounds.Right - Right);
    Result.cy := Top - Bounds.Top + (Bounds.Bottom - Bottom);
  end;

//  if not IsInplace and (Edit <> nil) and Edit.AutoSize or (AEditSizeProperties.Width > 0) then
  if IsInplace or (Edit <> nil) and Edit.AutoSize then
  begin
    AMaxButtonGlyphHeight := 0;
    for I := 0 to Length(AViewInfo.ButtonsInfo) - 1 do
      with AViewInfo.ButtonsInfo[I] do
        if (Data.Kind = bkGlyph) and VerifyBitmap(Glyph) then
          if Glyph.Height > AMaxButtonGlyphHeight then
            AMaxButtonGlyphHeight := Glyph.Height;
    if AMaxButtonGlyphHeight > 0 then
    begin
      with GetEditButtonsExtent(ACanvas, Self) do
        Inc(AMaxButtonGlyphHeight, Top + Bottom);
      Inc(AMaxButtonGlyphHeight, GetEditButtonsContentVerticalOffset(ACanvas, AViewInfo));
      MinContentSize.cy := AMaxButtonGlyphHeight - Result.cy;
      if MinContentSize.cy < 0 then
        MinContentSize.cy := 0;
    end;
  end;
end;

function TcxCustomEditViewData.IsButtonPressed(AViewInfo: TcxCustomEditViewInfo;
  AButtonVisibleIndex: Integer): Boolean;
begin
  Result := False;
end;

{$IFDEF VCL}
procedure TcxCustomEditViewData.CalculateButtonNativeInfo(AButtonViewInfo: TcxEditButtonViewInfo);
begin
  CalculateEditButtonState(AButtonViewInfo);
end;
{$ENDIF}

function TcxCustomEditViewData.GetProperties: TcxCustomEditProperties;
begin
  Result := TcxCustomEditProperties(FProperties);
end;

function TcxCustomEditViewData.GetStyle: TcxCustomEditStyle;
begin
  Result := TcxCustomEditStyle(FStyle);
end;

procedure TcxCustomEditViewData.SetProperties(Value: TcxCustomEditProperties);
begin
  FProperties := Value;
end;

procedure TcxCustomEditViewData.SetStyle(Value: TcxCustomEditStyle);
begin
  FStyle := Value;
end;

{ TcxEditStyleController }

function TcxEditStyleController.GetStyleClass: TcxContainerStyleClass;
begin
  Result := TcxEditStyle;
end;

function TcxEditStyleController.GetStyle: TcxEditStyle;
begin
  Result := TcxEditStyle(FStyle);
end;

procedure TcxEditStyleController.SetStyle(Value: TcxEditStyle);
begin
  FStyle.Assign(Value);
end;

{ TcxCustomEditStyle }

constructor TcxCustomEditStyle.Create(AOwner: TPersistent; ADirectAccessMode: Boolean);
begin
  inherited Create(AOwner, ADirectAccessMode);
  FPopupCloseButton := True;
end;

procedure TcxCustomEditStyle.Assign(Source: TPersistent);
begin
  if Source is TcxCustomEditStyle then
  begin
    BeginUpdate;
    try
      with Source as TcxCustomEditStyle do
      begin
        Self.FButtonStyle := FButtonStyle;
        Self.FButtonTransparency := FButtonTransparency;
        Self.FPopupBorderStyle := FPopupBorderStyle;
        Self.FPopupCloseButton := FPopupCloseButton;
      end;
      inherited Assign(Source);
    finally
      Changed;
      EndUpdate;
    end
  end
  else
    inherited Assign(Source);
end;

class function TcxCustomEditStyle.GetStyleValueCount: Integer;
begin
  Result := cxEditStyleValueCount;
end;

class function TcxCustomEditStyle.GetStyleValueName(AStyleValue: TcxEditStyleValue;
  out StyleValueName: string): Boolean;
begin
  Result := inherited GetStyleValueName(AStyleValue, StyleValueName);
  if not Result then
  begin
    Result := AStyleValue < cxEditStyleValueCount;
    if Result then
      StyleValueName := cxEditStyleValueNameA[AStyleValue - cxContainerStyleValueCount];
  end;
end;

function TcxCustomEditStyle.DefaultColor: TColor;
begin
  if (Edit = nil) or Edit.IsInplace or not Edit.ParentColor or
      (Edit.Parent = nil) then
    Result := clWindow
  else
    Result := TWinControlAccess(Edit.Parent).Color;
end;

function TcxCustomEditStyle.IsValueDefined(AValue: TcxEditStyleValue): Boolean;
var
  AButtonStyle: TcxEditButtonStyle;
  AButtonTransparency: TcxEditButtonTransparency;
  APopupBorderStyle: TcxEditPopupBorderStyle;
begin
  case AValue of
    svButtonStyle:
      Result := InternalGetButtonStyle(AButtonStyle);
    svButtonTransparency:
      Result := InternalGetButtonTransparency(AButtonTransparency);
    svPopupBorderStyle:
      Result := InternalGetPopupBorderStyle(APopupBorderStyle);
    else
      Result := inherited IsValueDefined(AValue);
  end;
end;

function TcxCustomEditStyle.DefaultButtonStyle: TcxEditButtonStyle;
begin
  Result := btsDefault;
end;

function TcxCustomEditStyle.DefaultButtonTransparency: TcxEditButtonTransparency;
begin
  Result := ebtNone;
end;

function TcxCustomEditStyle.DefaultPopupBorderStyle: TcxEditPopupBorderStyle;
begin
  Result := epbsDefault;
end;

function TcxCustomEditStyle.GetAssignedValues: TcxEditStyleValues;
begin
  Result := TcxEditStyleValues(inherited AssignedValues);
end;

function TcxCustomEditStyle.GetBorderStyle: TcxEditBorderStyle;
begin
  Result := TcxEditBorderStyle(inherited BorderStyle);
end;

function TcxCustomEditStyle.GetButtonStyle: TcxEditButtonStyle;
begin
  if DirectAccessMode then
    if svButtonStyle in FAssignedValues then
      Result := FButtonStyle
    else
      Result := DefaultButtonStyle
  else
    if not InternalGetButtonStyle(Result) then
      Result := DefaultButtonStyle;
end;

function TcxCustomEditStyle.GetButtonTransparency: TcxEditButtonTransparency;
begin
  if DirectAccessMode then
    if svButtonTransparency in FAssignedValues then
      Result := FButtonTransparency
    else
      Result := DefaultButtonTransparency
  else
    if not InternalGetButtonTransparency(Result) then
      Result := DefaultButtonTransparency;
end;

function TcxCustomEditStyle.GetEdit: TcxCustomEdit;
var
  AOwner: TPersistent;
begin
  AOwner := GetOwner;
  if AOwner is TcxCustomEdit then
    Result := TcxCustomEdit(AOwner)
  else
    Result := nil;
end;

function TcxCustomEditStyle.GetPopupBorderStyle: TcxEditPopupBorderStyle;
begin
  if DirectAccessMode then
    if svPopupBorderStyle in FAssignedValues then
      Result := FPopupBorderStyle
    else
      Result := DefaultPopupBorderStyle
  else
    if not InternalGetPopupBorderStyle(Result) then
      Result := DefaultPopupBorderStyle;
end;

function TcxCustomEditStyle.GetStyleController: TcxEditStyleController;
begin
  Result := TcxEditStyleController(BaseGetStyleController);
end;

function TcxCustomEditStyle.InternalGetButtonStyle(var ButtonStyle: TcxEditButtonStyle): Boolean;
begin
  Result := svButtonStyle in FAssignedValues;
  if Result then
    ButtonStyle := FButtonStyle
  else
    if FStyleController <> nil then
      Result := TcxEditStyleController(FStyleController).Style.InternalGetButtonStyle(ButtonStyle);
end;

function TcxCustomEditStyle.InternalGetButtonTransparency(var ButtonTransparency: TcxEditButtonTransparency): Boolean;
begin
  Result := svButtonTransparency in FAssignedValues;
  if Result then
    ButtonTransparency := FButtonTransparency
  else
    if FStyleController <> nil then
      Result := TcxEditStyleController(FStyleController).Style.InternalGetButtonTransparency(ButtonTransparency);
end;

function TcxCustomEditStyle.InternalGetPopupBorderStyle(var PopupBorderStyle:
  TcxEditPopupBorderStyle): Boolean;
begin
  Result := svPopupBorderStyle in FAssignedValues;
  if Result then
    PopupBorderStyle := FPopupBorderStyle
  else
    if FStyleController <> nil then
      Result := TcxEditStyleController(FStyleController).Style.InternalGetPopupBorderStyle(PopupBorderStyle);
end;

function TcxCustomEditStyle.IsBorderStyleStored: Boolean;
begin
  Result := (svBorderStyle in FAssignedValues) and ((Edit = nil) or
    not(svBorderStyle in Edit.GetNotPublishedStyleValues));
end;

function TcxCustomEditStyle.IsButtonStyleStored: Boolean;
begin
  Result := (svButtonStyle in FAssignedValues) and ((Edit = nil) or
    not(svButtonStyle in Edit.GetNotPublishedStyleValues));
end;

function TcxCustomEditStyle.IsButtonTransparencyStored: Boolean;
begin
  Result := (svButtonTransparency in FAssignedValues) and ((Edit = nil) or
    not(svButtonTransparency in Edit.GetNotPublishedStyleValues));
end;

function TcxCustomEditStyle.IsPopupBorderStyleStored: Boolean;
begin
  Result := (svPopupBorderStyle in FAssignedValues) and ((Edit = nil) or
    not(svPopupBorderStyle in Edit.GetNotPublishedStyleValues));
end;

procedure TcxCustomEditStyle.SetAssignedValues(Value: TcxEditStyleValues);
begin
  inherited AssignedValues := Value;
end;

procedure TcxCustomEditStyle.SetBorderStyle(Value: TcxEditBorderStyle);
begin
  inherited BorderStyle := TcxContainerBorderStyle(Value);
end;

procedure TcxCustomEditStyle.SetButtonStyle(Value: TcxEditButtonStyle);
begin
  if (svButtonStyle in FAssignedValues) and (Value = FButtonStyle) then
    Exit;
  FButtonStyle := Value;
  Include(FAssignedValues, svButtonStyle);
  Changed;
end;

procedure TcxCustomEditStyle.SetButtonTransparency(Value: TcxEditButtonTransparency);
begin
  if (svButtonTransparency in FAssignedValues) and (Value = FButtonTransparency) then
    Exit;
  FButtonTransparency := Value;
  Include(FAssignedValues, svButtonTransparency);
  Changed;
end;

procedure TcxCustomEditStyle.SetPopupBorderStyle(Value: TcxEditPopupBorderStyle);
begin
  if (svPopupBorderStyle in FAssignedValues) and (Value = FPopupBorderStyle) then
    Exit;
  FPopupBorderStyle := Value;
  Include(FAssignedValues, svPopupBorderStyle);
  Changed;
end;

procedure TcxCustomEditStyle.SetPopupCloseButton(Value: Boolean);
begin
  if Value <> FPopupCloseButton then
  begin
    FPopupCloseButton := Value;
    Changed;
  end;
end;

procedure TcxCustomEditStyle.SetStyleController(Value: TcxEditStyleController);
begin
  BaseSetStyleController(Value);
end;

{ TcxCustomEditPropertiesValues }

procedure TcxCustomEditPropertiesValues.Assign(Source: TPersistent);
begin
  if Source is TcxCustomEditPropertiesValues then
    with Source as TcxCustomEditPropertiesValues do
      Self.ReadOnly := ReadOnly
  else
    inherited Assign(Source);
end;

procedure TcxCustomEditPropertiesValues.Reset;
begin
  ReadOnly := False;
end;

{ TcxCustomEditDefaultValuesProvider }

destructor TcxCustomEditDefaultValuesProvider.Destroy;
begin
  ClearUsers;
  inherited Destroy;
end;

procedure TcxCustomEditDefaultValuesProvider.ChangedNotification;
begin
  DoChanged;
end;

procedure TcxCustomEditDefaultValuesProvider.ClearUsers;
var
  I: Integer;
begin
  if FCreatedEditPropertiesList <> nil then
    for I := 0 to FCreatedEditPropertiesList.Count - 1 do
      with TcxCustomEditProperties(FCreatedEditPropertiesList[I]) do
        if (FIDefaultValuesProvider <> nil) and (FIDefaultValuesProvider.GetInstance = Self) then
          FIDefaultValuesProvider := nil;
end;

function TcxCustomEditDefaultValuesProvider.DefaultAlignment: TAlignment;
begin
  Result := cxEditDefaultHorzAlignment;
end;

function TcxCustomEditDefaultValuesProvider.DefaultBlobKind: TcxBlobKind;
begin
  Result := bkMemo;
end;

function TcxCustomEditDefaultValuesProvider.DefaultCanModify: Boolean;
begin
  Result := True;
end;

function TcxCustomEditDefaultValuesProvider.DefaultDisplayFormat: string;
begin
  Result := '';
end;

function TcxCustomEditDefaultValuesProvider.DefaultEditMask: string;
begin
  Result := '';
end;

function TcxCustomEditDefaultValuesProvider.DefaultIsFloatValue: Boolean;
begin
  Result := False;
end;

function TcxCustomEditDefaultValuesProvider.DefaultMaxLength: Integer;
begin
  Result := 0;
end;

function TcxCustomEditDefaultValuesProvider.DefaultMaxValue: Double;
begin
  Result := 0;
end;

function TcxCustomEditDefaultValuesProvider.DefaultMinValue: Double;
begin
  Result := 0;
end;

function TcxCustomEditDefaultValuesProvider.DefaultReadOnly: Boolean;
begin
  Result := False;
end;

function TcxCustomEditDefaultValuesProvider.DefaultRequired: Boolean;
begin
  Result := False;
end;

function TcxCustomEditDefaultValuesProvider.GetInstance: TObject;
begin
  Result := Self;
end;

function TcxCustomEditDefaultValuesProvider.HasDisplayValueFormatting: Boolean;
begin
  Result := False;
end;

function TcxCustomEditDefaultValuesProvider.IsBlob: Boolean;
begin
  Result := False;
end;

function TcxCustomEditDefaultValuesProvider.IsDisplayFormatDefined(AIsCurrencyValueAccepted: Boolean): Boolean;
begin
  Result := False;
end;

function TcxCustomEditDefaultValuesProvider.IsValidChar(AChar: Char): Boolean;
begin
  Result := True;
end;

procedure TcxCustomEditDefaultValuesProvider.DoChanged;
begin
  if Assigned(FOnChanged) then
    FOnChanged(Self);
end;

function TcxCustomEditDefaultValuesProvider.GetOnChanged: TNotifyEvent;
begin
  Result := FOnChanged;
end;

procedure TcxCustomEditDefaultValuesProvider.SetOnChanged(Value: TNotifyEvent);
begin
  FOnChanged := Value;
end;

{ TcxCustomEditProperties }

constructor TcxCustomEditProperties.Create(AOwner: TPersistent);
begin
  inherited Create(AOwner);
  FCreatedEditPropertiesList.Add(Self);
  FOwner := AOwner;
  FFreeNotificator := TcxFreeNotificator.Create(nil);
  FFreeNotificator.OnFreeNotification := FreeNotification;
  FAlignment := TcxEditAlignment.Create(Self);
  FAlignment.OnChanged := AlignmentChangedHandler;
  FAssignedValues := GetAssignedValuesClass.Create;
  FAutoSelect := True;
  FButtons := TcxEditButtons.Create(Self);
  FButtons.OnChange := ButtonsChanged;
  FClickKey := VK_RETURN + scCtrl;
  FUseLeftAlignmentOnEditing := DefaultUseLeftAlignmentOnEditing;
  FUseMouseWheel := True;
  FInnerAlignment := TcxEditAlignment.Create(Self);
  FUpdateCount := 0;
end;

destructor TcxCustomEditProperties.Destroy;
begin
  FIDefaultValuesProvider := nil;
  FreeAndNil(FButtons);
  FreeAndNil(FInnerAlignment);
  FreeAndNil(FAssignedValues);
  FreeAndNil(FAlignment);
  FreeAndNil(FFreeNotificator);
  if FCreatedEditPropertiesList <> nil then
    FCreatedEditPropertiesList.Remove(Self);
  inherited Destroy;
end;

procedure TcxCustomEditProperties.Assign(Source: TPersistent);
begin
  if Source is TcxCustomEditProperties then
  begin
    BeginUpdate;
    try
      with Source as TcxCustomEditProperties do
      begin
        Self.AutoSelect := AutoSelect;
        Self.Buttons.Assign(Buttons);
        Self.BeepOnError := BeepOnError;
        Self.ClearKey := ClearKey;
        Self.ClickKey := ClickKey;
        Self.FUseLeftAlignmentOnEditing := FUseLeftAlignmentOnEditing;
        Self.FIDefaultValuesProvider := FIDefaultValuesProvider;
        Self.Alignment := Alignment;

        Self.AssignedValues.ReadOnly := False;
        if AssignedValues.ReadOnly then
          Self.ReadOnly := ReadOnly;

        Self.ImmediatePost := ImmediatePost;
        Self.UseMouseWheel := UseMouseWheel;
        Self.ValidateOnEnter := ValidateOnEnter;

        Self.OnButtonClick := OnButtonClick;
        Self.OnChange := OnChange;
        Self.OnEditValueChanged := OnEditValueChanged;
        Self.OnValidate := OnValidate;
      end
    finally
      EndUpdate;
    end
  end
  else
    inherited Assign(Source);
end;

class function TcxCustomEditProperties.GetContainerClass: TcxContainerClass;
begin
  Result := TcxCustomEdit;
end;

class function TcxCustomEditProperties.GetStyleClass: TcxContainerStyleClass;
begin
  Result := TcxCustomEditStyle;
end;

class function TcxCustomEditProperties.GetViewInfoClass: TcxContainerViewInfoClass;
begin
  Result := TcxCustomEditViewInfo;
end;

procedure TcxCustomEditProperties.BeginUpdate;
begin
  Inc(FUpdateCount);
end;

function TcxCustomEditProperties.CreateViewData(AStyle: TcxContainerStyle; AIsInplace: Boolean): TcxCustomEditViewData;
begin
  Result := TcxCustomEditViewDataClass(GetViewDataClass).Create(Self, AStyle, AIsInplace);
end;

procedure TcxCustomEditProperties.EndUpdate(AInvokeChanged: Boolean = True);
begin
  if FUpdateCount > 0 then
  begin
    Dec(FUpdateCount);
    if (FUpdateCount = 0) and AInvokeChanged then
      Changed;
  end;
end;

function TcxCustomEditProperties.GetDisplayText(const AEditValue: TcxEditValue;
  AFullText: Boolean = False): WideString;
begin
  Result := '';
end;

function TcxCustomEditProperties.GetEditConstantPartSize(ACanvas: TcxCanvas;
  AEditStyle: TcxCustomEditStyle; AIsInplace: Boolean;
  const AEditSizeProperties: TcxEditSizeProperties; var MinContentSize: TSize): TSize;
var
  AViewData: TcxCustomEditViewData;
begin
  AViewData := TcxCustomEditViewData(CreateViewData(AEditStyle, AIsInplace));
  try
    Result := AViewData.GetEditConstantPartSize(ACanvas, AEditSizeProperties,
      MinContentSize);
  finally
    FreeAndNil(AViewData);
  end;
end;

function TcxCustomEditProperties.GetEditContentSize(ACanvas: TcxCanvas;
  AEditStyle: TcxCustomEditStyle; AIsInplace: Boolean;  const AEditValue: TcxEditValue;
  const AEditSizeProperties: TcxEditSizeProperties): TSize;
var
  AViewData: TcxCustomEditViewData;
begin
  AViewData := TcxCustomEditViewData(CreateViewData(AEditStyle, AIsInplace));
  try
    Result := AViewData.GetEditContentSize(ACanvas, AEditValue, AEditSizeProperties);
  finally
    FreeAndNil(AViewData);
  end;
end;

function TcxCustomEditProperties.GetEditSize(ACanvas: TcxCanvas;
  AEditStyle: TcxCustomEditStyle; AIsInplace: Boolean; const AEditValue: TcxEditValue;
  AEditSizeProperties: TcxEditSizeProperties): TSize;
var
  AViewData: TcxCustomEditViewData;
begin
  AViewData := TcxCustomEditViewData(CreateViewData(AEditStyle, AIsInplace));
  try
    Result := AViewData.GetEditSize(ACanvas, AEditValue, AEditSizeProperties);
  finally
    FreeAndNil(AViewData);
  end;
end;

function TcxCustomEditProperties.GetSupportedOperations: TcxEditSupportedOperations;
begin
  if Buttons.Count > 0 then
    Result := [esoHotTrack]
  else
    Result := [];
end;

function TcxCustomEditProperties.IsEditValueValid(var EditValue: TcxEditValue; AEditFocused: Boolean): Boolean;
begin
  Result := True;
end;

procedure TcxCustomEditProperties.RestoreDefaults;
begin
  FInnerAlignment.Reset;
  AssignedValues.Reset;
  Changed;
end;

procedure TcxCustomEditProperties.Update(AProperties: TcxCustomEditProperties);
begin
end;

procedure TcxCustomEditProperties.ValidateDisplayValue(var DisplayValue: TcxEditValue;
  var ErrorText: TCaption; var Error: Boolean; AEdit: TcxCustomEdit);
begin
  if not CanValidate then
    Exit;
  if ErrorText = '' then
    ErrorText := GetValidateErrorText(ekDefault);
  if (AEdit <> nil) and Assigned(FOnValidate) then
    FOnValidate(AEdit, DisplayValue, ErrorText, Error);
end;

procedure TcxCustomEditProperties.AlignmentChangedHandler(Sender: TObject);
begin
  FInnerAlignment.Assign(FAlignment);
  Changed;
end;

procedure TcxCustomEditProperties.BaseSetAlignment(Value: TcxEditAlignment);
begin
  FInnerAlignment.Assign(Value);
  Changed;
end;

procedure TcxCustomEditProperties.ButtonsChanged(Sender: TObject);
begin
  Changed;
end;

function TcxCustomEditProperties.CanModify: Boolean;
begin
  Result := FAssignedValues.ReadOnly and not FReadOnly;
  if not Result then
  begin
    Result := not ReadOnly;
    if Result and (IDefaultValuesProvider <> nil) then
      Result := IDefaultValuesProvider.DefaultCanModify;
  end;
end;

function TcxCustomEditProperties.CanValidate: Boolean;
begin
  Result := False;
end;

class function TcxCustomEditProperties.GetAssignedValuesClass: TcxCustomEditPropertiesValuesClass;
begin
  Result := TcxCustomEditPropertiesValues;
end;

function TcxCustomEditProperties.GetDefaultHorzAlignment: TAlignment;
begin
  if IDefaultValuesProvider <> nil then
    Result := IDefaultValuesProvider.DefaultAlignment
  else
    Result := FAlignment.Horz;
end;

function TcxCustomEditProperties.GetDisplayFormatOptions: TcxEditDisplayFormatOptions;
begin
  Result := [];
end;

function TcxCustomEditProperties.GetEditValueSource(AEditFocused: Boolean): TcxDataEditValueSource;
begin
  Result := evsValue;
end;

function TcxCustomEditProperties.GetValidateErrorText(AErrorKind: TcxEditErrorKind): TCaption;
begin
  Result := cxGetResourceString(@cxSEditValidateErrorText);
end;

function TcxCustomEditProperties.GetValueEditorEditValueSource(AEditFocused: Boolean): TcxDataEditValueSource;
begin
  Result := evsValue;
  if not AEditFocused and (dfoSupports in DisplayFormatOptions) and (IDefaultValuesProvider <> nil) and
      IDefaultValuesProvider.IsDisplayFormatDefined(not(dfoNoCurrencyValue in DisplayFormatOptions)) then
    Result := evsText;
end;

class function TcxCustomEditProperties.GetViewDataClass: TcxCustomEditViewDataClass;
begin
  Result := TcxCustomEditViewData;
end;

function TcxCustomEditProperties.HasDisplayValue: Boolean;
begin
  Result := False;
end;

function TcxCustomEditProperties.IsValueEditorWithValueFormatting: Boolean;
begin
  Result := (dfoSupports in DisplayFormatOptions) and (GetEditValueSource(True) = evsValue) and
    (GetEditValueSource(False) = evsText) and (IDefaultValuesProvider <> nil) and
    IDefaultValuesProvider.IsDisplayFormatDefined(not(dfoNoCurrencyValue in DisplayFormatOptions));
end;

function TcxCustomEditProperties.IsResetEditClass: Boolean;
begin
  Result := False;
end;

procedure TcxCustomEditProperties.Loaded;
begin
end;

procedure TcxCustomEditProperties.LockUpdate(ALock: Boolean);
begin
  FChangedLocked := ALock;
end;

procedure TcxCustomEditProperties.PrepareDisplayValue(const AEditValue: TcxEditValue;
  var DisplayValue: TcxEditValue; AEditFocused: Boolean);
begin
  DisplayValue := AEditValue;
end;

function TcxCustomEditProperties.TabsNeed: Boolean;
begin
  Result := False;
end;

function TcxCustomEditProperties.WantNavigationKeys: Boolean;
begin
  Result := False;
end;

procedure TcxCustomEditProperties.Changed;
begin
  if not ChangedLocked and not((GetOwner is TComponent) and
      (csDestroying in TComponent(GetOwner).ComponentState)) then
    if Assigned(FOnPropertiesChanged) then
      FOnPropertiesChanged(Self);
end;

function TcxCustomEditProperties.ChangedLocked: Boolean;
begin
  Result := FChangedLocked or (FUpdateCount > 0);
end;

function TcxCustomEditProperties.CompareEditValue: Boolean;
begin
  Result := False;
end;

function TcxCustomEditProperties.DefaultUseLeftAlignmentOnEditing: Boolean;
begin
  Result := cxEditDefaultUseLeftAlignmentOnEditing;
end;

procedure TcxCustomEditProperties.FreeNotification(Sender: TComponent);
begin
end;

function TcxCustomEditProperties.BaseGetAlignment: TcxEditAlignment;
var
  AOwnerComponent: TComponent;
begin
  FAlignment.OnChanged := nil;
  FAlignment.Assign(FInnerAlignment);
  Result := FAlignment;
  if IsAlignmentStored then
  begin
    AOwnerComponent := GetOwnerComponent(Self);
    if (AOwnerComponent <> nil) and (csWriting in AOwnerComponent.ComponentState) then
      Exit;
  end;

  if not FInnerAlignment.IsHorzStored then
    Result.FHorz := GetDefaultHorzAlignment;
  FAlignment.OnChanged := AlignmentChangedHandler;
end;

procedure TcxCustomEditProperties.DefaultValuesChanged(Sender: TObject);
begin
  Changed;
end;

function TcxCustomEditProperties.GetReadOnly: Boolean;
begin
  if FAssignedValues.ReadOnly then
    Result := FReadOnly
  else
    if IDefaultValuesProvider = nil then
      Result := False
    else
      Result := IDefaultValuesProvider.DefaultReadOnly;
end;

function TcxCustomEditProperties.IsAlignmentStored: Boolean;
begin
  with FInnerAlignment do
    Result := IsHorzStored or IsVertStored;
end;

function TcxCustomEditProperties.IsUseLeftAlignmentOnEditingStored: Boolean;
begin
  Result := FUseLeftAlignmentOnEditing <> DefaultUseLeftAlignmentOnEditing;
end;

function TcxCustomEditProperties.IsReadOnlyStored: Boolean;
begin
  Result := FAssignedValues.ReadOnly;
end;

procedure TcxCustomEditProperties.SetAutoSelect(Value: Boolean);
begin
  if Value <> FAutoSelect then
  begin
    FAutoSelect := Value;
    Changed;
  end;
end;

procedure TcxCustomEditProperties.SetButtons(Value: TcxEditButtons);
begin
  FButtons.Assign(Value);
end;

procedure TcxCustomEditProperties.SetUseLeftAlignmentOnEditing(Value: Boolean);
begin
  if Value <> FUseLeftAlignmentOnEditing then
  begin
    FUseLeftAlignmentOnEditing := Value;
    Changed;
  end;
end;

procedure TcxCustomEditProperties.SetIDefaultValuesProvider(Value: IcxEditDefaultValuesProvider);
begin
  FIDefaultValuesProvider := Value;
  if FOwner is TcxCustomEdit then
    if Value = nil then
      DefaultValuesChanged(nil)
    else
    begin
      Value.OnChanged := DefaultValuesChanged;
      DefaultValuesChanged(Value.GetInstance);
    end;
end;

procedure TcxCustomEditProperties.SetReadOnly(const Value: Boolean);
begin
  if AssignedValues.ReadOnly and (Value = FReadOnly) then
    Exit;
  AssignedValues.ReadOnly := True;
  FReadOnly := Value;
  Changed;
end;

{ TcxEditDataBinding }

constructor TcxEditDataBinding.Create(AEdit: TcxCustomEdit);
begin
  inherited Create;
  FEdit := AEdit;
  FIDefaultValuesProvider := GetDefaultValuesProviderClass.Create(nil);
end;

destructor TcxEditDataBinding.Destroy;
begin
  FreeAndNil(FIDefaultValuesProvider);
  inherited Destroy;
end;

class function TcxEditDataBinding.GetDefaultValuesProviderClass: TcxCustomEditDefaultValuesProviderClass;
begin
  Result := TcxCustomEditDefaultValuesProvider;
end;

procedure TcxEditDataBinding.UpdateEdit;
begin
end;

function TcxEditDataBinding.CanCheckEditorValue: Boolean;
begin
  with Edit do
    Result := IsDesigning;
end;

function TcxEditDataBinding.CanSetEditMode: Boolean;
begin
  Result := True;
end;

procedure TcxEditDataBinding.DefaultValuesChanged;
begin
  if IDefaultValuesProvider <> nil then
    IDefaultValuesProvider.ChangedNotification;
end;

function TcxEditDataBinding.ExecuteAction(Action: TBasicAction): Boolean;
begin
  Result := False;
end;

function TcxEditDataBinding.GetDisplayValue: TcxEditValue;
begin
  Result := Edit.DisplayValue;
end;

function TcxEditDataBinding.GetEditDataBindingInstance: TcxEditDataBinding;
begin
  Result := Self;
end;

function TcxEditDataBinding.GetModified: Boolean;
begin
  Result := Edit.ModifiedAfterEnter;
end;

function TcxEditDataBinding.GetOwner: TPersistent;
begin
  Result := FEdit;
end;

function TcxEditDataBinding.GetStoredValue: TcxEditValue;
begin
  Result := Edit.EditValue;
end;

procedure TcxEditDataBinding.Reset;
begin
  Edit.ResetEditValue;
end;

procedure TcxEditDataBinding.SetInternalDisplayValue(const Value: TcxEditValue);
begin
  Edit.SetInternalDisplayValue(Value);
end;

procedure TcxEditDataBinding.SetDisplayValue(const Value: TcxEditValue);
begin
  SetInternalDisplayValue(Value);
end;

function TcxEditDataBinding.SetEditMode: Boolean;
begin
  Result := True;
end;

procedure TcxEditDataBinding.SetStoredValue(const Value: TcxEditValue);
begin
end;

function TcxEditDataBinding.UpdateAction(Action: TBasicAction): Boolean;
begin
  Result := False;
end;

procedure TcxEditDataBinding.UpdateDisplayValue;
begin
  Edit.SynchronizeDisplayValue;
end;

function TcxEditDataBinding.GetIDefaultValuesProvider: IcxEditDefaultValuesProvider;
begin
  Result := FIDefaultValuesProvider as IcxEditDefaultValuesProvider;
end;

{ TcxEditRepositoryItemListenerEditHelper }

constructor TcxEditRepositoryItemListenerEditHelper.Create(AEdit: TcxCustomEdit);
begin
  inherited Create;
  FEdit := AEdit;
end;

procedure TcxEditRepositoryItemListenerEditHelper.ItemRemoved(Sender: TcxEditRepositoryItem);
begin
  FEdit.FRepositoryItem := nil;
end;

procedure TcxEditRepositoryItemListenerEditHelper.PropertiesChanged(Sender: TcxEditRepositoryItem);
begin
  with FEdit do
    if ComponentState * [csLoading, csDestroying] = [] then
      PropertiesChanged(Sender.Properties);
end;

{ TcxCustomEditData }

constructor TcxCustomEditData.Create(AEdit: TcxCustomEdit);
begin
  inherited Create;
  FEdit := AEdit;
  FFreeNotificator := TcxFreeNotificator.Create(nil);
  FFreeNotificator.OnFreeNotification := FreeNotification;
  FFreeNotificator.AddSender(AEdit);
  Clear;
end;

destructor TcxCustomEditData.Destroy;
begin
  FFreeNotificator.Free;
  inherited Destroy;
end;

procedure TcxCustomEditData.Clear;
begin
  FCleared := True;
  if FEdit <> nil then
    FEdit.DoClearEditData(Self);
end;

procedure TcxCustomEditData.FreeNotification(AComponent: TComponent);
begin
  if AComponent = FEdit then
    FEdit := nil;
end;

{ TcxCustomEdit }

constructor TcxCustomEdit.Create(AOwner: TComponent);

  procedure CreateDblClickTimer;
  begin
    FDblClickTimer := TTimer.Create(nil);
    with FDblClickTimer do
    begin
      Enabled := False;
      Interval := GetDblClickInterval;
      OnTimer := DblClickTimerHandler;
    end;
  end;

begin
  inherited Create(AOwner);
  FIsCreating := True;
  FProperties := GetPropertiesClass.Create(Self);
  FProperties.FEdit := Self;

  ControlStyle := ControlStyle + [csSetCaption, csCaptureMouse];
  TabStop := True;

  FPrevModifiedList := TList.Create;
  FInnerEdit := CreateInnerEdit;
  if HasInnerEdit then
  begin
    InitializeInnerEdit;
    InnerControl := FInnerEdit.Control;
  end;

  FDataBinding := GetDataBindingClass.Create(Self);

  FAutoSize := not IsInplace;
  FCaptureButtonVisibleIndex := -1;
  FEditValue := Null;
  FLockValidate := 0;
  FUpdate := False;

  Properties.OnPropertiesChanged := PropertiesChanged;

  if IsInplace then
  begin
    Keys := Keys + [kAll, kArrows];
    if GetInnerEditClass = nil then
      Keys := Keys + [kTab];
  end;

  FEditRepositoryItemListenerHelper := TcxEditRepositoryItemListenerEditHelper.Create(Self);

  CreateDblClickTimer;

  FIsCreating := False;
end;

constructor TcxCustomEdit.Create(AOwner: TComponent; AIsInplace: Boolean);
begin
  FIsInplace := AIsInplace;
  Create(AOwner);
end;

destructor TcxCustomEdit.Destroy;
begin
  FreeAndNil(FDblClickTimer);
  if FPopupMenu <> nil then
    FreeAndNil(FPopupMenu);
  if FRepositoryItem <> nil then
    FRepositoryItem.RemoveListener(Self);
  FreeAndNil(FEditRepositoryItemListenerHelper);
  if HasInnerEdit then
    FInnerEdit := nil;

  if not FIsInplace then
    Properties.IDefaultValuesProvider := nil;
  FreeAndNil(FDataBinding);

  FreeAndNil(FPrevModifiedList);
  FreeAndNil(FProperties);

  inherited Destroy;
end;

procedure TcxCustomEdit.AfterConstruction;
begin
  inherited AfterConstruction;
  if not FIsInplace then
    Properties.IDefaultValuesProvider := FDataBinding.IDefaultValuesProvider;
  if not IsInplace then
    DataBinding.UpdateEdit;
  PropertiesChanged(Properties);
  DataBinding.UpdateDisplayValue;
end;

function TcxCustomEdit.ExecuteAction(Action: TBasicAction): Boolean;
begin
  Result := inherited ExecuteAction(Action) or FDataBinding.ExecuteAction(Action);
end;

class function TcxCustomEdit.GetNotPublishedStyleValues:
  TcxEditStyleValues;
begin
  Result := [svButtonStyle, svButtonTransparency, svPopupBorderStyle];
end;

procedure TcxCustomEdit.GetTabOrderList(List: TList);
var
  AActiveControl: TWinControl;
begin
  AActiveControl := GetParentForm(Self).ActiveControl;
  if AActiveControl = Self then
    Exit
  else
    if CanFocus and (InnerEdit <> nil) and (InnerEdit.Control = AActiveControl) then
    begin
      List.Add(InnerEdit.Control);
      List.Remove(Self);
    end;
end;

function TcxCustomEdit.UpdateAction(Action: TBasicAction): Boolean;
begin
  Result := inherited UpdateAction(Action) or FDataBinding.UpdateAction(Action);
end;

{$IFDEF VCL}
procedure TcxCustomEdit.SetFocus;
var
  AParentForm: TCustomForm;
begin
  if IsDesigning or Focused then
    Exit;
  inherited SetFocus;
  if HasInnerEdit and InnerEdit.Control.HandleAllocated and (GetFocus = Handle) then
  begin
    AParentForm := GetParentForm(Self);
    InnerEdit.SafelySetFocus;
    AParentForm.FocusControl(InnerEdit.Control);
  end;
end;
{$ENDIF}

procedure TcxCustomEdit.Activate(var AEditData: TcxCustomEditData);
begin
  if (AEditData = nil) and (GetEditDataClass <> nil) then
    AEditData := GetEditDataClass.Create(Self);
  FEditData := AEditData;
  DoClearEditData(FEditData);
  Visible := True;
  if HandleAllocated and CanFocus then
  begin
    SetFocus;
    if Properties.AutoSelect then
      SelectAll;
  end;
  SynchronizeDisplayValue;
  EditModified := False;
end;

{$IFDEF VCL}
procedure TcxCustomEdit.ActivateByKey(Key: Char; var AEditData: TcxCustomEditData);
begin
  LockInnerEditRepainting;
  Activate(AEditData);
  if SendActivationKey(Key) then
    SendMessage(Handle, WM_CHAR, Integer(Key), 0);
  UnlockInnerEditRepainting;
end;
{$ELSE}
procedure TcxCustomEdit.ActivateByKey(Key: Char; var AEditData: TcxCustomEditData);
begin
  Activate(AEditData);
  if SendActivationKey(Key) then
    SendKey(QOPenWidgetH(Handle), Key);
end;
{$ENDIF}

procedure TcxCustomEdit.ActivateByMouse(Shift: TShiftState; X, Y: Integer;
  var AEditData: TcxCustomEditData);
var
  P: TPoint;
{$IFNDEF VCL}
  AMouseEvent: QMouseEventH;
{$ENDIF}
begin
  Activate(AEditData);
  P := Parent.ClientToScreen(Point(X, Y));
  P := ScreenToClient(P);
{$IFDEF VCL}
  if ssLeft in Shift then
    SendMessage(Handle, WM_LBUTTONDOWN, ShiftStateToKeys(Shift), P.Y shl 16 + P.X)
  else
    SendMessage(Handle, WM_LBUTTONUP, ShiftStateToKeys(Shift), P.Y shl 16 + P.X);
{$ELSE}
  if ssLeft in Shift then
    AMouseEvent := QMouseEvent_create(QEventType_MouseButtonRelease, @P, Integer(ButtonState_LeftButton),
      ShiftStateToButtonState(Shift))
  else
    AMouseEvent := QMouseEvent_create(QEventType_MouseButtonPress, @P, Integer(ButtonState_LeftButton),
      ShiftStateToButtonState(Shift));
  {$IFDEF WIN32}
  QApplication_sendEvent(Handle, AMouseEvent);
  {$ENDIF}
  {$IFDEF LINUX}
  QApplication_postEvent(Handle, AMouseEvent); // TODO check
  {$ENDIF}
{$ENDIF}
  FDblClickTimer.Enabled := True;
end;

function TcxCustomEdit.Deactivate: Boolean;
begin
  Result := False;
  try
    Result := ValidateEdit(True);
  finally
    if Result then
      SynchronizeDisplayValue;
  end;
end;

procedure TcxCustomEdit.Clear;
begin
end;

procedure TcxCustomEdit.CopyToClipboard;
begin
end;

procedure TcxCustomEdit.CutToClipboard;
begin
end;

class function TcxCustomEdit.GetPropertiesClass: TcxCustomEditPropertiesClass;
begin
  Result := TcxCustomEditProperties;
end;

function TcxCustomEdit.HasPopupWindow: Boolean;
begin
  Result := False;
end;

procedure TcxCustomEdit.PasteFromClipboard;
begin
end;

procedure TcxCustomEdit.PrepareEditValue(const ADisplayValue: TcxEditValue;
  out EditValue: TcxEditValue; AEditFocused: Boolean);
begin
end;

procedure TcxCustomEdit.Reset;
begin
  DataBinding.Reset;
end;

procedure TcxCustomEdit.SelectAll;
begin
end;

function TcxCustomEdit.ValidateEdit(ARaiseExceptionOnError: Boolean): Boolean;
var
  ADisplayValue: TcxEditValue;
  AError: Boolean;
  AErrorText: TCaption;
begin
  if FModifiedAfterEnter and not FIsEditValidated and (FLockValidate = 0) then
  begin
    ADisplayValue := DisplayValue;
    AError := False;
    if Properties.CanValidate then
      Properties.ValidateDisplayValue(ADisplayValue, AErrorText, AError, Self);
    Result := not AError;
    if AError then
    begin
      if ARaiseExceptionOnError then
      begin
        HandleValidationError(AErrorText);
        Application.ProcessMessages;
      end;
    end else
    begin
      FIsEditValidated := True;
      if FKeyboardAction and not DoEditing then
        Exit;
      InternalValidateDisplayValue(ADisplayValue);
      if not IsInplace and not Focused then
        ModifiedAfterEnter := False;
    end;
  end
  else
    Result := True;
end;

function TcxCustomEdit.CanResize(var NewWidth, NewHeight: Integer): Boolean;
var
  AEditSizeProperties: TcxEditSizeProperties;
  AViewData: TcxCustomEditViewData;
begin
{$IFDEF VCL}
  Result := inherited CanResize(NewWidth, NewHeight);
{$ELSE}
  Result := True;
{$ENDIF}
  if Result and AutoSize and not IsLoading then
  begin
    FillSizeProperties(AEditSizeProperties);
    AViewData := TcxCustomEditViewData(CreateViewData);
    try
      FillSizeProperties(AEditSizeProperties);
      NewHeight := AViewData.GetEditSize(Canvas, EditValue, AEditSizeProperties).cy;
    finally
      FreeAndNil(AViewData);
    end;
  end;
end;

procedure TcxCustomEdit.Click;
begin
  if not IsDestroying and (not IsLoading or IsClickEnabledDuringLoading) then
    inherited Click;
end;

procedure TcxCustomEdit.DblClick;
var
  P: TPoint;
  AButton: TMouseButton;
  AShiftState: TShiftState;
begin
  P := ScreenToClient(InternalGetCursorPos);
  if ButtonVisibleIndexAt(P) <> -1 then
  begin
    AButton := mbLeft;
    AShiftState := InternalGetShiftState;
    AShiftState := AShiftState + ButtonToShift(AButton);
    MouseDown(AButton, AShiftState, P.X, P.Y);
    Click;
  end
  else
    inherited DblClick;
end;

procedure TcxCustomEdit.DoEnter;
begin
  if IsDestroying then
    Exit;

  if not FValidateErrorProcessing then
  begin
    SaveModified;
    try
      inherited DoEnter;
      DataBinding.UpdateDisplayValue;
      if Properties.IsResetEditClass then
        PrevEditValue := EditValue;
      SynchronizeDisplayValue;
    finally
      RestoreModified;
      FModifiedAfterEnter := False;
    end;
  end;

  ShortRefreshContainer(False);
end;

procedure TcxCustomEdit.DoExit;
begin
  DoHideEdit(True);
end;

procedure TcxCustomEdit.FocusChanged;
var
  AParentForm: TCustomForm;
  AFocused: Boolean;
begin
  if IsDestroying or FValidateErrorProcessing then
    Exit;
  AFocused := Focused{$IFDEF VCL} and Application.Active{$ENDIF};
  if FFocused = AFocused then
    Exit;
  FFocused := not FFocused;
  inherited FocusChanged;
  UpdateDrawValue;

  AParentForm := GetParentForm(Self);
  if AParentForm <> nil then
    with AParentForm do
      if not Visible and (fsModal in FormState) and (ModalResult <> mrNone) and (ModalResult <> mrCancel) then
        ValidateEdit(False);
end;

function TcxCustomEdit.GetPopupMenu: TPopupMenu;
begin
  if PopupMenu = nil then
  begin
    if FPopupMenu <> nil then
      FreeAndNil(FPopupMenu);
    Result := InternalGetPopupMenu;
  end
  else
    Result := PopupMenu;
end;

class function TcxCustomEdit.GetStyleClass: TcxContainerStyleClass;
begin
  Result := TcxCustomEditPropertiesClass(GetPropertiesClass).GetStyleClass;
end;

class function TcxCustomEdit.GetViewInfoClass: TcxContainerViewInfoClass;
begin
  Result := TcxCustomEditPropertiesClass(GetPropertiesClass).GetViewInfoClass;
end;

function TcxCustomEdit.GetVisibleBounds: TRect;
begin
  Result := GetEditVisibleBounds(ViewInfo, GetControlRect(Self));
end;

procedure TcxCustomEdit.KeyDown(var Key: Word; Shift: TShiftState);
begin
  if not IsEditorKey(Key, Shift) then
    inherited KeyDown(Key, Shift);
  if Key <> 0 then
    DoEditKeyDown(Key, Shift);
end;

procedure TcxCustomEdit.KeyPress(var Key: Char);
begin
  inherited KeyPress(Key);
  if Key <> #0 then
    DoEditKeyPress(Key);
end;

procedure TcxCustomEdit.KeyUp(var Key: Word; Shift: TShiftState);
begin
  inherited KeyUp(Key, Shift);
  if Key <> 0 then
    DoEditKeyUp(Key, Shift);
end;

procedure TcxCustomEdit.Loaded;
begin
  inherited Loaded;
  if not IsInplace then
    DataBinding.UpdateEdit;
  SetSize;
  if FRepositoryItem = nil then
    Properties.OnPropertiesChanged := PropertiesChanged;
  PropertiesChanged(Properties);
  ViewInfo.Shadow := False;
  ContainerStyleChanged(Style); // TODO remove
end;

procedure TcxCustomEdit.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  AButtonVisibleIndex: Integer;
begin
  if (Button = mbLeft) and FDblClickTimer.Enabled then
  begin
    FDblClickTimer.Enabled := False;
    if ButtonVisibleIndexAt(ScreenToClient(InternalGetCursorPos)) = -1 then
      DblClick;
  end;

  inherited MouseDown(Button, Shift, X, Y);
  if (Button = mbLeft) and (GetCaptureControl = Self) then
  begin
    AButtonVisibleIndex := ButtonVisibleIndexAt(Point(X, Y));
    if (AButtonVisibleIndex <> -1) and
        (ViewInfo.ButtonsInfo[AButtonVisibleIndex].Data.State = ebsPressed) then
      FCaptureButtonVisibleIndex := AButtonVisibleIndex;
  end;
end;

procedure TcxCustomEdit.MouseLeave(AControl: TControl);
var
  I: Integer;
begin
  inherited MouseLeave(AControl);
  for I := 0 to Length(ViewInfo.ButtonsInfo) - 1 do
    with ViewInfo.ButtonsInfo[I] do
      if Data.State = ebsSelected then
      begin
        Data.State := ebsNormal;
        InvalidateRect(Bounds, HasBackground);
      end;
end;

procedure TcxCustomEdit.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseUp(Button, Shift, X, Y);
{$IFDEF LINUX}
//  if Button = mbLeft then
//    QWidget_releaseMouse(Self.Handle);
{$ENDIF}
end;

procedure TcxCustomEdit.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FRepositoryItem) then
    RepositoryItem := nil;
end;

procedure TcxCustomEdit.Paint;
begin
{$IFNDEF VCL}
  Canvas.Canvas.Start;
  try
{$ENDIF}
    ViewInfo.Paint(Canvas);
{$IFNDEF VCL}
  finally
    Canvas.Canvas.Stop;
  end;
{$ENDIF}
end;

procedure TcxCustomEdit.ReadState(Reader: TReader);
begin
  TcxCustomEditProperties(FProperties).OnPropertiesChanged := nil;
  inherited ReadState(Reader);
end;

function TcxCustomEdit.RefreshContainer(const P: TPoint; Button: TcxMouseButton; Shift: TShiftState;
  AIsMouseEvent: Boolean): Boolean;
var
  AViewInfo: TcxCustomEditViewInfo;
  R: TRect;
  PR: PRect;
  AViewInfoChanged: Boolean;
begin
  Result := False;
  if not HandleAllocated or (csDestroyingHandle in ControlState) or IsDestroying then
    Exit;

  if (FCaptureButtonVisibleIndex <> -1) and (GetCaptureControl <> Self) then
    FCaptureButtonVisibleIndex := -1;

  if AIsMouseEvent then
  begin
    AViewInfo := TcxCustomEditViewInfo(TcxCustomEditProperties(FProperties).GetViewInfoClass.Create);
    AViewInfo.Assign(ViewInfo);
  end
  else
    AViewInfo := nil;

  CalculateViewInfo(P, Button, Shift, AIsMouseEvent);

  if HasInnerEdit and IsEditClass then
  begin
    R := InnerEdit.Control.BoundsRect;
    PR := @R;
  end
  else
    PR := nil;
  AViewInfoChanged := ViewInfo.Repaint(Self, AViewInfo, PR);
  if (AViewInfo <> nil) and not AViewInfoChanged then
  begin
    FreeAndNil(AViewInfo);
    Exit;
  end;

  SetSize;

  if HandleAllocated then
  begin
    FSettingEditWindowRegion := True;
    SetEditWindowShadowRegion(ViewInfo, Handle);
    FSettingEditWindowRegion := False;
  end;

  if AViewInfo <> nil then
  begin
    if AViewInfoChanged then
      ProcessViewInfoChanges(AViewInfo, Button <> cxmbNone);
    FreeAndNil(AViewInfo);
  end;

  Result := True;
end;

procedure TcxCustomEdit.SetName(const Value: TComponentName);
begin
  inherited;
end;

procedure TcxCustomEdit.SetSize;
var
  AClientExtent: TRect;
  AEditSizeProperties: TcxEditSizeProperties;
  AViewData: TcxCustomEditViewData;
  ASize: TSize;
begin
  if not HandleAllocated then
    Exit;

  AViewData := TcxCustomEditViewData(CreateViewData);
  try
    AClientExtent := AViewData.GetClientExtent(ViewInfo);
    FillSizeProperties(AEditSizeProperties);
    ASize := AViewData.GetEditSize(Canvas, EditValue, AEditSizeProperties);
  finally
    FreeAndNil(AViewData);
  end;

  if AutoSize and CanAutoSize then
  begin
    if not CanAutoWidth then
      ASize.cx := Width;
    SetBounds(Left, Top, ASize.cx, ASize.cy);
  end;

  if InnerEdit <> nil then
    AdjustInnerEditPosition(ASize.cy - AClientExtent.Top - AClientExtent.Bottom);
end;

function TcxCustomEdit.TabsNeeded: Boolean;
begin
  Result := True;
end;

{$IFDEF VCL}
procedure TcxCustomEdit.CreateHandle;
begin
  inherited CreateHandle;
  if HasInnerEdit and inherited Focused then
    InnerEdit.SafelySetFocus;
end;

procedure TcxCustomEdit.WndProc(var Message: TMessage);
begin
  case Message.Msg of
    WM_NCCALCSIZE:
      if FSettingEditWindowRegion then
      begin
        Message.Result := 0;
        Exit;
      end;
  end;
  inherited WndProc(Message);
end;
{$ELSE}
procedure TcxCustomEdit.ChangeBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  if CanResize(AWidth, AHeight) then
    inherited ChangeBounds(ALeft, ATop, AWidth, AHeight);
end;

procedure TcxCustomEdit.CreateWidget;
begin
  inherited CreateWidget;
  SetSize;
end;

function TcxCustomEdit.EventFilter(Sender: QObjectH; Event: QEventH): Boolean;
begin
  if QEvent_type(Event) = QEventType_Show then
  begin
    Result := inherited EventFilter(Sender, Event);
    SetEditWindowShadowRegion(ViewInfo, Handle);
  end
  else
    Result := inherited EventFilter(Sender, Event);
end;

procedure TcxCustomEdit.InitWidget;
var
  R: TRect;
begin
  inherited InitWidget;
  if HasInnerEdit then
  begin
    R := ViewInfo.ClientRect;
    AlignControls(InnerEdit.Control, R);
    QWidget_setFocusProxy(Handle, InnerEdit.Control.Handle);
  end;
end;
{$ENDIF}

procedure TcxCustomEdit.AdjustInnerEditPosition;
var
  R: TRect;
begin
  if not HasInnerEdit then
    Exit;
  R := ViewInfo.ClientRect;
  with R do
    InnerEdit.Control.SetBounds(Left, Top, Right - Left, Bottom - Top);
  AlignControls(InnerEdit.Control, R);
end;

procedure TcxCustomEdit.AfterPosting;
begin
  FIsPosting := False;
end;

function TcxCustomEdit.AreChangeEventsLocked: Boolean;
begin
  Result := FChangeEventsLockCount > 0;
end;

procedure TcxCustomEdit.BeforePosting;
begin
  FIsPosting := True;
end;

function TcxCustomEdit.ButtonVisibleIndexAt(const P: TPoint): Integer;
var
  I: Integer;
begin
  Result := -1;
  with ViewInfo do
    for I := 0 to Length(ButtonsInfo) - 1 do
      if PtInRect(ButtonsInfo[I].Bounds, P) then
      begin
        Result := I;
        Break;
      end;
end;

procedure TcxCustomEdit.CalculateViewInfo(AIsMouseEvent: Boolean);
var
  P: TPoint;
begin
  P := ScreenToClient(InternalGetCursorPos);
  CalculateViewInfo(P, cxmbNone, InternalGetShiftState, False);
end;

procedure TcxCustomEdit.CalculateViewInfo(P: TPoint; Button: TcxMouseButton; Shift: TShiftState; AIsMouseEvent: Boolean);
var
  AViewData: TcxCustomEditViewData;
begin
  AViewData := TcxCustomEditViewData(CreateViewData);
  try
    InitializeViewData(AViewData);
    AViewData.Calculate(Canvas, GetControlRect(Self), P, Button, Shift, ViewInfo,
    AIsMouseEvent);
  finally
    FreeAndNil(AViewData);
  end;
end;

function TcxCustomEdit.CanAutoSize: Boolean;
begin
  Result := True;
end;

function TcxCustomEdit.CanAutoWidth: Boolean;
begin
  Result := False;
end;

function TcxCustomEdit.CanKeyDownModifyEdit(Key: Word; Shift: TShiftState): Boolean;
begin
  Result := False;
end;

function TcxCustomEdit.CanKeyPressModifyEdit(Key: Char): Boolean;
begin
  Result := False;
end;

function TcxCustomEdit.CanModify: Boolean;
begin
  if IsInplace then
    Result := Properties.CanModify
  else
    with Properties do
    begin
      Result := FAssignedValues.ReadOnly and not FReadOnly;
      if not Result then
      begin
        Result := not FAssignedValues.ReadOnly or not FReadOnly;
        Result := Result and DataBinding.IDefaultValuesProvider.DefaultCanModify and
          DataBinding.CanSetEditMode;
      end;
    end;
end;

procedure TcxCustomEdit.ChangeHandler(Sender: TObject);
begin
  if Focused then
    ModifiedAfterEnter := True;
  DoChange;
end;

function TcxCustomEdit.CreateInnerEdit: IcxCustomInnerEdit;
var
  AInnerEditClass: TControlClass;
begin
  AInnerEditClass := GetInnerEditClass;
  if AInnerEditClass <> nil then
    AInnerEditClass.Create(Self).GetInterface(IcxCustomInnerEdit, Result)
  else
    Result := nil;
end;

function TcxCustomEdit.CreateViewData: TcxCustomEditViewData;
begin
  Result := Properties.CreateViewData(Style, IsInplace);
  if PropertiesChangeLocked then
    Result.Edit := nil
  else
    Result.Edit := Self;
{$IFDEF VCL}
  if HandleAllocated then
    Result.WindowHandle := Handle
  else
    Result.WindowHandle := 0;
{$ENDIF}
end;

procedure TcxCustomEdit.DefaultButtonClick;
var
  AButtonIndex, I: Integer;
begin
  AButtonIndex := -1;
  with ViewInfo do
    for I := 0 to Length(ButtonsInfo) - 1 do
      if ButtonsInfo[I].Data.Default then
      begin
        AButtonIndex := I;
        Break;
      end;
  if AButtonIndex <> -1 then
    DoButtonClick(AButtonIndex);
end;

procedure TcxCustomEdit.DisableValidate;
begin
  Inc(FLockValidate);
end;

procedure TcxCustomEdit.DoAfterKeyDown(var Key: Word; Shift: TShiftState);
begin
  if Assigned(FOnAfterKeyDown) then
    FOnAfterKeyDown(Self, Key, Shift);
end;

procedure TcxCustomEdit.DoButtonClick(AButtonVisibleIndex: Integer);
begin
  with Properties do
    if Assigned(FOnButtonClick) then
      FOnButtonClick(Self, ViewInfo.ButtonsInfo[AButtonVisibleIndex].Index);
end;

procedure TcxCustomEdit.DoButtonDown(AButtonVisibleIndex: Integer);
begin
end;

procedure TcxCustomEdit.DoButtonUp(AButtonVisibleIndex: Integer);
begin
end;

procedure TcxCustomEdit.DoChange;
begin
  if IsLoading or IsDestroying then
    Exit;
  with Properties do
  begin
    if Assigned(FOnChange) then
      if AreChangeEventsLocked then
        FChangeEventsCatcher.OnChangeEvent := True
      else
        FOnChange(Self);
    if not HasDisplayValue and not CompareEditValue then
      DoEditValueChanged;
  end;
end;

function TcxCustomEdit.DoEditing: Boolean;
begin
  Result := InternalDoEditing;
  if not Result then
    Exit;

  if DataBinding.Modified then
  begin
    Result := True;
    Exit;
  end;

  FEditValueChangingLocked := True;
  try
    Result := CanModify;
    if Result and Assigned(FOnEditing) then
      FOnEditing(Self, Result);
    if Result and not IsInplace then
      Result := DataBinding.SetEditMode;
  finally
    FEditValueChangingLocked := False;
  end;
end;

procedure TcxCustomEdit.DoEditValueChanged;
begin
  if IsLoading or IsDestroying then
    Exit;
  with Properties do
    if Assigned(FOnEditValueChanged) then
      if AreChangeEventsLocked then
        FChangeEventsCatcher.OnEditValueChangedEvent := True
      else
        FOnEditValueChanged(Self);
end;

procedure TcxCustomEdit.DoEditKeyDown(var Key: Word; Shift: TShiftState);

{$IFDEF WIN32}
  procedure KillMessage(Wnd: HWnd; Msg: Integer);
  var
    M: TMsg;
  begin
    M.Message := 0;
    if PeekMessage(M, Wnd, Msg, Msg, PM_REMOVE) and (M.Message = WM_QUIT) then
      PostQuitMessage(M.Wparam);
  end;
{$ENDIF}

var
  AShortCut: TShortCut;
begin
  if Key = 0 then
    Exit;
  AShortCut := ShortCut(Key, Shift);

  if AShortCut = Properties.ClearKey then
  begin
    KeyboardAction := True;
    try
      EditValue := Null;
    finally
      KeyboardAction := False;
    end;
    Key := 0;
  end;

  if (Length(ViewInfo.ButtonsInfo) > 0) and (AShortCut = Properties.ClickKey) then
  begin
{$IFDEF WIN32}
    KillMessage(NativeHandle(Handle), WM_CHAR);
{$ENDIF}
    DefaultButtonClick;
    Key := 0;
  end;
  if Key = 0 then
    Exit;

  if not ValidateKeyDown(Key, Shift) then
  begin
    DoAfterKeyDown(Key, Shift);
    Key := 0;
    Exit;
  end;

  case Key of
    VK_ESCAPE:
      begin
        if FModified then
        begin
          ResetEditValue;
          Key := 0;
        end;
      end;
    VK_TAB{$IFNDEF VCL}, Key_Backtab{$ENDIF}:
      if Focused and (Shift * [ssAlt, ssCtrl] = []) and not Properties.TabsNeed then
      begin
        DoAfterKeyDown(Key, Shift);
        if Key = 0 then
          Exit;

        Key := 0;
        if IsInplace or not HasPopupWindow then
        begin
          TWinControlAccess(GetParentForm(Self)).SelectNext(GetParentForm(Self).ActiveControl,
            not(ssShift in Shift), True);
          if HandleAllocated and HasInnerEdit then
{$IFDEF VCL}
            if GetFocus = Handle then
{$ELSE}
            if QApplication_focusWidget(Application.Handle) = ChildHandle then
{$ENDIF}
              InnerEdit.SafelySetFocus;
        end;
      end;
    VK_RETURN{$IFNDEF VCL}, Key_Enter{$ENDIF}:
      if Properties.ValidateOnEnter then
      begin
        Key := 0;
        LockChangeEvents(True);
        try
          if ValidateEdit(True) and AutoPostEditValue then
            PostEditValue;
        finally
          LockChangeEvents(False);
        end;
      end;
  end;

  if not Properties.WantNavigationKeys then
    case Key of
      VK_LEFT, VK_RIGHT, VK_UP, VK_DOWN, VK_HOME, VK_END, VK_PRIOR, VK_NEXT:
        begin
          DoAfterKeyDown(Key, Shift);
          Key := 0;
        end;
    end;
end;

procedure TcxCustomEdit.DoEditKeyPress(var Key: Char);
begin
  ValidateKeyPress(Key);
end;

procedure TcxCustomEdit.DoEditKeyUp(var Key: Word; Shift: TShiftState);
begin
end;

procedure TcxCustomEdit.DoHideEdit(AExit: Boolean);
begin
  if IsDestroying or FValidateErrorProcessing then
    Exit;
  SaveModified;
  try
    if FModifiedAfterEnter then
    begin
      LockChangeEvents(True);
      try
        if not ValidateEdit(True) then
          Exit;
        if not IsInplace and AutoPostEditValue then
          PostEditValue;
      finally
        LockChangeEvents(False);
      end;
    end;
    DataBinding.UpdateDisplayValue;
    UpdateDrawValue;
    ShortRefreshContainer(False);
    RestoreModified;
    try
      if AExit then
        inherited DoExit;
    finally
      ModifiedAfterEnter := False;
      SaveModified;
    end;
  finally
    RestoreModified;
  end;
end;

procedure TcxCustomEdit.DoPostEditValue;
begin
  if Assigned(FOnPostEditValue) then
    FOnPostEditValue(Self);
end;

procedure TcxCustomEdit.EnableValidate;
begin
  Dec(FLockValidate);
end;

procedure TcxCustomEdit.FillSizeProperties(var AEditSizeProperties: TcxEditSizeProperties);
begin
  with AEditSizeProperties do
  begin
    MaxLineCount := 1;
    Width := Self.Width;
  end;
end;

function TcxCustomEdit.GetAutoPostEditValue: Boolean;
begin
  Result := DataBinding.Modified and not IsDesigning;
end;

class function TcxCustomEdit.GetDataBindingClass: TcxEditDataBindingClass;
begin
  Result := TcxEditDataBinding;
end;

function TcxCustomEdit.GetDisplayValue: TCaption;
begin
  Result := '';
end;

function TcxCustomEdit.GetEditDataClass: TcxCustomEditDataClass;
begin
  Result := nil;
end;

function TcxCustomEdit.GetInnerEditClass: TControlClass;
begin
  Result := nil;
end;

function TcxCustomEdit.HandleMouseWheel(Shift: TShiftState): Boolean;
begin
  Result := not IsInplace or Properties.UseMouseWheel or ([ssCtrl] * Shift <> []);
end;

procedure TcxCustomEdit.HandleValidationError(const ErrorText: TCaption);
var
  AControl: TWinControl;
begin
  if not Focused and Visible then
  begin
    if HasInnerEdit then
      AControl := InnerEdit.Control
    else
      AControl := Self;
    FValidateErrorProcessing := True;
    try
      AControl.SetFocus;
      SelectAll;
    finally
      FValidateErrorProcessing := False;
    end;
  end;
  if Properties.BeepOnError then
    Beep;
  if ErrorText <> '' then
    raise Exception.Create(ErrorText);
end;

function TcxCustomEdit.HasInnerEdit: Boolean;
begin
  Result := Assigned(InnerEdit);
end;

procedure TcxCustomEdit.InitializeEditData;
begin
end;

procedure TcxCustomEdit.InitializeInnerEdit;
begin
  InnerEdit.Parent := Self;
  InnerEdit.OnChange := ChangeHandler;
end;

procedure TcxCustomEdit.InitializeViewData(AViewData: TcxCustomEditViewData);
begin
  AViewData.Enabled := Enabled;
  AViewData.Focused := Focused;
  if HScrollBarVisible then
    AViewData.HScrollBar := HScrollBar
  else
    AViewData.HScrollBar := nil;
  AViewData.InnerEdit := InnerEdit;
  AViewData.IsDesigning := IsDesigning;
  if VScrollBarVisible then
    AViewData.VScrollBar := VScrollBar
  else
    AViewData.VScrollBar := nil;
end;

function TcxCustomEdit.InternalDoEditing: Boolean;
begin
  Result := True;
end;

function TcxCustomEdit.InternalGetPopupMenu: TPopupMenu;
begin
  Result := nil;
end;

function TcxCustomEdit.InternalFocused: Boolean;
begin
  Result := Focused;
end;

procedure TcxCustomEdit.LockChangeEvents(ALock: Boolean; AInvokeChangedOnUnlock: Boolean = True);
begin
  if ALock then
  begin
    if FChangeEventsLockCount = 0 then
      with FChangeEventsCatcher do
      begin
        OnChangeEvent := False;
        OnEditValueChangedEvent := False;
      end;
    Inc(FChangeEventsLockCount);
  end
  else
    if FChangeEventsLockCount > 0 then
    begin
      Dec(FChangeEventsLockCount);
      if AInvokeChangedOnUnlock and (FChangeEventsLockCount = 0) and not(IsLoading or IsDestroying) then
        with Properties do
        begin
          if FChangeEventsCatcher.OnChangeEvent and Assigned(FOnChange) then
            FOnChange(Self);
          if FChangeEventsCatcher.OnEditValueChangedEvent and Assigned(FOnEditValueChanged) then
            FOnEditValueChanged(Self);
        end;
    end;
end;

function TcxCustomEdit.InternalGetProperties: TcxCustomEditProperties;
begin
  if (FRepositoryItem = nil) or (ComponentState * [csReading, csWriting] <> []) then
    Result := TcxCustomEditProperties(FProperties)
  else
    Result := FRepositoryItem.Properties;
end;

procedure TcxCustomEdit.InternalSetDisplayValue(const Value: TcxEditValue);
begin
end;

procedure TcxCustomEdit.InternalSetEditValue(const Value: TcxEditValue;
  AValidateEditValue: Boolean);
var
  AEditValueChanged: Boolean;
begin
  if FKeyboardAction and not DoEditing then
    Exit;
  AEditValueChanged := False;
  if Properties.CompareEditValue then
    AEditValueChanged := (VarType(FEditValue) <> VarType(Value)) or
      not VarEqualsExact(FEditValue, Value);
  FEditValue := Value;
  SynchronizeDisplayValue;
  if FKeyboardAction then
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

procedure TcxCustomEdit.InternalValidateDisplayValue(const ADisplayValue: TcxEditValue);
begin
  SaveModified;
  InternalSetDisplayValue(ADisplayValue);
  RestoreModified;
end;

function TcxCustomEdit.IsActiveControl: Boolean;
var
  AParentForm: TCustomForm;
begin
  Result := Focused;
  if Result then
    Exit;
  AParentForm := GetParentForm(Self);
  if AParentForm <> nil then
  begin
    Result := AParentForm.ActiveControl = Self;
    Result := Result or HasInnerEdit and (AParentForm.ActiveControl = InnerEdit.Control);
  end;
end;

function TcxCustomEdit.IsClickEnabledDuringLoading: Boolean;
begin
  Result := False;
end;

function TcxCustomEdit.IsEditClass: Boolean;
begin
  Result := False;
end;

function TcxCustomEdit.IsEditorKey(Key: Word; Shift: TShiftState): Boolean;
begin
  Result := (Length(ViewInfo.ButtonsInfo) > 0) and
    (ShortCut(Key, Shift) = Properties.ClickKey);
end;

function TcxCustomEdit.IsEditValueStored: Boolean;
begin
  Result := not VarIsNull(EditValue);
end;

function TcxCustomEdit.IsRepositoryItemAcceptable(ARepositoryItem: TcxEditRepositoryItem): Boolean;
begin
  Result := (ARepositoryItem = nil) or ARepositoryItem.Properties.InheritsFrom(GetPropertiesClass);
end;

function TcxCustomEdit.IsValidChar(AChar: Char): Boolean;
begin
  with Properties do
    if IDefaultValuesProvider <> nil then
      Result := IDefaultValuesProvider.IsValidChar(AChar)
    else
      Result := True;
end;

procedure TcxCustomEdit.PrepareDisplayValue(const AEditValue: TcxEditValue;
  var DisplayValue: TcxEditValue; AEditFocused: Boolean);
begin
  Properties.PrepareDisplayValue(AEditValue, DisplayValue, AEditFocused);
end;

procedure TcxCustomEdit.PostEditValue;
begin
  try
    BeforePosting;
    try
      if IsInplace then
      begin
        DoPostEditValue;
        EditModified := False;
      end
      else
        DataBinding.StoredValue := EditValue;
    finally
      AfterPosting;
    end;
  except
    if not IsInplace then
    begin
      HandleValidationError('');
      raise;
    end;
  end;
end;

procedure TcxCustomEdit.ProcessViewInfoChanges(APrevViewInfo: TcxCustomEditViewInfo; AIsMouseDownUpEvent: Boolean);
begin
  if (APrevViewInfo.PressedButton <> ViewInfo.PressedButton) or
    (APrevViewInfo.SelectedButton <> ViewInfo.SelectedButton) then
  begin
    if APrevViewInfo.PressedButton <> -1 then
      if APrevViewInfo.PressedButton = ViewInfo.SelectedButton then
      begin
        DoButtonUp(APrevViewInfo.PressedButton);
        DoButtonClick(APrevViewInfo.PressedButton);
      end
      else
        DoButtonUp(APrevViewInfo.PressedButton);
    if (ViewInfo.PressedButton <> -1) and (APrevViewInfo.PressedButton = -1) then
      DoButtonDown(ViewInfo.PressedButton);
  end;
end;

procedure TcxCustomEdit.PropertiesChanged(Sender: TObject);
begin
  FIsEditValidated := False;
  if not PropertiesChangeLocked and (InnerEdit <> nil) then
    InnerEdit.ReadOnly := Properties.ReadOnly;
  ShortRefreshContainer(False);
end;

function TcxCustomEdit.PropertiesChangeLocked: Boolean;
begin
  Result := not IsDestroying;
  if Result then
    Result := (GetInnerEditClass = nil) or (InnerEdit <> nil);
  Result := not Result;
end;

procedure TcxCustomEdit.RepositoryItemAssigned;
begin
end;

procedure TcxCustomEdit.RepositoryItemAssigning;
begin
end;

procedure TcxCustomEdit.ResetEditValue;
begin
  if FModifiedAfterEnter and Properties.IsResetEditClass then
  begin
    LockChangeEvents(True);
    try
      FModifiedAfterEnter := False;
      EditValue := FPrevEditValue;
      EditModified := True;
      SelectAll;
      if Properties.ImmediatePost and AutoPostEditValue then
        PostEditValue;
    finally
      LockChangeEvents(False);
    end;
  end;
end;

procedure TcxCustomEdit.RestoreModified;
var
  APModifiedState: ^TcxEditModifiedState;
begin
  APModifiedState := FPrevModifiedList[FPrevModifiedList.Count - 1];
  with APModifiedState^ do
  begin
    FModified := Modified;
    FModifiedAfterEnter := ModifiedAfterEnter;
  end;
  FPrevModifiedList.Delete(FPrevModifiedList.Count - 1);
  Dispose(APModifiedState);
end;

procedure TcxCustomEdit.SaveModified;
var
  APModifiedState: ^TcxEditModifiedState;
begin
  New(APModifiedState);
  FPrevModifiedList.Add(APModifiedState);
  with APModifiedState^ do
  begin
    Modified := FModified;
    ModifiedAfterEnter := FModifiedAfterEnter;
  end;
end;

function TcxCustomEdit.SendActivationKey(Key: Char): Boolean;
begin
  Result := True;
end;

function TcxCustomEdit.SetDisplayText(const Value: TCaption): Boolean;
begin
  Result := False;
end;

procedure TcxCustomEdit.SetEditValue(const Value: TcxEditValue);
begin
  if FEditValueChangingLocked then
    Exit;
  if not(FKeyboardAction and not DoEditing) then
    InternalSetEditValue(Value, True);
end;

procedure TcxCustomEdit.SetInternalDisplayValue(Value: TcxEditValue);
begin
end;

function TcxCustomEdit.ShortRefreshContainer(AIsMouseEvent: Boolean): Boolean;
var
  P1, P2: TPoint;
begin
  Result := False;
  if not HandleAllocated or IsDestroying then Exit;
  P1 := InternalGetCursorPos;
  P2 := ScreenToClient(P1);
  Result := RefreshContainer(P2, cxmbNone, InternalGetShiftState, AIsMouseEvent);
end;

procedure TcxCustomEdit.SynchronizeDisplayValue;
begin
end;

procedure TcxCustomEdit.SynchronizeEditValue;
begin
end;

procedure TcxCustomEdit.UpdateDrawValue;
begin
end;

function TcxCustomEdit.ValidateKeyDown(var Key: Word; Shift: TShiftState): Boolean;
begin
  Result := not(not DataBinding.Modified and CanKeyDownModifyEdit(Key, Shift) and
    not DoEditing);
end;

function TcxCustomEdit.ValidateKeyPress(var Key: Char): Boolean;
begin
  if (Key in [#32..#255]) and not IsValidChar(Key) then
    Key := #0
  else
    if not DataBinding.Modified and CanKeyPressModifyEdit(Key) then
      if not DoEditing then
        Key := #0
      else
        Key := Key;
  Result := Key <> #0;
end;

{$IFDEF VCL}
procedure TcxCustomEdit.LockedInnerEditWindowProc(var Message: TMessage);
begin
  with Message do
    Result := CallWindowProc(FInnerEditDefWindowProc, Handle, Msg, WParam, LParam);
end;

procedure TcxCustomEdit.LockInnerEditRepainting;
begin
  if not HasInnerEdit then
    Exit;
  {$IFDEF DELPHI6}
  FObjectInstance := Classes.MakeObjectInstance(LockedInnerEditWindowProc);
  {$ELSE}
  FObjectInstance := Forms.MakeObjectInstance(LockedInnerEditWindowProc);
  {$ENDIF}
  FInnerEditDefWindowProc := Pointer(GetWindowLong(InnerEdit.Control.Handle, GWL_WNDPROC));
  SetWindowLong(InnerEdit.Control.Handle, GWL_WNDPROC, Integer(FObjectInstance));
end;

procedure TcxCustomEdit.ThemeChanged;
begin
  ResetSolidBrushCache;
  inherited ThemeChanged;
end;

procedure TcxCustomEdit.UnlockInnerEditRepainting;
begin
  if not HasInnerEdit then
    Exit;
  SetWindowLong(InnerEdit.Control.Handle, GWL_WNDPROC, Integer(FInnerEditDefWindowProc));
  {$IFDEF DELPHI6}
  Classes.FreeObjectInstance(FObjectInstance);
  {$ELSE}
  Forms.FreeObjectInstance(FObjectInstance);
  {$ENDIF}
end;
{$ENDIF}

function TcxCustomEdit.GetEditValue: TcxEditValue;
begin
  Result := FEditValue;
end;

procedure TcxCustomEdit.DblClickTimerHandler(Sender: TObject);
begin
  FDblClickTimer.Enabled := False;
end;

procedure TcxCustomEdit.DoClearEditData(AEditData: TcxCustomEditData);
begin
  if (FEditData = AEditData) and (FEditData <> nil) and FEditData.Cleared then
  begin
    InitializeEditData;
    FEditData.Cleared := False;
  end;
end;

function TcxCustomEdit.GetProperties: TcxCustomEditProperties;
begin
  Result := TcxCustomEditProperties(InternalGetProperties);
end;

function TcxCustomEdit.GetStyle: TcxCustomEditStyle;
begin
  Result := TcxCustomEditStyle(FStyle);
end;

function TcxCustomEdit.GetViewInfo: TcxCustomEditViewInfo;
begin
  Result := TcxCustomEditViewInfo(FViewInfo);
end;

function TcxCustomEdit.IsPropertiesStored: Boolean;
begin
  Result := True;
end;

procedure TcxCustomEdit.SetDataBinding(Value: TcxEditDataBinding);
begin
  FDataBinding.Assign(Value.GetEditDataBindingInstance);
end;

procedure TcxCustomEdit.SetEditAutoSize(Value: Boolean);
begin
  if (Value <> FAutoSize) and not IsInplace then
  begin
    FAutoSize := Value;
    if Value then
    begin
      SetSize;
      ShortRefreshContainer(False);
    end;
  end;
end;

procedure TcxCustomEdit.SetModified(Value: Boolean);
begin
  FModified := Value;
  if not Value then
    FModifiedAfterEnter := False;
end;

procedure TcxCustomEdit.SetModifiedAfterEnter(Value: Boolean);
begin
  FModifiedAfterEnter := Value;
  if Value then
  begin
    FIsEditValidated := False;
    FModified := True;
  end;
end;

procedure TcxCustomEdit.SetProperties(Value: TcxCustomEditProperties);
begin
  if RepositoryItem = nil then
    FProperties.Assign(Value);
end;

procedure TcxCustomEdit.SetRepositoryItem(Value: TcxEditRepositoryItem);
begin
  if Value = FRepositoryItem then
    Exit;
  if not IsRepositoryItemAcceptable(Value) then
    raise Exception.Create(cxGetResourceString(@cxSEditInvalidRepositoryItem));
  RepositoryItemAssigning;
  if FRepositoryItem <> nil then
    FRepositoryItem.RemoveListener(Self);

  FRepositoryItem := Value;
  if FRepositoryItem <> nil then
    FRepositoryItem.AddListener(Self);
  if FRepositoryItem = nil then
  begin
    if ComponentState * [csLoading, csDestroying] = [] then
      Properties.OnPropertiesChanged := PropertiesChanged;
    Properties.IDefaultValuesProvider := DataBinding.IDefaultValuesProvider;
  end
  else
  begin
    FEditRepositoryItemListenerHelper.PropertiesChanged(FRepositoryItem);
    TcxCustomEditProperties(FProperties).OnPropertiesChanged := nil;
  end;
  RepositoryItemAssigned;
end;

procedure TcxCustomEdit.SetStyle(Value: TcxCustomEditStyle);
begin
  FStyle.Assign(Value);
end;

{$IFDEF VCL}
procedure TcxCustomEdit.WMCopy(var Message: TMessage);
begin
  CopyToClipboard;
end;

procedure TcxCustomEdit.WMCut(var Message);
begin
  KeyboardAction := True;
  try
    if not Properties.ReadOnly then
      CutToClipboard
    else
      CopyToClipboard;
  finally
    KeyboardAction := False;
  end;
end;

procedure TcxCustomEdit.WMPaste(var Message: TMessage);
begin
  if not Properties.ReadOnly then
  begin
    KeyboardAction := True;
    try
      PasteFromClipboard;
    finally
      KeyboardAction := False;
    end;
  end;
end;

procedure TcxCustomEdit.CMEditValidationError(var Message: TMessage);
var
  AErrorTextLength: Integer;
  AErrorText: string;
  APBuf: Pointer;
begin
  APBuf := Pointer(Message.WParam);
  AErrorTextLength := PInteger(APBuf)^;
  SetLength(AErrorText, AErrorTextLength);
  Move(Pointer(Integer(APBuf) + SizeOf(Integer))^, AErrorText[1],
    AErrorTextLength * SizeOf(AErrorText[1]));
  FreeMem(APBuf);
  raise Exception.Create(AErrorText);
end;

procedure TcxCustomEdit.CMShowingChanged(var Message: TMessage);
begin
  inherited;
  if Showing then
    SetSize;
end;

procedure TcxCustomEdit.CMSysColorChange(var Message: TMessage);
begin
  inherited;
  ResetSolidBrushCache;
end;
{$ENDIF}

{ TcxEditAlignment }

constructor TcxEditAlignment.Create(AOwner: TPersistent);
begin
  inherited Create;
  FOwner := AOwner;
  FHorz := cxEditDefaultHorzAlignment;
  FVert := DefaultVertAlignment;
end;

procedure TcxEditAlignment.Assign(Source: TPersistent);
begin
  if Source is TcxEditAlignment then
    with Source as TcxEditAlignment do
    begin
      Self.FVert := FVert;
      Self.FHorz := FHorz;
      Self.FIsHorzAssigned := FIsHorzAssigned;
      Self.DoChanged;
    end
  else
    inherited Assign(Source);
end;

function TcxEditAlignment.IsHorzStored: Boolean;
begin
  Result := FIsHorzAssigned;
end;

function TcxEditAlignment.IsVertStored: Boolean;
begin
  Result := Vert <> DefaultVertAlignment;
end;

procedure TcxEditAlignment.Reset;
begin
  FIsHorzAssigned := False;
  DoChanged;
end;

function TcxEditAlignment.DefaultVertAlignment: TcxEditVertAlignment;
begin
  Result := cxEditDefaultVertAlignment;
end;

procedure TcxEditAlignment.DoChanged;
begin
  if Assigned(FOnChanged) then
    FOnChanged(Self);
end;

function TcxEditAlignment.GetOwner: TPersistent;
begin
  Result := Properties;
end;

function TcxEditAlignment.GetProperties: TcxCustomEditProperties;
begin
  Result := TcxCustomEditProperties(FOwner);
end;

procedure TcxEditAlignment.SetHorz(const Value: TcxEditHorzAlignment);
begin
  FIsHorzAssigned := True;
  FHorz := Value;
  DoChanged;
end;

procedure TcxEditAlignment.SetVert(const Value: TcxEditVertAlignment);
begin
  if Value <> FVert then
  begin
    FVert := Value;
    DoChanged;
  end;
end;

{ TcxInplaceEditList }

constructor TcxInplaceEditList.Create;
begin
  inherited Create;
  FItems := TList.Create;
end;

destructor TcxInplaceEditList.Destroy;
begin
  DestroyItems;
  FItems.Free;
  inherited;
end;

function TcxInplaceEditList.GetCount: Integer;
begin
  Result := FItems.Count;
end;

function TcxInplaceEditList.GetItem(Index: Integer): PcxEditListItem;
begin
  Result := PcxEditListItem(FItems[Index]);
end;

procedure TcxInplaceEditList.DestroyItems;
var
  I: Integer;
begin
  for I := Count - 1 downto 0 do
    RemoveItem(Items[I]);
end;

function TcxInplaceEditList.CreateEdit(AProperties: TcxCustomEditProperties): TcxCustomEdit;
begin
  Result := TcxCustomEditClass(AProperties.GetContainerClass).Create(nil, True);
  Result.Visible := False;
end;

function TcxInplaceEditList.FindEdit(AProperties: TcxCustomEditProperties): TcxCustomEdit;
var
  AItem: PcxEditListItem;
begin
  AItem := FindItem(AProperties);
  if AItem = nil then
    Result := nil
  else
    Result := AItem.Edit;
end;

function TcxInplaceEditList.FindItem(AProperties: TcxCustomEditProperties): PcxEditListItem;
var
  I: Integer;
begin
  for I := 0 to Count - 1 do
  begin
    Result := Items[I];
    if Result.Properties = AProperties then Exit;
  end;
  Result := nil;
end;

procedure TcxInplaceEditList.RemoveItem(AItem: PcxEditListItem);
begin
  if AItem <> nil then
  begin
    FItems.Remove(AItem);
    AItem.Edit.Free;
    Dispose(AItem);
  end;
end;

function TcxInplaceEditList.GetEdit(AProperties: TcxCustomEditProperties): TcxCustomEdit;
var
  AItem: PcxEditListItem;
begin
  Result := FindEdit(AProperties);
  if Result = nil then
  begin
    Result := CreateEdit(AProperties);
    New(AItem);
    with AItem^ do
    begin
      Edit := Result;
      Properties := AProperties;
    end;
    FItems.Add(AItem);
  end;
  Result.Properties := AProperties;
end;

function TcxInplaceEditList.GetEdit(APropertiesClass: TcxCustomEditPropertiesClass): TcxCustomEdit;
var
  I: Integer;
  AItem: PcxEditListItem;
begin
  Result := nil;
  for I := 0 to Count - 1 do
    if Items[I].Edit.Properties.ClassType = APropertiesClass then
    begin
      Result := Items[I].Edit;
      Break;
    end;
  if Result = nil then
  begin
    Result := TcxCustomEditClass(APropertiesClass.GetContainerClass).Create(nil, True);
    New(AItem);
    with AItem^ do
    begin
      Edit := Result;
      Properties := Edit.Properties;
    end;
    FItems.Add(AItem);
  end;
end;

procedure TcxInplaceEditList.RemoveItem(AProperties: TcxCustomEditProperties);
begin
  RemoveItem(FindItem(AProperties));
end;

initialization
  FCreatedEditPropertiesList := TList.Create;
  cxFilterConsts.cxFilterGetResourceStringFunc := cxGetResourceString;

finalization
  FreeAndNil(FRegisteredEditProperties);
  FreeAndNil(FDefaultEditRepository);
  FreeAndNil(FCreatedEditPropertiesList);

end.

